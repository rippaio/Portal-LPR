-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2017 at 12:25 AM
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
CREATE DATABASE IF NOT EXISTS `lpr_portal` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `lpr_portal`;

-- --------------------------------------------------------

--
-- Table structure for table `lpr_client`
--

CREATE TABLE `lpr_client` (
  `client_id` int(11) NOT NULL,
  `client_abr` varchar(10) NOT NULL,
  `client_name` varchar(200) NOT NULL,
  `client_street` varchar(200) NOT NULL,
  `client_address` varchar(200) NOT NULL,
  `client_city` varchar(200) NOT NULL,
  `client_state` varchar(100) NOT NULL,
  `client_zip` int(10) NOT NULL,
  `client_country` varchar(50) NOT NULL,
  `client_contact` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lpr_client`
--

INSERT INTO `lpr_client` (`client_id`, `client_abr`, `client_name`, `client_street`, `client_address`, `client_city`, `client_state`, `client_zip`, `client_country`, `client_contact`) VALUES
(3, 'NPS', 'Norfolk Public Schools', '48th street, 1055w, Apt 13', '48th street, 1055w, Apt 13', 'Norfolk', 'VA', 23508, 'United States', '7578371205'),
(4, 'NSPED', 'Norfolk Public Schools Special Education', '48th street, 1055w, Apt 13', '48th street, 1055w, Apt 13', 'Norfolk', 'VA', 23508, 'United States', '7578371205'),
(5, 'NDHS', 'Norfolk Department of Human Services', '48th street, 1055w, Apt 13', '48th street, 1055w, Apt 13', 'Norfolk', 'VA', 23508, 'United States', '7578371205'),
(6, 'PPS', 'Portsmouth Public Schools', '48th street, 1055w, Apt 13', '48th street, 1055w, Apt 13', 'Norfolk', 'VA', 23508, 'United States', '7578371205');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lpr_client`
--
ALTER TABLE `lpr_client`
  ADD PRIMARY KEY (`client_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lpr_client`
--
ALTER TABLE `lpr_client`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
