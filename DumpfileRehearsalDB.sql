-- MySQL dump 10.13  Distrib 8.0.13, for Linux (x86_64)
--
-- Host: localhost    Database: RehearsalDB
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `RehearsalDB`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `RehearsalDB` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;

USE `RehearsalDB`;

--
-- Table structure for table `Crossref`
--

DROP TABLE IF EXISTS `Crossref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Crossref` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tr_id` int(11) NOT NULL,
  `lm_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tr_id` (`tr_id`),
  KEY `lm_id` (`lm_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Crossref`
--

LOCK TABLES `Crossref` WRITE;
/*!40000 ALTER TABLE `Crossref` DISABLE KEYS */;
INSERT INTO `Crossref` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,2,1),(7,2,2),(8,2,3),(9,2,4),(10,2,5),(11,3,1),(12,3,3),(13,3,4),(14,4,1),(15,4,2),(16,4,3),(17,4,4),(18,4,5),(19,5,1),(20,5,2),(21,5,3),(22,6,1),(23,6,2),(24,6,4);
/*!40000 ALTER TABLE `Crossref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Equipment`
--

DROP TABLE IF EXISTS `Equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Equipment` (
  `equipment_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `manufacturer` varchar(45) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  PRIMARY KEY (`equipment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Equipment`
--

LOCK TABLES `Equipment` WRITE;
/*!40000 ALTER TABLE `Equipment` DISABLE KEYS */;
INSERT INTO `Equipment` VALUES (1,'Centrifuge','BD','2010-04-25'),(2,'Incubator','BD','1984-04-12'),(3,'ULT Deep Freeze','ThermoFischer','1998-12-16'),(4,'Gaming PC','AlienWare','2018-12-06'),(5,'Reagent shaker','Roche','1980-12-16');
/*!40000 ALTER TABLE `Equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Experiments`
--

DROP TABLE IF EXISTS `Experiments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Experiments` (
  `experiment_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `performed_by` int(11) NOT NULL,
  `equipment_used` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`experiment_id`),
  KEY `performed_by` (`performed_by`),
  KEY `equipment_used` (`equipment_used`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Experiments`
--

LOCK TABLES `Experiments` WRITE;
/*!40000 ALTER TABLE `Experiments` DISABLE KEYS */;
INSERT INTO `Experiments` VALUES (1,'Amplification DNA',2,1,'2017-04-25'),(2,'Incubating Cryoglobulines',2,1,'2015-04-12'),(3,'Storing embryos',3,3,'2018-01-16'),(4,'Creating script',5,4,'2018-12-06'),(5,'Folate in RBC',4,3,'2017-01-16');
/*!40000 ALTER TABLE `Experiments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lab_members`
--

DROP TABLE IF EXISTS `Lab_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Lab_members` (
  `labmember_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  PRIMARY KEY (`labmember_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lab_members`
--

LOCK TABLES `Lab_members` WRITE;
/*!40000 ALTER TABLE `Lab_members` DISABLE KEYS */;
INSERT INTO `Lab_members` VALUES (1,'Tom','Janssens','1980-04-10'),(2,'Ann','Wouters','1965-10-25'),(3,'Walter','Defruyt','1980-01-01'),(4,'Bart','Willems','1970-08-01'),(5,'Eline','Creyf','1990-11-01');
/*!40000 ALTER TABLE `Lab_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Results`
--

DROP TABLE IF EXISTS `Results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Results` (
  `result_id` int(11) NOT NULL,
  `directory` varchar(45) DEFAULT NULL,
  `experiment` int(11) NOT NULL,
  `status` enum('Succesful','Failed','Cancelled') DEFAULT NULL,
  PRIMARY KEY (`result_id`),
  KEY `experiment` (`experiment`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Results`
--

LOCK TABLES `Results` WRITE;
/*!40000 ALTER TABLE `Results` DISABLE KEYS */;
INSERT INTO `Results` VALUES (1,'C/Home/Results1',1,'Succesful'),(2,'C/Home/Results2',2,'Failed'),(3,'C/Home/Results3',3,'Cancelled'),(4,'C/Home/Results4',4,'Cancelled'),(5,'C/Home/Results5',5,'Succesful');
/*!40000 ALTER TABLE `Results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Trainings`
--

DROP TABLE IF EXISTS `Trainings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Trainings` (
  `training_id` int(11) NOT NULL,
  `subject` varchar(45) DEFAULT NULL,
  `duration (Days)` int(5) DEFAULT NULL,
  PRIMARY KEY (`training_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Trainings`
--

LOCK TABLES `Trainings` WRITE;
/*!40000 ALTER TABLE `Trainings` DISABLE KEYS */;
INSERT INTO `Trainings` VALUES (1,'Mass Spectrometry',10),(2,'Liquid Chromatography',5),(3,'NGS',4),(4,'Systems Biology',4),(5,'Linux',3),(6,'Database Technologies',5);
/*!40000 ALTER TABLE `Trainings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-06 17:05:32
