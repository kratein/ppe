-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Mar 07 Janvier 2014 à 18:38
-- Version du serveur: 5.5.24-log
-- Version de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `GSB`
--

-- --------------------------------------------------------

--
-- Structure de la table `Identifiant`
--

CREATE TABLE IF NOT EXISTS `Identifiant` (
  `N°ID` int(11) NOT NULL AUTO_INCREMENT,
  `Login` text NOT NULL,
  `Mdp` text NOT NULL,
  PRIMARY KEY (`N°ID`),
  UNIQUE KEY `N°ID` (`N°ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `identifiant`
--

INSERT INTO `Identifiant` (`N°ID`, `Login`, `Mdp`) VALUES
(1, '01', '01');

-- --------------------------------------------------------

--
-- Structure de la table ``
--

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
