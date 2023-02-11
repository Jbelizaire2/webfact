<?php

namespace App\Controller;

use Doctrine\ORM\Query;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Doctrine\DBAL\Connection;
use Symfony\Component\Security\Core\Security;



class MainController extends AbstractController
{
	private $security;

    public function __construct(Security $security)
    {
        $this->security = $security;
    }

	#[Route('/mantenedor', name: 'master_home')]
    public function homeAction()
    {   
		$debug = $this->getParameter('kernel.debug');
		$user = $this->security->getUser();
		
    if (!is_object($user)){

	  return $this->redirectToRoute('login');

      }
    	
		foreach ($this->security->getUser()->getRoles() as $key => $val) {
    		if ($val === 'ROLE_ADMIN') {
				return $this->redirectToRoute('accounting_folio_index');
    	
				//return $this->render('Main/home.html.twig', array());

    		}else{
				if ($val === 'ROLE_USER') {
					return $this->redirectToRoute('accounting_folio_index');
    	
				}
			}
		}
	
    	//return $this->render('Main/home.html.twig', array());
	}

	#[Route('/mantenedor/admin', name: 'accounting_folio_index')]

	public function adminHomeAction(ManagerRegistry $em,Connection $conn){

		$em = $em->getManager();

		$cantidadFolio=[];

		
		$cantNotaCredito=[];;

       $fecha=date('d/m/Y');
    
	     $totalConectadasCaja=[];



		//USANDO SQL
        $statement = [];;  
		$check = empty($statement)? $check=0 : $check=$statement;
		
		//USANDO SQL
        $statement3 = [];  
       // $statement3->execute(); 
        //$Cajasabierta = $statement3;
		$Cajasabierta = empty($statement3)? $Cajasabierta=0 : $Cajasabierta=$statement3;

		
	 	return $this->render('Main/home.html.twig', array('cantidadFolio' => $cantidadFolio,'cantidadNotaC' => $cantNotaCredito
			,'cantidadCaja' => $totalConectadasCaja,'check'=>$check,'CAbiertas'=>$Cajasabierta

		));

	}	

	

}