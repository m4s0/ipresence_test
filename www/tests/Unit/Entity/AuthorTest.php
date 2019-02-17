<?php

use App\Entity\Author;
use Doctrine\Common\Collections\ArrayCollection;
use PHPUnit\Framework\Assert;
use PHPUnit\Framework\TestCase;

class AuthorTest extends TestCase
{
    /**
     * @test
     */
    public function it_should_create_a_valid_author()
    {
        $author = Author::create('Author 1', 'author-1');

        Assert::assertEquals($author->name(), 'Author 1');
        Assert::assertEquals($author->slug(), 'author-1');
        Assert::assertEquals($author->quotes(), new ArrayCollection);
    }
}