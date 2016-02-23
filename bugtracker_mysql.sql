-- phpMyAdmin SQL Dump
-- version 4.2.0-dev
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 21. Feb 2016 um 03:49
-- Server Version: 5.5.44-0+deb8u1
-- PHP-Version: 5.6.17-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `bugtracker`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bugs`
--

CREATE TABLE IF NOT EXISTS `bugs` (
  `id` int(11) NOT NULL,
  `titel` varchar(255) NOT NULL,
  `beschreibung` longtext NOT NULL,
  `erstellt` datetime DEFAULT NULL,
  `wichtigkeit` int(11) NOT NULL DEFAULT '5',
  `erfasser` int(11) DEFAULT NULL,
  `bearbeiter` int(11) DEFAULT NULL,
  `fixdatum` datetime DEFAULT NULL,
  `version_release` int(11) NOT NULL,
  `version_agenda` int(11) NOT NULL,
  `modul` int(11) NOT NULL,
  `projekt` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mitarbeiter`
--

CREATE TABLE IF NOT EXISTS `mitarbeiter` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `module`
--

CREATE TABLE IF NOT EXISTS `module` (
  `id` int(11) NOT NULL,
  `projekt` int(11) NOT NULL,
  `modul` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `projekte`
--

CREATE TABLE IF NOT EXISTS `projekte` (
  `id` int(11) NOT NULL,
  `projekt` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `versionen`
--

CREATE TABLE IF NOT EXISTS `versionen` (
  `id` int(11) NOT NULL,
  `version` varchar(255) NOT NULL,
  `projekt` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bugs`
--
ALTER TABLE `bugs`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mitarbeiter`
--
ALTER TABLE `mitarbeiter`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projekte`
--
ALTER TABLE `projekte`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `versionen`
--
ALTER TABLE `versionen`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bugs`
--
ALTER TABLE `bugs`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mitarbeiter`
--
ALTER TABLE `mitarbeiter`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `module`
--
ALTER TABLE `module`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `projekte`
--
ALTER TABLE `projekte`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `versionen`
--
ALTER TABLE `versionen`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

