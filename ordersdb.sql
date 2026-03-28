-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 25, 2025 at 10:09 AM
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
-- Database: `ordersdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `catname` varchar(20) NOT NULL,
  `descr` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`catname`, `descr`) VALUES
('Appliances', 'Appliances'),
('Detergents', 'Detergents'),
('Eletronics', 'Eletronics'),
('Vegetables', 'Vegetables'),
('Wheat', 'Wheat');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `custno` int(11) NOT NULL,
  `custname` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `mobileno` varchar(20) DEFAULT NULL,
  `country` text NOT NULL,
  `gender` varchar(6) NOT NULL DEFAULT 'N/A',
  `dateofbirth` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`custno`, `custname`, `email`, `mobileno`, `country`, `gender`, `dateofbirth`) VALUES
(1, 'mwikali', 'mwikali@gmail.com', NULL, 'Kenya', 'Male', '2002-09-09'),
(2, 'ker', 'ker@gmail.com', NULL, 'Zambia', 'Male', '2002-02-19'),
(4, 'Sam', 'sam@gmail.com', NULL, 'Cape', 'Male', '1999-09-23');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `ordersid` int(11) NOT NULL,
  `orderdate` date NOT NULL,
  `quantity` int(11) NOT NULL,
  `custno` int(11) NOT NULL,
  `prodcode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`ordersid`, `orderdate`, `quantity`, `custno`, `prodcode`) VALUES
(6, '2020-05-01', 1, 1, 3),
(7, '2025-03-25', 4, 1, 3),
(8, '2025-07-21', 3, 2, 1),
(9, '2022-02-25', 2, 2, 1),
(10, '2024-02-14', 2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `prodcode` int(11) NOT NULL,
  `prodname` varchar(80) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `quantity` bigint(20) NOT NULL,
  `catname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`prodcode`, `prodname`, `price`, `quantity`, `catname`) VALUES
(1, 'Smart TV', 120000, 0, 'Eletronics'),
(2, 'Sunlight', 299, 0, 'Detergents'),
(3, 'Microwave', 25000, 0, 'Appliances');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`catname`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`custno`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `mobileno` (`mobileno`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ordersid`),
  ADD KEY `custno` (`custno`),
  ADD KEY `prodcode` (`prodcode`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`prodcode`),
  ADD UNIQUE KEY `prodname` (`prodname`),
  ADD KEY `catname` (`catname`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `ordersid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`custno`) REFERENCES `customer` (`custno`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`prodcode`) REFERENCES `products` (`prodcode`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`catname`) REFERENCES `category` (`catname`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
