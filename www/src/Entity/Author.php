<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;

/**
 * Author
 */
class Author
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var string
     */
    private $name;

    /**
     * @var string
     */
    private $slug;

    /**
     * @var Collection
     */
    private $quotes;

    private function __construct()
    {
        $this->quotes = new ArrayCollection();
    }

    public static function create(string $name, string $slug): Author
    {
        $author = new self();

        $author->name = $name;
        $author->slug = $slug;

        return $author;
    }

    public function name(): string
    {
        return $this->name;
    }

    public function slug(): string
    {
        return $this->slug;
    }

    public function quotes(): Collection
    {
        return $this->quotes;
    }
}
