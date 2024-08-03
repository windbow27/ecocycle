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
INSERT INTO `post`(user_created, post_title, post_text, cover_url) VALUES (11, 'Cách để làm Lọ thủy tinh phát sáng', 'Bạn có muốn sở hữu một chiếc lọ lấp lánh phép màu không? Bài viết này sẽ hướng dẫn bạn cách để tự làm ra những chiếc lọ thủy tinh lung linh bằng những nguyên vật liệu dễ kiếm, và chỉ cần có một chút trí tưởng tượng, chiếc lọ của bạn sẽ trông như đang chứa những cô tiên tí hon trong đó vậy.

Bước 1: Hãy tiến hành làm lọ thủy tinh phát sáng vào buổi tối. Bạn sẽ cần dùng tới một số que phát sáng để thực hiện. Các loại que phát sáng chỉ có thể sáng trong một khoảng thời gian ngắn, vì thế, bạn nên làm việc này vào buổi tối. Như vậy, bạn sẽ không phí phạm khoảng thời gian phát sáng ngắn ngủi của chúng.

Bước 2: 
Tìm một chiếc lọ phù hợp. Bạn có thể dùng lọ to hoặc nhỏ tùy thích, nhưng lọ càng nhỏ thì càng sáng hơn. Chất dạ quang sẽ phân tán thưa thớt hơn đối với những chiếc lọ to, và vì thế, có thể bạn sẽ phải dùng tới nhiều que phát sáng hơn. Bạn cũng có thể sử dụng một chiếc lọ có hình bóng đèn với nút bấc.
Bạn có thể dùng lọ Mason đã được nhuộm màu. Hoặc bạn có thể tự nhuộm màu cho chiếc lọ của mình bằng cách hòa keo dán gỗ trong suốt với một vài giọt màu thực phẩm, sau đó dùng hỗn hợp này để sơn lên chiếc lọ.
https://www.wikihow.com/images/thumb/7/79/Make-Fairies-in-a-Jar-Step-2-Version-10.jpg/v4-728px-Make-Fairies-in-a-Jar-Step-2-Version-10.jpg.webp

Bước 3:
Mua một ít que phát sáng. Bất kỳ loại que phát sáng nào cũng được, nhưng loại có độ dài khoảng 15 cm sẽ có độ sáng tốt hơn so với loại dùng làm vòng tay và vòng cổ – những loại đó phát sáng khá ngắn. Số lượng que phát sáng bạn cần mua sẽ phụ thuộc vào kích cỡ của chiếc lọ. Lọ càng to thì bạn càng cần tới nhiều que phát sáng hơn.
+ Bạn sẽ cần tới hai hoặc ba que phát sáng, tùy vào kích cỡ của chiếc lọ. Ví dụ: một chiếc lọ có dung tích khoảng 0,5 lít sẽ cần hai tới ba que phát sáng dài 15 cm.[1]
+ Hãy mua loại que có khả năng phát sáng lâu. Phần lớn các loại que phát sáng chỉ có thể dạ quang từ 2 tới 3 tiếng, nhưng cũng có những loại kéo dài tới 4 hoặc 6 tiếng. Tuy nhiên, một số loại có thể phát sáng tới 12 tiếng. Thông tin trên bao bì sẽ cho bạn biết loại que phát sáng đó có khả năng sáng trong bao lâu. Que phát sáng càng lâu thì bạn càng có nhiều thời gian để thưởng thức vẻ đẹp của chiếc lọ thủy tinh.
+ Hãy mua que phát sáng có nhiều màu sắc khác nhau. Hầu hết các loại que phát sáng sẽ có các màu cơ bản như đỏ, hồng, cam, vàng, xanh lá, xanh dương, tím và trắng. Bạn có thể tạo ra nhiều màu sắc mới lạ bằng cách kết hợp nhiều màu sắc với nhau. Ví dụ: bạn có thể trộn màu xanh dương với xanh lá để được màu xanh cổ vịt.
https://www.wikihow.com/images/thumb/6/67/Make-Fairies-in-a-Jar-Step-3-Version-10.jpg/v4-728px-Make-Fairies-in-a-Jar-Step-3-Version-10.jpg.webp

Bước 4:
Làm cho chiếc que phát sáng. Cầm que bằng hai tay và bẻ cong tới khi bạn nghe thấy tiếng “rắc”. Động tác này sẽ làm vỡ ống thủy tinh bên trong và giải phóng các hóa chất khiến chiếc que phát sáng.
https://www.wikihow.com/images_en/thumb/4/4a/Make-Fairies-in-a-Jar-Step-4-Version-10.jpg/550px-nowatermark-Make-Fairies-in-a-Jar-Step-4-Version-10.jpg.webp

Bước 5:
Cầm chiếc que trên miệng lọ thủy tinh và cắt một đầu. Bạn có thể dùng dao rọc giấy hoặc kéo. Que phát sáng không độc, nhưng hóa chất của nó có thể khiến da bạn bị kích ứng. Hãy mang găng tay cao su khi thực hiện việc này.
+ Nếu trẻ em làm bước này, phải có người lớn giám sát.
+ Đặt một chiếc rây nhỏ có mắt khít lên miệng lọ. Nó sẽ giữ lại những mảnh thủy tinh nhỏ trong chiếc que phát sáng. Đừng dùng lại chiếc rây này để nấu ăn hay làm bánh sau khi hoàn thành bước này.
https://www.wikihow.com/images_en/thumb/f/f1/Make-Fairies-in-a-Jar-Step-5-Version-10.jpg/550px-nowatermark-Make-Fairies-in-a-Jar-Step-5-Version-10.jpg.webp

Bước 6:
Đổ chất lỏng vào trong lọ. Dốc ngược chiếc que phát sáng và đổ chất lỏng của nó vào trong lọ. Có thể bạn sẽ phải vẩy chiếc que một chút để chất lỏng chảy ra hết.
Nếu có mảnh thủy tinh nào rơi vào trong lọ, bạn có thể lấy chúng ra bằng cách dùng dĩa nhựa hoặc thìa nhựa. Vứt chiếc dĩa hoặc chiếc thìa đó đi, đừng dùng nó để xúc đồ ăn.
https://www.wikihow.com/images_en/thumb/3/3e/Make-Fairies-in-a-Jar-Step-6-Version-10.jpg/550px-nowatermark-Make-Fairies-in-a-Jar-Step-6-Version-10.jpg.webp

Bước 7:
Rắc vào đó một chút kim tuyến. Bạn có thể dùng bất kỳ loại kim tuyến nào bạn thích, nhưng loại kim tuyến óng ánh sẽ khiến chiếc lọ của bạn trông đẹp hơn do nó có khả năng phản chiếu ánh sáng. Lượng kim tuyến cần dùng sẽ phụ thuộc vào kích cỡ của chiếc lọ và ý thích của bạn. Ví dụ: để khiến một chiếc lọ có dung tích 0,5 lít trở nên bắt mắt, bạn sẽ cần tới khoảng 32 gr kim tuyến loại mịn.
+ Bạn có thể dùng loại kim tuyến có hình bông hoa, trái tim và ngôi sao[2]
+ Bạn có thể trộn giữa kim tuyến loại mịn với kim tuyến cỡ to hơn với những màu sắc khác nhau để có hiệu ứng bắt mắt hơn.
https://www.wikihow.com/images_en/thumb/8/8d/Make-Fairies-in-a-Jar-Step-7-Version-9.jpg/550px-nowatermark-Make-Fairies-in-a-Jar-Step-7-Version-9.jpg.webp

Bước 8:
Hãy cho vào lọ một thứ gì đó. Chất lỏng trong que phát sáng sẽ khiến kim tuyến bị dính vào thành lọ, nhưng bạn có thể khiến kim tuyến trông như đang bay lơ lửng trong đó bằng cách bỏ vào đó một miếng vải voan hoặc vải màn trắng.[4] Bạn cũng có thể dùng giấy bóng kính. Chỉ cần cắt một miếng giấy hoặc vải mà bạn thích, vo nhẹ nó lại và bỏ vào trong lọ. Nó cần phải đủ lớn để đặt vừa xinh vào trong chiếc lọ mà không chiếm hết không gian trong đó.
https://www.wikihow.com/images_en/thumb/8/81/Make-Fairies-in-a-Jar-Step-8-Version-5.jpg/550px-nowatermark-Make-Fairies-in-a-Jar-Step-8-Version-5.jpg.webp

Bước 9:
Đóng nắp lại thật chặt và lắc chiếc lọ. Hãy lắc sao cho chất lỏng dạ quang và kim tuyển phủ hết bên trong thành lọ.
https://www.wikihow.com/images_en/thumb/a/ad/Make-Fairies-in-a-Jar-Step-9-Version-8.jpg/550px-nowatermark-Make-Fairies-in-a-Jar-Step-9-Version-8.jpg.webp

Bước 10:
Trang trí chiếc lọ. Bạn có thể khiến chiếc lọ của mình trở nên xinh đẹp hơn bằng cách trang trí nắp lọ bằng kim tuyến hoặc phủ một miếng vải đẹp lên đó. Hãy xem phần hướng dẫn trang trí nắp lọ trong bài viết này để có thêm nhiều ý tưởng thú vị.
https://www.wikihow.com/images/thumb/3/3f/Make-Fairies-in-a-Jar-Step-10-Version-5.jpg/v4-728px-Make-Fairies-in-a-Jar-Step-10-Version-5.jpg.webp

Bước 11:
Mang chiếc lọ vào một căn phòng tối. Chất lỏng của que phát sáng vẫn sẽ hoạt động lúc trời sáng, nhưng lúc trời tối, nó sẽ sáng hơn nhiều.
https://www.wikihow.com/images/thumb/e/e8/Make-Fairies-in-a-Jar-Step-11-Version-8.jpg/v4-728px-Make-Fairies-in-a-Jar-Step-11-Version-8.jpg.webp

Nguồn: https://www.wikihow.vn/L%C3%A0m-L%E1%BB%8D-th%E1%BB%A7y-tinh-Ph%C3%A1t-s%C3%A1ng.
', 'https://www.wikihow.com/images/thumb/9/9a/Make-Fairies-in-a-Jar-Step-1-Version-7.jpg/v4-728px-Make-Fairies-in-a-Jar-Step-1-Version-7.jpg.webp');
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
INSERT INTO `post_category`(post_id, category_id) VALUES (1,3);
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
