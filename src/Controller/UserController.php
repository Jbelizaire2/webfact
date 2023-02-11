<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use App\Entity\Persona;
use App\Entity\Status;
use App\Entity\Rol;
use App\Entity\User;
use Doctrine\Persistence\ManagerRegistry;
use App\Form\UserType;
class UserController extends AbstractController
{
    #[Route('mantenedor/user-index', name: 'mantenedor_user_index')]
    public function index(ManagerRegistry $em): Response
    {
        $em = $em->getManager();
        $users = $em->createQuery("SELECT mcl, m,ur  FROM App:User mcl LEFT JOIN mcl.persona m  LEFT JOIN mcl.roles ur WHERE  mcl.status = 1")->getResult();
      //var_dump($users);

        return $this->render('User/index.html.twig', array('users' => $users));
        
    }
    #[Route('mantenedor/user-create', name: 'mantenedor_user_create')]

    public function createAction(ManagerRegistry $em): Response
    {
    	$em = $em->getManager();

    	$roles      = $em->getRepository(Rol::class)->findByStatus(1);
        return $this->render('User/create.html.twig', 
            ['roles' => $roles, 'sucursales' => []]
        );
    }
    #[Route('mantenedor/user-edit/{id}', name: 'mantenedor_user_edit')]

    public function editAction($id,Request $request, User $user,ManagerRegistry $em,UserPasswordHasherInterface $encoder): Response
    {
        $deleteForm = $this->createDeleteForm($user);
        $editForm = $this->createForm(UserType::class, $user);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            
            $em = $em->getManager();

    
            $password = $editForm->get('password')->getData();
    
            if(!empty($password)){

            //$encoder = $this->container->get('security.password_encoder');
            $encoded =  $encoder->hashPassword($user, $password);
            $user->setPassword($encoded);
           
            }else{

                $recoverPass = $this->recoverPass($id);
                $user->setPassword($recoverPass[0]['password']); 
            
            }
           
            $em->flush();
            $this->addFlash(
    		    'success',
    		    'Datos Actualizados Correctamente'
    		);

            return $this->redirectToRoute('mantenedor_user_show', array('id' => $user->getId()));
        }

        return $this->render('User/edit.html.twig', array(
            'user' => $user,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }
    #[Route('mantenedor/user/user-save', name: 'mantenedor_user_save')]

    public function save(Request $request,ManagerRegistry $em,UserPasswordHasherInterface $encoder): Response
    {
        $rut      = $request->request->get('rutPersona');
    	$nombre   = $request->request->get('nombrePersona');
    	$apellido = $request->request->get('apellidoPersona');
    	$correo   = $request->request->get('correoPersona');
    	$gender   = $request->request->get('sexoPersona');
    	$phone    = $request->request->get('phonePersona');
    	$username = $request->request->get('username');
    	$password = $request->request->get('password');
    	$roles    = $request->request->get('rol');

        try {
    		$em = $em->getManager();

    		$status     = $em->getRepository(Status::class)->findOneById(1);
            $usuarioObj = $em->getRepository(User::class)->findOneByUsername(strtolower($username));
    		$persona    = $em->getRepository(Persona::class)->findOneByRut($rut);

    		if ($usuarioObj) {
    			$this->addFlash(
    			    'error',
    			    'El Nombre de Usuario ya Existe, ingrese uno distinto.'
    			);
    			return $this->redirectToRoute('mantenedor_user_create');
    		}

            if (!$persona) {
    		    $persona = new Persona();
                $persona->setRut($rut);
    			$status = $em->getRepository(Status::class)->findOneById(1);
    			$persona->setStatus($status);
            }

    		$persona->setName($nombre)
    		->setLastName($apellido)
    		->setRut($rut)
    		->setStatus($status)
    		->setMail($correo)
    		->setPhone($phone)
    		->setGender($gender);

    		$em->persist($persona);

    		$usuario = new User();

    		//$encoder  = $this->container->get('security.password_encoder');
    		//$encoded  = $encoder->encodePassword($usuario, $password);
            $encoded =  $encoder->hashPassword($usuario, $password);
          
    		$usuario->setUsername(strtolower($username))
    		->setPassword($encoded)
    		->setDateCreated(new \DateTime())
    		->setStatus($status)
    		->setPersona($persona);

    		$em->persist($usuario);

            //foreach ($roles as $rol) {
                $rolObj = $em->getRepository(Rol::class)->findOneById($roles);
                $usuario->addRol($rolObj);
          //  }

    		$em->flush();

    		$this->addFlash(
    		    'success',
    		    'Usuario '.$nombre.' '.$apellido.' Creado Correctamente'
    		);
            return $this->redirectToRoute('mantenedor_user_create');

    	} catch (\Exception $e) {
    		$this->addFlash(
    		    'error',
    		    'Ocurrio un Error al crear el Usuario, vuelva a intentarlo, error:'.$e->getMessage()
    		);
    	}

    
      
    }
    #[Route('mantenedor/user-show/{id}', name: 'mantenedor_user_show')]

    public function showAction(User $user): Response
    {
        $deleteForm = $this->createDeleteForm($user);

        return $this->render('User/show.html.twig', array(
            'user' => $user,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    #[Route('mantenedor/delete/{id}', name: 'mantenedor_user_delete')]
    public function deleteAction(User $user,ManagerRegistry $em): Response{
		$em = $em->getManager();
		try {
			$status = $em->getRepository(Status::class)->findOneById(2);
			$user->setStatus($status);

			$em->persist($user);
            $em->flush();
            
            $this->addFlash(
                'success',
                'Datos Eliminados Correctamente');

			return $this->redirectToRoute('mantenedor_user_index');
		} catch (\Exception $e) {
			return $this->redirectToRoute('mantenedor_user_index');
        }
       
	}
    #[Route('mantenedor/user/find/{rut}', name: 'mantenedor_user_find')]
    public function find(Persona $persona,ManagerRegistry $em,SerializerInterface $serializer): Response
    {
        $em = $em->getManager();
        $user = $em->getRepository(User::class)->findOneByPersona($persona);

        if ($user) {
            return new JsonResponse(['state' => 500]);
        }

        $response = $serializer->serialize($persona,'json');
        return new JsonResponse(['persona' => $response]);
    }
    private function createDeleteForm(User $user)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('mantenedor_user_delete', array('id' => $user->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }

}
