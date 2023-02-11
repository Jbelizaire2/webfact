<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;

use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Validator\Validator\ValidatorInterface;
use Symfony\Component\PropertyAccess\PropertyAccess;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\ORM\Query;

/**
 * @Route("/api", name="api_")
 */
class ApiRegionesAdminController extends AbstractController
{
    #[Route('/regiones/admin', name: 'app_api_regiones_admin', methods: ['POST'])]
    public function index(Request $request,ManagerRegistry $em, ValidatorInterface $validator): Response
    {
        $result=$request->request->all('name');
        $input = ['name' => $result];
        
        $constraints = new Assert\Collection([
               'name' => [new Assert\NotBlank,new Assert\Type('array'),new Assert\Count(['min' => 1])],
                ]);

        //Creates validator
        $violations = $validator->validate($input, $constraints);


        //Check for errors
        $errorMessages = [];
        if (count($violations) > 0) {

            $accessor = PropertyAccess::createPropertyAccessor();



            foreach ($violations as $violation) {

                $accessor->setValue(
                    $errorMessages,
                    $violation->getPropertyPath(),
                    $violation->getMessage()
                );
            }
            return $this->json(["error" => $errorMessages], 400);
           
        }
       //return $this->json($input);
       $conexion = $em->getConnection();
        $group=[];
         
        foreach ($result as $val){
           
            $array_name = explode(",", @$val["name"]);
            //return $this->json($array_name);
            $provincia=trim($array_name[1]);
            $comuna=trim($array_name[2]);
            $region=$array_name[0];

            $reg = explode(" ", $region);
            $miregion=$reg[1];
             //var_dump($miregion);
             //array_push($group, json_decode(json_encode($val), true));

            //Se agrego el nombre de la region en el array $group posicion x
            
              //Buscar el ID de la region para poder las comunas correspondiens 
    $result = $conexion->fetchAllAssociative("SELECT * FROM region WHERE name='$miregion' limit 0, 1");
      $numbers=count($result);

    if ($numbers > 0 ){
        $id=$result[0]["id"];
         //Buscar todas las comunas de esa region
        $result1 = $conexion->fetchAllAssociative("SELECT name as nombre FROM commune WHERE region_id='$id' ORDER BY name");
        $numbers1=count($result1);
        if($numbers1>0){
            array_push($group, json_decode(json_encode($region), true));
   
            foreach($result1 as $key=> $val3){
                $name_com=$result1[$key]["nombre"];
                 //Agreagar el resultado en nuestra array
                array_push($group, json_decode(json_encode($name_com), true));

                  }
           
                  }
                    }

                    //INICIO PROVINCIA
                     //Se agrego el nombre de la region en el array $group posicion x
            // array_push($group, json_decode(json_encode($region), true));
   
             //Buscar el ID de la region para poder las comunas correspondiens 
    $result = $conexion->fetchAllAssociative("SELECT * FROM province WHERE name='$provincia' limit 0, 1");
     $numbers=count($result);

   if ($numbers > 0 ){
       $id=$result[0]["id"];
        //Buscar todas las comunas de esa provincia
       $result1 = $conexion->fetchAllAssociative("SELECT name as nombre FROM commune WHERE province_id='$id' ORDER BY name");
       $numbers1=count($result1);
       if($numbers1>0){
           foreach($result1 as $key=> $val3){
               $name_pro=$result1[$key]["nombre"];
                //Agreagar el resultado en nuestra array
               array_push($group, json_decode(json_encode($name_pro), true));

                 }
          
                 }
                   }
            //FIN PROVINCIA

            //INICIO COMUNA
             //Buscar todas las comunas de esa provincia
       $result1 = $conexion->fetchAllAssociative("SELECT name as nombre FROM commune WHERE name='$comuna' ORDER BY name");
       $numbers1=count($result1);
       if($numbers1>0){
           foreach($result1 as $key=> $val3){
               $name_com1=$result1[$key]["nombre"];
                //Agreagar el resultado en nuestra array
               array_push($group, json_decode(json_encode($name_com1), true));

                 }
          
                 }
      }
        return $this->json($group);
    }
    


    #[Route('/comunas', name: 'app_api_login', methods: ['GET'])]
    public function communeslist(Request $request,ManagerRegistry $em): Response
    {
        $conexion = $em->getConnection();
     
       
    $result = $conexion->fetchAllAssociative("SELECT * FROM commune");
      $numbers=count($result);

    if ($numbers > 0 ){
        
        return $this->json($result);
    } else {
        return $this->json([
            "message" => " No Existe nigún registro"
        ], 404);
    }

    }

    #[Route('/comunas/filtros', name: 'app_payload_admin', methods: ['POST'])]
    public function communesfilters(Request $request,ManagerRegistry $em, ValidatorInterface $validator): Response
    {
        //$midata=$request->request;
        $rut = $request->request->all("name");
      //var_dump($rut);
        $input = ['name' => $rut];
        $constraints = new Assert\Collection([
               'name' => [new Assert\NotBlank,new Assert\Type('array'),new Assert\Count(['min' => 1])],
                ]);

        //Creates validator
        $violations = $validator->validate($input, $constraints);


        //Check for errors
        $errorMessages = [];
        if (count($violations) > 0) {

            $accessor = PropertyAccess::createPropertyAccessor();



            foreach ($violations as $violation) {

                $accessor->setValue(
                    $errorMessages,
                    $violation->getPropertyPath(),
                    $violation->getMessage()
                );
            }
            return $this->json(["error" => $errorMessages], 400);
           
        }

         //var_dump($request->query);
        $group=[];
        $conexion = $em->getConnection();
        /*$miarr=[];
        foreach ($midata as $val){
           
           $miarr=$val;
           
        }*/

        foreach ($rut as $val2){
            //var_dump($val2);
             $array_name = explode(",", $val2);
        
            $provincia=trim($array_name[1]);
            $comuna=trim($array_name[2]);
            $region=$array_name[0];

            $reg = explode(" ", $region);
            $miregion=$reg[1];
             //var_dump($miregion);
              
            //Se agrego el nombre de la region en el array $group posicion x
            
              //Buscar el ID de la region para poder las comunas correspondiens 
    $result = $conexion->fetchAllAssociative("SELECT * FROM region WHERE name='$miregion' limit 0, 1");
      $numbers=count($result);

    if ($numbers > 0 ){
        $id=$result[0]["id"];
         //Buscar todas las comunas de esa region
        $result1 = $conexion->fetchAllAssociative("SELECT name as nombre FROM commune WHERE region_id='$id' ORDER BY name");
        $numbers1=count($result1);
        if($numbers1>0){
            array_push($group, json_decode(json_encode($region), true));
   
            foreach($result1 as $key=> $val3){
                $name_com=$result1[$key]["nombre"];
                 //Agreagar el resultado en nuestra array
                array_push($group, json_decode(json_encode($name_com), true));

                  }
           
                  }
                    }

                    //INICIO PROVINCIA
                     //Se agrego el nombre de la region en el array $group posicion x
            // array_push($group, json_decode(json_encode($region), true));
   
             //Buscar el ID de la region para poder las comunas correspondiens 
    $result = $conexion->fetchAllAssociative("SELECT * FROM province WHERE name='$provincia' limit 0, 1");
     $numbers=count($result);

   if ($numbers > 0 ){
       $id=$result[0]["id"];
        //Buscar todas las comunas de esa provincia
       $result1 = $conexion->fetchAllAssociative("SELECT name as nombre FROM commune WHERE province_id='$id' ORDER BY name");
       $numbers1=count($result1);
       if($numbers1>0){
           foreach($result1 as $key=> $val3){
               $name_pro=$result1[$key]["nombre"];
                //Agreagar el resultado en nuestra array
               array_push($group, json_decode(json_encode($name_pro), true));

                 }
          
                 }
                   }
            //FIN PROVINCIA

            //INICIO COMUNA
             //Buscar todas las comunas de esa provincia
       $result1 = $conexion->fetchAllAssociative("SELECT name as nombre FROM commune WHERE name='$comuna' ORDER BY name");
       $numbers1=count($result1);
       if($numbers1>0){
           foreach($result1 as $key=> $val3){
               $name_com1=$result1[$key]["nombre"];
                //Agreagar el resultado en nuestra array
               array_push($group, json_decode(json_encode($name_com1), true));

                 }
          
                 }
            //FIN COMUNA
             //var_dump($provincia);
            // var_dump($comuna);
        }
       
        return $this->json($group);
        
        $conexion = $em->getConnection();
     
       
    $result = $conexion->fetchAllAssociative("SELECT * FROM commune");
      $numbers=count($result);

    if ($numbers > 0 ){
        
        return $this->json($result);
    } else {
        return $this->json([
            "message" => " No Existe nigún registro"
        ], 404);
    }

}

}
