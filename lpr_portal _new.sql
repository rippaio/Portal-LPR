-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 03, 2017 at 06:57 PM
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
-- Table structure for table `lpr_additnltrip`
--

CREATE TABLE `lpr_additnltrip` (
  `ad_tripid` int(11) NOT NULL,
  `ad_driverid` int(11) NOT NULL,
  `ad_payable` float NOT NULL,
  `ad_tip` float NOT NULL,
  `ad_tripdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lpr_additnltrip`
--

INSERT INTO `lpr_additnltrip` (`ad_tripid`, `ad_driverid`, `ad_payable`, `ad_tip`, `ad_tripdate`) VALUES
(3, 1, 8, 6, '2017-06-22'),
(4, 1, 11, 1, '2017-06-23'),
(5, 1, 11, 1, '2017-06-01'),
(6, 1, 1, 1, '2017-07-01'),
(7, 1, 6, 6, '2017-07-13'),
(8, 1, 4, 4, '2017-07-03'),
(9, 1, 1, 1234, '2017-07-01');

-- --------------------------------------------------------

--
-- Table structure for table `lpr_billing`
--

CREATE TABLE `lpr_billing` (
  `o_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `share` int(5) NOT NULL,
  `amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lpr_billing`
--

INSERT INTO `lpr_billing` (`o_id`, `client_id`, `share`, `amount`) VALUES
(9, 3, 0, 10),
(9, 4, 0, 20),
(11, 3, 0, 80),
(12, 6, 0, 49),
(13, 3, 0, 5),
(13, 6, 0, 0),
(17, 3, 0, 44),
(17, 6, 0, 5),
(18, 3, 0, 46),
(18, 6, 0, 5),
(19, 3, 0, 46),
(19, 6, 0, 5),
(20, 3, 0, 5),
(20, 8, 0, 46),
(21, 3, 0, 5),
(21, 8, 0, 46),
(22, 3, 0, 5),
(22, 8, 0, 46),
(23, 3, 0, 46),
(23, 6, 0, 5),
(27, 4, 0, 74);

-- --------------------------------------------------------

--
-- Table structure for table `lpr_cashadvance`
--

CREATE TABLE `lpr_cashadvance` (
  `c_advanceid` int(11) NOT NULL,
  `c_driverid` int(11) NOT NULL,
  `c_payable` float NOT NULL,
  `c_Date` date NOT NULL,
  `c_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lpr_cashadvance`
--

INSERT INTO `lpr_cashadvance` (`c_advanceid`, `c_driverid`, `c_payable`, `c_Date`, `c_type`) VALUES
(1, 1, 10, '2017-06-25', 'debit'),
(2, 1, 10, '2017-06-25', 'debit'),
(3, 1, 10, '2017-06-25', 'debit'),
(4, 1, 10, '2017-06-25', 'credit'),
(5, 1, 10, '2017-06-25', 'credit'),
(6, 1, 7, '2017-06-25', 'credit'),
(7, 4, 6, '2017-06-25', 'debit'),
(8, 4, 6, '2017-06-25', 'debit'),
(9, 3, 1, '2017-06-25', 'debit'),
(10, 3, 1, '2017-06-25', 'debit'),
(11, 3, 1, '2017-06-25', 'debit'),
(12, 7, 23, '2017-06-25', 'debit'),
(13, 7, 23, '2017-06-25', 'debit'),
(14, 7, 23, '2017-06-25', 'debit'),
(15, 5, 34, '2017-06-25', 'debit'),
(16, 10, 23, '2017-06-25', 'debit'),
(17, 33, 77, '2017-06-25', 'debit'),
(18, 33, 77, '2017-06-25', 'debit'),
(19, 9, 100, '2017-06-26', 'debit'),
(20, 9, 100, '2017-06-26', 'debit'),
(21, 32, 22, '2017-06-26', 'debit'),
(22, 1, 3, '2017-06-26', 'credit'),
(23, 3, 1, '2017-06-26', 'credit'),
(24, 3, 1, '2017-06-26', 'credit'),
(25, 3, 1, '2017-06-26', 'credit'),
(26, 1, 60, '2017-06-26', 'debit'),
(27, 1, 1, '2017-06-26', 'credit'),
(28, 1, 1, '2017-06-26', 'credit'),
(29, 1, 1, '2017-06-26', 'credit'),
(30, 1, 1, '2017-06-26', 'credit'),
(31, 1, 1, '2017-06-26', 'debit'),
(32, 1, 45, '2017-06-26', 'debit'),
(33, 1, 54, '2017-06-26', 'debit'),
(34, 1, 54, '2017-06-26', 'debit'),
(35, 1, 4, '2017-06-26', 'debit'),
(36, 1, 4, '2017-06-26', 'debit'),
(37, 1, 1, '2017-06-26', 'debit'),
(38, 1, 74, '2017-06-26', 'debit'),
(39, 1, 74, '2017-06-26', 'debit'),
(40, 1, 12, '2017-06-26', 'debit'),
(41, 1, 13, '2017-06-26', 'debit'),
(42, 1, 13, '2017-06-26', 'debit'),
(43, 1, 8, '2017-06-26', 'debit'),
(44, 1, 1, '2017-06-26', 'debit'),
(45, 1, 1, '2017-06-26', 'debit'),
(46, 1, 2, '2017-06-26', 'debit'),
(47, 1, 1, '2017-06-26', 'debit'),
(48, 1, 1, '2017-06-26', 'debit'),
(49, 1, 14, '2017-06-26', 'debit'),
(50, 1, 1, '2017-06-26', 'debit'),
(51, 1, 1, '2017-06-26', 'debit'),
(52, 1, 1, '2017-06-26', 'debit'),
(53, 1, 14, '2017-06-26', 'debit'),
(54, 4, 178, '2017-06-26', 'debit'),
(55, 1, 1, '2017-06-26', 'credit'),
(56, 1, 1, '2017-06-26', 'credit'),
(57, 1, 11, '2017-06-27', 'debit'),
(58, 1, 12, '2017-06-27', 'debit'),
(59, 1, 1, '2017-07-03', 'debit'),
(60, 1, 333, '2017-07-03', 'debit'),
(61, 1, 444, '2017-07-03', 'debit'),
(62, 1, 999, '2017-07-03', 'debit');

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
  `client_contact` varchar(20) NOT NULL,
  `zone_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lpr_client`
--

INSERT INTO `lpr_client` (`client_id`, `client_abr`, `client_name`, `client_street`, `client_address`, `client_city`, `client_state`, `client_zip`, `client_country`, `client_contact`, `zone_id`) VALUES
(1, 'NPS', 'Norfolk Public Schools', 'East City Hall Avenue', '800', 'Norfolk', 'VA', 23510, 'USA', '7571234567', 1),
(2, 'PPS', 'Portsmouth Public Schools', 'Crawford Street', '801', 'Portsmouth', 'VA', 23704, 'USA', '7573937588', 4),
(3, 'CPS', 'Chesapeake Public Schools', 'Cedar Road', '312', 'Chesapeake', 'VA', 23222, 'USA', '', 3),
(4, 'SPS', 'Suffolk City Public Schools', 'North Main Street', '100', 'Suffolk', 'VA', 23434, 'USA', '', 6),
(5, 'HPS', 'Hampton City Schools', 'Franklin Street', 'One', 'Hampton', 'VA', 23669, 'USA', '', 5),
(6, 'NNPS', 'Newport News Public Schools', 'Warwick Boulevard', '12465', 'Newport News', 'VA', 23606, 'USA', '', 1),
(7, 'VBPS', 'Virginia Beach City Public Schools', 'George Mason Drive', '2512', 'Virginia Beach', 'VA', 23456, 'USA', '', 2);

-- --------------------------------------------------------

--
-- Table structure for table `lpr_dates`
--

CREATE TABLE `lpr_dates` (
  `dates_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date DEFAULT NULL,
  `client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lpr_driver`
--

CREATE TABLE `lpr_driver` (
  `driver_id` int(11) NOT NULL,
  `driver_fname` varchar(20) NOT NULL,
  `driver_mname` varchar(20) DEFAULT NULL,
  `driver_lname` varchar(20) NOT NULL,
  `driver_street` varchar(200) DEFAULT NULL,
  `driver_address` varchar(200) DEFAULT NULL,
  `driver_city` varchar(50) DEFAULT NULL,
  `driver_zip` varchar(20) DEFAULT NULL,
  `driver_contact_no` varchar(20) DEFAULT NULL,
  `driver_ssn` varchar(20) DEFAULT NULL,
  `driver_dl_no` varchar(20) DEFAULT NULL,
  `driver_dl_state` varchar(20) DEFAULT NULL,
  `driver_emg_contact` varchar(20) DEFAULT NULL,
  `driver_commision` float DEFAULT NULL,
  `driver_dname` varchar(20) DEFAULT NULL,
  `driver_emg_cname` varchar(20) DEFAULT NULL,
  `driver_emgcontact_relationship` varchar(20) DEFAULT NULL,
  `driver_state` varchar(20) DEFAULT NULL,
  `driver_country` varchar(20) DEFAULT NULL,
  `driver_hiredate` varchar(20) DEFAULT NULL,
  `driver_termdate` varchar(20) DEFAULT NULL,
  `driver_carnumber` varchar(20) DEFAULT NULL,
  `comments` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lpr_driver`
--

INSERT INTO `lpr_driver` (`driver_id`, `driver_fname`, `driver_mname`, `driver_lname`, `driver_street`, `driver_address`, `driver_city`, `driver_zip`, `driver_contact_no`, `driver_ssn`, `driver_dl_no`, `driver_dl_state`, `driver_emg_contact`, `driver_commision`, `driver_dname`, `driver_emg_cname`, `driver_emgcontact_relationship`, `driver_state`, `driver_country`, `driver_hiredate`, `driver_termdate`, `driver_carnumber`, `comments`) VALUES
(1, 'Lyrissa', 'N', 'Anderson', '7758 Ogden Avenue', 'Apt H', 'Norfolk', '23505', '7578313016', '223617155', 'A60509063', 'VA', '', 0.25, '', '', '', 'VA', 'US', '', '', '', ''),
(2, 'Monica', 'A-N', 'Anderson', '952 Lake Village Drive', 'Apt F', 'Chesapeake', '23323', '7573227217', '145782747', 'T60590975', 'VA', '7573481663', 0.25, 'Monica', 'Azarai', 'Anderson', 'VA', 'US', '', '', '61', ''),
(3, 'Willette', 'A', 'Anderson', '8839 Mariners Cove', 'Apt C', 'Norfolk', '23503', '7573241001', '228479735', 'T60554163', 'VA', '', 0.25, 'Willitt', '', '', 'VA', 'US', '', '', '37', ''),
(4, 'Cornelius', '', 'Allen', '6406 Clare Road', '', 'Norfolk', '23513', '7577171228', '230175881', 'T60583125', 'VA', '7574040047', 0.25, 'Cornelius', 'Russell Allen', 'father', 'VA', 'US', '', '', '54', ''),
(5, 'Helen', '', 'Barriteau', '405 Dauphin Lane', '', 'Virginia Beach', '23451', '7573553377', '230786552', 'T24618296', 'VA', '7573217241', 0.25, 'Helen', 'Bessie Sweat', 'mother', 'VA', 'US', '', '', '20', ''),
(6, 'Yvette', 'D', 'Branch', '901 Roseclair Street', '', 'Norfolk', '23523', '7577795100', '23608337', 'T62603056', 'VA', '', 0.25, 'Yvette', '', '', 'VA', 'US', '', '', '43', ''),
(7, 'Kenneth', '', 'Bond', '2844 Middle Town Crescent', '', 'Norfolk', '23504', '7577376007', '', 'T60545530', 'VA', '', 0.25, 'Boyd', '', '', 'VA', 'US', '', '', '100', ''),
(8, 'Shamika', '', 'Benton', '621 Geneva Avenue', 'Apt B', 'Chesapeake', '23323', '7577696541', '228313444', 'T62644277', 'VA', '', 0.25, 'Shamika', '', '', 'VA', 'US', '', '', '73', ''),
(9, 'Avis', 'U', 'Boone-Paul', '516 Timothy Avenue', 'Apt A', 'Norfolk', '23505', '7579443791', '226490128', 'T61560052', 'VA', '', 0.25, '', '', '', 'VA', 'US', '', '', '', ''),
(10, 'Jay', 'L', 'Barnes', '910 Bainbridge Boulevard', '', 'Norfolk', '23523', '7577357371', '224069762', 'A23828116', 'VA', '', 0.25, 'Jay', '', '', 'VA', 'US', '', '', '30', ''),
(11, 'Antaysha', 'R', 'Barnes', '3901 Krick Street', '', 'Norfolk', '23513', '7577388232', '231791468', 'A60569852', 'VA', '', 0, '', '', '', 'VA', 'US', '', '', '', ''),
(12, 'LaJuana', 'N', 'Brown', '2669 Azalea Garden Road', '', 'Norfolk', '23513', '7573192044', '223251378', 'A60557593', 'VA', '', 0.25, 'Nicky', '', '', 'VA', 'US', '', '', '5', ''),
(13, 'Diane', 'G', 'Barnhill', '1817 Bracey Street', '', 'Norfolk', '23504', '7577768659', '192542770', 'T60554457', 'VA', '', 0.25, 'Diane', '', '', 'VA', 'US', '', '', '53', ''),
(14, 'Lenton', '', 'Barnhill', '1817 Bracey Street', '', 'Norfolk', '23504', '7575508073', '230668413', 'T60554457', 'VA', '', 0.25, '', '', '', 'VA', 'US', '', '', '', ''),
(15, 'Patrice', 'D', 'Bradley', '13 Grady Crescent', '', 'Chesapeake', '23324', '7576067574', '226175906', 'T62635943', 'VA', '', 0.25, 'Patrice', '', '', 'VA', 'US', '', '', 'N100', ''),
(16, 'Ronnette', 'S', 'Barnes', '952 Wolcott Avenue', '', 'Norfolk', '23513', '7573090602', '224194182', 'T60582347', 'VA', '', 0.25, 'Ronette', '', '', 'VA', 'US', '', '', '79', ''),
(17, 'Katrina', 'L', 'Brown', '1538 Norcova Avenue', '', 'Norfolk', '23502', '7577083903', '229047322', 'T60583388', 'VA', '', 0.25, '', '', '', 'VA', 'US', '', '', '', ''),
(18, 'Tamara', 'N', 'Bennett', '1023 E. Leicester Avenue', '', 'Norfolk', '23503', '7577386515', '225393684', 'T60361787', 'VA', '', 0.25, 'Tamera', '', '', 'VA', 'US', '', '', '11', ''),
(19, 'Cheryl', 'M', 'Boone', '733 Alder Circle', '', 'Virginia Beach', '23462', '7575810481', '226042912', 'T67250067', 'VA', '', 0.25, 'Cherly', '', '', 'VA', 'US', '', '', '62', ''),
(20, 'Tiana', 'K', 'Chapman', '1109 Hillside Avenue', 'Unit D', 'Norfolk', '23503', '7579983414', '229575714', 'A60506574', 'VA', '', 0.25, 'Tiana', '', '', 'VA', 'US', '', '', '18', ''),
(21, 'Barbara', 'A', 'Crandell', '3324 Kansas Avenue', 'Apt A', 'Norfolk', '23513', '7577293983', '225060206', 'E23854728', 'VA', '', 0.25, '', '', '', 'VA', 'US', '', '', '', ''),
(22, 'Janice', 'R', 'Cruz', '1809 Ramsey Road', '', 'Norfolk', '23503', '7572377353', '584668459', 'A60529301', 'VA', '', 0.25, 'Janice', '', '', 'VA', 'US', '', '', '56', ''),
(23, 'Tarnesha', 'M', 'Carlisle', '512 Grantham Road', 'Apt C', 'Norfolk', '23505', '7579980801', '223219420', 'T60569630', 'VA', '', 0.25, '', '', '', 'VA', 'US', '', '', '', ''),
(24, 'Dollie', 'A', 'Cherry', '611 Goff Street', '', 'Norfolk', '23510', '7574072483', '224942499', 'T62698809', 'VA', '', 0.25, 'Dollie', '', '', 'VA', 'US', '', '', '95', ''),
(25, 'Sue', 'E', 'Coward', '1154 Virginia Beach Blvd.', '# 42', 'Virginia Beach', '23451', '7573587041', '167547186', 'A61607915', 'VA', '', 0.25, 'Sue', '', '', 'VA', 'US', '', '', '63', ''),
(26, 'DeSheena', 'M', 'Cobb', '633 Mariners Way', '# F', 'Norfolk', '23503', '7578422038', '217040114', 'T60537955', 'VA', '', 0.25, 'Sheena', '', '', 'VA', 'US', '', '', '45', ''),
(27, 'Ebony', 'K', 'Cornick', '2909 Llewellyn Avenue', '# 2', 'Norfolk', '23504', '7572744258', '226470370', 'A60511709', 'VA', '', 0.25, 'Ebony', '', '', 'VA', 'US', '', '', '10', ''),
(28, 'Monecia', 'L', 'Dennis', '3048 Parkside Drive', '', 'Chesapeake', '23324', '7575811537', '223612498', 'A60535338', 'VA', '', 0.25, 'Monicia', '', '', 'VA', 'US', '', '', '38', ''),
(29, 'Marcia', 'D', 'Douglas', '3413 Stancil Street', '', 'Virginia Beach', '23452', '7579759461', '165648342', 'T67238830', 'VA', '7576960451', 0.25, 'Marcia', 'David Douglas', 'father', 'VA', 'US', '', '', '77', ''),
(30, 'Courtney', 'B', 'Darden', '51 Ridge Wood Drive', '', 'Hampton', '23666', '7578690732', '223194653', 'A60317229', 'VA', '', 0.25, 'Courtney', '', '', 'VA', 'US', '', '', '93', ''),
(31, 'Janika', 'R', 'Dreweey', '4277 Taylor Road', 'Apt J1', 'Chesapeake', '23321', '7572860829', '225576744', 'T60666711', 'VA', '7573583796', 0.25, 'Janika', 'Sharon Drewery', 'mother', 'VA', 'US', '', '', 'P01', ''),
(32, 'Lashona', 'D', 'Daughtry', '500 Edwards Street', 'Apt N', 'Portsmouth', '23704', '7576091013', '223115075', 'T60657340', 'VA', '', 0.25, '', '', '', 'VA', 'US', '', '', '', ''),
(33, 'Latoya', 'N', 'Deal', '1536 Nevada Avenue', 'Apt A', 'Norfolk', '23502', '7573535899', '229411855', 'T60587128', 'VA', '', 0.25, 'Deal', '', '', 'VA', 'US', '', '', '36', ''),
(34, 'Kimberly', 'D', 'Daniels', '2917 Fireside Road', '# 4', 'Chesapeake', '23324', '7575895089', '226279760', 'A62120845', 'VA', '', 0.25, 'Kim', '', '', 'VA', 'US', '', '', '75', ''),
(35, 'Iesha', '', 'Davis', '', '', '', '', '', '', '', '', '', 0.25, 'Iesha', '', '', '', 'US', '', '', '68', ''),
(36, 'Brittany', 'C', 'Driver', '', '', '', '', '7579180799', '229613596', 'A62614113', 'VA', '', 0.25, '', '', '', '', 'US', '', '', '', ''),
(37, 'Aqueela', '', 'Epps', '', '', '', '', '', '', '', '', '', 0.25, 'Epps', '', '', '', 'US', '', '', '39', ''),
(38, 'Alice', 'A', 'Evans', '374 Fort Worth Avenue', '# 2', 'Norfolk', '23505', '7577378884', '224985702', 'T60546553', 'VA', '', 0.25, 'Alice', '', '', 'VA', 'US', '', '', '7', ''),
(39, 'Cheryl', 'T', 'Freeman', '3907 Pughsville Road', '', 'Suffolk', '23704', '7573723383', '227880594', 'T60616576', 'VA', '7573050712', 0.25, 'Freeman', 'Lindsey Freeman', 'husband', 'VA', 'US', '', '', '28', ''),
(40, 'Gina', '', 'Forehand', '', '', '', '', '', '', '', '', '', 0.25, 'Gina', '', '', '', 'US', '', '', '88', ''),
(41, 'Harry', '', 'Forehand', '', '', '', '', '7572846960', '', '', '', '', 0.25, 'Harry F.', '', '', '', 'US', '', '', '49', ''),
(42, 'Griselda', 'P', 'Crespo-Ferdinand', '1264 Clydesdale Lane', '', 'Virginia Beach', '23464', '7573734128', '225676861', 'A67212404', 'VA', '', 0.25, 'Grace', '', '', 'VA', 'US', '', '', '46', ''),
(43, 'Kiyana', 'N', 'Felton', '415 Chapel Street', '', 'Norfolk', '23504', '7579773840', '181589005', 'A60510476', 'VA', '', 0.25, 'Kiki', '', '', 'VA', 'US', '', '', '91', ''),
(44, 'Judy', 'A', 'Frank', '5384 Roslyn Drive', '', 'Norfolk', '23502', '7578288071', '225848052', 'T62651940', 'VA', '', 0.25, 'Judy', '', '', 'VA', 'US', '', '', '85', ''),
(45, 'Delphine', 'E', 'Farrow', '2726 Westminster Avenue', '', 'Norfolk', '23504', '7576201301', '224986351', '', 'VA', '', 0.25, '', '', '', 'VA', 'US', '', '', '', ''),
(46, 'Cynthia', '', 'Griffin', '103 Ruger Court', '', 'Suffolk', '23434', '7572372289', '216625660', 'T61540431', 'VA', '', 0.25, 'Cynthia', '', '', 'VA', 'US', '', '', 'P03', ''),
(47, 'Jackee', 'C', 'Garland', '5733 Weblin Drive', '', 'Virginia Beach', '23462', '7573008468', '225631231', 'A67249654', 'VA', '', 0.25, 'Jackee', '', '', 'VA', 'US', '', '', '70', ''),
(48, 'Charnay', 'A', 'Gooden', '1050 Bay Street', '', 'Portsmouth', '23704', '', '96806876', 'A60647267', 'VA', '', 0.25, '', '', '', 'VA', 'US', '', '', '', ''),
(49, 'Coston', '', 'Griffin', '234 Burnetts Way', '', 'Suffolk', '23434', '7576301789', '230742540', 'T62652521', 'VA', '', 0.25, 'Pete', '', '', 'VA', 'US', '', '', '3033', ''),
(50, 'Lella', 'S', 'Golden', '5631 Tidewater Drive', 'Apt 7R', 'Norfolk', '23509', '7579070301', '230666582', 'T62651580', 'VA', '', 0.25, 'Lella', '', '', 'VA', 'US', '', '', '96', ''),
(51, 'Taquiesha', 'G', 'Gray', '1743 Acorn Street', '', 'Chesapeake', '23324', '7572778239', '224317483', 'T62659561', 'VA', '', 0.25, 'Taquisha', '', '', 'VA', 'US', '', '', '57', ''),
(52, 'Tatanisha', 'M', 'Gilliam', '1878 Greenleaf Drive', '', 'Norfolk', '23523', '7579751859', '226270612', 'T60532054', 'VA', '', 0.25, 'Tata', '', '', 'VA', 'US', '', '', '59', ''),
(53, 'Viola', '', 'Harrell', '7424 Fenner Street', 'Apt 12', 'Norfolk', '23505', '7579989368', '577961817', 'A62147199', 'VA', '', 0.25, 'Viola', '', '', 'VA', 'US', '', '', '87', ''),
(54, 'Adeela', '', 'Hopkins', '1241 W. Ocean View Ave.', '# 1', 'Norfolk', '23503', '7573485196', '224573196', 'A60503386', 'VA', '', 0.25, 'Adeela', '', '', 'VA', 'US', '', '', '15', ''),
(55, 'Marketta', '', 'Holloway', '7035 Sewells Point Road', 'Unit G', 'Norfolk', '23513', '7572700018', '223352996', 'T60551830', 'VA', '', 0.25, '', '', '', 'VA', 'US', '', '', '', ''),
(56, 'Ciara', 'C', 'Hamilton', '455 Nicholson Street', '', 'Norfolk', '23510', '7579774761', '223359665', 'T62659822', 'VA', '', 0.25, 'Ciara', '', '', 'VA', 'US', '', '', 'E04', ''),
(57, 'Malinda', 'D', 'Haley', '3011 Mayon Drive', '', 'Chesapeake', '23325', '7577529156', '223275710', 'B23801596', 'VA', '', 0.25, 'Malinda', '', '', 'VA', 'US', '', '', '58', ''),
(58, 'Carolyn', 'Y', 'Hall', '261 Nicholson Street', '', 'Norfolk', '23510', '7576328629', '231232764', 'T62679548', 'VA', '', 0.25, 'Carolyn', '', '', 'VA', 'US', '', '', '90', ''),
(59, 'Malkia', 'S', 'Johnson', '2706 Broad Street', '', 'Chesapeake', '23324', '7573784666', '78621987', 'T62151240', 'VA', '', 0.25, '', '', '', 'VA', 'US', '', '', '', ''),
(60, 'Melissa', 'L', 'Wilkerson-Jones', '4600 Lind Street', '', 'Norfolk', '23513', '8046688472', '225430316', 'T60514922', 'VA', '', 0.25, 'Melissa', '', '', 'VA', 'US', '', '', 'N200', ''),
(61, 'Tim', 'E', 'Jernigan', '4181 Spruse Knob Road', '', 'Virginia Beach', '23456', '', '224558455', 'T60595044', 'VA', '', 0.25, '', '', '', 'VA', 'US', '', '', '', ''),
(62, 'Keosha', 'S', 'Johnson', '7923 Moose Avenue', '', 'Norfolk', '23518', '7577766941', '226356134', 'T62637048', 'VA', '', 0.25, '', '', '', 'VA', 'US', '', '', '', ''),
(63, 'Bianca', 'C', 'Jackson', '600 Charles Court', '', 'Virginia Beach', '23462', '7577521042', '226115061', 'E23856777', 'VA', '', 0.25, 'Bianca', '', '', 'VA', 'US', '', '', '29', ''),
(64, 'Pamela', 'N', 'Keene', '705 West 36th Street', '', 'Norfolk', '23508', '7573819520', '226293540', 'T60530223', 'VA', '', 0.25, 'Pam', '', '', 'VA', 'US', '', '', '40', ''),
(65, 'Sharon', 'D', 'Knight', '1152 Virginia Beach Blvd', '# 42', 'Virginia Beach', '23451', '', '412157053', 'A61657756', 'VA', '', 0.25, '', '', '', 'VA', 'US', '', '', '', ''),
(66, 'Lasonia', 'K', 'Knight', '6624 Stoney Point Road', '', 'Norfolk', '23502', '7573749356', '223538962', 'T62691256', 'VA', '', 0.25, 'Sonia', '', '', 'VA', 'US', '', '', '65', ''),
(67, 'Tyshawn', '', 'Lawton', '3861 Liberty Ridge Road', '', 'Virginia Beach', '23452', '4058358099', '224675828', 'W083879565', 'OK', '', 0.25, 'Tyshawn', '', '', 'VA', 'US', '', '', '89', ''),
(68, 'Akira', 'S', 'Leonard', '744 A Avenue', 'Apt 2', 'Norfolk', '23504', '7063514282', '223619487', 'A6050633', 'VA', '', 0.25, 'Akira', '', '', 'VA', 'US', '', '', '52', ''),
(69, 'Christian', '', 'Lichliter', '', '', '', '', '', '', '', '', '', 0.25, 'Shane', '', '', '', 'US', '', '', '01', ''),
(70, 'Vonetta', 'M', 'Manyweather', '3860 Nansemond Circle', 'Apt 1', 'Norfolk', '23513', '7572892490', '223150710', 'T60591927', 'VA', '', 0.25, 'Vonetta', '', '', 'VA', 'US', '', '', '201', ''),
(71, 'Lavinia', 'D', 'Mackey', '1001 7th Street', 'Apt D', 'Portsmouth', '23704', '7572303265', '223114573', 'T60614955', 'VA', '', 0.25, 'Lavinia', '', '', 'VA', 'US', '', '', '60', ''),
(72, 'Rita', 'D', 'Moore', '1921 Robert Hall Blvd', '# 3309', 'Chesapeake', '23324', '7577754140', '230080067', 'T62634576', 'VA', '7575137031', 0.25, 'Rita', 'Monae Cuffee', 'daughter', 'VA', 'US', '', '', '55', ''),
(73, 'Tenesha', 'F', 'Land-Mitchell', '9639 11th View Street', '# 7', 'Norfolk', '23503', '7575155369', '223275397', 'T60512220', 'VA', '7572305869', 0.25, 'Tinisha', 'Carolyn Leland', 'mother', 'VA', 'US', '', '', '41', ''),
(74, 'Cynthia', 'M', 'Moyler', '1112 Sword Drive', '', 'Chesapeake', '23323', '', '225747474', 'T62118989', 'VA', '', 0.25, '', '', '', 'VA', 'US', '', '', '', ''),
(75, 'Marquita', 'C', 'Mason', '1330 MacDonald Road', 'Apt E', 'Chesapeake', '23325', '', '227658832', 'A62642756', 'VA', '', 0.25, '', '', '', 'VA', 'US', '', '', '', ''),
(76, 'Mary', 'W', 'Medley', '6508 Harvey Court', '', 'Norfolk', '23513', '7572306655', '230685065', 'T60515035', 'VA', '', 0.25, 'Mary', '', '', 'VA', 'US', '', '', '6', ''),
(77, 'Diane', 'P', 'Outland', '1406 Newby Road', '', 'Portsmouth', '23701', '7577547347', '231984176', 'T60610332', 'VA', '', 0.25, 'Outland', '', '', 'VA', 'US', '', '', '44', ''),
(78, 'Russell', 'W', 'Owens', '834 Bancker Road', '', 'Norfolk', '23518', '7578376416', '105765578', '989295794', 'NY', '7577386515', 0.25, 'Russell', 'Tamara Bennett', 'daughter', 'VA', 'US', '', '', '21', ''),
(79, 'Neshaminy', 'T', 'Perry', '849 Rugby Street', '', 'Norfolk', '23504', '7573431389', '147688916', 'A60551729', 'VA', '', 0.25, 'Nicole', '', '', 'VA', 'US', '', '', '94', ''),
(80, 'LeDiea', 'L', 'Payton', '418 Park Avenue', 'Apt B', 'Norfolk', '23504', '7579985263', '228436398', 'T60506863', 'VA', '', 0.25, '', '', '', 'VA', 'US', '', '', '', ''),
(81, 'Brian', 'D', 'Russell', '2371 N. Windsong Court', '# 101', 'Virginia Beach', '23455', '8609491593', '560351711', 'B67221684', 'VA', '', 0.25, 'Brian', '', '', 'VA', 'US', '', '', '24', ''),
(82, 'Janee', 'T', 'Reed', '1118 Virginia Avenue', 'Apt D', 'Portsmouth', '23707', '7573596850', '224177311', 'T60669188', 'VA', '', 0.25, 'Janee', '', '', 'VA', 'US', '', '', '4', ''),
(83, 'Lee', '', 'Rempas', '', '', '', '', '', '', '', '', '', 0.25, 'Lee', '', '', '', 'US', '', '', '20', ''),
(84, 'Harry', 'A', 'Robertson', '5168 Stratford Chase Drive', '', 'Virginia Beach', '23464', '7576960016', '229132886', 'T62607487', 'VA', '', 0.25, 'Harry R', '', '', 'VA', 'US', '', '', '33', ''),
(85, 'Shawnta', 'M', 'Ross', '601 Seventh Street', 'Apt F', 'Portsmouth', '23704', '7577768679', '223377627', 'T62627778', 'VA', '', 0.25, '', '', '', 'VA', 'US', '', '', '', ''),
(86, 'Patrice', 'A', 'Reed', '1945 E. Ocean View Avenue', '# 2', 'Norfolk', '23503', '7579985622', '17506627', 'A24634742', 'VA', '', 0.25, 'Reed', '', '', 'VA', 'US', '', '', '48', ''),
(87, 'Cynthia', 'I', 'Ruffin', '4604 Brantingham Drive', '', 'Virginia Beach', '23464', '5614202586', '767071703', 'A60583075', 'VA', '', 0.25, 'Ruffin', '', '', 'VA', 'US', '', '', '47', ''),
(88, 'Meisha', 'D', 'Roberts', '3738 Deep Creek Blvd', '', 'Portsmouth', '23702', '7576106373', '226191883', 'T60642532', 'VA', '', 0.25, 'Miesha', '', '', 'VA', 'US', '', '', '74', ''),
(89, 'Lloyd', '', 'Sanderson', '', '', '', '', '', '', '', '', '', 0.25, 'Juni', '', '', '', 'US', '', '', '398', ''),
(90, 'Patrice', 'D', 'Stewart', '1344 Picadilly Street', 'Apt B', 'Norfolk', '23513', '7577380728', '227089013', 'T62687260', 'VA', '', 0.25, '', '', '', 'VA', 'US', '', '', '', ''),
(91, 'Christine', 'D', 'Snipes', '709 River Creek Road', '', 'Chesapeake', '23320', '7575601052', '231199303', 'T62137850', 'VA', '', 0.25, 'Christine', '', '', 'VA', 'US', '', '', '16', ''),
(92, 'Lamesha', 'L', 'Selby', '1816 Greenleaf Drive', '', 'Norfolk', '23523', '7573246157', '228235968', 'T60515292', 'VA', '', 0.25, 'Lamisha', '', '', 'VA', 'US', '', '', '50', ''),
(93, 'Jeanette', 'R', 'Spencer', '5512 Bayberry Drive', '', 'Norfolk', '23502', '7574502056', '228803696', 'T62615489', 'VA', '', 0.25, '', '', '', 'VA', 'US', '', '', '', ''),
(94, 'Shakina', 'S', 'Saunders', '920 Tifton Street', '', 'Norfolk', '23513', '7573091535', '224315200', 'T60536220', 'VA', '', 0.25, 'Shakina', '', '', 'VA', 'US', '', '', '72', ''),
(95, 'Arnold', '', 'Smith', '', '', '', '', '', '', '', '', '', 0.25, 'Arnold', '', '', '', 'US', '', '', '051', ''),
(96, 'Kim', 'M', 'Smith', '7424 Fenner Street', 'Apt 20', 'Norfolk', '23505', '7575817164', '228293656', 'T60544384', 'VA', '', 0.25, 'Smith', '', '', 'VA', 'US', '', '', '71', ''),
(97, 'Darrin', 'L', 'Thomas', '3214 Lens Avenue', '', 'Norfolk', '23509', '7574056289', '227171032', 'T60644119', 'VA', '', 0.25, 'Darren', '', '', 'VA', 'US', '', '', '32', ''),
(98, 'Aimee', 'R', 'Taylor', '1424 McNeal Avenue', '', 'Norfolk', '23502', '7577905584', '002847001', 'T67288271', 'VA', '', 0.25, 'Aimee', '', '', 'VA', 'US', '', '', '26', ''),
(99, 'Monique', '', 'Taylor', '', '', '', '', '', '', '', '', '', 0.25, 'Momo', '', '', '', 'US', '', '', '19', ''),
(100, 'Jack', 'V', 'Tambreza', '1280 Pall Mall Avenue', '', 'Norfolk', '23513', '7575672961', '', '', 'VA', '', 0.25, 'Jack', '', '', 'VA', 'US', '', '', '23', ''),
(101, 'Tonia', 'T', 'Thompson', '1513 Halter Drive', 'Unit A', 'Virginia Beach', '23464', '8563921357', '150626952', 'B67234218', 'VA', '', 0.25, '', '', '', 'VA', 'US', '', '', '', ''),
(102, 'Roderick', '', 'Wallace', '', '', '', '', '', '', '', '', '', 0.25, 'Rodrick', '', '', '', 'US', '', '', '64', ''),
(103, 'Gail', 'D', 'Williams', '1050 Bay Street', '', 'Portsmouth', '23704', '8568349935', '099521152', 'A60647268', 'VA', '', 0.25, 'Gail', '', '', 'VA', 'US', '', '', '03', ''),
(104, 'Sherry', 'A', 'Wilson', '3033 Fireside Road', '', 'Chesapeake', '23324', '7573392882', '230040375', 'A62103700', 'VA', '7576638427', 0.25, 'Sherry', 'Mary Wilson', '', 'VA', 'US', '', '', 'E02', ''),
(105, 'Bianca', 'D', 'Wiggins', '3224 Kimball Terrace', '', 'Norfolk', '23504', '7577389386', '230574687', 'T61541876', 'VA', '7572850417', 0.25, 'Wiggins', 'Catina Poole', 'mother', 'VA', 'US', '', '', '25', ''),
(106, 'Crystal', 'D', 'White', '212 W. 24th Street', 'Apt 102', 'Norfolk', '23508', '7579775877', '249793865', 'A60515896', 'VA', '', 0.25, 'Crystal', '', '', 'VA', 'US', '', '', '67', ''),
(107, 'Hermione', 'C', 'Wilson', '33 Holly Hill Lane', '', 'Portsmouth', '23702', '7573547752', '223765151', 'T62165559', 'VA', '', 0.25, 'Hermi', '', '', 'VA', 'US', '', '', '76', ''),
(108, 'Shanice', 'N', 'Ward', '519 Tidewater Drive', '', 'Norfolk', '23504', '7573862137', '043825318', 'T60552998', 'VA', '', 0.25, 'Shanice', '', '', 'VA', 'US', '', '', '42', ''),
(109, 'Sandra', 'L', 'Woodard', '500 Bunche Blvd', '', 'Portsmouth', '23701', '7573394843', '239726013', 'A23894398', 'VA', '', 0.25, 'Sandra', '', '', 'VA', 'US', '', '', '82', ''),
(110, 'Barry', 'A', 'Woodard', '500 Bunche Blvd', '', 'Portsmouth', '23701', '7573394843', '231823445', 'T60644958', 'VA', '', 0.25, 'Barry', '', '', 'VA', 'US', '', '', '82', ''),
(111, 'Tylesha', 'G', 'Wright', '7031 Sewells Point Road', 'Apt F', 'Norfolk', '23513', '7579201167', '227510455', 'A60544000', 'VA', '', 0.25, 'Tylisha', '', '', 'VA', 'US', '', '', '81', ''),
(112, 'Alice', 'M', 'Wiggins', '986 Widgeon Road', '', 'Norfolk', '23513', '7577359594', '226135546', 'T60580536', 'VA', '', 0.25, 'Mae', '', '', 'VA', 'US', '', '', '86', ''),
(113, 'Lisa', 'D', 'Wright', '300 Cobb Island Court', '', 'Chesapeake', '23322', '7573711055', '223945021', 'T60544987', 'VA', '', 0.25, 'Denise', '', '', 'VA', 'US', '', '', '22', '');

-- --------------------------------------------------------

--
-- Table structure for table `lpr_order`
--

CREATE TABLE `lpr_order` (
  `o_id` int(11) NOT NULL,
  `client_id` int(10) NOT NULL,
  `school_id` int(10) NOT NULL,
  `o_startdate` date NOT NULL,
  `o_enddate` date NOT NULL,
  `o_status` varchar(10) NOT NULL,
  `o_ampickloc` varchar(100) DEFAULT NULL,
  `o_ampicktime` time DEFAULT NULL,
  `o_amdroploc` varchar(100) DEFAULT NULL,
  `o_amdroptime` time DEFAULT NULL,
  `o_pmpickloc` varchar(100) DEFAULT NULL,
  `o_pmdroploc` varchar(100) DEFAULT NULL,
  `o_pmpicktime` time DEFAULT NULL,
  `o_days` varchar(50) NOT NULL,
  `o_fd` varchar(10) NOT NULL,
  `o_ra` varchar(10) NOT NULL,
  `o_wc` varchar(10) NOT NULL,
  `o_as` varchar(10) NOT NULL,
  `driver_id` int(10) DEFAULT NULL,
  `o_icomment` varchar(100) NOT NULL,
  `o_dcomment` varchar(100) NOT NULL,
  `o_billable` float NOT NULL,
  `o_reqby` int(11) NOT NULL,
  `o_payable` float NOT NULL,
  `o_tip` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lpr_order`
--

INSERT INTO `lpr_order` (`o_id`, `client_id`, `school_id`, `o_startdate`, `o_enddate`, `o_status`, `o_ampickloc`, `o_ampicktime`, `o_amdroploc`, `o_amdroptime`, `o_pmpickloc`, `o_pmdroploc`, `o_pmpicktime`, `o_days`, `o_fd`, `o_ra`, `o_wc`, `o_as`, `driver_id`, `o_icomment`, `o_dcomment`, `o_billable`, `o_reqby`, `o_payable`, `o_tip`) VALUES
(13, 3, 3, '2017-06-01', '2017-06-28', 'active', 'NEW', '17:00:00', 'NEW', '18:00:00', 'OLD', '4444', NULL, 'Monday,Tuesday,Wednesday,Thursday,Friday', 'TRUE', 'TRUE', 'FALSE', 'FALSE', 1, '', '', 51, 6, 3, 3),
(17, 3, 3, '2017-06-01', '2017-06-02', 'inactive', '', '18:00:00', 'adfdf,adsfdsfdsf,fdsfsfsdf', '18:00:00', '', '', '18:00:00', 'Monday,Tuesday,Wednesday', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 1, '', '', 49, 6, 0, 0),
(18, 3, 3, '2017-06-02', '2017-06-03', 'active', 'adfdf,adsfdsfdsf,fdsfsfsdf', '18:00:00', 'adfdf,adsfdsfdsf,fdsfsfsdf', '18:00:00', '', '4444', '18:00:00', 'Monday,Tuesday,Thursday,Friday', 'TRUE', 'TRUE', 'FALSE', 'FALSE', 1, '', '', 51, 6, 40, 4),
(19, 3, 3, '2017-06-02', '2017-06-03', 'active', 'adfdf,adsfdsfdsf,fdsfsfsdf', '18:00:00', 'adfdf,adsfdsfdsf,fdsfsfsdf', '18:00:00', '', '4444', '18:00:00', 'Monday,Tuesday,Thursday,Friday', 'TRUE', 'TRUE', 'FALSE', 'FALSE', 1, '', '', 51, 6, 40, 4),
(20, 3, 3, '2017-06-02', '2017-06-03', 'active', '48th street, 1055w,Apt 13,Norfolk,23508', '18:00:00', 'adfdf,adsfdsfdsf,fdsfsfsdf', '18:00:00', '', '4444', '18:00:00', 'Monday,Tuesday,Wednesday', 'TRUE', 'TRUE', 'FALSE', 'FALSE', 2, '', '', 51, 8, 8, 0),
(21, 3, 3, '2017-06-02', '2017-06-03', 'active', '48th street, 1055w,Apt 13,Norfolk,23508', '18:00:00', 'adfdf,adsfdsfdsf,fdsfsfsdf', '18:00:00', '', '4444', '18:00:00', 'Monday,Tuesday,Wednesday', 'TRUE', 'TRUE', 'FALSE', 'FALSE', 2, '', '', 51, 8, 50, 0),
(22, 3, 3, '2017-06-02', '2017-06-03', 'active', '48th street, 1055w,Apt 13,Norfolk,23508', '18:00:00', 'adfdf,adsfdsfdsf,fdsfsfsdf', '18:00:00', '', '4444', '18:00:00', 'Monday,Tuesday,Wednesday', 'TRUE', 'TRUE', 'FALSE', 'FALSE', 2, '', '', 51, 8, 50, 0),
(23, 3, 3, '2017-06-03', '2017-06-06', 'active', '48th street, 1055w,Apt 13,Norfolk,23508', '12:00:00', 'adfdf,adsfdsfdsf,fdsfsfsdf', '18:00:00', '', '48th street, 1055w,Apt 13,Norfolk,23508', '18:00:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'TRUE', 'TRUE', 'FALSE', 'FALSE', 2, '', '', 51, 6, 50, 4),
(27, 4, 131, '2017-06-07', '2017-06-30', 'active', 'ITPL,BANGALORE,BANGALORE,560066', '08:00:00', 'Driver Lane,4270,Suffolk', '16:00:00', 'puck', 'ITPL,BANGALORE,BANGALORE,560066', '18:00:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 32, '', '', 74, 4, 40, 5);

-- --------------------------------------------------------

--
-- Table structure for table `lpr_rates`
--

CREATE TABLE `lpr_rates` (
  `rate_id` int(11) NOT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `item` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lpr_rates`
--

INSERT INTO `lpr_rates` (`rate_id`, `zone_id`, `amount`, `item`) VALUES
(8, 1, '17.50', 'outzone'),
(9, 2, '20.50', 'outzone'),
(10, 3, '24.50', 'outzone'),
(11, 4, '24.50', 'outzone'),
(12, 5, '56.50', 'outzone'),
(13, 6, '56.50', 'outzone'),
(14, 1, '15.00', 'wheelchair-out'),
(15, 2, '20.00', 'wheelchair-out'),
(16, 3, '25.00', 'wheelchair-out'),
(17, 4, '30.00', 'wheelchair-out'),
(18, 5, '35.00', 'wheelchair-out'),
(19, 6, '40.00', 'wheelchair-out'),
(20, 1, '28.42', 'inzone'),
(21, 2, '38.00', 'inzone'),
(22, 3, '42.00', 'inzone'),
(23, 4, '42.00', 'inzone'),
(24, 5, '74.00', 'inzone'),
(25, 6, '74.00', 'inzone'),
(26, 1, '15.00', 'wheelchair-in'),
(27, 2, '20.00', 'wheelchair-in'),
(28, 3, '25.00', 'wheelchair-in'),
(29, 4, '30.00', 'wheelchair-in'),
(30, 5, '35.00', 'wheelchair-in'),
(31, 6, '40.00', 'wheelchair-in'),
(37, NULL, '20.00', 'ridealong');

-- --------------------------------------------------------

--
-- Table structure for table `lpr_school`
--

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

--
-- Dumping data for table `lpr_school`
--

INSERT INTO `lpr_school` (`school_id`, `client_id`, `school_name`, `school_abr`, `school_street`, `school_address`, `school_city`, `school_state`, `school_zip`, `school_country`, `school_contact_name`, `school_contact_no`, `school_type`) VALUES
(1, 1, 'Academy for Discovery at Lakewood', 'ADL', 'Alsace Avenue', '1701', 'Norfolk', 'VA', 23509, 'US', 'Mr. Thomas R. Smigiel', '7576282477', 'alternative'),
(2, 1, 'Academy of International Studies at Rosemont', 'AIS', 'Branch Road', '1330', 'Norfolk', 'VA', 23513, 'US', 'Dr.?Jannette E. Martin', '7578524610', 'alternative'),
(3, 1, 'Azalea Gardens Middle School', 'AZG', 'Azalea Garden Road', '7721', 'Norfolk', 'VA', 23518, 'US', 'Dr. Reuthenia C. Clark', '7575313000', 'middle'),
(4, 1, 'Bay View Elementary School', 'BAV', 'Bay View Blvd', '1434', 'Norfolk', 'VA', 23503, 'US', 'Dr. Valerie A. Walton', '7575313030', 'elementary'),
(5, 1, 'Berkley/Campostella Early Childhood Education Center', 'BCE', 'Cypress Street', '1530', 'Norfolk', 'VA', 23523, 'US', 'Dr. Doreatha White', '7574943870', 'elementary'),
(6, 1, 'Blair Middle School', 'BMS', 'Spotswood Avenue', '730', 'Norfolk', 'VA', 23517, 'US', 'Dr. Mark Makovec', '7576282400', 'middle'),
(7, 1, 'Booker T. Washington High School', 'BTW', 'Park Avenue', '1111', 'Norfolk', 'VA', 23504, 'US', 'Dr. Margie G. Stallings', '7576283575', 'high'),
(8, 1, 'Camp Allen Elementary School', 'CAE', 'C Street', '501', 'Norfolk', 'VA', 23505, 'US', 'Ms. Deena Johnson Copeland', '7574514170', 'elementary'),
(9, 1, 'Camp Young', 'YNG', 'Deepwater Drive', '145', 'Chesapeake', 'VA', 23322, 'US', 'Dr. Veronica E. Haynes', '7575474245', 'alternative'),
(10, 1, 'Chesterfield Academy', 'CHS', 'Westminster Avenue', '2915', 'Norfolk', 'VA', 23504, 'US', 'Dr. Lawrence C. Taylor', '7576282544', 'alternative'),
(11, 1, 'Coleman Place Elementary School', 'COL', 'Palmyra Street', '2445', 'Norfolk', 'VA', 23513, 'US', 'Dr. Pamela M. Tatem', '7578524641', 'elementary'),
(12, 1, 'Crossroads School', 'CRS', 'Old Ocean View Road', '8021', 'Norfolk', 'VA', 23518, 'US', 'Dr. Kristen Nichols', '7575313050', 'alternative'),
(13, 1, 'Easton Preschool', 'EPS', 'Curlew Drive', '6045', 'Norfolk', 'VA', 23502, 'US', 'Dr. Tami M. White', '7578923290', 'preschool'),
(14, 1, 'Fairlawn Elementary School', 'FRL', 'Wade Street', '1132', 'Norfolk', 'VA', 23502, 'US', 'Mrs. T. Michele Logan', '7578923260', 'elementary'),
(15, 1, 'Ghent Elementary School', 'GHE', 'Shirley Avenue', '200', 'Norfolk', 'VA', 23517, 'US', 'Dr. Thomas McAnulty', '7576282565', 'elementary'),
(16, 1, 'Granby Elementary School', 'GRE', 'Newport Avenue', '7101', 'Norfolk', 'VA', 23505, 'US', 'Mrs. Kathy Verhappen', '7574514150', 'elementary'),
(17, 1, 'Granby High School', 'GRH', 'Granby Street', '7101', 'Norfolk', 'VA', 23505, 'US', 'Dr. Lynnell Gibson', '7574514110', 'high'),
(18, 1, 'Hospital School Program at CHKD', 'HSP', 'Gresham Drive', '400/5th floor', 'Norfolk', 'VA', 23507, 'US', 'Ms. Janice Teagle', '7576687061', 'alternative'),
(19, 1, 'Ingleside Elementary School', 'ING', 'Ingleside Drive', '976', 'Norfolk', 'VA', 23502, 'US', 'Dr. Alana Balthazar', '7578923270', 'elementary'),
(20, 1, 'Jacox Elementary School', 'JCX', 'Marshall Avenue', '1300', 'Norfolk', 'VA', 23504, 'US', 'Dr. Rohan Cumberbatch-Smith', '7576282433', 'elementary'),
(21, 1, 'James Monroe Elementary School', 'JME', 'West 29th Street', '520', 'Norfolk', 'VA', 23508, 'US', 'Mrs. Celeste M. Jones', '7576283500', 'elementary'),
(22, 1, 'Lake Taylor High School', 'LTH', 'Kempsville Road', '1384', 'Norfolk', 'VA', 23502, 'US', 'Mrs. Latesha Wade-Jenkins', '7578923200', 'high'),
(23, 1, 'Lake Taylor Middle School', 'LTM', 'Kempsville Road', '1380', 'Norfolk', 'VA', 23502, 'US', 'Dr. Kirk', '7578923230', 'middle'),
(24, 1, 'Larchmont Elementary School', 'LRC', 'Bolling Avenue', '1145', 'Norfolk', 'VA', 23508, 'US', 'Mr. Dennis Fifer', '7574514180', 'elementary'),
(25, 1, 'Larrymore Elementary School', 'LRY', 'Halprin Drive', '7600', 'Norfolk', 'VA', 23518, 'US', 'Mr. David W. Faircloth', '7575313070', 'elementary'),
(26, 1, 'Lindenwood Elementary School', 'LIN', 'Ludlow Street', '2700', 'Norfolk', 'VA', 23504, 'US', 'Dr. Lisa Corbin', '7576282577', 'elementary'),
(27, 1, 'Little Creek Elementary School - Tarpon', 'LCT', 'Tarpon Place', '7900', 'Norfolk', 'VA', 23518, 'US', 'Ms. Carolyn D. Harper', '7575313080', 'elementary'),
(28, 1, 'Little Creek Elementary School - Nancy', 'LCN', 'Nancy Drive', '7901', 'Norfolk', 'VA', 23518, 'US', 'Ms. Carolyn D. Harper', '7575313080', 'elementary'),
(29, 1, 'Madison Alternative Center', 'MAC', 'Bowdens Ferry Road', '3700', 'Norfolk', 'VA', 23508, 'US', 'Dr. Sandra Fortner', '7576283417', 'alternative'),
(30, 1, 'Mary Calcott Elementary School', 'CAL', 'Westmont Avenue', '137', 'Norfolk', 'VA', 23503, 'US', 'Mrs. Danielle Y. McIntyre', '7575313039', 'elementary'),
(31, 1, 'Maury High School', 'MHS', 'Shirley Avenue', '322', 'Norfolk', 'VA', 23517, 'US', 'Ms. Karen Berg', '7576283344', 'high'),
(32, 1, 'Norfolk Educational Transition Academy', 'NET', 'Security Lane', '1260', 'Norfolk', 'VA', 23502, 'US', 'Mr. Gus Guardino', '7578923310', 'alternative'),
(33, 1, 'Norfolk Technical Center', 'NTC', 'North Military Highway', '1330', 'Norfolk', 'VA', 23502, 'US', 'Mr. Kevin Monroe', '7578923300', 'high'),
(34, 1, 'Northside Middle School', 'NMS', 'Granby Street', '8720', 'Norfolk', 'VA', 23503, 'US', 'Mr. Richard Fraley', '7575313150', 'middle'),
(35, 1, 'Norview Elementary School', 'NRE', 'Chesapeake Blvd', '6401', 'Norfolk', 'VA', 23513, 'US', 'Ms. Kathryn Caple', '7578524660', 'elementary'),
(36, 1, 'Norview High School', 'NRH', 'Chesapeake Blvd', '6501', 'Norfolk', 'VA', 23513, 'US', 'Dr. Marjorie Stealey', '7578524500', 'high'),
(37, 1, 'Norview Middle School', 'NRM', 'Sewells Point Road', '6325', 'Norfolk', 'VA', 23513, 'US', 'Mr. Walter Brower, Jr.', '7578524600', 'middle'),
(38, 1, 'Ocean View Elementary School', 'OVE', 'Mason Creek Road', '9501', 'Norfolk', 'VA', 23503, 'US', 'Dr. James Peterson', '7575313105', 'elementary'),
(39, 1, 'Oceanair Elementary School', 'OCN', 'Dudley Avenue', '600', 'Norfolk', 'VA', 23503, 'US', 'Ms. Lenthia Willie-Clark', '7575313095', 'elementary'),
(40, 1, 'P.B. Young, Sr. Elementary School', 'PBY', 'East Olney Road', '543', 'Norfolk', 'VA', 23510, 'US', 'Dr. Dwana White', '7576282588', 'elementary'),
(41, 1, 'Poplar Halls Elementary School', 'POP', 'Pebble Lane', '5523', 'Norfolk', 'VA', 23502, 'US', 'Ms. Cassandra Duke-Washington', '7578923280', 'elementary'),
(42, 1, 'Richard Bowling Elementary School', 'RBE', 'East Princess Anne Road', '2700', 'Norfolk', 'VA', 23504, 'US', 'Mr. Eric Goodman', '7576282515', 'elementary'),
(43, 1, 'Ruffner Academy', 'RUF', 'May Avenue', '610', 'Norfolk', 'VA', 23504, 'US', 'Ms. Sallie Cooke', '7576282466', 'alternative'),
(44, 1, 'Sewells Point Elementary School', 'SWL', 'Hampton Blvd', '7928', 'Norfolk', 'VA', 23505, 'US', 'Ms. Mary Wrushen', '7574514160', 'elementary'),
(45, 1, 'Sherwood Forest Elementary School', 'SFE', 'Sherwood Forest Lane', '3035', 'Norfolk', 'VA', 23508, 'US', 'Ms. Cheryl Jordan', '7578524550', 'elementary'),
(46, 1, 'Southside STEM Academy at Campostella', 'SSS', 'Campostella Road', '1106', 'Norfolk', 'VA', 23523, 'US', 'Dr. Rhonda Ambrose', '7574943850', 'elementary'),
(47, 1, 'St. Helena Elementary School', 'STH', 'South Main Street', '903', 'Norfolk', 'VA', 23523, 'US', 'Ms. Vandelyn Hodges', '7574943884', 'elementary'),
(48, 1, 'Suburban Park Elementary School', 'SUB', 'Thole Street', '310', 'Norfolk', 'VA', 23505, 'US', 'Mrs. Brenda Shepherd', '7575313118', 'elementary'),
(49, 1, 'Tanners Creek Elementary School', 'TAN', 'Longdale Drive', '1335', 'Norfolk', 'VA', 23513, 'US', 'Mrs. Maritsa Alger', '7578524555', 'elementary'),
(50, 1, 'Tarrallton Elementary School', 'TAR', 'Tarrallton Drive', '2080', 'Norfolk', 'VA', 23518, 'US', 'Mr. Daniel White', '7575311800', 'elementary'),
(51, 1, 'Tidewater Park Elementary School', 'TPE', 'East Brambleton Avenue', '1045', 'Norfolk', 'VA', 23510, 'US', 'Dr. Sharon Phillips', '7576282500', 'elementary'),
(52, 1, 'W.H. Taylor Elementary School', 'WHT', 'West Princess Anne Road', '1122', 'Norfolk', 'VA', 23507, 'US', 'Ms. Charlene Felition', '7576282525', 'elementary'),
(53, 1, 'Willard Elementary School', 'WIL', 'Willow Wood Drive', '1511', 'Norfolk', 'VA', 23509, 'US', 'Mrs. Julie Honeycutt', '7576282721', 'elementary'),
(54, 1, 'Willoughby Elementary School', 'WLB', 'Fourth View Street', '9500', 'Norfolk', 'VA', 23508, 'US', 'Mrs. June Lightfoot', '7575313127', 'elementary'),
(55, 2, 'Churchland High School', 'CHS', 'Cedar Lane', '4301', 'Portsmouth', 'VA', 23703, 'US', 'Mr. Shawn L. Millaci', '7576862500', 'high'),
(56, 2, 'I.C. Norcom High School', 'NOR', 'London Blvd', '1801', 'Portsmouth', 'VA', 23704, 'US', 'Dr. Laguna O. Foster', '7573935442', 'high'),
(57, 2, 'Woodrow Wilson High School', 'WWH', 'Elmhurst Lane', '1401', 'Portsmouth', 'VA', 23701, 'US', 'Mr. Timothy E. Johnson', '7574652907', 'high'),
(58, 2, 'Churchland Middle School', 'CMS', 'River Shore Road', '4051', 'Portsmouth', 'VA', 23703, 'US', 'Ms. Barbara R. Kimzey', '7576862512', 'middle'),
(59, 2, 'Cradock Middle School', 'CRD', 'Alden Avenue', '21', 'Portsmouth', 'VA', 23702, 'US', 'Ms. Sonya C. Harrell', '7573938788', 'middle'),
(60, 2, 'W.E. Waters Middle School', 'WEW', 'Roosevelt Blvd', '600', 'Portsmouth', 'VA', 23701, 'US', 'Ms. Alice Graham', '7575582813', 'middle'),
(61, 2, 'Brighton Elementary School', 'BES', 'Portsmouth Blvd', '1100', 'Portsmouth', 'VA', 23704, 'US', 'Mr. Arcelius Brickhouse', '7573938870', 'elementary'),
(62, 2, 'Churchland Academy', 'CAC', 'River Shore Road', '4061', 'Portsmouth', 'VA', 23703, 'US', 'Ms. Karen D. Clark', '7576862527', 'elementary'),
(63, 2, 'Churchland Elementary School', 'CES', 'Michael Lane', '5601', 'Portsmouth', 'VA', 23703, 'US', 'Dr. Jamill Ray Jones', '7576862523', 'elementary'),
(64, 2, 'Churchland Primary and Intermediate School', 'CPI', 'Hedgerow Lane', '5700', 'Portsmouth', 'VA', 23703, 'US', 'Ms. Rosalyn T. Exum', '7576862519', 'elementary'),
(65, 2, 'Douglass Park Elementary School', 'DGP', 'Grand Street', '34', 'Portsmouth', 'VA', 23701, 'US', 'Ms. Dusti R. Johnson Brinker', '7573938646', 'elementary'),
(66, 2, 'Hodges Manor Elementary School', 'HMN', 'Cherokee Road', '1201', 'Portsmouth', 'VA', 23701, 'US', 'Dr. Faye S. Felton', '7574652921', 'elementary'),
(67, 2, 'James Hurst Elementary School', 'JHE', 'Dahlgren Avenue', '18', 'Portsmouth', 'VA', 23702, 'US', 'Mr. Morris L. Barco', '7575582811', 'elementary'),
(68, 2, 'John Tyler Elementary School', 'JTE', 'Hartford Street', '3649', 'Portsmouth', 'VA', 23707, 'US', 'Ms. Heidi M. Lewis', '7573938879', 'elementary'),
(69, 2, 'Lakeview Elementary School', 'LKV', 'Horne Avenue', '1300', 'Portsmouth', 'VA', 23701, 'US', 'Dr. Camilla C. Ferebee', '7574652901', 'elementary'),
(70, 2, 'Park View Elementary School', 'PRV', 'Elm Avenue', '260', 'Portsmouth', 'VA', 23704, 'US', 'Ms. Angela D. Flowers', '7573938647', 'elementary'),
(71, 2, 'Simonsdale Elementary School', 'SES', 'Clifford Street', '4841', 'Portsmouth', 'VA', 23701, 'US', 'Ms. Darlene F. Bright', '7574652917', 'elementary'),
(72, 2, 'Victory Elementary School', 'VES', 'Greenwood Drive', '2828', 'Portsmouth', 'VA', 23701, 'US', 'Dr. J. Wayne Williams', '7573938806', 'elementary'),
(73, 2, 'Westhaven Elementary School', 'WST', 'Clifford Drive', '3701', 'Portsmouth', 'VA', 23707, 'US', 'Mr. Ralph K. Snowden', '7573938855', 'elementary'),
(74, 2, 'Churchland Preschool', 'CHP', 'River Shore Road', '4061', 'Portsmouth', 'VA', 23703, 'US', 'Ms. Robyn A. McIntyre', '7576862533', 'preschool'),
(75, 2, 'Emily Spong Preschool', 'ESP', 'Piedmont Avenue', '2200', 'Portsmouth', 'VA', 23704, 'US', 'Ms. Vanessa P. Whichard-Harris', '7573935247', 'preschool'),
(76, 2, 'Mount Hermon Preschool', 'MHP', 'North Street', '3000', 'Portsmouth', 'VA', 23707, 'US', 'Ms. Patricia S. Willilams', '7573938825', 'preschool'),
(77, 2, 'Olive Branch Preschool', 'OBP', 'Mimosa Road', '415', 'Portsmouth', 'VA', 23701, 'US', 'Ms. Lois J. Rieckhoff', '7574652926', 'preschool'),
(78, 2, 'Excel Campus', 'XCL', 'Elmhurst Lane', '1401', 'Portsmouth', 'VA', 23701, 'US', 'Ms. Sonji Hairston', '7574652958', 'alternative'),
(79, 2, 'New Directions Center', 'NDC', 'West Road', '401', 'Portsmouth', 'VA', 23707, 'US', 'Mr. Horace L. Lambert, Jr.', '7573938728', 'alternative'),
(80, 6, 'Denbigh Early Childhood Center', 'DEC', 'Warwick Blvd', '15638', 'Newport News', 'VA', 23608, 'US', 'Ms. Amelia Hunt', '7578667789', 'alternative'),
(81, 6, 'Lee Hall Early Childhood Center', 'HEC', 'Warwick Blvd', '17346', 'Newport News', 'VA', 23602, 'US', 'Ms. Lauren Gray', '7578883329', 'alternative'),
(82, 6, 'Marshall Early Learning Center', 'MAR', '24th Street', '743', 'Newport News', 'VA', 23607, 'US', 'Ms. Vanessa Keller', '7579286832', 'alternative'),
(83, 6, 'Watkins Early Childhood Center', 'WAT', 'Burns Drive', '21', 'Newport News', 'VA', 23601, 'US', 'Ms. Sue Waxman', '7575914815', 'alternative'),
(84, 6, 'Program for Educating Exceptional Preschoolers', 'PEP', 'Gatewood Road', '1241', 'Newport News', 'VA', 23601, 'US', 'Dr. Heather Jankovich', '7575914963', 'alternative'),
(85, 6, 'An Achievable Dream Academy', 'ADA', '16th Street', '726', 'Newport News', 'VA', 23607, 'US', 'Ms. Terra Chalmer-Harris', '7579286827', 'elementary'),
(86, 6, 'Carver Elementary School', 'CAR', 'Jefferson Avenue', '6160', 'Newport News', 'VA', 23605, 'US', 'Ms. Izzie R. Brown', '7575914950', 'elementary'),
(87, 6, 'Charles Elementary School', 'CES', 'Menchville Road', '701', 'Newport News', 'VA', 23602, 'US', 'Mr. Anthony Perry', '7578867750', 'elementary'),
(88, 6, 'Deer Park Elementary School', 'DRP', 'Jefferson Avenue', '11541', 'Newport News', 'VA', 23601, 'US', 'Ms. Mary Jo Anastasio', '7575917470', 'elementary'),
(89, 6, 'Discovery STEM Academy', 'DIS', 'Chestnut Avenue', '1712', 'Newport News', 'VA', 23607, 'US', 'Ms. Christine Pilger', '7579286838', 'elementary'),
(90, 6, 'Dutrow Elementary School', 'DUT', 'Curtis Tignor Road', '60', 'Newport News', 'VA', 23608, 'US', 'Ms. Kelly Stewart', '7578867760', 'elementary'),
(91, 6, 'Epes Elementary School', 'EPE', 'Lucas Creek Road', '855', 'Newport News', 'VA', 23608, 'US', 'Mr. Reggie Alston', '7578867755', 'elementary'),
(92, 6, 'General Stanford Elementary School', 'GSE', 'Madison Avenue, Fort Eustis', '929', 'Newport News', 'VA', 23604, 'US', 'Ms. Diane C. Willis', '7578883200', 'elementary'),
(93, 6, 'Greenwood Elementary School', 'GES', 'Woodside Lane', '13460', 'Newport News', 'VA', 23608, 'US', 'Ms. Camisha Davis', '7578867744', 'elementary'),
(94, 6, 'Hidenwood Elementary School', 'HID', 'Blount Point Road', '501', 'Newport News', 'VA', 23606, 'US', 'Ms. Annette Walls', '7575914766', 'elementary'),
(95, 6, 'Hilton Elementary School', 'HIL', 'River Road', '225', 'Newport News', 'VA', 23601, 'US', 'Ms. Barbara Nagel', '7575914772', 'elementary'),
(96, 6, 'Jenkins Elementary School', 'JNK', 'Menchville Road', '80', 'Newport News', 'VA', 23602, 'US', 'Ms. Terri McCaughan', '7578815400', 'elementary'),
(97, 6, 'Kiln Creek Elementary School', 'KIL', 'Kiln Creek Parkway', '1501', 'Newport News', 'VA', 23602, 'US', 'Dr. Kathryn Hermann', '7578867961', 'elementary'),
(98, 6, 'Lee Hall Elementary School', 'HES', 'Warwick Blvd', '17346', 'Newport News', 'VA', 23603, 'US', 'Ms. Glenda Walter', '7578883320', 'elementary'),
(99, 6, 'McIntosh Elementary School', 'MCE', 'Richneck Road', '185', 'Newport News', 'VA', 23608, 'US', 'Ms. Ethel Francis', '7578867767', 'elementary'),
(100, 6, 'Nelson Elementary School', 'NEL', 'Moyer Road', '826', 'Newport News', 'VA', 23608, 'US', 'Dr. Melody Camm', '7578867783', 'elementary'),
(101, 6, 'Newsome Park Elementary School', 'NEW', 'Marshall Avenue', '4200', 'Newport News', 'VA', 23607, 'US', 'Ms. Kimberly Judge', '7579286810', 'elementary'),
(102, 6, 'Palmer Elementary School', 'PES', 'Palmer Lane', '100', 'Newport News', 'VA', 23602, 'US', 'Ms. Karen Lynch', '7578815000', 'elementary'),
(103, 6, 'Richneck Elementary School', 'RCH', 'Tyner Drive', '205', 'Newport News', 'VA', 23608, 'US', 'Mr. Troy Latuch', '7578867772', 'elementary'),
(104, 6, 'Riverside Elementary School', 'RVR', 'Country Club Road', '1100', 'Newport News', 'VA', 23606, 'US', 'Mr. Bryan Thrift', '7575914740', 'elementary'),
(105, 6, 'Sanford Elementary School', 'SFD', 'Colony Road', '480', 'Newport News', 'VA', 23602, 'US', 'Mr. Brian Lieberman', '7578867778', 'elementary'),
(106, 6, 'Saunders Elementary School', 'SAU', 'Harpersville Road', '853', 'Newport News', 'VA', 23601, 'US', 'Mr. Timothy Edwards', '7575914781', 'elementary'),
(107, 6, 'Sedgefield Elementary School', 'SED', 'Main Street', '804', 'Newport News', 'VA', 23605, 'US', 'Ms. Raquel Cox', '7575914792', 'elementary'),
(108, 6, 'Yates Elementary School', 'YES', 'Maxwell Lane', '73', 'Newport News', 'VA', 23606, 'US', 'Mr. Mark Kirk', '7578815450', 'elementary'),
(109, 6, 'An Achievable Dream Middle School', 'ADM', 'Marshall Avenue', '5720', 'Newport News', 'VA', 23605, 'US', 'Ms. Marylin Sinclair-White', '7572837820', 'middle'),
(110, 6, 'Crittenden Middle School', 'CRT', 'Jefferson Avenue', '6158', 'Newport News', 'VA', 23605, 'US', 'Ms. Felicia F. Barnett', '7575914900', 'middle'),
(111, 6, 'Dozier Middle School', 'DOZ', 'Industrial Park Drive', '432', 'Newport News', 'VA', 23608, 'US', 'Ms. Lisa Gatz', '7578883300', 'middle'),
(112, 6, 'Gildersleeve Middle School', 'GIL', 'Minton Drive', '1', 'Newport News', 'VA', 23606, 'US', 'Dr. Windy Nichols', '7575914862', 'middle'),
(113, 6, 'Hines Middle School', 'HIN', 'McLawhorne Drive', '561', 'Newport News', 'VA', 23601, 'US', 'Dr. Amanda Corbin-Staton', '7575914878', 'middle'),
(114, 6, 'Huntington Middle School', 'HUN', 'Orcutt Avenue', '3401', 'Newport News', 'VA', 23607, 'US', 'Ms. Courtney Mompoint', '7579286846', 'middle'),
(115, 6, 'Passage Middle School', 'PAS', 'Atkinson Way', '400', 'Newport News', 'VA', 23608, 'US', 'Ms. Janelle Spitz', '7578867600', 'middle'),
(116, 6, 'Booker T. Washington Middle School', 'BTW', 'Chestnut Avenue', '3700', 'Newport News', 'VA', 23607, 'US', 'Dr. Sean Callender', '7579286860', 'middle'),
(117, 6, 'An Achievable Dream High School', 'ADH', 'Marshall Avenue', '5720', 'Newport News', 'VA', 23605, 'US', 'Ms. Marylin Sinclair-White', '7572837820', 'high'),
(118, 6, 'Denbigh High School', 'DHS', 'Denbigh Blvd', '259', 'Newport News', 'VA', 23608, 'US', 'Dr. Eleanor Blowe', '7578867700', 'high'),
(119, 6, 'Heritage High School', 'HER', 'Marshall Avenue', '5800', 'Newport News', 'VA', 23605, 'US', 'Ms. Shameka Gerald', '7579286100', 'high'),
(120, 6, 'Menchville High School', 'MEN', 'Menchville Road', '275', 'Newport News', 'VA', 23602, 'US', 'Mr. Robert Surry', '7578867722', 'high'),
(121, 6, 'Warwick High School', 'WAR', 'Copeland Lane', '51', 'Newport News', 'VA', 23601, 'US', 'Mr. Anthony Frazier', '7575914700', 'high'),
(122, 6, 'Woodside High School', 'WOD', 'Woodside Lane', '13450', 'Newport News', 'VA', 23608, 'US', 'Mr. Jonathan Hochman', '7578867530', 'high'),
(123, 6, 'Aviation Academy', 'AVI', 'Bland Blvd', '902-B', 'Newport News', 'VA', 23602, 'US', 'Dr. Aaron Smith', '7578862745', 'high'),
(124, 6, 'Enterprise Academy', 'ENT', 'Diligence Drive', '813/Suite 110', 'Newport News', 'VA', 23606, 'US', 'Dr. Darwin Mills', '7575914971', 'high'),
(125, 6, 'New Horizons Regional Education Center - Hampton', 'NHH', 'Butler Farm Road', '520', 'Newport News', 'VA', 23666, 'US', 'Mr. Dewey Ray', '7577661100', 'high'),
(126, 6, 'New Horizons Regional Education Center - Newport News', 'NHN', 'Woodside Lane', '13400', 'Newport News', 'VA', 23608, 'US', 'Mr. Bruce Schaffer', '7578744444', 'high'),
(127, 6, 'Point Option', 'OPT', 'Diligence Drive', '813/Suite 100', 'Newport News', 'VA', 23606, 'US', 'Mr. Michael Bonfiglio', '7575917408', 'high'),
(128, 6, 'Telecommunications Center', 'TCC', 'Minton Drive', '4', 'Newport News', 'VA', 23606, 'US', 'Mr. Ray Price', '7575914687', 'high'),
(129, 4, 'Booker T. Washington Elementary School', 'BTW', 'Walnut Street', '204', 'Suffolk', 'VA', 23434, 'US', 'Ms.Lori Mounie', '7579346226', 'elementary'),
(130, 4, 'Creekside Elementary School', 'CRK', 'Bennett\'s Creek Park Road', '1000', 'Suffolk', 'VA', 23434, 'US', 'Ms. Katrina Rountree', '7579234251', 'elementary'),
(131, 4, 'Driver Elementary School', 'DRV', 'Driver Lane', '4270', 'Suffolk', 'VA', 23435, 'US', 'Ms. Melodie Griffin', '7579234106', 'elementary'),
(132, 4, 'Elephant\'s Fork Elementary School', 'ELF', 'William Reid Drive', '2316', 'Suffolk', 'VA', 23434, 'US', 'Ms. Jessica Avery', '7579235250', 'elementary'),
(133, 4, 'Hillpoint Elementary', 'HIL', 'Hillpoint Blvd', '1101', 'Suffolk', 'VA', 23434, 'US', 'Ms. Catherine Pichon', '7579235252', 'elementary'),
(134, 4, 'Kilby Shores Elementary School', 'KIL', 'Kilby Shores Drive', '111', 'Suffolk', 'VA', 23434, 'US', 'Ms. Lorri Banks', '7579346214', 'elementary'),
(135, 4, 'Mack Benn, Jr. Elementary School', 'MBJ', 'Nansemond Parkway', '1253', 'Suffolk', 'VA', 23434, 'US', 'Mr. David LeFevre', '7579346224', 'elementary'),
(136, 4, 'Nansemond Parkway Elementary School', 'NPE', 'Nansemond Parkway', '3012', 'Suffolk', 'VA', 23434, 'US', 'Ms. Chanel Bryant', '7579234167', 'elementary'),
(137, 4, 'Northern Shores Elementary School', 'NSE', 'Respass Beach Road', '6701', 'Suffolk', 'VA', 23435, 'US', 'Ms. Tara W. Moore', '7579234169', 'elementary'),
(138, 4, 'Oakland Elementary School', 'OAK', 'Godwin Blvd', '5505', 'Suffolk', 'VA', 23434, 'US', 'Ms. Temesha Dabney', '7579235248', 'elementary'),
(139, 4, 'Pioneer Elementary', 'PIO', 'Pioneer Road', '150', 'Suffolk', 'VA', 23437, 'US', 'Dr. Danielle Belton', '7579255782', 'elementary'),
(140, 4, 'Forest Glen Middle School', 'FGM', 'Forest Glen Drive', '200', 'Suffolk', 'VA', 23434, 'US', 'Mr. Melvin Bradshaw', '7579255780', 'middle'),
(141, 4, 'John Yeates Middle School', 'JYM', 'Bennett\'s Pasture Road', '4901', 'Suffolk', 'VA', 23435, 'US', 'Mr. Shawn Green', '7579234105', 'middle'),
(142, 4, 'John F. Kennedy Middle School', 'JFK', 'East Washington Street', '2325', 'Suffolk', 'VA', 23434, 'US', 'Ms. Vivian Covington', '7579346212', 'middle'),
(143, 4, 'King\'s Fork Middle School', 'KFM', 'King\'s Fork Road', '350', 'Suffolk', 'VA', 23434, 'US', 'Ms. Jennifer Presson', '7579235246', 'middle'),
(144, 4, 'The Pruden Center', 'PRU', 'Pruden Blvd', '4169', 'Suffolk', 'VA', 23434, 'US', 'Mr. Andre Skinner', '7579255651', 'special'),
(145, 4, 'Turlington Woods', 'TUR', 'Turlington Road', '629', 'Suffolk', 'VA', 23434, 'US', 'Mr. Kinsel Bynum', '7579346215', 'special'),
(146, 4, 'King\'s Fork High School', 'KNG', 'King\'s Fork Road', '351', 'Suffolk', 'VA', 23434, 'US', 'Dr. Ron Leigh', '7579235240', 'high'),
(147, 4, 'Lakeland High School', 'LAK', 'Kenyon Road', '214', 'Suffolk', 'VA', 23434, 'US', 'Mr. Douglas Wagoner', '7579255790', 'high'),
(148, 4, 'Nansemond River High School', 'NRH', 'Nansemond Parkway', '3301', 'Suffolk', 'VA', 23434, 'US', 'Mr. Daniel O\'Leary', '7579234101', 'high'),
(149, 5, 'Aberdeen Elementary School', 'ABE', 'Aberdeen Road', '1424', 'Hampton', 'VA', 23666, 'US', 'Ms. Karla Young', '7578254624', 'elementary'),
(150, 5, 'Andrews PreK-8 School', 'AND', 'Victoria Blvd', '3120', 'Hampton', 'VA', 23661, 'US', 'Mr. Jeffrey Blowe', '7572683333', 'alternative'),
(151, 5, 'Armstrong Elementary School', 'ARM', 'Matoaka Road', '3401', 'Hampton', 'VA', 23661, 'US', 'Ms. Millicent Rogers', '7577271067', 'elementary'),
(152, 5, 'Asbury Elementary School', 'ASB', 'Beach Road', '140', 'Hampton', 'VA', 23664, 'US', 'Ms. Susan Johnson', '7578505075', 'elementary'),
(153, 5, 'Barron Elementary School', 'BAR', 'Fox Hill Road', '45', 'Hampton', 'VA', 23669, 'US', 'Ms. Levia Stovall', '7578505100', 'elementary'),
(154, 5, 'Bassette Elementary School', 'BAS', 'Bell Street', '671', 'Hampton', 'VA', 23661, 'US', 'Dr. Bryce Johnson', '7577271071', 'elementary'),
(155, 5, 'Booker Elementary Schools', 'BOO', 'Apollo Drive', '160', 'Hampton', 'VA', 23669, 'US', 'Ms. Brynne Cere', '7578505096', 'elementary'),
(156, 5, 'Bryan Elementary School', 'BRY', 'North Mallory Street', '1021', 'Hampton', 'VA', 23663, 'US', 'Ms. Lynette Nelms', '7577271056', 'elementary'),
(157, 5, 'Burbank Elementary School', 'BUR', 'Tide Mill Lane', '40', 'Hampton', 'VA', 23666, 'US', 'Ms. Ashley Ide', '7578254642', 'elementary'),
(158, 5, 'Cary Elementary School', 'CAR', 'Andrews Blvd', '2009', 'Hampton', 'VA', 23663, 'US', 'Dr. Heidi Brezinski', '7578505092', 'elementary'),
(159, 5, 'Cooper Elementary School', 'COO', 'Marcella Road', '200', 'Hampton', 'VA', 23666, 'US', 'Ms. Tracie Albea', '7578254645', 'elementary'),
(160, 5, 'Forrest Elementary School', 'FOR', 'Todds Lane', '1406', 'Hampton', 'VA', 23666, 'US', 'Dr. Kelli Cedo', '7578254627', 'elementary'),
(161, 5, 'Kraft Elementary School', 'KRA', 'Concord Drive', '600', 'Hampton', 'VA', 23666, 'US', 'Ms. Whitney Cataldo', '7578254634', 'elementary'),
(162, 5, 'Langley Elementary School', 'LAN', 'Rockwell Road', '16', 'Hampton', 'VA', 23669, 'US', 'Ms. Elizabeth Franks', '7578505105', 'elementary'),
(163, 5, 'Machen Elementary School', 'MAC', 'Sacramento Drive', '20', 'Hampton', 'VA', 23666, 'US', 'Ms. Jennifer Humble', '7577272900', 'elementary'),
(164, 5, 'Phillips Elementary School', 'PHI', 'LeMaster Drive', '703', 'Hampton', 'VA', 23669, 'US', 'Ms. Elizabeth Cromartie', '7578505079', 'elementary'),
(165, 5, 'Smith Elementary School', 'SMI', 'Woodland Road', '379', 'Hampton', 'VA', 23669, 'US', 'Dr. Patrina Jenkins', '7578505088', 'elementary'),
(166, 5, 'Tucker-Capps Elementary School', 'TUC', 'Wellington Drive', '113', 'Hampton', 'VA', 23666, 'US', 'Ms. Tiffany Geddie-Suggs', '7578254641', 'elementary'),
(167, 5, 'Tyler Elementary School', 'TYL', 'Salina Street', '57', 'Hampton', 'VA', 23669, 'US', 'Ms. Adriane Bradley-Gray', '7577271439', 'elementary'),
(168, 5, 'Phenix PreK-8 School', 'PHE', 'Big Bethel Road', '1061', 'Hampton', 'VA', 23666, 'US', 'Ms. Robin Hunt-Crenshaw', '7572683500', 'elementary'),
(169, 5, 'Davis Middle School', 'DAV', 'Todds Lane', '1435', 'Hampton', 'VA', 23666, 'US', 'Ms. Violet Whiteman', '7578254520', 'middle'),
(170, 5, 'Eaton Middle School', 'EAT', 'Cunningham Drive', '2108', 'Hampton', 'VA', 23666, 'US', 'Ms. Sharon Slater', '7578254540', 'middle'),
(171, 5, 'Jones Middle School', 'JON', 'Nickerson Blvd', '1819', 'Hampton', 'VA', 23663, 'US', 'Dr. Daniel Bowling', '7578507900', 'middle'),
(172, 5, 'Lindsay Middle School', 'LIN', 'Briarfield Road', '1636', 'Hampton', 'VA', 23661, 'US', 'Ms. Chevese Thomas', '7578254560', 'middle'),
(173, 5, 'Syms Middle School', 'SYM', 'Fox Hill Road', '170', 'Hampton', 'VA', 23669, 'US', 'Mr. Michael Blount, Jr.', '7578505050', 'middle'),
(174, 5, 'Bethel High School', 'BET', 'Big Bethel Road', '1067', 'Hampton', 'VA', 23666, 'US', 'Mr. Ralph Sanders', '7578254400', 'high'),
(175, 5, 'Hampton High School', 'HAM', 'West Queen Street', '1491', 'Hampton', 'VA', 23669, 'US', 'Mr. Kevin Davis', '7578254430', 'high'),
(176, 5, 'Kecoughtan High School', 'KEC', 'Woodland Road', '522', 'Hampton', 'VA', 23669, 'US', 'Mr. Jeffrey Mordica', '7578505000', 'high'),
(177, 5, 'Phoebus High School', 'PHE', 'Ireland Street', '100', 'Hampton', 'VA', 23663, 'US', 'Mr. Mark Hudson', '7577271000', 'high'),
(178, 5, 'Bridgeport Academy', 'BPA', 'Briarfield Road', '1646', 'Hampton', 'VA', 23669, 'US', 'Ms. Angelina Lipford', '7577271225', 'special'),
(179, 5, 'Motion Early Childhood Center', 'MOT', 'Old Buckroe Road', '339', 'Hampton', 'VA', 23663, 'US', 'Ms. Joanne Drew', '7577271061', 'special'),
(180, 5, 'Spratley Gifted Center', 'SPR', 'Woodland Road', '339', 'Hampton', 'VA', 23669, 'US', 'Dr. Kenneth Crum', '7578505032', 'special'),
(181, 5, 'New Horizons Regional Education Center', 'NHB', 'Butler Farm Road', '520', 'Hampton', 'VA', 23666, 'US', 'Mr. J. Joseph Johnson', '7577661100', 'special'),
(182, 3, 'B. M. Williams Primary', 'BMW', 'Battlefield Blvd.', '1100', 'Chesapeake', 'VA', 23320, 'US', 'Mr. Thomas P. Moyer', '7575470238', 'elementary'),
(183, 3, 'Butts Road Intermediate', 'BRI', 'Mt. Pleasant Rd.', '1571', 'Chesapeake', 'VA', 23322, 'US', 'Mrs. Nancy L. Cruz', '7574824566', 'middle'),
(184, 3, 'Butts Road Primary', 'BRP', 'Mt. Pleasant Rd.', '1000', 'Chesapeake', 'VA', 23222, 'US', 'Mr. James S. Lewter', '7574825820', 'elementary'),
(185, 3, 'Camelot Elementary School', 'CAM', 'Guenevere Drive', '2901', 'Chesapeake', 'VA', 23323, 'US', 'Dr. D. Jean Jones', '7575885347', 'elementary'),
(186, 3, 'Carver Intermediate School', 'CAR', 'Broad Street', '2601', 'Chesapeake', 'VA', 23324, 'US', 'Mrs. Michelle A. Ferebee', '7574947505', 'middle'),
(187, 3, 'Cedar Road Elementary', 'CRE', 'Cedar Road', '1605', 'Chesapeake', 'VA', 23322, 'US', 'Mrs. Tracy A. Cioppa', '7575470166', 'elementary'),
(188, 3, 'Chittum Elementary School', 'CHT', 'Dock Landing Road', '2008', 'Chesapeake', 'VA', 23321, 'US', 'Mrs. Sharon W. Miles', '7574656300', 'elementary'),
(189, 3, 'Crestwood Intermediate', 'CWI', 'Great Bridge Blvd', '1240', 'Chesapeake', 'VA', 23320, 'US', 'Mrs. Eva Renee Davis', '7574947565', 'middle'),
(190, 3, 'Deep Creek Central Elementary', 'DCC', 'Shipyard Road', '2448', 'Chesapeake', 'VA', 23323, 'US', 'Mrs. Barbara H. Fortner', '7575585356', 'elementary'),
(191, 3, 'Deep Creek Elementary', 'DCE', 'Forehand Dr.', '2809', 'Chesapeake', 'VA', 23323, 'US', 'Dr. Barry Brown', '7575885333', 'elementary'),
(192, 3, 'Georgetown Primary', 'GTP', 'Providence Road', '436', 'Chesapeake', 'VA', 23325, 'US', 'Mrs. Terry A. Reitz', '7575787060', 'elementary'),
(193, 3, 'Grassfield Elementary School', 'GFE', 'Averill Drive', '2248', 'Chesapeake', 'VA', 23323, 'US', 'Mr. Robert J. Sander', '7575888923', 'elementary'),
(194, 3, 'Great Bridge Intermediate', 'GBI', 'Hanbury Road West', '253', 'Chesapeake', 'VA', 23322, 'US', 'Mrs. Heather D. Martin', '7574824405', 'middle'),
(195, 3, 'Great Bridge Primary School', 'GBP', 'Cedar Road', '408', 'Chesapeake', 'VA', 23322, 'US', 'Mrs. Theresa L. Meyers', '7575471135', 'elementary'),
(196, 3, 'Greenbrier Intermediate', 'GRI', '1701 River Birch Run N.', '1701', 'Chesapeake', 'VA', 23320, 'US', 'Mr. Keith C. Hyater', '7575787080', 'middle'),
(197, 3, 'Greenbrier Primary School', 'GRP', 'Eden Way, South', '1551', 'Chesapeake', 'VA', 23320, 'US', 'Mrs. Joan B. Raybourn', '7574363428', 'elementary'),
(198, 3, 'Norfolk Highlands Primary', 'NHP', 'Myrtle Avenue', '1115', 'Chesapeake', 'VA', 23325, 'US', 'Mrs. Shawnia C. Smiley', '7575787092', 'elementary'),
(199, 3, 'Portlock Primary School', 'PRT', 'Varsity Drive', '1857', 'Chesapeake', 'VA', 23324, 'US', 'Mrs. Regina B. Ratcliff', '7574947555', 'elementary'),
(200, 3, 'Rena B. Wright Primary', 'RBW', 'Park Avenue', '600', 'Chesapeake', 'VA', 23324, 'US', 'Mrs. Brenda H. Hobbs', '7574947585', 'elementary'),
(201, 3, 'Southeastern Elementary', 'SEE', 'Battlefield Blvd', '1853', 'Chesapeake', 'VA', 23322, 'US', 'Dr. Hope P. Terrell', '7574217676', 'elementary'),
(202, 3, 'Southwestern Elementary', 'SWE', 'Airline Blvd.', '4410', 'Chesapeake', 'VA', 23321, 'US', 'Mrs. Sonya L. Beasley', '7574666310', 'elementary'),
(203, 3, 'Chesapeake Alternative School', 'CAS', 'Providence Road', '605', 'Chesapeake', 'VA', 23325, 'US', 'Dr. Penny K. Schultz', '7575787046', 'alternative'),
(204, 3, 'Chesapeake Center for Science and Technology', 'CST', 'Cedar Road', '1617', 'Chesapeake', 'VA', 23322, 'US', 'Dr. Shonda Pittman-Windham', '7575470134', 'alternative'),
(205, 3, 'Crestwood Middle School', 'CWM', 'Great Bridge Blvd', '1420', 'Chesapeake', 'VA', 23320, 'US', 'Mr. Michael R. Ward', '7574947560', 'middle'),
(206, 3, 'Deep Creek High School', 'DCH', 'Margaret Booker Drive', '2900', 'Chesapeake', 'VA', 23323, 'US', 'Mrs. J. Page Bagley', '7575585302', 'high'),
(207, 3, 'Deep Creek Middle School', 'DCM', 'Deal Drive', '1955', 'Chesapeake', 'VA', 23323, 'US', 'Dr. Muriel P.Barefield', '7575585321', 'middle'),
(208, 3, 'Grassfield High School', 'GFH', 'Grizzly Trail', '2007', 'Chesapeake', 'VA', 23323, 'US', 'Mr. Michael N. Perez', '7575584749', 'high'),
(209, 3, 'Great Bridge High School', 'GBH', 'West Hanbury Road', '301', 'Chesapeake', 'VA', 23322, 'US', 'Mr. Jeffrey Johnson', '7574825191', 'high'),
(210, 3, 'Great Bridge Middle School', 'GBM', 'South Battlefield Blvd', '441', 'Chesapeake', 'VA', 23322, 'US', 'Mr. Craig K. Mills', '7574825128', 'middle'),
(211, 3, 'Green Rum Middle', 'GRM', 'Greenbrier Parkway', '1016', 'Chesapeake', 'VA', 23320, 'US', 'Dr. Michael J. Mustain', '7575485309', 'middle'),
(212, 3, 'Hickory Elementary School', 'HES', 'Benefit Road', '109', 'Chesapeake', 'VA', 23322, 'US', 'Mrs. Kim Pinello', '7574217080', 'elementary'),
(213, 3, 'Hickory High School', 'HHS', 'Hawk Blvd', '1996', 'Chesapeake', 'VA', 23322, 'US', 'Ms. Amber N. Dortch', '7574214295', 'high'),
(214, 3, 'Hickory Middle School', 'HMS', 'Hawk Blvd', '1997', 'Chesapeake', 'VA', 23322, 'US', 'Dr. Deborah T. Hutchens', '7574210468', 'middle'),
(215, 3, 'Hugo Owens Middle School', 'OMS', 'Horseback Run', '1997', 'Chesapeake', 'VA', 23323, 'US', 'Mrs. Alaina C. Britt', '7575585382', 'middle'),
(216, 3, 'Indian River High School', 'IRH', 'Braves Trail', '1969', 'Chesapeake', 'VA', 23325, 'US', 'Mrs. Naomi R. Dunbar', '7575787000', 'high'),
(217, 3, 'Indian River Middle School', 'IRM', 'Old Greenbrier Road', '2300', 'Chesapeake', 'VA', 23325, 'US', 'Ms. Terre J. Werts', '7575787030', 'middle'),
(218, 3, 'Jolliff Middle School', 'JMS', 'Jolliff Road', '1021', 'Chesapeake', 'VA', 23321, 'US', 'Mr. Quentin E. Hicks', '7574651646', 'middle'),
(219, 3, 'Oscar Smith High School', 'OSH', 'Tiger Drive', '1994', 'Chesapeake', 'VA', 23320, 'US', 'Mr. Paul A. Joseph', '7575480696', 'high'),
(220, 3, 'Oscar Smith Middle School', 'OSM', 'Rodgers Street', '2500', 'Chesapeake', 'VA', 23324, 'US', 'Mrs. Judith C. Thurston', '7574947590', 'middle'),
(221, 3, 'Sparrow Road Intermediate', 'SRI', 'Sparrow Road', '1605', 'Chesapeake', 'VA', 23321, 'US', 'Ms. Sharon L. Popson', '7575787050', 'middle'),
(222, 3, 'Thurgood Marshall Elementary', 'TME', 'Border Road', '2706', 'Chesapeake', 'VA', 23324, 'US', 'Mrs. Karen Y. Lopez', '7574947515', 'elementary'),
(223, 3, 'Treakle Elementary School', 'TES', 'Gomerton Road', '2500', 'Chesapeake', 'VA', 23323, 'US', 'Mrs. Shelia J. Johnson', '7575585361', 'elementary'),
(224, 3, 'Truitt Intermediate School', 'TIS', 'Holly Avenue', '1100', 'Chesapeake', 'VA', 23324, 'US', 'Mrs. Kimberly G. Lowden', '7574948014', 'middle'),
(225, 3, 'Western Branch High School', 'WBH', 'Bruin Place', '1968', 'Chesapeake', 'VA', 23321, 'US', 'Dr. Thomas A. Whitley', '7576387904', 'high'),
(226, 3, 'Western Branch Intermediate', 'WBI', 'Terry Drive', '4013', 'Chesapeake', 'VA', 23321, 'US', 'Ms. Jataune N. Jones', '7576387941', 'middle'),
(227, 3, 'Western Branch Middle School', 'WBM', 'Hawksley Drive', '4201', 'Chesapeake', 'VA', 23321, 'US', 'Dr. Kambar Khoshaba', '7576387920', 'middle'),
(228, 3, 'Western Branch Primary', 'WBP', 'Terry Drive', '4122', 'Chesapeake', 'VA', 23321, 'US', 'Mrs. Gayle J. Bartlett', '7576387951', 'elementary'),
(229, 7, 'Advanced Technology Center', 'ATC', 'College Crescent', '1800', 'Virginia Beach', 'VA', 23453, 'US', 'Mr. Michael D. Taylor, Director', '757.648.5800', 'alternative'),
(230, 7, 'Alanton Elementary', 'ALE', 'Stephens Road', '1441', 'Virginia Beach', 'VA', 23454, 'US', 'Ms. Charlene E. Garran', '757.648.2000', 'elementary'),
(231, 7, 'Arrowhead Elementary', 'ARE', 'Susquehanna Drive', '5549', 'Virginia Beach', 'VA', 23462, 'US', 'Mr. Benjamin L. Gillikin', '757.648.2040', 'elementary'),
(232, 7, 'Bayside Elementary', 'BAE', 'Bayside Road', '5649', 'Virginia Beach', 'VA', 23455, 'US', 'Ms. Catherine M. Brumm', '757.648.2080', 'elementary'),
(233, 7, 'Bayside High', 'BAH', 'Haygood Road', '4960', 'Virginia Beach', 'VA', 23455, 'US', 'Mr. James D. Miller', '757.648.5200', 'high'),
(234, 7, 'Bayside Middle', 'BAM', 'Newtown Road', '965', 'Virginia Beach', 'VA', 23462, 'US', 'Dr. Paula Johnson', '757.648.4400', 'middle'),
(235, 7, 'Bayside Sixth Grade Campus', 'BSG', 'Jericho Road', '4722', 'Virginia Beach', 'VA', 23462, 'US', 'Ms. Camille A. Harmon', '757.648.4440', 'elementary'),
(236, 7, 'Birdneck Elementary', 'BRD', 'S. Birdneck Road', '957', 'Virginia Beach', 'VA', 23451, 'US', 'Mr. Robert V. Yoshida', '757.648.2120', 'elementary'),
(237, 7, 'Brandon Middle', 'BRN', 'Pope Street', '1700', 'Virginia Beach', 'VA', 23464, 'US', 'Ms. Christy E. McQueeney', '757.648.4450', 'middle'),
(238, 7, 'Brookwood Elementary', 'BRK', 'S. Lynnhaven Road', '601', 'Virginia Beach', 'VA', 23452, 'US', 'Mrs. Christine C. Alarcon', '757.648.2160', 'elementary'),
(239, 7, 'Centerville Elementary', 'CNT', 'Centerville Turnpike', '2201', 'Virginia Beach', 'VA', 23464, 'US', 'Ms. Teresa A. Ritzel', '757.648.2200', 'elementary'),
(240, 7, 'Christopher Farms Elementary', 'CFE', 'Pleasant Acres Drive', '2828', 'Virginia Beach', 'VA', 23453, 'US', 'Ms. Teri A. Breaux', '757.648.2240', 'elementary'),
(241, 7, 'College Park Elementary', 'CPE', 'Bennington Road', '1110', 'Virginia Beach', 'VA', 23464, 'US', 'Dr. Sterling A. White, Jr.', '757.648.2280', 'elementary'),
(242, 7, 'Cooke Elementary', 'CKE', 'Mediterranean Avenue', '1501', 'Virginia Beach', 'VA', 23451, 'US', 'Mrs. Pamela M. Bennis', '757.648.2320', 'elementary'),
(243, 7, 'Corporate Landing Elementary', 'CLE', 'Corporate Landing Pkwy', '1590', 'Virginia Beach', 'VA', 23454, 'US', 'Ms. Kelly W. Coon', '757.648.2360', 'elementary'),
(244, 7, 'Corporate Landing Middle', 'CLM', 'Corporate Landing Pkwy', '1597', 'Virginia Beach', 'VA', 23454, 'US', 'Dr. Freddie P. Alarcon, Jr.', '757.648.4500', 'middle'),
(245, 7, 'Cox High', 'COX', 'Shorehaven Drive', '2425', 'Virginia Beach', 'VA', 23454, 'US', 'Dr. Randi R. Riesbeck', '757.648.5250', 'high'),
(246, 7, 'Creeds Elementary', 'CRD', 'Princess Anne Road', '920', 'Virginia Beach', 'VA', 23457, 'US', 'Ms. Casey L. Conger', '757.648.2400', 'elementary'),
(247, 7, 'Dey Elementary', 'DEY', 'N. Great Neck Road', '1900', 'Virginia Beach', 'VA', 23454, 'US', 'Ms. Elizabeth C. Bianchi', '757.648.2440', 'elementary'),
(248, 7, 'Diamond Springs Elementary', 'DSE', 'Learning Circle', '5225', 'Virginia Beach', 'VA', 23462, 'US', 'Ms. Gloria Coston', '757.648.4240', 'elementary'),
(249, 7, 'Fairfield Elementary', 'FFE', 'Providence Road', '5428', 'Virginia Beach', 'VA', 23464, 'US', 'Mr. Douglas Knapp', '757.648.2480', 'elementary'),
(250, 7, 'First Colonial High', 'FCH', 'Mill Dam Road', '1272', 'Virginia Beach', 'VA', 23454, 'US', 'Dr. Nancy B. Farrell', '757.648.5300', 'high'),
(251, 7, 'Glenwood Elementary', 'GLD', 'Round Hill Drive', '2213', 'Virginia Beach', 'VA', 23464, 'US', 'Dr. Karin E. DiMaggio', '757.648.2520', 'elementary'),
(252, 7, 'Great Neck Middle', 'GNM', 'North Great Neck Road', '1848', 'Virginia Beach', 'VA', 23454, 'US', 'Dr. Eugene F. Soltner', '757.648.4550', 'middle'),
(253, 7, 'Green Run Collegiate', 'GRC', 'Dahlia Drive', '1700', 'Virginia Beach', 'VA', 23453, 'US', 'Mrs. Barbara J. Winn', '757.648.5393', 'pilot'),
(254, 7, 'Green Run Elementary', 'GRE', 'Green Garden Circle', '1200', 'Virginia Beach', 'VA', 23453, 'US', 'Ms. Sheila M. Wynn', '757.648.2560', 'elementary'),
(255, 7, 'Green Run High', 'GRH', 'Dahlia Drive', '1700', 'Virginia Beach', 'VA', 23453, 'US', 'Mr. C. Todd Tarkenton', '757.648.5350', 'high'),
(256, 7, 'Hermitage Elementary', 'HRM', 'Pleasure House Road', '1701', 'Virginia Beach', 'VA', 23455, 'US', 'Mrs. Holly J. Coggin', '757.648.2600', 'elementary'),
(257, 7, 'Holland Elementary', 'HOL', 'Holland Road', '3340', 'Virginia Beach', 'VA', 23452, 'US', 'Dr. Callie M. Richardson', '757.648.2640', 'elementary'),
(258, 7, 'Independence Middle', 'IND', 'Dunstan Lane', '1370', 'Virginia Beach', 'VA', 23455, 'US', 'Mr. Carey Manugo', '757.648.4600', 'middle'),
(259, 7, 'Indian Lakes Elementary', 'ILE', 'Homestead Drive', '1240', 'Virginia Beach', 'VA', 23464, 'US', 'Ms. Jennifer C. Born', '757.648.2680', 'elementary'),
(260, 7, 'Kellam High', 'KEL', 'West Neck Rd', '2662', 'Virginia Beach', 'VA', 23456, 'US', 'Dr. Daniel W. Smith', '757.648.5100', 'high'),
(261, 7, 'Kempsville Elementary', 'KEE', 'Kempsville Road', '570', 'Virginia Beach', 'VA', 23464, 'US', 'Ms. Lori S. Hasher', '757.648.2720', 'elementary'),
(262, 7, 'Kempsville High', 'KEH', 'Chief Trail', '5194', 'Virginia Beach', 'VA', 23464, 'US', 'Mr. William W. Harris', '757.648.5450', 'high'),
(263, 7, 'Kempsville Meadows Elementary', 'KME', 'Edwin Drive', '736', 'Virginia Beach', 'VA', 23462, 'US', 'Mr. Mikelle C. Williams', '757.648.2760', 'elementary'),
(264, 7, 'Kempsville Middle', 'KEM', 'Churchill Drive', '860', 'Virginia Beach', 'VA', 23464, 'US', 'Dr. Patti T. Jenkins', '757.648.4700', 'middle'),
(265, 7, 'Kings Grant Elementary', 'KGE', 'N. Lynnhaven Road', '612', 'Virginia Beach', 'VA', 23452, 'US', 'Ms. Lisa D. Hannah', '757.648.2800', 'elementary'),
(266, 7, 'Kingston Elementary', 'KNG', 'King\'s Grant Road', '3532', 'Virginia Beach', 'VA', 23452, 'US', 'Dr. Sharon H. Shewbridge', '757.648.2840', 'elementary'),
(267, 7, 'Landstown Elementary', 'LNE', 'Recreation Drive', '2212', 'Virginia Beach', 'VA', 23456, 'US', 'Mr. Jeffrey D. Hofmann', '757.648.2880', 'elementary'),
(268, 7, 'Landstown High', 'LNH', 'Concert Drive', '2001', 'Virginia Beach', 'VA', 23456, 'US', 'Dr. Cheryl C. Askew', '757.648.5500', 'high'),
(269, 7, 'Landstown Middle', 'LNM', 'Recreation Drive', '2204', 'Virginia Beach', 'VA', 23456, 'US', 'Mr. John T. Parkman', '757.648.4750', 'middle'),
(270, 7, 'Larkspur Middle', 'LRK', 'Princess Anne Road', '4696', 'Virginia Beach', 'VA', 23462, 'US', 'Dr. Melanie J. Hamblin', '757.648.4800', 'middle'),
(271, 7, 'Linkhorn Park Elementary', 'LNK', 'First Colonial Road', '977', 'Virginia Beach', 'VA', 23454, 'US', 'Ms. Barbara Sessoms', '757.648.2920', 'elementary'),
(272, 7, 'Luxford Elementary', 'LUX', 'Haygood Road', '4808', 'Virginia Beach', 'VA', 23455, 'US', 'Ms. Danielle E. Colucci', '757.648.2960', 'elementary'),
(273, 7, 'Lynnhaven Elementary', 'LNE', 'Dillon Drive', '210', 'Virginia Beach', 'VA', 23452, 'US', 'Mrs. Katherine R. Everett', '757.648.3000', 'elementary'),
(274, 7, 'Lynnhaven Middle', 'LNM', 'Bayne Drive', '1250', 'Virginia Beach', 'VA', 23454, 'US', 'Dr. Violet B. Hoyle', '757.648.4850', 'middle'),
(275, 7, 'Malibu Elementary', 'MAL', 'Edinburgh Drive', '3632', 'Virginia Beach', 'VA', 23452, 'US', 'Mr. Michael Maloney', '757.648.3040', 'elementary'),
(276, 7, 'New Castle Elementary', 'NCE', 'Dam Neck Road', '4136', 'Virginia Beach', 'VA', 23456, 'US', 'Ms. Gloria Harris', '757.648.3080', 'elementary'),
(277, 7, 'Newtown Elementary', 'NEW', 'Learning Circle', '5277', 'Virginia Beach', 'VA', 23462, 'US', 'Mr. Richard Sidone, Interim', '757.648.3120', 'elementary'),
(278, 7, 'North Landing Elementary', 'NLE', 'North Landing Road', '2929', 'Virginia Beach', 'VA', 23456, 'US', 'Ms. Jill S. Barger', '757.648.3160', 'elementary'),
(279, 7, 'Ocean Lakes Elementary', 'OLE', 'Upton Drive', '1616', 'Virginia Beach', 'VA', 23454, 'US', 'Dr. Linda Reese', '757.648.3200', 'elementary'),
(280, 7, 'Ocean Lakes High', 'OLH', 'Schumann Drive', '885', 'Virginia Beach', 'VA', 23454, 'US', 'Dr. Claire R. LeBlanc', '757.648.5550', 'high'),
(281, 7, 'Old Donation School', 'ODH', 'Honeygrove Road', '4633', 'Virginia Beach', 'VA', 23455, 'US', 'Dr. Kelly A. Hedrick', '757.648.3240', 'alternative'),
(282, 7, 'Parkway Elementary', 'PRK', 'O\'Hare Drive', '4180', 'Virginia Beach', 'VA', 23453, 'US', 'Mrs. Krista Barton-Arnold', '757.648.3280', 'elementary'),
(283, 7, 'Pembroke Elementary', 'PME', 'Jericho Road', '4622', 'Virginia Beach', 'VA', 23462, 'US', 'Dr. Linda Hayes', '757.648.3320', 'elementary'),
(284, 7, 'Pembroke Meadows Elementary', 'PMM', 'Cathedral Drive', '820', 'Virginia Beach', 'VA', 23455, 'US', 'Dr. Charles L. Spivey', '757.648.3360', 'elementary'),
(285, 7, 'Plaza Middle', 'PLZ', 'S. Lynnhaven Road', '3080', 'Virginia Beach', 'VA', 23452, 'US', 'Mr. Rodney Joe Burnsworth', '757.648.4900', 'middle'),
(286, 7, 'Point O View Elementary', 'POV', 'Parliament Drive', '5400', 'Virginia Beach', 'VA', 23462, 'US', 'Mr. John T. Chowns', '757.648.3440', 'elementary'),
(287, 7, 'Princess Anne Elementary', 'PAE', 'Seaboard Road', '2444', 'Virginia Beach', 'VA', 23456, 'US', 'Mr. Patrick I. Wroton', '757.648.3480', 'elementary'),
(288, 7, 'Princess Anne High', 'PAH', 'Virginia Beach Blvd.', '4400', 'Virginia Beach', 'VA', 23462, 'US', 'Mr. Danny M. Little', '757.648.5600', 'high'),
(289, 7, 'Princess Anne Middle', 'PAM', 'Holland Road', '2323', 'Virginia Beach', 'VA', 23453, 'US', 'Dr. D. Alex Bergren', '757.648.4950', 'middle'),
(290, 7, 'Providence Elementary', 'PRV', 'Providence Road', '4968', 'Virginia Beach', 'VA', 23464, 'US', 'Mr. Michael A. Taylor', '757.648.3520', 'elementary'),
(291, 7, 'Red Mill Elementary', 'RME', 'Sandbridge Road', '1860', 'Virginia Beach', 'VA', 23456, 'US', 'Dr. Michelle L. Miller', '757.648.3560', 'elementary'),
(292, 7, 'Renaissance Academy', 'REN', 'Cleveland Street', '5100', 'Virginia Beach', 'VA', 23462, 'US', 'Ms. Kay L. Thomas', '757-648-6000', 'alternative'),
(293, 7, 'Rosemont Elementary', 'ROS', 'Rosemont Road', '1257', 'Virginia Beach', 'VA', 23453, 'US', 'Ms. Cari A. Hall', '757.648.3600', 'elementary'),
(294, 7, 'Rosemont Forest Elementary', 'RFE', 'Grey Friars Chase', '1716', 'Virginia Beach', 'VA', 23456, 'US', 'Mr. Gregory Furlich', '757.648.3640', 'elementary'),
(295, 7, 'Salem Elementary', 'SLE', 'Salem Lakes Blvd.', '3961', 'Virginia Beach', 'VA', 23456, 'US', 'Dr. Ann Shufflebarger', '757.648.3680', 'elementary'),
(296, 7, 'Salem High', 'SLH', 'SunDevil Drive', '1993', 'Virginia Beach', 'VA', 23464, 'US', 'Mr. Matthew Delaney', '757.648.5650', 'high'),
(297, 7, 'Salem Middle', 'SLM', 'Lynnhaven Parkway', '2380', 'Virginia Beach', 'VA', 23464, 'US', 'Dr. James J. Smith', '757.648.5000', 'middle'),
(298, 7, 'Seatack Elementary', 'SEA', 'S. Birdneck Road', '912', 'Virginia Beach', 'VA', 23451, 'US', 'Mr. Vincent M. Darby, Sr.', '757.648.3720', 'elementary'),
(299, 7, 'Shelton Park Elementary', 'SPE', 'Shelton Road', '1700', 'Virginia Beach', 'VA', 23455, 'US', 'Ms. Tara M. Brewer', '757.648.3760', 'elementary'),
(300, 7, 'Strawbridge Elementary', 'STR', 'Strawbridge Road', '2553', 'Virginia Beach', 'VA', 23456, 'US', 'Ms. Jacqueline Y. Sargent', '757.648.3800', 'elementary'),
(301, 7, 'Tallwood Elementary', 'TLE', 'Kempsville Road', '2025', 'Virginia Beach', 'VA', 23464, 'US', 'Mr. David B. French', '757.648.3840', 'elementary'),
(302, 7, 'Tallwood High', 'TLH', 'Kempsville Road', '1668', 'Virginia Beach', 'VA', 23464, 'US', 'Dr. James Avila', '757.648.5700', 'high'),
(303, 7, 'Technical and Career Education Center', 'TEC', 'North Landing Road', '2925', 'Virginia Beach', 'VA', 23456, 'US', 'Mr. David C. Swanger, Director', '757.648.5850', 'alternative'),
(304, 7, 'Thalia Elementary', 'THA', 'Thalia Road', '421', 'Virginia Beach', 'VA', 23452, 'US', 'Dr. Mary Daniels, Interim', '757.648.3880', 'elementary'),
(305, 7, 'Thoroughgood Elementary', 'THE', 'Dunstan Lane', '1444', 'Virginia Beach', 'VA', 23455, 'US', 'Dr. Cheryl Zigrang', '757.648.3920', 'elementary'),
(306, 7, 'Three Oaks Elementary', 'TOE', 'Elson Green Avenue', '2201', 'Virginia Beach', 'VA', 23456, 'US', 'Ms. Linda L. Sidone', '757.648.3960', 'elementary'),
(307, 7, 'Trantwood Elementary', 'TRN', 'Inlynnview Road', '2344', 'Virginia Beach', 'VA', 23454, 'US', 'Ms. Lou Anne Metzger', '757.648-4000', 'elementary'),
(308, 7, 'Virginia Beach Juvenile Detention Center/Education Program', 'JDC', 'George Mason Drive', '2533', 'Virginia Beach', 'VA', 23456, 'US', 'Mr. Charles Foster', '757.263.1203', 'alternative'),
(309, 7, 'Virginia Beach Middle', 'VBM', '25th Street', '600', 'Virginia Beach', 'VA', 23451, 'US', 'Dr. Sandra R. Brown', '757.648.5050', 'middle'),
(310, 7, 'White Oaks Elementary', 'WHO', 'Windsor Oaks Blvd.', '960', 'Virginia Beach', 'VA', 23462, 'US', 'Mrs. Stephanie D. Haus', '757.648.4040', 'elementary'),
(311, 7, 'Williams Elementary', 'WLM', 'Newtown Road', '892', 'Virginia Beach', 'VA', 23462, 'US', 'Mr. Timothy Sullivan', '757.648.4080', 'elementary'),
(312, 7, 'Windsor Oaks Elementary', 'WOE', 'Van Buren Drive', '3800', 'Virginia Beach', 'VA', 23452, 'US', 'Dr. Sherri Archer', '757.648.4120', 'elementary'),
(313, 7, 'Windsor Woods Elementary', 'WWE', 'Presidential Blvd.', '233', 'Virginia Beach', 'VA', 23452, 'US', 'Mr. Matthew A. Orebaugh', '757.648.4160', 'elementary'),
(314, 7, 'Woodstock Elementary', 'WOD', 'Providence Road', '6016', 'Virginia Beach', 'VA', 23464, 'US', 'Ms. Amy N. Hedrick', '757.648.4200', 'elementary');

-- --------------------------------------------------------

--
-- Table structure for table `lpr_student`
--

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
-- Dumping data for table `lpr_student`
--

INSERT INTO `lpr_student` (`s_id`, `o_id`, `s_fname`, `s_lname`, `s_grade`, `s_gender`, `s_pfname`, `s_plname`, `s_phone`, `s_altphone`, `s_street`, `s_address`, `s_city`, `s_state`, `s_zip`, `s_country`) VALUES
(1, 5, 'Ram', 'Vajrapu', '4', '4', 'Ram', 'Vajrapu', '7578371205', '7578371205', '48th street, 1055w', 'Apt 13', 'Norfolk', 'VA', '23508', 'United States'),
(2, 6, 'Ram', 'Vajrapu', '5', '5', 'RAM', 'VAJRAPU', '7578371205', '7578371205', '48th street, 1055w', 'Apt 13', 'Norfolk', 'VA', '23508', 'United States'),
(3, 7, 'Ram', 'Vajrapu', '5', '5', 'RAM', 'VAJRAPU', '7578371205', '7578371205', '48th street, 1055w', 'Apt 13', 'Norfolk', 'VA', '23508', 'United States'),
(4, 8, 'Ram', 'Vajrapu', '5', '5', 'RAM', 'VAJRAPU', '7578371205', '7578371205', '48th street, 1055w', 'Apt 13', 'Norfolk', 'VA', '23508', 'United States'),
(5, 9, 'Ram', 'Vajrapu', '5', '5', 'RAM', 'VAJRAPU', '7578371205', '7578371205', '48th street, 1055w', 'Apt 13', 'Norfolk', 'VA', '23508', 'United States'),
(6, 10, 'Ram', 'Vajrapu', '5', '5', 'RAM', 'VAJRAPU', '7578371205', '7578371205', '48th street, 1055w', 'Apt 13', 'Norfolk', 'VA', '23508', 'United States'),
(7, 11, 'Ram', 'Vajrapu', '5', '5', 'RAM', 'VAJRAPU', '7578371205', '7578371205', '48th street, 1055w', 'Apt 13', 'Norfolk', 'VA', '23508', 'United States'),
(8, 12, 'Ram', 'Vajrapu', '4', '4', 'Ram', 'Vajrapu', '7578371205', '7578371205', '48th street, 1055w', 'Apt 13', 'Norfolk', 'VA', '23508', 'United States'),
(9, 13, 'RAM', 'VAJRAPU', '4', '4', 'Ram', 'Vajrapu', '7578371205', '7578371205', '1055w,48th street', 'Apartment 13', 'Norfolk', 'Virginia', '23508', 'United States'),
(10, 17, '', '', '', '', '', '', '', '', '', '', '', '', '', 'United States'),
(11, 18, 'Ram', 'Vajrapu', '4', '4', 'Ram', 'Vajrapu', '7578371205', '7578371205', '1055w,48th street', 'Apt 13', 'Norfolk', 'VA', '23508', 'United States'),
(12, 19, 'Ram', 'Vajrapu', '4', '4', 'Ram', 'Vajrapu', '7578371205', '7578371205', '1055w,48th street', 'Apt 13', 'Norfolk', 'VA', '23508', 'United States'),
(13, 19, 'ss', 'ssss', 'sss', 'ssss', 'Ram', 'Vajrapu', '7578371205', '7578371205', '1055w,48th street', 'Apt 13', 'Norfolk', 'VA', '23508', 'United States'),
(14, 20, 'R', 'V', '4', '4', 'Ram', 'Vajrapu', '7578371205', '7578371205', '48th street, 1055w', 'Apt 13', 'Norfolk', 'VA', '23508', 'United States'),
(15, 21, 'Ram', 'Vajrapu', '4', '4', 'Ram', 'Vajrapu', '7578371205', '7578371205', '48th street, 1055w', 'Apt 13', 'Norfolk', 'VA', '23508', 'United States'),
(16, 22, 'Ram', 'Vajrapu', '4', '4', 'Ram', 'Vajrapu', '7578371205', '7578371205', '48th street, 1055w', 'Apt 13', 'Norfolk', 'VA', '23508', 'United States'),
(17, 22, 'rrrr', 'rrr', 'rr', 'rrr', 'Ram', 'Vajrapu', '7578371205', '7578371205', '48th street, 1055w', 'Apt 13', 'Norfolk', 'VA', '23508', 'United States'),
(18, 23, 'Ram', 'Vajrapu', '4', '4', 'Ram', 'Vajrapu', '7578371205', '7578371205', '48th street, 1055w', 'Apt 13', 'Norfolk', 'VA', '23508', 'United States'),
(19, 23, 'ds', 'sd', 'sd', 'sd', 'Ram', 'Vajrapu', '7578371205', '7578371205', '48th street, 1055w', 'Apt 13', 'Norfolk', 'VA', '23508', 'United States'),
(20, 27, 'santhosh', 'kumar', '4', '4', 'santhosh', 'kumar', '+918067247278', '+918067247278', 'ITPL', 'BANGALORE', 'BANGALORE', 'KARNATAKA', '560066', 'India');

-- --------------------------------------------------------

--
-- Table structure for table `lpr_triplog`
--

CREATE TABLE `lpr_triplog` (
  `triplog_o_id` int(11) DEFAULT NULL,
  `triplog_client_id` int(11) DEFAULT NULL,
  `triplog_school_id` int(11) DEFAULT NULL,
  `triplog_driver_id` int(11) DEFAULT NULL,
  `triplog_studentid` int(11) DEFAULT NULL,
  `triplog_tripid` int(11) NOT NULL,
  `triplog_city` varchar(50) DEFAULT NULL,
  `triplog_time` time DEFAULT NULL,
  `triplog_pickloc` varchar(50) DEFAULT NULL,
  `triplog_picktime` time DEFAULT NULL,
  `triplog_droptime` time DEFAULT NULL,
  `triplog_pax` varchar(20) DEFAULT NULL,
  `triplog_status` varchar(20) DEFAULT NULL,
  `triplog_date` date DEFAULT NULL,
  `triplog_clock` varchar(10) DEFAULT NULL,
  `triplog_date_updated` date DEFAULT NULL,
  `triplog_driver_payable` varchar(5) NOT NULL DEFAULT 'TRUE'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lpr_triplog`
--

INSERT INTO `lpr_triplog` (`triplog_o_id`, `triplog_client_id`, `triplog_school_id`, `triplog_driver_id`, `triplog_studentid`, `triplog_tripid`, `triplog_city`, `triplog_time`, `triplog_pickloc`, `triplog_picktime`, `triplog_droptime`, `triplog_pax`, `triplog_status`, `triplog_date`, `triplog_clock`, `triplog_date_updated`, `triplog_driver_payable`) VALUES
(1, 3, 1, 1, 1, 47, '                                                  ', '18:00:00', 'pm drop loc', '18:00:06', '00:00:00', '2', 'Cancel', '2017-06-02', 'AM', NULL, 'TRUE'),
(2, 3, 1, 1, 3, 48, '                                                  ', '19:00:00', 'pmdropploc1', '19:00:00', '00:00:00', '1', 'Cancel', '2017-06-02', 'PM', NULL, 'TRUE'),
(12, 3, 3, 1, 8, 55, 'fdsfsfsdf', '18:00:00', 'adfdf,adsfdsfdsf,fdsfsfsdf', '22:53:06', '00:00:00', '1', '', '2017-06-02', 'AM', NULL, 'TRUE'),
(12, 3, 3, 1, 8, 56, 'fdsfsfsdf', '18:00:00', 'adfdf,adsfdsfdsf,fdsfsfsdf', '22:55:54', '00:00:00', '1', 'success', '2017-06-02', 'PM', NULL, 'TRUE'),
(19, 3, 3, 1, 12, 70, 'fdsfsfsdf', '18:00:00', 'adfdf,adsfdsfdsf,fdsfsfsdf', '03:40:35', '22:37:34', '2', 'noshow', '2017-06-03', 'AM', NULL, 'TRUE'),
(22, 3, 3, 2, 16, 73, 'fdsfsfsdf', '18:00:00', '48th street, 1055w,Apt 13,Norfolk,23508', '04:25:53', '00:00:00', '2', 'success', '2017-06-03', 'PM', NULL, 'TRUE'),
(13, 3, 3, 1, 9, 74, 'fdsfsfsdf', '18:00:00', 'adfdf,adsfdsfdsf,fdsfsfsdf', '23:48:02', '23:47:26', '1', 'cancel', '2017-06-03', 'AM', NULL, 'TRUE'),
(23, 3, 3, 2, 18, 79, 'fdsfsfsdf', '12:00:00', '48th street, 1055w,Apt 13,Norfolk,23508', '12:51:29', '20:06:43', '2', 'success', '2017-06-03', 'PM', NULL, 'TRUE'),
(20, 3, 3, 2, 14, 88, 'fdsfsfsdf', '18:00:00', '4444', '20:07:06', '20:09:34', '1', 'success', '2017-06-03', 'PM', NULL, 'TRUE'),
(23, 3, 3, 2, 18, 94, 'fdsfsfsdf', '12:00:00', '48th street, 1055w,Apt 13,Norfolk,23508', '23:50:07', '23:46:47', '2', 'noshow', '2017-06-03', 'AM', NULL, 'TRUE'),
(18, 3, 3, 1, 11, 95, 'fdsfsfsdf', '18:00:00', 'adfdf,adsfdsfdsf,fdsfsfsdf', '23:47:01', '23:47:05', '1', 'success', '2017-06-03', 'AM', NULL, 'TRUE'),
(21, 3, 3, 2, 15, 96, 'fdsfsfsdf', '18:00:00', '48th street, 1055w,Apt 13,Norfolk,23508', '23:49:11', '23:49:48', '1', 'success', '2017-06-03', 'AM', NULL, 'TRUE'),
(23, 3, 3, 2, 18, 98, 'fdsfsfsdf', '12:00:00', '48th street, 1055w,Apt 13,Norfolk,23508', '18:30:00', '09:00:00', '2', 'success', '2017-06-04', 'AM', NULL, 'TRUE'),
(13, 3, 3, 1, 9, 103, 'fdsfsfsdf', '18:00:00', 'adfdf,adsfdsfdsf,fdsfsfsdf', '18:30:00', '09:00:00', '1', 'success', '2017-06-01', 'AM', '2017-06-04', 'TRUE'),
(13, 3, 3, 1, 9, 104, 'fdsfsfsdf', '18:00:00', 'adfdf,adsfdsfdsf,fdsfsfsdf', '03:02:40', '03:02:34', '1', 'cancel', '2017-06-08', 'AM', '2017-06-04', 'TRUE'),
(13, 3, 3, 2, 9, 105, 'fdsfsfsdf', '18:00:00', 'adfdf,adsfdsfdsf,fdsfsfsdf', '18:30:00', '18:55:00', '1', 'success', '2017-06-09', 'AM', '2017-06-04', 'TRUE'),
(13, 3, 3, 1, 9, 106, 'fdsfsfsdf', '18:00:00', '4444', '11:53:30', '00:00:00', '1', 'noshow', '2017-06-09', 'PM', '2017-06-04', 'TRUE'),
(13, 3, 3, 1, 9, 107, 'Norfolk', '18:00:00', 'adfdf,adsfdsfdsf,fdsfsfsdf', '09:00:00', '09:00:00', '1', 'success', '2017-06-14', 'AM', '2017-06-14', 'TRUE'),
(13, 3, 3, 1, 9, 113, 'Norfolk', '18:00:00', 'adfdf,adsfdsfdsf,fdsfsfsdf', '06:30:00', '18:55:00', '1', 'none', '2017-06-15', 'AM', '2017-06-15', 'TRUE'),
(27, 4, 131, 32, 20, 131, 'Suffolk', '08:00:00', 'ITPL,BANGALORE,BANGALORE,560066', '15:41:30', '15:41:23', '1', 'cancel', '2017-06-21', 'AM', '2017-06-21', 'TRUE'),
(27, 4, 131, 32, 20, 134, 'Suffolk', '08:00:00', 'ITPL,BANGALORE,BANGALORE,560066', '15:56:07', '16:00:00', '1', 'cancel', '2017-06-22', 'AM', '2017-06-22', 'TRUE'),
(23, 3, 3, 2, 18, 135, 'Norfolk', '12:00:00', '48th street, 1055w,Apt 13,Norfolk,23508', '12:39:47', '12:39:48', '2', 'success', '2017-06-05', 'AM', '2017-07-03', 'TRUE'),
(13, 3, 3, 1, 9, 136, 'Norfolk', '17:00:00', 'NEW', '12:39:49', '12:39:50', '1', 'success', '2017-06-05', 'AM', '2017-07-03', 'TRUE');

-- --------------------------------------------------------

--
-- Table structure for table `lpr_zones`
--

CREATE TABLE `lpr_zones` (
  `zone_id` int(11) NOT NULL,
  `zone_loc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lpr_zones`
--

INSERT INTO `lpr_zones` (`zone_id`, `zone_loc`) VALUES
(1, 'Norfolk'),
(2, 'Virginia Beach'),
(3, 'Chesapeake'),
(4, 'Portsmouth'),
(5, 'Hampton'),
(6, 'Suffolk');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lpr_additnltrip`
--
ALTER TABLE `lpr_additnltrip`
  ADD PRIMARY KEY (`ad_tripid`);

--
-- Indexes for table `lpr_billing`
--
ALTER TABLE `lpr_billing`
  ADD KEY `o_id` (`o_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `lpr_cashadvance`
--
ALTER TABLE `lpr_cashadvance`
  ADD PRIMARY KEY (`c_advanceid`);

--
-- Indexes for table `lpr_client`
--
ALTER TABLE `lpr_client`
  ADD PRIMARY KEY (`client_id`),
  ADD KEY `zone_id` (`zone_id`);

--
-- Indexes for table `lpr_dates`
--
ALTER TABLE `lpr_dates`
  ADD PRIMARY KEY (`dates_id`),
  ADD KEY `client_id` (`client_id`);

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
  ADD KEY `driver_id` (`driver_id`),
  ADD KEY `o_reqby` (`o_reqby`);

--
-- Indexes for table `lpr_rates`
--
ALTER TABLE `lpr_rates`
  ADD PRIMARY KEY (`rate_id`),
  ADD KEY `zone_id` (`zone_id`);

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
-- Indexes for table `lpr_triplog`
--
ALTER TABLE `lpr_triplog`
  ADD PRIMARY KEY (`triplog_tripid`),
  ADD KEY `triplog_o_id` (`triplog_o_id`),
  ADD KEY `triplog_client_id` (`triplog_client_id`),
  ADD KEY `triplog_school_id` (`triplog_school_id`),
  ADD KEY `triplog_driver_id` (`triplog_driver_id`),
  ADD KEY `triplog_studentid` (`triplog_studentid`);

--
-- Indexes for table `lpr_zones`
--
ALTER TABLE `lpr_zones`
  ADD PRIMARY KEY (`zone_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lpr_additnltrip`
--
ALTER TABLE `lpr_additnltrip`
  MODIFY `ad_tripid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `lpr_cashadvance`
--
ALTER TABLE `lpr_cashadvance`
  MODIFY `c_advanceid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `lpr_client`
--
ALTER TABLE `lpr_client`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `lpr_dates`
--
ALTER TABLE `lpr_dates`
  MODIFY `dates_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lpr_driver`
--
ALTER TABLE `lpr_driver`
  MODIFY `driver_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;
--
-- AUTO_INCREMENT for table `lpr_order`
--
ALTER TABLE `lpr_order`
  MODIFY `o_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `lpr_rates`
--
ALTER TABLE `lpr_rates`
  MODIFY `rate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `lpr_school`
--
ALTER TABLE `lpr_school`
  MODIFY `school_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=315;
--
-- AUTO_INCREMENT for table `lpr_student`
--
ALTER TABLE `lpr_student`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `lpr_triplog`
--
ALTER TABLE `lpr_triplog`
  MODIFY `triplog_tripid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;
--
-- AUTO_INCREMENT for table `lpr_zones`
--
ALTER TABLE `lpr_zones`
  MODIFY `zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `lpr_dates`
--
ALTER TABLE `lpr_dates`
  ADD CONSTRAINT `lpr_dates_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `lpr_client` (`client_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
