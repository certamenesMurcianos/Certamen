<?php
namespace App\Controller;

use App\Controller\LoginController;
use App\Entity\User;
use App\Repository\UserRepository;
use App\Form\UserType;
use App\Entity\BandasDeMusica;
use App\Repository\BandasDeMusicaRepository;
use App\Form\BandasDeMusicaType;
use App\Entity\Prueba;
use App\Form\PruebaType;
use App\Repository\PruebaRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Security;
use Symfony\Component\HttpFoundation\Session\Session;


class TestController extends AbstractController
{
    /**
     * @Route("/private/test", name="private_test", methods={"GET", "POST"})
     */
    public function privada()
    {
        $session = new Session();
        $session->start();
        
        $bandaRepository = $this->getDoctrine()->getManager();
        $id = $session->get('id');
        $banda = $bandaRepository->getRepository(BandasDeMusica::class)->findOneBy(['id' => $id]);
        
        $banda_id = $banda->getId();
        return $this->redirectToRoute('app_bandas_de_musica_show', [
            'id' => $banda_id,
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