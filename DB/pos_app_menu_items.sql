-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 18, 2022 at 09:31 PM
-- Server version: 5.7.37-log
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tacloyal_posdemo`
--

-- --------------------------------------------------------

--
-- Table structure for table `pos_app_menu_items`
--

CREATE TABLE `pos_app_menu_items` (
  `id` bigint(20) NOT NULL,
  `name` varchar(120) NOT NULL,
  `describtion` varchar(120) NOT NULL,
  `price` decimal(4,2) NOT NULL,
  `pImage` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pos_app_menu_items`
--

INSERT INTO `pos_app_menu_items` (`id`, `name`, `describtion`, `price`, `pImage`) VALUES
(1, 'INDI CHICKEN TIKKA', '** Due to supply issues, spring onions may not be available at your local store.** Seasoned chicken, diced paneer cheese', 15.99, 'https://res.cloudinary.com/dmledf14h/image/upload/v1644871368/depositphotos_50523105-stock-photo-pizza-with-tomatoes_d6b5ka.jpg'),
(2, 'BBQ MEATLOVERS', 'Crispy rasher bacon, pepperoni pieces, seasoned ground beef, smoky leg ham & Italian sausage, all on a BBQ sauce base', 25.50, 'https://res.cloudinary.com/dmledf14h/image/upload/v1645127680/AU_P019_en_hero_4055_yim9ij.jpg'),
(3, 'SIMPLY CHEESE', 'Simply topped with lots of melted mozzarella goodness', 15.99, 'https://res.cloudinary.com/dmledf14h/image/upload/v1645127717/AU_P015_en_hero_4055_ftq6vh.jpg'),
(4, 'EXTRA LARGE PEPPERONI', 'A Domino\'s classic. Slices of crispy pepperoni & creamy mozzarella', 30.15, 'https://res.cloudinary.com/dmledf14h/image/upload/v1645127808/AU_P0162XL_en_hero_8332_egjmbg.jpg'),
(5, 'MINI 3 MEATS', 'Domino\'s pepperoni, Italian sausage & seasoned ground beef, made on Deep Pan crust', 10.99, 'https://res.cloudinary.com/dmledf14h/image/upload/v1645127846/AU_P453DA_en_hero_9228_qihxyu.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pos_app_menu_items`
--
ALTER TABLE `pos_app_menu_items`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pos_app_menu_items`
--
ALTER TABLE `pos_app_menu_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
