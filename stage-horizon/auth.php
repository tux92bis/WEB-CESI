<?php
session_start();
require_once 'db.php';

function authentifierUtilisateur($email, $motDePasse) {
    global $pdo;

    $requete = $pdo->prepare("SELECT * FROM Utilisateur WHERE email = :email");
    $requete->execute(['email' => $email]);
    $utilisateur = $requete->fetch(PDO::FETCH_ASSOC);

    if ($utilisateur && password_verify($motDePasse, $utilisateur['mot_de_passe'])) {
        return $utilisateur;
    }
    return false;
}

function estConnecte() {
    return isset($_SESSION['utilisateur']);
}

function rediriger($url) {
    header("Location: $url");
    exit();
}
?>