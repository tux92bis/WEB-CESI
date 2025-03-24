<?php
// Définir le chemin racine de l'application
define('ROOT_PATH', dirname(__DIR__));

// Activer l'affichage des erreurs pendant le développement
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Inclure la configuration de la base de données
require_once(ROOT_PATH . '/config/database.php');

// Routage simple
$controller = isset($_GET['controller']) ? $_GET['controller'] : 'login';
$action = isset($_GET['action']) ? $_GET['action'] : 'index';

// Charger le contrôleur approprié
$controllerName = ucfirst($controller) . 'Controller';
$controllerFile = ROOT_PATH . "/controllers/{$controllerName}.php";

if (file_exists($controllerFile)) {
    require_once($controllerFile);
    $controller = new $controllerName();
    $controller->$action();
} else {
    // Gérer l'erreur 404
    header("HTTP/1.0 404 Not Found");
    exit('Page non trouvée');
}