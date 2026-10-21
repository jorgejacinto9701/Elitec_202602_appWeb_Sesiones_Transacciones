CREATE DATABASE  IF NOT EXISTS `bd_seguridad` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bd_seguridad`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_seguridad_struts
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `enlace`
--

DROP TABLE IF EXISTS `enlace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enlace` (
  `idenlace` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `ruta` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idenlace`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enlace`
--

LOCK TABLES `enlace` WRITE;
/*!40000 ALTER TABLE `enlace` DISABLE KEYS */;
INSERT INTO `enlace` VALUES (1,'Inserta Boleta','intranetInsertaBoleta.jsp'),(2,'Inserta Rol','intranetInsertaRol.jsp'),(3,'Inserta Usuario ','intranetInsertaUsuario.jsp'),(4,'Inserta Producto','intranetInsertaProducto.jsp'),(5,'Inserta Cliente','intranetInsertaCliente.jsp');
/*!40000 ALTER TABLE `enlace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `idrol` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrador'),(2,'Caja'),(3,'Contabilidad');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_enlace`
--

DROP TABLE IF EXISTS `rol_enlace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol_enlace` (
  `idrol` int(11) NOT NULL,
  `idenlace` int(11) NOT NULL,
  PRIMARY KEY (`idrol`,`idenlace`),
  KEY `fk_rol_has_enlace_enlace1_idx` (`idenlace`),
  KEY `fk_rol_has_enlace_rol1_idx` (`idrol`),
  CONSTRAINT `fk_rol_has_enlace_enlace1` FOREIGN KEY (`idenlace`) REFERENCES `enlace` (`idenlace`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rol_has_enlace_rol1` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_enlace`
--

LOCK TABLES `rol_enlace` WRITE;
/*!40000 ALTER TABLE `rol_enlace` DISABLE KEYS */;
INSERT INTO `rol_enlace` VALUES (1,1),(2,1),(1,2),(3,2),(1,3),(1,4),(1,5),(2,5);
/*!40000 ALTER TABLE `rol_enlace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `dni` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Luis Carlos','Perez Gonzales','luis','luis','luis@cibertec.edu.pe','40228588'),(2,'Elba Rosali','Flores Enero','elba','elba','elba@cibertec.edu.pe','21345667'),(3,'Jhonny Jaime','Jacinto Quispe','jhonny','jhonny','jhonny@cibertec.edu.pe','23785467');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_rol`
--

DROP TABLE IF EXISTS `usuario_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_rol` (
  `idusuario` int(11) NOT NULL,
  `idrol` int(11) NOT NULL,
  PRIMARY KEY (`idusuario`,`idrol`),
  KEY `fk_usuario_has_rol_rol1_idx` (`idrol`),
  KEY `fk_usuario_has_rol_usuario_idx` (`idusuario`),
  CONSTRAINT `fk_usuario_has_rol_rol1` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_rol_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_rol`
--

LOCK TABLES `usuario_rol` WRITE;
/*!40000 ALTER TABLE `usuario_rol` DISABLE KEYS */;
INSERT INTO `usuario_rol` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `usuario_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bd_seguridad_struts'
--

--
-- Dumping routines for database 'bd_seguridad_struts'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-10 18:33:15
