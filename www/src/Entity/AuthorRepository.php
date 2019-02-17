<?php

namespace App\Entity;

class AuthorRepository extends \Doctrine\ORM\EntityRepository
{
    public function findBySlug(string $slug)
    {
        $qb = $this->getEntityManager()->createQueryBuilder();

        $qb->select('a')
            ->from('App:Author', 'a')
            ->where('a.slug = :slug')
            ->setParameter('slug', $slug);

        return $qb->getQuery()->getOneOrNullResult();
    }
}
