-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 13, 2020 at 10:39 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `notice-board`
--

-- --------------------------------------------------------

--
-- Table structure for table `chair_conf`
--

CREATE TABLE `chair_conf` (
  `id` int(11) NOT NULL,
  `eid` int(11) NOT NULL,
  `dt` date NOT NULL,
  `tim` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chair_conf`
--

INSERT INTO `chair_conf` (`id`, `eid`, `dt`, `tim`) VALUES
(4, 2, '2020-02-19', '10:00');

-- --------------------------------------------------------

--
-- Table structure for table `crs_info`
--

CREATE TABLE `crs_info` (
  `crsid` int(11) NOT NULL,
  `crs_nme` varchar(75) NOT NULL,
  `st` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `crs_info`
--

INSERT INTO `crs_info` (`crsid`, `crs_nme`, `st`) VALUES
(6, 'Btech', 1),
(7, 'Master Course', 1),
(8, 'Mtech', 1);

-- --------------------------------------------------------

--
-- Table structure for table `dbt_ans`
--

CREATE TABLE `dbt_ans` (
  `id` int(11) NOT NULL,
  `dbtid` int(11) NOT NULL,
  `ans` text NOT NULL,
  `dt` date NOT NULL,
  `ansby` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dbt_ans`
--

INSERT INTO `dbt_ans` (`id`, `dbtid`, `ans`, `dt`, `ansby`) VALUES
(1, 2, 'GET and POST', '0000-00-00', 'j101');

-- --------------------------------------------------------

--
-- Table structure for table `dep_info`
--

CREATE TABLE `dep_info` (
  `depid` int(11) NOT NULL,
  `crsid` int(11) NOT NULL,
  `dep_nme` varchar(150) NOT NULL,
  `st` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dep_info`
--

INSERT INTO `dep_info` (`depid`, `crsid`, `dep_nme`, `st`) VALUES
(9, 6, 'Mechanical', 1),
(10, 6, 'Civil', 1),
(11, 7, 'MCA', 1),
(12, 8, 'Power System', 1);

-- --------------------------------------------------------

--
-- Table structure for table `exam_assign`
--

CREATE TABLE `exam_assign` (
  `id` int(11) NOT NULL,
  `eid` int(11) NOT NULL,
  `crsid` int(11) NOT NULL,
  `depid` int(11) NOT NULL,
  `acyr` int(11) NOT NULL,
  `sem` int(11) NOT NULL,
  `subjid` varchar(20) NOT NULL,
  `dt` date NOT NULL,
  `tim` varchar(50) NOT NULL,
  `seat_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_assign`
--

INSERT INTO `exam_assign` (`id`, `eid`, `crsid`, `depid`, `acyr`, `sem`, `subjid`, `dt`, `tim`, `seat_status`) VALUES
(1, 1, 6, 9, 0, 1, 'mc101', '2019-12-28', '10:00', 0),
(2, 1, 6, 9, 0, 1, 'mc102', '2019-12-28', '14:00', 0),
(3, 1, 6, 9, 0, 1, 'mc103', '2019-12-30', '10:00', 0),
(4, 1, 6, 9, 0, 3, 'CS201', '2019-12-31', '10:00', 0),
(5, 1, 6, 9, 0, 3, 'CS202', '2019-12-31', '14:00', 0),
(6, 1, 6, 9, 0, 3, 'CS203', '2020-01-02', '10:00', 0),
(7, 1, 7, 11, 0, 1, 'RLMCA101', '2019-12-28', '10:00', 0),
(8, 1, 7, 11, 0, 1, 'RLMCA102', '2019-12-28', '02:00', 0),
(9, 1, 6, 9, 0, 2, 'BT9001', '2020-01-14', '10:00', 0),
(10, 1, 6, 9, 0, 2, 'BT9002', '2020-01-14', '14:00', 0),
(11, 1, 6, 9, 0, 2, 'BT9003', '2020-01-20', '10:00', 0),
(12, 1, 6, 9, 0, 2, 'BT9004', '2020-01-21', '10:00', 0),
(13, 2, 6, 9, 0, 1, 'mc101', '2020-02-18', '10:00', 0),
(14, 2, 6, 9, 0, 1, 'mc102', '2020-02-19', '10:00', 0),
(15, 2, 6, 9, 0, 1, 'mc103', '2020-02-20', '10:00', 0),
(16, 2, 7, 11, 0, 1, 'RLMCA101', '2020-02-18', '10:00', 0),
(17, 2, 7, 11, 0, 1, 'RLMCA102', '2020-02-19', '10:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exam_cmplnt`
--

CREATE TABLE `exam_cmplnt` (
  `id` int(11) NOT NULL,
  `dt` date NOT NULL,
  `tim` varchar(50) NOT NULL,
  `eid` int(11) NOT NULL,
  `rmnum` int(11) NOT NULL,
  `admnum` varchar(100) NOT NULL,
  `pic` varchar(50) NOT NULL,
  `descr` text NOT NULL,
  `st` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_cmplnt`
--

INSERT INTO `exam_cmplnt` (`id`, `dt`, `tim`, `eid`, `rmnum`, `admnum`, `pic`, `descr`, `st`) VALUES
(1, '2019-12-28', '10:00', 1, 205, '112007', '111111.jpeg', 'trying to copy', 1),
(2, '2019-12-28', '10:00', 1, 205, '4000103', '22222.jpg', 'Problem making Student', 1);

-- --------------------------------------------------------

--
-- Table structure for table `exam_data`
--

CREATE TABLE `exam_data` (
  `id` int(11) NOT NULL,
  `exm_titl` varchar(250) NOT NULL,
  `st` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_data`
--

INSERT INTO `exam_data` (`id`, `exm_titl`, `st`) VALUES
(1, 'Second Series Examination 2019', 0),
(2, 'First Series Examination 2020', 1),
(3, 'testing', 1);

-- --------------------------------------------------------

--
-- Table structure for table `exam_stud`
--

CREATE TABLE `exam_stud` (
  `id` int(11) NOT NULL,
  `eassign_id` int(11) NOT NULL,
  `studid` varchar(20) NOT NULL,
  `xamtyp` int(11) NOT NULL COMMENT '1=normal,2=supply'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_stud`
--

INSERT INTO `exam_stud` (`id`, `eassign_id`, `studid`, `xamtyp`) VALUES
(36, 14, 'BT5000101', 1),
(37, 14, 'BT5000102', 1),
(38, 14, 'BT5000103', 1),
(39, 14, 'BT5000104', 1),
(40, 14, 'BT5000105', 1),
(41, 14, 'BT5000106', 1),
(42, 14, 'BT5000107', 1),
(43, 14, 'BT5000108', 1),
(44, 14, 'BT5000109', 1),
(45, 14, 'BT5000110', 1),
(46, 14, 'BT5000111', 1),
(47, 14, 'BT5000112', 1),
(48, 14, 'BT5000113', 1),
(49, 14, 'BT5000114', 1),
(50, 14, 'BT5000115', 1),
(51, 14, 'BT5000116', 1),
(52, 14, 'BT5000117', 1),
(53, 14, 'BT5000118', 1),
(54, 14, 'BT5000119', 1),
(55, 14, 'BT5000120', 1),
(56, 14, 'BT5000121', 1),
(57, 14, 'BT5000122', 1),
(58, 14, 'BT5000123', 1),
(59, 14, 'BT5000124', 1),
(60, 14, 'BT5000125', 1),
(61, 14, 'BT5000126', 1),
(62, 14, 'BT5000127', 1),
(63, 14, 'BT5000128', 1),
(64, 14, 'BT5000129', 2),
(65, 14, 'BT5000130', 2),
(66, 14, 'BT5000131', 2),
(67, 14, 'BT5000132', 2),
(68, 14, 'BT5000133', 2),
(69, 14, 'BT5000134', 2),
(70, 14, 'BT5000135', 2),
(71, 15, 'BT5000101', 1),
(72, 15, 'BT5000102', 1),
(73, 15, 'BT5000103', 1),
(74, 15, 'BT5000104', 1),
(75, 15, 'BT5000105', 1),
(76, 15, 'BT5000106', 1),
(77, 15, 'BT5000107', 1),
(78, 15, 'BT5000108', 1),
(79, 15, 'BT5000109', 1),
(80, 15, 'BT5000110', 1),
(81, 15, 'BT5000111', 1),
(82, 15, 'BT5000112', 1),
(83, 15, 'BT5000113', 1),
(84, 15, 'BT5000114', 1),
(85, 15, 'BT5000115', 1),
(86, 15, 'BT5000116', 1),
(87, 15, 'BT5000117', 1),
(88, 15, 'BT5000118', 1),
(89, 15, 'BT5000119', 1),
(90, 15, 'BT5000120', 1),
(91, 15, 'BT5000121', 1),
(92, 15, 'BT5000122', 1),
(93, 15, 'BT5000123', 1),
(94, 15, 'BT5000124', 1),
(95, 15, 'BT5000125', 1),
(96, 15, 'BT5000126', 1),
(97, 15, 'BT5000127', 1),
(98, 15, 'BT5000128', 1),
(99, 15, 'BT5000129', 2),
(100, 15, 'BT5000130', 2),
(101, 15, 'BT5000131', 2),
(102, 15, 'BT5000132', 2),
(103, 15, 'BT5000133', 2),
(104, 15, 'BT5000134', 2),
(105, 15, 'BT5000135', 2),
(106, 16, 'MCA5000101', 1),
(107, 16, 'MCA5000102', 1),
(108, 16, 'MCA5000103', 1),
(109, 16, 'MCA5000104', 1),
(110, 16, 'MCA5000105', 1),
(111, 16, 'MCA5000106', 1),
(112, 16, 'MCA5000107', 1),
(113, 16, 'MCA5000108', 1),
(114, 16, 'MCA5000109', 1),
(115, 16, 'MCA5000110', 1),
(116, 16, 'MCA5000111', 1),
(117, 16, 'MCA5000112', 1),
(118, 16, 'MCA5000113', 1),
(119, 16, 'MCA5000114', 1),
(120, 16, 'MCA5000115', 1),
(121, 16, 'MCA5000116', 1),
(122, 16, 'MCA5000117', 1),
(123, 16, 'MCA5000118', 1),
(124, 16, 'MCA5000119', 1),
(125, 16, 'MCA5000120', 1),
(126, 16, 'MCA5000121', 1),
(127, 16, 'MCA5000122', 1),
(128, 16, 'MCA5000123', 1),
(129, 16, 'MCA5000124', 1),
(130, 16, 'MCA5000125', 1),
(131, 16, 'MCA5000126', 1),
(132, 16, 'MCA5000127', 1),
(133, 16, 'MCA5000128', 1),
(134, 16, 'MCA5000129', 2),
(135, 16, 'MCA5000130', 2),
(136, 16, 'MCA5000131', 2),
(137, 16, 'MCA5000132', 2),
(138, 16, 'MCA5000133', 2),
(139, 16, 'MCA5000134', 2),
(140, 16, 'MCA5000135', 2),
(141, 17, 'MCA5000101', 1),
(142, 17, 'MCA5000102', 1),
(143, 17, 'MCA5000103', 1),
(144, 17, 'MCA5000104', 1),
(145, 17, 'MCA5000105', 1),
(146, 17, 'MCA5000106', 1),
(147, 17, 'MCA5000107', 1),
(148, 17, 'MCA5000108', 1),
(149, 17, 'MCA5000109', 1),
(150, 17, 'MCA5000110', 1),
(151, 17, 'MCA5000111', 1),
(152, 17, 'MCA5000112', 1),
(153, 17, 'MCA5000113', 1),
(154, 17, 'MCA5000114', 1),
(155, 17, 'MCA5000115', 1),
(156, 17, 'MCA5000116', 1),
(157, 17, 'MCA5000117', 1),
(158, 17, 'MCA5000118', 1),
(159, 17, 'MCA5000119', 1),
(160, 17, 'MCA5000120', 1),
(161, 17, 'MCA5000121', 1),
(162, 17, 'MCA5000122', 1),
(163, 17, 'MCA5000123', 1),
(164, 17, 'MCA5000124', 1),
(165, 17, 'MCA5000125', 1),
(166, 17, 'MCA5000126', 1),
(167, 17, 'MCA5000127', 1),
(168, 17, 'MCA5000128', 1),
(169, 17, 'MCA5000129', 2),
(170, 17, 'MCA5000130', 2),
(171, 17, 'MCA5000131', 2),
(172, 17, 'MCA5000132', 2),
(173, 17, 'MCA5000133', 2),
(174, 17, 'MCA5000134', 2),
(175, 17, 'MCA5000135', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notice_data`
--

CREATE TABLE `notice_data` (
  `nid` int(11) NOT NULL,
  `tit` varchar(250) NOT NULL,
  `pdt` date NOT NULL,
  `edt` date NOT NULL,
  `msg` text NOT NULL,
  `pby` varchar(150) NOT NULL,
  `st` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notice_data`
--

INSERT INTO `notice_data` (`nid`, `tit`, `pdt`, `edt`, `msg`, `pby`, `st`) VALUES
(2, 'Exam Fees', '2020-08-13', '2020-09-03', 'India has initiated massive economic development and safety net programmes over the past two decades. It has, for example, moved from universal food subsidies to targeted food subsidies and back again to a near-universal programme. Some programmes have been able to target beneficiaries more easily, for example conditional cash transfers for hospital delivery. And others have been ambitious in their design, scale and reach, as for example the rural safety net provided by the Mahatma Gandhi National Rural Employment Guarantee Act (MGNREGA), a nationwide rural public works programme that costs India about 1 percent of GDP and works on the principle of self-selection (workers have access to 100 days of public employment a year when they choose).', 'Admin', 1),
(3, 'Onam  Celebration', '2020-08-13', '2020-08-28', '<p>Library Management is an online web application created using PHP as front end and MySQL as back End. Using the web application user from anywhere can access the portal and search for book availability. It provides different provision to user like search, booking, reading eBook etc. Administrator is the most powerful user in the web portal. He can manage and control all the functionality of the system.&nbsp; &nbsp;&nbsp;It&rsquo;s opened a window shopping. With the help of internet, people can find books without going out, like paying bills watching movies; study online .Online library management does have many advantages.</p>\r\n', 'Admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `room_assign`
--

CREATE TABLE `room_assign` (
  `id` int(11) NOT NULL,
  `eid` int(11) NOT NULL,
  `blknme` varchar(25) NOT NULL,
  `rumid` varchar(25) NOT NULL,
  `bnch` int(11) NOT NULL,
  `bnch_num` int(11) NOT NULL,
  `rolnum` varchar(50) NOT NULL,
  `dt` date NOT NULL,
  `tim` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room_assign`
--

INSERT INTO `room_assign` (`id`, `eid`, `blknme`, `rumid`, `bnch`, `bnch_num`, `rolnum`, `dt`, `tim`) VALUES
(156, 2, 'South Block', '101', 1, 1, 'BT5000126', '2020-02-19', '10:00'),
(157, 2, 'South Block', '101', 1, 2, 'MCA5000104', '2020-02-19', '10:00'),
(158, 2, 'South Block', '101', 2, 2, 'BT5000115', '2020-02-19', '10:00'),
(159, 2, 'South Block', '101', 2, 3, 'MCA5000135', '2020-02-19', '10:00'),
(160, 2, 'South Block', '101', 3, 3, 'BT5000122', '2020-02-19', '10:00'),
(161, 2, 'South Block', '101', 3, 4, 'MCA5000121', '2020-02-19', '10:00'),
(162, 2, 'South Block', '101', 4, 4, 'BT5000121', '2020-02-19', '10:00'),
(163, 2, 'South Block', '101', 4, 5, 'MCA5000128', '2020-02-19', '10:00'),
(164, 2, 'South Block', '101', 5, 5, 'BT5000117', '2020-02-19', '10:00'),
(165, 2, 'South Block', '101', 5, 6, 'MCA5000102', '2020-02-19', '10:00'),
(166, 2, 'South Block', '101', 6, 6, 'BT5000120', '2020-02-19', '10:00'),
(167, 2, 'South Block', '101', 6, 7, 'MCA5000117', '2020-02-19', '10:00'),
(168, 2, 'North Block', '205', 1, 1, 'BT5000123', '2020-02-19', '10:00'),
(169, 2, 'North Block', '205', 1, 3, 'MCA5000129', '2020-02-19', '10:00'),
(170, 2, 'North Block', '205', 2, 2, 'BT5000111', '2020-02-19', '10:00'),
(171, 2, 'North Block', '205', 2, 4, 'MCA5000120', '2020-02-19', '10:00'),
(172, 2, 'North Block', '205', 3, 5, 'BT5000134', '2020-02-19', '10:00'),
(173, 2, 'North Block', '205', 3, 7, 'MCA5000106', '2020-02-19', '10:00'),
(174, 2, 'North Block', '205', 4, 6, 'BT5000119', '2020-02-19', '10:00'),
(175, 2, 'North Block', '205', 4, 8, 'MCA5000108', '2020-02-19', '10:00'),
(176, 2, 'North Block', '205', 5, 7, 'BT5000106', '2020-02-19', '10:00'),
(177, 2, 'North Block', '205', 5, 9, 'MCA5000113', '2020-02-19', '10:00'),
(178, 2, 'North Block', '205', 6, 8, 'BT5000108', '2020-02-19', '10:00'),
(179, 2, 'North Block', '205', 6, 10, 'MCA5000124', '2020-02-19', '10:00'),
(180, 2, 'North Block', '205', 7, 9, 'BT5000131', '2020-02-19', '10:00'),
(181, 2, 'North Block', '205', 7, 11, 'MCA5000105', '2020-02-19', '10:00'),
(182, 2, 'North Block', '205', 8, 10, 'BT5000130', '2020-02-19', '10:00'),
(183, 2, 'North Block', '205', 8, 12, 'MCA5000123', '2020-02-19', '10:00'),
(184, 2, 'North Block', '205', 9, 11, 'BT5000127', '2020-02-19', '10:00'),
(185, 2, 'North Block', '205', 9, 13, 'MCA5000130', '2020-02-19', '10:00'),
(186, 2, 'North Block', '205', 10, 12, 'BT5000101', '2020-02-19', '10:00'),
(187, 2, 'North Block', '205', 10, 14, 'MCA5000114', '2020-02-19', '10:00'),
(188, 2, 'South Block', '102', 1, 1, 'BT5000124', '2020-02-19', '10:00'),
(189, 2, 'South Block', '102', 1, 3, 'MCA5000134', '2020-02-19', '10:00'),
(190, 2, 'South Block', '102', 2, 2, 'BT5000135', '2020-02-19', '10:00'),
(191, 2, 'South Block', '102', 2, 4, 'MCA5000116', '2020-02-19', '10:00'),
(192, 2, 'South Block', '102', 3, 5, 'BT5000114', '2020-02-19', '10:00'),
(193, 2, 'South Block', '102', 3, 7, 'MCA5000115', '2020-02-19', '10:00'),
(194, 2, 'South Block', '102', 4, 6, 'BT5000109', '2020-02-19', '10:00'),
(195, 2, 'South Block', '102', 4, 8, 'MCA5000126', '2020-02-19', '10:00'),
(196, 2, 'South Block', '102', 5, 7, 'BT5000107', '2020-02-19', '10:00'),
(197, 2, 'South Block', '102', 5, 9, 'MCA5000110', '2020-02-19', '10:00'),
(198, 2, 'South Block', '102', 6, 8, 'BT5000132', '2020-02-19', '10:00'),
(199, 2, 'South Block', '102', 6, 10, 'MCA5000125', '2020-02-19', '10:00'),
(200, 2, 'South Block', '102', 7, 9, 'BT5000128', '2020-02-19', '10:00'),
(201, 2, 'South Block', '102', 7, 11, 'MCA5000107', '2020-02-19', '10:00'),
(202, 2, 'South Block', '102', 8, 10, 'BT5000125', '2020-02-19', '10:00'),
(203, 2, 'South Block', '102', 8, 12, 'MCA5000127', '2020-02-19', '10:00'),
(204, 2, 'South Block', '102', 9, 11, 'BT5000105', '2020-02-19', '10:00'),
(205, 2, 'South Block', '102', 9, 13, 'MCA5000111', '2020-02-19', '10:00'),
(206, 2, 'South Block', '102', 10, 12, 'BT5000133', '2020-02-19', '10:00'),
(207, 2, 'South Block', '102', 10, 14, 'MCA5000133', '2020-02-19', '10:00');

-- --------------------------------------------------------

--
-- Table structure for table `room_data`
--

CREATE TABLE `room_data` (
  `id` int(11) NOT NULL,
  `blk_nme` varchar(50) NOT NULL,
  `rm_nbr` varchar(50) NOT NULL,
  `bnch` int(11) NOT NULL,
  `nros` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room_data`
--

INSERT INTO `room_data` (`id`, `blk_nme`, `rm_nbr`, `bnch`, `nros`) VALUES
(1, 'South Block', '101', 6, 3),
(3, 'South Block', '102', 10, 5),
(4, 'North Block', '205', 10, 5);

-- --------------------------------------------------------

--
-- Table structure for table `sem_gpa_total`
--

CREATE TABLE `sem_gpa_total` (
  `id` int(11) NOT NULL,
  `stud_id` varchar(50) NOT NULL,
  `tgpa` varchar(50) NOT NULL,
  `tbpap` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sem_gpa_total`
--

INSERT INTO `sem_gpa_total` (`id`, `stud_id`, `tgpa`, `tbpap`) VALUES
(1, '2014423', '2.2416666666667', 1),
(3, '12112112', '4.165', 0),
(4, '100101', '0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `staff_allocation`
--

CREATE TABLE `staff_allocation` (
  `id` int(11) NOT NULL,
  `stid` varchar(50) NOT NULL,
  `eid` int(11) NOT NULL,
  `dt` date NOT NULL,
  `tim` varchar(50) NOT NULL,
  `blk` varchar(50) NOT NULL,
  `room` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff_allocation`
--

INSERT INTO `staff_allocation` (`id`, `stid`, `eid`, `dt`, `tim`, `blk`, `room`) VALUES
(1, 'j101', 2, '2020-02-18', '10:00', 'North Block', '205'),
(2, 's101', 2, '2020-02-18', '10:00', 'South Block', '101'),
(3, 's101', 2, '2020-02-18', '10:00', 'South Block', '102'),
(4, 's101', 2, '2020-02-19', '10:00', 'South Block', '102'),
(5, 's101', 2, '2020-02-19', '10:00', 'North Block', '205'),
(6, 'vp101', 2, '2020-02-19', '10:00', 'South Block', '101'),
(7, 'rm101,', 2, '2020-02-18', '10:00', 'South Block', '101'),
(8, 'aj101,', 2, '2020-02-18', '10:00', 'South Block', '102'),
(9, 'c101,', 2, '2020-02-18', '10:00', 'North Block', '205'),
(10, 'vp101,', 2, '2020-02-19', '10:00', 'South Block', '101'),
(11, 'rm101,', 2, '2020-02-19', '10:00', 'South Block', '102'),
(12, 'aj101,', 2, '2020-02-19', '10:00', 'North Block', '205');

-- --------------------------------------------------------

--
-- Table structure for table `staff_data`
--

CREATE TABLE `staff_data` (
  `stid` int(11) NOT NULL,
  `nme` varchar(150) NOT NULL,
  `uid` varchar(50) NOT NULL,
  `con` varchar(15) NOT NULL,
  `st` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staf_data`
--

CREATE TABLE `staf_data` (
  `stfid` int(11) NOT NULL,
  `nme` varchar(100) NOT NULL,
  `stfif` varchar(25) NOT NULL,
  `crs` int(11) NOT NULL,
  `dep` int(11) NOT NULL,
  `desig` varchar(50) NOT NULL COMMENT '1=hod,2=advsr,3=tchr',
  `adr` text NOT NULL,
  `con` varchar(15) NOT NULL,
  `em` varchar(150) NOT NULL,
  `qual` varchar(50) NOT NULL,
  `pic` varchar(25) NOT NULL,
  `dob` date NOT NULL,
  `st` int(11) NOT NULL,
  `ealo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staf_data`
--

INSERT INTO `staf_data` (`stfid`, `nme`, `stfif`, `crs`, `dep`, `desig`, `adr`, `con`, `em`, `qual`, `pic`, `dob`, `st`, `ealo`) VALUES
(1, 'Sunil Kumar', 's101', 10, 10, '4', 'trininty \r\ntrivanrum', '9446563002', 'sunil@gmail.com', 'BTECH', 's101.jpg', '1986-10-12', 1, 0),
(2, 'Jobin', 'j101', 6, 9, '3', 'Trinity\r\nTrivandrum', '9995653252', 'jobin@gmail.com', 'MCA', 'j101.jpg', '1990-12-10', 1, 0),
(3, 'Chanthu', 'c101', 6, 9, '3', 'Trinity\r\nTvm', '9995874521', 'chanthu@gmail.com', 'MCA', 'c101.jpg', '1998-11-11', 1, 0),
(4, 'Vishnu Patel', 'vp101', 6, 9, '3', 'trinity\r\ntvm', '9995686885', 'patel@gmail.com', 'MSC', 'vp101.jpg', '1989-08-11', 1, 1),
(5, 'Remya', 'rm101', 6, 0, '3', 'trinity\r\ntvm', '7585456321', 'remya@gmail.com', 'MCA', 'rm101.jpg', '1989-11-11', 1, 1),
(6, 'Ancy S Johnson', 'aj101', 7, 11, '3', 'trinity\r\ntvm', '9995867542', 'asj@gmail.com', 'MCA', 'aj101.jpg', '1992-05-11', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stf_alo_chk`
--

CREATE TABLE `stf_alo_chk` (
  `id` int(11) NOT NULL,
  `eid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stf_alo_chk`
--

INSERT INTO `stf_alo_chk` (`id`, `eid`) VALUES
(1, 2),
(2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `student_data`
--

CREATE TABLE `student_data` (
  `id` int(11) NOT NULL,
  `crs` int(11) NOT NULL,
  `dep` int(11) NOT NULL,
  `sem` int(11) NOT NULL,
  `ay` int(11) NOT NULL,
  `active_st` int(11) NOT NULL COMMENT '1=incolege,2=passout,3=removed',
  `nme` varchar(100) NOT NULL,
  `admnum` varchar(25) NOT NULL,
  `regnum` varchar(50) NOT NULL,
  `addr` text NOT NULL,
  `dob` date NOT NULL,
  `con` varchar(15) NOT NULL,
  `fatrnme` varchar(100) NOT NULL,
  `mob` varchar(15) NOT NULL,
  `bldgrp` varchar(5) NOT NULL,
  `pic` varchar(50) NOT NULL,
  `st` int(11) NOT NULL COMMENT '0=not updated, 1=updated, 2=approved',
  `gndr` varchar(10) NOT NULL,
  `sslcmrk` float NOT NULL,
  `plstomrk` float NOT NULL,
  `sem1` float NOT NULL,
  `sem2` float NOT NULL,
  `sem3` float NOT NULL,
  `sem4` float NOT NULL,
  `sem5` float NOT NULL,
  `sem6` float NOT NULL,
  `sem7` float NOT NULL,
  `sem8` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_data`
--

INSERT INTO `student_data` (`id`, `crs`, `dep`, `sem`, `ay`, `active_st`, `nme`, `admnum`, `regnum`, `addr`, `dob`, `con`, `fatrnme`, `mob`, `bldgrp`, `pic`, `st`, `gndr`, `sslcmrk`, `plstomrk`, `sem1`, `sem2`, `sem3`, `sem4`, `sem5`, `sem6`, `sem7`, `sem8`) VALUES
(1, 6, 9, 1, 2015, 1, 'Amal', '112002', '', 'Amal Bhavan, Trivandrum', '0000-00-00', '9447856987', 'Ananathan Thampi', '8447856987', 'O+ve', 'nopic.jpg', 1, 'M', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 6, 9, 1, 2015, 1, 'Rajeev', '112003', '', 'R R bhavan, Nagaroor', '0000-00-00', '9447856988', 'Bahuleyan', '8447856988', 'O+ve', 'nopic.jpg', 1, 'M', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 6, 9, 1, 2015, 1, 'Achu', '112004', '', 'Arunodayam, Vembayam', '0000-00-00', '9447856989', 'Chandran', '8447856989', 'O+ve', 'nopic.jpg', 1, 'M', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 6, 9, 1, 2015, 1, 'Arya', '112005', '', 'Arya Bhavan, TVM', '0000-00-00', '9447856990', 'Rajendran', '8447856990', 'AB+ve', 'nopic.jpg', 1, 'F', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 6, 9, 1, 2015, 1, 'Hari', '112006', '', 'Harisailam, TVM', '0000-00-00', '9447856991', 'Rajagopal', '8447856991', 'A-ve', 'nopic.jpg', 1, 'M', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 6, 9, 1, 2015, 1, 'Gopal', '112007', '', 'G P Bhavan, Puliood', '0000-00-00', '9447856992', 'Ambili', '8447856992', 'A+ve', 'nopic.jpg', 1, 'M', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 6, 9, 1, 2015, 1, 'Nandu', '112008', '', 'Nandagoplam, Kilimanoor', '0000-00-00', '9447856993', 'Ponappan', '8447856993', 'A+ve', 'nopic.jpg', 1, 'M', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 6, 9, 1, 2015, 1, 'Jeeva', '112009', '', 'J J Bhavan, TVM', '0000-00-00', '9447856994', 'Rajappan', '8447856994', 'O+ve', 'nopic.jpg', 1, 'M', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 6, 9, 1, 2015, 1, 'Amritha', '112010', '', 'A M Manzil, KTAM', '0000-00-00', '9447856995', 'Madhu', '8447856995', 'AB+ve', 'nopic.jpg', 1, 'F', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 6, 9, 1, 2015, 1, 'Ancu', '112011', '', 'Ancy Nilayam, TVM', '0000-00-00', '9447856996', 'Gopalan', '8447856996', 'A-ve', 'nopic.jpg', 1, 'F', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11, 6, 9, 1, 2015, 1, 'Remya', '112012', '', 'R R bhavan, Nagaroor', '0000-00-00', '9447856997', 'Rajendran', '8447856997', 'B+ve', 'nopic.jpg', 1, 'F', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 6, 9, 1, 2015, 1, 'Neethu', '112013', '', 'N N Bhavan, Kilimanoor', '0000-00-00', '9447856998', 'Subash', '8447856998', 'B+ve', 'nopic.jpg', 1, 'F', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13, 6, 9, 1, 2015, 1, 'Jeevan', '112014', '', 'J J Bhavan, TVM', '0000-00-00', '9447856999', 'Sunil', '8447856999', 'O+ve', 'nopic.jpg', 1, 'M', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(14, 6, 9, 1, 2015, 1, 'Gopalan', '112015', '', 'G G Bhavan, TVM', '0000-00-00', '9447857000', 'Sumesh', '8447857000', 'AB+ve', 'nopic.jpg', 1, 'M', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15, 6, 9, 1, 2015, 1, 'Ananthu', '112016', '', 'A A bhavan , KTM', '0000-00-00', '9447857001', 'Anesh', '8447857001', 'B+ve', 'nopic.jpg', 1, 'M', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(16, 7, 11, 1, 2015, 1, 'Raju', '5000101', '', 'R R bhavan', '0000-00-00', '8281789654', 'Rayappan', '9281789654', 'O+ve', 'nopic.jpg', 1, 'M', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(17, 7, 11, 1, 2015, 1, 'Appu', '5000102', '', 'A A Bhavan', '0000-00-00', '8281789655', 'Appappan', '9281789655', 'O+ve', 'nopic.jpg', 1, 'M', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18, 7, 11, 1, 2015, 1, 'Ammu', '5000103', '', 'AM Bhavan', '0000-00-00', '8281789656', 'Ammappan', '9281789656', 'O+ve', 'nopic.jpg', 1, 'F', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(19, 7, 11, 1, 2015, 1, 'Dipu', '5000104', '', 'D D Bhavan', '0000-00-00', '8281789657', 'Dippappan', '9281789657', 'AB+ve', 'nopic.jpg', 1, 'M', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(20, 7, 11, 1, 2015, 1, 'Minnu', '5000105', '', 'M M bhavan', '0000-00-00', '8281789658', 'Minnappan', '9281789658', 'A-ve', 'nopic.jpg', 1, 'F', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(21, 7, 11, 1, 2015, 1, 'Annu', '5000106', '', 'A A Bhavan', '0000-00-00', '8281789659', 'Annappan', '9281789659', 'A+ve', 'nopic.jpg', 1, 'F', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(22, 7, 11, 1, 2015, 1, 'Littu', '5000107', '', 'L L Bhaan', '0000-00-00', '8281789660', 'Littappan', '9281789660', 'A+ve', 'nopic.jpg', 1, 'F', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(23, 7, 11, 1, 2015, 1, 'Kuttu', '5000108', '', 'K K Bhaan', '0000-00-00', '8281789661', 'Kittappan', '9281789661', 'O+ve', 'nopic.jpg', 1, 'M', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(24, 7, 11, 1, 2015, 1, 'Hippy', '5000109', '', 'H H Bhavan', '0000-00-00', '8281789662', 'Hippappan', '9281789662', 'AB+ve', 'nopic.jpg', 1, 'M', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(25, 7, 11, 1, 2015, 1, 'Karu', '5000110', '', 'K K Bhaan', '0000-00-00', '8281789663', 'Karappan', '9281789663', 'A-ve', 'nopic.jpg', 1, 'M', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(26, 7, 11, 1, 2015, 1, 'Laru', '5000111', '', 'L L Bhaan', '0000-00-00', '8281789664', 'Larappan', '9281789664', 'B+ve', 'nopic.jpg', 1, 'M', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(27, 7, 11, 1, 2015, 1, 'itty', '5000112', '', 'I I Bhavan', '0000-00-00', '8281789665', 'Ittyappan', '9281789665', 'B+ve', 'nopic.jpg', 1, 'M', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(28, 7, 11, 1, 2015, 1, 'Mitty', '5000113', '', 'M M Bhavan', '0000-00-00', '8281789666', 'Mittiappan', '9281789666', 'O+ve', 'nopic.jpg', 1, 'F', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(29, 7, 11, 1, 2015, 1, 'Nimmy', '5000114', '', 'N N bhavan', '0000-00-00', '8281789667', 'Nimmyappan', '9281789667', 'AB+ve', 'nopic.jpg', 1, 'F', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(30, 7, 11, 1, 2015, 1, 'Roy', '5000115', '', 'R R bhavan', '0000-00-00', '8281789668', 'Royappan', '9281789668', 'B+ve', 'nopic.jpg', 1, 'M', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `stud_doubt`
--

CREATE TABLE `stud_doubt` (
  `id` int(11) NOT NULL,
  `stud` varchar(50) NOT NULL,
  `stfid` varchar(50) NOT NULL,
  `dt` date NOT NULL,
  `dbt` text NOT NULL,
  `st` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stud_doubt`
--

INSERT INTO `stud_doubt` (`id`, `stud`, `stfid`, `dt`, `dbt`, `st`) VALUES
(1, '112007', 'j101', '2020-01-01', 'Sir, What is mean by Computer. and what are the basic elements of a computer?', 0),
(2, '112007', 'j101', '2020-01-01', 'what are the data handling methods in PHP', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subjct_assign`
--

CREATE TABLE `subjct_assign` (
  `assignid` int(11) NOT NULL,
  `stf_nme` varchar(150) NOT NULL,
  `stf_id` varchar(50) NOT NULL,
  `crs` int(11) NOT NULL,
  `dep` int(11) NOT NULL,
  `sem` int(11) NOT NULL,
  `subnme` varchar(20) NOT NULL,
  `subid` varchar(125) NOT NULL,
  `st` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `syllabus_data`
--

CREATE TABLE `syllabus_data` (
  `sylid` int(11) NOT NULL,
  `crsid` int(11) NOT NULL,
  `depid` int(11) NOT NULL,
  `sem` varchar(20) NOT NULL,
  `sub_nme` varchar(200) NOT NULL,
  `sub_id` varchar(50) NOT NULL,
  `syl_file` varchar(50) NOT NULL,
  `sub_mrk` varchar(10) NOT NULL,
  `st` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `syllabus_data`
--

INSERT INTO `syllabus_data` (`sylid`, `crsid`, `depid`, `sem`, `sub_nme`, `sub_id`, `syl_file`, `sub_mrk`, `st`) VALUES
(2, 1, 1, '1', 'Computer Fundamentals', 'CS101', 'CS101.docx', '4', 1),
(3, 1, 1, '1', 'Computer Networks', 'CS102', 'CS102.docx', '3', 1),
(4, 1, 1, '1', 'Operating System', 'CS103', 'CS103.docx', '3', 1),
(5, 1, 1, '1', 'C Programming', 'CS104', 'CS104.docx', '3', 1),
(6, 1, 1, '1', 'System Analysis And Design', 'CS105', 'CS105.docx', '3', 1),
(7, 1, 1, '1', 'Introduction to Java', 'CS106', 'CS106.docx', '4', 1),
(8, 1, 1, '1', 'C Programming LAB', 'CS107', 'CS107.docx', '4', 1),
(9, 1, 2, '1', 'Computer Fundamentals', 'CS101', 'CS101.docx', '4', 1),
(10, 1, 2, '1', 'Computer Networks', 'CS102', 'CS102.png', '3', 1),
(11, 1, 2, '1', 'C Programming', 'CS103', 'CS103.png', '3', 1),
(12, 1, 2, '1', 'System Analysis And Design', 'CS104', 'CS104.png', '3', 1),
(13, 1, 2, '1', 'Operating System', 'CS105', 'CS105.png', '4', 1),
(14, 1, 2, '1', 'Computer Graphics', 'CS106', 'CS106.JPG', '4', 1),
(15, 1, 2, '2', 'Computer Graphics', 'CS201', 'CS201.jpg', '4', 1),
(16, 1, 2, '2', 'System Engineering', 'CS202', 'CS202.jpg', '4', 1),
(17, 1, 2, '2', 'SystemProgramming', 'CS203', 'CS203.jpg', '6', 1),
(18, 1, 2, '2', 'Engineering Maths', 'CS204', 'CS204.jpg', '5', 1),
(19, 1, 2, '2', 'Optical Fiber Technology', 'CS205', 'CS205.jpg', '3', 1),
(20, 1, 2, '3', 'Computer Fundamentals', 'CS301', 'CS301.jpg', '6', 1),
(21, 1, 2, '3', 'Electronic Circuits', 'CS302', 'CS302.jpg', '4', 1),
(22, 1, 2, '3', 'Electrical Engineering', 'CS303', 'CS303.jpg', '3', 1),
(23, 1, 2, '3', 'Graph Theory', 'CS304', 'CS304.jpg', '4', 1),
(24, 1, 2, '3', 'CPP Lab', 'CS305', 'CS305.jpg', '3', 1),
(25, 1, 2, '1', 'embedded system', 'cs107', 'cs107.docx', '4', 1),
(26, 1, 2, '1', 'compiler design', 'cs108', 'cs108.docx', '4', 1),
(27, 1, 1, '2', 'Operational Research', 'CS201', 'CS201.sql', '12', 1),
(28, 1, 1, '2', 'Computer Organization-2', 'CS202', 'CS202.sql', '10', 1),
(29, 1, 1, '2', 'Network System', 'CS203', 'CS203.sql', '10', 1),
(30, 7, 11, '1', 'Problem Solving and Computer Programming', 'RLMCA101', 'RLMCA101.pdf', '0', 1),
(31, 6, 8, '1', 'Computer Fundamentals', 'CS101', 'CS101.txt', '0', 1),
(32, 6, 8, '1', 'Computer Networking', 'cs102', 'cs102.txt', '0', 1),
(33, 6, 8, '1', 'C Programming', 'cs103', 'cs103.txt', '0', 1),
(34, 6, 9, '1', 'Mechanical Systems', 'mc101', 'mc101.txt', '0', 1),
(35, 6, 9, '1', 'Managing mechanical Devices', 'mc102', 'mc102.txt', '0', 1),
(36, 6, 9, '1', 'MechElectronics', 'mc103', 'mc103.txt', '0', 1),
(37, 6, 8, '1', 'ef', 'sdfs', 'sdfs.jpeg', '0', 1),
(38, 6, 8, '1', 'tst', 'sdf', 'nodata', '0', 1),
(39, 6, 8, '1', '123', '123', 'nodata', '0', 1),
(40, 7, 11, '1', 'System Analysis and Design', 'RLMCA102', 'nodata', '0', 1),
(41, 6, 9, '3', 'C Programming', 'CS201', 'nodata', '0', 1),
(42, 6, 9, '3', 'Computer Architecture', 'CS202', 'nodata', '0', 1),
(43, 6, 9, '3', 'Programming in JAVA', 'CS203', 'nodata', '0', 1),
(44, 6, 9, '2', 'Machine Learning', 'BT9001', 'nodata', '0', 1),
(45, 6, 9, '2', 'Artificial Intelligent', 'BT9002', 'nodata', '0', 1),
(46, 6, 9, '2', 'Computer Programming', 'BT9003', 'nodata', '0', 1),
(47, 6, 9, '2', 'Computer Architecture', 'BT9004', 'nodata', '0', 1);

-- --------------------------------------------------------

--
-- Table structure for table `s_material`
--

CREATE TABLE `s_material` (
  `id` int(11) NOT NULL,
  `crs` int(11) NOT NULL,
  `dep` int(11) NOT NULL,
  `sem` int(11) NOT NULL,
  `subid` varchar(50) NOT NULL,
  `titl` varchar(250) NOT NULL,
  `descr` text NOT NULL,
  `fil` varchar(150) NOT NULL,
  `up_by` varchar(50) NOT NULL,
  `st` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `s_material`
--

INSERT INTO `s_material` (`id`, `crs`, `dep`, `sem`, `subid`, `titl`, `descr`, `fil`, `up_by`, `st`) VALUES
(1, 6, 9, 1, 'mc101', 'Fundamentals of Computer', 'A computer is an electronic device, operating under the control of instructions stored\nin its own memory that can accept data (input), process the data according to specified\nrules, produce information (output), and store the information for future use..', '29-12-2019-08-37-44-Ch.01_Introduction_ to_computers.pdf', 'j101', 1),
(2, 6, 9, 1, 'mc101', 'Regular/Supplementary Examination 2012', 'Control System', '30-12-2019-05-26-12-6739Advanced-Control-Theory.pdf', 'j101', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_log`
--

CREATE TABLE `user_log` (
  `id` int(11) NOT NULL,
  `uid` varchar(50) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `typ` varchar(15) NOT NULL,
  `st` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_log`
--

INSERT INTO `user_log` (`id`, `uid`, `pwd`, `typ`, `st`) VALUES
(1, 'admin', 'admin', 'admin', 1),
(2, 's101', 'asd', 'STAF', 1),
(3, 'j101', 'asd', 'TSTAF', 1),
(4, 'c101', 'asd', 'TSTAF', 1),
(110, '112002', 'student', 'stud', 1),
(111, '112003', 'student', 'stud', 1),
(112, '112004', 'student', 'stud', 1),
(113, '112005', 'student', 'stud', 1),
(114, '112006', 'student', 'stud', 1),
(115, '112007', 'student', 'stud', 1),
(116, '112008', 'student', 'stud', 1),
(117, '112009', 'student', 'stud', 1),
(118, '112010', 'student', 'stud', 1),
(119, '112011', 'student', 'stud', 1),
(120, '112012', 'student', 'stud', 1),
(121, '112013', 'student', 'stud', 1),
(122, '112014', 'student', 'stud', 1),
(123, '112015', 'student', 'stud', 1),
(124, '112016', 'student', 'stud', 1),
(125, '5000101', 'student', 'stud', 1),
(126, '5000102', 'student', 'stud', 1),
(127, '5000103', 'student', 'stud', 1),
(128, '5000104', 'student', 'stud', 1),
(129, '5000105', 'student', 'stud', 1),
(130, '5000106', 'student', 'stud', 1),
(131, '5000107', 'student', 'stud', 1),
(132, '5000108', 'student', 'stud', 1),
(133, '5000109', 'student', 'stud', 1),
(134, '5000110', 'student', 'stud', 1),
(135, '5000111', 'student', 'stud', 1),
(136, '5000112', 'student', 'stud', 1),
(137, '5000113', 'student', 'stud', 1),
(138, '5000114', 'student', 'stud', 1),
(139, '5000115', 'student', 'stud', 1),
(140, 'vp101', 'asd', 'TSTAF', 1),
(141, 'rm101', 'asd', 'TSTAF', 1),
(142, 'aj101', 'asd', 'TSTAF', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wall_post`
--

CREATE TABLE `wall_post` (
  `id` int(11) NOT NULL,
  `stud_id` varchar(25) NOT NULL,
  `dt` date NOT NULL,
  `crs` varchar(10) NOT NULL,
  `dep` varchar(10) NOT NULL,
  `sem` varchar(10) NOT NULL,
  `msg` text NOT NULL,
  `tim` varchar(50) NOT NULL,
  `st` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wall_post`
--

INSERT INTO `wall_post` (`id`, `stud_id`, `dt`, `crs`, `dep`, `sem`, `msg`, `tim`, `st`) VALUES
(1, '1100', '2018-01-20', '1', '2', '1', 'hiii.', '1516473673', 0),
(2, '1100', '2018-01-20', '1', '2', '1', 'hallooooooooo<br />\r\ndaaaaaaaaaaaaaa', '1516473698', 1),
(3, '1100', '2018-01-20', '1', '2', '1', 'india\'s no 1 <br />\r\ndealer', '1516473714', 0),
(4, '1102', '2018-01-20', '1', '2', '1', 'heloo ', '1516476368', 1),
(5, '1100', '2018-01-28', '1', '2', '1', 'goodmorning.....', '1517141751', 1),
(6, '1102', '2018-01-31', '1', '2', '2', 'hiiii', '1517414059', 1),
(7, '2014423', '2018-02-01', '1', '2', '8', 'HAI.... IAM USING THIS SOFTWARE', '1517473417', 1),
(8, '2014423', '2018-06-16', '1', '2', '8', 'fbfghfghfgh', '1529185956', 1),
(9, '100101', '2018-12-01', '1', '1', '1', 'hiii', '1543663310', 1),
(10, '112002', '2020-05-13', '6', '9', '1', 'hiiiii', '1589389075', 0),
(11, '112002', '2020-05-13', '6', '9', '1', 'hiiiii', '1589389116', 1),
(12, '112002', '2020-08-13', '6', '9', '1', 'hlooooooooo', '1597296993', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chair_conf`
--
ALTER TABLE `chair_conf`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crs_info`
--
ALTER TABLE `crs_info`
  ADD PRIMARY KEY (`crsid`);

--
-- Indexes for table `dbt_ans`
--
ALTER TABLE `dbt_ans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dep_info`
--
ALTER TABLE `dep_info`
  ADD PRIMARY KEY (`depid`);

--
-- Indexes for table `exam_assign`
--
ALTER TABLE `exam_assign`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_cmplnt`
--
ALTER TABLE `exam_cmplnt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_data`
--
ALTER TABLE `exam_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_stud`
--
ALTER TABLE `exam_stud`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notice_data`
--
ALTER TABLE `notice_data`
  ADD PRIMARY KEY (`nid`);

--
-- Indexes for table `room_assign`
--
ALTER TABLE `room_assign`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_data`
--
ALTER TABLE `room_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sem_gpa_total`
--
ALTER TABLE `sem_gpa_total`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_allocation`
--
ALTER TABLE `staff_allocation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_data`
--
ALTER TABLE `staff_data`
  ADD PRIMARY KEY (`stid`);

--
-- Indexes for table `staf_data`
--
ALTER TABLE `staf_data`
  ADD PRIMARY KEY (`stfid`);

--
-- Indexes for table `stf_alo_chk`
--
ALTER TABLE `stf_alo_chk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_data`
--
ALTER TABLE `student_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stud_doubt`
--
ALTER TABLE `stud_doubt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjct_assign`
--
ALTER TABLE `subjct_assign`
  ADD PRIMARY KEY (`assignid`);

--
-- Indexes for table `syllabus_data`
--
ALTER TABLE `syllabus_data`
  ADD PRIMARY KEY (`sylid`);

--
-- Indexes for table `s_material`
--
ALTER TABLE `s_material`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_log`
--
ALTER TABLE `user_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wall_post`
--
ALTER TABLE `wall_post`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chair_conf`
--
ALTER TABLE `chair_conf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `crs_info`
--
ALTER TABLE `crs_info`
  MODIFY `crsid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `dbt_ans`
--
ALTER TABLE `dbt_ans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dep_info`
--
ALTER TABLE `dep_info`
  MODIFY `depid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `exam_assign`
--
ALTER TABLE `exam_assign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `exam_cmplnt`
--
ALTER TABLE `exam_cmplnt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `exam_data`
--
ALTER TABLE `exam_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `exam_stud`
--
ALTER TABLE `exam_stud`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;
--
-- AUTO_INCREMENT for table `notice_data`
--
ALTER TABLE `notice_data`
  MODIFY `nid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `room_assign`
--
ALTER TABLE `room_assign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=208;
--
-- AUTO_INCREMENT for table `room_data`
--
ALTER TABLE `room_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sem_gpa_total`
--
ALTER TABLE `sem_gpa_total`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `staff_allocation`
--
ALTER TABLE `staff_allocation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `staff_data`
--
ALTER TABLE `staff_data`
  MODIFY `stid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `staf_data`
--
ALTER TABLE `staf_data`
  MODIFY `stfid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `stf_alo_chk`
--
ALTER TABLE `stf_alo_chk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `student_data`
--
ALTER TABLE `student_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `stud_doubt`
--
ALTER TABLE `stud_doubt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `subjct_assign`
--
ALTER TABLE `subjct_assign`
  MODIFY `assignid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `syllabus_data`
--
ALTER TABLE `syllabus_data`
  MODIFY `sylid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `s_material`
--
ALTER TABLE `s_material`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user_log`
--
ALTER TABLE `user_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;
--
-- AUTO_INCREMENT for table `wall_post`
--
ALTER TABLE `wall_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
