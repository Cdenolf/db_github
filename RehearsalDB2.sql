SET NAMES utf8mb4 ;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `RehearsalDB`

USE `RehearsalDB`;

DROP TABLE IF EXISTS `Trainings`;

SET character_set_client = utf8mb4 ;
CREATE TABLE `Trainings` (
  `training_id` int(11) NOT NULL,
  `subject` varchar(45) DEFAULT NULL,
  `duration (Days)` int(5) DEFAULT NULL,
  PRIMARY KEY (`training_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `Trainings` WRITE;

INSERT INTO `Trainings` VALUES (1,'Mass Spectrometry',10),(2,'Liquid Chromatography',5),(3,'NGS',4),(4,'Systems Biology',4),(5,'Linux',3),(6,'Database Technologies',5);

UNLOCK TABLES;


DROP TABLE IF EXISTS `Crossref`;

SET character_set_client = utf8mb4 ;
CREATE TABLE `Crossref` (
  `id` int(11) AUTO_INCREMENT NOT NULL,
  `tr_id` int(11) NOT NULL,
  `lm_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`tr_id`)
  REFERENCES Trainings(training_id),
  FOREIGN KEY (`lm_id`)
  REFERENCES Lab_members(labmember_id)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


LOCK TABLES `Crossref` WRITE;

INSERT INTO `Crossref` (tr_id, lm_id) VALUES (1,1), (1,2), (1,3), (1,4), (1,5), (2,1), (2,2), (2,3), (2,4), (2,5), (3,1), (3,3), (3,4), (4,1), (4,2), (4,3), (4,4), (4,5), (5,1), (5,2), (5,3), (6,1), (6,2), (6,4) ;

UNLOCK TABLES;


DROP TABLE IF EXISTS `Lab_members`;

SET character_set_client = utf8mb4 ;
CREATE TABLE `Lab_members` (
  `labmember_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `birth_date` DATE DEFAULT NULL,
  PRIMARY KEY (`labmember_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


LOCK TABLES `Lab_members` WRITE;

INSERT INTO `Lab_members` VALUES (1,'Tom','Janssens','1980-04-10'),(2,'Ann','Wouters','1965-10-25'),(3,'Walter','Defruyt','1980-01-01'),(4,'Bart','Willems','1970-08-01'),(5,'Eline','Creyf','1990-11-01');

UNLOCK TABLES;


DROP TABLE IF EXISTS `Equipment`;

SET character_set_client = utf8mb4 ;
CREATE TABLE `Equipment` (
  `equipment_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `manufacturer` varchar(45) DEFAULT NULL,
  `purchase_date` DATE DEFAULT NULL,
  PRIMARY KEY (`equipment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


LOCK TABLES `Equipment` WRITE;

INSERT INTO `Equipment` VALUES (1,'Centrifuge','BD','2010-04-25'),(2,'Incubator','BD','1984-04-12'),(3,'ULT Deep Freeze','ThermoFischer','1998-12-16'),(4,'Gaming PC','AlienWare','2018-12-06'),(5,'Reagent shaker','Roche','1980-12-16');

UNLOCK TABLES;


DROP TABLE IF EXISTS `Experiments`;

SET character_set_client = utf8mb4 ;
CREATE TABLE `Experiments` (
  `experiment_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `performed_by` int(11) NOT NULL,
  `equipment_used` int(11) NOT NULL,
  `date` DATE DEFAULT NULL,
  PRIMARY KEY (`experiment_id`),
  FOREIGN KEY (`performed_by`)
  REFERENCES Lab_members(labmember_id),
  FOREIGN KEY (`equipment_used`)
  REFERENCES Equipment(equipment_id)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


LOCK TABLES `Experiments` WRITE;

INSERT INTO `Experiments` VALUES (1,'Amplification DNA',2,1,'2017-04-25'),(2,'Incubating Cryoglobulines',2,1,'2015-04-12'),(3,'Storing embryos',3,3,'2018-01-16'),(4,'Creating script',5,4,'2018-12-06'),(5,'Folate in RBC',4,3,'2017-01-16');

UNLOCK TABLES;


DROP TABLE IF EXISTS `Results`;

SET character_set_client = utf8mb4 ;
CREATE TABLE `Results` (
  `result_id` int(11) NOT NULL,
  `directory` varchar(45) DEFAULT NULL,
  `experiment` int(11) NOT NULL,
  `status` enum('Succesful','Failed','Cancelled') DEFAULT NULL,
  PRIMARY KEY (`result_id`),
  FOREIGN KEY (`experiment`)
  REFERENCES Experiment(experiment_id)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


LOCK TABLES `Results` WRITE;

INSERT INTO `Results` VALUES (1,'C/Home/Results1',1,'Succesful'),(2,'C/Home/Results2',2,'Failed'),(3,'C/Home/Results3',3,'Cancelled'),(4,'C/Home/Results4',4,'Cancelled'),(5,'C/Home/Results5',5,'Succesful');

UNLOCK TABLES;

