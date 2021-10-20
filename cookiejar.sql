-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 17, 2021 at 05:30 PM
-- Server version: 8.0.16
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cookiejar`
--

-- --------------------------------------------------------

--
-- Table structure for table `cookie`
--

CREATE TABLE `cookie` (
  `cid` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `edit_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_public` int(1) NOT NULL DEFAULT '0',
  `likes` int(5) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cookie`
--

INSERT INTO `cookie` (`cid`, `uid`, `title`, `edit_date`, `is_public`, `likes`) VALUES
(37, 3, 'New testing cookie', '2021-10-17 17:29:14', 0, 0),
(38, 3, 'only 15 min to deside', '2021-10-17 17:22:51', 0, 0),
(39, 3, 'Cookie with description and 2 tags          ', '2021-10-17 17:21:29', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cookie_msg`
--

CREATE TABLE `cookie_msg` (
  `cid` int(10) NOT NULL,
  `msg` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cookie_msg`
--

INSERT INTO `cookie_msg` (`cid`, `msg`) VALUES
(38, ' nice decision to utilize time'),
(39, '   how');

-- --------------------------------------------------------

--
-- Table structure for table `cookie_tag`
--

CREATE TABLE `cookie_tag` (
  `cid` int(10) NOT NULL,
  `tid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cookie_tag`
--

INSERT INTO `cookie_tag` (`cid`, `tid`) VALUES
(37, 17),
(38, 17),
(38, 18),
(39, 19);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `fid` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `feedback` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`fid`, `uid`, `feedback`) VALUES
(1, 3, 'Nice website..');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `tid` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`tid`, `uid`, `name`) VALUES
(17, 3, 'Daily Dose'),
(18, 3, 'Favourit'),
(19, 3, 'Study');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uid` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `name`, `email`, `password`) VALUES
(3, 'Zala Jaydip', 'jbzala004@gmail.com', '$2y$10$WuVJgA8vCMou0x1o8DUX6enzM5sbQjv5lYIfKjHrRIMRQe0D2kHei');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cookie`
--
ALTER TABLE `cookie`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `cookie_msg`
--
ALTER TABLE `cookie_msg`
  ADD UNIQUE KEY `cid_2` (`cid`),
  ADD KEY `cid` (`cid`);

--
-- Indexes for table `cookie_tag`
--
ALTER TABLE `cookie_tag`
  ADD UNIQUE KEY `cid_2` (`cid`,`tid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `tid` (`tid`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`fid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cookie`
--
ALTER TABLE `cookie`
  MODIFY `cid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `fid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `tid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cookie`
--
ALTER TABLE `cookie`
  ADD CONSTRAINT `cookie_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cookie_msg`
--
ALTER TABLE `cookie_msg`
  ADD CONSTRAINT `cookie_msg_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `cookie` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cookie_tag`
--
ALTER TABLE `cookie_tag`
  ADD CONSTRAINT `cookie_tag_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `cookie` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cookie_tag_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `tags` (`tid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `tags_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
