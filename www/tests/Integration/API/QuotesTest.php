<?php

use App\Entity\Author;
use App\Entity\Quote;
use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class QuotesTest extends WebTestCase
{
    public function setUp()
    {
        $kernel = static::bootKernel();

        $kernel->getContainer()->get('memcached')->flush();

        $connection = $kernel->getContainer()->get('doctrine.orm.default_entity_manager')->getConnection();
        $connection->query('SET FOREIGN_KEY_CHECKS=0');
        $connection->query('TRUNCATE TABLE author');
        $connection->query('TRUNCATE TABLE quote');
        $connection->query('SET FOREIGN_KEY_CHECKS=1');
    }

    /**
     * @test
     */
    public function it_should_return_quotes_if_author_exists()
    {
        $client = static::createClient();
        $kernel = static::bootKernel();

        $slugGenerator = $kernel->getContainer()->get('ipresence.services.slug');

        $this->generateQuote('Author 1', 'Quote 1 of Author 1');
        $this->generateQuote('Author 2', 'Quote 1 of Author 2');
        $this->generateQuote('Author 3', 'Quote 1 of Author 3');

        $limit  = 1;
        $client->request('GET', '/shout/' . $slugGenerator->generate('Author 1') . '?limit=' . $limit);

        $this->assertEquals(200, $client->getResponse()->getStatusCode());
        $this->assertEquals(
            [
                'QUOTE 1 OF AUTHOR 1!'
            ],
            json_decode($client->getResponse()->getContent(), true)
        );
    }

    /**
     * @test
     */
    public function it_should_get_an_error_if_author_not_exists()
    {
        $client = static::createClient();
        $kernel = static::bootKernel();

        $slugGenerator = $kernel->getContainer()->get('ipresence.services.slug');

        $this->generateQuote('Author 1', 'Quote 1 of Author 3');

        $limit  = 1;
        $client->request('GET', '/shout/' . $slugGenerator->generate('Author 3') . '?limit=' . $limit);

        $this->assertEquals(404, $client->getResponse()->getStatusCode());
    }

    /**
     * @test
     */
    public function it_should_get_an_error_if_limit_exceed_maximum_threshold()
    {
        $client = static::createClient();
        $kernel = static::bootKernel();

        $slugGenerator = $kernel->getContainer()->get('ipresence.services.slug');

        $this->generateQuote('Author 1', 'Quote 1 of Author 1');

        $limit  = 11;
        $client->request('GET', '/shout/' . $slugGenerator->generate('Author 1') . '?limit=' . $limit);

        $this->assertEquals(400, $client->getResponse()->getStatusCode());
    }

    private function generateQuote(string $authorName, string $quoteText)
    {
        $kernel = static::bootKernel();

        $authorSlug    = $kernel->getContainer()->get('ipresence.services.slug')->generate($authorName);
        $authorRepository = $kernel->getContainer()->get('ipresence.repository.author');

        $author = $authorRepository->findBySlug($authorName);

        if (null === $author) {
            $author = Author::create($authorName, $authorSlug);
        }

        $quote = Quote::create($author, $quoteText);

        $entityManager = $kernel->getContainer()->get('doctrine.orm.default_entity_manager');

        $entityManager->persist($author);
        $entityManager->persist($quote);
        $entityManager->flush();
    }
}
