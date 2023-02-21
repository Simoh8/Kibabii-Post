-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 27, 2021 at 10:57 PM
-- Server version: 5.5.25a
-- PHP Version: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `police`
--

-- --------------------------------------------------------

--
-- Table structure for table `accused`
--

CREATE TABLE IF NOT EXISTS `accused` (
  `AccSerialNo` int(10) NOT NULL,
  `AccName` varchar(55) NOT NULL,
  `AccIDno` int(12) DEFAULT NULL,
  `DATEofBIRTH` varchar(14) DEFAULT NULL,
  `AccGender` varchar(8) NOT NULL,
  `CFN` int(10) DEFAULT NULL,
  PRIMARY KEY (`AccSerialNo`),
  KEY `accusedcfn` (`CFN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `casse`
--

CREATE TABLE IF NOT EXISTS `casse` (
  `CFN` int(10) NOT NULL,
  `ChargeAndSectionOfLaw` varchar(6) NOT NULL,
  `Result` varchar(100) DEFAULT NULL,
  `ComplainantSerialNo` int(10) DEFAULT NULL,
  `AccSerialNo` int(10) DEFAULT NULL,
  PRIMARY KEY (`CFN`),
  KEY `caseAcussed` (`AccSerialNo`),
  KEY `caseComplainant` (`ComplainantSerialNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `complainant`
--

CREATE TABLE IF NOT EXISTS `complainant` (
  `ComplainantSerialNo` int(10) NOT NULL,
  `ComplainantName` varchar(55) NOT NULL,
  `DateOfBIRTH` varchar(14) DEFAULT NULL,
  `ComplainantGender` varchar(8) NOT NULL,
  `OBno` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ComplainantSerialNo`),
  KEY `compob` (`OBno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `DeptCode` varchar(8) NOT NULL,
  `DeptID` varchar(2) NOT NULL,
  `DeptName` varchar(25) DEFAULT NULL,
  `ForceNo` int(10) DEFAULT NULL,
  PRIMARY KEY (`DeptCode`),
  KEY `officerdepartment` (`ForceNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE IF NOT EXISTS `equipment` (
  `EquipSerialNo` int(10) NOT NULL,
  `EquipID` varchar(4) NOT NULL,
  `BodyNO` varchar(5) NOT NULL,
  `Status` varchar(10) DEFAULT NULL,
  `DateOfIssue` varchar(14) DEFAULT NULL,
  `DateOfReturn` varchar(14) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `ForceNo` int(10) DEFAULT NULL,
  PRIMARY KEY (`EquipID`),
  KEY `equipmentpolice` (`ForceNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ob`
--

CREATE TABLE IF NOT EXISTS `ob` (
  `OBno` varchar(20) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `ForceNo` int(10) NOT NULL,
  `ComplainantSerialNo` int(10) NOT NULL,
  PRIMARY KEY (`OBno`),
  KEY `compainantob` (`ComplainantSerialNo`),
  KEY `forceob` (`ForceNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `officer`
--

CREATE TABLE IF NOT EXISTS `officer` (
  `ForceNo` int(10) NOT NULL,
  `OfficerIDNo` int(12) NOT NULL,
  `OfficerName` varchar(55) NOT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Gender` varchar(8) NOT NULL,
  `Rank` varchar(30) NOT NULL,
  `CFN` int(10) DEFAULT NULL,
  PRIMARY KEY (`ForceNo`),
  KEY `caseofficer` (`CFN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accused`
--
ALTER TABLE `accused`
  ADD CONSTRAINT `accusedcfn` FOREIGN KEY (`CFN`) REFERENCES `casse` (`CFN`) ON UPDATE CASCADE;

--
-- Constraints for table `casse`
--
ALTER TABLE `casse`
  ADD CONSTRAINT `caseAcussed` FOREIGN KEY (`AccSerialNo`) REFERENCES `accused` (`AccSerialNo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `caseComplainant` FOREIGN KEY (`ComplainantSerialNo`) REFERENCES `complainant` (`ComplainantSerialNo`) ON UPDATE CASCADE;

--
-- Constraints for table `complainant`
--
ALTER TABLE `complainant`
  ADD CONSTRAINT `compob` FOREIGN KEY (`OBno`) REFERENCES `ob` (`OBno`) ON UPDATE CASCADE;

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `officerdepartment` FOREIGN KEY (`ForceNo`) REFERENCES `officer` (`ForceNo`) ON UPDATE CASCADE;

--
-- Constraints for table `equipment`
--
ALTER TABLE `equipment`
  ADD CONSTRAINT `equipmentpolice` FOREIGN KEY (`ForceNo`) REFERENCES `officer` (`ForceNo`) ON UPDATE CASCADE;

--
-- Constraints for table `ob`
--
ALTER TABLE `ob`
  ADD CONSTRAINT `compainantob` FOREIGN KEY (`ComplainantSerialNo`) REFERENCES `complainant` (`ComplainantSerialNo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `forceob` FOREIGN KEY (`ForceNo`) REFERENCES `officer` (`ForceNo`) ON UPDATE CASCADE;

--
-- Constraints for table `officer`
--
ALTER TABLE `officer`
  ADD CONSTRAINT `caseofficer` FOREIGN KEY (`CFN`) REFERENCES `casse` (`CFN`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
