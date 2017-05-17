-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2017 at 06:12 PM
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

DROP TABLE IF EXISTS `lpr_client`;
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
-- Table structure for table `lpr_driver`
--

DROP TABLE IF EXISTS `lpr_driver`;
CREATE TABLE `lpr_driver` (
  `driver_id` int(11) NOT NULL,
  `driver_fname` varchar(20) NOT NULL,
  `driver_mname` varchar(20) DEFAULT NULL,
  `driver_lname` varchar(20) NOT NULL,
  `driver_street` varchar(200) NOT NULL,
  `driver_address` varchar(200) NOT NULL,
  `driver_city` varchar(50) NOT NULL,
  `driver_zip` varchar(20) NOT NULL,
  `driver_contact_no` varchar(20) NOT NULL,
  `driver_ssn` int(20) DEFAULT NULL,
  `driver_dl_no` int(20) DEFAULT NULL,
  `driver_dl_state` varchar(20) DEFAULT NULL,
  `driver_emg_contact` varchar(20) DEFAULT NULL,
  `driver_commision` int(5) NOT NULL,
  `driver_dname` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lpr_order`
--

DROP TABLE IF EXISTS `lpr_order`;
CREATE TABLE `lpr_order` (
  `o_id` int(11) NOT NULL,
  `client_id` int(10) NOT NULL,
  `school_id` int(10) NOT NULL,
  `o_startdate` date NOT NULL,
  `o_enddate` date NOT NULL,
  `o_status` varchar(10) NOT NULL,
  `o_ampickloc` varchar(100) NOT NULL,
  `o_ampicktime` time NOT NULL,
  `o_amdroploc` varchar(100) NOT NULL,
  `o_amdroptime` time NOT NULL,
  `o_pmdroploc` varchar(100) NOT NULL,
  `o_pmpicktime` time NOT NULL,
  `o_days` varchar(50) NOT NULL,
  `o_fd` varchar(10) NOT NULL,
  `o_ra` varchar(10) NOT NULL,
  `o_wc` varchar(10) NOT NULL,
  `o_as` varchar(10) NOT NULL,
  `driver_id` int(10) NOT NULL,
  `o_icomment` varchar(100) NOT NULL,
  `o_dcomment` varchar(100) NOT NULL,
  `o_billable` float NOT NULL,
  `o_reqby` varchar(20) NOT NULL,
  `o_payable` float NOT NULL,
  `o_tip` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lpr_school`
--

DROP TABLE IF EXISTS `lpr_school`;
CREATE TABLE `lpr_school` (
  `school_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `school_name` varchar(100) NOT NULL,
  `school_abr` varchar(10) NOT NULL,
  `school_street` varchar(200) NOT NULL,
  `school_address` varchar(200) NOT NULL,
  `school_city` varchar(50) NOT NULL,
  `school_state` varchar(10) NOT NULL,
  `school_zip` int(20) NOT NULL,
  `school_country` varchar(50) NOT NULL,
  `school_contact_name` varchar(50) DEFAULT NULL,
  `school_contact_no` varchar(20) DEFAULT NULL,
  `school_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lpr_student`
--

DROP TABLE IF EXISTS `lpr_student`;
CREATE TABLE `lpr_student` (
  `s_id` int(11) NOT NULL,
  `o_id` int(11) NOT NULL,
  `s_fname` varchar(100) NOT NULL,
  `s_lname` varchar(100) NOT NULL,
  `s_grade` varchar(10) DEFAULT NULL,
  `s_gender` varchar(10) DEFAULT NULL,
  `s_pfname` varchar(50) NOT NULL,
  `s_plname` varchar(50) NOT NULL,
  `s_phone` varchar(20) NOT NULL,
  `s_altphone` varchar(20) DEFAULT NULL,
  `s_street` varchar(50) NOT NULL,
  `s_address` varchar(50) DEFAULT NULL,
  `s_city` varchar(50) NOT NULL,
  `s_state` varchar(20) NOT NULL,
  `s_zip` varchar(10) NOT NULL,
  `s_country` varchar(20) NOT NULL
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
-- Indexes for table `lpr_driver`
--
ALTER TABLE `lpr_driver`
  ADD PRIMARY KEY (`driver_id`);

--
-- Indexes for table `lpr_order`
--
ALTER TABLE `lpr_order`
  ADD PRIMARY KEY (`o_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `school_id` (`school_id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- Indexes for table `lpr_school`
--
ALTER TABLE `lpr_school`
  ADD PRIMARY KEY (`school_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `lpr_student`
--
ALTER TABLE `lpr_student`
  ADD PRIMARY KEY (`s_id`),
  ADD KEY `o_id` (`o_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lpr_client`
--
ALTER TABLE `lpr_client`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `lpr_driver`
--
ALTER TABLE `lpr_driver`
  MODIFY `driver_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lpr_order`
--
ALTER TABLE `lpr_order`
  MODIFY `o_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lpr_school`
--
ALTER TABLE `lpr_school`
  MODIFY `school_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lpr_student`
--
ALTER TABLE `lpr_student`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `lpr_order`
--
ALTER TABLE `lpr_order`
  ADD CONSTRAINT `lpr_order_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `lpr_client` (`client_id`),
  ADD CONSTRAINT `lpr_order_ibfk_2` FOREIGN KEY (`school_id`) REFERENCES `lpr_school` (`school_id`),
  ADD CONSTRAINT `lpr_order_ibfk_3` FOREIGN KEY (`driver_id`) REFERENCES `lpr_driver` (`driver_id`);

--
-- Constraints for table `lpr_school`
--
ALTER TABLE `lpr_school`
  ADD CONSTRAINT `lpr_school_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `lpr_client` (`client_id`);

--
-- Constraints for table `lpr_student`
--
ALTER TABLE `lpr_student`
  ADD CONSTRAINT `lpr_student_ibfk_1` FOREIGN KEY (`o_id`) REFERENCES `lpr_order` (`o_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
