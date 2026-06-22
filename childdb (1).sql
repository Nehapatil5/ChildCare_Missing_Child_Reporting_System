-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 27, 2025 at 04:56 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `childdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `child_report`
--

CREATE TABLE `child_report` (
  `id` int(10) NOT NULL,
  `citizen_Id` int(10) NOT NULL,
  `child_Name` varchar(30) NOT NULL,
  `age` int(3) NOT NULL,
  `lastSeen_Location` varchar(50) NOT NULL,
  `image_Path` varchar(200) NOT NULL,
  `report_Date` varchar(30) NOT NULL,
  `Status` varchar(25) NOT NULL,
  `Description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `child_report`
--

INSERT INTO `child_report` (`id`, `citizen_Id`, `child_Name`, `age`, `lastSeen_Location`, `image_Path`, `report_Date`, `Status`, `Description`) VALUES
(2, 2, 'Tejas', 9, 'Dhule', '2vsudvbxdc_jkhvbfxd.jpeg', '2018-03-07', 'Not Found', 'cvmmnmjghurkdxhf'),
(3, 2, 'Harshali', 10, 'Pune', 'Harshali.jpg', '2025-09-07', 'Not Found', 'njsj,zasjsgcg'),
(4, 2, 'Shiva', 7, 'Pune', 'Shiva.jpg', '2024-08-01', 'Not Found', 'mxncjwuh7sd'),
(5, 1, 'Prisha', 7, 'Pune', 'Shiva.jpg', '2024-08-01', 'Not Found', 'Missing'),
(6, 1, 'Gunjan', 18, 'Shirpur SES hostel', 'gunju.jpeg', '2011-11-11', 'Not Found', 'height 5.5 wt 50 '),
(7, 4, 'Roshani', 5, 'pune', 'Roshnai.jpg', '2007-10-15', 'Not Found', 'byydgcyhnfcu mad hgirl'),
(8, 4, 'Roshani', 5, 'pune', 'Roshani..jpg', '2007-10-15', 'Not Found', 'xyz'),
(9, 4, 'Bhargav', 5, 'Mumbai', 'Bargav.jpg', '2015-08-11', 'Not Found', 'abc'),
(10, 1, 'Mansi', 9, 'Shirpur ', 'Mansi_Image.avif', '2011-06-08', 'Not Found', 'pqr'),
(11, 1, 'Prerana', 7, 'Shirpur ', 'Prerana.jpg', '2011-06-08', 'Not Found', 'abc'),
(12, 2, 'Shiva', 7, 'Pune', 'Shiva.jpg', '2022-06-08', 'Not Found', 'abc'),
(13, 2, 'Tejas', 7, 'Chopda', 'Tejas.jpeg', '2017-06-08', 'Not Found', 'pqr'),
(14, 2, 'Ganesh', 7, 'Dhule', 'Tejas.jpeg', '2018-06-08', 'Found', 'abc');

-- --------------------------------------------------------

--
-- Table structure for table `citizen`
--

CREATE TABLE `citizen` (
  `c_id` int(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `address` varchar(50) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `citizen`
--

INSERT INTO `citizen` (`c_id`, `name`, `contact`, `address`, `email`, `password`) VALUES
(1, 'Gayatri Patil', '8967426732', 'Shirpur tal. shirpur', 'g@gmail.com', '1234'),
(2, 'Mansi', '9854677887', 'Jalgoan', 'm@gmail.com', '12345'),
(3, 'Mansi', '9854677887', 'Jalgoan', 'm@gmail.com', '12345'),
(4, 'Ronak', '7020047205', 'chopda', 'ronak@gmail.com', '1233');

-- --------------------------------------------------------

--
-- Table structure for table `police`
--

CREATE TABLE `police` (
  `p_id` int(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `station` varchar(40) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `police`
--

INSERT INTO `police` (`p_id`, `name`, `station`, `contact`, `email`, `password`) VALUES
(1, 'Tanushree', 'Central Police Station', '7890675467', 't@gmail.com', '12345'),
(3, 'Bhargav', 'Jalgoan Police Station', '7856323734', 'b@gmail.com', '12345'),
(5, 'Prerana', 'Nagpur', '9867658897', 'p@gmail.com', '12345');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `child_report`
--
ALTER TABLE `child_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `citizen`
--
ALTER TABLE `citizen`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `police`
--
ALTER TABLE `police`
  ADD PRIMARY KEY (`p_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `child_report`
--
ALTER TABLE `child_report`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `citizen`
--
ALTER TABLE `citizen`
  MODIFY `c_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `police`
--
ALTER TABLE `police`
  MODIFY `p_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
