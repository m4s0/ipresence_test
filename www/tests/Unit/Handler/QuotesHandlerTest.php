<?php

use App\Services\QuotesHandler;
use PHPUnit\Framework\Assert;
use PHPUnit\Framework\TestCase;

class QuotesHandlerTest extends TestCase
{
    /**
     * @test
     */
    public function it_should_get_quotes_from_cache_if_quotes_are_cached()
    {
        $memcached        = $this->prophesize(Memcached::class);
        $quotesRepository = $this->prophesize(\App\Entity\QuoteRepository::class);

        $quotesHandler = new QuotesHandler($quotesRepository->reveal(), $memcached->reveal(), 100);

        $memcached->get($quotesHandler->generateCacheKey('Author 1', 1))->willReturn(['quote 1.']);
        $quotesRepository->findByAuthor('Author 1', 1)->shouldNotBeCalled();

        $quotes = $quotesHandler->findByAuthor('Author 1', 1);

        Assert::assertEquals(['quote 1.'], $quotes);
    }

    /**
     * @test
     */
    public function it_should_get_quotes_from_repository_if_quotes_are_not_cached()
    {
        $memcached        = $this->prophesize(Memcached::class);
        $quotesRepository = $this->prophesize(\App\Entity\QuoteRepository::class);

        $quotesHandler = new QuotesHandler($quotesRepository->reveal(), $memcached->reveal(), 100);

        $memcached->get($quotesHandler->generateCacheKey('Author 1', 1))->willReturn(false);
        $memcached->set($quotesHandler->generateCacheKey('Author 1', 1), ['quote 1.'], 100)->shouldBeCalled();
        $quotesRepository->findByAuthor('Author 1', 1)->willReturn(['quote 1.']);

        $quotes = $quotesHandler->findByAuthor('Author 1', 1);

        Assert::assertEquals(['quote 1.'], $quotes);
    }
}
