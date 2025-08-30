/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.13-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 172.17.0.1    Database: n8n
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE IF NOT EXISTS `n8n` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS 'n8n'@'%' IDENTIFIED BY 'n8n123';
GRANT ALL PRIVILEGES ON `n8n`.* TO 'n8n'@'%';
FLUSH PRIVILEGES;

use n8n;
--
-- Table structure for table `annotation_tag_entity`
--

DROP TABLE IF EXISTS `annotation_tag_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `annotation_tag_entity` (
  `id` varchar(16) NOT NULL,
  `name` varchar(24) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_ae51b54c4bb430cf92f48b623f` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `annotation_tag_entity`
--

LOCK TABLES `annotation_tag_entity` WRITE;
/*!40000 ALTER TABLE `annotation_tag_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `annotation_tag_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_identity`
--

DROP TABLE IF EXISTS `auth_identity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_identity` (
  `userId` varchar(36) DEFAULT NULL,
  `providerId` varchar(64) NOT NULL,
  `providerType` varchar(32) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`providerId`,`providerType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_identity`
--

LOCK TABLES `auth_identity` WRITE;
/*!40000 ALTER TABLE `auth_identity` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_identity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_provider_sync_history`
--

DROP TABLE IF EXISTS `auth_provider_sync_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_provider_sync_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `providerType` varchar(32) NOT NULL,
  `runMode` text NOT NULL,
  `status` text NOT NULL,
  `startedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `endedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `scanned` int NOT NULL,
  `created` int NOT NULL,
  `updated` int NOT NULL,
  `disabled` int NOT NULL,
  `error` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_provider_sync_history`
--

LOCK TABLES `auth_provider_sync_history` WRITE;
/*!40000 ALTER TABLE `auth_provider_sync_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_provider_sync_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credentials_entity`
--

DROP TABLE IF EXISTS `credentials_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `credentials_entity` (
  `name` varchar(128) NOT NULL,
  `data` text NOT NULL,
  `type` varchar(128) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `isManaged` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_07fde106c0b471d8cc80a64fc8` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credentials_entity`
--

LOCK TABLES `credentials_entity` WRITE;
/*!40000 ALTER TABLE `credentials_entity` DISABLE KEYS */;
INSERT INTO `credentials_entity` VALUES
('SMTP account','U2FsdGVkX18v1ZsRJt47oRT2/omY7jQJdJUqdDlFijUtFGUQw5zgbxr4/PZMw/nJ2opIYFYDit2dypUrCcdZ4XQCyWviei22cMnrt0graiP5Bs8vRcrXesHHhxq4U0mjogb/zvkX6JfjSoZhlnvxFwT0ghwNXavP1eJowpZQ9x45i+Tyb/ChiwWrtje4h88C','smtp','2025-08-30 19:33:32.112','2025-08-30 19:39:01.429','j762PvhMNWKdt7Dr',0),
('Header Auth account','U2FsdGVkX1/lUj+h6xPe4v8uusYtdctFX8x5QQsRdjZ365MxCoFpnahKLjfN4bybVWKscwfS8cnu2EPqKDQQslckk/UtjVXFAiL+BYgI15U=','httpHeaderAuth','2025-08-30 19:42:55.723','2025-08-30 19:55:31.302','R4bVj09h6TyQjXDV',0);
/*!40000 ALTER TABLE `credentials_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_store`
--

DROP TABLE IF EXISTS `data_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_store` (
  `id` varchar(36) NOT NULL,
  `name` varchar(128) NOT NULL,
  `projectId` varchar(36) NOT NULL,
  `sizeBytes` int NOT NULL DEFAULT '0',
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_154eca2aa6150c70bd476c6fb7` (`projectId`,`name`),
  CONSTRAINT `FK_74fdb2d31889a91da14bb711b35` FOREIGN KEY (`projectId`) REFERENCES `project` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_store`
--

LOCK TABLES `data_store` WRITE;
/*!40000 ALTER TABLE `data_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_store_column`
--

DROP TABLE IF EXISTS `data_store_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_store_column` (
  `id` varchar(36) NOT NULL,
  `name` varchar(128) NOT NULL,
  `type` varchar(32) NOT NULL COMMENT 'Expected: string, number, boolean, or date (not enforced as a constraint)',
  `index` int NOT NULL COMMENT 'Column order, starting from 0 (0 = first column)',
  `dataStoreId` varchar(36) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_26a8273615fe6292e4ee2c0155` (`dataStoreId`,`name`),
  CONSTRAINT `FK_07172caded772d9c9d1a96d8317` FOREIGN KEY (`dataStoreId`) REFERENCES `data_store` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_store_column`
--

LOCK TABLES `data_store_column` WRITE;
/*!40000 ALTER TABLE `data_store_column` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_store_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_destinations`
--

DROP TABLE IF EXISTS `event_destinations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_destinations` (
  `id` varchar(36) NOT NULL,
  `destination` text NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_destinations`
--

LOCK TABLES `event_destinations` WRITE;
/*!40000 ALTER TABLE `event_destinations` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_destinations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `execution_annotation_tags`
--

DROP TABLE IF EXISTS `execution_annotation_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `execution_annotation_tags` (
  `annotationId` int NOT NULL,
  `tagId` varchar(24) NOT NULL,
  PRIMARY KEY (`annotationId`,`tagId`),
  KEY `IDX_a3697779b366e131b2bbdae297` (`tagId`),
  KEY `IDX_c1519757391996eb06064f0e7c` (`annotationId`),
  CONSTRAINT `FK_a3697779b366e131b2bbdae2976` FOREIGN KEY (`tagId`) REFERENCES `annotation_tag_entity` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_c1519757391996eb06064f0e7c8` FOREIGN KEY (`annotationId`) REFERENCES `execution_annotations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `execution_annotation_tags`
--

LOCK TABLES `execution_annotation_tags` WRITE;
/*!40000 ALTER TABLE `execution_annotation_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `execution_annotation_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `execution_annotations`
--

DROP TABLE IF EXISTS `execution_annotations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `execution_annotations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `executionId` int NOT NULL,
  `vote` varchar(6) DEFAULT NULL,
  `note` text,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_97f863fa83c4786f1956508496` (`executionId`),
  CONSTRAINT `FK_97f863fa83c4786f19565084960` FOREIGN KEY (`executionId`) REFERENCES `execution_entity` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `execution_annotations`
--

LOCK TABLES `execution_annotations` WRITE;
/*!40000 ALTER TABLE `execution_annotations` DISABLE KEYS */;
/*!40000 ALTER TABLE `execution_annotations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `execution_data`
--

DROP TABLE IF EXISTS `execution_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `execution_data` (
  `executionId` int NOT NULL,
  `workflowData` json NOT NULL,
  `data` mediumtext,
  PRIMARY KEY (`executionId`),
  CONSTRAINT `execution_data_FK` FOREIGN KEY (`executionId`) REFERENCES `execution_entity` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `execution_data`
--

LOCK TABLES `execution_data` WRITE;
/*!40000 ALTER TABLE `execution_data` DISABLE KEYS */;
INSERT INTO `execution_data` VALUES
(1,'{\"id\": \"zHKUppUIKKFGBl55\", \"name\": \"Send email on new nf\", \"nodes\": [{\"id\": \"906ee2f4-9c44-4fe7-a7b1-6fdb21d6e7bc\", \"name\": \"Webhook-trigger\", \"type\": \"n8n-nodes-base.webhook\", \"position\": [0, 0], \"webhookId\": \"a0efeea1-a068-46b3-9b30-f60840b268ef\", \"parameters\": {\"path\": \"send-email\", \"options\": {\"responseData\": \"{\\\"ok\\\": true}\"}, \"httpMethod\": \"POST\", \"responseMode\": \"onReceived\", \"authentication\": \"headerAuth\", \"multipleMethods\": false, \"contentTypeNotice\": \"\"}, \"credentials\": {\"httpHeaderAuth\": {\"id\": \"R4bVj09h6TyQjXDV\", \"name\": \"Header Auth account\"}}, \"typeVersion\": 2.1}, {\"id\": \"6d3dba41-c770-47cf-a4e1-a0a7491f881b\", \"name\": \"Send-notification-email\", \"type\": \"n8n-nodes-base.emailSend\", \"position\": [208, 0], \"webhookId\": \"e8c45ad7-a76b-4958-9e17-efded9e238c6\", \"parameters\": {\"text\": \"Um cliente cadastrou mais uma nota\", \"options\": {}, \"subject\": \"Nova nota cadastrada\", \"toEmail\": \"jhonnyjks@gmail.com\", \"resource\": \"email\", \"fromEmail\": \"negocios@aliabrasil.online\", \"operation\": \"send\", \"emailFormat\": \"text\"}, \"credentials\": {\"smtp\": {\"id\": \"j762PvhMNWKdt7Dr\", \"name\": \"SMTP account\"}}, \"typeVersion\": 2.1}], \"active\": false, \"pinData\": {}, \"settings\": {\"executionOrder\": \"v1\"}, \"staticData\": {}, \"connections\": {\"Webhook-trigger\": {\"main\": [[{\"node\": \"Send-notification-email\", \"type\": \"main\", \"index\": 0}]]}}}','[{\"startData\":\"1\",\"resultData\":\"2\",\"executionData\":\"3\"},{\"destinationNode\":\"4\"},{\"runData\":\"5\",\"pinData\":\"6\",\"lastNodeExecuted\":\"4\"},{\"contextData\":\"7\",\"nodeExecutionStack\":\"8\",\"waitingExecution\":\"9\"},\"Webhook-trigger\",{\"Webhook-trigger\":\"10\"},{},{},[],{},[\"11\"],{\"startTime\":1756583780302,\"executionIndex\":0,\"source\":\"12\",\"hints\":\"13\",\"executionTime\":2,\"executionStatus\":\"14\",\"data\":\"15\"},[],[],\"success\",{\"main\":\"16\"},[\"17\"],[\"18\"],{\"json\":\"19\",\"pairedItem\":\"20\"},{\"headers\":\"21\",\"params\":\"22\",\"query\":\"23\",\"body\":\"24\",\"webhookUrl\":\"25\",\"executionMode\":\"26\"},{\"item\":0},{\"accept\":\"27\",\"content-type\":\"27\",\"x-webhook-token\":\"28\",\"user-agent\":\"29\",\"postman-token\":\"30\",\"host\":\"31\",\"accept-encoding\":\"32\",\"connection\":\"33\",\"content-length\":\"34\"},{},{},{},\"http://localhost:5678/webhook-test/send-email\",\"test\",\"application/json\",\"zHKUppUIKKFGBl55\",\"PostmanRuntime/7.45.0\",\"62c4725c-820f-4eaa-a26c-182a668b59d3\",\"localhost:5678\",\"gzip, deflate, br\",\"keep-alive\",\"0\"]'),
(2,'{\"id\": \"zHKUppUIKKFGBl55\", \"name\": \"Send email on new nf\", \"nodes\": [{\"id\": \"906ee2f4-9c44-4fe7-a7b1-6fdb21d6e7bc\", \"name\": \"Webhook-trigger\", \"type\": \"n8n-nodes-base.webhook\", \"position\": [0, 0], \"webhookId\": \"a0efeea1-a068-46b3-9b30-f60840b268ef\", \"parameters\": {\"path\": \"send-email\", \"options\": {\"responseData\": \"{\\\"ok\\\": true}\"}, \"httpMethod\": \"POST\", \"responseMode\": \"onReceived\", \"authentication\": \"headerAuth\", \"multipleMethods\": false, \"contentTypeNotice\": \"\"}, \"credentials\": {\"httpHeaderAuth\": {\"id\": \"R4bVj09h6TyQjXDV\", \"name\": \"Header Auth account\"}}, \"typeVersion\": 2.1}, {\"id\": \"6d3dba41-c770-47cf-a4e1-a0a7491f881b\", \"name\": \"Send-notification-email\", \"type\": \"n8n-nodes-base.emailSend\", \"position\": [208, 0], \"webhookId\": \"e8c45ad7-a76b-4958-9e17-efded9e238c6\", \"parameters\": {\"text\": \"Um cliente cadastrou mais uma nota\", \"options\": {}, \"subject\": \"Nova nota cadastrada\", \"toEmail\": \"jhonnyjks@gmail.com\", \"resource\": \"email\", \"fromEmail\": \"negocios@aliabrasil.online\", \"operation\": \"send\", \"emailFormat\": \"text\"}, \"credentials\": {\"smtp\": {\"id\": \"j762PvhMNWKdt7Dr\", \"name\": \"SMTP account\"}}, \"typeVersion\": 2.1}], \"active\": false, \"pinData\": {}, \"settings\": {\"executionOrder\": \"v1\"}, \"staticData\": {}, \"connections\": {\"Webhook-trigger\": {\"main\": [[{\"node\": \"Send-notification-email\", \"type\": \"main\", \"index\": 0}]]}}}','[{\"startData\":\"1\",\"resultData\":\"2\",\"executionData\":\"3\"},{\"destinationNode\":\"4\"},{\"runData\":\"5\",\"pinData\":\"6\",\"lastNodeExecuted\":\"4\"},{\"contextData\":\"7\",\"nodeExecutionStack\":\"8\",\"waitingExecution\":\"9\"},\"Webhook-trigger\",{\"Webhook-trigger\":\"10\"},{},{},[],{},[\"11\"],{\"startTime\":1756583878560,\"executionIndex\":0,\"source\":\"12\",\"hints\":\"13\",\"executionTime\":1,\"executionStatus\":\"14\",\"data\":\"15\"},[],[],\"success\",{\"main\":\"16\"},[\"17\"],[\"18\"],{\"json\":\"19\",\"pairedItem\":\"20\"},{\"headers\":\"21\",\"params\":\"22\",\"query\":\"23\",\"body\":\"24\",\"webhookUrl\":\"25\",\"executionMode\":\"26\"},{\"item\":0},{\"accept\":\"27\",\"content-type\":\"27\",\"x-webhook-token\":\"28\",\"user-agent\":\"29\",\"postman-token\":\"30\",\"host\":\"31\",\"accept-encoding\":\"32\",\"connection\":\"33\",\"content-length\":\"34\"},{},{},{\"description\":\"35\"},\"http://localhost:5678/webhook-test/send-email\",\"test\",\"application/json\",\"zHKUppUIKKFGBl55\",\"PostmanRuntime/7.45.0\",\"b79108e1-7b2c-4086-8673-730f66f1d247\",\"localhost:5678\",\"gzip, deflate, br\",\"keep-alive\",\"35\",\"desc cdfdf\"]'),
(3,'{\"id\": \"zHKUppUIKKFGBl55\", \"name\": \"Send email on new nf\", \"nodes\": [{\"id\": \"906ee2f4-9c44-4fe7-a7b1-6fdb21d6e7bc\", \"name\": \"Webhook-trigger\", \"type\": \"n8n-nodes-base.webhook\", \"position\": [0, 0], \"webhookId\": \"a0efeea1-a068-46b3-9b30-f60840b268ef\", \"parameters\": {\"path\": \"send-email\", \"options\": {\"responseData\": \"{\\\"ok\\\": true}\", \"binaryPropertyName\": \"description\"}, \"httpMethod\": \"POST\", \"responseMode\": \"onReceived\", \"authentication\": \"headerAuth\", \"multipleMethods\": false, \"contentTypeNotice\": \"\"}, \"credentials\": {\"httpHeaderAuth\": {\"id\": \"R4bVj09h6TyQjXDV\", \"name\": \"Header Auth account\"}}, \"typeVersion\": 2.1}, {\"id\": \"6d3dba41-c770-47cf-a4e1-a0a7491f881b\", \"name\": \"Send-notification-email\", \"type\": \"n8n-nodes-base.emailSend\", \"position\": [208, 0], \"webhookId\": \"e8c45ad7-a76b-4958-9e17-efded9e238c6\", \"parameters\": {\"text\": \"Um cliente cadastrou mais uma nota\", \"options\": {}, \"subject\": \"Nova nota cadastrada\", \"toEmail\": \"jhonnyjks@gmail.com\", \"resource\": \"email\", \"fromEmail\": \"negocios@aliabrasil.online\", \"operation\": \"send\", \"emailFormat\": \"text\"}, \"credentials\": {\"smtp\": {\"id\": \"j762PvhMNWKdt7Dr\", \"name\": \"SMTP account\"}}, \"typeVersion\": 2.1}], \"active\": false, \"pinData\": {}, \"settings\": {\"executionOrder\": \"v1\"}, \"staticData\": {}, \"connections\": {\"Webhook-trigger\": {\"main\": [[{\"node\": \"Send-notification-email\", \"type\": \"main\", \"index\": 0}]]}}}','[{\"startData\":\"1\",\"resultData\":\"2\",\"executionData\":\"3\"},{\"destinationNode\":\"4\"},{\"runData\":\"5\",\"pinData\":\"6\",\"lastNodeExecuted\":\"4\"},{\"contextData\":\"7\",\"nodeExecutionStack\":\"8\",\"waitingExecution\":\"9\"},\"Webhook-trigger\",{\"Webhook-trigger\":\"10\"},{},{},[],{},[\"11\"],{\"startTime\":1756583960050,\"executionIndex\":0,\"source\":\"12\",\"hints\":\"13\",\"executionTime\":1,\"executionStatus\":\"14\",\"data\":\"15\"},[],[],\"success\",{\"main\":\"16\"},[\"17\"],[\"18\"],{\"json\":\"19\",\"pairedItem\":\"20\"},{\"headers\":\"21\",\"params\":\"22\",\"query\":\"23\",\"body\":\"24\",\"webhookUrl\":\"25\",\"executionMode\":\"26\"},{\"item\":0},{\"accept\":\"27\",\"content-type\":\"27\",\"x-webhook-token\":\"28\",\"user-agent\":\"29\",\"postman-token\":\"30\",\"host\":\"31\",\"accept-encoding\":\"32\",\"connection\":\"33\",\"content-length\":\"34\"},{},{},{\"description\":\"35\"},\"http://localhost:5678/webhook-test/send-email\",\"test\",\"application/json\",\"zHKUppUIKKFGBl55\",\"PostmanRuntime/7.45.0\",\"68f4ff8a-1012-461d-a173-ce8877d0ea0e\",\"localhost:5678\",\"gzip, deflate, br\",\"keep-alive\",\"35\",\"desc cdfdf\"]'),
(4,'{\"id\": \"zHKUppUIKKFGBl55\", \"name\": \"Send email on new nf\", \"nodes\": [{\"id\": \"906ee2f4-9c44-4fe7-a7b1-6fdb21d6e7bc\", \"name\": \"Webhook-trigger\", \"type\": \"n8n-nodes-base.webhook\", \"position\": [0, 0], \"webhookId\": \"a0efeea1-a068-46b3-9b30-f60840b268ef\", \"parameters\": {\"path\": \"send-email\", \"options\": {\"responseData\": \"{\\\"ok\\\": true}\", \"binaryPropertyName\": \"description\"}, \"httpMethod\": \"POST\", \"responseMode\": \"onReceived\", \"authentication\": \"headerAuth\", \"multipleMethods\": false, \"contentTypeNotice\": \"\"}, \"credentials\": {\"httpHeaderAuth\": {\"id\": \"R4bVj09h6TyQjXDV\", \"name\": \"Header Auth account\"}}, \"typeVersion\": 2.1}, {\"id\": \"6d3dba41-c770-47cf-a4e1-a0a7491f881b\", \"name\": \"Send-notification-email\", \"type\": \"n8n-nodes-base.emailSend\", \"position\": [208, 0], \"webhookId\": \"e8c45ad7-a76b-4958-9e17-efded9e238c6\", \"parameters\": {\"text\": \"Um cliente cadastrou mais uma nota\", \"options\": {}, \"subject\": \"Nova nota cadastrada\", \"toEmail\": \"jhonnyjks@gmail.com\", \"resource\": \"email\", \"fromEmail\": \"negocios@aliabrasil.online\", \"operation\": \"send\", \"emailFormat\": \"text\"}, \"credentials\": {\"smtp\": {\"id\": \"j762PvhMNWKdt7Dr\", \"name\": \"SMTP account\"}}, \"typeVersion\": 2.1}], \"active\": true, \"pinData\": {}, \"settings\": {\"executionOrder\": \"v1\"}, \"createdAt\": \"2025-08-30T19:46:37.411Z\", \"updatedAt\": \"2025-08-30T20:00:13.000Z\", \"isArchived\": false, \"staticData\": {}, \"connections\": {\"Webhook-trigger\": {\"main\": [[{\"node\": \"Send-notification-email\", \"type\": \"main\", \"index\": 0}]]}}}','[{\"startData\":\"1\",\"resultData\":\"2\",\"executionData\":\"3\"},{},{\"runData\":\"4\",\"lastNodeExecuted\":\"5\"},{\"contextData\":\"6\",\"nodeExecutionStack\":\"7\",\"waitingExecution\":\"8\"},{\"Webhook-trigger\":\"9\",\"Send-notification-email\":\"10\"},\"Send-notification-email\",{},[],{},[\"11\"],[\"12\"],{\"startTime\":1756584045966,\"executionIndex\":0,\"source\":\"13\",\"hints\":\"14\",\"executionTime\":1,\"executionStatus\":\"15\",\"data\":\"16\"},{\"startTime\":1756584045968,\"executionIndex\":1,\"source\":\"17\",\"hints\":\"18\",\"executionTime\":1965,\"executionStatus\":\"15\",\"data\":\"19\"},[],[],\"success\",{\"main\":\"20\"},[\"21\"],[],{\"main\":\"22\"},[\"23\"],{\"previousNode\":\"24\"},[\"25\"],[\"26\"],\"Webhook-trigger\",[\"27\"],{\"json\":\"28\",\"pairedItem\":\"29\"},{\"json\":\"30\",\"pairedItem\":\"31\"},{\"headers\":\"32\",\"params\":\"33\",\"query\":\"34\",\"body\":\"35\",\"webhookUrl\":\"36\",\"executionMode\":\"37\"},{\"item\":0},{\"accepted\":\"38\",\"rejected\":\"39\",\"ehlo\":\"40\",\"envelopeTime\":472,\"messageTime\":301,\"messageSize\":400,\"response\":\"41\",\"envelope\":\"42\",\"messageId\":\"43\"},{\"item\":0},{\"accept\":\"44\",\"content-type\":\"44\",\"x-webhook-token\":\"45\",\"user-agent\":\"46\",\"postman-token\":\"47\",\"host\":\"48\",\"accept-encoding\":\"49\",\"connection\":\"50\",\"content-length\":\"51\"},{},{},{\"description\":\"52\"},\"http://localhost:5678/webhook/send-email\",\"production\",[\"53\"],[],[\"54\",\"55\",\"56\",\"57\",\"58\",\"59\",\"60\",\"61\"],\"250 2.0.0 Ok: queued as 4cDmGR2Z8tz1xnw\",{\"from\":\"62\",\"to\":\"63\"},\"<e7d87c40-cbce-e984-b6a8-594b92796067@aliabrasil.online>\",\"application/json\",\"zHKUppUIKKFGBl55\",\"PostmanRuntime/7.45.0\",\"9d74b89c-ca51-4260-b72a-ed474c7bbfc9\",\"localhost:5678\",\"gzip, deflate, br\",\"keep-alive\",\"35\",\"desc cdfdf\",\"jhonnyjks@gmail.com\",\"PIPELINING\",\"SIZE 48811212\",\"ETRN\",\"AUTH PLAIN LOGIN\",\"ENHANCEDSTATUSCODES\",\"8BITMIME\",\"DSN\",\"CHUNKING\",\"negocios@aliabrasil.online\",[\"53\"]]'),
(5,'{\"id\": \"zHKUppUIKKFGBl55\", \"name\": \"Send email on new nf\", \"nodes\": [{\"id\": \"906ee2f4-9c44-4fe7-a7b1-6fdb21d6e7bc\", \"name\": \"Webhook-trigger\", \"type\": \"n8n-nodes-base.webhook\", \"position\": [0, 0], \"webhookId\": \"a0efeea1-a068-46b3-9b30-f60840b268ef\", \"parameters\": {\"path\": \"send-email\", \"options\": {\"responseData\": \"{\\\"ok\\\": true}\", \"binaryPropertyName\": \"description\"}, \"httpMethod\": \"POST\", \"responseMode\": \"onReceived\", \"authentication\": \"headerAuth\", \"multipleMethods\": false, \"contentTypeNotice\": \"\"}, \"credentials\": {\"httpHeaderAuth\": {\"id\": \"R4bVj09h6TyQjXDV\", \"name\": \"Header Auth account\"}}, \"typeVersion\": 2.1}, {\"id\": \"6d3dba41-c770-47cf-a4e1-a0a7491f881b\", \"name\": \"Send-notification-email\", \"type\": \"n8n-nodes-base.emailSend\", \"position\": [208, 0], \"webhookId\": \"e8c45ad7-a76b-4958-9e17-efded9e238c6\", \"parameters\": {\"text\": \"Um cliente cadastrou mais uma nota\", \"options\": {}, \"subject\": \"Nova nota cadastrada\", \"toEmail\": \"jhonnyjks@gmail.com\", \"resource\": \"email\", \"fromEmail\": \"negocios@aliabrasil.online\", \"operation\": \"send\", \"emailFormat\": \"text\"}, \"credentials\": {\"smtp\": {\"id\": \"j762PvhMNWKdt7Dr\", \"name\": \"SMTP account\"}}, \"typeVersion\": 2.1}], \"active\": true, \"pinData\": {}, \"settings\": {\"executionOrder\": \"v1\"}, \"createdAt\": \"2025-08-30T19:46:37.411Z\", \"updatedAt\": \"2025-08-30T20:00:13.000Z\", \"isArchived\": false, \"staticData\": {}, \"connections\": {\"Webhook-trigger\": {\"main\": [[{\"node\": \"Send-notification-email\", \"type\": \"main\", \"index\": 0}]]}}}','[{\"startData\":\"1\",\"resultData\":\"2\",\"executionData\":\"3\"},{},{\"runData\":\"4\",\"lastNodeExecuted\":\"5\"},{\"contextData\":\"6\",\"nodeExecutionStack\":\"7\",\"waitingExecution\":\"8\"},{\"Webhook-trigger\":\"9\",\"Send-notification-email\":\"10\"},\"Send-notification-email\",{},[],{},[\"11\"],[\"12\"],{\"startTime\":1756584131382,\"executionIndex\":0,\"source\":\"13\",\"hints\":\"14\",\"executionTime\":0,\"executionStatus\":\"15\",\"data\":\"16\"},{\"startTime\":1756584131383,\"executionIndex\":1,\"source\":\"17\",\"hints\":\"18\",\"executionTime\":1453,\"executionStatus\":\"15\",\"data\":\"19\"},[],[],\"success\",{\"main\":\"20\"},[\"21\"],[],{\"main\":\"22\"},[\"23\"],{\"previousNode\":\"24\"},[\"25\"],[\"26\"],\"Webhook-trigger\",[\"27\"],{\"json\":\"28\",\"pairedItem\":\"29\"},{\"json\":\"30\",\"pairedItem\":\"31\"},{\"headers\":\"32\",\"params\":\"33\",\"query\":\"34\",\"body\":\"35\",\"webhookUrl\":\"36\",\"executionMode\":\"37\"},{\"item\":0},{\"accepted\":\"38\",\"rejected\":\"39\",\"ehlo\":\"40\",\"envelopeTime\":486,\"messageTime\":302,\"messageSize\":400,\"response\":\"41\",\"envelope\":\"42\",\"messageId\":\"43\"},{\"item\":0},{\"accept\":\"44\",\"content-type\":\"44\",\"x-webhook-token\":\"45\",\"user-agent\":\"46\",\"postman-token\":\"47\",\"host\":\"48\",\"accept-encoding\":\"49\",\"connection\":\"50\",\"content-length\":\"51\"},{},{},{\"description\":\"52\"},\"http://localhost:5678/webhook/send-email\",\"production\",[\"53\"],[],[\"54\",\"55\",\"56\",\"57\",\"58\",\"59\",\"60\",\"61\"],\"250 2.0.0 Ok: queued as 4cDmJ41wrZzHTq4c\",{\"from\":\"62\",\"to\":\"63\"},\"<1459eb94-0073-6d5a-5a94-6cdb3b570c22@aliabrasil.online>\",\"application/json\",\"zHKUppUIKKFGBl55\",\"PostmanRuntime/7.45.0\",\"0f9a11a6-f5ca-4972-82c3-695b8c3c1639\",\"localhost:5678\",\"gzip, deflate, br\",\"keep-alive\",\"35\",\"desc cdfdf\",\"jhonnyjks@gmail.com\",\"PIPELINING\",\"SIZE 48811212\",\"ETRN\",\"AUTH PLAIN LOGIN\",\"ENHANCEDSTATUSCODES\",\"8BITMIME\",\"DSN\",\"CHUNKING\",\"negocios@aliabrasil.online\",[\"53\"]]'),
(6,'{\"id\": \"zHKUppUIKKFGBl55\", \"name\": \"Send email on new nf\", \"nodes\": [{\"id\": \"906ee2f4-9c44-4fe7-a7b1-6fdb21d6e7bc\", \"name\": \"Webhook-trigger\", \"type\": \"n8n-nodes-base.webhook\", \"position\": [0, 0], \"webhookId\": \"a0efeea1-a068-46b3-9b30-f60840b268ef\", \"parameters\": {\"path\": \"send-email\", \"options\": {\"responseData\": \"{\\\"ok\\\": true}\", \"binaryPropertyName\": \"description\"}, \"httpMethod\": \"POST\", \"responseMode\": \"onReceived\", \"authentication\": \"headerAuth\", \"multipleMethods\": false, \"contentTypeNotice\": \"\"}, \"credentials\": {\"httpHeaderAuth\": {\"id\": \"R4bVj09h6TyQjXDV\", \"name\": \"Header Auth account\"}}, \"typeVersion\": 2.1}, {\"id\": \"6d3dba41-c770-47cf-a4e1-a0a7491f881b\", \"name\": \"Send-notification-email\", \"type\": \"n8n-nodes-base.emailSend\", \"position\": [208, 0], \"webhookId\": \"e8c45ad7-a76b-4958-9e17-efded9e238c6\", \"parameters\": {\"text\": \"Um cliente cadastrou mais uma nota\", \"options\": {}, \"subject\": \"Nova nota cadastrada\", \"toEmail\": \"jhonnyjks@gmail.com\", \"resource\": \"email\", \"fromEmail\": \"negocios@aliabrasil.online\", \"operation\": \"send\", \"emailFormat\": \"text\"}, \"credentials\": {\"smtp\": {\"id\": \"j762PvhMNWKdt7Dr\", \"name\": \"SMTP account\"}}, \"typeVersion\": 2.1}], \"active\": true, \"pinData\": {}, \"settings\": {\"executionOrder\": \"v1\"}, \"createdAt\": \"2025-08-30T19:46:37.411Z\", \"updatedAt\": \"2025-08-30T20:00:13.000Z\", \"isArchived\": false, \"staticData\": {}, \"connections\": {\"Webhook-trigger\": {\"main\": [[{\"node\": \"Send-notification-email\", \"type\": \"main\", \"index\": 0}]]}}}','[{\"startData\":\"1\",\"resultData\":\"2\",\"executionData\":\"3\"},{},{\"runData\":\"4\",\"lastNodeExecuted\":\"5\"},{\"contextData\":\"6\",\"nodeExecutionStack\":\"7\",\"waitingExecution\":\"8\"},{\"Webhook-trigger\":\"9\",\"Send-notification-email\":\"10\"},\"Send-notification-email\",{},[],{},[\"11\"],[\"12\"],{\"startTime\":1756585037906,\"executionIndex\":0,\"source\":\"13\",\"hints\":\"14\",\"executionTime\":1,\"executionStatus\":\"15\",\"data\":\"16\"},{\"startTime\":1756585037908,\"executionIndex\":1,\"source\":\"17\",\"hints\":\"18\",\"executionTime\":2062,\"executionStatus\":\"15\",\"data\":\"19\"},[],[],\"success\",{\"main\":\"20\"},[\"21\"],[],{\"main\":\"22\"},[\"23\"],{\"previousNode\":\"24\"},[\"25\"],[\"26\"],\"Webhook-trigger\",[\"27\"],{\"json\":\"28\",\"pairedItem\":\"29\"},{\"json\":\"30\",\"pairedItem\":\"31\"},{\"headers\":\"32\",\"params\":\"33\",\"query\":\"34\",\"body\":\"35\",\"webhookUrl\":\"36\",\"executionMode\":\"37\"},{\"item\":0},{\"accepted\":\"38\",\"rejected\":\"39\",\"ehlo\":\"40\",\"envelopeTime\":583,\"messageTime\":345,\"messageSize\":400,\"response\":\"41\",\"envelope\":\"42\",\"messageId\":\"43\"},{\"item\":0},{\"host\":\"44\",\"user-agent\":\"45\",\"x-webhook-token\":\"46\",\"content-type\":\"47\",\"content-length\":\"48\"},{},{},{\"text\":\"49\"},\"http://localhost:5678/webhook/send-email\",\"production\",[\"50\"],[],[\"51\",\"52\",\"53\",\"54\",\"55\",\"56\",\"57\",\"58\"],\"250 2.0.0 Ok: queued as 4cDmdW1TyMzHTnH0\",{\"from\":\"59\",\"to\":\"60\"},\"<e5d6349b-e3da-5559-a784-d27eb271e7c3@aliabrasil.online>\",\"n8n:5678\",\"GuzzleHttp/7\",\"zHKUppUIKKFGBl55\",\"application/json\",\"289\",\"Uma nova nota fiscal foi cadastrada.\\n\\nDescrição: Venda de 1 hidratante, 3 esponjas, 3 chocolates, 2 gomas de mascar e 1 pano de uso.\\nCategoria Sugerida: alimentação\\nResumo: Compra de itens de higiene e confeitaria.\\n\\nAcesse o sistema para mais detalhes.\",\"jhonnyjks@gmail.com\",\"PIPELINING\",\"SIZE 48811212\",\"ETRN\",\"AUTH PLAIN LOGIN\",\"ENHANCEDSTATUSCODES\",\"8BITMIME\",\"DSN\",\"CHUNKING\",\"negocios@aliabrasil.online\",[\"50\"]]'),
(7,'{\"id\": \"zHKUppUIKKFGBl55\", \"name\": \"Send email on new nf\", \"nodes\": [{\"id\": \"906ee2f4-9c44-4fe7-a7b1-6fdb21d6e7bc\", \"name\": \"Webhook-trigger\", \"type\": \"n8n-nodes-base.webhook\", \"position\": [0, 0], \"webhookId\": \"a0efeea1-a068-46b3-9b30-f60840b268ef\", \"parameters\": {\"path\": \"send-email\", \"options\": {\"responseData\": \"{\\\"ok\\\": true}\", \"binaryPropertyName\": \"description\"}, \"httpMethod\": \"POST\", \"responseMode\": \"onReceived\", \"authentication\": \"headerAuth\", \"multipleMethods\": false, \"contentTypeNotice\": \"\"}, \"credentials\": {\"httpHeaderAuth\": {\"id\": \"R4bVj09h6TyQjXDV\", \"name\": \"Header Auth account\"}}, \"typeVersion\": 2.1}, {\"id\": \"6d3dba41-c770-47cf-a4e1-a0a7491f881b\", \"name\": \"Send-notification-email\", \"type\": \"n8n-nodes-base.emailSend\", \"position\": [208, 0], \"webhookId\": \"e8c45ad7-a76b-4958-9e17-efded9e238c6\", \"parameters\": {\"text\": \"Um cliente cadastrou mais uma nota\", \"options\": {}, \"subject\": \"Nova nota cadastrada\", \"toEmail\": \"jhonnyjks@gmail.com\", \"resource\": \"email\", \"fromEmail\": \"negocios@aliabrasil.online\", \"operation\": \"send\", \"emailFormat\": \"text\"}, \"credentials\": {\"smtp\": {\"id\": \"j762PvhMNWKdt7Dr\", \"name\": \"SMTP account\"}}, \"typeVersion\": 2.1}], \"active\": true, \"pinData\": {}, \"settings\": {\"executionOrder\": \"v1\"}, \"createdAt\": \"2025-08-30T19:46:37.411Z\", \"updatedAt\": \"2025-08-30T20:00:13.000Z\", \"isArchived\": false, \"staticData\": {}, \"connections\": {\"Webhook-trigger\": {\"main\": [[{\"node\": \"Send-notification-email\", \"type\": \"main\", \"index\": 0}]]}}}','[{\"startData\":\"1\",\"resultData\":\"2\",\"executionData\":\"3\"},{},{\"runData\":\"4\",\"lastNodeExecuted\":\"5\"},{\"contextData\":\"6\",\"nodeExecutionStack\":\"7\",\"waitingExecution\":\"8\"},{\"Webhook-trigger\":\"9\",\"Send-notification-email\":\"10\"},\"Send-notification-email\",{},[],{},[\"11\"],[\"12\"],{\"startTime\":1756585251903,\"executionIndex\":0,\"source\":\"13\",\"hints\":\"14\",\"executionTime\":0,\"executionStatus\":\"15\",\"data\":\"16\"},{\"startTime\":1756585251903,\"executionIndex\":1,\"source\":\"17\",\"hints\":\"18\",\"executionTime\":1251,\"executionStatus\":\"15\",\"data\":\"19\"},[],[],\"success\",{\"main\":\"20\"},[\"21\"],[],{\"main\":\"22\"},[\"23\"],{\"previousNode\":\"24\"},[\"25\"],[\"26\"],\"Webhook-trigger\",[\"27\"],{\"json\":\"28\",\"pairedItem\":\"29\"},{\"json\":\"30\",\"pairedItem\":\"31\"},{\"headers\":\"32\",\"params\":\"33\",\"query\":\"34\",\"body\":\"35\",\"webhookUrl\":\"36\",\"executionMode\":\"37\"},{\"item\":0},{\"accepted\":\"38\",\"rejected\":\"39\",\"ehlo\":\"40\",\"envelopeTime\":365,\"messageTime\":291,\"messageSize\":400,\"response\":\"41\",\"envelope\":\"42\",\"messageId\":\"43\"},{\"item\":0},{\"accept\":\"44\",\"content-type\":\"44\",\"x-webhook-token\":\"45\",\"user-agent\":\"46\",\"postman-token\":\"47\",\"host\":\"48\",\"accept-encoding\":\"49\",\"connection\":\"50\",\"content-length\":\"51\"},{},{},{\"text\":\"52\"},\"http://localhost:5678/webhook/send-email\",\"production\",[\"53\"],[],[\"54\",\"55\",\"56\",\"57\",\"58\",\"59\",\"60\",\"61\"],\"250 2.0.0 Ok: queued as 4cDmjc4n7hz1xnj\",{\"from\":\"62\",\"to\":\"63\"},\"<98cf0cfc-a5e3-6313-d761-69a4851f43fc@aliabrasil.online>\",\"application/json\",\"zHKUppUIKKFGBl55\",\"PostmanRuntime/7.45.0\",\"64e8fd00-4d88-4d75-957b-ec63bf27111f\",\"localhost:5678\",\"gzip, deflate, br\",\"keep-alive\",\"28\",\"desc cdfdf\",\"jhonnyjks@gmail.com\",\"PIPELINING\",\"SIZE 48811212\",\"ETRN\",\"AUTH PLAIN LOGIN\",\"ENHANCEDSTATUSCODES\",\"8BITMIME\",\"DSN\",\"CHUNKING\",\"negocios@aliabrasil.online\",[\"53\"]]'),
(8,'{\"id\": \"zHKUppUIKKFGBl55\", \"name\": \"Send email on new nf\", \"nodes\": [{\"id\": \"906ee2f4-9c44-4fe7-a7b1-6fdb21d6e7bc\", \"name\": \"Webhook-trigger\", \"type\": \"n8n-nodes-base.webhook\", \"position\": [0, 0], \"webhookId\": \"a0efeea1-a068-46b3-9b30-f60840b268ef\", \"parameters\": {\"path\": \"send-email\", \"options\": {\"responseData\": \"{\\\"ok\\\": true}\", \"binaryPropertyName\": \"description\"}, \"httpMethod\": \"POST\", \"responseMode\": \"onReceived\", \"authentication\": \"headerAuth\", \"multipleMethods\": false, \"contentTypeNotice\": \"\"}, \"credentials\": {\"httpHeaderAuth\": {\"id\": \"R4bVj09h6TyQjXDV\", \"name\": \"Header Auth account\"}}, \"typeVersion\": 2.1}, {\"id\": \"6d3dba41-c770-47cf-a4e1-a0a7491f881b\", \"name\": \"Send notification email\", \"type\": \"n8n-nodes-base.emailSend\", \"position\": [208, 0], \"webhookId\": \"e8c45ad7-a76b-4958-9e17-efded9e238c6\", \"parameters\": {\"text\": \"{{$json.body.text}}\", \"options\": {\"appendAttribution\": true}, \"subject\": \"Nova nota cadastrada\", \"toEmail\": \"jhonnyjks@gmail.com\", \"resource\": \"email\", \"fromEmail\": \"negocios@aliabrasil.online\", \"operation\": \"send\", \"emailFormat\": \"text\"}, \"credentials\": {\"smtp\": {\"id\": \"j762PvhMNWKdt7Dr\", \"name\": \"SMTP account\"}}, \"typeVersion\": 2.1}], \"active\": true, \"pinData\": {}, \"settings\": {\"executionOrder\": \"v1\"}, \"staticData\": {}, \"connections\": {\"Webhook-trigger\": {\"main\": [[{\"node\": \"Send notification email\", \"type\": \"main\", \"index\": 0}]]}}}','[{\"startData\":\"1\",\"resultData\":\"2\",\"executionData\":\"3\"},{\"destinationNode\":\"4\"},{\"runData\":\"5\",\"pinData\":\"6\",\"lastNodeExecuted\":\"4\"},{\"contextData\":\"7\",\"nodeExecutionStack\":\"8\",\"waitingExecution\":\"9\"},\"Send notification email\",{\"Webhook-trigger\":\"10\",\"Send notification email\":\"11\"},{},{},[],{},[\"12\"],[\"13\"],{\"startTime\":1756585281966,\"executionIndex\":0,\"source\":\"14\",\"hints\":\"15\",\"executionTime\":1,\"executionStatus\":\"16\",\"data\":\"17\"},{\"startTime\":1756585281967,\"executionIndex\":1,\"source\":\"18\",\"hints\":\"19\",\"executionTime\":1278,\"executionStatus\":\"16\",\"data\":\"20\"},[],[],\"success\",{\"main\":\"21\"},[\"22\"],[],{\"main\":\"23\"},[\"24\"],{\"previousNode\":\"25\"},[\"26\"],[\"27\"],\"Webhook-trigger\",[\"28\"],{\"json\":\"29\",\"pairedItem\":\"30\"},{\"json\":\"31\",\"pairedItem\":\"32\"},{\"headers\":\"33\",\"params\":\"34\",\"query\":\"35\",\"body\":\"36\",\"webhookUrl\":\"37\",\"executionMode\":\"38\"},{\"item\":0},{\"accepted\":\"39\",\"rejected\":\"40\",\"ehlo\":\"41\",\"envelopeTime\":396,\"messageTime\":295,\"messageSize\":385,\"response\":\"42\",\"envelope\":\"43\",\"messageId\":\"44\"},{\"item\":0},{\"accept\":\"45\",\"content-type\":\"45\",\"x-webhook-token\":\"46\",\"user-agent\":\"47\",\"postman-token\":\"48\",\"host\":\"49\",\"accept-encoding\":\"50\",\"connection\":\"51\",\"content-length\":\"52\"},{},{},{\"text\":\"53\"},\"http://localhost:5678/webhook-test/send-email\",\"test\",[\"54\"],[],[\"55\",\"56\",\"57\",\"58\",\"59\",\"60\",\"61\",\"62\"],\"250 2.0.0 Ok: queued as 4cDmkB4y3Tz1xnX\",{\"from\":\"63\",\"to\":\"64\"},\"<91d46538-066a-b504-41f5-12be291fe923@aliabrasil.online>\",\"application/json\",\"zHKUppUIKKFGBl55\",\"PostmanRuntime/7.45.0\",\"c8ac5a9d-05ec-40b0-89ce-1d8af1f5c518\",\"localhost:5678\",\"gzip, deflate, br\",\"keep-alive\",\"28\",\"desc cdfdf\",\"jhonnyjks@gmail.com\",\"PIPELINING\",\"SIZE 48811212\",\"ETRN\",\"AUTH PLAIN LOGIN\",\"ENHANCEDSTATUSCODES\",\"8BITMIME\",\"DSN\",\"CHUNKING\",\"negocios@aliabrasil.online\",[\"54\"]]'),
(9,'{\"id\": \"zHKUppUIKKFGBl55\", \"name\": \"Send email on new nf\", \"nodes\": [{\"id\": \"906ee2f4-9c44-4fe7-a7b1-6fdb21d6e7bc\", \"name\": \"Webhook-trigger\", \"type\": \"n8n-nodes-base.webhook\", \"position\": [0, 0], \"webhookId\": \"a0efeea1-a068-46b3-9b30-f60840b268ef\", \"parameters\": {\"path\": \"send-email\", \"options\": {\"responseData\": \"{\\\"ok\\\": true}\", \"binaryPropertyName\": \"description\"}, \"httpMethod\": \"POST\", \"responseMode\": \"onReceived\", \"authentication\": \"headerAuth\", \"multipleMethods\": false, \"contentTypeNotice\": \"\"}, \"credentials\": {\"httpHeaderAuth\": {\"id\": \"R4bVj09h6TyQjXDV\", \"name\": \"Header Auth account\"}}, \"typeVersion\": 2.1}, {\"id\": \"6d3dba41-c770-47cf-a4e1-a0a7491f881b\", \"name\": \"Send-notification-email\", \"type\": \"n8n-nodes-base.emailSend\", \"position\": [208, 0], \"webhookId\": \"e8c45ad7-a76b-4958-9e17-efded9e238c6\", \"parameters\": {\"text\": \"Um cliente cadastrou mais uma nota\", \"options\": {}, \"subject\": \"Nova nota cadastrada\", \"toEmail\": \"jhonnyjks@gmail.com\", \"resource\": \"email\", \"fromEmail\": \"negocios@aliabrasil.online\", \"operation\": \"send\", \"emailFormat\": \"text\"}, \"credentials\": {\"smtp\": {\"id\": \"j762PvhMNWKdt7Dr\", \"name\": \"SMTP account\"}}, \"typeVersion\": 2.1}], \"active\": true, \"pinData\": {}, \"settings\": {\"executionOrder\": \"v1\"}, \"createdAt\": \"2025-08-30T19:46:37.411Z\", \"updatedAt\": \"2025-08-30T20:00:13.000Z\", \"isArchived\": false, \"staticData\": {}, \"connections\": {\"Webhook-trigger\": {\"main\": [[{\"node\": \"Send-notification-email\", \"type\": \"main\", \"index\": 0}]]}}}','[{\"startData\":\"1\",\"resultData\":\"2\",\"executionData\":\"3\"},{},{\"runData\":\"4\",\"lastNodeExecuted\":\"5\"},{\"contextData\":\"6\",\"nodeExecutionStack\":\"7\",\"waitingExecution\":\"8\"},{\"Webhook-trigger\":\"9\",\"Send-notification-email\":\"10\"},\"Send-notification-email\",{},[],{},[\"11\"],[\"12\"],{\"startTime\":1756585326082,\"executionIndex\":0,\"source\":\"13\",\"hints\":\"14\",\"executionTime\":1,\"executionStatus\":\"15\",\"data\":\"16\"},{\"startTime\":1756585326084,\"executionIndex\":1,\"source\":\"17\",\"hints\":\"18\",\"executionTime\":1773,\"executionStatus\":\"15\",\"data\":\"19\"},[],[],\"success\",{\"main\":\"20\"},[\"21\"],[],{\"main\":\"22\"},[\"23\"],{\"previousNode\":\"24\"},[\"25\"],[\"26\"],\"Webhook-trigger\",[\"27\"],{\"json\":\"28\",\"pairedItem\":\"29\"},{\"json\":\"30\",\"pairedItem\":\"31\"},{\"headers\":\"32\",\"params\":\"33\",\"query\":\"34\",\"body\":\"35\",\"webhookUrl\":\"36\",\"executionMode\":\"37\"},{\"item\":0},{\"accepted\":\"38\",\"rejected\":\"39\",\"ehlo\":\"40\",\"envelopeTime\":337,\"messageTime\":365,\"messageSize\":400,\"response\":\"41\",\"envelope\":\"42\",\"messageId\":\"43\"},{\"item\":0},{\"host\":\"44\",\"user-agent\":\"45\",\"x-webhook-token\":\"46\",\"content-type\":\"47\",\"content-length\":\"48\"},{},{},{\"text\":\"49\"},\"http://localhost:5678/webhook/send-email\",\"production\",[\"50\"],[],[\"51\",\"52\",\"53\",\"54\",\"55\",\"56\",\"57\",\"58\"],\"250 2.0.0 Ok: queued as 4cDml325qQz1xyY\",{\"from\":\"59\",\"to\":\"60\"},\"<1bbaf23d-4c7e-197d-5d12-fd6e1f9f75a0@aliabrasil.online>\",\"n8n:5678\",\"GuzzleHttp/7\",\"zHKUppUIKKFGBl55\",\"application/json\",\"208\",\"Uma nova nota fiscal foi cadastrada.\\n\\nDescrição: Venda de 15 camisas do Brasil.\\nCategoria Sugerida: roupas\\nResumo: Compra de camisas do Brasil.\\n\\nAcesse o sistema para mais detalhes.\",\"jhonnyjks@gmail.com\",\"PIPELINING\",\"SIZE 48811212\",\"ETRN\",\"AUTH PLAIN LOGIN\",\"ENHANCEDSTATUSCODES\",\"8BITMIME\",\"DSN\",\"CHUNKING\",\"negocios@aliabrasil.online\",[\"50\"]]'),
(10,'{\"id\": \"zHKUppUIKKFGBl55\", \"name\": \"Send email on new nf\", \"nodes\": [{\"id\": \"906ee2f4-9c44-4fe7-a7b1-6fdb21d6e7bc\", \"name\": \"Webhook-trigger\", \"type\": \"n8n-nodes-base.webhook\", \"position\": [0, 0], \"webhookId\": \"a0efeea1-a068-46b3-9b30-f60840b268ef\", \"parameters\": {\"path\": \"send-email\", \"options\": {\"responseData\": \"{\\\"ok\\\": true}\", \"binaryPropertyName\": \"description\"}, \"httpMethod\": \"POST\", \"responseMode\": \"onReceived\", \"authentication\": \"headerAuth\", \"multipleMethods\": false, \"contentTypeNotice\": \"\"}, \"credentials\": {\"httpHeaderAuth\": {\"id\": \"R4bVj09h6TyQjXDV\", \"name\": \"Header Auth account\"}}, \"typeVersion\": 2.1}, {\"id\": \"6d3dba41-c770-47cf-a4e1-a0a7491f881b\", \"name\": \"Send notification email\", \"type\": \"n8n-nodes-base.emailSend\", \"position\": [208, 0], \"webhookId\": \"e8c45ad7-a76b-4958-9e17-efded9e238c6\", \"parameters\": {\"text\": \"={{$json.body.text}}\", \"options\": {\"appendAttribution\": true}, \"subject\": \"Nova nota cadastrada\", \"toEmail\": \"jhonnyjks@gmail.com\", \"resource\": \"email\", \"fromEmail\": \"negocios@aliabrasil.online\", \"operation\": \"send\", \"emailFormat\": \"text\"}, \"credentials\": {\"smtp\": {\"id\": \"j762PvhMNWKdt7Dr\", \"name\": \"SMTP account\"}}, \"typeVersion\": 2.1}], \"active\": false, \"pinData\": {}, \"settings\": {\"executionOrder\": \"v1\"}, \"connections\": {\"Webhook-trigger\": {\"main\": [[{\"node\": \"Send notification email\", \"type\": \"main\", \"index\": 0}]]}}}','[{\"startData\":\"1\",\"resultData\":\"2\",\"executionData\":\"3\"},{\"destinationNode\":\"4\",\"runNodeFilter\":\"5\"},{\"runData\":\"6\",\"pinData\":\"7\",\"lastNodeExecuted\":\"4\"},{\"contextData\":\"8\",\"nodeExecutionStack\":\"9\",\"metadata\":\"10\",\"waitingExecution\":\"11\",\"waitingExecutionSource\":\"12\"},\"Send notification email\",[\"13\",\"4\"],{\"Webhook-trigger\":\"14\",\"Send notification email\":\"15\"},{},{},[],{},{},{},\"Webhook-trigger\",[\"16\"],[\"17\"],{\"startTime\":1756585281966,\"executionIndex\":0,\"source\":\"18\",\"hints\":\"19\",\"executionTime\":1,\"executionStatus\":\"20\",\"data\":\"21\"},{\"startTime\":1756585382082,\"executionIndex\":1,\"source\":\"22\",\"hints\":\"23\",\"executionTime\":3134,\"executionStatus\":\"20\",\"data\":\"24\"},[],[],\"success\",{\"main\":\"25\"},[\"26\"],[],{\"main\":\"27\"},[\"28\"],{\"previousNode\":\"13\",\"previousNodeOutput\":0,\"previousNodeRun\":0},[\"29\"],[\"30\"],[\"31\"],{\"json\":\"32\",\"pairedItem\":\"33\"},{\"json\":\"34\",\"pairedItem\":\"35\"},{\"headers\":\"36\",\"params\":\"37\",\"query\":\"38\",\"body\":\"39\",\"webhookUrl\":\"40\",\"executionMode\":\"41\"},{\"item\":0},{\"accepted\":\"42\",\"rejected\":\"43\",\"ehlo\":\"44\",\"envelopeTime\":689,\"messageTime\":1421,\"messageSize\":376,\"response\":\"45\",\"envelope\":\"46\",\"messageId\":\"47\"},{\"item\":0},{\"accept\":\"48\",\"content-type\":\"48\",\"x-webhook-token\":\"49\",\"user-agent\":\"50\",\"postman-token\":\"51\",\"host\":\"52\",\"accept-encoding\":\"53\",\"connection\":\"54\",\"content-length\":\"55\"},{},{},{\"text\":\"56\"},\"http://localhost:5678/webhook-test/send-email\",\"test\",[\"57\"],[],[\"58\",\"59\",\"60\",\"61\",\"62\",\"63\",\"64\",\"65\"],\"250 2.0.0 Ok: queued as 4cDmm72wyRzHTnH2\",{\"from\":\"66\",\"to\":\"67\"},\"<d3c00e28-8899-ada3-a204-3d1976901e52@aliabrasil.online>\",\"application/json\",\"zHKUppUIKKFGBl55\",\"PostmanRuntime/7.45.0\",\"c8ac5a9d-05ec-40b0-89ce-1d8af1f5c518\",\"localhost:5678\",\"gzip, deflate, br\",\"keep-alive\",\"28\",\"desc cdfdf\",\"jhonnyjks@gmail.com\",\"PIPELINING\",\"SIZE 48811212\",\"ETRN\",\"AUTH PLAIN LOGIN\",\"ENHANCEDSTATUSCODES\",\"8BITMIME\",\"DSN\",\"CHUNKING\",\"negocios@aliabrasil.online\",[\"57\"]]'),
(11,'{\"id\": \"zHKUppUIKKFGBl55\", \"name\": \"Send email on new nf\", \"nodes\": [{\"id\": \"906ee2f4-9c44-4fe7-a7b1-6fdb21d6e7bc\", \"name\": \"Webhook-trigger\", \"type\": \"n8n-nodes-base.webhook\", \"position\": [0, 0], \"webhookId\": \"a0efeea1-a068-46b3-9b30-f60840b268ef\", \"parameters\": {\"path\": \"send-email\", \"options\": {\"responseData\": \"{\\\"ok\\\": true}\", \"binaryPropertyName\": \"description\"}, \"httpMethod\": \"POST\", \"responseMode\": \"onReceived\", \"authentication\": \"headerAuth\", \"multipleMethods\": false, \"contentTypeNotice\": \"\"}, \"credentials\": {\"httpHeaderAuth\": {\"id\": \"R4bVj09h6TyQjXDV\", \"name\": \"Header Auth account\"}}, \"typeVersion\": 2.1}, {\"id\": \"6d3dba41-c770-47cf-a4e1-a0a7491f881b\", \"name\": \"Send-notification-email\", \"type\": \"n8n-nodes-base.emailSend\", \"position\": [208, 0], \"webhookId\": \"e8c45ad7-a76b-4958-9e17-efded9e238c6\", \"parameters\": {\"text\": \"Um cliente cadastrou mais uma nota\", \"options\": {}, \"subject\": \"Nova nota cadastrada\", \"toEmail\": \"jhonnyjks@gmail.com\", \"resource\": \"email\", \"fromEmail\": \"negocios@aliabrasil.online\", \"operation\": \"send\", \"emailFormat\": \"text\"}, \"credentials\": {\"smtp\": {\"id\": \"j762PvhMNWKdt7Dr\", \"name\": \"SMTP account\"}}, \"typeVersion\": 2.1}], \"active\": true, \"pinData\": {}, \"settings\": {\"executionOrder\": \"v1\"}, \"createdAt\": \"2025-08-30T19:46:37.411Z\", \"updatedAt\": \"2025-08-30T20:00:13.000Z\", \"isArchived\": false, \"staticData\": {}, \"connections\": {\"Webhook-trigger\": {\"main\": [[{\"node\": \"Send-notification-email\", \"type\": \"main\", \"index\": 0}]]}}}','[{\"startData\":\"1\",\"resultData\":\"2\",\"executionData\":\"3\"},{},{\"runData\":\"4\",\"lastNodeExecuted\":\"5\"},{\"contextData\":\"6\",\"nodeExecutionStack\":\"7\",\"waitingExecution\":\"8\"},{\"Webhook-trigger\":\"9\",\"Send-notification-email\":\"10\"},\"Send-notification-email\",{},[],{},[\"11\"],[\"12\"],{\"startTime\":1756585899635,\"executionIndex\":0,\"source\":\"13\",\"hints\":\"14\",\"executionTime\":1,\"executionStatus\":\"15\",\"data\":\"16\"},{\"startTime\":1756585899636,\"executionIndex\":1,\"source\":\"17\",\"hints\":\"18\",\"executionTime\":1793,\"executionStatus\":\"15\",\"data\":\"19\"},[],[],\"success\",{\"main\":\"20\"},[\"21\"],[],{\"main\":\"22\"},[\"23\"],{\"previousNode\":\"24\"},[\"25\"],[\"26\"],\"Webhook-trigger\",[\"27\"],{\"json\":\"28\",\"pairedItem\":\"29\"},{\"json\":\"30\",\"pairedItem\":\"31\"},{\"headers\":\"32\",\"params\":\"33\",\"query\":\"34\",\"body\":\"35\",\"webhookUrl\":\"36\",\"executionMode\":\"37\"},{\"item\":0},{\"accepted\":\"38\",\"rejected\":\"39\",\"ehlo\":\"40\",\"envelopeTime\":339,\"messageTime\":483,\"messageSize\":400,\"response\":\"41\",\"envelope\":\"42\",\"messageId\":\"43\"},{\"item\":0},{\"host\":\"44\",\"user-agent\":\"45\",\"x-webhook-token\":\"46\",\"content-type\":\"47\",\"content-length\":\"48\"},{},{},{\"text\":\"49\"},\"http://localhost:5678/webhook/send-email\",\"production\",[\"50\"],[],[\"51\",\"52\",\"53\",\"54\",\"55\",\"56\",\"57\",\"58\"],\"250 2.0.0 Ok: queued as 4cDmy45JCJz1xnX\",{\"from\":\"59\",\"to\":\"60\"},\"<f859e85b-8ccb-736e-16b3-86e439d5cca7@aliabrasil.online>\",\"n8n:5678\",\"GuzzleHttp/7\",\"zHKUppUIKKFGBl55\",\"application/json\",\"281\",\"Uma nova nota fiscal foi cadastrada.\\n\\nDescrição: Venda de 8 itens incluindo hidratante, esponjas e chocolates.\\nCategoria Sugerida: alimentação\\nResumo: Compra de itens variados: snacks e produtos de limpeza.\\n\\nAcesse o sistema para mais detalhes.\",\"jhonnyjks@gmail.com\",\"PIPELINING\",\"SIZE 48811212\",\"ETRN\",\"AUTH PLAIN LOGIN\",\"ENHANCEDSTATUSCODES\",\"8BITMIME\",\"DSN\",\"CHUNKING\",\"negocios@aliabrasil.online\",[\"50\"]]'),
(12,'{\"id\": \"zHKUppUIKKFGBl55\", \"name\": \"Send email on new nf\", \"nodes\": [{\"id\": \"906ee2f4-9c44-4fe7-a7b1-6fdb21d6e7bc\", \"name\": \"Webhook-trigger\", \"type\": \"n8n-nodes-base.webhook\", \"position\": [0, 0], \"webhookId\": \"a0efeea1-a068-46b3-9b30-f60840b268ef\", \"parameters\": {\"path\": \"send-email\", \"options\": {\"responseData\": \"{\\\"ok\\\": true}\", \"binaryPropertyName\": \"description\"}, \"httpMethod\": \"POST\", \"responseMode\": \"onReceived\", \"authentication\": \"headerAuth\", \"multipleMethods\": false, \"contentTypeNotice\": \"\"}, \"credentials\": {\"httpHeaderAuth\": {\"id\": \"R4bVj09h6TyQjXDV\", \"name\": \"Header Auth account\"}}, \"typeVersion\": 2.1}, {\"id\": \"6d3dba41-c770-47cf-a4e1-a0a7491f881b\", \"name\": \"Send notification email\", \"type\": \"n8n-nodes-base.emailSend\", \"position\": [208, 0], \"webhookId\": \"e8c45ad7-a76b-4958-9e17-efded9e238c6\", \"parameters\": {\"text\": \"=Atenção:\\n{{$json.body.text}}\", \"options\": {\"appendAttribution\": true}, \"subject\": \"Nova nota cadastrada\", \"toEmail\": \"jhonnyjks@gmail.com\", \"resource\": \"email\", \"fromEmail\": \"negocios@aliabrasil.online\", \"operation\": \"send\", \"emailFormat\": \"text\"}, \"credentials\": {\"smtp\": {\"id\": \"j762PvhMNWKdt7Dr\", \"name\": \"SMTP account\"}}, \"typeVersion\": 2.1}], \"active\": false, \"pinData\": {}, \"settings\": {\"executionOrder\": \"v1\"}, \"connections\": {\"Webhook-trigger\": {\"main\": [[{\"node\": \"Send notification email\", \"type\": \"main\", \"index\": 0}]]}}}','[{\"startData\":\"1\",\"resultData\":\"2\",\"executionData\":\"3\"},{\"destinationNode\":\"4\",\"runNodeFilter\":\"5\"},{\"runData\":\"6\",\"pinData\":\"7\",\"lastNodeExecuted\":\"4\"},{\"contextData\":\"8\",\"nodeExecutionStack\":\"9\",\"metadata\":\"10\",\"waitingExecution\":\"11\",\"waitingExecutionSource\":\"12\"},\"Send notification email\",[\"13\",\"4\"],{\"Webhook-trigger\":\"14\",\"Send notification email\":\"15\"},{},{},[],{},{},{},\"Webhook-trigger\",[\"16\"],[\"17\"],{\"startTime\":1756585281966,\"executionIndex\":0,\"source\":\"18\",\"hints\":\"19\",\"executionTime\":1,\"executionStatus\":\"20\",\"data\":\"21\"},{\"startTime\":1756586074766,\"executionIndex\":1,\"source\":\"22\",\"hints\":\"23\",\"executionTime\":1639,\"executionStatus\":\"20\",\"data\":\"24\"},[],[],\"success\",{\"main\":\"25\"},[\"26\"],[],{\"main\":\"27\"},[\"28\"],{\"previousNode\":\"13\",\"previousNodeOutput\":0,\"previousNodeRun\":0},[\"29\"],[\"30\"],[\"31\"],{\"json\":\"32\",\"pairedItem\":\"33\"},{\"json\":\"34\",\"pairedItem\":\"35\"},{\"headers\":\"36\",\"params\":\"37\",\"query\":\"38\",\"body\":\"39\",\"webhookUrl\":\"40\",\"executionMode\":\"41\"},{\"item\":0},{\"accepted\":\"42\",\"rejected\":\"43\",\"ehlo\":\"44\",\"envelopeTime\":463,\"messageTime\":286,\"messageSize\":411,\"response\":\"45\",\"envelope\":\"46\",\"messageId\":\"47\"},{\"item\":0},{\"accept\":\"48\",\"content-type\":\"48\",\"x-webhook-token\":\"49\",\"user-agent\":\"50\",\"postman-token\":\"51\",\"host\":\"52\",\"accept-encoding\":\"53\",\"connection\":\"54\",\"content-length\":\"55\"},{},{},{\"text\":\"56\"},\"http://localhost:5678/webhook-test/send-email\",\"test\",[\"57\"],[],[\"58\",\"59\",\"60\",\"61\",\"62\",\"63\",\"64\",\"65\"],\"250 2.0.0 Ok: queued as 4cDn1R5jXZz1xnr\",{\"from\":\"66\",\"to\":\"67\"},\"<c45698ba-2e76-3002-39f9-7b777e4f1c0f@aliabrasil.online>\",\"application/json\",\"zHKUppUIKKFGBl55\",\"PostmanRuntime/7.45.0\",\"c8ac5a9d-05ec-40b0-89ce-1d8af1f5c518\",\"localhost:5678\",\"gzip, deflate, br\",\"keep-alive\",\"28\",\"desc cdfdf\",\"jhonnyjks@gmail.com\",\"PIPELINING\",\"SIZE 48811212\",\"ETRN\",\"AUTH PLAIN LOGIN\",\"ENHANCEDSTATUSCODES\",\"8BITMIME\",\"DSN\",\"CHUNKING\",\"negocios@aliabrasil.online\",[\"57\"]]'),
(13,'{\"id\": \"zHKUppUIKKFGBl55\", \"name\": \"Send email on new nf\", \"nodes\": [{\"id\": \"906ee2f4-9c44-4fe7-a7b1-6fdb21d6e7bc\", \"name\": \"Webhook-trigger\", \"type\": \"n8n-nodes-base.webhook\", \"position\": [0, 0], \"webhookId\": \"a0efeea1-a068-46b3-9b30-f60840b268ef\", \"parameters\": {\"path\": \"send-email\", \"options\": {\"responseData\": \"{\\\"ok\\\": true}\", \"binaryPropertyName\": \"description\"}, \"httpMethod\": \"POST\", \"responseMode\": \"onReceived\", \"authentication\": \"headerAuth\", \"multipleMethods\": false, \"contentTypeNotice\": \"\"}, \"credentials\": {\"httpHeaderAuth\": {\"id\": \"R4bVj09h6TyQjXDV\", \"name\": \"Header Auth account\"}}, \"typeVersion\": 2.1}, {\"id\": \"6d3dba41-c770-47cf-a4e1-a0a7491f881b\", \"name\": \"Send notification email\", \"type\": \"n8n-nodes-base.emailSend\", \"position\": [208, 0], \"webhookId\": \"e8c45ad7-a76b-4958-9e17-efded9e238c6\", \"parameters\": {\"text\": \"={{$json.body.text}}\", \"options\": {\"appendAttribution\": true}, \"subject\": \"Nova nota cadastrada\", \"toEmail\": \"jhonnyjks@gmail.com\", \"resource\": \"email\", \"fromEmail\": \"negocios@aliabrasil.online\", \"operation\": \"send\", \"emailFormat\": \"text\"}, \"credentials\": {\"smtp\": {\"id\": \"j762PvhMNWKdt7Dr\", \"name\": \"SMTP account\"}}, \"typeVersion\": 2.1}], \"active\": false, \"pinData\": {}, \"settings\": {\"executionOrder\": \"v1\"}, \"connections\": {\"Webhook-trigger\": {\"main\": [[{\"node\": \"Send notification email\", \"type\": \"main\", \"index\": 0}]]}}}','[{\"startData\":\"1\",\"resultData\":\"2\",\"executionData\":\"3\"},{\"destinationNode\":\"4\",\"runNodeFilter\":\"5\"},{\"runData\":\"6\",\"pinData\":\"7\",\"lastNodeExecuted\":\"4\"},{\"contextData\":\"8\",\"nodeExecutionStack\":\"9\",\"metadata\":\"10\",\"waitingExecution\":\"11\",\"waitingExecutionSource\":\"12\"},\"Send notification email\",[\"13\",\"4\"],{\"Webhook-trigger\":\"14\",\"Send notification email\":\"15\"},{},{},[],{},{},{},\"Webhook-trigger\",[\"16\"],[\"17\"],{\"startTime\":1756585281966,\"executionIndex\":0,\"source\":\"18\",\"hints\":\"19\",\"executionTime\":1,\"executionStatus\":\"20\",\"data\":\"21\"},{\"startTime\":1756586143113,\"executionIndex\":1,\"source\":\"22\",\"hints\":\"23\",\"executionTime\":1546,\"executionStatus\":\"20\",\"data\":\"24\"},[],[],\"success\",{\"main\":\"25\"},[\"26\"],[],{\"main\":\"27\"},[\"28\"],{\"previousNode\":\"13\",\"previousNodeOutput\":0,\"previousNodeRun\":0},[\"29\"],[\"30\"],[\"31\"],{\"json\":\"32\",\"pairedItem\":\"33\"},{\"json\":\"34\",\"pairedItem\":\"35\"},{\"headers\":\"36\",\"params\":\"37\",\"query\":\"38\",\"body\":\"39\",\"webhookUrl\":\"40\",\"executionMode\":\"41\"},{\"item\":0},{\"accepted\":\"42\",\"rejected\":\"43\",\"ehlo\":\"44\",\"envelopeTime\":353,\"messageTime\":503,\"messageSize\":376,\"response\":\"45\",\"envelope\":\"46\",\"messageId\":\"47\"},{\"item\":0},{\"accept\":\"48\",\"content-type\":\"48\",\"x-webhook-token\":\"49\",\"user-agent\":\"50\",\"postman-token\":\"51\",\"host\":\"52\",\"accept-encoding\":\"53\",\"connection\":\"54\",\"content-length\":\"55\"},{},{},{\"text\":\"56\"},\"http://localhost:5678/webhook-test/send-email\",\"test\",[\"57\"],[],[\"58\",\"59\",\"60\",\"61\",\"62\",\"63\",\"64\",\"65\"],\"250 2.0.0 Ok: queued as 4cDn2l6tgbz1xms\",{\"from\":\"66\",\"to\":\"67\"},\"<6fe8aed7-53f7-5a9a-17a7-d172cdf5a759@aliabrasil.online>\",\"application/json\",\"zHKUppUIKKFGBl55\",\"PostmanRuntime/7.45.0\",\"c8ac5a9d-05ec-40b0-89ce-1d8af1f5c518\",\"localhost:5678\",\"gzip, deflate, br\",\"keep-alive\",\"28\",\"desc cdfdf\",\"jhonnyjks@gmail.com\",\"PIPELINING\",\"SIZE 48811212\",\"ETRN\",\"AUTH PLAIN LOGIN\",\"ENHANCEDSTATUSCODES\",\"8BITMIME\",\"DSN\",\"CHUNKING\",\"negocios@aliabrasil.online\",[\"57\"]]'),
(14,'{\"id\": \"zHKUppUIKKFGBl55\", \"name\": \"Send email on new nf\", \"nodes\": [{\"id\": \"906ee2f4-9c44-4fe7-a7b1-6fdb21d6e7bc\", \"name\": \"Webhook-trigger\", \"type\": \"n8n-nodes-base.webhook\", \"position\": [0, 0], \"webhookId\": \"a0efeea1-a068-46b3-9b30-f60840b268ef\", \"parameters\": {\"path\": \"send-email\", \"options\": {\"responseData\": \"{\\\"ok\\\": true}\", \"binaryPropertyName\": \"description\"}, \"httpMethod\": \"POST\", \"responseMode\": \"onReceived\", \"authentication\": \"headerAuth\", \"multipleMethods\": false, \"contentTypeNotice\": \"\"}, \"credentials\": {\"httpHeaderAuth\": {\"id\": \"R4bVj09h6TyQjXDV\", \"name\": \"Header Auth account\"}}, \"typeVersion\": 2.1}, {\"id\": \"6d3dba41-c770-47cf-a4e1-a0a7491f881b\", \"name\": \"Send notification email\", \"type\": \"n8n-nodes-base.emailSend\", \"position\": [208, 0], \"webhookId\": \"e8c45ad7-a76b-4958-9e17-efded9e238c6\", \"parameters\": {\"text\": \"={{$json.body.text}}\", \"options\": {\"appendAttribution\": true}, \"subject\": \"Nova nota cadastrada\", \"toEmail\": \"jhonnyjks@gmail.com\", \"resource\": \"email\", \"fromEmail\": \"negocios@aliabrasil.online\", \"operation\": \"send\", \"emailFormat\": \"text\"}, \"credentials\": {\"smtp\": {\"id\": \"j762PvhMNWKdt7Dr\", \"name\": \"SMTP account\"}}, \"typeVersion\": 2.1}], \"active\": true, \"pinData\": {}, \"settings\": {\"executionOrder\": \"v1\"}, \"createdAt\": \"2025-08-30T19:46:37.411Z\", \"updatedAt\": \"2025-08-30T20:35:59.000Z\", \"isArchived\": false, \"staticData\": {}, \"connections\": {\"Webhook-trigger\": {\"main\": [[{\"node\": \"Send notification email\", \"type\": \"main\", \"index\": 0}]]}}}','[{\"startData\":\"1\",\"resultData\":\"2\",\"executionData\":\"3\"},{},{\"runData\":\"4\",\"lastNodeExecuted\":\"5\"},{\"contextData\":\"6\",\"nodeExecutionStack\":\"7\",\"waitingExecution\":\"8\"},{\"Webhook-trigger\":\"9\",\"Send notification email\":\"10\"},\"Send notification email\",{},[],{},[\"11\"],[\"12\"],{\"startTime\":1756586185424,\"executionIndex\":0,\"source\":\"13\",\"hints\":\"14\",\"executionTime\":0,\"executionStatus\":\"15\",\"data\":\"16\"},{\"startTime\":1756586185424,\"executionIndex\":1,\"source\":\"17\",\"hints\":\"18\",\"executionTime\":1848,\"executionStatus\":\"15\",\"data\":\"19\"},[],[],\"success\",{\"main\":\"20\"},[\"21\"],[],{\"main\":\"22\"},[\"23\"],{\"previousNode\":\"24\"},[\"25\"],[\"26\"],\"Webhook-trigger\",[\"27\"],{\"json\":\"28\",\"pairedItem\":\"29\"},{\"json\":\"30\",\"pairedItem\":\"31\"},{\"headers\":\"32\",\"params\":\"33\",\"query\":\"34\",\"body\":\"35\",\"webhookUrl\":\"36\",\"executionMode\":\"37\"},{\"item\":0},{\"accepted\":\"38\",\"rejected\":\"39\",\"ehlo\":\"40\",\"envelopeTime\":555,\"messageTime\":309,\"messageSize\":620,\"response\":\"41\",\"envelope\":\"42\",\"messageId\":\"43\"},{\"item\":0},{\"host\":\"44\",\"user-agent\":\"45\",\"x-webhook-token\":\"46\",\"content-type\":\"47\",\"content-length\":\"48\"},{},{},{\"text\":\"49\"},\"http://localhost:5678/webhook/send-email\",\"production\",[\"50\"],[],[\"51\",\"52\",\"53\",\"54\",\"55\",\"56\",\"57\",\"58\"],\"250 2.0.0 Ok: queued as 4cDn3Z5LWNzHTq4c\",{\"from\":\"59\",\"to\":\"60\"},\"<47f24535-6f5f-b7d3-5d56-c30a2e3d36f2@aliabrasil.online>\",\"n8n:5678\",\"GuzzleHttp/7\",\"zHKUppUIKKFGBl55\",\"application/json\",\"247\",\"Uma nova nota fiscal foi cadastrada.\\n\\nDescrição: Venda de 15 camisetas do Brasil a R$10,00 cada.\\nCategoria Sugerida: moda\\nResumo: Compra de camisetas da seleção brasileira.\\n\\nAcesse o sistema para mais detalhes.\",\"jhonnyjks@gmail.com\",\"PIPELINING\",\"SIZE 48811212\",\"ETRN\",\"AUTH PLAIN LOGIN\",\"ENHANCEDSTATUSCODES\",\"8BITMIME\",\"DSN\",\"CHUNKING\",\"negocios@aliabrasil.online\",[\"50\"]]'),
(15,'{\"id\": \"zHKUppUIKKFGBl55\", \"name\": \"Send email on new nf\", \"nodes\": [{\"id\": \"906ee2f4-9c44-4fe7-a7b1-6fdb21d6e7bc\", \"name\": \"Webhook-trigger\", \"type\": \"n8n-nodes-base.webhook\", \"position\": [0, 0], \"webhookId\": \"a0efeea1-a068-46b3-9b30-f60840b268ef\", \"parameters\": {\"path\": \"send-email\", \"options\": {\"responseData\": \"{\\\"ok\\\": true}\", \"binaryPropertyName\": \"description\"}, \"httpMethod\": \"POST\", \"responseMode\": \"onReceived\", \"authentication\": \"headerAuth\", \"multipleMethods\": false, \"contentTypeNotice\": \"\"}, \"credentials\": {\"httpHeaderAuth\": {\"id\": \"R4bVj09h6TyQjXDV\", \"name\": \"Header Auth account\"}}, \"typeVersion\": 2.1}, {\"id\": \"6d3dba41-c770-47cf-a4e1-a0a7491f881b\", \"name\": \"Send notification email\", \"type\": \"n8n-nodes-base.emailSend\", \"position\": [208, 0], \"webhookId\": \"e8c45ad7-a76b-4958-9e17-efded9e238c6\", \"parameters\": {\"text\": \"={{$json.body.text}}\", \"options\": {\"appendAttribution\": true}, \"subject\": \"Nova nota cadastrada\", \"toEmail\": \"jhonnyjks@gmail.com\", \"resource\": \"email\", \"fromEmail\": \"negocios@aliabrasil.online\", \"operation\": \"send\", \"emailFormat\": \"text\"}, \"credentials\": {\"smtp\": {\"id\": \"j762PvhMNWKdt7Dr\", \"name\": \"SMTP account\"}}, \"typeVersion\": 2.1}], \"active\": true, \"pinData\": {}, \"settings\": {\"executionOrder\": \"v1\"}, \"createdAt\": \"2025-08-30T19:46:37.411Z\", \"updatedAt\": \"2025-08-30T20:35:59.000Z\", \"isArchived\": false, \"staticData\": {}, \"connections\": {\"Webhook-trigger\": {\"main\": [[{\"node\": \"Send notification email\", \"type\": \"main\", \"index\": 0}]]}}}','[{\"startData\":\"1\",\"resultData\":\"2\",\"executionData\":\"3\"},{},{\"runData\":\"4\",\"lastNodeExecuted\":\"5\"},{\"contextData\":\"6\",\"nodeExecutionStack\":\"7\",\"waitingExecution\":\"8\"},{\"Webhook-trigger\":\"9\",\"Send notification email\":\"10\"},\"Send notification email\",{},[],{},[\"11\"],[\"12\"],{\"startTime\":1756586259557,\"executionIndex\":0,\"source\":\"13\",\"hints\":\"14\",\"executionTime\":0,\"executionStatus\":\"15\",\"data\":\"16\"},{\"startTime\":1756586259558,\"executionIndex\":1,\"source\":\"17\",\"hints\":\"18\",\"executionTime\":1794,\"executionStatus\":\"15\",\"data\":\"19\"},[],[],\"success\",{\"main\":\"20\"},[\"21\"],[],{\"main\":\"22\"},[\"23\"],{\"previousNode\":\"24\"},[\"25\"],[\"26\"],\"Webhook-trigger\",[\"27\"],{\"json\":\"28\",\"pairedItem\":\"29\"},{\"json\":\"30\",\"pairedItem\":\"31\"},{\"headers\":\"32\",\"params\":\"33\",\"query\":\"34\",\"body\":\"35\",\"webhookUrl\":\"36\",\"executionMode\":\"37\"},{\"item\":0},{\"accepted\":\"38\",\"rejected\":\"39\",\"ehlo\":\"40\",\"envelopeTime\":335,\"messageTime\":484,\"messageSize\":1265,\"response\":\"41\",\"envelope\":\"42\",\"messageId\":\"43\"},{\"item\":0},{\"host\":\"44\",\"user-agent\":\"45\",\"x-webhook-token\":\"46\",\"content-type\":\"47\",\"content-length\":\"48\"},{},{},{\"text\":\"49\"},\"http://localhost:5678/webhook/send-email\",\"production\",[\"50\"],[],[\"51\",\"52\",\"53\",\"54\",\"55\",\"56\",\"57\",\"58\"],\"250 2.0.0 Ok: queued as 4cDn504rqGz1xnm\",{\"from\":\"59\",\"to\":\"60\"},\"<450c54ef-ea9f-d1b0-693f-e634f6e63a2e@aliabrasil.online>\",\"n8n:5678\",\"GuzzleHttp/7\",\"zHKUppUIKKFGBl55\",\"application/json\",\"881\",\"Uma nova nota fiscal foi cadastrada.\\n\\nNota: 001 08871124 HIDRAT JOHNSONS SOFT dun Fi 10,39)\\n\\n002 07361742 ESPONJA BRITE 3M dun Fi 6,29)\\n003 09169717 CHOC KINDER OVO MENT jun Fi 5,49)\\n004 04848446 CHOC LEITE MM SINGLE jun Fi 1,99)\\n005 08312966 ESPONJA N RISCA S SC lun Fi 6,99)\\n006 03362345 GOMA MASCAR TRIDENT jun Fi 1,49)\\n007 03362345 GOMA MASCAR TRIDENT dun Fi 1,49)\\n008_00690945 PANO h USO S-BRITE A tun T19,00% 6,99)\\nTOTAL frees ee ID At, io\\nTE 41,12\\n\\nENVIE SMS P/ 6789: 81536600100613248875200\\n\\nValor dos Impostos: R$10,76 (26,17%)\\nITEM(S) COMPRADOS 8\\n\\nNR PDV.:26 NR. CUPOM: 65565\\n\\nNo - TRACT! NA 901714697\\n\\nDescrição: Venda de 1 hidratante, 2 esponjas, 3 chocolates, 2 gomas de mascar e 1 pano de uso.\\nCategoria Sugerida: alimentação\\nResumo: Compra de itens de higiene e snacks.\\n\\nAcesse o sistema para mais detalhes.\",\"jhonnyjks@gmail.com\",\"PIPELINING\",\"SIZE 48811212\",\"ETRN\",\"AUTH PLAIN LOGIN\",\"ENHANCEDSTATUSCODES\",\"8BITMIME\",\"DSN\",\"CHUNKING\",\"negocios@aliabrasil.online\",[\"50\"]]'),
(16,'{\"id\": \"zHKUppUIKKFGBl55\", \"name\": \"Send email on new nf\", \"nodes\": [{\"id\": \"906ee2f4-9c44-4fe7-a7b1-6fdb21d6e7bc\", \"name\": \"Webhook-trigger\", \"type\": \"n8n-nodes-base.webhook\", \"position\": [0, 0], \"webhookId\": \"a0efeea1-a068-46b3-9b30-f60840b268ef\", \"parameters\": {\"path\": \"send-email\", \"options\": {\"responseData\": \"{\\\"ok\\\": true}\", \"binaryPropertyName\": \"description\"}, \"httpMethod\": \"POST\", \"responseMode\": \"onReceived\", \"authentication\": \"headerAuth\", \"multipleMethods\": false, \"contentTypeNotice\": \"\"}, \"credentials\": {\"httpHeaderAuth\": {\"id\": \"R4bVj09h6TyQjXDV\", \"name\": \"Header Auth account\"}}, \"typeVersion\": 2.1}, {\"id\": \"6d3dba41-c770-47cf-a4e1-a0a7491f881b\", \"name\": \"Send notification email\", \"type\": \"n8n-nodes-base.emailSend\", \"position\": [208, 0], \"webhookId\": \"e8c45ad7-a76b-4958-9e17-efded9e238c6\", \"parameters\": {\"text\": \"={{$json.body.text}}\", \"options\": {\"appendAttribution\": true}, \"subject\": \"Nova nota cadastrada\", \"toEmail\": \"jhonnyjks@gmail.com\", \"resource\": \"email\", \"fromEmail\": \"negocios@aliabrasil.online\", \"operation\": \"send\", \"emailFormat\": \"text\"}, \"credentials\": {\"smtp\": {\"id\": \"j762PvhMNWKdt7Dr\", \"name\": \"SMTP account\"}}, \"typeVersion\": 2.1}], \"active\": true, \"pinData\": {}, \"settings\": {\"executionOrder\": \"v1\"}, \"createdAt\": \"2025-08-30T19:46:37.411Z\", \"updatedAt\": \"2025-08-30T20:35:59.000Z\", \"isArchived\": false, \"staticData\": {}, \"connections\": {\"Webhook-trigger\": {\"main\": [[{\"node\": \"Send notification email\", \"type\": \"main\", \"index\": 0}]]}}}','[{\"startData\":\"1\",\"resultData\":\"2\",\"executionData\":\"3\"},{},{\"runData\":\"4\",\"lastNodeExecuted\":\"5\"},{\"contextData\":\"6\",\"nodeExecutionStack\":\"7\",\"waitingExecution\":\"8\"},{\"Webhook-trigger\":\"9\",\"Send notification email\":\"10\"},\"Send notification email\",{},[],{},[\"11\"],[\"12\"],{\"startTime\":1756586392064,\"executionIndex\":0,\"source\":\"13\",\"hints\":\"14\",\"executionTime\":0,\"executionStatus\":\"15\",\"data\":\"16\"},{\"startTime\":1756586392065,\"executionIndex\":1,\"source\":\"17\",\"hints\":\"18\",\"executionTime\":2088,\"executionStatus\":\"15\",\"data\":\"19\"},[],[],\"success\",{\"main\":\"20\"},[\"21\"],[],{\"main\":\"22\"},[\"23\"],{\"previousNode\":\"24\"},[\"25\"],[\"26\"],\"Webhook-trigger\",[\"27\"],{\"json\":\"28\",\"pairedItem\":\"29\"},{\"json\":\"30\",\"pairedItem\":\"31\"},{\"headers\":\"32\",\"params\":\"33\",\"query\":\"34\",\"body\":\"35\",\"webhookUrl\":\"36\",\"executionMode\":\"37\"},{\"item\":0},{\"accepted\":\"38\",\"rejected\":\"39\",\"ehlo\":\"40\",\"envelopeTime\":616,\"messageTime\":704,\"messageSize\":1315,\"response\":\"41\",\"envelope\":\"42\",\"messageId\":\"43\"},{\"item\":0},{\"host\":\"44\",\"user-agent\":\"45\",\"x-webhook-token\":\"46\",\"content-type\":\"47\",\"content-length\":\"48\"},{},{},{\"text\":\"49\"},\"http://localhost:5678/webhook/send-email\",\"production\",[\"50\"],[],[\"51\",\"52\",\"53\",\"54\",\"55\",\"56\",\"57\",\"58\"],\"250 2.0.0 Ok: queued as 4cDn7X7352z1xnm\",{\"from\":\"59\",\"to\":\"60\"},\"<4458cb52-aa1c-7c62-418d-c34a1bf9a785@aliabrasil.online>\",\"n8n:5678\",\"GuzzleHttp/7\",\"zHKUppUIKKFGBl55\",\"application/json\",\"929\",\"Uma nova nota fiscal foi cadastrada.\\n\\n--- Nota: --- \\n001 08871124 HIDRAT JOHNSONS SOFT dun Fi 10,39)\\n\\n002 07361742 ESPONJA BRITE 3M dun Fi 6,29)\\n003 09169717 CHOC KINDER OVO MENT jun Fi 5,49)\\n004 04848446 CHOC LEITE MM SINGLE jun Fi 1,99)\\n005 08312966 ESPONJA N RISCA S SC lun Fi 6,99)\\n006 03362345 GOMA MASCAR TRIDENT jun Fi 1,49)\\n007 03362345 GOMA MASCAR TRIDENT dun Fi 1,49)\\n008_00690945 PANO h USO S-BRITE A tun T19,00% 6,99)\\nTOTAL frees ee ID At, io\\nTE 41,12\\n\\nENVIE SMS P/ 6789: 81536600100613248875200\\n\\nValor dos Impostos: R$10,76 (26,17%)\\nITEM(S) COMPRADOS 8\\n\\nNR PDV.:26 NR. CUPOM: 65565\\n\\nNo - TRACT! NA 901714697\\n\\n--- Descrição: ---\\nVenda de 1 hidratante, 2 esponjas, 3 chocolates, 2 gomas de mascar e 1 pano de uso.\\n--- Categoria Sugerida: ---\\nhigiene e alimentação\\n--- Resumo:  ---\\nCompra de itens de higiene e snacks.\\n\\nAcesse o sistema para mais detalhes.\",\"jhonnyjks@gmail.com\",\"PIPELINING\",\"SIZE 48811212\",\"ETRN\",\"AUTH PLAIN LOGIN\",\"ENHANCEDSTATUSCODES\",\"8BITMIME\",\"DSN\",\"CHUNKING\",\"negocios@aliabrasil.online\",[\"50\"]]');
/*!40000 ALTER TABLE `execution_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `execution_entity`
--

DROP TABLE IF EXISTS `execution_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `execution_entity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `finished` tinyint NOT NULL,
  `mode` varchar(255) NOT NULL,
  `retryOf` varchar(255) DEFAULT NULL,
  `retrySuccessId` varchar(255) DEFAULT NULL,
  `startedAt` datetime DEFAULT NULL,
  `stoppedAt` datetime DEFAULT NULL,
  `waitTill` datetime DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `workflowId` varchar(36) NOT NULL,
  `deletedAt` datetime(3) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  KEY `IDX_execution_entity_deletedAt` (`deletedAt`),
  KEY `IDX_execution_entity_workflowId_startedAt` (`workflowId`,`startedAt`),
  KEY `IDX_execution_entity_waitTill_status_deletedAt` (`waitTill`,`status`,`deletedAt`),
  KEY `IDX_execution_entity_stoppedAt_status_deletedAt` (`stoppedAt`,`status`,`deletedAt`),
  CONSTRAINT `fk_execution_entity_workflow_id` FOREIGN KEY (`workflowId`) REFERENCES `workflow_entity` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `execution_entity`
--

LOCK TABLES `execution_entity` WRITE;
/*!40000 ALTER TABLE `execution_entity` DISABLE KEYS */;
INSERT INTO `execution_entity` VALUES
(1,1,'manual',NULL,NULL,'2025-08-30 19:56:20','2025-08-30 19:56:20',NULL,'success','zHKUppUIKKFGBl55',NULL,'2025-08-30 19:56:17.545'),
(2,1,'manual',NULL,NULL,'2025-08-30 19:57:59','2025-08-30 19:57:59',NULL,'success','zHKUppUIKKFGBl55',NULL,'2025-08-30 19:57:58.539'),
(3,1,'manual',NULL,NULL,'2025-08-30 19:59:20','2025-08-30 19:59:20',NULL,'success','zHKUppUIKKFGBl55',NULL,'2025-08-30 19:59:20.033'),
(4,1,'webhook',NULL,NULL,'2025-08-30 20:00:46','2025-08-30 20:00:48',NULL,'success','zHKUppUIKKFGBl55',NULL,'2025-08-30 20:00:45.946'),
(5,1,'webhook',NULL,NULL,'2025-08-30 20:02:11','2025-08-30 20:02:13',NULL,'success','zHKUppUIKKFGBl55',NULL,'2025-08-30 20:02:11.363'),
(6,1,'webhook',NULL,NULL,'2025-08-30 20:17:18','2025-08-30 20:17:20',NULL,'success','zHKUppUIKKFGBl55',NULL,'2025-08-30 20:17:17.862'),
(7,1,'webhook',NULL,NULL,'2025-08-30 20:20:52','2025-08-30 20:20:53',NULL,'success','zHKUppUIKKFGBl55',NULL,'2025-08-30 20:20:51.884'),
(8,1,'manual',NULL,NULL,'2025-08-30 20:21:22','2025-08-30 20:21:23',NULL,'success','zHKUppUIKKFGBl55',NULL,'2025-08-30 20:21:21.944'),
(9,1,'webhook',NULL,NULL,'2025-08-30 20:22:06','2025-08-30 20:22:08',NULL,'success','zHKUppUIKKFGBl55',NULL,'2025-08-30 20:22:06.061'),
(10,1,'manual',NULL,NULL,'2025-08-30 20:23:02','2025-08-30 20:23:05',NULL,'success','zHKUppUIKKFGBl55',NULL,'2025-08-30 20:23:02.060'),
(11,1,'webhook',NULL,NULL,'2025-08-30 20:31:40','2025-08-30 20:31:41',NULL,'success','zHKUppUIKKFGBl55',NULL,'2025-08-30 20:31:39.614'),
(12,1,'manual',NULL,NULL,'2025-08-30 20:34:35','2025-08-30 20:34:36',NULL,'success','zHKUppUIKKFGBl55',NULL,'2025-08-30 20:34:34.739'),
(13,1,'manual',NULL,NULL,'2025-08-30 20:35:43','2025-08-30 20:35:45',NULL,'success','zHKUppUIKKFGBl55',NULL,'2025-08-30 20:35:43.093'),
(14,1,'webhook',NULL,NULL,'2025-08-30 20:36:25','2025-08-30 20:36:27',NULL,'success','zHKUppUIKKFGBl55',NULL,'2025-08-30 20:36:25.406'),
(15,1,'webhook',NULL,NULL,'2025-08-30 20:37:40','2025-08-30 20:37:41',NULL,'success','zHKUppUIKKFGBl55',NULL,'2025-08-30 20:37:39.539'),
(16,1,'webhook',NULL,NULL,'2025-08-30 20:39:52','2025-08-30 20:39:54',NULL,'success','zHKUppUIKKFGBl55',NULL,'2025-08-30 20:39:52.045');
/*!40000 ALTER TABLE `execution_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `execution_metadata`
--

DROP TABLE IF EXISTS `execution_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `execution_metadata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `executionId` int NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_cec8eea3bf49551482ccb4933e` (`executionId`,`key`),
  CONSTRAINT `0nTGAcBG7XWGi1ME-VzRX` FOREIGN KEY (`executionId`) REFERENCES `execution_entity` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `execution_metadata`
--

LOCK TABLES `execution_metadata` WRITE;
/*!40000 ALTER TABLE `execution_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `execution_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder`
--

DROP TABLE IF EXISTS `folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `folder` (
  `id` varchar(36) NOT NULL,
  `name` varchar(128) NOT NULL,
  `parentFolderId` varchar(36) DEFAULT NULL,
  `projectId` varchar(36) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_14f68deffaf858465715995508` (`projectId`,`id`),
  KEY `FK_804ea52f6729e3940498bd54d78` (`parentFolderId`),
  CONSTRAINT `FK_804ea52f6729e3940498bd54d78` FOREIGN KEY (`parentFolderId`) REFERENCES `folder` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_a8260b0b36939c6247f385b8221` FOREIGN KEY (`projectId`) REFERENCES `project` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder`
--

LOCK TABLES `folder` WRITE;
/*!40000 ALTER TABLE `folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder_tag`
--

DROP TABLE IF EXISTS `folder_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `folder_tag` (
  `folderId` varchar(36) NOT NULL,
  `tagId` varchar(36) NOT NULL,
  PRIMARY KEY (`folderId`,`tagId`),
  KEY `FK_dc88164176283de80af47621746` (`tagId`),
  CONSTRAINT `FK_94a60854e06f2897b2e0d39edba` FOREIGN KEY (`folderId`) REFERENCES `folder` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_dc88164176283de80af47621746` FOREIGN KEY (`tagId`) REFERENCES `tag_entity` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder_tag`
--

LOCK TABLES `folder_tag` WRITE;
/*!40000 ALTER TABLE `folder_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `folder_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insights_by_period`
--

DROP TABLE IF EXISTS `insights_by_period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `insights_by_period` (
  `id` int NOT NULL AUTO_INCREMENT,
  `metaId` int NOT NULL,
  `type` int NOT NULL COMMENT '0: time_saved_minutes, 1: runtime_milliseconds, 2: success, 3: failure',
  `value` int NOT NULL,
  `periodUnit` int NOT NULL COMMENT '0: hour, 1: day, 2: week',
  `periodStart` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_60b6a84299eeb3f671dfec7693` (`periodStart`,`type`,`periodUnit`,`metaId`),
  KEY `FK_6414cfed98daabbfdd61a1cfbc0` (`metaId`),
  CONSTRAINT `FK_6414cfed98daabbfdd61a1cfbc0` FOREIGN KEY (`metaId`) REFERENCES `insights_metadata` (`metaId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insights_by_period`
--

LOCK TABLES `insights_by_period` WRITE;
/*!40000 ALTER TABLE `insights_by_period` DISABLE KEYS */;
/*!40000 ALTER TABLE `insights_by_period` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insights_metadata`
--

DROP TABLE IF EXISTS `insights_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `insights_metadata` (
  `metaId` int NOT NULL AUTO_INCREMENT,
  `workflowId` varchar(16) DEFAULT NULL,
  `projectId` varchar(36) DEFAULT NULL,
  `workflowName` varchar(128) NOT NULL,
  `projectName` varchar(255) NOT NULL,
  PRIMARY KEY (`metaId`),
  UNIQUE KEY `IDX_1d8ab99d5861c9388d2dc1cf73` (`workflowId`),
  KEY `FK_2375a1eda085adb16b24615b69c` (`projectId`),
  CONSTRAINT `FK_1d8ab99d5861c9388d2dc1cf733` FOREIGN KEY (`workflowId`) REFERENCES `workflow_entity` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_2375a1eda085adb16b24615b69c` FOREIGN KEY (`projectId`) REFERENCES `project` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insights_metadata`
--

LOCK TABLES `insights_metadata` WRITE;
/*!40000 ALTER TABLE `insights_metadata` DISABLE KEYS */;
INSERT INTO `insights_metadata` VALUES
(1,'zHKUppUIKKFGBl55','VvDa07rL5RDo4nJX','Send email on new nf','Jhonny Mesquita <jhonnyjks@gmail.com>');
/*!40000 ALTER TABLE `insights_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insights_raw`
--

DROP TABLE IF EXISTS `insights_raw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `insights_raw` (
  `id` int NOT NULL AUTO_INCREMENT,
  `metaId` int NOT NULL,
  `type` int NOT NULL COMMENT '0: time_saved_minutes, 1: runtime_milliseconds, 2: success, 3: failure',
  `value` int NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_6e2e33741adef2a7c5d66befa4e` (`metaId`),
  CONSTRAINT `FK_6e2e33741adef2a7c5d66befa4e` FOREIGN KEY (`metaId`) REFERENCES `insights_metadata` (`metaId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insights_raw`
--

LOCK TABLES `insights_raw` WRITE;
/*!40000 ALTER TABLE `insights_raw` DISABLE KEYS */;
INSERT INTO `insights_raw` VALUES
(1,1,2,1,'2025-08-30 20:00:48'),
(2,1,1,1969,'2025-08-30 20:00:48'),
(3,1,2,1,'2025-08-30 20:02:13'),
(4,1,1,1455,'2025-08-30 20:02:13'),
(5,1,2,1,'2025-08-30 20:17:20'),
(6,1,1,2071,'2025-08-30 20:17:20'),
(7,1,2,1,'2025-08-30 20:20:53'),
(8,1,1,1253,'2025-08-30 20:20:53'),
(9,1,2,1,'2025-08-30 20:22:08'),
(10,1,1,1776,'2025-08-30 20:22:08'),
(11,1,2,1,'2025-08-30 20:31:41'),
(12,1,1,1795,'2025-08-30 20:31:41'),
(13,1,2,1,'2025-08-30 20:36:27'),
(14,1,1,1850,'2025-08-30 20:36:27'),
(15,1,2,1,'2025-08-30 20:37:41'),
(16,1,1,1797,'2025-08-30 20:37:41'),
(17,1,2,1,'2025-08-30 20:39:54'),
(18,1,1,2090,'2025-08-30 20:39:54');
/*!40000 ALTER TABLE `insights_raw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `installed_nodes`
--

DROP TABLE IF EXISTS `installed_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `installed_nodes` (
  `name` char(200) NOT NULL,
  `type` char(200) NOT NULL,
  `latestVersion` int NOT NULL DEFAULT '1',
  `package` char(214) NOT NULL,
  PRIMARY KEY (`name`),
  KEY `FK_73f857fc5dce682cef8a99c11dbddbc969618951` (`package`),
  CONSTRAINT `FK_73f857fc5dce682cef8a99c11dbddbc969618951` FOREIGN KEY (`package`) REFERENCES `installed_packages` (`packageName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `installed_nodes`
--

LOCK TABLES `installed_nodes` WRITE;
/*!40000 ALTER TABLE `installed_nodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `installed_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `installed_packages`
--

DROP TABLE IF EXISTS `installed_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `installed_packages` (
  `packageName` char(214) NOT NULL,
  `installedVersion` char(50) NOT NULL,
  `authorName` char(70) DEFAULT NULL,
  `authorEmail` char(70) DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`packageName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `installed_packages`
--

LOCK TABLES `installed_packages` WRITE;
/*!40000 ALTER TABLE `installed_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `installed_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invalid_auth_token`
--

DROP TABLE IF EXISTS `invalid_auth_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `invalid_auth_token` (
  `token` varchar(512) NOT NULL,
  `expiresAt` datetime(3) NOT NULL,
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invalid_auth_token`
--

LOCK TABLES `invalid_auth_token` WRITE;
/*!40000 ALTER TABLE `invalid_auth_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `invalid_auth_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `timestamp` bigint NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES
(1,1588157391238,'InitialMigration1588157391238'),
(2,1592447867632,'WebhookModel1592447867632'),
(3,1594902918301,'CreateIndexStoppedAt1594902918301'),
(4,1607431743767,'MakeStoppedAtNullable1607431743767'),
(5,1611149998770,'AddWebhookId1611149998770'),
(6,1615306975123,'ChangeDataSize1615306975123'),
(7,1617268711084,'CreateTagEntity1617268711084'),
(8,1620729500000,'ChangeCredentialDataSize1620729500000'),
(9,1620826335440,'UniqueWorkflowNames1620826335440'),
(10,1623936588000,'CertifyCorrectCollation1623936588000'),
(11,1626183952959,'AddWaitColumnId1626183952959'),
(12,1630451444017,'UpdateWorkflowCredentials1630451444017'),
(13,1644424784709,'AddExecutionEntityIndexes1644424784709'),
(14,1646992772331,'CreateUserManagement1646992772331'),
(15,1648740597343,'LowerCaseUserEmail1648740597343'),
(16,1652254514003,'CommunityNodes1652254514003'),
(17,1652367743993,'AddUserSettings1652367743993'),
(18,1652905585850,'AddAPIKeyColumn1652905585850'),
(19,1654090101303,'IntroducePinData1654090101303'),
(20,1658932910559,'AddNodeIds1658932910559'),
(21,1659895550980,'AddJsonKeyPinData1659895550980'),
(22,1660062385367,'CreateCredentialsUserRole1660062385367'),
(23,1663755770894,'CreateWorkflowsEditorRole1663755770894'),
(24,1664196174002,'WorkflowStatistics1664196174002'),
(25,1665484192213,'CreateCredentialUsageTable1665484192213'),
(26,1665754637026,'RemoveCredentialUsageTable1665754637026'),
(27,1669739707125,'AddWorkflowVersionIdColumn1669739707125'),
(28,1669823906994,'AddTriggerCountColumn1669823906994'),
(29,1671535397530,'MessageEventBusDestinations1671535397530'),
(30,1671726148420,'RemoveWorkflowDataLoadedFlag1671726148420'),
(31,1673268682475,'DeleteExecutionsWithWorkflows1673268682475'),
(32,1674138566000,'AddStatusToExecutions1674138566000'),
(33,1674509946020,'CreateLdapEntities1674509946020'),
(34,1675940580449,'PurgeInvalidWorkflowConnections1675940580449'),
(35,1676996103000,'MigrateExecutionStatus1676996103000'),
(36,1677236788851,'UpdateRunningExecutionStatus1677236788851'),
(37,1677501636753,'CreateVariables1677501636753'),
(38,1679416281779,'CreateExecutionMetadataTable1679416281779'),
(39,1681134145996,'AddUserActivatedProperty1681134145996'),
(40,1681134145997,'RemoveSkipOwnerSetup1681134145997'),
(41,1690000000001,'MigrateIntegerKeysToString1690000000001'),
(42,1690000000030,'SeparateExecutionData1690000000030'),
(43,1690000000030,'RemoveResetPasswordColumns1690000000030'),
(44,1690000000030,'AddMfaColumns1690000000030'),
(45,1690000000031,'FixExecutionDataType1690000000031'),
(46,1691088862123,'CreateWorkflowNameIndex1691088862123'),
(47,1692967111175,'CreateWorkflowHistoryTable1692967111175'),
(48,1693491613982,'ExecutionSoftDelete1693491613982'),
(49,1693554410387,'DisallowOrphanExecutions1693554410387'),
(50,1695128658538,'AddWorkflowMetadata1695128658538'),
(51,1695829275184,'ModifyWorkflowHistoryNodesAndConnections1695829275184'),
(52,1700571993961,'AddGlobalAdminRole1700571993961'),
(53,1705429061930,'DropRoleMapping1705429061930'),
(54,1711018413374,'RemoveFailedExecutionStatus1711018413374'),
(55,1711390882123,'MoveSshKeysToDatabase1711390882123'),
(56,1712044305787,'RemoveNodesAccess1712044305787'),
(57,1714133768519,'CreateProject1714133768519'),
(58,1714133768521,'MakeExecutionStatusNonNullable1714133768521'),
(59,1717498465931,'AddActivatedAtUserSetting1717498465931'),
(60,1720101653148,'AddConstraintToExecutionMetadata1720101653148'),
(61,1723627610222,'CreateInvalidAuthTokenTable1723627610222'),
(62,1723796243146,'RefactorExecutionIndices1723796243146'),
(63,1724753530828,'CreateAnnotationTables1724753530828'),
(64,1724951148974,'AddApiKeysTable1724951148974'),
(65,1726606152711,'CreateProcessedDataTable1726606152711'),
(66,1727427440136,'SeparateExecutionCreationFromStart1727427440136'),
(67,1728659839644,'AddMissingPrimaryKeyOnAnnotationTagMapping1728659839644'),
(68,1729607673464,'UpdateProcessedDataValueColumnToText1729607673464'),
(69,1729607673469,'AddProjectIcons1729607673469'),
(70,1730386903556,'CreateTestDefinitionTable1730386903556'),
(71,1731404028106,'AddDescriptionToTestDefinition1731404028106'),
(72,1731582748663,'MigrateTestDefinitionKeyToString1731582748663'),
(73,1732271325258,'CreateTestMetricTable1732271325258'),
(74,1732549866705,'CreateTestRun1732549866705'),
(75,1733133775640,'AddMockedNodesColumnToTestDefinition1733133775640'),
(76,1734479635324,'AddManagedColumnToCredentialsTable1734479635324'),
(77,1736172058779,'AddStatsColumnsToTestRun1736172058779'),
(78,1736947513045,'CreateTestCaseExecutionTable1736947513045'),
(79,1737715421462,'AddErrorColumnsToTestRuns1737715421462'),
(80,1738709609940,'CreateFolderTable1738709609940'),
(81,1739549398681,'CreateAnalyticsTables1739549398681'),
(82,1739873751194,'FixTestDefinitionPrimaryKey1739873751194'),
(83,1740445074052,'UpdateParentFolderIdColumn1740445074052'),
(84,1741167584277,'RenameAnalyticsToInsights1741167584277'),
(85,1742918400000,'AddScopesColumnToApiKeys1742918400000'),
(86,1745322634000,'ClearEvaluation1745322634000'),
(87,1745587087521,'AddWorkflowStatisticsRootCount1745587087521'),
(88,1745934666076,'AddWorkflowArchivedColumn1745934666076'),
(89,1745934666077,'DropRoleTable1745934666077'),
(90,1747824239000,'AddProjectDescriptionColumn1747824239000'),
(91,1750252139166,'AddLastActiveAtColumnToUser1750252139166'),
(92,1750252139166,'AddScopeTables1750252139166'),
(93,1750252139167,'AddRolesTables1750252139167'),
(94,1750252139168,'LinkRoleToUserTable1750252139168'),
(95,1752669793000,'AddInputsOutputsToTestCaseExecution1752669793000'),
(96,1754475614601,'CreateDataStoreTables1754475614601');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processed_data`
--

DROP TABLE IF EXISTS `processed_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `processed_data` (
  `workflowId` varchar(36) NOT NULL,
  `context` varchar(255) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `value` text NOT NULL,
  PRIMARY KEY (`workflowId`,`context`),
  CONSTRAINT `FK_06a69a7032c97a763c2c7599464` FOREIGN KEY (`workflowId`) REFERENCES `workflow_entity` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processed_data`
--

LOCK TABLES `processed_data` WRITE;
/*!40000 ALTER TABLE `processed_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `processed_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(36) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `icon` json DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES
('VvDa07rL5RDo4nJX','Jhonny Mesquita <jhonnyjks@gmail.com>','personal','2025-08-30 19:16:47.494','2025-08-30 19:18:42.763',NULL,NULL);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_relation`
--

DROP TABLE IF EXISTS `project_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_relation` (
  `projectId` varchar(36) NOT NULL,
  `userId` varchar(36) NOT NULL,
  `role` varchar(255) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`projectId`,`userId`),
  KEY `IDX_61448d56d61802b5dfde5cdb00` (`projectId`),
  KEY `IDX_5f0643f6717905a05164090dde` (`userId`),
  CONSTRAINT `FK_5f0643f6717905a05164090dde7` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_61448d56d61802b5dfde5cdb002` FOREIGN KEY (`projectId`) REFERENCES `project` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_relation`
--

LOCK TABLES `project_relation` WRITE;
/*!40000 ALTER TABLE `project_relation` DISABLE KEYS */;
INSERT INTO `project_relation` VALUES
('VvDa07rL5RDo4nJX','0f391446-ed49-4fc5-b32f-45747209b608','project:personalOwner','2025-08-30 19:16:47.499','2025-08-30 19:16:47.499');
/*!40000 ALTER TABLE `project_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `slug` varchar(128) NOT NULL COMMENT 'Unique identifier of the role for example: "global:owner"',
  `displayName` text COMMENT 'Name used to display in the UI',
  `description` text COMMENT 'Text describing the scope in more detail of users',
  `roleType` text COMMENT 'Type of the role, e.g., global, project, or workflow',
  `systemRole` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Indicates if the role is managed by the system and cannot be edited',
  PRIMARY KEY (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES
('credential:owner','Credential Owner','Credential Owner','credential',1),
('credential:user','Credential User','Credential User','credential',1),
('global:admin','Admin','Admin','global',1),
('global:member','Member','Member','global',1),
('global:owner','Owner','Owner','global',1),
('project:admin','Project Admin','Project Admin','project',1),
('project:editor','Project Editor','Project Editor','project',1),
('project:personalOwner','Project Owner','Project Owner','project',1),
('project:viewer','Project Viewer','Project Viewer','project',1),
('workflow:editor','Workflow Editor','Workflow Editor','workflow',1),
('workflow:owner','Workflow Owner','Workflow Owner','workflow',1);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_scope`
--

DROP TABLE IF EXISTS `role_scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_scope` (
  `roleSlug` varchar(128) NOT NULL,
  `scopeSlug` varchar(128) NOT NULL,
  PRIMARY KEY (`roleSlug`,`scopeSlug`),
  KEY `IDX_role_scope_scopeSlug` (`scopeSlug`),
  CONSTRAINT `role_scope_ibfk_1` FOREIGN KEY (`scopeSlug`) REFERENCES `scope` (`slug`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_scope_ibfk_2` FOREIGN KEY (`roleSlug`) REFERENCES `role` (`slug`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_scope`
--

LOCK TABLES `role_scope` WRITE;
/*!40000 ALTER TABLE `role_scope` DISABLE KEYS */;
INSERT INTO `role_scope` VALUES
('global:admin','annotationTag:create'),
('global:member','annotationTag:create'),
('global:owner','annotationTag:create'),
('global:admin','annotationTag:delete'),
('global:member','annotationTag:delete'),
('global:owner','annotationTag:delete'),
('global:admin','annotationTag:list'),
('global:member','annotationTag:list'),
('global:owner','annotationTag:list'),
('global:admin','annotationTag:read'),
('global:member','annotationTag:read'),
('global:owner','annotationTag:read'),
('global:admin','annotationTag:update'),
('global:member','annotationTag:update'),
('global:owner','annotationTag:update'),
('global:admin','auditLogs:manage'),
('global:owner','auditLogs:manage'),
('global:admin','banner:dismiss'),
('global:owner','banner:dismiss'),
('global:admin','community:register'),
('global:owner','community:register'),
('global:admin','communityPackage:install'),
('global:owner','communityPackage:install'),
('global:admin','communityPackage:list'),
('global:owner','communityPackage:list'),
('global:admin','communityPackage:uninstall'),
('global:owner','communityPackage:uninstall'),
('global:admin','communityPackage:update'),
('global:owner','communityPackage:update'),
('global:admin','credential:create'),
('global:owner','credential:create'),
('project:admin','credential:create'),
('project:editor','credential:create'),
('project:personalOwner','credential:create'),
('credential:owner','credential:delete'),
('global:admin','credential:delete'),
('global:owner','credential:delete'),
('project:admin','credential:delete'),
('project:editor','credential:delete'),
('project:personalOwner','credential:delete'),
('global:admin','credential:list'),
('global:owner','credential:list'),
('project:admin','credential:list'),
('project:editor','credential:list'),
('project:personalOwner','credential:list'),
('project:viewer','credential:list'),
('credential:owner','credential:move'),
('global:admin','credential:move'),
('global:owner','credential:move'),
('project:admin','credential:move'),
('project:personalOwner','credential:move'),
('credential:owner','credential:read'),
('credential:user','credential:read'),
('global:admin','credential:read'),
('global:owner','credential:read'),
('project:admin','credential:read'),
('project:editor','credential:read'),
('project:personalOwner','credential:read'),
('project:viewer','credential:read'),
('credential:owner','credential:share'),
('global:admin','credential:share'),
('global:owner','credential:share'),
('project:admin','credential:share'),
('project:personalOwner','credential:share'),
('credential:owner','credential:update'),
('global:admin','credential:update'),
('global:owner','credential:update'),
('project:admin','credential:update'),
('project:editor','credential:update'),
('project:personalOwner','credential:update'),
('project:admin','dataStore:create'),
('project:editor','dataStore:create'),
('project:personalOwner','dataStore:create'),
('project:admin','dataStore:delete'),
('project:editor','dataStore:delete'),
('project:personalOwner','dataStore:delete'),
('global:admin','dataStore:list'),
('global:member','dataStore:list'),
('global:owner','dataStore:list'),
('project:admin','dataStore:listProject'),
('project:editor','dataStore:listProject'),
('project:personalOwner','dataStore:listProject'),
('project:viewer','dataStore:listProject'),
('project:admin','dataStore:read'),
('project:editor','dataStore:read'),
('project:personalOwner','dataStore:read'),
('project:viewer','dataStore:read'),
('project:admin','dataStore:readRow'),
('project:editor','dataStore:readRow'),
('project:personalOwner','dataStore:readRow'),
('project:viewer','dataStore:readRow'),
('project:admin','dataStore:update'),
('project:editor','dataStore:update'),
('project:personalOwner','dataStore:update'),
('project:admin','dataStore:writeRow'),
('project:editor','dataStore:writeRow'),
('project:personalOwner','dataStore:writeRow'),
('global:admin','eventBusDestination:create'),
('global:owner','eventBusDestination:create'),
('global:admin','eventBusDestination:delete'),
('global:owner','eventBusDestination:delete'),
('global:admin','eventBusDestination:list'),
('global:member','eventBusDestination:list'),
('global:owner','eventBusDestination:list'),
('global:admin','eventBusDestination:read'),
('global:owner','eventBusDestination:read'),
('global:admin','eventBusDestination:test'),
('global:member','eventBusDestination:test'),
('global:owner','eventBusDestination:test'),
('global:admin','eventBusDestination:update'),
('global:owner','eventBusDestination:update'),
('global:admin','externalSecret:list'),
('global:owner','externalSecret:list'),
('global:admin','externalSecret:use'),
('global:owner','externalSecret:use'),
('global:admin','externalSecretsProvider:create'),
('global:owner','externalSecretsProvider:create'),
('global:admin','externalSecretsProvider:delete'),
('global:owner','externalSecretsProvider:delete'),
('global:admin','externalSecretsProvider:list'),
('global:owner','externalSecretsProvider:list'),
('global:admin','externalSecretsProvider:read'),
('global:owner','externalSecretsProvider:read'),
('global:admin','externalSecretsProvider:sync'),
('global:owner','externalSecretsProvider:sync'),
('global:admin','externalSecretsProvider:update'),
('global:owner','externalSecretsProvider:update'),
('project:admin','folder:create'),
('project:editor','folder:create'),
('project:personalOwner','folder:create'),
('project:admin','folder:delete'),
('project:editor','folder:delete'),
('project:personalOwner','folder:delete'),
('project:admin','folder:list'),
('project:editor','folder:list'),
('project:personalOwner','folder:list'),
('project:viewer','folder:list'),
('global:admin','folder:move'),
('global:owner','folder:move'),
('project:admin','folder:move'),
('project:personalOwner','folder:move'),
('project:admin','folder:read'),
('project:editor','folder:read'),
('project:personalOwner','folder:read'),
('project:viewer','folder:read'),
('project:admin','folder:update'),
('project:editor','folder:update'),
('project:personalOwner','folder:update'),
('global:admin','insights:list'),
('global:owner','insights:list'),
('global:admin','ldap:manage'),
('global:owner','ldap:manage'),
('global:admin','ldap:sync'),
('global:owner','ldap:sync'),
('global:admin','license:manage'),
('global:owner','license:manage'),
('global:admin','logStreaming:manage'),
('global:owner','logStreaming:manage'),
('global:admin','oidc:manage'),
('global:owner','oidc:manage'),
('global:admin','orchestration:read'),
('global:owner','orchestration:read'),
('global:admin','project:create'),
('global:owner','project:create'),
('global:admin','project:delete'),
('global:owner','project:delete'),
('project:admin','project:delete'),
('global:admin','project:list'),
('global:owner','project:list'),
('project:admin','project:list'),
('project:editor','project:list'),
('project:personalOwner','project:list'),
('project:viewer','project:list'),
('global:admin','project:read'),
('global:owner','project:read'),
('project:admin','project:read'),
('project:editor','project:read'),
('project:personalOwner','project:read'),
('project:viewer','project:read'),
('global:admin','project:update'),
('global:owner','project:update'),
('project:admin','project:update'),
('global:admin','saml:manage'),
('global:owner','saml:manage'),
('global:admin','securityAudit:generate'),
('global:owner','securityAudit:generate'),
('global:admin','sourceControl:manage'),
('global:owner','sourceControl:manage'),
('global:admin','sourceControl:pull'),
('global:owner','sourceControl:pull'),
('global:admin','sourceControl:push'),
('global:owner','sourceControl:push'),
('project:admin','sourceControl:push'),
('global:admin','tag:create'),
('global:member','tag:create'),
('global:owner','tag:create'),
('global:admin','tag:delete'),
('global:owner','tag:delete'),
('global:admin','tag:list'),
('global:member','tag:list'),
('global:owner','tag:list'),
('global:admin','tag:read'),
('global:member','tag:read'),
('global:owner','tag:read'),
('global:admin','tag:update'),
('global:member','tag:update'),
('global:owner','tag:update'),
('global:admin','user:changeRole'),
('global:owner','user:changeRole'),
('global:admin','user:create'),
('global:owner','user:create'),
('global:admin','user:delete'),
('global:owner','user:delete'),
('global:admin','user:enforceMfa'),
('global:owner','user:enforceMfa'),
('global:admin','user:list'),
('global:member','user:list'),
('global:owner','user:list'),
('global:admin','user:read'),
('global:owner','user:read'),
('global:admin','user:resetPassword'),
('global:owner','user:resetPassword'),
('global:admin','user:update'),
('global:owner','user:update'),
('global:admin','variable:create'),
('global:owner','variable:create'),
('global:admin','variable:delete'),
('global:owner','variable:delete'),
('global:admin','variable:list'),
('global:member','variable:list'),
('global:owner','variable:list'),
('global:admin','variable:read'),
('global:member','variable:read'),
('global:owner','variable:read'),
('global:admin','variable:update'),
('global:owner','variable:update'),
('global:admin','workersView:manage'),
('global:owner','workersView:manage'),
('global:admin','workflow:create'),
('global:owner','workflow:create'),
('project:admin','workflow:create'),
('project:editor','workflow:create'),
('project:personalOwner','workflow:create'),
('global:admin','workflow:delete'),
('global:owner','workflow:delete'),
('project:admin','workflow:delete'),
('project:editor','workflow:delete'),
('project:personalOwner','workflow:delete'),
('workflow:owner','workflow:delete'),
('global:admin','workflow:execute'),
('global:owner','workflow:execute'),
('project:admin','workflow:execute'),
('project:editor','workflow:execute'),
('project:personalOwner','workflow:execute'),
('workflow:editor','workflow:execute'),
('workflow:owner','workflow:execute'),
('global:admin','workflow:list'),
('global:owner','workflow:list'),
('project:admin','workflow:list'),
('project:editor','workflow:list'),
('project:personalOwner','workflow:list'),
('project:viewer','workflow:list'),
('global:admin','workflow:move'),
('global:owner','workflow:move'),
('project:admin','workflow:move'),
('project:personalOwner','workflow:move'),
('workflow:owner','workflow:move'),
('global:admin','workflow:read'),
('global:owner','workflow:read'),
('project:admin','workflow:read'),
('project:editor','workflow:read'),
('project:personalOwner','workflow:read'),
('project:viewer','workflow:read'),
('workflow:editor','workflow:read'),
('workflow:owner','workflow:read'),
('global:admin','workflow:share'),
('global:owner','workflow:share'),
('project:personalOwner','workflow:share'),
('workflow:owner','workflow:share'),
('global:admin','workflow:update'),
('global:owner','workflow:update'),
('project:admin','workflow:update'),
('project:editor','workflow:update'),
('project:personalOwner','workflow:update'),
('workflow:editor','workflow:update'),
('workflow:owner','workflow:update');
/*!40000 ALTER TABLE `role_scope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scope`
--

DROP TABLE IF EXISTS `scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `scope` (
  `slug` varchar(128) NOT NULL COMMENT 'Unique identifier of the scope for example: "project:create"',
  `displayName` text COMMENT 'Name used to display in the UI',
  `description` text COMMENT 'Text describing the scope in more detail of users',
  PRIMARY KEY (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scope`
--

LOCK TABLES `scope` WRITE;
/*!40000 ALTER TABLE `scope` DISABLE KEYS */;
INSERT INTO `scope` VALUES
('*','*',NULL),
('annotationTag:*','annotationTag:*',NULL),
('annotationTag:create','Create Annotation Tag','Allows creating new annotation tags.'),
('annotationTag:delete','annotationTag:delete',NULL),
('annotationTag:list','annotationTag:list',NULL),
('annotationTag:read','annotationTag:read',NULL),
('annotationTag:update','annotationTag:update',NULL),
('auditLogs:*','auditLogs:*',NULL),
('auditLogs:manage','auditLogs:manage',NULL),
('banner:*','banner:*',NULL),
('banner:dismiss','banner:dismiss',NULL),
('community:*','community:*',NULL),
('community:register','community:register',NULL),
('communityPackage:*','communityPackage:*',NULL),
('communityPackage:install','communityPackage:install',NULL),
('communityPackage:list','communityPackage:list',NULL),
('communityPackage:manage','communityPackage:manage',NULL),
('communityPackage:uninstall','communityPackage:uninstall',NULL),
('communityPackage:update','communityPackage:update',NULL),
('credential:*','credential:*',NULL),
('credential:create','credential:create',NULL),
('credential:delete','credential:delete',NULL),
('credential:list','credential:list',NULL),
('credential:move','credential:move',NULL),
('credential:read','credential:read',NULL),
('credential:share','credential:share',NULL),
('credential:update','credential:update',NULL),
('dataStore:*','dataStore:*',NULL),
('dataStore:create','dataStore:create',NULL),
('dataStore:delete','dataStore:delete',NULL),
('dataStore:list','dataStore:list',NULL),
('dataStore:listProject','dataStore:listProject',NULL),
('dataStore:read','dataStore:read',NULL),
('dataStore:readRow','dataStore:readRow',NULL),
('dataStore:update','dataStore:update',NULL),
('dataStore:writeRow','dataStore:writeRow',NULL),
('eventBusDestination:*','eventBusDestination:*',NULL),
('eventBusDestination:create','eventBusDestination:create',NULL),
('eventBusDestination:delete','eventBusDestination:delete',NULL),
('eventBusDestination:list','eventBusDestination:list',NULL),
('eventBusDestination:read','eventBusDestination:read',NULL),
('eventBusDestination:test','eventBusDestination:test',NULL),
('eventBusDestination:update','eventBusDestination:update',NULL),
('externalSecret:*','externalSecret:*',NULL),
('externalSecret:list','externalSecret:list',NULL),
('externalSecret:use','externalSecret:use',NULL),
('externalSecretsProvider:*','externalSecretsProvider:*',NULL),
('externalSecretsProvider:create','externalSecretsProvider:create',NULL),
('externalSecretsProvider:delete','externalSecretsProvider:delete',NULL),
('externalSecretsProvider:list','externalSecretsProvider:list',NULL),
('externalSecretsProvider:read','externalSecretsProvider:read',NULL),
('externalSecretsProvider:sync','externalSecretsProvider:sync',NULL),
('externalSecretsProvider:update','externalSecretsProvider:update',NULL),
('folder:*','folder:*',NULL),
('folder:create','folder:create',NULL),
('folder:delete','folder:delete',NULL),
('folder:list','folder:list',NULL),
('folder:move','folder:move',NULL),
('folder:read','folder:read',NULL),
('folder:update','folder:update',NULL),
('insights:*','insights:*',NULL),
('insights:list','insights:list',NULL),
('ldap:*','ldap:*',NULL),
('ldap:manage','ldap:manage',NULL),
('ldap:sync','ldap:sync',NULL),
('license:*','license:*',NULL),
('license:manage','license:manage',NULL),
('logStreaming:*','logStreaming:*',NULL),
('logStreaming:manage','logStreaming:manage',NULL),
('oidc:*','oidc:*',NULL),
('oidc:manage','oidc:manage',NULL),
('orchestration:*','orchestration:*',NULL),
('orchestration:list','orchestration:list',NULL),
('orchestration:read','orchestration:read',NULL),
('project:*','project:*',NULL),
('project:create','project:create',NULL),
('project:delete','project:delete',NULL),
('project:list','project:list',NULL),
('project:read','project:read',NULL),
('project:update','project:update',NULL),
('saml:*','saml:*',NULL),
('saml:manage','saml:manage',NULL),
('securityAudit:*','securityAudit:*',NULL),
('securityAudit:generate','securityAudit:generate',NULL),
('sourceControl:*','sourceControl:*',NULL),
('sourceControl:manage','sourceControl:manage',NULL),
('sourceControl:pull','sourceControl:pull',NULL),
('sourceControl:push','sourceControl:push',NULL),
('tag:*','tag:*',NULL),
('tag:create','tag:create',NULL),
('tag:delete','tag:delete',NULL),
('tag:list','tag:list',NULL),
('tag:read','tag:read',NULL),
('tag:update','tag:update',NULL),
('user:*','user:*',NULL),
('user:changeRole','user:changeRole',NULL),
('user:create','user:create',NULL),
('user:delete','user:delete',NULL),
('user:enforceMfa','user:enforceMfa',NULL),
('user:list','user:list',NULL),
('user:read','user:read',NULL),
('user:resetPassword','user:resetPassword',NULL),
('user:update','user:update',NULL),
('variable:*','variable:*',NULL),
('variable:create','variable:create',NULL),
('variable:delete','variable:delete',NULL),
('variable:list','variable:list',NULL),
('variable:read','variable:read',NULL),
('variable:update','variable:update',NULL),
('workersView:*','workersView:*',NULL),
('workersView:manage','workersView:manage',NULL),
('workflow:*','workflow:*',NULL),
('workflow:create','workflow:create',NULL),
('workflow:delete','workflow:delete',NULL),
('workflow:execute','workflow:execute',NULL),
('workflow:list','workflow:list',NULL),
('workflow:move','workflow:move',NULL),
('workflow:read','workflow:read',NULL),
('workflow:share','workflow:share',NULL),
('workflow:update','workflow:update',NULL);
/*!40000 ALTER TABLE `scope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `loadOnStartup` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES
('features.ldap','{\"loginEnabled\":false,\"loginLabel\":\"\",\"connectionUrl\":\"\",\"allowUnauthorizedCerts\":false,\"connectionSecurity\":\"none\",\"connectionPort\":389,\"baseDn\":\"\",\"bindingAdminDn\":\"\",\"bindingAdminPassword\":\"\",\"firstNameAttribute\":\"\",\"lastNameAttribute\":\"\",\"emailAttribute\":\"\",\"loginIdAttribute\":\"\",\"ldapIdAttribute\":\"\",\"userFilter\":\"\",\"synchronizationEnabled\":false,\"synchronizationInterval\":60,\"searchPageSize\":0,\"searchTimeout\":60}',1),
('features.oidc','{\"clientId\":\"\",\"clientSecret\":\"\",\"discoveryEndpoint\":\"\",\"loginEnabled\":false}',1),
('features.sourceControl','{\"branchName\":\"main\",\"keyGeneratorType\":\"ed25519\"}',1),
('features.sourceControl.sshKeys','{\"encryptedPrivateKey\":\"U2FsdGVkX1/n6cQOHIBEnBqrnSGduO+bxYdziP+suT0GcSDlGLevWtWobLgmSpoApyw0pk3n7PVIaVo45pdi30K+jCJefuHk2S1ayo+mFbH3bAZgnF4cAdVeteKvj9Y29xYMFCStcbhoV5MZHW5tdfzKYdOF4KGiANOGDGaKOumG+1vm8OunGtbQ7GKg+qKQyhxMNKsgleXt+0VvPSq0wRMkCjPLR1h+WwTUmRWYCg/a52d0BeR4PljOjAj2lIhtvHZDO3HEh3fl0Hu45zYMLBDV+jMYf6Zq+GrNS05eRg7/q8HvlVRs8a+DMDuH5Si7KDbCZOD8+2Fvnj3BYGrd6COZLBSITPzVLRZlGcLl2U9Kii3y+z3K/IqjAq9uYdSbqy4vWNDUJq9ZKQxDenGPlrS483AcC0So0E3+2Loh/tMJ+8ToheILXK1QBH+3xrNJrLkfVZqCqK9QHa401RbK5RvBBOnfiPouZBY7ses2eiIvFmbHXdLEr/UBacHWS2crqW4+YzBOXDvTwH6if7UdOgxa2+cKypw3RkCydmWk0UACTcTlvKlQrRIAkQqd6XQF\",\"publicKey\":\"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG5NyDNVMnflqXGdYJFwQr8Ri0uM/ITh4Sd9lZIdbnPS n8n deploy key\"}',1),
('license.cert','eyJsaWNlbnNlS2V5IjoiLS0tLS1CRUdJTiBMSUNFTlNFIEtFWS0tLS0tXG5oaEd6VWhJb1JQVXBoQzZjMGg1QjBFZkhrb2VwUGhHN1BGOGNyMGViWjJBbEpHTCtIM0kwUWxhdXBYMmljV1RnXG52QjYzRFd2b2RTOWc3ME8zVXhCZ3NLZmpjTWM1Z2JGTEZGRS9IOG9DSWJZV1puY1ZqcEFSWW1OTmdZYUUvNm1FXG5jYTlVZWU3T3lGQllOYXUrYkowL0hCc1pFNDI2NjdiZ2ZBWS81MjV3dW1nSHZyZGNaUnI3bC9IT0RvVGVBeVBqXG5Wcy9kRnFVQ21qeWpGdDNZZXRaSU40cTZhVHNkd0FxR3JROTBQZlByaXN1UUxHZzRaTWkzaVcxRTEzS1FCazhUXG42OFljTi9FZUs5Mmg3VWpSdDJGakxvNDNEWkxybDhJdEVTbTROZ0tSSU13eUZ4WHZlNjBwQytiZmdBbGZKdktBXG5ENE15K3hNZ0dpZGo5alVaWHNNdGp3PT18fFUyRnNkR1ZrWDE5Z1d0bmZrWTBONlZwMUUyeDNncDRkZjZvampTXG5iQWVLQUFDaTFGNEgxVEx3cUkybWhPV0VDRlFHT3lKZ0VuVE9TNzIwbGNQWnc2dDdpa1MxZDByOTdLNzBJVThBXG52RGFuVjZ0SjRxZk5QRmZzSjhqUjgwN2tOOG9za0YveGZHZ05SY3lRU2phYjVOWjNkZG83elpJNGd1M21mSUpnXG5zdDdLMDltNlhJVjVGWU1VaW5pNENDMjlwaUNVcmxIQytXbUl1b1ArVTNwSG1kNjJHL3MxYnlVWTI0Ni9rUHVvXG53WHFpUXh5aWRJeUsrbE12dk9lc1NrUkk5YU83UUtIS1Z4MUtMSGp2WTNXa2toSjlReG95TWY5K3ZFRk5ZSFlNXG5oUXNPTjlIZStOQ2J1UzJqdmxacEJEbnlLK09CelM3TE5VOHJoMXZ6aDlGTENFQzFwSUJraTdkTFJlKzByUUdpXG43SDNlSW5ZUTNZa3FZMGR0NUJwZndUNGsvMGJVVEJ1ZlJJT1pSbGFDNFliQmdCRzZhNmtmVmFGOUpoU0NlMXZ4XG5WbkxyQzdmNG1wVkNvZCtmUW41RHpaMnBPNU9EaytpRjd4TVp0VExmUXczbXZLYVRZYWdhUzFSWjlSOEtDbWg3XG5pUE9hd0Nlck1HWWwzL0x1VlNwazFPd3pkaVd1b2plMEVFUjB1UTIyRTRSZnpEbTkvdVJieWhNU0F6NHRzUlVoXG5RTCt1bXBpeGtaRWE2M21iTHo4K1hqcFlDQW93TGk0VUpZa0RFK3lmT0dEajR5Skc3SlBKaWxnV2JWd1UzK0JLXG5DczFGaXU2WHYwc3NBeTl6WVdLc0tEM3lzRklTZ0ZOdmMyYkVSYnM4Q0VpZHlZb0Q5dUNwcGluVWhBeERwUTdhXG44eHFLTWpkcnRPVVFTUEcwYm1ndkllTXQzT3V4WTZxVmJCc2U3ZlNSdUE5a2NwaHBUVTRLMEVqM1ZlM1VLTHBYXG5WcTdDRkdRU2poWFpia1hIcUNxSGN2L2FUMS9VcEkweGpyVEJEWDh0WkJCMTBIS2hWdlRvYlJURU5xbmFUb1U5XG5LMTBTQ0FBVUxNaGppRi9MaUxBMjcvbTRWOC96TzFlZCtNK3A1SDNqWDZpOUlnWnI2SEo5ZExrY3RmWWM0REJGXG5vNnVyR1U0WXBKZlFqTG9NeFJzbG5Xd1l3RkQ5VXVGVU53dXFLVnlENjUzQUQxNWVlMGdxK25kckFXL2F4Y2hyXG5xMWthT3NoeVdreEpsSkxEUUltcysxZVVIVE55a1h0UCtDeUFnRDJZR1pWVGRSeHdIUXIvOVdpQVo1dEI0MHVYXG5nODJ5N3o4ZkZ3ZUlFSVZyWjhHQ2hZTHQvTy9lNXZrOHFMZkhaQXZKVzgyK1pSTHRUZ3phM3MzUnBaNXYvY1NqXG5zQmhPZFRBdkt2NmZEbkcvQVUrS0FBR1BpVXNGaHA2N09BMXVKOWw4dXlOWk9uNTIyWlJ0SStTN00wSFAyeE53XG5uVmVDWGIyOWVZYTNrNVhSc1BDOGJFWFFlblRCUnkzZVhnTEt4QzhMcUY2K1g0Qm9VOUYrRncrazVnaUNwVGphXG40Q0NoK0pacWhkTHZFYlBMa2R2UWp1UCswOFFBQ0pBcGUybklybjZobUJVb3lQL01sU2E2MEJNeWlyeU5GQldBXG4xaHhQUUZYVmRRMUVZLzM1YkVnRmJ4MGlSUzF5QWI1NXhRbkxmSllCRGpyK1oxMlBlUnU2LzBEZ0p3aGF6di80XG5zRmVPWVJSRlJmTVlMOWtYYXl6NE1PVjZyeklJdzFPV2dFemJkWFU4OUVOVVJ4cjU1RDFQSjNHV2NvVC9sUEZyXG5JV2lIYjZzRDdxS1lKRk1MZzVXWnFFdmtKQXkwWXRTMU9ZL3Z1SlFWalByTzJIQUxJVVFwVlZ1TDFXSEdUT0ZPXG5kU2RGUG8wOGorYlJmeGRtekRpamowc2FLcHNtQzQ2UWphQ0dXd0dvQk01T0xFTmJHOE1uRkVsRXY5NDJwWStOXG5oTjNuL2VHV3M5akFOOGJEc1VZSjBwd0RyYi9xalVjUWNWcVlnR2tXSkVwRVZHQ1lyWGlhTCtGTWN4K0YySXdoXG5peFlBS01qK3cwK28yU285TUdPSU8vTkZHYXpUYmRVUDlwanQ0Q3FucWZubDF6ZVp5aWJLVnc0RVFkeDdsVzFGXG42bmFCQXdwTVBTV2ZMdmdOTlFKVFRoWHlPeDl2MHpJZG0vZ2pwb2tJWTRzV1kwS0diWGVvNUtvYUpUL1NBY2g3XG5lWmlXR21NcWRNZXlRZTlieUlQTWR2dEYwcmhVMnkxd01XQXFCa1lEQmJ0SSt4Y1ZVTlN3YmlkM2RxUDBFMmx6XG55ZU0zM1BlVEgySzR6dk9ta1ZXSGZNcHRHQlVWYlhESDlLWHN2dnVQRUlNelBiWEo0cXpKYkd4RTg2YWlnWDF5XG5KanhQQmFtTjhwQmVGRmNzYWVHZ3pYS09OM1RqTFNLYUM2V1hSakhlU3Y2TjZLZWM4eVJCN3Q5ak9JbDZyN1RZXG5KcEFCNWtjK2NoNThnRkU0Ui9BTkRFengwVnVqTXdlaGpBdHNDSFVoTmxLUjE5TnFBU1p3U2tpb2JwWnU2d0RUXG4rUHFLeTdPbmlubXhoeEFZekx6ZVhpT1F2bnJpNHQrRmhZOTVuY0Vxc0tpTW9wWnVIVjFiUm9ibzg2bHYyQ09xXG5TVjU4V0lYbjFQelgzQzNWNTVYNTR2R0xCclFSekVwdTBEbklSZWl2cFVnZmxydkFvd0hoQngreWtKL0RaWjJ3XG55eUdmeWNuWHJ5Rm0yaXdFN3NmYmk5UWQvZThnMG9SUDk1c3NvcGhzakZhb2tSZzJHZ1R1emRpb2lta3hUSDczXG50bjJQR0pLNHp2Mk8yekJIUThjeW5XWm9JSWlXS2NmbWhwUmNzRFpoMnF6N01LbFkzU1VHcmFST2pBVWtHQzNkXG41bW5SZ0RBS2RETi9xTWVkMFFXQ3pHYXpCNksvUzIvOTFnRlV0QjhJYTBnNjZRMTRRVWJtbHp3ZHh0NWdRSHV3XG5EN3NUakREMmtFTGdrTUdocFlrTFhWSWVtT2VtQjAyVm1hNWxNb2VtK0UwVnFaRTZhSDJNa1NXWHg0RGZSckNFXG5nNkZ1ek5Ma2VFREZPSndBQmduNkQ2cHZCZ1BvK1JlRDB0b2ZIYnU5TUYzdjAvYm9aZk1KdTlPUzZ4NXc0cWVyXG4vVHpuRTR3T0VjSU5tOE8vd2F6ck5qdVkrSHFZR3Z5eFdnZ0k1dFUrUVltbEhIcVEzK0xTUk4xKytJeCt6enBqXG55WHU1L3VwTEdNSkxTemxEaGp0TTlVZGZYVjdBMldmaThhSkxmaEFBVEJZa1gyMlh1NkNTbGExV2J6VitUU2NEXG5IdWdWbWY5ZDZ2R2laTnU5YU03dVd2dTk5NGVNajlxTk1vV1NQZVhrQ3MrNm9wSnlXVzl5TmFQSERTS3luMUFkXG5UUkY0RGgvM2c1UVF3NDZHWkVCZkl5WlJnR0JIaXkwUXplYjBkSFlYUituRHZzKzBmbmtmQzJvY0dvN0I2NVJrXG5OTVlpSHdRODV3S0U2amJUdDBGSENsMzk3dkpzZjQrMkdzc3RJQkVVMnNDVUxQcFVwRlZYbmNQdklJc3dLM0tRXG5kd1hCajNFWlkybXM1M0Z5cXRDOTJSTDFBbTJHdy9TR2hlVXNMV0ovMGdYRTBNTGQxTk5pOWdPWDJaV2NyaC9VXG5MWXI5Q2plTHF4SjBGZU1qa0dkY2lDUjVwSVRKdms0WmFiWm82THF5OG1HaGFHSVpQMHVIU3dqOFV4QWdhWUR0XG5aMTMxYkFXem1adFgvWjhuTlRYRkZIUGRqdHJzcGIrT2Q1NWU2V3pya1dEdWpvbGl4TUZIZkl0a0tHYjQrTG1KXG5hNGpHUVZuaDNtR1dmOGRYbWJRMW5BTVFPNkNqOHVYbkVLdnBIcDQzWmVDTHFsWjFMNVk5dFNXVFd1UUR4bmpLXG5sYTU3bnlQSDFGRUpXc1pDTkVqeVkxSktRbXUzQUg1TGZNSlJ1WjBRRHFvVlB6NDNMTzdQTWZ1VnNVZlZyU01xXG53T1dvaWh3dy8rWHVBWjk4SGVtakk5TEpLSUNVOWY2TksvcWU2MUszZTFveVZROTJsTHUvZ29OSVk0aTJiWFdlXG5xcUIrQ1IwTDg4dW9UV0kyVzNwWkdvaS9XWUM4UXU5eG1CWHVqU1lTR1dTZ2hpNk5KWU4zdVRIdE1jTnphNW9sXG50dWZZcHl4Y3k3ZTFXVVd5MmtvaWpoLzlJcXx8cDd3ZE9TYW5FT3lYRDhIR3h5MWdlU3ZNaE9LMVhKTnVjUGdOXG5LZDRjUUtaS3NqeTNvamNzQmQyanpuN09zNVZKN0pNaTZYVkFHNE9DdWdwODM1THhWOVM2TjIvQ1gzSFhCYmlGXG5tSFZvWlBTdEozTE9XMGZnNWVKZ1hYQzllc3ZDQ2FqVlZ6S2Y1L1llaEIvWDJCUHBrMnZlNktDQ2hxaTJkTjZRXG52TytHR1cxSHFCSVZuS1A2THJhQzk1d3l2d3dkemkrQlJSV1dqd01uajRaM0hKc0didm9xQkpNYVdPWEhhN1U0XG52cHRoUzUwVjhMaTRyS0dFcXVVSmtQS1BzRzdpeDlRT1dpNjBwczBIV3ZkeHp3ZjFGTThUQ2NxZ3BmYnNONDhkXG5qZzJXMUVJRE9TdStvdHE5V0hITVpzcEhjRDh0RjJHU0ZsRjAyek5CSitnWXJrNE1XZz09XG4tLS0tLUVORCBMSUNFTlNFIEtFWS0tLS0tIiwieDUwOSI6Ii0tLS0tQkVHSU4gQ0VSVElGSUNBVEUtLS0tLVxuTUlJRUREQ0NBZlFDQ1FDcWcyb0RUODB4d2pBTkJna3Foa2lHOXcwQkFRVUZBREJJTVFzd0NRWURWUVFHRXdKRVxuUlRFUE1BMEdBMVVFQ0F3R1FtVnliR2x1TVE4d0RRWURWUVFIREFaQ1pYSnNhVzR4RnpBVkJnTlZCQU1NRG14cFxuWTJWdWMyVXViamh1TG1sdk1CNFhEVEl5TURZeU5EQTBNVEEwTUZvWERUSXpNRFl5TkRBME1UQTBNRm93U0RFTFxuTUFrR0ExVUVCaE1DUkVVeER6QU5CZ05WQkFnTUJrSmxjbXhwYmpFUE1BMEdBMVVFQnd3R1FtVnliR2x1TVJjd1xuRlFZRFZRUUREQTVzYVdObGJuTmxMbTQ0Ymk1cGJ6Q0NBU0l3RFFZSktvWklodmNOQVFFQkJRQURnZ0VQQURDQ1xuQVFvQ2dnRUJBTUJNMDVYQjQ0ZzV4Zm1DTHdkcFVUd0FUOCtDQmt5TEtGc2V6a0Q1Sy82V2hhWC9YcnNkL1FkMFxuMjBKN3dsNVdkSFU0Y1ZCbUZSalZ3VnprbENLMnlZSmk4bWp4OHNYc0dxOVExbGJVZU1LZlY5ZHNnZnVobmxBU1xudG5RWmdsdWdPbkYyRmdSaFhiL2pLMHR4VG9hbytiTkU2cjRnSUV6cGt0SExCVFl2dml1Sm1yZWY3V2JQUnQ0SVxubmQ5RDdsaHliZWJ5aFY3a3V6alFBL3BQS0hURnM4TVRIWjhoWVV4UnlycG0zK01ZelFEK2JqQTJVMUZJY3RhVVxud1FYWVdhTjd0MnVUd0N0OXpBS3NtWS9XZU9idmwzVFpONU9OTEF6eVdHQ3VsbTVjd0tSM3hibEJaelhuQjZnc1xuT25OMk9BZFN0Y3pUVkN5Y204cGNGVXJ5dEtTS2tHRUNBd0VBQVRBTkJna3Foa2lHOXcwQkFRVUZBQU9DQWdFQVxubEowMXdjbjF2alhYQ0h1b2k3UjBESjFsbHgxK2RhZnF5RXFQQTI3SnUrTFhtVlZHWFFvclMxYjh4alVxVWtjWlxuVEJ3YldGTzV6NWRabU52bmJ5amF6bSs2b09nMFBNYVl4aDZURndzSTJQT2JjN2JGdjJlYXl3UHQvMUNwbmM0MFxucVVNaGZ2UngvR0NaUENXejMvMlJQSldYOWpRRFNIWENYcThCVytJLzNjdUxEWnlZM2ZFWUJCMHAzRHZWbWFkNlxuNldIUWFVcmlOMC9McXlTT3AvTFpnbGwvdDAyOWdXVnQwNVppYkdvSytjVmhaRWNzTGNVSWhyajJ1RkdGZDNJbVxuSkxnMUpLSjdqS1NCVVFPZElNRHZzRlVGN1lkTXZNdXJDWUEyc09OTjhDWitJNXhRVjFLUzlldkdITTVmbXdnU1xuT1BGdlB6dERDaTAvMXVXOXRPZ0hwb3J1b2RhY3QrRVpOa0FUWEN2Wml1MncvcXRLUkpGNFU0SVRFbTVhVzBrd1xuNnp1Qzh4eUlrdDd2aGRzNDhVdVJTR0g5akpyQWVtbEVpenRHSUxoR0RxelFHWWJsaFVRRkdNYkJiN2poZUx5Q1xuTEoxV09HNjJGMXNweENLQnpFVzV4NnBSMXpUMW1oRWdkNE1rTGE2elBUcGFjcmQ5NUFneGFHS0VMYTFSV1NGcFxuTXZkaEdrNE52N2huYjhyK0J1TVJDNmllZFBNQ3pYcS9NNTBjTjhBZzhidytKMWFGbyswRUsyaFdKYTdraUUrc1xuOUd2RmpTZHpDRmxVUGhLa2tVWmtTbzVhT3RjUXE3SnU2a1dCaExvRllLZ3BybHAxUVZCMHNHWkE2bzZEdHFqYVxuRzcvUms2dmJhWTh3c05ZSzJ6QlhUVDhuZWg1Wm9SWi9QSkxVdEVFdGM3WT1cbi0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0ifQ==',0),
('ui.banners.dismissed','[\"V1\"]',1),
('userManagement.authenticationMethod','email',1),
('userManagement.isInstanceOwnerSetUp','true',1);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shared_credentials`
--

DROP TABLE IF EXISTS `shared_credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `shared_credentials` (
  `credentialsId` varchar(36) NOT NULL,
  `projectId` varchar(36) NOT NULL,
  `role` text NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`credentialsId`,`projectId`),
  KEY `FK_812c2852270da1247756e77f5a4` (`projectId`),
  CONSTRAINT `FK_416f66fc846c7c442970c094ccf` FOREIGN KEY (`credentialsId`) REFERENCES `credentials_entity` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_812c2852270da1247756e77f5a4` FOREIGN KEY (`projectId`) REFERENCES `project` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared_credentials`
--

LOCK TABLES `shared_credentials` WRITE;
/*!40000 ALTER TABLE `shared_credentials` DISABLE KEYS */;
INSERT INTO `shared_credentials` VALUES
('j762PvhMNWKdt7Dr','VvDa07rL5RDo4nJX','credential:owner','2025-08-30 19:33:32.117','2025-08-30 19:33:32.117'),
('R4bVj09h6TyQjXDV','VvDa07rL5RDo4nJX','credential:owner','2025-08-30 19:42:55.728','2025-08-30 19:42:55.728');
/*!40000 ALTER TABLE `shared_credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shared_workflow`
--

DROP TABLE IF EXISTS `shared_workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `shared_workflow` (
  `workflowId` varchar(36) NOT NULL,
  `projectId` varchar(36) NOT NULL,
  `role` text NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`workflowId`,`projectId`),
  KEY `FK_a45ea5f27bcfdc21af9b4188560` (`projectId`),
  CONSTRAINT `FK_a45ea5f27bcfdc21af9b4188560` FOREIGN KEY (`projectId`) REFERENCES `project` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_daa206a04983d47d0a9c34649ce` FOREIGN KEY (`workflowId`) REFERENCES `workflow_entity` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared_workflow`
--

LOCK TABLES `shared_workflow` WRITE;
/*!40000 ALTER TABLE `shared_workflow` DISABLE KEYS */;
INSERT INTO `shared_workflow` VALUES
('zHKUppUIKKFGBl55','VvDa07rL5RDo4nJX','workflow:owner','2025-08-30 19:46:37.415','2025-08-30 19:46:37.415');
/*!40000 ALTER TABLE `shared_workflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_entity`
--

DROP TABLE IF EXISTS `tag_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag_entity` (
  `name` varchar(24) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `id` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_8f949d7a3a984759044054e89b` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_entity`
--

LOCK TABLES `tag_entity` WRITE;
/*!40000 ALTER TABLE `tag_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_case_execution`
--

DROP TABLE IF EXISTS `test_case_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_case_execution` (
  `id` varchar(36) NOT NULL,
  `testRunId` varchar(36) NOT NULL,
  `executionId` int DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `runAt` datetime(3) DEFAULT NULL,
  `completedAt` datetime(3) DEFAULT NULL,
  `errorCode` varchar(255) DEFAULT NULL,
  `errorDetails` json DEFAULT NULL,
  `metrics` json DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `inputs` json DEFAULT NULL,
  `outputs` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8e4b4774db42f1e6dda3452b2a` (`testRunId`),
  KEY `FK_e48965fac35d0f5b9e7f51d8c44` (`executionId`),
  CONSTRAINT `FK_8e4b4774db42f1e6dda3452b2af` FOREIGN KEY (`testRunId`) REFERENCES `test_run` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_e48965fac35d0f5b9e7f51d8c44` FOREIGN KEY (`executionId`) REFERENCES `execution_entity` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_case_execution`
--

LOCK TABLES `test_case_execution` WRITE;
/*!40000 ALTER TABLE `test_case_execution` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_case_execution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_run`
--

DROP TABLE IF EXISTS `test_run`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_run` (
  `id` varchar(36) NOT NULL,
  `workflowId` varchar(36) NOT NULL,
  `status` varchar(255) NOT NULL,
  `errorCode` varchar(255) DEFAULT NULL,
  `errorDetails` json DEFAULT NULL,
  `runAt` datetime(3) DEFAULT NULL,
  `completedAt` datetime(3) DEFAULT NULL,
  `metrics` json DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  KEY `IDX_d6870d3b6e4c185d33926f423c` (`workflowId`),
  CONSTRAINT `FK_d6870d3b6e4c185d33926f423c8` FOREIGN KEY (`workflowId`) REFERENCES `workflow_entity` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_run`
--

LOCK TABLES `test_run` WRITE;
/*!40000 ALTER TABLE `test_run` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_run` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(36) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `firstName` varchar(32) DEFAULT NULL,
  `lastName` varchar(32) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `personalizationAnswers` json DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `settings` json DEFAULT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `mfaEnabled` tinyint(1) NOT NULL DEFAULT '0',
  `mfaSecret` text,
  `mfaRecoveryCodes` text,
  `role` text NOT NULL,
  `lastActiveAt` date DEFAULT NULL,
  `roleSlug` varchar(128) NOT NULL DEFAULT 'global:member',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_e12875dfb3b1d92d7d7c5377e2` (`email`),
  KEY `FK_eaea92ee7bfb9c1b6cd01505d56` (`roleSlug`),
  CONSTRAINT `FK_eaea92ee7bfb9c1b6cd01505d56` FOREIGN KEY (`roleSlug`) REFERENCES `role` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES
('0f391446-ed49-4fc5-b32f-45747209b608','jhonnyjks@gmail.com','Jhonny','Mesquita','$2a$10$w36QxyJX6dzgv243rl1UqeHMdjqu1KVhjSoo/pm3Z4CanWgXqlpJG','{\"role\": \"engineering\", \"version\": \"v4\", \"companySize\": \"<20\", \"companyType\": \"saas\", \"reportedSource\": \"youtube\", \"automationGoalDevops\": [\"reporting\"], \"personalization_survey_n8n_version\": \"1.108.2\", \"personalization_survey_submitted_at\": \"2025-08-30T19:21:33.268Z\"}','2025-08-30 19:16:39','2025-08-30 20:20:13','{\"userActivated\": true, \"userActivatedAt\": 1756584045964, \"firstSuccessfulWorkflowId\": \"zHKUppUIKKFGBl55\"}',0,0,NULL,NULL,'global:owner','2025-08-30','global:owner');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_api_keys`
--

DROP TABLE IF EXISTS `user_api_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_api_keys` (
  `id` varchar(36) NOT NULL,
  `userId` varchar(36) NOT NULL,
  `label` varchar(100) NOT NULL,
  `apiKey` varchar(255) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `scopes` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_63d7bbae72c767cf162d459fcc` (`userId`,`label`),
  UNIQUE KEY `IDX_1ef35bac35d20bdae979d917a3` (`apiKey`),
  CONSTRAINT `FK_e131705cbbc8fb589889b02d457` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_api_keys`
--

LOCK TABLES `user_api_keys` WRITE;
/*!40000 ALTER TABLE `user_api_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_api_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variables`
--

DROP TABLE IF EXISTS `variables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `variables` (
  `key` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'string',
  `value` varchar(255) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variables`
--

LOCK TABLES `variables` WRITE;
/*!40000 ALTER TABLE `variables` DISABLE KEYS */;
/*!40000 ALTER TABLE `variables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webhook_entity`
--

DROP TABLE IF EXISTS `webhook_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `webhook_entity` (
  `webhookPath` varchar(255) NOT NULL,
  `method` varchar(255) NOT NULL,
  `node` varchar(255) NOT NULL,
  `webhookId` varchar(255) DEFAULT NULL,
  `pathLength` int DEFAULT NULL,
  `workflowId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`webhookPath`,`method`),
  KEY `IDX_742496f199721a057051acf4c2` (`webhookId`,`method`,`pathLength`),
  KEY `fk_webhook_entity_workflow_id` (`workflowId`),
  CONSTRAINT `fk_webhook_entity_workflow_id` FOREIGN KEY (`workflowId`) REFERENCES `workflow_entity` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webhook_entity`
--

LOCK TABLES `webhook_entity` WRITE;
/*!40000 ALTER TABLE `webhook_entity` DISABLE KEYS */;
INSERT INTO `webhook_entity` VALUES
('send-email','POST','Webhook-trigger',NULL,NULL,'zHKUppUIKKFGBl55');
/*!40000 ALTER TABLE `webhook_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_entity`
--

DROP TABLE IF EXISTS `workflow_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_entity` (
  `name` varchar(128) NOT NULL,
  `active` tinyint NOT NULL,
  `nodes` json NOT NULL,
  `connections` json NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `settings` json DEFAULT NULL,
  `staticData` json DEFAULT NULL,
  `pinData` json DEFAULT NULL,
  `versionId` char(36) DEFAULT NULL,
  `triggerCount` int NOT NULL DEFAULT '0',
  `id` varchar(36) NOT NULL,
  `meta` json DEFAULT NULL,
  `parentFolderId` varchar(36) DEFAULT NULL,
  `isArchived` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_workflow_entity_name` (`name`),
  KEY `fk_workflow_parent_folder` (`parentFolderId`),
  CONSTRAINT `fk_workflow_parent_folder` FOREIGN KEY (`parentFolderId`) REFERENCES `folder` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_entity`
--

LOCK TABLES `workflow_entity` WRITE;
/*!40000 ALTER TABLE `workflow_entity` DISABLE KEYS */;
INSERT INTO `workflow_entity` VALUES
('Send email on new nf',1,'[{\"id\": \"906ee2f4-9c44-4fe7-a7b1-6fdb21d6e7bc\", \"name\": \"Webhook-trigger\", \"type\": \"n8n-nodes-base.webhook\", \"position\": [0, 0], \"webhookId\": \"a0efeea1-a068-46b3-9b30-f60840b268ef\", \"parameters\": {\"path\": \"send-email\", \"options\": {\"responseData\": \"{\\\"ok\\\": true}\", \"binaryPropertyName\": \"description\"}, \"httpMethod\": \"POST\", \"authentication\": \"headerAuth\"}, \"credentials\": {\"httpHeaderAuth\": {\"id\": \"R4bVj09h6TyQjXDV\", \"name\": \"Header Auth account\"}}, \"typeVersion\": 2.1}, {\"id\": \"6d3dba41-c770-47cf-a4e1-a0a7491f881b\", \"name\": \"Send notification email\", \"type\": \"n8n-nodes-base.emailSend\", \"position\": [208, 0], \"webhookId\": \"e8c45ad7-a76b-4958-9e17-efded9e238c6\", \"parameters\": {\"text\": \"={{$json.body.text}}\", \"options\": {\"appendAttribution\": true}, \"subject\": \"Nova nota cadastrada\", \"toEmail\": \"jhonnyjks@gmail.com\", \"fromEmail\": \"negocios@aliabrasil.online\", \"emailFormat\": \"text\"}, \"credentials\": {\"smtp\": {\"id\": \"j762PvhMNWKdt7Dr\", \"name\": \"SMTP account\"}}, \"typeVersion\": 2.1}]','{\"Webhook-trigger\": {\"main\": [[{\"node\": \"Send notification email\", \"type\": \"main\", \"index\": 0}]]}}','2025-08-30 19:46:37.411','2025-08-30 20:35:59.000','{\"executionOrder\": \"v1\"}',NULL,'{}','d599e71f-edca-40e5-9cf7-e9d04be8810b',1,'zHKUppUIKKFGBl55','{\"templateCredsSetupCompleted\": true}',NULL,0);
/*!40000 ALTER TABLE `workflow_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_history`
--

DROP TABLE IF EXISTS `workflow_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_history` (
  `versionId` varchar(36) NOT NULL,
  `workflowId` varchar(36) NOT NULL,
  `authors` varchar(255) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `nodes` json NOT NULL,
  `connections` json NOT NULL,
  PRIMARY KEY (`versionId`),
  KEY `IDX_1e31657f5fe46816c34be7c1b4` (`workflowId`),
  CONSTRAINT `FK_1e31657f5fe46816c34be7c1b4b` FOREIGN KEY (`workflowId`) REFERENCES `workflow_entity` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_history`
--

LOCK TABLES `workflow_history` WRITE;
/*!40000 ALTER TABLE `workflow_history` DISABLE KEYS */;
INSERT INTO `workflow_history` VALUES
('b39e1182-71c4-4731-afaf-3fe2e5c5ba2d','zHKUppUIKKFGBl55','Jhonny Mesquita','2025-08-30 19:51:44.750','2025-08-30 19:51:44.750','[{\"id\": \"906ee2f4-9c44-4fe7-a7b1-6fdb21d6e7bc\", \"name\": \"Webhook-trigger\", \"type\": \"n8n-nodes-base.webhook\", \"position\": [0, 0], \"webhookId\": \"a0efeea1-a068-46b3-9b30-f60840b268ef\", \"parameters\": {\"path\": \"send-email\", \"options\": {\"responseData\": \"{\\\"ok\\\": true}\"}, \"httpMethod\": \"POST\", \"authentication\": \"headerAuth\"}, \"credentials\": {\"httpHeaderAuth\": {\"id\": \"R4bVj09h6TyQjXDV\", \"name\": \"Header Auth account\"}}, \"typeVersion\": 2.1}, {\"id\": \"6d3dba41-c770-47cf-a4e1-a0a7491f881b\", \"name\": \"Send-notification-email\", \"type\": \"n8n-nodes-base.emailSend\", \"position\": [208, 0], \"webhookId\": \"e8c45ad7-a76b-4958-9e17-efded9e238c6\", \"parameters\": {\"text\": \"Um cliente cadastrou mais uma nota\", \"options\": {}, \"subject\": \"Nova nota cadastrada\", \"toEmail\": \"jhonnyjks@gmail.com\", \"fromEmail\": \"negocios@aliabrasil.online\", \"emailFormat\": \"text\"}, \"credentials\": {\"smtp\": {\"id\": \"j762PvhMNWKdt7Dr\", \"name\": \"SMTP account\"}}, \"typeVersion\": 2.1}]','{\"Webhook-trigger\": {\"main\": [[{\"node\": \"Send-notification-email\", \"type\": \"main\", \"index\": 0}]]}}'),
('b5c91fb5-cfcc-440a-9bda-c3e8611be14c','zHKUppUIKKFGBl55','Jhonny Mesquita','2025-08-30 20:00:11.796','2025-08-30 20:00:11.796','[{\"id\": \"906ee2f4-9c44-4fe7-a7b1-6fdb21d6e7bc\", \"name\": \"Webhook-trigger\", \"type\": \"n8n-nodes-base.webhook\", \"position\": [0, 0], \"webhookId\": \"a0efeea1-a068-46b3-9b30-f60840b268ef\", \"parameters\": {\"path\": \"send-email\", \"options\": {\"responseData\": \"{\\\"ok\\\": true}\", \"binaryPropertyName\": \"description\"}, \"httpMethod\": \"POST\", \"authentication\": \"headerAuth\"}, \"credentials\": {\"httpHeaderAuth\": {\"id\": \"R4bVj09h6TyQjXDV\", \"name\": \"Header Auth account\"}}, \"typeVersion\": 2.1}, {\"id\": \"6d3dba41-c770-47cf-a4e1-a0a7491f881b\", \"name\": \"Send-notification-email\", \"type\": \"n8n-nodes-base.emailSend\", \"position\": [208, 0], \"webhookId\": \"e8c45ad7-a76b-4958-9e17-efded9e238c6\", \"parameters\": {\"text\": \"Um cliente cadastrou mais uma nota\", \"options\": {}, \"subject\": \"Nova nota cadastrada\", \"toEmail\": \"jhonnyjks@gmail.com\", \"fromEmail\": \"negocios@aliabrasil.online\", \"emailFormat\": \"text\"}, \"credentials\": {\"smtp\": {\"id\": \"j762PvhMNWKdt7Dr\", \"name\": \"SMTP account\"}}, \"typeVersion\": 2.1}]','{\"Webhook-trigger\": {\"main\": [[{\"node\": \"Send-notification-email\", \"type\": \"main\", \"index\": 0}]]}}'),
('c8342d2b-712a-46f4-8b2d-233116b39cc9','zHKUppUIKKFGBl55','Jhonny Mesquita','2025-08-30 19:51:09.920','2025-08-30 19:51:09.920','[{\"id\": \"906ee2f4-9c44-4fe7-a7b1-6fdb21d6e7bc\", \"name\": \"Webhook-trigger\", \"type\": \"n8n-nodes-base.webhook\", \"position\": [0, 0], \"webhookId\": \"a0efeea1-a068-46b3-9b30-f60840b268ef\", \"parameters\": {\"path\": \"send-email\", \"options\": {\"responseData\": \"{\\\"ok\\\": true}\"}, \"httpMethod\": \"POST\", \"authentication\": \"headerAuth\"}, \"credentials\": {\"httpHeaderAuth\": {\"id\": \"R4bVj09h6TyQjXDV\", \"name\": \"Header Auth account\"}}, \"typeVersion\": 2.1}, {\"id\": \"6d3dba41-c770-47cf-a4e1-a0a7491f881b\", \"name\": \"Send-notification-email\", \"type\": \"n8n-nodes-base.emailSend\", \"position\": [208, 0], \"webhookId\": \"e8c45ad7-a76b-4958-9e17-efded9e238c6\", \"parameters\": {\"text\": \"Um cliente cadastrou mais uma nota\", \"options\": {}, \"subject\": \"Nova nota cadastrada\", \"toEmail\": \"jhonnyjks@gmail.com\", \"fromEmail\": \"negocios@aliabrasil.online\", \"emailFormat\": \"text\"}, \"credentials\": {\"smtp\": {\"id\": \"j762PvhMNWKdt7Dr\", \"name\": \"SMTP account\"}}, \"typeVersion\": 2.1}]','{\"Webhook-trigger\": {\"main\": [[{\"node\": \"Send-notification-email\", \"type\": \"main\", \"index\": 0}]]}}'),
('d599e71f-edca-40e5-9cf7-e9d04be8810b','zHKUppUIKKFGBl55','Jhonny Mesquita','2025-08-30 20:35:57.159','2025-08-30 20:35:57.159','[{\"id\": \"906ee2f4-9c44-4fe7-a7b1-6fdb21d6e7bc\", \"name\": \"Webhook-trigger\", \"type\": \"n8n-nodes-base.webhook\", \"position\": [0, 0], \"webhookId\": \"a0efeea1-a068-46b3-9b30-f60840b268ef\", \"parameters\": {\"path\": \"send-email\", \"options\": {\"responseData\": \"{\\\"ok\\\": true}\", \"binaryPropertyName\": \"description\"}, \"httpMethod\": \"POST\", \"authentication\": \"headerAuth\"}, \"credentials\": {\"httpHeaderAuth\": {\"id\": \"R4bVj09h6TyQjXDV\", \"name\": \"Header Auth account\"}}, \"typeVersion\": 2.1}, {\"id\": \"6d3dba41-c770-47cf-a4e1-a0a7491f881b\", \"name\": \"Send notification email\", \"type\": \"n8n-nodes-base.emailSend\", \"position\": [208, 0], \"webhookId\": \"e8c45ad7-a76b-4958-9e17-efded9e238c6\", \"parameters\": {\"text\": \"={{$json.body.text}}\", \"options\": {\"appendAttribution\": true}, \"subject\": \"Nova nota cadastrada\", \"toEmail\": \"jhonnyjks@gmail.com\", \"fromEmail\": \"negocios@aliabrasil.online\", \"emailFormat\": \"text\"}, \"credentials\": {\"smtp\": {\"id\": \"j762PvhMNWKdt7Dr\", \"name\": \"SMTP account\"}}, \"typeVersion\": 2.1}]','{\"Webhook-trigger\": {\"main\": [[{\"node\": \"Send notification email\", \"type\": \"main\", \"index\": 0}]]}}'),
('d87be536-05e5-43b7-ada1-473d8c21679e','zHKUppUIKKFGBl55','Jhonny Mesquita','2025-08-30 19:46:37.431','2025-08-30 19:46:37.431','[{\"id\": \"906ee2f4-9c44-4fe7-a7b1-6fdb21d6e7bc\", \"name\": \"Webhook\", \"type\": \"n8n-nodes-base.webhook\", \"position\": [0, 0], \"webhookId\": \"a0efeea1-a068-46b3-9b30-f60840b268ef\", \"parameters\": {\"path\": \"send-email\", \"options\": {\"responseData\": \"{\\\"ok\\\": true}\"}, \"httpMethod\": \"POST\", \"authentication\": \"headerAuth\"}, \"credentials\": {\"httpHeaderAuth\": {\"id\": \"R4bVj09h6TyQjXDV\", \"name\": \"Header Auth account\"}}, \"typeVersion\": 2.1}]','{}');
/*!40000 ALTER TABLE `workflow_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_statistics`
--

DROP TABLE IF EXISTS `workflow_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_statistics` (
  `count` int DEFAULT '0',
  `latestEvent` datetime DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `workflowId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `rootCount` int DEFAULT '0',
  PRIMARY KEY (`workflowId`,`name`),
  KEY `idx_workflow_statistics_workflow_id` (`workflowId`),
  CONSTRAINT `fk_workflow_statistics_workflow_id` FOREIGN KEY (`workflowId`) REFERENCES `workflow_entity` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_statistics`
--

LOCK TABLES `workflow_statistics` WRITE;
/*!40000 ALTER TABLE `workflow_statistics` DISABLE KEYS */;
INSERT INTO `workflow_statistics` VALUES
(1,'2025-08-30 19:56:18','data_loaded','zHKUppUIKKFGBl55',1),
(7,'2025-08-30 20:35:44','manual_success','zHKUppUIKKFGBl55',0),
(9,'2025-08-30 20:39:54','production_success','zHKUppUIKKFGBl55',9);
/*!40000 ALTER TABLE `workflow_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflows_tags`
--

DROP TABLE IF EXISTS `workflows_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflows_tags` (
  `workflowId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tagId` varchar(36) NOT NULL,
  PRIMARY KEY (`workflowId`,`tagId`),
  KEY `idx_workflows_tags_workflow_id` (`workflowId`),
  KEY `fk_workflows_tags_tag_id` (`tagId`),
  CONSTRAINT `fk_workflows_tags_tag_id` FOREIGN KEY (`tagId`) REFERENCES `tag_entity` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_workflows_tags_workflow_id` FOREIGN KEY (`workflowId`) REFERENCES `workflow_entity` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflows_tags`
--

LOCK TABLES `workflows_tags` WRITE;
/*!40000 ALTER TABLE `workflows_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflows_tags` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-30 17:42:09
