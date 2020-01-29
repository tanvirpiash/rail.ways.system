-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 31, 2019 at 06:57 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rail.ways`
--

-- --------------------------------------------------------

--
-- Table structure for table `addticket`
--

CREATE TABLE `addticket` (
  `addticketid` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(40) NOT NULL,
  `address` varchar(40) NOT NULL,
  `trainid` varchar(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `reservation` date DEFAULT NULL,
  `tme` time DEFAULT NULL,
  `sitno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `addticket`
--

INSERT INTO `addticket` (`addticketid`, `name`, `email`, `address`, `trainid`, `username`, `reservation`, `tme`, `sitno`) VALUES
(10, 'Piash Ahmed', 'Piash@ahmed.com', 'Khulna', 'a121', 'piash', '2019-12-31', '10:00:00', 1);

--
-- Triggers `addticket`
--
DELIMITER $$
CREATE TRIGGER `ticketbooked` AFTER INSERT ON `addticket` FOR EACH ROW INSERT INTO reserved(reserved.email,reserved.trainid,reserved.Time,reserved.username,reserved.reservedte,reserved.ondte)
VALUES(New.email,New.trainid,now(),New.username,New.reservation,New.tme)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminid` int(11) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(40) NOT NULL,
  `dob` date NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminid`, `fname`, `lname`, `phone`, `address`, `dob`, `username`, `email`, `password`) VALUES
(1, 'piash', 'ahmed', '', 'backers street', '2012-11-01', 'admin', 'piash@admin.com', 'admin'),
(2, 'Tanvir', 'Ahmed', '', 'abcd', '1995-12-10', 'Tanvir', 'Tan@vir.com', 'tan123');

-- --------------------------------------------------------

--
-- Table structure for table `reserved`
--

CREATE TABLE `reserved` (
  `reserveid` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `trainid` varchar(11) NOT NULL,
  `Time` timestamp NOT NULL DEFAULT current_timestamp(),
  `username` varchar(30) NOT NULL,
  `reservedte` date NOT NULL,
  `ondte` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reserved`
--

INSERT INTO `reserved` (`reserveid`, `email`, `trainid`, `Time`, `username`, `reservedte`, `ondte`) VALUES
(9, 'Piash@ahmed.com', 'a121', '2019-12-22 17:02:49', 'piash', '2019-12-31', '10:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `trains`
--

CREATE TABLE `trains` (
  `trainid` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `number` varchar(50) NOT NULL,
  `runfrom` varchar(20) NOT NULL,
  `runto` varchar(20) NOT NULL,
  `departure` time NOT NULL,
  `passenger` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trains`
--

INSERT INTO `trains` (`trainid`, `name`, `number`, `runfrom`, `runto`, `departure`, `passenger`) VALUES
(1, 'shundori', 'a121', 'Dhaka', 'Khulna', '10:00:00', 50),
(2, 'vasundhora', 'a123b', 'Comilla', 'Dhaka', '11:00:00', 50),
(3, 'vasu', 'a123bc', 'Dhaka', 'Khulna', '07:00:00', 75),
(4, 'AdventureLand', 'DHK-123', 'Dhaka', 'Sylhet', '11:00:00', 50);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `username` varchar(30) NOT NULL,
  `birthday` date NOT NULL,
  `bio` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `fname`, `lname`, `gender`, `phone`, `address`, `email`, `password`, `username`, `birthday`, `bio`) VALUES
(1, 'Tanvir', 'Ahmed', 'Male', '', 'backers street', 'piash@admin.com', 'admin', 'admin', '2016-09-01', 'simple'),
(4, 'Tanvir', 'Ahmed', 'Male', '+880772961005', 'Savar, Dhaka', 'Tanvir@gmail.com', 'ab12345c', 'tanvir', '1999-12-22', 'Simple'),
(5, 'Piash', 'Ahmed', 'Male', '+8801223972336', 'Khulna', 'Piash@ahmed.com', '12', 'piash', '2000-07-05', 'simple');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addticket`
--
ALTER TABLE `addticket`
  ADD PRIMARY KEY (`addticketid`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminid`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `reserved`
--
ALTER TABLE `reserved`
  ADD PRIMARY KEY (`reserveid`);

--
-- Indexes for table `trains`
--
ALTER TABLE `trains`
  ADD PRIMARY KEY (`trainid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addticket`
--
ALTER TABLE `addticket`
  MODIFY `addticketid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reserved`
--
ALTER TABLE `reserved`
  MODIFY `reserveid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `trains`
--
ALTER TABLE `trains`
  MODIFY `trainid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
