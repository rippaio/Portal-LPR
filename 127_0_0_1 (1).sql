-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2017 at 04:47 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--
DROP DATABASE IF EXISTS `library`;
CREATE DATABASE IF NOT EXISTS `library` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `library`;

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `bookid` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `onloan` tinyint(1) DEFAULT NULL,
  `duedate` date DEFAULT NULL,
  `borrowerid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`bookid`, `title`, `author`, `onloan`, `duedate`, `borrowerid`) VALUES
(1, 'Harry Potter and the Goblet of Fire', 'J. K. Rowling', 0, NULL, NULL),
(2, 'Harry Potter and the Half-Blood Prince', 'J.K. Rowling', 0, NULL, NULL),
(3, 'Wind in the Willows', 'Kenneth Grahame', 0, NULL, NULL),
(4, 'Great Expectations', 'Charles Dickens', 0, NULL, NULL),
(5, 'A Christmas Carol', 'Charles Dickens', 0, NULL, NULL),
(6, 'Knots and Crosses', 'Ian Rankin', 0, NULL, NULL),
(7, 'The Hanging Garden', 'Ian Rankin', 0, NULL, NULL),
(8, 'Othello', 'William Shakespeare', 0, NULL, NULL),
(9, 'Twelfth Night', 'Willliam Shakespeare', 0, NULL, NULL),
(10, 'Macbeth', 'William Shakespeare', 0, NULL, NULL),
(11, 'King Henry V', 'Willliam Shakespeare', 0, NULL, NULL),
(12, 'Java in a Nutshell', 'David Flanagan', 0, NULL, NULL),
(13, 'Modern Operating Systems', 'Andy Tanenbaum', 0, NULL, NULL),
(14, 'Linux System Programming', 'Robert Love', 0, NULL, NULL),
(15, 'SUSE Linux', 'Chris Brown', 0, NULL, NULL),
(16, 'PHP and MySQL', 'Welling and Thomson', 0, NULL, NULL),
(17, 'High Performance MySQL', 'Schwartz et al', 0, NULL, NULL),
(18, 'PHP 5 for Dummies', 'Janet Valade', 0, NULL, NULL),
(19, 'Computer Security', 'Stallings and Brown', 0, NULL, NULL),
(20, 'Network Security Essentials', 'William Stallings', 0, NULL, NULL),
(21, 'The Casual Vacancy', 'J. K. Rowling', 0, NULL, NULL),
(22, 'Home Plumbing Manual', 'Andy Blackwell', 0, NULL, NULL),
(23, 'Self-sufficiency Home Brewing', 'John Parkes', 0, NULL, NULL),
(24, 'Notes From a Small Island', 'Bill Bryson', 0, NULL, NULL),
(25, 'A Short History or Nearly Everything', 'Bill Bryson', 0, NULL, NULL),
(26, 'A Walk in the Woods', 'Bill Bryson', 0, NULL, NULL),
(27, 'The Lost Continent', 'Bill Bryson', 0, NULL, NULL),
(28, 'So Long, and Thanks for all the Fish', 'Douglas Adams', 0, NULL, NULL),
(29, 'Life, the Universe and Everything', 'Douglas Adams', 0, NULL, NULL),
(30, 'The Salmon of Doubt', 'Douglas Adams', 0, NULL, NULL),
(31, 'The Girl with the Dragon Tattoo', 'Stieg Larsson', 0, NULL, NULL),
(32, 'The Girl who Played with Fire', 'Stieg Larsson', 0, NULL, NULL),
(33, 'The Deans Watch', 'Elizabeth Goudge', 0, NULL, NULL),
(34, 'Pilgrims Inn', 'Elizabeth Goudge', 0, NULL, NULL),
(35, 'The Colour of Magic', 'Terry Pratchett', 0, NULL, NULL),
(36, 'Dodger', 'Terry Pratchett', 0, NULL, NULL),
(37, 'The Light Fantastic', 'Terry Pratchett', 0, NULL, NULL),
(38, 'Childhoods End', ' Arthur C. Clarke', 0, NULL, NULL),
(39, 'Rendezvous with Rama', 'Arthur C. Clarke', 0, NULL, NULL),
(40, '2001: A Space Odyssey', 'Arthur C. Clarke', 0, NULL, NULL),
(41, 'I, Robot', 'Isaac Asimov', 0, NULL, NULL),
(42, 'The Caves of Steel', 'Isaac Asimov', 0, NULL, NULL),
(43, 'Dune', 'Frank Herbert', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `borrowers`
--

CREATE TABLE `borrowers` (
  `borrowerid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `borrowers`
--

INSERT INTO `borrowers` (`borrowerid`, `name`, `address`) VALUES
(100, 'Homer Simpson', '742 Evergreen Terrace, Springfield'),
(101, 'John Doe', '54 High Street, Bagshot'),
(102, 'Jane Smith', '5 Church Lane, Hambridge'),
(103, 'Henry Higgins', '14 Mayfair');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`bookid`),
  ADD KEY `borrowerid` (`borrowerid`);

--
-- Indexes for table `borrowers`
--
ALTER TABLE `borrowers`
  ADD PRIMARY KEY (`borrowerid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `bookid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `borrowers`
--
ALTER TABLE `borrowers`
  MODIFY `borrowerid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`borrowerid`) REFERENCES `borrowers` (`borrowerid`);
--
-- Database: `lpr_portal`
--
DROP DATABASE IF EXISTS `lpr_portal`;
CREATE DATABASE IF NOT EXISTS `lpr_portal` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `lpr_portal`;

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
(1, 'Lyrissa', 'N', 'Anderson', '7758 Ogden Avenue', 'Apt H', 'Norfolk', '23505', '7578313016', '223617155', 'A60509063', 'VA', '', 0.25, '', 'wq', '', 'VA', 'US', '2017-07-12', '2017-07-31', '', 'active', ''),
(2, 'Monica', 'A-N', 'Anderson', '952 Lake Village Drive', 'Apt F', 'Chesapeake', '23323', '7573227217', '145782747', '60590975', 'VA', '7573481663', 0.25, 'Monica', 'Azarai', 'Anderson', 'VA', 'US', '0000-00-00', '0000-00-00', '61', 'active', ''),
(3, 'Willette', 'A', 'Anderson', '8839 Mariners Cove', 'Apt C', 'Norfolk', '23503', '7573241001', '228479735', 'T60554163', 'VA', '', 0.25, 'Willitt', 'h', '', 'VA', 'US', '2017-07-07', '2017-07-31', '37', 'active', ''),
(4, 'Cornelius', '', 'Allen', '6406 Clare Road', '', 'Norfolk', '23513', '7577171228', '230175881', 'T60583125', 'VA', '7574040047', 0.25, 'Cornelius', 'Russell Allen', 'father', 'VA', 'US', '0000-00-00', '0000-00-00', '54', 'active', ''),
(5, 'Helen', '', 'Barriteau', '405 Dauphin Lane', '', 'Virginia Beach', '23451', '7573553377', '230786552', 'T24618296', 'VA', '7573217241', 0.25, 'Helen', 'Bessie Sweat', 'mother', 'VA', 'US', '0000-00-00', '0000-00-00', '20', 'active', ''),
(6, 'Yvette', 'D', 'Branch', '901 Roseclair Street', '', 'Norfolk', '23523', '7577795100', '23608337', 'T62603056', 'VA', '', 0.25, 'Yvette', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '43', 'active', ''),
(7, 'Kenneth', '', 'Bond', '2844 Middle Town Crescent', '', 'Norfolk', '23504', '7577376007', '', 'T60545530', 'VA', '', 0.25, 'Boyd', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '100', 'active', ''),
(8, 'Shamika', '', 'Benton', '621 Geneva Avenue', 'Apt B', 'Chesapeake', '23323', '7577696541', '228313444', 'T62644277', 'VA', '', 0.25, 'Shamika', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '73', 'active', ''),
(9, 'Avis', 'U', 'Boone-Paul', '516 Timothy Avenue', 'Apt A', 'Norfolk', '23505', '7579443791', '226490128', 'T61560052', 'VA', '', 0.25, '', 'rrr', '', 'VA', 'US', '2017-07-12', '0000-00-00', '', 'active', ''),
(10, 'Jay', 'L', 'Barnes', '910 Bainbridge Boulevard', '', 'Norfolk', '23523', '7577357371', '224069762', 'A23828116', 'VA', '', 0.25, 'Jay', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '30', 'active', ''),
(11, 'Antaysha', 'R', 'Barnes', '3901 Krick Street', '', 'Norfolk', '23513', '7577388232', '231791468', 'A60569852', 'VA', '', 0, '', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '', 'active', ''),
(12, 'LaJuana', 'N', 'Brown', '2669 Azalea Garden Road', '', 'Norfolk', '23513', '7573192044', '223251378', 'A60557593', 'VA', '', 0.25, 'Nicky', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '5', 'active', ''),
(13, 'Diane', 'G', 'Barnhill', '1817 Bracey Street', '', 'Norfolk', '23504', '7577768659', '192542770', 'T60554457', 'VA', '', 0.25, 'Diane', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '53', 'active', ''),
(14, 'Lenton', '', 'Barnhill', '1817 Bracey Street', '', 'Norfolk', '23504', '7575508073', '230668413', 'T60554457', 'VA', '', 0.25, '', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '', 'active', ''),
(15, 'Patrice', 'D', 'Bradley', '13 Grady Crescent', '', 'Chesapeake', '23324', '7576067574', '226175906', 'T62635943', 'VA', '', 0.25, 'Patrice', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', 'N100', 'active', ''),
(16, 'Ronnette', 'S', 'Barnes', '952 Wolcott Avenue', '', 'Norfolk', '23513', '7573090602', '224194182', 'T60582347', 'VA', '', 0.25, 'Ronette', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '79', 'active', ''),
(17, 'Katrina', 'L', 'Brown', '1538 Norcova Avenue', '', 'Norfolk', '23502', '7577083903', '229047322', 'T60583388', 'VA', '', 0.25, '', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '', 'active', ''),
(18, 'Tamara', 'N', 'Bennett', '1023 E. Leicester Avenue', '', 'Norfolk', '23503', '7577386515', '225393684', 'T60361787', 'VA', '', 0.25, 'Tamera', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '11', 'active', ''),
(19, 'Cheryl', 'M', 'Boone', '733 Alder Circle', '', 'Virginia Beach', '23462', '7575810481', '226042912', 'T67250067', 'VA', '', 0.25, 'Cherly', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '62', 'active', ''),
(20, 'Tiana', 'K', 'Chapman', '1109 Hillside Avenue', 'Unit D', 'Norfolk', '23503', '7579983414', '229575714', 'A60506574', 'VA', '', 0.25, 'Tiana', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '18', 'active', ''),
(21, 'Barbara', 'A', 'Crandell', '3324 Kansas Avenue', 'Apt A', 'Norfolk', '23513', '7577293983', '225060206', 'E23854728', 'VA', '', 0.25, '', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '', 'active', ''),
(22, 'Janice', 'R', 'Cruz', '1809 Ramsey Road', '', 'Norfolk', '23503', '7572377353', '584668459', 'A60529301', 'VA', '', 0.25, 'Janice', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '56', 'active', ''),
(23, 'Tarnesha', 'M', 'Carlisle', '512 Grantham Road', 'Apt C', 'Norfolk', '23505', '7579980801', '223219420', 'T60569630', 'VA', '', 0.25, '', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '', 'active', ''),
(24, 'Dollie', 'A', 'Cherry', '611 Goff Street', '', 'Norfolk', '23510', '7574072483', '224942499', 'T62698809', 'VA', '', 0.25, 'Dollie', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '95', 'active', ''),
(25, 'Sue', 'E', 'Coward', '1154 Virginia Beach Blvd.', '# 42', 'Virginia Beach', '23451', '7573587041', '167547186', 'A61607915', 'VA', '', 0.25, 'Sue', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '63', 'active', ''),
(26, 'DeSheena', 'M', 'Cobb', '633 Mariners Way', '# F', 'Norfolk', '23503', '7578422038', '217040114', 'T60537955', 'VA', '', 0.25, 'Sheena', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '45', 'active', ''),
(27, 'Ebony', 'K', 'Cornick', '2909 Llewellyn Avenue', '# 2', 'Norfolk', '23504', '7572744258', '226470370', 'A60511709', 'VA', '', 0.25, 'Ebony', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '10', 'active', ''),
(28, 'Monecia', 'L', 'Dennis', '3048 Parkside Drive', '', 'Chesapeake', '23324', '7575811537', '223612498', 'A60535338', 'VA', '', 0.25, 'Monicia', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '38', 'active', ''),
(29, 'Marcia', 'D', 'Douglas', '3413 Stancil Street', '', 'Virginia Beach', '23452', '7579759461', '165648342', 'T67238830', 'VA', '7576960451', 0.25, 'Marcia', 'David Douglas', 'father', 'VA', 'US', '0000-00-00', '0000-00-00', '77', 'active', ''),
(30, 'Courtney', 'B', 'Darden', '51 Ridge Wood Drive', '', 'Hampton', '23666', '7578690732', '223194653', 'A60317229', 'VA', '', 0.25, 'Courtney', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '93', 'active', ''),
(31, 'Janika', 'R', 'Dreweey', '4277 Taylor Road', 'Apt J1', 'Chesapeake', '23321', '7572860829', '225576744', 'T60666711', 'VA', '7573583796', 0.25, 'Janika', 'Sharon Drewery', 'mother', 'VA', 'US', '0000-00-00', '0000-00-00', 'P01', 'active', ''),
(32, 'Lashona', 'D', 'Daughtry', '500 Edwards Street', 'Apt N', 'Portsmouth', '23704', '7576091013', '223115075', 'T60657340', 'VA', '', 0.25, '', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '', 'active', ''),
(33, 'Latoya', 'N', 'Deal', '1536 Nevada Avenue', 'Apt A', 'Norfolk', '23502', '7573535899', '229411855', 'T60587128', 'VA', '', 0.25, 'Deal', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '36', 'active', ''),
(34, 'Kimberly', 'D', 'Daniels', '2917 Fireside Road', '# 4', 'Chesapeake', '23324', '7575895089', '226279760', 'A62120845', 'VA', '', 0.25, 'Kim', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '75', 'active', ''),
(35, 'Iesha', '', 'Davis', '', '', '', '', '', '', '', '', '', 0.25, 'Iesha', '', '', '', 'US', '0000-00-00', '0000-00-00', '68', 'active', ''),
(36, 'Brittany', 'C', 'Driver', '', '', '', '', '7579180799', '229613596', 'A62614113', 'VA', '', 0.25, '', '', '', '', 'US', '0000-00-00', '0000-00-00', '', 'active', ''),
(37, 'Aqueela', '', 'Epps', '', '', '', '', '', '', '', '', '', 0.25, 'Epps', '', '', '', 'US', '0000-00-00', '0000-00-00', '39', 'active', ''),
(38, 'Alice', 'A', 'Evans', '374 Fort Worth Avenue', '# 2', 'Norfolk', '23505', '7577378884', '224985702', 'T60546553', 'VA', '', 0.25, 'Alice', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '7', 'active', ''),
(39, 'Cheryl', 'T', 'Freeman', '3907 Pughsville Road', '', 'Suffolk', '23704', '7573723383', '227880594', 'T60616576', 'VA', '7573050712', 0.25, 'Freeman', 'Lindsey Freeman', 'husband', 'VA', 'US', '0000-00-00', '0000-00-00', '28', 'active', ''),
(40, 'Gina', '', 'Forehand', '', '', '', '', '', '', '', '', '', 0.25, 'Gina', '', '', '', 'US', '0000-00-00', '0000-00-00', '88', 'active', ''),
(41, 'Harry', '', 'Forehand', '', '', '', '', '7572846960', '', '', '', '', 0.25, 'Harry F.', '', '', '', 'US', '0000-00-00', '0000-00-00', '49', 'active', ''),
(42, 'Griselda', 'P', 'Crespo-Ferdinand', '1264 Clydesdale Lane', '', 'Virginia Beach', '23464', '7573734128', '225676861', 'A67212404', 'VA', '', 0.25, 'Grace', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '46', 'active', ''),
(43, 'Kiyana', 'N', 'Felton', '415 Chapel Street', '', 'Norfolk', '23504', '7579773840', '181589005', 'A60510476', 'VA', '', 0.25, 'Kiki', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '91', 'active', ''),
(44, 'Judy', 'A', 'Frank', '5384 Roslyn Drive', '', 'Norfolk', '23502', '7578288071', '225848052', 'T62651940', 'VA', '', 0.25, 'Judy', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '85', 'active', ''),
(45, 'Delphine', 'E', 'Farrow', '2726 Westminster Avenue', '', 'Norfolk', '23504', '7576201301', '224986351', '', 'VA', '', 0.25, '', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '', 'active', ''),
(46, 'Cynthia', '', 'Griffin', '103 Ruger Court', '', 'Suffolk', '23434', '7572372289', '216625660', 'T61540431', 'VA', '', 0.25, 'Cynthia', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', 'P03', 'active', ''),
(47, 'Jackee', 'C', 'Garland', '5733 Weblin Drive', '', 'Virginia Beach', '23462', '7573008468', '225631231', 'A67249654', 'VA', '', 0.25, 'Jackee', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '70', 'active', ''),
(48, 'Charnay', 'A', 'Gooden', '1050 Bay Street', '', 'Portsmouth', '23704', '', '96806876', 'A60647267', 'VA', '', 0.25, '', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '', 'active', ''),
(49, 'Coston', '', 'Griffin', '234 Burnetts Way', '', 'Suffolk', '23434', '7576301789', '230742540', 'T62652521', 'VA', '', 0.25, 'Pete', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '3033', 'active', ''),
(50, 'Lella', 'S', 'Golden', '5631 Tidewater Drive', 'Apt 7R', 'Norfolk', '23509', '7579070301', '230666582', 'T62651580', 'VA', '', 0.25, 'Lella', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '96', 'active', ''),
(51, 'Taquiesha', 'G', 'Gray', '1743 Acorn Street', '', 'Chesapeake', '23324', '7572778239', '224317483', 'T62659561', 'VA', '', 0.25, 'Taquisha', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '57', 'active', ''),
(52, 'Tatanisha', 'M', 'Gilliam', '1878 Greenleaf Drive', '', 'Norfolk', '23523', '7579751859', '226270612', 'T60532054', 'VA', '', 0.25, 'Tata', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '59', 'active', ''),
(53, 'Viola', '', 'Harrell', '7424 Fenner Street', 'Apt 12', 'Norfolk', '23505', '7579989368', '577961817', 'A62147199', 'VA', '', 0.25, 'Viola', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '87', 'active', ''),
(54, 'Adeela', '', 'Hopkins', '1241 W. Ocean View Ave.', '# 1', 'Norfolk', '23503', '7573485196', '224573196', 'A60503386', 'VA', '', 0.25, 'Adeela', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '15', 'active', ''),
(55, 'Marketta', '', 'Holloway', '7035 Sewells Point Road', 'Unit G', 'Norfolk', '23513', '7572700018', '223352996', 'T60551830', 'VA', '', 0.25, '', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '', 'active', ''),
(56, 'Ciara', 'C', 'Hamilton', '455 Nicholson Street', '', 'Norfolk', '23510', '7579774761', '223359665', 'T62659822', 'VA', '', 0.25, 'Ciara', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', 'E04', 'active', ''),
(57, 'Malinda', 'D', 'Haley', '3011 Mayon Drive', '', 'Chesapeake', '23325', '7577529156', '223275710', 'B23801596', 'VA', '', 0.25, 'Malinda', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '58', 'active', ''),
(58, 'Carolyn', 'Y', 'Hall', '261 Nicholson Street', '', 'Norfolk', '23510', '7576328629', '231232764', 'T62679548', 'VA', '', 0.25, 'Carolyn', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '90', 'active', ''),
(59, 'Malkia', 'S', 'Johnson', '2706 Broad Street', '', 'Chesapeake', '23324', '7573784666', '78621987', 'T62151240', 'VA', '', 0.25, '', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '', 'active', ''),
(60, 'Melissa', 'L', 'Wilkerson-Jones', '4600 Lind Street', '', 'Norfolk', '23513', '8046688472', '225430316', 'T60514922', 'VA', '', 0.25, 'Melissa', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', 'N200', 'active', ''),
(61, 'Tim', 'E', 'Jernigan', '4181 Spruse Knob Road', '', 'Virginia Beach', '23456', '', '224558455', 'T60595044', 'VA', '', 0.25, '', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '', 'active', ''),
(62, 'Keosha', 'S', 'Johnson', '7923 Moose Avenue', '', 'Norfolk', '23518', '7577766941', '226356134', 'T62637048', 'VA', '', 0.25, '', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '', 'active', ''),
(63, 'Bianca', 'C', 'Jackson', '600 Charles Court', '', 'Virginia Beach', '23462', '7577521042', '226115061', 'E23856777', 'VA', '', 0.25, 'Bianca', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '29', 'active', ''),
(64, 'Pamela', 'N', 'Keene', '705 West 36th Street', '', 'Norfolk', '23508', '7573819520', '226293540', 'T60530223', 'VA', '', 0.25, 'Pam', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '40', 'active', ''),
(65, 'Sharon', 'D', 'Knight', '1152 Virginia Beach Blvd', '# 42', 'Virginia Beach', '23451', '', '412157053', 'A61657756', 'VA', '', 0.25, '', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '', 'active', ''),
(66, 'Lasonia', 'K', 'Knight', '6624 Stoney Point Road', '', 'Norfolk', '23502', '7573749356', '223538962', 'T62691256', 'VA', '', 0.25, 'Sonia', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '65', 'active', ''),
(67, 'Tyshawn', '', 'Lawton', '3861 Liberty Ridge Road', '', 'Virginia Beach', '23452', '4058358099', '224675828', 'W083879565', 'OK', '', 0.25, 'Tyshawn', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '89', 'active', ''),
(68, 'Akira', 'S', 'Leonard', '744 A Avenue', 'Apt 2', 'Norfolk', '23504', '7063514282', '223619487', 'A6050633', 'VA', '', 0.25, 'Akira', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '52', 'active', ''),
(69, 'Christian', '', 'Lichliter', '', '', '', '', '', '', '', '', '', 0.25, 'Shane', '', '', '', 'US', '0000-00-00', '0000-00-00', '01', 'active', ''),
(70, 'Vonetta', 'M', 'Manyweather', '3860 Nansemond Circle', 'Apt 1', 'Norfolk', '23513', '7572892490', '223150710', 'T60591927', 'VA', '', 0.25, 'Vonetta', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '201', 'active', ''),
(71, 'Lavinia', 'D', 'Mackey', '1001 7th Street', 'Apt D', 'Portsmouth', '23704', '7572303265', '223114573', 'T60614955', 'VA', '', 0.25, 'Lavinia', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '60', 'active', ''),
(72, 'Rita', 'D', 'Moore', '1921 Robert Hall Blvd', '# 3309', 'Chesapeake', '23324', '7577754140', '230080067', 'T62634576', 'VA', '7575137031', 0.25, 'Rita', 'Monae Cuffee', 'daughter', 'VA', 'US', '0000-00-00', '0000-00-00', '55', 'active', ''),
(73, 'Tenesha', 'F', 'Land-Mitchell', '9639 11th View Street', '# 7', 'Norfolk', '23503', '7575155369', '223275397', 'T60512220', 'VA', '7572305869', 0.25, 'Tinisha', 'Carolyn Leland', 'mother', 'VA', 'US', '0000-00-00', '0000-00-00', '41', 'active', ''),
(74, 'Cynthia', 'M', 'Moyler', '1112 Sword Drive', '', 'Chesapeake', '23323', '', '225747474', 'T62118989', 'VA', '', 0.25, '', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '', 'active', ''),
(75, 'Marquita', 'C', 'Mason', '1330 MacDonald Road', 'Apt E', 'Chesapeake', '23325', '', '227658832', 'A62642756', 'VA', '', 0.25, '', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '', 'active', ''),
(76, 'Mary', 'W', 'Medley', '6508 Harvey Court', '', 'Norfolk', '23513', '7572306655', '230685065', 'T60515035', 'VA', '', 0.25, 'Mary', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '6', 'active', ''),
(77, 'Diane', 'P', 'Outland', '1406 Newby Road', '', 'Portsmouth', '23701', '7577547347', '231984176', 'T60610332', 'VA', '', 0.25, 'Outland', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '44', 'active', ''),
(78, 'Russell', 'W', 'Owens', '834 Bancker Road', '', 'Norfolk', '23518', '7578376416', '105765578', '989295794', 'NY', '7577386515', 0.25, 'Russell', 'Tamara Bennett', 'daughter', 'VA', 'US', '0000-00-00', '0000-00-00', '21', 'active', ''),
(79, 'Neshaminy', 'T', 'Perry', '849 Rugby Street', '', 'Norfolk', '23504', '7573431389', '147688916', 'A60551729', 'VA', '', 0.25, 'Nicole', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '94', 'active', ''),
(80, 'LeDiea', 'L', 'Payton', '418 Park Avenue', 'Apt B', 'Norfolk', '23504', '7579985263', '228436398', 'T60506863', 'VA', '', 0.25, '', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '', 'active', ''),
(81, 'Brian', 'D', 'Russell', '2371 N. Windsong Court', '# 101', 'Virginia Beach', '23455', '8609491593', '560351711', 'B67221684', 'VA', '', 0.25, 'Brian', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '24', 'active', ''),
(82, 'Janee', 'T', 'Reed', '1118 Virginia Avenue', 'Apt D', 'Portsmouth', '23707', '7573596850', '224177311', 'T60669188', 'VA', '', 0.25, 'Janee', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '4', 'active', ''),
(83, 'Lee', '', 'Rempas', '', '', '', '', '', '', '', '', '', 0.25, 'Lee', '', '', '', 'US', '0000-00-00', '0000-00-00', '20', 'active', ''),
(84, 'Harry', 'A', 'Robertson', '5168 Stratford Chase Drive', '', 'Virginia Beach', '23464', '7576960016', '229132886', 'T62607487', 'VA', '', 0.25, 'Harry R', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '33', 'active', ''),
(85, 'Shawnta', 'M', 'Ross', '601 Seventh Street', 'Apt F', 'Portsmouth', '23704', '7577768679', '223377627', 'T62627778', 'VA', '', 0.25, '', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '', 'active', ''),
(86, 'Patrice', 'A', 'Reed', '1945 E. Ocean View Avenue', '# 2', 'Norfolk', '23503', '7579985622', '17506627', 'A24634742', 'VA', '', 0.25, 'Reed', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '48', 'active', ''),
(87, 'Cynthia', 'I', 'Ruffin', '4604 Brantingham Drive', '', 'Virginia Beach', '23464', '5614202586', '767071703', 'A60583075', 'VA', '', 0.25, 'Ruffin', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '47', 'active', ''),
(88, 'Meisha', 'D', 'Roberts', '3738 Deep Creek Blvd', '', 'Portsmouth', '23702', '7576106373', '226191883', 'T60642532', 'VA', '', 0.25, 'Miesha', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '74', 'active', ''),
(89, 'Lloyd', '', 'Sanderson', '', '', '', '', '', '', '', '', '', 0.25, 'Juni', '', '', '', 'US', '0000-00-00', '0000-00-00', '398', 'active', ''),
(90, 'Patrice', 'D', 'Stewart', '1344 Picadilly Street', 'Apt B', 'Norfolk', '23513', '7577380728', '227089013', 'T62687260', 'VA', '', 0.25, '', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '', 'active', ''),
(91, 'Christine', 'D', 'Snipes', '709 River Creek Road', '', 'Chesapeake', '23320', '7575601052', '231199303', 'T62137850', 'VA', '', 0.25, 'Christine', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '16', 'active', ''),
(92, 'Lamesha', 'L', 'Selby', '1816 Greenleaf Drive', '', 'Norfolk', '23523', '7573246157', '228235968', 'T60515292', 'VA', '', 0.25, 'Lamisha', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '50', 'active', ''),
(93, 'Jeanette', 'R', 'Spencer', '5512 Bayberry Drive', '', 'Norfolk', '23502', '7574502056', '228803696', 'T62615489', 'VA', '', 0.25, '', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '', 'active', ''),
(94, 'Shakina', 'S', 'Saunders', '920 Tifton Street', '', 'Norfolk', '23513', '7573091535', '224315200', 'T60536220', 'VA', '', 0.25, 'Shakina', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '72', 'active', ''),
(95, 'Arnold', '', 'Smith', '', '', '', '', '', '', '', '', '', 0.25, 'Arnold', '', '', '', 'US', '0000-00-00', '0000-00-00', '051', 'active', ''),
(96, 'Kim', 'M', 'Smith', '7424 Fenner Street', 'Apt 20', 'Norfolk', '23505', '7575817164', '228293656', 'T60544384', 'VA', '', 0.25, 'Smith', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '71', 'active', ''),
(97, 'Darrin', 'L', 'Thomas', '3214 Lens Avenue', '', 'Norfolk', '23509', '7574056289', '227171032', 'T60644119', 'VA', '', 0.25, 'Darren', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '32', 'active', ''),
(98, 'Aimee', 'R', 'Taylor', '1424 McNeal Avenue', '', 'Norfolk', '23502', '7577905584', '002847001', 'T67288271', 'VA', '', 0.25, 'Aimee', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '26', 'active', ''),
(99, 'Monique', '', 'Taylor', '', '', '', '', '', '', '', '', '', 0.25, 'Momo', '', '', '', 'US', '0000-00-00', '0000-00-00', '19', 'active', ''),
(100, 'Jack', 'V', 'Tambreza', '1280 Pall Mall Avenue', '', 'Norfolk', '23513', '7575672961', '', '', 'VA', '', 0.25, 'Jack', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '23', 'active', ''),
(101, 'Tonia', 'T', 'Thompson', '1513 Halter Drive', 'Unit A', 'Virginia Beach', '23464', '8563921357', '150626952', 'B67234218', 'VA', '', 0.25, '', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '', 'active', ''),
(102, 'Roderick', '', 'Wallace', '', '', '', '', '', '', '', '', '', 0.25, 'Rodrick', '', '', '', 'US', '0000-00-00', '0000-00-00', '64', 'active', ''),
(103, 'Gail', 'D', 'Williams', '1050 Bay Street', '', 'Portsmouth', '23704', '8568349935', '099521152', 'A60647268', 'VA', '', 0.25, 'Gail', '', '', 'VA', 'US', '0000-00-00', '0000-00-00', '03', 'active', ''),
(104, 'Sherry', 'A', 'Wilson', '3033 Fireside Road', '', 'Chesapeake', '23324', '7573392882', '230040375', 'A62103700', 'VA', '7576638427', 0.25, 'Sherry', 'Mary Wilson', '', 'VA', 'US', '0000-00-00', '0000-00-00', 'E02', 'active', ''),
(105, 'Bianca', 'D', 'Wiggins', '3224 Kimball Terrace', '', 'Norfolk', '23504', '7577389386', '230574687', 'T61541876', 'VA', '7572850417', 0.25, 'Wiggins', 'Catina Poole', 'mother', 'VA', 'US', '0000-00-00', '0000-00-00', '25', 'active', ''),
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
  `o_tip` float NOT NULL,
  `ra_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(38, 1, '121212.00', 'popopo');

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
(1, 1, 'Academy for Discovery at Lakewood', 'ADL', 'Alsace Avenue', 'Norfolk', 'VA', 23509, 'US', 'Mr. Thomas R. Smigiel', '7576282477', 'alternative', NULL),
(2, 1, 'Academy of International Studies at Rosemont', 'AIS', 'Branch Road', 'Norfolk', 'VA', 23513, 'US', 'Dr.?Jannette E. Martin', '7578524610', 'alternative', NULL),
(3, 1, 'Azalea Gardens Middle School', 'AZG', 'Azalea Garden Road', 'Norfolk', 'VA', 23518, 'US', 'Dr. Reuthenia C. Clark', '7575313000', 'middle', NULL),
(4, 1, 'Bay View Elementary School', 'BA', 'Bay View Blvd', 'Norfolk', 'VA', 23503, 'United States', 'Dr. Valerie A. Walto', '757531303', 'Elementary', '123'),
(5, 1, 'Berkley/Campostella Early Childhood Education Center', 'BCE', 'Cypress Street', 'Norfolk', 'VA', 23523, 'US', 'Dr. Doreatha White', '7574943870', 'elementary', NULL),
(6, 1, 'Blair Middle School', 'BMS', 'Spotswood Avenue', 'Norfolk', 'VA', 23517, 'US', 'Dr. Mark Makovec', '7576282400', 'middle', NULL),
(7, 1, 'Booker T. Washington High School', 'BTW', 'Park Avenue', 'Norfolk', 'VA', 23504, 'US', 'Dr. Margie G. Stallings', '7576283575', 'high', NULL),
(8, 1, 'Camp Allen Elementary School', 'CAE', 'C Street', 'Norfolk', 'VA', 23505, 'US', 'Ms. Deena Johnson Copeland', '7574514170', 'elementary', NULL),
(9, 1, 'Camp Young', 'YNG', 'Deepwater Drive', 'Chesapeake', 'VA', 23322, 'US', 'Dr. Veronica E. Haynes', '7575474245', 'alternative', NULL),
(10, 1, 'Chesterfield Academy', 'CHS', 'Westminster Avenue', 'Norfolk', 'VA', 23504, 'US', 'Dr. Lawrence C. Taylor', '7576282544', 'alternative', NULL),
(11, 1, 'Coleman Place Elementary School', 'COL', 'Palmyra Street', 'Norfolk', 'VA', 23513, 'US', 'Dr. Pamela M. Tatem', '7578524641', 'elementary', NULL),
(12, 1, 'Crossroads School', 'CRS', 'Old Ocean View Road', 'Norfolk', 'VA', 23518, 'US', 'Dr. Kristen Nichols', '7575313050', 'alternative', NULL),
(13, 1, 'Easton Preschool', 'EPS', 'Curlew Drive', 'Norfolk', 'VA', 23502, 'US', 'Dr. Tami M. White', '7578923290', 'preschool', NULL),
(14, 1, 'Fairlawn Elementary School', 'FRL', 'Wade Street', 'Norfolk', 'VA', 23502, 'US', 'Mrs. T. Michele Logan', '7578923260', 'elementary', NULL),
(15, 1, 'Ghent Elementary School', 'GHE', 'Shirley Avenue', 'Norfolk', 'VA', 23517, 'US', 'Dr. Thomas McAnulty', '7576282565', 'elementary', NULL),
(16, 1, 'Granby Elementary School', 'GRE', 'Newport Avenue', 'Norfolk', 'VA', 23505, 'US', 'Mrs. Kathy Verhappen', '7574514150', 'elementary', NULL),
(17, 1, 'Granby High School', 'GRH', 'Granby Street', 'Norfolk', 'VA', 23505, 'US', 'Dr. Lynnell Gibson', '7574514110', 'high', NULL),
(18, 1, 'Hospital School Program at CHKD', 'HSP', 'Gresham Drive', 'Norfolk', 'VA', 23507, 'US', 'Ms. Janice Teagle', '7576687061', 'alternative', NULL),
(19, 1, 'Ingleside Elementary School', 'ING', 'Ingleside Drive', 'Norfolk', 'VA', 23502, 'US', 'Dr. Alana Balthazar', '7578923270', 'elementary', NULL),
(20, 1, 'Jacox Elementary School', 'JCX', 'Marshall Avenue', 'Norfolk', 'VA', 23504, 'US', 'Dr. Rohan Cumberbatch-Smith', '7576282433', 'elementary', NULL),
(21, 1, 'James Monroe Elementary School', 'JME', 'West 29th Street', 'Norfolk', 'VA', 23508, 'US', 'Mrs. Celeste M. Jones', '7576283500', 'elementary', NULL),
(22, 1, 'Lake Taylor High School', 'LTH', 'Kempsville Road', 'Norfolk', 'VA', 23502, 'US', 'Mrs. Latesha Wade-Jenkins', '7578923200', 'high', NULL),
(23, 1, 'Lake Taylor Middle School', 'LTM', 'Kempsville Road', 'Norfolk', 'VA', 23502, 'US', 'Dr. Kirk', '7578923230', 'middle', NULL),
(24, 1, 'Larchmont Elementary School', 'LRC', 'Bolling Avenue', 'Norfolk', 'VA', 23508, 'US', 'Mr. Dennis Fifer', '7574514180', 'elementary', NULL),
(25, 1, 'Larrymore Elementary School', 'LRY', 'Halprin Drive', 'Norfolk', 'VA', 23518, 'US', 'Mr. David W. Faircloth', '7575313070', 'elementary', NULL),
(26, 1, 'Lindenwood Elementary School', 'LIN', 'Ludlow Street', 'Norfolk', 'VA', 23504, 'US', 'Dr. Lisa Corbin', '7576282577', 'elementary', NULL),
(27, 1, 'Little Creek Elementary School - Tarpon', 'LCT', 'Tarpon Place', 'Norfolk', 'VA', 23518, 'US', 'Ms. Carolyn D. Harper', '7575313080', 'elementary', NULL),
(28, 1, 'Little Creek Elementary School - Nancy', 'LCN', 'Nancy Drive', 'Norfolk', 'VA', 23518, 'US', 'Ms. Carolyn D. Harper', '7575313080', 'elementary', NULL),
(29, 1, 'Madison Alternative Center', 'MAC', 'Bowdens Ferry Road', 'Norfolk', 'VA', 23508, 'US', 'Dr. Sandra Fortner', '7576283417', 'alternative', NULL),
(30, 1, 'Mary Calcott Elementary School', 'CAL', 'Westmont Avenue', 'Norfolk', 'VA', 23503, 'US', 'Mrs. Danielle Y. McIntyre', '7575313039', 'elementary', NULL),
(31, 1, 'Maury High School', 'MHS', 'Shirley Avenue', 'Norfolk', 'VA', 23517, 'US', 'Ms. Karen Berg', '7576283344', 'high', NULL),
(32, 1, 'Norfolk Educational Transition Academy', 'NET', 'Security Lane', 'Norfolk', 'VA', 23502, 'US', 'Mr. Gus Guardino', '7578923310', 'alternative', NULL),
(33, 1, 'Norfolk Technical Center', 'NTC', 'North Military Highway', 'Norfolk', 'VA', 23502, 'US', 'Mr. Kevin Monroe', '7578923300', 'high', NULL),
(34, 1, 'Northside Middle School', 'NMS', 'Granby Street', 'Norfolk', 'VA', 23503, 'US', 'Mr. Richard Fraley', '7575313150', 'middle', NULL),
(35, 1, 'Norview Elementary School', 'NRE', 'Chesapeake Blvd', 'Norfolk', 'VA', 23513, 'US', 'Ms. Kathryn Caple', '7578524660', 'elementary', NULL),
(36, 1, 'Norview High School', 'NRH', 'Chesapeake Blvd', 'Norfolk', 'VA', 23513, 'US', 'Dr. Marjorie Stealey', '7578524500', 'high', NULL),
(37, 1, 'Norview Middle School', 'NRM', 'Sewells Point Road', 'Norfolk', 'VA', 23513, 'US', 'Mr. Walter Brower, Jr.', '7578524600', 'middle', NULL),
(38, 1, 'Ocean View Elementary School', 'OVE', 'Mason Creek Road', 'Norfolk', 'VA', 23503, 'US', 'Dr. James Peterson', '7575313105', 'elementary', NULL),
(39, 1, 'Oceanair Elementary School', 'OCN', 'Dudley Avenue', 'Norfolk', 'VA', 23503, 'US', 'Ms. Lenthia Willie-Clark', '7575313095', 'elementary', NULL),
(40, 1, 'P.B. Young, Sr. Elementary School', 'PBY', 'East Olney Road', 'Norfolk', 'VA', 23510, 'US', 'Dr. Dwana White', '7576282588', 'elementary', NULL),
(41, 1, 'Poplar Halls Elementary School', 'POP', 'Pebble Lane', 'Norfolk', 'VA', 23502, 'US', 'Ms. Cassandra Duke-Washington', '7578923280', 'elementary', NULL),
(42, 1, 'Richard Bowling Elementary School', 'RBE', 'East Princess Anne Road', 'Norfolk', 'VA', 23504, 'US', 'Mr. Eric Goodman', '7576282515', 'elementary', NULL),
(43, 1, 'Ruffner Academy', 'RUF', 'May Avenue', 'Norfolk', 'VA', 23504, 'US', 'Ms. Sallie Cooke', '7576282466', 'alternative', NULL),
(44, 1, 'Sewells Point Elementary School', 'SWL', 'Hampton Blvd', 'Norfolk', 'VA', 23505, 'US', 'Ms. Mary Wrushen', '7574514160', 'elementary', NULL),
(45, 1, 'Sherwood Forest Elementary School', 'SFE', 'Sherwood Forest Lane', 'Norfolk', 'VA', 23508, 'US', 'Ms. Cheryl Jordan', '7578524550', 'elementary', NULL),
(46, 1, 'Southside STEM Academy at Campostella', 'SSS', 'Campostella Road', 'Norfolk', 'VA', 23523, 'US', 'Dr. Rhonda Ambrose', '7574943850', 'elementary', NULL),
(47, 1, 'St. Helena Elementary School', 'STH', 'South Main Street', 'Norfolk', 'VA', 23523, 'US', 'Ms. Vandelyn Hodges', '7574943884', 'elementary', NULL),
(48, 1, 'Suburban Park Elementary School', 'SUB', 'Thole Street', 'Norfolk', 'VA', 23505, 'US', 'Mrs. Brenda Shepherd', '7575313118', 'elementary', NULL),
(49, 1, 'Tanners Creek Elementary School', 'TAN', 'Longdale Drive', 'Norfolk', 'VA', 23513, 'US', 'Mrs. Maritsa Alger', '7578524555', 'elementary', NULL),
(50, 1, 'Tarrallton Elementary School', 'TAR', 'Tarrallton Drive', 'Norfolk', 'VA', 23518, 'US', 'Mr. Daniel White', '7575311800', 'elementary', NULL),
(51, 1, 'Tidewater Park Elementary School', 'TPE', 'East Brambleton Avenue', 'Norfolk', 'VA', 23510, 'US', 'Dr. Sharon Phillips', '7576282500', 'elementary', NULL),
(52, 1, 'W.H. Taylor Elementary School', 'WHT', 'West Princess Anne Road', 'Norfolk', 'VA', 23507, 'US', 'Ms. Charlene Felition', '7576282525', 'elementary', NULL),
(53, 1, 'Willard Elementary School', 'WIL', 'Willow Wood Drive', 'Norfolk', 'VA', 23509, 'US', 'Mrs. Julie Honeycutt', '7576282721', 'elementary', NULL),
(54, 1, 'Willoughby Elementary School', 'WLB', 'Fourth View Street', 'Norfolk', 'VA', 23508, 'US', 'Mrs. June Lightfoot', '7575313127', 'elementary', NULL),
(55, 2, 'Churchland High School', 'CHS', 'Cedar Lane', 'Portsmouth', 'VA', 23703, 'US', 'Mr. Shawn L. Millaci', '7576862500', 'high', NULL),
(56, 2, 'I.C. Norcom High School', 'NOR', 'London Blvd', 'Portsmouth', 'VA', 23704, 'US', 'Dr. Laguna O. Foster', '7573935442', 'high', NULL),
(57, 2, 'Woodrow Wilson High School', 'WWH', 'Elmhurst Lane', 'Portsmouth', 'VA', 23701, 'US', 'Mr. Timothy E. Johnson', '7574652907', 'high', NULL),
(58, 2, 'Churchland Middle School', 'CMS', 'River Shore Road', 'Portsmouth', 'VA', 23703, 'United States', 'Ms. Barbara R. Kimzey', '7576862512', 'Preschool', 'erer'),
(59, 2, 'Cradock Middle School', 'CRD', 'Alden Avenue', 'Portsmouth', 'VA', 23702, 'US', 'Ms. Sonya C. Harrell', '7573938788', 'middle', NULL),
(60, 2, 'W.E. Waters Middle School', 'WEW', 'Roosevelt Blvd', 'Portsmouth', 'VA', 23701, 'US', 'Ms. Alice Graham', '7575582813', 'middle', NULL),
(61, 2, 'Brighton Elementary School', 'BES', 'Portsmouth Blvd', 'Portsmouth', 'VA', 23704, 'US', 'Mr. Arcelius Brickhouse', '7573938870', 'elementary', NULL),
(62, 2, 'Churchland Academy', 'CAC', 'River Shore Road', 'Portsmouth', 'VA', 23703, 'US', 'Ms. Karen D. Clark', '7576862527', 'elementary', NULL),
(63, 2, 'Churchland Elementary School', 'CES', 'Michael Lane', 'Portsmouth', 'VA', 23703, 'US', 'Dr. Jamill Ray Jones', '7576862523', 'elementary', NULL),
(64, 2, 'Churchland Primary and Intermediate School', 'CPI', 'Hedgerow Lane', 'Portsmouth', 'VA', 23703, 'US', 'Ms. Rosalyn T. Exum', '7576862519', 'elementary', NULL),
(65, 2, 'Douglass Park Elementary School', 'DGP', 'Grand Street', 'Portsmouth', 'VA', 23701, 'US', 'Ms. Dusti R. Johnson Brinker', '7573938646', 'elementary', NULL),
(66, 2, 'Hodges Manor Elementary School', 'HMN', 'Cherokee Road', 'Portsmouth', 'VA', 23701, 'US', 'Dr. Faye S. Felton', '7574652921', 'elementary', NULL),
(67, 2, 'James Hurst Elementary School', 'JHE', 'Dahlgren Avenue', 'Portsmouth', 'VA', 23702, 'US', 'Mr. Morris L. Barco', '7575582811', 'elementary', NULL),
(68, 2, 'John Tyler Elementary School', 'JTE', 'Hartford Street', 'Portsmouth', 'VA', 23707, 'US', 'Ms. Heidi M. Lewis', '7573938879', 'elementary', NULL),
(69, 2, 'Lakeview Elementary School', 'LKV', 'Horne Avenue', 'Portsmouth', 'VA', 23701, 'US', 'Dr. Camilla C. Ferebee', '7574652901', 'elementary', NULL),
(70, 2, 'Park View Elementary School', 'PRV', 'Elm Avenue', 'Portsmouth', 'VA', 23704, 'US', 'Ms. Angela D. Flowers', '7573938647', 'elementary', NULL),
(71, 2, 'Simonsdale Elementary School', 'SES', 'Clifford Street', 'Portsmouth', 'VA', 23701, 'US', 'Ms. Darlene F. Bright', '7574652917', 'elementary', NULL),
(72, 2, 'Victory Elementary School', 'VES', 'Greenwood Drive', 'Portsmouth', 'VA', 23701, 'US', 'Dr. J. Wayne Williams', '7573938806', 'elementary', NULL),
(73, 2, 'Westhaven Elementary School', 'WST', 'Clifford Drive', 'Portsmouth', 'VA', 23707, 'US', 'Mr. Ralph K. Snowden', '7573938855', 'elementary', NULL),
(74, 2, 'Churchland Preschool', 'CHP', 'River Shore Road', 'Portsmouth', 'VA', 23703, 'US', 'Ms. Robyn A. McIntyre', '7576862533', 'preschool', NULL),
(75, 2, 'Emily Spong Preschool', 'ESP', 'Piedmont Avenue', 'Portsmouth', 'VA', 23704, 'US', 'Ms. Vanessa P. Whichard-Harris', '7573935247', 'preschool', NULL),
(76, 2, 'Mount Hermon Preschool', 'MHP', 'North Street', 'Portsmouth', 'VA', 23707, 'US', 'Ms. Patricia S. Willilams', '7573938825', 'preschool', NULL),
(77, 2, 'Olive Branch Preschool', 'OBP', 'Mimosa Road', 'Portsmouth', 'VA', 23701, 'US', 'Ms. Lois J. Rieckhoff', '7574652926', 'preschool', NULL),
(78, 2, 'Excel Campus', 'XCL', 'Elmhurst Lane', 'Portsmouth', 'VA', 23701, 'US', 'Ms. Sonji Hairston', '7574652958', 'alternative', NULL),
(79, 2, 'New Directions Center', 'NDC', 'West Road', 'Portsmouth', 'VA', 23707, 'US', 'Mr. Horace L. Lambert, Jr.', '7573938728', 'alternative', NULL),
(80, 6, 'Denbigh Early Childhood Center', 'DEC', 'Warwick Blvd', 'Newport News', 'VA', 23608, 'US', 'Ms. Amelia Hunt', '7578667789', 'alternative', NULL),
(81, 6, 'Lee Hall Early Childhood Center', 'HEC', 'Warwick Blvd', 'Newport News', 'VA', 23602, 'US', 'Ms. Lauren Gray', '7578883329', 'alternative', NULL),
(82, 6, 'Marshall Early Learning Center', 'MAR', '24th Street', 'Newport News', 'VA', 23607, 'US', 'Ms. Vanessa Keller', '7579286832', 'alternative', NULL),
(83, 6, 'Watkins Early Childhood Center', 'WAT', 'Burns Drive', 'Newport News', 'VA', 23601, 'US', 'Ms. Sue Waxman', '7575914815', 'alternative', NULL),
(84, 6, 'Program for Educating Exceptional Preschoolers', 'PEP', 'Gatewood Road', 'Newport News', 'VA', 23601, 'US', 'Dr. Heather Jankovich', '7575914963', 'alternative', NULL),
(85, 6, 'An Achievable Dream Academy', 'ADA', '16th Street', 'Newport News', 'VA', 23607, 'US', 'Ms. Terra Chalmer-Harris', '7579286827', 'elementary', NULL),
(86, 6, 'Carver Elementary School', 'CAR', 'Jefferson Avenue', 'Newport News', 'VA', 23605, 'US', 'Ms. Izzie R. Brown', '7575914950', 'elementary', NULL),
(87, 6, 'Charles Elementary School', 'CES', 'Menchville Road', 'Newport News', 'VA', 23602, 'US', 'Mr. Anthony Perry', '7578867750', 'elementary', NULL),
(88, 6, 'Deer Park Elementary School', 'DRP', 'Jefferson Avenue', 'Newport News', 'VA', 23601, 'US', 'Ms. Mary Jo Anastasio', '7575917470', 'elementary', NULL),
(89, 6, 'Discovery STEM Academy', 'DIS', 'Chestnut Avenue', 'Newport News', 'VA', 23607, 'US', 'Ms. Christine Pilger', '7579286838', 'elementary', NULL),
(90, 6, 'Dutrow Elementary School', 'DUT', 'Curtis Tignor Road', 'Newport News', 'VA', 23608, 'US', 'Ms. Kelly Stewart', '7578867760', 'elementary', NULL),
(91, 6, 'Epes Elementary School', 'EPE', 'Lucas Creek Road', 'Newport News', 'VA', 23608, 'US', 'Mr. Reggie Alston', '7578867755', 'elementary', NULL),
(92, 6, 'General Stanford Elementary School', 'GSE', 'Madison Avenue, Fort Eustis', 'Newport News', 'VA', 23604, 'US', 'Ms. Diane C. Willis', '7578883200', 'elementary', NULL),
(93, 6, 'Greenwood Elementary School', 'GES', 'Woodside Lane', 'Newport News', 'VA', 23608, 'US', 'Ms. Camisha Davis', '7578867744', 'elementary', NULL),
(94, 6, 'Hidenwood Elementary School', 'HID', 'Blount Point Road', 'Newport News', 'VA', 23606, 'US', 'Ms. Annette Walls', '7575914766', 'elementary', NULL),
(95, 6, 'Hilton Elementary School', 'HIL', 'River Road', 'Newport News', 'VA', 23601, 'US', 'Ms. Barbara Nagel', '7575914772', 'elementary', NULL),
(96, 6, 'Jenkins Elementary School', 'JNK', 'Menchville Road', 'Newport News', 'VA', 23602, 'US', 'Ms. Terri McCaughan', '7578815400', 'elementary', NULL),
(97, 6, 'Kiln Creek Elementary School', 'KIL', 'Kiln Creek Parkway', 'Newport News', 'VA', 23602, 'US', 'Dr. Kathryn Hermann', '7578867961', 'elementary', NULL),
(98, 6, 'Lee Hall Elementary School', 'HES', 'Warwick Blvd', 'Newport News', 'VA', 23603, 'US', 'Ms. Glenda Walter', '7578883320', 'elementary', NULL),
(99, 6, 'McIntosh Elementary School', 'MCE', 'Richneck Road', 'Newport News', 'VA', 23608, 'US', 'Ms. Ethel Francis', '7578867767', 'elementary', NULL),
(100, 6, 'Nelson Elementary School', 'NEL', 'Moyer Road', 'Newport News', 'VA', 23608, 'US', 'Dr. Melody Camm', '7578867783', 'elementary', NULL),
(101, 6, 'Newsome Park Elementary School', 'NEW', 'Marshall Avenue', 'Newport News', 'VA', 23607, 'US', 'Ms. Kimberly Judge', '7579286810', 'elementary', NULL),
(102, 6, 'Palmer Elementary School', 'PES', 'Palmer Lane', 'Newport News', 'VA', 23602, 'US', 'Ms. Karen Lynch', '7578815000', 'elementary', NULL),
(103, 6, 'Richneck Elementary School', 'RCH', 'Tyner Drive', 'Newport News', 'VA', 23608, 'US', 'Mr. Troy Latuch', '7578867772', 'elementary', NULL),
(104, 6, 'Riverside Elementary School', 'RVR', 'Country Club Road', 'Newport News', 'VA', 23606, 'US', 'Mr. Bryan Thrift', '7575914740', 'elementary', NULL),
(105, 6, 'Sanford Elementary School', 'SFD', 'Colony Road', 'Newport News', 'VA', 23602, 'US', 'Mr. Brian Lieberman', '7578867778', 'elementary', NULL),
(106, 6, 'Saunders Elementary School', 'SAU', 'Harpersville Road', 'Newport News', 'VA', 23601, 'US', 'Mr. Timothy Edwards', '7575914781', 'elementary', NULL),
(107, 6, 'Sedgefield Elementary School', 'SED', 'Main Street', 'Newport News', 'VA', 23605, 'US', 'Ms. Raquel Cox', '7575914792', 'elementary', NULL),
(108, 6, 'Yates Elementary School', 'YES', 'Maxwell Lane', 'Newport News', 'VA', 23606, 'US', 'Mr. Mark Kirk', '7578815450', 'elementary', NULL),
(109, 6, 'An Achievable Dream Middle School', 'ADM', 'Marshall Avenue', 'Newport News', 'VA', 23605, 'US', 'Ms. Marylin Sinclair-White', '7572837820', 'middle', NULL),
(110, 6, 'Crittenden Middle School', 'CRT', 'Jefferson Avenue', 'Newport News', 'VA', 23605, 'US', 'Ms. Felicia F. Barnett', '7575914900', 'middle', NULL),
(111, 6, 'Dozier Middle School', 'DOZ', 'Industrial Park Drive', 'Newport News', 'VA', 23608, 'US', 'Ms. Lisa Gatz', '7578883300', 'middle', NULL),
(112, 6, 'Gildersleeve Middle School', 'GIL', 'Minton Drive', 'Newport News', 'VA', 23606, 'US', 'Dr. Windy Nichols', '7575914862', 'middle', NULL),
(113, 6, 'Hines Middle School', 'HIN', 'McLawhorne Drive', 'Newport News', 'VA', 23601, 'US', 'Dr. Amanda Corbin-Staton', '7575914878', 'middle', NULL),
(114, 6, 'Huntington Middle School', 'HUN', 'Orcutt Avenue', 'Newport News', 'VA', 23607, 'US', 'Ms. Courtney Mompoint', '7579286846', 'middle', NULL),
(115, 6, 'Passage Middle School', 'PAS', 'Atkinson Way', 'Newport News', 'VA', 23608, 'US', 'Ms. Janelle Spitz', '7578867600', 'middle', NULL),
(116, 6, 'Booker T. Washington Middle School', 'BTW', 'Chestnut Avenue', 'Newport News', 'VA', 23607, 'US', 'Dr. Sean Callender', '7579286860', 'middle', NULL),
(117, 6, 'An Achievable Dream High School', 'ADH', 'Marshall Avenue', 'Newport News', 'VA', 23605, 'US', 'Ms. Marylin Sinclair-White', '7572837820', 'high', NULL),
(118, 6, 'Denbigh High School', 'DHS', 'Denbigh Blvd', 'Newport News', 'VA', 23608, 'US', 'Dr. Eleanor Blowe', '7578867700', 'high', NULL),
(119, 6, 'Heritage High School', 'HER', 'Marshall Avenue', 'Newport News', 'VA', 23605, 'US', 'Ms. Shameka Gerald', '7579286100', 'high', NULL),
(120, 6, 'Menchville High School', 'MEN', 'Menchville Road', 'Newport News', 'VA', 23602, 'US', 'Mr. Robert Surry', '7578867722', 'high', NULL),
(121, 6, 'Warwick High School', 'WAR', 'Copeland Lane', 'Newport News', 'VA', 23601, 'US', 'Mr. Anthony Frazier', '7575914700', 'high', NULL),
(122, 6, 'Woodside High School', 'WOD', 'Woodside Lane', 'Newport News', 'VA', 23608, 'US', 'Mr. Jonathan Hochman', '7578867530', 'high', NULL),
(123, 6, 'Aviation Academy', 'AVI', 'Bland Blvd', 'Newport News', 'VA', 23602, 'US', 'Dr. Aaron Smith', '7578862745', 'high', NULL),
(124, 6, 'Enterprise Academy', 'ENT', 'Diligence Drive', 'Newport News', 'VA', 23606, 'US', 'Dr. Darwin Mills', '7575914971', 'high', NULL),
(125, 6, 'New Horizons Regional Education Center - Hampton', 'NHH', 'Butler Farm Road', 'Newport News', 'VA', 23666, 'US', 'Mr. Dewey Ray', '7577661100', 'high', NULL),
(126, 6, 'New Horizons Regional Education Center - Newport News', 'NHN', 'Woodside Lane', 'Newport News', 'VA', 23608, 'US', 'Mr. Bruce Schaffer', '7578744444', 'high', NULL),
(127, 6, 'Point Option', 'OPT', 'Diligence Drive', 'Newport News', 'VA', 23606, 'US', 'Mr. Michael Bonfiglio', '7575917408', 'high', NULL),
(128, 6, 'Telecommunications Center', 'TCC', 'Minton Drive', 'Newport News', 'VA', 23606, 'US', 'Mr. Ray Price', '7575914687', 'high', NULL),
(129, 4, 'Booker T. Washington Elementary School', 'BTW', 'Walnut Street', 'Suffolk', 'VA', 23434, 'US', 'Ms.Lori Mounie', '7579346226', 'elementary', NULL),
(130, 4, 'Creekside Elementary School', 'CRK', 'Bennett\'s Creek Park Road', 'Suffolk', 'VA', 23434, 'US', 'Ms. Katrina Rountree', '7579234251', 'elementary', NULL),
(131, 4, 'Driver Elementary School', 'DRV', 'Driver Lane', 'Suffolk', 'VA', 23435, 'US', 'Ms. Melodie Griffin', '7579234106', 'elementary', NULL),
(132, 4, 'Elephant\'s Fork Elementary School', 'ELF', 'William Reid Drive', 'Suffolk', 'VA', 23434, 'US', 'Ms. Jessica Avery', '7579235250', 'elementary', NULL),
(133, 4, 'Hillpoint Elementary', 'HIL', 'Hillpoint Blvd', 'Suffolk', 'VA', 23434, 'US', 'Ms. Catherine Pichon', '7579235252', 'elementary', NULL),
(134, 4, 'Kilby Shores Elementary School', 'KIL', 'Kilby Shores Drive', 'Suffolk', 'VA', 23434, 'US', 'Ms. Lorri Banks', '7579346214', 'elementary', NULL),
(135, 4, 'Mack Benn, Jr. Elementary School', 'MBJ', 'Nansemond Parkway', 'Suffolk', 'VA', 23434, 'US', 'Mr. David LeFevre', '7579346224', 'elementary', NULL),
(136, 4, 'Nansemond Parkway Elementary School', 'NPE', 'Nansemond Parkway', 'Suffolk', 'VA', 23434, 'US', 'Ms. Chanel Bryant', '7579234167', 'elementary', NULL),
(137, 4, 'Northern Shores Elementary School', 'NSE', 'Respass Beach Road', 'Suffolk', 'VA', 23435, 'US', 'Ms. Tara W. Moore', '7579234169', 'elementary', NULL),
(138, 4, 'Oakland Elementary School', 'OAK', 'Godwin Blvd', 'Suffolk', 'VA', 23434, 'US', 'Ms. Temesha Dabney', '7579235248', 'elementary', NULL),
(139, 4, 'Pioneer Elementary', 'PIO', 'Pioneer Road', 'Suffolk', 'VA', 23437, 'US', 'Dr. Danielle Belton', '7579255782', 'elementary', NULL),
(140, 4, 'Forest Glen Middle School', 'FGM', 'Forest Glen Drive', 'Suffolk', 'VA', 23434, 'United States', 'Mr. Melvin Bradshaw', '7579255780', 'Middle', ''),
(141, 4, 'John Yeates Middle School', 'JYM', 'Bennett\'s Pasture Road', 'Suffolk', 'VA', 23435, 'US', 'Mr. Shawn Green', '7579234105', 'middle', NULL),
(142, 4, 'John F. Kennedy Middle School', 'JFK', 'East Washington Street', 'Suffolk', 'VA', 23434, 'US', 'Ms. Vivian Covington', '7579346212', 'middle', NULL),
(143, 4, 'King\'s Fork Middle School', 'KFM', 'King\'s Fork Road', 'Suffolk', 'VA', 23434, 'US', 'Ms. Jennifer Presson', '7579235246', 'middle', NULL),
(144, 4, 'The Pruden Center', 'PRU', 'Pruden Blvd', 'Suffolk', 'VA', 23434, 'US', 'Mr. Andre Skinner', '7579255651', 'special', NULL),
(145, 4, 'Turlington Woods', 'TUR', 'Turlington Road', 'Suffolk', 'VA', 23434, 'US', 'Mr. Kinsel Bynum', '7579346215', 'special', NULL),
(146, 4, 'King\'s Fork High School', 'KNG', 'King\'s Fork Road', 'Suffolk', 'VA', 23434, 'US', 'Dr. Ron Leigh', '7579235240', 'high', NULL),
(147, 4, 'Lakeland High School', 'LAK', 'Kenyon Road', 'Suffolk', 'VA', 23434, 'US', 'Mr. Douglas Wagoner', '7579255790', 'high', NULL),
(148, 4, 'Nansemond River High School', 'NRH', 'Nansemond Parkway', 'Suffolk', 'VA', 23434, 'US', 'Mr. Daniel O\'Leary', '7579234101', 'high', NULL),
(149, 5, 'Aberdeen Elementary School', 'ABE', 'Aberdeen Road', 'Hampton', 'VA', 23666, 'US', 'Ms. Karla Young', '7578254624', 'elementary', NULL),
(150, 5, 'Andrews PreK-8 School', 'AND', 'Victoria Blvd', 'Hamptonn', 'VA', 23661, 'United States', 'Mr. Jeffrey Blowe', '7572683333', 'alternative', ''),
(151, 5, 'Armstrong Elementary School', 'ARM', 'Matoaka Road', 'Hampton', 'VA', 23661, 'US', 'Ms. Millicent Rogers', '7577271067', 'elementary', NULL),
(152, 5, 'Asbury Elementary School', 'ASB', 'Beach Road', 'Hampton', 'VA', 23664, 'US', 'Ms. Susan Johnson', '7578505075', 'elementary', NULL),
(153, 5, 'Barron Elementary School', 'BAR', 'Fox Hill Road', 'Hampton', 'VA', 23669, 'US', 'Ms. Levia Stovall', '7578505100', 'elementary', NULL),
(154, 5, 'Bassette Elementary School', 'BAS', 'Bell Street', 'Hampton', 'VA', 23661, 'US', 'Dr. Bryce Johnson', '7577271071', 'elementary', NULL),
(155, 5, 'Booker Elementary Schools', 'BOO', 'Apollo Drive', 'Hampton', 'VA', 23669, 'US', 'Ms. Brynne Cere', '7578505096', 'elementary', NULL),
(156, 5, 'Bryan Elementary School', 'BRY', 'North Mallory Street', 'Hampton', 'VA', 23663, 'US', 'Ms. Lynette Nelms', '7577271056', 'elementary', NULL),
(157, 5, 'Burbank Elementary School', 'BUR', 'Tide Mill Lane', 'Hampton', 'VA', 23666, 'US', 'Ms. Ashley Ide', '7578254642', 'elementary', NULL),
(158, 5, 'Cary Elementary School', 'CAR', 'Andrews Blvd', 'Hampton', 'VA', 23663, 'US', 'Dr. Heidi Brezinski', '7578505092', 'elementary', NULL),
(159, 5, 'Cooper Elementary School', 'COO', 'Marcella Road', 'Hampton', 'VA', 23666, 'US', 'Ms. Tracie Albea', '7578254645', 'elementary', NULL),
(160, 5, 'Forrest Elementary School', 'FOR', 'Todds Lane', 'Hampton', 'VA', 23666, 'US', 'Dr. Kelli Cedo', '7578254627', 'elementary', NULL),
(161, 5, 'Kraft Elementary School', 'KRA', 'Concord Drive', 'Hampton', 'VA', 23666, 'US', 'Ms. Whitney Cataldo', '7578254634', 'elementary', NULL),
(162, 5, 'Langley Elementary School', 'LAN', 'Rockwell Road', 'Hampton', 'VA', 23669, 'US', 'Ms. Elizabeth Franks', '7578505105', 'elementary', NULL),
(163, 5, 'Machen Elementary School', 'MAC', 'Sacramento Drive', 'Hampton', 'VA', 23666, 'US', 'Ms. Jennifer Humble', '7577272900', 'elementary', NULL),
(164, 5, 'Phillips Elementary School', 'PHI', 'LeMaster Drive', 'Hampton', 'VA', 23669, 'US', 'Ms. Elizabeth Cromartie', '7578505079', 'elementary', NULL),
(165, 5, 'Smith Elementary School', 'SMI', 'Woodland Road', 'Hampton', 'VA', 23669, 'US', 'Dr. Patrina Jenkins', '7578505088', 'elementary', NULL),
(166, 5, 'Tucker-Capps Elementary School', 'TUC', 'Wellington Drive', 'Hampton', 'VA', 23666, 'US', 'Ms. Tiffany Geddie-Suggs', '7578254641', 'elementary', NULL),
(167, 5, 'Tyler Elementary School', 'TYL', 'Salina Street', 'Hampton', 'VA', 23669, 'US', 'Ms. Adriane Bradley-Gray', '7577271439', 'elementary', NULL),
(168, 5, 'Phenix PreK-8 School', 'PHE', 'Big Bethel Road', 'Hampton', 'VA', 23666, 'US', 'Ms. Robin Hunt-Crenshaw', '7572683500', 'elementary', NULL),
(169, 5, 'Davis Middle School', 'DAV', 'Todds Lane', 'Hampton', 'VA', 23666, 'US', 'Ms. Violet Whiteman', '7578254520', 'middle', NULL),
(170, 5, 'Eaton Middle School', 'EAT', 'Cunningham Drive', 'Hampton', 'VA', 23666, 'US', 'Ms. Sharon Slater', '7578254540', 'middle', NULL),
(171, 5, 'Jones Middle School', 'JON', 'Nickerson Blvd', 'Hampton', 'VA', 23663, 'US', 'Dr. Daniel Bowling', '7578507900', 'middle', NULL),
(172, 5, 'Lindsay Middle School', 'LIN', 'Briarfield Road', 'Hampton', 'VA', 23661, 'US', 'Ms. Chevese Thomas', '7578254560', 'middle', NULL),
(173, 5, 'Syms Middle School', 'SYM', 'Fox Hill Road', 'Hampton', 'VA', 23669, 'US', 'Mr. Michael Blount, Jr.', '7578505050', 'middle', NULL),
(174, 5, 'Bethel High School', 'BET', 'Big Bethel Road', 'Hampton', 'VA', 23666, 'US', 'Mr. Ralph Sanders', '7578254400', 'high', NULL),
(175, 5, 'Hampton High School', 'HAM', 'West Queen Street', 'Hampton', 'VA', 23669, 'US', 'Mr. Kevin Davis', '7578254430', 'high', NULL),
(176, 5, 'Kecoughtan High School', 'KEC', 'Woodland Road', 'Hampton', 'VA', 23669, 'US', 'Mr. Jeffrey Mordica', '7578505000', 'high', NULL),
(177, 5, 'Phoebus High School', 'PHE', 'Ireland Street', 'Hampton', 'VA', 23663, 'US', 'Mr. Mark Hudson', '7577271000', 'high', NULL),
(178, 5, 'Bridgeport Academy', 'BPA', 'Briarfield Road', 'Hampton', 'VA', 23669, 'US', 'Ms. Angelina Lipford', '7577271225', 'special', NULL),
(179, 5, 'Motion Early Childhood Center', 'MOT', 'Old Buckroe Road', 'Hampton', 'VA', 23663, 'US', 'Ms. Joanne Drew', '7577271061', 'special', NULL),
(180, 5, 'Spratley Gifted Center', 'SPR', 'Woodland Road', 'Hampton', 'VA', 23669, 'US', 'Dr. Kenneth Crum', '7578505032', 'special', NULL),
(181, 5, 'New Horizons Regional Education Center', 'NHB', 'Butler Farm Road', 'Hampton', 'VA', 23666, 'US', 'Mr. J. Joseph Johnson', '7577661100', 'special', NULL),
(182, 3, 'B. M. Williams Primary', 'BMW', 'Battlefield Blvd.', 'Chesapeake', 'VA', 23320, 'US', 'Mr. Thomas P. Moyer', '7575470238', 'elementary', NULL),
(183, 3, 'Butts Road Intermediate', 'BRI', 'Mt. Pleasant Rd.', 'Chesapeake', 'VA', 23322, 'US', 'Mrs. Nancy L. Cruz', '7574824566', 'middle', NULL),
(184, 3, 'Butts Road Primary', 'BRP', 'Mt. Pleasant Rd.', 'Chesapeake', 'VA', 23222, 'US', 'Mr. James S. Lewter', '7574825820', 'elementary', NULL),
(185, 3, 'Camelot Elementary School', 'CAM', 'Guenevere Drive', 'Chesapeake', 'VA', 23323, 'US', 'Dr. D. Jean Jones', '7575885347', 'elementary', NULL),
(186, 3, 'Carver Intermediate School', 'CAR', 'Broad Street', 'Chesapeake', 'VA', 23324, 'US', 'Mrs. Michelle A. Ferebee', '7574947505', 'middle', NULL),
(187, 3, 'Cedar Road Elementary', 'CRE', 'Cedar Road', 'Chesapeake', 'VA', 23322, 'US', 'Mrs. Tracy A. Cioppa', '7575470166', 'elementary', NULL),
(188, 3, 'Chittum Elementary School', 'CHT', 'Dock Landing Road', 'Chesapeake', 'VA', 23321, 'US', 'Mrs. Sharon W. Miles', '7574656300', 'elementary', NULL),
(189, 3, 'Crestwood Intermediate', 'CWI', 'Great Bridge Blvd', 'Chesapeake', 'VA', 23320, 'US', 'Mrs. Eva Renee Davis', '7574947565', 'middle', NULL),
(190, 3, 'Deep Creek Central Elementary', 'DCC', 'Shipyard Road', 'Chesapeake', 'VA', 23323, 'US', 'Mrs. Barbara H. Fortner', '7575585356', 'elementary', NULL),
(191, 3, 'Deep Creek Elementary', 'DCE', 'Forehand Dr.', 'Chesapeake', 'VA', 23323, 'US', 'Dr. Barry Brown', '7575885333', 'elementary', NULL),
(192, 3, 'Georgetown Primary', 'GTP', 'Providence Road', 'Chesapeake', 'VA', 23325, 'US', 'Mrs. Terry A. Reitz', '7575787060', 'elementary', NULL),
(193, 3, 'Grassfield Elementary School', 'GFE', 'Averill Drive', 'Chesapeake', 'VA', 23323, 'US', 'Mr. Robert J. Sander', '7575888923', 'elementary', NULL),
(194, 3, 'Great Bridge Intermediate', 'GBI', 'Hanbury Road West', 'Chesapeake', 'VA', 23322, 'US', 'Mrs. Heather D. Martin', '7574824405', 'middle', NULL),
(195, 3, 'Great Bridge Primary School', 'GBP', 'Cedar Road', 'Chesapeake', 'VA', 23322, 'US', 'Mrs. Theresa L. Meyers', '7575471135', 'elementary', NULL),
(196, 3, 'Greenbrier Intermediate', 'GRI', '1701 River Birch Run N.', 'Chesapeake', 'VA', 23320, 'US', 'Mr. Keith C. Hyater', '7575787080', 'middle', NULL),
(197, 3, 'Greenbrier Primary School', 'GRP', 'Eden Way, South', 'Chesapeake', 'VA', 23320, 'US', 'Mrs. Joan B. Raybourn', '7574363428', 'elementary', NULL),
(198, 3, 'Norfolk Highlands Primary', 'NHP', 'Myrtle Avenue', 'Chesapeake', 'VA', 23325, 'US', 'Mrs. Shawnia C. Smiley', '7575787092', 'elementary', NULL),
(199, 3, 'Portlock Primary School', 'PRT', 'Varsity Drive', 'Chesapeake', 'VA', 23324, 'US', 'Mrs. Regina B. Ratcliff', '7574947555', 'elementary', NULL),
(200, 3, 'Rena B. Wright Primary', 'RBW', 'Park Avenue', 'Chesapeake', 'VA', 23324, 'US', 'Mrs. Brenda H. Hobbs', '7574947585', 'elementary', NULL),
(201, 3, 'Southeastern Elementary', 'SEE', 'Battlefield Blvd', 'Chesapeake', 'VA', 23322, 'US', 'Dr. Hope P. Terrell', '7574217676', 'elementary', NULL),
(202, 3, 'Southwestern Elementary', 'SWE', 'Airline Blvd.', 'Chesapeake', 'VA', 23321, 'US', 'Mrs. Sonya L. Beasley', '7574666310', 'elementary', NULL),
(203, 3, 'Chesapeake Alternative School', 'CAS', 'Providence Road', 'Chesapeake', 'VA', 23325, 'US', 'Dr. Penny K. Schultz', '7575787046', 'alternative', NULL),
(204, 3, 'Chesapeake Center for Science and Technology', 'CST', 'Cedar Road', 'Chesapeake', 'VA', 23322, 'US', 'Dr. Shonda Pittman-Windham', '7575470134', 'alternative', NULL),
(205, 3, 'Crestwood Middle School', 'CWM', 'Great Bridge Blvd', 'Chesapeake', 'VA', 23320, 'US', 'Mr. Michael R. Ward', '7574947560', 'middle', NULL),
(206, 3, 'Deep Creek High School', 'DCH', 'Margaret Booker Drive', 'Chesapeake', 'VA', 23323, 'US', 'Mrs. J. Page Bagley', '7575585302', 'high', NULL),
(207, 3, 'Deep Creek Middle School', 'DCM', 'Deal Drive', 'Chesapeake', 'VA', 23323, 'US', 'Dr. Muriel P.Barefield', '7575585321', 'middle', NULL),
(208, 3, 'Grassfield High School', 'GFH', 'Grizzly Trail', 'Chesapeake', 'VA', 23323, 'US', 'Mr. Michael N. Perez', '7575584749', 'high', NULL),
(209, 3, 'Great Bridge High School', 'GBH', 'West Hanbury Road', 'Chesapeake', 'VA', 23322, 'US', 'Mr. Jeffrey Johnson', '7574825191', 'high', NULL),
(210, 3, 'Great Bridge Middle School', 'GBM', 'South Battlefield Blvd', 'Chesapeake', 'VA', 23322, 'US', 'Mr. Craig K. Mills', '7574825128', 'middle', NULL),
(211, 3, 'Green Rum Middle', 'GRM', 'Greenbrier Parkway', 'Chesapeake', 'VA', 23320, 'US', 'Dr. Michael J. Mustain', '7575485309', 'middle', NULL),
(212, 3, 'Hickory Elementary School', 'HES', 'Benefit Road', 'Chesapeake', 'VA', 23322, 'US', 'Mrs. Kim Pinello', '7574217080', 'elementary', NULL),
(213, 3, 'Hickory High School', 'HHS', 'Hawk Blvd', 'Chesapeake', 'VA', 23322, 'US', 'Ms. Amber N. Dortch', '7574214295', 'high', NULL),
(214, 3, 'Hickory Middle School', 'HMS', 'Hawk Blvd', 'Chesapeake', 'VA', 23322, 'US', 'Dr. Deborah T. Hutchens', '7574210468', 'middle', NULL),
(215, 3, 'Hugo Owens Middle School', 'OMS', 'Horseback Run', 'Chesapeake', 'VA', 23323, 'US', 'Mrs. Alaina C. Britt', '7575585382', 'middle', NULL),
(216, 3, 'Indian River High School', 'IRH', 'Braves Trail', 'Chesapeake', 'VA', 23325, 'US', 'Mrs. Naomi R. Dunbar', '7575787000', 'high', NULL),
(217, 3, 'Indian River Middle School', 'IRM', 'Old Greenbrier Road', 'Chesapeake', 'VA', 23325, 'US', 'Ms. Terre J. Werts', '7575787030', 'middle', NULL),
(218, 3, 'Jolliff Middle School', 'JMS', 'Jolliff Road', 'Chesapeake', 'VA', 23321, 'US', 'Mr. Quentin E. Hicks', '7574651646', 'middle', NULL),
(219, 3, 'Oscar Smith High School', 'OSH', 'Tiger Drive', 'Chesapeake', 'VA', 23320, 'US', 'Mr. Paul A. Joseph', '7575480696', 'high', NULL),
(220, 3, 'Oscar Smith Middle School', 'OSM', 'Rodgers Street', 'Chesapeake', 'VA', 23324, 'US', 'Mrs. Judith C. Thurston', '7574947590', 'middle', NULL),
(221, 3, 'Sparrow Road Intermediate', 'SRI', 'Sparrow Road', 'Chesapeake', 'VA', 23321, 'US', 'Ms. Sharon L. Popson', '7575787050', 'middle', NULL),
(222, 3, 'Thurgood Marshall Elementary', 'TME', 'Border Road', 'Chesapeake', 'VA', 23324, 'US', 'Mrs. Karen Y. Lopez', '7574947515', 'elementary', NULL),
(223, 3, 'Treakle Elementary School', 'TES', 'Gomerton Road', 'Chesapeake', 'VA', 23323, 'US', 'Mrs. Shelia J. Johnson', '7575585361', 'elementary', NULL),
(224, 3, 'Truitt Intermediate School', 'TIS', 'Holly Avenue', 'Chesapeake', 'VA', 23324, 'US', 'Mrs. Kimberly G. Lowden', '7574948014', 'middle', NULL),
(225, 3, 'Western Branch High School', 'WBH', 'Bruin Place', 'Chesapeake', 'VA', 23321, 'US', 'Dr. Thomas A. Whitley', '7576387904', 'high', NULL),
(226, 3, 'Western Branch Intermediate', 'WBI', 'Terry Drive', 'Chesapeake', 'VA', 23321, 'US', 'Ms. Jataune N. Jones', '7576387941', 'middle', NULL),
(227, 3, 'Western Branch Middle School', 'WBM', 'Hawksley Drive', 'Chesapeake', 'VA', 23321, 'US', 'Dr. Kambar Khoshaba', '7576387920', 'middle', NULL),
(228, 3, 'Western Branch Primary', 'WBP', 'Terry Drive', 'Chesapeake', 'VA', 23321, 'US', 'Mrs. Gayle J. Bartlett', '7576387951', 'elementary', NULL),
(229, 7, 'Advanced Technology Center', 'ATC', 'College Crescent', 'Virginia Beach', 'VA', 23453, 'US', 'Mr. Michael D. Taylor, Director', '757.648.5800', 'alternative', NULL),
(230, 7, 'Alanton Elementary', 'ALE', 'Stephens Road', 'Virginia Beach', 'VA', 23454, 'US', 'Ms. Charlene E. Garran', '757.648.2000', 'elementary', NULL),
(231, 7, 'Arrowhead Elementary', 'ARE', 'Susquehanna Drive', 'Virginia Beach', 'VA', 23462, 'US', 'Mr. Benjamin L. Gillikin', '757.648.2040', 'elementary', NULL),
(232, 7, 'Bayside Elementary', 'BAE', 'Bayside Road', 'Virginia Beach', 'VA', 23455, 'US', 'Ms. Catherine M. Brumm', '757.648.2080', 'elementary', NULL),
(233, 7, 'Bayside High', 'BAH', 'Haygood Road', 'Virginia Beach', 'VA', 23455, 'US', 'Mr. James D. Miller', '757.648.5200', 'high', NULL),
(234, 7, 'Bayside Middle', 'BAM', 'Newtown Road', 'Virginia Beach', 'VA', 23462, 'US', 'Dr. Paula Johnson', '757.648.4400', 'middle', NULL),
(235, 7, 'Bayside Sixth Grade Campus', 'BSG', 'Jericho Road', 'Virginia Beach', 'VA', 23462, 'US', 'Ms. Camille A. Harmon', '757.648.4440', 'elementary', NULL),
(236, 7, 'Birdneck Elementary', 'BRD', 'S. Birdneck Road', 'Virginia Beach', 'VA', 23451, 'US', 'Mr. Robert V. Yoshida', '757.648.2120', 'elementary', NULL),
(237, 7, 'Brandon Middle', 'BRN', 'Pope Street', 'Virginia Beach', 'VA', 23464, 'US', 'Ms. Christy E. McQueeney', '757.648.4450', 'middle', NULL),
(238, 7, 'Brookwood Elementary', 'BRK', 'S. Lynnhaven Road', 'Virginia Beach', 'VA', 23452, 'US', 'Mrs. Christine C. Alarcon', '757.648.2160', 'elementary', NULL),
(239, 7, 'Centerville Elementary', 'CNT', 'Centerville Turnpike', 'Virginia Beach', 'VA', 23464, 'US', 'Ms. Teresa A. Ritzel', '757.648.2200', 'elementary', NULL),
(240, 7, 'Christopher Farms Elementary', 'CFE', 'Pleasant Acres Drive', 'Virginia Beach', 'VA', 23453, 'US', 'Ms. Teri A. Breaux', '757.648.2240', 'elementary', NULL),
(241, 7, 'College Park Elementary', 'CPE', 'Bennington Road', 'Virginia Beach', 'VA', 23464, 'US', 'Dr. Sterling A. White, Jr.', '757.648.2280', 'elementary', NULL),
(242, 7, 'Cooke Elementary', 'CKE', 'Mediterranean Avenue', 'Virginia Beach', 'VA', 23451, 'US', 'Mrs. Pamela M. Bennis', '757.648.2320', 'elementary', NULL),
(243, 7, 'Corporate Landing Elementary', 'CLE', 'Corporate Landing Pkwy', 'Virginia Beach', 'VA', 23454, 'US', 'Ms. Kelly W. Coon', '757.648.2360', 'elementary', NULL),
(244, 7, 'Corporate Landing Middle', 'CLM', 'Corporate Landing Pkwy', 'Virginia Beach', 'VA', 23454, 'US', 'Dr. Freddie P. Alarcon, Jr.', '757.648.4500', 'middle', NULL),
(245, 7, 'Cox High', 'COX', 'Shorehaven Drive', 'Virginia Beach', 'VA', 23454, 'US', 'Dr. Randi R. Riesbeck', '757.648.5250', 'high', NULL),
(246, 7, 'Creeds Elementary', 'CRD', 'Princess Anne Road', 'Virginia Beach', 'VA', 23457, 'US', 'Ms. Casey L. Conger', '757.648.2400', 'elementary', NULL),
(247, 7, 'Dey Elementary', 'DEY', 'N. Great Neck Road', 'Virginia Beach', 'VA', 23454, 'US', 'Ms. Elizabeth C. Bianchi', '757.648.2440', 'elementary', NULL),
(248, 7, 'Diamond Springs Elementary', 'DSE', 'Learning Circle', 'Virginia Beach', 'VA', 23462, 'US', 'Ms. Gloria Coston', '757.648.4240', 'elementary', NULL),
(249, 7, 'Fairfield Elementary', 'FFE', 'Providence Road', 'Virginia Beach', 'VA', 23464, 'US', 'Mr. Douglas Knapp', '757.648.2480', 'elementary', NULL),
(250, 7, 'First Colonial High', 'FCH', 'Mill Dam Road', 'Virginia Beach', 'VA', 23454, 'US', 'Dr. Nancy B. Farrell', '757.648.5300', 'high', NULL),
(251, 7, 'Glenwood Elementary', 'GLD', 'Round Hill Drive', 'Virginia Beach', 'VA', 23464, 'US', 'Dr. Karin E. DiMaggio', '757.648.2520', 'elementary', NULL),
(252, 7, 'Great Neck Middle', 'GNM', 'North Great Neck Road', 'Virginia Beach', 'VA', 23454, 'US', 'Dr. Eugene F. Soltner', '757.648.4550', 'middle', NULL),
(253, 7, 'Green Run Collegiate', 'GRC', 'Dahlia Drive', 'Virginia Beach', 'VA', 23453, 'US', 'Mrs. Barbara J. Winn', '757.648.5393', 'pilot', NULL),
(254, 7, 'Green Run Elementary', 'GRE', 'Green Garden Circle', 'Virginia Beach', 'VA', 23453, 'US', 'Ms. Sheila M. Wynn', '757.648.2560', 'elementary', NULL),
(255, 7, 'Green Run High', 'GRH', 'Dahlia Drive', 'Virginia Beach', 'VA', 23453, 'US', 'Mr. C. Todd Tarkenton', '757.648.5350', 'high', NULL),
(256, 7, 'Hermitage Elementary', 'HRM', 'Pleasure House Road', 'Virginia Beach', 'VA', 23455, 'US', 'Mrs. Holly J. Coggin', '757.648.2600', 'elementary', NULL),
(257, 7, 'Holland Elementary', 'HOL', 'Holland Road', 'Virginia Beach', 'VA', 23452, 'US', 'Dr. Callie M. Richardson', '757.648.2640', 'elementary', NULL),
(258, 7, 'Independence Middle', 'IND', 'Dunstan Lane', 'Virginia Beach', 'VA', 23455, 'US', 'Mr. Carey Manugo', '757.648.4600', 'middle', NULL),
(259, 7, 'Indian Lakes Elementary', 'ILE', 'Homestead Drive', 'Virginia Beach', 'VA', 23464, 'US', 'Ms. Jennifer C. Born', '757.648.2680', 'elementary', NULL),
(260, 7, 'Kellam High', 'KEL', 'West Neck Rd', 'Virginia Beach', 'VA', 23456, 'US', 'Dr. Daniel W. Smith', '757.648.5100', 'high', NULL),
(261, 7, 'Kempsville Elementary', 'KEE', 'Kempsville Road', 'Virginia Beach', 'VA', 23464, 'US', 'Ms. Lori S. Hasher', '757.648.2720', 'elementary', NULL),
(262, 7, 'Kempsville High', 'KEH', 'Chief Trail', 'Virginia Beach', 'VA', 23464, 'US', 'Mr. William W. Harris', '757.648.5450', 'high', NULL),
(263, 7, 'Kempsville Meadows Elementary', 'KME', 'Edwin Drive', 'Virginia Beach', 'VA', 23462, 'US', 'Mr. Mikelle C. Williams', '757.648.2760', 'elementary', NULL),
(264, 7, 'Kempsville Middle', 'KEM', 'Churchill Drive', 'Virginia Beach', 'VA', 23464, 'US', 'Dr. Patti T. Jenkins', '757.648.4700', 'middle', NULL),
(265, 7, 'Kings Grant Elementary', 'KGE', 'N. Lynnhaven Road', 'Virginia Beach', 'VA', 23452, 'US', 'Ms. Lisa D. Hannah', '757.648.2800', 'elementary', NULL),
(266, 7, 'Kingston Elementary', 'KNG', 'King\'s Grant Road', 'Virginia Beach', 'VA', 23452, 'US', 'Dr. Sharon H. Shewbridge', '757.648.2840', 'elementary', NULL),
(267, 7, 'Landstown Elementary', 'LNE', 'Recreation Drive', 'Virginia Beach', 'VA', 23456, 'US', 'Mr. Jeffrey D. Hofmann', '757.648.2880', 'elementary', NULL),
(268, 7, 'Landstown High', 'LNH', 'Concert Drive', 'Virginia Beach', 'VA', 23456, 'US', 'Dr. Cheryl C. Askew', '757.648.5500', 'high', NULL),
(269, 7, 'Landstown Middle', 'LNM', 'Recreation Drive', 'Virginia Beach', 'VA', 23456, 'US', 'Mr. John T. Parkman', '757.648.4750', 'middle', NULL),
(270, 7, 'Larkspur Middle', 'LRK', 'Princess Anne Road', 'Virginia Beach', 'VA', 23462, 'US', 'Dr. Melanie J. Hamblin', '757.648.4800', 'middle', NULL),
(271, 7, 'Linkhorn Park Elementary', 'LNK', 'First Colonial Road', 'Virginia Beach', 'VA', 23454, 'US', 'Ms. Barbara Sessoms', '757.648.2920', 'elementary', NULL),
(272, 7, 'Luxford Elementary', 'LUX', 'Haygood Road', 'Virginia Beach', 'VA', 23455, 'US', 'Ms. Danielle E. Colucci', '757.648.2960', 'elementary', NULL),
(273, 7, 'Lynnhaven Elementary', 'LNE', 'Dillon Drive', 'Virginia Beach', 'VA', 23452, 'US', 'Mrs. Katherine R. Everett', '757.648.3000', 'elementary', NULL),
(274, 7, 'Lynnhaven Middle', 'LNM', 'Bayne Drive', 'Virginia Beach', 'VA', 23454, 'US', 'Dr. Violet B. Hoyle', '757.648.4850', 'middle', NULL),
(275, 7, 'Malibu Elementary', 'MAL', 'Edinburgh Drive', 'Virginia Beach', 'VA', 23452, 'US', 'Mr. Michael Maloney', '757.648.3040', 'elementary', NULL),
(276, 7, 'New Castle Elementary', 'NCE', 'Dam Neck Road', 'Virginia Beach', 'VA', 23456, 'US', 'Ms. Gloria Harris', '757.648.3080', 'elementary', NULL),
(277, 7, 'Newtown Elementary', 'NEW', 'Learning Circle', 'Virginia Beach', 'VA', 23462, 'US', 'Mr. Richard Sidone, Interim', '757.648.3120', 'elementary', NULL),
(278, 7, 'North Landing Elementary', 'NLE', 'North Landing Road', 'Virginia Beach', 'VA', 23456, 'US', 'Ms. Jill S. Barger', '757.648.3160', 'elementary', NULL),
(279, 7, 'Ocean Lakes Elementary', 'OLE', 'Upton Drive', 'Virginia Beach', 'VA', 23454, 'US', 'Dr. Linda Reese', '757.648.3200', 'elementary', NULL),
(280, 7, 'Ocean Lakes High', 'OLH', 'Schumann Drive', 'Virginia Beach', 'VA', 23454, 'US', 'Dr. Claire R. LeBlanc', '757.648.5550', 'high', NULL),
(281, 7, 'Old Donation School', 'ODH', 'Honeygrove Road', 'Virginia Beach', 'VA', 23455, 'US', 'Dr. Kelly A. Hedrick', '757.648.3240', 'alternative', NULL),
(282, 7, 'Parkway Elementary', 'PRK', 'O\'Hare Drive', 'Virginia Beach', 'VA', 23453, 'US', 'Mrs. Krista Barton-Arnold', '757.648.3280', 'elementary', NULL),
(283, 7, 'Pembroke Elementary', 'PME', 'Jericho Road', 'Virginia Beach', 'VA', 23462, 'US', 'Dr. Linda Hayes', '757.648.3320', 'elementary', NULL),
(284, 7, 'Pembroke Meadows Elementary', 'PMM', 'Cathedral Drive', 'Virginia Beach', 'VA', 23455, 'US', 'Dr. Charles L. Spivey', '757.648.3360', 'elementary', NULL),
(285, 7, 'Plaza Middle', 'PLZ', 'S. Lynnhaven Road', 'Virginia Beach', 'VA', 23452, 'US', 'Mr. Rodney Joe Burnsworth', '757.648.4900', 'middle', NULL),
(286, 7, 'Point O View Elementary', 'POV', 'Parliament Drive', 'Virginia Beach', 'VA', 23462, 'US', 'Mr. John T. Chowns', '757.648.3440', 'elementary', NULL),
(287, 7, 'Princess Anne Elementary', 'PAE', 'Seaboard Road', 'Virginia Beach', 'VA', 23456, 'US', 'Mr. Patrick I. Wroton', '757.648.3480', 'elementary', NULL),
(288, 7, 'Princess Anne High', 'PAH', 'Virginia Beach Blvd.', 'Virginia Beach', 'VA', 23462, 'US', 'Mr. Danny M. Little', '757.648.5600', 'high', NULL),
(289, 7, 'Princess Anne Middle', 'PAM', 'Holland Road', 'Virginia Beach', 'VA', 23453, 'US', 'Dr. D. Alex Bergren', '757.648.4950', 'middle', NULL),
(290, 7, 'Providence Elementary', 'PRV', 'Providence Road', 'Virginia Beach', 'VA', 23464, 'US', 'Mr. Michael A. Taylor', '757.648.3520', 'elementary', NULL),
(291, 7, 'Red Mill Elementary', 'RME', 'Sandbridge Road', 'Virginia Beach', 'VA', 23456, 'US', 'Dr. Michelle L. Miller', '757.648.3560', 'elementary', NULL),
(292, 7, 'Renaissance Academy', 'REN', 'Cleveland Street', 'Virginia Beach', 'VA', 23462, 'US', 'Ms. Kay L. Thomas', '757-648-6000', 'alternative', NULL),
(293, 7, 'Rosemont Elementary', 'ROS', 'Rosemont Road', 'Virginia Beach', 'VA', 23453, 'US', 'Ms. Cari A. Hall', '757.648.3600', 'elementary', NULL),
(294, 7, 'Rosemont Forest Elementary', 'RFE', 'Grey Friars Chase', 'Virginia Beach', 'VA', 23456, 'US', 'Mr. Gregory Furlich', '757.648.3640', 'elementary', NULL),
(295, 7, 'Salem Elementary', 'SLE', 'Salem Lakes Blvd.', 'Virginia Beach', 'VA', 23456, 'US', 'Dr. Ann Shufflebarger', '757.648.3680', 'elementary', NULL),
(296, 7, 'Salem High', 'SLH', 'SunDevil Drive', 'Virginia Beach', 'VA', 23464, 'US', 'Mr. Matthew Delaney', '757.648.5650', 'high', NULL),
(297, 7, 'Salem Middle', 'SLM', 'Lynnhaven Parkway', 'Virginia Beach', 'VA', 23464, 'US', 'Dr. James J. Smith', '757.648.5000', 'middle', NULL),
(298, 7, 'Seatack Elementary', 'SEA', 'S. Birdneck Road', 'Virginia Beach', 'VA', 23451, 'US', 'Mr. Vincent M. Darby, Sr.', '757.648.3720', 'elementary', NULL),
(299, 7, 'Shelton Park Elementary', 'SPE', 'Shelton Road', 'Virginia Beach', 'VA', 23455, 'US', 'Ms. Tara M. Brewer', '757.648.3760', 'elementary', NULL),
(300, 7, 'Strawbridge Elementary', 'STR', 'Strawbridge Road', 'Virginia Beach', 'VA', 23456, 'US', 'Ms. Jacqueline Y. Sargent', '757.648.3800', 'elementary', NULL),
(301, 7, 'Tallwood Elementary', 'TLE', 'Kempsville Road', 'Virginia Beach', 'VA', 23464, 'US', 'Mr. David B. French', '757.648.3840', 'elementary', NULL),
(302, 7, 'Tallwood High', 'TLH', 'Kempsville Road', 'Virginia Beach', 'VA', 23464, 'US', 'Dr. James Avila', '757.648.5700', 'high', NULL),
(303, 7, 'Technical and Career Education Center', 'TEC', 'North Landing Road', 'Virginia Beach', 'VA', 23456, 'US', 'Mr. David C. Swanger, Director', '757.648.5850', 'alternative', NULL),
(304, 7, 'Thalia Elementary', 'THA', 'Thalia Road', 'Virginia Beach', 'VA', 23452, 'US', 'Dr. Mary Daniels, Interim', '757.648.3880', 'elementary', NULL),
(305, 7, 'Thoroughgood Elementary', 'THE', 'Dunstan Lane', 'Virginia Beach', 'VA', 23455, 'US', 'Dr. Cheryl Zigrang', '757.648.3920', 'elementary', NULL),
(306, 7, 'Three Oaks Elementary', 'TOE', 'Elson Green Avenue', 'Virginia Beach', 'VA', 23456, 'US', 'Ms. Linda L. Sidone', '757.648.3960', 'elementary', NULL),
(307, 7, 'Trantwood Elementary', 'TRN', 'Inlynnview Road', 'Virginia Beach', 'VA', 23454, 'US', 'Ms. Lou Anne Metzger', '757.648-4000', 'elementary', NULL),
(308, 7, 'Virginia Beach Juvenile Detention Center/Education Program', 'JDC', 'George Mason Drive', 'Virginia Beach', 'VA', 23456, 'US', 'Mr. Charles Foster', '757.263.1203', 'alternative', NULL),
(309, 7, 'Virginia Beach Middle', 'VBM', '25th Street', 'Virginia Beach', 'VA', 23451, 'US', 'Dr. Sandra R. Brown', '757.648.5050', 'middle', NULL),
(310, 7, 'White Oaks Elementary', 'WHO', 'Windsor Oaks Blvd.', 'Virginia Beach', 'VA', 23462, 'US', 'Mrs. Stephanie D. Haus', '757.648.4040', 'elementary', NULL),
(311, 7, 'Williams Elementary', 'WLM', 'Newtown Road', 'Virginia Beach', 'VA', 23462, 'US', 'Mr. Timothy Sullivan', '757.648.4080', 'elementary', NULL),
(312, 7, 'Windsor Oaks Elementary', 'WOE', 'Van Buren Drive', 'Virginia Beach', 'VA', 23452, 'US', 'Dr. Sherri Archer', '757.648.4120', 'elementary', NULL),
(313, 7, 'Windsor Woods Elementary', 'WWE', 'Presidential Blvd.', 'Virginia Beach', 'VA', 23452, 'US', 'Mr. Matthew A. Orebaugh', '757.648.4160', 'elementary', NULL),
(314, 7, 'Woodstock Elementary', 'WOD', 'Providence Road', 'Virginia Beach', 'VA', 23464, 'US', 'Ms. Amy N. Hedrick', '757.648.4200', 'elementary', NULL),
(315, 1, 'aa', 'a', 'q', 'q', 'q', 0, 'q', 'aa', '123', 'Elementary', NULL),
(316, 1, 'e', 'e', 'e', 'e', 'e', 12, 'dd', 'e', 'e', 'Elementary', NULL),
(317, 1, 't', 't', 'h', 'g', 'v', 54, 'United States', 'g', '5', 'Special', NULL),
(318, 1, 'uu1', 'u1', 'h1', 'f1', 'g1', 71, 'United States', 'h1', 'k1', 'Special', 'h1'),
(319, 1, 'q', 'q', 'q', 'q', 'qq', 4, 'United States', 'q', 'q', 'special', 'qq'),
(320, 2, 'rr', 'r', 'gfg', 'fgf', 'fgf', 45, 'United States', '75', 'kh', 'special', 'fgfg');

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
  MODIFY `ad_tripid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `lpr_billing`
--
ALTER TABLE `lpr_billing`
  MODIFY `bill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `lpr_cashadvance`
--
ALTER TABLE `lpr_cashadvance`
  MODIFY `c_advanceid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
  MODIFY `driver_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;
--
-- AUTO_INCREMENT for table `lpr_order`
--
ALTER TABLE `lpr_order`
  MODIFY `o_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `lpr_rates`
--
ALTER TABLE `lpr_rates`
  MODIFY `rate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `lpr_ridealong`
--
ALTER TABLE `lpr_ridealong`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `lpr_school`
--
ALTER TABLE `lpr_school`
  MODIFY `school_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=321;
--
-- AUTO_INCREMENT for table `lpr_student`
--
ALTER TABLE `lpr_student`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `lpr_triplog`
--
ALTER TABLE `lpr_triplog`
  MODIFY `triplog_tripid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;
--
-- AUTO_INCREMENT for table `lpr_zones`
--
ALTER TABLE `lpr_zones`
  MODIFY `zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
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
-- Database: `phpmyadmin`
--
DROP DATABASE IF EXISTS `phpmyadmin`;
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Dumping data for table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'database', 'a', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"lpr_client\",\"lpr_driver\",\"lpr_order\",\"lpr_school\",\"lpr_student\"],\"table_structure[]\":[\"lpr_client\",\"lpr_driver\",\"lpr_order\",\"lpr_school\",\"lpr_student\"],\"table_data[]\":[\"lpr_client\",\"lpr_driver\",\"lpr_order\",\"lpr_school\",\"lpr_student\"],\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"json_structure_or_data\":\"data\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"excel_columns\":null,\"htmlword_columns\":null,\"json_pretty_print\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_use_transaction\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"lpr_portal\",\"table\":\"lpr_zones\"},{\"db\":\"lpr_portal\",\"table\":\"lpr_triplog\"},{\"db\":\"lpr_portal\",\"table\":\"lpr_school\"},{\"db\":\"lpr_portal\",\"table\":\"lpr_ridealong\"},{\"db\":\"lpr_portal\",\"table\":\"lpr_rates\"},{\"db\":\"lpr_portal\",\"table\":\"lpr_order\"},{\"db\":\"lpr_portal\",\"table\":\"lpr_driver\"},{\"db\":\"lpr_portal\",\"table\":\"lpr_dates\"},{\"db\":\"lpr_portal\",\"table\":\"lpr_client\"},{\"db\":\"lpr_portal\",\"table\":\"lpr_cashadvance\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'lpr_portal', 'lpr_order', '{\"CREATE_TIME\":\"2017-07-03 12:35:02\",\"col_visib\":[\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\"]}', '2017-07-12 17:32:59'),
('root', 'lpr_portal', 'lpr_triplog', '{\"CREATE_TIME\":\"2017-07-04 20:43:11\",\"col_order\":[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"22\",\"23\",\"24\",\"21\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\",\"51\",\"52\",\"53\",\"54\",\"55\",\"56\",\"57\",\"58\",\"59\"],\"col_visib\":[\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\"]}', '2017-07-12 20:44:55');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2017-05-15 16:22:22', '{\"collation_connection\":\"utf8mb4_unicode_ci\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;--
-- Database: `test`
--
DROP DATABASE IF EXISTS `test`;
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
