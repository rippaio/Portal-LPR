-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2017 at 04:18 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.0.16

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
-- Table structure for table `lpr_driver_contract`
--

CREATE TABLE `lpr_driver_contract` (
  `o_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `period` varchar(10) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lpr_driver_contract`
--

INSERT INTO `lpr_driver_contract` (`o_id`, `driver_id`, `start_date`, `end_date`, `status`, `period`, `id`) VALUES
(149, 112, '2017-10-02', '2017-10-03', 'close', 'AM', 6),
(149, 112, '2017-10-04', NULL, 'open', 'AM', 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lpr_driver_contract`
--
ALTER TABLE `lpr_driver_contract`
  ADD PRIMARY KEY (`id`),
  ADD KEY `o_id` (`o_id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lpr_driver_contract`
--
ALTER TABLE `lpr_driver_contract`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `lpr_driver_contract`
--
ALTER TABLE `lpr_driver_contract`
  ADD CONSTRAINT `lpr_driver_contract_ibfk_1` FOREIGN KEY (`o_id`) REFERENCES `lpr_order` (`o_id`),
  ADD CONSTRAINT `lpr_driver_contract_ibfk_2` FOREIGN KEY (`driver_id`) REFERENCES `lpr_driver` (`driver_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
