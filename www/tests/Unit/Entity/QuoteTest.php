<?php

use App\Entity\Author;
use App\Entity\Quote;
use Doctrine\Common\Collections\ArrayCollection;
use PHPUnit\Framework\Assert;
use PHPUnit\Framework\TestCase;

class QuoteTest extends TestCase
{
    /**
     * @test
     */
    public function it_should_create_a_valid_quote()
    {
        $author = Author::create('Author 1', 'author-1');
        $quote  = Quote::create($author, 'Quote 1');

        Assert::assertEquals($quote->text(), 'Quote 1');
        Assert::assertEquals($quote->author(), $author);
    }
}