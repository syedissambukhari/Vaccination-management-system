-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 02, 2024 at 01:30 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_vaccination`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(100) NOT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `gender` varchar(8) NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `pass` varchar(500) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `lastname`, `gender`, `city`, `birth`, `email`, `pass`) VALUES
('azmar', 'Azmar Khan', 'Male', 'Surat', '2001-12-01', 'admin@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `child`
--

CREATE TABLE `child` (
  `c_name` varchar(15) NOT NULL,
  `c_gender` varchar(8) DEFAULT NULL,
  `c_city` varchar(30) DEFAULT NULL,
  `c_birth` date DEFAULT NULL,
  `c_age` int(3) DEFAULT NULL,
  `c_weight` int(5) DEFAULT NULL,
  `c_height` int(5) DEFAULT NULL,
  `c_vaccine` varchar(100) DEFAULT NULL,
  `p_username` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `child`
--

INSERT INTO `child` (`c_name`, `c_gender`, `c_city`, `c_birth`, `c_age`, `c_weight`, `c_height`, `c_vaccine`, `p_username`) VALUES
('kashan', 'Male', 'Peshawar', '2022-05-25', 2, 9, 3, 'BCG', 'azmaruser'),
('bilal zada', 'Female', 'Mardan', '2021-03-23', 3, 7, 3, 'BCG,Hepatitis B Birth dose', 'azmaruser');

-- --------------------------------------------------------

--
-- Table structure for table `parent`
--

CREATE TABLE `parent` (
  `p_username` varchar(15) NOT NULL,
  `p_lastname` varchar(15) DEFAULT NULL,
  `p_gender` varchar(8) NOT NULL,
  `p_city` varchar(30) DEFAULT NULL,
  `p_birth` date DEFAULT NULL,
  `p_email` varchar(30) DEFAULT NULL,
  `p_pass` varchar(25) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `parent`
--

INSERT INTO `parent` (`p_username`, `p_lastname`, `p_gender`, `p_city`, `p_birth`, `p_email`, `p_pass`) VALUES
('azmaruser', 'azmarkk', 'Male', 'Surat', '2001-12-22', 'khan@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `vaccine`
--

CREATE TABLE `vaccine` (
  `name` varchar(50) NOT NULL,
  `timing` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `vaccine`
--

INSERT INTO `vaccine` (`name`, `timing`) VALUES
('BCG', '+6 month'),
('Hepatitis B Birth dose', '+1 day');

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_dates`
--

CREATE TABLE `vaccine_dates` (
  `name` varchar(50) NOT NULL,
  `v_date` date DEFAULT NULL,
  `timing` varchar(20) NOT NULL,
  `c_name` varchar(15) DEFAULT NULL,
  `p_username` varchar(15) DEFAULT NULL,
  `status` varchar(6) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `vaccine_dates`
--

INSERT INTO `vaccine_dates` (`name`, `v_date`, `timing`, `c_name`, `p_username`, `status`) VALUES
('BCG', '2024-03-11', '2024-09-11', 'kashan', 'azmaruser', 'true'),
('BCG', '2024-03-11', '2024-09-11', 'bilal zada', 'azmaruser', 'false'),
('Hepatitis B Birth dose', '2024-03-11', '2024-03-12', 'bilal zada', 'azmaruser', 'false');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `child`
--
ALTER TABLE `child`
  ADD KEY `p_username` (`p_username`);

--
-- Indexes for table `vaccine_dates`
--
ALTER TABLE `vaccine_dates`
  ADD KEY `p_username` (`p_username`),
  ADD KEY `c_name` (`c_name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
