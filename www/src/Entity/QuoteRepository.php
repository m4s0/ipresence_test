<?php

namespace App\Entity;

class QuoteRepository extends \Doctrine\ORM\EntityRepository
{
    public function findByAuthor($authorSlug, $limit)
    {
        $qb = $this->getEntityManager()->createQueryBuilder();

        $qb->select('q')
            ->from('App:Quote', 'q')
            ->join('q.author', 'a')
            ->where('a.slug = :slug')
            ->setParameter('slug', $authorSlug)
            ->setMaxResults($limit);

        return $qb->getQuery()->getResult();
    }
}
