-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: employees_directory
-- ------------------------------------------------------
-- Server version	5.6.21-log

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `USER_NAME` varchar(45) NOT NULL,
  `PASS` varchar(45) NOT NULL,
  `EMAIL` varchar(45) NOT NULL,
  PRIMARY KEY (`USER_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('magicghost.vu','1111','magicghost.vu@gmail.com'),('mrmagic','1234','magic200395');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) NOT NULL DEFAULT '',
  `MANAGER` int(11) DEFAULT NULL,
  `OFFICE_NUMBER` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `man_fk_idx` (`MANAGER`),
  CONSTRAINT `fk_manager` FOREIGN KEY (`MANAGER`) REFERENCES `employees` (`ID`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Hành Chính',1,'01689357007'),(2,'Nhân lực',1,'01699391693'),(3,'Đầu tư',8,'01645935574'),(4,'Y tế',4,'01652519254'),(5,'Điều hành',6,'01689874564'),(6,'New Depart',1,'0122333555');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(99) NOT NULL,
  `JOB_TITLE` varchar(45) NOT NULL,
  `EMAIL` varchar(45) DEFAULT NULL,
  `DEPARTMENT` int(11) NOT NULL,
  `PHONE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `depart_idx` (`DEPARTMENT`),
  CONSTRAINT `fk_dpm` FOREIGN KEY (`DEPARTMENT`) REFERENCES `departments` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Red Apple','Kỹ sư','magicghost.vu@gmail.com',5,'01689357005'),(2,'Ngọc Trương','Giám đốc','ngoc@gmail.com',2,'08989895657'),(3,'Trần Long','Nhân viên','Longtm0605@gmail.com',5,'099999999'),(4,'Hưng Nguyễn','Nhân viên','hungnv950@gmail.com',3,'0169476345922'),(6,'Khắc Thành','Nhân viên','thanh@gmail.com',2,'0188948594856'),(8,'Thắng Lưu','Nhân viên','thang@gmail.com',1,'57695865097650');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-03 20:17:10
