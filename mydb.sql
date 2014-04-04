-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Ven 07 Mars 2014 à 08:01
-- Version du serveur: 5.6.12-log
-- Version de PHP: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `mydb`
--
CREATE DATABASE IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `mydb`;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE IF NOT EXISTS `categorie` (
  `idCategorie` int(11) NOT NULL AUTO_INCREMENT,
  `nom_Categorie` varchar(45) NOT NULL,
  PRIMARY KEY (`idCategorie`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `categorie`
--

INSERT INTO `categorie` (`idCategorie`, `nom_Categorie`) VALUES
(1, 'transport');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `idClient` int(11) NOT NULL AUTO_INCREMENT,
  `nom_Client` varchar(45) NOT NULL,
  `Pre_Client` varchar(45) NOT NULL,
  `CP_Client` varchar(45) NOT NULL,
  `Tel_Client` varchar(45) NOT NULL,
  `Dt_Naiss` varchar(45) NOT NULL,
  `Prof_Client` varchar(45) NOT NULL,
  `Ville_Client` varchar(45) NOT NULL,
  `Rue_Client` varchar(45) NOT NULL,
  `Commentaire_Client` varchar(45) NOT NULL,
  `Mail_Client` varchar(45) NOT NULL,
  PRIMARY KEY (`idClient`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`idClient`, `nom_Client`, `Pre_Client`, `CP_Client`, `Tel_Client`, `Dt_Naiss`, `Prof_Client`, `Ville_Client`, `Rue_Client`, `Commentaire_Client`, `Mail_Client`) VALUES
(1, 'deolive', 'cycy', '42012', '013513354', '2014/02/14', 'medecin', 'vgiugfsdlf', 'g', 'llkuyul', 'gfjkgj');

-- --------------------------------------------------------

--
-- Structure de la table `comptable`
--

CREATE TABLE IF NOT EXISTS `comptable` (
  `idComptable` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_Comptable` varchar(45) NOT NULL,
  `Pre_Comptable` varchar(45) NOT NULL,
  `Ad_Comptable` varchar(45) NOT NULL,
  `Tel_Comptable` varchar(45) NOT NULL,
  `NDF_idNDF` int(11) NOT NULL,
  `NDF_Categorie_idCategorie` int(11) NOT NULL,
  `NDF_Visiteur_idVisiteur` int(11) NOT NULL,
  PRIMARY KEY (`idComptable`,`NDF_idNDF`,`NDF_Categorie_idCategorie`,`NDF_Visiteur_idVisiteur`),
  KEY `fk_Comptable_NDF1_idx` (`NDF_idNDF`,`NDF_Categorie_idCategorie`,`NDF_Visiteur_idVisiteur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `identifiant`
--

CREATE TABLE IF NOT EXISTS `identifiant` (
  `idIdentifiant` int(11) NOT NULL AUTO_INCREMENT,
  `Login` varchar(45) NOT NULL,
  `Mot_De_Passe` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`idIdentifiant`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `identifiant`
--

INSERT INTO `identifiant` (`idIdentifiant`, `Login`, `Mot_De_Passe`, `type`) VALUES
(1, '01', '01', 'visiteur');

-- --------------------------------------------------------

--
-- Structure de la table `ndf`
--

CREATE TABLE IF NOT EXISTS `ndf` (
  `idNDF` int(11) NOT NULL AUTO_INCREMENT,
  `DT_NDF` date NOT NULL,
  `Justificatif` text NOT NULL,
  `Categorie_idCategorie` int(11) NOT NULL,
  `Visiteur_idVisiteur` int(11) NOT NULL,
  `PRIX` decimal(10,0) NOT NULL,
  PRIMARY KEY (`idNDF`,`Categorie_idCategorie`,`Visiteur_idVisiteur`),
  KEY `fk_NDF_Categorie_idx` (`Categorie_idCategorie`),
  KEY `fk_NDF_Visiteur1_idx` (`Visiteur_idVisiteur`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `ndf`
--

INSERT INTO `ndf` (`idNDF`, `DT_NDF`, `Justificatif`, `Categorie_idCategorie`, `Visiteur_idVisiteur`, `PRIX`) VALUES
(2, '2014-02-07', '0', 1, 1, '150'),
(3, '2014-02-14', '0', 1, 1, '220'),
(4, '2014-02-07', '0', 1, 1, '50');

-- --------------------------------------------------------

--
-- Structure de la table `rdv`
--

CREATE TABLE IF NOT EXISTS `rdv` (
  `idRDV` int(11) NOT NULL AUTO_INCREMENT,
  `DT_RDV` varchar(45) DEFAULT NULL,
  `planning` text,
  PRIMARY KEY (`idRDV`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `rdv`
--

INSERT INTO `rdv` (`idRDV`, `DT_RDV`, `planning`) VALUES
(1, '2014/02/14', 'hgdfklghsldf');

-- --------------------------------------------------------

--
-- Structure de la table `rh`
--

CREATE TABLE IF NOT EXISTS `rh` (
  `idRH` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_RH` varchar(45) NOT NULL,
  `Pre_RH` varchar(45) NOT NULL,
  `Ad_RH` varchar(45) NOT NULL,
  `Tel_RH` varchar(45) NOT NULL,
  `NDF_idNDF` int(11) NOT NULL,
  `NDF_Categorie_idCategorie` int(11) NOT NULL,
  `NDF_Visiteur_idVisiteur` int(11) NOT NULL,
  PRIMARY KEY (`idRH`,`NDF_idNDF`,`NDF_Categorie_idCategorie`,`NDF_Visiteur_idVisiteur`),
  KEY `fk_RH_NDF1_idx` (`NDF_idNDF`,`NDF_Categorie_idCategorie`,`NDF_Visiteur_idVisiteur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `visiteur`
--

CREATE TABLE IF NOT EXISTS `visiteur` (
  `idVisiteur` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_Visiteur` varchar(45) NOT NULL,
  `Pre_Visiteur` varchar(45) NOT NULL,
  `Ad_Visiteur` varchar(45) NOT NULL,
  `Tel_Visiteur` varchar(45) DEFAULT NULL,
  `Identifiant_idIdentifiant` int(11) NOT NULL,
  `Client_idClient` int(11) NOT NULL,
  `RDV_idRDV` int(11) NOT NULL,
  PRIMARY KEY (`idVisiteur`,`Identifiant_idIdentifiant`,`Client_idClient`,`RDV_idRDV`),
  KEY `fk_Visiteur_Identifiant1_idx` (`Identifiant_idIdentifiant`),
  KEY `fk_Visiteur_Client1_idx` (`Client_idClient`),
  KEY `fk_Visiteur_RDV1_idx` (`RDV_idRDV`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `visiteur`
--

INSERT INTO `visiteur` (`idVisiteur`, `Nom_Visiteur`, `Pre_Visiteur`, `Ad_Visiteur`, `Tel_Visiteur`, `Identifiant_idIdentifiant`, `Client_idClient`, `RDV_idRDV`) VALUES
(1, 'bonin', 'dylan', 'fhlsfhsl', 'bgf;bgkjdfg', 1, 1, 1);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `comptable`
--
ALTER TABLE `comptable`
  ADD CONSTRAINT `fk_Comptable_NDF1` FOREIGN KEY (`NDF_idNDF`, `NDF_Categorie_idCategorie`, `NDF_Visiteur_idVisiteur`) REFERENCES `ndf` (`idNDF`, `Categorie_idCategorie`, `Visiteur_idVisiteur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `ndf`
--
ALTER TABLE `ndf`
  ADD CONSTRAINT `fk_NDF_Categorie` FOREIGN KEY (`Categorie_idCategorie`) REFERENCES `categorie` (`idCategorie`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_NDF_Visiteur1` FOREIGN KEY (`Visiteur_idVisiteur`) REFERENCES `visiteur` (`idVisiteur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `rh`
--
ALTER TABLE `rh`
  ADD CONSTRAINT `fk_RH_NDF1` FOREIGN KEY (`NDF_idNDF`, `NDF_Categorie_idCategorie`, `NDF_Visiteur_idVisiteur`) REFERENCES `ndf` (`idNDF`, `Categorie_idCategorie`, `Visiteur_idVisiteur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `visiteur`
--
ALTER TABLE `visiteur`
  ADD CONSTRAINT `fk_Visiteur_Client1` FOREIGN KEY (`Client_idClient`) REFERENCES `client` (`idClient`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Visiteur_Identifiant1` FOREIGN KEY (`Identifiant_idIdentifiant`) REFERENCES `identifiant` (`idIdentifiant`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Visiteur_RDV1` FOREIGN KEY (`RDV_idRDV`) REFERENCES `rdv` (`idRDV`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
