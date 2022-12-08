<?php

namespace App\Entity;

use App\Repository\CertamenesRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=CertamenesRepository::class)
 */
class Certamenes
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
     * @ORM\Column(type="date")
     */
    private $fecha;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $lugar;

    /**
     * @ORM\OneToMany(targetEntity=BandasDeMusica::class, mappedBy="certamenes")
     */
    private $bandas;

    public function __construct()
    {
        $this->bandas = new ArrayCollection();
    }


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

    public function getFecha(): ?\DateTimeInterface
    {
        return $this->fecha;
    }

    public function setFecha(\DateTimeInterface $fecha): self
    {
        $this->fecha = $fecha;

        return $this;
    }

    public function getLugar(): ?string
    {
        return $this->lugar;
    }

    public function setLugar(string $lugar): self
    {
        $this->lugar = $lugar;

        return $this;
    }

    /**
     * @return Collection<int, BandasDeMusica>
     */
    public function getBandas(): Collection
    {
        return $this->bandas;
    }

    public function addBanda(BandasDeMusica $banda): self
    {
        if (!$this->bandas->contains($banda)) {
            $this->bandas[] = $banda;
            $banda->setCertamenes($this);
        }

        return $this;
    }

    public function removeBanda(BandasDeMusica $banda): self
    {
        if ($this->bandas->removeElement($banda)) {
            // set the owning side to null (unless already changed)
            if ($banda->getCertamenes() === $this) {
                $banda->setCertamenes(null);
            }
        }

        return $this;
    }

    
}
