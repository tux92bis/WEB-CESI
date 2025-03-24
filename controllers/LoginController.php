<?php
class LoginController
{
    private $userModel;

    public function __construct()
    {
        require_once(ROOT_PATH . '/models/UserModel.php');
        $this->userModel = new UserModel();
    }

    public function index()
    {
        // Afficher la page de connexion
        require_once(ROOT_PATH . '/views/layouts/default.php');
    }

    public function authenticate()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $username = $_POST['username'];
            $password = $_POST['password'];

            if ($this->userModel->verifyUser($username, $password)) {
                // Démarrer la session et rediriger
                session_start();
                $_SESSION['user'] = $username;
                header('Location: /dashboard');
            } else {
                // Rediriger vers la page de connexion avec une erreur
                header('Location: /?error=1');
            }
        }
    }
}