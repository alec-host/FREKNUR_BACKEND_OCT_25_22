-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: 
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!50606 SET @OLD_INNODB_STATS_AUTO_RECALC=@@INNODB_STATS_AUTO_RECALC */;
/*!50606 SET GLOBAL INNODB_STATS_AUTO_RECALC=OFF */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `mysql`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysql` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `mysql`;

--
-- Table structure for table `columns_priv`
--

DROP TABLE IF EXISTS `columns_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `columns_priv` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Table_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Column_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`,`Db`,`User`,`Table_name`,`Column_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Column privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `columns_priv`
--

LOCK TABLES `columns_priv` WRITE;
/*!40000 ALTER TABLE `columns_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `columns_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `component`
--

DROP TABLE IF EXISTS `component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `component` (
  `component_id` int unsigned NOT NULL AUTO_INCREMENT,
  `component_group_id` int unsigned NOT NULL,
  `component_urn` text NOT NULL,
  PRIMARY KEY (`component_id`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Components';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `component`
--

LOCK TABLES `component` WRITE;
/*!40000 ALTER TABLE `component` DISABLE KEYS */;
INSERT INTO `component` VALUES (1,1,'file://component_validate_password');
/*!40000 ALTER TABLE `component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db`
--

DROP TABLE IF EXISTS `db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Host`,`Db`,`User`),
  KEY `User` (`User`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Database privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db`
--

LOCK TABLES `db` WRITE;
/*!40000 ALTER TABLE `db` DISABLE KEYS */;
INSERT INTO `db` VALUES ('%','africastalking','africastalking','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),('%','db_betting_moniter','api','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),('%','mpesa_recon','mpesa_recon','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),('%','mpesaboc','mpesa','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),('%','sportsbrain','sportsbrain','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),('localhost','performance_schema','mysql.session','Y','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N'),('localhost','sys','mysql.sys','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','Y');
/*!40000 ALTER TABLE `db` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_roles`
--

DROP TABLE IF EXISTS `default_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `default_roles` (
  `HOST` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `USER` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `DEFAULT_ROLE_HOST` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '%',
  `DEFAULT_ROLE_USER` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`HOST`,`USER`,`DEFAULT_ROLE_HOST`,`DEFAULT_ROLE_USER`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Default roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_roles`
--

LOCK TABLES `default_roles` WRITE;
/*!40000 ALTER TABLE `default_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine_cost`
--

DROP TABLE IF EXISTS `engine_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `engine_cost` (
  `engine_name` varchar(64) NOT NULL,
  `device_type` int NOT NULL,
  `cost_name` varchar(64) NOT NULL,
  `cost_value` float DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` varchar(1024) DEFAULT NULL,
  `default_value` float GENERATED ALWAYS AS ((case `cost_name` when _utf8mb3'io_block_read_cost' then 1.0 when _utf8mb3'memory_block_read_cost' then 0.25 else NULL end)) VIRTUAL,
  PRIMARY KEY (`cost_name`,`engine_name`,`device_type`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine_cost`
--

LOCK TABLES `engine_cost` WRITE;
/*!40000 ALTER TABLE `engine_cost` DISABLE KEYS */;
INSERT INTO `engine_cost` (`engine_name`, `device_type`, `cost_name`, `cost_value`, `last_update`, `comment`) VALUES ('default',0,'io_block_read_cost',NULL,'2019-02-07 13:12:48',NULL),('default',0,'memory_block_read_cost',NULL,'2019-02-07 13:12:48',NULL);
/*!40000 ALTER TABLE `engine_cost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `func`
--

DROP TABLE IF EXISTS `func`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `func` (
  `name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ret` tinyint NOT NULL DEFAULT '0',
  `dl` char(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `type` enum('function','aggregate') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='User defined functions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `func`
--

LOCK TABLES `func` WRITE;
/*!40000 ALTER TABLE `func` DISABLE KEYS */;
/*!40000 ALTER TABLE `func` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_grants`
--

DROP TABLE IF EXISTS `global_grants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `global_grants` (
  `USER` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `HOST` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `PRIV` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `WITH_GRANT_OPTION` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`USER`,`HOST`,`PRIV`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Extended global grants';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_grants`
--

LOCK TABLES `global_grants` WRITE;
/*!40000 ALTER TABLE `global_grants` DISABLE KEYS */;
INSERT INTO `global_grants` VALUES ('api','%','APPLICATION_PASSWORD_ADMIN','N'),('api','%','AUDIT_ADMIN','N'),('api','%','BACKUP_ADMIN','N'),('api','%','BINLOG_ADMIN','N'),('api','%','BINLOG_ENCRYPTION_ADMIN','N'),('api','%','CLONE_ADMIN','N'),('api','%','CONNECTION_ADMIN','N'),('api','%','ENCRYPTION_KEY_ADMIN','N'),('api','%','FLUSH_OPTIMIZER_COSTS','N'),('api','%','FLUSH_STATUS','N'),('api','%','FLUSH_TABLES','N'),('api','%','FLUSH_USER_RESOURCES','N'),('api','%','GROUP_REPLICATION_ADMIN','N'),('api','%','INNODB_REDO_LOG_ARCHIVE','N'),('api','%','INNODB_REDO_LOG_ENABLE','N'),('api','%','PERSIST_RO_VARIABLES_ADMIN','N'),('api','%','REPLICATION_APPLIER','N'),('api','%','REPLICATION_SLAVE_ADMIN','N'),('api','%','RESOURCE_GROUP_ADMIN','N'),('api','%','RESOURCE_GROUP_USER','N'),('api','%','ROLE_ADMIN','N'),('api','%','SERVICE_CONNECTION_ADMIN','N'),('api','%','SESSION_VARIABLES_ADMIN','N'),('api','%','SET_USER_ID','N'),('api','%','SHOW_ROUTINE','N'),('api','%','SYSTEM_USER','N'),('api','%','SYSTEM_VARIABLES_ADMIN','N'),('api','%','TABLE_ENCRYPTION_ADMIN','N'),('api','%','XA_RECOVER_ADMIN','N'),('freknur','%','FLUSH_OPTIMIZER_COSTS','Y'),('freknur','%','FLUSH_STATUS','Y'),('freknur','%','FLUSH_TABLES','Y'),('freknur','%','FLUSH_USER_RESOURCES','Y'),('freknur','%','INNODB_REDO_LOG_ARCHIVE','Y'),('freknur','%','SHOW_ROUTINE','Y'),('mysql.infoschema','localhost','SYSTEM_USER','N'),('mysql.session','localhost','AUDIT_ADMIN','N'),('mysql.session','localhost','BACKUP_ADMIN','N'),('mysql.session','localhost','CLONE_ADMIN','N'),('mysql.session','localhost','CONNECTION_ADMIN','N'),('mysql.session','localhost','INNODB_REDO_LOG_ENABLE','N'),('mysql.session','localhost','PERSIST_RO_VARIABLES_ADMIN','N'),('mysql.session','localhost','REPLICATION_APPLIER','N'),('mysql.session','localhost','SESSION_VARIABLES_ADMIN','N'),('mysql.session','localhost','SYSTEM_USER','N'),('mysql.session','localhost','SYSTEM_VARIABLES_ADMIN','N'),('mysql.sys','localhost','SYSTEM_USER','N'),('root','localhost','APPLICATION_PASSWORD_ADMIN','Y'),('root','localhost','AUDIT_ADMIN','Y'),('root','localhost','BACKUP_ADMIN','Y'),('root','localhost','BINLOG_ADMIN','Y'),('root','localhost','BINLOG_ENCRYPTION_ADMIN','Y'),('root','localhost','CLONE_ADMIN','Y'),('root','localhost','CONNECTION_ADMIN','Y'),('root','localhost','ENCRYPTION_KEY_ADMIN','Y'),('root','localhost','FLUSH_OPTIMIZER_COSTS','Y'),('root','localhost','FLUSH_STATUS','Y'),('root','localhost','FLUSH_TABLES','Y'),('root','localhost','FLUSH_USER_RESOURCES','Y'),('root','localhost','GROUP_REPLICATION_ADMIN','Y'),('root','localhost','INNODB_REDO_LOG_ARCHIVE','Y'),('root','localhost','INNODB_REDO_LOG_ENABLE','Y'),('root','localhost','PERSIST_RO_VARIABLES_ADMIN','Y'),('root','localhost','REPLICATION_APPLIER','Y'),('root','localhost','REPLICATION_SLAVE_ADMIN','Y'),('root','localhost','RESOURCE_GROUP_ADMIN','Y'),('root','localhost','RESOURCE_GROUP_USER','Y'),('root','localhost','ROLE_ADMIN','Y'),('root','localhost','SERVICE_CONNECTION_ADMIN','Y'),('root','localhost','SESSION_VARIABLES_ADMIN','Y'),('root','localhost','SET_USER_ID','Y'),('root','localhost','SHOW_ROUTINE','Y'),('root','localhost','SYSTEM_USER','Y'),('root','localhost','SYSTEM_VARIABLES_ADMIN','Y'),('root','localhost','TABLE_ENCRYPTION_ADMIN','Y'),('root','localhost','XA_RECOVER_ADMIN','Y');
/*!40000 ALTER TABLE `global_grants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gtid_executed`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `gtid_executed` (
  `source_uuid` char(36) NOT NULL COMMENT 'uuid of the source where the transaction was originally executed.',
  `interval_start` bigint NOT NULL COMMENT 'First number of interval.',
  `interval_end` bigint NOT NULL COMMENT 'Last number of interval.',
  PRIMARY KEY (`source_uuid`,`interval_start`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `help_category`
--

DROP TABLE IF EXISTS `help_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `help_category` (
  `help_category_id` smallint unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `parent_category_id` smallint unsigned DEFAULT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`help_category_id`),
  UNIQUE KEY `name` (`name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='help categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_category`
--

LOCK TABLES `help_category` WRITE;
/*!40000 ALTER TABLE `help_category` DISABLE KEYS */;
INSERT INTO `help_category` VALUES (0,'Contents',0,''),(1,'Help Metadata',0,''),(2,'Data Types',0,''),(3,'Administration',0,''),(4,'Functions',0,''),(5,'Enterprise Encryption Functions',4,''),(6,'Language Structure',0,''),(7,'Geographic Features',0,''),(8,'MBR',7,''),(9,'WKT',7,''),(10,'Comparison Operators',4,''),(11,'Logical Operators',4,''),(12,'Flow Control Functions',4,''),(13,'Numeric Functions',4,''),(14,'Date and Time Functions',4,''),(15,'String Functions',4,''),(16,'Cast Functions and Operators',4,''),(17,'XML',4,''),(18,'Bit Functions',4,''),(19,'Encryption Functions',4,''),(20,'Locking Functions',4,''),(21,'Information Functions',4,''),(22,'Spatial Functions',4,''),(23,'WKT Functions',22,''),(24,'WKB Functions',22,''),(25,'Geometry Constructors',22,''),(26,'Geometry Property Functions',22,''),(27,'Point Property Functions',22,''),(28,'LineString Property Functions',22,''),(29,'Polygon Property Functions',22,''),(30,'GeometryCollection Property Functions',22,''),(31,'Geometry Relation Functions',22,''),(32,'MBR Functions',22,''),(33,'GTID',4,''),(34,'Aggregate Functions and Modifiers',4,''),(35,'GROUP BY Functions and Modifiers',4,''),(36,'Window Functions',4,''),(37,'Performance Schema Functions',4,''),(38,'Internal Functions',4,''),(39,'Miscellaneous Functions',4,''),(40,'Data Definition',0,''),(41,'Data Manipulation',0,''),(42,'Transactions',0,''),(43,'Replication Statements',0,''),(44,'Prepared Statements',0,''),(45,'Compound Statements',0,''),(46,'Account Management',0,''),(47,'Table Maintenance',0,''),(48,'Loadable Functions',0,''),(49,'Components',0,''),(50,'Plugins',0,''),(51,'Utility',0,''),(52,'Storage Engines',0,'');
/*!40000 ALTER TABLE `help_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_keyword`
--

DROP TABLE IF EXISTS `help_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `help_keyword` (
  `help_keyword_id` int unsigned NOT NULL,
  `name` char(64) NOT NULL,
  PRIMARY KEY (`help_keyword_id`),
  UNIQUE KEY `name` (`name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='help keywords';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_keyword`
--

LOCK TABLES `help_keyword` WRITE;
/*!40000 ALTER TABLE `help_keyword` DISABLE KEYS */;
INSERT INTO `help_keyword` VALUES (108,'%'),(264,'&'),(422,'(JSON'),(86,'*'),(84,'+'),(85,'-'),(423,'->'),(425,'->>'),(87,'/'),(75,':='),(59,'<'),(266,'<<'),(58,'<='),(56,'<=>'),(57,'<>'),(55,'='),(61,'>'),(60,'>='),(267,'>>'),(90,'ABS'),(878,'ACCOUNT'),(91,'ACOS'),(658,'ACTION'),(49,'ADD'),(120,'ADDDATE'),(121,'ADDTIME'),(904,'ADMIN'),(270,'AES_DECRYPT'),(271,'AES_ENCRYPT'),(580,'AFTER'),(247,'AGAINST'),(925,'AGGREGATE'),(581,'ALGORITHM'),(720,'ALL'),(50,'ALTER'),(582,'ANALYZE'),(62,'AND'),(526,'ANY_VALUE'),(659,'ARCHIVE'),(254,'ARRAY'),(721,'AS'),(464,'ASC'),(185,'ASCII'),(92,'ASIN'),(773,'ASSIGN_GTIDS_TO_ANONYMOUS_TRANSACTIONS'),(6,'ASYMMETRIC_DECRYPT'),(7,'ASYMMETRIC_DERIVE'),(8,'ASYMMETRIC_ENCRYPT'),(9,'ASYMMETRIC_SIGN'),(10,'ASYMMETRIC_VERIFY'),(642,'AT'),(93,'ATAN'),(94,'ATAN2'),(879,'ATTRIBUTE'),(742,'AUTOCOMMIT'),(583,'AUTOEXTEND_SIZE'),(584,'AUTO_INCREMENT'),(458,'AVG'),(585,'AVG_ROW_LENGTH'),(754,'BACKUP'),(768,'BEFORE'),(743,'BEGIN'),(288,'BENCHMARK'),(63,'BETWEEN'),(186,'BIN'),(253,'BINARY'),(562,'BINLOG'),(527,'BIN_TO_UUID'),(460,'BIT_AND'),(269,'BIT_COUNT'),(187,'BIT_LENGTH'),(461,'BIT_OR'),(462,'BIT_XOR'),(17,'BOOL'),(18,'BOOLEAN'),(230,'BOTH'),(646,'BTREE'),(465,'BY'),(42,'BYTE'),(960,'CACHE'),(688,'CALL'),(497,'CAN_ACCESS_COLUMN'),(498,'CAN_ACCESS_DATABASE'),(499,'CAN_ACCESS_TABLE'),(500,'CAN_ACCESS_USER'),(501,'CAN_ACCESS_VIEW'),(660,'CASCADE'),(76,'CASE'),(255,'CAST'),(859,'CATALOG_NAME'),(95,'CEIL'),(96,'CEILING'),(744,'CHAIN'),(586,'CHANGE'),(563,'CHANNEL'),(43,'CHAR'),(39,'CHARACTER'),(189,'CHARACTER_LENGTH'),(289,'CHARSET'),(188,'CHAR_LENGTH'),(587,'CHECK'),(588,'CHECKSUM'),(880,'CIPHER'),(860,'CLASS_ORIGIN'),(905,'CLIENT'),(933,'CLONE'),(694,'CLOSE'),(65,'COALESCE'),(954,'CODE'),(290,'COERCIBILITY'),(545,'COLLATE'),(291,'COLLATION'),(589,'COLUMN'),(590,'COLUMNS'),(861,'COLUMN_NAME'),(550,'COMMENT'),(745,'COMMIT'),(757,'COMMITTED'),(661,'COMPACT'),(551,'COMPLETION'),(929,'COMPONENT'),(272,'COMPRESS'),(662,'COMPRESSED'),(591,'COMPRESSION'),(190,'CONCAT'),(191,'CONCAT_WS'),(707,'CONCURRENT'),(856,'CONDITION'),(592,'CONNECTION'),(292,'CONNECTION_ID'),(746,'CONSISTENT'),(593,'CONSTRAINT'),(862,'CONSTRAINT_CATALOG'),(863,'CONSTRAINT_NAME'),(864,'CONSTRAINT_SCHEMA'),(857,'CONTINUE'),(97,'CONV'),(256,'CONVERT'),(122,'CONVERT_TZ'),(98,'COS'),(99,'COT'),(463,'COUNT'),(100,'CRC32'),(51,'CREATE'),(11,'CREATE_ASYMMETRIC_PRIV_KEY'),(12,'CREATE_ASYMMETRIC_PUB_KEY'),(13,'CREATE_DH_PARAMETERS'),(14,'CREATE_DIGEST'),(737,'CROSS'),(663,'CSV'),(482,'CUME_DIST'),(123,'CURDATE'),(881,'CURRENT'),(124,'CURRENT_DATE'),(293,'CURRENT_ROLE'),(125,'CURRENT_TIME'),(126,'CURRENT_TIMESTAMP'),(294,'CURRENT_USER'),(854,'CURSOR'),(865,'CURSOR_NAME'),(127,'CURTIME'),(594,'DATA'),(295,'DATABASE'),(938,'DATABASES'),(635,'DATAFILE'),(36,'DATE'),(128,'DATEDIFF'),(257,'DATETIME'),(129,'DATE_ADD'),(144,'DATE_FORMAT'),(130,'DATE_SUB'),(131,'DAY'),(145,'DAYNAME'),(146,'DAYOFMONTH'),(147,'DAYOFWEEK'),(148,'DAYOFYEAR'),(132,'DAY_HOUR'),(133,'DAY_MINUTE'),(134,'DAY_SECOND'),(845,'DEALLOCATE'),(28,'DEC'),(31,'DECIMAL'),(846,'DECLARE'),(2,'DEFAULT'),(836,'DEFAULT_AUTH'),(552,'DEFINER'),(652,'DEFINITION'),(101,'DEGREES'),(700,'DELAYED'),(595,'DELAY_KEY_WRITE'),(664,'DELETE'),(483,'DENSE_RANK'),(466,'DESC'),(971,'DESCRIBE'),(653,'DESCRIPTION'),(866,'DIAGNOSTICS'),(596,'DIRECTORY'),(553,'DISABLE'),(597,'DISCARD'),(459,'DISTINCT'),(722,'DISTINCTROW'),(88,'DIV'),(554,'DO'),(598,'DROP'),(736,'DUAL'),(723,'DUMPFILE'),(701,'DUPLICATE'),(665,'DYNAMIC'),(77,'ELSE'),(847,'ELSEIF'),(192,'ELT'),(555,'ENABLE'),(708,'ENCLOSED'),(546,'ENCRYPTION'),(78,'END'),(643,'ENDS'),(599,'ENGINE'),(939,'ENGINES'),(564,'ERROR'),(940,'ERRORS'),(239,'ESCAPE'),(709,'ESCAPED'),(556,'EVENT'),(952,'EVENTS'),(644,'EVERY'),(916,'EXCEPT'),(600,'EXCHANGE'),(844,'EXECUTE'),(641,'EXISTS'),(858,'EXIT'),(102,'EXP'),(248,'EXPANSION'),(882,'EXPIRE'),(972,'EXPLAIN'),(961,'EXPORT'),(193,'EXPORT_SET'),(923,'EXTENDED'),(681,'EXTENT_SIZE'),(149,'EXTRACT'),(424,'EXTRACTION)'),(261,'EXTRACTVALUE'),(883,'FAILED_LOGIN_ATTEMPTS'),(15,'FALSE'),(921,'FAST'),(666,'FEDERATED'),(855,'FETCH'),(194,'FIELD'),(710,'FIELDS'),(906,'FILE'),(682,'FILE_BLOCK_SIZE'),(802,'FILTER'),(195,'FIND_IN_SET'),(601,'FIRST'),(484,'FIRST_VALUE'),(29,'FIXED'),(32,'FLOAT4'),(33,'FLOAT8'),(103,'FLOOR'),(962,'FLUSH'),(565,'FOR'),(738,'FORCE'),(602,'FOREIGN'),(196,'FORMAT'),(493,'FORMAT_BYTES'),(494,'FORMAT_PICO_TIME'),(296,'FOUND_ROWS'),(231,'FROM'),(197,'FROM_BASE64'),(150,'FROM_DAYS'),(151,'FROM_UNIXTIME'),(667,'FULL'),(603,'FULLTEXT'),(169,'FUNCTION'),(963,'GENERAL'),(336,'GEOMCOLLECTION'),(337,'GEOMETRYCOLLECTION'),(867,'GET'),(502,'GET_DD_COLUMN_PRIVILEGES'),(503,'GET_DD_CREATE_OPTIONS'),(504,'GET_DD_INDEX_SUB_PART_LENGTH'),(152,'GET_FORMAT'),(283,'GET_LOCK'),(758,'GLOBAL'),(907,'GRANT'),(941,'GRANTS'),(66,'GREATEST'),(575,'GROUP'),(528,'GROUPING'),(467,'GROUP_CONCAT'),(454,'GTID_SUBSET'),(455,'GTID_SUBTRACT'),(695,'HANDLER'),(724,'HAVING'),(668,'HEAP'),(5,'HELP'),(0,'HELP_DATE'),(1,'HELP_VERSION'),(198,'HEX'),(702,'HIGH_PRIORITY'),(884,'HISTORY'),(647,'HOST'),(942,'HOSTS'),(135,'HOUR'),(136,'HOUR_MINUTE'),(137,'HOUR_SECOND'),(297,'ICU_VERSION'),(718,'IDENTIFIED'),(81,'IF'),(82,'IFNULL'),(703,'IGNORE'),(774,'IGNORE_SERVER_IDS'),(604,'IMPORT'),(67,'IN'),(52,'INDEX'),(943,'INDEXES'),(531,'INET6_ATON'),(532,'INET6_NTOA'),(529,'INET_ATON'),(530,'INET_NTOA'),(711,'INFILE'),(636,'INITIAL_SIZE'),(426,'INLINE'),(739,'INNER'),(566,'INNODB'),(199,'INSERT'),(605,'INSERT_METHOD'),(930,'INSTALL'),(567,'INSTANCE'),(200,'INSTR'),(19,'INT1'),(22,'INT2'),(23,'INT3'),(25,'INT4'),(27,'INT8'),(26,'INTEGER'),(505,'INTERNAL_AUTO_INCREMENT'),(506,'INTERNAL_AVG_ROW_LENGTH'),(508,'INTERNAL_CHECKSUM'),(507,'INTERNAL_CHECK_TIME'),(509,'INTERNAL_DATA_FREE'),(510,'INTERNAL_DATA_LENGTH'),(511,'INTERNAL_DD_CHAR_LENGTH'),(512,'INTERNAL_GET_COMMENT_OR_ERROR'),(513,'INTERNAL_GET_ENABLED_ROLE_JSON'),(514,'INTERNAL_GET_HOSTNAME'),(515,'INTERNAL_GET_USERNAME'),(516,'INTERNAL_GET_VIEW_WARNING_OR_ERROR'),(517,'INTERNAL_INDEX_COLUMN_CARDINALITY'),(518,'INTERNAL_INDEX_LENGTH'),(519,'INTERNAL_IS_ENABLED_ROLE'),(520,'INTERNAL_IS_MANDATORY_ROLE'),(521,'INTERNAL_KEYS_DISABLED'),(522,'INTERNAL_MAX_DATA_LENGTH'),(523,'INTERNAL_TABLE_ROWS'),(524,'INTERNAL_UPDATE_TIME'),(68,'INTERVAL'),(704,'INTO'),(606,'INVISIBLE'),(837,'IO_THREAD'),(69,'IS'),(71,'ISNULL'),(759,'ISOLATION'),(885,'ISSUER'),(284,'IS_FREE_LOCK'),(533,'IS_IPV4'),(534,'IS_IPV4_COMPAT'),(535,'IS_IPV4_MAPPED'),(536,'IS_IPV6'),(285,'IS_USED_LOCK'),(537,'IS_UUID'),(525,'IS_VISIBLE_DD_OBJECT'),(848,'ITERATE'),(725,'JOIN'),(259,'JSON'),(416,'JSON_ARRAY'),(470,'JSON_ARRAYAGG'),(434,'JSON_ARRAY_APPEND'),(435,'JSON_ARRAY_INSERT'),(419,'JSON_CONTAINS'),(420,'JSON_CONTAINS_PATH'),(444,'JSON_DEPTH'),(421,'JSON_EXTRACT'),(436,'JSON_INSERT'),(428,'JSON_KEYS'),(445,'JSON_LENGTH'),(437,'JSON_MERGE'),(438,'JSON_MERGE_PATCH'),(439,'JSON_MERGE_PRESERVE'),(417,'JSON_OBJECT'),(471,'JSON_OBJECTAGG'),(429,'JSON_OVERLAPS'),(451,'JSON_PRETTY'),(418,'JSON_QUOTE'),(440,'JSON_REMOVE'),(441,'JSON_REPLACE'),(449,'JSON_SCHEMA_VALID'),(450,'JSON_SCHEMA_VALIDATION_REPORT'),(430,'JSON_SEARCH'),(442,'JSON_SET'),(452,'JSON_STORAGE_FREE'),(453,'JSON_STORAGE_SIZE'),(448,'JSON_TABLE'),(446,'JSON_TYPE'),(443,'JSON_UNQUOTE'),(447,'JSON_VALID'),(431,'JSON_VALUE'),(53,'KEY'),(568,'KEYRING'),(607,'KEYS'),(608,'KEY_BLOCK_SIZE'),(968,'KILL'),(485,'LAG'),(696,'LAST'),(153,'LAST_DAY'),(298,'LAST_INSERT_ID'),(486,'LAST_VALUE'),(201,'LCASE'),(487,'LEAD'),(232,'LEADING'),(72,'LEAST'),(849,'LEAVE'),(969,'LEAVES'),(202,'LEFT'),(203,'LENGTH'),(760,'LEVEL'),(223,'LIKE'),(689,'LIMIT'),(712,'LINES'),(338,'LINESTRING'),(104,'LN'),(713,'LOAD'),(204,'LOAD_FILE'),(714,'LOCAL'),(154,'LOCALTIME'),(155,'LOCALTIMESTAMP'),(205,'LOCATE'),(609,'LOCK'),(105,'LOG'),(107,'LOG10'),(106,'LOG2'),(576,'LOGFILE'),(769,'LOGS'),(47,'LONG'),(48,'LONGBINARY'),(850,'LOOP'),(206,'LOWER'),(690,'LOW_PRIORITY'),(207,'LPAD'),(208,'LTRIM'),(156,'MAKEDATE'),(157,'MAKETIME'),(209,'MAKE_SET'),(569,'MASTER'),(775,'MASTER_AUTO_POSITION'),(776,'MASTER_BIND'),(777,'MASTER_COMPRESSION_ALGORITHMS'),(778,'MASTER_CONNECT_RETRY'),(779,'MASTER_HEARTBEAT_PERIOD'),(780,'MASTER_HOST'),(781,'MASTER_LOG_FILE'),(782,'MASTER_LOG_POS'),(783,'MASTER_PASSWORD'),(784,'MASTER_PORT'),(538,'MASTER_POS_WAIT'),(785,'MASTER_RETRY_COUNT'),(786,'MASTER_SSL'),(787,'MASTER_SSL_CA'),(788,'MASTER_SSL_CERT'),(789,'MASTER_SSL_CIPHER'),(790,'MASTER_SSL_CRL'),(791,'MASTER_SSL_CRLPATH'),(792,'MASTER_SSL_KEY'),(793,'MASTER_SSL_VERIFY_SERVER_CERT'),(794,'MASTER_TLS_CIPHERSUITES'),(795,'MASTER_TLS_VERSION'),(796,'MASTER_USER'),(797,'MASTER_ZSTD_COMPRESSION_LEVEL'),(249,'MATCH'),(472,'MAX'),(886,'MAX_CONNECTIONS_PER_HOUR'),(887,'MAX_QUERIES_PER_HOUR'),(610,'MAX_ROWS'),(683,'MAX_SIZE'),(888,'MAX_UPDATES_PER_HOUR'),(889,'MAX_USER_CONNECTIONS'),(395,'MBRCONTAINS'),(396,'MBRCOVEREDBY'),(397,'MBRCOVERS'),(398,'MBRDISJOINT'),(399,'MBREQUALS'),(400,'MBRINTERSECTS'),(401,'MBROVERLAPS'),(402,'MBRTOUCHES'),(403,'MBRWITHIN'),(273,'MD5'),(922,'MEDIUM'),(432,'MEMBER'),(726,'MEMORY'),(669,'MERGE'),(868,'MESSAGE_TEXT'),(158,'MICROSECOND'),(210,'MID'),(24,'MIDDLEINT'),(473,'MIN'),(138,'MINUTE'),(139,'MINUTE_SECOND'),(611,'MIN_ROWS'),(89,'MOD'),(250,'MODE'),(612,'MODIFY'),(140,'MONTH'),(159,'MONTHNAME'),(670,'MRG_MYISAM'),(339,'MULTILINESTRING'),(340,'MULTIPOINT'),(341,'MULTIPOLYGON'),(944,'MUTEX'),(671,'MYISAM'),(869,'MYSQL_ERRNO'),(654,'NAME'),(937,'NAMES'),(539,'NAME_CONST'),(40,'NATIONAL'),(740,'NATURAL'),(41,'NCHAR'),(672,'NDB'),(673,'NDBCLUSTER'),(798,'NETWORK_NAMESPACE'),(890,'NEVER'),(697,'NEXT'),(570,'NO'),(684,'NODEGROUP'),(891,'NONE'),(64,'NOT'),(160,'NOW'),(920,'NO_WRITE_TO_BINLOG'),(488,'NTH_VALUE'),(489,'NTILE'),(70,'NULL'),(83,'NULLIF'),(870,'NUMBER'),(30,'NUMERIC'),(44,'NVARCHAR'),(211,'OCT'),(212,'OCTET_LENGTH'),(433,'OF'),(727,'OFFSET'),(892,'OLD'),(557,'ON'),(547,'ONLY'),(698,'OPEN'),(613,'OPTIMIZE'),(964,'OPTIMIZER_COSTS'),(908,'OPTION'),(893,'OPTIONAL'),(715,'OPTIONALLY'),(578,'OPTIONS'),(73,'OR'),(213,'ORD'),(468,'ORDER'),(655,'ORGANIZATION'),(741,'OUTER'),(728,'OUTFILE'),(648,'OWNER'),(614,'PACK_KEYS'),(615,'PARSER'),(674,'PARTIAL'),(616,'PARTITION'),(617,'PARTITIONING'),(618,'PASSWORD'),(894,'PASSWORD_LOCK_TIME'),(427,'PATH)'),(490,'PERCENT_RANK'),(161,'PERIOD_ADD'),(162,'PERIOD_DIFF'),(934,'PERSIST'),(935,'PERSIST_ONLY'),(109,'PI'),(931,'PLUGIN'),(955,'PLUGINS'),(838,'PLUGIN_DIR'),(342,'POINT'),(343,'POLYGON'),(649,'PORT'),(214,'POSITION'),(110,'POW'),(111,'POWER'),(34,'PRECISION'),(765,'PREPARE'),(558,'PRESERVE'),(699,'PREV'),(619,'PRIMARY'),(909,'PRIVILEGES'),(799,'PRIVILEGE_CHECKS_USER'),(577,'PROCEDURE'),(910,'PROCESS'),(945,'PROCESSLIST'),(956,'PROFILE'),(957,'PROFILES'),(914,'PROXY'),(495,'PS_CURRENT_THREAD_ID'),(496,'PS_THREAD_ID'),(770,'PURGE'),(163,'QUARTER'),(251,'QUERY'),(691,'QUICK'),(215,'QUOTE'),(112,'RADIANS'),(113,'RAND'),(895,'RANDOM'),(274,'RANDOM_BYTES'),(491,'RANK'),(548,'READ'),(35,'REAL'),(620,'REBUILD'),(766,'RECOVER'),(571,'REDO_LOG'),(675,'REDUNDANT'),(656,'REFERENCE'),(676,'REFERENCES'),(241,'REGEXP'),(243,'REGEXP_INSTR'),(244,'REGEXP_LIKE'),(245,'REGEXP_REPLACE'),(246,'REGEXP_SUBSTR'),(965,'RELAY'),(958,'RELAYLOG'),(800,'RELAY_LOG_FILE'),(801,'RELAY_LOG_POS'),(747,'RELEASE'),(286,'RELEASE_ALL_LOCKS'),(287,'RELEASE_LOCK'),(572,'RELOAD'),(621,'REMOVE'),(559,'RENAME'),(622,'REORGANIZE'),(623,'REPAIR'),(216,'REPEAT'),(761,'REPEATABLE'),(217,'REPLACE'),(835,'REPLICA'),(959,'REPLICAS'),(803,'REPLICATE_DO_DB'),(804,'REPLICATE_DO_TABLE'),(805,'REPLICATE_IGNORE_DB'),(806,'REPLICATE_IGNORE_TABLE'),(807,'REPLICATE_REWRITE_DB'),(808,'REPLICATE_WILD_DO_TABLE'),(809,'REPLICATE_WILD_IGNORE_TABLE'),(810,'REPLICATION'),(896,'REQUIRE'),(771,'RESET'),(875,'RESIGNAL'),(917,'RESOURCE'),(970,'RESTART'),(679,'RESTRICT'),(897,'RETAIN'),(852,'RETURN'),(871,'RETURNED_SQLSTATE'),(926,'RETURNS'),(898,'REUSE'),(218,'REVERSE'),(915,'REVOKE'),(219,'RIGHT'),(242,'RLIKE'),(899,'ROLE'),(299,'ROLES_GRAPHML'),(573,'ROLLBACK'),(114,'ROUND'),(705,'ROW'),(719,'ROWS'),(300,'ROW_COUNT'),(624,'ROW_FORMAT'),(492,'ROW_NUMBER'),(220,'RPAD'),(221,'RTRIM'),(753,'SAVEPOINT'),(560,'SCHEDULE'),(301,'SCHEMA'),(946,'SCHEMAS'),(872,'SCHEMA_NAME'),(141,'SECOND'),(164,'SEC_TO_TIME'),(706,'SELECT'),(469,'SEPARATOR'),(3,'SERIAL'),(762,'SERIALIZABLE'),(579,'SERVER'),(763,'SESSION'),(302,'SESSION_USER'),(549,'SET'),(275,'SHA'),(276,'SHA1'),(277,'SHA2'),(729,'SHARE'),(947,'SHOW'),(911,'SHUTDOWN'),(115,'SIGN'),(877,'SIGNAL'),(260,'SIGNED'),(116,'SIN'),(561,'SLAVE'),(540,'SLEEP'),(966,'SLOW'),(748,'SNAPSHOT'),(650,'SOCKET'),(927,'SONAME'),(222,'SOUNDEX'),(224,'SOUNDS'),(811,'SOURCE'),(812,'SOURCE_AUTO_POSITION'),(813,'SOURCE_BIND'),(814,'SOURCE_COMPRESSION_ALGORITHMS'),(815,'SOURCE_CONNECT_RETRY'),(816,'SOURCE_HEARTBEAT_PERIOD'),(817,'SOURCE_HOST'),(818,'SOURCE_LOG_FILE'),(819,'SOURCE_LOG_POS'),(820,'SOURCE_PASSWORD'),(821,'SOURCE_PORT'),(822,'SOURCE_RETRY_COUNT'),(823,'SOURCE_SSL'),(824,'SOURCE_SSL_CA'),(825,'SOURCE_SSL_CERT'),(826,'SOURCE_SSL_CIPHER'),(827,'SOURCE_SSL_CRL'),(828,'SOURCE_SSL_CRLPATH'),(829,'SOURCE_SSL_KEY'),(830,'SOURCE_SSL_VERIFY_SERVER_CERT'),(831,'SOURCE_TLS_CIPHERSUITES'),(832,'SOURCE_TLS_VERSION'),(833,'SOURCE_USER'),(834,'SOURCE_ZSTD_COMPRESSION_LEVEL'),(225,'SPACE'),(625,'SPATIAL'),(876,'SQLSTATE'),(839,'SQL_AFTER_GTIDS'),(840,'SQL_AFTER_MTS_GAPS'),(841,'SQL_BEFORE_GTIDS'),(730,'SQL_BIG_RESULT'),(731,'SQL_BUFFER_RESULT'),(732,'SQL_CALC_FOUND_ROWS'),(772,'SQL_LOG_BIN'),(733,'SQL_NO_CACHE'),(734,'SQL_SMALL_RESULT'),(842,'SQL_THREAD'),(117,'SQRT'),(900,'SSL'),(749,'START'),(716,'STARTING'),(645,'STARTS'),(278,'STATEMENT_DIGEST'),(279,'STATEMENT_DIGEST_TEXT'),(626,'STATS_AUTO_RECALC'),(627,'STATS_PERSISTENT'),(628,'STATS_SAMPLE_PAGES'),(948,'STATUS'),(474,'STD'),(475,'STDDEV'),(476,'STDDEV_POP'),(477,'STDDEV_SAMP'),(843,'STOP'),(953,'STORAGE'),(677,'STORED'),(735,'STRAIGHT_JOIN'),(240,'STRCMP'),(928,'STRING'),(165,'STR_TO_DATE'),(365,'ST_AREA'),(344,'ST_ASBINARY'),(408,'ST_ASGEOJSON'),(346,'ST_ASTEXT'),(345,'ST_ASWKB'),(347,'ST_ASWKT'),(373,'ST_BUFFER'),(374,'ST_BUFFER_STRATEGY'),(366,'ST_CENTROID'),(410,'ST_COLLECT'),(384,'ST_CONTAINS'),(375,'ST_CONVEXHULL'),(385,'ST_CROSSES'),(376,'ST_DIFFERENCE'),(349,'ST_DIMENSION'),(386,'ST_DISJOINT'),(387,'ST_DISTANCE'),(411,'ST_DISTANCE_SPHERE'),(359,'ST_ENDPOINT'),(350,'ST_ENVELOPE'),(388,'ST_EQUALS'),(367,'ST_EXTERIORRING'),(389,'ST_FRECHETDISTANCE'),(404,'ST_GEOHASH'),(306,'ST_GEOMCOLLFROMTEXT'),(321,'ST_GEOMCOLLFROMWKB'),(307,'ST_GEOMETRYCOLLECTIONFROMTEXT'),(322,'ST_GEOMETRYCOLLECTIONFROMWKB'),(308,'ST_GEOMETRYFROMTEXT'),(323,'ST_GEOMETRYFROMWKB'),(371,'ST_GEOMETRYN'),(351,'ST_GEOMETRYTYPE'),(409,'ST_GEOMFROMGEOJSON'),(309,'ST_GEOMFROMTEXT'),(324,'ST_GEOMFROMWKB'),(390,'ST_HAUSDORFFDISTANCE'),(368,'ST_INTERIORRINGN'),(377,'ST_INTERSECTION'),(391,'ST_INTERSECTS'),(360,'ST_ISCLOSED'),(352,'ST_ISEMPTY'),(353,'ST_ISSIMPLE'),(412,'ST_ISVALID'),(405,'ST_LATFROMGEOHASH'),(355,'ST_LATITUDE'),(361,'ST_LENGTH'),(310,'ST_LINEFROMTEXT'),(325,'ST_LINEFROMWKB'),(378,'ST_LINEINTERPOLATEPOINT'),(379,'ST_LINEINTERPOLATEPOINTS'),(311,'ST_LINESTRINGFROMTEXT'),(326,'ST_LINESTRINGFROMWKB'),(406,'ST_LONGFROMGEOHASH'),(356,'ST_LONGITUDE'),(413,'ST_MAKEENVELOPE'),(312,'ST_MLINEFROMTEXT'),(327,'ST_MLINEFROMWKB'),(314,'ST_MPOINTFROMTEXT'),(329,'ST_MPOINTFROMWKB'),(316,'ST_MPOLYFROMTEXT'),(331,'ST_MPOLYFROMWKB'),(313,'ST_MULTILINESTRINGFROMTEXT'),(328,'ST_MULTILINESTRINGFROMWKB'),(315,'ST_MULTIPOINTFROMTEXT'),(330,'ST_MULTIPOINTFROMWKB'),(317,'ST_MULTIPOLYGONFROMTEXT'),(332,'ST_MULTIPOLYGONFROMWKB'),(372,'ST_NUMGEOMETRIES'),(369,'ST_NUMINTERIORRING'),(370,'ST_NUMINTERIORRINGS'),(362,'ST_NUMPOINTS'),(392,'ST_OVERLAPS'),(380,'ST_POINTATDISTANCE'),(407,'ST_POINTFROMGEOHASH'),(318,'ST_POINTFROMTEXT'),(333,'ST_POINTFROMWKB'),(363,'ST_POINTN'),(319,'ST_POLYFROMTEXT'),(334,'ST_POLYFROMWKB'),(320,'ST_POLYGONFROMTEXT'),(335,'ST_POLYGONFROMWKB'),(414,'ST_SIMPLIFY'),(354,'ST_SRID'),(364,'ST_STARTPOINT'),(348,'ST_SWAPXY'),(381,'ST_SYMDIFFERENCE'),(393,'ST_TOUCHES'),(382,'ST_TRANSFORM'),(383,'ST_UNION'),(415,'ST_VALIDATE'),(394,'ST_WITHIN'),(357,'ST_X'),(358,'ST_Y'),(873,'SUBCLASS_ORIGIN'),(166,'SUBDATE'),(901,'SUBJECT'),(226,'SUBSTR'),(227,'SUBSTRING'),(228,'SUBSTRING_INDEX'),(167,'SUBTIME'),(478,'SUM'),(912,'SUPER'),(168,'SYSDATE'),(657,'SYSTEM'),(303,'SYSTEM_USER'),(54,'TABLE'),(756,'TABLES'),(629,'TABLESPACE'),(874,'TABLE_NAME'),(118,'TAN'),(687,'TEMPORARY'),(717,'TERMINATED'),(79,'THEN'),(918,'THREAD_PRIORITY'),(38,'TIME'),(170,'TIMEDIFF'),(37,'TIMESTAMP'),(171,'TIMESTAMPADD'),(172,'TIMESTAMPDIFF'),(258,'TIMEZONE'),(173,'TIME_FORMAT'),(174,'TIME_TO_SEC'),(574,'TLS'),(637,'TO'),(229,'TO_BASE64'),(175,'TO_DAYS'),(176,'TO_SECONDS'),(973,'TRADITIONAL'),(233,'TRAILING'),(750,'TRANSACTION'),(974,'TREE'),(686,'TRIGGER'),(949,'TRIGGERS'),(234,'TRIM'),(16,'TRUE'),(119,'TRUNCATE'),(630,'TYPE'),(235,'UCASE'),(902,'UNBOUNDED'),(764,'UNCOMMITTED'),(280,'UNCOMPRESS'),(281,'UNCOMPRESSED_LENGTH'),(638,'UNDO'),(236,'UNHEX'),(932,'UNINSTALL'),(631,'UNION'),(632,'UNIQUE'),(177,'UNIX_TIMESTAMP'),(755,'UNLOCK'),(20,'UNSIGNED'),(851,'UNTIL'),(680,'UPDATE'),(262,'UPDATEXML'),(633,'UPGRADE'),(237,'UPPER'),(913,'USAGE'),(685,'USE'),(304,'USER'),(967,'USER_RESOURCES'),(924,'USE_FRM'),(692,'USING'),(178,'UTC_DATE'),(179,'UTC_TIME'),(180,'UTC_TIMESTAMP'),(541,'UUID'),(542,'UUID_SHORT'),(543,'UUID_TO_BIN'),(282,'VALIDATE_PASSWORD_STRENGTH'),(4,'VALUE'),(544,'VALUES'),(45,'VARCHARACTER'),(936,'VARIABLE'),(950,'VARIABLES'),(481,'VARIANCE'),(46,'VARYING'),(479,'VAR_POP'),(480,'VAR_SAMP'),(919,'VCPU'),(305,'VERSION'),(640,'VIEW'),(678,'VIRTUAL'),(634,'VISIBLE'),(639,'WAIT'),(456,'WAIT_FOR_EXECUTED_GTID_SET'),(457,'WAIT_UNTIL_SQL_THREAD_AFTER_GTIDS'),(951,'WARNINGS'),(181,'WEEK'),(182,'WEEKDAY'),(183,'WEEKOFYEAR'),(238,'WEIGHT_STRING'),(80,'WHEN'),(693,'WHERE'),(853,'WHILE'),(252,'WITH'),(751,'WORK'),(651,'WRAPPER'),(752,'WRITE'),(903,'X509'),(767,'XA'),(74,'XOR'),(142,'YEAR'),(184,'YEARWEEK'),(143,'YEAR_MONTH'),(21,'ZEROFILL'),(265,'^'),(263,'|'),(268,'~');
/*!40000 ALTER TABLE `help_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_relation`
--

DROP TABLE IF EXISTS `help_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `help_relation` (
  `help_topic_id` int unsigned NOT NULL,
  `help_keyword_id` int unsigned NOT NULL,
  PRIMARY KEY (`help_keyword_id`,`help_topic_id`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='keyword-topic relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_relation`
--

LOCK TABLES `help_relation` WRITE;
/*!40000 ALTER TABLE `help_relation` DISABLE KEYS */;
INSERT INTO `help_relation` VALUES (0,0),(1,1),(2,2),(483,2),(501,2),(502,2),(509,2),(512,2),(513,2),(521,2),(522,2),(545,2),(550,2),(589,2),(607,2),(609,2),(615,2),(617,2),(2,3),(521,3),(2,4),(545,4),(550,4),(605,4),(606,4),(3,5),(697,5),(4,6),(5,7),(6,8),(7,9),(8,10),(9,11),(10,12),(11,13),(12,14),(13,15),(14,15),(13,16),(14,16),(16,17),(17,17),(16,18),(240,18),(16,19),(16,20),(20,20),(22,20),(23,20),(25,20),(26,20),(243,20),(16,21),(20,21),(22,21),(23,21),(25,21),(26,21),(18,22),(19,23),(19,24),(20,25),(20,26),(243,26),(627,26),(22,27),(23,28),(23,29),(521,29),(23,30),(24,31),(243,31),(627,31),(25,32),(26,33),(26,34),(26,35),(627,35),(28,36),(129,36),(131,36),(243,36),(30,37),(165,37),(31,38),(163,38),(243,38),(33,39),(35,39),(501,39),(502,39),(509,39),(512,39),(513,39),(521,39),(548,39),(549,39),(551,39),(635,39),(636,39),(638,39),(642,39),(33,40),(35,40),(33,41),(34,42),(34,43),(184,43),(243,43),(35,44),(35,45),(35,46),(44,47),(44,48),(53,49),(509,49),(510,49),(523,49),(53,50),(501,50),(502,50),(503,50),(504,50),(505,50),(506,50),(507,50),(508,50),(509,50),(510,50),(511,50),(607,50),(612,50),(618,50),(53,51),(512,51),(513,51),(514,51),(515,51),(516,51),(517,51),(518,51),(519,51),(520,51),(521,51),(523,51),(524,51),(525,51),(608,51),(609,51),(619,51),(627,51),(638,51),(646,51),(647,51),(648,51),(649,51),(650,51),(651,51),(653,51),(53,52),(509,52),(515,52),(521,52),(529,52),(553,52),(638,52),(664,52),(686,52),(689,52),(53,53),(509,53),(521,53),(522,53),(545,53),(53,54),(509,54),(521,54),(534,54),(538,54),(539,54),(544,54),(546,54),(556,54),(622,54),(623,54),(624,54),(625,54),(626,54),(638,54),(651,54),(680,54),(54,55),(79,55),(55,56),(56,57),(57,58),(58,59),(59,60),(60,61),(61,62),(75,62),(61,63),(62,63),(62,64),(66,64),(69,64),(71,64),(74,64),(232,64),(234,64),(512,64),(513,64),(514,64),(520,64),(608,64),(609,64),(63,65),(509,65),(64,66),(65,67),(66,67),(240,67),(551,67),(641,67),(644,67),(645,67),(664,67),(674,67),(67,68),(131,68),(514,68),(607,68),(609,68),(68,69),(69,69),(70,69),(71,69),(70,70),(71,70),(522,70),(72,71),(73,72),(76,73),(520,73),(77,74),(78,75),(80,76),(590,76),(80,77),(590,77),(80,78),(569,78),(587,78),(590,78),(591,78),(594,78),(595,78),(597,78),(80,79),(590,79),(591,79),(80,80),(590,80),(81,81),(512,81),(513,81),(514,81),(520,81),(526,81),(527,81),(528,81),(532,81),(533,81),(534,81),(537,81),(591,81),(607,81),(608,81),(609,81),(610,81),(611,81),(628,81),(691,81),(82,82),(83,83),(84,84),(85,85),(86,85),(87,86),(88,87),(89,88),(90,89),(109,89),(91,90),(92,91),(93,92),(94,93),(95,94),(96,95),(97,96),(98,97),(99,98),(100,99),(101,100),(102,101),(103,102),(104,103),(105,104),(106,105),(107,106),(108,107),(109,108),(110,109),(111,110),(112,111),(113,112),(114,113),(115,114),(116,115),(117,116),(118,117),(119,118),(120,119),(509,119),(539,119),(121,120),(122,121),(123,122),(124,123),(125,124),(126,125),(127,126),(128,127),(130,128),(131,129),(131,130),(133,130),(131,131),(134,131),(607,131),(609,131),(131,132),(131,133),(131,134),(131,135),(143,135),(131,136),(131,137),(131,138),(150,138),(131,139),(131,140),(151,140),(131,141),(157,141),(131,142),(179,142),(243,142),(131,143),(132,144),(135,145),(136,146),(137,147),(138,148),(139,149),(140,150),(141,151),(142,152),(144,153),(145,154),(146,155),(147,156),(148,157),(149,158),(152,159),(153,160),(154,161),(155,162),(156,163),(158,164),(159,165),(160,166),(161,167),(162,168),(163,169),(165,169),(214,169),(504,169),(517,169),(518,169),(530,169),(531,169),(627,169),(628,169),(638,169),(649,169),(661,169),(662,169),(164,170),(166,171),(167,172),(168,173),(169,174),(170,175),(171,176),(172,177),(173,178),(174,179),(175,180),(176,181),(177,182),(178,183),(180,184),(181,185),(182,186),(183,187),(185,188),(186,189),(187,190),(188,191),(189,192),(190,193),(191,194),(192,195),(193,196),(694,196),(695,196),(696,196),(194,197),(195,198),(196,199),(545,199),(546,199),(547,199),(197,200),(198,201),(199,202),(553,202),(200,203),(201,204),(202,205),(203,206),(204,207),(205,208),(206,209),(207,210),(208,211),(209,212),(210,213),(211,214),(212,215),(213,216),(595,216),(214,217),(520,217),(548,217),(549,217),(550,217),(607,217),(616,217),(215,218),(216,219),(553,219),(217,220),(218,221),(219,222),(220,223),(232,223),(638,223),(644,223),(645,223),(220,224),(221,225),(222,226),(223,227),(224,228),(225,229),(226,230),(226,231),(541,231),(544,231),(551,231),(638,231),(641,231),(644,231),(645,231),(664,231),(674,231),(226,232),(226,233),(226,234),(227,235),(228,236),(229,237),(230,238),(231,239),(233,240),(234,241),(235,242),(236,243),(237,244),(238,245),(239,246),(240,247),(240,248),(240,249),(240,250),(551,250),(240,251),(688,251),(240,252),(509,252),(515,252),(521,252),(607,252),(609,252),(612,252),(687,252),(241,253),(243,253),(570,253),(571,253),(639,253),(640,253),(687,253),(242,254),(242,255),(242,256),(243,256),(242,257),(243,257),(242,258),(243,259),(694,259),(695,259),(696,259),(243,260),(244,261),(245,262),(246,263),(247,264),(248,265),(249,266),(250,267),(251,268),(252,269),(253,270),(254,271),(255,272),(256,273),(257,274),(258,275),(258,276),(259,277),(260,278),(261,279),(262,280),(263,281),(264,282),(265,283),(266,284),(267,285),(268,286),(269,287),(270,288),(271,289),(635,289),(636,289),(272,290),(273,291),(638,291),(643,291),(274,292),(275,293),(276,294),(503,294),(514,294),(277,295),(501,295),(502,295),(512,295),(513,295),(519,295),(526,295),(527,295),(638,295),(646,295),(647,295),(278,296),(279,297),(280,298),(281,299),(282,300),(604,300),(283,301),(501,301),(502,301),(512,301),(513,301),(526,301),(527,301),(638,301),(646,301),(647,301),(284,302),(285,303),(286,304),(519,304),(579,304),(580,304),(607,304),(609,304),(611,304),(613,304),(619,304),(653,304),(287,305),(288,306),(288,307),(289,308),(289,309),(290,310),(290,311),(291,312),(291,313),(292,314),(292,315),(293,316),(293,317),(294,318),(295,319),(295,320),(296,321),(296,322),(297,323),(297,324),(298,325),(298,326),(299,327),(299,328),(300,329),(300,330),(301,331),(301,332),(302,333),(303,334),(303,335),(304,336),(305,337),(306,338),(307,339),(308,340),(309,341),(310,342),(311,343),(312,344),(312,345),(313,346),(313,347),(314,348),(315,349),(316,350),(317,351),(318,352),(319,353),(320,354),(321,355),(322,356),(323,357),(324,358),(325,359),(326,360),(327,361),(328,362),(329,363),(330,364),(331,365),(332,366),(333,367),(334,368),(335,369),(335,370),(336,371),(337,372),(338,373),(339,374),(340,375),(341,376),(342,377),(343,378),(344,379),(345,380),(346,381),(347,382),(348,383),(349,384),(350,385),(351,386),(352,387),(353,388),(354,389),(355,390),(356,391),(357,392),(358,393),(359,394),(360,395),(361,396),(362,397),(363,398),(364,399),(365,400),(366,401),(367,402),(368,403),(369,404),(370,405),(371,406),(372,407),(373,408),(374,409),(375,410),(376,411),(377,412),(378,413),(379,414),(380,415),(381,416),(382,417),(383,418),(384,419),(385,420),(386,421),(387,422),(388,422),(387,423),(387,424),(388,425),(388,426),(388,427),(389,428),(390,429),(391,430),(392,431),(393,432),(393,433),(394,434),(395,435),(396,436),(397,437),(398,438),(399,439),(400,440),(401,441),(402,442),(403,443),(404,444),(405,445),(406,446),(407,447),(408,448),(409,449),(410,450),(411,451),(412,452),(413,453),(414,454),(415,455),(416,456),(417,457),(418,458),(418,459),(423,459),(424,459),(427,459),(428,459),(433,459),(551,459),(554,459),(419,460),(420,461),(421,462),(422,463),(423,463),(659,463),(684,463),(424,464),(551,464),(424,465),(509,465),(521,465),(541,465),(548,465),(549,465),(551,465),(555,465),(557,465),(607,465),(609,465),(424,466),(551,466),(694,466),(695,466),(696,466),(424,467),(424,468),(509,468),(541,468),(551,468),(555,468),(556,468),(557,468),(558,468),(424,469),(425,470),(426,471),(427,472),(428,473),(429,474),(430,475),(431,476),(432,477),(433,478),(434,479),(435,480),(436,481),(437,482),(438,483),(439,484),(440,485),(441,486),(442,487),(443,488),(444,489),(445,490),(446,491),(447,492),(448,493),(449,494),(450,495),(451,496),(452,497),(453,498),(454,499),(455,500),(456,501),(457,502),(458,503),(459,504),(460,505),(461,506),(462,507),(463,508),(464,509),(465,510),(466,511),(467,512),(468,513),(469,514),(470,515),(471,516),(472,517),(473,518),(474,519),(475,520),(476,521),(477,522),(478,523),(479,524),(480,525),(481,526),(482,527),(484,528),(485,529),(486,530),(487,531),(488,532),(489,533),(490,534),(491,535),(492,536),(493,537),(494,538),(495,539),(496,540),(497,541),(498,542),(499,543),(500,544),(545,544),(550,544),(558,544),(501,545),(502,545),(509,545),(512,545),(513,545),(521,545),(501,546),(502,546),(509,546),(512,546),(513,546),(521,546),(501,547),(502,547),(559,547),(560,547),(561,547),(562,547),(568,547),(569,547),(501,548),(502,548),(543,548),(559,548),(560,548),(561,548),(562,548),(567,548),(568,548),(569,548),(687,548),(501,549),(502,549),(509,549),(512,549),(513,549),(521,549),(522,549),(545,549),(548,549),(549,549),(550,549),(551,549),(557,549),(559,549),(560,549),(561,549),(562,549),(573,549),(605,549),(606,549),(615,549),(616,549),(617,549),(621,549),(634,549),(635,549),(636,549),(637,549),(638,549),(642,549),(503,550),(509,550),(514,550),(515,550),(521,550),(523,550),(607,550),(609,550),(503,551),(514,551),(503,552),(514,552),(503,553),(509,553),(514,553),(618,553),(619,553),(503,554),(514,554),(542,554),(597,554),(503,555),(509,555),(514,555),(618,555),(619,555),(503,556),(514,556),(528,556),(648,556),(503,557),(505,557),(514,557),(522,557),(553,557),(503,558),(514,558),(503,559),(509,559),(510,559),(538,559),(613,559),(503,560),(514,560),(503,561),(514,561),(578,561),(580,561),(582,561),(676,561),(678,561),(690,561),(505,562),(641,562),(685,562),(505,563),(574,563),(576,563),(577,563),(578,563),(579,563),(580,563),(581,563),(582,563),(674,563),(677,563),(678,563),(687,563),(505,564),(687,564),(505,565),(551,565),(574,565),(576,565),(577,565),(578,565),(579,565),(580,565),(581,565),(582,565),(599,565),(602,565),(603,565),(616,565),(621,565),(638,565),(674,565),(677,565),(678,565),(687,565),(694,565),(695,565),(696,565),(505,566),(521,566),(638,566),(505,567),(566,567),(505,568),(505,569),(570,569),(571,569),(572,569),(574,569),(639,569),(640,569),(665,569),(690,569),(505,570),(521,570),(522,570),(505,571),(505,572),(612,572),(505,573),(559,573),(560,573),(561,573),(562,573),(563,573),(564,573),(565,573),(569,573),(505,574),(506,575),(516,575),(523,575),(551,575),(618,575),(619,575),(620,575),(621,575),(506,576),(516,576),(523,576),(507,577),(517,577),(518,577),(530,577),(531,577),(638,577),(650,577),(669,577),(670,577),(508,578),(519,578),(508,579),(519,579),(532,579),(509,580),(509,581),(509,582),(622,582),(694,582),(695,582),(696,582),(509,583),(510,583),(521,583),(523,583),(509,584),(509,585),(521,585),(509,586),(574,586),(575,586),(576,586),(509,587),(521,587),(623,587),(509,588),(521,588),(624,588),(509,589),(509,590),(521,590),(548,590),(638,590),(644,590),(645,590),(509,591),(521,591),(509,592),(521,592),(688,592),(694,592),(695,592),(696,592),(509,593),(521,593),(509,594),(519,594),(521,594),(548,594),(509,595),(521,595),(509,596),(521,596),(509,597),(607,597),(509,598),(510,598),(526,598),(527,598),(528,598),(529,598),(530,598),(531,598),(532,598),(533,598),(534,598),(535,598),(536,598),(537,598),(585,598),(586,598),(610,598),(611,598),(620,598),(628,598),(509,599),(510,599),(521,599),(523,599),(535,599),(638,599),(657,599),(687,599),(509,600),(509,601),(521,601),(543,601),(509,602),(519,602),(521,602),(522,602),(509,603),(515,603),(521,603),(509,604),(544,604),(548,604),(509,605),(521,605),(509,606),(515,606),(521,606),(509,607),(638,607),(664,607),(509,608),(521,608),(509,609),(551,609),(566,609),(567,609),(607,609),(609,609),(687,609),(509,610),(521,610),(509,611),(521,611),(509,612),(509,613),(625,613),(509,614),(521,614),(509,615),(515,615),(521,615),(509,616),(521,616),(541,616),(545,616),(548,616),(550,616),(551,616),(553,616),(686,616),(689,616),(509,617),(509,618),(519,618),(579,618),(580,618),(607,618),(609,618),(616,618),(509,619),(509,620),(509,621),(509,622),(509,623),(626,623),(509,624),(521,624),(509,625),(515,625),(520,625),(533,625),(509,626),(521,626),(509,627),(521,627),(509,628),(521,628),(509,629),(510,629),(523,629),(535,629),(509,630),(619,630),(509,631),(554,631),(555,631),(509,632),(509,633),(623,633),(509,634),(515,634),(521,634),(510,635),(523,635),(510,636),(523,636),(510,637),(563,637),(564,637),(565,637),(570,637),(571,637),(574,637),(576,637),(616,637),(510,638),(523,638),(535,638),(603,638),(510,639),(523,639),(511,640),(525,640),(537,640),(512,641),(513,641),(514,641),(520,641),(526,641),(527,641),(528,641),(532,641),(533,641),(534,641),(537,641),(607,641),(608,641),(609,641),(610,641),(611,641),(628,641),(691,641),(514,642),(514,643),(514,644),(514,645),(515,646),(519,647),(519,648),(519,649),(519,650),(519,651),(520,652),(520,653),(520,654),(520,655),(520,656),(533,656),(520,657),(533,657),(619,657),(521,658),(522,658),(521,659),(521,660),(522,660),(534,660),(537,660),(521,661),(521,662),(521,663),(548,663),(521,664),(522,664),(541,664),(521,665),(521,666),(521,667),(638,667),(644,667),(645,667),(671,667),(681,667),(521,668),(521,669),(521,670),(521,671),(521,672),(521,673),(521,674),(521,675),(521,676),(522,676),(612,676),(521,677),(521,678),(522,679),(534,679),(537,679),(522,680),(545,680),(551,680),(557,680),(523,681),(523,682),(523,683),(523,684),(523,685),(553,685),(698,685),(524,686),(536,686),(638,686),(534,687),(540,688),(541,689),(543,689),(551,689),(555,689),(556,689),(557,689),(558,689),(641,689),(674,689),(541,690),(545,690),(548,690),(549,690),(550,690),(557,690),(567,690),(541,691),(623,691),(626,691),(541,692),(553,692),(584,692),(663,692),(541,693),(543,693),(557,693),(644,693),(645,693),(664,693),(543,694),(598,694),(543,695),(603,695),(543,696),(543,697),(543,698),(601,698),(638,698),(666,698),(543,699),(545,700),(547,700),(550,700),(545,701),(545,702),(551,702),(545,703),(548,703),(549,703),(551,703),(553,703),(557,703),(689,703),(545,704),(550,704),(551,704),(555,704),(689,704),(545,705),(558,705),(545,706),(546,706),(550,706),(551,706),(555,706),(694,706),(695,706),(696,706),(548,707),(549,707),(548,708),(548,709),(548,710),(638,710),(644,710),(645,710),(548,711),(549,711),(548,712),(549,712),(548,713),(689,713),(548,714),(549,714),(567,714),(622,714),(625,714),(626,714),(687,714),(548,715),(548,716),(548,717),(549,718),(607,718),(609,718),(549,719),(551,720),(554,720),(577,720),(578,720),(607,720),(612,720),(614,720),(615,720),(617,720),(686,720),(689,720),(551,721),(553,721),(567,721),(607,721),(609,721),(612,721),(551,722),(551,723),(551,724),(551,725),(553,725),(551,726),(551,727),(551,728),(551,729),(551,730),(551,731),(551,732),(551,733),(551,734),(551,735),(553,735),(552,736),(553,737),(553,738),(618,738),(620,738),(553,739),(553,740),(553,741),(559,742),(560,742),(561,742),(562,742),(559,743),(560,743),(561,743),(562,743),(569,743),(587,743),(559,744),(560,744),(561,744),(562,744),(559,745),(560,745),(561,745),(562,745),(569,745),(559,746),(560,746),(561,746),(562,746),(569,746),(559,747),(560,747),(561,747),(562,747),(563,747),(564,747),(565,747),(569,747),(559,748),(560,748),(561,748),(562,748),(569,748),(559,749),(560,749),(561,749),(562,749),(569,749),(579,749),(580,749),(559,750),(560,750),(561,750),(562,750),(568,750),(559,751),(560,751),(561,751),(562,751),(559,752),(560,752),(561,752),(562,752),(567,752),(568,752),(569,752),(563,753),(564,753),(565,753),(566,754),(566,755),(567,755),(607,755),(609,755),(567,756),(638,756),(666,756),(681,756),(687,756),(568,757),(568,758),(634,758),(679,758),(683,758),(568,759),(568,760),(568,761),(568,762),(568,763),(634,763),(679,763),(683,763),(568,764),(569,765),(583,765),(585,765),(586,765),(569,766),(569,767),(570,768),(571,768),(570,769),(571,769),(638,769),(639,769),(640,769),(687,769),(570,770),(571,770),(572,771),(577,771),(578,771),(690,771),(691,771),(573,772),(574,773),(576,773),(574,774),(576,774),(574,775),(574,776),(574,777),(574,778),(574,779),(574,780),(574,781),(574,782),(574,783),(574,784),(574,785),(574,786),(574,787),(574,788),(574,789),(574,790),(574,791),(574,792),(574,793),(574,794),(574,795),(574,796),(574,797),(574,798),(576,798),(574,799),(576,799),(574,800),(576,800),(574,801),(576,801),(575,802),(575,803),(575,804),(575,805),(575,806),(575,807),(575,808),(575,809),(575,810),(576,810),(612,810),(576,811),(576,812),(576,813),(576,814),(576,815),(576,816),(576,817),(576,818),(576,819),(576,820),(576,821),(576,822),(576,823),(576,824),(576,825),(576,826),(576,827),(576,828),(576,829),(576,830),(576,831),(576,832),(576,833),(576,834),(577,835),(579,835),(581,835),(677,835),(690,835),(579,836),(580,836),(579,837),(580,837),(581,837),(582,837),(579,838),(580,838),(579,839),(580,839),(579,840),(580,840),(579,841),(580,841),(579,842),(580,842),(581,842),(582,842),(581,843),(582,843),(584,844),(612,844),(585,845),(586,845),(589,846),(599,846),(602,846),(603,846),(591,847),(592,848),(593,849),(594,850),(595,851),(596,852),(597,853),(599,854),(600,855),(602,856),(603,857),(603,858),(604,859),(605,859),(606,859),(604,860),(605,860),(606,860),(604,861),(605,861),(606,861),(604,862),(605,862),(606,862),(604,863),(605,863),(606,863),(604,864),(605,864),(606,864),(604,865),(605,865),(606,865),(604,866),(604,867),(604,868),(605,868),(606,868),(604,869),(605,869),(606,869),(604,870),(604,871),(604,872),(605,872),(606,872),(604,873),(605,873),(606,873),(604,874),(605,874),(606,874),(605,875),(605,876),(606,876),(606,877),(607,878),(609,878),(607,879),(609,879),(607,880),(609,880),(607,881),(609,881),(616,881),(607,882),(609,882),(607,883),(609,883),(607,884),(609,884),(607,885),(609,885),(607,886),(609,886),(607,887),(609,887),(607,888),(609,888),(607,889),(609,889),(607,890),(609,890),(607,891),(612,891),(615,891),(617,891),(607,892),(607,893),(609,893),(607,894),(609,894),(607,895),(609,895),(616,895),(607,896),(609,896),(607,897),(616,897),(607,898),(609,898),(607,899),(608,899),(609,899),(610,899),(612,899),(615,899),(617,899),(607,900),(609,900),(607,901),(609,901),(607,902),(609,902),(607,903),(609,903),(612,904),(612,905),(612,906),(612,907),(614,907),(612,908),(614,908),(612,909),(614,909),(668,909),(687,909),(612,910),(612,911),(693,911),(612,912),(612,913),(614,914),(614,915),(617,916),(618,917),(619,917),(620,917),(621,917),(618,918),(619,918),(618,919),(619,919),(622,920),(625,920),(626,920),(687,920),(623,921),(623,922),(626,923),(644,923),(645,923),(664,923),(681,923),(626,924),(627,925),(627,926),(627,927),(627,928),(629,929),(631,929),(629,930),(630,930),(630,931),(632,931),(638,931),(631,932),(632,932),(633,933),(634,934),(691,934),(634,935),(634,936),(637,937),(638,938),(655,938),(656,938),(638,939),(658,939),(638,940),(659,940),(638,941),(663,941),(638,942),(676,942),(687,942),(638,943),(638,944),(657,944),(638,945),(671,945),(638,946),(655,946),(656,946),(638,947),(639,947),(640,947),(641,947),(642,947),(643,947),(644,947),(645,947),(646,947),(647,947),(648,947),(649,947),(650,947),(651,947),(653,947),(655,947),(656,947),(657,947),(658,947),(659,947),(660,947),(661,947),(662,947),(663,947),(664,947),(665,947),(666,947),(667,947),(668,947),(669,947),(670,947),(671,947),(672,947),(673,947),(674,947),(675,947),(676,947),(677,947),(678,947),(679,947),(680,947),(681,947),(682,947),(683,947),(684,947),(638,948),(657,948),(662,948),(665,948),(670,948),(677,948),(678,948),(679,948),(680,948),(687,948),(638,949),(682,949),(638,950),(683,950),(638,951),(684,951),(641,952),(660,952),(674,952),(658,953),(661,954),(669,954),(667,955),(672,956),(673,957),(674,958),(675,959),(686,960),(689,960),(687,961),(687,962),(687,963),(687,964),(687,965),(687,966),(687,967),(688,968),(689,969),(692,970),(694,971),(695,971),(696,971),(694,972),(695,972),(696,972),(694,973),(695,973),(696,973),(694,974),(695,974),(696,974);
/*!40000 ALTER TABLE `help_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_topic`
--

DROP TABLE IF EXISTS `help_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `help_topic` (
  `help_topic_id` int unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `help_category_id` smallint unsigned NOT NULL,
  `description` text NOT NULL,
  `example` text NOT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`help_topic_id`),
  UNIQUE KEY `name` (`name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='help topics';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_topic`
--

LOCK TABLES `help_topic` WRITE;
/*!40000 ALTER TABLE `help_topic` DISABLE KEYS */;
INSERT INTO `help_topic` VALUES (651,'SHOW CREATE TABLE',3,'Syntax:\nSHOW CREATE TABLE tbl_name\n\nShows the CREATE TABLE statement that creates the named table. To use\nthis statement, you must have some privilege for the table. This\nstatement also works with views.\n\nAs of MySQL 8.0.16, MySQL implements CHECK constraints and SHOW CREATE\nTABLE displays them. All CHECK constraints are displayed as table\nconstraints. That is, a CHECK constraint originally specified as part\nof a column definition displays as a separate clause not part of the\ncolumn definition. Example:\n\nmysql> CREATE TABLE t1 (\n         i1 INT CHECK (i1 <> 0),      -- column constraint\n         i2 INT,\n         CHECK (i2 > i1),             -- table constraint\n         CHECK (i2 <> 0) NOT ENFORCED -- table constraint, not enforced\n       );\n\nmysql> SHOW CREATE TABLE t1\\G\n*************************** 1. row ***************************\n       Table: t1\nCreate Table: CREATE TABLE `t1` (\n  `i1` int(11) DEFAULT NULL,\n  `i2` int(11) DEFAULT NULL,\n  CONSTRAINT `t1_chk_1` CHECK ((`i1` <> 0)),\n  CONSTRAINT `t1_chk_2` CHECK ((`i2` > `i1`)),\n  CONSTRAINT `t1_chk_3` CHECK ((`i2` <> 0)) /*!80016 NOT ENFORCED */\n) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci\n\nSHOW CREATE TABLE quotes table and column names according to the value\nof the sql_quote_show_create option. See\nhttps://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html.\n\nWhen altering the storage engine of a table, table options that are not\napplicable to the new storage engine are retained in the table\ndefinition to enable reverting the table with its previously defined\noptions to the original storage engine, if necessary. For example, when\nchanging the storage engine from InnoDB to MyISAM, InnoDB-specific\noptions such as ROW_FORMAT=COMPACT are retained.\n\nmysql> CREATE TABLE t1 (c1 INT PRIMARY KEY) ROW_FORMAT=COMPACT ENGINE=InnoDB;\nmysql> ALTER TABLE t1 ENGINE=MyISAM;\nmysql> SHOW CREATE TABLE t1\\G\n*************************** 1. row ***************************\n       Table: t1\nCreate Table: CREATE TABLE `t1` (\n  `c1` int NOT NULL,\n  PRIMARY KEY (`c1`)\n) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT\n\nWhen creating a table with strict mode disabled, the storage engine\'s\ndefault row format is used if the specified row format is not\nsupported. The actual row format of the table is reported in the\nRow_format column in response to SHOW TABLE STATUS. SHOW CREATE TABLE\nshows the row format that was specified in the CREATE TABLE statement.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-create-table.html\n\n','mysql> SHOW CREATE TABLE t\\G\n*************************** 1. row ***************************\n       Table: t\nCreate Table: CREATE TABLE `t` (\n  `id` int(11) NOT NULL AUTO_INCREMENT,\n  `s` char(60) DEFAULT NULL,\n  PRIMARY KEY (`id`)\n) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4\n','https://dev.mysql.com/doc/refman/8.0/en/show-create-table.html'),(652,'SHOW CREATE TRIGGER',3,'Syntax:\nSHOW CREATE TRIGGER trigger_name\n\nThis statement shows the CREATE TRIGGER statement that creates the\nnamed trigger. This statement requires the TRIGGER privilege for the\ntable associated with the trigger.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-create-trigger.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-create-trigger.html'),(653,'SHOW CREATE USER',3,'Syntax:\nSHOW CREATE USER user\n\nThis statement shows the CREATE USER statement that creates the named\nuser. An error occurs if the user does not exist. The statement\nrequires the SELECT privilege for the mysql system schema, except to\nsee information for the current user. For the current user, the SELECT\nprivilege for the mysql.user system table is required for display of\nthe password hash in the IDENTIFIED AS clause; otherwise, the hash\ndisplays as <secret>.\n\nTo name the account, use the format described in\nhttps://dev.mysql.com/doc/refman/8.0/en/account-names.html. The host\nname part of the account name, if omitted, defaults to \'%\'. It is also\npossible to specify CURRENT_USER or CURRENT_USER() to refer to the\naccount associated with the current session.\n\nPassword hash values displayed in the IDENTIFIED WITH clause of output\nfrom SHOW CREATE USER may contain unprintable characters that have\nadverse effects on terminal displays and in other environments.\nEnabling the print_identified_with_as_hex system variable (available as\nof MySQL 8.0.17) causes SHOW CREATE USER to display such hash values as\nhexadecimal strings rather than as regular string literals. Hash values\nthat do not contain unprintable characters still display as regular\nstring literals, even with this variable enabled.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-create-user.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-create-user.html'),(654,'SHOW CREATE VIEW',3,'Syntax:\nSHOW CREATE VIEW view_name\n\nThis statement shows the CREATE VIEW statement that creates the named\nview.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-create-view.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-create-view.html'),(655,'SHOW DATABASES',3,'Syntax:\nSHOW {DATABASES | SCHEMAS}\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW DATABASES lists the databases on the MySQL server host. SHOW\nSCHEMAS is a synonym for SHOW DATABASES. The LIKE clause, if present,\nindicates which database names to match. The WHERE clause can be given\nto select rows using more general conditions, as discussed in\nhttps://dev.mysql.com/doc/refman/8.0/en/extended-show.html.\n\nYou see only those databases for which you have some kind of privilege,\nunless you have the global SHOW DATABASES privilege. You can also get\nthis list using the mysqlshow command.\n\nIf the server was started with the --skip-show-database option, you\ncannot use this statement at all unless you have the SHOW DATABASES\nprivilege.\n\nMySQL implements databases as directories in the data directory, so\nthis statement simply lists directories in that location. However, the\noutput may include names of directories that do not correspond to\nactual databases.\n\nDatabase information is also available from the INFORMATION_SCHEMA\nSCHEMATA table. See\nhttps://dev.mysql.com/doc/refman/8.0/en/information-schema-schemata-tab\nle.html.\n\n*Caution*:\n\nBecause any static global privilege is considered a privilege for all\ndatabases, any static global privilege enables a user to see all\ndatabase names with SHOW DATABASES or by examining the SCHEMATA table\nof INFORMATION_SCHEMA, except databases that have been restricted at\nthe database level by partial revokes.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-databases.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-databases.html'),(656,'SHOW SCHEMAS',3,'Syntax:\nSHOW {DATABASES | SCHEMAS}\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW DATABASES lists the databases on the MySQL server host. SHOW\nSCHEMAS is a synonym for SHOW DATABASES. The LIKE clause, if present,\nindicates which database names to match. The WHERE clause can be given\nto select rows using more general conditions, as discussed in\nhttps://dev.mysql.com/doc/refman/8.0/en/extended-show.html.\n\nYou see only those databases for which you have some kind of privilege,\nunless you have the global SHOW DATABASES privilege. You can also get\nthis list using the mysqlshow command.\n\nIf the server was started with the --skip-show-database option, you\ncannot use this statement at all unless you have the SHOW DATABASES\nprivilege.\n\nMySQL implements databases as directories in the data directory, so\nthis statement simply lists directories in that location. However, the\noutput may include names of directories that do not correspond to\nactual databases.\n\nDatabase information is also available from the INFORMATION_SCHEMA\nSCHEMATA table. See\nhttps://dev.mysql.com/doc/refman/8.0/en/information-schema-schemata-tab\nle.html.\n\n*Caution*:\n\nBecause any static global privilege is considered a privilege for all\ndatabases, any static global privilege enables a user to see all\ndatabase names with SHOW DATABASES or by examining the SCHEMATA table\nof INFORMATION_SCHEMA, except databases that have been restricted at\nthe database level by partial revokes.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-databases.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-databases.html'),(657,'SHOW ENGINE',3,'Syntax:\nSHOW ENGINE engine_name {STATUS | MUTEX}\n\nSHOW ENGINE displays operational information about a storage engine. It\nrequires the PROCESS privilege. The statement has these variants:\n\nSHOW ENGINE INNODB STATUS\nSHOW ENGINE INNODB MUTEX\nSHOW ENGINE PERFORMANCE_SCHEMA STATUS\n\nSHOW ENGINE INNODB STATUS displays extensive information from the\nstandard InnoDB Monitor about the state of the InnoDB storage engine.\nFor information about the standard monitor and other InnoDB Monitors\nthat provide information about InnoDB processing, see\nhttps://dev.mysql.com/doc/refman/8.0/en/innodb-monitors.html.\n\nSHOW ENGINE INNODB MUTEX displays InnoDB mutex and rw-lock statistics.\n\n*Note*:\n\nInnoDB mutexes and rwlocks can also be monitored using Performance\nSchema tables. See\nhttps://dev.mysql.com/doc/refman/8.0/en/monitor-innodb-mutex-waits-perf\normance-schema.html.\n\nMutex statistics collection is configured dynamically using the\nfollowing options:\n\no To enable the collection of mutex statistics, run:\n\nSET GLOBAL innodb_monitor_enable=\'latch\';\n\no To reset mutex statistics, run:\n\nSET GLOBAL innodb_monitor_reset=\'latch\';\n\no To disable the collection of mutex statistics, run:\n\nSET GLOBAL innodb_monitor_disable=\'latch\';\n\nCollection of mutex statistics for SHOW ENGINE INNODB MUTEX can also be\nenabled by setting innodb_monitor_enable=\'all\', or disabled by setting\ninnodb_monitor_disable=\'all\'.\n\nSHOW ENGINE INNODB MUTEX output has these columns:\n\no Type\n\n  Always InnoDB.\n\no Name\n\n  For mutexes, the Name field reports only the mutex name. For rwlocks,\n  the Name field reports the source file where the rwlock is\n  implemented, and the line number in the file where the rwlock is\n  created. The line number is specific to your version of MySQL.\n\no Status\n\n  The mutex status. This field reports the number of spins, waits, and\n  calls. Statistics for low-level operating system mutexes, which are\n  implemented outside of InnoDB, are not reported.\n\n  o spins indicates the number of spins.\n\n  o waits indicates the number of mutex waits.\n\n  o calls indicates how many times the mutex was requested.\n\nSHOW ENGINE INNODB MUTEX does not list mutexes and rw-locks for each\nbuffer pool block, as the amount of output would be overwhelming on\nsystems with a large buffer pool. SHOW ENGINE INNODB MUTEX does,\nhowever, print aggregate BUF_BLOCK_MUTEX spin, wait, and call values\nfor buffer pool block mutexes and rw-locks. SHOW ENGINE INNODB MUTEX\nalso does not list any mutexes or rw-locks that have never been waited\non (os_waits=0). Thus, SHOW ENGINE INNODB MUTEX only displays\ninformation about mutexes and rw-locks outside of the buffer pool that\nhave caused at least one OS-level wait.\n\nUse SHOW ENGINE PERFORMANCE_SCHEMA STATUS to inspect the internal\noperation of the Performance Schema code:\n\nmysql> SHOW ENGINE PERFORMANCE_SCHEMA STATUS\\G\n...\n*************************** 3. row ***************************\n  Type: performance_schema\n  Name: events_waits_history.size\nStatus: 76\n*************************** 4. row ***************************\n  Type: performance_schema\n  Name: events_waits_history.count\nStatus: 10000\n*************************** 5. row ***************************\n  Type: performance_schema\n  Name: events_waits_history.memory\nStatus: 760000\n...\n*************************** 57. row ***************************\n  Type: performance_schema\n  Name: performance_schema.memory\nStatus: 26459600\n...\n\nThis statement is intended to help the DBA understand the effects that\ndifferent Performance Schema options have on memory requirements.\n\nName values consist of two parts, which name an internal buffer and a\nbuffer attribute, respectively. Interpret buffer names as follows:\n\no An internal buffer that is not exposed as a table is named within\n  parentheses. Examples: (pfs_cond_class).size,\n  (pfs_mutex_class).memory.\n\no An internal buffer that is exposed as a table in the\n  performance_schema database is named after the table, without\n  parentheses. Examples: events_waits_history.size,\n  mutex_instances.count.\n\no A value that applies to the Performance Schema as a whole begins with\n  performance_schema. Example: performance_schema.memory.\n\nBuffer attributes have these meanings:\n\no size is the size of the internal record used by the implementation,\n  such as the size of a row in a table. size values cannot be changed.\n\no count is the number of internal records, such as the number of rows\n  in a table. count values can be changed using Performance Schema\n  configuration options.\n\no For a table, tbl_name.memory is the product of size and count. For\n  the Performance Schema as a whole, performance_schema.memory is the\n  sum of all the memory used (the sum of all other memory values).\n\nIn some cases, there is a direct relationship between a Performance\nSchema configuration parameter and a SHOW ENGINE value. For example,\nevents_waits_history_long.count corresponds to\nperformance_schema_events_waits_history_long_size. In other cases, the\nrelationship is more complex. For example, events_waits_history.count\ncorresponds to performance_schema_events_waits_history_size (the number\nof rows per thread) multiplied by\nperformance_schema_max_thread_instances ( the number of threads).\n\nSHOW ENGINE NDB STATUS If the server has the NDB storage engine\nenabled, SHOW ENGINE NDB STATUS displays cluster status information\nsuch as the number of connected data nodes, the cluster connectstring,\nand cluster binary log epochs, as well as counts of various Cluster API\nobjects created by the MySQL Server when connected to the cluster.\nSample output from this statement is shown here:\n\nmysql> SHOW ENGINE NDB STATUS;\n+------------+-----------------------+--------------------------------------------------+\n| Type       | Name                  | Status                                           |\n+------------+-----------------------+--------------------------------------------------+\n| ndbcluster | connection            | cluster_node_id=7,\n  connected_host=198.51.100.103, connected_port=1186, number_of_data_nodes=4,\n  number_of_ready_data_nodes=3, connect_count=0                                         |\n| ndbcluster | NdbTransaction        | created=6, free=0, sizeof=212                    |\n| ndbcluster | NdbOperation          | created=8, free=8, sizeof=660                    |\n| ndbcluster | NdbIndexScanOperation | created=1, free=1, sizeof=744                    |\n| ndbcluster | NdbIndexOperation     | created=0, free=0, sizeof=664                    |\n| ndbcluster | NdbRecAttr            | created=1285, free=1285, sizeof=60               |\n| ndbcluster | NdbApiSignal          | created=16, free=16, sizeof=136                  |\n| ndbcluster | NdbLabel              | created=0, free=0, sizeof=196                    |\n| ndbcluster | NdbBranch             | created=0, free=0, sizeof=24                     |\n| ndbcluster | NdbSubroutine         | created=0, free=0, sizeof=68                     |\n| ndbcluster | NdbCall               | created=0, free=0, sizeof=16                     |\n| ndbcluster | NdbBlob               | created=1, free=1, sizeof=264                    |\n| ndbcluster | NdbReceiver           | created=4, free=0, sizeof=68                     |\n| ndbcluster | binlog                | latest_epoch=155467, latest_trans_epoch=148126,\n  latest_received_binlog_epoch=0, latest_handled_binlog_epoch=0,\n  latest_applied_binlog_epoch=0                                                         |\n+------------+-----------------------+--------------------------------------------------+\n\nThe Status column in each of these rows provides information about the\nMySQL server\'s connection to the cluster and about the cluster binary\nlog\'s status, respectively. The Status information is in the form of\ncomma-delimited set of name/value pairs.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-engine.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-engine.html'),(658,'SHOW ENGINES',3,'Syntax:\nSHOW [STORAGE] ENGINES\n\nSHOW ENGINES displays status information about the server\'s storage\nengines. This is particularly useful for checking whether a storage\nengine is supported, or to see what the default engine is.\n\nFor information about MySQL storage engines, see\nhttps://dev.mysql.com/doc/refman/8.0/en/innodb-storage-engine.html, and\nhttps://dev.mysql.com/doc/refman/8.0/en/storage-engines.html.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-engines.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-engines.html'),(659,'SHOW ERRORS',3,'Syntax:\nSHOW ERRORS [LIMIT [offset,] row_count]\nSHOW COUNT(*) ERRORS\n\nSHOW ERRORS is a diagnostic statement that is similar to SHOW WARNINGS,\nexcept that it displays information only for errors, rather than for\nerrors, warnings, and notes.\n\nThe LIMIT clause has the same syntax as for the SELECT statement. See\nhttps://dev.mysql.com/doc/refman/8.0/en/select.html.\n\nThe SHOW COUNT(*) ERRORS statement displays the number of errors. You\ncan also retrieve this number from the error_count variable:\n\nSHOW COUNT(*) ERRORS;\nSELECT @@error_count;\n\nSHOW ERRORS and error_count apply only to errors, not warnings or\nnotes. In other respects, they are similar to SHOW WARNINGS and\nwarning_count. In particular, SHOW ERRORS cannot display information\nfor more than max_error_count messages, and error_count can exceed the\nvalue of max_error_count if the number of errors exceeds\nmax_error_count.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-errors.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-errors.html'),(660,'SHOW EVENTS',3,'Syntax:\nSHOW EVENTS\n    [{FROM | IN} schema_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nThis statement displays information about Event Manager events, which\nare discussed in\nhttps://dev.mysql.com/doc/refman/8.0/en/event-scheduler.html. It\nrequires the EVENT privilege for the database from which the events are\nto be shown.\n\nIn its simplest form, SHOW EVENTS lists all of the events in the\ncurrent schema:\n\nmysql> SELECT CURRENT_USER(), SCHEMA();\n+----------------+----------+\n| CURRENT_USER() | SCHEMA() |\n+----------------+----------+\n| jon@ghidora    | myschema |\n+----------------+----------+\n1 row in set (0.00 sec)\n\nmysql> SHOW EVENTS\\G\n*************************** 1. row ***************************\n                  Db: myschema\n                Name: e_daily\n             Definer: jon@ghidora\n           Time zone: SYSTEM\n                Type: RECURRING\n          Execute at: NULL\n      Interval value: 1\n      Interval field: DAY\n              Starts: 2018-08-08 11:06:34\n                Ends: NULL\n              Status: ENABLED\n          Originator: 1\ncharacter_set_client: utf8mb4\ncollation_connection: utf8mb4_0900_ai_ci\n  Database Collation: utf8mb4_0900_ai_ci\n\nTo see events for a specific schema, use the FROM clause. For example,\nto see events for the test schema, use the following statement:\n\nSHOW EVENTS FROM test;\n\nThe LIKE clause, if present, indicates which event names to match. The\nWHERE clause can be given to select rows using more general conditions,\nas discussed in\nhttps://dev.mysql.com/doc/refman/8.0/en/extended-show.html.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-events.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-events.html'),(661,'SHOW FUNCTION CODE',3,'Syntax:\nSHOW FUNCTION CODE func_name\n\nThis statement is similar to SHOW PROCEDURE CODE but for stored\nfunctions. See [HELP SHOW PROCEDURE CODE].\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-function-code.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-function-code.html'),(662,'SHOW FUNCTION STATUS',3,'Syntax:\nSHOW FUNCTION STATUS\n    [LIKE \'pattern\' | WHERE expr]\n\nThis statement is similar to SHOW PROCEDURE STATUS but for stored\nfunctions. See [HELP SHOW PROCEDURE STATUS].\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-function-status.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-function-status.html'),(663,'SHOW GRANTS',3,'Syntax:\nSHOW GRANTS\n    [FOR user_or_role\n        [USING role [, role] ...]]\n\nuser_or_role: {\n    user (see )\n  | role (see .\n}\n\nThis statement displays the privileges and roles that are assigned to a\nMySQL user account or role, in the form of GRANT statements that must\nbe executed to duplicate the privilege and role assignments.\n\n*Note*:\n\nTo display nonprivilege information for MySQL accounts, use the SHOW\nCREATE USER statement. See [HELP SHOW CREATE USER].\n\nSHOW GRANTS requires the SELECT privilege for the mysql system schema,\nexcept to display privileges and roles for the current user.\n\nTo name the account or role for SHOW GRANTS, use the same format as for\nthe GRANT statement (for example, \'jeffrey\'@\'localhost\'):\n\nmysql> SHOW GRANTS FOR \'jeffrey\'@\'localhost\';\n+------------------------------------------------------------------+\n| Grants for jeffrey@localhost                                     |\n+------------------------------------------------------------------+\n| GRANT USAGE ON *.* TO `jeffrey`@`localhost`                      |\n| GRANT SELECT, INSERT, UPDATE ON `db1`.* TO `jeffrey`@`localhost` |\n+------------------------------------------------------------------+\n\nThe host part, if omitted, defaults to \'%\'. For additional information\nabout specifying account and role names, see\nhttps://dev.mysql.com/doc/refman/8.0/en/account-names.html, and\nhttps://dev.mysql.com/doc/refman/8.0/en/role-names.html.\n\nTo display the privileges granted to the current user (the account you\nare using to connect to the server), you can use any of the following\nstatements:\n\nSHOW GRANTS;\nSHOW GRANTS FOR CURRENT_USER;\nSHOW GRANTS FOR CURRENT_USER();\n\nIf SHOW GRANTS FOR CURRENT_USER (or any equivalent syntax) is used in\ndefiner context, such as within a stored procedure that executes with\ndefiner rather than invoker privileges, the grants displayed are those\nof the definer and not the invoker.\n\nIn MySQL 8.0 compared to previous series, SHOW GRANTS no longer\ndisplays ALL PRIVILEGES in its global-privileges output because the\nmeaning of ALL PRIVILEGES at the global level varies depending on which\ndynamic privileges are defined. Instead, SHOW GRANTS explictly lists\neach granted global privilege:\n\nmysql> SHOW GRANTS FOR \'root\'@\'localhost\';\n+---------------------------------------------------------------------+\n| Grants for root@localhost                                           |\n+---------------------------------------------------------------------+\n| GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, RELOAD,         |\n| SHUTDOWN, PROCESS, FILE, REFERENCES, INDEX, ALTER, SHOW DATABASES,  |\n| SUPER, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, REPLICATION   |\n| SLAVE, REPLICATION CLIENT, CREATE VIEW, SHOW VIEW, CREATE ROUTINE,  |\n| ALTER ROUTINE, CREATE USER, EVENT, TRIGGER, CREATE TABLESPACE,      |\n| CREATE ROLE, DROP ROLE ON *.* TO `root`@`localhost` WITH GRANT      |\n| OPTION                                                              |\n| GRANT PROXY ON \'\'@\'\' TO \'root\'@\'localhost\' WITH GRANT OPTION        |\n+---------------------------------------------------------------------+\n\nApplications that process SHOW GRANTS output should be adjusted\naccordingly.\n\nAt the global level, GRANT OPTION applies to all granted static global\nprivileges if granted for any of them, but applies individually to\ngranted dynamic privileges. SHOW GRANTS displays global privileges this\nway:\n\no One line listing all granted static privileges, if there are any,\n  including WITH GRANT OPTION if appropriate.\n\no One line listing all granted dynamic privileges for which GRANT\n  OPTION is granted, if there are any, including WITH GRANT OPTION.\n\no One line listing all granted dynamic privileges for which GRANT\n  OPTION is not granted, if there are any, without WITH GRANT OPTION.\n\nWith the optional USING clause, SHOW GRANTS enables you to examine the\nprivileges associated with roles for the user. Each role named in the\nUSING clause must be granted to the user.\n\nSuppose that user u1 is assigned roles r1 and r2, as follows:\n\nCREATE ROLE \'r1\', \'r2\';\nGRANT SELECT ON db1.* TO \'r1\';\nGRANT INSERT, UPDATE, DELETE ON db1.* TO \'r2\';\nCREATE USER \'u1\'@\'localhost\' IDENTIFIED BY \'u1pass\';\nGRANT \'r1\', \'r2\' TO \'u1\'@\'localhost\';\n\nSHOW GRANTS without USING shows the granted roles:\n\nmysql> SHOW GRANTS FOR \'u1\'@\'localhost\';\n+---------------------------------------------+\n| Grants for u1@localhost                     |\n+---------------------------------------------+\n| GRANT USAGE ON *.* TO `u1`@`localhost`      |\n| GRANT `r1`@`%`,`r2`@`%` TO `u1`@`localhost` |\n+---------------------------------------------+\n\nAdding a USING clause causes the statement to also display the\nprivileges associated with each role named in the clause:\n\nmysql> SHOW GRANTS FOR \'u1\'@\'localhost\' USING \'r1\';\n+---------------------------------------------+\n| Grants for u1@localhost                     |\n+---------------------------------------------+\n| GRANT USAGE ON *.* TO `u1`@`localhost`      |\n| GRANT SELECT ON `db1`.* TO `u1`@`localhost` |\n| GRANT `r1`@`%`,`r2`@`%` TO `u1`@`localhost` |\n+---------------------------------------------+\nmysql> SHOW GRANTS FOR \'u1\'@\'localhost\' USING \'r2\';\n+-------------------------------------------------------------+\n| Grants for u1@localhost                                     |\n+-------------------------------------------------------------+\n| GRANT USAGE ON *.* TO `u1`@`localhost`                      |\n| GRANT INSERT, UPDATE, DELETE ON `db1`.* TO `u1`@`localhost` |\n| GRANT `r1`@`%`,`r2`@`%` TO `u1`@`localhost`                 |\n+-------------------------------------------------------------+\nmysql> SHOW GRANTS FOR \'u1\'@\'localhost\' USING \'r1\', \'r2\';\n+---------------------------------------------------------------------+\n| Grants for u1@localhost                                             |\n+---------------------------------------------------------------------+\n| GRANT USAGE ON *.* TO `u1`@`localhost`                              |\n| GRANT SELECT, INSERT, UPDATE, DELETE ON `db1`.* TO `u1`@`localhost` |\n| GRANT `r1`@`%`,`r2`@`%` TO `u1`@`localhost`                         |\n+---------------------------------------------------------------------+\n\n*Note*:\n\nA privilege granted to an account is always in effect, but a role is\nnot. The active roles for an account can differ across and within\nsessions, depending on the value of the activate_all_roles_on_login\nsystem variable, the account default roles, and whether SET ROLE has\nbeen executed within a session.\n\nMySQL 8.0.16 and higher supports partial revokes of global privileges,\nsuch that a global privilege can be restricted from applying to\nparticular schemas (see\nhttps://dev.mysql.com/doc/refman/8.0/en/partial-revokes.html). To\nindicate which global schema privileges have been revoked for\nparticular schemas, SHOW GRANTS output includes REVOKE statements:\n\nmysql> SET PERSIST partial_revokes = ON;\nmysql> CREATE USER u1;\nmysql> GRANT SELECT, INSERT, DELETE ON *.* TO u1;\nmysql> REVOKE SELECT, INSERT ON mysql.* FROM u1;\nmysql> REVOKE DELETE ON world.* FROM u1;\nmysql> SHOW GRANTS FOR u1;\n+--------------------------------------------------+\n| Grants for u1@%                                  |\n+--------------------------------------------------+\n| GRANT SELECT, INSERT, DELETE ON *.* TO `u1`@`%`  |\n| REVOKE SELECT, INSERT ON `mysql`.* FROM `u1`@`%` |\n| REVOKE DELETE ON `world`.* FROM `u1`@`%`         |\n+--------------------------------------------------+\n\nSHOW GRANTS does not display privileges that are available to the named\naccount but are granted to a different account. For example, if an\nanonymous account exists, the named account might be able to use its\nprivileges, but SHOW GRANTS does not display them.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-grants.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-grants.html'),(664,'SHOW INDEX',3,'Syntax:\nSHOW [EXTENDED] {INDEX | INDEXES | KEYS}\n    {FROM | IN} tbl_name\n    [{FROM | IN} db_name]\n    [WHERE expr]\n\nSHOW INDEX returns table index information. The format resembles that\nof the SQLStatistics call in ODBC. This statement requires some\nprivilege for any column in the table.\n\nmysql> SHOW INDEX FROM City\\G\n*************************** 1. row ***************************\n        Table: city\n   Non_unique: 0\n     Key_name: PRIMARY\n Seq_in_index: 1\n  Column_name: ID\n    Collation: A\n  Cardinality: 4188\n     Sub_part: NULL\n       Packed: NULL\n         Null:\n   Index_type: BTREE\n      Comment:\nIndex_comment:\n      Visible: YES\n   Expression: NULL\n*************************** 2. row ***************************\n        Table: city\n   Non_unique: 1\n     Key_name: CountryCode\n Seq_in_index: 1\n  Column_name: CountryCode\n    Collation: A\n  Cardinality: 232\n     Sub_part: NULL\n       Packed: NULL\n         Null:\n   Index_type: BTREE\n      Comment:\nIndex_comment:\n      Visible: YES\n   Expression: NULL\n\nAn alternative to tbl_name FROM db_name syntax is db_name.tbl_name.\nThese two statements are equivalent:\n\nSHOW INDEX FROM mytable FROM mydb;\nSHOW INDEX FROM mydb.mytable;\n\nThe optional EXTENDED keyword causes the output to include information\nabout hidden indexes that MySQL uses internally and are not accessible\nby users.\n\nThe WHERE clause can be given to select rows using more general\nconditions, as discussed in\nhttps://dev.mysql.com/doc/refman/8.0/en/extended-show.html.\n\nSHOW INDEX returns the following fields:\n\no Table\n\n  The name of the table.\n\no Non_unique\n\n  0 if the index cannot contain duplicates, 1 if it can.\n\no Key_name\n\n  The name of the index. If the index is the primary key, the name is\n  always PRIMARY.\n\no Seq_in_index\n\n  The column sequence number in the index, starting with 1.\n\no Column_name\n\n  The column name. See also the description for the Expression column.\n\no Collation\n\n  How the column is sorted in the index. This can have values A\n  (ascending), D (descending), or NULL (not sorted).\n\no Cardinality\n\n  An estimate of the number of unique values in the index. To update\n  this number, run ANALYZE TABLE or (for MyISAM tables) myisamchk -a.\n\n  Cardinality is counted based on statistics stored as integers, so the\n  value is not necessarily exact even for small tables. The higher the\n  cardinality, the greater the chance that MySQL uses the index when\n  doing joins.\n\no Sub_part\n\n  The index prefix. That is, the number of indexed characters if the\n  column is only partly indexed, NULL if the entire column is indexed.\n\n  *Note*:\n\n  Prefix limits are measured in bytes. However, prefix lengths for\n  index specifications in CREATE TABLE, ALTER TABLE, and CREATE INDEX\n  statements are interpreted as number of characters for nonbinary\n  string types (CHAR, VARCHAR, TEXT) and number of bytes for binary\n  string types (BINARY, VARBINARY, BLOB). Take this into account when\n  specifying a prefix length for a nonbinary string column that uses a\n  multibyte character set.\n\n  For additional information about index prefixes, see\n  https://dev.mysql.com/doc/refman/8.0/en/column-indexes.html, and\n  [HELP CREATE INDEX].\n\no Packed\n\n  Indicates how the key is packed. NULL if it is not.\n\no Null\n\n  Contains YES if the column may contain NULL values and \'\' if not.\n\no Index_type\n\n  The index method used (BTREE, FULLTEXT, HASH, RTREE).\n\no Comment\n\n  Information about the index not described in its own column, such as\n  disabled if the index is disabled.\n\no Index_comment\n\n  Any comment provided for the index with a COMMENT attribute when the\n  index was created.\n\no Visible\n\n  Whether the index is visible to the optimizer. See\n  https://dev.mysql.com/doc/refman/8.0/en/invisible-indexes.html.\n\no Expression\n\n  MySQL 8.0.13 and higher supports functional key parts (see\n  https://dev.mysql.com/doc/refman/8.0/en/create-index.html#create-inde\n  x-functional-key-parts), which affects both the Column_name and\n  Expression columns:\n\n  o For a nonfunctional key part, Column_name indicates the column\n    indexed by the key part and Expression is NULL.\n\n  o For a functional key part, Column_name column is NULL and\n    Expression indicates the expression for the key part.\n\nInformation about table indexes is also available from the\nINFORMATION_SCHEMA STATISTICS table. See\nhttps://dev.mysql.com/doc/refman/8.0/en/information-schema-statistics-t\nable.html. The extended information about hidden indexes is available\nonly using SHOW EXTENDED INDEX; it cannot be obtained from the\nSTATISTICS table.\n\nYou can list a table\'s indexes with the mysqlshow -k db_name tbl_name\ncommand.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-index.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-index.html'),(665,'SHOW MASTER STATUS',3,'Syntax:\nSHOW MASTER STATUS\n\nThis statement provides status information about the binary log files\nof the source server. It requires the REPLICATION CLIENT privilege (or\nthe deprecated SUPER privilege).\n\nExample:\n\nmysql> SHOW MASTER STATUS\\G\n*************************** 1. row ***************************\n             File: source-bin.000002\n         Position: 1307\n     Binlog_Do_DB: test\n Binlog_Ignore_DB: manual, mysql\nExecuted_Gtid_Set: 3E11FA47-71CA-11E1-9E33-C80AA9429562:1-5\n1 row in set (0.00 sec)\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-master-status.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-master-status.html'),(666,'SHOW OPEN TABLES',3,'Syntax:\nSHOW OPEN TABLES\n    [{FROM | IN} db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW OPEN TABLES lists the non-TEMPORARY tables that are currently open\nin the table cache. See\nhttps://dev.mysql.com/doc/refman/8.0/en/table-cache.html. The FROM\nclause, if present, restricts the tables shown to those present in the\ndb_name database. The LIKE clause, if present, indicates which table\nnames to match. The WHERE clause can be given to select rows using more\ngeneral conditions, as discussed in\nhttps://dev.mysql.com/doc/refman/8.0/en/extended-show.html.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-open-tables.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-open-tables.html'),(667,'SHOW PLUGINS',3,'Syntax:\nSHOW PLUGINS\n\nSHOW PLUGINS displays information about server plugins.\n\nExample of SHOW PLUGINS output:\n\nmysql> SHOW PLUGINS\\G\n*************************** 1. row ***************************\n   Name: binlog\n Status: ACTIVE\n   Type: STORAGE ENGINE\nLibrary: NULL\nLicense: GPL\n*************************** 2. row ***************************\n   Name: CSV\n Status: ACTIVE\n   Type: STORAGE ENGINE\nLibrary: NULL\nLicense: GPL\n*************************** 3. row ***************************\n   Name: MEMORY\n Status: ACTIVE\n   Type: STORAGE ENGINE\nLibrary: NULL\nLicense: GPL\n*************************** 4. row ***************************\n   Name: MyISAM\n Status: ACTIVE\n   Type: STORAGE ENGINE\nLibrary: NULL\nLicense: GPL\n...\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-plugins.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-plugins.html'),(668,'SHOW PRIVILEGES',3,'Syntax:\nSHOW PRIVILEGES\n\nSHOW PRIVILEGES shows the list of system privileges that the MySQL\nserver supports. The privileges displayed include all static\nprivileges, and all currently registered dynamic privileges.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-privileges.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-privileges.html'),(669,'SHOW PROCEDURE CODE',3,'Syntax:\nSHOW PROCEDURE CODE proc_name\n\nThis statement is a MySQL extension that is available only for servers\nthat have been built with debugging support. It displays a\nrepresentation of the internal implementation of the named stored\nprocedure. A similar statement, SHOW FUNCTION CODE, displays\ninformation about stored functions (see [HELP SHOW FUNCTION CODE]).\n\nTo use either statement, you must be the user named as the routine\nDEFINER, have the SHOW_ROUTINE privilege, or have the SELECT privilege\nat the global level.\n\nIf the named routine is available, each statement produces a result\nset. Each row in the result set corresponds to one \"instruction\" in the\nroutine. The first column is Pos, which is an ordinal number beginning\nwith 0. The second column is Instruction, which contains an SQL\nstatement (usually changed from the original source), or a directive\nwhich has meaning only to the stored-routine handler.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-procedure-code.html\n\n','mysql> DELIMITER //\nmysql> CREATE PROCEDURE p1 ()\n       BEGIN\n         DECLARE fanta INT DEFAULT 55;\n         DROP TABLE t2;\n         LOOP\n           INSERT INTO t3 VALUES (fanta);\n           END LOOP;\n         END//\nQuery OK, 0 rows affected (0.01 sec)\n\nmysql> SHOW PROCEDURE CODE p1//\n+-----+----------------------------------------+\n| Pos | Instruction                            |\n+-----+----------------------------------------+\n|   0 | set fanta@0 55                         |\n|   1 | stmt 9 \"DROP TABLE t2\"                 |\n|   2 | stmt 5 \"INSERT INTO t3 VALUES (fanta)\" |\n|   3 | jump 2                                 |\n+-----+----------------------------------------+\n4 rows in set (0.00 sec)\n\nmysql> CREATE FUNCTION test.hello (s CHAR(20))\n       RETURNS CHAR(50) DETERMINISTIC\n       RETURN CONCAT(\'Hello, \',s,\'!\');\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SHOW FUNCTION CODE test.hello;\n+-----+---------------------------------------+\n| Pos | Instruction                           |\n+-----+---------------------------------------+\n|   0 | freturn 254 concat(\'Hello, \',s@0,\'!\') |\n+-----+---------------------------------------+\n1 row in set (0.00 sec)\n','https://dev.mysql.com/doc/refman/8.0/en/show-procedure-code.html'),(670,'SHOW PROCEDURE STATUS',3,'Syntax:\nSHOW PROCEDURE STATUS\n    [LIKE \'pattern\' | WHERE expr]\n\nThis statement is a MySQL extension. It returns characteristics of a\nstored procedure, such as the database, name, type, creator, creation\nand modification dates, and character set information. A similar\nstatement, SHOW FUNCTION STATUS, displays information about stored\nfunctions (see [HELP SHOW FUNCTION STATUS]).\n\nTo use either statement, you must be the user named as the routine\nDEFINER, have the SHOW_ROUTINE privilege, have the SELECT privilege at\nthe global level, or have the CREATE ROUTINE, ALTER ROUTINE, or EXECUTE\nprivilege granted at a scope that includes the routine.\n\nThe LIKE clause, if present, indicates which procedure or function\nnames to match. The WHERE clause can be given to select rows using more\ngeneral conditions, as discussed in\nhttps://dev.mysql.com/doc/refman/8.0/en/extended-show.html.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-procedure-status.html\n\n','mysql> SHOW PROCEDURE STATUS LIKE \'sp1\'\\G\n*************************** 1. row ***************************\n                  Db: test\n                Name: sp1\n                Type: PROCEDURE\n             Definer: testuser@localhost\n            Modified: 2018-08-08 13:54:11\n             Created: 2018-08-08 13:54:11\n       Security_type: DEFINER\n             Comment:\ncharacter_set_client: utf8mb4\ncollation_connection: utf8mb4_0900_ai_ci\n  Database Collation: utf8mb4_0900_ai_ci\n\nmysql> SHOW FUNCTION STATUS LIKE \'hello\'\\G\n*************************** 1. row ***************************\n                  Db: test\n                Name: hello\n                Type: FUNCTION\n             Definer: testuser@localhost\n            Modified: 2020-03-10 11:10:03\n             Created: 2020-03-10 11:10:03\n       Security_type: DEFINER\n             Comment:\ncharacter_set_client: utf8mb4\ncollation_connection: utf8mb4_0900_ai_ci\n  Database Collation: utf8mb4_0900_ai_ci\n','https://dev.mysql.com/doc/refman/8.0/en/show-procedure-status.html'),(671,'SHOW PROCESSLIST',3,'Syntax:\nSHOW [FULL] PROCESSLIST\n\nThe MySQL process list indicates the operations currently being\nperformed by the set of threads executing within the server. The SHOW\nPROCESSLIST statement is one source of process information. For a\ncomparison of this statement with other sources, see\nhttps://dev.mysql.com/doc/refman/8.0/en/processlist-access.html#process\nlist-sources.\n\n*Note*:\n\nAs of MySQL 8.0.22, an alternative implementation for SHOW PROCESSLIST\nis available based on the Performance Schema processlist table, which,\nunlike the default SHOW PROCESSLIST implementation, does not require a\nmutex and has better performance characteristics. For details, see\nhttps://dev.mysql.com/doc/refman/8.0/en/performance-schema-processlist-\ntable.html.\n\nIf you have the PROCESS privilege, you can see all threads, even those\nbelonging to other users. Otherwise (without the PROCESS privilege),\nnonanonymous users have access to information about their own threads\nbut not threads for other users, and anonymous users have no access to\nthread information.\n\nWithout the FULL keyword, SHOW PROCESSLIST displays only the first 100\ncharacters of each statement in the Info field.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-processlist.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-processlist.html'),(672,'SHOW PROFILE',3,'Syntax:\nSHOW PROFILE [type [, type] ... ]\n    [FOR QUERY n]\n    [LIMIT row_count [OFFSET offset]]\n\ntype: {\n    ALL\n  | BLOCK IO\n  | CONTEXT SWITCHES\n  | CPU\n  | IPC\n  | MEMORY\n  | PAGE FAULTS\n  | SOURCE\n  | SWAPS\n}\n\nThe SHOW PROFILE and SHOW PROFILES statements display profiling\ninformation that indicates resource usage for statements executed\nduring the course of the current session.\n\n*Note*:\n\nThe SHOW PROFILE and SHOW PROFILES statements are deprecated; expect\nthem to be removed in a future MySQL release. Use the Performance\nSchema instead; see\nhttps://dev.mysql.com/doc/refman/8.0/en/performance-schema-query-profil\ning.html.\n\nTo control profiling, use the profiling session variable, which has a\ndefault value of 0 (OFF). Enable profiling by setting profiling to 1 or\nON:\n\nmysql> SET profiling = 1;\n\nSHOW PROFILES displays a list of the most recent statements sent to the\nserver. The size of the list is controlled by the\nprofiling_history_size session variable, which has a default value of\n15. The maximum value is 100. Setting the value to 0 has the practical\neffect of disabling profiling.\n\nAll statements are profiled except SHOW PROFILE and SHOW PROFILES, so\nneither of those statements appears in the profile list. Malformed\nstatements are profiled. For example, SHOW PROFILING is an illegal\nstatement, and a syntax error occurs if you try to execute it, but it\nshows up in the profiling list.\n\nSHOW PROFILE displays detailed information about a single statement.\nWithout the FOR QUERY n clause, the output pertains to the most\nrecently executed statement. If FOR QUERY n is included, SHOW PROFILE\ndisplays information for statement n. The values of n correspond to the\nQuery_ID values displayed by SHOW PROFILES.\n\nThe LIMIT row_count clause may be given to limit the output to\nrow_count rows. If LIMIT is given, OFFSET offset may be added to begin\nthe output offset rows into the full set of rows.\n\nBy default, SHOW PROFILE displays Status and Duration columns. The\nStatus values are like the State values displayed by SHOW PROCESSLIST,\nalthough there might be some minor differences in interpretion for the\ntwo statements for some status values (see\nhttps://dev.mysql.com/doc/refman/8.0/en/thread-information.html).\n\nOptional type values may be specified to display specific additional\ntypes of information:\n\no ALL displays all information\n\no BLOCK IO displays counts for block input and output operations\n\no CONTEXT SWITCHES displays counts for voluntary and involuntary\n  context switches\n\no CPU displays user and system CPU usage times\n\no IPC displays counts for messages sent and received\n\no MEMORY is not currently implemented\n\no PAGE FAULTS displays counts for major and minor page faults\n\no SOURCE displays the names of functions from the source code, together\n  with the name and line number of the file in which the function\n  occurs\n\no SWAPS displays swap counts\n\nProfiling is enabled per session. When a session ends, its profiling\ninformation is lost.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-profile.html\n\n','mysql> SELECT @@profiling;\n+-------------+\n| @@profiling |\n+-------------+\n|           0 |\n+-------------+\n1 row in set (0.00 sec)\n\nmysql> SET profiling = 1;\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> DROP TABLE IF EXISTS t1;\nQuery OK, 0 rows affected, 1 warning (0.00 sec)\n\nmysql> CREATE TABLE T1 (id INT);\nQuery OK, 0 rows affected (0.01 sec)\n\nmysql> SHOW PROFILES;\n+----------+----------+--------------------------+\n| Query_ID | Duration | Query                    |\n+----------+----------+--------------------------+\n|        0 | 0.000088 | SET PROFILING = 1        |\n|        1 | 0.000136 | DROP TABLE IF EXISTS t1  |\n|        2 | 0.011947 | CREATE TABLE t1 (id INT) |\n+----------+----------+--------------------------+\n3 rows in set (0.00 sec)\n\nmysql> SHOW PROFILE;\n+----------------------+----------+\n| Status               | Duration |\n+----------------------+----------+\n| checking permissions | 0.000040 |\n| creating table       | 0.000056 |\n| After create         | 0.011363 |\n| query end            | 0.000375 |\n| freeing items        | 0.000089 |\n| logging slow query   | 0.000019 |\n| cleaning up          | 0.000005 |\n+----------------------+----------+\n7 rows in set (0.00 sec)\n\nmysql> SHOW PROFILE FOR QUERY 1;\n+--------------------+----------+\n| Status             | Duration |\n+--------------------+----------+\n| query end          | 0.000107 |\n| freeing items      | 0.000008 |\n| logging slow query | 0.000015 |\n| cleaning up        | 0.000006 |\n+--------------------+----------+\n4 rows in set (0.00 sec)\n\nmysql> SHOW PROFILE CPU FOR QUERY 2;\n+----------------------+----------+----------+------------+\n| Status               | Duration | CPU_user | CPU_system |\n+----------------------+----------+----------+------------+\n| checking permissions | 0.000040 | 0.000038 |   0.000002 |\n| creating table       | 0.000056 | 0.000028 |   0.000028 |\n| After create         | 0.011363 | 0.000217 |   0.001571 |\n| query end            | 0.000375 | 0.000013 |   0.000028 |\n| freeing items        | 0.000089 | 0.000010 |   0.000014 |\n| logging slow query   | 0.000019 | 0.000009 |   0.000010 |\n| cleaning up          | 0.000005 | 0.000003 |   0.000002 |\n+----------------------+----------+----------+------------+\n7 rows in set (0.00 sec)\n','https://dev.mysql.com/doc/refman/8.0/en/show-profile.html'),(673,'SHOW PROFILES',3,'Syntax:\nSHOW PROFILES\n\nThe SHOW PROFILES statement, together with SHOW PROFILE, displays\nprofiling information that indicates resource usage for statements\nexecuted during the course of the current session. For more\ninformation, see [HELP SHOW PROFILE].\n\n*Note*:\n\nThe SHOW PROFILE and SHOW PROFILES statements are deprecated; expect it\nto be removed in a future MySQL release. Use the Performance Schema\ninstead; see\nhttps://dev.mysql.com/doc/refman/8.0/en/performance-schema-query-profil\ning.html.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-profiles.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-profiles.html'),(674,'SHOW RELAYLOG EVENTS',3,'Syntax:\nSHOW RELAYLOG EVENTS\n    [IN \'log_name\']\n    [FROM pos]\n    [LIMIT [offset,] row_count]\n    [channel_option]\n\nchannel_option:\n    FOR CHANNEL channel\n\nShows the events in the relay log of a replica. If you do not specify\n\'log_name\', the first relay log is displayed. This statement has no\neffect on the source. SHOW RELAYLOG EVENTS requires the REPLICATION\nSLAVE privilege.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-relaylog-events.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-relaylog-events.html'),(675,'SHOW REPLICAS',3,'Syntax:\n{SHOW REPLICAS | SHOW SLAVE HOSTS}\n\nDisplays a list of replicas currently registered with the source. From\nMySQL 8.0.22, use SHOW REPLICAS in place of SHOW SLAVE HOSTS, which is\ndeprecated from that release. In releases before MySQL 8.0.22, use SHOW\nSLAVE HOSTS. SHOW REPLICAS | SHOW SLAVE HOSTS requires the REPLICATION\nSLAVE privilege.\n\nSHOW REPLICAS | SHOW SLAVE HOSTS should be executed on a server that\nacts as a replication source. The statement displays information about\nservers that are or have been connected as replicas, with each row of\nthe result corresponding to one replica server, as shown here:\n\nmysql> SHOW REPLICAS;\n+------------+-----------+------+-----------+--------------------------------------+\n| Server_id  | Host      | Port | Source_id | Replica_UUID                         |\n+------------+-----------+------+-----------+--------------------------------------+\n|         10 | iconnect2 | 3306 |         3 | 14cb6624-7f93-11e0-b2c0-c80aa9429562 |\n|         21 | athena    | 3306 |         3 | 07af4990-f41f-11df-a566-7ac56fdaf645 |\n+------------+-----------+------+-----------+--------------------------------------+\n\no Server_id: The unique server ID of the replica server, as configured\n  in the replica server\'s option file, or on the command line with\n  --server-id=value.\n\no Host: The host name of the replica server, as specified on the\n  replica with the --report-host option. This can differ from the\n  machine name as configured in the operating system.\n\no User: The replica server user name, as specified on the replica with\n  the --report-user option. Statement output includes this column only\n  if the source server is started with the --show-slave-auth-info\n  option.\n\no Password: The replica server password, as specified on the replica\n  with the --report-password option. Statement output includes this\n  column only if the source server is started with the\n  --show-slave-auth-info option.\n\no Port: The port on the source to which the replica server is\n  listening, as specified on the replica with the --report-port option.\n\n  A zero in this column means that the replica port (--report-port) was\n  not set.\n\no Source_id: The unique server ID of the source server that the replica\n  server is replicating from. This is the server ID of the server on\n  which SHOW REPLICAS | SHOW SLAVE HOSTS is executed, so this same\n  value is listed for each row in the result.\n\no Replica_UUID: The globally unique ID of this replica, as generated on\n  the replica and found in the replica\'s auto.cnf file.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-replicas.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-replicas.html'),(676,'SHOW SLAVE HOSTS',3,'Syntax:\n{SHOW SLAVE HOSTS | SHOW REPLICAS}\n\nDisplays a list of replicas currently registered with the source. From\nMySQL 8.0.22, SHOW SLAVE HOSTS is deprecated and the alias SHOW\nREPLICAS should be used instead. The statement works in the same way as\nbefore, only the terminology used for the statement and its output has\nchanged. Both versions of the statement update the same status\nvariables when used. Please see the documentation for SHOW REPLICAS for\na description of the statement.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-slave-hosts.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-slave-hosts.html'),(677,'SHOW REPLICA STATUS',3,'Syntax:\nSHOW {REPLICA | SLAVE} STATUS [FOR CHANNEL channel]\n\nThis statement provides status information on essential parameters of\nthe replica threads. From MySQL 8.0.22, use SHOW REPLICA STATUS in\nplace of SHOW SLAVE STATUS, which is deprecated from that release. In\nreleases before MySQL 8.0.22, use SHOW SLAVE STATUS. The statement\nrequires the REPLICATION CLIENT privilege (or the deprecated SUPER\nprivilege).\n\nSHOW REPLICA | SLAVE STATUS is nonblocking. When run concurrently with\nSTOP REPLICA | SLAVE, SHOW REPLICA | SLAVE STATUS returns without\nwaiting for STOP REPLICA | SLAVE to finish shutting down the\nreplication SQL thread or replication I/O thread (or both). This\npermits use in monitoring and other applications where getting an\nimmediate response from SHOW REPLICA | SLAVE STATUS is more important\nthan ensuring that it returned the latest data.\n\nIf you issue this statement using the mysql client, you can use a \\G\nstatement terminator rather than a semicolon to obtain a more readable\nvertical layout:\n\nmysql> SHOW REPLICA STATUS\\G\n*************************** 1. row ***************************\n             Replica_IO_State: Waiting for source to send event\n                  Source_Host: localhost\n                  Source_User: repl\n                  Source_Port: 13000\n                Connect_Retry: 60\n              Source_Log_File: source-bin.000002\n          Read_Source_Log_Pos: 1307\n               Relay_Log_File: replica-relay-bin.000003\n                Relay_Log_Pos: 1508\n        Relay_Source_Log_File: source-bin.000002\n           Replica_IO_Running: Yes\n          Replica_SQL_Running: Yes\n              Replicate_Do_DB:\n          Replicate_Ignore_DB:\n           Replicate_Do_Table:\n       Replicate_Ignore_Table:\n      Replicate_Wild_Do_Table:\n  Replicate_Wild_Ignore_Table:\n                   Last_Errno: 0\n                   Last_Error:\n                 Skip_Counter: 0\n          Exec_Source_Log_Pos: 1307\n              Relay_Log_Space: 1858\n              Until_Condition: None\n               Until_Log_File:\n                Until_Log_Pos: 0\n           Source_SSL_Allowed: No\n           Source_SSL_CA_File:\n           Source_SSL_CA_Path:\n              Source_SSL_Cert:\n            Source_SSL_Cipher:\n               Source_SSL_Key:\n        Seconds_Behind_Source: 0\nSource_SSL_Verify_Server_Cert: No\n                Last_IO_Errno: 0\n                Last_IO_Error:\n               Last_SQL_Errno: 0\n               Last_SQL_Error:\n  Replicate_Ignore_Server_Ids:\n             Source_Server_Id: 1\n                  Source_UUID: 3e11fa47-71ca-11e1-9e33-c80aa9429562\n             Source_Info_File:\n                    SQL_Delay: 0\n          SQL_Remaining_Delay: NULL\n    Replica_SQL_Running_State: Reading event from the relay log\n           Source_Retry_Count: 10\n                  Source_Bind:\n      Last_IO_Error_Timestamp:\n     Last_SQL_Error_Timestamp:\n               Source_SSL_Crl:\n           Source_SSL_Crlpath:\n           Retrieved_Gtid_Set: 3e11fa47-71ca-11e1-9e33-c80aa9429562:1-5\n            Executed_Gtid_Set: 3e11fa47-71ca-11e1-9e33-c80aa9429562:1-5\n                Auto_Position: 1\n         Replicate_Rewrite_DB:\n                 Channel_name:\n           Source_TLS_Version: TLSv1.2\n       Source_public_key_path: public_key.pem\n        Get_source_public_key: 0\n            Network_Namespace:\n\nThe Performance Schema provides tables that expose replication\ninformation. This is similar to the information available from the SHOW\nREPLICA | SLAVE STATUS statement, but represented in table form. For\ndetails, see\nhttps://dev.mysql.com/doc/refman/8.0/en/performance-schema-replication-\ntables.html.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-replica-status.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-replica-status.html'),(678,'SHOW SLAVE STATUS',3,'Syntax:\nSHOW {SLAVE | REPLICA} STATUS [FOR CHANNEL channel]\n\nThis statement provides status information on essential parameters of\nthe replica threads. From MySQL 8.0.22, SHOW SLAVE STATUS is deprecated\nand the alias SHOW REPLICA STATUS should be used instead. The statement\nworks in the same way as before, only the terminology used for the\nstatement and its output has changed. Both versions of the statement\nupdate the same status variables when used. Please see the\ndocumentation for SHOW REPLICA STATUS for a description of the\nstatement.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-slave-status.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-slave-status.html'),(679,'SHOW STATUS',3,'Syntax:\nSHOW [GLOBAL | SESSION] STATUS\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW STATUS provides server status information (see\nhttps://dev.mysql.com/doc/refman/8.0/en/server-status-variables.html).\nThis statement does not require any privilege. It requires only the\nability to connect to the server.\n\nStatus variable information is also available from these sources:\n\no Performance Schema tables. See\n  https://dev.mysql.com/doc/refman/8.0/en/performance-schema-status-var\n  iable-tables.html.\n\no The mysqladmin extended-status command. See\n  https://dev.mysql.com/doc/refman/8.0/en/mysqladmin.html.\n\nFor SHOW STATUS, a LIKE clause, if present, indicates which variable\nnames to match. A WHERE clause can be given to select rows using more\ngeneral conditions, as discussed in\nhttps://dev.mysql.com/doc/refman/8.0/en/extended-show.html.\n\nSHOW STATUS accepts an optional GLOBAL or SESSION variable scope\nmodifier:\n\no With a GLOBAL modifier, the statement displays the global status\n  values. A global status variable may represent status for some aspect\n  of the server itself (for example, Aborted_connects), or the\n  aggregated status over all connections to MySQL (for example,\n  Bytes_received and Bytes_sent). If a variable has no global value,\n  the session value is displayed.\n\no With a SESSION modifier, the statement displays the status variable\n  values for the current connection. If a variable has no session\n  value, the global value is displayed. LOCAL is a synonym for SESSION.\n\no If no modifier is present, the default is SESSION.\n\nThe scope for each status variable is listed at\nhttps://dev.mysql.com/doc/refman/8.0/en/server-status-variables.html.\n\nEach invocation of the SHOW STATUS statement uses an internal temporary\ntable and increments the global Created_tmp_tables value.\n\nWith a LIKE clause, the statement displays only rows for those\nvariables with names that match the pattern:\n\nmysql> SHOW STATUS LIKE \'Key%\';\n+--------------------+----------+\n| Variable_name      | Value    |\n+--------------------+----------+\n| Key_blocks_used    | 14955    |\n| Key_read_requests  | 96854827 |\n| Key_reads          | 162040   |\n| Key_write_requests | 7589728  |\n| Key_writes         | 3813196  |\n+--------------------+----------+\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-status.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-status.html'),(680,'SHOW TABLE STATUS',3,'Syntax:\nSHOW TABLE STATUS\n    [{FROM | IN} db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW TABLE STATUS works likes SHOW TABLES, but provides a lot of\ninformation about each non-TEMPORARY table. You can also get this list\nusing the mysqlshow --status db_name command. The LIKE clause, if\npresent, indicates which table names to match. The WHERE clause can be\ngiven to select rows using more general conditions, as discussed in\nhttps://dev.mysql.com/doc/refman/8.0/en/extended-show.html.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-table-status.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-table-status.html'),(681,'SHOW TABLES',3,'Syntax:\nSHOW [EXTENDED] [FULL] TABLES\n    [{FROM | IN} db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW TABLES lists the non-TEMPORARY tables in a given database. You can\nalso get this list using the mysqlshow db_name command. The LIKE\nclause, if present, indicates which table names to match. The WHERE\nclause can be given to select rows using more general conditions, as\ndiscussed in\nhttps://dev.mysql.com/doc/refman/8.0/en/extended-show.html.\n\nMatching performed by the LIKE clause is dependent on the setting of\nthe lower_case_table_names system variable.\n\nThe optional EXTENDED modifier causes SHOW TABLES to list hidden tables\ncreated by failed ALTER TABLE statements. These temporary tables have\nnames beginning with #sql and can be dropped using DROP TABLE.\n\nThis statement also lists any views in the database. The optional FULL\nmodifier causes SHOW TABLES to display a second output column with\nvalues of BASE TABLE for a table, VIEW for a view, or SYSTEM VIEW for\nan INFORMATION_SCHEMA table.\n\nIf you have no privileges for a base table or view, it does not show up\nin the output from SHOW TABLES or mysqlshow db_name.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-tables.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-tables.html'),(682,'SHOW TRIGGERS',3,'Syntax:\nSHOW TRIGGERS\n    [{FROM | IN} db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW TRIGGERS lists the triggers currently defined for tables in a\ndatabase (the default database unless a FROM clause is given). This\nstatement returns results only for databases and tables for which you\nhave the TRIGGER privilege. The LIKE clause, if present, indicates\nwhich table names (not trigger names) to match and causes the statement\nto display triggers for those tables. The WHERE clause can be given to\nselect rows using more general conditions, as discussed in\nhttps://dev.mysql.com/doc/refman/8.0/en/extended-show.html.\n\nFor the ins_sum trigger defined in\nhttps://dev.mysql.com/doc/refman/8.0/en/triggers.html, the output of\nSHOW TRIGGERS is as shown here:\n\nmysql> SHOW TRIGGERS LIKE \'acc%\'\\G\n*************************** 1. row ***************************\n             Trigger: ins_sum\n               Event: INSERT\n               Table: account\n           Statement: SET @sum = @sum + NEW.amount\n              Timing: BEFORE\n             Created: 2018-08-08 10:10:12.61\n            sql_mode: ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,\n                      NO_ZERO_IN_DATE,NO_ZERO_DATE,\n                      ERROR_FOR_DIVISION_BY_ZERO,\n                      NO_ENGINE_SUBSTITUTION\n             Definer: me@localhost\ncharacter_set_client: utf8mb4\ncollation_connection: utf8mb4_0900_ai_ci\n  Database Collation: utf8mb4_0900_ai_ci\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-triggers.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-triggers.html'),(683,'SHOW VARIABLES',3,'Syntax:\nSHOW [GLOBAL | SESSION] VARIABLES\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW VARIABLES shows the values of MySQL system variables (see\nhttps://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html).\nThis statement does not require any privilege. It requires only the\nability to connect to the server.\n\nSystem variable information is also available from these sources:\n\no Performance Schema tables. See\n  https://dev.mysql.com/doc/refman/8.0/en/performance-schema-system-var\n  iable-tables.html.\n\no The mysqladmin variables command. See\n  https://dev.mysql.com/doc/refman/8.0/en/mysqladmin.html.\n\nFor SHOW VARIABLES, a LIKE clause, if present, indicates which variable\nnames to match. A WHERE clause can be given to select rows using more\ngeneral conditions, as discussed in\nhttps://dev.mysql.com/doc/refman/8.0/en/extended-show.html.\n\nSHOW VARIABLES accepts an optional GLOBAL or SESSION variable scope\nmodifier:\n\no With a GLOBAL modifier, the statement displays global system variable\n  values. These are the values used to initialize the corresponding\n  session variables for new connections to MySQL. If a variable has no\n  global value, no value is displayed.\n\no With a SESSION modifier, the statement displays the system variable\n  values that are in effect for the current connection. If a variable\n  has no session value, the global value is displayed. LOCAL is a\n  synonym for SESSION.\n\no If no modifier is present, the default is SESSION.\n\nThe scope for each system variable is listed at\nhttps://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html.\n\nSHOW VARIABLES is subject to a version-dependent display-width limit.\nFor variables with very long values that are not completely displayed,\nuse SELECT as a workaround. For example:\n\nSELECT @@GLOBAL.innodb_data_file_path;\n\nMost system variables can be set at server startup (read-only variables\nsuch as version_comment are exceptions). Many can be changed at runtime\nwith the SET statement. See\nhttps://dev.mysql.com/doc/refman/8.0/en/using-system-variables.html,\nand [HELP SET].\n\nWith a LIKE clause, the statement displays only rows for those\nvariables with names that match the pattern. To obtain the row for a\nspecific variable, use a LIKE clause as shown:\n\nSHOW VARIABLES LIKE \'max_join_size\';\nSHOW SESSION VARIABLES LIKE \'max_join_size\';\n\nTo get a list of variables whose name match a pattern, use the %\nwildcard character in a LIKE clause:\n\nSHOW VARIABLES LIKE \'%size%\';\nSHOW GLOBAL VARIABLES LIKE \'%size%\';\n\nWildcard characters can be used in any position within the pattern to\nbe matched. Strictly speaking, because _ is a wildcard that matches any\nsingle character, you should escape it as \\_ to match it literally. In\npractice, this is rarely necessary.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-variables.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-variables.html'),(684,'SHOW WARNINGS',3,'Syntax:\nSHOW WARNINGS [LIMIT [offset,] row_count]\nSHOW COUNT(*) WARNINGS\n\nSHOW WARNINGS is a diagnostic statement that displays information about\nthe conditions (errors, warnings, and notes) resulting from executing a\nstatement in the current session. Warnings are generated for DML\nstatements such as INSERT, UPDATE, and LOAD DATA as well as DDL\nstatements such as CREATE TABLE and ALTER TABLE.\n\nThe LIMIT clause has the same syntax as for the SELECT statement. See\nhttps://dev.mysql.com/doc/refman/8.0/en/select.html.\n\nSHOW WARNINGS is also used following EXPLAIN, to display the extended\ninformation generated by EXPLAIN. See\nhttps://dev.mysql.com/doc/refman/8.0/en/explain-extended.html.\n\nSHOW WARNINGS displays information about the conditions resulting from\nexecution of the most recent nondiagnostic statement in the current\nsession. If the most recent statement resulted in an error during\nparsing, SHOW WARNINGS shows the resulting conditions, regardless of\nstatement type (diagnostic or nondiagnostic).\n\nThe SHOW COUNT(*) WARNINGS diagnostic statement displays the total\nnumber of errors, warnings, and notes. You can also retrieve this\nnumber from the warning_count system variable:\n\nSHOW COUNT(*) WARNINGS;\nSELECT @@warning_count;\n\nA difference in these statements is that the first is a diagnostic\nstatement that does not clear the message list. The second, because it\nis a SELECT statement is considered nondiagnostic and does clear the\nmessage list.\n\nA related diagnostic statement, SHOW ERRORS, shows only error\nconditions (it excludes warnings and notes), and SHOW COUNT(*) ERRORS\nstatement displays the total number of errors. See [HELP SHOW ERRORS].\nGET DIAGNOSTICS can be used to examine information for individual\nconditions. See [HELP GET DIAGNOSTICS].\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/show-warnings.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/show-warnings.html'),(685,'BINLOG',3,'Syntax:\nBINLOG \'str\'\n\nBINLOG is an internal-use statement. It is generated by the mysqlbinlog\nprogram as the printable representation of certain events in binary log\nfiles. (See https://dev.mysql.com/doc/refman/8.0/en/mysqlbinlog.html.)\nThe \'str\' value is a base 64-encoded string the that server decodes to\ndetermine the data change indicated by the corresponding event.\n\nTo execute BINLOG statements when applying mysqlbinlog output, a user\naccount requires the BINLOG_ADMIN privilege (or the deprecated SUPER\nprivilege), or the REPLICATION_APPLIER privilege plus the appropriate\nprivileges to execute each log event.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/binlog.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/binlog.html'),(686,'CACHE INDEX',3,'Syntax:\nCACHE INDEX {\n      tbl_index_list [, tbl_index_list] ...\n    | tbl_name PARTITION (partition_list)\n  }\n  IN key_cache_name\n\ntbl_index_list:\n  tbl_name [{INDEX|KEY} (index_name[, index_name] ...)]\n\npartition_list: {\n    partition_name[, partition_name] ...\n  | ALL\n}\n\nThe CACHE INDEX statement assigns table indexes to a specific key\ncache. It applies only to MyISAM tables, including partitioned MyISAM\ntables. After the indexes have been assigned, they can be preloaded\ninto the cache if desired with LOAD INDEX INTO CACHE.\n\nThe following statement assigns indexes from the tables t1, t2, and t3\nto the key cache named hot_cache:\n\nmysql> CACHE INDEX t1, t2, t3 IN hot_cache;\n+---------+--------------------+----------+----------+\n| Table   | Op                 | Msg_type | Msg_text |\n+---------+--------------------+----------+----------+\n| test.t1 | assign_to_keycache | status   | OK       |\n| test.t2 | assign_to_keycache | status   | OK       |\n| test.t3 | assign_to_keycache | status   | OK       |\n+---------+--------------------+----------+----------+\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/cache-index.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/cache-index.html'),(687,'FLUSH',3,'Syntax:\nFLUSH [NO_WRITE_TO_BINLOG | LOCAL] {\n    flush_option [, flush_option] ...\n  | tables_option\n}\n\nflush_option: {\n    BINARY LOGS\n  | ENGINE LOGS\n  | ERROR LOGS\n  | GENERAL LOGS\n  | HOSTS\n  | LOGS\n  | PRIVILEGES\n  | OPTIMIZER_COSTS\n  | RELAY LOGS [FOR CHANNEL channel]\n  | SLOW LOGS\n  | STATUS\n  | USER_RESOURCES\n}\n\ntables_option: {\n    TABLES\n  | TABLES tbl_name [, tbl_name] ...\n  | TABLES WITH READ LOCK\n  | TABLES tbl_name [, tbl_name] ... WITH READ LOCK\n  | TABLES tbl_name [, tbl_name] ... FOR EXPORT\n}\n\nThe FLUSH statement has several variant forms that clear or reload\nvarious internal caches, flush tables, or acquire locks. Each FLUSH\noperation requires the privileges indicated in its description.\n\n*Note*:\n\nIt is not possible to issue FLUSH statements within stored functions or\ntriggers. However, you may use FLUSH in stored procedures, so long as\nthese are not called from stored functions or triggers. See\nhttps://dev.mysql.com/doc/refman/8.0/en/stored-program-restrictions.htm\nl.\n\nBy default, the server writes FLUSH statements to the binary log so\nthat they replicate to replicas. To suppress logging, specify the\noptional NO_WRITE_TO_BINLOG keyword or its alias LOCAL.\n\n*Note*:\n\nFLUSH LOGS, FLUSH BINARY LOGS, FLUSH TABLES WITH READ LOCK (with or\nwithout a table list), and FLUSH TABLES tbl_name ... FOR EXPORT are not\nwritten to the binary log in any case because they would cause problems\nif replicated to a replica.\n\nThe FLUSH statement causes an implicit commit. See\nhttps://dev.mysql.com/doc/refman/8.0/en/implicit-commit.html.\n\nThe mysqladmin utility provides a command-line interface to some flush\noperations, using commands such as flush-hosts, flush-logs,\nflush-privileges, flush-status, and flush-tables. See\nhttps://dev.mysql.com/doc/refman/8.0/en/mysqladmin.html.\n\nSending a SIGHUP or SIGUSR1 signal to the server causes several flush\noperations to occur that are similar to various forms of the FLUSH\nstatement. Signals can be sent by the root system account or the system\naccount that owns the server process. This enables the flush operations\nto be performed without having to connect to the server, which requires\na MySQL account that has privileges sufficient for those operations.\nSee https://dev.mysql.com/doc/refman/8.0/en/unix-signal-response.html.\n\nThe RESET statement is similar to FLUSH. See [HELP RESET], for\ninformation about using RESET with replication.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/flush.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/flush.html'),(688,'KILL',3,'Syntax:\nKILL [CONNECTION | QUERY] processlist_id\n\nEach connection to mysqld runs in a separate thread. You can kill a\nthread with the KILL processlist_id statement.\n\nThread processlist identifiers can be determined from the ID column of\nthe INFORMATION_SCHEMA PROCESSLIST table, the Id column of SHOW\nPROCESSLIST output, and the PROCESSLIST_ID column of the Performance\nSchema threads table. The value for the current thread is returned by\nthe CONNECTION_ID() function.\n\nKILL permits an optional CONNECTION or QUERY modifier:\n\no KILL CONNECTION is the same as KILL with no modifier: It terminates\n  the connection associated with the given processlist_id, after\n  terminating any statement the connection is executing.\n\no KILL QUERY terminates the statement the connection is currently\n  executing, but leaves the connection itself intact.\n\nThe ability to see which threads are available to be killed depends on\nthe PROCESS privilege:\n\no Without PROCESS, you can see only your own threads.\n\no With PROCESS, you can see all threads.\n\nThe ability to kill threads and statements depends on the\nCONNECTION_ADMIN privilege and the deprecated SUPER privilege:\n\no Without CONNECTION_ADMIN or SUPER, you can kill only your own threads\n  and statements.\n\no With CONNECTION_ADMIN or SUPER, you can kill all threads and\n  statements, except that to affect a thread or statement that is\n  executing with the SYSTEM_USER privilege, your own session must\n  additionally have the SYSTEM_USER privilege.\n\nYou can also use the mysqladmin processlist and mysqladmin kill\ncommands to examine and kill threads.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/kill.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/kill.html'),(689,'LOAD INDEX',3,'Syntax:\nLOAD INDEX INTO CACHE\n  tbl_index_list [, tbl_index_list] ...\n\ntbl_index_list:\n  tbl_name\n    [PARTITION (partition_list)]\n    [{INDEX|KEY} (index_name[, index_name] ...)]\n    [IGNORE LEAVES]\n\npartition_list: {\n    partition_name[, partition_name] ...\n  | ALL\n}\n\nThe LOAD INDEX INTO CACHE statement preloads a table index into the key\ncache to which it has been assigned by an explicit CACHE INDEX\nstatement, or into the default key cache otherwise.\n\nLOAD INDEX INTO CACHE applies only to MyISAM tables, including\npartitioned MyISAM tables. In addition, indexes on partitioned tables\ncan be preloaded for one, several, or all partitions.\n\nThe IGNORE LEAVES modifier causes only blocks for the nonleaf nodes of\nthe index to be preloaded.\n\nIGNORE LEAVES is also supported for partitioned MyISAM tables.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/load-index.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/load-index.html'),(690,'RESET',3,'Syntax:\nRESET reset_option [, reset_option] ...\n\nreset_option: {\n    MASTER\n  | REPLICA\n  | SLAVE\n}\n\nThe RESET statement is used to clear the state of various server\noperations. You must have the RELOAD privilege to execute RESET.\n\nFor information about the RESET PERSIST statement that removes\npersisted global system variables, see [HELP RESET PERSIST].\n\nRESET acts as a stronger version of the FLUSH statement. See [HELP\nFLUSH].\n\nThe RESET statement causes an implicit commit. See\nhttps://dev.mysql.com/doc/refman/8.0/en/implicit-commit.html.\n\nThe following list describes the permitted RESET statement reset_option\nvalues:\n\no RESET MASTER\n\n  Deletes all binary logs listed in the index file, resets the binary\n  log index file to be empty, and creates a new binary log file.\n\no RESET REPLICA | SLAVE\n\n  Makes the replica forget its replication position in the source\n  binary logs. Also resets the relay log by deleting any existing relay\n  log files and beginning a new one. Use RESET REPLICA in place of\n  RESET SLAVE from MySQL 8.0.22.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/reset.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/reset.html'),(691,'RESET PERSIST',3,'Syntax:\nRESET PERSIST [[IF EXISTS] system_var_name]\n\nRESET PERSIST removes persisted global system variable settings from\nthe mysqld-auto.cnf option file in the data directory. Removing a\npersisted system variable causes the variable no longer to be\ninitialized from mysqld-auto.cnf at server startup. For more\ninformation about persisting system variables and the mysqld-auto.cnf\nfile, see\nhttps://dev.mysql.com/doc/refman/8.0/en/persisted-system-variables.html\n.\n\nThe privileges required for RESET PERSIST depend on the type of system\nvariable to be removed:\n\no For dynamic system variables, this statement requires the\n  SYSTEM_VARIABLES_ADMIN privilege (or the deprecated SUPER privilege).\n\no For read-only system variables, this statement requires the\n  SYSTEM_VARIABLES_ADMIN and PERSIST_RO_VARIABLES_ADMIN privileges.\n\nSee\nhttps://dev.mysql.com/doc/refman/8.0/en/system-variable-privileges.html\n.\n\nDepending on whether the variable name and IF EXISTS clauses are\npresent, the RESET PERSIST statement has these forms:\n\no To remove all persisted variables from mysqld-auto.cnf, use RESET\n  PERSIST without naming any system variable:\n\nRESET PERSIST;\n\n  You must have privileges for removing both dynamic and read-only\n  system variables if mysqld-auto.cnf contains both kinds of variables.\n\no To remove a specific persisted variable from mysqld-auto.cnf, name it\n  in the statement:\n\nRESET PERSIST system_var_name;\n\n  This includes plugin system variables, even if the plugin is not\n  currently installed. If the variable is not present in the file, an\n  error occurs.\n\no To remove a specific persisted variable from mysqld-auto.cnf, but\n  produce a warning rather than an error if the variable is not present\n  in the file, add an IF EXISTS clause to the previous syntax:\n\nRESET PERSIST IF EXISTS system_var_name;\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/reset-persist.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/reset-persist.html'),(692,'RESTART',3,'Syntax:\nRESTART\n\nThis statement stops and restarts the MySQL server. It requires the\nSHUTDOWN privilege.\n\nOne use for RESTART is when it is not possible or convenient to gain\ncommand-line access to the MySQL server on the server host to restart\nit. For example, SET PERSIST_ONLY can be used at runtime to make\nconfiguration changes to system variables that can be set only at\nserver startup, but the server must still be restarted for those\nchanges to take effect. The RESTART statement provides a way to do so\nfrom within client sessions, without requiring command-line access on\nthe server host.\n\n*Note*:\n\nAfter executing a RESTART statement, the client can expect the current\nconnection to be lost. If auto-reconnect is enabled, the connection is\nreestablished after the server restarts. Otherwise, the connection must\nbe reestablished manually.\n\nA successful RESTART operation requires mysqld to be running in an\nenvironment that has a monitoring process available to detect a server\nshutdown performed for restart purposes:\n\no In the presence of a monitoring process, RESTART causes mysqld to\n  terminate such that the monitoring process can determine that it\n  should start a new mysqld instance.\n\no If no monitoring process is present, RESTART fails with an error.\n\nThese platforms provide the necessary monitoring support for the\nRESTART statement:\n\no Windows, when mysqld is started as a Windows service or standalone.\n  (mysqld forks, and one process acts as a monitor to the other, which\n  acts as the server.)\n\no Unix and Unix-like systems that use systemd or mysqld_safe to manage\n  mysqld.\n\nTo configure a monitoring environment such that mysqld enables the\nRESTART statement:\n\n1. Set the MYSQLD_PARENT_PID environment variable to the value of the\n   process ID of the process that starts mysqld, before starting\n   mysqld.\n\n2. When mysqld performs a shutdown due to use of the RESTART statement,\n   it returns exit code 16.\n\n3. When the monitoring process detects an exit code of 16, it starts\n   mysqld again. Otherwise, it exits.\n\nHere is a minimal example as implemented in the bash shell:\n\n#!/bin/bash\n\nexport MYSQLD_PARENT_PID=$$\n\nexport MYSQLD_RESTART_EXIT=16\n\nwhile true ; do\n  bin/mysqld mysqld options here\n  if [ $? -ne $MYSQLD_RESTART_EXIT ]; then\n    break\n  fi\ndone\n\nOn Windows, the forking used to implement RESTART makes determining the\nserver process to attach to for debugging more difficult. To alleviate\nthis, starting the server with --gdb suppresses forking, in addition to\nits other actions done to set up a debugging environment. In non-debug\nsettings, --no-monitor may be used for the sole purpose of suppressing\nforking the monitor process. For a server started with either --gdb or\n--no-monitor, executing RESTART causes the server to simply exit\nwithout restarting.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/restart.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/restart.html'),(693,'SHUTDOWN',3,'Syntax:\nSHUTDOWN\n\nThis statement stops the MySQL server. It requires the SHUTDOWN\nprivilege.\n\nSHUTDOWN provides an SQL-level interface to the same functionality\navailable using the mysqladmin shutdown command or the mysql_shutdown()\n(https://dev.mysql.com/doc/c-api/8.0/en/mysql-shutdown.html) C API\nfunction.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/shutdown.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/shutdown.html'),(694,'EXPLAIN',51,'Syntax:\n{EXPLAIN | DESCRIBE | DESC}\n    tbl_name [col_name | wild]\n\n{EXPLAIN | DESCRIBE | DESC}\n    [explain_type]\n    {explainable_stmt | FOR CONNECTION connection_id}\n\n{EXPLAIN | DESCRIBE | DESC} ANALYZE [FORMAT = TREE] select_statement\n\nexplain_type: {\n    FORMAT = format_name\n}\n\nformat_name: {\n    TRADITIONAL\n  | JSON\n  | TREE\n}\n\nexplainable_stmt: {\n    SELECT statement\n  | TABLE statement\n  | DELETE statement\n  | INSERT statement\n  | REPLACE statement\n  | UPDATE statement\n}\n\nThe DESCRIBE and EXPLAIN statements are synonyms. In practice, the\nDESCRIBE keyword is more often used to obtain information about table\nstructure, whereas EXPLAIN is used to obtain a query execution plan\n(that is, an explanation of how MySQL would execute a query).\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/explain.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/explain.html'),(695,'DESCRIBE',51,'Syntax:\n{EXPLAIN | DESCRIBE | DESC}\n    tbl_name [col_name | wild]\n\n{EXPLAIN | DESCRIBE | DESC}\n    [explain_type]\n    {explainable_stmt | FOR CONNECTION connection_id}\n\n{EXPLAIN | DESCRIBE | DESC} ANALYZE [FORMAT = TREE] select_statement\n\nexplain_type: {\n    FORMAT = format_name\n}\n\nformat_name: {\n    TRADITIONAL\n  | JSON\n  | TREE\n}\n\nexplainable_stmt: {\n    SELECT statement\n  | TABLE statement\n  | DELETE statement\n  | INSERT statement\n  | REPLACE statement\n  | UPDATE statement\n}\n\nThe DESCRIBE and EXPLAIN statements are synonyms. In practice, the\nDESCRIBE keyword is more often used to obtain information about table\nstructure, whereas EXPLAIN is used to obtain a query execution plan\n(that is, an explanation of how MySQL would execute a query).\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/explain.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/explain.html'),(696,'DESC',51,'Syntax:\n{EXPLAIN | DESCRIBE | DESC}\n    tbl_name [col_name | wild]\n\n{EXPLAIN | DESCRIBE | DESC}\n    [explain_type]\n    {explainable_stmt | FOR CONNECTION connection_id}\n\n{EXPLAIN | DESCRIBE | DESC} ANALYZE [FORMAT = TREE] select_statement\n\nexplain_type: {\n    FORMAT = format_name\n}\n\nformat_name: {\n    TRADITIONAL\n  | JSON\n  | TREE\n}\n\nexplainable_stmt: {\n    SELECT statement\n  | TABLE statement\n  | DELETE statement\n  | INSERT statement\n  | REPLACE statement\n  | UPDATE statement\n}\n\nThe DESCRIBE and EXPLAIN statements are synonyms. In practice, the\nDESCRIBE keyword is more often used to obtain information about table\nstructure, whereas EXPLAIN is used to obtain a query execution plan\n(that is, an explanation of how MySQL would execute a query).\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/explain.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/explain.html'),(697,'HELP STATEMENT',51,'Syntax:\nHELP \'search_string\'\n\nThe HELP statement returns online information from the MySQL Reference\nManual. Its proper operation requires that the help tables in the mysql\ndatabase be initialized with help topic information (see\nhttps://dev.mysql.com/doc/refman/8.0/en/server-side-help-support.html).\n\nThe HELP statement searches the help tables for the given search string\nand displays the result of the search. The search string is not\ncase-sensitive.\n\nThe search string can contain the wildcard characters % and _. These\nhave the same meaning as for pattern-matching operations performed with\nthe LIKE operator. For example, HELP \'rep%\' returns a list of topics\nthat begin with rep.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/help.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/help.html'),(698,'USE',51,'Syntax:\nUSE db_name\n\nThe USE statement tells MySQL to use the named database as the default\n(current) database for subsequent statements. This statement requires\nsome privilege for the database or some object within it.\n\nThe named database remains the default until the end of the session or\nanother USE statement is issued:\n\nUSE db1;\nSELECT COUNT(*) FROM mytable;   # selects from db1.mytable\nUSE db2;\nSELECT COUNT(*) FROM mytable;   # selects from db2.mytable\n\nThe database name must be specified on a single line. Newlines in\ndatabase names are not supported.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/use.html\n\n','','https://dev.mysql.com/doc/refman/8.0/en/use.html'),(699,'MERGE',52,'The MERGE storage engine, also known as the MRG_MyISAM engine, is a\ncollection of identical MyISAM tables that can be used as one.\n\"Identical\" means that all tables have identical column data types and\nindex information. You cannot merge MyISAM tables in which the columns\nare listed in a different order, do not have exactly the same data\ntypes in corresponding columns, or have the indexes in different order.\nHowever, any or all of the MyISAM tables can be compressed with\nmyisampack. See\nhttps://dev.mysql.com/doc/refman/8.0/en/myisampack.html. Differences\nbetween tables such as these do not matter:\n\no Names of corresponding columns and indexes can differ.\n\no Comments for tables, columns, and indexes can differ.\n\no Table options such as AVG_ROW_LENGTH, MAX_ROWS, or PACK_KEYS can\n  differ.\n\nURL: https://dev.mysql.com/doc/refman/8.0/en/merge-storage-engine.html\n\n','mysql> CREATE TABLE t1 (\n    ->    a INT NOT NULL AUTO_INCREMENT PRIMARY KEY,\n    ->    message CHAR(20)) ENGINE=MyISAM;\nmysql> CREATE TABLE t2 (\n    ->    a INT NOT NULL AUTO_INCREMENT PRIMARY KEY,\n    ->    message CHAR(20)) ENGINE=MyISAM;\nmysql> INSERT INTO t1 (message) VALUES (\'Testing\'),(\'table\'),(\'t1\');\nmysql> INSERT INTO t2 (message) VALUES (\'Testing\'),(\'table\'),(\'t2\');\nmysql> CREATE TABLE total (\n    ->    a INT NOT NULL AUTO_INCREMENT,\n    ->    message CHAR(20), INDEX(a))\n    ->    ENGINE=MERGE UNION=(t1,t2) INSERT_METHOD=LAST;\n','https://dev.mysql.com/doc/refman/8.0/en/merge-storage-engine.html');
/*!40000 ALTER TABLE `help_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `innodb_index_stats`
--

/*!40000 ALTER TABLE `innodb_index_stats` DISABLE KEYS */;
INSERT  IGNORE INTO `innodb_index_stats` VALUES ('africastalking','bulk_sms_logs','GEN_CLUST_INDEX','2021-09-27 19:22:13','n_diff_pfx01',0,1,'DB_ROW_ID'),('africastalking','bulk_sms_logs','GEN_CLUST_INDEX','2021-09-27 19:22:13','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('africastalking','bulk_sms_logs','GEN_CLUST_INDEX','2021-09-27 19:22:13','size',1,NULL,'Number of pages in the index'),('africastalking','bulk_sms_logs','messageId','2021-09-27 19:22:13','n_diff_pfx01',0,1,'messageId'),('africastalking','bulk_sms_logs','messageId','2021-09-27 19:22:13','n_diff_pfx02',0,1,'messageId,DB_ROW_ID'),('africastalking','bulk_sms_logs','messageId','2021-09-27 19:22:13','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('africastalking','bulk_sms_logs','messageId','2021-09-27 19:22:13','size',1,NULL,'Number of pages in the index'),('africastalking','incoming_sms_log','PRIMARY','2021-10-05 18:10:27','n_diff_pfx01',0,1,'id'),('africastalking','incoming_sms_log','PRIMARY','2021-10-05 18:10:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('africastalking','incoming_sms_log','PRIMARY','2021-10-05 18:10:27','size',1,NULL,'Number of pages in the index'),('africastalking','sent_sms_logs','GEN_CLUST_INDEX','2021-10-05 18:11:00','n_diff_pfx01',0,1,'DB_ROW_ID'),('africastalking','sent_sms_logs','GEN_CLUST_INDEX','2021-10-05 18:11:00','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('africastalking','sent_sms_logs','GEN_CLUST_INDEX','2021-10-05 18:11:00','size',1,NULL,'Number of pages in the index'),('africastalking','sent_sms_logs','messageId','2021-10-05 18:11:00','n_diff_pfx01',0,1,'messageId'),('africastalking','sent_sms_logs','messageId','2021-10-05 18:11:00','n_diff_pfx02',0,1,'messageId,DB_ROW_ID'),('africastalking','sent_sms_logs','messageId','2021-10-05 18:11:00','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('africastalking','sent_sms_logs','messageId','2021-10-05 18:11:00','size',1,NULL,'Number of pages in the index'),('db_betting_moniter','bookmaker','FTS_DOC_ID_INDEX','2019-09-03 08:05:46','n_diff_pfx01',0,1,'FTS_DOC_ID'),('db_betting_moniter','bookmaker','FTS_DOC_ID_INDEX','2019-09-03 08:05:46','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betting_moniter','bookmaker','FTS_DOC_ID_INDEX','2019-09-03 08:05:46','size',1,NULL,'Number of pages in the index'),('db_betting_moniter','bookmaker','IsArchived','2019-09-03 08:05:46','n_diff_pfx01',0,1,'IsArchived'),('db_betting_moniter','bookmaker','IsArchived','2019-09-03 08:05:46','n_diff_pfx02',0,1,'IsArchived,_ID'),('db_betting_moniter','bookmaker','IsArchived','2019-09-03 08:05:46','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betting_moniter','bookmaker','IsArchived','2019-09-03 08:05:46','size',1,NULL,'Number of pages in the index'),('db_betting_moniter','bookmaker','PRIMARY','2019-09-03 08:05:46','n_diff_pfx01',0,1,'_ID'),('db_betting_moniter','bookmaker','PRIMARY','2019-09-03 08:05:46','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betting_moniter','bookmaker','PRIMARY','2019-09-03 08:05:46','size',1,NULL,'Number of pages in the index'),('db_betting_moniter','bookmaker','PayBill','2019-09-03 08:05:46','n_diff_pfx01',0,1,'PayBill'),('db_betting_moniter','bookmaker','PayBill','2019-09-03 08:05:46','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betting_moniter','bookmaker','PayBill','2019-09-03 08:05:46','size',1,NULL,'Number of pages in the index'),('db_betting_moniter','govttaxinformation','Country','2019-09-03 08:05:18','n_diff_pfx01',0,1,'Country'),('db_betting_moniter','govttaxinformation','Country','2019-09-03 08:05:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betting_moniter','govttaxinformation','Country','2019-09-03 08:05:18','size',1,NULL,'Number of pages in the index'),('db_betting_moniter','govttaxinformation','PRIMARY','2019-09-03 08:05:18','n_diff_pfx01',0,1,'_ID'),('db_betting_moniter','govttaxinformation','PRIMARY','2019-09-03 08:05:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betting_moniter','govttaxinformation','PRIMARY','2019-09-03 08:05:18','size',1,NULL,'Number of pages in the index'),('db_betting_moniter','mno','FTS_DOC_ID_INDEX','2019-09-19 12:06:01','n_diff_pfx01',4,1,'FTS_DOC_ID'),('db_betting_moniter','mno','FTS_DOC_ID_INDEX','2019-09-19 12:06:01','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betting_moniter','mno','FTS_DOC_ID_INDEX','2019-09-19 12:06:01','size',1,NULL,'Number of pages in the index'),('db_betting_moniter','mno','IsDeleted','2019-09-19 12:06:01','n_diff_pfx01',1,1,'IsDeleted'),('db_betting_moniter','mno','IsDeleted','2019-09-19 12:06:01','n_diff_pfx02',4,1,'IsDeleted,_ID'),('db_betting_moniter','mno','IsDeleted','2019-09-19 12:06:01','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betting_moniter','mno','IsDeleted','2019-09-19 12:06:01','size',1,NULL,'Number of pages in the index'),('db_betting_moniter','mno','PRIMARY','2019-09-19 12:06:01','n_diff_pfx01',4,1,'_ID'),('db_betting_moniter','mno','PRIMARY','2019-09-19 12:06:01','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betting_moniter','mno','PRIMARY','2019-09-19 12:06:01','size',1,NULL,'Number of pages in the index'),('db_betting_moniter','revenuelog','FTS_DOC_ID_INDEX','2021-10-05 18:07:37','n_diff_pfx01',0,1,'FTS_DOC_ID'),('db_betting_moniter','revenuelog','FTS_DOC_ID_INDEX','2021-10-05 18:07:37','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betting_moniter','revenuelog','FTS_DOC_ID_INDEX','2021-10-05 18:07:37','size',1,NULL,'Number of pages in the index'),('db_betting_moniter','revenuelog','IsArchieved','2021-10-05 18:07:37','n_diff_pfx01',0,1,'IsArchieved'),('db_betting_moniter','revenuelog','IsArchieved','2021-10-05 18:07:37','n_diff_pfx02',0,1,'IsArchieved,_ID'),('db_betting_moniter','revenuelog','IsArchieved','2021-10-05 18:07:37','n_diff_pfx03',0,1,'IsArchieved,_ID,Bookmaker'),('db_betting_moniter','revenuelog','IsArchieved','2021-10-05 18:07:37','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betting_moniter','revenuelog','IsArchieved','2021-10-05 18:07:37','size',1,NULL,'Number of pages in the index'),('db_betting_moniter','revenuelog','PRIMARY','2021-10-05 18:07:37','n_diff_pfx01',0,1,'_ID'),('db_betting_moniter','revenuelog','PRIMARY','2021-10-05 18:07:37','n_diff_pfx02',0,1,'_ID,Bookmaker'),('db_betting_moniter','revenuelog','PRIMARY','2021-10-05 18:07:37','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betting_moniter','revenuelog','PRIMARY','2021-10-05 18:07:37','size',1,NULL,'Number of pages in the index'),('db_betting_moniter','statssummary','PRIMARY','2019-09-19 09:35:35','n_diff_pfx01',0,1,'_ID'),('db_betting_moniter','statssummary','PRIMARY','2019-09-19 09:35:35','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betting_moniter','statssummary','PRIMARY','2019-09-19 09:35:35','size',1,NULL,'Number of pages in the index'),('db_betting_moniter','statssummary_archive','PRIMARY','2019-09-19 09:35:54','n_diff_pfx01',0,1,'_ID'),('db_betting_moniter','statssummary_archive','PRIMARY','2019-09-19 09:35:54','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betting_moniter','statssummary_archive','PRIMARY','2019-09-19 09:35:54','size',1,NULL,'Number of pages in the index'),('db_betvantage','tbl_betconstruct','IsPulled','2021-10-05 18:03:43','n_diff_pfx01',0,1,'IsPulled'),('db_betvantage','tbl_betconstruct','IsPulled','2021-10-05 18:03:43','n_diff_pfx02',0,1,'IsPulled,_ID'),('db_betvantage','tbl_betconstruct','IsPulled','2021-10-05 18:03:43','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage','tbl_betconstruct','IsPulled','2021-10-05 18:03:43','size',1,NULL,'Number of pages in the index'),('db_betvantage','tbl_betconstruct','MSISDN','2021-10-05 18:03:43','n_diff_pfx01',0,1,'MSISDN'),('db_betvantage','tbl_betconstruct','MSISDN','2021-10-05 18:03:43','n_diff_pfx02',0,1,'MSISDN,_ID'),('db_betvantage','tbl_betconstruct','MSISDN','2021-10-05 18:03:43','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage','tbl_betconstruct','MSISDN','2021-10-05 18:03:43','size',1,NULL,'Number of pages in the index'),('db_betvantage','tbl_betconstruct','PRIMARY','2021-10-05 18:03:43','n_diff_pfx01',0,1,'_ID'),('db_betvantage','tbl_betconstruct','PRIMARY','2021-10-05 18:03:43','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage','tbl_betconstruct','PRIMARY','2021-10-05 18:03:43','size',1,NULL,'Number of pages in the index'),('db_betvantage','tbl_betconstruct','TransID','2021-10-05 18:03:43','n_diff_pfx01',0,1,'TransID'),('db_betvantage','tbl_betconstruct','TransID','2021-10-05 18:03:43','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage','tbl_betconstruct','TransID','2021-10-05 18:03:43','size',1,NULL,'Number of pages in the index'),('db_betvantage','tbl_mpesa_transaction_log','IndxArchived','2021-10-05 18:02:30','n_diff_pfx01',0,1,'IsArchived'),('db_betvantage','tbl_mpesa_transaction_log','IndxArchived','2021-10-05 18:02:30','n_diff_pfx02',0,1,'IsArchived,_ID'),('db_betvantage','tbl_mpesa_transaction_log','IndxArchived','2021-10-05 18:02:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage','tbl_mpesa_transaction_log','IndxArchived','2021-10-05 18:02:30','size',1,NULL,'Number of pages in the index'),('db_betvantage','tbl_mpesa_transaction_log','IndxMobile','2021-10-05 18:02:30','n_diff_pfx01',0,1,'MSISDN'),('db_betvantage','tbl_mpesa_transaction_log','IndxMobile','2021-10-05 18:02:30','n_diff_pfx02',0,1,'MSISDN,_ID'),('db_betvantage','tbl_mpesa_transaction_log','IndxMobile','2021-10-05 18:02:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage','tbl_mpesa_transaction_log','IndxMobile','2021-10-05 18:02:30','size',1,NULL,'Number of pages in the index'),('db_betvantage','tbl_mpesa_transaction_log','PRIMARY','2021-10-05 18:02:30','n_diff_pfx01',0,1,'_ID'),('db_betvantage','tbl_mpesa_transaction_log','PRIMARY','2021-10-05 18:02:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage','tbl_mpesa_transaction_log','PRIMARY','2021-10-05 18:02:30','size',1,NULL,'Number of pages in the index'),('db_betvantage','tbl_mpesa_transaction_log','trx_ref','2021-10-05 18:02:30','n_diff_pfx01',0,1,'TransID'),('db_betvantage','tbl_mpesa_transaction_log','trx_ref','2021-10-05 18:02:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage','tbl_mpesa_transaction_log','trx_ref','2021-10-05 18:02:30','size',1,NULL,'Number of pages in the index'),('db_betvantage_promo','tbl_group','PRIMARY','2021-09-23 21:21:26','n_diff_pfx01',2,1,'_id'),('db_betvantage_promo','tbl_group','PRIMARY','2021-09-23 21:21:26','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_promo','tbl_group','PRIMARY','2021-09-23 21:21:26','size',1,NULL,'Number of pages in the index'),('db_betvantage_promo','tbl_heap','msisdn','2020-07-16 21:00:42','n_diff_pfx01',0,1,'msisdn'),('db_betvantage_promo','tbl_heap','msisdn','2020-07-16 21:00:42','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_promo','tbl_heap','msisdn','2020-07-16 21:00:42','size',1,NULL,'Number of pages in the index'),('db_betvantage_promo','tbl_heap','msisdn_unik','2020-07-16 21:00:42','n_diff_pfx01',0,1,'msisdn'),('db_betvantage_promo','tbl_heap','msisdn_unik','2020-07-16 21:00:42','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_promo','tbl_heap','msisdn_unik','2020-07-16 21:00:42','size',1,NULL,'Number of pages in the index'),('db_betvantage_promo','tbl_setup','PRIMARY','2022-08-15 20:37:24','n_diff_pfx01',1,1,'id'),('db_betvantage_promo','tbl_setup','PRIMARY','2022-08-15 20:37:24','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_promo','tbl_setup','PRIMARY','2022-08-15 20:37:24','size',1,NULL,'Number of pages in the index'),('db_betvantage_promo','tbl_setup','lower','2022-08-15 20:37:24','n_diff_pfx01',1,1,'lower'),('db_betvantage_promo','tbl_setup','lower','2022-08-15 20:37:24','n_diff_pfx02',1,1,'lower,id'),('db_betvantage_promo','tbl_setup','lower','2022-08-15 20:37:24','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_promo','tbl_setup','lower','2022-08-15 20:37:24','size',1,NULL,'Number of pages in the index'),('db_betvantage_promo','tbl_setup','processed','2022-08-15 20:37:24','n_diff_pfx01',1,1,'processed'),('db_betvantage_promo','tbl_setup','processed','2022-08-15 20:37:24','n_diff_pfx02',1,1,'processed,id'),('db_betvantage_promo','tbl_setup','processed','2022-08-15 20:37:24','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_promo','tbl_setup','processed','2022-08-15 20:37:24','size',1,NULL,'Number of pages in the index'),('db_betvantage_promo','tbl_setup','upper','2022-08-15 20:37:24','n_diff_pfx01',1,1,'upper'),('db_betvantage_promo','tbl_setup','upper','2022-08-15 20:37:24','n_diff_pfx02',1,1,'upper,id'),('db_betvantage_promo','tbl_setup','upper','2022-08-15 20:37:24','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_promo','tbl_setup','upper','2022-08-15 20:37:24','size',1,NULL,'Number of pages in the index'),('db_betvantage_promo','tbl_setup_temp','PRIMARY','2022-08-15 20:37:32','n_diff_pfx01',0,1,'id'),('db_betvantage_promo','tbl_setup_temp','PRIMARY','2022-08-15 20:37:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_promo','tbl_setup_temp','PRIMARY','2022-08-15 20:37:32','size',1,NULL,'Number of pages in the index'),('db_betvantage_promo','tbl_setup_temp','is_processed','2022-08-15 20:37:32','n_diff_pfx01',0,1,'is_processed'),('db_betvantage_promo','tbl_setup_temp','is_processed','2022-08-15 20:37:32','n_diff_pfx02',0,1,'is_processed,id'),('db_betvantage_promo','tbl_setup_temp','is_processed','2022-08-15 20:37:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_promo','tbl_setup_temp','is_processed','2022-08-15 20:37:32','size',1,NULL,'Number of pages in the index'),('db_betvantage_promo','tbl_setup_temp','rec_id','2022-08-15 20:37:32','n_diff_pfx01',0,1,'rec_id'),('db_betvantage_promo','tbl_setup_temp','rec_id','2022-08-15 20:37:32','n_diff_pfx02',0,1,'rec_id,id'),('db_betvantage_promo','tbl_setup_temp','rec_id','2022-08-15 20:37:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_promo','tbl_setup_temp','rec_id','2022-08-15 20:37:32','size',1,NULL,'Number of pages in the index'),('db_betvantage_promo','tbl_subscription','PRIMARY','2021-10-05 17:58:49','n_diff_pfx01',0,1,'_id'),('db_betvantage_promo','tbl_subscription','PRIMARY','2021-10-05 17:58:49','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_promo','tbl_subscription','PRIMARY','2021-10-05 17:58:49','size',1,NULL,'Number of pages in the index'),('db_betvantage_promo','tbl_subscription','is_active','2021-10-05 17:58:49','n_diff_pfx01',0,1,'is_active'),('db_betvantage_promo','tbl_subscription','is_active','2021-10-05 17:58:49','n_diff_pfx02',0,1,'is_active,_id'),('db_betvantage_promo','tbl_subscription','is_active','2021-10-05 17:58:49','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_promo','tbl_subscription','is_active','2021-10-05 17:58:49','size',1,NULL,'Number of pages in the index'),('db_betvantage_promo','tbl_subscription','msisdn','2021-10-05 17:58:49','n_diff_pfx01',0,1,'msisdn'),('db_betvantage_promo','tbl_subscription','msisdn','2021-10-05 17:58:49','n_diff_pfx02',0,1,'msisdn,_id'),('db_betvantage_promo','tbl_subscription','msisdn','2021-10-05 17:58:49','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_promo','tbl_subscription','msisdn','2021-10-05 17:58:49','size',1,NULL,'Number of pages in the index'),('db_betvantage_promo','tbl_subscription','msisdn_unik','2021-10-05 17:58:49','n_diff_pfx01',0,1,'msisdn'),('db_betvantage_promo','tbl_subscription','msisdn_unik','2021-10-05 17:58:49','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_promo','tbl_subscription','msisdn_unik','2021-10-05 17:58:49','size',1,NULL,'Number of pages in the index'),('db_betvantage_promo','tbl_temp','GEN_CLUST_INDEX','2022-05-31 17:15:15','n_diff_pfx01',0,1,'DB_ROW_ID'),('db_betvantage_promo','tbl_temp','GEN_CLUST_INDEX','2022-05-31 17:15:15','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_promo','tbl_temp','GEN_CLUST_INDEX','2022-05-31 17:15:15','size',1,NULL,'Number of pages in the index'),('db_betvantage_promo','tbl_temp','msisdn','2022-05-31 17:15:15','n_diff_pfx01',0,1,'msisdn'),('db_betvantage_promo','tbl_temp','msisdn','2022-05-31 17:15:15','n_diff_pfx02',0,1,'msisdn,DB_ROW_ID'),('db_betvantage_promo','tbl_temp','msisdn','2022-05-31 17:15:15','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_promo','tbl_temp','msisdn','2022-05-31 17:15:15','size',1,NULL,'Number of pages in the index'),('db_betvantage_wallet','misc','PRIMARY','2021-10-05 17:57:09','n_diff_pfx01',0,1,'ID'),('db_betvantage_wallet','misc','PRIMARY','2021-10-05 17:57:09','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_wallet','misc','PRIMARY','2021-10-05 17:57:09','size',1,NULL,'Number of pages in the index'),('db_betvantage_wallet','tbl_deposit_log','PRIMARY','2019-05-29 13:34:43','n_diff_pfx01',0,1,'deposit_id'),('db_betvantage_wallet','tbl_deposit_log','PRIMARY','2019-05-29 13:34:43','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_wallet','tbl_deposit_log','PRIMARY','2019-05-29 13:34:43','size',1,NULL,'Number of pages in the index'),('db_betvantage_wallet','tbl_deposit_log','transaction_refno','2019-05-29 13:34:43','n_diff_pfx01',0,1,'transaction_refno'),('db_betvantage_wallet','tbl_deposit_log','transaction_refno','2019-05-29 13:34:43','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_wallet','tbl_deposit_log','transaction_refno','2019-05-29 13:34:43','size',1,NULL,'Number of pages in the index'),('db_betvantage_wallet','tbl_expense_trx','PRIMARY','2019-05-15 08:12:23','n_diff_pfx01',0,1,'trx_id'),('db_betvantage_wallet','tbl_expense_trx','PRIMARY','2019-05-15 08:12:23','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_wallet','tbl_expense_trx','PRIMARY','2019-05-15 08:12:23','size',1,NULL,'Number of pages in the index'),('db_betvantage_wallet','tbl_fee_log','PRIMARY','2019-05-15 08:13:24','n_diff_pfx01',0,1,'fee_id'),('db_betvantage_wallet','tbl_fee_log','PRIMARY','2019-05-15 08:13:24','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_wallet','tbl_fee_log','PRIMARY','2019-05-15 08:13:24','size',1,NULL,'Number of pages in the index'),('db_betvantage_wallet','tbl_income_trx','PRIMARY','2019-05-15 08:14:00','n_diff_pfx01',0,1,'trx_id'),('db_betvantage_wallet','tbl_income_trx','PRIMARY','2019-05-15 08:14:00','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_wallet','tbl_income_trx','PRIMARY','2019-05-15 08:14:00','size',1,NULL,'Number of pages in the index'),('db_betvantage_wallet','tbl_incoming_sms','IsProcessed','2021-10-05 17:55:01','n_diff_pfx01',0,1,'IsProcessed'),('db_betvantage_wallet','tbl_incoming_sms','IsProcessed','2021-10-05 17:55:01','n_diff_pfx02',0,1,'IsProcessed,ID'),('db_betvantage_wallet','tbl_incoming_sms','IsProcessed','2021-10-05 17:55:01','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_wallet','tbl_incoming_sms','IsProcessed','2021-10-05 17:55:01','size',1,NULL,'Number of pages in the index'),('db_betvantage_wallet','tbl_incoming_sms','MSISDN','2021-10-05 17:55:01','n_diff_pfx01',0,1,'MSISDN'),('db_betvantage_wallet','tbl_incoming_sms','MSISDN','2021-10-05 17:55:01','n_diff_pfx02',0,1,'MSISDN,ID'),('db_betvantage_wallet','tbl_incoming_sms','MSISDN','2021-10-05 17:55:01','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_wallet','tbl_incoming_sms','MSISDN','2021-10-05 17:55:01','size',1,NULL,'Number of pages in the index'),('db_betvantage_wallet','tbl_incoming_sms','PRIMARY','2021-10-05 17:55:01','n_diff_pfx01',0,1,'ID'),('db_betvantage_wallet','tbl_incoming_sms','PRIMARY','2021-10-05 17:55:01','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_wallet','tbl_incoming_sms','PRIMARY','2021-10-05 17:55:01','size',1,NULL,'Number of pages in the index'),('db_betvantage_wallet','tbl_incoming_sms','ShortCode','2021-10-05 17:55:01','n_diff_pfx01',0,1,'ShortCode'),('db_betvantage_wallet','tbl_incoming_sms','ShortCode','2021-10-05 17:55:01','n_diff_pfx02',0,1,'ShortCode,ID'),('db_betvantage_wallet','tbl_incoming_sms','ShortCode','2021-10-05 17:55:01','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_wallet','tbl_incoming_sms','ShortCode','2021-10-05 17:55:01','size',1,NULL,'Number of pages in the index'),('db_betvantage_wallet','tbl_outgoing_sms','Destination','2021-10-05 17:54:25','n_diff_pfx01',0,1,'Destination'),('db_betvantage_wallet','tbl_outgoing_sms','Destination','2021-10-05 17:54:25','n_diff_pfx02',0,1,'Destination,ID'),('db_betvantage_wallet','tbl_outgoing_sms','Destination','2021-10-05 17:54:25','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_wallet','tbl_outgoing_sms','Destination','2021-10-05 17:54:25','size',1,NULL,'Number of pages in the index'),('db_betvantage_wallet','tbl_outgoing_sms','IsProcessed','2021-10-05 17:54:25','n_diff_pfx01',0,1,'IsProcessed'),('db_betvantage_wallet','tbl_outgoing_sms','IsProcessed','2021-10-05 17:54:25','n_diff_pfx02',0,1,'IsProcessed,ID'),('db_betvantage_wallet','tbl_outgoing_sms','IsProcessed','2021-10-05 17:54:25','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_wallet','tbl_outgoing_sms','IsProcessed','2021-10-05 17:54:25','size',1,NULL,'Number of pages in the index'),('db_betvantage_wallet','tbl_outgoing_sms','PRIMARY','2021-10-05 17:54:25','n_diff_pfx01',0,1,'ID'),('db_betvantage_wallet','tbl_outgoing_sms','PRIMARY','2021-10-05 17:54:25','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_wallet','tbl_outgoing_sms','PRIMARY','2021-10-05 17:54:25','size',1,NULL,'Number of pages in the index'),('db_betvantage_wallet','tbl_outgoing_sms','Source','2021-10-05 17:54:25','n_diff_pfx01',0,1,'Source'),('db_betvantage_wallet','tbl_outgoing_sms','Source','2021-10-05 17:54:25','n_diff_pfx02',0,1,'Source,ID'),('db_betvantage_wallet','tbl_outgoing_sms','Source','2021-10-05 17:54:25','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_wallet','tbl_outgoing_sms','Source','2021-10-05 17:54:25','size',1,NULL,'Number of pages in the index'),('db_betvantage_wallet','tbl_stake_collection_trx','PRIMARY','2019-05-15 08:15:59','n_diff_pfx01',0,1,'trx_id'),('db_betvantage_wallet','tbl_stake_collection_trx','PRIMARY','2019-05-15 08:15:59','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_wallet','tbl_stake_collection_trx','PRIMARY','2019-05-15 08:15:59','size',1,NULL,'Number of pages in the index'),('db_betvantage_wallet','tbl_system_log','PRIMARY','2019-05-15 08:16:33','n_diff_pfx01',0,1,'log_id'),('db_betvantage_wallet','tbl_system_log','PRIMARY','2019-05-15 08:16:33','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_wallet','tbl_system_log','PRIMARY','2019-05-15 08:16:33','size',1,NULL,'Number of pages in the index'),('db_betvantage_wallet','tbl_wallet','INDEX_MSISDN','2021-10-05 17:52:57','n_diff_pfx01',0,1,'MSISDN'),('db_betvantage_wallet','tbl_wallet','INDEX_MSISDN','2021-10-05 17:52:57','n_diff_pfx02',0,1,'MSISDN,ID'),('db_betvantage_wallet','tbl_wallet','INDEX_MSISDN','2021-10-05 17:52:57','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_wallet','tbl_wallet','INDEX_MSISDN','2021-10-05 17:52:57','size',1,NULL,'Number of pages in the index'),('db_betvantage_wallet','tbl_wallet','IsLocked','2021-10-05 17:52:57','n_diff_pfx01',0,1,'IsLocked'),('db_betvantage_wallet','tbl_wallet','IsLocked','2021-10-05 17:52:57','n_diff_pfx02',0,1,'IsLocked,ID'),('db_betvantage_wallet','tbl_wallet','IsLocked','2021-10-05 17:52:57','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_wallet','tbl_wallet','IsLocked','2021-10-05 17:52:57','size',1,NULL,'Number of pages in the index'),('db_betvantage_wallet','tbl_wallet','PRIMARY','2021-10-05 17:52:57','n_diff_pfx01',0,1,'ID'),('db_betvantage_wallet','tbl_wallet','PRIMARY','2021-10-05 17:52:57','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_wallet','tbl_wallet','PRIMARY','2021-10-05 17:52:57','size',1,NULL,'Number of pages in the index'),('db_betvantage_wallet','tbl_wallet','msisdn','2021-10-05 17:52:57','n_diff_pfx01',0,1,'MSISDN'),('db_betvantage_wallet','tbl_wallet','msisdn','2021-10-05 17:52:57','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_wallet','tbl_wallet','msisdn','2021-10-05 17:52:57','size',1,NULL,'Number of pages in the index'),('db_betvantage_wallet','tbl_wallet_ext','PRIMARY','2021-10-05 17:52:37','n_diff_pfx01',0,1,'_ID'),('db_betvantage_wallet','tbl_wallet_ext','PRIMARY','2021-10-05 17:52:37','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_wallet','tbl_wallet_ext','PRIMARY','2021-10-05 17:52:37','size',1,NULL,'Number of pages in the index'),('db_betvantage_wallet','tbl_wallet_ext','Password','2021-10-05 17:52:37','n_diff_pfx01',0,1,'Password'),('db_betvantage_wallet','tbl_wallet_ext','Password','2021-10-05 17:52:37','n_diff_pfx02',0,1,'Password,_ID'),('db_betvantage_wallet','tbl_wallet_ext','Password','2021-10-05 17:52:37','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_wallet','tbl_wallet_ext','Password','2021-10-05 17:52:37','size',1,NULL,'Number of pages in the index'),('db_betvantage_wallet','tbl_wallet_ext','msisdn','2021-10-05 17:52:37','n_diff_pfx01',0,1,'MSISDN'),('db_betvantage_wallet','tbl_wallet_ext','msisdn','2021-10-05 17:52:37','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_wallet','tbl_wallet_ext','msisdn','2021-10-05 17:52:37','size',1,NULL,'Number of pages in the index'),('db_betvantage_wallet','tbl_wallet_trx','PRIMARY','2019-05-15 08:22:39','n_diff_pfx01',0,1,'trx_id'),('db_betvantage_wallet','tbl_wallet_trx','PRIMARY','2019-05-15 08:22:39','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_wallet','tbl_wallet_trx','PRIMARY','2019-05-15 08:22:39','size',1,NULL,'Number of pages in the index'),('db_betvantage_wallet','tbl_withdrawal_log','PRIMARY','2019-05-29 13:15:36','n_diff_pfx01',0,1,'withdrawal_id'),('db_betvantage_wallet','tbl_withdrawal_log','PRIMARY','2019-05-29 13:15:36','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_betvantage_wallet','tbl_withdrawal_log','PRIMARY','2019-05-29 13:15:36','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_activity_log','PRIMARY','2022-10-18 09:00:22','n_diff_pfx01',26,1,'_id'),('db_freknur_general','tbl_activity_log','PRIMARY','2022-10-18 09:00:22','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_activity_log','PRIMARY','2022-10-18 09:00:22','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_activity_log','flag','2022-10-18 09:00:22','n_diff_pfx01',1,1,'flag'),('db_freknur_general','tbl_activity_log','flag','2022-10-18 09:00:22','n_diff_pfx02',26,1,'flag,_id'),('db_freknur_general','tbl_activity_log','flag','2022-10-18 09:00:22','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_activity_log','flag','2022-10-18 09:00:22','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_activity_log','msisdn','2022-10-18 09:00:22','n_diff_pfx01',2,1,'msisdn'),('db_freknur_general','tbl_activity_log','msisdn','2022-10-18 09:00:22','n_diff_pfx02',26,1,'msisdn,_id'),('db_freknur_general','tbl_activity_log','msisdn','2022-10-18 09:00:22','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_activity_log','msisdn','2022-10-18 09:00:22','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_debtor','PRIMARY','2022-09-29 13:16:23','n_diff_pfx01',0,1,'id'),('db_freknur_general','tbl_debtor','PRIMARY','2022-09-29 13:16:23','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_debtor','PRIMARY','2022-09-29 13:16:23','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_debtor','is_archived','2022-09-29 13:16:23','n_diff_pfx01',0,1,'is_archived'),('db_freknur_general','tbl_debtor','is_archived','2022-09-29 13:16:23','n_diff_pfx02',0,1,'is_archived,id'),('db_freknur_general','tbl_debtor','is_archived','2022-09-29 13:16:23','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_debtor','is_archived','2022-09-29 13:16:23','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_debtor','is_repaid','2022-09-29 13:16:23','n_diff_pfx01',0,1,'is_repaid'),('db_freknur_general','tbl_debtor','is_repaid','2022-09-29 13:16:23','n_diff_pfx02',0,1,'is_repaid,id'),('db_freknur_general','tbl_debtor','is_repaid','2022-09-29 13:16:23','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_debtor','is_repaid','2022-09-29 13:16:23','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_debtor','msisdn','2022-09-29 13:16:23','n_diff_pfx01',0,1,'msisdn'),('db_freknur_general','tbl_debtor','msisdn','2022-09-29 13:16:23','n_diff_pfx02',0,1,'msisdn,id'),('db_freknur_general','tbl_debtor','msisdn','2022-09-29 13:16:23','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_debtor','msisdn','2022-09-29 13:16:23','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_debtor','reference_no','2022-09-29 13:16:23','n_diff_pfx01',0,1,'reference_no'),('db_freknur_general','tbl_debtor','reference_no','2022-09-29 13:16:23','n_diff_pfx02',0,1,'reference_no,id'),('db_freknur_general','tbl_debtor','reference_no','2022-09-29 13:16:23','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_debtor','reference_no','2022-09-29 13:16:23','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_debtor','reference_unik','2022-09-29 13:16:23','n_diff_pfx01',0,1,'reference_no'),('db_freknur_general','tbl_debtor','reference_unik','2022-09-29 13:16:23','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_debtor','reference_unik','2022-09-29 13:16:23','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_defaulter','PRIMARY','2022-09-29 13:16:34','n_diff_pfx01',0,1,'id'),('db_freknur_general','tbl_defaulter','PRIMARY','2022-09-29 13:16:34','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_defaulter','PRIMARY','2022-09-29 13:16:34','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_defaulter','is_archived','2022-09-29 13:16:34','n_diff_pfx01',0,1,'is_archived'),('db_freknur_general','tbl_defaulter','is_archived','2022-09-29 13:16:34','n_diff_pfx02',0,1,'is_archived,id'),('db_freknur_general','tbl_defaulter','is_archived','2022-09-29 13:16:34','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_defaulter','is_archived','2022-09-29 13:16:34','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_defaulter','msisdn','2022-09-29 13:16:34','n_diff_pfx01',0,1,'msisdn'),('db_freknur_general','tbl_defaulter','msisdn','2022-09-29 13:16:34','n_diff_pfx02',0,1,'msisdn,id'),('db_freknur_general','tbl_defaulter','msisdn','2022-09-29 13:16:34','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_defaulter','msisdn','2022-09-29 13:16:34','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_loan_collateral','PRIMARY','2022-09-30 14:44:49','n_diff_pfx01',0,1,'_id'),('db_freknur_general','tbl_loan_collateral','PRIMARY','2022-09-30 14:44:49','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_loan_collateral','PRIMARY','2022-09-30 14:44:49','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_loan_collateral','is_reverted','2022-09-30 14:44:49','n_diff_pfx01',0,1,'is_processed'),('db_freknur_general','tbl_loan_collateral','is_reverted','2022-09-30 14:44:49','n_diff_pfx02',0,1,'is_processed,_id'),('db_freknur_general','tbl_loan_collateral','is_reverted','2022-09-30 14:44:49','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_loan_collateral','is_reverted','2022-09-30 14:44:49','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_loan_collateral','msisdn','2022-09-30 14:44:49','n_diff_pfx01',0,1,'msisdn'),('db_freknur_general','tbl_loan_collateral','msisdn','2022-09-30 14:44:49','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_loan_collateral','msisdn','2022-09-30 14:44:49','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_loan_repayment','PRIMARY','2022-09-29 13:16:51','n_diff_pfx01',0,1,'id'),('db_freknur_general','tbl_loan_repayment','PRIMARY','2022-09-29 13:16:51','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_loan_repayment','PRIMARY','2022-09-29 13:16:51','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_loan_repayment','is_processed','2022-09-29 13:16:51','n_diff_pfx01',0,1,'is_processed'),('db_freknur_general','tbl_loan_repayment','is_processed','2022-09-29 13:16:51','n_diff_pfx02',0,1,'is_processed,id'),('db_freknur_general','tbl_loan_repayment','is_processed','2022-09-29 13:16:51','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_loan_repayment','is_processed','2022-09-29 13:16:51','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_loan_repayment','msisdn','2022-09-29 13:16:51','n_diff_pfx01',0,1,'msisdn'),('db_freknur_general','tbl_loan_repayment','msisdn','2022-09-29 13:16:51','n_diff_pfx02',0,1,'msisdn,id'),('db_freknur_general','tbl_loan_repayment','msisdn','2022-09-29 13:16:51','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_loan_repayment','msisdn','2022-09-29 13:16:51','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_loan_repayment','transaction_no','2022-09-29 13:16:51','n_diff_pfx01',0,1,'transaction_no'),('db_freknur_general','tbl_loan_repayment','transaction_no','2022-09-29 13:16:51','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_loan_repayment','transaction_no','2022-09-29 13:16:51','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_loan_repayment','trxunik','2022-09-29 13:16:51','n_diff_pfx01',0,1,'transaction_no'),('db_freknur_general','tbl_loan_repayment','trxunik','2022-09-29 13:16:51','n_diff_pfx02',0,1,'transaction_no,id'),('db_freknur_general','tbl_loan_repayment','trxunik','2022-09-29 13:16:51','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_loan_repayment','trxunik','2022-09-29 13:16:51','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_loan_request','PRIMARY','2021-10-05 17:43:45','n_diff_pfx01',0,1,'id'),('db_freknur_general','tbl_loan_request','PRIMARY','2021-10-05 17:43:45','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_loan_request','PRIMARY','2021-10-05 17:43:45','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_loan_request','has_collateral','2021-10-05 17:43:45','n_diff_pfx01',0,1,'has_collateral'),('db_freknur_general','tbl_loan_request','has_collateral','2021-10-05 17:43:45','n_diff_pfx02',0,1,'has_collateral,id'),('db_freknur_general','tbl_loan_request','has_collateral','2021-10-05 17:43:45','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_loan_request','has_collateral','2021-10-05 17:43:45','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_loan_request','is_processed','2021-10-05 17:43:45','n_diff_pfx01',0,1,'is_processed'),('db_freknur_general','tbl_loan_request','is_processed','2021-10-05 17:43:45','n_diff_pfx02',0,1,'is_processed,id'),('db_freknur_general','tbl_loan_request','is_processed','2021-10-05 17:43:45','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_loan_request','is_processed','2021-10-05 17:43:45','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_loan_request','msisdn','2021-10-05 17:43:45','n_diff_pfx01',0,1,'msisdn'),('db_freknur_general','tbl_loan_request','msisdn','2021-10-05 17:43:45','n_diff_pfx02',0,1,'msisdn,id'),('db_freknur_general','tbl_loan_request','msisdn','2021-10-05 17:43:45','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_loan_request','msisdn','2021-10-05 17:43:45','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_loan_request','msisdn_unik','2021-10-05 17:43:45','n_diff_pfx01',0,1,'msisdn'),('db_freknur_general','tbl_loan_request','msisdn_unik','2021-10-05 17:43:45','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_loan_request','msisdn_unik','2021-10-05 17:43:45','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_loan_request','ref_no','2021-10-05 17:43:45','n_diff_pfx01',0,1,'reference_no'),('db_freknur_general','tbl_loan_request','ref_no','2021-10-05 17:43:45','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_loan_request','ref_no','2021-10-05 17:43:45','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_mpesa_receipt','PRIMARY','2022-09-23 14:08:29','n_diff_pfx01',2,1,'id'),('db_freknur_general','tbl_mpesa_receipt','PRIMARY','2022-09-23 14:08:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_mpesa_receipt','PRIMARY','2022-09-23 14:08:29','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_mpesa_receipt','is_archived','2022-09-23 14:08:29','n_diff_pfx01',1,1,'is_archived'),('db_freknur_general','tbl_mpesa_receipt','is_archived','2022-09-23 14:08:29','n_diff_pfx02',2,1,'is_archived,id'),('db_freknur_general','tbl_mpesa_receipt','is_archived','2022-09-23 14:08:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_mpesa_receipt','is_archived','2022-09-23 14:08:29','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_mpesa_receipt','msisdn','2022-09-23 14:08:29','n_diff_pfx01',1,1,'msisdn'),('db_freknur_general','tbl_mpesa_receipt','msisdn','2022-09-23 14:08:29','n_diff_pfx02',2,1,'msisdn,id'),('db_freknur_general','tbl_mpesa_receipt','msisdn','2022-09-23 14:08:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_mpesa_receipt','msisdn','2022-09-23 14:08:29','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_mpesa_receipt','reference_no','2022-09-23 14:08:29','n_diff_pfx01',2,1,'reference_no'),('db_freknur_general','tbl_mpesa_receipt','reference_no','2022-09-23 14:08:29','n_diff_pfx02',2,1,'reference_no,id'),('db_freknur_general','tbl_mpesa_receipt','reference_no','2022-09-23 14:08:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_mpesa_receipt','reference_no','2022-09-23 14:08:29','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_mpesa_receipt','reference_unik','2022-09-23 14:08:29','n_diff_pfx01',2,1,'reference_no'),('db_freknur_general','tbl_mpesa_receipt','reference_unik','2022-09-23 14:08:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_mpesa_receipt','reference_unik','2022-09-23 14:08:29','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_notification','PRIMARY','2022-10-16 01:55:42','n_diff_pfx01',43,1,'id'),('db_freknur_general','tbl_notification','PRIMARY','2022-10-16 01:55:42','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_notification','PRIMARY','2022-10-16 01:55:42','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_notification','category','2022-10-16 01:55:42','n_diff_pfx01',3,1,'category'),('db_freknur_general','tbl_notification','category','2022-10-16 01:55:42','n_diff_pfx02',43,1,'category,id'),('db_freknur_general','tbl_notification','category','2022-10-16 01:55:42','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_notification','category','2022-10-16 01:55:42','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_notification','is_downloaded','2022-10-16 01:55:42','n_diff_pfx01',1,1,'is_downloaded'),('db_freknur_general','tbl_notification','is_downloaded','2022-10-16 01:55:42','n_diff_pfx02',43,1,'is_downloaded,id'),('db_freknur_general','tbl_notification','is_downloaded','2022-10-16 01:55:42','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_notification','is_downloaded','2022-10-16 01:55:42','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_notification','msisdn','2022-10-16 01:55:42','n_diff_pfx01',7,1,'msisdn'),('db_freknur_general','tbl_notification','msisdn','2022-10-16 01:55:42','n_diff_pfx02',43,1,'msisdn,id'),('db_freknur_general','tbl_notification','msisdn','2022-10-16 01:55:42','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_notification','msisdn','2022-10-16 01:55:42','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_notification','uid','2022-10-16 01:55:42','n_diff_pfx01',43,1,'uid'),('db_freknur_general','tbl_notification','uid','2022-10-16 01:55:42','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_notification','uid','2022-10-16 01:55:42','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_owner_portfolio_temp_list','PRIMARY','2022-09-30 14:41:01','n_diff_pfx01',0,1,'_id'),('db_freknur_general','tbl_owner_portfolio_temp_list','PRIMARY','2022-09-30 14:41:01','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_owner_portfolio_temp_list','PRIMARY','2022-09-30 14:41:01','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_owner_portfolio_temp_list','asset_id_indx','2022-09-30 14:41:01','n_diff_pfx01',0,1,'asset_id'),('db_freknur_general','tbl_owner_portfolio_temp_list','asset_id_indx','2022-09-30 14:41:01','n_diff_pfx02',0,1,'asset_id,_id'),('db_freknur_general','tbl_owner_portfolio_temp_list','asset_id_indx','2022-09-30 14:41:01','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_owner_portfolio_temp_list','asset_id_indx','2022-09-30 14:41:01','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_owner_portfolio_temp_list','is_active_indx','2022-09-30 14:41:01','n_diff_pfx01',0,1,'is_active'),('db_freknur_general','tbl_owner_portfolio_temp_list','is_active_indx','2022-09-30 14:41:01','n_diff_pfx02',0,1,'is_active,_id'),('db_freknur_general','tbl_owner_portfolio_temp_list','is_active_indx','2022-09-30 14:41:01','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_owner_portfolio_temp_list','is_active_indx','2022-09-30 14:41:01','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_owner_portfolio_temp_list','msisdn_indx','2022-09-30 14:41:01','n_diff_pfx01',0,1,'msisdn'),('db_freknur_general','tbl_owner_portfolio_temp_list','msisdn_indx','2022-09-30 14:41:01','n_diff_pfx02',0,1,'msisdn,_id'),('db_freknur_general','tbl_owner_portfolio_temp_list','msisdn_indx','2022-09-30 14:41:01','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_owner_portfolio_temp_list','msisdn_indx','2022-09-30 14:41:01','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_transaction','PRIMARY','2022-09-30 14:42:23','n_diff_pfx01',0,1,'id'),('db_freknur_general','tbl_transaction','PRIMARY','2022-09-30 14:42:23','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_transaction','PRIMARY','2022-09-30 14:42:23','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_transaction','account_id','2022-09-30 14:42:23','n_diff_pfx01',0,1,'account_code'),('db_freknur_general','tbl_transaction','account_id','2022-09-30 14:42:23','n_diff_pfx02',0,1,'account_code,id'),('db_freknur_general','tbl_transaction','account_id','2022-09-30 14:42:23','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_transaction','account_id','2022-09-30 14:42:23','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_transaction','is_archived','2022-09-30 14:42:23','n_diff_pfx01',0,1,'is_archived'),('db_freknur_general','tbl_transaction','is_archived','2022-09-30 14:42:23','n_diff_pfx02',0,1,'is_archived,id'),('db_freknur_general','tbl_transaction','is_archived','2022-09-30 14:42:23','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_transaction','is_archived','2022-09-30 14:42:23','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_transaction','msisdn','2022-09-30 14:42:23','n_diff_pfx01',0,1,'msisdn'),('db_freknur_general','tbl_transaction','msisdn','2022-09-30 14:42:23','n_diff_pfx02',0,1,'msisdn,id'),('db_freknur_general','tbl_transaction','msisdn','2022-09-30 14:42:23','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_transaction','msisdn','2022-09-30 14:42:23','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_transaction','reference_no','2022-09-30 14:42:23','n_diff_pfx01',0,1,'reference_no'),('db_freknur_general','tbl_transaction','reference_no','2022-09-30 14:42:23','n_diff_pfx02',0,1,'reference_no,id'),('db_freknur_general','tbl_transaction','reference_no','2022-09-30 14:42:23','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_transaction','reference_no','2022-09-30 14:42:23','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_wallet_transaction','PRIMARY','2022-09-30 14:31:06','n_diff_pfx01',0,1,'id'),('db_freknur_general','tbl_wallet_transaction','PRIMARY','2022-09-30 14:31:06','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_wallet_transaction','PRIMARY','2022-09-30 14:31:06','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_wallet_transaction','is_archived','2022-09-30 14:31:06','n_diff_pfx01',0,1,'is_archived'),('db_freknur_general','tbl_wallet_transaction','is_archived','2022-09-30 14:31:06','n_diff_pfx02',0,1,'is_archived,id'),('db_freknur_general','tbl_wallet_transaction','is_archived','2022-09-30 14:31:06','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_wallet_transaction','is_archived','2022-09-30 14:31:06','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_wallet_transaction','msisdn','2022-09-30 14:31:06','n_diff_pfx01',0,1,'msisdn'),('db_freknur_general','tbl_wallet_transaction','msisdn','2022-09-30 14:31:06','n_diff_pfx02',0,1,'msisdn,id'),('db_freknur_general','tbl_wallet_transaction','msisdn','2022-09-30 14:31:06','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_wallet_transaction','msisdn','2022-09-30 14:31:06','size',1,NULL,'Number of pages in the index'),('db_freknur_general','tbl_wallet_transaction','reference_no','2022-09-30 14:31:06','n_diff_pfx01',0,1,'reference_no'),('db_freknur_general','tbl_wallet_transaction','reference_no','2022-09-30 14:31:06','n_diff_pfx02',0,1,'reference_no,id'),('db_freknur_general','tbl_wallet_transaction','reference_no','2022-09-30 14:31:06','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_general','tbl_wallet_transaction','reference_no','2022-09-30 14:31:06','size',1,NULL,'Number of pages in the index'),('db_freknur_inventory','tbl_inventory','PRIMARY','2021-04-29 21:30:42','n_diff_pfx01',25,1,'_id'),('db_freknur_inventory','tbl_inventory','PRIMARY','2021-04-29 21:30:42','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_inventory','tbl_inventory','PRIMARY','2021-04-29 21:30:42','size',1,NULL,'Number of pages in the index'),('db_freknur_inventory','tbl_inventory','is_available','2021-04-29 21:30:42','n_diff_pfx01',1,1,'is_available'),('db_freknur_inventory','tbl_inventory','is_available','2021-04-29 21:30:42','n_diff_pfx02',25,1,'is_available,_id'),('db_freknur_inventory','tbl_inventory','is_available','2021-04-29 21:30:42','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_inventory','tbl_inventory','is_available','2021-04-29 21:30:42','size',1,NULL,'Number of pages in the index'),('db_freknur_inventory','tbl_inventory','item_uid','2021-04-29 21:30:42','n_diff_pfx01',25,1,'item_uid'),('db_freknur_inventory','tbl_inventory','item_uid','2021-04-29 21:30:42','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_inventory','tbl_inventory','item_uid','2021-04-29 21:30:42','size',1,NULL,'Number of pages in the index'),('db_freknur_inventory','tbl_sales','PRIMARY','2021-04-14 22:14:45','n_diff_pfx01',0,1,'_id'),('db_freknur_inventory','tbl_sales','PRIMARY','2021-04-14 22:14:45','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_inventory','tbl_sales','PRIMARY','2021-04-14 22:14:45','size',1,NULL,'Number of pages in the index'),('db_freknur_inventory','tbl_sales','is_archived','2021-04-14 22:14:45','n_diff_pfx01',0,1,'is_archived'),('db_freknur_inventory','tbl_sales','is_archived','2021-04-14 22:14:45','n_diff_pfx02',0,1,'is_archived,_id'),('db_freknur_inventory','tbl_sales','is_archived','2021-04-14 22:14:45','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_inventory','tbl_sales','is_archived','2021-04-14 22:14:45','size',1,NULL,'Number of pages in the index'),('db_freknur_inventory','tbl_sales','product_uid','2021-04-14 22:14:45','n_diff_pfx01',0,1,'product_uid'),('db_freknur_inventory','tbl_sales','product_uid','2021-04-14 22:14:45','n_diff_pfx02',0,1,'product_uid,_id'),('db_freknur_inventory','tbl_sales','product_uid','2021-04-14 22:14:45','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_inventory','tbl_sales','product_uid','2021-04-14 22:14:45','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_account','PRIMARY','2022-09-23 15:20:48','n_diff_pfx01',3,1,'id'),('db_freknur_investment','tbl_account','PRIMARY','2022-09-23 15:20:48','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_account','PRIMARY','2022-09-23 15:20:48','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_account','account_unik','2022-09-23 15:20:48','n_diff_pfx01',3,1,'account_code'),('db_freknur_investment','tbl_account','account_unik','2022-09-23 15:20:48','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_account','account_unik','2022-09-23 15:20:48','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_account','bank_id','2022-09-23 15:20:48','n_diff_pfx01',3,1,'account_code'),('db_freknur_investment','tbl_account','bank_id','2022-09-23 15:20:48','n_diff_pfx02',3,1,'account_code,id'),('db_freknur_investment','tbl_account','bank_id','2022-09-23 15:20:48','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_account','bank_id','2022-09-23 15:20:48','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_alternate_market_bid','PRIMARY','2022-09-30 14:25:45','n_diff_pfx01',0,1,'_id'),('db_freknur_investment','tbl_alternate_market_bid','PRIMARY','2022-09-30 14:25:45','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_alternate_market_bid','PRIMARY','2022-09-30 14:25:45','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_alternate_market_bid','asset_id','2022-09-30 14:25:45','n_diff_pfx01',0,1,'asset_id'),('db_freknur_investment','tbl_alternate_market_bid','asset_id','2022-09-30 14:25:45','n_diff_pfx02',0,1,'asset_id,_id'),('db_freknur_investment','tbl_alternate_market_bid','asset_id','2022-09-30 14:25:45','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_alternate_market_bid','asset_id','2022-09-30 14:25:45','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_alternate_market_bid','is_processed','2022-09-30 14:25:45','n_diff_pfx01',0,1,'is_processed'),('db_freknur_investment','tbl_alternate_market_bid','is_processed','2022-09-30 14:25:45','n_diff_pfx02',0,1,'is_processed,_id'),('db_freknur_investment','tbl_alternate_market_bid','is_processed','2022-09-30 14:25:45','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_alternate_market_bid','is_processed','2022-09-30 14:25:45','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_alternate_market_bid','msisdn','2022-09-30 14:25:45','n_diff_pfx01',0,1,'msisdn'),('db_freknur_investment','tbl_alternate_market_bid','msisdn','2022-09-30 14:25:45','n_diff_pfx02',0,1,'msisdn,_id'),('db_freknur_investment','tbl_alternate_market_bid','msisdn','2022-09-30 14:25:45','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_alternate_market_bid','msisdn','2022-09-30 14:25:45','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_owner_portfolio','PRIMARY','2022-10-11 13:25:34','n_diff_pfx01',2,1,'_id'),('db_freknur_investment','tbl_owner_portfolio','PRIMARY','2022-10-11 13:25:34','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_owner_portfolio','PRIMARY','2022-10-11 13:25:34','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_owner_portfolio','asset_id_indx','2022-10-11 13:25:34','n_diff_pfx01',1,1,'asset_id'),('db_freknur_investment','tbl_owner_portfolio','asset_id_indx','2022-10-11 13:25:34','n_diff_pfx02',2,1,'asset_id,_id'),('db_freknur_investment','tbl_owner_portfolio','asset_id_indx','2022-10-11 13:25:34','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_owner_portfolio','asset_id_indx','2022-10-11 13:25:34','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_owner_portfolio','is_active_indx','2022-10-11 13:25:34','n_diff_pfx01',1,1,'is_active'),('db_freknur_investment','tbl_owner_portfolio','is_active_indx','2022-10-11 13:25:34','n_diff_pfx02',2,1,'is_active,_id'),('db_freknur_investment','tbl_owner_portfolio','is_active_indx','2022-10-11 13:25:34','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_owner_portfolio','is_active_indx','2022-10-11 13:25:34','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_owner_portfolio','msisdn_indx','2022-10-11 13:25:34','n_diff_pfx01',2,1,'msisdn'),('db_freknur_investment','tbl_owner_portfolio','msisdn_indx','2022-10-11 13:25:34','n_diff_pfx02',2,1,'msisdn,_id'),('db_freknur_investment','tbl_owner_portfolio','msisdn_indx','2022-10-11 13:25:34','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_owner_portfolio','msisdn_indx','2022-10-11 13:25:34','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_owner_portfolio_backup','PRIMARY','2022-09-30 14:23:41','n_diff_pfx01',0,1,'_id'),('db_freknur_investment','tbl_owner_portfolio_backup','PRIMARY','2022-09-30 14:23:41','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_owner_portfolio_backup','PRIMARY','2022-09-30 14:23:41','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_owner_portfolio_backup','asset_id_indx','2022-09-30 14:23:41','n_diff_pfx01',0,1,'asset_id'),('db_freknur_investment','tbl_owner_portfolio_backup','asset_id_indx','2022-09-30 14:23:41','n_diff_pfx02',0,1,'asset_id,_id'),('db_freknur_investment','tbl_owner_portfolio_backup','asset_id_indx','2022-09-30 14:23:41','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_owner_portfolio_backup','asset_id_indx','2022-09-30 14:23:41','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_owner_portfolio_backup','is_active_indx','2022-09-30 14:23:41','n_diff_pfx01',0,1,'is_active'),('db_freknur_investment','tbl_owner_portfolio_backup','is_active_indx','2022-09-30 14:23:41','n_diff_pfx02',0,1,'is_active,_id'),('db_freknur_investment','tbl_owner_portfolio_backup','is_active_indx','2022-09-30 14:23:41','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_owner_portfolio_backup','is_active_indx','2022-09-30 14:23:41','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_owner_portfolio_backup','msisdn_indx','2022-09-30 14:23:41','n_diff_pfx01',0,1,'msisdn'),('db_freknur_investment','tbl_owner_portfolio_backup','msisdn_indx','2022-09-30 14:23:41','n_diff_pfx02',0,1,'msisdn,_id'),('db_freknur_investment','tbl_owner_portfolio_backup','msisdn_indx','2022-09-30 14:23:41','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_owner_portfolio_backup','msisdn_indx','2022-09-30 14:23:41','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_owner_portfolio_temp_list','PRIMARY','2022-10-11 13:25:44','n_diff_pfx01',2,1,'_id'),('db_freknur_investment','tbl_owner_portfolio_temp_list','PRIMARY','2022-10-11 13:25:44','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_owner_portfolio_temp_list','PRIMARY','2022-10-11 13:25:44','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_owner_portfolio_temp_list','asset_id_indx','2022-10-11 13:25:44','n_diff_pfx01',1,1,'asset_id'),('db_freknur_investment','tbl_owner_portfolio_temp_list','asset_id_indx','2022-10-11 13:25:44','n_diff_pfx02',2,1,'asset_id,_id'),('db_freknur_investment','tbl_owner_portfolio_temp_list','asset_id_indx','2022-10-11 13:25:44','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_owner_portfolio_temp_list','asset_id_indx','2022-10-11 13:25:44','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_owner_portfolio_temp_list','is_active_indx','2022-10-11 13:25:44','n_diff_pfx01',1,1,'is_active'),('db_freknur_investment','tbl_owner_portfolio_temp_list','is_active_indx','2022-10-11 13:25:44','n_diff_pfx02',2,1,'is_active,_id'),('db_freknur_investment','tbl_owner_portfolio_temp_list','is_active_indx','2022-10-11 13:25:44','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_owner_portfolio_temp_list','is_active_indx','2022-10-11 13:25:44','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_owner_portfolio_temp_list','msisdn_indx','2022-10-11 13:25:44','n_diff_pfx01',2,1,'msisdn'),('db_freknur_investment','tbl_owner_portfolio_temp_list','msisdn_indx','2022-10-11 13:25:44','n_diff_pfx02',2,1,'msisdn,_id'),('db_freknur_investment','tbl_owner_portfolio_temp_list','msisdn_indx','2022-10-11 13:25:44','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_owner_portfolio_temp_list','msisdn_indx','2022-10-11 13:25:44','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_purchase_request','PRIMARY','2022-10-11 15:13:46','n_diff_pfx01',3,1,'_id'),('db_freknur_investment','tbl_purchase_request','PRIMARY','2022-10-11 15:13:46','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_purchase_request','PRIMARY','2022-10-11 15:13:46','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_purchase_request','is_processed','2022-10-11 15:13:46','n_diff_pfx01',1,1,'is_processed'),('db_freknur_investment','tbl_purchase_request','is_processed','2022-10-11 15:13:46','n_diff_pfx02',3,1,'is_processed,_id'),('db_freknur_investment','tbl_purchase_request','is_processed','2022-10-11 15:13:46','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_purchase_request','is_processed','2022-10-11 15:13:46','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_purchase_request','msisdn','2022-10-11 15:13:46','n_diff_pfx01',2,1,'msisdn'),('db_freknur_investment','tbl_purchase_request','msisdn','2022-10-11 15:13:46','n_diff_pfx02',3,1,'msisdn,_id'),('db_freknur_investment','tbl_purchase_request','msisdn','2022-10-11 15:13:46','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_purchase_request','msisdn','2022-10-11 15:13:46','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_purchase_request','uid','2022-10-11 15:13:46','n_diff_pfx01',2,1,'uid'),('db_freknur_investment','tbl_purchase_request','uid','2022-10-11 15:13:46','n_diff_pfx02',3,1,'uid,_id'),('db_freknur_investment','tbl_purchase_request','uid','2022-10-11 15:13:46','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_purchase_request','uid','2022-10-11 15:13:46','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_sale_bid','PRIMARY','2022-09-30 14:19:44','n_diff_pfx01',0,1,'_id'),('db_freknur_investment','tbl_sale_bid','PRIMARY','2022-09-30 14:19:44','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_sale_bid','PRIMARY','2022-09-30 14:19:44','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_sale_bid','bid_id','2022-09-30 14:19:44','n_diff_pfx01',0,1,'bid_id'),('db_freknur_investment','tbl_sale_bid','bid_id','2022-09-30 14:19:44','n_diff_pfx02',0,1,'bid_id,_id'),('db_freknur_investment','tbl_sale_bid','bid_id','2022-09-30 14:19:44','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_sale_bid','bid_id','2022-09-30 14:19:44','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_sale_bid','is_accepted','2022-09-30 14:19:44','n_diff_pfx01',0,1,'is_accepted'),('db_freknur_investment','tbl_sale_bid','is_accepted','2022-09-30 14:19:44','n_diff_pfx02',0,1,'is_accepted,_id'),('db_freknur_investment','tbl_sale_bid','is_accepted','2022-09-30 14:19:44','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_sale_bid','is_accepted','2022-09-30 14:19:44','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_sale_bid','is_deleted','2022-09-30 14:19:44','n_diff_pfx01',0,1,'is_deleted'),('db_freknur_investment','tbl_sale_bid','is_deleted','2022-09-30 14:19:44','n_diff_pfx02',0,1,'is_deleted,_id'),('db_freknur_investment','tbl_sale_bid','is_deleted','2022-09-30 14:19:44','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_sale_bid','is_deleted','2022-09-30 14:19:44','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_sale_bid','owner_msisdn','2022-09-30 14:19:44','n_diff_pfx01',0,1,'owner_msisdn'),('db_freknur_investment','tbl_sale_bid','owner_msisdn','2022-09-30 14:19:44','n_diff_pfx02',0,1,'owner_msisdn,_id'),('db_freknur_investment','tbl_sale_bid','owner_msisdn','2022-09-30 14:19:44','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_sale_bid','owner_msisdn','2022-09-30 14:19:44','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_sale_request','PRIMARY','2022-10-18 09:00:00','n_diff_pfx01',2,1,'_id'),('db_freknur_investment','tbl_sale_request','PRIMARY','2022-10-18 09:00:00','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_sale_request','PRIMARY','2022-10-18 09:00:00','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_sale_request','is_processed','2022-10-18 09:00:00','n_diff_pfx01',1,1,'is_processed'),('db_freknur_investment','tbl_sale_request','is_processed','2022-10-18 09:00:00','n_diff_pfx02',2,1,'is_processed,_id'),('db_freknur_investment','tbl_sale_request','is_processed','2022-10-18 09:00:00','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_sale_request','is_processed','2022-10-18 09:00:00','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_sale_request','msisdn','2022-10-18 09:00:00','n_diff_pfx01',2,1,'msisdn'),('db_freknur_investment','tbl_sale_request','msisdn','2022-10-18 09:00:00','n_diff_pfx02',2,1,'msisdn,_id'),('db_freknur_investment','tbl_sale_request','msisdn','2022-10-18 09:00:00','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_sale_request','msisdn','2022-10-18 09:00:00','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_sale_request','uid_index','2022-10-18 09:00:00','n_diff_pfx01',2,1,'uid'),('db_freknur_investment','tbl_sale_request','uid_index','2022-10-18 09:00:00','n_diff_pfx02',2,1,'uid,_id'),('db_freknur_investment','tbl_sale_request','uid_index','2022-10-18 09:00:00','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_sale_request','uid_index','2022-10-18 09:00:00','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_sale_request_queue','PRIMARY','2022-10-18 09:00:10','n_diff_pfx01',2,1,'_id'),('db_freknur_investment','tbl_sale_request_queue','PRIMARY','2022-10-18 09:00:10','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_sale_request_queue','PRIMARY','2022-10-18 09:00:10','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_sale_request_queue','is_processed','2022-10-18 09:00:10','n_diff_pfx01',1,1,'is_processed'),('db_freknur_investment','tbl_sale_request_queue','is_processed','2022-10-18 09:00:10','n_diff_pfx02',2,1,'is_processed,_id'),('db_freknur_investment','tbl_sale_request_queue','is_processed','2022-10-18 09:00:10','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_sale_request_queue','is_processed','2022-10-18 09:00:10','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_sale_request_queue','msisdn','2022-10-18 09:00:10','n_diff_pfx01',2,1,'msisdn'),('db_freknur_investment','tbl_sale_request_queue','msisdn','2022-10-18 09:00:10','n_diff_pfx02',2,1,'msisdn,_id'),('db_freknur_investment','tbl_sale_request_queue','msisdn','2022-10-18 09:00:10','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_sale_request_queue','msisdn','2022-10-18 09:00:10','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_statement','PRIMARY','2022-10-11 13:25:14','n_diff_pfx01',2,1,'_id'),('db_freknur_investment','tbl_statement','PRIMARY','2022-10-11 13:25:14','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_statement','PRIMARY','2022-10-11 13:25:14','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_statement','is_archived','2022-10-11 13:25:14','n_diff_pfx01',1,1,'is_archived'),('db_freknur_investment','tbl_statement','is_archived','2022-10-11 13:25:14','n_diff_pfx02',2,1,'is_archived,_id'),('db_freknur_investment','tbl_statement','is_archived','2022-10-11 13:25:14','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_statement','is_archived','2022-10-11 13:25:14','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_statement','msisdn','2022-10-11 13:25:14','n_diff_pfx01',2,1,'msisdn'),('db_freknur_investment','tbl_statement','msisdn','2022-10-11 13:25:14','n_diff_pfx02',2,1,'msisdn,_id'),('db_freknur_investment','tbl_statement','msisdn','2022-10-11 13:25:14','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_statement','msisdn','2022-10-11 13:25:14','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_transaction','PRIMARY','2022-10-11 15:13:36','n_diff_pfx01',6,1,'id'),('db_freknur_investment','tbl_transaction','PRIMARY','2022-10-11 15:13:36','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_transaction','PRIMARY','2022-10-11 15:13:36','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_transaction','account_id','2022-10-11 15:13:36','n_diff_pfx01',2,1,'account_code'),('db_freknur_investment','tbl_transaction','account_id','2022-10-11 15:13:36','n_diff_pfx02',6,1,'account_code,id'),('db_freknur_investment','tbl_transaction','account_id','2022-10-11 15:13:36','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_transaction','account_id','2022-10-11 15:13:36','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_transaction','is_archived','2022-10-11 15:13:36','n_diff_pfx01',1,1,'is_archived'),('db_freknur_investment','tbl_transaction','is_archived','2022-10-11 15:13:36','n_diff_pfx02',6,1,'is_archived,id'),('db_freknur_investment','tbl_transaction','is_archived','2022-10-11 15:13:36','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_transaction','is_archived','2022-10-11 15:13:36','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_transaction','msisdn','2022-10-11 15:13:36','n_diff_pfx01',2,1,'msisdn'),('db_freknur_investment','tbl_transaction','msisdn','2022-10-11 15:13:36','n_diff_pfx02',6,1,'msisdn,id'),('db_freknur_investment','tbl_transaction','msisdn','2022-10-11 15:13:36','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_transaction','msisdn','2022-10-11 15:13:36','size',1,NULL,'Number of pages in the index'),('db_freknur_investment','tbl_transaction','reference_no','2022-10-11 15:13:36','n_diff_pfx01',3,1,'reference_no'),('db_freknur_investment','tbl_transaction','reference_no','2022-10-11 15:13:36','n_diff_pfx02',6,1,'reference_no,id'),('db_freknur_investment','tbl_transaction','reference_no','2022-10-11 15:13:36','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_investment','tbl_transaction','reference_no','2022-10-11 15:13:36','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','#sql-3466_bdd95f3','PRIMARY','2021-07-26 09:28:24','n_diff_pfx01',0,1,'id'),('db_freknur_loan','#sql-3466_bdd95f3','PRIMARY','2021-07-26 09:28:24','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','#sql-3466_bdd95f3','PRIMARY','2021-07-26 09:28:24','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','#sql-3466_bdd95f3','is_archived','2021-07-26 09:28:24','n_diff_pfx01',0,1,'is_archived'),('db_freknur_loan','#sql-3466_bdd95f3','is_archived','2021-07-26 09:28:24','n_diff_pfx02',0,1,'is_archived,id'),('db_freknur_loan','#sql-3466_bdd95f3','is_archived','2021-07-26 09:28:24','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','#sql-3466_bdd95f3','is_archived','2021-07-26 09:28:24','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','#sql-3466_bdd95f3','msisdn','2021-07-26 09:28:24','n_diff_pfx01',0,1,'msisdn'),('db_freknur_loan','#sql-3466_bdd95f3','msisdn','2021-07-26 09:28:24','n_diff_pfx02',0,1,'msisdn,id'),('db_freknur_loan','#sql-3466_bdd95f3','msisdn','2021-07-26 09:28:24','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','#sql-3466_bdd95f3','msisdn','2021-07-26 09:28:24','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','#sql-3466_bdd95f3','reference_no','2021-07-26 09:28:24','n_diff_pfx01',0,1,'reference_no'),('db_freknur_loan','#sql-3466_bdd95f3','reference_no','2021-07-26 09:28:24','n_diff_pfx02',0,1,'reference_no,id'),('db_freknur_loan','#sql-3466_bdd95f3','reference_no','2021-07-26 09:28:24','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','#sql-3466_bdd95f3','reference_no','2021-07-26 09:28:24','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','notification_template','PRIMARY','2020-06-24 23:15:12','n_diff_pfx01',0,1,'id'),('db_freknur_loan','notification_template','PRIMARY','2020-06-24 23:15:12','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','notification_template','PRIMARY','2020-06-24 23:15:12','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','status','PRIMARY','2020-06-24 23:14:17','n_diff_pfx01',0,1,'id'),('db_freknur_loan','status','PRIMARY','2020-06-24 23:14:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','status','PRIMARY','2020-06-24 23:14:17','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_account','PRIMARY','2022-09-30 14:06:44','n_diff_pfx01',4,1,'id'),('db_freknur_loan','tbl_account','PRIMARY','2022-09-30 14:06:44','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_account','PRIMARY','2022-09-30 14:06:44','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_account','account_unik','2022-09-30 14:06:44','n_diff_pfx01',4,1,'account_code'),('db_freknur_loan','tbl_account','account_unik','2022-09-30 14:06:44','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_account','account_unik','2022-09-30 14:06:44','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_account','bank_id','2022-09-30 14:06:44','n_diff_pfx01',4,1,'account_code'),('db_freknur_loan','tbl_account','bank_id','2022-09-30 14:06:44','n_diff_pfx02',4,1,'account_code,id'),('db_freknur_loan','tbl_account','bank_id','2022-09-30 14:06:44','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_account','bank_id','2022-09-30 14:06:44','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_broadcast','PRIMARY','2021-10-05 17:25:11','n_diff_pfx01',0,1,'_id'),('db_freknur_loan','tbl_broadcast','PRIMARY','2021-10-05 17:25:11','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_broadcast','PRIMARY','2021-10-05 17:25:11','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_credit_score','PRIMARY','2021-10-05 17:23:08','n_diff_pfx01',0,1,'id'),('db_freknur_loan','tbl_credit_score','PRIMARY','2021-10-05 17:23:08','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_credit_score','PRIMARY','2021-10-05 17:23:08','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_credit_score','msisdn','2021-10-05 17:23:08','n_diff_pfx01',0,1,'msisdn'),('db_freknur_loan','tbl_credit_score','msisdn','2021-10-05 17:23:08','n_diff_pfx02',0,1,'msisdn,id'),('db_freknur_loan','tbl_credit_score','msisdn','2021-10-05 17:23:08','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_credit_score','msisdn','2021-10-05 17:23:08','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_credit_score','msisdn_ac','2021-10-05 17:23:08','n_diff_pfx01',0,1,'msisdn'),('db_freknur_loan','tbl_credit_score','msisdn_ac','2021-10-05 17:23:08','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_credit_score','msisdn_ac','2021-10-05 17:23:08','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_debtor','PRIMARY','2022-10-16 05:55:42','n_diff_pfx01',1,1,'id'),('db_freknur_loan','tbl_debtor','PRIMARY','2022-10-16 05:55:42','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_debtor','PRIMARY','2022-10-16 05:55:42','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_debtor','is_archived','2022-10-16 05:55:42','n_diff_pfx01',1,1,'is_archived'),('db_freknur_loan','tbl_debtor','is_archived','2022-10-16 05:55:42','n_diff_pfx02',1,1,'is_archived,id'),('db_freknur_loan','tbl_debtor','is_archived','2022-10-16 05:55:42','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_debtor','is_archived','2022-10-16 05:55:42','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_debtor','is_repaid','2022-10-16 05:55:42','n_diff_pfx01',1,1,'is_repaid'),('db_freknur_loan','tbl_debtor','is_repaid','2022-10-16 05:55:42','n_diff_pfx02',1,1,'is_repaid,id'),('db_freknur_loan','tbl_debtor','is_repaid','2022-10-16 05:55:42','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_debtor','is_repaid','2022-10-16 05:55:42','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_debtor','msisdn','2022-10-16 05:55:42','n_diff_pfx01',1,1,'msisdn'),('db_freknur_loan','tbl_debtor','msisdn','2022-10-16 05:55:42','n_diff_pfx02',1,1,'msisdn,id'),('db_freknur_loan','tbl_debtor','msisdn','2022-10-16 05:55:42','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_debtor','msisdn','2022-10-16 05:55:42','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_debtor','reference_no','2022-10-16 05:55:42','n_diff_pfx01',1,1,'reference_no'),('db_freknur_loan','tbl_debtor','reference_no','2022-10-16 05:55:42','n_diff_pfx02',1,1,'reference_no,id'),('db_freknur_loan','tbl_debtor','reference_no','2022-10-16 05:55:42','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_debtor','reference_no','2022-10-16 05:55:42','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_debtor','reference_unik','2022-10-16 05:55:42','n_diff_pfx01',1,1,'reference_no'),('db_freknur_loan','tbl_debtor','reference_unik','2022-10-16 05:55:42','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_debtor','reference_unik','2022-10-16 05:55:42','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_defaulter','PRIMARY','2022-09-29 13:10:54','n_diff_pfx01',0,1,'id'),('db_freknur_loan','tbl_defaulter','PRIMARY','2022-09-29 13:10:54','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_defaulter','PRIMARY','2022-09-29 13:10:54','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_defaulter','is_archived','2022-09-29 13:10:54','n_diff_pfx01',0,1,'is_archived'),('db_freknur_loan','tbl_defaulter','is_archived','2022-09-29 13:10:54','n_diff_pfx02',0,1,'is_archived,id'),('db_freknur_loan','tbl_defaulter','is_archived','2022-09-29 13:10:54','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_defaulter','is_archived','2022-09-29 13:10:54','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_defaulter','msisdn','2022-09-29 13:10:54','n_diff_pfx01',0,1,'msisdn'),('db_freknur_loan','tbl_defaulter','msisdn','2022-09-29 13:10:54','n_diff_pfx02',0,1,'msisdn,id'),('db_freknur_loan','tbl_defaulter','msisdn','2022-09-29 13:10:54','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_defaulter','msisdn','2022-09-29 13:10:54','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_language','PRIMARY','2021-10-05 17:21:39','n_diff_pfx01',0,1,'id'),('db_freknur_loan','tbl_language','PRIMARY','2021-10-05 17:21:39','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_language','PRIMARY','2021-10-05 17:21:39','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_language','language_code','2021-10-05 17:21:39','n_diff_pfx01',0,1,'language_code'),('db_freknur_loan','tbl_language','language_code','2021-10-05 17:21:39','n_diff_pfx02',0,1,'language_code,id'),('db_freknur_loan','tbl_language','language_code','2021-10-05 17:21:39','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_language','language_code','2021-10-05 17:21:39','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_loan_repayment','PRIMARY','2021-10-05 17:20:04','n_diff_pfx01',0,1,'id'),('db_freknur_loan','tbl_loan_repayment','PRIMARY','2021-10-05 17:20:04','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_loan_repayment','PRIMARY','2021-10-05 17:20:04','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_loan_repayment','is_processed','2021-10-05 17:20:04','n_diff_pfx01',0,1,'is_processed'),('db_freknur_loan','tbl_loan_repayment','is_processed','2021-10-05 17:20:04','n_diff_pfx02',0,1,'is_processed,id'),('db_freknur_loan','tbl_loan_repayment','is_processed','2021-10-05 17:20:04','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_loan_repayment','is_processed','2021-10-05 17:20:04','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_loan_repayment','msisdn','2021-10-05 17:20:04','n_diff_pfx01',0,1,'msisdn'),('db_freknur_loan','tbl_loan_repayment','msisdn','2021-10-05 17:20:04','n_diff_pfx02',0,1,'msisdn,id'),('db_freknur_loan','tbl_loan_repayment','msisdn','2021-10-05 17:20:04','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_loan_repayment','msisdn','2021-10-05 17:20:04','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_loan_repayment','transaction_no','2021-10-05 17:20:04','n_diff_pfx01',0,1,'transaction_no'),('db_freknur_loan','tbl_loan_repayment','transaction_no','2021-10-05 17:20:04','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_loan_repayment','transaction_no','2021-10-05 17:20:04','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_loan_repayment','trxunik','2021-10-05 17:20:04','n_diff_pfx01',0,1,'transaction_no'),('db_freknur_loan','tbl_loan_repayment','trxunik','2021-10-05 17:20:04','n_diff_pfx02',0,1,'transaction_no,id'),('db_freknur_loan','tbl_loan_repayment','trxunik','2021-10-05 17:20:04','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_loan_repayment','trxunik','2021-10-05 17:20:04','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_loan_request','PRIMARY','2022-10-06 09:55:40','n_diff_pfx01',1,1,'id'),('db_freknur_loan','tbl_loan_request','PRIMARY','2022-10-06 09:55:40','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_loan_request','PRIMARY','2022-10-06 09:55:40','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_loan_request','has_collateral','2022-10-06 09:55:40','n_diff_pfx01',1,1,'has_collateral'),('db_freknur_loan','tbl_loan_request','has_collateral','2022-10-06 09:55:40','n_diff_pfx02',1,1,'has_collateral,id'),('db_freknur_loan','tbl_loan_request','has_collateral','2022-10-06 09:55:40','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_loan_request','has_collateral','2022-10-06 09:55:40','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_loan_request','is_processed','2022-10-06 09:55:40','n_diff_pfx01',1,1,'is_processed'),('db_freknur_loan','tbl_loan_request','is_processed','2022-10-06 09:55:40','n_diff_pfx02',1,1,'is_processed,id'),('db_freknur_loan','tbl_loan_request','is_processed','2022-10-06 09:55:40','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_loan_request','is_processed','2022-10-06 09:55:40','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_loan_request','msisdn','2022-10-06 09:55:40','n_diff_pfx01',1,1,'msisdn'),('db_freknur_loan','tbl_loan_request','msisdn','2022-10-06 09:55:40','n_diff_pfx02',1,1,'msisdn,id'),('db_freknur_loan','tbl_loan_request','msisdn','2022-10-06 09:55:40','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_loan_request','msisdn','2022-10-06 09:55:40','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_loan_request','msisdn_unik','2022-10-06 09:55:40','n_diff_pfx01',1,1,'msisdn'),('db_freknur_loan','tbl_loan_request','msisdn_unik','2022-10-06 09:55:40','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_loan_request','msisdn_unik','2022-10-06 09:55:40','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_loan_request','ref_no','2022-10-06 09:55:40','n_diff_pfx01',1,1,'reference_no'),('db_freknur_loan','tbl_loan_request','ref_no','2022-10-06 09:55:40','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_loan_request','ref_no','2022-10-06 09:55:40','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_mpesa_receipt','PRIMARY','2022-09-29 13:11:36','n_diff_pfx01',0,1,'id'),('db_freknur_loan','tbl_mpesa_receipt','PRIMARY','2022-09-29 13:11:36','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_mpesa_receipt','PRIMARY','2022-09-29 13:11:36','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_mpesa_receipt','is_archived','2022-09-29 13:11:36','n_diff_pfx01',0,1,'is_archived'),('db_freknur_loan','tbl_mpesa_receipt','is_archived','2022-09-29 13:11:36','n_diff_pfx02',0,1,'is_archived,id'),('db_freknur_loan','tbl_mpesa_receipt','is_archived','2022-09-29 13:11:36','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_mpesa_receipt','is_archived','2022-09-29 13:11:36','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_mpesa_receipt','msisdn','2022-09-29 13:11:36','n_diff_pfx01',0,1,'msisdn'),('db_freknur_loan','tbl_mpesa_receipt','msisdn','2022-09-29 13:11:36','n_diff_pfx02',0,1,'msisdn,id'),('db_freknur_loan','tbl_mpesa_receipt','msisdn','2022-09-29 13:11:36','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_mpesa_receipt','msisdn','2022-09-29 13:11:36','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_mpesa_receipt','reference_no','2022-09-29 13:11:36','n_diff_pfx01',0,1,'reference_no'),('db_freknur_loan','tbl_mpesa_receipt','reference_no','2022-09-29 13:11:36','n_diff_pfx02',0,1,'reference_no,id'),('db_freknur_loan','tbl_mpesa_receipt','reference_no','2022-09-29 13:11:36','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_mpesa_receipt','reference_no','2022-09-29 13:11:36','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_mpesa_receipt','reference_unik','2022-09-29 13:11:36','n_diff_pfx01',0,1,'reference_no'),('db_freknur_loan','tbl_mpesa_receipt','reference_unik','2022-09-29 13:11:36','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_mpesa_receipt','reference_unik','2022-09-29 13:11:36','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_transaction','PRIMARY','2022-10-06 09:55:41','n_diff_pfx01',2,1,'id'),('db_freknur_loan','tbl_transaction','PRIMARY','2022-10-06 09:55:41','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_transaction','PRIMARY','2022-10-06 09:55:41','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_transaction','account_id','2022-10-06 09:55:41','n_diff_pfx01',2,1,'account_code'),('db_freknur_loan','tbl_transaction','account_id','2022-10-06 09:55:41','n_diff_pfx02',2,1,'account_code,id'),('db_freknur_loan','tbl_transaction','account_id','2022-10-06 09:55:41','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_transaction','account_id','2022-10-06 09:55:41','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_transaction','is_archived','2022-10-06 09:55:41','n_diff_pfx01',1,1,'is_archived'),('db_freknur_loan','tbl_transaction','is_archived','2022-10-06 09:55:41','n_diff_pfx02',2,1,'is_archived,id'),('db_freknur_loan','tbl_transaction','is_archived','2022-10-06 09:55:41','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_transaction','is_archived','2022-10-06 09:55:41','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_transaction','msisdn','2022-10-06 09:55:41','n_diff_pfx01',1,1,'msisdn'),('db_freknur_loan','tbl_transaction','msisdn','2022-10-06 09:55:41','n_diff_pfx02',2,1,'msisdn,id'),('db_freknur_loan','tbl_transaction','msisdn','2022-10-06 09:55:41','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_transaction','msisdn','2022-10-06 09:55:41','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_transaction','reference_no','2022-10-06 09:55:41','n_diff_pfx01',1,1,'reference_no'),('db_freknur_loan','tbl_transaction','reference_no','2022-10-06 09:55:41','n_diff_pfx02',2,1,'reference_no,id'),('db_freknur_loan','tbl_transaction','reference_no','2022-10-06 09:55:41','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_transaction','reference_no','2022-10-06 09:55:41','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_wallet','PRIMARY','2022-10-06 09:51:34','n_diff_pfx01',9,1,'id'),('db_freknur_loan','tbl_wallet','PRIMARY','2022-10-06 09:51:34','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_wallet','PRIMARY','2022-10-06 09:51:34','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_wallet','is_suspended','2022-10-06 09:51:34','n_diff_pfx01',1,1,'is_suspended'),('db_freknur_loan','tbl_wallet','is_suspended','2022-10-06 09:51:34','n_diff_pfx02',9,1,'is_suspended,id'),('db_freknur_loan','tbl_wallet','is_suspended','2022-10-06 09:51:34','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_wallet','is_suspended','2022-10-06 09:51:34','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_wallet','msisdn','2022-10-06 09:51:34','n_diff_pfx01',9,1,'msisdn'),('db_freknur_loan','tbl_wallet','msisdn','2022-10-06 09:51:34','n_diff_pfx02',9,1,'msisdn,id'),('db_freknur_loan','tbl_wallet','msisdn','2022-10-06 09:51:34','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_wallet','msisdn','2022-10-06 09:51:34','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_wallet','msisdn_unik','2022-10-06 09:51:34','n_diff_pfx01',9,1,'msisdn'),('db_freknur_loan','tbl_wallet','msisdn_unik','2022-10-06 09:51:34','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_wallet','msisdn_unik','2022-10-06 09:51:34','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_wallet','status_id','2022-10-06 09:51:34','n_diff_pfx01',1,1,'is_active'),('db_freknur_loan','tbl_wallet','status_id','2022-10-06 09:51:34','n_diff_pfx02',9,1,'is_active,id'),('db_freknur_loan','tbl_wallet','status_id','2022-10-06 09:51:34','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_wallet','status_id','2022-10-06 09:51:34','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_wallet','system_uid','2022-10-06 09:51:34','n_diff_pfx01',9,1,'uid'),('db_freknur_loan','tbl_wallet','system_uid','2022-10-06 09:51:34','n_diff_pfx02',9,1,'uid,id'),('db_freknur_loan','tbl_wallet','system_uid','2022-10-06 09:51:34','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_wallet','system_uid','2022-10-06 09:51:34','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_wallet_extra','PRIMARY','2022-05-26 14:44:29','n_diff_pfx01',0,1,'_id'),('db_freknur_loan','tbl_wallet_extra','PRIMARY','2022-05-26 14:44:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_wallet_extra','PRIMARY','2022-05-26 14:44:29','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_wallet_extra','country_code','2022-05-26 14:44:29','n_diff_pfx01',0,1,'country_code'),('db_freknur_loan','tbl_wallet_extra','country_code','2022-05-26 14:44:29','n_diff_pfx02',0,1,'country_code,_id'),('db_freknur_loan','tbl_wallet_extra','country_code','2022-05-26 14:44:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_wallet_extra','country_code','2022-05-26 14:44:29','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_wallet_extra','msisdn','2022-05-26 14:44:29','n_diff_pfx01',0,1,'msisdn'),('db_freknur_loan','tbl_wallet_extra','msisdn','2022-05-26 14:44:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_wallet_extra','msisdn','2022-05-26 14:44:29','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_wallet_transaction','PRIMARY','2022-10-11 13:25:14','n_diff_pfx01',4,1,'id'),('db_freknur_loan','tbl_wallet_transaction','PRIMARY','2022-10-11 13:25:14','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_wallet_transaction','PRIMARY','2022-10-11 13:25:14','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_wallet_transaction','is_archived','2022-10-11 13:25:14','n_diff_pfx01',1,1,'is_archived'),('db_freknur_loan','tbl_wallet_transaction','is_archived','2022-10-11 13:25:14','n_diff_pfx02',4,1,'is_archived,id'),('db_freknur_loan','tbl_wallet_transaction','is_archived','2022-10-11 13:25:14','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_wallet_transaction','is_archived','2022-10-11 13:25:14','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_wallet_transaction','msisdn','2022-10-11 13:25:14','n_diff_pfx01',2,1,'msisdn'),('db_freknur_loan','tbl_wallet_transaction','msisdn','2022-10-11 13:25:14','n_diff_pfx02',4,1,'msisdn,id'),('db_freknur_loan','tbl_wallet_transaction','msisdn','2022-10-11 13:25:14','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_wallet_transaction','msisdn','2022-10-11 13:25:14','size',1,NULL,'Number of pages in the index'),('db_freknur_loan','tbl_wallet_transaction','reference_no','2022-10-11 13:25:14','n_diff_pfx01',3,1,'reference_no'),('db_freknur_loan','tbl_wallet_transaction','reference_no','2022-10-11 13:25:14','n_diff_pfx02',4,1,'reference_no,id'),('db_freknur_loan','tbl_wallet_transaction','reference_no','2022-10-11 13:25:14','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_loan','tbl_wallet_transaction','reference_no','2022-10-11 13:25:14','size',1,NULL,'Number of pages in the index'),('db_freknur_notification','tbl_broadcast','PRIMARY','2022-09-14 13:06:31','n_diff_pfx01',11,1,'_id'),('db_freknur_notification','tbl_broadcast','PRIMARY','2022-09-14 13:06:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_notification','tbl_broadcast','PRIMARY','2022-09-14 13:06:31','size',1,NULL,'Number of pages in the index'),('db_freknur_notification','tbl_broadcast','is_processed','2022-09-14 13:06:31','n_diff_pfx01',1,1,'is_processed'),('db_freknur_notification','tbl_broadcast','is_processed','2022-09-14 13:06:31','n_diff_pfx02',11,1,'is_processed,_id'),('db_freknur_notification','tbl_broadcast','is_processed','2022-09-14 13:06:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_notification','tbl_broadcast','is_processed','2022-09-14 13:06:31','size',1,NULL,'Number of pages in the index'),('db_freknur_notification','tbl_broadcast','uid','2022-09-14 13:06:31','n_diff_pfx01',11,1,'uid'),('db_freknur_notification','tbl_broadcast','uid','2022-09-14 13:06:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_notification','tbl_broadcast','uid','2022-09-14 13:06:31','size',1,NULL,'Number of pages in the index'),('db_freknur_paypal','tbl_ipn_receipt','PRIMARY','2021-11-17 09:15:54','n_diff_pfx01',6,1,'_id'),('db_freknur_paypal','tbl_ipn_receipt','PRIMARY','2021-11-17 09:15:54','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_paypal','tbl_ipn_receipt','PRIMARY','2021-11-17 09:15:54','size',1,NULL,'Number of pages in the index'),('db_freknur_paypal','tbl_ipn_receipt','txn_id','2021-11-17 09:15:54','n_diff_pfx01',6,1,'txn_id'),('db_freknur_paypal','tbl_ipn_receipt','txn_id','2021-11-17 09:15:54','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_paypal','tbl_ipn_receipt','txn_id','2021-11-17 09:15:54','size',1,NULL,'Number of pages in the index'),('db_freknur_paypal','tbl_paypal_bridge_temp','PRIMARY','2021-11-11 20:31:13','n_diff_pfx01',0,1,'_id'),('db_freknur_paypal','tbl_paypal_bridge_temp','PRIMARY','2021-11-11 20:31:13','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_paypal','tbl_paypal_bridge_temp','PRIMARY','2021-11-11 20:31:13','size',1,NULL,'Number of pages in the index'),('db_freknur_paypal','tbl_paypal_bridge_temp','msisdn','2021-11-11 20:31:13','n_diff_pfx01',0,1,'msisdn'),('db_freknur_paypal','tbl_paypal_bridge_temp','msisdn','2021-11-11 20:31:13','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_paypal','tbl_paypal_bridge_temp','msisdn','2021-11-11 20:31:13','size',1,NULL,'Number of pages in the index'),('db_freknur_stats','tbl_approved_loan_stats','PRIMARY','2022-09-28 11:28:18','n_diff_pfx01',4,1,'_id'),('db_freknur_stats','tbl_approved_loan_stats','PRIMARY','2022-09-28 11:28:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_stats','tbl_approved_loan_stats','PRIMARY','2022-09-28 11:28:18','size',1,NULL,'Number of pages in the index'),('db_freknur_stats','tbl_approved_loan_stats','is_achived','2022-09-28 11:28:18','n_diff_pfx01',1,1,'is_achived'),('db_freknur_stats','tbl_approved_loan_stats','is_achived','2022-09-28 11:28:18','n_diff_pfx02',4,1,'is_achived,_id'),('db_freknur_stats','tbl_approved_loan_stats','is_achived','2022-09-28 11:28:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_stats','tbl_approved_loan_stats','is_achived','2022-09-28 11:28:18','size',1,NULL,'Number of pages in the index'),('db_freknur_stats','tbl_debtor_stats','PRIMARY','2022-05-24 09:04:36','n_diff_pfx01',0,1,'_id'),('db_freknur_stats','tbl_debtor_stats','PRIMARY','2022-05-24 09:04:36','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_stats','tbl_debtor_stats','PRIMARY','2022-05-24 09:04:36','size',1,NULL,'Number of pages in the index'),('db_freknur_stats','tbl_debtor_stats','is_achived','2022-05-24 09:04:36','n_diff_pfx01',0,1,'is_achived'),('db_freknur_stats','tbl_debtor_stats','is_achived','2022-05-24 09:04:36','n_diff_pfx02',0,1,'is_achived,_id'),('db_freknur_stats','tbl_debtor_stats','is_achived','2022-05-24 09:04:36','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_stats','tbl_debtor_stats','is_achived','2022-05-24 09:04:36','size',1,NULL,'Number of pages in the index'),('db_freknur_stats','tbl_loan_stats','PRIMARY','2022-09-28 11:25:14','n_diff_pfx01',9,1,'_id'),('db_freknur_stats','tbl_loan_stats','PRIMARY','2022-09-28 11:25:14','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_stats','tbl_loan_stats','PRIMARY','2022-09-28 11:25:14','size',1,NULL,'Number of pages in the index'),('db_freknur_stats','tbl_loan_stats','is_achived','2022-09-28 11:25:14','n_diff_pfx01',1,1,'is_achived'),('db_freknur_stats','tbl_loan_stats','is_achived','2022-09-28 11:25:14','n_diff_pfx02',9,1,'is_achived,_id'),('db_freknur_stats','tbl_loan_stats','is_achived','2022-09-28 11:25:14','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_stats','tbl_loan_stats','is_achived','2022-09-28 11:25:14','size',1,NULL,'Number of pages in the index'),('db_freknur_stats','tbl_purchase_asset_stats','PRIMARY','2022-05-24 09:06:34','n_diff_pfx01',0,1,'_id'),('db_freknur_stats','tbl_purchase_asset_stats','PRIMARY','2022-05-24 09:06:34','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_stats','tbl_purchase_asset_stats','PRIMARY','2022-05-24 09:06:34','size',1,NULL,'Number of pages in the index'),('db_freknur_stats','tbl_purchase_asset_stats','is_achived','2022-05-24 09:06:34','n_diff_pfx01',0,1,'is_achived'),('db_freknur_stats','tbl_purchase_asset_stats','is_achived','2022-05-24 09:06:34','n_diff_pfx02',0,1,'is_achived,_id'),('db_freknur_stats','tbl_purchase_asset_stats','is_achived','2022-05-24 09:06:34','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_stats','tbl_purchase_asset_stats','is_achived','2022-05-24 09:06:34','size',1,NULL,'Number of pages in the index'),('db_freknur_stats','tbl_rejected_loan_stats','PRIMARY','2022-07-13 14:37:50','n_diff_pfx01',4,1,'_id'),('db_freknur_stats','tbl_rejected_loan_stats','PRIMARY','2022-07-13 14:37:50','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_stats','tbl_rejected_loan_stats','PRIMARY','2022-07-13 14:37:50','size',1,NULL,'Number of pages in the index'),('db_freknur_stats','tbl_rejected_loan_stats','is_achived','2022-07-13 14:37:50','n_diff_pfx01',1,1,'is_achived'),('db_freknur_stats','tbl_rejected_loan_stats','is_achived','2022-07-13 14:37:50','n_diff_pfx02',4,1,'is_achived,_id'),('db_freknur_stats','tbl_rejected_loan_stats','is_achived','2022-07-13 14:37:50','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_stats','tbl_rejected_loan_stats','is_achived','2022-07-13 14:37:50','size',1,NULL,'Number of pages in the index'),('db_freknur_stats','tbl_sale_asset_stats','PRIMARY','2022-05-24 09:07:11','n_diff_pfx01',0,1,'_id'),('db_freknur_stats','tbl_sale_asset_stats','PRIMARY','2022-05-24 09:07:11','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_stats','tbl_sale_asset_stats','PRIMARY','2022-05-24 09:07:11','size',1,NULL,'Number of pages in the index'),('db_freknur_stats','tbl_sale_asset_stats','is_achived','2022-05-24 09:07:11','n_diff_pfx01',0,1,'is_achived'),('db_freknur_stats','tbl_sale_asset_stats','is_achived','2022-05-24 09:07:11','n_diff_pfx02',0,1,'is_achived,_id'),('db_freknur_stats','tbl_sale_asset_stats','is_achived','2022-05-24 09:07:11','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_stats','tbl_sale_asset_stats','is_achived','2022-05-24 09:07:11','size',1,NULL,'Number of pages in the index'),('db_freknur_wallet','#sql-572a_640dab8','PRIMARY','2021-12-20 12:04:08','n_diff_pfx01',0,1,'ID'),('db_freknur_wallet','#sql-572a_640dab8','PRIMARY','2021-12-20 12:04:08','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_wallet','#sql-572a_640dab8','PRIMARY','2021-12-20 12:04:08','size',1,NULL,'Number of pages in the index'),('db_freknur_wallet','betaTesters','EmailAddress','2022-03-11 06:45:13','n_diff_pfx01',0,1,'EmailAddress'),('db_freknur_wallet','betaTesters','EmailAddress','2022-03-11 06:45:13','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_wallet','betaTesters','EmailAddress','2022-03-11 06:45:13','size',1,NULL,'Number of pages in the index'),('db_freknur_wallet','betaTesters','PRIMARY','2022-03-11 06:45:13','n_diff_pfx01',0,1,'Id'),('db_freknur_wallet','betaTesters','PRIMARY','2022-03-11 06:45:13','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_wallet','betaTesters','PRIMARY','2022-03-11 06:45:13','size',1,NULL,'Number of pages in the index'),('db_freknur_wallet','deliverydetails','PRIMARY','2022-03-14 09:50:32','n_diff_pfx01',0,1,'deliveryID'),('db_freknur_wallet','deliverydetails','PRIMARY','2022-03-14 09:50:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_wallet','deliverydetails','PRIMARY','2022-03-14 09:50:32','size',1,NULL,'Number of pages in the index'),('db_freknur_wallet','devicesim','PRIMARY','2022-09-28 07:48:59','n_diff_pfx01',4,1,'id'),('db_freknur_wallet','devicesim','PRIMARY','2022-09-28 07:48:59','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_wallet','devicesim','PRIMARY','2022-09-28 07:48:59','size',1,NULL,'Number of pages in the index'),('db_freknur_wallet','devicesim','userID','2022-09-28 07:48:59','n_diff_pfx01',4,1,'userID'),('db_freknur_wallet','devicesim','userID','2022-09-28 07:48:59','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_wallet','devicesim','userID','2022-09-28 07:48:59','size',1,NULL,'Number of pages in the index'),('db_freknur_wallet','eosaccounts','PRIMARY','2022-03-14 09:50:49','n_diff_pfx01',0,1,'accountID'),('db_freknur_wallet','eosaccounts','PRIMARY','2022-03-14 09:50:49','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_wallet','eosaccounts','PRIMARY','2022-03-14 09:50:49','size',1,NULL,'Number of pages in the index'),('db_freknur_wallet','eosaccounts','accountName','2022-03-14 09:50:49','n_diff_pfx01',0,1,'accountName'),('db_freknur_wallet','eosaccounts','accountName','2022-03-14 09:50:49','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_wallet','eosaccounts','accountName','2022-03-14 09:50:49','size',1,NULL,'Number of pages in the index'),('db_freknur_wallet','eosaccounts','prKey','2022-03-14 09:50:49','n_diff_pfx01',0,1,'prKey'),('db_freknur_wallet','eosaccounts','prKey','2022-03-14 09:50:49','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_wallet','eosaccounts','prKey','2022-03-14 09:50:49','size',1,NULL,'Number of pages in the index'),('db_freknur_wallet','eosaccounts','transactionID','2022-03-14 09:50:49','n_diff_pfx01',0,1,'transactionID'),('db_freknur_wallet','eosaccounts','transactionID','2022-03-14 09:50:49','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_wallet','eosaccounts','transactionID','2022-03-14 09:50:49','size',1,NULL,'Number of pages in the index'),('db_freknur_wallet','eosaccounts','url','2022-03-14 09:50:49','n_diff_pfx01',0,1,'url'),('db_freknur_wallet','eosaccounts','url','2022-03-14 09:50:49','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_wallet','eosaccounts','url','2022-03-14 09:50:49','size',1,NULL,'Number of pages in the index'),('db_freknur_wallet','eosaccounts','userID','2022-03-14 09:50:49','n_diff_pfx01',0,1,'userID'),('db_freknur_wallet','eosaccounts','userID','2022-03-14 09:50:49','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_wallet','eosaccounts','userID','2022-03-14 09:50:49','size',1,NULL,'Number of pages in the index'),('db_freknur_wallet','loginActivity','PRIMARY','2022-10-06 10:52:27','n_diff_pfx01',86,1,'ID'),('db_freknur_wallet','loginActivity','PRIMARY','2022-10-06 10:52:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_wallet','loginActivity','PRIMARY','2022-10-06 10:52:27','size',1,NULL,'Number of pages in the index'),('db_freknur_wallet','token_markets','PRIMARY','2022-07-22 15:26:05','n_diff_pfx01',0,1,'ID'),('db_freknur_wallet','token_markets','PRIMARY','2022-07-22 15:26:05','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_wallet','token_markets','PRIMARY','2022-07-22 15:26:05','size',1,NULL,'Number of pages in the index'),('db_freknur_wallet','token_transactions','PRIMARY','2022-10-11 15:13:36','n_diff_pfx01',6,1,'ID'),('db_freknur_wallet','token_transactions','PRIMARY','2022-10-11 15:13:36','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_wallet','token_transactions','PRIMARY','2022-10-11 15:13:36','size',1,NULL,'Number of pages in the index'),('db_freknur_wallet','tokens','Account','2022-09-29 13:26:18','n_diff_pfx01',2,1,'Account'),('db_freknur_wallet','tokens','Account','2022-09-29 13:26:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_wallet','tokens','Account','2022-09-29 13:26:18','size',1,NULL,'Number of pages in the index'),('db_freknur_wallet','tokens','PRIMARY','2022-09-29 13:26:18','n_diff_pfx01',2,1,'ID'),('db_freknur_wallet','tokens','PRIMARY','2022-09-29 13:26:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_wallet','tokens','PRIMARY','2022-09-29 13:26:18','size',1,NULL,'Number of pages in the index'),('db_freknur_wallet','transactions','PRIMARY','2022-10-18 08:59:16','n_diff_pfx01',203,2,'transactionID'),('db_freknur_wallet','transactions','PRIMARY','2022-10-18 08:59:16','n_leaf_pages',2,NULL,'Number of leaf pages in the index'),('db_freknur_wallet','transactions','PRIMARY','2022-10-18 08:59:16','size',3,NULL,'Number of pages in the index'),('db_freknur_wallet','users','PRIMARY','2022-09-29 13:24:04','n_diff_pfx01',2,1,'userID'),('db_freknur_wallet','users','PRIMARY','2022-09-29 13:24:04','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_wallet','users','PRIMARY','2022-09-29 13:24:04','size',1,NULL,'Number of pages in the index'),('db_freknur_wallet','users','emailAddress','2022-09-29 13:24:04','n_diff_pfx01',2,1,'emailAddress'),('db_freknur_wallet','users','emailAddress','2022-09-29 13:24:04','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_wallet','users','emailAddress','2022-09-29 13:24:04','size',1,NULL,'Number of pages in the index'),('db_freknur_wallet','users','phoneNumber','2022-09-29 13:24:04','n_diff_pfx01',2,1,'phoneNumber'),('db_freknur_wallet','users','phoneNumber','2022-09-29 13:24:04','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_wallet','users','phoneNumber','2022-09-29 13:24:04','size',1,NULL,'Number of pages in the index'),('db_freknur_wallet','verification','PRIMARY','2022-10-06 09:51:29','n_diff_pfx01',0,1,'id'),('db_freknur_wallet','verification','PRIMARY','2022-10-06 09:51:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_wallet','verification','PRIMARY','2022-10-06 09:51:29','size',1,NULL,'Number of pages in the index'),('db_freknur_wallet','verification','cred','2022-10-06 09:51:29','n_diff_pfx01',0,1,'cred'),('db_freknur_wallet','verification','cred','2022-10-06 09:51:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('db_freknur_wallet','verification','cred','2022-10-06 09:51:29','size',1,NULL,'Number of pages in the index'),('mpesa_recon','migrations','PRIMARY','2019-08-01 13:21:36','n_diff_pfx01',2,1,'id'),('mpesa_recon','migrations','PRIMARY','2019-08-01 13:21:36','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('mpesa_recon','migrations','PRIMARY','2019-08-01 13:21:36','size',1,NULL,'Number of pages in the index'),('mpesa_recon','password_resets','GEN_CLUST_INDEX','2019-08-01 13:21:36','n_diff_pfx01',0,1,'DB_ROW_ID'),('mpesa_recon','password_resets','GEN_CLUST_INDEX','2019-08-01 13:21:36','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('mpesa_recon','password_resets','GEN_CLUST_INDEX','2019-08-01 13:21:36','size',1,NULL,'Number of pages in the index'),('mpesa_recon','password_resets','password_resets_email_index','2019-08-01 13:21:36','n_diff_pfx01',0,1,'email'),('mpesa_recon','password_resets','password_resets_email_index','2019-08-01 13:21:36','n_diff_pfx02',0,1,'email,DB_ROW_ID'),('mpesa_recon','password_resets','password_resets_email_index','2019-08-01 13:21:36','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('mpesa_recon','password_resets','password_resets_email_index','2019-08-01 13:21:36','size',1,NULL,'Number of pages in the index'),('mpesa_recon','users','PRIMARY','2019-08-01 13:21:35','n_diff_pfx01',0,1,'id'),('mpesa_recon','users','PRIMARY','2019-08-01 13:21:35','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('mpesa_recon','users','PRIMARY','2019-08-01 13:21:35','size',1,NULL,'Number of pages in the index'),('mpesa_recon','users','users_email_unique','2019-08-01 13:21:35','n_diff_pfx01',0,1,'email'),('mpesa_recon','users','users_email_unique','2019-08-01 13:21:35','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('mpesa_recon','users','users_email_unique','2019-08-01 13:21:35','size',1,NULL,'Number of pages in the index'),('mpesaboc','auth_assignment','PRIMARY','2019-09-16 14:30:53','n_diff_pfx01',0,1,'item_name'),('mpesaboc','auth_assignment','PRIMARY','2019-09-16 14:30:53','n_diff_pfx02',0,1,'item_name,user_id'),('mpesaboc','auth_assignment','PRIMARY','2019-09-16 14:30:53','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('mpesaboc','auth_assignment','PRIMARY','2019-09-16 14:30:53','size',1,NULL,'Number of pages in the index'),('mpesaboc','auth_assignment','idx-auth_assignment-user_id','2019-09-16 14:30:53','n_diff_pfx01',0,1,'user_id'),('mpesaboc','auth_assignment','idx-auth_assignment-user_id','2019-09-16 14:30:53','n_diff_pfx02',0,1,'user_id,item_name'),('mpesaboc','auth_assignment','idx-auth_assignment-user_id','2019-09-16 14:30:53','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('mpesaboc','auth_assignment','idx-auth_assignment-user_id','2019-09-16 14:30:53','size',1,NULL,'Number of pages in the index'),('mpesaboc','auth_item','PRIMARY','2019-09-16 14:30:53','n_diff_pfx01',0,1,'name'),('mpesaboc','auth_item','PRIMARY','2019-09-16 14:30:53','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('mpesaboc','auth_item','PRIMARY','2019-09-16 14:30:53','size',1,NULL,'Number of pages in the index'),('mpesaboc','auth_item','idx-auth_item-type','2019-09-16 14:30:53','n_diff_pfx01',0,1,'type'),('mpesaboc','auth_item','idx-auth_item-type','2019-09-16 14:30:53','n_diff_pfx02',0,1,'type,name'),('mpesaboc','auth_item','idx-auth_item-type','2019-09-16 14:30:53','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('mpesaboc','auth_item','idx-auth_item-type','2019-09-16 14:30:53','size',1,NULL,'Number of pages in the index'),('mpesaboc','auth_item','rule_name','2019-09-16 14:30:53','n_diff_pfx01',0,1,'rule_name'),('mpesaboc','auth_item','rule_name','2019-09-16 14:30:53','n_diff_pfx02',0,1,'rule_name,name'),('mpesaboc','auth_item','rule_name','2019-09-16 14:30:53','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('mpesaboc','auth_item','rule_name','2019-09-16 14:30:53','size',1,NULL,'Number of pages in the index'),('mpesaboc','auth_item_child','PRIMARY','2019-09-16 14:30:52','n_diff_pfx01',0,1,'parent'),('mpesaboc','auth_item_child','PRIMARY','2019-09-16 14:30:52','n_diff_pfx02',0,1,'parent,child'),('mpesaboc','auth_item_child','PRIMARY','2019-09-16 14:30:52','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('mpesaboc','auth_item_child','PRIMARY','2019-09-16 14:30:52','size',1,NULL,'Number of pages in the index'),('mpesaboc','auth_item_child','child','2019-09-16 14:30:52','n_diff_pfx01',0,1,'child'),('mpesaboc','auth_item_child','child','2019-09-16 14:30:52','n_diff_pfx02',0,1,'child,parent'),('mpesaboc','auth_item_child','child','2019-09-16 14:30:52','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('mpesaboc','auth_item_child','child','2019-09-16 14:30:52','size',1,NULL,'Number of pages in the index'),('mpesaboc','auth_rule','PRIMARY','2019-09-16 14:30:52','n_diff_pfx01',0,1,'name'),('mpesaboc','auth_rule','PRIMARY','2019-09-16 14:30:52','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('mpesaboc','auth_rule','PRIMARY','2019-09-16 14:30:52','size',1,NULL,'Number of pages in the index'),('mpesaboc','migration','PRIMARY','2019-09-16 14:30:53','n_diff_pfx01',16,1,'version'),('mpesaboc','migration','PRIMARY','2019-09-16 14:30:53','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('mpesaboc','migration','PRIMARY','2019-09-16 14:30:53','size',1,NULL,'Number of pages in the index'),('mpesaboc','profile','PRIMARY','2019-09-17 07:28:34','n_diff_pfx01',2,1,'user_id'),('mpesaboc','profile','PRIMARY','2019-09-17 07:28:34','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('mpesaboc','profile','PRIMARY','2019-09-17 07:28:34','size',1,NULL,'Number of pages in the index'),('mpesaboc','recons','PRIMARY','2019-09-16 15:01:16','n_diff_pfx01',2,1,'id'),('mpesaboc','recons','PRIMARY','2019-09-16 15:01:16','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('mpesaboc','recons','PRIMARY','2019-09-16 15:01:16','size',1,NULL,'Number of pages in the index'),('mpesaboc','social_account','PRIMARY','2019-09-16 13:49:32','n_diff_pfx01',0,1,'id'),('mpesaboc','social_account','PRIMARY','2019-09-16 13:49:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('mpesaboc','social_account','PRIMARY','2019-09-16 13:49:32','size',1,NULL,'Number of pages in the index'),('mpesaboc','social_account','account_unique','2019-09-16 13:49:32','n_diff_pfx01',0,1,'provider'),('mpesaboc','social_account','account_unique','2019-09-16 13:49:32','n_diff_pfx02',0,1,'provider,client_id'),('mpesaboc','social_account','account_unique','2019-09-16 13:49:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('mpesaboc','social_account','account_unique','2019-09-16 13:49:32','size',1,NULL,'Number of pages in the index'),('mpesaboc','social_account','account_unique_code','2019-09-16 13:49:32','n_diff_pfx01',0,1,'code'),('mpesaboc','social_account','account_unique_code','2019-09-16 13:49:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('mpesaboc','social_account','account_unique_code','2019-09-16 13:49:32','size',1,NULL,'Number of pages in the index'),('mpesaboc','social_account','fk_user_account','2019-09-16 13:49:32','n_diff_pfx01',0,1,'user_id'),('mpesaboc','social_account','fk_user_account','2019-09-16 13:49:32','n_diff_pfx02',0,1,'user_id,id'),('mpesaboc','social_account','fk_user_account','2019-09-16 13:49:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('mpesaboc','social_account','fk_user_account','2019-09-16 13:49:32','size',1,NULL,'Number of pages in the index'),('mpesaboc','token','token_unique','2019-09-16 14:13:56','n_diff_pfx01',0,1,'user_id'),('mpesaboc','token','token_unique','2019-09-16 14:13:56','n_diff_pfx02',0,1,'user_id,code'),('mpesaboc','token','token_unique','2019-09-16 14:13:56','n_diff_pfx03',0,1,'user_id,code,type'),('mpesaboc','token','token_unique','2019-09-16 14:13:56','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('mpesaboc','token','token_unique','2019-09-16 14:13:56','size',1,NULL,'Number of pages in the index'),('mpesaboc','user','PRIMARY','2019-09-17 07:28:34','n_diff_pfx01',2,1,'id'),('mpesaboc','user','PRIMARY','2019-09-17 07:28:34','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('mpesaboc','user','PRIMARY','2019-09-17 07:28:34','size',1,NULL,'Number of pages in the index'),('mpesaboc','user','user_unique_email','2019-09-17 07:28:34','n_diff_pfx01',2,1,'email'),('mpesaboc','user','user_unique_email','2019-09-17 07:28:34','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('mpesaboc','user','user_unique_email','2019-09-17 07:28:34','size',1,NULL,'Number of pages in the index'),('mpesaboc','user','user_unique_username','2019-09-17 07:28:34','n_diff_pfx01',2,1,'username'),('mpesaboc','user','user_unique_username','2019-09-17 07:28:34','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('mpesaboc','user','user_unique_username','2019-09-17 07:28:34','size',1,NULL,'Number of pages in the index'),('mysql','component','PRIMARY','2021-08-04 11:15:53','n_diff_pfx01',1,1,'component_id'),('mysql','component','PRIMARY','2021-08-04 11:15:53','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('mysql','component','PRIMARY','2021-08-04 11:15:53','size',1,NULL,'Number of pages in the index'),('sportsbrain','countries','PRIMARY','2019-04-29 12:23:29','n_diff_pfx01',4,1,'id'),('sportsbrain','countries','PRIMARY','2019-04-29 12:23:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('sportsbrain','countries','PRIMARY','2019-04-29 12:23:29','size',1,NULL,'Number of pages in the index'),('sportsbrain','leagues','PRIMARY','2019-04-26 12:13:36','n_diff_pfx01',4,1,'league_id'),('sportsbrain','leagues','PRIMARY','2019-04-26 12:13:36','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('sportsbrain','leagues','PRIMARY','2019-04-26 12:13:36','size',1,NULL,'Number of pages in the index'),('sportsbrain','leagues','unq_league','2019-04-26 12:13:36','n_diff_pfx01',2,1,'country'),('sportsbrain','leagues','unq_league','2019-04-26 12:13:36','n_diff_pfx02',4,1,'country,tournament'),('sportsbrain','leagues','unq_league','2019-04-26 12:13:36','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('sportsbrain','leagues','unq_league','2019-04-26 12:13:36','size',1,NULL,'Number of pages in the index'),('sportsbrain','predictions','PRIMARY','2019-04-26 13:46:53','n_diff_pfx01',79,1,'id'),('sportsbrain','predictions','PRIMARY','2019-04-26 13:46:53','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('sportsbrain','predictions','PRIMARY','2019-04-26 13:46:53','size',1,NULL,'Number of pages in the index'),('sportsbrain','predictions','league_id','2019-04-26 13:46:53','n_diff_pfx01',4,1,'league_id'),('sportsbrain','predictions','league_id','2019-04-26 13:46:53','n_diff_pfx02',79,1,'league_id,id'),('sportsbrain','predictions','league_id','2019-04-26 13:46:53','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('sportsbrain','predictions','league_id','2019-04-26 13:46:53','size',1,NULL,'Number of pages in the index'),('sys','sys_config','PRIMARY','2019-02-07 13:12:48','n_diff_pfx01',6,1,'variable'),('sys','sys_config','PRIMARY','2019-02-07 13:12:48','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('sys','sys_config','PRIMARY','2019-02-07 13:12:48','size',1,NULL,'Number of pages in the index');
/*!40000 ALTER TABLE `innodb_index_stats` ENABLE KEYS */;

--
-- Dumping data for table `innodb_table_stats`
--

/*!40000 ALTER TABLE `innodb_table_stats` DISABLE KEYS */;
INSERT  IGNORE INTO `innodb_table_stats` VALUES ('africastalking','bulk_sms_logs','2021-09-27 19:22:13',0,1,1),('africastalking','incoming_sms_log','2021-10-05 18:10:27',0,1,0),('africastalking','sent_sms_logs','2021-10-05 18:11:00',0,1,1),('db_betting_moniter','bookmaker','2019-09-03 08:05:46',0,1,4),('db_betting_moniter','govttaxinformation','2019-09-03 08:05:18',0,1,1),('db_betting_moniter','mno','2019-09-19 12:06:01',4,1,2),('db_betting_moniter','revenuelog','2021-10-05 18:07:37',0,1,3),('db_betting_moniter','statssummary','2019-09-19 09:35:35',0,1,0),('db_betting_moniter','statssummary_archive','2019-09-19 09:35:54',0,1,0),('db_betvantage','tbl_betconstruct','2021-10-05 18:03:43',0,1,3),('db_betvantage','tbl_mpesa_transaction_log','2021-10-05 18:02:30',0,1,3),('db_betvantage_promo','tbl_group','2021-09-23 21:21:26',2,1,0),('db_betvantage_promo','tbl_heap','2020-07-16 21:00:42',0,1,1),('db_betvantage_promo','tbl_setup','2022-08-15 20:37:24',1,1,3),('db_betvantage_promo','tbl_setup_temp','2022-08-15 20:37:32',0,1,2),('db_betvantage_promo','tbl_subscription','2021-10-05 17:58:49',0,1,3),('db_betvantage_promo','tbl_temp','2022-05-31 17:15:15',0,1,1),('db_betvantage_wallet','misc','2021-10-05 17:57:09',0,1,0),('db_betvantage_wallet','tbl_deposit_log','2019-05-29 13:34:43',0,1,1),('db_betvantage_wallet','tbl_expense_trx','2019-05-15 08:12:23',0,1,0),('db_betvantage_wallet','tbl_fee_log','2019-05-15 08:13:24',0,1,0),('db_betvantage_wallet','tbl_income_trx','2019-05-15 08:14:00',0,1,0),('db_betvantage_wallet','tbl_incoming_sms','2021-10-05 17:55:01',0,1,3),('db_betvantage_wallet','tbl_outgoing_sms','2021-10-05 17:54:25',0,1,3),('db_betvantage_wallet','tbl_stake_collection_trx','2019-05-15 08:15:59',0,1,0),('db_betvantage_wallet','tbl_system_log','2019-05-15 08:16:33',0,1,0),('db_betvantage_wallet','tbl_wallet','2021-10-05 17:52:57',0,1,3),('db_betvantage_wallet','tbl_wallet_ext','2021-10-05 17:52:37',0,1,2),('db_betvantage_wallet','tbl_wallet_trx','2019-05-15 08:22:39',0,1,0),('db_betvantage_wallet','tbl_withdrawal_log','2019-05-29 13:15:36',0,1,0),('db_freknur_general','tbl_activity_log','2022-10-18 09:00:22',26,1,2),('db_freknur_general','tbl_debtor','2022-09-29 13:16:23',0,1,5),('db_freknur_general','tbl_defaulter','2022-09-29 13:16:34',0,1,2),('db_freknur_general','tbl_loan_collateral','2022-09-30 14:44:49',0,1,2),('db_freknur_general','tbl_loan_repayment','2022-09-29 13:16:51',0,1,4),('db_freknur_general','tbl_loan_request','2021-10-05 17:43:45',0,1,5),('db_freknur_general','tbl_mpesa_receipt','2022-09-23 14:08:29',2,1,4),('db_freknur_general','tbl_notification','2022-10-16 01:55:42',43,1,4),('db_freknur_general','tbl_owner_portfolio_temp_list','2022-09-30 14:41:01',0,1,3),('db_freknur_general','tbl_transaction','2022-09-30 14:42:23',0,1,4),('db_freknur_general','tbl_wallet_transaction','2022-09-30 14:31:06',0,1,3),('db_freknur_inventory','tbl_inventory','2021-04-29 21:30:42',25,1,2),('db_freknur_inventory','tbl_sales','2021-04-14 22:14:45',0,1,2),('db_freknur_investment','tbl_account','2022-09-23 15:20:48',3,1,2),('db_freknur_investment','tbl_alternate_market_bid','2022-09-30 14:25:45',0,1,3),('db_freknur_investment','tbl_owner_portfolio','2022-10-11 13:25:34',2,1,3),('db_freknur_investment','tbl_owner_portfolio_backup','2022-09-30 14:23:41',0,1,3),('db_freknur_investment','tbl_owner_portfolio_temp_list','2022-10-11 13:25:44',2,1,3),('db_freknur_investment','tbl_purchase_request','2022-10-11 15:13:46',3,1,3),('db_freknur_investment','tbl_sale_bid','2022-09-30 14:19:44',0,1,4),('db_freknur_investment','tbl_sale_request','2022-10-18 09:00:00',2,1,3),('db_freknur_investment','tbl_sale_request_queue','2022-10-18 09:00:10',2,1,2),('db_freknur_investment','tbl_statement','2022-10-11 13:25:14',2,1,2),('db_freknur_investment','tbl_transaction','2022-10-11 15:13:36',6,1,4),('db_freknur_loan','#sql-3466_bdd95f3','2021-07-26 09:28:24',0,1,3),('db_freknur_loan','notification_template','2020-06-24 23:15:12',0,1,0),('db_freknur_loan','status','2020-06-24 23:14:17',0,1,0),('db_freknur_loan','tbl_account','2022-09-30 14:06:44',4,1,2),('db_freknur_loan','tbl_broadcast','2021-10-05 17:25:11',0,1,0),('db_freknur_loan','tbl_credit_score','2021-10-05 17:23:08',0,1,2),('db_freknur_loan','tbl_debtor','2022-10-16 05:55:42',1,1,5),('db_freknur_loan','tbl_defaulter','2022-09-29 13:10:54',0,1,2),('db_freknur_loan','tbl_language','2021-10-05 17:21:39',0,1,1),('db_freknur_loan','tbl_loan_repayment','2021-10-05 17:20:04',0,1,4),('db_freknur_loan','tbl_loan_request','2022-10-06 09:55:40',1,1,5),('db_freknur_loan','tbl_mpesa_receipt','2022-09-29 13:11:36',0,1,4),('db_freknur_loan','tbl_transaction','2022-10-06 09:55:41',2,1,4),('db_freknur_loan','tbl_wallet','2022-10-06 09:51:34',9,1,5),('db_freknur_loan','tbl_wallet_extra','2022-05-26 14:44:29',0,1,2),('db_freknur_loan','tbl_wallet_transaction','2022-10-11 13:25:14',4,1,3),('db_freknur_notification','tbl_broadcast','2022-09-14 13:06:31',11,1,2),('db_freknur_paypal','tbl_ipn_receipt','2021-11-17 09:15:54',6,1,1),('db_freknur_paypal','tbl_paypal_bridge_temp','2021-11-11 20:31:13',0,1,1),('db_freknur_stats','tbl_approved_loan_stats','2022-09-28 11:28:18',4,1,1),('db_freknur_stats','tbl_debtor_stats','2022-05-24 09:04:36',0,1,1),('db_freknur_stats','tbl_loan_stats','2022-09-28 11:25:14',9,1,1),('db_freknur_stats','tbl_purchase_asset_stats','2022-05-24 09:06:34',0,1,1),('db_freknur_stats','tbl_rejected_loan_stats','2022-07-13 14:37:50',4,1,1),('db_freknur_stats','tbl_sale_asset_stats','2022-05-24 09:07:11',0,1,1),('db_freknur_wallet','#sql-572a_640dab8','2021-12-20 12:04:08',0,1,0),('db_freknur_wallet','betaTesters','2022-03-11 06:45:13',0,1,1),('db_freknur_wallet','deliverydetails','2022-03-14 09:50:32',0,1,0),('db_freknur_wallet','devicesim','2022-09-28 07:48:59',4,1,1),('db_freknur_wallet','eosaccounts','2022-03-14 09:50:49',0,1,5),('db_freknur_wallet','loginActivity','2022-10-06 10:52:27',86,1,0),('db_freknur_wallet','token_markets','2022-07-22 15:26:05',0,1,0),('db_freknur_wallet','token_transactions','2022-10-11 15:13:36',6,1,0),('db_freknur_wallet','tokens','2022-09-29 13:26:18',2,1,1),('db_freknur_wallet','transactions','2022-10-18 08:59:16',203,3,0),('db_freknur_wallet','users','2022-09-29 13:24:04',2,1,2),('db_freknur_wallet','verification','2022-10-06 09:51:29',0,1,1),('mpesa_recon','migrations','2019-08-01 13:21:36',2,1,0),('mpesa_recon','password_resets','2019-08-01 13:21:36',0,1,0),('mpesa_recon','users','2019-08-01 13:21:35',0,1,0),('mpesaboc','auth_assignment','2019-09-16 14:30:53',0,1,0),('mpesaboc','auth_item','2019-09-16 14:30:53',0,1,1),('mpesaboc','auth_item_child','2019-09-16 14:30:52',0,1,1),('mpesaboc','auth_rule','2019-09-16 14:30:52',0,1,0),('mpesaboc','migration','2019-09-16 14:30:53',16,1,0),('mpesaboc','profile','2019-09-17 07:28:34',2,1,0),('mpesaboc','recons','2019-09-16 15:01:16',2,1,0),('mpesaboc','social_account','2019-09-16 13:49:32',0,1,2),('mpesaboc','token','2019-09-16 14:13:56',0,1,0),('mpesaboc','user','2019-09-17 07:28:34',2,1,2),('mysql','component','2021-08-04 11:15:53',1,1,0),('sportsbrain','countries','2019-04-29 12:23:29',4,1,0),('sportsbrain','leagues','2019-04-26 12:13:36',4,1,1),('sportsbrain','predictions','2019-04-26 13:46:53',79,1,1),('sys','sys_config','2019-02-07 13:12:48',6,1,0);
/*!40000 ALTER TABLE `innodb_table_stats` ENABLE KEYS */;

--
-- Table structure for table `password_history`
--

DROP TABLE IF EXISTS `password_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_history` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Password_timestamp` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `Password` text COLLATE utf8_bin,
  PRIMARY KEY (`Host`,`User`,`Password_timestamp` DESC)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Password history for user accounts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_history`
--

LOCK TABLES `password_history` WRITE;
/*!40000 ALTER TABLE `password_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin`
--

DROP TABLE IF EXISTS `plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugin` (
  `name` varchar(64) NOT NULL DEFAULT '',
  `dl` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='MySQL plugins';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin`
--

LOCK TABLES `plugin` WRITE;
/*!40000 ALTER TABLE `plugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procs_priv`
--

DROP TABLE IF EXISTS `procs_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `procs_priv` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Routine_name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Routine_type` enum('FUNCTION','PROCEDURE') COLLATE utf8_bin NOT NULL,
  `Grantor` varchar(288) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proc_priv` set('Execute','Alter Routine','Grant') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Host`,`Db`,`User`,`Routine_name`,`Routine_type`),
  KEY `Grantor` (`Grantor`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Procedure privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procs_priv`
--

LOCK TABLES `procs_priv` WRITE;
/*!40000 ALTER TABLE `procs_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `procs_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxies_priv`
--

DROP TABLE IF EXISTS `proxies_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proxies_priv` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proxied_host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `Proxied_user` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `With_grant` tinyint(1) NOT NULL DEFAULT '0',
  `Grantor` varchar(288) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Host`,`User`,`Proxied_host`,`Proxied_user`),
  KEY `Grantor` (`Grantor`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='User proxy privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxies_priv`
--

LOCK TABLES `proxies_priv` WRITE;
/*!40000 ALTER TABLE `proxies_priv` DISABLE KEYS */;
INSERT INTO `proxies_priv` VALUES ('localhost','root','','',1,'boot@connecting host','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `proxies_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replication_asynchronous_connection_failover`
--

DROP TABLE IF EXISTS `replication_asynchronous_connection_failover`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `replication_asynchronous_connection_failover` (
  `Channel_name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'The replication channel name that connects source and replica.',
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT 'The source hostname that the replica will attempt to switch over the replication connection to in case of a failure.',
  `Port` int unsigned NOT NULL COMMENT 'The source port that the replica will attempt to switch over the replication connection to in case of a failure.',
  `Network_namespace` char(64) NOT NULL COMMENT 'The source network namespace that the replica will attempt to switch over the replication connection to in case of a failure. If its value is empty, connections use the default (global) namespace.',
  `Weight` tinyint unsigned NOT NULL COMMENT 'The order in which the replica shall try to switch the connection over to when there are failures. Weight can be set to a number between 1 and 100, where 100 is the highest weight and 1 the lowest.',
  `Managed_name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'The name of the group which this server belongs to.',
  PRIMARY KEY (`Channel_name`,`Host`,`Port`,`Network_namespace`,`Managed_name`),
  KEY `Channel_name` (`Channel_name`,`Managed_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='The source configuration details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replication_asynchronous_connection_failover`
--

LOCK TABLES `replication_asynchronous_connection_failover` WRITE;
/*!40000 ALTER TABLE `replication_asynchronous_connection_failover` DISABLE KEYS */;
/*!40000 ALTER TABLE `replication_asynchronous_connection_failover` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replication_asynchronous_connection_failover_managed`
--

DROP TABLE IF EXISTS `replication_asynchronous_connection_failover_managed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `replication_asynchronous_connection_failover_managed` (
  `Channel_name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'The replication channel name that connects source and replica.',
  `Managed_name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'The name of the source which needs to be managed.',
  `Managed_type` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Determines the managed type.',
  `Configuration` json DEFAULT NULL COMMENT 'The data to help manage group. For Managed_type = GroupReplication, Configuration value should contain {"Primary_weight": 80, "Secondary_weight": 60}, so that it assigns weight=80 to PRIMARY of the group, and weight=60 for rest of the members in mysql.replication_asynchronous_connection_failover table.',
  PRIMARY KEY (`Channel_name`,`Managed_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='The managed source configuration details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replication_asynchronous_connection_failover_managed`
--

LOCK TABLES `replication_asynchronous_connection_failover_managed` WRITE;
/*!40000 ALTER TABLE `replication_asynchronous_connection_failover_managed` DISABLE KEYS */;
/*!40000 ALTER TABLE `replication_asynchronous_connection_failover_managed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replication_group_configuration_version`
--

DROP TABLE IF EXISTS `replication_group_configuration_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `replication_group_configuration_version` (
  `name` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT 'The configuration name.',
  `version` bigint unsigned NOT NULL COMMENT 'The version of the configuration name.',
  PRIMARY KEY (`name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='The group configuration version.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replication_group_configuration_version`
--

LOCK TABLES `replication_group_configuration_version` WRITE;
/*!40000 ALTER TABLE `replication_group_configuration_version` DISABLE KEYS */;
INSERT INTO `replication_group_configuration_version` VALUES ('replication_group_member_actions',1);
/*!40000 ALTER TABLE `replication_group_configuration_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replication_group_member_actions`
--

DROP TABLE IF EXISTS `replication_group_member_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `replication_group_member_actions` (
  `name` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT 'The action name.',
  `event` char(64) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT 'The event that will trigger the action.',
  `enabled` tinyint(1) NOT NULL COMMENT 'Whether the action is enabled.',
  `type` char(64) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT 'The action type.',
  `priority` tinyint unsigned NOT NULL COMMENT 'The order on which the action will be run, value between 1 and 100, lower values first.',
  `error_handling` char(64) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT 'On errors during the action will be handled: IGNORE, CRITICAL.',
  PRIMARY KEY (`name`,`event`),
  KEY `event` (`event`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='The member actions configuration.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replication_group_member_actions`
--

LOCK TABLES `replication_group_member_actions` WRITE;
/*!40000 ALTER TABLE `replication_group_member_actions` DISABLE KEYS */;
INSERT INTO `replication_group_member_actions` VALUES ('mysql_disable_super_read_only_if_primary','AFTER_PRIMARY_ELECTION',1,'INTERNAL',1,'IGNORE');
/*!40000 ALTER TABLE `replication_group_member_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_edges`
--

DROP TABLE IF EXISTS `role_edges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_edges` (
  `FROM_HOST` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `FROM_USER` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `TO_HOST` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `TO_USER` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `WITH_ADMIN_OPTION` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`FROM_HOST`,`FROM_USER`,`TO_HOST`,`TO_USER`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Role hierarchy and role grants';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_edges`
--

LOCK TABLES `role_edges` WRITE;
/*!40000 ALTER TABLE `role_edges` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_edges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_cost`
--

DROP TABLE IF EXISTS `server_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `server_cost` (
  `cost_name` varchar(64) NOT NULL,
  `cost_value` float DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` varchar(1024) DEFAULT NULL,
  `default_value` float GENERATED ALWAYS AS ((case `cost_name` when _utf8mb3'disk_temptable_create_cost' then 20.0 when _utf8mb3'disk_temptable_row_cost' then 0.5 when _utf8mb3'key_compare_cost' then 0.05 when _utf8mb3'memory_temptable_create_cost' then 1.0 when _utf8mb3'memory_temptable_row_cost' then 0.1 when _utf8mb3'row_evaluate_cost' then 0.1 else NULL end)) VIRTUAL,
  PRIMARY KEY (`cost_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_cost`
--

LOCK TABLES `server_cost` WRITE;
/*!40000 ALTER TABLE `server_cost` DISABLE KEYS */;
INSERT INTO `server_cost` (`cost_name`, `cost_value`, `last_update`, `comment`) VALUES ('disk_temptable_create_cost',NULL,'2019-02-07 13:12:48',NULL),('disk_temptable_row_cost',NULL,'2019-02-07 13:12:48',NULL),('key_compare_cost',NULL,'2019-02-07 13:12:48',NULL),('memory_temptable_create_cost',NULL,'2019-02-07 13:12:48',NULL),('memory_temptable_row_cost',NULL,'2019-02-07 13:12:48',NULL),('row_evaluate_cost',NULL,'2019-02-07 13:12:48',NULL);
/*!40000 ALTER TABLE `server_cost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servers`
--

DROP TABLE IF EXISTS `servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servers` (
  `Server_name` char(64) NOT NULL DEFAULT '',
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `Db` char(64) NOT NULL DEFAULT '',
  `Username` char(64) NOT NULL DEFAULT '',
  `Password` char(64) NOT NULL DEFAULT '',
  `Port` int NOT NULL DEFAULT '0',
  `Socket` char(64) NOT NULL DEFAULT '',
  `Wrapper` char(64) NOT NULL DEFAULT '',
  `Owner` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`Server_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='MySQL Foreign Servers table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servers`
--

LOCK TABLES `servers` WRITE;
/*!40000 ALTER TABLE `servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slave_master_info`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `slave_master_info` (
  `Number_of_lines` int unsigned NOT NULL COMMENT 'Number of lines in the file.',
  `Master_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The name of the master binary log currently being read from the master.',
  `Master_log_pos` bigint unsigned NOT NULL COMMENT 'The master log position of the last read event.',
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL COMMENT 'The host name of the master.',
  `User_name` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The user name used to connect to the master.',
  `User_password` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The password used to connect to the master.',
  `Port` int unsigned NOT NULL COMMENT 'The network port used to connect to the master.',
  `Connect_retry` int unsigned NOT NULL COMMENT 'The period (in seconds) that the slave will wait before trying to reconnect to the master.',
  `Enabled_ssl` tinyint(1) NOT NULL COMMENT 'Indicates whether the server supports SSL connections.',
  `Ssl_ca` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The file used for the Certificate Authority (CA) certificate.',
  `Ssl_capath` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The path to the Certificate Authority (CA) certificates.',
  `Ssl_cert` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The name of the SSL certificate file.',
  `Ssl_cipher` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The name of the cipher in use for the SSL connection.',
  `Ssl_key` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The name of the SSL key file.',
  `Ssl_verify_server_cert` tinyint(1) NOT NULL COMMENT 'Whether to verify the server certificate.',
  `Heartbeat` float NOT NULL,
  `Bind` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'Displays which interface is employed when connecting to the MySQL server',
  `Ignored_server_ids` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The number of server IDs to be ignored, followed by the actual server IDs',
  `Uuid` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The master server uuid.',
  `Retry_count` bigint unsigned NOT NULL COMMENT 'Number of reconnect attempts, to the master, before giving up.',
  `Ssl_crl` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The file used for the Certificate Revocation List (CRL)',
  `Ssl_crlpath` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The path used for Certificate Revocation List (CRL) files',
  `Enabled_auto_position` tinyint(1) NOT NULL COMMENT 'Indicates whether GTIDs will be used to retrieve events from the master.',
  `Channel_name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'The channel on which the slave is connected to a source. Used in Multisource Replication',
  `Tls_version` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'Tls version',
  `Public_key_path` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The file containing public key of master server.',
  `Get_public_key` tinyint(1) NOT NULL COMMENT 'Preference to get public key from master.',
  `Network_namespace` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'Network namespace used for communication with the master server.',
  `Master_compression_algorithm` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Compression algorithm supported for data transfer between master and slave.',
  `Master_zstd_compression_level` int unsigned NOT NULL COMMENT 'Compression level associated with zstd compression algorithm.',
  `Tls_ciphersuites` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'Ciphersuites used for TLS 1.3 communication with the master server.',
  `Source_connection_auto_failover` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Indicates whether the channel connection failover is enabled.',
  PRIMARY KEY (`Channel_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Master Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slave_relay_log_info`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `slave_relay_log_info` (
  `Number_of_lines` int unsigned NOT NULL COMMENT 'Number of lines in the file or rows in the table. Used to version table definitions.',
  `Relay_log_name` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The name of the current relay log file.',
  `Relay_log_pos` bigint unsigned DEFAULT NULL COMMENT 'The relay log position of the last executed event.',
  `Master_log_name` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The name of the master binary log file from which the events in the relay log file were read.',
  `Master_log_pos` bigint unsigned DEFAULT NULL COMMENT 'The master log position of the last executed event.',
  `Sql_delay` int DEFAULT NULL COMMENT 'The number of seconds that the slave must lag behind the master.',
  `Number_of_workers` int unsigned DEFAULT NULL,
  `Id` int unsigned DEFAULT NULL COMMENT 'Internal Id that uniquely identifies this record.',
  `Channel_name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'The channel on which the slave is connected to a source. Used in Multisource Replication',
  `Privilege_checks_username` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Username part of PRIVILEGE_CHECKS_USER.',
  `Privilege_checks_hostname` char(255) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL COMMENT 'Hostname part of PRIVILEGE_CHECKS_USER.',
  `Require_row_format` tinyint(1) NOT NULL COMMENT 'Indicates whether the channel shall only accept row based events.',
  `Require_table_primary_key_check` enum('STREAM','ON','OFF') NOT NULL DEFAULT 'STREAM' COMMENT 'Indicates what is the channel policy regarding tables having primary keys on create and alter table queries',
  `Assign_gtids_to_anonymous_transactions_type` enum('OFF','LOCAL','UUID') NOT NULL DEFAULT 'OFF' COMMENT 'Indicates whether the channel will generate a new GTID for anonymous transactions. OFF means that anonymous transactions will remain anonymous. LOCAL means that anonymous transactions will be assigned a newly generated GTID based on server_uuid. UUID indicates that anonymous transactions will be assigned a newly generated GTID based on Assign_gtids_to_anonymous_transactions_value',
  `Assign_gtids_to_anonymous_transactions_value` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'Indicates the UUID used while generating GTIDs for anonymous transactions',
  PRIMARY KEY (`Channel_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Relay Log Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slave_worker_info`
--

DROP TABLE IF EXISTS `slave_worker_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slave_worker_info` (
  `Id` int unsigned NOT NULL,
  `Relay_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Relay_log_pos` bigint unsigned NOT NULL,
  `Master_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Master_log_pos` bigint unsigned NOT NULL,
  `Checkpoint_relay_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Checkpoint_relay_log_pos` bigint unsigned NOT NULL,
  `Checkpoint_master_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Checkpoint_master_log_pos` bigint unsigned NOT NULL,
  `Checkpoint_seqno` int unsigned NOT NULL,
  `Checkpoint_group_size` int unsigned NOT NULL,
  `Checkpoint_group_bitmap` blob NOT NULL,
  `Channel_name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'The channel on which the slave is connected to a source. Used in Multisource Replication',
  PRIMARY KEY (`Channel_name`,`Id`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Worker Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slave_worker_info`
--

LOCK TABLES `slave_worker_info` WRITE;
/*!40000 ALTER TABLE `slave_worker_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `slave_worker_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tables_priv`
--

DROP TABLE IF EXISTS `tables_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tables_priv` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Table_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Grantor` varchar(288) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Table_priv` set('Select','Insert','Update','Delete','Create','Drop','Grant','References','Index','Alter','Create View','Show view','Trigger') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`,`Db`,`User`,`Table_name`),
  KEY `Grantor` (`Grantor`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Table privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables_priv`
--

LOCK TABLES `tables_priv` WRITE;
/*!40000 ALTER TABLE `tables_priv` DISABLE KEYS */;
INSERT INTO `tables_priv` VALUES ('localhost','mysql','mysql.session','user','boot@connecting host','0000-00-00 00:00:00','Select',''),('localhost','sys','mysql.sys','sys_config','root@localhost','2019-02-07 13:12:48','Select','');
/*!40000 ALTER TABLE `tables_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone`
--

DROP TABLE IF EXISTS `time_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_zone` (
  `Time_zone_id` int unsigned NOT NULL AUTO_INCREMENT,
  `Use_leap_seconds` enum('Y','N') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Time_zone_id`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Time zones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone`
--

LOCK TABLES `time_zone` WRITE;
/*!40000 ALTER TABLE `time_zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_leap_second`
--

DROP TABLE IF EXISTS `time_zone_leap_second`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_zone_leap_second` (
  `Transition_time` bigint NOT NULL,
  `Correction` int NOT NULL,
  PRIMARY KEY (`Transition_time`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Leap seconds information for time zones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_leap_second`
--

LOCK TABLES `time_zone_leap_second` WRITE;
/*!40000 ALTER TABLE `time_zone_leap_second` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_leap_second` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_name`
--

DROP TABLE IF EXISTS `time_zone_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_zone_name` (
  `Name` char(64) NOT NULL,
  `Time_zone_id` int unsigned NOT NULL,
  PRIMARY KEY (`Name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Time zone names';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_name`
--

LOCK TABLES `time_zone_name` WRITE;
/*!40000 ALTER TABLE `time_zone_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_transition`
--

DROP TABLE IF EXISTS `time_zone_transition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_zone_transition` (
  `Time_zone_id` int unsigned NOT NULL,
  `Transition_time` bigint NOT NULL,
  `Transition_type_id` int unsigned NOT NULL,
  PRIMARY KEY (`Time_zone_id`,`Transition_time`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Time zone transitions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_transition`
--

LOCK TABLES `time_zone_transition` WRITE;
/*!40000 ALTER TABLE `time_zone_transition` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_transition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_transition_type`
--

DROP TABLE IF EXISTS `time_zone_transition_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_zone_transition_type` (
  `Time_zone_id` int unsigned NOT NULL,
  `Transition_type_id` int unsigned NOT NULL,
  `Offset` int NOT NULL DEFAULT '0',
  `Is_DST` tinyint unsigned NOT NULL DEFAULT '0',
  `Abbreviation` char(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`Time_zone_id`,`Transition_type_id`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Time zone transition types';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_transition_type`
--

LOCK TABLES `time_zone_transition_type` WRITE;
/*!40000 ALTER TABLE `time_zone_transition_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_transition_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Reload_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Shutdown_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Process_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `File_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Show_db_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Super_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Repl_slave_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Repl_client_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_user_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_tablespace_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `ssl_type` enum('','ANY','X509','SPECIFIED') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `ssl_cipher` blob NOT NULL,
  `x509_issuer` blob NOT NULL,
  `x509_subject` blob NOT NULL,
  `max_questions` int unsigned NOT NULL DEFAULT '0',
  `max_updates` int unsigned NOT NULL DEFAULT '0',
  `max_connections` int unsigned NOT NULL DEFAULT '0',
  `max_user_connections` int unsigned NOT NULL DEFAULT '0',
  `plugin` char(64) COLLATE utf8_bin NOT NULL DEFAULT 'caching_sha2_password',
  `authentication_string` text COLLATE utf8_bin,
  `password_expired` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `password_last_changed` timestamp NULL DEFAULT NULL,
  `password_lifetime` smallint unsigned DEFAULT NULL,
  `account_locked` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_role_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Drop_role_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Password_reuse_history` smallint unsigned DEFAULT NULL,
  `Password_reuse_time` smallint unsigned DEFAULT NULL,
  `Password_require_current` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `User_attributes` json DEFAULT NULL,
  PRIMARY KEY (`Host`,`User`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Users and global privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('%','africastalking','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'mysql_native_password','*6C3FA75CE285DAA1EEB168B02781B88E578E513F','N','2019-05-28 13:24:00',NULL,'N','N','N',NULL,NULL,NULL,NULL),('%','api','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0,'mysql_native_password','*723273D23AFC721CD0092374417C15197A02777E','N','2019-03-20 07:46:51',NULL,'N','Y','Y',NULL,NULL,NULL,NULL),('%','freknur','Y','Y','Y','Y','Y','Y','Y','N','Y','N','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','N','','','','',0,0,0,0,'mysql_native_password','*82FCA9773CD6CDC24DBC153F2193797216CC9C35','N','2020-09-07 11:56:10',NULL,'N','Y','Y',NULL,NULL,NULL,NULL),('%','mpesa','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'mysql_native_password','*DE7B13B3C8F10B74DEF345C2A78E8E2735F496F5','N','2019-09-16 13:08:26',NULL,'N','N','N',NULL,NULL,NULL,NULL),('%','mpesa_recon','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'mysql_native_password','*69AD3997851609DD465517A83499AB22F30401F0','N','2019-08-01 13:12:12',NULL,'N','N','N',NULL,NULL,NULL,NULL),('%','slaveuser','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','Y','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'sha256_password','$5$`z-\'GM[	7b2=uPk$LhcUlm3HtNxaTSrSIcIE4mUBFZHbThpwM5RE8CQOiNC','N','2019-02-07 16:25:11',NULL,'N','N','N',NULL,NULL,NULL,NULL),('%','sportsbrain','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'mysql_native_password','*148CBA5CE3420772FE5D62B2652DED8EEF6BF11A','N','2019-03-14 12:06:41',NULL,'N','N','N',NULL,NULL,NULL,NULL),('10.142.0.2','slave_user','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','Y','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'caching_sha2_password','$A$005$uZ3kTEK5uTCH8G4/qcOWNBjVPqYER2Jw/k/YyzM570g4DhbVFZTbzT.rC2','N','2019-02-07 14:29:48',NULL,'N','N','N',NULL,NULL,NULL,NULL),('landing-server','haproxy_check','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'sha256_password','$5$E^7\Z!h6	7)7/Qed%$36B08sizpQTA8kWcHkJYwANMAWGOQo5IMC..rnlbMw3','N','2019-02-15 14:09:46',NULL,'N','N','N',NULL,NULL,NULL,NULL),('localhost','mysql.infoschema','Y','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'caching_sha2_password','$A$005$THISISACOMBINATIONOFINVALIDSALTANDPASSWORDTHATMUSTNEVERBRBEUSED','N','2019-02-07 13:12:48',NULL,'Y','N','N',NULL,NULL,NULL,NULL),('localhost','mysql.session','N','N','N','N','N','N','N','Y','N','N','N','N','N','N','N','Y','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'caching_sha2_password','$A$005$THISISACOMBINATIONOFINVALIDSALTANDPASSWORDTHATMUSTNEVERBRBEUSED','N','2019-02-07 13:12:48',NULL,'Y','N','N',NULL,NULL,NULL,NULL),('localhost','mysql.sys','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'caching_sha2_password','$A$005$THISISACOMBINATIONOFINVALIDSALTANDPASSWORDTHATMUSTNEVERBRBEUSED','N','2019-02-07 13:12:48',NULL,'Y','N','N',NULL,NULL,NULL,NULL),('localhost','root','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0,'mysql_native_password','*6408F200E85F55B0D3A01DF0C9C16E236C40A517','N','2021-08-04 09:30:20',NULL,'N','Y','Y',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `general_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `general_log` (
  `event_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `user_host` mediumtext NOT NULL,
  `thread_id` bigint unsigned NOT NULL,
  `server_id` int unsigned NOT NULL,
  `command_type` varchar(64) NOT NULL,
  `argument` mediumblob NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8mb3 COMMENT='General log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slow_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `slow_log` (
  `start_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `user_host` mediumtext NOT NULL,
  `query_time` time(6) NOT NULL,
  `lock_time` time(6) NOT NULL,
  `rows_sent` int NOT NULL,
  `rows_examined` int NOT NULL,
  `db` varchar(512) NOT NULL,
  `last_insert_id` int NOT NULL,
  `insert_id` int NOT NULL,
  `server_id` int unsigned NOT NULL,
  `sql_text` mediumblob NOT NULL,
  `thread_id` bigint unsigned NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8mb3 COMMENT='Slow log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `africastalking`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `africastalking` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `africastalking`;

--
-- Table structure for table `bulk_sms_logs`
--

DROP TABLE IF EXISTS `bulk_sms_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bulk_sms_logs` (
  `messageId` varchar(100) DEFAULT NULL,
  `statusCode` varchar(10) DEFAULT NULL,
  `number` varchar(30) DEFAULT NULL,
  `cost` varchar(30) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `logtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `track` int DEFAULT '0',
  KEY `messageId` (`messageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulk_sms_logs`
--

LOCK TABLES `bulk_sms_logs` WRITE;
/*!40000 ALTER TABLE `bulk_sms_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulk_sms_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incoming_sms_log`
--

DROP TABLE IF EXISTS `incoming_sms_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incoming_sms_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` text,
  `inTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incoming_sms_log`
--

LOCK TABLES `incoming_sms_log` WRITE;
/*!40000 ALTER TABLE `incoming_sms_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `incoming_sms_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sent_sms_logs`
--

DROP TABLE IF EXISTS `sent_sms_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sent_sms_logs` (
  `messageId` varchar(100) DEFAULT NULL,
  `statusCode` varchar(10) DEFAULT NULL,
  `number` varchar(30) DEFAULT NULL,
  `cost` varchar(30) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `logtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `messageId` (`messageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sent_sms_logs`
--

LOCK TABLES `sent_sms_logs` WRITE;
/*!40000 ALTER TABLE `sent_sms_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `sent_sms_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `db_betting_moniter`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `db_betting_moniter` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `db_betting_moniter`;

--
-- Table structure for table `bookmaker`
--

DROP TABLE IF EXISTS `bookmaker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookmaker` (
  `_ID` int NOT NULL AUTO_INCREMENT,
  `PayBill` varchar(6) NOT NULL,
  `PayBillOwner` varchar(20) DEFAULT 'NiL',
  `AssigneeName` varchar(40) DEFAULT 'NiL',
  `Country` varchar(50) DEFAULT 'NiL',
  `DateCreated` datetime DEFAULT NULL,
  `DateModified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `IsArchived` int DEFAULT '0',
  PRIMARY KEY (`_ID`),
  UNIQUE KEY `PayBill` (`PayBill`),
  KEY `IsArchived` (`IsArchived`),
  FULLTEXT KEY `Country` (`Country`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmaker`
--

LOCK TABLES `bookmaker` WRITE;
/*!40000 ALTER TABLE `bookmaker` DISABLE KEYS */;
INSERT INTO `bookmaker` VALUES (1,'641394','Safaricom','Betvantage','kenya','2019-09-03 09:31:39','2019-09-03 09:31:39',0);
/*!40000 ALTER TABLE `bookmaker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `govttaxinformation`
--

DROP TABLE IF EXISTS `govttaxinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `govttaxinformation` (
  `_ID` int NOT NULL AUTO_INCREMENT,
  `TaxOnDeposit` double(7,2) NOT NULL DEFAULT '0.00',
  `TaxOnReward` double(7,2) NOT NULL DEFAULT '0.00',
  `Country` varchar(80) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `DateModified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` varchar(15) DEFAULT NULL,
  `ModifiedBy` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`_ID`),
  UNIQUE KEY `Country` (`Country`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `govttaxinformation`
--

LOCK TABLES `govttaxinformation` WRITE;
/*!40000 ALTER TABLE `govttaxinformation` DISABLE KEYS */;
INSERT INTO `govttaxinformation` VALUES (1,5.00,20.00,'kenya','2019-09-03 09:32:15','2019-09-03 09:32:15',NULL,NULL);
/*!40000 ALTER TABLE `govttaxinformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mno`
--

DROP TABLE IF EXISTS `mno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mno` (
  `_ID` int NOT NULL AUTO_INCREMENT,
  `MNO` varchar(25) NOT NULL,
  `Country` varchar(50) NOT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `DateModified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `IsDeleted` int DEFAULT '0',
  PRIMARY KEY (`_ID`),
  KEY `IsDeleted` (`IsDeleted`),
  FULLTEXT KEY `Country` (`Country`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mno`
--

LOCK TABLES `mno` WRITE;
/*!40000 ALTER TABLE `mno` DISABLE KEYS */;
INSERT INTO `mno` VALUES (1,'Safaricom','kenya','2019-09-03 09:30:20','2019-09-03 09:30:20',0),(2,'Airtel Kenya','kenya','2019-09-19 09:50:58','2019-09-19 09:50:58',0),(3,'Telkom Kenya','kenya','2019-09-19 10:44:21','2019-09-19 10:44:21',0),(4,'test','botswana','2019-09-19 12:06:01','2019-09-19 12:06:01',0);
/*!40000 ALTER TABLE `mno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revenuelog`
--

DROP TABLE IF EXISTS `revenuelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revenuelog` (
  `_ID` int NOT NULL AUTO_INCREMENT,
  `Bookmaker` varchar(40) NOT NULL DEFAULT 'NiL',
  `BillNumber` varchar(10) NOT NULL,
  `StakeAmount` double(7,2) DEFAULT '0.00',
  `TaxOnDeposit` double(7,2) DEFAULT '0.00',
  `TaxOnReward` double(7,2) DEFAULT '0.00',
  `MNO` varchar(25) DEFAULT NULL,
  `Country` varchar(25) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `DateModified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `IsArchieved` int DEFAULT '0',
  PRIMARY KEY (`_ID`,`Bookmaker`),
  KEY `IsArchieved` (`IsArchieved`),
  FULLTEXT KEY `Country` (`Country`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revenuelog`
--

LOCK TABLES `revenuelog` WRITE;
/*!40000 ALTER TABLE `revenuelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `revenuelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statssummary`
--

DROP TABLE IF EXISTS `statssummary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statssummary` (
  `_ID` int NOT NULL AUTO_INCREMENT,
  `NoOfMobileOperator` int DEFAULT '0',
  `NoOfBookmaker` int DEFAULT '0',
  `TotalStake` double(7,2) DEFAULT '0.00',
  `TotalTax` double(7,2) DEFAULT '0.00',
  `DateCreated` datetime DEFAULT NULL,
  `DateModified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `IsDeleted` int DEFAULT '0',
  PRIMARY KEY (`_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statssummary`
--

LOCK TABLES `statssummary` WRITE;
/*!40000 ALTER TABLE `statssummary` DISABLE KEYS */;
INSERT INTO `statssummary` VALUES (1,1,0,0.00,0.00,'2019-09-19 12:06:00','2019-09-19 12:06:00',0);
/*!40000 ALTER TABLE `statssummary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statssummary_archive`
--

DROP TABLE IF EXISTS `statssummary_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statssummary_archive` (
  `_ID` int NOT NULL AUTO_INCREMENT,
  `NoOfMobileOperator` int DEFAULT '0',
  `NoOfBookmaker` int DEFAULT '0',
  `TotalStake` double(7,2) DEFAULT '0.00',
  `TotalTax` double(7,2) DEFAULT '0.00',
  `DateCreated` datetime DEFAULT NULL,
  `DateModified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `IsDeleted` int DEFAULT '0',
  PRIMARY KEY (`_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statssummary_archive`
--

LOCK TABLES `statssummary_archive` WRITE;
/*!40000 ALTER TABLE `statssummary_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `statssummary_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `db_betvantage`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `db_betvantage` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `db_betvantage`;

--
-- Table structure for table `tbl_access_outh`
--

DROP TABLE IF EXISTS `tbl_access_outh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_access_outh` (
  `_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `ConsumerSecret` varchar(50) NOT NULL,
  `ConsumerKey` varchar(50) NOT NULL,
  `Token` varchar(50) DEFAULT NULL,
  `DateCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `DateModified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `IsDeleted` int DEFAULT '0',
  PRIMARY KEY (`_ID`),
  UNIQUE KEY `Name` (`Name`),
  KEY `is_deleted` (`IsDeleted`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_access_outh`
--

LOCK TABLES `tbl_access_outh` WRITE;
/*!40000 ALTER TABLE `tbl_access_outh` DISABLE KEYS */;
INSERT INTO `tbl_access_outh` VALUES (1,'betvantage','JMNLwQufYBkPjd2zRAHcIbo1mUKF6h7l','4XRVbjPEkUoyYMWu','G8FdDOqnZxMkCuc74Pf12jWUiv5p','2019-03-20 09:04:48','2019-03-20 09:15:28',0);
/*!40000 ALTER TABLE `tbl_access_outh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_betconstruct`
--

DROP TABLE IF EXISTS `tbl_betconstruct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_betconstruct` (
  `_ID` int NOT NULL AUTO_INCREMENT,
  `TransID` varchar(25) NOT NULL,
  `TransTime` varchar(18) NOT NULL,
  `TransAmount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `BusinessShortCode` varchar(8) NOT NULL,
  `BillRefNumber` varchar(25) DEFAULT NULL,
  `MSISDN` varchar(15) NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `MiddleName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `DateCreated` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ResponseStatus` varchar(50) DEFAULT NULL,
  `IsPulled` int DEFAULT '0',
  PRIMARY KEY (`_ID`),
  UNIQUE KEY `TransID` (`TransID`),
  KEY `MSISDN` (`MSISDN`),
  KEY `IsPulled` (`IsPulled`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_betconstruct`
--

LOCK TABLES `tbl_betconstruct` WRITE;
/*!40000 ALTER TABLE `tbl_betconstruct` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_betconstruct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_client_outh`
--

DROP TABLE IF EXISTS `tbl_client_outh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_client_outh` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `consumer_key` varchar(50) NOT NULL,
  `consumer_secret` varchar(50) NOT NULL,
  `token` varchar(50) NOT NULL DEFAULT '0',
  `short_code` varchar(6) NOT NULL,
  `token_lifespan` varchar(10) NOT NULL DEFAULT '3599',
  `date_created` datetime NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_registered` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `consumer_key` (`consumer_key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_client_outh`
--

LOCK TABLES `tbl_client_outh` WRITE;
/*!40000 ALTER TABLE `tbl_client_outh` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_client_outh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_mpesa_transaction_log`
--

DROP TABLE IF EXISTS `tbl_mpesa_transaction_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_mpesa_transaction_log` (
  `_ID` int NOT NULL AUTO_INCREMENT,
  `TransID` varchar(25) NOT NULL,
  `TransTime` varchar(50) NOT NULL,
  `TransAmount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `BusinessShortCode` varchar(6) NOT NULL,
  `BillRefNumber` varchar(50) DEFAULT 'account',
  `MSISDN` varchar(15) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `MiddleName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `OrgAccountBalance` varchar(50) DEFAULT NULL,
  `InvoiceNumber` varchar(50) DEFAULT NULL,
  `ThirdPartyTransID` varchar(50) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `DateModified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `IsArchived` int DEFAULT '0',
  PRIMARY KEY (`_ID`),
  UNIQUE KEY `trx_ref` (`TransID`),
  KEY `IndxMobile` (`MSISDN`),
  KEY `IndxArchived` (`IsArchived`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_mpesa_transaction_log`
--

LOCK TABLES `tbl_mpesa_transaction_log` WRITE;
/*!40000 ALTER TABLE `tbl_mpesa_transaction_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_mpesa_transaction_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_betconstruct` AFTER INSERT ON `tbl_mpesa_transaction_log` FOR EACH ROW BEGIN
	INSERT 
	INTO 
	tbl_betconstruct
	(
		`TransID`,
		`TransTime`,
		`TransAmount`,
		`BusinessShortCode`,
		`BillRefNumber`,
		`MSISDN`,
		`FirstName`,
		`MiddleName`,
		`LastName`
	) 
	VALUES
	(
		NEW.TransID,
		NEW.TransTime,
		NEW.TransAmount,
		NEW.BusinessShortCode,
		NEW.BillRefNumber,
		NEW.MSISDN,
		NEW.FirstName,
		NEW.MiddleName,
		NEW.LastName
	);
	
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `db_betvantage_promo`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `db_betvantage_promo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `db_betvantage_promo`;

--
-- Table structure for table `tbl_group`
--

DROP TABLE IF EXISTS `tbl_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_group` (
  `_id` tinyint NOT NULL AUTO_INCREMENT,
  `channel` varchar(25) NOT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_group`
--

LOCK TABLES `tbl_group` WRITE;
/*!40000 ALTER TABLE `tbl_group` DISABLE KEYS */;
INSERT INTO `tbl_group` VALUES (1,'loan'),(2,'grain');
/*!40000 ALTER TABLE `tbl_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_heap`
--

DROP TABLE IF EXISTS `tbl_heap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_heap` (
  `msisdn` varchar(15) NOT NULL,
  UNIQUE KEY `msisdn_unik` (`msisdn`),
  KEY `msisdn` (`msisdn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_heap`
--

LOCK TABLES `tbl_heap` WRITE;
/*!40000 ALTER TABLE `tbl_heap` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_heap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_setup`
--

DROP TABLE IF EXISTS `tbl_setup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_setup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `promotion_name` varchar(50) NOT NULL,
  `message` varchar(500) NOT NULL,
  `channel` varchar(25) NOT NULL,
  `lower` int DEFAULT '0',
  `upper` int DEFAULT '0',
  `date_created` datetime DEFAULT NULL,
  `campaign_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `processed` int DEFAULT '1',
  `locked` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `processed` (`processed`),
  KEY `lower` (`lower`),
  KEY `upper` (`upper`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_setup`
--

LOCK TABLES `tbl_setup` WRITE;
/*!40000 ALTER TABLE `tbl_setup` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_setup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_setup_temp`
--

DROP TABLE IF EXISTS `tbl_setup_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_setup_temp` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `rec_id` varchar(10) DEFAULT NULL,
  `promotion_name` varchar(25) NOT NULL,
  `message` varchar(420) NOT NULL,
  `channel` varchar(25) NOT NULL,
  `campaign_date` datetime DEFAULT NULL,
  `is_processed` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `is_processed` (`is_processed`),
  KEY `rec_id` (`rec_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_setup_temp`
--

LOCK TABLES `tbl_setup_temp` WRITE;
/*!40000 ALTER TABLE `tbl_setup_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_setup_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_subscription`
--

DROP TABLE IF EXISTS `tbl_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_subscription` (
  `_id` int NOT NULL AUTO_INCREMENT,
  `msisdn` varchar(15) NOT NULL,
  `channel` varchar(25) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `roll_count` int DEFAULT '0',
  `is_active` int DEFAULT '1',
  PRIMARY KEY (`_id`),
  UNIQUE KEY `msisdn_unik` (`msisdn`),
  KEY `is_active` (`is_active`),
  KEY `msisdn` (`msisdn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_subscription`
--

LOCK TABLES `tbl_subscription` WRITE;
/*!40000 ALTER TABLE `tbl_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_temp`
--

DROP TABLE IF EXISTS `tbl_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_temp` (
  `msisdn` varchar(15) NOT NULL,
  `is_processed` int DEFAULT '0',
  KEY `msisdn` (`msisdn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_temp`
--

LOCK TABLES `tbl_temp` WRITE;
/*!40000 ALTER TABLE `tbl_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `db_betvantage_wallet`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `db_betvantage_wallet` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `db_betvantage_wallet`;

--
-- Table structure for table `misc`
--

DROP TABLE IF EXISTS `misc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `misc` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Msisdn` varchar(15) DEFAULT NULL,
  `Message` varchar(420) DEFAULT NULL,
  `IsArchived` int DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `misc`
--

LOCK TABLES `misc` WRITE;
/*!40000 ALTER TABLE `misc` DISABLE KEYS */;
/*!40000 ALTER TABLE `misc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_account_summary`
--

DROP TABLE IF EXISTS `tbl_account_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_account_summary` (
  `_id` int NOT NULL AUTO_INCREMENT,
  `account_name` varchar(25) NOT NULL,
  `running_bal` double(15,2) DEFAULT '0.00',
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `account_name` (`account_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_account_summary`
--

LOCK TABLES `tbl_account_summary` WRITE;
/*!40000 ALTER TABLE `tbl_account_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_account_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_configuration`
--

DROP TABLE IF EXISTS `tbl_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_configuration` (
  `_id` int NOT NULL AUTO_INCREMENT,
  `bonus_rate` decimal(15,4) DEFAULT '0.0000',
  `bonus_level` decimal(15,4) DEFAULT '0.0000',
  `inmobia_income_rate` decimal(15,4) DEFAULT '0.0000',
  `partner_income_rate` decimal(15,4) DEFAULT '0.0000',
  `jackpot_rate` decimal(15,4) DEFAULT '0.0000',
  `jackpot_win_level` decimal(15,4) DEFAULT '0.0000',
  `language` int DEFAULT '0' COMMENT 'en - 0, fr - 1',
  PRIMARY KEY (`_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_configuration`
--

LOCK TABLES `tbl_configuration` WRITE;
/*!40000 ALTER TABLE `tbl_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_deposit_log`
--

DROP TABLE IF EXISTS `tbl_deposit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_deposit_log` (
  `deposit_id` int NOT NULL AUTO_INCREMENT,
  `transaction_refno` varchar(80) NOT NULL,
  `msisdn` varchar(18) NOT NULL,
  `client_name` varchar(100) DEFAULT NULL,
  `transaction_date` datetime DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`deposit_id`),
  UNIQUE KEY `transaction_refno` (`transaction_refno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_deposit_log`
--

LOCK TABLES `tbl_deposit_log` WRITE;
/*!40000 ALTER TABLE `tbl_deposit_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_deposit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_expense_trx`
--

DROP TABLE IF EXISTS `tbl_expense_trx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_expense_trx` (
  `trx_id` int NOT NULL AUTO_INCREMENT,
  `msisdn` varchar(18) NOT NULL,
  `cr` double(15,2) DEFAULT '0.00',
  `dr` double(15,2) DEFAULT '0.00',
  `particular` varchar(100) DEFAULT NULL,
  `transaction_date` datetime DEFAULT NULL,
  `is_archived` int DEFAULT '0',
  PRIMARY KEY (`trx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_expense_trx`
--

LOCK TABLES `tbl_expense_trx` WRITE;
/*!40000 ALTER TABLE `tbl_expense_trx` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_expense_trx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_fee_log`
--

DROP TABLE IF EXISTS `tbl_fee_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_fee_log` (
  `fee_id` int NOT NULL AUTO_INCREMENT,
  `msisdn` varchar(15) NOT NULL,
  `particulars` varchar(100) NOT NULL,
  `dr` decimal(7,2) NOT NULL DEFAULT '0.00',
  `cr` decimal(7,2) NOT NULL DEFAULT '0.00',
  `balance` decimal(7,2) NOT NULL DEFAULT '0.00',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_archived` int DEFAULT '0',
  PRIMARY KEY (`fee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_fee_log`
--

LOCK TABLES `tbl_fee_log` WRITE;
/*!40000 ALTER TABLE `tbl_fee_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_fee_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_income_trx`
--

DROP TABLE IF EXISTS `tbl_income_trx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_income_trx` (
  `trx_id` int NOT NULL AUTO_INCREMENT,
  `msisdn` varchar(18) NOT NULL,
  `cr` double(15,2) DEFAULT '0.00',
  `dr` double(15,2) DEFAULT '0.00',
  `particular` varchar(100) DEFAULT NULL,
  `transaction_date` datetime DEFAULT NULL,
  `is_archived` int DEFAULT '0',
  PRIMARY KEY (`trx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_income_trx`
--

LOCK TABLES `tbl_income_trx` WRITE;
/*!40000 ALTER TABLE `tbl_income_trx` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_income_trx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_incoming_sms`
--

DROP TABLE IF EXISTS `tbl_incoming_sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_incoming_sms` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `MSISDN` varchar(15) NOT NULL,
  `Message` varchar(480) DEFAULT NULL,
  `ShortCode` varchar(7) NOT NULL,
  `LinkID` varchar(50) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `DateModified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `IsProcessed` int DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IsProcessed` (`IsProcessed`),
  KEY `MSISDN` (`MSISDN`),
  KEY `ShortCode` (`ShortCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_incoming_sms`
--

LOCK TABLES `tbl_incoming_sms` WRITE;
/*!40000 ALTER TABLE `tbl_incoming_sms` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_incoming_sms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_outgoing_sms`
--

DROP TABLE IF EXISTS `tbl_outgoing_sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_outgoing_sms` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Destination` varchar(15) NOT NULL,
  `Message` varchar(1000) DEFAULT NULL,
  `Source` varchar(7) NOT NULL,
  `Status` varchar(100) NOT NULL DEFAULT '0',
  `DateCreated` datetime DEFAULT NULL,
  `DateModified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `IsProcessed` int DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IsProcessed` (`IsProcessed`),
  KEY `Destination` (`Destination`),
  KEY `Source` (`Source`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_outgoing_sms`
--

LOCK TABLES `tbl_outgoing_sms` WRITE;
/*!40000 ALTER TABLE `tbl_outgoing_sms` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_outgoing_sms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_stake_collection_trx`
--

DROP TABLE IF EXISTS `tbl_stake_collection_trx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_stake_collection_trx` (
  `trx_id` int NOT NULL AUTO_INCREMENT,
  `msisdn` varchar(18) NOT NULL,
  `cr` double(15,2) DEFAULT '0.00',
  `dr` double(15,2) DEFAULT '0.00',
  `particular` varchar(100) DEFAULT NULL,
  `transaction_date` datetime DEFAULT NULL,
  `is_archived` int DEFAULT '0',
  PRIMARY KEY (`trx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_stake_collection_trx`
--

LOCK TABLES `tbl_stake_collection_trx` WRITE;
/*!40000 ALTER TABLE `tbl_stake_collection_trx` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_stake_collection_trx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_system_configuration`
--

DROP TABLE IF EXISTS `tbl_system_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_system_configuration` (
  `mpesa_deposit` decimal(10,2) DEFAULT '0.00',
  `mpesa_withdrawal` decimal(10,2) DEFAULT '0.00',
  `registration_bonus` decimal(10,2) DEFAULT '0.00',
  `jackpot_bonus` decimal(10,2) DEFAULT '0.00',
  `excise_duty` decimal(10,2) DEFAULT '0.00',
  `house_income` decimal(10,2) DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_system_configuration`
--

LOCK TABLES `tbl_system_configuration` WRITE;
/*!40000 ALTER TABLE `tbl_system_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_system_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_system_log`
--

DROP TABLE IF EXISTS `tbl_system_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_system_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `msisdn` varchar(18) NOT NULL,
  `particular` varchar(100) DEFAULT NULL,
  `date_date` datetime DEFAULT NULL,
  `is_archived` int DEFAULT '0',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_system_log`
--

LOCK TABLES `tbl_system_log` WRITE;
/*!40000 ALTER TABLE `tbl_system_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_system_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_wallet`
--

DROP TABLE IF EXISTS `tbl_wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_wallet` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `MSISDN` varchar(17) NOT NULL,
  `ClientId` varchar(50) DEFAULT NULL,
  `FirstName` varchar(80) DEFAULT 'User',
  `MiddleName` varchar(80) DEFAULT 'Unspecified',
  `LastName` varchar(80) DEFAULT 'Unspecified',
  `Language` varchar(10) DEFAULT 'en',
  `PromotionNotificationFlag` int DEFAULT '0',
  `StakeCountTracker` int DEFAULT '0',
  `LastActivity` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateCreated` datetime DEFAULT NULL,
  `DateModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IsLocked` int DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `msisdn` (`MSISDN`),
  KEY `IsLocked` (`IsLocked`),
  KEY `INDEX_MSISDN` (`MSISDN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_wallet`
--

LOCK TABLES `tbl_wallet` WRITE;
/*!40000 ALTER TABLE `tbl_wallet` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_wallet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_wallet_ext`
--

DROP TABLE IF EXISTS `tbl_wallet_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_wallet_ext` (
  `_ID` int NOT NULL AUTO_INCREMENT,
  `MSISDN` varchar(18) NOT NULL,
  `Balance` decimal(10,2) DEFAULT '0.00',
  `Bonus` decimal(10,2) DEFAULT '0.00',
  `Password` varchar(100) NOT NULL,
  PRIMARY KEY (`_ID`),
  UNIQUE KEY `msisdn` (`MSISDN`),
  KEY `Password` (`Password`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_wallet_ext`
--

LOCK TABLES `tbl_wallet_ext` WRITE;
/*!40000 ALTER TABLE `tbl_wallet_ext` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_wallet_ext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_wallet_trx`
--

DROP TABLE IF EXISTS `tbl_wallet_trx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_wallet_trx` (
  `trx_id` int NOT NULL AUTO_INCREMENT,
  `msisdn` varchar(18) NOT NULL,
  `cr` double(15,2) DEFAULT '0.00',
  `dr` double(15,2) DEFAULT '0.00',
  `particulars` varchar(100) DEFAULT NULL,
  `transaction_date` datetime DEFAULT NULL,
  `is_archived` int DEFAULT '0',
  PRIMARY KEY (`trx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_wallet_trx`
--

LOCK TABLES `tbl_wallet_trx` WRITE;
/*!40000 ALTER TABLE `tbl_wallet_trx` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_wallet_trx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_withdrawal_log`
--

DROP TABLE IF EXISTS `tbl_withdrawal_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_withdrawal_log` (
  `withdrawal_id` int NOT NULL AUTO_INCREMENT,
  `msisdn` varchar(15) NOT NULL,
  `particulars` varchar(100) NOT NULL,
  `dr` decimal(7,2) NOT NULL DEFAULT '0.00',
  `cr` decimal(7,2) NOT NULL DEFAULT '0.00',
  `balance` decimal(7,2) NOT NULL DEFAULT '0.00',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_archived` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`withdrawal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_withdrawal_log`
--

LOCK TABLES `tbl_withdrawal_log` WRITE;
/*!40000 ALTER TABLE `tbl_withdrawal_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_withdrawal_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `db_freknur_general`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `db_freknur_general` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `db_freknur_general`;

--
-- Table structure for table `tbl_activity_log`
--

DROP TABLE IF EXISTS `tbl_activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_activity_log` (
  `_id` int NOT NULL AUTO_INCREMENT,
  `msisdn` varchar(15) DEFAULT NULL,
  `activity` varchar(420) DEFAULT NULL,
  `time_stamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `flag` int DEFAULT '0',
  PRIMARY KEY (`_id`),
  KEY `msisdn` (`msisdn`),
  KEY `flag` (`flag`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_activity_log`
--

LOCK TABLES `tbl_activity_log` WRITE;
/*!40000 ALTER TABLE `tbl_activity_log` DISABLE KEYS */;
INSERT INTO `tbl_activity_log` VALUES (1,'4915224043369','FREKNUR TOKEN WORTH: 0.0100 HAS BEEN BOUGHT.','2022-10-06 09:51:33',0),(2,'4915224043369','A LOAN REQUEST OF 2500 HAS BEEN MADE.','2022-10-06 09:55:40',0),(3,'4915224043369','UNSECURED LOAN: AMOUNT OF 2450.0 HAS BEEN MOVED TO CLIENT WALLET A/C. REPAYMENT AMOUNT: 3125.0','2022-10-06 09:55:41',0),(4,'4915224043369','PURCHASE OF 10.00 TGP DIGITAL ASSETS @ COST OF 191.2 HAS BEEN MADE.','2022-10-11 09:12:18',0),(5,'4915224043369','FREKNUR TOKEN WORTH: 0.0100 HAS BEEN BOUGHT.','2022-10-11 09:12:18',0),(6,'254707132162','FREKNUR TOKEN WORTH: 0.0100 HAS BEEN BOUGHT.','2022-10-11 12:19:14',0),(7,'254707132162','PURCHASE OF 1.00 TGP DIGITAL ASSETS @ COST OF 19.12 HAS BEEN MADE.','2022-10-11 13:25:14',0),(8,'4915224043369','FREKNUR TOKEN WORTH: 0.0100 HAS BEEN BOUGHT.','2022-10-11 15:10:46',0),(9,'4915224043369','FREKNUR TOKEN WORTH: 0.0100 HAS BEEN BOUGHT.','2022-10-11 15:11:51',0),(10,'4915224043369','FREKNUR TOKEN WORTH: 0.0100 HAS BEEN BOUGHT.','2022-10-11 15:13:36',0),(11,'4915224043369','PURCHASE OF 10.00 CMC DIGITAL ASSETS @ COST OF 100 HAS BEEN MADE.','2022-10-11 15:13:36',0),(12,'4915224043369','INTENTION TO SELL 2.00 CMC SHARE[S] @ COST OF 50.00 THROUGH THE ALTERNATIVE MARKET.','2022-10-11 15:15:25',0),(13,'254707132162','INTENTION TO SELL 1.00 TGP SHARE[S] @ COST OF 500.00 THROUGH THE ALTERNATIVE MARKET.','2022-10-12 13:24:05',0),(14,'254707132162','A SELL REQUEST HAS BEEN WITHDRAWN BY OWNER.','2022-10-12 13:24:43',0),(15,'254707132162','INTENTION TO SELL 1.00 TGP SHARE[S] @ COST OF 57.00 THROUGH THE ALTERNATIVE MARKET.','2022-10-12 13:26:12',0),(16,'254707132162','A SELL REQUEST HAS BEEN WITHDRAWN BY OWNER.','2022-10-12 13:27:14',0),(17,'254707132162','INTENTION TO SELL 1.00 TGP SHARE[S] @ COST OF 18.75 THROUGH THE ALTERNATIVE MARKET.','2022-10-12 13:28:43',0),(18,'254707132162','A SELL REQUEST HAS BEEN WITHDRAWN BY OWNER.','2022-10-12 13:30:47',0),(19,'254707132162','INTENTION TO SELL 1.00 TGP SHARE[S] @ COST OF 18.75 THROUGH THE ALTERNATIVE MARKET.','2022-10-12 14:53:53',0),(20,'254707132162','A SELL REQUEST HAS BEEN WITHDRAWN BY OWNER.','2022-10-12 14:54:36',0),(21,'254707132162','INTENTION TO SELL 1.00 TGP SHARE[S] @ COST OF 18.75 THROUGH THE ALTERNATIVE MARKET.','2022-10-13 08:08:18',0),(22,'254707132162','A SELL REQUEST HAS BEEN WITHDRAWN BY OWNER.','2022-10-13 08:21:08',0),(23,'254707132162','INTENTION TO SELL 1.00 TGP SHARE[S] @ COST OF 25.0 THROUGH THE ALTERNATIVE MARKET.','2022-10-13 08:21:10',0),(24,'254707132162','A SELL REQUEST HAS BEEN WITHDRAWN BY OWNER.','2022-10-13 08:21:45',0),(25,'254707132162','INTENTION TO SELL 1.00 TGP SHARE[S] @ COST OF 800.00 THROUGH THE ALTERNATIVE MARKET.','2022-10-18 09:00:00',0),(26,'254707132162','A SELL REQUEST HAS BEEN WITHDRAWN BY OWNER.','2022-10-18 09:00:22',0);
/*!40000 ALTER TABLE `tbl_activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_debtor`
--

DROP TABLE IF EXISTS `tbl_debtor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_debtor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(50) DEFAULT NULL,
  `msisdn` varchar(15) NOT NULL,
  `amount_requested` double(15,2) DEFAULT '0.00',
  `amount_disbursed` double(15,2) DEFAULT '0.00',
  `repayment_amount` double(15,2) DEFAULT '0.00',
  `interest_amount` double(9,2) DEFAULT '0.00',
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `expected_repayment_date` datetime DEFAULT NULL,
  `repayment_date` datetime DEFAULT NULL,
  `notification_count` int DEFAULT '0',
  `next_notification_date` datetime DEFAULT NULL,
  `is_repaid` int DEFAULT '0' COMMENT '1-Repaid|0-Unpaid',
  `is_archived` int DEFAULT '0' COMMENT '1-Archived|0-Not Archive',
  PRIMARY KEY (`id`),
  UNIQUE KEY `reference_unik` (`reference_no`),
  KEY `reference_no` (`reference_no`),
  KEY `msisdn` (`msisdn`),
  KEY `is_repaid` (`is_repaid`),
  KEY `is_archived` (`is_archived`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_debtor`
--

LOCK TABLES `tbl_debtor` WRITE;
/*!40000 ALTER TABLE `tbl_debtor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_debtor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_defaulter`
--

DROP TABLE IF EXISTS `tbl_defaulter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_defaulter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `msisdn` varchar(15) NOT NULL,
  `loan_amount` double(15,2) DEFAULT '0.00',
  `amount_repaid` double(15,2) DEFAULT '0.00',
  `cummulative_interest` double(15,2) DEFAULT '0.00',
  `expected_repayment_date` datetime DEFAULT NULL,
  `notification_date` datetime DEFAULT NULL,
  `date_repaid` datetime DEFAULT NULL,
  `roll_count` int DEFAULT '0',
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `is_archived` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `msisdn` (`msisdn`),
  KEY `is_archived` (`is_archived`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_defaulter`
--

LOCK TABLES `tbl_defaulter` WRITE;
/*!40000 ALTER TABLE `tbl_defaulter` DISABLE KEYS */;
INSERT INTO `tbl_defaulter` VALUES (1,'4915224043369',3125.00,0.00,0.00,'2022-10-16 12:55:41','2023-08-16 08:55:42',NULL,0,'2022-10-16 08:55:42',NULL,0);
/*!40000 ALTER TABLE `tbl_defaulter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_loan_collateral`
--

DROP TABLE IF EXISTS `tbl_loan_collateral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_loan_collateral` (
  `_id` tinyint NOT NULL AUTO_INCREMENT,
  `msisdn` varchar(15) NOT NULL,
  `loan_amount` double(15,2) NOT NULL DEFAULT '0.00',
  `portfolio_worth` decimal(15,8) DEFAULT '0.00000000',
  `collateral_percentage` decimal(15,8) DEFAULT '0.00000000',
  `is_processed` int DEFAULT '0',
  PRIMARY KEY (`_id`),
  UNIQUE KEY `msisdn` (`msisdn`),
  KEY `is_reverted` (`is_processed`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_loan_collateral`
--

LOCK TABLES `tbl_loan_collateral` WRITE;
/*!40000 ALTER TABLE `tbl_loan_collateral` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_loan_collateral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_loan_payout`
--

DROP TABLE IF EXISTS `tbl_loan_payout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_loan_payout` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(50) NOT NULL,
  `msisdn` varchar(15) NOT NULL,
  `amount` double(15,2) DEFAULT '0.00',
  `collateral_percentage` double(15,2) DEFAULT '0.00',
  `approved_by` varchar(25) DEFAULT NULL,
  `status` int DEFAULT '0',
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT NULL,
  `has_collateral` int DEFAULT '0',
  `is_processed` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `reference_unik` (`reference_no`),
  KEY `msisdn` (`msisdn`),
  KEY `is_processed` (`is_processed`),
  KEY `request_id` (`reference_no`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_loan_payout`
--

LOCK TABLES `tbl_loan_payout` WRITE;
/*!40000 ALTER TABLE `tbl_loan_payout` DISABLE KEYS */;
INSERT INTO `tbl_loan_payout` VALUES (1,'LNR-JX4IIS5QOY','4915224043369',2500.00,0.00,'admin',0,'2022-10-06 12:55:40','2022-10-06 09:55:41',0,1);
/*!40000 ALTER TABLE `tbl_loan_payout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_loan_repayment`
--

DROP TABLE IF EXISTS `tbl_loan_repayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_loan_repayment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `msisdn` varchar(15) NOT NULL,
  `amount` double(15,2) DEFAULT '0.00',
  `transaction_no` varchar(25) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_processed` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_no` (`transaction_no`),
  KEY `trxunik` (`transaction_no`),
  KEY `msisdn` (`msisdn`),
  KEY `is_processed` (`is_processed`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_loan_repayment`
--

LOCK TABLES `tbl_loan_repayment` WRITE;
/*!40000 ALTER TABLE `tbl_loan_repayment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_loan_repayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_loan_request`
--

DROP TABLE IF EXISTS `tbl_loan_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_loan_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(50) DEFAULT NULL COMMENT 'loan request reference',
  `msisdn` varchar(50) NOT NULL COMMENT 'loanee identifier',
  `amount` double(15,2) DEFAULT '0.00',
  `collateral_percentage` double(15,2) DEFAULT '0.00',
  `task_flag` varchar(1) DEFAULT '0',
  `requested_by` varchar(50) DEFAULT NULL,
  `approved_by` varchar(50) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `has_collateral` int NOT NULL DEFAULT '0',
  `is_processed` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `msisdn_unik` (`msisdn`),
  UNIQUE KEY `ref_no` (`reference_no`),
  KEY `is_processed` (`is_processed`),
  KEY `msisdn` (`msisdn`),
  KEY `has_collateral` (`has_collateral`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_loan_request`
--

LOCK TABLES `tbl_loan_request` WRITE;
/*!40000 ALTER TABLE `tbl_loan_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_loan_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_loan_temp_list`
--

DROP TABLE IF EXISTS `tbl_loan_temp_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_loan_temp_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `msisdn` varchar(15) DEFAULT NULL,
  `loan_amount` double(15,2) DEFAULT '0.00',
  `interest` double(15,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_loan_temp_list`
--

LOCK TABLES `tbl_loan_temp_list` WRITE;
/*!40000 ALTER TABLE `tbl_loan_temp_list` DISABLE KEYS */;
INSERT INTO `tbl_loan_temp_list` VALUES (1,'4915224043369',3125.00,625.00);
/*!40000 ALTER TABLE `tbl_loan_temp_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_message_template`
--

DROP TABLE IF EXISTS `tbl_message_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_message_template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` varchar(150) NOT NULL,
  `category` varchar(50) NOT NULL,
  `flag` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `flag` (`flag`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_message_template`
--

LOCK TABLES `tbl_message_template` WRITE;
/*!40000 ALTER TABLE `tbl_message_template` DISABLE KEYS */;
INSERT INTO `tbl_message_template` VALUES (1,'Dear {0}, Your loan of {1} is due on {2}. Please arrange to settle the Outstanding Loan.','LOAN_ALERT',0),(2,'Dear {0}, Your loan of {1} has accrued interest of {2}. Total Outstanding Loan: {3}.','DEFAULTER_ALERT',0);
/*!40000 ALTER TABLE `tbl_message_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_mpesa_receipt`
--

DROP TABLE IF EXISTS `tbl_mpesa_receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_mpesa_receipt` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(50) NOT NULL DEFAULT '0',
  `msisdn` varchar(15) NOT NULL,
  `amount` double(15,2) DEFAULT '0.00',
  `status` varchar(2500) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_archived` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `reference_unik` (`reference_no`),
  KEY `msisdn` (`msisdn`),
  KEY `is_archived` (`is_archived`),
  KEY `reference_no` (`reference_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_mpesa_receipt`
--

LOCK TABLES `tbl_mpesa_receipt` WRITE;
/*!40000 ALTER TABLE `tbl_mpesa_receipt` DISABLE KEYS */;
INSERT INTO `tbl_mpesa_receipt` VALUES (1,'CSHO-C5F6069E','254707132162',10.00,NULL,'2022-09-23 17:05:26','2022-09-23 14:05:26',0),(2,'CSHO-32F6B51E','254707132162',10.00,NULL,'2022-09-23 17:08:29','2022-09-23 14:08:29',0);
/*!40000 ALTER TABLE `tbl_mpesa_receipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_notification`
--

DROP TABLE IF EXISTS `tbl_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_notification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) NOT NULL,
  `msisdn` varchar(15) NOT NULL,
  `message` varchar(750) NOT NULL,
  `category` varchar(25) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_downloaded` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `msisdn` (`msisdn`),
  KEY `is_downloaded` (`is_downloaded`),
  KEY `category` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_notification`
--

LOCK TABLES `tbl_notification` WRITE;
/*!40000 ALTER TABLE `tbl_notification` DISABLE KEYS */;
INSERT INTO `tbl_notification` VALUES (1,'e11a8769-3c98-11ec-b4e0-42010aa40002','393519688608','I have made an offer to purchase your EQTY share(s) for 12.83 per unit. The offer expires in 3hours.','SYS_ALERT','2021-11-03 14:26:25','2021-11-03 11:26:25',0),(2,'d543249a-3d62-11ec-b4e0-42010aa40002','254722563707','Dear Customer, Your loan of 1150.00 is due on 2021-11-04 22:32:03. Please arrange to settle the Outstanding Loan.','LOAN_ALERT','2021-11-04 14:32:03','2021-11-04 11:32:03',0),(3,'d5cdcfcf-3d62-11ec-b4e0-42010aa40002','254722563707','Dear Customer, Your loan of 1150.00 is due on 2021-11-04 22:32:03. Please arrange to settle the Outstanding Loan.','LOAN_ALERT','2021-11-04 14:32:04','2021-11-04 11:32:04',0),(4,'989e9133-3d73-11ec-b4e0-42010aa40002','254722563707','Dear Customer, Your loan of 1150.00 is due on 2021-11-04 22:32:03. Please arrange to settle the Outstanding Loan.','LOAN_ALERT','2021-11-04 16:32:03','2021-11-04 13:32:03',0),(5,'5c25a747-3d84-11ec-b4e0-42010aa40002','254722563707','Dear Customer, Your loan of 1150.00 is due on 2021-11-04 22:32:03. Please arrange to settle the Outstanding Loan.','LOAN_ALERT','2021-11-04 18:32:03','2021-11-04 15:32:03',0),(6,'07c3c49f-4147-11ec-b4e0-42010aa40002','393519688608','I have made an offer to purchase your EQTY share(s) for 14.17 per unit. The offer expires in 3hours.','SYS_ALERT','2021-11-09 13:23:07','2021-11-09 10:23:07',0),(7,'2149c68e-41a8-11ec-b4e0-42010aa40002','393519688608','I have made an offer to purchase your EQTY share(s) for 14.17 per unit. The offer expires in 3hours.','SYS_ALERT','2021-11-10 00:58:11','2021-11-09 21:58:11',0),(8,'f14445e9-41aa-11ec-b4e0-42010aa40002','254711000000','I have made an offer to purchase your EQTY share(s) for 14.17 per unit. The offer expires in 3hours.','SYS_ALERT','2021-11-10 01:18:18','2021-11-09 22:18:18',0),(9,'0f76a56c-41b0-11ec-b4e0-42010aa40002','254711000000','I have made an offer to purchase your EQTY share(s) for 14.17 per unit. The offer expires in 3hours.','SYS_ALERT','2021-11-10 01:54:57','2021-11-09 22:54:57',0),(10,'7831b509-41b0-11ec-b4e0-42010aa40002','254722563707','I have made an offer to purchase your EQTY share(s) for 14.17 per unit. The offer expires in 3hours.','SYS_ALERT','2021-11-10 01:57:52','2021-11-09 22:57:52',0),(11,'598b9f16-42d6-11ec-b4e0-42010aa40002','254722563707','I have made an offer to purchase your SMRT share(s) for 21.08 per unit. The offer expires in 3hours.','SYS_ALERT','2021-11-11 13:01:33','2021-11-11 10:01:33',0),(12,'b7b16706-44ec-11ec-b4e0-42010aa40002','254720726071','Dear Customer, Your loan of 625.00 is due on 2021-11-14 12:46:42. Please arrange to settle the Outstanding Loan.','LOAN_ALERT','2021-11-14 04:46:42','2021-11-14 01:46:42',0),(13,'b82e8de9-44ec-11ec-b4e0-42010aa40002','254720726071','Dear Customer, Your loan of 625.00 is due on 2021-11-14 12:46:42. Please arrange to settle the Outstanding Loan.','LOAN_ALERT','2021-11-14 04:46:43','2021-11-14 01:46:43',0),(14,'7b12ea89-44fd-11ec-b4e0-42010aa40002','254720726071','Dear Customer, Your loan of 625.00 is due on 2021-11-14 12:46:42. Please arrange to settle the Outstanding Loan.','LOAN_ALERT','2021-11-14 06:46:42','2021-11-14 03:46:42',0),(15,'3e83ef5f-450e-11ec-b4e0-42010aa40002','254720726071','Dear Customer, Your loan of 625.00 is due on 2021-11-14 12:46:42. Please arrange to settle the Outstanding Loan.','LOAN_ALERT','2021-11-14 08:46:42','2021-11-14 05:46:42',0),(16,'44cae99c-af58-11ec-b4e0-42010aa40002','254720726071','I have made an offer to purchase your EQTY share(s) for 9.69 per unit. The offer expires in 3hours.','SYS_ALERT','2022-03-29 15:03:38','2022-03-29 12:03:38',0),(17,'57573621-b92f-11ec-b4e0-42010aa40002','393519688608','Dear Customer, Your loan of 899.86 is due on 2022-04-11 11:35:52. Please arrange to settle the Outstanding Loan.','LOAN_ALERT','2022-04-11 03:35:52','2022-04-11 00:35:52',0),(18,'57d462b9-b92f-11ec-b4e0-42010aa40002','393519688608','Dear Customer, Your loan of 899.86 is due on 2022-04-11 11:35:52. Please arrange to settle the Outstanding Loan.','LOAN_ALERT','2022-04-11 03:35:52','2022-04-11 00:35:52',0),(19,'1b46ae12-b940-11ec-b4e0-42010aa40002','393519688608','Dear Customer, Your loan of 899.86 is due on 2022-04-11 11:35:52. Please arrange to settle the Outstanding Loan.','LOAN_ALERT','2022-04-11 05:35:52','2022-04-11 02:35:52',0),(20,'dec55e09-b950-11ec-b4e0-42010aa40002','393519688608','Dear Customer, Your loan of 899.86 is due on 2022-04-11 11:35:52. Please arrange to settle the Outstanding Loan.','LOAN_ALERT','2022-04-11 07:35:52','2022-04-11 04:35:52',0),(21,'ae8379b5-c1e1-11ec-b4e0-42010aa40002','254707132162','Dear Customer, Your loan of 625.00 is due on 2022-04-22 13:12:38. Please arrange to settle the Outstanding Loan.','LOAN_ALERT','2022-04-22 05:12:38','2022-04-22 02:12:38',0),(22,'af01230b-c1e1-11ec-b4e0-42010aa40002','254707132162','Dear Customer, Your loan of 625.00 is due on 2022-04-22 13:12:38. Please arrange to settle the Outstanding Loan.','LOAN_ALERT','2022-04-22 05:12:38','2022-04-22 02:12:38',0),(23,'724021b1-c1f2-11ec-b4e0-42010aa40002','254707132162','Dear Customer, Your loan of 625.00 is due on 2022-04-22 13:12:38. Please arrange to settle the Outstanding Loan.','LOAN_ALERT','2022-04-22 07:12:38','2022-04-22 04:12:38',0),(24,'35d9dd1a-c203-11ec-b4e0-42010aa40002','254707132162','Dear Customer, Your loan of 625.00 is due on 2022-04-22 13:12:38. Please arrange to settle the Outstanding Loan.','LOAN_ALERT','2022-04-22 09:12:38','2022-04-22 06:12:38',0),(25,'9eb3868d-cc40-11ec-b4e0-42010aa40002','393519688608','Dear Customer, Your loan of 3642.50 is due on 2022-05-05 17:57:25. Please arrange to settle the Outstanding Loan.','LOAN_ALERT','2022-05-05 09:57:25','2022-05-05 06:57:25',0),(26,'9f312673-cc40-11ec-b4e0-42010aa40002','393519688608','Dear Customer, Your loan of 3642.50 is due on 2022-05-05 17:57:25. Please arrange to settle the Outstanding Loan.','LOAN_ALERT','2022-05-05 09:57:26','2022-05-05 06:57:26',0),(27,'62386687-cc51-11ec-b4e0-42010aa40002','393519688608','Dear Customer, Your loan of 3642.50 is due on 2022-05-05 17:57:25. Please arrange to settle the Outstanding Loan.','LOAN_ALERT','2022-05-05 11:57:25','2022-05-05 08:57:25',0),(28,'25d7e9fa-cc62-11ec-b4e0-42010aa40002','393519688608','Dear Customer, Your loan of 3642.50 is due on 2022-05-05 17:57:25. Please arrange to settle the Outstanding Loan.','LOAN_ALERT','2022-05-05 13:57:25','2022-05-05 10:57:25',0),(29,'b7ae9ea6-e27b-11ec-aa9d-42010aa40002','393519688608','I have made an offer to purchase your KCB share(s) for 13.95 per unit. The offer expires in 3hours.','SYS_ALERT','2022-06-02 16:55:53','2022-06-02 13:55:53',0),(30,'b9685b26-e27b-11ec-aa9d-42010aa40002','254722563707','I have made an offer to purchase your KCB share(s) for 13.95 per unit. The offer expires in 3hours.','SYS_ALERT','2022-06-02 16:55:56','2022-06-02 13:55:56',0),(31,'2ca2c575-09d2-11ed-aa9d-42010aa40002','4915224043369','I have made an offer to purchase your HFCK share(s) for 16.96 per unit. The offer expires in 3hours.','SYS_ALERT','2022-07-22 18:23:01','2022-07-22 15:23:01',0),(32,'1d001664-0d95-11ed-aa9d-42010aa40002','254722563707','I have made an offer to purchase your EQTY share(s) for 29.07 per unit. The offer expires in 3hours.','SYS_ALERT','2022-07-27 13:16:00','2022-07-27 10:16:00',0),(33,'09b60105-202a-11ed-aa9d-42010aa40002','4915224043369','Dear Customer, Your loan of 990.25 is due on 2022-08-20 12:47:24. Please arrange to settle the Outstanding Loan.','LOAN_ALERT','2022-08-20 04:47:24','2022-08-20 01:47:24',0),(34,'0a2ce794-202a-11ed-aa9d-42010aa40002','4915224043369','Dear Customer, Your loan of 990.25 is due on 2022-08-20 12:47:24. Please arrange to settle the Outstanding Loan.','LOAN_ALERT','2022-08-20 04:47:24','2022-08-20 01:47:24',0),(35,'cd6d7c39-203a-11ed-aa9d-42010aa40002','4915224043369','Dear Customer, Your loan of 990.25 is due on 2022-08-20 12:47:24. Please arrange to settle the Outstanding Loan.','LOAN_ALERT','2022-08-20 06:47:24','2022-08-20 03:47:24',0),(36,'90e5e2df-204b-11ed-aa9d-42010aa40002','4915224043369','Dear Customer, Your loan of 990.25 is due on 2022-08-20 12:47:24. Please arrange to settle the Outstanding Loan.','LOAN_ALERT','2022-08-20 08:47:24','2022-08-20 05:47:24',0),(37,'e4fe001b-221c-11ed-aa9d-42010aa40002','491522404336','I have made an offer to purchase your HFCK share(s) for 13.57 per unit. The offer expires in 3hours.','SYS_ALERT','2022-08-22 16:18:21','2022-08-22 13:18:21',0),(38,'54e341fa-225d-11ed-aa9d-42010aa40002','4915224043369','I have made an offer to purchase your HFCK share(s) for 13.57 per unit. The offer expires in 3hours.','SYS_ALERT','2022-08-22 23:59:36','2022-08-22 20:59:36',0),(39,'82ffd9a3-22b9-11ed-aa9d-42010aa40002','4915224043369','I have made an offer to purchase your HFCK share(s) for 13.57 per unit. The offer expires in 3hours.','SYS_ALERT','2022-08-23 10:59:28','2022-08-23 07:59:28',0),(40,'9765be96-2c66-11ed-aa9d-42010aa40002','254722563707','Dear CUSTOMER, Your loan of 1150.00 has accrued interest of 2.4. Total Outstanding Loan: 1152.4.','DEFAULTER_ALERT','2022-09-04 18:31:05','2022-09-04 15:31:05',0),(41,'79869366-33f0-11ed-aa9d-42010aa40002','254720726071','Dear CUSTOMER, Your loan of 625.00 has accrued interest of 1.3. Total Outstanding Loan: 626.3.','DEFAULTER_ALERT','2022-09-14 08:45:44','2022-09-14 05:45:44',0),(42,'a3a6289f-4cf5-11ed-aa9d-42010aa40002','4915224043369','Dear Customer, Your loan of 3125.00 is due on 2022-10-16 12:55:41. Please arrange to settle the Outstanding Loan.','LOAN_ALERT','2022-10-16 04:55:41','2022-10-16 01:55:41',0),(43,'a41c4e5e-4cf5-11ed-aa9d-42010aa40002','4915224043369','Dear Customer, Your loan of 3125.00 is due on 2022-10-16 12:55:41. Please arrange to settle the Outstanding Loan.','LOAN_ALERT','2022-10-16 04:55:42','2022-10-16 01:55:42',0),(44,'66fcb0eb-4d06-11ed-aa9d-42010aa40002','4915224043369','Dear Customer, Your loan of 3125.00 is due on 2022-10-16 12:55:41. Please arrange to settle the Outstanding Loan.','LOAN_ALERT','2022-10-16 06:55:41','2022-10-16 03:55:41',0),(45,'2ad9313f-4d17-11ed-aa9d-42010aa40002','4915224043369','Dear Customer, Your loan of 3125.00 is due on 2022-10-16 12:55:41. Please arrange to settle the Outstanding Loan.','LOAN_ALERT','2022-10-16 08:55:41','2022-10-16 05:55:41',0);
/*!40000 ALTER TABLE `tbl_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_owner_portfolio_temp_list`
--

DROP TABLE IF EXISTS `tbl_owner_portfolio_temp_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_owner_portfolio_temp_list` (
  `_id` int NOT NULL AUTO_INCREMENT,
  `msisdn` varchar(20) NOT NULL,
  `asset_id` varchar(20) NOT NULL,
  `asset_acronym` varchar(20) NOT NULL,
  `number_of_asset` decimal(15,8) DEFAULT '0.00000000',
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` int DEFAULT '0',
  `lock` int DEFAULT '0',
  PRIMARY KEY (`_id`),
  KEY `msisdn_indx` (`msisdn`),
  KEY `asset_id_indx` (`asset_id`),
  KEY `is_active_indx` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_owner_portfolio_temp_list`
--

LOCK TABLES `tbl_owner_portfolio_temp_list` WRITE;
/*!40000 ALTER TABLE `tbl_owner_portfolio_temp_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_owner_portfolio_temp_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_rejected_loan`
--

DROP TABLE IF EXISTS `tbl_rejected_loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_rejected_loan` (
  `_id` tinyint NOT NULL AUTO_INCREMENT,
  `msisdn` varchar(20) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `date_created` varchar(1000) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`_id`),
  KEY `flag` (`flag`),
  KEY `msisdn` (`msisdn`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_rejected_loan`
--

LOCK TABLES `tbl_rejected_loan` WRITE;
/*!40000 ALTER TABLE `tbl_rejected_loan` DISABLE KEYS */;
INSERT INTO `tbl_rejected_loan` VALUES (1,'254707132162','a','2021-11-20 01:47:11',0),(2,'254707132162','uu','2021-11-20 01:48:51',0),(3,'254707132162','s','2021-11-20 01:50:57',0),(4,'254707132162','ddd','2021-11-20 02:01:00',0),(5,'254707132162','ff','2022-03-06 20:19:37',0),(6,'254707132162','not applicable','2022-04-03 15:44:02',0),(7,'254707132162','rejected','2022-04-03 15:47:11',0),(8,'254519688608','not a subscriber','2022-04-03 18:20:37',0),(9,'254707132162','mmmm','2022-05-09 23:04:02',0),(10,'254707132162','sss','2022-06-14 13:19:11',0),(11,'254707132162',',,,,','2022-06-14 17:48:38',0),(12,'4915224043369','client request','2022-06-21 14:56:06',0),(13,'254707132162','has not credit rating info','2022-06-28 11:01:00',0),(14,'254707132162','mnmnm','2022-06-28 11:11:46',0),(15,'254707132162','cccc','2022-06-28 11:26:56',0),(16,'254707132162','sss','2022-06-28 11:32:46',0),(17,'254707132162','REASON FOR REJECTION - missing electronic copy of the National ID','2022-07-07 16:20:36',0),(18,'254707132162','kndjklsadlas','2022-07-12 17:59:10',0),(19,'254707132162','jfshjfhjdshjhjs test zero','2022-07-12 18:02:59',0),(20,'254707132162','test rejected','2022-07-12 18:07:14',0),(21,'254707132162','dddd','2022-07-12 18:09:22',0),(22,'254707132162','nmcxnmncm','2022-07-12 18:12:02',0),(23,'254707132162','ddd','2022-07-12 18:15:47',0),(24,'254707132162','www','2022-07-12 18:18:17',0),(25,'4915224043369','too few apps','2022-07-13 17:37:50',0),(26,'4915224043369','dont trust ya','2022-07-27 12:34:38',0);
/*!40000 ALTER TABLE `tbl_rejected_loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_temp`
--

DROP TABLE IF EXISTS `tbl_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_temp` (
  `_id` bigint NOT NULL AUTO_INCREMENT,
  `_action` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=MEMORY AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_temp`
--

LOCK TABLES `tbl_temp` WRITE;
/*!40000 ALTER TABLE `tbl_temp` DISABLE KEYS */;
INSERT INTO `tbl_temp` VALUES (1,'4915224043369'),(2,'4915224043369'),(3,'4915224043369'),(4,'4915224043369'),(5,'4915224043369'),(6,'4915224043369'),(7,'4915224043369'),(8,'4915224043369'),(9,'4915224043369');
/*!40000 ALTER TABLE `tbl_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_transaction`
--

DROP TABLE IF EXISTS `tbl_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_transaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_code` varchar(50) NOT NULL,
  `reference_no` varchar(50) NOT NULL,
  `msisdn` varchar(15) NOT NULL,
  `cr` decimal(15,8) DEFAULT '0.00000000',
  `dr` decimal(15,8) DEFAULT '0.00000000',
  `balance` decimal(15,8) DEFAULT '0.00000000',
  `narration` text,
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_archived` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `msisdn` (`msisdn`),
  KEY `reference_no` (`reference_no`),
  KEY `account_id` (`account_code`),
  KEY `is_archived` (`is_archived`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_transaction`
--

LOCK TABLES `tbl_transaction` WRITE;
/*!40000 ALTER TABLE `tbl_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_wallet_transaction`
--

DROP TABLE IF EXISTS `tbl_wallet_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_wallet_transaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(50) NOT NULL,
  `msisdn` varchar(15) NOT NULL,
  `cr` decimal(15,8) DEFAULT '0.00000000',
  `dr` decimal(15,8) DEFAULT '0.00000000',
  `balance` decimal(15,8) DEFAULT '0.00000000',
  `narration` text NOT NULL,
  `date_created` datetime DEFAULT NULL COMMENT 'transaction_date',
  `date_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_archived` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `msisdn` (`msisdn`),
  KEY `is_archived` (`is_archived`),
  KEY `reference_no` (`reference_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_wallet_transaction`
--

LOCK TABLES `tbl_wallet_transaction` WRITE;
/*!40000 ALTER TABLE `tbl_wallet_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_wallet_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `db_freknur_inventory`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `db_freknur_inventory` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `db_freknur_inventory`;

--
-- Table structure for table `tbl_inventory`
--

DROP TABLE IF EXISTS `tbl_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_inventory` (
  `_id` int NOT NULL AUTO_INCREMENT,
  `item_uid` varchar(50) NOT NULL,
  `item_name` varchar(65) NOT NULL,
  `item_image` varchar(250) DEFAULT 'no_image',
  `qty_in` int DEFAULT '0',
  `qty_out` int DEFAULT '0',
  `unit_price` decimal(15,2) DEFAULT '0.00',
  `date_created` datetime NOT NULL,
  `date_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_available` int DEFAULT '0',
  PRIMARY KEY (`_id`),
  UNIQUE KEY `item_uid` (`item_uid`),
  KEY `is_available` (`is_available`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_inventory`
--

LOCK TABLES `tbl_inventory` WRITE;
/*!40000 ALTER TABLE `tbl_inventory` DISABLE KEYS */;
INSERT INTO `tbl_inventory` VALUES (1,'26362','TEST_!','no_image',100000,0,156.00,'2021-04-29 19:15:46','2021-04-29 16:15:46',0),(2,'80010','TEST_!','no_image',100000,0,156.00,'2021-04-29 19:16:12','2021-04-29 16:16:12',0),(3,'93817','TEST_1','no_image',10000,0,145.00,'2021-04-29 19:16:30','2021-04-29 16:16:30',0),(4,'23777','TEST_1','no_image',10000,0,145.00,'2021-04-29 19:17:28','2021-04-29 16:17:28',0),(5,'24436','TEST_23','no_image',300,0,217.00,'2021-04-29 19:40:57','2021-04-29 16:40:57',0),(6,'24677','TEST_1','no_image',10000,0,145.00,'2021-04-29 20:34:33','2021-04-29 17:34:33',0),(7,'24622','TEST_1','no_image',10000,0,145.00,'2021-04-29 20:34:39','2021-04-29 17:34:39',0),(8,'10987','TEST_1','no_image',10000,0,145.00,'2021-04-29 20:38:51','2021-04-29 17:38:51',0),(9,'84594','TEST_1','no_image',10000,0,145.00,'2021-04-29 20:55:05','2021-04-29 17:55:05',0),(10,'13847','TEST_5','no_image',2300,0,10000.00,'2021-04-29 20:55:45','2021-04-29 17:55:45',0),(11,'20272','TEST_1','no_image',10000,0,145.00,'2021-04-29 21:01:29','2021-04-29 18:01:29',0),(12,'17971','TEST_1','no_image',10000,0,145.00,'2021-04-29 21:04:24','2021-04-29 18:04:24',0),(13,'10152','TEST_1','no_image',10000,0,145.00,'2021-04-29 21:16:00','2021-04-29 18:16:00',0),(14,'16397','TEST_1','no_image',10000,0,145.00,'2021-04-29 21:18:13','2021-04-29 18:18:13',0),(15,'22866','TEST_1','no_image',10000,0,145.00,'2021-04-29 21:20:01','2021-04-29 18:20:01',0),(16,'45575','TEST_1','no_image',10000,0,145.00,'2021-04-29 21:21:26','2021-04-29 18:21:26',0),(17,'20113','TEST_1','no_image',10000,0,145.00,'2021-04-29 21:24:57','2021-04-29 18:24:57',0),(18,'22322','NIMMM','https://api.betvantage.ke/freknur/dashboard/table/image_files/user.png',2000,0,10.00,'2021-04-29 21:25:37','2021-06-30 16:29:46',0),(19,'24964','TEST_1','https://api.betvantage.ke/freknur/dashboard/table/image_files/Freknur_Logo.PNG',10000,0,145.00,'2021-04-29 21:28:33','2021-06-30 16:16:39',0),(20,'16124','TEST_1','https://api.betvantage.ke/freknur/dashboard/table/inventory.php/image_files/Freknur_Logo.PNG',10000,0,145.00,'2021-04-29 21:28:40','2021-06-30 16:03:46',0),(21,'25167','TST12345','https://api.betvantage.ke/freknur/dashboard/table/inventory.php/image_files/Freknur_Logo.PNG',40000,0,5600.00,'2021-04-29 21:50:26','2021-06-30 16:02:11',0),(22,'14531','TEST!\"£a','https://api.betvantage.ke/freknur/dashboard/table/inventory.php/image_files/Freknur_Logo.PNG',6700,0,123.00,'2021-04-29 21:54:56','2021-06-30 15:58:21',0),(23,'10977','yeoeoeo','https://api.freknur.com/dashboard/table/image_files/rating.png',1344,0,132.00,'2021-04-29 23:15:39','2021-09-22 22:33:45',0),(24,'12577','TEST_1','https://api.freknur.com/dashboard/table/image_files/Freknur_Logo.PNG',10000,0,145.00,'2021-04-30 00:25:46','2021-09-10 10:43:25',0),(25,'11086','TEST_1','https://api.freknur.com/dashboard/table/image_files/rating.png',10000,0,145.00,'2021-04-30 00:30:42','2021-08-11 13:29:35',0),(26,'71658','TEST_1','https://api.freknur.com/dashboard/table/image_files/user.png',10000,0,145.00,'2021-04-30 00:33:44','2021-07-28 22:12:23',0),(27,'26333','TYESAA','https://api.freknur.com/dashboard/table/image_files/Freknur_Logo.PNG',120,0,230.00,'2021-04-30 00:34:21','2021-07-28 12:53:34',0),(28,'16775','jam','https://api.freknur.com/dashboard/table/image_files/user.png',1000,0,105.00,'2021-07-02 23:09:25','2021-07-14 16:43:15',0),(29,'24413','test_aug_11','no_image',10,0,5.50,'2021-08-11 13:35:07','2021-08-11 10:35:08',0),(30,'54496','TEST_2233','no_image',1000,0,150.00,'2021-10-25 22:53:18','2021-10-25 19:53:18',0);
/*!40000 ALTER TABLE `tbl_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sales`
--

DROP TABLE IF EXISTS `tbl_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_sales` (
  `_id` int NOT NULL AUTO_INCREMENT,
  `product_uid` varchar(50) NOT NULL,
  `qty` int DEFAULT '0',
  `total` decimal(15,2) DEFAULT '0.00',
  `date_created` datetime NOT NULL,
  `is_archived` int DEFAULT '0',
  PRIMARY KEY (`_id`),
  KEY `product_uid` (`product_uid`),
  KEY `is_archived` (`is_archived`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sales`
--

LOCK TABLES `tbl_sales` WRITE;
/*!40000 ALTER TABLE `tbl_sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `db_freknur_investment`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `db_freknur_investment` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `db_freknur_investment`;

--
-- Table structure for table `tbl_account`
--

DROP TABLE IF EXISTS `tbl_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_code` varchar(20) NOT NULL,
  `account_name` varchar(50) DEFAULT NULL,
  `balance` decimal(15,8) DEFAULT '0.00000000',
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_unik` (`account_code`),
  KEY `bank_id` (`account_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_account`
--

LOCK TABLES `tbl_account` WRITE;
/*!40000 ALTER TABLE `tbl_account` DISABLE KEYS */;
INSERT INTO `tbl_account` VALUES (1,'WRK','WORKING',5000000.00000000,'2021-03-12 00:43:31','2021-03-11 21:43:31'),(2,'INC','INCOMING',429.33000000,'2021-03-12 00:43:31','2022-10-11 15:13:36'),(3,'FEE','GOVT_TAX',4.36000000,'2021-03-12 00:43:31','2022-10-11 15:13:36');
/*!40000 ALTER TABLE `tbl_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_alternate_market_bid`
--

DROP TABLE IF EXISTS `tbl_alternate_market_bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_alternate_market_bid` (
  `_id` int NOT NULL AUTO_INCREMENT,
  `asset_id` varchar(80) NOT NULL,
  `msisdn` varchar(20) NOT NULL,
  `asset_name` varchar(50) DEFAULT NULL,
  `unit_price` decimal(15,8) DEFAULT '0.00000000',
  `qty` decimal(15,8) DEFAULT '0.00000000',
  `cost` decimal(15,8) DEFAULT '0.00000000',
  `date_created` datetime NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_processed` int DEFAULT '0',
  PRIMARY KEY (`_id`),
  KEY `is_processed` (`is_processed`),
  KEY `msisdn` (`msisdn`),
  KEY `asset_id` (`asset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_alternate_market_bid`
--

LOCK TABLES `tbl_alternate_market_bid` WRITE;
/*!40000 ALTER TABLE `tbl_alternate_market_bid` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_alternate_market_bid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_asset`
--

DROP TABLE IF EXISTS `tbl_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_asset` (
  `_id` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(100) NOT NULL,
  `asset_acronym` varchar(20) NOT NULL,
  `asset_name` varchar(100) DEFAULT NULL,
  `unit_price` decimal(20,8) DEFAULT '0.00000000',
  `total` decimal(20,8) DEFAULT '0.00000000',
  `asset_trend` int DEFAULT '0',
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_suspended` int DEFAULT '0',
  `is_deleted` int DEFAULT '0',
  PRIMARY KEY (`_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_asset`
--

LOCK TABLES `tbl_asset` WRITE;
/*!40000 ALTER TABLE `tbl_asset` DISABLE KEYS */;
INSERT INTO `tbl_asset` VALUES (1,'23314','EQTY','EQUITY BANK',27.50000000,22050.70000000,2,'2020-12-18 20:23:02','2022-07-28 06:54:15',0,0),(2,'20200','KCB','Kenya Commercial Bank',24.00000000,18086.00000000,1,'2020-12-18 20:53:06','2022-09-23 15:40:23',0,0),(3,'18195','HFCK','House Finance',12.00000000,957.70000000,0,'2020-12-18 21:09:31','2022-07-06 12:27:32',0,0),(4,'30006','CMC','CMC',10.00000000,9565.80000000,0,'2020-12-18 21:15:01','2022-10-11 15:13:36',0,0),(5,'25643','ABSA','ABSA',23.00000000,9990.00000000,0,'2020-12-18 21:22:33','2021-03-30 18:28:04',0,0),(6,'21222','ABSA','ABSA',23.00000000,9923.75000000,0,'2020-12-18 21:24:10','2022-07-27 10:14:30',0,0),(7,'17633','CABACID','CABACID',15.00000000,95863.20000000,1,'2020-12-18 21:31:28','2021-07-16 22:18:39',0,0),(25,'19570','NATION MEDIA','NATION',15.00000000,19934.54000000,0,'2021-04-30 00:36:29','2022-08-02 09:33:52',0,0),(26,'87273','SMRT','Smarty',16.00000000,-575.09000000,0,'2021-11-03 14:17:59','2022-09-26 14:24:47',0,0),(27,'10698','tRD','tRD',1000.00000000,997.33000000,0,'2021-11-10 04:34:14','2022-06-14 13:11:55',0,0),(28,'24774','TGP','ToGoPo',18.75000000,297685.37000000,0,'2022-09-13 12:41:56','2022-10-11 13:25:14',0,0);
/*!40000 ALTER TABLE `tbl_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_config`
--

DROP TABLE IF EXISTS `tbl_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_config` (
  `cnf_id` int NOT NULL AUTO_INCREMENT,
  `trx_fee` double(8,2) DEFAULT NULL,
  `tax` double(15,2) DEFAULT NULL,
  `min_limit` double(15,2) DEFAULT NULL,
  `max_limit` double(15,2) DEFAULT NULL,
  `currency` varchar(5) DEFAULT 'USD',
  `equity_markup` decimal(8,2) DEFAULT NULL,
  `equity_offer_rate` decimal(8,2) DEFAULT NULL,
  `early_payment_fee` decimal(8,2) DEFAULT NULL,
  `setting_3` decimal(8,2) DEFAULT NULL,
  `time_stamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cnf_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_config`
--

LOCK TABLES `tbl_config` WRITE;
/*!40000 ALTER TABLE `tbl_config` DISABLE KEYS */;
INSERT INTO `tbl_config` VALUES (1,0.05,0.01,0.10,60.00,'KES',0.02,0.05,0.02,0.00,'2021-11-03 11:18:40');
/*!40000 ALTER TABLE `tbl_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_owner_portfolio`
--

DROP TABLE IF EXISTS `tbl_owner_portfolio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_owner_portfolio` (
  `_id` int NOT NULL AUTO_INCREMENT,
  `msisdn` varchar(20) NOT NULL,
  `asset_id` varchar(20) NOT NULL,
  `asset_acronym` varchar(25) DEFAULT NULL,
  `number_of_asset` decimal(15,8) DEFAULT '0.00000000',
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` int DEFAULT '0',
  `lock` int DEFAULT '0',
  PRIMARY KEY (`_id`),
  KEY `msisdn_indx` (`msisdn`),
  KEY `asset_id_indx` (`asset_id`),
  KEY `is_active_indx` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_owner_portfolio`
--

LOCK TABLES `tbl_owner_portfolio` WRITE;
/*!40000 ALTER TABLE `tbl_owner_portfolio` DISABLE KEYS */;
INSERT INTO `tbl_owner_portfolio` VALUES (1,'4915224043369','24774','TGP',10.00000000,'2022-10-11 12:12:18','2022-10-11 09:12:18',0,0),(2,'254707132162','24774','TGP',1.00000000,'2022-10-11 16:25:14','2022-10-11 13:25:14',0,0),(3,'4915224043369','30006','CMC',10.00000000,'2022-10-11 18:13:36','2022-10-11 15:13:36',0,0);
/*!40000 ALTER TABLE `tbl_owner_portfolio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_owner_portfolio_backup`
--

DROP TABLE IF EXISTS `tbl_owner_portfolio_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_owner_portfolio_backup` (
  `_id` int NOT NULL AUTO_INCREMENT,
  `msisdn` varchar(20) NOT NULL,
  `asset_id` varchar(20) NOT NULL,
  `asset_acronym` varchar(20) NOT NULL,
  `number_of_asset` decimal(15,8) DEFAULT '0.00000000',
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` int DEFAULT '0',
  `lock` int DEFAULT '0',
  PRIMARY KEY (`_id`),
  KEY `msisdn_indx` (`msisdn`),
  KEY `asset_id_indx` (`asset_id`),
  KEY `is_active_indx` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_owner_portfolio_backup`
--

LOCK TABLES `tbl_owner_portfolio_backup` WRITE;
/*!40000 ALTER TABLE `tbl_owner_portfolio_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_owner_portfolio_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_owner_portfolio_temp_list`
--

DROP TABLE IF EXISTS `tbl_owner_portfolio_temp_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_owner_portfolio_temp_list` (
  `_id` int NOT NULL AUTO_INCREMENT,
  `msisdn` varchar(20) NOT NULL,
  `asset_id` varchar(20) NOT NULL,
  `asset_acronym` varchar(20) NOT NULL,
  `number_of_asset` decimal(15,8) DEFAULT '0.00000000',
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` int DEFAULT '0',
  `lock` int DEFAULT '0',
  PRIMARY KEY (`_id`),
  KEY `msisdn_indx` (`msisdn`),
  KEY `asset_id_indx` (`asset_id`),
  KEY `is_active_indx` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_owner_portfolio_temp_list`
--

LOCK TABLES `tbl_owner_portfolio_temp_list` WRITE;
/*!40000 ALTER TABLE `tbl_owner_portfolio_temp_list` DISABLE KEYS */;
INSERT INTO `tbl_owner_portfolio_temp_list` VALUES (1,'4915224043369','24774','TGP',10.00000000,'2022-10-11 12:12:18','2022-10-11 09:12:18',0,0),(2,'254707132162','24774','TGP',1.00000000,'2022-10-11 16:25:14','2022-10-11 13:25:14',0,0),(3,'4915224043369','30006','CMC',10.00000000,'2022-10-11 18:13:36','2022-10-11 15:13:36',0,0);
/*!40000 ALTER TABLE `tbl_owner_portfolio_temp_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_purchase_request`
--

DROP TABLE IF EXISTS `tbl_purchase_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_purchase_request` (
  `_id` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(80) DEFAULT NULL,
  `name` varchar(25) DEFAULT NULL,
  `msisdn` varchar(20) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `unit_price` decimal(15,8) DEFAULT '0.00000000',
  `no_of_grain_purchased` decimal(15,8) DEFAULT '0.00000000',
  `cost` decimal(15,8) DEFAULT '0.00000000',
  `date_created` datetime NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_processed` int DEFAULT '0',
  PRIMARY KEY (`_id`),
  KEY `is_processed` (`is_processed`),
  KEY `msisdn` (`msisdn`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_purchase_request`
--

LOCK TABLES `tbl_purchase_request` WRITE;
/*!40000 ALTER TABLE `tbl_purchase_request` DISABLE KEYS */;
INSERT INTO `tbl_purchase_request` VALUES (1,'24774',NULL,'4915224043369','TGP',19.12000000,10.00000000,191.20000000,'2022-10-11 12:12:17','2022-10-11 09:12:18',1),(2,'24774',NULL,'254707132162','TGP',19.12000000,1.00000000,19.12000000,'2022-10-11 15:19:12','2022-10-11 13:25:14',1),(3,'30006',NULL,'4915224043369','CMC',10.00000000,10.00000000,100.00000000,'2022-10-11 18:13:35','2022-10-11 15:13:36',1);
/*!40000 ALTER TABLE `tbl_purchase_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sale_bid`
--

DROP TABLE IF EXISTS `tbl_sale_bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_sale_bid` (
  `_id` int NOT NULL AUTO_INCREMENT,
  `bid_id` varchar(80) DEFAULT NULL,
  `asset_id` varchar(80) DEFAULT NULL,
  `asset_name` varchar(25) DEFAULT NULL,
  `owner_msisdn` varchar(20) DEFAULT NULL,
  `bidder_msisdn` varchar(20) DEFAULT NULL,
  `qty` decimal(15,8) DEFAULT '0.00000000',
  `bid_price` decimal(15,8) DEFAULT '0.00000000',
  `time_stamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_accepted` int DEFAULT '0',
  `is_deleted` int DEFAULT '0',
  PRIMARY KEY (`_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `bid_id` (`bid_id`),
  KEY `owner_msisdn` (`owner_msisdn`),
  KEY `is_accepted` (`is_accepted`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sale_bid`
--

LOCK TABLES `tbl_sale_bid` WRITE;
/*!40000 ALTER TABLE `tbl_sale_bid` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_sale_bid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sale_request`
--

DROP TABLE IF EXISTS `tbl_sale_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_sale_request` (
  `_id` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(80) DEFAULT NULL,
  `unit_price_no_markup` decimal(8,2) DEFAULT NULL,
  `msisdn` varchar(20) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `unit_price` decimal(15,8) DEFAULT '0.00000000',
  `no_of_grain_sold` decimal(15,8) DEFAULT '0.00000000',
  `no_markup_cost` decimal(15,8) DEFAULT '0.00000000',
  `cost` decimal(15,8) DEFAULT '0.00000000',
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_processed` int DEFAULT '0',
  PRIMARY KEY (`_id`),
  KEY `is_processed` (`is_processed`),
  KEY `msisdn` (`msisdn`),
  KEY `uid_index` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sale_request`
--

LOCK TABLES `tbl_sale_request` WRITE;
/*!40000 ALTER TABLE `tbl_sale_request` DISABLE KEYS */;
INSERT INTO `tbl_sale_request` VALUES (1,'30006',25.00,'4915224043369','CMC',25.50000000,2.00000000,0.00000000,51.00000000,'2022-10-11 18:15:24','2022-10-11 15:15:24',0);
/*!40000 ALTER TABLE `tbl_sale_request` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbl_sale_request_after_insert_trigger` AFTER INSERT ON `tbl_sale_request` FOR EACH ROW BEGIN
INSERT 
INTO 
`db_freknur_investment`.`tbl_sale_request_queue`
(`uid`,`msisdn`,`description`,`unit_price`,`no_of_grain_sold`,`cost`,`date_created`)
VALUES
(NEW.uid,NEW.msisdn,NEW.description,NEW.unit_price,NEW.no_of_grain_sold,NEW.cost,NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbl_sale_request_queue`
--

DROP TABLE IF EXISTS `tbl_sale_request_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_sale_request_queue` (
  `_id` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(20) NOT NULL,
  `msisdn` varchar(20) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `unit_price` decimal(15,8) DEFAULT '0.00000000',
  `no_of_grain_sold` decimal(15,8) DEFAULT '0.00000000',
  `cost` decimal(15,8) DEFAULT '0.00000000',
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_processed` int DEFAULT '0',
  PRIMARY KEY (`_id`),
  KEY `is_processed` (`is_processed`),
  KEY `msisdn` (`msisdn`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sale_request_queue`
--

LOCK TABLES `tbl_sale_request_queue` WRITE;
/*!40000 ALTER TABLE `tbl_sale_request_queue` DISABLE KEYS */;
INSERT INTO `tbl_sale_request_queue` VALUES (1,'30006','4915224043369','CMC',25.50000000,2.00000000,51.00000000,'2022-10-11 18:15:24','2022-10-11 15:15:24',0);
/*!40000 ALTER TABLE `tbl_sale_request_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_statement`
--

DROP TABLE IF EXISTS `tbl_statement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_statement` (
  `_id` int NOT NULL AUTO_INCREMENT,
  `msisdn` varchar(20) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `unit_price` decimal(15,8) DEFAULT '0.00000000',
  `number_of_share` decimal(15,8) DEFAULT '0.00000000',
  `cost` decimal(15,8) DEFAULT '0.00000000',
  `running_bal` decimal(15,8) DEFAULT '0.00000000',
  `is_archived` int DEFAULT '0',
  PRIMARY KEY (`_id`),
  KEY `msisdn` (`msisdn`),
  KEY `is_archived` (`is_archived`)
) ENGINE=InnoDB AUTO_INCREMENT=1645 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_statement`
--

LOCK TABLES `tbl_statement` WRITE;
/*!40000 ALTER TABLE `tbl_statement` DISABLE KEYS */;
INSERT INTO `tbl_statement` VALUES (1,'4915224043369','TGP',19.12000000,10.00000000,191.20000000,2258.80000000,0),(1643,'254707132162','TGP',19.12000000,1.00000000,19.12000000,11806.12000000,0),(1644,'4915224043369','CMC',10.00000000,10.00000000,100.00000000,2158.80000000,0);
/*!40000 ALTER TABLE `tbl_statement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_transaction`
--

DROP TABLE IF EXISTS `tbl_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_transaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_code` varchar(50) NOT NULL,
  `reference_no` varchar(50) NOT NULL,
  `msisdn` varchar(15) NOT NULL,
  `cr` decimal(15,8) DEFAULT '0.00000000',
  `dr` decimal(15,8) DEFAULT '0.00000000',
  `balance` decimal(15,8) DEFAULT '0.00000000',
  `narration` text,
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_archived` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `msisdn` (`msisdn`),
  KEY `reference_no` (`reference_no`),
  KEY `account_id` (`account_code`),
  KEY `is_archived` (`is_archived`)
) ENGINE=InnoDB AUTO_INCREMENT=1648 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_transaction`
--

LOCK TABLES `tbl_transaction` WRITE;
/*!40000 ALTER TABLE `tbl_transaction` DISABLE KEYS */;
INSERT INTO `tbl_transaction` VALUES (1,'INC','GRN91A8E0780A','4915224043369',3.71250000,0.00000000,426.98220000,'FEE OF 3.71 EARNED FROM SELL OF TGP SHARES','2022-10-11 12:12:18','2022-10-11 09:12:18',0),(2,'FEE','GRN91A8E0780A','4915224043369',0.03750000,0.00000000,4.34000000,'LEVY DEDUCTED FROM A FEE EARNED FROM SELL OF TGP SHARES','2022-10-11 12:12:18','2022-10-11 09:12:18',0),(1644,'INC','GRN325DFF850A','254707132162',0.37000000,0.00000000,427.35000000,'FEE OF 0.37 EARNED FROM SELL OF TGP SHARES','2022-10-11 16:25:14','2022-10-11 13:25:14',0),(1645,'FEE','GRN325DFF850A','254707132162',0.00000000,0.00000000,4.34000000,'LEVY DEDUCTED FROM A FEE EARNED FROM SELL OF TGP SHARES','2022-10-11 16:25:14','2022-10-11 13:25:14',0),(1646,'INC','GRN10B743250A','4915224043369',1.98000000,0.00000000,429.33000000,'FEE OF 1.98 EARNED FROM SELL OF CMC SHARES','2022-10-11 18:13:36','2022-10-11 15:13:36',0),(1647,'FEE','GRN10B743250A','4915224043369',0.02000000,0.00000000,4.36000000,'LEVY DEDUCTED FROM A FEE EARNED FROM SELL OF CMC SHARES','2022-10-11 18:13:36','2022-10-11 15:13:36',0);
/*!40000 ALTER TABLE `tbl_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `db_freknur_loan`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `db_freknur_loan` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `db_freknur_loan`;

--
-- Table structure for table `notification_template`
--

DROP TABLE IF EXISTS `notification_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language_id` int DEFAULT NULL,
  `message` char(160) DEFAULT NULL,
  `type` int DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_template`
--

LOCK TABLES `notification_template` WRITE;
/*!40000 ALTER TABLE `notification_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status_description` char(20) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_configs`
--

DROP TABLE IF EXISTS `system_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_configs` (
  `_income_rate` double(5,2) DEFAULT '0.00',
  `_interest_rate` double(5,2) DEFAULT '0.00',
  `_loan_duration_in_day` int DEFAULT '2',
  `_excise_rate` float DEFAULT '0.0909091',
  `_1_notification_hr` int DEFAULT '8',
  `_2_notification_hr` int DEFAULT '6',
  `_3_notification_hr` int DEFAULT '4',
  `_4_notification_hr` int DEFAULT '1',
  `_minimum_credit` double(15,2) DEFAULT NULL,
  `_maximum_credit` double(15,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_configs`
--

LOCK TABLES `system_configs` WRITE;
/*!40000 ALTER TABLE `system_configs` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_account`
--

DROP TABLE IF EXISTS `tbl_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_code` varchar(20) NOT NULL,
  `account_name` varchar(50) DEFAULT NULL,
  `balance` decimal(18,8) DEFAULT '0.00000000',
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_unik` (`account_code`),
  KEY `bank_id` (`account_code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_account`
--

LOCK TABLES `tbl_account` WRITE;
/*!40000 ALTER TABLE `tbl_account` DISABLE KEYS */;
INSERT INTO `tbl_account` VALUES (1,'UTY','UTILITY',50000000.00000000,'2020-06-24 17:11:08','2022-10-06 09:55:41'),(2,'DEP','DEPOSIT',0.00000000,'2020-06-24 17:12:32','2020-06-24 14:12:33'),(3,'INC','INCOME',0.00000000,'2020-06-24 18:09:37','2022-09-27 13:49:31'),(4,'FEE','LOAN_FEE',0.00000000,'2020-06-24 18:10:57','2020-06-24 15:10:57');
/*!40000 ALTER TABLE `tbl_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_broadcast`
--

DROP TABLE IF EXISTS `tbl_broadcast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_broadcast` (
  `_id` tinyint NOT NULL AUTO_INCREMENT,
  `message` varchar(420) NOT NULL,
  `broadcast_name` varchar(50) NOT NULL,
  `broadcast_date` datetime DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_processed` int DEFAULT '0',
  `is_deleted` int DEFAULT '0',
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_broadcast`
--

LOCK TABLES `tbl_broadcast` WRITE;
/*!40000 ALTER TABLE `tbl_broadcast` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_broadcast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_credit_score`
--

DROP TABLE IF EXISTS `tbl_credit_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_credit_score` (
  `id` int NOT NULL AUTO_INCREMENT,
  `msisdn` varchar(15) DEFAULT NULL,
  `credit_score` int DEFAULT NULL,
  `credit_limit` double(15,2) DEFAULT NULL,
  `date_scored` datetime DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `msisdn_ac` (`msisdn`),
  KEY `msisdn` (`msisdn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_credit_score`
--

LOCK TABLES `tbl_credit_score` WRITE;
/*!40000 ALTER TABLE `tbl_credit_score` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_credit_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_debtor`
--

DROP TABLE IF EXISTS `tbl_debtor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_debtor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(50) DEFAULT NULL,
  `msisdn` varchar(15) NOT NULL,
  `amount_requested` double(15,2) DEFAULT '0.00',
  `amount_disbursed` double(15,2) DEFAULT '0.00',
  `repayment_amount` double(15,2) DEFAULT '0.00',
  `interest_amount` double(9,2) DEFAULT '0.00',
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `expected_repayment_date` datetime DEFAULT NULL,
  `repayment_date` datetime DEFAULT NULL,
  `notification_count` int DEFAULT '0',
  `next_notification_date` datetime DEFAULT NULL,
  `is_repaid` int DEFAULT '0' COMMENT '1-Repaid|0-Unpaid',
  `is_archived` int DEFAULT '0' COMMENT '1-Archived|0-Not Archive',
  PRIMARY KEY (`id`),
  UNIQUE KEY `reference_unik` (`reference_no`),
  KEY `reference_no` (`reference_no`),
  KEY `msisdn` (`msisdn`),
  KEY `is_repaid` (`is_repaid`),
  KEY `is_archived` (`is_archived`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_debtor`
--

LOCK TABLES `tbl_debtor` WRITE;
/*!40000 ALTER TABLE `tbl_debtor` DISABLE KEYS */;
INSERT INTO `tbl_debtor` VALUES (1,'LNR-JX4IIS5QOY','4915224043369',2500.00,2450.00,3125.00,625.00,'2022-10-06 12:55:41','2022-10-06 09:55:41','2022-10-16 12:55:41','2022-10-16 12:55:41',4,'2022-10-16 08:55:41',0,1);
/*!40000 ALTER TABLE `tbl_debtor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_defaulter`
--

DROP TABLE IF EXISTS `tbl_defaulter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_defaulter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `msisdn` varchar(15) NOT NULL,
  `loan_amount` double(15,2) DEFAULT '0.00',
  `amount_repaid` double(15,2) DEFAULT '0.00',
  `cummulative_interest` double(15,2) DEFAULT '0.00',
  `expected_repayment_date` datetime DEFAULT NULL,
  `notification_date` datetime DEFAULT NULL,
  `date_repaid` datetime DEFAULT NULL,
  `roll_count` int DEFAULT '0',
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `is_archived` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `msisdn` (`msisdn`),
  KEY `is_archived` (`is_archived`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_defaulter`
--

LOCK TABLES `tbl_defaulter` WRITE;
/*!40000 ALTER TABLE `tbl_defaulter` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_defaulter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_language`
--

DROP TABLE IF EXISTS `tbl_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_language` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language_code` char(3) DEFAULT NULL,
  `language_description` char(45) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `language_code` (`language_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_language`
--

LOCK TABLES `tbl_language` WRITE;
/*!40000 ALTER TABLE `tbl_language` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_loan_payout`
--

DROP TABLE IF EXISTS `tbl_loan_payout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_loan_payout` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(50) NOT NULL,
  `msisdn` varchar(15) NOT NULL,
  `amount` double(15,2) DEFAULT '0.00',
  `collateral_percentage` double(15,2) DEFAULT '0.00',
  `approved_by` varchar(25) DEFAULT NULL,
  `status` int DEFAULT '0',
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT NULL,
  `has_collateral` int DEFAULT '0',
  `is_processed` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `reference_unik` (`reference_no`),
  KEY `msisdn` (`msisdn`),
  KEY `is_processed` (`is_processed`),
  KEY `request_id` (`reference_no`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_loan_payout`
--

LOCK TABLES `tbl_loan_payout` WRITE;
/*!40000 ALTER TABLE `tbl_loan_payout` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_loan_payout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_loan_repayment`
--

DROP TABLE IF EXISTS `tbl_loan_repayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_loan_repayment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `msisdn` varchar(15) NOT NULL,
  `amount` double(15,2) DEFAULT '0.00',
  `transaction_no` varchar(25) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_processed` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_no` (`transaction_no`),
  KEY `trxunik` (`transaction_no`),
  KEY `msisdn` (`msisdn`),
  KEY `is_processed` (`is_processed`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_loan_repayment`
--

LOCK TABLES `tbl_loan_repayment` WRITE;
/*!40000 ALTER TABLE `tbl_loan_repayment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_loan_repayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_loan_request`
--

DROP TABLE IF EXISTS `tbl_loan_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_loan_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(50) DEFAULT NULL COMMENT 'loan request reference',
  `msisdn` varchar(50) NOT NULL COMMENT 'loanee identifier',
  `amount` double(15,2) DEFAULT '0.00',
  `collateral_percentage` double(15,2) DEFAULT '0.00',
  `task_flag` varchar(1) DEFAULT '0',
  `requested_by` varchar(50) DEFAULT NULL,
  `approved_by` varchar(50) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `has_collateral` int NOT NULL DEFAULT '0',
  `is_processed` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `msisdn_unik` (`msisdn`),
  UNIQUE KEY `ref_no` (`reference_no`),
  KEY `is_processed` (`is_processed`),
  KEY `msisdn` (`msisdn`),
  KEY `has_collateral` (`has_collateral`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_loan_request`
--

LOCK TABLES `tbl_loan_request` WRITE;
/*!40000 ALTER TABLE `tbl_loan_request` DISABLE KEYS */;
INSERT INTO `tbl_loan_request` VALUES (1,'LNR-JX4IIS5QOY','4915224043369',2500.00,0.00,'2','4915224043369','admin','2022-10-06 12:53:20','2022-10-06 09:55:40',0,1);
/*!40000 ALTER TABLE `tbl_loan_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_mpesa_receipt`
--

DROP TABLE IF EXISTS `tbl_mpesa_receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_mpesa_receipt` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(50) NOT NULL DEFAULT '0',
  `msisdn` varchar(15) NOT NULL,
  `amount` double(15,2) DEFAULT '0.00',
  `status` varchar(2500) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_archived` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `reference_unik` (`reference_no`),
  KEY `msisdn` (`msisdn`),
  KEY `is_archived` (`is_archived`),
  KEY `reference_no` (`reference_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_mpesa_receipt`
--

LOCK TABLES `tbl_mpesa_receipt` WRITE;
/*!40000 ALTER TABLE `tbl_mpesa_receipt` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_mpesa_receipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_transaction`
--

DROP TABLE IF EXISTS `tbl_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_transaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_code` varchar(50) NOT NULL,
  `reference_no` varchar(50) NOT NULL,
  `msisdn` varchar(15) NOT NULL,
  `cr` decimal(15,8) DEFAULT '0.00000000',
  `dr` decimal(15,8) DEFAULT '0.00000000',
  `balance` decimal(15,8) DEFAULT '0.00000000',
  `narration` text,
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_archived` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `msisdn` (`msisdn`),
  KEY `reference_no` (`reference_no`),
  KEY `account_id` (`account_code`),
  KEY `is_archived` (`is_archived`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_transaction`
--

LOCK TABLES `tbl_transaction` WRITE;
/*!40000 ALTER TABLE `tbl_transaction` DISABLE KEYS */;
INSERT INTO `tbl_transaction` VALUES (1,'UTY','LNR-JX4IIS5QOY','4915224043369',0.00000000,2500.00000000,-2500.00000000,'MONEY MOVEMENT OUT OF UTY.','2022-10-06 12:55:41','2022-10-06 09:55:41',0),(2,'FEE','LNR-JX4IIS5QOY','4915224043369',50.00000000,0.00000000,50.00000000,'LOAN HANDLING FEES EARNED.','2022-10-06 12:55:41','2022-10-06 09:55:41',0),(3,'0','LNR-JX4IIS5QOY','4915224043369',2450.00000000,0.00000000,2450.00000000,'MONEY MOVED FROM UTY TO CLIENT WALLET A/C.','2022-10-06 12:55:41','2022-10-06 09:55:41',0);
/*!40000 ALTER TABLE `tbl_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_wallet`
--

DROP TABLE IF EXISTS `tbl_wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_wallet` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` varchar(100) NOT NULL,
  `msisdn` varchar(15) NOT NULL,
  `balance` decimal(15,8) DEFAULT '0.00000000',
  `bonus` decimal(15,8) DEFAULT '0.00000000',
  `reference_no` varchar(50) NOT NULL DEFAULT '0',
  `loan_limit` varchar(10) DEFAULT '0',
  `county_id` int DEFAULT NULL,
  `language_id` int DEFAULT '1',
  `password` varchar(200) DEFAULT NULL,
  `salt` varchar(200) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` int DEFAULT '1' COMMENT '1-active 0-inactive',
  `is_suspended` int DEFAULT '0' COMMENT '1-suspended 0 not suspended',
  PRIMARY KEY (`id`),
  UNIQUE KEY `msisdn_unik` (`msisdn`),
  KEY `msisdn` (`msisdn`),
  KEY `status_id` (`is_active`),
  KEY `system_uid` (`uid`),
  KEY `is_suspended` (`is_suspended`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_wallet`
--

LOCK TABLES `tbl_wallet` WRITE;
/*!40000 ALTER TABLE `tbl_wallet` DISABLE KEYS */;
INSERT INTO `tbl_wallet` VALUES (1,'99411788130418788','254707132162',11806.12000000,0.00000000,'0','0',NULL,1,'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413',NULL,'2022-03-14 16:33:44','2022-09-27 13:49:31',1,0),(2,'99411788130418811','254711884102',850.10000000,0.00000000,'0','0',NULL,1,'b0412597dcea813655574dc54a5b74967cf85317f0332a2591be7953a016f8de56200eb37d5ba593b1e4aa27cea5ca27100f94dccd5b04bae5cadd4454dba67d',NULL,'2022-04-19 15:28:15','2022-06-13 13:29:09',1,0),(3,'99411788130418818','254720726071',850.00000000,0.00000000,'0','0',NULL,1,'d4bd3b6e82888fa48dcff27b97aa596b8014dceca2b73d5a2cc0cc31a1709991b7684dd3cfe9ca355479a51751208e0fce49b85976eeaf1c687a67c1715dcd30',NULL,'2022-04-20 11:00:44','2022-04-20 08:00:44',1,0),(4,'99411788130418786','254722563707',138.11000000,0.00000000,'0','0',NULL,1,'b0412597dcea813655574dc54a5b74967cf85317f0332a2591be7953a016f8de56200eb37d5ba593b1e4aa27cea5ca27100f94dccd5b04bae5cadd4454dba67d',NULL,'2022-03-14 12:38:19','2022-08-10 12:22:09',1,0),(5,'99411788130418807','393519688608',2821.46000000,0.00000000,'LNR-xw6mpm6yud','0',NULL,1,'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413',NULL,'2022-03-31 12:56:44','2022-04-25 14:57:25',1,0),(6,'99411788130418820','50672295577',850.00000000,0.00000000,'0','0',NULL,1,'fc97d44c8cd6cdd8616a7e3ab317a287874083996c8e072a4eba666604a9262770fdc26c3aea48866e4156c491d6e0c149b81b117f0c07c17b50d57955f31b2c',NULL,'2022-04-20 17:07:39','2022-04-20 14:07:40',1,0),(10,'99807424612925447','254722000000',266.00000000,0.00000000,'0','0',NULL,1,'f308662130d69bc2b2891a6092cdfeb818a83a8a23b2696a31f847d907b31d27833c64e400309eedc287cb721481af22499c3530b8fbc700360a9ea0d60d24e6',NULL,'2022-06-20 14:42:33','2022-06-20 11:42:33',1,0),(11,'99807424612925488','46708740682',0.00000000,0.00000000,'0','0',NULL,1,'10eabca237dd0c6fe5a49622fe8a631b1c6cb283b205140f4798dc05470f2b2c52c448130cdcb5b4f8dfbf856e34e1b6908bf31d002681002d781009e100274b',NULL,'2022-08-07 15:21:12','2022-08-07 12:21:12',1,0),(13,'99807424612971253','4915224043369',2158.80000000,0.00000000,'LNR-JX4IIS5QOY','0',NULL,1,'0fa0d81bce9e28873f5bac8aa91885fc2e4ab5b86054598964bcb8ef080426c5b4abadb6cd815e727a8e2adce056350fc902ba0ec268ba3fd0fb3d7ac593b6de',NULL,'2022-10-06 12:51:34','2022-10-06 09:55:41',1,0);
/*!40000 ALTER TABLE `tbl_wallet` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbl_wallet_after_insert` AFTER INSERT ON `tbl_wallet` FOR EACH ROW BEGIN
INSERT
INTO `db_freknur_general`.`tbl_temp` (`_action`) 
SELECT 
NEW.msisdn 
FROM 
`db_freknur_loan`.`tbl_wallet`;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbl_wallet_extra`
--

DROP TABLE IF EXISTS `tbl_wallet_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_wallet_extra` (
  `_id` bigint NOT NULL AUTO_INCREMENT,
  `msisdn` varchar(20) DEFAULT NULL,
  `first_name` varchar(12) DEFAULT NULL,
  `second_name` varchar(65) DEFAULT NULL,
  `birth_date` varchar(12) DEFAULT NULL,
  `mail` varchar(35) DEFAULT NULL,
  `country_code` varchar(2) DEFAULT NULL,
  `time_stamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `msisdn` (`msisdn`),
  KEY `country_code` (`country_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_wallet_extra`
--

LOCK TABLES `tbl_wallet_extra` WRITE;
/*!40000 ALTER TABLE `tbl_wallet_extra` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_wallet_extra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_wallet_transaction`
--

DROP TABLE IF EXISTS `tbl_wallet_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_wallet_transaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(50) NOT NULL,
  `msisdn` varchar(15) NOT NULL,
  `cr` decimal(15,8) DEFAULT '0.00000000',
  `dr` decimal(15,8) DEFAULT '0.00000000',
  `balance` decimal(15,8) DEFAULT '0.00000000',
  `narration` text NOT NULL,
  `date_created` datetime DEFAULT NULL COMMENT 'transaction_date',
  `date_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_archived` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `msisdn` (`msisdn`),
  KEY `is_archived` (`is_archived`),
  KEY `reference_no` (`reference_no`)
) ENGINE=InnoDB AUTO_INCREMENT=1647 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_wallet_transaction`
--

LOCK TABLES `tbl_wallet_transaction` WRITE;
/*!40000 ALTER TABLE `tbl_wallet_transaction` DISABLE KEYS */;
INSERT INTO `tbl_wallet_transaction` VALUES (1,'LNR-JX4IIS5QOY','4915224043369',2500.00000000,0.00000000,0.00000000,'LOAN AMOUNT REQUESTED.','2022-10-06 12:55:41','2022-10-06 09:55:41',0),(2,'LNR-JX4IIS5QOY','4915224043369',0.00000000,50.00000000,2450.00000000,'FEE CHARGED ON LOAN.','2022-10-06 12:55:41','2022-10-06 09:55:41',0),(3,'GRN91A8E0780A','4915224043369',0.00000000,191.20000000,2258.80000000,'TGP 10 SHARES PURCHASED @.191.2','2022-10-11 12:12:18','2022-10-11 09:12:18',0),(1645,'GRN325DFF850A','254707132162',0.00000000,19.12000000,11806.12000000,'TGP 1 SHARES PURCHASED @.19.12','2022-10-11 16:25:14','2022-10-11 13:25:14',0),(1646,'GRN10B743250A','4915224043369',0.00000000,100.00000000,2158.80000000,'CMC 10 SHARES PURCHASED @.100','2022-10-11 18:13:36','2022-10-11 15:13:36',0);
/*!40000 ALTER TABLE `tbl_wallet_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `db_freknur_notification`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `db_freknur_notification` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `db_freknur_notification`;

--
-- Table structure for table `tbl_broadcast`
--

DROP TABLE IF EXISTS `tbl_broadcast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_broadcast` (
  `_id` bigint NOT NULL AUTO_INCREMENT,
  `uid` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `message` varchar(520) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `broadcast_date` datetime DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_processed` int DEFAULT '0',
  PRIMARY KEY (`_id`) USING BTREE,
  UNIQUE KEY `uid` (`uid`) USING BTREE,
  KEY `is_processed` (`is_processed`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_broadcast`
--

LOCK TABLES `tbl_broadcast` WRITE;
/*!40000 ALTER TABLE `tbl_broadcast` DISABLE KEYS */;
INSERT INTO `tbl_broadcast` VALUES (1,'d6e244ac-3423-11ed-a525-42010aa20003','hello world','2022-09-21 00:00:00','2022-09-14 14:53:25','2022-09-14 11:53:25',0),(2,'efa9ef76-3423-11ed-a525-42010aa20003','eeee','2022-09-20 00:00:00','2022-09-14 14:54:06','2022-09-14 11:54:06',0),(3,'082f84fc-3424-11ed-98e3-42010aa20003','test message from freknur','2022-08-10 12:47:24','2022-09-14 14:54:47','2022-09-14 11:54:47',0),(4,'2dfc0d4c-3427-11ed-874a-42010aa20003','test message from freknur','2022-08-10 12:47:24','2022-09-14 15:17:19','2022-09-14 12:17:19',0),(5,'44fde8ee-3427-11ed-8748-42010aa20003','test message from freknur','2022-08-10 12:47:24','2022-09-14 15:17:58','2022-09-14 12:17:58',0),(6,'5668dec2-3427-11ed-94eb-42010aa20003','test message from freknur','2022-08-10 12:47:24','2022-09-14 15:18:27','2022-09-14 12:18:27',0),(7,'a592e43e-3427-11ed-8298-42010aa20003','hello world 2','2022-09-28 00:00:00','2022-09-14 15:20:40','2022-09-14 12:20:40',0),(8,'75029674-3428-11ed-a4d7-42010aa20003','test message from freknur','2022-08-10 12:47:24','2022-09-14 15:26:28','2022-09-14 12:26:28',0),(9,'a546bada-3429-11ed-8298-42010aa20003','zssss','2022-09-22 00:00:00','2022-09-14 15:34:58','2022-09-14 12:34:58',0),(10,'bece2296-342d-11ed-8298-42010aa20003','m,m,m,m,','2022-09-25 00:00:00','2022-09-14 16:04:19','2022-09-14 13:04:19',0),(11,'0d4f8752-342e-11ed-8298-42010aa20003','m,m,','2022-09-25 00:00:00','2022-09-14 16:06:31','2022-09-14 13:06:31',0),(12,'30d28478-343c-11ed-8298-42010aa20003','opera','2022-09-27 00:00:00','2022-09-14 17:47:44','2022-09-14 14:47:44',0);
/*!40000 ALTER TABLE `tbl_broadcast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `db_freknur_paypal`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `db_freknur_paypal` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `db_freknur_paypal`;

--
-- Table structure for table `tbl_ipn_receipt`
--

DROP TABLE IF EXISTS `tbl_ipn_receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ipn_receipt` (
  `_id` int NOT NULL AUTO_INCREMENT,
  `txn_id` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `ipn` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`_id`) USING BTREE,
  UNIQUE KEY `txn_id` (`txn_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ipn_receipt`
--

LOCK TABLES `tbl_ipn_receipt` WRITE;
/*!40000 ALTER TABLE `tbl_ipn_receipt` DISABLE KEYS */;
INSERT INTO `tbl_ipn_receipt` VALUES (2,'8643509750','{\'item_name\': \'something\', \'item_number\': \'AK-1234\', \'payment_status\': \'Completed\', \'payment_amount\': \'12.34\', \'payment_currency\': \'USD\', \'txn_id\': \'8643509750\', \'receiver_email\': \'seller@paypalsandbox.com\', \'payer_email\': \'buyer@paypalsandbox.com\'}','2021-11-11 20:12:10'),(3,'720163729','{\'item_name\': \'loan\', \'item_number\': \'12345678\', \'payment_status\': \'Completed\', \'payment_amount\': None, \'payment_currency\': None, \'txn_id\': \'720163729\', \'receiver_email\': \'info@merchant.com\', \'payer_email\': \'joedoe@net.com\'}','2021-11-11 20:12:10'),(4,'120163729','{\'item_name\': \'loan\', \'item_number\': \'1234567889\', \'payment_status\': \'Completed\', \'payment_amount\': None, \'payment_currency\': None, \'txn_id\': \'120163729\', \'receiver_email\': \'info@merchant.com\', \'payer_email\': \'joedoe@net.com\'}','2021-11-11 22:23:31'),(5,'30163729','{\'item_name\': \'loan\', \'item_number\': \'1234567889\', \'payment_status\': \'Completed\', \'payment_amount\': None, \'payment_currency\': None, \'txn_id\': \'30163729\', \'receiver_email\': \'info@merchant.com\', \'payer_email\': \'joedoe@net.com\'}','2021-11-11 22:32:38'),(6,'301637290','{\'item_name\': \'loan\', \'item_number\': \'1234567889\', \'payment_status\': \'Completed\', \'payment_amount\': None, \'payment_currency\': None, \'txn_id\': \'301637290\', \'receiver_email\': \'info@merchant.com\', \'payer_email\': \'joedoe@net.com\'}','2021-11-11 22:56:05'),(7,'448182434','{\'item_name\': \'something\', \'item_number\': \'AK-1234\', \'payment_status\': \'Completed\', \'payment_amount\': \'12.34\', \'payment_currency\': \'USD\', \'txn_id\': \'448182434\', \'receiver_email\': \'seller@paypalsandbox.com\', \'payer_email\': \'buyer@paypalsandbox.com\'}','2021-11-17 09:12:59');
/*!40000 ALTER TABLE `tbl_ipn_receipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_paypal_bridge_temp`
--

DROP TABLE IF EXISTS `tbl_paypal_bridge_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_paypal_bridge_temp` (
  `_id` int NOT NULL AUTO_INCREMENT,
  `msisdn` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `paypal_customer_email` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`_id`) USING BTREE,
  UNIQUE KEY `msisdn` (`msisdn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_paypal_bridge_temp`
--

LOCK TABLES `tbl_paypal_bridge_temp` WRITE;
/*!40000 ALTER TABLE `tbl_paypal_bridge_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_paypal_bridge_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `db_freknur_stats`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `db_freknur_stats` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `db_freknur_stats`;

--
-- Table structure for table `tbl_approved_loan_stats`
--

DROP TABLE IF EXISTS `tbl_approved_loan_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_approved_loan_stats` (
  `_id` int NOT NULL AUTO_INCREMENT,
  `daily_cnt` int DEFAULT '0',
  `total` decimal(15,2) DEFAULT '0.00',
  `time_stamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_achived` int DEFAULT '0',
  PRIMARY KEY (`_id`),
  KEY `is_achived` (`is_achived`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_approved_loan_stats`
--

LOCK TABLES `tbl_approved_loan_stats` WRITE;
/*!40000 ALTER TABLE `tbl_approved_loan_stats` DISABLE KEYS */;
INSERT INTO `tbl_approved_loan_stats` VALUES (1,2,1000.00,'2022-06-28 15:04:46',0),(2,1,4800.00,'2022-08-10 09:47:23',0),(3,1,500.00,'2022-09-27 12:24:33',0),(4,1,4200.00,'2022-09-28 11:28:18',0),(5,1,2500.00,'2022-10-06 09:55:40',0);
/*!40000 ALTER TABLE `tbl_approved_loan_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_debtor_stats`
--

DROP TABLE IF EXISTS `tbl_debtor_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_debtor_stats` (
  `_id` int NOT NULL AUTO_INCREMENT,
  `daily_cnt` int DEFAULT '0',
  `total` decimal(15,2) DEFAULT '0.00',
  `time_stamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_achived` int DEFAULT '0',
  PRIMARY KEY (`_id`),
  KEY `is_achived` (`is_achived`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_debtor_stats`
--

LOCK TABLES `tbl_debtor_stats` WRITE;
/*!40000 ALTER TABLE `tbl_debtor_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_debtor_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_loan_stats`
--

DROP TABLE IF EXISTS `tbl_loan_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_loan_stats` (
  `_id` int NOT NULL AUTO_INCREMENT,
  `daily_cnt` int DEFAULT '0',
  `total` decimal(15,2) DEFAULT '0.00',
  `time_stamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_achived` int DEFAULT '0',
  PRIMARY KEY (`_id`),
  KEY `is_achived` (`is_achived`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_loan_stats`
--

LOCK TABLES `tbl_loan_stats` WRITE;
/*!40000 ALTER TABLE `tbl_loan_stats` DISABLE KEYS */;
INSERT INTO `tbl_loan_stats` VALUES (5,8,0.00,'2022-04-19 22:31:45',0),(6,5,81.00,'2022-06-10 14:36:21',0),(7,1857,1.00,'2022-06-14 13:12:40',0),(8,6,120.00,'2022-06-21 06:43:42',0),(9,8,4000.00,'2022-06-27 21:29:02',0),(10,1,500.00,'2022-07-07 12:52:37',0),(11,7,3500.00,'2022-07-12 14:57:37',0),(12,1,500.00,'2022-09-27 12:22:31',0),(13,1,4200.00,'2022-09-28 11:25:14',0),(14,1,2500.00,'2022-10-06 09:53:21',0);
/*!40000 ALTER TABLE `tbl_loan_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_purchase_asset_stats`
--

DROP TABLE IF EXISTS `tbl_purchase_asset_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_purchase_asset_stats` (
  `_id` int NOT NULL AUTO_INCREMENT,
  `daily_cnt` int DEFAULT '0',
  `total` decimal(15,2) DEFAULT '0.00',
  `time_stamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_achived` int DEFAULT '0',
  PRIMARY KEY (`_id`),
  KEY `is_achived` (`is_achived`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_purchase_asset_stats`
--

LOCK TABLES `tbl_purchase_asset_stats` WRITE;
/*!40000 ALTER TABLE `tbl_purchase_asset_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_purchase_asset_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_rejected_loan_stats`
--

DROP TABLE IF EXISTS `tbl_rejected_loan_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_rejected_loan_stats` (
  `_id` int NOT NULL AUTO_INCREMENT,
  `daily_cnt` int DEFAULT '0',
  `total` decimal(15,2) DEFAULT '0.00',
  `time_stamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_achived` int DEFAULT '0',
  PRIMARY KEY (`_id`),
  KEY `is_achived` (`is_achived`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_rejected_loan_stats`
--

LOCK TABLES `tbl_rejected_loan_stats` WRITE;
/*!40000 ALTER TABLE `tbl_rejected_loan_stats` DISABLE KEYS */;
INSERT INTO `tbl_rejected_loan_stats` VALUES (1,1,500.00,'2022-06-28 08:32:46',0),(2,1,500.00,'2022-07-07 13:20:37',0),(3,7,3500.00,'2022-07-12 14:59:10',0),(4,1,3280.00,'2022-07-13 14:37:50',0),(5,1,2800.00,'2022-07-27 09:34:38',0);
/*!40000 ALTER TABLE `tbl_rejected_loan_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sale_asset_stats`
--

DROP TABLE IF EXISTS `tbl_sale_asset_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_sale_asset_stats` (
  `_id` int NOT NULL AUTO_INCREMENT,
  `daily_cnt` int DEFAULT '0',
  `total` decimal(15,2) DEFAULT '0.00',
  `time_stamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_achived` int DEFAULT '0',
  PRIMARY KEY (`_id`),
  KEY `is_achived` (`is_achived`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sale_asset_stats`
--

LOCK TABLES `tbl_sale_asset_stats` WRITE;
/*!40000 ALTER TABLE `tbl_sale_asset_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_sale_asset_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `db_freknur_wallet`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `db_freknur_wallet` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `db_freknur_wallet`;

--
-- Table structure for table `betaTesters`
--

DROP TABLE IF EXISTS `betaTesters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `betaTesters` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `EmailAddress` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `EmailAddress` (`EmailAddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `betaTesters`
--

LOCK TABLES `betaTesters` WRITE;
/*!40000 ALTER TABLE `betaTesters` DISABLE KEYS */;
/*!40000 ALTER TABLE `betaTesters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliverydetails`
--

DROP TABLE IF EXISTS `deliverydetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliverydetails` (
  `deliveryID` int NOT NULL AUTO_INCREMENT,
  `userID` int NOT NULL,
  `deliveryCountry` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deliveryAddress` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deliveryInfor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deliveryContact` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `deliveryDefault` int NOT NULL,
  `deliveryCountryCode` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`deliveryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliverydetails`
--

LOCK TABLES `deliverydetails` WRITE;
/*!40000 ALTER TABLE `deliverydetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `deliverydetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devicesim`
--

DROP TABLE IF EXISTS `devicesim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devicesim` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userID` int NOT NULL,
  `contacts` int NOT NULL DEFAULT '0',
  `allSMS` int NOT NULL DEFAULT '0',
  `incomingSMS` int NOT NULL DEFAULT '0',
  `outgoingSMS` int NOT NULL DEFAULT '0',
  `draftSMS` int NOT NULL DEFAULT '0',
  `conversations` int NOT NULL DEFAULT '0',
  `apps` int NOT NULL,
  `imei` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `brand` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `design` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `displayName` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `isPhysicalDevice` tinyint(1) NOT NULL,
  `manufacturer` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `product` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `host` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `hardware` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `allowsVOIP` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `carrierName` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `isoCountryCode` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mobileCountryCode` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mobileNetworkCode` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `countryPhonePrefix` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `simcards` int NOT NULL,
  `callLogEntries` int NOT NULL,
  `dateOfLastCallLog` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `durationOfLastCallLog` int NOT NULL,
  `typeofLastCallLog` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `freeDiskSpace` float NOT NULL,
  `totalDiskSpace` float NOT NULL,
  `wifiName` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wifiBSSID` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wifiIP` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wifiIPv6` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wifiSubmask` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wifiBroadcast` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wifiGateway` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `typeOfConnectivity` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vpnActive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userID` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devicesim`
--

LOCK TABLES `devicesim` WRITE;
/*!40000 ALTER TABLE `devicesim` DISABLE KEYS */;
INSERT INTO `devicesim` VALUES (1,1,0,0,0,0,0,0,112,'fceb6f81d8d44ea7','OPPO','CPH1819','CPH1819EX_11_F.27',1,'OPPO','CPH1819','CPH1819','10','ubuntu16-122-237','mt6771','','','','','','',0,3000,'2022-07-21 17:31:20.287',198,'incoming',8256.13,51427.5,'','40:7d:0f:89:37:64','192.168.100.189','fe80::e6c4:83ff:fe01:14d1','255.255.255.0','/192.168.100.255','192.168.100.1','wifi',0),(2,2,0,0,0,0,0,0,2,'6e10d4417fd1ad3a','Redmi','fleur','RP1A.200720.011',1,'Xiaomi','2201117SY','fleur_eea','11','m1-xm-ota-bd291.bj.idc.xiaomi.com','mt6781','','','','','','',0,1350,'2022-07-23 21:46:29.660',56,'outgoing',64314.4,109862,'','74:0a:e1:4c:32:73','192.168.8.117','fe80::d23e:794e:b8a4:9cb3','255.255.255.0','/192.168.8.255','192.168.8.1','wifi',0),(6,3,0,0,0,0,0,0,57,'eb59385f7b75d96e','samsung','a7y18lte','QP1A.190711.020.A750FXXU5CVG1',1,'samsung','SM-A750F','a7y18ltejt','10','21HHAG04','exynos7885','','','','','','',0,20,'2022-09-23 10:16:24.670',0,'missed',31067.8,53576.4,'','38:ff:36:1c:fc:58','192.168.1.210','fe80::88a0:a3ff:fe52:5a39','255.255.255.0','/192.168.1.255','192.168.1.1','wifi',0),(7,4,0,0,0,0,0,0,2,'6e10d4417fd1ad3a','Redmi','fleur','RP1A.200720.011',1,'Xiaomi','2201117SY','fleur_eea','11','m1-xm-ota-bd291.bj.idc.xiaomi.com','mt6781','','','','','','',0,1471,'2022-09-26 16:32:52.042',44,'incoming',59662.8,109862,'','null','null','null','','null','0.0.0.0','cellular',0),(8,5,0,0,0,0,0,0,2,'6e10d4417fd1ad3a','Redmi','fleur','RP1A.200720.011',1,'Xiaomi','2201117SY','fleur_eea','11','m1-xm-ota-bd291.bj.idc.xiaomi.com','mt6781','','','','','','',0,1482,'2022-10-06 11:36:53.078',158,'outgoing',60165.1,109862,'','ec:a8:1f:a9:40:40','192.168.0.87','fe80::d23e:794e:b8a4:9cb3','255.255.255.0','/192.168.0.255','192.168.0.1','wifi',0);
/*!40000 ALTER TABLE `devicesim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eosaccounts`
--

DROP TABLE IF EXISTS `eosaccounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eosaccounts` (
  `accountID` int NOT NULL AUTO_INCREMENT,
  `accountName` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `userID` int NOT NULL,
  `transactionID` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `prKey` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`accountID`),
  UNIQUE KEY `accountName` (`accountName`),
  UNIQUE KEY `userID` (`userID`),
  UNIQUE KEY `transactionID` (`transactionID`),
  UNIQUE KEY `prKey` (`prKey`),
  UNIQUE KEY `url` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eosaccounts`
--

LOCK TABLES `eosaccounts` WRITE;
/*!40000 ALTER TABLE `eosaccounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `eosaccounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loginActivity`
--

DROP TABLE IF EXISTS `loginActivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loginActivity` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `account` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ipAdd` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginActivity`
--

LOCK TABLES `loginActivity` WRITE;
/*!40000 ALTER TABLE `loginActivity` DISABLE KEYS */;
INSERT INTO `loginActivity` VALUES (1,'254722563707',0,'2022-07-22 18:11:00.388481','android','Nairobi, Kenya','192.168.100.189'),(2,'254722563707',1,'2022-07-22 18:15:32.206108','android','Nairobi, Kenya','192.168.100.189'),(3,'254722563707',0,'2022-07-25 12:39:58.887127','android','Nairobi, Kenya','192.168.100.189'),(4,'254722563707',0,'2022-07-25 12:40:14.587232','android','Nairobi, Kenya','192.168.100.189'),(5,'254722563707',0,'2022-07-25 12:41:27.450204','android','Nairobi, Kenya','192.168.100.189'),(6,'254722563707',0,'2022-07-25 12:42:32.756148','android','Nairobi, Kenya','192.168.100.189'),(7,'254722563707',0,'2022-07-25 12:43:21.921025','android','Nairobi, Kenya','192.168.100.189'),(8,'254722563707',0,'2022-07-25 13:05:08.741863','android','Nairobi, Kenya','192.168.100.189'),(9,'254722563707',1,'2022-07-25 13:13:21.595289','android','Nairobi, Kenya','192.168.100.189'),(10,'254722563707',1,'2022-07-25 13:42:49.900789','android','Nairobi, Kenya','192.168.100.189'),(11,'4915224043369',1,'2022-07-27 12:55:34.900680','android','Melissia, Greece','192.168.8.117'),(12,'4915224043369',1,'2022-07-27 13:01:39.686791','android','Zakinthos, Greece','192.168.8.117'),(13,'254722563707',1,'2022-07-28 09:20:26.950878','android','Nairobi, Kenya','192.168.100.189'),(14,'254722563707',0,'2022-07-28 09:52:32.602580','android','Nairobi, Kenya','192.168.100.189'),(15,'254722563707',1,'2022-07-28 09:52:51.746968','android','Nairobi, Kenya','192.168.100.189'),(16,'254722563707',0,'2022-07-28 12:15:24.113708','android','Nairobi, Kenya','192.168.100.189'),(17,'254722563707',1,'2022-07-28 12:15:44.127373','android','Nairobi, Kenya','192.168.100.189'),(18,'254707132162',0,'2022-07-29 14:05:44.454610','android','Nairobi, Kenya','192.168.1.246'),(19,'254707132162',0,'2022-07-29 14:06:00.728451','android','Nairobi, Kenya','192.168.1.246'),(20,'254707132162',0,'2022-07-29 14:06:17.270896','android','Nairobi, Kenya','192.168.1.246'),(21,'254707132162',0,'2022-07-29 14:12:46.807805','android','Nairobi, Kenya','192.168.1.246'),(22,'4915224043369',1,'2022-07-30 13:05:34.563058','android','Planos, Greece','null'),(23,'254707132162',0,'2022-08-02 11:33:21.152489','android','Nairobi, Kenya','192.168.1.246'),(24,'254707132162',0,'2022-08-02 11:36:34.316097','android','Nairobi, Kenya','192.168.1.246'),(25,'254707132162',0,'2022-08-02 11:46:30.026318','android','Nairobi, Kenya','192.168.1.246'),(26,'254707132162',1,'2022-08-02 11:49:27.917350','android','Nairobi, Kenya','192.168.1.246'),(27,'46708740682',0,'2022-08-07 14:21:25.082114','undefined','undefined','undefined'),(28,'254707132162',1,'2022-08-08 11:21:47.271899','android','Nairobi, Kenya','192.168.1.246'),(29,'254707132162',1,'2022-08-08 11:49:03.048528','android','Nairobi, Kenya','192.168.1.246'),(30,'254707132162',1,'2022-08-08 16:56:05.248801','android','Nairobi, Kenya','192.168.1.246'),(31,'4915224043369',1,'2022-08-09 15:13:03.512004','android','Rostock, Germany','192.168.0.87'),(32,'254722563707',0,'2022-08-10 12:24:49.315075','android','Nairobi, Kenya','192.168.100.189'),(33,'254722563707',1,'2022-08-10 12:25:19.597817','android','Nairobi, Kenya','192.168.100.189'),(34,'4915224043369',1,'2022-08-10 11:48:28.232063','android','Rostock, Germany','192.168.0.87'),(35,'2547722563707',0,'2022-08-10 13:38:03.502349','android','Nairobi, Kenya','192.168.100.189'),(36,'254722563707',1,'2022-08-10 13:38:52.140938','android','Nairobi, Kenya','192.168.100.189'),(37,'254722563707',0,'2022-08-10 14:06:50.243374','android','Nairobi, Kenya','192.168.100.189'),(38,'254722563707',1,'2022-08-10 14:07:21.416653','android','Nairobi, Kenya','192.168.100.189'),(39,'254722563707',1,'2022-08-10 16:11:11.807894','android','Nairobi, Kenya','192.168.100.189'),(40,'254722563707',1,'2022-08-10 16:27:24.042499','android','Nairobi, Kenya','192.168.100.189'),(41,'4915224043369',1,'2022-08-11 09:30:44.025372','android','Rostock, Germany','192.168.0.87'),(42,'254707132162',1,'2022-08-12 15:40:20.137677','android','Nairobi, Kenya','192.168.1.246'),(43,'254707132162',1,'2022-08-15 21:01:22.034788','android','Nairobi, Kenya','null'),(44,'4915224043369',1,'2022-08-19 09:16:51.189966','android','Rostock, Germany','192.168.0.87'),(45,'254707132162',1,'2022-08-19 11:49:42.931477','android','Nairobi, Kenya','192.168.1.225'),(46,'254707132162',1,'2022-08-22 16:57:51.287484','android','Nairobi, Kenya','192.168.1.225'),(47,'2547072162',0,'2022-08-22 22:33:32.743893','android','Nairobi, Kenya','null'),(48,'254707132162',1,'2022-08-22 22:33:58.435245','android','Nairobi, Kenya','null'),(49,'254707132162',1,'2022-08-23 17:20:59.465396','android','Nairobi, Kenya','192.168.1.225'),(50,'254722563707',1,'2022-08-24 16:45:25.834964','android','Nairobi, Kenya','192.168.100.100'),(51,'254722563707',1,'2022-08-30 17:37:17.412250','android','Nairobi, Kenya','192.168.100.201'),(52,'254707132162',1,'2022-08-31 11:32:30.335408','android','Nairobi, Kenya','192.168.1.210'),(53,'254707132162',1,'2022-08-31 12:50:26.866373','android','Nairobi, Kenya','192.168.1.210'),(54,'4915224043369',1,'2022-09-07 15:35:11.813514','android','Rostock, Germany','192.168.0.87'),(55,'4915224043369',1,'2022-09-07 20:50:06.594736','android','Rostock, Germany','null'),(56,'4915224043369',1,'2022-09-13 11:40:03.777693','android','Rostock, Germany','192.168.0.87'),(57,'254707132162',0,'2022-09-14 10:53:06.452280','undefined','undefined','undefined'),(58,'254707132162',0,'2022-09-14 10:53:47.900502','undefined','undefined','undefined'),(59,'254707132162',1,'2022-09-14 11:16:57.430453','android','Nairobi, Kenya','null'),(60,'4915224043369',1,'2022-09-14 15:37:46.603744','android','Rostock, Germany','192.168.0.87'),(61,'254707132162',0,'2022-09-15 13:20:22.749984','android','Nairobi, Kenya','192.168.1.210'),(62,'254707132162',1,'2022-09-15 13:20:59.459341','android','Nairobi, Kenya','192.168.1.210'),(63,'4915224043369',1,'2022-09-15 15:11:09.077093','android','Rostock, Germany','192.168.0.87'),(64,'4915224043369',1,'2022-09-16 19:07:23.516075','android','Rostock, Germany','192.168.0.87'),(65,'4915224043369',1,'2022-09-19 11:28:54.355543','android','Rostock, Germany','192.168.0.87'),(66,'254707132162',1,'2022-09-19 15:31:38.854858','android','Nairobi, Kenya','192.168.1.210'),(67,'4915224043369',1,'2022-09-20 12:47:18.291181','android','Rostock, Germany','192.168.0.87'),(68,'4915224043369',1,'2022-09-20 13:23:09.669459','android','Rostock, Germany','192.168.0.87'),(69,'254707132162',1,'2022-09-20 17:32:53.721527','android','Nairobi, Kenya','192.168.1.210'),(70,'4915224043369',1,'2022-09-21 14:07:42.044841','android','Rostock, Germany','192.168.0.87'),(71,'254707132162',1,'2022-09-23 15:30:45.351178','android','Nairobi, Kenya','192.168.1.210'),(72,'254707132162',1,'2022-09-23 16:34:55.461298','android','Nairobi, Kenya','192.168.1.210'),(73,'254707132162',1,'2022-09-26 16:59:30.351455','android','Nairobi, Kenya','192.168.1.210'),(74,'254707132162',1,'2022-09-27 15:06:24.494516','android','Nairobi, Kenya','192.168.1.210'),(75,'4915224043369',0,'2022-09-27 22:34:31.236218','android','Rostock, Germany','192.168.0.87'),(76,'4915224043369',0,'2022-09-27 22:38:06.313005','android','Rostock, Germany','192.168.0.87'),(77,'4915224043369',1,'2022-09-28 09:48:27.970066','android','Rostock, Germany','null'),(78,'4915224043369',1,'2022-09-28 13:23:53.934274','android','Rostock, Germany','192.168.0.87'),(79,'4915224043369',1,'2022-09-28 15:28:56.989663','android','Rostock, Germany','192.168.0.87'),(80,'4915224043369',1,'2022-09-29 11:29:08.551107','android','Rostock, Germany','null'),(81,'4915224043369',1,'2022-09-29 12:24:15.487926','android','Rostock, Germany','192.168.0.87'),(82,'4915224043369',1,'2022-09-29 15:01:46.791098','android','Rostock, Germany','192.168.0.87'),(83,'4915224043369',0,'2022-10-06 11:49:30.667185','android','Rostock, Germany','192.168.0.87'),(84,'4915224043369',1,'2022-10-06 11:51:45.581159','android','Rostock, Germany','192.168.0.87'),(85,'4915224043369',1,'2022-10-06 11:57:49.513117','android','Rostock, Germany','192.168.0.87'),(86,'4915224043369',1,'2022-10-06 12:52:25.998644','android','Rostock, Germany','192.168.0.87'),(87,'254707132162',1,'2022-10-08 11:00:51.233752','android','Nairobi, Kenya','null'),(88,'4915224043369',1,'2022-10-11 11:09:11.432728','android','Rostock, Germany','192.168.0.87'),(89,'254707132162',1,'2022-10-11 14:53:43.505777','android','Nairobi, Kenya','192.168.1.203'),(90,'4915224043369',1,'2022-10-11 17:09:50.957847','android','Rostock, Germany','192.168.0.87'),(91,'254707132162',1,'2022-10-11 21:45:05.731069','android','Nairobi, Kenya','null'),(92,'254707132162',1,'2022-10-12 16:22:22.432870','android','Nairobi, Kenya','192.168.1.203'),(93,'254707132162',1,'2022-10-13 11:07:04.398453','android','Nairobi, Kenya','192.168.1.203'),(94,'254707132162',1,'2022-10-13 15:50:13.698933','android','Nairobi, Kenya','192.168.1.203'),(95,'254707132162',1,'2022-10-18 11:58:44.287062','android','Nairobi, Kenya','192.168.1.203');
/*!40000 ALTER TABLE `loginActivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_markets`
--

DROP TABLE IF EXISTS `token_markets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_markets` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `AccountNumber` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NumberOfTokens` decimal(10,4) DEFAULT NULL,
  `PricePerToken` decimal(10,4) DEFAULT NULL,
  `Date` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_markets`
--

LOCK TABLES `token_markets` WRITE;
/*!40000 ALTER TABLE `token_markets` DISABLE KEYS */;
/*!40000 ALTER TABLE `token_markets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_transactions`
--

DROP TABLE IF EXISTS `token_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_transactions` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PhoneNumber` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Date` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CR` decimal(10,4) DEFAULT NULL,
  `DR` decimal(10,4) DEFAULT NULL,
  `Balance` decimal(10,4) DEFAULT NULL,
  `rewards` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_transactions`
--

LOCK TABLES `token_transactions` WRITE;
/*!40000 ALTER TABLE `token_transactions` DISABLE KEYS */;
INSERT INTO `token_transactions` VALUES (1,'4915224043369','2022-10-06 12:51:00',0.0100,0.0000,0.0100,1),(2,'4915224043369','2022-10-11 12:12:00',0.0100,0.0000,0.0200,1),(3,'254707132162','2022-10-11 15:19:00',0.0100,0.0000,0.1000,1),(4,'4915224043369','2022-10-11 18:10:00',0.0100,0.0000,0.0300,1),(5,'4915224043369','2022-10-11 18:11:00',0.0100,0.0000,0.0400,1),(6,'4915224043369','2022-10-11 18:13:00',0.0100,0.0000,0.0500,1);
/*!40000 ALTER TABLE `token_transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_freknur_token` AFTER INSERT ON `token_transactions` FOR EACH ROW BEGIN
	IF((NEW.CR IS NOT NULL || NEW.CR <> '0.00') && NEW.DR = '0.00') THEN
		SET @ACTIVITY = CONCAT('FREKNUR TOKEN WORTH:',' ',NEW.CR, ' HAS BEEN BOUGHT.');
	END IF;
	IF((NEW.DR IS NOT NULL || NEW.DR <> '0.00') && NEW.CR = '0.00') THEN
		SET @ACTIVITY = CONCAT('FREKNUR TOKEN WORTH:',' ',NEW.DR, ' HAS BEEN SOLD.');
	END IF;
	
	
	
	INSERT INTO `db_freknur_general`.`tbl_activity_log`(`msisdn`,`activity`) VALUES (NEW.PhoneNumber,@ACTIVITY);
	
	
	
	SET @ACTIVITY = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Account` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Balance` decimal(10,4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Account` (`Account`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
INSERT INTO `tokens` VALUES (1,'254722563707',4.0500),(3,'254707132162',0.1000),(5,'4915224043369',0.0500);
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `transactionID` int NOT NULL AUTO_INCREMENT,
  `referenceNo` varchar(50) NOT NULL,
  `phoneNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `processingCode` int NOT NULL,
  `transactionAmount` float NOT NULL,
  `dateCreated` datetime NOT NULL,
  `responseCode` int DEFAULT NULL,
  `responseMessage` varchar(100) DEFAULT NULL,
  `currencyCode` char(3) NOT NULL DEFAULT 'KES',
  `transactionIdentifier` varchar(500) NOT NULL,
  `debitAccount` varchar(25) DEFAULT NULL,
  `creditAccount` varchar(25) DEFAULT NULL,
  `reversed` bit(1) NOT NULL DEFAULT b'0',
  `processed` bit(1) NOT NULL DEFAULT b'0',
  `successful` bit(1) NOT NULL DEFAULT b'0',
  `txid` char(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`transactionID`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,'166504977139898812','4915224043369',101,0,'2022-10-06 11:49:31',NULL,NULL,'$','A FREKNUR USER HAS LOGGED IN',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(2,'166504987207220830','4915224043369',108,0,'2022-10-06 11:51:11',NULL,NULL,'$','EMAIL VERIFICATION PROCESS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(3,'16650498887569818','4915224043369',108,0,'2022-10-06 11:51:28',NULL,NULL,'$','EMAIL VERIFICATION PROCESS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(4,'166504989216966122','4915224043369',100,0,'2022-10-06 11:51:32',NULL,NULL,'$','NEW USER HAS JOINED FREKNUR',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(5,'166504990624489763','4915224043369',101,0,'2022-10-06 11:51:46',NULL,NULL,'$','A FREKNUR USER HAS LOGGED IN',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(6,'166504990719965208','4915224043369',114,0,'2022-10-06 11:51:46',NULL,NULL,'$','STORE REGISTRATION TOKEN FOR PUSH NOTIFICATIONS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(7,'166504990749033997','4915224043369',110,0,'2022-10-06 11:51:47',NULL,NULL,'$','USER\'S FREKNUR BASIC INQUIRIES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(8,'166504996867996319','4915224043369',205,0,'2022-10-06 11:52:48',NULL,NULL,'$','LOAN INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(9,'166504997294068405','4915224043369',201,0,'2022-10-06 11:52:52',NULL,NULL,'$','GET USER\'S DEVICE AND SIM INFORMATION',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(10,'166504997395280353','4915224043369',202,0,'2022-10-06 11:52:53',NULL,NULL,'$','GET LOAN SETTINGS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(11,'16650499987147810','4915224043369',203,2500,'2022-10-06 11:53:09',NULL,NULL,'$','LOAN REQUEST',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(12,'166505002305128273','4915224043369',110,0,'2022-10-06 11:53:42',NULL,NULL,'$','USER\'S FREKNUR BASIC INQUIRIES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(13,'166505025234116403','4915224043369',503,0,'2022-10-06 11:57:31',NULL,NULL,'$','TOKEN INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(14,'16650502572883684','4915224043369',110,0,'2022-10-06 11:57:37',NULL,NULL,'$','USER\'S FREKNUR BASIC INQUIRIES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(15,'16650502701851352','4915224043369',101,0,'2022-10-06 11:57:50',NULL,NULL,'$','A FREKNUR USER HAS LOGGED IN',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(16,'166505027117848266','4915224043369',110,0,'2022-10-06 11:57:50',NULL,NULL,'$','USER\'S FREKNUR BASIC INQUIRIES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(17,'166505029143361631','4915224043369',112,0,'2022-10-06 11:58:10',NULL,NULL,'$','SHARES INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(18,'166505354673376208','4915224043369',101,0,'2022-10-06 12:52:26',NULL,NULL,'$','A FREKNUR USER HAS LOGGED IN',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(19,'166505354799928174','4915224043369',110,0,'2022-10-06 12:52:27',NULL,NULL,'$','USER\'S FREKNUR BASIC INQUIRIES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(20,'16650535577217025','4915224043369',111,0,'2022-10-06 12:52:37',NULL,NULL,'$','WALLET INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(21,'166521605395754030','254707132162',101,0,'2022-10-08 11:00:51',NULL,NULL,'$','A FREKNUR USER HAS LOGGED IN',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(22,'166521605623196861','254707132162',110,0,'2022-10-08 11:00:54',NULL,NULL,'$','USER\'S FREKNUR BASIC INQUIRIES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(23,'16652160626735236','254707132162',503,0,'2022-10-08 11:01:00',NULL,NULL,'$','TOKEN INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(24,'166521606755558627','254707132162',503,0,'2022-10-08 11:01:06',NULL,NULL,'$','TOKEN INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(25,'166521607038714591','254707132162',110,0,'2022-10-08 11:01:09',NULL,NULL,'$','USER\'S FREKNUR BASIC INQUIRIES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(26,'166521607402212304','254707132162',503,0,'2022-10-08 11:01:12',NULL,NULL,'$','TOKEN INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(27,'166521607715724195','254707132162',111,0,'2022-10-08 11:01:15',NULL,NULL,'$','WALLET INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(28,'166521607982344306','254707132162',112,0,'2022-10-08 11:01:18',NULL,NULL,'$','SHARES INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(29,'166521608152064315','254707132162',205,0,'2022-10-08 11:01:19',NULL,NULL,'$','LOAN INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(30,'166521609045127917','254707132162',503,0,'2022-10-08 11:01:29',NULL,NULL,'$','TOKEN INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(31,'16652161020651941','254707132162',505,0,'2022-10-08 11:01:40',NULL,NULL,'$','GET TOKEN MARKETS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(32,'166521610334783844','254707132162',505,0,'2022-10-08 11:01:41',NULL,NULL,'$','GET TOKEN MARKETS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(33,'166521610460416720','254707132162',505,0,'2022-10-08 11:01:42',NULL,NULL,'$','GET TOKEN MARKETS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(34,'166521610588385777','254707132162',505,0,'2022-10-08 11:01:43',NULL,NULL,'$','GET TOKEN MARKETS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(35,'166521611205069745','254707132162',503,0,'2022-10-08 11:01:50',NULL,NULL,'$','TOKEN INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(36,'166521614788687049','254707132162',503,0,'2022-10-08 11:02:26',NULL,NULL,'$','TOKEN INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(37,'166521615710990925','254707132162',113,0,'2022-10-08 11:02:35',NULL,NULL,'$','LOGIN ACTIVITY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(38,'16652161710311474','254707132162',110,0,'2022-10-08 11:02:49',NULL,NULL,'$','USER\'S FREKNUR BASIC INQUIRIES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(39,'166521617470380790','254707132162',111,0,'2022-10-08 11:02:53',NULL,NULL,'$','WALLET INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(40,'16654793520695390','4915224043369',101,0,'2022-10-11 11:09:11',NULL,NULL,'$','A FREKNUR USER HAS LOGGED IN',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(41,'166547935346673391','4915224043369',110,0,'2022-10-11 11:09:13',NULL,NULL,'$','USER\'S FREKNUR BASIC INQUIRIES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(42,'166547936447744988','4915224043369',205,0,'2022-10-11 11:09:24',NULL,NULL,'$','LOAN INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(43,'166547951297432130','4915224043369',112,0,'2022-10-11 11:11:52',NULL,NULL,'$','SHARES INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(44,'166547951990995992','4915224043369',302,0,'2022-10-11 11:12:00',NULL,NULL,'$','GET FEE CHARGES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(45,'166547953501824957','4915224043369',303,191.2,'2022-10-11 11:12:08',NULL,NULL,'$','BUY UNITS ',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(46,'166547954407423931','4915224043369',110,0,'2022-10-11 11:12:24',NULL,NULL,'$','USER\'S FREKNUR BASIC INQUIRIES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(47,'166547955483999726','4915224043369',112,0,'2022-10-11 11:12:34',NULL,NULL,'$','SHARES INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(48,'166547966123282390','4915224043369',302,0,'2022-10-11 11:14:21',NULL,NULL,'$','GET FEE CHARGES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(49,'166547969835919264','4915224043369',112,0,'2022-10-11 11:14:58',NULL,NULL,'$','SHARES INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(50,'166548922468856134','254707132162',101,0,'2022-10-11 14:53:44',NULL,NULL,'$','A FREKNUR USER HAS LOGGED IN',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(51,'166548922697578012','254707132162',110,0,'2022-10-11 14:53:46',NULL,NULL,'$','USER\'S FREKNUR BASIC INQUIRIES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(52,'166548922983137814','254707132162',112,0,'2022-10-11 14:53:48',NULL,NULL,'$','SHARES INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(53,'166548923569153647','254707132162',302,0,'2022-10-11 14:53:55',NULL,NULL,'$','GET FEE CHARGES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(54,'166548924077179528','254707132162',302,0,'2022-10-11 14:54:00',NULL,NULL,'$','GET FEE CHARGES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(55,'16654902116166288','254707132162',302,0,'2022-10-11 15:10:12',NULL,NULL,'$','GET FEE CHARGES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(56,'166549072703789372','254707132162',302,0,'2022-10-11 15:18:46',NULL,NULL,'$','GET FEE CHARGES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(57,'166549075080846304','254707132162',303,19.12,'2022-10-11 15:19:02',NULL,NULL,'$','BUY UNITS ',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(58,'166549075553667994','254707132162',110,0,'2022-10-11 15:19:15',NULL,NULL,'$','USER\'S FREKNUR BASIC INQUIRIES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(59,'166549076207028797','254707132162',112,0,'2022-10-11 15:19:21',NULL,NULL,'$','SHARES INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(60,'166549076964163099','254707132162',205,0,'2022-10-11 15:19:29',NULL,NULL,'$','LOAN INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(61,'166549077637338510','254707132162',112,0,'2022-10-11 15:19:36',NULL,NULL,'$','SHARES INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(62,'166549080903640517','254707132162',110,0,'2022-10-11 15:20:09',NULL,NULL,'$','USER\'S FREKNUR BASIC INQUIRIES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(63,'16654908127102477','254707132162',112,0,'2022-10-11 15:20:12',NULL,NULL,'$','SHARES INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(64,'166549081500938298','254707132162',111,0,'2022-10-11 15:20:14',NULL,NULL,'$','WALLET INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(65,'166549083504486587','254707132162',112,0,'2022-10-11 15:20:35',NULL,NULL,'$','SHARES INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(66,'166549085439799344','254707132162',302,0,'2022-10-11 15:20:54',NULL,NULL,'$','GET FEE CHARGES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(67,'166549088717563013','254707132162',305,0,'2022-10-11 15:21:25',NULL,NULL,'$','SELLER ORDERS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(68,'166549089432664546','254707132162',112,0,'2022-10-11 15:21:34',NULL,NULL,'$','SHARES INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(69,'16654909047156753','254707132162',111,0,'2022-10-11 15:21:44',NULL,NULL,'$','WALLET INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(70,'166549093473533932','254707132162',112,0,'2022-10-11 15:22:14',NULL,NULL,'$','SHARES INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(71,'16654909362654268','254707132162',205,0,'2022-10-11 15:22:16',NULL,NULL,'$','LOAN INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(72,'166549235901971199','254707132162',111,0,'2022-10-11 15:45:58',NULL,NULL,'$','WALLET INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(73,'166549237184214452','254707132162',111,0,'2022-10-11 15:46:11',NULL,NULL,'$','WALLET INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(74,'166549238470048339','254707132162',205,0,'2022-10-11 15:46:24',NULL,NULL,'$','LOAN INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(75,'166549238935926079','254707132162',205,0,'2022-10-11 15:46:28',NULL,NULL,'$','LOAN INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(76,'166549239070251326','254707132162',112,0,'2022-10-11 15:46:30',NULL,NULL,'$','SHARES INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(77,'166549239512821032','254707132162',111,0,'2022-10-11 15:46:34',NULL,NULL,'$','WALLET INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(78,'166549239844493986','254707132162',111,0,'2022-10-11 15:46:36',NULL,NULL,'$','WALLET INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(79,'166549474691757579','254707132162',110,0,'2022-10-11 16:25:46',NULL,NULL,'$','USER\'S FREKNUR BASIC INQUIRIES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(80,'16654947476018174','254707132162',111,0,'2022-10-11 16:25:47',NULL,NULL,'$','WALLET INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(81,'166549544150824517','254707132162',110,0,'2022-10-11 16:37:21',NULL,NULL,'$','USER\'S FREKNUR BASIC INQUIRIES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(82,'166549544697670557','254707132162',110,0,'2022-10-11 16:37:24',NULL,NULL,'$','USER\'S FREKNUR BASIC INQUIRIES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(83,'166549545512435252','254707132162',112,0,'2022-10-11 16:37:34',NULL,NULL,'$','SHARES INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(84,'166549547251521401','254707132162',302,0,'2022-10-11 16:37:52',NULL,NULL,'$','GET FEE CHARGES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(85,'166549561990939059','254707132162',112,0,'2022-10-11 16:40:19',NULL,NULL,'$','SHARES INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(86,'166549563962840658','254707132162',112,0,'2022-10-11 16:40:39',NULL,NULL,'$','SHARES INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(87,'166549564898251817','254707132162',112,0,'2022-10-11 16:40:48',NULL,NULL,'$','SHARES INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(88,'166549565100560355','254707132162',302,0,'2022-10-11 16:40:50',NULL,NULL,'$','GET FEE CHARGES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(89,'166550099142096939','4915224043369',101,0,'2022-10-11 17:09:51',NULL,NULL,'$','A FREKNUR USER HAS LOGGED IN',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(90,'166550099272733356','4915224043369',110,0,'2022-10-11 17:09:52',NULL,NULL,'$','USER\'S FREKNUR BASIC INQUIRIES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(91,'166550100417856629','4915224043369',112,0,'2022-10-11 17:10:03',NULL,NULL,'$','SHARES INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(92,'166550101669173493','4915224043369',302,0,'2022-10-11 17:10:16',NULL,NULL,'$','GET FEE CHARGES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(93,'166550104303457263','4915224043369',303,160,'2022-10-11 17:10:35',NULL,NULL,'$','BUY UNITS ',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(94,'166550110906734756','4915224043369',303,160,'2022-10-11 17:11:40',NULL,NULL,'$','BUY UNITS ',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(95,'166550111737411820','4915224043369',302,0,'2022-10-11 17:11:57',NULL,NULL,'$','GET FEE CHARGES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(96,'166550120146681117','4915224043369',302,0,'2022-10-11 17:13:21',NULL,NULL,'$','GET FEE CHARGES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(97,'166550121350238576','4915224043369',303,100,'2022-10-11 17:13:26',NULL,NULL,'$','BUY UNITS ',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(98,'166550121874832935','4915224043369',110,0,'2022-10-11 17:13:38',NULL,NULL,'$','USER\'S FREKNUR BASIC INQUIRIES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(99,'166550124061853995','4915224043369',112,0,'2022-10-11 17:14:00',NULL,NULL,'$','SHARES INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(100,'166550128710215351','4915224043369',112,0,'2022-10-11 17:14:47',NULL,NULL,'$','SHARES INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(101,'166550130318627028','4915224043369',302,0,'2022-10-11 17:15:03',NULL,NULL,'$','GET FEE CHARGES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(102,'166550132268497491','4915224043369',304,50,'2022-10-11 17:15:16',NULL,NULL,'$','SELL UNITS ',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(103,'16655013279663489','4915224043369',110,0,'2022-10-11 17:15:28',NULL,NULL,'$','USER\'S FREKNUR BASIC INQUIRIES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(104,'166550134419413167','4915224043369',305,0,'2022-10-11 17:15:44',NULL,NULL,'$','SELLER ORDERS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(105,'166550137999736630','4915224043369',112,0,'2022-10-11 17:16:20',NULL,NULL,'$','SHARES INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(106,'166550138518596708','4915224043369',302,0,'2022-10-11 17:16:25',NULL,NULL,'$','GET FEE CHARGES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(107,'16655139071908896','254707132162',101,0,'2022-10-11 21:45:06',NULL,NULL,'$','A FREKNUR USER HAS LOGGED IN',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(108,'166551390930099733','254707132162',110,0,'2022-10-11 21:45:08',NULL,NULL,'$','USER\'S FREKNUR BASIC INQUIRIES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(109,'166558094340954186','254707132162',101,0,'2022-10-12 16:22:22',NULL,NULL,'$','A FREKNUR USER HAS LOGGED IN',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(110,'16655809461845506','254707132162',110,0,'2022-10-12 16:22:25',NULL,NULL,'$','USER\'S FREKNUR BASIC INQUIRIES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(111,'16655809597062423','254707132162',305,0,'2022-10-12 16:22:38',NULL,NULL,'$','SELLER ORDERS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(112,'166558096738284088','254707132162',205,0,'2022-10-12 16:22:46',NULL,NULL,'$','LOAN INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(113,'166558097942081133','254707132162',205,0,'2022-10-12 16:22:58',NULL,NULL,'$','LOAN INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(114,'166558098416454161','254707132162',112,0,'2022-10-12 16:23:01',NULL,NULL,'$','SHARES INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(115,'166558099078688539','254707132162',302,0,'2022-10-12 16:23:11',NULL,NULL,'$','GET FEE CHARGES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(116,'166558104317514861','254707132162',304,500,'2022-10-12 16:23:49',NULL,NULL,'$','SELL UNITS ',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(117,'16655810484564015','254707132162',110,0,'2022-10-12 16:24:08',NULL,NULL,'$','USER\'S FREKNUR BASIC INQUIRIES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(118,'166558105546473564','254707132162',305,0,'2022-10-12 16:24:15',NULL,NULL,'$','SELLER ORDERS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(119,'166558105859097445','254707132162',305,0,'2022-10-12 16:24:18',NULL,NULL,'$','SELLER ORDERS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(120,'166558108159384066','254707132162',307,0,'2022-10-12 16:24:41',NULL,NULL,'$','DELETE SELLER ORDER',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(121,'166558108458685249','254707132162',110,0,'2022-10-12 16:24:44',NULL,NULL,'$','USER\'S FREKNUR BASIC INQUIRIES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(122,'166558108889855174','254707132162',112,0,'2022-10-12 16:24:48',NULL,NULL,'$','SHARES INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(123,'166558109005424982','254707132162',302,0,'2022-10-12 16:24:50',NULL,NULL,'$','GET FEE CHARGES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(124,'166558115291025306','254707132162',304,57,'2022-10-12 16:25:47',NULL,NULL,'$','SELL UNITS ',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(125,'166558117019853817','254707132162',304,57,'2022-10-12 16:25:59',NULL,NULL,'$','SELL UNITS ',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(126,'166558117469515907','254707132162',110,0,'2022-10-12 16:26:14',NULL,NULL,'$','USER\'S FREKNUR BASIC INQUIRIES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(127,'166558118454870774','254707132162',305,0,'2022-10-12 16:26:24',NULL,NULL,'$','SELLER ORDERS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(128,'166558123280487804','254707132162',307,0,'2022-10-12 16:27:13',NULL,NULL,'$','DELETE SELLER ORDER',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(129,'16655812361114201','254707132162',110,0,'2022-10-12 16:27:16',NULL,NULL,'$','USER\'S FREKNUR BASIC INQUIRIES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(130,'166558124212460776','254707132162',112,0,'2022-10-12 16:27:21',NULL,NULL,'$','SHARES INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(131,'16655812423008461','254707132162',302,0,'2022-10-12 16:27:22',NULL,NULL,'$','GET FEE CHARGES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(132,'166558128549735301','254707132162',304,18.75,'2022-10-12 16:27:54',NULL,NULL,'$','SELL UNITS ',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(133,'166558130366078285','254707132162',304,18.75,'2022-10-12 16:28:12',NULL,NULL,'$','SELL UNITS ',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(134,'166558132082438888','254707132162',304,18.75,'2022-10-12 16:28:28',NULL,NULL,'$','SELL UNITS ',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(135,'166558132552093745','254707132162',110,0,'2022-10-12 16:28:45',NULL,NULL,'$','USER\'S FREKNUR BASIC INQUIRIES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(136,'166558133393521427','254707132162',305,0,'2022-10-12 16:28:53',NULL,NULL,'$','SELLER ORDERS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(137,'166558144569750852','254707132162',307,0,'2022-10-12 16:30:45',NULL,NULL,'$','DELETE SELLER ORDER',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(138,'166558151086245468','254707132162',110,0,'2022-10-12 16:31:51',NULL,NULL,'$','USER\'S FREKNUR BASIC INQUIRIES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(139,'166558151297471775','254707132162',112,0,'2022-10-12 16:31:53',NULL,NULL,'$','SHARES INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(140,'166558151421673201','254707132162',302,0,'2022-10-12 16:31:54',NULL,NULL,'$','GET FEE CHARGES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(141,'166558640690188062','254707132162',112,0,'2022-10-12 17:53:26',NULL,NULL,'$','SHARES INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(142,'166558640703675534','254707132162',302,0,'2022-10-12 17:53:27',NULL,NULL,'$','GET FEE CHARGES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(143,'166558643095930144','254707132162',304,18.75,'2022-10-12 17:53:41',NULL,NULL,'$','SELL UNITS ',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(144,'166558644409979090','254707132162',305,0,'2022-10-12 17:54:04',NULL,NULL,'$','SELLER ORDERS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(145,'166558645827131245','254707132162',305,0,'2022-10-12 17:54:19',NULL,NULL,'$','SELLER ORDERS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(146,'166558647434031261','254707132162',307,0,'2022-10-12 17:54:35',NULL,NULL,'$','DELETE SELLER ORDER',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(147,'1665586477143428','254707132162',110,0,'2022-10-12 17:54:37',NULL,NULL,'$','USER\'S FREKNUR BASIC INQUIRIES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(148,'166564843005062476','254707132162',101,0,'2022-10-13 11:07:04',NULL,NULL,'$','A FREKNUR USER HAS LOGGED IN',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(149,'166564843253658704','254707132162',110,0,'2022-10-13 11:07:11',NULL,NULL,'$','USER\'S FREKNUR BASIC INQUIRIES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(150,'166564846169643034','254707132162',305,0,'2022-10-13 11:07:41',NULL,NULL,'$','SELLER ORDERS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(151,'166564846979126022','254707132162',112,0,'2022-10-13 11:07:48',NULL,NULL,'$','SHARES INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(152,'166564847413546243','254707132162',302,0,'2022-10-13 11:07:54',NULL,NULL,'$','GET FEE CHARGES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(153,'166564849568193765','254707132162',304,18.75,'2022-10-13 11:08:05',NULL,NULL,'$','SELL UNITS ',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(154,'166564850030883591','254707132162',110,0,'2022-10-13 11:08:20',NULL,NULL,'$','USER\'S FREKNUR BASIC INQUIRIES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(155,'166564850485089577','254707132162',305,0,'2022-10-13 11:08:25',NULL,NULL,'$','SELLER ORDERS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(156,'166564925425816430','254707132162',305,0,'2022-10-13 11:20:54',NULL,NULL,'$','SELLER ORDERS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(157,'166564926718912241','254707132162',306,25,'2022-10-13 11:21:07',NULL,NULL,'$','MODIFY SELLER ORDER',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(158,'166564927127382695','254707132162',110,0,'2022-10-13 11:21:11',NULL,NULL,'$','USER\'S FREKNUR BASIC INQUIRIES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(159,'166564927508290667','254707132162',305,0,'2022-10-13 11:21:13',NULL,NULL,'$','SELLER ORDERS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(160,'166564930340641156','254707132162',307,0,'2022-10-13 11:21:43',NULL,NULL,'$','DELETE SELLER ORDER',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(161,'166564930607293487','254707132162',110,0,'2022-10-13 11:21:46',NULL,NULL,'$','USER\'S FREKNUR BASIC INQUIRIES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(162,'166565269596084194','254707132162',305,0,'2022-10-13 12:18:16',NULL,NULL,'$','SELLER ORDERS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(163,'166565272692817883','254707132162',305,0,'2022-10-13 12:18:47',NULL,NULL,'$','SELLER ORDERS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(164,'166565303593812299','254707132162',305,0,'2022-10-13 12:23:56',NULL,NULL,'$','SELLER ORDERS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(165,'166565582427657581','254707132162',305,0,'2022-10-13 13:10:24',NULL,NULL,'$','SELLER ORDERS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(166,'166565585312477818','254707132162',305,0,'2022-10-13 13:10:53',NULL,NULL,'$','SELLER ORDERS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(167,'166565587079138647','254707132162',112,0,'2022-10-13 13:11:11',NULL,NULL,'$','SHARES INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(168,'166565590799839385','254707132162',305,0,'2022-10-13 13:11:48',NULL,NULL,'$','SELLER ORDERS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(169,'166565593476720850','254707132162',305,0,'2022-10-13 13:12:15',NULL,NULL,'$','SELLER ORDERS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(170,'166565593697585852','254707132162',305,0,'2022-10-13 13:12:16',NULL,NULL,'$','SELLER ORDERS',NULL,NULL,_binary '\0',_binary '\0',_binary '\0',NULL),(171,'166565599774517322','254707132162',305,0,'2022-10-13 13:13:05',NULL,NULL,'$','SELLER ORDERS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(172,'166565634278894997','254707132162',305,0,'2022-10-13 13:19:02',NULL,NULL,'$','SELLER ORDERS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(173,'166565635523543781','254707132162',305,0,'2022-10-13 13:19:15',NULL,NULL,'$','SELLER ORDERS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(174,'166566541392923183','254707132162',101,0,'2022-10-13 15:50:14',NULL,NULL,'$','A FREKNUR USER HAS LOGGED IN',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(175,'166566541641394171','254707132162',110,0,'2022-10-13 15:50:15',NULL,NULL,'$','USER\'S FREKNUR BASIC INQUIRIES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(176,'166566543521589785','254707132162',305,0,'2022-10-13 15:50:34',NULL,NULL,'$','SELLER ORDERS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(177,'166566544760142848','254707132162',111,0,'2022-10-13 15:50:46',NULL,NULL,'$','WALLET INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(178,'166566586399645149','254707132162',305,0,'2022-10-13 15:57:44',NULL,NULL,'$','SELLER ORDERS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(179,'166566592521166300','254707132162',305,0,'2022-10-13 15:58:45',NULL,NULL,'$','SELLER ORDERS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(180,'166575488113942437','254707132162',111,0,'2022-10-14 16:41:21',NULL,NULL,'$','WALLET INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(181,'16657548946908749','254707132162',111,0,'2022-10-14 16:41:35',NULL,NULL,'$','WALLET INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(182,'166575492388157763','254707132162',111,0,'2022-10-14 16:42:04',NULL,NULL,'$','WALLET INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(183,'166575496244697999','254707132162',112,0,'2022-10-14 16:42:42',NULL,NULL,'$','SHARES INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(184,'166575498561343926','254707132162',302,0,'2022-10-14 16:43:05',NULL,NULL,'$','GET FEE CHARGES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(185,'16657550027459846','254707132162',112,0,'2022-10-14 16:43:23',NULL,NULL,'$','SHARES INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(186,'166575500606539109','254707132162',205,0,'2022-10-14 16:43:25',NULL,NULL,'$','LOAN INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(187,'166575501882576111','254707132162',202,0,'2022-10-14 16:43:39',NULL,NULL,'$','GET LOAN SETTINGS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(188,'166575506395614029','254707132162',305,0,'2022-10-14 16:44:24',NULL,NULL,'$','SELLER ORDERS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(189,'166575509497688719','254707132162',113,0,'2022-10-14 16:44:53',NULL,NULL,'$','LOGIN ACTIVITY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(190,'166575511967464931','254707132162',503,0,'2022-10-14 16:45:18',NULL,NULL,'$','TOKEN INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(191,'166575513698277649','254707132162',505,0,'2022-10-14 16:45:36',NULL,NULL,'$','GET TOKEN MARKETS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(192,'166575514073673027','254707132162',505,0,'2022-10-14 16:45:39',NULL,NULL,'$','GET TOKEN MARKETS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(193,'166575514837413088','254707132162',503,0,'2022-10-14 16:45:47',NULL,NULL,'$','TOKEN INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(194,'166575526583988008','254707132162',505,0,'2022-10-14 16:47:46',NULL,NULL,'$','GET TOKEN MARKETS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(195,'166575527371742069','254707132162',505,0,'2022-10-14 16:47:54',NULL,NULL,'$','GET TOKEN MARKETS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(196,'166575528303719185','254707132162',500,0,'2022-10-14 16:48:03',NULL,NULL,'$','GENERATE TOKEN STATEMENT',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(197,'166575529518555915','254707132162',110,0,'2022-10-14 16:48:15',NULL,NULL,'$','USER\'S FREKNUR BASIC INQUIRIES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(198,'166575529742635834','254707132162',503,0,'2022-10-14 16:48:17',NULL,NULL,'$','TOKEN INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(199,'166608352543987496','254707132162',101,0,'2022-10-18 11:58:44',NULL,NULL,'$','A FREKNUR USER HAS LOGGED IN',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(200,'166608352765778781','254707132162',110,0,'2022-10-18 11:58:46',NULL,NULL,'$','USER\'S FREKNUR BASIC INQUIRIES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(201,'166608354438225059','254707132162',111,0,'2022-10-18 11:58:59',NULL,NULL,'$','WALLET INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(202,'166608355064719086','254707132162',112,0,'2022-10-18 11:59:09',NULL,NULL,'$','SHARES INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(203,'166608355674336506','254707132162',302,0,'2022-10-18 11:59:16',NULL,NULL,'$','GET FEE CHARGES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(204,'166608359827972155','254707132162',304,800,'2022-10-18 11:59:45',NULL,NULL,'$','SELL UNITS ',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(205,'166608360411111623','254707132162',110,0,'2022-10-18 12:00:03',NULL,NULL,'$','USER\'S FREKNUR BASIC INQUIRIES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(206,'166608360992380164','254707132162',305,0,'2022-10-18 12:00:08',NULL,NULL,'$','SELLER ORDERS',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(207,'166608362056334859','254707132162',307,0,'2022-10-18 12:00:19',NULL,NULL,'$','DELETE SELLER ORDER',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(208,'166608362349737252','254707132162',110,0,'2022-10-18 12:00:22',NULL,NULL,'$','USER\'S FREKNUR BASIC INQUIRIES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(209,'166608362888170502','254707132162',110,0,'2022-10-18 12:00:26',NULL,NULL,'$','USER\'S FREKNUR BASIC INQUIRIES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(210,'166608363160160171','254707132162',111,0,'2022-10-18 12:00:30',NULL,NULL,'$','WALLET INQUIRIES ONLY',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(211,'166609723857077073','254707132162',110,0,'2022-10-18 15:47:16',NULL,NULL,'$','USER\'S FREKNUR BASIC INQUIRIES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL),(212,'166609724399393576','254707132162',110,0,'2022-10-18 15:47:17',NULL,NULL,'$','USER\'S FREKNUR BASIC INQUIRIES',NULL,NULL,_binary '\0',_binary '',_binary '',NULL);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userID` int NOT NULL AUTO_INCREMENT,
  `firstName` text NOT NULL,
  `lastName` text NOT NULL,
  `homeAddress` varchar(100) NOT NULL,
  `country` varchar(250) NOT NULL,
  `countryCode` varchar(10) NOT NULL,
  `dialCode` varchar(10) NOT NULL,
  `birthDate` varchar(10) NOT NULL,
  `phoneNumber` varchar(25) NOT NULL,
  `emailAddress` varchar(50) NOT NULL,
  `password` varchar(600) NOT NULL,
  `emailVerified` int NOT NULL DEFAULT '0',
  `trials` int NOT NULL DEFAULT '0',
  `oneTimePin` int DEFAULT NULL,
  `active` int NOT NULL DEFAULT '1',
  `firstTimeLogin` int NOT NULL DEFAULT '1',
  `profileLevelID` int NOT NULL DEFAULT '1',
  `nationalID` varchar(8) DEFAULT NULL,
  `loanStatus` int NOT NULL DEFAULT '1',
  `resetPasswordToken` varchar(250) DEFAULT NULL,
  `resetPasswordExpires` varchar(250) DEFAULT NULL,
  `worldCitizenID` varchar(255) DEFAULT NULL,
  `registrationToken` varchar(255) DEFAULT NULL,
  `imei` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `phoneNumber` (`phoneNumber`),
  UNIQUE KEY `emailAddress` (`emailAddress`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COMMENT='Holds the users of the wallet';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Jessica ','Pearson ','Nairobi ','Kenya','KE','+254','25-07-1993','254722563707','joy.naitore@inmobia.com','7c5d4a5367ff63d7642c1244ad36d59fe14c1d55485f274d4e9515d1cbb8fb4b0f616ac545eeb55f18cf9aa7675adb625dc8adbb5e048d433df4c665e677720d',0,0,NULL,1,1,1,NULL,1,NULL,NULL,'1920005525','djCd3yOOTj62uac1a5T6OS:APA91bE64kWxWeGMgWQ9vbR8ShSJ7LxEbgdeHDwVK85lflLVNHyEVP-B9soL7go_afaY0aulhuBFb6jv8rlpVXw2LCIYFDBmjG1ptWpm_MJ63BZY5Jg91sOtN-CXxC4B1IUrxfEXyLLJ','87d2862acc9f529a'),(3,'doe','joe','Nairobi ','Kenya','KE','+254','02-08-2004','254707132162','alex.irungu@inmobia.com','4188b0993f30dffad307a76c033948cee116b343d9904789124823dcea0b260bdb67e776663ef05aea3e3c64d18b58318869e6dfd5dd4d7561e0c87c3ab83a5c',0,0,NULL,1,0,1,NULL,1,NULL,NULL,'4315178998','fxrsEdkeR-ah3PaSTP4QUn:APA91bH9oi2BSlSS_rhs15P5nzs1tNuerubu5dcwWlcHbqmUZ4IgWgzkH2HxtJ_dAejgZygZ5gJ_PZDfGPybmJ_M6Dj8T7rLCHmJvBlDgzelFtEJ8UZn9lE1uDBWuAyWSmKb_urA302O','eb59385f7b75d96e'),(5,'Tops','kragelund','sausage ville, rockstock','Deutschland','DE','+49','06-10-2017','4915224043369','tkp@inmobia.com','0fa0d81bce9e28873f5bac8aa91885fc2e4ab5b86054598964bcb8ef080426c5b4abadb6cd815e727a8e2adce056350fc902ba0ec268ba3fd0fb3d7ac593b6de',0,0,NULL,1,0,1,NULL,1,NULL,NULL,'2217250246','fCjLa8aIROaE3MHV2gsN_B:APA91bH9A3fO59tJlyNE8_yOCGuj4pdT6uZizeyNIRmJPKOvMvT22V_EDlwFmnJM1KZQ8BgVHPhcrDZi4E87x_ZZRIfuz48pbZkWaGeYQueIZ-hQc2Bae08oSB8QH4ZiwtgkXEN1iVpa','6e10d4417fd1ad3a');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verification`
--

DROP TABLE IF EXISTS `verification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `verification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cred` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `code` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cred` (`cred`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verification`
--

LOCK TABLES `verification` WRITE;
/*!40000 ALTER TABLE `verification` DISABLE KEYS */;
/*!40000 ALTER TABLE `verification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `mpesa_recon`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mpesa_recon` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `mpesa_recon`;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `mpesaboc`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mpesaboc` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `mpesaboc`;

--
-- Table structure for table `auth_assignment`
--

DROP TABLE IF EXISTS `auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `idx-auth_assignment-user_id` (`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_assignment`
--

LOCK TABLES `auth_assignment` WRITE;
/*!40000 ALTER TABLE `auth_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item`
--

DROP TABLE IF EXISTS `auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item`
--

LOCK TABLES `auth_item` WRITE;
/*!40000 ALTER TABLE `auth_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item_child`
--

DROP TABLE IF EXISTS `auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item_child`
--

LOCK TABLES `auth_item_child` WRITE;
/*!40000 ALTER TABLE `auth_item_child` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_rule`
--

DROP TABLE IF EXISTS `auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_rule`
--

LOCK TABLES `auth_rule` WRITE;
/*!40000 ALTER TABLE `auth_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES ('m000000_000000_base',1568641757),('m140209_132017_init',1568641766),('m140403_174025_create_account_table',1568641767),('m140504_113157_update_tables',1568641769),('m140504_130429_create_token_table',1568641769),('m140506_102106_rbac_init',1568644252),('m140830_171933_fix_ip_field',1568641770),('m140830_172703_change_account_table_name',1568641770),('m141222_110026_update_ip_field',1568641771),('m141222_135246_alter_username_length',1568641771),('m150614_103145_update_social_account_table',1568641772),('m150623_212711_fix_username_notnull',1568641772),('m151218_234654_add_timezone_to_profile',1568641773),('m160929_103127_add_last_login_at_to_user_table',1568641773),('m170907_052038_rbac_add_index_on_auth_assignment_user_id',1568644252),('m180523_151638_rbac_updates_indexes_without_prefix',1568644253);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile` (
  `user_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci,
  `timezone` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recons`
--

DROP TABLE IF EXISTS `recons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `receipt_no` varchar(45) NOT NULL,
  `completion_time` timestamp NULL DEFAULT NULL,
  `initiation_time` timestamp NULL DEFAULT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `transaction_status` varchar(30) DEFAULT NULL,
  `paid_in` decimal(13,2) DEFAULT NULL,
  `withdrawn` decimal(13,2) DEFAULT NULL,
  `balance` decimal(13,2) DEFAULT NULL,
  `balance_confirmed` varchar(10) DEFAULT NULL,
  `reason_type` varchar(100) DEFAULT NULL,
  `other_party_info` varchar(100) DEFAULT NULL,
  `linked_trx_id` varchar(100) DEFAULT NULL,
  `account_no` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recons`
--

LOCK TABLES `recons` WRITE;
/*!40000 ALTER TABLE `recons` DISABLE KEYS */;
INSERT INTO `recons` VALUES (1,'MDQ12IQ1QD','2018-04-26 13:06:00','2018-04-26 13:06:00','Pay Bill from 254700440798 - JEFERSÖN MKAMBURI Acc. 0700440798','Completed',50.00,NULL,853938.00,'TRUE','Pay Utility','254700440798 - JEFERSÖN MKAMBURI','',700440798),(2,'MDQ12IQ1QD','2018-04-26 13:06:00','2018-04-26 13:06:00','Pay Bill from 254700440798 - JEFERSÖN MKAMBURI Acc. 0700440798','Completed',50.00,NULL,853938.00,'TRUE','Pay Utility','254700440798 - JEFERSÖN MKAMBURI','',700440798);
/*!40000 ALTER TABLE `recons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_account`
--

DROP TABLE IF EXISTS `social_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_unique` (`provider`,`client_id`),
  UNIQUE KEY `account_unique_code` (`code`),
  KEY `fk_user_account` (`user_id`),
  CONSTRAINT `fk_user_account` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_account`
--

LOCK TABLES `social_account` WRITE;
/*!40000 ALTER TABLE `social_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token` (
  `user_id` int NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int NOT NULL,
  `type` smallint NOT NULL,
  UNIQUE KEY `token_unique` (`user_id`,`code`,`type`),
  CONSTRAINT `fk_user_token` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (2,'U03NObfXOghfaIBUTjrYSHqf_ifEv9lN',1568705315,0);
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `confirmed_at` int DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blocked_at` int DEFAULT NULL,
  `registration_ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int NOT NULL,
  `updated_at` int NOT NULL,
  `flags` int NOT NULL DEFAULT '0',
  `last_login_at` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_unique_username` (`username`),
  UNIQUE KEY `user_unique_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'kabachia','kabachia@gmail.com','$2y$10$JYwjNqKQfBr85BHEwWLrpu4E0yRvSgqzUyVdiWnqfrChR1bxtLiFa','gypXNoT5PYXEFQvMlIuoavjOvK9rvDqZ',1568643236,NULL,NULL,'10.156.0.7',1568641813,1568641813,0,1568705764),(2,'james','kabachia+james@gmail.com','$2y$10$rJf2hqTnnhbOGcehj7HHcOTqaBmBaQyHjsqXNnSXzxO8JLc79vDAW','XJfJw7u1qt6DcSHrBGOVnwVK1ko-bnvh',NULL,NULL,NULL,'10.156.0.7',1568705314,1568705314,0,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `sportsbrain`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `sportsbrain` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `sportsbrain`;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `short_name` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'England','uk'),(2,'Germany','de'),(3,'France','fr'),(4,'Spain','es');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leagues`
--

DROP TABLE IF EXISTS `leagues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leagues` (
  `league_id` int unsigned NOT NULL AUTO_INCREMENT,
  `country` int NOT NULL,
  `tournament` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`league_id`),
  UNIQUE KEY `unq_league` (`country`,`tournament`),
  CONSTRAINT `leagues_ibfk_1` FOREIGN KEY (`country`) REFERENCES `countries` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='holds the league names';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leagues`
--

LOCK TABLES `leagues` WRITE;
/*!40000 ALTER TABLE `leagues` DISABLE KEYS */;
INSERT INTO `leagues` VALUES (2,1,'Championship'),(1,1,'Premier League'),(3,2,'Bundesliga 1'),(4,2,'Bundesliga 2');
/*!40000 ALTER TABLE `leagues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `predictions`
--

DROP TABLE IF EXISTS `predictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `predictions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `league_id` int unsigned DEFAULT NULL,
  `home_team` varchar(100) DEFAULT NULL,
  `away_team` varchar(100) DEFAULT NULL,
  `match_date` varchar(100) DEFAULT NULL,
  `current_status` varchar(10) DEFAULT NULL,
  `home_team_score` int DEFAULT NULL,
  `away_team_score` int DEFAULT NULL,
  `prediction_home_team` int DEFAULT NULL,
  `prediction_draw` int DEFAULT NULL,
  `prediction_away_team` int DEFAULT NULL,
  `crawled_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `league_id` (`league_id`),
  CONSTRAINT `predictions_ibfk_1` FOREIGN KEY (`league_id`) REFERENCES `leagues` (`league_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Holds current match predictions - The table will be rebuilt and repopulated periodically from the crawler ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `predictions`
--

LOCK TABLES `predictions` WRITE;
/*!40000 ALTER TABLE `predictions` DISABLE KEYS */;
INSERT INTO `predictions` VALUES (1,1,'Crystal Palace','Brighton & Hove Albion','09/03/19 12:30','FT',1,2,53,24,22,'2019-03-27 11:32:34'),(2,1,'Huddersfield Town','AFC Bournemouth','09/03/19 15:00','FT',0,2,31,27,41,'2019-03-27 11:32:34'),(3,1,'Leicester City','Fulham FC','09/03/19 15:00','FT',3,1,72,17,10,'2019-03-27 11:32:34'),(4,1,'Cardiff City','West Ham United','09/03/19 15:00','FT',2,0,29,27,43,'2019-03-27 11:32:34'),(5,1,'Newcastle','Everton FC','09/03/19 15:00','FT',3,2,30,26,42,'2019-03-27 11:32:34'),(6,1,'Southampton FC','Tottenham Hotspur','09/03/19 15:00','FT',2,1,22,25,51,'2019-03-27 11:32:34'),(7,1,'Manchester City','Watford FC','09/03/19 17:30','FT',3,1,83,11,4,'2019-03-27 11:32:34'),(8,1,'Liverpool FC','Burnley FC','10/03/19 12:00','FT',4,2,84,11,4,'2019-03-27 11:32:35'),(9,1,'Chelsea FC','Wolverhampton Wanderers','10/03/19 14:05','FT',1,1,60,22,17,'2019-03-27 11:32:35'),(10,1,'Arsenal FC','Manchester United','10/03/19 16:30','FT',2,0,34,26,39,'2019-03-27 11:32:35'),(11,1,'Wolverhampton Wanderers','Arsenal FC','16/03/19 00:00','PP',NULL,NULL,40,26,32,'2019-03-27 11:32:35'),(12,1,'Brighton & Hove Albion','Cardiff City','16/03/19 00:00','PP',NULL,NULL,54,23,21,'2019-03-27 11:32:35'),(13,1,'Watford FC','Southampton FC','16/03/19 00:00','PP',NULL,NULL,50,24,24,'2019-03-27 11:32:35'),(14,1,'West Ham United','Huddersfield Town','16/03/19 15:00',NULL,NULL,NULL,53,23,23,'2019-03-27 11:32:35'),(15,1,'Burnley FC','Leicester City','16/03/19 15:00',NULL,NULL,NULL,22,24,52,'2019-03-27 11:32:35'),(16,1,'AFC Bournemouth','Newcastle','16/03/19 15:00',NULL,NULL,NULL,48,24,26,'2019-03-27 11:32:35'),(17,1,'Tottenham Hotspur','Crystal Palace','17/03/19 00:00','PP',NULL,NULL,61,21,17,'2019-03-27 11:32:35'),(18,1,'Fulham FC','Liverpool FC','17/03/19 14:15',NULL,NULL,NULL,8,16,74,'2019-03-27 11:32:35'),(19,1,'Everton FC','Chelsea FC','17/03/19 16:30',NULL,NULL,NULL,23,25,51,'2019-03-27 11:32:36'),(20,2,'Aston Villa','Millwall FC','19/04/19 18:45','FT',2,2,62,22,14,'2019-04-26 13:43:56'),(21,2,'Blackburn Rovers','Bolton Wanderers','22/04/19 12:00','FT',1,0,72,18,9,'2019-04-26 13:43:56'),(22,2,'Derby County','Queens Park Rangers','22/04/19 14:00','FT',2,0,57,25,16,'2019-04-26 13:43:56'),(23,2,'Reading FC','West Bromwich Albion','22/04/19 14:00','FT',2,0,26,30,42,'2019-04-26 13:43:56'),(24,2,'Hull City','Sheffield United','22/04/19 14:00','FT',0,0,24,29,45,'2019-04-26 13:43:56'),(25,2,'Ipswich Town','Swansea City','22/04/19 14:00','FT',0,3,20,28,51,'2019-04-26 13:43:56'),(26,2,'Nottingham Forest','Middlesbrough FC','22/04/19 14:00','FT',0,1,28,30,41,'2019-04-26 13:43:56'),(27,2,'Rotherham','Birmingham City','22/04/19 14:00','FT',3,0,34,30,35,'2019-04-26 13:43:57'),(28,2,'Sheffield Wednesday','Bristol City','22/04/19 14:00','FT',1,3,38,30,30,'2019-04-26 13:43:57'),(29,2,'Stoke City','Norwich City','22/04/19 14:00','FT',2,0,22,29,47,'2019-04-26 13:43:57'),(30,2,'Wigan Athletic','Preston North End','22/04/19 14:00','FT',2,2,30,30,38,'2019-04-26 13:43:57'),(31,2,'Brentford FC','Leeds','22/04/19 14:00','FT',2,0,25,29,44,'2019-04-26 13:43:57'),(32,2,'Millwall FC','Stoke City','22/04/19 16:15','FT',2,0,46,29,24,'2019-04-26 13:43:57'),(33,2,'Birmingham City','Wigan Athletic','27/04/19 12:30',NULL,NULL,NULL,59,24,15,'2019-04-26 13:43:57'),(34,2,'Bolton Wanderers','Brentford FC','27/04/19 14:00',NULL,NULL,NULL,16,26,57,'2019-04-26 13:43:57'),(35,2,'Bristol City','Derby County','27/04/19 14:00',NULL,NULL,NULL,40,29,29,'2019-04-26 13:43:57'),(36,2,'Middlesbrough FC','Reading FC','27/04/19 14:00',NULL,NULL,NULL,60,24,14,'2019-04-26 13:43:57'),(37,2,'Preston North End','Sheffield Wednesday','27/04/19 14:00',NULL,NULL,NULL,40,29,29,'2019-04-26 13:43:57'),(38,2,'Queens Park Rangers','Nottingham Forest','27/04/19 14:00',NULL,NULL,NULL,42,29,28,'2019-04-26 13:43:57'),(39,2,'Swansea City','Hull City','27/04/19 14:00',NULL,NULL,NULL,60,23,15,'2019-04-26 13:43:58'),(40,2,'West Bromwich Albion','Rotherham','27/04/19 14:00',NULL,NULL,NULL,63,22,14,'2019-04-26 13:43:58'),(41,2,'Sheffield United','Ipswich Town','27/04/19 14:00',NULL,NULL,NULL,79,14,6,'2019-04-26 13:43:58'),(42,2,'Norwich City','Blackburn Rovers','27/04/19 16:15',NULL,NULL,NULL,55,25,18,'2019-04-26 13:43:58'),(43,2,'Leeds','Aston Villa','27/04/19 18:30',NULL,NULL,NULL,54,26,19,'2019-04-26 13:43:58'),(44,3,'FC Augsburg','VfB Stuttgart','20/04/19 13:30','FT',6,0,58,22,18,'2019-04-26 13:45:57'),(45,3,'Bayern München','Werder Bremen','20/04/19 13:30','FT',1,0,72,17,10,'2019-04-26 13:45:57'),(46,3,'1. FSV Mainz 05','Fortuna Düsseldorf','20/04/19 13:30','FT',3,1,33,26,40,'2019-04-26 13:45:57'),(47,3,'Bayer Leverkusen','1. FC Nürnberg','20/04/19 13:30','FT',2,0,73,16,9,'2019-04-26 13:45:57'),(48,3,'Bor. Mönchengladbach','RB Leipzig','20/04/19 16:30','FT',1,2,31,28,40,'2019-04-26 13:45:57'),(49,3,'FC Schalke 04','1899 Hoffenheim','20/04/19 18:30','FT',2,5,11,18,69,'2019-04-26 13:45:57'),(50,3,'SC Freiburg','Borussia Dortmund','21/04/19 13:30','FT',0,4,24,24,50,'2019-04-26 13:45:58'),(51,3,'Hertha BSC','Hannover 96','21/04/19 16:00','FT',0,0,77,14,7,'2019-04-26 13:45:58'),(52,3,'VfL Wolfsburg','Eintracht Frankfurt','22/04/19 18:30','FT',1,1,35,25,38,'2019-04-26 13:45:58'),(53,3,'FC Augsburg','Bayer Leverkusen','26/04/19 18:30',NULL,NULL,NULL,21,22,55,'2019-04-26 13:45:58'),(54,3,'Borussia Dortmund','FC Schalke 04','27/04/19 13:30',NULL,NULL,NULL,76,15,8,'2019-04-26 13:45:58'),(55,3,'Eintracht Frankfurt','Hertha BSC','27/04/19 13:30',NULL,NULL,NULL,58,22,18,'2019-04-26 13:45:58'),(56,3,'Fortuna Düsseldorf','Werder Bremen','27/04/19 13:30',NULL,NULL,NULL,26,24,49,'2019-04-26 13:45:58'),(57,3,'RB Leipzig','SC Freiburg','27/04/19 13:30',NULL,NULL,NULL,76,15,8,'2019-04-26 13:45:58'),(58,3,'Hannover 96','1. FSV Mainz 05','27/04/19 13:30',NULL,NULL,NULL,21,22,55,'2019-04-26 13:45:58'),(59,3,'VfB Stuttgart','Bor. Mönchengladbach','27/04/19 16:30',NULL,NULL,NULL,18,21,60,'2019-04-26 13:45:58'),(60,3,'1899 Hoffenheim','VfL Wolfsburg','28/04/19 13:30',NULL,NULL,NULL,61,21,17,'2019-04-26 13:45:58'),(61,3,'1. FC Nürnberg','Bayern München','28/04/19 16:00',NULL,NULL,NULL,7,14,78,'2019-04-26 13:45:59'),(62,4,'Greuther Furth','1. FC Union Berlin','20/04/19 11:00','FT',1,1,22,31,46,'2019-04-26 13:46:42'),(63,4,'MSV Duisburg','SV Sandhausen','20/04/19 11:00','FT',2,2,30,30,38,'2019-04-26 13:46:42'),(64,4,'Hamburger SV','Erzgebirge Aue','20/04/19 11:00','FT',1,1,60,23,15,'2019-04-26 13:46:42'),(65,4,'Holstein Kiel','SC Paderborn 07','20/04/19 11:00','FT',1,2,44,28,26,'2019-04-26 13:46:42'),(66,4,'Dynamo Dresden','1. FC Köln','21/04/19 11:30','FT',3,0,17,29,52,'2019-04-26 13:46:42'),(67,4,'SV Darmstadt 98','VfL Bochum','21/04/19 11:30','FT',0,0,41,29,29,'2019-04-26 13:46:42'),(68,4,'Arminia Bielefeld','FC Ingolstadt 04','21/04/19 11:30','FT',1,3,52,25,21,'2019-04-26 13:46:42'),(69,4,'1. FC Heidenheim 1846','FC St. Pauli','21/04/19 11:30','FT',3,0,50,27,22,'2019-04-26 13:46:42'),(70,4,'Jahn Regensburg','1. FC Magdeburg','21/04/19 11:30','FT',1,0,49,27,22,'2019-04-26 13:46:42'),(71,4,'1. FC Köln','SV Darmstadt 98','26/04/19 16:30',NULL,NULL,NULL,64,20,14,'2019-04-26 13:46:43'),(72,4,'FC Ingolstadt 04','Dynamo Dresden','26/04/19 16:30',NULL,NULL,NULL,43,28,28,'2019-04-26 13:46:43'),(73,4,'SV Sandhausen','Holstein Kiel','27/04/19 11:00',NULL,NULL,NULL,26,30,43,'2019-04-26 13:46:43'),(74,4,'FC St. Pauli','Jahn Regensburg','27/04/19 11:00',NULL,NULL,NULL,36,30,33,'2019-04-26 13:46:43'),(75,4,'1. FC Magdeburg','Greuther Furth','27/04/19 11:00',NULL,NULL,NULL,34,34,31,'2019-04-26 13:46:43'),(76,4,'1. FC Union Berlin','Hamburger SV','28/04/19 11:30',NULL,NULL,NULL,41,30,28,'2019-04-26 13:46:43'),(77,4,'Erzgebirge Aue','VfL Bochum','28/04/19 11:30',NULL,NULL,NULL,33,32,34,'2019-04-26 13:46:43'),(78,4,'SC Paderborn 07','1. FC Heidenheim 1846','28/04/19 11:30',NULL,NULL,NULL,36,29,33,'2019-04-26 13:46:43'),(79,4,'MSV Duisburg','Arminia Bielefeld','29/04/19 18:30',NULL,NULL,NULL,25,28,45,'2019-04-26 13:46:43');
/*!40000 ALTER TABLE `predictions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `testrepl`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `testrepl` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `testrepl`;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!50606 SET GLOBAL INNODB_STATS_AUTO_RECALC=@OLD_INNODB_STATS_AUTO_RECALC */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-25 10:44:29