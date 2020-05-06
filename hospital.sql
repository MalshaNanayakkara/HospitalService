-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: May 06, 2020 at 08:32 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `healthcaredb`
--

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `hospitalID` int(11) NOT NULL,
  `hospitalName` varchar(50) NOT NULL,
  `hospitalProvince` varchar(50) NOT NULL,
  `hospitalDistrict` varchar(50) NOT NULL,
  `hospitalEmail` varchar(50) NOT NULL,
  `hospitalPhone` varchar(11) NOT NULL,
  `hospitalServices` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hospital`
--

INSERT INTO `hospital` (`hospitalID`, `hospitalName`, `hospitalProvince`, `hospitalDistrict`, `hospitalEmail`, `hospitalPhone`, `hospitalServices`) VALUES
(2, 'Nawaloka Hospital', 'Western', 'Colombo', 'nawaloka@gmail.com', '011-2345678', 'OPD,ICU,Rooms'),
(3, 'Hemas hospital', 'Southern', 'Matara', 'hemas@gmail.com', '041-6578964', 'OPD,ICU,Pharmacy'),
(4, 'Asiri Hospital', 'Central', 'Kandy', 'asiri@gmail.com', '0982564785', 'ICU,Rooms'),
(5, 'Royal Hospital', 'Southern', 'Galle', 'royal@gmail.com', '0912378456', 'OPD,ICU'),
(6, 'Neville Fernando', 'Western', 'Colombo', 'neville@gmail.com', '011-8907634', 'OPD,Rooms,ICU');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`hospitalID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hospital`
--
ALTER TABLE `hospital`
  MODIFY `hospitalID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
