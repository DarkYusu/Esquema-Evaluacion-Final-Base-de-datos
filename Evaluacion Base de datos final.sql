-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: testevaluacion_final
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
-- Table structure for table `accidentes`
--

DROP TABLE IF EXISTS `accidentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accidentes` (
  `idaccidente` int unsigned NOT NULL,
  `accifecha` date NOT NULL,
  `accihora` time NOT NULL,
  `accilugar` varchar(150) NOT NULL,
  `acciorigen` varchar(100) NOT NULL,
  `acciconsecuencias` varchar(100) DEFAULT NULL,
  `Clientes_rutcliente` int unsigned NOT NULL,
  PRIMARY KEY (`idaccidente`),
  KEY `fk_Accidentes_Clientes1_idx` (`Clientes_rutcliente`),
  CONSTRAINT `fk_Accidentes_Clientes1` FOREIGN KEY (`Clientes_rutcliente`) REFERENCES `clientes` (`rutcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accidentes`
--

LOCK TABLES `accidentes` WRITE;
/*!40000 ALTER TABLE `accidentes` DISABLE KEYS */;
INSERT INTO `accidentes` VALUES (401,'2025-08-02','14:15:00','Bodega Central','Caída de carga','Lesión leve en pierna',101),(402,'2025-08-06','11:45:00','Planta Norte','Falla eléctrica','Quemadura leve',102),(403,'2025-08-12','08:20:00','Zona de carga','Resbalón','Esguince de tobillo',103);
/*!40000 ALTER TABLE `accidentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrativo`
--

DROP TABLE IF EXISTS `administrativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrativo` (
  `rutadministrativo` int NOT NULL,
  `adminombre` varchar(50) NOT NULL,
  `admiapellido` varchar(50) NOT NULL,
  `admicorreo` varchar(50) NOT NULL,
  `adminombrearea` varchar(50) NOT NULL,
  `Usuarios_idusuario` int unsigned NOT NULL,
  PRIMARY KEY (`rutadministrativo`),
  KEY `fk_Administrativo_Usuarios1_idx` (`Usuarios_idusuario`),
  CONSTRAINT `fk_Administrativo_Usuarios1` FOREIGN KEY (`Usuarios_idusuario`) REFERENCES `usuarios` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrativo`
--

LOCK TABLES `administrativo` WRITE;
/*!40000 ALTER TABLE `administrativo` DISABLE KEYS */;
INSERT INTO `administrativo` VALUES (104,'Claudia','Reyes Soto','claudia.reyes@empresa.cl','Recursos Humanos',4),(105,'Luis','Fernández Pino','luis.fernandez@empresa.cl','Finanzas',5),(106,'Sofía','Castro Aguilar','sofia.castro@empresa.cl','Prevención de Riesgos',6);
/*!40000 ALTER TABLE `administrativo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asesorias`
--

DROP TABLE IF EXISTS `asesorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asesorias` (
  `idasesoria` int unsigned NOT NULL,
  `asesfecha` date NOT NULL,
  `asesmotivo` varchar(70) NOT NULL,
  `Profesionales_rutprofesional` int unsigned NOT NULL,
  `Clientes_rutcliente` int unsigned NOT NULL,
  PRIMARY KEY (`idasesoria`),
  KEY `fk_Asesorias_Profesionales1_idx` (`Profesionales_rutprofesional`),
  KEY `fk_Asesorias_Clientes1_idx` (`Clientes_rutcliente`),
  CONSTRAINT `fk_Asesorias_Clientes1` FOREIGN KEY (`Clientes_rutcliente`) REFERENCES `clientes` (`rutcliente`),
  CONSTRAINT `fk_Asesorias_Profesionales1` FOREIGN KEY (`Profesionales_rutprofesional`) REFERENCES `profesionales` (`rutprofesional`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asesorias`
--

LOCK TABLES `asesorias` WRITE;
/*!40000 ALTER TABLE `asesorias` DISABLE KEYS */;
INSERT INTO `asesorias` VALUES (1,'2025-08-12','Revisión de protocolos de seguridad',107,101),(2,'2025-08-13','Evaluación de riesgos eléctricos',108,102),(3,'2025-08-14','Control de emisiones contaminantes',109,103);
/*!40000 ALTER TABLE `asesorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asistentes`
--

DROP TABLE IF EXISTS `asistentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asistentes` (
  `idasistentes` int unsigned NOT NULL,
  `asistnombrecompleto` varchar(100) NOT NULL,
  `asistedad` decimal(3,0) NOT NULL,
  `asistcorreo` varchar(70) DEFAULT NULL,
  `asisttelefono` varchar(20) DEFAULT NULL,
  `Capacitacion_idcapacitacion` int unsigned NOT NULL,
  PRIMARY KEY (`idasistentes`),
  KEY `fk_Asistentes_Capacitacion1_idx` (`Capacitacion_idcapacitacion`),
  CONSTRAINT `fk_Asistentes_Capacitacion1` FOREIGN KEY (`Capacitacion_idcapacitacion`) REFERENCES `capacitacion` (`idcapacitacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistentes`
--

LOCK TABLES `asistentes` WRITE;
/*!40000 ALTER TABLE `asistentes` DISABLE KEYS */;
INSERT INTO `asistentes` VALUES (301,'Pedro González',28,'pedro.gonzalez@mail.com','911223344',201),(302,'Lucía Ramírez',32,'lucia.ramirez@mail.com','933445566',202),(303,'Andrés Silva',40,'andres.silva@mail.com','977889900',203);
/*!40000 ALTER TABLE `asistentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capacitacion`
--

DROP TABLE IF EXISTS `capacitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `capacitacion` (
  `idcapacitacion` int unsigned NOT NULL,
  `capfecha` date NOT NULL,
  `caphora` time DEFAULT NULL,
  `caplugar` varchar(100) NOT NULL,
  `capduracion` decimal(4,0) NOT NULL,
  `Clientes_rutcliente` int unsigned NOT NULL,
  PRIMARY KEY (`idcapacitacion`),
  KEY `fk_Capacitacion_Clientes_idx` (`Clientes_rutcliente`),
  CONSTRAINT `fk_Capacitacion_Clientes` FOREIGN KEY (`Clientes_rutcliente`) REFERENCES `clientes` (`rutcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capacitacion`
--

LOCK TABLES `capacitacion` WRITE;
/*!40000 ALTER TABLE `capacitacion` DISABLE KEYS */;
INSERT INTO `capacitacion` VALUES (201,'2025-08-01','10:00:00','Sala Norte',120,101),(202,'2025-08-05','15:30:00','Sala Sur',90,102),(203,'2025-08-10','09:00:00','Auditorio Central',180,103);
/*!40000 ALTER TABLE `capacitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chequeos`
--

DROP TABLE IF EXISTS `chequeos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chequeos` (
  `idchequeo` int unsigned NOT NULL,
  `cheqnombre` varchar(50) NOT NULL,
  PRIMARY KEY (`idchequeo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chequeos`
--

LOCK TABLES `chequeos` WRITE;
/*!40000 ALTER TABLE `chequeos` DISABLE KEYS */;
INSERT INTO `chequeos` VALUES (1,'Revisión de extintores'),(2,'Chequeo de señalización'),(3,'Control de salidas de emergencia');
/*!40000 ALTER TABLE `chequeos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `rutcliente` int unsigned NOT NULL,
  `clinombres` varchar(30) NOT NULL,
  `cliapellidos` varchar(50) NOT NULL,
  `clitelefono` varchar(20) NOT NULL,
  `cliafp` varchar(30) DEFAULT NULL,
  `clisistemasalud` decimal(2,0) DEFAULT NULL,
  `clidireccion` varchar(100) NOT NULL,
  `clicomuna` varchar(50) NOT NULL,
  `cliedad` decimal(3,0) NOT NULL,
  `Usuarios_idusuario` int unsigned NOT NULL,
  PRIMARY KEY (`rutcliente`),
  KEY `fk_Clientes_Usuarios1_idx` (`Usuarios_idusuario`),
  CONSTRAINT `fk_Clientes_Usuarios1` FOREIGN KEY (`Usuarios_idusuario`) REFERENCES `usuarios` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (101,'Juan','Pérez Soto','987654321','AFP Habitat',1,'Av. Principal 123','Santiago',35,1),(102,'María','López Díaz','912345678','AFP Provida',2,'Calle Secundaria 456','Valparaíso',42,2),(103,'Carlos','Martínez Rojas','998877665','AFP Cuprum',1,'Av. Central 789','Concepción',29,3);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `idpagos` int NOT NULL AUTO_INCREMENT,
  `pagfecha` date NOT NULL,
  `pagmonto` int NOT NULL,
  `pagmes` varchar(10) NOT NULL,
  `pagano` year NOT NULL,
  `Clientes_rutcliente` int unsigned NOT NULL,
  PRIMARY KEY (`idpagos`),
  KEY `fk_Pagos_Clientes1_idx` (`Clientes_rutcliente`),
  CONSTRAINT `fk_Pagos_Clientes1` FOREIGN KEY (`Clientes_rutcliente`) REFERENCES `clientes` (`rutcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES (1,'2025-08-01',120000,'7',2025,101),(2,'2025-08-05',130000,'7',2025,102),(3,'2025-08-10',150000,'8',2025,103);
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesionales`
--

DROP TABLE IF EXISTS `profesionales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesionales` (
  `rutprofesional` int unsigned NOT NULL,
  `profnombres` varchar(35) NOT NULL,
  `profapellidos` varchar(35) NOT NULL,
  `proftelefono` varchar(15) NOT NULL,
  `proftitulo` varchar(50) NOT NULL,
  `profproyecto` varchar(50) NOT NULL,
  `Usuarios_idusuario` int unsigned NOT NULL,
  PRIMARY KEY (`rutprofesional`),
  KEY `fk_Profesionales_Usuarios1_idx` (`Usuarios_idusuario`),
  CONSTRAINT `fk_Profesionales_Usuarios1` FOREIGN KEY (`Usuarios_idusuario`) REFERENCES `usuarios` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesionales`
--

LOCK TABLES `profesionales` WRITE;
/*!40000 ALTER TABLE `profesionales` DISABLE KEYS */;
INSERT INTO `profesionales` VALUES (107,'Gabriel','Muñoz Rivas','987654321','Ingeniero en Prevención de Riesgos','Proyecto A',4),(108,'Camila','Herrera Soto','912345678','Ingeniera Civil Industrial','Proyecto B',5),(109,'Felipe','Araya López','976543210','Ingeniero Ambiental','Proyecto C',6);
/*!40000 ALTER TABLE `profesionales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recomendaciones`
--

DROP TABLE IF EXISTS `recomendaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recomendaciones` (
  `idrecomendacion` int unsigned NOT NULL AUTO_INCREMENT,
  `recomtitulo` varchar(50) NOT NULL,
  `recomdescripcion` varchar(100) NOT NULL,
  `recomplazosolucion` int NOT NULL,
  `Asesorias_idasesoria` int unsigned NOT NULL,
  PRIMARY KEY (`idrecomendacion`),
  KEY `fk_Recomendaciones_Asesorias1_idx` (`Asesorias_idasesoria`),
  CONSTRAINT `fk_Recomendaciones_Asesorias1` FOREIGN KEY (`Asesorias_idasesoria`) REFERENCES `asesorias` (`idasesoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recomendaciones`
--

LOCK TABLES `recomendaciones` WRITE;
/*!40000 ALTER TABLE `recomendaciones` DISABLE KEYS */;
INSERT INTO `recomendaciones` VALUES (1,'Capacitación en uso de extintores','Instruir al personal sobre el uso adecuado de extintores.',15,1),(2,'Reparación de cableado defectuoso','Reemplazar cableado en mal estado en planta norte.',10,2),(3,'Instalación de filtros adicionales','Colocar filtros para reducción de emisiones.',20,3);
/*!40000 ALTER TABLE `recomendaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idusuario` int unsigned NOT NULL,
  `usuanombre` varchar(35) NOT NULL,
  `usuaapellido` varchar(35) NOT NULL,
  `usufechanacimiento` date NOT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Juan','Pérez Soto','1988-05-12'),(2,'María','López Díaz','1990-09-20'),(3,'Carlos','Martínez Rojas','1985-01-30'),(4,'Ana','Gutiérrez Fuentes','1992-11-10'),(5,'Diego','Ramírez Salas','1987-03-18'),(6,'Paula','Morales Torres','1991-07-25');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitas`
--

DROP TABLE IF EXISTS `visitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitas` (
  `idvisita` int unsigned NOT NULL,
  `visfecha` date NOT NULL,
  `vishora` time DEFAULT NULL,
  `vislugar` varchar(50) NOT NULL,
  `viscomentarios` varchar(250) NOT NULL,
  `Clientes_rutcliente` int unsigned NOT NULL,
  PRIMARY KEY (`idvisita`),
  KEY `fk_Visitas_Clientes1_idx` (`Clientes_rutcliente`),
  CONSTRAINT `fk_Visitas_Clientes1` FOREIGN KEY (`Clientes_rutcliente`) REFERENCES `clientes` (`rutcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitas`
--

LOCK TABLES `visitas` WRITE;
/*!40000 ALTER TABLE `visitas` DISABLE KEYS */;
INSERT INTO `visitas` VALUES (501,'2025-08-03','09:30:00','Planta Santiago','Revisión de seguridad mensual',101),(502,'2025-08-07','16:00:00','Planta Valparaíso','Seguimiento de capacitación',102),(503,'2025-08-11','10:15:00','Planta Concepción','Inspección general',103);
/*!40000 ALTER TABLE `visitas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitas_has_chequeos`
--

DROP TABLE IF EXISTS `visitas_has_chequeos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitas_has_chequeos` (
  `Visitas_idvisita` int unsigned NOT NULL,
  `Chequeos_idchequeo` int unsigned NOT NULL,
  `estado` enum('cumple','cumple con observaciones','no cumple') NOT NULL,
  PRIMARY KEY (`Visitas_idvisita`,`Chequeos_idchequeo`),
  KEY `fk_Visitas_has_Chequeos_Chequeos1_idx` (`Chequeos_idchequeo`),
  KEY `fk_Visitas_has_Chequeos_Visitas1_idx` (`Visitas_idvisita`),
  CONSTRAINT `fk_Visitas_has_Chequeos_Chequeos1` FOREIGN KEY (`Chequeos_idchequeo`) REFERENCES `chequeos` (`idchequeo`),
  CONSTRAINT `fk_Visitas_has_Chequeos_Visitas1` FOREIGN KEY (`Visitas_idvisita`) REFERENCES `visitas` (`idvisita`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitas_has_chequeos`
--

LOCK TABLES `visitas_has_chequeos` WRITE;
/*!40000 ALTER TABLE `visitas_has_chequeos` DISABLE KEYS */;
INSERT INTO `visitas_has_chequeos` VALUES (501,1,'cumple'),(502,2,'cumple con observaciones'),(503,3,'no cumple');
/*!40000 ALTER TABLE `visitas_has_chequeos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-21 22:52:31
