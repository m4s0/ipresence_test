<?php

namespace App\Controller;

use App\Exception\AuthorNotFoundException;
use App\Exception\GetQuotesException;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class QuotesController extends AbstractController
{
    public function shout(Request $request, $author): JsonResponse
    {
        try {
            $quotes = $this->container->get('ipresence.usecase.get_quotes')->execute(
                $author,
                $request->query->get('limit', 1)
            );
        } catch (GetQuotesException $e) {
            return new JsonResponse(['error' => $e->getMessage()], Response::HTTP_BAD_REQUEST);
        } catch (AuthorNotFoundException $e) {
            return new JsonResponse(['error' => $e->getMessage()], Response::HTTP_NOT_FOUND);
        } catch (\Exception $e) {
            return new JsonResponse([], Response::HTTP_INTERNAL_SERVER_ERROR);
        }

        return new JsonResponse($quotes, Response::HTTP_OK);
    }
}