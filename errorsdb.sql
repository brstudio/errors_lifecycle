-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: errorsdb
-- ------------------------------------------------------
-- Server version	5.6.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `access_roles`
--

DROP TABLE IF EXISTS `access_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_roles` (
  `roleid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`roleid`),
  UNIQUE KEY `roleid_UNIQUE` (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_roles`
--

LOCK TABLES `access_roles` WRITE;
/*!40000 ALTER TABLE `access_roles` DISABLE KEYS */;
INSERT INTO `access_roles` VALUES (1,'admin');
/*!40000 ALTER TABLE `access_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions` (
  `actionid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(20) NOT NULL,
  PRIMARY KEY (`actionid`),
  UNIQUE KEY `actionid_UNIQUE` (`actionid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions`
--

LOCK TABLES `actions` WRITE;
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
INSERT INTO `actions` VALUES (3,'inserting'),(5,'opening');
/*!40000 ALTER TABLE `actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crit`
--

DROP TABLE IF EXISTS `crit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crit` (
  `critid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `critname` varchar(45) NOT NULL,
  PRIMARY KEY (`critid`),
  UNIQUE KEY `critid_UNIQUE` (`critid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crit`
--

LOCK TABLES `crit` WRITE;
/*!40000 ALTER TABLE `crit` DISABLE KEYS */;
INSERT INTO `crit` VALUES (1,'Crash'),(2,'critical'),(3,'non-critical'),(4,'Request for Change');
/*!40000 ALTER TABLE `crit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `error_hist`
--

DROP TABLE IF EXISTS `error_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `error_hist` (
  `error_histid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `errorid` int(10) unsigned NOT NULL,
  `date` varchar(45) NOT NULL,
  `actionid` varchar(45) NOT NULL,
  `comment` varchar(500) NOT NULL,
  `userid` varchar(45) NOT NULL,
  PRIMARY KEY (`error_histid`),
  UNIQUE KEY `id_UNIQUE` (`error_histid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error_hist`
--

LOCK TABLES `error_hist` WRITE;
/*!40000 ALTER TABLE `error_hist` DISABLE KEYS */;
INSERT INTO `error_hist` VALUES (1,7,'21/10/2016','opened','<p>&nbsp;ffff</p>','admin'),(2,7,'21/10/2016','solved','<p>&nbsp;gg</p>','admin');
/*!40000 ALTER TABLE `error_hist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `error_status`
--

DROP TABLE IF EXISTS `error_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `error_status` (
  `statusid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`statusid`),
  UNIQUE KEY `statusid_UNIQUE` (`statusid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error_status`
--

LOCK TABLES `error_status` WRITE;
/*!40000 ALTER TABLE `error_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `error_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `errors`
--

DROP TABLE IF EXISTS `errors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `errors` (
  `errorid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` varchar(45) NOT NULL,
  `short_description` varchar(150) NOT NULL,
  `full_description` varchar(1000) NOT NULL,
  `userid` varchar(45) NOT NULL,
  `statusid` varchar(45) NOT NULL,
  `urgencyid` int(10) unsigned NOT NULL,
  `critid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`errorid`),
  UNIQUE KEY `id_UNIQUE` (`errorid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `errors`
--

LOCK TABLES `errors` WRITE;
/*!40000 ALTER TABLE `errors` DISABLE KEYS */;
INSERT INTO `errors` VALUES (7,'20/10/2016','aa','<p>bb</p>','user1','solved',1,1),(9,'21/10/2016','ooo','<p>&nbsp;lll</p>','admin','new',1,3);
/*!40000 ALTER TABLE `errors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urgency`
--

DROP TABLE IF EXISTS `urgency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `urgency` (
  `urgencyid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `urgency` varchar(45) NOT NULL,
  PRIMARY KEY (`urgencyid`),
  UNIQUE KEY `urgencyid_UNIQUE` (`urgencyid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urgency`
--

LOCK TABLES `urgency` WRITE;
/*!40000 ALTER TABLE `urgency` DISABLE KEYS */;
INSERT INTO `urgency` VALUES (1,'Very Urgent'),(2,'Urgent'),(3,'non-urgent'),(4,'Very non-urgent');
/*!40000 ALTER TABLE `urgency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userid` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `roleid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `id_UNIQUE` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('admin','admin','admin','1',1),('QWERTY','qq','tt','1111',1),('user2','Dmitriy','Sokolov','1234',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-21  2:05:33
