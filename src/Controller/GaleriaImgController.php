<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\ORM\Query;

class GaleriaImgController extends AbstractController
{
    #[Route('/galeria', name: 'app_galeria_img')]
    public function index(ManagerRegistry $em): Response
    {
         $conexion=$em->getConnection();
       
        $image=  $conexion->fetchAllAssociative("SELECT *  FROM imagen AS b  WHERE b.id_status=3 ORDER BY b.titulo");
        return $this->render('galeria_img/index.html.twig', [
            'controller_name' => 'GaleriaImgController',
            'imagenes' => $image 
        ]);
    }
}
