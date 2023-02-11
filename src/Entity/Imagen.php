<?php

namespace App\Entity;

use Symfony\Component\Validator\Constraints as Assert;
use Doctrine\ORM\Mapping as ORM;

/**
 * Imagen
 *
 * @ORM\Table(name="imagen")
 * @ORM\Entity
 * 
 */
class Imagen
{

    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="titulo", type="string", length=50)
     * @Assert\NotNull(message="Ingresar titulo de la Imagen")
     */
    private $tituloImagen;


    /**
     * @var string
     *
     * @ORM\Column(name="descripcion", type="string", length=255)
     * @Assert\NotNull(message="Debe escribir descripcion")
     */
    private $descripcion;


    /**
     * @var string
     *
     * @ORM\Column(name="archivo", type="string", length=250)
     * 
     */
    private $archivo;
 /**
     * @var \App\Entity\Status
     *
     * @ORM\ManyToOne(targetEntity="App\Entity\Status")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_status", referencedColumnName="id")
     * })
     */
    private $status;

   
     /**
     * @var integer
     *
     * @ORM\Column(name="user_id", type="integer")
     * 
     * 
     */
       private $user;


    /**
     * @var string
     *
     * @ORM\Column(name="url", type="string", length=250)
     * 
     */
    private $url;
    /**
     * Get id
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }



    /**
     * Set tituloImagen
     *
     * @param string $tituloImagen
     *
     * @return Imagen
     */
    public function settituloImagen($tituloImagen)
    {
        $this->tituloImagen = $tituloImagen;

        return $this;
    }

    /**
     * Get tituloImagen
     *
     * @return string
     */
    public function gettituloImagen()
    {
        return $this->tituloImagen;
    }

    
    /**
     * Set descripcion
     *
     * @param string $descripcion
     *
     * @return Imagen
     */
    public function setDescripcion($descripcion)
    {
        $this->descripcion = $descripcion;

        return $this;
    }

    /**
     * Get descripcion
     *
     * @return string
     */
    public function getDescripcion()
    {
        return $this->descripcion;
    }

    
    /**
     * Set archivo
     *
     * @param string $archivo
     *
     * @return Imagen
     */
    public function setArchivo($archivo)
    {
        $this->archivo = $archivo;

        return $this;
    }

    /**
     * Get archivo
     *
     * @return string
     */
    public function getArchivo()
    {
        return $this->archivo;
    }

    /**
     * @return \App\Entity\Status
     */
    public function getStatus()
    {
        return $this->status;
    }

    /**
     * @param \App\Entity\Status $status
     *
     * @return self
     */
    public function setStatus(\App\Entity\Status $status)
    {
        $this->status = $status;

        return $this;
    }
    
    public function getUser()
    {
        return $this->user;
    }

    public function setUser( $user)
    {
        $this->user = $user;

        return $this;
    }
     
    public function setUrl($url)
    {
        $this->url = $url;

        return $this;
    }

    /**
     * Get url
     *
     * @return string
     */
    public function getUrl()
    {
        return $this->url;
    }
    
}

