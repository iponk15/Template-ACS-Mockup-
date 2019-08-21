<?php

namespace Brick\Money\ExchangeRateProvider;

use Brick\Money\ExchangeRateProvider;

/**
 * Caches the results of another exchange rate provider.
 */
final class CachedProvider implements ExchangeRateProvider
{
    /**
     * The underlying exchange rate provider.
     *
     * @var ExchangeRateProvider
     */
    private $provider;

    /**
     * The cached exchange rates.
     *
     * @var array
     */
    private $exchangeRates = [];

    /**
     * Class constructor.
     *
     * @param ExchangeRateProvider $provider
     */
    public function __construct(ExchangeRateProvider $provider)
    {
        $this->provider = $provider;
    }

    /**
     * {@inheritdoc}
     */
    public function getExchangeRate($sourceCurrencyCode, $targetCurrencyCode)
    {
        if (isset($this->exchangeRates[$sourceCurrencyCode][$targetCurrencyCode])) {
            return $this->exchangeRates[$sourceCurrencyCode][$targetCurrencyCode];
        }

        $exchangeRate = $this->provider->getExchangeRate($sourceCurrencyCode, $targetCurrencyCode);

        $this->exchangeRates[$sourceCurrencyCode][$targetCurrencyCode] = $exchangeRate;

        return $exchangeRate;
    }

    /**
     * Invalidates the cache.
     *
     * This forces the exchange rates to be fetched again from the underlying provider.
     *
     * @return void
     */
    public function invalidate()
    {
        $this->exchangeRates = [];
    }
}
