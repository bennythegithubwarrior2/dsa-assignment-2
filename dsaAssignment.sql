-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dsa_assignment
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customerdetails`
--

DROP TABLE IF EXISTS `customerdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customerdetails` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Address` varchar(255) NOT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerdetails`
--

LOCK TABLES `customerdetails` WRITE;
/*!40000 ALTER TABLE `customerdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `customerdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveryschedules`
--

DROP TABLE IF EXISTS `deliveryschedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliveryschedules` (
  `ScheduleID` int NOT NULL AUTO_INCREMENT,
  `ShippingID` int NOT NULL,
  `PickupLocation` varchar(255) NOT NULL,
  `DeliveryLocation` varchar(255) NOT NULL,
  `PreferredTimeSlots` varchar(100) NOT NULL,
  PRIMARY KEY (`ScheduleID`),
  KEY `ShippingID` (`ShippingID`),
  CONSTRAINT `deliveryschedules_ibfk_1` FOREIGN KEY (`ShippingID`) REFERENCES `shippingdetails` (`ShippingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveryschedules`
--

LOCK TABLES `deliveryschedules` WRITE;
/*!40000 ALTER TABLE `deliveryschedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `deliveryschedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serviceableareas`
--

DROP TABLE IF EXISTS `serviceableareas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serviceableareas` (
  `AreaID` int NOT NULL AUTO_INCREMENT,
  `AreaName` varchar(100) NOT NULL,
  `DistanceFromHQ` int NOT NULL,
  PRIMARY KEY (`AreaID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serviceableareas`
--

LOCK TABLES `serviceableareas` WRITE;
/*!40000 ALTER TABLE `serviceableareas` DISABLE KEYS */;
INSERT INTO `serviceableareas` VALUES (1,'Windhoek',1),(2,'Okahandja',2),(3,'Rehoboth',3),(4,'Gobabis',4),(5,'Mariental',5),(6,'Otjiwarongo',6),(7,'Karibib',7),(8,'Swakopmund',8),(9,'Walvis Bay',9),(10,'Tsumeb',10),(11,'Outjo',11),(12,'Rundu',50),(13,'Keetmanshoop',51),(14,'Lüderitz',52),(15,'Ongwediva',75),(16,'Ondangwa',76),(17,'Oshakati',77),(18,'Eenhana',90),(19,'Omuthiya',91),(20,'Oshikango',100);
/*!40000 ALTER TABLE `serviceableareas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shippingdetails`
--

DROP TABLE IF EXISTS `shippingdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shippingdetails` (
  `ShippingID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int NOT NULL,
  `ShippingMethod` varchar(50) NOT NULL,
  `ShippingCost` decimal(10,2) NOT NULL,
  `ShippingDate` date NOT NULL,
  PRIMARY KEY (`ShippingID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `shippingdetails_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customerdetails` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shippingdetails`
--

LOCK TABLES `shippingdetails` WRITE;
/*!40000 ALTER TABLE `shippingdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `shippingdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dsa_assignment'
--

--
-- Dumping routines for database 'dsa_assignment'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-13  1:37:29
