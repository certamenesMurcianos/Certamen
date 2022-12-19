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
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use Symfony\Component\Security\Csrf\CsrfTokenManagerInterface;
use Symfony\Component\Security\Http\Util\TargetPathTrait;

class TestController extends AbstractController
{

    use TargetPathTrait;

    public const LOGIN_ROUTE = 'app_login';

    private $entityManager;
    private $urlGenerator;
    private $csrfTokenManager;
    private $passwordEncoder;

    public function __construct(EntityManagerInterface $entityManager, UrlGeneratorInterface $urlGenerator, CsrfTokenManagerInterface $csrfTokenManager, UserPasswordEncoderInterface $passwordEncoder)
    {
        $this->entityManager = $entityManager;
        $this->urlGenerator = $urlGenerator;
        $this->csrfTokenManager = $csrfTokenManager;
        $this->passwordEncoder = $passwordEncoder;
    }

    public function supports(Request $request)
    {
        return self::LOGIN_ROUTE === $request->attributes->get('_route')
            && $request->isMethod('POST');
    }

     public function getCredentials(Request $request)
    {
        $credentials = [
            'email' => $request->request->get('email'),
            'password' => $request->request->get('password'),
            'csrf_token' => $request->request->get('_csrf_token'),
        ];
        $request->getSession()->set(
            Security::LAST_USERNAME,
            $credentials['email']
        );

        return $credentials;
    }

    
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