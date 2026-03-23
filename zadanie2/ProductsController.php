<?php

namespace App\Controller;

use App\Entity\Product;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Attribute\Route;

final class ProductsController extends AbstractController
{
    #[Route('/products', name: 'products_index', methods: ['GET'])]
    public function index(EntityManagerInterface $em): JsonResponse
    {
        $products = $em->getRepository(Product::class)->findAll();

        return $this->json($products);                               
    }

    #[Route('/products/{id}', name: 'products_show', methods: ['GET'])]
    public function show(?Product $product): JsonResponse
    {
        if (!$product) {
            return $this->json(['error' => 'Podany produkt nie istnieje'], 404);
        }

        return $this->json($product);
    }

    #[Route('/products', name: 'products_create', methods: ['POST'])]
    public function create(Request $req, EntityManagerInterface $em): JsonResponse
    {
        $data = json_decode($req->getContent(), true);

        if (!isset($data['name'], $data['price'], $data['type'])) {
            return $this->json(['error' => 'Niepoprawne dane\n'], 400);
        }

        $product = new Product();
        $product->setName($data['name']);
        $product->setPrice((int) $data['price']);
        $product->setType($data['type']);

        $em->persist($product);
        $em->flush();

        return $this->json(['succes' => 'Produkt dodany'], 200);
    }

    #[Route('/products/{id}', name: 'products_update', methods: ['PUT'])]
    public function update(?Product $product, Request $req, EntityManagerInterface $em): JsonResponse
    {
        if (!$product) {
            return $this->json(['error' => 'Podany produkt nie istnieje'], 404);
        }

        $data = json_decode($req->getContent(), true);

        if (!$data) {
            return $this->json(['error' => 'Niepoprawne dane'], 400);
        }

        if (isset($data['name'])) {
            $product->setName($data['name']);
        }

        if (isset($data['price'])) {
            $product->setPrice((int) $data['price']);
        }

        if (isset($data['type'])) {
            $product->setType($data['type']);
        }

        $em->flush();

        return $this->json(['succes' => 'Produkt zaktualizowany'], 200);
    }

    #[Route('/products/{id}', name: 'products_delete', methods: ['DELETE'])]
    public function delete(?Product $product, EntityManagerInterface $em): JsonResponse
    {
        if (!$product) {
            return $this->json(['error' => 'Podany produkt nie istnieje'], 404);
        }

        $em->remove($product);
        $em->flush();

        return $this->json(['succes' => 'Produkt usuniety'], 200);
    }
}