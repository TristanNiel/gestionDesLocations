<?php

namespace App\DataFixtures;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use App\Entity\User;
use App\Entity\Residence;
use App\Entity\Rent;
use DateInterval;
use Symfony\Component\Validator\Constraints\Date;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        $char = "abcdefghijklmnopqrstuvwxyz";
        $number = "0123456789";

        // Generating Owner
        $owner = new User();
        $owner->setRole("ROLE_OWNER");
        $owner->setEmail(str_shuffle($char));
        $owner->setPassword(str_shuffle($char));
        $owner->setIsVerified(1);
        $manager->persist($owner);

        //Generating Representative
        for ($i = 0; $i < 2; $i++) {
            $user = new User();
            $user->setRole("ROLE_REPRESENTATIVE");
            $user->setEmail(str_shuffle($char));
            $user->setPassword(str_shuffle($char));
            $user->setIsVerified(1);
            $manager->persist($user);
            if ($i == 0) {
                $representative1 = $user;
            } else {
                $representative2 = $user;
            }
        }

        $tenant_array = [];
        //Generating Tenant
        for ($i = 0; $i < 5; $i++) {
            $user = new User();
            $user->setRole("ROLE_TENANT");
            $user->setEmail(str_shuffle($char));
            $user->setPassword(str_shuffle($char));
            $user->setIsVerified(1);
            $manager->persist($user);
            array_push($tenant_array, $user);
        }

        $residence_name = ["Residence 1", "Residence 2", "Residence 3"];
        $residence_array = [];
        //Generating Residence
        for ($i = 0; $i < 3; $i++) {
            $residence = new Residence();
            $residence->setName($residence_name[$i]);
            $residence->setAdress(str_shuffle($char));
            $residence->setCity(str_shuffle($char));
            $residence->setZipCode(str_shuffle($number));
            $residence->setCountry("France");
            $residence->setInventoryFile(str_shuffle($char));
            $residence->setOwnerId($owner);
            if ($i < 1) {
                $residence->setRepresentativeId($representative1);
            } else {
                $residence->setRepresentativeId($representative2);
            }
            $manager->persist($residence);
            array_push($residence_array, $residence);
        }


        //Generating Rent
        for ($i = 0; $i < 5; $i++) {
            $rent = new Rent();
            $rent->setResidenceId($residence_array[random_int(0, 2)]);
            $rent->setTenantId($tenant_array[random_int(0, 4)]);
            $rent->setInventoryFile(str_shuffle($char));
            $date = new \DateTime();
            $date->setTimestamp(mt_rand(1, time()));
            $rent->setArrivalDate($date);
            $rent->setDepartureDate($date->add(new DateInterval("P1D")));
            $rent->setTenantComments(str_shuffle($char));
            $rent->setTenantValidatedAt(str_shuffle($char));
            $rent->setTenantSignature(str_shuffle($char));
            $rent->setRepresentativeComments(str_shuffle($char));
            $rent->setRepresentativeSignature(str_shuffle($char));
            $rent->setRepresentativeValidatedAt($date);
            $manager->persist($rent);


        $manager->flush();
    }
}
