<?php

namespace App\Command;

use App\Entity\Author;
use App\Entity\AuthorRepository;
use App\Entity\Quote;
use Ausi\SlugGenerator\SlugGenerator;
use Doctrine\ORM\EntityManager;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Style\SymfonyStyle;
use Symfony\Component\HttpKernel\KernelInterface;

class LoadQuotesCommand extends Command
{
    protected static $defaultName = 'ipresence:quotes:load';
    /**
     * @var EntityManager
     */
    private $entityManager;
    /**
     * @var AuthorRepository
     */
    private $authorRepository;
    /**
     * @var SlugGenerator
     */
    private $slugGenerator;
    /**
     * @var KernelInterface
     */
    private $kernel;

    /**
     * LoadQuotesCommand constructor.
     *
     * @param EntityManager    $entityManager
     * @param AuthorRepository $authorRepository
     * @param SlugGenerator    $slugGenerator
     * @param KernelInterface  $kernel
     */
    public function __construct(
        EntityManager $entityManager,
        AuthorRepository $authorRepository,
        SlugGenerator $slugGenerator,
        KernelInterface $kernel
    ) {
        $this->entityManager    = $entityManager;
        $this->authorRepository = $authorRepository;
        $this->slugGenerator    = $slugGenerator;
        $this->kernel           = $kernel;

        parent::__construct();
    }

    protected function configure()
    {
        $this->setAliases(['i:q:l'])
            ->setDescription('Load Quotes from JSON file.')
            ->addArgument('path', InputArgument::REQUIRED, 'Argument description')
        ;
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $io = new SymfonyStyle($input, $output);
        $path = $input->getArgument('path');

        try {
            $n = 0;
            $jsonQuotes = json_decode(file_get_contents($this->kernel->getProjectDir() .'/'.$path), true);
            foreach ($jsonQuotes['quotes'] as $quote) {
                $this->addQuote($quote['author'], $quote['quote']);
                $n++;
            }
        } catch (\Exception $e) {
            $io->error($e->getMessage());
            exit();
        }

        $io->success(sprintf('%d quotes loaded.', $n));
    }

    private function addQuote(string $authorName, string $quoteText): void
    {
        $authorSlug = $this->slugGenerator->generate($authorName);
        $author     = $this->authorRepository->findBySlug($authorSlug);

        if (null === $author) {
            $author = Author::create($authorName, $authorSlug);
        }

        $quote = Quote::create($author, $quoteText);

        $this->entityManager->persist($author);
        $this->entityManager->persist($quote);
        $this->entityManager->flush();
    }
}
