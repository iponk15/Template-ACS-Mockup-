<?php

namespace Brick\Money;

use Brick\Money\Exception\MoneyMismatchException;

use Brick\Math\BigNumber;
use Brick\Math\BigRational;
use Brick\Math\Exception\ArithmeticException;
use Brick\Math\Exception\RoundingNecessaryException;
use Brick\Math\RoundingMode;

/**
 * An exact monetary amount, represented as a rational number. This class is immutable.
 *
 * This is used to represent intermediate calculation results, and may not be exactly convertible to a decimal amount
 * with a finite number of digits. The final conversion to a Money may require rounding.
 */
final class RationalMoney extends AbstractMoney
{
    /**
     * @var BigRational
     */
    private $amount;

    /**
     * @var Currency
     */
    private $currency;

    /**
     * Class constructor.
     *
     * @param BigRational $amount   The amount.
     * @param Currency    $currency The currency.
     */
    public function __construct(BigRational $amount, Currency $currency)
    {
        $this->amount   = $amount;
        $this->currency = $currency;
    }

    /**
     * Convenience factory method.
     *
     * @param BigNumber|number|string $amount   The monetary amount.
     * @param Currency|string         $currency The Currency instance, ISO currency code or ISO numeric currency code.
     *
     * @return RationalMoney
     */
    public static function of($amount, $currency)
    {
        $amount = BigRational::of($amount);

        if (! $currency instanceof Currency) {
            $currency = Currency::of($currency);
        }

        return new RationalMoney($amount, $currency);
    }

    /**
     * @return BigRational
     */
    public function getAmount()
    {
        return $this->amount;
    }

    /**
     * @return Currency
     */
    public function getCurrency()
    {
        return $this->currency;
    }

    /**
     * Returns the sum of this RationalMoney and the given amount.
     *
     * @param AbstractMoney|BigNumber|number|string $that The money or amount to add.
     *
     * @return RationalMoney
     *
     * @throws ArithmeticException    If the argument is not a valid number.
     * @throws MoneyMismatchException If the argument is a money in another currency.
     */
    public function plus($that)
    {
        $that = $this->getAmountOf($that);
        $amount = $this->amount->plus($that);

        return new self($amount, $this->currency);
    }

    /**
     * Returns the difference of this RationalMoney and the given amount.
     *
     * @param AbstractMoney|BigNumber|number|string $that The money or amount to subtract.
     *
     * @return RationalMoney
     *
     * @throws ArithmeticException    If the argument is not a valid number.
     * @throws MoneyMismatchException If the argument is a money in another currency.
     */
    public function minus($that)
    {
        $that = $this->getAmountOf($that);
        $amount = $this->amount->minus($that);

        return new self($amount, $this->currency);
    }

    /**
     * Returns the product of this RationalMoney and the given number.
     *
     * @param BigNumber|number|string $that The multiplier.
     *
     * @return RationalMoney
     *
     * @throws ArithmeticException If the argument is not a valid number.
     */
    public function multipliedBy($that)
    {
        $amount = $this->amount->multipliedBy($that);

        return new self($amount, $this->currency);
    }

    /**
     * Returns the result of the division of this RationalMoney by the given number.
     *
     * @param BigNumber|number|string $that The divisor.
     *
     * @return RationalMoney
     *
     * @throws ArithmeticException If the argument is not a valid number.
     */
    public function dividedBy($that)
    {
        $amount = $this->amount->dividedBy($that);

        return new self($amount, $this->currency);
    }

    /**
     * @param Context $context
     * @param int     $roundingMode
     *
     * @return Money
     *
     * @throws RoundingNecessaryException If RoundingMode::UNNECESSARY is used but rounding is necessary.
     */
    public function toMoney(Context $context, $roundingMode = RoundingMode::UNNECESSARY)
    {
        return Money::create($this->amount, $this->currency, $context, $roundingMode);
    }

    /**
     * @return string
     */
    public function __toString()
    {
        try {
            $amount = $this->amount->toBigDecimal();
        } catch (RoundingNecessaryException $e) {
            $amount = $this->amount->simplified();
        }

        return $this->currency . ' ' . $amount;
    }
}
