CREATE DATABASE  IF NOT EXISTS `maquinasbatiz` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `maquinasbatiz`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: maquinasbatiz
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `casignatura`
--

DROP TABLE IF EXISTS `casignatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `casignatura` (
  `asignatura_id` int NOT NULL AUTO_INCREMENT,
  `asignatura_nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`asignatura_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casignatura`
--

LOCK TABLES `casignatura` WRITE;
/*!40000 ALTER TABLE `casignatura` DISABLE KEYS */;
INSERT INTO `casignatura` VALUES (5,'PSW'),(6,'LAB'),(7,'BD'),(8,'TPPC');
/*!40000 ALTER TABLE `casignatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cedoequipo`
--

DROP TABLE IF EXISTS `cedoequipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cedoequipo` (
  `edoEquipo_id` int NOT NULL AUTO_INCREMENT,
  `edoEquipo_tipo` varchar(20) NOT NULL,
  PRIMARY KEY (`edoEquipo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cedoequipo`
--

LOCK TABLES `cedoequipo` WRITE;
/*!40000 ALTER TABLE `cedoequipo` DISABLE KEYS */;
INSERT INTO `cedoequipo` VALUES (6,'Bien'),(7,'Mal'),(8,'En Almacen');
/*!40000 ALTER TABLE `cedoequipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cestadoreporte`
--

DROP TABLE IF EXISTS `cestadoreporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cestadoreporte` (
  `edoRe_id` int NOT NULL AUTO_INCREMENT,
  `edoRe_tipo` varchar(15) NOT NULL,
  PRIMARY KEY (`edoRe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cestadoreporte`
--

LOCK TABLES `cestadoreporte` WRITE;
/*!40000 ALTER TABLE `cestadoreporte` DISABLE KEYS */;
INSERT INTO `cestadoreporte` VALUES (4,'Reportado'),(5,'Atendiendo'),(6,'Finalizado');
/*!40000 ALTER TABLE `cestadoreporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cgrupo`
--

DROP TABLE IF EXISTS `cgrupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cgrupo` (
  `grupo_id` int NOT NULL AUTO_INCREMENT,
  `grupo_tipo` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`grupo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cgrupo`
--

LOCK TABLES `cgrupo` WRITE;
/*!40000 ALTER TABLE `cgrupo` DISABLE KEYS */;
INSERT INTO `cgrupo` VALUES (6,'Ninguno'),(7,'4IV7'),(8,'4IV8'),(9,'4IV9'),(10,'4IV10');
/*!40000 ALTER TABLE `cgrupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claboratorio`
--

DROP TABLE IF EXISTS `claboratorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `claboratorio` (
  `lab_id` int NOT NULL AUTO_INCREMENT,
  `lab_nom` varchar(10) NOT NULL,
  `lab_numEquipos` int NOT NULL,
  PRIMARY KEY (`lab_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claboratorio`
--

LOCK TABLES `claboratorio` WRITE;
/*!40000 ALTER TABLE `claboratorio` DISABLE KEYS */;
INSERT INTO `claboratorio` VALUES (5,'LBD',30),(6,'LNT',30),(7,'LDS',50),(8,'4.0',50);
/*!40000 ALTER TABLE `claboratorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmarca`
--

DROP TABLE IF EXISTS `cmarca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cmarca` (
  `marca_id` int NOT NULL AUTO_INCREMENT,
  `marca_nom` varchar(20) NOT NULL,
  PRIMARY KEY (`marca_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmarca`
--

LOCK TABLES `cmarca` WRITE;
/*!40000 ALTER TABLE `cmarca` DISABLE KEYS */;
INSERT INTO `cmarca` VALUES (3,'Dell'),(4,'HP');
/*!40000 ALTER TABLE `cmarca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cprioridad`
--

DROP TABLE IF EXISTS `cprioridad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cprioridad` (
  `prioridad_id` int NOT NULL AUTO_INCREMENT,
  `prioridad_tipo` varchar(15) NOT NULL,
  PRIMARY KEY (`prioridad_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cprioridad`
--

LOCK TABLES `cprioridad` WRITE;
/*!40000 ALTER TABLE `cprioridad` DISABLE KEYS */;
INSERT INTO `cprioridad` VALUES (4,'Alta '),(5,'Media'),(6,'Baja');
/*!40000 ALTER TABLE `cprioridad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cprivilegio`
--

DROP TABLE IF EXISTS `cprivilegio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cprivilegio` (
  `privilegio_id` int NOT NULL AUTO_INCREMENT,
  `privilegio_tipo` varchar(15) NOT NULL,
  PRIMARY KEY (`privilegio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cprivilegio`
--

LOCK TABLES `cprivilegio` WRITE;
/*!40000 ALTER TABLE `cprivilegio` DISABLE KEYS */;
INSERT INTO `cprivilegio` VALUES (8,'Alumno'),(9,'Jefe de Grupo'),(10,'Docente'),(11,'Jefe de Area'),(12,'Tecnico'),(13,'Jefe Tecnico'),(14,'Administrador');
/*!40000 ALTER TABLE `cprivilegio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crol`
--

DROP TABLE IF EXISTS `crol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crol` (
  `rol_id` int NOT NULL AUTO_INCREMENT,
  `rol_tipo` varchar(15) NOT NULL,
  PRIMARY KEY (`rol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crol`
--

LOCK TABLES `crol` WRITE;
/*!40000 ALTER TABLE `crol` DISABLE KEYS */;
INSERT INTO `crol` VALUES (5,'Alumno'),(6,'Docente'),(7,'Tecnico'),(8,'Administrador');
/*!40000 ALTER TABLE `crol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dequipo`
--

DROP TABLE IF EXISTS `dequipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dequipo` (
  `equipo_etiqueta` varchar(30) NOT NULL,
  `lab_id` int NOT NULL,
  `marca_id` int NOT NULL,
  `cpu_serial` varchar(30) NOT NULL,
  `accesorio_id` int NOT NULL,
  `monitor_id` varchar(30) NOT NULL,
  `config_id` varchar(30) NOT NULL,
  `edoEquipo_id` int NOT NULL,
  PRIMARY KEY (`equipo_etiqueta`),
  KEY `lab_id` (`lab_id`),
  KEY `marca_id` (`marca_id`),
  KEY `cpu_serial` (`cpu_serial`),
  KEY `accesorio_id` (`accesorio_id`),
  KEY `monitor_id` (`monitor_id`),
  KEY `config_id` (`config_id`),
  KEY `edoEquipo_id` (`edoEquipo_id`),
  CONSTRAINT `dequipo_ibfk_1` FOREIGN KEY (`lab_id`) REFERENCES `claboratorio` (`lab_id`),
  CONSTRAINT `dequipo_ibfk_2` FOREIGN KEY (`marca_id`) REFERENCES `cmarca` (`marca_id`),
  CONSTRAINT `dequipo_ibfk_3` FOREIGN KEY (`cpu_serial`) REFERENCES `mcpu` (`cpu_serial`),
  CONSTRAINT `dequipo_ibfk_4` FOREIGN KEY (`accesorio_id`) REFERENCES `maccesorio` (`accesorio_id`),
  CONSTRAINT `dequipo_ibfk_5` FOREIGN KEY (`monitor_id`) REFERENCES `mmonitor` (`monitor_id`),
  CONSTRAINT `dequipo_ibfk_6` FOREIGN KEY (`config_id`) REFERENCES `mconfiguracion` (`config_id`),
  CONSTRAINT `dequipo_ibfk_7` FOREIGN KEY (`edoEquipo_id`) REFERENCES `cedoequipo` (`edoEquipo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dequipo`
--

LOCK TABLES `dequipo` WRITE;
/*!40000 ALTER TABLE `dequipo` DISABLE KEYS */;
INSERT INTO `dequipo` VALUES ('AULA1',8,4,'CPU003',2,'MONITOR003','CONFIGURACION002',6),('LBD1',5,3,'CPU001',1,'MONITOR001','CONFIGURACION001',7),('LDS1',7,3,'CPU001',1,'MONITOR002','CONFIGURACION003',6),('LNT1',6,4,'CPU002',2,'MONITOR002','CONFIGURACION002',6);
/*!40000 ALTER TABLE `dequipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dreporte`
--

DROP TABLE IF EXISTS `dreporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dreporte` (
  `detalleReporte_id` int NOT NULL AUTO_INCREMENT,
  `prioridad_id` int NOT NULL,
  `edoRe_id` int NOT NULL,
  `asignatura_id` int NOT NULL,
  `detalleReporte_fecha` date NOT NULL,
  `detalleReporte_hora` time NOT NULL,
  `problema` varchar(120) NOT NULL,
  `persona_id` int NOT NULL,
  `equipo_etiqueta` varchar(30) NOT NULL,
  PRIMARY KEY (`detalleReporte_id`),
  KEY `prioridad_id` (`prioridad_id`),
  KEY `edoRe_id` (`edoRe_id`),
  KEY `asignatura_id` (`asignatura_id`),
  KEY `fk_dreporte_mpersona1_idx` (`persona_id`),
  KEY `fk_dreporte_dequipo1_idx` (`equipo_etiqueta`),
  CONSTRAINT `dreporte_ibfk_3` FOREIGN KEY (`prioridad_id`) REFERENCES `cprioridad` (`prioridad_id`),
  CONSTRAINT `dreporte_ibfk_4` FOREIGN KEY (`edoRe_id`) REFERENCES `cestadoreporte` (`edoRe_id`),
  CONSTRAINT `dreporte_ibfk_6` FOREIGN KEY (`asignatura_id`) REFERENCES `casignatura` (`asignatura_id`),
  CONSTRAINT `fk_dreporte_dequipo1` FOREIGN KEY (`equipo_etiqueta`) REFERENCES `dequipo` (`equipo_etiqueta`),
  CONSTRAINT `fk_dreporte_mpersona1` FOREIGN KEY (`persona_id`) REFERENCES `mpersona` (`persona_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dreporte`
--

LOCK TABLES `dreporte` WRITE;
/*!40000 ALTER TABLE `dreporte` DISABLE KEYS */;
INSERT INTO `dreporte` VALUES (1,5,6,6,'2021-04-27','12:40:00','Teclado no Funciona',6,'LBD1'),(2,5,4,7,'2021-04-04','12:40:41','Mouse malo',6,'LBD1'),(3,5,4,7,'2022-06-07','18:33:00','Monitor malo',5,'LNT1'),(4,5,6,7,'2021-04-04','12:40:41','Mouse malo',6,'AULA1'),(5,5,6,7,'2021-04-04','12:40:41','Mouse en funcionamiento',6,'LDS1'),(6,4,5,6,'2022-06-28','00:53:00','Problema en desarrollo de software 3',5,'LDS1'),(7,6,4,8,'2022-06-18','00:52:00','aula',5,'AULA1'),(8,5,6,8,'2022-06-19','00:53:00','Problema3',6,'LBD1');
/*!40000 ALTER TABLE `dreporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eequiposreportados`
--

DROP TABLE IF EXISTS `eequiposreportados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eequiposreportados` (
  `equiposRepor_id` int NOT NULL AUTO_INCREMENT,
  `equipo_etiqueta` varchar(30) NOT NULL,
  `Problema` varchar(60) NOT NULL,
  PRIMARY KEY (`equiposRepor_id`),
  KEY `equipo_etiqueta` (`equipo_etiqueta`),
  CONSTRAINT `eequiposreportados_ibfk_1` FOREIGN KEY (`equipo_etiqueta`) REFERENCES `dequipo` (`equipo_etiqueta`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eequiposreportados`
--

LOCK TABLES `eequiposreportados` WRITE;
/*!40000 ALTER TABLE `eequiposreportados` DISABLE KEYS */;
/*!40000 ALTER TABLE `eequiposreportados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ereportespersona`
--

DROP TABLE IF EXISTS `ereportespersona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ereportespersona` (
  `reportePer_id` int NOT NULL AUTO_INCREMENT,
  `persona_id` int NOT NULL,
  PRIMARY KEY (`reportePer_id`),
  KEY `persona_id` (`persona_id`),
  CONSTRAINT `ereportespersona_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `mpersona` (`persona_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ereportespersona`
--

LOCK TABLES `ereportespersona` WRITE;
/*!40000 ALTER TABLE `ereportespersona` DISABLE KEYS */;
/*!40000 ALTER TABLE `ereportespersona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maccesorio`
--

DROP TABLE IF EXISTS `maccesorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maccesorio` (
  `accesorio_id` int NOT NULL AUTO_INCREMENT,
  `config_descripcionTeclado` varchar(50) NOT NULL,
  `config_descripcionMause` varchar(50) NOT NULL,
  PRIMARY KEY (`accesorio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maccesorio`
--

LOCK TABLES `maccesorio` WRITE;
/*!40000 ALTER TABLE `maccesorio` DISABLE KEYS */;
INSERT INTO `maccesorio` VALUES (1,'Teclado Gris','Mouse Negro'),(2,'Teclado Blanco','Mouse Blanco');
/*!40000 ALTER TABLE `maccesorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mconfiguracion`
--

DROP TABLE IF EXISTS `mconfiguracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mconfiguracion` (
  `config_id` varchar(30) NOT NULL,
  `config_descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mconfiguracion`
--

LOCK TABLES `mconfiguracion` WRITE;
/*!40000 ALTER TABLE `mconfiguracion` DISABLE KEYS */;
INSERT INTO `mconfiguracion` VALUES ('CONFIGURACION001','WINDOWS 10'),('CONFIGURACION002','WINDOWS 8'),('CONFIGURACION003','WINDOWS 7');
/*!40000 ALTER TABLE `mconfiguracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mcpu`
--

DROP TABLE IF EXISTS `mcpu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mcpu` (
  `cpu_serial` varchar(30) NOT NULL,
  `cpu_descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`cpu_serial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mcpu`
--

LOCK TABLES `mcpu` WRITE;
/*!40000 ALTER TABLE `mcpu` DISABLE KEYS */;
INSERT INTO `mcpu` VALUES ('CPU001','Computadora Negra'),('CPU002','Computadora Blanca'),('CPU003','Computadora Gris');
/*!40000 ALTER TABLE `mcpu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmonitor`
--

DROP TABLE IF EXISTS `mmonitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mmonitor` (
  `monitor_id` varchar(30) NOT NULL,
  `monitor_descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`monitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmonitor`
--

LOCK TABLES `mmonitor` WRITE;
/*!40000 ALTER TABLE `mmonitor` DISABLE KEYS */;
INSERT INTO `mmonitor` VALUES ('MONITOR001','Monitor 24 pulgadas Negro'),('MONITOR002','Monitor 24 pulgadas Blanco'),('MONITOR003','Monitor 24 pulgadas Gris');
/*!40000 ALTER TABLE `mmonitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpersona`
--

DROP TABLE IF EXISTS `mpersona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mpersona` (
  `persona_id` int NOT NULL AUTO_INCREMENT,
  `identificador` int NOT NULL,
  `persona_nombre` varchar(50) NOT NULL,
  `persona_appat` varchar(50) NOT NULL,
  `persona_apmat` varchar(50) NOT NULL,
  `persona_sexo` varchar(10) NOT NULL,
  `persona_fechaNacimiento` date NOT NULL,
  `persona_user` varchar(30) NOT NULL,
  `persona_pass` varchar(34) NOT NULL,
  `grupo_id` int DEFAULT NULL,
  `rol_id` int NOT NULL,
  `privilegio_id` int NOT NULL,
  PRIMARY KEY (`persona_id`),
  KEY `grupo_id` (`grupo_id`),
  KEY `rol_id` (`rol_id`),
  KEY `privilegio_id` (`privilegio_id`),
  CONSTRAINT `mpersona_ibfk_1` FOREIGN KEY (`grupo_id`) REFERENCES `cgrupo` (`grupo_id`),
  CONSTRAINT `mpersona_ibfk_2` FOREIGN KEY (`rol_id`) REFERENCES `crol` (`rol_id`),
  CONSTRAINT `mpersona_ibfk_3` FOREIGN KEY (`privilegio_id`) REFERENCES `cprivilegio` (`privilegio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpersona`
--

LOCK TABLES `mpersona` WRITE;
/*!40000 ALTER TABLE `mpersona` DISABLE KEYS */;
INSERT INTO `mpersona` VALUES (5,2,'Jaime','Minor','Perez','Masculino','2000-12-21','minor','soyjaime123',7,6,11),(6,2021090341,'Alejandro','Colunga','Aguilar','Masculino','2005-01-21','j4v1r','hola123',8,5,8),(7,456598,'Carolina','Admin','Admin','/','2022-04-28','admin1','soyadmin',7,8,14),(8,2021090341,'Emmanuel','Hernandez','Mendoza','Masculino','2022-06-18','emma','emma123',8,6,10),(10,34,'Omar','Cazabal','Rosalez','Masculino','2022-05-30','omar','omar123',6,7,12);
/*!40000 ALTER TABLE `mpersona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mreporte`
--

DROP TABLE IF EXISTS `mreporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mreporte` (
  `maestraReporte_id` int NOT NULL AUTO_INCREMENT,
  `maestraReporte_cantidadRepeticiones` int NOT NULL,
  PRIMARY KEY (`maestraReporte_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mreporte`
--

LOCK TABLES `mreporte` WRITE;
/*!40000 ALTER TABLE `mreporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `mreporte` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-20  0:50:23
