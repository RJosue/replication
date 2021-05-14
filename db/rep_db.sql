-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: rep_db
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `almacen`
--

DROP TABLE IF EXISTS `almacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `almacen` (
  `id_almacen` int NOT NULL AUTO_INCREMENT,
  `name_almacen` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_almacen`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacen`
--

LOCK TABLES `almacen` WRITE;
/*!40000 ALTER TABLE `almacen` DISABLE KEYS */;
INSERT INTO `almacen` VALUES (1,'A1'),(2,'A2'),(3,'A3'),(4,'B1'),(5,'B2'),(6,'B3');
/*!40000 ALTER TABLE `almacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gender` (
  `id_gender` int NOT NULL AUTO_INCREMENT,
  `name_gender` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_gender`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gender`
--

LOCK TABLES `gender` WRITE;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` VALUES (1,'Masculino'),(2,'Femenino');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'empresa1@yopmail.com','4ac55e882679f3149313333f0392aa11e727dc476743014ecf9be9f5960d4701d3dcea7695f3baca3f6cfad103a47fd227905efde82a3b0de1f21311b47b759c.641ebc5cd154b45a'),(2,'empresa2@yopmail.com','4ac55e882679f3149313333f0392aa11e727dc476743014ecf9be9f5960d4701d3dcea7695f3baca3f6cfad103a47fd227905efde82a3b0de1f21311b47b759c.641ebc5cd154b45a'),(11,'cliente1@yopmail.com','4ac55e882679f3149313333f0392aa11e727dc476743014ecf9be9f5960d4701d3dcea7695f3baca3f6cfad103a47fd227905efde82a3b0de1f21311b47b759c.641ebc5cd154b45a'),(12,'cliente2@yopmail.com','4ac55e882679f3149313333f0392aa11e727dc476743014ecf9be9f5960d4701d3dcea7695f3baca3f6cfad103a47fd227905efde82a3b0de1f21311b47b759c.641ebc5cd154b45a');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paquete`
--

DROP TABLE IF EXISTS `paquete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paquete` (
  `id_paquete` int NOT NULL AUTO_INCREMENT,
  `number_tracking` varchar(200) DEFAULT NULL,
  `description_paquete` varchar(200) DEFAULT NULL,
  `volume` varchar(45) DEFAULT NULL,
  `fecha_llegada` varchar(100) DEFAULT NULL,
  `fecha_retiro` varchar(100) DEFAULT NULL,
  `status_paquete` int DEFAULT NULL,
  `id_almacen` int DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  `id_sucursal` int DEFAULT NULL,
  PRIMARY KEY (`id_paquete`),
  KEY `fk_paquete_sucursal_idx` (`id_sucursal`),
  KEY `fk_paquete_almacen_idx` (`id_almacen`),
  KEY `fk_paquete_user_idx` (`id_user`),
  KEY `fk_paquete_status_paquete_idx` (`status_paquete`),
  CONSTRAINT `fk_paquete_almacen` FOREIGN KEY (`id_almacen`) REFERENCES `almacen` (`id_almacen`),
  CONSTRAINT `fk_paquete_status_paquete` FOREIGN KEY (`status_paquete`) REFERENCES `status_paquete` (`id_status`),
  CONSTRAINT `fk_paquete_sucursal` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`),
  CONSTRAINT `fk_paquete_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paquete`
--

LOCK TABLES `paquete` WRITE;
/*!40000 ALTER TABLE `paquete` DISABLE KEYS */;
INSERT INTO `paquete` VALUES (1,'000001','paquete 1','3','Thu May 06 2021 21:17:12 GMT-0500 (Eastern Standard Time)','Thu May 11 2021 21:17:12 GMT-0500 (Eastern Standard Time)',3,1,3,1),(2,'000002','paquete 2','2','Thu May 06 2021 21:17:12 GMT-0500 (Eastern Standard Time)','2021-05-09T04:40:36.180Z',3,3,3,2),(9,'000008','paquete 8','25','Thu May 06 2021 23:13:17 GMT-0500 (Eastern Standard Time)','',2,3,4,2),(10,'000009','paquete 9','10','Fri May 07 2021 14:47:32 GMT-0500 (Eastern Standard Time)','Sat May 08 2021 23:36:37 GMT-0500 (Eastern Standard Time)',3,5,3,1),(14,'0000013','paquete 13','20','Sat May 08 2021 23:49:30 GMT-0500 (Eastern Standard Time)','',1,6,3,2);
/*!40000 ALTER TABLE `paquete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `name_rol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrador'),(2,'Colaborador'),(3,'Cliente');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_paquete`
--

DROP TABLE IF EXISTS `status_paquete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_paquete` (
  `id_status` int NOT NULL AUTO_INCREMENT,
  `name_status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_paquete`
--

LOCK TABLES `status_paquete` WRITE;
/*!40000 ALTER TABLE `status_paquete` DISABLE KEYS */;
INSERT INTO `status_paquete` VALUES (1,'Transito'),(2,'Disponible'),(3,'Entregado');
/*!40000 ALTER TABLE `status_paquete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursal` (
  `id_sucursal` int NOT NULL AUTO_INCREMENT,
  `name_sucursal` varchar(45) DEFAULT NULL,
  `direccion_sucursal` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` VALUES (1,'Sucursal 1','panama'),(2,'Sucursal 2','panama oeste');
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_cuenta`
--

DROP TABLE IF EXISTS `tipo_cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_cuenta` (
  `id_tipo_cuenta` int NOT NULL AUTO_INCREMENT,
  `name_tipo_cuenta` varchar(45) DEFAULT NULL,
  `precio_tipo_cuenta` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_cuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_cuenta`
--

LOCK TABLES `tipo_cuenta` WRITE;
/*!40000 ALTER TABLE `tipo_cuenta` DISABLE KEYS */;
INSERT INTO `tipo_cuenta` VALUES (1,'Estandar','2.50'),(2,'Silver','3.50'),(3,'Empresarial','1.75');
/*!40000 ALTER TABLE `tipo_cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `id_gender` int DEFAULT NULL,
  `id_login` int NOT NULL,
  `id_rol` int DEFAULT NULL,
  `id_tipo_cuenta` int DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  KEY `fk_id_login_idx` (`id_login`),
  KEY `fk_id_gender_idx` (`id_gender`),
  KEY `fk_id_rol_idx` (`id_rol`),
  KEY `fk_tipo_cuenta_user_idx` (`id_tipo_cuenta`),
  CONSTRAINT `fk_id_gender` FOREIGN KEY (`id_gender`) REFERENCES `gender` (`id_gender`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_id_login` FOREIGN KEY (`id_login`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_id_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tipo_cuenta_user` FOREIGN KEY (`id_tipo_cuenta`) REFERENCES `tipo_cuenta` (`id_tipo_cuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Mariano','Casa','https://i.imgur.com/Xmrd8oR.png ','6722-2296',1,1,2,NULL),(2,'Juan','Casemiro','https://i.imgur.com/Xmrd8oR.png ','6743-7899',1,2,2,NULL),(3,'Mario','casa','','6578-9000',1,11,3,1),(4,'Camila','Montes','','6890-0012',2,12,3,2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-14 14:52:57
