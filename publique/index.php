<?php
require_once('../config/database.php');

// Routage simple
$controller = isset($_GET['controller']) ? $_GET['controller'] : 'login';
$action = isset($_GET['action']) ? $_GET['action'] : 'index';

// Charger le contrôleur approprié
$controllerName = ucfirst($controller) . 'Controller';
$controllerFile = "../controllers/{$controllerName}.php";

if (file_exists($controllerFile)) {
    require_once($controllerFile);
    $controller = new $controllerName();
    $controller->$action();
} else {
    // Gérer l'erreur 404
    header("HTTP/1.0 404 Not Found");
    exit('Page non trouvée');
}