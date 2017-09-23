-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: ucompiler
-- ------------------------------------------------------
-- Server version	8.0.0-dmr-log

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
-- Table structure for table `algorithm_templates`
--

DROP TABLE IF EXISTS `algorithm_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `algorithm_templates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id autogenerado',
  `complete_name` varchar(20) NOT NULL COMMENT 'Nombre de la plantilla',
  `template` text NOT NULL COMMENT 'Plantilla almacenada',
  `creation_date` datetime NOT NULL COMMENT 'Fecha de creacion',
  `modification_date` datetime NOT NULL COMMENT 'Fecha de modificacion',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `algorithm_templates`
--

LOCK TABLES `algorithm_templates` WRITE;
/*!40000 ALTER TABLE `algorithm_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `algorithm_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analysis_logs`
--

DROP TABLE IF EXISTS `analysis_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analysis_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id autogenerado',
  `id_user` bigint(20) unsigned NOT NULL COMMENT 'Id del usuario',
  `id_problem` bigint(20) unsigned NOT NULL COMMENT 'Id del problema',
  `algorithms` text NOT NULL COMMENT 'Algoritmo ejecutado',
  `creation_date` datetime NOT NULL COMMENT 'Fecha de creacion',
  `modification_date` datetime NOT NULL COMMENT 'Fecha de modificacion',
  PRIMARY KEY (`id`),
  KEY `FK_users_analysis_logs_id_user` (`id_user`),
  CONSTRAINT `FK_users_analysis_logs_id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analysis_logs`
--

LOCK TABLES `analysis_logs` WRITE;
/*!40000 ALTER TABLE `analysis_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `analysis_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aux_data`
--

DROP TABLE IF EXISTS `aux_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aux_data` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id autogenerado',
  `aux_name` varchar(25) NOT NULL COMMENT 'Nombre',
  `short_name` varchar(10) NOT NULL COMMENT 'Nombre corto',
  `id_aux_data_group` bigint(20) unsigned NOT NULL COMMENT 'Id del grupo',
  `aux_order` int(11) NOT NULL COMMENT 'Orden',
  `creation_date` datetime NOT NULL COMMENT 'Fecha de creacion',
  `modification_date` datetime NOT NULL COMMENT 'Fecha de modificacion',
  PRIMARY KEY (`id`),
  KEY `FK_aux_data_group_aux_data_id_aux_data_group` (`id_aux_data_group`),
  CONSTRAINT `FK_aux_data_group_aux_data_id_aux_data_group` FOREIGN KEY (`id_aux_data_group`) REFERENCES `aux_data_groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aux_data`
--

LOCK TABLES `aux_data` WRITE;
/*!40000 ALTER TABLE `aux_data` DISABLE KEYS */;
INSERT INTO `aux_data` VALUES (1,'SI','YES',1,1,'2017-09-22 21:52:17','2017-09-22 21:52:17'),(2,'NO','NOT',1,2,'2017-09-22 21:53:08','2017-09-22 21:53:08'),(3,'ACTIVO','ACTIVE',2,1,'2017-09-22 21:56:30','2017-09-22 21:56:30'),(4,'INACTIVO','INACTIVE',2,2,'2017-09-22 21:56:30','2017-09-22 21:56:30'),(5,'HOMBRE','MALE',3,1,'2017-09-22 21:59:13','2017-09-22 21:59:13'),(6,'MUJER','FEMALE',3,2,'2017-09-22 21:59:13','2017-09-22 21:59:13');
/*!40000 ALTER TABLE `aux_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aux_data_groups`
--

DROP TABLE IF EXISTS `aux_data_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aux_data_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id autogenerado',
  `group_name` varchar(25) NOT NULL COMMENT 'Nombre del Grupo',
  `short_name` varchar(10) NOT NULL COMMENT 'Nombre corto del grupo',
  `creation_date` datetime NOT NULL COMMENT 'Fecha de creacion',
  `modification_date` datetime NOT NULL COMMENT 'Fecha de modificacion',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aux_data_groups`
--

LOCK TABLES `aux_data_groups` WRITE;
/*!40000 ALTER TABLE `aux_data_groups` DISABLE KEYS */;
INSERT INTO `aux_data_groups` VALUES (1,'SI/NO','YESNO','2017-09-22 21:52:14','2017-09-22 21:52:14'),(2,'ESTADO','STATUS','2017-09-22 21:56:30','2017-09-22 21:56:30'),(3,'GENERO','SEX','2017-09-22 21:59:13','2017-09-22 21:59:13');
/*!40000 ALTER TABLE `aux_data_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id autogenerado',
  `cat_name` varchar(50) NOT NULL COMMENT 'Nombre',
  `description` varchar(100) NOT NULL COMMENT 'Descripcion',
  `creation_date` datetime NOT NULL COMMENT 'Fecha de creacion',
  `modification_date` datetime NOT NULL COMMENT 'Fecha de modificacion',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compilation_logs`
--

DROP TABLE IF EXISTS `compilation_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compilation_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id autogenerado',
  `id_user` bigint(20) unsigned NOT NULL COMMENT 'Id del usuario',
  `id_problem` bigint(20) unsigned NOT NULL COMMENT 'Id del problema',
  `algorithms` text NOT NULL COMMENT 'Algoritmo compilado',
  `result_message` text NOT NULL COMMENT 'Resultado de la compilacion',
  `comp_status` bigint(20) unsigned DEFAULT NULL COMMENT 'Estado de la compilacion',
  `creation_date` datetime NOT NULL COMMENT 'Fecha de creacion',
  `modification_date` datetime NOT NULL COMMENT 'Fecha de modificacion',
  PRIMARY KEY (`id`),
  KEY `FK_users_compilation_logs_id_user` (`id_user`),
  KEY `FK_aux_data_compilation_logs_comp_status` (`comp_status`),
  KEY `FK_problems_compilation_logs_id_problem` (`id_problem`),
  CONSTRAINT `FK_aux_data_compilation_logs_comp_status` FOREIGN KEY (`comp_status`) REFERENCES `aux_data` (`id`),
  CONSTRAINT `FK_problems_compilation_logs_id_problem` FOREIGN KEY (`id_problem`) REFERENCES `problems` (`id`),
  CONSTRAINT `FK_users_compilation_logs_id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compilation_logs`
--

LOCK TABLES `compilation_logs` WRITE;
/*!40000 ALTER TABLE `compilation_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `compilation_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `init_page`
--

DROP TABLE IF EXISTS `init_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `init_page` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id autogenerado',
  `description` text NOT NULL COMMENT 'Que es',
  `how_start` text NOT NULL COMMENT 'Como empiezo',
  `id_week_problem` bigint(20) unsigned DEFAULT NULL COMMENT 'Problema de la semana',
  `image_folder` varchar(500) DEFAULT NULL COMMENT 'Ruta de la carpeta de imagenes',
  `creation_date` datetime NOT NULL COMMENT 'Fecha de creacion',
  `modification_date` datetime NOT NULL COMMENT 'Fecha de modificacion',
  PRIMARY KEY (`id`),
  KEY `FK_problems_init_page_id_week_problem` (`id_week_problem`),
  CONSTRAINT `FK_problems_init_page_id_week_problem` FOREIGN KEY (`id_week_problem`) REFERENCES `problems` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `init_page`
--

LOCK TABLES `init_page` WRITE;
/*!40000 ALTER TABLE `init_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `init_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problems`
--

DROP TABLE IF EXISTS `problems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `problems` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id autogenerado',
  `title` varchar(50) NOT NULL COMMENT 'Titulo',
  `id_subcategory` bigint(20) unsigned NOT NULL COMMENT 'Id de la subcategoria',
  `id_volume` bigint(20) unsigned NOT NULL COMMENT 'Id del volumen',
  `problem_text` text NOT NULL COMMENT 'Texto del problema o enunciado',
  `input_description` varchar(1000) DEFAULT NULL COMMENT 'Descripcion de la entrada',
  `output_description` varchar(1000) DEFAULT NULL COMMENT 'Descripcion de la salida',
  `input_example` varchar(1000) DEFAULT NULL COMMENT 'Ejemplo de entrada',
  `output_example` varchar(1000) DEFAULT NULL COMMENT 'Ejemplo de salida',
  `attached_file` varchar(500) DEFAULT NULL COMMENT 'Ruta del archivo adjunto',
  `is_pdf` bigint(20) unsigned DEFAULT NULL COMMENT 'Indica si el registro tiene un pdf o no',
  `complexity` bigint(20) unsigned DEFAULT NULL COMMENT 'Complejidad',
  `creation_date` datetime NOT NULL COMMENT 'Fecha de creacion',
  `modification_date` datetime NOT NULL COMMENT 'Fecha de modificacion',
  PRIMARY KEY (`id`),
  KEY `FK_subcategories_problems_id_subcategory` (`id_subcategory`),
  KEY `FK_volumes_problems_id_volume` (`id_volume`),
  KEY `FK_aux_data_problems_is_pdf` (`is_pdf`),
  KEY `FK_aux_data_problems_complexity` (`complexity`),
  CONSTRAINT `FK_aux_data_problems_complexity` FOREIGN KEY (`complexity`) REFERENCES `aux_data` (`id`),
  CONSTRAINT `FK_aux_data_problems_is_pdf` FOREIGN KEY (`is_pdf`) REFERENCES `aux_data` (`id`),
  CONSTRAINT `FK_subcategories_problems_id_subcategory` FOREIGN KEY (`id_subcategory`) REFERENCES `sub_categories` (`id`),
  CONSTRAINT `FK_volumes_problems_id_volume` FOREIGN KEY (`id_volume`) REFERENCES `volumes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problems`
--

LOCK TABLES `problems` WRITE;
/*!40000 ALTER TABLE `problems` DISABLE KEYS */;
/*!40000 ALTER TABLE `problems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_categories`
--

DROP TABLE IF EXISTS `sub_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id autogenerado',
  `sub_name` varchar(50) NOT NULL COMMENT 'Nombre',
  `description` varchar(100) NOT NULL COMMENT 'Descripcion',
  `id_category` bigint(20) unsigned NOT NULL COMMENT 'Id de la categoria',
  `subcat_level` bigint(20) unsigned NOT NULL COMMENT 'Nivel de la subcategoria',
  `creation_date` datetime NOT NULL COMMENT 'Fecha de creacion',
  `modification_date` datetime NOT NULL COMMENT 'Fecha de modificacion',
  PRIMARY KEY (`id`),
  KEY `FK_categories_sub_categories_id_category` (`id_category`),
  CONSTRAINT `FK_categories_sub_categories_id_category` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_categories`
--

LOCK TABLES `sub_categories` WRITE;
/*!40000 ALTER TABLE `sub_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `sub_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id autogenerado',
  `user_name` varchar(50) NOT NULL COMMENT 'Nombre de usuario',
  `complete_name` varchar(100) DEFAULT NULL COMMENT 'Nombre',
  `email` varchar(100) NOT NULL COMMENT 'Correo',
  `user_password` varchar(500) NOT NULL COMMENT 'Contraseña',
  `birthdate` datetime DEFAULT NULL COMMENT 'Fecha de nacimiento',
  `sex` bigint(20) unsigned DEFAULT NULL COMMENT 'Genero',
  `user_status` bigint(20) unsigned NOT NULL COMMENT 'Estado',
  `country` varchar(50) DEFAULT NULL COMMENT 'Pais',
  `institution` varchar(60) DEFAULT NULL COMMENT 'Institucion',
  `course_code` varchar(25) DEFAULT NULL COMMENT 'Codigo del curso',
  `photo` varchar(500) DEFAULT NULL COMMENT 'Url Foto de perfil',
  `is_email_confirmed` bigint(20) unsigned NOT NULL COMMENT 'Indica si el correo ha sido confirmado',
  `is_admin` bigint(20) unsigned NOT NULL COMMENT 'Indica si el usuario es administrador',
  `is_superadmin` bigint(20) unsigned NOT NULL COMMENT 'Indica si el usuario es super administrador',
  `is_password_temp` bigint(20) unsigned NOT NULL COMMENT 'Indica si la contraseña es temporal',
  `creation_date` datetime NOT NULL COMMENT 'Fecha de creacion',
  `modification_date` datetime NOT NULL COMMENT 'Fecha de modificacion',
  PRIMARY KEY (`id`),
  KEY `FK_aux_data_users_sex` (`sex`),
  KEY `FK_aux_data_users_user_status` (`user_status`),
  KEY `FK_aux_data_users_is_email_confirmed` (`is_email_confirmed`),
  KEY `FK_aux_data_users_is_admin` (`is_admin`),
  KEY `FK_aux_data_users_is_superadmin` (`is_superadmin`),
  KEY `FK_aux_data_users_is_password_temp` (`is_password_temp`),
  CONSTRAINT `FK_aux_data_users_is_admin` FOREIGN KEY (`is_admin`) REFERENCES `aux_data` (`id`),
  CONSTRAINT `FK_aux_data_users_is_email_confirmed` FOREIGN KEY (`is_email_confirmed`) REFERENCES `aux_data` (`id`),
  CONSTRAINT `FK_aux_data_users_is_password_temp` FOREIGN KEY (`is_password_temp`) REFERENCES `aux_data` (`id`),
  CONSTRAINT `FK_aux_data_users_is_superadmin` FOREIGN KEY (`is_superadmin`) REFERENCES `aux_data` (`id`),
  CONSTRAINT `FK_aux_data_users_sex` FOREIGN KEY (`sex`) REFERENCES `aux_data` (`id`),
  CONSTRAINT `FK_aux_data_users_user_status` FOREIGN KEY (`user_status`) REFERENCES `aux_data` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id autogenerado',
  `description` varchar(100) NOT NULL COMMENT 'Descripcion',
  `creation_date` datetime NOT NULL COMMENT 'Fecha de creacion',
  `modification_date` datetime NOT NULL COMMENT 'Fecha de modificacion',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ucompiler'
--

--
-- Dumping routines for database 'ucompiler'
--
/*!50003 DROP PROCEDURE IF EXISTS `InsertAuxData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertAuxData`(
auxDataGroupShortName varchar(10), 
auxName varchar(25),
shortName varchar(10),
auxOrder int(11)
)
BEGIN
	
	SET @auxDataGroupId = (select id from aux_data_groups where short_name = auxDataGroupShortName);
    
    if (@auxDataGroupId >0) then
		insert into  aux_data(aux_name,short_name,id_aux_data_group,aux_order,creation_date,modification_date) 
        values(auxName,shortName,@auxDataGroupId,auxOrder,NOW(),NOW());
    end if;
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

-- Dump completed on 2017-09-22 22:03:07
