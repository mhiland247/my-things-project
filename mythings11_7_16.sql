-- MySQL dump 10.13  Distrib 5.5.47, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: mythings_db
-- ------------------------------------------------------
-- Server version	5.5.47-0ubuntu0.14.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_79bbe83d82fd12c3_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permission_group_id_5cecfaea841cdb99_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group__permission_id_79bbe83d82fd12c3_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_61b6f72ba2ae9260_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add tag',7,'add_tag'),(20,'Can change tag',7,'change_tag'),(21,'Can delete tag',7,'delete_tag'),(22,'Can add post',8,'add_post'),(23,'Can change post',8,'change_post'),(24,'Can delete post',8,'delete_post'),(25,'Can add contact entry',9,'add_contactentry'),(26,'Can change contact entry',9,'change_contactentry'),(27,'Can delete contact entry',9,'delete_contactentry'),(28,'Can add site',10,'add_site'),(29,'Can change site',10,'change_site'),(30,'Can delete site',10,'delete_site'),(31,'Can add user profile',11,'add_userprofile'),(32,'Can change user profile',11,'change_userprofile'),(33,'Can delete user profile',11,'delete_userprofile'),(34,'Can add my metadata (Path)',12,'add_mymetadatapath'),(35,'Can change my metadata (Path)',12,'change_mymetadatapath'),(36,'Can delete my metadata (Path)',12,'delete_mymetadatapath'),(37,'Can add my metadata (Model Instance)',13,'add_mymetadatamodelinstance'),(38,'Can change my metadata (Model Instance)',13,'change_mymetadatamodelinstance'),(39,'Can delete my metadata (Model Instance)',13,'delete_mymetadatamodelinstance'),(40,'Can add my metadata (Model)',14,'add_mymetadatamodel'),(41,'Can change my metadata (Model)',14,'change_mymetadatamodel'),(42,'Can delete my metadata (Model)',14,'delete_mymetadatamodel'),(43,'Can add my metadata (View)',15,'add_mymetadataview'),(44,'Can change my metadata (View)',15,'change_mymetadataview'),(45,'Can delete my metadata (View)',15,'delete_mymetadataview'),(46,'Can add lead',16,'add_lead'),(47,'Can change lead',16,'change_lead'),(48,'Can delete lead',16,'delete_lead'),(49,'Can add task',17,'add_task'),(50,'Can change task',17,'change_task'),(51,'Can delete task',17,'delete_task');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$24000$WXcv8wngGddG$MT6GBTkAAvXNqm9LKVdO4CCNt7yT6HAHR+qlVfwCuBQ=','2016-10-25 17:38:45',1,'hiland','','','michelle.hiland@gmail.com',1,1,'2015-09-30 05:41:43'),(2,'pbkdf2_sha256$20000$JYBFXZu9KvOu$1Oco/J1gwalS2ygnenBeZf9HRRMBr/IBhBc9GpG45pk=',NULL,0,'test1234','','','test@gmail.com',0,1,'2015-11-13 19:30:21'),(3,'pbkdf2_sha256$20000$pnDmJfYjD50y$Vd5+QmdvpLunrJcB2LcWdk5e5VLq32IYZOdGsIhfJ3U=',NULL,0,'user2','','','uer2@2.com',0,1,'2015-11-13 19:31:15'),(4,'pbkdf2_sha256$20000$2UyaYVR7Ugb4$Fl7rk150rRhahS4JjMcQtwf5N/poq58xFTIrlQQfaSA=','2015-11-14 00:49:40',0,'testmoo1234','','','h@g.cokm',0,1,'2015-11-14 00:38:19'),(6,'pbkdf2_sha256$20000$9zKyrOozrwWa$J/4m4lkld2WPMT0opYOSwhjkes0LJm8Vwoy2sLK7Ec4=',NULL,0,'newuser','','','noway@g.com',0,1,'2015-11-18 19:03:28'),(7,'pbkdf2_sha256$20000$6a8LjQdXBhcp$cbduTni+M9x/Q5TlEaNFLtYuRZp5xQEHdMmLbH5DfHw=','2015-11-19 23:57:20',0,'test','','','test444@yahoo.com',0,1,'2015-11-18 19:08:00'),(8,'pbkdf2_sha256$20000$EcboBQCehc5D$4MbhrehXIg1oamjUKoS44265yF/zEp6TJ1+MUpayJeU=','2015-11-18 19:54:45',0,'test2','','','test@gmail.com',0,1,'2015-11-18 19:13:36'),(9,'pbkdf2_sha256$20000$x7vHjupQKn6e$+v/U6sSQowK1RfdAAzOGyf8MinpWU9YDVmF8Wc9XxVI=','2015-11-18 23:33:07',0,'michelle','','','michelle.hiland@gmail.com',0,1,'2015-11-18 19:48:55'),(11,'pbkdf2_sha256$20000$Qx8TYAS1Soln$w0jER6mr/3rylhX9IAdYZLknvt63Mt6qNiSFcAtVK+w=',NULL,0,'boo','','','bhiland@gmail.com',0,1,'2015-11-18 23:29:29'),(12,'pbkdf2_sha256$20000$VP1yUrgvfLdw$yoFGIBOgoedfS7/i/dpVFNBZXVbQEO/LHB94eDgX4q4=',NULL,0,'boohoo','','','bhiland@gmail.com',0,1,'2015-11-18 23:31:23'),(13,'pbkdf2_sha256$20000$vJmwxV5TJX8O$NfvoOaAl8hfySRAmUm+x+dZ/QWw7VOxson2HgEssHpI=',NULL,0,'good','','','f@o.com',0,1,'2015-11-18 23:32:44'),(14,'pbkdf2_sha256$20000$we2es89BS1lB$kTVuUkSgCqOXKDhv3KNGy4raMrit/iYK6k5SuLrIOw0=','2015-11-19 02:23:31',0,'high','','','hi@gmail.com',0,1,'2015-11-19 02:23:17'),(15,'pbkdf2_sha256$20000$gEEATKkwDJIL$oVq0rEv3u1QFIPmYKvAM5qkZrptY7OrUw6TrrsaRVeA=','2015-11-19 02:27:36',0,'art','','','amyshousesm@gmail.com',0,1,'2015-11-19 02:27:19'),(16,'pbkdf2_sha256$20000$3lPsPKJhlXPg$j2/l1ciOiayZJN6tXEBw2fX2nN1BHlPUqnr4vytzyy0=','2015-11-19 02:44:20',0,'moo','','','m@m.com',0,1,'2015-11-19 02:44:02'),(17,'pbkdf2_sha256$20000$vVRPazSJ4VnZ$ANs4lBx7fkpbX1m6jWMxhO0RqxIex+7Urqjl0+LKOE4=','2015-11-19 04:18:00',0,'ice','','','ice@man.com',0,1,'2015-11-19 04:17:45'),(18,'pbkdf2_sha256$20000$1Lamqan7zFxp$LgJLG194ftN93uROADT1iQ+3S5m3ZE+bWVaPW9arLZg=',NULL,0,'buys','','','bhiland4@gmail.com',0,1,'2015-11-19 23:22:16'),(19,'pbkdf2_sha256$20000$JKfbVgmJz3Vo$Y9Ey8L/ebMGjfN8kN6ww63X2Sd+5OSjN1PCzV0dFsig=','2015-11-19 23:24:24',0,'newest','','','blah@blah.com',0,1,'2015-11-19 23:24:13'),(20,'pbkdf2_sha256$20000$7Y5TjbuITUzQ$aO8wS4fhc3t1YPcQhvTvxA7azlAswE9dTUJJoxAg/p0=',NULL,0,'brianna','','','Summer.Webb@colorado.edu',0,1,'2015-11-19 23:39:17'),(21,'pbkdf2_sha256$20000$W8hHSLEDlXTu$RvgdUUPXougqi/RQm6ouX1xWyMKjUBInzt0q51foUpg=',NULL,0,'fff','','','ff@f.comf',0,1,'2015-11-19 23:39:25'),(22,'pbkdf2_sha256$20000$DTFEakFUwca1$GweCVGmZc4Eic4tR/HHfliyHNc5bn6bTS0R4ZHfbkH0=',NULL,0,'arth','','','Go@go.com',0,1,'2015-11-24 05:42:21'),(23,'pbkdf2_sha256$20000$1yQnYH8u0ap4$Wd6aEdnXiYQ0QqZG7KiPK7x7PBWVHDOPjTRwBNHH2DI=',NULL,0,'arthur','','','f@o.com',0,1,'2015-11-24 05:43:04'),(24,'pbkdf2_sha256$20000$8uR8XIU4rqAi$E3jnDMAmIfq++whSzpoduGqR0FDtQrflx5I88VSUxYU=','2015-11-24 05:44:05',0,'lama','','','foo@ba.com',0,1,'2015-11-24 05:43:49'),(25,'pbkdf2_sha256$20000$fuOZQMDv7KSQ$M3fDRohiwKeLXlgKoKrgeBocTy6TKXp/H8XFg+3uFJE=',NULL,0,'mooch','','','hh@hh.com',0,1,'2015-11-24 05:44:39'),(26,'pbkdf2_sha256$20000$TI3ie3SYJlFy$1nnlw3iar50jry3s+3ultZZae/R1c1pd9LLP6Cn/HqQ=',NULL,0,'nacho','','','ba@aol.com',0,1,'2015-12-02 22:10:12'),(27,'pbkdf2_sha256$20000$OYLSPdOHM4lH$fZhrgN48UDXW7k7xvGejQoTzM/Yq1XEnjlJ85jbnapg=',NULL,0,'bob','','','bob@no.com',0,1,'2016-04-14 22:30:06'),(28,'pbkdf2_sha256$20000$YrKWz6metDjm$uAUewOp/nJQoIwsYGQ4+YLX35/XTUtPnY6IroqjZ+10=',NULL,0,'bill','','','bisnehhtwork@gmail.com',0,1,'2016-04-14 22:50:14');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_73f690e98f188796_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_73f690e98f188796_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_a89201858c66223_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_22686c4521a916cf_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_permissi_user_id_4906b32131f17e86_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_u_permission_id_22686c4521a916cf_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_content_type_id_2724c3179c64b66_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_6a2fd2a315bf7396_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_6a2fd2a315bf7396_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_content_type_id_2724c3179c64b66_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=317 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2015-09-30 17:58:18','1','ff',3,'',8,1),(2,'2015-09-30 21:09:46','1','gf. hf',3,'',7,1),(3,'2015-09-30 21:12:06','12','graphics',2,'Changed tag.',7,1),(4,'2015-09-30 21:12:14','10','graphics',2,'Changed tag.',7,1),(5,'2015-09-30 21:12:41','12','graphics',3,'',7,1),(6,'2015-09-30 21:12:41','10','graphics',3,'',7,1),(7,'2015-09-30 21:13:01','13','graphics',1,'',7,1),(8,'2015-09-30 21:13:30','14','graphics',1,'',7,1),(9,'2015-09-30 21:13:33','3','The Key Ingredients to Muscles',2,'Changed tags.',8,1),(10,'2015-09-30 21:14:12','13','graphics',3,'',7,1),(11,'2015-09-30 21:14:12','8','graphics',3,'',7,1),(12,'2015-09-30 21:14:22','14','graphics',3,'',7,1),(13,'2015-10-01 04:00:58','5','How is Beer made?',2,'Changed image_date.',8,1),(14,'2015-10-01 04:01:20','4','Comparing Hot & Cold Coffee',2,'Changed image_date.',8,1),(15,'2015-10-01 04:01:37','3','The Key Ingredients to Muscles',2,'Changed image_date.',8,1),(16,'2015-10-01 04:01:58','2','Sex Trafficking Statistics',2,'Changed image_date.',8,1),(17,'2015-10-01 17:47:55','6','tt@r.com',3,'',9,1),(18,'2015-10-01 17:47:55','5','test@gmail.com',3,'',9,1),(19,'2015-10-01 17:47:55','4','gg@G.com',3,'',9,1),(20,'2015-10-01 17:47:55','3','',3,'',9,1),(21,'2015-10-02 05:22:35','3','infographic',2,'No fields changed.',7,1),(22,'2015-10-02 05:23:20','3','infographic',2,'No fields changed.',7,1),(23,'2015-10-02 05:25:31','3','qqq',2,'Changed tag.',7,1),(24,'2015-10-02 05:26:11','3','infographic',2,'Changed tag.',7,1),(25,'2015-10-02 05:27:18','21','infographic',1,'',7,1),(26,'2015-10-02 05:27:54','7','test',1,'',8,1),(27,'2015-10-02 05:28:26','22','www',1,'',7,1),(28,'2015-10-06 19:33:52','7','test',3,'',8,1),(29,'2015-10-06 22:02:28','11','Running up Longs Peak',3,'',8,1),(30,'2015-10-06 22:02:28','10','Running up Longs Peak',3,'',8,1),(31,'2015-10-07 03:53:56','12','Test',3,'',8,1),(32,'2015-10-08 20:11:13','9','Airplane to Munich',3,'',8,1),(33,'2015-10-08 20:14:54','34','europe2015, planeride',1,'',7,1),(34,'2015-10-08 20:15:16','13','Plane Ride to Munich, Germany',1,'',8,1),(35,'2015-10-08 20:32:48','8','Ice Skate Bear Lake',3,'',8,1),(36,'2015-10-08 20:39:27','35','iceskates, longspeak, rmnp, estespark, bearlake',1,'',7,1),(37,'2015-10-08 20:39:43','14','Iceskating Bear Lake',1,'',8,1),(38,'2015-10-08 20:39:58','6','Running the Grand Canyon',3,'',8,1),(39,'2015-10-08 20:42:50','36','grandcanyon, passion, fog, az',1,'',7,1),(40,'2015-10-08 20:43:05','15','Running the Grand Canyon',1,'',8,1),(41,'2015-10-08 20:45:04','37','biking, vail, 29ers',1,'',7,1),(42,'2015-10-08 20:45:36','16','Mt Biking In Vail',1,'',8,1),(43,'2015-10-08 20:47:38','2','Sex Trafficking Statistics',3,'',8,1),(44,'2015-10-08 20:50:33','38','antisextrafficking, amyshouse, portfolio, awareness',1,'',7,1),(45,'2015-10-08 20:50:56','17','Ant-Sex-Trafficking Infographic',1,'',8,1),(46,'2015-10-08 20:52:54','5','How is Beer made?',3,'',8,1),(47,'2015-10-08 20:52:54','4','Comparing Hot & Cold Coffee',3,'',8,1),(48,'2015-10-08 20:52:54','3','The Key Ingredients to Muscles',3,'',8,1),(49,'2015-10-08 20:54:58','39','portfolio, beer, ingredients',1,'',7,1),(50,'2015-10-08 20:55:15','18','What is in Beer Infographic',1,'',8,1),(51,'2015-10-08 20:57:02','40','portfolio, coffee, comparison',1,'',7,1),(52,'2015-10-08 20:57:20','19','Comparing Hot & Cold Coffee',1,'',8,1),(53,'2015-10-08 21:00:24','41','infographic, portfolio',1,'',7,1),(54,'2015-10-08 21:00:36','20','What are your Muscles Made of?',1,'',8,1),(55,'2015-10-14 22:44:01','42','logo, amyshouse, non-profit, graphicdesign',1,'',7,1),(56,'2015-10-14 22:44:35','21','amyshouselogo',1,'',8,1),(57,'2015-10-14 22:45:37','43','log, estesparkyoga, graphicdesign, smallbusiness',1,'',7,1),(58,'2015-10-14 22:45:51','44','logo',1,'',7,1),(59,'2015-10-14 22:46:20','22','estesparklogo',1,'',8,1),(60,'2015-10-14 22:46:39','23','estesparklogo',1,'',8,1),(61,'2015-10-14 22:47:20','45','personal, michellehiland',1,'',7,1),(62,'2015-10-14 22:47:36','24','mhlogo',1,'',8,1),(63,'2015-10-14 23:00:20','23','estesparklogo',3,'',8,1),(64,'2015-10-14 23:55:31','24','mhlogo',2,'Changed title.',8,1),(65,'2015-10-14 23:56:09','24','mhlogo',2,'Changed title.',8,1),(66,'2015-10-15 01:40:03','14','name',2,'Changed title.',8,1),(67,'2015-10-15 04:37:19','46','portfolio',1,'',7,1),(68,'2015-10-15 04:37:25','24','mhlogo',2,'Changed tags.',8,1),(69,'2015-10-15 04:37:58','47','portfolio',1,'',7,1),(70,'2015-10-15 04:38:03','22','estesparklogo',2,'Changed tags.',8,1),(71,'2015-10-15 04:38:39','48','portfolio',1,'',7,1),(72,'2015-10-15 04:38:42','21','amyshouselogo',2,'Changed tags.',8,1),(73,'2015-10-15 04:39:29','48','portfolio',3,'',7,1),(74,'2015-10-15 04:39:29','47','portfolio',3,'',7,1),(75,'2015-10-15 04:39:37','22','www',3,'',7,1),(76,'2015-10-15 04:41:14','40','portfolio, coffee, comparison',3,'',7,1),(77,'2015-10-15 04:41:14','39','portfolio, beer, ingredients',3,'',7,1),(78,'2015-10-15 04:41:14','42','logo, amyshouse, non-profit, graphicdesign',3,'',7,1),(79,'2015-10-15 04:41:14','43','log, estesparkyoga, graphicdesign, smallbusiness',3,'',7,1),(80,'2015-10-15 04:41:14','41','infographic, portfolio',3,'',7,1),(81,'2015-10-15 04:41:14','21','infographic',3,'',7,1),(82,'2015-10-15 04:41:14','35','iceskates, longspeak, rmnp, estespark, bearlake',3,'',7,1),(83,'2015-10-15 04:41:14','34','europe2015, planeride',3,'',7,1),(84,'2015-10-15 04:41:14','38','antisextrafficking, amyshouse, portfolio, awareness',3,'',7,1),(85,'2015-10-15 04:41:24','45','personal, michellehiland',3,'',7,1),(86,'2015-10-15 04:41:24','36','grandcanyon, passion, fog, az',3,'',7,1),(87,'2015-10-15 04:41:42','33','gf. hf',3,'',7,1),(88,'2015-10-15 04:41:42','37','biking, vail, 29ers',3,'',7,1),(89,'2015-10-15 04:42:36','49','infographic',1,'',7,1),(90,'2015-10-15 04:42:39','18','name',2,'Changed tags.',8,1),(91,'2015-10-15 04:44:46','49','infographic',3,'',7,1),(92,'2015-10-15 04:48:09','20','name',3,'',8,1),(93,'2015-10-15 04:49:50','25','muscleinfographic',2,'Changed title and name.',8,1),(94,'2015-10-15 04:50:41','51','mylogo',1,'',7,1),(95,'2015-10-15 04:50:43','24','mhlogo',2,'Changed tags.',8,1),(96,'2015-10-15 04:51:08','52','beer',1,'',7,1),(97,'2015-10-15 04:51:48','18','name',2,'Changed tags.',8,1),(98,'2015-10-15 04:52:01','53','beer',1,'',7,1),(99,'2015-10-15 04:52:04','18','name',2,'Changed tags.',8,1),(100,'2015-10-15 04:53:03','18','name',2,'Changed tags.',8,1),(101,'2015-10-15 04:53:21','53','beer',3,'',7,1),(102,'2015-10-15 04:53:21','52','beer',3,'',7,1),(103,'2015-10-15 04:56:10','21','amyshouselogo',2,'Changed tags.',8,1),(104,'2015-10-15 04:56:21','54','amyshouse',1,'',7,1),(105,'2015-10-15 04:56:23','21','amyshouselogo',2,'Changed tags.',8,1),(106,'2015-10-15 04:56:58','55','yoga',1,'',7,1),(107,'2015-10-15 04:57:00','22','estesparklogo',2,'Changed tags.',8,1),(108,'2015-10-15 04:57:52','17','name',2,'Changed tags.',8,1),(109,'2015-10-15 04:58:10','56','biking',1,'',7,1),(110,'2015-10-15 04:58:11','16','name',2,'Changed tags.',8,1),(111,'2015-10-15 04:58:25','57','vail',1,'',7,1),(112,'2015-10-15 04:58:45','16','name',2,'Changed tags.',8,1),(113,'2015-10-15 05:00:10','15','name',2,'Changed tags.',8,1),(114,'2015-10-15 05:00:34','14','name',2,'Changed tags.',8,1),(115,'2015-10-15 05:01:29','58','europe2015',1,'',7,1),(116,'2015-10-15 05:01:31','13','name',2,'Changed tags.',8,1),(117,'2015-10-15 05:01:56','13','name',2,'Changed tags.',8,1),(118,'2015-10-19 04:56:31','19','name',2,'Changed tags.',8,1),(119,'2015-10-19 05:26:50','59','sleep',1,'',7,1),(120,'2015-10-19 05:28:27','26','sleepinfographic',1,'',8,1),(121,'2015-10-19 05:33:26','60','flyer',1,'',7,1),(122,'2015-10-19 05:37:48','27','slaveryflyer',1,'',8,1),(123,'2015-10-19 14:05:23','61','flyer',1,'',7,1),(124,'2015-10-19 14:05:27','27','slaveryflyer',2,'Changed tags.',8,1),(125,'2015-10-22 16:23:50','67','hi',3,'',9,1),(126,'2015-10-22 16:23:50','66','jknl',3,'',9,1),(127,'2015-10-22 16:23:50','65','nbjkh',3,'',9,1),(128,'2015-10-22 16:23:50','64','hfdh',3,'',9,1),(129,'2015-10-22 16:23:50','63','jkflsnhflksgndfdbn ',3,'',9,1),(130,'2015-10-22 16:23:50','62','hi',3,'',9,1),(131,'2015-10-22 16:23:50','61','poj',3,'',9,1),(132,'2015-10-22 16:23:50','60','njk',3,'',9,1),(133,'2015-10-22 16:23:50','59','nkl',3,'',9,1),(134,'2015-10-22 16:23:50','58','hi athh',3,'',9,1),(135,'2015-10-22 16:23:50','57','hi michelle',3,'',9,1),(136,'2015-10-22 16:23:50','56','lkjlkj',3,'',9,1),(137,'2015-10-22 16:23:50','55','nolk',3,'',9,1),(138,'2015-10-22 16:23:50','54','sd',3,'',9,1),(139,'2015-10-22 16:23:50','53','ffhgdhdg',3,'',9,1),(140,'2015-10-22 16:23:50','52','jnk',3,'',9,1),(141,'2015-10-22 16:23:50','51','hi',3,'',9,1),(142,'2015-10-22 16:23:50','50','lknvds',3,'',9,1),(143,'2015-10-22 16:23:50','49','hi',3,'',9,1),(144,'2015-10-22 16:23:50','48','hi',3,'',9,1),(145,'2015-10-22 16:23:50','47','knmkl\n',3,'',9,1),(146,'2015-10-22 16:23:50','46','hi\n',3,'',9,1),(147,'2015-10-22 16:23:50','45','kln',3,'',9,1),(148,'2015-10-22 16:23:50','44','bjk',3,'',9,1),(149,'2015-10-22 16:23:50','43','hi',3,'',9,1),(150,'2015-10-22 16:23:50','42','hklrmghflskgmfs',3,'',9,1),(151,'2015-10-22 16:23:50','41','hi',3,'',9,1),(152,'2015-10-22 16:23:50','40','ghi michell woebkldf',3,'',9,1),(153,'2015-10-22 16:23:50','39','ghskfjgnbdflb',3,'',9,1),(154,'2015-10-22 16:23:50','38','test',3,'',9,1),(155,'2015-10-22 16:23:50','37','help me mo baby',3,'',9,1),(156,'2015-10-22 16:23:50','36','halp me baby',3,'',9,1),(157,'2015-10-22 16:23:50','35','nkjm',3,'',9,1),(158,'2015-10-22 16:23:50','34','nlkn',3,'',9,1),(159,'2015-10-22 16:23:50','33','Hi michelle',3,'',9,1),(160,'2015-10-22 16:23:50','32','nkn .',3,'',9,1),(161,'2015-10-22 16:23:50','31','hh',3,'',9,1),(162,'2015-10-22 16:23:50','30','ds',3,'',9,1),(163,'2015-10-22 16:23:50','29','x',3,'',9,1),(164,'2015-10-22 16:23:50','28','lkjlkj',3,'',9,1),(165,'2015-10-22 16:23:50','27','joplm',3,'',9,1),(166,'2015-10-22 16:23:50','26','Michelle',3,'',9,1),(167,'2015-10-22 16:23:50','25','hi ytet',3,'',9,1),(168,'2015-10-22 16:23:50','24','hi jomgfd',3,'',9,1),(169,'2015-10-22 16:23:50','23','hi jkl',3,'',9,1),(170,'2015-10-22 16:23:50','22','gmfklghmd',3,'',9,1),(171,'2015-10-22 16:23:50','21','gmfklghmd',3,'',9,1),(172,'2015-10-22 16:23:50','20','hinl',3,'',9,1),(173,'2015-10-22 16:23:50','19','gjlkfdnbfldkbmnfdbhhh',3,'',9,1),(174,'2015-10-22 16:23:50','18','hi',3,'',9,1),(175,'2015-10-22 16:23:50','17','hi',3,'',9,1),(176,'2015-10-22 16:23:50','16','hi test',3,'',9,1),(177,'2015-10-22 16:23:50','15','hi you',3,'',9,1),(178,'2015-10-22 16:23:50','14','hi',3,'',9,1),(179,'2015-10-22 16:23:50','13','HI Michelle',3,'',9,1),(180,'2015-10-22 16:23:50','12','HI',3,'',9,1),(181,'2015-10-22 16:23:50','11','Hi michelle',3,'',9,1),(182,'2015-10-22 16:23:50','10','h',3,'',9,1),(183,'2015-10-22 16:23:50','9','h',3,'',9,1),(184,'2015-10-22 16:23:50','8','gg',3,'',9,1),(185,'2015-10-22 16:23:50','7','tst',3,'',9,1),(186,'2015-10-22 16:23:50','2','test 2',3,'',9,1),(187,'2015-10-22 16:23:50','1','Hi test',3,'',9,1),(188,'2015-11-03 01:39:33','1','example.com',3,'',10,1),(189,'2015-11-03 01:40:03','3','greatideations.com',1,'',10,1),(190,'2015-11-18 21:07:21','17','name',2,'Changed title.',8,1),(191,'2015-11-18 23:25:42','10','d',3,'',4,1),(192,'2015-11-18 23:25:42','5','gnfjdkgfdgfd',3,'',4,1),(193,'2015-11-30 23:09:34','28','logo-Semper FI',1,'',8,1),(194,'2015-11-30 23:11:26','28','logo-Semper FI',2,'Changed description.',8,1),(195,'2015-11-30 23:16:05','28','logo-Semper FI',2,'Changed tags.',8,1),(196,'2015-11-30 23:16:25','62','logo',1,'',7,1),(197,'2015-11-30 23:16:29','28','logo-Semper FI',2,'Changed tags.',8,1),(198,'2015-11-30 23:19:13','28','logo-Semper FI',2,'Changed image.',8,1),(199,'2015-12-03 02:19:00','29','sedona',1,'',8,1),(200,'2015-12-03 02:19:13','63','trailrunning',1,'',7,1),(201,'2015-12-03 02:19:16','29','sedona',2,'Changed tags.',8,1),(202,'2015-12-03 02:22:39','30','Santa Fe',1,'',8,1),(203,'2015-12-03 02:22:46','29','sedona',2,'Changed title.',8,1),(204,'2015-12-03 02:22:57','64','trailrunning',1,'',7,1),(205,'2015-12-03 02:22:58','30','Santa Fe',2,'Changed tags.',8,1),(206,'2015-12-03 02:24:54','31','Julian Alps',1,'',8,1),(207,'2015-12-03 02:25:44','65','trailrunning',1,'',7,1),(208,'2015-12-03 02:25:45','31','Julian Alps',2,'Changed tags.',8,1),(209,'2015-12-03 02:26:52','66','trailrunning',1,'',7,1),(210,'2015-12-03 02:26:57','67','europe',1,'',7,1),(211,'2015-12-03 02:27:10','68','europe2015',1,'',7,1),(212,'2015-12-03 02:27:26','32','Split',1,'',8,1),(213,'2015-12-03 02:29:04','69','trailrunning',1,'',7,1),(214,'2015-12-03 02:30:17','33','Finch Lake',1,'',8,1),(215,'2015-12-03 02:32:29','34','Hurdle',1,'',8,1),(216,'2015-12-03 02:35:39','35','Deviils backbone',1,'',8,1),(217,'2015-12-03 02:37:41','36','longboard',1,'',8,1),(218,'2015-12-03 02:40:43','36','longboard',2,'Changed title.',8,1),(219,'2015-12-03 02:45:49','37','hidden valley',1,'',8,1),(220,'2015-12-03 02:52:15','70','FTK',1,'',7,1),(221,'2015-12-03 02:52:55','38','Longs FTK',1,'',8,1),(222,'2015-12-03 02:55:30','39','vail half',1,'',8,1),(223,'2015-12-03 02:55:43','36','longboard',2,'Changed published_date.',8,1),(224,'2015-12-03 02:57:35','29','sedona',2,'Changed published_date.',8,1),(225,'2015-12-03 02:57:53','30','Santa Fe',2,'Changed published_date.',8,1),(226,'2015-12-03 02:58:55','38','Longs FTK',2,'Changed published_date.',8,1),(227,'2015-12-03 03:00:49','40','pushups',1,'',8,1),(228,'2015-12-03 03:01:08','66','trailrunning',3,'',7,1),(229,'2015-12-03 03:01:08','65','trailrunning',3,'',7,1),(230,'2015-12-03 03:01:08','64','trailrunning',3,'',7,1),(231,'2015-12-03 03:01:08','63','trailrunning',3,'',7,1),(232,'2015-12-03 03:01:16','17','trailrunning',3,'',7,1),(233,'2015-12-03 03:01:28','60','flyer',3,'',7,1),(234,'2015-12-03 03:01:40','58','europe2015',3,'',7,1),(235,'2015-12-03 03:01:40','67','europe',3,'',7,1),(236,'2015-12-03 07:21:50','71','race',1,'',7,1),(237,'2015-12-03 07:21:52','39','vail half',2,'Changed description and tags.',8,1),(238,'2015-12-03 07:22:21','29','sedona',2,'Changed tags.',8,1),(239,'2015-12-03 07:22:46','30','Santa Fe',2,'Changed tags.',8,1),(240,'2015-12-03 07:23:01','30','Santa Fe',2,'Changed tags.',8,1),(241,'2015-12-03 07:23:18','35','Deviils backbone',2,'Changed tags.',8,1),(242,'2015-12-03 07:23:49','34','Hurdle',2,'Changed tags.',8,1),(243,'2015-12-03 07:24:18','33','Finch Lake',2,'Changed tags.',8,1),(244,'2015-12-03 07:25:01','32','Split',2,'Changed description and tags.',8,1),(245,'2015-12-03 07:26:18','31','Julian Alps',2,'Changed description and tags.',8,1),(246,'2015-12-03 07:27:44','40','pushups',2,'Changed description and tags.',8,1),(247,'2015-12-03 07:30:50','32','Split',2,'Changed description.',8,1),(248,'2015-12-03 07:50:01','41','BridalVille Falls',1,'',8,1),(249,'2015-12-03 07:51:32','36','longboard',2,'Changed published_date.',8,1),(250,'2015-12-06 07:37:56','39','vail half',2,'Changed description.',8,1),(251,'2015-12-06 07:39:01','15','name',2,'Changed description.',8,1),(252,'2015-12-06 07:39:37','41','BridalVille Falls',2,'Changed description.',8,1),(253,'2016-02-01 18:56:57','42','TT',1,'',8,1),(254,'2016-02-01 18:58:45','72','businesscard',1,'',7,1),(255,'2016-02-01 19:03:16','43','HCN',1,'',8,1),(256,'2016-02-01 19:08:09','43','HCN',2,'Changed image.',8,1),(257,'2016-03-07 19:45:19','73','packaging_label',1,'',7,1),(258,'2016-03-07 19:45:27','74','outdoors',1,'',7,1),(259,'2016-03-07 19:46:10','44','Packaging Label',1,'',8,1),(260,'2016-03-07 19:49:19','44','Packaging Label',2,'Changed title and description.',8,1),(261,'2016-03-28 22:43:33','79','Test today is feb 18',3,'',9,1),(262,'2016-03-28 22:43:33','78','hhhhfnHggggfklgnfsklbnsflkbnsflkbnsflkbnslkbnslbnskbnlfdsb\nbfkbnkls\nnkdl',3,'',9,1),(263,'2016-03-28 22:43:33','77','ghkfsgjhksjgnksjbs',3,'',9,1),(264,'2016-03-28 22:43:33','75','Hi',3,'',9,1),(265,'2016-03-28 22:43:33','74','HI michelle',3,'',9,1),(266,'2016-03-28 22:43:33','73','bfsbdhfbd',3,'',9,1),(267,'2016-03-28 22:43:33','72','ndghfdhbfd',3,'',9,1),(268,'2016-03-28 22:43:33','71','mojnnkj',3,'',9,1),(269,'2016-03-28 22:43:33','70','hi',3,'',9,1),(270,'2016-03-28 22:43:33','69','Hi michelle I love your work. COntact me michelle@g.com',3,'',9,1),(271,'2016-03-28 22:43:33','68','Hi michelle',3,'',9,1),(272,'2016-06-24 06:44:46','16','name',2,'Changed description.',8,1),(273,'2016-06-24 06:45:51','15','name',2,'Changed description.',8,1),(274,'2016-06-24 06:46:59','14','name',2,'Changed description.',8,1),(275,'2016-06-24 06:47:51','38','Longs FTK',2,'Changed description.',8,1),(276,'2016-06-24 06:50:21','14','name',2,'Changed description.',8,1),(277,'2016-06-24 18:48:58','77','passion',1,'',7,1),(278,'2016-06-24 18:49:25','45','michelle running',2,'Changed tags and name.',8,1),(279,'2016-06-24 18:50:17','45','michelle running',2,'Changed tags.',8,1),(280,'2016-06-24 18:51:29','76','estes park',3,'',7,1),(281,'2016-06-24 18:51:56','77','passion',3,'',7,1),(282,'2016-06-24 18:52:22','45','michelle running',2,'Changed tags.',8,1),(283,'2016-06-24 19:02:08','46','michelle bike',1,'',8,1),(284,'2016-06-24 19:07:29','78','sanddunes',1,'',7,1),(285,'2016-06-24 19:07:50','47','michelle sand dunes',1,'',8,1),(286,'2016-07-17 05:57:49','48','stage plot',1,'Added.',8,1),(287,'2016-07-17 06:08:16','48','stage plot',3,'',8,1),(288,'2016-07-17 06:09:50','49','Strangebyrds Logo',1,'Added.',8,1),(289,'2016-07-17 06:11:17','49','Strangebyrds Logo',2,'Changed tags.',8,1),(290,'2016-07-17 06:11:58','62','logo',3,'',7,1),(291,'2016-07-17 06:12:29','49','Strangebyrds Logo',2,'Changed tags.',8,1),(292,'2016-07-17 06:12:58','28','logo-Semper FI',2,'Changed tags.',8,1),(293,'2016-07-17 06:35:01','50','Strangebyrds One sheet',1,'Added.',8,1),(294,'2016-07-17 06:36:39','50','Strangebyrds One sheet',2,'Changed tags.',8,1),(295,'2016-07-17 06:37:23','27','slaveryflyer',2,'Changed description.',8,1),(296,'2016-07-17 06:43:17','50','Strangebyrds One sheet',2,'Changed image.',8,1),(297,'2016-07-17 06:45:47','50','Strangebyrds One sheet',2,'Changed image.',8,1),(298,'2016-07-17 06:48:16','50','Strangebyrds One sheet',2,'Changed image.',8,1),(299,'2016-07-17 06:48:29','50','Strangebyrds One sheet',3,'',8,1),(300,'2016-07-17 06:49:45','51','Strangebyrds Single Sheet',1,'Added.',8,1),(301,'2016-07-24 01:30:27','79','modern_logo',1,'Added.',7,1),(302,'2016-07-24 01:30:33','42','TT',2,'Changed tags.',8,1),(303,'2016-07-24 01:31:52','80','nonprofit_logo',1,'Added.',7,1),(304,'2016-07-24 01:31:59','21','amyshouselogo',2,'Changed description and tags.',8,1),(305,'2016-07-24 01:33:45','81','local_logo',1,'Added.',7,1),(306,'2016-07-24 01:33:47','49','Strangebyrds Logo',2,'Changed tags.',8,1),(307,'2016-07-24 06:06:18','82','muscle_diagram',1,'Added.',7,1),(308,'2016-07-24 06:06:21','25','muscleinfographic',2,'Changed tags.',8,1),(309,'2016-07-29 06:48:45','83','skiing',1,'Added.',7,1),(310,'2016-07-29 06:49:31','52','Skiing the Pow',1,'Added.',8,1),(311,'2016-07-29 06:51:38','53','XC skiing near Sprague Lake',1,'Added.',8,1),(312,'2016-07-29 06:56:33','54','Ice Skate Lake of Glass',1,'Added.',8,1),(313,'2016-07-29 06:58:38','54','Ice Skate Lake of Glass',2,'Changed image.',8,1),(314,'2016-07-29 07:01:54','55','Heli Skiing',1,'Added.',8,1),(315,'2016-09-02 05:49:44','84','pikespeak',1,'Added.',7,1),(316,'2016-09-02 05:51:44','56','Michelle Pikes Peak',1,'Added.',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_1a2a727071ac6738_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(14,'djangoseo','mymetadatamodel'),(13,'djangoseo','mymetadatamodelinstance'),(12,'djangoseo','mymetadatapath'),(15,'djangoseo','mymetadataview'),(9,'mythings','contactentry'),(16,'mythings','lead'),(8,'mythings','post'),(7,'mythings','tag'),(17,'mythings','task'),(11,'mythings','userprofile'),(6,'sessions','session'),(10,'sites','site');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2015-09-30 04:26:35'),(2,'auth','0001_initial','2015-09-30 04:26:35'),(3,'admin','0001_initial','2015-09-30 04:26:35'),(4,'contenttypes','0002_remove_content_type_name','2015-09-30 04:26:35'),(5,'auth','0002_alter_permission_name_max_length','2015-09-30 04:26:35'),(6,'auth','0003_alter_user_email_max_length','2015-09-30 04:26:35'),(7,'auth','0004_alter_user_username_opts','2015-09-30 04:26:35'),(8,'auth','0005_alter_user_last_login_null','2015-09-30 04:26:35'),(9,'auth','0006_require_contenttypes_0002','2015-09-30 04:26:35'),(10,'sessions','0001_initial','2015-09-30 04:26:35'),(11,'mythings','0001_initial','2015-09-30 05:14:06'),(12,'mythings','0002_contactentry','2015-10-01 17:27:59'),(13,'mythings','0003_auto_20151005_1729','2015-10-05 17:29:58'),(14,'mythings','0004_post_name','2015-10-09 23:47:39'),(15,'sites','0001_initial','2015-11-02 19:25:01'),(16,'mythings','0005_auto_20151102_1819','2015-11-03 01:42:33'),(17,'mythings','0006_userprofile','2015-11-12 21:09:57'),(18,'admin','0002_logentry_remove_auto_add','2016-06-27 06:37:05'),(19,'auth','0007_alter_validators_add_error_messages','2016-06-27 06:37:05'),(20,'sites','0002_alter_domain_unique','2016-06-27 06:37:05'),(21,'mythings','0007_lead','2016-07-25 20:22:08'),(22,'mythings','0008_auto_20160817_1213','2016-08-17 19:13:26'),(23,'mythings','0009_auto_20160817_1216','2016-08-17 19:17:03'),(24,'mythings','0010_auto_20160817_1220','2016-08-17 19:20:15'),(25,'mythings','0011_auto_20160817_1248','2016-08-17 19:48:31'),(26,'mythings','0012_auto_20160817_1255','2016-08-17 19:55:56'),(27,'mythings','0013_task','2016-10-24 23:36:52');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1mytxfn31zgr0ud99zpvmwk8mbvcc0wn','ZTI0Y2YxZTNjODdiZTc5OGVkMjAyZDhkMTFmOWZkNDcxOWM3NGEwMzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmEyZDU2YTQ4YTM1MTljM2IyM2E3ZjBiYmFiODE1NTViNjViMTYzYyIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-03-04 16:11:55'),('20spf4pt3j59b2g5yngs6vzeub0xm8ec','NzNiY2U1YWNhNTM3OWU1YTI3M2IzYjg3YWZiNjdmYTgxYTkwMmYyMjp7Il9hdXRoX3VzZXJfaWQiOiIyNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjU4YjQyNTMwNzU4ZDQ3ODc0YjNkMjQyYzY3ZDEwMTEwYzE5NTRjMiJ9','2015-12-08 05:44:05'),('6f0e2gi55g4aor5ffsads817t37f1y7s','ZDNkY2Q1MWEwYmQ1ZTVkZDgxMWMwZjE0MTJmNDc5MjAwMzVhMWYwZjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI0NTIxNWIxODNiYWIyNWI5YWU4OTllOWNlMGNmNjdjMWQzNjQzNjhjIn0=','2016-07-31 05:53:02'),('6kl2wxoqfh9pd8sra8yx9d1ol7yp7kii','ZmVhYzJiMGUyYWY4M2FhYThjMjAzZmE5OGIyY2Q4ZjNjY2VkYmRmZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiYTJkNTZhNDhhMzUxOWMzYjIzYTdmMGJiYWI4MTU1NWI2NWIxNjNjIn0=','2015-10-28 22:41:47'),('70tqlnb5kpgcrx9swdvm5w5vic6larfv','YWVkZjIwMzYxYTgwYmM0OTMwNDYyNTNhODMxNTVmYjIzZGViMzQ5NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNDUyMTViMTgzYmFiMjViOWFlODk5ZTljZTBjZjY3YzFkMzY0MzY4YyIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-09-16 05:47:18'),('7zcyvp28qs0dkf92uowosix31wz52ck1','ZThkYjczNDg5NzI1YTg0ZmQ2NGEzODJlNWQ2NTNlMzcyOGYwNWI1MTp7Il9hdXRoX3VzZXJfaGFzaCI6ImJhMmQ1NmE0OGEzNTE5YzNiMjNhN2YwYmJhYjgxNTU1YjY1YjE2M2MiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2015-12-16 22:19:53'),('91uxnr5exv2ico9ez17yef24xm6v3no7','ZmVhYzJiMGUyYWY4M2FhYThjMjAzZmE5OGIyY2Q4ZjNjY2VkYmRmZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiYTJkNTZhNDhhMzUxOWMzYjIzYTdmMGJiYWI4MTU1NWI2NWIxNjNjIn0=','2015-11-02 04:56:15'),('a3esjnd4yid406922otwcrwpk9su11z6','ZTI0Y2YxZTNjODdiZTc5OGVkMjAyZDhkMTFmOWZkNDcxOWM3NGEwMzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmEyZDU2YTQ4YTM1MTljM2IyM2E3ZjBiYmFiODE1NTViNjViMTYzYyIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-03-21 19:37:16'),('fu8qw1ja0ml4xbyzzt1uins445ad8fwn','YWE0MDJhZGU4Y2UwODRmYjVlZjY5ZmE5ZGQwODI1YjFlNWU5MjgwNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJiYTJkNTZhNDhhMzUxOWMzYjIzYTdmMGJiYWI4MTU1NWI2NWIxNjNjIn0=','2015-10-14 05:43:22'),('ienhl37xvvk4ek9126z4f50c1s0fy3vw','YzkzOTdkNjNjZDRkYmE2ZTgxZWM4YmQ5YzI2NmNhOWNmOTc1NmFmNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0NTIxNWIxODNiYWIyNWI5YWU4OTllOWNlMGNmNjdjMWQzNjQzNjhjIn0=','2016-08-12 06:33:27'),('m45tvptjv7bfhn0w4cj2cx64gur6exgi','M2M3NGVjNzM2YmExYTM0ODFjYjc4NmIxMTEyYThiMjMxZGE1NGQ0NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmEyZDU2YTQ4YTM1MTljM2IyM2E3ZjBiYmFiODE1NTViNjViMTYzYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2016-04-11 22:42:09'),('nd7cwv91hph2qr9mr7uz60emu50jaxu7','ZThkYjczNDg5NzI1YTg0ZmQ2NGEzODJlNWQ2NTNlMzcyOGYwNWI1MTp7Il9hdXRoX3VzZXJfaGFzaCI6ImJhMmQ1NmE0OGEzNTE5YzNiMjNhN2YwYmJhYjgxNTU1YjY1YjE2M2MiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-02-15 18:53:41'),('on10jdq62fmcpagdpqam9gzv2cctslmn','YWVkZjIwMzYxYTgwYmM0OTMwNDYyNTNhODMxNTVmYjIzZGViMzQ5NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNDUyMTViMTgzYmFiMjViOWFlODk5ZTljZTBjZjY3YzFkMzY0MzY4YyIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-11-08 17:38:45'),('uxptfmq70kvr4h851kou6n9w4qal4myt','M2M3NGVjNzM2YmExYTM0ODFjYjc4NmIxMTEyYThiMjMxZGE1NGQ0NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmEyZDU2YTQ4YTM1MTljM2IyM2E3ZjBiYmFiODE1NTViNjViMTYzYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2016-07-11 15:36:12');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (2,'michellehiland.com','michellehiland.com'),(3,'greatideations.com','greatideations.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mythings_contactentry`
--

DROP TABLE IF EXISTS `mythings_contactentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mythings_contactentry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` longtext NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mythings_contactentry`
--

LOCK TABLES `mythings_contactentry` WRITE;
/*!40000 ALTER TABLE `mythings_contactentry` DISABLE KEYS */;
INSERT INTO `mythings_contactentry` VALUES (76,'Hi michelle','2015-12-14 18:20:43'),(80,'hi michelle this ','2016-03-04 22:22:44'),(81,'Hello Michelle! This is Malina :)','2016-03-28 01:03:04'),(82,'hi','2016-04-18 22:34:26'),(83,'Hi Michelle.\n\nI found your website after bouncing around some lists of WordPress sites that are listed as examples of the level of cool that is possible.  I really think you have some creative, orginal stuff here!\n\nI have a question about WordPress for you.  I have used WordPress sites using the open-source software and hosting the site with a hosting site like SiteGround, GoDaddy, DreamHost, etc.  I\'m fairly advanced in terms of using the software and have some CSS basics down but when I go to try to learn how the software works I find either the material is over my head or focused only on how to make pages, posts, etc.\n\nIf you were about to learn WordPress today where would you go, what would you do first, etc.?\n\nI\'d appreciate any thoughts you might be willing to share.\n\nThanks!\n\nMike\nmsobryan@gmail.com','2016-06-17 00:50:35'),(84,'Hi Michelle','2016-06-25 03:49:20');
/*!40000 ALTER TABLE `mythings_contactentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mythings_lead`
--

DROP TABLE IF EXISTS `mythings_lead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mythings_lead` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `created_date` datetime NOT NULL,
  `metadata` varchar(2000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mythings_lead`
--

LOCK TABLES `mythings_lead` WRITE;
/*!40000 ALTER TABLE `mythings_lead` DISABLE KEYS */;
INSERT INTO `mythings_lead` VALUES (1,'kjhk@f.com','2016-07-25 20:34:46',''),(2,'hi@gmail.com','2016-07-26 01:54:54',''),(3,'gg#@g.com','2016-07-26 01:55:46',''),(4,'test444@yahoo.com','2016-07-26 01:57:15',''),(5,'gggggg@gg.com','2016-07-26 01:58:02',''),(6,'bhiland4@gmail.com','2016-07-26 01:58:39',''),(7,'jj@j.com','2016-07-26 01:59:34',''),(8,'hhhh@h.com','2016-07-26 19:21:24',''),(9,'hi@gmail.com','2016-07-26 20:10:58',''),(10,'','2016-08-17 19:17:34',''),(11,'2016-08-17 19:55:44.927172+00:00','2016-08-17 19:48:57',''),(12,'2016-08-17 19:55:44.927172+00:00','2016-08-17 19:53:57',''),(13,'gg#@g.com','2016-08-19 16:18:14',''),(14,'hhhh@h.com','2016-08-25 15:46:00',''),(15,'hiland@colorado.edu','2016-09-26 16:24:53',''),(16,'gggggg@gg.com','2016-11-02 20:04:31',''),(17,'newbie@new.com','2016-11-03 15:43:57',''),(18,'lala@la.com','2016-11-03 15:50:05',''),(19,'dd@d.com','2016-11-03 15:50:47',''),(20,'hiland@colorado.edu','2016-11-03 16:01:49','');
/*!40000 ALTER TABLE `mythings_lead` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mythings_post`
--

DROP TABLE IF EXISTS `mythings_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mythings_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `published_date` datetime DEFAULT NULL,
  `image_date` date DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mythings_post_author_id_217d64002e1786fe_fk_auth_user_id` (`author_id`),
  CONSTRAINT `mythings_post_author_id_217d64002e1786fe_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mythings_post`
--

LOCK TABLES `mythings_post` WRITE;
/*!40000 ALTER TABLE `mythings_post` DISABLE KEYS */;
INSERT INTO `mythings_post` VALUES (13,'Plane Ride to Munich, Germany','photos/2015/10/08/airplane.jpg','We had a long flight to Europe but we able to watch a lot of movies and eat for an extended period of time. We even were able to have a couple glasses of wine but we were not able to sleep.','2015-10-08 20:15:28','2015-08-05',1,'name'),(14,'Ice Skating Bear Lake','photos/2015/10/08/longs_skate.jpg','Last year I decided that although iceskating indoors is fun, it would be much more amazing to ice skate outside surrounded by mountains. Bear Lake is easy to get to and was the first lake of 7 lakes I ice-skated that day in the Rocky Mountain National Park. The views were breathtaking as you can see with Longs Peak behind me. It was so refreshing and I had a big audience!','2015-10-08 20:39:56','2014-11-01',1,'name'),(15,'Running the Grand Canyon','photos/2015/10/08/runGC.jpg','My very first time to the Grand Canyon was a special day because there was fog covering the entire top of the canyon.  As I ran down the canyon I could see the amazing colors and vast landscape in front of me, which was spectacular.','2015-10-08 20:43:19','2014-11-26',1,'name'),(16,'Mt Biking In Vail','photos/2015/10/08/bikevail.jpg','I had to test out my new mountain bike, so I took it for a spin on Vail Mountain. It was a great workout going up to the top of Eagles Nest and such a blast coming down through the trees. My 29ers made the ride more smooth and also a little more adventurous being so high up.','2015-10-08 20:45:34','2014-08-25',1,'name'),(17,'Anti-Sex-Trafficking Infographic','photos/2015/10/08/sex_trafficking_house.jpg','A peek into the shocking numbers of Sex Trafficking in the US from 2012 to 2015. This infographic was made for a non-profit that had a restorative home for survivors. This was made to help them get more funding and help spread the word about not only the horror of sex trafficking but also about the home and ways for victims to heal.','2015-10-08 20:51:03','2015-08-01',1,'name'),(18,'What is in Beer Infographic','photos/2015/10/08/beer_web.jpg','The is a graphical representation of the ingredients in beer and the flavors they produce. I was inspired to make this after a trip to Germany where the flavors of beer were so good. ','2015-10-08 20:55:27','2015-09-01',1,'name'),(19,'Comparing Hot & Cold Coffee','photos/2015/10/08/coffee-real.jpg','A quick and simple comparison of hot and cold brewed coffee.  As cold brewed coffee has become more popular I wanted to highlight the differences in both taste and health.','2015-10-08 20:57:31','2015-07-20',1,'name'),(21,'Amy\'s House Logo','photos/2015/10/14/Amy_logo-big.jpg','This is a redesign of an existing logo for a  non-profit.','2015-10-14 22:45:08','2015-04-21',1,'amyshouselogo'),(22,'Estes Park Yoga Logo','photos/2015/10/14/estes_park_yoga_bottom_web.jpg','A simple yet attractive logo for a small business in Estes Park.','2015-10-14 22:46:52','2015-08-09',1,'estesparklogo'),(24,'My Personal Logo','photos/2015/10/14/mh-logo-web.jpg','A fun creative logo about me.','2015-10-14 22:48:17','2015-07-12',1,'mhlogo'),(25,'What are Muscles Made of ?','photos/2015/10/15/Muscle_key.jpg','This is a graphical representation of the components found in muscles. I have been building my muscles and weight training so was inspired to learn more about my muscles and thought this would be a good way to make sure I am feeding them right!','2015-10-15 04:48:20',NULL,1,'muscleinfographic'),(26,'Sleep and Muscle Recovery','photos/2015/10/18/Rest_Muscles.jpg','A brief overview of what happens to your muscles during sleep and how this contributes to muscle growth and repair.','2015-08-11 05:28:08','2015-07-08',1,'sleepinfographic'),(27,'Slavery Class Flyer','photos/2015/10/18/SlaveryClassBibicalTimes2.jpg','Created for a series of classes for the non-profit Amy\'s House to help spread awareness of the problem and solutions to sex trafficking.',NULL,NULL,1,'slaveryflyer'),(28,'Semper Fi Dynasty Logo Design','photos/2015/11/30/SFD_logo_new.png','Created a logo for a start-up company called Semper Fi Dynasty. The criteria requested that the logo represent technology so the american flag is made using red laptops for the stripes and a micro processor for the stars.','2015-11-23 23:11:55','2015-11-23',9,'logo-Semper FI'),(29,'Running in Sedona, AZ','photos/2015/12/02/12273716_10103601682975343_8654537074288845400_o.jpg','A run around the courthouse butte, bell rock, to the chapel in the mountain and around the vortexes in Sedona, Az.','2015-12-03 03:01:30','2015-11-25',9,'sedona'),(30,'Running in Santa Fe, NM','photos/2015/12/02/12247821_10207364456525145_8987153372044384116_o.jpg','Running all of the Dale Ball Trails in Santa Fe on a gorgeous sunny day. Great views of the city and very runnable trails.','2015-12-03 03:00:00','2015-11-23',9,'Santa Fe'),(31,'Running in the Julian Alps','photos/2015/12/02/12087747_10207106454635259_4739244032203388703_o.jpg','An amazing run around the Julian Apls in Slovenia. The trail literally went straight up to the summit and then across some ridges and back down for a great loop. On the way down there was a hut we stopped at for a great lunch.','2015-12-03 02:28:30','2015-08-21',9,'Julian Alps'),(32,'Running in Croatia','photos/2015/12/02/11027499_10206742672180925_8216959417272720507_o.jpg','Running to the cross at the top of Marjan Park in Split, Croatia where you get a perfect view of the city and sea.','2015-12-03 02:31:13','2015-08-15',9,'Split'),(33,'Running to Finch Lake, RMNP','photos/2015/12/02/11696574_10206474245430424_1783693453783869235_o.jpg','Running up the Finch Lake trail with Meeker, Longs, and Pagoda in the background.','2015-12-03 02:33:13','2015-07-12',9,'Finch Lake'),(34,'Running Cub Lake Pool Loop, RMNP','photos/2015/12/02/10869391_10205716862136315_5849256221994417568_o.jpg','When life gives you a hurdle become a hurdler.','2015-12-03 02:36:12','2015-04-04',9,'Hurdle'),(35,'Running Devils Backbone, Longmont CO','photos/2015/12/02/10838221_10205343103952594_8818933505277399659_o.jpg','Running devils backbone trail which is super fun and technical, great views of Longs Peak.','2015-12-03 02:39:16','2015-02-12',9,'Deviils backbone'),(36,'Long Boarding Trail Ridge Road','photos/2015/12/02/1614199_10203392666432875_1537282155815258898_o.jpg','Taking a ride down Trail Ridge Road in Estes Park. ','2015-08-03 02:41:21','2015-01-20',9,'longboard'),(37,'Skiing in Hidden Valley','photos/2015/12/02/1606355_10202590399136694_1683092081_o.jpg','After a long hike up enjoying the snow on the way down in Hidden Valley, Estes Park, CO.','2015-08-03 02:49:34','2015-01-08',9,'hidden valley'),(38,'Longs Peak Women\'s Record','photos/2015/12/02/11942097_10103449859515773_3350743220647263382_o.jpg','What a perfect sunny day for my first attempt running up Longs Peak! It took me 2 hours and 5 mins up and 1 hour and 45 mins down for a round trip of 3 hours and 50 mins. I did the standard keyhole route without Jim\'s Grove cut off. Will definitely be attempting this again.','2015-10-01 02:59:35','2015-09-09',9,'Longs FTK'),(39,'Vail Half Marathon Finish','photos/2015/12/02/11234819_1597165817213210_673613896300087806_o.jpg','Winning First Place in my age group and 3rd Place for women over all in the Vail Half Marathon!!! Great run and amazing scenery!','2015-12-03 02:58:51','2015-07-09',9,'vail half'),(40,'Push Ups to Stay Warm','photos/2015/12/02/12045748_10207017980783468_9069587448309086332_o.jpg','A run up to Hallet Peak, Otis Peak, and down Andrews Glacier on a windy day so had to do push ups to keep the body warm.','2015-12-02 03:04:33','2015-11-03',9,'pushups'),(41,'Running to Bridalveil Falls','photos/2015/12/03/1655914_10202641011721977_1974948678_n.jpg','A snow packed run to Bridalveil Falls in Estes Park, CO. It was a lot of work in the snowy conditions.','2015-10-29 07:52:38','2015-02-03',9,'BridalVille Falls'),(42,'Modern Logo Design','photos/2016/02/01/tt_logo.png','A simple yet sharp logo desgin for an up and coming company. I designed the logo, favicon, and brand.','2016-02-01 19:04:31','2015-12-18',9,'TT'),(43,'Business Card Design','photos/2016/02/01/business_card_sample_J6IKUqY.jpg','Created an elegant business card for a women lead company in the holistic care business and kept the design consistent with their existing logo and graphics.','2015-07-02 19:06:45','2015-03-04',9,'HCN'),(44,'Outdoor Company Packaging Labels','photos/2016/03/07/packing_label.jpg','This is one of 18 packaging labels I helped design by creating the topographic map background for a gourmet outdoor food company called, Heather\'s Choice.  All 18 products have a different topographic map with a tasty meal!','2016-03-07 19:55:54','2016-02-25',9,'Packaging Label'),(45,'Chasing Rainbows','photos/2016/06/24/rainbow.jpg','Running towards the pot of gold at the end of the rainbow.','2016-06-24 18:48:13',NULL,1,'michelle running'),(46,'Biking Trail Ridge Rd','photos/2016/06/24/bike_trailridge.jpg','Best time of year to ride Trail Ridge Road is just before it opens to vehicles. I had the road to myself and enjoyed the scenes from the snow-caped mountains to enormous snow sidewalls!','2016-06-24 19:18:51','2016-06-01',9,'michelle bike'),(47,'Running in the Dunes','photos/2016/06/24/sand_dunes.jpg','This was a sweet run, because it was full of memories coming as a 10 year old. The cool part is I was just amazed at the dunes and surrounding mountains today as I was when I was a kid.','2016-06-24 19:24:32','2016-05-05',9,'michelle sand dunes'),(49,'Strangebyrds Logo','photos/2016/07/16/logo.png','Cutout of logo for local band, Strangebyrds.','2016-07-17 06:28:03','2016-06-02',1,'Strangebyrds Logo'),(51,'Strangebyrds Press Kit','photos/2016/07/16/strangebyrds-one-page_ezvA8Ey.jpg','Created a single page press kit for local band, Strangebyrds.','2016-07-17 07:07:55','2016-05-31',1,'Strangebyrds Single Sheet'),(52,'Skiing the Pow','photos/2016/07/28/betterpow.jpg','Nothing is more enjoybale then skinning up to ski the freshies! I love my backyard, Hidden Valley.','2016-01-02 07:08:38','2016-01-01',1,'Skiing the Pow'),(53,'RMNP XC Skiing','photos/2016/07/28/xc.jpg','I love my skinny skis too! There is nothing quite like skate skiing.','2016-02-01 07:10:26','2016-02-02',1,'XC skiing near Sprague Lake'),(54,'Ice Skating Lake of Glass','photos/2016/07/28/ice_skate.jpg','Ice skating on outdoor lakes in unreal scenery has captivated my heart. I enjoy the journey to the lake, the challenge to lace up my skates when the wind blows in, and the beating of my heart as I take in my surroundings while gliding across the frozen lake.','2016-05-06 07:15:24','2016-03-09',1,'Ice Skate Lake of Glass'),(55,'HeliSkiing?','photos/2016/07/29/lake_glass_jan10.jpg','I have always wanted to heli ski to get that fresh untouched pow.','2015-11-01 07:20:33','2015-11-03',1,'Heli Skiing'),(56,'Pikes Peak Ascent','photos/2016/09/01/14102824_10209520416462796_8192422029703674216_o.jpg','First year running the Pikes Peak Ascent - half marathon up Pikes Peak. I placed 4th overall for women and 29th overall out of 2000+. The trail was gorgeous and runnable. I had great support and a beautiful day!','2016-09-02 06:11:37','2016-08-20',1,'Michelle Pikes Peak'),(57,'In Awe of Longs Peak','photos/2016/11/02/14409636_10104316253884513_5709436708550406358_o.jpg','Starring off in the distance at Longs, Pagoda, Spearhead, Chiefs Head.',NULL,NULL,1,'');
/*!40000 ALTER TABLE `mythings_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mythings_post_tags`
--

DROP TABLE IF EXISTS `mythings_post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mythings_post_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_id` (`post_id`,`tag_id`),
  KEY `mythings_post_tags_tag_id_4538e0560fa2d6e5_fk_mythings_tag_id` (`tag_id`),
  CONSTRAINT `mythings_post_tags_post_id_32692c3e5fcc5b9b_fk_mythings_post_id` FOREIGN KEY (`post_id`) REFERENCES `mythings_post` (`id`),
  CONSTRAINT `mythings_post_tags_tag_id_4538e0560fa2d6e5_fk_mythings_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `mythings_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=358 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mythings_post_tags`
--

LOCK TABLES `mythings_post_tags` WRITE;
/*!40000 ALTER TABLE `mythings_post_tags` DISABLE KEYS */;
INSERT INTO `mythings_post_tags` VALUES (142,13,30),(143,13,31),(299,14,23),(295,14,24),(296,14,25),(297,14,26),(298,14,27),(284,15,18),(285,15,19),(286,15,20),(287,15,23),(283,16,23),(281,16,56),(282,16,57),(162,17,2),(163,17,3),(164,17,4),(165,17,5),(166,17,6),(167,17,7),(168,17,46),(169,17,54),(103,18,3),(105,18,46),(144,19,3),(145,19,46),(109,21,7),(110,21,44),(112,21,46),(111,21,54),(336,21,80),(113,22,27),(114,22,44),(115,22,46),(116,22,55),(98,24,44),(99,24,46),(97,24,51),(95,25,3),(93,25,9),(96,25,46),(94,25,50),(338,25,82),(149,26,3),(146,26,9),(150,26,46),(147,26,50),(148,26,59),(157,27,6),(158,27,7),(161,27,46),(156,27,50),(159,27,54),(160,27,61),(327,28,44),(175,28,46),(215,29,23),(214,29,69),(219,30,19),(222,30,23),(221,30,30),(220,30,69),(240,31,23),(236,31,26),(239,31,30),(237,31,68),(238,31,69),(248,32,23),(246,32,68),(247,32,69),(232,33,23),(229,33,27),(230,33,28),(231,33,69),(228,34,23),(225,34,26),(226,34,27),(227,34,69),(224,35,23),(223,35,69),(253,36,23),(198,37,23),(294,38,23),(293,38,70),(257,39,23),(255,39,26),(256,39,69),(254,39,71),(245,40,23),(241,40,26),(242,40,27),(243,40,28),(244,40,69),(265,41,23),(262,41,27),(263,41,28),(264,41,69),(267,42,44),(268,42,46),(266,42,50),(335,42,79),(274,43,46),(273,43,50),(272,43,72),(280,44,46),(278,44,73),(279,44,74),(308,45,23),(306,45,28),(307,45,69),(313,46,23),(311,46,27),(312,46,28),(309,46,56),(310,46,74),(318,47,23),(316,47,69),(314,47,74),(315,47,75),(317,47,78),(326,49,44),(324,49,46),(322,49,50),(337,49,81),(334,51,46),(332,51,50),(333,51,61),(341,52,23),(339,52,74),(340,52,83),(344,53,23),(342,53,74),(343,53,83),(347,54,23),(345,54,24),(346,54,74),(350,55,23),(348,55,74),(349,55,83),(354,56,23),(357,56,26),(352,56,69),(353,56,71),(355,56,74),(356,56,75),(351,56,84);
/*!40000 ALTER TABLE `mythings_post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mythings_tag`
--

DROP TABLE IF EXISTS `mythings_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mythings_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mythings_tag`
--

LOCK TABLES `mythings_tag` WRITE;
/*!40000 ALTER TABLE `mythings_tag` DISABLE KEYS */;
INSERT INTO `mythings_tag` VALUES (2,'sextrafficking'),(3,'infographic'),(4,'shelter'),(5,'statistics'),(6,'awareness'),(7,'antisextrafficking'),(9,'muscles'),(11,'coffee'),(15,'beer'),(16,'ingredients '),(18,'grandcanyon'),(19,'az'),(20,'fog'),(23,'passion'),(24,'iceskate'),(25,'bearlake'),(26,'mountains'),(27,'estespark'),(28,'rmnp'),(29,'europe'),(30,'travel'),(31,'plane'),(32,'test'),(44,'logo'),(46,'portfolio'),(50,'graphic'),(51,'mylogo'),(54,'amyshouse'),(55,'yoga'),(56,'biking'),(57,'vail'),(59,'sleep'),(61,'flyer'),(68,'europe2015'),(69,'trailrunning'),(70,'FTK'),(71,'race'),(72,'businesscard'),(73,'packaging_label'),(74,'outdoors'),(75,'running'),(78,'sanddunes'),(79,'modern_logo'),(80,'nonprofit_logo'),(81,'local_logo'),(82,'muscle_diagram'),(83,'skiing'),(84,'pikespeak');
/*!40000 ALTER TABLE `mythings_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mythings_task`
--

DROP TABLE IF EXISTS `mythings_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mythings_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `completed` tinyint(1) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mythings_task`
--

LOCK TABLES `mythings_task` WRITE;
/*!40000 ALTER TABLE `mythings_task` DISABLE KEYS */;
INSERT INTO `mythings_task` VALUES (1,1,'Learn API','today i did it');
/*!40000 ALTER TABLE `mythings_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mythings_userprofile`
--

DROP TABLE IF EXISTS `mythings_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mythings_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `website` varchar(200) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `mythings_userprofile_user_id_4d9641a480985e0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mythings_userprofile`
--

LOCK TABLES `mythings_userprofile` WRITE;
/*!40000 ALTER TABLE `mythings_userprofile` DISABLE KEYS */;
INSERT INTO `mythings_userprofile` VALUES (1,'http://www.google.com','profile_images/Screen_Shot_2015-11-12_at_9.19.44_AM.png',2),(2,'','',3),(3,'','',4),(5,'http://www.google.com','profile_images/Screen_Shot_2015-11-17_at_12.23.46_PM.png',6),(6,'','',7),(7,'','',8),(8,'http://www.michellehiland.com','profile_images/Screen_Shot_2015-11-16_at_11.52.19_AM.png',9);
/*!40000 ALTER TABLE `mythings_userprofile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-07 16:45:08
