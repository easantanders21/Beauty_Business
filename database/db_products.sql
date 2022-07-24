-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: bb_products
-- ------------------------------------------------------
-- Server version	8.0.28-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name_category` varchar(30) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'gel'),(2,'shampoo'),(3,'reparador'),(4,'otros');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mark`
--

DROP TABLE IF EXISTS `mark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mark` (
  `mark_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name_mark` varchar(30) NOT NULL,
  PRIMARY KEY (`mark_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mark`
--

LOCK TABLES `mark` WRITE;
/*!40000 ALTER TABLE `mark` DISABLE KEYS */;
INSERT INTO `mark` VALUES (1,'marcell france'),(2,'bella'),(3,'natura'),(4,'men');
/*!40000 ALTER TABLE `mark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name_product` varchar(30) NOT NULL,
  `category_id` int unsigned NOT NULL,
  `mark_id` int unsigned NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `category_id` (`category_id`),
  KEY `mark_id` (`mark_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`mark_id`) REFERENCES `mark` (`mark_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'shammpoo aguacate',2,1),(2,'shammpoo caspa',2,3),(3,'gel moco gorilla',1,4),(4,'reparador puntas',3,2),(5,'aceite de coco',3,2),(6,'gel marcell france',1,1),(7,'keratina cojin',3,3),(8,'gel ego',1,4),(9,'shammpoo tinte rojo',2,2),(10,'monas nina',4,2);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providers`
--

DROP TABLE IF EXISTS `providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `providers` (
  `provider_id` int unsigned NOT NULL AUTO_INCREMENT,
  `provider_name` varchar(30) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `provider_address` varchar(50) NOT NULL,
  PRIMARY KEY (`provider_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providers`
--

LOCK TABLES `providers` WRITE;
/*!40000 ALTER TABLE `providers` DISABLE KEYS */;
INSERT INTO `providers` VALUES (1,'Surtibelleza','2123','calle 1'),(2,'Nelly Narvaez','5486','calle 2'),(3,'Casa del peluquero','5657','calle 3'),(4,'Spayzon','5456','calle 4');
/*!40000 ALTER TABLE `providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchases` (
  `purchase_id` int unsigned NOT NULL AUTO_INCREMENT,
  `purchase_date` date NOT NULL,
  `factura` varchar(10) NOT NULL,
  PRIMARY KEY (`purchase_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` VALUES (1,'2022-02-01','SB-01'),(2,'2022-02-02','S-01'),(3,'2022-03-01','S-01');
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `sale_id` int unsigned NOT NULL AUTO_INCREMENT,
  `sale_date` date NOT NULL,
  `product_id` int unsigned NOT NULL,
  `stock_id` int unsigned NOT NULL,
  `amount` int NOT NULL,
  `sales_price` int NOT NULL,
  PRIMARY KEY (`sale_id`),
  KEY `product_id` (`product_id`),
  KEY `stock_id` (`stock_id`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,'2022-02-05',1,4,2,20000),(2,'2022-02-08',3,1,1,13000),(3,'2022-02-09',6,3,3,10000),(4,'2022-02-09',1,4,2,20000),(5,'2022-02-15',8,2,5,5000),(6,'2022-02-18',2,5,2,19000),(7,'2022-02-25',1,4,1,20000),(8,'2022-03-02',8,2,5,5000),(9,'2022-03-10',1,6,7,21000),(10,'2022-02-10',6,3,2,10000);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `stock_id` int unsigned NOT NULL AUTO_INCREMENT,
  `purchase_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `provider_id` int unsigned NOT NULL,
  `purchase_price` int NOT NULL,
  `sales_price` int NOT NULL,
  `amount` int NOT NULL,
  `sales` int DEFAULT NULL,
  PRIMARY KEY (`stock_id`),
  KEY `product_id` (`product_id`),
  KEY `purchase_id` (`purchase_id`),
  KEY `provider_id` (`provider_id`),
  CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `stock_ibfk_2` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`purchase_id`),
  CONSTRAINT `stock_ibfk_3` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`provider_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,1,3,1,10000,13000,9,1),(2,1,8,1,3000,5000,10,10),(3,1,6,1,7000,10000,10,5),(4,2,1,2,15000,20000,0,5),(5,2,2,2,14000,19000,8,2),(6,3,1,2,16000,21000,0,7);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-22 18:12:59
