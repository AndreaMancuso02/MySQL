-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: gestionale
-- ------------------------------------------------------
-- Server version	8.4.4

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
-- Dumping data for table `articoli`
--

LOCK TABLES `articoli` WRITE;
/*!40000 ALTER TABLE `articoli` DISABLE KEYS */;
INSERT INTO `articoli` VALUES (1,'monitor',350.00,'hardware',74),(2,'chiavetta',38.50,'hardware',30),(3,'hard-disk',300.00,'hardware',88),(4,'smartwatch',400.00,'hardware',92),(5,'Photoshop',700.00,'software',96),(6,'Office',350.50,'software',90),(7,'Webcam',68.00,'hardware',88),(8,'Adobe CC',1200.00,'software',NULL),(9,'Office',120.00,'software',NULL);
/*!40000 ALTER TABLE `articoli` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `clienti`
--

LOCK TABLES `clienti` WRITE;
/*!40000 ALTER TABLE `clienti` DISABLE KEYS */;
INSERT INTO `clienti` VALUES (1,'rossi','paolo','0116702323','paolo25@gmail.com','Via Roma 25','torino','To','Piemonte',0),(2,'mori','marco','0116704040','marco18@gmail.com','Via Torino 18','milano','Mi','Lombardia',0),(3,'bianchi','luca','0116701010','luca2@gmail.com','Via Milano 2','bologna','Bo','Emilia-Romagna',0),(4,'verdi','mario','0116702020','mario128@gmail.com','Corso Francia 128','torino','To','Piemonte',0),(5,'rosso','alberto','0116707070','alberto12@icloud.com','Corso Svizzera 12','milano','Mi','Lombardia',0),(6,'esposito','franco','0119978812','francoe@icloud.com','Via Roma 3','Asti','At','Piemonte',0),(7,'bruni','carlo','0117778816','brunicarlo@icloud.com','Corso Stati Uniti 13','Torino','To','Piemonte',0);
/*!40000 ALTER TABLE `clienti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `impiegati`
--

LOCK TABLES `impiegati` WRITE;
/*!40000 ALTER TABLE `impiegati` DISABLE KEYS */;
INSERT INTO `impiegati` VALUES (1,'Mario','Rossi','tecnico',NULL,2500.00,1),(2,'Marco','Bianchi','amministrativo',7,1600.00,2),(3,'Paolo','Verdi','amministrativo',7,1600.00,2),(4,'Enrico','Marrone','venditore',8,1300.00,3),(5,'Nicola','Testa','venditore',8,1300.00,3),(6,'Franco','Barba','tecnico',1,1500.00,1),(7,'Elena','Totti','amministrativo',NULL,2600.00,2),(8,'Paola','Capra','venditore',NULL,2300.00,3),(9,'Mauro','Barba','venditore',8,1300.00,3);
/*!40000 ALTER TABLE `impiegati` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ordini`
--

LOCK TABLES `ordini` WRITE;
/*!40000 ALTER TABLE `ordini` DISABLE KEYS */;
INSERT INTO `ordini` VALUES (1,1,'2017-12-01','consegnato'),(2,3,'2018-01-11','consegnato'),(3,5,'2018-01-21','da spedire'),(4,3,'2018-01-23','spedito'),(5,6,'2018-02-03','consegnato'),(7,6,'2018-02-13','da spedire'),(12,3,'2018-02-28','spedito'),(13,7,'2025-07-15','da spedire');
/*!40000 ALTER TABLE `ordini` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ordini_dettaglio`
--

LOCK TABLES `ordini_dettaglio` WRITE;
/*!40000 ALTER TABLE `ordini_dettaglio` DISABLE KEYS */;
INSERT INTO `ordini_dettaglio` VALUES (1,2,20,38.50),(1,7,3,68.00),(2,5,1,700.00),(2,6,5,350.50),(3,2,10,38.50),(3,4,1,400.00),(4,1,3,350.00),(4,3,2,300.00),(4,7,1,68.00),(5,3,2,300.00),(5,4,3,400.00),(5,5,1,700.00),(5,7,1,68.00),(7,2,5,38.50),(7,3,2,300.00),(7,7,1,68.00),(12,1,10,350.00),(13,1,10,NULL);
/*!40000 ALTER TABLE `ordini_dettaglio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `uffici`
--

LOCK TABLES `uffici` WRITE;
/*!40000 ALTER TABLE `uffici` DISABLE KEYS */;
INSERT INTO `uffici` VALUES (1,'IT','3332208666','via milano 31','torino','piemonte'),(2,'Amministrazione','3332208688','via torino 25','milano','lombardia'),(3,'Commerciale','3332207899','via milano 33','torino','piemonte'),(4,'Logistica','3332204366','via torino 27','milano','lombardia');
/*!40000 ALTER TABLE `uffici` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-18  9:21:29
