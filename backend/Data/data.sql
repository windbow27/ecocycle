-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 21, 2023 at 09:41 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";



--
-- Database: `blog_db`
--

-- --------------------------------------------------------
--
-- Table structure for table `admin`
--
DROP database campathon;
CREATE DATABASE campathon;
USE campathon;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
	`id` INTEGER NOT NULL AUTO_INCREMENT,
	`fullname` VARCHAR(255) NOT NULL,
	`username` varchar(255) NOT NULL,
	`password` varchar(255) NOT NULL,
	`isAdmin` SMALLINT NOT NULL,
	PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `username`, `password`, `isAdmin`) VALUES
(1, 'Alice Johnson', 'alice', '$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q', 0),
(2, 'Bob Smith', 'bob', '$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q', 0),
(3, 'Charlie Brown', 'charlie', '$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q', 0),
(4, 'Dave Wilson', 'dave', '$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q', 0),
(5, 'Eve Davis', 'eve', '$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q', 0),
(6, 'Frank Miller', 'frank', '$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q', 0),
(7, 'Grace Lee', 'grace', '$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q', 0),
(8, 'Hank Green', 'hank', '$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q', 0),
(9, 'Ivan Harris', 'ivan', '$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q', 0),
(10, 'Judy Clark', 'judy', '$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q', 0),
(11, 'Kyle Young', 'kyle', '$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q', 0),
(12, 'Laura Adams', 'laura', '$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q', 0),
(13, 'LA', 'A', '$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q', 0),
(0, 'flash', 'admin', '$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q',1);
-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(127) NOT NULL,
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category`) VALUES
(1, 'Metal'),
(2, 'Paper'),
(3, 'Glass'),
(4, 'Plastic'),
(5, 'Cardboard'),
(6, 'Battery');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `post_id` INTEGER NOT NULL AUTO_INCREMENT,
  `user_created` INTEGER NOT NULL,
  `post_title` varchar(127) NOT NULL,
  `post_text` text NOT NULL,
  `cover_url` varchar(255) NOT NULL DEFAULT 'default.jpg',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
   primary key (post_id),
   FOREIGN KEY (user_created) REFERENCES users(id) on delete cascade on update cascade
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`post_id`, `post_title`, `post_text`, `user_created`, `cover_url`, `created_at`) VALUES
(13, 'The Importance of Plastic Recycling', 'Recycling plastic helps reduce waste and save resources.', 1, 'COVER-64ba9e879b0c83.79174001.jpg', '2023-07-21 19:00:00'),
(2, 'How to Recycle Paper at Home', 'Paper recycling is an easy way to contribute to environmental conservation.', 2, 'COVER-64ba9e879b0c83.79174002.jpg', '2023-07-21 19:01:00'),
(3, 'Benefits of Metal Recycling', 'Recycling metals conserves natural resources and energy.', 3, 'COVER-64ba9e879b0c83.79174003.jpg', '2023-07-21 19:02:00'),
(4, 'Dealing with Electronic Waste', 'Proper disposal and recycling of e-waste is crucial for environmental health.', 4, 'COVER-64ba9e879b0c83.79174004.jpg', '2023-07-21 19:03:00'),
(5, 'Composting Organic Waste', 'Organic waste can be composted to create valuable fertilizer for gardens.', 5, 'COVER-64ba9e879b0c83.79174005.jpg', '2023-07-21 19:04:00'),
(6, 'Recycling Old Clothes', 'Textile recycling helps reduce landfill waste and promotes sustainability.', 6, 'COVER-64ba9e879b0c83.79174006.jpg', '2023-07-21 19:05:00'),
(7, 'Innovations in Plastic Recycling', 'New technologies are making plastic recycling more efficient.', 7, 'COVER-64ba9e879b0c83.79174007.jpg', '2023-07-21 19:06:00'),
(8, 'Advanced Techniques for Paper Recycling', 'Learn about the latest methods in paper recycling.', 8, 'COVER-64ba9e879b0c83.79174008.jpg', '2023-07-21 19:07:00'),
(9, 'Economic Benefits of Metal Recycling', 'Metal recycling can be profitable as well as environmentally friendly.', 9, 'COVER-64ba9e879b0c83.79174009.jpg', '2023-07-21 19:08:00'),
(10, 'Managing E-Waste in Urban Areas', 'Strategies for effective e-waste management in cities.', 10, 'COVER-64ba9e879b0c83.79174010.jpg', '2023-07-21 19:09:00'),
(11, 'Home Composting Tips', 'Simple tips for starting composting at home.', 11, 'COVER-64ba9e879b0c83.79174011.jpg', '2023-07-21 19:10:00'),
(12, 'Sustainable Fashion: Textile Recycling', 'How textile recycling contributes to sustainable fashion.', 12, 'COVER-64ba9e879b0c83.79174012.jpg', '2023-07-21 19:11:00'),
(1, 'Future of Technology', '<div><span style="color: rgb(48, 48, 48); font-family: Lato, sans-serif; font-size: 18px;">The digital revolution has already changed how people live, work, and communicate. And it’s only just getting started. But the same technologies that have the potential to help billions of people live happier, healthier, and more productive lives are also creating new challenges for citizens and governments around the world. From election meddling to data breaches and cyberattacks, recent events have shown that technology is changing how we think about privacy, national security, and maybe even democracy itself. In this project, we examine challenges in five key areas that will shape the future of the digital age: justice system, impact on democracy, global security and international conflict, the impact of automations and AI on the jobs marketplace, identity, and privacy. </span><span style="font-weight: 600; color: rgb(48, 48, 48); font-family: Lato, sans-serif; font-size: 18px;">Explore provocative and through-provoking topics on how technology impacts our lives</span><br></div><div><br><br><div class="videoEmbed" style="position:relative;height:0;padding-bottom:56.25%"><iframe src="https://www.youtube-nocookie.com/embed/8YmLJ6lSzMk?ecver=2" width="640" height="360" frameborder="0" style="position:absolute;width:100%;height:100%;left:0" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen=""></iframe></div><br><br><br></div><div><span style="font-weight: 600; color: rgb(48, 48, 48); font-family: Lato, sans-serif; font-size: 18px;"><br><br></span></div>', 1, 'COVER-64ba9e879b0c83.79174008.jpg', '2023-07-21 18:04:39');
-- --------------------------------------------------------

--
-- Table structure for table `post_category`
--

CREATE TABLE `post_category`(
	id INTEGER NOT NULL AUTO_INCREMENT,
    post_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (post_id) REFERENCES post(post_id) on delete cascade on update cascade,
    FOREIGN KEY (category_id) REFERENCES category(id) on delete cascade on update cascade
);


--
-- Dumping data for table `post_category`
--
INSERT INTO `post_category` (`post_id`, `category_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 1),
(8, 2),
(9, 3),
(10, 4),
(11, 5),
(12, 6),
(13, 1);


-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `comment_id` integer NOT NULL AUTO_INCREMENT,
  `user_id` integer NOT NULL,
  `post_id` integer NOT NULL,
  `comment` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
   PRIMARY KEY (comment_id),
   foreign key (user_id) references users(id) on delete cascade on update cascade,
   foreign key (post_id) references post(post_id) on delete cascade on update cascade
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment`
--
INSERT INTO `comment` (`comment`, `user_id`, `post_id`, `created_at`) VALUES
('Great post!', 3, 2, '2023-07-21 19:00:00'),
('Nice work', 2, 3, '2023-07-21 19:01:00'),
('Thanks for sharing', 3, 4, '2023-07-21 19:02:00'),
('Very informative', 4, 5, '2023-07-21 19:03:00'),
('Helpful!', 5, 6, '2023-07-21 19:04:00'),
('Awesome!', 6, 7, '2023-07-21 19:05:00'),
('Interesting read', 7, 8, '2023-07-21 19:06:00'),
('Good job', 8, 9, '2023-07-21 19:07:00'),
('Well done', 9, 10, '2023-07-21 19:08:00'),
('Nice tips', 10, 11, '2023-07-21 19:09:00'),
('Loved it', 11, 12, '2023-07-21 19:10:00'),
('Great insights', 12, 4, '2023-07-21 19:11:00');


-- --------------------------------------------------------

--
-- Table structure for table `post_like`
--

CREATE TABLE `post_like` (
  `liked_by` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `liked_at` datetime NOT NULL DEFAULT current_timestamp(),
   PRIMARY KEY (liked_by, post_id),
   FOREIGN KEY (liked_by) REFERENCES users(id) on delete cascade on update cascade,
   foreign key (post_id) references post(post_id) on delete cascade on update cascade
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post_like`
--

INSERT INTO `post_like` (`liked_by`, `post_id`, `liked_at`) VALUES
(2, 1, '2023-07-21 19:00:00'),
(3, 2, '2023-07-21 19:01:00'),
(4, 3, '2023-07-21 19:02:00'),
(5, 4, '2023-07-21 19:03:00'),
(6, 5, '2023-07-21 19:04:00'),
(7, 6, '2023-07-21 19:05:00'),
(8, 7, '2023-07-21 19:06:00'),
(9, 8, '2023-07-21 19:07:00'),
(10, 9, '2023-07-21 19:08:00'),
(11, 10, '2023-07-21 19:09:00'),
(12, 11, '2023-07-21 19:10:00'),
(13, 12, '2023-07-21 19:11:00'),
(2, 13, '2023-07-21 19:12:00'),
(3, 1, '2023-07-21 19:13:00'),
(4, 2, '2023-07-21 19:14:00'),
(5, 3, '2023-07-21 19:15:00'),
(6, 4, '2023-07-21 19:16:00'),
(7, 5, '2023-07-21 19:17:00'),
(8, 6, '2023-07-21 19:18:00'),
(9, 7, '2023-07-21 19:19:00'),
(10, 8, '2023-07-21 19:20:00'),
(11, 9, '2023-07-21 19:21:00'),
(12, 10, '2023-07-21 19:22:00'),
(13, 11, '2023-07-21 19:23:00'),
(2, 12, '2023-07-21 19:24:00'),
(3, 13, '2023-07-21 19:25:00'),
(4, 1, '2023-07-21 19:26:00'),
(5, 2, '2023-07-21 19:27:00'),
(6, 3, '2023-07-21 19:28:00'),
(7, 4, '2023-07-21 19:29:00'),
(8, 5, '2023-07-21 19:30:00'),
(9, 6, '2023-07-21 19:31:00'),
(10, 7, '2023-07-21 19:32:00'),
(11, 8, '2023-07-21 19:33:00'),
(12, 9, '2023-07-21 19:34:00'),
(13, 10, '2023-07-21 19:35:00');

-- --------------------------------------------------------

--
-- Table structure for table `blacklist token`
--

CREATE TABLE blacklist_token (
    `token` varchar(255) NOT NULL,
    `expired_at` TIMESTAMP,
    PRIMARY KEY (token)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DELIMITER //
CREATE TRIGGER set_expired_at BEFORE INSERT ON blacklist_token
FOR EACH ROW
BEGIN
    SET NEW.expired_at = CURRENT_TIMESTAMP + INTERVAL 1 DAY;
END;
//
DELIMITER ;


COMMIT;
SELECT * FROM users;