<?php
class UserModel
{
    private $db;

    public function __construct()
    {
        $this->db = Database::getInstance()->getConnection();
    }

    public function verifyUser($username, $password)
    {
        try {
            $stmt = $this->db->prepare("SELECT * FROM users WHERE username = ? AND password = ?");
            $stmt->execute([$username, hash('sha256', $password)]);
            return $stmt->fetch() !== false;
        } catch (PDOException $e) {
            error_log("Erreur de connexion : " . $e->getMessage());
            return false;
        }
    }
}