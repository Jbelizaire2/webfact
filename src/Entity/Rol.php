<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\Collection;
use Doctrine\Common\Collections\ArrayCollection;
use App\Entity\RolesUser;

/**
 * Rol
 *
 * @ORM\Table(name="rol", indexes={@ORM\Index(name="rol_id_status", columns={"id_status"})})
 * @ORM\Entity
 */
class Rol
{
    /**
     * @var string
     *
     * @ORM\Column(name="name", type="string", length=255, nullable=true)
     */
    private $name;

    /**
     * @var string
     *
     * @ORM\Column(name="name_public", type="string", length=255, nullable=true)
     */
    private $namePublic;

    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

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
     * Constructor
     */
    public function __construct()
    {
        $this->user = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * @param string $name
     *
     * @return self
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }


    /**
     * @return string
     */
    public function getNamePublic()
    {
        return $this->namePublic;
    }

    /**
     * @param string $namePublic
     *
     * @return self
     */
    public function setNamePublic($namePublic)
    {
        $this->namePublic = $namePublic;

        return $this;
    }

    /**
     * @return integer
     */
    public function getId()
    {
        return $this->id;
        
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
  
    public function __toString() {
   
        return $this->getNamePublic();
        return $this->getName();
       
     }
}

