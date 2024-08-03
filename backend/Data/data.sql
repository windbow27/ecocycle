-- MySQL dump 10.13  Distrib 8.0.37, for Linux (x86_64)
--
-- Host: localhost    Database: campathon
-- ------------------------------------------------------
-- Server version	8.0.37-0ubuntu0.22.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `blacklist_token`
--

DROP TABLE IF EXISTS `blacklist_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blacklist_token` (
  `token` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blacklist_token`
--

LOCK TABLES `blacklist_token` WRITE;
/*!40000 ALTER TABLE `blacklist_token` DISABLE KEYS */;
INSERT INTO `blacklist_token` VALUES ('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MjI2OTI1MTgsInVzZXJpZCI6MTQsInVzZXJuYW1lIjoiZmxhc2gifQ.xNo8ny9fPvqpemLr9nBkmCzvq3f6e1pEpWbLE_KU36M','2024-08-04 06:28:17');
/*!40000 ALTER TABLE `blacklist_token` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `set_expired_at` BEFORE INSERT ON `blacklist_token` FOR EACH ROW BEGIN
    SET NEW.expired_at = CURRENT_TIMESTAMP + INTERVAL 1 DAY;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(127) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Metal'),(2,'Paper'),(3,'Glass'),(4,'Plastic'),(5,'Cardboard'),(6,'Battery');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `post_id` int NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,3,2,'Great post!','2023-07-21 19:00:00'),(2,2,3,'Nice work','2023-07-21 19:01:00'),(3,3,4,'Thanks for sharing','2023-07-21 19:02:00'),(4,4,5,'Very informative','2023-07-21 19:03:00'),(5,5,6,'Helpful!','2023-07-21 19:04:00'),(6,6,7,'Awesome!','2023-07-21 19:05:00'),(7,7,8,'Interesting read','2023-07-21 19:06:00'),(8,8,9,'Good job','2023-07-21 19:07:00'),(9,9,10,'Well done','2023-07-21 19:08:00'),(10,10,11,'Nice tips','2023-07-21 19:09:00'),(11,11,12,'Loved it','2023-07-21 19:10:00'),(12,12,4,'Great insights','2023-07-21 19:11:00');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `post_id` int NOT NULL AUTO_INCREMENT,
  `user_created` int NOT NULL,
  `post_title` varchar(127) COLLATE utf8mb4_general_ci NOT NULL,
  `post_text` text COLLATE utf8mb4_general_ci NOT NULL,
  `cover_url` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default.jpg',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`post_id`),
  KEY `user_created` (`user_created`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`user_created`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,1,'Future of Technology','<div><span style=\"color: rgb(48, 48, 48); font-family: Lato, sans-serif; font-size: 18px;\">The digital revolution has already changed how people live, work, and communicate. And it’s only just getting started. But the same technologies that have the potential to help billions of people live happier, healthier, and more productive lives are also creating new challenges for citizens and governments around the world. From election meddling to data breaches and cyberattacks, recent events have shown that technology is changing how we think about privacy, national security, and maybe even democracy itself. In this project, we examine challenges in five key areas that will shape the future of the digital age: justice system, impact on democracy, global security and international conflict, the impact of automations and AI on the jobs marketplace, identity, and privacy. </span><span style=\"font-weight: 600; color: rgb(48, 48, 48); font-family: Lato, sans-serif; font-size: 18px;\">Explore provocative and through-provoking topics on how technology impacts our lives</span><br></div><div><br><br><div class=\"videoEmbed\" style=\"position:relative;height:0;padding-bottom:56.25%\"><iframe src=\"https://www.youtube-nocookie.com/embed/8YmLJ6lSzMk?ecver=2\" width=\"640\" height=\"360\" frameborder=\"0\" style=\"position:absolute;width:100%;height:100%;left:0\" webkitallowfullscreen=\"\" mozallowfullscreen=\"\" allowfullscreen=\"\"></iframe></div><br><br><br></div><div><span style=\"font-weight: 600; color: rgb(48, 48, 48); font-family: Lato, sans-serif; font-size: 18px;\"><br><br></span></div>','COVER-64ba9e879b0c83.79174008.jpg','2023-07-21 18:04:39'),(2,2,'How to Recycle Paper at Home','Paper recycling is an easy way to contribute to environmental conservation.','COVER-64ba9e879b0c83.79174002.jpg','2023-07-21 19:01:00'),(3,3,'Benefits of Metal Recycling','Recycling metals conserves natural resources and energy.','COVER-64ba9e879b0c83.79174003.jpg','2023-07-21 19:02:00'),(4,4,'Dealing with Electronic Waste','Proper disposal and recycling of e-waste is crucial for environmental health.','COVER-64ba9e879b0c83.79174004.jpg','2023-07-21 19:03:00'),(5,5,'Composting Organic Waste','Organic waste can be composted to create valuable fertilizer for gardens.','COVER-64ba9e879b0c83.79174005.jpg','2023-07-21 19:04:00'),(6,6,'Recycling Old Clothes','Textile recycling helps reduce landfill waste and promotes sustainability.','COVER-64ba9e879b0c83.79174006.jpg','2023-07-21 19:05:00'),(7,7,'Innovations in Plastic Recycling','New technologies are making plastic recycling more efficient.','COVER-64ba9e879b0c83.79174007.jpg','2023-07-21 19:06:00'),(8,8,'Advanced Techniques for Paper Recycling','Learn about the latest methods in paper recycling.','COVER-64ba9e879b0c83.79174008.jpg','2023-07-21 19:07:00'),(9,9,'Economic Benefits of Metal Recycling','Metal recycling can be profitable as well as environmentally friendly.','COVER-64ba9e879b0c83.79174009.jpg','2023-07-21 19:08:00'),(10,10,'Managing E-Waste in Urban Areas','Strategies for effective e-waste management in cities.','COVER-64ba9e879b0c83.79174010.jpg','2023-07-21 19:09:00'),(11,11,'Home Composting Tips','Simple tips for starting composting at home.','COVER-64ba9e879b0c83.79174011.jpg','2023-07-21 19:10:00'),(12,12,'Sustainable Fashion: Textile Recycling','How textile recycling contributes to sustainable fashion.','COVER-64ba9e879b0c83.79174012.jpg','2023-07-21 19:11:00'),(13,1,'The Importance of Plastic Recycling','Recycling plastic helps reduce waste and save resources.','COVER-64ba9e879b0c83.79174001.jpg','2023-07-21 19:00:00');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_category`
--

DROP TABLE IF EXISTS `post_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `post_category_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `post_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_category`
--

LOCK TABLES `post_category` WRITE;
/*!40000 ALTER TABLE `post_category` DISABLE KEYS */;
INSERT INTO `post_category` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,1),(8,8,2),(9,9,3),(10,10,4),(11,11,5),(12,12,6),(13,13,1);
/*!40000 ALTER TABLE `post_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_like`
--

DROP TABLE IF EXISTS `post_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_like` (
  `liked_by` int NOT NULL,
  `post_id` int NOT NULL,
  `liked_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`liked_by`,`post_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `post_like_ibfk_1` FOREIGN KEY (`liked_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `post_like_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_like`
--

LOCK TABLES `post_like` WRITE;
/*!40000 ALTER TABLE `post_like` DISABLE KEYS */;
INSERT INTO `post_like` VALUES (2,1,'2023-07-21 19:00:00'),(2,12,'2023-07-21 19:24:00'),(2,13,'2023-07-21 19:12:00'),(3,1,'2023-07-21 19:13:00'),(3,2,'2023-07-21 19:01:00'),(3,13,'2023-07-21 19:25:00'),(4,1,'2023-07-21 19:26:00'),(4,2,'2023-07-21 19:14:00'),(4,3,'2023-07-21 19:02:00'),(5,2,'2023-07-21 19:27:00'),(5,3,'2023-07-21 19:15:00'),(5,4,'2023-07-21 19:03:00'),(6,3,'2023-07-21 19:28:00'),(6,4,'2023-07-21 19:16:00'),(6,5,'2023-07-21 19:04:00'),(7,4,'2023-07-21 19:29:00'),(7,5,'2023-07-21 19:17:00'),(7,6,'2023-07-21 19:05:00'),(8,5,'2023-07-21 19:30:00'),(8,6,'2023-07-21 19:18:00'),(8,7,'2023-07-21 19:06:00'),(9,6,'2023-07-21 19:31:00'),(9,7,'2023-07-21 19:19:00'),(9,8,'2023-07-21 19:07:00'),(10,7,'2023-07-21 19:32:00'),(10,8,'2023-07-21 19:20:00'),(10,9,'2023-07-21 19:08:00'),(11,8,'2023-07-21 19:33:00'),(11,9,'2023-07-21 19:21:00'),(11,10,'2023-07-21 19:09:00'),(12,9,'2023-07-21 19:34:00'),(12,10,'2023-07-21 19:22:00'),(12,11,'2023-07-21 19:10:00'),(13,10,'2023-07-21 19:35:00'),(13,11,'2023-07-21 19:23:00'),(13,12,'2023-07-21 19:11:00');
/*!40000 ALTER TABLE `post_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `isAdmin` smallint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (0,'flash','admin','$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q',1),(1,'Alice Johnson','alice','$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q',0),(2,'Bob Smith','bob','$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q',0),(3,'Charlie Brown','charlie','$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q',0),(4,'Dave Wilson','dave','$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q',0),(5,'Eve Davis','eve','$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q',0),(6,'Frank Miller','frank','$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q',0),(7,'Grace Lee','grace','$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q',0),(8,'Hank Green','hank','$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q',0),(9,'Ivan Harris','ivan','$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q',0),(10,'Judy Clark','judy','$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q',0),(11,'Kyle Young','kyle','$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q',0),(12,'Laura Adams','laura','$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q',0),(13,'LA','A','$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q',0),(14,'Nguyen Chi Thanh','flash','12345678',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-03 13:29:21
