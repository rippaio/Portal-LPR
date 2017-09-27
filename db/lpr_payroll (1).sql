-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 19, 2017 at 06:32 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lpr_portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `lpr_payroll`
--

CREATE TABLE `lpr_payroll` (
  `pl_id` int(11) NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `savedate` date NOT NULL,
  `amount` float NOT NULL,
  `driver_id` int(11) NOT NULL,
  `tBill` float DEFAULT NULL,
  `payToContractorsPerc` float DEFAULT NULL,
  `payToContractors` float DEFAULT NULL,
  `tips` float DEFAULT NULL,
  `additions` float DEFAULT NULL,
  `contractorsTotal` float DEFAULT NULL,
  `fuelAdvance` float DEFAULT NULL,
  `toll` float DEFAULT NULL,
  `leasePerc` float DEFAULT NULL,
  `lease` float DEFAULT NULL,
  `others` float DEFAULT NULL,
  `checkNumber` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lpr_payroll`
--
ALTER TABLE `lpr_payroll`
  ADD PRIMARY KEY (`pl_id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lpr_payroll`
--
ALTER TABLE `lpr_payroll`
  MODIFY `pl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `lpr_payroll`
--
ALTER TABLE `lpr_payroll`
  ADD CONSTRAINT `lpr_payroll_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `lpr_driver` (`driver_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
