<?php
namespace App\Controller;

use App\Entity\User;
use App\Repository\UserRepository;
use App\Form\UserType;
use App\Entity\Prueba;
use App\Form\PruebaType;
use App\Repository\PruebaRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;


class TestController extends AbstractController
{
    /**
     * @Route("/private/test", name="private_test")
     */
    public function privada(): Response
    {
        // $banda_id = getBanda();
        $banda=$bandaRepository->findOneBy(['id'=>$id]);
        $banda_id=$banda->getId();
        return $this->redirectToRoute('app_bandas_de_musica_show',[
            'id' => $banda_id
        ]);
    }
    
    /**
     * @Route("/public/test", name="public_test")
     */
    public function publica(): Response
    {
        return $this->redirectToRoute('app_bandas_de_musica_index');
    }
}