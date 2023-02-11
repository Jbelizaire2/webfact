<?php

namespace App\Entity;

use App\Repository\UserRepository;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\PasswordAuthenticatedUserInterface;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Entity(repositoryClass=UserRepository::class)
 */
class User implements UserInterface, PasswordAuthenticatedUserInterface, \Serializable
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;
    /**
    * @var \Persona
    *
    * @ORM\ManyToOne(targetEntity="Persona", cascade={"persist"})
    * @ORM\JoinColumns({
    * @ORM\JoinColumn(name="id_persona", referencedColumnName="id")
    * })
    */
    private $persona;
    /**
     * @var \App\Entity\Rol
     *
     * @ORM\ManyToOne(targetEntity="App\Entity\Rol",inversedBy="Rol")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_rol", referencedColumnName="id")
     * })
     */
    private $rol;
    /**
     * @ORM\Column(type="string", length=180, unique=true)
     */
    private $email;
   

    /**
     * @var string The hashed password
     * @ORM\Column(type="string")
     */
    private $password;
    
    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date_created", type="datetime", nullable=true)
     */
    private $dateCreated;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date_deleted", type="datetime", nullable=true)
     */
    private $dateDeleted;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date_last_login", type="datetime", nullable=true)
     */
    private $dateLastLogin;
    /**
    * @var string
    * @ORM\Column(name="username", type="string", length=255, nullable=true)
    */
   private $username;
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
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="Rol", inversedBy="Rol")
     * @ORM\JoinTable(name="user_roles",
     *   joinColumns={
     *     @ORM\JoinColumn(name="id_user", referencedColumnName="id")
     *   },
     *   inverseJoinColumns={
     *     @ORM\JoinColumn(name="id_rol", referencedColumnName="id")
     *   }
     * )
     */

    private $roles = [];

    /**
    * @ORM\Column(name="api_token",type="string", unique=true, nullable=true)
    */
    private $apiToken;

    public function __construct()
    {
        $this->roles = new \Doctrine\Common\Collections\ArrayCollection();
    }
    
    public function getId(): ?int
    {
        return $this->id;
    }

    /**
     * @param Persona $persona
     *
     * @return self
     */
    public function setPersona(Persona $persona)
    {
        $this->persona = $persona;

        return $this;
    }


    public function getEmail(): ?string
    {
        return $this->email;
    }
 

    public function setEmail(string $email): self
    {
        $this->email = $email;

        return $this;
    }
/**
     * @return string
     */
    public function getUsername()
    {
        return $this->username;
    }
   /**
     * @return Persona
     */
    public function getPersona()
    {
        return $this->persona;
    }

    /**
     * @param string $username
     *
     * @return self
     */
    public function setUsername($username)
    {
        $this->username = $username;

        return $this;
    }
    /**
     * The public representation of the user (e.g. a username, an email address, etc.)
     *
     * @see UserInterface
     */
    public function getUserIdentifier(): string
    {
        return (string) $this->username;
    }

    /**
     * @see UserInterface
     */
      /**
     * @return \App\Entity\Rol
     */
    public function getRol()
    {
        return $this->rol;
    }

    /**
     * @param \App\Entity\Rol $rol
     *
     * @return self
     */
    public function setRol($rol)
    {
        $this->rol = $rol;

        return $this;
    }

    public function addRol($rol){
        $this->roles[] = $rol;
    }

    /**
     * @param \App\Entity\Rol $rol
     */
    public function removeRol( $rol)
    {
        if (!$this->roles->contains($rol)) {
            return;
        }    
        $this->roles->removeElement($rol);
    }


    /**
     * Get rol
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getRoles(): array
    {
       $roles = [];
       
        foreach ($this->roles->toArray() as $rol) {
            $roles[] = $rol->getName();
        }
        return $roles;
    }

    public function setRoles(array $roles): self
    {
        $this->roles = $roles;

        return $this;
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
    public function setStatus($status)
    {
        $this->status = $status;

        return $this;
    }
    
    
    /**
     * @see PasswordAuthenticatedUserInterface
     */
    public function getPassword(): string
    {
        return $this->password;
    }

    public function setPassword(string $password): self
    {
        $this->password = $password;

        return $this;
    }
 /**
     * @return \DateTime
     */
    public function getDateCreated()
    {
        return $this->dateCreated;
    }

    /**
     * @param \DateTime $dateCreated
     *
     * @return User
     */
    public function setDateCreated(\DateTime $dateCreated)
    {
        $this->dateCreated = $dateCreated;

        return $this;
    }
    

    /**
     * @return \DateTime
     */
    public function getDateDeleted()
    {
        return $this->dateDeleted;
    }

    /**
     * @param \DateTime $dateDeleted
     *
     * @return self
     */
    public function setDateDeleted(\DateTime $dateDeleted)
    {
        $this->dateDeleted = $dateDeleted;

        return $this;
    }

    /**
     * @return \DateTime
     */
    public function getDateLastLogin()
    {
        return $this->dateLastLogin;
    }

    /**
     * @param \DateTime $dateLastLogin
     *
     * @return self
     */
    public function setDateLastLogin(\DateTime $dateLastLogin)
    {
        $this->dateLastLogin = $dateLastLogin;

        return $this;
    }
    public function geToken(): ?string
    {
        return $this->apiToken;
    }
    /**
     * @param string $apiToken
     *
     * @return self
     */
    public function setapiToken(string $apiToken): self
    {
        $this->apiToken = $apiToken;

        return $this;
    }

    /**
     * Returning a salt is only needed, if you are not using a modern
     * hashing algorithm (e.g. bcrypt or sodium) in your security.yaml.
     *
     * @see UserInterface
     */
    public function getSalt(): ?string
    {
        return null;
    }

    /**
     * @see UserInterface
     */
    public function eraseCredentials()
    {
        // If you store any temporary, sensitive data on the user, clear it here
        // $this->plainPassword = null;
    }
    
    public function serialize()
    {
        return serialize(array(
            $this->id,
            $this->username,
            $this->password,
            // see section on salt below
            // $this->salt,
        ));
    }

    public function unserialize($serialized)
    {
        list (
            $this->id,
            $this->username,
            $this->password,
            // see section on salt below
            // $this->salt
        ) = unserialize($serialized, array('allowed_classes' => false));
    }
      /**
     * @ORM\PrePersist
     * @ORM\PreUpdate
     */
    public function setDateCreatedValue()
    {
        $this->dateCreated = new \DateTime();
    }
}