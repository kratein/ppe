-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Ven 09 Mai 2014 à 07:34
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`idClient`, `nom_Client`, `Pre_Client`, `CP_Client`, `Tel_Client`, `Dt_Naiss`, `Prof_Client`, `Ville_Client`, `Rue_Client`, `Commentaire_Client`, `Mail_Client`) VALUES
(1, 'deolive', 'cycy', '42012', '013513354', '2014/02/14', 'medecin', 'vgiugfsdlf', 'g', 'llkuyul', 'gfjkgj'),
(2, 'fhggh', 'gjjhlk', '2014/03/07', 'hklhklhklhj', '84651', 'ytghbj', 'fykglh', '5463', 'yghbj', 'fghbj'),
(3, 'fryugkhj', 'gkb;hj', '2014/03/04', 'gyhjb', 'ytbhj', 'ygkbhj', 'td', 'ygkbhj', 'ybhjn', 'ygkubhj'),
(5, 'bonin', 'dylan', '1993/11/01', 'etudiant', '0185421548', 'dylan.bonin@free.fr', '1 rue saint louis', '78000', 'Versailles', 'aucun'),
(6, 'bonin', 'dylan', '78000', '0185421548', '1993/11/01', 'etudiant', 'Versailles', '1 rue saint louis', 'aucun', 'dylan.bonin@free.fr');

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
-- Structure de la table `compterendu`
--

CREATE TABLE IF NOT EXISTS `compterendu` (
  `id_compteRendu` int(11) NOT NULL AUTO_INCREMENT,
  `Compte_Rendu` text NOT NULL,
  `id_Client` int(11) NOT NULL,
  `id_RDV` int(11) NOT NULL,
  PRIMARY KEY (`id_compteRendu`),
  KEY `id_Client` (`id_Client`),
  KEY `id_RDV` (`id_RDV`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `compterendu`
--

INSERT INTO `compterendu` (`id_compteRendu`, `Compte_Rendu`, `id_Client`, `id_RDV`) VALUES
(1, 'test.txt', 1, 2);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `identifiant`
--

INSERT INTO `identifiant` (`idIdentifiant`, `Login`, `Mot_De_Passe`, `type`) VALUES
(1, '01', '01', 'visiteur'),
(2, 'admin', 'admin', 'rh'),
(3, 'l', '15', 'visiteur'),
(4, 'm', '28', 'visiteur'),
(5, 'i', 'c663g9y3', 'visiteur'),
(6, 'marti', '00jenlou', 'visiteur'),
(7, '0', 'peg2ydgs', 'visiteur');

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
  `Statut` varchar(45) NOT NULL,
  PRIMARY KEY (`idNDF`,`Categorie_idCategorie`,`Visiteur_idVisiteur`),
  KEY `fk_NDF_Categorie_idx` (`Categorie_idCategorie`),
  KEY `fk_NDF_Visiteur1_idx` (`Visiteur_idVisiteur`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- Contenu de la table `ndf`
--

INSERT INTO `ndf` (`idNDF`, `DT_NDF`, `Justificatif`, `Categorie_idCategorie`, `Visiteur_idVisiteur`, `PRIX`, `Statut`) VALUES
(2, '2014-02-07', '0', 1, 1, '150', 'Remboursé'),
(3, '2014-02-14', '0', 1, 1, '220', 'En cours'),
(4, '2014-02-07', '0', 1, 1, '50', ''),
(6, '2014-03-07', '0', 1, 1, '500', ''),
(7, '2014-03-07', '0', 1, 1, '50000', ''),
(8, '2014-03-07', '0', 1, 1, '50000', ''),
(9, '2014-03-04', '0', 1, 1, '10', ''),
(10, '2014-03-04', '0', 1, 1, '150', ''),
(11, '2014-03-04', '0', 1, 1, '150', ''),
(12, '2014-03-04', '0', 1, 1, '150', ''),
(13, '2014-03-04', '0', 1, 1, '150', ''),
(14, '2014-03-04', '0', 1, 1, '150', ''),
(15, '2014-03-04', '0', 1, 1, '150', ''),
(16, '2014-03-04', '0', 1, 1, '50', ''),
(17, '2014-03-04', '0', 1, 1, '50', ''),
(18, '2014-03-03', '0', 1, 1, '150', ''),
(19, '2014-03-03', '0', 1, 1, '150', ''),
(20, '2014-03-03', '0', 1, 1, '150', ''),
(21, '2014-03-03', '0', 1, 1, '150', ''),
(22, '2014-03-03', '0', 1, 1, '150', ''),
(23, '2014-03-03', '0', 1, 1, '150', ''),
(24, '2014-03-04', '0', 1, 1, '150', ''),
(25, '2014-03-03', '0', 1, 1, '150', ''),
(26, '2014-03-03', '0', 1, 1, '150', ''),
(27, '2014-03-03', '0', 1, 1, '150', ''),
(28, '2014-03-03', '0', 1, 1, '150', ''),
(29, '2014-03-04', '0', 1, 1, '150', ''),
(30, '2014-03-03', 'test.jpg', 1, 1, '50', ''),
(31, '2014-03-04', 'test.png', 1, 1, '50', ''),
(32, '2014-04-01', 'test.jpeg', 1, 1, '150', ''),
(33, '2014-04-01', '', 1, 2, '10', '');

-- --------------------------------------------------------

--
-- Structure de la table `rdv`
--

CREATE TABLE IF NOT EXISTS `rdv` (
  `idRDV` int(11) NOT NULL AUTO_INCREMENT,
  `DT_RDV` varchar(45) DEFAULT NULL,
  `planning` text,
  `idClient` int(11) NOT NULL,
  PRIMARY KEY (`idRDV`),
  KEY `id_Client` (`idClient`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `rdv`
--

INSERT INTO `rdv` (`idRDV`, `DT_RDV`, `planning`, `idClient`) VALUES
(2, '2014/02/14', 'rdtfi', 1),
(4, '2014/04/04', 'rtfgyu', 6);

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
  KEY `fk_RH_NDF1_idx` (`NDF_idNDF`,`NDF_Categorie_idCategorie`,`NDF_Visiteur_idVisiteur`),
  KEY `NDF_idNDF` (`NDF_idNDF`)
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
  `Civilite` varchar(45) NOT NULL,
  PRIMARY KEY (`idVisiteur`,`Identifiant_idIdentifiant`),
  KEY `fk_Visiteur_Identifiant1_idx` (`Identifiant_idIdentifiant`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `visiteur`
--

INSERT INTO `visiteur` (`idVisiteur`, `Nom_Visiteur`, `Pre_Visiteur`, `Ad_Visiteur`, `Tel_Visiteur`, `Identifiant_idIdentifiant`, `Civilite`) VALUES
(1, 'bonin', 'dylan', 'fhlsfhsl', 'bgf;bgkjdfg', 1, 'Monsieur'),
(2, 'deolive', 'cyril', '1 rue des fleurs', '85208520', 1, 'Monsieur'),
(4, 'lagaffe', 'gaston', '1 rue saint louis', '0150504514', 3, 'Monsieur'),
(5, 'martin', 'matin', '1 rue saint louis', '0150504514', 4, 'Monsieur'),
(6, 'martin', 'matin', '1 rue saint louis', '0150504514', 5, 'Monsieur'),
(7, 'martin', 'matin', '1 rue saint louis', '0150504514', 6, 'Monsieur'),
(8, 'martin', 'matin', '1 rue saint louis', '0150504514', 7, 'Monsieur');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `comptable`
--
ALTER TABLE `comptable`
  ADD CONSTRAINT `fk_Comptable_NDF1` FOREIGN KEY (`NDF_idNDF`, `NDF_Categorie_idCategorie`, `NDF_Visiteur_idVisiteur`) REFERENCES `ndf` (`idNDF`, `Categorie_idCategorie`, `Visiteur_idVisiteur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `compterendu`
--
ALTER TABLE `compterendu`
  ADD CONSTRAINT `compterendu_ibfk_1` FOREIGN KEY (`id_Client`) REFERENCES `client` (`idClient`),
  ADD CONSTRAINT `compterendu_ibfk_2` FOREIGN KEY (`id_RDV`) REFERENCES `rdv` (`idRDV`);

--
-- Contraintes pour la table `ndf`
--
ALTER TABLE `ndf`
  ADD CONSTRAINT `fk_NDF_Categorie` FOREIGN KEY (`Categorie_idCategorie`) REFERENCES `categorie` (`idCategorie`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_NDF_Visiteur1` FOREIGN KEY (`Visiteur_idVisiteur`) REFERENCES `visiteur` (`idVisiteur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `rdv`
--
ALTER TABLE `rdv`
  ADD CONSTRAINT `rdv_ibfk_1` FOREIGN KEY (`idClient`) REFERENCES `client` (`idClient`);

--
-- Contraintes pour la table `rh`
--
ALTER TABLE `rh`
  ADD CONSTRAINT `fk_RH_NDF1` FOREIGN KEY (`NDF_idNDF`, `NDF_Categorie_idCategorie`, `NDF_Visiteur_idVisiteur`) REFERENCES `ndf` (`idNDF`, `Categorie_idCategorie`, `Visiteur_idVisiteur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `visiteur`
--
ALTER TABLE `visiteur`
  ADD CONSTRAINT `fk_Visiteur_Identifiant1` FOREIGN KEY (`Identifiant_idIdentifiant`) REFERENCES `identifiant` (`idIdentifiant`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
