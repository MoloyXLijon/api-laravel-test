-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 22, 2024 at 05:03 PM
-- Server version: 8.0.31
-- PHP Version: 8.1.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `new-test-laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', '2024-01-04 17:57:25', '$2y$10$Mbf5NH4PgEnHojotDUegf.0zhQo0CnUEQylGmmoZ6fkcS6pk.NABS', NULL, '2024-01-04 17:57:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE IF NOT EXISTS `cart_items` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_items_user_id_foreign` (`user_id`),
  KEY `cart_items_product_id_foreign` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `user_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 3, '2024-01-16 12:24:56', '2024-01-16 12:31:19');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Test', 'test', '2024-01-01 17:17:50', '2024-01-01 17:17:50'),
(2, 'HTML', 'html', '2024-01-01 12:11:13', '2024-01-01 12:11:13'),
(3, 'CSS', 'css', '2024-01-01 12:11:13', '2024-01-01 12:11:13'),
(4, 'JS', 'js', '2024-01-01 12:11:13', '2024-01-01 12:11:13'),
(5, 'Id enim.', 'id-enim', '2024-01-01 12:25:22', '2024-01-01 12:25:22'),
(6, 'Molestiae.', 'molestiae', '2024-01-01 12:25:22', '2024-01-01 12:25:22'),
(7, 'Ex harum.', 'ex-harum', '2024-01-01 12:25:22', '2024-01-01 12:25:22'),
(8, 'Omnis vel.', 'omnis-vel', '2024-01-01 12:25:22', '2024-01-01 12:25:22'),
(9, 'Aperiam.', 'aperiam', '2024-01-01 12:25:22', '2024-01-01 12:25:22'),
(10, 'Omnis nam.', 'omnis-nam', '2024-01-04 11:59:31', '2024-01-04 11:59:31'),
(11, 'In minus.', 'in-minus', '2024-01-04 11:59:31', '2024-01-04 11:59:31'),
(12, 'Placeat.', 'placeat', '2024-01-04 11:59:31', '2024-01-04 11:59:31'),
(13, 'Placeat a.', 'placeat-a', '2024-01-04 11:59:31', '2024-01-04 11:59:31'),
(14, 'Quam.', 'quam', '2024-01-04 11:59:31', '2024-01-04 11:59:31');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_12_30_170954_create_categories_table', 2),
(6, '2023_12_30_172551_create_posts_table', 3),
(9, '2024_01_04_161042_create_products_table', 5),
(8, '2024_01_04_173510_create_admins_table', 4),
(10, '2024_01_15_172209_create_product_multi_images_table', 5),
(11, '2024_01_16_181359_create_cart_items_table', 6),
(12, '2024_01_17_153435_create_orders_table', 7),
(13, '2024_01_17_153554_create_order_items_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` double(8,2) NOT NULL DEFAULT '0.00',
  `invoice_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `address`, `phone`, `email`, `total_amount`, `invoice_no`, `created_at`, `updated_at`) VALUES
(1, 2, 'Dhaka', '01627490402', 'abc@gmail.com', 20940.00, '64', '2024-01-17 11:15:20', '2024-01-17 11:15:20'),
(2, 2, 'Dhaka', '01627490402', 'abc@gmail.com', 20940.00, '42', '2024-01-17 11:15:26', '2024-01-17 11:15:26'),
(3, 2, 'Dhaka', '01627490402', 'abc@gmail.com', 20940.00, '84', '2024-01-18 13:08:01', '2024-01-18 13:08:01'),
(4, 2, 'Dhaka', '01627490402', 'abc@gmail.com', 20940.00, '50', '2024-01-18 13:08:54', '2024-01-18 13:08:54'),
(5, 2, 'Dhaka', '01627490402', 'abc@gmail.com', 20940.00, '97', '2024-01-19 12:24:51', '2024-01-19 12:24:51'),
(6, 2, 'Dhaka', '01627490402', 'abc@gmail.com', 20940.00, '77', '2024-01-19 12:25:25', '2024-01-19 12:25:25'),
(7, 2, 'Dhaka', '01627490402', 'abc@gmail.com', 20940.00, '51', '2024-01-19 13:16:02', '2024-01-19 13:16:02'),
(8, 2, 'Dhaka', '01627490402', 'abc@gmail.com', 20940.00, '27', '2024-01-19 13:16:12', '2024-01-19 13:16:12'),
(9, 2, 'Dhaka', '01627490402', 'abc@gmail.com', 20940.00, '77', '2024-01-19 13:16:23', '2024-01-19 13:16:23');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(20,2) NOT NULL DEFAULT '0.00',
  `delivery_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `qty`, `price`, `delivery_status`, `payment_status`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'abc', '3', 6980.00, 'pending', 'unpaid', '2024-01-17 11:15:20', '2024-01-17 11:15:20'),
(2, 2, 2, 'abc', '3', 6980.00, 'pending', 'unpaid', '2024-01-17 11:15:26', '2024-01-17 11:15:26'),
(3, 3, 2, 'abc', '3', 6980.00, 'pending', 'unpaid', '2024-01-18 13:08:01', '2024-01-18 13:08:01'),
(4, 4, 2, 'abc', '3', 6980.00, 'pending', 'unpaid', '2024-01-18 13:08:54', '2024-01-18 13:08:54'),
(5, 5, 2, 'abc', '3', 6980.00, 'pending', 'unpaid', '2024-01-19 12:24:51', '2024-01-19 12:24:51'),
(6, 6, 2, 'abc', '3', 6980.00, 'pending', 'unpaid', '2024-01-19 12:25:25', '2024-01-19 12:25:25'),
(7, 7, 2, 'abc', '3', 6980.00, 'pending', 'unpaid', '2024-01-19 13:16:02', '2024-01-19 13:16:02'),
(8, 8, 2, 'abc', '3', 6980.00, 'pending', 'unpaid', '2024-01-19 13:16:12', '2024-01-19 13:16:12'),
(9, 9, 2, 'abc', '3', 6980.00, 'pending', 'unpaid', '2024-01-19 13:16:23', '2024-01-19 13:16:23');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Admin', 1, 'AdminToken', '7cd5668b79921a91f55014bab5a7981ef0a8d1f5940c94a6811f4036d638f920', '[\"*\"]', NULL, '2024-01-05 10:49:30', '2024-01-05 10:49:30'),
(2, 'App\\Models\\User', 1, 'UserToken', '10b9d2a8534894e61e123c5f68e787c3b91bde2d2e68e045938d96c76de82f20', '[\"*\"]', NULL, '2024-01-05 10:59:06', '2024-01-05 10:59:06'),
(3, 'App\\Models\\Admin', 1, 'AdminToken', '36194c56b7777167ccd24d56ac5d4f80149aa1704f4ea9b69061ee336da4d911', '[\"*\"]', NULL, '2024-01-06 08:18:17', '2024-01-06 08:18:17'),
(4, 'App\\Models\\Admin', 1, 'AdminToken', 'c79daf21020e2077fac7e0bae58705ee4cd665b2322874ab2e0a77589000d598', '[\"*\"]', NULL, '2024-01-06 08:18:57', '2024-01-06 08:18:57'),
(5, 'App\\Models\\Admin', 1, 'AdminToken', '288e27d2bab80aff8e9b25744f59ecd9a64be0e6c7238005127c1ba2e4a8435f', '[\"*\"]', NULL, '2024-01-06 08:23:41', '2024-01-06 08:23:41'),
(6, 'App\\Models\\Admin', 1, 'AdminToken', '09b7f2e5d441b3bd388b72b57600e6ce64aaf45c1a5e358f4c0f06f9d93b6fba', '[\"*\"]', NULL, '2024-01-06 08:27:18', '2024-01-06 08:27:18'),
(7, 'App\\Models\\Admin', 1, 'AdminToken', '73546f60843c6915cafa9aefad0a6c4aeeed2af0b89eaa9a480a92ca4da7f1a5', '[\"*\"]', NULL, '2024-01-06 08:30:51', '2024-01-06 08:30:51'),
(8, 'App\\Models\\User', 1, 'UserToken', 'c6c6c0ab1b9beb19afa4f6bf01dbed8db4eb31c0e47e46f2957ec3f43083451e', '[\"*\"]', NULL, '2024-01-09 12:09:30', '2024-01-09 12:09:30'),
(9, 'App\\Models\\Admin', 1, 'AdminToken', 'c356ec2fd4c1a6d0eb7c0f91da1d9f481da21265d9be341fdc66001cac9d79c2', '[\"*\"]', NULL, '2024-01-09 12:09:45', '2024-01-09 12:09:45'),
(10, 'App\\Models\\User', 2, 'API TOKEN', '4fa9cdfb915505c4940edc9942f5052f9c38ac618ce498736374646ab666dbbd', '[\"*\"]', NULL, '2024-01-15 11:06:08', '2024-01-15 11:06:08'),
(11, 'App\\Models\\User', 2, 'UserToken', '25564f65267a2c24a6bd91b63529d2a93d8b366460ac7729fba4da55a0620916', '[\"*\"]', NULL, '2024-01-15 11:09:52', '2024-01-15 11:09:52'),
(12, 'App\\Models\\User', 2, 'UserToken', '349bfc905ed104ca81819253c81816d91912b06d24237d99aa75bea4a41e5876', '[\"*\"]', NULL, '2024-01-15 11:10:49', '2024-01-15 11:10:49'),
(13, 'App\\Models\\Admin', 1, 'AdminToken', 'd1f04e6ae663e08f23dcc8b1c8d046ab5bc0fc4821a2efc819a26fce4c91a19e', '[\"*\"]', NULL, '2024-01-15 11:12:16', '2024-01-15 11:12:16'),
(14, 'App\\Models\\User', 2, 'UserToken', '9675827c118c6e179550d4ff6c7c4630bd941656c29869a4d37c89d80942c227', '[\"*\"]', NULL, '2024-01-16 07:50:06', '2024-01-16 07:50:06'),
(15, 'App\\Models\\User', 2, 'UserToken', '64115a61bf4223c1add8dd0ded8e9ce2d6f889c86e0a0c4f4bba2a0bef586f4e', '[\"*\"]', NULL, '2024-01-16 07:50:59', '2024-01-16 07:50:59'),
(16, 'App\\Models\\User', 2, 'UserToken', 'a901ba5ff8843f3b83425a6b6946316ce4691d39cb3b3312e00e7253f8d5b25e', '[\"*\"]', '2024-01-16 10:21:33', '2024-01-16 08:09:29', '2024-01-16 10:21:33'),
(17, 'App\\Models\\Admin', 1, 'AdminToken', 'e7ecbbeac0832e0e7bc8be981b9825f28c3f7bd0a087c422f5f938bc12a6a0b0', '[\"*\"]', '2024-01-19 13:01:02', '2024-01-16 09:49:20', '2024-01-19 13:01:02'),
(18, 'App\\Models\\User', 2, 'UserToken', 'bf8c1196a9bdd778a8a691bf52f8f6bfa11d8934ba0c3fbb39bf606f36988846', '[\"*\"]', '2024-01-22 07:53:35', '2024-01-16 12:21:28', '2024-01-22 07:53:35'),
(19, 'App\\Models\\Admin', 1, 'AdminToken', 'fea1097203d412d47346b71b4ac0a35d804e8a79fb34cf14db5ffa61d3aa6ff5', '[\"*\"]', '2024-01-19 13:32:38', '2024-01-16 12:51:39', '2024-01-19 13:32:38'),
(20, 'App\\Models\\User', 2, 'UserToken', '504247e8b4d44e22d7d8ca3591f25e0ca04ae0dadf521fcd4f294076d70cd5c1', '[\"*\"]', '2024-01-19 12:27:29', '2024-01-19 12:25:42', '2024-01-19 12:27:29'),
(21, 'App\\Models\\User', 3, 'API TOKEN', '332bab300bb3e0ebe092bc4fb42505ed0131bb8e0d1330101e7d50ddc42b561e', '[\"*\"]', NULL, '2024-01-19 12:26:36', '2024-01-19 12:26:36'),
(22, 'App\\Models\\User', 2, 'UserToken', 'a62be5d3fa56325b899cf2b91bca910a838cdfc640625552feada5bfc15a711a', '[\"*\"]', '2024-01-19 13:22:22', '2024-01-19 12:27:42', '2024-01-19 13:22:22'),
(23, 'App\\Models\\User', 2, 'UserToken', '0b1a7ad77765794eee65b79052f5f1a0575987145df12ef924cf0249fc9ea5bd', '[\"*\"]', NULL, '2024-01-19 12:31:26', '2024-01-19 12:31:26'),
(24, 'App\\Models\\Admin', 1, 'AdminToken', '5e97d2c11085f2445f2eee8a252a5d865d8454063c5ab089bb0da93373fda1ae', '[\"*\"]', NULL, '2024-01-19 12:31:46', '2024-01-19 12:31:46'),
(25, 'App\\Models\\Admin', 1, 'AdminToken', 'be99b93c234640867a3420043faa08f88d9f36e7669c4b8485241aa6c48d942d', '[\"*\"]', NULL, '2024-01-19 12:31:59', '2024-01-19 12:31:59'),
(26, 'App\\Models\\Admin', 1, 'AdminToken', 'a32f7dfadee7527c0cd2b43df424c603661f9def65ea7534ab08c5f66c83c6a0', '[\"*\"]', '2024-01-19 13:31:17', '2024-01-19 13:22:35', '2024-01-19 13:31:17'),
(27, 'App\\Models\\Admin', 1, 'AdminToken', 'f730d20216e518b4c4fcf36de3c57086178c33b1a0cf1e528e8540139f27e4e8', '[\"*\"]', '2024-01-19 13:36:51', '2024-01-19 13:31:29', '2024-01-19 13:36:51'),
(28, 'App\\Models\\Admin', 1, 'AdminToken', '915281e228ae7799752db68557ee3ba6992f36bac1a4a0932d8e6204885b4878', '[\"*\"]', '2024-01-20 08:52:01', '2024-01-19 13:37:02', '2024-01-20 08:52:01'),
(29, 'App\\Models\\Admin', 1, 'AdminToken', 'bc631cf089c360a6c18e9ae6786a83e90afe4a6811f46b84657c4f8fa8296584', '[\"*\"]', '2024-01-21 07:57:03', '2024-01-20 08:52:38', '2024-01-21 07:57:03');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`),
  KEY `posts_category_id_foreign` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `quantity` bigint NOT NULL,
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `quantity`, `thumbnail`, `status`, `created_at`, `updated_at`) VALUES
(4, 'Test Pro', '10034.00', 60, 'upload/products/thumbnails/thumbnail_1705431178.jpg', 1, '2024-01-16 12:52:58', '2024-01-16 12:52:58'),
(2, 'abc', '6980.00', 356, 'upload/products/thumbnails/thumbnail_1705431263.jpg', 1, '2024-01-16 10:17:58', '2024-01-16 12:54:23'),
(3, 'Test Product', '1000.00', 60, 'upload/products/thumbnails/thumbnail_1705422053.jpg', 1, '2024-01-16 10:20:53', '2024-01-16 10:20:53'),
(5, 'Test Pro', '10034.00', 60, 'upload/products/thumbnails/thumbnail_1705688822.jpg', 1, '2024-01-19 12:27:02', '2024-01-19 12:27:02'),
(6, 'Test Pro', '10034.00', 60, 'upload/products/thumbnails/thumbnail_1705688842.jpg', 1, '2024-01-19 12:27:22', '2024-01-19 12:27:22'),
(7, 'Test Pro', '10034.00', 60, 'upload/products/thumbnails/thumbnail_1705688849.jpg', 1, '2024-01-19 12:27:29', '2024-01-19 12:27:29'),
(8, 'Test Pro', '10034.00', 60, 'upload/products/thumbnails/thumbnail_1705688873.jpg', 1, '2024-01-19 12:27:53', '2024-01-19 12:27:53'),
(9, 'Test Pro', '10034.00', 60, 'upload/products/thumbnails/thumbnail_1705691666.jpg', 1, '2024-01-19 13:14:26', '2024-01-19 13:14:26'),
(10, 'Test Pro', '10034.00', 60, 'upload/products/thumbnails/thumbnail_1705691674.jpg', 1, '2024-01-19 13:14:34', '2024-01-19 13:14:34');

-- --------------------------------------------------------

--
-- Table structure for table `product_multi_images`
--

DROP TABLE IF EXISTS `product_multi_images`;
CREATE TABLE IF NOT EXISTS `product_multi_images` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint UNSIGNED NOT NULL,
  `photo_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_multi_images_product_id_foreign` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_multi_images`
--

INSERT INTO `product_multi_images` (`id`, `product_id`, `photo_name`, `created_at`, `updated_at`) VALUES
(1, 3, 'upload/products/multi-image/multi_image_1705422053.png', '2024-01-16 10:20:53', '2024-01-16 10:20:53'),
(2, 3, 'upload/products/multi-image/multi_image_1705422053.png', '2024-01-16 10:20:53', '2024-01-16 10:20:53'),
(3, 4, 'upload/products/multi-image/multi_image_1705431178.png', '2024-01-16 12:52:58', '2024-01-16 12:52:58'),
(4, 4, 'upload/products/multi-image/multi_image_1705431178.png', '2024-01-16 12:52:58', '2024-01-16 12:52:58'),
(5, 2, 'upload/products/multi-image/multi_image_1705431263.png', '2024-01-16 12:54:23', '2024-01-16 12:54:23'),
(6, 5, 'upload/products/multi-image/multi_image_1705688822.png', '2024-01-19 12:27:02', '2024-01-19 12:27:02'),
(7, 5, 'upload/products/multi-image/multi_image_1705688822.png', '2024-01-19 12:27:02', '2024-01-19 12:27:02'),
(8, 6, 'upload/products/multi-image/multi_image_1705688842.png', '2024-01-19 12:27:22', '2024-01-19 12:27:22'),
(9, 6, 'upload/products/multi-image/multi_image_1705688842.png', '2024-01-19 12:27:22', '2024-01-19 12:27:22'),
(10, 7, 'upload/products/multi-image/multi_image_1705688849.png', '2024-01-19 12:27:29', '2024-01-19 12:27:29'),
(11, 7, 'upload/products/multi-image/multi_image_1705688849.png', '2024-01-19 12:27:29', '2024-01-19 12:27:29'),
(12, 8, 'upload/products/multi-image/multi_image_1705688873.png', '2024-01-19 12:27:53', '2024-01-19 12:27:53'),
(13, 8, 'upload/products/multi-image/multi_image_1705688873.png', '2024-01-19 12:27:53', '2024-01-19 12:27:53'),
(14, 9, 'upload/products/multi-image/multi_image_1705691666.png', '2024-01-19 13:14:26', '2024-01-19 13:14:26'),
(15, 9, 'upload/products/multi-image/multi_image_1705691666.png', '2024-01-19 13:14:26', '2024-01-19 13:14:26'),
(16, 10, 'upload/products/multi-image/multi_image_1705691674.png', '2024-01-19 13:14:34', '2024-01-19 13:14:34'),
(17, 10, 'upload/products/multi-image/multi_image_1705691674.png', '2024-01-19 13:14:34', '2024-01-19 13:14:34');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'user\r\n', 'user@gmail.com', '2024-01-05 17:59:47', '$2y$10$Mbf5NH4PgEnHojotDUegf.0zhQo0CnUEQylGmmoZ6fkcS6pk.NABS', NULL, '2024-01-05 17:59:47', NULL),
(2, 'abc', 'abc@gmail.com', NULL, '$2y$10$CSMa0u2KxkAKpHftj9Jc9.y7SF1jgrIFX5.N9InZLDwv.Ow2AQrUS', NULL, '2024-01-15 11:06:08', '2024-01-15 11:06:08'),
(3, 'abc', 'abac@gmail.com', NULL, '$2y$10$KCHuUQrWmvx1EmUFv8HeZuZWHbf8aKKTkm4GQxwK3l5hrwx7R/6fu', NULL, '2024-01-19 12:26:36', '2024-01-19 12:26:36');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
