<?php

namespace App\Entity;

/**
 * Quote
 */
class Quote
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var string
     */
    private $text;

    /**
     * @var Author
     */
    private $author;

    private function __construct() {}

    public static function create(Author $author, string $text): Quote
    {
        $quote = new self();

        $quote->author = $author;
        $quote->text   = $text;

        return $quote;
    }

    public function text(): string
    {
        return $this->text;
    }

    public function author(): Author
    {
        return $this->author;
    }
}
