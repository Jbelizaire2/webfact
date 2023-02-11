<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\ORM\Query;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;
use App\Entity\Imagen;
use App\Entity\Status;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use PhpOffice\PhpSpreadsheet\IOFactory;

class ImageController extends AbstractController
{
    #[Route('mantenedor/image', name: 'mantenedor_image_index')]
    public function index(ManagerRegistry $em): Response
    {
        $conexion=$em->getConnection();
       
        $image=  $conexion->fetchAllAssociative("SELECT *  FROM imagen AS b   ORDER BY b.id DESC");
    


        if (!$image) {
            $this->addFlash(
                    'error',
                    'No se Encontraron registros.'
                );
            return new JsonResponse(['state' => false]);
        }
      
        return $this->render('image/index.html.twig', [
            'controller_name' => 'ImageController',
            'imagenes' => $image 
        ]);
        
    }
    
    #[Route('mantenedor/imagen/addImagen', name: 'accounting_image_addImagen')]
    public function new(ManagerRegistry $em,Request $request): Response
    {
        $imagen = new Imagen();
        $form = $this->createForm('App\Form\ImagenType', $imagen);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $em->getManager();

            $numeroImagen=$form['tituloImagen']->getData();
            $id_user = $this->getUser()->getId();
            // $file=$form['image']->getData();
             $image=$form['archivo']->getData();
            
            // Sacamos la extensión del fichero
             $ext=$image->guessExtension();
                         
             // Le ponemos un nombre al fichero
                         //$file_name=time().".".$ext;
             $file_name='Imagen_'.$numeroImagen.".".$ext;
                         
            // Guardamos el fichero en el directorio uploads que estará en el directorio /web del framework
             $image=$form['archivo']->getData();
            $user_existant = $em->getRepository(Imagen::class)->findOneBy(array('tituloImagen' => $numeroImagen));
             if (!$user_existant) {

                $image->move("uploads", $file_name);
                $status = $em->getRepository(Status::class)->findOneById(1);
                $imagen->setArchivo($file_name);
                $imagen->setUser($id_user);
                $imagen->setStatus($status);
   
               $em->persist($imagen);
               $em->flush();
             }   
           


            $this->addFlash(
    		    'success',
    		    'Creado Correctamente'
    	);
           // return $this->redirectToRoute('Imagen_show', array('id' => $Imagen->getId()));
            return $this->redirectToRoute('mantenedor_image_index');
        }

        return $this->render('image/addImagen.html.twig', array(
            'imagen' => $imagen,
            'form' => $form->createView(),
        ));
    }
    
    #[Route('/mantenedor/imagen/editImagen/{id}', name: 'accounting_imagen_editImagen')]
    public function editImagen($id, Imagen $imagen,ManagerRegistry $em,Request $request): Response
    {
        $editForm = $this->createForm('App\Form\ImagenType', $imagen);
        $editForm->handleRequest($request);


        $em = $em->getManager();
        $imagenes = $em->createQuery("SELECT d.archivo FROM App:Imagen d WHERE d.id=:id " )
        ->setParameter('id', $id)
        ->getResult(Query::HYDRATE_OBJECT);

       if ($editForm->isSubmitted() && $editForm->isValid()) {
           

            $tituloImagen = $editForm->get('tituloImagen')->getData();

          
            $image=$editForm['archivo']->getData();
            $url=$editForm['url']->getData();
         

           // $images = $request->request->get('file');

           if(!$image){


            $posts = $em->getRepository(Imagen::class);
     
            $post = $posts->find($id);


             $imagen = $em->createQuery("SELECT d.archivo FROM App:Imagen d WHERE d.id=:id " )
             ->setParameter('id', $id)
             ->getResult(Query::HYDRATE_OBJECT);

              $post->setUrl($url);
              foreach($imagen as $dt){

              
               $post->setArchivo($dt['archivo']);

               $em->flush();

              } 


           }else{

             // $file=$form['image']->getData();
             $image=$editForm['archivo']->getData();
            
             // Sacamos la extensión del fichero
             $ext=$image->guessExtension();
             
             // Le ponemos un nombre al fichero
             //$file_name=time().".".$ext;
             $file_name='Imagen_'.$tituloImagen.".".$ext;
             
             // Guardamos el fichero en el directorio uploads que estará en el directorio /web del framework
             $image->move("uploads", $file_name);
             
             //$Imagen = $em->getRepository(Imagen::class)->find($id);
 
             //$Imagen->setArchivo($file_name);
         
             //$em->flush();
             $posts = $em->getRepository(Imagen::class);
     
             $post = $posts->find($id);
             $post->setArchivo($file_name);

             $em->flush();


           }


          
            $this->addFlash(
    		    'success',
    		    'Datos Actualizados Correctamente'
            );
            
            return $this->redirectToRoute('mantenedor_image_index');

        }
        return $this->render('image/editImagen.html.twig', array(
            'imagen' => $imagen,
            'imagens' => $imagenes,
            'edit_form' => $editForm->createView(),
            //'delete_form' => $deleteForm->createView(),
        ));
    }
    
    #[Route('mantenedor/imagen/drop/{id}', name: 'mantenedor_image_drop', methods: ['GET', 'POST'])]
    public function dropImagen($id, Imagen $imagen,ManagerRegistry $em,Request $request): Response
    {
        $editForm = $this->createForm('App\Form\ImagenType', $imagen);
        $editForm->handleRequest($request);


        $em = $em->getManager();
        $imagenes = $em->createQuery("SELECT d.archivo FROM App:Imagen d WHERE d.id=:id " )
        ->setParameter('id', $id)
        ->getResult(Query::HYDRATE_OBJECT);

       if (count ($imagenes) >0 ) {
           

            
         $posts = $em->getRepository(Imagen::class);
     
           $post = $posts->find($id);
           $status = $em->getRepository(Status::class)->findOneById(2);
           $post->setStatus($status);

           $em->persist($post);
           $em->flush();

            $em->flush();
            $this->addFlash(
    		    'success',
    		    'Datos Eliminado Correctamente'
            );
            
            return $this->redirectToRoute('mantenedor_image_index');

        }
        return $this->redirectToRoute('mantenedor_image_index');

        
    }

    #[Route('mantenedor/imagen/addFile', name: 'accounting_image_addFile')]
    public function newFile(Request $request,ManagerRegistry $em,$imagen=null): Response
    {

          $form = $this->createForm('App\Form\Imagen1Type', $imagen);
          $form->handleRequest($request);
          $em2=$em;
        if ($form->isSubmitted() ) {
            $em = $em->getManager();
            try {
                //$numeroImagen=$form['tituloImagen']->getData();
                $id_user = $this->getUser()->getId();
                // $file=$form['image']->getData();
                $image = $form['archivo']->getData();

                // Sacamos la extensión del fichero
                $ext = $image->guessExtension();

                $spreadsheet = IOFactory::load($image); // Here we are able to read from the excel file 
                $row = $spreadsheet->getActiveSheet()->removeRow(1); // I added this to be able to remove the first file line 
                $sheetData = $spreadsheet->getActiveSheet()->toArray(null, true, true, true); // here, the read data is turned into an array
                //dd($sheetData);
                // Le ponemos un nombre al fichero
                //$file_name=time().".".$ext;
                //$file_name='Imagen_'.$numeroImagen.".".$ext;
                //dd($sheetData[1]["A"]);

                foreach ($sheetData as $Row) {

                    $titulo = trim($Row['A']);
                    $descripcion = trim($Row['B']);
                    $url = trim($Row['C']);

                    $conexion=$em2->getConnection();
                    $user_existant = $em->getRepository(Imagen::class)->findOneBy(array('tituloImagen' => $titulo));
                  
                    if (!$user_existant) {
                      //Si no exitste ese titulo se procede insertar la nueva imagen
                        $imagen1 = new Imagen();
                        $status = $em->getRepository(Status::class)->findOneById(1);
                        $imagen1->settituloImagen($titulo);
                        $imagen1->setUrl($url);
                        $imagen1->setDescripcion($descripcion);
                        $imagen1->setUser($id_user);
                        $imagen1->setStatus($status);
                        $em->persist($imagen1);
                        $em->flush();

                    }else{
                    
                        $imagenes = $conexion->fetchAllAssociative("SELECT *  FROM imagen AS b  WHERE b.titulo='$titulo'");
                        //Revision si el url Fue actualizado para lugo actualizar la imagen
                        $idimg = $imagenes[0]["id"];
                        $url2 = $imagenes[0]["url"];
                        if ($url2!=$url){
                        $posts = $em->getRepository(Imagen::class);
     
                        $post = $posts->find($idimg);
                        $post->setUrl($url);

                        $em->flush();

                        }
                        
                    }

                }
              


                $this->addFlash(
                    'success',
                    'Creado Correctamente'
                );
                return $this->redirectToRoute('mantenedor_image_index');

            } catch (FileException $e) {
                dd($e);
            }
            // return $this->redirectToRoute('Imagen_show', array('id' => $Imagen->getId()));

        }
        return $this->render('image/addFile.html.twig', array(
            'imagen' => $imagen,
            'form' => $form->createView(),
        ));
       
    }

     
    #[Route('mantenedor/imagen/status/{id}', name: 'mantenedor_image_status', methods: ['GET', 'POST'])]
    public function statusImagen($id,ManagerRegistry $em,Request $request): Response
    {
       
         $status=$request->request->get('status');
        $em = $em->getManager();
        $imagenes = $em->createQuery("SELECT d.archivo FROM App:Imagen d WHERE d.id=:id " )
        ->setParameter('id', $id)
        ->getResult(Query::HYDRATE_OBJECT);

       if (count ($imagenes) >0 ) {
           

            
           $posts = $em->getRepository(Imagen::class);
           $post = $posts->find($id);
           $status2 = $em->getRepository(Status::class)->findOneById($status);
           $post->setStatus($status2);

           $em->persist($post);
           $em->flush();

            $em->flush();
            $this->addFlash(
    		    'success',
    		    'Datos Activado Correctamente'
            );
            
            return new JsonResponse(['state' => true]);
       
        }
        return $this->redirectToRoute('mantenedor_image_index');

        
    }
    

}
