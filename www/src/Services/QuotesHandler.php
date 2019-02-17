<?php

namespace App\Services;

use App\Entity\QuoteRepository;
use Memcached;

class QuotesHandler
{
    private const CACHE_KEY_PREFIX = 'quotes_';

    /**
     * @var QuoteRepository
     */
    private $quotesRepository;
    /**
     * @var Memcached
     */
    private $memcached;
    /**
     * @var int
     */
    private $TTL;

    /**
     * QuotesHandler constructor.
     *
     * @param QuoteRepository $quotesRepository
     * @param Memcached       $memcached
     * @param int             $TTL
     */
    public function __construct(
        QuoteRepository $quotesRepository,
        Memcached $memcached,
        int $TTL
    ) {
        $this->quotesRepository = $quotesRepository;
        $this->memcached        = $memcached;
        $this->TTL              = $TTL;
    }

    public function findByAuthor(string $author, int $limit): array
    {
        $quotes = $this->memcached->get($this->generateCacheKey($author, $limit));
        if ($quotes) {
            return $quotes;
        }

        $quotes = $this->quotesRepository->findByAuthor($author, $limit);
        if (!empty($quotes)) {
            $this->memcached->set($this->generateCacheKey($author, $limit), $quotes, $this->TTL);

            return $quotes;
        }

        return [];
    }

    public function generateCacheKey(string $author, int $limit): string
    {
        return self::CACHE_KEY_PREFIX . hash('md5', $author . $limit);
    }
}
