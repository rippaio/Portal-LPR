-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 31, 2017 at 12:01 AM
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

-- --------------------------------------------------------

--
-- Table structure for table `lpr_billing`
--

CREATE TABLE `lpr_billing` (
  `bill_id` int(11) NOT NULL,
  `o_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `share` int(5) NOT NULL,
  `amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lpr_billing`
--

INSERT INTO `lpr_billing` (`bill_id`, `o_id`, `client_id`, `share`, `amount`) VALUES
(42, 14, 1, 0, 91),
(43, 14, 3, 0, 0),
(44, 14, 6, 0, 0),
(46, 16, 9, 0, 42),
(50, 19, 9, 0, 42),
(51, 20, 9, 0, 42),
(53, 21, 9, 0, 42),
(54, 22, 9, 0, 42),
(55, 23, 9, 0, 42),
(56, 24, 9, 0, 42),
(57, 25, 9, 0, 42),
(58, 26, 9, 0, 62),
(59, 27, 9, 0, 42),
(60, 28, 9, 0, 62),
(61, 29, 9, 0, 42),
(63, 30, 9, 0, 42),
(64, 31, 9, 0, 62),
(65, 32, 9, 0, 42),
(67, 33, 9, 0, 42),
(68, 34, 9, 0, 42),
(69, 35, 9, 0, 42),
(71, 36, 9, 0, 42),
(72, 37, 9, 0, 42),
(73, 38, 9, 0, 42),
(75, 39, 9, 0, 107),
(76, 40, 9, 0, 42),
(78, 41, 9, 0, 42),
(79, 42, 9, 0, 62),
(80, 43, 9, 0, 42),
(81, 44, 9, 0, 42),
(82, 45, 9, 0, 42),
(83, 46, 9, 0, 42),
(84, 47, 9, 0, 42),
(86, 48, 9, 0, 42),
(87, 49, 9, 0, 42),
(91, 51, 9, 0, 62),
(92, 52, 9, 0, 42),
(93, 53, 9, 0, 42),
(95, 54, 9, 0, 62),
(96, 55, 9, 0, 42),
(97, 50, 9, 0, 42),
(98, 56, 9, 0, 42),
(99, 57, 9, 0, 42),
(100, 58, 10, 0, 65),
(101, 59, 10, 0, 75),
(104, 61, 3, 0, 0),
(105, 61, 8, 0, 42),
(106, 60, 1, 0, 74),
(107, 60, 5, 0, 0),
(108, 15, 9, 0, 77),
(109, 17, 9, 0, 62),
(110, 18, 9, 0, 42);

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
(52, 92, 10, '2017-08-09', 'debit'),
(53, 92, 5, '2017-08-09', 'credit'),
(54, 92, 5, '2017-08-09', 'credit');

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
  `client_zip` varchar(10) NOT NULL,
  `client_country` varchar(50) NOT NULL,
  `client_contact` varchar(20) NOT NULL,
  `zone_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lpr_client`
--

INSERT INTO `lpr_client` (`client_id`, `client_abr`, `client_name`, `client_street`, `client_address`, `client_city`, `client_state`, `client_zip`, `client_country`, `client_contact`, `zone_id`) VALUES
(1, 'NPS', 'Norfolk Public Schools', 'East City Hall Avenue', '800', 'Norfolk', 'VA', '23510', 'USA', '7571234567', 1),
(2, 'PPS', 'Portsmouth Public Schools', 'Crawford Street', '801', 'Portsmouth', 'VA', '23704', 'USA', '7573937588', 4),
(3, 'CPS', 'Chesapeake Public Schools', 'Cedar Road', '312', 'Chesapeake', 'VA', '23222', 'USA', '', 3),
(4, 'SPS', 'Suffolk City Public Schools', 'North Main Street', '100', 'Suffolk', 'VA', '23434', 'USA', '', 6),
(5, 'HPS', 'Hampton City Schools', 'Franklin Street', 'One', 'Hampton', 'VA', '23669', 'USA', '', 5),
(6, 'NNPS', 'Newport News Public Schools', 'Warwick Boulevard', '12465', 'Newport News', 'VA', '23606', 'USA', '', 7),
(7, 'VBPS', 'Virginia Beach City Public Schools', 'George Mason Drive', '2512', 'Virginia Beach', 'VA', '23456', 'USA', '', 2),
(8, 'NSPE', 'Norfolk Special Education', 'TBD', 'TBD', 'TBD', 'TBD', '0', 'USA', 'TBD', 1),
(9, 'CSPE', 'Chesapeake Special Education', 'TBD', 'TBD', 'TBD', 'TBD', '0', 'USA', 'TBD', 3),
(10, 'PSPE', 'Portsmouth  Special Education', 'TBD', 'TBD', 'TBD', 'TBD', '0', 'USA', 'TBD', 4);

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
  `driver_hiredate` date DEFAULT NULL,
  `driver_termdate` date DEFAULT NULL,
  `driver_carnumber` varchar(20) DEFAULT NULL,
  `driver_status` varchar(11) NOT NULL DEFAULT 'active',
  `comments` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lpr_driver`
--

INSERT INTO `lpr_driver` (`driver_id`, `driver_fname`, `driver_mname`, `driver_lname`, `driver_street`, `driver_address`, `driver_city`, `driver_zip`, `driver_contact_no`, `driver_ssn`, `driver_dl_no`, `driver_dl_state`, `driver_emg_contact`, `driver_commision`, `driver_dname`, `driver_emg_cname`, `driver_emgcontact_relationship`, `driver_state`, `driver_country`, `driver_hiredate`, `driver_termdate`, `driver_carnumber`, `driver_status`, `comments`) VALUES
(1, 'Lyrissa', 'N', 'Anderson', '7758 Ogden Avenue', 'Apt H', 'Norfolk', '23505', '7578313016', '223617155', 'A60509063', 'VA', '', 0.25, '', 'wq', '', 'VA', 'US', '2017-07-12', '2017-08-18', '', 'inactive', ''),
(2, 'Monica', 'A-N', 'Anderson', '952 Lake Village Drive', 'Apt F', 'Chesapeake', '23323', '7573227217', '145782747', '60590975', 'VA', '7573481663', 0.25, 'Monica', 'Azarai', 'Anderson', 'VA', 'US', '0000-00-00', '0000-00-00', '61', 'active', ''),
(3, 'Willette', 'A', 'Anderson', '8839 Mariners Cove', 'Apt C', 'Norfolk', '23503', '7573241001', '228479735', 'T60554163', 'VA', '', 0.25, 'Willitt', 'h', '', 'VA', 'US', '2017-07-07', NULL, '37', 'active', ''),
(4, 'Cornelius', '', 'Allen', '6406 Clare Road', '', 'Norfolk', '23513', '7577171228', '230175881', 'T60583125', 'VA', '7574040047', 0.25, 'Cornelius', 'Russell Allen', 'father', 'VA', 'US', '0000-00-00', '0000-00-00', '54', 'active', ''),
(5, 'Helen', '', 'Barriteau', '405 Dauphin Lane', '', 'Virginia Beach', '23451', '7573553377', '230786552', 'T24618296', 'VA', '7573217241', 0.25, 'Helen', 'Bessie Sweat', 'mother', 'VA', 'US', '0000-00-00', '0000-00-00', '20', 'active', ''),
(6, 'Yvette', 'D', 'Branch', '901 Roseclair Street', '', 'Norfolk', '23523', '7577795100', '23608337', 'T62603056', 'VA', '', 0.25, 'Yvette', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '43', 'active', ''),
(7, 'Kenneth', '', 'Bond', '2844 Middle Town Crescent', '', 'Norfolk', '23504', '7577376007', '', 'T60545530', 'VA', '', 0.25, 'Boyd', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '100', 'active', ''),
(8, 'Shamika', '', 'Benton', '621 Geneva Avenue', 'Apt B', 'Chesapeake', '23323', '7577696541', '228313444', 'T62644277', 'VA', '', 0.25, 'Shamika', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '73', 'active', ''),
(9, 'Avis', 'U', 'Boone-Paul', '516 Timothy Avenue', 'Apt A', 'Norfolk', '23505', '7579443791', '226490128', 'T61560052', 'VA', '', 0.25, '', 'rrr', '', 'VA', 'US', '2017-07-12', '2017-08-18', '', 'inactive', ''),
(10, 'Jay', 'L', 'Barnes', '910 Bainbridge Boulevard', '', 'Norfolk', '23523', '7577357371', '224069762', 'A23828116', 'VA', '', 0.25, 'Jay', '', '', 'VA', 'US', '0000-00-00', '2017-08-18', '30', 'inactive', ''),
(11, 'Antaysha', 'R', 'Barnes', '3901 Krick Street', '', 'Norfolk', '23513', '7577388232', '231791468', 'A60569852', 'VA', '', 0, '', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '', 'active', ''),
(12, 'LaJuana', 'N', 'Brown', '2669 Azalea Garden Road', '', 'Norfolk', '23513', '7573192044', '223251378', 'A60557593', 'VA', '', 0.25, 'Nicky', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '5', 'active', ''),
(13, 'Diane', 'G', 'Barnhill', '1817 Bracey Street', '', 'Norfolk', '23504', '7577768659', '192542770', 'T60554457', 'VA', '', 0.25, 'Diane', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '53', 'active', ''),
(14, 'Lenton', '', 'Barnhill', '1817 Bracey Street', '', 'Norfolk', '23504', '7575508073', '230668413', 'T60554457', 'VA', '', 0.25, '', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '', 'active', ''),
(15, 'Patrice', 'D', 'Bradley', '13 Grady Crescent', '', 'Chesapeake', '23324', '7576067574', '226175906', 'T62635943', 'VA', '', 0.25, 'Patrice', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', 'N100', 'active', ''),
(16, 'Ronnette', 'S', 'Barnes', '952 Wolcott Avenue', '', 'Norfolk', '23513', '7573090602', '224194182', 'T60582347', 'VA', '', 0.25, 'Ronette', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '79', 'active', ''),
(17, 'Katrina', 'L', 'Brown', '1538 Norcova Avenue', '', 'Norfolk', '23502', '7577083903', '229047322', 'T60583388', 'VA', '', 0.25, '', '', '', 'VA', 'US', '0000-00-00', '2017-08-18', '', 'inactive', ''),
(18, 'Tamara', 'N', 'Bennett', '1023 E. Leicester Avenue', '', 'Norfolk', '23503', '7577386515', '225393684', 'T60361787', 'VA', '', 0.25, 'Tamera', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '11', 'active', ''),
(19, 'Cheryl', 'M', 'Boone', '733 Alder Circle', '', 'Virginia Beach', '23462', '7575810481', '226042912', 'T67250067', 'VA', '', 0.25, 'Cherly', '', '', 'VA', 'US', '0000-00-00', '2017-08-18', '62', 'inactive', ''),
(20, 'Tiana', 'K', 'Chapman', '1109 Hillside Avenue', 'Unit D', 'Norfolk', '23503', '7579983414', '229575714', 'A60506574', 'VA', '', 0.25, 'Tiana', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '18', 'active', ''),
(21, 'Barbara', 'A', 'Crandell', '3324 Kansas Avenue', 'Apt A', 'Norfolk', '23513', '7577293983', '225060206', 'E23854728', 'VA', '', 0.25, '', '', '', 'VA', 'US', '0000-00-00', '2017-08-18', '', 'inactive', ''),
(22, 'Janice', 'R', 'Cruz', '1809 Ramsey Road', '', 'Norfolk', '23503', '7572377353', '584668459', 'A60529301', 'VA', '', 0.25, 'Janice', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '56', 'active', ''),
(23, 'Tarnesha', 'M', 'Carlisle', '512 Grantham Road', 'Apt C', 'Norfolk', '23505', '7579980801', '223219420', 'T60569630', 'VA', '', 0.25, '', '', '', 'VA', 'US', '0000-00-00', '2017-08-18', '', 'inactive', ''),
(24, 'Dollie', 'A', 'Cherry', '611 Goff Street', '', 'Norfolk', '23510', '7574072483', '224942499', 'T62698809', 'VA', '', 0.25, 'Dollie', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '95', 'active', ''),
(25, 'Sue', 'E', 'Coward', '1154 Virginia Beach Blvd.', '# 42', 'Virginia Beach', '23451', '7573587041', '167547186', 'A61607915', 'VA', '', 0.25, 'Sue', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '63', 'active', ''),
(26, 'DeSheena', 'M', 'Cobb', '633 Mariners Way', '# F', 'Norfolk', '23503', '7578422038', '217040114', 'T60537955', 'VA', '', 0.25, 'Sheena', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '45', 'active', ''),
(27, 'Ebony', 'K', 'Cornick', '2909 Llewellyn Avenue', '# 2', 'Norfolk', '23504', '7572744258', '226470370', 'A60511709', 'VA', '', 0.25, 'Ebony', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '10', 'active', ''),
(28, 'Monecia', 'L', 'Dennis', '3048 Parkside Drive', '', 'Chesapeake', '23324', '7575811537', '223612498', 'A60535338', 'VA', '', 0.25, 'Monicia', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '38', 'active', ''),
(29, 'Marcia', 'D', 'Douglas', '3413 Stancil Street', '', 'Virginia Beach', '23452', '7579759461', '165648342', 'T67238830', 'VA', '7576960451', 0.25, 'Marcia', 'David Douglas', 'father', 'VA', 'US', '0000-00-00', '0000-00-00', '77', 'active', ''),
(30, 'Courtney', 'B', 'Darden', '51 Ridge Wood Drive', '', 'Hampton', '23666', '7578690732', '223194653', 'A60317229', 'VA', '', 0.25, 'Courtney', '', '', 'VA', 'US', '0000-00-00', '2017-08-18', '93', 'inactive', ''),
(31, 'Janika', 'R', 'Dreweey', '4277 Taylor Road', 'Apt J1', 'Chesapeake', '23321', '7572860829', '225576744', 'T60666711', 'VA', '7573583796', 0.25, 'Janika', 'Sharon Drewery', 'mother', 'VA', 'US', '0000-00-00', '0000-00-00', 'P01', 'active', ''),
(32, 'Lashona', 'D', 'Daughtry', '500 Edwards Street', 'Apt N', 'Portsmouth', '23704', '7576091013', '223115075', 'T60657340', 'VA', '', 0.25, '', '', '', 'VA', 'US', '0000-00-00', '2017-08-18', '', 'inactive', ''),
(33, 'Latoya', 'N', 'Deal', '1536 Nevada Avenue', 'Apt A', 'Norfolk', '23502', '7573535899', '229411855', 'T60587128', 'VA', '', 0.25, 'Deal', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '36', 'active', ''),
(34, 'Kimberly', 'D', 'Daniels', '2917 Fireside Road', '# 4', 'Chesapeake', '23324', '7575895089', '226279760', 'A62120845', 'VA', '', 0.25, 'Kim', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '75', 'active', ''),
(35, 'Iesha', '', 'Davis', '', '', '', '', '', '', '', '', '', 0.25, 'Iesha', '', '', '', 'US', '0000-00-00', '0000-00-00', '68', 'active', ''),
(36, 'Brittany', 'C', 'Driver', '', '', '', '', '7579180799', '229613596', 'A62614113', 'VA', '', 0.25, '', '', '', '', 'US', '0000-00-00', '0000-00-00', '', 'active', ''),
(37, 'Aqueela', '', 'Epps', '', '', '', '', '', '', '', '', '', 0.25, 'Epps', '', '', '', 'US', '0000-00-00', '2017-08-18', '39', 'inactive', ''),
(38, 'Alice', 'A', 'Evans', '374 Fort Worth Avenue', '# 2', 'Norfolk', '23505', '7577378884', '224985702', 'T60546553', 'VA', '', 0.25, 'Alice', '', '', 'VA', 'US', '0000-00-00', '2017-08-18', '7', 'inactive', ''),
(39, 'Cheryl', 'T', 'Freeman', '3907 Pughsville Road', '', 'Suffolk', '23704', '7573723383', '227880594', 'T60616576', 'VA', '7573050712', 0.25, 'Freeman', 'Lindsey Freeman', 'husband', 'VA', 'US', '0000-00-00', '0000-00-00', '28', 'active', ''),
(40, 'Gina', '', 'Forehand', '', '', '', '', '', '', '', '', '', 0.25, 'Gina', '', '', '', 'US', '0000-00-00', '0000-00-00', '88', 'active', ''),
(41, 'Harry', '', 'Forehand', '', '', '', '', '7572846960', '', '', '', '', 0.25, 'Harry F.', '', '', '', 'US', '0000-00-00', '0000-00-00', '49', 'active', ''),
(42, 'Griselda', 'P', 'Crespo-Ferdinand', '1264 Clydesdale Lane', '', 'Virginia Beach', '23464', '7573734128', '225676861', 'A67212404', 'VA', '', 0.25, 'Grace', '', '', 'VA', 'US', '0000-00-00', '2017-08-18', '46', 'inactive', ''),
(43, 'Kiyana', 'N', 'Felton', '415 Chapel Street', '', 'Norfolk', '23504', '7579773840', '181589005', 'A60510476', 'VA', '', 0.25, 'Kiki', '', '', 'VA', 'US', '0000-00-00', '2017-08-18', '91', 'inactive', ''),
(44, 'Judy', 'A', 'Frank', '5384 Roslyn Drive', '', 'Norfolk', '23502', '7578288071', '225848052', 'T62651940', 'VA', '', 0.25, 'Judy', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '85', 'active', ''),
(45, 'Delphine', 'E', 'Farrow', '2726 Westminster Avenue', '', 'Norfolk', '23504', '7576201301', '224986351', '', 'VA', '', 0.25, '', '', '', 'VA', 'US', '0000-00-00', '2017-08-18', '', 'inactive', ''),
(46, 'Cynthia', '', 'Griffin', '103 Ruger Court', '', 'Suffolk', '23434', '7572372289', '216625660', 'T61540431', 'VA', '', 0.25, 'Cynthia', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', 'P03', 'active', ''),
(47, 'Jackee', 'C', 'Garland', '5733 Weblin Drive', '', 'Virginia Beach', '23462', '7573008468', '225631231', 'A67249654', 'VA', '', 0.25, 'Jackee', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '70', 'active', ''),
(48, 'Charnay', 'A', 'Gooden', '1050 Bay Street', '', 'Portsmouth', '23704', '', '96806876', 'A60647267', 'VA', '', 0.25, '', '', '', 'VA', 'US', '0000-00-00', '2017-08-18', '', 'inactive', ''),
(49, 'Coston', '', 'Griffin', '234 Burnetts Way', '', 'Suffolk', '23434', '7576301789', '230742540', 'T62652521', 'VA', '', 0.25, 'Pete', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '3033', 'active', ''),
(50, 'Lella', 'S', 'Golden', '5631 Tidewater Drive', 'Apt 7R', 'Norfolk', '23509', '7579070301', '230666582', 'T62651580', 'VA', '', 0.25, 'Lella', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '96', 'active', ''),
(51, 'Taquiesha', 'G', 'Gray', '1743 Acorn Street', '', 'Chesapeake', '23324', '7572778239', '224317483', 'T62659561', 'VA', '', 0.25, 'Taquisha', '', '', 'VA', 'US', '0000-00-00', '2017-08-18', '57', 'inactive', ''),
(52, 'Tatanisha', 'M', 'Gilliam', '1878 Greenleaf Drive', '', 'Norfolk', '23523', '7579751859', '226270612', 'T60532054', 'VA', '', 0.25, 'Tata', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '59', 'active', ''),
(53, 'Viola', '', 'Harrell', '7424 Fenner Street', 'Apt 12', 'Norfolk', '23505', '7579989368', '577961817', 'A62147199', 'VA', '', 0.25, 'Viola', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '87', 'active', ''),
(54, 'Adeela', '', 'Hopkins', '1241 W. Ocean View Ave.', '# 1', 'Norfolk', '23503', '7573485196', '224573196', 'A60503386', 'VA', '', 0.25, 'Adeela', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '15', 'active', ''),
(55, 'Marketta', '', 'Holloway', '7035 Sewells Point Road', 'Unit G', 'Norfolk', '23513', '7572700018', '223352996', 'T60551830', 'VA', '', 0.25, '', '', '', 'VA', 'US', '0000-00-00', '2017-08-18', '', 'inactive', ''),
(56, 'Ciara', 'C', 'Hamilton', '455 Nicholson Street', '', 'Norfolk', '23510', '7579774761', '223359665', 'T62659822', 'VA', '', 0.25, 'Ciara', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', 'E04', 'active', ''),
(57, 'Malinda', 'D', 'Haley', '3011 Mayon Drive', '', 'Chesapeake', '23325', '7577529156', '223275710', 'B23801596', 'VA', '', 0.25, 'Malinda', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '58', 'active', ''),
(58, 'Carolyn', 'Y', 'Hall', '261 Nicholson Street', '', 'Norfolk', '23510', '7576328629', '231232764', 'T62679548', 'VA', '', 0.25, 'Carolyn', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '90', 'active', ''),
(59, 'Malkia', 'S', 'Johnson', '2706 Broad Street', '', 'Chesapeake', '23324', '7573784666', '78621987', 'T62151240', 'VA', '', 0.25, '', '', '', 'VA', 'US', '0000-00-00', '2017-08-18', '', 'inactive', ''),
(60, 'Melissa', 'L', 'Wilkerson-Jones', '4600 Lind Street', '', 'Norfolk', '23513', '8046688472', '225430316', 'T60514922', 'VA', '', 0.25, 'Melissa', '', '', 'VA', 'US', '0000-00-00', '2017-08-18', 'N200', 'inactive', ''),
(61, 'Tim', 'E', 'Jernigan', '4181 Spruse Knob Road', '', 'Virginia Beach', '23456', '', '224558455', 'T60595044', 'VA', '', 0.25, '', '', '', 'VA', 'US', '0000-00-00', '2017-08-18', '', 'inactive', ''),
(62, 'Keosha', 'S', 'Johnson', '7923 Moose Avenue', '', 'Norfolk', '23518', '7577766941', '226356134', 'T62637048', 'VA', '', 0.25, '', '', '', 'VA', 'US', '0000-00-00', '2017-08-18', '', 'inactive', ''),
(63, 'Bianca', 'C', 'Jackson', '600 Charles Court', '', 'Virginia Beach', '23462', '7577521042', '226115061', 'E23856777', 'VA', '', 0.25, 'Bianca', '', '', 'VA', 'US', '0000-00-00', '2017-08-18', '29', 'inactive', ''),
(64, 'Pamela', 'N', 'Keene', '705 West 36th Street', '', 'Norfolk', '23508', '7573819520', '226293540', 'T60530223', 'VA', '', 0.25, 'Pam', '', '', 'VA', 'US', '0000-00-00', '2017-08-18', '40', 'inactive', ''),
(65, 'Sharon', 'D', 'Knight', '1152 Virginia Beach Blvd', '# 42', 'Virginia Beach', '23451', '', '412157053', 'A61657756', 'VA', '', 0.25, '', '', '', 'VA', 'US', '0000-00-00', '2017-08-18', '', 'inactive', ''),
(66, 'Lasonia', 'K', 'Knight', '6624 Stoney Point Road', '', 'Norfolk', '23502', '7573749356', '223538962', 'T62691256', 'VA', '', 0.25, 'Sonia', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '65', 'active', ''),
(67, 'Tyshawn', '', 'Lawton', '3861 Liberty Ridge Road', '', 'Virginia Beach', '23452', '4058358099', '224675828', 'W083879565', 'OK', '', 0.25, 'Tyshawn', '', '', 'VA', 'US', '0000-00-00', '2017-08-18', '89', 'inactive', ''),
(68, 'Akira', 'S', 'Leonard', '744 A Avenue', 'Apt 2', 'Norfolk', '23504', '7063514282', '223619487', 'A6050633', 'VA', '', 0.25, 'Akira', '', '', 'VA', 'US', '0000-00-00', '2017-08-18', '52', 'inactive', ''),
(69, 'Christian', '', 'Lichliter', '', '', '', '', '', '', '', '', '', 0.25, 'Shane', '', '', '', 'US', '0000-00-00', '0000-00-00', '01', 'active', ''),
(70, 'Vonetta', 'M', 'Manyweather', '3860 Nansemond Circle', 'Apt 1', 'Norfolk', '23513', '7572892490', '223150710', 'T60591927', 'VA', '', 0.25, 'Vonetta', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '201', 'active', ''),
(71, 'Lavinia', 'D', 'Mackey', '1001 7th Street', 'Apt D', 'Portsmouth', '23704', '7572303265', '223114573', 'T60614955', 'VA', '', 0.25, 'Lavinia', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '60', 'active', ''),
(72, 'Rita', 'D', 'Moore', '1921 Robert Hall Blvd', '# 3309', 'Chesapeake', '23324', '7577754140', '230080067', 'T62634576', 'VA', '7575137031', 0.25, 'Rita', 'Monae Cuffee', 'daughter', 'VA', 'US', '0000-00-00', '0000-00-00', '55', 'active', ''),
(73, 'Tenesha', 'F', 'Land-Mitchell', '9639 11th View Street', '# 7', 'Norfolk', '23503', '7575155369', '223275397', 'T60512220', 'VA', '7572305869', 0.25, 'Tinisha', 'Carolyn Leland', 'mother', 'VA', 'US', '0000-00-00', '2017-08-18', '41', 'inactive', ''),
(74, 'Cynthia', 'M', 'Moyler', '1112 Sword Drive', '', 'Chesapeake', '23323', '', '225747474', 'T62118989', 'VA', '', 0.25, '', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '', 'active', ''),
(75, 'Marquita', 'C', 'Mason', '1330 MacDonald Road', 'Apt E', 'Chesapeake', '23325', '', '227658832', 'A62642756', 'VA', '', 0.25, '', '', '', 'VA', 'US', '0000-00-00', '2017-08-18', '', 'inactive', ''),
(76, 'Mary', 'W', 'Medley', '6508 Harvey Court', '', 'Norfolk', '23513', '7572306655', '230685065', 'T60515035', 'VA', '', 0.25, 'Mary', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '6', 'active', ''),
(77, 'Diane', 'P', 'Outland', '1406 Newby Road', '', 'Portsmouth', '23701', '7577547347', '231984176', 'T60610332', 'VA', '', 0.25, 'Outland', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '44', 'active', ''),
(78, 'Russell', 'W', 'Owens', '834 Bancker Road', '', 'Norfolk', '23518', '7578376416', '105765578', '989295794', 'NY', '7577386515', 0.25, 'Russell', 'Tamara Bennett', 'daughter', 'VA', 'US', '0000-00-00', '0000-00-00', '21', 'active', ''),
(79, 'Neshaminy', 'T', 'Perry', '849 Rugby Street', '', 'Norfolk', '23504', '7573431389', '147688916', 'A60551729', 'VA', '', 0.25, 'Nicole', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '94', 'active', ''),
(80, 'LeDiea', 'L', 'Payton', '418 Park Avenue', 'Apt B', 'Norfolk', '23504', '7579985263', '228436398', 'T60506863', 'VA', '', 0.25, '', '', '', 'VA', 'US', '0000-00-00', '2017-08-18', '', 'inactive', ''),
(81, 'Brian', 'D', 'Russell', '2371 N. Windsong Court', '# 101', 'Virginia Beach', '23455', '8609491593', '560351711', 'B67221684', 'VA', '', 0.25, 'Brian', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '24', 'active', ''),
(82, 'Janee', 'T', 'Reed', '1118 Virginia Avenue', 'Apt D', 'Portsmouth', '23707', '7573596850', '224177311', 'T60669188', 'VA', '', 0.25, 'Janee', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '4', 'active', ''),
(83, 'Lee', '', 'Rempas', '', '', '', '', '', '', '', '', '', 0.25, 'Lee', '', '', '', 'US', '0000-00-00', '0000-00-00', '20', 'active', ''),
(84, 'Harry', 'A', 'Robertson', '5168 Stratford Chase Drive', '', 'Virginia Beach', '23464', '7576960016', '229132886', 'T62607487', 'VA', '', 0.25, 'Harry R', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '33', 'active', ''),
(85, 'Shawnta', 'M', 'Ross', '601 Seventh Street', 'Apt F', 'Portsmouth', '23704', '7577768679', '223377627', 'T62627778', 'VA', '', 0.25, '', '', '', 'VA', 'US', '0000-00-00', '2017-08-18', '', 'inactive', ''),
(86, 'Patrice', 'A', 'Reed', '1945 E. Ocean View Avenue', '# 2', 'Norfolk', '23503', '7579985622', '17506627', 'A24634742', 'VA', '', 0.25, 'Reed', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '48', 'active', ''),
(87, 'Cynthia', 'I', 'Ruffin', '4604 Brantingham Drive', '', 'Virginia Beach', '23464', '5614202586', '767071703', 'A60583075', 'VA', '', 0.25, 'Ruffin', '', '', 'VA', 'US', '0000-00-00', '2017-08-18', '47', 'inactive', ''),
(88, 'Meisha', 'D', 'Roberts', '3738 Deep Creek Blvd', '', 'Portsmouth', '23702', '7576106373', '226191883', 'T60642532', 'VA', '', 0.25, 'Miesha', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '74', 'active', ''),
(89, 'Lloyd', '', 'Sanderson', '', '', '', '', '', '', '', '', '', 0.25, 'Juni', '', '', '', 'US', '0000-00-00', '2017-08-18', '398', 'inactive', ''),
(90, 'Patrice', 'D', 'Stewart', '1344 Picadilly Street', 'Apt B', 'Norfolk', '23513', '7577380728', '227089013', 'T62687260', 'VA', '', 0.25, '', '', '', 'VA', 'US', '0000-00-00', '2017-08-18', '', 'inactive', ''),
(91, 'Christine', 'D', 'Snipes', '709 River Creek Road', '', 'Chesapeake', '23320', '7575601052', '231199303', 'T62137850', 'VA', '', 0.25, 'Christine', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '16', 'active', ''),
(92, 'Lamesha', 'L', 'Selby', '1816 Greenleaf Drive', '', 'Norfolk', '23523', '7573246157', '228235968', 'T60515292', 'VA', '', 0.25, 'Lamisha', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '50', 'active', ''),
(93, 'Jeanette', 'R', 'Spencer', '5512 Bayberry Drive', '', 'Norfolk', '23502', '7574502056', '228803696', 'T62615489', 'VA', '', 0.25, '', '', '', 'VA', 'US', '0000-00-00', '2017-08-18', '', 'inactive', ''),
(94, 'Shakina', 'S', 'Saunders', '920 Tifton Street', '', 'Norfolk', '23513', '7573091535', '224315200', 'T60536220', 'VA', '', 0.25, 'Shakina', '', '', 'VA', 'US', '0000-00-00', '2017-08-18', '72', 'inactive', ''),
(95, 'Arnold', '', 'Smith', '', '', '', '', '', '', '', '', '', 0.25, 'Arnold', '', '', '', 'US', '0000-00-00', '0000-00-00', '051', 'active', ''),
(96, 'Kim', 'M', 'Smith', '7424 Fenner Street', 'Apt 20', 'Norfolk', '23505', '7575817164', '228293656', 'T60544384', 'VA', '', 0.25, 'Smith', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '71', 'active', ''),
(97, 'Darrin', 'L', 'Thomas', '3214 Lens Avenue', '', 'Norfolk', '23509', '7574056289', '227171032', 'T60644119', 'VA', '', 0.25, 'Darren', '', '', 'VA', 'US', '0000-00-00', '2017-08-18', '32', 'inactive', ''),
(98, 'Aimee', 'R', 'Taylor', '1424 McNeal Avenue', '', 'Norfolk', '23502', '7577905584', '002847001', 'T67288271', 'VA', '', 0.25, 'Aimee', '', '', 'VA', 'US', '0000-00-00', '2017-08-18', '26', 'inactive', ''),
(99, 'Monique', '', 'Taylor', '', '', '', '', '', '', '', '', '', 0.25, 'Momo', '', '', '', 'US', '0000-00-00', '0000-00-00', '19', 'active', ''),
(100, 'Jack', 'V', 'Tambreza', '1280 Pall Mall Avenue', '', 'Norfolk', '23513', '7575672961', '', '', 'VA', '', 0.25, 'Jack', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '23', 'active', ''),
(101, 'Tonia', 'T', 'Thompson', '1513 Halter Drive', 'Unit A', 'Virginia Beach', '23464', '8563921357', '150626952', 'B67234218', 'VA', '', 0.25, '', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '', 'active', ''),
(102, 'Roderick', '', 'Wallace', '', '', '', '', '', '', '', '', '', 0.25, 'Rodrick', '', '', '', 'US', '0000-00-00', '0000-00-00', '64', 'active', ''),
(103, 'Gail', 'D', 'Williams', '1050 Bay Street', '', 'Portsmouth', '23704', '8568349935', '099521152', 'A60647268', 'VA', '', 0.25, 'Gail', '', '', 'VA', 'US', '0000-00-00', '2017-08-18', '03', 'inactive', ''),
(104, 'Sherry', 'A', 'Wilson', '3033 Fireside Road', '', 'Chesapeake', '23324', '7573392882', '230040375', 'A62103700', 'VA', '7576638427', 0.25, 'Sherry', 'Mary Wilson', '', 'VA', 'US', '0000-00-00', '2017-08-18', 'E02', 'inactive', ''),
(105, 'Bianca', 'D', 'Wiggins', '3224 Kimball Terrace', '', 'Norfolk', '23504', '7577389386', '230574687', 'T61541876', 'VA', '7572850417', 0.25, 'Wiggins', 'Catina Poole', 'mother', 'VA', 'US', '0000-00-00', '2017-08-18', '25', 'inactive', ''),
(106, 'Crystal', 'D', 'White', '212 W. 24th Street', 'Apt 102', 'Norfolk', '23508', '7579775877', '249793865', 'A60515896', 'VA', '', 0.25, 'Crystal', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '67', 'active', ''),
(107, 'Hermione', 'C', 'Wilson', '33 Holly Hill Lane', '', 'Portsmouth', '23702', '7573547752', '223765151', 'T62165559', 'VA', '', 0.25, 'Hermi', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '76', 'active', ''),
(108, 'Shanice', 'N', 'Ward', '519 Tidewater Drive', '', 'Norfolk', '23504', '7573862137', '043825318', 'T60552998', 'VA', '', 0.25, 'Shanice', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '42', 'active', ''),
(109, 'Sandra', 'L', 'Woodard', '500 Bunche Blvd', '', 'Portsmouth', '23701', '7573394843', '239726013', 'A23894398', 'VA', '', 0.25, 'Sandra', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '82', 'active', ''),
(110, 'Barry', 'A', 'Woodard', '500 Bunche Blvd', '', 'Portsmouth', '23701', '7573394843', '231823445', 'T60644958', 'VA', '', 0.25, 'Barry', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '82', 'active', ''),
(111, 'Tylesha', 'G', 'Wright', '7031 Sewells Point Road', 'Apt F', 'Norfolk', '23513', '7579201167', '227510455', 'A60544000', 'VA', '', 0.25, 'Tylisha', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '81', 'active', ''),
(112, 'Alice', 'M', 'Wiggins', '986 Widgeon Road', '', 'Norfolk', '23513', '7577359594', '226135546', 'T60580536', 'VA', '', 0.25, 'Mae', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '86', 'active', ''),
(113, 'Lisa', 'D', 'Wright', '300 Cobb Island Court', '', 'Chesapeake', '23322', '7573711055', '223945021', 'T60544987', 'VA', '', 0.25, 'Denise', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '22', 'active', ''),
(114, 'q', 'q', 'q', 'q', 'q', 'a', 'a', 'q', '8', 'q', 'q', 'qq', 8, 'qq', 'q', 'qq', 'a', 'a', '2017-07-01', '2017-07-31', 'qq', 'active', 'a');

-- --------------------------------------------------------

--
-- Table structure for table `lpr_invoice`
--

CREATE TABLE `lpr_invoice` (
  `invoice_id` int(11) NOT NULL,
  `invoice_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lpr_invoice`
--

INSERT INTO `lpr_invoice` (`invoice_id`, `invoice_date`) VALUES
(530, '2017-08-08'),
(531, '2017-08-08'),
(532, '2017-08-08'),
(533, '2017-08-08'),
(534, '2017-08-08'),
(535, '2017-08-08'),
(536, '2017-08-08'),
(537, '2017-08-09');

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
  `o_cs` varchar(10) NOT NULL DEFAULT 'FALSE',
  `o_bs` varchar(10) NOT NULL DEFAULT 'FALSE',
  `driver_id` int(10) DEFAULT NULL,
  `o_icomment` varchar(100) NOT NULL,
  `o_dcomment` varchar(100) NOT NULL,
  `o_billable` float NOT NULL,
  `o_reqby` int(11) NOT NULL,
  `o_payable` float NOT NULL,
  `o_tip` float NOT NULL,
  `ra_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lpr_order`
--

INSERT INTO `lpr_order` (`o_id`, `client_id`, `school_id`, `o_startdate`, `o_enddate`, `o_status`, `o_ampickloc`, `o_ampicktime`, `o_amdroploc`, `o_amdroptime`, `o_pmpickloc`, `o_pmdroploc`, `o_pmpicktime`, `o_days`, `o_fd`, `o_ra`, `o_wc`, `o_as`, `o_cs`, `o_bs`, `driver_id`, `o_icomment`, `o_dcomment`, `o_billable`, `o_reqby`, `o_payable`, `o_tip`, `ra_id`) VALUES
(14, 6, 436, '2017-06-26', '2017-08-24', 'active', '2201 Cobblestone Court  Chesapeake  ', '08:10:00', '766 J. Clyde Morris Blvd.  Newport News', '09:00:00', '766 J. Clyde Morris Blvd.  Newport News', '2201 Cobblestone Court  Chesapeake  ', '14:00:00', 'Monday,Tuesday,Wednesday,Thursday', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 92, '', '', 91, 1, 66, 6, NULL),
(15, 3, 207, '2017-09-05', '2018-06-14', 'active', '3728 Cannon Point Drive 4617 Old Fox Trail  Chesapeake ', '07:50:00', '1955 Deal Drive Chesapeake', '08:25:00', '1955 Deal Drive Chesapeake', '3728 Cannon Point Drive/4617 Old Fox Trail  Chesapeake ', '15:20:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'FALSE', 'TRUE', 'FALSE', 'TRUE', 'FALSE', 'FALSE', NULL, '', '', 77, 9, 45, 3, NULL),
(16, 3, 441, '2017-09-06', '2019-06-19', 'active', ' 332 Redbrick Drive Chesapeake, Va. 23321', '08:05:00', '4500 Peek Trail  Chesapeake ', '08:30:00', '4500 Peek Trail  Chesapeake ', '332 Redbrick Drive  Chesapeake 23321', '14:45:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', NULL, '', '*Student must be given to caregiver upon arrival to school or home*', 42, 9, 35, 3, NULL),
(17, 3, 438, '2017-09-05', '2018-06-14', 'active', '3213 Hemlock Drive  Chesapeake 23321', '06:55:00', '369 Battlefield Blvd. S  Chesapeake', '07:55:00', '369 Battlefield Blvd. S  Chesapeake', '3213 Hemlock Drive  Chesapeake 23321', '14:01:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'FALSE', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', NULL, '', '', 62, 9, 35, 3, NULL),
(18, 3, 187, '2017-09-05', '2018-06-14', 'active', '801 Warbler Court  813 Warbler Court Chesapeake ', '06:50:00', '1605 Cedar Road  Chesapeake', '07:30:00', '1605 Cedar Road Chesapeake', '801 Warbler Court  813 Warbler Court Chesapeake ', '14:19:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'FALSE', 'FALSE', NULL, '', '', 42, 9, 35, 3, NULL),
(19, 3, 209, '2017-09-05', '2018-06-14', 'active', '804 Thorngate Court  Chesapeake ', '08:10:00', '301 West Hanbury Road Chesapeake', '08:30:00', '301 West Hanbury Road Chesapeake', '804 Thorngate Court  Chesapeake ', '15:38:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', NULL, '', '*Student must be given to caregiver upon arrival at school - may be dropped of in the PM without a c', 42, 9, 35, 3, NULL),
(20, 3, 215, '2017-09-05', '2018-06-14', 'active', '2123 Rock Creek Drive  Chesapeake ', '08:15:00', '1997 Horseback Run Chesapeake', '08:35:00', '1997 Horseback Run Chesapeake', '2123 Rock Creek Drive  Chesapeake ', '15:25:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', NULL, '', '*Student must be given to caregiver upon arrival to school or home*', 42, 9, 35, 3, NULL),
(21, 3, 438, '2017-09-05', '2018-06-14', 'active', '617 Margaret Drive  Chesapeake ', '07:30:00', '369 Battlefield Blvd. S  Chesapeake', '07:55:00', '369 Battlefield Blvd. S  Chesapeake', 'NULL', '18:00:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', NULL, '', '*Student must be given to caregiver upon arrival to school*', 42, 9, 35, 3, NULL),
(22, 3, 438, '2017-09-05', '2018-06-14', 'active', '816 Shetland Drive  Chesapeake ', '07:30:00', '369 Battlefield Blvd. S  Chesapeake', '07:55:00', '369 Battlefield Blvd. S  Chesapeake', '816 Shetland Drive  Chesapeake ', '14:01:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 7, '', '*Student must be given to caregiver upon arrival to school - may be dropped off in the PM without a ', 42, 9, 35, 3, NULL),
(23, 3, 187, '2017-09-05', '2018-06-14', 'active', '400 Slate Street  Chesapeake ', '07:05:00', '1605 Cedar Road Chesapeake', '07:30:00', '1605 Cedar Road Chesapeake', '400 Slate Street  Chesapeake ', '14:25:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', NULL, '', '*Student must be given to caregiver upon arrival to school or home*', 42, 9, 35, 3, NULL),
(24, 3, 207, '2017-09-05', '2018-06-14', 'active', '4115 Leyte Avenue  Chesapeake ', '08:05:00', '1955 Deal Drive  Chesapeake', '08:25:00', '1955 Deal Drive Chesapeake', '4115 Leyte Avenue  Chesapeake ', '15:20:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', NULL, '', '*Student must be given to caregiver upon arrival to school or home*', 42, 9, 35, 3, NULL),
(25, 3, 187, '2017-09-05', '2018-06-14', 'active', '2605 Carolina Road   Chesapeake ', '06:50:00', '1605 Cedar Road Chesapeake', '07:30:00', '1605 Cedar Road Chesapeake', '2605 Carolina Road   Chesapeake ', '14:19:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', NULL, '', '*Student must be given to caregiver upon arrival to school or home*', 42, 9, 35, 3, NULL),
(26, 3, 438, '2017-09-05', '2018-06-14', 'active', '1453 Perry Street Apt. B  Chesapeake ', '07:30:00', '369 Battlefield Blvd. S  Chesapeake', '07:55:00', '369 Battlefield Blvd. S  Chesapeake', '1453 Perry Street Apt. B  Chesapeake ', '14:01:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'FALSE', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', NULL, '*male ride along*', '*Student must be given to caregiver upon arrival to school or home* ***DO NOT HAVE FOOD SHOWING DURI', 62, 9, 35, 3, NULL),
(27, 3, 215, '2017-09-05', '2018-06-14', 'active', '1805 Shell Drake Court  Chesapeake ', '08:15:00', '1997 Horseback Run Chesapeake', '08:35:00', '1997 Horseback Run Chesapeake', '1805 Shell Drake Court  Chesapeake ', '15:28:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', NULL, '', '*Student must be given to caregiver upon arrival to school or home*', 42, 9, 35, 3, NULL),
(28, 3, 215, '2017-09-05', '2018-06-14', 'active', '1903 Heathway Trail  Chesapeake ', '08:10:00', '1997 Horseback Run Chesapeake', '08:35:00', '1997 Horseback Run Chesapeake', '1903 Heathway Trail  Chesapeake ', '15:28:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'FALSE', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 110, '', '*Student must be given to caregiver upon arrival to school or home* *Student will pick at his nose u', 62, 9, 35, 3, NULL),
(29, 3, 207, '2017-09-05', '2018-06-14', 'active', '2404 Chesapeake Avenue  Chesapeake ', '08:05:00', '1955 Deal Drive Chesapeake', '08:25:00', '1955 Deal Drive Chesapeake', '2404 Chesapeake Avenue  Chesapeake ', '15:20:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', NULL, '', '*Student must be given to caregiver upon arrival to school or home*', 42, 9, 35, 3, NULL),
(30, 3, 207, '2017-09-05', '2018-06-14', 'active', '1323 Decatur Street, Unit 1  Chesapeake ', '08:05:00', '1955 Deal Drive  Chesapeake', '08:25:00', '1955 Deal Drive  Chesapeake', '1323 Decatur Street, Unit 1  Chesapeake ', '15:20:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', NULL, '', '*Student must be given to caregiver upon arrival to school or home*', 42, 9, 35, 3, NULL),
(31, 3, 438, '2017-09-05', '2018-06-14', 'active', 'NULL', '08:00:00', '369 Battlefield Blvd. S  Chesapeake', '16:00:00', '369 Battlefield Blvd. S  Chesapeake', '1205 Anne Avenue  Chesapeake ', '14:01:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'FALSE', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', NULL, '', '', 62, 9, 35, 3, NULL),
(32, 3, 441, '2017-09-06', '2018-06-19', 'active', '1939 Martin Avenue  Chesapeake ', '08:00:00', '4500 Peek Trail  Chesapeake ', '08:30:00', '4500 Peek Trail  Chesapeake ', '1939 Martin Avenue  Chesapeake ', '14:45:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', NULL, '', '*Student must be given to caregiver upon arrival to school or home*', 42, 9, 35, 3, NULL),
(33, 3, 208, '2017-09-05', '2018-06-14', 'active', '820 Hummingbird Street  Chesapeake ', '08:00:00', '2007 Grizzly Trail Chesapeake', '08:30:00', '2007 Grizzly Trail Chesapeake', '820 Hummingbird Street  Chesapeake ', '15:38:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', NULL, '', '*Student must be given to caregiver upon arrival at school - can be dropped off in the PM without a ', 42, 9, 35, 3, NULL),
(34, 3, 208, '2017-09-05', '2018-06-14', 'active', '1217 Marge Drive  Chesapeake  ', '08:15:00', '2007 Grizzly Trail Chesapeake', '08:30:00', '2007 Grizzly Trail Chesapeake', '1217 Marge Drive  Chesapeake  ', '15:38:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', NULL, '', '*Student must be given to caregiver upon arrival to school or home*', 42, 9, 35, 3, NULL),
(35, 3, 208, '2017-09-05', '2018-06-14', 'active', '629 Trumpet Court  Chesapeake ', '08:20:00', '2007 Grizzly Trail Chesapeake', '08:30:00', '2007 Grizzly Trail Chesapeake', '629 Trumpet Court  Chesapeake ', '15:38:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', NULL, '', '*Student must be given to caregiver upon arrival to school and in the PM may be dropped off without ', 42, 9, 35, 3, NULL),
(36, 3, 442, '2017-09-05', '2018-06-14', 'active', '1418 Sabbath Lane  Chesapeake ', '08:15:00', '1016 Greenbrier Parkway  Chesapeake', '08:30:00', '1016 Greenbrier Parkway  Chesapeake', '1418 Sabbath Lane  Chesapeake ', '15:23:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', NULL, '', '', 42, 9, 35, 3, NULL),
(37, 3, 442, '2017-09-05', '2018-06-14', 'active', '508 Aylesbury Drive  Chesapeake ', '08:10:00', '1016 Greenbrier Parkway  Chesapeake', '08:30:00', '1016 Greenbrier Parkway  Chesapeake', '508 Aylesbury Drive  Chesapeake ', '15:23:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', NULL, '', '*Student must be given to caregiver upon arrival to school or home*', 42, 9, 35, 3, NULL),
(38, 3, 442, '2017-09-05', '2018-06-14', 'active', '125 Hall Drive  Chesapeake ', '08:15:00', '1016 Greenbrier Parkway  Chesapeake', '08:30:00', '1016 Greenbrier Parkway  Chesapeake', '125 Hall Drive  Chesapeake ', '15:23:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', NULL, '', '*Student must be given to caregiver upon arrival to school or home*', 42, 9, 35, 3, NULL),
(39, 6, 439, '2017-09-05', '2018-06-14', 'active', '5573 Old Providence Road   Virginia Beach ', '08:10:00', '766 J. Clyde Morris Blvd.  Newport News', '08:55:00', '766 J. Clyde Morris Blvd.  Newport News', '824 Hanover Drive  Virginia Beach ', '15:30:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'FALSE', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', NULL, '', '*Student must be given to caregiver upon arrival to school or home*', 107, 9, 66, 6, NULL),
(40, 9, 197, '2017-09-05', '2018-06-14', 'active', '340 Sweetbay Drive  Chesapeake ', '07:10:00', '1551 Eden Way, South Chesapeake', '07:30:00', '1551 Eden Way, South Chesapeake', '340 Sweetbay Drive  Chesapeake ', '14:14:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'FALSE', NULL, '', '*Student must be given to caregiver upon arrival to school or home*', 42, 9, 35, 3, NULL),
(41, 9, 388, '2017-09-05', '2018-06-14', 'active', '613 Saddlehorn Drive  Chesapeake ', '07:05:00', '1853 Battlefield Blvd  Chesapeake', '07:30:00', '1853 Battlefield Blvd  Chesapeake', '613 Saddlehorn Drive  Chesapeake ', '14:25:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', NULL, '', '*Student must be given to caregiver upon arrival to school or home*', 42, 9, 35, 3, NULL),
(42, 9, 408, '2017-09-05', '2018-06-14', 'active', '936 Cogliandro Drive  Chesapeake ', '07:45:00', '1605 Sparrow Road Chesapeake', '08:10:00', '1605 Sparrow Road Chesapeake', '936 Cogliandro Drive  Chesapeake ', '14:50:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'FALSE', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', NULL, '', '*Student must be given to caregiver upon arrival to school or home*', 62, 9, 35, 3, NULL),
(43, 9, 408, '2017-09-05', '2018-06-14', 'active', '3100 Walden Street  Chesapeake ', '07:55:00', '1605 Sparrow Road Chesapeake', '08:10:00', '1605 Sparrow Road Chesapeake', '3100 Walden Street  Chesapeake ', '14:50:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', NULL, '', '*Student must be given to caregiver upon arrival to school or home*', 42, 9, 35, 3, NULL),
(44, 9, 408, '2017-09-05', '2018-06-14', 'active', '4010 Brookland Drive, Apt. M  Chesapeake ', '07:55:00', '1605 Sparrow Road Chesapeake', '08:10:00', '1605 Sparrow Road Chesapeake', '4010 Brookland Drive, Apt. M  Chesapeake ', '14:50:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'FALSE', NULL, '', '*Student must be given to caregiver upon arrival to school or home* *Climate control must be used in', 42, 9, 35, 3, NULL),
(45, 9, 407, '2017-09-05', '2018-06-14', 'active', '625 River Creek Road Chesapeake', '07:40:00', '2500 Rodgers Street  Chesapeake', '07:55:00', '2500 Rodgers Street  Chesapeake', '652 River Creek Road  Chesapeake ', '14:53:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', NULL, '', '*Student must be given to caregiver upon arrival to school or home*', 42, 9, 35, 3, NULL),
(46, 9, 407, '2017-09-05', '2018-06-14', 'active', '200 Outlaw Street  Chesapeake ', '07:40:00', '2500 Rodgers Street  Chesapeake', '07:55:00', '2500 Rodgers Street  Chesapeake', '200 Outlaw Street  Chesapeake ', '14:53:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', NULL, '', '*Student must be given to caregiver upon arrival to school or home*', 42, 9, 35, 3, NULL),
(47, 9, 385, '2017-09-05', '2018-06-14', 'active', '1411 20th Street  Chesapeake ', '07:15:00', '1115 Myrtle Avenue Chesapeake', '07:30:00', '1115 Myrtle Avenue Chesapeake', '1411 20th Street  Chesapeake ', '14:09:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', NULL, '', '', 42, 9, 35, 3, NULL),
(48, 9, 401, '2017-09-05', '2018-06-14', 'active', '3613 Douglas Road  Chesapeake ', '08:10:00', '1997 Hawk Blvd Chesapeake', '08:30:00', '1997 Hawk Blvd Chesapeake', '3613 Douglas Road  Chesapeake ', '15:38:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', NULL, '', '*Student must be given to caregiver upon arrival to school or home*', 42, 9, 35, 3, NULL),
(49, 9, 400, '2017-09-05', '2018-06-14', 'active', '1004 Shelley Street, Apt. 1  Chesapeake ', '08:10:00', '1996 Hawk Blvd Chesapeake', '08:25:00', '1996 Hawk Blvd Chesapeake', '1004 Shelley Street, Apt. 1  Chesapeake ', '15:40:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', NULL, '', '*Student must be given to caregiver upon arrival to school or home*', 42, 9, 35, 3, NULL),
(50, 9, 390, '2017-09-05', '2018-06-14', 'active', '608 Blackthorne Drive  Chesapeake ', '08:00:00', '605 Providence Road Chesapeake', '16:00:00', '605 Providence Road Chesapeake', '608 Blackthorne Drive  Chesapeake ', '15:08:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', NULL, '', '', 42, 9, 35, 3, NULL),
(51, 9, 380, '2017-09-05', '2018-06-14', 'active', '2518 Applewood Lane  Chesapeake ', '07:10:00', '2248 Averill Drive Chesapeake', '07:35:00', '2248 Averill Drive Chesapeake', '2518 Applewood Lane  Chesapeake ', '14:15:00', 'Monday,Tuesday,Wednesday,Thursday', 'TRUE', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', NULL, '', '*Student must be given to caregiver upon arrival to school or home* *Climate control must be used in', 62, 9, 35, 3, NULL),
(52, 9, 380, '2017-09-05', '2018-06-14', 'active', '825 Chapel Hill Drive  Chesapeake ', '07:05:00', '2248 Averill Drive Chesapeake', '07:35:00', '2248 Averill Drive Chesapeake', '825 Chapel Hill Drive  Chesapeake ', '14:15:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', NULL, '', '*Student must be given to caregiver upon arrival to school or home*', 42, 9, 35, 3, NULL),
(53, 9, 380, '2017-09-05', '2018-06-14', 'active', '693 George Washington Hwy., South  Chesapeake ', '07:20:00', '2248 Averill Drive Chesapeake', '07:35:00', '2248 Averill Drive Chesapeake', 'NULL', '14:00:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'FALSE', NULL, '', '*Student must be given to caregiver upon arrival to school or home*', 42, 9, 35, 3, NULL),
(54, 9, 380, '2017-09-05', '2018-06-14', 'active', '2014 Willow Point Arch  Chesapeake ', '07:10:00', '2248 Averill Drive Chesapeake', '07:35:00', '2248 Averill Drive Chesapeake', '2014 Willow Point Arch  Chesapeake ', '14:15:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'FALSE', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', NULL, '', '', 62, 9, 35, 3, NULL),
(55, 9, 380, '2017-09-05', '2018-06-14', 'active', '3405 Maori Drive  Chesapeake ', '07:00:00', '2248 Averill Drive Chesapeake', '07:35:00', '2248 Averill Drive Chesapeake', '3405 Maori Drive  Chesapeake ', '14:15:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', NULL, '', '*Student must be given to caregiver upon arrival to school or home*', 42, 9, 35, 3, NULL),
(56, 9, 380, '2017-09-05', '2018-06-14', 'active', '209 Bald Eagle Way, Apt. 101  Chesapeake ', '07:05:00', '2248 Averill Drive Chesapeake', '07:35:00', '2248 Averill Drive Chesapeake', '209 Bald Eagle Way, Apt. 101  Chesapeake ', '14:15:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', NULL, '', '*Student must be given to caregiver upon arrival to school or home*', 42, 9, 35, 3, NULL),
(57, 9, 380, '2017-09-05', '2018-06-14', 'active', '305 Lambardi Court  Chesapeake ', '00:00:00', '2248 Averill Drive Chesapeake', '07:35:00', '2248 Averill Drive Chesapeake', '305 Lambardi Court  Chesapeake ', '14:15:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', NULL, '', '*Student must be given to caregiver upon arrival to school or home*', 42, 9, 35, 3, NULL),
(58, 7, 437, '2017-09-05', '2018-06-15', 'active', '3803 Springbloom Drive  Portsmouth 23701', '08:05:00', '5163 Cleveland Street   Virginia Beach', '08:45:00', '5163 Cleveland Street   Virginia Beach', '3803 Springbloom Drive  Portsmouth 23701', '15:15:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'TRUE', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', NULL, '', '*Student must be given to caregiver upon arrival to school or home*', 65, 10, 37, 3, NULL),
(59, 7, 437, '2017-09-05', '2018-06-15', 'active', '6224 Hightower Road #E/ 6509 Portsmouth Blvd. Portsmouth  23703/23701', '07:55:00', '5163 Cleveland Street   Virginia Beach', '08:45:00', '5163 Cleveland Street   Virginia Beach', '6224 Hightower Road #E 6509 Portsmouth Blvd. Portsmouth  23703/23701', '15:15:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'FALSE', 'FALSE', NULL, '', '*Students must be given to caregiver upon arrival to school or home*', 75, 10, 47, 6, NULL),
(60, 1, 7, '2017-09-05', '2018-06-14', 'active', '3113 Shell Road  Hampton ', '06:30:00', '1111 Park Avenue Norfolk', '07:10:00', '1111 Park Avenue Norfolk', '3113 Shell Road  Hampton ', '14:05:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', NULL, '', '', 74, 1, 60, 3, NULL),
(61, 8, 7, '2017-09-05', '2018-06-14', 'active', '1046 Bryce Lane  Virginia Beach ', '06:45:00', '1111 Park Avenue Norfolk', '07:10:00', '1111 Park Avenue Norfolk', '1046 Bryce Lane  Virginia Beach ', '14:05:00', 'Monday,Tuesday,Wednesday,Thursday,Friday', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', NULL, '', '', 42, 8, 35, 3, NULL);

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
  `driver_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lpr_payroll`
--

INSERT INTO `lpr_payroll` (`pl_id`, `startdate`, `enddate`, `savedate`, `amount`, `driver_id`) VALUES
(15, '2017-08-01', '2017-08-22', '2017-08-09', 17.5, 92),
(16, '2017-08-23', '2017-08-31', '2017-08-09', 17.5, 92),
(17, '2017-07-01', '2017-09-30', '2017-08-16', 90, 92);

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
(37, NULL, '20.00', 'ridealong'),
(39, 7, '66.50', 'outzone'),
(40, 7, '84.00', 'inzone'),
(41, NULL, '15.00', 'addnlstop');

-- --------------------------------------------------------

--
-- Table structure for table `lpr_ridealong`
--

CREATE TABLE `lpr_ridealong` (
  `id` int(11) NOT NULL,
  `ra_fname` varchar(20) DEFAULT NULL,
  `ra_mname` varchar(20) DEFAULT NULL,
  `ra_lname` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `school_city` varchar(50) NOT NULL,
  `school_state` varchar(10) NOT NULL,
  `school_zip` int(20) NOT NULL,
  `school_country` varchar(50) NOT NULL,
  `school_contact_name` varchar(50) DEFAULT NULL,
  `school_contact_no` varchar(20) DEFAULT NULL,
  `school_type` varchar(20) NOT NULL,
  `school_address` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lpr_school`
--

INSERT INTO `lpr_school` (`school_id`, `client_id`, `school_name`, `school_abr`, `school_street`, `school_city`, `school_state`, `school_zip`, `school_country`, `school_contact_name`, `school_contact_no`, `school_type`, `school_address`) VALUES
(1, 1, 'Academy for Discovery at Lakewood', 'ADL', 'Alsace Avenue', 'Norfolk', 'VA', 23509, 'US', 'Mr. Thomas R. Smigiel', '7576282477', 'alternative', '1701'),
(2, 1, 'Academy of International Studies at Rosemont', 'AIS', 'Branch Road', 'Norfolk', 'VA', 23513, 'US', 'Dr.?Jannette E. Martin', '7578524610', 'alternative', '1330'),
(3, 1, 'Azalea Gardens Middle School', 'AZG', 'Azalea Garden Road', 'Norfolk', 'VA', 23518, 'US', 'Dr. Reuthenia C. Clark', '7575313000', 'middle', '7721'),
(4, 1, 'Bay View Elementary School', 'BAV', 'Bay View Blvd', 'Norfolk', 'VA', 23503, 'United States', 'Dr. Valerie A. Walto', '757531303', 'Elementary', '1434'),
(5, 1, 'Berkley/Campostella Early Childhood Education Center', 'BCE', 'Cypress Street', 'Norfolk', 'VA', 23523, 'US', 'Dr. Doreatha White', '7574943870', 'elementary', '1530'),
(6, 1, 'Blair Middle School', 'BMS', 'Spotswood Avenue', 'Norfolk', 'VA', 23517, 'US', 'Dr. Mark Makovec', '7576282400', 'middle', '730'),
(7, 1, 'Booker T. Washington High School', 'BTW', 'Park Avenue', 'Norfolk', 'VA', 23504, 'US', 'Dr. Margie G. Stallings', '7576283575', 'high', '1111'),
(8, 1, 'Camp Allen Elementary School', 'CAE', 'C Street', 'Norfolk', 'VA', 23505, 'US', 'Ms. Deena Johnson Copeland', '7574514170', 'elementary', '501'),
(9, 1, 'Camp Young', 'YNG', 'Deepwater Drive', 'Chesapeake', 'VA', 23322, 'US', 'Dr. Veronica E. Haynes', '7575474245', 'alternative', '145'),
(10, 1, 'Chesterfield Academy', 'CHS', 'Westminster Avenue', 'Norfolk', 'VA', 23504, 'US', 'Dr. Lawrence C. Taylor', '7576282544', 'alternative', '2915'),
(11, 1, 'Coleman Place Elementary School', 'COL', 'Palmyra Street', 'Norfolk', 'VA', 23513, 'US', 'Dr. Pamela M. Tatem', '7578524641', 'elementary', '2445'),
(12, 1, 'Crossroads School', 'CRS', 'Old Ocean View Road', 'Norfolk', 'VA', 23518, 'US', 'Dr. Kristen Nichols', '7575313050', 'alternative', '8021'),
(13, 1, 'Easton Preschool', 'EPS', 'Curlew Drive', 'Norfolk', 'VA', 23502, 'US', 'Dr. Tami M. White', '7578923290', 'preschool', '6045'),
(14, 1, 'Fairlawn Elementary School', 'FRL', 'Wade Street', 'Norfolk', 'VA', 23502, 'US', 'Mrs. T. Michele Logan', '7578923260', 'elementary', '1132'),
(15, 1, 'Ghent Elementary School', 'GHE', 'Shirley Avenue', 'Norfolk', 'VA', 23517, 'US', 'Dr. Thomas McAnulty', '7576282565', 'elementary', '200'),
(16, 1, 'Granby Elementary School', 'GRE', 'Newport Avenue', 'Norfolk', 'VA', 23505, 'US', 'Mrs. Kathy Verhappen', '7574514150', 'elementary', '7101'),
(17, 1, 'Granby High School', 'GRH', 'Granby Street', 'Norfolk', 'VA', 23505, 'US', 'Dr. Lynnell Gibson', '7574514110', 'high', '7101'),
(18, 1, 'Hospital School Program at CHKD', 'HSP', 'Gresham Drive', 'Norfolk', 'VA', 23507, 'US', 'Ms. Janice Teagle', '7576687061', 'alternative', '400/5th floor'),
(19, 1, 'Ingleside Elementary School', 'ING', 'Ingleside Drive', 'Norfolk', 'VA', 23502, 'US', 'Dr. Alana Balthazar', '7578923270', 'elementary', '976'),
(20, 1, 'Jacox Elementary School', 'JCX', 'Marshall Avenue', 'Norfolk', 'VA', 23504, 'US', 'Dr. Rohan Cumberbatch-Smith', '7576282433', 'elementary', '1300'),
(21, 1, 'James Monroe Elementary School', 'JME', 'West 29th Street', 'Norfolk', 'VA', 23508, 'US', 'Mrs. Celeste M. Jones', '7576283500', 'elementary', '520'),
(22, 1, 'Lake Taylor High School', 'LTH', 'Kempsville Road', 'Norfolk', 'VA', 23502, 'US', 'Mrs. Latesha Wade-Jenkins', '7578923200', 'high', '1384'),
(23, 1, 'Lake Taylor Middle School', 'LTM', 'Kempsville Road', 'Norfolk', 'VA', 23502, 'US', 'Dr. Kirk', '7578923230', 'middle', '1380'),
(24, 1, 'Larchmont Elementary School', 'LRC', 'Bolling Avenue', 'Norfolk', 'VA', 23508, 'US', 'Mr. Dennis Fifer', '7574514180', 'elementary', '1145'),
(25, 1, 'Larrymore Elementary School', 'LRY', 'Halprin Drive', 'Norfolk', 'VA', 23518, 'US', 'Mr. David W. Faircloth', '7575313070', 'elementary', '7600'),
(26, 1, 'Lindenwood Elementary School', 'LIN', 'Ludlow Street', 'Norfolk', 'VA', 23504, 'US', 'Dr. Lisa Corbin', '7576282577', 'elementary', '2700'),
(27, 1, 'Little Creek Elementary School - Tarpon', 'LCT', 'Tarpon Place', 'Norfolk', 'VA', 23518, 'US', 'Ms. Carolyn D. Harper', '7575313080', 'elementary', '7900'),
(28, 1, 'Little Creek Elementary School - Nancy', 'LCN', 'Nancy Drive', 'Norfolk', 'VA', 23518, 'US', 'Ms. Carolyn D. Harper', '7575313080', 'elementary', '7901'),
(29, 1, 'Madison Alternative Center', 'MAC', 'Bowdens Ferry Road', 'Norfolk', 'VA', 23508, 'US', 'Dr. Sandra Fortner', '7576283417', 'alternative', '3700'),
(30, 1, 'Mary Calcott Elementary School', 'CAL', 'Westmont Avenue', 'Norfolk', 'VA', 23503, 'US', 'Mrs. Danielle Y. McIntyre', '7575313039', 'elementary', '137'),
(31, 1, 'Maury High School', 'MHS', 'Shirley Avenue', 'Norfolk', 'VA', 23517, 'US', 'Ms. Karen Berg', '7576283344', 'high', '322'),
(32, 1, 'Norfolk Educational Transition Academy', 'NET', 'Security Lane', 'Norfolk', 'VA', 23502, 'US', 'Mr. Gus Guardino', '7578923310', 'alternative', '1260'),
(33, 1, 'Norfolk Technical Center', 'NTC', 'North Military Highway', 'Norfolk', 'VA', 23502, 'US', 'Mr. Kevin Monroe', '7578923300', 'high', '1330'),
(34, 1, 'Northside Middle School', 'NMS', 'Granby Street', 'Norfolk', 'VA', 23503, 'US', 'Mr. Richard Fraley', '7575313150', 'middle', '8720'),
(35, 1, 'Norview Elementary School', 'NRE', 'Chesapeake Blvd', 'Norfolk', 'VA', 23513, 'US', 'Ms. Kathryn Caple', '7578524660', 'elementary', '6401'),
(36, 1, 'Norview High School', 'NRH', 'Chesapeake Blvd', 'Norfolk', 'VA', 23513, 'US', 'Dr. Marjorie Stealey', '7578524500', 'high', '6501'),
(37, 1, 'Norview Middle School', 'NRM', 'Sewells Point Road', 'Norfolk', 'VA', 23513, 'US', 'Mr. Walter Brower, Jr.', '7578524600', 'middle', '6325'),
(38, 1, 'Ocean View Elementary School', 'OVE', 'Mason Creek Road', 'Norfolk', 'VA', 23503, 'US', 'Dr. James Peterson', '7575313105', 'elementary', '9501'),
(39, 1, 'Oceanair Elementary School', 'OCN', 'Dudley Avenue', 'Norfolk', 'VA', 23503, 'US', 'Ms. Lenthia Willie-Clark', '7575313095', 'elementary', '600'),
(40, 1, 'P.B. Young, Sr. Elementary School', 'PBY', 'East Olney Road', 'Norfolk', 'VA', 23510, 'US', 'Dr. Dwana White', '7576282588', 'elementary', '543'),
(41, 1, 'Poplar Halls Elementary School', 'POP', 'Pebble Lane', 'Norfolk', 'VA', 23502, 'US', 'Ms. Cassandra Duke-Washington', '7578923280', 'elementary', '5523'),
(42, 1, 'Richard Bowling Elementary School', 'RBE', 'East Princess Anne Road', 'Norfolk', 'VA', 23504, 'US', 'Mr. Eric Goodman', '7576282515', 'elementary', '2700'),
(43, 1, 'Ruffner Academy', 'RUF', 'May Avenue', 'Norfolk', 'VA', 23504, 'US', 'Ms. Sallie Cooke', '7576282466', 'alternative', '610'),
(44, 1, 'Sewells Point Elementary School', 'SWL', 'Hampton Blvd', 'Norfolk', 'VA', 23505, 'US', 'Ms. Mary Wrushen', '7574514160', 'elementary', '7928'),
(45, 1, 'Sherwood Forest Elementary School', 'SFE', 'Sherwood Forest Lane', 'Norfolk', 'VA', 23508, 'US', 'Ms. Cheryl Jordan', '7578524550', 'elementary', '3035'),
(46, 1, 'Southside STEM Academy at Campostella', 'SSS', 'Campostella Road', 'Norfolk', 'VA', 23523, 'US', 'Dr. Rhonda Ambrose', '7574943850', 'elementary', '1106'),
(47, 1, 'St. Helena Elementary School', 'STH', 'South Main Street', 'Norfolk', 'VA', 23523, 'US', 'Ms. Vandelyn Hodges', '7574943884', 'elementary', '903'),
(48, 1, 'Suburban Park Elementary School', 'SUB', 'Thole Street', 'Norfolk', 'VA', 23505, 'US', 'Mrs. Brenda Shepherd', '7575313118', 'elementary', '310'),
(49, 1, 'Tanners Creek Elementary School', 'TAN', 'Longdale Drive', 'Norfolk', 'VA', 23513, 'US', 'Mrs. Maritsa Alger', '7578524555', 'elementary', '1335'),
(50, 1, 'Tarrallton Elementary School', 'TAR', 'Tarrallton Drive', 'Norfolk', 'VA', 23518, 'US', 'Mr. Daniel White', '7575311800', 'elementary', '2080'),
(51, 1, 'Tidewater Park Elementary School', 'TPE', 'East Brambleton Avenue', 'Norfolk', 'VA', 23510, 'US', 'Dr. Sharon Phillips', '7576282500', 'elementary', '1045'),
(52, 1, 'W.H. Taylor Elementary School', 'WHT', 'West Princess Anne Road', 'Norfolk', 'VA', 23507, 'US', 'Ms. Charlene Felition', '7576282525', 'elementary', '1122'),
(53, 1, 'Willard Elementary School', 'WIL', 'Willow Wood Drive', 'Norfolk', 'VA', 23509, 'US', 'Mrs. Julie Honeycutt', '7576282721', 'elementary', '1511'),
(54, 1, 'Willoughby Elementary School', 'WLB', 'Fourth View Street', 'Norfolk', 'VA', 23508, 'US', 'Mrs. June Lightfoot', '7575313127', 'elementary', '9500'),
(55, 2, 'Churchland High School', 'CHS', 'Cedar Lane', 'Portsmouth', 'VA', 23703, 'US', 'Mr. Shawn L. Millaci', '7576862500', 'high', '4301'),
(56, 2, 'I.C. Norcom High School', 'NOR', 'London Blvd', 'Portsmouth', 'VA', 23704, 'US', 'Dr. Laguna O. Foster', '7573935442', 'high', '1801'),
(57, 2, 'Woodrow Wilson High School', 'WWH', 'Elmhurst Lane', 'Portsmouth', 'VA', 23701, 'US', 'Mr. Timothy E. Johnson', '7574652907', 'high', '1401'),
(58, 2, 'Churchland Middle School', 'CMS', 'River Shore Road', 'Portsmouth', 'VA', 23703, 'United States', 'Ms. Barbara R. Kimzey', '7576862512', 'middle', '4051'),
(59, 2, 'Cradock Middle School', 'CRD', 'Alden Avenue', 'Portsmouth', 'VA', 23702, 'US', 'Ms. Sonya C. Harrell', '7573938788', 'middle', '21'),
(60, 2, 'W.E. Waters Middle School', 'WEW', 'Roosevelt Blvd', 'Portsmouth', 'VA', 23701, 'US', 'Ms. Alice Graham', '7575582813', 'middle', '600'),
(61, 2, 'Brighton Elementary School', 'BES', 'Portsmouth Blvd', 'Portsmouth', 'VA', 23704, 'US', 'Mr. Arcelius Brickhouse', '7573938870', 'elementary', '1100'),
(62, 2, 'Churchland Academy', 'CAC', 'River Shore Road', 'Portsmouth', 'VA', 23703, 'US', 'Ms. Karen D. Clark', '7576862527', 'elementary', '4061'),
(63, 2, 'Churchland Elementary School', 'CES', 'Michael Lane', 'Portsmouth', 'VA', 23703, 'US', 'Dr. Jamill Ray Jones', '7576862523', 'elementary', '5601'),
(64, 2, 'Churchland Primary and Intermediate School', 'CPI', 'Hedgerow Lane', 'Portsmouth', 'VA', 23703, 'US', 'Ms. Rosalyn T. Exum', '7576862519', 'elementary', '5700'),
(65, 2, 'Douglass Park Elementary School', 'DGP', 'Grand Street', 'Portsmouth', 'VA', 23701, 'US', 'Ms. Dusti R. Johnson Brinker', '7573938646', 'elementary', '34'),
(66, 2, 'Hodges Manor Elementary School', 'HMN', 'Cherokee Road', 'Portsmouth', 'VA', 23701, 'US', 'Dr. Faye S. Felton', '7574652921', 'elementary', '1201'),
(67, 2, 'James Hurst Elementary School', 'JHE', 'Dahlgren Avenue', 'Portsmouth', 'VA', 23702, 'US', 'Mr. Morris L. Barco', '7575582811', 'elementary', '18'),
(68, 2, 'John Tyler Elementary School', 'JTE', 'Hartford Street', 'Portsmouth', 'VA', 23707, 'US', 'Ms. Heidi M. Lewis', '7573938879', 'elementary', '3649'),
(69, 2, 'Lakeview Elementary School', 'LKV', 'Horne Avenue', 'Portsmouth', 'VA', 23701, 'US', 'Dr. Camilla C. Ferebee', '7574652901', 'elementary', '1300'),
(70, 2, 'Park View Elementary School', 'PRV', 'Elm Avenue', 'Portsmouth', 'VA', 23704, 'US', 'Ms. Angela D. Flowers', '7573938647', 'elementary', '260'),
(71, 2, 'Simonsdale Elementary School', 'SES', 'Clifford Street', 'Portsmouth', 'VA', 23701, 'US', 'Ms. Darlene F. Bright', '7574652917', 'elementary', '4841'),
(72, 2, 'Victory Elementary School', 'VES', 'Greenwood Drive', 'Portsmouth', 'VA', 23701, 'US', 'Dr. J. Wayne Williams', '7573938806', 'elementary', '2828'),
(73, 2, 'Westhaven Elementary School', 'WST', 'Clifford Drive', 'Portsmouth', 'VA', 23707, 'US', 'Mr. Ralph K. Snowden', '7573938855', 'elementary', '3701'),
(74, 2, 'Churchland Preschool', 'CHP', 'River Shore Road', 'Portsmouth', 'VA', 23703, 'US', 'Ms. Robyn A. McIntyre', '7576862533', 'preschool', '4061'),
(75, 2, 'Emily Spong Preschool', 'ESP', 'Piedmont Avenue', 'Portsmouth', 'VA', 23704, 'US', 'Ms. Vanessa P. Whichard-Harris', '7573935247', 'preschool', '2200'),
(76, 2, 'Mount Hermon Preschool', 'MHP', 'North Street', 'Portsmouth', 'VA', 23707, 'US', 'Ms. Patricia S. Willilams', '7573938825', 'preschool', '3000'),
(77, 2, 'Olive Branch Preschool', 'OBP', 'Mimosa Road', 'Portsmouth', 'VA', 23701, 'US', 'Ms. Lois J. Rieckhoff', '7574652926', 'preschool', '415'),
(78, 2, 'Excel Campus', 'XCL', 'Elmhurst Lane', 'Portsmouth', 'VA', 23701, 'US', 'Ms. Sonji Hairston', '7574652958', 'alternative', '1401'),
(79, 2, 'New Directions Center', 'NDC', 'West Road', 'Portsmouth', 'VA', 23707, 'US', 'Mr. Horace L. Lambert, Jr.', '7573938728', 'alternative', '401'),
(80, 6, 'Denbigh Early Childhood Center', 'DEC', 'Warwick Blvd', 'Newport News', 'VA', 23608, 'US', 'Ms. Amelia Hunt', '7578667789', 'alternative', '15638'),
(81, 6, 'Lee Hall Early Childhood Center', 'HEC', 'Warwick Blvd', 'Newport News', 'VA', 23602, 'US', 'Ms. Lauren Gray', '7578883329', 'alternative', '17346'),
(82, 6, 'Marshall Early Learning Center', 'MAR', '24th Street', 'Newport News', 'VA', 23607, 'US', 'Ms. Vanessa Keller', '7579286832', 'alternative', '743'),
(83, 6, 'Watkins Early Childhood Center', 'WAT', 'Burns Drive', 'Newport News', 'VA', 23601, 'US', 'Ms. Sue Waxman', '7575914815', 'alternative', '21'),
(84, 6, 'Program for Educating Exceptional Preschoolers', 'PEP', 'Gatewood Road', 'Newport News', 'VA', 23601, 'US', 'Dr. Heather Jankovich', '7575914963', 'alternative', '1241'),
(85, 6, 'An Achievable Dream Academy', 'ADA', '16th Street', 'Newport News', 'VA', 23607, 'US', 'Ms. Terra Chalmer-Harris', '7579286827', 'elementary', '726'),
(86, 6, 'Carver Elementary School', 'CAR', 'Jefferson Avenue', 'Newport News', 'VA', 23605, 'US', 'Ms. Izzie R. Brown', '7575914950', 'elementary', '6160'),
(87, 6, 'Charles Elementary School', 'CES', 'Menchville Road', 'Newport News', 'VA', 23602, 'US', 'Mr. Anthony Perry', '7578867750', 'elementary', '701'),
(88, 6, 'Deer Park Elementary School', 'DRP', 'Jefferson Avenue', 'Newport News', 'VA', 23601, 'US', 'Ms. Mary Jo Anastasio', '7575917470', 'elementary', '11541'),
(89, 6, 'Discovery STEM Academy', 'DIS', 'Chestnut Avenue', 'Newport News', 'VA', 23607, 'US', 'Ms. Christine Pilger', '7579286838', 'elementary', '1712'),
(90, 6, 'Dutrow Elementary School', 'DUT', 'Curtis Tignor Road', 'Newport News', 'VA', 23608, 'US', 'Ms. Kelly Stewart', '7578867760', 'elementary', '60'),
(91, 6, 'Epes Elementary School', 'EPE', 'Lucas Creek Road', 'Newport News', 'VA', 23608, 'US', 'Mr. Reggie Alston', '7578867755', 'elementary', '855'),
(92, 6, 'General Stanford Elementary School', 'GSE', 'Madison Avenue, Fort Eustis', 'Newport News', 'VA', 23604, 'US', 'Ms. Diane C. Willis', '7578883200', 'elementary', '929'),
(93, 6, 'Greenwood Elementary School', 'GES', 'Woodside Lane', 'Newport News', 'VA', 23608, 'US', 'Ms. Camisha Davis', '7578867744', 'elementary', '13460'),
(94, 6, 'Hidenwood Elementary School', 'HID', 'Blount Point Road', 'Newport News', 'VA', 23606, 'US', 'Ms. Annette Walls', '7575914766', 'elementary', '501'),
(95, 6, 'Hilton Elementary School', 'HIL', 'River Road', 'Newport News', 'VA', 23601, 'US', 'Ms. Barbara Nagel', '7575914772', 'elementary', '225'),
(96, 6, 'Jenkins Elementary School', 'JNK', 'Menchville Road', 'Newport News', 'VA', 23602, 'US', 'Ms. Terri McCaughan', '7578815400', 'elementary', '80'),
(97, 6, 'Kiln Creek Elementary School', 'KIL', 'Kiln Creek Parkway', 'Newport News', 'VA', 23602, 'US', 'Dr. Kathryn Hermann', '7578867961', 'elementary', '1501'),
(98, 6, 'Lee Hall Elementary School', 'HES', 'Warwick Blvd', 'Newport News', 'VA', 23603, 'US', 'Ms. Glenda Walter', '7578883320', 'elementary', '17346'),
(99, 6, 'McIntosh Elementary School', 'MCE', 'Richneck Road', 'Newport News', 'VA', 23608, 'US', 'Ms. Ethel Francis', '7578867767', 'elementary', '185'),
(100, 6, 'Nelson Elementary School', 'NEL', 'Moyer Road', 'Newport News', 'VA', 23608, 'US', 'Dr. Melody Camm', '7578867783', 'elementary', '826'),
(101, 6, 'Newsome Park Elementary School', 'NEW', 'Marshall Avenue', 'Newport News', 'VA', 23607, 'US', 'Ms. Kimberly Judge', '7579286810', 'elementary', '4200'),
(102, 6, 'Palmer Elementary School', 'PES', 'Palmer Lane', 'Newport News', 'VA', 23602, 'US', 'Ms. Karen Lynch', '7578815000', 'elementary', '100'),
(103, 6, 'Richneck Elementary School', 'RCH', 'Tyner Drive', 'Newport News', 'VA', 23608, 'US', 'Mr. Troy Latuch', '7578867772', 'elementary', '205'),
(104, 6, 'Riverside Elementary School', 'RVR', 'Country Club Road', 'Newport News', 'VA', 23606, 'US', 'Mr. Bryan Thrift', '7575914740', 'elementary', '1100'),
(105, 6, 'Sanford Elementary School', 'SFD', 'Colony Road', 'Newport News', 'VA', 23602, 'US', 'Mr. Brian Lieberman', '7578867778', 'elementary', '480'),
(106, 6, 'Saunders Elementary School', 'SAU', 'Harpersville Road', 'Newport News', 'VA', 23601, 'US', 'Mr. Timothy Edwards', '7575914781', 'elementary', '853'),
(107, 6, 'Sedgefield Elementary School', 'SED', 'Main Street', 'Newport News', 'VA', 23605, 'US', 'Ms. Raquel Cox', '7575914792', 'elementary', '804'),
(108, 6, 'Yates Elementary School', 'YES', 'Maxwell Lane', 'Newport News', 'VA', 23606, 'US', 'Mr. Mark Kirk', '7578815450', 'elementary', '73'),
(109, 6, 'An Achievable Dream Middle School', 'ADM', 'Marshall Avenue', 'Newport News', 'VA', 23605, 'US', 'Ms. Marylin Sinclair-White', '7572837820', 'middle', '5720'),
(110, 6, 'Crittenden Middle School', 'CRT', 'Jefferson Avenue', 'Newport News', 'VA', 23605, 'US', 'Ms. Felicia F. Barnett', '7575914900', 'middle', '6158'),
(111, 6, 'Dozier Middle School', 'DOZ', 'Industrial Park Drive', 'Newport News', 'VA', 23608, 'US', 'Ms. Lisa Gatz', '7578883300', 'middle', '432'),
(112, 6, 'Gildersleeve Middle School', 'GIL', 'Minton Drive', 'Newport News', 'VA', 23606, 'US', 'Dr. Windy Nichols', '7575914862', 'middle', '1'),
(113, 6, 'Hines Middle School', 'HIN', 'McLawhorne Drive', 'Newport News', 'VA', 23601, 'US', 'Dr. Amanda Corbin-Staton', '7575914878', 'middle', '561'),
(114, 6, 'Huntington Middle School', 'HUN', 'Orcutt Avenue', 'Newport News', 'VA', 23607, 'US', 'Ms. Courtney Mompoint', '7579286846', 'middle', '3401'),
(115, 6, 'Passage Middle School', 'PAS', 'Atkinson Way', 'Newport News', 'VA', 23608, 'US', 'Ms. Janelle Spitz', '7578867600', 'middle', '400'),
(116, 6, 'Booker T. Washington Middle School', 'BTW', 'Chestnut Avenue', 'Newport News', 'VA', 23607, 'US', 'Dr. Sean Callender', '7579286860', 'middle', '3700'),
(117, 6, 'An Achievable Dream High School', 'ADH', 'Marshall Avenue', 'Newport News', 'VA', 23605, 'US', 'Ms. Marylin Sinclair-White', '7572837820', 'high', '5720'),
(118, 6, 'Denbigh High School', 'DHS', 'Denbigh Blvd', 'Newport News', 'VA', 23608, 'US', 'Dr. Eleanor Blowe', '7578867700', 'high', '259'),
(119, 6, 'Heritage High School', 'HER', 'Marshall Avenue', 'Newport News', 'VA', 23605, 'US', 'Ms. Shameka Gerald', '7579286100', 'high', '5800'),
(120, 6, 'Menchville High School', 'MEN', 'Menchville Road', 'Newport News', 'VA', 23602, 'US', 'Mr. Robert Surry', '7578867722', 'high', '275'),
(121, 6, 'Warwick High School', 'WAR', 'Copeland Lane', 'Newport News', 'VA', 23601, 'US', 'Mr. Anthony Frazier', '7575914700', 'high', '51'),
(122, 6, 'Woodside High School', 'WOD', 'Woodside Lane', 'Newport News', 'VA', 23608, 'US', 'Mr. Jonathan Hochman', '7578867530', 'high', '13450'),
(123, 6, 'Aviation Academy', 'AVI', 'Bland Blvd', 'Newport News', 'VA', 23602, 'US', 'Dr. Aaron Smith', '7578862745', 'high', '902-B'),
(124, 6, 'Enterprise Academy', 'ENT', 'Diligence Drive', 'Newport News', 'VA', 23606, 'US', 'Dr. Darwin Mills', '7575914971', 'high', '813/Suite 110'),
(125, 6, 'New Horizons Regional Education Center - Hampton', 'NHH', 'Butler Farm Road', 'Newport News', 'VA', 23666, 'US', 'Mr. Dewey Ray', '7577661100', 'high', '520'),
(126, 6, 'New Horizons Regional Education Center - Newport News', 'NHN', 'Woodside Lane', 'Newport News', 'VA', 23608, 'US', 'Mr. Bruce Schaffer', '7578744444', 'high', '13400'),
(127, 6, 'Point Option', 'OPT', 'Diligence Drive', 'Newport News', 'VA', 23606, 'US', 'Mr. Michael Bonfiglio', '7575917408', 'high', '813/Suite 100'),
(128, 6, 'Telecommunications Center', 'TCC', 'Minton Drive', 'Newport News', 'VA', 23606, 'US', 'Mr. Ray Price', '7575914687', 'high', '4'),
(129, 4, 'Booker T. Washington Elementary School', 'BTW', 'Walnut Street', 'Suffolk', 'VA', 23434, 'US', 'Ms.Lori Mounie', '7579346226', 'elementary', '204'),
(130, 4, 'Creekside Elementary School', 'CRK', 'Bennett\'s Creek Park Road', 'Suffolk', 'VA', 23434, 'US', 'Ms. Katrina Rountree', '7579234251', 'elementary', '1000'),
(131, 4, 'Driver Elementary School', 'DRV', 'Driver Lane', 'Suffolk', 'VA', 23435, 'US', 'Ms. Melodie Griffin', '7579234106', 'elementary', '4270'),
(132, 4, 'Elephant\'s Fork Elementary School', 'ELF', 'William Reid Drive', 'Suffolk', 'VA', 23434, 'US', 'Ms. Jessica Avery', '7579235250', 'elementary', '2316'),
(133, 4, 'Hillpoint Elementary', 'HIL', 'Hillpoint Blvd', 'Suffolk', 'VA', 23434, 'US', 'Ms. Catherine Pichon', '7579235252', 'elementary', '1101'),
(134, 4, 'Kilby Shores Elementary School', 'KIL', 'Kilby Shores Drive', 'Suffolk', 'VA', 23434, 'US', 'Ms. Lorri Banks', '7579346214', 'elementary', '111'),
(135, 4, 'Mack Benn, Jr. Elementary School', 'MBJ', 'Nansemond Parkway', 'Suffolk', 'VA', 23434, 'US', 'Mr. David LeFevre', '7579346224', 'elementary', '1253'),
(136, 4, 'Nansemond Parkway Elementary School', 'NPE', 'Nansemond Parkway', 'Suffolk', 'VA', 23434, 'US', 'Ms. Chanel Bryant', '7579234167', 'elementary', '3012'),
(137, 4, 'Northern Shores Elementary School', 'NSE', 'Respass Beach Road', 'Suffolk', 'VA', 23435, 'US', 'Ms. Tara W. Moore', '7579234169', 'elementary', '6701'),
(138, 4, 'Oakland Elementary School', 'OAK', 'Godwin Blvd', 'Suffolk', 'VA', 23434, 'US', 'Ms. Temesha Dabney', '7579235248', 'elementary', '5505'),
(139, 4, 'Pioneer Elementary', 'PIO', 'Pioneer Road', 'Suffolk', 'VA', 23437, 'US', 'Dr. Danielle Belton', '7579255782', 'elementary', '150'),
(140, 4, 'Forest Glen Middle School', 'FGM', 'Forest Glen Drive', 'Suffolk', 'VA', 23434, 'United States', 'Mr. Melvin Bradshaw', '7579255780', 'middle', '23434'),
(141, 4, 'John Yeates Middle School', 'JYM', 'Bennett\'s Pasture Road', 'Suffolk', 'VA', 23435, 'US', 'Mr. Shawn Green', '7579234105', 'middle', '4901'),
(142, 4, 'John F. Kennedy Middle School', 'JFK', 'East Washington Street', 'Suffolk', 'VA', 23434, 'US', 'Ms. Vivian Covington', '7579346212', 'middle', '2325'),
(143, 4, 'King\'s Fork Middle School', 'KFM', 'King\'s Fork Road', 'Suffolk', 'VA', 23434, 'US', 'Ms. Jennifer Presson', '7579235246', 'middle', '350'),
(144, 4, 'The Pruden Center', 'PRU', 'Pruden Blvd', 'Suffolk', 'VA', 23434, 'US', 'Mr. Andre Skinner', '7579255651', 'special', '4169'),
(145, 4, 'Turlington Woods', 'TUR', 'Turlington Road', 'Suffolk', 'VA', 23434, 'US', 'Mr. Kinsel Bynum', '7579346215', 'special', '629'),
(146, 4, 'King\'s Fork High School', 'KNG', 'King\'s Fork Road', 'Suffolk', 'VA', 23434, 'US', 'Dr. Ron Leigh', '7579235240', 'high', '351'),
(147, 4, 'Lakeland High School', 'LAK', 'Kenyon Road', 'Suffolk', 'VA', 23434, 'US', 'Mr. Douglas Wagoner', '7579255790', 'high', '214'),
(148, 4, 'Nansemond River High School', 'NRH', 'Nansemond Parkway', 'Suffolk', 'VA', 23434, 'US', 'Mr. Daniel O\'Leary', '7579234101', 'high', '3301'),
(149, 5, 'Aberdeen Elementary School', 'ABE', 'Aberdeen Road', 'Hampton', 'VA', 23666, 'US', 'Ms. Karla Young', '7578254624', 'elementary', '1424'),
(150, 5, 'Andrews PreK-8 School', 'AND', 'Victoria Blvd', 'Hamptonn', 'VA', 23661, 'US', 'Mr. Jeffrey Blowe', '7572683333', 'alternative', '3120'),
(151, 5, 'Armstrong Elementary School', 'ARM', 'Matoaka Road', 'Hampton', 'VA', 23661, 'US', 'Ms. Millicent Rogers', '7577271067', 'elementary', '3401'),
(152, 5, 'Asbury Elementary School', 'ASB', 'Beach Road', 'Hampton', 'VA', 23664, 'US', 'Ms. Susan Johnson', '7578505075', 'elementary', '140'),
(153, 5, 'Barron Elementary School', 'BAR', 'Fox Hill Road', 'Hampton', 'VA', 23669, 'US', 'Ms. Levia Stovall', '7578505100', 'elementary', '45'),
(154, 5, 'Bassette Elementary School', 'BAS', 'Bell Street', 'Hampton', 'VA', 23661, 'US', 'Dr. Bryce Johnson', '7577271071', 'elementary', '671'),
(155, 5, 'Booker Elementary Schools', 'BOO', 'Apollo Drive', 'Hampton', 'VA', 23669, 'US', 'Ms. Brynne Cere', '7578505096', 'elementary', '160'),
(156, 5, 'Bryan Elementary School', 'BRY', 'North Mallory Street', 'Hampton', 'VA', 23663, 'US', 'Ms. Lynette Nelms', '7577271056', 'elementary', '1021'),
(157, 5, 'Burbank Elementary School', 'BUR', 'Tide Mill Lane', 'Hampton', 'VA', 23666, 'US', 'Ms. Ashley Ide', '7578254642', 'elementary', '40'),
(158, 5, 'Cary Elementary School', 'CAR', 'Andrews Blvd', 'Hampton', 'VA', 23663, 'US', 'Dr. Heidi Brezinski', '7578505092', 'elementary', '2009'),
(159, 5, 'Cooper Elementary School', 'COO', 'Marcella Road', 'Hampton', 'VA', 23666, 'US', 'Ms. Tracie Albea', '7578254645', 'elementary', '200'),
(160, 5, 'Forrest Elementary School', 'FOR', 'Todds Lane', 'Hampton', 'VA', 23666, 'US', 'Dr. Kelli Cedo', '7578254627', 'elementary', '1406'),
(161, 5, 'Kraft Elementary School', 'KRA', 'Concord Drive', 'Hampton', 'VA', 23666, 'US', 'Ms. Whitney Cataldo', '7578254634', 'elementary', '600'),
(162, 5, 'Langley Elementary School', 'LAN', 'Rockwell Road', 'Hampton', 'VA', 23669, 'US', 'Ms. Elizabeth Franks', '7578505105', 'elementary', '16'),
(163, 5, 'Machen Elementary School', 'MAC', 'Sacramento Drive', 'Hampton', 'VA', 23666, 'US', 'Ms. Jennifer Humble', '7577272900', 'elementary', '20'),
(164, 5, 'Phillips Elementary School', 'PHI', 'LeMaster Drive', 'Hampton', 'VA', 23669, 'US', 'Ms. Elizabeth Cromartie', '7578505079', 'elementary', '703'),
(165, 5, 'Smith Elementary School', 'SMI', 'Woodland Road', 'Hampton', 'VA', 23669, 'US', 'Dr. Patrina Jenkins', '7578505088', 'elementary', '379'),
(166, 5, 'Tucker-Capps Elementary School', 'TUC', 'Wellington Drive', 'Hampton', 'VA', 23666, 'US', 'Ms. Tiffany Geddie-Suggs', '7578254641', 'elementary', '113'),
(167, 5, 'Tyler Elementary School', 'TYL', 'Salina Street', 'Hampton', 'VA', 23669, 'US', 'Ms. Adriane Bradley-Gray', '7577271439', 'elementary', '57'),
(168, 5, 'Phenix PreK-8 School', 'PHE', 'Big Bethel Road', 'Hampton', 'VA', 23666, 'US', 'Ms. Robin Hunt-Crenshaw', '7572683500', 'elementary', '1061'),
(169, 5, 'Davis Middle School', 'DAV', 'Todds Lane', 'Hampton', 'VA', 23666, 'US', 'Ms. Violet Whiteman', '7578254520', 'middle', '1435'),
(170, 5, 'Eaton Middle School', 'EAT', 'Cunningham Drive', 'Hampton', 'VA', 23666, 'US', 'Ms. Sharon Slater', '7578254540', 'middle', '2108'),
(171, 5, 'Jones Middle School', 'JON', 'Nickerson Blvd', 'Hampton', 'VA', 23663, 'US', 'Dr. Daniel Bowling', '7578507900', 'middle', '1819'),
(172, 5, 'Lindsay Middle School', 'LIN', 'Briarfield Road', 'Hampton', 'VA', 23661, 'US', 'Ms. Chevese Thomas', '7578254560', 'middle', '1636'),
(173, 5, 'Syms Middle School', 'SYM', 'Fox Hill Road', 'Hampton', 'VA', 23669, 'US', 'Mr. Michael Blount, Jr.', '7578505050', 'middle', '170'),
(174, 5, 'Bethel High School', 'BET', 'Big Bethel Road', 'Hampton', 'VA', 23666, 'US', 'Mr. Ralph Sanders', '7578254400', 'high', '1067'),
(175, 5, 'Hampton High School', 'HAM', 'West Queen Street', 'Hampton', 'VA', 23669, 'US', 'Mr. Kevin Davis', '7578254430', 'high', '1491'),
(176, 5, 'Kecoughtan High School', 'KEC', 'Woodland Road', 'Hampton', 'VA', 23669, 'US', 'Mr. Jeffrey Mordica', '7578505000', 'high', '522'),
(177, 5, 'Phoebus High School', 'PHE', 'Ireland Street', 'Hampton', 'VA', 23663, 'US', 'Mr. Mark Hudson', '7577271000', 'high', '100'),
(178, 5, 'Bridgeport Academy', 'BPA', 'Briarfield Road', 'Hampton', 'VA', 23669, 'US', 'Ms. Angelina Lipford', '7577271225', 'special', '1646'),
(179, 5, 'Motion Early Childhood Center', 'MOT', 'Old Buckroe Road', 'Hampton', 'VA', 23663, 'US', 'Ms. Joanne Drew', '7577271061', 'special', '339'),
(180, 5, 'Spratley Gifted Center', 'SPR', 'Woodland Road', 'Hampton', 'VA', 23669, 'US', 'Dr. Kenneth Crum', '7578505032', 'special', '339'),
(181, 5, 'New Horizons Regional Education Center', 'NHB', 'Butler Farm Road', 'Hampton', 'VA', 23666, 'US', 'Mr. J. Joseph Johnson', '7577661100', 'special', '520'),
(182, 3, 'B. M. Williams Primary', 'BMW', 'Battlefield Blvd.', 'Chesapeake', 'VA', 23320, 'US', 'Mr. Thomas P. Moyer', '7575470238', 'elementary', '1100'),
(183, 3, 'Butts Road Intermediate', 'BRI', 'Mt. Pleasant Rd.', 'Chesapeake', 'VA', 23322, 'US', 'Mrs. Nancy L. Cruz', '7574824566', 'middle', '1571'),
(184, 3, 'Butts Road Primary', 'BRP', 'Mt. Pleasant Rd.', 'Chesapeake', 'VA', 23222, 'US', 'Mr. James S. Lewter', '7574825820', 'elementary', '1000'),
(185, 3, 'Camelot Elementary School', 'CAM', 'Guenevere Drive', 'Chesapeake', 'VA', 23323, 'US', 'Dr. D. Jean Jones', '7575885347', 'elementary', '2901'),
(186, 3, 'Carver Intermediate School', 'CAR', 'Broad Street', 'Chesapeake', 'VA', 23324, 'US', 'Mrs. Michelle A. Ferebee', '7574947505', 'middle', '2601'),
(187, 3, 'Cedar Road Elementary', 'CRE', 'Cedar Road', 'Chesapeake', 'VA', 23322, 'US', 'Mrs. Tracy A. Cioppa', '7575470166', 'elementary', '1605'),
(188, 3, 'Chittum Elementary School', 'CHT', 'Dock Landing Road', 'Chesapeake', 'VA', 23321, 'US', 'Mrs. Sharon W. Miles', '7574656300', 'elementary', '2008'),
(189, 3, 'Crestwood Intermediate', 'CWI', 'Great Bridge Blvd', 'Chesapeake', 'VA', 23320, 'US', 'Mrs. Eva Renee Davis', '7574947565', 'middle', '1240'),
(190, 3, 'Deep Creek Central Elementary', 'DCC', 'Shipyard Road', 'Chesapeake', 'VA', 23323, 'US', 'Mrs. Barbara H. Fortner', '7575585356', 'elementary', '2448'),
(191, 3, 'Deep Creek Elementary', 'DCE', 'Forehand Dr.', 'Chesapeake', 'VA', 23323, 'US', 'Dr. Barry Brown', '7575885333', 'elementary', '2809'),
(192, 3, 'Georgetown Primary', 'GTP', 'Providence Road', 'Chesapeake', 'VA', 23325, 'US', 'Mrs. Terry A. Reitz', '7575787060', 'elementary', '436'),
(193, 3, 'Grassfield Elementary School', 'GFE', 'Averill Drive', 'Chesapeake', 'VA', 23323, 'US', 'Mr. Robert J. Sander', '7575888923', 'elementary', '2248'),
(194, 3, 'Great Bridge Intermediate', 'GBI', 'Hanbury Road West', 'Chesapeake', 'VA', 23322, 'US', 'Mrs. Heather D. Martin', '7574824405', 'middle', '253'),
(195, 3, 'Great Bridge Primary School', 'GBP', 'Cedar Road', 'Chesapeake', 'VA', 23322, 'US', 'Mrs. Theresa L. Meyers', '7575471135', 'elementary', '408'),
(196, 3, 'Greenbrier Intermediate', 'GRI', '1701 River Birch Run N.', 'Chesapeake', 'VA', 23320, 'US', 'Mr. Keith C. Hyater', '7575787080', 'middle', '1701'),
(197, 3, 'Greenbrier Primary School', 'GRP', 'Eden Way, South', 'Chesapeake', 'VA', 23320, 'US', 'Mrs. Joan B. Raybourn', '7574363428', 'elementary', '1551'),
(198, 3, 'Norfolk Highlands Primary', 'NHP', 'Myrtle Avenue', 'Chesapeake', 'VA', 23325, 'US', 'Mrs. Shawnia C. Smiley', '7575787092', 'elementary', '1115'),
(199, 3, 'Portlock Primary School', 'PRT', 'Varsity Drive', 'Chesapeake', 'VA', 23324, 'US', 'Mrs. Regina B. Ratcliff', '7574947555', 'elementary', '1857'),
(200, 3, 'Rena B. Wright Primary', 'RBW', 'Park Avenue', 'Chesapeake', 'VA', 23324, 'US', 'Mrs. Brenda H. Hobbs', '7574947585', 'elementary', '600'),
(201, 3, 'Southeastern Elementary', 'SEE', 'Battlefield Blvd', 'Chesapeake', 'VA', 23322, 'US', 'Dr. Hope P. Terrell', '7574217676', 'elementary', '1853'),
(202, 3, 'Southwestern Elementary', 'SWE', 'Airline Blvd.', 'Chesapeake', 'VA', 23321, 'US', 'Mrs. Sonya L. Beasley', '7574666310', 'elementary', '4410'),
(203, 3, 'Chesapeake Alternative School', 'CAS', 'Providence Road', 'Chesapeake', 'VA', 23325, 'US', 'Dr. Penny K. Schultz', '7575787046', 'alternative', '605'),
(204, 3, 'Chesapeake Center for Science and Technology', 'CST', 'Cedar Road', 'Chesapeake', 'VA', 23322, 'US', 'Dr. Shonda Pittman-Windham', '7575470134', 'alternative', '1617'),
(205, 3, 'Crestwood Middle School', 'CWM', 'Great Bridge Blvd', 'Chesapeake', 'VA', 23320, 'US', 'Mr. Michael R. Ward', '7574947560', 'middle', '1420'),
(206, 3, 'Deep Creek High School', 'DCH', 'Margaret Booker Drive', 'Chesapeake', 'VA', 23323, 'US', 'Mrs. J. Page Bagley', '7575585302', 'high', '2900'),
(207, 3, 'Deep Creek Middle School', 'DCM', 'Deal Drive', 'Chesapeake', 'VA', 23323, 'US', 'Dr. Muriel P.Barefield', '7575585321', 'middle', '1955'),
(208, 3, 'Grassfield High School', 'GFH', 'Grizzly Trail', 'Chesapeake', 'VA', 23323, 'US', 'Mr. Michael N. Perez', '7575584749', 'high', '2007'),
(209, 3, 'Great Bridge High School', 'GBH', 'West Hanbury Road', 'Chesapeake', 'VA', 23322, 'US', 'Mr. Jeffrey Johnson', '7574825191', 'high', '301'),
(210, 3, 'Great Bridge Middle School', 'GBM', 'South Battlefield Blvd', 'Chesapeake', 'VA', 23322, 'US', 'Mr. Craig K. Mills', '7574825128', 'middle', '441'),
(211, 3, 'Green Rum Middle', 'GRM', 'Greenbrier Parkway', 'Chesapeake', 'VA', 23320, 'US', 'Dr. Michael J. Mustain', '7575485309', 'middle', '1016'),
(212, 3, 'Hickory Elementary School', 'HES', 'Benefit Road', 'Chesapeake', 'VA', 23322, 'US', 'Mrs. Kim Pinello', '7574217080', 'elementary', '109'),
(213, 3, 'Hickory High School', 'HHS', 'Hawk Blvd', 'Chesapeake', 'VA', 23322, 'US', 'Ms. Amber N. Dortch', '7574214295', 'high', '1996'),
(214, 3, 'Hickory Middle School', 'HMS', 'Hawk Blvd', 'Chesapeake', 'VA', 23322, 'US', 'Dr. Deborah T. Hutchens', '7574210468', 'middle', '1997'),
(215, 3, 'Hugo Owens Middle School', 'OMS', 'Horseback Run', 'Chesapeake', 'VA', 23323, 'US', 'Mrs. Alaina C. Britt', '7575585382', 'middle', '1997'),
(216, 3, 'Indian River High School', 'IRH', 'Braves Trail', 'Chesapeake', 'VA', 23325, 'US', 'Mrs. Naomi R. Dunbar', '7575787000', 'high', '1969'),
(217, 3, 'Indian River Middle School', 'IRM', 'Old Greenbrier Road', 'Chesapeake', 'VA', 23325, 'US', 'Ms. Terre J. Werts', '7575787030', 'middle', '2300'),
(218, 3, 'Jolliff Middle School', 'JMS', 'Jolliff Road', 'Chesapeake', 'VA', 23321, 'US', 'Mr. Quentin E. Hicks', '7574651646', 'middle', '1021'),
(219, 3, 'Oscar Smith High School', 'OSH', 'Tiger Drive', 'Chesapeake', 'VA', 23320, 'US', 'Mr. Paul A. Joseph', '7575480696', 'high', '1994'),
(220, 3, 'Oscar Smith Middle School', 'OSM', 'Rodgers Street', 'Chesapeake', 'VA', 23324, 'US', 'Mrs. Judith C. Thurston', '7574947590', 'middle', '2500'),
(221, 3, 'Sparrow Road Intermediate', 'SRI', 'Sparrow Road', 'Chesapeake', 'VA', 23321, 'US', 'Ms. Sharon L. Popson', '7575787050', 'middle', '1605'),
(222, 3, 'Thurgood Marshall Elementary', 'TME', 'Border Road', 'Chesapeake', 'VA', 23324, 'US', 'Mrs. Karen Y. Lopez', '7574947515', 'elementary', '2706'),
(223, 3, 'Treakle Elementary School', 'TES', 'Gomerton Road', 'Chesapeake', 'VA', 23323, 'US', 'Mrs. Shelia J. Johnson', '7575585361', 'elementary', '2500'),
(224, 3, 'Truitt Intermediate School', 'TIS', 'Holly Avenue', 'Chesapeake', 'VA', 23324, 'US', 'Mrs. Kimberly G. Lowden', '7574948014', 'middle', '1100'),
(225, 3, 'Western Branch High School', 'WBH', 'Bruin Place', 'Chesapeake', 'VA', 23321, 'US', 'Dr. Thomas A. Whitley', '7576387904', 'high', '1968'),
(226, 3, 'Western Branch Intermediate', 'WBI', 'Terry Drive', 'Chesapeake', 'VA', 23321, 'US', 'Ms. Jataune N. Jones', '7576387941', 'middle', '4013'),
(227, 3, 'Western Branch Middle School', 'WBM', 'Hawksley Drive', 'Chesapeake', 'VA', 23321, 'US', 'Dr. Kambar Khoshaba', '7576387920', 'middle', '4201'),
(228, 3, 'Western Branch Primary', 'WBP', 'Terry Drive', 'Chesapeake', 'VA', 23321, 'US', 'Mrs. Gayle J. Bartlett', '7576387951', 'elementary', '4122'),
(229, 7, 'Advanced Technology Center', 'ATC', 'College Crescent', 'Virginia Beach', 'VA', 23453, 'US', 'Mr. Michael D. Taylor, Director', '757.648.5800', 'alternative', '1800'),
(230, 7, 'Alanton Elementary', 'ALE', 'Stephens Road', 'Virginia Beach', 'VA', 23454, 'US', 'Ms. Charlene E. Garran', '757.648.2000', 'elementary', '1441'),
(231, 7, 'Arrowhead Elementary', 'ARE', 'Susquehanna Drive', 'Virginia Beach', 'VA', 23462, 'US', 'Mr. Benjamin L. Gillikin', '757.648.2040', 'elementary', '5549'),
(232, 7, 'Bayside Elementary', 'BAE', 'Bayside Road', 'Virginia Beach', 'VA', 23455, 'US', 'Ms. Catherine M. Brumm', '757.648.2080', 'elementary', '5649'),
(233, 7, 'Bayside High', 'BAH', 'Haygood Road', 'Virginia Beach', 'VA', 23455, 'US', 'Mr. James D. Miller', '757.648.5200', 'high', '4960'),
(234, 7, 'Bayside Middle', 'BAM', 'Newtown Road', 'Virginia Beach', 'VA', 23462, 'US', 'Dr. Paula Johnson', '757.648.4400', 'middle', '965'),
(235, 7, 'Bayside Sixth Grade Campus', 'BSG', 'Jericho Road', 'Virginia Beach', 'VA', 23462, 'US', 'Ms. Camille A. Harmon', '757.648.4440', 'elementary', '4722'),
(236, 7, 'Birdneck Elementary', 'BRD', 'S. Birdneck Road', 'Virginia Beach', 'VA', 23451, 'US', 'Mr. Robert V. Yoshida', '757.648.2120', 'elementary', '957'),
(237, 7, 'Brandon Middle', 'BRN', 'Pope Street', 'Virginia Beach', 'VA', 23464, 'US', 'Ms. Christy E. McQueeney', '757.648.4450', 'middle', '1700'),
(238, 7, 'Brookwood Elementary', 'BRK', 'S. Lynnhaven Road', 'Virginia Beach', 'VA', 23452, 'US', 'Mrs. Christine C. Alarcon', '757.648.2160', 'elementary', '601'),
(239, 7, 'Centerville Elementary', 'CNT', 'Centerville Turnpike', 'Virginia Beach', 'VA', 23464, 'US', 'Ms. Teresa A. Ritzel', '757.648.2200', 'elementary', '2201'),
(240, 7, 'Christopher Farms Elementary', 'CFE', 'Pleasant Acres Drive', 'Virginia Beach', 'VA', 23453, 'US', 'Ms. Teri A. Breaux', '757.648.2240', 'elementary', '2828'),
(241, 7, 'College Park Elementary', 'CPE', 'Bennington Road', 'Virginia Beach', 'VA', 23464, 'US', 'Dr. Sterling A. White, Jr.', '757.648.2280', 'elementary', '1110'),
(242, 7, 'Cooke Elementary', 'CKE', 'Mediterranean Avenue', 'Virginia Beach', 'VA', 23451, 'US', 'Mrs. Pamela M. Bennis', '757.648.2320', 'elementary', '1501'),
(243, 7, 'Corporate Landing Elementary', 'CLE', 'Corporate Landing Pkwy', 'Virginia Beach', 'VA', 23454, 'US', 'Ms. Kelly W. Coon', '757.648.2360', 'elementary', '1590'),
(244, 7, 'Corporate Landing Middle', 'CLM', 'Corporate Landing Pkwy', 'Virginia Beach', 'VA', 23454, 'US', 'Dr. Freddie P. Alarcon, Jr.', '757.648.4500', 'middle', '1597'),
(245, 7, 'Cox High', 'COX', 'Shorehaven Drive', 'Virginia Beach', 'VA', 23454, 'US', 'Dr. Randi R. Riesbeck', '757.648.5250', 'high', '2425'),
(246, 7, 'Creeds Elementary', 'CRD', 'Princess Anne Road', 'Virginia Beach', 'VA', 23457, 'US', 'Ms. Casey L. Conger', '757.648.2400', 'elementary', '920'),
(247, 7, 'Dey Elementary', 'DEY', 'N. Great Neck Road', 'Virginia Beach', 'VA', 23454, 'US', 'Ms. Elizabeth C. Bianchi', '757.648.2440', 'elementary', '1900'),
(248, 7, 'Diamond Springs Elementary', 'DSE', 'Learning Circle', 'Virginia Beach', 'VA', 23462, 'US', 'Ms. Gloria Coston', '757.648.4240', 'elementary', '5225'),
(249, 7, 'Fairfield Elementary', 'FFE', 'Providence Road', 'Virginia Beach', 'VA', 23464, 'US', 'Mr. Douglas Knapp', '757.648.2480', 'elementary', '5428'),
(250, 7, 'First Colonial High', 'FCH', 'Mill Dam Road', 'Virginia Beach', 'VA', 23454, 'US', 'Dr. Nancy B. Farrell', '757.648.5300', 'high', '1272'),
(251, 7, 'Glenwood Elementary', 'GLD', 'Round Hill Drive', 'Virginia Beach', 'VA', 23464, 'US', 'Dr. Karin E. DiMaggio', '757.648.2520', 'elementary', '2213'),
(252, 7, 'Great Neck Middle', 'GNM', 'North Great Neck Road', 'Virginia Beach', 'VA', 23454, 'US', 'Dr. Eugene F. Soltner', '757.648.4550', 'middle', '1848'),
(253, 7, 'Green Run Collegiate', 'GRC', 'Dahlia Drive', 'Virginia Beach', 'VA', 23453, 'US', 'Mrs. Barbara J. Winn', '757.648.5393', 'pilot', '1700'),
(254, 7, 'Green Run Elementary', 'GRE', 'Green Garden Circle', 'Virginia Beach', 'VA', 23453, 'US', 'Ms. Sheila M. Wynn', '757.648.2560', 'elementary', '1200'),
(255, 7, 'Green Run High', 'GRH', 'Dahlia Drive', 'Virginia Beach', 'VA', 23453, 'US', 'Mr. C. Todd Tarkenton', '757.648.5350', 'high', '1700'),
(256, 7, 'Hermitage Elementary', 'HRM', 'Pleasure House Road', 'Virginia Beach', 'VA', 23455, 'US', 'Mrs. Holly J. Coggin', '757.648.2600', 'elementary', '1701'),
(257, 7, 'Holland Elementary', 'HOL', 'Holland Road', 'Virginia Beach', 'VA', 23452, 'US', 'Dr. Callie M. Richardson', '757.648.2640', 'elementary', '3340'),
(258, 7, 'Independence Middle', 'IND', 'Dunstan Lane', 'Virginia Beach', 'VA', 23455, 'US', 'Mr. Carey Manugo', '757.648.4600', 'middle', '1370'),
(259, 7, 'Indian Lakes Elementary', 'ILE', 'Homestead Drive', 'Virginia Beach', 'VA', 23464, 'US', 'Ms. Jennifer C. Born', '757.648.2680', 'elementary', '1240'),
(260, 7, 'Kellam High', 'KEL', 'West Neck Rd', 'Virginia Beach', 'VA', 23456, 'US', 'Dr. Daniel W. Smith', '757.648.5100', 'high', '2662'),
(261, 7, 'Kempsville Elementary', 'KEE', 'Kempsville Road', 'Virginia Beach', 'VA', 23464, 'US', 'Ms. Lori S. Hasher', '757.648.2720', 'elementary', '570'),
(262, 7, 'Kempsville High', 'KEH', 'Chief Trail', 'Virginia Beach', 'VA', 23464, 'US', 'Mr. William W. Harris', '757.648.5450', 'high', '5194'),
(263, 7, 'Kempsville Meadows Elementary', 'KME', 'Edwin Drive', 'Virginia Beach', 'VA', 23462, 'US', 'Mr. Mikelle C. Williams', '757.648.2760', 'elementary', '736'),
(264, 7, 'Kempsville Middle', 'KEM', 'Churchill Drive', 'Virginia Beach', 'VA', 23464, 'US', 'Dr. Patti T. Jenkins', '757.648.4700', 'middle', '860'),
(265, 7, 'Kings Grant Elementary', 'KGE', 'N. Lynnhaven Road', 'Virginia Beach', 'VA', 23452, 'US', 'Ms. Lisa D. Hannah', '757.648.2800', 'elementary', '612'),
(266, 7, 'Kingston Elementary', 'KNG', 'King\'s Grant Road', 'Virginia Beach', 'VA', 23452, 'US', 'Dr. Sharon H. Shewbridge', '757.648.2840', 'elementary', '3532'),
(267, 7, 'Landstown Elementary', 'LNE', 'Recreation Drive', 'Virginia Beach', 'VA', 23456, 'US', 'Mr. Jeffrey D. Hofmann', '757.648.2880', 'elementary', '2212'),
(268, 7, 'Landstown High', 'LNH', 'Concert Drive', 'Virginia Beach', 'VA', 23456, 'US', 'Dr. Cheryl C. Askew', '757.648.5500', 'high', '2001'),
(269, 7, 'Landstown Middle', 'LNM', 'Recreation Drive', 'Virginia Beach', 'VA', 23456, 'US', 'Mr. John T. Parkman', '757.648.4750', 'middle', '2204'),
(270, 7, 'Larkspur Middle', 'LRK', 'Princess Anne Road', 'Virginia Beach', 'VA', 23462, 'US', 'Dr. Melanie J. Hamblin', '757.648.4800', 'middle', '4696'),
(271, 7, 'Linkhorn Park Elementary', 'LNK', 'First Colonial Road', 'Virginia Beach', 'VA', 23454, 'US', 'Ms. Barbara Sessoms', '757.648.2920', 'elementary', '977'),
(272, 7, 'Luxford Elementary', 'LUX', 'Haygood Road', 'Virginia Beach', 'VA', 23455, 'US', 'Ms. Danielle E. Colucci', '757.648.2960', 'elementary', '4808'),
(273, 7, 'Lynnhaven Elementary', 'LNE', 'Dillon Drive', 'Virginia Beach', 'VA', 23452, 'US', 'Mrs. Katherine R. Everett', '757.648.3000', 'elementary', '210'),
(274, 7, 'Lynnhaven Middle', 'LNM', 'Bayne Drive', 'Virginia Beach', 'VA', 23454, 'US', 'Dr. Violet B. Hoyle', '757.648.4850', 'middle', '1250'),
(275, 7, 'Malibu Elementary', 'MAL', 'Edinburgh Drive', 'Virginia Beach', 'VA', 23452, 'US', 'Mr. Michael Maloney', '757.648.3040', 'elementary', '3632'),
(276, 7, 'New Castle Elementary', 'NCE', 'Dam Neck Road', 'Virginia Beach', 'VA', 23456, 'US', 'Ms. Gloria Harris', '757.648.3080', 'elementary', '4136'),
(277, 7, 'Newtown Elementary', 'NEW', 'Learning Circle', 'Virginia Beach', 'VA', 23462, 'US', 'Mr. Richard Sidone, Interim', '757.648.3120', 'elementary', '5277'),
(278, 7, 'North Landing Elementary', 'NLE', 'North Landing Road', 'Virginia Beach', 'VA', 23456, 'US', 'Ms. Jill S. Barger', '757.648.3160', 'elementary', '2929'),
(279, 7, 'Ocean Lakes Elementary', 'OLE', 'Upton Drive', 'Virginia Beach', 'VA', 23454, 'US', 'Dr. Linda Reese', '757.648.3200', 'elementary', '1616'),
(280, 7, 'Ocean Lakes High', 'OLH', 'Schumann Drive', 'Virginia Beach', 'VA', 23454, 'US', 'Dr. Claire R. LeBlanc', '757.648.5550', 'high', '885'),
(281, 7, 'Old Donation School', 'ODH', 'Honeygrove Road', 'Virginia Beach', 'VA', 23455, 'US', 'Dr. Kelly A. Hedrick', '757.648.3240', 'alternative', '4633'),
(282, 7, 'Parkway Elementary', 'PRK', 'O\'Hare Drive', 'Virginia Beach', 'VA', 23453, 'US', 'Mrs. Krista Barton-Arnold', '757.648.3280', 'elementary', '4180'),
(283, 7, 'Pembroke Elementary', 'PME', 'Jericho Road', 'Virginia Beach', 'VA', 23462, 'US', 'Dr. Linda Hayes', '757.648.3320', 'elementary', '4622'),
(284, 7, 'Pembroke Meadows Elementary', 'PMM', 'Cathedral Drive', 'Virginia Beach', 'VA', 23455, 'US', 'Dr. Charles L. Spivey', '757.648.3360', 'elementary', '820'),
(285, 7, 'Plaza Middle', 'PLZ', 'S. Lynnhaven Road', 'Virginia Beach', 'VA', 23452, 'US', 'Mr. Rodney Joe Burnsworth', '757.648.4900', 'middle', '3080'),
(286, 7, 'Point O View Elementary', 'POV', 'Parliament Drive', 'Virginia Beach', 'VA', 23462, 'US', 'Mr. John T. Chowns', '757.648.3440', 'elementary', '5400'),
(287, 7, 'Princess Anne Elementary', 'PAE', 'Seaboard Road', 'Virginia Beach', 'VA', 23456, 'US', 'Mr. Patrick I. Wroton', '757.648.3480', 'elementary', '2444'),
(288, 7, 'Princess Anne High', 'PAH', 'Virginia Beach Blvd.', 'Virginia Beach', 'VA', 23462, 'US', 'Mr. Danny M. Little', '757.648.5600', 'high', '4400'),
(289, 7, 'Princess Anne Middle', 'PAM', 'Holland Road', 'Virginia Beach', 'VA', 23453, 'US', 'Dr. D. Alex Bergren', '757.648.4950', 'middle', '2323'),
(290, 7, 'Providence Elementary', 'PRV', 'Providence Road', 'Virginia Beach', 'VA', 23464, 'US', 'Mr. Michael A. Taylor', '757.648.3520', 'elementary', '4968'),
(291, 7, 'Red Mill Elementary', 'RME', 'Sandbridge Road', 'Virginia Beach', 'VA', 23456, 'US', 'Dr. Michelle L. Miller', '757.648.3560', 'elementary', '1860'),
(292, 7, 'Renaissance Academy', 'REN', 'Cleveland Street', 'Virginia Beach', 'VA', 23462, 'US', 'Ms. Kay L. Thomas', '757-648-6000', 'alternative', '5100'),
(293, 7, 'Rosemont Elementary', 'ROS', 'Rosemont Road', 'Virginia Beach', 'VA', 23453, 'US', 'Ms. Cari A. Hall', '757.648.3600', 'elementary', '1257'),
(294, 7, 'Rosemont Forest Elementary', 'RFE', 'Grey Friars Chase', 'Virginia Beach', 'VA', 23456, 'US', 'Mr. Gregory Furlich', '757.648.3640', 'elementary', '1716'),
(295, 7, 'Salem Elementary', 'SLE', 'Salem Lakes Blvd.', 'Virginia Beach', 'VA', 23456, 'US', 'Dr. Ann Shufflebarger', '757.648.3680', 'elementary', '3961'),
(296, 7, 'Salem High', 'SLH', 'SunDevil Drive', 'Virginia Beach', 'VA', 23464, 'US', 'Mr. Matthew Delaney', '757.648.5650', 'high', '1993'),
(297, 7, 'Salem Middle', 'SLM', 'Lynnhaven Parkway', 'Virginia Beach', 'VA', 23464, 'US', 'Dr. James J. Smith', '757.648.5000', 'middle', '2380'),
(298, 7, 'Seatack Elementary', 'SEA', 'S. Birdneck Road', 'Virginia Beach', 'VA', 23451, 'US', 'Mr. Vincent M. Darby, Sr.', '757.648.3720', 'elementary', '912'),
(299, 7, 'Shelton Park Elementary', 'SPE', 'Shelton Road', 'Virginia Beach', 'VA', 23455, 'US', 'Ms. Tara M. Brewer', '757.648.3760', 'elementary', '1700'),
(300, 7, 'Strawbridge Elementary', 'STR', 'Strawbridge Road', 'Virginia Beach', 'VA', 23456, 'US', 'Ms. Jacqueline Y. Sargent', '757.648.3800', 'elementary', '2553'),
(301, 7, 'Tallwood Elementary', 'TLE', 'Kempsville Road', 'Virginia Beach', 'VA', 23464, 'US', 'Mr. David B. French', '757.648.3840', 'elementary', '2025'),
(302, 7, 'Tallwood High', 'TLH', 'Kempsville Road', 'Virginia Beach', 'VA', 23464, 'US', 'Dr. James Avila', '757.648.5700', 'high', '1668'),
(303, 7, 'Technical and Career Education Center', 'TEC', 'North Landing Road', 'Virginia Beach', 'VA', 23456, 'US', 'Mr. David C. Swanger, Director', '757.648.5850', 'alternative', '2925'),
(304, 7, 'Thalia Elementary', 'THA', 'Thalia Road', 'Virginia Beach', 'VA', 23452, 'US', 'Dr. Mary Daniels, Interim', '757.648.3880', 'elementary', '421'),
(305, 7, 'Thoroughgood Elementary', 'THE', 'Dunstan Lane', 'Virginia Beach', 'VA', 23455, 'US', 'Dr. Cheryl Zigrang', '757.648.3920', 'elementary', '1444'),
(306, 7, 'Three Oaks Elementary', 'TOE', 'Elson Green Avenue', 'Virginia Beach', 'VA', 23456, 'US', 'Ms. Linda L. Sidone', '757.648.3960', 'elementary', '2201'),
(307, 7, 'Trantwood Elementary', 'TRN', 'Inlynnview Road', 'Virginia Beach', 'VA', 23454, 'US', 'Ms. Lou Anne Metzger', '757.648-4000', 'elementary', '2344'),
(308, 7, 'Virginia Beach Juvenile Detention Center/Education Program', 'JDC', 'George Mason Drive', 'Virginia Beach', 'VA', 23456, 'US', 'Mr. Charles Foster', '757.263.1203', 'alternative', '2533'),
(309, 7, 'Virginia Beach Middle', 'VBM', '25th Street', 'Virginia Beach', 'VA', 23451, 'US', 'Dr. Sandra R. Brown', '757.648.5050', 'middle', '600'),
(310, 7, 'White Oaks Elementary', 'WHO', 'Windsor Oaks Blvd.', 'Virginia Beach', 'VA', 23462, 'US', 'Mrs. Stephanie D. Haus', '757.648.4040', 'elementary', '960'),
(311, 7, 'Williams Elementary', 'WLM', 'Newtown Road', 'Virginia Beach', 'VA', 23462, 'US', 'Mr. Timothy Sullivan', '757.648.4080', 'elementary', '892'),
(312, 7, 'Windsor Oaks Elementary', 'WOE', 'Van Buren Drive', 'Virginia Beach', 'VA', 23452, 'US', 'Dr. Sherri Archer', '757.648.4120', 'elementary', '3800'),
(313, 7, 'Windsor Woods Elementary', 'WWE', 'Presidential Blvd.', 'Virginia Beach', 'VA', 23452, 'US', 'Mr. Matthew A. Orebaugh', '757.648.4160', 'elementary', '233'),
(314, 7, 'Woodstock Elementary', 'WOD', 'Providence Road', 'Virginia Beach', 'VA', 23464, 'US', 'Ms. Amy N. Hedrick', '757.648.4200', 'elementary', '6016'),
(315, 8, 'Academy for Discovery at Lakewood', 'ADL', 'Alsace Avenue', 'Norfolk', 'VA', 23509, 'US', 'Mr. Thomas R. Smigiel', '7576282477', 'alternative', '1701'),
(316, 8, 'Academy of International Studies at Rosemont', 'AIS', 'Branch Road', 'Norfolk', 'VA', 23513, 'US', 'Dr.?Jannette E. Martin', '7578524610', 'alternative', '1330'),
(317, 8, 'Azalea Gardens Middle School', 'AZG', 'Azalea Garden Road', 'Norfolk', 'VA', 23518, 'US', 'Dr. Reuthenia C. Clark', '7575313000', 'middle', '7721'),
(318, 8, 'Bay View Elementary School', 'BAV', 'Bay View Blvd', 'Norfolk', 'VA', 23503, 'United States', 'Dr. Valerie A. Walto', '757531303', 'Elementary', '1434'),
(319, 8, 'Berkley/Campostella Early Childhood Education Center', 'BCE', 'Cypress Street', 'Norfolk', 'VA', 23523, 'US', 'Dr. Doreatha White', '7574943870', 'elementary', '1530'),
(320, 8, 'Blair Middle School', 'BMS', 'Spotswood Avenue', 'Norfolk', 'VA', 23517, 'US', 'Dr. Mark Makovec', '7576282400', 'middle', '730'),
(321, 8, 'Booker T. Washington High School', 'BTW', 'Park Avenue', 'Norfolk', 'VA', 23504, 'US', 'Dr. Margie G. Stallings', '7576283575', 'high', '1111'),
(322, 8, 'Camp Allen Elementary School', 'CAE', 'C Street', 'Norfolk', 'VA', 23505, 'US', 'Ms. Deena Johnson Copeland', '7574514170', 'elementary', '501'),
(323, 8, 'Camp Young', 'YNG', 'Deepwater Drive', 'Chesapeake', 'VA', 23322, 'US', 'Dr. Veronica E. Haynes', '7575474245', 'alternative', '145'),
(324, 8, 'Chesterfield Academy', 'CHS', 'Westminster Avenue', 'Norfolk', 'VA', 23504, 'US', 'Dr. Lawrence C. Taylor', '7576282544', 'alternative', '2915'),
(325, 8, 'Coleman Place Elementary School', 'COL', 'Palmyra Street', 'Norfolk', 'VA', 23513, 'US', 'Dr. Pamela M. Tatem', '7578524641', 'elementary', '2445');
INSERT INTO `lpr_school` (`school_id`, `client_id`, `school_name`, `school_abr`, `school_street`, `school_city`, `school_state`, `school_zip`, `school_country`, `school_contact_name`, `school_contact_no`, `school_type`, `school_address`) VALUES
(326, 8, 'Crossroads School', 'CRS', 'Old Ocean View Road', 'Norfolk', 'VA', 23518, 'US', 'Dr. Kristen Nichols', '7575313050', 'alternative', '8021'),
(327, 8, 'Easton Preschool', 'EPS', 'Curlew Drive', 'Norfolk', 'VA', 23502, 'US', 'Dr. Tami M. White', '7578923290', 'preschool', '6045'),
(328, 8, 'Fairlawn Elementary School', 'FRL', 'Wade Street', 'Norfolk', 'VA', 23502, 'US', 'Mrs. T. Michele Logan', '7578923260', 'elementary', '1132'),
(329, 8, 'Ghent Elementary School', 'GHE', 'Shirley Avenue', 'Norfolk', 'VA', 23517, 'US', 'Dr. Thomas McAnulty', '7576282565', 'elementary', '200'),
(330, 8, 'Granby Elementary School', 'GRE', 'Newport Avenue', 'Norfolk', 'VA', 23505, 'US', 'Mrs. Kathy Verhappen', '7574514150', 'elementary', '7101'),
(331, 8, 'Granby High School', 'GRH', 'Granby Street', 'Norfolk', 'VA', 23505, 'US', 'Dr. Lynnell Gibson', '7574514110', 'high', '7101'),
(332, 8, 'Hospital School Program at CHKD', 'HSP', 'Gresham Drive', 'Norfolk', 'VA', 23507, 'US', 'Ms. Janice Teagle', '7576687061', 'alternative', '400/5th floor'),
(333, 8, 'Ingleside Elementary School', 'ING', 'Ingleside Drive', 'Norfolk', 'VA', 23502, 'US', 'Dr. Alana Balthazar', '7578923270', 'elementary', '976'),
(334, 8, 'Jacox Elementary School', 'JCX', 'Marshall Avenue', 'Norfolk', 'VA', 23504, 'US', 'Dr. Rohan Cumberbatch-Smith', '7576282433', 'elementary', '1300'),
(335, 8, 'James Monroe Elementary School', 'JME', 'West 29th Street', 'Norfolk', 'VA', 23508, 'US', 'Mrs. Celeste M. Jones', '7576283500', 'elementary', '520'),
(336, 8, 'Lake Taylor High School', 'LTH', 'Kempsville Road', 'Norfolk', 'VA', 23502, 'US', 'Mrs. Latesha Wade-Jenkins', '7578923200', 'high', '1384'),
(337, 8, 'Lake Taylor Middle School', 'LTM', 'Kempsville Road', 'Norfolk', 'VA', 23502, 'US', 'Dr. Kirk', '7578923230', 'middle', '1380'),
(338, 8, 'Larchmont Elementary School', 'LRC', 'Bolling Avenue', 'Norfolk', 'VA', 23508, 'US', 'Mr. Dennis Fifer', '7574514180', 'elementary', '1145'),
(339, 8, 'Larrymore Elementary School', 'LRY', 'Halprin Drive', 'Norfolk', 'VA', 23518, 'US', 'Mr. David W. Faircloth', '7575313070', 'elementary', '7600'),
(340, 8, 'Lindenwood Elementary School', 'LIN', 'Ludlow Street', 'Norfolk', 'VA', 23504, 'US', 'Dr. Lisa Corbin', '7576282577', 'elementary', '2700'),
(341, 8, 'Little Creek Elementary School - Tarpon', 'LCT', 'Tarpon Place', 'Norfolk', 'VA', 23518, 'US', 'Ms. Carolyn D. Harper', '7575313080', 'elementary', '7900'),
(342, 8, 'Little Creek Elementary School - Nancy', 'LCN', 'Nancy Drive', 'Norfolk', 'VA', 23518, 'US', 'Ms. Carolyn D. Harper', '7575313080', 'elementary', '7901'),
(343, 8, 'Madison Alternative Center', 'MAC', 'Bowdens Ferry Road', 'Norfolk', 'VA', 23508, 'US', 'Dr. Sandra Fortner', '7576283417', 'alternative', '3700'),
(344, 8, 'Mary Calcott Elementary School', 'CAL', 'Westmont Avenue', 'Norfolk', 'VA', 23503, 'US', 'Mrs. Danielle Y. McIntyre', '7575313039', 'elementary', '137'),
(345, 8, 'Maury High School', 'MHS', 'Shirley Avenue', 'Norfolk', 'VA', 23517, 'US', 'Ms. Karen Berg', '7576283344', 'high', '322'),
(346, 8, 'Norfolk Educational Transition Academy', 'NET', 'Security Lane', 'Norfolk', 'VA', 23502, 'US', 'Mr. Gus Guardino', '7578923310', 'alternative', '1260'),
(347, 8, 'Norfolk Technical Center', 'NTC', 'North Military Highway', 'Norfolk', 'VA', 23502, 'US', 'Mr. Kevin Monroe', '7578923300', 'high', '1330'),
(348, 8, 'Northside Middle School', 'NMS', 'Granby Street', 'Norfolk', 'VA', 23503, 'US', 'Mr. Richard Fraley', '7575313150', 'middle', '8720'),
(349, 8, 'Norview Elementary School', 'NRE', 'Chesapeake Blvd', 'Norfolk', 'VA', 23513, 'US', 'Ms. Kathryn Caple', '7578524660', 'elementary', '6401'),
(350, 8, 'Norview High School', 'NRH', 'Chesapeake Blvd', 'Norfolk', 'VA', 23513, 'US', 'Dr. Marjorie Stealey', '7578524500', 'high', '6501'),
(351, 8, 'Norview Middle School', 'NRM', 'Sewells Point Road', 'Norfolk', 'VA', 23513, 'US', 'Mr. Walter Brower, Jr.', '7578524600', 'middle', '6325'),
(352, 8, 'Ocean View Elementary School', 'OVE', 'Mason Creek Road', 'Norfolk', 'VA', 23503, 'US', 'Dr. James Peterson', '7575313105', 'elementary', '9501'),
(353, 8, 'Oceanair Elementary School', 'OCN', 'Dudley Avenue', 'Norfolk', 'VA', 23503, 'US', 'Ms. Lenthia Willie-Clark', '7575313095', 'elementary', '600'),
(354, 8, 'P.B. Young, Sr. Elementary School', 'PBY', 'East Olney Road', 'Norfolk', 'VA', 23510, 'US', 'Dr. Dwana White', '7576282588', 'elementary', '543'),
(355, 8, 'Poplar Halls Elementary School', 'POP', 'Pebble Lane', 'Norfolk', 'VA', 23502, 'US', 'Ms. Cassandra Duke-Washington', '7578923280', 'elementary', '5523'),
(356, 8, 'Richard Bowling Elementary School', 'RBE', 'East Princess Anne Road', 'Norfolk', 'VA', 23504, 'US', 'Mr. Eric Goodman', '7576282515', 'elementary', '2700'),
(357, 8, 'Ruffner Academy', 'RUF', 'May Avenue', 'Norfolk', 'VA', 23504, 'US', 'Ms. Sallie Cooke', '7576282466', 'alternative', '610'),
(358, 8, 'Sewells Point Elementary School', 'SWL', 'Hampton Blvd', 'Norfolk', 'VA', 23505, 'US', 'Ms. Mary Wrushen', '7574514160', 'elementary', '7928'),
(359, 8, 'Sherwood Forest Elementary School', 'SFE', 'Sherwood Forest Lane', 'Norfolk', 'VA', 23508, 'US', 'Ms. Cheryl Jordan', '7578524550', 'elementary', '3035'),
(360, 8, 'Southside STEM Academy at Campostella', 'SSS', 'Campostella Road', 'Norfolk', 'VA', 23523, 'US', 'Dr. Rhonda Ambrose', '7574943850', 'elementary', '1106'),
(361, 8, 'St. Helena Elementary School', 'STH', 'South Main Street', 'Norfolk', 'VA', 23523, 'US', 'Ms. Vandelyn Hodges', '7574943884', 'elementary', '903'),
(362, 8, 'Suburban Park Elementary School', 'SUB', 'Thole Street', 'Norfolk', 'VA', 23505, 'US', 'Mrs. Brenda Shepherd', '7575313118', 'elementary', '310'),
(363, 8, 'Tanners Creek Elementary School', 'TAN', 'Longdale Drive', 'Norfolk', 'VA', 23513, 'US', 'Mrs. Maritsa Alger', '7578524555', 'elementary', '1335'),
(364, 8, 'Tarrallton Elementary School', 'TAR', 'Tarrallton Drive', 'Norfolk', 'VA', 23518, 'US', 'Mr. Daniel White', '7575311800', 'elementary', '2080'),
(365, 8, 'Tidewater Park Elementary School', 'TPE', 'East Brambleton Avenue', 'Norfolk', 'VA', 23510, 'US', 'Dr. Sharon Phillips', '7576282500', 'elementary', '1045'),
(366, 8, 'W.H. Taylor Elementary School', 'WHT', 'West Princess Anne Road', 'Norfolk', 'VA', 23507, 'US', 'Ms. Charlene Felition', '7576282525', 'elementary', '1122'),
(367, 8, 'Willard Elementary School', 'WIL', 'Willow Wood Drive', 'Norfolk', 'VA', 23509, 'US', 'Mrs. Julie Honeycutt', '7576282721', 'elementary', '1511'),
(368, 8, 'Willoughby Elementary School', 'WLB', 'Fourth View Street', 'Norfolk', 'VA', 23508, 'US', 'Mrs. June Lightfoot', '7575313127', 'elementary', '9500'),
(369, 9, 'B. M. Williams Primary', 'BMW', 'Battlefield Blvd.', 'Chesapeake', 'VA', 23320, 'US', 'Mr. Thomas P. Moyer', '7575470238', 'elementary', '1100'),
(370, 9, 'Butts Road Intermediate', 'BRI', 'Mt. Pleasant Rd.', 'Chesapeake', 'VA', 23322, 'US', 'Mrs. Nancy L. Cruz', '7574824566', 'middle', '1571'),
(371, 9, 'Butts Road Primary', 'BRP', 'Mt. Pleasant Rd.', 'Chesapeake', 'VA', 23222, 'US', 'Mr. James S. Lewter', '7574825820', 'elementary', '1000'),
(372, 9, 'Camelot Elementary School', 'CAM', 'Guenevere Drive', 'Chesapeake', 'VA', 23323, 'US', 'Dr. D. Jean Jones', '7575885347', 'elementary', '2901'),
(373, 9, 'Carver Intermediate School', 'CAR', 'Broad Street', 'Chesapeake', 'VA', 23324, 'US', 'Mrs. Michelle A. Ferebee', '7574947505', 'middle', '2601'),
(374, 9, 'Cedar Road Elementary', 'CRE', 'Cedar Road', 'Chesapeake', 'VA', 23322, 'US', 'Mrs. Tracy A. Cioppa', '7575470166', 'elementary', '1605'),
(375, 9, 'Chittum Elementary School', 'CHT', 'Dock Landing Road', 'Chesapeake', 'VA', 23321, 'US', 'Mrs. Sharon W. Miles', '7574656300', 'elementary', '2008'),
(376, 9, 'Crestwood Intermediate', 'CWI', 'Great Bridge Blvd', 'Chesapeake', 'VA', 23320, 'US', 'Mrs. Eva Renee Davis', '7574947565', 'middle', '1240'),
(377, 9, 'Deep Creek Central Elementary', 'DCC', 'Shipyard Road', 'Chesapeake', 'VA', 23323, 'US', 'Mrs. Barbara H. Fortner', '7575585356', 'elementary', '2448'),
(378, 9, 'Deep Creek Elementary', 'DCE', 'Forehand Dr.', 'Chesapeake', 'VA', 23323, 'US', 'Dr. Barry Brown', '7575885333', 'elementary', '2809'),
(379, 9, 'Georgetown Primary', 'GTP', 'Providence Road', 'Chesapeake', 'VA', 23325, 'US', 'Mrs. Terry A. Reitz', '7575787060', 'elementary', '436'),
(380, 9, 'Grassfield Elementary School', 'GFE', 'Averill Drive', 'Chesapeake', 'VA', 23323, 'US', 'Mr. Robert J. Sander', '7575888923', 'elementary', '2248'),
(381, 9, 'Great Bridge Intermediate', 'GBI', 'Hanbury Road West', 'Chesapeake', 'VA', 23322, 'US', 'Mrs. Heather D. Martin', '7574824405', 'middle', '253'),
(382, 9, 'Great Bridge Primary School', 'GBP', 'Cedar Road', 'Chesapeake', 'VA', 23322, 'US', 'Mrs. Theresa L. Meyers', '7575471135', 'elementary', '408'),
(383, 9, 'Greenbrier Intermediate', 'GRI', '1701 River Birch Run N.', 'Chesapeake', 'VA', 23320, 'US', 'Mr. Keith C. Hyater', '7575787080', 'middle', '1701'),
(384, 9, 'Greenbrier Primary School', 'GRP', 'Eden Way, South', 'Chesapeake', 'VA', 23320, 'US', 'Mrs. Joan B. Raybourn', '7574363428', 'elementary', '1551'),
(385, 9, 'Norfolk Highlands Primary', 'NHP', 'Myrtle Avenue', 'Chesapeake', 'VA', 23325, 'US', 'Mrs. Shawnia C. Smiley', '7575787092', 'elementary', '1115'),
(386, 9, 'Portlock Primary School', 'PRT', 'Varsity Drive', 'Chesapeake', 'VA', 23324, 'US', 'Mrs. Regina B. Ratcliff', '7574947555', 'elementary', '1857'),
(387, 9, 'Rena B. Wright Primary', 'RBW', 'Park Avenue', 'Chesapeake', 'VA', 23324, 'US', 'Mrs. Brenda H. Hobbs', '7574947585', 'elementary', '600'),
(388, 9, 'Southeastern Elementary', 'SEE', 'Battlefield Blvd', 'Chesapeake', 'VA', 23322, 'US', 'Dr. Hope P. Terrell', '7574217676', 'elementary', '1853'),
(389, 9, 'Southwestern Elementary', 'SWE', 'Airline Blvd.', 'Chesapeake', 'VA', 23321, 'US', 'Mrs. Sonya L. Beasley', '7574666310', 'elementary', '4410'),
(390, 9, 'Chesapeake Alternative School', 'CAS', 'Providence Road', 'Chesapeake', 'VA', 23325, 'US', 'Dr. Penny K. Schultz', '7575787046', 'alternative', '605'),
(391, 9, 'Chesapeake Center for Science and Technology', 'CST', 'Cedar Road', 'Chesapeake', 'VA', 23322, 'US', 'Dr. Shonda Pittman-Windham', '7575470134', 'alternative', '1617'),
(392, 9, 'Crestwood Middle School', 'CWM', 'Great Bridge Blvd', 'Chesapeake', 'VA', 23320, 'US', 'Mr. Michael R. Ward', '7574947560', 'middle', '1420'),
(393, 9, 'Deep Creek High School', 'DCH', 'Margaret Booker Drive', 'Chesapeake', 'VA', 23323, 'US', 'Mrs. J. Page Bagley', '7575585302', 'high', '2900'),
(394, 9, 'Deep Creek Middle School', 'DCM', 'Deal Drive', 'Chesapeake', 'VA', 23323, 'US', 'Dr. Muriel P.Barefield', '7575585321', 'middle', '1955'),
(395, 9, 'Grassfield High School', 'GFH', 'Grizzly Trail', 'Chesapeake', 'VA', 23323, 'US', 'Mr. Michael N. Perez', '7575584749', 'high', '2007'),
(396, 9, 'Great Bridge High School', 'GBH', 'West Hanbury Road', 'Chesapeake', 'VA', 23322, 'US', 'Mr. Jeffrey Johnson', '7574825191', 'high', '301'),
(397, 9, 'Great Bridge Middle School', 'GBM', 'South Battlefield Blvd', 'Chesapeake', 'VA', 23322, 'US', 'Mr. Craig K. Mills', '7574825128', 'middle', '441'),
(398, 9, 'Green Rum Middle', 'GRM', 'Greenbrier Parkway', 'Chesapeake', 'VA', 23320, 'US', 'Dr. Michael J. Mustain', '7575485309', 'middle', '1016'),
(399, 9, 'Hickory Elementary School', 'HES', 'Benefit Road', 'Chesapeake', 'VA', 23322, 'US', 'Mrs. Kim Pinello', '7574217080', 'elementary', '109'),
(400, 9, 'Hickory High School', 'HHS', 'Hawk Blvd', 'Chesapeake', 'VA', 23322, 'US', 'Ms. Amber N. Dortch', '7574214295', 'high', '1996'),
(401, 9, 'Hickory Middle School', 'HMS', 'Hawk Blvd', 'Chesapeake', 'VA', 23322, 'US', 'Dr. Deborah T. Hutchens', '7574210468', 'middle', '1997'),
(402, 9, 'Hugo Owens Middle School', 'OMS', 'Horseback Run', 'Chesapeake', 'VA', 23323, 'US', 'Mrs. Alaina C. Britt', '7575585382', 'middle', '1997'),
(403, 9, 'Indian River High School', 'IRH', 'Braves Trail', 'Chesapeake', 'VA', 23325, 'US', 'Mrs. Naomi R. Dunbar', '7575787000', 'high', '1969'),
(404, 9, 'Indian River Middle School', 'IRM', 'Old Greenbrier Road', 'Chesapeake', 'VA', 23325, 'US', 'Ms. Terre J. Werts', '7575787030', 'middle', '2300'),
(405, 9, 'Jolliff Middle School', 'JMS', 'Jolliff Road', 'Chesapeake', 'VA', 23321, 'US', 'Mr. Quentin E. Hicks', '7574651646', 'middle', '1021'),
(406, 9, 'Oscar Smith High School', 'OSH', 'Tiger Drive', 'Chesapeake', 'VA', 23320, 'US', 'Mr. Paul A. Joseph', '7575480696', 'high', '1994'),
(407, 9, 'Oscar Smith Middle School', 'OSM', 'Rodgers Street', 'Chesapeake', 'VA', 23324, 'US', 'Mrs. Judith C. Thurston', '7574947590', 'middle', '2500'),
(408, 9, 'Sparrow Road Intermediate', 'SRI', 'Sparrow Road', 'Chesapeake', 'VA', 23321, 'US', 'Ms. Sharon L. Popson', '7575787050', 'middle', '1605'),
(409, 9, 'Thurgood Marshall Elementary', 'TME', 'Border Road', 'Chesapeake', 'VA', 23324, 'US', 'Mrs. Karen Y. Lopez', '7574947515', 'elementary', '2706'),
(410, 9, 'Treakle Elementary School', 'TES', 'Gomerton Road', 'Chesapeake', 'VA', 23323, 'US', 'Mrs. Shelia J. Johnson', '7575585361', 'elementary', '2500'),
(411, 9, 'Truitt Intermediate School', 'TIS', 'Holly Avenue', 'Chesapeake', 'VA', 23324, 'US', 'Mrs. Kimberly G. Lowden', '7574948014', 'middle', '1100'),
(412, 9, 'Western Branch High School', 'WBH', 'Bruin Place', 'Chesapeake', 'VA', 23321, 'US', 'Dr. Thomas A. Whitley', '7576387904', 'high', '1968'),
(413, 9, 'Western Branch Intermediate', 'WBI', 'Terry Drive', 'Chesapeake', 'VA', 23321, 'US', 'Ms. Jataune N. Jones', '7576387941', 'middle', '4013'),
(414, 9, 'Western Branch Middle School', 'WBM', 'Hawksley Drive', 'Chesapeake', 'VA', 23321, 'US', 'Dr. Kambar Khoshaba', '7576387920', 'middle', '4201'),
(415, 9, 'Western Branch Primary', 'WBP', 'Terry Drive', 'Chesapeake', 'VA', 23321, 'US', 'Mrs. Gayle J. Bartlett', '7576387951', 'elementary', '4122'),
(436, 4, 'Plan Bee Academy', 'PBA', '4500 Peek Trail', 'Chesapeake ', 'Va', 23321, 'USA', 'NA', '9874563210', 'Alternative', '-'),
(437, 7, 'Rivermont School', 'RIV', '5163 Cleveland Street ', 'Virginia Beach', 'Va', 23462, 'United States', 'tbd', '497-4703', 'Alternative', ''),
(438, 3, 'Chesapeake SECEP/REED Center', 'SEC', '369 Battlefield Blvd. S', 'Chesapeake', 'Va', 23320, 'United States', 'Teresa', '892-6105', 'alternative', ''),
(439, 6, 'Oyster Point Academy', 'OYP', '766 J. Clyde Morris Blvd.', 'Newport News', 'Va', 23663, 'United States', 'Crystal Marable', '594-1580', 'alternative', ''),
(440, 9, 'Chesapeake SECEP/REED Center', 'SEC', '369 Battlefield Blvd. S', 'Chesapeake', 'Va', 23320, 'United States', 'Teresa', '892-6105', 'alternative', ''),
(441, 3, 'Plan Bee Academy', 'PBA', '4500 Peek Trail', 'Chesapeake ', 'Va', 23321, 'United States', 'Wendy Fitch', '757-375-1560', 'alternative', ''),
(442, 3, 'Greenbrier Middle School', 'GBM', '1016 Greenbrier Parkway', 'Chesapeake', 'Va', 23320, 'United States', 'NA', '757-548-5309', 'middle', ''),
(443, 10, 'Churchland High School', 'CHS', 'Cedar Lane', 'Portsmouth', 'VA', 23703, 'US', 'Mr. Shawn L. Millaci', '7576862500', 'high', '4301'),
(444, 10, 'I.C. Norcom High School', 'NOR', 'London Blvd', 'Portsmouth', 'VA', 23704, 'US', 'Dr. Laguna O. Foster', '7573935442', 'high', '1801'),
(445, 10, 'Woodrow Wilson High School', 'WWH', 'Elmhurst Lane', 'Portsmouth', 'VA', 23701, 'US', 'Mr. Timothy E. Johnson', '7574652907', 'high', '1401'),
(446, 10, 'Churchland Middle School', 'CMS', 'River Shore Road', 'Portsmouth', 'VA', 23703, 'US', 'Ms. Barbara R. Kimzey', '7576862512', 'middle', '4051'),
(447, 10, 'Cradock Middle School', 'CRD', 'Alden Avenue', 'Portsmouth', 'VA', 23702, 'US', 'Ms. Sonya C. Harrell', '7573938788', 'middle', '21'),
(448, 10, 'W.E. Waters Middle School', 'WEW', 'Roosevelt Blvd', 'Portsmouth', 'VA', 23701, 'US', 'Ms. Alice Graham', '7575582813', 'middle', '600'),
(449, 10, 'Brighton Elementary School', 'BES', 'Portsmouth Blvd', 'Portsmouth', 'VA', 23704, 'US', 'Mr. Arcelius Brickhouse', '7573938870', 'elementary', '1100'),
(450, 10, 'Churchland Academy', 'CAC', 'River Shore Road', 'Portsmouth', 'VA', 23703, 'US', 'Ms. Karen D. Clark', '7576862527', 'elementary', '4061'),
(451, 10, 'Churchland Elementary School', 'CES', 'Michael Lane', 'Portsmouth', 'VA', 23703, 'US', 'Dr. Jamill Ray Jones', '7576862523', 'elementary', '5601'),
(452, 10, 'Churchland Primary and Intermediate School', 'CPI', 'Hedgerow Lane', 'Portsmouth', 'VA', 23703, 'US', 'Ms. Rosalyn T. Exum', '7576862519', 'elementary', '5700'),
(453, 10, 'Douglass Park Elementary School', 'DGP', 'Grand Street', 'Portsmouth', 'VA', 23701, 'US', 'Ms. Dusti R. Johnson Brinker', '7573938646', 'elementary', '34'),
(454, 10, 'Hodges Manor Elementary School', 'HMN', 'Cherokee Road', 'Portsmouth', 'VA', 23701, 'US', 'Dr. Faye S. Felton', '7574652921', 'elementary', '1201'),
(455, 10, 'James Hurst Elementary School', 'JHE', 'Dahlgren Avenue', 'Portsmouth', 'VA', 23702, 'US', 'Mr. Morris L. Barco', '7575582811', 'elementary', '18'),
(456, 10, 'John Tyler Elementary School', 'JTE', 'Hartford Street', 'Portsmouth', 'VA', 23707, 'US', 'Ms. Heidi M. Lewis', '7573938879', 'elementary', '3649'),
(457, 10, 'Lakeview Elementary School', 'LKV', 'Horne Avenue', 'Portsmouth', 'VA', 23701, 'US', 'Dr. Camilla C. Ferebee', '7574652901', 'elementary', '1300'),
(458, 10, 'Park View Elementary School', 'PRV', 'Elm Avenue', 'Portsmouth', 'VA', 23704, 'US', 'Ms. Angela D. Flowers', '7573938647', 'elementary', '260'),
(459, 10, 'Simonsdale Elementary School', 'SES', 'Clifford Street', 'Portsmouth', 'VA', 23701, 'US', 'Ms. Darlene F. Bright', '7574652917', 'elementary', '4841'),
(460, 10, 'Victory Elementary School', 'VES', 'Greenwood Drive', 'Portsmouth', 'VA', 23701, 'US', 'Dr. J. Wayne Williams', '7573938806', 'elementary', '2828'),
(461, 10, 'Westhaven Elementary School', 'WST', 'Clifford Drive', 'Portsmouth', 'VA', 23707, 'US', 'Mr. Ralph K. Snowden', '7573938855', 'elementary', '3701'),
(462, 10, 'Churchland Preschool', 'CHP', 'River Shore Road', 'Portsmouth', 'VA', 23703, 'US', 'Ms. Robyn A. McIntyre', '7576862533', 'preschool', '4061'),
(463, 10, 'Emily Spong Preschool', 'ESP', 'Piedmont Avenue', 'Portsmouth', 'VA', 23704, 'US', 'Ms. Vanessa P. Whichard-Harris', '7573935247', 'preschool', '2200'),
(464, 10, 'Mount Hermon Preschool', 'MHP', 'North Street', 'Portsmouth', 'VA', 23707, 'US', 'Ms. Patricia S. Willilams', '7573938825', 'preschool', '3000'),
(465, 10, 'Olive Branch Preschool', 'OBP', 'Mimosa Road', 'Portsmouth', 'VA', 23701, 'US', 'Ms. Lois J. Rieckhoff', '7574652926', 'preschool', '415'),
(466, 10, 'Excel Campus', 'XCL', 'Elmhurst Lane', 'Portsmouth', 'VA', 23701, 'US', 'Ms. Sonji Hairston', '7574652958', 'alternative', '1401'),
(467, 10, 'New Directions Center', 'NDC', 'West Road', 'Portsmouth', 'VA', 23707, 'US', 'Mr. Horace L. Lambert, Jr.', '7573938728', 'alternative', '401');

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
(31, 14, 'Jaylen', 'Lane', '7', 'Male', 'Fred/Blanche ', 'Colston', '757-724-2682', '', '2201 Cobblestone Court', '', 'Chesapeake ', 'VA', '', 'United States'),
(32, 15, 'Luke Ahlgrim', 'Dorien Spruill', 'na', 'Other', 'Natalie', 'Ahlgrim', '757-582-6578', 'Michelle Owens 757-5', '3728 Cannon Point Drive', '4617 Old Fox Trail ', 'Chesapeake', 'VA', '', 'United States'),
(33, 16, 'Ramsey', 'Ammons', 'NA', 'Female', 'Kimberly ', 'Ammons', '757-288-8943', 'Richie Ammons 757-28', '332 Redbrick Drive', '', 'Chesapeake', 'Va', '23321', 'United States'),
(34, 17, 'Christopher', 'Barnes', 'NA', 'Male', 'Mark Bodoh', 'Elizabeth Barnes', '757-617-1921', '', '3213 Hemlock Drive', '', 'Chesapeake', 'Va', '23321', 'United States'),
(36, 19, 'Johnathan', 'Jackson', 'NA', 'Male', 'Nathaniel/Cassandra', 'Jackson', '757-739-5076', '', '804 Thorngate Court', '', 'Chesapeake', 'VA', '', 'United States'),
(37, 20, 'Judaea', 'Jones', 'NA', 'Male', 'Sandra', 'Jones', '757-339-9868', '757-366-9683', '2123 Rock Creek Drive', '', 'Chesapeake', 'VA', '', 'United States'),
(38, 21, 'Jacob', 'Jorgensen', 'NA', 'Male', 'Sonya', 'Reynolds (Foster)', '757-410-1969', '', '617 Margaret Drive', '', 'Chesapeake', 'VA', '', 'United States'),
(39, 22, 'Michael', 'Kelley', 'NA', 'Male', 'Edward\\Marie', 'Kelley', '757-839-2037', '', '816 Shetland Drive', '', 'Chesapeake', 'VA', '', 'United States'),
(40, 23, 'Ariel', 'Marks', 'NA', 'Female', 'Jennifer', 'Boulware', '1-602-478-3321', '', '400 Slate Street', '', 'Chesapeake', 'Va', '', 'United States'),
(41, 24, 'Ronnie', 'Parker', 'NA', 'Not Specif', 'Mary', 'Parker', '757-776-1013', '', '4115 Leyte Avenue', '', 'Chesapeake', 'VA', '', 'United States'),
(42, 25, 'Isabella', 'Pena', 'NA', 'Female', 'Lisa', 'Wray', '1-914-960-8536', '', '2605 Carolina Road ', '', 'Chesapeake', 'VA', '', 'United States'),
(43, 26, 'Irvin', 'Phillip', 'NA', 'Male', 'Latisha', 'Phillip', '757-402-6954', '', '1453 Perry Street Apt. B', '', 'Chesapeake', 'VA', '', 'United States'),
(44, 27, 'Robert', 'Pickney', 'NA', 'Male', 'Nancy', 'Pickney', '1-479-236-6438', '', '1805 Shell Drake Court', '', 'Chesapeake', 'VA', '', 'United States'),
(45, 28, 'Braden', 'Smith', 'NA', 'Male', 'Evelyn', 'Smith', '1-909-519-6359', '757-389-5556', '1903 Heathway Trail', '', 'Chesapeake', 'VA', '', 'United States'),
(46, 29, 'Samantha ', 'Stacknik', 'NA', 'Female', 'Shawna', 'Stacknik', '757-359-1285', '', '2404 Chesapeake Avenue', '', 'Chesapeake', 'VA', '', 'United States'),
(47, 30, 'Jacob ', 'Williams', 'NA', 'Male', 'Christopher', 'Williams', '757-735-4527', '', '1323 Decatur Street, Unit 1', '', 'Chesapeake', 'VA', '', 'United States'),
(48, 31, 'Marcus', 'Williams', 'NA', 'Male', 'Matika', 'Williams', '757-402-0932', '', '1205 Anne Avenue', '', 'Chesapeake', 'VA', '', 'United States'),
(49, 32, 'Justin', 'Walden', 'NA', 'Male', 'Linda', 'Walden', '757-227-0098', '', '1939 Martin Avenue', '', 'Chesapeake', 'VA', '', 'United States'),
(50, 33, 'Dade', 'Cline', 'NA', 'Male', 'Nicole/Justin', 'Cline', '757-909-1051', '1-843-870-6962', '820 Hummingbird Street', '', 'Chesapeake', 'VA', '', 'United States'),
(51, 34, 'Alaina', 'Reed', 'NA', 'Female', 'Demeatrice', 'Reed', '757-714-0865', '', '1217 Marge Drive', '', 'Chesapeake ', 'VA', '', 'United States'),
(52, 35, 'Jasmine', 'Mayfield', 'NA', 'Female', 'Rosalyn', 'Mayfield', '757-435-3008', '', '629 Trumpet Court', '', 'Chesapeake', 'VA', '', 'United States'),
(53, 36, 'Jacob', 'Carter', 'NA', 'Male', 'Rosemary ', 'Carter', '1-808-721-8912', '', '1418 Sabbath Lane', '', 'Chesapeake', 'VA', '', 'United States'),
(54, 37, 'Andrew', 'Byron', 'NA', 'Male', 'Sonya', 'Byron', '757-482-7579', '757-323-6259', '508 Aylesbury Drive', '', 'Chesapeake', 'VA', '', 'United States'),
(55, 38, 'Chance', 'Wallace', 'NA', 'Male', 'Susan', 'Wallace', '757-559-7050', '', '125 Hall Drive', '', 'Chesapeake', 'VA', '', 'United States'),
(56, 39, 'Jeremy', 'Wyatt', 'na', 'Male', 'Antonio/Juanita', 'Wilson', '757-752-7298', '', '5573 Old Providence Road ', '', 'Virginia Beach', 'VA', '', 'United States'),
(57, 40, 'Henry', 'Early', 'na', 'Male', 'Henry&Brooke', 'Early', '757-589-2412', '', '340 Sweetbay Drive', '', 'Chesapeake', 'VA', '', 'United States'),
(58, 41, 'Damien', 'Waters', 'na', 'Male', 'Kimberly', 'Waters', '757-630-2313', '', '613 Saddlehorn Drive', '', 'Chesapeake', 'VA', '', 'United States'),
(59, 42, 'Owen', 'Andrus', 'NA', 'Male', 'Ben&Elizabeth', 'Andrus', '757-763-0232', '', '936 Cogliandro Drive', '', 'Chesapeake', 'VA', '', 'United States'),
(60, 43, 'Denae', 'Ming', 'na', 'Female', 'Bruce&Devin', 'Ming', '757-779-8772', '', '3100 Walden Street', '', 'Chesapeake', 'VA', '', 'United States'),
(61, 44, 'Jamir', 'Rowson', 'na', 'Male', 'Tonya', 'Sexton', '757-962-4643', '', '4010 Brookland Drive, Apt. M', '', 'Chesapeake', 'VA', '', 'United States'),
(62, 45, 'Jared', 'Landis', 'NA', 'Male', 'Felisha', 'Landis', '757-450-5357', '', '652 River Creek Road', '', 'Chesapeake', 'VA', '', 'United States'),
(63, 46, 'Josiah', 'Griffin', 'NA', 'Male', 'Kermit&Glenda', 'Griffin', '757-545-2422', '', '200 Outlaw Street', '', 'Chesapeake', 'VA', '', 'United States'),
(64, 47, 'King', 'Seymore', 'NA', 'Male', 'Travis', 'Seymore', '1-575-318-0906', '', '1411 20th Street', '', 'Chesapeake', 'Va', '', 'United States'),
(65, 48, 'Jacob', 'Skeates', 'NA', 'Male', 'Donna', 'Skeates', '757-705-2102', '', '3613 Douglas Road', '', 'Chesapeake', 'VA', '', 'United States'),
(66, 49, 'Dashawn', 'Kee', 'NA', 'Male', 'Lakiesha', 'Kee', '757-292-9091', '757-953-6904(w)', '1004 Shelley Street, Apt. 1', '', 'Chesapeake', 'VA', '', 'United States'),
(67, 50, 'Cole', 'Munday', 'NA', 'Male', 'Jeanne&Troy', 'Munday', '757-647-8389', '757-647-1204', '608 Blackthorne Drive', '', 'Chesapeake', 'VA', '', 'United States'),
(68, 51, 'Shawna ', 'Avery', 'NA', 'Female', 'Tania', 'Avery', '757-228-8912', '', '2518 Applewood Lane', '', 'Chesapeake', 'VA', '', 'United States'),
(69, 52, 'Colin', 'Boyer', 'NA', 'Male', 'Nathan&Maki', 'Boyer', '1-808-343-2960', '1-740-552-4053', '825 Chapel Hill Drive', '', 'Chesapeake', 'VA', '', 'United States'),
(70, 53, 'Royal', 'Glover', 'NA', 'Male', 'Alecia', 'Hay', '1-251-604-0837', '', '693 George Washington Hwy., South', '', 'Chesapeake', 'VA', '', 'United States'),
(71, 54, 'Joseph', 'Jones', 'NA', 'Male', 'Everett & Tonya', 'Jones', '757-548-5652', '', '2014 Willow Point Arch', '', 'Chesapeake', 'VA', '', 'United States'),
(72, 55, 'Jada', 'Knight', 'NA', 'Female', 'Patrice', 'Knigh', '757-284-9670', '757-686-8498', '3405 Maori Drive', '', 'Chesapeake', 'VA', '', 'United States'),
(73, 56, 'Aubrey', 'Wiktorek', 'NA', 'Female', 'Emily', 'Spencer', '757-286-7265', '', '209 Bald Eagle Way, Apt. 101', '', 'Chesapeake', 'VA', '', 'United States'),
(74, 57, 'Nahom', 'Yoseph', 'NA', 'Male', 'Tsedey Woldegiorgis ', 'Yoseph Birku', '1-360-915-3331', '757-482-4108', '305 Lambardi Court', '', 'Chesapeake', 'VA', '', 'United States'),
(75, 58, 'Shiasia ', 'Hopkins', 'NA', 'Female', 'Tamika', 'Hopkins', '757-392-5554', '757-668-9254', '3803 Springbloom Drive', '', 'Portsmouth', 'VA', '23701', 'United States'),
(76, 59, '', '', '', '', 'Angela', 'Simmons', '757-673-3666 / 757-6', 'Isabella/Norma River', '6224 Hightower Road #E', '6509 Portsmouth Blvd.', 'Portsmouth ', 'VA', '23703/2370', 'United States'),
(77, 60, 'Terrell', 'Clark', '9th', 'Male', 'Nakia', 'Clark', '757-405-6419', '', '3113 Shell Road', '', 'Hampton', 'VA', '', 'United States'),
(78, 61, 'Jaylen', 'Liles', '9th', 'Male', 'LaWanda', 'Jones', '757-202-1788', 'Nina Saunders 757-66', '1046 Bryce Lane', '', 'Virginia Beach', 'VA', '', 'United States'),
(79, 18, 'Ethan', 'McIntosh', 'NA', 'Male', 'Kenneth/Katherine', 'McIntosh', '1-513-292-5996/ 1-51', 'Aimee Bolstad 1-360-', '801 Warbler Court ', '813 Warbler Court', 'Chesapeake', 'VA', '', 'United States'),
(80, 18, 'Jacob', 'Bolstad', 'NA', 'Male', 'Kenneth/Katherine', 'McIntosh', '1-513-292-5996/ 1-51', 'Aimee Bolstad 1-360-', '801 Warbler Court ', '813 Warbler Court', 'Chesapeake', 'VA', '', 'United States');

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
  `triplog_driver_payable` varchar(5) NOT NULL DEFAULT 'TRUE',
  `triplog_client_payable` varchar(5) NOT NULL DEFAULT 'TRUE'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lpr_triplog`
--

INSERT INTO `lpr_triplog` (`triplog_o_id`, `triplog_client_id`, `triplog_school_id`, `triplog_driver_id`, `triplog_studentid`, `triplog_tripid`, `triplog_city`, `triplog_time`, `triplog_pickloc`, `triplog_picktime`, `triplog_droptime`, `triplog_pax`, `triplog_status`, `triplog_date`, `triplog_clock`, `triplog_date_updated`, `triplog_driver_payable`, `triplog_client_payable`) VALUES
(14, 6, 436, 92, 31, 116, 'Chesapeake', '08:10:00', '2201 Cobblestone Court  Chesapeake  ', '13:47:12', '13:47:14', '1', 'success', '2017-08-09', 'AM', '2017-08-09', 'TRUE', 'TRUE'),
(14, 6, 436, 92, 31, 117, 'Chesapeake', '08:10:00', '2201 Cobblestone Court  Chesapeake  ', '14:06:37', '14:06:37', '1', 'success', '2017-08-24', 'AM', '2017-08-09', 'TRUE', 'TRUE'),
(14, 6, 436, 92, 31, 118, 'Chesapeake', '08:10:00', '2201 Cobblestone Court  Chesapeake  ', '08:10:00', '09:00:00', '1', 'none', '2017-08-23', 'AM', '2017-08-09', 'TRUE', 'TRUE'),
(14, 6, 436, 92, 31, 119, 'Chesapeake', '08:10:00', '2201 Cobblestone Court  Chesapeake  ', '11:49:05', '11:49:07', '1', 'success', '2017-08-16', 'AM', '2017-08-16', 'TRUE', 'TRUE');

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
(5, 'Hamp'),
(6, 'Suffolk'),
(7, 'Newport News');

-- --------------------------------------------------------

--
-- Table structure for table `nps`
--

CREATE TABLE `nps` (
  `acronym` varchar(10) NOT NULL,
  `school_name` varchar(100) NOT NULL,
  `street` varchar(200) NOT NULL,
  `address` varchar(20) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `zip` int(20) NOT NULL,
  `country` varchar(50) NOT NULL,
  `contact_name` varchar(50) NOT NULL,
  `contact_no` varchar(20) NOT NULL,
  `school_type` varchar(20) NOT NULL,
  `client_name` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nps`
--

INSERT INTO `nps` (`acronym`, `school_name`, `street`, `address`, `city`, `state`, `zip`, `country`, `contact_name`, `contact_no`, `school_type`, `client_name`) VALUES
('ATC', 'Advanced Technology Center', 'College Crescent', '1800', 'Virginia Beach', 'VA', 23453, 'US', 'Mr. Michael D. Taylor, Director', '757.648.5800', 'alternative', 7),
('ALE', 'Alanton Elementary', 'Stephens Road', '1441', 'Virginia Beach', 'VA', 23454, 'US', 'Ms. Charlene E. Garran', '757.648.2000', 'elementary', 7),
('ARE', 'Arrowhead Elementary', 'Susquehanna Drive', '5549', 'Virginia Beach', 'VA', 23462, 'US', 'Mr. Benjamin L. Gillikin', '757.648.2040', 'elementary', 7),
('BAE', 'Bayside Elementary', 'Bayside Road', '5649', 'Virginia Beach', 'VA', 23455, 'US', 'Ms. Catherine M. Brumm', '757.648.2080', 'elementary', 7),
('BAH', 'Bayside High', 'Haygood Road', '4960', 'Virginia Beach', 'VA', 23455, 'US', 'Mr. James D. Miller', '757.648.5200', 'high', 7),
('BAM', 'Bayside Middle', 'Newtown Road', '965', 'Virginia Beach', 'VA', 23462, 'US', 'Dr. Paula Johnson', '757.648.4400', 'middle', 7),
('BSG', 'Bayside Sixth Grade Campus', 'Jericho Road', '4722', 'Virginia Beach', 'VA', 23462, 'US', 'Ms. Camille A. Harmon', '757.648.4440', 'elementary', 7),
('BRD', 'Birdneck Elementary', 'S. Birdneck Road', '957', 'Virginia Beach', 'VA', 23451, 'US', 'Mr. Robert V. Yoshida', '757.648.2120', 'elementary', 7),
('BRN', 'Brandon Middle', 'Pope Street', '1700', 'Virginia Beach', 'VA', 23464, 'US', 'Ms. Christy E. McQueeney', '757.648.4450', 'middle', 7),
('BRK', 'Brookwood Elementary', 'S. Lynnhaven Road', '601', 'Virginia Beach', 'VA', 23452, 'US', 'Mrs. Christine C. Alarcon', '757.648.2160', 'elementary', 7),
('CNT', 'Centerville Elementary', 'Centerville Turnpike', '2201', 'Virginia Beach', 'VA', 23464, 'US', 'Ms. Teresa A. Ritzel', '757.648.2200', 'elementary', 7),
('CFE', 'Christopher Farms Elementary', 'Pleasant Acres Drive', '2828', 'Virginia Beach', 'VA', 23453, 'US', 'Ms. Teri A. Breaux', '757.648.2240', 'elementary', 7),
('CPE', 'College Park Elementary', 'Bennington Road', '1110', 'Virginia Beach', 'VA', 23464, 'US', 'Dr. Sterling A. White, Jr.', '757.648.2280', 'elementary', 7),
('CKE', 'Cooke Elementary', 'Mediterranean Avenue', '1501', 'Virginia Beach', 'VA', 23451, 'US', 'Mrs. Pamela M. Bennis', '757.648.2320', 'elementary', 7),
('CLE', 'Corporate Landing Elementary', 'Corporate Landing Pkwy', '1590', 'Virginia Beach', 'VA', 23454, 'US', 'Ms. Kelly W. Coon', '757.648.2360', 'elementary', 7),
('CLM', 'Corporate Landing Middle', 'Corporate Landing Pkwy', '1597', 'Virginia Beach', 'VA', 23454, 'US', 'Dr. Freddie P. Alarcon, Jr.', '757.648.4500', 'middle', 7),
('COX', 'Cox High', 'Shorehaven Drive', '2425', 'Virginia Beach', 'VA', 23454, 'US', 'Dr. Randi R. Riesbeck', '757.648.5250', 'high', 7),
('CRD', 'Creeds Elementary', 'Princess Anne Road', '920', 'Virginia Beach', 'VA', 23457, 'US', 'Ms. Casey L. Conger', '757.648.2400', 'elementary', 7),
('DEY', 'Dey Elementary', 'N. Great Neck Road', '1900', 'Virginia Beach', 'VA', 23454, 'US', 'Ms. Elizabeth C. Bianchi', '757.648.2440', 'elementary', 7),
('DSE', 'Diamond Springs Elementary', 'Learning Circle', '5225', 'Virginia Beach', 'VA', 23462, 'US', 'Ms. Gloria Coston', '757.648.4240', 'elementary', 7),
('FFE', 'Fairfield Elementary', 'Providence Road', '5428', 'Virginia Beach', 'VA', 23464, 'US', 'Mr. Douglas Knapp', '757.648.2480', 'elementary', 7),
('FCH', 'First Colonial High', 'Mill Dam Road', '1272', 'Virginia Beach', 'VA', 23454, 'US', 'Dr. Nancy B. Farrell', '757.648.5300', 'high', 7),
('GLD', 'Glenwood Elementary', 'Round Hill Drive', '2213', 'Virginia Beach', 'VA', 23464, 'US', 'Dr. Karin E. DiMaggio', '757.648.2520', 'elementary', 7),
('GNM', 'Great Neck Middle', 'North Great Neck Road', '1848', 'Virginia Beach', 'VA', 23454, 'US', 'Dr. Eugene F. Soltner', '757.648.4550', 'middle', 7),
('GRC', 'Green Run Collegiate', 'Dahlia Drive', '1700', 'Virginia Beach', 'VA', 23453, 'US', 'Mrs. Barbara J. Winn', '757.648.5393', 'pilot', 7),
('GRE', 'Green Run Elementary', 'Green Garden Circle', '1200', 'Virginia Beach', 'VA', 23453, 'US', 'Ms. Sheila M. Wynn', '757.648.2560', 'elementary', 7),
('GRH', 'Green Run High', 'Dahlia Drive', '1700', 'Virginia Beach', 'VA', 23453, 'US', 'Mr. C. Todd Tarkenton', '757.648.5350', 'high', 7),
('HRM', 'Hermitage Elementary', 'Pleasure House Road', '1701', 'Virginia Beach', 'VA', 23455, 'US', 'Mrs. Holly J. Coggin', '757.648.2600', 'elementary', 7),
('HOL', 'Holland Elementary', 'Holland Road', '3340', 'Virginia Beach', 'VA', 23452, 'US', 'Dr. Callie M. Richardson', '757.648.2640', 'elementary', 7),
('IND', 'Independence Middle', 'Dunstan Lane', '1370', 'Virginia Beach', 'VA', 23455, 'US', 'Mr. Carey Manugo', '757.648.4600', 'middle', 7),
('ILE', 'Indian Lakes Elementary', 'Homestead Drive', '1240', 'Virginia Beach', 'VA', 23464, 'US', 'Ms. Jennifer C. Born', '757.648.2680', 'elementary', 7),
('KEL', 'Kellam High', 'West Neck Rd', '2662', 'Virginia Beach', 'VA', 23456, 'US', 'Dr. Daniel W. Smith', '757.648.5100', 'high', 7),
('KEE', 'Kempsville Elementary', 'Kempsville Road', '570', 'Virginia Beach', 'VA', 23464, 'US', 'Ms. Lori S. Hasher', '757.648.2720', 'elementary', 7),
('KEH', 'Kempsville High', 'Chief Trail', '5194', 'Virginia Beach', 'VA', 23464, 'US', 'Mr. William W. Harris', '757.648.5450', 'high', 7),
('KME', 'Kempsville Meadows Elementary', 'Edwin Drive', '736', 'Virginia Beach', 'VA', 23462, 'US', 'Mr. Mikelle C. Williams', '757.648.2760', 'elementary', 7),
('KEM', 'Kempsville Middle', 'Churchill Drive', '860', 'Virginia Beach', 'VA', 23464, 'US', 'Dr. Patti T. Jenkins', '757.648.4700', 'middle', 7),
('KGE', 'Kings Grant Elementary', 'N. Lynnhaven Road', '612', 'Virginia Beach', 'VA', 23452, 'US', 'Ms. Lisa D. Hannah', '757.648.2800', 'elementary', 7),
('KNG', 'Kingston Elementary', 'King\'s Grant Road', '3532', 'Virginia Beach', 'VA', 23452, 'US', 'Dr. Sharon H. Shewbridge', '757.648.2840', 'elementary', 7),
('LNE', 'Landstown Elementary', 'Recreation Drive', '2212', 'Virginia Beach', 'VA', 23456, 'US', 'Mr. Jeffrey D. Hofmann', '757.648.2880', 'elementary', 7),
('LNH', 'Landstown High', 'Concert Drive', '2001', 'Virginia Beach', 'VA', 23456, 'US', 'Dr. Cheryl C. Askew', '757.648.5500', 'high', 7),
('LNM', 'Landstown Middle', 'Recreation Drive', '2204', 'Virginia Beach', 'VA', 23456, 'US', 'Mr. John T. Parkman', '757.648.4750', 'middle', 7),
('LRK', 'Larkspur Middle', 'Princess Anne Road', '4696', 'Virginia Beach', 'VA', 23462, 'US', 'Dr. Melanie J. Hamblin', '757.648.4800', 'middle', 7),
('LNK', 'Linkhorn Park Elementary', 'First Colonial Road', '977', 'Virginia Beach', 'VA', 23454, 'US', 'Ms. Barbara Sessoms', '757.648.2920', 'elementary', 7),
('LUX', 'Luxford Elementary', 'Haygood Road', '4808', 'Virginia Beach', 'VA', 23455, 'US', 'Ms. Danielle E. Colucci', '757.648.2960', 'elementary', 7),
('LNE', 'Lynnhaven Elementary', 'Dillon Drive', '210', 'Virginia Beach', 'VA', 23452, 'US', 'Mrs. Katherine R. Everett', '757.648.3000', 'elementary', 7),
('LNM', 'Lynnhaven Middle', 'Bayne Drive', '1250', 'Virginia Beach', 'VA', 23454, 'US', 'Dr. Violet B. Hoyle', '757.648.4850', 'middle', 7),
('MAL', 'Malibu Elementary', 'Edinburgh Drive', '3632', 'Virginia Beach', 'VA', 23452, 'US', 'Mr. Michael Maloney', '757.648.3040', 'elementary', 7),
('NCE', 'New Castle Elementary', 'Dam Neck Road', '4136', 'Virginia Beach', 'VA', 23456, 'US', 'Ms. Gloria Harris', '757.648.3080', 'elementary', 7),
('NEW', 'Newtown Elementary', 'Learning Circle', '5277', 'Virginia Beach', 'VA', 23462, 'US', 'Mr. Richard Sidone, Interim', '757.648.3120', 'elementary', 7),
('NLE', 'North Landing Elementary', 'North Landing Road', '2929', 'Virginia Beach', 'VA', 23456, 'US', 'Ms. Jill S. Barger', '757.648.3160', 'elementary', 7),
('OLE', 'Ocean Lakes Elementary', 'Upton Drive', '1616', 'Virginia Beach', 'VA', 23454, 'US', 'Dr. Linda Reese', '757.648.3200', 'elementary', 7),
('OLH', 'Ocean Lakes High', 'Schumann Drive', '885', 'Virginia Beach', 'VA', 23454, 'US', 'Dr. Claire R. LeBlanc', '757.648.5550', 'high', 7),
('ODH', 'Old Donation School', 'Honeygrove Road', '4633', 'Virginia Beach', 'VA', 23455, 'US', 'Dr. Kelly A. Hedrick', '757.648.3240', 'alternative', 7),
('PRK', 'Parkway Elementary', 'O\'Hare Drive', '4180', 'Virginia Beach', 'VA', 23453, 'US', 'Mrs. Krista Barton-Arnold', '757.648.3280', 'elementary', 7),
('PME', 'Pembroke Elementary', 'Jericho Road', '4622', 'Virginia Beach', 'VA', 23462, 'US', 'Dr. Linda Hayes', '757.648.3320', 'elementary', 7),
('PMM', 'Pembroke Meadows Elementary', 'Cathedral Drive', '820', 'Virginia Beach', 'VA', 23455, 'US', 'Dr. Charles L. Spivey', '757.648.3360', 'elementary', 7),
('PLZ', 'Plaza Middle', 'S. Lynnhaven Road', '3080', 'Virginia Beach', 'VA', 23452, 'US', 'Mr. Rodney Joe Burnsworth', '757.648.4900', 'middle', 7),
('POV', 'Point O View Elementary', 'Parliament Drive', '5400', 'Virginia Beach', 'VA', 23462, 'US', 'Mr. John T. Chowns', '757.648.3440', 'elementary', 7),
('PAE', 'Princess Anne Elementary', 'Seaboard Road', '2444', 'Virginia Beach', 'VA', 23456, 'US', 'Mr. Patrick I. Wroton', '757.648.3480', 'elementary', 7),
('PAH', 'Princess Anne High', 'Virginia Beach Blvd.', '4400', 'Virginia Beach', 'VA', 23462, 'US', 'Mr. Danny M. Little', '757.648.5600', 'high', 7),
('PAM', 'Princess Anne Middle', 'Holland Road', '2323', 'Virginia Beach', 'VA', 23453, 'US', 'Dr. D. Alex Bergren', '757.648.4950', 'middle', 7),
('PRV', 'Providence Elementary', 'Providence Road', '4968', 'Virginia Beach', 'VA', 23464, 'US', 'Mr. Michael A. Taylor', '757.648.3520', 'elementary', 7),
('RME', 'Red Mill Elementary', 'Sandbridge Road', '1860', 'Virginia Beach', 'VA', 23456, 'US', 'Dr. Michelle L. Miller', '757.648.3560', 'elementary', 7),
('REN', 'Renaissance Academy', 'Cleveland Street', '5100', 'Virginia Beach', 'VA', 23462, 'US', 'Ms. Kay L. Thomas', '757-648-6000', 'alternative', 7),
('ROS', 'Rosemont Elementary', 'Rosemont Road', '1257', 'Virginia Beach', 'VA', 23453, 'US', 'Ms. Cari A. Hall', '757.648.3600', 'elementary', 7),
('RFE', 'Rosemont Forest Elementary', 'Grey Friars Chase', '1716', 'Virginia Beach', 'VA', 23456, 'US', 'Mr. Gregory Furlich', '757.648.3640', 'elementary', 7),
('SLE', 'Salem Elementary', 'Salem Lakes Blvd.', '3961', 'Virginia Beach', 'VA', 23456, 'US', 'Dr. Ann Shufflebarger', '757.648.3680', 'elementary', 7),
('SLH', 'Salem High', 'SunDevil Drive', '1993', 'Virginia Beach', 'VA', 23464, 'US', 'Mr. Matthew Delaney', '757.648.5650', 'high', 7),
('SLM', 'Salem Middle', 'Lynnhaven Parkway', '2380', 'Virginia Beach', 'VA', 23464, 'US', 'Dr. James J. Smith', '757.648.5000', 'middle', 7),
('SEA', 'Seatack Elementary', 'S. Birdneck Road', '912', 'Virginia Beach', 'VA', 23451, 'US', 'Mr. Vincent M. Darby, Sr.', '757.648.3720', 'elementary', 7),
('SPE', 'Shelton Park Elementary', 'Shelton Road', '1700', 'Virginia Beach', 'VA', 23455, 'US', 'Ms. Tara M. Brewer', '757.648.3760', 'elementary', 7),
('STR', 'Strawbridge Elementary', 'Strawbridge Road', '2553', 'Virginia Beach', 'VA', 23456, 'US', 'Ms. Jacqueline Y. Sargent', '757.648.3800', 'elementary', 7),
('TLE', 'Tallwood Elementary', 'Kempsville Road', '2025', 'Virginia Beach', 'VA', 23464, 'US', 'Mr. David B. French', '757.648.3840', 'elementary', 7),
('TLH', 'Tallwood High', 'Kempsville Road', '1668', 'Virginia Beach', 'VA', 23464, 'US', 'Dr. James Avila', '757.648.5700', 'high', 7),
('TEC', 'Technical and Career Education Center', 'North Landing Road', '2925', 'Virginia Beach', 'VA', 23456, 'US', 'Mr. David C. Swanger, Director', '757.648.5850', 'alternative', 7),
('THA', 'Thalia Elementary', 'Thalia Road', '421', 'Virginia Beach', 'VA', 23452, 'US', 'Dr. Mary Daniels, Interim', '757.648.3880', 'elementary', 7),
('THE', 'Thoroughgood Elementary', 'Dunstan Lane', '1444', 'Virginia Beach', 'VA', 23455, 'US', 'Dr. Cheryl Zigrang', '757.648.3920', 'elementary', 7),
('TOE', 'Three Oaks Elementary', 'Elson Green Avenue', '2201', 'Virginia Beach', 'VA', 23456, 'US', 'Ms. Linda L. Sidone', '757.648.3960', 'elementary', 7),
('TRN', 'Trantwood Elementary', 'Inlynnview Road', '2344', 'Virginia Beach', 'VA', 23454, 'US', 'Ms. Lou Anne Metzger', '757.648-4000', 'elementary', 7),
('JDC', 'Virginia Beach Juvenile Detention Center/Education Program', 'George Mason Drive', '2533', 'Virginia Beach', 'VA', 23456, 'US', 'Mr. Charles Foster', '757.263.1203', 'alternative', 7),
('VBM', 'Virginia Beach Middle', '25th Street', '600', 'Virginia Beach', 'VA', 23451, 'US', 'Dr. Sandra R. Brown', '757.648.5050', 'middle', 7),
('WHO', 'White Oaks Elementary', 'Windsor Oaks Blvd.', '960', 'Virginia Beach', 'VA', 23462, 'US', 'Mrs. Stephanie D. Haus', '757.648.4040', 'elementary', 7),
('WLM', 'Williams Elementary', 'Newtown Road', '892', 'Virginia Beach', 'VA', 23462, 'US', 'Mr. Timothy Sullivan', '757.648.4080', 'elementary', 7),
('WOE', 'Windsor Oaks Elementary', 'Van Buren Drive', '3800', 'Virginia Beach', 'VA', 23452, 'US', 'Dr. Sherri Archer', '757.648.4120', 'elementary', 7),
('WWE', 'Windsor Woods Elementary', 'Presidential Blvd.', '233', 'Virginia Beach', 'VA', 23452, 'US', 'Mr. Matthew A. Orebaugh', '757.648.4160', 'elementary', 7),
('WOD', 'Woodstock Elementary', 'Providence Road', '6016', 'Virginia Beach', 'VA', 23464, 'US', 'Ms. Amy N. Hedrick', '757.648.4200', 'elementary', 7);

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
  ADD PRIMARY KEY (`bill_id`),
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
-- Indexes for table `lpr_invoice`
--
ALTER TABLE `lpr_invoice`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indexes for table `lpr_order`
--
ALTER TABLE `lpr_order`
  ADD PRIMARY KEY (`o_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `school_id` (`school_id`),
  ADD KEY `driver_id` (`driver_id`),
  ADD KEY `o_reqby` (`o_reqby`),
  ADD KEY `ra_id` (`ra_id`);

--
-- Indexes for table `lpr_payroll`
--
ALTER TABLE `lpr_payroll`
  ADD PRIMARY KEY (`pl_id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- Indexes for table `lpr_rates`
--
ALTER TABLE `lpr_rates`
  ADD PRIMARY KEY (`rate_id`),
  ADD KEY `zone_id` (`zone_id`);

--
-- Indexes for table `lpr_ridealong`
--
ALTER TABLE `lpr_ridealong`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `ad_tripid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lpr_billing`
--
ALTER TABLE `lpr_billing`
  MODIFY `bill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;
--
-- AUTO_INCREMENT for table `lpr_cashadvance`
--
ALTER TABLE `lpr_cashadvance`
  MODIFY `c_advanceid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT for table `lpr_client`
--
ALTER TABLE `lpr_client`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `lpr_dates`
--
ALTER TABLE `lpr_dates`
  MODIFY `dates_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lpr_driver`
--
ALTER TABLE `lpr_driver`
  MODIFY `driver_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;
--
-- AUTO_INCREMENT for table `lpr_invoice`
--
ALTER TABLE `lpr_invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=538;
--
-- AUTO_INCREMENT for table `lpr_order`
--
ALTER TABLE `lpr_order`
  MODIFY `o_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT for table `lpr_payroll`
--
ALTER TABLE `lpr_payroll`
  MODIFY `pl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `lpr_rates`
--
ALTER TABLE `lpr_rates`
  MODIFY `rate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `lpr_ridealong`
--
ALTER TABLE `lpr_ridealong`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lpr_school`
--
ALTER TABLE `lpr_school`
  MODIFY `school_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=505;
--
-- AUTO_INCREMENT for table `lpr_student`
--
ALTER TABLE `lpr_student`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT for table `lpr_triplog`
--
ALTER TABLE `lpr_triplog`
  MODIFY `triplog_tripid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;
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

--
-- Constraints for table `lpr_order`
--
ALTER TABLE `lpr_order`
  ADD CONSTRAINT `lpr_order_ibfk_5` FOREIGN KEY (`ra_id`) REFERENCES `lpr_ridealong` (`id`);

--
-- Constraints for table `lpr_payroll`
--
ALTER TABLE `lpr_payroll`
  ADD CONSTRAINT `lpr_payroll_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `lpr_driver` (`driver_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
