<?php

namespace App\Entity;

use App\Repository\UserRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: UserRepository::class)]
class User
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 255)]
    private $role;

    #[ORM\Column(type: 'string', length: 45)]
    private $email;

    #[ORM\Column(type: 'string', length: 255)]
    private $password;

    #[ORM\Column(type: 'smallint')]
    private $is_verified;

    #[ORM\OneToMany(mappedBy: 'owner_id', targetEntity: Residence::class)]
    private $representative_id;

    #[ORM\OneToMany(mappedBy: 'representative_id', targetEntity: Residence::class)]
    private $residences;

    #[ORM\OneToMany(mappedBy: 'tenant_id', targetEntity: Rent::class)]
    private $rents;

    public function __construct()
    {
        $this->representative_id = new ArrayCollection();
        $this->residences = new ArrayCollection();
        $this->rents = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getRole(): ?string
    {
        return $this->role;
    }

    public function setRole(string $role): self
    {
        $this->role = $role;

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

    public function getPassword(): ?string
    {
        return $this->password;
    }

    public function setPassword(string $password): self
    {
        $this->password = $password;

        return $this;
    }

    public function getIsVerified(): ?int
    {
        return $this->is_verified;
    }

    public function setIsVerified(int $is_verified): self
    {
        $this->is_verified = $is_verified;

        return $this;
    }

    /**
     * @return Collection|Residence[]
     */
    public function getRepresentativeId(): Collection
    {
        return $this->representative_id;
    }

    public function addRepresentativeId(Residence $representativeId): self
    {
        if (!$this->representative_id->contains($representativeId)) {
            $this->representative_id[] = $representativeId;
            $representativeId->setOwnerId($this);
        }

        return $this;
    }

    public function removeRepresentativeId(Residence $representativeId): self
    {
        if ($this->representative_id->removeElement($representativeId)) {
            // set the owning side to null (unless already changed)
            if ($representativeId->getOwnerId() === $this) {
                $representativeId->setOwnerId(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|Residence[]
     */
    public function getResidences(): Collection
    {
        return $this->residences;
    }

    public function addResidence(Residence $residence): self
    {
        if (!$this->residences->contains($residence)) {
            $this->residences[] = $residence;
            $residence->setRepresentativeId($this);
        }

        return $this;
    }

    public function removeResidence(Residence $residence): self
    {
        if ($this->residences->removeElement($residence)) {
            // set the owning side to null (unless already changed)
            if ($residence->getRepresentativeId() === $this) {
                $residence->setRepresentativeId(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|Rent[]
     */
    public function getRents(): Collection
    {
        return $this->rents;
    }

    public function addRent(Rent $rent): self
    {
        if (!$this->rents->contains($rent)) {
            $this->rents[] = $rent;
            $rent->setTenantId($this);
        }

        return $this;
    }

    public function removeRent(Rent $rent): self
    {
        if ($this->rents->removeElement($rent)) {
            // set the owning side to null (unless already changed)
            if ($rent->getTenantId() === $this) {
                $rent->setTenantId(null);
            }
        }

        return $this;
    }
}
