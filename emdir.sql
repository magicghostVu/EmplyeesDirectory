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
  `CHANGED_PASS` bit(1) DEFAULT b'0',
  PRIMARY KEY (`USER_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('magicghost.vu','1111','magicghost.vu@gmail.com',''),('mrmagic','1234','magic200395',''),('mrmagic_vu','1111','magicghost_vu@yahoo.com.vn',''),('qq','231432','aa',''),('quynhtrang','1111','phamthiquynhtrang95@gmail.com','');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Hành Chính',3,'01689357007'),(2,'Nhân lực',6,'01699391693'),(3,'Đầu tư',4,'01645935574'),(4,'Y tế',34,'01652519254'),(5,'Điều hành',35,'01689874564'),(6,'New Depart',21,'0122333556'),(8,'AnyName',2,'1928477980');
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
  `CUS_AVA` bit(1) DEFAULT b'0',
  PRIMARY KEY (`ID`),
  KEY `depart_idx` (`DEPARTMENT`),
  CONSTRAINT `fk_dpm` FOREIGN KEY (`DEPARTMENT`) REFERENCES `departments` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Red Apple','Kỹ sư','magicghost.vu@gmail.com',5,'01689357005',''),(2,'Ngọc Trương','Giám đốc','ngoc@gmail.com',8,'08989895657',''),(3,'Trần Long','Nhân viên','longtm0605@gmail.com',1,'099999999',''),(4,'Hưng Nguyễn','Nhân viên','hungnv950@gmail.com',3,'0169476345922',''),(6,'Khắc Thành','Nhân viên','thanh@gmail.com',2,'0188948594856',''),(8,'Lưu Thắng','Nhân viên','thang@gmail.com',1,'5769586509764',''),(21,'Quỳnh Trang','Chairman','phamthiquynhtrang95@gmail.com',6,'01699391693',''),(34,'Đức','Nhân viên','mail@mail.com',4,'817384298',''),(35,'NewEmp','tt','mail@mail.com',5,'0198423856768','');
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

-- Dump completed on 2016-06-15  0:48:43
