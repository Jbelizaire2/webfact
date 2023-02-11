<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\Persistence\ManagerRegistry;
class DefaultController extends AbstractController
{
    #[Route('/default', name: 'app_default')]
    public function index(ManagerRegistry $em): Response
    {
        $conexion = $em->getConnection();
     
       
    $comuna = $conexion->fetchAllAssociative("SELECT * FROM commune");
    $province = $conexion->fetchAllAssociative("SELECT * FROM province");
    $region = $conexion->fetchAllAssociative("SELECT * FROM region");
        return $this->render('default/index.html.twig', [
            'controller_name' => 'DefaultController',
            'comunas' => $comuna,
            'provincias' => $province,
            'regiones' => $region,
        ]);
    }
}
