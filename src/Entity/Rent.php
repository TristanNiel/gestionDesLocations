<?php

namespace App\Entity;

use App\Repository\RentRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: RentRepository::class)]
class Rent
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\ManyToOne(targetEntity: User::class, inversedBy: 'rents')]
    private $tenant_id;

    #[ORM\ManyToOne(targetEntity: Residence::class, inversedBy: 'rents')]
    private $residence_id;

    #[ORM\Column(type: 'string', length: 255)]
    private $inventory_file;

    #[ORM\Column(type: 'datetime')]
    private $arrival_date;

    #[ORM\Column(type: 'datetime')]
    private $departure_date;

    #[ORM\Column(type: 'text')]
    private $tenant_comments;

    #[ORM\Column(type: 'string', length: 255)]
    private $tenant_signature;

    #[ORM\Column(type: 'string', length: 45)]
    private $tenant_validated_at;

    #[ORM\Column(type: 'text')]
    private $representative_comments;

    #[ORM\Column(type: 'string', length: 255)]
    private $representative_signature;

    #[ORM\Column(type: 'datetime')]
    private $representative_validated_at;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTenantId(): ?User
    {
        return $this->tenant_id;
    }

    public function setTenantId(?User $tenant_id): self
    {
        $this->tenant_id = $tenant_id;

        return $this;
    }

    public function getResidenceId(): ?Residence
    {
        return $this->residence_id;
    }

    public function setResidenceId(?Residence $residence_id): self
    {
        $this->residence_id = $residence_id;

        return $this;
    }

    public function getInventoryFile(): ?string
    {
        return $this->inventory_file;
    }

    public function setInventoryFile(string $inventory_file): self
    {
        $this->inventory_file = $inventory_file;

        return $this;
    }

    public function getArrivalDate(): ?\DateTimeInterface
    {
        return $this->arrival_date;
    }

    public function setArrivalDate(\DateTimeInterface $arrival_date): self
    {
        $this->arrival_date = $arrival_date;

        return $this;
    }

    public function getDepartureDate(): ?\DateTimeInterface
    {
        return $this->departure_date;
    }

    public function setDepartureDate(\DateTimeInterface $departure_date): self
    {
        $this->departure_date = $departure_date;

        return $this;
    }

    public function getTenantComments(): ?string
    {
        return $this->tenant_comments;
    }

    public function setTenantComments(string $tenant_comments): self
    {
        $this->tenant_comments = $tenant_comments;

        return $this;
    }

    public function getTenantSignature(): ?string
    {
        return $this->tenant_signature;
    }

    public function setTenantSignature(string $tenant_signature): self
    {
        $this->tenant_signature = $tenant_signature;

        return $this;
    }

    public function getTenantValidatedAt(): ?string
    {
        return $this->tenant_validated_at;
    }

    public function setTenantValidatedAt(string $tenant_validated_at): self
    {
        $this->tenant_validated_at = $tenant_validated_at;

        return $this;
    }

    public function getRepresentativeComments(): ?string
    {
        return $this->representative_comments;
    }

    public function setRepresentativeComments(string $representative_comments): self
    {
        $this->representative_comments = $representative_comments;

        return $this;
    }

    public function getRepresentativeSignature(): ?string
    {
        return $this->representative_signature;
    }

    public function setRepresentativeSignature(string $representative_signature): self
    {
        $this->representative_signature = $representative_signature;

        return $this;
    }

    public function getRepresentativeValidatedAt(): ?\DateTimeInterface
    {
        return $this->representative_validated_at;
    }

    public function setRepresentativeValidatedAt(\DateTimeInterface $representative_validated_at): self
    {
        $this->representative_validated_at = $representative_validated_at;

        return $this;
    }
}
