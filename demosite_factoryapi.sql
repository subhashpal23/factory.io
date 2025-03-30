-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 30, 2025 at 02:34 PM
-- Server version: 10.6.21-MariaDB
-- PHP Version: 8.3.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demosite_factoryapi`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `facebook_link` varchar(255) DEFAULT NULL,
  `google_plus_link` varchar(255) DEFAULT NULL,
  `linkedin_link` varchar(255) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `image` varchar(255) NOT NULL,
  `panel_title` varchar(255) DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `add_date_time` datetime NOT NULL,
  `last_modify` timestamp NOT NULL DEFAULT current_timestamp(),
  `stutus` int(2) NOT NULL,
  `last_login` datetime NOT NULL,
  `last_logout` datetime NOT NULL,
  `login_status` int(2) NOT NULL,
  `website_logo` varchar(10000) NOT NULL,
  `transaction_pwd` varchar(200) NOT NULL,
  `country` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `user_id`, `username`, `password`, `email`, `facebook_link`, `google_plus_link`, `linkedin_link`, `name`, `image`, `panel_title`, `type`, `date`, `add_date_time`, `last_modify`, `stutus`, `last_login`, `last_logout`, `login_status`, `website_logo`, `transaction_pwd`, `country`) VALUES
(1, 123456, 'admin', 'admin', 'test@test.com', 'test@fb.com', 'test@gmail.com', 'test@link.com', 'Admin', '158202633832935.jpg', 'Mthombeni Empire Admin site', 'admin', '2014-07-27', '2014-06-27 18:15:00', '2014-06-27 07:15:50', 0, '2024-08-13 08:14:01', '2024-08-13 08:17:37', 0, 'icon1410940295logo.png', 'admin', ''),
(2, 1234567, 'employer', 'employer', 'test@test.com', 'test@fb.com', 'test@gmail.com', 'test@link.com', 'Admin', '158202633832935.jpg', 'Fortress', 'admin', '2014-07-27', '2014-06-27 18:15:00', '2014-06-27 07:15:50', 0, '2024-02-23 05:57:04', '2024-02-23 05:57:59', 0, 'icon1410940295logo.png', 'admin', ''),
(3, 1710726, 'agency', 'agency', 'subadmin@test.com', NULL, NULL, NULL, 'Sub Admin', '158202633832935.jpg', 'Fortress Sub Admin', 'sub_admin', '0000-00-00', '0000-00-00 00:00:00', '2022-10-04 08:08:33', 0, '2024-02-23 09:18:55', '2024-02-23 08:46:29', 1, '', '', ''),
(4, 1710727, 'candidate', 'candidate', 'subadmin@test.com', NULL, NULL, NULL, 'Sub Admin', '158202633832935.jpg', 'Fortress Sub Admin', 'sub_admin', '0000-00-00', '0000-00-00 00:00:00', '2022-10-04 08:08:33', 0, '2024-02-14 06:31:56', '2024-02-11 11:31:33', 1, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `admin_charge`
--

CREATE TABLE `admin_charge` (
  `id` int(11) NOT NULL,
  `charge_type` int(1) NOT NULL COMMENT '0 per,1 flat',
  `charges` varchar(20) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `admin_charge`
--

INSERT INTO `admin_charge` (`id`, `charge_type`, `charges`, `status`) VALUES
(1, 0, '20', 0);

-- --------------------------------------------------------

--
-- Table structure for table `admin_sub`
--

CREATE TABLE `admin_sub` (
  `id` int(11) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `gstin` varchar(500) NOT NULL,
  `name` varchar(150) NOT NULL,
  `address` text NOT NULL,
  `panel_title` varchar(255) DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `add_date_time` datetime NOT NULL,
  `last_modify` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(2) NOT NULL,
  `last_login` datetime NOT NULL,
  `last_logout` datetime NOT NULL,
  `login_status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `admin_sub`
--

INSERT INTO `admin_sub` (`id`, `user_id`, `username`, `password`, `email`, `gstin`, `name`, `address`, `panel_title`, `type`, `mobile`, `add_date_time`, `last_modify`, `status`, `last_login`, `last_logout`, `login_status`) VALUES
(1, '0', 'asdasd', '123456', 'test@gmail.com', '123456', 'test', 'test address', 'Stockist Panel', 'sub_admin', '3456', '0000-00-00 00:00:00', '2020-01-31 06:53:50', 1, '2020-02-16 06:05:59', '2020-02-16 06:11:37', 0),
(2, 'JVN1465285', 'stockist', '123', 'asdas', '09ASDFF1543GZE1', 'sd adsasd', 'dasd asdasd', 'Stockist Panel', 'sub_admin', 'das', '0000-00-00 00:00:00', '2020-01-31 06:54:55', 1, '2020-02-17 09:15:56', '2020-02-06 08:56:15', 1),
(3, 'JVN4450055', 'Shriganesh', '123123', 'test@gmail.com', '', 'Shriganesh', 'test', NULL, 'sub_admin', '123456789', '2020-02-03 08:23:47', '2020-02-03 08:23:47', 1, '2020-02-06 08:56:28', '2020-02-06 08:56:37', 0),
(4, 'JVN5501745', 'jivanstock1', '203202', 'Jivanherbal@gmail.com', '05ABCCS6353E1ZI', 'Jivan1', 'Saharanpur gourment hospital near emergency get Dr Sandeep Garg ', NULL, 'sub_admin', '9557912498', '2020-02-03 11:14:56', '2020-02-03 11:14:56', 1, '2020-02-17 18:23:52', '2020-02-03 11:22:57', 1);

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE `agents` (
  `id` int(11) NOT NULL,
  `user_id` varchar(20) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `person_details` longtext NOT NULL,
  `add_by` varchar(20) DEFAULT NULL,
  `add_user_id` varchar(20) NOT NULL,
  `add_date` date DEFAULT NULL,
  `status` int(1) NOT NULL COMMENT '0 pending,1 approed,2not approved',
  `approve_by` varchar(20) DEFAULT NULL,
  `approve_user_id` varchar(20) DEFAULT NULL,
  `approve_date` date NOT NULL,
  `about_us` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`id`, `user_id`, `first_name`, `last_name`, `qualification`, `person_details`, `add_by`, `add_user_id`, `add_date`, `status`, `approve_by`, `approve_user_id`, `approve_date`, `about_us`) VALUES
(1, '7019276', 'Subhash', 'Pal', NULL, '{\"first_name\":\"Subhash\",\"last_name\":\"Pal\",\"gender\":\"male\",\"date_of_birth\":\"10\\/05\\/1986\",\"bloodgroup\":\"A+\",\"religion\":\"hindu\",\"email\":\"test@gmail.ciom\",\"qualification\":\"High School\",\"board\":\"\",\"passingYear\":\"\",\"username\":\"agency2\",\"password\":\"12345\",\"contact_no\":\"1234567890\",\"btn\":\"Save\"}', 'admin', '123456', '2024-02-23', 1, NULL, NULL, '0000-00-00', ''),
(2, 'V5948746', 'Pankaj', 'Dubey', NULL, '{\"first_name\":\"Pankaj\",\"last_name\":\"Dubey\",\"email\":\"subhashsws6@gmail.com\",\"contact_no\":\"9990694126\",\"country_go\":\"United States\",\"qualification\":\"Intermediate\",\"experience\":\"10\",\"nature_of_work\":\"Lohar\",\"job_from\":\"2022\",\"job_to\":\"2023\",\"prev_employer\":\"NA\",\"info1\":\"on\",\"info2\":\"on\",\"info3\":\"on\",\"info4\":\"on\",\"board\":\"\",\"passingYear\":\"\",\"username\":\" Test\",\"password\":\"123\",\"btn\":\"Save\"}', 'admin', '123456', '2024-03-09', 1, NULL, NULL, '0000-00-00', ''),
(3, 'V3122616', 'ashj', 'jhhj', NULL, '{\"first_name\":\"ashj\",\"last_name\":\"jhhj\",\"email\":\"subpal2009@gmail.com\",\"contact_no\":\"hjhj\",\"country_go\":\"Australia\",\"qualification\":\"High School\",\"experience\":\"10\",\"nature_of_work\":\"\",\"job_from\":\"2011\",\"job_to\":\"2024\",\"prev_employer\":\"NA\",\"board\":\"\",\"passingYear\":\"\",\"username\":\"agent1\",\"password\":\"12345\",\"btn\":\"Save\"}', 'self', 'V3122616', '2024-03-19', 1, NULL, NULL, '0000-00-00', ''),
(4, 'V6267626', 'ajg', 'jh', NULL, '{\"first_name\":\"ajg\",\"last_name\":\"jh\",\"passport_no\":\"h\",\"passport_issuedby\":\"hggh\",\"date_of_birth\":\"\",\"email\":\"hggma@gmai.com\",\"contact_no\":\"hg\",\"qualification\":\"High School\",\"country\":\"\",\"country_go\":\"\",\"experience\":\"hg\",\"nature_of_work\":\"h\",\"job_from\":\"gh\",\"job_to\":\"hg\",\"prev_employer\":\"hg\",\"board\":\"\",\"passingYear\":\"\",\"username\":\"candiate123\",\"password\":\"123\",\"btn\":\"Save\"}', 'admin', 'V3122616', '2024-04-04', 1, NULL, NULL, '0000-00-00', '');

-- --------------------------------------------------------

--
-- Table structure for table `app_log`
--

CREATE TABLE `app_log` (
  `id` int(11) NOT NULL,
  `url` text DEFAULT NULL,
  `request` text DEFAULT NULL,
  `response` longtext DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `app_log`
--

INSERT INTO `app_log` (`id`, `url`, `request`, `response`, `ts`) VALUES
(1, 'updateUserId', '{\"employeeCount\":\"4\",\"facilities\":\"hh\",\"location\":\"hh\",\"iso_certification\":\"1\"}', '{\"status\":false,\"message\":\"Missing required fields\"}', '2025-03-23 12:13:50'),
(2, 'updateUserId', '', NULL, '2025-03-24 08:29:18'),
(3, 'updateUserId', '{\"employeeCount\":6,\"facilities\":\"Facilities Available13\",\"location\":\"Address13\",\"iso_certification\":\"1\",\"freezone\":\"0\",\"manufacturing_process\":\"12,13,6\",\"files\":\"/\"}', '{\"status\":true,\"message\":\"Data received successfully\",\"data\":{\"employeeCount\":6,\"facilities\":\"Facilities Available13\",\"location\":\"Address13\",\"iso_certification\":\"1\",\"freezone\":\"0\",\"manufacturing_process\":\"12,13,6\",\"files\":\"\\/\"}}', '2025-03-24 08:29:18'),
(4, 'updateUserId', '', NULL, '2025-03-24 08:31:37'),
(5, 'updateUserId', '{\"employeeCount\":6,\"facilities\":\"Facilities Available13\",\"location\":\"Address13\",\"iso_certification\":\"1\",\"freezone\":\"0\",\"manufacturing_process\":\"12,13,6,1\",\"files\":\"/\"}', '{\"status\":true,\"message\":\"Data received successfully\",\"data\":{\"employeeCount\":6,\"facilities\":\"Facilities Available13\",\"location\":\"Address13\",\"iso_certification\":\"1\",\"freezone\":\"0\",\"manufacturing_process\":\"12,13,6,1\",\"files\":\"\\/\"}}', '2025-03-24 08:31:37'),
(6, 'updateUserId', '', NULL, '2025-03-24 08:31:57'),
(7, 'updateUserId', '{\"employeeCount\":6,\"facilities\":\"Facilities Available13\",\"location\":\"Address13\",\"iso_certification\":\"1\",\"freezone\":\"1\",\"manufacturing_process\":\"12,13,6,1\",\"files\":\"/\"}', '{\"status\":true,\"message\":\"Data received successfully\",\"data\":{\"employeeCount\":6,\"facilities\":\"Facilities Available13\",\"location\":\"Address13\",\"iso_certification\":\"1\",\"freezone\":\"1\",\"manufacturing_process\":\"12,13,6,1\",\"files\":\"\\/\"}}', '2025-03-24 08:31:57');

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `iban` varchar(255) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `bic` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_wired_detail`
--

CREATE TABLE `bank_wired_detail` (
  `id` int(3) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `branch_code` varchar(255) DEFAULT NULL,
  `ifsc_code` varchar(255) DEFAULT NULL,
  `account_no` varchar(255) DEFAULT NULL,
  `account_holder_name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `bank_wired_detail`
--

INSERT INTO `bank_wired_detail` (`id`, `title`, `name`, `bank_name`, `branch_name`, `branch_code`, `ifsc_code`, `account_no`, `account_holder_name`, `description`) VALUES
(1, 'test', 'UMCEBO WETHU', 'Capitec ', 'Test Branch', '470010', 'tes ifsc', '1578923466', 'Aditya Rathi', '<h3><strong>test desciption</strong></h3>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `bank_wired_user_registration`
--

CREATE TABLE `bank_wired_user_registration` (
  `id` bigint(6) NOT NULL,
  `ref_id` varchar(255) DEFAULT NULL,
  `ref_leg_position` varchar(255) DEFAULT NULL,
  `payment_method` enum('1','2','3','4','5') DEFAULT NULL COMMENT '''1''=>Bank Wire Payment,''2''=>Bit Coin Payment,''3''=>Mobile Money Payment,''4''=>Perfect Money,''5''=>Payeer Payment',
  `payment_method_name` varchar(255) DEFAULT NULL,
  `binary_pos` varchar(255) DEFAULT NULL,
  `platform` varchar(255) DEFAULT NULL COMMENT 'It''s package id',
  `package_fee` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `t_code` varchar(255) DEFAULT NULL COMMENT 'It''s transaction password',
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `date_of_birth` varchar(255) DEFAULT NULL,
  `contact_no` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `address_line1` varchar(255) DEFAULT NULL,
  `account_no` varchar(255) DEFAULT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `ifsc_code` varchar(255) DEFAULT NULL,
  `account_holder_name` varchar(255) DEFAULT NULL,
  `bit_coin_id` text DEFAULT NULL,
  `registration_method` varchar(255) DEFAULT NULL,
  `registration_method_name` varchar(255) DEFAULT NULL,
  `status` enum('0','1','2') DEFAULT '0' COMMENT '''0''=>pending,''1''=>approved,''2''=>Cancelled',
  `proof` varchar(255) DEFAULT NULL,
  `registration_date` datetime NOT NULL DEFAULT current_timestamp(),
  `action_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bit_coin_payment_details`
--

CREATE TABLE `bit_coin_payment_details` (
  `id` bigint(8) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `bit_coin_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `candiates`
--

CREATE TABLE `candiates` (
  `id` int(11) NOT NULL,
  `user_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `person_details` longtext NOT NULL,
  `add_by` varchar(20) DEFAULT NULL,
  `add_user_id` varchar(20) NOT NULL,
  `add_date` date DEFAULT NULL,
  `status` int(1) NOT NULL COMMENT '0 pending,1 approed,2not approved',
  `approve_by` varchar(20) DEFAULT NULL,
  `approve_user_id` varchar(20) DEFAULT NULL,
  `approve_date` date DEFAULT NULL,
  `about_us` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `candiates`
--

INSERT INTO `candiates` (`id`, `user_id`, `first_name`, `last_name`, `qualification`, `person_details`, `add_by`, `add_user_id`, `add_date`, `status`, `approve_by`, `approve_user_id`, `approve_date`, `about_us`) VALUES
(1, 'V2150806', 'Pankaj', 'Dubey', '10th', '{\"first_name\":\"Pankaj\",\"last_name\":\"Dubey\",\"gender\":\"male\",\"date_of_birth\":\"10\\/05\\/1986\",\"bloodgroup\":\"A-\",\"religion\":\"Christian\",\"email\":\"test@gmail.ciom\",\"qualification\":\"Intermediate\",\"board\":\"\",\"passingYear\":\"\",\"username\":\"test\",\"password\":\"12345\",\"contact_no\":\"1234567890\",\"btn\":\"Save\"}', 'agency', '1710726', '2024-02-23', 1, 'admin', '123456', '2024-02-24', ''),
(2, 'V7786596', NULL, '', NULL, '{\"first_name\":\"Subhash\",\"last_name\":\"Pal\",\"gender\":\"male\",\"date_of_birth\":\"10\\/05\\/1986\",\"bloodgroup\":\"\",\"religion\":\"\",\"email\":\"\",\"qualification\":\"High School\",\"board\":\"\",\"passingYear\":\"\",\"username\":\"test1\",\"password\":\"123\",\"contact_no\":\"1234567890\",\"btn\":\"Save\"}', 'agency', '1710726', '2024-02-23', 1, 'admin', '123456', '2024-02-24', ''),
(3, 'V2775446', NULL, '', NULL, '{\"first_name\":\"Subhash\",\"last_name\":\"Pal\",\"gender\":\"male\",\"date_of_birth\":\"10\\/05\\/1986\",\"bloodgroup\":\"\",\"religion\":\"\",\"email\":\"\",\"qualification\":\"High School\",\"board\":\"\",\"passingYear\":\"\",\"username\":\"test2\",\"password\":\"123\",\"contact_no\":\"test\",\"btn\":\"Save\"}', 'agency', '1710726', '2024-02-23', 1, 'admin', '123456', '2024-02-24', ''),
(4, 'V3873166', NULL, '', NULL, '{\"first_name\":\"Subhash\",\"last_name\":\"Pal\",\"gender\":\"male\",\"date_of_birth\":\"\",\"bloodgroup\":\"\",\"religion\":\"\",\"email\":\"\",\"qualification\":\"High School\",\"board\":\"\",\"passingYear\":\"\",\"username\":\"\",\"password\":\"\",\"contact_no\":\"\",\"btn\":\"Save\"}', 'agency', '7019276', '2024-02-25', 0, NULL, NULL, NULL, ''),
(5, 'V7476946', NULL, NULL, NULL, '{\"first_name\":\"Subhash\",\"last_name\":\"Pal\",\"passport_no\":\"126845\",\"passport_issuedby\":\"Uttar Pradesh Gov\",\"date_of_birth\":\"10\\/05\\/1986\",\"email\":\"subhashsws6@gmail.com\",\"contact_no\":\"9990694126\",\"qualification\":\"High School\",\"country\":\"India\",\"state\":\"Uttar Pradesh\",\"country_go\":\"Canada\",\"experience\":\"10\",\"nature_of_work\":\"Developer\",\"job_from\":\"2011\",\"job_to\":\"2024\",\"prev_employer\":\"Virtual Employees\",\"board\":\"\",\"passingYear\":\"\",\"username\":\"subhashpal23\",\"password\":\"Subhash@123\",\"btn\":\"Save\"}', 'agency', '7019276', '2024-03-09', 1, 'admin', '123456', '2024-03-09', ''),
(6, 'V5381826', NULL, NULL, NULL, '{\"first_name\":\"Subhash\",\"last_name\":\"Pal\",\"passport_no\":\"ashhj\",\"passport_issuedby\":\"hj\",\"date_of_birth\":\"\",\"email\":\"jhj@gmail.com\",\"contact_no\":\"h\",\"qualification\":\"High School\",\"country\":\"Jamaica\",\"country_go\":\"Austria\",\"experience\":\"\",\"nature_of_work\":\"Developer\",\"job_from\":\"2011\",\"job_to\":\"2024\",\"prev_employer\":\"NA\",\"board\":\"\",\"passingYear\":\"\",\"username\":\"candidate1\",\"password\":\"123\",\"photo\":\"\",\"btn\":\"Save\"}', 'self', 'V5381826', '2024-03-19', 0, NULL, NULL, NULL, 'askdjkajs'),
(7, 'V2713136', NULL, NULL, NULL, '{\"first_name\":\"Subhash\",\"last_name\":\"Pal\",\"passport_no\":\"ashhj\",\"passport_issuedby\":\"Uttar Pradesh Gov\",\"date_of_birth\":\"\",\"email\":\"subhashsws6@gmail.com\",\"contact_no\":\"9990694126\",\"qualification\":\"High School\",\"country\":\"\",\"country_go\":\"\",\"experience\":\"\",\"nature_of_work\":\"\",\"job_from\":\"\",\"job_to\":\"\",\"prev_employer\":\"\",\"board\":\"\",\"passingYear\":\"\",\"username\":\"subhash1\",\"password\":\"123\",\"btn\":\"Save\"}', 'agency', 'V3122616', '2024-04-04', 0, NULL, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `commission_permission`
--

CREATE TABLE `commission_permission` (
  `id` bigint(10) NOT NULL,
  `comm_type_id` int(3) DEFAULT NULL,
  `pkg_id` int(4) DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=>deactive, 1=>active',
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `commission_permission`
--

INSERT INTO `commission_permission` (`id`, `comm_type_id`, `pkg_id`, `status`, `created_date`) VALUES
(1, 1, 1, '1', '2018-07-03 21:17:55');

-- --------------------------------------------------------

--
-- Table structure for table `commission_type`
--

CREATE TABLE `commission_type` (
  `id` int(3) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `display` enum('0','1') DEFAULT NULL COMMENT '''0''=>Not to be dispayed,''1''=>Should be displayed',
  `role` enum('1') NOT NULL COMMENT '1=>created by admin',
  `position` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='It''s entry should not be updated/deleted';

--
-- Dumping data for table `commission_type`
--

INSERT INTO `commission_type` (`id`, `title`, `url`, `display`, `role`, `position`, `created_date`) VALUES
(1, 'Direct commission / Referral commission', 'package/configureDirectCommision', '1', '1', '1', '2017-06-04 00:00:00'),
(2, 'Indirect Unilevel Sponsor to Sponsor Commission', 'package/configureIndirectSponsorUnilevelCommision', '0', '1', NULL, '2017-06-04 01:40:12'),
(3, 'Stage Wise Matrix Level Complete commission', 'package/configureStageWiseMatrixLevelCommision', '1', '1', '2', '2017-06-04 01:40:12'),
(4, 'Satge Completion Bonus', 'package/configureStageCompletionCommision', '1', '1', '3', '2017-06-04 01:40:12'),
(5, 'Satge Completion Incentive', 'package/configureStageCompletionRankBonus', '1', '1', '4', '2017-06-04 01:40:12'),
(6, 'Stage Wise Level commission', 'package/configureStageWiseUnilevelCommision', '0', '1', NULL, '2017-06-04 01:40:12');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `user_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `person_details` longtext NOT NULL,
  `add_by` varchar(20) DEFAULT NULL,
  `add_user_id` varchar(20) NOT NULL,
  `add_date` date DEFAULT NULL,
  `status` int(1) NOT NULL COMMENT '0 pending,1 approed,2not approved',
  `approve_by` varchar(20) DEFAULT NULL,
  `approve_user_id` varchar(20) DEFAULT NULL,
  `approve_date` date DEFAULT NULL,
  `about_us` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `user_id`, `first_name`, `last_name`, `qualification`, `person_details`, `add_by`, `add_user_id`, `add_date`, `status`, `approve_by`, `approve_user_id`, `approve_date`, `about_us`) VALUES
(1, '2716526', 'Subhash', NULL, NULL, '{\"first_name\":\"Subhash\",\"contact_name\":\"kjadsh\",\"gender\":\"it\",\"date_of_birth\":\"\",\"rollno\":\"1\",\"email\":\"akshd@kjds.com\",\"qualification\":\"High School\",\"username\":\"shsdh\",\"password\":\"hjdsj\",\"contact_no\":\"ksjdhj\",\"btn\":\"Save\"}', 'admin', '123456', '2024-02-24', 1, NULL, NULL, NULL, 'sjkdkjas'),
(2, 'V3474076', 'Subhash', NULL, NULL, '{\"first_name\":\"Subhash\",\"email\":\"subhashsws6@gmail.com\",\"contact_no\":\"1234567890\",\"country\":\"Canada\",\"state\":\"Ontario\",\"no_of_job_available\":\"\",\"nature_of_work\":\"\",\"place_of_work\":\"\",\"shift_timing\":\"2000\",\"salary_gross\":\"1000\",\"overtime_hours\":\"\",\"overtime_rate\":\"200\",\"experience\":\"10\",\"scondition\":\"10\",\"need_worker\":\"10\",\"username\":\"subhash\",\"password\":\"subhash\",\"btn\":\"Save\"}', 'admin', '123456', '2024-03-09', 1, NULL, NULL, NULL, ''),
(3, 'V2643316', 'asjdhj', NULL, NULL, '{\"first_name\":\"asjdhj\",\"email\":\"hj@gmail.com\",\"contact_no\":\"hh\",\"country\":\"Jamaica\",\"state\":\"\",\"no_of_job_available\":\"h\",\"nature_of_work\":\"jhj\",\"place_of_work\":\"hj\",\"shift_timing\":\"hj\",\"salary_gross\":\"hj\",\"overtime_hours\":\"hj\",\"overtime_rate\":\"hj\",\"experience\":\"hjh\",\"scondition\":\"hj\",\"need_worker\":\"h\",\"username\":\"jhj\",\"password\":\"j\",\"photo\":\"\",\"btn\":\"Save\"}', 'admin', 'V2643316', '2024-03-19', 1, NULL, NULL, NULL, 'hj');

-- --------------------------------------------------------

--
-- Table structure for table `confidential`
--

CREATE TABLE `confidential` (
  `id` int(5) NOT NULL,
  `confidential_key` varchar(255) DEFAULT NULL,
  `confidential_value` text DEFAULT NULL,
  `last_updated` datetime NOT NULL,
  `controller` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `confidential`
--

INSERT INTO `confidential` (`id`, `confidential_key`, `confidential_value`, `last_updated`, `controller`) VALUES
(1, 'privacy_policy', '0', '2022-10-06 07:26:15', 'editPrivacyPolicy');
INSERT INTO `confidential` (`id`, `confidential_key`, `confidential_value`, `last_updated`, `controller`) VALUES
(2, 'terms_and_condition', '<div>\n<p align=\"center\"><strong>TERMS AND CONDITIONS</strong></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">1. <b>Introduction</b></span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">Welcome to <b>GLOBAL WEALTH SYSTEMS</b> (“Company”, “we”, “our”, “us”)!</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">These Terms of Service (“Terms”, “Terms of Service”) govern your use of our website located at <b><a data-saferedirecturl=\"https://www.google.com/url?q=http://www.globalwealths.org&source=gmail&ust=1611390728312000&usg=AFQjCNF0TCoPvPSXPML6d4RdLak-XB7u8w\" href=\"http://www.globalwealths.org/\" style=\"color: rgb(17, 85, 204);\" target=\"_blank\">www.globalwealths.org</a></b> (together or individually “Service”) operated by <b>GLOBAL WEALTH SYSTEMS</b>.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">Our Privacy Policy also governs your use of our Service and explains how we collect, safeguard and disclose information that results from your use of our web pages.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">Your agreement with us includes these Terms and our Privacy Policy (“Agreements”). You acknowledge that you have read and understood Agreements, and agree to be bound of them.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">If you do not agree with (or cannot comply with) Agreements, then you may not use the Service, but please let us know by emailing at <b><a href=\"mailto:support@globalwealths.org\" style=\"color: rgb(17, 85, 204);\" target=\"_blank\">support@globalwealths.org</a></b> so we can try to find a solution. These Terms apply to all visitors, users and others who wish to access or use Service.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">2. <b>Communications</b></span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">By using our Service, you agree to subscribe to newsletters, marketing or promotional materials and other information we may send. However, you may opt out of receiving any, or all, of these communications from us by following the unsubscribe link or by emailing at <a href=\"mailto:support@globalwealths.org\" style=\"color: rgb(17, 85, 204);\" target=\"_blank\">support@globalwealths.org</a>.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">3. <b>Purchases</b></span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">If you wish to purchase any product or service made available through Service (“Purchase”), you may be asked to supply certain information relevant to your Purchase including but not limited to, your credit or debit card number, the expiration date of your card, your billing address, and your shipping information.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">You represent and warrant that: (i) you have the legal right to use any card(s) or other payment method(s) in connection with any Purchase; and that (ii) the information you supply to us is true, correct and complete.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">We may employ the use of third party services for the purpose of facilitating payment and the completion of Purchases. By submitting your information, you grant us the right to provide the information to these third parties subject to our Privacy Policy.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">We reserve the right to refuse or cancel your order at any time for reasons including but not limited to: product or service availability, errors in the description or price of the product or service, error in your order or other reasons.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">We reserve the right to refuse or cancel your order if fraud or an unauthorized or illegal transaction is suspected.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">4. <b>Contests, Sweepstakes and Promotions</b></span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">Any contests, sweepstakes or other promotions (collectively, “Promotions”) made available through Service may be governed by rules that are separate from these Terms of Service. If you participate in any Promotions, please review the applicable rules as well as our Privacy Policy. If the rules for a Promotion conflict with these Terms of Service, Promotion rules will apply.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">5. <b>Subscriptions</b></span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">Some parts of Service are billed on a subscription basis (\"Subscription(s)\"). You will be billed in advance on a recurring and periodic basis (\"Billing Cycle\"). Billing cycles will be set depending on the type of subscription plan you select when purchasing a Subscription.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">At the end of each Billing Cycle, your Subscription will automatically renew under the exact same conditions unless you cancel it or GLOBAL WEALTH SYSTEMS cancels it. You may cancel your Subscription renewal either through your online account management page or by contacting <a href=\"mailto:support@globalwealths.org\" style=\"color: rgb(17, 85, 204);\" target=\"_blank\">support@globalwealths.org</a> customer support team.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">A valid payment method is required to process the payment for your subscription. You shall provide GLOBAL WEALTH SYSTEMS with accurate and complete billing information that may include but not limited to full name, address, state, postal or zip code, telephone number, and a valid payment method information. By submitting such payment information, you automatically authorize GLOBAL WEALTH SYSTEMS to charge all Subscription fees incurred through your account to any such payment instruments.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">Should automatic billing fail to occur for any reason, GLOBAL WEALTH SYSTEMS reserves the right to terminate your access to the Service with immediate effect.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">6. <b>Free Trial</b></span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">GLOBAL WEALTH SYSTEMS may, at its sole discretion, offer a Subscription with a free trial for a limited period of time (\"Free Trial\").</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">You may be required to enter your billing information in order to sign up for Free Trial.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">If you do enter your billing information when signing up for Free Trial, you will not be charged by GLOBAL WEALTH SYSTEMS until Free Trial has expired. On the last day of Free Trial period, unless you cancelled your Subscription, you will be automatically charged the applicable Subscription fees for the type of Subscription you have selected.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">At any time and without notice, GLOBAL WEALTH SYSTEMS reserves the right to (i) modify Terms of Service of Free Trial offer, or (ii) cancel such Free Trial offer.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">7. <b>Fee Changes</b></span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">GLOBAL WEALTH SYSTEMS, in its sole discretion and at any time, may modify Subscription fees for the Subscriptions. Any Subscription fee change will become effective at the end of the then-current Billing Cycle.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">GLOBAL WEALTH SYSTEMS will provide you with a reasonable prior notice of any change in Subscription fees to give you an opportunity to terminate your Subscription before such change becomes effective.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">Your continued use of Service after Subscription fee change comes into effect constitutes your agreement to pay the modified Subscription fee amount.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">8. <b>Refunds</b></span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">No Refund for Membership Subscription , However Product / Services Paid for shall be subjected to 10 Days Refund</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">9. <b>Content</b></span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">Our Service allows you to post, link, store, share and otherwise make available certain information, text, graphics, videos, or other material (“Content”). You are responsible for Content that you post on or through Service, including its legality, reliability, and appropriateness.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">By posting Content on or through Service, You represent and warrant that: (i) Content is yours (you own it) and/or you have the right to use it and the right to grant us the rights and license as provided in these Terms, and (ii) that the posting of your Content on or through Service does not violate the privacy rights, publicity rights, copyrights, contract rights or any other rights of any person or entity. We reserve the right to terminate the account of anyone found to be infringing on a copyright.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">You retain any and all of your rights to any Content you submit, post or display on or through Service and you are responsible for protecting those rights. We take no responsibility and assume no liability for Content you or any third party posts on or through Service. However, by posting Content using Service you grant us the right and license to use, modify, publicly perform, publicly display, reproduce, and distribute such Content on and through Service. You agree that this license includes the right for us to make your Content available to other users of Service, who may also use your Content subject to these Terms.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">GLOBAL WEALTH SYSTEMS has the right but not the obligation to monitor and edit all Content provided by users.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">In addition, Content found on or through this Service are the property of GLOBAL WEALTH SYSTEMS or used with permission. You may not distribute, modify, transmit, reuse, download, repost, copy, or use said Content, whether in whole or in part, for commercial purposes or for personal gain, without express advance written permission from us.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">10. <b>Prohibited Uses</b></span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">You may use Service only for lawful purposes and in accordance with Terms. You agree not to use Service:</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">0.1. In any way that violates any applicable national or international law or regulation.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">0.2. For the purpose of exploiting, harming, or attempting to exploit or harm minors in any way by exposing them to inappropriate content or otherwise.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">0.3. To transmit, or procure the sending of, any advertising or promotional material, including any “junk mail”, “chain letter,” “spam,” or any other similar solicitation.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">0.4. To impersonate or attempt to impersonate Company, a Company employee, another user, or any other person or entity.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">0.5. In any way that infringes upon the rights of others, or in any way is illegal, threatening, fraudulent, or harmful, or in connection with any unlawful, illegal, fraudulent, or harmful purpose or activity.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">0.6. To engage in any other conduct that restricts or inhibits anyone’s use or enjoyment of Service, or which, as determined by us, may harm or offend Company or users of Service or expose them to liability.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">Additionally, you agree not to:</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">0.1. Use Service in any manner that could disable, overburden, damage, or impair Service or interfere with any other party’s use of Service, including their ability to engage in real time activities through Service.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">0.2. Use any robot, spider, or other automatic device, process, or means to access Service for any purpose, including monitoring or copying any of the material on Service.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">0.3. Use any manual process to monitor or copy any of the material on Service or for any other unauthorized purpose without our prior written consent.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">0.4. Use any device, software, or routine that interferes with the proper working of Service.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">0.5. Introduce any viruses, trojan horses, worms, logic bombs, or other material which is malicious or technologically harmful.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">0.6. Attempt to gain unauthorized access to, interfere with, damage, or disrupt any parts of Service, the server on which Service is stored, or any server, computer, or database connected to Service.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">0.7. Attack Service via a denial-of-service attack or a distributed denial-of-service attack.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">0.8. Take any action that may damage or falsify Company rating.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">0.9. Otherwise attempt to interfere with the proper working of Service.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">11. <b>Analytics</b></span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">We may use third-party Service Providers to monitor and analyze the use of our Service.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">12. <b>No Use By Minors</b></span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">Service is intended only for access and use by individuals at least eighteen (18) years old. By accessing or using Service, you warrant and represent that you are at least eighteen (18) years of age and with the full authority, right, and capacity to enter into this agreement and abide by all of the terms and conditions of Terms. However Parent /Guardians can register their stewards directly under them, such account shall be seen as sub account of Individual of at least 18 years old.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">13. <b>Accounts</b></span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">When you create an account with us, you guarantee that you are above the age of 18, and that the information you provide us is accurate, complete, and current at all times. Inaccurate, incomplete, or obsolete information may result in the immediate termination of your account on Service.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">You are responsible for maintaining the confidentiality of your account and password, including but not limited to the restriction of access to your computer and/or account. You agree to accept responsibility for any and all activities or actions that occur under your account and/or password, whether your password is with our Service or a third-party service. You must notify us immediately upon becoming aware of any breach of security or unauthorized use of your account.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">You may not use as a username the name of another person or entity or that is not lawfully available for use, a name or trademark that is subject to any rights of another person or entity other than you, without appropriate authorization. You may not use as a username any name that is offensive, vulgar or obscene.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">We reserve the right to refuse service, terminate accounts, remove or edit content, or cancel orders in our sole discretion.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\"> </span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">14. <b>Intellectual Property</b></span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">Service and its original content (excluding Content provided by users), features and functionality are and will remain the exclusive property of GLOBAL WEALTH SYSTEMS and its licensors. Service is protected by copyright, trademark, and other laws of and foreign countries. Our trademarks may not be used in connection with any product or service without the prior written consent of GLOBAL WEALTH SYSTEMS.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">15. <b>Copyright Policy</b></span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">We respect the intellectual property rights of others. It is our policy to respond to any claim that Content posted on Service infringes on the copyright or other intellectual property rights (“Infringement”) of any person or entity.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">If you are a copyright owner, or authorized on behalf of one, and you believe that the copyrighted work has been copied in a way that constitutes copyright infringement, please submit your claim via email to <a href=\"mailto:support@globalwealths.org\" style=\"color: rgb(17, 85, 204);\" target=\"_blank\">support@globalwealths.org</a>, with the subject line: “Copyright Infringement” and include in your claim a detailed description of the alleged Infringement as detailed below, under “DMCA Notice and Procedure for Copyright Infringement Claims”</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">You may be held accountable for damages (including costs and attorneys’ fees) for misrepresentation or bad-faith claims on the infringement of any Content found on and/or through Service on your copyright.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">16. <b>DMCA Notice and Procedure for Copyright Infringement Claims</b></span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">You may submit a notification pursuant to the Digital Millennium Copyright Act (DMCA) by providing our Copyright Agent with the following information in writing (see 17 U.S.C 512(c)(3) for further detail):</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">0.1. an electronic or physical signature of the person authorized to act on behalf of the owner of the copyright’s interest;</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">0.2. a description of the copyrighted work that you claim has been infringed, including the URL (i.e., web page address) of the location where the copyrighted work exists or a copy of the copyrighted work;</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">0.3. identification of the URL or other specific location on Service where the material that you claim is infringing is located;</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">0.4. your address, telephone number, and email address;</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">0.5. a statement by you that you have a good faith belief that the disputed use is not authorized by the copyright owner, its agent, or the law;</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">0.6. a statement by you, made under penalty of perjury, that the above information in your notice is accurate and that you are the copyright owner or authorized to act on the copyright owner’s behalf.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">You can contact our Copyright Agent via email at <a href=\"mailto:support@globalwealths.org\" style=\"color: rgb(17, 85, 204);\" target=\"_blank\">support@globalwealths.org</a>.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">17. <b>Error Reporting and Feedback</b></span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">You may provide us either directly at <a href=\"mailto:support@globalwealths.org\" style=\"color: rgb(17, 85, 204);\" target=\"_blank\">support@globalwealths.org</a> or via third party sites and tools with information and feedback concerning errors, suggestions for improvements, ideas, problems, complaints, and other matters related to our Service (“Feedback”). You acknowledge and agree that: (i) you shall not retain, acquire or assert any intellectual property right or other right, title or interest in or to the Feedback; (ii) Company may have development ideas similar to the Feedback; (iii) Feedback does not contain confidential information or proprietary information from you or any third party; and (iv) Company is not under any obligation of confidentiality with respect to the Feedback. In the event the transfer of the ownership to the Feedback is not possible due to applicable mandatory laws, you grant Company and its affiliates an exclusive, transferable, irrevocable, free-of-charge, sub-licensable, unlimited and perpetual right to use (including copy, modify, create derivative works, publish, distribute and commercialize) Feedback in any manner and for any purpose.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">18. <b>Links To Other Web Sites</b></span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">Our Service may contain links to third party web sites or services that are not owned or controlled by GLOBAL WEALTH SYSTEMS.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">GLOBAL WEALTH SYSTEMS has no control over, and assumes no responsibility for the content, privacy policies, or practices of any third party web sites or services. We do not warrant the offerings of any of these entities/individuals or their websites.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">For example, the outlined <a data-saferedirecturl=\"https://www.google.com/url?q=https://policymaker.io/terms-and-conditions/&source=gmail&ust=1611390728313000&usg=AFQjCNGFiutLy01bUKB4YE4z52k8sP11uQ\" href=\"https://policymaker.io/terms-and-conditions/\" rel=\"nofollow\" style=\"color: rgb(17, 85, 204);\" target=\"_blank\"><span style=\"color: blue;\">Terms of Use</span></a> have been created using <a data-saferedirecturl=\"https://www.google.com/url?q=https://policymaker.io/&source=gmail&ust=1611390728313000&usg=AFQjCNHraGcYmV2mKTL1Rgoz2Dab-tdnHA\" href=\"https://policymaker.io/\" rel=\"nofollow\" style=\"color: rgb(17, 85, 204);\" target=\"_blank\"><span style=\"color: blue;\">PolicyMaker.io</span></a>, a free web application for generating high-quality legal documents. PolicyMaker’s <a data-saferedirecturl=\"https://www.google.com/url?q=https://policymaker.io/terms-and-conditions/&source=gmail&ust=1611390728313000&usg=AFQjCNGFiutLy01bUKB4YE4z52k8sP11uQ\" href=\"https://policymaker.io/terms-and-conditions/\" rel=\"nofollow\" style=\"color: rgb(17, 85, 204);\" target=\"_blank\"><span style=\"color: blue;\">Terms and Conditions generator</span></a> is an easy-to-use free tool for creating an excellent standard Terms of Service template for a website, blog, e-commerce store or app.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">YOU ACKNOWLEDGE AND AGREE THAT COMPANY SHALL NOT BE RESPONSIBLE OR LIABLE, DIRECTLY OR INDIRECTLY, FOR ANY DAMAGE OR LOSS CAUSED OR ALLEGED TO BE CAUSED BY OR IN CONNECTION WITH USE OF OR RELIANCE ON ANY SUCH CONTENT, GOODS OR SERVICES AVAILABLE ON OR THROUGH ANY SUCH THIRD PARTY WEB SITES OR SERVICES.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">WE STRONGLY ADVISE YOU TO READ THE TERMS OF SERVICE AND PRIVACY POLICIES OF ANY THIRD PARTY WEB SITES OR SERVICES THAT YOU VISIT.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">19. <b>Disclaimer Of Warranty</b></span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">THESE SERVICES ARE PROVIDED BY COMPANY ON AN “AS IS” AND “AS AVAILABLE” BASIS. COMPANY MAKES NO REPRESENTATIONS OR WARRANTIES OF ANY KIND, EXPRESS OR IMPLIED, AS TO THE OPERATION OF THEIR SERVICES, OR THE INFORMATION, CONTENT OR MATERIALS INCLUDED THEREIN. YOU EXPRESSLY AGREE THAT YOUR USE OF THESE SERVICES, THEIR CONTENT, AND ANY SERVICES OR ITEMS OBTAINED FROM US IS AT YOUR SOLE RISK.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">NEITHER COMPANY NOR ANY PERSON ASSOCIATED WITH COMPANY MAKES ANY WARRANTY OR REPRESENTATION WITH RESPECT TO THE COMPLETENESS, SECURITY, RELIABILITY, QUALITY, ACCURACY, OR AVAILABILITY OF THE SERVICES. WITHOUT LIMITING THE FOREGOING, NEITHER COMPANY NOR ANYONE ASSOCIATED WITH COMPANY REPRESENTS OR WARRANTS THAT THE SERVICES, THEIR CONTENT, OR ANY SERVICES OR ITEMS OBTAINED THROUGH THE SERVICES WILL BE ACCURATE, RELIABLE, ERROR-FREE, OR UNINTERRUPTED, THAT DEFECTS WILL BE CORRECTED, THAT THE SERVICES OR THE SERVER THAT MAKES IT AVAILABLE ARE FREE OF VIRUSES OR OTHER HARMFUL COMPONENTS OR THAT THE SERVICES OR ANY SERVICES OR ITEMS OBTAINED THROUGH THE SERVICES WILL OTHERWISE MEET YOUR NEEDS OR EXPECTATIONS.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">COMPANY HEREBY DISCLAIMS ALL WARRANTIES OF ANY KIND, WHETHER EXPRESS OR IMPLIED, STATUTORY, OR OTHERWISE, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT, AND FITNESS FOR PARTICULAR PURPOSE.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">THE FOREGOING DOES NOT AFFECT ANY WARRANTIES WHICH CANNOT BE EXCLUDED OR LIMITED UNDER APPLICABLE LAW.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">20. <b>Limitation Of Liability</b></span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">EXCEPT AS PROHIBITED BY LAW, YOU WILL HOLD US AND OUR OFFICERS, DIRECTORS, EMPLOYEES, AND AGENTS HARMLESS FOR ANY INDIRECT, PUNITIVE, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGE, HOWEVER IT ARISES (INCLUDING ATTORNEYS’ FEES AND ALL RELATED COSTS AND EXPENSES OF LITIGATION AND ARBITRATION, OR AT TRIAL OR ON APPEAL, IF ANY, WHETHER OR NOT LITIGATION OR ARBITRATION IS INSTITUTED), WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE, OR OTHER TORTIOUS ACTION, OR ARISING OUT OF OR IN CONNECTION WITH THIS AGREEMENT, INCLUDING WITHOUT LIMITATION ANY CLAIM FOR PERSONAL INJURY OR PROPERTY DAMAGE, ARISING FROM THIS AGREEMENT AND ANY VIOLATION BY YOU OF ANY FEDERAL, STATE, OR LOCAL LAWS, STATUTES, RULES, OR REGULATIONS, EVEN IF COMPANY HAS BEEN PREVIOUSLY ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. EXCEPT AS PROHIBITED BY LAW, IF THERE IS LIABILITY FOUND ON THE PART OF COMPANY, IT WILL BE LIMITED TO THE AMOUNT PAID FOR THE PRODUCTS AND/OR SERVICES, AND UNDER NO CIRCUMSTANCES WILL THERE BE CONSEQUENTIAL OR PUNITIVE DAMAGES. SOME STATES DO NOT ALLOW THE EXCLUSION OR LIMITATION OF PUNITIVE, INCIDENTAL OR CONSEQUENTIAL DAMAGES, SO THE PRIOR LIMITATION OR EXCLUSION MAY NOT APPLY TO YOU.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">21. <b>Termination</b></span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">We may terminate or suspend your account and bar access to Service immediately, without prior notice or liability, under our sole discretion, for any reason whatsoever and without limitation, including but not limited to a breach of Terms.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">If you wish to terminate your account, you may simply discontinue using Service.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">All provisions of Terms which by their nature should survive termination shall survive termination, including, without limitation, ownership provisions, warranty disclaimers, indemnity and limitations of liability.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">22. <b>Governing Law</b></span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">These Terms shall be governed and construed in accordance with the laws of GLOBALLY, which governing law applies to agreement without regard to its conflict of law provisions.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">Our failure to enforce any right or provision of these Terms will not be considered a waiver of those rights. If any provision of these Terms is held to be invalid or unenforceable by a court, the remaining provisions of these Terms will remain in effect. These Terms constitute the entire agreement between us regarding our Service and supersede and replace any prior agreements we might have had between us regarding Service.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">23. <b>Changes To Service</b></span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">We reserve the right to withdraw or amend our Service, and any service or material we provide via Service, in our sole discretion without notice. We will not be liable if for any reason all or any part of Service is unavailable at any time or for any period. From time to time, we may restrict access to some parts of Service, or the entire Service, to users, including registered users.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">24. <b>Amendments To Terms</b></span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">We may amend Terms at any time by posting the amended terms on this site. It is your responsibility to review these Terms periodically.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">Your continued use of the Platform following the posting of revised Terms means that you accept and agree to the changes. You are expected to check this page frequently so you are aware of any changes, as they are binding on you.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">By continuing to access or use our Service after any revisions become effective, you agree to be bound by the revised terms. If you do not agree to the new terms, you are no longer authorized to use Service.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">25. <b>Waiver And Severability</b></span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">No waiver by Company of any term or condition set forth in Terms shall be deemed a further or continuing waiver of such term or condition or a waiver of any other term or condition, and any failure of Company to assert a right or provision under Terms shall not constitute a waiver of such right or provision.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">If any provision of Terms is held by a court or other tribunal of competent jurisdiction to be invalid, illegal or unenforceable for any reason, such provision shall be eliminated or limited to the minimum extent such that the remaining provisions of Terms will continue in full force and effect.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">26. <b>Acknowledgement</b></span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">BY USING SERVICE OR OTHER SERVICES PROVIDED BY US, YOU ACKNOWLEDGE THAT YOU HAVE READ THESE TERMS OF SERVICE AND AGREE TO BE BOUND BY THEM.</span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">27. <b>Contact Us</b></span></p>\n\n<p style=\"color: rgb(34, 34, 34); font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 13px; line-height: normal;\"><span style=\"font-size: 12pt; font-family: \"Times New Roman\", serif;\">Please send your feedback, comments, requests for technical support by email: <b><a href=\"mailto:support@globalwealths.org\" style=\"color: rgb(17, 85, 204);\" target=\"_blank\">support@globalwealths.org</a></b>.</span></p>\n\n<p> </p>\n</div>\n', '2022-10-05 22:44:59', 'editTermsCondition');
INSERT INTO `confidential` (`id`, `confidential_key`, `confidential_value`, `last_updated`, `controller`) VALUES
(3, 'how_it_works', '<p>&nbsp;</p>\n\n<p>&nbsp;<strong>HOW IT WORKS</strong></p>\n\n<p>Get registered using our access easy way and ensure you put in your correct Name, Phone &amp; email. An ACCESS CODE will be sent to you via your phone/email. Enter the ACCESS CODE in the EMPOWERMENT box and follow the process.</p>\n\n<p>When you have successfully completed your registration, you are in for a big time empowerment as an AFFILIATE Level Member. In AFFILIATE level you will earn some income both in cash plus other products and then from there you grow into a SUPERVISOR. At this level you will become a confirm member, where so many incentives and benefits will be accrued to your basic earnings. &nbsp;</p>\n\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\n\n<p><strong>&nbsp;HOW TO MAKE &amp; RECEIVE PAYMENT</strong></p>\n\n<p>We have a universal method which will enable you to make and also receive payment.</p>\n\n<p>Debt Card; with your debt Card you can make your membership registration.</p>\n\n<p>As you earn income, you can transfer cash from your e-wallet to your local bank account (naira) or you pay it into your GWS CARD and start using it.</p>\n\n<p>Also you can use your virtual account (e-wallet) that is funded and register new partners from it. As all your earnings and bonuses are deposited in the virtual (e-wallet) account, you can withdraw it through any of the options provided. This process takes minutes upon your request to withdraw.</p>\n\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\n\n<p><strong>&nbsp;</strong><strong>EMPOWERMENT PLAN</strong></p>\n\n<p align=\"center\">&nbsp;</p>\n\n<table border=\"1\" cellpadding=\"0\" cellspacing=\"0\">\n	<tbody>\n		<tr>\n			<td colspan=\"4\" style=\"width:535px;\">\n			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <strong>AFFILIATE </strong></p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"width:64px;\">\n			<p>LEVEL</p>\n			</td>\n			<td style=\"width:60px;\">\n			<p>TEAM</p>\n			</td>\n			<td style=\"width:196px;\">\n			<p>CASH</p>\n			</td>\n			<td style=\"width:216px;\">\n			<p>GWS PRODUCT</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"width:64px;\">\n			<p>1</p>\n			</td>\n			<td style=\"width:60px;\">\n			<p>2</p>\n			</td>\n			<td style=\"width:196px;\">\n			<p>$1.66 (N830)</p>\n			</td>\n			<td style=\"width:216px;\">\n			<p>$1.32 (N660)</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"width:64px;\">\n			<p>2</p>\n			</td>\n			<td style=\"width:60px;\">\n			<p>4</p>\n			</td>\n			<td style=\"width:196px;\">\n			<p>$3.34 (N1670)</p>\n			</td>\n			<td style=\"width:216px;\">\n			<p>$2.26&nbsp; (N1340)</p>\n			</td>\n		</tr>\n		<tr>\n			<td colspan=\"2\" style=\"width:124px;\">\n			<p><strong>TOTAL:</strong></p>\n			</td>\n			<td style=\"width:196px;\">\n			<p><strong>$5 (N2500)</strong></p>\n			</td>\n			<td style=\"width:216px;\">\n			<p><strong>$$4 (N2000)</strong></p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>Here your need 6 members to join you and complete your Affiliate Stage board, you the move to the next Stage (Supervisor).</p>\n\n<p>&nbsp;</p>\n\n<table border=\"1\" cellpadding=\"0\" cellspacing=\"0\">\n	<tbody>\n		<tr>\n			<td colspan=\"4\" style=\"width:535px;\">\n			<p style=\"margin-left:36.0pt;\">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; <strong>SUPERVISOR</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"width:64px;\">\n			<p>LEVEL</p>\n			</td>\n			<td style=\"width:60px;\">\n			<p>TEAM</p>\n			</td>\n			<td style=\"width:196px;\">\n			<p>CASH</p>\n			</td>\n			<td style=\"width:216px;\">\n			<p>GWS PRODUCT</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"width:64px;\">\n			<p>1</p>\n			</td>\n			<td style=\"width:60px;\">\n			<p>2</p>\n			</td>\n			<td style=\"width:196px;\">\n			<p>$4.28 (N2140)</p>\n			</td>\n			<td style=\"width:216px;\">\n			<p>$2 (1000)</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"width:64px;\">\n			<p>2</p>\n			</td>\n			<td style=\"width:60px;\">\n			<p>4</p>\n			</td>\n			<td style=\"width:196px;\">\n			<p>$8.56 (N4280)</p>\n			</td>\n			<td style=\"width:216px;\">\n			<p>$4 (2000)</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"width:64px;\">\n			<p>3</p>\n			</td>\n			<td style=\"width:60px;\">\n			<p>8</p>\n			</td>\n			<td style=\"width:196px;\">\n			<p>$17.16 (N8580)</p>\n			</td>\n			<td style=\"width:216px;\">\n			<p>$8 (4000)</p>\n			</td>\n		</tr>\n		<tr>\n			<td colspan=\"2\" style=\"width:124px;\">\n			<p><strong>TOTAL:</strong></p>\n			</td>\n			<td style=\"width:196px;\">\n			<p><strong>$30 (15,000)</strong></p>\n			</td>\n			<td style=\"width:216px;\">\n			<p><strong>$14 (N7000)</strong></p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>Here you need 14 members who have completed their Affiliate Stage to join you in your Supervisor board. You then move to the next Stage (Manager) and gain the added benefits</p>\n\n<p><strong>PLUS; Free HMO for 6 Months</strong></p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<table border=\"1\" cellpadding=\"0\" cellspacing=\"0\">\n	<tbody>\n		<tr>\n			<td colspan=\"4\" style=\"width:535px;\">\n			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <strong>MANAGER</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"width:64px;\">\n			<p>LEVEL</p>\n			</td>\n			<td style=\"width:60px;\">\n			<p>TEAM</p>\n			</td>\n			<td style=\"width:196px;\">\n			<p>CASH</p>\n			</td>\n			<td style=\"width:216px;\">\n			<p>GWS PRODUCT</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"width:64px;\">\n			<p>1</p>\n			</td>\n			<td style=\"width:60px;\">\n			<p>2</p>\n			</td>\n			<td style=\"width:196px;\">\n			<p>$14.28 (N7140)</p>\n			</td>\n			<td style=\"width:216px;\">\n			<p>$5.8 (N2900)</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"width:64px;\">\n			<p>2</p>\n			</td>\n			<td style=\"width:60px;\">\n			<p>4</p>\n			</td>\n			<td style=\"width:196px;\">\n			<p>$28.56 (N14,280)</p>\n			</td>\n			<td style=\"width:216px;\">\n			<p>$11.4 (N5700)</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"width:64px;\">\n			<p>3</p>\n			</td>\n			<td style=\"width:60px;\">\n			<p>8</p>\n			</td>\n			<td style=\"width:196px;\">\n			<p>$57.16 (N28,580)</p>\n			</td>\n			<td style=\"width:216px;\">\n			<p>$22.8 (N1,400)</p>\n			</td>\n		</tr>\n		<tr>\n			<td colspan=\"2\" style=\"width:124px;\">\n			<p><strong>TOTAL:</strong></p>\n			</td>\n			<td style=\"width:196px;\">\n			<p><strong>$100 (N50,000)</strong></p>\n			</td>\n			<td style=\"width:216px;\">\n			<p><strong>$40 (N20,000)</strong></p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>Here you need 14 members who have completed their Supervisor Stage to join you in your Manager Board. You then move to the next Stage (Senior Manager) and gain the added benefits</p>\n\n<p><strong><em>Additional Incentives;</em></strong></p>\n\n<p><strong>Brand New mini LAPTOP $120(N60,000) or 32&quot; LED Flat Screen TV +</strong></p>\n\n<p><strong>Free HMO +&nbsp; GWS T-Shirt &amp; Investment Support of $300 (N150,000) </strong></p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<table border=\"1\" cellpadding=\"0\" cellspacing=\"0\">\n	<tbody>\n		<tr>\n			<td colspan=\"4\" style=\"width:535px;\">\n			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>SENIOR MANAGER&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong></p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"width:64px;\">\n			<p>LEVEL</p>\n			</td>\n			<td style=\"width:60px;\">\n			<p>TEAM</p>\n			</td>\n			<td style=\"width:196px;\">\n			<p>CASH</p>\n			</td>\n			<td style=\"width:216px;\">\n			<p>GWS PRODUCT</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"width:64px;\">\n			<p>1</p>\n			</td>\n			<td style=\"width:60px;\">\n			<p>2</p>\n			</td>\n			<td style=\"width:196px;\">\n			<p>$91.40 (N45,700)</p>\n			</td>\n			<td style=\"width:216px;\">\n			<p>$14.28 (N7140)</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"width:64px;\">\n			<p>2</p>\n			</td>\n			<td style=\"width:60px;\">\n			<p>4</p>\n			</td>\n			<td style=\"width:196px;\">\n			<p>$182.84 (N91420)</p>\n			</td>\n			<td style=\"width:216px;\">\n			<p>$28.56 (N14,280)</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"width:64px;\">\n			<p>3</p>\n			</td>\n			<td style=\"width:60px;\">\n			<p>8</p>\n			</td>\n			<td style=\"width:196px;\">\n			<p>$365.76 (N182,880)</p>\n			</td>\n			<td style=\"width:216px;\">\n			<p>$57.16 (N28,580)</p>\n			</td>\n		</tr>\n		<tr>\n			<td colspan=\"2\" style=\"width:124px;\">\n			<p><strong>TOTAL:</strong></p>\n			</td>\n			<td style=\"width:196px;\">\n			<p><strong>$640 (N320,000)</strong></p>\n			</td>\n			<td style=\"width:216px;\">\n			<p><strong>$100 (50,000)</strong></p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>Here you need 14 members who have completed their Manager Stage to join you in your Senior Manager Board. You then move to the next Stage (General Manager) and gain the added benefits</p>\n\n<p><strong><em>Additional Incentives;</em></strong></p>\n\n<p><strong>All Expenses paid Trip to Dubai $540 (N270,000)</strong></p>\n\n<p><strong>Select a Beneficiary for BSc/ Master&rsquo;s Degree Scholarship with Int&rsquo;I Certificate, courtesy of JPTS</strong></p>\n\n<p><strong>Unit Of Land at UNIC Estate + Free HMO</strong></p>\n\n<p><strong>Promo Bonus + Business Investment Support of $600 (N300,000)</strong></p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<table border=\"1\" cellpadding=\"0\" cellspacing=\"0\">\n	<tbody>\n		<tr>\n			<td colspan=\"4\" style=\"width:535px;\">\n			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; <strong>GENERAL MANAGER</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"width:64px;\">\n			<p>LEVEL</p>\n			</td>\n			<td style=\"width:60px;\">\n			<p>TEAM</p>\n			</td>\n			<td style=\"width:196px;\">\n			<p>CASH</p>\n			</td>\n			<td style=\"width:216px;\">\n			<p>GWS PRODUCT</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"width:64px;\">\n			<p>1</p>\n			</td>\n			<td style=\"width:60px;\">\n			<p>2</p>\n			</td>\n			<td style=\"width:196px;\">\n			<p>$417.14 (N208,570)</p>\n			</td>\n			<td style=\"width:216px;\">\n			<p>$28.56 (N14,280)</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"width:64px;\">\n			<p>2</p>\n			</td>\n			<td style=\"width:60px;\">\n			<p>4</p>\n			</td>\n			<td style=\"width:196px;\">\n			<p>$834.28 (N417,140)</p>\n			</td>\n			<td style=\"width:216px;\">\n			<p>$57.12 (N28,560)</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"width:64px;\">\n			<p>3</p>\n			</td>\n			<td style=\"width:60px;\">\n			<p>8</p>\n			</td>\n			<td style=\"width:196px;\">\n			<p>$1668.58 (N834,290)</p>\n			</td>\n			<td style=\"width:216px;\">\n			<p>$114.32 (N57,160)</p>\n			</td>\n		</tr>\n		<tr>\n			<td colspan=\"2\" style=\"width:124px;\">\n			<p><strong>TOTAL:</strong></p>\n			</td>\n			<td style=\"width:196px;\">\n			<p><strong>$2920 (N1,460,000)</strong></p>\n			</td>\n			<td style=\"width:216px;\">\n			<p><strong>$200 (N100,000)</strong></p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>Here you need 14 members who have completed their Senior Manager Stage to join you in your General Manager Board. You then move to the next Stage ( Director) and gain the added benefits</p>\n\n<p><strong><em>Additional Incentives</em></strong><strong>;</strong></p>\n\n<p><strong>A Car Worth of $4000 (N2,000,000)</strong></p>\n\n<p><strong>Select Master&rsquo;s Degree Scholarship with Int&rsquo;I Certificate, courtesy of JPTS</strong><strong> Or&nbsp; Cash of $400 (N200,000)</strong></p>\n\n<p><strong>A Plot Of Land $480 (N240,000) at UNIC Estate + Free HMO</strong></p>\n\n<p><strong>Sponsored Family Holidays.</strong></p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<table border=\"1\" cellpadding=\"0\" cellspacing=\"0\">\n	<tbody>\n		<tr>\n			<td colspan=\"4\" style=\"width:535px;\">\n			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>DIRECTOR</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"width:64px;\">\n			<p>LEVEL</p>\n			</td>\n			<td style=\"width:60px;\">\n			<p>TEAM</p>\n			</td>\n			<td style=\"width:196px;\">\n			<p>CASH</p>\n			</td>\n			<td style=\"width:216px;\">\n			<p>GWS PRODUCT</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"width:64px;\">\n			<p>1</p>\n			</td>\n			<td style=\"width:60px;\">\n			<p>2</p>\n			</td>\n			<td style=\"width:196px;\">\n			<p>$162.84 (N81,420)</p>\n			</td>\n			<td style=\"width:216px;\">\n			<p>$85.7 (N42,850)</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"width:64px;\">\n			<p>2</p>\n			</td>\n			<td style=\"width:60px;\">\n			<p>4</p>\n			</td>\n			<td style=\"width:196px;\">\n			<p>$325.68 (N162,840)</p>\n			</td>\n			<td style=\"width:216px;\">\n			<p>$171.4 (N85,700)</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"width:64px;\">\n			<p>3</p>\n			</td>\n			<td style=\"width:60px;\">\n			<p>8</p>\n			</td>\n			<td style=\"width:196px;\">\n			<p>$651.48 (N325,740)</p>\n			</td>\n			<td style=\"width:216px;\">\n			<p>$342.9 (N171,450)</p>\n			</td>\n		</tr>\n		<tr>\n			<td colspan=\"2\" style=\"width:124px;\">\n			<p><strong>TOTAL:</strong></p>\n			</td>\n			<td style=\"width:196px;\">\n			<p><strong>$1140 (N5,700,000)</strong></p>\n			</td>\n			<td style=\"width:216px;\">\n			<p><strong>$600 (N300,000)</strong></p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>Here you need 14 members who have completed their General Manager Stage to join you in your Director Board. As a qualified Direct in GWS you&#39;ll gain the added benefits and many more as a stakeholder in the company.</p>\n\n<p><strong><em>Additional Incentives</em></strong><strong>;</strong></p>\n\n<p><strong>House at UNIC Estate $18,000 (N9,000,000) </strong></p>\n\n<p><strong>SUV worth $10,000 (N5,000,000) + Free HMO + Gratuity Bonus</strong></p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p><strong>WHY YOU SHOULD BE PART OF GWS REFERER REWARD SYSTEM</strong></p>\n\n<ul style=\"list-style-type:circle;\">\n	<li>It&rsquo;s Spillover and displacement automated</li>\n	<li>Payment made easy both for paying in and cashing out</li>\n	<li>Awards, Rewards and Bonuses are rightly given at all times</li>\n	<li>You&rsquo;ll get your benefits, products, goods and services very fast</li>\n	<li>You need no skill nor any qualification to join</li>\n	<li>Your capital will give you back multiple income &amp; benefits</li>\n	<li>You&rsquo;ll get commission anytime you buy any of our products and you&rsquo;ll make profit if you resale it</li>\n	<li>You can run it from any location in the world at your very convenient</li>\n	<li>We offer you space in our system to run your personal business advert to millions of viewers free</li>\n	<li>Opportunity to attend international sponsored conferences and symposia</li>\n</ul>\n\n<p>You&rsquo;ll be getting full sponsorship scholarship and family international vacation</p>\n\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\n\n<p>&nbsp;&nbsp;&nbsp;</p>\n\n<p>&nbsp;</p>\n<div style=\"display:none\">\n<a href=\"https://www.usreplica.me\">replica watches</a>\n<a href=\"https://www.ukreplica.me\">1:1 best edition replica watches</a>\n\n</div>', '2021-11-02 13:56:52', 'howItWorks'),
(4, 'about_us', '<p><strong>ABOUT US</strong></p>\n\n<p>Global Wealth System (GWS) : Life Transforming Organization Setup to helping You Achieve Great Financial Freedom.</p>\n\n<p>&nbsp;</p>\n\n<p><strong>OUR VISION</strong>:</p>\n\n<p>To raise largest entrepreneurship network Worldwide with active business support mechanism spanning Grant, Business Mentorship Scholarship, Networking, financial freedom, employment Provision, etc</p>\n\n<p>&nbsp;</p>\n\n<p><strong>OUR MISSION</strong>:</p>\n\n<p>To empower the people with cognitive and material tools for successful living.</p>\n\n<p>To create a Global Economy of independent, dynamic, visionary, great business leaders &amp; influencers.</p>\n', '2021-12-21 20:30:51', 'aboutUs'),
(5, 'how_it_works_employee', '<h1>GWS Employment</h1>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', '2020-05-31 11:41:11', 'howItWorksEmployee'),
(6, 'how_it_works-copy', '<p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong><strong>EMPOWERMENT PLAN</strong></p>\r\n\r\n<p align=\"center\">&nbsp;</p>\r\n\r\n<table border=\"1\" cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td colspan=\"4\" style=\"width:535px;\">\r\n			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>AFFILIATE </strong></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:64px;\">\r\n			<p>LEVEL</p>\r\n			</td>\r\n			<td style=\"width:60px;\">\r\n			<p>TEAM</p>\r\n			</td>\r\n			<td style=\"width:196px;\">\r\n			<p>CASH</p>\r\n			</td>\r\n			<td style=\"width:216px;\">\r\n			<p>UNIC PRODUCT</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:64px;\">\r\n			<p>1</p>\r\n			</td>\r\n			<td style=\"width:60px;\">\r\n			<p>2</p>\r\n			</td>\r\n			<td style=\"width:196px;\">\r\n			<p>$1.66 (N830)</p>\r\n			</td>\r\n			<td style=\"width:216px;\">\r\n			<p>$1.32 (N660)</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:64px;\">\r\n			<p>2</p>\r\n			</td>\r\n			<td style=\"width:60px;\">\r\n			<p>4</p>\r\n			</td>\r\n			<td style=\"width:196px;\">\r\n			<p>$3.34 (N1670)</p>\r\n			</td>\r\n			<td style=\"width:216px;\">\r\n			<p>$2.26&nbsp; (N1340)</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\" style=\"width:124px;\">\r\n			<p><strong>TOTAL:</strong></p>\r\n			</td>\r\n			<td style=\"width:196px;\">\r\n			<p><strong>$5 (N2500)</strong></p>\r\n			</td>\r\n			<td style=\"width:216px;\">\r\n			<p><strong>$$4 (N2000)</strong></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<table border=\"1\" cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td colspan=\"4\" style=\"width:535px;\">\r\n			<p style=\"margin-left:36.0pt;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>SUPERVISOR</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:64px;\">\r\n			<p>LEVEL</p>\r\n			</td>\r\n			<td style=\"width:60px;\">\r\n			<p>TEAM</p>\r\n			</td>\r\n			<td style=\"width:196px;\">\r\n			<p>CASH</p>\r\n			</td>\r\n			<td style=\"width:216px;\">\r\n			<p>UNIC PRODUCT</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:64px;\">\r\n			<p>1</p>\r\n			</td>\r\n			<td style=\"width:60px;\">\r\n			<p>2</p>\r\n			</td>\r\n			<td style=\"width:196px;\">\r\n			<p>$4.28 (N2140)</p>\r\n			</td>\r\n			<td style=\"width:216px;\">\r\n			<p>$2 (1000)</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:64px;\">\r\n			<p>2</p>\r\n			</td>\r\n			<td style=\"width:60px;\">\r\n			<p>4</p>\r\n			</td>\r\n			<td style=\"width:196px;\">\r\n			<p>$8.56 (N4280)</p>\r\n			</td>\r\n			<td style=\"width:216px;\">\r\n			<p>$4 (2000)</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:64px;\">\r\n			<p>3</p>\r\n			</td>\r\n			<td style=\"width:60px;\">\r\n			<p>8</p>\r\n			</td>\r\n			<td style=\"width:196px;\">\r\n			<p>$17.16 (N8580)</p>\r\n			</td>\r\n			<td style=\"width:216px;\">\r\n			<p>$8 (4000)</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\" style=\"width:124px;\">\r\n			<p><strong>TOTAL:</strong></p>\r\n			</td>\r\n			<td style=\"width:196px;\">\r\n			<p><strong>$30 (15,000)</strong></p>\r\n			</td>\r\n			<td style=\"width:216px;\">\r\n			<p><strong>$14 (N7000)</strong></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><strong>PLUS; Free HMO</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<table border=\"1\" cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td colspan=\"4\" style=\"width:535px;\">\r\n			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>MANAGER</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:64px;\">\r\n			<p>LEVEL</p>\r\n			</td>\r\n			<td style=\"width:60px;\">\r\n			<p>TEAM</p>\r\n			</td>\r\n			<td style=\"width:196px;\">\r\n			<p>CASH</p>\r\n			</td>\r\n			<td style=\"width:216px;\">\r\n			<p>UNIC PRODUCT</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:64px;\">\r\n			<p>1</p>\r\n			</td>\r\n			<td style=\"width:60px;\">\r\n			<p>2</p>\r\n			</td>\r\n			<td style=\"width:196px;\">\r\n			<p>$14.28 (N7140)</p>\r\n			</td>\r\n			<td style=\"width:216px;\">\r\n			<p>$5.8 (N2900)</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:64px;\">\r\n			<p>2</p>\r\n			</td>\r\n			<td style=\"width:60px;\">\r\n			<p>4</p>\r\n			</td>\r\n			<td style=\"width:196px;\">\r\n			<p>$28.56 (N14,280)</p>\r\n			</td>\r\n			<td style=\"width:216px;\">\r\n			<p>$11.4 (N5700)</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:64px;\">\r\n			<p>3</p>\r\n			</td>\r\n			<td style=\"width:60px;\">\r\n			<p>8</p>\r\n			</td>\r\n			<td style=\"width:196px;\">\r\n			<p>$57.16 (N28,580)</p>\r\n			</td>\r\n			<td style=\"width:216px;\">\r\n			<p>$22.8 (N1,400)</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\" style=\"width:124px;\">\r\n			<p><strong>TOTAL:</strong></p>\r\n			</td>\r\n			<td style=\"width:196px;\">\r\n			<p><strong>$100 (N50,000)</strong></p>\r\n			</td>\r\n			<td style=\"width:216px;\">\r\n			<p><strong>$40 (N20,000)</strong></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><strong><em>Additional Incentives;</em></strong></p>\r\n\r\n<p><strong>JPTS 100 Level Scholarship Or Brand New mini LAPTOP $120(N60,000) +</strong></p>\r\n\r\n<p><strong>Free HMO +&nbsp; Promo Bonus &amp;&nbsp; Financial Grant </strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<table border=\"1\" cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td colspan=\"4\" style=\"width:535px;\">\r\n			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>SENIOR MANAGER&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:64px;\">\r\n			<p>LEVEL</p>\r\n			</td>\r\n			<td style=\"width:60px;\">\r\n			<p>TEAM</p>\r\n			</td>\r\n			<td style=\"width:196px;\">\r\n			<p>CASH</p>\r\n			</td>\r\n			<td style=\"width:216px;\">\r\n			<p>UNIC PRODUCT</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:64px;\">\r\n			<p>1</p>\r\n			</td>\r\n			<td style=\"width:60px;\">\r\n			<p>2</p>\r\n			</td>\r\n			<td style=\"width:196px;\">\r\n			<p>$91.40 (N45,700)</p>\r\n			</td>\r\n			<td style=\"width:216px;\">\r\n			<p>$14.28 (N7140)</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:64px;\">\r\n			<p>2</p>\r\n			</td>\r\n			<td style=\"width:60px;\">\r\n			<p>4</p>\r\n			</td>\r\n			<td style=\"width:196px;\">\r\n			<p>$182.84 (N91420)</p>\r\n			</td>\r\n			<td style=\"width:216px;\">\r\n			<p>$28.56 (N14,280)</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:64px;\">\r\n			<p>3</p>\r\n			</td>\r\n			<td style=\"width:60px;\">\r\n			<p>8</p>\r\n			</td>\r\n			<td style=\"width:196px;\">\r\n			<p>$365.76 (N182,880)</p>\r\n			</td>\r\n			<td style=\"width:216px;\">\r\n			<p>$57.16 (N28,580)</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\" style=\"width:124px;\">\r\n			<p><strong>TOTAL:</strong></p>\r\n			</td>\r\n			<td style=\"width:196px;\">\r\n			<p><strong>$640 (N320,000)</strong></p>\r\n			</td>\r\n			<td style=\"width:216px;\">\r\n			<p><strong>$100 (50,000)</strong></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><strong><em>Additional Incentives;</em></strong></p>\r\n\r\n<p><strong>All Expenses paid Trip to Dubai $540 (N270,000)</strong></p>\r\n\r\n<p><strong>Master&rsquo;s Degree Scholarship with Int&rsquo;I Certificate, courtesy of JPTS</strong></p>\r\n\r\n<p><strong>Half Plot Of Land $240 (N120,000) at UNIC Estate + Free HMO</strong></p>\r\n\r\n<p><strong>Promo Bonus + Empowerment Grant</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<table border=\"1\" cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td colspan=\"4\" style=\"width:535px;\">\r\n			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>GENERAL MANAGER</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:64px;\">\r\n			<p>LEVEL</p>\r\n			</td>\r\n			<td style=\"width:60px;\">\r\n			<p>TEAM</p>\r\n			</td>\r\n			<td style=\"width:196px;\">\r\n			<p>CASH</p>\r\n			</td>\r\n			<td style=\"width:216px;\">\r\n			<p>UNIC PRODUCT</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:64px;\">\r\n			<p>1</p>\r\n			</td>\r\n			<td style=\"width:60px;\">\r\n			<p>2</p>\r\n			</td>\r\n			<td style=\"width:196px;\">\r\n			<p>$417.14 (N208,570)</p>\r\n			</td>\r\n			<td style=\"width:216px;\">\r\n			<p>$28.56 (N14,280)</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:64px;\">\r\n			<p>2</p>\r\n			</td>\r\n			<td style=\"width:60px;\">\r\n			<p>4</p>\r\n			</td>\r\n			<td style=\"width:196px;\">\r\n			<p>$834.28 (N417,140)</p>\r\n			</td>\r\n			<td style=\"width:216px;\">\r\n			<p>$57.12 (N28,560)</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:64px;\">\r\n			<p>3</p>\r\n			</td>\r\n			<td style=\"width:60px;\">\r\n			<p>8</p>\r\n			</td>\r\n			<td style=\"width:196px;\">\r\n			<p>$1668.58 (N834,290)</p>\r\n			</td>\r\n			<td style=\"width:216px;\">\r\n			<p>$114.32 (N57,160)</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\" style=\"width:124px;\">\r\n			<p><strong>TOTAL:</strong></p>\r\n			</td>\r\n			<td style=\"width:196px;\">\r\n			<p><strong>$2920 (N1,460,000)</strong></p>\r\n			</td>\r\n			<td style=\"width:216px;\">\r\n			<p><strong>$200 (N100,000)</strong></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><strong><em>Additional Incentives</em></strong><strong>;</strong></p>\r\n\r\n<p><strong>A Car Worth of $4000 (N2,000,000)</strong></p>\r\n\r\n<p><strong>Master&rsquo;s Degree Scholarship with Int&rsquo;I Certificate, courtesy of JPTS</strong></p>\r\n\r\n<p><strong>Or&nbsp; Cash of $400 (N200,000)</strong></p>\r\n\r\n<p><strong>A Plot Of Land $480 (N240,000) at UNIC Estate + Free HMO</strong></p>\r\n\r\n<p><strong>Sponsored Family Holidays, courtesy UNIC FOUNDATION</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<table border=\"1\" cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td colspan=\"4\" style=\"width:535px;\">\r\n			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>DIRECTOR</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:64px;\">\r\n			<p>LEVEL</p>\r\n			</td>\r\n			<td style=\"width:60px;\">\r\n			<p>TEAM</p>\r\n			</td>\r\n			<td style=\"width:196px;\">\r\n			<p>CASH</p>\r\n			</td>\r\n			<td style=\"width:216px;\">\r\n			<p>UNIC PRODUCT</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:64px;\">\r\n			<p>1</p>\r\n			</td>\r\n			<td style=\"width:60px;\">\r\n			<p>2</p>\r\n			</td>\r\n			<td style=\"width:196px;\">\r\n			<p>$162.84 (N81,420)</p>\r\n			</td>\r\n			<td style=\"width:216px;\">\r\n			<p>$85.7 (N42,850)</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:64px;\">\r\n			<p>2</p>\r\n			</td>\r\n			<td style=\"width:60px;\">\r\n			<p>4</p>\r\n			</td>\r\n			<td style=\"width:196px;\">\r\n			<p>$325.68 (N162,840)</p>\r\n			</td>\r\n			<td style=\"width:216px;\">\r\n			<p>$171.4 (N85,700)</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:64px;\">\r\n			<p>3</p>\r\n			</td>\r\n			<td style=\"width:60px;\">\r\n			<p>8</p>\r\n			</td>\r\n			<td style=\"width:196px;\">\r\n			<p>$651.48 (N325,740)</p>\r\n			</td>\r\n			<td style=\"width:216px;\">\r\n			<p>$342.9 (N171,450)</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\" style=\"width:124px;\">\r\n			<p><strong>TOTAL:</strong></p>\r\n			</td>\r\n			<td style=\"width:196px;\">\r\n			<p><strong>$1140 (N5,700,000)</strong></p>\r\n			</td>\r\n			<td style=\"width:216px;\">\r\n			<p><strong>$600 (N300,000)</strong></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><strong><em>Additional Incentives</em></strong><strong>;</strong></p>\r\n\r\n<p><strong>House at UNIC Estate $18,000 (N9,000,000) </strong></p>\r\n\r\n<p><strong>SUV worth $10,000 (N5,000,000) + Free HMO + Gratuity Bonus</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>WHY YOU SHOULD BE PART OF UNIC UNITED</strong></p>\r\n\r\n<ul style=\"list-style-type:circle;\">\r\n	<li>It&rsquo;s Spillover and displacement automated</li>\r\n	<li>Payment made easy both for paying in and cashing out</li>\r\n	<li>Awards, Rewards and Bonuses are rightly given at all times</li>\r\n	<li>You&rsquo;ll get your benefits, products, goods and services very fast</li>\r\n	<li>You need no skill nor any qualification to join</li>\r\n	<li>Your capital will give you back multiple income &amp; benefits</li>\r\n	<li>You&rsquo;ll get commission anytime you buy any of our products and you&rsquo;ll make profit if you resale it</li>\r\n	<li>You can run it from any location in the world at your very convenient</li>\r\n	<li>We offer you space in our system to run your personal business advert to millions of viewers free</li>\r\n	<li>Opportunity to attend international sponsored conferences and symposia</li>\r\n</ul>\r\n\r\n<p>You&rsquo;ll be getting full sponsorship scholarship and family international vacation</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', '2020-05-31 11:37:35', 'howItWorks'),
(7, 'news', '<p>QUESTION OF THE DAY:</p>\n\n<p>&nbsp;</p>\n\n<p>THE FIRST 10 PERSON TO DROP THE ANSWER&nbsp; WINS $10 BONUS OR N5000 INTO WALLET</p>\n\n<p>END TIME: 4PM , SUN JULY 4TH 2021.</p>\n\n<p>ANSWER BY SENDING&nbsp;YOUR USERNAME &amp; ANSWER TO GWS 5 WHATAPP GROUP.</p>\n\n<p>Q1: WHEN WAS GWS OFFICIALLY LAUNCHED?</p>\n\n<p>Q2: MENTION THE MEMBERSHIP CATEGORY IN GWS?</p>\n\n<div style=\"display:none\"><a href=\"https://www.usreplica.me\">replica watches</a> <a href=\"https://www.ukreplica.me\">1:1 best edition replica watches</a> </div>\n', '2021-11-02 13:54:46', 'editNews');

-- --------------------------------------------------------

--
-- Table structure for table `consumer_supplier_map`
--

CREATE TABLE `consumer_supplier_map` (
  `id` int(11) NOT NULL,
  `consumer_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `rfq_id` int(11) DEFAULT NULL,
  `rfq_code` varchar(255) DEFAULT NULL,
  `status` int(1) DEFAULT 0 COMMENT '1 rfq,2 Quote, 3 PO',
  `add_by` varchar(255) DEFAULT NULL COMMENT 'Test',
  `add_by_id` int(11) DEFAULT NULL,
  `assign_to` varchar(255) DEFAULT NULL,
  `assign_date` date DEFAULT NULL,
  `assign_type` varchar(255) DEFAULT NULL COMMENT 'rfq',
  `ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `quote_id` int(11) DEFAULT NULL,
  `po_id` int(11) DEFAULT NULL,
  `supplier_status` int(1) DEFAULT NULL,
  `status_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `consumer_supplier_map`
--

INSERT INTO `consumer_supplier_map` (`id`, `consumer_id`, `supplier_id`, `rfq_id`, `rfq_code`, `status`, `add_by`, `add_by_id`, `assign_to`, `assign_date`, `assign_type`, `ts`, `quote_id`, `po_id`, `supplier_status`, `status_date`) VALUES
(1, 1, 6, NULL, NULL, 1, NULL, NULL, 'consumer', '2025-01-24', 'rfq', '2025-01-24 10:16:21', NULL, NULL, NULL, NULL),
(2, 2, 6, NULL, NULL, 1, NULL, NULL, 'consumer', '2025-01-24', 'rfq', '2025-01-24 10:16:21', NULL, NULL, NULL, NULL),
(3, 3, 6, NULL, NULL, 1, NULL, NULL, 'consumer', '2025-01-24', 'rfq', '2025-01-24 10:16:21', NULL, NULL, NULL, NULL),
(4, 4, 6, NULL, NULL, 1, NULL, NULL, 'consumer', '2025-01-24', 'rfq', '2025-01-24 10:16:21', NULL, NULL, NULL, NULL),
(5, 1, 8, NULL, NULL, 1, NULL, NULL, 'consumer', '2025-01-24', 'rfq', '2025-01-24 10:16:21', NULL, NULL, NULL, NULL),
(6, 1, 10, NULL, NULL, 1, NULL, NULL, 'consumer', '2025-01-24', 'rfq', '2025-01-24 10:16:21', NULL, NULL, NULL, NULL),
(7, 1, 17, NULL, NULL, 1, NULL, NULL, 'consumer', '2025-01-24', 'rfq', '2025-01-24 10:16:21', NULL, NULL, NULL, NULL),
(8, 1, 18, NULL, NULL, 2, NULL, NULL, 'admin', '2025-03-07', 'quote', '2025-01-24 10:16:21', 40, NULL, NULL, NULL),
(9, 12, 18, NULL, NULL, 2, NULL, NULL, 'admin', '2025-03-07', 'quote', '2025-01-24 10:16:21', 40, NULL, NULL, NULL),
(10, 12, 17, NULL, NULL, 1, NULL, NULL, 'consumer', '2025-01-24', 'rfq', '2025-01-24 10:16:21', NULL, NULL, NULL, NULL),
(11, NULL, 1, 1, 'RFQ1', 1, 'admin', 1, 'supplier', '2025-01-27', 'rfq', '2025-01-27 07:04:03', NULL, NULL, NULL, NULL),
(12, NULL, 2, 1, 'RFQ1', 1, 'admin', 1, 'supplier', '2025-01-27', 'rfq', '2025-01-27 07:04:03', NULL, NULL, NULL, NULL),
(13, NULL, 3, 1, 'RFQ1', 1, 'admin', 1, 'supplier', '2025-01-27', 'rfq', '2025-01-27 07:04:03', NULL, NULL, NULL, NULL),
(14, NULL, 4, 1, 'RFQ1', 1, 'admin', 1, 'supplier', '2025-01-27', 'rfq', '2025-01-27 07:04:03', NULL, NULL, NULL, NULL),
(15, NULL, 1, 1, 'RFQ1', 1, 'admin', 1, 'supplier', '2025-01-27', 'rfq', '2025-01-27 07:04:23', NULL, NULL, NULL, NULL),
(16, NULL, 2, 1, 'RFQ1', 1, 'admin', 1, 'supplier', '2025-01-27', 'rfq', '2025-01-27 07:04:23', NULL, NULL, NULL, NULL),
(17, NULL, 3, 1, 'RFQ1', 1, 'admin', 1, 'supplier', '2025-01-27', 'rfq', '2025-01-27 07:04:23', NULL, NULL, NULL, NULL),
(18, NULL, 4, 1, 'RFQ1', 1, 'admin', 1, 'supplier', '2025-01-27', 'rfq', '2025-01-27 07:04:23', NULL, NULL, NULL, NULL),
(19, NULL, 1, 1, 'RFQ1', 1, 'admin', 1, 'supplier', '2025-01-27', 'rfq', '2025-01-27 07:04:51', NULL, NULL, NULL, NULL),
(20, NULL, 2, 1, 'RFQ1', 1, 'admin', 1, 'supplier', '2025-01-27', 'rfq', '2025-01-27 07:04:51', NULL, NULL, NULL, NULL),
(21, NULL, 3, 1, 'RFQ1', 1, 'admin', 1, 'supplier', '2025-01-27', 'rfq', '2025-01-27 07:04:51', NULL, NULL, NULL, NULL),
(22, NULL, 4, 1, 'RFQ1', 1, 'admin', 1, 'supplier', '2025-01-27', 'rfq', '2025-01-27 07:04:51', NULL, NULL, NULL, NULL),
(23, NULL, 1, 1, 'RFQ1', 1, 'admin', 1, 'supplier', '2025-01-27', 'rfq', '2025-01-27 07:04:53', NULL, NULL, NULL, NULL),
(24, NULL, 2, 1, 'RFQ1', 1, 'admin', 1, 'supplier', '2025-01-27', 'rfq', '2025-01-27 07:04:53', NULL, NULL, NULL, NULL),
(25, NULL, 3, 1, 'RFQ1', 1, 'admin', 1, 'supplier', '2025-01-27', 'rfq', '2025-01-27 07:04:53', NULL, NULL, NULL, NULL),
(26, NULL, 4, 1, 'RFQ1', 1, 'admin', 1, 'supplier', '2025-01-27', 'rfq', '2025-01-27 07:04:53', NULL, NULL, NULL, NULL),
(27, NULL, 17, 1, 'RFQ1', 1, 'admin', 29, 'supplier', '2025-01-28', 'rfq', '2025-01-28 13:54:04', NULL, NULL, NULL, NULL),
(28, NULL, 18, 10, 'RFQ10', 1, 'admin', 29, 'supplier', '2025-01-28', 'rfq', '2025-01-28 13:55:35', NULL, NULL, 1, '2025-02-02'),
(29, NULL, 21, 10, 'RFQ10', 1, 'admin', 29, 'supplier', '2025-01-28', 'rfq', '2025-01-28 13:55:35', NULL, NULL, NULL, NULL),
(30, NULL, 23, 10, 'RFQ10', 1, 'admin', 29, 'supplier', '2025-01-28', 'rfq', '2025-01-28 13:55:35', NULL, NULL, NULL, NULL),
(31, NULL, 24, 10, 'RFQ10', 1, 'admin', 29, 'supplier', '2025-01-28', 'rfq', '2025-01-28 13:55:35', NULL, NULL, 1, '2025-02-06'),
(32, NULL, 6, 7, 'RFQ7', 1, 'admin', 29, 'supplier', '2025-01-28', 'rfq', '2025-01-28 14:01:07', NULL, NULL, 1, '2025-02-01'),
(33, NULL, 8, 7, 'RFQ7', 1, 'admin', 29, 'supplier', '2025-01-28', 'rfq', '2025-01-28 14:01:07', NULL, NULL, 2, '2025-03-05'),
(34, NULL, 6, 14, 'RFQ14', 1, 'admin', 29, 'supplier', '2025-01-28', 'rfq', '2025-01-28 14:07:26', NULL, NULL, 1, '2025-02-01'),
(35, NULL, 17, 14, 'RFQ14', 1, 'admin', 29, 'supplier', '2025-01-28', 'rfq', '2025-01-28 14:07:26', NULL, NULL, NULL, NULL),
(36, NULL, 17, 30, 'RFQ7287392', 1, 'admin', 29, 'supplier', '2025-01-28', 'rfq', '2025-01-28 14:09:20', NULL, NULL, NULL, NULL),
(37, NULL, 26, 30, 'RFQ7287392', 1, 'admin', 29, 'supplier', '2025-01-28', 'rfq', '2025-01-28 14:09:20', NULL, NULL, NULL, NULL),
(38, NULL, 10, 20, 'RFQ8116701', 1, 'admin', 29, 'supplier', '2025-01-28', 'rfq', '2025-01-28 14:10:33', NULL, NULL, NULL, NULL),
(39, NULL, 18, 20, 'RFQ8116701', 1, 'admin', 29, 'supplier', '2025-01-28', 'rfq', '2025-01-28 14:10:33', NULL, NULL, 2, '2025-02-02'),
(40, NULL, 10, 20, 'RFQ8116701', 1, 'admin', 29, 'supplier', '2025-01-28', 'rfq', '2025-01-28 14:11:35', NULL, NULL, NULL, NULL),
(41, NULL, 10, 22, 'RFQ1411925', 1, 'admin', 29, 'supplier', '2025-01-28', 'rfq', '2025-01-28 14:12:22', NULL, NULL, NULL, NULL),
(42, NULL, 17, 36, 'RFQ8855530', 1, 'admin', 29, 'supplier', '2025-01-28', 'rfq', '2025-01-28 14:14:02', NULL, NULL, NULL, NULL),
(43, NULL, 26, 36, 'RFQ8855530', 1, 'admin', 29, 'supplier', '2025-01-28', 'rfq', '2025-01-28 14:15:27', NULL, NULL, NULL, NULL),
(44, NULL, 28, 30, 'RFQ7287392', 1, 'admin', 29, 'supplier', '2025-01-28', 'rfq', '2025-01-28 14:16:46', NULL, NULL, NULL, NULL),
(45, NULL, 18, 31, 'RFQ5501555', 1, 'admin', 29, 'supplier', '2025-01-28', 'rfq', '2025-01-28 14:28:24', NULL, NULL, 1, '2025-02-24'),
(46, NULL, 1, 2, 'RFQ2', 1, 'admin', 29, 'supplier', '2025-01-28', 'rfq', '2025-01-28 14:31:13', NULL, NULL, NULL, NULL),
(47, NULL, 2, 2, 'RFQ2', 1, 'admin', 29, 'supplier', '2025-01-28', 'rfq', '2025-01-28 14:31:13', NULL, NULL, NULL, NULL),
(48, NULL, 26, 9, 'RFQ9', 1, 'admin', 29, 'supplier', '2025-01-28', 'rfq', '2025-01-28 14:33:24', NULL, NULL, NULL, NULL),
(49, NULL, 6, 1, 'RFQ1', 1, 'admin', 29, 'supplier', '2025-01-29', 'rfq', '2025-01-29 12:58:07', NULL, NULL, 1, '2025-02-27'),
(50, NULL, 8, 1, 'RFQ1', 1, 'admin', 29, 'supplier', '2025-01-29', 'rfq', '2025-01-29 12:58:07', NULL, NULL, NULL, NULL),
(51, NULL, 17, 1, 'RFQ1', 1, 'admin', 29, 'supplier', '2025-01-29', 'rfq', '2025-01-29 12:58:07', NULL, NULL, NULL, NULL),
(52, NULL, 10, 1, 'RFQ1', 1, 'admin', 29, 'supplier', '2025-01-29', 'rfq', '2025-01-29 12:58:07', NULL, NULL, NULL, NULL),
(53, NULL, 18, 1, 'RFQ1', 2, 'admin', 29, 'admin', '2025-03-04', 'quote', '2025-01-29 12:58:07', 17, NULL, 1, '2025-01-31'),
(54, NULL, 18, 1, 'RFQ1', 2, 'admin', 29, 'admin', '2025-03-04', 'quote', '2025-01-31 07:43:58', 17, NULL, 1, '2025-01-31'),
(55, NULL, 17, 1, 'RFQ1', 1, 'admin', 29, 'supplier', '2025-01-31', 'rfq', '2025-01-31 07:43:58', NULL, NULL, NULL, NULL),
(56, NULL, 6, 13, 'RFQ13', 1, 'admin', 29, 'supplier', '2025-02-01', 'rfq', '2025-02-01 14:27:25', NULL, NULL, 2, '2025-02-27'),
(57, NULL, 6, 20, 'RFQ8116701', 1, 'admin', 29, 'supplier', '2025-02-01', 'rfq', '2025-02-01 14:27:53', NULL, NULL, 2, '2025-02-01'),
(58, NULL, 6, 23, 'RFQ3290323', 1, 'admin', 29, 'supplier', '2025-02-01', 'rfq', '2025-02-01 14:28:02', NULL, NULL, 1, '2025-02-01'),
(59, NULL, 6, 25, 'RFQ2059170', 1, 'admin', 29, 'supplier', '2025-02-01', 'rfq', '2025-02-01 14:28:23', NULL, NULL, 1, '2025-02-01'),
(60, NULL, 6, 29, 'RFQ8560615', 1, 'admin', 29, 'supplier', '2025-02-01', 'rfq', '2025-02-01 14:28:43', NULL, NULL, 1, '2025-02-01'),
(61, NULL, 6, 1, 'RFQ1', 1, 'admin', 29, 'supplier', '2025-02-02', 'rfq', '2025-02-02 03:55:27', NULL, NULL, 1, '2025-02-27'),
(62, NULL, 8, 1, 'RFQ1', 1, 'admin', 29, 'supplier', '2025-02-02', 'rfq', '2025-02-02 03:55:27', NULL, NULL, NULL, NULL),
(63, NULL, 6, 37, 'RFQ3160039', 1, 'admin', 29, 'supplier', '2025-02-03', 'rfq', '2025-02-03 05:48:02', NULL, NULL, NULL, NULL),
(64, NULL, 8, 37, 'RFQ3160039', 1, 'admin', 29, 'supplier', '2025-02-03', 'rfq', '2025-02-03 05:48:02', NULL, NULL, NULL, NULL),
(65, NULL, 10, 37, 'RFQ3160039', 1, 'admin', 29, 'supplier', '2025-02-03', 'rfq', '2025-02-03 05:48:02', NULL, NULL, NULL, NULL),
(66, NULL, 17, 37, 'RFQ3160039', 1, 'admin', 29, 'supplier', '2025-02-03', 'rfq', '2025-02-03 05:48:02', NULL, NULL, NULL, NULL),
(67, NULL, 18, 37, 'RFQ3160039', 1, 'admin', 29, 'supplier', '2025-02-03', 'rfq', '2025-02-03 05:48:02', NULL, NULL, 1, '2025-02-03'),
(68, NULL, 21, 37, 'RFQ3160039', 1, 'admin', 29, 'supplier', '2025-02-03', 'rfq', '2025-02-03 05:48:02', NULL, NULL, NULL, NULL),
(69, NULL, 8, 25, 'RFQ2059170', 1, 'admin', 29, 'supplier', '2025-02-03', 'rfq', '2025-02-03 11:24:53', NULL, NULL, NULL, NULL),
(70, NULL, 8, 38, 'RFQ7047686', 1, 'admin', 29, 'supplier', '2025-02-04', 'rfq', '2025-02-04 05:11:12', NULL, NULL, NULL, NULL),
(71, NULL, 31, 38, 'RFQ7047686', 1, 'admin', 29, 'supplier', '2025-02-04', 'rfq', '2025-02-04 05:11:43', NULL, NULL, 1, '2025-02-04'),
(72, NULL, 28, 39, 'RFQ7205666', 1, 'admin', 29, 'supplier', '2025-02-05', 'rfq', '2025-02-05 08:19:31', NULL, NULL, 1, '2025-02-05'),
(73, NULL, 6, 39, 'RFQ7205666', 1, 'admin', 29, 'supplier', '2025-02-05', 'rfq', '2025-02-05 08:19:31', NULL, NULL, NULL, NULL),
(74, NULL, 24, 40, 'RFQ1934822', 1, 'admin', 29, 'supplier', '2025-02-17', 'rfq', '2025-02-17 09:42:22', NULL, NULL, 1, '2025-02-17'),
(75, NULL, 18, 44, 'RFQ6442770', 1, 'admin', 29, 'supplier', '2025-02-24', 'rfq', '2025-02-24 09:44:00', NULL, NULL, 2, '2025-02-26'),
(76, NULL, 18, 45, 'RFQ4708733', 1, 'admin', 29, 'supplier', '2025-02-24', 'rfq', '2025-02-24 12:48:19', NULL, NULL, 2, '2025-02-26'),
(77, NULL, 18, 51, 'RFQ4054531', 1, 'admin', 29, 'supplier', '2025-02-24', 'rfq', '2025-02-24 12:58:06', NULL, NULL, 2, '2025-02-26'),
(78, NULL, 24, 52, 'RFQ1794943', 1, 'admin', 29, 'supplier', '2025-02-25', 'rfq', '2025-02-25 05:19:44', NULL, NULL, 2, '2025-02-27'),
(79, NULL, 24, 52, 'RFQ1794943', 1, 'admin', 29, 'supplier', '2025-02-25', 'rfq', '2025-02-25 05:27:26', NULL, NULL, 2, '2025-02-27'),
(80, NULL, 18, 53, 'RFQ6673122', 1, 'admin', 29, 'supplier', '2025-02-26', 'rfq', '2025-02-26 12:34:25', NULL, NULL, 2, '2025-02-26'),
(81, NULL, 24, 52, 'RFQ1794943', 1, 'admin', 29, 'supplier', '2025-02-27', 'rfq', '2025-02-27 05:05:52', NULL, NULL, 2, '2025-02-27'),
(82, NULL, 24, 54, 'RFQ5146902', 1, 'admin', 29, 'supplier', '2025-02-27', 'rfq', '2025-02-27 05:17:25', NULL, NULL, 1, '2025-02-27'),
(83, NULL, 28, 54, 'RFQ5146902', 1, 'admin', 29, 'supplier', '2025-02-27', 'rfq', '2025-02-27 06:26:49', NULL, NULL, NULL, NULL),
(84, NULL, 8, 54, 'RFQ5146902', 1, 'admin', 29, 'supplier', '2025-02-27', 'rfq', '2025-02-27 06:37:23', NULL, NULL, NULL, NULL),
(85, NULL, 6, 54, 'RFQ5146902', 1, 'admin', 29, 'supplier', '2025-02-27', 'rfq', '2025-02-27 06:49:34', NULL, NULL, NULL, NULL),
(86, NULL, 8, 54, 'RFQ5146902', 1, 'admin', 29, 'supplier', '2025-02-27', 'rfq', '2025-02-27 06:49:34', NULL, NULL, NULL, NULL),
(87, NULL, 10, 54, 'RFQ5146902', 1, 'admin', 29, 'supplier', '2025-02-27', 'rfq', '2025-02-27 06:49:34', NULL, NULL, NULL, NULL),
(88, NULL, 18, 53, 'RFQ6673122', 1, 'admin', 29, 'supplier', '2025-02-27', 'rfq', '2025-02-27 06:51:21', NULL, NULL, NULL, NULL),
(89, NULL, 24, 55, 'RFQ8465630', 1, 'admin', 24, 'supplier', '2025-02-27', 'rfq', '2025-02-27 11:28:42', NULL, NULL, 2, '2025-02-27'),
(90, NULL, 24, 55, 'RFQ8465630', 1, 'admin', 24, 'supplier', '2025-02-27', 'rfq', '2025-02-27 11:28:42', NULL, NULL, 2, '2025-02-27'),
(91, NULL, 24, 56, 'RFQ7504060', 1, 'admin', 29, 'supplier', '2025-02-27', 'rfq', '2025-02-27 11:31:45', NULL, NULL, 1, '2025-02-27'),
(92, NULL, 6, 58, 'RFQ9874376', 1, 'admin', 29, 'supplier', '2025-03-04', 'rfq', '2025-03-04 04:16:15', NULL, NULL, NULL, NULL),
(93, NULL, 8, 58, 'RFQ9874376', 2, 'admin', 29, 'admin', '2025-03-05', 'quote', '2025-03-04 04:16:15', 26, NULL, 1, '2025-03-04'),
(94, NULL, 10, 58, 'RFQ9874376', 1, 'admin', 29, 'supplier', '2025-03-04', 'rfq', '2025-03-04 04:16:15', NULL, NULL, NULL, NULL),
(95, NULL, 17, 58, 'RFQ9874376', 1, 'admin', 29, 'supplier', '2025-03-04', 'rfq', '2025-03-04 04:16:15', NULL, NULL, NULL, NULL),
(96, NULL, 18, 58, 'RFQ9874376', 2, 'admin', 29, 'admin', '2025-03-05', 'quote', '2025-03-04 04:16:15', 18, NULL, 1, '2025-03-21'),
(97, NULL, 21, 58, 'RFQ9874376', 1, 'admin', 29, 'supplier', '2025-03-04', 'rfq', '2025-03-04 04:16:15', NULL, NULL, NULL, NULL),
(98, NULL, 23, 58, 'RFQ9874376', 1, 'admin', 29, 'supplier', '2025-03-04', 'rfq', '2025-03-04 04:16:15', NULL, NULL, NULL, NULL),
(99, NULL, 24, 58, 'RFQ9874376', 2, 'admin', 29, 'admin', '2025-03-05', 'quote', '2025-03-05 13:01:51', 29, NULL, 1, '2025-03-07'),
(100, NULL, 6, 61, 'RFQ2907333', 2, 'admin', 29, 'admin', '2025-03-06', 'quote', '2025-03-06 04:55:17', 31, NULL, 1, '2025-03-06'),
(101, NULL, 6, 62, 'RFQ4662536', 2, 'admin', 29, 'admin', '2025-03-06', 'quote', '2025-03-06 05:54:51', 32, NULL, 1, '2025-03-06'),
(102, NULL, 6, 62, 'RFQ4662536', 2, 'admin', 29, 'admin', '2025-03-06', 'quote', '2025-03-06 05:54:52', 32, NULL, 1, '2025-03-06'),
(103, NULL, 6, 64, 'RFQ1690604', 1, 'admin', 29, 'supplier', '2025-03-12', 'rfq', '2025-03-12 08:08:56', NULL, NULL, NULL, NULL),
(104, NULL, 8, 64, 'RFQ1690604', 2, 'admin', 29, 'admin', '2025-03-12', 'quote', '2025-03-12 08:08:56', 41, NULL, 1, '2025-03-12'),
(105, NULL, 10, 64, 'RFQ1690604', 1, 'admin', 29, 'supplier', '2025-03-12', 'rfq', '2025-03-12 08:08:56', NULL, NULL, NULL, NULL),
(106, NULL, 8, 65, 'RFQ9901303', 2, 'admin', 29, 'admin', '2025-03-12', 'quote', '2025-03-12 09:24:01', 42, NULL, 1, '2025-03-12'),
(107, NULL, 6, 65, 'RFQ9901303', 1, 'admin', 29, 'supplier', '2025-03-12', 'rfq', '2025-03-12 09:24:01', NULL, NULL, NULL, NULL),
(108, NULL, 10, 65, 'RFQ9901303', 1, 'admin', 29, 'supplier', '2025-03-12', 'rfq', '2025-03-12 09:24:01', NULL, NULL, NULL, NULL),
(109, NULL, 24, 65, 'RFQ9901303', 1, 'admin', 29, 'supplier', '2025-03-12', 'rfq', '2025-03-12 09:49:57', NULL, NULL, 2, '2025-03-18'),
(110, NULL, 24, 64, 'RFQ1690604', 1, 'admin', 29, 'supplier', '2025-03-12', 'rfq', '2025-03-12 09:50:04', NULL, NULL, 2, '2025-03-25'),
(111, NULL, 18, 66, 'RFQ3685049', 2, 'admin', 29, 'admin', '2025-03-12', 'quote', '2025-03-12 17:29:49', 44, NULL, 1, '2025-03-12'),
(112, NULL, 24, 67, 'RFQ4744184', 2, 'admin', 29, 'admin', '2025-03-18', 'quote', '2025-03-18 05:58:00', 49, NULL, 1, '2025-03-18'),
(113, NULL, 52, 67, 'RFQ4744184', 1, 'admin', 29, 'supplier', '2025-03-18', 'rfq', '2025-03-18 05:58:00', NULL, NULL, NULL, NULL),
(114, NULL, 24, 70, 'RFQ9746018', 2, 'admin', 29, 'admin', '2025-03-25', 'quote', '2025-03-25 05:55:16', 52, NULL, 1, '2025-03-25'),
(115, NULL, 24, 71, 'RFQ3783604', 2, 'admin', 29, 'admin', '2025-03-25', 'quote', '2025-03-25 08:24:24', 53, NULL, 1, '2025-03-25'),
(116, NULL, 24, 72, 'RFQ3013637', 2, 'admin', 29, 'admin', '2025-03-27', 'quote', '2025-03-27 07:51:32', 54, NULL, 1, '2025-03-27');

-- --------------------------------------------------------

--
-- Table structure for table `consumer_user`
--

CREATE TABLE `consumer_user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `company` varchar(255) NOT NULL,
  `company_type` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `country_code` varchar(255) NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `is_validated` tinyint(1) NOT NULL,
  `marketing_consent` tinyint(1) NOT NULL,
  `industry` enum('Aerospace','Agriculture','Automotive','Aviation & Aerospace','Construction','Consulting','Consumer Electronics','Consumer Products','Defense','Design','Electrical/Electronic Manufacturing','Energy','EV','FMCG','General Engineering','Health Care','HVAC','Import and Export','Industrial Automation','Logistics and Supply Chain','Machinery','Mechanical or Industrial Engineering','Medical Devices','Nuclear','Oil & Energy','Outsourcing/Offshoring','Packaging and Containers','Pharmaceuticals','Power','Railways','Research','Solar') NOT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `role_type` varchar(255) DEFAULT NULL,
  `email_verify` int(1) NOT NULL DEFAULT 0,
  `email_verify_date` date DEFAULT NULL,
  `member_id` varchar(255) DEFAULT NULL,
  `grade` varchar(20) DEFAULT 'D',
  `no_of_employee` int(5) DEFAULT NULL,
  `facilities_available` varchar(500) DEFAULT NULL,
  `company_location` varchar(255) DEFAULT NULL,
  `iso_certification` int(1) DEFAULT NULL,
  `import_export_document` text DEFAULT NULL,
  `employeeCount` int(5) DEFAULT NULL,
  `facilities` varchar(500) DEFAULT NULL,
  `location` text DEFAULT NULL,
  `add_date` date DEFAULT NULL,
  `files` text DEFAULT NULL,
  `manufacturing_process` text DEFAULT NULL,
  `freezone` int(1) NOT NULL DEFAULT 0 COMMENT '0 No,1 Yes',
  `company_logo` varchar(500) DEFAULT NULL,
  `about_us` text DEFAULT NULL,
  `company_website` varchar(500) DEFAULT NULL,
  `year_of_establishment` varchar(255) DEFAULT NULL,
  `anual_turnover` varchar(255) DEFAULT NULL,
  `company_portflio` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `gst_no` varchar(50) DEFAULT NULL,
  `iec_code` varchar(50) DEFAULT NULL,
  `urn` varchar(50) DEFAULT NULL,
  `certificate` varchar(50) DEFAULT NULL,
  `key_customers` varchar(255) DEFAULT NULL,
  `past_project` varchar(255) DEFAULT NULL,
  `services` varchar(255) DEFAULT NULL,
  `machinary_management` int(11) DEFAULT NULL,
  `machinary_quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `consumer_user`
--

INSERT INTO `consumer_user` (`id`, `name`, `company`, `company_type`, `email`, `password`, `phone_number`, `country_code`, `country`, `state`, `is_validated`, `marketing_consent`, `industry`, `ts`, `role_type`, `email_verify`, `email_verify_date`, `member_id`, `grade`, `no_of_employee`, `facilities_available`, `company_location`, `iso_certification`, `import_export_document`, `employeeCount`, `facilities`, `location`, `add_date`, `files`, `manufacturing_process`, `freezone`, `company_logo`, `about_us`, `company_website`, `year_of_establishment`, `anual_turnover`, `company_portflio`, `address`, `contact`, `gst_no`, `iec_code`, `urn`, `certificate`, `key_customers`, `past_project`, `services`, `machinary_management`, `machinary_quantity`) VALUES
(1, 'Subhash', 'Test', 'Manufacturing', 'subpal2019@gmail.com', '123', '01234567890', '+91', NULL, NULL, 0, 1, 'Automotive', '2025-01-19 11:55:49', 'consumer', 1, NULL, '123451', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Subhash', 'Test', 'Manufacturing', 'subpal212209@gmail.com', '123', '01234567890', '+91', NULL, NULL, 0, 1, 'Automotive', '2025-01-19 11:56:03', 'consumer', 1, NULL, '123452', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Subhash', 'Test', 'Manufacturing', 'subpal20119@gmail.com', '123', '01234567890', '+91', NULL, NULL, 0, 1, 'Automotive', '2025-01-19 12:07:33', 'consumer', 1, NULL, '123453', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'rajesh yadav', 'sse', NULL, 'r@dev.com', 'R@br17e9087', '9205055084', '+91', NULL, NULL, 0, 1, 'Energy', '2025-01-19 16:18:30', 'consumer', 1, NULL, '123454', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'rajesh yadav', 'sse', NULL, 're@dev.com', 'R@br17e9087', '9205055084', '+91', NULL, NULL, 0, 1, 'Health Care', '2025-01-19 16:19:52', 'consumer', 1, NULL, '123455', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'r-supplier', 'sse', NULL, 'r.supplier@dev.com', 'R@br17e9087', '9205055084', '+91', NULL, NULL, 0, 1, 'EV', '2025-01-19 17:23:10', 'supplier', 1, NULL, '123456', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'asdjas', 'jhdhsjjh', NULL, 'jhhjjh@gmail.com', 'jhjhjhjh', 'hjhjhj', '', NULL, NULL, 0, 1, 'Aerospace', '2025-01-20 06:59:33', 'consumer', 1, NULL, '123457', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'Subhash', 'Pal', NULL, 'subppal@gmail.com', '123', '1', '', NULL, NULL, 0, 1, 'General Engineering', '2025-01-20 07:00:08', 'supplier', 1, NULL, '123458', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'rajesh', 'SSE', NULL, 'rajesh11@dev.com', 'rajesh@123', '9205055084', '+91', NULL, NULL, 0, 1, 'Electrical/Electronic Manufacturing', '2025-01-21 07:23:07', 'consumer', 1, NULL, '123459', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'rajesh-supplier', 'SSED', NULL, 'rsupplier@dev.com', 'rajesh@123', '9205055084', '+91', NULL, NULL, 0, 1, 'EV', '2025-01-21 07:27:03', 'supplier', 1, NULL, '1234510', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'rajesh-customer', 'SSED', NULL, 'rajesh22@dev.com', 'rajesh@123', '9205055084', '+91', NULL, NULL, 0, 1, 'EV', '2025-01-21 07:37:13', 'consumer', 1, NULL, '1234511', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'rajesh-customer', 'SSD', NULL, 'rajesh-customer.1@dev.com', 'R@br17e9087', '9205055084', '+91', NULL, NULL, 0, 1, 'EV', '2025-01-22 10:06:55', 'consumer', 1, NULL, '1234512', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'rajesh-supplier', 'SSED', NULL, 'rajesh-customer.2@dev.com', 'rajesh@123', '9205055084', '+91', NULL, NULL, 0, 1, 'Defense', '2025-01-22 10:33:24', 'consumer', 1, NULL, '1234513', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'rajesh-supplier', 'SSED', NULL, 'rajesh-customer.3@dev.com', 'rajesh@123', '9205055084', '+91', NULL, NULL, 0, 1, 'EV', '2025-01-22 10:50:40', 'consumer', 1, NULL, '1234514', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'rajesh-supplier', 'SSED', NULL, 'rajesh-customer.4@dev.com', 'rajesh@123', '9205055084', '+91', NULL, NULL, 0, 1, 'General Engineering', '2025-01-22 10:53:31', 'consumer', 1, NULL, '1234515', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'rajesh-supplier', 'SSED', NULL, 'rajesh-customer.5@dev.com', 'rajesh@123', '9205055084', '+91', NULL, NULL, 0, 1, 'EV', '2025-01-22 10:55:15', 'consumer', 1, NULL, '1234516', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'rajesh-supplier', 'SSED', NULL, 'rajesh-supplier.2@dev.com', 'rajesh@123', '9205055084', '+91', NULL, NULL, 0, 1, 'Energy', '2025-01-22 10:56:41', 'supplier', 1, NULL, '1234517', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'Rajesh2', 'SSED1', NULL, 'rajesh-supplier.123@dev.com', 'R@123', '9205055084', '+91', NULL, NULL, 0, 1, 'EV', '2025-01-22 19:42:37', 'supplier', 1, NULL, '1234518', 'D', 4, 'hh', 'Delhi', 1, NULL, 6, 'Facilities Available13', 'Address13', NULL, '/', '12,13,6,1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'rajesh', 'qwr', NULL, 'r@1.com', 'R@br17e9087', '9205055084', '+91', NULL, NULL, 0, 1, 'EV', '2025-01-22 19:45:21', 'consumer', 1, NULL, '1234519', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 'Rajesh', 'SS', NULL, 'rajesh-cst-1@dev.com', 'R@br17e9087', '9205055084', '+91', NULL, NULL, 0, 1, 'EV', '2025-01-22 19:51:05', 'consumer', 1, NULL, '1234520', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 'rajesh', 'spl', NULL, 'rajesh-spl.1@dev.com', 'R@br17e9087', '9205055084', '+91', NULL, NULL, 0, 1, 'EV', '2025-01-22 19:52:23', 'supplier', 1, NULL, '1234521', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 'Anurag Tripathi', 'Dim', NULL, 'nusaratanu@gmail.com', '12345', '9540452224', '+91', NULL, NULL, 0, 1, 'Consulting', '2025-01-22 20:06:38', 'consumer', 1, NULL, '1234522', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 'rajesh', 'ssed', NULL, 'rajesh-cst-23@dev.com', 'R@br17e9087', '9205055084', '+91', NULL, NULL, 0, 1, 'EV', '2025-01-22 20:49:56', 'supplier', 1, NULL, '1234523', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 'Anurag tripathi', 'Dim', NULL, 'development@dimensionangle.com', 'admin@#$%^&*@!', '9540452224', '+91', NULL, NULL, 0, 1, 'Automotive', '2025-01-23 06:24:59', 'supplier', 1, NULL, '1234524', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 'Anurag tripathi', 'Dim', NULL, 'development2@dimensionangle.com', 'admin@#$%^&*@!', '9540452224', '+91', NULL, NULL, 0, 1, 'Consumer Products', '2025-01-23 06:25:35', 'consumer', 1, NULL, '1234525', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 'rSupplier', 'SC', NULL, 'r.supplier1@dev.com', 'R@br17e9087', '9205055084', '+91', NULL, NULL, 0, 1, 'FMCG', '2025-01-23 09:07:16', 'supplier', 1, NULL, '1234526', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 'mallikarjun', 'ABC', NULL, 'abc@gmail.com', 'Abc@2924', '1234325564', '+91', NULL, NULL, 0, 1, 'Automotive', '2025-01-23 09:17:49', 'consumer', 1, NULL, '1234527', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 'MALLIKARJUN', 'ABC', NULL, 'abcD@gmail.com', 'aBC@2024', '1234325564', '+91', NULL, NULL, 0, 1, 'Automotive', '2025-01-23 09:19:26', 'supplier', 1, NULL, '1234528', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 'Admin', 'Admin', 'admin', 'adminuser@gmail.com', 'admin12345', '9990694126', '91', NULL, NULL, 1, 0, '', '2025-01-27 06:09:04', 'super_admin', 1, NULL, '1234529', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 'asasdf', 'asfdasd', NULL, 'ripibo7456@rykone.com', 'Pass@123', '1234567891', '+91', NULL, NULL, 0, 1, 'Automotive', '2025-01-29 05:13:58', 'consumer', 1, NULL, '1234530', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 'asafd', 'adfasdsafa', NULL, 'gobam29903@gufutu.com', 'Pass@123', '1234567891', '+91', NULL, NULL, 0, 1, 'Automotive', '2025-01-29 05:23:57', 'supplier', 1, NULL, '1234531', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 'nmopqr', 'sdfgh', NULL, 'mohoni1927@rykone.com', 'Pass@1234', '1234567892', '+91', NULL, NULL, 0, 1, 'Aviation & Aerospace', '2025-02-03 12:00:10', 'consumer', 1, NULL, '1234532', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 'hahsdhasj test2', 'jkkj', NULL, 'noreply@demosite.name', '123', '1234567890', '+91', NULL, NULL, 0, 1, 'Health Care', '2025-02-04 08:26:07', 'consumer', 0, NULL, '1234533', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 'hahsdhasj test2', 'jkkj', NULL, '1234@dev.com', 'R@br17e9087', '1234567890', '+91', NULL, NULL, 0, 1, 'EV', '2025-02-27 07:20:04', 'consumer', 0, NULL, 'DF3209206', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 'Anurag', 'DIM', NULL, 'anurag.dimensionangel22@gmail.com', 'anurag.dimensionangel@gmail.com', '9540452224', '+91', NULL, NULL, 0, 1, 'Defense', '2025-02-27 07:20:26', 'consumer', 0, NULL, 'DF4212426', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 'Anurag', 'DIM', NULL, 'anurag.dimensionangel@gmail.com', 'anurag.dimensionangel@gmail.com', '9540452224', '+91', NULL, NULL, 0, 1, 'Defense', '2025-02-27 07:27:35', 'consumer', 0, NULL, 'DF2398306', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 'Anurag', 'DIM', NULL, 'anurag.dimensionangel111@gmail.com', 'anurag.dimensionangel@gmail.com', '148098089008', '+91', NULL, NULL, 0, 1, 'Electrical/Electronic Manufacturing', '2025-02-27 07:31:10', 'consumer', 0, NULL, 'DF1974686', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 'Anu', 'Test', NULL, 'dvsfdv@df.fjh', 'rgnbfn', 'nfghnghng', '+31', NULL, NULL, 0, 1, 'Health Care', '2025-02-27 09:06:39', 'consumer', 0, NULL, 'DF4644416', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, 'csd', 'csdcsdcsdc', NULL, 'sdcsdcsdcsdc@zfv.fgh', 'sdcsdc', 'csdcsdc', '', NULL, NULL, 0, 1, 'Construction', '2025-02-27 09:07:55', 'consumer', 0, NULL, 'DF9195526', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 'vfbd', 'dfb', NULL, 'dfbdfbf@fdb.gh', 'dfgdn', 'fgngfnfgnfg', '+55', NULL, NULL, 0, 1, 'Defense', '2025-02-27 09:53:51', 'consumer', 0, NULL, 'DF4163306', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 'sdv', 'dsv', NULL, 'sdv@v.jhghgh', 'svd', 'dsv', '+55', NULL, NULL, 0, 1, 'Energy', '2025-02-27 09:57:13', 'consumer', 0, NULL, 'DF3776636', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 'Tesrt', 'dfb', NULL, 'dzfb@fdg.dfg', 'fdghgfnfgdn', 'fgnfgnfg', '+1', NULL, NULL, 0, 1, 'General Engineering', '2025-02-27 10:14:24', 'consumer', 0, NULL, 'DF4885126', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 'sd', 'sdfb', NULL, 'sdfb@dfb.dhg', 'rgafd', 'sfgbgfb', '+55', NULL, NULL, 0, 1, 'FMCG', '2025-02-27 11:31:50', 'consumer', 0, NULL, 'DF7878646', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 'hahsdhasj test2', 'jkkj', NULL, 'subppa333l@gmail.com', '123', '1234567890', '+91', NULL, NULL, 0, 1, 'FMCG', '2025-03-08 02:52:33', 'consumer', 0, NULL, 'DF2726066', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 'hahsdhasj test2', 'jkkj', NULL, 'subppa3393l@gmail.com', '123', '1234567890', '+91', NULL, NULL, 0, 1, 'FMCG', '2025-03-08 02:53:10', 'consumer', 0, NULL, 'DF7681696', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 'hahsdhasj test2', 'jkkj', NULL, 'subppa33l@gmail.com', '123', '1234567890', '+91', NULL, NULL, 0, 1, 'FMCG', '2025-03-08 02:55:16', 'consumer', 0, NULL, 'DF7386686', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, 'hahsdhasj test2', 'jkkj', NULL, 'subppa555l@gmail.com', '123', '1234567890', '+91', NULL, NULL, 0, 1, 'FMCG', '2025-03-08 02:55:35', 'consumer', 0, NULL, 'DF7687366', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 'hahsdhasj test2', 'jkkj', NULL, 'subppa11555l@gmail.com', '123', '1234567890', '+91', NULL, NULL, 0, 1, 'FMCG', '2025-03-08 02:55:57', 'consumer', 0, NULL, 'DF3886966', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(49, 'hahsdhasj test2', 'jkkj', NULL, 'subppa155l@gmail.com', '123', '1234567890', '+91', NULL, NULL, 0, 1, 'FMCG', '2025-03-08 02:56:30', 'consumer', 0, NULL, 'DF1592036', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, 'hahsdhasj test2', 'jkkj', NULL, 'subppkkkal@gmail.com', '123', '1234567890', '+91', NULL, NULL, 0, 1, 'HVAC', '2025-03-08 02:59:52', 'consumer', 0, NULL, 'DF9457226', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(51, 'hahsdhasj test2', 'jkkj', NULL, 'subpp455al@gmail.com', '123', '1234567890', '+91', NULL, NULL, 0, 1, 'Aerospace', '2025-03-08 03:04:52', 'consumer', 1, '2025-03-08', 'DF2253986', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, 'mallikarjun katte', 'Spintek Gulf co LLC ', NULL, 'mallikarjun.estimate.ae@gmail.com', 'Pass@1234', '12332324', '+971', NULL, NULL, 0, 1, 'Consumer Products', '2025-03-11 05:21:53', 'supplier', 0, NULL, 'DF7809396', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(53, 'frank ', 'abcd', NULL, 'yolew15228@makroyal.com', 'Spintek@2024', '2343114514', '+971', NULL, NULL, 0, 1, 'Aerospace', '2025-03-11 05:23:40', 'supplier', 0, NULL, 'DF5353826', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, 'abcd ', 'defgh', NULL, 'fiteg58488@dwriters.com', 'Spintek@2024', '0531233412', '+971', NULL, NULL, 0, 1, 'Consulting', '2025-03-11 05:28:12', 'consumer', 0, NULL, 'DF3313166', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(55, 'spintekcosumer', 'spintekconsumer', NULL, 'ratilen507@erapk.com', 'Spintek@2024', '9811151998', '+91', NULL, NULL, 0, 1, 'Mechanical or Industrial Engineering', '2025-03-18 05:22:48', 'consumer', 0, NULL, 'DF5859766', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(56, 'spinteksupplier', 'spinteksupplier', NULL, 'cineso4764@bankrau.com', 'Spintek@2024', '053212232121', '+971', NULL, NULL, 0, 1, 'Industrial Automation', '2025-03-18 05:27:00', 'supplier', 0, NULL, 'DF4205426', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(57, 'Subhash', 'Factory', NULL, 'subpal2009102@gmail.com', '123456', '1234567890', '+91', NULL, NULL, 0, 1, 'HVAC', '2025-03-18 12:19:35', 'consumer', 1, '2025-03-18', 'DF4943296', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(58, 'Subhash', 'Factory', NULL, 'subpal2009@gmail.com', '123456', '1234567890', '+91', NULL, NULL, 0, 1, 'Industrial Automation', '2025-03-18 12:22:17', 'consumer', 1, '2025-03-18', 'DF4220036', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(59, 'mallikarjun ', 'spintek ', NULL, 'mallikarjun.estimate.ae@outlook.com', 'Spintek@2024', '123456789', '+91', NULL, NULL, 0, 1, 'HVAC', '2025-03-18 12:22:43', 'consumer', 0, NULL, 'DF1005776', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(60, 'Subhash', 'Factory', NULL, 'mallikarjun@yopmail.com', '123456', '1234567890', '+91', NULL, NULL, 0, 1, 'Energy', '2025-03-18 12:26:13', 'consumer', 0, NULL, 'DF5764396', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(61, 'mallikarjun ', 'spintek', NULL, 'mallikarjunkatte98@gmail.com', 'Spintek@2024', '12343547768', '+91', NULL, NULL, 0, 1, 'Design', '2025-03-18 12:26:42', 'consumer', 0, NULL, 'DF6474266', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(62, 'mallikarjun ', 'estimate ', NULL, 'mallikarjun@estimate.ae', 'Spintek@2024', '1234547586', '+971', NULL, NULL, 0, 1, 'Industrial Automation', '2025-03-18 12:33:16', 'consumer', 1, '2025-03-18', 'DF6158796', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(63, 'Subhash', 'Factory', NULL, 'mallikarjun123@yopmail.com', '123', '1234567890', '+971', 'United Arab Emirates', 'Dubai', 0, 1, 'Health Care', '2025-03-20 05:50:50', 'consumer', 1, '2025-03-20', 'DF2838416', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(1) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `status`, `ts`) VALUES
(1, 'India', 0, '2024-01-29 01:34:09'),
(2, 'USA', 0, '2024-01-29 01:40:49'),
(3, 'Canada', 0, '2024-01-29 01:41:09'),
(4, 'U.K.', 0, '2024-01-29 01:41:35');

-- --------------------------------------------------------

--
-- Table structure for table `credit_debit`
--

CREATE TABLE `credit_debit` (
  `id` int(11) NOT NULL,
  `transaction_no` varchar(1000) NOT NULL,
  `user_id` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `credit_amt` varchar(255) DEFAULT NULL,
  `debit_amt` varchar(255) DEFAULT NULL,
  `balance` varchar(255) DEFAULT NULL,
  `admin_charge` varchar(255) DEFAULT NULL,
  `receiver_id` varchar(255) DEFAULT NULL,
  `sender_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `pkg_id` int(11) NOT NULL,
  `ref_pkg_id` int(11) NOT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `product_qty` varchar(255) DEFAULT NULL,
  `product_commission` varchar(255) DEFAULT NULL,
  `product_commission_type` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `rank_name` varchar(255) DEFAULT NULL,
  `pkg_amount` varchar(255) DEFAULT NULL,
  `receive_date` varchar(255) DEFAULT NULL,
  `ttype` varchar(255) DEFAULT NULL,
  `TranDescription` varchar(255) DEFAULT NULL,
  `Cause` varchar(255) DEFAULT NULL,
  `Remark` varchar(255) DEFAULT NULL,
  `unique_identity` varchar(255) DEFAULT NULL,
  `tran_description` varchar(255) DEFAULT NULL,
  `invoice_no` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `status` enum('0','1') DEFAULT NULL COMMENT '''0''=>debit,''1''=>credit',
  `ewallet_used_by` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `matching_commission_status` enum('0','1') DEFAULT NULL COMMENT '''0''=>not provided, ''1''=>provided',
  `current_url` varchar(255) DEFAULT NULL,
  `deposit_id` varchar(255) DEFAULT NULL,
  `reason` enum('1','2','3','4','5','6','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','37','38','39') DEFAULT NULL COMMENT '&#039;1&#039;=&gt;debit for pkg purchased,&#039;2&#039;=&gt; debit for ewallet withdrawl,&#039;3&#039;=&gt;debit for balance transfer,&#039;4&#039;=&gt;credit for balance transfer received,&#039;5&#039;=&gt;credit for matrix direct commission,&#039;6&#039;=&gt;credit for matrix commission,&#039;9&#039;=&gt;credit for unilevel commission,&#039;10&#039;=&gt;credit for rank bonus update,&#039;11&#039;=&gt;debit for fund transfer, &#039;12&#039;=&gt; credit by fund transfer,&#039;13&#039;=&gt;Debit Amount for Withdrawl wallet amount request,&#039;14&#039;=&gt;withdrawal request cancel refund,&#039;15&#039;=&gt;deposit request credit,&#039;16&#039;=&gt;debit for Epin purchased from E-wallet,&#039;17&#039;=&gt;Credit for add fund by admin, &#039;18&#039;=&gt;Debit for deduct fund by admin,&#039;19&#039;=&gt;fund transfer by admin to user,&#039;20&#039;=&gt; fund add by admin to self,&#039;21&#039;=&gt;Deduct user fund credit to admin,&#039;22&#039;=&gt;epin created by admin,&#039;23&#039;=&gt;Debit for package upgr',
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `rank_id` int(11) DEFAULT NULL,
  `rank_name2` varchar(100) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `payment_method_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `credit_debit`
--

INSERT INTO `credit_debit` (`id`, `transaction_no`, `user_id`, `credit_amt`, `debit_amt`, `balance`, `admin_charge`, `receiver_id`, `sender_id`, `pkg_id`, `ref_pkg_id`, `product_id`, `product_qty`, `product_commission`, `product_commission_type`, `level`, `rank_name`, `pkg_amount`, `receive_date`, `ttype`, `TranDescription`, `Cause`, `Remark`, `unique_identity`, `tran_description`, `invoice_no`, `product_name`, `order_id`, `status`, `ewallet_used_by`, `ts`, `matching_commission_status`, `current_url`, `deposit_id`, `reason`, `create_date`, `rank_id`, `rank_name2`, `payment_method`, `payment_method_name`) VALUES
(1, 'T6877939', '123456', '4.8', '0', '4.8', '1.2', '123456', '7490726', 1, 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, '2024-01-10', 'Referral Bonus', 'Referral Bonus of level 1 from 7490726', 'Referral Bonus of level 1 from 7490726', 'Referral Bonus of level 1 from 7490726', 'feeder_stage', NULL, '', 'main', NULL, '1', 'Withdrawal Wallet', '2024-01-10 03:04:12', NULL, 'https://theitwebsolutions.com/school1/', '1', '9', '2024-01-10 03:04:12', NULL, NULL, NULL, NULL),
(2, 'T8090180', '123456', '4.8', '0', '4.8', '1.2', '123456', '9724876', 1, 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, '2024-01-10', 'Referral Bonus', 'Referral Bonus of level 1 from 9724876', 'Referral Bonus of level 1 from 9724876', 'Referral Bonus of level 1 from 9724876', 'feeder_stage', NULL, '', 'main', NULL, '1', 'Withdrawal Wallet', '2024-01-10 03:05:48', NULL, 'https://theitwebsolutions.com/school1/', '1', '9', '2024-01-10 03:05:48', NULL, NULL, NULL, NULL),
(3, 'T8572277', '123456', '0', '20', '9980', '0', '9724876', '123456', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-10', 'Package Purchased', 'Package Purchase by 9724876', 'Package Purchase by 9724876', 'Package Purchase by 9724876', NULL, NULL, '', 'main', NULL, '0', 'Withdrawal Wallet', '2024-01-10 03:05:48', NULL, 'https://theitwebsolutions.com/school1/', '1', '1', '2024-01-10 03:05:48', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `credit_debit_bkp`
--

CREATE TABLE `credit_debit_bkp` (
  `id` int(11) NOT NULL,
  `transaction_no` varchar(1000) NOT NULL,
  `user_id` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `credit_amt` varchar(255) DEFAULT NULL,
  `debit_amt` varchar(255) DEFAULT NULL,
  `balance` varchar(255) DEFAULT NULL,
  `admin_charge` varchar(255) DEFAULT NULL,
  `receiver_id` varchar(255) DEFAULT NULL,
  `sender_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `pkg_id` varchar(255) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `product_qty` varchar(255) DEFAULT NULL,
  `product_commission` varchar(255) DEFAULT NULL,
  `product_commission_type` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `rank_name` varchar(255) DEFAULT NULL,
  `pkg_amount` varchar(255) DEFAULT NULL,
  `receive_date` varchar(255) DEFAULT NULL,
  `ttype` varchar(255) DEFAULT NULL,
  `TranDescription` varchar(255) DEFAULT NULL,
  `Cause` varchar(255) DEFAULT NULL,
  `Remark` varchar(255) DEFAULT NULL,
  `unique_identity` varchar(255) DEFAULT NULL,
  `tran_description` varchar(255) DEFAULT NULL,
  `invoice_no` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `status` enum('0','1') DEFAULT NULL COMMENT '''0''=>debit,''1''=>credit',
  `ewallet_used_by` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `matching_commission_status` enum('0','1') DEFAULT NULL COMMENT '''0''=>not provided, ''1''=>provided',
  `current_url` varchar(255) DEFAULT NULL,
  `deposit_id` varchar(255) DEFAULT NULL,
  `reason` enum('1','2','3','4','5','6','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','37','38','39') DEFAULT NULL COMMENT '&#039;1&#039;=&gt;debit for pkg purchased,&#039;2&#039;=&gt; debit for ewallet withdrawl,&#039;3&#039;=&gt;debit for balance transfer,&#039;4&#039;=&gt;credit for balance transfer received,&#039;5&#039;=&gt;credit for matrix direct commission,&#039;6&#039;=&gt;credit for matrix commission,&#039;9&#039;=&gt;credit for unilevel commission,&#039;10&#039;=&gt;credit for rank bonus update,&#039;11&#039;=&gt;debit for fund transfer, &#039;12&#039;=&gt; credit by fund transfer,&#039;13&#039;=&gt;Debit Amount for Withdrawl wallet amount request,&#039;14&#039;=&gt;withdrawal request cancel refund,&#039;15&#039;=&gt;deposit request credit,&#039;16&#039;=&gt;debit for Epin purchased from E-wallet,&#039;17&#039;=&gt;Credit for add fund by admin, &#039;18&#039;=&gt;Debit for deduct fund by admin,&#039;19&#039;=&gt;fund transfer by admin to user,&#039;20&#039;=&gt; fund add by admin to self,&#039;21&#039;=&gt;Deduct user fund credit to admin,&#039;22&#039;=&gt;epin created by admin,&#039;23&#039;=&gt;Debit for package upgr',
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `rank_id` int(11) DEFAULT NULL,
  `rank_name2` varchar(100) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `payment_method_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credit_debit_cash`
--

CREATE TABLE `credit_debit_cash` (
  `id` int(11) NOT NULL,
  `transaction_no` varchar(1000) NOT NULL,
  `user_id` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `credit_amt` varchar(255) DEFAULT NULL,
  `debit_amt` varchar(255) DEFAULT NULL,
  `balance` varchar(255) DEFAULT NULL,
  `admin_charge` varchar(255) DEFAULT NULL,
  `receiver_id` varchar(255) DEFAULT NULL,
  `sender_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `pkg_id` varchar(255) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `product_qty` varchar(255) DEFAULT NULL,
  `product_commission` varchar(255) DEFAULT NULL,
  `product_commission_type` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `rank_name` varchar(255) DEFAULT NULL,
  `pkg_amount` varchar(255) DEFAULT NULL,
  `receive_date` varchar(255) DEFAULT NULL,
  `ttype` varchar(255) DEFAULT NULL,
  `TranDescription` varchar(255) DEFAULT NULL,
  `Cause` varchar(255) DEFAULT NULL,
  `Remark` varchar(255) DEFAULT NULL,
  `unique_identity` varchar(255) DEFAULT NULL,
  `tran_description` varchar(255) DEFAULT NULL,
  `invoice_no` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `status` enum('0','1') DEFAULT NULL COMMENT '''0''=>debit,''1''=>credit',
  `ewallet_used_by` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `matching_commission_status` enum('0','1') DEFAULT NULL COMMENT '''0''=>not provided, ''1''=>provided',
  `current_url` varchar(255) DEFAULT NULL,
  `deposit_id` varchar(255) DEFAULT NULL,
  `reason` enum('1','2','3','4','5','6','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','37','38','39') DEFAULT NULL COMMENT '&#039;1&#039;=&gt;debit for pkg purchased,&#039;2&#039;=&gt; debit for ewallet withdrawl,&#039;3&#039;=&gt;debit for balance transfer,&#039;4&#039;=&gt;credit for balance transfer received,&#039;5&#039;=&gt;credit for matrix direct commission,&#039;6&#039;=&gt;credit for matrix commission,&#039;9&#039;=&gt;credit for unilevel commission,&#039;10&#039;=&gt;credit for rank bonus update,&#039;11&#039;=&gt;debit for fund transfer, &#039;12&#039;=&gt; credit by fund transfer,&#039;13&#039;=&gt;Debit Amount for Withdrawl wallet amount request,&#039;14&#039;=&gt;withdrawal request cancel refund,&#039;15&#039;=&gt;deposit request credit,&#039;16&#039;=&gt;debit for Epin purchased from E-wallet,&#039;17&#039;=&gt;Credit for add fund by admin, &#039;18&#039;=&gt;Debit for deduct fund by admin,&#039;19&#039;=&gt;fund transfer by admin to user,&#039;20&#039;=&gt; fund add by admin to self,&#039;21&#039;=&gt;Deduct user fund credit to admin,&#039;22&#039;=&gt;epin created by admin,&#039;23&#039;=&gt;Debit for package upgr',
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `rank_id` int(11) DEFAULT NULL,
  `rank_name2` varchar(100) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `payment_method_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credit_debit_invest`
--

CREATE TABLE `credit_debit_invest` (
  `id` int(11) NOT NULL,
  `transaction_no` varchar(1000) NOT NULL,
  `user_id` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `credit_amt` varchar(255) DEFAULT NULL,
  `debit_amt` varchar(255) DEFAULT NULL,
  `balance` varchar(255) DEFAULT NULL,
  `admin_charge` varchar(255) DEFAULT NULL,
  `receiver_id` varchar(255) DEFAULT NULL,
  `sender_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `pkg_id` varchar(255) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `product_qty` varchar(255) DEFAULT NULL,
  `product_commission` varchar(255) DEFAULT NULL,
  `product_commission_type` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `rank_name` varchar(255) DEFAULT NULL,
  `pkg_amount` varchar(255) DEFAULT NULL,
  `receive_date` varchar(255) DEFAULT NULL,
  `ttype` varchar(255) DEFAULT NULL,
  `TranDescription` varchar(255) DEFAULT NULL,
  `Cause` varchar(255) DEFAULT NULL,
  `Remark` varchar(255) DEFAULT NULL,
  `unique_identity` varchar(255) DEFAULT NULL,
  `tran_description` varchar(255) DEFAULT NULL,
  `invoice_no` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `status` enum('0','1') DEFAULT NULL COMMENT '''0''=>debit,''1''=>credit',
  `ewallet_used_by` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `matching_commission_status` enum('0','1') DEFAULT NULL COMMENT '''0''=>not provided, ''1''=>provided',
  `current_url` varchar(255) DEFAULT NULL,
  `deposit_id` varchar(255) DEFAULT NULL,
  `reason` enum('1','2','3','4','5','6','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','37','38','39') DEFAULT NULL COMMENT '&#039;1&#039;=&gt;debit for pkg purchased,&#039;2&#039;=&gt; debit for ewallet withdrawl,&#039;3&#039;=&gt;debit for balance transfer,&#039;4&#039;=&gt;credit for balance transfer received,&#039;5&#039;=&gt;credit for matrix direct commission,&#039;6&#039;=&gt;credit for matrix commission,&#039;9&#039;=&gt;credit for unilevel commission,&#039;10&#039;=&gt;credit for rank bonus update,&#039;11&#039;=&gt;debit for fund transfer, &#039;12&#039;=&gt; credit by fund transfer,&#039;13&#039;=&gt;Debit Amount for Withdrawl wallet amount request,&#039;14&#039;=&gt;withdrawal request cancel refund,&#039;15&#039;=&gt;deposit request credit,&#039;16&#039;=&gt;debit for Epin purchased from E-wallet,&#039;17&#039;=&gt;Credit for add fund by admin, &#039;18&#039;=&gt;Debit for deduct fund by admin,&#039;19&#039;=&gt;fund transfer by admin to user,&#039;20&#039;=&gt; fund add by admin to self,&#039;21&#039;=&gt;Deduct user fund credit to admin,&#039;22&#039;=&gt;epin created by admin,&#039;23&#039;=&gt;Debit for package upgr',
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `rank_id` int(11) DEFAULT NULL,
  `rank_name2` varchar(100) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `payment_method_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credit_debit_product`
--

CREATE TABLE `credit_debit_product` (
  `id` int(11) NOT NULL,
  `transaction_no` varchar(1000) NOT NULL,
  `user_id` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `credit_amt` varchar(255) DEFAULT NULL,
  `debit_amt` varchar(255) DEFAULT NULL,
  `balance` varchar(255) DEFAULT NULL,
  `admin_charge` varchar(255) DEFAULT NULL,
  `receiver_id` varchar(255) DEFAULT NULL,
  `sender_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `pkg_id` varchar(255) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `product_qty` varchar(255) DEFAULT NULL,
  `product_commission` varchar(255) DEFAULT NULL,
  `product_commission_type` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `rank_name` varchar(255) DEFAULT NULL,
  `pkg_amount` varchar(255) DEFAULT NULL,
  `receive_date` varchar(255) DEFAULT NULL,
  `ttype` varchar(255) DEFAULT NULL,
  `TranDescription` varchar(255) DEFAULT NULL,
  `Cause` varchar(255) DEFAULT NULL,
  `Remark` varchar(255) DEFAULT NULL,
  `unique_identity` varchar(255) DEFAULT NULL,
  `tran_description` varchar(255) DEFAULT NULL,
  `invoice_no` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `status` enum('0','1') DEFAULT NULL COMMENT '''0''=>debit,''1''=>credit',
  `ewallet_used_by` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `matching_commission_status` enum('0','1') DEFAULT NULL COMMENT '''0''=>not provided, ''1''=>provided',
  `current_url` varchar(255) DEFAULT NULL,
  `deposit_id` varchar(255) DEFAULT NULL,
  `reason` enum('1','2','3','4','5','6','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','37','38','39') DEFAULT NULL COMMENT '&#039;1&#039;=&gt;debit for pkg purchased,&#039;2&#039;=&gt; debit for ewallet withdrawl,&#039;3&#039;=&gt;debit for balance transfer,&#039;4&#039;=&gt;credit for balance transfer received,&#039;5&#039;=&gt;credit for matrix direct commission,&#039;6&#039;=&gt;credit for matrix commission,&#039;9&#039;=&gt;credit for unilevel commission,&#039;10&#039;=&gt;credit for rank bonus update,&#039;11&#039;=&gt;debit for fund transfer, &#039;12&#039;=&gt; credit by fund transfer,&#039;13&#039;=&gt;Debit Amount for Withdrawl wallet amount request,&#039;14&#039;=&gt;withdrawal request cancel refund,&#039;15&#039;=&gt;deposit request credit,&#039;16&#039;=&gt;debit for Epin purchased from E-wallet,&#039;17&#039;=&gt;Credit for add fund by admin, &#039;18&#039;=&gt;Debit for deduct fund by admin,&#039;19&#039;=&gt;fund transfer by admin to user,&#039;20&#039;=&gt; fund add by admin to self,&#039;21&#039;=&gt;Deduct user fund credit to admin,&#039;22&#039;=&gt;epin created by admin,&#039;23&#039;=&gt;Debit for package upgr',
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `rank_id` int(11) DEFAULT NULL,
  `rank_name2` varchar(100) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `payment_method_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credit_debit_reward`
--

CREATE TABLE `credit_debit_reward` (
  `id` int(11) NOT NULL,
  `transaction_no` varchar(1000) NOT NULL,
  `user_id` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `credit_amt` varchar(255) DEFAULT NULL,
  `debit_amt` varchar(255) DEFAULT NULL,
  `balance` varchar(255) DEFAULT NULL,
  `admin_charge` varchar(255) DEFAULT NULL,
  `receiver_id` varchar(255) DEFAULT NULL,
  `sender_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `pkg_id` varchar(255) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `product_qty` varchar(255) DEFAULT NULL,
  `product_commission` varchar(255) DEFAULT NULL,
  `product_commission_type` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `rank_name` varchar(255) DEFAULT NULL,
  `pkg_amount` varchar(255) DEFAULT NULL,
  `receive_date` varchar(255) DEFAULT NULL,
  `ttype` varchar(255) DEFAULT NULL,
  `TranDescription` varchar(255) DEFAULT NULL,
  `Cause` varchar(255) DEFAULT NULL,
  `Remark` varchar(255) DEFAULT NULL,
  `unique_identity` varchar(255) DEFAULT NULL,
  `tran_description` varchar(255) DEFAULT NULL,
  `invoice_no` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `status` enum('0','1') DEFAULT NULL COMMENT '''0''=>debit,''1''=>credit',
  `ewallet_used_by` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `matching_commission_status` enum('0','1') DEFAULT NULL COMMENT '''0''=>not provided, ''1''=>provided',
  `current_url` varchar(255) DEFAULT NULL,
  `deposit_id` varchar(255) DEFAULT NULL,
  `reason` enum('1','2','3','4','5','6','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','37','38','39') DEFAULT NULL COMMENT '&#039;1&#039;=&gt;debit for pkg purchased,&#039;2&#039;=&gt; debit for ewallet withdrawl,&#039;3&#039;=&gt;debit for balance transfer,&#039;4&#039;=&gt;credit for balance transfer received,&#039;5&#039;=&gt;credit for matrix direct commission,&#039;6&#039;=&gt;credit for matrix commission,&#039;9&#039;=&gt;credit for unilevel commission,&#039;10&#039;=&gt;credit for rank bonus update,&#039;11&#039;=&gt;debit for fund transfer, &#039;12&#039;=&gt; credit by fund transfer,&#039;13&#039;=&gt;Debit Amount for Withdrawl wallet amount request,&#039;14&#039;=&gt;withdrawal request cancel refund,&#039;15&#039;=&gt;deposit request credit,&#039;16&#039;=&gt;debit for Epin purchased from E-wallet,&#039;17&#039;=&gt;Credit for add fund by admin, &#039;18&#039;=&gt;Debit for deduct fund by admin,&#039;19&#039;=&gt;fund transfer by admin to user,&#039;20&#039;=&gt; fund add by admin to self,&#039;21&#039;=&gt;Deduct user fund credit to admin,&#039;22&#039;=&gt;epin created by admin,&#039;23&#039;=&gt;Debit for package upgr',
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `rank_id` int(11) DEFAULT NULL,
  `rank_name2` varchar(100) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `payment_method_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credit_debit_saving`
--

CREATE TABLE `credit_debit_saving` (
  `id` int(11) NOT NULL,
  `transaction_no` varchar(1000) NOT NULL,
  `user_id` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `credit_amt` varchar(255) DEFAULT NULL,
  `debit_amt` varchar(255) DEFAULT NULL,
  `balance` varchar(255) DEFAULT NULL,
  `admin_charge` varchar(255) DEFAULT NULL,
  `receiver_id` varchar(255) DEFAULT NULL,
  `sender_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `pkg_id` varchar(255) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `product_qty` varchar(255) DEFAULT NULL,
  `product_commission` varchar(255) DEFAULT NULL,
  `product_commission_type` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `rank_name` varchar(255) DEFAULT NULL,
  `pkg_amount` varchar(255) DEFAULT NULL,
  `receive_date` varchar(255) DEFAULT NULL,
  `ttype` varchar(255) DEFAULT NULL,
  `TranDescription` varchar(255) DEFAULT NULL,
  `Cause` varchar(255) DEFAULT NULL,
  `Remark` varchar(255) DEFAULT NULL,
  `unique_identity` varchar(255) DEFAULT NULL,
  `tran_description` varchar(255) DEFAULT NULL,
  `invoice_no` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `status` enum('0','1') DEFAULT NULL COMMENT '''0''=>debit,''1''=>credit',
  `ewallet_used_by` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `matching_commission_status` enum('0','1') DEFAULT NULL COMMENT '''0''=>not provided, ''1''=>provided',
  `current_url` varchar(255) DEFAULT NULL,
  `deposit_id` varchar(255) DEFAULT NULL,
  `reason` enum('1','2','3','4','5','6','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','37','38','39') DEFAULT NULL COMMENT '&#039;1&#039;=&gt;debit for pkg purchased,&#039;2&#039;=&gt; debit for ewallet withdrawl,&#039;3&#039;=&gt;debit for balance transfer,&#039;4&#039;=&gt;credit for balance transfer received,&#039;5&#039;=&gt;credit for matrix direct commission,&#039;6&#039;=&gt;credit for matrix commission,&#039;9&#039;=&gt;credit for unilevel commission,&#039;10&#039;=&gt;credit for rank bonus update,&#039;11&#039;=&gt;debit for fund transfer, &#039;12&#039;=&gt; credit by fund transfer,&#039;13&#039;=&gt;Debit Amount for Withdrawl wallet amount request,&#039;14&#039;=&gt;withdrawal request cancel refund,&#039;15&#039;=&gt;deposit request credit,&#039;16&#039;=&gt;debit for Epin purchased from E-wallet,&#039;17&#039;=&gt;Credit for add fund by admin, &#039;18&#039;=&gt;Debit for deduct fund by admin,&#039;19&#039;=&gt;fund transfer by admin to user,&#039;20&#039;=&gt; fund add by admin to self,&#039;21&#039;=&gt;Deduct user fund credit to admin,&#039;22&#039;=&gt;epin created by admin,&#039;23&#039;=&gt;Debit for package upgr',
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `rank_id` int(11) DEFAULT NULL,
  `rank_name2` varchar(100) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `payment_method_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credit_debit_vtu`
--

CREATE TABLE `credit_debit_vtu` (
  `id` int(11) NOT NULL,
  `transaction_no` varchar(1000) NOT NULL,
  `user_id` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `credit_amt` varchar(255) DEFAULT NULL,
  `debit_amt` varchar(255) DEFAULT NULL,
  `balance` varchar(255) DEFAULT NULL,
  `admin_charge` varchar(255) DEFAULT NULL,
  `receiver_id` varchar(255) DEFAULT NULL,
  `sender_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `pkg_id` varchar(255) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `product_qty` varchar(255) DEFAULT NULL,
  `product_commission` varchar(255) DEFAULT NULL,
  `product_commission_type` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `rank_name` varchar(255) DEFAULT NULL,
  `pkg_amount` varchar(255) DEFAULT NULL,
  `receive_date` varchar(255) DEFAULT NULL,
  `ttype` varchar(255) DEFAULT NULL,
  `TranDescription` varchar(255) DEFAULT NULL,
  `Cause` varchar(255) DEFAULT NULL,
  `Remark` varchar(255) DEFAULT NULL,
  `unique_identity` varchar(255) DEFAULT NULL,
  `tran_description` varchar(255) DEFAULT NULL,
  `invoice_no` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `status` enum('0','1') DEFAULT NULL COMMENT '''0''=>debit,''1''=>credit',
  `ewallet_used_by` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `matching_commission_status` enum('0','1') DEFAULT NULL COMMENT '''0''=>not provided, ''1''=>provided',
  `current_url` varchar(255) DEFAULT NULL,
  `deposit_id` varchar(255) DEFAULT NULL,
  `reason` enum('1','2','3','4','5','6','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','37','38','39') DEFAULT NULL COMMENT '&#039;1&#039;=&gt;debit for pkg purchased,&#039;2&#039;=&gt; debit for ewallet withdrawl,&#039;3&#039;=&gt;debit for balance transfer,&#039;4&#039;=&gt;credit for balance transfer received,&#039;5&#039;=&gt;credit for matrix direct commission,&#039;6&#039;=&gt;credit for matrix commission,&#039;9&#039;=&gt;credit for unilevel commission,&#039;10&#039;=&gt;credit for rank bonus update,&#039;11&#039;=&gt;debit for fund transfer, &#039;12&#039;=&gt; credit by fund transfer,&#039;13&#039;=&gt;Debit Amount for Withdrawl wallet amount request,&#039;14&#039;=&gt;withdrawal request cancel refund,&#039;15&#039;=&gt;deposit request credit,&#039;16&#039;=&gt;debit for Epin purchased from E-wallet,&#039;17&#039;=&gt;Credit for add fund by admin, &#039;18&#039;=&gt;Debit for deduct fund by admin,&#039;19&#039;=&gt;fund transfer by admin to user,&#039;20&#039;=&gt; fund add by admin to self,&#039;21&#039;=&gt;Deduct user fund credit to admin,&#039;22&#039;=&gt;epin created by admin,&#039;23&#039;=&gt;Debit for package upgr',
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `rank_id` int(11) DEFAULT NULL,
  `rank_name2` varchar(100) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `payment_method_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credit_debit_welcome`
--

CREATE TABLE `credit_debit_welcome` (
  `id` int(11) NOT NULL,
  `transaction_no` varchar(1000) NOT NULL,
  `user_id` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `credit_amt` varchar(255) DEFAULT NULL,
  `debit_amt` varchar(255) DEFAULT NULL,
  `balance` varchar(255) DEFAULT NULL,
  `admin_charge` varchar(255) DEFAULT NULL,
  `receiver_id` varchar(255) DEFAULT NULL,
  `sender_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `pkg_id` varchar(255) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `product_qty` varchar(255) DEFAULT NULL,
  `product_commission` varchar(255) DEFAULT NULL,
  `product_commission_type` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `rank_name` varchar(255) DEFAULT NULL,
  `pkg_amount` varchar(255) DEFAULT NULL,
  `receive_date` varchar(255) DEFAULT NULL,
  `ttype` varchar(255) DEFAULT NULL,
  `TranDescription` varchar(255) DEFAULT NULL,
  `Cause` varchar(255) DEFAULT NULL,
  `Remark` varchar(255) DEFAULT NULL,
  `unique_identity` varchar(255) DEFAULT NULL,
  `tran_description` varchar(255) DEFAULT NULL,
  `invoice_no` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `status` enum('0','1') DEFAULT NULL COMMENT '''0''=>debit,''1''=>credit',
  `ewallet_used_by` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `matching_commission_status` enum('0','1') DEFAULT NULL COMMENT '''0''=>not provided, ''1''=>provided',
  `current_url` varchar(255) DEFAULT NULL,
  `deposit_id` varchar(255) DEFAULT NULL,
  `reason` enum('1','2','3','4','5','6','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','37','38','39') DEFAULT NULL COMMENT '&#039;1&#039;=&gt;debit for pkg purchased,&#039;2&#039;=&gt; debit for ewallet withdrawl,&#039;3&#039;=&gt;debit for balance transfer,&#039;4&#039;=&gt;credit for balance transfer received,&#039;5&#039;=&gt;credit for matrix direct commission,&#039;6&#039;=&gt;credit for matrix commission,&#039;9&#039;=&gt;credit for unilevel commission,&#039;10&#039;=&gt;credit for rank bonus update,&#039;11&#039;=&gt;debit for fund transfer, &#039;12&#039;=&gt; credit by fund transfer,&#039;13&#039;=&gt;Debit Amount for Withdrawl wallet amount request,&#039;14&#039;=&gt;withdrawal request cancel refund,&#039;15&#039;=&gt;deposit request credit,&#039;16&#039;=&gt;debit for Epin purchased from E-wallet,&#039;17&#039;=&gt;Credit for add fund by admin, &#039;18&#039;=&gt;Debit for deduct fund by admin,&#039;19&#039;=&gt;fund transfer by admin to user,&#039;20&#039;=&gt; fund add by admin to self,&#039;21&#039;=&gt;Deduct user fund credit to admin,&#039;22&#039;=&gt;epin created by admin,&#039;23&#039;=&gt;Debit for package upgr',
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `rank_id` int(11) DEFAULT NULL,
  `rank_name2` varchar(100) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `payment_method_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `id` int(3) NOT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `description` text DEFAULT NULL,
  `active_status` enum('0','1') NOT NULL DEFAULT '0' COMMENT '''0''=>''Inactive'', ''1''=>''Active''',
  `create_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `currency`, `description`, `active_status`, `create_date`) VALUES
(1, '$', '$', '1', '2023-11-09 12:33:20');

-- --------------------------------------------------------

--
-- Table structure for table `currency_display`
--

CREATE TABLE `currency_display` (
  `id` int(1) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0' COMMENT '''0''=>Hide currency, ''1''=>show currency'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `currency_display`
--

INSERT INTO `currency_display` (`id`, `status`) VALUES
(1, '1');

-- --------------------------------------------------------

--
-- Table structure for table `date_format`
--

CREATE TABLE `date_format` (
  `id` int(2) NOT NULL,
  `date_format` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `date_format`
--

INSERT INTO `date_format` (`id`, `date_format`) VALUES
(1, 'd/m/Y');

-- --------------------------------------------------------

--
-- Table structure for table `deposit_investment_amount_request`
--

CREATE TABLE `deposit_investment_amount_request` (
  `id` bigint(10) NOT NULL,
  `deposit_id` varchar(255) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `amount` varchar(255) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `roi_per` double NOT NULL,
  `roi_upto` double NOT NULL,
  `file_proof` varchar(255) DEFAULT NULL,
  `status` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '''0''=>Pending,''1''=>Approved,''2''=>Cancelled',
  `request_date` datetime NOT NULL DEFAULT current_timestamp(),
  `response_date` datetime DEFAULT NULL,
  `roi_amount` double NOT NULL,
  `roi_per_taken` double DEFAULT NULL,
  `roi_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposit_shopping_wallet_amount_request`
--

CREATE TABLE `deposit_shopping_wallet_amount_request` (
  `id` bigint(10) NOT NULL,
  `deposit_id` varchar(255) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `amount` varchar(255) NOT NULL,
  `title` text DEFAULT NULL,
  `file_proof` varchar(255) DEFAULT NULL,
  `status` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '''0''=>Pending,''1''=>Approved,''2''=>Cancelled',
  `request_date` datetime NOT NULL DEFAULT current_timestamp(),
  `response_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `deposit_shopping_wallet_amount_request`
--

INSERT INTO `deposit_shopping_wallet_amount_request` (`id`, `deposit_id`, `user_id`, `amount`, `title`, `file_proof`, `status`, `request_date`, `response_date`) VALUES
(1, 'D800015', '123456', '100', 'test', '15300205631.jpg', '1', '2018-06-26 19:12:43', '2018-06-26 16:03:01'),
(2, 'D469159', '123456', '500', '', '15300218131.jpg', '2', '2018-06-26 19:33:33', '2018-06-26 16:03:43');

-- --------------------------------------------------------

--
-- Table structure for table `deposit_wallet_amount_request`
--

CREATE TABLE `deposit_wallet_amount_request` (
  `id` bigint(10) NOT NULL,
  `deposit_id` varchar(255) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `amount` varchar(255) NOT NULL,
  `title` text DEFAULT NULL,
  `file_proof` varchar(255) DEFAULT NULL,
  `status` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '''0''=>Pending,''1''=>Approved,''2''=>Cancelled',
  `request_date` datetime NOT NULL DEFAULT current_timestamp(),
  `response_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `direct_commission`
--

CREATE TABLE `direct_commission` (
  `id` bigint(6) NOT NULL,
  `pkg_id` bigint(6) DEFAULT NULL,
  `type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '''1''=>percent, ''2''=>flat'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `direct_commission`
--

INSERT INTO `direct_commission` (`id`, `pkg_id`, `type`) VALUES
(1, 1, '2');

-- --------------------------------------------------------

--
-- Table structure for table `direct_commission_meta`
--

CREATE TABLE `direct_commission_meta` (
  `id` bigint(10) NOT NULL,
  `pkg_id` varchar(255) DEFAULT NULL,
  `from_pkg_id` int(11) DEFAULT NULL,
  `to_pkg_id` int(11) NOT NULL,
  `type` int(2) DEFAULT NULL,
  `commission` varchar(255) DEFAULT NULL,
  `commission_upgrade` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `direct_commission_meta`
--

INSERT INTO `direct_commission_meta` (`id`, `pkg_id`, `from_pkg_id`, `to_pkg_id`, `type`, `commission`, `commission_upgrade`) VALUES
(1, '1', 1, 2, 0, '6', '2');

-- --------------------------------------------------------

--
-- Table structure for table `direct_matrix_downline`
--

CREATE TABLE `direct_matrix_downline` (
  `id` int(11) NOT NULL,
  `down_id` varchar(222) NOT NULL,
  `income_id` varchar(222) NOT NULL,
  `level` varchar(222) NOT NULL,
  `l_date` timestamp NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL,
  `pay_status` varchar(255) DEFAULT NULL,
  `plan_type` bigint(10) DEFAULT NULL,
  `level_pay_status` varchar(255) NOT NULL DEFAULT 'Unpaid',
  `nom_leg_position` varchar(255) DEFAULT NULL,
  `uni_level_pay_status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `direct_matrix_downline`
--

INSERT INTO `direct_matrix_downline` (`id`, `down_id`, `income_id`, `level`, `l_date`, `status`, `pay_status`, `plan_type`, `level_pay_status`, `nom_leg_position`, `uni_level_pay_status`) VALUES
(1, '7490726', '123456', '1', '2024-01-09 21:34:12', 0, 'Unpaid', 1, 'Unpaid', NULL, NULL),
(2, '9724876', '123456', '1', '2024-01-09 21:35:48', 0, 'Unpaid', 1, 'Unpaid', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `epin`
--

CREATE TABLE `epin` (
  `id` bigint(8) NOT NULL,
  `request_id` varchar(255) DEFAULT NULL COMMENT 'Single request Unique id for multiple packages',
  `user_id` varchar(255) DEFAULT NULL COMMENT 'Epin Request user id',
  `pkg_id` bigint(6) DEFAULT NULL COMMENT 'for which pkg Epin request is done',
  `pkg_amount` varchar(255) DEFAULT NULL,
  `no_of_epin` bigint(10) DEFAULT NULL,
  `epin_amount` varchar(255) DEFAULT NULL,
  `request_status` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '''0''=>pending,''1''=>approved,''2''=>cancelled',
  `epin_status` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '''0''=>pending,''1''=>used,''2''=>expired',
  `payment_method` enum('0','1') NOT NULL DEFAULT '0' COMMENT '''0''=>ewallet,''1''=>bank wire(manual)',
  `bank_wire_proof_image` varchar(255) DEFAULT NULL,
  `request_date` datetime NOT NULL DEFAULT current_timestamp(),
  `response_date` datetime DEFAULT NULL COMMENT 'admin response date'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `epin_meta`
--

CREATE TABLE `epin_meta` (
  `id` bigint(10) NOT NULL,
  `epin_request_id` varchar(255) DEFAULT NULL,
  `sequence_number` varchar(255) DEFAULT NULL COMMENT 'Multiple epin generation sequence on single request',
  `epin_code` varchar(255) DEFAULT NULL COMMENT 'Epin Unique code',
  `user_id` varchar(255) DEFAULT NULL,
  `source_user_id` varchar(255) DEFAULT NULL COMMENT 'if source id is not comp that means epin is transferred',
  `pkg_id` bigint(6) DEFAULT NULL,
  `pkg_amount` varchar(255) DEFAULT NULL,
  `epin_status` enum('0','1','2','3','4') NOT NULL DEFAULT '0' COMMENT '''0''=>pending or fresh active pin,''1''=>used,''2''=>transferred,''3''=>Withdrawl,''4''=>Blocked epin',
  `register_user_id` varchar(255) DEFAULT NULL,
  `register_username` varchar(255) DEFAULT NULL,
  `status_change_date` datetime DEFAULT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `epin_meta_bkp_02072020`
--

CREATE TABLE `epin_meta_bkp_02072020` (
  `id` bigint(10) NOT NULL,
  `epin_request_id` varchar(255) DEFAULT NULL,
  `sequence_number` varchar(255) DEFAULT NULL COMMENT 'Multiple epin generation sequence on single request',
  `epin_code` varchar(255) DEFAULT NULL COMMENT 'Epin Unique code',
  `user_id` varchar(255) DEFAULT NULL,
  `source_user_id` varchar(255) DEFAULT NULL COMMENT 'if source id is not comp that means epin is transferred',
  `pkg_id` bigint(6) DEFAULT NULL,
  `pkg_amount` varchar(255) DEFAULT NULL,
  `epin_status` enum('0','1','2','3','4') NOT NULL DEFAULT '0' COMMENT '''0''=>pending or fresh active pin,''1''=>used,''2''=>transferred,''3''=>Withdrawl,''4''=>Blocked epin',
  `register_user_id` varchar(255) DEFAULT NULL,
  `register_username` varchar(255) DEFAULT NULL,
  `status_change_date` datetime DEFAULT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `epin_request`
--

CREATE TABLE `epin_request` (
  `id` bigint(10) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `proof` varchar(255) DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0' COMMENT '''0''=>Pending,''1''=>Approved',
  `request_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eshop_adv_banner`
--

CREATE TABLE `eshop_adv_banner` (
  `id` bigint(11) NOT NULL,
  `parent_category_id` bigint(12) DEFAULT NULL COMMENT 'It''s main  category',
  `category_id` bigint(12) DEFAULT NULL COMMENT 'It''s sub  category',
  `title` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `banner_caption` text DEFAULT NULL,
  `active_status` enum('0','1') NOT NULL DEFAULT '0' COMMENT '''0''=>Inactive,''1''=>Active',
  `position` varchar(255) DEFAULT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eshop_adv_slider`
--

CREATE TABLE `eshop_adv_slider` (
  `id` bigint(11) NOT NULL,
  `slider_image` varchar(255) DEFAULT NULL,
  `slider_caption` text DEFAULT NULL,
  `active_status` enum('0','1') NOT NULL DEFAULT '0' COMMENT '''0''=>Inactive,''1''=>Active',
  `position` int(11) DEFAULT NULL,
  `sub_category` varchar(255) DEFAULT NULL,
  `bulk_sale_percent` varchar(255) DEFAULT '0',
  `create_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eshop_adv_slider_sidebar`
--

CREATE TABLE `eshop_adv_slider_sidebar` (
  `id` bigint(11) NOT NULL,
  `sidebar_image` varchar(255) DEFAULT NULL,
  `caption_text` text DEFAULT NULL,
  `position` int(6) DEFAULT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eshop_bonus`
--

CREATE TABLE `eshop_bonus` (
  `id` int(11) NOT NULL,
  `order_id` varchar(100) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `income_id` varchar(50) NOT NULL,
  `product_id` int(11) NOT NULL,
  `commission` double NOT NULL,
  `level` int(2) NOT NULL,
  `status` int(1) NOT NULL,
  `bonus_date` date NOT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eshop_category`
--

CREATE TABLE `eshop_category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `active_status` int(5) DEFAULT 0,
  `user_id` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `role` enum('1','2','3') DEFAULT '1' COMMENT '''1''=>Created by admin,''2''=>Created by user,''3''=>created by vendor',
  `create_date` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `eshop_category`
--

INSERT INTO `eshop_category` (`id`, `category_name`, `position`, `active_status`, `user_id`, `parent_id`, `role`, `create_date`) VALUES
(1, 'Books', NULL, 0, NULL, 0, '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `eshop_guest`
--

CREATE TABLE `eshop_guest` (
  `id` int(11) NOT NULL,
  `guest_id` varchar(200) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(200) NOT NULL,
  `contact_no` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eshop_guest_delivery_address`
--

CREATE TABLE `eshop_guest_delivery_address` (
  `id` bigint(15) NOT NULL,
  `role` enum('2','3') NOT NULL DEFAULT '2' COMMENT '''2''=>mlm member,''3''=>Guest',
  `guest_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `landmark` varchar(255) DEFAULT NULL,
  `alternate_mobile_no` varchar(255) DEFAULT NULL,
  `crate_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eshop_member_delivery_address`
--

CREATE TABLE `eshop_member_delivery_address` (
  `id` bigint(15) NOT NULL,
  `role` enum('2','3') NOT NULL DEFAULT '2' COMMENT '''2''=>mlm member,''3''=>Guest',
  `user_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `landmark` varchar(255) DEFAULT NULL,
  `alternate_mobile_no` varchar(255) DEFAULT NULL,
  `crate_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `eshop_member_delivery_address`
--

INSERT INTO `eshop_member_delivery_address` (`id`, `role`, `user_id`, `name`, `mobile_no`, `state`, `city`, `address`, `landmark`, `alternate_mobile_no`, `crate_date`) VALUES
(1, '2', 'GWS7447955', 'Ezukwo uzoma', '08068513586', 'Anambra', 'Ekwulobia', 'Rose Ben quarters in jesco street,umushi Ekulobia', '', '08020934018', '2020-11-25 15:57:10');

-- --------------------------------------------------------

--
-- Table structure for table `eshop_orders`
--

CREATE TABLE `eshop_orders` (
  `id` bigint(20) NOT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `role` enum('2','3') NOT NULL DEFAULT '2' COMMENT '''2''=>User,''3''=>Guest',
  `user_id` varchar(255) DEFAULT NULL,
  `guest_id` varchar(255) DEFAULT NULL,
  `owner_role` enum('1','2','3') DEFAULT '1' COMMENT '1=>admin,''2''=>user,''3''=>Vendor',
  `owner_user_id` varchar(255) DEFAULT NULL,
  `order_details` text DEFAULT NULL,
  `total_products` varchar(255) DEFAULT NULL,
  `discount` varchar(255) DEFAULT NULL,
  `final_price` varchar(255) DEFAULT NULL,
  `order_status` enum('0','1','2','3') DEFAULT '0' COMMENT '0->pending,1->confirmed,2->rejected->3->delivered',
  `payment_method` enum('1','2','3') NOT NULL DEFAULT '1' COMMENT '''1''=>Cash payment,''2''=>Ewallet Payment,''3''=>Pay fast payment',
  `pay_stack_ref_no` varchar(255) DEFAULT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eshop_orders_bkp`
--

CREATE TABLE `eshop_orders_bkp` (
  `id` bigint(20) NOT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `role` enum('2','3') NOT NULL DEFAULT '2' COMMENT '''2''=>User,''3''=>Guest',
  `user_id` varchar(255) DEFAULT NULL,
  `guest_id` varchar(255) DEFAULT NULL,
  `owner_role` enum('1','2','3') DEFAULT '1' COMMENT '1=>admin,''2''=>user,''3''=>Vendor',
  `owner_user_id` varchar(255) DEFAULT NULL,
  `order_details` text DEFAULT NULL,
  `total_products` varchar(255) DEFAULT NULL,
  `discount` varchar(255) DEFAULT NULL,
  `final_price` varchar(255) DEFAULT NULL,
  `order_status` enum('0','1','2','3') DEFAULT '0' COMMENT '0->pending,1->confirmed,2->rejected->3->delivered',
  `payment_method` enum('1','2','3') NOT NULL DEFAULT '1' COMMENT '''1''=>Cash payment,''2''=>Ewallet Payment,''3''=>Pay fast payment',
  `pay_stack_ref_no` varchar(255) DEFAULT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eshop_orders_clients`
--

CREATE TABLE `eshop_orders_clients` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `post_code` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `for_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eshop_orders_details`
--

CREATE TABLE `eshop_orders_details` (
  `id` int(11) NOT NULL,
  `uploader_id` varchar(255) DEFAULT NULL,
  `product_id` varchar(200) DEFAULT NULL,
  `qty` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eshop_payment_method`
--

CREATE TABLE `eshop_payment_method` (
  `id` int(2) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `payment_mode_status` enum('0','1') NOT NULL DEFAULT '0' COMMENT '''0''=>Inactive,''1''=>Active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `eshop_payment_method`
--

INSERT INTO `eshop_payment_method` (`id`, `payment_method`, `payment_mode_status`) VALUES
(1, 'ewallet', '1');

-- --------------------------------------------------------

--
-- Table structure for table `eshop_products`
--

CREATE TABLE `eshop_products` (
  `id` bigint(10) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `parent_category_id` varchar(255) DEFAULT NULL COMMENT 'It''s main category',
  `category_id` int(11) DEFAULT NULL COMMENT 'It''s sub category',
  `sku` varchar(100) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `sub_images` text DEFAULT NULL,
  `old_price` varchar(100) DEFAULT NULL,
  `new_price` varchar(100) DEFAULT NULL,
  `qty` int(6) DEFAULT NULL,
  `total_order` bigint(15) DEFAULT 0,
  `description` text DEFAULT NULL,
  `long_description` text DEFAULT NULL,
  `status` enum('0','1') DEFAULT '0' COMMENT '0=>Inactive, 1=>Active',
  `featured` int(5) DEFAULT NULL,
  `created_date` datetime DEFAULT current_timestamp(),
  `role` enum('1','2','3') DEFAULT '1' COMMENT '''1''=>Created by admin,''2''=>Created by user,''3''=>created by vendor',
  `direct_commission` int(10) DEFAULT NULL,
  `guest_point` int(10) DEFAULT NULL,
  `discount` varchar(50) NOT NULL,
  `tax` varchar(50) NOT NULL DEFAULT '0',
  `shipment_charge` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `eshop_products`
--

INSERT INTO `eshop_products` (`id`, `user_id`, `parent_category_id`, `category_id`, `sku`, `title`, `product_image`, `sub_images`, `old_price`, `new_price`, `qty`, `total_order`, `description`, `long_description`, `status`, `featured`, `created_date`, `role`, `direct_commission`, `guest_point`, `discount`, `tax`, `shipment_charge`) VALUES
(1, 'DEMO1546226', '1', NULL, 'jkskjd', 'product1', '', 'N;', '100', '90', 1000, 0, '<p>kj</p>\r\n', '<p>kjkj</p>\r\n', '1', NULL, '2023-11-05 17:22:41', '2', NULL, NULL, '', '0', '0'),
(2, '123456', '1', NULL, 'kjhjk', 'product2', '16992401351.png', 'N;', '50', '40', 1000, 0, 'jhjh', 'h', '0', NULL, '2023-11-06 08:38:55', '2', NULL, NULL, '', '0', '0'),
(3, '6956196', '1', NULL, 'pkuid', 'product3', NULL, 'N;', '100', '80', 1000, 0, '<p>class 10</p>\r\n', '<p>math book</p>\r\n', '0', NULL, '2023-11-14 10:29:52', '2', NULL, NULL, '', '0', '0'),
(4, '123456', '', NULL, '', 'product4', NULL, 'N;', '', '', 1000, 0, '', '', '0', NULL, '2023-12-05 13:58:14', '2', NULL, NULL, '', '0', '0'),
(5, NULL, NULL, NULL, '', 'Test Product 1', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '0', NULL, '2025-03-20 05:57:30', '1', NULL, NULL, '', '0', '0'),
(6, NULL, NULL, NULL, '', 'Test Product 2', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '0', NULL, '2025-03-20 05:57:30', '1', NULL, NULL, '', '0', '0'),
(7, NULL, NULL, NULL, '', 'LH ', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '0', NULL, '2025-03-25 05:48:24', '1', NULL, NULL, '', '0', '0'),
(8, NULL, NULL, NULL, '', 'shaft', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '0', NULL, '2025-03-25 05:48:24', '1', NULL, NULL, '', '0', '0'),
(9, NULL, NULL, NULL, '', 'camlock', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '0', NULL, '2025-03-27 07:49:39', '1', NULL, NULL, '', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `eshop_products_stock`
--

CREATE TABLE `eshop_products_stock` (
  `id` bigint(10) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `parent_category_id` varchar(255) DEFAULT NULL COMMENT 'It''s main category',
  `category_id` int(11) DEFAULT NULL COMMENT 'It''s sub category',
  `title` varchar(255) DEFAULT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `sub_images` text DEFAULT NULL,
  `old_price` varchar(100) DEFAULT NULL,
  `new_price` varchar(100) DEFAULT NULL,
  `qty` int(6) DEFAULT NULL,
  `total_order` bigint(15) DEFAULT 0,
  `description` text DEFAULT NULL,
  `long_description` text DEFAULT NULL,
  `status` enum('0','1') DEFAULT '0' COMMENT '0=>Inactive, 1=>Active',
  `featured` int(5) DEFAULT NULL,
  `created_date` datetime DEFAULT current_timestamp(),
  `role` enum('1','2','3') DEFAULT '1' COMMENT '''1''=>Created by admin,''2''=>Created by user,''3''=>created by vendor',
  `direct_commission` int(10) DEFAULT NULL,
  `guest_point` int(10) DEFAULT NULL,
  `discount` varchar(50) NOT NULL,
  `tax` varchar(50) NOT NULL DEFAULT '0',
  `shipment_charge` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eshop_product_level_commission`
--

CREATE TABLE `eshop_product_level_commission` (
  `id` bigint(15) NOT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `level` int(3) DEFAULT NULL,
  `commission` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eshop_stock`
--

CREATE TABLE `eshop_stock` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `assign_web` int(11) NOT NULL,
  `assign_stockist` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eshop_stockist_sell`
--

CREATE TABLE `eshop_stockist_sell` (
  `id` int(11) NOT NULL,
  `order_id` varchar(50) NOT NULL,
  `stockist_id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `payment_mode` varchar(50) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eshop_stock_stockist`
--

CREATE TABLE `eshop_stock_stockist` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `stockist_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `total_order` int(11) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eshop_stock_stockist_history`
--

CREATE TABLE `eshop_stock_stockist_history` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `stockist_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eshop_subcategory`
--

CREATE TABLE `eshop_subcategory` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `subcategory_name` varchar(255) DEFAULT NULL,
  `position` bigint(12) DEFAULT NULL,
  `is_display_on_home` enum('0','1') NOT NULL DEFAULT '0' COMMENT '''0''=>Not to be dispayed,''1''=>Should be displayed',
  `display_home_position` bigint(15) DEFAULT NULL,
  `active_status` int(5) DEFAULT 0,
  `role` enum('1','2','3') DEFAULT '1' COMMENT '''1''=>Created by admin,''2''=>Created by user,''3''=>created by vendor',
  `create_date` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `eshop_subcategory`
--

INSERT INTO `eshop_subcategory` (`id`, `parent_id`, `subcategory_name`, `position`, `is_display_on_home`, `display_home_position`, `active_status`, `role`, `create_date`) VALUES
(1, NULL, 'Study Book', NULL, '0', NULL, 0, '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `eshop_vendors`
--

CREATE TABLE `eshop_vendors` (
  `id` int(11) NOT NULL,
  `vendor_id` varchar(150) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contact_no` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `registration_date` varchar(100) NOT NULL,
  `panel_title` varchar(255) DEFAULT 'User Panel'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `answer` longtext NOT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `final_cash_wallet`
--

CREATE TABLE `final_cash_wallet` (
  `id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  `status` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `final_e_wallet`
--

CREATE TABLE `final_e_wallet` (
  `id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  `wallet_type` varchar(20) NOT NULL DEFAULT 'main',
  `wallet_type_id` int(2) NOT NULL DEFAULT 1,
  `status` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `final_e_wallet`
--

INSERT INTO `final_e_wallet` (`id`, `user_id`, `amount`, `wallet_type`, `wallet_type_id`, `status`) VALUES
(1, '123456', 9980, 'main', 1, 0),
(24, '7490726', 0, 'main', 1, 0),
(25, '9724876', 0, 'main', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `final_invest_wallet`
--

CREATE TABLE `final_invest_wallet` (
  `id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  `status` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `final_invest_wallet_bkp`
--

CREATE TABLE `final_invest_wallet_bkp` (
  `id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  `status` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `final_product_wallet`
--

CREATE TABLE `final_product_wallet` (
  `id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  `status` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `final_reward_wallet`
--

CREATE TABLE `final_reward_wallet` (
  `id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  `status` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `final_saving_wallet`
--

CREATE TABLE `final_saving_wallet` (
  `id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  `status` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `final_vtu_wallet`
--

CREATE TABLE `final_vtu_wallet` (
  `id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  `status` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `final_welcome_wallet`
--

CREATE TABLE `final_welcome_wallet` (
  `id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  `status` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `indirect_unilevel_commission`
--

CREATE TABLE `indirect_unilevel_commission` (
  `id` bigint(10) NOT NULL,
  `pkg_id` bigint(10) DEFAULT NULL,
  `level_type` enum('1','0') DEFAULT NULL COMMENT '''1''=>limited, ''0''=>Unlimited',
  `commission_type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '''1''=>percent, ''2''=>flat',
  `commission` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `indirect_unilevel_commission_meta`
--

CREATE TABLE `indirect_unilevel_commission_meta` (
  `id` bigint(10) NOT NULL,
  `unilevel_commission_id` bigint(10) DEFAULT NULL,
  `pkg_id` varchar(255) DEFAULT NULL,
  `level` bigint(10) DEFAULT NULL,
  `level_commission` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `cad_file_id` int(11) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `job_title` varchar(255) NOT NULL,
  `job_location` varchar(255) NOT NULL,
  `job_details` longtext NOT NULL,
  `job_qualification` varchar(255) NOT NULL,
  `job_status` int(1) NOT NULL COMMENT '0 pending,1 applied,2 job closed',
  `job_postdate` datetime DEFAULT NULL,
  `job_updatedate` timestamp NOT NULL DEFAULT current_timestamp(),
  `add_by` varchar(20) NOT NULL,
  `add_user_id` varchar(20) DEFAULT NULL,
  `add_date` date DEFAULT NULL,
  `update_by` varchar(20) DEFAULT NULL,
  `update_user_id` varchar(20) DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `user_id` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `job_title`, `job_location`, `job_details`, `job_qualification`, `job_status`, `job_postdate`, `job_updatedate`, `add_by`, `add_user_id`, `add_date`, `update_by`, `update_user_id`, `update_date`, `user_id`) VALUES
(1, '', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'company', '2716526', '2024-02-25', NULL, NULL, NULL, '2716526'),
(2, 'asjdjh', 'jh', '{\"job_title\":\"asjdjh\",\"job_location\":\"jh\",\"job_type\":\"\",\"application_date\":\"hj\",\"skills\":\"\",\"employement_status\":\"\",\"salary\":\"jh\",\"job_qualification\":\"\",\"work_schedule\":\"jh\",\"contact_no\":\"jh\",\"company_info\":\"jh\",\"job_description\":\"jh\",\"btn\":\"Save\"}', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'company', '2716526', '2024-02-25', NULL, NULL, NULL, '2716526'),
(3, 'developer', 'jh', '{\"job_title\":\"developer\",\"job_location\":\"jh\",\"job_type\":\"\",\"application_date\":\"\",\"skills\":\"2\",\"employement_status\":\"\",\"salary\":\"\",\"job_qualification\":\"\",\"work_schedule\":\"\",\"contact_no\":\"\",\"company_info\":\"\",\"job_description\":\"\",\"btn\":\"Save\"}', '', 0, '2024-02-25 14:21:13', '2024-02-25 14:21:13', 'company', '2716526', '2024-02-25', NULL, NULL, NULL, '2716526');

-- --------------------------------------------------------

--
-- Table structure for table `job_searchkeywords`
--

CREATE TABLE `job_searchkeywords` (
  `id` int(11) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `searchresult` varchar(255) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `abbr` varchar(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `currencyKey` varchar(5) NOT NULL,
  `flag` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `abbr`, `name`, `currency`, `currencyKey`, `flag`) VALUES
(2, 'en', 'english', '$', 'USD', 'en.jpg'),
(3, 'estor', 'english', '$', 'USD', 'en.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `level_income_binary`
--

CREATE TABLE `level_income_binary` (
  `id` int(11) NOT NULL,
  `down_id` varchar(110) NOT NULL,
  `income_id` varchar(110) NOT NULL,
  `leg` varchar(20) NOT NULL,
  `level` int(11) NOT NULL,
  `l_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` smallint(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lifejacket_subscription`
--

CREATE TABLE `lifejacket_subscription` (
  `id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `package` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  `pay_type` varchar(50) NOT NULL,
  `pin_no` varchar(50) NOT NULL,
  `transaction_no` bigint(20) NOT NULL,
  `date` date DEFAULT NULL,
  `expire_date` date NOT NULL,
  `remark` varchar(255) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(200) NOT NULL,
  `invoice_no` varchar(1000) NOT NULL,
  `lifejacket_id` varchar(1000) NOT NULL,
  `username` varchar(1000) NOT NULL,
  `sponsor` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manufacturing_process`
--

CREATE TABLE `manufacturing_process` (
  `id` int(11) NOT NULL,
  `name` varchar(500) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `manufacturing_process`
--

INSERT INTO `manufacturing_process` (`id`, `name`, `status`, `ts`) VALUES
(1, 'CNC Machining', NULL, '2025-01-24 08:51:56'),
(2, 'Sheet Metal', NULL, '2025-01-24 08:51:56'),
(3, 'Injection Moulding', NULL, '2025-01-24 08:52:18'),
(4, 'Casting', NULL, '2025-01-24 08:52:18'),
(5, 'Forging', NULL, '2025-01-24 08:52:43'),
(6, 'Electronics Integration', NULL, '2025-01-24 08:52:43'),
(7, 'Fabrication', NULL, '2025-01-24 08:52:56'),
(8, 'Proto Processes', NULL, '2025-01-24 08:52:56'),
(9, 'Other', NULL, '2025-01-24 08:53:12'),
(10, 'Wood works', NULL, '2025-02-15 06:41:16'),
(11, 'Leaser', NULL, '2025-02-15 06:41:16'),
(12, 'Aluminum Extrusion', NULL, '2025-02-15 06:41:42'),
(13, 'Aluminum Fabrication', NULL, '2025-02-15 06:41:42'),
(14, 'Granit or Stone works', NULL, '2025-02-15 06:42:06'),
(15, 'Jewelry works', NULL, '2025-02-15 06:42:06'),
(16, 'Electronics and PCB manufacturing', NULL, '2025-02-15 06:42:28');

-- --------------------------------------------------------

--
-- Table structure for table `marketing_images`
--

CREATE TABLE `marketing_images` (
  `id` bigint(8) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0' COMMENT '''0''=>Unpublish,''1''=>Publish',
  `create_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `marketing_images`
--

INSERT INTO `marketing_images` (`id`, `user_id`, `title`, `description`, `image_path`, `status`, `create_date`) VALUES
(5, '', 'The Global Wealth System 22 Businesses', '', '159239269737935.jpg', '1', '2020-06-17 11:18:17'),
(6, '', 'Test', 'tets', '16992381101.png', '0', '2023-11-06 08:05:10'),
(7, '', 'Test', 'tets', '16992381711.png', '0', '2023-11-06 08:06:11'),
(8, '', 'asjh', 'hjjh', '16992381931.png', '0', '2023-11-06 08:06:33'),
(11, 'DEMO1546226', '', '', '16992393021.jpg', '1', '2023-11-06 08:25:02'),
(12, '123456', 'sahhj', 'hhj', '16992405491.png', '1', '2023-11-06 08:45:49');

-- --------------------------------------------------------

--
-- Table structure for table `marketing_videos`
--

CREATE TABLE `marketing_videos` (
  `id` bigint(8) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `video_path` varchar(255) DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0' COMMENT '''0''=>Unpublished,''1''=>Publish',
  `create_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `matrix_downline`
--

CREATE TABLE `matrix_downline` (
  `id` int(11) NOT NULL,
  `down_id` varchar(222) NOT NULL,
  `income_id` varchar(222) NOT NULL,
  `level` varchar(222) NOT NULL,
  `l_date` timestamp NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL,
  `pay_status` varchar(255) DEFAULT 'Unpaid',
  `plan_type` bigint(10) DEFAULT NULL,
  `level_pay_status` varchar(255) NOT NULL DEFAULT 'Unpaid',
  `nom_leg_position` varchar(255) DEFAULT NULL,
  `uni_level_pay_status` varchar(255) DEFAULT 'Unpaid',
  `sale_pay_status` varchar(20) NOT NULL DEFAULT 'Unpaid'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `matrix_downline`
--

INSERT INTO `matrix_downline` (`id`, `down_id`, `income_id`, `level`, `l_date`, `status`, `pay_status`, `plan_type`, `level_pay_status`, `nom_leg_position`, `uni_level_pay_status`, `sale_pay_status`) VALUES
(1, '7490726', '123456', '1', '2024-01-09 21:34:12', 0, 'Unpaid', 1, 'Paid', NULL, 'Unpaid', 'Unpaid'),
(2, '9724876', '123456', '1', '2024-01-09 21:35:48', 0, 'Unpaid', 1, 'Paid', NULL, 'Unpaid', 'Unpaid');

-- --------------------------------------------------------

--
-- Table structure for table `matrix_downline_pv`
--

CREATE TABLE `matrix_downline_pv` (
  `id` int(11) NOT NULL,
  `down_id` varchar(222) NOT NULL,
  `income_id` varchar(222) NOT NULL,
  `level` varchar(222) NOT NULL,
  `l_date` timestamp NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL,
  `pv` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `matrix_downline_pv_bkp`
--

CREATE TABLE `matrix_downline_pv_bkp` (
  `id` int(11) NOT NULL,
  `down_id` varchar(222) NOT NULL,
  `income_id` varchar(222) NOT NULL,
  `level` varchar(222) NOT NULL,
  `l_date` timestamp NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL,
  `pv` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `matrix_plan`
--

CREATE TABLE `matrix_plan` (
  `id` int(2) NOT NULL COMMENT 'id value always will be 1 coz it will contain always single row',
  `matrix_width` varchar(255) DEFAULT NULL,
  `matrix_depth` varchar(255) DEFAULT NULL,
  `total_stage` varchar(255) DEFAULT NULL COMMENT 'total stage excluding feeder stage',
  `create_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `matrix_stage1`
--

CREATE TABLE `matrix_stage1` (
  `id` int(11) NOT NULL,
  `down_id` varchar(222) DEFAULT NULL,
  `income_id` varchar(222) DEFAULT NULL,
  `level` varchar(222) DEFAULT NULL,
  `l_date` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `pay_status` varchar(255) DEFAULT NULL,
  `plan_type` int(11) DEFAULT NULL,
  `level_pay_status` varchar(255) NOT NULL DEFAULT 'Unpaid',
  `direct_member_leg_position` varchar(20) NOT NULL,
  `nom_leg_position` varchar(20) NOT NULL,
  `uni_level_pay_status` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `matrix_stage2`
--

CREATE TABLE `matrix_stage2` (
  `id` int(11) NOT NULL,
  `down_id` varchar(222) DEFAULT NULL,
  `income_id` varchar(222) DEFAULT NULL,
  `level` varchar(222) DEFAULT NULL,
  `l_date` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `pay_status` varchar(255) DEFAULT NULL,
  `plan_type` int(11) DEFAULT NULL,
  `level_pay_status` varchar(255) NOT NULL DEFAULT 'Unpaid',
  `direct_member_leg_position` varchar(20) NOT NULL,
  `nom_leg_position` varchar(20) NOT NULL,
  `uni_level_pay_status` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `matrix_stage3`
--

CREATE TABLE `matrix_stage3` (
  `id` int(11) NOT NULL,
  `down_id` varchar(222) DEFAULT NULL,
  `income_id` varchar(222) DEFAULT NULL,
  `level` varchar(222) DEFAULT NULL,
  `l_date` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `pay_status` varchar(255) DEFAULT NULL,
  `plan_type` int(11) DEFAULT NULL,
  `level_pay_status` varchar(255) NOT NULL DEFAULT 'Unpaid',
  `direct_member_leg_position` varchar(20) NOT NULL,
  `nom_leg_position` varchar(20) NOT NULL,
  `uni_level_pay_status` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `matrix_stage4`
--

CREATE TABLE `matrix_stage4` (
  `id` int(11) NOT NULL,
  `down_id` varchar(222) DEFAULT NULL,
  `income_id` varchar(222) DEFAULT NULL,
  `level` varchar(222) DEFAULT NULL,
  `l_date` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `pay_status` varchar(255) DEFAULT NULL,
  `plan_type` int(11) DEFAULT NULL,
  `level_pay_status` varchar(255) NOT NULL DEFAULT 'Unpaid',
  `direct_member_leg_position` varchar(20) NOT NULL,
  `nom_leg_position` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `matrix_stage4_old`
--

CREATE TABLE `matrix_stage4_old` (
  `id` int(11) NOT NULL,
  `down_id` varchar(222) DEFAULT NULL,
  `income_id` varchar(222) DEFAULT NULL,
  `level` varchar(222) DEFAULT NULL,
  `l_date` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `pay_status` varchar(255) DEFAULT NULL,
  `plan_type` int(11) DEFAULT NULL,
  `level_pay_status` varchar(255) NOT NULL DEFAULT 'Unpaid',
  `direct_member_leg_position` varchar(20) NOT NULL,
  `nom_leg_position` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `matrix_stage5`
--

CREATE TABLE `matrix_stage5` (
  `id` int(11) NOT NULL,
  `down_id` varchar(222) DEFAULT NULL,
  `income_id` varchar(222) DEFAULT NULL,
  `level` varchar(222) DEFAULT NULL,
  `l_date` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `pay_status` varchar(255) DEFAULT NULL,
  `plan_type` int(11) DEFAULT NULL,
  `level_pay_status` varchar(255) NOT NULL DEFAULT 'Unpaid',
  `direct_member_leg_position` varchar(20) NOT NULL,
  `nom_leg_position` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `matrix_stage6`
--

CREATE TABLE `matrix_stage6` (
  `id` int(11) NOT NULL,
  `down_id` varchar(222) DEFAULT NULL,
  `income_id` varchar(222) DEFAULT NULL,
  `level` varchar(222) DEFAULT NULL,
  `l_date` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `pay_status` varchar(255) DEFAULT NULL,
  `plan_type` int(11) DEFAULT NULL,
  `level_pay_status` varchar(255) NOT NULL DEFAULT 'Unpaid',
  `direct_member_leg_position` varchar(20) NOT NULL,
  `nom_leg_position` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `matrix_stage7`
--

CREATE TABLE `matrix_stage7` (
  `id` int(11) NOT NULL,
  `down_id` varchar(222) DEFAULT NULL,
  `income_id` varchar(222) DEFAULT NULL,
  `level` varchar(222) DEFAULT NULL,
  `l_date` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `pay_status` varchar(255) DEFAULT NULL,
  `plan_type` int(11) DEFAULT NULL,
  `level_pay_status` varchar(255) NOT NULL DEFAULT 'Unpaid',
  `direct_member_leg_position` varchar(20) NOT NULL,
  `nom_leg_position` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `matrix_stage_commission`
--

CREATE TABLE `matrix_stage_commission` (
  `id` bigint(6) NOT NULL,
  `pkg_id` bigint(6) DEFAULT NULL,
  `type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '''1''=>percent, ''2''=>flat'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='It''s usead when stage is completed';

--
-- Dumping data for table `matrix_stage_commission`
--

INSERT INTO `matrix_stage_commission` (`id`, `pkg_id`, `type`) VALUES
(1, 1, '2'),
(3, 2, '2');

-- --------------------------------------------------------

--
-- Table structure for table `matrix_stage_commission_meta`
--

CREATE TABLE `matrix_stage_commission_meta` (
  `id` bigint(10) NOT NULL,
  `pkg_id` varchar(255) DEFAULT NULL,
  `stage_key` varchar(255) DEFAULT NULL,
  `stage_number` varchar(255) DEFAULT NULL,
  `commission` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `matrix_stage_commission_meta`
--

INSERT INTO `matrix_stage_commission_meta` (`id`, `pkg_id`, `stage_key`, `stage_number`, `commission`) VALUES
(73, '2', 'feeder_stage', '1', '0'),
(74, '2', 'stage_1', '2', '150000'),
(75, '2', 'stage_2', '3', '300000'),
(76, '2', 'stage_3', '4', '3000000'),
(77, '2', 'stage_4', '5', '12000000'),
(78, '2', 'stage_5', '6', '30000000'),
(79, '1', 'feeder_stage', '1', '30000'),
(80, '1', 'stage_1', '2', '0'),
(81, '1', 'stage_2', '3', '0'),
(82, '1', 'stage_3', '4', '0'),
(83, '1', 'stage_4', '5', '0'),
(84, '1', 'stage_5', '6', '0');

-- --------------------------------------------------------

--
-- Table structure for table `matrix_stage_level_commission`
--

CREATE TABLE `matrix_stage_level_commission` (
  `id` int(5) NOT NULL,
  `pkg_id` varchar(255) DEFAULT NULL,
  `commission_type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '''1''=>Percent,''2''=>Flat'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `matrix_stage_level_commission`
--

INSERT INTO `matrix_stage_level_commission` (`id`, `pkg_id`, `commission_type`) VALUES
(1, '1', '2'),
(2, '2', '2');

-- --------------------------------------------------------

--
-- Table structure for table `matrix_stage_level_commission_meta`
--

CREATE TABLE `matrix_stage_level_commission_meta` (
  `id` bigint(10) NOT NULL,
  `pkg_id` varchar(255) DEFAULT NULL,
  `stage_no` varchar(255) DEFAULT NULL,
  `stage_key` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `commission_amount` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `matrix_stage_level_commission_meta`
--

INSERT INTO `matrix_stage_level_commission_meta` (`id`, `pkg_id`, `stage_no`, `stage_key`, `level`, `commission_amount`) VALUES
(74, '2', '1', 'feeder_stage', '1', '0'),
(75, '2', '1', 'feeder_stage', '2', '0'),
(76, '2', '2', 'stage_1', '1', '5000'),
(77, '2', '2', 'stage_1', '2', '5000'),
(78, '2', '3', 'stage_2', '1', '25000'),
(79, '2', '3', 'stage_2', '2', '25000'),
(80, '2', '4', 'stage_3', '1', '250000'),
(81, '2', '4', 'stage_3', '2', '250000'),
(82, '2', '5', 'stage_4', '1', '1000000'),
(83, '2', '5', 'stage_4', '2', '1000000'),
(84, '2', '6', 'stage_5', '1', '2500000'),
(85, '2', '6', 'stage_5', '2', '2500000'),
(99, '1', '1', 'feeder_stage', '1', '0'),
(100, '1', '1', 'feeder_stage', '2', '0'),
(101, '1', '2', 'stage_1', '1', '0'),
(102, '1', '2', 'stage_1', '2', '0'),
(103, '1', '3', 'stage_2', '1', '0'),
(104, '1', '3', 'stage_2', '2', '0'),
(105, '1', '4', 'stage_3', '1', '0'),
(106, '1', '4', 'stage_3', '2', '0'),
(107, '1', '5', 'stage_4', '1', '0'),
(108, '1', '5', 'stage_4', '2', '0'),
(109, '1', '5', 'stage_4', '3', '0'),
(110, '1', '6', 'stage_5', '1', '0'),
(111, '1', '6', 'stage_5', '2', '0');

-- --------------------------------------------------------

--
-- Table structure for table `matrix_stage_rank_bonus`
--

CREATE TABLE `matrix_stage_rank_bonus` (
  `id` bigint(6) NOT NULL,
  `pkg_id` bigint(6) DEFAULT NULL,
  `type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '''1''=>percent, ''2''=>flat'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `matrix_stage_rank_bonus`
--

INSERT INTO `matrix_stage_rank_bonus` (`id`, `pkg_id`, `type`) VALUES
(1, 1, '2'),
(2, 2, '2');

-- --------------------------------------------------------

--
-- Table structure for table `matrix_stage_rank_bonus_meta`
--

CREATE TABLE `matrix_stage_rank_bonus_meta` (
  `id` bigint(10) NOT NULL,
  `pkg_id` varchar(255) DEFAULT NULL,
  `stage_key` varchar(255) DEFAULT NULL,
  `stage_number` varchar(255) DEFAULT NULL,
  `commission` varchar(255) DEFAULT NULL,
  `rank_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `matrix_stage_rank_bonus_meta`
--

INSERT INTO `matrix_stage_rank_bonus_meta` (`id`, `pkg_id`, `stage_key`, `stage_number`, `commission`, `rank_name`) VALUES
(25, '2', 'feeder_stage', '1', '50000', '0'),
(26, '2', 'stage_1', '2', '650000', '0'),
(27, '2', 'stage_2', '3', '2000000', '0'),
(28, '2', 'stage_3', '4', '10300000', '0'),
(29, '2', 'stage_4', '5', '36000000', '0'),
(30, '2', 'stage_5', '6', '188500000', '0'),
(31, '1', 'feeder_stage', '1', '2000', '0'),
(32, '1', 'stage_1', '2', '0', '0'),
(33, '1', 'stage_2', '3', '0', '0'),
(34, '1', 'stage_3', '4', '0', '0'),
(35, '1', 'stage_4', '5', '0', '0'),
(36, '1', 'stage_5', '6', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `menu_name` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '0 front,1 user,2 admin',
  `position` int(11) NOT NULL,
  `header_menu` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `menu_content` longtext DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `menu_name`, `parent_id`, `type`, `position`, `header_menu`, `status`, `menu_content`, `ts`) VALUES
(1, 'Product', 0, 0, 3, 0, 0, NULL, '2022-10-06 07:27:56'),
(2, 'Affiliate Services', 0, 0, 4, 0, 0, NULL, '2022-10-06 07:28:09'),
(3, 'Exhibition', 0, 0, 5, 0, 0, NULL, '2022-10-06 07:33:16'),
(4, 'About', 0, 0, 0, 0, 0, NULL, '2022-10-06 07:33:48'),
(6, 'E-Commerce', 0, 0, 2, 0, 0, NULL, '2022-10-06 07:34:41'),
(7, 'Education', 1, 0, 0, 0, 0, '<h2><em><strong>What is Education?</strong></em></h2>\n\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n\n<h2>Why do we use it?</h2>\n\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\n', '2022-10-06 07:35:01'),
(8, 'Empowerment', 1, 0, 0, 0, 0, NULL, '2022-10-06 07:53:58'),
(10, 'Foundation', 1, 0, 0, 0, 0, NULL, '2022-10-06 08:01:24'),
(11, 'Medical', 2, 0, 0, 0, 0, NULL, '2022-10-06 08:01:42'),
(12, 'Travel', 2, 0, 0, 0, 0, NULL, '2022-10-06 08:01:53'),
(13, 'Images', 3, 0, 0, 0, 0, '<h2>What is Lorem Ipsum?</h2>\n\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n\n<h2>Why do we use it?</h2>\n\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\n', '2022-10-06 08:02:26'),
(14, 'Private Policy', 0, 0, 10, 1, 1, '<p><strong>Private Policy</strong></p>\n\n<p>1.1 Fortress Barn Business Network and its affiliates (&quot;Fortress Barn&quot;,&nbsp;&quot;us&quot;, and&nbsp;&quot;we&quot;) respect your right to privacy. At, Fortress Barn Business Network we look after your personal information carefully. We adhere strictly to the requirements of data protection law and, in accordance with current law, we are registered on the public register of data controllers which is looked after by the Information Commissioner.</p>\n\n<p>1.2 This Privacy Notice tells you who we are, how we collect, share and use information which identifies you (&quot;personal information&quot;) and how you can exercise your privacy rights. This Privacy Notice applies to personal information that we collect through our websites at https://www.fortressbarn.com, but also to other personal information that you may provide to us when we provide you with our services or products. Please do take a moment to read this Privacy Notice so that you will understand how we use your personal information.</p>\n\n<p>1.3 If you have any questions or concerns about our use of your personal information, then please contact us using the contact details provided at the bottom of this Privacy Notice.</p>\n\n<p><strong>Content of this Privacy Notice</strong></p>\n\n<p>We recommend that you read this Privacy Notice in full to ensure you are fully informed. However, if you only want to access a particular section of this Privacy Notice, then scroll down to the relevant section.</p>\n\n<ul>\n	<li><a href=\"https://www.fortressbarn.com/legal/privacy#section2\">Section 2</a>&nbsp;-&nbsp;What does Fortress Barn Business Network do?</li>\n	<li><a href=\"https://www.fortressbarn.com/legal/privacy#section3\">Section 3</a>&nbsp;-&nbsp;What personal information does Fortress Barn Business Network collect, and when?</li>\n	<li><a href=\"https://www.fortressbarn.com/legal/privacy#4\">Section 4</a>&nbsp;-&nbsp;Why does Fortress Barn process the personal information that it does?</li>\n	<li><a href=\"https://www.fortressbarn.com/legal/privacy#5\">Section 5</a>&nbsp;-&nbsp;Who does Fortress Barn share my personal information with?</li>\n	<li><a href=\"https://www.fortressbarn.com/legal/privacy#6\">Section 6</a>&nbsp;-&nbsp;Legal basis for processing personal information</li>\n	<li><a href=\"https://www.fortressbarn.com/legal/privacy#7\">Section 7</a>&nbsp;-&nbsp;Cookies and similar tracking technology</li>\n	<li><a href=\"https://www.fortressbarn.com/legal/privacy#8\">Section 8</a>&nbsp;-&nbsp;How does Fortress Barn keep my information secure?</li>\n	<li><a href=\"https://www.fortressbarn.com/legal/privacy#9\">Section 9</a>&nbsp;-&nbsp;International data transfers</li>\n	<li><a href=\"https://www.fortressbarn.com/legal/privacy#10\">Section 10</a>&nbsp;-&nbsp;Data retention</li>\n	<li><a href=\"https://www.fortressbarn.com/legal/privacy#11\">Section 11</a>&nbsp;-&nbsp;Automated decision making</li>\n	<li><a href=\"https://www.fortressbarn.com/legal/privacy#12\">Section 12</a>&nbsp;-&nbsp;Your data protection rights</li>\n	<li><a href=\"https://www.fortressbarn.com/legal/privacy#13\">Section 13</a>&nbsp;-&nbsp;Updates to this Privacy Notice</li>\n	<li><a href=\"https://www.fortressbarn.com/legal/privacy#14\">Section 14</a>&nbsp;-&nbsp;Links from our Website to other sites</li>\n	<li>&nbsp;<a href=\"https://www.fortressbarn.com/legal/privacy#15\">Section 15</a>&nbsp;-&nbsp;How to contact us</li>\n</ul>\n\n<p><strong>2. What does Fortress Barn Business Network do?</strong></p>\n\n<p>2.1 Fortress Barn Business Network based in the Netherlands, having Operational Offices in India, Africa and Asia. Fortress Barn Business Network majors on Multilevel Marketing, Investment Business, Holidays and Tours</p>\n\n<p>2.2 For more information about Fortress Barn Business Network please see the &quot;How we&#39;re different&quot; section of our Website at&nbsp;https://www.fortressbarn.com</p>\n\n<p><strong>3. What personal information does Fortress Barn collect, and when?</strong></p>\n\n<p>3.1There are lots of &#39;touch points&#39; where you may provide data to us voluntarily or where it is collected automatically. Given the number of services we offer, what data we collect from you depends on which you select. Types of personal data we typically collect at different touch points includes:</p>\n\n<ul>\n	<li>When you visit any of our&nbsp;websites:</li>\n</ul>\n\n<p>We may collect certain information automatically from your device. For example, your IP address device type, unique device identification numbers, browser type, broad geographic location (e.g. country or city-level location) and other technical information. We may also collect information about how your device has interacted with our Website, including the pages accessed, links clicked, and information gathered by our cookies.</p>\n\n<p>For more information about our websites and cookies, see&nbsp;<a href=\"https://www.fortressbarn.com/legal/privacy#7\">Section 7</a>,&nbsp;&#39;Cookies and similar tracking technology&#39;.</p>\n\n<ul>\n	<li>When you&nbsp;become a member&nbsp;of Fortress Barn Business Network and purchase services from us:</li>\n</ul>\n\n<p>Your name, gender, date of birth, address, others bank details, email, telephone number and BTC ID or Perfect Money ID. For your security, we&#39;ll also keep a record of your direct debit details (Card information is collected in a PCI compliant manner and is stored securely by a third-party payment processor, not by us).</p>\n\n<ul>\n	<li>When you change any of your personal information on the&nbsp;Clubhouse website, this will be saved to our system.</li>\n	<li>Depending on the service(s) you take, the data we require will differ:</li>\n</ul>\n\n<p>Service:&nbsp;we provide avenue to create wealth from usage information, such as referral bonuses and compensation benefits.</p>\n\n<p>Mobile service:&nbsp;we process call data records, such as who contacted you, who you contacted, when the contact took place, the duration and your location when you used your mobile device. Similar information is recorded for data consumption while using your mobile device.</p>\n\n<p>Phone and broadband service:&nbsp;your call data records, such as who contacted you, who you contacted, when the contact took place, and call duration.</p>\n\n<p>Insurance products (including buildings, contents, legal expense, home emergency, bill protector):&nbsp;we process data required to rate the risk of the insurance product you select. For example; about your house and household (e.g. number of occupants), of joint policy holders&#39; possessions, claims history and&nbsp;personal sensitive data&nbsp;such as criminal convictions and County Court Judgments and details. For more information on how we handle personal sensitive data, please see&nbsp;<a href=\"https://www.fortressbarn.com/legal/privacy#3.1.1\">section 3.1.1</a>&nbsp;below.</p>\n\n<ul>\n	<li>When you&nbsp;download or install one of our apps&nbsp;(including the Clubhouse or CashBack Wizard), this may require your location information to enable the features.</li>\n	<li>When you join our&nbsp;CashBack scheme&nbsp;we process information about the amount you spent, and the retailers which you used.</li>\n	<li>When&nbsp;you contact us by any means&nbsp;(such as telephone, email, letter or SMS) with account queries or to complain about the service you have received:</li>\n</ul>\n\n<p>the content of your communications with us, including emails, letters, webchats and phone calls. When we call you or you call our call centre, we will record any telephone calls that we have with you, to make sure that we are providing you with a good service and meeting all our regulatory and legal responsibilities.</p>\n\n<ul>\n	<li>When you book an&nbsp;engineering visit&nbsp;(e.g. to install or repair an electricity meter or phone line) or call with&nbsp;technical queries&nbsp;(e.g. because your meter or broadband isn&#39;t working):</li>\n</ul>\n\n<p>information about your home network, meter or usage patterns in order to fix the fault.</p>\n\n<ul>\n	<li>When you enter&nbsp;prize draws&nbsp;or&nbsp;competitions&nbsp;(such as Win a Promo) we may retain your name and contact details.</li>\n	<li>When you choose to complete any&nbsp;Member surveys&nbsp;we send you, we will receive the information you volunteer about your use of our goods and services.</li>\n	<li>When you apply for any&nbsp;service related schemes, for example, the Feed in Tariff Scheme, we will retain information pertinent to that application (the application form will clearly state the information required).</li>\n	<li>When you&#39;ve given a third-party permission to share with us the information they hold about you. For example, your previous telephone, broadband, mobile or energy supplier.</li>\n	<li>Whenever any of our suppliers share information with us about the product or service you have purchased.</li>\n	<li>When you are contacted by one of our independent distributors about our products and services, or about the opportunity to become an independent distributor, we will collect your name and contact details. If you then sign up to be a customer of an independent distributor they will collect such other information as may be required to help process your application.</li>\n</ul>\n\n<p>3.1.1 Sensitive Personal Data:&nbsp;some of the personal information that you provide to us may include sensitive personal information, such as health-related information or information about your race or ethnicity. You may provide this information to us voluntarily, for example during communications relating to customer account management. If we need to collect sensitive personal information from you, we will obtain your consent (or otherwise let you know our relevant legal grounds for collecting this information), at the point when we ask you to provide this information.</p>\n\n<p>Additionally, we may be required to collect sensitive information (such as criminal records) if you apply for our insurance products, we will let you know our relevant legal grounds for collecting this information, at the point when we ask you to provide this information.</p>\n\n<p>3.1.2 Data received from third parties:&nbsp;sometimes we will collect personal information from third parties. For example, gathering your energy supply numbers from third parties, validating and verifying your bank account and validating your credit history with a credit reference agency. We use the information we receive from these third parties to provide you with our services and products, as otherwise necessary for our legitimate business reasons (for example, to verify that you are a suitable customer and that a direct debit can be taken from the bank account details provided to us), or to comply with law.</p>\n\n<p>3.1.3 If you require more information on what we collect, how we handle sensitive personal data or what data we collect from third parties, please go to&nbsp;<a href=\"https://www.fortressbarn.com/legal/privacy#15\">section 15</a>,&nbsp;which shows you how to get in touch with us.</p>\n\n<p><strong>4. Why does Fortress Barn process the personal information that it does?</strong></p>\n\n<p>Most commonly, we need personal information for one of four reasons: (1) to perform a contract; (2) where it is in our legitimate interests to do so; (3) where it is required to comply with legal or regulatory obligations; and (4) where you have provided your consent.</p>\n\n<p>To understand more about these legal grounds for processing your personal data, please see&nbsp;<a href=\"https://www.fortressbarn.com/legal/privacy#6\">section 6</a>,&nbsp;&#39;Legal basis for processing personal information&#39;</p>\n\n<p>4.1 Where we use your personal data to carry our contract(s) and provide products or services to you, if you don&#39;t give us the correct information, we might not be able to provide you with the product or service(s) you ordered from us. We need your personal information in order to do the following:</p>\n\n<ul>\n	<li>Supply you with the services you selected and to tell you when we&#39;ll install your services;</li>\n	<li>Instruct our wholesale partners to provide you with the services you have selected;</li>\n</ul>\n\n<p>(when we do this, we still control your personal information and we have strict controls in place to make sure it&#39;s properly protected, see&nbsp;<a href=\"https://www.fortressbarn.com/legal/privacy#5\">section 5</a> &#39;Who does Fortress Barn share my personal information with?&#39;);</p>\n\n<ul>\n	<li>Send you product or service-information messages (for example, to inform you of any changes that might affect your service, like when infrastructure work may be planned or need to fix something);</li>\n	<li>Manage your account (such as accurately billing you for the services and taking payment for services);</li>\n	<li>Update our records about you (to ensure that they are up-to-date and accurate);</li>\n	<li>Comply with our regulatory obligations;</li>\n	<li>Detect fraud; and</li>\n	<li>Check your identity.</li>\n</ul>\n\n<p>4.2 We may also use this information for legitimate business purposes, such as:</p>\n\n<ul>\n	<li>If you have not opted out, or where we are otherwise permitted by law, provide you with marketing communications about similar good and services;</li>\n	<li>To improve our products and service offerings;</li>\n	<li>Staff training;</li>\n	<li>Recovery of bad debt; and</li>\n	<li>Analysing business metrics.</li>\n</ul>\n\n<p>We will tell you at the point of collection when we use your personal data for legitimate interest purposes (for more information see&nbsp;<a href=\"https://www.fortress.com/legal/privacy#6\">section 6,</a> &#39;Legal basis for processing personal information&#39;).</p>\n\n<p>4.3 We are a responsible supplier and we are required to comply with certain legal and regulatory obligations. One example of this is if you are a vulnerable customer.</p>\n\n<p>If you tell us you have a disability or otherwise need support, we&#39;ll note that you are a vulnerable customer, but only if you give you permission or if we have to for legal or regulatory reasons. For example, if you told us about a disability we need to be aware of when we deliver our services to you, we have to record that information so we don&#39;t repeatedly ask you about it. We will also record the details of a Power of Attorney we have been asked to log against your account.</p>\n\n<p>For more information about out regulatory and legal use of personal data, see&nbsp;<a href=\"https://www.fortressbarn.com/legal/privacy#5\">section 5</a>&nbsp;&#39;Who does Utility Warehouse share my personal information with?&#39;</p>\n\n<p><strong>5. Who does Fortress Barn share my personal information with?</strong></p>\n\n<p>5.1 We may disclose your personal information to the following categories of recipients:</p>\n\n<ul>\n	<li>to our&nbsp;group companies, and third-party services providers&nbsp;who provide processing services to us (for example, to support the delivery of, provide functionality on or help to enhance the security of our services, products and Website) or who otherwise process personal information for purposes that are described in this Privacy Notice or notified to you when we collect your personal information. A list of our current group companies is available upon request;</li>\n	<li>to service providers&nbsp;who enable us to provide the underlying utility and related services to you. For example, Holidays and Tours Guide, our Resort administrator. If you are telephony customer, this might include network operators. Equally, should you choose to move your services away, for example to a new energy supplier, information such as your meter readings or equipment or money you owe us will be provided to that new supplier so they can begin to supply your gas and electricity;</li>\n	<li>to any&nbsp;competent law enforcement body, regulatory, government agency, court or other third party&nbsp;where we believe disclosure is necessary (i) as a matter of applicable law or regulation, (ii) to exercise, establish or defend our legal rights, or (iii) to protect your vital interests or those of any other person;</li>\n	<li>to&nbsp;health or social care bodies&nbsp;if we believe that you or a member of your household needs any extra care (perhaps because of age, health or disability) we may share this information with social services, healthcare and other support organisations if we believe that they will be able to help you by making sure that there is an energy supply to your home or to other energy suppliers, if you are considering changing, in line with the Multilevel Marketing Acts.</li>\n	<li>to a&nbsp;prospect&nbsp;(and its referral) in connection with any proposed plan to subscribe through your referral&rsquo;s link, to become a registered member in our business.</li>\n	<li>to any&nbsp;other person with your consent&nbsp;to the disclosure.</li>\n</ul>\n\n<p><strong>6. Legal basis for processing personal information</strong></p>\n\n<p>6.1The law on data protection sets out a number of different reasons for which a company may collect and process your personal data. Our legal basis for collecting and using the personal information described above will depend on the personal information concerned and the specific context in which we collect it, including:</p>\n\n<p>6.2 Consent</p>\n\n<p>In specific situations, we can collect and process your data with your consent. For example, when you tick a box to consent to enable one of our apps to use your location data from your mobile phone.</p>\n\n<p>When collecting your personal data, we&#39;ll always make it clear to you which data is necessary in connection with a particular service.</p>\n\n<p>6.3 Contractual necessity</p>\n\n<p>In certain circumstances, we need your personal data to comply with our contractual obligations. For example, if we contract to provide you with energy, we&#39;ll need to collect your name and home address details in order to provide you with energy at the correct address. However, we will normally collect personal information from you only where we need that personal information to perform a contract with you.</p>\n\n<p>6.4 Legal compliance</p>\n\n<p>If the law requires us to, we may need to collect and process your data. For example, we can pass on details of people involved in fraud to law enforcement agencies.</p>\n\n<p>6.5 Legitimate interest</p>\n\n<p>Sometimes, we require your data to pursue our legitimate interests in a way which might reasonably be expected as part of running our business and which does not materially impact your rights, freedom or interests.</p>\n\n<p>We carry out the following activities on the basis of legitimate interest:</p>\n\n<ul>\n	<li>Marketing activities:&nbsp;you may choose not to receive marketing communications from us at the point of sale. If you do not opt-out from receiving marketing communications from us, you will be provided with communications about other similar utility and household services and benefits from time to time and we may also request you to complete customer satisfaction questionnaires. A facility is provided to enable you to opt-out of receiving marketing communications at any time (as instructed in the communication or simply by contacting customer services through e-mail).</li>\n	<li>Carrying out credit checking&nbsp;for mobile phone handsets (you can refuse to be credit checked, however, you may then have to pay a deposit or pay for the mobile phone handset upfront).</li>\n	<li>CashBack Wizard:&nbsp;if you choose our CashBack service, you will be able to select an application that sits on your browser (including on mobile devices) and informs you if you visit a website that participates in our CashBack scheme.</li>\n	<li>Collection of debt:&nbsp;we may need to process your personal data in order to recover unpaid debt. Especially when you contract you to make purchases for us.</li>\n	<li>Data Analytics:&nbsp;we analyse customer data in order to better understand our customer base and our service offering. We may also identify if you would be receptive to particular goods and services (ie tailoring our marketing to you) or whether you may benefit from our home movers service.</li>\n</ul>\n\n<p>6.6 If you have questions about, or need further information concerning, the legal basis on which we collect and use your personal information, please contact us using the contact details provided in&nbsp;,&nbsp;&#39;How to contact us&#39;.</p>\n\n<p><strong>7. Cookies and similar tracking technology</strong></p>\n\n<p>7.1 We use cookies and similar tracking technology (collectively, &quot;Cookies&quot;) on our websites to collect and use personal information about you, including to serve interest-based advertising. For further information about the types of Cookies we use, why, and how you can control Cookies please see our Cookies Policy at&nbsp;<a href=\"https://www.fortressbarn.com/legal/cookies\">https://www.fortressbarn.com/legal/cookies</a>.</p>\n\n<p><strong>8. How does Utility Warehouse keep my information secure?</strong></p>\n\n<p>8.1 We use appropriate technical and organisational measures to protect the personal information that we collect and process about you. The measures we use are designed to provide a level or security appropriate to the risk of processing your personal information.</p>\n\n<p>8.2 We check your identity when you get in touch with us, and we follow our security procedures and apply suitable technical measures, such as encryption, to protect your information.</p>\n\n<p>8.3 Specific measures we use include:</p>\n\n<p>a. Implementing design principles within our infrastructure (e.g. use of DMZ and firewalls);</p>\n\n<p>b. adopting security safeguards against attacks (e.g. internal and external monitoring of network traffic use and carrying out regular penetration tests); and</p>\n\n<p>c. security policies which provide working guidelines to our staff as well as enforce controls and procedures in line with data protection law and other industry-specific compliance requirements.</p>\n\n<p><strong>9. International data transfers</strong></p>\n\n<p>9.1 Your personal information may be transferred to, and processed in, countries other than the country in which you are resident. These countries may have data protection laws that are different to the laws of your country (and, in some cases, may not be as protective).</p>\n\n<p>9.2 Specifically, whilst we operate in Netherlanders or Africa, our third party service providers and partners operate around the world. This means that when we collect your personal information we may process it in any of these countries.</p>\n\n<p>9.3 However, we have taken appropriate safeguards to require that your personal information will remain protected in accordance with this Privacy Notice. We have implemented similar appropriate safeguards with our third party service providers (for example, the European Commission&#39;s Standard Contractual Clauses) and further details can be provided upon request.</p>\n\n<p><strong>10. Data retention</strong></p>\n\n<p>10.1 We retain personal information we collect from you only for as long as is necessary for the purpose for which it was collected. In most cases, we will keep your personal information while you&#39;re one of our customers, and for seven years after. In other cases we&#39;ll store personal information for the periods needed for the purposes for which the information was collected or for which it is to be further processed. And sometimes we&#39;ll keep it for longer if we need to by law.</p>\n\n<p>10.2 At the end of the retention period, your data will either be deleted completely or anonymised, for example by aggregation with other data so that it can be used in a non-identifiable way for statistical analysis and business planning.</p>\n\n<p><strong>11. Automated decision making</strong></p>\n\n<p>11.1In some instances, our use of your personal information may result in automated decisions being taken (including profiling) that legally affect you or similarly significantly affect you.</p>\n\n<p>11.2Automated decisions mean that a decision concerning you is made automatically on the basis of a computer determination (using software algorithms), without our human review. For example, we may use automated decisions to analyse your credit worthiness and verify your identity when we process your application for certain products and services.</p>\n\n<p>11.3When we make an automated decision about you, you have the right to contest the decision, to express your point of view, and to require a human review of the decision. You can exercise this right by contacting us using the contact details provided under the&nbsp;<a href=\"https://www.fortressbarn.com/legal/privacy#15\">How to contact us</a>&nbsp;heading below.</p>\n\n<p><strong>12. Your data protection rights</strong></p>\n\n<p>12.1 You may have the following data protection rights:</p>\n\n<ul>\n	<li>If you wish to&nbsp;access, correct, update or request deletion&nbsp;of your personal information, you can do so at any time by contacting us using the contact details provided under the&nbsp;<a href=\"https://www.fortressbarn.com/legal/privacy#15\">How to contact us</a>&nbsp;heading below.</li>\n	<li>In addition, you can&nbsp;object to processing&nbsp;of your personal information, ask us to&nbsp;restrict processing&nbsp;of your personal information or&nbsp;request portability&nbsp;of your personal information. Again, you can exercise these rights by contacting us using the contact details provided under the&nbsp;<a href=\"https://www.fortressbarn.com/legal/privacy#15\">How to contact us</a>&nbsp;heading below.</li>\n	<li>You have the right to&nbsp;opt-out of marketing communications&nbsp;we send you at any time. You can exercise this right by clicking on the &quot;unsubscribe&quot; or &quot;opt-out&quot; link in the marketing emails we send you, or texting &quot;STOP&quot; to the number listed in the text messages we send. If you would prefer to opt-out over the telephone, or to opt-out of other forms of marketing (such as postal marketing) then please contact us using the contact details provided under the&nbsp;<a href=\"https://www.fortressbarn.com/legal/privacy#15\">How to contact us</a>&nbsp;heading below.</li>\n	<li>Similarly, if we have collected and processed your personal information with your consent, then you can&nbsp;withdraw your consent&nbsp;at any time. Withdrawing your consent will not affect the lawfulness of any processing we conducted prior to your withdrawal, nor will it affect processing of your personal information conducted in reliance on lawful processing grounds other than consent.</li>\n	<li>You have the&nbsp;right to complain to a data protection authority&nbsp;about our collection and use of your personal information. For more information, please contact your local data protection authority. (Contact details for Information Commissioner&#39;s Office are available)</li>\n</ul>\n\n<p>12.2 We respond to all requests we receive from individuals wishing to exercise their data protection rights in accordance with applicable data protection laws.</p>\n\n<p><strong>13. Updates to this Privacy Notice</strong></p>\n\n<p>13.1We may update this Privacy Notice from time to time in response to changing legal, technical or business developments. When we update our Privacy Notice, we will take appropriate measures to inform you, consistent with the significance of the changes we make. We will obtain your consent to any material Privacy Notice changes if and where this is required by data protection law.</p>\n\n<p>13.2You can see when this Privacy Notice was last updated by checking the &quot;last updated&quot; date displayed at the top of this Privacy Notice.</p>\n\n<p><strong>14. Links from our Website to other sites</strong></p>\n\n<p>14.1Please be aware that our site may provide access to other websites by linking to them. We are not responsible for the data policies (including data protection and cookies), content or security of these linked web sites.</p>\n\n<p><strong>15. How to contact us</strong></p>\n\n<p>15.1If you have any questions or concerns about our use of your personal information, please contact our data protection officer using the following details:&nbsp;<a href=\"mailto:privacy@fortressbarn.com\">privacy@fortressbarn.com</a>.</p>\n\n<p>15.2The data controller of your personal information is Utility Warehouse Limited, which is registered with the ICO with registration.</p>\n\n<p>&nbsp;</p>\n', '2022-10-06 17:12:12'),
(15, 'Videos', 3, 0, 0, 0, 0, NULL, '2022-10-06 18:54:37'),
(17, 'FullStack Website Development', 2, 0, 0, 0, 0, NULL, '2022-10-06 18:56:23'),
(18, 'Faq', 0, 0, 0, 1, 1, NULL, '2022-10-10 08:53:06'),
(19, 'Compensation Plan ', 0, 0, 0, 0, 1, NULL, '2022-11-08 09:30:59');

-- --------------------------------------------------------

--
-- Table structure for table `menu_fortress`
--

CREATE TABLE `menu_fortress` (
  `id` int(11) NOT NULL,
  `country` varchar(255) NOT NULL,
  `country_image` varchar(500) NOT NULL,
  `plan_images` text NOT NULL,
  `menu_content` longtext NOT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `menu_fortress`
--

INSERT INTO `menu_fortress` (`id`, `country`, `country_image`, `plan_images`, `menu_content`, `ts`) VALUES
(1, 'USA', '16654062801.png', '16655025651.png,16655025652.png,16655025653.png,16655025654.png,16655025655.png,16655025656.png,16655025657.png,16655025658.png,16655025659.png,166550256510.png,166550256511.png,166550256512.png,166550256513.png,166550256514.png,166550256515.png,166550256516.png,166550256517.png,166550256518.png,166550256519.png,166550256520.png', '<h3><strong>Our Packages</strong></h3>\n\n<p><strong>STANDARD $14&nbsp; &nbsp;Referral Bonus $2</strong></p>\n\n<p><strong>PREMIUM $27&nbsp; &nbsp;Referral Bonus $4</strong></p>\n\n<p><strong>SUPER $40&nbsp; &nbsp;Referral Bonus $6</strong></p>\n', '2022-10-10 06:38:10'),
(2, 'Nigeria', '16654071771.png', '16656214531.png', '<h3><strong>Our Packages</strong></h3>\n\n<p><strong>STANDARD: ₦7000&nbsp; Referral Bonus: ₦1000</strong></p>\n\n<p><strong>PREMIUM: ₦13,500&nbsp; Referral Bonus:&nbsp;₦2000</strong></p>\n\n<p><strong>SUPER: ₦20,000&nbsp; Referral Bonus: ₦3000</strong></p>\n', '2022-10-10 07:34:47'),
(3, 'South Africa', '16653917211.png', '16656193741.png', '<h3><strong>Our Packages</strong></h3>\n\n<p><strong>STANDARD R266 &nbsp;&nbsp;&nbsp; Referral Bonus R38</strong></p>\n\n<p><strong>PREMIUM R513 &nbsp;&nbsp;&nbsp; Referral Bonus R76</strong></p>\n\n<p><strong>SUPER R760 &nbsp;&nbsp;&nbsp; Referral Bonus R144</strong></p>\n', '2022-10-10 07:51:41'),
(4, 'Ghana', '16656209111.png', '16656218771.png', '<h3><strong>Our Packages</strong></h3>\n\n<p><strong>STANDARD&nbsp;GH₵168 &nbsp; Referral Bonus GH₵24</strong></p>\n\n<p><strong>PREMIUM&nbsp;GH₵324 &nbsp; Referral Bonus GH₵48</strong></p>\n\n<p><strong>SUPER&nbsp;GH₵480 &nbsp; Referral Bonus GH₵72</strong></p>\n', '2022-10-10 08:41:01');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text DEFAULT NULL,
  `reciever_id` varchar(255) DEFAULT NULL,
  `sender_id` varchar(255) NOT NULL,
  `reciever_name` varchar(255) DEFAULT NULL,
  `sender_name` varchar(200) NOT NULL,
  `read_receiver` enum('0','1') NOT NULL DEFAULT '0' COMMENT '''0''=>Unread,''1''=>Read',
  `ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `attachment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

CREATE TABLE `notice` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `notice`
--

INSERT INTO `notice` (`id`, `name`, `ts`) VALUES
(1, '<p>Welcome! To Fortress Barn your wellbeing and all round security is paramount to us</p>\n', '2022-10-10 14:00:02');

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `id` bigint(10) NOT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `pkg_image` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `referal_bonus` varchar(20) NOT NULL,
  `pv` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` enum('0','1') DEFAULT '0' COMMENT '0=>Deactive, 1=>Active',
  `role` enum('1') DEFAULT '1' COMMENT '1=>created by admin ',
  `link_to` enum('1','2') NOT NULL DEFAULT '1' COMMENT '''1''=>Associate,''2''=>Retail',
  `shipment_charge` varchar(255) NOT NULL DEFAULT '0',
  `tax` varchar(255) NOT NULL DEFAULT '0',
  `created_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`id`, `country_code`, `title`, `pkg_image`, `amount`, `referal_bonus`, `pv`, `description`, `status`, `role`, `link_to`, `shipment_charge`, `tax`, `created_date`) VALUES
(1, '1', 'Joining', '16923348391.jpeg', '20', '2', '4500', '<p>Biotix Pro 1 update</p>\n', '1', '1', '1', '0', '0', '2018-11-13 14:50:37');

-- --------------------------------------------------------

--
-- Table structure for table `package-old`
--

CREATE TABLE `package-old` (
  `id` bigint(10) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `pkg_image` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` enum('0','1') DEFAULT '0' COMMENT '0=>Deactive, 1=>Active',
  `role` enum('1') DEFAULT '1' COMMENT '1=>created by admin ',
  `created_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `package_sold_amount`
--

CREATE TABLE `package_sold_amount` (
  `id` int(1) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `pkg_id` varchar(255) DEFAULT NULL,
  `pkg_amount` varchar(255) DEFAULT '0',
  `point_volume` varchar(255) DEFAULT NULL,
  `purchase_method` enum('1','2','3') DEFAULT NULL,
  `purpose` enum('1','2') NOT NULL DEFAULT '1',
  `qty` varchar(255) NOT NULL DEFAULT '1',
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `bank_name` varchar(255) DEFAULT NULL,
  `account_no` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `transaction_date` varchar(255) DEFAULT NULL,
  `proof` varchar(255) DEFAULT NULL,
  `payment_later` enum('0','1') NOT NULL DEFAULT '0',
  `country_code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `package_sold_amount`
--

INSERT INTO `package_sold_amount` (`id`, `user_id`, `pkg_id`, `pkg_amount`, `point_volume`, `purchase_method`, `purpose`, `qty`, `create_date`, `bank_name`, `account_no`, `transaction_id`, `transaction_date`, `proof`, `payment_later`, `country_code`) VALUES
(1, '7490726', '1', '20', NULL, NULL, '1', '1', '2024-01-10 08:34:12', NULL, NULL, NULL, NULL, NULL, '0', NULL),
(2, '9724876', '1', '20', NULL, NULL, '1', '1', '2024-01-10 08:35:48', NULL, NULL, NULL, NULL, NULL, '0', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `package_sold_amount_old`
--

CREATE TABLE `package_sold_amount_old` (
  `id` bigint(11) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `pkg_id` varchar(255) DEFAULT NULL,
  `pkg_amount` varchar(255) DEFAULT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_paytm`
--

CREATE TABLE `payment_paytm` (
  `id` int(11) NOT NULL,
  `ORDERID` varchar(50) NOT NULL,
  `MID` varchar(100) NOT NULL,
  `TXNID` varchar(200) NOT NULL,
  `TXNAMOUNT` double NOT NULL,
  `PAYMENTMODE` varchar(10) NOT NULL,
  `CURRENCY` varchar(5) NOT NULL,
  `TXNDATE` datetime NOT NULL,
  `STATUS` varchar(50) NOT NULL,
  `RESPCODE` varchar(10) NOT NULL,
  `RESPMSG` text NOT NULL,
  `GATEWAYNAME` varchar(50) NOT NULL,
  `BANKTXNID` varchar(50) NOT NULL,
  `BANKNAME` varchar(50) NOT NULL,
  `IS_CHECKSUM_VALID` varchar(5) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `response` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payout_limit`
--

CREATE TABLE `payout_limit` (
  `id` int(11) NOT NULL,
  `transfer_minimum` varchar(20) NOT NULL,
  `transfer_maximum` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'transfer',
  `status` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `payout_limit`
--

INSERT INTO `payout_limit` (`id`, `transfer_minimum`, `transfer_maximum`, `type`, `status`) VALUES
(1, '25', '500', 'transfer', '0');

-- --------------------------------------------------------

--
-- Table structure for table `payout_setting`
--

CREATE TABLE `payout_setting` (
  `id` int(2) NOT NULL,
  `request_type` enum('0','1') NOT NULL DEFAULT '0' COMMENT '''0''=>On user request,''1''=>By admin'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `payout_setting`
--

INSERT INTO `payout_setting` (`id`, `request_type`) VALUES
(1, '1');

-- --------------------------------------------------------

--
-- Table structure for table `paystack_data`
--

CREATE TABLE `paystack_data` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `purpose` enum('1','2') DEFAULT NULL COMMENT '''1''=>paystack,''2''=>fluuterwave',
  `order_id` varchar(255) DEFAULT NULL,
  `gateway_response` varchar(200) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `paid_at` varchar(150) DEFAULT NULL,
  `amount` varchar(80) DEFAULT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `full_response` text DEFAULT NULL,
  `pay_date` varchar(50) DEFAULT NULL,
  `refrence_no` varchar(150) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pay_fast_response`
--

CREATE TABLE `pay_fast_response` (
  `id` bigint(15) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `m_payment_id` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `pay_fast_response` text DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `po_products`
--

CREATE TABLE `po_products` (
  `id` int(11) NOT NULL,
  `po_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `rate` int(11) DEFAULT NULL,
  `total_cost` varchar(255) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `added_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `po_products`
--

INSERT INTO `po_products` (`id`, `po_id`, `product_id`, `qty`, `rate`, `total_cost`, `create_date`, `added_date`) VALUES
(1, 4, 1, 2, 10, NULL, NULL, '2025-03-13 17:54:53'),
(2, 4, 2, 5, 15, NULL, NULL, '2025-03-13 17:54:53'),
(3, 5, 1, 2, 10, NULL, NULL, '2025-03-14 08:07:41'),
(4, 5, 2, 5, 15, NULL, NULL, '2025-03-14 08:07:41'),
(5, 6, 0, 2, 19, NULL, NULL, '2025-03-16 12:41:05'),
(6, 6, 0, 4, 35, NULL, NULL, '2025-03-16 12:41:05'),
(7, 6, 0, 5, 45, NULL, NULL, '2025-03-16 12:41:05'),
(8, 7, 0, 2, 18, NULL, NULL, '2025-03-16 12:46:05'),
(9, 7, 0, 4, 43, NULL, NULL, '2025-03-16 12:46:05'),
(10, 7, 0, 5, 55, NULL, NULL, '2025-03-16 12:46:05'),
(11, 8, 0, 2, 18, NULL, NULL, '2025-03-16 12:50:24'),
(12, 8, 0, 4, 43, NULL, NULL, '2025-03-16 12:50:24'),
(13, 8, 0, 5, 55, NULL, NULL, '2025-03-16 12:50:24'),
(14, 9, 0, 2, 21, NULL, NULL, '2025-03-16 12:52:10'),
(15, 9, 0, 4, 44, NULL, NULL, '2025-03-16 12:52:10'),
(16, 9, 0, 5, 51, NULL, NULL, '2025-03-16 12:52:10'),
(17, 10, 0, 21, 20, NULL, NULL, '2025-03-16 13:32:39'),
(18, 10, 0, 41, 40, NULL, NULL, '2025-03-16 13:32:39'),
(19, 10, 0, 51, 50, NULL, NULL, '2025-03-16 13:32:39'),
(20, 11, 0, 22, 20, NULL, NULL, '2025-03-17 05:52:43'),
(21, 11, 0, 42, 40, NULL, NULL, '2025-03-17 05:52:43'),
(22, 11, 0, 52, 50, NULL, NULL, '2025-03-17 05:52:43'),
(23, 12, 1, 22, 20, NULL, NULL, '2025-03-17 07:44:46'),
(24, 12, 2, 42, 40, NULL, NULL, '2025-03-17 07:44:46'),
(25, 12, 3, 52, 50, NULL, NULL, '2025-03-17 07:44:46'),
(26, 13, 1, 2, 20, NULL, NULL, '2025-03-17 09:29:26'),
(27, 13, 2, 8, 40, NULL, NULL, '2025-03-17 09:29:26'),
(28, 13, 3, 6, 50, NULL, NULL, '2025-03-17 09:29:26'),
(29, 14, 1, 100, 12, NULL, NULL, '2025-03-18 07:43:43'),
(30, 14, 2, 100, 12, NULL, NULL, '2025-03-18 07:43:43'),
(31, 14, 3, 12, 12, NULL, NULL, '2025-03-18 07:43:43'),
(32, 14, 4, 123, 12, NULL, NULL, '2025-03-18 07:43:43'),
(33, 15, 1, 2, 20, NULL, NULL, '2025-03-24 12:55:32'),
(34, 15, 2, 4, 40, NULL, NULL, '2025-03-24 12:55:32'),
(35, 15, 3, 5, 50, NULL, NULL, '2025-03-24 12:55:32'),
(36, 16, 8, 200, 40, NULL, NULL, '2025-03-25 08:40:33');

-- --------------------------------------------------------

--
-- Table structure for table `prdouct_unilevel_commission_meta`
--

CREATE TABLE `prdouct_unilevel_commission_meta` (
  `id` bigint(10) NOT NULL,
  `product_id` bigint(10) DEFAULT NULL,
  `level` bigint(10) DEFAULT NULL,
  `level_commission` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_purchase`
--

CREATE TABLE `product_purchase` (
  `id` int(11) NOT NULL,
  `package_id` int(20) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `transaction_no` varchar(50) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `pv` varchar(255) NOT NULL,
  `shipment_charge` varchar(255) NOT NULL,
  `tax` varchar(255) NOT NULL,
  `from_registration` int(1) NOT NULL,
  `purchase_date` date NOT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order`
--

CREATE TABLE `purchase_order` (
  `id` int(11) NOT NULL,
  `po_code` varchar(50) NOT NULL,
  `rfq_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `quote_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `po_date` date DEFAULT NULL,
  `po_valid_date` date DEFAULT NULL,
  `tax_category` varchar(255) DEFAULT NULL,
  `payment_term` text DEFAULT NULL,
  `term_and_condition` text DEFAULT NULL,
  `documents` text DEFAULT NULL,
  `add_by_id` int(11) NOT NULL,
  `update_id` int(11) NOT NULL,
  `update_date` date NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `status` int(1) DEFAULT NULL COMMENT '0 reject,1 accept',
  `accept_date` date DEFAULT NULL,
  `accept_by` int(11) DEFAULT NULL,
  `supplier_status` int(1) DEFAULT NULL COMMENT '0 reject,1 accept',
  `supplier_accept_date` date DEFAULT NULL,
  `supplier_accept_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `purchase_order`
--

INSERT INTO `purchase_order` (`id`, `po_code`, `rfq_id`, `customer_id`, `quote_id`, `supplier_id`, `po_date`, `po_valid_date`, `tax_category`, `payment_term`, `term_and_condition`, `documents`, `add_by_id`, `update_id`, `update_date`, `admin_id`, `create_date`, `status`, `accept_date`, `accept_by`, `supplier_status`, `supplier_accept_date`, `supplier_accept_by`) VALUES
(1, 'PO8102202', 1, 51, 1, NULL, '2025-03-13', NULL, 'tax_category', 'payment_term', NULL, 'documents', 51, 0, '0000-00-00', NULL, '2025-03-13', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'PO8166843', 1, 51, 1, NULL, '2025-03-13', NULL, 'tax_category', 'payment_term', NULL, 'documents', 51, 0, '0000-00-00', NULL, '2025-03-13', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'PO2873457', 1, 51, 1, NULL, '2025-03-13', NULL, 'tax_category', 'payment_term', NULL, 'documents', 51, 0, '0000-00-00', NULL, '2025-03-13', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'PO3601373', 1, 51, 1, NULL, '2025-03-13', NULL, 'tax_category', 'payment_term', NULL, 'documents', 51, 0, '0000-00-00', NULL, '2025-03-13', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'PO7550258', 1, 51, 1, 18, '2025-03-14', NULL, 'tax_category', 'payment_term', NULL, 'documents', 51, 0, '0000-00-00', NULL, '2025-03-14', 1, '2025-03-14', NULL, 1, '2025-03-14', 51),
(6, 'PO8062772', 66, 1, 44, NULL, '2025-03-16', NULL, 'Test Tax Category', '30% advance - 20% ', NULL, '/company_doc/weekend.png_1742128857_0.png', 1, 0, '0000-00-00', NULL, '2025-03-16', NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'PO6808318', 66, 1, 44, NULL, '2025-03-16', NULL, 'Test Cat 2', '30% advance - No change', NULL, '/company_doc/weekend.png_1742129160_0.png', 1, 0, '0000-00-00', NULL, '2025-03-16', NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'PO9593947', 66, 1, 44, NULL, '2025-03-16', NULL, 'Test Cat 2', '30% advance - No change', NULL, '/company_doc/weekend.png_1742129160_0.png', 1, 0, '0000-00-00', NULL, '2025-03-16', 0, '2025-03-16', 29, NULL, NULL, NULL),
(9, 'PO6274573', 66, 1, 44, NULL, '2025-03-16', NULL, 'Test Cat 2', '30% advance - 20%', NULL, '/company_doc/weekend.png_1742129527_0.png', 1, 0, '0000-00-00', NULL, '2025-03-16', 0, '2025-03-16', 29, NULL, NULL, NULL),
(10, 'PO8330906', 66, 1, 44, NULL, '2025-03-16', NULL, 'New Tax', 'Payment terms\n30 % Advance', NULL, '/company_doc/weekend.png_1742131955_0.png', 1, 0, '0000-00-00', NULL, '2025-03-16', 0, '2025-03-16', 29, NULL, NULL, NULL),
(11, 'PO8784863', 66, 1, 44, NULL, '2025-03-17', NULL, 'New tax', 'Payment terms 30%', 'terms 30%', NULL, 1, 0, '0000-00-00', NULL, '2025-03-17', 0, '2025-03-17', 29, NULL, NULL, NULL),
(12, 'PO2567825', 66, 1, 44, NULL, '2025-03-17', NULL, 'New Tax', 'Payment terms - No advance', ' terms - Good quality', '/company_doc/weekend.png_1742197482_0.png', 1, 0, '0000-00-00', NULL, '2025-03-17', NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'PO4678737', 66, 1, 44, 18, '2025-03-17', NULL, 'Free', 'Cash ', 'Term and condition', NULL, 1, 0, '0000-00-00', NULL, '2025-03-17', 1, '2025-03-17', NULL, 1, '2025-03-17', 18),
(14, 'PO8592922', 67, 25, 49, 24, '2025-03-18', NULL, 'VAT + import duties ', 'your payment terms is accepted will proceed with initial 50 % payment.', 'delivery time should not be exceeded and last payment will be done on goods delivered conditions ', NULL, 25, 0, '0000-00-00', NULL, '2025-03-18', 1, '2025-03-18', NULL, 1, '2025-03-18', 24),
(15, 'PO6263301', 66, 1, 44, NULL, '2025-03-24', NULL, '2', 'Payment termsPayment terms', 'Terms & ConditionsTerms & ConditionsTerms & Conditions', '/company_doc/book-cover.png_1742820930_0.png', 1, 0, '0000-00-00', NULL, '2025-03-24', NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'PO1947817', 71, 25, 53, 24, '2025-03-25', NULL, '2', '1qwer', 'wert', NULL, 25, 0, '0000-00-00', NULL, '2025-03-25', 1, '2025-03-25', NULL, 1, '2025-03-25', 24);

-- --------------------------------------------------------

--
-- Table structure for table `qualification`
--

CREATE TABLE `qualification` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(1) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_products`
--

CREATE TABLE `quotation_products` (
  `id` int(11) NOT NULL,
  `quote_id` int(11) NOT NULL,
  `rfq_id` int(11) NOT NULL,
  `rfq_code` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `rate` int(11) DEFAULT NULL,
  `total_cost` varchar(255) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `added_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `files` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `quotation_products`
--

INSERT INTO `quotation_products` (`id`, `quote_id`, `rfq_id`, `rfq_code`, `product_id`, `quantity`, `rate`, `total_cost`, `create_date`, `added_date`, `files`) VALUES
(1, 13, 1, 'RFQ1', 0, 2, 0, '0.00', '2025-03-04', '2025-03-04 13:55:09', 'null'),
(2, 13, 1, 'RFQ1', 0, 5, 0, '0.00', '2025-03-04', '2025-03-04 13:55:09', 'null'),
(3, 14, 1, 'RFQ1', 0, 2, NULL, NULL, '2025-03-04', '2025-03-04 13:56:37', 'null'),
(4, 14, 1, 'RFQ1', 0, 5, NULL, NULL, '2025-03-04', '2025-03-04 13:56:37', 'null'),
(5, 15, 1, 'RFQ1', 0, 2, 10, '20', '2025-03-04', '2025-03-04 13:57:39', 'null'),
(6, 15, 1, 'RFQ1', 0, 5, 15, '75', '2025-03-04', '2025-03-04 13:57:39', 'null'),
(7, 16, 1, 'RFQ1', 1, 2, 10, '20', '2025-03-04', '2025-03-04 13:58:05', 'null'),
(8, 16, 1, 'RFQ1', 2, 5, 15, '75', '2025-03-04', '2025-03-04 13:58:05', 'null'),
(9, 17, 1, 'RFQ1', 1, 2, 10, '20', '2025-03-04', '2025-03-04 13:58:58', NULL),
(10, 17, 1, 'RFQ1', 2, 5, 15, '75', '2025-03-04', '2025-03-04 13:58:58', NULL),
(11, 18, 58, 'RFQ9874376', 0, 10, 23, '230', '2025-03-05', '2025-03-05 11:49:09', NULL),
(12, 18, 58, 'RFQ9874376', 0, 20, 222, '4440', '2025-03-05', '2025-03-05 11:49:09', NULL),
(13, 19, 56, 'RFQ7504060', 0, 10, 22, '220', '2025-03-05', '2025-03-05 12:20:52', NULL),
(14, 19, 56, 'RFQ7504060', 0, 1000, 44, '44000', '2025-03-05', '2025-03-05 12:20:52', NULL),
(15, 20, 55, 'RFQ8465630', 0, 100, 44, '4400', '2025-03-05', '2025-03-05 12:22:54', NULL),
(16, 20, 55, 'RFQ8465630', 0, 100, 44, '4400', '2025-03-05', '2025-03-05 12:22:54', NULL),
(17, 21, 55, 'RFQ8465630', 0, 100, 44, '4400', '2025-03-05', '2025-03-05 12:24:22', NULL),
(18, 21, 55, 'RFQ8465630', 0, 100, 44, '4400', '2025-03-05', '2025-03-05 12:24:22', NULL),
(19, 22, 54, 'RFQ5146902', 0, 100, 444, '44400', '2025-03-05', '2025-03-05 12:26:15', NULL),
(20, 23, 57, 'RFQ7929484', 0, 100, 67, '6700', '2025-03-05', '2025-03-05 12:27:18', NULL),
(21, 24, 58, 'RFQ9874376', 0, 10, 10, '100', '2025-03-05', '2025-03-05 12:52:21', NULL),
(22, 24, 58, 'RFQ9874376', 0, 20, 20, '400', '2025-03-05', '2025-03-05 12:52:21', NULL),
(23, 25, 58, 'RFQ9874376', 0, 10, 0, '', '2025-03-05', '2025-03-05 12:54:38', NULL),
(24, 25, 58, 'RFQ9874376', 0, 20, 0, '', '2025-03-05', '2025-03-05 12:54:38', NULL),
(25, 26, 58, 'RFQ9874376', 0, 10, 20, '200', '2025-03-05', '2025-03-05 12:58:01', NULL),
(26, 26, 58, 'RFQ9874376', 0, 20, 20, '400', '2025-03-05', '2025-03-05 12:58:01', NULL),
(27, 27, 58, 'RFQ9874376', 0, 10, 0, '0', '2025-03-05', '2025-03-05 13:02:28', NULL),
(28, 27, 58, 'RFQ9874376', 0, 20, 0, '', '2025-03-05', '2025-03-05 13:02:28', NULL),
(29, 28, 58, 'RFQ9874376', 0, 10, 0, '', '2025-03-05', '2025-03-05 13:03:16', NULL),
(30, 28, 58, 'RFQ9874376', 0, 20, 0, '', '2025-03-05', '2025-03-05 13:03:16', NULL),
(31, 29, 58, 'RFQ9874376', 0, 10, 10, '100', '2025-03-05', '2025-03-05 13:04:55', NULL),
(32, 29, 58, 'RFQ9874376', 0, 20, 10, '200', '2025-03-05', '2025-03-05 13:04:55', NULL),
(33, 30, 57, 'RFQ7929484', 0, 100, 45, '4500', '2025-03-05', '2025-03-05 19:26:48', NULL),
(34, 31, 61, 'RFQ2907333', 0, 5, 6, '30', '2025-03-06', '2025-03-06 04:57:09', NULL),
(35, 31, 61, 'RFQ2907333', 0, 6, 8, '48', '2025-03-06', '2025-03-06 04:57:09', NULL),
(36, 32, 62, 'RFQ4662536', 1, 33, 2, '66', '2025-03-06', '2025-03-06 05:56:22', NULL),
(37, 32, 62, 'RFQ4662536', 2, 6, 2, '12', '2025-03-06', '2025-03-06 05:56:22', NULL),
(38, 33, 57, 'RFQ7929484', 1, 100, 50, '5000', '2025-03-06', '2025-03-06 11:31:19', NULL),
(39, 41, 64, 'RFQ1690604', 1, 10, 5, '50', '2025-03-12', '2025-03-12 08:13:26', NULL),
(40, 41, 64, 'RFQ1690604', 2, 20, 2, '40', '2025-03-12', '2025-03-12 08:13:26', NULL),
(41, 41, 64, 'RFQ1690604', 3, 5, 25, '125', '2025-03-12', '2025-03-12 08:13:26', NULL),
(42, 42, 65, 'RFQ9901303', 1, 10, 8, '80', '2025-03-12', '2025-03-12 09:26:02', NULL),
(43, 42, 65, 'RFQ9901303', 2, 5, 4, '20', '2025-03-12', '2025-03-12 09:26:02', NULL),
(44, 44, 66, 'RFQ3685049', 1, 2, 20, '40', '2025-03-12', '2025-03-12 17:31:23', NULL),
(45, 44, 66, 'RFQ3685049', 2, 4, 40, '160', '2025-03-12', '2025-03-12 17:31:23', NULL),
(46, 44, 66, 'RFQ3685049', 3, 5, 50, '250', '2025-03-12', '2025-03-12 17:31:23', NULL),
(47, 48, 1, 'RFQ1', 1, 2, 10, '20', '2025-03-14', '2025-03-14 08:07:25', NULL),
(48, 48, 1, 'RFQ1', 2, 5, 15, '75', '2025-03-14', '2025-03-14 08:07:25', NULL),
(49, 49, 67, 'RFQ4744184', 1, 100, 12, '1200', '2025-03-18', '2025-03-18 06:48:20', NULL),
(50, 49, 67, 'RFQ4744184', 2, 100, 12, '1200', '2025-03-18', '2025-03-18 06:48:20', NULL),
(51, 49, 67, 'RFQ4744184', 3, 12, 12, '144', '2025-03-18', '2025-03-18 06:48:20', NULL),
(52, 49, 67, 'RFQ4744184', 4, 123, 12, '1476', '2025-03-18', '2025-03-18 06:48:20', NULL),
(53, 50, 69, 'RFQ3500692', 5, 4, 12, '48', '2025-03-21', '2025-03-21 12:16:18', NULL),
(54, 50, 69, 'RFQ3500692', 6, 5, 23, '115', '2025-03-21', '2025-03-21 12:16:18', NULL),
(55, 51, 69, 'RFQ3500692', 5, 4, 12, '48', '2025-03-24', '2025-03-24 12:46:57', NULL),
(56, 51, 69, 'RFQ3500692', 6, 5, 24, '120', '2025-03-24', '2025-03-24 12:46:57', NULL),
(57, 52, 70, 'RFQ9746018', 7, 100, 20, '2000', '2025-03-25', '2025-03-25 06:06:07', NULL),
(58, 52, 70, 'RFQ9746018', 8, 200, 40, '8000', '2025-03-25', '2025-03-25 06:06:07', NULL),
(59, 53, 71, 'RFQ3783604', 8, 200, 40, '8000', '2025-03-25', '2025-03-25 08:31:40', NULL),
(60, 54, 72, 'RFQ3013637', 9, 100, 20, '2000', '2025-03-27', '2025-03-27 07:55:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rank`
--

CREATE TABLE `rank` (
  `id` bigint(11) NOT NULL,
  `rank_name` varchar(255) DEFAULT NULL,
  `rank_color` varchar(255) DEFAULT NULL,
  `direct_member` int(4) DEFAULT 0,
  `team_member` int(4) DEFAULT 0,
  `bonus_amount` varchar(255) DEFAULT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rank_log`
--

CREATE TABLE `rank_log` (
  `id` bigint(8) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `rank_id` varchar(255) DEFAULT NULL,
  `rank_name` varchar(255) DEFAULT NULL,
  `transaction_no` varchar(255) DEFAULT NULL COMMENT 'It''s contain credit_debit table transaction no of updated rank bonus',
  `updated_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rank_setting`
--

CREATE TABLE `rank_setting` (
  `id` int(11) NOT NULL,
  `rank_name` varchar(200) NOT NULL,
  `direct_member` varchar(10) NOT NULL,
  `team_member` varchar(10) NOT NULL,
  `bonus_amount` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rank_setting2`
--

CREATE TABLE `rank_setting2` (
  `id` int(11) NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  `rank_name` varchar(200) NOT NULL,
  `pdp` varchar(100) DEFAULT NULL,
  `cgv` varchar(100) DEFAULT NULL,
  `bonus_amount` varchar(100) NOT NULL,
  `create_date` varchar(50) DEFAULT NULL,
  `rnk_img` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `rank_setting2`
--

INSERT INTO `rank_setting2` (`id`, `code`, `rank_name`, `pdp`, `cgv`, `bonus_amount`, `create_date`, `rnk_img`) VALUES
(3, 'BGL1', 'Proprietor', '15', '15', '15000', '2018-06-18', '15293529531.png'),
(4, 'BGL2', 'Business Builder', '60', '500', '100000', '2018-06-18', '15293531441.png'),
(5, 'BGL3', 'Entrepreneur', '120', '1000', '250000', '2018-06-18', '15293532091.png'),
(6, 'BGL4', 'Executive', '180', '2000', '500000', '2018-06-18', '15293532801.png'),
(7, 'BGL5', 'Senior Executive', '250', '4000', '1000000', '2018-06-18', '15293533871.png'),
(8, 'BGL6', 'Chief Executive', '350', '7500', '2000000', '2018-06-18', '15293534701.png'),
(9, 'BGL7', 'Business Leader', '450', '14000', '4000000', '2018-06-18', '15293535051.png'),
(10, 'BGL8', 'Buisness Mentor', '600', '27000', '8000000', '2018-06-18', '15293535681.png'),
(11, 'BGL9', 'Super Mentor', '850', '52000', '15000000', '2018-06-18', '15293535991.png'),
(12, 'BGL10', 'Master Mentor', '1200', '100000', '25000000', '2018-06-18', '15293536351.png');

-- --------------------------------------------------------

--
-- Table structure for table `recharge_dataplan`
--

CREATE TABLE `recharge_dataplan` (
  `id` int(11) NOT NULL,
  `mobile_network` varchar(50) NOT NULL,
  `plan_detail` varchar(500) NOT NULL,
  `amount` varchar(50) NOT NULL,
  `charge_amount` varchar(50) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `recharge_dataplan`
--

INSERT INTO `recharge_dataplan` (`id`, `mobile_network`, `plan_detail`, `amount`, `charge_amount`, `status`) VALUES
(1, '01', '1000 for 1GB', '330', '1000', 0),
(2, '01', '1500.01 for 1GB Direct', '96', '1500.01', 0),
(3, '01', '2000 for 2GB', '660', '2000', 0),
(4, '01', '3500.01 for 2.5GB', '192', '3500.01', 0),
(5, '01', '5000 for 5GB', '1650', '5000', 0),
(6, '01', '10000.01 for 10GB', '288', '10000.01', 0),
(7, '01', '22000.01 for 22GB Direct', '288', '22000.01', 0),
(8, '02', '1600.01 for 2GB', '970', '1600.01', 0),
(9, '02', '3750.01 for 4.5GB', '1940', '3750.01', 0),
(10, '02', '5000.01 for 7.2GB', '2425', '5000.01', 0),
(11, '02', '6000.01 for 8.75GB', '2910', '6000.01', 0),
(12, '02', '8000.01 for 12.5GB', '3880', '8000.01', 0),
(13, '02', '12000.01 for 15.6GB', '4850', '12000.01', 0),
(14, '02', '16000.01 for 25GB', '7760', '16000.01', 0),
(15, '02', '30000.01 for 52.5GB', '14550', '30000.01', 0),
(16, '02', '45000.01 for 62.5GB', '17460', '45000.01', 0),
(17, '03', '500.01 for 500MB', '477', '500.01', 0),
(18, '03', '1000.01 for 1GB', '955', '1000.01', 0),
(19, '03', '1500.01 for 1.5GB', '1146', '1500.01', 0),
(20, '03', '2500.01 for 2.5GB', '1432', '2500.01', 0),
(21, '03', '4000.01 for 4GB', '1910', '4000.01', 0),
(22, '03', '5500.01 for 5.5GB', '3820', '5500.01', 0),
(23, '03', '11500.01 for 11.5GB ', '4775', '11500.01', 0),
(24, '03', '15000.01 for 15GB', '9550', '15000.01', 0),
(25, '03', '27000.01 for 27GB', '14325', '27000.01', 0),
(26, '04', '1500.01 for 1.5GB', '47.75', '1500.01', 0),
(27, '04', '3500.01 for 3.5GB', '95.5', '3500.01', 0),
(28, '04', '7000.01 for 7GB', '286.5', '7000.01', 0),
(29, '04', '10000.01 for 10GB', '4750', '10000.01', 0),
(30, '04', '16000.01 for 16GB', '7600', '16000.01', 0),
(31, '04', '22000.01 for 22GB', '9500', '22000.01', 0);

-- --------------------------------------------------------

--
-- Table structure for table `recharge_vtu`
--

CREATE TABLE `recharge_vtu` (
  `id` int(11) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `subtype` varchar(50) DEFAULT NULL,
  `amount` varchar(50) NOT NULL,
  `mobileno` varchar(50) DEFAULT NULL,
  `rechage_data` longtext NOT NULL,
  `orderid` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `remark` varchar(200) NOT NULL,
  `status_code` varchar(50) NOT NULL,
  `rechage_date` date NOT NULL,
  `recharge_datetime` datetime NOT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `aadharno` varchar(50) NOT NULL,
  `pancardno` varchar(50) NOT NULL,
  `adharfile` text NOT NULL,
  `pancardfile` text NOT NULL,
  `phoneno` varchar(50) NOT NULL,
  `bank_name` varchar(100) NOT NULL,
  `account_no` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registration_method`
--

CREATE TABLE `registration_method` (
  `id` int(3) NOT NULL,
  `reg_method` varchar(255) NOT NULL,
  `short_name` varchar(255) DEFAULT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '0' COMMENT '''1''=>Activated method, ''0''=>Deactivated method'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `registration_method`
--

INSERT INTO `registration_method` (`id`, `reg_method`, `short_name`, `status`) VALUES
(1, 'E-Wallet', 'e-wallet', ''),
(2, 'E-Pin', 'e-pin', ''),
(3, 'Bank Wire', 'bank-wire', '1'),
(4, 'Paystack', 'Paystack', '');

-- --------------------------------------------------------

--
-- Table structure for table `reg_stage1`
--

CREATE TABLE `reg_stage1` (
  `id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `nom_id` varchar(100) NOT NULL,
  `plan_type` varchar(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `final_status` int(11) NOT NULL DEFAULT 0,
  `nom_leg_position` varchar(20) NOT NULL,
  `direct_member_leg_position` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `reg_stage1`
--

INSERT INTO `reg_stage1` (`id`, `user_id`, `nom_id`, `plan_type`, `status`, `final_status`, `nom_leg_position`, `direct_member_leg_position`) VALUES
(1, '123456', 'cmp', 'cmp', 1, 2, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `reg_stage2`
--

CREATE TABLE `reg_stage2` (
  `id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `nom_id` varchar(100) NOT NULL,
  `plan_type` varchar(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `final_status` int(11) NOT NULL DEFAULT 0,
  `nom_leg_position` varchar(20) NOT NULL,
  `direct_member_leg_position` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `reg_stage2`
--

INSERT INTO `reg_stage2` (`id`, `user_id`, `nom_id`, `plan_type`, `status`, `final_status`, `nom_leg_position`, `direct_member_leg_position`) VALUES
(1, '123456', 'cmp', 'cmp', 1, 2, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `reg_stage3`
--

CREATE TABLE `reg_stage3` (
  `id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `nom_id` varchar(100) NOT NULL,
  `plan_type` varchar(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `final_status` int(11) NOT NULL DEFAULT 0,
  `nom_leg_position` varchar(20) NOT NULL,
  `direct_member_leg_position` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `reg_stage3`
--

INSERT INTO `reg_stage3` (`id`, `user_id`, `nom_id`, `plan_type`, `status`, `final_status`, `nom_leg_position`, `direct_member_leg_position`) VALUES
(1, '123456', 'cmp', 'cmp', 1, 2, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `reg_stage4`
--

CREATE TABLE `reg_stage4` (
  `id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `nom_id` varchar(100) NOT NULL,
  `plan_type` varchar(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `final_status` int(11) NOT NULL DEFAULT 0,
  `nom_leg_position` varchar(20) NOT NULL,
  `direct_member_leg_position` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `reg_stage4`
--

INSERT INTO `reg_stage4` (`id`, `user_id`, `nom_id`, `plan_type`, `status`, `final_status`, `nom_leg_position`, `direct_member_leg_position`) VALUES
(1, '123456', 'cmp', 'cmp', 0, 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `reg_stage4_old`
--

CREATE TABLE `reg_stage4_old` (
  `id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `nom_id` varchar(100) NOT NULL,
  `plan_type` varchar(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `final_status` int(11) NOT NULL DEFAULT 0,
  `nom_leg_position` varchar(20) NOT NULL,
  `direct_member_leg_position` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reg_stage5`
--

CREATE TABLE `reg_stage5` (
  `id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `nom_id` varchar(100) NOT NULL,
  `plan_type` varchar(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `final_status` int(11) NOT NULL DEFAULT 0,
  `nom_leg_position` varchar(20) NOT NULL,
  `direct_member_leg_position` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `reg_stage5`
--

INSERT INTO `reg_stage5` (`id`, `user_id`, `nom_id`, `plan_type`, `status`, `final_status`, `nom_leg_position`, `direct_member_leg_position`) VALUES
(1, '123456', 'cmp', 'cmp', 0, 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `rfq`
--

CREATE TABLE `rfq` (
  `id` int(11) NOT NULL,
  `rfq_code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `country_code` varchar(50) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `company_name` varchar(25) DEFAULT NULL,
  `manufacturing_process_id` int(11) DEFAULT NULL,
  `is_design_file` int(1) DEFAULT 0,
  `comments` text DEFAULT NULL,
  `add_by` int(11) DEFAULT NULL COMMENT 'consumer_id',
  `add_date` date DEFAULT NULL,
  `assign_to` varchar(255) DEFAULT NULL,
  `assign_by` varchar(255) DEFAULT NULL COMMENT 'admin or supplier',
  `assign_to_id` int(11) DEFAULT NULL,
  `assign_by_id` int(11) DEFAULT NULL,
  `assign_date` date DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '0 assign to admin, 1 assign to supplier, 2 assign to admin by supplier, 3 assign to consumer',
  `ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `rfq`
--

INSERT INTO `rfq` (`id`, `rfq_code`, `name`, `email`, `country_code`, `mobile`, `company_name`, `manufacturing_process_id`, `is_design_file`, `comments`, `add_by`, `add_date`, `assign_to`, `assign_by`, `assign_to_id`, `assign_by_id`, `assign_date`, `status`, `ts`) VALUES
(1, 'RFQ1', 'Subhash', 'subpal2009@gmail.com', '+91', '9990694126', 'Test Company', 1, 1, 'Tetgashgdjaskjd asjdjaskda sdjasjda', 1, '2025-01-25', 'supplier', 'admin', NULL, 29, '2025-02-02', 1, '2025-01-25 09:25:09'),
(2, 'RFQ2', 'Subhash', 'subpal2009@gmail.com', '+91', '9990694126', 'Test Company', 1, 1, 'Tetgashgdjaskjd asjdjaskda sdjasjda', 1, '2025-01-25', 'supplier', NULL, NULL, 29, '2025-01-28', 1, '2025-01-25 09:25:26'),
(3, 'RFQ3', 'Subhash ashdahs', 'subpal2019@gmail.com', '+91', '9990694026', 'Tes ashdgha hagsdgas dasd', 2, 1, 'Tetgashgdjaskjd asjdjaskda sdjasjda', 1, '2025-01-25', NULL, NULL, NULL, NULL, NULL, 0, '2025-01-25 09:26:18'),
(4, 'RFQ4', 'Subhash ashdahs', 'subpal2019@gmail.com', '+91', '9990694026', 'Tes ashdgha hagsdgas dasd', 2, 1, 'Tetgashgdjaskjd asjdjaskda sdjasjda', 1, '2025-01-25', NULL, NULL, NULL, NULL, NULL, 0, '2025-01-25 09:26:33'),
(5, 'RFQ5', 'Subhash ashdahs', 'subpal2019@gmail.com', '+91', '9990694026', 'Tes ashdgha hagsdgas dasd', 2, 1, 'Tetgashgdjaskjd asjdjaskda sdjasjda', 1, '2025-01-25', NULL, NULL, NULL, NULL, NULL, 0, '2025-01-25 09:28:44'),
(6, 'RFQ6', 'ddd', 'ddd@dde.com', '+91', '09205055084', 'sseddd', 6, 0, 'ddessess', 12, '2025-01-25', NULL, NULL, NULL, NULL, NULL, 0, '2025-01-25 16:20:56'),
(7, 'RFQ7', 'ddd', 'ddd1@dde.com', '+91', '09205055084', 'sseddd', 6, 0, 'dessesss', 12, '2025-01-25', 'supplier', NULL, NULL, 29, '2025-01-28', 1, '2025-01-25 16:53:37'),
(8, 'RFQ8', 'DDESS', 'dess@dev.com', '+91', '09205055084', 'sseddd', 7, 0, 'dessess', 12, '2025-01-25', NULL, NULL, NULL, NULL, NULL, 0, '2025-01-25 16:58:25'),
(9, 'RFQ9', 'fes', 'desws@dev.com', '+91', '09205055084', 'sseddd', 6, 0, 'dessesss', 12, '2025-01-25', 'supplier', NULL, NULL, 29, '2025-01-28', 1, '2025-01-25 17:00:17'),
(10, 'RFQ10', 'fes', 'desws@dev.com', '+91', '09205055084', 'sseddd', 6, 0, 'dessesss', 12, '2025-01-25', 'supplier', NULL, NULL, 29, '2025-01-28', 1, '2025-01-25 17:00:18'),
(11, 'RFQ11', 'fes', 'desws@dev.com', '+91', '09205055084', 'sseddd', 6, 0, 'dessesss', 12, '2025-01-25', NULL, NULL, NULL, NULL, NULL, 0, '2025-01-25 17:00:28'),
(12, 'RFQ12', 'RFQ1', 'rf@dev.com', '+91', '09205055084', 'sseddd', 1, 0, 'dessess', 12, '2025-01-25', NULL, NULL, NULL, NULL, NULL, 0, '2025-01-25 17:06:35'),
(13, 'RFQ13', 'RFQ1', 'rf@dev.com', '+91', '09205055084', 'sseddd', 1, 1, 'hyu', 12, '2025-01-25', 'supplier', 'admin', NULL, 29, '2025-02-01', 1, '2025-01-25 17:45:02'),
(14, 'RFQ14', 'Test RFQ', 'subpal2009@gmail.com', '+91', '01234567890', 'jkkj', 7, 1, 'Test', 1, '2025-01-26', 'supplier', NULL, NULL, 29, '2025-01-28', 1, '2025-01-26 04:30:49'),
(15, 'RFQ15', 'Anurag tripathi', 'development@dimensionangle.com', '+880', '09540452224', 'Dimension Alge', 1, 1, 'Test', 25, '2025-01-27', NULL, NULL, NULL, NULL, NULL, 0, '2025-01-27 06:10:56'),
(16, 'RFQ3219067', 'Subhash', 'subpal2009@gmail.com', '+54', '01234567890', 'jkkj', 1, 0, 'sjdhas', 1, '2025-01-27', NULL, NULL, NULL, NULL, NULL, 0, '2025-01-27 06:26:19'),
(17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-01-27', NULL, NULL, NULL, NULL, NULL, 0, '2025-01-27 06:34:37'),
(18, 'RFQ1637215', 'Rajesh', 'rrpy@emml@dev.com', '+91', '9205055084', 'ssqw', 1, 0, 'CNC machining.', 12, '2025-01-27', NULL, NULL, NULL, NULL, NULL, 0, '2025-01-27 09:33:43'),
(19, 'RFQ2759935', 'dfasdf', 'ddd@dev.com', '+91', '9205055084', 'sseddd', 1, 0, 'dessesss', 12, '2025-01-27', NULL, NULL, NULL, NULL, NULL, 0, '2025-01-27 09:49:17'),
(20, 'RFQ8116701', 'Roger', 'rgr@dev.com', '+93', '09205055084', 'SSED', 6, 0, 'aaee', 12, '2025-01-27', 'supplier', 'admin', NULL, 29, '2025-02-01', 1, '2025-01-27 10:04:20'),
(21, 'RFQ8085347', 'Rajesh', 'rrj@devc.com', '+213', '9205055084', 'GNC', 1, 0, 'SSESSS', 12, '2025-01-27', NULL, NULL, NULL, NULL, NULL, 0, '2025-01-27 10:35:43'),
(22, 'RFQ1411925', 'Rajesh', 'rrj@devc.com', '+213', '9205055084', 'GNC', 6, 0, 'dessess', 12, '2025-01-27', 'supplier', NULL, NULL, 29, '2025-01-28', 1, '2025-01-27 10:42:30'),
(23, 'RFQ3290323', 'ddd', 'ddd1@dde.com', '+213', '09205055084', 'sseddd', 6, 0, 'dessesss', 12, '2025-01-27', 'supplier', 'admin', NULL, 29, '2025-02-01', 1, '2025-01-27 10:44:38'),
(24, 'RFQ3950169', 'ddd', 'ddd1@dde.com', '+213', '09205055084', 'sseddd', 1, 0, 'dessesssss', 12, '2025-01-27', NULL, NULL, NULL, NULL, NULL, 0, '2025-01-27 10:45:21'),
(25, 'RFQ2059170', 'Rajj', 'eert@dev.com', '+355', '9205055084', 'ssqw', 1, 0, 'hyu', 12, '2025-01-27', 'supplier', 'admin', NULL, 29, '2025-02-03', 1, '2025-01-27 10:50:54'),
(26, 'RFQ8936648', 'Rajj', 'eert@dev.com', '+376', '9205055084', 'ssqw', 7, 0, 'dessxx', 12, '2025-01-27', NULL, NULL, NULL, NULL, NULL, 0, '2025-01-27 11:00:46'),
(27, 'RFQ5196973', 'reess', 'rose@dev.com', '+355', '9205055084', 'ssqw', 1, 0, 'dessess', 12, '2025-01-27', NULL, NULL, NULL, NULL, NULL, 0, '2025-01-27 11:04:15'),
(28, 'RFQ7133013', 'reess', 'rose@dev.com', '+54', '9205055084', 'ssqw', 7, 0, 'thisis comments', 12, '2025-01-27', NULL, NULL, NULL, NULL, NULL, 0, '2025-01-27 11:06:38'),
(29, 'RFQ8560615', 'Rajesh', 'rrh@dev.com', '+213', '9205055084', 'sseddd', 6, 0, 'dessesssss', 12, '2025-01-27', 'supplier', 'admin', NULL, 29, '2025-02-01', 1, '2025-01-27 11:09:48'),
(30, 'RFQ7287392', 'Sss', 'sss@dev.com', '+355', '9205055084', 'ssqw', 3, 0, 'dessess', 12, '2025-01-27', 'supplier', NULL, NULL, 29, '2025-01-28', 1, '2025-01-27 11:12:36'),
(31, 'RFQ5501555', 'RFQ1', 'rfq@dev.com', '+376', '9205055084', 'SSED', 1, 0, 'dessess', 12, '2025-01-27', 'supplier', NULL, NULL, 29, '2025-01-28', 1, '2025-01-27 11:27:24'),
(32, 'RFQ3256552', 'Rajesh', 'rrpy@dev.com', '+244', 'e22', 'SSED', 7, 0, 'sesseeeees', 12, '2025-01-27', NULL, NULL, NULL, NULL, NULL, 0, '2025-01-27 11:29:47'),
(33, 'RFQ4711993', 'Subhash', 'subpal2009@gmail.com', '+43', '01234567890', 'jkkj', 1, 1, 'sakj', 1, '2025-01-27', NULL, NULL, NULL, NULL, NULL, 0, '2025-01-27 13:44:57'),
(34, 'RFQ4756208', 'Subhash ', 'subhash@gmail.com', '+61', '9205055084', 'SSSS', 5, 0, 'some comments', 12, '2025-01-27', NULL, NULL, NULL, NULL, NULL, 0, '2025-01-27 14:21:36'),
(35, 'RFQ1844561', 'Sub', 'subpal2009@gmail.com', '+54', '01234567890', 'jkkj', 1, 0, 'asdkjkjasd', 2, '2025-01-27', NULL, NULL, NULL, NULL, NULL, 0, '2025-01-27 14:24:07'),
(36, 'RFQ8855530', 'Anurag tripathi', 'development@dimensionangle.com', '+355', '09540452224', 'Dimension Alge', 5, 0, 'Testing', 25, '2025-01-28', 'supplier', NULL, NULL, 29, '2025-01-28', 1, '2025-01-28 07:48:32'),
(37, 'RFQ3160039', 'asasd', 'ripibo7456@rykone.com', '+971', '1213431234', 'asddfs', 1, 1, 'aefeads', 30, '2025-01-29', 'supplier', 'admin', NULL, 29, '2025-02-03', 1, '2025-01-29 05:15:40'),
(38, 'RFQ7047686', 'mallikarjun', 'mohoni1927@rykone.com', '+91', '01234567892', 'sdfgh', 1, 1, 'erfdds', 32, '2025-02-04', 'supplier', 'admin', NULL, 29, '2025-02-04', 1, '2025-02-04 05:10:15'),
(39, 'RFQ7205666', 'malllikajrun katte ', 'ripibo7456@rykone.com', '+91', '01234567891', 'asfdasd', 1, 1, 'swaedas', 30, '2025-02-05', 'supplier', 'admin', NULL, 29, '2025-02-05', 1, '2025-02-05 08:14:54'),
(40, 'RFQ1934822', 'mallikarjun', 'development2@dimensionangle.com', '+91', '1234567891', 'abcd', 1, 1, 'aaaaaaaaaaa', 25, '2025-02-17', 'supplier', 'admin', NULL, 29, '2025-02-17', 1, '2025-02-17 09:35:24'),
(41, 'RFQ6173068', 'Ram Singh', 'ram@gmail.com', '+91', '75038868777', 'Test', 1, 1, 'Test', 1, '2025-02-24', NULL, NULL, NULL, NULL, NULL, 0, '2025-02-24 09:16:13'),
(42, 'RFQ4243919', 'Ram Singh', 'ram@gmail.com', '+91', '75038868777', 'Test', 1, 1, 'Test', 1, '2025-02-24', NULL, NULL, NULL, NULL, NULL, 0, '2025-02-24 09:27:10'),
(43, 'RFQ3874928', 'Ram Singh', 'ram@gmail.com', '+91', '75038868777', 'Test', 1, 1, 'Test', 1, '2025-02-24', NULL, NULL, NULL, NULL, NULL, 0, '2025-02-24 09:27:50'),
(44, 'RFQ6442770', 'Deep Singh', 'deependra12@gmail.com', '+91', '7503886800', 'Test Company', 4, 1, 'Casting - product 1 - 2 quantity', 1, '2025-02-24', 'supplier', 'admin', NULL, 29, '2025-02-24', 1, '2025-02-24 09:41:10'),
(45, 'RFQ4708733', 'Deep Singh 2', 'deependra03@bnma.us', '+91', '7503886804', 'Test 2', 16, 1, 'Deep Singh 2 - Electronics and PCB', 1, '2025-02-24', 'supplier', 'admin', NULL, 29, '2025-02-24', 1, '2025-02-24 12:46:42'),
(46, 'RFQ7491978', 'Organization 12', 'singhdeependra0305@gmail.com', '+91', '75038868777', 'Test Company', 13, 1, 'Test Company - Aluminum Fabrication', 1, '2025-02-24', NULL, NULL, NULL, NULL, NULL, 0, '2025-02-24 12:51:12'),
(47, 'RFQ1707353', 'Subhash ashdahs', 'subpal2019@gmail.com', '+91', '9990694026', 'Tes ashdgha hagsdgas dasd', 2, 1, 'Tetgashgdjaskjd asjdjaskda sdjasjda', 1, '2025-02-24', NULL, NULL, NULL, NULL, NULL, 0, '2025-02-24 12:53:18'),
(48, 'RFQ3402419', 'Subhash ashdahs', 'subpal2019@gmail.com', '+91', '9990694026', 'Tes ashdgha hagsdgas dasd', 2, 1, 'Tetgashgdjaskjd asjdjaskda sdjasjda', 1, '2025-02-24', NULL, NULL, NULL, NULL, NULL, 0, '2025-02-24 12:54:03'),
(49, 'RFQ7242294', 'Subhash ashdahs', 'subpal2019@gmail.com', '+91', '9990694026', 'Tes ashdgha hagsdgas dasd', 2, 1, 'Tetgashgdjaskjd asjdjaskda sdjasjda', 1, '2025-02-24', NULL, NULL, NULL, NULL, NULL, 0, '2025-02-24 12:54:23'),
(50, 'RFQ2308713', 'Subhash ashdahs', 'subpal2019@gmail.com', '+91', '9990694026', 'Tes ashdgha hagsdgas dasd', 2, 1, 'Tetgashgdjaskjd asjdjaskda sdjasjda', 1, '2025-02-24', NULL, NULL, NULL, NULL, NULL, 0, '2025-02-24 12:54:55'),
(51, 'RFQ4054531', 'Organization 13', 'singhdeependra0663@gmail.com', '+91', '7503886800', 'Test Company', 7, 1, 'Test Fabrication', 1, '2025-02-24', 'supplier', 'admin', NULL, 29, '2025-02-24', 1, '2025-02-24 12:56:26'),
(52, 'RFQ1794943', 'mallikarjun', 'development2@dimensionangle.com', '+91', '2123456789', 'abcd', 13, 1, 'as per drawing ', 25, '2025-02-25', 'supplier', 'admin', NULL, 29, '2025-02-27', 1, '2025-02-25 05:13:44'),
(53, 'RFQ6673122', 'Test Post 12676', 'singhdeependra0603@gmail.com', '+91', '75038868777', 'Test Company 2', 6, 1, 'Test  Test', 1, '2025-02-26', 'supplier', 'admin', NULL, 29, '2025-02-27', 1, '2025-02-26 12:33:32'),
(54, 'RFQ5146902', 'malllikarjun', 'development@dimensionangle.com', '+91', '2123456789', 'abcd', 13, 1, 'i need this delivery in 2 weeks', 25, '2025-02-27', 'supplier', 'admin', NULL, 29, '2025-02-27', 1, '2025-02-27 05:15:02'),
(55, 'RFQ8465630', 'mallikarjun ', 'development@dimensionangle.com', '+91', '2123456789', 'abcd', 13, 1, 'asad', 25, '2025-02-27', 'supplier', 'admin', NULL, 24, '2025-02-27', 1, '2025-02-27 11:27:08'),
(56, 'RFQ7504060', 'mallikarjun1', 'development@dimensionangle.com', '+91', '2123456789', 'abcd', 13, 1, 'aaa', 25, '2025-02-27', 'supplier', 'admin', NULL, 29, '2025-02-27', 1, '2025-02-27 11:30:18'),
(57, 'RFQ7929484', '**************************', '*****************************', '+971', '**************', '*************************', 1, 1, 'Note  - 1. Delivery needed in 10 days\n             2. Allocated price - 147.5 AED \n', 25, '2025-03-01', NULL, NULL, NULL, NULL, NULL, 0, '2025-03-01 09:50:36'),
(58, 'RFQ9874376', 'Sub', 'subpal2009@gmail.com', '+244', '01234567890', 'jkkj', 13, 1, 'Test', 1, '2025-03-04', 'supplier', 'admin', NULL, 29, '2025-03-05', 1, '2025-03-04 04:13:54'),
(59, 'RFQ7105335', 'Test RFQ-NO Design', 'rajesh-dddd@dev.com', '+91', '75038868777', 'Test Company', 6, 0, 'Test CompanyTest CompanyTest CompanyTest Company', 1, '2025-03-05', NULL, NULL, NULL, NULL, NULL, 0, '2025-03-05 18:50:50'),
(60, 'RFQ1874787', 'Test RFQ-NO Design 6March', 'singhdeependra0306@gmail.com', '+91', '75038868777', 'Test Company', 6, 0, 'TEST', 1, '2025-03-05', NULL, NULL, NULL, NULL, NULL, 0, '2025-03-05 18:51:51'),
(61, 'RFQ2907333', 'abhishek', 'abhi@gmail.com', '+61', '64654654', 'test', 12, 1, 'gfgf', 5, '2025-03-06', 'supplier', 'admin', NULL, 29, '2025-03-06', 1, '2025-03-06 04:49:25'),
(62, 'RFQ4662536', 'abhi', 'abhi@gmail.com', '+213', '32343', 'test', 4, 1, 'sfsdf', 5, '2025-03-06', 'supplier', 'admin', NULL, 29, '2025-03-06', 1, '2025-03-06 05:52:57'),
(63, 'RFQ9246070', 'Anurag Tripathi', 'development@dimensionangle.com', '+355', '09540452224', 'Dimensiona Angle Technolo', 4, 0, 'dddddd', 25, '2025-03-06', NULL, NULL, NULL, NULL, NULL, 0, '2025-03-06 16:36:29'),
(64, 'RFQ1690604', 'Subhash', 'subpal2009@gmail.com', '+61', '01234567890', 'jkkj', 13, 1, 'Ttt', 51, '2025-03-12', 'supplier', 'admin', NULL, 29, '2025-03-12', 1, '2025-03-12 08:08:04'),
(65, 'RFQ9901303', 'Subhash', 'subpal2009@gmail.com', '+61', '01234567890', 'jkkj', 13, 1, 'Comment will be here', 51, '2025-03-12', 'supplier', 'admin', NULL, 29, '2025-03-12', 1, '2025-03-12 09:22:34'),
(66, 'RFQ3685049', 'CNC TEST RFQ', 'deependra004@bnma.us', '+54', '75038868777', 'Test Company', 1, 1, 'CNC TEST RFQCNC TEST RFQCNC TEST RFQCNC TEST RFQ', 1, '2025-03-12', 'supplier', 'admin', NULL, 29, '2025-03-12', 1, '2025-03-12 17:27:26'),
(67, 'RFQ4744184', 'SpintekGulf', 'development2@dimensionangle.com', '+91', '1234567891', 'Spintek Gulf Co LLC ', 1, 1, 'part expected delivery  - 2 weeks \npart estimated cost cap - 124 AED\n', 25, '2025-03-18', 'supplier', 'admin', NULL, 29, '2025-03-18', 1, '2025-03-18 05:42:53'),
(68, 'RFQ2450551', 'Subhash', 'subpal2019@gmail.com', '+91', '01234567891', 'Test', 13, 1, 'Test of profile and product name', 1, '2025-03-20', NULL, NULL, NULL, NULL, NULL, 0, '2025-03-20 05:57:30'),
(69, 'RFQ3500692', 'Subhash', 'subpal2019@gmail.com', '+91', '01234567890', 'Test', 13, 1, 'ASAP', 1, '2025-03-21', NULL, NULL, NULL, NULL, NULL, 0, '2025-03-21 12:10:22'),
(70, 'RFQ9746018', 'Anurag tripathi', 'development2@dimensionangle.com', '+91', '9540452224', 'Dim', 13, 1, 'need delivery in 15 days ', 25, '2025-03-25', 'supplier', 'admin', NULL, 29, '2025-03-25', 1, '2025-03-25 05:48:24'),
(71, 'RFQ3783604', 'Anurag tripathi', 'development2@dimensionangle.com', '+91', '9540452224', 'Dim', 1, 1, 'comments\n', 25, '2025-03-25', 'supplier', 'admin', NULL, 29, '2025-03-25', 1, '2025-03-25 08:21:50'),
(72, 'RFQ3013637', 'Anurag tripathi', 'development2@dimensionangle.com', '+91', '9540452224', 'Dim', 1, 1, 'as per drawing', 25, '2025-03-27', 'supplier', 'admin', NULL, 29, '2025-03-27', 1, '2025-03-27 07:49:39');

-- --------------------------------------------------------

--
-- Table structure for table `rfq_products`
--

CREATE TABLE `rfq_products` (
  `id` int(11) NOT NULL,
  `rfq_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `qty` varchar(255) DEFAULT NULL,
  `files` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `rfq_products`
--

INSERT INTO `rfq_products` (`id`, `rfq_id`, `product_id`, `qty`, `files`) VALUES
(9, 50, 2, '4', '[\"\\/company_doc\\/weekend.png_1740401402_0.png\"]'),
(10, 50, 4, '6', '[\"\\/company_doc\\/Screenshot_20240528-141142.jpg_1740401414_0.jpg\"]'),
(11, 51, 3, '5', '[\"\\/company_doc\\/weekend.png_1740401753_0.png\"]'),
(12, 51, 4, '6', '[\"\\/company_doc\\/weekend.png_1740401767_0.png\"]'),
(13, 52, 1, '10', '[\"\\/company_doc\\/Top Clamp.step_1740460352_0.step\"]'),
(14, 52, 2, '1000', '[\"\\/company_doc\\/base5.step_1740460371_0.step\"]'),
(15, 52, 3, '20000', '[\"\\/company_doc\\/blockwithintricate.step_1740460406_0.step\"]'),
(16, 53, 1, '2', '[\"\\/company_doc\\/weekend.png_1740573209_0.png\"]'),
(17, 54, 1, '100', '[\"\\/company_doc\\/screw.step_1740633278_0.step\"]'),
(18, 55, 1, '100', '[\"\\/company_doc\\/nut.step_1740655607_0.step\"]'),
(19, 55, 2, '100', '[\"\\/company_doc\\/screw.step_1740655620_0.step\"]'),
(20, 56, 1, '10', '[\"\\/company_doc\\/nut.step_1740655808_0.step\"]'),
(21, 56, 2, '1000', '[\"\\/company_doc\\/screw.step_1740655810_0.step\"]'),
(22, 57, 1, '100', '[\"\\/company_doc\\/nut.step_1740822394_0.step\"]'),
(23, 58, 1, '10', '[\"\\/company_doc\\/logo (13).png_1741061616_0.png\"]'),
(24, 58, 2, '20', '[\"\\/company_doc\\/logo (14).png_1741061630_0.png\"]'),
(25, 61, 1, '5', '[\"\\/company_doc\\/Screenshot 2023-09-14 102353.png_1741236543_0.png\"]'),
(26, 61, 2, '6', '[\"\\/company_doc\\/Screenshot 2023-09-14 102353.png_1741236556_0.png\"]'),
(27, 62, 1, '33', '[\"\\/company_doc\\/Screenshot 2023-09-14 102353.png_1741240358_0.png\"]'),
(28, 62, 2, '6', '[]'),
(29, 64, 1, '10', '[]'),
(30, 64, 2, '20', '[]'),
(31, 64, 3, '5', '[]'),
(32, 65, 1, '10', '[]'),
(33, 65, 2, '5', '[]'),
(34, 66, 1, '2', '[]'),
(35, 66, 2, '4', '[]'),
(36, 66, 3, '5', '[]'),
(37, 67, 1, '100', '[\"\\/company_doc\\/SHAFT.stp_1742276247_0.stp\"]'),
(38, 67, 2, '100', '[\"\\/company_doc\\/SHAFT.stp_1742276263_0.stp\"]'),
(39, 67, 3, '12', '[\"\\/company_doc\\/SHAFT.stp_1742276278_0.stp\"]'),
(40, 67, 4, '123', '[\"\\/company_doc\\/SHAFT.stp_1742276288_0.stp\"]'),
(41, 68, 5, '10', '[]'),
(42, 68, 6, '15', '[]'),
(43, 69, 5, '4', '[]'),
(44, 69, 6, '5', '[]'),
(45, 70, 7, '100', '[\"\\/company_doc\\/LH.stp_1742881672_0.stp\"]'),
(46, 70, 8, '200', '[\"\\/company_doc\\/SHAFT.stp_1742881688_0.stp\"]'),
(47, 71, 8, '200', '[\"\\/company_doc\\/SHAFT.stp_1742890897_0.stp\"]'),
(48, 72, 9, '100', '[\"\\/company_doc\\/camlock.stp_1743061766_0.stp\"]');

-- --------------------------------------------------------

--
-- Table structure for table `stage_label_meta`
--

CREATE TABLE `stage_label_meta` (
  `id` bigint(10) NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL COMMENT 'label key will be fixed o consistent',
  `meta_value` varchar(255) DEFAULT NULL COMMENT 'label value will be changeable by admin'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `stage_label_meta`
--

INSERT INTO `stage_label_meta` (`id`, `meta_key`, `meta_value`) VALUES
(1, 'feeder_stage', 'Feeder Stage'),
(2, 'stage_1', 'Stage 1'),
(3, 'stage_2', 'Stage 2'),
(4, 'stage_3', 'Stage 3'),
(5, 'stage_4', 'Stage 4'),
(6, 'stage_5', 'Stage 5'),
(7, 'stage_6', 'Stage 6');

-- --------------------------------------------------------

--
-- Table structure for table `student_details`
--

CREATE TABLE `student_details` (
  `id` int(11) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `about_us` text NOT NULL,
  `rollno` varchar(20) DEFAULT NULL,
  `bloodgroup` varchar(20) NOT NULL,
  `religion` varchar(20) NOT NULL,
  `class` varchar(20) NOT NULL,
  `section` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_fees`
--

CREATE TABLE `student_fees` (
  `id` int(11) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `fee_amount` varchar(255) NOT NULL,
  `fee_date` varchar(50) NOT NULL,
  `payment_date` date NOT NULL,
  `status` int(1) NOT NULL,
  `payment_method` varchar(20) NOT NULL,
  `pay_request` text NOT NULL,
  `pay_response` text NOT NULL,
  `order_id` varchar(50) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `student_fees`
--

INSERT INTO `student_fees` (`id`, `student_id`, `fee_amount`, `fee_date`, `payment_date`, `status`, `payment_method`, `pay_request`, `pay_response`, `order_id`, `ts`) VALUES
(1, '5008836', '1000', '2023-01-10', '2023-11-09', 1, 'cash', '', '', 'Fees536074', '2023-11-09 04:33:28'),
(2, '5008836', '1000', '2023-01-10', '2023-11-09', 1, 'cash', '', '', 'Fees807005', '2023-11-09 04:35:37'),
(3, '5008836', '1000', '2023-01-10', '2023-11-09', 1, 'cash', '', '', 'Fees399012', '2023-11-09 04:36:38'),
(4, '5008836', '1000', '01/09/2023', '2023-11-09', 1, 'cash', '', '', 'Fees498436', '2023-11-09 04:37:40'),
(5, '5008836', '1000', '2023-07-01', '2023-11-09', 1, 'cash', '', '', 'Fees562684', '2023-11-09 04:39:43'),
(6, '5008836', '500', '2023-11-01', '2023-11-09', 1, 'cash', '', '', 'Fees497023', '2023-11-09 07:03:51'),
(7, 'DEMO8572576', '1000', '2023-11-01', '2023-11-14', 1, 'cash', '', '', 'Fees176396', '2023-11-14 04:43:42');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_quotes`
--

CREATE TABLE `supplier_quotes` (
  `id` int(11) NOT NULL,
  `rfq_id` int(11) DEFAULT NULL,
  `rfq_code` varchar(255) DEFAULT NULL,
  `quote_code` varchar(255) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `part_details` text DEFAULT NULL,
  `total_cost` varchar(500) DEFAULT NULL,
  `timeline_val` int(11) DEFAULT NULL,
  `timeline_unit` varchar(20) DEFAULT NULL COMMENT 'days,weeks,months',
  `valid_till` date DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `addcomument` text DEFAULT NULL,
  `payment_term` varchar(255) DEFAULT NULL,
  `term_and_cond` text DEFAULT NULL,
  `add_by` int(11) DEFAULT NULL,
  `add_date` date DEFAULT NULL,
  `assign_to_id` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `accept_date` date DEFAULT NULL,
  `customer_status` int(1) DEFAULT NULL COMMENT '0 reject,1 accept',
  `customer_accept_date` date DEFAULT NULL,
  `customer_accept_by` int(11) DEFAULT NULL,
  `commission_per` int(11) DEFAULT 0,
  `tax_category` int(11) DEFAULT NULL,
  `review` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `supplier_quotes`
--

INSERT INTO `supplier_quotes` (`id`, `rfq_id`, `rfq_code`, `quote_code`, `customer_id`, `supplier_id`, `part_details`, `total_cost`, `timeline_val`, `timeline_unit`, `valid_till`, `duration`, `addcomument`, `payment_term`, `term_and_cond`, `add_by`, `add_date`, `assign_to_id`, `status`, `accept_date`, `customer_status`, `customer_accept_date`, `customer_accept_by`, `commission_per`, `tax_category`, `review`) VALUES
(1, 1, 'RFQ1', NULL, NULL, 18, '', '200', NULL, NULL, '0000-00-00', '6 Month', '', '', NULL, 18, '2025-01-31', NULL, NULL, NULL, 1, '2025-03-14', 1, 0, NULL, 0),
(2, 1, 'RFQ1', NULL, NULL, 18, '', '200', NULL, NULL, '0000-00-00', '6 Month', '', '', NULL, 18, '2025-01-31', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(3, 1, 'RFQ1', NULL, NULL, 18, '', '200', NULL, NULL, '2025-01-20', '6 Month', '', '', NULL, 18, '2025-01-31', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(4, 1, 'RFQ1', NULL, NULL, 18, '', '200', NULL, NULL, '2025-01-20', '6 Month', '', 'UPI', NULL, 18, '2025-01-31', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(5, 1, 'RFQ1', NULL, NULL, 18, '', '200', NULL, NULL, '2025-01-20', '6 Month', '', 'UPI', NULL, 18, '2025-01-31', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(6, 1, 'RFQ1', NULL, NULL, 18, NULL, NULL, NULL, NULL, '2025-01-20', NULL, '', 'Cash in 3 part', NULL, 18, '2025-03-04', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(7, 1, 'RFQ1', NULL, NULL, 18, NULL, NULL, 6, 'Months', '2025-01-20', NULL, '', 'Cash in 3 part', NULL, 18, '2025-03-04', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(8, 1, 'RFQ1', NULL, NULL, 18, NULL, NULL, 6, 'Months', '2025-01-20', NULL, '', 'Cash in 3 part', 'sjhadsjajsdjajdsj', 18, '2025-03-04', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(9, 1, 'RFQ1', NULL, NULL, 18, NULL, NULL, 6, 'Months', '2025-01-20', NULL, '', 'Cash in 3 part', 'sjhadsjajsdjajdsj', 18, '2025-03-04', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(10, 1, 'RFQ1', NULL, NULL, 18, NULL, NULL, 6, 'Months', '2025-01-20', NULL, '', 'Cash in 3 part', 'sjhadsjajsdjajdsj', 18, '2025-03-04', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(11, 1, 'RFQ1', NULL, NULL, 18, NULL, NULL, 6, 'Months', '2025-01-20', NULL, '', 'Cash in 3 part', 'sjhadsjajsdjajdsj', 18, '2025-03-04', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(12, 1, 'RFQ1', NULL, NULL, 18, NULL, NULL, 6, 'Months', '2025-01-20', NULL, '', 'Cash in 3 part', 'sjhadsjajsdjajdsj', 18, '2025-03-04', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(13, 1, 'RFQ1', NULL, NULL, 18, NULL, NULL, 6, 'Months', '2025-01-20', NULL, '', 'Cash in 3 part', 'sjhadsjajsdjajdsj', 18, '2025-03-04', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(14, 1, 'RFQ1', NULL, NULL, 18, NULL, NULL, 6, 'Months', '2025-01-20', NULL, '', 'Cash in 3 part', 'sjhadsjajsdjajdsj', 18, '2025-03-04', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(15, 1, 'RFQ1', NULL, NULL, 18, NULL, NULL, 6, 'Months', '2025-01-20', NULL, '', 'Cash in 3 part', 'sjhadsjajsdjajdsj', 18, '2025-03-04', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(16, 1, 'RFQ1', NULL, NULL, 18, NULL, NULL, 6, 'Months', '2025-01-20', NULL, '', 'Cash in 3 part', 'sjhadsjajsdjajdsj', 18, '2025-03-04', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(17, 1, 'RFQ1', NULL, NULL, 18, NULL, NULL, 6, 'Months', '2025-01-20', NULL, '', 'Cash in 3 part', 'sjhadsjajsdjajdsj', 18, '2025-03-04', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(18, 58, 'RFQ9874376', NULL, NULL, 18, NULL, NULL, 4, 'Months', '2025-03-26', NULL, '/company_doc/weekend.png_1741175343_0.png', 'Payment terms test', 'Terms & Conditions test', 18, '2025-03-05', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(19, 56, 'RFQ7504060', NULL, NULL, 18, NULL, NULL, 4, 'Months', '2025-03-26', NULL, '/company_doc/weekend.png_1741177249_0.png', 'Payment terms test', 'Terms & Conditions test', 18, '2025-03-05', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(20, 55, 'RFQ8465630', NULL, NULL, 18, NULL, NULL, 6, 'Weeks', '2025-03-27', NULL, '/company_doc/weekend.png_1741177372_0.png', 'Payment terms test test', 'terms test testterms test testterms test test', 18, '2025-03-05', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(21, 55, 'RFQ8465630', NULL, NULL, 18, NULL, NULL, 6, 'Weeks', '2025-03-27', NULL, '/company_doc/weekend.png_1741177372_0.png', 'Payment terms test test', 'terms test testterms test testterms test test', 18, '2025-03-05', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(22, 54, 'RFQ5146902', NULL, NULL, 18, NULL, NULL, 5, 'Weeks', '2025-03-28', NULL, '/company_doc/Background.png_1741177573_0.png', 'Teststst Teststst Teststst Teststst ', 'Teststst ', 18, '2025-03-05', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(23, 57, 'RFQ7929484', NULL, NULL, 18, NULL, NULL, 8, 'Weeks', '2025-03-20', NULL, '/company_doc/Screenshot_20240528-141142.jpg_1741177636_0.jpg', 'rerwerweerweerwerwer', 'ewrwerwerwerwer', 18, '2025-03-05', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(24, 58, 'RFQ9874376', NULL, NULL, 8, NULL, NULL, 10, 'Days', '2025-03-05', NULL, NULL, 'cash 3 time', 'ashgd', 8, '2025-03-05', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(25, 58, 'RFQ9874376', NULL, NULL, 24, NULL, NULL, 10, 'Weeks', '2025-03-18', NULL, '/company_doc/fda.png_1741179273_0.png', '2', 'hhhhh', 24, '2025-03-05', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(26, 58, 'RFQ9874376', NULL, NULL, 8, NULL, NULL, 5, 'Months', '2025-05-21', NULL, NULL, 'asjdj', 'jhkjjk', 8, '2025-03-05', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(27, 58, 'RFQ9874376', NULL, NULL, 24, NULL, NULL, 3, 'Days', '2025-03-10', NULL, NULL, '', NULL, 24, '2025-03-05', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(28, 58, 'RFQ9874376', NULL, NULL, 24, NULL, NULL, 3, 'Weeks', '2025-03-26', NULL, '/company_doc/468_60.png_1741179792_0.png', '33', '33333', 24, '2025-03-05', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(29, 58, 'RFQ9874376', NULL, NULL, 24, NULL, NULL, 2, 'Weeks', '2025-03-26', NULL, NULL, '2', '555', 24, '2025-03-05', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(30, 57, 'RFQ7929484', NULL, NULL, 18, NULL, NULL, 6, 'Weeks', '2025-03-28', NULL, '/company_doc/Background.png_1741202803_0.png', 'Payment termsPayment termsPayment termsPayment terms', 'Terms & ConditionsTerms & ConditionsTerms & ConditionsTerms & Conditions', 18, '2025-03-05', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(31, 61, 'RFQ2907333', NULL, NULL, 6, NULL, NULL, 7, 'Days', '2025-03-25', NULL, '/company_doc/Screenshot 2023-09-14 102353.png_1741237025_0.png', 'ytyt', 'jjg', 6, '2025-03-06', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(32, 62, 'RFQ4662536', NULL, NULL, 6, NULL, NULL, 1, 'Months', '2025-03-23', NULL, '/company_doc/Screenshot 2023-09-14 102353.png_1741240579_0.png', 'sdf', 'sdf', 6, '2025-03-06', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(33, 57, 'RFQ7929484', NULL, NULL, 18, NULL, NULL, 5, 'Months', '2025-04-24', NULL, '/company_doc/weekend.png_1741260676_0.png', 'Payment termsPayment termsPayment termsPayment termsPayment termsPayment terms', 'Terms & ConditionsTerms & ConditionsTerms & ConditionsTerms & Conditions', 18, '2025-03-06', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(34, 63, 'RFQ9246070', NULL, NULL, 24, NULL, NULL, 10, 'Weeks', '2025-03-04', NULL, '/company_doc/rudrabhishekam.png_1741280063_0.png', '1s', 'ss', 24, '2025-03-06', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(35, NULL, NULL, NULL, NULL, 18, NULL, NULL, 4, 'Weeks', '2025-03-21', NULL, '/company_doc/weekend.png_1741332543_0.png', 'Payment termsPayment termsPayment termsPayment terms', 'Terms & ConditionsTerms & ConditionsTerms & ConditionsTerms & Conditions', 18, '2025-03-07', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(36, NULL, NULL, NULL, NULL, 18, NULL, NULL, 4, 'Months', '2027-03-18', NULL, '/company_doc/Background.png_1741332753_0.png', 'Payment terms Test', 'Terms & Conditions Test', 18, '2025-03-07', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(37, 63, 'RFQ9246070', NULL, NULL, 24, NULL, NULL, 4, 'Days', '2025-03-09', NULL, NULL, 'CDC cheque ', 'the material will be delivered ', 24, '2025-03-07', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(38, NULL, NULL, NULL, NULL, 18, NULL, NULL, 4, 'Months', '2027-03-18', NULL, '/company_doc/Background.png_1741332753_0.png', 'Payment terms Test', 'Terms & Conditions Test', 18, '2025-03-07', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(39, 59, 'RFQ7105335', NULL, 1, 18, NULL, NULL, 4, 'Days', '2026-03-18', NULL, '/company_doc/weekend.png_1741334841_0.png', 'Payment termsPayment terms', 'Terms & ConditionsTerms & ConditionsTerms & Conditions', 18, '2025-03-07', NULL, 1, '2025-03-12', 0, '2025-03-17', 1, 0, NULL, 0),
(40, NULL, NULL, NULL, NULL, 18, NULL, NULL, 4, 'Weeks', '2025-04-24', NULL, '/company_doc/weekend.png_1741334995_0.png', 'dfdsfdf', 'dfdfdf', 18, '2025-03-07', NULL, 0, '2025-03-12', NULL, NULL, NULL, 0, NULL, 0),
(41, 64, 'RFQ1690604', NULL, 51, 8, NULL, NULL, 4, 'Weeks', '2025-03-19', NULL, NULL, 'Cash 3 times 33%', 'dshjds', 8, '2025-03-12', NULL, 1, '2025-03-12', NULL, NULL, NULL, 0, NULL, 0),
(42, 65, 'RFQ9901303', NULL, 51, 8, NULL, NULL, 6, 'Months', '2025-03-13', NULL, NULL, 'Cash ', 'Term and condition', 8, '2025-03-12', NULL, 1, '2025-03-12', NULL, NULL, NULL, 0, NULL, 0),
(43, NULL, NULL, NULL, NULL, 24, NULL, NULL, 0, 'Days', '2025-03-11', NULL, NULL, 'dasfe', 'dSAES', 24, '2025-03-12', NULL, 1, '2025-03-12', NULL, NULL, NULL, 0, NULL, 0),
(44, 66, 'RFQ3685049', NULL, 1, 18, NULL, NULL, 4, 'Weeks', '2025-05-06', NULL, NULL, '30% advance', '30% advance pay - part payments', 18, '2025-03-12', NULL, 1, '2025-03-12', 1, '2025-03-17', 1, 0, NULL, 0),
(45, 1, 'RFQ1', NULL, NULL, 51, NULL, NULL, 6, 'Months', '2025-01-20', NULL, 'addcomument', 'Cash in 3 part', 'sjhadsjajsdjajdsj', 51, '2025-03-14', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(46, 1, 'RFQ1', NULL, NULL, 51, NULL, NULL, 6, 'Months', '2025-01-20', NULL, 'addcomument', 'Cash in 3 part', 'sjhadsjajsdjajdsj', 51, '2025-03-14', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(47, 1, 'RFQ1', NULL, NULL, 51, NULL, NULL, 6, 'Months', '2025-01-20', NULL, 'addcomument', 'Cash in 3 part', 'sjhadsjajsdjajdsj', 51, '2025-03-14', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(48, 1, 'RFQ1', NULL, NULL, 51, NULL, NULL, 6, 'Months', '2025-01-20', NULL, 'addcomument', 'Cash in 3 part', 'sjhadsjajsdjajdsj', 51, '2025-03-14', NULL, 0, '2025-03-18', NULL, NULL, NULL, 0, NULL, 0),
(49, 67, 'RFQ4744184', NULL, 25, 24, NULL, NULL, 5, 'Weeks', '2025-03-30', NULL, '/company_doc/lh.pdf_1742280496_0.pdf', '50 % advance and 50 % after delivery ', 'production will be started after confirmation and PO received ', 24, '2025-03-18', NULL, 1, '2025-03-18', 1, '2025-03-18', 25, 5, NULL, 0),
(50, 69, 'RFQ3500692', 'Q4547005', 1, 18, NULL, NULL, 4, 'Weeks', '2025-03-28', NULL, NULL, 'Pay terms', 'Pay terms', 18, '2025-03-21', NULL, 1, '2025-03-21', NULL, NULL, NULL, 5, NULL, 0),
(51, 69, 'RFQ3500692', 'Q9497404', NULL, 18, NULL, NULL, 3, 'Weeks', '2025-03-28', NULL, NULL, 'Payment termsPayment terms', 'Terms & ConditionsTerms & ConditionsTerms & Conditions', 18, '2025-03-24', NULL, NULL, NULL, NULL, NULL, NULL, 6, 3, 0),
(52, 70, 'RFQ9746018', 'Q3858059', 25, 24, NULL, NULL, 4, 'Weeks', '2025-03-30', NULL, '/company_doc/camlock.pdf_1742882758_0.pdf', 'PAYMENT TERMS ', 'TERMS AND CONDITIONS ', 24, '2025-03-25', NULL, 1, '2025-03-27', NULL, NULL, NULL, 4, 2, 0),
(53, 71, 'RFQ3783604', 'Q2798843', 25, 24, NULL, NULL, 2, 'Days', '2025-03-30', NULL, NULL, 'fghj', 'dfg', 24, '2025-03-25', NULL, 1, '2025-03-25', 1, '2025-03-25', 25, 0, 2, 0),
(54, 72, 'RFQ3013637', 'Q7677518', 25, 24, NULL, NULL, 5, 'Days', '2025-03-30', NULL, NULL, 'payment terms ', 'terms and conditions ', 24, '2025-03-27', NULL, 1, '2025-03-27', NULL, NULL, NULL, 5, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `support`
--

CREATE TABLE `support` (
  `id` bigint(8) NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `subject` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=>"Open Ticket", 0=>"Closed Ticket"',
  `ticket_no` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_response`
--

CREATE TABLE `support_response` (
  `id` bigint(8) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ticket_no` varchar(255) NOT NULL,
  `responser` varchar(255) NOT NULL,
  `response` longtext NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `support_response`
--

INSERT INTO `support_response` (`id`, `user_id`, `ticket_no`, `responser`, `response`, `status`, `created_at`, `updated_at`) VALUES
(0, 0, '637491', 'Member', 'test', 1, '2020-06-29 09:03:56', '0000-00-00 00:00:00'),
(0, 123456, '637491', 'Admin', 'hello', 1, '2020-06-29 09:51:19', '0000-00-00 00:00:00'),
(0, 123456, '118390', 'Admin', 'Okay please apply via messaging.\nThanks', 1, '2020-06-29 10:33:33', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tax`
--

CREATE TABLE `tax` (
  `id` int(11) NOT NULL,
  `purchase_order_id` int(11) NOT NULL,
  `percentage_flat` int(11) NOT NULL,
  `value` float(10,2) NOT NULL,
  `create_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tax_category`
--

CREATE TABLE `tax_category` (
  `id` int(11) NOT NULL,
  `tax_name` varchar(255) DEFAULT NULL,
  `tax_type` int(1) NOT NULL DEFAULT 0 COMMENT '0 free, 1 vat, 2 import duety and vat',
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '0 Active,1 Disable',
  `vat_per` int(11) DEFAULT 0,
  `import_duety` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tax_category`
--

INSERT INTO `tax_category` (`id`, `tax_name`, `tax_type`, `status`, `vat_per`, `import_duety`) VALUES
(1, 'Vat 6 %', 1, 0, 6, 0),
(2, 'Import Duety 5% and Vat 6 %', 2, 0, 6, 5),
(3, 'Free', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `expires_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `user_id`, `token`, `created_at`, `expires_at`) VALUES
(1, 12, 'b11030fa5b996a925f6116fce5b2fd543b4d19d5d2672224840758305bf83d2a', '2025-01-22 10:07:50', '2025-01-22 05:37:50'),
(2, 2, '6769507266fcd2c93c962aa4ee7b992b9fbc30322b11d02081b7fd662ce4cfbf', '2025-01-22 10:08:00', '2025-01-22 05:38:00'),
(3, 2, 'f82de7f9f0175e7e82f943cd794e9ed953d1fd590f3cf828463a119306efbb25', '2025-01-22 10:08:58', '2025-01-22 05:38:58'),
(4, 17, '1cb769d7563210420832619da26dd10072c613468aa7bfb87d0de62783271814', '2025-01-22 11:11:22', '2025-01-22 06:41:22'),
(5, 17, '4d1385a770898d0f6f6817ad554924c1797fda1047608e698c256ad4d83e96c6', '2025-01-22 11:18:26', '2025-01-22 06:48:26'),
(6, 17, '916c21081dcfc46769df0bbc33f8b8ca1c38f96e50f854dec693fc293f09d049', '2025-01-22 11:44:05', '2025-01-22 07:14:05'),
(7, 17, '1bbf98367b18479fa9a2f57824ee635d7879bfc317b80d19cc27cecc1bef5abd', '2025-01-22 11:56:12', '2025-01-22 07:26:12'),
(8, 17, '73a7f1076c9f6e3482b59f5f827021779a32861025543ef31af4e2094b5910ed', '2025-01-22 12:07:26', '2025-01-22 07:37:26'),
(9, 17, '01b3445c53acbf7f276951183ffde6bc9c39c87815ab7cbc57e611bb15e5c2f0', '2025-01-22 12:16:30', '2025-01-22 07:46:30'),
(10, 17, '8d668c599736df76b27e600595b2b64ae3e39adabbb7dfc54bc5a8af86a70fbf', '2025-01-22 15:49:30', '2025-01-22 11:19:30'),
(11, 17, 'f529e5953e9261e1b390468932418275cd77bb467eb4e835da2ffa18efcd7eb5', '2025-01-22 15:49:58', '2025-01-22 11:19:58'),
(12, 17, 'f7dae73d506a640ab4cd9ee16612c4fe883bd5bbfc2ef6db12099a4f9472e582', '2025-01-22 15:57:00', '2025-01-22 11:27:00'),
(13, 17, '45a976711e3a04656f142daff542aaf76e0faa6b83aa50add694a84731fd1f30', '2025-01-22 15:57:11', '2025-01-22 11:27:11'),
(14, 17, 'dbc8cb3526ec1fccdeb8e7779ec1c94efe08ee2a2b608927561935324ffa7d54', '2025-01-22 15:58:58', '2025-01-22 11:28:58'),
(15, 17, '2e676191ef2bdd003e76f6f4c3801224804364380551a5798da07ddb56fb07b0', '2025-01-22 15:59:10', '2025-01-22 11:29:10'),
(16, 17, 'e823b5709a1932f71b0544db13a916fc97567a04a20f4290b3f61b9bcd8c7b02', '2025-01-22 16:08:39', '2025-01-22 11:38:39'),
(17, 17, '3f0ac69ea566dc283db19e40cd1c3c3ca90ed8240d6c2ec7b61e3c2972c7987d', '2025-01-22 16:47:57', '2025-01-22 12:17:57'),
(18, 17, '35621c9782fa9a6f9bc1159bfaaf976633c8b0a15adbf6dfa77d809d1ac55420', '2025-01-22 16:48:03', '2025-01-22 12:18:03'),
(19, 17, '3fcd031cc5414ab989fad24a70edb8dda21410d5d7eda1d7e769b5e38d97dc9f', '2025-01-22 16:48:04', '2025-01-22 12:18:04'),
(20, 17, 'aa5ef961789a3d702c79c1a3e62ba8f4549ea64f5e832e910b84eaa33b80c582', '2025-01-22 16:48:16', '2025-01-22 12:18:16'),
(21, 17, '2b6ddec44e35e93eaa71efc263243f1a094d82506d2276488db4b7a607bc8cf1', '2025-01-22 16:54:06', '2025-01-22 12:24:06'),
(22, 17, 'eb142f9e12a15414d1e725a1a610f235b2f14c1fe103083949965cfe4a3145d2', '2025-01-22 17:41:23', '2025-01-22 13:11:23'),
(23, 17, 'fa784f090b779d77563fae0b3bd711253d6c1caa2d137dd0de82c61ccabc560d', '2025-01-22 17:43:08', '2025-01-22 13:13:08'),
(24, 17, '5ea7ca8291df6c20730e1284e663584419419d357ccfcf4d5e038681248c3ede', '2025-01-22 18:06:11', '2025-01-22 13:36:11'),
(25, 17, 'f78eb969913771293ae26e1e14a56ff7028a05f78fa8d03f8edd93aa36b08135', '2025-01-22 18:06:22', '2025-01-22 13:36:22'),
(26, 17, '9b35b8663c8abe748fb9a14f2c9ecf661d79630081c1da5679852e8f6cc9a23b', '2025-01-22 18:13:57', '2025-01-22 13:43:57'),
(27, 17, '3aac94233de96d33560bae6d8fcb1537a600614190ea0f70b3aa95cc0ab3a630', '2025-01-22 18:14:16', '2025-01-22 13:44:16'),
(28, 17, '8443e35d4a55323b47ef937fead14cf9effed07fa595d7369985168bf8fcb197', '2025-01-22 18:16:48', '2025-01-22 13:46:48'),
(29, 17, '4e3d4c27bdade9fca12ff1c422f7be842000de797d4893bb2bce643b846e6ab3', '2025-01-22 18:18:25', '2025-01-22 13:48:25'),
(30, 17, 'c426c1cd81240c50ffc0e415a8c1e44baec34a79e16352f7fb6d85292e50a130', '2025-01-22 18:21:07', '2025-01-22 13:51:07'),
(31, 17, '58e10181b63f7b6a3fec774934538bf3ae09452438bda79e4d6b2f654042f487', '2025-01-22 18:21:12', '2025-01-22 13:51:12'),
(32, 17, '539cd6fb6dc383344403570b8ed3761e6336e49a2f55aa692c6364b796ca2073', '2025-01-22 18:21:32', '2025-01-22 13:51:32'),
(33, 17, 'c5762e1031739508c9850adcfb9315ee870fb5d133553d8da0de8bde89c8b66a', '2025-01-22 18:21:43', '2025-01-22 13:51:43'),
(34, 17, '690ebd67fc84bc6d096b2afc679ff3221654a2dae75dcbf20d2e6d06368000b6', '2025-01-22 18:22:21', '2025-01-22 13:52:21'),
(35, 16, 'f8826c26c8aba194a3d731ee1911689515d1bf4b2a802e8ce7c9cb7694018871', '2025-01-22 18:22:42', '2025-01-22 13:52:42'),
(36, 16, 'dfcd0f1f9fc0a60bf3598d9044d1f1e6f75774764319ee60fc48481eff6e30d8', '2025-01-22 18:24:02', '2025-01-22 13:54:02'),
(37, 16, 'da777d40cabdef3c499b3c8071e0ff07137358aaa2476af10fd1890c125f0102', '2025-01-22 18:24:27', '2025-01-22 13:54:27'),
(38, 16, 'aa30668478e07d2871ddbdcbb3db453dd5418c418a523c42c7a7a617e34cba0d', '2025-01-22 18:24:31', '2025-01-22 13:54:31'),
(39, 17, '47eb417f58f8a856ccc7f5d5729866efbe5823c69f94267f97ee9dfe8135d0e2', '2025-01-22 18:24:42', '2025-01-22 13:54:42'),
(40, 17, '260e67884cf44187bab9b7cfe6e0da8fb27930f1e3de2f3109a9ee2b52e220aa', '2025-01-22 18:25:09', '2025-01-22 13:55:09'),
(41, 17, 'b39d8a47a073bad378b46ab89114ba5f12b7957470294d18da095bcc4030b184', '2025-01-22 18:27:01', '2025-01-22 13:57:01'),
(42, 17, 'fc0a5927853daa2f39bc6cbd387266335374dbd5fdea3d65be49c3f437d34d5b', '2025-01-22 18:27:55', '2025-01-22 13:57:55'),
(43, 17, '78abf4598a26c57601cdc3f66ea2511bd6ae0826a73cd18d2c42a0af3ca872ec', '2025-01-22 18:27:55', '2025-01-22 13:57:55'),
(44, 17, 'd7c4958c9cacdae2cdf4d7f04ff47b5261dcc436966270e3990393e5cbea56df', '2025-01-22 18:28:11', '2025-01-22 13:58:11'),
(45, 17, '5a8ebd2003bc8f329aaacacfc89c4b63b71f47967d4ed99612feeefdd8b424f4', '2025-01-22 18:30:50', '2025-01-22 14:00:50'),
(46, 16, '02c0e1d1efd4abcd23c7a95db792f8327d8e02fd5e2876bd7f957819ea3290b0', '2025-01-22 18:31:00', '2025-01-22 14:01:00'),
(47, 16, 'e416c59c6c8fe2fa76e48390353e13896b6d8dd8d6d125c9615953b9297d49df', '2025-01-22 18:33:22', '2025-01-22 14:03:22'),
(48, 12, '473ec459d6cf230ae9607ddf32413d6945564f3ad7e637ad489b94b3e1a9f940', '2025-01-22 19:40:48', '2025-01-22 20:40:48'),
(49, 18, 'a8381a42737c4220237acdbf2c496827aa2081b90a98e045d44637f487644f06', '2025-01-22 19:43:42', '2025-01-22 20:43:42'),
(50, 20, '0defe81db48f7d170ba741b936c9296c3faa4c3aaec8342f07985eca5a25739e', '2025-01-22 19:51:22', '2025-01-22 20:51:22'),
(51, 21, 'cd983adb5118d72835c505462ebbed79d296676702ad12341ea0bfa3c963acca', '2025-01-22 19:52:40', '2025-01-22 20:52:40'),
(52, 20, 'a4e3e20e22c1d124d45d262c2c77193600cd5bb39433340eaa509e0679110bd1', '2025-01-22 19:55:38', '2025-01-22 20:55:38'),
(53, 20, '96dde07bc3dae94a973a7fef38b4361f1d499a86eca9e0fe8f8341cb62b75f90', '2025-01-22 19:56:26', '2025-01-22 20:56:26'),
(54, 22, 'a7af535402f7bc955e37ab9918be5ec95c879741f6d83c8e8f9c91d265140f2e', '2025-01-22 20:06:46', '2025-01-22 21:06:46'),
(55, 20, 'd56de4d0ce83634c758b16b3547191a85277bf2568f7c1871801948c794dac2d', '2025-01-22 20:07:09', '2025-01-22 21:07:09'),
(56, 22, '7cdb6dafc2f2f2af00cc8d17100b2839a223d1a9040946b6b74ee82ac29eafc5', '2025-01-22 20:07:15', '2025-01-22 21:07:15'),
(57, 22, '56d39fbdef8837f8c12f9b8a7d61ba64d5a0df224e110c420e054cf6de35ce03', '2025-01-22 20:07:24', '2025-01-22 21:07:24'),
(58, 22, '1a8afec152ead3e4975bef954b299f016170c521d31fa22edcecaed898d7e168', '2025-01-22 20:07:33', '2025-01-22 21:07:33'),
(59, 22, '50db42d36b1ef93e12e7cfa562794b8f592d06013fd75d7617447cdeb3863538', '2025-01-22 20:07:42', '2025-01-22 21:07:42'),
(60, 22, '2eefa031d18099a592f503065116cf2b2b9bcbee9d8e18745de9ebbd4589f6a6', '2025-01-22 20:08:05', '2025-01-22 21:08:05'),
(61, 20, 'a9d3fa81e51b82636712f363a476866b35b076b93c4c673b5060a1312dd38e72', '2025-01-22 20:08:40', '2025-01-22 21:08:40'),
(62, 22, 'cdb5e43974097c22914ca73a1bc1f961651834a7f985ef3d5e80172cb4f4de34', '2025-01-22 20:09:54', '2025-01-22 21:09:54'),
(63, 22, '119269cef2b645af8da91e4d1dc7b33fcf2292d885399e1501e56ebf1b6f93f5', '2025-01-22 20:10:21', '2025-01-22 21:10:21'),
(64, 12, '088eddb6999dba54d06731a6265b712e051cdc4cb40fd74c87b4984d5d95852f', '2025-01-22 20:26:08', '2025-01-22 21:26:08'),
(65, 20, '776c2ec86eea83e6b015480a90badd4101e600479062aa970ec75433194830dd', '2025-01-22 20:46:38', '2025-01-22 21:46:38'),
(66, 23, 'b6619c053f516525067810e26e063110e3f2d0bf0b26fc575c708d8d8dc45e96', '2025-01-22 20:51:19', '2025-01-22 21:51:19'),
(67, 24, '3bf5e070485ce0d9503229eb45a615bf2512754c00e7251b36bf6ce38bc5711f', '2025-01-23 06:25:03', '2025-01-23 07:25:03'),
(68, 25, 'c48beb4569f4e771317cf628ac3067656ba6f52ff66d48f9576a5fe7de83105a', '2025-01-23 06:25:38', '2025-01-23 07:25:38'),
(69, 12, '7f01d50cc82098c09577b2cc4f0b8b683cbd35241eced1a321440527676f6028', '2025-01-23 07:31:09', '2025-01-23 08:31:09'),
(70, 12, '42eedbc53e27f50061249965fbd4f14c4cf21bf480d2dacc1678f25cbc48934f', '2025-01-23 07:36:28', '2025-01-23 08:36:28'),
(71, 25, 'c5e4e64796343f2f4325e3de85c2108690834198bc30a8129958950a5243db09', '2025-01-23 07:40:58', '2025-01-23 08:40:58'),
(72, 25, '0953fb4b7a8fc28280da8d3abc04b5087fa718753130a13c490fef0171f90053', '2025-01-23 07:41:10', '2025-01-23 08:41:10'),
(73, 24, 'af9be4f2dade8d21abb3e7c55a8be78277dbad559bec21223ddfddcbe4e15d4c', '2025-01-23 07:41:20', '2025-01-23 08:41:20'),
(74, 25, '492c5d16b64fb5275c500d08bfcbe3e54b83acbfabbb3055bbf222341e13f1f8', '2025-01-23 07:51:51', '2025-01-23 08:51:51'),
(75, 12, '2e86ab722f6d48ee03200f8e66b696aa03eb1b18c52ad13245baccff7858569d', '2025-01-23 09:02:55', '2025-01-23 10:02:55'),
(76, 26, 'c0a700d5e439706bf997015606f4e80ea6d9db2c1148028998219d7b61d07e53', '2025-01-23 09:07:39', '2025-01-23 10:07:39'),
(77, 27, 'df7f224f28a5376898322fb7e084db5a8aa9f45445600e1cff86fb7bef37d157', '2025-01-23 09:17:54', '2025-01-23 10:17:54'),
(78, 12, '0c2c30bb194cb9c6231dd7c0152f8b5916b0fdf69be08ff4763ffabf40023aa8', '2025-01-23 09:18:39', '2025-01-23 10:18:39'),
(79, 28, '1ac36c8243cff2377dbed21ad1321fffe085fa4e761336d7107e91248ba31bd4', '2025-01-23 09:19:29', '2025-01-23 10:19:29'),
(80, 12, 'd1097ca2cfcde961423e9b1dbc9096c7e6f2f14426892a53d4637cec17b69487', '2025-01-23 09:23:36', '2025-01-23 10:23:36'),
(81, 12, 'a2591f9530e1b581c58b4ee6260224c0cfcdf99a606ed320e838e843beb7b453', '2025-01-23 09:28:38', '2025-01-23 10:28:38'),
(82, 12, '1538f8562fe87328a818d6c6fdbc3d7f222792f62c377b776d92d722b29a05ff', '2025-01-23 10:06:30', '2025-01-23 11:06:30'),
(83, 12, '99dd0ab32ee5217c09cc45a120260faa34a32e9bd9ca1e91eaa97c7a61344821', '2025-01-23 10:33:40', '2025-01-23 11:33:40'),
(84, 12, 'bb60065b4f938a486fcbfa24d452b19917c2fb671c911831649e29042695c3a0', '2025-01-23 10:39:09', '2025-01-23 11:39:09'),
(85, 12, 'fa53a55c7e077f167017f12410b977d470f5f1d491352290f708f2ff1e58698f', '2025-01-23 10:49:09', '2025-01-23 11:49:09'),
(86, 12, '2b954fd92c1dd6a6b0611371fd25494cac913e861945b609ac81124318d6fde1', '2025-01-23 11:07:52', '2025-01-23 12:07:52'),
(87, 12, 'ede998114978d7bfd47310b8674a73117df3f7edd9f9ed1e29e5c47de621d3e1', '2025-01-23 11:09:17', '2025-01-23 12:09:17'),
(88, 26, '16f9de45cc609acfd56479b5cd0f7969466f29f395a93461c823e32f636e8cd3', '2025-01-23 11:09:47', '2025-01-23 12:09:47'),
(89, 12, 'de10d8f1fc9db5a0d5275db28f7f3884ff9560acd897ea720ce3acf4cfa7be5a', '2025-01-23 11:10:11', '2025-01-23 12:10:11'),
(90, 12, 'a35d89fbf88f1bee15559d96afe5fafbfa94d8b1e4f18d7d46f87aa1138b5f31', '2025-01-23 11:41:14', '2025-01-23 12:41:14'),
(91, 26, '8c9d68e4cc787cd835daaa7d05dca1ae7413a6c341fdb94ecbb5731658225c66', '2025-01-23 11:41:49', '2025-01-23 12:41:49'),
(92, 12, 'ebc38ba33c85766ef5498913766feaee8a1971c82c75dcb685b406c98e0abc51', '2025-01-23 11:42:22', '2025-01-23 12:42:22'),
(93, 12, 'b415522f1aa12e9c11a2f66f353f99de1ad0857c5701e54d84581364f5d4cb6c', '2025-01-23 13:11:31', '2025-01-23 14:11:31'),
(94, 12, '09ff08fd1fdf876c0c6866e48c5a227b486d6f2db68813078408e7cfe233f53e', '2025-01-23 13:14:43', '2025-01-23 14:14:43'),
(95, 12, '28bcbc937cacca8ab1f51995bb72cefde59774fcd3b1130682432b9f7ade62fc', '2025-01-23 13:15:33', '2025-01-23 14:15:33'),
(96, 12, 'ea0c25bf4199e7cd3d20bc789296766ceecf68d5a8a394aeb5a99e725f8ffe26', '2025-01-23 14:04:28', '2025-01-23 15:04:28'),
(97, 12, '25cdbcfad0db3c5d4d21f8a1fb1510b2c662305bf658cadf592c3445285a2b3e', '2025-01-23 14:15:30', '2025-01-23 15:15:30'),
(98, 12, 'c0f4becf12beab08e0c75f265210eb2d2d2526da4f70eb995d50bfdcf2fcca75', '2025-01-23 14:15:42', '2025-01-23 15:15:42'),
(99, 12, 'fdaea664b50a9424628d3c3310123339d8ef4444c345f2d942f2b6132ad16ba4', '2025-01-23 15:51:10', '2025-01-23 16:51:10'),
(100, 12, '0471dd0101efacf053dfd2cbc696eb5dae305e019a4a5b754fa9b0fc9d1ee43e', '2025-01-23 15:55:30', '2025-01-23 16:55:30'),
(101, 12, '3c732027aa12f1b6e8bff5223ffa3c9870392a65ef7ed5b5ff8030d4b1cbad12', '2025-01-23 16:52:33', '2025-01-23 17:52:33'),
(102, 12, '6f2537e6c2ca641f7b72c3839cc3076893a09ca433d60879f87c7b72d90a9152', '2025-01-23 16:53:00', '2025-01-23 17:53:00'),
(103, 2, '0b009130558e47f8c137061d247d258aad0d429f88f46ee452ee862645180d0f', '2025-01-24 08:58:32', '2025-01-24 09:58:32'),
(104, 2, '47e92f1fedb5c5c7d8b1b11e065c057181ec47d6115aa452924069a4dcdd3434', '2025-01-24 08:59:09', '2025-01-24 09:59:09'),
(105, 2, '38ee4d779356c083f0d5fc8c8243afd81cf4f7fa59f556ee18d69cc9b06f40d8', '2025-01-24 08:59:26', '2025-01-24 09:59:26'),
(106, 2, 'c71bcd02e582a324989704ccb248f336820fa9c0c2a6641a814b9dbebd088398', '2025-01-24 08:59:42', '2025-01-24 09:59:42'),
(107, 2, 'b94dbff88276aa2e7c688c47240efdc36ab14361caf93b7d5dc5a1bb2f5a2ac7', '2025-01-24 08:59:59', '2025-01-24 09:59:59'),
(108, 2, '1cf3750979fbff09e9be793e93eaf63eaa5a4f137140b24ae31a2943dae5c7cf', '2025-01-24 09:00:14', '2025-01-24 10:00:14'),
(109, 2, '9446ebf55b07e824d9d12d9fce250ae53c169d9e94a411012f659af6360bb19d', '2025-01-24 09:00:48', '2025-01-24 10:00:48'),
(110, 2, 'd53ca862802c7b0ea2fdcb41945cbff242348a6cfe43e677c0d847bc380d825b', '2025-01-24 09:01:39', '2025-01-24 10:01:39'),
(111, 2, '24738013a07e7dd1a343eb947ac5ae0b03d2e76cb6f8a3daf7c5804f7f5cbafb', '2025-01-24 09:03:22', '2025-01-24 10:03:22'),
(112, 2, '9e015f927d10ebc9ce1e57b4cd4228d983be05ca7bad47324ce890f46a95cb54', '2025-01-24 09:04:02', '2025-01-24 10:04:02'),
(113, 2, '294c2f9e75c0485e8ae4e2a248950cb7316064e0acaa59991731ef28a1bf3fd2', '2025-01-24 09:04:34', '2025-01-24 10:04:34'),
(114, 25, '731c6e3e425c8bc0f506e18a0e814916574a598e7c81fca8fd35a84470baebce', '2025-01-24 09:52:30', '2025-01-24 10:52:30'),
(115, 24, '601f24b807ff778855c75b396ce8bebc257f2a3e02d9717ef1b0f01861ba76b5', '2025-01-24 09:53:24', '2025-01-24 10:53:24'),
(116, 25, '0873b71ec3525cc354bb053c6a71b5af343c0f6d51c1d5a578f0904cfde57be0', '2025-01-24 09:53:38', '2025-01-24 10:53:38'),
(117, 12, '92cd97963f9450a346e973c880c114bea2cfeb09f9c2bd1d0758e9ba34c588e2', '2025-01-24 09:59:01', '2025-01-24 10:59:01'),
(118, 2, '201657ac3e20942808bd04f11c0ae6acf1dc1c8a7410b69539b66d422b78e9f8', '2025-01-24 10:43:39', '2025-01-24 11:43:39'),
(119, 1, '949a58c52b70e3ef0358fd03d388174bf0c2ad55a928a6616712e457723db373', '2025-01-24 10:49:37', '2025-01-24 11:49:37'),
(120, 6, 'f2b4ff8f9a0bb885a8c824e0c2ec19eb0f7f1fb1b86a8c90e3accad6598eea7b', '2025-01-24 11:02:28', '2025-01-24 12:02:28'),
(121, 12, '6c1b2aad026cd3f9404a76f25911142727332c5bbe7c33d6a877692e4d46a3a1', '2025-01-24 17:23:16', '2025-01-24 18:23:16'),
(122, 12, '0e2be424eab28153acd6cbd1d004a585a046cb3c4e60b05e5ce1b7237bc470fe', '2025-01-24 17:41:49', '2025-01-24 18:41:49'),
(123, 12, '9bbdbc369fa2a97da38f4928bf2f065a8e17ede0b63bd56946d4bfdab134076b', '2025-01-24 17:46:02', '2025-01-24 18:46:02'),
(124, 12, '241514881bb49cac34c56a0f2486b4dc39aead3c387b115c2b3e6d0c196bddaf', '2025-01-24 17:49:14', '2025-01-24 18:49:14'),
(125, 26, '7051d1e1c17eabd4d114c278997858ff3b425417acf2396c2700cec0f500a4eb', '2025-01-24 17:55:08', '2025-01-24 18:55:08'),
(126, 12, 'bca49a449f07c29c518cbd251c68fb7f6c5ec1663626ef6d4ee752238175f372', '2025-01-24 17:57:43', '2025-01-24 18:57:43'),
(127, 12, '647c7cad9e2c4467650ddacd904cd3cde6f59b556fdaf69f36b90d72b33471e0', '2025-01-24 17:57:43', '2025-01-24 18:57:43'),
(128, 12, '0a112be362bf6fc5e8c60ac163ac4ad31aa90827391ed750d7b118482ce5036a', '2025-01-24 18:09:06', '2025-01-24 19:09:06'),
(129, 1, '81c2f328607b1e126921baf72bbdece5a0e131a73b17a7c256fa6e3df9fc50f2', '2025-01-25 07:54:52', '2025-01-25 08:54:52'),
(130, 6, 'fca966471ae7015fc3c3eb1db858b3ffc9f28e1015e26d16364be5bf46708ba0', '2025-01-25 09:15:55', '2025-01-25 10:15:55'),
(131, 1, '4a76779e6a60a99ab4dccf5653386674f51b81f1648fcce9f0d366033fc904b4', '2025-01-25 09:16:46', '2025-01-25 10:16:46'),
(132, 12, '194a9edb738fbb67b0f3b37572dd1f37a2a23c180cd8e2798e47e7a12911068c', '2025-01-25 11:24:27', '2025-01-25 12:24:27'),
(133, 12, '6802aa782bf086c735d1eb82d973289e8b8ee16d48f540fd3409eb864bec564d', '2025-01-25 11:27:00', '2025-01-25 12:27:00'),
(134, 12, '1ccf3ba00e8b97d0110fe2b60d0453c31888c5c4364def3ee03950c98dff8d92', '2025-01-25 11:34:37', '2025-01-25 12:34:37'),
(135, 12, '61ed0b3f66b77665a6a0757c0d2425c3a0621e8d6a1173420326d1f4a49352cb', '2025-01-25 13:40:20', '2025-01-25 14:40:20'),
(136, 12, 'b6e6beb518eb18790ff944da5614f2e70f512895791e8457f9bed821d6ded292', '2025-01-25 14:06:03', '2025-01-25 15:06:03'),
(137, 12, '4abed1660e8def3774ec62deac58f614fbb1f9a506f77400f0e38469f9345c65', '2025-01-25 14:10:04', '2025-01-25 15:10:04'),
(138, 12, 'f97d7c7ff9c47c86e0c24ec15c53adb18a1fe27d9023d02d7e53d556d3ab0129', '2025-01-25 14:12:35', '2025-01-25 15:12:35'),
(139, 12, '5e84de48ef1db079850db408eb389366e04a245e989ff86e7eef2a4e52f124a1', '2025-01-25 14:14:20', '2025-01-25 15:14:20'),
(140, 12, '1e6ba7d4db176d533a260cc22a9f8114f26d193327fe7c5bd7d599b178feeada', '2025-01-25 14:14:56', '2025-01-25 15:14:56'),
(141, 12, 'd788446884c6ce2f581d711f9589e02677d2ed2a54d0ed8464bd0245c153ff6d', '2025-01-25 14:18:35', '2025-01-25 15:18:35'),
(142, 12, '6657f7bca3eed374245665ab6d06a7c66cbd17523e394c3aa0090bad8acb6cce', '2025-01-25 14:20:33', '2025-01-25 15:20:33'),
(143, 12, '71d890dfe44f7201b782b542a56fee4a6189fa2a902d79877a2d4af42e886895', '2025-01-25 14:23:08', '2025-01-25 15:23:08'),
(144, 12, '2c9b4b22380a7054514d382eb4d138a3859585f1e5f37f90a24a3eb833e4e775', '2025-01-25 14:25:22', '2025-01-25 15:25:22'),
(145, 12, 'efc93cdae4965dc636e45e945bf509ec99b59cf133bb1ec16b5151ce264380a3', '2025-01-25 14:29:08', '2025-01-25 15:29:08'),
(146, 12, 'a3f95edb83c403540d12e08d60eb63560408fd9d6a33397f7ee45cd6099973f8', '2025-01-25 14:32:07', '2025-01-25 15:32:07'),
(147, 12, 'b96bcff1dcac376be62776241d86d43208a6297846ad52558188566b43b6d2d1', '2025-01-25 14:34:10', '2025-01-25 15:34:10'),
(148, 12, '2d7f3513274584968328ec177c7447afd1b9ade6453073f98f5ce7e8ec3efe47', '2025-01-25 14:53:12', '2025-01-25 15:53:12'),
(149, 12, 'f8ca6c1e950c4d07621e93a0e7cbcf76b299a2177ef6aa18cdfefe275b76f74e', '2025-01-25 15:07:10', '2025-01-25 16:07:10'),
(150, 12, 'de8793ee23b9e270dd61ab863a181fc28d5e8f037451d45f379fd0767f6463e2', '2025-01-25 15:07:11', '2025-01-25 16:07:11'),
(151, 12, '1eae30b475d211ce0f943d668ba58d07687ebe4ca82b855faa336e199b5d08f0', '2025-01-25 15:32:14', '2025-01-25 16:32:14'),
(152, 12, '4019eac1d824c4d9b68413a1d619aa23c6a7192b5c3a45c67cb1aeeaf7524cc7', '2025-01-25 15:42:41', '2025-01-25 16:42:41'),
(153, 12, '1347bfa2f846dbcd698d39c81fc1ecd9dc747e8dbef4c9db67ac52e40a590c81', '2025-01-25 15:50:00', '2025-01-25 16:50:00'),
(154, 12, '7431179eb0b089d722cdc037f53d67646912a63ad679d6a2c4c8b9d881ea265e', '2025-01-25 16:03:43', '2025-01-25 17:03:43'),
(155, 12, '7912b97830ff342e5fc8ae9679b39002729d6698aa3a6e8512ef4fb94a0ce22d', '2025-01-25 16:31:31', '2025-01-25 17:31:31'),
(156, 12, '52696ea7439ecce64ddc953504e7c0032e2bbaa2f942cc6daac2634cb216a61a', '2025-01-25 16:32:27', '2025-01-25 17:32:27'),
(157, 12, 'ffd0d37b32457e6cc792c43e54ff93c2740261ce5b0520d9cc8ee3a4eb509a7e', '2025-01-25 16:36:26', '2025-01-25 17:36:26'),
(158, 12, '1f97d73ca29a9dce64dec27b881eb96e56883be6a1c2266335d2127d2836cd1c', '2025-01-25 16:53:09', '2025-01-25 17:53:09'),
(159, 12, '3e02dc75d0618d5b03d4498b80ca23e905a74feb0e6470ff43e81f1d1c0ff910', '2025-01-25 16:59:53', '2025-01-25 17:59:53'),
(160, 12, '5ae641ad5264e8fe2b21e711012a42250c46e28a08b1ea5642cf003b767ccd3c', '2025-01-25 17:05:59', '2025-01-25 18:05:59'),
(161, 12, '0cc3d32eaad7fef8e41432a942dc94e99f6bf658991d69473d59c24550c20bd6', '2025-01-25 17:19:34', '2025-01-25 18:19:34'),
(162, 12, '272ad5d6871275a0fa7139c245d298b54f5650eb891be38cd385be7e946ac187', '2025-01-25 17:36:08', '2025-01-25 18:36:08'),
(163, 12, '090dc32c5870bcc89189359927480f2b21bb1881fb179ea3916a086ac6ead3a1', '2025-01-25 17:38:04', '2025-01-25 18:38:04'),
(164, 12, 'a5267dc685a1c767af9350c7c2882ea08a837940f27c67db66029dee4605d018', '2025-01-25 17:38:30', '2025-01-25 18:38:30'),
(165, 12, '4b1bab83348529d808a08a0f4af0ab22cf9732e03629931fa981266397077e99', '2025-01-25 17:44:22', '2025-01-25 18:44:22'),
(166, 1, 'f81a144b51e5c8a659eb4ec79a06e81c947b059e6af561b82ba3f1b445323bd7', '2025-01-26 04:29:54', '2025-01-26 05:29:54'),
(167, 25, 'ece7a6e1b3b626f36328bcff06c55cadbb6ce792b1f5befbbcb41067bbdc67db', '2025-01-27 06:10:11', '2025-01-27 07:10:11'),
(168, 24, '9b9f36816fe975bda667e293919116c44b7a54d803341ab71663ccd6920582e0', '2025-01-27 06:11:24', '2025-01-27 07:11:24'),
(169, 29, 'cde33c4645ed4285c74e592f403256c72e739c0a2e11debf3d5d317d35eaa549', '2025-01-27 06:15:56', '2025-01-27 07:15:56'),
(170, 1, 'fc4dd5b3d79a4d2bcab13e4976cff42b14232741e5949ca0da5b48ded32260b4', '2025-01-27 06:26:01', '2025-01-27 07:26:01'),
(171, 1, '2efdbf546e51b93dbc5b8c6024341ef71fc1eb7e21ff156971be12de880f2d28', '2025-01-27 06:28:56', '2025-01-27 07:28:56'),
(172, 12, '01aa6ef5ba898ea64c7aea4fa17f685067d334ec66093f3c0d0daecc658ab90c', '2025-01-27 09:24:55', '2025-01-27 10:24:55'),
(173, 12, 'ce16949c16abf995985c9a4f470de7b052734a997e15816aad6f507a67cf8b9f', '2025-01-27 09:32:41', '2025-01-27 10:32:41'),
(174, 12, '479c3e33b72450eb890f32e89ada93a63c5ae099e12e04740811488a8a3c30da', '2025-01-27 09:42:11', '2025-01-27 10:42:11'),
(175, 12, '20f8ec8ac3388eb26726cb98f3cbd2c926a9fb76b2ab7a4c54031c009410b6a8', '2025-01-27 09:55:14', '2025-01-27 10:55:14'),
(176, 12, '10f705b24578b1c61f4e34a4ea6e41720cb00c42ae23461cc4c445d61e45d0fb', '2025-01-27 10:34:14', '2025-01-27 11:34:14'),
(177, 12, 'bb5feb38ded56cc92ee90c88ec5bc89240e90f9c963f0a66738ce08b1e279836', '2025-01-27 10:35:00', '2025-01-27 11:35:00'),
(178, 12, 'a3e9f810a070a9460cd064b1a53b85886a50cb5378ffaf9bcd2ae09058ff81c3', '2025-01-27 10:36:39', '2025-01-27 11:36:39'),
(179, 12, 'b6eaade7287e69d11e3c98b410db9b3a7e8cd10696454c13ae7fd4cbed2b129d', '2025-01-27 10:44:00', '2025-01-27 11:44:00'),
(180, 12, '94d49a08435435b8775fb72b9760b4e3304f0a254eeefc46b8999055961d5bd6', '2025-01-27 10:44:25', '2025-01-27 11:44:25'),
(181, 12, '963cb6d000467c0c649800def8e58455a4bb7893aac773c0559348c84b908098', '2025-01-27 10:45:03', '2025-01-27 11:45:03'),
(182, 12, '8441b4f0bf64c69e9faaab290643b1ebd0e301687bcbd7a420576e784be7497a', '2025-01-27 10:47:20', '2025-01-27 11:47:20'),
(183, 12, '00da939f6ac5a3f844c1ff80103c784707a2dc6dac6285bd1d0a9b50e33e9b06', '2025-01-27 10:48:09', '2025-01-27 11:48:09'),
(184, 12, '7f6a777d022bfe07c5553108e1ad10eeee6ac80107420788b93cedf01479901a', '2025-01-27 10:50:19', '2025-01-27 11:50:19'),
(185, 12, '3b52dca782da20979ee57dba43a651c0e5ef4084a9b3744f5b6939ec20674956', '2025-01-27 10:51:24', '2025-01-27 11:51:24'),
(186, 12, 'f1230b2b33a58da80a868f4bc5c1be087c9ead9c06201b3f3fa9f093a02f6695', '2025-01-27 10:53:21', '2025-01-27 11:53:21'),
(187, 12, '8abe793ffbbdd940d3dc619a2f6e41980e87458c7c108a24df46e7fe52be5ebd', '2025-01-27 11:00:31', '2025-01-27 12:00:31'),
(188, 12, 'cb905a34501dd80cb56654ffc2f9683efd7cde6d1f7bc27303506406fd36ac16', '2025-01-27 11:03:53', '2025-01-27 12:03:53'),
(189, 12, '54e8528136529c1d63510b0acfa95494946a78035ca09e3626a456b8a14d88bd', '2025-01-27 11:06:12', '2025-01-27 12:06:12'),
(190, 12, '30b173ff5d84df2313fb8009a4842948348f87b983983fc4aae8cdeb82300266', '2025-01-27 11:09:23', '2025-01-27 12:09:23'),
(191, 12, '5cc6781b06c098058171cfde8f5aabad263b9b5eb9bb74f5256c959ade92db9f', '2025-01-27 11:12:03', '2025-01-27 12:12:03'),
(192, 12, '0c8ecca7b0199117459b97000d677293fbf793ecd166eaf4fe1351b9a092212a', '2025-01-27 11:14:05', '2025-01-27 12:14:05'),
(193, 12, 'e26b3a514464821076d7a7929c5e818a8ad8e0ebff88fe0b30864724e338f9c5', '2025-01-27 11:22:00', '2025-01-27 12:22:00'),
(194, 12, '75471844dacb669b1de36c887c56c863d2c043708196e6f5321402c07a014509', '2025-01-27 11:25:12', '2025-01-27 12:25:12'),
(195, 12, '39348925a146d9e3b1bc7bfa1cb6f46dbedf9b4625d5286d22a2906a1be65730', '2025-01-27 11:26:06', '2025-01-27 12:26:06'),
(196, 1, '5d81ab8da8529da810de6bed619dce883e721a75a427166564b3bf6ca808ee0c', '2025-01-27 13:44:38', '2025-01-27 14:44:38'),
(197, 1, '7dfe314a19ace7285675f3a4eae1a4fd4367aa44aef738e2d52e5ae6230db505', '2025-01-27 13:45:17', '2025-01-27 14:45:17'),
(198, 1, '70080449f2a9602b3c4ecb07d057fc28432988e60f0126950176f447ac4182ef', '2025-01-27 13:45:40', '2025-01-27 14:45:40'),
(199, 1, 'd62c735d6259c982a6a76c9fb42dff95cc2786f2b5f2c25f69aecf13bd528f3e', '2025-01-27 13:47:13', '2025-01-27 14:47:13'),
(200, 1, '867d1383a8e3c72de3fe8593fc8ced57426fe6205ab6e4b43c7207a5355b8a9b', '2025-01-27 13:47:31', '2025-01-27 14:47:31'),
(201, 12, '9ca758404ad029029c8737c6efa49eda519d8ada9049e196a10afb64ee95ef9b', '2025-01-27 13:47:36', '2025-01-27 14:47:36'),
(202, 1, '064a21429bdd170c6bf21cb5038ed198ba8f876dfe46ec60634c3156ca4c8e3b', '2025-01-27 13:47:45', '2025-01-27 14:47:45'),
(203, 12, '3ce64222a1d6f607c49d12d5ab274a4ceed9125dca4bc6243f0feec06a6e7880', '2025-01-27 13:51:24', '2025-01-27 14:51:24'),
(204, 12, '32fce4a74af63a7fbd8de021746be652e4cf7ddc6cf29eea9dd192fd2fba48dc', '2025-01-27 13:52:11', '2025-01-27 14:52:11'),
(205, 26, 'f6350fb311485a7ef38137158bdabfbe31ba01f9f529d2e5f71e5c38867db261', '2025-01-27 13:53:12', '2025-01-27 14:53:12'),
(206, 12, 'f7b70001ce6d27876b47cabec72052f65f9be0b70cad20d97c83ba9eb08c9dcc', '2025-01-27 13:53:43', '2025-01-27 14:53:43'),
(207, 12, 'a5842221f1f20d561be9a2ff0c69f99ca24e395bea63be7decbc1df0344e0c89', '2025-01-27 13:54:36', '2025-01-27 14:54:36'),
(208, 1, 'edaa7521345d16c183038c8ab2a6b359d3c3feb5ad4e67a044d75269f2202f6d', '2025-01-27 14:15:03', '2025-01-27 15:15:03'),
(209, 1, 'efe02ae7eb5cc60182b160c29aec32cacc84ec0eb68cdb121801c0fda9d8f47c', '2025-01-27 14:15:20', '2025-01-27 15:15:20'),
(210, 1, '62a24ae334dae6df1fceb72f8e417060cf8ac49762169de353a14987ac975d94', '2025-01-27 14:17:02', '2025-01-27 15:17:02'),
(211, 12, '55717b4215e8940560ffef4c314ef7d3206ed33c0ffd90c1302cf9dd4f4d3eb1', '2025-01-27 14:17:03', '2025-01-27 15:17:03'),
(212, 12, '808ea1b02cd478d079890d420dcee6b14306d1436623a734705637216bc12f38', '2025-01-27 14:20:19', '2025-01-27 15:20:19'),
(213, 1, '5f6a798a7a91faa01e1b059ece3aec0cbaa7596ba873c3969ca9739008b7505c', '2025-01-27 14:21:22', '2025-01-27 15:21:22'),
(214, 1, 'ffef5d97f388e6d1f39080ccbdd1325326523c3db2cc6f57641962801d99798c', '2025-01-27 14:21:42', '2025-01-27 15:21:42'),
(215, 1, '6ada812d6d43b1ee2fda7b66080c91900ce3bc9be998d4982bda2a47f607c980', '2025-01-27 14:22:27', '2025-01-27 15:22:27'),
(216, 2, 'bcf2f08415a3b76f5b93b75e9ea78c4ad305fdb58a3e24cb269fbd9f4ed3333c', '2025-01-27 14:23:37', '2025-01-27 15:23:37'),
(217, 29, '0ac3a5e18a86c17d48d5fa84805528be7fee06f4e2479a4c4d7e3a9870574087', '2025-01-27 16:52:41', '2025-01-27 17:52:41'),
(218, 29, '828bf5670862bc6590bfd5a32fabf9ac18974d7e8b7bf2ab3354759170bab7f5', '2025-01-27 17:02:56', '2025-01-27 18:02:56'),
(219, 12, '7fcbcd833534a2de1d448d746fc7d48e21e3d00b8ca7f7617be00f67d8838f17', '2025-01-27 17:03:59', '2025-01-27 18:03:59'),
(220, 29, '1979be3a2818d2e916b78e93200f67934b46fe0c2f58e4ba1bd329db1283c479', '2025-01-27 17:05:43', '2025-01-27 18:05:43'),
(221, 29, '47c5139935fcc4c83d40a5b5158ba027c81a7ddf5000d1285337ec17c5d66562', '2025-01-27 17:14:25', '2025-01-27 18:14:25'),
(222, 29, '8a9fa3506f9d64e30df36e09e56212a4fef8ac87c75b8f62a5d150d1dddb4193', '2025-01-27 17:20:04', '2025-01-27 18:20:04'),
(223, 29, '086461b1ab717a69fe0fa8535a79c1f7445eec6767f4470622f89cbd65ce8d13', '2025-01-27 17:45:04', '2025-01-27 18:45:04'),
(224, 29, '6f7e503354acdbfce76b8c95cacca3b03b126dc3af60f6628a5c089393175f64', '2025-01-28 02:26:01', '2025-01-28 03:26:01'),
(225, 29, '53b2ebbcf1e7c020f22634c281c1b50f06c8c56aa29fd85e0edf6a3c2308f433', '2025-01-28 07:16:11', '2025-01-28 08:16:11'),
(226, 29, 'c077422d91a77773f07072abe3c734d238c605db7e680172b30c7a0774e8f959', '2025-01-28 07:28:22', '2025-01-28 08:28:22'),
(227, 29, '1d1f4fd522fa64ad44d157c56d89bd0af9eb673b4e9b34468be804097a038497', '2025-01-28 07:31:00', '2025-01-28 08:31:00'),
(228, 29, 'b3614b1bec42a4d600d79277262941a41b518955743feac087de2a6422a35384', '2025-01-28 07:33:50', '2025-01-28 08:33:50'),
(229, 29, '7feaeee0ca9fa9f0464de07092bf9366acd0d7a9e8e1894fb3df64c2561b5b07', '2025-01-28 07:38:28', '2025-01-28 08:38:28'),
(230, 29, '994f1cae46330e9668992f025841a2530c5e7be9059c20a52271733bfe21e939', '2025-01-28 07:40:29', '2025-01-28 08:40:29'),
(231, 25, 'ff0893dfb1ae79f3cca13986863079d268c85805c8496196f9297f6f9e97c3e2', '2025-01-28 07:45:35', '2025-01-28 08:45:35'),
(232, 24, 'f2968d5b8212a058a885035fcf695f91d839e45a32197e652599ca87887b59d1', '2025-01-28 07:47:55', '2025-01-28 08:47:55'),
(233, 25, 'fcf45d4cbb5443d76d7dbc13c27ecbcef6c81b7a11eec8884cb54547c18ffdb3', '2025-01-28 07:48:07', '2025-01-28 08:48:07'),
(234, 12, '4cf2edad2bd04efab0278af6e70e7531123bca677996db3f1f574fc8b4103057', '2025-01-28 08:49:58', '2025-01-28 09:49:58'),
(235, 29, '6eb2136b1a04074697f7d7d7dc9449fcd6310b6ee8a2bf1e0276a13302152447', '2025-01-28 08:53:15', '2025-01-28 09:53:15'),
(236, 29, '7172c629908499d3c6321a734d0d2fb6c1021225713f911f3fd0b94f7f0c1d5c', '2025-01-28 08:54:19', '2025-01-28 09:54:19'),
(237, 29, '77063ec33711da0ae76abf16b7914a22f3e8046b0a64c33a39ae58c4bb3438d8', '2025-01-28 09:12:26', '2025-01-28 10:12:26'),
(238, 29, '6a6eb868822645111baa387e143958c681e6e671be6f1d936df9abd18400d13a', '2025-01-28 09:20:29', '2025-01-28 10:20:29'),
(239, 29, '296f5c216721e6afbe09823546663f2c6740b5b774974aa73db0bd1775dca6bb', '2025-01-28 09:22:30', '2025-01-28 10:22:30'),
(240, 29, '1bc86e534b351dca9d77d84bca79e5f971e23835da9332d7a649ed9babf7d497', '2025-01-28 09:26:27', '2025-01-28 10:26:27'),
(241, 29, '903e49bd20676bc6f8d2e441827210527b0a83c2ba118262a5477c45897e4328', '2025-01-28 09:32:14', '2025-01-28 10:32:14'),
(242, 29, 'ba9b8c848ec7a7707c6b63e491c720a79211cb2364b1356edfd92bfe020aa1ff', '2025-01-28 09:33:32', '2025-01-28 10:33:32'),
(243, 29, 'd6246d591f30ef83f03945c44c16be573de3b818d67f51ac8b5e21df1b2bba48', '2025-01-28 11:08:18', '2025-01-28 12:08:18'),
(244, 29, '002f52b722d6f59b7b823b3bc2adb5268f997023d43f766262655b3dd1f4102a', '2025-01-28 11:30:54', '2025-01-28 12:30:54'),
(245, 29, 'f453baa31f0a9cc2e8a5d49a452e4ed5acd99f5f771c2953af69a80a601ea2e0', '2025-01-28 11:37:35', '2025-01-28 12:37:35'),
(246, 29, 'ff3e7025af6394d32bb0e2607289febfb151333664e54a73880f48cae6a79421', '2025-01-28 11:41:24', '2025-01-28 12:41:24'),
(247, 29, '1238e15b52b54ef536bed1dd922d178e8912a067df2657a99c2750dfe1bd26eb', '2025-01-28 13:44:54', '2025-01-28 14:44:54'),
(248, 29, '275cc76761a00bdaa7c9f60259a7b079d00655fc2171e1ebfc50d1dc31e8e164', '2025-01-28 13:47:14', '2025-01-28 14:47:14'),
(249, 29, '482cd00ed13f474364ea648d5a6eafac9e6f2addfdbc76a839ca97655a4913a7', '2025-01-28 13:52:33', '2025-01-28 14:52:33'),
(250, 29, 'e51948aa28ae6b1fee6263293193c7676da9a3fbcc7ec1f46a74736281c6ede8', '2025-01-28 13:53:49', '2025-01-28 14:53:49'),
(251, 29, 'e93daa040f77c718afc67b9c6c1bc2c81de0634ec67ccea907567157d4df935d', '2025-01-28 14:00:54', '2025-01-28 15:00:54'),
(252, 29, '2d4444de073e4174aad596d425c279b2a42f15e8f244ec94b7c1ac22f36f53bb', '2025-01-28 14:07:06', '2025-01-28 15:07:06'),
(253, 29, 'cd3739bcbd4ef617050f969e4f73395bccad06d52922c75ec076c07b2a2a2d65', '2025-01-28 14:11:21', '2025-01-28 15:11:21'),
(254, 29, '80d86fdac1a0104bb7dc6c8e037932713868fa0401da06124561d2ac5031252e', '2025-01-28 16:04:51', '2025-01-28 17:04:51'),
(255, 30, 'fa9382b8909cf8d1747f1f542a8392214f08e20b3b8f080fc9b97a5ddbcdce49', '2025-01-29 05:14:04', '2025-01-29 06:14:04'),
(256, 31, '20aceb674f5c31a322a90c4fb9ad29d808cfc2021aa1e0ad51bde8e04678ec7b', '2025-01-29 05:24:04', '2025-01-29 06:24:04'),
(257, 30, 'dca24b4668abc648751471e9383f7639a5f6bc0072a7031ba6c7e2298ee09958', '2025-01-29 05:25:04', '2025-01-29 06:25:04'),
(258, 29, 'f1cc477aa7139caeae22454144bae099aff7bfb0c7d5871a494557292e8cce14', '2025-01-29 12:54:07', '2025-01-29 13:54:07'),
(259, 29, 'df029767914ad4d7eb0e17584b8be7bc96b53e492b3fd1c92e182430116a2156', '2025-01-29 12:57:40', '2025-01-29 13:57:40'),
(260, 26, '9b0ca12d29412508db57fa832ad16fc4f1ea65de4b122961884c98006f494899', '2025-01-30 07:48:50', '2025-01-30 08:48:50'),
(261, 26, '5f93633001ab7c857c9cef727e135670e0c8561a9891874227cd1d9b3601ee66', '2025-01-30 07:49:37', '2025-01-30 08:49:37'),
(262, 12, '3c033c7eda7de947ea2797a9c7dfea3957beefc40d0ed048fcd132c092b44ed3', '2025-01-30 07:53:16', '2025-01-30 08:53:16'),
(263, 26, 'c56ba490f1055a82bcf1d76fa7e55e70fd304da1c520162832f6b7dc48d090a5', '2025-01-30 07:53:59', '2025-01-30 08:53:59'),
(264, 26, '804de2f759f4aa56c91f002ad1ad819ab672d38d3641e7d669b2a19f3d746d9a', '2025-01-30 10:05:18', '2025-01-30 11:05:18'),
(265, 26, 'b3b3e7612313f203a77590587505aa587fda87bd478d4c2f9a6b3d1147ea6000', '2025-01-30 10:06:45', '2025-01-30 11:06:45'),
(266, 26, '6f98c4eb1a01c9c161da770b47da79c42b833154aea17649c7925d6be767c352', '2025-01-30 10:07:53', '2025-01-30 11:07:53'),
(267, 26, 'f0091d7f9c62f316395fd96fb74e84f6183295355b2af88f044ea54ad3df4a84', '2025-01-30 10:10:25', '2025-01-30 11:10:25'),
(268, 26, '2950f15154a415edb23d4f983dc3dce992a2acbcd75946e772382e698bae365b', '2025-01-30 10:12:09', '2025-01-30 11:12:09'),
(269, 26, '7fbf34d33530fdf8c17b92ca10c530113c5921074e407391f49927aa009b86f4', '2025-01-30 10:17:26', '2025-01-30 11:17:26'),
(270, 26, 'c7fd281433cc31f84e90b6927d4afa6df87d8774e76ef0f808ed1459ed5fa644', '2025-01-30 10:18:55', '2025-01-30 11:18:55'),
(271, 26, '66df4ccd53462bf4c2c00328738c46a0625d0cf3d74845fe24ef2223923aa65a', '2025-01-30 10:22:47', '2025-01-30 11:22:47'),
(272, 26, 'e3df3d4408882b6d52a68192b8f551687f46f93e3ba125d738ba0f88763639e0', '2025-01-30 10:31:08', '2025-01-30 11:31:08'),
(273, 12, 'd155f6d1d113eaf66446c0901773908ad6848d1edf10d2c2090c2df45df088fc', '2025-01-30 10:38:56', '2025-01-30 11:38:56'),
(274, 12, 'e019af6f387e06ede96929200480b49142d43a25ac8f5e47e78d30df4cdd9860', '2025-01-30 10:44:06', '2025-01-30 11:44:06'),
(275, 12, '64c65708856d185d3b5f427cb34065a9864aa845ee18bd492b006901e7128d9b', '2025-01-30 10:44:15', '2025-01-30 11:44:15'),
(276, 12, '5e732dd576cb94802e034264bc3600a18768d3cdb0f9a587c743b0f2fb062ea8', '2025-01-30 10:46:31', '2025-01-30 11:46:31'),
(277, 12, '60ed4af4fe87ddc667c928331902e282f55043694ce70933353ba95da7345949', '2025-01-30 10:48:22', '2025-01-30 11:48:22'),
(278, 12, 'e475092fc1b615b366e0b4408acba29dbd1d386a39665d65d60fbdcb7fec51fa', '2025-01-30 10:48:32', '2025-01-30 11:48:32'),
(279, 12, 'e0bda124923c105a51165172f84fa3f7dc3aebafb4cb83cb1e107bc446bbcd2f', '2025-01-30 10:48:44', '2025-01-30 11:48:44'),
(280, 12, 'df06e3d5ce3fcb388825877228c551828dbac3648d29ea1fed5f03abe080d803', '2025-01-30 10:49:20', '2025-01-30 11:49:20'),
(281, 12, 'baf3e777b56fb2a6b7e9749082de4fb3bc6a1cf72fc9e9dbda13924c8c225ab9', '2025-01-30 10:49:39', '2025-01-30 11:49:39'),
(282, 29, 'd0cc8a7a982245e7ea657b46637acc34ed03e315b03647fdb6ed908cbdea0759', '2025-01-30 10:55:26', '2025-01-30 11:55:26'),
(283, 29, 'e6e275b653862d2c2cc859cc5cc8117d110fe0b76c190e88a2d95ce2a8520220', '2025-01-30 13:40:21', '2025-01-30 14:40:21'),
(284, 29, '992bb8049fc148b41993c6934329ca8a0ca8839b9a412c32ce328d539568532c', '2025-01-31 05:59:28', '2025-01-31 06:59:28'),
(285, 29, '5fa76155a5616d6fb84560e1a5be5bef22ac0df6a56c0894b7d9946e0be82b7c', '2025-01-31 06:00:01', '2025-01-31 07:00:01'),
(286, 26, '9dd4b56472cbf8001101eefeb44b91f5b951017d37a9f16b67c37d36db8c3379', '2025-01-31 06:05:19', '2025-01-31 07:05:19'),
(287, 6, '3e0abc1f733b1bc11e64c2794f4e3d16313db311f813ff2bda20be51e5f1c92d', '2025-01-31 07:35:52', '2025-01-31 08:35:52'),
(288, 6, '70fa6dff8f2f7592e2fac23a94bf35b07c4027214a57f6b0bb0e8b912b7ff9b5', '2025-01-31 07:40:32', '2025-01-31 08:40:32'),
(289, 18, 'a0f4fcaf16beba2aed3fe50d99535214786b65c9f515e47a8a5f8eef6810b149', '2025-01-31 07:41:41', '2025-01-31 08:41:41'),
(290, 29, '9f55c6755a9528c48576ec6db36ed5c90a9b4f66fcf4ca3c0635e1d0ded50897', '2025-01-31 07:43:27', '2025-01-31 08:43:27'),
(291, 18, 'd77f7530d4f2003192d7252059ca19c09a38a3a0ee6efa26dec092019d23d575', '2025-01-31 07:45:23', '2025-01-31 08:45:23'),
(292, 18, '44791791eea290f456a212e3b51750fcd3c7a23a55c80dda8858b147102385cd', '2025-01-31 08:11:51', '2025-01-31 09:11:51'),
(293, 18, 'e8cb8114e6cd015e35adf3129e9af39a138534a6c38e2c9b30fb8d297791781a', '2025-01-31 08:13:06', '2025-01-31 09:13:06'),
(294, 18, '18058dc2345dc5c0ee647a077cd6c6107d7e0d23c111f8a0c43721e4c2830f29', '2025-01-31 08:40:12', '2025-01-31 09:40:12'),
(295, 26, 'b19487747d23e44545902a449b5e73610ae380ec32c5809f9cce113dcf3d78f8', '2025-02-01 14:00:19', '2025-02-01 15:00:19'),
(296, 26, 'df9e4e50bb8774aec39ffa19aa739198677950d7f59751640b4cbf48e9a1f5cf', '2025-02-01 14:25:09', '2025-02-01 15:25:09'),
(297, 29, 'e91fd1848f512dec2ce9d067303eb428db050a3b9aa75217f1b0891bab31c8ae', '2025-02-01 14:26:22', '2025-02-01 15:26:22'),
(298, 6, '8e2d8cce2b53b0f326a751bd0654f216c3c185583b85bd57db52aaed678690f6', '2025-02-01 14:29:06', '2025-02-01 15:29:06'),
(299, 6, '0b08d18dfe4f8c9774b38874bf770003e5170cd7af38ea7c24050063e1aec585', '2025-02-01 15:52:25', '2025-02-01 16:52:25'),
(300, 6, 'ff65dd8f7efce1827736bff76d47b0cdf24ff1cd4e6fc74c22fc4594e0005c71', '2025-02-01 16:10:37', '2025-02-01 17:10:37'),
(301, 6, '3ecd8f1c3bf7e0679f605acec9a7b6a626f49d1c91b1c93c43e6348d703b6d7b', '2025-02-01 16:27:52', '2025-02-01 17:27:52'),
(302, 29, '2f82d8b3f7f67bf3aa1ad9d075fc3fcbe44230c5fa339565285f11dd55997dff', '2025-02-01 17:14:44', '2025-02-01 18:14:44'),
(303, 6, '182b8cea81469f5d80c00782c2e30a7484e44ed5f5853468d2d55821ea732f6b', '2025-02-01 17:17:00', '2025-02-01 18:17:00'),
(304, 6, '291723d9811b26fc05d415f87b45d81388054f25347e4c0a343381eec2b2d3d5', '2025-02-01 17:55:47', '2025-02-01 18:55:47'),
(305, 29, 'e3fb5e21ea3920ad9665866b9cd7799a209a4e91d8dcdab488966ad4a20478ed', '2025-02-02 03:55:18', '2025-02-02 04:55:18'),
(306, 29, 'f76653df383c39fd4fa1b19d3ac8913cd2e5a19584828c860b7171660ac855db', '2025-02-02 03:57:13', '2025-02-02 04:57:13'),
(307, 18, '9b841ee6a758f2d921b46fbe07560a90abfe5041c5c1130790e7d5911ce708b0', '2025-02-02 04:00:02', '2025-02-02 05:00:02'),
(308, 18, 'b1ff7af050cea348f4b6d80eefdc213e72ec7f667ff3eabadb674ece12107f64', '2025-02-02 04:01:48', '2025-02-02 05:01:48'),
(309, 29, 'c71e2fd0e94ac2e1bffd01673bbe5b49e075669662103836c00ff321adaab9e5', '2025-02-02 12:03:23', '2025-02-02 13:03:23'),
(310, 24, '29b2e0d6b2960e292906f1a345f67ab0c188a05a0696ad79115571283722e5dc', '2025-02-02 12:20:16', '2025-02-02 13:20:16'),
(311, 1, '9a51f934fe5fee06044d3b06edc3e1f5dbc454385aca1c3e793f53a866056ea6', '2025-02-03 05:42:08', '2025-02-03 06:42:08'),
(312, 1, '2c22b78c8699f95f03ad0f552b74bd5760d8e827879a43b5335231c27e417931', '2025-02-03 05:43:05', '2025-02-03 06:43:05'),
(313, 29, '0718c6845ebbcdfc03107df91184bb0d8a5e69b43d44ae4e6603fbdf6d2a1b78', '2025-02-03 05:47:44', '2025-02-03 06:47:44'),
(314, 18, '63cae5937a23e7411d2b1b56895276fe776106fd21696ac86d040e16167160f3', '2025-02-03 05:48:23', '2025-02-03 06:48:23'),
(315, 18, '9944d6ef3b04239bfa22b9010dcd97f8a57b13e0828854e79a3f7cc7fe109751', '2025-02-03 05:50:04', '2025-02-03 06:50:04'),
(316, 29, '4b63fd588a17e33003585066b8a1645fe2053a3ec0469f11f9619eccac0bf641', '2025-02-03 11:19:13', '2025-02-03 12:19:13'),
(317, 30, '5f14711757b5ac2a6d92f53a91003dcf0647d45acb84e285f654c25e126bc6a7', '2025-02-03 11:42:55', '2025-02-03 12:42:55'),
(318, 31, '7a99a2d45aaeb8d16ae3c40d3218eebce286993f7959f0d1ca1fea9ef0de8314', '2025-02-03 11:44:15', '2025-02-03 12:44:15'),
(319, 30, '1fc725a6015f86c7d8797c40bb9893ccf1cc4573275f3be948fed63679aa3492', '2025-02-03 11:53:13', '2025-02-03 12:53:13'),
(320, 30, 'a8cf587af7b654fab824f26c97bce8a04b3fe54b46838d77bf303c3a0e48ba6e', '2025-02-03 11:57:00', '2025-02-03 12:57:00'),
(321, 32, 'cc78fe009f069d4f8ba29a4e93c96f52103962de25100b9184a88c66ab3d9c1f', '2025-02-03 12:00:20', '2025-02-03 13:00:20'),
(322, 32, '3dc057784548f44e26fb1b0180930b4a31750efedbf8922012a3e6161aeb5b42', '2025-02-03 12:02:09', '2025-02-03 13:02:09'),
(323, 24, 'e29af2355245db9c061f56dceb0aaa710c844e5353bbf21914525472cdea59bc', '2025-02-03 16:46:29', '2025-02-03 17:46:29'),
(324, 18, 'ea0a4e0f41859e1e57a8236ff99e39039467d3561ce5c61ef9793e58b8de6f54', '2025-02-03 18:35:27', '2025-02-03 19:35:27'),
(325, 18, '516ba2f951823d06346d63482d8e55dd3d4a936319afa6ee6667d1a2602f13a0', '2025-02-03 18:44:36', '2025-02-03 19:44:36'),
(326, 18, '92a03e8c6692c52aef130f7cda6ef5f4b27aab334b0d0f7f55a823358bf04751', '2025-02-03 18:51:34', '2025-02-03 19:51:34'),
(327, 18, 'b7a52dbd7fcbd640d352009e5d921e98172134dc14883ee5abbdf943e983db62', '2025-02-03 18:52:47', '2025-02-03 19:52:47'),
(328, 18, '098770b0eb416908c1f466a912bb37d353068f4daf9b5b0a776dc2b064c0cc67', '2025-02-03 18:53:06', '2025-02-03 19:53:06'),
(329, 18, 'e44b55c11b399028b16260bfb11d537f1b150a1cfbce05a487668d1b8f2cea5e', '2025-02-03 19:05:48', '2025-02-03 20:05:48'),
(330, 18, '28d2aeda77879165a944f29923216dfe1bce3f698c17cde22cd730662a64cfae', '2025-02-03 19:07:10', '2025-02-03 20:07:10'),
(331, 18, '9fb3a834252b1e937c932587558d16f54608b74c8778fd73ba7ea2701f552645', '2025-02-03 19:13:39', '2025-02-03 20:13:39'),
(332, 1, '13cffe3d458f09541d16cc5f84c2fd40a8466a1dc44c6c3b6605679ec097772d', '2025-02-03 19:28:38', '2025-02-03 20:28:38'),
(333, 18, 'e82097e5d4d1ba133e6424cad1ab6063e2a36cb5e7cc239c5385396789d2c50b', '2025-02-03 19:31:24', '2025-02-03 20:31:24'),
(334, 29, '4aec700ea8f32a7a2be9786b7ea313b6f5722c9c15cf3d81f62b0102713c806e', '2025-02-04 05:09:05', '2025-02-04 06:09:05'),
(335, 32, '7a429a0b9e96d8c651185ed16181cd677a27991dbe8c4be95f1b67b1860e5f00', '2025-02-04 05:09:27', '2025-02-04 06:09:27'),
(336, 29, '24f947c51c76b10bd52e6e3a95c8e23d5915c19e8a9dfc5ac7f77d8707ee4c68', '2025-02-04 05:10:56', '2025-02-04 06:10:56'),
(337, 31, 'c42a59450a4442616006fba110f933b9d769e2eb2c057bb1a8b35e9599a97d91', '2025-02-04 05:11:59', '2025-02-04 06:11:59'),
(338, 29, '2fc202abb715685d0bc06deeab876fbef35cf1f639665e66338dc5ac8dbfcdb2', '2025-02-04 05:13:48', '2025-02-04 06:13:48'),
(339, 32, 'f4f6bc6a1d4eaf5fd112e11fa47eb39151881c520ca0572d33d5d55aa8f62142', '2025-02-04 05:14:28', '2025-02-04 06:14:28'),
(340, 1, '99fda2b292ed10c8ff4064382e1aa5e3d4828309b7f8f4cd1d6927dd82df5480', '2025-02-04 06:47:01', '2025-02-04 07:47:01'),
(341, 1, '594950afcd546e686d69e57ffcd0a4faea744b1de0c2a00ae24cb3edc1409cb0', '2025-02-04 06:48:33', '2025-02-04 07:48:33'),
(342, 1, 'b58fdd29e6dceebcb1af3a69eea9e33f43a9e27c8b8b8b039162a4d7232b64fc', '2025-02-04 06:50:40', '2025-02-04 07:50:40'),
(343, 1, '5381d03ae64794995e75f357bfb3a7c1cb408aeb2bc7bea7c9418e938ef2ca4b', '2025-02-04 06:58:47', '2025-02-04 07:58:47'),
(344, 18, 'f22c650fc1ffd4a71f27777699b6ed2deaa2d4fad71fb5ddac968baa55738300', '2025-02-04 07:07:36', '2025-02-04 08:07:36'),
(345, 29, '817ae2952ac6e871ba90ff85760114759c18a23ddfaf9ef2a1ef875455691e14', '2025-02-04 07:09:47', '2025-02-04 08:09:47'),
(346, 18, 'e7e8fe3be20dd49f9e8ec527611f84e61af82dcdf6710ecfa6700b22298a6463', '2025-02-04 07:22:28', '2025-02-04 08:22:28'),
(347, 18, 'c17f3484508de311fe03c10494562330de10f08edb6dff3d60291b2362efa9fb', '2025-02-04 08:05:09', '2025-02-04 09:05:09'),
(348, 32, '8c29c59345eca89937cec49d9c4770b13e9c190004877551ad7bb2a8e97d804b', '2025-02-05 08:03:42', '2025-02-05 09:03:42'),
(349, 30, 'e9ddc17f98a3f4370abf5e26e923c0bfa8d075f8a45535d981fcaa791c97525f', '2025-02-05 08:05:40', '2025-02-05 09:05:40'),
(350, 29, 'afeffa6ec8c877743b629d986c97d8e590c46ec26702fc937e9e6a474c6c14f6', '2025-02-05 08:15:32', '2025-02-05 09:15:32'),
(351, 30, '0894a8b4dd32de4feef9b92a4f95716885700753eea7278f6fd31467f9e5bb36', '2025-02-05 08:23:51', '2025-02-05 09:23:51'),
(352, 31, 'cf98b7f890ab719f6afb8a9b846141f29675a78766cb84c00e166df59278fe37', '2025-02-05 08:24:53', '2025-02-05 09:24:53'),
(353, 28, '3512efae76436f531d3c2a587518c987d09e7dbb5de006136a7978ac31019365', '2025-02-05 08:25:25', '2025-02-05 09:25:25'),
(354, 32, '818ce45f28ca73df550aac3bf47ebd4d08601c2878394c64512a2fddf7e8e104', '2025-02-05 09:03:07', '2025-02-05 10:03:07'),
(355, 25, '0dbcfda00fd8ce82fb5b11355161c182ce469aeac60eee254ca77d908f6dbf7c', '2025-02-05 09:34:41', '2025-02-05 10:34:41'),
(356, 24, 'd9e1be94d3d6d869ca8aea6faa63a22b566379086ff82ca6ca40c354344b304c', '2025-02-05 09:34:59', '2025-02-05 10:34:59'),
(357, 18, 'ecfb391b4b81d4c90f40bf0b3c3f306e3aef0fa6894b29ba9e435aabc3dfa937', '2025-02-05 09:43:55', '2025-02-05 10:43:55'),
(358, 24, '67a089813c28cb07c27dfdd633f0490d7b3a541a5f0b662668b365bdfa0a178c', '2025-02-05 09:43:56', '2025-02-05 10:43:56'),
(359, 18, '5a1991b0b164495e31cedc1622d0a338169e4bca1485eae511ccf498f930b35f', '2025-02-05 09:44:27', '2025-02-05 10:44:27'),
(360, 24, '9f24f821b22a2928765068e9eee6addcb9bdacf533381a2c89ab8d18607b01e1', '2025-02-05 09:45:24', '2025-02-05 10:45:24'),
(361, 18, '00d12e35f1aecd72744bfedb3af0332c2e81e93694e3f5e3828511028599429e', '2025-02-05 09:45:33', '2025-02-05 10:45:33'),
(362, 18, 'ff5ba5012a7d2f83c186c72c4e72c07bf440c326b1d12c6abe727fbaec446008', '2025-02-05 09:45:44', '2025-02-05 10:45:44'),
(363, 28, '6491a16576f4b8dbd15058a48ce4c61ebf100ab65dfb2933ac6dc07d7593286d', '2025-02-05 14:43:21', '2025-02-05 15:43:21'),
(364, 32, 'cba725739079bbfb3d34c5db9f8d6bf3436786da93974e6ebe37413c11576ebf', '2025-02-06 06:34:36', '2025-02-06 07:34:36'),
(365, 29, '5edc7d0ac5e3fa4e18dcf3d66d3281315ccf09b5c89b841eb866076306425f7c', '2025-02-06 06:36:24', '2025-02-06 07:36:24'),
(366, 31, '00f6f78867d4ffe9ce17eba4930701f6a1ab4bdb3049c09c38b2bda919a5c6f1', '2025-02-06 06:47:15', '2025-02-06 07:47:15'),
(367, 31, '2714419d00f6c366f970013afdd536de8be1feff57c5f6625234f2d572a9ee77', '2025-02-06 06:47:52', '2025-02-06 07:47:52'),
(368, 29, '45ce969ba569e3b80fb3a97dfaa4655ae575258a9f0e16f142530f5a636d563d', '2025-02-06 06:51:09', '2025-02-06 07:51:09'),
(369, 1, 'd7ef5c06ef6d29413d1a1910e025647411d987f9d0aa130f916ba8dc16e6df63', '2025-02-06 11:21:24', '2025-02-06 12:21:24'),
(370, 1, '4e7bd87b20d84221925affaa359628e5786fe33f48ee9e13e711cf965c84bd87', '2025-02-06 11:24:23', '2025-02-06 12:24:23'),
(371, 1, '44dd4a6f1b4ef1cdabad981d22d6a9b5897cd72c4975f3d7dd57b32db53995e4', '2025-02-06 11:30:15', '2025-02-06 12:30:15'),
(372, 1, 'b7434bc9641c0318e003bd1c3f0cc492aeeb56ec7a2c6e8977d722991a7b8108', '2025-02-06 11:30:57', '2025-02-06 12:30:57'),
(373, 1, '5e600d43edcc5401f8dd532f102c8d6aa2b180a39ffb09123f9367ba292b400c', '2025-02-06 12:15:46', '2025-02-06 13:15:46'),
(374, 1, 'e38a8c0d8f75ebbd27222912afc84d2eab78d29599c3c61e958463d2bd567fe2', '2025-02-06 12:28:37', '2025-02-06 13:28:37'),
(375, 1, 'a4e77055c7b7feaeffc90b257fd821064f5f71dc38b1d5c0626ef38e3f06b3aa', '2025-02-06 12:30:12', '2025-02-06 13:30:12'),
(376, 1, '88cb0b171445e29e1b03365d46c70e8fbae376013992aba3c781a16df9f8fdbd', '2025-02-06 12:32:24', '2025-02-06 13:32:24'),
(377, 1, '3a13eb071a2fe055ee469ff49beb6ea0577fc9e419e1b34648b363df5cb1793e', '2025-02-06 12:32:30', '2025-02-06 13:32:30'),
(378, 1, 'd6ef779c8cc343e0ff2c2a6ddb4290d215c36e2291aaf87371a40da226d4b3f2', '2025-02-06 12:32:48', '2025-02-06 13:32:48'),
(379, 1, '2569a5c3be1c24d7e8426f35f020ad7eef951950a05a032481f46296ab3a9496', '2025-02-06 12:33:00', '2025-02-06 13:33:00'),
(380, 1, '61c331236e1dbcd141f6b05b9b9cf416fb981d065e6a7b233b545c6f33e696c4', '2025-02-06 12:33:10', '2025-02-06 13:33:10'),
(381, 1, '7f9435da2a8d12dcf41fe8451ddf25fdf93bc1030fea27c2b2f840f69be42cba', '2025-02-06 12:35:59', '2025-02-06 13:35:59'),
(382, 1, 'efa55abc276c8cf6109111db1b3715041f10fe14112a071934ca0a0e7fe60b74', '2025-02-06 12:37:13', '2025-02-06 13:37:13'),
(383, 1, 'a4bacadbeeec3621626847b17daca072e2d0b2a72bbf61b77e9713106d8ca245', '2025-02-06 12:39:00', '2025-02-06 13:39:00'),
(384, 1, '1fcbdba9c6c122c58d5b4f3106f2737609f8c2486f49214a1b29ed3c40c06a84', '2025-02-06 12:49:24', '2025-02-06 13:49:24'),
(385, 1, '4b06f0af9a9374f7b26a6492e0563d40ed62aeccec65e6971d8e8f4aea5b7c54', '2025-02-06 12:50:13', '2025-02-06 13:50:13'),
(386, 1, '39aeee8528609d7adcbb9dba1466a9135ace1356a117c2cd6fa41d1944098624', '2025-02-06 12:50:44', '2025-02-06 13:50:44'),
(387, 1, '4f5f8ef4a672d36e18049508f71cf3361bca4973687a0559adfce07060d7c497', '2025-02-06 12:56:29', '2025-02-06 13:56:29'),
(388, 1, '8500efe2eb6c37005110dd775e83633eb4a44198ab279ae70f2c57a9cb0f0a2d', '2025-02-06 13:14:43', '2025-02-06 14:14:43'),
(389, 18, '74fe43a25841b6eae15d4742bc0c4492c193c3b5bc36d58a510ab07cc48594cf', '2025-02-06 13:15:15', '2025-02-06 14:15:15'),
(390, 24, '3cd43404101ec8cf4a8bc02e019676066aa733da0afeaa58e41e59c4d92178c8', '2025-02-06 13:44:28', '2025-02-06 14:44:28'),
(391, 24, '1709e2c2c214252881235bde7be205399540ac5e12ba6e132d13f51202225e44', '2025-02-06 13:44:45', '2025-02-06 14:44:45'),
(392, 24, 'dbd8194b6804d7b5bc780c4fef330f0031f80fb82703d225bd65d0511dc5e77d', '2025-02-06 13:46:29', '2025-02-06 14:46:29'),
(393, 25, 'ba6f9a93eb43863dfb66281e2eca36f162f22b0b6c75957a38c96021095b678c', '2025-02-06 13:47:11', '2025-02-06 14:47:11'),
(394, 24, '929d97cf9a25ecac0ce0919f7194ea8e5e0fcc245234defe2ed60d42c199bd5a', '2025-02-06 13:58:34', '2025-02-06 14:58:34'),
(395, 1, '740712a3c57bb09e1b5a008b1d7d2b5b5e8c263d6926e7d49f69fb214c613e56', '2025-02-06 15:00:19', '2025-02-06 16:00:19'),
(396, 29, 'b6048d7c792568b67f13fadd6c4819f110e874a1170f8402456e012e3d998fdb', '2025-02-07 11:15:00', '2025-02-07 12:15:00'),
(397, 1, 'd8bdb626dd2c0b08f5afd6092d57de77b70e320f912d9d04670b8796b0da2303', '2025-02-09 17:43:06', '2025-02-09 18:43:06'),
(398, 1, 'db268ffb811a52f5844e16481c393e34b4dd9e91705ca9bb722b714ecc5b4401', '2025-02-10 03:18:14', '2025-02-10 04:18:14'),
(399, 1, 'acc1f36ae6c605c5416355cf7ab191ec5afc360a9fbda13e911a535089bd614a', '2025-02-10 03:18:47', '2025-02-10 04:18:47'),
(400, 1, '4ced50498ee4fafeab938ba252b365752b3043f4c45fc8f75eb22d8fc35260dd', '2025-02-10 03:25:19', '2025-02-10 04:25:19'),
(401, 18, '96648161bd4d42cdce889b981f21ff123d250e3de5db34056eab01354a7292b4', '2025-02-10 03:26:18', '2025-02-10 04:26:18'),
(402, 24, '1597de717715ca72ea589abfeeb3e45ccb9aaab2cdcca5a972b75bfa2f277c24', '2025-02-11 09:32:06', '2025-02-11 10:32:06'),
(403, 24, '51770dcdf66cf2d59ab5044ad5a2a3b12b915606a02f2dfada55f9952a1d6785', '2025-02-11 09:46:45', '2025-02-11 10:46:45'),
(404, 1, '6a4c76b1ffd3bdf94653dbc1a57edd34bb458d1d8f372e4420f60c370a019673', '2025-02-13 14:39:11', '2025-02-13 15:39:11'),
(405, 24, '1b3aa6420a6b7135cbbd01362e75482d6fd52ec95a1cd3486ae1b5845b12cfc3', '2025-02-14 06:14:13', '2025-02-14 07:14:13'),
(406, 24, '81246b860430b012f1f29c663d4643ceb294d4ac55a1a516466e4d7a743bac27', '2025-02-14 12:11:05', '2025-02-14 13:11:05'),
(407, 24, '1a64f0e84ee8c969118efec34c7d3902fa34637b0c3b806f7f6097fa363d79c2', '2025-02-14 12:12:27', '2025-02-14 13:12:27');
INSERT INTO `tokens` (`id`, `user_id`, `token`, `created_at`, `expires_at`) VALUES
(408, 24, 'cdcb45b5bab9b6d12d7cd2da3c4902319a895d4bfe2a2aed455f6b76e6d3473c', '2025-02-14 12:12:52', '2025-02-14 13:12:52'),
(409, 18, 'b38e0732bb1b3afaed62f50ed7353cdf609338a7a6163123d3d7aa93189c818a', '2025-02-14 12:16:20', '2025-02-14 13:16:20'),
(410, 18, 'a1a4652ad23060cd3f802be539f01cebbb97bbad68e7c6c6be2a93c582a7cfae', '2025-02-14 12:17:25', '2025-02-14 13:17:25'),
(411, 1, 'a16cd94fc73ec8f00465ffb1293889727b1f0e2a6ed505595db698e1a16ea54a', '2025-02-15 06:39:39', '2025-02-15 07:39:39'),
(412, 18, '9f8fef7f13b1540ea24034ed286db635d2ba3b468514c0f826c1ef0ccdce6af5', '2025-02-15 07:01:48', '2025-02-15 08:01:48'),
(413, 29, '329113f0d5fa9bd8711c28cc8daee9c28f5c6f004ab516c45fa087ee5224ff6b', '2025-02-15 07:36:43', '2025-02-15 08:36:43'),
(414, 1, '3f2e2ef594744ee1a52b4e1a6a6ad51f1fb38c16fe8a1695533b43d9b2af0c7e', '2025-02-15 07:50:23', '2025-02-15 08:50:23'),
(415, 18, '815ec43354cd55fd76bc2e752fd40a910ba0d217aa874f515bba7bbc9c97bd18', '2025-02-15 13:44:54', '2025-02-15 14:44:54'),
(416, 18, 'e3a86dd5d68b417a55ed462df5d6d801f290bffc5ca74a55dc568aa998673a61', '2025-02-15 16:04:22', '2025-02-15 17:04:22'),
(417, 18, '0382743fab8f47f711a6184c092cc235627e1935a7d688762c2b788ed783428e', '2025-02-15 16:32:08', '2025-02-15 17:32:08'),
(418, 18, '7c45fb9bbe221632af6ea6bd4c09e4322c19d859e8cd3956f032eadb2d980f9b', '2025-02-16 07:13:51', '2025-02-16 08:13:51'),
(419, 1, 'e7e542507777d2cc8b6eef054f33a15ef880596e26df60ade43df7c02f35409f', '2025-02-16 07:14:44', '2025-02-16 08:14:44'),
(420, 18, 'ae69e916afc79ee16b3e3aef569332973351fc9c14cbca481bbcfbe7944f92c1', '2025-02-16 07:16:21', '2025-02-16 08:16:21'),
(421, 24, '8362e6c728543ed5506e82ddbf279745d923ba3766131d868fe8969aa983024c', '2025-02-17 07:25:50', '2025-02-17 08:25:50'),
(422, 24, 'bd05f6c085adaf529b6e0e72403b093ce09d0174addddaa86737b571f9d93842', '2025-02-17 07:56:33', '2025-02-17 08:56:33'),
(423, 24, '0b32d268e57859526a4779f8d0c877d4fc725e6f8fa1a6adf71284077cb0446d', '2025-02-17 08:48:29', '2025-02-17 09:48:29'),
(424, 18, '1b246a636daa47eb9b40b4d45f0753c64f115831bc4b788c0246b2aa1c46bc9d', '2025-02-17 09:06:52', '2025-02-17 10:06:52'),
(425, 24, 'd4682655cf3af408ab6134c3d61b4926a91e89472fb168107937463c3f9bdb9b', '2025-02-17 09:28:32', '2025-02-17 10:28:32'),
(426, 25, 'e64e4a09c5a1a2d000f8cc0b45bfca845eaf98640714cc6710214c496361e8a9', '2025-02-17 09:30:40', '2025-02-17 10:30:40'),
(427, 24, 'f9110b4d56c47f588a8561290421b4e41d0c98a0049c57271bb12445cdddfc2e', '2025-02-17 09:36:40', '2025-02-17 10:36:40'),
(428, 1, '667f1c9e95551d79921be85bbd80d7a6496ae0105620387a23e4dac286a1a800', '2025-02-17 09:41:02', '2025-02-17 10:41:02'),
(429, 29, 'df6b607654d6d60bdc0ff7e6ede5f2274abfb4def81bb5bd53d71231e17eb31e', '2025-02-17 09:41:45', '2025-02-17 10:41:45'),
(430, 18, '9610e668862c176c4494403f966c28f88e2449dda9e17a59a465aea7dc825dd5', '2025-02-17 09:42:12', '2025-02-17 10:42:12'),
(431, 24, 'a903babae5905c712649822e1cf78a48b59afd333fc6a94ae6ed8bda201811fd', '2025-02-17 09:44:26', '2025-02-17 10:44:26'),
(432, 18, '0cd2e19cdcd4cf7b9947deb4153ea11cef108df1c8ee52cac0361b3ecee78ea8', '2025-02-17 09:46:02', '2025-02-17 10:46:02'),
(433, 18, 'ab3e75982217098908fa2748d9faf5da63d36e9360b9608c57635eeb858e1a78', '2025-02-17 09:46:12', '2025-02-17 10:46:12'),
(434, 25, '78d2fb0e6e2b2db03e55245ce522f0c9194565cdeebb8cda0f68c8cc698a3aa4', '2025-02-17 09:47:33', '2025-02-17 10:47:33'),
(435, 24, '8ca02d3ccc76ace79ae96b00d0f709cc5ec231a10c256d2ff31e631bbf0c4388', '2025-02-17 09:57:33', '2025-02-17 10:57:33'),
(436, 18, '003cd8234ef2dd8be09ba29d1890a8f9d422759f98c9425aa8688da03abc8447', '2025-02-17 10:05:41', '2025-02-17 11:05:41'),
(437, 18, '5187e8ba323879d59a6d799786dac1035ea8b3af7bd7468780a9f81b7d86641b', '2025-02-17 10:22:53', '2025-02-17 11:22:53'),
(438, 1, '5f3c008b2e4ef614f311bfaeda9a185d8fb62208b7435cc236b982a48c9400a6', '2025-02-17 10:25:54', '2025-02-17 11:25:54'),
(439, 29, '35a21402864e7fae81f0b2f95c289598a3ad9c9c3f323224770b3112ec458f6a', '2025-02-17 14:40:43', '2025-02-17 15:40:43'),
(440, 29, '45c44898b7804201b73fdf5539f74746ea8a2ef435e749318ec83c1c128a3bba', '2025-02-17 14:55:00', '2025-02-17 15:55:00'),
(441, 24, '2eea63d3b261fb5fa717ba4b15ff61626ece987fefade06eff1c523f8ad86582', '2025-02-21 09:16:07', '2025-02-21 10:16:07'),
(442, 24, '07e8c2d7a0d587c36d70757fa7f6e51e47c8cd92bddddeefdae3321c7a5e2c34', '2025-02-21 09:17:19', '2025-02-21 10:17:19'),
(443, 24, '2f01bd608ac2aac46c390d763b51022cf5a8be57478577cbef67ea18edc73f5f', '2025-02-21 09:19:48', '2025-02-21 10:19:48'),
(444, 18, '6b0cbbbe8c72865e41b3a2b1c5f7c73431d3667af55bbc35de6fee1709a347da', '2025-02-22 07:07:33', '2025-02-22 08:07:33'),
(445, 18, '9c8faa3a47c14f948faf9c4fc1af8dae92b3ff7cdc832f6a7743c63c8cf4d233', '2025-02-22 07:19:45', '2025-02-22 08:19:45'),
(446, 29, '39b910c93ba3f85142cc955dac0cd450982048d8d0591884715f65a2af0ec35f', '2025-02-22 07:39:11', '2025-02-22 08:39:11'),
(447, 29, '0ab23572ca2584794e37d8dbc359dd901dba322952d75e4d64eb4f63a1524d60', '2025-02-22 18:03:21', '2025-02-22 19:03:21'),
(448, 18, '108b72cf126c3e645ffdea78673f7352623c14300ff9c2403dbe9873948997d3', '2025-02-23 16:31:00', '2025-02-23 17:31:00'),
(449, 1, '1dc5e8ddcb6e1e44c0ca08f05bc123d5c762a656b79f8fd7690e5b7b485b47d5', '2025-02-23 16:33:05', '2025-02-23 17:33:05'),
(450, 18, '1c3b123a7c16ec6ec551eb4db3294ca379bf211b0e6669fbcf691321ca3d0b0a', '2025-02-24 06:15:07', '2025-02-24 07:15:07'),
(451, 1, '6e482eced2a895d64ca733d314197c055a14c77102eca1ba801d3aeea22b05a3', '2025-02-24 06:19:15', '2025-02-24 07:19:15'),
(452, 1, '648faca2c736a5554aae87cad2fee654ee220e90944a15b47cb2b6b3dc358788', '2025-02-24 08:19:10', '2025-02-24 09:19:10'),
(453, 1, '86206a33686c0f945d9ed7b2bbed706aa395c985b8542728ce4e9c7fe2b10119', '2025-02-24 09:24:18', '2025-02-24 10:24:18'),
(454, 18, '18a7a05411ac66a69f4493f4a1e884de0632d6dcabb71aecacc977da8ac3794c', '2025-02-24 09:36:11', '2025-02-24 10:36:11'),
(455, 18, '98850757e61236e40265e7760267423482005d1d74df75c82f2f0d97c96a4998', '2025-02-24 09:42:10', '2025-02-24 10:42:10'),
(456, 18, 'ce1523f98c6be4eaf231539ddc7e24690e430b8272df0ba4505065b65081ea6b', '2025-02-24 09:42:31', '2025-02-24 10:42:31'),
(457, 29, '794551be190c97e223e00f4089953ddf3bb38f85d5ddc8d5ec9df791a4a2c9cd', '2025-02-24 09:43:28', '2025-02-24 10:43:28'),
(458, 18, 'ff782a5145192a9bc79f73808a3ae0e491af589cab11c24351f60926b7521d5b', '2025-02-24 09:44:20', '2025-02-24 10:44:20'),
(459, 18, 'c2598e560631c287cbdba27fecbc3e52738ae39e3806b15111651b6a30d9f86d', '2025-02-24 12:07:29', '2025-02-24 13:07:29'),
(460, 18, '647ec74400a53db62a066c0345f68661efe0112b68502bd09f09c0af596074c7', '2025-02-24 12:41:09', '2025-02-24 13:41:09'),
(461, 1, '3ede66bda80796cd4c23402e02f296983ded941be9b8a3b9dc15763e51fc3ff9', '2025-02-24 12:45:10', '2025-02-24 13:45:10'),
(462, 18, '161a419e14bcfa17a536587367de58336ad38fe7042db13ed4bc6b9c2a92e5a5', '2025-02-24 12:47:23', '2025-02-24 13:47:23'),
(463, 29, '452fe03a4936ab0ecb258bb5a0df7aa73020e16a37ef4929b420cda32a67b8e1', '2025-02-24 12:47:57', '2025-02-24 13:47:57'),
(464, 1, '4c09ea2bd9d6e97a9b92fc1f6ab9ae9a9f6c77a2e8f04f70e92f168003b2dd05', '2025-02-24 12:48:33', '2025-02-24 13:48:33'),
(465, 18, '549a5941dd7ca8bc11ad5c95108d585266f6f0c379dc203a51347e19ec7aca07', '2025-02-24 12:48:55', '2025-02-24 13:48:55'),
(466, 1, '89910a254b793384f3b98d016da1b462ab6a8947f4fc22e7682f5d8aa4a513f3', '2025-02-24 12:49:22', '2025-02-24 13:49:22'),
(467, 29, '9e3be16e7e7cf77388ef171a0e8aba1055694b0a69a9bdec2ad9ec3044623fdd', '2025-02-24 12:57:43', '2025-02-24 13:57:43'),
(468, 18, 'e7a91be74309ca595fc626ec9ee1fb34f4609e677b3e7f3f0bec1d35f6e9d1ba', '2025-02-24 12:58:32', '2025-02-24 13:58:32'),
(469, 18, 'ec1b8fd7a342cca2b14b6bb74bd6e6f872a83c8fafa3ee7a30b95b05c0af090b', '2025-02-24 14:07:14', '2025-02-24 15:07:14'),
(470, 29, 'c30463a8046be5aee08f59f56c838dc26b3ce1b6051d49858d5e488b33c01191', '2025-02-24 14:12:24', '2025-02-24 15:12:24'),
(471, 1, 'f6ce3e78f863a1403489e1da197755789ff8b0abc529b61ebc6662112c0475fd', '2025-02-24 14:12:53', '2025-02-24 15:12:53'),
(472, 24, '1f12376363d3c991e8c0adb4889c559d4cb94e8deeff9414fa677351724c00c3', '2025-02-24 16:19:13', '2025-02-24 17:19:13'),
(473, 25, '11327d2e86add2b23d8d8a473e7c7a33927219ad607fb8abb1582dfa6fb95810', '2025-02-25 05:10:53', '2025-02-25 06:10:53'),
(474, 24, 'd04d4a39a7c09b5b3c923f79df739d5fa00451886349dca072cd91aa42592aa6', '2025-02-25 05:14:52', '2025-02-25 06:14:52'),
(475, 29, '23c918391492a0e644834b4903a17aa34770727a05a948626acbd536ba51aae8', '2025-02-25 05:16:56', '2025-02-25 06:16:56'),
(476, 24, '1d72d44d7a8871dc2fa2ca9f7bcfa110900df48d0388edaa91698d470feafda0', '2025-02-25 05:29:34', '2025-02-25 06:29:34'),
(477, 29, 'b11abf64981007da0ded022866fe0505200b31bd11075b42903f863b552522cb', '2025-02-26 11:56:12', '2025-02-26 12:56:12'),
(478, 18, '388b6829b728744bf4d6efcd28f3e41e89f449478b228c912f2dabbe92fc2a0f', '2025-02-26 12:00:12', '2025-02-26 13:00:12'),
(479, 1, '5476b4c4101c1ce6f178b8f70720466fa57cb50ace5f03d7a3a5b9391b75f477', '2025-02-26 12:32:07', '2025-02-26 13:32:07'),
(480, 29, '95d5474fb0a10359917695a0c6597e5143717080710b966c98474088c365537a', '2025-02-26 12:33:58', '2025-02-26 13:33:58'),
(481, 18, 'cfa57cf317152b0931eff18a977f6c8bffb56c23fa914e5dd158d9d8684cae0c', '2025-02-26 12:34:51', '2025-02-26 13:34:51'),
(482, 6, '8bb717a4531c713108e5583070d13891ba43e0f561eb5dd23433e5feda46cabf', '2025-02-27 04:52:54', '2025-02-27 05:52:54'),
(483, 25, '35d6458a2466fb183974717b86cd9e04cba7932538a1208329c55c593f77e870', '2025-02-27 05:03:21', '2025-02-27 06:03:21'),
(484, 24, '66eefd99edfd59e27fa70b7086abeb14e9849ee84473100e41ea76c8e7036fb0', '2025-02-27 05:04:22', '2025-02-27 06:04:22'),
(485, 29, '791e1c6a2a8400333303f60e7426535f8eb48e6b78da30d1abf5a096579dbcfd', '2025-02-27 05:05:33', '2025-02-27 06:05:33'),
(486, 24, 'f2fb0e38dc65feccec6d2fed5d2eb2f84edba19f6c4e9d1f411e8aaa401feb27', '2025-02-27 05:08:41', '2025-02-27 06:08:41'),
(487, 29, 'aea8057bec5faf8f18f067663a606d81269157d33357a2068fd783e15267969b', '2025-02-27 05:17:07', '2025-02-27 06:17:07'),
(488, 29, '0ca401aa1b134df04bd858c725e98baa9bf5b9207a3f456b402a673479f30e30', '2025-02-27 06:26:39', '2025-02-27 07:26:39'),
(489, 24, '31d4293e16a14b273363facc328196cfe75f8caf5688bc6fb16c11c479eec5b6', '2025-02-27 06:35:23', '2025-02-27 07:35:23'),
(490, 25, '18264613d16162509db5082529b13396c77f8a014454817081111d81acd779a4', '2025-02-27 06:35:40', '2025-02-27 07:35:40'),
(491, 29, '18fd811207367314c27ac9bda79daab13a883099bcef668ca02905f3cf220efd', '2025-02-27 06:37:04', '2025-02-27 07:37:04'),
(492, 24, 'c9a23ce4a272ebf9bd75b6cd62aef38dff50055fc12e1e0012fc69de3fae5329', '2025-02-27 06:41:29', '2025-02-27 07:41:29'),
(493, 25, '68ea5fe47d1247db9cc25860ff00b169b668f8c6662d8cbac1bce48786a13f1c', '2025-02-27 06:43:05', '2025-02-27 07:43:05'),
(494, 24, '635e459370e8b962d79fa5df5ea43fd7f2b69c3e2fc8fb3d2681bdf728457c4f', '2025-02-27 06:43:27', '2025-02-27 07:43:27'),
(495, 24, '3bc2a66bcd92780e7b2257defae1245acda857252cfa128dd5b0f406b8a57d81', '2025-02-27 06:48:24', '2025-02-27 07:48:24'),
(496, 29, '9836e7459934ee712ff07dcd7c1f332468753dad94d8e1cb5c786bb641050b96', '2025-02-27 06:49:19', '2025-02-27 07:49:19'),
(497, 24, '19f09a99bdef5ae2899ba404ab08bca7726648daf05487969c3af90f8fbbfdaa', '2025-02-27 06:52:12', '2025-02-27 07:52:12'),
(498, 25, '41475eaf23a0ec0c89ac95ae8fbb8b1a3b1cb851d833681f6545ab3577f09932', '2025-02-27 11:24:21', '2025-02-27 12:24:21'),
(499, 24, 'ae6c1c7082ce1c2b5edc42fc38f62eaaf2573316e39a990d9003e3f836066c20', '2025-02-27 11:24:46', '2025-02-27 12:24:46'),
(500, 29, '9a490e33258aa6782b9f68f64a61548337eaec84dac1cfa7f573c9fb3054d478', '2025-02-27 11:31:33', '2025-02-27 12:31:33'),
(501, 18, '34e75a22932d51ac76ee9a5ba0929fb2a7916c47f315fc134343352ecbbb24d6', '2025-02-27 21:00:14', '2025-02-27 22:00:14'),
(502, 18, '360efe8d00e16136ad8d049978c668523906d893d617278e5f45878a6eeb3be2', '2025-02-28 13:20:35', '2025-02-28 14:20:35'),
(503, 18, '809c8b54685f5d535495b76163d20a937279c516d3795ba200fbb2a1bf2a2cdf', '2025-02-28 13:25:58', '2025-02-28 14:25:58'),
(504, 18, 'e29bf4788487c2e3720304a116f64547884d27236016c621fae255730b23f6db', '2025-02-28 13:43:18', '2025-02-28 14:43:18'),
(505, 18, 'e3a6d1b2e74bf35f0ed23058fc6a6abd0695076714ede6d54330efae88dafe1e', '2025-02-28 15:39:49', '2025-02-28 16:39:49'),
(506, 18, '08ed35ae3f26f260fb93881c788d80887fda4261e0f4bb3f61f104fc2237f02a', '2025-02-28 16:07:39', '2025-02-28 17:07:39'),
(507, 18, '63678ece5c77d2e90501e504b5fe97e33a4551bafc9e2659dbea808c407f852f', '2025-02-28 16:21:09', '2025-02-28 17:21:09'),
(508, 18, '9100f518ae7b72710a29993f98605991116f47c9bc4a4bb7405ccf34ae0e42ff', '2025-02-28 16:25:57', '2025-02-28 17:25:57'),
(509, 18, '929593e5b0f45ba2e8e9a6c068e961bad9cb11b05ce9c3adbcff8785105e7318', '2025-03-01 07:39:08', '2025-03-01 08:39:08'),
(510, 25, '1ceee5f68cc119ba4405c0f46633accfd1668339042426efa819560b4c78a9b0', '2025-03-01 09:45:32', '2025-03-01 10:45:32'),
(511, 29, '1a9481cdf58fcb956cc40cfae1ab797b213dea34fd503b085da519919530247b', '2025-03-03 05:39:30', '2025-03-03 06:39:30'),
(512, 18, 'd636ee65bfa252d6239b0f046912b224f3b4eb4750389d8f5c35eabef1286cef', '2025-03-03 09:13:46', '2025-03-03 10:13:46'),
(513, 1, 'a7a168ac1239a42ebbea45d77f98e38e65f201c3a1a84139d9febbaaefa2589f', '2025-03-04 04:12:42', '2025-03-04 05:12:42'),
(514, 29, '1e3b18c2f6ae3c2ea0017442a5255401b1bb091a3bc2f2d3bf424c8d37c2c633', '2025-03-04 04:14:53', '2025-03-04 05:14:53'),
(515, 8, '76f5997a7096cddfcb9b42843312df93cc622623aabc895fc7eed93ab8c7bde5', '2025-03-04 04:17:26', '2025-03-04 05:17:26'),
(516, 18, '708e1d133d68bc5480dddc06e45637794c00f1b9214a7b9b2beebbf1e37d07f7', '2025-03-04 04:44:03', '2025-03-04 05:44:03'),
(517, 18, '04a1bcf2f1490fa854088fce21af6843adae1948a10f1dee39df1226096d12e0', '2025-03-04 13:47:19', '2025-03-04 14:47:19'),
(518, 18, 'e0b7a6437b82b7794c2c6ee0caaf08feb3bcf38be13136df4c7aadf743cb2f32', '2025-03-04 17:59:45', '2025-03-04 18:59:45'),
(519, 18, '238a950f37baaffe5f686c737ef5558f7f04354b36ee935ef515c362b491c041', '2025-03-05 09:24:28', '2025-03-05 10:24:28'),
(520, 18, 'b03b95ce3a1dec63af93302e2410568b02346d7fd3ca1891a4702b2d278e6ed3', '2025-03-05 10:27:49', '2025-03-05 11:27:49'),
(521, 18, 'c4c6f7a0b42c7c35c852dfaca93db36577ea92e89a9998e575c171130c92a365', '2025-03-05 11:28:40', '2025-03-05 12:28:40'),
(522, 18, 'b0ee1ffc7fc17bf1fedc7b9bab8f443d5d0e4a16f359eb73d7abd301a242a5c8', '2025-03-05 12:35:57', '2025-03-05 13:35:57'),
(523, 24, '0c93f096cdebf3553a3da405f9a471c2bcadcbd9ee1558f4205f66d7997261a6', '2025-03-05 12:50:43', '2025-03-05 13:50:43'),
(524, 8, '28aa65c36a80ec0adb8ecb137577e70eab0644435a9a17b5347c35d5d89e3c01', '2025-03-05 12:50:50', '2025-03-05 13:50:50'),
(525, 29, '0edc272bc3b443203966674dbfe92de0e2d86ade48322c54068cbdf671e52ead', '2025-03-05 12:52:03', '2025-03-05 13:52:03'),
(526, 24, '76ad9b41dd9f8642dc2d74d6402152ab04d53e928786c0c1ca9d63aa1a47b936', '2025-03-05 12:53:09', '2025-03-05 13:53:09'),
(527, 29, '7ee88edb531b90f0063a5d3f155203d3de53b3196f8d12c02f5d8d162115167e', '2025-03-05 12:53:42', '2025-03-05 13:53:42'),
(528, 29, '41ea7189b835ebd764b8e91172b9806fc26d8b91ef4f3e732ac5abae33173b57', '2025-03-05 12:53:51', '2025-03-05 13:53:51'),
(529, 25, '503c930b0143f0928eccd011038f8f916a867fcc5202d49eaf3767095708aec5', '2025-03-05 12:56:29', '2025-03-05 13:56:29'),
(530, 24, '033bd936f73ce5c267d7eb3fc5db5c23ed73b68f2c966739f37e91638c1d99fd', '2025-03-05 12:57:19', '2025-03-05 13:57:19'),
(531, 24, '38c1b7fee94256ca160ccc360f9fa7a50b211df4e00e336c6530a895843e6a5b', '2025-03-05 13:01:20', '2025-03-05 14:01:20'),
(532, 29, '93d0dac2b8dc2edb1a6d81ed673a93f3ad4a7728b1cfff99f3bd21ddb063e12b', '2025-03-05 13:03:40', '2025-03-05 14:03:40'),
(533, 24, '9e588c960a6b7d66232e27a3ba4c5b53c6eccbbc21854571ee2bfbac2de98287', '2025-03-05 13:16:47', '2025-03-05 14:16:47'),
(534, 29, '85fac4a773faf84fc6062aea2f3f65a3d252a60ca18eccfc4adf15e09d5f34db', '2025-03-05 18:17:04', '2025-03-05 19:17:04'),
(535, 18, '94d32de3a7267a538690c6f5689db7332c6f8ba7a6566c1c87aed7b14a1d83c9', '2025-03-05 18:23:37', '2025-03-05 19:23:37'),
(536, 29, 'a780ea4a71631f211dcd87051298a6788f5aa857450f7b78ced7c039a937145d', '2025-03-05 18:46:47', '2025-03-05 19:46:47'),
(537, 1, '404203cf9edc0a041e7b8ce278b1d27360ed4cd89ee2d21c15ac120521058989', '2025-03-05 18:48:07', '2025-03-05 19:48:07'),
(538, 18, '93172045458374a8d07cf00756d7441ad13abb6b7d10396722018fd708b0a59b', '2025-03-05 18:53:03', '2025-03-05 19:53:03'),
(539, 29, '2b669f06ff9f15d1e0b487ba1975d615388ca3373baa89a9b801ddda2dc4d218', '2025-03-05 19:31:20', '2025-03-05 20:31:20'),
(540, 18, 'f924b2709aef916215fafbf15b811ce3cc9f91b8c586969917a5d8fc378f175b', '2025-03-05 19:35:30', '2025-03-05 20:35:30'),
(541, 6, 'fb63c2c6d58ea4885f82eb86f1fc49a8798b30d871c5df32419d6f5e5ca68fb3', '2025-03-06 04:43:16', '2025-03-06 05:43:16'),
(542, 5, 'a38bf97f5bec161ead5392334d3c5f3995c5ff466fa1f780bbed1c4321cc8603', '2025-03-06 04:47:57', '2025-03-06 05:47:57'),
(543, 29, '6486e06bf67a73b2889f673c0470a17ab09b5d69b3350a5ef97fb9066ee0749d', '2025-03-06 04:51:59', '2025-03-06 05:51:59'),
(544, 6, '1422ffeed1535e215d12d1ea2f07057d052c1acec19476f6fb6cbddf4036abb6', '2025-03-06 04:55:41', '2025-03-06 05:55:41'),
(545, 5, '3e46a325deed0f0bd767907a177cabfee1e56c72b0b44d020ff5e1dbfcd9cb44', '2025-03-06 05:51:19', '2025-03-06 06:51:19'),
(546, 29, '7f15c7108b66219f61477b7ce0c7780696cc8b33a18ee903e5e66d8372e30787', '2025-03-06 05:54:24', '2025-03-06 06:54:24'),
(547, 6, '307c044ee9f52fd2dde2a3f612881478125c928c09b52649b306a9bbf05bff6b', '2025-03-06 05:55:14', '2025-03-06 06:55:14'),
(548, 29, 'fdf6d01606f8b81921c32297a8cac9ad942270db28bba9dee8738cc30e4b4bc0', '2025-03-06 08:32:35', '2025-03-06 09:32:35'),
(549, 6, '3912469ac63e9cac1932246f09e8b4ea045d4e080e6dcb79e17f326f690b66cd', '2025-03-06 08:35:35', '2025-03-06 09:35:35'),
(550, 18, '5c45b2964055b22f5823200a8bb3144379f54ec69410b2412b5326b877ba6c4f', '2025-03-06 11:30:29', '2025-03-06 12:30:29'),
(551, 29, 'ea88814e463fb936ffcebda3150d24cd446332da0bedbd1b01d33552655933a3', '2025-03-06 11:44:27', '2025-03-06 12:44:27'),
(552, 1, 'edf19f7cfcca064a517187851cbf3cd9609242d3340568ac765c4eea3b004443', '2025-03-06 12:08:21', '2025-03-06 13:08:21'),
(553, 29, 'e7ea13ee1db908c9211363571559227eac3aaaa109e60c3cb1ff28a34cf211d7', '2025-03-06 14:08:00', '2025-03-06 15:08:00'),
(554, 24, '8b9a9911dd8a3687639343ba5ee73dabc7d2d66fa2efeebc2d913d663a547e38', '2025-03-06 16:28:47', '2025-03-06 17:28:47'),
(555, 25, '271209953e435f9158f2bd76b6cd7af30390a9ada335d32e96b7065a4769b54c', '2025-03-06 16:35:24', '2025-03-06 17:35:24'),
(556, 29, '4efbdc8c939b5a43e74270030b8ee403f39b639a98a94ae5c6d29ff6568d60b4', '2025-03-06 16:51:12', '2025-03-06 17:51:12'),
(557, 24, 'b8e9c6fb002ee2fc294036da2cb18700e6f4377a11b789e4a49205095b63a8e8', '2025-03-06 16:52:52', '2025-03-06 17:52:52'),
(558, 29, '4a634cc61690918a674dd529005217e84ec48a280b705b9f8c4ae25bdaf57721', '2025-03-07 06:11:20', '2025-03-07 07:11:20'),
(559, 24, '960293d6451ed6a031e56c41968278008a71406915ce0f60505196bcdf67e908', '2025-03-07 06:11:58', '2025-03-07 07:11:58'),
(560, 25, 'a9d48df4f92afbf790fb8fa3ea292c2c0424ce6d1d68e8070c3f48b0677df0cf', '2025-03-07 06:14:58', '2025-03-07 07:14:58'),
(561, 18, 'a10e0258f47f8510ee60d98de8ccd3eb5761757235befcb98932b0c057104a06', '2025-03-07 07:23:52', '2025-03-07 08:23:52'),
(562, 24, 'b4ada23b778620b116f7781b2e84574de835791e4bbfc3bddd0ede92f8e6a3b6', '2025-03-07 07:47:40', '2025-03-07 08:47:40'),
(563, 29, '35a3c708cd5741f509cbed683776dd24f0fbbeb3f1da818ad3c43c1552e929b5', '2025-03-07 07:51:16', '2025-03-07 08:51:16'),
(564, 25, 'd402bfdd971cf740e52b594108059b1669370ddb028666c3ff495d426edd9b7e', '2025-03-07 08:27:39', '2025-03-07 09:27:39'),
(565, 51, '52c3ebf71e4e31e82bc202a6efed63a34cb1f406467e7733cf8a76c831bca653', '2025-03-08 04:45:39', '2025-03-08 05:45:39'),
(566, 24, '3e9fad47f6e7a101c0f0b0809f7f9b70a25d1e8912aecce5e7dc5481b426c42f', '2025-03-10 07:49:57', '2025-03-10 08:49:57'),
(567, 25, 'c2a5186bc3e92248926d8a20883915a4ec14a3a72ace597763f0cce453abb1c4', '2025-03-11 06:31:04', '2025-03-11 07:31:04'),
(568, 51, '7947a056dd9710d663676f40354ff0f4bc5a2b092cf8d2aa52077776f29ce183', '2025-03-12 08:06:13', '2025-03-12 09:06:13'),
(569, 29, '9f4705d7b648f837aefa2d4929d26a06c2a5d34578278ca2459ffd5adc667a1b', '2025-03-12 08:08:29', '2025-03-12 09:08:29'),
(570, 8, 'fdc3ea131288d9e21cef5cd8a29b2718f60b078ecdb9360b668d0b96735ed9bc', '2025-03-12 08:10:32', '2025-03-12 09:10:32'),
(571, 51, 'd7dbf3fae487f3071ff21043d44921892ec9ed0175a1ae5afcf7e73cacbcc64c', '2025-03-12 08:24:44', '2025-03-12 09:24:44'),
(572, 29, 'faa97095f43076c059ffc695d426964afb852e12a1dd43e64f8f71e298e5213c', '2025-03-12 09:23:05', '2025-03-12 10:23:05'),
(573, 8, '17431926cf862bf24a9cec2699688839b2a952a856abdf6c94de6ed4ddbf81f4', '2025-03-12 09:23:39', '2025-03-12 10:23:39'),
(574, 51, '2a9a3153b487677786e2179248408d33e07690f960ca7867d0da6cd8085bb777', '2025-03-12 09:29:27', '2025-03-12 10:29:27'),
(575, 24, '59a59117464d094a31c7c5596a451b1926046db83dd12508addc1bbd133988db', '2025-03-12 09:46:12', '2025-03-12 10:46:12'),
(576, 25, '42d53d8a54a61fb08e2af21a57bc645f93244c8e89d7018e0265180ce10814b9', '2025-03-12 09:48:05', '2025-03-12 10:48:05'),
(577, 29, '5c928194ebff6a918a08519ed15df14c57cf6d297043ccfc01f5c21409b78301', '2025-03-12 09:49:24', '2025-03-12 10:49:24'),
(578, 29, '5f1cbba6ddb29cb291d03208a7db78955afd8393b229e20c6c174e0b4a979773', '2025-03-12 17:08:25', '2025-03-12 18:08:25'),
(579, 18, '27176cbf4e89132baca6bdee36a58dbfb977dea0ad7ce3b6257745c8edbd5501', '2025-03-12 17:24:53', '2025-03-12 18:24:53'),
(580, 1, '93107d4018e417f171bce7e483937c87f1f35554cfa13c62f999197f9a974c68', '2025-03-12 17:26:28', '2025-03-12 18:26:28'),
(581, 29, '0122f2a30e21445fbdecd30d35c810f025aefe9df23a59f8c51a61c7d3e4890d', '2025-03-12 17:28:03', '2025-03-12 18:28:03'),
(582, 18, 'a42564c542267b59b51aeccda0ec0582c87bacaa6b196c3d7136d6d3b396dc1e', '2025-03-12 17:30:27', '2025-03-12 18:30:27'),
(583, 1, '9e2e237aea75b88d97fc679c1c266eff9ecd9a304f79cb9aef177f53e35643a9', '2025-03-12 18:33:22', '2025-03-12 19:33:22'),
(584, 1, '50fdbc032648eed121e1e4b6eabbe9a05b1c7a3beed0e7d13a29c27ec99e9c28', '2025-03-12 19:44:37', '2025-03-12 20:44:37'),
(585, 51, '310d4cea9692699ff888f1047aa77b37198167af9165268e8852f07ebb350d67', '2025-03-13 17:43:01', '2025-03-13 18:43:01'),
(586, 51, 'a603f3e77ec17b7c55671263dca168e1485468a8de7591e8459b7714eab24888', '2025-03-14 08:06:09', '2025-03-14 09:06:09'),
(587, 1, '2f46d5308d5d0f52b8399d2ac2a79b298e846d72293b97a2c1cd4dac53ec3fa2', '2025-03-16 10:53:29', '2025-03-16 11:53:29'),
(588, 18, '0b6b1d5507559ee98e9899c6c327b4a6bbb9c97c64bfe7b82349b3bb532daea9', '2025-03-16 11:02:14', '2025-03-16 12:02:14'),
(589, 1, 'd2bab78d6dca3e103b75c4de327d286599d66326290d61d9e057eca5c96321fb', '2025-03-16 12:38:23', '2025-03-16 13:38:23'),
(590, 1, '49f324a0a7a1c828e45f5408ba18e9cf13d78efc8b72c952eaaa4e6f2e8887a9', '2025-03-16 16:50:07', '2025-03-16 17:50:07'),
(591, 18, 'b1fd50d05649aa63487398aa1f9dd368d3ae6f7d62ec6152628bb326d4af1d14', '2025-03-16 17:00:24', '2025-03-16 18:00:24'),
(592, 29, '5ff3c3da05d70e31cce0df316400d3cd9bdec5b0996520bbe7d2d78e97cad750', '2025-03-16 17:43:38', '2025-03-16 18:43:38'),
(593, 18, '203f7236a38e0a8ee56a29a61055e4b560d70707179a50681132b91d7c244ca7', '2025-03-16 18:07:21', '2025-03-16 19:07:21'),
(594, 29, '6e9c000e4c666a3cbc741ec4659cab68a0eccf5393b6c8cf4713596f53802999', '2025-03-16 18:09:40', '2025-03-16 19:09:40'),
(595, 1, 'ad7d9f8459c188f6d338990ef8306c799c320b537f0a4539a8627a3e064976f7', '2025-03-16 18:24:16', '2025-03-16 19:24:16'),
(596, 1, '52528af7f3fb3f01af3feab8a6ed42c639c4feb1baf254eea21f10df38e56c61', '2025-03-17 05:48:51', '2025-03-17 06:48:51'),
(597, 29, '7beb019cf036a5fac7703d2e64eb9902a5c1b97282b9d445bc8162f21dd5c8cc', '2025-03-17 05:55:15', '2025-03-17 06:55:15'),
(598, 1, 'f4ae694661eb7100a26f490083bb48367f85e2468b134e93ca4eb879356016c8', '2025-03-17 07:25:58', '2025-03-17 08:25:58'),
(599, 1, 'aaab0bbce6d0ccb3f8bb6fd13c7aee9c0b05d7305c8330700b538543f15e9069', '2025-03-17 09:26:28', '2025-03-17 10:26:28'),
(600, 29, '50bfb3eb42df4363e16b358b10049e601ef73883cb07bb3dc7efebf5c8111e81', '2025-03-17 09:30:54', '2025-03-17 10:30:54'),
(601, 18, '4a86b50b405e09c5d0316235cbc49d46466430fc0a817333fdc49fe336ca74c6', '2025-03-17 09:37:13', '2025-03-17 10:37:13'),
(602, 29, '1c272fbc7104e941ac794b4e36036da054a1e25481f385dcb1ee509ce005c164', '2025-03-17 13:29:20', '2025-03-17 14:29:20'),
(603, 1, '073cd6b5032fe8d689a0aeac8a492ae9bf04915ae2be6619b7568580a180011b', '2025-03-17 13:32:43', '2025-03-17 14:32:43'),
(604, 29, '978d59ad28615e8368faaff60547b8ef6f139e33f66687d79731ade689d8974d', '2025-03-17 17:08:31', '2025-03-17 18:08:31'),
(605, 1, '80b063a13ebe7161723c3b0adc69d1884423e1e8e06d4b953196bee03f2988d0', '2025-03-17 17:10:43', '2025-03-17 18:10:43'),
(606, 18, '15ab2096200de03439af7ce3e2e9324215e598b8d3670f2663b70a13c5eeedc9', '2025-03-17 17:14:37', '2025-03-17 18:14:37'),
(607, 25, '32a80a30f0f05595eee24f695fce4be37722b55c392529209baff47f0c142922', '2025-03-18 05:24:48', '2025-03-18 06:24:48'),
(608, 29, '5566c407102b6d0edf8eab5441123286fa0815c803820b463c75c6b18ef2c2cd', '2025-03-18 05:29:36', '2025-03-18 06:29:36'),
(609, 24, '474fa8af13d9acc9604ac3b52754ca5a250805af996792b7c38e8e6635200af9', '2025-03-18 05:29:42', '2025-03-18 06:29:42'),
(610, 29, '05edf2786edc009f52a034ac5cec6b48c814cbbbab98bbed02b1fef20510b053', '2025-03-18 06:41:17', '2025-03-18 07:41:17'),
(611, 24, 'd42337ddf7f2d7bd38bbc6246d5ca6e1b0ff4032df729e2c2203b4baba721a9b', '2025-03-18 06:46:21', '2025-03-18 07:46:21'),
(612, 29, 'be515ace4d5163c12aac1ba6ceeb60c2e58035a9c968f7ad63b4331fd1d8a45b', '2025-03-18 06:49:05', '2025-03-18 07:49:05'),
(613, 25, 'a9124a51ce5de7a9d26cc1011a457e556a9a4c4bc734b58156194db805a4553d', '2025-03-18 07:24:05', '2025-03-18 08:24:05'),
(614, 25, '0a12510ec463e9b6fb723733b457724d87e7ab386e00e258f50b7f02f1fd4035', '2025-03-18 07:24:53', '2025-03-18 08:24:53'),
(615, 29, '556374d852a77b91e9c46cad75cbb9f3240ea6dd63fa06777079019879d79131', '2025-03-18 07:45:13', '2025-03-18 08:45:13'),
(616, 24, '7391a7424ca2a9b8d0fac4294f66bcdf2db0d51e5b9669b14aa8768b51184f1d', '2025-03-18 08:06:54', '2025-03-18 09:06:54'),
(617, 57, 'ea18a1efd56f0215e0af54a059db681ac8121c2820d79f435fb438e1afb6749e', '2025-03-18 12:20:50', '2025-03-18 13:20:50'),
(618, 62, '4ec4b2f8a54548b1620f1a4cc4a7d2eb7da7f6a284a96fecae5db30487405503', '2025-03-18 12:34:33', '2025-03-18 13:34:33'),
(619, 58, 'cf8593a20da5eca2b806c0fdee39c6214bdc392506ac72feaa9985ea74e5267f', '2025-03-18 12:37:08', '2025-03-18 13:37:08'),
(620, 18, '8307fae44d25ba5aec613fe9ead86f3bdf3db91b87013a03af294d4b293bb3bb', '2025-03-18 12:45:14', '2025-03-18 13:45:14'),
(621, 58, '945d423c8d4c78311852d1f655585540e4f18705ba91e7dbf8de7a4b189f7940', '2025-03-18 12:46:32', '2025-03-18 13:46:32'),
(622, 29, '23e90c064d669892f3852c97b3ec3159484b526279af153dafee25e7d3ef4ac5', '2025-03-18 12:48:49', '2025-03-18 13:48:49'),
(623, 58, 'b91fcc9b8c1ca2792894a985156b4fcd7319b2ab17a1866a8166000562f10572', '2025-03-18 12:50:43', '2025-03-18 13:50:43'),
(624, 18, '1078a6103cc2c1c8a7769f6c3adebf8cb2b453403f8e8b4cb521917ea142767c', '2025-03-18 12:51:39', '2025-03-18 13:51:39'),
(625, 1, 'b20f650f9796c5f94afba7f3c513031324e2e410c370473d7966cb517d275ca3', '2025-03-19 18:58:12', '2025-03-19 19:58:12'),
(626, 1, '062f5eb45b7b3c4b3d81fe3908279a03dc79591ec8ff265d01fa653ae14bbeb1', '2025-03-19 19:29:22', '2025-03-19 20:29:22'),
(627, 29, '38a78e06b25422b7c4e4d38b130d2ac797c3552beb8697df6a4e3d5b6c1b60ed', '2025-03-19 19:39:04', '2025-03-19 20:39:04'),
(628, 18, 'fa3dbed951dce89932f558af99ed9b457b9475cfcafff5010a3225838309ec4b', '2025-03-19 19:43:09', '2025-03-19 20:43:09'),
(629, 1, '67b444d1a4d0bc510a0b1191376a3075b5cdd7cdf5a73e9378aede340cedb81b', '2025-03-19 20:06:33', '2025-03-19 21:06:33'),
(630, 18, 'dafb8b0e2e2116c0ea65c6547cf7c4c21128db92dab2140c12dedd419c309b10', '2025-03-19 20:09:41', '2025-03-19 21:09:41'),
(631, 1, '7c4136048a12f4aa38d9749cb110b63aab765d53e9d80e52a274c888a858e2c2', '2025-03-19 20:16:21', '2025-03-19 21:16:21'),
(632, 25, 'e6b89a60525a219003fbbdd06861a9a527ef536a240db3b186a93fb18f96c5c9', '2025-03-20 05:37:40', '2025-03-20 06:37:40'),
(633, 63, '3067b208875c04f0314a29712055d324ae5dac8802d838354912388239b674b4', '2025-03-20 05:51:29', '2025-03-20 06:51:29'),
(634, 63, '3e726479a290885087923ce3b799829cd927a4706bae6242119fda7c85ad8c66', '2025-03-20 05:54:16', '2025-03-20 06:54:16'),
(635, 1, '2a5414c41747e28ee2025537c3e7d170d7eb80fac93860c8047a5d8471ac5424', '2025-03-20 05:54:46', '2025-03-20 06:54:46'),
(636, 1, '4e17960be93c175e3ca50565ed901c7472cdf01f0f8540d6bf4ce6ca37a1dc1d', '2025-03-21 12:06:15', '2025-03-21 13:06:15'),
(637, 18, '21b66c3c6b994306a0a078f09c36aa2508c7fbfa7f0fb9f5f0f54d8e56f2efdb', '2025-03-21 12:07:19', '2025-03-21 13:07:19'),
(638, 29, 'c20ece31c4b9ab34a2e083fd7962a7c3815ba2f5a767e5f54690857fab60cd7b', '2025-03-21 12:19:13', '2025-03-21 13:19:13'),
(639, 18, '7ed8b12cfa96193669ed7e03a9d63b7d7019cdae359b2f41254e2bab1a962cf1', '2025-03-21 13:18:53', '2025-03-21 14:18:53'),
(640, 29, '8437c633ae8dabe54092c9688e618eb07567ba788daa3f2a37e4b95ce63d3753', '2025-03-21 13:31:40', '2025-03-21 14:31:40'),
(641, 1, 'f190e7e0bacd4daa7c433b82edcb102b082359a924d17ba1cd8ac3b1c014bcfa', '2025-03-22 06:11:19', '2025-03-22 07:11:19'),
(642, 24, '0d4b892693d04b1c112e051f022ffe204dfc5bfa67ceb89a8a234795bec55344', '2025-03-22 06:15:21', '2025-03-22 07:15:21'),
(643, 18, '50285b39f9a1509f58155752e33090954c6067003feaa1cf007e3a88cdb9a60a', '2025-03-22 06:20:08', '2025-03-22 07:20:08'),
(644, 29, '547c1bd90231619929dc2d198e9a7ea18d6b22dc91f597dae20bc2bd49989e10', '2025-03-23 08:15:55', '2025-03-23 09:15:55'),
(645, 58, 'e97d3bf9d2a7cccd63ea97c6172b1b94fd663dacd7c7e91f386527d11057ae31', '2025-03-23 08:59:06', '2025-03-23 09:59:06'),
(646, 1, '64d1e0cf9f93eb0117ed6a9cbe495c196b5f264c93912ef64fa04d5d394f8faf', '2025-03-23 08:59:25', '2025-03-23 09:59:25'),
(647, 29, 'e72249d059755c2940c310c0f78ad1fd578711055195354803086013df963959', '2025-03-23 09:02:47', '2025-03-23 10:02:47'),
(648, 6, 'ea2a0580be53a0a9cdc71621c13ede4731a289b004ce351a3cbee4361fda16ad', '2025-03-23 09:07:02', '2025-03-23 10:07:02'),
(649, 29, 'e788bdfc0c944a4b11003538a7386ecffc3ab67088fb9df3ab5e56477144fc9e', '2025-03-23 12:57:58', '2025-03-23 13:57:58'),
(650, 18, '6cdfe0c1f67a1672ffcf1ac515d8c9891d7f4a9b3aec4d015a871983fa78e663', '2025-03-24 08:15:38', '2025-03-24 09:15:38'),
(651, 29, '4990f2df8f18b89f318855cd659e19e3405fb8b36197659610f4257239e607e3', '2025-03-24 08:34:58', '2025-03-24 09:34:58'),
(652, 29, 'bf04ef06d8a9aacd5c8d5eab53dd19e36c1056baae2f2ecac229ec4bac5795f3', '2025-03-24 10:03:46', '2025-03-24 11:03:46'),
(653, 18, '87cde8f03038eae09de631ff1b6120e9adb17bf47562eabab130d815f234fb6c', '2025-03-24 12:31:02', '2025-03-24 13:31:02'),
(654, 1, '2dc283237ad8ddd157078d12f95499a5e894e9192916dae32ca3b203d521c3fb', '2025-03-24 12:48:29', '2025-03-24 13:48:29'),
(655, 29, 'ee817334d089b4a009622fd6ce63ce64c4393803f28f65262e7df6e6450b2775', '2025-03-24 13:09:18', '2025-03-24 14:09:18'),
(656, 29, 'fa0e6f8f751aa0915e02056e3ca00a4cc1311d993369b354eda3cf0f29114872', '2025-03-24 14:12:00', '2025-03-24 15:12:00'),
(657, 18, 'e3512223e123950cd86628c7f124aa9aaebabf06561ec310580a5b476a1196db', '2025-03-25 01:02:59', '2025-03-25 02:02:59'),
(658, 29, 'cd477c31c23600ca7f87235751ca00008c5686a19a9f12bb1644c84d41162710', '2025-03-25 01:04:12', '2025-03-25 02:04:12'),
(659, 29, '5b79406c9a763032ade535eb7253ad33467c8c37f40a2aaf634c85affa98c77f', '2025-03-25 01:06:17', '2025-03-25 02:06:17'),
(660, 18, '748620e53742a3c5159d53a5f1b0d871ac253b69c7b62d110a0acfcf2d35716d', '2025-03-25 01:07:53', '2025-03-25 02:07:53'),
(661, 25, '7719d631f5f6987d207d41fd66ba357a696360d14130c97579dc31f0882d70f1', '2025-03-25 05:43:53', '2025-03-25 06:43:53'),
(662, 24, '724c07f22d6caf6c688b300da231d77708577d7c48a0c98891f5509fb77415fb', '2025-03-25 05:52:23', '2025-03-25 06:52:23'),
(663, 29, '6bf893f7710c4896eff6954241920c0377be424cd71b087bd2fbb3f9ca012e03', '2025-03-25 05:53:23', '2025-03-25 06:53:23'),
(664, 25, 'aa4e44ae475ce5fcf7db2d3dd0d37d5bfd4bd068e0baa3a4638cdf0123da5ea2', '2025-03-25 08:20:59', '2025-03-25 09:20:59'),
(665, 29, '463bb281e37a82850de571a05f8559d31a8b8c7f70251c61886081890ebfb380', '2025-03-25 08:23:47', '2025-03-25 09:23:47'),
(666, 24, '69b6cb8f5c39d692ee2c4bdfa6f3e2e98c5ba5bbe48fcb696673c7081d5a02cd', '2025-03-25 08:25:13', '2025-03-25 09:25:13'),
(667, 29, '2aba00cac1a53366aa509b070b6106df625398b63c1419d6a0cfaa4ec8d079ea', '2025-03-25 13:51:29', '2025-03-25 14:51:29'),
(668, 18, '2d87f3d3392de826fd50aab8ade11fed105d498d3868195d230a8ec0516627ef', '2025-03-25 13:52:00', '2025-03-25 14:52:00'),
(669, 18, '81afde2817c2dc632e603fdde2f2a62e90ea946d2e511d83ef496d939ab3ef64', '2025-03-26 08:46:42', '2025-03-26 09:46:42'),
(670, 29, 'db35d7961bedb634994e98b6d91df44eebd651e4576bf398994dad61f4f10fc8', '2025-03-26 08:52:08', '2025-03-26 09:52:08'),
(671, 29, '11487602ecbbca0d1d7a1427822412dcee995966875b5303b06c4e6b9a914f8c', '2025-03-26 08:52:46', '2025-03-26 09:52:46'),
(672, 18, 'f016d339ff978558b1fbda9b50e5fd66e05a77e4007fd657eaae4c0ef4359250', '2025-03-27 07:41:38', '2025-03-27 08:41:38'),
(673, 25, '86a2fb15e1203f562c79addddbc2d8a26cea823bba0c750a0e1509b242411c6c', '2025-03-27 07:47:10', '2025-03-27 08:47:10'),
(674, 29, 'c03ee5ee65fe9baadb97def309d5cb90d6d04d5f50bd982810f87698100e7513', '2025-03-27 07:48:33', '2025-03-27 08:48:33'),
(675, 24, '6d92d850e206c7a091348d4550d486c0ca56ff39c5acd3bdae2f52e21a22fabb', '2025-03-27 07:48:41', '2025-03-27 08:48:41'),
(676, 29, '0e9f792d5a97a4560bd21d53d2703196bcd072784849d9e5bb11b4025d2e4853', '2025-03-27 08:20:08', '2025-03-27 09:20:08'),
(677, 29, '4e00d2ed462189ad854bee145ab127e09b073c1301b4d766782086891f561f93', '2025-03-29 08:41:54', '2025-03-29 09:41:54'),
(678, 1, '34b2dade82efd6da2395bbaad2fa9b3b5eda5bfd8b1274fe7c1b269a8224d7d6', '2025-03-29 08:51:54', '2025-03-29 09:51:54'),
(679, 1, '2227573792ad64e42ca7353cd0ad73cffa3e6ccbeea3b7b719fbe04c76dcad72', '2025-03-29 09:04:29', '2025-03-29 10:04:29'),
(680, 1, '97a9ab501b3877e23c4712353ee06ed62df65ab090a79835bcb87f2e9af502f1', '2025-03-29 09:05:18', '2025-03-29 10:05:18'),
(681, 29, '281c468d0af71784c5fb4d6a34252b7b15909402aeaa915379b08c67da8852c5', '2025-03-29 09:06:56', '2025-03-29 10:06:56'),
(682, 29, 'acebd9ed3f28b00232f4931c52ec7857ea7810dd5afe14b60f61e4d50bb6553f', '2025-03-29 09:21:58', '2025-03-29 10:21:58'),
(683, 29, '60ff28f58bc33626380c9843a49c62bd90fafe97596a9be50e1622dcf5be9089', '2025-03-29 11:12:10', '2025-03-29 12:12:10'),
(684, 29, '567814bd70f1faef8a6cf09f1aaa693e42b5552bdcbf15c4e698b2d18d49e153', '2025-03-29 17:27:42', '2025-03-29 18:27:42'),
(685, 18, '2db39526cd8f186d06288a66e1030a8db06f178aca16905e5b5bb6d7925b3f3c', '2025-03-30 14:26:04', '2025-03-30 15:26:04');

-- --------------------------------------------------------

--
-- Table structure for table `unilevel_stage_level_commission`
--

CREATE TABLE `unilevel_stage_level_commission` (
  `id` int(5) NOT NULL,
  `pkg_id` varchar(255) DEFAULT NULL,
  `commission_type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '''1''=>Percent,''2''=>Flat'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `unilevel_stage_level_commission`
--

INSERT INTO `unilevel_stage_level_commission` (`id`, `pkg_id`, `commission_type`) VALUES
(1, '1', '2');

-- --------------------------------------------------------

--
-- Table structure for table `unilevel_stage_level_commission_meta`
--

CREATE TABLE `unilevel_stage_level_commission_meta` (
  `id` bigint(10) NOT NULL,
  `pkg_id` varchar(255) DEFAULT NULL,
  `stage_no` varchar(255) DEFAULT NULL,
  `stage_key` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `commission_amount` varchar(255) DEFAULT NULL,
  `tution_fee_com` varchar(20) DEFAULT NULL,
  `food_bonus` varchar(100) NOT NULL,
  `shopping_bonus` varchar(100) NOT NULL,
  `cash_bonus` varchar(100) NOT NULL,
  `car_bonus` varchar(100) NOT NULL,
  `family_bonus` varchar(100) NOT NULL,
  `housing_bonus` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `unilevel_stage_level_commission_meta`
--

INSERT INTO `unilevel_stage_level_commission_meta` (`id`, `pkg_id`, `stage_no`, `stage_key`, `level`, `commission_amount`, `tution_fee_com`, `food_bonus`, `shopping_bonus`, `cash_bonus`, `car_bonus`, `family_bonus`, `housing_bonus`) VALUES
(1, '1', '1', 'feeder_stage', '1', '6', '7', '', '6', '', '', '', ''),
(2, '1', '1', 'feeder_stage', '2', '1.25', '2', '', '2', '', '', '', ''),
(3, '1', '1', 'feeder_stage', '3', '0.375', '0.5', '', '0', '', '', '', ''),
(4, '1', '1', 'feeder_stage', '4', '0.125', '0.125', '', '0', '', '', '', ''),
(5, '1', '1', 'feeder_stage', '5', '0.0625', '0.03125', '', '0', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `unilevel_stage_level_commission_meta_copy`
--

CREATE TABLE `unilevel_stage_level_commission_meta_copy` (
  `id` bigint(10) NOT NULL,
  `pkg_id` varchar(255) DEFAULT NULL,
  `stage_no` varchar(255) DEFAULT NULL,
  `stage_key` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `commission_amount` varchar(255) DEFAULT NULL,
  `food_bonus` varchar(100) NOT NULL,
  `shopping_bonus` varchar(100) NOT NULL,
  `cash_bonus` varchar(100) NOT NULL,
  `car_bonus` varchar(100) NOT NULL,
  `family_bonus` varchar(100) NOT NULL,
  `housing_bonus` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `unilevel_stage_level_commission_meta_copy`
--

INSERT INTO `unilevel_stage_level_commission_meta_copy` (`id`, `pkg_id`, `stage_no`, `stage_key`, `level`, `commission_amount`, `food_bonus`, `shopping_bonus`, `cash_bonus`, `car_bonus`, `family_bonus`, `housing_bonus`) VALUES
(1, '1', '1', 'feeder_stage', '1', '2.66', '2.66', '', '', '', '', ''),
(2, '1', '2', 'stage_1', '1', '5.66', '2.83', '', '2.83', '', '', ''),
(3, '1', '2', 'stage_1', '2', '5.66', '2.83', '', '2.83', '', '', ''),
(4, '1', '3', 'stage_2', '1', '29', '8.33', '9', '11.67', '', '', ''),
(5, '1', '3', 'stage_2', '2', '29', '8.33', '9', '11.67', '', '', ''),
(6, '1', '4', 'stage_3', '1', '366.66', '16.33', '17', '333.33', '', '', ''),
(7, '1', '4', 'stage_3', '2', '366.66', '16.33', '17', '333.33', '', '', ''),
(8, '1', '5', 'stage_4', '1', '766.66', '25', '25', '216.66', '500', '', ''),
(9, '1', '5', 'stage_4', '2', '766.66', '25', '25', '216.66', '500', '', ''),
(10, '1', '6', 'stage_5', '1', '1933.32', '58.33', '58.33', '983.33', '833.33', '', ''),
(11, '1', '6', 'stage_5', '2', '1933.32', '58.33', '58.33', '983.33', '833.33', '', ''),
(42, '2', '1', 'feeder_stage', '1', '5.33', '5.33', '', '', '', '', ''),
(43, '2', '2', 'stage_1', '1', '11.41', '5.66', '', '5.75', '', '', ''),
(44, '2', '2', 'stage_1', '2', '11.41', '5.66', '', '5.75', '', '', ''),
(45, '2', '3', 'stage_2', '1', '58.66', '14.33', '19.33', '25', '', '', ''),
(46, '2', '3', 'stage_2', '2', '58.66', '14.33', '19.33', '25', '', '', ''),
(47, '2', '4', 'stage_3', '1', '742.50', '21.27', '21.33', '200', '500', '', ''),
(48, '2', '4', 'stage_3', '2', '742.50', '21.27', '21.33', '200', '500', '', ''),
(49, '2', '5', 'stage_4', '1', '1553.33', '58.33', '58.33', '436.67', '1000', '', ''),
(50, '2', '5', 'stage_4', '2', '1553.33', '58.33', '58.33', '436.67', '1000', '', ''),
(51, '2', '6', 'stage_5', '1', '3916.66', '116.66', '133.33', '1666.67', '', '500', '1500'),
(52, '2', '6', 'stage_5', '2', '3916.66', '116.66', '133.33', '1666.67', '', '500', '1000'),
(53, '3', '1', 'feeder_stage', '1', '8', '8', '', '', '', '', ''),
(54, '3', '2', 'stage_1', '1', '17.41', '8.66', '', '8.75', '', '', ''),
(55, '3', '2', 'stage_1', '2', '17.41', '8.66', '', '8.75', '', '', ''),
(56, '3', '3', 'stage_2', '1', '89.33', '28', '28', '33.33', '', '', ''),
(57, '3', '3', 'stage_2', '2', '89.33', '28', '28', '33.33', '', '', ''),
(58, '3', '4', 'stage_3', '1', '1131.66', '40', '41.66', '383.33', '666.67', '', ''),
(59, '3', '4', 'stage_3', '2', '1131.66', '40', '41.66', '383.33', '666.67', '', ''),
(60, '3', '5', 'stage_4', '1', '2366.66', '66.66', '66.66', '1066.67', '1166.67', '', ''),
(61, '3', '5', 'stage_4', '2', '2366.66', '66.66', '66.66', '1066.67', '1166.67', '', ''),
(62, '3', '6', 'stage_5', '1', '5975', '150', '158.33', '3333.34', '', '500', '1833.33'),
(63, '3', '6', 'stage_5', '2', '5975', '150', '158.33', '3333.34', '', '500', '1833.33');

-- --------------------------------------------------------

--
-- Table structure for table `unilevel_stage_level_commission_meta_matrix`
--

CREATE TABLE `unilevel_stage_level_commission_meta_matrix` (
  `id` bigint(10) NOT NULL,
  `pkg_id` varchar(255) DEFAULT NULL,
  `stage_no` varchar(255) DEFAULT NULL,
  `stage_key` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `commission_amount` varchar(255) DEFAULT NULL,
  `food_bonus` varchar(100) NOT NULL,
  `shopping_bonus` varchar(100) NOT NULL,
  `cash_bonus` varchar(100) NOT NULL,
  `car_bonus` varchar(100) NOT NULL,
  `family_bonus` varchar(100) NOT NULL,
  `housing_bonus` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `unilevel_stage_level_commission_meta_matrix`
--

INSERT INTO `unilevel_stage_level_commission_meta_matrix` (`id`, `pkg_id`, `stage_no`, `stage_key`, `level`, `commission_amount`, `food_bonus`, `shopping_bonus`, `cash_bonus`, `car_bonus`, `family_bonus`, `housing_bonus`) VALUES
(1, '1', '1', 'feeder_stage', '1', '2.66', '2.66', '', '', '', '', ''),
(2, '1', '2', 'stage_1', '1', '5.66', '2.83', '', '2.83', '', '', ''),
(3, '1', '2', 'stage_1', '2', '5.66', '2.83', '', '2.83', '', '', ''),
(4, '1', '3', 'stage_2', '1', '29', '8.33', '9', '11.67', '', '', ''),
(5, '1', '3', 'stage_2', '2', '29', '8.33', '9', '11.67', '', '', ''),
(6, '1', '4', 'stage_3', '1', '366.66', '16.33', '17', '333.33', '', '', ''),
(7, '1', '4', 'stage_3', '2', '366.66', '16.33', '17', '333.33', '', '', ''),
(8, '1', '5', 'stage_4', '1', '766.66', '25', '25', '216.66', '500', '', ''),
(9, '1', '5', 'stage_4', '2', '766.66', '25', '25', '216.66', '500', '', ''),
(10, '1', '6', 'stage_5', '1', '1933.32', '58.33', '58.33', '983.33', '833.33', '', ''),
(11, '1', '6', 'stage_5', '2', '1933.32', '58.33', '58.33', '983.33', '833.33', '', ''),
(42, '2', '1', 'feeder_stage', '1', '5.33', '5.33', '', '', '', '', ''),
(43, '2', '2', 'stage_1', '1', '11.41', '5.66', '', '5.75', '', '', ''),
(44, '2', '2', 'stage_1', '2', '11.41', '5.66', '', '5.75', '', '', ''),
(45, '2', '3', 'stage_2', '1', '58.66', '14.33', '19.33', '25', '', '', ''),
(46, '2', '3', 'stage_2', '2', '58.66', '14.33', '19.33', '25', '', '', ''),
(47, '2', '4', 'stage_3', '1', '742.50', '21.27', '21.33', '200', '500', '', ''),
(48, '2', '4', 'stage_3', '2', '742.50', '21.27', '21.33', '200', '500', '', ''),
(49, '2', '5', 'stage_4', '1', '1553.33', '58.33', '58.33', '436.67', '1000', '', ''),
(50, '2', '5', 'stage_4', '2', '1553.33', '58.33', '58.33', '436.67', '1000', '', ''),
(51, '2', '6', 'stage_5', '1', '3916.66', '116.66', '133.33', '1666.67', '', '500', '1500'),
(52, '2', '6', 'stage_5', '2', '3916.66', '116.66', '133.33', '1666.67', '', '500', '1000'),
(53, '3', '1', 'feeder_stage', '1', '8', '8', '', '', '', '', ''),
(54, '3', '2', 'stage_1', '1', '17.41', '8.66', '', '8.75', '', '', ''),
(55, '3', '2', 'stage_1', '2', '17.41', '8.66', '', '8.75', '', '', ''),
(56, '3', '3', 'stage_2', '1', '89.33', '28', '28', '33.33', '', '', ''),
(57, '3', '3', 'stage_2', '2', '89.33', '28', '28', '33.33', '', '', ''),
(58, '3', '4', 'stage_3', '1', '1131.66', '40', '41.66', '383.33', '666.67', '', ''),
(59, '3', '4', 'stage_3', '2', '1131.66', '40', '41.66', '383.33', '666.67', '', ''),
(60, '3', '5', 'stage_4', '1', '2366.66', '66.66', '66.66', '1066.67', '1166.67', '', ''),
(61, '3', '5', 'stage_4', '2', '2366.66', '66.66', '66.66', '1066.67', '1166.67', '', ''),
(62, '3', '6', 'stage_5', '1', '5975', '150', '158.33', '3333.34', '', '500', '1833.33'),
(63, '3', '6', 'stage_5', '2', '5975', '150', '158.33', '3333.34', '', '500', '1833.33');

-- --------------------------------------------------------

--
-- Table structure for table `upgrade_request`
--

CREATE TABLE `upgrade_request` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `upgrade_to` int(5) DEFAULT NULL,
  `upgrade_amount` varchar(50) DEFAULT NULL,
  `pkg_id` int(5) DEFAULT NULL,
  `pkg_amount` varchar(50) DEFAULT NULL,
  `pay_mode` varchar(20) DEFAULT NULL,
  `proof` text DEFAULT NULL,
  `request_date` date DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `approve_date` date DEFAULT NULL,
  `cancel_date` date DEFAULT NULL,
  `ts` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(5) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_type` int(2) DEFAULT NULL COMMENT '1=>admin,2=>vendor,3=>user',
  `user_email` varchar(100) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_login_date` datetime DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_id_setting`
--

CREATE TABLE `user_id_setting` (
  `id` int(3) NOT NULL,
  `type` enum('0','1') NOT NULL DEFAULT '0' COMMENT '''0''=>Default set,''1''=>Dynamic set',
  `prefix` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_id_setting`
--

INSERT INTO `user_id_setting` (`id`, `type`, `prefix`) VALUES
(1, '1', 'DEMO');

-- --------------------------------------------------------

--
-- Table structure for table `user_login`
--

CREATE TABLE `user_login` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` int(1) NOT NULL COMMENT '1 Affiliate,2 School,3 Student',
  `current_login_status` int(1) NOT NULL,
  `active_status` int(1) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `login_type` varchar(20) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `login_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `user_login`
--

INSERT INTO `user_login` (`id`, `user_id`, `username`, `password`, `status`, `current_login_status`, `active_status`, `ts`, `login_type`, `last_login`, `login_status`) VALUES
(1, '123456', 'customer', '12345', 1, 1, 1, '2023-12-06 09:48:06', 'company', '2024-04-04 05:39:34', 0),
(36, '7490726', 'affiliate1', '123', 2, 0, 1, '2024-01-10 03:04:12', 'company', NULL, 0),
(37, '9724876', 'affiliate2', '123', 2, 0, 1, '2024-01-10 03:05:48', 'company', NULL, 0),
(38, 'V2775446', 'test2', '123', 3, 0, 0, '2024-02-23 08:46:03', 'agency', NULL, 0),
(39, '7019276', 'agency', '12345', 2, 0, 0, '2024-02-23 09:01:04', 'agency', '2024-03-19 07:53:04', 1),
(40, '2716526', 'company', '12345', 1, 1, 1, '2024-02-24 09:04:36', 'company', '2024-08-14 07:04:53', 0),
(41, 'V3873166', 'test', 'test', 3, 0, 0, '2024-02-25 14:40:23', 'agency', NULL, 0),
(42, 'V7476946', 'subhashpal23', 'Subhash@123', 3, 0, 0, '2024-03-09 07:40:47', 'agency', NULL, 0),
(43, 'V5948746', ' Test', '123', 2, 0, 0, '2024-03-09 08:00:59', 'agency', NULL, 0),
(44, 'V3474076', 'subhash', 'subhash', 1, 1, 1, '2024-03-09 09:10:20', 'company', '2024-04-04 05:34:40', 0),
(45, 'V5381826', 'candidate1', '123', 3, 0, 0, '2024-03-19 08:40:23', 'candidate', '2024-09-27 12:54:32', 1),
(46, 'V2643316', 'jhj', 'j', 1, 0, 0, '2024-03-19 09:28:06', 'company', NULL, 0),
(47, 'V3122616', 'agent1', '12345', 2, 0, 0, '2024-03-19 09:38:26', 'agency', '2024-09-27 12:56:37', 1),
(48, 'V6267626', 'candiate123', '123', 2, 0, 0, '2024-04-04 06:00:15', 'agency', NULL, 0),
(49, 'V2713136', 'subhash1', '123', 3, 0, 0, '2024-04-04 06:01:06', 'agency', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_package_log`
--

CREATE TABLE `user_package_log` (
  `id` bigint(10) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `old_package_id` bigint(6) DEFAULT NULL,
  `new_package_id` bigint(6) NOT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `active_status` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=>Inactived,1=>activated',
  `purchased_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_package_log`
--

INSERT INTO `user_package_log` (`id`, `user_id`, `old_package_id`, `new_package_id`, `amount`, `active_status`, `purchased_date`) VALUES
(1, '7490726', NULL, 1, NULL, '1', '2024-01-10 03:04:12'),
(2, '9724876', NULL, 1, NULL, '1', '2024-01-10 03:05:48');

-- --------------------------------------------------------

--
-- Table structure for table `user_registration`
--

CREATE TABLE `user_registration` (
  `id` int(11) NOT NULL,
  `user_id` varchar(110) NOT NULL,
  `ref_id` varchar(110) NOT NULL,
  `nom_id` varchar(110) NOT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `idno` varchar(500) DEFAULT NULL,
  `aadharno` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `t_code` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contact_no` varchar(255) DEFAULT NULL,
  `gender` enum('0','1') NOT NULL DEFAULT '1' COMMENT '''0''=>female,''1''=>male',
  `date_of_birth` varchar(255) DEFAULT NULL,
  `address_line1` text DEFAULT NULL,
  `address_line2` text DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `ifsc_code` varchar(255) DEFAULT NULL,
  `account_holder_name` varchar(255) DEFAULT NULL,
  `account_no` varchar(255) DEFAULT NULL,
  `facebook_link` varchar(255) DEFAULT NULL,
  `twitter_link` varchar(255) DEFAULT NULL,
  `linkedin_link` varchar(255) DEFAULT NULL,
  `google_plus_link` varchar(255) DEFAULT NULL,
  `registration_date` varchar(100) NOT NULL,
  `auto_registration_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `registration_method` enum('1','2','3','4','5') DEFAULT NULL COMMENT '&#039;1&#039;=&gt;Via ewallet,&#039;2&#039;=&gt;Via Epin,&#039;3&#039;=&gt;Via Bank Wire,&#039;4&#039;=&gt;Via Bit Coin,5->paystack',
  `registration_method_name` varchar(255) NOT NULL DEFAULT 'E-Wallet',
  `registration_status` enum('0','1') NOT NULL DEFAULT '0' COMMENT '''0''=>pending,''1''=>approved or active (if user is registered by banwire)',
  `binary_pos` varchar(100) NOT NULL,
  `pkg_id` int(3) DEFAULT NULL,
  `pkg_amount` bigint(10) DEFAULT NULL,
  `rank_id` int(3) DEFAULT NULL,
  `rank_name` varchar(255) DEFAULT 'Affiliate',
  `last_login` datetime DEFAULT NULL,
  `current_login_status` enum('0','1') NOT NULL DEFAULT '0' COMMENT '''0''=>logout, ''1''=>login',
  `active_status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '''0''=>Deactive, ''1''=>Active',
  `panel_title` varchar(255) DEFAULT 'User Panel',
  `image` varchar(255) DEFAULT NULL,
  `member_type` enum('1','2','3','4','5') NOT NULL DEFAULT '1' COMMENT '''1''=>Affiliate, ''2''=>School, ''3''=>Student',
  `business_plan_update_date` varchar(255) DEFAULT NULL,
  `ref_leg_position` varchar(255) DEFAULT NULL,
  `nom_leg_position` varchar(255) DEFAULT NULL,
  `stage_name` varchar(50) NOT NULL DEFAULT 'feeder_stage'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `user_registration`
--

INSERT INTO `user_registration` (`id`, `user_id`, `ref_id`, `nom_id`, `parent_id`, `username`, `idno`, `aadharno`, `password`, `t_code`, `first_name`, `last_name`, `email`, `contact_no`, `gender`, `date_of_birth`, `address_line1`, `address_line2`, `country`, `state`, `city`, `zip_code`, `bank_name`, `branch_name`, `ifsc_code`, `account_holder_name`, `account_no`, `facebook_link`, `twitter_link`, `linkedin_link`, `google_plus_link`, `registration_date`, `auto_registration_date`, `registration_method`, `registration_method_name`, `registration_status`, `binary_pos`, `pkg_id`, `pkg_amount`, `rank_id`, `rank_name`, `last_login`, `current_login_status`, `active_status`, `panel_title`, `image`, `member_type`, `business_plan_update_date`, `ref_leg_position`, `nom_leg_position`, `stage_name`) VALUES
(1, '123456', 'cmp', 'cmp', '0', 'customer', '', '', '12345', '12345', 'Inter', 'School', 'interschool@gmail.com', '1234567890', '1', NULL, 'sdjkkdfj', 'jhjh', 'Nigeria', 'Uttar Pradesh', 'Noida', '201301', 'test name', 'kjkjjkjkjk', NULL, 'test customer', 'test no 1244', NULL, NULL, NULL, NULL, '2023-12-05', '2023-12-05 01:52:42', '2', 'E-Wallet', '1', '', 1, 20, NULL, 'Affiliate', NULL, '1', '1', 'User Panel', '', '1', NULL, NULL, NULL, 'feeder_stage'),
(21, '7490726', '123456', '123456', NULL, 'affiliate1', NULL, NULL, '123', '123', '123', NULL, 'test@gmail.com', '123', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '10-01-2024', '2024-01-10 03:04:12', '2', 'E-Pin', '0', '', 1, 20, NULL, 'Affiliate', NULL, '0', '1', 'User Panel', NULL, '1', NULL, 'left', NULL, 'feeder_stage'),
(23, '9724876', '123456', '123456', NULL, 'affiliate2', NULL, NULL, '123', '123', '123', NULL, 'test@gmail.com', '123', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '10-01-2024', '2024-01-10 03:05:48', '2', 'E-Pin', '0', '', 1, 20, NULL, 'Affiliate', NULL, '0', '1', 'User Panel', NULL, '1', NULL, 'left', NULL, 'feeder_stage'),
(24, 'V2150806', '', '', '1710726', 'test', NULL, NULL, '12345', '12345', 'Pankaj', 'Dubey', 'test@gmail.ciom', '1234567890', '', NULL, '10/05/1986', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23-02-2024', '2024-02-23 08:38:12', '2', 'Free', '0', '', NULL, NULL, NULL, 'Affiliate', NULL, '0', '1', 'User Panel', NULL, '3', NULL, 'left', NULL, 'feeder_stage'),
(25, 'V7786596', '', '', '1710726', 'test1', NULL, NULL, '123', '123', 'Subhash', 'Pal', '', '1234567890', '', NULL, '10/05/1986', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23-02-2024', '2024-02-23 08:43:44', '2', 'Free', '0', '', NULL, NULL, NULL, 'Affiliate', NULL, '0', '0', 'User Panel', NULL, '3', NULL, 'left', NULL, 'feeder_stage'),
(26, 'V2775446', '', '', '1710726', 'test2', NULL, NULL, '123', '123', 'Subhash', 'Pal', '', 'test', '', NULL, '10/05/1986', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23-02-2024', '2024-02-23 08:46:03', '2', 'Free', '0', '', NULL, NULL, NULL, 'Affiliate', NULL, '0', '0', 'User Panel', NULL, '3', NULL, 'left', NULL, 'feeder_stage'),
(27, '7019276', '', '', '123456', 'agency2', NULL, NULL, '12345', '12345', 'Subhash', 'Pal', 'test@gmail.ciom', '1234567890', '', NULL, '10/05/1986', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23-02-2024', '2024-02-23 09:01:04', '2', 'Free', '0', '', NULL, NULL, NULL, 'Affiliate', NULL, '1', '1', 'User Panel', NULL, '2', NULL, 'left', NULL, 'feeder_stage'),
(28, '2716526', '', '', '123456', 'shsdh', NULL, NULL, 'hjdsj', 'hjdsj', 'Subhash', NULL, 'akshd@kjds.com', 'ksjdhj', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '24-02-2024', '2024-02-24 09:04:36', '2', 'Free', '0', '', NULL, NULL, NULL, 'Affiliate', NULL, '0', '1', 'User Panel', NULL, '1', NULL, 'left', NULL, 'feeder_stage'),
(29, 'V3873166', '', '', '7019276', '', NULL, NULL, '', '', 'Subhash', 'Pal', '', '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '25-02-2024', '2024-02-25 14:40:23', '2', 'Free', '0', '', NULL, NULL, NULL, 'Affiliate', NULL, '0', '0', 'User Panel', NULL, '3', NULL, 'left', NULL, 'feeder_stage'),
(30, 'V7476946', '', '', '7019276', 'subhashpal23', NULL, NULL, 'Subhash@123', 'Subhash@123', 'Subhash', 'Pal', 'subhashsws6@gmail.com', '9990694126', '1', NULL, '10/05/1986', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '09-03-2024', '2024-03-09 07:40:47', '2', 'Free', '0', '', NULL, NULL, NULL, 'Affiliate', NULL, '0', '0', 'User Panel', NULL, '3', NULL, 'left', NULL, 'feeder_stage'),
(31, 'V5948746', '', '', '123456', ' Test', NULL, NULL, '123', '123', 'Pankaj', 'Dubey', 'subhashsws6@gmail.com', '9990694126', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '09-03-2024', '2024-03-09 08:00:59', '2', 'Free', '0', '', NULL, NULL, NULL, 'Affiliate', NULL, '0', '1', 'User Panel', NULL, '2', NULL, 'left', NULL, 'feeder_stage'),
(32, 'V3474076', '', '', '123456', 'subhash', NULL, NULL, 'subhash', 'subhash', 'Subhash', NULL, 'subhashsws6@gmail.com', '1234567890', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '09-03-2024', '2024-03-09 09:10:20', '2', 'Free', '0', '', NULL, NULL, NULL, 'Affiliate', NULL, '1', '1', 'User Panel', NULL, '1', NULL, 'left', NULL, 'feeder_stage'),
(34, 'V7365046', '', '', NULL, 'candidate', NULL, NULL, '12345', '12345', 'Subhash', 'Pal', 'jhj@gmail.com', 'h', '1', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '19-03-2024', '2024-03-19 08:37:46', '2', 'Free', '0', '', NULL, NULL, NULL, 'Affiliate', NULL, '0', '0', 'User Panel', NULL, '3', NULL, 'left', NULL, 'feeder_stage'),
(36, 'V5381826', '', '', NULL, 'candidate1', NULL, NULL, '123', '123', 'Subhash', 'Pal', 'jhj@gmail.com', 'h', '1', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '19-03-2024', '2024-03-19 08:40:23', '2', 'Free', '0', '', NULL, NULL, NULL, 'Affiliate', NULL, '1', '0', 'User Panel', NULL, '3', NULL, 'left', NULL, 'feeder_stage'),
(37, 'V2643316', '', '', NULL, 'jhj', NULL, NULL, 'j', 'j', 'asjdhj', NULL, 'hj@gmail.com', 'hh', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '19-03-2024', '2024-03-19 09:28:06', '2', 'Free', '0', '', NULL, NULL, NULL, 'Affiliate', NULL, '1', '1', 'User Panel', NULL, '1', NULL, 'left', NULL, 'feeder_stage'),
(38, 'V3122616', '', '', NULL, 'agent1', NULL, NULL, '12345', '12345', 'ashj', 'jhhj', 'subpal2009@gmail.com', 'hjhj', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '19-03-2024', '2024-03-19 09:38:26', '2', 'Free', '0', '', NULL, NULL, NULL, 'Affiliate', NULL, '1', '1', 'User Panel', NULL, '2', NULL, 'left', NULL, 'feeder_stage'),
(39, 'V6267626', '', '', 'V3122616', 'candiate123', NULL, NULL, '123', '123', 'ajg', 'jh', 'hggma@gmai.com', 'hg', '1', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '04-04-2024', '2024-04-04 06:00:15', '2', 'Free', '0', '', NULL, NULL, NULL, 'Affiliate', NULL, '0', '1', 'User Panel', NULL, '2', NULL, 'left', NULL, 'feeder_stage'),
(40, 'V2713136', '', '', 'V3122616', 'subhash1', NULL, NULL, '123', '123', 'Subhash', 'Pal', 'subhashsws6@gmail.com', '9990694126', '1', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '04-04-2024', '2024-04-04 06:01:05', '2', 'Free', '0', '', NULL, NULL, NULL, 'Affiliate', NULL, '0', '0', 'User Panel', NULL, '3', NULL, 'left', NULL, 'feeder_stage'),
(41, 'V1462946', '', '', '2716526', 'employee1', NULL, NULL, '123', '123', 'Subhash', 'Pal', '', '', '1', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '04-04-2024', '2024-04-04 06:01:52', '2', 'Free', '0', '', NULL, NULL, NULL, 'Affiliate', NULL, '0', '1', 'User Panel', NULL, '3', NULL, 'left', NULL, 'feeder_stage');

-- --------------------------------------------------------

--
-- Table structure for table `user_school`
--

CREATE TABLE `user_school` (
  `id` int(11) NOT NULL,
  `user_id` varchar(110) NOT NULL,
  `ref_id` varchar(110) NOT NULL,
  `nom_id` varchar(110) NOT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `contact_person` varchar(500) DEFAULT NULL,
  `contact_person_email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `contact_person_phone` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contact_no` varchar(255) DEFAULT NULL,
  `gender` enum('0','1') NOT NULL DEFAULT '1' COMMENT '''0''=>female,''1''=>male',
  `date_of_birth` varchar(255) DEFAULT NULL,
  `address_line1` text DEFAULT NULL,
  `address_line2` text DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `ifsc_code` varchar(255) DEFAULT NULL,
  `account_holder_name` varchar(255) DEFAULT NULL,
  `account_no` varchar(255) DEFAULT NULL,
  `facebook_link` varchar(255) DEFAULT NULL,
  `twitter_link` varchar(255) DEFAULT NULL,
  `linkedin_link` varchar(255) DEFAULT NULL,
  `google_plus_link` varchar(255) DEFAULT NULL,
  `registration_date` varchar(100) NOT NULL,
  `auto_registration_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `registration_method` enum('1','2','3','4','5') DEFAULT NULL COMMENT '&#039;1&#039;=&gt;Via ewallet,&#039;2&#039;=&gt;Via Epin,&#039;3&#039;=&gt;Via Bank Wire,&#039;4&#039;=&gt;Via Bit Coin,5->paystack',
  `registration_method_name` varchar(255) NOT NULL DEFAULT 'E-Wallet',
  `registration_status` enum('0','1') NOT NULL DEFAULT '0' COMMENT '''0''=>pending,''1''=>approved or active (if user is registered by banwire)',
  `binary_pos` varchar(100) NOT NULL,
  `pkg_id` int(3) DEFAULT NULL,
  `pkg_amount` bigint(10) DEFAULT NULL,
  `rank_id` int(3) DEFAULT NULL,
  `rank_name` varchar(255) DEFAULT 'Affiliate',
  `last_login` datetime DEFAULT NULL,
  `current_login_status` enum('0','1') NOT NULL DEFAULT '0' COMMENT '''0''=>logout, ''1''=>login',
  `active_status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '''0''=>Deactive, ''1''=>Active',
  `panel_title` varchar(255) DEFAULT 'User Panel',
  `image` varchar(255) DEFAULT NULL,
  `member_type` enum('1','2','3','4','5') NOT NULL DEFAULT '1' COMMENT '''1''=>Affiliate, ''2''=>School, ''3''=>Student',
  `business_plan_update_date` varchar(255) DEFAULT NULL,
  `ref_leg_position` varchar(255) DEFAULT NULL,
  `nom_leg_position` varchar(255) DEFAULT NULL,
  `stage_name` varchar(50) NOT NULL DEFAULT 'feeder_stage'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_school_docs`
--

CREATE TABLE `user_school_docs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(20) DEFAULT NULL,
  `documents_list` longtext NOT NULL,
  `status` int(1) NOT NULL,
  `verify_status` int(1) NOT NULL COMMENT '0 pending, 1 approve, 2 cancel',
  `verify_date` date NOT NULL,
  `request_date` date NOT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_student`
--

CREATE TABLE `user_student` (
  `id` int(11) NOT NULL,
  `user_id` varchar(110) NOT NULL,
  `ref_id` varchar(110) NOT NULL,
  `nom_id` varchar(110) NOT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `idno` varchar(500) DEFAULT NULL,
  `aadharno` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `t_code` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contact_no` varchar(255) DEFAULT NULL,
  `gender` enum('0','1') NOT NULL DEFAULT '1' COMMENT '''0''=>female,''1''=>male',
  `date_of_birth` varchar(255) DEFAULT NULL,
  `address_line1` text DEFAULT NULL,
  `address_line2` text DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `ifsc_code` varchar(255) DEFAULT NULL,
  `account_holder_name` varchar(255) DEFAULT NULL,
  `account_no` varchar(255) DEFAULT NULL,
  `facebook_link` varchar(255) DEFAULT NULL,
  `twitter_link` varchar(255) DEFAULT NULL,
  `linkedin_link` varchar(255) DEFAULT NULL,
  `google_plus_link` varchar(255) DEFAULT NULL,
  `registration_date` varchar(100) NOT NULL,
  `auto_registration_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `registration_method` enum('1','2','3','4','5') DEFAULT NULL COMMENT '&#039;1&#039;=&gt;Via ewallet,&#039;2&#039;=&gt;Via Epin,&#039;3&#039;=&gt;Via Bank Wire,&#039;4&#039;=&gt;Via Bit Coin,5->paystack',
  `registration_method_name` varchar(255) NOT NULL DEFAULT 'E-Wallet',
  `registration_status` enum('0','1') NOT NULL DEFAULT '0' COMMENT '''0''=>pending,''1''=>approved or active (if user is registered by banwire)',
  `binary_pos` varchar(100) NOT NULL,
  `pkg_id` int(3) DEFAULT NULL,
  `pkg_amount` bigint(10) DEFAULT NULL,
  `rank_id` int(3) DEFAULT NULL,
  `rank_name` varchar(255) DEFAULT 'Affiliate',
  `last_login` datetime DEFAULT NULL,
  `current_login_status` enum('0','1') NOT NULL DEFAULT '0' COMMENT '''0''=>logout, ''1''=>login',
  `active_status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '''0''=>Deactive, ''1''=>Active',
  `panel_title` varchar(255) DEFAULT 'User Panel',
  `image` varchar(255) DEFAULT NULL,
  `member_type` enum('1','2','3','4','5') NOT NULL DEFAULT '1' COMMENT '''1''=>Affiliate, ''2''=>School, ''3''=>Student',
  `business_plan_update_date` varchar(255) DEFAULT NULL,
  `ref_leg_position` varchar(255) DEFAULT NULL,
  `nom_leg_position` varchar(255) DEFAULT NULL,
  `stage_name` varchar(50) NOT NULL DEFAULT 'feeder_stage'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `value_store`
--

CREATE TABLE `value_store` (
  `id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  `thekey` varchar(255) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitor`
--

CREATE TABLE `visitor` (
  `id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `username` varchar(1000) NOT NULL,
  `fullname` varchar(1000) NOT NULL,
  `ipadd` varchar(1000) NOT NULL,
  `times` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `visitor`
--

INSERT INTO `visitor` (`id`, `user_id`, `username`, `fullname`, `ipadd`, `times`) VALUES
(1, '123456', 'customer', ' ', '122.179.181.41', '2024-01-10 03:12:32'),
(2, '123456', 'customer', ' ', '122.179.181.41', '2024-01-10 03:13:55'),
(3, '7019276', 'agency', ' ', '106.202.136.143', '2024-03-19 07:45:05'),
(4, '7019276', 'agency', ' ', '106.202.136.143', '2024-03-19 07:45:44'),
(5, '7019276', 'agency', ' ', '106.202.136.143', '2024-03-19 07:53:22'),
(6, '7019276', 'agency', ' ', '106.202.136.143', '2024-03-19 07:53:45'),
(7, '7019276', 'agency', ' ', '106.202.136.143', '2024-03-19 07:55:16'),
(8, '7019276', 'agency', ' ', '106.202.136.143', '2024-03-19 08:00:38'),
(9, '7019276', 'agency', ' ', '106.202.136.143', '2024-03-19 08:27:56'),
(10, 'V2643316', 'jhj', ' ', '106.202.136.143', '2024-03-19 09:28:32'),
(11, 'V3122616', 'agent1', ' ', '106.202.136.143', '2024-03-19 09:39:02'),
(12, 'V3474076', 'subhash', ' ', '106.202.136.143', '2024-03-19 09:39:26'),
(13, 'V3474076', 'subhash', ' ', '106.202.136.143', '2024-03-19 09:51:39'),
(14, 'V5381826', 'candidate1', ' ', '106.202.136.143', '2024-03-19 09:52:05');

-- --------------------------------------------------------

--
-- Table structure for table `wallet_type`
--

CREATE TABLE `wallet_type` (
  `id` int(11) NOT NULL,
  `wallet_name` varchar(20) NOT NULL,
  `wallet_type_name` varchar(100) NOT NULL,
  `status` int(1) NOT NULL,
  `withdraw` int(11) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `wallet_type`
--

INSERT INTO `wallet_type` (`id`, `wallet_name`, `wallet_type_name`, `status`, `withdraw`, `ts`) VALUES
(1, 'main', 'Main', 0, 1, '2022-09-23 07:53:53');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawl_wallet_amount_request`
--

CREATE TABLE `withdrawl_wallet_amount_request` (
  `id` bigint(10) NOT NULL,
  `request_id` varchar(255) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `title` text DEFAULT NULL,
  `amount` varchar(255) NOT NULL,
  `status` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '''0''=>Pending,''1''=>Approved,''2''=>Cancelled',
  `request_date` datetime NOT NULL DEFAULT current_timestamp(),
  `response_date` datetime DEFAULT NULL,
  `payment_method` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `admin_charge`
--
ALTER TABLE `admin_charge`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_sub`
--
ALTER TABLE `admin_sub`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_log`
--
ALTER TABLE `app_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_wired_detail`
--
ALTER TABLE `bank_wired_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_wired_user_registration`
--
ALTER TABLE `bank_wired_user_registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bit_coin_payment_details`
--
ALTER TABLE `bit_coin_payment_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `candiates`
--
ALTER TABLE `candiates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commission_permission`
--
ALTER TABLE `commission_permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commission_type`
--
ALTER TABLE `commission_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `confidential`
--
ALTER TABLE `confidential`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `consumer_supplier_map`
--
ALTER TABLE `consumer_supplier_map`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `consumer_user`
--
ALTER TABLE `consumer_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credit_debit`
--
ALTER TABLE `credit_debit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_no` (`transaction_no`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `receiver_id` (`receiver_id`),
  ADD KEY `reason` (`reason`);

--
-- Indexes for table `credit_debit_bkp`
--
ALTER TABLE `credit_debit_bkp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credit_debit_cash`
--
ALTER TABLE `credit_debit_cash`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credit_debit_invest`
--
ALTER TABLE `credit_debit_invest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credit_debit_product`
--
ALTER TABLE `credit_debit_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_no` (`transaction_no`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `receiver_id` (`receiver_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `reason` (`reason`);

--
-- Indexes for table `credit_debit_reward`
--
ALTER TABLE `credit_debit_reward`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credit_debit_saving`
--
ALTER TABLE `credit_debit_saving`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credit_debit_vtu`
--
ALTER TABLE `credit_debit_vtu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credit_debit_welcome`
--
ALTER TABLE `credit_debit_welcome`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency_display`
--
ALTER TABLE `currency_display`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `date_format`
--
ALTER TABLE `date_format`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposit_investment_amount_request`
--
ALTER TABLE `deposit_investment_amount_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposit_shopping_wallet_amount_request`
--
ALTER TABLE `deposit_shopping_wallet_amount_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposit_wallet_amount_request`
--
ALTER TABLE `deposit_wallet_amount_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `direct_commission`
--
ALTER TABLE `direct_commission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `direct_commission_meta`
--
ALTER TABLE `direct_commission_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `direct_matrix_downline`
--
ALTER TABLE `direct_matrix_downline`
  ADD PRIMARY KEY (`id`),
  ADD KEY `down_id` (`down_id`),
  ADD KEY `income_id` (`income_id`),
  ADD KEY `level_pay_status` (`level_pay_status`),
  ADD KEY `pay_status` (`pay_status`),
  ADD KEY `level` (`level`),
  ADD KEY `plan_type` (`plan_type`);

--
-- Indexes for table `epin`
--
ALTER TABLE `epin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `epin_meta`
--
ALTER TABLE `epin_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `source_user_id` (`source_user_id`),
  ADD KEY `pkg_id` (`pkg_id`),
  ADD KEY `epin_status` (`epin_status`),
  ADD KEY `register_user_id` (`register_user_id`),
  ADD KEY `epin_code` (`epin_code`);

--
-- Indexes for table `epin_meta_bkp_02072020`
--
ALTER TABLE `epin_meta_bkp_02072020`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `epin_request`
--
ALTER TABLE `epin_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eshop_adv_banner`
--
ALTER TABLE `eshop_adv_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eshop_adv_slider`
--
ALTER TABLE `eshop_adv_slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eshop_adv_slider_sidebar`
--
ALTER TABLE `eshop_adv_slider_sidebar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eshop_bonus`
--
ALTER TABLE `eshop_bonus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eshop_category`
--
ALTER TABLE `eshop_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eshop_guest`
--
ALTER TABLE `eshop_guest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eshop_guest_delivery_address`
--
ALTER TABLE `eshop_guest_delivery_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eshop_member_delivery_address`
--
ALTER TABLE `eshop_member_delivery_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eshop_orders`
--
ALTER TABLE `eshop_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eshop_orders_bkp`
--
ALTER TABLE `eshop_orders_bkp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eshop_orders_clients`
--
ALTER TABLE `eshop_orders_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eshop_orders_details`
--
ALTER TABLE `eshop_orders_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eshop_payment_method`
--
ALTER TABLE `eshop_payment_method`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eshop_products`
--
ALTER TABLE `eshop_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eshop_products_stock`
--
ALTER TABLE `eshop_products_stock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eshop_product_level_commission`
--
ALTER TABLE `eshop_product_level_commission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eshop_stock`
--
ALTER TABLE `eshop_stock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eshop_stockist_sell`
--
ALTER TABLE `eshop_stockist_sell`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eshop_stock_stockist`
--
ALTER TABLE `eshop_stock_stockist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eshop_stock_stockist_history`
--
ALTER TABLE `eshop_stock_stockist_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eshop_subcategory`
--
ALTER TABLE `eshop_subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eshop_vendors`
--
ALTER TABLE `eshop_vendors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`vendor_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `final_cash_wallet`
--
ALTER TABLE `final_cash_wallet`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `final_e_wallet`
--
ALTER TABLE `final_e_wallet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `wallet_type_id` (`wallet_type_id`),
  ADD KEY `wallet_type` (`wallet_type`);

--
-- Indexes for table `final_invest_wallet`
--
ALTER TABLE `final_invest_wallet`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `final_invest_wallet_bkp`
--
ALTER TABLE `final_invest_wallet_bkp`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `final_product_wallet`
--
ALTER TABLE `final_product_wallet`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `final_reward_wallet`
--
ALTER TABLE `final_reward_wallet`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `final_saving_wallet`
--
ALTER TABLE `final_saving_wallet`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `final_vtu_wallet`
--
ALTER TABLE `final_vtu_wallet`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `final_welcome_wallet`
--
ALTER TABLE `final_welcome_wallet`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `indirect_unilevel_commission`
--
ALTER TABLE `indirect_unilevel_commission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `indirect_unilevel_commission_meta`
--
ALTER TABLE `indirect_unilevel_commission_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_qualification` (`job_qualification`),
  ADD KEY `job_status` (`job_status`),
  ADD KEY `job_location` (`job_location`),
  ADD KEY `job_title` (`job_title`);

--
-- Indexes for table `job_searchkeywords`
--
ALTER TABLE `job_searchkeywords`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `level_income_binary`
--
ALTER TABLE `level_income_binary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lifejacket_subscription`
--
ALTER TABLE `lifejacket_subscription`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manufacturing_process`
--
ALTER TABLE `manufacturing_process`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marketing_images`
--
ALTER TABLE `marketing_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marketing_videos`
--
ALTER TABLE `marketing_videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matrix_downline`
--
ALTER TABLE `matrix_downline`
  ADD PRIMARY KEY (`id`),
  ADD KEY `down_id` (`down_id`),
  ADD KEY `income_id` (`income_id`),
  ADD KEY `level_pay_status` (`level_pay_status`),
  ADD KEY `pay_status` (`pay_status`),
  ADD KEY `level` (`level`),
  ADD KEY `plan_type` (`plan_type`);

--
-- Indexes for table `matrix_downline_pv`
--
ALTER TABLE `matrix_downline_pv`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matrix_downline_pv_bkp`
--
ALTER TABLE `matrix_downline_pv_bkp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matrix_plan`
--
ALTER TABLE `matrix_plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matrix_stage1`
--
ALTER TABLE `matrix_stage1`
  ADD PRIMARY KEY (`id`),
  ADD KEY `down_id` (`down_id`),
  ADD KEY `income_id` (`income_id`),
  ADD KEY `level` (`level`),
  ADD KEY `pay_status` (`pay_status`),
  ADD KEY `plan_type` (`plan_type`),
  ADD KEY `level_pay_status` (`level_pay_status`);

--
-- Indexes for table `matrix_stage2`
--
ALTER TABLE `matrix_stage2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `down_id` (`down_id`),
  ADD KEY `income_id` (`income_id`),
  ADD KEY `pay_status` (`pay_status`),
  ADD KEY `level_pay_status` (`level_pay_status`),
  ADD KEY `level` (`level`),
  ADD KEY `plan_type` (`plan_type`);

--
-- Indexes for table `matrix_stage3`
--
ALTER TABLE `matrix_stage3`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matrix_stage4`
--
ALTER TABLE `matrix_stage4`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matrix_stage4_old`
--
ALTER TABLE `matrix_stage4_old`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matrix_stage5`
--
ALTER TABLE `matrix_stage5`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matrix_stage6`
--
ALTER TABLE `matrix_stage6`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matrix_stage7`
--
ALTER TABLE `matrix_stage7`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matrix_stage_commission`
--
ALTER TABLE `matrix_stage_commission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matrix_stage_commission_meta`
--
ALTER TABLE `matrix_stage_commission_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matrix_stage_level_commission`
--
ALTER TABLE `matrix_stage_level_commission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matrix_stage_level_commission_meta`
--
ALTER TABLE `matrix_stage_level_commission_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matrix_stage_rank_bonus`
--
ALTER TABLE `matrix_stage_rank_bonus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matrix_stage_rank_bonus_meta`
--
ALTER TABLE `matrix_stage_rank_bonus_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_fortress`
--
ALTER TABLE `menu_fortress`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package-old`
--
ALTER TABLE `package-old`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_sold_amount`
--
ALTER TABLE `package_sold_amount`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `pkg_id` (`pkg_id`),
  ADD KEY `transaction_id` (`transaction_id`);

--
-- Indexes for table `package_sold_amount_old`
--
ALTER TABLE `package_sold_amount_old`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_paytm`
--
ALTER TABLE `payment_paytm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payout_limit`
--
ALTER TABLE `payout_limit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payout_setting`
--
ALTER TABLE `payout_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paystack_data`
--
ALTER TABLE `paystack_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pay_fast_response`
--
ALTER TABLE `pay_fast_response`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `po_products`
--
ALTER TABLE `po_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prdouct_unilevel_commission_meta`
--
ALTER TABLE `prdouct_unilevel_commission_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_purchase`
--
ALTER TABLE `product_purchase`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_order`
--
ALTER TABLE `purchase_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qualification`
--
ALTER TABLE `qualification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `quotation_products`
--
ALTER TABLE `quotation_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rank`
--
ALTER TABLE `rank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rank_log`
--
ALTER TABLE `rank_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rank_setting`
--
ALTER TABLE `rank_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rank_setting2`
--
ALTER TABLE `rank_setting2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recharge_dataplan`
--
ALTER TABLE `recharge_dataplan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recharge_vtu`
--
ALTER TABLE `recharge_vtu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `type` (`type`),
  ADD KEY `mobileno` (`mobileno`),
  ADD KEY `orderid` (`orderid`),
  ADD KEY `status` (`status`),
  ADD KEY `status_code` (`status_code`);

--
-- Indexes for table `registration_method`
--
ALTER TABLE `registration_method`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reg_stage1`
--
ALTER TABLE `reg_stage1`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `nom_id` (`nom_id`),
  ADD KEY `plan_type` (`plan_type`),
  ADD KEY `final_status` (`final_status`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `reg_stage2`
--
ALTER TABLE `reg_stage2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reg_stage3`
--
ALTER TABLE `reg_stage3`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reg_stage4`
--
ALTER TABLE `reg_stage4`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reg_stage4_old`
--
ALTER TABLE `reg_stage4_old`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reg_stage5`
--
ALTER TABLE `reg_stage5`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rfq`
--
ALTER TABLE `rfq`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rfq_code` (`rfq_code`);

--
-- Indexes for table `rfq_products`
--
ALTER TABLE `rfq_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stage_label_meta`
--
ALTER TABLE `stage_label_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_details`
--
ALTER TABLE `student_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_fees`
--
ALTER TABLE `student_fees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_quotes`
--
ALTER TABLE `supplier_quotes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support`
--
ALTER TABLE `support`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax`
--
ALTER TABLE `tax`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax_category`
--
ALTER TABLE `tax_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `unilevel_stage_level_commission`
--
ALTER TABLE `unilevel_stage_level_commission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unilevel_stage_level_commission_meta`
--
ALTER TABLE `unilevel_stage_level_commission_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unilevel_stage_level_commission_meta_copy`
--
ALTER TABLE `unilevel_stage_level_commission_meta_copy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unilevel_stage_level_commission_meta_matrix`
--
ALTER TABLE `unilevel_stage_level_commission_meta_matrix`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `upgrade_request`
--
ALTER TABLE `upgrade_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_id_setting`
--
ALTER TABLE `user_id_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_login`
--
ALTER TABLE `user_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_package_log`
--
ALTER TABLE `user_package_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_registration`
--
ALTER TABLE `user_registration`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `ref_id` (`ref_id`),
  ADD KEY `nom_id` (`nom_id`),
  ADD KEY `password` (`password`),
  ADD KEY `t_code` (`t_code`),
  ADD KEY `active_status` (`active_status`);

--
-- Indexes for table `user_school`
--
ALTER TABLE `user_school`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `ref_id` (`ref_id`),
  ADD KEY `nom_id` (`nom_id`),
  ADD KEY `password` (`password`),
  ADD KEY `t_code` (`contact_person_phone`),
  ADD KEY `active_status` (`active_status`);

--
-- Indexes for table `user_school_docs`
--
ALTER TABLE `user_school_docs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_student`
--
ALTER TABLE `user_student`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `ref_id` (`ref_id`),
  ADD KEY `nom_id` (`nom_id`),
  ADD KEY `password` (`password`),
  ADD KEY `t_code` (`t_code`),
  ADD KEY `active_status` (`active_status`);

--
-- Indexes for table `value_store`
--
ALTER TABLE `value_store`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitor`
--
ALTER TABLE `visitor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `wallet_type`
--
ALTER TABLE `wallet_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawl_wallet_amount_request`
--
ALTER TABLE `withdrawl_wallet_amount_request`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admin_charge`
--
ALTER TABLE `admin_charge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_sub`
--
ALTER TABLE `admin_sub`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `agents`
--
ALTER TABLE `agents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `app_log`
--
ALTER TABLE `app_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_wired_detail`
--
ALTER TABLE `bank_wired_detail`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bank_wired_user_registration`
--
ALTER TABLE `bank_wired_user_registration`
  MODIFY `id` bigint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bit_coin_payment_details`
--
ALTER TABLE `bit_coin_payment_details`
  MODIFY `id` bigint(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `candiates`
--
ALTER TABLE `candiates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `commission_permission`
--
ALTER TABLE `commission_permission`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `commission_type`
--
ALTER TABLE `commission_type`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `confidential`
--
ALTER TABLE `confidential`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `consumer_supplier_map`
--
ALTER TABLE `consumer_supplier_map`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `consumer_user`
--
ALTER TABLE `consumer_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `credit_debit`
--
ALTER TABLE `credit_debit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `credit_debit_bkp`
--
ALTER TABLE `credit_debit_bkp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `credit_debit_cash`
--
ALTER TABLE `credit_debit_cash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `credit_debit_invest`
--
ALTER TABLE `credit_debit_invest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `credit_debit_product`
--
ALTER TABLE `credit_debit_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `credit_debit_reward`
--
ALTER TABLE `credit_debit_reward`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `credit_debit_saving`
--
ALTER TABLE `credit_debit_saving`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `credit_debit_vtu`
--
ALTER TABLE `credit_debit_vtu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `credit_debit_welcome`
--
ALTER TABLE `credit_debit_welcome`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `currency_display`
--
ALTER TABLE `currency_display`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `date_format`
--
ALTER TABLE `date_format`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `deposit_investment_amount_request`
--
ALTER TABLE `deposit_investment_amount_request`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposit_shopping_wallet_amount_request`
--
ALTER TABLE `deposit_shopping_wallet_amount_request`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `deposit_wallet_amount_request`
--
ALTER TABLE `deposit_wallet_amount_request`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `direct_commission`
--
ALTER TABLE `direct_commission`
  MODIFY `id` bigint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `direct_commission_meta`
--
ALTER TABLE `direct_commission_meta`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `direct_matrix_downline`
--
ALTER TABLE `direct_matrix_downline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `epin`
--
ALTER TABLE `epin`
  MODIFY `id` bigint(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `epin_meta`
--
ALTER TABLE `epin_meta`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `epin_meta_bkp_02072020`
--
ALTER TABLE `epin_meta_bkp_02072020`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `epin_request`
--
ALTER TABLE `epin_request`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `eshop_adv_banner`
--
ALTER TABLE `eshop_adv_banner`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `eshop_adv_slider`
--
ALTER TABLE `eshop_adv_slider`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `eshop_adv_slider_sidebar`
--
ALTER TABLE `eshop_adv_slider_sidebar`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `eshop_bonus`
--
ALTER TABLE `eshop_bonus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `eshop_category`
--
ALTER TABLE `eshop_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `eshop_guest`
--
ALTER TABLE `eshop_guest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `eshop_guest_delivery_address`
--
ALTER TABLE `eshop_guest_delivery_address`
  MODIFY `id` bigint(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `eshop_member_delivery_address`
--
ALTER TABLE `eshop_member_delivery_address`
  MODIFY `id` bigint(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `eshop_orders`
--
ALTER TABLE `eshop_orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `eshop_orders_bkp`
--
ALTER TABLE `eshop_orders_bkp`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `eshop_orders_clients`
--
ALTER TABLE `eshop_orders_clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `eshop_orders_details`
--
ALTER TABLE `eshop_orders_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `eshop_payment_method`
--
ALTER TABLE `eshop_payment_method`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `eshop_products`
--
ALTER TABLE `eshop_products`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `eshop_products_stock`
--
ALTER TABLE `eshop_products_stock`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `eshop_product_level_commission`
--
ALTER TABLE `eshop_product_level_commission`
  MODIFY `id` bigint(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `eshop_stock`
--
ALTER TABLE `eshop_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `eshop_stockist_sell`
--
ALTER TABLE `eshop_stockist_sell`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `eshop_stock_stockist`
--
ALTER TABLE `eshop_stock_stockist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `eshop_stock_stockist_history`
--
ALTER TABLE `eshop_stock_stockist_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `eshop_subcategory`
--
ALTER TABLE `eshop_subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `eshop_vendors`
--
ALTER TABLE `eshop_vendors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `final_cash_wallet`
--
ALTER TABLE `final_cash_wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `final_e_wallet`
--
ALTER TABLE `final_e_wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `final_invest_wallet`
--
ALTER TABLE `final_invest_wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `final_invest_wallet_bkp`
--
ALTER TABLE `final_invest_wallet_bkp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `final_product_wallet`
--
ALTER TABLE `final_product_wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `final_reward_wallet`
--
ALTER TABLE `final_reward_wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `final_saving_wallet`
--
ALTER TABLE `final_saving_wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `final_vtu_wallet`
--
ALTER TABLE `final_vtu_wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `final_welcome_wallet`
--
ALTER TABLE `final_welcome_wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `indirect_unilevel_commission`
--
ALTER TABLE `indirect_unilevel_commission`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `indirect_unilevel_commission_meta`
--
ALTER TABLE `indirect_unilevel_commission_meta`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `job_searchkeywords`
--
ALTER TABLE `job_searchkeywords`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `level_income_binary`
--
ALTER TABLE `level_income_binary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lifejacket_subscription`
--
ALTER TABLE `lifejacket_subscription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manufacturing_process`
--
ALTER TABLE `manufacturing_process`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `marketing_images`
--
ALTER TABLE `marketing_images`
  MODIFY `id` bigint(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `marketing_videos`
--
ALTER TABLE `marketing_videos`
  MODIFY `id` bigint(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `matrix_downline`
--
ALTER TABLE `matrix_downline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `matrix_downline_pv`
--
ALTER TABLE `matrix_downline_pv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `matrix_downline_pv_bkp`
--
ALTER TABLE `matrix_downline_pv_bkp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `matrix_plan`
--
ALTER TABLE `matrix_plan`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT COMMENT 'id value always will be 1 coz it will contain always single row';

--
-- AUTO_INCREMENT for table `matrix_stage1`
--
ALTER TABLE `matrix_stage1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `matrix_stage2`
--
ALTER TABLE `matrix_stage2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `matrix_stage3`
--
ALTER TABLE `matrix_stage3`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `matrix_stage4`
--
ALTER TABLE `matrix_stage4`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `matrix_stage4_old`
--
ALTER TABLE `matrix_stage4_old`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `matrix_stage5`
--
ALTER TABLE `matrix_stage5`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `matrix_stage6`
--
ALTER TABLE `matrix_stage6`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `matrix_stage7`
--
ALTER TABLE `matrix_stage7`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `matrix_stage_commission`
--
ALTER TABLE `matrix_stage_commission`
  MODIFY `id` bigint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `matrix_stage_commission_meta`
--
ALTER TABLE `matrix_stage_commission_meta`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `matrix_stage_level_commission`
--
ALTER TABLE `matrix_stage_level_commission`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `matrix_stage_level_commission_meta`
--
ALTER TABLE `matrix_stage_level_commission_meta`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `matrix_stage_rank_bonus`
--
ALTER TABLE `matrix_stage_rank_bonus`
  MODIFY `id` bigint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `matrix_stage_rank_bonus_meta`
--
ALTER TABLE `matrix_stage_rank_bonus_meta`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `menu_fortress`
--
ALTER TABLE `menu_fortress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notice`
--
ALTER TABLE `notice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `package-old`
--
ALTER TABLE `package-old`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `package_sold_amount`
--
ALTER TABLE `package_sold_amount`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `package_sold_amount_old`
--
ALTER TABLE `package_sold_amount_old`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_paytm`
--
ALTER TABLE `payment_paytm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payout_limit`
--
ALTER TABLE `payout_limit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payout_setting`
--
ALTER TABLE `payout_setting`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `paystack_data`
--
ALTER TABLE `paystack_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pay_fast_response`
--
ALTER TABLE `pay_fast_response`
  MODIFY `id` bigint(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `po_products`
--
ALTER TABLE `po_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `prdouct_unilevel_commission_meta`
--
ALTER TABLE `prdouct_unilevel_commission_meta`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_purchase`
--
ALTER TABLE `product_purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_order`
--
ALTER TABLE `purchase_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `qualification`
--
ALTER TABLE `qualification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotation_products`
--
ALTER TABLE `quotation_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `rank`
--
ALTER TABLE `rank`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rank_log`
--
ALTER TABLE `rank_log`
  MODIFY `id` bigint(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rank_setting`
--
ALTER TABLE `rank_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rank_setting2`
--
ALTER TABLE `rank_setting2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `recharge_dataplan`
--
ALTER TABLE `recharge_dataplan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `recharge_vtu`
--
ALTER TABLE `recharge_vtu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `registration_method`
--
ALTER TABLE `registration_method`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reg_stage1`
--
ALTER TABLE `reg_stage1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reg_stage2`
--
ALTER TABLE `reg_stage2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reg_stage3`
--
ALTER TABLE `reg_stage3`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reg_stage4`
--
ALTER TABLE `reg_stage4`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reg_stage4_old`
--
ALTER TABLE `reg_stage4_old`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reg_stage5`
--
ALTER TABLE `reg_stage5`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rfq`
--
ALTER TABLE `rfq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `rfq_products`
--
ALTER TABLE `rfq_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `stage_label_meta`
--
ALTER TABLE `stage_label_meta`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `student_details`
--
ALTER TABLE `student_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_fees`
--
ALTER TABLE `student_fees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `supplier_quotes`
--
ALTER TABLE `supplier_quotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `support`
--
ALTER TABLE `support`
  MODIFY `id` bigint(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax`
--
ALTER TABLE `tax`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_category`
--
ALTER TABLE `tax_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=686;

--
-- AUTO_INCREMENT for table `unilevel_stage_level_commission`
--
ALTER TABLE `unilevel_stage_level_commission`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `unilevel_stage_level_commission_meta`
--
ALTER TABLE `unilevel_stage_level_commission_meta`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `unilevel_stage_level_commission_meta_copy`
--
ALTER TABLE `unilevel_stage_level_commission_meta_copy`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `unilevel_stage_level_commission_meta_matrix`
--
ALTER TABLE `unilevel_stage_level_commission_meta_matrix`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `upgrade_request`
--
ALTER TABLE `upgrade_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_id_setting`
--
ALTER TABLE `user_id_setting`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_login`
--
ALTER TABLE `user_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `user_package_log`
--
ALTER TABLE `user_package_log`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_registration`
--
ALTER TABLE `user_registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `user_school`
--
ALTER TABLE `user_school`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_school_docs`
--
ALTER TABLE `user_school_docs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_student`
--
ALTER TABLE `user_student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `value_store`
--
ALTER TABLE `value_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitor`
--
ALTER TABLE `visitor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `wallet_type`
--
ALTER TABLE `wallet_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `withdrawl_wallet_amount_request`
--
ALTER TABLE `withdrawl_wallet_amount_request`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `consumer_user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
