<?php

namespace Brick\Money;

use Brick\Money\Exception\CurrencyConversionException;

use Brick\Math\BigNumber;

/**
 * Interface for exchange rate providers.
 */
interface ExchangeRateProvider
{
    /**
     * @param string $sourceCurrencyCode The source currency code.
     * @param string $targetCurrencyCode The target currency code.
     *
     * @return BigNumber|number|string The exchange rate.
     *
     * @throws CurrencyConversionException If the exchange rate is not available.
     */
    public function getExchangeRate($sourceCurrencyCode, $targetCurrencyCode);
}
