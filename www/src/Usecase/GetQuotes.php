<?php

namespace App\Usecase;

use App\Entity\AuthorRepository;
use App\Entity\Quote;
use App\Exception\AuthorNotFoundException;
use App\Exception\GetQuotesException;
use App\Services\QuotesHandler;

/**
 * Class GetQuotes
 *
 * @package App\Usecase
 */
class GetQuotes
{
    /**
     * @var QuotesHandler
     */
    private $quotesHandler;
    /**
     * @var int
     */
    private $limitMax;
    /**
     * @var AuthorRepository
     */
    private $authorRepository;

    /**
     * GetQuotes constructor.
     *
     * @param QuotesHandler    $quotesHandler
     * @param AuthorRepository $authorRepository
     * @param int              $limitMax
     */
    public function __construct(
        QuotesHandler $quotesHandler,
        AuthorRepository $authorRepository,
        int $limitMax
    ) {
        $this->quotesHandler    = $quotesHandler;
        $this->authorRepository = $authorRepository;
        $this->limitMax         = $limitMax;
    }

    /**
     * @param string $authorSlug
     * @param int    $limit
     *
     * @return array
     * @throws GetQuotesException
     * @throws AuthorNotFoundException
     */
    public function execute(string $authorSlug, int $limit): array
    {
        if ($limit > $this->limitMax) {
            throw new GetQuotesException('limit parameter exceeds the maximum threshold');
        }

        $author = $this->authorRepository->findBySlug($authorSlug);
        if (null === $author) {
            throw new AuthorNotFoundException('author not found');
        }

        $quotes = [];
        /** @var Quote $quote */
        foreach ($this->quotesHandler->findByAuthor($authorSlug, $limit) as $quote) {
            $text = $quote->text();

            if ('!' !== substr($text, -1)) {
                $text = ($pos = strpos($text, '.')) ? substr_replace($text, '!', $pos) : $text . '!';
            }

            $quotes[] = strtoupper($text);
        }

        return $quotes;
    }
}