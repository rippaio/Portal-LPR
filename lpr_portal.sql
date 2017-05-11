-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 11, 2017 at 09:33 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

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
(3, 'NPS', 'Norfolk Public Schools', '48th street, 10', '48th street', 'Norfolk', 'VA', 23508, 'United States', '7578371205'),
(4, 'NSPED', 'Norfolk Public Schools Special Education', '48th street, 1055w, Apt 13', '48th street, 1055w, Apt 13', 'Norfolk', 'VA', 23508, 'United States', '7578371205'),
(5, 'NDHS', 'Norfolk Department of Human Services', '48th street, 1055w, Apt 13', '48th street, 1055w, Apt 13', 'Norfolk', 'VA', 23508, 'United States', '7578371205'),
(6, 'PPS', 'Portsmouth Public Schools', '48th street, 1055w, Apt 13', '48th street, 1055w, Apt 13', 'Norfolk', 'VA', 23508, 'United States', '7578371205'),
(8, 'PSPED', 'Portsmouth Public Schools Special Education', '48th street, 1055w, Apt 13', '48th street, 1055w, Apt 13', 'Norfolk', 'VA', 23508, 'United States', '7578371205'),
(9, 'CPS', 'Chesapeake Public Schools', '48th street, 1055w, Apt 13', '48th street, 1055w, Apt 13', 'Norfolk', 'VA', 23508, 'United States', '7578371205');

-- --------------------------------------------------------

--
-- Table structure for table `lpr_school`
--

CREATE TABLE `lpr_school` (
  `school_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `school_name` varchar(100) NOT NULL,
  `school_abr` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lpr_client`
--
ALTER TABLE `lpr_client`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `lpr_school`
--
ALTER TABLE `lpr_school`
  ADD PRIMARY KEY (`school_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lpr_client`
--
ALTER TABLE `lpr_client`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `lpr_school`
--
ALTER TABLE `lpr_school`
  MODIFY `school_id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
