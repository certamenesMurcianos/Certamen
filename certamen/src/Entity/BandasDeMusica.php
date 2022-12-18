<?php

namespace App\Entity;

use App\Repository\BandasDeMusicaRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=BandasDeMusicaRepository::class)
 */
class BandasDeMusica
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $nombre;

    /**
     * @ORM\Column(type="integer")
     */
    private $numero_de_musicos;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $nombre_director;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $pueblo;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $provincia;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $codigo_postal;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $telefono;



    /**
     * @ORM\ManyToOne(targetEntity=Certamenes::class, inversedBy="bandas")
     */
    private $certamenes;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $correo_electronico;

    /**
     * @ORM\OneToOne(targetEntity=User::class, inversedBy="bandasDeMusica", cascade={"persist", "remove"})
     */
    private $usuario;


    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNombre(): ?string
    {
        return $this->nombre;
    }

    public function setNombre(string $nombre): self
    {
        $this->nombre = $nombre;

        return $this;
    }

    public function getNumeroDeMusicos(): ?int
    {
        return $this->numero_de_musicos;
    }

    public function setNumeroDeMusicos(int $numero_de_musicos): self
    {
        $this->numero_de_musicos = $numero_de_musicos;

        return $this;
    }

    public function getNombreDirector(): ?string
    {
        return $this->nombre_director;
    }

    public function setNombreDirector(string $nombre_director): self
    {
        $this->nombre_director = $nombre_director;

        return $this;
    }

    public function getPueblo(): ?string
    {
        return $this->pueblo;
    }

    public function setPueblo(string $pueblo): self
    {
        $this->pueblo = $pueblo;

        return $this;
    }

    public function getProvincia(): ?string
    {
        return $this->provincia;
    }

    public function setProvincia(string $provincia): self
    {
        $this->provincia = $provincia;

        return $this;
    }

    public function getCodigoPostal(): ?string
    {
        return $this->codigo_postal;
    }

    public function setCodigoPostal(string $codigo_postal): self
    {
        $this->codigo_postal = $codigo_postal;

        return $this;
    }

    public function getTelefono(): ?string
    {
        return $this->telefono;
    }

    public function setTelefono(string $telefono): self
    {
        $this->telefono = $telefono;

        return $this;
    }


    public function getCertamenes(): ?Certamenes
    {
        return $this->certamenes;
    }

    public function setCertamenes(?Certamenes $certamenes): self
    {
        $this->certamenes = $certamenes;

        return $this;
    }

    public function getCorreoElectronico(): ?string
    {
        return $this->correo_electronico;
    }

    public function setCorreoElectronico(string $correo_electronico): self
    {
        $this->correo_electronico = $correo_electronico;

        return $this;
    }

    public function getUsuario(): ?User
    {
        return $this->usuario;
    }

    public function setUsuario(?User $usuario): self
    {
        $this->usuario = $usuario;

        return $this;
    }

}
