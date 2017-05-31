-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mar 23 Mai 2017 à 07:41
-- Version du serveur :  5.7.11
-- Version de PHP :  5.5.38

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
-- Structure de la table `confidence`
--

CREATE TABLE `confidence` (
  `ConfidenceValue` int(11) NOT NULL,
  `ConfidenceName` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `donnees`
--

CREATE TABLE `donnees` (
  `idData` int(11) NOT NULL,
  `idCapteur` int(11) NOT NULL,
  `Datas` longblob NOT NULL COMMENT 'Fichier avec: Date et heure + données'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `etattopic`
--

CREATE TABLE `etattopic` (
  `EtatValue` int(11) NOT NULL,
  `EtatName` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `maisons`
--

CREATE TABLE `maisons` (
  `idMaison` int(11) NOT NULL,
  `idUtilisateur` int(11) NOT NULL,
  `numero_voie` int(11) NOT NULL,
  `Voie` int(11) NOT NULL,
  `TypeVoie` int(11) NOT NULL,
  `code_postal` int(5) NOT NULL,
  `Ville` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `Pays` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `Superficie` int(11) NOT NULL,
  `Nombre_Pieces` int(11) NOT NULL,
  `Nbre_Pers` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `pieces`
--

CREATE TABLE `pieces` (
  `idPiece` int(11) NOT NULL,
  `Nom` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `idMaison` int(11) NOT NULL,
  `TypePièce` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `RolesValue` int(11) NOT NULL,
  `RoleName` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `topics`
--

CREATE TABLE `topics` (
  `idTopic` int(11) NOT NULL,
  `Titre` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `Message` text COLLATE utf8_unicode_ci NOT NULL,
  `idUtilisateur` int(11) NOT NULL,
  `Comptlike` int(11) NOT NULL,
  `Reponses` text COLLATE utf8_unicode_ci NOT NULL,
  `Etat` int(11) NOT NULL,
  `Typetopic` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
-- Structure de la table `typetopic`
--

CREATE TABLE `typetopic` (
  `TypeValue` int(11) NOT NULL,
  `TypeName` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `typevoie`
--

CREATE TABLE `typevoie` (
  `TypeValue` int(11) NOT NULL,
  `TypeName` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `Factures` mediumblob NOT NULL,
  `Confidence` int(11) DEFAULT '0',
  `NomUtilisateur` text COLLATE utf8_unicode_ci NOT NULL,
  `Mdp` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Utilisateurs';

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
-- Index pour la table `confidence`
--
ALTER TABLE `confidence`
  ADD PRIMARY KEY (`ConfidenceValue`);

--
-- Index pour la table `donnees`
--
ALTER TABLE `donnees`
  ADD PRIMARY KEY (`idData`);

--
-- Index pour la table `etattopic`
--
ALTER TABLE `etattopic`
  ADD PRIMARY KEY (`EtatValue`);

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
  ADD PRIMARY KEY (`RolesValue`);

--
-- Index pour la table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`idTopic`);

--
-- Index pour la table `typecapteur`
--
ALTER TABLE `typecapteur`
  ADD PRIMARY KEY (`TypeValue`);

--
-- Index pour la table `typetopic`
--
ALTER TABLE `typetopic`
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
  ADD PRIMARY KEY (`idUtilisateur`);

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
  MODIFY `idMaison` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `topics`
--
ALTER TABLE `topics`
  MODIFY `idTopic` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
