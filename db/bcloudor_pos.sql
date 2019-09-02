-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 02, 2019 at 12:55 AM
-- Server version: 10.2.26-MariaDB-cll-lve
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bcloudor_pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `barcodes`
--

CREATE TABLE `barcodes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `width` double(8,2) DEFAULT NULL,
  `height` double(8,2) DEFAULT NULL,
  `paper_width` double(8,2) DEFAULT NULL,
  `paper_height` double(8,2) DEFAULT NULL,
  `top_margin` double(8,2) DEFAULT NULL,
  `left_margin` double(8,2) DEFAULT NULL,
  `row_distance` double(8,2) DEFAULT NULL,
  `col_distance` double(8,2) DEFAULT NULL,
  `stickers_in_one_row` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_continuous` tinyint(1) NOT NULL DEFAULT 0,
  `stickers_in_one_sheet` int(11) DEFAULT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barcodes`
--

INSERT INTO `barcodes` (`id`, `name`, `description`, `width`, `height`, `paper_width`, `paper_height`, `top_margin`, `left_margin`, `row_distance`, `col_distance`, `stickers_in_one_row`, `is_default`, `is_continuous`, `stickers_in_one_sheet`, `business_id`, `created_at`, `updated_at`) VALUES
(1, '20 Labels per Sheet - (8.5\" x 11\")', 'Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 4\" x 1\"\\r\\nLabels per sheet: 20', 3.75, 1.00, 8.50, 11.00, 0.50, 0.50, 0.00, 0.16, 2, 0, 0, 20, NULL, '2017-12-18 01:13:44', '2017-12-18 01:13:44'),
(2, '30 Labels per sheet - (8.5\" x 11\")', 'Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 2.625\" x 1\"\\r\\nLabels per sheet: 30', 2.62, 1.00, 8.50, 11.00, 0.50, 0.22, 0.00, 0.14, 3, 0, 0, 30, NULL, '2017-12-18 01:04:39', '2017-12-18 01:10:40'),
(3, '32 Labels per sheet - (8.5\" x 11\")', 'Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 2\" x 1.25\"\\r\\nLabels per sheet: 32', 2.00, 1.25, 8.50, 11.00, 0.50, 0.25, 0.00, 0.00, 4, 0, 0, 32, NULL, '2017-12-18 00:55:40', '2017-12-18 00:55:40'),
(4, '40 Labels per sheet - (8.5\" x 11\")', 'Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 2\" x 1\"\\r\\nLabels per sheet: 40', 2.00, 1.00, 8.50, 11.00, 0.50, 0.25, 0.00, 0.00, 4, 0, 0, 40, NULL, '2017-12-18 00:58:40', '2017-12-18 00:58:40'),
(5, '50 Labels per Sheet - (8.5\" x 11\")', 'Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 1.5\" x 1\"\\r\\nLabels per sheet: 50', 1.50, 1.00, 8.50, 11.00, 0.50, 0.50, 0.00, 0.00, 5, 0, 0, 50, NULL, '2017-12-18 00:51:10', '2017-12-18 00:51:10'),
(6, 'Continuous Rolls - 31.75mm x 25.4mm', 'Label Size: 31.75mm x 25.4mm\\r\\nGap: 3.18mm', 1.25, 1.00, 1.25, 0.00, 0.12, 0.00, 0.12, 0.00, 1, 0, 1, NULL, NULL, '2017-12-18 00:51:10', '2017-12-18 00:51:10');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `contact_id` int(10) UNSIGNED NOT NULL,
  `waiter_id` int(10) UNSIGNED DEFAULT NULL,
  `table_id` int(10) UNSIGNED DEFAULT NULL,
  `correspondent_id` int(11) DEFAULT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `booking_start` datetime NOT NULL,
  `booking_end` datetime NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `booking_status` enum('booked','completed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `business_id`, `name`, `description`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Acer', 'Acer', 1, NULL, '2019-01-23 18:09:43', '2019-01-23 18:09:43'),
(2, 1, 'Apple', 'Apple', 1, NULL, '2019-01-23 18:09:55', '2019-01-23 18:09:55'),
(3, 1, 'Adidas', 'Adidas', 1, NULL, '2019-01-24 06:43:18', '2019-01-24 06:43:18'),
(4, 1, 'Barilla', 'Barilla', 1, NULL, '2019-01-24 06:43:28', '2019-01-24 06:43:28'),
(5, 1, 'Bowflex', 'Bowflex', 1, NULL, '2019-01-24 06:43:35', '2019-01-24 06:43:35'),
(6, 1, 'Espirit', 'Espirit', 1, NULL, '2019-01-24 06:43:42', '2019-01-24 06:43:42'),
(7, 1, 'Levis', 'Levis', 1, NULL, '2019-01-24 06:43:50', '2019-01-24 06:43:50'),
(8, 1, 'Lipton', 'Lipton', 1, NULL, '2019-01-24 06:43:58', '2019-01-24 06:43:58'),
(9, 1, 'Nike', 'Nike', 1, NULL, '2019-01-24 06:44:06', '2019-01-24 06:44:06'),
(10, 1, 'Oreo', 'Oreo', 1, NULL, '2019-01-24 06:44:13', '2019-01-24 06:44:13'),
(11, 1, 'Puma', 'Puma', 1, NULL, '2019-01-24 06:44:20', '2019-01-24 06:44:20'),
(12, 1, 'Samsung', 'Samsung', 1, NULL, '2019-01-24 06:44:28', '2019-01-24 06:44:28'),
(13, 1, 'Sharewood', 'Sharewood', 1, NULL, '2019-01-24 06:44:35', '2019-01-24 06:44:35'),
(14, 1, 'U.S. Polo Assn.', 'U.S. Polo Assn.', 1, NULL, '2019-01-24 06:44:44', '2019-01-24 06:44:44'),
(15, 1, 'MOdren', NULL, 1, NULL, '2019-05-31 00:45:10', '2019-05-31 00:45:10'),
(16, 1, 'MOdren', 'modren', 1, NULL, '2019-06-01 15:44:37', '2019-06-01 15:44:37');

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE `business` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `tax_number_1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label_1` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number_2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label_2` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_sales_tax` int(10) UNSIGNED DEFAULT NULL,
  `default_profit_percent` double(5,2) NOT NULL DEFAULT 0.00,
  `owner_id` int(10) UNSIGNED NOT NULL,
  `time_zone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Asia/Kolkata',
  `fy_start_month` tinyint(4) NOT NULL DEFAULT 1,
  `accounting_method` enum('fifo','lifo','avco') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fifo',
  `default_sales_discount` decimal(20,2) DEFAULT NULL,
  `sell_price_tax` enum('includes','excludes') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'includes',
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_product_expiry` tinyint(1) NOT NULL DEFAULT 0,
  `expiry_type` enum('add_expiry','add_manufacturing') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'add_expiry',
  `on_product_expiry` enum('keep_selling','stop_selling','auto_delete') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'keep_selling',
  `stop_selling_before` int(11) NOT NULL COMMENT 'Stop selling expied item n days before expiry',
  `enable_tooltip` tinyint(1) NOT NULL DEFAULT 1,
  `purchase_in_diff_currency` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Allow purchase to be in different currency then the business currency',
  `purchase_currency_id` int(10) UNSIGNED DEFAULT NULL,
  `p_exchange_rate` decimal(20,3) NOT NULL DEFAULT 1.000,
  `transaction_edit_days` int(10) UNSIGNED NOT NULL DEFAULT 30,
  `stock_expiry_alert_days` int(10) UNSIGNED NOT NULL DEFAULT 30,
  `keyboard_shortcuts` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pos_settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_brand` tinyint(1) NOT NULL DEFAULT 1,
  `enable_category` tinyint(1) NOT NULL DEFAULT 1,
  `enable_sub_category` tinyint(1) NOT NULL DEFAULT 1,
  `enable_price_tax` tinyint(1) NOT NULL DEFAULT 1,
  `enable_purchase_status` tinyint(1) DEFAULT 1,
  `enable_lot_number` tinyint(1) NOT NULL DEFAULT 0,
  `default_unit` int(11) DEFAULT NULL,
  `enable_racks` tinyint(1) NOT NULL DEFAULT 0,
  `enable_row` tinyint(1) NOT NULL DEFAULT 0,
  `enable_position` tinyint(1) NOT NULL DEFAULT 0,
  `enable_editing_product_from_purchase` tinyint(1) NOT NULL DEFAULT 1,
  `sales_cmsn_agnt` enum('logged_in_user','user','cmsn_agnt') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_addition_method` tinyint(1) NOT NULL DEFAULT 1,
  `enable_inline_tax` tinyint(1) NOT NULL DEFAULT 1,
  `currency_symbol_placement` enum('before','after') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'before',
  `enabled_modules` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'm/d/Y',
  `time_format` enum('12','24') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '24',
  `ref_no_prefixes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme_color` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `email_settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business`
--

INSERT INTO `business` (`id`, `name`, `currency_id`, `start_date`, `tax_number_1`, `tax_label_1`, `tax_number_2`, `tax_label_2`, `default_sales_tax`, `default_profit_percent`, `owner_id`, `time_zone`, `fy_start_month`, `accounting_method`, `default_sales_discount`, `sell_price_tax`, `logo`, `sku_prefix`, `enable_product_expiry`, `expiry_type`, `on_product_expiry`, `stop_selling_before`, `enable_tooltip`, `purchase_in_diff_currency`, `purchase_currency_id`, `p_exchange_rate`, `transaction_edit_days`, `stock_expiry_alert_days`, `keyboard_shortcuts`, `pos_settings`, `enable_brand`, `enable_category`, `enable_sub_category`, `enable_price_tax`, `enable_purchase_status`, `enable_lot_number`, `default_unit`, `enable_racks`, `enable_row`, `enable_position`, `enable_editing_product_from_purchase`, `sales_cmsn_agnt`, `item_addition_method`, `enable_inline_tax`, `currency_symbol_placement`, `enabled_modules`, `date_format`, `time_format`, `ref_no_prefixes`, `theme_color`, `created_by`, `email_settings`, `sms_settings`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'POS', 91, '2019-01-02', '1122334455', 'GST', NULL, NULL, NULL, 3.00, 1, 'Asia/Karachi', 6, 'fifo', NULL, 'includes', '1558378115_logo.jpg', NULL, 0, 'add_expiry', 'keep_selling', 0, 1, 0, NULL, 1.000, 30, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"recent_product_quantity\":\"f2\",\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"add_new_product\":\"f4\"}}', '{\"is_pos_subtotal_editable\":\"1\",\"disable_pay_checkout\":0,\"disable_draft\":0,\"disable_express_checkout\":0,\"hide_product_suggestion\":0,\"hide_recent_trans\":0,\"disable_discount\":0,\"disable_order_tax\":0}', 1, 1, 1, 1, 1, 0, NULL, 0, 0, 0, 1, NULL, 1, 1, 'before', '[\"account\"]', 'm/d/Y', '12', '{\"purchase\":\"PO\",\"purchase_return\":null,\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"expense_payment\":null,\"business_location\":\"BL\"}', NULL, NULL, '{\"mail_host\":null,\"mail_port\":null,\"mail_username\":null,\"mail_password\":null,\"mail_encryption\":null,\"mail_from_address\":null,\"mail_from_name\":null}', '{\"url\":null,\"send_to_param_name\":\"to\",\"msg_param_name\":\"text\",\"request_method\":\"post\",\"param_1\":null,\"param_val_1\":null,\"param_2\":null,\"param_val_2\":null,\"param_3\":null,\"param_val_3\":null,\"param_4\":null,\"param_val_4\":null,\"param_5\":null,\"param_val_5\":null}', 1, '2019-01-23 17:59:41', '2019-09-01 11:51:40');

-- --------------------------------------------------------

--
-- Table structure for table `business_locations`
--

CREATE TABLE `business_locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `landmark` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_scheme_id` int(10) UNSIGNED NOT NULL,
  `invoice_layout_id` int(10) UNSIGNED NOT NULL,
  `print_receipt_on_invoice` tinyint(1) DEFAULT 1,
  `receipt_printer_type` enum('browser','printer') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'browser',
  `printer_id` int(11) DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_locations`
--

INSERT INTO `business_locations` (`id`, `business_id`, `location_id`, `name`, `landmark`, `country`, `state`, `city`, `zip_code`, `invoice_scheme_id`, `invoice_layout_id`, `print_receipt_on_invoice`, `receipt_printer_type`, `printer_id`, `mobile`, `alternate_number`, `email`, `website`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'BL0001', 'MY SHOP', 'punjab', 'Pakistan', 'punjab', 'rwp', '46000', 1, 1, 1, 'browser', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-23 17:59:42', '2019-05-25 00:30:45');

-- --------------------------------------------------------

--
-- Table structure for table `cash_registers`
--

CREATE TABLE `cash_registers` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('close','open') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `closed_at` datetime DEFAULT NULL,
  `closing_amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `total_card_slips` int(11) NOT NULL DEFAULT 0,
  `total_cheques` int(11) NOT NULL DEFAULT 0,
  `closing_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_registers`
--

INSERT INTO `cash_registers` (`id`, `business_id`, `user_id`, `status`, `closed_at`, `closing_amount`, `total_card_slips`, `total_cheques`, `closing_note`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'close', '2019-08-04 14:35:02', 27650.00, 0, 0, NULL, '2019-01-23 18:00:33', '2019-08-04 18:35:02'),
(2, 1, 2, 'open', NULL, 0.00, 0, 0, NULL, '2019-01-24 11:10:11', '2019-01-24 11:10:11'),
(3, 1, 4, 'open', NULL, 0.00, 0, 0, NULL, '2019-06-19 01:41:46', '2019-06-19 01:41:46'),
(4, 1, 6, 'close', '2019-07-02 15:06:35', 850.00, 0, 0, NULL, '2019-07-02 19:03:46', '2019-07-02 19:06:35'),
(5, 1, 6, 'open', NULL, 0.00, 0, 0, NULL, '2019-07-03 04:50:21', '2019-07-03 04:50:21'),
(6, 1, 1, 'close', '2019-08-09 09:27:36', 58000.00, 0, 0, NULL, '2019-08-04 18:37:08', '2019-08-09 13:27:36'),
(7, 1, 9, 'open', NULL, 0.00, 0, 0, NULL, '2019-08-04 18:59:00', '2019-08-04 18:59:00'),
(8, 1, 10, 'open', NULL, 0.00, 0, 0, NULL, '2019-08-06 19:51:27', '2019-08-06 19:51:27'),
(9, 1, 1, 'close', '2019-08-10 12:50:58', 1607.12, 0, 0, NULL, '2019-08-09 13:27:57', '2019-08-10 16:50:58'),
(10, 1, 1, 'open', NULL, 0.00, 0, 0, NULL, '2019-08-10 16:51:33', '2019-08-10 16:51:33');

-- --------------------------------------------------------

--
-- Table structure for table `cash_register_transactions`
--

CREATE TABLE `cash_register_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `cash_register_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `pay_method` enum('cash','card','cheque','bank_transfer','custom_pay_1','custom_pay_2','custom_pay_3','other') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_type` enum('initial','sell','transfer','refund') COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_register_transactions`
--

INSERT INTO `cash_register_transactions` (`id`, `cash_register_id`, `amount`, `pay_method`, `type`, `transaction_type`, `transaction_id`, `created_at`, `updated_at`) VALUES
(1, 1, 10000.00, 'cash', 'credit', 'initial', NULL, '2019-01-23 18:00:33', '2019-01-23 18:00:33'),
(2, 1, 125.00, 'cash', 'credit', 'sell', 9, '2019-01-24 11:08:31', '2019-01-24 11:08:31'),
(3, 1, 0.00, 'cash', 'credit', 'sell', 9, '2019-01-24 11:08:31', '2019-01-24 11:08:31'),
(4, 2, 10000.00, 'cash', 'credit', 'initial', NULL, '2019-01-24 11:10:12', '2019-01-24 11:10:12'),
(5, 1, 125.00, 'cash', 'credit', 'sell', 11, '2019-03-11 05:21:58', '2019-03-11 05:21:58'),
(6, 1, 0.00, 'cash', 'credit', 'sell', 11, '2019-03-11 05:21:58', '2019-03-11 05:21:58'),
(7, 1, 125.00, 'cash', 'credit', 'sell', 12, '2019-04-22 16:59:51', '2019-04-22 16:59:51'),
(8, 1, 0.00, 'cash', 'credit', 'sell', 12, '2019-04-22 16:59:51', '2019-04-22 16:59:51'),
(9, 1, 125.00, 'cash', 'credit', 'sell', 13, '2019-04-22 16:59:58', '2019-04-22 16:59:58'),
(10, 1, 0.00, 'cash', 'credit', 'sell', 13, '2019-04-22 16:59:58', '2019-04-22 16:59:58'),
(11, 1, 125.00, 'cash', 'credit', 'sell', 14, '2019-04-22 17:00:03', '2019-04-22 17:00:03'),
(12, 1, 0.00, 'cash', 'credit', 'sell', 14, '2019-04-22 17:00:03', '2019-04-22 17:00:03'),
(13, 1, 375.00, 'cash', 'credit', 'sell', 15, '2019-04-22 17:00:11', '2019-04-22 17:00:11'),
(14, 1, 0.00, 'cash', 'credit', 'sell', 15, '2019-04-22 17:00:11', '2019-04-22 17:00:11'),
(15, 1, 125.00, 'cash', 'credit', 'sell', 17, '2019-05-21 16:29:41', '2019-05-21 16:29:41'),
(16, 1, 0.00, 'cash', 'credit', 'sell', 17, '2019-05-21 16:29:41', '2019-05-21 16:29:41'),
(17, 1, 125.00, 'cash', 'credit', 'sell', 18, '2019-05-21 17:35:56', '2019-05-21 17:35:56'),
(18, 1, 0.00, 'cash', 'credit', 'sell', 18, '2019-05-21 17:35:56', '2019-05-21 17:35:56'),
(19, 3, 1.00, 'cash', 'credit', 'initial', NULL, '2019-06-19 01:41:47', '2019-06-19 01:41:47'),
(20, 4, 150.00, 'cash', 'credit', 'initial', NULL, '2019-07-02 19:03:46', '2019-07-02 19:03:46'),
(21, 4, 700.00, 'cash', 'credit', 'sell', 24, '2019-07-02 19:04:47', '2019-07-02 19:04:47'),
(22, 4, 0.00, 'cash', 'credit', 'sell', 24, '2019-07-02 19:04:47', '2019-07-02 19:04:47'),
(23, 5, 0.00, 'cash', 'credit', 'initial', NULL, '2019-07-03 04:50:22', '2019-07-03 04:50:22'),
(24, 1, 5400.00, 'cash', 'credit', 'sell', 26, '2019-08-02 18:21:13', '2019-08-02 18:21:13'),
(25, 1, 0.00, 'cash', 'credit', 'sell', 26, '2019-08-02 18:21:13', '2019-08-02 18:21:13'),
(26, 1, 3000.00, 'cash', 'credit', 'sell', 28, '2019-08-02 18:33:13', '2019-08-02 18:33:13'),
(27, 1, 0.00, 'cash', 'credit', 'sell', 28, '2019-08-02 18:33:13', '2019-08-02 18:33:13'),
(28, 1, 4600.00, 'cash', 'credit', 'sell', 29, '2019-08-02 18:35:06', '2019-08-02 18:35:06'),
(29, 1, 0.00, 'cash', 'credit', 'sell', 29, '2019-08-02 18:35:06', '2019-08-02 18:35:06'),
(30, 1, 3400.00, 'cash', 'credit', 'sell', 32, '2019-08-04 18:33:21', '2019-08-04 18:33:21'),
(31, 1, 0.00, 'cash', 'credit', 'sell', 32, '2019-08-04 18:33:21', '2019-08-04 18:33:21'),
(32, 6, 4000.00, 'cash', 'credit', 'initial', NULL, '2019-08-04 18:37:09', '2019-08-04 18:37:09'),
(33, 7, 9000.00, 'cash', 'credit', 'initial', NULL, '2019-08-04 18:59:01', '2019-08-04 18:59:01'),
(34, 6, 40600.00, 'cash', 'credit', 'sell', 34, '2019-08-06 19:34:20', '2019-08-06 19:34:20'),
(35, 6, 0.00, 'cash', 'credit', 'sell', 34, '2019-08-06 19:34:20', '2019-08-06 19:34:20'),
(36, 8, 3000.00, 'cash', 'credit', 'initial', NULL, '2019-08-06 19:51:27', '2019-08-06 19:51:27'),
(37, 6, 3400.00, 'cash', 'credit', 'sell', 37, '2019-08-06 20:25:52', '2019-08-06 20:25:52'),
(38, 6, 0.00, 'cash', 'credit', 'sell', 37, '2019-08-06 20:25:52', '2019-08-06 20:25:52'),
(39, 6, 10000.00, 'cash', 'credit', 'sell', 39, '2019-08-08 23:23:10', '2019-08-08 23:23:10'),
(40, 6, 0.00, 'cash', 'credit', 'sell', 39, '2019-08-08 23:23:10', '2019-08-08 23:23:10'),
(41, 9, 0.00, 'cash', 'credit', 'initial', NULL, '2019-08-09 13:27:57', '2019-08-09 13:27:57'),
(42, 9, 1.00, 'cash', 'credit', 'sell', 41, '2019-08-09 21:30:31', '2019-08-09 21:30:31'),
(43, 9, 0.00, 'cash', 'credit', 'sell', 41, '2019-08-09 21:30:32', '2019-08-09 21:30:32'),
(44, 9, 1325.61, 'cash', 'credit', 'sell', 42, '2019-08-09 21:31:38', '2019-08-09 21:31:38'),
(45, 9, 0.00, 'cash', 'credit', 'sell', 42, '2019-08-09 21:31:38', '2019-08-09 21:31:38'),
(46, 9, 120.51, 'cash', 'credit', 'sell', 43, '2019-08-09 21:32:28', '2019-08-09 21:32:28'),
(47, 9, 0.00, 'cash', 'credit', 'sell', 43, '2019-08-09 21:32:29', '2019-08-09 21:32:29'),
(48, 9, 160.00, 'cash', 'credit', 'sell', 44, '2019-08-09 21:36:54', '2019-08-09 21:36:54'),
(49, 9, 0.00, 'cash', 'credit', 'sell', 44, '2019-08-09 21:36:55', '2019-08-09 21:36:55'),
(50, 10, 0.00, 'cash', 'credit', 'initial', NULL, '2019-08-10 16:51:34', '2019-08-10 16:51:34'),
(51, 10, 120.51, 'cash', 'credit', 'sell', 47, '2019-08-10 14:55:23', '2019-08-10 14:55:23'),
(52, 10, 0.00, 'cash', 'credit', 'sell', 47, '2019-08-10 14:55:23', '2019-08-10 14:55:23'),
(53, 10, 1325.61, 'cash', 'credit', 'sell', 48, '2019-08-10 14:57:34', '2019-08-10 14:57:34'),
(54, 10, 0.00, 'cash', 'credit', 'sell', 48, '2019-08-10 14:57:34', '2019-08-10 14:57:34'),
(55, 10, 2971.58, 'cash', 'credit', 'sell', 51, '2019-08-12 18:31:25', '2019-08-12 18:31:25'),
(56, 10, 0.00, 'cash', 'credit', 'sell', 51, '2019-08-12 18:31:25', '2019-08-12 18:31:25'),
(57, 10, 120.51, 'cash', 'credit', 'sell', 52, '2019-08-12 18:34:33', '2019-08-12 18:34:33'),
(58, 10, 0.00, 'cash', 'credit', 'sell', 52, '2019-08-12 18:34:33', '2019-08-12 18:34:33'),
(59, 10, 120.51, 'cash', 'credit', 'sell', 53, '2019-08-15 08:07:41', '2019-08-15 08:07:41'),
(60, 10, 0.00, 'cash', 'credit', 'sell', 53, '2019-08-15 08:07:41', '2019-08-15 08:07:41'),
(61, 10, 120.51, 'cash', 'credit', 'sell', 54, '2019-08-15 08:08:08', '2019-08-15 08:08:08'),
(62, 10, 0.00, 'cash', 'credit', 'sell', 54, '2019-08-15 08:08:08', '2019-08-15 08:08:08'),
(63, 10, 120.51, 'cash', 'credit', 'sell', 55, '2019-08-15 08:22:51', '2019-08-15 08:22:51'),
(64, 10, 0.00, 'cash', 'credit', 'sell', 55, '2019-08-15 08:22:51', '2019-08-15 08:22:51'),
(65, 10, 120.51, 'cash', 'credit', 'sell', 56, '2019-08-15 08:31:18', '2019-08-15 08:31:18'),
(66, 10, 0.00, 'cash', 'credit', 'sell', 56, '2019-08-15 08:31:18', '2019-08-15 08:31:18'),
(67, 10, 120.51, 'cash', 'credit', 'sell', 57, '2019-08-15 09:40:36', '2019-08-15 09:40:36'),
(68, 10, 0.00, 'cash', 'credit', 'sell', 57, '2019-08-15 09:40:36', '2019-08-15 09:40:36'),
(69, 10, 241.02, 'cash', 'credit', 'sell', 58, '2019-08-15 10:06:52', '2019-08-15 10:06:52'),
(70, 10, 0.00, 'cash', 'credit', 'sell', 58, '2019-08-15 10:06:52', '2019-08-15 10:06:52'),
(71, 10, 241.02, 'cash', 'credit', 'sell', 59, '2019-08-15 10:07:43', '2019-08-15 10:07:43'),
(72, 10, 0.00, 'cash', 'credit', 'sell', 59, '2019-08-15 10:07:43', '2019-08-15 10:07:43'),
(73, 10, 241.02, 'cash', 'credit', 'sell', 60, '2019-08-15 10:12:00', '2019-08-15 10:12:00'),
(74, 10, 0.00, 'cash', 'credit', 'sell', 60, '2019-08-15 10:12:00', '2019-08-15 10:12:00'),
(75, 10, 120.51, 'cash', 'credit', 'sell', 61, '2019-08-15 10:12:16', '2019-08-15 10:12:16'),
(76, 10, 0.00, 'cash', 'credit', 'sell', 61, '2019-08-15 10:12:16', '2019-08-15 10:12:16'),
(77, 10, 120.51, 'cash', 'credit', 'sell', 62, '2019-08-15 10:12:23', '2019-08-15 10:12:23'),
(78, 10, 0.00, 'cash', 'credit', 'sell', 62, '2019-08-15 10:12:23', '2019-08-15 10:12:23'),
(79, 10, 120.51, 'cash', 'credit', 'sell', 63, '2019-08-15 10:13:24', '2019-08-15 10:13:24'),
(80, 10, 0.00, 'cash', 'credit', 'sell', 63, '2019-08-15 10:13:24', '2019-08-15 10:13:24'),
(81, 10, 120.51, 'cash', 'credit', 'sell', 64, '2019-08-15 10:13:37', '2019-08-15 10:13:37'),
(82, 10, 0.00, 'cash', 'credit', 'sell', 64, '2019-08-15 10:13:37', '2019-08-15 10:13:37'),
(83, 10, 1505.79, 'cash', 'credit', 'sell', 65, '2019-08-15 10:14:13', '2019-08-15 10:14:13'),
(84, 10, 0.00, 'cash', 'credit', 'sell', 65, '2019-08-15 10:14:13', '2019-08-15 10:14:13'),
(85, 10, 1505.79, 'cash', 'credit', 'sell', 66, '2019-08-15 10:21:35', '2019-08-15 10:21:35'),
(86, 10, 0.00, 'cash', 'credit', 'sell', 66, '2019-08-15 10:21:35', '2019-08-15 10:21:35'),
(87, 10, 1505.79, 'cash', 'credit', 'sell', 67, '2019-08-15 10:21:42', '2019-08-15 10:21:42'),
(88, 10, 0.00, 'cash', 'credit', 'sell', 67, '2019-08-15 10:21:42', '2019-08-15 10:21:42'),
(89, 10, 1505.79, 'cash', 'credit', 'sell', 68, '2019-08-15 10:36:23', '2019-08-15 10:36:23'),
(90, 10, 0.00, 'cash', 'credit', 'sell', 68, '2019-08-15 10:36:23', '2019-08-15 10:36:23'),
(91, 10, 1505.79, 'cash', 'credit', 'sell', 69, '2019-08-15 10:36:30', '2019-08-15 10:36:30'),
(92, 10, 0.00, 'cash', 'credit', 'sell', 69, '2019-08-15 10:36:30', '2019-08-15 10:36:30'),
(93, 10, 1505.79, 'cash', 'credit', 'sell', 70, '2019-08-15 10:36:37', '2019-08-15 10:36:37'),
(94, 10, 0.00, 'cash', 'credit', 'sell', 70, '2019-08-15 10:36:37', '2019-08-15 10:36:37'),
(95, 10, 1505.79, 'cash', 'credit', 'sell', 71, '2019-08-15 10:39:10', '2019-08-15 10:39:10'),
(96, 10, 0.00, 'cash', 'credit', 'sell', 71, '2019-08-15 10:39:10', '2019-08-15 10:39:10'),
(97, 10, 3011.58, 'cash', 'credit', 'sell', 72, '2019-08-15 10:57:42', '2019-08-15 10:57:42'),
(98, 10, 0.00, 'cash', 'credit', 'sell', 72, '2019-08-15 10:57:42', '2019-08-15 10:57:42'),
(99, 10, 120.51, 'cash', 'credit', 'sell', 73, '2019-08-15 11:13:18', '2019-08-15 11:13:18'),
(100, 10, 0.00, 'cash', 'credit', 'sell', 73, '2019-08-15 11:13:18', '2019-08-15 11:13:18'),
(101, 10, 1400.00, 'cash', 'credit', 'sell', 74, '2019-08-16 18:01:01', '2019-08-16 18:01:01'),
(102, 10, 0.00, 'cash', 'credit', 'sell', 74, '2019-08-16 18:01:01', '2019-08-16 18:01:01'),
(103, 10, 800.00, 'cash', 'credit', 'sell', 75, '2019-08-18 10:07:22', '2019-08-18 10:07:22'),
(104, 10, 0.00, 'cash', 'credit', 'sell', 75, '2019-08-18 10:07:22', '2019-08-18 10:07:22'),
(105, 10, 600.00, 'cash', 'credit', 'sell', 76, '2019-08-18 10:08:46', '2019-08-18 10:08:46'),
(106, 10, 0.00, 'cash', 'credit', 'sell', 76, '2019-08-18 10:08:46', '2019-08-18 10:08:46'),
(107, 10, 1022.10, 'cash', 'credit', 'sell', 82, '2019-08-21 09:34:12', '2019-08-21 09:34:12'),
(108, 10, 0.00, 'cash', 'credit', 'sell', 82, '2019-08-21 09:34:12', '2019-08-21 09:34:12'),
(109, 10, 1006.10, 'cash', 'credit', 'sell', 83, '2019-08-21 09:43:50', '2019-08-21 09:43:50'),
(110, 10, 0.00, 'cash', 'credit', 'sell', 83, '2019-08-21 09:43:50', '2019-08-21 09:43:50'),
(111, 10, 1006.10, 'cash', 'credit', 'sell', 84, '2019-08-21 09:47:10', '2019-08-21 09:47:10'),
(112, 10, 0.00, 'cash', 'credit', 'sell', 84, '2019-08-21 09:47:10', '2019-08-21 09:47:10'),
(113, 10, 1006.10, 'cash', 'credit', 'sell', 85, '2019-08-21 11:13:46', '2019-08-21 11:13:46'),
(114, 10, 0.00, 'cash', 'credit', 'sell', 85, '2019-08-21 11:13:46', '2019-08-21 11:13:46'),
(115, 10, 892.76, 'cash', 'credit', 'sell', 87, '2019-08-21 12:42:38', '2019-08-21 12:42:38'),
(116, 10, 0.00, 'cash', 'credit', 'sell', 87, '2019-08-21 12:42:38', '2019-08-21 12:42:38'),
(117, 10, 2318.24, 'cash', 'credit', 'sell', 90, '2019-08-21 13:37:19', '2019-08-21 13:37:19'),
(118, 10, 0.00, 'cash', 'credit', 'sell', 90, '2019-08-21 13:37:19', '2019-08-21 13:37:19'),
(119, 10, 1199.12, 'cash', 'credit', 'sell', 91, '2019-08-21 14:04:35', '2019-08-21 14:04:35'),
(120, 10, 0.00, 'cash', 'credit', 'sell', 91, '2019-08-21 14:04:35', '2019-08-21 14:04:35'),
(121, 10, 1199.12, 'cash', 'credit', 'sell', 92, '2019-08-21 14:06:55', '2019-08-21 14:06:55'),
(122, 10, 0.00, 'cash', 'credit', 'sell', 92, '2019-08-21 14:06:55', '2019-08-21 14:06:55'),
(123, 10, 0.00, '', 'credit', 'sell', 93, '2019-08-25 07:29:07', '2019-08-25 07:29:07'),
(124, 10, 0.00, 'cash', 'credit', 'sell', 93, '2019-08-25 07:29:07', '2019-08-25 07:29:07'),
(125, 10, 1032.76, 'cash', 'credit', 'sell', 95, '2019-08-25 09:28:38', '2019-08-25 09:28:38'),
(126, 10, 0.00, 'cash', 'credit', 'sell', 95, '2019-08-25 09:28:38', '2019-08-25 09:28:38'),
(127, 10, 0.00, '', 'credit', 'sell', 96, '2019-08-25 09:32:09', '2019-08-25 09:32:09'),
(128, 10, 0.00, 'cash', 'credit', 'sell', 96, '2019-08-25 09:32:09', '2019-08-25 09:32:09'),
(129, 10, 547.04, 'cash', 'credit', 'sell', 98, '2019-08-25 09:46:37', '2019-08-25 09:46:37'),
(130, 10, 0.00, 'cash', 'credit', 'sell', 98, '2019-08-25 09:46:37', '2019-08-25 09:46:37'),
(131, 10, 526.38, 'cash', 'credit', 'sell', 112, '2019-08-25 12:20:27', '2019-08-25 12:20:27'),
(132, 10, 0.00, 'cash', 'credit', 'sell', 112, '2019-08-25 12:20:27', '2019-08-25 12:20:27'),
(133, 10, 73.00, 'cash', 'credit', 'sell', 115, '2019-08-31 20:13:22', '2019-08-31 20:13:22'),
(134, 10, 0.00, 'cash', 'credit', 'sell', 115, '2019-08-31 20:13:22', '2019-08-31 20:13:22'),
(135, 10, 1156.10, 'cash', 'credit', 'sell', 116, '2019-08-31 20:42:14', '2019-08-31 20:42:14'),
(136, 10, 0.00, 'cash', 'credit', 'sell', 116, '2019-08-31 20:42:14', '2019-08-31 20:42:14'),
(137, 10, 4.00, 'cash', 'credit', 'sell', 116, '2019-08-31 20:54:54', '2019-08-31 20:54:54'),
(138, 10, 15.00, 'cash', 'debit', 'refund', 115, '2019-09-01 05:29:37', '2019-09-01 05:29:37'),
(139, 10, 7.50, 'cash', 'credit', 'sell', 115, '2019-09-01 05:30:32', '2019-09-01 05:30:32'),
(140, 10, 15.00, 'cash', 'debit', 'refund', 115, '2019-09-01 05:35:36', '2019-09-01 05:35:36'),
(141, 10, 35.50, 'cash', 'credit', 'sell', 115, '2019-09-01 05:56:11', '2019-09-01 05:56:11'),
(142, 10, 30.00, 'cash', 'credit', 'sell', 115, '2019-09-01 06:02:53', '2019-09-01 06:02:53'),
(143, 10, 30.00, 'cash', 'credit', 'sell', 115, '2019-09-01 07:18:46', '2019-09-01 07:18:46'),
(144, 10, 30.00, 'cash', 'debit', 'refund', 115, '2019-09-01 07:20:00', '2019-09-01 07:20:00'),
(145, 10, 15.00, 'cash', 'debit', 'refund', 115, '2019-09-01 07:32:01', '2019-09-01 07:32:01'),
(146, 10, 4.00, 'cash', 'debit', 'refund', 116, '2019-09-01 07:43:24', '2019-09-01 07:43:24'),
(147, 10, 15.00, 'cash', 'debit', 'refund', 115, '2019-09-01 08:47:01', '2019-09-01 08:47:01'),
(148, 10, 103.00, 'cash', 'credit', 'sell', 117, '2019-09-01 09:07:16', '2019-09-01 09:07:16'),
(149, 10, 0.00, 'cash', 'credit', 'sell', 117, '2019-09-01 09:07:16', '2019-09-01 09:07:16'),
(150, 10, 86.00, 'cash', 'credit', 'sell', 115, '2019-09-01 09:42:13', '2019-09-01 09:42:13'),
(151, 10, 309.00, 'cash', 'credit', 'sell', 118, '2019-09-01 09:42:56', '2019-09-01 09:42:56'),
(152, 10, 0.00, 'cash', 'credit', 'sell', 118, '2019-09-01 09:42:56', '2019-09-01 09:42:56'),
(153, 10, 1022.10, 'cash', 'credit', 'sell', 118, '2019-09-01 09:43:37', '2019-09-01 09:43:37'),
(154, 10, 90.00, 'cash', 'debit', 'refund', 118, '2019-09-01 09:44:31', '2019-09-01 09:44:31'),
(155, 10, 982.98, 'cash', 'credit', 'sell', 120, '2019-09-01 11:52:53', '2019-09-01 11:52:53'),
(156, 10, 0.00, 'cash', 'credit', 'sell', 120, '2019-09-01 11:52:54', '2019-09-01 11:52:54'),
(157, 10, 537.68, 'cash', 'credit', 'sell', 121, '2019-09-01 12:03:35', '2019-09-01 12:03:35'),
(158, 10, 0.00, 'cash', 'credit', 'sell', 121, '2019-09-01 12:03:35', '2019-09-01 12:03:35'),
(159, 10, 477.68, 'cash', 'credit', 'sell', 122, '2019-09-01 13:44:50', '2019-09-01 13:44:50'),
(160, 10, 0.00, 'cash', 'credit', 'sell', 122, '2019-09-01 13:44:50', '2019-09-01 13:44:50'),
(161, 10, 517.68, 'cash', 'credit', 'sell', 123, '2019-09-01 13:53:59', '2019-09-01 13:53:59'),
(162, 10, 0.00, 'cash', 'credit', 'sell', 123, '2019-09-01 13:53:59', '2019-09-01 13:53:59'),
(163, 10, 10.00, 'cash', 'debit', 'refund', 122, '2019-09-01 13:55:32', '2019-09-01 13:55:32'),
(164, 10, 1448.41, 'cash', 'credit', 'sell', 124, '2019-09-01 16:50:30', '2019-09-01 16:50:30'),
(165, 10, 0.00, 'cash', 'credit', 'sell', 124, '2019-09-01 16:50:30', '2019-09-01 16:50:30'),
(166, 10, 477.68, 'cash', 'credit', 'sell', 125, '2019-09-01 19:15:36', '2019-09-01 19:15:36'),
(167, 10, 0.00, 'cash', 'credit', 'sell', 125, '2019-09-01 19:15:36', '2019-09-01 19:15:36'),
(168, 10, 537.68, 'cash', 'credit', 'sell', 126, '2019-09-01 19:28:13', '2019-09-01 19:28:13'),
(169, 10, 0.00, 'cash', 'credit', 'sell', 126, '2019-09-01 19:28:13', '2019-09-01 19:28:13'),
(170, 10, 537.68, 'cash', 'credit', 'sell', 127, '2019-09-01 19:40:19', '2019-09-01 19:40:19'),
(171, 10, 0.00, 'cash', 'credit', 'sell', 127, '2019-09-01 19:40:19', '2019-09-01 19:40:19'),
(172, 10, 103.00, 'cash', 'credit', 'sell', 128, '2019-09-01 20:17:22', '2019-09-01 20:17:22'),
(173, 10, 0.00, 'cash', 'credit', 'sell', 128, '2019-09-01 20:17:22', '2019-09-01 20:17:22'),
(174, 10, 13.00, 'cash', 'credit', 'sell', 129, '2019-09-02 19:15:47', '2019-09-02 19:15:47'),
(175, 10, 0.00, 'cash', 'credit', 'sell', 129, '2019-09-02 19:15:47', '2019-09-02 19:15:47');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `short_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `business_id`, `short_code`, `parent_id`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Accessories', 1, 'Accessories', 0, 1, NULL, '2019-01-23 18:02:38', '2019-01-23 18:02:38'),
(2, 'Athletic Clothing', 1, 'Athletic Clothing', 1, 1, NULL, '2019-01-23 18:03:11', '2019-01-23 18:03:11'),
(3, 'Autobiography', 1, 'Autobiography', 1, 1, NULL, '2019-01-23 18:03:29', '2019-01-23 18:03:29'),
(4, 'Belts', 1, 'Belts', 1, 1, NULL, '2019-01-23 18:03:43', '2019-01-23 18:03:43'),
(5, 'Books', 1, 'Books', 0, 1, NULL, '2019-01-23 18:03:56', '2019-01-23 18:03:56'),
(6, 'Electronics', 1, 'Electronics', 0, 1, NULL, '2019-01-23 18:04:25', '2019-01-23 18:04:25'),
(7, 'Cell Phones', 1, 'Cell Phones', 6, 1, NULL, '2019-01-23 18:04:43', '2019-01-23 18:04:43'),
(8, 'Children\'s books', 1, 'Children\'s books', 5, 1, NULL, '2019-01-23 18:05:01', '2019-01-23 18:05:01'),
(9, 'Computers', 1, 'Computers', 6, 1, NULL, '2019-01-23 18:05:23', '2019-01-23 18:05:23'),
(10, 'Food & Grocery', 1, 'Food & Grocery', 0, 1, NULL, '2019-01-23 18:06:15', '2019-01-23 18:06:15'),
(11, 'Men\'s', 1, 'Men\'s', 0, 1, NULL, '2019-01-23 18:06:30', '2019-01-23 18:06:30'),
(12, 'Sports', 1, 'Sports', 0, 1, NULL, '2019-01-23 18:06:47', '2019-01-23 18:06:47'),
(13, 'Women\'s', 1, 'Women\'s', 0, 1, NULL, '2019-01-23 18:07:00', '2019-01-23 18:07:00'),
(14, 'Wallets', 1, 'Wallets', 13, 1, NULL, '2019-01-23 18:07:22', '2019-01-23 18:07:22'),
(15, 'Shoes', 1, 'Shoes', 13, 1, NULL, '2019-01-23 18:07:40', '2019-01-23 18:07:40'),
(16, 'Shirts', 1, 'Shirts', 13, 1, NULL, '2019-01-23 18:07:56', '2019-01-23 18:07:56'),
(17, 'Sandal', 1, 'Sandal', 13, 1, NULL, '2019-01-23 18:08:12', '2019-01-23 18:08:12'),
(18, 'Jeans', 1, 'Jeans', 11, 1, NULL, '2019-01-23 18:08:28', '2019-01-23 18:08:28'),
(19, 'Exercise & Fitness', 1, 'Exercise & Fitness', 10, 1, NULL, '2019-01-23 18:08:50', '2019-01-23 18:08:50'),
(20, 'Bras', 1, 'b1', 0, 1, NULL, '2019-03-20 07:44:43', '2019-03-20 07:44:43'),
(21, 'Air Bra', 1, 'b1-1', 20, 1, NULL, '2019-03-20 07:45:16', '2019-03-20 07:45:16'),
(22, 'Car', 1, 'ca1', 0, 1, NULL, '2019-05-31 00:34:29', '2019-05-31 00:34:29');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `type` enum('supplier','customer','both') COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_business_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landmark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `landline` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_term_number` int(11) DEFAULT NULL,
  `pay_term_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit_limit` decimal(20,2) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `customer_group_id` int(11) DEFAULT NULL,
  `custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `business_id`, `type`, `supplier_business_name`, `name`, `email`, `contact_id`, `tax_number`, `city`, `state`, `country`, `landmark`, `mobile`, `landline`, `alternate_number`, `pay_term_number`, `pay_term_type`, `credit_limit`, `created_by`, `is_default`, `customer_group_id`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'customer', NULL, 'Walk-In Customer', NULL, 'CO0001', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-23 17:59:41', '2019-01-23 17:59:41'),
(2, 1, 'supplier', 'ABC', 'TEST', NULL, 'CO0002', NULL, NULL, NULL, NULL, NULL, '03004141412', NULL, NULL, NULL, NULL, NULL, 6, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-12 19:05:50', '2019-07-12 19:05:50'),
(3, 1, 'customer', NULL, 'shahzad', 'superadmin@gmail.com', '1000', '8889990', 'Rawalpindi', NULL, 'Pakistan', NULL, '033345430900', NULL, '08999999', NULL, 'days', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-02 18:34:32', '2019-08-02 18:34:32'),
(4, 1, 'customer', NULL, 'Awais Maqsood', 'awaismaqsood91@yahoo.com', '33100-6201767-3', '123', NULL, NULL, NULL, NULL, '03245753641', NULL, NULL, 1, 'days', NULL, 1, 0, NULL, '11111', '112233', '66666', '55555', NULL, '2019-08-02 22:12:37', '2019-08-04 02:03:02'),
(5, 1, 'supplier', 'Al Jannat Traders', 'Sufi Ghee 5 KG TIin', NULL, '9999', NULL, NULL, NULL, NULL, NULL, '03439477556', NULL, NULL, 3, 'days', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-06 18:23:54', '2019-08-06 18:23:54'),
(6, 1, 'supplier', 'Sufi', 'Hamza Vegetable', NULL, 'CO0006', NULL, NULL, NULL, NULL, NULL, '03341529845', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-06 19:26:41', '2019-08-06 19:26:41'),
(7, 1, 'customer', NULL, 'Ali', 'waleed@test.coms', '123123', NULL, NULL, NULL, NULL, NULL, '03435551441', '321534215', '035412341', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-11 09:29:45', '2019-08-11 09:29:45'),
(8, 1, 'customer', NULL, 'Raju', NULL, '1111', NULL, NULL, NULL, NULL, NULL, '0212544154', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '5465465465464', '21545', 'House # Z-1115, Dhok Ratta', NULL, NULL, '2019-08-19 15:08:30', '2019-08-19 15:46:21');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thousand_separator` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_separator` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `country`, `currency`, `code`, `symbol`, `thousand_separator`, `decimal_separator`, `created_at`, `updated_at`) VALUES
(1, 'Albania', 'Leke', 'ALL', 'Lek', ',', '.', NULL, NULL),
(2, 'America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(3, 'Afghanistan', 'Afghanis', 'AF', '؋', ',', '.', NULL, NULL),
(4, 'Argentina', 'Pesos', 'ARS', '$', ',', '.', NULL, NULL),
(5, 'Aruba', 'Guilders', 'AWG', 'ƒ', ',', '.', NULL, NULL),
(6, 'Australia', 'Dollars', 'AUD', '$', ',', '.', NULL, NULL),
(7, 'Azerbaijan', 'New Manats', 'AZ', 'ман', ',', '.', NULL, NULL),
(8, 'Bahamas', 'Dollars', 'BSD', '$', ',', '.', NULL, NULL),
(9, 'Barbados', 'Dollars', 'BBD', '$', ',', '.', NULL, NULL),
(10, 'Belarus', 'Rubles', 'BYR', 'p.', ',', '.', NULL, NULL),
(11, 'Belgium', 'Euro', 'EUR', '€', ',', '.', NULL, NULL),
(12, 'Beliz', 'Dollars', 'BZD', 'BZ$', ',', '.', NULL, NULL),
(13, 'Bermuda', 'Dollars', 'BMD', '$', ',', '.', NULL, NULL),
(14, 'Bolivia', 'Bolivianos', 'BOB', '$b', ',', '.', NULL, NULL),
(15, 'Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM', ',', '.', NULL, NULL),
(16, 'Botswana', 'Pula\'s', 'BWP', 'P', ',', '.', NULL, NULL),
(17, 'Bulgaria', 'Leva', 'BG', 'лв', ',', '.', NULL, NULL),
(18, 'Brazil', 'Reais', 'BRL', 'R$', ',', '.', NULL, NULL),
(19, 'Britain [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(20, 'Brunei Darussalam', 'Dollars', 'BND', '$', ',', '.', NULL, NULL),
(21, 'Cambodia', 'Riels', 'KHR', '៛', ',', '.', NULL, NULL),
(22, 'Canada', 'Dollars', 'CAD', '$', ',', '.', NULL, NULL),
(23, 'Cayman Islands', 'Dollars', 'KYD', '$', ',', '.', NULL, NULL),
(24, 'Chile', 'Pesos', 'CLP', '$', ',', '.', NULL, NULL),
(25, 'China', 'Yuan Renminbi', 'CNY', '¥', ',', '.', NULL, NULL),
(26, 'Colombia', 'Pesos', 'COP', '$', ',', '.', NULL, NULL),
(27, 'Costa Rica', 'Colón', 'CRC', '₡', ',', '.', NULL, NULL),
(28, 'Croatia', 'Kuna', 'HRK', 'kn', ',', '.', NULL, NULL),
(29, 'Cuba', 'Pesos', 'CUP', '₱', ',', '.', NULL, NULL),
(30, 'Cyprus', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(31, 'Czech Republic', 'Koruny', 'CZK', 'Kč', ',', '.', NULL, NULL),
(32, 'Denmark', 'Kroner', 'DKK', 'kr', ',', '.', NULL, NULL),
(33, 'Dominican Republic', 'Pesos', 'DOP ', 'RD$', ',', '.', NULL, NULL),
(34, 'East Caribbean', 'Dollars', 'XCD', '$', ',', '.', NULL, NULL),
(35, 'Egypt', 'Pounds', 'EGP', '£', ',', '.', NULL, NULL),
(36, 'El Salvador', 'Colones', 'SVC', '$', ',', '.', NULL, NULL),
(37, 'England [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(38, 'Euro', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(39, 'Falkland Islands', 'Pounds', 'FKP', '£', ',', '.', NULL, NULL),
(40, 'Fiji', 'Dollars', 'FJD', '$', ',', '.', NULL, NULL),
(41, 'France', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(42, 'Ghana', 'Cedis', 'GHC', '¢', ',', '.', NULL, NULL),
(43, 'Gibraltar', 'Pounds', 'GIP', '£', ',', '.', NULL, NULL),
(44, 'Greece', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(45, 'Guatemala', 'Quetzales', 'GTQ', 'Q', ',', '.', NULL, NULL),
(46, 'Guernsey', 'Pounds', 'GGP', '£', ',', '.', NULL, NULL),
(47, 'Guyana', 'Dollars', 'GYD', '$', ',', '.', NULL, NULL),
(48, 'Holland [Netherlands]', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(49, 'Honduras', 'Lempiras', 'HNL', 'L', ',', '.', NULL, NULL),
(50, 'Hong Kong', 'Dollars', 'HKD', '$', ',', '.', NULL, NULL),
(51, 'Hungary', 'Forint', 'HUF', 'Ft', ',', '.', NULL, NULL),
(52, 'Iceland', 'Kronur', 'ISK', 'kr', ',', '.', NULL, NULL),
(53, 'India', 'Rupees', 'INR', '₹', ',', '.', NULL, NULL),
(54, 'Indonesia', 'Rupiahs', 'IDR', 'Rp', ',', '.', NULL, NULL),
(55, 'Iran', 'Rials', 'IRR', '﷼', ',', '.', NULL, NULL),
(56, 'Ireland', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(57, 'Isle of Man', 'Pounds', 'IMP', '£', ',', '.', NULL, NULL),
(58, 'Israel', 'New Shekels', 'ILS', '₪', ',', '.', NULL, NULL),
(59, 'Italy', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(60, 'Jamaica', 'Dollars', 'JMD', 'J$', ',', '.', NULL, NULL),
(61, 'Japan', 'Yen', 'JPY', '¥', ',', '.', NULL, NULL),
(62, 'Jersey', 'Pounds', 'JEP', '£', ',', '.', NULL, NULL),
(63, 'Kazakhstan', 'Tenge', 'KZT', 'лв', ',', '.', NULL, NULL),
(64, 'Korea [North]', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(65, 'Korea [South]', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(66, 'Kyrgyzstan', 'Soms', 'KGS', 'лв', ',', '.', NULL, NULL),
(67, 'Laos', 'Kips', 'LAK', '₭', ',', '.', NULL, NULL),
(68, 'Latvia', 'Lati', 'LVL', 'Ls', ',', '.', NULL, NULL),
(69, 'Lebanon', 'Pounds', 'LBP', '£', ',', '.', NULL, NULL),
(70, 'Liberia', 'Dollars', 'LRD', '$', ',', '.', NULL, NULL),
(71, 'Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(72, 'Lithuania', 'Litai', 'LTL', 'Lt', ',', '.', NULL, NULL),
(73, 'Luxembourg', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(74, 'Macedonia', 'Denars', 'MKD', 'ден', ',', '.', NULL, NULL),
(75, 'Malaysia', 'Ringgits', 'MYR', 'RM', ',', '.', NULL, NULL),
(76, 'Malta', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(77, 'Mauritius', 'Rupees', 'MUR', '₨', ',', '.', NULL, NULL),
(78, 'Mexico', 'Pesos', 'MX', '$', ',', '.', NULL, NULL),
(79, 'Mongolia', 'Tugriks', 'MNT', '₮', ',', '.', NULL, NULL),
(80, 'Mozambique', 'Meticais', 'MZ', 'MT', ',', '.', NULL, NULL),
(81, 'Namibia', 'Dollars', 'NAD', '$', ',', '.', NULL, NULL),
(82, 'Nepal', 'Rupees', 'NPR', '₨', ',', '.', NULL, NULL),
(83, 'Netherlands Antilles', 'Guilders', 'ANG', 'ƒ', ',', '.', NULL, NULL),
(84, 'Netherlands', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(85, 'New Zealand', 'Dollars', 'NZD', '$', ',', '.', NULL, NULL),
(86, 'Nicaragua', 'Cordobas', 'NIO', 'C$', ',', '.', NULL, NULL),
(87, 'Nigeria', 'Nairas', 'NG', '₦', ',', '.', NULL, NULL),
(88, 'North Korea', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(89, 'Norway', 'Krone', 'NOK', 'kr', ',', '.', NULL, NULL),
(90, 'Oman', 'Rials', 'OMR', '﷼', ',', '.', NULL, NULL),
(91, 'Pakistan', 'Rupees', 'PKR', '₨', ',', '.', NULL, NULL),
(92, 'Panama', 'Balboa', 'PAB', 'B/.', ',', '.', NULL, NULL),
(93, 'Paraguay', 'Guarani', 'PYG', 'Gs', ',', '.', NULL, NULL),
(94, 'Peru', 'Nuevos Soles', 'PE', 'S/.', ',', '.', NULL, NULL),
(95, 'Philippines', 'Pesos', 'PHP', 'Php', ',', '.', NULL, NULL),
(96, 'Poland', 'Zlotych', 'PL', 'zł', ',', '.', NULL, NULL),
(97, 'Qatar', 'Rials', 'QAR', '﷼', ',', '.', NULL, NULL),
(98, 'Romania', 'New Lei', 'RO', 'lei', ',', '.', NULL, NULL),
(99, 'Russia', 'Rubles', 'RUB', 'руб', ',', '.', NULL, NULL),
(100, 'Saint Helena', 'Pounds', 'SHP', '£', ',', '.', NULL, NULL),
(101, 'Saudi Arabia', 'Riyals', 'SAR', '﷼', ',', '.', NULL, NULL),
(102, 'Serbia', 'Dinars', 'RSD', 'Дин.', ',', '.', NULL, NULL),
(103, 'Seychelles', 'Rupees', 'SCR', '₨', ',', '.', NULL, NULL),
(104, 'Singapore', 'Dollars', 'SGD', '$', ',', '.', NULL, NULL),
(105, 'Slovenia', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(106, 'Solomon Islands', 'Dollars', 'SBD', '$', ',', '.', NULL, NULL),
(107, 'Somalia', 'Shillings', 'SOS', 'S', ',', '.', NULL, NULL),
(108, 'South Africa', 'Rand', 'ZAR', 'R', ',', '.', NULL, NULL),
(109, 'South Korea', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(110, 'Spain', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(111, 'Sri Lanka', 'Rupees', 'LKR', '₨', ',', '.', NULL, NULL),
(112, 'Sweden', 'Kronor', 'SEK', 'kr', ',', '.', NULL, NULL),
(113, 'Switzerland', 'Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(114, 'Suriname', 'Dollars', 'SRD', '$', ',', '.', NULL, NULL),
(115, 'Syria', 'Pounds', 'SYP', '£', ',', '.', NULL, NULL),
(116, 'Taiwan', 'New Dollars', 'TWD', 'NT$', ',', '.', NULL, NULL),
(117, 'Thailand', 'Baht', 'THB', '฿', ',', '.', NULL, NULL),
(118, 'Trinidad and Tobago', 'Dollars', 'TTD', 'TT$', ',', '.', NULL, NULL),
(119, 'Turkey', 'Lira', 'TRY', 'TL', ',', '.', NULL, NULL),
(120, 'Turkey', 'Liras', 'TRL', '£', ',', '.', NULL, NULL),
(121, 'Tuvalu', 'Dollars', 'TVD', '$', ',', '.', NULL, NULL),
(122, 'Ukraine', 'Hryvnia', 'UAH', '₴', ',', '.', NULL, NULL),
(123, 'United Kingdom', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(124, 'United States of America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(125, 'Uruguay', 'Pesos', 'UYU', '$U', ',', '.', NULL, NULL),
(126, 'Uzbekistan', 'Sums', 'UZS', 'лв', ',', '.', NULL, NULL),
(127, 'Vatican City', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(128, 'Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs', ',', '.', NULL, NULL),
(129, 'Vietnam', 'Dong', 'VND', '₫', ',', '.', NULL, NULL),
(130, 'Yemen', 'Rials', 'YER', '﷼', ',', '.', NULL, NULL),
(131, 'Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$', ',', '.', NULL, NULL),
(132, 'Iraq', 'Iraqi dinar', 'IQD', 'د.ع', ',', '.', NULL, NULL),
(133, 'Kenya', 'Kenyan shilling', 'KES', 'KSh', ',', '.', NULL, NULL),
(134, 'Bangladesh', 'Taka', 'BDT', '৳', ',', '.', NULL, NULL),
(135, 'Algerie', 'Algerian dinar', 'DZD', 'د.ج', ' ', '.', NULL, NULL),
(136, 'United Arab Emirates', 'United Arab Emirates dirham', 'AED', 'د.إ', ',', '.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(5,2) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_groups`
--

INSERT INTO `customer_groups` (`id`, `business_id`, `name`, `amount`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'Special', 5.00, 1, '2019-08-04 18:02:30', '2019-08-04 18:02:30');

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `name`, `business_id`, `code`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'rent', 1, 'r1', NULL, '2019-04-22 17:06:56', '2019-04-22 17:06:56'),
(2, 'salary', 1, 's1', NULL, '2019-05-31 00:57:55', '2019-05-31 00:57:55');

-- --------------------------------------------------------

--
-- Table structure for table `group_sub_taxes`
--

CREATE TABLE `group_sub_taxes` (
  `group_tax_id` int(10) UNSIGNED NOT NULL,
  `tax_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_layouts`
--

CREATE TABLE `invoice_layouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_no_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_no_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading_not_paid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading_paid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_due_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_client_id` tinyint(1) NOT NULL DEFAULT 0,
  `client_id_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_tax_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_time` tinyint(1) NOT NULL DEFAULT 1,
  `show_brand` tinyint(1) NOT NULL DEFAULT 0,
  `show_sku` tinyint(1) NOT NULL DEFAULT 1,
  `show_cat_code` tinyint(1) NOT NULL DEFAULT 1,
  `show_expiry` tinyint(1) NOT NULL DEFAULT 0,
  `show_lot` tinyint(1) NOT NULL DEFAULT 0,
  `show_sale_description` tinyint(1) NOT NULL DEFAULT 0,
  `sales_person_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_sales_person` tinyint(1) NOT NULL DEFAULT 0,
  `table_product_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_qty_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_unit_price_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_subtotal_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_code_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_logo` tinyint(1) NOT NULL DEFAULT 0,
  `show_business_name` tinyint(1) NOT NULL DEFAULT 0,
  `show_location_name` tinyint(1) NOT NULL DEFAULT 1,
  `show_landmark` tinyint(1) NOT NULL DEFAULT 1,
  `show_city` tinyint(1) NOT NULL DEFAULT 1,
  `show_state` tinyint(1) NOT NULL DEFAULT 1,
  `show_zip_code` tinyint(1) NOT NULL DEFAULT 1,
  `show_country` tinyint(1) NOT NULL DEFAULT 1,
  `show_mobile_number` tinyint(1) NOT NULL DEFAULT 1,
  `show_alternate_number` tinyint(1) NOT NULL DEFAULT 0,
  `show_email` tinyint(1) NOT NULL DEFAULT 0,
  `show_tax_1` tinyint(1) NOT NULL DEFAULT 1,
  `show_tax_2` tinyint(1) NOT NULL DEFAULT 0,
  `show_barcode` tinyint(1) NOT NULL DEFAULT 0,
  `show_payments` tinyint(1) NOT NULL DEFAULT 0,
  `show_customer` tinyint(1) NOT NULL DEFAULT 0,
  `customer_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `highlight_color` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_info` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `business_id` int(10) UNSIGNED NOT NULL,
  `design` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT 'classic',
  `cn_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'cn = credit note',
  `cn_no_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cn_amount_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_tax_headings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `table_unit_price_tax_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_subtotal_label_tax` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_to` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_ato` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_layouts`
--

INSERT INTO `invoice_layouts` (`id`, `name`, `header_text`, `invoice_no_prefix`, `quotation_no_prefix`, `invoice_heading`, `sub_heading_line1`, `sub_heading_line2`, `sub_heading_line3`, `sub_heading_line4`, `sub_heading_line5`, `invoice_heading_not_paid`, `invoice_heading_paid`, `quotation_heading`, `sub_total_label`, `discount_label`, `tax_label`, `total_label`, `total_due_label`, `paid_label`, `show_client_id`, `client_id_label`, `client_tax_label`, `date_label`, `show_time`, `show_brand`, `show_sku`, `show_cat_code`, `show_expiry`, `show_lot`, `show_sale_description`, `sales_person_label`, `show_sales_person`, `table_product_label`, `table_qty_label`, `table_unit_price_label`, `table_subtotal_label`, `cat_code_label`, `logo`, `show_logo`, `show_business_name`, `show_location_name`, `show_landmark`, `show_city`, `show_state`, `show_zip_code`, `show_country`, `show_mobile_number`, `show_alternate_number`, `show_email`, `show_tax_1`, `show_tax_2`, `show_barcode`, `show_payments`, `show_customer`, `customer_label`, `highlight_color`, `footer_text`, `module_info`, `is_default`, `business_id`, `design`, `cn_heading`, `cn_no_label`, `cn_amount_label`, `table_tax_headings`, `created_at`, `updated_at`, `table_unit_price_tax_label`, `table_subtotal_label_tax`, `product_to`, `product_ato`) VALUES
(1, 'Default', NULL, 'Invoice No.', NULL, 'Invoice', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Subtotal', 'Discount', 'FED Amount', 'Total', 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', 1, 0, 1, 1, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price Excl FED', 'Subtotal Excl FED', NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 'Customer', '#000000', NULL, NULL, 1, 1, 'classic', NULL, NULL, NULL, NULL, '2019-01-23 17:59:41', '2019-08-15 10:34:43', 'Unit Price Incl FED', 'Subtotal Incl FED', 'TO', 'ATO');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_schemes`
--

CREATE TABLE `invoice_schemes` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheme_type` enum('blank','year') COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_number` int(11) DEFAULT NULL,
  `invoice_count` int(11) NOT NULL DEFAULT 0,
  `total_digits` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_schemes`
--

INSERT INTO `invoice_schemes` (`id`, `business_id`, `name`, `scheme_type`, `prefix`, `start_number`, `invoice_count`, `total_digits`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 'Default', 'blank', '', 1, 77, 4, 1, '2019-01-23 17:59:41', '2019-09-02 19:15:47'),
(2, 1, 'test', 'blank', NULL, 0, 0, 4, 0, '2019-08-15 10:23:03', '2019-08-15 10:35:59');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_07_05_071953_create_currencies_table', 1),
(4, '2017_07_05_073658_create_business_table', 1),
(5, '2017_07_22_075923_add_business_id_users_table', 1),
(6, '2017_07_23_113209_create_brands_table', 1),
(7, '2017_07_26_083429_create_permission_tables', 1),
(8, '2017_07_26_110000_create_tax_rates_table', 1),
(9, '2017_07_26_122313_create_units_table', 1),
(10, '2017_07_27_075706_create_contacts_table', 1),
(11, '2017_08_04_071038_create_categories_table', 1),
(12, '2017_08_08_115903_create_products_table', 1),
(13, '2017_08_09_061616_create_variation_templates_table', 1),
(14, '2017_08_09_061638_create_variation_value_templates_table', 1),
(15, '2017_08_10_061146_create_product_variations_table', 1),
(16, '2017_08_10_061216_create_variations_table', 1),
(17, '2017_08_19_054827_create_transactions_table', 1),
(18, '2017_08_31_073533_create_purchase_lines_table', 1),
(19, '2017_10_15_064638_create_transaction_payments_table', 1),
(20, '2017_10_31_065621_add_default_sales_tax_to_business_table', 1),
(21, '2017_11_20_051930_create_table_group_sub_taxes', 1),
(22, '2017_11_20_063603_create_transaction_sell_lines', 1),
(23, '2017_11_21_064540_create_barcodes_table', 1),
(24, '2017_11_23_181237_create_invoice_schemes_table', 1),
(25, '2017_12_25_122822_create_business_locations_table', 1),
(26, '2017_12_25_160253_add_location_id_to_transactions_table', 1),
(27, '2017_12_25_163227_create_variation_location_details_table', 1),
(28, '2018_01_04_115627_create_sessions_table', 1),
(29, '2018_01_05_112817_create_invoice_layouts_table', 1),
(30, '2018_01_06_112303_add_invoice_scheme_id_and_invoice_layout_id_to_business_locations', 1),
(31, '2018_01_08_104124_create_expense_categories_table', 1),
(32, '2018_01_08_123327_modify_transactions_table_for_expenses', 1),
(33, '2018_01_09_111005_modify_payment_status_in_transactions_table', 1),
(34, '2018_01_09_111109_add_paid_on_column_to_transaction_payments_table', 1),
(35, '2018_01_25_172439_add_printer_related_fields_to_business_locations_table', 1),
(36, '2018_01_27_184322_create_printers_table', 1),
(37, '2018_01_30_181442_create_cash_registers_table', 1),
(38, '2018_01_31_125836_create_cash_register_transactions_table', 1),
(39, '2018_02_07_173326_modify_business_table', 1),
(40, '2018_02_08_105425_add_enable_product_expiry_column_to_business_table', 1),
(41, '2018_02_08_111027_add_expiry_period_and_expiry_period_type_columns_to_products_table', 1),
(42, '2018_02_08_131118_add_mfg_date_and_exp_date_purchase_lines_table', 1),
(43, '2018_02_08_155348_add_exchange_rate_to_transactions_table', 1),
(44, '2018_02_09_124945_modify_transaction_payments_table_for_contact_payments', 1),
(45, '2018_02_12_113640_create_transaction_sell_lines_purchase_lines_table', 1),
(46, '2018_02_12_114605_add_quantity_sold_in_purchase_lines_table', 1),
(47, '2018_02_13_183323_alter_decimal_fields_size', 1),
(48, '2018_02_14_161928_add_transaction_edit_days_to_business_table', 1),
(49, '2018_02_15_161032_add_document_column_to_transactions_table', 1),
(50, '2018_02_17_124709_add_more_options_to_invoice_layouts', 1),
(51, '2018_02_19_111517_add_keyboard_shortcut_column_to_business_table', 1),
(52, '2018_02_19_121537_stock_adjustment_move_to_transaction_table', 1),
(53, '2018_02_20_165505_add_is_direct_sale_column_to_transactions_table', 1),
(54, '2018_02_21_105329_create_system_table', 1),
(55, '2018_02_23_100549_version_1_2', 1),
(56, '2018_02_23_125648_add_enable_editing_sp_from_purchase_column_to_business_table', 1),
(57, '2018_02_26_103612_add_sales_commission_agent_column_to_business_table', 1),
(58, '2018_02_26_130519_modify_users_table_for_sales_cmmsn_agnt', 1),
(59, '2018_02_26_134500_add_commission_agent_to_transactions_table', 1),
(60, '2018_02_27_121422_add_item_addition_method_to_business_table', 1),
(61, '2018_02_27_170232_modify_transactions_table_for_stock_transfer', 1),
(62, '2018_03_05_153510_add_enable_inline_tax_column_to_business_table', 1),
(63, '2018_03_06_210206_modify_product_barcode_types', 1),
(64, '2018_03_13_181541_add_expiry_type_to_business_table', 1),
(65, '2018_03_16_113446_product_expiry_setting_for_business', 1),
(66, '2018_03_19_113601_add_business_settings_options', 1),
(67, '2018_03_26_125334_add_pos_settings_to_business_table', 1),
(68, '2018_03_26_165350_create_customer_groups_table', 1),
(69, '2018_03_27_122720_customer_group_related_changes_in_tables', 1),
(70, '2018_03_29_110138_change_tax_field_to_nullable_in_business_table', 1),
(71, '2018_03_29_115502_add_changes_for_sr_number_in_products_and_sale_lines_table', 1),
(72, '2018_03_29_134340_add_inline_discount_fields_in_purchase_lines', 1),
(73, '2018_03_31_140921_update_transactions_table_exchange_rate', 1),
(74, '2018_04_03_103037_add_contact_id_to_contacts_table', 1),
(75, '2018_04_03_122709_add_changes_to_invoice_layouts_table', 1),
(76, '2018_04_09_135320_change_exchage_rate_size_in_business_table', 1),
(77, '2018_04_17_123122_add_lot_number_to_business', 1),
(78, '2018_04_17_160845_add_product_racks_table', 1),
(79, '2018_04_20_182015_create_res_tables_table', 1),
(80, '2018_04_24_105246_restaurant_fields_in_transaction_table', 1),
(81, '2018_04_24_114149_add_enabled_modules_business_table', 1),
(82, '2018_04_24_133704_add_modules_fields_in_invoice_layout_table', 1),
(83, '2018_04_27_132653_quotation_related_change', 1),
(84, '2018_05_02_104439_add_date_format_and_time_format_to_business', 1),
(85, '2018_05_02_111939_add_sell_return_to_transaction_payments', 1),
(86, '2018_05_14_114027_add_rows_positions_for_products', 1),
(87, '2018_05_14_125223_add_weight_to_products_table', 1),
(88, '2018_05_14_164754_add_opening_stock_permission', 1),
(89, '2018_05_15_134729_add_design_to_invoice_layouts', 1),
(90, '2018_05_16_183307_add_tax_fields_invoice_layout', 1),
(91, '2018_05_18_191956_add_sell_return_to_transaction_table', 1),
(92, '2018_05_21_131349_add_custom_fileds_to_contacts_table', 1),
(93, '2018_05_21_131607_invoice_layout_fields_for_sell_return', 1),
(94, '2018_05_21_131949_add_custom_fileds_and_website_to_business_locations_table', 1),
(95, '2018_05_22_123527_create_reference_counts_table', 1),
(96, '2018_05_22_154540_add_ref_no_prefixes_column_to_business_table', 1),
(97, '2018_05_24_132620_add_ref_no_column_to_transaction_payments_table', 1),
(98, '2018_05_24_161026_add_location_id_column_to_business_location_table', 1),
(99, '2018_05_25_180603_create_modifiers_related_table', 1),
(100, '2018_05_29_121714_add_purchase_line_id_to_stock_adjustment_line_table', 1),
(101, '2018_05_31_114645_add_res_order_status_column_to_transactions_table', 1),
(102, '2018_06_05_103530_rename_purchase_line_id_in_stock_adjustment_lines_table', 1),
(103, '2018_06_05_111905_modify_products_table_for_modifiers', 1),
(104, '2018_06_06_110524_add_parent_sell_line_id_column_to_transaction_sell_lines_table', 1),
(105, '2018_06_07_152443_add_is_service_staff_to_roles_table', 1),
(106, '2018_06_07_182258_add_image_field_to_products_table', 1),
(107, '2018_06_13_133705_create_bookings_table', 1),
(108, '2018_06_15_173636_add_email_column_to_contacts_table', 1),
(109, '2018_06_27_182835_add_superadmin_related_fields_business', 1),
(110, '2018_07_10_101913_add_custom_fields_to_products_table', 1),
(111, '2018_07_17_103434_add_sales_person_name_label_to_invoice_layouts_table', 1),
(112, '2018_07_17_120612_change_all_quantity_field_type_to_decimal', 1),
(113, '2018_07_17_163920_add_theme_skin_color_column_to_business_table', 1),
(114, '2018_07_24_160319_add_lot_no_line_id_to_transaction_sell_lines_table', 1),
(115, '2018_07_25_110004_add_show_expiry_and_show_lot_colums_to_invoice_layouts_table', 1),
(116, '2018_07_25_172004_add_discount_columns_to_transaction_sell_lines_table', 1),
(117, '2018_07_26_124720_change_design_column_type_in_invoice_layouts_table', 1),
(118, '2018_07_26_170424_add_unit_price_before_discount_column_to_transaction_sell_line_table', 1),
(119, '2018_07_28_103614_add_credit_limit_column_to_contacts_table', 1),
(120, '2018_08_08_110755_add_new_payment_methods_to_transaction_payments_table', 1),
(121, '2018_08_08_122225_modify_cash_register_transactions_table_for_new_payment_methods', 1),
(122, '2018_08_14_104036_add_opening_balance_type_to_transactions_table', 1),
(123, '2018_09_06_114438_create_selling_price_groups_table', 1),
(124, '2018_09_06_154057_create_variation_group_prices_table', 1),
(125, '2018_09_07_102413_add_permission_to_access_default_selling_price', 1),
(126, '2018_09_07_134858_add_selling_price_group_id_to_transactions_table', 1),
(127, '2018_09_10_112448_update_product_type_to_single_if_null_in_products_table', 1),
(128, '2018_09_10_173656_add_account_id_column_to_transaction_payments_table', 1),
(129, '2018_09_19_123914_create_notification_templates_table', 1),
(130, '2018_09_22_110504_add_sms_and_email_settings_columns_to_business_table', 1),
(131, '2018_09_24_134942_add_lot_no_line_id_to_stock_adjustment_lines_table', 1),
(132, '2018_09_27_111609_modify_transactions_table_for_purchase_return', 1),
(133, '2018_09_27_131154_add_quantity_returned_column_to_purchase_lines_table', 1),
(134, '2018_10_02_131401_add_return_quantity_column_to_transaction_sell_lines_table', 1),
(135, '2018_10_03_104918_add_qty_returned_column_to_transaction_sell_lines_purchase_lines_table', 1),
(136, '2018_10_03_185947_add_default_notification_templates_to_database', 1),
(137, '2018_10_09_153105_add_business_id_to_transaction_payments_table', 1),
(138, '2018_10_16_135229_create_permission_for_sells_and_purchase', 1),
(139, '2018_10_22_114441_add_columns_for_variable_product_modifications', 1),
(140, '2018_10_22_134428_modify_variable_product_data', 1),
(141, '2018_10_30_181558_add_table_tax_headings_to_invoice_layout', 1),
(142, '2018_10_31_122619_add_pay_terms_field_transactions_table', 1),
(143, '2018_10_31_161328_add_new_permissions_for_pos_screen', 1),
(144, '2018_10_31_174752_add_access_selected_contacts_only_to_users_table', 1),
(145, '2018_10_31_175627_add_user_contact_access', 1),
(146, '2018_10_31_180559_add_auto_send_sms_column_to_notification_templates_table', 1),
(147, '2018_11_02_171949_change_card_type_column_to_varchar_in_transaction_payments_table', 1),
(148, '2018_11_08_105621_add_role_permissions', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_id`, `model_type`) VALUES
(1, 1, 'App\\User'),
(1, 3, 'App\\User'),
(1, 6, 'App\\User'),
(2, 2, 'App\\User'),
(2, 4, 'App\\User'),
(2, 9, 'App\\User'),
(2, 10, 'App\\User');

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `template_for` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_send` tinyint(1) NOT NULL DEFAULT 0,
  `auto_send_sms` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `business_id`, `template_for`, `email_body`, `sms_body`, `subject`, `auto_send`, `auto_send_sms`, `created_at`, `updated_at`) VALUES
(1, 1, 'new_sale', '<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {paid_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', 'Thank you from {business_name}', 0, 0, '2019-01-23 17:59:42', '2019-01-23 17:59:42'),
(2, 1, 'payment_received', '<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {paid_amount}</p>\n\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {paid_amount}. {business_name}', 'Payment Received, from {business_name}', 0, 0, '2019-01-23 17:59:42', '2019-01-23 17:59:42'),
(3, 1, 'payment_reminder', '<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', 'Payment Reminder, from {business_name}', 0, 0, '2019-01-23 17:59:42', '2019-01-23 17:59:42'),
(4, 1, 'new_booking', '<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', 'Booking Confirmed - {business_name}', 0, 0, '2019-01-23 17:59:42', '2019-01-23 17:59:42'),
(5, 1, 'new_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {invoice_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {invoice_number}. Kindly process the products as soon as possible. {business_name}', 'New Order, from {business_name}', 0, 0, '2019-01-23 17:59:42', '2019-01-23 17:59:42'),
(6, 1, 'payment_paid', '<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {invoice_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {invoice_number}.\n                    Kindly note it down. {business_name}', 'Payment Paid, from {business_name}', 0, 0, '2019-01-23 17:59:42', '2019-01-23 17:59:42'),
(7, 1, 'items_received', '<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {invoice_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have received all items from invoice reference number {invoice_number}. Thank you for processing it. {business_name}', 'Items received, from {business_name}', 0, 0, '2019-01-23 17:59:42', '2019-01-23 17:59:42'),
(8, 1, 'items_pending', '<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {invoice_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {invoice_number} . Please process it as soon as possible.{business_name}', 'Items Pending, from {business_name}', 0, 0, '2019-01-23 17:59:42', '2019-01-23 17:59:42');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'profit_loss_report.view', 'web', '2019-01-23 17:52:21', NULL),
(2, 'direct_sell.access', 'web', '2019-01-23 17:52:21', NULL),
(3, 'product.opening_stock', 'web', '2019-01-23 17:53:02', '2019-01-23 17:53:02'),
(4, 'crud_all_bookings', 'web', '2019-01-23 17:53:19', '2019-01-23 17:53:19'),
(5, 'crud_own_bookings', 'web', '2019-01-23 17:53:19', '2019-01-23 17:53:19'),
(6, 'access_default_selling_price', 'web', '2019-01-23 17:54:02', '2019-01-23 17:54:02'),
(7, 'purchase.payments', 'web', '2019-01-23 17:54:10', '2019-01-23 17:54:10'),
(8, 'sell.payments', 'web', '2019-01-23 17:54:10', '2019-01-23 17:54:10'),
(9, 'edit_product_price_from_sale_screen', 'web', '2019-01-23 17:54:12', '2019-01-23 17:54:12'),
(10, 'edit_product_discount_from_sale_screen', 'web', '2019-01-23 17:54:12', '2019-01-23 17:54:12'),
(11, 'roles.view', 'web', '2019-01-23 17:54:15', '2019-01-23 17:54:15'),
(12, 'roles.create', 'web', '2019-01-23 17:54:15', '2019-01-23 17:54:15'),
(13, 'roles.update', 'web', '2019-01-23 17:54:15', '2019-01-23 17:54:15'),
(14, 'roles.delete', 'web', '2019-01-23 17:54:16', '2019-01-23 17:54:16'),
(15, 'user.view', 'web', '2019-01-23 17:54:16', NULL),
(16, 'user.create', 'web', '2019-01-23 17:54:16', NULL),
(17, 'user.update', 'web', '2019-01-23 17:54:16', NULL),
(18, 'user.delete', 'web', '2019-01-23 17:54:16', NULL),
(19, 'supplier.view', 'web', '2019-01-23 17:54:16', NULL),
(20, 'supplier.create', 'web', '2019-01-23 17:54:16', NULL),
(21, 'supplier.update', 'web', '2019-01-23 17:54:16', NULL),
(22, 'supplier.delete', 'web', '2019-01-23 17:54:16', NULL),
(23, 'customer.view', 'web', '2019-01-23 17:54:16', NULL),
(24, 'customer.create', 'web', '2019-01-23 17:54:16', NULL),
(25, 'customer.update', 'web', '2019-01-23 17:54:16', NULL),
(26, 'customer.delete', 'web', '2019-01-23 17:54:16', NULL),
(27, 'product.view', 'web', '2019-01-23 17:54:16', NULL),
(28, 'product.create', 'web', '2019-01-23 17:54:16', NULL),
(29, 'product.update', 'web', '2019-01-23 17:54:16', NULL),
(30, 'product.delete', 'web', '2019-01-23 17:54:16', NULL),
(31, 'purchase.view', 'web', '2019-01-23 17:54:16', NULL),
(32, 'purchase.create', 'web', '2019-01-23 17:54:16', NULL),
(33, 'purchase.update', 'web', '2019-01-23 17:54:16', NULL),
(34, 'purchase.delete', 'web', '2019-01-23 17:54:16', NULL),
(35, 'sell.view', 'web', '2019-01-23 17:54:16', NULL),
(36, 'sell.create', 'web', '2019-01-23 17:54:16', NULL),
(37, 'sell.update', 'web', '2019-01-23 17:54:16', NULL),
(38, 'sell.delete', 'web', '2019-01-23 17:54:16', NULL),
(39, 'purchase_n_sell_report.view', 'web', '2019-01-23 17:54:16', NULL),
(40, 'contacts_report.view', 'web', '2019-01-23 17:54:16', NULL),
(41, 'stock_report.view', 'web', '2019-01-23 17:54:16', NULL),
(42, 'tax_report.view', 'web', '2019-01-23 17:54:16', NULL),
(43, 'trending_product_report.view', 'web', '2019-01-23 17:54:16', NULL),
(44, 'register_report.view', 'web', '2019-01-23 17:54:16', NULL),
(45, 'sales_representative.view', 'web', '2019-01-23 17:54:16', NULL),
(46, 'expense_report.view', 'web', '2019-01-23 17:54:16', NULL),
(47, 'business_settings.access', 'web', '2019-01-23 17:54:16', NULL),
(48, 'barcode_settings.access', 'web', '2019-01-23 17:54:16', NULL),
(49, 'invoice_settings.access', 'web', '2019-01-23 17:54:16', NULL),
(50, 'brand.view', 'web', '2019-01-23 17:54:16', NULL),
(51, 'brand.create', 'web', '2019-01-23 17:54:16', NULL),
(52, 'brand.update', 'web', '2019-01-23 17:54:16', NULL),
(53, 'brand.delete', 'web', '2019-01-23 17:54:16', NULL),
(54, 'tax_rate.view', 'web', '2019-01-23 17:54:16', NULL),
(55, 'tax_rate.create', 'web', '2019-01-23 17:54:16', NULL),
(56, 'tax_rate.update', 'web', '2019-01-23 17:54:16', NULL),
(57, 'tax_rate.delete', 'web', '2019-01-23 17:54:16', NULL),
(58, 'unit.view', 'web', '2019-01-23 17:54:16', NULL),
(59, 'unit.create', 'web', '2019-01-23 17:54:16', NULL),
(60, 'unit.update', 'web', '2019-01-23 17:54:16', NULL),
(61, 'unit.delete', 'web', '2019-01-23 17:54:16', NULL),
(62, 'category.view', 'web', '2019-01-23 17:54:16', NULL),
(63, 'category.create', 'web', '2019-01-23 17:54:16', NULL),
(64, 'category.update', 'web', '2019-01-23 17:54:16', NULL),
(65, 'category.delete', 'web', '2019-01-23 17:54:16', NULL),
(66, 'expense.access', 'web', '2019-01-23 17:54:16', NULL),
(67, 'access_all_locations', 'web', '2019-01-23 17:54:16', NULL),
(68, 'dashboard.data', 'web', '2019-01-23 17:54:16', NULL),
(69, 'location.1', 'web', '2019-01-23 17:59:42', '2019-01-23 17:59:42');

-- --------------------------------------------------------

--
-- Table structure for table `printers`
--

CREATE TABLE `printers` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection_type` enum('network','windows','linux') COLLATE utf8mb4_unicode_ci NOT NULL,
  `capability_profile` enum('default','simple','SP2000','TEP-200M','P822D') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `char_per_line` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `type` enum('single','variable','modifier') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_id` int(11) UNSIGNED DEFAULT NULL,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `sub_category_id` int(10) UNSIGNED DEFAULT NULL,
  `tax` int(10) UNSIGNED DEFAULT NULL,
  `tax_type` enum('inclusive','exclusive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `enable_stock` tinyint(1) NOT NULL DEFAULT 0,
  `alert_quantity` int(11) NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode_type` enum('C39','C128','EAN13','EAN8','UPCA','UPCE') COLLATE utf8mb4_unicode_ci DEFAULT 'C128',
  `expiry_period` decimal(4,2) DEFAULT NULL,
  `expiry_period_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_sr_no` tinyint(1) NOT NULL DEFAULT 0,
  `weight` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `business_id`, `type`, `unit_id`, `brand_id`, `category_id`, `sub_category_id`, `tax`, `tax_type`, `enable_stock`, `alert_quantity`, `sku`, `barcode_type`, `expiry_period`, `expiry_period_type`, `enable_sr_no`, `weight`, `product_custom_field1`, `product_custom_field2`, `product_custom_field3`, `product_custom_field4`, `image`, `created_by`, `created_at`, `updated_at`) VALUES
(35, 'Aqua Muds', 1, 'single', 4, NULL, 22, NULL, NULL, 'exclusive', 1, 1, '0035', 'C128', NULL, NULL, 0, '100', NULL, NULL, NULL, NULL, '1559230902_nexo-mud-flap-500x500.jpg', 1, '2019-05-31 00:41:42', '2019-05-31 00:41:42'),
(36, 'Alto japani mud flap', 1, 'single', 5, 15, 22, NULL, NULL, 'exclusive', 1, 1, '0036', 'C128', NULL, NULL, 0, '100', NULL, NULL, NULL, NULL, '1559231261_nexo-mud-flap-500x500.jpg', 1, '2019-05-31 00:47:41', '2019-05-31 00:47:41'),
(37, 'Mira mud flap', 1, 'single', 4, NULL, 22, NULL, NULL, 'exclusive', 1, 1, '0037', 'C128', NULL, NULL, 0, '100', NULL, NULL, NULL, NULL, '1559371065_nexo-mud-flap-500x500.jpg', 1, '2019-06-01 15:37:45', '2019-06-01 15:37:45'),
(38, 'probox mud flap', 1, 'single', 4, NULL, 22, NULL, NULL, 'exclusive', 1, 1, '0038', 'C128', NULL, NULL, 0, '100', NULL, NULL, NULL, NULL, '1559371275_nexo-mud-flap-500x500.jpg', 1, '2019-06-01 15:41:15', '2019-06-01 15:41:15'),
(39, 'Carpet mat plain mix', 1, 'single', 4, 16, 22, NULL, NULL, 'exclusive', 1, 2, '0039', 'C128', NULL, NULL, 0, '100', NULL, NULL, NULL, NULL, '1559371707_carpet mate.jpg', 1, '2019-06-01 15:48:27', '2019-06-01 15:48:27'),
(40, '410 SMOKE MAT', 1, 'single', 4, 15, 22, NULL, NULL, 'exclusive', 1, 1, '0040', 'C128', NULL, NULL, 0, '100', NULL, NULL, NULL, NULL, '1559372386_SMOK MATE.jpg', 1, '2019-06-01 15:59:46', '2019-06-01 15:59:46'),
(41, '3 PIECE SMOKE MATE STAR WALA', 1, 'single', 4, NULL, 22, NULL, NULL, 'exclusive', 1, 50, '0041', 'C128', NULL, NULL, 0, '100', NULL, NULL, NULL, NULL, '1559373406_1111.jpg', 1, '2019-06-01 16:16:46', '2019-08-04 18:15:12'),
(42, 'CRYSTEL MAT SMOKE COLOR', 1, 'single', 4, 15, 22, NULL, NULL, 'exclusive', 1, 1, '0042', 'C128', NULL, NULL, 0, '100', NULL, NULL, NULL, NULL, NULL, 1, '2019-06-01 16:20:46', '2019-06-01 16:20:46'),
(43, 'CARPET MAT COROLLA 15 BEIGE', 1, 'single', 4, 15, 22, NULL, NULL, 'exclusive', 1, 1, '0043', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1559374363_15.jpg', 1, '2019-06-01 16:32:43', '2019-06-01 16:32:43'),
(44, 'CARPET MAT CIVIC 16 BLACK', 1, 'single', 4, 15, 22, NULL, NULL, 'exclusive', 1, 1, '0044', 'C128', NULL, NULL, 0, '100', NULL, NULL, NULL, NULL, '1559374616_CIVIC.jpg', 1, '2019-06-01 16:36:56', '2019-06-01 16:36:56'),
(45, 'CARPET MAT CIVIC 17 BLACK', 1, 'single', 4, 15, 22, NULL, NULL, 'exclusive', 1, 1, '0045', 'C128', NULL, NULL, 0, '100', NULL, NULL, NULL, NULL, '1559374903_CIVIC.jpg', 1, '2019-06-01 16:41:43', '2019-06-01 16:41:44'),
(46, 'CARPET MAT CIVIC 12 BEIGE', 1, 'single', 4, 15, 22, NULL, NULL, 'exclusive', 1, 1, '0046', 'C128', NULL, NULL, 0, '100', NULL, NULL, NULL, NULL, '1559375305_12CIV.jpg', 1, '2019-06-01 16:48:25', '2019-06-01 16:48:25'),
(47, 'CARPET MAT CIVIC 08 BIEGE BLACK', 1, 'single', 4, 15, 22, NULL, NULL, 'exclusive', 1, 1, '0047', 'C128', NULL, NULL, 0, '100', NULL, NULL, NULL, NULL, '1559375630_12CIV.jpg', 1, '2019-06-01 16:53:50', '2019-06-01 16:53:50'),
(48, 'CARPET MAT CIVIC 05', 1, 'single', 4, 15, 22, NULL, NULL, 'exclusive', 1, 1, '0048', 'C128', NULL, NULL, 0, '100', NULL, NULL, NULL, NULL, '1559375880_s-l300.jpg', 1, '2019-06-01 16:58:00', '2019-06-01 16:58:00'),
(49, 'CARPET MAT CITY NEW GREY BIEGE', 1, 'single', 4, 15, 22, NULL, NULL, 'exclusive', 1, 1, '0049', 'C128', NULL, NULL, 0, '100', NULL, NULL, NULL, NULL, '1559376183_images.jpg', 1, '2019-06-01 17:03:03', '2019-06-01 17:03:03'),
(50, 'CARPET MAT COROLLA 13', 1, 'single', 4, 15, 22, NULL, NULL, 'exclusive', 1, 1, '0050', 'C128', NULL, NULL, 0, '100', NULL, NULL, NULL, NULL, '1559376385_carpet mate.jpg', 1, '2019-06-01 17:06:25', '2019-06-01 17:06:25'),
(51, 'CARPET MAT UNIVERSAL', 1, 'single', 4, 16, 22, NULL, NULL, 'exclusive', 1, 1, '0051', 'C128', NULL, NULL, 0, '100', NULL, NULL, NULL, NULL, '1559376717_15.jpg', 1, '2019-06-01 17:11:57', '2019-06-01 17:11:58'),
(52, 'PVC MATE BIEGE GREY BLACK', 1, 'single', 4, 16, 22, NULL, NULL, 'exclusive', 1, 2, '0052', 'C128', NULL, NULL, 0, '100', NULL, NULL, NULL, NULL, NULL, 1, '2019-06-01 17:46:20', '2019-06-01 17:46:20'),
(53, 'PVC MATE BIEGE GREY BLACK', 1, 'single', 4, 16, 22, NULL, NULL, 'exclusive', 1, 2, '0053', 'C128', NULL, NULL, 0, '100', NULL, NULL, NULL, NULL, NULL, 1, '2019-06-01 17:48:08', '2019-06-01 17:48:09'),
(54, 'Digi Matt', 1, 'single', 4, NULL, 22, NULL, NULL, 'exclusive', 1, 1, '0054', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1560677575_degi.jpg', 1, '2019-06-16 18:32:55', '2019-06-16 18:32:55'),
(55, 'Mehran Mudflap', 1, 'single', 4, 15, 22, NULL, NULL, 'exclusive', 1, 1, '0055', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1560846380_MUDFLAP.jpg', 1, '2019-06-18 17:26:20', '2019-06-19 15:37:22'),
(56, 'Cultus Efi Mudflap', 1, 'single', 4, 15, 22, NULL, NULL, 'exclusive', 1, 2, '0056', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-06-18 17:46:54', '2019-06-18 17:46:54'),
(57, 'Cultus Khaki daba Mudflap', 1, 'single', 1, 15, NULL, NULL, NULL, 'exclusive', 1, 1, '0057', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-06-18 19:00:00', '2019-06-18 19:00:00'),
(58, 'Cultus Khaki daba Mudflap', 1, 'single', 4, 15, 22, NULL, NULL, 'exclusive', 1, 1, '0058', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-06-18 19:04:53', '2019-06-18 19:04:53'),
(59, 'Cultus Khaki daba Mudflap', 1, 'single', 4, 15, 22, NULL, NULL, 'exclusive', 1, 1, '0059', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-06-18 19:05:24', '2019-06-18 19:05:25'),
(60, 'Cultus New Jenuine', 1, 'single', 1, 16, 22, NULL, NULL, 'exclusive', 1, 1, '0060', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-06-18 19:08:58', '2019-06-18 19:08:58'),
(61, 'Wagon R Genuine Type Mudflapper', 1, 'single', 1, 15, NULL, NULL, NULL, 'exclusive', 1, 1, '0061', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-06-18 19:12:38', '2019-06-18 19:12:38'),
(62, 'oil', 1, 'single', 3, NULL, NULL, NULL, 2, 'inclusive', 1, 5, '999', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-08-06 20:07:46', '2019-08-09 13:16:41'),
(63, 'sufi 10 kg', 1, 'single', 3, NULL, NULL, NULL, NULL, 'exclusive', 1, 100, '0063', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-08-08 03:41:06', '2019-08-08 03:41:06'),
(64, '5 KG tin', 1, 'single', 3, NULL, NULL, NULL, NULL, 'exclusive', 1, 100, '0064', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-08-08 22:31:44', '2019-08-08 22:31:44'),
(65, '15 Kg Sufi Oil', 1, 'single', 3, NULL, NULL, NULL, 1, 'inclusive', 1, 100, '15', 'C128', NULL, NULL, 0, '15', NULL, NULL, NULL, NULL, NULL, 1, '2019-08-09 18:48:13', '2019-08-09 18:48:13'),
(66, 'oil 10', 1, 'single', 3, NULL, NULL, NULL, 2, 'inclusive', 1, 20, '0066', 'C128', NULL, NULL, 0, '10', '200', NULL, NULL, NULL, NULL, 1, '2019-08-11 07:01:42', '2019-08-11 07:01:43'),
(67, 'oil 2 kg', 1, 'single', 3, 3, NULL, NULL, 1, 'exclusive', 1, 10, '0067', 'C128', NULL, NULL, 0, '2', '432', NULL, NULL, NULL, NULL, 1, '2019-08-21 04:47:37', '2019-08-21 05:58:43'),
(68, 'dalda 20 kg', 1, 'single', 3, NULL, NULL, NULL, 1, 'exclusive', 1, 10, '0068', 'C128', NULL, NULL, 0, '20', '432', NULL, NULL, NULL, NULL, 1, '2019-08-21 12:37:19', '2019-08-21 12:37:19'),
(69, 'Mann 10 Kg', 1, 'single', 3, NULL, NULL, NULL, 1, 'exclusive', 1, 100, '0069', 'C128', NULL, NULL, 0, '10', '1000', NULL, NULL, NULL, NULL, 1, '2019-08-21 13:32:22', '2019-08-21 13:32:22'),
(70, 'canola 5 kg', 1, 'single', 3, NULL, NULL, NULL, 2, 'exclusive', 1, 10, '0070', 'C128', NULL, NULL, 0, '5', '432.00', NULL, NULL, NULL, NULL, 1, '2019-08-25 09:27:20', '2019-08-25 09:56:05'),
(71, 'shan 10 kg', 1, 'single', 3, NULL, NULL, NULL, 1, 'exclusive', 1, 100, '0071', 'C128', NULL, NULL, 0, '10', '432.00', NULL, NULL, NULL, NULL, 1, '2019-08-25 12:15:59', '2019-08-25 12:30:56'),
(72, 'habib 10 kg', 1, 'single', 3, NULL, NULL, NULL, 1, 'exclusive', 1, 10, '0072', 'C128', NULL, NULL, 0, '10', '432.00', NULL, NULL, NULL, NULL, 1, '2019-09-01 11:49:18', '2019-09-01 11:50:56');

-- --------------------------------------------------------

--
-- Table structure for table `product_racks`
--

CREATE TABLE `product_racks` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `rack` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `row` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_racks`
--

INSERT INTO `product_racks` (`id`, `business_id`, `location_id`, `product_id`, `rack`, `row`, `position`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 34, '1', '1', '2', '2019-05-30 03:20:14', '2019-05-30 03:20:14'),
(2, 1, 1, 35, '5', '2', '2', '2019-05-31 00:41:42', '2019-05-31 00:43:12'),
(3, 1, 1, 36, '5', '2', '2', '2019-05-31 00:47:41', '2019-05-31 00:47:41'),
(4, 1, 1, 37, '5', '2', '2', '2019-06-01 15:37:45', '2019-06-01 15:37:45'),
(5, 1, 1, 38, '5', '2', '2', '2019-06-01 15:41:15', '2019-06-01 15:41:15'),
(6, 1, 1, 39, '4', 'RIGHT SIDE', 'TOP', '2019-06-01 15:48:27', '2019-06-01 15:48:27'),
(7, 1, 1, 40, '4', 'RIGHT SIDE', 'TOP', '2019-06-01 15:59:46', '2019-06-01 15:59:46'),
(8, 1, 1, 41, '4', 'RIGHT SIDE', 'TOP', '2019-06-01 16:16:48', '2019-08-04 18:15:12'),
(9, 1, 1, 42, '4', 'RIGHT SIDE', 'TOP', '2019-06-01 16:20:46', '2019-06-01 16:20:46'),
(10, 1, 1, 43, '4', 'RIGHT SIDE', 'TOP', '2019-06-01 16:32:43', '2019-06-01 16:32:43'),
(11, 1, 1, 44, '4', 'RIGHT SIDE', 'TOP', '2019-06-01 16:36:56', '2019-06-01 16:36:56'),
(12, 1, 1, 45, '4', 'RIGHT SIDE', 'TOP', '2019-06-01 16:41:44', '2019-06-01 16:41:44'),
(13, 1, 1, 46, '4', 'RIGHT SIDE', 'TOP', '2019-06-01 16:48:25', '2019-06-01 16:48:25'),
(14, 1, 1, 47, '4', 'RIGHT SIDE', 'TOP', '2019-06-01 16:53:50', '2019-06-01 16:53:50'),
(15, 1, 1, 48, '4', 'RIGHT SIDE', 'TOP', '2019-06-01 16:58:00', '2019-06-01 16:58:00'),
(16, 1, 1, 49, '4', 'RIGHT SIDE', 'TOP', '2019-06-01 17:03:03', '2019-06-01 17:03:03'),
(17, 1, 1, 50, '4', 'RIGHT SIDE', 'TOP', '2019-06-01 17:06:25', '2019-06-01 17:06:25'),
(18, 1, 1, 51, '4', 'RIGHT SIDE', 'TOP', '2019-06-01 17:11:58', '2019-06-01 17:11:58'),
(19, 1, 1, 52, '4', 'RIGHT SIDE', 'TOP', '2019-06-01 17:46:20', '2019-06-01 17:46:20'),
(20, 1, 1, 53, '4', 'RIGHT SIDE', 'TOP', '2019-06-01 17:48:09', '2019-06-01 17:48:09'),
(21, 1, 1, 54, '4', 'RIGHT SIDE', 'TOP', '2019-06-16 18:32:55', '2019-06-16 18:32:55'),
(22, 1, 1, 55, '5', '1st', '1st', '2019-06-18 17:26:20', '2019-06-20 01:12:41'),
(23, 1, 1, 56, '5', '1st', '1st', '2019-06-18 17:46:54', '2019-06-20 01:20:16'),
(24, 1, 1, 57, '5', '1st', '1st', '2019-06-18 19:00:00', '2019-06-18 19:00:00'),
(25, 1, 1, 58, '5', '1st', '1st', '2019-06-18 19:04:53', '2019-06-18 19:04:53'),
(26, 1, 1, 59, '5', '1st', '1st', '2019-06-18 19:05:25', '2019-06-18 19:05:25'),
(27, 1, 1, 60, NULL, NULL, NULL, '2019-06-18 19:08:58', '2019-06-18 19:08:58'),
(28, 1, 1, 61, NULL, NULL, NULL, '2019-06-18 19:12:38', '2019-06-18 19:12:38');

-- --------------------------------------------------------

--
-- Table structure for table `product_variations`
--

CREATE TABLE `product_variations` (
  `id` int(10) UNSIGNED NOT NULL,
  `variation_template_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `is_dummy` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variations`
--

INSERT INTO `product_variations` (`id`, `variation_template_id`, `name`, `product_id`, `is_dummy`, `created_at`, `updated_at`) VALUES
(5, NULL, 'DUMMY', 5, 1, '2019-01-24 06:59:51', '2019-01-24 06:59:51'),
(14, NULL, 'DUMMY', 14, 1, '2019-01-24 06:59:51', '2019-01-24 06:59:51'),
(34, NULL, 'DUMMY', 34, 1, '2019-05-30 03:20:14', '2019-05-30 03:20:14'),
(35, NULL, 'DUMMY', 35, 1, '2019-05-31 00:41:42', '2019-05-31 00:41:42'),
(36, NULL, 'DUMMY', 36, 1, '2019-05-31 00:47:41', '2019-05-31 00:47:41'),
(37, NULL, 'DUMMY', 37, 1, '2019-06-01 15:37:45', '2019-06-01 15:37:45'),
(38, NULL, 'DUMMY', 38, 1, '2019-06-01 15:41:15', '2019-06-01 15:41:15'),
(39, NULL, 'DUMMY', 39, 1, '2019-06-01 15:48:27', '2019-06-01 15:48:27'),
(40, NULL, 'DUMMY', 40, 1, '2019-06-01 15:59:46', '2019-06-01 15:59:46'),
(41, NULL, 'DUMMY', 41, 1, '2019-06-01 16:16:48', '2019-06-01 16:16:48'),
(42, NULL, 'DUMMY', 42, 1, '2019-06-01 16:20:46', '2019-06-01 16:20:46'),
(43, NULL, 'DUMMY', 43, 1, '2019-06-01 16:32:43', '2019-06-01 16:32:43'),
(44, NULL, 'DUMMY', 44, 1, '2019-06-01 16:36:56', '2019-06-01 16:36:56'),
(45, NULL, 'DUMMY', 45, 1, '2019-06-01 16:41:44', '2019-06-01 16:41:44'),
(46, NULL, 'DUMMY', 46, 1, '2019-06-01 16:48:25', '2019-06-01 16:48:25'),
(47, NULL, 'DUMMY', 47, 1, '2019-06-01 16:53:50', '2019-06-01 16:53:50'),
(48, NULL, 'DUMMY', 48, 1, '2019-06-01 16:58:00', '2019-06-01 16:58:00'),
(49, NULL, 'DUMMY', 49, 1, '2019-06-01 17:03:03', '2019-06-01 17:03:03'),
(50, NULL, 'DUMMY', 50, 1, '2019-06-01 17:06:25', '2019-06-01 17:06:25'),
(51, NULL, 'DUMMY', 51, 1, '2019-06-01 17:11:58', '2019-06-01 17:11:58'),
(52, NULL, 'DUMMY', 52, 1, '2019-06-01 17:46:20', '2019-06-01 17:46:20'),
(53, NULL, 'DUMMY', 53, 1, '2019-06-01 17:48:09', '2019-06-01 17:48:09'),
(54, NULL, 'DUMMY', 54, 1, '2019-06-16 18:32:55', '2019-06-16 18:32:55'),
(55, NULL, 'DUMMY', 55, 1, '2019-06-18 17:26:20', '2019-06-18 17:26:20'),
(56, NULL, 'DUMMY', 56, 1, '2019-06-18 17:46:54', '2019-06-18 17:46:54'),
(57, NULL, 'DUMMY', 57, 1, '2019-06-18 19:00:00', '2019-06-18 19:00:00'),
(58, NULL, 'DUMMY', 58, 1, '2019-06-18 19:04:53', '2019-06-18 19:04:53'),
(59, NULL, 'DUMMY', 59, 1, '2019-06-18 19:05:25', '2019-06-18 19:05:25'),
(60, NULL, 'DUMMY', 60, 1, '2019-06-18 19:08:58', '2019-06-18 19:08:58'),
(61, NULL, 'DUMMY', 61, 1, '2019-06-18 19:12:38', '2019-06-18 19:12:38'),
(62, NULL, 'DUMMY', 62, 1, '2019-08-06 20:07:46', '2019-08-06 20:07:46'),
(63, NULL, 'DUMMY', 63, 1, '2019-08-08 03:41:06', '2019-08-08 03:41:06'),
(64, NULL, 'DUMMY', 64, 1, '2019-08-08 22:31:45', '2019-08-08 22:31:45'),
(65, NULL, 'DUMMY', 65, 1, '2019-08-09 18:48:13', '2019-08-09 18:48:13'),
(66, NULL, 'DUMMY', 66, 1, '2019-08-11 07:01:43', '2019-08-11 07:01:43'),
(67, NULL, 'DUMMY', 67, 1, '2019-08-21 04:47:37', '2019-08-21 04:47:37'),
(68, NULL, 'DUMMY', 68, 1, '2019-08-21 12:37:19', '2019-08-21 12:37:19'),
(69, NULL, 'DUMMY', 69, 1, '2019-08-21 13:32:22', '2019-08-21 13:32:22'),
(70, NULL, 'DUMMY', 70, 1, '2019-08-25 09:27:20', '2019-08-25 09:27:20'),
(71, NULL, 'DUMMY', 71, 1, '2019-08-25 12:15:59', '2019-08-25 12:15:59'),
(72, NULL, 'DUMMY', 72, 1, '2019-09-01 11:49:18', '2019-09-01 11:49:18');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_lines`
--

CREATE TABLE `purchase_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(20,4) NOT NULL,
  `pp_without_discount` decimal(20,2) NOT NULL DEFAULT 0.00 COMMENT 'Purchase price before inline discounts',
  `discount_percent` decimal(5,2) NOT NULL DEFAULT 0.00 COMMENT 'Inline discount percentage',
  `purchase_price` decimal(20,2) DEFAULT NULL,
  `purchase_price_inc_tax` decimal(20,2) NOT NULL DEFAULT 0.00,
  `item_tax` decimal(20,2) DEFAULT NULL,
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `quantity_sold` decimal(20,4) DEFAULT 0.0000,
  `quantity_adjusted` decimal(20,4) DEFAULT 0.0000,
  `quantity_returned` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `mfg_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `lot_number` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_lines`
--

INSERT INTO `purchase_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `pp_without_discount`, `discount_percent`, `purchase_price`, `purchase_price_inc_tax`, `item_tax`, `tax_id`, `quantity_sold`, `quantity_adjusted`, `quantity_returned`, `mfg_date`, `exp_date`, `lot_number`, `created_at`, `updated_at`) VALUES
(5, 5, 5, 5, 5000.0000, 10.00, 0.00, 10.00, 10.00, 0.00, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, '2019-01-24 11:04:44', '2019-06-01 00:16:01'),
(10, 8, 14, 14, 100.0000, 100.00, 0.00, 100.00, 100.00, 0.00, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, '2019-01-24 11:07:33', '2019-06-01 00:15:55'),
(11, 19, 34, 34, 100.0000, 100.00, 0.00, 100.00, 100.00, 0.00, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, '2019-05-30 03:20:26', '2019-05-30 03:20:26'),
(12, 20, 35, 35, 5.0000, 350.00, 0.00, 350.00, 350.00, 0.00, NULL, 4.0000, 1.0000, 0.0000, NULL, NULL, NULL, '2019-05-31 00:42:02', '2019-08-06 19:34:20'),
(13, 21, 36, 36, 100.0000, 350.00, 0.00, 350.00, 350.00, 0.00, NULL, 7.0000, 0.0000, 0.0000, NULL, NULL, NULL, '2019-05-31 00:47:53', '2019-08-16 18:01:01'),
(14, 25, 41, 41, 100.0000, 1250.00, 0.00, 1250.00, 1250.00, 0.00, NULL, 33.0000, 0.0000, 0.0000, NULL, NULL, NULL, '2019-08-02 18:20:05', '2019-08-18 10:07:22'),
(15, 27, 40, 40, 10.0000, 1100.00, 0.00, 1100.00, 1100.00, 0.00, NULL, 8.0000, 0.0000, 0.0000, NULL, NULL, NULL, '2019-08-02 18:31:52', '2019-08-18 10:08:46'),
(16, 31, 35, 35, 50.0000, 350.00, 0.00, 350.00, 350.00, 0.00, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, '2019-08-04 18:20:35', '2019-08-04 18:20:35'),
(17, 31, 36, 36, 50.0000, 350.00, 0.00, 350.00, 350.00, 0.00, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, '2019-08-04 18:20:35', '2019-08-04 18:20:35'),
(18, 36, 62, 62, 1.0000, 1100.00, 0.00, 1100.00, 1100.00, 0.00, NULL, 1.0000, 0.0000, 0.0000, NULL, NULL, NULL, '2019-08-06 20:08:09', '2019-08-09 21:31:43'),
(19, 38, 64, 64, 1.0000, 465.00, 0.00, 465.00, 544.05, 79.05, 2, 1.0000, 0.0000, 0.0000, NULL, NULL, NULL, '2019-08-08 22:41:38', '2019-08-08 23:23:10'),
(20, 40, 65, 65, 200.0000, 100.00, 0.00, 100.00, 117.00, 17.00, 1, 33.3300, 0.0000, 0.0000, NULL, NULL, NULL, '2019-08-09 18:49:00', '2019-09-02 19:15:47'),
(21, 45, 65, 65, 20.0000, 100.00, 0.00, 100.00, 117.00, 17.00, 1, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, '2019-08-10 16:45:35', '2019-08-10 16:47:26'),
(22, 45, 62, 62, 20.0000, 1100.00, 0.00, 1100.00, 1287.00, 187.00, 2, 1.0000, 0.0000, 0.0000, NULL, NULL, NULL, '2019-08-10 16:45:36', '2019-08-10 14:57:34'),
(23, 46, 62, 62, 20.0000, 1100.00, 0.00, 1100.00, 1287.00, 187.00, 2, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, '2019-08-10 21:43:17', '2019-08-10 21:46:00'),
(24, 49, 66, 66, 50.0000, 1000.00, 0.00, 1000.00, 1170.00, 170.00, 2, 11.0000, 0.0000, 0.0000, NULL, NULL, NULL, '2019-08-11 07:02:07', '2019-08-15 10:57:42'),
(25, 50, 66, 66, 1.0000, 1000.00, 0.00, 1000.00, 1170.00, 170.00, 2, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, '2019-08-11 09:19:18', '2019-08-11 09:19:36'),
(26, 77, 67, 67, 20.0000, 465.00, 0.00, 465.00, 544.05, 79.05, 1, 13.0000, 0.0000, 0.0000, NULL, NULL, NULL, '2019-08-21 04:48:16', '2019-09-01 16:50:30'),
(27, 81, 67, 67, 3.0000, 0.00, 0.00, 465.00, 511.05, 79.05, 1, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, '2019-08-21 08:48:10', '2019-08-21 08:58:42'),
(28, 86, 68, 68, 3.0000, 0.00, 0.00, 465.00, 511.05, 79.05, 1, 2.0000, 0.0000, 0.0000, NULL, NULL, NULL, '2019-08-21 12:41:21', '2019-08-21 12:42:38'),
(29, 88, 69, 69, 100.0000, 900.00, 0.00, 900.00, 1053.00, 153.00, 1, 4.0000, 0.0000, 0.0000, NULL, NULL, NULL, '2019-08-21 13:32:35', '2019-08-21 14:06:55'),
(30, 89, 69, 69, 2.0000, 0.00, 0.00, 900.00, 1153.00, 153.00, 1, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, '2019-08-21 13:35:37', '2019-08-21 13:35:37'),
(31, 94, 70, 70, 10.0000, 465.00, 0.00, 465.00, 544.05, 79.05, 1, 3.0000, 0.0000, 0.0000, NULL, NULL, NULL, '2019-08-25 09:27:31', '2019-08-25 09:46:37'),
(32, 97, 70, 70, 10.0000, 0.00, 0.00, 465.00, 511.05, 79.05, 1, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, '2019-08-25 09:44:53', '2019-08-25 09:44:53'),
(33, 99, 70, 70, 3.0000, 0.00, 0.00, 465.00, 511.05, 79.05, 2, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, '2019-08-25 10:26:10', '2019-08-25 10:26:10'),
(34, 100, 70, 70, 3.0000, 0.00, 0.00, 465.00, 511.05, 79.05, 2, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, '2019-08-25 10:30:10', '2019-08-25 10:30:10'),
(35, 101, 70, 70, 3.0000, 0.00, 0.00, 465.00, 511.05, 79.05, 2, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, '2019-08-25 10:37:35', '2019-08-25 10:37:35'),
(36, 106, 70, 70, 1.0000, 0.00, 0.00, 465.00, 511.05, 79.05, 2, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, '2019-08-25 10:56:39', '2019-08-25 10:56:39'),
(37, 109, 70, 70, 1.0000, 0.00, 0.00, 465.00, 511.05, 79.05, 2, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, '2019-08-25 11:06:31', '2019-08-25 11:32:52'),
(38, 110, 70, 70, 1.0000, 0.00, 0.00, NULL, 511.05, 79.05, 2, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, '2019-08-25 11:12:29', '2019-08-25 11:12:29'),
(39, 111, 71, 71, 1.0000, 0.00, 0.00, 465.00, 511.05, 79.05, 1, 1.0000, 0.0000, 0.0000, NULL, NULL, NULL, '2019-08-25 12:17:11', '2019-08-25 12:20:27'),
(40, 113, 71, 71, 50.0000, 465.00, 0.00, 465.00, 544.05, 79.05, 1, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, '2019-08-25 12:31:29', '2019-08-25 12:31:29'),
(41, 114, 71, 71, 1.0000, 0.00, 0.00, 465.00, 511.05, 79.05, 1, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, '2019-08-25 12:35:45', '2019-08-25 12:35:45'),
(42, 119, 72, 72, 10.0000, 0.00, 0.00, 465.00, 511.05, 79.05, 1, 10.0000, 0.0000, 0.0000, NULL, NULL, NULL, '2019-09-01 11:51:40', '2019-09-01 19:40:19');

-- --------------------------------------------------------

--
-- Table structure for table `reference_counts`
--

CREATE TABLE `reference_counts` (
  `id` int(10) UNSIGNED NOT NULL,
  `ref_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_count` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reference_counts`
--

INSERT INTO `reference_counts` (`id`, `ref_type`, `ref_count`, `business_id`, `created_at`, `updated_at`) VALUES
(1, 'contacts', 8, 1, '2019-01-23 17:59:41', '2019-08-19 15:08:30'),
(2, 'business_location', 1, 1, '2019-01-23 17:59:42', '2019-01-23 17:59:42'),
(3, 'sell_payment', 119, 1, '2019-01-24 11:08:31', '2019-09-02 19:15:47'),
(4, 'expense', 1, 1, '2019-04-22 17:07:20', '2019-04-22 17:07:20'),
(5, 'expense_payment', 1, 1, '2019-04-22 17:12:56', '2019-04-22 17:12:56'),
(6, 'stock_adjustment', 1, 1, '2019-05-31 00:56:29', '2019-05-31 00:56:29'),
(7, 'purchase', 19, 1, '2019-08-04 18:20:34', '2019-09-01 11:51:40'),
(8, 'purchase_payment', 19, 1, '2019-08-04 18:20:34', '2019-09-01 11:51:40'),
(9, 'opening_balance', 1, 1, '2019-08-06 18:23:54', '2019-08-06 18:23:54');

-- --------------------------------------------------------

--
-- Table structure for table `res_product_modifier_sets`
--

CREATE TABLE `res_product_modifier_sets` (
  `modifier_set_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Table use to store the modifier sets applicable for a product'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `res_tables`
--

CREATE TABLE `res_tables` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_service_staff` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `business_id`, `is_default`, `is_service_staff`, `created_at`, `updated_at`) VALUES
(1, 'Admin#1', 'web', 1, 1, 0, '2019-01-23 17:59:41', '2019-01-23 17:59:41'),
(2, 'Cashier#1', 'web', 1, 0, 0, '2019-01-23 17:59:41', '2019-01-23 17:59:41'),
(3, 'SuperAdmin#1', 'web', 1, 0, 0, '2019-06-25 02:43:53', '2019-06-25 02:43:53');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 3),
(2, 3),
(3, 3),
(7, 3),
(8, 3),
(9, 3),
(10, 3),
(11, 3),
(12, 3),
(13, 3),
(14, 3),
(15, 3),
(16, 3),
(17, 3),
(18, 3),
(19, 3),
(20, 3),
(21, 3),
(22, 3),
(23, 3),
(24, 3),
(25, 3),
(26, 3),
(27, 3),
(28, 3),
(29, 3),
(30, 3),
(31, 3),
(32, 3),
(33, 3),
(34, 3),
(35, 2),
(35, 3),
(36, 2),
(36, 3),
(37, 2),
(37, 3),
(38, 2),
(38, 3),
(39, 3),
(40, 3),
(41, 3),
(42, 3),
(43, 3),
(44, 3),
(45, 3),
(46, 3),
(47, 3),
(48, 3),
(49, 3),
(50, 3),
(51, 3),
(52, 3),
(53, 3),
(54, 3),
(55, 3),
(56, 3),
(57, 3),
(58, 3),
(59, 3),
(60, 3),
(61, 3),
(62, 3),
(63, 3),
(64, 3),
(65, 3),
(66, 3),
(67, 2),
(67, 3),
(68, 3);

-- --------------------------------------------------------

--
-- Table structure for table `selling_price_groups`
--

CREATE TABLE `selling_price_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustments_temp`
--

CREATE TABLE `stock_adjustments_temp` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustment_lines`
--

CREATE TABLE `stock_adjustment_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(20,4) NOT NULL,
  `unit_price` decimal(20,2) DEFAULT NULL COMMENT 'Last purchase unit price',
  `removed_purchase_line` int(11) DEFAULT NULL,
  `lot_no_line_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock_adjustment_lines`
--

INSERT INTO `stock_adjustment_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `unit_price`, `removed_purchase_line`, `lot_no_line_id`, `created_at`, `updated_at`) VALUES
(1, 23, 35, 35, 1.0000, 700.00, NULL, NULL, '2019-05-31 00:56:29', '2019-05-31 00:56:29');

-- --------------------------------------------------------

--
-- Table structure for table `system`
--

CREATE TABLE `system` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system`
--

INSERT INTO `system` (`key`, `value`) VALUES
('db_version', '2.11'),
('default_business_active_status', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

CREATE TABLE `tax_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(8,2) NOT NULL,
  `is_tax_group` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tax_rates`
--

INSERT INTO `tax_rates` (`id`, `business_id`, `name`, `amount`, `is_tax_group`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'GST', 17.00, 0, 1, NULL, '2019-08-08 13:56:30', '2019-08-08 22:36:57'),
(2, 1, 'ST', 17.00, 0, 1, NULL, '2019-08-08 13:58:38', '2019-08-08 13:58:38');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `res_table_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_waiter_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_order_status` enum('received','cooked','served') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('purchase','sell','expense','stock_adjustment','sell_transfer','purchase_transfer','opening_stock','sell_return','opening_balance','purchase_return') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('received','pending','ordered','draft','final') COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_quotation` tinyint(1) NOT NULL DEFAULT 0,
  `payment_status` enum('paid','due','partial') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_type` enum('normal','abnormal') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` int(11) UNSIGNED DEFAULT NULL,
  `customer_group_id` int(11) DEFAULT NULL COMMENT 'used to add customer group while selling',
  `invoice_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_date` datetime NOT NULL,
  `total_before_tax` decimal(20,2) NOT NULL DEFAULT 0.00,
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `discount_type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_details` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_charges` decimal(20,2) NOT NULL DEFAULT 0.00,
  `additional_notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `final_total` decimal(20,2) NOT NULL DEFAULT 0.00,
  `expense_category_id` int(10) UNSIGNED DEFAULT NULL,
  `expense_for` int(10) UNSIGNED DEFAULT NULL,
  `commission_agent` int(11) DEFAULT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_direct_sale` tinyint(1) NOT NULL DEFAULT 0,
  `exchange_rate` decimal(20,3) NOT NULL DEFAULT 1.000,
  `total_amount_recovered` decimal(20,2) DEFAULT NULL COMMENT 'Used for stock adjustment.',
  `transfer_parent_id` int(11) DEFAULT NULL,
  `return_parent_id` int(11) DEFAULT NULL,
  `opening_stock_product_id` int(11) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `pay_term_number` int(11) DEFAULT NULL,
  `pay_term_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `selling_price_group_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `shipping_details`, `shipping_charges`, `additional_notes`, `staff_note`, `final_total`, `expense_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL, NULL, 'opening_stock', 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, '2019-01-01 16:03:05', 15000000.00, NULL, 0.00, NULL, NULL, NULL, 0.00, NULL, NULL, 15000000.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '2019-01-24 11:03:05', '2019-01-24 11:03:05'),
(2, 1, 1, NULL, NULL, NULL, 'opening_stock', 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, '2019-01-01 16:03:52', 11000.00, NULL, 0.00, NULL, NULL, NULL, 0.00, NULL, NULL, 11000.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, '2019-01-24 11:03:52', '2019-01-24 11:03:52'),
(3, 1, 1, NULL, NULL, NULL, 'opening_stock', 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, '2019-01-01 16:04:10', 120000.00, NULL, 0.00, NULL, NULL, NULL, 0.00, NULL, NULL, 120000.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, 3, 1, NULL, NULL, NULL, '2019-01-24 11:04:10', '2019-01-24 11:04:10'),
(4, 1, 1, NULL, NULL, NULL, 'opening_stock', 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, '2019-01-01 16:04:26', 1000000.00, NULL, 0.00, NULL, NULL, NULL, 0.00, NULL, NULL, 1000000.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, 4, 1, NULL, NULL, NULL, '2019-01-24 11:04:26', '2019-01-24 11:04:26'),
(5, 1, 1, NULL, NULL, NULL, 'opening_stock', 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, '2019-01-01 16:04:44', 50000.00, NULL, 0.00, NULL, NULL, NULL, 0.00, NULL, NULL, 50000.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, 5, 1, NULL, NULL, NULL, '2019-01-24 11:04:44', '2019-01-24 11:04:44'),
(6, 1, 1, NULL, NULL, NULL, 'opening_stock', 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, '2019-01-01 16:06:32', 10000.00, NULL, 0.00, NULL, NULL, NULL, 0.00, NULL, NULL, 10000.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, 6, 1, NULL, NULL, NULL, '2019-01-24 11:06:32', '2019-01-24 11:06:32'),
(7, 1, 1, NULL, NULL, NULL, 'opening_stock', 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, '2019-01-01 16:07:17', 10000.00, NULL, 0.00, NULL, NULL, NULL, 0.00, NULL, NULL, 10000.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, 7, 1, NULL, NULL, NULL, '2019-01-24 11:07:17', '2019-01-24 11:07:18'),
(8, 1, 1, NULL, NULL, NULL, 'opening_stock', 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, '2019-01-01 16:07:33', 10000.00, NULL, 0.00, NULL, NULL, NULL, 0.00, NULL, NULL, 10000.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, 14, 1, NULL, NULL, NULL, '2019-01-24 11:07:33', '2019-01-24 11:07:33'),
(10, 1, 1, NULL, NULL, NULL, 'sell', 'draft', 1, NULL, NULL, 1, NULL, 'Lw0Dr', '', '2019-03-11 10:17:13', 375.00, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 375.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-03-11 05:17:13', '2019-03-11 05:17:13'),
(19, 1, 1, NULL, NULL, NULL, 'opening_stock', 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, '2018-06-01 23:20:26', 10000.00, NULL, 0.00, NULL, NULL, NULL, 0.00, NULL, NULL, 10000.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, 34, 1, NULL, NULL, NULL, '2019-05-30 03:20:26', '2019-05-30 03:20:26'),
(20, 1, 1, NULL, NULL, NULL, 'opening_stock', 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, '2018-06-01 20:42:02', 1750.00, NULL, 0.00, NULL, NULL, NULL, 0.00, NULL, NULL, 1750.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, 35, 1, NULL, NULL, NULL, '2019-05-31 00:42:02', '2019-08-02 18:32:26'),
(21, 1, 1, NULL, NULL, NULL, 'opening_stock', 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, '2018-06-01 20:47:53', 35000.00, NULL, 0.00, NULL, NULL, NULL, 0.00, NULL, NULL, 35000.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, 36, 1, NULL, NULL, NULL, '2019-05-31 00:47:53', '2019-08-02 18:32:12'),
(22, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0009', '', '2019-05-30 20:48:00', 700.00, NULL, 0.00, 'fixed', '100', NULL, 0.00, NULL, NULL, 600.00, NULL, NULL, NULL, NULL, 1, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-05-31 00:50:02', '2019-05-31 00:50:02'),
(23, 1, 1, NULL, NULL, NULL, 'stock_adjustment', 'received', 0, NULL, 'normal', NULL, NULL, NULL, 'SA2019/0001', '2019-05-30 00:00:00', 0.00, NULL, 0.00, NULL, NULL, NULL, 0.00, NULL, NULL, 700.00, NULL, NULL, NULL, NULL, 0, 1.000, 700.00, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2019-05-31 00:56:29', '2019-05-31 00:56:29'),
(24, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0010', '', '2019-07-02 15:04:47', 700.00, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 700.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 6, NULL, NULL, 0, '2019-07-02 19:04:47', '2019-07-02 19:04:47'),
(25, 1, 1, NULL, NULL, NULL, 'opening_stock', 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, '2019-06-01 14:20:05', 125000.00, NULL, 0.00, NULL, NULL, NULL, 0.00, NULL, NULL, 125000.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, 41, 1, NULL, NULL, NULL, '2019-08-02 18:20:05', '2019-08-04 18:13:56'),
(26, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0011', '', '2019-08-02 14:21:12', 5400.00, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 5400.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-02 18:21:12', '2019-08-02 18:21:13'),
(27, 1, 1, NULL, NULL, NULL, 'opening_stock', 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, '2019-06-01 14:31:52', 11000.00, NULL, 0.00, NULL, NULL, NULL, 0.00, NULL, NULL, 11000.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, 40, 1, NULL, NULL, NULL, '2019-08-02 18:31:52', '2019-08-02 18:31:52'),
(28, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0012', '', '2019-08-02 14:33:12', 3000.00, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 3000.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-02 18:33:12', '2019-08-02 18:33:13'),
(29, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 3, NULL, '0013', '', '2019-08-02 14:35:04', 4600.00, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 4600.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 'days', 0, '2019-08-02 18:35:05', '2019-08-02 18:35:06'),
(30, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 4, NULL, '0014', '', '2019-08-02 18:12:00', 700.00, NULL, 0.00, 'fixed', '10', NULL, 0.00, NULL, NULL, 690.00, NULL, NULL, NULL, NULL, 1, 1.000, NULL, NULL, NULL, NULL, 1, 1, 'days', 0, '2019-08-02 22:13:51', '2019-08-02 22:13:51'),
(31, 1, 1, NULL, NULL, NULL, 'purchase', 'pending', 0, 'partial', NULL, 2, NULL, NULL, 'PO2019/0001', '2019-08-04 00:00:00', 35000.00, NULL, 0.00, NULL, '0', NULL, 0.00, NULL, NULL, 35000.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2019-08-04 18:20:34', '2019-08-04 18:20:35'),
(32, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 3, NULL, '0015', '', '2019-08-04 14:33:13', 3400.00, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 3400.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 'days', 0, '2019-08-04 18:33:13', '2019-08-04 18:33:21'),
(33, 1, 1, NULL, NULL, NULL, 'opening_balance', 'final', 0, 'due', NULL, 5, NULL, NULL, '2019/0001', '2019-08-06 14:23:54', 5000.00, NULL, 0.00, NULL, NULL, NULL, 0.00, NULL, NULL, 5000.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2019-08-06 18:23:54', '2019-08-06 18:23:54'),
(34, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0016', '', '2019-08-06 15:34:19', 40600.00, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 40600.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-06 19:34:19', '2019-08-06 19:34:20'),
(35, 1, 1, NULL, NULL, NULL, 'sell', 'draft', 1, NULL, NULL, 1, NULL, '1Tbvq', '', '2019-08-06 15:53:09', 1800.00, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 1800.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, '2019-08-06 19:53:09', '2019-08-06 19:53:09'),
(36, 1, 1, NULL, NULL, NULL, 'purchase', 'received', 0, 'paid', NULL, 5, NULL, NULL, '25666', '2019-08-06 00:00:00', 1100.00, NULL, 0.00, NULL, '0', NULL, 0.00, NULL, NULL, 1100.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2019-08-06 20:08:09', '2019-08-09 13:29:06'),
(37, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0017', '', '2019-08-06 16:25:52', 3400.00, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 3400.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-06 20:25:52', '2019-08-06 20:25:52'),
(38, 1, 1, NULL, NULL, NULL, 'purchase', 'received', 0, 'paid', NULL, 5, NULL, NULL, 'PO2019/0003', '2019-08-08 00:00:00', 544.05, NULL, 0.00, NULL, '0', NULL, 0.00, NULL, NULL, 544.05, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2019-08-08 22:41:38', '2019-08-09 13:26:32'),
(39, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0018', '', '2019-08-08 19:23:10', 13065.00, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 13065.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-08 23:23:10', '2019-08-08 23:25:47'),
(40, 1, 1, NULL, NULL, NULL, 'opening_stock', 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, '2019-06-01 14:49:00', 23400.00, NULL, 0.00, NULL, NULL, NULL, 0.00, NULL, NULL, 23400.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, 65, 1, NULL, NULL, NULL, '2019-08-09 18:49:00', '2019-08-09 18:49:00'),
(41, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0019', '', '2019-08-09 17:30:20', 0.00, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 1.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-09 21:30:23', '2019-08-09 21:30:33'),
(42, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0020', '', '2019-08-09 17:31:27', 1325.61, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 1325.61, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-09 21:31:29', '2019-08-09 21:31:40'),
(43, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0021', '', '2019-08-09 17:32:20', 120.51, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 120.51, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-09 21:32:22', '2019-08-09 21:32:30'),
(44, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0022', '', '2019-08-09 17:36:46', 160.28, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 160.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-09 21:36:48', '2019-08-09 21:36:56'),
(45, 1, 1, NULL, NULL, NULL, 'purchase', 'received', 0, 'paid', NULL, 2, NULL, NULL, 'PO2019/0004', '2019-08-10 00:00:00', 28080.00, NULL, 0.00, NULL, '0', NULL, 0.00, NULL, NULL, 28080.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2019-08-10 16:45:22', '2019-08-10 16:47:17'),
(46, 1, 1, NULL, NULL, NULL, 'purchase', 'received', 0, 'paid', NULL, 2, NULL, NULL, 'PO2019/0005', '2019-08-10 00:00:00', 25740.00, NULL, 0.00, NULL, '0', NULL, 0.00, NULL, NULL, 25740.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2019-08-10 21:43:02', '2019-08-10 21:45:49'),
(47, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0023', '', '2019-08-10 19:55:23', 120.51, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 120.51, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-10 14:55:23', '2019-08-10 14:55:23'),
(48, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0024', '', '2019-08-10 19:57:33', 1325.61, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 1325.61, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-10 14:57:34', '2019-08-10 14:57:34'),
(49, 1, 1, NULL, NULL, NULL, 'opening_stock', 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, '2019-06-01 12:02:07', 58500.00, NULL, 0.00, NULL, NULL, NULL, 0.00, NULL, NULL, 58500.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, 66, 1, NULL, NULL, NULL, '2019-08-11 07:02:07', '2019-08-11 07:02:07'),
(50, 1, 1, NULL, NULL, NULL, 'purchase', 'received', 0, 'paid', NULL, 2, NULL, NULL, 'PO2019/0006', '2019-08-11 00:00:00', 1170.00, NULL, 0.00, NULL, '0', NULL, 0.00, NULL, NULL, 1170.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2019-08-11 09:19:17', '2019-08-11 09:19:36'),
(51, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0025', '', '2019-08-12 23:31:25', 3011.58, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 2971.58, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-12 18:31:25', '2019-08-12 18:31:25'),
(52, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0026', '', '2019-08-12 23:34:33', 120.51, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 120.51, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-12 18:34:33', '2019-08-12 18:34:33'),
(53, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0027', '', '2019-08-15 13:07:41', 120.51, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 120.51, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-15 08:07:41', '2019-08-15 08:07:41'),
(54, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0028', '', '2019-08-15 13:08:08', 120.51, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 120.51, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-15 08:08:08', '2019-08-15 08:08:08'),
(55, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0029', '', '2019-08-15 13:22:51', 120.51, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 120.51, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-15 08:22:51', '2019-08-15 08:22:51'),
(56, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0030', '', '2019-08-15 13:31:18', 120.51, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 120.51, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-15 08:31:18', '2019-08-15 08:31:18'),
(57, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0031', '', '2019-08-15 14:40:35', 120.51, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 120.51, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-15 09:40:35', '2019-08-15 09:40:36'),
(58, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0032', '', '2019-08-15 15:06:52', 241.02, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 241.02, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-15 10:06:52', '2019-08-15 10:06:52'),
(59, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0033', '', '2019-08-15 15:07:43', 241.02, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 241.02, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-15 10:07:43', '2019-08-15 10:07:43'),
(60, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0034', '', '2019-08-15 15:12:00', 241.02, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 241.02, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-15 10:12:00', '2019-08-15 10:12:00'),
(61, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0035', '', '2019-08-15 15:12:16', 120.51, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 120.51, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-15 10:12:16', '2019-08-15 10:12:16'),
(62, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0036', '', '2019-08-15 15:12:23', 120.51, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 120.51, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-15 10:12:23', '2019-08-15 10:12:23'),
(63, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0037', '', '2019-08-15 15:13:23', 120.51, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 120.51, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-15 10:13:23', '2019-08-15 10:13:24'),
(64, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0038', '', '2019-08-15 15:13:37', 120.51, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 120.51, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-15 10:13:37', '2019-08-15 10:13:37'),
(65, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0039', '', '2019-08-15 15:14:13', 1505.79, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 1505.79, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-15 10:14:13', '2019-08-15 10:14:13'),
(66, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0040', '', '2019-08-15 15:21:35', 1505.79, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 1505.79, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-15 10:21:35', '2019-08-15 10:21:35'),
(67, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0041', '', '2019-08-15 15:21:42', 1505.79, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 1505.79, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-15 10:21:42', '2019-08-15 10:21:42'),
(68, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0042', '', '2019-08-15 15:36:23', 1505.79, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 1505.79, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-15 10:36:23', '2019-08-15 10:36:23'),
(69, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0043', '', '2019-08-15 15:36:30', 1505.79, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 1505.79, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-15 10:36:30', '2019-08-15 10:36:30'),
(70, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0044', '', '2019-08-15 15:36:37', 1505.79, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 1505.79, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-15 10:36:37', '2019-08-15 10:36:37'),
(71, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0045', '', '2019-08-15 15:39:10', 1505.79, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 1505.79, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-15 10:39:10', '2019-08-15 10:39:10'),
(72, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0046', '', '2019-08-15 15:57:42', 3011.58, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 3011.58, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-15 10:57:42', '2019-08-15 10:57:42'),
(73, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0047', '', '2019-08-15 16:13:18', 120.51, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 120.51, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-15 11:13:18', '2019-08-15 11:13:18'),
(74, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0048', '', '2019-08-16 23:01:00', 1400.00, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 1400.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-16 18:01:00', '2019-08-16 18:01:01'),
(75, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0049', '', '2019-08-18 15:07:22', 1800.00, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 800.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-18 10:07:22', '2019-08-18 10:07:22'),
(76, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0050', '', '2019-08-18 15:08:46', 1600.00, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 600.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-18 10:08:46', '2019-08-18 10:08:46'),
(77, 1, 1, NULL, NULL, NULL, 'opening_stock', 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, '2019-06-01 09:48:16', 10881.00, NULL, 0.00, NULL, NULL, NULL, 0.00, NULL, NULL, 10881.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, 67, 1, NULL, NULL, NULL, '2019-08-21 04:48:16', '2019-08-21 04:48:16'),
(81, 1, 1, NULL, NULL, NULL, 'purchase', 'received', 0, 'paid', NULL, 5, NULL, NULL, 'PO2019/0007', '2019-08-21 00:00:00', 1533.15, NULL, 0.00, NULL, '0', NULL, 0.00, NULL, NULL, 1533.15, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2019-08-21 08:48:10', '2019-08-21 08:59:11'),
(82, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0051', '', '2019-08-21 14:34:11', 1022.10, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 1022.10, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-21 09:34:11', '2019-08-21 09:34:12'),
(83, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0052', '', '2019-08-21 14:43:50', 1022.10, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 1006.10, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-21 09:43:50', '2019-08-21 09:43:50'),
(84, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0053', '', '2019-08-21 14:47:10', 1022.10, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 1006.10, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-21 09:47:10', '2019-08-21 09:47:10'),
(85, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0054', '', '2019-08-21 16:13:46', 1022.10, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 1006.10, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-21 11:13:46', '2019-08-21 11:13:46'),
(86, 1, 1, NULL, NULL, NULL, 'purchase', 'received', 0, 'paid', NULL, 5, NULL, NULL, 'PO2019/0008', '2019-08-21 00:00:00', 1533.15, NULL, 0.00, NULL, '0', NULL, 0.00, NULL, NULL, 1533.15, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2019-08-21 12:41:21', '2019-08-21 12:41:21'),
(87, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0055', '', '2019-08-21 17:42:38', 1052.76, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 892.76, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-21 12:42:38', '2019-08-21 12:42:38'),
(88, 1, 1, NULL, NULL, NULL, 'opening_stock', 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, '2019-06-01 18:32:35', 105300.00, NULL, 0.00, NULL, NULL, NULL, 0.00, NULL, NULL, 105300.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, 69, 1, NULL, NULL, NULL, '2019-08-21 13:32:35', '2019-08-21 13:32:35'),
(89, 1, 1, NULL, NULL, NULL, 'purchase', 'received', 0, 'paid', NULL, 5, NULL, NULL, 'PO2019/0009', '2019-08-21 00:00:00', 2306.00, NULL, 0.00, NULL, '0', NULL, 0.00, NULL, NULL, 2306.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2019-08-21 13:35:37', '2019-08-21 13:35:37'),
(90, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0056', '', '2019-08-21 18:37:18', 2398.24, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 2318.24, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-21 13:37:18', '2019-08-21 13:37:19'),
(91, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 3, NULL, '0057', '', '2019-08-21 19:04:35', 1199.12, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 1199.12, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 'days', 0, '2019-08-21 14:04:35', '2019-08-21 14:04:35'),
(92, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 8, NULL, '0058', '', '2019-08-21 19:06:55', 1199.12, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 1199.12, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-21 14:06:55', '2019-08-21 14:06:55'),
(93, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'due', NULL, 1, NULL, '0059', '', '2019-08-25 12:29:06', 103.00, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 103.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-25 07:29:07', '2019-08-25 07:29:07'),
(94, 1, 1, NULL, NULL, NULL, 'opening_stock', 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, '2019-06-01 14:27:31', 5440.50, NULL, 0.00, NULL, NULL, NULL, 0.00, NULL, NULL, 5440.50, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, 70, 1, NULL, NULL, NULL, '2019-08-25 09:27:31', '2019-08-25 09:27:31'),
(95, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0060', '', '2019-08-25 14:28:37', 1052.76, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 1032.76, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-25 09:28:37', '2019-08-25 09:28:38'),
(97, 1, 1, NULL, NULL, NULL, 'purchase', 'pending', 0, 'paid', NULL, 5, NULL, NULL, 'PO2019/0010', '2019-08-25 00:00:00', 5110.50, NULL, 0.00, NULL, '0', NULL, 0.00, NULL, NULL, 5110.50, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2019-08-25 09:44:52', '2019-08-25 09:44:53'),
(98, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0062', '', '2019-08-25 14:46:37', 557.04, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 547.04, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-25 09:46:37', '2019-08-25 09:46:37'),
(99, 1, 1, NULL, NULL, NULL, 'purchase', 'received', 0, 'paid', NULL, 5, NULL, NULL, 'PO2019/0011', '2019-08-25 00:00:00', 1533.15, NULL, 0.00, NULL, '0', NULL, 0.00, NULL, NULL, 1533.15, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2019-08-25 10:26:10', '2019-08-25 10:26:10'),
(100, 1, 1, NULL, NULL, NULL, 'purchase', 'received', 0, 'paid', NULL, 5, NULL, NULL, 'PO2019/0012', '2019-08-25 00:00:00', 1533.15, NULL, 0.00, NULL, '0', NULL, 0.00, NULL, NULL, 1533.15, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2019-08-25 10:30:10', '2019-08-25 10:30:10'),
(101, 1, 1, NULL, NULL, NULL, 'purchase', 'received', 0, 'paid', NULL, 5, NULL, NULL, 'PO2019/0013', '2019-08-25 00:00:00', 1533.15, NULL, 0.00, NULL, '0', NULL, 0.00, NULL, NULL, 1533.15, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2019-08-25 10:37:35', '2019-08-25 10:37:35'),
(106, 1, 1, NULL, NULL, NULL, 'purchase', 'received', 0, 'paid', NULL, 5, NULL, NULL, 'PO2019/0014', '2019-08-25 00:00:00', 511.05, NULL, 0.00, NULL, '0', NULL, 0.00, NULL, NULL, 511.05, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2019-08-25 10:56:39', '2019-08-25 10:56:39'),
(109, 1, 1, NULL, NULL, NULL, 'purchase', 'received', 0, 'paid', NULL, 5, NULL, NULL, 'PO2019/0015', '2019-08-25 00:00:00', 511.05, NULL, 0.00, NULL, '0', NULL, 0.00, NULL, NULL, 511.05, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2019-08-25 11:06:31', '2019-08-25 11:32:52'),
(110, 1, 1, NULL, NULL, NULL, 'purchase', 'received', 0, 'paid', NULL, 5, NULL, NULL, 'PO2019/0016', '2019-08-25 00:00:00', 511.05, NULL, 0.00, NULL, '0', NULL, 0.00, NULL, NULL, 511.05, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2019-08-25 11:12:29', '2019-08-25 11:12:29'),
(111, 1, 1, NULL, NULL, NULL, 'purchase', 'received', 0, 'due', NULL, 5, NULL, NULL, 'PO2019/0017', '2019-08-25 00:00:00', 511.05, NULL, 0.00, NULL, '0', NULL, 0.00, NULL, NULL, 511.05, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2019-08-25 12:17:10', '2019-08-25 12:17:11'),
(112, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0063', '', '2019-08-25 17:20:27', 526.38, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 526.38, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-25 12:20:27', '2019-08-25 12:20:27'),
(113, 1, 1, NULL, NULL, NULL, 'opening_stock', 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, '2019-06-01 17:31:29', 27202.50, NULL, 0.00, NULL, NULL, NULL, 0.00, NULL, NULL, 27202.50, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, 71, 1, NULL, NULL, NULL, '2019-08-25 12:31:29', '2019-08-25 12:31:29'),
(114, 1, 1, NULL, NULL, NULL, 'purchase', 'pending', 0, 'due', NULL, 5, NULL, NULL, 'PO2019/0018', '2019-08-25 00:00:00', 511.05, NULL, 0.00, NULL, '0', NULL, 0.00, NULL, NULL, 511.05, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2019-08-25 12:35:45', '2019-08-25 12:35:45'),
(115, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0064', '', '2019-09-01 01:13:21', 412.00, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 172.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-31 20:13:21', '2019-09-01 09:42:13'),
(116, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0065', '', '2019-09-01 01:42:14', 1228.10, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 1156.10, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-08-31 20:42:14', '2019-09-01 11:53:48'),
(117, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0066', '', '2019-09-01 14:07:15', 103.00, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 103.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-09-01 09:07:15', '2019-09-01 09:10:33'),
(118, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0067', '', '2019-09-01 14:42:56', 1331.10, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 1241.10, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-09-01 09:42:56', '2019-09-01 09:44:31'),
(119, 1, 1, NULL, NULL, NULL, 'purchase', 'received', 0, 'paid', NULL, 2, NULL, NULL, 'PO2019/0019', '2019-09-01 00:00:00', 5110.50, NULL, 0.00, NULL, '0', NULL, 0.00, NULL, NULL, 5110.50, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2019-09-01 11:51:40', '2019-09-01 11:51:40'),
(120, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0068', '', '2019-09-01 16:52:53', 1062.98, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 982.98, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-09-01 11:52:53', '2019-09-01 11:52:54'),
(121, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0069', '', '2019-09-01 17:03:35', 537.68, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 537.68, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-09-01 12:03:35', '2019-09-01 12:03:35'),
(122, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0070', '', '2019-09-01 18:44:49', 537.68, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 467.68, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-09-01 13:44:49', '2019-09-01 13:55:32'),
(123, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0071', '', '2019-09-01 18:53:59', 537.68, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 517.68, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-09-01 13:53:59', '2019-09-01 13:53:59'),
(124, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0072', '', '2019-09-01 21:50:30', 1586.41, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 1448.41, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-09-01 16:50:30', '2019-09-01 16:50:30'),
(125, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0073', '', '2019-09-02 00:15:00', 537.68, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 477.68, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-09-01 19:15:36', '2019-09-01 19:15:36'),
(126, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0074', '', '2019-08-31 00:27:00', 537.68, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 537.68, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-09-01 19:28:13', '2019-09-01 19:28:13'),
(127, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0075', '', '2019-09-01 01:06:00', 537.68, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 537.68, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-09-01 19:40:19', '2019-09-01 20:15:24'),
(128, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0076', '', '2019-09-01 01:16:00', 103.00, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 103.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-09-01 20:17:21', '2019-09-01 20:17:22'),
(129, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'paid', NULL, 1, NULL, '0077', '', '2019-09-02 12:15:00', 103.00, NULL, 0.00, 'percentage', '0', NULL, 0.00, NULL, NULL, 13.00, NULL, NULL, NULL, NULL, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2019-09-02 19:15:47', '2019-09-02 19:15:47');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_payments`
--

CREATE TABLE `transaction_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(11) UNSIGNED DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  `is_return` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Used during sales to return the change',
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `method` enum('cash','card','cheque','bank_transfer','custom_pay_1','custom_pay_2','custom_pay_3','other') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_transaction_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_holder_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_month` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_year` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_security` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_on` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `payment_for` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_payments`
--

INSERT INTO `transaction_payments` (`id`, `transaction_id`, `business_id`, `is_return`, `amount`, `method`, `transaction_no`, `card_transaction_number`, `card_number`, `card_type`, `card_holder_name`, `card_month`, `card_year`, `card_security`, `cheque_number`, `bank_account_number`, `paid_on`, `created_by`, `payment_for`, `parent_id`, `note`, `payment_ref_no`, `account_id`, `created_at`, `updated_at`) VALUES
(3, 12, 1, 0, 125.00, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-22 21:59:51', 1, 1, NULL, NULL, 'SP2019/0003', NULL, '2019-04-22 16:59:51', '2019-04-22 16:59:51'),
(4, 13, 1, 0, 125.00, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-22 21:59:57', 1, 1, NULL, NULL, 'SP2019/0004', NULL, '2019-04-22 16:59:58', '2019-04-22 16:59:58'),
(5, 14, 1, 0, 125.00, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-22 22:00:03', 1, 1, NULL, NULL, 'SP2019/0005', NULL, '2019-04-22 17:00:03', '2019-04-22 17:00:03'),
(6, 15, 1, 0, 375.00, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-22 22:00:11', 1, 1, NULL, NULL, 'SP2019/0006', NULL, '2019-04-22 17:00:11', '2019-04-22 17:00:11'),
(7, 16, 1, 0, 500.00, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-22 22:12:56', 1, NULL, NULL, 's', '2019/0001', NULL, '2019-04-22 17:12:56', '2019-04-22 17:12:56'),
(8, 17, 1, 0, 125.00, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-05-21 12:29:40', 1, 1, NULL, NULL, 'SP2019/0007', NULL, '2019-05-21 16:29:40', '2019-05-21 16:29:40'),
(9, 18, 1, 0, 125.00, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-05-21 13:35:56', 1, 1, NULL, NULL, 'SP2019/0008', NULL, '2019-05-21 17:35:56', '2019-05-21 17:35:56'),
(10, 22, 1, 0, 600.00, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-05-30 20:50:02', 1, 1, NULL, NULL, 'SP2019/0009', NULL, '2019-05-31 00:50:02', '2019-05-31 00:50:02'),
(11, 24, 1, 0, 700.00, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-02 15:04:47', 6, 1, NULL, NULL, 'SP2019/0010', NULL, '2019-07-02 19:04:47', '2019-07-02 19:04:47'),
(12, 26, 1, 0, 5400.00, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-02 14:21:12', 1, 1, NULL, NULL, 'SP2019/0011', NULL, '2019-08-02 18:21:12', '2019-08-02 18:21:12'),
(13, 28, 1, 0, 3000.00, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-02 14:33:13', 1, 1, NULL, NULL, 'SP2019/0012', NULL, '2019-08-02 18:33:13', '2019-08-02 18:33:13'),
(14, 29, 1, 0, 4600.00, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-02 14:35:06', 1, 3, NULL, NULL, 'SP2019/0013', NULL, '2019-08-02 18:35:06', '2019-08-02 18:35:06'),
(15, 30, 1, 0, 690.00, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-02 18:13:51', 1, 4, NULL, NULL, 'SP2019/0014', NULL, '2019-08-02 22:13:51', '2019-08-02 22:13:51'),
(17, 31, 1, 0, 10000.00, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-04 14:20:34', 1, 2, NULL, NULL, 'PP2019/0002', NULL, '2019-08-04 18:20:34', '2019-08-04 18:20:34'),
(18, 32, 1, 0, 3400.00, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-04 14:33:21', 1, 3, NULL, NULL, 'SP2019/0015', NULL, '2019-08-04 18:33:21', '2019-08-04 18:33:21'),
(19, 34, 1, 0, 40600.00, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-06 15:34:20', 1, 1, NULL, NULL, 'SP2019/0016', NULL, '2019-08-06 19:34:20', '2019-08-06 19:34:20'),
(20, 37, 1, 0, 3400.00, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-06 16:25:52', 1, 1, NULL, NULL, 'SP2019/0017', NULL, '2019-08-06 20:25:52', '2019-08-06 20:25:52'),
(21, 39, 1, 0, 10000.00, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-08 19:23:10', 1, 1, NULL, NULL, 'SP2019/0018', NULL, '2019-08-08 23:23:10', '2019-08-08 23:23:10'),
(22, 39, 1, 0, 3065.00, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-08 19:25:47', 1, 1, NULL, NULL, 'SP2019/0019', NULL, '2019-08-08 23:25:47', '2019-08-08 23:25:47'),
(23, 38, 1, 0, 544.05, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-09 09:26:32', 1, 5, NULL, 'test', 'PP2019/0003', NULL, '2019-08-09 13:26:32', '2019-08-09 13:26:32'),
(24, 36, 1, 0, 1100.00, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-09 09:29:06', 1, 5, NULL, 'test', 'PP2019/0004', NULL, '2019-08-09 13:29:06', '2019-08-09 13:29:06'),
(25, 41, 1, 0, 1.00, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-09 17:30:26', 1, 1, NULL, NULL, 'SP2019/0020', NULL, '2019-08-09 21:30:28', '2019-08-09 21:30:28'),
(26, 42, 1, 0, 1325.61, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-09 17:31:33', 1, 1, NULL, NULL, 'SP2019/0021', NULL, '2019-08-09 21:31:34', '2019-08-09 21:31:34'),
(27, 43, 1, 0, 120.51, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-09 17:32:25', 1, 1, NULL, NULL, 'SP2019/0022', NULL, '2019-08-09 21:32:26', '2019-08-09 21:32:26'),
(28, 44, 1, 0, 160.00, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-09 17:36:51', 1, 1, NULL, NULL, 'SP2019/0023', NULL, '2019-08-09 21:36:52', '2019-08-09 21:36:52'),
(30, 45, 1, 0, 28080.00, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-10 12:45:31', 1, 2, NULL, NULL, 'PP2019/0006', NULL, '2019-08-10 16:45:32', '2019-08-10 16:45:32'),
(31, 46, 1, 0, 25740.00, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-10 17:43:11', 1, 2, NULL, NULL, 'PP2019/0007', NULL, '2019-08-10 21:43:13', '2019-08-10 21:43:13'),
(32, 47, 1, 0, 120.51, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-10 19:55:23', 1, 1, NULL, NULL, 'SP2019/0024', NULL, '2019-08-10 14:55:23', '2019-08-10 14:55:23'),
(33, 48, 1, 0, 1325.61, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-10 19:57:34', 1, 1, NULL, NULL, 'SP2019/0025', NULL, '2019-08-10 14:57:34', '2019-08-10 14:57:34'),
(34, 50, 1, 0, 1170.00, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-11 14:19:17', 1, 2, NULL, NULL, 'PP2019/0008', NULL, '2019-08-11 09:19:17', '2019-08-11 09:19:17'),
(35, 51, 1, 0, 2971.58, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-12 23:31:25', 1, 1, NULL, NULL, 'SP2019/0026', NULL, '2019-08-12 18:31:25', '2019-08-12 18:31:25'),
(36, 52, 1, 0, 120.51, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-12 23:34:33', 1, 1, NULL, NULL, 'SP2019/0027', NULL, '2019-08-12 18:34:33', '2019-08-12 18:34:33'),
(37, 53, 1, 0, 120.51, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-15 13:07:41', 1, 1, NULL, NULL, 'SP2019/0028', NULL, '2019-08-15 08:07:41', '2019-08-15 08:07:41'),
(38, 54, 1, 0, 120.51, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-15 13:08:08', 1, 1, NULL, NULL, 'SP2019/0029', NULL, '2019-08-15 08:08:08', '2019-08-15 08:08:08'),
(39, 55, 1, 0, 120.51, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-15 13:22:51', 1, 1, NULL, NULL, 'SP2019/0030', NULL, '2019-08-15 08:22:51', '2019-08-15 08:22:51'),
(40, 56, 1, 0, 120.51, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-15 13:31:18', 1, 1, NULL, NULL, 'SP2019/0031', NULL, '2019-08-15 08:31:18', '2019-08-15 08:31:18'),
(41, 57, 1, 0, 120.51, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-15 14:40:35', 1, 1, NULL, NULL, 'SP2019/0032', NULL, '2019-08-15 09:40:35', '2019-08-15 09:40:35'),
(42, 58, 1, 0, 241.02, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-15 15:06:52', 1, 1, NULL, NULL, 'SP2019/0033', NULL, '2019-08-15 10:06:52', '2019-08-15 10:06:52'),
(43, 59, 1, 0, 241.02, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-15 15:07:43', 1, 1, NULL, NULL, 'SP2019/0034', NULL, '2019-08-15 10:07:43', '2019-08-15 10:07:43'),
(44, 60, 1, 0, 241.02, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-15 15:12:00', 1, 1, NULL, NULL, 'SP2019/0035', NULL, '2019-08-15 10:12:00', '2019-08-15 10:12:00'),
(45, 61, 1, 0, 120.51, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-15 15:12:16', 1, 1, NULL, NULL, 'SP2019/0036', NULL, '2019-08-15 10:12:16', '2019-08-15 10:12:16'),
(46, 62, 1, 0, 120.51, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-15 15:12:23', 1, 1, NULL, NULL, 'SP2019/0037', NULL, '2019-08-15 10:12:23', '2019-08-15 10:12:23'),
(47, 63, 1, 0, 120.51, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-15 15:13:23', 1, 1, NULL, NULL, 'SP2019/0038', NULL, '2019-08-15 10:13:23', '2019-08-15 10:13:23'),
(48, 64, 1, 0, 120.51, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-15 15:13:37', 1, 1, NULL, NULL, 'SP2019/0039', NULL, '2019-08-15 10:13:37', '2019-08-15 10:13:37'),
(49, 65, 1, 0, 1505.79, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-15 15:14:13', 1, 1, NULL, NULL, 'SP2019/0040', NULL, '2019-08-15 10:14:13', '2019-08-15 10:14:13'),
(50, 66, 1, 0, 1505.79, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-15 15:21:35', 1, 1, NULL, NULL, 'SP2019/0041', NULL, '2019-08-15 10:21:35', '2019-08-15 10:21:35'),
(51, 67, 1, 0, 1505.79, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-15 15:21:42', 1, 1, NULL, NULL, 'SP2019/0042', NULL, '2019-08-15 10:21:42', '2019-08-15 10:21:42'),
(52, 68, 1, 0, 1505.79, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-15 15:36:23', 1, 1, NULL, NULL, 'SP2019/0043', NULL, '2019-08-15 10:36:23', '2019-08-15 10:36:23'),
(53, 69, 1, 0, 1505.79, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-15 15:36:30', 1, 1, NULL, NULL, 'SP2019/0044', NULL, '2019-08-15 10:36:30', '2019-08-15 10:36:30'),
(54, 70, 1, 0, 1505.79, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-15 15:36:37', 1, 1, NULL, NULL, 'SP2019/0045', NULL, '2019-08-15 10:36:37', '2019-08-15 10:36:37'),
(55, 71, 1, 0, 1505.79, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-15 15:39:10', 1, 1, NULL, NULL, 'SP2019/0046', NULL, '2019-08-15 10:39:10', '2019-08-15 10:39:10'),
(56, 72, 1, 0, 3011.58, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-15 15:57:42', 1, 1, NULL, NULL, 'SP2019/0047', NULL, '2019-08-15 10:57:42', '2019-08-15 10:57:42'),
(57, 73, 1, 0, 120.51, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-15 16:13:18', 1, 1, NULL, NULL, 'SP2019/0048', NULL, '2019-08-15 11:13:18', '2019-08-15 11:13:18'),
(58, 74, 1, 0, 1400.00, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-16 23:01:01', 1, 1, NULL, NULL, 'SP2019/0049', NULL, '2019-08-16 18:01:01', '2019-08-16 18:01:01'),
(59, 75, 1, 0, 800.00, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-18 15:07:22', 1, 1, NULL, NULL, 'SP2019/0050', NULL, '2019-08-18 10:07:22', '2019-08-18 10:07:22'),
(60, 76, 1, 0, 600.00, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-18 15:08:46', 1, 1, NULL, NULL, 'SP2019/0051', NULL, '2019-08-18 10:08:46', '2019-08-18 10:08:46'),
(61, 81, 1, 0, 1533.15, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-21 13:59:11', 1, 5, NULL, NULL, 'PP2019/0009', NULL, '2019-08-21 08:48:10', '2019-08-21 08:59:11'),
(62, 82, 1, 0, 1022.10, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-21 14:34:11', 1, 1, NULL, NULL, 'SP2019/0052', NULL, '2019-08-21 09:34:11', '2019-08-21 09:34:11'),
(63, 83, 1, 0, 1006.10, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-21 14:43:50', 1, 1, NULL, NULL, 'SP2019/0053', NULL, '2019-08-21 09:43:50', '2019-08-21 09:43:50'),
(64, 84, 1, 0, 1006.10, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-21 14:47:10', 1, 1, NULL, NULL, 'SP2019/0054', NULL, '2019-08-21 09:47:10', '2019-08-21 09:47:10'),
(65, 85, 1, 0, 1006.10, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-21 16:13:46', 1, 1, NULL, NULL, 'SP2019/0055', NULL, '2019-08-21 11:13:46', '2019-08-21 11:13:46'),
(66, 86, 1, 0, 1533.15, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-21 17:41:21', 1, 5, NULL, NULL, 'PP2019/0010', NULL, '2019-08-21 12:41:21', '2019-08-21 12:41:21'),
(67, 87, 1, 0, 892.76, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-21 17:42:38', 1, 1, NULL, NULL, 'SP2019/0056', NULL, '2019-08-21 12:42:38', '2019-08-21 12:42:38'),
(68, 89, 1, 0, 2306.00, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-21 18:35:37', 1, 5, NULL, NULL, 'PP2019/0011', NULL, '2019-08-21 13:35:37', '2019-08-21 13:35:37'),
(69, 90, 1, 0, 2318.24, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-21 18:37:18', 1, 1, NULL, NULL, 'SP2019/0057', NULL, '2019-08-21 13:37:18', '2019-08-21 13:37:18'),
(70, 91, 1, 0, 1199.12, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-21 19:04:35', 1, 3, NULL, NULL, 'SP2019/0058', NULL, '2019-08-21 14:04:35', '2019-08-21 14:04:35'),
(71, 92, 1, 0, 1199.12, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-21 19:06:55', 1, 8, NULL, NULL, 'SP2019/0059', NULL, '2019-08-21 14:06:55', '2019-08-21 14:06:55'),
(72, 95, 1, 0, 1032.76, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-25 14:28:38', 1, 1, NULL, NULL, 'SP2019/0060', NULL, '2019-08-25 09:28:38', '2019-08-25 09:28:38'),
(73, 97, 1, 0, 5110.50, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-25 14:44:53', 1, 5, NULL, NULL, 'PP2019/0012', NULL, '2019-08-25 09:44:53', '2019-08-25 09:44:53'),
(74, 98, 1, 0, 547.04, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-25 14:46:37', 1, 1, NULL, NULL, 'SP2019/0061', NULL, '2019-08-25 09:46:37', '2019-08-25 09:46:37'),
(75, 99, 1, 0, 1533.15, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-25 15:26:10', 1, 5, NULL, NULL, 'PP2019/0013', NULL, '2019-08-25 10:26:10', '2019-08-25 10:26:10'),
(76, 100, 1, 0, 1533.15, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-25 15:30:10', 1, 5, NULL, NULL, 'PP2019/0014', NULL, '2019-08-25 10:30:10', '2019-08-25 10:30:10'),
(77, 101, 1, 0, 1533.15, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-25 15:37:35', 1, 5, NULL, NULL, 'PP2019/0015', NULL, '2019-08-25 10:37:35', '2019-08-25 10:37:35'),
(80, 106, 1, 0, 511.05, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-25 15:56:39', 1, 5, NULL, NULL, 'PP2019/0016', NULL, '2019-08-25 10:56:39', '2019-08-25 10:56:39'),
(82, 109, 1, 0, 511.05, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-25 16:06:31', 1, 5, NULL, NULL, 'PP2019/0017', NULL, '2019-08-25 11:06:31', '2019-08-25 11:06:31'),
(83, 110, 1, 0, 511.05, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-25 16:12:29', 1, 5, NULL, NULL, 'PP2019/0018', NULL, '2019-08-25 11:12:29', '2019-08-25 11:12:29'),
(84, 112, 1, 0, 526.38, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-25 17:20:27', 1, 1, NULL, NULL, 'SP2019/0062', NULL, '2019-08-25 12:20:27', '2019-08-25 12:20:27'),
(85, 115, 1, 0, 172.00, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-01 01:13:21', 1, 1, NULL, NULL, 'SP2019/0063', NULL, '2019-08-31 20:13:21', '2019-09-01 09:42:13'),
(86, 116, 1, 0, 1160.10, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-01 01:42:14', 1, 1, NULL, NULL, 'SP2019/0064', NULL, '2019-08-31 20:42:14', '2019-09-01 11:53:48'),
(124, 117, 1, 0, 103.00, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-01 14:07:16', 1, 1, NULL, NULL, 'SP2019/0102', NULL, '2019-09-01 09:07:16', '2019-09-01 09:10:33'),
(128, 118, 1, 0, 1331.10, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-01 14:42:56', 1, 1, NULL, NULL, 'SP2019/0106', NULL, '2019-09-01 09:42:56', '2019-09-01 09:44:31'),
(129, 118, 1, 1, 90.00, 'cash', NULL, '', '', '', '', '', NULL, '', '', '', '2019-09-01 14:44:31', 1, 1, NULL, '', 'SP2019/0107', NULL, '2019-09-01 09:44:31', '2019-09-01 09:44:31'),
(130, 119, 1, 0, 5110.50, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-01 16:51:40', 1, 2, NULL, NULL, 'PP2019/0019', NULL, '2019-09-01 11:51:40', '2019-09-01 11:51:40'),
(131, 120, 1, 0, 982.98, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-01 16:52:53', 1, 1, NULL, NULL, 'SP2019/0108', NULL, '2019-09-01 11:52:53', '2019-09-01 11:52:53'),
(132, 116, 1, 1, 4.00, 'cash', NULL, '', '', '', '', '', NULL, '', '', '', '2019-09-01 16:53:48', 1, 1, NULL, '', 'SP2019/0109', NULL, '2019-09-01 11:53:48', '2019-09-01 11:53:48'),
(133, 121, 1, 0, 537.68, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-01 17:03:35', 1, 1, NULL, NULL, 'SP2019/0110', NULL, '2019-09-01 12:03:35', '2019-09-01 12:03:35'),
(134, 122, 1, 0, 477.68, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-01 18:44:49', 1, 1, NULL, NULL, 'SP2019/0111', NULL, '2019-09-01 13:44:49', '2019-09-01 13:44:49'),
(135, 123, 1, 0, 517.68, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-01 18:53:59', 1, 1, NULL, NULL, 'SP2019/0112', NULL, '2019-09-01 13:53:59', '2019-09-01 13:53:59'),
(136, 122, 1, 1, 10.00, 'cash', NULL, '', '', '', '', '', NULL, '', '', '', '2019-09-01 18:55:32', 1, 1, NULL, '', 'SP2019/0113', NULL, '2019-09-01 13:55:32', '2019-09-01 13:55:32'),
(137, 124, 1, 0, 1448.41, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-01 21:50:30', 1, 1, NULL, NULL, 'SP2019/0114', NULL, '2019-09-01 16:50:30', '2019-09-01 16:50:30'),
(138, 125, 1, 0, 477.68, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-02 00:15:36', 1, 1, NULL, NULL, 'SP2019/0115', NULL, '2019-09-01 19:15:36', '2019-09-01 19:15:36'),
(139, 126, 1, 0, 537.68, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-02 00:28:13', 1, 1, NULL, NULL, 'SP2019/0116', NULL, '2019-09-01 19:28:13', '2019-09-01 19:28:13'),
(140, 127, 1, 0, 537.68, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-02 00:40:19', 1, 1, NULL, NULL, 'SP2019/0117', NULL, '2019-09-01 19:40:19', '2019-09-01 19:40:19'),
(141, 128, 1, 0, 103.00, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-02 01:17:22', 1, 1, NULL, NULL, 'SP2019/0118', NULL, '2019-09-01 20:17:22', '2019-09-01 20:17:22'),
(142, 129, 1, 0, 13.00, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-02 12:15:47', 1, 1, NULL, NULL, 'SP2019/0119', NULL, '2019-09-02 19:15:47', '2019-09-02 19:15:47');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sell_lines`
--

CREATE TABLE `transaction_sell_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(20,4) NOT NULL,
  `quantity_returned` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `unit_price_before_discount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_price` decimal(20,2) DEFAULT NULL,
  `line_discount_type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line_discount_amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `unit_price_inc_tax` decimal(20,2) DEFAULT NULL,
  `item_tax` decimal(20,2) DEFAULT NULL,
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `lot_no_line_id` int(11) DEFAULT NULL,
  `sell_line_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_sell_line_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_to` float NOT NULL DEFAULT 0,
  `product_ato` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_sell_lines`
--

INSERT INTO `transaction_sell_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `quantity_returned`, `unit_price_before_discount`, `unit_price`, `line_discount_type`, `line_discount_amount`, `unit_price_inc_tax`, `item_tax`, `tax_id`, `lot_no_line_id`, `sell_line_note`, `parent_sell_line_id`, `created_at`, `updated_at`, `product_to`, `product_ato`) VALUES
(2, 10, 5, 5, 1.0000, 0.0000, 125.00, 125.00, 'fixed', 0.00, 125.00, 0.00, NULL, NULL, '', NULL, '2019-03-11 05:17:13', '2019-03-11 05:17:13', 0, 0),
(12, 22, 36, 36, 1.0000, 0.0000, 700.00, 700.00, 'fixed', 0.00, 700.00, 0.00, NULL, NULL, '', NULL, '2019-05-31 00:50:02', '2019-05-31 00:50:02', 0, 0),
(13, 24, 36, 36, 1.0000, 0.0000, 700.00, 700.00, 'fixed', 0.00, 700.00, 0.00, NULL, NULL, '', NULL, '2019-07-02 19:04:47', '2019-07-02 19:04:47', 0, 0),
(14, 26, 41, 41, 3.0000, 0.0000, 1800.00, 1800.00, 'fixed', 0.00, 1800.00, 0.00, NULL, NULL, '', NULL, '2019-08-02 18:21:12', '2019-08-02 18:21:12', 0, 0),
(15, 28, 40, 40, 1.0000, 0.0000, 1600.00, 1600.00, 'fixed', 0.00, 1600.00, 0.00, NULL, NULL, '', NULL, '2019-08-02 18:33:12', '2019-08-02 18:33:12', 0, 0),
(16, 28, 36, 36, 1.0000, 0.0000, 700.00, 700.00, 'fixed', 0.00, 700.00, 0.00, NULL, NULL, '', NULL, '2019-08-02 18:33:12', '2019-08-02 18:33:12', 0, 0),
(17, 28, 35, 35, 1.0000, 0.0000, 700.00, 700.00, 'fixed', 0.00, 700.00, 0.00, NULL, NULL, '', NULL, '2019-08-02 18:33:12', '2019-08-02 18:33:12', 0, 0),
(18, 29, 40, 40, 2.0000, 0.0000, 1600.00, 1600.00, 'fixed', 0.00, 1600.00, 0.00, NULL, NULL, '', NULL, '2019-08-02 18:35:05', '2019-08-02 18:35:05', 0, 0),
(19, 29, 36, 36, 1.0000, 0.0000, 700.00, 700.00, 'fixed', 0.00, 700.00, 0.00, NULL, NULL, '', NULL, '2019-08-02 18:35:05', '2019-08-02 18:35:05', 0, 0),
(20, 29, 35, 35, 1.0000, 0.0000, 700.00, 700.00, 'fixed', 0.00, 700.00, 0.00, NULL, NULL, '', NULL, '2019-08-02 18:35:05', '2019-08-02 18:35:05', 0, 0),
(21, 30, 35, 35, 1.0000, 0.0000, 700.00, 700.00, 'fixed', 0.00, 700.00, 0.00, NULL, NULL, '', NULL, '2019-08-02 22:13:51', '2019-08-02 22:13:51', 0, 0),
(22, 32, 41, 41, 1.0000, 0.0000, 1800.00, 1800.00, 'fixed', 0.00, 1800.00, 0.00, NULL, NULL, '', NULL, '2019-08-04 18:33:16', '2019-08-04 18:33:16', 0, 0),
(23, 32, 40, 40, 1.0000, 0.0000, 1600.00, 1600.00, 'fixed', 0.00, 1600.00, 0.00, NULL, NULL, '', NULL, '2019-08-04 18:33:21', '2019-08-04 18:33:21', 0, 0),
(24, 34, 41, 41, 20.0000, 0.0000, 1800.00, 1800.00, 'fixed', 0.00, 1800.00, 0.00, NULL, NULL, '', NULL, '2019-08-06 19:34:19', '2019-08-06 19:34:19', 0, 0),
(25, 34, 40, 40, 2.0000, 0.0000, 1600.00, 1600.00, 'fixed', 0.00, 1600.00, 0.00, NULL, NULL, '', NULL, '2019-08-06 19:34:19', '2019-08-06 19:34:19', 0, 0),
(26, 34, 36, 36, 1.0000, 0.0000, 700.00, 700.00, 'fixed', 0.00, 700.00, 0.00, NULL, NULL, '', NULL, '2019-08-06 19:34:19', '2019-08-06 19:34:19', 0, 0),
(27, 34, 35, 35, 1.0000, 0.0000, 700.00, 700.00, 'fixed', 0.00, 700.00, 0.00, NULL, NULL, '', NULL, '2019-08-06 19:34:19', '2019-08-06 19:34:19', 0, 0),
(28, 35, 41, 41, 1.0000, 0.0000, 1800.00, 1800.00, 'fixed', 0.00, 1800.00, 0.00, NULL, NULL, '', NULL, '2019-08-06 19:53:09', '2019-08-06 19:53:09', 0, 0),
(29, 37, 41, 41, 1.0000, 0.0000, 1800.00, 1800.00, 'fixed', 0.00, 1800.00, 0.00, NULL, NULL, '', NULL, '2019-08-06 20:25:52', '2019-08-06 20:25:52', 0, 0),
(30, 37, 40, 40, 1.0000, 0.0000, 1600.00, 1600.00, 'fixed', 0.00, 1600.00, 0.00, NULL, NULL, '', NULL, '2019-08-06 20:25:52', '2019-08-06 20:25:52', 0, 0),
(31, 39, 64, 64, 1.0000, 0.0000, 465.00, 465.00, 'fixed', 0.00, 465.00, 0.00, NULL, NULL, '', NULL, '2019-08-08 23:23:10', '2019-08-08 23:23:10', 0, 0),
(32, 39, 41, 41, 7.0000, 0.0000, 1800.00, 1800.00, 'fixed', 0.00, 1800.00, 0.00, NULL, NULL, '', NULL, '2019-08-08 23:23:10', '2019-08-08 23:23:10', 0, 0),
(33, 41, 62, 62, 0.0000, 0.0000, 1133.00, 1133.00, 'fixed', 0.00, 1325.61, 192.61, 2, NULL, '', NULL, '2019-08-09 21:30:24', '2019-08-09 21:30:24', 0, 0),
(34, 42, 62, 62, 1.0000, 0.0000, 1133.00, 1133.00, 'fixed', 0.00, 1325.61, 192.61, 2, NULL, '', NULL, '2019-08-09 21:31:31', '2019-08-09 21:31:31', 0, 0),
(35, 43, 65, 65, 1.0000, 0.0000, 103.00, 103.00, 'fixed', 0.00, 120.51, 17.51, 1, NULL, '', NULL, '2019-08-09 21:32:23', '2019-08-09 21:32:23', 0, 0),
(36, 44, 65, 65, 1.3300, 0.0000, 103.00, 103.00, 'fixed', 0.00, 120.51, 17.51, 1, NULL, '', NULL, '2019-08-09 21:36:49', '2019-08-09 21:36:49', 0, 0),
(37, 47, 65, 65, 1.0000, 0.0000, 103.00, 103.00, 'fixed', 0.00, 120.51, 17.51, 1, NULL, '', NULL, '2019-08-10 14:55:23', '2019-08-10 14:55:23', 0, 0),
(38, 48, 62, 62, 1.0000, 0.0000, 1133.00, 1133.00, 'fixed', 0.00, 1325.61, 192.61, 2, NULL, '', NULL, '2019-08-10 14:57:34', '2019-08-10 14:57:34', 0, 0),
(39, 51, 66, 66, 2.0000, 0.0000, 1287.00, 1287.00, 'fixed', 0.00, 1505.79, 218.79, 2, NULL, '', NULL, '2019-08-12 18:31:25', '2019-08-12 18:31:25', 2, 0),
(40, 52, 65, 65, 1.0000, 0.0000, 103.00, 103.00, 'fixed', 0.00, 120.51, 17.51, 1, NULL, '', NULL, '2019-08-12 18:34:33', '2019-08-12 18:34:33', 0, 0),
(41, 53, 65, 65, 1.0000, 0.0000, 103.00, 103.00, 'fixed', 0.00, 120.51, 17.51, 1, NULL, '', NULL, '2019-08-15 08:07:41', '2019-08-15 08:07:41', 0, 0),
(42, 54, 65, 65, 1.0000, 0.0000, 103.00, 103.00, 'fixed', 0.00, 120.51, 17.51, 1, NULL, '', NULL, '2019-08-15 08:08:08', '2019-08-15 08:08:08', 0, 0),
(43, 55, 65, 65, 1.0000, 0.0000, 103.00, 103.00, 'fixed', 0.00, 120.51, 17.51, 1, NULL, '', NULL, '2019-08-15 08:22:51', '2019-08-15 08:22:51', 0, 0),
(44, 56, 65, 65, 1.0000, 0.0000, 103.00, 103.00, 'fixed', 0.00, 120.51, 17.51, 1, NULL, '', NULL, '2019-08-15 08:31:18', '2019-08-15 08:31:18', 0, 0),
(45, 57, 65, 65, 1.0000, 0.0000, 103.00, 103.00, 'fixed', 0.00, 120.51, 17.51, 1, NULL, '', NULL, '2019-08-15 09:40:35', '2019-08-15 09:40:35', 0, 0),
(46, 58, 65, 65, 2.0000, 0.0000, 103.00, 103.00, 'fixed', 0.00, 120.51, 17.51, 1, NULL, '', NULL, '2019-08-15 10:06:52', '2019-08-15 10:06:52', 0, 0),
(47, 59, 65, 65, 2.0000, 0.0000, 103.00, 103.00, 'fixed', 0.00, 120.51, 17.51, 1, NULL, '', NULL, '2019-08-15 10:07:43', '2019-08-15 10:07:43', 0, 0),
(48, 60, 65, 65, 2.0000, 0.0000, 103.00, 103.00, 'fixed', 0.00, 120.51, 17.51, 1, NULL, '', NULL, '2019-08-15 10:12:00', '2019-08-15 10:12:00', 0, 0),
(49, 61, 65, 65, 1.0000, 0.0000, 103.00, 103.00, 'fixed', 0.00, 120.51, 17.51, 1, NULL, '', NULL, '2019-08-15 10:12:16', '2019-08-15 10:12:16', 0, 0),
(50, 62, 65, 65, 1.0000, 0.0000, 103.00, 103.00, 'fixed', 0.00, 120.51, 17.51, 1, NULL, '', NULL, '2019-08-15 10:12:23', '2019-08-15 10:12:23', 0, 0),
(51, 63, 65, 65, 1.0000, 0.0000, 103.00, 103.00, 'fixed', 0.00, 120.51, 17.51, 1, NULL, '', NULL, '2019-08-15 10:13:23', '2019-08-15 10:13:23', 0, 0),
(52, 64, 65, 65, 1.0000, 0.0000, 103.00, 103.00, 'fixed', 0.00, 120.51, 17.51, 1, NULL, '', NULL, '2019-08-15 10:13:37', '2019-08-15 10:13:37', 0, 0),
(53, 65, 66, 66, 1.0000, 0.0000, 1287.00, 1287.00, 'fixed', 0.00, 1505.79, 218.79, 2, NULL, '', NULL, '2019-08-15 10:14:13', '2019-08-15 10:14:13', 0, 0),
(54, 66, 66, 66, 1.0000, 0.0000, 1287.00, 1287.00, 'fixed', 0.00, 1505.79, 218.79, 2, NULL, '', NULL, '2019-08-15 10:21:35', '2019-08-15 10:21:35', 0, 0),
(55, 67, 66, 66, 1.0000, 0.0000, 1287.00, 1287.00, 'fixed', 0.00, 1505.79, 218.79, 2, NULL, '', NULL, '2019-08-15 10:21:42', '2019-08-15 10:21:42', 0, 0),
(56, 68, 66, 66, 1.0000, 0.0000, 1287.00, 1287.00, 'fixed', 0.00, 1505.79, 218.79, 2, NULL, '', NULL, '2019-08-15 10:36:23', '2019-08-15 10:36:23', 0, 0),
(57, 69, 66, 66, 1.0000, 0.0000, 1287.00, 1287.00, 'fixed', 0.00, 1505.79, 218.79, 2, NULL, '', NULL, '2019-08-15 10:36:30', '2019-08-15 10:36:30', 0, 0),
(58, 70, 66, 66, 1.0000, 0.0000, 1287.00, 1287.00, 'fixed', 0.00, 1505.79, 218.79, 2, NULL, '', NULL, '2019-08-15 10:36:37', '2019-08-15 10:36:37', 0, 0),
(59, 71, 66, 66, 1.0000, 0.0000, 1287.00, 1287.00, 'fixed', 0.00, 1505.79, 218.79, 2, NULL, '', NULL, '2019-08-15 10:39:10', '2019-08-15 10:39:10', 0, 0),
(60, 72, 66, 66, 2.0000, 0.0000, 1287.00, 1287.00, 'fixed', 0.00, 1505.79, 218.79, 2, NULL, '', NULL, '2019-08-15 10:57:42', '2019-08-15 10:57:42', 0, 0),
(61, 73, 65, 65, 1.0000, 0.0000, 103.00, 103.00, 'fixed', 0.00, 120.51, 17.51, 1, NULL, '', NULL, '2019-08-15 11:13:18', '2019-08-15 11:13:18', 0, 0),
(62, 74, 36, 36, 2.0000, 0.0000, 700.00, 700.00, 'fixed', 0.00, 700.00, 0.00, NULL, NULL, '', NULL, '2019-08-16 18:01:01', '2019-08-16 18:01:01', 0, 0),
(63, 75, 41, 41, 1.0000, 0.0000, 1800.00, 1800.00, 'fixed', 0.00, 1800.00, 0.00, NULL, NULL, '', NULL, '2019-08-18 10:07:22', '2019-08-18 10:07:22', 10, 0),
(64, 76, 40, 40, 1.0000, 0.0000, 1367.52, 1367.52, 'fixed', 0.00, 1600.00, 232.48, 1, NULL, '', NULL, '2019-08-18 10:08:46', '2019-08-18 10:08:46', 10, 0),
(65, 82, 67, 67, 2.0000, 0.0000, 511.05, 511.05, 'fixed', 0.00, 511.05, 0.00, 1, NULL, '', NULL, '2019-08-21 09:34:11', '2019-08-21 09:34:11', 0, 0),
(66, 83, 67, 67, 2.0000, 0.0000, 511.05, 511.05, 'fixed', 0.00, 511.05, 0.00, 1, NULL, '', NULL, '2019-08-21 09:43:50', '2019-08-21 09:43:50', 2, 0),
(67, 84, 67, 67, 2.0000, 0.0000, 511.05, 511.05, 'fixed', 0.00, 511.05, 0.00, 1, NULL, '', NULL, '2019-08-21 09:47:10', '2019-08-21 09:47:10', 2, 2),
(68, 85, 67, 67, 2.0000, 0.0000, 511.05, 511.05, 'fixed', 0.00, 511.05, 0.00, 1, NULL, '', NULL, '2019-08-21 11:13:46', '2019-08-21 11:13:46', 2, 2),
(69, 87, 68, 68, 2.0000, 0.0000, 526.38, 526.38, 'fixed', 0.00, 526.38, 0.00, 1, NULL, '', NULL, '2019-08-21 12:42:38', '2019-08-21 12:42:38', 2, 2),
(70, 90, 69, 69, 2.0000, 0.0000, 1199.12, 1199.12, 'fixed', 0.00, 1199.12, 0.00, 1, NULL, '', NULL, '2019-08-21 13:37:18', '2019-08-21 13:37:18', 2, 2),
(71, 91, 69, 69, 1.0000, 0.0000, 1199.12, 1199.12, 'fixed', 0.00, 1199.12, 0.00, 1, NULL, '', NULL, '2019-08-21 14:04:35', '2019-08-21 14:04:35', 0, 0),
(72, 92, 69, 69, 1.0000, 0.0000, 1199.12, 1199.12, 'fixed', 0.00, 1199.12, 0.00, 1, NULL, '', NULL, '2019-08-21 14:06:55', '2019-08-21 14:06:55', 0, 0),
(73, 93, 65, 65, 1.0000, 0.0000, 103.00, 103.00, 'fixed', 0.00, 103.00, 0.00, 1, NULL, '', NULL, '2019-08-25 07:29:07', '2019-08-25 07:29:07', 0, 0),
(74, 95, 70, 70, 2.0000, 0.0000, 526.38, 526.38, 'fixed', 0.00, 526.38, 0.00, 1, NULL, '', NULL, '2019-08-25 09:28:38', '2019-08-25 09:28:38', 2, 0),
(76, 98, 70, 70, 1.0000, 0.0000, 557.04, 557.04, 'fixed', 0.00, 557.04, 0.00, 1, NULL, '', NULL, '2019-08-25 09:46:37', '2019-08-25 09:46:37', 2, 0),
(77, 112, 71, 71, 1.0000, 0.0000, 526.38, 526.38, 'fixed', 0.00, 526.38, 0.00, 1, NULL, '', NULL, '2019-08-25 12:20:27', '2019-08-25 12:20:27', 0, 0),
(78, 115, 65, 65, 4.0000, 0.0000, 103.00, 103.00, 'fixed', 0.00, 103.00, 0.00, 1, NULL, '', NULL, '2019-08-31 20:13:21', '2019-09-01 09:42:13', 2, 2),
(79, 116, 65, 65, 2.0000, 0.0000, 103.00, 103.00, 'fixed', 0.00, 103.00, 0.00, 1, NULL, '', NULL, '2019-08-31 20:42:14', '2019-09-01 11:53:48', 2, 0),
(80, 116, 67, 67, 2.0000, 0.0000, 511.05, 511.05, 'fixed', 0.00, 511.05, 0.00, 1, NULL, '', NULL, '2019-08-31 20:42:14', '2019-09-01 11:53:48', 3, 0),
(81, 117, 65, 65, 1.0000, 0.0000, 103.00, 103.00, 'fixed', 0.00, 103.00, 0.00, 1, NULL, '', NULL, '2019-09-01 09:07:15', '2019-09-01 09:10:33', 0, 0),
(82, 118, 65, 65, 3.0000, 0.0000, 103.00, 103.00, 'fixed', 0.00, 103.00, 0.00, 1, NULL, '', NULL, '2019-09-01 09:42:56', '2019-09-01 09:44:31', 2, 0),
(83, 118, 67, 67, 2.0000, 0.0000, 511.05, 511.05, 'fixed', 0.00, 511.05, 0.00, 1, NULL, '', NULL, '2019-09-01 09:43:37', '2019-09-01 09:44:31', 0, 0),
(84, 120, 72, 72, 2.0000, 0.0000, 531.49, 531.49, 'fixed', 0.00, 531.49, 0.00, 1, NULL, '', NULL, '2019-09-01 11:52:53', '2019-09-01 11:52:53', 2, 2),
(85, 121, 72, 72, 1.0000, 0.0000, 537.68, 537.68, 'fixed', 0.00, 537.68, 0.00, 1, NULL, '', NULL, '2019-09-01 12:03:35', '2019-09-01 12:03:35', 0, 0),
(86, 122, 72, 72, 1.0000, 0.0000, 537.68, 537.68, NULL, 2.00, 537.68, 10.75, 1, NULL, '', NULL, '2019-09-01 13:44:49', '2019-09-01 13:55:32', 2, 3),
(87, 123, 72, 72, 1.0000, 0.0000, 537.68, 537.68, NULL, 2.00, 537.68, 0.00, 1, NULL, '', NULL, '2019-09-01 13:53:59', '2019-09-01 13:53:59', 2, 0),
(88, 124, 72, 72, 2.0000, 0.0000, 537.68, 537.68, NULL, 2.00, 537.68, 10.75, 1, NULL, '', NULL, '2019-09-01 16:50:30', '2019-09-01 16:50:30', 2, 2),
(89, 124, 67, 67, 1.0000, 0.0000, 511.05, 511.05, NULL, 3.00, 511.05, 15.33, 1, NULL, '', NULL, '2019-09-01 16:50:30', '2019-09-01 16:50:30', 3, 3),
(90, 125, 72, 72, 1.0000, 0.0000, 537.68, 537.68, NULL, 2.00, 537.68, 10.75, 1, NULL, '', NULL, '2019-09-01 19:15:36', '2019-09-01 19:15:36', 2, 2),
(91, 126, 72, 72, 1.0000, 0.0000, 537.68, 537.68, NULL, 0.00, 537.68, 0.00, 1, NULL, '', NULL, '2019-09-01 19:28:13', '2019-09-01 19:28:13', 0, 0),
(92, 127, 72, 72, 1.0000, 0.0000, 537.68, 537.68, NULL, 0.00, 537.68, 0.00, 1, NULL, '', NULL, '2019-09-01 19:40:19', '2019-09-01 20:15:23', 0, 0),
(93, 128, 65, 65, 1.0000, 0.0000, 103.00, 103.00, NULL, 0.00, 103.00, 0.00, 1, NULL, '', NULL, '2019-09-01 20:17:22', '2019-09-01 20:17:22', 0, 0),
(94, 129, 65, 65, 1.0000, 0.0000, 103.00, 103.00, NULL, 2.00, 103.00, 2.06, 1, NULL, '', NULL, '2019-09-02 19:15:47', '2019-09-02 19:15:47', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sell_lines_purchase_lines`
--

CREATE TABLE `transaction_sell_lines_purchase_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `sell_line_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'id from transaction_sell_lines',
  `stock_adjustment_line_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'id from stock_adjustment_lines',
  `purchase_line_id` int(10) UNSIGNED NOT NULL COMMENT 'id from purchase_lines',
  `quantity` decimal(20,4) NOT NULL,
  `qty_returned` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_sell_lines_purchase_lines`
--

INSERT INTO `transaction_sell_lines_purchase_lines` (`id`, `sell_line_id`, `stock_adjustment_line_id`, `purchase_line_id`, `quantity`, `qty_returned`, `created_at`, `updated_at`) VALUES
(9, 12, NULL, 13, 1.0000, 0.0000, '2019-05-31 00:50:02', '2019-05-31 00:50:02'),
(10, NULL, 1, 12, 1.0000, 0.0000, '2019-05-31 00:56:29', '2019-05-31 00:56:29'),
(11, 13, NULL, 13, 1.0000, 0.0000, '2019-07-02 19:04:48', '2019-07-02 19:04:48'),
(12, 14, NULL, 14, 3.0000, 0.0000, '2019-08-02 18:21:13', '2019-08-02 18:21:13'),
(13, 15, NULL, 15, 1.0000, 0.0000, '2019-08-02 18:33:14', '2019-08-02 18:33:14'),
(14, 16, NULL, 13, 1.0000, 0.0000, '2019-08-02 18:33:14', '2019-08-02 18:33:14'),
(15, 17, NULL, 12, 1.0000, 0.0000, '2019-08-02 18:33:14', '2019-08-02 18:33:14'),
(16, 18, NULL, 15, 2.0000, 0.0000, '2019-08-02 18:35:06', '2019-08-02 18:35:06'),
(17, 19, NULL, 13, 1.0000, 0.0000, '2019-08-02 18:35:06', '2019-08-02 18:35:06'),
(18, 20, NULL, 12, 1.0000, 0.0000, '2019-08-02 18:35:07', '2019-08-02 18:35:07'),
(19, 21, NULL, 12, 1.0000, 0.0000, '2019-08-02 22:13:51', '2019-08-02 22:13:51'),
(20, 22, NULL, 14, 1.0000, 0.0000, '2019-08-04 18:33:21', '2019-08-04 18:33:21'),
(21, 23, NULL, 15, 1.0000, 0.0000, '2019-08-04 18:33:21', '2019-08-04 18:33:21'),
(22, 24, NULL, 14, 20.0000, 0.0000, '2019-08-06 19:34:20', '2019-08-06 19:34:20'),
(23, 25, NULL, 15, 2.0000, 0.0000, '2019-08-06 19:34:20', '2019-08-06 19:34:20'),
(24, 26, NULL, 13, 1.0000, 0.0000, '2019-08-06 19:34:20', '2019-08-06 19:34:20'),
(25, 27, NULL, 12, 1.0000, 0.0000, '2019-08-06 19:34:20', '2019-08-06 19:34:20'),
(26, 29, NULL, 14, 1.0000, 0.0000, '2019-08-06 20:25:52', '2019-08-06 20:25:52'),
(27, 30, NULL, 15, 1.0000, 0.0000, '2019-08-06 20:25:52', '2019-08-06 20:25:52'),
(28, 31, NULL, 19, 1.0000, 0.0000, '2019-08-08 23:23:10', '2019-08-08 23:23:10'),
(29, 32, NULL, 14, 7.0000, 0.0000, '2019-08-08 23:23:11', '2019-08-08 23:23:11'),
(30, 33, NULL, 18, 0.0000, 0.0000, '2019-08-09 21:30:36', '2019-08-09 21:30:36'),
(31, 34, NULL, 18, 1.0000, 0.0000, '2019-08-09 21:31:43', '2019-08-09 21:31:43'),
(32, 35, NULL, 20, 1.0000, 0.0000, '2019-08-09 21:32:32', '2019-08-09 21:32:32'),
(33, 36, NULL, 20, 1.3300, 0.0000, '2019-08-09 21:36:58', '2019-08-09 21:36:58'),
(34, 37, NULL, 20, 1.0000, 0.0000, '2019-08-10 14:55:23', '2019-08-10 14:55:23'),
(35, 38, NULL, 22, 1.0000, 0.0000, '2019-08-10 14:57:34', '2019-08-10 14:57:34'),
(36, 39, NULL, 24, 2.0000, 0.0000, '2019-08-12 18:31:25', '2019-08-12 18:31:25'),
(37, 40, NULL, 20, 1.0000, 0.0000, '2019-08-12 18:34:33', '2019-08-12 18:34:33'),
(38, 41, NULL, 20, 1.0000, 0.0000, '2019-08-15 08:07:41', '2019-08-15 08:07:41'),
(39, 42, NULL, 20, 1.0000, 0.0000, '2019-08-15 08:08:08', '2019-08-15 08:08:08'),
(40, 43, NULL, 20, 1.0000, 0.0000, '2019-08-15 08:22:51', '2019-08-15 08:22:51'),
(41, 44, NULL, 20, 1.0000, 0.0000, '2019-08-15 08:31:18', '2019-08-15 08:31:18'),
(42, 45, NULL, 20, 1.0000, 0.0000, '2019-08-15 09:40:36', '2019-08-15 09:40:36'),
(43, 46, NULL, 20, 2.0000, 0.0000, '2019-08-15 10:06:52', '2019-08-15 10:06:52'),
(44, 47, NULL, 20, 2.0000, 0.0000, '2019-08-15 10:07:43', '2019-08-15 10:07:43'),
(45, 48, NULL, 20, 2.0000, 0.0000, '2019-08-15 10:12:00', '2019-08-15 10:12:00'),
(46, 49, NULL, 20, 1.0000, 0.0000, '2019-08-15 10:12:16', '2019-08-15 10:12:16'),
(47, 50, NULL, 20, 1.0000, 0.0000, '2019-08-15 10:12:23', '2019-08-15 10:12:23'),
(48, 51, NULL, 20, 1.0000, 0.0000, '2019-08-15 10:13:24', '2019-08-15 10:13:24'),
(49, 52, NULL, 20, 1.0000, 0.0000, '2019-08-15 10:13:37', '2019-08-15 10:13:37'),
(50, 53, NULL, 24, 1.0000, 0.0000, '2019-08-15 10:14:13', '2019-08-15 10:14:13'),
(51, 54, NULL, 24, 1.0000, 0.0000, '2019-08-15 10:21:35', '2019-08-15 10:21:35'),
(52, 55, NULL, 24, 1.0000, 0.0000, '2019-08-15 10:21:42', '2019-08-15 10:21:42'),
(53, 56, NULL, 24, 1.0000, 0.0000, '2019-08-15 10:36:23', '2019-08-15 10:36:23'),
(54, 57, NULL, 24, 1.0000, 0.0000, '2019-08-15 10:36:30', '2019-08-15 10:36:30'),
(55, 58, NULL, 24, 1.0000, 0.0000, '2019-08-15 10:36:37', '2019-08-15 10:36:37'),
(56, 59, NULL, 24, 1.0000, 0.0000, '2019-08-15 10:39:10', '2019-08-15 10:39:10'),
(57, 60, NULL, 24, 2.0000, 0.0000, '2019-08-15 10:57:42', '2019-08-15 10:57:42'),
(58, 61, NULL, 20, 1.0000, 0.0000, '2019-08-15 11:13:18', '2019-08-15 11:13:18'),
(59, 62, NULL, 13, 2.0000, 0.0000, '2019-08-16 18:01:01', '2019-08-16 18:01:01'),
(60, 63, NULL, 14, 1.0000, 0.0000, '2019-08-18 10:07:22', '2019-08-18 10:07:22'),
(61, 64, NULL, 15, 1.0000, 0.0000, '2019-08-18 10:08:46', '2019-08-18 10:08:46'),
(62, 65, NULL, 26, 2.0000, 0.0000, '2019-08-21 09:34:12', '2019-08-21 09:34:12'),
(63, 66, NULL, 26, 2.0000, 0.0000, '2019-08-21 09:43:50', '2019-08-21 09:43:50'),
(64, 67, NULL, 26, 2.0000, 0.0000, '2019-08-21 09:47:10', '2019-08-21 09:47:10'),
(65, 68, NULL, 26, 2.0000, 0.0000, '2019-08-21 11:13:46', '2019-08-21 11:13:46'),
(66, 69, NULL, 28, 2.0000, 0.0000, '2019-08-21 12:42:38', '2019-08-21 12:42:38'),
(67, 70, NULL, 29, 2.0000, 0.0000, '2019-08-21 13:37:19', '2019-08-21 13:37:19'),
(68, 71, NULL, 29, 1.0000, 0.0000, '2019-08-21 14:04:35', '2019-08-21 14:04:35'),
(69, 72, NULL, 29, 1.0000, 0.0000, '2019-08-21 14:06:55', '2019-08-21 14:06:55'),
(70, 73, NULL, 20, 1.0000, 0.0000, '2019-08-25 07:29:07', '2019-08-25 07:29:07'),
(71, 74, NULL, 31, 2.0000, 0.0000, '2019-08-25 09:28:38', '2019-08-25 09:28:38'),
(73, 76, NULL, 31, 1.0000, 0.0000, '2019-08-25 09:46:37', '2019-08-25 09:46:37'),
(74, 77, NULL, 39, 1.0000, 0.0000, '2019-08-25 12:20:27', '2019-08-25 12:20:27'),
(75, 78, NULL, 20, 1.0000, 0.0000, '2019-08-31 20:13:22', '2019-08-31 20:13:22'),
(76, 79, NULL, 20, 2.0000, 0.0000, '2019-08-31 20:42:14', '2019-08-31 20:42:14'),
(77, 80, NULL, 26, 2.0000, 0.0000, '2019-08-31 20:42:14', '2019-08-31 20:42:14'),
(78, 78, NULL, 20, 1.0000, 0.0000, '2019-09-01 05:56:11', '2019-09-01 05:56:11'),
(79, 81, NULL, 20, 1.0000, 0.0000, '2019-09-01 09:07:16', '2019-09-01 09:07:16'),
(80, 78, NULL, 20, 2.0000, 0.0000, '2019-09-01 09:42:13', '2019-09-01 09:42:13'),
(81, 82, NULL, 20, 3.0000, 0.0000, '2019-09-01 09:42:56', '2019-09-01 09:42:56'),
(82, 83, NULL, 26, 2.0000, 0.0000, '2019-09-01 09:43:37', '2019-09-01 09:43:37'),
(83, 84, NULL, 42, 2.0000, 0.0000, '2019-09-01 11:52:54', '2019-09-01 11:52:54'),
(84, 85, NULL, 42, 1.0000, 0.0000, '2019-09-01 12:03:35', '2019-09-01 12:03:35'),
(85, 86, NULL, 42, 1.0000, 0.0000, '2019-09-01 13:44:50', '2019-09-01 13:44:50'),
(86, 87, NULL, 42, 1.0000, 0.0000, '2019-09-01 13:53:59', '2019-09-01 13:53:59'),
(87, 88, NULL, 42, 2.0000, 0.0000, '2019-09-01 16:50:30', '2019-09-01 16:50:30'),
(88, 89, NULL, 26, 1.0000, 0.0000, '2019-09-01 16:50:30', '2019-09-01 16:50:30'),
(89, 90, NULL, 42, 1.0000, 0.0000, '2019-09-01 19:15:36', '2019-09-01 19:15:36'),
(90, 91, NULL, 42, 1.0000, 0.0000, '2019-09-01 19:28:13', '2019-09-01 19:28:13'),
(91, 92, NULL, 42, 1.0000, 0.0000, '2019-09-01 19:40:19', '2019-09-01 19:40:19'),
(92, 93, NULL, 20, 1.0000, 0.0000, '2019-09-01 20:17:22', '2019-09-01 20:17:22'),
(93, 94, NULL, 20, 1.0000, 0.0000, '2019-09-02 19:15:47', '2019-09-02 19:15:47');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `actual_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allow_decimal` tinyint(1) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `business_id`, `actual_name`, `short_name`, `allow_decimal`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Pieces', 'Pc(s)', 0, 1, NULL, '2019-01-23 17:59:41', '2019-01-23 17:59:41'),
(2, 1, 'Grams', 'g', 1, 1, NULL, '2019-01-24 06:45:15', '2019-01-24 06:45:15'),
(3, 1, 'kilograms', 'Kg', 1, 1, NULL, '2019-01-24 06:45:27', '2019-01-24 06:45:27'),
(4, 1, 'Packets', 'packets', 0, 1, NULL, '2019-01-24 06:45:42', '2019-01-24 06:45:42'),
(5, 1, 'Pieces', 'Pc(s)', 0, 1, NULL, '2019-01-24 06:45:58', '2019-01-24 06:45:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `surname` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `contact_no` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `is_cmmsn_agnt` tinyint(1) NOT NULL DEFAULT 0,
  `cmmsn_percent` decimal(4,2) NOT NULL DEFAULT 0.00,
  `selected_contacts` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `surname`, `first_name`, `last_name`, `username`, `email`, `password`, `language`, `contact_no`, `address`, `remember_token`, `business_id`, `is_cmmsn_agnt`, `cmmsn_percent`, `selected_contacts`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Mr', 'Admin', 'Admin', 'admin', 'awaismaqsood91@yahoo.com', '$2y$10$LZwNqTMt3WnVW0M4KwHHf.PZaCbBSH1FuqKOk6gJ1bT9w4ie5tq7.', 'en', NULL, NULL, 't2kUm53OVsDrmXBWFR8PdBYTJyHG7T3WpjG92wKq8kE62BGNkI4Thu9cPz0E', 1, 0, 0.00, 0, NULL, '2019-01-23 17:59:41', '2019-08-02 01:12:20'),
(2, 'Mr', 'cashier', NULL, 'waleed', 'awaismaqsood@fwo.com.pk', '$2y$10$x5lQG93Fxpy9pNd0ZogNoOpZSs2bwiPHAJrZXQkQh/UA9PZBo0zuS', 'en', NULL, NULL, '3MRnb0fWqPjqOaEdBpwaJcx0qBa9ic3xNwShDRwrZnwHtwgHRr2bqVbyWTqY', 1, 0, 0.00, 0, '2019-05-21 03:49:02', '2019-01-24 11:09:47', '2019-05-21 03:49:02'),
(4, 'Mr', 'Cash', 'Agent', 'cashier', 'awaismaqsood91@yahoo.com', '$2y$10$ggsxcJhd7Zlq4FmTw2ryZezr.PH.CSLbtEnRYMNwtn4UMbir0N.o.', 'en', NULL, NULL, NULL, 1, 0, 0.00, 0, NULL, '2019-05-21 03:46:17', '2019-05-21 03:46:17'),
(6, 'Mr', 'Shahood', 'Tariq', 'shahood', 'shahood@yahoo.com', '$2y$10$wZ0e5N1r33ZJSztLTuj3YOqCz4S0s9PBziw2AKvg.GISbIeN10oRy', 'en', NULL, NULL, '8AndoshB0b9IZdJTms6qy4HvI00iv1QwgHHp5szY0lRFP4Uf4Is7dVBu3lfu', 1, 0, 0.00, 0, NULL, '2019-06-25 02:42:15', '2019-06-25 02:42:15'),
(7, 'Mr', 'Ali', 'Raza', '5d19af9a89608', NULL, 'DUMMY', 'en', NULL, NULL, NULL, 1, 1, 2.00, 0, NULL, '2019-07-01 16:00:42', '2019-07-01 16:00:42'),
(9, NULL, 'waleed', NULL, 'waleed123', 'waleed@waleed.com', '$2y$10$ax4kTNZlUwJKrqJ455VF3.cR5vP/4oWix5QHilWFSfvn6WoVWDC9K', 'en', NULL, NULL, NULL, 1, 0, 0.00, 0, NULL, '2019-08-04 18:57:46', '2019-08-04 18:57:46'),
(10, NULL, 'ali', NULL, 'ali123', 'ali@ali.com', '$2y$10$KTcCcHlbcAji0ELZKr07pO1dNZ/kWyFXnRGCjwxvP9JZKRUdO/WTy', 'en', NULL, NULL, 'GYv5U9Sfn9ZFMGDJpAHDiNVrNQPLxdthoDNit5Q2KwlLldanmMf4Iljy6I0A', 1, 0, 1.00, 0, NULL, '2019-08-06 19:50:16', '2019-08-06 19:50:16');

-- --------------------------------------------------------

--
-- Table structure for table `user_contact_access`
--

CREATE TABLE `user_contact_access` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variations`
--

CREATE TABLE `variations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `sub_sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_variation_id` int(10) UNSIGNED NOT NULL,
  `variation_value_id` int(11) DEFAULT NULL,
  `default_purchase_price` decimal(20,2) DEFAULT NULL,
  `dpp_inc_tax` decimal(20,2) NOT NULL DEFAULT 0.00,
  `profit_percent` decimal(20,2) NOT NULL DEFAULT 0.00,
  `default_sell_price` decimal(20,2) DEFAULT NULL,
  `sell_price_inc_tax` decimal(20,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variations`
--

INSERT INTO `variations` (`id`, `name`, `product_id`, `sub_sku`, `product_variation_id`, `variation_value_id`, `default_purchase_price`, `dpp_inc_tax`, `profit_percent`, `default_sell_price`, `sell_price_inc_tax`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5, 'DUMMY', 5, '0005', 5, NULL, 100.00, 100.00, 25.00, 125.00, 125.00, '2019-01-24 06:59:51', '2019-01-25 11:28:52', NULL),
(14, 'DUMMY', 14, '0014', 14, NULL, 100.00, 100.00, 25.00, 125.00, 125.00, '2019-01-24 06:59:51', '2019-01-25 11:32:04', NULL),
(34, 'DUMMY', 34, '0034', 34, NULL, 100.00, 100.00, 25.00, 125.00, 125.00, '2019-05-30 03:20:14', '2019-05-30 03:20:14', NULL),
(35, 'DUMMY', 35, '0035', 35, NULL, 350.00, 350.00, 100.00, 700.00, 700.00, '2019-05-31 00:41:42', '2019-05-31 00:43:12', NULL),
(36, 'DUMMY', 36, '0036', 36, NULL, 350.00, 350.00, 100.00, 700.00, 700.00, '2019-05-31 00:47:41', '2019-05-31 00:47:41', NULL),
(37, 'DUMMY', 37, '0037', 37, NULL, 350.00, 350.00, 85.71, 650.00, 650.00, '2019-06-01 15:37:45', '2019-06-01 15:37:45', NULL),
(38, 'DUMMY', 38, '0038', 38, NULL, 350.00, 350.00, 100.00, 700.00, 700.00, '2019-06-01 15:41:15', '2019-06-01 15:41:15', NULL),
(39, 'DUMMY', 39, '0039', 39, NULL, 450.00, 450.00, 77.78, 800.00, 800.00, '2019-06-01 15:48:27', '2019-06-01 15:48:27', NULL),
(40, 'DUMMY', 40, '0040', 40, NULL, 1100.00, 1100.00, 45.45, 1600.00, 1600.00, '2019-06-01 15:59:46', '2019-06-01 15:59:46', NULL),
(41, 'DUMMY', 41, '0041', 41, NULL, 1250.00, 1250.00, 44.00, 1800.00, 1800.00, '2019-06-01 16:16:48', '2019-08-04 18:15:12', NULL),
(42, 'DUMMY', 42, '0042', 42, NULL, 850.00, 850.00, 52.94, 1300.00, 1300.00, '2019-06-01 16:20:46', '2019-06-01 16:20:46', NULL),
(43, 'DUMMY', 43, '0043', 43, NULL, 1250.00, 1250.00, 44.00, 1800.00, 1800.00, '2019-06-01 16:32:43', '2019-06-01 16:32:43', NULL),
(44, 'DUMMY', 44, '0044', 44, NULL, 1250.00, 1250.00, 44.00, 1800.00, 1800.00, '2019-06-01 16:36:56', '2019-06-01 16:36:56', NULL),
(45, 'DUMMY', 45, '0045', 45, NULL, 1250.00, 1250.00, 44.00, 1800.00, 1800.00, '2019-06-01 16:41:44', '2019-06-01 16:41:44', NULL),
(46, 'DUMMY', 46, '0046', 46, NULL, 1250.00, 1250.00, 44.00, 1800.00, 1800.00, '2019-06-01 16:48:25', '2019-06-01 16:48:25', NULL),
(47, 'DUMMY', 47, '0047', 47, NULL, 1250.00, 1250.00, 44.00, 1800.00, 1800.00, '2019-06-01 16:53:50', '2019-06-01 16:53:50', NULL),
(48, 'DUMMY', 48, '0048', 48, NULL, 1250.00, 1250.00, 44.00, 1800.00, 1800.00, '2019-06-01 16:58:00', '2019-06-01 16:58:00', NULL),
(49, 'DUMMY', 49, '0049', 49, NULL, 1250.00, 1250.00, 44.00, 1800.00, 1800.00, '2019-06-01 17:03:03', '2019-06-01 17:03:03', NULL),
(50, 'DUMMY', 50, '0050', 50, NULL, 1250.00, 1250.00, 44.00, 1800.00, 1800.00, '2019-06-01 17:06:25', '2019-06-01 17:06:25', NULL),
(51, 'DUMMY', 51, '0051', 51, NULL, 1250.00, 1250.00, 44.00, 1800.00, 1800.00, '2019-06-01 17:11:58', '2019-06-01 17:11:58', NULL),
(52, 'DUMMY', 52, '0052', 52, NULL, 680.00, 680.00, 61.76, 1100.00, 1100.00, '2019-06-01 17:46:20', '2019-06-01 17:46:20', NULL),
(53, 'DUMMY', 53, '0053', 53, NULL, 680.00, 680.00, 61.76, 1100.00, 1100.00, '2019-06-01 17:48:09', '2019-06-01 17:48:09', NULL),
(54, 'DUMMY', 54, '0054', 54, NULL, 600.00, 600.00, 33.33, 800.00, 800.00, '2019-06-16 18:32:55', '2019-06-16 18:32:55', NULL),
(55, 'DUMMY', 55, '0055', 55, NULL, 150.00, 150.00, 133.33, 350.00, 350.00, '2019-06-18 17:26:20', '2019-06-20 01:12:41', NULL),
(56, 'DUMMY', 56, '0056', 56, NULL, 190.00, 190.00, 136.84, 450.00, 450.00, '2019-06-18 17:46:54', '2019-06-20 01:20:16', NULL),
(57, 'DUMMY', 57, '0057', 57, NULL, 190.00, 190.00, 110.53, 400.00, 400.00, '2019-06-18 19:00:00', '2019-06-18 19:00:00', NULL),
(58, 'DUMMY', 58, '0058', 58, NULL, 190.00, 190.00, 136.84, 450.00, 450.00, '2019-06-18 19:04:53', '2019-06-18 19:04:53', NULL),
(59, 'DUMMY', 59, '0059', 59, NULL, 190.00, 190.00, 136.84, 450.00, 450.00, '2019-06-18 19:05:25', '2019-06-18 19:05:25', NULL),
(60, 'DUMMY', 60, '0060', 60, NULL, 350.00, 350.00, 71.43, 600.00, 600.00, '2019-06-18 19:08:58', '2019-06-18 19:08:58', NULL),
(61, 'DUMMY', 61, '0061', 61, NULL, 300.00, 300.00, 100.00, 600.00, 600.00, '2019-06-18 19:12:38', '2019-06-18 19:12:38', NULL),
(62, 'DUMMY', 62, '999', 62, NULL, 1100.00, 1287.00, 3.00, 1133.00, 1325.61, '2019-08-06 20:07:46', '2019-08-09 13:16:41', NULL),
(63, 'DUMMY', 63, '0063', 63, NULL, 5000.00, 5000.00, 0.00, 5000.00, 5000.00, '2019-08-08 03:41:06', '2019-08-08 03:41:06', NULL),
(64, 'DUMMY', 64, '0064', 64, NULL, 465.00, 465.00, 0.00, 465.00, 465.00, '2019-08-08 22:31:45', '2019-08-08 22:41:38', NULL),
(65, 'DUMMY', 65, '15', 65, NULL, 100.00, 117.00, 3.00, 103.00, 120.51, '2019-08-09 18:48:13', '2019-08-21 05:41:37', NULL),
(66, 'DUMMY', 66, '0066', 66, NULL, 1000.00, 1170.00, 28.70, 1287.00, 1505.79, '2019-08-11 07:01:43', '2019-08-11 09:19:17', NULL),
(67, 'DUMMY', 67, '0067', 67, NULL, 465.00, 544.05, 9.90, 511.05, 597.93, '2019-08-21 04:47:37', '2019-08-21 08:48:10', NULL),
(68, 'DUMMY', 68, '0068', 68, NULL, 465.00, 511.05, 3.00, 526.38, 597.93, '2019-08-21 12:37:19', '2019-08-21 12:37:19', NULL),
(69, 'DUMMY', 69, '0069', 69, NULL, 900.00, 1053.00, 33.24, 1199.12, 1402.97, '2019-08-21 13:32:22', '2019-08-21 13:35:37', NULL),
(70, 'DUMMY', 70, '0070', 70, NULL, 465.00, 511.05, 8.00, 551.93, 645.76, '2019-08-25 09:27:20', '2019-08-25 11:32:52', NULL),
(71, 'DUMMY', 71, '0071', 71, NULL, 465.00, 511.05, 4.00, 531.49, 621.84, '2019-08-25 12:15:59', '2019-08-25 12:35:45', NULL),
(72, 'DUMMY', 72, '0072', 72, NULL, 500.00, 517.00, 4.00, 537.68, 537.68, '2019-09-01 11:49:18', '2019-09-01 12:01:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `variation_group_prices`
--

CREATE TABLE `variation_group_prices` (
  `id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `price_group_id` int(10) UNSIGNED NOT NULL,
  `price_inc_tax` decimal(20,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variation_location_details`
--

CREATE TABLE `variation_location_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_variation_id` int(10) UNSIGNED NOT NULL COMMENT 'id from product_variations table',
  `variation_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `qty_available` decimal(20,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_location_details`
--

INSERT INTO `variation_location_details` (`id`, `product_id`, `product_variation_id`, `variation_id`, `location_id`, `qty_available`, `created_at`, `updated_at`) VALUES
(10, 35, 35, 35, 1, 0.0000, '2019-05-31 00:42:02', '2019-08-06 19:34:20'),
(11, 36, 36, 36, 1, 93.0000, '2019-05-31 00:47:53', '2019-08-16 18:01:01'),
(12, 41, 41, 41, 1, 67.0000, '2019-08-02 18:20:05', '2019-08-18 10:07:22'),
(13, 40, 40, 40, 1, 2.0000, '2019-08-02 18:31:52', '2019-08-18 10:08:46'),
(14, 62, 62, 62, 1, 39.0000, '2019-08-06 20:08:09', '2019-08-10 14:57:34'),
(15, 64, 64, 64, 1, 0.0000, '2019-08-08 22:41:38', '2019-08-08 23:23:10'),
(16, 65, 65, 65, 1, 186.6700, '2019-08-09 18:49:00', '2019-09-02 19:15:47'),
(17, 66, 66, 66, 1, 40.0000, '2019-08-11 07:02:07', '2019-08-15 10:57:42'),
(18, 67, 67, 67, 1, 10.0000, '2019-08-21 04:48:16', '2019-09-01 16:50:30'),
(19, 68, 68, 68, 1, 1.0000, '2019-08-21 12:41:21', '2019-08-21 12:42:38'),
(20, 69, 69, 69, 1, 98.0000, '2019-08-21 13:32:35', '2019-08-21 14:06:55'),
(21, 70, 70, 70, 1, 19.0000, '2019-08-25 09:27:31', '2019-08-25 11:12:29'),
(22, 71, 71, 71, 1, 50.0000, '2019-08-25 12:17:10', '2019-08-25 12:31:29'),
(23, 72, 72, 72, 1, 0.0000, '2019-09-01 11:51:40', '2019-09-01 19:40:19');

-- --------------------------------------------------------

--
-- Table structure for table `variation_templates`
--

CREATE TABLE `variation_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_templates`
--

INSERT INTO `variation_templates` (`id`, `name`, `business_id`, `created_at`, `updated_at`) VALUES
(1, 'Size (Tshirts)', 1, '2019-01-24 06:46:44', '2019-01-24 06:46:44'),
(2, 'Size (Shoes)', 1, '2019-01-24 06:47:00', '2019-01-24 06:47:00'),
(3, 'Waist Size (Jeans)', 1, '2019-01-24 06:47:13', '2019-01-24 06:47:13'),
(4, 'Color', 1, '2019-01-24 06:47:24', '2019-01-24 06:47:24'),
(5, 'Waist Size(Dress)', 1, '2019-01-24 06:47:51', '2019-01-24 06:47:51'),
(6, 'Size', 1, '2019-01-24 06:48:03', '2019-01-24 06:48:03'),
(7, 'Internal Memory', 1, '2019-01-24 06:48:20', '2019-01-24 06:48:20'),
(8, 'Storage', 1, '2019-01-24 06:48:31', '2019-01-24 06:48:31'),
(9, 'Cable Size', 1, '2019-01-24 06:48:43', '2019-01-24 06:48:43'),
(10, 'Bulb watts', 1, '2019-01-24 06:49:03', '2019-01-24 06:49:03');

-- --------------------------------------------------------

--
-- Table structure for table `variation_value_templates`
--

CREATE TABLE `variation_value_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variation_template_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_value_templates`
--

INSERT INTO `variation_value_templates` (`id`, `name`, `variation_template_id`, `created_at`, `updated_at`) VALUES
(1, 'S, M, L, XL', 1, '2019-01-24 06:46:44', '2019-01-24 06:46:44'),
(2, '5, 6, 7, 8, 9', 2, '2019-01-24 06:47:00', '2019-01-24 06:47:00'),
(3, '28, 30, 32, 34, 36', 3, '2019-01-24 06:47:13', '2019-01-24 06:47:13'),
(4, 'Black, Blue, Brown, Grey, Gold, Yellow, White, Red, Green', 4, '2019-01-24 06:47:24', '2019-01-24 06:47:24'),
(5, '28, 30, 32, 34, 36', 5, '2019-01-24 06:47:51', '2019-01-24 06:47:51'),
(6, 'S, M, L, XL, 6, 7, 8, 9, 5', 6, '2019-01-24 06:48:03', '2019-01-24 06:48:03'),
(7, '64 GB, 128 GB, 32 GB', 7, '2019-01-24 06:48:20', '2019-01-24 06:48:20'),
(8, '256 GB, 500 GB', 8, '2019-01-24 06:48:32', '2019-01-24 06:48:32'),
(9, '3-29, 7-29, 7-36, 7-44, 7-64', 9, '2019-01-24 06:48:43', '2019-01-24 06:48:43'),
(10, '5 Watt, 7 Watt, 12 Watt , 15 Watt , 27 Watt , 36 Watt', 10, '2019-01-24 06:49:03', '2019-01-24 06:49:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barcodes_business_id_foreign` (`business_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_contact_id_foreign` (`contact_id`),
  ADD KEY `bookings_business_id_foreign` (`business_id`),
  ADD KEY `bookings_created_by_foreign` (`created_by`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_business_id_foreign` (`business_id`),
  ADD KEY `brands_created_by_foreign` (`created_by`);

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_owner_id_foreign` (`owner_id`),
  ADD KEY `business_currency_id_foreign` (`currency_id`),
  ADD KEY `business_default_sales_tax_foreign` (`default_sales_tax`);

--
-- Indexes for table `business_locations`
--
ALTER TABLE `business_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_locations_business_id_index` (`business_id`),
  ADD KEY `business_locations_invoice_scheme_id_foreign` (`invoice_scheme_id`),
  ADD KEY `business_locations_invoice_layout_id_foreign` (`invoice_layout_id`);

--
-- Indexes for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_registers_business_id_foreign` (`business_id`),
  ADD KEY `cash_registers_user_id_foreign` (`user_id`);

--
-- Indexes for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_register_transactions_cash_register_id_foreign` (`cash_register_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_business_id_foreign` (`business_id`),
  ADD KEY `categories_created_by_foreign` (`created_by`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_business_id_foreign` (`business_id`),
  ADD KEY `contacts_created_by_foreign` (`created_by`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_groups_business_id_foreign` (`business_id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_categories_business_id_foreign` (`business_id`);

--
-- Indexes for table `group_sub_taxes`
--
ALTER TABLE `group_sub_taxes`
  ADD KEY `group_sub_taxes_group_tax_id_foreign` (`group_tax_id`),
  ADD KEY `group_sub_taxes_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_layouts_business_id_foreign` (`business_id`);

--
-- Indexes for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_schemes_business_id_foreign` (`business_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
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
-- Indexes for table `printers`
--
ALTER TABLE `printers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `printers_business_id_foreign` (`business_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_sub_category_id_foreign` (`sub_category_id`),
  ADD KEY `products_tax_foreign` (`tax`),
  ADD KEY `products_name_index` (`name`),
  ADD KEY `products_business_id_index` (`business_id`),
  ADD KEY `products_unit_id_index` (`unit_id`),
  ADD KEY `products_created_by_index` (`created_by`);

--
-- Indexes for table `product_racks`
--
ALTER TABLE `product_racks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variations_name_index` (`name`),
  ADD KEY `product_variations_product_id_index` (`product_id`);

--
-- Indexes for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_lines_transaction_id_foreign` (`transaction_id`),
  ADD KEY `purchase_lines_product_id_foreign` (`product_id`),
  ADD KEY `purchase_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `purchase_lines_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `reference_counts`
--
ALTER TABLE `reference_counts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `res_product_modifier_sets`
--
ALTER TABLE `res_product_modifier_sets`
  ADD KEY `res_product_modifier_sets_modifier_set_id_foreign` (`modifier_set_id`);

--
-- Indexes for table `res_tables`
--
ALTER TABLE `res_tables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `res_tables_business_id_foreign` (`business_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roles_business_id_foreign` (`business_id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_price_groups_business_id_foreign` (`business_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_adjustment_lines_product_id_foreign` (`product_id`),
  ADD KEY `stock_adjustment_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `stock_adjustment_lines_transaction_id_index` (`transaction_id`);

--
-- Indexes for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tax_rates_business_id_foreign` (`business_id`),
  ADD KEY `tax_rates_created_by_foreign` (`created_by`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_tax_id_foreign` (`tax_id`),
  ADD KEY `transactions_business_id_index` (`business_id`),
  ADD KEY `transactions_type_index` (`type`),
  ADD KEY `transactions_contact_id_index` (`contact_id`),
  ADD KEY `transactions_transaction_date_index` (`transaction_date`),
  ADD KEY `transactions_created_by_index` (`created_by`),
  ADD KEY `transactions_location_id_index` (`location_id`),
  ADD KEY `transactions_expense_for_foreign` (`expense_for`),
  ADD KEY `transactions_expense_category_id_index` (`expense_category_id`);

--
-- Indexes for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_payments_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_payments_created_by_index` (`created_by`);

--
-- Indexes for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_sell_lines_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_sell_lines_product_id_foreign` (`product_id`),
  ADD KEY `transaction_sell_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `transaction_sell_lines_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `transaction_sell_lines_purchase_lines`
--
ALTER TABLE `transaction_sell_lines_purchase_lines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `units_business_id_foreign` (`business_id`),
  ADD KEY `units_created_by_foreign` (`created_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD KEY `users_business_id_foreign` (`business_id`);

--
-- Indexes for table `user_contact_access`
--
ALTER TABLE `user_contact_access`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variations`
--
ALTER TABLE `variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variations_product_id_foreign` (`product_id`),
  ADD KEY `variations_product_variation_id_foreign` (`product_variation_id`),
  ADD KEY `variations_name_index` (`name`),
  ADD KEY `variations_sub_sku_index` (`sub_sku`);

--
-- Indexes for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_group_prices_variation_id_foreign` (`variation_id`),
  ADD KEY `variation_group_prices_price_group_id_foreign` (`price_group_id`);

--
-- Indexes for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_location_details_location_id_foreign` (`location_id`),
  ADD KEY `variation_location_details_product_id_index` (`product_id`),
  ADD KEY `variation_location_details_product_variation_id_index` (`product_variation_id`),
  ADD KEY `variation_location_details_variation_id_index` (`variation_id`);

--
-- Indexes for table `variation_templates`
--
ALTER TABLE `variation_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_templates_business_id_foreign` (`business_id`);

--
-- Indexes for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_value_templates_name_index` (`name`),
  ADD KEY `variation_value_templates_variation_template_id_index` (`variation_template_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barcodes`
--
ALTER TABLE `barcodes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `business_locations`
--
ALTER TABLE `business_locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cash_registers`
--
ALTER TABLE `cash_registers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `printers`
--
ALTER TABLE `printers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `product_racks`
--
ALTER TABLE `product_racks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `product_variations`
--
ALTER TABLE `product_variations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `reference_counts`
--
ALTER TABLE `reference_counts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `res_tables`
--
ALTER TABLE `res_tables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tax_rates`
--
ALTER TABLE `tax_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `transaction_sell_lines_purchase_lines`
--
ALTER TABLE `transaction_sell_lines_purchase_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_contact_access`
--
ALTER TABLE `user_contact_access`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variations`
--
ALTER TABLE `variations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `variation_templates`
--
ALTER TABLE `variation_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD CONSTRAINT `barcodes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `brands_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business`
--
ALTER TABLE `business`
  ADD CONSTRAINT `business_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `business_default_sales_tax_foreign` FOREIGN KEY (`default_sales_tax`) REFERENCES `tax_rates` (`id`),
  ADD CONSTRAINT `business_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business_locations`
--
ALTER TABLE `business_locations`
  ADD CONSTRAINT `business_locations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_locations_invoice_layout_id_foreign` FOREIGN KEY (`invoice_layout_id`) REFERENCES `invoice_layouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_locations_invoice_scheme_id_foreign` FOREIGN KEY (`invoice_scheme_id`) REFERENCES `invoice_schemes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD CONSTRAINT `cash_registers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cash_registers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  ADD CONSTRAINT `cash_register_transactions_cash_register_id_foreign` FOREIGN KEY (`cash_register_id`) REFERENCES `cash_registers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contacts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD CONSTRAINT `customer_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD CONSTRAINT `expense_categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `group_sub_taxes`
--
ALTER TABLE `group_sub_taxes`
  ADD CONSTRAINT `group_sub_taxes_group_tax_id_foreign` FOREIGN KEY (`group_tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_sub_taxes_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  ADD CONSTRAINT `invoice_layouts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  ADD CONSTRAINT `invoice_schemes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
