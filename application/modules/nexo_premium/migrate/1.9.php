<?php
$this->db->query('CREATE TABLE IF NOT EXISTS `'.$this->db->dbprefix.'nexo_premium_backups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(200) NOT NULL,
  `FILE_LOCATION` text NOT NULL,
  `DATE_CREATION` datetime NOT NULL,
  `DATE_MODIFICATION` datetime NOT NULL,
  `AUTHOR` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;');
