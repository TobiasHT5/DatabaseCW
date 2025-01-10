-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 09, 2025 at 11:30 AM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `patient_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `laboratory_test`
--

DROP TABLE IF EXISTS `laboratory_test`;
CREATE TABLE IF NOT EXISTS `laboratory_test` (
  `Test_ID` int NOT NULL,
  `Visit_ID` int DEFAULT NULL,
  `Test_Type` varchar(100) DEFAULT NULL,
  `Test_Result` text,
  PRIMARY KEY (`Test_ID`),
  KEY `Visit_ID` (`Visit_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient_data`
--

DROP TABLE IF EXISTS `patient_data`;
CREATE TABLE IF NOT EXISTS `patient_data` (
  `Patient_ID` int NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Date_of_Birth` date DEFAULT NULL,
  `Contact_Info` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`Patient_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resource`
--

DROP TABLE IF EXISTS `resource`;
CREATE TABLE IF NOT EXISTS `resource` (
  `Resource_ID` int NOT NULL,
  `Resource_Type` varchar(100) DEFAULT NULL,
  `Availability` int DEFAULT NULL,
  PRIMARY KEY (`Resource_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supply_chain`
--

DROP TABLE IF EXISTS `supply_chain`;
CREATE TABLE IF NOT EXISTS `supply_chain` (
  `Supply_ID` int NOT NULL,
  `Item_Name` varchar(100) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Supplier` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Supply_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `treatment_record`
--

DROP TABLE IF EXISTS `treatment_record`;
CREATE TABLE IF NOT EXISTS `treatment_record` (
  `Treatment_ID` int NOT NULL,
  `Visit_ID` int DEFAULT NULL,
  `Medication` varchar(100) DEFAULT NULL,
  `Dosage` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Treatment_ID`),
  KEY `Visit_ID` (`Visit_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE IF NOT EXISTS `user_role` (
  `Role_ID` int NOT NULL,
  `Role_Name` varchar(100) DEFAULT NULL,
  `Access_Level` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Role_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visit_record`
--

DROP TABLE IF EXISTS `visit_record`;
CREATE TABLE IF NOT EXISTS `visit_record` (
  `Visit_ID` int NOT NULL,
  `Patient_ID` int DEFAULT NULL,
  `Visit_Date` date DEFAULT NULL,
  `Symptoms` text,
  `Diagnosis` text,
  PRIMARY KEY (`Visit_ID`),
  KEY `Patient_ID` (`Patient_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
