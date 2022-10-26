-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 01, 2022 at 06:32 PM
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
-- Database: `parlour`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(2) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` int(12) NOT NULL,
  `password` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `mobile`, `password`) VALUES
(1, 'tuli', 'tuli@iubat.edu', 1677940484, '25d55ad283aa400af464c76d713c07ad');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` int(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `service` varchar(50) DEFAULT NULL,
  `package` varchar(50) DEFAULT NULL,
  `date` text DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `status` int(30) DEFAULT NULL,
  `beautician` varchar(50) DEFAULT NULL,
  `user_id` int(20) DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `appointment_type` int(10) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `transaction_no` varchar(50) DEFAULT NULL,
  `acc_no` varchar(50) DEFAULT NULL,
  `pay_status` int(10) DEFAULT NULL,
  `invid` int(15) DEFAULT NULL,
  `total` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `name`, `service`, `package`, `date`, `mobile`, `email`, `status`, `beautician`, `user_id`, `time`, `type`, `appointment_type`, `Address`, `transaction_no`, `acc_no`, `pay_status`, `invid`, `total`) VALUES
(4, NULL, '42', NULL, '2022-01-18', '016766823268', 'test@gmail.com', 0, '21', 3, '12:25', NULL, NULL, NULL, 'sd4f56s4d6f5', '1676682368', 1, NULL, 810),
(6, NULL, '', '3', '2022-01-30', '01718825371', 'sumona@gmail.com', 0, '', 3, '22:10', NULL, NULL, NULL, '546654gfjgh', '01676682368', 1, NULL, 3150),
(7, NULL, '', '3', '2022-01-31', '01718825371', 'mahi@gmail.com', 2, '', 10, '12:04', NULL, NULL, NULL, 'f4s65d4f', '01718825396', 1, NULL, 3150);

-- --------------------------------------------------------

--
-- Table structure for table `beautician`
--

CREATE TABLE `beautician` (
  `beauty_id` int(4) NOT NULL,
  `service_id` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `off_day` text NOT NULL,
  `expert_area` text NOT NULL,
  `deauty_starts_on` varchar(120) NOT NULL,
  `deauty_ends_on` varchar(120) NOT NULL,
  `image` text NOT NULL,
  `password` int(100) NOT NULL,
  `monthly_salary` int(6) NOT NULL,
  `type` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `beautician`
--

INSERT INTO `beautician` (`beauty_id`, `service_id`, `name`, `email`, `mobile`, `off_day`, `expert_area`, `deauty_starts_on`, `deauty_ends_on`, `image`, `password`, `monthly_salary`, `type`) VALUES
(21, 42, 'new beautician', 'beautician@gmail.com', '01718825396', 'saturday', 'makeup', '11:27', '23:27', 'public/assets/img/admin/7.jpg', 123456, 15000, 2),
(24, 41, 'riya', 'riya@gmail.com', '01718825371', 'saturday', 'makeup', '06:38', '16:36', 'public/assets/img/admin/19.jpg', 123456, 8000, 2),
(25, 41, 'moly', 'moly@gmail.com', '01718825375', 'saturday', 'makeup', '15:41', '22:45', 'public/assets/img/admin/20.jpg', 123456, 9000, 2);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(3) NOT NULL,
  `category_name` text NOT NULL,
  `image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `image`) VALUES
(7, 'Hair straight', 'public/assets/img/admin/10.jpg'),
(9, 'Skin Care 1', 'public/assets/img/admin/b3.jpg'),
(10, 'Facial', 'public/assets/img/admin/11.jpg'),
(11, 'Menicure', 'public/assets/img/admin/13.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `msg_id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `mobile` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `message_body` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `id` int(11) NOT NULL,
  `package_name` varchar(50) NOT NULL,
  `service_ids` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `package_cost` int(11) NOT NULL,
  `details` text NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`id`, `package_name`, `service_ids`, `price`, `discount`, `package_cost`, `details`, `image`) VALUES
(3, 'Student Package', '[\"41\",\"42\"]', 3500, 10, 2500, 'test', 'public/assets/img/admin/pic.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'user_management_access', '2019-09-14 18:10:05', '2019-09-14 18:10:05', NULL),
(2, 'permission_create', '2019-09-14 18:10:05', '2019-09-14 18:10:05', NULL),
(3, 'permission_edit', '2019-09-14 18:10:05', '2019-09-14 18:10:05', NULL),
(4, 'permission_show', '2019-09-14 18:10:05', '2019-09-14 18:10:05', NULL),
(5, 'permission_delete', '2019-09-14 18:10:05', '2019-09-14 18:10:05', NULL),
(6, 'permission_access', '2019-09-14 18:10:05', '2019-09-14 18:10:05', NULL),
(7, 'role_create', '2019-09-14 18:10:05', '2019-09-14 18:10:05', NULL),
(8, 'role_edit', '2019-09-14 18:10:05', '2019-09-14 18:10:05', NULL),
(9, 'role_show', '2019-09-14 18:10:05', '2019-09-14 18:10:05', NULL),
(10, 'role_delete', '2019-09-14 18:10:05', '2019-09-14 18:10:05', NULL),
(11, 'role_access', '2019-09-14 18:10:05', '2019-09-14 18:10:05', NULL),
(12, 'user_create', '2019-09-14 18:10:05', '2019-09-14 18:10:05', NULL),
(13, 'user_edit', '2019-09-14 18:10:05', '2019-09-14 18:10:05', NULL),
(14, 'user_show', '2019-09-14 18:10:05', '2019-09-14 18:10:05', NULL),
(15, 'user_delete', '2019-09-14 18:10:05', '2019-09-14 18:10:05', NULL),
(16, 'user_access', '2019-09-14 18:10:05', '2019-09-14 18:10:05', NULL),
(17, 'client_management_setting_access', '2019-09-14 18:10:05', '2022-01-01 10:59:16', '2022-01-01 10:59:16'),
(18, 'currency_create', '2019-09-14 18:10:05', '2022-01-01 11:08:41', '2022-01-01 11:08:41'),
(19, 'currency_edit', '2019-09-14 18:10:05', '2022-01-01 11:08:36', '2022-01-01 11:08:36'),
(20, 'currency_show', '2019-09-14 18:10:05', '2022-01-01 11:08:30', '2022-01-01 11:08:30'),
(21, 'currency_delete', '2019-09-14 18:10:05', '2022-01-01 11:08:19', '2022-01-01 11:08:19'),
(22, 'currency_access', '2019-09-14 18:10:05', '2022-01-01 11:08:14', '2022-01-01 11:08:14'),
(23, 'transaction_type_create', '2019-09-14 18:10:05', '2022-01-01 11:08:07', '2022-01-01 11:08:07'),
(24, 'transaction_type_edit', '2019-09-14 18:10:05', '2022-01-01 11:08:03', '2022-01-01 11:08:03'),
(25, 'transaction_type_show', '2019-09-14 18:10:05', '2022-01-01 11:07:59', '2022-01-01 11:07:59'),
(26, 'transaction_type_delete', '2019-09-14 18:10:05', '2022-01-01 11:07:55', '2022-01-01 11:07:55'),
(27, 'transaction_type_access', '2019-09-14 18:10:05', '2022-01-01 11:07:49', '2022-01-01 11:07:49'),
(28, 'income_source_create', '2019-09-14 18:10:05', '2022-01-01 11:07:45', '2022-01-01 11:07:45'),
(29, 'income_source_edit', '2019-09-14 18:10:05', '2022-01-01 11:07:41', '2022-01-01 11:07:41'),
(30, 'income_source_show', '2019-09-14 18:10:05', '2022-01-01 11:07:37', '2022-01-01 11:07:37'),
(31, 'income_source_delete', '2019-09-14 18:10:05', '2022-01-01 11:07:33', '2022-01-01 11:07:33'),
(32, 'income_source_access', '2019-09-14 18:10:05', '2022-01-01 11:07:29', '2022-01-01 11:07:29'),
(33, 'client_status_create', '2019-09-14 18:10:05', '2022-01-01 11:07:24', '2022-01-01 11:07:24'),
(34, 'client_status_edit', '2019-09-14 18:10:05', '2022-01-01 11:07:19', '2022-01-01 11:07:19'),
(35, 'client_status_show', '2019-09-14 18:10:05', '2022-01-01 11:07:15', '2022-01-01 11:07:15'),
(36, 'client_status_delete', '2019-09-14 18:10:05', '2022-01-01 11:07:11', '2022-01-01 11:07:11'),
(37, 'client_status_access', '2019-09-14 18:10:05', '2022-01-01 11:07:07', '2022-01-01 11:07:07'),
(38, 'project_status_create', '2019-09-14 18:10:05', '2022-01-01 11:07:03', '2022-01-01 11:07:03'),
(39, 'project_status_edit', '2019-09-14 18:10:05', '2022-01-01 11:06:58', '2022-01-01 11:06:58'),
(40, 'project_status_show', '2019-09-14 18:10:05', '2022-01-01 11:06:53', '2022-01-01 11:06:53'),
(41, 'project_status_delete', '2019-09-14 18:10:05', '2022-01-01 11:06:47', '2022-01-01 11:06:47'),
(42, 'project_status_access', '2019-09-14 18:10:05', '2022-01-01 11:06:42', '2022-01-01 11:06:42'),
(43, 'client_management_access', '2019-09-14 18:10:05', '2022-01-01 11:06:36', '2022-01-01 11:06:36'),
(44, 'client_create', '2019-09-14 18:10:05', '2022-01-01 11:05:59', '2022-01-01 11:05:59'),
(45, 'client_edit', '2019-09-14 18:10:05', '2022-01-01 11:05:47', '2022-01-01 11:05:47'),
(46, 'client_show', '2019-09-14 18:10:05', '2022-01-01 11:05:15', '2022-01-01 11:05:15'),
(47, 'client_delete', '2019-09-14 18:10:05', '2022-01-01 11:04:39', '2022-01-01 11:04:39'),
(48, 'client_access', '2019-09-14 18:10:05', '2022-01-01 11:04:30', '2022-01-01 11:04:30'),
(49, 'project_create', '2019-09-14 18:10:05', '2022-01-01 11:04:25', '2022-01-01 11:04:25'),
(50, 'project_edit', '2019-09-14 18:10:05', '2022-01-01 11:04:21', '2022-01-01 11:04:21'),
(51, 'project_show', '2019-09-14 18:10:05', '2022-01-01 11:04:16', '2022-01-01 11:04:16'),
(52, 'project_delete', '2019-09-14 18:10:05', '2022-01-01 11:04:12', '2022-01-01 11:04:12'),
(53, 'project_access', '2019-09-14 18:10:05', '2022-01-01 11:04:08', '2022-01-01 11:04:08'),
(54, 'note_create', '2019-09-14 18:10:05', '2022-01-01 11:04:03', '2022-01-01 11:04:03'),
(55, 'note_edit', '2019-09-14 18:10:05', '2022-01-01 11:03:59', '2022-01-01 11:03:59'),
(56, 'note_show', '2019-09-14 18:10:05', '2022-01-01 11:03:54', '2022-01-01 11:03:54'),
(57, 'note_delete', '2019-09-14 18:10:05', '2022-01-01 11:03:50', '2022-01-01 11:03:50'),
(58, 'note_access', '2019-09-14 18:10:05', '2022-01-01 11:03:45', '2022-01-01 11:03:45'),
(59, 'document_create', '2019-09-14 18:10:05', '2022-01-01 11:03:41', '2022-01-01 11:03:41'),
(60, 'document_edit', '2019-09-14 18:10:05', '2022-01-01 11:03:36', '2022-01-01 11:03:36'),
(61, 'document_show', '2019-09-14 18:10:05', '2022-01-01 11:03:30', '2022-01-01 11:03:30'),
(62, 'document_delete', '2019-09-14 18:10:05', '2022-01-01 11:03:26', '2022-01-01 11:03:26'),
(63, 'document_access', '2019-09-14 18:10:05', '2022-01-01 11:03:20', '2022-01-01 11:03:20'),
(64, 'transaction_create', '2019-09-14 18:10:05', '2022-01-01 11:03:14', '2022-01-01 11:03:14'),
(65, 'transaction_edit', '2019-09-14 18:10:05', '2022-01-01 11:03:09', '2022-01-01 11:03:09'),
(66, 'transaction_show', '2019-09-14 18:10:05', '2022-01-01 11:03:03', '2022-01-01 11:03:03'),
(67, 'transaction_delete', '2019-09-14 18:10:05', '2022-01-01 11:02:57', '2022-01-01 11:02:57'),
(68, 'transaction_access', '2019-09-14 18:10:05', '2022-01-01 11:02:51', '2022-01-01 11:02:51'),
(69, 'client_report_create', '2019-09-14 18:10:05', '2022-01-01 11:02:46', '2022-01-01 11:02:46'),
(70, 'client_report_edit', '2019-09-14 18:10:05', '2022-01-01 11:02:40', '2022-01-01 11:02:40'),
(71, 'client_report_show', '2019-09-14 18:10:05', '2022-01-01 11:02:33', '2022-01-01 11:02:33'),
(72, 'client_report_delete', '2019-09-14 18:10:05', '2022-01-01 11:02:28', '2022-01-01 11:02:28'),
(73, 'client_report_access', '2019-09-14 18:10:05', '2022-01-01 11:02:20', '2022-01-01 11:02:20'),
(74, 'Category_access', '2022-01-01 11:12:55', '2022-01-01 11:12:55', NULL),
(75, 'Category_create', '2022-01-01 11:14:32', '2022-01-01 11:14:32', NULL),
(76, 'Category_edit', '2022-01-01 11:14:44', '2022-01-01 11:14:44', NULL),
(77, 'Category_show', '2022-01-01 11:14:58', '2022-01-01 11:15:18', NULL),
(78, 'Category_delete', '2022-01-01 11:15:53', '2022-01-01 11:15:53', NULL),
(79, 'Service_access', '2022-01-01 11:33:15', '2022-01-01 11:33:15', NULL),
(80, 'Service_create', '2022-01-01 11:33:26', '2022-01-01 11:33:26', NULL),
(81, 'Service_edit', '2022-01-01 11:33:37', '2022-01-01 11:33:37', NULL),
(82, 'Service_show', '2022-01-01 11:33:49', '2022-01-01 11:33:49', NULL),
(83, 'Service_delete', '2022-01-01 11:34:00', '2022-01-01 11:34:00', NULL),
(84, 'Appointment_access', '2022-01-01 11:34:16', '2022-01-01 11:34:16', NULL),
(85, 'Appointment_create', '2022-01-01 11:34:58', '2022-01-01 11:34:58', NULL),
(86, 'Appointment_edit', '2022-01-01 11:35:08', '2022-01-01 11:35:08', NULL),
(87, 'Appointment_edit', '2022-01-01 11:35:20', '2022-01-01 11:36:07', '2022-01-01 11:36:07'),
(88, 'Appointment_show', '2022-01-01 11:35:31', '2022-01-01 11:35:31', NULL),
(89, 'Appointment_delete', '2022-01-01 11:35:58', '2022-01-01 11:35:58', NULL),
(90, 'Beautician_access', '2022-01-10 10:00:04', '2022-01-10 10:00:04', NULL),
(91, 'Beautician_create', '2022-01-10 10:00:16', '2022-01-10 10:00:16', NULL),
(92, 'Beautician_show', '2022-01-10 10:00:29', '2022-01-10 10:00:29', NULL),
(93, 'Beautician_edit', '2022-01-10 10:00:44', '2022-01-10 10:00:44', NULL),
(94, 'Beautician_delete', '2022-01-10 10:00:59', '2022-01-10 10:00:59', NULL),
(95, 'Package_access', '2022-01-28 09:16:17', '2022-01-28 09:16:17', NULL),
(96, 'Package_create', '2022-01-28 09:16:30', '2022-01-28 09:16:30', NULL),
(97, 'Package_edit', '2022-01-28 09:17:05', '2022-01-28 09:17:05', NULL),
(98, 'Package_show', '2022-01-28 09:17:17', '2022-01-28 09:17:17', NULL),
(99, 'Package_delete', '2022-01-28 09:18:01', '2022-01-28 09:18:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`role_id`, `permission_id`) VALUES
(1, 1),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(2, 17),
(2, 18),
(2, 19),
(2, 20),
(2, 21),
(2, 22),
(2, 23),
(2, 24),
(2, 25),
(2, 26),
(2, 27),
(2, 28),
(2, 29),
(2, 30),
(2, 31),
(2, 32),
(2, 33),
(2, 34),
(2, 35),
(2, 36),
(2, 37),
(2, 38),
(2, 39),
(2, 40),
(2, 41),
(2, 42),
(2, 43),
(2, 44),
(2, 45),
(2, 46),
(2, 47),
(2, 48),
(2, 49),
(2, 50),
(2, 51),
(2, 52),
(2, 53),
(2, 54),
(2, 55),
(2, 56),
(2, 57),
(2, 58),
(2, 59),
(2, 60),
(2, 61),
(2, 62),
(2, 63),
(2, 64),
(2, 65),
(2, 66),
(2, 67),
(2, 68),
(2, 69),
(2, 70),
(2, 71),
(2, 72),
(2, 73),
(3, 74),
(3, 77),
(1, 74),
(1, 75),
(1, 76),
(1, 77),
(1, 78),
(1, 79),
(1, 80),
(1, 81),
(1, 82),
(1, 83),
(1, 84),
(1, 85),
(1, 86),
(1, 88),
(1, 89),
(1, 90),
(1, 91),
(1, 92),
(1, 93),
(1, 94),
(3, 79),
(3, 82),
(3, 84),
(3, 88),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 95),
(1, 96),
(1, 97),
(1, 98),
(1, 99);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', '2019-09-15 00:09:29', '2019-09-15 00:09:29', NULL),
(2, 'User', '2019-09-15 00:09:29', '2022-01-01 11:16:47', '2022-01-01 11:16:47'),
(3, 'Beautician', '2022-01-01 11:24:13', '2022-01-01 11:24:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(2, 3),
(4, 3),
(5, 3),
(6, 3),
(1, 1),
(7, 3),
(8, 3),
(9, 3);

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `schedule_id` int(15) NOT NULL,
  `to_time` time(6) NOT NULL,
  `from_time` time(6) NOT NULL,
  `service_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `service_id` int(3) NOT NULL,
  `service_name` text DEFAULT NULL,
  `category_name` text DEFAULT NULL,
  `price` int(6) NOT NULL DEFAULT 0,
  `service_cost` int(6) NOT NULL DEFAULT 0,
  `discount` int(3) NOT NULL DEFAULT 0,
  `discounted_price` int(10) NOT NULL DEFAULT 0,
  `details` varchar(1000) DEFAULT NULL,
  `image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`service_id`, `service_name`, `category_name`, `price`, `service_cost`, `discount`, `discounted_price`, `details`, `image`) VALUES
(41, 'Test', '9', 250, 150, 2, 0, 'test11', 'public/assets/img/admin/7.jpg'),
(42, 'Pedicure', '12', 900, 500, 10, 0, 'test', 'public/assets/img/admin/11.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` int(11) DEFAULT NULL,
  `beautician_id` int(11) DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `is_admin`, `beautician_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', 'admin@admin.com', NULL, '$2y$10$rA.UbFkvBY0TnPXC5AvdEew7ITCs.PFo9eAfkH.m48GlOdhFMXvLG', 1, NULL, 'xk9ihlteu8eYAYtyScD5CLwm9xZBSk8uf3c2nWNtuw05GXciN5d6cA2gHCEI', '2019-09-14 18:09:29', '2019-09-14 18:09:29', NULL),
(2, 'Nudrat', 'nudrat@gmail.com', NULL, '$2y$10$pYQW.XG9tN7nC6xMYsZXNOP3ljoRZpf2t3HrsrJOixBcdweKf3s.S', 1, NULL, NULL, '2022-01-01 11:27:18', '2022-01-01 11:27:18', NULL),
(3, 'user', 'user@gmail.com', NULL, '$2y$10$pYQW.XG9tN7nC6xMYsZXNOP3ljoRZpf2t3HrsrJOixBcdweKf3s.S', 0, NULL, NULL, '2022-01-01 11:27:18', '2022-01-01 11:27:18', NULL),
(4, 'test', 'sumon@gmail.com', NULL, '$2y$10$l1Hjd0DGpgx7z/wIvvvDL.aUBE9eYBYBdIzJSFQy1b2tLKpSQicgq', NULL, NULL, NULL, '2022-01-10 11:24:46', '2022-01-30 11:11:32', '2022-01-30 11:11:32'),
(5, 'new beautician', 'beautician@gmail.com', NULL, '$2y$10$UUyf9CrOaOFg5JkIyXhyte3DyNL8TgU1a7ZUSUHnaWnAxTv7V92q.', 1, NULL, NULL, '2022-01-10 11:28:17', '2022-01-10 11:28:17', NULL),
(6, 'test p', 'test@gmai.com', NULL, '$2y$10$QNPLHN7QPLh1Lef5BG2neuK5UM6SQM4qpHpduP8nlnROnxiGmXakK', 1, NULL, NULL, '2022-01-18 10:09:43', '2022-01-18 10:26:28', '2022-01-18 10:26:28'),
(7, 'riya', 'riya@gmail.com', NULL, '$2y$10$B899.T.4t1Z5iQoM6xsxW.g8Mm7QHgWEnyU1F90vpqBcLbPTV5Tku', 1, NULL, NULL, '2022-01-20 12:26:43', '2022-01-20 12:31:55', '2022-01-20 12:31:55'),
(8, 'riya', 'riya@gmail.com', NULL, '$2y$10$WNXxoL3wITG/KgjPrlChzOP0ytVl1vgCpjt0sMyurd9f8nXOU7VY2', 1, NULL, NULL, '2022-01-20 12:32:47', '2022-01-20 12:32:47', NULL),
(9, 'moly', 'moly@gmail.com', NULL, '$2y$10$f709baBo/6bn22M7GfoCOOjl4lT3mwzdDY6N79kPdkd106u9y08Lq', 1, NULL, NULL, '2022-01-20 12:39:53', '2022-01-20 12:39:53', NULL),
(10, 'user1', 'user1@gmail.com', NULL, '$2y$10$NoZT/Cw7kQlbvwOHhZYSLu5hTOH4yMsN3EgqvuC2qEQoD5CJElguO', NULL, NULL, NULL, '2022-01-30 11:02:28', '2022-01-30 11:02:28', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `beautician`
--
ALTER TABLE `beautician`
  ADD PRIMARY KEY (`beauty_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`msg_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD KEY `role_id_fk_339981` (`role_id`),
  ADD KEY `permission_id_fk_339981` (`permission_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD KEY `user_id_fk_339990` (`user_id`),
  ADD KEY `role_id_fk_339990` (`role_id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`schedule_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `beautician`
--
ALTER TABLE `beautician`
  MODIFY `beauty_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `msg_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `schedule_id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
