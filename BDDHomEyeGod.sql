-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mer 07 Juin 2017 à 09:14
-- Version du serveur :  5.7.11
-- Version de PHP :  7.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `homeyegod`
--

-- --------------------------------------------------------

--
-- Structure de la table `actionneurs`
--

CREATE TABLE `actionneurs` (
  `idActionneur` int(11) NOT NULL,
  `idCapteur` int(11) NOT NULL,
  `Type` int(11) NOT NULL,
  `idMaison` int(11) NOT NULL,
  `idPiece` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `actions`
--

CREATE TABLE `actions` (
  `idAction` int(11) NOT NULL,
  `Date-Heure` datetime NOT NULL,
  `idActionneur` int(11) NOT NULL,
  `idUtilisateur` int(11) NOT NULL,
  `Etatdemande` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `alerte`
--

CREATE TABLE `alerte` (
  `idAlerte` int(11) NOT NULL,
  `idUtilisateurs` int(11) NOT NULL,
  `idCapteur` int(11) NOT NULL,
  `Vallimite` int(11) NOT NULL,
  `Date-Heure` datetime NOT NULL,
  `idPiece` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `capteurs`
--

CREATE TABLE `capteurs` (
  `idCapteur` int(11) NOT NULL,
  `idUtilisateur` int(11) NOT NULL,
  `Etat` tinyint(1) NOT NULL,
  `Type` int(11) NOT NULL,
  `idPièce` int(11) NOT NULL,
  `idMaison` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `donnees`
--

CREATE TABLE `donnees` (
  `idData` int(11) NOT NULL,
  `idCapteur` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `Datas` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Fichier avec: Date et heure + données'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `maisons`
--

CREATE TABLE `maisons` (
  `idMaison` int(11) NOT NULL,
  `idUtilisateur` int(11) NOT NULL,
  `numero_voie` int(11) NOT NULL,
  `TypeVoie` int(11) NOT NULL,
  `Voie` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `code_postal` int(5) NOT NULL,
  `Ville` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `Pays` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `Superficie` int(11) NOT NULL,
  `Nombre_Pieces` int(11) NOT NULL,
  `Nbre_Pers` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `maisons`
--

INSERT INTO `maisons` (`idMaison`, `idUtilisateur`, `numero_voie`, `TypeVoie`, `Voie`, `code_postal`, `Ville`, `Pays`, `Superficie`, `Nombre_Pieces`, `Nbre_Pers`) VALUES
(1, 1, 3, 2, 'General de Guaule', 75001, 'Paris', 'France', 300, 5, 3),
(2, 2, 1, 1, 'Domisep', 75001, 'Paris', 'France', 10, 1, 1),
(3, 3, 1, 1, 'Domisep', 75001, 'Paris', 'France', 10, 1, 1),
(4, 1, 150, 2, 'General de Guaule', 45630, 'Beaulieu-sur-Loire', 'France', 700, 5, 3);

-- --------------------------------------------------------

--
-- Structure de la table `pieces`
--

CREATE TABLE `pieces` (
  `idPiece` int(11) NOT NULL,
  `idMaison` int(11) NOT NULL,
  `Nom` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `pieces`
--

INSERT INTO `pieces` (`idPiece`, `idMaison`, `Nom`) VALUES
(1, 1, 'Cusine'),
(2, 1, 'Entrée'),
(3, 1, 'Chambre Parents'),
(4, 1, 'Chambre Enfant'),
(5, 1, 'Salon'),
(6, 2, 'Bureau Admin'),
(7, 3, 'Bureau SuperAdmin'),
(8, 4, 'Cuisine'),
(9, 4, 'Entrée'),
(10, 4, 'Salon'),
(11, 4, 'Chambre Parents'),
(12, 4, 'Chambre Enfant');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `RoleValue` int(11) NOT NULL,
  `RoleName` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `roles`
--

INSERT INTO `roles` (`RoleValue`, `RoleName`) VALUES
(1, 'Utilisateurs'),
(2, 'Administrateur'),
(3, 'SuperAdministrateur');

-- --------------------------------------------------------

--
-- Structure de la table `typecapteur`
--

CREATE TABLE `typecapteur` (
  `TypeValue` int(11) NOT NULL,
  `TypeName` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `typevoie`
--

CREATE TABLE `typevoie` (
  `TypeValue` int(11) NOT NULL,
  `TypeName` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `typevoie`
--

INSERT INTO `typevoie` (`TypeValue`, `TypeName`) VALUES
(1, 'Rue'),
(2, 'Avenue'),
(3, 'Boulevard'),
(4, 'Impasse'),
(5, 'Chemin'),
(6, 'Voie'),
(7, 'Quai'),
(8, 'Allée'),
(9, 'Berge'),
(10, 'Lieu Dit'),
(11, 'Place');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `idUtilisateur` int(11) NOT NULL,
  `Rôles` int(1) DEFAULT '0' COMMENT 'User/SuperUser/SuperRoot',
  `Nom` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `Prénom` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `idAdressePrincipale` int(11) NOT NULL,
  `Numero` text COLLATE utf8_unicode_ci NOT NULL,
  `Mobile` text COLLATE utf8_unicode_ci NOT NULL,
  `Mail` text COLLATE utf8_unicode_ci NOT NULL,
  `NomUtilisateur` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `Mdp` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Utilisateurs';

--
-- Contenu de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`idUtilisateur`, `Rôles`, `Nom`, `Prénom`, `idAdressePrincipale`, `Numero`, `Mobile`, `Mail`, `NomUtilisateur`, `Mdp`) VALUES
(1, 1, 'Dupont', 'Tartempion', 1, '018888888', '0609090909', 'dupont.tartempion@mail.com', 'Dudule', 'MotdePasse'),
(2, 2, 'Admin', 'Admin', 2, '0800810550', '0800810550', 'Admin.Admin@semigod.com', 'Admin', 'Admin'),
(3, 3, 'Super', 'User', 3, '0800810560', '0800810560', 'super.user@god.com', 'root', 'root');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `actionneurs`
--
ALTER TABLE `actionneurs`
  ADD PRIMARY KEY (`idActionneur`);

--
-- Index pour la table `actions`
--
ALTER TABLE `actions`
  ADD PRIMARY KEY (`idAction`);

--
-- Index pour la table `alerte`
--
ALTER TABLE `alerte`
  ADD PRIMARY KEY (`idAlerte`);

--
-- Index pour la table `capteurs`
--
ALTER TABLE `capteurs`
  ADD PRIMARY KEY (`idCapteur`);

--
-- Index pour la table `donnees`
--
ALTER TABLE `donnees`
  ADD PRIMARY KEY (`idData`);

--
-- Index pour la table `maisons`
--
ALTER TABLE `maisons`
  ADD PRIMARY KEY (`idMaison`);

--
-- Index pour la table `pieces`
--
ALTER TABLE `pieces`
  ADD PRIMARY KEY (`idPiece`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`RoleValue`);

--
-- Index pour la table `typecapteur`
--
ALTER TABLE `typecapteur`
  ADD PRIMARY KEY (`TypeValue`);

--
-- Index pour la table `typevoie`
--
ALTER TABLE `typevoie`
  ADD PRIMARY KEY (`TypeValue`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`idUtilisateur`),
  ADD UNIQUE KEY `NomUtilisateur` (`NomUtilisateur`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `actions`
--
ALTER TABLE `actions`
  MODIFY `idAction` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `alerte`
--
ALTER TABLE `alerte`
  MODIFY `idAlerte` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `capteurs`
--
ALTER TABLE `capteurs`
  MODIFY `idCapteur` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `donnees`
--
ALTER TABLE `donnees`
  MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `maisons`
--
ALTER TABLE `maisons`
  MODIFY `idMaison` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `pieces`
--
ALTER TABLE `pieces`
  MODIFY `idPiece` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `RoleValue` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `typevoie`
--
ALTER TABLE `typevoie`
  MODIFY `TypeValue` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `idUtilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
