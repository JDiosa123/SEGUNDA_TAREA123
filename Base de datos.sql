-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: escuela-taller
-- ------------------------------------------------------
-- Server version	8.0.37
CREATE DATABASE IF NOT EXISTS `escuela-taller`;
USE `escuela-taller`;



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
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
  `cod_curso` int NOT NULL,
  `nom_curso` varchar(30) NOT NULL,
  `cod_docente` int NOT NULL,
  PRIMARY KEY (`cod_curso`),
  KEY `fk_curso_docente` (`cod_docente`),
  CONSTRAINT `fk_curso_docente` FOREIGN KEY (`cod_docente`) REFERENCES `docentes` (`cod_docente`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (301,'Matemáticas I',101),(302,'Historia Universal',102),(303,'Programación Web',101);
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docentes`
--

DROP TABLE IF EXISTS `docentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docentes` (
  `cod_docente` int NOT NULL,
  `nom_docente` varchar(30) NOT NULL,
  PRIMARY KEY (`cod_docente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docentes`
--

LOCK TABLES `docentes` WRITE;
/*!40000 ALTER TABLE `docentes` DISABLE KEYS */;
INSERT INTO `docentes` VALUES (101,'Ana Pérez'),(102,'Luis Gómez');
/*!40000 ALTER TABLE `docentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiantes`
--

DROP TABLE IF EXISTS `estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiantes` (
  `cod_estudiante` int NOT NULL,
  `nom_estudiante` varchar(30) NOT NULL,
  PRIMARY KEY (`cod_estudiante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiantes`
--

LOCK TABLES `estudiantes` WRITE;
/*!40000 ALTER TABLE `estudiantes` DISABLE KEYS */;
INSERT INTO `estudiantes` VALUES (201,'Carlos Ruiz'),(202,'Laura Méndez'),(203,'Pedro Vargas');
/*!40000 ALTER TABLE `estudiantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matricula`
--

DROP TABLE IF EXISTS `matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matricula` (
  `cod_estudiante` int NOT NULL,
  `cod_curso` int NOT NULL,
  `nota_curso` float DEFAULT NULL,
  PRIMARY KEY (`cod_estudiante`,`cod_curso`),
  KEY `fk_matricula_curso` (`cod_curso`),
  CONSTRAINT `fk_matricula_curso` FOREIGN KEY (`cod_curso`) REFERENCES `cursos` (`cod_curso`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_matricula_estudiante` FOREIGN KEY (`cod_estudiante`) REFERENCES `estudiantes` (`cod_estudiante`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matricula`
--

LOCK TABLES `matricula` WRITE;
/*!40000 ALTER TABLE `matricula` DISABLE KEYS */;
INSERT INTO `matricula` VALUES (201,301,4.5),(201,303,5),(202,302,3.8),(203,301,4),(203,302,4.2);
/*!40000 ALTER TABLE `matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_notas_detalle_simple`
--

DROP TABLE IF EXISTS `vista_notas_detalle_simple`;
/*!50001 DROP VIEW IF EXISTS `vista_notas_detalle_simple`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_notas_detalle_simple` AS SELECT 
 1 AS `nombre_estudiante`,
 1 AS `nombre_curso`,
 1 AS `nombre_docente_curso`,
 1 AS `nota_curso`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'escuela-taller'
--

--
-- Dumping routines for database 'escuela-taller'
--

--
-- Final view structure for view `vista_notas_detalle_simple`
--

/*!50001 DROP VIEW IF EXISTS `vista_notas_detalle_simple`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_notas_detalle_simple` AS select `e`.`nom_estudiante` AS `nombre_estudiante`,`c`.`nom_curso` AS `nombre_curso`,`d`.`nom_docente` AS `nombre_docente_curso`,`m`.`nota_curso` AS `nota_curso` from (((`matricula` `m` join `estudiantes` `e` on((`m`.`cod_estudiante` = `e`.`cod_estudiante`))) join `cursos` `c` on((`m`.`cod_curso` = `c`.`cod_curso`))) join `docentes` `d` on((`c`.`cod_docente` = `d`.`cod_docente`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-13 18:29:40
