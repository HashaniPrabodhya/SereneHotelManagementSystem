-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 11, 2020 at 03:36 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `banquet`
--

CREATE TABLE `banquet` (
  `id` int(11) NOT NULL,
  `guest` varchar(110) NOT NULL,
  `mobile` int(11) NOT NULL,
  `additional` varchar(666) NOT NULL,
  `decoration` varchar(100) NOT NULL,
  `Date` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `banquet`
--

INSERT INTO `banquet` (`id`, `guest`, `mobile`, `additional`, `decoration`, `Date`) VALUES
(1, 'Raja', 778954562, 'Music Band', 'Grand', '22/08/2021'),
(3, 'Tempor harum aliquam', 9, 'Inventore qui ullamc', 'Nesciunt mollitia l', '1998-03-02'),
(4, 'Pranavan', 779563652, 'high', 'music', '22/10/2020');

-- --------------------------------------------------------

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banquet`
--
ALTER TABLE `banquet`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banquet`
--
ALTER TABLE `banquet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
