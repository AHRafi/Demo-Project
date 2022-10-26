-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2021 at 07:43 AM
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
-- Database: `pharmrwj_pharma`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `attendance_date` date DEFAULT NULL,
  `in_time` time DEFAULT NULL,
  `out_time` time DEFAULT NULL,
  `total_hours` int(11) DEFAULT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `is_deleted` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(2) DEFAULT NULL,
  `status_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `first_name`, `last_name`, `company`, `email`, `phone`, `website`, `skype`, `country`, `created_at`, `updated_at`, `is_deleted`, `status_id`) VALUES
(1, 'sk', 'sojib', 'softanis', 'ssk58021@gmail.com', '0165456465', 'www.laravel.com', 'Dairy Ghar', 'us', '2021-03-06 09:27:17', '2021-03-06 09:27:17', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `client_statuses`
--

CREATE TABLE `client_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_statuses`
--

INSERT INTO `client_statuses` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'active', '2021-03-06 09:26:07', '2021-03-06 09:26:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `main_currency` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `is_deleted` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`, `project_id`) VALUES
(1, 'sksojib', 'test', '2021-03-06 09:29:01', '2021-03-06 09:29:01', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

CREATE TABLE `expense` (
  `id` int(10) UNSIGNED NOT NULL,
  `expense_category_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `expense_amount` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `is_deleted` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_category`
--

CREATE TABLE `expense_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_item`
--

CREATE TABLE `expense_item` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_amount` int(11) DEFAULT NULL,
  `expense_id` int(11) DEFAULT NULL,
  `created_date` int(11) DEFAULT NULL,
  `is_deleted` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `income_sources`
--

CREATE TABLE `income_sources` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fee_percent` double(15,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) DEFAULT NULL,
  `total_amount` int(11) DEFAULT NULL,
  `invoice_discount` int(11) DEFAULT NULL,
  `grand_total` int(11) DEFAULT NULL,
  `total_cost` int(11) DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `is_deleted` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_item`
--

CREATE TABLE `invoice_item` (
  `id` int(20) UNSIGNED NOT NULL,
  `item_id` int(11) NOT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `sold_quantity` int(11) DEFAULT NULL,
  `unit_selling_price` int(11) DEFAULT NULL,
  `item_discount_percentage` int(11) DEFAULT NULL,
  `unit_selling_price_after_discount` int(11) DEFAULT NULL,
  `item_total` int(11) DEFAULT NULL,
  `item_total_cost` int(11) NOT NULL,
  `invoice_id` int(20) DEFAULT NULL,
  `item_categrory_id` int(11) NOT NULL,
  `created_date` date DEFAULT NULL,
  `is_deleted` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_item_batch`
--

CREATE TABLE `invoice_item_batch` (
  `id` int(12) DEFAULT NULL,
  `invoice_id` int(12) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `invoice_item_id` int(12) DEFAULT NULL,
  `batch_id` int(12) DEFAULT NULL,
  `sold_quantity` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` int(10) UNSIGNED NOT NULL,
  `sku_part_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_type_id` int(10) DEFAULT NULL,
  `strength_capacity_size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `generic_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manufacturer_brand_id` int(10) DEFAULT NULL,
  `unit_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `box_carton_size` int(10) DEFAULT NULL,
  `item_categrory_id` int(10) DEFAULT NULL,
  `unit_selling_price` int(10) DEFAULT NULL,
  `unit_purchase_price` int(12) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `is_deleted` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_categrory`
--

CREATE TABLE `item_categrory` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `is_deleted` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `item_categrory`
--

INSERT INTO `item_categrory` (`id`, `title`, `created_date`, `is_deleted`) VALUES
(1, 'Tablet', '2021-03-18 14:55:31', 0),
(2, 'Capsule', '2021-03-18 14:55:31', 0),
(12, 'Mobile', '2021-03-25 06:03:14', 0),
(13, 'Medicine', '2021-03-25 06:03:14', 0),
(14, 'Gadget', '2021-03-25 06:03:15', 0),
(15, 'Headphones', '2021-03-31 03:03:35', 0);

-- --------------------------------------------------------

--
-- Table structure for table `item_type`
--

CREATE TABLE `item_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `item_type`
--

INSERT INTO `item_type` (`id`, `title`, `created_date`, `is_deleted`) VALUES
(1, 'Product', '2021-03-23 19:57:04', 0),
(2, 'Service', '2021-03-23 19:57:04', 0);

-- --------------------------------------------------------

--
-- Table structure for table `leave`
--

CREATE TABLE `leave` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `leave_from_date` date DEFAULT NULL,
  `leave_to_date` date DEFAULT NULL,
  `leave_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `is_deleted` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer_brand`
--

CREATE TABLE `manufacturer_brand` (
  `id` int(10) UNSIGNED NOT NULL,
  `brand name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(1, 'App\\Document', 1, '9d4b49f5-4d44-42b9-9a2b-cfe91d54a43a', 'document_file', '60439fb7aa31b_1532150670', '60439fb7aa31b_1532150670.png', 'image/png', 'public', 'public', 74183, '[]', '{\"generated_conversions\":{\"thumb\":true}}', '[]', 1, '2021-03-06 09:29:02', '2021-03-06 09:29:03');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(3, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(4, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(5, '2016_06_01_000004_create_oauth_clients_table', 1),
(6, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(7, '2019_09_15_000000_create_media_table', 1),
(8, '2019_09_15_000001_create_permissions_table', 1),
(9, '2019_09_15_000002_create_project_statuses_table', 1),
(10, '2019_09_15_000003_create_transactions_table', 1),
(11, '2019_09_15_000004_create_documents_table', 1),
(12, '2019_09_15_000005_create_notes_table', 1),
(13, '2019_09_15_000006_create_projects_table', 1),
(14, '2019_09_15_000007_create_roles_table', 1),
(15, '2019_09_15_000008_create_clients_table', 1),
(16, '2019_09_15_000009_create_client_statuses_table', 1),
(17, '2019_09_15_000010_create_income_sources_table', 1),
(18, '2019_09_15_000011_create_transaction_types_table', 1),
(19, '2019_09_15_000012_create_currencies_table', 1),
(20, '2019_09_15_000013_create_users_table', 1),
(21, '2019_09_15_000014_create_role_user_pivot_table', 1),
(22, '2019_09_15_000015_create_permission_role_pivot_table', 1),
(23, '2019_09_15_000016_add_relationship_fields_to_clients_table', 1),
(24, '2019_09_15_000017_add_relationship_fields_to_projects_table', 1),
(25, '2019_09_15_000018_add_relationship_fields_to_notes_table', 1),
(26, '2019_09_15_000019_add_relationship_fields_to_documents_table', 1),
(27, '2019_09_15_000020_add_relationship_fields_to_transactions_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `note_text` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('sadmin@softanis.com', '$2y$10$zhynWea.hYeFIMmqK2tTru5QNOKDzIG8eVkvc3EIsM.u5/eiKzcrS', '2021-03-14 11:07:16');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_of` int(11) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `expense_id` int(11) DEFAULT NULL,
  `payment_account_id` int(11) DEFAULT NULL,
  `debit_amount` int(11) DEFAULT NULL,
  `credit_amount` int(11) DEFAULT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `is_deleted` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_account`
--

CREATE TABLE `payment_account` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `is_deleted` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(1, 'user_management_access', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(2, 'permission_create', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(3, 'permission_edit', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(4, 'permission_show', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(5, 'permission_delete', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(6, 'permission_access', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(7, 'role_create', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(8, 'role_edit', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(9, 'role_show', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(10, 'role_delete', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(11, 'role_access', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(12, 'user_create', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(13, 'user_edit', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(14, 'user_show', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(15, 'user_delete', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(16, 'user_access', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(17, 'client_management_setting_access', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(18, 'currency_create', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(19, 'currency_edit', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(20, 'currency_show', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(21, 'currency_delete', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(22, 'currency_access', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(23, 'transaction_type_create', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(24, 'transaction_type_edit', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(25, 'transaction_type_show', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(26, 'transaction_type_delete', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(27, 'transaction_type_access', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(28, 'income_source_create', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(29, 'income_source_edit', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(30, 'income_source_show', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(31, 'income_source_delete', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(32, 'income_source_access', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(33, 'client_status_create', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(34, 'client_status_edit', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(35, 'client_status_show', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(36, 'client_status_delete', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(37, 'client_status_access', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(38, 'project_status_create', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(39, 'project_status_edit', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(40, 'project_status_show', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(41, 'project_status_delete', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(42, 'project_status_access', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(43, 'client_management_access', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(44, 'client_create', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(45, 'client_edit', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(46, 'client_show', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(47, 'client_delete', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(48, 'client_access', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(49, 'project_create', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(50, 'project_edit', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(51, 'project_show', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(52, 'project_delete', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(53, 'project_access', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(54, 'note_create', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(55, 'note_edit', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(56, 'note_show', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(57, 'note_delete', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(58, 'note_access', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(59, 'document_create', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(60, 'document_edit', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(61, 'document_show', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(62, 'document_delete', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(63, 'document_access', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(64, 'transaction_create', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(65, 'transaction_edit', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(66, 'transaction_show', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(67, 'transaction_delete', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(68, 'transaction_access', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(69, 'client_report_create', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(70, 'client_report_edit', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(71, 'client_report_show', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(72, 'client_report_delete', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(73, 'client_report_access', '2019-09-15 00:10:05', '2019-09-15 00:10:05', NULL),
(74, 'customer_access', '2021-03-07 14:41:34', '2021-03-07 14:41:34', NULL),
(75, 'customer_delete', '2021-03-07 14:41:59', '2021-03-07 14:41:59', NULL),
(76, 'customer_show', '2021-03-07 14:42:20', '2021-03-07 14:42:20', NULL),
(77, 'customer_edit', '2021-03-07 14:42:39', '2021-03-07 14:42:39', NULL),
(78, 'customer_create', '2021-03-07 14:42:52', '2021-03-07 14:42:52', NULL),
(79, 'invoice_create', '2021-03-07 14:53:32', '2021-03-07 14:53:32', NULL),
(80, 'invoice_edit', '2021-03-07 14:53:45', '2021-03-07 14:53:45', NULL),
(81, 'invoice_show', '2021-03-07 14:54:04', '2021-03-07 14:54:04', NULL),
(82, 'invoice_delete', '2021-03-07 14:54:20', '2021-03-07 14:54:20', NULL),
(83, 'invoice_access', '2021-03-07 14:54:33', '2021-03-07 14:54:33', NULL),
(84, 'supplier_access', '2021-03-07 14:58:17', '2021-03-07 14:58:17', NULL),
(85, 'supplier_show', '2021-03-07 14:58:26', '2021-03-07 14:58:26', NULL),
(86, 'supplier_create', '2021-03-07 14:58:52', '2021-03-07 14:58:52', NULL),
(87, 'supplier_edit', '2021-03-07 14:59:04', '2021-03-07 14:59:04', NULL),
(88, 'supplier_delete', '2021-03-07 14:59:13', '2021-03-07 14:59:13', NULL),
(89, 'purchase_access', '2021-03-07 15:00:33', '2021-03-07 15:00:33', NULL),
(90, 'purchase_show', '2021-03-07 15:00:46', '2021-03-07 15:00:46', NULL),
(91, 'purchase_create', '2021-03-07 15:01:27', '2021-03-07 15:01:27', NULL),
(92, 'purchase_edit', '2021-03-07 15:02:36', '2021-03-07 15:02:36', NULL),
(93, 'purchase_delete', '2021-03-07 15:02:47', '2021-03-07 15:02:47', NULL),
(94, 'expense_access', '2021-03-07 15:03:08', '2021-03-07 15:03:08', NULL),
(95, 'expense_create', '2021-03-07 15:06:30', '2021-03-07 15:06:30', NULL),
(96, 'expense_edit', '2021-03-07 15:06:43', '2021-03-07 15:06:43', NULL),
(97, 'expense_delete', '2021-03-07 15:06:52', '2021-03-07 15:06:52', NULL),
(98, 'expense_show', '2021-03-07 15:07:09', '2021-03-07 15:07:09', NULL),
(99, 'voucher_access', '2021-03-07 15:07:30', '2021-03-07 15:07:30', NULL),
(100, 'voucher_show', '2021-03-07 15:07:38', '2021-03-07 15:07:38', NULL),
(101, 'voucher_edit', '2021-03-07 15:07:47', '2021-03-07 15:07:47', NULL),
(102, 'voucher_create', '2021-03-07 15:07:57', '2021-03-07 15:07:57', NULL),
(103, 'voucher_delete', '2021-03-07 15:08:08', '2021-03-07 15:08:08', NULL),
(104, 'employee_access', '2021-03-07 15:08:32', '2021-03-07 15:08:32', NULL),
(105, 'employee_show', '2021-03-07 15:08:40', '2021-03-07 15:08:40', NULL),
(106, 'employee_create', '2021-03-07 15:08:49', '2021-03-07 15:08:49', NULL),
(107, 'employee_edit', '2021-03-07 15:08:59', '2021-03-07 15:08:59', NULL),
(108, 'employee_delete', '2021-03-07 15:09:10', '2021-03-07 15:09:10', NULL),
(109, 'report_access', '2021-03-07 15:09:52', '2021-03-07 15:09:52', NULL),
(110, 'report_show', '2021-03-07 15:10:02', '2021-03-07 15:10:02', NULL),
(111, 'report_create', '2021-03-07 15:10:14', '2021-03-07 15:10:14', NULL),
(112, 'report_edit', '2021-03-07 15:11:05', '2021-03-07 15:11:05', NULL),
(113, 'report_delete', '2021-03-07 15:11:18', '2021-03-07 15:11:18', NULL),
(114, 'attendance_access', '2021-03-07 15:13:08', '2021-03-07 15:13:08', NULL),
(115, 'attendance_show', '2021-03-07 15:13:17', '2021-03-07 15:13:17', NULL),
(116, 'attendance_create', '2021-03-07 15:13:27', '2021-03-07 15:13:27', NULL),
(117, 'attendance_edit', '2021-03-07 15:13:45', '2021-03-07 15:13:45', NULL),
(118, 'attendance_delete', '2021-03-07 15:13:53', '2021-03-07 15:13:53', NULL),
(119, 'settings_access', '2021-03-07 15:14:26', '2021-03-07 15:14:26', NULL),
(120, 'leave_access', '2021-03-07 15:15:34', '2021-03-07 15:15:34', NULL),
(121, 'leave_show', '2021-03-07 15:15:42', '2021-03-07 15:15:42', NULL),
(122, 'leave_create', '2021-03-07 15:15:51', '2021-03-07 15:15:51', NULL),
(123, 'leave_edit', '2021-03-07 15:16:00', '2021-03-07 15:16:00', NULL),
(124, 'leave_delete', '2021-03-07 15:16:09', '2021-03-07 15:16:09', NULL),
(125, 'dashboard_access', '2021-03-07 15:24:22', '2021-03-07 15:24:22', NULL),
(126, 'dashboard_emp_access', '2021-03-07 15:24:38', '2021-03-07 15:24:38', NULL),
(127, 'items_access', '2021-03-09 13:17:48', '2021-03-09 13:17:48', NULL),
(128, 'items_show', '2021-03-09 13:17:56', '2021-03-09 13:17:56', NULL),
(129, 'items_create', '2021-03-09 13:18:07', '2021-03-09 13:18:07', NULL),
(130, 'items_edit', '2021-03-09 13:18:15', '2021-03-09 13:18:15', NULL),
(131, 'items_delete', '2021-03-09 13:18:26', '2021-03-09 13:18:26', NULL),
(132, 'test_access', '2021-03-12 13:50:07', '2021-03-12 13:50:07', NULL),
(133, 'test_create', '2021-03-12 13:50:17', '2021-03-12 13:50:17', NULL),
(134, 'test_edit', '2021-03-12 13:50:29', '2021-03-12 13:50:29', NULL),
(135, 'test_show', '2021-03-12 13:50:39', '2021-03-12 13:50:39', NULL),
(136, 'test_delete', '2021-03-12 13:50:48', '2021-03-12 13:50:48', NULL);

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
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
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
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 42),
(1, 43),
(1, 44),
(1, 45),
(1, 46),
(1, 47),
(1, 48),
(1, 49),
(1, 50),
(1, 51),
(1, 52),
(1, 53),
(1, 54),
(1, 55),
(1, 56),
(1, 57),
(1, 58),
(1, 59),
(1, 60),
(1, 61),
(1, 62),
(1, 63),
(1, 64),
(1, 65),
(1, 66),
(1, 67),
(1, 68),
(1, 69),
(1, 70),
(1, 71),
(1, 72),
(1, 73),
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
(1, 87),
(1, 88),
(1, 89),
(1, 90),
(1, 91),
(1, 92),
(1, 93),
(1, 94),
(1, 95),
(1, 96),
(1, 97),
(1, 98),
(1, 99),
(1, 100),
(1, 101),
(1, 102),
(1, 103),
(1, 104),
(1, 105),
(1, 106),
(1, 107),
(1, 108),
(1, 109),
(1, 110),
(1, 111),
(1, 112),
(1, 113),
(1, 114),
(1, 115),
(1, 116),
(1, 117),
(1, 118),
(1, 119),
(1, 120),
(1, 121),
(1, 122),
(1, 123),
(1, 124),
(1, 125),
(1, 126),
(1, 127),
(1, 128),
(1, 129),
(1, 130),
(1, 131),
(1, 132),
(1, 133),
(1, 134),
(1, 135),
(1, 136);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `budget` double(15,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `client_id` int(10) UNSIGNED DEFAULT NULL,
  `status_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `name`, `description`, `start_date`, `budget`, `created_at`, `updated_at`, `deleted_at`, `client_id`, `status_id`) VALUES
(1, 'demo', 'test', '2021-03-06', 9.97, '2021-03-06 09:28:46', '2021-03-06 09:28:46', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `project_statuses`
--

CREATE TABLE `project_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_statuses`
--

INSERT INTO `project_statuses` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Complete', '2021-03-06 09:28:14', '2021-03-06 09:28:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `id` int(10) UNSIGNED NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `purchase_amount` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `is_sales_return` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `is_deleted` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_item`
--

CREATE TABLE `purchase_item` (
  `id` int(10) UNSIGNED NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `purchase_quantity` int(11) DEFAULT NULL,
  `total_price` int(11) DEFAULT NULL,
  `vat_percentage` int(11) DEFAULT NULL,
  `discount_percentage` int(11) DEFAULT NULL,
  `total_amount` int(11) DEFAULT NULL,
  `cost_per_unit` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `is_deleted` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(2, 'User', '2019-09-15 00:09:29', '2019-09-15 00:09:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `user_id`, `role_id`) VALUES
(1, 2, 1),
(2, 3, 1),
(4, 3, 2),
(9, 10, 1),
(10, 10, 2),
(11, 11, 2),
(12, 14, 1),
(13, 15, 1),
(14, 16, 1),
(15, 16, 2);

-- --------------------------------------------------------

--
-- Table structure for table `settings_general`
--

CREATE TABLE `settings_general` (
  `id` int(10) UNSIGNED NOT NULL,
  `setting_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `setting_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(10) UNSIGNED NOT NULL,
  `supplier_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_person` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `is_deleted` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `transaction_type_id` int(10) UNSIGNED DEFAULT NULL,
  `income_source_id` int(10) UNSIGNED DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_types`
--

CREATE TABLE `transaction_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_admin` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `can_login` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `emergency_contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergency_mobile` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `mobile`, `nid`, `designation`, `address`, `branch`, `is_admin`, `role_id`, `image`, `email_verified_at`, `password`, `remember_token`, `can_login`, `status`, `emergency_contact`, `emergency_mobile`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', 'admin@admin.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$rA.UbFkvBY0TnPXC5AvdEew7ITCs.PFo9eAfkH.m48GlOdhFMXvLG$2y$10$rA.UbFkvBY0TnPXC5AvdEew7ITCs.PFo9eAfkH.m48GlOdhFMXvLG', NULL, NULL, NULL, NULL, NULL, '2019-09-15 00:09:29', '2019-09-15 00:09:29', NULL),
(2, 'Demo User', 'demo@admin.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$rA.UbFkvBY0TnPXC5AvdEew7ITCs.PFo9eAfkH.m48GlOdhFMXvLG', 'ho7pmhlbei7kmkcYT4ai99FfyvHz3JDtDcWgiwXiVvtYkJ0UoqA9y6o4dqLC', NULL, NULL, NULL, NULL, '2021-03-06 00:09:29', '2021-03-06 22:52:33', NULL),
(3, 'Super Admin', 'sadmin@softanis.com', '232323', NULL, 'Test', 'dhaka', 'Test', NULL, NULL, NULL, NULL, '$2y$10$6sIzKjjUhA5lxQsl..HheODIzuHHL2la/Ytvp06KTiFSWsZ7xwvG.', 'iCBxxEV0Tx1KtjJvrY7ASJxj38GaBga5Kjb927otPBYdVivCmJ8QnmxjyTHu', NULL, NULL, '1212121', '12121212', '2021-03-06 18:11:12', '2021-03-14 11:37:20', NULL),
(4, 'sk sojib', 'ssk58021@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$/DFK0AY4zAP3Mf0jx/iE.eYgZAwRee4Yjn2BiVyTnvqyNEvSb8Y3q', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-13 17:53:47', '2021-03-13 17:53:47'),
(5, 'sk sojib', 'ssk58021@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$2CH1R5IsEoFUtoeg0sNJuuHZ/eA7kVBEjLHJNhN.3yf3cl7j1jX/y', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-13 19:05:12', '2021-03-13 19:05:12'),
(6, 'sk sojib', 'ssk58021@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$GizB1bUvy5CvTlYW3inFMeoluTriTqQC92rDOBxZRSYf/2d5/yT4S', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-13 19:08:03', '2021-03-13 19:08:03'),
(7, 'sk sojib', 'ssk58021@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$GFLIgmiW5lv/Cl09el.HAOwHz.XQFxOCLhmPodAujUpPu.idxaL5i', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-13 19:08:07', '2021-03-13 19:08:07'),
(8, 'sk sojib', 'ssk58021@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$A5oCjfxZRaA6cwPBo5N.9OILHguLIM8ONhRwvi7d1OxP9L7/QjtbC', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-13 19:08:11', '2021-03-13 19:08:11'),
(9, 'sk sojib', 'ssk58021@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$Jg0NkPtzH/vhkzmXypIlSuI6UDv/ufY593tlwXERxUBlzqOWdkR3W', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-13 19:19:14', '2021-03-13 19:19:14'),
(10, 'sk sojib', 'ssk58021@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$0wflSPKlaJA5.zHZLybvuuEOv2OekCVpWJ7DeSmM2WrW7anjOGmXa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-13 19:20:10', '2021-03-13 19:20:10'),
(11, 'test', 'ssk58021@gmail.com', '0154545', NULL, 'CMO', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$JfnRiUgtD/59/GJ6jDYTEO6QUZM2iKC3J6QBv4ruhYdhltSiaO.KK', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-15 04:46:39', '2021-03-15 04:46:39'),
(12, 'Super Admin 2', 'admin@softanis.com', '232323', NULL, 'Test', 'dhaka', 'Test', NULL, NULL, NULL, NULL, '123456', '', NULL, NULL, '1212121', '12121212', '2021-03-06 18:11:12', '2021-03-13 19:08:22', NULL),
(13, 'Test Admin', 'test@email.com', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '$2y$10$rA.UbFkvBY0TnPXC5AvdEew7ITCs.PFo9eAfkH.m48GlOdhFMXvLG$2y$10$rA.UbFkvBY0TnPXC5AvdEew7ITCs.PFo9eAfkH.m48GlOdhFMXvLG', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'Test User 1', 'test1@email.com', '013265451', NULL, 'Test Designation 1', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$VlzjrcydShEJDHYLOeon7u6nNUbowIsutnKJSlZykkakS1wV0ezNC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'Test user 11', 'user11@email.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$NV4rf4qZ4xzXm0ngiXKl5.cEKGbJM0mNxFg/R7HFXT2ZFOHE3G9O2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'todaytest', 'testcust1@gmail.com', '01714856', NULL, 'test', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$LAwnOAGDkkdwsI13ZfYuyOF1QuJpfuVKyei1SbM/Q9EBjUUKubJHi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `voucher`
--

CREATE TABLE `voucher` (
  `id` int(10) UNSIGNED NOT NULL,
  `debit_account_id` int(11) DEFAULT NULL,
  `credit_account_id` int(11) DEFAULT NULL,
  `debit_amount` int(11) DEFAULT NULL,
  `credit_amount` int(11) DEFAULT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `is_deleted` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `voucher_account`
--

CREATE TABLE `voucher_account` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `is_deleted` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_fk_340032` (`status_id`);

--
-- Indexes for table `client_statuses`
--
ALTER TABLE `client_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_fk_340053` (`project_id`);

--
-- Indexes for table `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_category`
--
ALTER TABLE `expense_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_item`
--
ALTER TABLE `expense_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `income_sources`
--
ALTER TABLE `income_sources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_item`
--
ALTER TABLE `invoice_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_categrory`
--
ALTER TABLE `item_categrory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_type`
--
ALTER TABLE `item_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave`
--
ALTER TABLE `leave`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manufacturer_brand`
--
ALTER TABLE `manufacturer_brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`(191),`model_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_fk_340047` (`project_id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`(191));

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_account`
--
ALTER TABLE `payment_account`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_fk_340038` (`client_id`),
  ADD KEY `status_fk_340042` (`status_id`);

--
-- Indexes for table `project_statuses`
--
ALTER TABLE `project_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_item`
--
ALTER TABLE `purchase_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_fk_339990` (`user_id`),
  ADD KEY `role_id_fk_339990` (`role_id`);

--
-- Indexes for table `settings_general`
--
ALTER TABLE `settings_general`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_fk_340061` (`project_id`),
  ADD KEY `transaction_type_fk_340062` (`transaction_type_id`),
  ADD KEY `income_source_fk_340063` (`income_source_id`),
  ADD KEY `currency_fk_340065` (`currency_id`);

--
-- Indexes for table `transaction_types`
--
ALTER TABLE `transaction_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voucher_account`
--
ALTER TABLE `voucher_account`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `client_statuses`
--
ALTER TABLE `client_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `expense`
--
ALTER TABLE `expense`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_category`
--
ALTER TABLE `expense_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_item`
--
ALTER TABLE `expense_item`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `income_sources`
--
ALTER TABLE `income_sources`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_item`
--
ALTER TABLE `invoice_item`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_categrory`
--
ALTER TABLE `item_categrory`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `item_type`
--
ALTER TABLE `item_type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `leave`
--
ALTER TABLE `leave`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manufacturer_brand`
--
ALTER TABLE `manufacturer_brand`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_account`
--
ALTER TABLE `payment_account`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `project_statuses`
--
ALTER TABLE `project_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_item`
--
ALTER TABLE `purchase_item`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `settings_general`
--
ALTER TABLE `settings_general`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction_types`
--
ALTER TABLE `transaction_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `voucher`
--
ALTER TABLE `voucher`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `voucher_account`
--
ALTER TABLE `voucher_account`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `status_fk_340032` FOREIGN KEY (`status_id`) REFERENCES `client_statuses` (`id`);

--
-- Constraints for table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `project_fk_340053` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`);

--
-- Constraints for table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `project_fk_340047` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`);

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_id_fk_339981` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_id_fk_339981` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `client_fk_340038` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `status_fk_340042` FOREIGN KEY (`status_id`) REFERENCES `project_statuses` (`id`);

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_id_fk_339990` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_id_fk_339990` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `currency_fk_340065` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `income_source_fk_340063` FOREIGN KEY (`income_source_id`) REFERENCES `income_sources` (`id`),
  ADD CONSTRAINT `project_fk_340061` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `transaction_type_fk_340062` FOREIGN KEY (`transaction_type_id`) REFERENCES `transaction_types` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
