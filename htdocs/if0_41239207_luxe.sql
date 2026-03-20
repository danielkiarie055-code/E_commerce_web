-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql104.infinityfree.com
-- Generation Time: Mar 20, 2026 at 07:38 AM
-- Server version: 11.4.10-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `if0_41239207_luxe`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` text NOT NULL,
  `total_amount` int(11) NOT NULL,
  `cart_items` text NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(20) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_name`, `phone`, `address`, `total_amount`, `cart_items`, `order_date`, `status`) VALUES
(21, 'Daniel Kiarie', '254793975334', 'Thika', 20, '[{\"id\":4,\"name\":\"heels\",\"price\":20,\"image\":\"uploads\\/1772053611_shopping.webp\",\"qty\":1}]', '2026-02-25 22:27:13', 'Completed'),
(23, 'Diana', '254792124957', 'Kimbo', 3178, '[{\"id\":1,\"name\":\"Newborn Starter Pack\",\"price\":678,\"image\":\"https:\\/\\/images.unsplash.com\\/photo-1519689680058-324335c77eba?w=400&q=80\",\"qty\":1},{\"id\":2,\"name\":\"Mini Top Handle Sling Bag\",\"price\":2500,\"image\":\"https:\\/\\/images.unsplash.com\\/photo-1584916201218-f4242ceb4809?w=400&q=80\",\"qty\":1}]', '2026-02-26 09:17:47', 'Completed'),
(24, 'Evan', '254112996670', 'Kimbo', 678, '[{\"id\":1,\"name\":\"Newborn Starter Pack\",\"price\":678,\"image\":\"https:\\/\\/images.unsplash.com\\/photo-1519689680058-324335c77eba?w=400&q=80\",\"qty\":1}]', '2026-02-26 09:21:31', 'Completed'),
(25, 'Diana', '254728872977', 'Kca', 360, '[{\"id\":5,\"name\":\"Heels\",\"price\":340,\"image\":\"uploads\\/1772053679_download.webp\",\"qty\":1},{\"id\":4,\"name\":\"heels\",\"price\":20,\"image\":\"uploads\\/1772053611_shopping.webp\",\"qty\":1}]', '2026-02-26 09:28:59', 'Completed'),
(26, 'Dennis ', '254759728667', 'Kca', 1780, '[{\"id\":5,\"name\":\"Heels\",\"price\":340,\"image\":\"uploads\\/1772053679_download.webp\",\"qty\":5},{\"id\":4,\"name\":\"heels\",\"price\":20,\"image\":\"uploads\\/1772053611_shopping.webp\",\"qty\":4}]', '2026-02-26 09:35:48', 'Completed'),
(27, 'Caleb', '254701930430', 'Juja', 5290, '[{\"id\":3,\"name\":\"Luxe Official Blazer\",\"price\":4500,\"image\":\"https:\\/\\/images.unsplash.com\\/photo-1595777457583-95e059d581b8?w=400&q=80\",\"qty\":1},{\"id\":6,\"name\":\"crocks\",\"price\":450,\"image\":\"uploads\\/1772099169_images.jpg\",\"qty\":1},{\"id\":5,\"name\":\"Heels\",\"price\":340,\"image\":\"uploads\\/1772053679_download.webp\",\"qty\":1}]', '2026-02-26 14:36:56', 'Completed'),
(28, 'Alvin', '254706664800', 'Thika', 678, '[{\"id\":1,\"name\":\"Newborn Starter Pack\",\"price\":678,\"image\":\"https:\\/\\/images.unsplash.com\\/photo-1519689680058-324335c77eba?w=400&q=80\",\"qty\":1}]', '2026-02-26 14:39:37', 'Completed'),
(29, 'Daniel Kiarie', '254117306493', 'Juja', 17200, '[{\"id\":7,\"name\":\"Special occasion heels\",\"price\":2200,\"image\":\"uploads\\/1772181831_shopping.webp\",\"qty\":1},{\"id\":8,\"name\":\"Bridal accessories\",\"price\":15000,\"image\":\"uploads\\/1772189025_wedding gowns400X.webp\",\"qty\":1}]', '2026-02-27 21:06:35', 'Completed'),
(30, 'Daniel Kiarie', '254793975334', 'Githurai 44', 17000, '[{\"id\":15,\"name\":\"3 Piece Suit\",\"price\":15000,\"image\":\"uploads\\/1772189881_3-pieces men suit_FMwebp_QL65_.webp\",\"qty\":1},{\"id\":18,\"name\":\"Velvet loafers\",\"price\":2000,\"image\":\"uploads\\/1772190136_velvet_FMwebp_QL65_.webp\",\"qty\":1}]', '2026-03-04 16:17:00', 'Pending'),
(31, 'Daniel Kiarie', '254793975334', 'Githurai 44', 17000, '[{\"id\":15,\"name\":\"3 Piece Suit\",\"price\":15000,\"image\":\"uploads\\/1772189881_3-pieces men suit_FMwebp_QL65_.webp\",\"qty\":1},{\"id\":18,\"name\":\"Velvet loafers\",\"price\":2000,\"image\":\"uploads\\/1772190136_velvet_FMwebp_QL65_.webp\",\"qty\":1}]', '2026-03-04 16:18:07', 'Pending'),
(32, 'victor', '254705237806', 'vikakamau04@gmail.com', 2000, '[{\"id\":20,\"name\":\"Tote Bags\",\"price\":2000,\"image\":\"uploads\\/1772190385_tote bagsFMwebp_QL65_.webp\",\"qty\":1}]', '2026-03-13 11:24:09', 'Pending'),
(33, 'wawery', '254759728667', 'sou', 2000, '[{\"id\":20,\"name\":\"Tote Bags\",\"price\":2000,\"image\":\"uploads\\/1772190385_tote bagsFMwebp_QL65_.webp\",\"qty\":1}]', '2026-03-13 11:27:52', 'Pending'),
(34, 'Danie  kiarie', '254793975334', 'juja', 2200, '[{\"id\":7,\"name\":\"Special occasion heels\",\"price\":2200,\"image\":\"uploads\\/1772181831_shopping.webp\",\"qty\":1}]', '2026-03-13 11:30:24', 'Pending'),
(35, 'Rebecca Wangui', '254741406497', 'Kenya', 9000, '[{\"id\":20,\"name\":\"Tote Bags\",\"price\":2000,\"image\":\"uploads\\/1772190385_tote bagsFMwebp_QL65_.webp\",\"qty\":1},{\"id\":19,\"name\":\"Business Shoes\",\"price\":7000,\"image\":\"uploads\\/1772190214_Business shpesFMwebp_QL65_.webp\",\"qty\":1}]', '2026-03-13 12:05:05', 'Pending'),
(36, 'Tuby', '254799887537', 'Nairobi ', 2200, '[{\"id\":7,\"name\":\"Special occasion heels\",\"price\":2200,\"image\":\"uploads\\/1772181831_shopping.webp\",\"qty\":1}]', '2026-03-13 12:11:36', 'Pending'),
(37, 'Rebecca', '254741406497', 'kca', 5, '[{\"id\":25,\"name\":\"Shoe\",\"price\":5,\"image\":\"uploads\\/1773403786_cosmistic-shoes-6701631_1920.jpg\",\"qty\":1}]', '2026-03-13 12:12:44', 'Pending'),
(38, 'tyron', '254725225204', 'nairobi', 14000, '[{\"id\":19,\"name\":\"Business Shoes\",\"price\":7000,\"image\":\"uploads\\/1772190214_Business shpesFMwebp_QL65_.webp\",\"qty\":2}]', '2026-03-13 12:28:01', 'Completed'),
(39, 'Daniel Kiarie', '254793975334', 'Kimbo', 5, '[{\"id\":25,\"name\":\"Shoe\",\"price\":5,\"image\":\"uploads\\/1773403786_cosmistic-shoes-6701631_1920.jpg\",\"qty\":1}]', '2026-03-14 22:30:20', 'Completed'),
(40, 'Daniel Kiarie', '254793975334', 'Kimbo', 87675, '[{\"id\":19,\"name\":\"Business Shoes\",\"price\":7000,\"image\":\"uploads\\/1772190214_Business shpesFMwebp_QL65_.webp\",\"qty\":1},{\"id\":25,\"name\":\"Shoe\",\"price\":5,\"image\":\"uploads\\/1773403786_cosmistic-shoes-6701631_1920.jpg\",\"qty\":1},{\"id\":17,\"name\":\"Slim Fit Suit\",\"price\":11000,\"image\":\"uploads\\/1772190035_slim fitFMwebp_QL65_.webp\",\"qty\":1},{\"id\":16,\"name\":\"2-piece Suit\",\"price\":8970,\"image\":\"uploads\\/1772189959_2-piece suit_FMwebp_QL65_.webp\",\"qty\":1},{\"id\":15,\"name\":\"3 Piece Suit\",\"price\":15000,\"image\":\"uploads\\/1772189881_3-pieces men suit_FMwebp_QL65_.webp\",\"qty\":1},{\"id\":14,\"name\":\"Flannel\",\"price\":2500,\"image\":\"uploads\\/1772189756_mens_FMwebp_QL65_.webp\",\"qty\":1},{\"id\":13,\"name\":\"Wedding Heels\",\"price\":5000,\"image\":\"uploads\\/1772189584_wedding heels_400X.webp\",\"qty\":1},{\"id\":12,\"name\":\"Birthday Dresses\",\"price\":6000,\"image\":\"uploads\\/1772189378_birthday dresses_400X.webp\",\"qty\":1},{\"id\":11,\"name\":\"Prom Dresses\",\"price\":10000,\"image\":\"uploads\\/1772189272_promdresses_400X.webp\",\"qty\":1},{\"id\":10,\"name\":\"Rings\",\"price\":3000,\"image\":\"uploads\\/1772189214_rings_400X.webp\",\"qty\":1},{\"id\":9,\"name\":\"Girls Out Dresses\",\"price\":2000,\"image\":\"uploads\\/1772189139_girls out_400X.webp\",\"qty\":1},{\"id\":8,\"name\":\"Bridal accessories\",\"price\":15000,\"image\":\"uploads\\/1772189025_wedding gowns400X.webp\",\"qty\":1},{\"id\":7,\"name\":\"Special occasion heels\",\"price\":2200,\"image\":\"uploads\\/1772181831_shopping.webp\",\"qty\":1}]', '2026-03-14 22:32:40', 'Pending'),
(41, 'dav', '254758111707', 'juja', 44470, '[{\"id\":19,\"name\":\"Business Shoes\",\"price\":7000,\"image\":\"uploads\\/1772190214_Business shpesFMwebp_QL65_.webp\",\"qty\":1},{\"id\":17,\"name\":\"Slim Fit Suit\",\"price\":11000,\"image\":\"uploads\\/1772190035_slim fitFMwebp_QL65_.webp\",\"qty\":1},{\"id\":16,\"name\":\"2-piece Suit\",\"price\":8970,\"image\":\"uploads\\/1772189959_2-piece suit_FMwebp_QL65_.webp\",\"qty\":1},{\"id\":15,\"name\":\"3 Piece Suit\",\"price\":15000,\"image\":\"uploads\\/1772189881_3-pieces men suit_FMwebp_QL65_.webp\",\"qty\":1},{\"id\":14,\"name\":\"Flannel\",\"price\":2500,\"image\":\"uploads\\/1772189756_mens_FMwebp_QL65_.webp\",\"qty\":1}]', '2026-03-18 09:59:39', 'Completed'),
(42, 'dav', '254758111707', 'juja', 7000, '[{\"id\":19,\"name\":\"Business Shoes\",\"price\":7000,\"image\":\"uploads\\/1772190214_Business shpesFMwebp_QL65_.webp\",\"qty\":1}]', '2026-03-18 10:01:22', 'Pending'),
(43, 'Daniel Kiarie', '254793975334', 'Kimbo', 18000, '[{\"id\":19,\"name\":\"Business Shoes\",\"price\":7000,\"image\":\"uploads\\/1772190214_Business shpesFMwebp_QL65_.webp\",\"qty\":1},{\"id\":17,\"name\":\"Slim Fit Suit\",\"price\":11000,\"image\":\"uploads\\/1772190035_slim fitFMwebp_QL65_.webp\",\"qty\":1}]', '2026-03-20 10:24:48', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `department` varchar(50) DEFAULT NULL,
  `category` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `rating` decimal(2,1) NOT NULL DEFAULT 5.0,
  `rating_count` int(11) NOT NULL DEFAULT 1,
  `stock` int(11) NOT NULL DEFAULT 10,
  `image` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `department`, `category`, `price`, `rating`, `rating_count`, `stock`, `image`) VALUES
(7, 'Special occasion heels', NULL, 'shoes', 2200, '5.0', 1, 556, '1772181831_shopping.webp'),
(8, 'Bridal accessories', NULL, 'women', 15000, '5.0', 1, 3, '1772189025_wedding gowns400X.webp'),
(9, 'Girls Out Dresses', NULL, 'women', 2000, '4.5', 2, 10, '1772189139_girls out_400X.webp'),
(10, 'Rings', NULL, 'women', 3000, '5.0', 2, 6, '1772189214_rings_400X.webp'),
(11, 'Prom Dresses', NULL, 'women', 10000, '5.0', 1, 5, '1772189272_promdresses_400X.webp'),
(12, 'Birthday Dresses', NULL, 'women', 6000, '5.0', 1, 5, '1772189378_birthday dresses_400X.webp'),
(13, 'Wedding Heels', NULL, 'women', 5000, '5.0', 2, 14, '1772189584_wedding heels_400X.webp'),
(14, 'Flannel', NULL, 'men', 2500, '5.0', 1, 8, '1772189756_mens_FMwebp_QL65_.webp'),
(15, '3 Piece Suit', NULL, 'men', 15000, '5.0', 1, 2, '1772189881_3-pieces men suit_FMwebp_QL65_.webp'),
(16, '2-piece Suit', NULL, 'men', 8970, '3.3', 3, 2, '1772189959_2-piece suit_FMwebp_QL65_.webp'),
(17, 'Slim Fit Suit', NULL, 'men', 11000, '5.0', 1, 1, '1772190035_slim fitFMwebp_QL65_.webp'),
(19, 'Business Shoes', NULL, 'men', 7000, '5.0', 1, 5, '1772190214_Business shpesFMwebp_QL65_.webp'),
(25, 'Shoe', NULL, 'women', 5, '5.0', 1, 5, '1773403786_cosmistic-shoes-6701631_1920.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
