DROP TABLE IF EXISTS `MySecondTable`;
CREATE TABLE `MySecondTable` (
  `id` int(11) NOT NULL,
  `class` varchar(45) DEFAULT NULL,
  `genus` varchar(45) DEFAULT NULL,
  `species` varchar(45) DEFAULT NULL,
  `draft` datetime DEFAULT NULL,
  `sex` enum('M','V') DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `MySecondTable` WRITE;

INSERT INTO `MySecondTable` VALUES (1,'Bacteria','Escherichia','coli','1997-09-05 00:00:00','M','1980-10-10'),(2,'Fungi','Saccharomyces','cerevisiae','1996-10-25 00:00:00','V',NULL),(3,'Roundworms','Caenorhabditis','elegans','1998-12-16 00:00:00',NULL,NULL);
INSERT INTO `MySecondTable` (id, class, genus, species) VALUES (4,'Virus','Haemophilus','influenza');

UNLOCK TABLES;
