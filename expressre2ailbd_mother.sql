-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 26, 2019 at 09:57 AM
-- Server version: 10.1.43-MariaDB-cll-lve
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
-- Database: `expressre2ailbd_mother`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_account`
--

CREATE TABLE `tbl_account` (
  `Acc_SlNo` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `Acc_Code` varchar(50) NOT NULL,
  `Acc_Tr_Type` varchar(25) DEFAULT NULL,
  `Acc_Name` varchar(200) NOT NULL,
  `Acc_Type` varchar(50) NOT NULL,
  `Acc_Description` varchar(255) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_account`
--

INSERT INTO `tbl_account` (`Acc_SlNo`, `branch_id`, `Acc_Code`, `Acc_Tr_Type`, `Acc_Name`, `Acc_Type`, `Acc_Description`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`) VALUES
(1, 1, 'A1000', '', 'Office Expense', 'Official', 'Office Expense', 'a', 'Admin', '2019-09-17 22:48:04', NULL, NULL),
(2, 1, 'A1001', '', 'Entertainment', 'Official', 'Entertainment', 'a', 'Admin', '2019-09-17 22:48:31', NULL, NULL),
(3, 1, 'A1002', '', 'Advertisement', 'Official', 'Advertisement', 'a', 'Admin', '2019-09-17 22:48:56', NULL, NULL),
(4, 1, 'A1003', '', 'Office Rent', 'Official', 'Office Rent', 'a', 'Admin', '2019-09-17 22:49:11', NULL, NULL),
(5, 1, 'A1004', '', 'Transport', 'Official', 'Transport', 'a', 'Admin', '2019-09-17 22:49:28', NULL, NULL),
(6, 1, 'A1005', '', 'Investment', 'Official', 'Investment', 'a', 'Admin', '2019-09-17 22:49:55', NULL, NULL),
(7, 1, 'A0007', '', 'Dhaka Metro-654500', '', 'Dump Track', 'a', 'Admin', '2019-10-26 17:09:25', NULL, NULL),
(8, 4, 'A0008', '', 'ISRAT JAHAN', '', 'FAMILY MAINTANCE COST AND OTHER UTILITY COST', 'a', 'abh', '2019-12-18 23:43:09', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_assets`
--

CREATE TABLE `tbl_assets` (
  `as_id` int(11) NOT NULL,
  `as_date` date DEFAULT NULL,
  `as_name` varchar(50) DEFAULT NULL,
  `as_qty` int(11) DEFAULT NULL,
  `as_rate` decimal(10,2) DEFAULT NULL,
  `as_amount` decimal(10,2) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `branchid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_assets`
--

INSERT INTO `tbl_assets` (`as_id`, `as_date`, `as_name`, `as_qty`, `as_rate`, `as_amount`, `status`, `AddBy`, `AddTime`, `branchid`) VALUES
(1, '2019-12-17', 'Computer', 2, '25000.00', '50000.00', 'a', 'Admin', '2019-12-17 18:08:11', 1),
(2, '2019-12-17', 'Printer', 2, '12000.00', '24000.00', 'a', 'Admin', '2019-12-17 18:08:34', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bank_accounts`
--

CREATE TABLE `tbl_bank_accounts` (
  `account_id` int(11) NOT NULL,
  `account_number` varchar(250) NOT NULL,
  `bank_name` varchar(250) NOT NULL,
  `branch_name` varchar(250) DEFAULT NULL,
  `initial_balance` float NOT NULL,
  `saved_by` int(11) NOT NULL,
  `saved_datetime` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_datetime` datetime DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `account_name` varchar(500) NOT NULL,
  `account_type` varchar(200) NOT NULL,
  `description` varchar(2000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_bank_accounts`
--

INSERT INTO `tbl_bank_accounts` (`account_id`, `account_number`, `bank_name`, `branch_name`, `initial_balance`, `saved_by`, `saved_datetime`, `updated_by`, `updated_datetime`, `branch_id`, `status`, `account_name`, `account_type`, `description`) VALUES
(1, '164.110.25011', 'Dutch Bangla Bank Ltd.', 'Mirpur-10', 2000, 1, '2019-09-17 22:51:23', NULL, NULL, 1, 1, 'Link-Up Technology', 'Corrent', 'Na'),
(2, 'MSA-29603', 'Islami Bank', 'Mirpur-10', 500, 1, '2019-09-17 22:52:15', NULL, NULL, 1, 1, 'Md. Mozammel Hossain', 'Savings', 'NA'),
(3, '0170210026426', 'NCC Bank', 'Mirpur-10', 2000, 1, '2019-09-17 22:53:13', NULL, NULL, 1, 1, 'Link-Up Technology', 'Current', 'Na'),
(4, '0511210000505', 'UNION BANK LTD', 'NAWABPUR', 35006, 4, '2019-12-19 11:49:44', NULL, NULL, 4, 1, 'TAJ BEARING HOUSE', 'CURRENT', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bank_transactions`
--

CREATE TABLE `tbl_bank_transactions` (
  `transaction_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `transaction_date` date NOT NULL,
  `transaction_type` varchar(10) NOT NULL,
  `amount` float NOT NULL,
  `note` varchar(500) DEFAULT NULL,
  `saved_by` int(11) NOT NULL,
  `saved_datetime` datetime NOT NULL,
  `branch_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_bank_transactions`
--

INSERT INTO `tbl_bank_transactions` (`transaction_id`, `account_id`, `transaction_date`, `transaction_type`, `amount`, `note`, `saved_by`, `saved_datetime`, `branch_id`, `status`) VALUES
(1, 1, '2019-09-17', 'deposit', 150000, 'Cash', 1, '2019-09-17 22:53:57', 1, 1),
(2, 1, '2019-09-01', 'withdraw', 100000, 'Cash', 1, '2019-09-17 23:13:59', 1, 1),
(3, 1, '2019-09-18', 'withdraw', 5000, 'salary', 1, '2019-09-18 20:32:27', 1, 1),
(4, 1, '2019-09-18', 'withdraw', 47000, 'salary', 1, '2019-09-18 20:33:52', 1, 1),
(5, 3, '2019-09-18', 'deposit', 3000, '', 1, '2019-09-18 21:13:08', 1, 1),
(6, 1, '2019-09-20', 'deposit', 200000, 'Cash', 1, '2019-09-20 23:26:54', 1, 1),
(7, 1, '2019-09-20', 'withdraw', 5000, 'Cash', 1, '2019-09-20 23:27:12', 1, 1),
(8, 1, '2019-09-20', 'deposit', 3000, 'v', 1, '2019-09-20 23:27:28', 1, 1),
(9, 1, '2019-09-20', 'deposit', 3000, 'v', 1, '2019-09-20 23:27:28', 1, 1),
(10, 1, '2019-09-20', 'deposit', 3000, 'm', 1, '2019-09-20 23:28:04', 1, 1),
(11, 1, '2019-09-20', 'withdraw', 9000, 'zz', 1, '2019-09-20 23:28:25', 1, 1),
(12, 1, '2019-09-20', 'withdraw', 9000, 'zz', 1, '2019-09-20 23:28:25', 1, 1),
(13, 2, '2019-09-20', 'deposit', 10000, 'c', 1, '2019-09-20 23:30:03', 1, 1),
(14, 2, '2019-10-26', 'withdraw', 500, 'baten', 1, '2019-10-26 17:08:31', 1, 1),
(15, 1, '2019-12-21', 'deposit', 70000, 'Manik Cash', 1, '2019-12-21 14:59:58', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brand`
--

CREATE TABLE `tbl_brand` (
  `brand_SiNo` int(11) NOT NULL,
  `ProductCategory_SlNo` int(11) NOT NULL,
  `brand_name` varchar(100) NOT NULL,
  `status` char(2) NOT NULL,
  `brand_branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brunch`
--

CREATE TABLE `tbl_brunch` (
  `brunch_id` int(11) NOT NULL,
  `Brunch_name` varchar(3000) CHARACTER SET utf8 NOT NULL,
  `Brunch_title` varchar(3000) CHARACTER SET utf8 NOT NULL,
  `Brunch_address` text CHARACTER SET utf8 NOT NULL,
  `Brunch_sales` varchar(1) NOT NULL COMMENT 'Wholesales = 1, Retail = 2',
  `add_date` date NOT NULL,
  `add_time` datetime NOT NULL,
  `add_by` char(50) NOT NULL,
  `update_by` char(50) NOT NULL,
  `status` char(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_brunch`
--

INSERT INTO `tbl_brunch` (`brunch_id`, `Brunch_name`, `Brunch_title`, `Brunch_address`, `Brunch_sales`, `add_date`, `add_time`, `add_by`, `update_by`, `status`) VALUES
(1, 'Main Branch', 'Link-Up Technology Ltd.', 'Plot No-16, 3rd Floor\nBellal Uddin Menshion\n(Behind Shah Ali Market)\nMirpur-10, Dhaka-1216\nPhone: 01911-978897', '', '0000-00-00', '0000-00-00 00:00:00', '', 'Admin', 'a'),
(2, 'Tangail', 'Tangail', 'Par Degulia', '2', '0000-00-00', '2019-10-26 17:12:09', 'Admin', '', 'a'),
(11, 'Main Branch', 'Main Branch', 'Branch address here', '', '0000-00-00', '0000-00-00 00:00:00', '', '', 'a');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cashregister`
--

CREATE TABLE `tbl_cashregister` (
  `Transaction_ID` int(11) NOT NULL,
  `Transaction_Date` varchar(20) NOT NULL,
  `IdentityNo` varchar(50) DEFAULT NULL,
  `Narration` varchar(100) NOT NULL,
  `InAmount` decimal(18,2) NOT NULL,
  `OutAmount` decimal(18,2) NOT NULL,
  `Description` longtext NOT NULL,
  `Status` char(1) DEFAULT NULL,
  `Saved_By` varchar(50) DEFAULT NULL,
  `Saved_Time` datetime DEFAULT NULL,
  `Edited_By` varchar(50) DEFAULT NULL,
  `Edited_Time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cashtransaction`
--

CREATE TABLE `tbl_cashtransaction` (
  `Tr_SlNo` int(11) NOT NULL,
  `Tr_Id` varchar(50) NOT NULL,
  `Tr_date` date NOT NULL,
  `Tr_Type` varchar(20) NOT NULL,
  `Tr_account_Type` varchar(50) NOT NULL,
  `Supplier_SlID` int(11) NOT NULL,
  `Customer_SlID` int(11) NOT NULL,
  `Acc_SlID` int(11) NOT NULL,
  `Acc_Code` varchar(50) DEFAULT NULL,
  `Tr_Description` varchar(255) NOT NULL,
  `In_Amount` decimal(18,2) NOT NULL,
  `Out_Amount` decimal(18,2) NOT NULL,
  `ChequeNumber` int(16) NOT NULL,
  `Tr_Bank_Id` int(11) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(100) NOT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `Tr_branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_cashtransaction`
--

INSERT INTO `tbl_cashtransaction` (`Tr_SlNo`, `Tr_Id`, `Tr_date`, `Tr_Type`, `Tr_account_Type`, `Supplier_SlID`, `Customer_SlID`, `Acc_SlID`, `Acc_Code`, `Tr_Description`, `In_Amount`, `Out_Amount`, `ChequeNumber`, `Tr_Bank_Id`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Tr_branchid`) VALUES
(1, 'TR00001', '2019-09-17', 'In Cash', 'Official', 0, 0, 6, NULL, 'Cash', '200000.00', '0.00', 0, 0, 'a', 'Admin', '2019-09-17 22:50:14', NULL, NULL, 1),
(2, 'TR00002', '2019-09-18', 'Out Cash', 'Official', 0, 0, 1, NULL, 'Cash', '0.00', '200.00', 0, 0, 'a', 'Admin', '2019-09-17 23:15:56', 'Admin', '2019-09-17 23:16:06', 1),
(3, 'TR00003', '2019-09-18', 'Out Cash', 'Official', 0, 0, 3, NULL, 'Printing', '0.00', '3000.00', 0, 0, 'a', 'Admin', '2019-09-18 13:48:54', NULL, NULL, 1),
(4, 'TR00004', '2019-10-26', 'In Cash', '', 0, 0, 7, NULL, 'Cash', '10000.00', '0.00', 0, 0, 'a', 'Admin', '2019-10-26 17:10:05', NULL, NULL, 1),
(5, 'TR00005', '2019-10-26', 'Out Cash', '', 0, 0, 7, NULL, 'Oil Driver', '0.00', '5000.00', 0, 0, 'a', 'Admin', '2019-10-26 17:10:42', NULL, NULL, 1),
(6, 'TR00006', '2019-12-15', 'Out Cash', 'Official', 0, 0, 4, NULL, '', '0.00', '10000.00', 0, 0, 'a', 'Admin', '2019-12-15 12:17:42', NULL, NULL, 1),
(7, 'TR00007', '2019-12-18', 'Out Cash', '', 0, 0, 8, NULL, 'PURCHASE DAILY BAZAR', '0.00', '2000.00', 0, 0, 'a', 'abh', '2019-12-18 23:44:06', NULL, NULL, 4),
(8, 'TR00008', '2019-12-19', 'Out Cash', '', 0, 0, 8, NULL, 'SHOPPING COST', '0.00', '5000.00', 0, 0, 'a', 'abh', '2019-12-18 23:45:26', NULL, NULL, 4),
(9, 'TR00009', '2019-12-19', 'In Cash', 'Official', 0, 0, 6, NULL, '', '50000.00', '0.00', 0, 0, 'a', 'Admin', '2019-12-19 19:07:07', NULL, NULL, 1),
(10, 'TR00010', '2019-12-19', 'Out Cash', 'Official', 0, 0, 1, NULL, '', '0.00', '5000.00', 0, 0, 'a', 'Admin', '2019-12-19 19:33:26', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_checks`
--

CREATE TABLE `tbl_checks` (
  `id` int(20) UNSIGNED NOT NULL,
  `cus_id` int(20) DEFAULT NULL,
  `SM_id` int(20) UNSIGNED DEFAULT NULL,
  `bank_name` varchar(250) DEFAULT NULL,
  `branch_name` varchar(250) DEFAULT NULL,
  `check_no` varchar(250) DEFAULT NULL,
  `check_amount` decimal(18,2) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `check_date` timestamp NULL DEFAULT NULL,
  `remid_date` timestamp NULL DEFAULT NULL,
  `sub_date` timestamp NULL DEFAULT NULL,
  `note` varchar(250) DEFAULT NULL,
  `check_status` char(5) DEFAULT 'Pe' COMMENT 'Pe =Pending, Pa = Paid',
  `status` char(5) NOT NULL DEFAULT 'a',
  `created_by` varchar(250) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `branch_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_checks`
--

INSERT INTO `tbl_checks` (`id`, `cus_id`, `SM_id`, `bank_name`, `branch_name`, `check_no`, `check_amount`, `date`, `check_date`, `remid_date`, `sub_date`, `note`, `check_status`, `status`, `created_by`, `created_at`, `branch_id`) VALUES
(1, 12, NULL, 'PUBALI BANK LTD', 'NAYAPALTAN', '2221294', '500000.00', '2019-12-19 05:00:00', '2019-12-23 05:00:00', '2019-12-23 05:00:00', '2019-12-23 05:00:00', '', 'Pe', 'a', 'abh', '2019-12-19 05:00:00', 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_color`
--

CREATE TABLE `tbl_color` (
  `color_SiNo` int(11) NOT NULL,
  `color_name` varchar(100) NOT NULL,
  `status` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_company`
--

CREATE TABLE `tbl_company` (
  `Company_SlNo` int(11) NOT NULL,
  `Company_Name` varchar(150) NOT NULL,
  `Repot_Heading` text NOT NULL,
  `Company_Logo_org` varchar(250) NOT NULL,
  `Company_Logo_thum` varchar(250) NOT NULL,
  `Invoice_Type` int(11) NOT NULL,
  `Currency_Name` varchar(50) DEFAULT NULL,
  `Currency_Symbol` varchar(10) DEFAULT NULL,
  `SubCurrency_Name` varchar(50) DEFAULT NULL,
  `print_type` int(11) NOT NULL,
  `company_BrunchId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_company`
--

INSERT INTO `tbl_company` (`Company_SlNo`, `Company_Name`, `Repot_Heading`, `Company_Logo_org`, `Company_Logo_thum`, `Invoice_Type`, `Currency_Name`, `Currency_Symbol`, `SubCurrency_Name`, `print_type`, `company_BrunchId`) VALUES
(1, 'Company Name', 'Address and phone number here', 'download.png', 'download.png', 1, 'BDT', NULL, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_country`
--

CREATE TABLE `tbl_country` (
  `Country_SlNo` int(11) NOT NULL,
  `CountryName` varchar(50) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_currentinventory`
--

CREATE TABLE `tbl_currentinventory` (
  `inventory_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `purchase_quantity` float NOT NULL,
  `purchase_return_quantity` float NOT NULL,
  `sales_quantity` float NOT NULL,
  `sales_return_quantity` float NOT NULL,
  `damage_quantity` float NOT NULL,
  `transfer_from_quantity` float NOT NULL,
  `transfer_to_quantity` float NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_currentinventory`
--

INSERT INTO `tbl_currentinventory` (`inventory_id`, `product_id`, `purchase_quantity`, `purchase_return_quantity`, `sales_quantity`, `sales_return_quantity`, `damage_quantity`, `transfer_from_quantity`, `transfer_to_quantity`, `branch_id`) VALUES
(1, 2, 52, 0, 39, 0, 0, 0, 0, 1),
(2, 1, 51, 0, 15, 0, 0, 10, 0, 1),
(3, 5, 330, 0, 116, 1, 0, 20, 0, 1),
(4, 4, 131, 0, 51, 0, 0, 0, 0, 1),
(5, 3, 273, 0, 121, 9, 0, 0, 0, 1),
(6, 5, 0, 0, 0, 0, 0, 0, 20, 2),
(7, 1, 0, 0, 0, 0, 0, 0, 10, 2),
(8, 7, 200, 0, 60, 0, 0, 0, 0, 1),
(9, 8, 20, 0, 7, 0, 0, 0, 0, 1),
(10, 9, 200, 0, 20, 10, 0, 0, 0, 4),
(11, 10, 120, 0, 0, 0, 0, 0, 0, 4),
(12, 18, 100, 0, 100, 0, 0, 0, 0, 1),
(13, 17, 100, 0, 0, 0, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `Customer_SlNo` int(11) NOT NULL,
  `Customer_Code` varchar(50) NOT NULL,
  `Customer_Name` varchar(150) NOT NULL,
  `Customer_Type` varchar(50) NOT NULL,
  `Customer_Phone` varchar(50) NOT NULL,
  `Customer_Mobile` varchar(15) NOT NULL,
  `Customer_Email` varchar(50) NOT NULL,
  `Customer_OfficePhone` varchar(50) NOT NULL,
  `Customer_Address` varchar(300) NOT NULL,
  `owner_name` varchar(250) DEFAULT NULL,
  `Country_SlNo` int(11) NOT NULL,
  `area_ID` int(11) NOT NULL,
  `Customer_Web` varchar(50) NOT NULL,
  `Customer_Credit_Limit` decimal(18,2) NOT NULL,
  `previous_due` decimal(18,2) NOT NULL,
  `image_name` varchar(1000) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `Customer_brunchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`Customer_SlNo`, `Customer_Code`, `Customer_Name`, `Customer_Type`, `Customer_Phone`, `Customer_Mobile`, `Customer_Email`, `Customer_OfficePhone`, `Customer_Address`, `owner_name`, `Country_SlNo`, `area_ID`, `Customer_Web`, `Customer_Credit_Limit`, `previous_due`, `image_name`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Customer_brunchid`) VALUES
(1, 'C00001', 'Abdullah Enterprise', 'wholesale', '', '017', '', '', 'Jessore', 'Abdullah', 0, 2, '', '100000.00', '0.00', NULL, 'a', 'Admin', '2019-09-17 23:01:09', NULL, NULL, 1),
(2, 'C00002', 'Nisha Auos', 'retail', '', '0175555444', '', '', 'Jessore Sadar', 'Elious', 0, 2, '', '300000.00', '0.00', NULL, 'a', 'Admin', '2019-09-17 23:01:42', NULL, NULL, 1),
(3, 'C00003', 'Al Modin Enterprise', 'retail', '', '01522444', '', '', 'Rongpur', 'Ovi Vai', 0, 9, '', '300000.00', '0.00', NULL, 'a', 'Admin', '2019-09-17 23:03:18', NULL, NULL, 1),
(4, 'C00004', 'Sun Autos', 'wholesale', '', '01700000', '', '', 'Jessore', 'Ohid Vai', 0, 2, '', '50000.00', '0.00', NULL, 'a', 'Admin', '2019-09-18 13:41:39', NULL, NULL, 1),
(5, 'C00005', 'Md. Mozammel Hossain', 'G', '', '1911978897', '', '', '187 East Kazi Para', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'Admin', '2019-09-18 13:42:22', NULL, NULL, 1),
(6, 'C00006', 'jubaer', 'retail', '', '05640', '', '', 'fjiger', 'jubaer', 0, 2, '', '10000.00', '0.00', NULL, 'a', 'Admin', '2019-12-04 17:13:20', NULL, NULL, 1),
(7, 'C00007', 'Hashemi', 'retail', '', '01719406682', '', '0255501', '29 Agargoan', 'NILG', 0, 11, '', '5000.00', '500.00', 'C00007', 'a', 'Admin', '2019-12-17 19:10:41', NULL, NULL, 1),
(8, 'C00008', 'karim jute', 'retail', '', '01', '', '', 'mmm', 'hhh', 0, 1, '', '500000.00', '0.00', NULL, 'a', 'abh', '2019-12-18 13:48:59', NULL, NULL, 4),
(9, 'C00009', 'local customer', 'retail', '', '0', '', '', '', '', 0, 1, '', '0.00', '0.00', NULL, 'a', 'abh', '2019-12-18 15:17:32', NULL, NULL, 4),
(10, 'C00010', '', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'Admin', '2019-12-18 17:54:54', NULL, NULL, 1),
(11, 'C00011', '', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'Admin', '2019-12-18 17:55:48', NULL, NULL, 1),
(12, 'C00012', 'HKG STEEL', 'retail', '', '012', '', '', '', '', 0, 1, '', '0.00', '0.00', NULL, 'a', 'abh', '2019-12-18 19:07:54', NULL, NULL, 4),
(13, 'C00013', 'aa synthetic', 'retail', '', '018133333', '', '', 'mothijheel', 'matior', 0, 1, '', '0.00', '0.00', NULL, 'a', 'abh', '2019-12-19 00:14:34', NULL, NULL, 4),
(14, 'C00014', 'Zia Dhaka', 'retail', '', '0022', '', '22', 'Chowkbazar, Dhaka', 'Zia', 0, 1, '', '0.00', '0.00', NULL, 'a', 'national', '2019-12-19 13:43:49', NULL, NULL, 7),
(15, 'C00015', 'fardin', 'retail', '', '018', '', '', 'dhaka', 'al amin', 0, 1, '', '0.00', '0.00', NULL, 'a', 'mamun', '2019-12-19 16:14:12', NULL, NULL, 8),
(16, 'C00016', 'arif', 'wholesale', '', '0191111111111', '', '', 'foridabad', 'arif', 0, 1, '', '100000.00', '10000.00', NULL, 'a', 'Admin', '2019-12-21 13:47:10', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer_payment`
--

CREATE TABLE `tbl_customer_payment` (
  `CPayment_id` int(11) NOT NULL,
  `CPayment_date` date DEFAULT NULL,
  `CPayment_invoice` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `CPayment_customerID` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `CPayment_TransactionType` varchar(20) DEFAULT NULL,
  `CPayment_amount` decimal(18,2) DEFAULT NULL,
  `out_amount` float NOT NULL DEFAULT '0',
  `CPayment_Paymentby` varchar(50) DEFAULT NULL,
  `CPayment_notes` varchar(225) CHARACTER SET latin1 DEFAULT NULL,
  `CPayment_brunchid` int(11) DEFAULT NULL,
  `CPayment_previous_due` float NOT NULL DEFAULT '0',
  `CPayment_Addby` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `CPayment_AddDAte` date DEFAULT NULL,
  `CPayment_status` varchar(1) DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `CPayment_UpdateDAte` date DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_customer_payment`
--

INSERT INTO `tbl_customer_payment` (`CPayment_id`, `CPayment_date`, `CPayment_invoice`, `CPayment_customerID`, `CPayment_TransactionType`, `CPayment_amount`, `out_amount`, `CPayment_Paymentby`, `CPayment_notes`, `CPayment_brunchid`, `CPayment_previous_due`, `CPayment_Addby`, `CPayment_AddDAte`, `CPayment_status`, `update_by`, `CPayment_UpdateDAte`, `account_id`) VALUES
(1, '2019-09-17', 'TR00001', '2', 'CR', '5000.00', 0, 'cash', 'Cash', 1, 14000, 'Admin', '2019-09-17', 'a', NULL, NULL, NULL),
(2, '2019-09-17', 'TR00002', '3', 'CR', '1000.00', 0, 'bank', '02211555', 1, 3115, 'Admin', '2019-09-17', 'a', NULL, NULL, 2),
(3, '2019-09-18', 'TR00003', '4', 'CR', '500.00', 0, 'cash', 'Bkash', 1, 4500, 'Admin', '2019-09-18', 'a', NULL, NULL, NULL),
(4, '2019-09-18', 'TR00004', '4', 'CR', '1000.00', 0, 'bank', 'Cash', 1, 4000, 'Admin', '2019-09-18', 'a', NULL, NULL, 3),
(5, '2019-09-20', 'TR00005', '4', 'CR', '2000.00', 0, 'cash', 'Cash', 1, 3000.8, 'Admin', '2019-09-20', 'a', NULL, NULL, NULL),
(6, '2019-09-20', 'TR00006', '2', 'CR', '6000.00', 0, 'bank', 'Cq200155', 1, 13725, 'Admin', '2019-09-20', 'a', NULL, NULL, 1),
(7, '2019-10-03', 'TR00007', '3', 'CR', '3000.00', 0, 'cash', 'cash', 1, 160302, 'Admin', '2019-10-03', 'a', NULL, NULL, NULL),
(8, '2019-12-04', 'TR00008', '6', 'CP', '200.00', 0, 'cash', 'jgijg', 1, -200, 'Admin', '2019-12-04', 'a', 0, '2019-12-04', NULL),
(9, '2019-12-15', 'TR00009', '6', 'CR', '600.00', 0, 'bank', '', 1, 600, 'Admin', '2019-12-15', 'a', NULL, NULL, 3),
(10, '2019-12-15', 'TR00010', '3', 'CR', '1000.00', 0, 'cash', '', 1, 189976, 'Admin', '2019-12-15', 'a', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_damage`
--

CREATE TABLE `tbl_damage` (
  `Damage_SlNo` int(11) NOT NULL,
  `Damage_InvoiceNo` varchar(50) NOT NULL,
  `Damage_Date` date NOT NULL,
  `Damage_Description` varchar(300) NOT NULL,
  `status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `Damage_brunchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_damagedetails`
--

CREATE TABLE `tbl_damagedetails` (
  `DamageDetails_SlNo` int(11) NOT NULL,
  `Damage_SlNo` int(11) NOT NULL,
  `Product_SlNo` int(11) NOT NULL,
  `DamageDetails_DamageQuantity` int(11) NOT NULL,
  `damage_amount` float NOT NULL,
  `status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_department`
--

CREATE TABLE `tbl_department` (
  `Department_SlNo` int(11) NOT NULL,
  `Department_Name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_department`
--

INSERT INTO `tbl_department` (`Department_SlNo`, `Department_Name`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`) VALUES
(1, 'Sales', 'a', 'Admin', '2019-09-18 20:25:31', NULL, NULL),
(2, 'Administration', 'a', 'Admin', '2019-09-18 20:25:41', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_designation`
--

CREATE TABLE `tbl_designation` (
  `Designation_SlNo` int(11) NOT NULL,
  `Designation_Name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_designation`
--

INSERT INTO `tbl_designation` (`Designation_SlNo`, `Designation_Name`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`) VALUES
(1, 'CEO', 'a', 'Admin', '2019-09-18 20:24:58', NULL, NULL),
(2, 'Executive', 'a', 'Admin', '2019-09-18 20:25:08', NULL, NULL),
(3, 'Sr Officer', 'a', 'Admin', '2019-09-18 20:25:18', NULL, NULL),
(4, 'MANAGER', 'a', 'abh', '2019-12-18 23:53:03', NULL, NULL),
(5, 'Sr SALESMAN', 'a', 'abh', '2019-12-18 23:53:56', NULL, NULL),
(6, 'Officer', 'a', 'abh', '2019-12-18 23:55:07', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_district`
--

CREATE TABLE `tbl_district` (
  `District_SlNo` int(11) NOT NULL,
  `District_Name` varchar(50) NOT NULL,
  `status` char(10) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_district`
--

INSERT INTO `tbl_district` (`District_SlNo`, `District_Name`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`) VALUES
(1, 'Dhaka', 'a', 'Admin', '2019-09-17 22:59:32', NULL, NULL),
(2, 'Jessore', 'a', 'Admin', '2019-09-17 22:59:37', NULL, NULL),
(3, 'Kustia', 'a', 'Admin', '2019-09-17 22:59:43', NULL, NULL),
(4, 'Khulna', 'a', 'Admin', '2019-09-17 22:59:50', NULL, NULL),
(5, 'Magura', 'a', 'Admin', '2019-09-17 22:59:55', NULL, NULL),
(6, 'Coxsbazaar', 'a', 'Admin', '2019-09-17 23:00:02', NULL, NULL),
(7, 'Chittagong', 'd', 'Admin', '2019-09-17 23:00:08', NULL, NULL),
(8, 'Mymenshing', 'a', 'Admin', '2019-09-17 23:00:15', NULL, NULL),
(9, 'Narayangonj', 'a', 'Admin', '2019-09-17 23:00:23', NULL, NULL),
(10, 'Mirpur, Dhaka', 'a', 'Admin', '2019-12-17 19:04:41', NULL, NULL),
(11, 'Shawrapara, Miprur, Dhaka', 'a', 'Admin', '2019-12-17 19:05:06', NULL, NULL),
(12, 'Dhanmondi, Dhaka', 'a', 'Admin', '2019-12-17 19:05:22', NULL, NULL),
(13, 'Ashulia, Savar, Dhaka', 'a', 'Admin', '2019-12-17 19:05:41', NULL, NULL),
(14, 'ctg', 'a', 'Admin', '2019-12-19 13:36:08', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employee`
--

CREATE TABLE `tbl_employee` (
  `Employee_SlNo` int(11) NOT NULL,
  `Designation_ID` int(11) NOT NULL,
  `Department_ID` int(11) NOT NULL,
  `Employee_ID` varchar(50) NOT NULL,
  `Employee_Name` varchar(150) NOT NULL,
  `Employee_JoinDate` date NOT NULL,
  `Employee_Gender` varchar(20) NOT NULL,
  `Employee_BirthDate` date NOT NULL,
  `Employee_NID` varchar(50) NOT NULL,
  `Employee_ContactNo` varchar(20) NOT NULL,
  `Employee_Email` varchar(50) NOT NULL,
  `Employee_MaritalStatus` varchar(50) NOT NULL,
  `Employee_FatherName` varchar(150) NOT NULL,
  `Employee_MotherName` varchar(150) NOT NULL,
  `Employee_PrasentAddress` text NOT NULL,
  `Employee_PermanentAddress` text NOT NULL,
  `Employee_Pic_org` varchar(250) NOT NULL,
  `Employee_Pic_thum` varchar(250) NOT NULL,
  `salary_range` int(11) NOT NULL,
  `status` char(10) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) NOT NULL,
  `AddTime` varchar(50) NOT NULL,
  `UpdateBy` varchar(50) NOT NULL,
  `UpdateTime` varchar(50) NOT NULL,
  `Employee_brinchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_employee`
--

INSERT INTO `tbl_employee` (`Employee_SlNo`, `Designation_ID`, `Department_ID`, `Employee_ID`, `Employee_Name`, `Employee_JoinDate`, `Employee_Gender`, `Employee_BirthDate`, `Employee_NID`, `Employee_ContactNo`, `Employee_Email`, `Employee_MaritalStatus`, `Employee_FatherName`, `Employee_MotherName`, `Employee_PrasentAddress`, `Employee_PermanentAddress`, `Employee_Pic_org`, `Employee_Pic_thum`, `salary_range`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Employee_brinchid`) VALUES
(1, 1, 2, 'E1001', 'Md. Mozammel Hossain', '2011-09-18', 'Male', '1984-06-03', '', '01911978897', 'mozammel@linktechbd.com', 'married', 'Md. Mofazzal Hossain', 'Monmowara Begum', '187 East Kazi Para', '187 East Kazi Para', 'mozammel1.jpg', 'mozammel1.jpg', 20000, 'a', 'Admin', '2019-09-18 20:27:19', '', '', 1),
(2, 3, 2, 'E1002', 'Mahabub Elahi', '2019-09-18', 'Male', '2019-09-18', '', '01979556661', 'mail@linktechbd.com', 'married', 'adnan Father', 'adnan Mother', 'Mirpur-1', 'Mirpur-1', 'adnan.jpg', 'adnan.jpg', 14520, 'a', 'Admin', '2019-09-18 20:29:13', '', '', 1),
(3, 2, 2, 'E1003', 'Rahim', '2019-11-14', 'Male', '2000-12-14', '', 'O1711111111', '', 'unmarried', 'F', 'M', 'Absen', 'Pasent', '', '', 10000, 'a', 'Admin', '2019-12-14 00:37:06', '', '', 1),
(4, 4, 2, 'E1004', 'taiyub ahmed', '2019-12-18', 'Male', '2019-12-18', '', '01857571821', 'taiyubahmed@gmail.com', 'married', 'aa', 'bb', 'bonogram', 'ziri', 'image7.JPG', 'image7.JPG', 45000, 'a', 'abh', '2019-12-18 23:59:30', '', '', 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employee_payment`
--

CREATE TABLE `tbl_employee_payment` (
  `employee_payment_id` int(11) NOT NULL,
  `Employee_SlNo` int(11) NOT NULL,
  `payment_date` date DEFAULT NULL,
  `month_id` int(11) NOT NULL,
  `payment_amount` decimal(18,2) NOT NULL,
  `deduction_amount` decimal(18,2) NOT NULL,
  `status` varchar(1) DEFAULT NULL,
  `save_by` char(30) NOT NULL,
  `save_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` int(11) DEFAULT NULL,
  `update_date` varchar(12) NOT NULL,
  `paymentBranch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_employee_payment`
--

INSERT INTO `tbl_employee_payment` (`employee_payment_id`, `Employee_SlNo`, `payment_date`, `month_id`, `payment_amount`, `deduction_amount`, `status`, `save_by`, `save_date`, `update_by`, `update_date`, `paymentBranch_id`) VALUES
(1, 2, '2019-09-18', 1, '14520.00', '0.00', 'a', 'Admin', '2019-09-18 14:31:40', NULL, '', 1),
(2, 1, '2019-09-18', 1, '20000.00', '0.00', 'a', 'Admin', '2019-09-18 14:32:56', NULL, '', 1),
(3, 3, '2019-12-14', 1, '0.00', '0.00', 'a', '1', '2019-12-14 05:37:59', NULL, '', 1),
(4, 4, '2019-12-19', 2, '40000.00', '0.00', 'a', '4', '2019-12-19 05:04:59', NULL, '', 4),
(5, 4, '2019-12-19', 2, '5000.00', '0.00', 'a', '4', '2019-12-19 05:05:26', NULL, '', 4),
(6, 4, '2019-12-19', 3, '35000.00', '0.00', 'a', '4', '2019-12-19 05:05:43', NULL, '', 4),
(7, 4, '2019-12-19', 3, '10000.00', '0.00', 'a', '4', '2019-12-19 05:05:58', NULL, '', 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_expense_head`
--

CREATE TABLE `tbl_expense_head` (
  `id` int(11) NOT NULL,
  `head_name` varchar(100) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `status` enum('a','d') DEFAULT 'a',
  `saved_by` int(11) DEFAULT NULL,
  `saved_datetime` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_month`
--

CREATE TABLE `tbl_month` (
  `month_id` int(11) NOT NULL,
  `month_name` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_month`
--

INSERT INTO `tbl_month` (`month_id`, `month_name`) VALUES
(1, 'August-2019'),
(2, 'november'),
(3, 'december');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `Product_SlNo` int(11) NOT NULL,
  `Product_Code` varchar(50) NOT NULL,
  `Product_Name` varchar(150) NOT NULL,
  `ProductCategory_ID` int(11) NOT NULL,
  `color` int(11) NOT NULL,
  `brand` int(11) NOT NULL,
  `size` varchar(11) NOT NULL DEFAULT 'na',
  `vat` float NOT NULL,
  `Product_ReOrederLevel` int(11) NOT NULL,
  `Product_Purchase_Rate` decimal(18,2) NOT NULL,
  `Product_SellingPrice` decimal(18,2) NOT NULL,
  `Product_MinimumSellingPrice` decimal(18,2) NOT NULL,
  `Product_WholesaleRate` decimal(18,2) NOT NULL,
  `one_cartun_equal` varchar(20) NOT NULL,
  `is_service` varchar(10) NOT NULL DEFAULT 'false',
  `Unit_ID` int(11) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(100) NOT NULL,
  `AddTime` varchar(30) NOT NULL,
  `UpdateBy` varchar(50) NOT NULL,
  `UpdateTime` varchar(30) NOT NULL,
  `Product_branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`Product_SlNo`, `Product_Code`, `Product_Name`, `ProductCategory_ID`, `color`, `brand`, `size`, `vat`, `Product_ReOrederLevel`, `Product_Purchase_Rate`, `Product_SellingPrice`, `Product_MinimumSellingPrice`, `Product_WholesaleRate`, `one_cartun_equal`, `is_service`, `Unit_ID`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Product_branchid`) VALUES
(1, 'P00001', 'Walton TV 42\" Color LED', 1, 0, 0, 'na', 0, 10, '23000.00', '30000.00', '0.00', '24000.00', '', 'false', 1, 'a', 'Admin', '2019-09-17 22:39:36', '', '', 0),
(2, 'P00002', 'Walton TV 32\" Color LED', 1, 0, 0, 'na', 0, 5, '12000.00', '15000.00', '0.00', '13000.00', '', 'false', 1, 'a', 'Admin', '2019-09-17 22:41:17', '', '', 0),
(3, 'P00003', 'Lux Shop 90Gm', 4, 0, 0, 'na', 15, 10, '45.00', '50.00', '0.00', '46.00', '', 'false', 1, 'a', 'Admin', '2019-09-17 22:43:13', '', '', 0),
(4, 'P00004', 'সেভেন আপ ২৫০মি লি', 4, 0, 0, 'na', 2, 30, '12.00', '13.00', '0.00', '12.50', '', 'false', 1, 'a', 'Admin', '2019-09-17 22:44:55', '', '', 0),
(5, 'P00005', 'হিরো হেন্ডা পার্টস', 5, 0, 0, 'na', 0, 20, '300.00', '400.00', '0.00', '350.00', '', 'false', 1, 'a', 'Admin', '2019-09-17 22:47:03', '', '', 0),
(6, 'P00006', 'three gang-MK', 7, 0, 0, 'na', 0, 100, '500.00', '550.00', '0.00', '520.00', '', 'true', 1, 'a', 'Admin', '2019-09-18 13:40:23', 'Admin', '2019-12-17 19:08:20', 0),
(7, 'P00007', 'Two Gag-MK', 7, 0, 0, 'na', 0, 100, '300.00', '350.00', '0.00', '320.00', '', 'false', 1, 'a', 'Admin', '2019-12-14 11:44:35', 'Admin', '2019-12-17 19:07:20', 1),
(8, 'P00008', 'One Gang One Way', 7, 0, 0, 'na', 0, 0, '200.00', '250.00', '0.00', '210.00', '', 'false', 1, 'a', 'Admin', '2019-12-17 18:18:05', '', '', 1),
(9, 'P00009', '6202 zz', 9, 0, 0, 'na', 0, 100, '40.00', '60.00', '0.00', '55.00', '', 'false', 2, 'a', 'abh', '2019-12-18 13:45:46', '', '', 4),
(10, 'P00010', 'lghp 2/1', 10, 0, 0, 'na', 0, 10, '40.00', '50.00', '0.00', '45.00', '', 'false', 12, 'a', 'abh', '2019-12-18 13:46:37', '', '', 4),
(11, 'P00011', 'Three gang', 7, 0, 0, 'na', 0, 100, '450.00', '550.00', '0.00', '500.00', '', 'false', 13, 'a', 'Admin', '2019-12-18 15:25:30', '', '', 1),
(12, 'P00012', '6203 ZZ', 9, 0, 0, 'na', 0, 0, '57.00', '180.00', '0.00', '0.00', '', 'false', 13, 'a', 'abh', '2019-12-18 19:10:53', '', '', 4),
(13, 'P00013', '6204 ZZ', 9, 0, 0, 'na', 0, 10, '36.00', '38.00', '0.00', '0.00', '', 'false', 13, 'a', 'abh', '2019-12-19 10:19:26', '', '', 4),
(14, 'P00014', '8670 Light', 11, 0, 0, 'na', 0, 200, '0.00', '0.00', '0.00', '0.00', '', 'false', 14, 'a', 'national', '2019-12-19 13:45:24', '', '', 7),
(15, 'P00015', 'wbl-vk01', 12, 0, 0, 'na', 0, 5, '4000.00', '5000.00', '0.00', '0.00', '', 'false', 14, 'a', 'mamun', '2019-12-19 16:10:29', '', '', 8),
(16, 'P00016', 'wir-d03', 13, 0, 0, 'na', 0, 0, '750.00', '1000.00', '0.00', '0.00', '', 'false', 14, 'a', 'mamun', '2019-12-19 16:11:11', '', '', 8),
(17, 'P00017', 'FGgfhg', 3, 0, 0, 'na', 0, 10, '100.00', '130.00', '0.00', '120.00', '', 'false', 14, 'a', 'Admin', '2019-12-21 13:41:28', '', '', 1),
(18, 'P00018', 'susp-sp10am braker', 3, 0, 0, 'na', 0, 60, '100.00', '105.00', '0.00', '101.00', '', 'false', 6, 'a', 'Admin', '2019-12-21 13:42:57', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_productcategory`
--

CREATE TABLE `tbl_productcategory` (
  `ProductCategory_SlNo` int(11) NOT NULL,
  `ProductCategory_Name` varchar(150) NOT NULL,
  `ProductCategory_Description` varchar(300) NOT NULL,
  `status` char(1) NOT NULL,
  `AddBy` varchar(50) NOT NULL,
  `AddTime` varchar(30) NOT NULL,
  `UpdateBy` varchar(50) NOT NULL,
  `UpdateTime` varchar(30) NOT NULL,
  `category_branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_productcategory`
--

INSERT INTO `tbl_productcategory` (`ProductCategory_SlNo`, `ProductCategory_Name`, `ProductCategory_Description`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `category_branchid`) VALUES
(1, 'Electronics', 'Electronics', 'd', 'Admin', '2019-09-17 22:37:23', '', '', 1),
(2, 'Others', 'Others', 'a', 'Admin', '2019-09-17 22:37:39', 'Admin', '2019-09-18 14:53:29', 1),
(3, 'Circuit Barker ', ' ', 'a', 'Admin', '2019-09-17 22:37:46', 'Admin', '2019-12-17 18:15:53', 1),
(4, 'Food & Beverage', 'Food ', 'a', 'Admin', '2019-09-17 22:38:01', 'Admin', '2019-09-17 22:38:14', 1),
(5, 'অটোমোবাইল', 'অটোমোবাইল', 'a', 'Admin', '2019-09-17 22:45:44', '', '', 1),
(6, 'Cblle', 'Electroics', 'a', 'Admin', '2019-09-18 18:21:18', 'Admin', '2019-12-17 18:15:09', 1),
(7, 'Switch', '', 'a', 'Admin', '2019-12-14 11:42:39', 'Admin', '2019-12-17 18:14:49', 1),
(8, 'Potato', 'Seed', 'a', 'Admin', '2019-12-15 13:11:40', '', '', 1),
(9, 'bearing', '', 'a', 'abh', '2019-12-18 13:43:27', '', '', 4),
(10, 'grease', '', 'a', 'abh', '2019-12-18 13:43:38', '', '', 4),
(11, 'Electronics', '', 'a', 'national', '2019-12-19 13:44:16', '', '', 7),
(12, 'blender', '', 'a', 'mamun', '2019-12-19 16:09:29', '', '', 8),
(13, 'iron', '', 'a', 'mamun', '2019-12-19 16:09:36', '', '', 8);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchasedetails`
--

CREATE TABLE `tbl_purchasedetails` (
  `PurchaseDetails_SlNo` int(11) NOT NULL,
  `PurchaseMaster_IDNo` int(11) NOT NULL,
  `Product_IDNo` int(11) NOT NULL,
  `PurchaseDetails_TotalQuantity` int(11) NOT NULL,
  `PurchaseDetails_Rate` decimal(18,2) NOT NULL,
  `purchase_cost` decimal(18,2) NOT NULL,
  `PurchaseDetails_Discount` decimal(18,2) NOT NULL,
  `PurchaseDetails_TotalAmount` decimal(18,2) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `PurchaseDetails_branchID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_purchasedetails`
--

INSERT INTO `tbl_purchasedetails` (`PurchaseDetails_SlNo`, `PurchaseMaster_IDNo`, `Product_IDNo`, `PurchaseDetails_TotalQuantity`, `PurchaseDetails_Rate`, `purchase_cost`, `PurchaseDetails_Discount`, `PurchaseDetails_TotalAmount`, `Status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `PurchaseDetails_branchID`) VALUES
(1, 1, 2, 20, '12000.00', '0.00', '0.00', '240000.00', 'a', 'Admin', '2019-09-17 22:56:33', NULL, NULL, 1),
(2, 1, 1, 20, '23000.00', '0.00', '0.00', '460000.00', 'a', 'Admin', '2019-09-17 22:56:33', NULL, NULL, 1),
(3, 2, 5, 200, '300.00', '0.00', '0.00', '60000.00', 'a', 'Admin', '2019-09-17 22:57:14', NULL, NULL, 1),
(4, 3, 4, 100, '12.00', '0.00', '0.00', '1200.00', 'a', 'Admin', '2019-09-17 22:57:42', NULL, NULL, 1),
(5, 3, 3, 200, '45.00', '0.00', '0.00', '9000.00', 'a', 'Admin', '2019-09-17 22:57:42', NULL, NULL, 1),
(6, 4, 3, 50, '45.00', '0.00', '0.00', '2250.00', 'a', 'Admin', '2019-09-17 22:58:10', NULL, NULL, 1),
(7, 5, 2, 2, '12000.00', '0.00', '0.00', '24000.00', 'a', 'Admin', '2019-09-18 14:55:14', NULL, NULL, 1),
(8, 5, 1, 1, '23000.00', '0.00', '0.00', '23000.00', 'a', 'Admin', '2019-09-18 14:55:14', NULL, NULL, 1),
(9, 6, 3, 2, '45.00', '0.00', '0.00', '90.00', 'a', 'Admin', '2019-09-28 16:16:41', NULL, NULL, 1),
(10, 7, 4, 10, '12.00', '0.00', '0.00', '120.00', 'a', 'Admin', '2019-10-08 00:38:51', NULL, NULL, 1),
(11, 8, 5, 20, '300.00', '0.00', '0.00', '6000.00', 'a', 'Admin', '2019-10-22 16:45:02', NULL, NULL, 1),
(12, 8, 4, 1, '12.00', '0.00', '0.00', '12.00', 'a', 'Admin', '2019-10-22 16:45:02', NULL, NULL, 1),
(13, 8, 2, 10, '12000.00', '0.00', '0.00', '120000.00', 'a', 'Admin', '2019-10-22 16:45:02', NULL, NULL, 1),
(14, 8, 1, 10, '23000.00', '0.00', '0.00', '230000.00', 'a', 'Admin', '2019-10-22 16:45:02', NULL, NULL, 1),
(15, 9, 5, 10, '300.00', '0.00', '0.00', '3000.00', 'a', 'Admin', '2019-10-31 13:47:04', NULL, NULL, 1),
(16, 9, 4, 20, '12.00', '0.00', '0.00', '240.00', 'a', 'Admin', '2019-10-31 13:47:04', NULL, NULL, 1),
(17, 9, 3, 20, '45.00', '0.00', '0.00', '900.00', 'a', 'Admin', '2019-10-31 13:47:04', NULL, NULL, 1),
(18, 9, 2, 20, '12000.00', '0.00', '0.00', '240000.00', 'a', 'Admin', '2019-10-31 13:47:04', NULL, NULL, 1),
(19, 9, 1, 20, '23000.00', '0.00', '0.00', '460000.00', 'a', 'Admin', '2019-10-31 13:47:04', NULL, NULL, 1),
(20, 10, 7, 200, '1000.00', '0.00', '0.00', '200000.00', 'a', 'Admin', '2019-12-14 11:45:45', NULL, NULL, 1),
(21, 10, 3, 1, '45.00', '0.00', '0.00', '45.00', 'a', 'Admin', '2019-12-14 11:45:45', NULL, NULL, 1),
(22, 11, 8, 20, '200.00', '0.00', '0.00', '4000.00', 'a', 'Admin', '2019-12-17 20:36:48', NULL, NULL, 1),
(23, 12, 9, 200, '40.00', '0.00', '0.00', '10000.00', 'a', 'abh', '2019-12-18 13:51:19', NULL, NULL, 4),
(24, 12, 10, 120, '40.00', '0.00', '0.00', '4800.00', 'a', 'abh', '2019-12-18 13:51:19', NULL, NULL, 4),
(25, 13, 18, 100, '100.00', '0.00', '0.00', '10000.00', 'a', 'Admin', '2019-12-21 13:44:08', NULL, NULL, 1),
(26, 14, 17, 100, '100.00', '0.00', '0.00', '10000.00', 'a', 'Admin', '2019-12-24 19:03:56', NULL, NULL, 1),
(27, 14, 5, 100, '300.00', '0.00', '0.00', '30000.00', 'a', 'Admin', '2019-12-24 19:03:56', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchasemaster`
--

CREATE TABLE `tbl_purchasemaster` (
  `PurchaseMaster_SlNo` int(11) NOT NULL,
  `Supplier_SlNo` int(11) NOT NULL,
  `Employee_SlNo` int(11) NOT NULL,
  `PurchaseMaster_InvoiceNo` varchar(50) NOT NULL,
  `PurchaseMaster_OrderDate` date NOT NULL,
  `PurchaseMaster_PurchaseFor` varchar(50) NOT NULL,
  `PurchaseMaster_Description` longtext NOT NULL,
  `PurchaseMaster_TotalAmount` decimal(18,2) NOT NULL,
  `PurchaseMaster_DiscountAmount` decimal(18,2) NOT NULL,
  `PurchaseMaster_Tax` decimal(18,2) NOT NULL,
  `PurchaseMaster_Freight` decimal(18,2) NOT NULL,
  `PurchaseMaster_SubTotalAmount` decimal(18,2) NOT NULL,
  `PurchaseMaster_PaidAmount` decimal(18,2) NOT NULL,
  `PurchaseMaster_DueAmount` decimal(18,2) NOT NULL,
  `previous_due` float DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `PurchaseMaster_BranchID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_purchasemaster`
--

INSERT INTO `tbl_purchasemaster` (`PurchaseMaster_SlNo`, `Supplier_SlNo`, `Employee_SlNo`, `PurchaseMaster_InvoiceNo`, `PurchaseMaster_OrderDate`, `PurchaseMaster_PurchaseFor`, `PurchaseMaster_Description`, `PurchaseMaster_TotalAmount`, `PurchaseMaster_DiscountAmount`, `PurchaseMaster_Tax`, `PurchaseMaster_Freight`, `PurchaseMaster_SubTotalAmount`, `PurchaseMaster_PaidAmount`, `PurchaseMaster_DueAmount`, `previous_due`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `PurchaseMaster_BranchID`) VALUES
(1, 3, 0, '2019000001', '2019-09-17', '1', '', '700000.00', '0.00', '0.00', '0.00', '700000.00', '100000.00', '600000.00', 0, 'a', 'Admin', '2019-09-17 22:56:33', NULL, NULL, 1),
(2, 2, 0, '2019000002', '2019-09-17', '1', '', '60000.00', '0.00', '0.00', '0.00', '60000.00', '50000.00', '10000.00', 0, 'a', 'Admin', '2019-09-17 22:57:14', NULL, NULL, 1),
(3, 1, 0, '2019000003', '2019-09-17', '1', '', '10200.00', '0.00', '0.00', '0.00', '10200.00', '0.00', '10200.00', 0, 'a', 'Admin', '2019-09-17 22:57:42', NULL, NULL, 1),
(4, 1, 0, '2019000004', '2019-09-17', '1', '', '2250.00', '0.00', '0.00', '0.00', '2250.00', '1000.00', '1250.00', 10200, 'a', 'Admin', '2019-09-17 22:58:10', NULL, NULL, 1),
(5, 3, 0, '2019000005', '2019-09-18', '1', '', '47000.00', '0.00', '0.00', '0.00', '47000.00', '10000.00', '37000.00', 599000, 'a', 'Admin', '2019-09-18 14:55:14', NULL, NULL, 1),
(6, 3, 0, '2019000006', '2019-09-28', '1', '', '90.00', '0.00', '0.00', '0.00', '90.00', '0.00', '90.00', 636000, 'a', 'Admin', '2019-09-28 16:16:41', NULL, NULL, 1),
(7, 3, 0, '2019000007', '2019-10-08', '1', '', '120.00', '0.00', '0.00', '0.00', '120.00', '0.00', '120.00', 636090, 'a', 'Admin', '2019-10-08 00:38:51', NULL, NULL, 1),
(8, 3, 0, '2019000008', '2019-10-22', '1', '', '356012.00', '0.00', '0.00', '0.00', '356012.00', '100000.00', '256012.00', 636210, 'a', 'Admin', '2019-10-22 16:45:02', NULL, NULL, 1),
(9, 3, 0, '2019000009', '2019-10-31', '1', '', '704140.00', '0.00', '0.00', '0.00', '704140.00', '0.00', '704140.00', 892222, 'a', 'Admin', '2019-10-31 13:47:04', NULL, NULL, 1),
(10, 3, 0, '2019000010', '2019-12-14', '1', '', '200045.00', '0.00', '0.00', '0.00', '200045.00', '100000.00', '100045.00', 1596360, 'a', 'Admin', '2019-12-14 11:45:45', NULL, NULL, 1),
(11, 6, 0, '2019000011', '2019-12-17', '1', '', '4000.00', '0.00', '0.00', '0.00', '4000.00', '0.00', '4000.00', 0, 'a', 'Admin', '2019-12-17 20:36:48', NULL, NULL, 1),
(12, 8, 0, '2019000012', '2019-12-18', '4', '', '14800.00', '0.00', '0.00', '0.00', '14800.00', '10000.00', '4800.00', 1000, 'a', 'abh', '2019-12-18 13:51:19', NULL, NULL, 4),
(13, 14, 0, '2019000013', '2019-12-21', '1', '', '10000.00', '0.00', '0.00', '0.00', '10000.00', '10000.00', '0.00', 0, 'a', 'Admin', '2019-12-21 13:44:08', NULL, NULL, 1),
(14, 7, 0, '2019000014', '2019-12-24', '1', '', '40000.00', '0.00', '0.00', '0.00', '40000.00', '4000.00', '36000.00', 0, 'a', 'Admin', '2019-12-24 19:03:56', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchasereturn`
--

CREATE TABLE `tbl_purchasereturn` (
  `PurchaseReturn_SlNo` int(11) NOT NULL,
  `PurchaseMaster_InvoiceNo` varchar(50) NOT NULL,
  `Supplier_IDdNo` int(11) NOT NULL,
  `PurchaseReturn_ReturnDate` date NOT NULL,
  `PurchaseReturn_ReturnAmount` decimal(18,2) NOT NULL,
  `PurchaseReturn_Description` varchar(300) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `PurchaseReturn_brunchID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchasereturndetails`
--

CREATE TABLE `tbl_purchasereturndetails` (
  `PurchaseReturnDetails_SlNo` int(11) NOT NULL,
  `PurchaseReturn_SlNo` int(11) NOT NULL,
  `PurchaseReturnDetailsProduct_SlNo` int(11) NOT NULL,
  `PurchaseReturnDetails_ReturnQuantity` int(11) NOT NULL,
  `PurchaseReturnDetails_ReturnAmount` decimal(18,2) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `PurchaseReturnDetails_brachid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_quotaion_customer`
--

CREATE TABLE `tbl_quotaion_customer` (
  `quotation_customer_id` int(11) NOT NULL,
  `customer_name` char(50) NOT NULL,
  `contact_number` varchar(35) NOT NULL,
  `customer_address` text NOT NULL,
  `quation_customer_branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_quotation_details`
--

CREATE TABLE `tbl_quotation_details` (
  `SaleDetails_SlNo` int(11) NOT NULL,
  `SaleMaster_IDNo` int(11) NOT NULL,
  `Product_IDNo` int(11) NOT NULL,
  `SaleDetails_TotalQuantity` int(11) NOT NULL,
  `SaleDetails_Rate` decimal(18,2) NOT NULL,
  `SaleDetails_Discount` decimal(18,2) NOT NULL,
  `SaleDetails_Tax` decimal(18,2) NOT NULL,
  `SaleDetails_Freight` decimal(18,2) NOT NULL,
  `SaleDetails_TotalAmount` decimal(18,2) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `SaleDetails_BranchId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_quotation_master`
--

CREATE TABLE `tbl_quotation_master` (
  `SaleMaster_SlNo` int(11) NOT NULL,
  `SaleMaster_InvoiceNo` varchar(50) NOT NULL,
  `SaleMaster_customer_name` varchar(500) NOT NULL,
  `SaleMaster_customer_mobile` varchar(50) NOT NULL,
  `SaleMaster_customer_address` varchar(1000) NOT NULL,
  `SaleMaster_SaleDate` date NOT NULL,
  `SaleMaster_Description` longtext,
  `SaleMaster_TotalSaleAmount` decimal(18,2) NOT NULL,
  `SaleMaster_TotalDiscountAmount` decimal(18,2) NOT NULL,
  `SaleMaster_TaxAmount` decimal(18,2) NOT NULL,
  `SaleMaster_Freight` decimal(18,2) NOT NULL,
  `SaleMaster_SubTotalAmount` decimal(18,2) NOT NULL,
  `Status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `SaleMaster_branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_saledetails`
--

CREATE TABLE `tbl_saledetails` (
  `SaleDetails_SlNo` int(11) NOT NULL,
  `SaleMaster_IDNo` int(11) NOT NULL,
  `Product_IDNo` int(11) NOT NULL,
  `SaleDetails_TotalQuantity` int(11) NOT NULL,
  `Purchase_Rate` decimal(18,2) DEFAULT NULL,
  `SaleDetails_Rate` decimal(18,2) NOT NULL,
  `SaleDetails_Discount` decimal(18,2) NOT NULL,
  `Discount_amount` decimal(18,2) DEFAULT NULL,
  `SaleDetails_Tax` decimal(18,2) NOT NULL,
  `SaleDetails_TotalAmount` decimal(18,2) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `SaleDetails_BranchId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_saledetails`
--

INSERT INTO `tbl_saledetails` (`SaleDetails_SlNo`, `SaleMaster_IDNo`, `Product_IDNo`, `SaleDetails_TotalQuantity`, `Purchase_Rate`, `SaleDetails_Rate`, `SaleDetails_Discount`, `Discount_amount`, `SaleDetails_Tax`, `SaleDetails_TotalAmount`, `Status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `SaleDetails_BranchId`) VALUES
(1, 1, 3, 2, '45.00', '50.00', '0.00', NULL, '15.00', '100.00', 'a', 'Admin', '2019-09-17 23:03:51', NULL, NULL, 1),
(2, 1, 5, 20, '300.00', '400.00', '0.00', NULL, '0.00', '8000.00', 'a', 'Admin', '2019-09-17 23:03:51', NULL, NULL, 1),
(3, 2, 2, 1, '12000.00', '15000.00', '0.00', NULL, '0.00', '15000.00', 'a', 'Admin', '2019-09-17 23:04:38', NULL, NULL, 1),
(4, 3, 1, 1, '23000.00', '30000.00', '0.00', NULL, '0.00', '30000.00', 'a', 'Admin', '2019-09-18 13:31:51', NULL, NULL, 1),
(5, 3, 4, 1, '12.00', '13.00', '0.00', NULL, '2.00', '13.00', 'a', 'Admin', '2019-09-18 13:31:51', NULL, NULL, 1),
(6, 4, 3, 1, '45.00', '46.00', '0.00', NULL, '15.00', '46.00', 'a', 'Admin', '2019-09-18 13:42:22', NULL, NULL, 1),
(7, 5, 6, 1, '5000.00', '4500.00', '0.00', NULL, '0.00', '4500.00', 'a', 'Admin', '2019-09-18 13:43:10', NULL, NULL, 1),
(8, 6, 4, 1, '12.00', '13.00', '0.00', NULL, '2.00', '13.00', 'a', 'Admin', '2019-09-18 16:15:57', NULL, NULL, 1),
(9, 7, 1, 8, '23000.00', '30000.00', '0.00', NULL, '0.00', '240000.00', 'a', 'Admin', '2019-09-20 23:21:29', NULL, NULL, 1),
(10, 7, 5, 20, '300.00', '400.00', '0.00', NULL, '0.00', '8000.00', 'a', 'Admin', '2019-09-20 23:21:29', NULL, NULL, 1),
(11, 8, 2, 2, '12000.00', '15000.00', '0.00', NULL, '0.00', '30000.00', 'a', 'Admin', '2019-09-20 23:22:23', NULL, NULL, 1),
(12, 9, 3, 30, '45.00', '50.00', '0.00', NULL, '15.00', '1500.00', 'a', 'Admin', '2019-09-20 23:23:00', NULL, NULL, 1),
(13, 10, 3, 1, '45.00', '50.00', '0.00', NULL, '15.00', '50.00', 'a', 'Admin', '2019-09-20 23:23:42', NULL, NULL, 1),
(14, 11, 3, 2, '45.00', '46.00', '0.00', NULL, '15.00', '92.00', 'a', 'Admin', '2019-09-20 23:24:08', NULL, NULL, 1),
(15, 12, 4, 20, '12.00', '12.50', '0.00', NULL, '2.00', '250.00', 'a', 'Admin', '2019-09-20 23:24:54', NULL, NULL, 1),
(16, 13, 2, 2, '12000.00', '15000.00', '0.00', NULL, '0.00', '30000.00', 'a', 'Admin', '2019-09-22 17:57:14', NULL, NULL, 1),
(17, 13, 4, 1, '12.00', '13.00', '0.00', NULL, '2.00', '13.00', 'a', 'Admin', '2019-09-22 17:57:14', NULL, NULL, 1),
(18, 14, 5, 1, '300.00', '400.00', '0.00', NULL, '0.00', '400.00', 'd', 'Admin', '2019-09-25 18:25:18', NULL, NULL, 1),
(19, 15, 1, 2, '23000.00', '30000.00', '0.00', NULL, '0.00', '60000.00', 'a', 'Admin', '2019-10-03 17:12:41', NULL, NULL, 1),
(20, 15, 3, 2, '45.00', '50.00', '0.00', NULL, '15.00', '100.00', 'a', 'Admin', '2019-10-03 17:12:41', NULL, NULL, 1),
(21, 16, 4, 1, '12.00', '13.00', '0.00', NULL, '2.00', '13.00', 'a', 'Admin', '2019-10-03 17:15:27', NULL, NULL, 1),
(22, 16, 1, 1, '23000.00', '30000.00', '0.00', NULL, '0.00', '30000.00', 'a', 'Admin', '2019-10-03 17:15:27', NULL, NULL, 1),
(23, 16, 3, 1, '45.00', '50.00', '0.00', NULL, '15.00', '50.00', 'a', 'Admin', '2019-10-03 17:15:27', NULL, NULL, 1),
(24, 17, 5, 1, '300.00', '400.00', '0.00', NULL, '0.00', '400.00', 'a', 'Admin', '2019-10-12 17:47:04', NULL, NULL, 1),
(25, 18, 3, 20, '45.00', '50.00', '0.00', NULL, '15.00', '1000.00', 'a', 'Admin', '2019-10-22 16:45:38', NULL, NULL, 1),
(26, 18, 5, 2, '300.00', '400.00', '0.00', NULL, '0.00', '800.00', 'a', 'Admin', '2019-10-22 16:45:38', NULL, NULL, 1),
(27, 19, 2, 2, '12000.00', '15000.00', '0.00', NULL, '0.00', '30000.00', 'a', 'Admin', '2019-10-31 13:49:02', NULL, NULL, 1),
(28, 19, 3, 2, '45.00', '50.00', '0.00', NULL, '15.00', '100.00', 'a', 'Admin', '2019-10-31 13:49:02', NULL, NULL, 1),
(29, 19, 5, 2, '300.00', '400.00', '0.00', NULL, '0.00', '800.00', 'a', 'Admin', '2019-10-31 13:49:02', NULL, NULL, 1),
(30, 20, 2, 1, '12000.00', '15000.00', '0.00', NULL, '0.00', '15000.00', 'a', 'Admin', '2019-11-16 12:48:50', NULL, NULL, 1),
(31, 20, 5, 1, '300.00', '400.00', '0.00', NULL, '0.00', '400.00', 'a', 'Admin', '2019-11-16 12:48:50', NULL, NULL, 1),
(32, 21, 2, 1, '12000.00', '15000.00', '0.00', NULL, '0.00', '15000.00', 'a', 'Admin', '2019-11-22 16:46:52', NULL, NULL, 1),
(33, 21, 5, 1, '300.00', '400.00', '0.00', NULL, '0.00', '400.00', 'a', 'Admin', '2019-11-22 16:46:52', NULL, NULL, 1),
(34, 22, 3, 1, '45.00', '44.00', '0.00', NULL, '15.00', '44.00', 'a', 'Admin', '2019-11-22 16:47:25', NULL, NULL, 1),
(35, 23, 3, 10, '45.00', '50.00', '0.00', NULL, '15.00', '500.00', 'a', 'Admin', '2019-12-04 17:13:39', NULL, NULL, 1),
(36, 24, 3, 2, '45.00', '50.00', '0.00', NULL, '15.00', '100.00', 'a', 'Admin', '2019-12-07 17:39:26', NULL, NULL, 1),
(37, 24, 4, 10, '12.00', '13.00', '0.00', NULL, '2.00', '130.00', 'a', 'Admin', '2019-12-07 17:39:26', NULL, NULL, 1),
(38, 25, 5, 4, '300.00', '400.00', '0.00', NULL, '0.00', '1600.00', 'a', 'Admin', '2019-12-07 17:40:54', NULL, NULL, 1),
(39, 26, 4, 7, '12.00', '13.00', '0.00', NULL, '2.00', '91.00', 'a', 'Admin', '2019-12-07 17:41:41', NULL, NULL, 1),
(40, 27, 3, 10, '45.00', '50.00', '0.00', NULL, '15.00', '500.00', 'a', 'Admin', '2019-12-07 17:49:10', NULL, NULL, 1),
(41, 28, 2, 1, '12000.00', '15000.00', '0.00', NULL, '0.00', '15000.00', 'a', 'Admin', '2019-12-11 20:45:56', NULL, NULL, 1),
(42, 28, 4, 1, '12.00', '13.00', '0.00', NULL, '2.00', '13.00', 'a', 'Admin', '2019-12-11 20:45:56', NULL, NULL, 1),
(43, 28, 3, 5, '45.00', '50.00', '0.00', NULL, '15.00', '250.00', 'a', 'Admin', '2019-12-11 20:45:56', NULL, NULL, 1),
(44, 28, 5, 2, '300.00', '400.00', '0.00', NULL, '0.00', '800.00', 'a', 'Admin', '2019-12-11 20:45:56', NULL, NULL, 1),
(45, 29, 1, 1, '23000.00', '30000.00', '0.00', NULL, '0.00', '30000.00', 'a', 'Admin', '2019-12-12 13:42:10', NULL, NULL, 1),
(46, 29, 3, 2, '45.00', '50.00', '0.00', NULL, '15.00', '100.00', 'a', 'Admin', '2019-12-12 13:42:10', NULL, NULL, 1),
(47, 30, 7, 50, '1000.00', '1500.00', '0.00', NULL, '0.00', '75000.00', 'a', 'Admin', '2019-12-14 11:47:35', NULL, NULL, 1),
(48, 31, 3, 6, '45.00', '50.00', '0.00', NULL, '15.00', '300.00', 'a', 'Admin', '2019-12-15 12:11:03', NULL, NULL, 1),
(49, 32, 2, 6, '12000.00', '15000.00', '0.00', NULL, '0.00', '90000.00', 'a', 'Admin', '2019-12-15 12:14:02', NULL, NULL, 1),
(50, 33, 1, 1, '23000.00', '30000.00', '0.00', NULL, '0.00', '30000.00', 'a', 'Admin', '2019-12-15 12:25:10', NULL, NULL, 1),
(51, 34, 9, 20, '40.00', '55.00', '0.00', NULL, '0.00', '1100.00', 'a', 'abh', '2019-12-18 13:53:54', NULL, NULL, 4),
(52, 35, 7, 10, '300.00', '350.00', '0.00', NULL, '0.00', '3500.00', 'a', 'Admin', '2019-12-18 16:39:52', NULL, NULL, 1),
(53, 36, 8, 2, '200.00', '250.00', '0.00', NULL, '0.00', '500.00', 'a', 'Admin', '2019-12-18 17:54:54', NULL, NULL, 1),
(54, 37, 2, 23, '12000.00', '15000.00', '0.00', NULL, '0.00', '345000.00', 'a', 'Admin', '2019-12-18 17:55:48', NULL, NULL, 1),
(55, 37, 3, 23, '45.00', '50.00', '0.00', NULL, '15.00', '1150.00', 'a', 'Admin', '2019-12-18 17:55:48', NULL, NULL, 1),
(56, 37, 8, 5, '200.00', '250.00', '0.00', NULL, '0.00', '1250.00', 'a', 'Admin', '2019-12-18 17:55:48', NULL, NULL, 1),
(57, 38, 5, 5, '300.00', '400.00', '0.00', NULL, '0.00', '2000.00', 'a', 'Admin', '2019-12-19 18:47:06', NULL, NULL, 1),
(58, 39, 5, 3, '300.00', '400.00', '0.00', NULL, '0.00', '1200.00', 'a', 'Admin', '2019-12-19 18:48:03', NULL, NULL, 1),
(59, 40, 4, 9, '12.00', '13.00', '0.00', NULL, '2.00', '117.00', 'a', 'Admin', '2019-12-21 12:41:44', NULL, NULL, 1),
(60, 40, 5, 1, '300.00', '400.00', '0.00', NULL, '0.00', '400.00', 'a', 'Admin', '2019-12-21 12:41:44', NULL, NULL, 1),
(61, 41, 18, 50, '100.00', '105.00', '0.00', NULL, '0.00', '5250.00', 'a', 'Admin', '2019-12-21 13:45:37', NULL, NULL, 1),
(62, 42, 5, 50, '300.00', '350.00', '0.00', NULL, '0.00', '17500.00', 'a', 'Admin', '2019-12-21 13:48:20', NULL, NULL, 1),
(63, 42, 18, 50, '100.00', '101.00', '0.00', NULL, '0.00', '5050.00', 'a', 'Admin', '2019-12-21 13:48:20', NULL, NULL, 1),
(64, 43, 1, 1, '23000.00', '30000.00', '0.00', NULL, '0.00', '30000.00', 'a', 'Admin', '2019-12-21 14:50:14', NULL, NULL, 1),
(65, 43, 5, 2, '300.00', '400.00', '0.00', NULL, '0.00', '800.00', 'a', 'Admin', '2019-12-21 14:50:14', NULL, NULL, 1),
(66, 43, 3, 1, '45.00', '50.00', '0.00', NULL, '15.00', '50.00', 'a', 'Admin', '2019-12-21 14:50:14', NULL, NULL, 1),
(67, 44, 5, 2, '300.00', '400.00', '0.00', NULL, '0.00', '800.00', 'a', 'Admin', '2019-12-24 19:04:22', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_salereturn`
--

CREATE TABLE `tbl_salereturn` (
  `SaleReturn_SlNo` int(11) NOT NULL,
  `SaleMaster_InvoiceNo` varchar(50) NOT NULL,
  `SaleReturn_ReturnDate` date NOT NULL,
  `SaleReturn_ReturnAmount` decimal(18,2) NOT NULL,
  `SaleReturn_Description` varchar(300) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `SaleReturn_brunchId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_salereturn`
--

INSERT INTO `tbl_salereturn` (`SaleReturn_SlNo`, `SaleMaster_InvoiceNo`, `SaleReturn_ReturnDate`, `SaleReturn_ReturnAmount`, `SaleReturn_Description`, `Status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `SaleReturn_brunchId`) VALUES
(1, '2019000018', '2019-10-22', '100.00', 'ccc', 'a', 'Admin', '2019-10-22 16:45:58', NULL, NULL, 1),
(2, '2019000018', '2019-10-22', '550.00', '', 'a', 'Admin', '2019-10-22 16:52:45', NULL, NULL, 1),
(3, '2019000023', '2019-12-04', '100.00', '', 'a', 'Admin', '2019-12-04 17:14:01', NULL, NULL, 1),
(4, '2019000023', '2019-12-04', '100.00', '', 'a', 'Admin', '2019-12-04 17:14:58', NULL, NULL, 1),
(5, '2019000034', '2019-12-19', '550.00', '', 'a', 'abh', '2019-12-19 00:21:20', NULL, NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_salereturndetails`
--

CREATE TABLE `tbl_salereturndetails` (
  `SaleReturnDetails_SlNo` int(11) NOT NULL,
  `SaleReturn_IdNo` int(11) NOT NULL,
  `SaleReturnDetailsProduct_SlNo` int(11) NOT NULL,
  `SaleReturnDetails_ReturnQuantity` int(11) NOT NULL,
  `SaleReturnDetails_ReturnAmount` decimal(18,2) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `SaleReturnDetails_brunchID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_salereturndetails`
--

INSERT INTO `tbl_salereturndetails` (`SaleReturnDetails_SlNo`, `SaleReturn_IdNo`, `SaleReturnDetailsProduct_SlNo`, `SaleReturnDetails_ReturnQuantity`, `SaleReturnDetails_ReturnAmount`, `Status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `SaleReturnDetails_brunchID`) VALUES
(1, 1, 3, 2, '100.00', 'a', 'Admin', '2019-10-22 16:45:58', NULL, NULL, 1),
(2, 2, 3, 3, '150.00', 'a', 'Admin', '2019-10-22 16:52:45', NULL, NULL, 1),
(3, 2, 5, 1, '400.00', 'a', 'Admin', '2019-10-22 16:52:45', NULL, NULL, 1),
(4, 3, 3, 2, '100.00', 'a', 'Admin', '2019-12-04 17:14:01', NULL, NULL, 1),
(5, 4, 3, 2, '100.00', 'a', 'Admin', '2019-12-04 17:14:58', NULL, NULL, 1),
(6, 5, 9, 10, '550.00', 'a', 'abh', '2019-12-19 00:21:20', NULL, NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_salesmaster`
--

CREATE TABLE `tbl_salesmaster` (
  `SaleMaster_SlNo` int(11) NOT NULL,
  `SaleMaster_InvoiceNo` varchar(50) NOT NULL,
  `SalseCustomer_IDNo` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `SaleMaster_SaleDate` date NOT NULL,
  `SaleMaster_Description` longtext,
  `SaleMaster_SaleType` varchar(50) DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT 'Cash',
  `SaleMaster_TotalSaleAmount` decimal(18,2) NOT NULL,
  `SaleMaster_TotalDiscountAmount` decimal(18,2) NOT NULL,
  `SaleMaster_TaxAmount` decimal(18,2) NOT NULL,
  `SaleMaster_Freight` decimal(18,2) DEFAULT '0.00',
  `SaleMaster_SubTotalAmount` decimal(18,2) NOT NULL,
  `SaleMaster_PaidAmount` decimal(18,2) NOT NULL,
  `SaleMaster_DueAmount` decimal(18,2) NOT NULL,
  `SaleMaster_Previous_Due` double(18,2) DEFAULT NULL,
  `Status` char(1) NOT NULL DEFAULT 'a',
  `is_service` varchar(10) NOT NULL DEFAULT 'false',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `SaleMaster_branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_salesmaster`
--

INSERT INTO `tbl_salesmaster` (`SaleMaster_SlNo`, `SaleMaster_InvoiceNo`, `SalseCustomer_IDNo`, `employee_id`, `SaleMaster_SaleDate`, `SaleMaster_Description`, `SaleMaster_SaleType`, `payment_type`, `SaleMaster_TotalSaleAmount`, `SaleMaster_TotalDiscountAmount`, `SaleMaster_TaxAmount`, `SaleMaster_Freight`, `SaleMaster_SubTotalAmount`, `SaleMaster_PaidAmount`, `SaleMaster_DueAmount`, `SaleMaster_Previous_Due`, `Status`, `is_service`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `SaleMaster_branchid`) VALUES
(1, '2019000001', 3, NULL, '2019-09-17', '', 'retail', 'Cash', '8115.00', '0.00', '15.00', '0.00', '8100.00', '5000.00', '3115.00', 0.00, 'a', 'false', 'Admin', '2019-09-17 23:03:51', NULL, NULL, 1),
(2, '2019000002', 2, NULL, '2019-09-17', '', 'retail', 'Cash', '15000.00', '0.00', '0.00', '0.00', '15000.00', '1000.00', '14000.00', 0.00, 'a', 'false', 'Admin', '2019-09-17 23:04:38', NULL, NULL, 1),
(3, '2019000003', 3, NULL, '2019-09-18', '', 'retail', 'Cash', '30013.26', '0.00', '0.26', '0.00', '30013.00', '10000.00', '20013.26', 2115.00, 'a', 'false', 'Admin', '2019-09-18 13:31:51', NULL, NULL, 1),
(4, '2019000004', 5, NULL, '2019-09-18', '', 'wholesale', 'Cash', '552.90', '0.00', '6.90', '500.00', '46.00', '552.90', '0.00', 0.00, 'a', 'false', 'Admin', '2019-09-18 13:42:22', NULL, NULL, 1),
(5, '2019000005', 4, NULL, '2019-09-18', '', 'wholesale', 'Cash', '4500.00', '0.00', '0.00', '0.00', '4500.00', '0.00', '4500.00', 0.00, 'a', 'true', 'Admin', '2019-09-18 13:43:10', NULL, NULL, 1),
(6, '2019000006', 2, NULL, '2019-09-18', '', 'retail', 'Cash', '13.26', '0.00', '0.26', '0.00', '13.00', '13.26', '0.00', 9000.00, 'a', 'false', 'Admin', '2019-09-18 16:15:57', NULL, NULL, 1),
(7, '2019000007', 3, NULL, '2019-09-20', '', 'retail', 'Cash', '248000.00', '0.00', '0.00', '0.00', '248000.00', '199997.00', '48003.00', 22128.26, 'a', 'false', 'Admin', '2019-09-20 23:21:29', NULL, NULL, 1),
(8, '2019000008', 2, NULL, '2019-09-20', '', 'retail', 'Cash', '30000.00', '0.00', '0.00', '0.00', '30000.00', '25000.00', '5000.00', 9000.00, 'a', 'false', 'Admin', '2019-09-20 23:22:23', NULL, NULL, 1),
(9, '2019000009', 2, NULL, '2019-09-20', '', 'retail', 'Cash', '1725.00', '0.00', '225.00', '0.00', '1500.00', '2000.00', '-275.00', 14000.00, 'a', 'false', 'Admin', '2019-09-20 23:23:00', NULL, NULL, 1),
(10, '2019000010', 3, NULL, '2019-09-20', '', 'retail', 'Cash', '57.50', '0.00', '7.50', '0.00', '50.00', '0.00', '57.50', 70131.26, 'a', 'false', 'Admin', '2019-09-20 23:23:42', NULL, NULL, 1),
(11, '2019000011', 4, NULL, '2019-09-20', '', 'wholesale', 'Cash', '105.80', '0.00', '13.80', '0.00', '92.00', '105.00', '0.80', 3000.00, 'a', 'false', 'Admin', '2019-09-20 23:24:08', NULL, NULL, 1),
(12, '2019000012', 1, NULL, '2019-09-20', '', 'wholesale', 'Cash', '255.00', '0.00', '5.00', '0.00', '250.00', '255.00', '0.00', 0.00, 'a', 'false', 'Admin', '2019-09-20 23:24:54', NULL, NULL, 1),
(13, '2019000013', 3, NULL, '2019-09-22', '', 'retail', 'Cash', '30013.26', '0.00', '0.26', '0.00', '30013.00', '0.00', '30013.26', 70188.76, 'a', 'false', 'Admin', '2019-09-22 17:57:14', NULL, NULL, 1),
(14, '2019000014', 3, NULL, '2019-09-25', '', 'retail', 'Cash', '400.00', '0.00', '0.00', '0.00', '400.00', '0.00', '400.00', 100202.02, 'd', 'false', 'Admin', '2019-09-25 18:25:18', NULL, NULL, 1),
(15, '2019000015', 3, NULL, '2019-10-03', '', 'retail', 'Cash', '60100.00', '0.00', '0.00', '0.00', '60100.00', '0.00', '60100.00', 100202.02, 'a', 'false', 'Admin', '2019-10-03 17:12:41', NULL, NULL, 1),
(16, '2019000016', 2, NULL, '2019-10-03', '', 'retail', 'Cash', '30063.00', '0.00', '0.00', '0.00', '30063.00', '30000.00', '63.00', 7725.00, 'a', 'false', 'Admin', '2019-10-03 17:15:27', NULL, NULL, 1),
(17, '2019000017', 3, NULL, '2019-10-12', '', 'retail', 'Cash', '400.00', '0.00', '0.00', '0.00', '400.00', '0.00', '400.00', 157302.02, 'a', 'false', 'Admin', '2019-10-12 17:47:04', NULL, NULL, 1),
(18, '2019000018', 3, NULL, '2019-10-22', '', 'retail', 'Cash', '1800.00', '0.00', '0.00', '0.00', '1800.00', '1000.00', '800.00', 157702.02, 'a', 'false', 'Admin', '2019-10-22 16:45:38', NULL, NULL, 1),
(19, '2019000019', 3, NULL, '2019-10-31', '', 'retail', 'Cash', '30900.00', '0.00', '0.00', '0.00', '30900.00', '30000.00', '900.00', 157852.02, 'a', 'false', 'Admin', '2019-10-31 13:49:02', NULL, NULL, 1),
(20, '2019000020', 3, NULL, '2019-11-16', '', 'retail', 'Cash', '15400.00', '0.00', '0.00', '0.00', '15400.00', '0.00', '15400.00', 158752.02, 'a', 'false', 'Admin', '2019-11-16 12:48:50', NULL, NULL, 1),
(21, '2019000021', 3, NULL, '2019-11-22', '', 'retail', 'Cash', '15400.00', '0.00', '0.00', '0.00', '15400.00', '0.00', '15400.00', 174152.02, 'a', 'false', 'Admin', '2019-11-22 16:46:52', NULL, NULL, 1),
(22, '2019000022', 2, NULL, '2019-11-22', '', 'retail', 'Cash', '44.00', '0.00', '0.00', '0.00', '44.00', '0.00', '44.00', 7788.00, 'a', 'false', 'Admin', '2019-11-22 16:47:25', NULL, NULL, 1),
(23, '2019000023', 6, NULL, '2019-12-04', '', 'retail', 'Cash', '500.00', '0.00', '0.00', '0.00', '500.00', '500.00', '0.00', 0.00, 'a', 'false', 'Admin', '2019-12-04 17:13:39', NULL, NULL, 1),
(24, '2019000024', 3, 2, '2019-12-07', '', 'retail', 'Cash', '230.00', '0.00', '0.00', '0.00', '230.00', '100.00', '130.00', 189552.02, 'a', 'false', 'Admin', '2019-12-07 17:39:26', NULL, NULL, 1),
(25, '2019000025', 6, NULL, '2019-12-07', '', 'retail', 'Cash', '1600.00', '0.00', '0.00', '0.00', '1600.00', '1000.00', '600.00', 0.00, 'a', 'false', 'Admin', '2019-12-07 17:40:54', NULL, NULL, 1),
(26, '2019000026', 6, NULL, '2019-12-07', '', 'retail', 'Cash', '91.00', '0.00', '0.00', '0.00', '91.00', '91.00', '0.00', 600.00, 'a', 'false', 'Admin', '2019-12-07 17:41:41', NULL, NULL, 1),
(27, '2019000027', 6, NULL, '2019-12-01', '', 'retail', 'Cash', '500.00', '0.00', '0.00', '0.00', '500.00', '500.00', '0.00', 600.00, 'a', 'false', 'Admin', '2019-12-07 17:49:10', NULL, NULL, 1),
(28, '2019000028', 6, 2, '2019-12-11', '', 'retail', 'Cash', '16063.00', '0.00', '0.00', '0.00', '16063.00', '16063.00', '0.00', 600.00, 'a', 'false', 'Admin', '2019-12-11 20:45:56', NULL, NULL, 1),
(29, '2019000029', 6, NULL, '2019-12-12', '', 'retail', 'Cash', '30100.00', '0.00', '0.00', '0.00', '30100.00', '30100.00', '0.00', 600.00, 'a', 'false', 'Admin', '2019-12-12 13:42:10', NULL, NULL, 1),
(30, '2019000030', 6, NULL, '2019-12-14', '', 'retail', 'Cash', '75000.00', '0.00', '0.00', '0.00', '75000.00', '75000.00', '0.00', 600.00, 'a', 'false', 'Admin', '2019-12-14 11:47:35', NULL, NULL, 1),
(31, '2019000031', 3, 3, '2019-12-15', '', 'retail', 'Cash', '300.00', '0.00', '0.00', '0.00', '300.00', '6.00', '294.00', 189682.02, 'a', 'false', 'Admin', '2019-12-15 12:11:03', NULL, NULL, 1),
(32, '2019000032', 6, NULL, '2019-12-15', '', 'retail', 'Cash', '90000.00', '0.00', '0.00', '0.00', '90000.00', '90000.00', '0.00', 600.00, 'a', 'false', 'Admin', '2019-12-15 12:14:02', NULL, NULL, 1),
(33, '2019000033', 6, NULL, '2019-12-15', '', 'retail', 'Cash', '30000.00', '0.00', '0.00', '0.00', '30000.00', '30000.00', '0.00', 0.00, 'a', 'false', 'Admin', '2019-12-15 12:25:10', NULL, NULL, 1),
(34, '2019000034', 8, NULL, '2019-12-18', '', 'retail', 'Cash', '1100.00', '0.00', '0.00', '0.00', '1100.00', '1000.00', '100.00', 0.00, 'a', 'false', 'abh', '2019-12-18 13:53:54', NULL, NULL, 4),
(35, '2019000035', 7, NULL, '2019-12-18', '', 'retail', 'Cash', '3500.00', '0.00', '0.00', '0.00', '3500.00', '0.00', '3500.00', 500.00, 'a', 'false', 'Admin', '2019-12-18 16:39:52', NULL, NULL, 1),
(36, '2019000036', 10, NULL, '2019-12-03', '', 'retail', 'Cash', '500.00', '0.00', '0.00', '0.00', '500.00', '500.00', '0.00', 0.00, 'a', 'false', 'Admin', '2019-12-18 17:54:54', NULL, NULL, 1),
(37, '2019000037', 11, NULL, '2019-12-03', '', 'retail', 'Cash', '347400.00', '0.00', '0.00', '0.00', '347400.00', '347400.00', '0.00', 0.00, 'a', 'false', 'Admin', '2019-12-18 17:55:48', NULL, NULL, 1),
(38, '2019000038', 7, NULL, '2019-12-19', '', 'retail', 'Cash', '2000.00', '0.00', '0.00', '0.00', '2000.00', '2000.00', '0.00', 4000.00, 'a', 'false', 'Admin', '2019-12-19 18:47:06', NULL, NULL, 1),
(39, '2019000039', 7, NULL, '2019-12-19', '', 'retail', 'Cash', '1200.00', '0.00', '0.00', '0.00', '1200.00', '1200.00', '0.00', 4000.00, 'a', 'false', 'Admin', '2019-12-19 18:48:03', NULL, NULL, 1),
(40, '2019000040', 7, NULL, '2019-12-21', '', 'retail', 'Cash', '517.00', '0.00', '0.00', '0.00', '517.00', '517.00', '0.00', 4000.00, 'a', 'false', 'Admin', '2019-12-21 12:41:44', NULL, NULL, 1),
(41, '2019000041', 7, NULL, '2019-12-21', '', 'retail', 'Cash', '5250.00', '0.00', '0.00', '0.00', '5250.00', '5000.00', '250.00', 4000.00, 'a', 'false', 'Admin', '2019-12-21 13:45:37', NULL, NULL, 1),
(42, '2019000042', 16, NULL, '2019-12-21', '', 'wholesale', 'Cash', '22550.00', '0.00', '0.00', '0.00', '22550.00', '0.00', '22550.00', 10000.00, 'a', 'false', 'Admin', '2019-12-21 13:48:20', NULL, NULL, 1),
(43, '2019000043', 3, 2, '2019-12-21', '', 'retail', 'Cash', '30850.00', '0.00', '0.00', '0.00', '30850.00', '20000.00', '10850.00', 188976.02, 'a', 'false', 'Admin', '2019-12-21 14:50:14', NULL, NULL, 1),
(44, '2019000044', 7, 2, '2019-12-24', '', 'retail', 'Cash', '800.00', '0.00', '0.00', '0.00', '800.00', '800.00', '0.00', 4250.00, 'a', 'false', 'Admin', '2019-12-24 19:04:22', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sms`
--

CREATE TABLE `tbl_sms` (
  `row_id` int(11) NOT NULL,
  `number` varchar(30) NOT NULL,
  `sms_text` varchar(500) NOT NULL,
  `sent_by` int(11) NOT NULL,
  `sent_datetime` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sms_settings`
--

CREATE TABLE `tbl_sms_settings` (
  `sms_enabled` varchar(10) NOT NULL DEFAULT 'false',
  `api_key` varchar(500) NOT NULL,
  `url` varchar(1000) NOT NULL,
  `bulk_url` varchar(1000) NOT NULL,
  `sms_type` varchar(50) NOT NULL,
  `sender_id` varchar(200) NOT NULL,
  `sender_name` varchar(200) NOT NULL,
  `sender_phone` varchar(50) NOT NULL,
  `saved_by` int(11) DEFAULT NULL,
  `saved_datetime` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sms_settings`
--

INSERT INTO `tbl_sms_settings` (`sms_enabled`, `api_key`, `url`, `bulk_url`, `sms_type`, `sender_id`, `sender_name`, `sender_phone`, `saved_by`, `saved_datetime`) VALUES
('true', 'C20036315d8f41beb57b36.68545984', 'http://esms.linktechbd.com/smsapi', 'http://esms.linktechbd.com/smsapimany	', 'text', 'Link-UpTech', 'Link-Up Technology', '01911-978897', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_supplier`
--

CREATE TABLE `tbl_supplier` (
  `Supplier_SlNo` int(11) NOT NULL,
  `Supplier_Code` varchar(50) NOT NULL,
  `Supplier_Name` varchar(150) NOT NULL,
  `Supplier_Type` varchar(50) NOT NULL,
  `Supplier_Phone` varchar(50) NOT NULL,
  `Supplier_Mobile` varchar(15) NOT NULL,
  `Supplier_Email` varchar(50) NOT NULL,
  `Supplier_OfficePhone` varchar(50) NOT NULL,
  `Supplier_Address` varchar(300) NOT NULL,
  `contact_person` varchar(250) DEFAULT NULL,
  `District_SlNo` int(11) NOT NULL,
  `Country_SlNo` int(11) NOT NULL,
  `Supplier_Web` varchar(150) NOT NULL,
  `previous_due` decimal(18,2) NOT NULL,
  `image_name` varchar(1000) DEFAULT NULL,
  `Status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `Supplier_brinchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_supplier`
--

INSERT INTO `tbl_supplier` (`Supplier_SlNo`, `Supplier_Code`, `Supplier_Name`, `Supplier_Type`, `Supplier_Phone`, `Supplier_Mobile`, `Supplier_Email`, `Supplier_OfficePhone`, `Supplier_Address`, `contact_person`, `District_SlNo`, `Country_SlNo`, `Supplier_Web`, `previous_due`, `image_name`, `Status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Supplier_brinchid`) VALUES
(1, 'S00001', 'FDL', '', '', '019', '', '', 'Bonani', 'FDL', 0, 0, '', '0.00', NULL, 'a', 'Admin', '2019-09-17 22:54:35', NULL, NULL, 1),
(2, 'S00002', 'Bosundhora Group', '', '', '019111', '', '', 'Dhaka', 'MD', 0, 0, '', '0.00', NULL, 'a', 'Admin', '2019-09-17 22:54:56', NULL, NULL, 1),
(3, 'S00003', 'Walton Ltd', '', '', '0177', '', '', 'Motijhel', 'GM', 0, 0, '', '0.00', NULL, 'a', 'Admin', '2019-09-17 22:55:41', NULL, NULL, 1),
(4, 'S00004', 'Padma Oil Company', '', '', '01711000000', '', '', 'AC Dept. Kushtia', '', 0, 0, '', '1000.00', NULL, 'a', 'Admin', '2019-12-15 13:10:03', NULL, NULL, 1),
(5, 'S00005', 'Energypac', '', '', '01719406682', 'hashemi.nilg@gmail.com', '', 'Dhaka', 'Energypac', 0, 0, '', '50000.00', NULL, 'a', 'Admin', '2019-12-17 19:17:02', NULL, NULL, 1),
(6, 'S00006', 'Green Lux', '', '', '3366878', 'mirpurtraders@gmail.com', '', 'Uttara, Dhaka', 'Green Lux', 0, 0, '', '0.00', NULL, 'a', 'Admin', '2019-12-17 20:02:19', NULL, NULL, 1),
(7, 'S00007', 'Zero Plus', '', '', '1912177451', '', '', 'Dhaka', 'Zero Plus', 0, 0, '', '0.00', NULL, 'a', 'Admin', '2019-12-17 20:03:17', NULL, NULL, 1),
(8, 'S00008', 'janata bearing', '', '', '0111', '', '', '82 nawabpur', 'musa', 0, 0, '', '1000.00', NULL, 'a', 'abh', '2019-12-18 13:47:44', NULL, NULL, 4),
(9, 'S00009', 'Riad Bearing Center', '', '', '01723434300,019', '', '', '', '', 0, 0, '', '0.00', NULL, 'a', 'abh', '2019-12-18 16:13:36', NULL, NULL, 4),
(10, 'S00010', 'BASHUNDHARA FOOD BEVERAGE', '', '', '012', '', '', '', '', 0, 0, '', '0.00', NULL, 'a', 'abh', '2019-12-19 11:52:37', NULL, NULL, 4),
(11, 'S00011', 'M/S Helal Enterprise', '', '', '+8801715078403,', '', '', '219,Nawabpur Road,Gawsia Plaza,Dhaka-1100', 'Helal', 0, 0, '', '0.00', NULL, 'a', 'abh', '2019-12-19 12:34:22', NULL, NULL, 4),
(12, 'S00012', 'Donghu China', '', '', '0086', 'xxx', '', 'China', 'Zheng Li', 0, 0, '', '0.00', NULL, 'a', 'national', '2019-12-19 13:43:02', NULL, NULL, 7),
(13, 'S00013', 'walton company', '', '', '01815641123', '', '', 'gazipur', 'tareq', 0, 0, '', '0.00', NULL, 'a', 'mamun', '2019-12-19 16:12:10', NULL, NULL, 8),
(14, 'S00014', 'arif', 'G', '', '01911025400', '', '', '', NULL, 0, 0, '', '0.00', NULL, 'a', 'Admin', '2019-12-21 13:44:08', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_supplier_payment`
--

CREATE TABLE `tbl_supplier_payment` (
  `SPayment_id` int(11) NOT NULL,
  `SPayment_date` date DEFAULT NULL,
  `SPayment_invoice` varchar(20) DEFAULT NULL,
  `SPayment_customerID` varchar(20) DEFAULT NULL,
  `SPayment_TransactionType` varchar(25) DEFAULT NULL,
  `SPayment_amount` decimal(18,2) DEFAULT NULL,
  `SPayment_Paymentby` varchar(20) DEFAULT NULL,
  `SPayment_notes` varchar(225) DEFAULT NULL,
  `SPayment_brunchid` int(11) DEFAULT NULL,
  `SPayment_status` varchar(2) DEFAULT NULL,
  `SPayment_Addby` varchar(100) DEFAULT NULL,
  `SPayment_AddDAte` date DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `SPayment_UpdateDAte` date DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_supplier_payment`
--

INSERT INTO `tbl_supplier_payment` (`SPayment_id`, `SPayment_date`, `SPayment_invoice`, `SPayment_customerID`, `SPayment_TransactionType`, `SPayment_amount`, `SPayment_Paymentby`, `SPayment_notes`, `SPayment_brunchid`, `SPayment_status`, `SPayment_Addby`, `SPayment_AddDAte`, `update_by`, `SPayment_UpdateDAte`, `account_id`) VALUES
(1, '2019-09-18', 'TR00001', '3', 'CP', '1000.00', 'bank', 'Cash', 1, 'a', 'Admin', '2019-09-17', 0, '2019-09-17', 2),
(2, '2019-09-18', 'TR00002', '2', 'CP', '100.00', 'cash', '11', 1, 'a', 'Admin', '2019-09-17', NULL, NULL, NULL),
(3, '2019-09-20', 'TR00003', '2', 'CP', '5000.00', 'bank', 'bb', 1, 'a', 'Admin', '2019-09-20', NULL, NULL, 1),
(4, '2019-12-18', 'TR00004', '10', 'CP', '151900.00', 'bank', '', 4, 'a', 'abh', '2019-12-19', NULL, NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transferdetails`
--

CREATE TABLE `tbl_transferdetails` (
  `transferdetails_id` int(11) NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_transferdetails`
--

INSERT INTO `tbl_transferdetails` (`transferdetails_id`, `transfer_id`, `product_id`, `quantity`) VALUES
(1, 1, 5, 20),
(2, 1, 1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transfermaster`
--

CREATE TABLE `tbl_transfermaster` (
  `transfer_id` int(11) NOT NULL,
  `transfer_date` date NOT NULL,
  `transfer_by` int(11) NOT NULL,
  `transfer_from` int(11) NOT NULL,
  `transfer_to` int(11) NOT NULL,
  `note` varchar(500) DEFAULT NULL,
  `added_by` int(11) NOT NULL,
  `added_datetime` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_datetime` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_transfermaster`
--

INSERT INTO `tbl_transfermaster` (`transfer_id`, `transfer_date`, `transfer_by`, `transfer_from`, `transfer_to`, `note`, `added_by`, `added_datetime`, `updated_by`, `updated_datetime`) VALUES
(1, '2019-12-11', 2, 1, 2, '', 0, '0000-00-00 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_unit`
--

CREATE TABLE `tbl_unit` (
  `Unit_SlNo` int(11) NOT NULL,
  `Unit_Name` varchar(150) NOT NULL,
  `status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_unit`
--

INSERT INTO `tbl_unit` (`Unit_SlNo`, `Unit_Name`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`) VALUES
(1, 'PCS', 'd', NULL, NULL, NULL, NULL),
(2, 'kg', 'a', 'Admin', '2019-12-17 19:02:30', NULL, NULL),
(3, 'Yard', 'a', 'Admin', '2019-12-17 19:02:41', NULL, NULL),
(4, 'cm.', 'd', 'Admin', '2019-12-17 19:02:57', NULL, NULL),
(5, 'Coil', 'a', 'Admin', '2019-12-17 19:04:09', NULL, NULL),
(6, 'Sp ', 'a', 'Admin', '2019-12-18 12:00:21', NULL, NULL),
(7, 'DP', 'a', 'Admin', '2019-12-18 12:00:30', NULL, NULL),
(8, 'TP', 'a', 'Admin', '2019-12-18 12:00:39', NULL, NULL),
(9, 'MCB', 'a', 'Admin', '2019-12-18 12:00:52', NULL, NULL),
(10, 'MC', 'a', 'Admin', '2019-12-18 12:01:01', NULL, NULL),
(11, 'MCCB', 'a', 'Admin', '2019-12-18 12:01:11', NULL, NULL),
(12, 'BOX', 'a', 'Admin', '2019-12-18 12:02:33', NULL, NULL),
(13, 'Peaces', 'a', 'Admin', '2019-12-18 15:19:19', NULL, NULL),
(14, 'pc', 'a', 'Admin', '2019-12-19 13:35:52', NULL, NULL),
(15, 'PCS', 'a', NULL, NULL, NULL, NULL),
(16, 'PCS', 'a', NULL, NULL, NULL, NULL),
(17, 'PCS', 'a', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `User_SlNo` int(11) NOT NULL,
  `User_ID` varchar(50) NOT NULL,
  `FullName` varchar(150) NOT NULL,
  `User_Name` varchar(150) NOT NULL,
  `UserEmail` varchar(200) NOT NULL,
  `userBrunch_id` int(11) NOT NULL,
  `User_Password` varchar(50) NOT NULL,
  `UserType` varchar(50) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `verifycode` int(11) NOT NULL,
  `image_name` varchar(1000) DEFAULT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `Brunch_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`User_SlNo`, `User_ID`, `FullName`, `User_Name`, `UserEmail`, `userBrunch_id`, `User_Password`, `UserType`, `status`, `verifycode`, `image_name`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Brunch_ID`) VALUES
(1, 'U0001', 'Admin', 'admin', 'admin@host.com', 1, 'eeba5869cccdbbbabec2598c413ed914', 'm', 'a', 0, '1.jpg', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_access`
--

CREATE TABLE `tbl_user_access` (
  `access_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `access` text NOT NULL,
  `saved_by` int(11) NOT NULL,
  `saved_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_user_access`
--

INSERT INTO `tbl_user_access` (`access_id`, `user_id`, `access`, `saved_by`, `saved_datetime`) VALUES
(1, 2, '[\"sales\\/product\",\"bank_transaction_report\"]', 1, '2019-10-12 16:17:49'),
(2, 3, '[\"sales\\/product\"]', 1, '2019-12-07 22:45:55'),
(3, 4, '[\"sales\\/product\",\"sales\\/service\",\"salesReturn\",\"salesrecord\",\"currentStock\",\"quotation\",\"cashTransaction\",\"bank_transactions\",\"customerPaymentPage\",\"supplierPayment\",\"cash_view\",\"account\",\"bank_accounts\",\"check\\/entry\",\"check\\/list\",\"check\\/reminder\\/list\",\"check\\/pending\\/list\",\"check\\/dis\\/list\",\"check\\/paid\\/list\",\"salesinvoice\",\"returnList\",\"customerDue\",\"customerPaymentReport\",\"customer_payment_history\",\"customerlist\",\"price_list\",\"quotation_invoice_report\",\"quotation_record\",\"TransactionReport\",\"bank_transaction_report\",\"cashStatment\",\"BalanceSheet\",\"profitLoss\",\"day_book\",\"purchase\",\"purchaseReturns\",\"purchaseRecord\",\"AssetsEntry\",\"salarypayment\",\"employee\",\"emplists\",\"designation\",\"depertment\",\"month\",\"employeesalaryreport\",\"purchaseInvoice\",\"supplierDue\",\"supplierPaymentReport\",\"supplierList\",\"returnsList\",\"reorder_list\",\"sms\",\"product\",\"productlist\",\"product_ledger\",\"damageEntry\",\"damageList\",\"product_transfer\",\"transfer_list\",\"received_list\",\"customer\",\"supplier\",\"brunch\",\"category\",\"unit\",\"area\",\"companyProfile\",\"user\"]', 1, '2019-12-18 18:39:00'),
(4, 5, '[\"sales\\/product\",\"sales\\/service\",\"salesReturn\",\"salesrecord\",\"currentStock\",\"quotation\",\"cashTransaction\",\"bank_transactions\",\"customerPaymentPage\",\"supplierPayment\",\"cash_view\",\"account\",\"bank_accounts\",\"check\\/entry\",\"check\\/list\",\"check\\/reminder\\/list\",\"check\\/pending\\/list\",\"check\\/dis\\/list\",\"check\\/paid\\/list\",\"salesinvoice\",\"returnList\",\"customerDue\",\"customerPaymentReport\",\"customer_payment_history\",\"customerlist\",\"price_list\",\"quotation_invoice_report\",\"quotation_record\",\"TransactionReport\",\"bank_transaction_report\",\"cashStatment\",\"BalanceSheet\",\"profitLoss\",\"day_book\",\"purchase\",\"purchaseReturns\",\"purchaseRecord\",\"AssetsEntry\",\"salarypayment\",\"employee\",\"emplists\",\"designation\",\"depertment\",\"month\",\"employeesalaryreport\",\"purchaseInvoice\",\"supplierDue\",\"supplierPaymentReport\",\"supplierList\",\"returnsList\",\"reorder_list\",\"sms\",\"product\",\"productlist\",\"product_ledger\",\"damageEntry\",\"damageList\",\"product_transfer\",\"transfer_list\",\"received_list\",\"customer\",\"supplier\",\"brunch\",\"category\",\"unit\",\"area\",\"companyProfile\",\"user\"]', 1, '2019-12-19 18:35:07'),
(5, 6, '[\"sales\\/product\",\"sales\\/service\",\"salesReturn\",\"salesrecord\",\"currentStock\",\"quotation\",\"cashTransaction\",\"bank_transactions\",\"customerPaymentPage\",\"supplierPayment\",\"cash_view\",\"account\",\"bank_accounts\",\"check\\/entry\",\"check\\/list\",\"check\\/reminder\\/list\",\"check\\/pending\\/list\",\"check\\/dis\\/list\",\"check\\/paid\\/list\",\"salesinvoice\",\"returnList\",\"customerDue\",\"customerPaymentReport\",\"customer_payment_history\",\"customerlist\",\"price_list\",\"quotation_invoice_report\",\"quotation_record\",\"TransactionReport\",\"bank_transaction_report\",\"cashStatment\",\"BalanceSheet\",\"profitLoss\",\"day_book\",\"purchase\",\"purchaseReturns\",\"purchaseRecord\",\"AssetsEntry\",\"salarypayment\",\"employee\",\"emplists\",\"designation\",\"depertment\",\"month\",\"employeesalaryreport\",\"purchaseInvoice\",\"supplierDue\",\"supplierPaymentReport\",\"supplierList\",\"returnsList\",\"reorder_list\",\"sms\",\"product\",\"productlist\",\"product_ledger\",\"damageEntry\",\"damageList\",\"product_transfer\",\"transfer_list\",\"received_list\",\"customer\",\"supplier\",\"brunch\",\"category\",\"unit\",\"area\",\"companyProfile\",\"user\"]', 1, '2019-12-19 21:08:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_account`
--
ALTER TABLE `tbl_account`
  ADD PRIMARY KEY (`Acc_SlNo`);

--
-- Indexes for table `tbl_assets`
--
ALTER TABLE `tbl_assets`
  ADD PRIMARY KEY (`as_id`);

--
-- Indexes for table `tbl_bank_accounts`
--
ALTER TABLE `tbl_bank_accounts`
  ADD PRIMARY KEY (`account_id`);

--
-- Indexes for table `tbl_bank_transactions`
--
ALTER TABLE `tbl_bank_transactions`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  ADD PRIMARY KEY (`brand_SiNo`);

--
-- Indexes for table `tbl_brunch`
--
ALTER TABLE `tbl_brunch`
  ADD PRIMARY KEY (`brunch_id`);

--
-- Indexes for table `tbl_cashregister`
--
ALTER TABLE `tbl_cashregister`
  ADD PRIMARY KEY (`Transaction_ID`);

--
-- Indexes for table `tbl_cashtransaction`
--
ALTER TABLE `tbl_cashtransaction`
  ADD PRIMARY KEY (`Tr_SlNo`);

--
-- Indexes for table `tbl_checks`
--
ALTER TABLE `tbl_checks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Indexes for table `tbl_color`
--
ALTER TABLE `tbl_color`
  ADD PRIMARY KEY (`color_SiNo`);

--
-- Indexes for table `tbl_company`
--
ALTER TABLE `tbl_company`
  ADD PRIMARY KEY (`Company_SlNo`);

--
-- Indexes for table `tbl_country`
--
ALTER TABLE `tbl_country`
  ADD PRIMARY KEY (`Country_SlNo`);

--
-- Indexes for table `tbl_currentinventory`
--
ALTER TABLE `tbl_currentinventory`
  ADD PRIMARY KEY (`inventory_id`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`Customer_SlNo`);

--
-- Indexes for table `tbl_customer_payment`
--
ALTER TABLE `tbl_customer_payment`
  ADD PRIMARY KEY (`CPayment_id`);

--
-- Indexes for table `tbl_damage`
--
ALTER TABLE `tbl_damage`
  ADD PRIMARY KEY (`Damage_SlNo`);

--
-- Indexes for table `tbl_damagedetails`
--
ALTER TABLE `tbl_damagedetails`
  ADD PRIMARY KEY (`DamageDetails_SlNo`);

--
-- Indexes for table `tbl_department`
--
ALTER TABLE `tbl_department`
  ADD PRIMARY KEY (`Department_SlNo`);

--
-- Indexes for table `tbl_designation`
--
ALTER TABLE `tbl_designation`
  ADD PRIMARY KEY (`Designation_SlNo`);

--
-- Indexes for table `tbl_district`
--
ALTER TABLE `tbl_district`
  ADD PRIMARY KEY (`District_SlNo`);

--
-- Indexes for table `tbl_employee`
--
ALTER TABLE `tbl_employee`
  ADD PRIMARY KEY (`Employee_SlNo`);

--
-- Indexes for table `tbl_employee_payment`
--
ALTER TABLE `tbl_employee_payment`
  ADD PRIMARY KEY (`employee_payment_id`);

--
-- Indexes for table `tbl_expense_head`
--
ALTER TABLE `tbl_expense_head`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_month`
--
ALTER TABLE `tbl_month`
  ADD PRIMARY KEY (`month_id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`Product_SlNo`),
  ADD UNIQUE KEY `Product_Code` (`Product_Code`);

--
-- Indexes for table `tbl_productcategory`
--
ALTER TABLE `tbl_productcategory`
  ADD PRIMARY KEY (`ProductCategory_SlNo`);

--
-- Indexes for table `tbl_purchasedetails`
--
ALTER TABLE `tbl_purchasedetails`
  ADD PRIMARY KEY (`PurchaseDetails_SlNo`);

--
-- Indexes for table `tbl_purchasemaster`
--
ALTER TABLE `tbl_purchasemaster`
  ADD PRIMARY KEY (`PurchaseMaster_SlNo`);

--
-- Indexes for table `tbl_purchasereturn`
--
ALTER TABLE `tbl_purchasereturn`
  ADD PRIMARY KEY (`PurchaseReturn_SlNo`);

--
-- Indexes for table `tbl_purchasereturndetails`
--
ALTER TABLE `tbl_purchasereturndetails`
  ADD PRIMARY KEY (`PurchaseReturnDetails_SlNo`);

--
-- Indexes for table `tbl_quotaion_customer`
--
ALTER TABLE `tbl_quotaion_customer`
  ADD PRIMARY KEY (`quotation_customer_id`);

--
-- Indexes for table `tbl_quotation_details`
--
ALTER TABLE `tbl_quotation_details`
  ADD PRIMARY KEY (`SaleDetails_SlNo`);

--
-- Indexes for table `tbl_quotation_master`
--
ALTER TABLE `tbl_quotation_master`
  ADD PRIMARY KEY (`SaleMaster_SlNo`);

--
-- Indexes for table `tbl_saledetails`
--
ALTER TABLE `tbl_saledetails`
  ADD PRIMARY KEY (`SaleDetails_SlNo`);

--
-- Indexes for table `tbl_salereturn`
--
ALTER TABLE `tbl_salereturn`
  ADD PRIMARY KEY (`SaleReturn_SlNo`);

--
-- Indexes for table `tbl_salereturndetails`
--
ALTER TABLE `tbl_salereturndetails`
  ADD PRIMARY KEY (`SaleReturnDetails_SlNo`);

--
-- Indexes for table `tbl_salesmaster`
--
ALTER TABLE `tbl_salesmaster`
  ADD PRIMARY KEY (`SaleMaster_SlNo`);

--
-- Indexes for table `tbl_sms`
--
ALTER TABLE `tbl_sms`
  ADD PRIMARY KEY (`row_id`);

--
-- Indexes for table `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  ADD PRIMARY KEY (`Supplier_SlNo`);

--
-- Indexes for table `tbl_supplier_payment`
--
ALTER TABLE `tbl_supplier_payment`
  ADD PRIMARY KEY (`SPayment_id`);

--
-- Indexes for table `tbl_transferdetails`
--
ALTER TABLE `tbl_transferdetails`
  ADD PRIMARY KEY (`transferdetails_id`);

--
-- Indexes for table `tbl_transfermaster`
--
ALTER TABLE `tbl_transfermaster`
  ADD PRIMARY KEY (`transfer_id`);

--
-- Indexes for table `tbl_unit`
--
ALTER TABLE `tbl_unit`
  ADD PRIMARY KEY (`Unit_SlNo`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`User_SlNo`);

--
-- Indexes for table `tbl_user_access`
--
ALTER TABLE `tbl_user_access`
  ADD PRIMARY KEY (`access_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_account`
--
ALTER TABLE `tbl_account`
  MODIFY `Acc_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_assets`
--
ALTER TABLE `tbl_assets`
  MODIFY `as_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_bank_accounts`
--
ALTER TABLE `tbl_bank_accounts`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_bank_transactions`
--
ALTER TABLE `tbl_bank_transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `brand_SiNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_brunch`
--
ALTER TABLE `tbl_brunch`
  MODIFY `brunch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_cashregister`
--
ALTER TABLE `tbl_cashregister`
  MODIFY `Transaction_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_cashtransaction`
--
ALTER TABLE `tbl_cashtransaction`
  MODIFY `Tr_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_checks`
--
ALTER TABLE `tbl_checks`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_color`
--
ALTER TABLE `tbl_color`
  MODIFY `color_SiNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_company`
--
ALTER TABLE `tbl_company`
  MODIFY `Company_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_country`
--
ALTER TABLE `tbl_country`
  MODIFY `Country_SlNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_currentinventory`
--
ALTER TABLE `tbl_currentinventory`
  MODIFY `inventory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `Customer_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_customer_payment`
--
ALTER TABLE `tbl_customer_payment`
  MODIFY `CPayment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_damage`
--
ALTER TABLE `tbl_damage`
  MODIFY `Damage_SlNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_damagedetails`
--
ALTER TABLE `tbl_damagedetails`
  MODIFY `DamageDetails_SlNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_department`
--
ALTER TABLE `tbl_department`
  MODIFY `Department_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_designation`
--
ALTER TABLE `tbl_designation`
  MODIFY `Designation_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_district`
--
ALTER TABLE `tbl_district`
  MODIFY `District_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_employee`
--
ALTER TABLE `tbl_employee`
  MODIFY `Employee_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_employee_payment`
--
ALTER TABLE `tbl_employee_payment`
  MODIFY `employee_payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_expense_head`
--
ALTER TABLE `tbl_expense_head`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_month`
--
ALTER TABLE `tbl_month`
  MODIFY `month_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `Product_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_productcategory`
--
ALTER TABLE `tbl_productcategory`
  MODIFY `ProductCategory_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_purchasedetails`
--
ALTER TABLE `tbl_purchasedetails`
  MODIFY `PurchaseDetails_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tbl_purchasemaster`
--
ALTER TABLE `tbl_purchasemaster`
  MODIFY `PurchaseMaster_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_purchasereturn`
--
ALTER TABLE `tbl_purchasereturn`
  MODIFY `PurchaseReturn_SlNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_purchasereturndetails`
--
ALTER TABLE `tbl_purchasereturndetails`
  MODIFY `PurchaseReturnDetails_SlNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_quotaion_customer`
--
ALTER TABLE `tbl_quotaion_customer`
  MODIFY `quotation_customer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_quotation_details`
--
ALTER TABLE `tbl_quotation_details`
  MODIFY `SaleDetails_SlNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_quotation_master`
--
ALTER TABLE `tbl_quotation_master`
  MODIFY `SaleMaster_SlNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_saledetails`
--
ALTER TABLE `tbl_saledetails`
  MODIFY `SaleDetails_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `tbl_salereturn`
--
ALTER TABLE `tbl_salereturn`
  MODIFY `SaleReturn_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_salereturndetails`
--
ALTER TABLE `tbl_salereturndetails`
  MODIFY `SaleReturnDetails_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_salesmaster`
--
ALTER TABLE `tbl_salesmaster`
  MODIFY `SaleMaster_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `tbl_sms`
--
ALTER TABLE `tbl_sms`
  MODIFY `row_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  MODIFY `Supplier_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_supplier_payment`
--
ALTER TABLE `tbl_supplier_payment`
  MODIFY `SPayment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_transferdetails`
--
ALTER TABLE `tbl_transferdetails`
  MODIFY `transferdetails_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_transfermaster`
--
ALTER TABLE `tbl_transfermaster`
  MODIFY `transfer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_unit`
--
ALTER TABLE `tbl_unit`
  MODIFY `Unit_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `User_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_user_access`
--
ALTER TABLE `tbl_user_access`
  MODIFY `access_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
