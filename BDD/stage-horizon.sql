CREATE DATABASE IF NOT EXISTS gestion_stages;
USE gestion_stages;

CREATE TABLE Utilisateur (
    id_utilisateur INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prénom VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    mot_de_passe VARCHAR(255) NOT NULL,
    rôle ENUM('étudiant', 'pilote', 'admin') NOT NULL
);

CREATE TABLE Étudiant (
    id_étudiant INT AUTO_INCREMENT PRIMARY KEY,
    id_utilisateur INT NOT NULL,
    compétences TEXT,
    statut_recherche ENUM('en cours', 'terminée') DEFAULT 'en cours',
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateur(id_utilisateur)
);

CREATE TABLE PilotePromotion (
    id_pilote INT AUTO_INCREMENT PRIMARY KEY,
    id_utilisateur INT NOT NULL,
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateur(id_utilisateur)
);

CREATE TABLE Administrateur (
    id_admin INT AUTO_INCREMENT PRIMARY KEY,
    id_utilisateur INT NOT NULL,
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateur(id_utilisateur)
);

CREATE TABLE Entreprise (
    id_entreprise INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    description TEXT,
    email VARCHAR(100) NOT NULL,
    téléphone VARCHAR(20),
    nombre_stagiaires INT DEFAULT 0,
    moyenne_évaluations DECIMAL(3, 2) DEFAULT 0.00
);

CREATE TABLE OffreStage (
    id_offre INT AUTO_INCREMENT PRIMARY KEY,
    id_entreprise INT NOT NULL,
    id_pilote INT,
    id_admin INT,
    titre VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    compétences TEXT,
    base_rémunération DECIMAL(10, 2),
    date_début DATE NOT NULL,
    date_fin DATE NOT NULL,
    nombre_candidatures INT DEFAULT 0,
    FOREIGN KEY (id_entreprise) REFERENCES Entreprise(id_entreprise),
    FOREIGN KEY (id_pilote) REFERENCES PilotePromotion(id_pilote),
    FOREIGN KEY (id_admin) REFERENCES Administrateur(id_admin)
);

CREATE TABLE Candidature (
    id_candidature INT AUTO_INCREMENT PRIMARY KEY,
    id_étudiant INT NOT NULL,
    id_offre INT NOT NULL,
    date_candidature DATE NOT NULL,
    cv VARCHAR(255) NOT NULL,
    lettre_motivation TEXT NOT NULL,
    statut ENUM('en attente', 'acceptée', 'refusée') DEFAULT 'en attente',
    FOREIGN KEY (id_étudiant) REFERENCES Étudiant(id_étudiant),
    FOREIGN KEY (id_offre) REFERENCES OffreStage(id_offre)
);

CREATE TABLE Favoris (
    id_favoris INT AUTO_INCREMENT PRIMARY KEY,
    id_étudiant INT NOT NULL,
    id_offre INT NOT NULL,
    FOREIGN KEY (id_étudiant) REFERENCES Étudiant(id_étudiant),
    FOREIGN KEY (id_offre) REFERENCES OffreStage(id_offre)
);


INSERT INTO Utilisateur (nom, prénom, email, mot_de_passe, rôle) VALUES
('Dupont', 'Jean', 'jean.dupont@example.com', 'motdepasse1', 'étudiant'),
('Martin', 'Alice', 'alice.martin@example.com', 'motdepasse2', 'pilote'),
('Durand', 'Paul', 'paul.durand@example.com', 'motdepasse3', 'admin'),
('Leroy', 'Sophie', 'sophie.leroy@example.com', 'motdepasse4', 'étudiant'),
('Moreau', 'Luc', 'luc.moreau@example.com', 'motdepasse5', 'étudiant'),
('Petit', 'Emma', 'emma.petit@example.com', 'motdepasse6', 'étudiant'),
('Roux', 'Hugo', 'hugo.roux@example.com', 'motdepasse7', 'étudiant'),
('Fournier', 'Léa', 'lea.fournier@example.com', 'motdepasse8', 'étudiant'),
('Girard', 'Nathan', 'nathan.girard@example.com', 'motdepasse9', 'étudiant'),
('Lefebvre', 'Chloé', 'chloe.lefebvre@example.com', 'motdepasse10', 'étudiant');

INSERT INTO Étudiant (id_utilisateur, compétences, statut_recherche) VALUES
(1, 'PHP, JavaScript, SQL', 'en cours'),
(4, 'Python, Data Analysis', 'en cours'),
(5, 'Java, Spring Boot', 'terminée'),
(6, 'React, Node.js', 'en cours'),
(7, 'C#, .NET', 'en cours'),
(8, 'UI/UX Design, Figma', 'terminée'),
(9, 'DevOps, Docker', 'en cours'),
(10, 'Angular, TypeScript', 'en cours');

INSERT INTO PilotePromotion (id_utilisateur) VALUES
(2);

INSERT INTO Administrateur (id_utilisateur) VALUES
(3);

INSERT INTO Entreprise (nom, description, email, téléphone) VALUES
('TechCorp', 'Entreprise spécialisée en développement logiciel.', 'contact@techcorp.com', '0123456789'),
('WebSolutions', 'Agence web créative.', 'info@websolutions.com', '0987654321'),
('DataTech', 'Expert en Big Data et Intelligence Artificielle.', 'contact@datatech.com', '0234567891'),
('GreenEnergy', 'Solutions énergétiques durables.', 'info@greenenergy.com', '0345678912'),
('HealthPlus', 'Innovation dans le domaine de la santé.', 'contact@healthplus.com', '0456789123'),
('EduTech', 'Plateforme éducative en ligne.', 'info@edutech.com', '0567891234'),
('FinTech Solutions', 'Services financiers innovants.', 'contact@fintechsolutions.com', '0678912345'),
('AutoDrive', 'Développement de véhicules autonomes.', 'info@autodrive.com', '0789123456');

INSERT INTO OffreStage (id_entreprise, id_pilote, titre, description, compétences, base_rémunération, date_début, date_fin) VALUES
(1, 1, 'Développeur Full Stack', 'Développement d\'applications web.', 'PHP, JavaScript, SQL', 1200.00, '2023-11-01', '2024-04-30'),
(2, 1, 'Designer UX/UI', 'Conception d\'interfaces utilisateur.', 'Figma, Adobe XD', 1000.00, '2023-12-01', '2024-05-31'),
(3, 1, 'Data Scientist', 'Analyse de données et modélisation.', 'Python, Machine Learning', 1500.00, '2024-01-15', '2024-06-30'),
(4, 1, 'Ingénieur Énergie', 'Développement de solutions énergétiques.', 'Énergies renouvelables, AutoCAD', 1300.00, '2024-02-01', '2024-07-31'),
(5, 1, 'Développeur Santé', 'Applications pour le secteur médical.', 'Java, Spring Boot', 1400.00, '2024-03-01', '2024-08-31'),
(6, 1, 'Concepteur Pédagogique', 'Création de contenus éducatifs.', 'Scénarisation pédagogique, LMS', 1100.00, '2024-04-01', '2024-09-30'),
(7, 1, 'Analyste Financier', 'Analyse des marchés financiers.', 'Excel, Python, SQL', 1600.00, '2024-05-01', '2024-10-31'),
(8, 1, 'Ingénieur Véhicules Autonomes', 'Développement de systèmes autonomes.', 'C++, ROS, Machine Learning', 1700.00, '2024-06-01', '2024-11-30');

INSERT INTO Candidature (id_étudiant, id_offre, date_candidature, cv, lettre_motivation, statut) VALUES
(1, 1, '2023-10-15', 'cv_jean_dupont.pdf', 'Lettre de motivation pour TechCorp.', 'en attente'),
(4, 3, '2023-10-20', 'cv_sophie_leroy.pdf', 'Lettre de motivation pour DataTech.', 'acceptée'),
(5, 5, '2023-10-25', 'cv_luc_moreau.pdf', 'Lettre de motivation pour HealthPlus.', 'refusée'),
(6, 2, '2023-10-30', 'cv_emma_petit.pdf', 'Lettre de motivation pour WebSolutions.', 'en attente'),
(7, 4, '2023-11-01', 'cv_hugo_roux.pdf', 'Lettre de motivation pour GreenEnergy.', 'en attente'),
(8, 6, '2023-11-05', 'cv_lea_fournier.pdf', 'Lettre de motivation pour EduTech.', 'acceptée'),
(9, 7, '2023-11-10', 'cv_nathan_girard.pdf', 'Lettre de motivation pour FinTech Solutions.', 'en attente'),
(10, 8, '2023-11-15', 'cv_chloe_lefebvre.pdf', 'Lettre de motivation pour AutoDrive.', 'refusée');

INSERT INTO Favoris (id_étudiant, id_offre) VALUES
(1, 2),
(4, 4),
(5, 6),
(6, 1),
(7, 3),
(8, 5),
(9, 7),
(10, 8);