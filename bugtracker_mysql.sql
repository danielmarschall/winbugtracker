
--
-- Tabellenstruktur für Tabelle `bugs`
--

CREATE TABLE IF NOT EXISTS `bugs` (
  `id` int(11) NOT NULL,
  `titel` varchar(255) NOT NULL,
  `beschreibung` longtext NOT NULL,
  `erstellt` datetime DEFAULT NULL,
  `wichtigkeit` int(11) NOT NULL DEFAULT '5',
  `erfasser` int(11) DEFAULT NOT NULL,
  `bearbeiter` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `status_geandert` datetime DEFAULT NULL,
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
-- Tabellenstruktur für Tabelle `lkp_status`
--

CREATE TABLE IF NOT EXISTS `lkp_status` (
`id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Indexes for dumped tables
--

ALTER TABLE `bugs`
 ADD PRIMARY KEY (`id`);

ALTER TABLE `mitarbeiter`
 ADD PRIMARY KEY (`id`);

ALTER TABLE `module`
 ADD PRIMARY KEY (`id`);

ALTER TABLE `projekte`
 ADD PRIMARY KEY (`id`);

ALTER TABLE `versionen`
 ADD PRIMARY KEY (`id`);

ALTER TABLE `lkp_status`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

ALTER TABLE `bugs`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `mitarbeiter`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `module`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `projekte`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `versionen`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `lkp_status`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Daten für Tabelle `lkp_status`
--

INSERT INTO `lkp_status` (`id`, `status`) VALUES
(1, 'Offen'),
(2, 'Abgelehnt'),
(3, 'In Arbeit'),
(4, 'Abgeschlossen'),
(5, 'Veröffentlicht');
