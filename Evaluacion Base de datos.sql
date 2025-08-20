-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: evaluacion_final_bases de datos
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `accidente`
--

DROP TABLE IF EXISTS `accidente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accidente` (
  `idaccidente` int NOT NULL,
  `accifecha` date NOT NULL,
  `accihora` time NOT NULL,
  `accilugar` varchar(150) NOT NULL,
  `acciorigen` varchar(100) NOT NULL,
  `acciconsecuencias` varchar(100) DEFAULT NULL,
  `cliente_rutcliente` int NOT NULL,
  PRIMARY KEY (`idaccidente`),
  KEY `fk_accidente_cliente_idx` (`cliente_rutcliente`),
  CONSTRAINT `fk_accidente_cliente` FOREIGN KEY (`cliente_rutcliente`) REFERENCES `cliente` (`rutcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accidente`
--

LOCK TABLES `accidente` WRITE;
/*!40000 ALTER TABLE `accidente` DISABLE KEYS */;
/*!40000 ALTER TABLE `accidente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asistentes`
--

DROP TABLE IF EXISTS `asistentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asistentes` (
  `idasistentes` int NOT NULL,
  `asistnombrecompleto` varchar(100) NOT NULL,
  `asistedad` decimal(3,0) NOT NULL,
  `asiscorreo` varchar(70) DEFAULT NULL,
  `asisttelefono` varchar(45) DEFAULT NULL,
  `capacitacion_idcapacitacion` int NOT NULL,
  PRIMARY KEY (`idasistentes`),
  KEY `fk_asistentes_capacitacion1_idx` (`capacitacion_idcapacitacion`),
  CONSTRAINT `fk_asistentes_capacitacion1` FOREIGN KEY (`capacitacion_idcapacitacion`) REFERENCES `capacitacion` (`idcapacitacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistentes`
--

LOCK TABLES `asistentes` WRITE;
/*!40000 ALTER TABLE `asistentes` DISABLE KEYS */;
/*!40000 ALTER TABLE `asistentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capacitacion`
--

DROP TABLE IF EXISTS `capacitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `capacitacion` (
  `idcapacitacion` int NOT NULL,
  `capfecha` date NOT NULL,
  `caphora` time DEFAULT NULL,
  `caplugar` varchar(100) NOT NULL,
  `capduracion` decimal(4,0) DEFAULT NULL,
  `cliente_rutcliente` int NOT NULL,
  PRIMARY KEY (`idcapacitacion`),
  KEY `fk_capacitacion_cliente1_idx` (`cliente_rutcliente`),
  CONSTRAINT `fk_capacitacion_cliente1` FOREIGN KEY (`cliente_rutcliente`) REFERENCES `cliente` (`rutcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capacitacion`
--

LOCK TABLES `capacitacion` WRITE;
/*!40000 ALTER TABLE `capacitacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `capacitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `rutcliente` int NOT NULL,
  `clinombres` varchar(30) NOT NULL,
  `cliapllidos` varchar(50) NOT NULL,
  `clitelefono` varchar(20) NOT NULL,
  `cliafp` varchar(30) DEFAULT NULL,
  `clisistemasalud` decimal(2,0) DEFAULT NULL,
  `clidireccionl` varchar(100) NOT NULL,
  `clicomuna` varchar(50) NOT NULL,
  `cliedad` decimal(3,0) NOT NULL,
  PRIMARY KEY (`rutcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visita`
--

DROP TABLE IF EXISTS `visita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visita` (
  `idvisita` int NOT NULL,
  `visfecha` date NOT NULL,
  `vishora` time DEFAULT NULL,
  `caplugar` varchar(50) NOT NULL,
  `viscomentarios` varchar(250) NOT NULL,
  `cliente_rutcliente` int NOT NULL,
  PRIMARY KEY (`idvisita`),
  KEY `fk_capacitacion_cliente1_idx` (`cliente_rutcliente`),
  CONSTRAINT `fk_capacitacion_cliente10` FOREIGN KEY (`cliente_rutcliente`) REFERENCES `cliente` (`rutcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visita`
--

LOCK TABLES `visita` WRITE;
/*!40000 ALTER TABLE `visita` DISABLE KEYS */;
/*!40000 ALTER TABLE `visita` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-19 20:50:07
