<?php

use App\Entity\Author;
use App\Entity\AuthorRepository;
use App\Entity\Quote;
use App\Services\QuotesHandler;
use App\Usecase\GetQuotes;
use PHPUnit\Framework\Assert;
use PHPUnit\Framework\TestCase;

class GetQuotesTest extends TestCase
{
    /**
     * @test
     * @expectedException App\Exception\GetQuotesException
     */
    public function it_should_thow_an_exception_if_limit_exceed()
    {
        $quotesHandler = $this->prophesize(QuotesHandler::class);
        $authorRepository = $this->prophesize(AuthorRepository::class);
        $getQuotes = new GetQuotes($quotesHandler->reveal(), $authorRepository->reveal(), 10);

        $getQuotes->execute('Author 1', 11);
    }

    /**
     * @test
     */
    public function it_should_uppercase_and_add_exclamation_mark()
    {
        $quotesHandler    = $this->prophesize(QuotesHandler::class);
        $authorRepository = $this->prophesize(AuthorRepository::class);
        $getQuotes        = new GetQuotes($quotesHandler->reveal(), $authorRepository->reveal(), 10);

        $author1 = Author::create('Author 1', 'author-1');

        $authorRepository->findBySlug('author-1')->willReturn($author1);
        $quotesHandler->findByAuthor('author-1', 3)->willReturn(
            [
                Quote::create($author1, 'test'),
                Quote::create($author1, 'test.'),
                Quote::create($author1, 'test!')
            ]
        );

        Assert::assertEquals(
            $getQuotes->execute('author-1', 3),
            [
                'TEST!',
                'TEST!',
                'TEST!'
            ]
        );
    }
}
