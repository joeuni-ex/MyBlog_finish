-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: my_blog
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `board_idx` int NOT NULL AUTO_INCREMENT,
  `title` varchar(500) NOT NULL,
  `content` text NOT NULL,
  `user_idx` int DEFAULT NULL,
  `info_idx` int DEFAULT NULL,
  `viewCnt` int DEFAULT '0',
  `regDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`board_idx`),
  KEY `user_idx_fk_idx` (`user_idx`),
  KEY `info_idx_fx_idx` (`info_idx`),
  CONSTRAINT `info_idx_fx` FOREIGN KEY (`info_idx`) REFERENCES `category_info` (`info_idx`),
  CONSTRAINT `user_idx_fk` FOREIGN KEY (`user_idx`) REFERENCES `user` (`user_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'오늘은 정말 피곤했다','오늘은 몸이 좋지 않아서 피곤했다. ',1,1,0,'2023-10-30 07:14:43'),(2,'오늘 저녁은 쭈꾸미','맛집임',NULL,3,0,'2023-11-02 06:31:59'),(3,'가을에 책 뭐 읽지?','책은 뭐가 좋을까요?',NULL,2,0,'2023-11-03 03:25:51'),(4,'가을에 책 뭐 읽지?','책은 뭐가 좋을까요?',NULL,2,0,'2023-11-03 03:25:51'),(5,'가을에 책 뭐 읽지?','책은 뭐가 좋을까요?',NULL,2,0,'2023-11-03 03:25:51'),(6,'가을에 책 뭐 읽지?','책은 뭐가 좋을까요?',NULL,2,0,'2023-11-03 03:25:51'),(7,'가을에 책 뭐 읽지?','책은 뭐가 좋을까요?',NULL,2,0,'2023-11-03 03:25:51'),(8,'가을에 책 뭐 읽지?','책은 뭐가 좋을까요?',NULL,2,0,'2023-11-03 03:25:51'),(9,'가을에 책 뭐 읽지?','책은 뭐가 좋을까요?',NULL,2,0,'2023-11-03 03:25:51'),(10,'가을에 책 뭐 읽지?','책은 뭐가 좋을까요?',NULL,2,0,'2023-11-03 03:25:51'),(11,'가을에 책 뭐 읽지?','책은 뭐가 좋을까요?',NULL,2,0,'2023-11-03 03:25:51'),(12,'가을에 책 뭐 읽지?','책은 뭐가 좋을까요?',NULL,2,0,'2023-11-03 03:25:51'),(13,'오늘 일정은?','뭘까욥??',NULL,1,0,'2023-11-03 03:26:20'),(14,'오늘 일정은?','뭘까욥??',NULL,1,0,'2023-11-03 03:26:20'),(15,'오늘 일정은?','뭘까욥??',NULL,1,0,'2023-11-03 03:26:20'),(16,'오늘 일정은?','뭘까욥??',NULL,1,0,'2023-11-03 03:26:20'),(17,'오늘 일정은?','뭘까욥??',NULL,1,0,'2023-11-03 03:26:20'),(18,'오늘 일정은?','뭘까욥??',NULL,1,0,'2023-11-03 03:26:20'),(19,'오늘 일정은?','뭘까욥??',NULL,1,0,'2023-11-03 03:26:20'),(20,'오늘 일정은?','뭘까욥??',NULL,1,0,'2023-11-03 03:26:20'),(21,'오늘 일정은?','뭘까욥??',NULL,1,0,'2023-11-03 03:26:20'),(22,'오늘 일정은?','뭘까욥??',NULL,1,0,'2023-11-03 03:26:20'),(23,'오늘 점심은?','라면',NULL,3,0,'2023-11-03 03:26:41'),(24,'오늘 점심은?','라면',NULL,3,0,'2023-11-03 03:26:41'),(25,'오늘 점심은?','라면',NULL,3,0,'2023-11-03 03:26:41'),(26,'오늘 점심은?','라면',NULL,3,0,'2023-11-03 03:26:41'),(27,'오늘 점심은?','라면',NULL,3,0,'2023-11-03 03:26:41'),(28,'오늘 점심은?','라면',NULL,3,0,'2023-11-03 03:26:41'),(29,'오늘 점심은?','라면',NULL,3,0,'2023-11-03 03:26:41'),(30,'오늘 점심은?','라면',NULL,3,0,'2023-11-03 03:26:41'),(31,'오늘 점심은?','라면',NULL,3,0,'2023-11-03 03:26:41'),(32,'오늘 점심은?','라면',NULL,3,0,'2023-11-03 03:26:41'),(33,'가을 여행지로는 ','어디가 좋을까요?',NULL,4,0,'2023-11-03 03:26:54'),(34,'가을 여행지로는 ','어디가 좋을까요?',NULL,4,0,'2023-11-03 03:26:55'),(35,'가을 여행지로는 ','어디가 좋을까요?',NULL,4,0,'2023-11-03 03:26:55'),(36,'가을 여행지로는 ','어디가 좋을까요?',NULL,4,0,'2023-11-03 03:26:55'),(37,'가을 여행지로는 ','어디가 좋을까요?',NULL,4,0,'2023-11-03 03:26:55'),(38,'가을 여행지로는 ','어디가 좋을까요?',NULL,4,0,'2023-11-03 03:26:55'),(39,'가을 여행지로는 ','어디가 좋을까요?',NULL,4,0,'2023-11-03 03:26:55'),(40,'가을 여행지로는 ','어디가 좋을까요?',NULL,4,0,'2023-11-03 03:26:55'),(41,'가을 여행지로는 ','어디가 좋을까요?',NULL,4,0,'2023-11-03 03:26:55'),(42,'가을 여행지로는 ','어디가 좋을까요?',NULL,4,32,'2023-11-03 03:26:55'),(43,'신상 템 소개','이번에 새로 출시된 립스틱 , 내돈내산합니다.',NULL,5,0,'2023-11-03 03:27:18'),(44,'신상 템 소개','이번에 새로 출시된 립스틱 , 내돈내산합니다.',NULL,5,0,'2023-11-03 03:27:18'),(45,'신상 템 소개','이번에 새로 출시된 립스틱 , 내돈내산합니다.',NULL,5,0,'2023-11-03 03:27:18'),(46,'신상 템 소개','이번에 새로 출시된 립스틱 , 내돈내산합니다.',NULL,5,0,'2023-11-03 03:27:18'),(47,'신상 템 소개','이번에 새로 출시된 립스틱 , 내돈내산합니다.',NULL,5,0,'2023-11-03 03:27:18'),(48,'신상 템 소개','이번에 새로 출시된 립스틱 , 내돈내산합니다.',NULL,5,0,'2023-11-03 03:27:18'),(49,'신상 템 소개','이번에 새로 출시된 립스틱 , 내돈내산합니다.',NULL,5,0,'2023-11-03 03:27:18'),(50,'신상 템 소개','이번에 새로 출시된 립스틱 , 내돈내산합니다.',NULL,5,0,'2023-11-03 03:27:18'),(51,'신상 템 소개','이번에 새로 출시된 립스틱 , 내돈내산합니다.',NULL,5,0,'2023-11-03 03:27:18'),(52,'신상 템 소개','이번에 새로 출시된 립스틱 , 내돈내산합니다.',NULL,5,0,'2023-11-03 03:27:18');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_info`
--

DROP TABLE IF EXISTS `category_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_info` (
  `info_idx` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(500) NOT NULL,
  PRIMARY KEY (`info_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_info`
--

LOCK TABLES `category_info` WRITE;
/*!40000 ALTER TABLE `category_info` DISABLE KEYS */;
INSERT INTO `category_info` VALUES (1,'DAILY'),(2,'BOOK'),(3,'FOOD'),(4,'TRAVLE'),(5,'BEAUTY');
/*!40000 ALTER TABLE `category_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reply` (
  `reply_idx` int NOT NULL AUTO_INCREMENT,
  `board_idx` int NOT NULL,
  `user_idx` int NOT NULL,
  `content` varchar(500) NOT NULL,
  `regDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reply_idx`),
  KEY `board_idx_fk_idx` (`board_idx`),
  KEY `user_idx_fk_idx` (`user_idx`),
  CONSTRAINT `board_idx_fk` FOREIGN KEY (`board_idx`) REFERENCES `board` (`board_idx`),
  CONSTRAINT `user_idx_fk2` FOREIGN KEY (`user_idx`) REFERENCES `user` (`user_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` VALUES (1,97,2,'댓글작성합니다','2023-11-05 07:21:57'),(2,1,2,'서로이웃해요','2023-11-05 08:58:11'),(6,42,2,'안녕하세요 여행지는 경주가 어떨까요?','2023-11-06 00:18:45'),(8,42,2,'아니면 거제도 추천드려요!! 수정할게요 부산이 좋아요','2023-11-06 00:19:25');
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_idx` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `user_pw` varchar(100) NOT NULL,
  PRIMARY KEY (`user_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'홍길동','hong','1111'),(2,'단무지','anwl1234','1234');
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

-- Dump completed on 2023-11-06 10:35:05
