-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: rep_db
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'empresa1@yopmail.com','4ac55e882679f3149313333f0392aa11e727dc476743014ecf9be9f5960d4701d3dcea7695f3baca3f6cfad103a47fd227905efde82a3b0de1f21311b47b759c.641ebc5cd154b45a'),(2,'empresa2@yopmail.com','4ac55e882679f3149313333f0392aa11e727dc476743014ecf9be9f5960d4701d3dcea7695f3baca3f6cfad103a47fd227905efde82a3b0de1f21311b47b759c.641ebc5cd154b45a'),(11,'cliente1@yopmail.com','4ac55e882679f3149313333f0392aa11e727dc476743014ecf9be9f5960d4701d3dcea7695f3baca3f6cfad103a47fd227905efde82a3b0de1f21311b47b759c.641ebc5cd154b45a'),(12,'cliente2@yopmail.com','4ac55e882679f3149313333f0392aa11e727dc476743014ecf9be9f5960d4701d3dcea7695f3baca3f6cfad103a47fd227905efde82a3b0de1f21311b47b759c.641ebc5cd154b45a'),(13,'cliente3@yopmail.com','4ac55e882679f3149313333f0392aa11e727dc476743014ecf9be9f5960d4701d3dcea7695f3baca3f6cfad103a47fd227905efde82a3b0de1f21311b47b759c.641ebc5cd154b45a');
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paquete`
--

LOCK TABLES `paquete` WRITE;
/*!40000 ALTER TABLE `paquete` DISABLE KEYS */;
INSERT INTO `paquete` VALUES (1,'000001','paquete 1','3','Thu Jan 06 2021 21:17:12 GMT-0500 (Eastern Standard Time)','Thu May 11 2021 21:17:12 GMT-0500 (Eastern Standard Time)',3,1,3,1),(2,'000002','paquete 2','2','Thu Feb 06 2021 21:17:12 GMT-0500 (Eastern Standard Time)','Wed  Feb 15 2021',3,3,3,2),(4,'000003','paquete  3','10','Thu Mar 06 2021 22:46:31 GMT-0500 (Eastern Standard Time)','Wed  Apr 15 2021',3,2,4,1),(6,'000005','paquete 5','10','Thu May 06 2021 23:08:10 GMT-0500 (Eastern Standard Time)','',2,4,4,1),(7,'000006','paquete 6','3','Thu Jan 06 2021 23:10:07 GMT-0500 (Eastern Standard Time)','Wed  Jan 15 2021',3,2,4,1),(8,'000007','paquete 7','5','Thu Feb 06 2021 23:12:09 GMT-0500 (Eastern Standard Time)','Wed  Feb 15 2021',3,2,4,2),(9,'000008','paquete 8','25','Thu Mar 06 2021 23:13:17 GMT-0500 (Eastern Standard Time)','',1,3,4,2),(10,'000009','paquete 9','10','Fri May 07 2021 14:47:32 GMT-0500 (Eastern Standard Time)','',1,5,3,1),(14,'000010','Paquete 10','11','Fri Jan 07 2021 14:47:32 GMT-0500 (Eastern Standard Time)',NULL,2,3,3,1),(15,'000011','Paquete 11','5','Tue May 11 2021 09:21:24 GMT-0500 (Colombia Standard Time)','',1,4,5,3),(16,'000012','Paquete 12','3','Fri Apr 04 2021 14:47:32 GMT-0500 (Eastern Standard Time)','Fri Apr 07 2021 14:47:32 GMT-0500 (Eastern Standard Time)',3,4,3,3),(17,'000013','paquete 13','20','Thu Mar 10 2021 14:47:32 GMT-0500 (Eastern Standard Time)','Thu Apr 03 2021 14:47:32 GMT-0500 (Eastern Standard Time)',3,2,4,2),(18,'000014','paquete 14','1','Thu May 14 2021 14:47:32 GMT-0500 (Eastern Standard Time)',NULL,1,2,3,3),(19,'000015','paquete 15','4','Wed  Apr 15 2021','Thu  May 01 2021',3,5,5,3),(20,'000016','paquete 16','3','Fri  Jan 20 2021','Wed  Feb 20 2021',3,5,3,2),(21,'000017','paquete 17 ','4','Thu  Mar 25 2021','Wed  Mar 15 2021',3,3,5,1),(22,'000018','paquete 18 ','2','Wed  May 15 2021',NULL,1,3,3,2),(23,'000019','paquete 19','1','Tue  Feb 20 2021',NULL,2,3,5,3),(24,'000020','paquete 20','5','Fri  Jan 15 2021','Fri  Jan 15 2021',3,4,4,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` VALUES (1,'Albrook','panamá'),(2,'Arraiján','panamá oeste'),(3,'El Dorado','panamá');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Mariano','Casa','https://i.imgur.com/Xmrd8oR.png','6722-2296',1,1,2,NULL),(2,'Juan','Casemiro','https://i.imgur.com/PbIfad0.png','6743-7899',1,2,2,NULL),(3,'Mario','casa','','6578-9000',1,11,3,1),(4,'Camila','Montes','','6890-0012',2,12,3,2),(5,'Joel','Cabello','','6138-8090',2,13,3,3);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'rep_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `create_paquete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_paquete`(
	IN _id_tracking varchar(200),
    IN _description varchar(200),
    IN _volume varchar(45),
    IN _fecha_llegada varchar(100),
    IN _id_almacen INT,
    IN _id_user INT,
    IN _id_sucursal INT
)
BEGIN

INSERT INTO paquete 
(
	number_tracking,
	description_paquete,
    volume,
	fecha_llegada,
    fecha_retiro,
	status_paquete,
	id_almacen,
	id_user,
	id_sucursal
) VALUES
(
	_id_tracking,
    _description,
    _volume,
    _fecha_llegada,
    '',
    1,
    _id_almacen,
    _id_user,
    _id_sucursal
);
SELECT  1 AS _message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_user`(
	IN _correo varchar(50),
    IN _password varchar(300),
    IN _first_name varchar(50),
    IN _last_name varchar(50),
    IN _image varchar(50),
    IN _id_gender INT,
    IN _phone varchar(50)
)
BEGIN

DECLARE id_login INT;

INSERT INTO login (email, password) VALUES (_correo, _password);
SELECT id INTO id_login FROM login WHERE id = last_insert_id();

INSERT INTO user (first_name, last_name, image, id_gender, phone, id_login, id_rol) 
VALUES (_first_name, _last_name, _image, _id_gender, _phone, id_login, 3);

SELECT  1 AS _message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `data_dashboard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `data_dashboard`()
BEGIN
    SELECT 1 AS _message;
    SELECT 
            sp.id_status,
            COUNT(*) as cantidad_status,
            sp.name_status
        FROM paquete p
            INNER JOIN status_paquete sp 
                ON  sp.id_status = p.status_paquete
            GROUP BY sp.id_status
        ;
    SELECT 
            s.id_sucursal,
            COUNT(*) as paquetes_sucursal,
            s.name_sucursal
        FROM paquete p
            INNER JOIN sucursal s 
                ON  s.id_sucursal = p.id_sucursal
            GROUP BY p.id_sucursal
        ;
    SELECT * FROM paquete;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_paquete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_paquete`(
	IN _id_paquete varchar(50)
)
BEGIN
	DECLARE _paquete INT;
	SELECT id_paquete INTO _paquete FROM paquete WHERE id_paquete = _id_paquete;
    IF(_paquete IS NULL) THEN
		SELECT 0 AS _message;
    ELSE
		SELECT 1 AS _message;
        DELETE FROM paquete WHERE id_paquete = _id_paquete;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUser`(
IN correo VARCHAR(45)
)
BEGIN

DECLARE _correo VARCHAR(45);
DECLARE _password VARCHAR(300);


SELECT correo, password INTO _correo, _password FROM  login WHERE email = correo;
IF (_correo IS NOT NULL) THEN 
	SELECT 1 AS _message;
	SELECT 
		l.id, 
		l.email, 
        l.password,
		u.first_name, 
        u.last_name,
        CONCAT(u.first_name, ' ', u.last_name) as full_name,
        u.image,
        u.phone,
        u.id_gender,
        g.name_gender as gender,
        u.id_rol,
        r.name_rol as rol
    FROM 
		login as l
    INNER JOIN user as u ON u.id_login = l.id 
    INNER JOIN rol as r ON r.id_rol = u.id_rol
    INNER JOIN gender as g ON g.id_gender = u.id_gender
    WHERE  l.email = _correo;
ELSE 
	SELECT 0 AS _message;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_clients` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_clients`()
BEGIN
	SELECT 1 AS _message;
	SELECT 
        u.id_user,
		l.email, 
		u.first_name, 
        u.last_name,
        CONCAT(u.first_name, ' ', u.last_name) as full_name,
        CONCAT(u.first_name, ' ', u.last_name, ' - ', tc.name_tipo_cuenta) as full_name_cuenta,
        u.image,
        u.phone,
        u.id_gender,
        g.name_gender as gender,
        tc.id_tipo_cuenta,
        u.id_rol,
        r.name_rol as rol
    FROM 
		login as l
    INNER JOIN user as u ON u.id_login = l.id 
    INNER JOIN rol as r ON r.id_rol = u.id_rol
    INNER JOIN tipo_cuenta tc ON tc.id_tipo_cuenta = u.id_tipo_cuenta
    INNER JOIN gender as g ON g.id_gender = u.id_gender
    WHERE  r.id_rol = 3;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_paquete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_paquete`(
	IN _id_paquete varchar(45)
)
BEGIN
	DECLARE _id INT;
	SELECT id_paquete INTO _id FROM paquete WHERE id_paquete = _id_paquete;
    
    IF(_id IS NULL) THEN
		SELECT 0 AS _message;
    ELSE
		SELECT 1 AS _message;
		SELECT 
			p.id_paquete,
			p.number_tracking,
			p.description_paquete,
			tc.precio_tipo_cuenta as precio,
			p.volume,
			tc.name_tipo_cuenta,
			(p.volume * tc.precio_tipo_cuenta) as costo_total,
			p.fecha_llegada,
			p.fecha_retiro,
			p.status_paquete,
			sp.name_status,
			p.id_almacen,
			al.name_almacen,
			p.id_user,
			CONCAT(u.first_name, ' ', u.last_name) as full_name,
			p.id_sucursal,
			s.name_sucursal
		FROM paquete p
			INNER JOIN status_paquete sp 
				ON  sp.id_status = p.status_paquete
			INNER JOIN almacen al
				ON p.id_almacen = al.id_almacen
			INNER JOIN user u
				ON u.id_user = p.id_user
			INNER JOIN sucursal s 
				ON s.id_sucursal = p.id_sucursal
			INNER JOIN tipo_cuenta tc 
				ON tc.id_tipo_cuenta = u.id_tipo_cuenta
			WHERE p.id_paquete = _id_paquete
		;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_paquetes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_paquetes`()
BEGIN

SELECT 1 AS _message;
SELECT 
	p.id_paquete,
    p.number_tracking,
    p.description_paquete,
    tc.precio_tipo_cuenta as precio,
    p.volume,
    tc.name_tipo_cuenta,
    (p.volume * tc.precio_tipo_cuenta) as costo_total,
    p.fecha_llegada,
    p.fecha_retiro,
    p.status_paquete,
    sp.name_status,
    p.id_almacen,
    al.name_almacen,
    p.id_user,
    CONCAT(u.first_name, ' ', u.last_name) as full_name,
    p.id_sucursal,
    s.name_sucursal
FROM paquete p
	INNER JOIN status_paquete sp 
		ON  sp.id_status = p.status_paquete
	INNER JOIN almacen al
		ON p.id_almacen = al.id_almacen
	INNER JOIN user u
		ON u.id_user = p.id_user
	INNER JOIN sucursal s 
		ON s.id_sucursal = p.id_sucursal
	INNER JOIN tipo_cuenta tc 
		ON tc.id_tipo_cuenta = u.id_tipo_cuenta
	ORDER BY p.id_paquete
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_position_almacen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_position_almacen`()
BEGIN
	SELECT 1 as _message;
	SELECT * FROM almacen;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_status_paquetes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_status_paquetes`()
BEGIN
	SELECT 1 AS _message;
    SELECT * FROM status_paquete;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_sucursal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_sucursal`()
BEGIN
	SELECT 1 as _message;
	SELECT * FROM sucursal;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_paquete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_paquete`(
	IN _id_paquete varchar(45),
    IN _numero_tracking varchar(45),
    IN _description_paquete varchar(45),
    IN _volume varchar(45),
    IN _status_paquete varchar(45),
    IN _id_almacen varchar(45),
    IN _id_user varchar(45),
    IN _id_sucursal varchar(45)
)
BEGIN
	DECLARE _paquete INT;
	SELECT id_paquete INTO _paquete FROM paquete WHERE id_paquete = _id_paquete;
    IF(_paquete IS NULL) THEN
		SELECT 0 AS _message;
    ELSE
		SELECT 1 AS _message;
        UPDATE paquete
		SET 
			number_tracking = _numero_tracking, 
			description_paquete = _description_paquete,
			volume = _volume,
			status_paquete = _status_paquete,
			id_almacen = _id_almacen,
			id_user = _id_user,
			id_sucursal = _id_sucursal
		WHERE id_paquete = _id_paquete;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-11 21:59:02
