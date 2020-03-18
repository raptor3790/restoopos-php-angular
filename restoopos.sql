-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2017 at 10:20 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restoopos`
--

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_aauth_groups`
--

CREATE TABLE `tendoo_aauth_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `definition` text,
  `description` text,
  `is_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tendoo_aauth_groups`
--

INSERT INTO `tendoo_aauth_groups` (`id`, `name`, `definition`, `description`, `is_admin`) VALUES
(4, 'master', 'Master Group', 'Can create users, install modules, manage options', 1),
(5, 'administrator', 'Admin Group', 'Can install modules, manage options', 1),
(6, 'user', 'User Group', 'Just a user', 1),
(7, 'shop_cashier', 'Cashier', 'Can manage item sales, managing customers.', 1),
(8, 'shop_manager', 'Shop Manager', 'allow managing item, customers, settings and reports access.', 1),
(9, 'shop_tester', 'Tester Privilege', 'Proceed all task of adding or editing. Cannot delete content.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_aauth_perms`
--

CREATE TABLE `tendoo_aauth_perms` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `definition` text,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tendoo_aauth_perms`
--

INSERT INTO `tendoo_aauth_perms` (`id`, `name`, `definition`, `description`) VALUES
(1, 'manage_core', 'Manage Core', 'Allow core management'),
(2, 'create_options', 'Create Options', 'Allow option creation'),
(3, 'edit_options', 'Edit Options', 'Allow option edition'),
(4, 'read_options', 'Read Options', 'Allow option read'),
(5, 'delete_options', 'Delete Options', 'Allow option deletion.'),
(6, 'install_modules', 'Install Modules', 'Let user install modules.'),
(7, 'update_modules', 'Update Modules', 'Let user update modules'),
(8, 'delete_modules', 'Delete Modules', 'Let user delete modules'),
(9, 'toggle_modules', 'Enable/Disable Modules', 'Let user enable/disable modules'),
(10, 'extract_modules', 'Extract Modules', 'Let user extract modules'),
(11, 'create_users', 'Create Users', 'Allow create users.'),
(12, 'edit_users', 'Edit Users', 'Allow edit users.'),
(13, 'delete_users', 'Delete Users', 'Allow delete users.'),
(14, 'edit_profile', 'Create Options', 'Allow option creation'),
(15, 'view_file_manager', 'File Manager Access', 'Let the use have access to the file manager.'),
(16, 'create_shop_orders', 'Manage orders', 'Can create orders'),
(17, 'edit_shop_orders', 'Change orders', 'Can change orders'),
(18, 'delete_shop_orders', 'Deletion of orders', 'Can remove commands'),
(19, 'create_shop_items', 'Create articles', 'Create products'),
(20, 'edit_shop_items', 'Modifying items', 'Can modify products'),
(21, 'delete_shop_items', 'Delete posts', 'Can remove products'),
(22, 'create_shop_categories', 'Creating categories', 'Create categories'),
(23, 'edit_shop_categories', 'Editing categories', 'Changes the categories'),
(24, 'delete_shop_categories', 'Delete Categories', 'Delete categories'),
(25, 'create_shop_radius', 'Create rays', 'Creates the rays'),
(26, 'edit_shop_radius', 'Change rays', 'Changes the rays'),
(27, 'delete_shop_radius', 'Remove rays', 'Removes the rays'),
(28, 'create_shop_shippings', 'Create collections', 'THE COLLECTIONS'),
(29, 'edit_shop_shippings', 'Change collections', 'Change collections'),
(30, 'delete_shop_shippings', 'Remove Collection', 'Removes the collections'),
(31, 'create_shop_providers', 'Create suppliers', 'Manage suppliers'),
(32, 'edit_shop_providers', 'Change providers', 'Manage suppliers'),
(33, 'delete_shop_providers', 'Delete suppliers', 'Manage suppliers'),
(34, 'create_shop_customers', 'Create customers', 'Creation of customers'),
(35, 'edit_shop_customers', 'Edit Customers', 'Editing the customers'),
(36, 'delete_shop_customers', 'Delete Clients', 'Removing Customers'),
(37, 'create_shop_customers_groups', 'Create groups of customers', 'Creating groups of customers'),
(38, 'edit_shop_customers_groups', 'Edit Customer Groups', 'Editing groups of customers'),
(39, 'delete_shop_customers_groups', 'Remove groups of customers', 'Removing customers groups'),
(40, 'create_shop_purchases_invoices', 'Create invoices of purchases', 'Creation of invoices of purchases'),
(41, 'edit_shop_purchases_invoices', 'Edit Purchase Invoices', 'Edit Purchase Invoices'),
(42, 'delete_shop_purchases_invoices', 'Delete invoices of purchases', 'Removal of purchase invoices'),
(43, 'create_shop_backup', 'Create & backups', 'Creating backups'),
(44, 'edit_shop_backup', 'Modify backups', 'Modification of backups'),
(45, 'delete_shop_backup', 'Remove backups', 'Deletion of backups'),
(46, 'read_shop_user_tracker', 'The users activity stream bed', 'The users activity stream bed'),
(47, 'delete_shop_user_tracker', 'Erases the users activity stream', 'Erases the users activity stream'),
(48, 'read_shop_reports', 'Reading the reports & statistics', 'Allows the reading of the reports'),
(49, 'create_shop_registers', 'Create registers', 'Provides access to the creation of registers.'),
(50, 'edit_shop_registers', 'Edit registers', 'Provides access to the registers edition.'),
(51, 'delete_shop_registers', 'Delete registers', 'Provides access to deleting registers'),
(52, 'view_shop_registers', 'Can open registers', 'Provides access to the registers list'),
(53, 'create_shop', 'Create Stores', 'This user can create store'),
(54, 'edit_shop', 'Edit Stores', 'This user may modify store'),
(55, 'delete_shop', 'Delete Stores', 'This user may delete store'),
(56, 'enter_shop', '0', '0'),
(57, 'create_coupons', 'Creation of coupon', 'Gives permission to create coupons'),
(58, 'edit_coupons', 'Edit coupons', 'Give the rights to change coupons'),
(59, 'delete_coupons', 'Deletions coupons', 'Give the rights to delete coupons'),
(60, 'create_item_stock', 'Stock management', 'Gives the ability to add an entry to the stock'),
(61, 'edit_item_stock', 'Stock Modification', 'Confers the ability to change an entry in the stock'),
(62, 'delete_item_stock', 'Stock management', 'Confers the ability to delete an entry in the stock'),
(63, 'create_taxes', 'Create taxes', 'Give the large create taxes.'),
(64, 'edit_taxes', 'Change fees', 'Gives the ability to change taxes.'),
(65, 'delete_taxes', 'Remove taxes', 'Gives the ability to remove taxes.');

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_aauth_perm_to_group`
--

CREATE TABLE `tendoo_aauth_perm_to_group` (
  `perm_id` int(11) UNSIGNED NOT NULL,
  `group_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tendoo_aauth_perm_to_group`
--

INSERT INTO `tendoo_aauth_perm_to_group` (`perm_id`, `group_id`) VALUES
(1, 4),
(2, 4),
(2, 5),
(3, 4),
(3, 5),
(4, 4),
(4, 5),
(5, 4),
(5, 5),
(6, 4),
(6, 5),
(7, 4),
(7, 5),
(8, 4),
(8, 5),
(9, 4),
(9, 5),
(10, 4),
(10, 5),
(11, 4),
(12, 4),
(13, 4),
(14, 4),
(14, 5),
(14, 6),
(14, 7),
(14, 8),
(15, 4),
(16, 4),
(16, 7),
(16, 8),
(16, 9),
(17, 4),
(17, 9),
(18, 4),
(19, 4),
(19, 9),
(20, 4),
(20, 9),
(21, 4),
(22, 4),
(22, 9),
(23, 4),
(23, 9),
(24, 4),
(25, 4),
(25, 9),
(26, 4),
(26, 9),
(27, 4),
(28, 4),
(28, 9),
(29, 4),
(29, 9),
(30, 4),
(31, 4),
(31, 9),
(32, 4),
(32, 9),
(33, 4),
(34, 4),
(34, 9),
(35, 4),
(35, 9),
(36, 4),
(37, 4),
(37, 9),
(38, 4),
(38, 9),
(39, 4),
(40, 4),
(40, 9),
(41, 4),
(41, 9),
(42, 4),
(43, 4),
(43, 9),
(44, 4),
(44, 9),
(45, 4),
(46, 4),
(46, 9),
(47, 4),
(48, 4),
(48, 9),
(49, 4),
(49, 9),
(50, 4),
(50, 9),
(51, 4),
(52, 4),
(52, 9),
(53, 4),
(53, 9),
(54, 4),
(54, 9),
(55, 4),
(56, 4),
(56, 9),
(57, 4),
(57, 9),
(58, 4),
(58, 9),
(59, 4),
(60, 4),
(60, 9),
(61, 4),
(61, 9),
(62, 4),
(63, 4),
(63, 9),
(64, 4),
(64, 9),
(65, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_aauth_perm_to_user`
--

CREATE TABLE `tendoo_aauth_perm_to_user` (
  `perm_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_aauth_pms`
--

CREATE TABLE `tendoo_aauth_pms` (
  `id` int(11) UNSIGNED NOT NULL,
  `sender_id` int(11) UNSIGNED NOT NULL,
  `receiver_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text,
  `date` datetime DEFAULT NULL,
  `read` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_aauth_system_variables`
--

CREATE TABLE `tendoo_aauth_system_variables` (
  `id` int(11) UNSIGNED NOT NULL,
  `key` varchar(100) NOT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_aauth_users`
--

CREATE TABLE `tendoo_aauth_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `banned` tinyint(1) DEFAULT '0',
  `last_login` datetime DEFAULT NULL,
  `last_activity` datetime DEFAULT NULL,
  `last_login_attempt` datetime DEFAULT NULL,
  `forgot_exp` text,
  `remember_time` datetime DEFAULT NULL,
  `remember_exp` text,
  `verification_code` text,
  `ip_address` text,
  `login_attempts` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tendoo_aauth_users`
--

INSERT INTO `tendoo_aauth_users` (`id`, `email`, `pass`, `name`, `banned`, `last_login`, `last_activity`, `last_login_attempt`, `forgot_exp`, `remember_time`, `remember_exp`, `verification_code`, `ip_address`, `login_attempts`) VALUES
(3, 'jihad@gulf-apps.om', '775536f1bb96d31de8cffa6065a4fc0a87269be214297c354b4a1b51659e766d', 'GulfApps', 0, '2017-10-19 07:49:48', '2017-10-19 07:49:48', '2017-11-18 22:00:00', NULL, '2017-10-26 00:00:00', 'katm5dp7YMJrVTHP', '', '188.161.64.174', 3),
(4, 'a@a.com', '26099512199546597858cebb4cc8d90e21f48e9be747c98d45d8a57a0f0a6e44', 'joker', 0, '2017-12-10 22:08:03', '2017-12-10 22:08:03', '2017-12-10 22:00:00', NULL, '2017-11-27 00:00:00', 'BDCFiR9cdGt37qUS', '', '::1', NULL),
(5, 'cashier@a.com', '28a9d1ac311fc87b88b094cd50b05abf517134b03d636bbc7ee94401f9952a21', 'cashier', 0, '2017-12-10 22:08:14', '2017-12-10 22:08:14', '2017-12-10 22:00:00', NULL, NULL, NULL, '', '::1', NULL),
(6, 'shoper@a.com', '3913228818759cd846b475d3106a4ecc9bf9bd91746cab4e88a8750c11d15914', 'shoper', 0, '2017-12-10 22:05:54', '2017-12-10 22:05:54', '2017-12-10 22:00:00', NULL, NULL, NULL, '', '::1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_aauth_user_to_group`
--

CREATE TABLE `tendoo_aauth_user_to_group` (
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tendoo_aauth_user_to_group`
--

INSERT INTO `tendoo_aauth_user_to_group` (`user_id`, `group_id`) VALUES
(3, 4),
(4, 4),
(5, 7),
(6, 8);

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_aauth_user_variables`
--

CREATE TABLE `tendoo_aauth_user_variables` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `key` varchar(100) NOT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_food_stock`
--

CREATE TABLE `tendoo_food_stock` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(200) NOT NULL,
  `CODE` varchar(200) NOT NULL,
  `UOM` varchar(20) NOT NULL,
  `COST` int(11) NOT NULL,
  `QTY` int(200) NOT NULL,
  `AUTHOR` int(11) DEFAULT NULL,
  `DATE_CREATION` datetime NOT NULL,
  `DATE_MOD` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tendoo_food_stock`
--

INSERT INTO `tendoo_food_stock` (`ID`, `NAME`, `CODE`, `UOM`, `COST`, `QTY`, `AUTHOR`, `DATE_CREATION`, `DATE_MOD`) VALUES
(3, 'butter1', '111111197', 'kg', 6, -552, 4, '2017-11-21 09:24:57', '2017-12-11 00:20:41'),
(5, 'cheese', '111111198', 'gram', 6, 16, 4, '2017-11-21 09:28:00', '2017-11-22 16:30:08'),
(9, 'butter1', '111111197', 'kg', 6, 1, 4, '2017-11-21 09:24:57', '2017-11-22 16:35:00'),
(10, 'asdf', 'efefe', 'wef', 0, -412, 4, '2017-11-22 02:07:54', '2017-12-11 00:20:41'),
(11, 'cheese', '117', 'liter', 4, 17, 4, '2017-11-22 11:15:21', '2017-11-22 16:46:59'),
(12, 'cabbage', '114', 'cc', 2, -9, 4, '2017-11-22 11:15:58', '2017-11-22 16:47:24'),
(13, 'cow', '1123', 'kg', 15, 11, 4, '2017-11-22 15:43:23', '2017-11-22 16:28:28'),
(14, 'qwe', 'qwe', 'wer', 11, 11, 4, '2017-11-22 17:32:19', '2017-11-22 17:32:19');

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_food_stock_history`
--

CREATE TABLE `tendoo_food_stock_history` (
  `ID` int(11) NOT NULL,
  `AUTHOR` int(11) NOT NULL,
  `STOCK_ID` int(11) DEFAULT NULL,
  `QTY` int(11) NOT NULL,
  `DATE_MOD` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tendoo_food_stock_history`
--

INSERT INTO `tendoo_food_stock_history` (`ID`, `AUTHOR`, `STOCK_ID`, `QTY`, `DATE_MOD`) VALUES
(1, 6, 10, -3, '2017-12-11 00:20:41'),
(2, 6, 3, -4, '2017-12-11 00:20:41');

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_food_stock_item`
--

CREATE TABLE `tendoo_food_stock_item` (
  `ID` int(11) NOT NULL,
  `ARTICLES_ID` int(11) NOT NULL,
  `STOCK_ID` int(11) NOT NULL,
  `QUANTITY` int(11) NOT NULL,
  `DATE_CREATION` datetime NOT NULL,
  `DATE_MOD` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tendoo_food_stock_item`
--

INSERT INTO `tendoo_food_stock_item` (`ID`, `ARTICLES_ID`, `STOCK_ID`, `QUANTITY`, `DATE_CREATION`, `DATE_MOD`) VALUES
(21, 1, 10, 3, '2017-11-22 10:46:10', NULL),
(22, 1, 3, 4, '2017-11-22 10:46:16', NULL),
(26, 2, 3, 6, '2017-11-22 11:04:57', NULL),
(28, 2, 5, 1, '2017-11-22 11:06:14', NULL),
(30, 7, 12, 1, '2017-11-22 11:46:18', NULL),
(32, 7, 3, 7, '2017-11-22 11:48:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_arrivages`
--

CREATE TABLE `tendoo_nexo_arrivages` (
  `ID` int(11) NOT NULL,
  `TITRE` varchar(200) NOT NULL,
  `DESCRIPTION` text NOT NULL,
  `VALUE` float NOT NULL,
  `ITEMS` int(11) NOT NULL,
  `REF_PROVIDERS` varchar(200) NOT NULL,
  `DATE_CREATION` datetime NOT NULL,
  `DATE_MOD` datetime NOT NULL,
  `AUTHOR` int(11) NOT NULL,
  `FOURNISSEUR_REF_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tendoo_nexo_arrivages`
--

INSERT INTO `tendoo_nexo_arrivages` (`ID`, `TITRE`, `DESCRIPTION`, `VALUE`, `ITEMS`, `REF_PROVIDERS`, `DATE_CREATION`, `DATE_MOD`, `AUTHOR`, `FOURNISSEUR_REF_ID`) VALUES
(1, 'test', 'test', 1006, 503, '1', '2017-10-12 16:40:08', '0000-00-00 00:00:00', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_articles`
--

CREATE TABLE `tendoo_nexo_articles` (
  `ID` int(11) NOT NULL,
  `DESIGN` varchar(200) NOT NULL,
  `DESIGN_AR` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `REF_RAYON` int(11) NOT NULL,
  `REF_SHIPPING` int(11) NOT NULL,
  `REF_CATEGORIE` int(11) NOT NULL,
  `REF_PROVIDER` int(11) NOT NULL,
  `REF_TAXE` int(11) NOT NULL,
  `QUANTITY` int(11) NOT NULL,
  `SKU` varchar(220) NOT NULL,
  `QUANTITE_RESTANTE` int(11) NOT NULL,
  `QUANTITE_VENDU` int(11) NOT NULL,
  `DEFECTUEUX` int(11) NOT NULL,
  `PRIX_DACHAT` float NOT NULL,
  `FRAIS_ACCESSOIRE` float NOT NULL,
  `COUT_DACHAT` float NOT NULL,
  `TAUX_DE_MARGE` float NOT NULL,
  `PRIX_DE_VENTE` float NOT NULL,
  `PRIX_DE_VENTE_TTC` float NOT NULL,
  `SHADOW_PRICE` float NOT NULL,
  `TAILLE` varchar(200) NOT NULL,
  `POIDS` varchar(200) NOT NULL,
  `COULEUR` varchar(200) NOT NULL,
  `HAUTEUR` varchar(200) NOT NULL,
  `LARGEUR` varchar(200) NOT NULL,
  `PRIX_PROMOTIONEL` float NOT NULL,
  `SPECIAL_PRICE_START_DATE` datetime NOT NULL,
  `SPECIAL_PRICE_END_DATE` datetime NOT NULL,
  `DESCRIPTION` text NOT NULL,
  `APERCU` varchar(200) NOT NULL,
  `CODEBAR` varchar(200) NOT NULL,
  `DATE_CREATION` datetime NOT NULL,
  `DATE_MOD` datetime NOT NULL,
  `AUTHOR` int(11) NOT NULL,
  `TYPE` int(11) NOT NULL,
  `STATUS` int(11) NOT NULL,
  `STOCK_ENABLED` int(11) NOT NULL,
  `AUTO_BARCODE` int(11) NOT NULL,
  `BARCODE_TYPE` varchar(200) NOT NULL,
  `REF_MODIFIERS_GROUP` int(11) NOT NULL,
  `USE_VARIATION` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tendoo_nexo_articles`
--

INSERT INTO `tendoo_nexo_articles` (`ID`, `DESIGN`, `DESIGN_AR`, `REF_RAYON`, `REF_SHIPPING`, `REF_CATEGORIE`, `REF_PROVIDER`, `REF_TAXE`, `QUANTITY`, `SKU`, `QUANTITE_RESTANTE`, `QUANTITE_VENDU`, `DEFECTUEUX`, `PRIX_DACHAT`, `FRAIS_ACCESSOIRE`, `COUT_DACHAT`, `TAUX_DE_MARGE`, `PRIX_DE_VENTE`, `PRIX_DE_VENTE_TTC`, `SHADOW_PRICE`, `TAILLE`, `POIDS`, `COULEUR`, `HAUTEUR`, `LARGEUR`, `PRIX_PROMOTIONEL`, `SPECIAL_PRICE_START_DATE`, `SPECIAL_PRICE_END_DATE`, `DESCRIPTION`, `APERCU`, `CODEBAR`, `DATE_CREATION`, `DATE_MOD`, `AUTHOR`, `TYPE`, `STATUS`, `STOCK_ENABLED`, `AUTO_BARCODE`, `BARCODE_TYPE`, `REF_MODIFIERS_GROUP`, `USE_VARIATION`) VALUES
(1, 'Test Item', 'تجربة', 0, 0, 1, 0, 0, 0, '50', 361, 142, 0, 2, 0, 0, 0, 50, 50, 0, '', '', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '211802', '2017-10-12 16:34:33', '2017-11-22 10:48:28', 4, 1, 1, 1, 1, '', 0, 0),
(2, 'Test 2', 'تحربة ٢', 0, 0, 1, 0, 0, 0, '200', 0, 0, 0, 0, 0, 0, 0, 25, 25, 0, '', '', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '821981', '2017-10-13 07:45:43', '2017-11-22 11:06:36', 4, 1, 1, 1, 1, '', 0, 0),
(3, 'Pizza', 'بيتزا', 0, 0, 3, 0, 0, 0, '001', 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, '', '', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '155760', '2017-10-15 19:31:57', '2017-10-15 19:34:20', 3, 2, 1, 1, 0, '', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_articles_meta`
--

CREATE TABLE `tendoo_nexo_articles_meta` (
  `ID` int(11) NOT NULL,
  `REF_ARTICLE` int(11) NOT NULL,
  `KEY` varchar(250) NOT NULL,
  `VALUE` text NOT NULL,
  `DATE_CREATION` datetime NOT NULL,
  `DATE_MOD` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_articles_stock_flow`
--

CREATE TABLE `tendoo_nexo_articles_stock_flow` (
  `ID` int(11) NOT NULL,
  `REF_ARTICLE_BARCODE` varchar(250) NOT NULL,
  `BEFORE_QUANTITE` int(11) NOT NULL,
  `QUANTITE` int(11) NOT NULL,
  `AFTER_QUANTITE` int(11) NOT NULL,
  `DATE_CREATION` datetime NOT NULL,
  `AUTHOR` int(11) NOT NULL,
  `REF_COMMAND_CODE` varchar(11) NOT NULL,
  `REF_SHIPPING` int(11) NOT NULL,
  `TYPE` varchar(200) NOT NULL,
  `UNIT_PRICE` float NOT NULL,
  `TOTAL_PRICE` float NOT NULL,
  `REF_PROVIDER` int(11) NOT NULL,
  `DESCRIPTION` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tendoo_nexo_articles_stock_flow`
--

INSERT INTO `tendoo_nexo_articles_stock_flow` (`ID`, `REF_ARTICLE_BARCODE`, `BEFORE_QUANTITE`, `QUANTITE`, `AFTER_QUANTITE`, `DATE_CREATION`, `AUTHOR`, `REF_COMMAND_CODE`, `REF_SHIPPING`, `TYPE`, `UNIT_PRICE`, `TOTAL_PRICE`, `REF_PROVIDER`, `DESCRIPTION`) VALUES
(102, '211802', 0, 1, 0, '2017-11-24 13:06:19', 4, '8KSHKB', 0, 'sale', 50, 50, 0, ''),
(103, '211802', 0, 1, 0, '2017-11-24 13:11:38', 4, 'TIOCWS', 0, 'sale', 50, 50, 0, ''),
(104, '211802', 0, 1, 0, '2017-11-24 13:15:19', 4, 'RG2BHT', 0, 'sale', 50, 50, 0, ''),
(105, '211802', 0, 1, 0, '2017-11-24 13:30:38', 4, '4UTLTD', 0, 'sale', 50, 50, 0, ''),
(106, '211802', 0, 1, 0, '2017-11-24 15:01:01', 4, 'I9ROO9', 0, 'sale', 50, 50, 0, ''),
(107, '211802', 0, 1, 0, '2017-11-24 15:03:57', 4, 'YANTQV', 0, 'sale', 50, 50, 0, ''),
(108, '211802', 0, 1, 0, '2017-11-24 15:10:28', 4, 'P0EAYK', 0, 'sale', 50, 50, 0, ''),
(109, '211802', 0, 1, 0, '2017-11-24 15:14:51', 4, 'NSUUFB', 0, 'sale', 50, 50, 0, ''),
(110, 'ycdllh-barcode-155760', 0, 1, 0, '2017-11-24 15:27:44', 4, 'CXMQ4M', 0, 'sale', 2.2, 2.2, 0, ''),
(111, '23z81t-barcode-155760', 0, 1, 0, '2017-11-24 15:27:44', 4, 'CXMQ4M', 0, 'sale', 2.2, 2.2, 0, ''),
(112, '211802', 0, 1, 0, '2017-11-24 15:27:44', 4, 'CXMQ4M', 0, 'sale', 50, 50, 0, ''),
(113, '211802', 0, 1, 0, '2017-11-24 15:27:45', 4, 'CXMQ4M', 0, 'sale', 50, 50, 0, ''),
(114, '211802', 0, 1, 0, '2017-11-24 15:58:45', 4, 'LEU55R', 0, 'sale', 50, 50, 0, ''),
(115, 'bec4u-barcode-155760', 0, 1, 0, '2017-11-24 15:58:46', 4, 'LEU55R', 0, 'sale', 2, 2, 0, ''),
(116, 'muhnth-barcode-155760', 0, 1, 0, '2017-11-24 15:58:46', 4, 'LEU55R', 0, 'sale', 2.2, 2.2, 0, ''),
(117, '211802', 0, 1, 0, '2017-11-24 15:58:46', 4, 'LEU55R', 0, 'sale', 50, 50, 0, ''),
(118, '211802', 0, 2, 0, '2017-11-24 16:22:39', 4, 'BVEKLH', 0, 'sale', 50, 100, 0, ''),
(119, '93x0ii-barcode-155760', 0, 5, 0, '2017-11-24 16:22:39', 4, 'BVEKLH', 0, 'sale', 2.2, 11, 0, ''),
(120, 'i8m4uy-barcode-155760', 0, 7, 0, '2017-11-24 16:22:39', 4, 'BVEKLH', 0, 'sale', 2.2, 15.4, 0, ''),
(121, '211802', 0, 15, 0, '2017-11-24 16:22:39', 4, 'BVEKLH', 0, 'sale', 50, 750, 0, ''),
(122, '6a6f9d-barcode-155760', 0, 1, 0, '2017-11-24 17:31:25', 4, '0C2GAA', 0, 'sale', 2.2, 2.2, 0, ''),
(123, '211802', 0, 1, 0, '2017-11-24 17:31:25', 4, '0C2GAA', 0, 'sale', 50, 50, 0, ''),
(124, '211802', 0, 1, 0, '2017-11-24 17:31:25', 4, '0C2GAA', 0, 'sale', 50, 50, 0, ''),
(125, 'vq8q0p-barcode-155760', 0, 19, 0, '2017-11-24 17:37:09', 4, '4CGOZ7', 0, 'sale', 2.2, 41.8, 0, ''),
(126, '211802', 0, 13, 0, '2017-11-24 17:37:09', 4, '4CGOZ7', 0, 'sale', 50, 650, 0, ''),
(127, '211802', 0, 12, 0, '2017-11-24 17:37:10', 4, '4CGOZ7', 0, 'sale', 50, 600, 0, ''),
(128, 'zvks9-barcode-155760', 0, 1, 0, '2017-11-24 17:40:22', 4, 'TXDJ3V', 0, 'sale', 2.2, 2.2, 0, ''),
(129, '211802', 0, 1, 0, '2017-11-24 17:40:22', 4, 'TXDJ3V', 0, 'sale', 50, 50, 0, ''),
(130, '211802', 0, 1, 0, '2017-11-24 17:43:09', 4, 'YJESE4', 0, 'sale', 50, 50, 0, ''),
(131, '211802', 0, 1, 0, '2017-11-24 17:45:22', 4, 'FH0VL6', 0, 'sale', 50, 50, 0, ''),
(132, '211802', 0, 1, 0, '2017-11-24 17:51:23', 4, 'NSMNO2', 0, 'sale', 50, 50, 0, ''),
(133, '211802', 0, 1, 0, '2017-11-24 17:54:38', 4, '1ABMDX', 0, 'sale', 50, 50, 0, ''),
(134, '211802', 0, 1, 0, '2017-11-24 17:57:41', 4, 'IBZ5ZK', 0, 'sale', 50, 50, 0, ''),
(135, '211802', 0, 1, 0, '2017-11-24 18:00:56', 4, 'CC47P0', 0, 'sale', 50, 50, 0, ''),
(136, '211802', 0, 4, 0, '2017-11-24 18:07:34', 4, 'GEZOQO', 0, 'sale', 50, 200, 0, ''),
(137, 'z21eb-barcode-155760', 0, 18, 0, '2017-11-24 18:12:20', 4, '6GSGVS', 0, 'sale', 2.2, 39.6, 0, ''),
(138, '211802', 0, 15, 0, '2017-11-24 18:12:20', 4, '6GSGVS', 0, 'sale', 50, 750, 0, ''),
(139, '211802', 0, 13, 0, '2017-11-24 18:12:20', 4, '6GSGVS', 0, 'sale', 50, 650, 0, ''),
(140, 'o1hmat-barcode-155760', 0, 1, 0, '2017-11-24 18:14:09', 4, 'PY9YV5', 0, 'sale', 2.2, 2.2, 0, ''),
(141, '211802', 0, 12, 0, '2017-11-24 18:14:09', 4, 'PY9YV5', 0, 'sale', 50, 600, 0, ''),
(142, '211802', 0, 13, 0, '2017-11-24 18:14:09', 4, 'PY9YV5', 0, 'sale', 50, 650, 0, ''),
(143, '211802', 0, 1, 0, '2017-11-25 03:13:09', 4, 'GBM2ZF', 0, 'sale', 50, 50, 0, ''),
(144, '211802', 0, 1, 0, '2017-11-25 03:46:32', 4, 'NH6X0C', 0, 'sale', 50, 50, 0, ''),
(145, '211802', 0, 3, 0, '2017-11-25 03:48:46', 4, 'PQ2SXH', 0, 'sale', 50, 150, 0, ''),
(146, '211802', 0, 1, 0, '2017-11-25 04:08:14', 4, 'ZBY1JB', 0, 'sale', 50, 50, 0, ''),
(147, '211802', 0, 1, 0, '2017-11-25 04:14:39', 4, 'SKTA9E', 0, 'sale', 50, 50, 0, ''),
(148, '211802', 0, 1, 0, '2017-11-25 04:14:39', 4, 'SKTA9E', 0, 'sale', 50, 50, 0, ''),
(149, '211802', 0, 1, 0, '2017-11-25 06:05:03', 4, '12DQZN', 0, 'sale', 50, 50, 0, ''),
(150, '211802', 0, 1, 0, '2017-11-25 06:11:34', 4, 'WOHYIO', 0, 'sale', 50, 50, 0, ''),
(151, '211802', 0, 1, 0, '2017-11-25 06:15:42', 4, '719L3I', 0, 'sale', 50, 50, 0, ''),
(152, '211802', 0, 1, 0, '2017-11-25 06:22:46', 4, 'BJPKRR', 0, 'sale', 50, 50, 0, ''),
(153, '211802', 0, 1, 0, '2017-11-25 06:27:50', 4, 'UV870G', 0, 'sale', 50, 50, 0, ''),
(154, '211802', 0, 1, 0, '2017-11-25 06:54:27', 4, 'VLKR9W', 0, 'sale', 50, 50, 0, ''),
(155, '211802', 0, 1, 0, '2017-11-25 06:59:56', 4, 'WNDPV0', 0, 'sale', 50, 50, 0, ''),
(156, '211802', 0, 1, 0, '2017-11-25 07:04:43', 4, 'PC226T', 0, 'sale', 50, 50, 0, ''),
(157, '211802', 0, 1, 0, '2017-11-25 07:12:59', 4, 'P3QVPT', 0, 'sale', 50, 50, 0, ''),
(158, '211802', 0, 1, 0, '2017-11-25 07:20:53', 4, 'U07L5Q', 0, 'sale', 50, 50, 0, ''),
(159, '211802', 0, 1, 0, '2017-11-25 07:25:38', 4, '1VA0SY', 0, 'sale', 50, 50, 0, ''),
(160, '211802', 0, 1, 0, '2017-11-25 07:28:18', 4, 'O3YSXZ', 0, 'sale', 50, 50, 0, ''),
(161, '211802', 0, 1, 0, '2017-11-25 07:36:15', 4, '38JLW4', 0, 'sale', 50, 50, 0, ''),
(162, '211802', 0, 1, 0, '2017-11-25 07:38:59', 4, 'XBO3R3', 0, 'sale', 50, 50, 0, ''),
(163, '211802', 0, 1, 0, '2017-11-25 08:20:02', 4, 'LWFNFX', 0, 'sale', 50, 50, 0, ''),
(164, '211802', 0, 1, 0, '2017-11-25 08:26:01', 4, 'HOHJMB', 0, 'sale', 50, 50, 0, ''),
(165, '211802', 0, 1, 0, '2017-11-25 08:29:17', 4, '445HI7', 0, 'sale', 50, 50, 0, ''),
(166, '211802', 0, 1, 0, '2017-11-25 09:28:29', 4, '76BQQX', 0, 'sale', 50, 50, 0, ''),
(167, '211802', 0, 1, 0, '2017-11-26 13:33:01', 4, '2BVIFJ', 0, 'sale', 50, 50, 0, ''),
(168, '211802', 0, 1, 0, '2017-11-26 13:34:11', 4, 'JK38NY', 0, 'sale', 50, 50, 0, ''),
(169, '211802', 0, 1, 0, '2017-11-26 13:34:48', 4, 'PH1GA3', 0, 'sale', 50, 50, 0, ''),
(170, '211802', 0, 1, 0, '2017-11-26 13:36:11', 4, 'C6TD6T', 0, 'sale', 50, 50, 0, ''),
(171, '211802', 0, 1, 0, '2017-11-26 13:36:12', 4, 'C6TD6T', 0, 'sale', 50, 50, 0, ''),
(172, '211802', 0, 1, 0, '2017-11-26 13:40:28', 4, 'QLR1DX', 0, 'sale', 50, 50, 0, ''),
(173, '211802', 0, 1, 0, '2017-11-26 13:40:51', 4, 'TD0PFE', 0, 'sale', 50, 50, 0, ''),
(174, '211802', 0, 1, 0, '2017-11-26 13:40:52', 4, 'TD0PFE', 0, 'sale', 50, 50, 0, ''),
(175, 'yorr7-barcode-155760', 0, 1, 0, '2017-11-28 14:34:15', 4, 'KJGUZO', 0, 'sale', 2.2, 2.2, 0, ''),
(176, '211802', 0, 1, 0, '2017-11-28 14:34:16', 4, 'KJGUZO', 0, 'sale', 50, 50, 0, ''),
(177, '211802', 0, 1, 0, '2017-11-28 14:34:52', 4, '5G7RXI', 0, 'sale', 50, 50, 0, ''),
(178, '4s8fy8-barcode-155760', 0, 1, 0, '2017-11-28 14:34:52', 4, '5G7RXI', 0, 'sale', 2.2, 2.2, 0, ''),
(179, '211802', 0, 1, 0, '2017-11-28 14:34:52', 4, '5G7RXI', 0, 'sale', 50, 50, 0, ''),
(180, '211802', 0, 1, 0, '2017-11-28 14:36:05', 4, '1FDDBK', 0, 'sale', 50, 50, 0, ''),
(181, '211802', 0, 1, 0, '2017-11-28 14:36:06', 4, '1FDDBK', 0, 'sale', 50, 50, 0, ''),
(182, '211802', 0, 1, 0, '2017-11-28 14:36:30', 4, 'S8NJM0', 0, 'sale', 50, 50, 0, ''),
(183, '211802', 0, 1, 0, '2017-11-28 14:36:30', 4, 'S8NJM0', 0, 'sale', 50, 50, 0, ''),
(184, '211802', 0, 1, 0, '2017-11-28 14:36:59', 4, '81U2FC', 0, 'sale', 50, 50, 0, ''),
(185, '211802', 0, 1, 0, '2017-11-28 14:36:59', 4, '81U2FC', 0, 'sale', 50, 50, 0, ''),
(186, '211802', 0, 1, 0, '2017-11-28 14:37:55', 4, 'NX36SY', 0, 'sale', 50, 50, 0, ''),
(187, '211802', 0, 1, 0, '2017-11-28 14:37:55', 4, 'NX36SY', 0, 'sale', 50, 50, 0, ''),
(188, '211802', 0, 1, 0, '2017-11-28 14:38:44', 4, 'Y4OJSA', 0, 'sale', 50, 50, 0, ''),
(189, '211802', 0, 1, 0, '2017-11-28 14:38:44', 4, 'Y4OJSA', 0, 'sale', 50, 50, 0, ''),
(190, '211802', 0, 1, 0, '2017-11-28 14:39:05', 4, '4FMALO', 0, 'sale', 50, 50, 0, ''),
(191, '211802', 0, 1, 0, '2017-11-28 14:39:06', 4, '4FMALO', 0, 'sale', 50, 50, 0, ''),
(192, '211802', 0, 1, 0, '2017-11-28 14:39:30', 4, '6GA7OH', 0, 'sale', 50, 50, 0, ''),
(193, '211802', 0, 1, 0, '2017-11-28 14:39:31', 4, '6GA7OH', 0, 'sale', 50, 50, 0, ''),
(194, '211802', 0, 1, 0, '2017-11-28 14:54:42', 4, 'YXDFQ1', 0, 'sale', 50, 50, 0, ''),
(195, '211802', 0, 1, 0, '2017-11-28 14:54:42', 4, 'YXDFQ1', 0, 'sale', 50, 50, 0, ''),
(196, '211802', 0, 1, 0, '2017-11-28 14:57:55', 4, 'KKV1WP', 0, 'sale', 50, 50, 0, ''),
(197, '211802', 0, 1, 0, '2017-11-28 14:57:55', 4, 'KKV1WP', 0, 'sale', 50, 50, 0, ''),
(198, '211802', 0, 1, 0, '2017-11-28 14:58:35', 4, '38UJ5H', 0, 'sale', 50, 50, 0, ''),
(199, '211802', 0, 1, 0, '2017-11-28 14:58:36', 4, '38UJ5H', 0, 'sale', 50, 50, 0, ''),
(200, '211802', 0, 1, 0, '2017-11-28 14:58:36', 4, '38UJ5H', 0, 'sale', 50, 50, 0, ''),
(201, '211802', 0, 1, 0, '2017-11-28 14:58:54', 4, '4CVZ2X', 0, 'sale', 50, 50, 0, ''),
(202, '211802', 0, 1, 0, '2017-11-28 14:58:54', 4, '4CVZ2X', 0, 'sale', 50, 50, 0, ''),
(203, '211802', 0, 1, 0, '2017-11-28 14:58:55', 4, '4CVZ2X', 0, 'sale', 50, 50, 0, ''),
(204, '211802', 0, 1, 0, '2017-11-28 15:01:12', 4, 'G261KJ', 0, 'sale', 50, 50, 0, ''),
(205, '211802', 0, 1, 0, '2017-11-28 15:01:12', 4, 'G261KJ', 0, 'sale', 50, 50, 0, ''),
(206, '211802', 0, 1, 0, '2017-11-28 15:02:13', 4, 'CVV3TQ', 0, 'sale', 50, 50, 0, ''),
(207, '211802', 0, 1, 0, '2017-11-28 15:02:14', 4, 'CVV3TQ', 0, 'sale', 50, 50, 0, ''),
(208, '211802', 0, 1, 0, '2017-11-28 15:02:14', 4, 'CVV3TQ', 0, 'sale', 50, 50, 0, ''),
(209, '211802', 0, 1, 0, '2017-11-28 15:02:30', 4, 'F97T5S', 0, 'sale', 50, 50, 0, ''),
(210, '211802', 0, 1, 0, '2017-11-28 15:05:25', 4, 'QGO70J', 0, 'sale', 50, 50, 0, ''),
(211, '211802', 0, 1, 0, '2017-11-28 15:05:26', 4, 'QGO70J', 0, 'sale', 50, 50, 0, ''),
(212, '211802', 0, 1, 0, '2017-11-28 15:05:44', 4, 'J95KK2', 0, 'sale', 50, 50, 0, ''),
(213, '211802', 0, 1, 0, '2017-11-28 15:06:51', 4, 'CFUMEG', 0, 'sale', 50, 50, 0, ''),
(214, '211802', 0, 1, 0, '2017-11-28 15:06:51', 4, 'CFUMEG', 0, 'sale', 50, 50, 0, ''),
(215, '211802', 0, 1, 0, '2017-11-28 15:08:25', 4, '3881CJ', 0, 'sale', 50, 50, 0, ''),
(216, '211802', 0, 1, 0, '2017-11-28 15:08:25', 4, '3881CJ', 0, 'sale', 50, 50, 0, ''),
(217, '211802', 0, 1, 0, '2017-11-28 15:08:41', 4, 'U31US2', 0, 'sale', 50, 50, 0, ''),
(218, '211802', 0, 1, 0, '2017-11-28 15:08:42', 4, 'U31US2', 0, 'sale', 50, 50, 0, ''),
(219, '211802', 0, 1, 0, '2017-11-28 15:09:11', 4, 'UMWE98', 0, 'sale', 50, 50, 0, ''),
(220, '211802', 0, 1, 0, '2017-11-28 15:09:12', 4, 'UMWE98', 0, 'sale', 50, 50, 0, ''),
(221, '211802', 0, 1, 0, '2017-11-28 15:09:42', 4, 'M68V9P', 0, 'sale', 50, 50, 0, ''),
(222, '211802', 0, 1, 0, '2017-11-28 15:09:43', 4, 'M68V9P', 0, 'sale', 50, 50, 0, ''),
(223, '211802', 0, 1, 0, '2017-11-28 15:09:43', 4, 'M68V9P', 0, 'sale', 50, 50, 0, ''),
(224, '211802', 0, 1, 0, '2017-11-28 15:09:43', 4, 'M68V9P', 0, 'sale', 50, 50, 0, ''),
(225, '211802', 0, 1, 0, '2017-11-28 15:10:48', 4, '9Z3N8R', 0, 'sale', 50, 50, 0, ''),
(226, '211802', 0, 1, 0, '2017-11-28 15:10:49', 4, '9Z3N8R', 0, 'sale', 50, 50, 0, ''),
(227, '211802', 0, 1, 0, '2017-11-28 15:13:21', 4, 'QX8956', 0, 'sale', 50, 50, 0, ''),
(228, '211802', 0, 1, 0, '2017-11-28 15:19:18', 4, 'HL5YU1', 0, 'sale', 50, 50, 0, ''),
(229, '211802', 0, 1, 0, '2017-11-28 15:19:18', 4, 'HL5YU1', 0, 'sale', 50, 50, 0, ''),
(230, '211802', 0, 1, 0, '2017-11-28 15:20:12', 4, 'QPICWO', 0, 'sale', 50, 50, 0, ''),
(231, '211802', 0, 1, 0, '2017-11-28 15:20:12', 4, 'QPICWO', 0, 'sale', 50, 50, 0, ''),
(232, '211802', 0, 1, 0, '2017-11-28 15:23:04', 4, 'RBXT11', 0, 'sale', 50, 50, 0, ''),
(233, '211802', 0, 1, 0, '2017-11-28 15:23:18', 4, 'T8JZ77', 0, 'sale', 50, 50, 0, ''),
(234, '211802', 0, 1, 0, '2017-11-28 15:25:30', 4, 'H9RAZH', 0, 'sale', 50, 50, 0, ''),
(235, '211802', 0, 1, 0, '2017-11-28 15:25:30', 4, 'H9RAZH', 0, 'sale', 50, 50, 0, ''),
(236, '211802', 0, 1, 0, '2017-11-28 15:26:50', 4, '1F6VAB', 0, 'sale', 50, 50, 0, ''),
(237, '211802', 0, 1, 0, '2017-11-28 15:26:51', 4, '1F6VAB', 0, 'sale', 50, 50, 0, ''),
(238, '211802', 0, 1, 0, '2017-11-28 15:26:51', 4, '1F6VAB', 0, 'sale', 50, 50, 0, ''),
(239, '211802', 0, 1, 0, '2017-11-28 15:26:51', 4, '1F6VAB', 0, 'sale', 50, 50, 0, ''),
(240, '211802', 0, 1, 0, '2017-11-28 15:27:58', 4, '5XN2K0', 0, 'sale', 50, 50, 0, ''),
(241, '211802', 0, 1, 0, '2017-11-28 15:27:58', 4, '5XN2K0', 0, 'sale', 50, 50, 0, ''),
(242, '211802', 0, 1, 0, '2017-11-28 15:29:01', 4, 'BEK2BZ', 0, 'sale', 50, 50, 0, ''),
(243, '211802', 0, 1, 0, '2017-11-28 15:29:01', 4, 'BEK2BZ', 0, 'sale', 50, 50, 0, ''),
(244, '211802', 0, 1, 0, '2017-11-28 15:29:43', 4, 'VUP846', 0, 'sale', 50, 50, 0, ''),
(245, '211802', 0, 1, 0, '2017-11-28 15:29:43', 4, 'VUP846', 0, 'sale', 50, 50, 0, ''),
(246, '211802', 0, 1, 0, '2017-11-28 15:30:22', 4, 'DCDUX5', 0, 'sale', 50, 50, 0, ''),
(247, '211802', 0, 1, 0, '2017-11-28 15:30:22', 4, 'DCDUX5', 0, 'sale', 50, 50, 0, ''),
(248, '211802', 0, 1, 0, '2017-11-28 15:31:17', 4, 'IZB55U', 0, 'sale', 50, 50, 0, ''),
(249, '211802', 0, 1, 0, '2017-11-28 15:31:17', 4, 'IZB55U', 0, 'sale', 50, 50, 0, ''),
(250, '211802', 0, 1, 0, '2017-11-28 15:32:27', 4, 'X6IIVK', 0, 'sale', 50, 50, 0, ''),
(251, '211802', 0, 1, 0, '2017-11-28 15:32:27', 4, 'X6IIVK', 0, 'sale', 50, 50, 0, ''),
(252, '211802', 0, 1, 0, '2017-11-28 15:39:42', 4, '5TZW86', 0, 'sale', 50, 50, 0, ''),
(253, '211802', 0, 1, 0, '2017-11-28 15:39:43', 4, '5TZW86', 0, 'sale', 50, 50, 0, ''),
(254, '211802', 0, 1, 0, '2017-11-28 15:42:04', 4, '8BV0VT', 0, 'sale', 50, 50, 0, ''),
(255, '211802', 0, 1, 0, '2017-11-28 15:42:05', 4, '8BV0VT', 0, 'sale', 50, 50, 0, ''),
(256, '211802', 0, 1, 0, '2017-11-28 15:42:45', 4, 'MVPXYB', 0, 'sale', 50, 50, 0, ''),
(257, '211802', 0, 1, 0, '2017-11-28 15:42:45', 4, 'MVPXYB', 0, 'sale', 50, 50, 0, ''),
(258, '211802', 0, 1, 0, '2017-11-28 15:44:31', 4, 'TSXOOY', 0, 'sale', 50, 50, 0, ''),
(259, '211802', 0, 1, 0, '2017-11-28 15:44:31', 4, 'TSXOOY', 0, 'sale', 50, 50, 0, ''),
(260, '211802', 0, 1, 0, '2017-11-28 15:45:23', 4, '622HR1', 0, 'sale', 50, 50, 0, ''),
(261, '211802', 0, 1, 0, '2017-11-28 15:45:23', 4, '622HR1', 0, 'sale', 50, 50, 0, ''),
(262, '211802', 0, 1, 0, '2017-11-28 15:46:19', 4, 'L9SE84', 0, 'sale', 50, 50, 0, ''),
(263, '211802', 0, 1, 0, '2017-11-28 15:48:10', 4, 'OGJCRN', 0, 'sale', 50, 50, 0, ''),
(264, '211802', 0, 1, 0, '2017-11-28 15:49:42', 4, 'S3KTOD', 0, 'sale', 50, 50, 0, ''),
(265, '211802', 0, 1, 0, '2017-11-28 15:49:43', 4, 'S3KTOD', 0, 'sale', 50, 50, 0, ''),
(266, '211802', 0, 1, 0, '2017-11-28 15:50:38', 4, 'V6GSVK', 0, 'sale', 50, 50, 0, ''),
(267, '211802', 0, 1, 0, '2017-11-28 15:50:39', 4, 'V6GSVK', 0, 'sale', 50, 50, 0, ''),
(268, '211802', 0, 1, 0, '2017-11-28 15:52:07', 4, '7VA4JH', 0, 'sale', 50, 50, 0, ''),
(269, '211802', 0, 1, 0, '2017-11-28 15:52:08', 4, '7VA4JH', 0, 'sale', 50, 50, 0, ''),
(270, '211802', 0, 1, 0, '2017-11-28 15:54:45', 4, 'VZA42F', 0, 'sale', 50, 50, 0, ''),
(271, '211802', 0, 1, 0, '2017-11-28 15:54:45', 4, 'VZA42F', 0, 'sale', 50, 50, 0, ''),
(272, '211802', 0, 1, 0, '2017-11-28 15:55:23', 4, 'NOR3HN', 0, 'sale', 50, 50, 0, ''),
(273, '211802', 0, 1, 0, '2017-11-28 15:55:23', 4, 'NOR3HN', 0, 'sale', 50, 50, 0, ''),
(274, '211802', 0, 1, 0, '2017-11-28 15:58:05', 4, 'G61616', 0, 'sale', 50, 50, 0, ''),
(275, '211802', 0, 1, 0, '2017-11-28 15:58:05', 4, 'G61616', 0, 'sale', 50, 50, 0, ''),
(276, '211802', 0, 1, 0, '2017-11-28 15:58:38', 4, 'KHQTZ0', 0, 'sale', 50, 50, 0, ''),
(277, '211802', 0, 1, 0, '2017-11-28 15:58:39', 4, 'KHQTZ0', 0, 'sale', 50, 50, 0, ''),
(278, '211802', 0, 1, 0, '2017-11-28 16:00:48', 4, '2TRZY2', 0, 'sale', 50, 50, 0, ''),
(279, '211802', 0, 1, 0, '2017-11-28 16:00:48', 4, '2TRZY2', 0, 'sale', 50, 50, 0, ''),
(280, '211802', 0, 1, 0, '2017-11-28 16:01:38', 4, 'DYW963', 0, 'sale', 50, 50, 0, ''),
(281, '211802', 0, 1, 0, '2017-12-09 21:56:18', 4, 'UC541X', 0, 'sale', 50, 50, 0, ''),
(282, '211802', 0, 1, 0, '2017-12-09 21:56:18', 4, 'UC541X', 0, 'sale', 50, 50, 0, ''),
(283, '211802', 0, 1, 0, '2017-12-09 21:56:19', 4, 'UC541X', 0, 'sale', 50, 50, 0, ''),
(284, '211802', 0, 1, 0, '2017-12-09 22:04:02', 4, 'R7CE8B', 0, 'sale', 50, 50, 0, ''),
(285, '211802', 0, 1, 0, '2017-12-09 22:37:29', 4, 'AWQMAL', 0, 'sale', 50, 50, 0, ''),
(286, '211802', 0, 1, 0, '2017-12-09 22:39:10', 4, 'RHSUCY', 0, 'sale', 50, 50, 0, ''),
(287, '211802', 0, 1, 0, '2017-12-09 22:39:53', 4, 'XQ3F4J', 0, 'sale', 50, 50, 0, ''),
(288, '211802', 0, 1, 0, '2017-12-09 22:45:05', 4, 'BS29DA', 0, 'sale', 50, 50, 0, ''),
(289, '211802', 0, 1, 0, '2017-12-09 22:46:21', 4, 'YZSAVX', 0, 'sale', 50, 50, 0, ''),
(290, '211802', 0, 1, 0, '2017-12-09 22:50:49', 4, 'HBW8C3', 0, 'sale', 50, 50, 0, ''),
(291, '211802', 0, 1, 0, '2017-12-09 22:56:10', 4, 'A2TUCR', 0, 'sale', 50, 50, 0, ''),
(292, '211802', 0, 1, 0, '2017-12-09 22:58:57', 4, '0SDFUE', 0, 'sale', 50, 50, 0, ''),
(293, '211802', 0, 1, 0, '2017-12-09 23:04:45', 4, '39V0A0', 0, 'sale', 50, 50, 0, ''),
(294, '211802', 0, 1, 0, '2017-12-09 23:11:58', 4, 'DOKS60', 0, 'sale', 50, 50, 0, ''),
(295, '211802', 0, 1, 0, '2017-12-09 23:14:03', 4, 'Z0IUQ2', 0, 'sale', 50, 50, 0, ''),
(296, '211802', 0, 1, 0, '2017-12-09 23:18:17', 4, '6WW3IY', 0, 'sale', 50, 50, 0, ''),
(297, '211802', 0, 1, 0, '2017-12-10 00:45:26', 4, 'FLZNF8', 0, 'sale', 50, 50, 0, ''),
(298, '211802', 0, 1, 0, '2017-12-10 01:06:41', 4, 'PPNEF0', 0, 'sale', 50, 50, 0, ''),
(299, '211802', 0, 1, 0, '2017-12-10 01:07:44', 4, 'EEE0BJ', 0, 'sale', 50, 50, 0, ''),
(300, '211802', 0, 1, 0, '2017-12-10 01:10:55', 4, 'R1HWSV', 0, 'sale', 50, 50, 0, ''),
(301, '211802', 0, 1, 0, '2017-12-10 01:20:02', 4, 'FU73D4', 0, 'sale', 50, 50, 0, ''),
(302, '211802', 0, 1, 0, '2017-12-10 01:23:31', 4, '90W47H', 0, 'sale', 50, 50, 0, ''),
(303, '211802', 0, 1, 0, '2017-12-10 01:27:59', 4, '98X6TO', 0, 'sale', 50, 50, 0, ''),
(304, '211802', 0, 1, 0, '2017-12-10 01:29:16', 4, '6DCPEH', 0, 'sale', 50, 50, 0, ''),
(305, '211802', 0, 1, 0, '2017-12-10 01:36:34', 4, '1QMLX1', 0, 'sale', 50, 50, 0, ''),
(306, '211802', 0, 1, 0, '2017-12-10 01:44:14', 4, '5ATEIN', 0, 'sale', 50, 50, 0, ''),
(307, '211802', 0, 1, 0, '2017-12-10 01:46:17', 4, 'R7D0JJ', 0, 'sale', 50, 50, 0, ''),
(308, '211802', 0, 1, 0, '2017-12-10 01:53:35', 4, '0QGAI8', 0, 'sale', 50, 50, 0, ''),
(309, '211802', 0, 1, 0, '2017-12-11 00:20:41', 6, '9BJU00', 0, 'sale', 50, 50, 0, ''),
(310, '211802', 0, 1, 0, '2017-12-11 00:21:39', 6, '9BJU00', 0, 'sale', 50, 50, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_articles_variations`
--

CREATE TABLE `tendoo_nexo_articles_variations` (
  `ID` int(11) NOT NULL,
  `REF_ARTICLE` int(11) NOT NULL,
  `VAR_DESIGN` varchar(250) NOT NULL,
  `VAR_DESCRIPTION` varchar(250) NOT NULL,
  `VAR_PRIX_DE_VENTE` float NOT NULL,
  `VAR_QUANTITE_TOTALE` int(11) NOT NULL,
  `VAR_QUANTITE_RESTANTE` int(11) NOT NULL,
  `VAR_QUANTITE_VENDUE` int(11) NOT NULL,
  `VAR_COULEUR` varchar(250) NOT NULL,
  `VAR_TAILLE` varchar(250) NOT NULL,
  `VAR_POIDS` varchar(250) NOT NULL,
  `VAR_HAUTEUR` varchar(250) NOT NULL,
  `VAR_LARGEUR` varchar(250) NOT NULL,
  `VAR_SHADOW_PRICE` float NOT NULL,
  `VAR_SPECIAL_PRICE_START_DATE` datetime NOT NULL,
  `VAR_SPECIAL_PRICE_END_DATE` datetime NOT NULL,
  `VAR_APERCU` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_categories`
--

CREATE TABLE `tendoo_nexo_categories` (
  `ID` int(11) NOT NULL,
  `NOM` varchar(200) NOT NULL,
  `DESCRIPTION` text NOT NULL,
  `DATE_CREATION` datetime NOT NULL,
  `DATE_MOD` datetime NOT NULL,
  `AUTHOR` int(11) NOT NULL,
  `PARENT_REF_ID` int(11) NOT NULL,
  `THUMB` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tendoo_nexo_categories`
--

INSERT INTO `tendoo_nexo_categories` (`ID`, `NOM`, `DESCRIPTION`, `DATE_CREATION`, `DATE_MOD`, `AUTHOR`, `PARENT_REF_ID`, `THUMB`) VALUES
(1, 'Test Category', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, ''),
(2, 'Pizza', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, ''),
(3, 'Burger', '<p>\n Burger</p>\n', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_clients`
--

CREATE TABLE `tendoo_nexo_clients` (
  `ID` int(11) NOT NULL,
  `NOM` varchar(200) NOT NULL,
  `PRENOM` varchar(200) NOT NULL,
  `POIDS` int(11) NOT NULL,
  `TEL` varchar(200) NOT NULL,
  `EMAIL` varchar(200) NOT NULL,
  `DESCRIPTION` text NOT NULL,
  `DATE_NAISSANCE` datetime NOT NULL,
  `ADRESSE` text NOT NULL,
  `NBR_COMMANDES` int(11) NOT NULL,
  `OVERALL_COMMANDES` int(11) NOT NULL,
  `DISCOUNT_ACTIVE` int(11) NOT NULL,
  `TOTAL_SPEND` float NOT NULL,
  `LAST_ORDER` varchar(200) NOT NULL,
  `AVATAR` varchar(200) NOT NULL,
  `STATE` varchar(200) NOT NULL,
  `CITY` varchar(200) NOT NULL,
  `POST_CODE` varchar(200) NOT NULL,
  `COUNTRY` varchar(200) NOT NULL,
  `COMPANY_NAME` varchar(200) NOT NULL,
  `DATE_CREATION` datetime NOT NULL,
  `DATE_MOD` datetime NOT NULL,
  `REF_GROUP` int(11) NOT NULL,
  `AUTHOR` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tendoo_nexo_clients`
--

INSERT INTO `tendoo_nexo_clients` (`ID`, `NOM`, `PRENOM`, `POIDS`, `TEL`, `EMAIL`, `DESCRIPTION`, `DATE_NAISSANCE`, `ADRESSE`, `NBR_COMMANDES`, `OVERALL_COMMANDES`, `DISCOUNT_ACTIVE`, `TOTAL_SPEND`, `LAST_ORDER`, `AVATAR`, `STATE`, `CITY`, `POST_CODE`, `COUNTRY`, `COMPANY_NAME`, `DATE_CREATION`, `DATE_MOD`, `REF_GROUP`, `AUTHOR`) VALUES
(1, 'Demo', '', 0, '', '', '', '0000-00-00 00:00:00', '', 155, 155, 0, 0, '', '', '', '', '', '', '', '2017-10-12 16:32:09', '2017-10-12 16:32:09', 0, 2),
(2, '96666', '', 0, '', '', '', '0000-00-00 00:00:00', '', 0, 0, 0, 0, '', '', '', '', '', '', '', '2017-10-15 19:23:38', '2017-10-15 19:23:38', 0, 3),
(3, '9666', '', 0, '', '', '', '0000-00-00 00:00:00', '', 0, 0, 0, 0, '', '', '', '', '', '', '', '2017-10-15 19:23:49', '2017-10-15 19:23:49', 0, 3),
(4, 'customer1', 'custom', 0, '11111111', 'c@c.com', '', '1987-09-09 00:00:00', '', 1, 1, 0, 0, '', '', 'chaoyang', 'beijing', '', 'china', '', '2017-11-19 02:14:23', '2017-11-19 02:14:23', 0, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_clients_address`
--

CREATE TABLE `tendoo_nexo_clients_address` (
  `id` int(11) NOT NULL,
  `type` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `surname` varchar(200) NOT NULL,
  `enterprise` varchar(200) NOT NULL,
  `address_1` varchar(200) NOT NULL,
  `address_2` varchar(200) NOT NULL,
  `city` varchar(200) NOT NULL,
  `pobox` varchar(200) NOT NULL,
  `country` varchar(200) NOT NULL,
  `state` varchar(200) NOT NULL,
  `ref_client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tendoo_nexo_clients_address`
--

INSERT INTO `tendoo_nexo_clients_address` (`id`, `type`, `name`, `surname`, `enterprise`, `address_1`, `address_2`, `city`, `pobox`, `country`, `state`, `ref_client`) VALUES
(1, 'shipping', '', '', '', '', '', '', '', '', '', 1),
(2, 'billing', '', '', '', '', '', '', '', '', '', 1),
(3, 'shipping', '', '', '', '', '', '', '', '', '', 2),
(4, 'billing', '', '', '', '', '', '', '', '', '', 2),
(5, 'shipping', '', '', '', '', '', '', '', '', '', 3),
(6, 'billing', '', '', '', '', '', '', '', '', '', 3),
(7, 'shipping', '', '', '', '', '', '', '', '', '', 4),
(8, 'billing', '', '', '', '', '', '', '', '', '', 4);

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_clients_groups`
--

CREATE TABLE `tendoo_nexo_clients_groups` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(200) NOT NULL,
  `DESCRIPTION` text NOT NULL,
  `DATE_CREATION` datetime NOT NULL,
  `DATE_MODIFICATION` datetime NOT NULL,
  `DISCOUNT_TYPE` varchar(220) NOT NULL,
  `DISCOUNT_PERCENT` float NOT NULL,
  `DISCOUNT_AMOUNT` float NOT NULL,
  `DISCOUNT_ENABLE_SCHEDULE` varchar(220) NOT NULL,
  `DISCOUNT_START` datetime NOT NULL,
  `DISCOUNT_END` datetime NOT NULL,
  `AUTHOR` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_clients_meta`
--

CREATE TABLE `tendoo_nexo_clients_meta` (
  `ID` int(11) NOT NULL,
  `KEY` varchar(200) NOT NULL,
  `VALUE` text NOT NULL,
  `REF_CLIENT` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_commandes`
--

CREATE TABLE `tendoo_nexo_commandes` (
  `ID` int(11) NOT NULL,
  `TITRE` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(200) NOT NULL,
  `CODE` varchar(250) NOT NULL,
  `REF_CLIENT` int(11) NOT NULL,
  `REF_REGISTER` int(11) NOT NULL,
  `TYPE` varchar(200) NOT NULL,
  `RESTAURANT_ORDER_TYPE` varchar(200) NOT NULL,
  `RESTAURANT_ORDER_STATUS` varchar(200) NOT NULL,
  `DATE_CREATION` datetime NOT NULL,
  `DATE_MOD` datetime NOT NULL,
  `PAYMENT_TYPE` varchar(220) NOT NULL,
  `AUTHOR` varchar(200) NOT NULL,
  `SOMME_PERCU` float NOT NULL,
  `REMISE` float NOT NULL,
  `RABAIS` float NOT NULL,
  `RISTOURNE` float NOT NULL,
  `REMISE_TYPE` varchar(200) NOT NULL,
  `REMISE_PERCENT` float NOT NULL,
  `RABAIS_PERCENT` float NOT NULL,
  `RISTOURNE_PERCENT` float NOT NULL,
  `TOTAL` float NOT NULL,
  `DISCOUNT_TYPE` varchar(200) NOT NULL,
  `TVA` float NOT NULL,
  `GROUP_DISCOUNT` float DEFAULT NULL,
  `REF_SHIPPING_ADDRESS` int(11) NOT NULL,
  `SHIPPING_AMOUNT` float NOT NULL,
  `EXPIRATION_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tendoo_nexo_commandes`
--

INSERT INTO `tendoo_nexo_commandes` (`ID`, `TITRE`, `DESCRIPTION`, `CODE`, `REF_CLIENT`, `REF_REGISTER`, `TYPE`, `RESTAURANT_ORDER_TYPE`, `RESTAURANT_ORDER_STATUS`, `DATE_CREATION`, `DATE_MOD`, `PAYMENT_TYPE`, `AUTHOR`, `SOMME_PERCU`, `REMISE`, `RABAIS`, `RISTOURNE`, `REMISE_TYPE`, `REMISE_PERCENT`, `RABAIS_PERCENT`, `RISTOURNE_PERCENT`, `TOTAL`, `DISCOUNT_TYPE`, `TVA`, `GROUP_DISCOUNT`, `REF_SHIPPING_ADDRESS`, `SHIPPING_AMOUNT`, `EXPIRATION_DATE`) VALUES
(91, '', '', 'GBM2ZF', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-25 03:13:08', '2017-11-25 03:13:09', 'cash', '4', 89, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(92, '', '', 'NH6X0C', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-25 03:46:32', '2017-11-25 03:46:33', 'cash', '4', 90, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(93, '', 'pop', 'PQ2SXH', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-25 03:48:46', '2017-11-25 03:48:47', 'cash', '4', 200, 0, 0, 0, '', 0, 0, 0, 150, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(94, '', '', 'ZBY1JB', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-25 04:08:14', '2017-11-25 04:08:15', 'cash', '4', 60, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(95, '', '', 'SKTA9E', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-25 04:14:38', '2017-11-25 04:14:39', 'cash', '4', 700, 0, 0, 0, '', 0, 0, 0, 100, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(96, '', '', '12DQZN', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-25 06:05:03', '2017-11-25 06:05:03', 'cash', '4', 90, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(97, '', '', 'WOHYIO', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-25 06:11:34', '2017-11-25 06:11:34', 'cash', '4', 50, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(98, '', '', '719L3I', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-25 06:15:42', '2017-11-25 06:15:42', 'cash', '4', 60, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(99, '', '', 'BJPKRR', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-25 06:22:45', '2017-11-25 06:22:46', 'cash', '4', 60, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(100, '', '12341234', 'UV870G', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-25 06:27:49', '2017-11-25 06:27:50', 'cash', '4', 60, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(101, '', '', 'VLKR9W', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-25 06:54:27', '2017-11-25 06:54:28', 'cash', '4', 60, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(102, '', '', 'WNDPV0', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-25 06:59:55', '2017-11-25 06:59:56', 'cash', '4', 60, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(103, '', '', 'PC226T', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-25 07:04:43', '2017-11-25 07:04:43', 'cash', '4', 60, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(104, '', '', 'P3QVPT', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-25 07:12:59', '2017-11-25 07:12:59', 'cash', '4', 60, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(105, '', '', 'U07L5Q', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-25 07:20:53', '2017-11-25 07:20:53', 'cash', '4', 60, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(106, '', '', '1VA0SY', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-25 07:25:37', '2017-11-25 07:25:38', 'cash', '4', 98, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(107, '', '', 'O3YSXZ', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-25 07:28:18', '2017-11-25 07:28:18', 'cash', '4', 98, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(108, '', '', '38JLW4', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-25 07:36:15', '2017-11-25 07:36:15', 'cash', '4', 98, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(109, '', '', 'XBO3R3', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-25 07:38:59', '2017-11-25 07:38:59', 'cash', '4', 98, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(110, '', '', 'LWFNFX', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-25 08:20:02', '2017-11-25 08:20:02', 'cash', '4', 98, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(111, '', '', 'HOHJMB', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-25 08:26:01', '2017-11-25 08:26:02', 'cash', '4', 98, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(112, '', '', '445HI7', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-25 08:29:17', '2017-11-25 08:29:17', 'cash', '4', 98, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(113, '', '', '76BQQX', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-25 09:25:55', '2017-11-25 09:28:29', 'cash', '4', 98, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(115, '', '', 'JK38NY', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-26 13:34:11', '2017-11-26 13:34:12', 'cash', '4', 98, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(119, '', '', 'TD0PFE', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-26 13:40:51', '2017-11-26 13:40:52', 'cash', '4', 100, 0, 0, 0, '', 0, 0, 0, 100, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(123, '', '', 'S8NJM0', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 14:36:30', '2017-11-28 14:36:31', 'cash', '4', 100, 0, 0, 0, '', 0, 0, 0, 100, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(124, '', '', '81U2FC', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 14:36:59', '2017-11-28 14:36:59', 'cash', '4', 100, 0, 0, 0, '', 0, 0, 0, 100, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(125, '', '', 'NX36SY', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 14:37:55', '2017-11-28 14:37:56', 'cash', '4', 100, 0, 0, 0, '', 0, 0, 0, 100, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(128, '', '', '6GA7OH', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 14:39:30', '2017-11-28 14:39:31', 'cash', '4', 100, 0, 0, 0, '', 0, 0, 0, 100, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(129, '', '', 'YXDFQ1', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 14:54:41', '2017-11-28 14:54:43', 'cash', '4', 100, 0, 0, 0, '', 0, 0, 0, 100, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(130, '', '', 'KKV1WP', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 14:57:54', '2017-11-28 14:57:56', 'cash', '4', 100, 0, 0, 0, '', 0, 0, 0, 100, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(131, '', '', '38UJ5H', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 14:58:35', '2017-11-28 14:58:37', 'cash', '4', 150, 0, 0, 0, '', 0, 0, 0, 150, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(132, '', '', '4CVZ2X', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 14:58:54', '2017-11-28 14:58:55', 'cash', '4', 450, 0, 0, 0, '', 0, 0, 0, 150, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(133, '', '', 'G261KJ', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 15:01:11', '2017-11-28 15:01:13', 'cash', '4', 100, 0, 0, 0, '', 0, 0, 0, 100, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(134, '', '', 'CVV3TQ', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 15:02:13', '2017-11-28 15:02:15', 'cash', '4', 150, 0, 0, 0, '', 0, 0, 0, 150, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(135, '', '', 'F97T5S', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 15:02:30', '2017-11-28 15:02:31', 'cash', '4', 100, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(136, '', '', 'QGO70J', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 15:05:25', '2017-11-28 15:05:26', 'cash', '4', 100, 0, 0, 0, '', 0, 0, 0, 100, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(137, '', '', 'J95KK2', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 15:05:44', '2017-11-28 15:05:45', 'cash', '4', 100, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(138, '', '', 'CFUMEG', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 15:06:51', '2017-11-28 15:06:51', 'cash', '4', 100, 0, 0, 0, '', 0, 0, 0, 100, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(139, '', '', '3881CJ', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 15:08:24', '2017-11-28 15:08:25', 'cash', '4', 100, 0, 0, 0, '', 0, 0, 0, 100, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(140, '', '', 'U31US2', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 15:08:41', '2017-11-28 15:08:42', 'cash', '4', 100, 0, 0, 0, '', 0, 0, 0, 100, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(141, '', '', 'UMWE98', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 15:09:11', '2017-11-28 15:09:12', 'cash', '4', 100, 0, 0, 0, '', 0, 0, 0, 100, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(142, '', '', 'M68V9P', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 15:09:42', '2017-11-28 15:09:44', 'cash', '4', 200, 0, 0, 0, '', 0, 0, 0, 200, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(143, '', '', '9Z3N8R', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 15:10:48', '2017-11-28 15:10:49', 'cash', '4', 100, 0, 0, 0, '', 0, 0, 0, 100, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(144, '', '', 'QX8956', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 15:13:21', '2017-11-28 15:13:22', 'cash', '4', 50, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(145, '', '', 'HL5YU1', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 15:19:18', '2017-11-28 15:19:19', 'cash', '4', 100, 0, 0, 0, '', 0, 0, 0, 100, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(147, '', '', 'RBXT11', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 15:23:04', '2017-11-28 15:23:05', 'cash', '4', 50, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(148, '', '', 'T8JZ77', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 15:23:17', '2017-11-28 15:23:18', 'cash', '4', 50, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(149, '', '', 'H9RAZH', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 15:25:29', '2017-11-28 15:25:31', 'cash', '4', 100, 0, 0, 0, '', 0, 0, 0, 100, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(150, '', '', '1F6VAB', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 15:26:50', '2017-11-28 15:26:52', 'cash', '4', 400, 0, 0, 0, '', 0, 0, 0, 200, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(151, '', '', '5XN2K0', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 15:27:58', '2017-11-28 15:27:59', 'cash', '4', 100, 0, 0, 0, '', 0, 0, 0, 100, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(152, '', '', 'BEK2BZ', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 15:29:01', '2017-11-28 15:29:02', 'cash', '4', 100, 0, 0, 0, '', 0, 0, 0, 100, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(153, '', '', 'VUP846', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 15:29:42', '2017-11-28 15:29:44', 'cash', '4', 100, 0, 0, 0, '', 0, 0, 0, 100, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(154, '', '', 'DCDUX5', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 15:30:21', '2017-11-28 15:30:23', 'cash', '4', 100, 0, 0, 0, '', 0, 0, 0, 100, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(155, '', '', 'IZB55U', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 15:31:17', '2017-11-28 15:31:18', 'cash', '4', 100, 0, 0, 0, '', 0, 0, 0, 100, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(156, '', '', 'X6IIVK', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 15:32:27', '2017-11-28 15:32:28', 'cash', '4', 100, 0, 0, 0, '', 0, 0, 0, 100, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(157, '', '', '5TZW86', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 15:39:42', '2017-11-28 15:39:43', 'cash', '4', 100, 0, 0, 0, '', 0, 0, 0, 100, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(158, '', '', '8BV0VT', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 15:42:04', '2017-11-28 15:42:05', 'cash', '4', 100, 0, 0, 0, '', 0, 0, 0, 100, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(159, '', '', 'MVPXYB', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 15:42:45', '2017-11-28 15:42:46', 'cash', '4', 100, 0, 0, 0, '', 0, 0, 0, 100, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(160, '', '', 'TSXOOY', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 15:44:31', '2017-11-28 15:44:32', 'cash', '4', 100, 0, 0, 0, '', 0, 0, 0, 100, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(161, '', '', '622HR1', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 15:45:22', '2017-11-28 15:45:24', 'cash', '4', 100, 0, 0, 0, '', 0, 0, 0, 100, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(162, '', '', 'L9SE84', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 15:46:19', '2017-11-28 15:46:19', 'cash', '4', 50, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(163, '', '', 'OGJCRN', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 15:48:10', '2017-11-28 15:48:11', 'cash', '4', 50, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(164, '', '', 'S3KTOD', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 15:49:42', '2017-11-28 15:49:43', 'cash', '4', 100, 0, 0, 0, '', 0, 0, 0, 100, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(165, '', '', 'V6GSVK', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 15:50:38', '2017-11-28 15:50:39', 'cash', '4', 100, 0, 0, 0, '', 0, 0, 0, 100, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(166, '', '', '7VA4JH', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 15:52:07', '2017-11-28 15:52:08', 'cash', '4', 100, 0, 0, 0, '', 0, 0, 0, 100, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(167, '', '', 'VZA42F', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 15:54:44', '2017-11-28 15:54:45', 'cash', '4', 100, 0, 0, 0, '', 0, 0, 0, 100, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(168, '', '', 'NOR3HN', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 15:55:23', '2017-11-28 15:55:23', 'cash', '4', 100, 0, 0, 0, '', 0, 0, 0, 100, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(169, '', '', 'G61616', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 15:58:04', '2017-11-28 15:58:06', 'cash', '4', 100, 0, 0, 0, '', 0, 0, 0, 100, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(170, '', '', 'KHQTZ0', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 15:58:38', '2017-11-28 15:58:39', 'cash', '4', 100, 0, 0, 0, '', 0, 0, 0, 100, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(171, '', '', '2TRZY2', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 16:00:47', '2017-11-28 16:00:48', 'cash', '4', 100, 0, 0, 0, '', 0, 0, 0, 100, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(172, '', '', 'DYW963', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-11-28 16:01:38', '2017-11-28 16:01:38', 'cash', '4', 100, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(173, '', '', 'UC541X', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-12-09 21:56:18', '2017-12-09 21:56:19', 'cash', '4', 150, 0, 0, 0, '', 0, 0, 0, 150, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(174, '', '', 'R7CE8B', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-12-09 22:04:02', '2017-12-09 22:04:02', 'cash', '4', 50, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(175, '', '', 'AWQMAL', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-12-09 22:37:29', '2017-12-09 22:37:29', 'cash', '4', 50, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(176, 'Take away', '', 'RHSUCY', 1, 0, 'nexo_order_devis', 'takeaway', 'pending', '2017-12-09 22:39:10', '2017-12-09 22:39:10', '', '4', 0, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(177, 'Take away', '', 'XQ3F4J', 1, 0, 'nexo_order_devis', 'takeaway', 'pending', '2017-12-09 22:39:53', '2017-12-09 22:39:53', '', '4', 0, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(178, 'Take away', '', 'BS29DA', 1, 0, 'nexo_order_devis', 'takeaway', 'pending', '2017-12-09 22:45:05', '2017-12-09 22:45:05', '', '4', 0, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(179, 'Take away', '', 'YZSAVX', 1, 0, 'nexo_order_devis', 'takeaway', 'pending', '2017-12-09 22:46:21', '2017-12-09 22:46:21', '', '4', 0, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(180, 'Take away', '', 'HBW8C3', 1, 0, 'nexo_order_devis', 'takeaway', 'pending', '2017-12-09 22:50:48', '2017-12-09 22:50:48', '', '4', 0, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(181, 'Take away', '', 'A2TUCR', 1, 0, 'nexo_order_devis', 'takeaway', 'pending', '2017-12-09 22:56:09', '2017-12-09 22:56:09', '', '4', 0, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(182, 'Take away', '', '0SDFUE', 1, 0, 'nexo_order_devis', 'takeaway', 'pending', '2017-12-09 22:58:57', '2017-12-09 22:58:57', '', '4', 0, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(183, 'Take away', '', '39V0A0', 1, 0, 'nexo_order_devis', 'takeaway', 'pending', '2017-12-09 23:04:45', '2017-12-09 23:04:45', '', '4', 0, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(184, 'Take away', '', 'DOKS60', 1, 0, 'nexo_order_devis', 'takeaway', 'pending', '2017-12-09 23:11:58', '2017-12-09 23:11:58', '', '4', 0, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(185, 'Take away', '', 'Z0IUQ2', 1, 0, 'nexo_order_devis', 'takeaway', 'pending', '2017-12-09 23:14:02', '2017-12-09 23:14:02', '', '4', 0, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(186, 'Take away', '', '6WW3IY', 1, 0, 'nexo_order_devis', 'takeaway', 'pending', '2017-12-09 23:18:17', '2017-12-09 23:18:17', '', '4', 0, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(187, 'Take away', '', 'FLZNF8', 1, 0, 'nexo_order_devis', 'takeaway', 'pending', '2017-12-10 00:45:26', '2017-12-10 00:45:26', '', '4', 0, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(188, 'Take away', '', 'PPNEF0', 1, 0, 'nexo_order_devis', 'takeaway', 'pending', '2017-12-10 01:06:41', '2017-12-10 01:06:41', '', '4', 0, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(189, '', '', 'EEE0BJ', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-12-10 01:07:44', '2017-12-10 01:07:45', 'cash', '4', 50, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(190, '', '', 'R1HWSV', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-12-10 01:10:55', '2017-12-10 01:10:56', 'cash', '4', 50, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(191, 'Take away', '', 'FU73D4', 1, 0, 'nexo_order_devis', 'takeaway', 'pending', '2017-12-10 01:20:02', '2017-12-10 01:20:02', '', '4', 0, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(192, 'Take away', '', '90W47H', 1, 0, 'nexo_order_devis', 'takeaway', 'pending', '2017-12-10 01:23:30', '2017-12-10 01:23:30', '', '4', 0, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(193, 'Take away', '', '98X6TO', 1, 0, 'nexo_order_devis', 'takeaway', 'pending', '2017-12-10 01:27:58', '2017-12-10 01:27:58', '', '4', 0, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(194, 'Take away', '', '6DCPEH', 1, 0, 'nexo_order_devis', 'takeaway', 'pending', '2017-12-10 01:29:16', '2017-12-10 01:29:16', '', '4', 0, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(195, 'Take away', '', '1QMLX1', 1, 0, 'nexo_order_devis', 'takeaway', 'pending', '2017-12-10 01:36:33', '2017-12-10 01:36:33', '', '4', 0, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(196, 'Take away', '', '5ATEIN', 1, 0, 'nexo_order_devis', 'takeaway', 'pending', '2017-12-10 01:44:14', '2017-12-10 01:44:14', '', '4', 0, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(197, '', '', 'R7D0JJ', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-12-10 01:46:17', '2017-12-10 01:46:17', 'cash', '4', 50, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(198, '', '', '0QGAI8', 1, 0, 'nexo_order_comptant', 'takeaway', 'pending', '2017-12-10 01:53:35', '2017-12-10 01:53:36', 'cash', '4', 50, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(199, '', '', '9BJU00', 1, 0, 'nexo_order_comptant', 'takeaway', 'collected', '2017-12-11 00:20:41', '2017-12-11 00:21:39', 'cash', '6', 50, 0, 0, 0, '', 0, 0, 0, 50, '', 0, 0, 0, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_commandes_coupons`
--

CREATE TABLE `tendoo_nexo_commandes_coupons` (
  `ID` int(11) NOT NULL,
  `REF_COMMAND` int(11) NOT NULL,
  `REF_COUPON` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_commandes_meta`
--

CREATE TABLE `tendoo_nexo_commandes_meta` (
  `ID` int(11) NOT NULL,
  `REF_ORDER_ID` int(11) NOT NULL,
  `KEY` varchar(250) NOT NULL,
  `VALUE` text NOT NULL,
  `DATE_CREATION` datetime NOT NULL,
  `DATE_MOD` datetime NOT NULL,
  `AUTHOR` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tendoo_nexo_commandes_meta`
--

INSERT INTO `tendoo_nexo_commandes_meta` (`ID`, `REF_ORDER_ID`, `KEY`, `VALUE`, `DATE_CREATION`, `DATE_MOD`, `AUTHOR`) VALUES
(97, 91, 'order_real_type', 'takeaway', '2017-11-25 03:13:09', '0000-00-00 00:00:00', 4),
(98, 92, 'order_real_type', 'takeaway', '2017-11-25 03:46:33', '0000-00-00 00:00:00', 4),
(99, 93, 'order_real_type', 'takeaway', '2017-11-25 03:48:47', '0000-00-00 00:00:00', 4),
(100, 94, 'order_real_type', 'takeaway', '2017-11-25 04:08:15', '0000-00-00 00:00:00', 4),
(101, 95, 'order_real_type', 'takeaway', '2017-11-25 04:14:39', '0000-00-00 00:00:00', 4),
(102, 96, 'order_real_type', 'takeaway', '2017-11-25 06:05:03', '0000-00-00 00:00:00', 4),
(103, 97, 'order_real_type', 'takeaway', '2017-11-25 06:11:34', '0000-00-00 00:00:00', 4),
(104, 98, 'order_real_type', 'takeaway', '2017-11-25 06:15:42', '0000-00-00 00:00:00', 4),
(105, 99, 'order_real_type', 'takeaway', '2017-11-25 06:22:46', '0000-00-00 00:00:00', 4),
(106, 100, 'order_real_type', 'takeaway', '2017-11-25 06:27:50', '0000-00-00 00:00:00', 4),
(107, 101, 'order_real_type', 'takeaway', '2017-11-25 06:54:28', '0000-00-00 00:00:00', 4),
(108, 102, 'order_real_type', 'takeaway', '2017-11-25 06:59:56', '0000-00-00 00:00:00', 4),
(109, 103, 'order_real_type', 'takeaway', '2017-11-25 07:04:43', '0000-00-00 00:00:00', 4),
(110, 104, 'order_real_type', 'takeaway', '2017-11-25 07:12:59', '0000-00-00 00:00:00', 4),
(111, 105, 'order_real_type', 'takeaway', '2017-11-25 07:20:53', '0000-00-00 00:00:00', 4),
(112, 106, 'order_real_type', 'takeaway', '2017-11-25 07:25:38', '0000-00-00 00:00:00', 4),
(113, 107, 'order_real_type', 'takeaway', '2017-11-25 07:28:18', '0000-00-00 00:00:00', 4),
(114, 108, 'order_real_type', 'takeaway', '2017-11-25 07:36:15', '0000-00-00 00:00:00', 4),
(115, 109, 'order_real_type', 'takeaway', '2017-11-25 07:38:59', '0000-00-00 00:00:00', 4),
(116, 110, 'order_real_type', 'takeaway', '2017-11-25 08:20:02', '0000-00-00 00:00:00', 4),
(117, 111, 'order_real_type', 'takeaway', '2017-11-25 08:26:02', '0000-00-00 00:00:00', 4),
(118, 112, 'order_real_type', 'takeaway', '2017-11-25 08:29:17', '0000-00-00 00:00:00', 4),
(119, 113, 'order_real_type', 'takeaway', '2017-11-25 09:28:29', '0000-00-00 00:00:00', 4),
(121, 115, 'order_real_type', 'takeaway', '2017-11-26 13:34:12', '0000-00-00 00:00:00', 4),
(125, 119, 'order_real_type', 'takeaway', '2017-11-26 13:40:52', '0000-00-00 00:00:00', 4),
(129, 123, 'order_real_type', 'takeaway', '2017-11-28 14:36:31', '0000-00-00 00:00:00', 4),
(130, 124, 'order_real_type', 'takeaway', '2017-11-28 14:36:59', '0000-00-00 00:00:00', 4),
(131, 125, 'order_real_type', 'takeaway', '2017-11-28 14:37:56', '0000-00-00 00:00:00', 4),
(134, 128, 'order_real_type', 'takeaway', '2017-11-28 14:39:31', '0000-00-00 00:00:00', 4),
(135, 129, 'order_real_type', 'takeaway', '2017-11-28 14:54:43', '0000-00-00 00:00:00', 4),
(136, 130, 'order_real_type', 'takeaway', '2017-11-28 14:57:55', '0000-00-00 00:00:00', 4),
(137, 131, 'order_real_type', 'takeaway', '2017-11-28 14:58:37', '0000-00-00 00:00:00', 4),
(138, 132, 'order_real_type', 'takeaway', '2017-11-28 14:58:55', '0000-00-00 00:00:00', 4),
(139, 133, 'order_real_type', 'takeaway', '2017-11-28 15:01:13', '0000-00-00 00:00:00', 4),
(140, 134, 'order_real_type', 'takeaway', '2017-11-28 15:02:14', '0000-00-00 00:00:00', 4),
(141, 135, 'order_real_type', 'takeaway', '2017-11-28 15:02:30', '0000-00-00 00:00:00', 4),
(142, 136, 'order_real_type', 'takeaway', '2017-11-28 15:05:26', '0000-00-00 00:00:00', 4),
(143, 137, 'order_real_type', 'takeaway', '2017-11-28 15:05:45', '0000-00-00 00:00:00', 4),
(144, 138, 'order_real_type', 'takeaway', '2017-11-28 15:06:51', '0000-00-00 00:00:00', 4),
(145, 139, 'order_real_type', 'takeaway', '2017-11-28 15:08:25', '0000-00-00 00:00:00', 4),
(146, 140, 'order_real_type', 'takeaway', '2017-11-28 15:08:42', '0000-00-00 00:00:00', 4),
(147, 141, 'order_real_type', 'takeaway', '2017-11-28 15:09:12', '0000-00-00 00:00:00', 4),
(148, 142, 'order_real_type', 'takeaway', '2017-11-28 15:09:44', '0000-00-00 00:00:00', 4),
(149, 143, 'order_real_type', 'takeaway', '2017-11-28 15:10:49', '0000-00-00 00:00:00', 4),
(150, 144, 'order_real_type', 'takeaway', '2017-11-28 15:13:22', '0000-00-00 00:00:00', 4),
(151, 145, 'order_real_type', 'takeaway', '2017-11-28 15:19:19', '0000-00-00 00:00:00', 4),
(153, 147, 'order_real_type', 'takeaway', '2017-11-28 15:23:05', '0000-00-00 00:00:00', 4),
(154, 148, 'order_real_type', 'takeaway', '2017-11-28 15:23:18', '0000-00-00 00:00:00', 4),
(155, 149, 'order_real_type', 'takeaway', '2017-11-28 15:25:30', '0000-00-00 00:00:00', 4),
(156, 150, 'order_real_type', 'takeaway', '2017-11-28 15:26:52', '0000-00-00 00:00:00', 4),
(157, 151, 'order_real_type', 'takeaway', '2017-11-28 15:27:59', '0000-00-00 00:00:00', 4),
(158, 152, 'order_real_type', 'takeaway', '2017-11-28 15:29:02', '0000-00-00 00:00:00', 4),
(159, 153, 'order_real_type', 'takeaway', '2017-11-28 15:29:44', '0000-00-00 00:00:00', 4),
(160, 154, 'order_real_type', 'takeaway', '2017-11-28 15:30:23', '0000-00-00 00:00:00', 4),
(161, 155, 'order_real_type', 'takeaway', '2017-11-28 15:31:18', '0000-00-00 00:00:00', 4),
(162, 156, 'order_real_type', 'takeaway', '2017-11-28 15:32:28', '0000-00-00 00:00:00', 4),
(163, 157, 'order_real_type', 'takeaway', '2017-11-28 15:39:43', '0000-00-00 00:00:00', 4),
(164, 158, 'order_real_type', 'takeaway', '2017-11-28 15:42:05', '0000-00-00 00:00:00', 4),
(165, 159, 'order_real_type', 'takeaway', '2017-11-28 15:42:46', '0000-00-00 00:00:00', 4),
(166, 160, 'order_real_type', 'takeaway', '2017-11-28 15:44:32', '0000-00-00 00:00:00', 4),
(167, 161, 'order_real_type', 'takeaway', '2017-11-28 15:45:24', '0000-00-00 00:00:00', 4),
(168, 162, 'order_real_type', 'takeaway', '2017-11-28 15:46:19', '0000-00-00 00:00:00', 4),
(169, 163, 'order_real_type', 'takeaway', '2017-11-28 15:48:11', '0000-00-00 00:00:00', 4),
(170, 164, 'order_real_type', 'takeaway', '2017-11-28 15:49:43', '0000-00-00 00:00:00', 4),
(171, 165, 'order_real_type', 'takeaway', '2017-11-28 15:50:39', '0000-00-00 00:00:00', 4),
(172, 166, 'order_real_type', 'takeaway', '2017-11-28 15:52:08', '0000-00-00 00:00:00', 4),
(173, 167, 'order_real_type', 'takeaway', '2017-11-28 15:54:45', '0000-00-00 00:00:00', 4),
(174, 168, 'order_real_type', 'takeaway', '2017-11-28 15:55:23', '0000-00-00 00:00:00', 4),
(175, 169, 'order_real_type', 'takeaway', '2017-11-28 15:58:06', '0000-00-00 00:00:00', 4),
(176, 170, 'order_real_type', 'takeaway', '2017-11-28 15:58:39', '0000-00-00 00:00:00', 4),
(177, 171, 'order_real_type', 'takeaway', '2017-11-28 16:00:48', '0000-00-00 00:00:00', 4),
(178, 172, 'order_real_type', 'takeaway', '2017-11-28 16:01:38', '0000-00-00 00:00:00', 4),
(179, 173, 'order_real_type', 'takeaway', '2017-12-09 21:56:19', '0000-00-00 00:00:00', 4),
(180, 174, 'order_real_type', 'takeaway', '2017-12-09 22:04:02', '0000-00-00 00:00:00', 4),
(181, 175, 'order_real_type', 'takeaway', '2017-12-09 22:37:29', '0000-00-00 00:00:00', 4),
(182, 176, 'order_real_type', 'takeaway', '2017-12-09 22:39:10', '0000-00-00 00:00:00', 4),
(183, 177, 'order_real_type', 'takeaway', '2017-12-09 22:39:54', '0000-00-00 00:00:00', 4),
(184, 178, 'order_real_type', 'takeaway', '2017-12-09 22:45:06', '0000-00-00 00:00:00', 4),
(185, 179, 'order_real_type', 'takeaway', '2017-12-09 22:46:22', '0000-00-00 00:00:00', 4),
(186, 180, 'order_real_type', 'takeaway', '2017-12-09 22:50:49', '0000-00-00 00:00:00', 4),
(187, 181, 'order_real_type', 'takeaway', '2017-12-09 22:56:10', '0000-00-00 00:00:00', 4),
(188, 182, 'order_real_type', 'takeaway', '2017-12-09 22:58:57', '0000-00-00 00:00:00', 4),
(189, 183, 'order_real_type', 'takeaway', '2017-12-09 23:04:45', '0000-00-00 00:00:00', 4),
(190, 184, 'order_real_type', 'takeaway', '2017-12-09 23:11:59', '0000-00-00 00:00:00', 4),
(191, 185, 'order_real_type', 'takeaway', '2017-12-09 23:14:03', '0000-00-00 00:00:00', 4),
(192, 186, 'order_real_type', 'takeaway', '2017-12-09 23:18:18', '0000-00-00 00:00:00', 4),
(193, 187, 'order_real_type', 'takeaway', '2017-12-10 00:45:27', '0000-00-00 00:00:00', 4),
(194, 188, 'order_real_type', 'takeaway', '2017-12-10 01:06:42', '0000-00-00 00:00:00', 4),
(195, 189, 'order_real_type', 'takeaway', '2017-12-10 01:07:45', '0000-00-00 00:00:00', 4),
(196, 190, 'order_real_type', 'takeaway', '2017-12-10 01:10:56', '0000-00-00 00:00:00', 4),
(197, 191, 'order_real_type', 'takeaway', '2017-12-10 01:20:02', '0000-00-00 00:00:00', 4),
(198, 192, 'order_real_type', 'takeaway', '2017-12-10 01:23:31', '0000-00-00 00:00:00', 4),
(199, 193, 'order_real_type', 'takeaway', '2017-12-10 01:27:59', '0000-00-00 00:00:00', 4),
(200, 194, 'order_real_type', 'takeaway', '2017-12-10 01:29:17', '0000-00-00 00:00:00', 4),
(201, 195, 'order_real_type', 'takeaway', '2017-12-10 01:36:34', '0000-00-00 00:00:00', 4),
(202, 196, 'order_real_type', 'takeaway', '2017-12-10 01:44:14', '0000-00-00 00:00:00', 4),
(203, 197, 'order_real_type', 'takeaway', '2017-12-10 01:46:17', '0000-00-00 00:00:00', 4),
(204, 198, 'order_real_type', 'takeaway', '2017-12-10 01:53:36', '0000-00-00 00:00:00', 4),
(205, 199, 'order_real_type', 'takeaway', '2017-12-11 00:20:41', '0000-00-00 00:00:00', 6);

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_commandes_paiements`
--

CREATE TABLE `tendoo_nexo_commandes_paiements` (
  `ID` int(11) NOT NULL,
  `REF_COMMAND_CODE` varchar(250) NOT NULL,
  `MONTANT` float NOT NULL,
  `AUTHOR` int(11) NOT NULL,
  `DATE_CREATION` datetime NOT NULL,
  `PAYMENT_TYPE` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tendoo_nexo_commandes_paiements`
--

INSERT INTO `tendoo_nexo_commandes_paiements` (`ID`, `REF_COMMAND_CODE`, `MONTANT`, `AUTHOR`, `DATE_CREATION`, `PAYMENT_TYPE`) VALUES
(1, 'GBM2ZF', 89, 4, '2017-11-25 03:13:12', 'cash'),
(2, 'NH6X0C', 90, 4, '2017-11-25 03:46:36', 'cash'),
(3, 'PQ2SXH', 200, 4, '2017-11-25 03:48:50', 'cash'),
(4, 'ZBY1JB', 60, 4, '2017-11-25 04:08:18', 'cash'),
(5, 'SKTA9E', 700, 4, '2017-11-25 04:14:42', 'cash'),
(6, '12DQZN', 90, 4, '2017-11-25 06:05:06', 'cash'),
(7, 'WOHYIO', 50, 4, '2017-11-25 06:11:37', 'cash'),
(8, '719L3I', 60, 4, '2017-11-25 06:15:45', 'cash'),
(9, 'BJPKRR', 60, 4, '2017-11-25 06:22:49', 'cash'),
(10, 'UV870G', 60, 4, '2017-11-25 06:27:53', 'cash'),
(11, 'VLKR9W', 60, 4, '2017-11-25 06:54:31', 'cash'),
(12, 'WNDPV0', 60, 4, '2017-11-25 06:59:59', 'cash'),
(13, 'PC226T', 60, 4, '2017-11-25 07:04:46', 'cash'),
(14, 'P3QVPT', 60, 4, '2017-11-25 07:13:02', 'cash'),
(15, 'U07L5Q', 60, 4, '2017-11-25 07:20:56', 'cash'),
(16, '1VA0SY', 98, 4, '2017-11-25 07:25:41', 'cash'),
(17, 'O3YSXZ', 98, 4, '2017-11-25 07:28:21', 'cash'),
(18, '38JLW4', 98, 4, '2017-11-25 07:36:18', 'cash'),
(19, 'XBO3R3', 98, 4, '2017-11-25 07:39:02', 'cash'),
(20, 'LWFNFX', 98, 4, '2017-11-25 08:20:05', 'cash'),
(21, 'HOHJMB', 98, 4, '2017-11-25 08:26:05', 'cash'),
(22, '445HI7', 98, 4, '2017-11-25 08:29:21', 'cash'),
(23, '76BQQX', 98, 4, '2017-11-25 09:28:34', 'cash'),
(24, 'JK38NY', 98, 4, '2017-11-26 13:34:12', 'cash'),
(25, 'TD0PFE', 100, 4, '2017-11-26 13:40:52', 'cash'),
(26, 'S8NJM0', 100, 4, '2017-11-28 14:36:32', 'cash'),
(27, '81U2FC', 100, 4, '2017-11-28 14:37:00', 'cash'),
(28, 'NX36SY', 100, 4, '2017-11-28 14:37:56', 'cash'),
(29, '6GA7OH', 100, 4, '2017-11-28 14:39:31', 'cash'),
(30, 'YXDFQ1', 100, 4, '2017-11-28 14:54:43', 'cash'),
(31, 'KKV1WP', 100, 4, '2017-11-28 14:57:56', 'cash'),
(32, '38UJ5H', 150, 4, '2017-11-28 14:58:37', 'cash'),
(33, '4CVZ2X', 450, 4, '2017-11-28 14:58:55', 'cash'),
(34, 'G261KJ', 100, 4, '2017-11-28 15:01:13', 'cash'),
(35, 'CVV3TQ', 150, 4, '2017-11-28 15:02:15', 'cash'),
(36, 'F97T5S', 100, 4, '2017-11-28 15:02:31', 'cash'),
(37, 'QGO70J', 100, 4, '2017-11-28 15:05:26', 'cash'),
(38, 'J95KK2', 100, 4, '2017-11-28 15:05:45', 'cash'),
(39, 'CFUMEG', 100, 4, '2017-11-28 15:06:52', 'cash'),
(40, '3881CJ', 100, 4, '2017-11-28 15:08:26', 'cash'),
(41, 'U31US2', 100, 4, '2017-11-28 15:08:42', 'cash'),
(42, 'UMWE98', 100, 4, '2017-11-28 15:09:12', 'cash'),
(43, 'M68V9P', 200, 4, '2017-11-28 15:09:44', 'cash'),
(44, '9Z3N8R', 100, 4, '2017-11-28 15:10:50', 'cash'),
(45, 'QX8956', 50, 4, '2017-11-28 15:13:22', 'cash'),
(46, 'HL5YU1', 100, 4, '2017-11-28 15:19:19', 'cash'),
(47, 'RBXT11', 50, 4, '2017-11-28 15:23:05', 'cash'),
(48, 'T8JZ77', 50, 4, '2017-11-28 15:23:18', 'cash'),
(49, 'H9RAZH', 100, 4, '2017-11-28 15:25:31', 'cash'),
(50, '1F6VAB', 400, 4, '2017-11-28 15:26:52', 'cash'),
(51, '5XN2K0', 100, 4, '2017-11-28 15:27:59', 'cash'),
(52, 'BEK2BZ', 100, 4, '2017-11-28 15:29:02', 'cash'),
(53, 'VUP846', 100, 4, '2017-11-28 15:29:44', 'cash'),
(54, 'DCDUX5', 100, 4, '2017-11-28 15:30:23', 'cash'),
(55, 'IZB55U', 100, 4, '2017-11-28 15:31:18', 'cash'),
(56, 'X6IIVK', 100, 4, '2017-11-28 15:32:28', 'cash'),
(57, '5TZW86', 100, 4, '2017-11-28 15:39:44', 'cash'),
(58, '8BV0VT', 100, 4, '2017-11-28 15:42:06', 'cash'),
(59, 'MVPXYB', 100, 4, '2017-11-28 15:42:46', 'cash'),
(60, 'TSXOOY', 100, 4, '2017-11-28 15:44:32', 'cash'),
(61, '622HR1', 100, 4, '2017-11-28 15:45:24', 'cash'),
(62, 'L9SE84', 50, 4, '2017-11-28 15:46:19', 'cash'),
(63, 'OGJCRN', 50, 4, '2017-11-28 15:48:11', 'cash'),
(64, 'S3KTOD', 100, 4, '2017-11-28 15:49:44', 'cash'),
(65, 'V6GSVK', 100, 4, '2017-11-28 15:50:40', 'cash'),
(66, '7VA4JH', 100, 4, '2017-11-28 15:52:08', 'cash'),
(67, 'VZA42F', 100, 4, '2017-11-28 15:54:46', 'cash'),
(68, 'NOR3HN', 100, 4, '2017-11-28 15:55:24', 'cash'),
(69, 'G61616', 100, 4, '2017-11-28 15:58:06', 'cash'),
(70, 'KHQTZ0', 100, 4, '2017-11-28 15:58:40', 'cash'),
(71, '2TRZY2', 100, 4, '2017-11-28 16:00:49', 'cash'),
(72, 'DYW963', 100, 4, '2017-11-28 16:01:39', 'cash'),
(73, 'UC541X', 150, 4, '2017-12-09 21:56:20', 'cash'),
(74, 'R7CE8B', 50, 4, '2017-12-09 22:04:03', 'cash'),
(75, 'AWQMAL', 50, 4, '2017-12-09 22:37:30', 'cash'),
(76, 'EEE0BJ', 50, 4, '2017-12-10 01:07:48', 'cash'),
(77, 'R1HWSV', 50, 4, '2017-12-10 01:10:59', 'cash'),
(78, 'R7D0JJ', 50, 4, '2017-12-10 01:46:21', 'cash'),
(79, '0QGAI8', 50, 4, '2017-12-10 01:53:39', 'cash'),
(80, '9BJU00', 50, 6, '2017-12-11 00:21:39', 'cash');

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_commandes_produits`
--

CREATE TABLE `tendoo_nexo_commandes_produits` (
  `ID` int(11) NOT NULL,
  `REF_PRODUCT_CODEBAR` varchar(250) NOT NULL,
  `RESTAURANT_PRODUCT_REAL_BARCODE` varchar(200) NOT NULL,
  `REF_COMMAND_CODE` varchar(250) NOT NULL,
  `QUANTITE` int(11) NOT NULL,
  `PRIX` float NOT NULL,
  `PRIX_TOTAL` float NOT NULL,
  `DISCOUNT_TYPE` varchar(200) NOT NULL,
  `DISCOUNT_AMOUNT` float NOT NULL,
  `DISCOUNT_PERCENT` float NOT NULL,
  `NAME` varchar(200) NOT NULL,
  `DESCRIPTION` text NOT NULL,
  `INLINE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tendoo_nexo_commandes_produits`
--

INSERT INTO `tendoo_nexo_commandes_produits` (`ID`, `REF_PRODUCT_CODEBAR`, `RESTAURANT_PRODUCT_REAL_BARCODE`, `REF_COMMAND_CODE`, `QUANTITE`, `PRIX`, `PRIX_TOTAL`, `DISCOUNT_TYPE`, `DISCOUNT_AMOUNT`, `DISCOUNT_PERCENT`, `NAME`, `DESCRIPTION`, `INLINE`) VALUES
(142, '211802', '211802', 'GBM2ZF', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(143, '211802', '211802', 'NH6X0C', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(144, '211802', '211802', 'PQ2SXH', 3, 50, 150, 'percentage', 0, 0, 'Test Item', '', 0),
(145, '211802', '211802', 'ZBY1JB', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(146, '211802', '211802', 'SKTA9E', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(147, '211802', '211802', 'SKTA9E', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(148, '211802', '211802', '12DQZN', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(149, '211802', '211802', 'WOHYIO', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(150, '211802', '211802', '719L3I', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(151, '211802', '211802', 'BJPKRR', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(152, '211802', '211802', 'UV870G', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(153, '211802', '211802', 'VLKR9W', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(154, '211802', '211802', 'WNDPV0', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(155, '211802', '211802', 'PC226T', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(156, '211802', '211802', 'P3QVPT', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(157, '211802', '211802', 'U07L5Q', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(158, '211802', '211802', '1VA0SY', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(159, '211802', '211802', 'O3YSXZ', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(160, '211802', '211802', '38JLW4', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(161, '211802', '211802', 'XBO3R3', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(162, '211802', '211802', 'LWFNFX', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(163, '211802', '211802', 'HOHJMB', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(164, '211802', '211802', '445HI7', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(165, '211802', '211802', '76BQQX', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(167, '211802', '211802', 'JK38NY', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(172, '211802', '211802', 'TD0PFE', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(173, '211802', '211802', 'TD0PFE', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(181, '211802', '211802', 'S8NJM0', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(182, '211802', '211802', 'S8NJM0', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(183, '211802', '211802', '81U2FC', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(184, '211802', '211802', '81U2FC', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(185, '211802', '211802', 'NX36SY', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(186, '211802', '211802', 'NX36SY', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(191, '211802', '211802', '6GA7OH', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(192, '211802', '211802', '6GA7OH', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(193, '211802', '211802', 'YXDFQ1', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(194, '211802', '211802', 'YXDFQ1', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(195, '211802', '211802', 'KKV1WP', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(196, '211802', '211802', 'KKV1WP', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(197, '211802', '211802', '38UJ5H', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(198, '211802', '211802', '38UJ5H', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(199, '211802', '211802', '38UJ5H', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(200, '211802', '211802', '4CVZ2X', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(201, '211802', '211802', '4CVZ2X', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(202, '211802', '211802', '4CVZ2X', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(203, '211802', '211802', 'G261KJ', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(204, '211802', '211802', 'G261KJ', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(205, '211802', '211802', 'CVV3TQ', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(206, '211802', '211802', 'CVV3TQ', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(207, '211802', '211802', 'CVV3TQ', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(208, '211802', '211802', 'F97T5S', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(209, '211802', '211802', 'QGO70J', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(210, '211802', '211802', 'QGO70J', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(211, '211802', '211802', 'J95KK2', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(212, '211802', '211802', 'CFUMEG', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(213, '211802', '211802', 'CFUMEG', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(214, '211802', '211802', '3881CJ', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(215, '211802', '211802', '3881CJ', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(216, '211802', '211802', 'U31US2', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(217, '211802', '211802', 'U31US2', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(218, '211802', '211802', 'UMWE98', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(219, '211802', '211802', 'UMWE98', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(220, '211802', '211802', 'M68V9P', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(221, '211802', '211802', 'M68V9P', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(222, '211802', '211802', 'M68V9P', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(223, '211802', '211802', 'M68V9P', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(224, '211802', '211802', '9Z3N8R', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(225, '211802', '211802', '9Z3N8R', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(226, '211802', '211802', 'QX8956', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(227, '211802', '211802', 'HL5YU1', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(228, '211802', '211802', 'HL5YU1', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(231, '211802', '211802', 'RBXT11', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(232, '211802', '211802', 'T8JZ77', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(233, '211802', '211802', 'H9RAZH', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(234, '211802', '211802', 'H9RAZH', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(235, '211802', '211802', '1F6VAB', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(236, '211802', '211802', '1F6VAB', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(237, '211802', '211802', '1F6VAB', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(238, '211802', '211802', '1F6VAB', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(239, '211802', '211802', '5XN2K0', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(240, '211802', '211802', '5XN2K0', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(241, '211802', '211802', 'BEK2BZ', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(242, '211802', '211802', 'BEK2BZ', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(243, '211802', '211802', 'VUP846', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(244, '211802', '211802', 'VUP846', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(245, '211802', '211802', 'DCDUX5', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(246, '211802', '211802', 'DCDUX5', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(247, '211802', '211802', 'IZB55U', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(248, '211802', '211802', 'IZB55U', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(249, '211802', '211802', 'X6IIVK', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(250, '211802', '211802', 'X6IIVK', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(251, '211802', '211802', '5TZW86', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(252, '211802', '211802', '5TZW86', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(253, '211802', '211802', '8BV0VT', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(254, '211802', '211802', '8BV0VT', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(255, '211802', '211802', 'MVPXYB', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(256, '211802', '211802', 'MVPXYB', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(257, '211802', '211802', 'TSXOOY', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(258, '211802', '211802', 'TSXOOY', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(259, '211802', '211802', '622HR1', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(260, '211802', '211802', '622HR1', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(261, '211802', '211802', 'L9SE84', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(262, '211802', '211802', 'OGJCRN', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(263, '211802', '211802', 'S3KTOD', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(264, '211802', '211802', 'S3KTOD', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(265, '211802', '211802', 'V6GSVK', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(266, '211802', '211802', 'V6GSVK', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(267, '211802', '211802', '7VA4JH', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(268, '211802', '211802', '7VA4JH', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(269, '211802', '211802', 'VZA42F', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(270, '211802', '211802', 'VZA42F', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(271, '211802', '211802', 'NOR3HN', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(272, '211802', '211802', 'NOR3HN', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(273, '211802', '211802', 'G61616', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(274, '211802', '211802', 'G61616', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(275, '211802', '211802', 'KHQTZ0', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(276, '211802', '211802', 'KHQTZ0', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(277, '211802', '211802', '2TRZY2', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(278, '211802', '211802', '2TRZY2', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(279, '211802', '211802', 'DYW963', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(280, '211802', '211802', 'UC541X', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(281, '211802', '211802', 'UC541X', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(282, '211802', '211802', 'UC541X', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(283, '211802', '211802', 'R7CE8B', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(284, '211802', '211802', 'AWQMAL', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(285, '211802', '211802', 'RHSUCY', 1, 50, 50, 'percentage', 0, 0, 'Test Item (?????)', '', 1),
(286, '211802', '211802', 'XQ3F4J', 1, 50, 50, 'percentage', 0, 0, 'Test Item (?????)', '', 1),
(287, '211802', '211802', 'BS29DA', 1, 50, 50, 'percentage', 0, 0, 'Test Item (?????)', '', 1),
(288, '211802', '211802', 'YZSAVX', 1, 50, 50, 'percentage', 0, 0, 'Test Item (?????)', '', 1),
(289, '211802', '211802', 'HBW8C3', 1, 50, 50, 'percentage', 0, 0, 'Test Item (?????)', '', 1),
(290, '211802', '211802', 'A2TUCR', 1, 50, 50, 'percentage', 0, 0, 'Test Item (?????)', '', 1),
(291, '211802', '211802', '0SDFUE', 1, 50, 50, 'percentage', 0, 0, 'Test Item (?????)', '', 1),
(292, '211802', '211802', '39V0A0', 1, 50, 50, 'percentage', 0, 0, 'Test Item (?????)', '', 1),
(293, '211802', '211802', 'DOKS60', 1, 50, 50, 'percentage', 0, 0, 'Test Item (?????)', '', 1),
(294, '211802', '211802', 'Z0IUQ2', 1, 50, 50, 'percentage', 0, 0, 'Test Item (?????)', '', 1),
(295, '211802', '211802', '6WW3IY', 1, 50, 50, 'percentage', 0, 0, 'Test Item (?????)', '', 1),
(296, '211802', '211802', 'FLZNF8', 1, 50, 50, 'percentage', 0, 0, 'Test Item (?????)', '', 1),
(297, '211802', '211802', 'PPNEF0', 1, 50, 50, 'percentage', 0, 0, 'Test Item (?????)', '', 1),
(298, '211802', '211802', 'EEE0BJ', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(299, '211802', '211802', 'R1HWSV', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(300, '211802', '211802', 'FU73D4', 1, 50, 50, 'percentage', 0, 0, 'Test Item (?????)', '', 1),
(301, '211802', '211802', '90W47H', 1, 50, 50, 'percentage', 0, 0, 'Test Item (?????)', '', 1),
(302, '211802', '211802', '98X6TO', 1, 50, 50, 'percentage', 0, 0, 'Test Item (?????)', '', 1),
(303, '211802', '211802', '6DCPEH', 1, 50, 50, 'percentage', 0, 0, 'Test Item (?????)', '', 1),
(304, '211802', '211802', '1QMLX1', 1, 50, 50, 'percentage', 0, 0, 'Test Item (?????)', '', 1),
(305, '211802', '211802', '5ATEIN', 1, 50, 50, 'percentage', 0, 0, 'Test Item (?????)', '', 1),
(306, '211802', '211802', 'R7D0JJ', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(307, '211802', '211802', '0QGAI8', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 0),
(309, '211802', '211802', '9BJU00', 1, 50, 50, 'percentage', 0, 0, 'Test Item', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_commandes_produits_meta`
--

CREATE TABLE `tendoo_nexo_commandes_produits_meta` (
  `ID` int(11) NOT NULL,
  `REF_COMMAND_PRODUCT` int(11) NOT NULL,
  `REF_COMMAND_CODE` varchar(200) NOT NULL,
  `KEY` varchar(250) NOT NULL,
  `VALUE` text NOT NULL,
  `DATE_CREATION` datetime NOT NULL,
  `DATE_MODIFICATION` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tendoo_nexo_commandes_produits_meta`
--

INSERT INTO `tendoo_nexo_commandes_produits_meta` (`ID`, `REF_COMMAND_PRODUCT`, `REF_COMMAND_CODE`, `KEY`, `VALUE`, `DATE_CREATION`, `DATE_MODIFICATION`) VALUES
(307, 101, '8KSHKB', 'restaurant_note', '', '2017-11-24 13:06:19', '0000-00-00 00:00:00'),
(308, 101, '8KSHKB', 'restaurant_food_status', 'not_ready', '2017-11-24 13:06:19', '0000-00-00 00:00:00'),
(309, 101, '8KSHKB', 'restaurant_food_issue', '', '2017-11-24 13:06:19', '0000-00-00 00:00:00'),
(310, 102, 'TIOCWS', 'restaurant_note', '', '2017-11-24 13:11:38', '0000-00-00 00:00:00'),
(311, 102, 'TIOCWS', 'restaurant_food_status', 'not_ready', '2017-11-24 13:11:38', '0000-00-00 00:00:00'),
(312, 102, 'TIOCWS', 'restaurant_food_issue', '', '2017-11-24 13:11:38', '0000-00-00 00:00:00'),
(313, 103, 'RG2BHT', 'restaurant_note', '', '2017-11-24 13:15:19', '0000-00-00 00:00:00'),
(314, 103, 'RG2BHT', 'restaurant_food_status', 'not_ready', '2017-11-24 13:15:19', '0000-00-00 00:00:00'),
(315, 103, 'RG2BHT', 'restaurant_food_issue', '', '2017-11-24 13:15:19', '0000-00-00 00:00:00'),
(316, 104, '4UTLTD', 'restaurant_note', '', '2017-11-24 13:30:38', '0000-00-00 00:00:00'),
(317, 104, '4UTLTD', 'restaurant_food_status', 'not_ready', '2017-11-24 13:30:38', '0000-00-00 00:00:00'),
(318, 104, '4UTLTD', 'restaurant_food_issue', '', '2017-11-24 13:30:38', '0000-00-00 00:00:00'),
(319, 105, 'I9ROO9', 'restaurant_note', '', '2017-11-24 15:01:01', '0000-00-00 00:00:00'),
(320, 105, 'I9ROO9', 'restaurant_food_status', 'not_ready', '2017-11-24 15:01:01', '0000-00-00 00:00:00'),
(321, 105, 'I9ROO9', 'restaurant_food_issue', '', '2017-11-24 15:01:01', '0000-00-00 00:00:00'),
(322, 106, 'YANTQV', 'restaurant_note', '', '2017-11-24 15:03:57', '0000-00-00 00:00:00'),
(323, 106, 'YANTQV', 'restaurant_food_status', 'not_ready', '2017-11-24 15:03:57', '0000-00-00 00:00:00'),
(324, 106, 'YANTQV', 'restaurant_food_issue', '', '2017-11-24 15:03:57', '0000-00-00 00:00:00'),
(325, 107, 'P0EAYK', 'restaurant_note', '', '2017-11-24 15:10:28', '0000-00-00 00:00:00'),
(326, 107, 'P0EAYK', 'restaurant_food_status', 'not_ready', '2017-11-24 15:10:28', '0000-00-00 00:00:00'),
(327, 107, 'P0EAYK', 'restaurant_food_issue', '', '2017-11-24 15:10:28', '0000-00-00 00:00:00'),
(328, 108, 'NSUUFB', 'restaurant_note', '', '2017-11-24 15:14:51', '0000-00-00 00:00:00'),
(329, 108, 'NSUUFB', 'restaurant_food_status', 'not_ready', '2017-11-24 15:14:51', '0000-00-00 00:00:00'),
(330, 108, 'NSUUFB', 'restaurant_food_issue', '', '2017-11-24 15:14:51', '0000-00-00 00:00:00'),
(331, 109, 'CXMQ4M', 'restaurant_note', '', '2017-11-24 15:27:44', '0000-00-00 00:00:00'),
(332, 109, 'CXMQ4M', 'restaurant_food_status', 'not_ready', '2017-11-24 15:27:44', '0000-00-00 00:00:00'),
(333, 109, 'CXMQ4M', 'modifiers', '[{"name":"Extra chess","description":"","author":"3","cateogry":"1","default":"1","price":"0.2","image":"","group_forced":"1","group_multiselect":"1","0":"object:115"}]', '2017-11-24 15:27:44', '0000-00-00 00:00:00'),
(334, 109, 'CXMQ4M', 'restaurant_food_issue', '', '2017-11-24 15:27:44', '0000-00-00 00:00:00'),
(335, 110, 'CXMQ4M', 'restaurant_note', '', '2017-11-24 15:27:44', '0000-00-00 00:00:00'),
(336, 110, 'CXMQ4M', 'restaurant_food_status', 'not_ready', '2017-11-24 15:27:44', '0000-00-00 00:00:00'),
(337, 110, 'CXMQ4M', 'modifiers', '[{"name":"Extra chess","description":"","author":"3","cateogry":"1","default":"1","price":"0.2","image":"","group_forced":"1","group_multiselect":"1","0":"object:111"}]', '2017-11-24 15:27:44', '0000-00-00 00:00:00'),
(338, 110, 'CXMQ4M', 'restaurant_food_issue', '', '2017-11-24 15:27:44', '0000-00-00 00:00:00'),
(339, 111, 'CXMQ4M', 'restaurant_note', '', '2017-11-24 15:27:44', '0000-00-00 00:00:00'),
(340, 111, 'CXMQ4M', 'restaurant_food_status', 'not_ready', '2017-11-24 15:27:44', '0000-00-00 00:00:00'),
(341, 111, 'CXMQ4M', 'restaurant_food_issue', '', '2017-11-24 15:27:44', '0000-00-00 00:00:00'),
(342, 112, 'CXMQ4M', 'restaurant_note', '', '2017-11-24 15:27:44', '0000-00-00 00:00:00'),
(343, 112, 'CXMQ4M', 'restaurant_food_status', 'not_ready', '2017-11-24 15:27:44', '0000-00-00 00:00:00'),
(344, 112, 'CXMQ4M', 'restaurant_food_issue', '', '2017-11-24 15:27:44', '0000-00-00 00:00:00'),
(345, 113, 'LEU55R', 'restaurant_note', '', '2017-11-24 15:58:45', '0000-00-00 00:00:00'),
(346, 113, 'LEU55R', 'restaurant_food_status', 'not_ready', '2017-11-24 15:58:45', '0000-00-00 00:00:00'),
(347, 113, 'LEU55R', 'restaurant_food_issue', '', '2017-11-24 15:58:45', '0000-00-00 00:00:00'),
(348, 114, 'LEU55R', 'restaurant_note', '', '2017-11-24 15:58:46', '0000-00-00 00:00:00'),
(349, 114, 'LEU55R', 'restaurant_food_status', 'not_ready', '2017-11-24 15:58:46', '0000-00-00 00:00:00'),
(350, 114, 'LEU55R', 'modifiers', '[{"name":"Extra Onion","description":"","author":"3","cateogry":"1","default":"1","price":"0","image":"","group_forced":"1","group_multiselect":"1","0":"object:114"}]', '2017-11-24 15:58:46', '0000-00-00 00:00:00'),
(351, 114, 'LEU55R', 'restaurant_food_issue', '', '2017-11-24 15:58:46', '0000-00-00 00:00:00'),
(352, 115, 'LEU55R', 'restaurant_note', '', '2017-11-24 15:58:46', '0000-00-00 00:00:00'),
(353, 115, 'LEU55R', 'restaurant_food_status', 'not_ready', '2017-11-24 15:58:46', '0000-00-00 00:00:00'),
(354, 115, 'LEU55R', 'modifiers', '[{"name":"Extra chess","description":"","author":"3","cateogry":"1","default":"1","price":"0.2","image":"","group_forced":"1","group_multiselect":"1","0":"object:111"}]', '2017-11-24 15:58:46', '0000-00-00 00:00:00'),
(355, 115, 'LEU55R', 'restaurant_food_issue', '', '2017-11-24 15:58:46', '0000-00-00 00:00:00'),
(356, 116, 'LEU55R', 'restaurant_note', '', '2017-11-24 15:58:46', '0000-00-00 00:00:00'),
(357, 116, 'LEU55R', 'restaurant_food_status', 'not_ready', '2017-11-24 15:58:46', '0000-00-00 00:00:00'),
(358, 116, 'LEU55R', 'restaurant_food_issue', '', '2017-11-24 15:58:46', '0000-00-00 00:00:00'),
(359, 117, 'BVEKLH', 'restaurant_note', '', '2017-11-24 16:22:39', '0000-00-00 00:00:00'),
(360, 117, 'BVEKLH', 'restaurant_food_status', 'not_ready', '2017-11-24 16:22:39', '0000-00-00 00:00:00'),
(361, 117, 'BVEKLH', 'restaurant_food_issue', '', '2017-11-24 16:22:39', '0000-00-00 00:00:00'),
(362, 118, 'BVEKLH', 'restaurant_note', '', '2017-11-24 16:22:39', '0000-00-00 00:00:00'),
(363, 118, 'BVEKLH', 'restaurant_food_status', 'not_ready', '2017-11-24 16:22:39', '0000-00-00 00:00:00'),
(364, 118, 'BVEKLH', 'modifiers', '[{"name":"Extra chess","description":"","author":"3","cateogry":"1","default":"1","price":"0.2","image":"","group_forced":"1","group_multiselect":"1","0":"object:115"}]', '2017-11-24 16:22:39', '0000-00-00 00:00:00'),
(365, 118, 'BVEKLH', 'restaurant_food_issue', '', '2017-11-24 16:22:39', '0000-00-00 00:00:00'),
(366, 119, 'BVEKLH', 'restaurant_note', '', '2017-11-24 16:22:39', '0000-00-00 00:00:00'),
(367, 119, 'BVEKLH', 'restaurant_food_status', 'not_ready', '2017-11-24 16:22:39', '0000-00-00 00:00:00'),
(368, 119, 'BVEKLH', 'modifiers', '[{"name":"Extra chess","description":"","author":"3","cateogry":"1","default":"1","price":"0.2","image":"","group_forced":"1","group_multiselect":"1","0":"object:111"}]', '2017-11-24 16:22:39', '0000-00-00 00:00:00'),
(369, 119, 'BVEKLH', 'restaurant_food_issue', '', '2017-11-24 16:22:39', '0000-00-00 00:00:00'),
(370, 120, 'BVEKLH', 'restaurant_note', '', '2017-11-24 16:22:39', '0000-00-00 00:00:00'),
(371, 120, 'BVEKLH', 'restaurant_food_status', 'not_ready', '2017-11-24 16:22:39', '0000-00-00 00:00:00'),
(372, 120, 'BVEKLH', 'restaurant_food_issue', '', '2017-11-24 16:22:39', '0000-00-00 00:00:00'),
(373, 121, '0C2GAA', 'restaurant_note', 'ASD', '2017-11-24 17:31:25', '0000-00-00 00:00:00'),
(374, 121, '0C2GAA', 'restaurant_food_status', 'not_ready', '2017-11-24 17:31:25', '0000-00-00 00:00:00'),
(375, 121, '0C2GAA', 'modifiers', '[{"name":"Extra chess","description":"","author":"3","cateogry":"1","default":"1","price":"0.2","image":"","group_forced":"1","group_multiselect":"1","0":"object:129"}]', '2017-11-24 17:31:25', '0000-00-00 00:00:00'),
(376, 121, '0C2GAA', 'restaurant_food_issue', '', '2017-11-24 17:31:25', '0000-00-00 00:00:00'),
(377, 122, '0C2GAA', 'restaurant_note', 'FEFE', '2017-11-24 17:31:25', '0000-00-00 00:00:00'),
(378, 122, '0C2GAA', 'restaurant_food_status', 'not_ready', '2017-11-24 17:31:25', '0000-00-00 00:00:00'),
(379, 122, '0C2GAA', 'restaurant_food_issue', '', '2017-11-24 17:31:25', '0000-00-00 00:00:00'),
(380, 123, '0C2GAA', 'restaurant_note', '', '2017-11-24 17:31:25', '0000-00-00 00:00:00'),
(381, 123, '0C2GAA', 'restaurant_food_status', 'not_ready', '2017-11-24 17:31:25', '0000-00-00 00:00:00'),
(382, 123, '0C2GAA', 'restaurant_food_issue', '', '2017-11-24 17:31:25', '0000-00-00 00:00:00'),
(383, 124, '4CGOZ7', 'restaurant_note', '', '2017-11-24 17:37:09', '0000-00-00 00:00:00'),
(384, 124, '4CGOZ7', 'restaurant_food_status', 'not_ready', '2017-11-24 17:37:09', '0000-00-00 00:00:00'),
(385, 124, '4CGOZ7', 'modifiers', '[{"name":"Extra chess","description":"","author":"3","cateogry":"1","default":"1","price":"0.2","image":"","group_forced":"1","group_multiselect":"1","0":"object:111"}]', '2017-11-24 17:37:09', '0000-00-00 00:00:00'),
(386, 124, '4CGOZ7', 'restaurant_food_issue', '', '2017-11-24 17:37:09', '0000-00-00 00:00:00'),
(387, 125, '4CGOZ7', 'restaurant_note', '', '2017-11-24 17:37:09', '0000-00-00 00:00:00'),
(388, 125, '4CGOZ7', 'restaurant_food_status', 'not_ready', '2017-11-24 17:37:09', '0000-00-00 00:00:00'),
(389, 125, '4CGOZ7', 'restaurant_food_issue', '', '2017-11-24 17:37:09', '0000-00-00 00:00:00'),
(390, 126, '4CGOZ7', 'restaurant_note', '', '2017-11-24 17:37:10', '0000-00-00 00:00:00'),
(391, 126, '4CGOZ7', 'restaurant_food_status', 'not_ready', '2017-11-24 17:37:10', '0000-00-00 00:00:00'),
(392, 126, '4CGOZ7', 'restaurant_food_issue', '', '2017-11-24 17:37:10', '0000-00-00 00:00:00'),
(393, 127, 'TXDJ3V', 'restaurant_note', '', '2017-11-24 17:40:22', '0000-00-00 00:00:00'),
(394, 127, 'TXDJ3V', 'restaurant_food_status', 'not_ready', '2017-11-24 17:40:22', '0000-00-00 00:00:00'),
(395, 127, 'TXDJ3V', 'modifiers', '[{"name":"Extra chess","description":"","author":"3","cateogry":"1","default":"1","price":"0.2","image":"","group_forced":"1","group_multiselect":"1","0":"object:111"}]', '2017-11-24 17:40:22', '0000-00-00 00:00:00'),
(396, 127, 'TXDJ3V', 'restaurant_food_issue', '', '2017-11-24 17:40:22', '0000-00-00 00:00:00'),
(397, 128, 'TXDJ3V', 'restaurant_note', '', '2017-11-24 17:40:22', '0000-00-00 00:00:00'),
(398, 128, 'TXDJ3V', 'restaurant_food_status', 'not_ready', '2017-11-24 17:40:22', '0000-00-00 00:00:00'),
(399, 128, 'TXDJ3V', 'restaurant_food_issue', '', '2017-11-24 17:40:22', '0000-00-00 00:00:00'),
(400, 129, 'YJESE4', 'restaurant_note', '123212', '2017-11-24 17:43:09', '0000-00-00 00:00:00'),
(401, 129, 'YJESE4', 'restaurant_food_status', 'not_ready', '2017-11-24 17:43:09', '0000-00-00 00:00:00'),
(402, 129, 'YJESE4', 'restaurant_food_issue', '', '2017-11-24 17:43:09', '0000-00-00 00:00:00'),
(403, 130, 'FH0VL6', 'restaurant_note', '', '2017-11-24 17:45:22', '0000-00-00 00:00:00'),
(404, 130, 'FH0VL6', 'restaurant_food_status', 'not_ready', '2017-11-24 17:45:22', '0000-00-00 00:00:00'),
(405, 130, 'FH0VL6', 'restaurant_food_issue', '', '2017-11-24 17:45:22', '0000-00-00 00:00:00'),
(406, 131, 'NSMNO2', 'restaurant_note', '', '2017-11-24 17:51:22', '0000-00-00 00:00:00'),
(407, 131, 'NSMNO2', 'restaurant_food_status', 'not_ready', '2017-11-24 17:51:22', '0000-00-00 00:00:00'),
(408, 131, 'NSMNO2', 'restaurant_food_issue', '', '2017-11-24 17:51:22', '0000-00-00 00:00:00'),
(409, 132, '1ABMDX', 'restaurant_note', '', '2017-11-24 17:54:38', '0000-00-00 00:00:00'),
(410, 132, '1ABMDX', 'restaurant_food_status', 'not_ready', '2017-11-24 17:54:38', '0000-00-00 00:00:00'),
(411, 132, '1ABMDX', 'restaurant_food_issue', '', '2017-11-24 17:54:38', '0000-00-00 00:00:00'),
(412, 133, 'IBZ5ZK', 'restaurant_note', '', '2017-11-24 17:57:41', '0000-00-00 00:00:00'),
(413, 133, 'IBZ5ZK', 'restaurant_food_status', 'not_ready', '2017-11-24 17:57:41', '0000-00-00 00:00:00'),
(414, 133, 'IBZ5ZK', 'restaurant_food_issue', '', '2017-11-24 17:57:41', '0000-00-00 00:00:00'),
(415, 134, 'CC47P0', 'restaurant_note', '', '2017-11-24 18:00:56', '0000-00-00 00:00:00'),
(416, 134, 'CC47P0', 'restaurant_food_status', 'not_ready', '2017-11-24 18:00:56', '0000-00-00 00:00:00'),
(417, 134, 'CC47P0', 'restaurant_food_issue', '', '2017-11-24 18:00:56', '0000-00-00 00:00:00'),
(418, 135, 'GEZOQO', 'restaurant_note', 'qwer', '2017-11-24 18:07:34', '0000-00-00 00:00:00'),
(419, 135, 'GEZOQO', 'restaurant_food_status', 'not_ready', '2017-11-24 18:07:34', '0000-00-00 00:00:00'),
(420, 135, 'GEZOQO', 'restaurant_food_issue', '', '2017-11-24 18:07:34', '0000-00-00 00:00:00'),
(421, 136, '6GSGVS', 'restaurant_note', 'PI', '2017-11-24 18:12:20', '0000-00-00 00:00:00'),
(422, 136, '6GSGVS', 'restaurant_food_status', 'not_ready', '2017-11-24 18:12:20', '0000-00-00 00:00:00'),
(423, 136, '6GSGVS', 'modifiers', '[{"name":"Extra chess","description":"","author":"3","cateogry":"1","default":"1","price":"0.2","image":"","group_forced":"1","group_multiselect":"1","0":"object:111"}]', '2017-11-24 18:12:20', '0000-00-00 00:00:00'),
(424, 136, '6GSGVS', 'restaurant_food_issue', '', '2017-11-24 18:12:20', '0000-00-00 00:00:00'),
(425, 137, '6GSGVS', 'restaurant_note', 'TEST', '2017-11-24 18:12:20', '0000-00-00 00:00:00'),
(426, 137, '6GSGVS', 'restaurant_food_status', 'not_ready', '2017-11-24 18:12:20', '0000-00-00 00:00:00'),
(427, 137, '6GSGVS', 'restaurant_food_issue', '', '2017-11-24 18:12:20', '0000-00-00 00:00:00'),
(428, 138, '6GSGVS', 'restaurant_note', '', '2017-11-24 18:12:20', '0000-00-00 00:00:00'),
(429, 138, '6GSGVS', 'restaurant_food_status', 'not_ready', '2017-11-24 18:12:20', '0000-00-00 00:00:00'),
(430, 138, '6GSGVS', 'restaurant_food_issue', '', '2017-11-24 18:12:20', '0000-00-00 00:00:00'),
(431, 139, 'PY9YV5', 'restaurant_note', 'QW', '2017-11-24 18:14:09', '0000-00-00 00:00:00'),
(432, 139, 'PY9YV5', 'restaurant_food_status', 'not_ready', '2017-11-24 18:14:09', '0000-00-00 00:00:00'),
(433, 139, 'PY9YV5', 'modifiers', '[{"name":"Extra chess","description":"","author":"3","cateogry":"1","default":"1","price":"0.2","image":"","group_forced":"1","group_multiselect":"1","0":"object:115"}]', '2017-11-24 18:14:09', '0000-00-00 00:00:00'),
(434, 139, 'PY9YV5', 'restaurant_food_issue', '', '2017-11-24 18:14:09', '0000-00-00 00:00:00'),
(435, 140, 'PY9YV5', 'restaurant_note', 'TEST', '2017-11-24 18:14:09', '0000-00-00 00:00:00'),
(436, 140, 'PY9YV5', 'restaurant_food_status', 'not_ready', '2017-11-24 18:14:09', '0000-00-00 00:00:00'),
(437, 140, 'PY9YV5', 'restaurant_food_issue', '', '2017-11-24 18:14:09', '0000-00-00 00:00:00'),
(438, 141, 'PY9YV5', 'restaurant_note', '', '2017-11-24 18:14:09', '0000-00-00 00:00:00'),
(439, 141, 'PY9YV5', 'restaurant_food_status', 'not_ready', '2017-11-24 18:14:09', '0000-00-00 00:00:00'),
(440, 141, 'PY9YV5', 'restaurant_food_issue', '', '2017-11-24 18:14:09', '0000-00-00 00:00:00'),
(441, 142, 'GBM2ZF', 'restaurant_note', '', '2017-11-25 03:13:08', '0000-00-00 00:00:00'),
(442, 142, 'GBM2ZF', 'restaurant_food_status', 'not_ready', '2017-11-25 03:13:08', '0000-00-00 00:00:00'),
(443, 142, 'GBM2ZF', 'restaurant_food_issue', '', '2017-11-25 03:13:08', '0000-00-00 00:00:00'),
(444, 143, 'NH6X0C', 'restaurant_note', '', '2017-11-25 03:46:32', '0000-00-00 00:00:00'),
(445, 143, 'NH6X0C', 'restaurant_food_status', 'not_ready', '2017-11-25 03:46:32', '0000-00-00 00:00:00'),
(446, 143, 'NH6X0C', 'restaurant_food_issue', '', '2017-11-25 03:46:32', '0000-00-00 00:00:00'),
(447, 144, 'PQ2SXH', 'restaurant_note', '', '2017-11-25 03:48:46', '0000-00-00 00:00:00'),
(448, 144, 'PQ2SXH', 'restaurant_food_status', 'not_ready', '2017-11-25 03:48:46', '0000-00-00 00:00:00'),
(449, 144, 'PQ2SXH', 'restaurant_food_issue', '', '2017-11-25 03:48:46', '0000-00-00 00:00:00'),
(450, 145, 'ZBY1JB', 'restaurant_note', '', '2017-11-25 04:08:14', '0000-00-00 00:00:00'),
(451, 145, 'ZBY1JB', 'restaurant_food_status', 'not_ready', '2017-11-25 04:08:14', '0000-00-00 00:00:00'),
(452, 145, 'ZBY1JB', 'restaurant_food_issue', '', '2017-11-25 04:08:14', '0000-00-00 00:00:00'),
(453, 146, 'SKTA9E', 'restaurant_note', '', '2017-11-25 04:14:39', '0000-00-00 00:00:00'),
(454, 146, 'SKTA9E', 'restaurant_food_status', 'not_ready', '2017-11-25 04:14:39', '0000-00-00 00:00:00'),
(455, 146, 'SKTA9E', 'restaurant_food_issue', '', '2017-11-25 04:14:39', '0000-00-00 00:00:00'),
(456, 147, 'SKTA9E', 'restaurant_note', '', '2017-11-25 04:14:39', '0000-00-00 00:00:00'),
(457, 147, 'SKTA9E', 'restaurant_food_status', 'not_ready', '2017-11-25 04:14:39', '0000-00-00 00:00:00'),
(458, 147, 'SKTA9E', 'restaurant_food_issue', '', '2017-11-25 04:14:39', '0000-00-00 00:00:00'),
(459, 148, '12DQZN', 'restaurant_note', '', '2017-11-25 06:05:03', '0000-00-00 00:00:00'),
(460, 148, '12DQZN', 'restaurant_food_status', 'not_ready', '2017-11-25 06:05:03', '0000-00-00 00:00:00'),
(461, 148, '12DQZN', 'restaurant_food_issue', '', '2017-11-25 06:05:03', '0000-00-00 00:00:00'),
(462, 149, 'WOHYIO', 'restaurant_note', '', '2017-11-25 06:11:34', '0000-00-00 00:00:00'),
(463, 149, 'WOHYIO', 'restaurant_food_status', 'not_ready', '2017-11-25 06:11:34', '0000-00-00 00:00:00'),
(464, 149, 'WOHYIO', 'restaurant_food_issue', '', '2017-11-25 06:11:34', '0000-00-00 00:00:00'),
(465, 150, '719L3I', 'restaurant_note', '', '2017-11-25 06:15:42', '0000-00-00 00:00:00'),
(466, 150, '719L3I', 'restaurant_food_status', 'not_ready', '2017-11-25 06:15:42', '0000-00-00 00:00:00'),
(467, 150, '719L3I', 'restaurant_food_issue', '', '2017-11-25 06:15:42', '0000-00-00 00:00:00'),
(468, 151, 'BJPKRR', 'restaurant_note', '', '2017-11-25 06:22:46', '0000-00-00 00:00:00'),
(469, 151, 'BJPKRR', 'restaurant_food_status', 'not_ready', '2017-11-25 06:22:46', '0000-00-00 00:00:00'),
(470, 151, 'BJPKRR', 'restaurant_food_issue', '', '2017-11-25 06:22:46', '0000-00-00 00:00:00'),
(471, 152, 'UV870G', 'restaurant_note', '', '2017-11-25 06:27:50', '0000-00-00 00:00:00'),
(472, 152, 'UV870G', 'restaurant_food_status', 'not_ready', '2017-11-25 06:27:50', '0000-00-00 00:00:00'),
(473, 152, 'UV870G', 'restaurant_food_issue', '', '2017-11-25 06:27:50', '0000-00-00 00:00:00'),
(474, 153, 'VLKR9W', 'restaurant_note', '', '2017-11-25 06:54:27', '0000-00-00 00:00:00'),
(475, 153, 'VLKR9W', 'restaurant_food_status', 'not_ready', '2017-11-25 06:54:27', '0000-00-00 00:00:00'),
(476, 153, 'VLKR9W', 'restaurant_food_issue', '', '2017-11-25 06:54:27', '0000-00-00 00:00:00'),
(477, 154, 'WNDPV0', 'restaurant_note', '', '2017-11-25 06:59:55', '0000-00-00 00:00:00'),
(478, 154, 'WNDPV0', 'restaurant_food_status', 'not_ready', '2017-11-25 06:59:55', '0000-00-00 00:00:00'),
(479, 154, 'WNDPV0', 'restaurant_food_issue', '', '2017-11-25 06:59:55', '0000-00-00 00:00:00'),
(480, 155, 'PC226T', 'restaurant_note', '', '2017-11-25 07:04:43', '0000-00-00 00:00:00'),
(481, 155, 'PC226T', 'restaurant_food_status', 'not_ready', '2017-11-25 07:04:43', '0000-00-00 00:00:00'),
(482, 155, 'PC226T', 'restaurant_food_issue', '', '2017-11-25 07:04:43', '0000-00-00 00:00:00'),
(483, 156, 'P3QVPT', 'restaurant_note', '', '2017-11-25 07:12:59', '0000-00-00 00:00:00'),
(484, 156, 'P3QVPT', 'restaurant_food_status', 'not_ready', '2017-11-25 07:12:59', '0000-00-00 00:00:00'),
(485, 156, 'P3QVPT', 'restaurant_food_issue', '', '2017-11-25 07:12:59', '0000-00-00 00:00:00'),
(486, 157, 'U07L5Q', 'restaurant_note', '', '2017-11-25 07:20:53', '0000-00-00 00:00:00'),
(487, 157, 'U07L5Q', 'restaurant_food_status', 'not_ready', '2017-11-25 07:20:53', '0000-00-00 00:00:00'),
(488, 157, 'U07L5Q', 'restaurant_food_issue', '', '2017-11-25 07:20:53', '0000-00-00 00:00:00'),
(489, 158, '1VA0SY', 'restaurant_note', '', '2017-11-25 07:25:38', '0000-00-00 00:00:00'),
(490, 158, '1VA0SY', 'restaurant_food_status', 'not_ready', '2017-11-25 07:25:38', '0000-00-00 00:00:00'),
(491, 158, '1VA0SY', 'restaurant_food_issue', '', '2017-11-25 07:25:38', '0000-00-00 00:00:00'),
(492, 159, 'O3YSXZ', 'restaurant_note', '', '2017-11-25 07:28:18', '0000-00-00 00:00:00'),
(493, 159, 'O3YSXZ', 'restaurant_food_status', 'not_ready', '2017-11-25 07:28:18', '0000-00-00 00:00:00'),
(494, 159, 'O3YSXZ', 'restaurant_food_issue', '', '2017-11-25 07:28:18', '0000-00-00 00:00:00'),
(495, 160, '38JLW4', 'restaurant_note', '', '2017-11-25 07:36:15', '0000-00-00 00:00:00'),
(496, 160, '38JLW4', 'restaurant_food_status', 'not_ready', '2017-11-25 07:36:15', '0000-00-00 00:00:00'),
(497, 160, '38JLW4', 'restaurant_food_issue', '', '2017-11-25 07:36:15', '0000-00-00 00:00:00'),
(498, 161, 'XBO3R3', 'restaurant_note', '', '2017-11-25 07:38:59', '0000-00-00 00:00:00'),
(499, 161, 'XBO3R3', 'restaurant_food_status', 'not_ready', '2017-11-25 07:38:59', '0000-00-00 00:00:00'),
(500, 161, 'XBO3R3', 'restaurant_food_issue', '', '2017-11-25 07:38:59', '0000-00-00 00:00:00'),
(501, 162, 'LWFNFX', 'restaurant_note', '', '2017-11-25 08:20:02', '0000-00-00 00:00:00'),
(502, 162, 'LWFNFX', 'restaurant_food_status', 'not_ready', '2017-11-25 08:20:02', '0000-00-00 00:00:00'),
(503, 162, 'LWFNFX', 'restaurant_food_issue', '', '2017-11-25 08:20:02', '0000-00-00 00:00:00'),
(504, 163, 'HOHJMB', 'restaurant_note', '', '2017-11-25 08:26:01', '0000-00-00 00:00:00'),
(505, 163, 'HOHJMB', 'restaurant_food_status', 'not_ready', '2017-11-25 08:26:01', '0000-00-00 00:00:00'),
(506, 163, 'HOHJMB', 'restaurant_food_issue', '', '2017-11-25 08:26:01', '0000-00-00 00:00:00'),
(507, 164, '445HI7', 'restaurant_note', '', '2017-11-25 08:29:17', '0000-00-00 00:00:00'),
(508, 164, '445HI7', 'restaurant_food_status', 'not_ready', '2017-11-25 08:29:17', '0000-00-00 00:00:00'),
(509, 164, '445HI7', 'restaurant_food_issue', '', '2017-11-25 08:29:17', '0000-00-00 00:00:00'),
(510, 165, '76BQQX', 'restaurant_note', '', '2017-11-25 09:28:07', '0000-00-00 00:00:00'),
(511, 165, '76BQQX', 'restaurant_food_status', 'not_ready', '2017-11-25 09:28:08', '0000-00-00 00:00:00'),
(512, 165, '76BQQX', 'restaurant_food_issue', '', '2017-11-25 09:28:08', '0000-00-00 00:00:00'),
(513, 166, '2BVIFJ', 'restaurant_note', '', '2017-11-26 13:33:01', '0000-00-00 00:00:00'),
(514, 166, '2BVIFJ', 'restaurant_food_status', 'not_ready', '2017-11-26 13:33:01', '0000-00-00 00:00:00'),
(515, 166, '2BVIFJ', 'restaurant_food_issue', '', '2017-11-26 13:33:01', '0000-00-00 00:00:00'),
(516, 167, 'JK38NY', 'restaurant_note', '', '2017-11-26 13:34:11', '0000-00-00 00:00:00'),
(517, 167, 'JK38NY', 'restaurant_food_status', 'not_ready', '2017-11-26 13:34:11', '0000-00-00 00:00:00'),
(518, 167, 'JK38NY', 'restaurant_food_issue', '', '2017-11-26 13:34:11', '0000-00-00 00:00:00'),
(519, 168, 'PH1GA3', 'restaurant_note', '', '2017-11-26 13:34:48', '0000-00-00 00:00:00'),
(520, 168, 'PH1GA3', 'restaurant_food_status', 'not_ready', '2017-11-26 13:34:48', '0000-00-00 00:00:00'),
(521, 168, 'PH1GA3', 'restaurant_food_issue', '', '2017-11-26 13:34:48', '0000-00-00 00:00:00'),
(522, 169, 'C6TD6T', 'restaurant_note', '', '2017-11-26 13:36:11', '0000-00-00 00:00:00'),
(523, 169, 'C6TD6T', 'restaurant_food_status', 'not_ready', '2017-11-26 13:36:11', '0000-00-00 00:00:00'),
(524, 169, 'C6TD6T', 'restaurant_food_issue', '', '2017-11-26 13:36:11', '0000-00-00 00:00:00'),
(525, 170, 'C6TD6T', 'restaurant_note', '', '2017-11-26 13:36:12', '0000-00-00 00:00:00'),
(526, 170, 'C6TD6T', 'restaurant_food_status', 'not_ready', '2017-11-26 13:36:12', '0000-00-00 00:00:00'),
(527, 170, 'C6TD6T', 'restaurant_food_issue', '', '2017-11-26 13:36:12', '0000-00-00 00:00:00'),
(528, 171, 'QLR1DX', 'restaurant_note', '', '2017-11-26 13:40:28', '0000-00-00 00:00:00'),
(529, 171, 'QLR1DX', 'restaurant_food_status', 'not_ready', '2017-11-26 13:40:28', '0000-00-00 00:00:00'),
(530, 171, 'QLR1DX', 'restaurant_food_issue', '', '2017-11-26 13:40:28', '0000-00-00 00:00:00'),
(531, 172, 'TD0PFE', 'restaurant_note', '', '2017-11-26 13:40:51', '0000-00-00 00:00:00'),
(532, 172, 'TD0PFE', 'restaurant_food_status', 'not_ready', '2017-11-26 13:40:51', '0000-00-00 00:00:00'),
(533, 172, 'TD0PFE', 'restaurant_food_issue', '', '2017-11-26 13:40:51', '0000-00-00 00:00:00'),
(534, 173, 'TD0PFE', 'restaurant_note', '', '2017-11-26 13:40:52', '0000-00-00 00:00:00'),
(535, 173, 'TD0PFE', 'restaurant_food_status', 'not_ready', '2017-11-26 13:40:52', '0000-00-00 00:00:00'),
(536, 173, 'TD0PFE', 'restaurant_food_issue', '', '2017-11-26 13:40:52', '0000-00-00 00:00:00'),
(537, 174, 'KJGUZO', 'restaurant_note', '', '2017-11-28 14:34:15', '0000-00-00 00:00:00'),
(538, 174, 'KJGUZO', 'restaurant_food_status', 'not_ready', '2017-11-28 14:34:15', '0000-00-00 00:00:00'),
(539, 174, 'KJGUZO', 'modifiers', '[{"name":"Extra chess","description":"","author":"3","cateogry":"1","default":"1","price":"0.2","image":"","group_forced":"1","group_multiselect":"1","0":"object:111"}]', '2017-11-28 14:34:15', '0000-00-00 00:00:00'),
(540, 174, 'KJGUZO', 'restaurant_food_issue', '', '2017-11-28 14:34:15', '0000-00-00 00:00:00'),
(541, 175, 'KJGUZO', 'restaurant_note', '', '2017-11-28 14:34:16', '0000-00-00 00:00:00'),
(542, 175, 'KJGUZO', 'restaurant_food_status', 'not_ready', '2017-11-28 14:34:16', '0000-00-00 00:00:00'),
(543, 175, 'KJGUZO', 'restaurant_food_issue', '', '2017-11-28 14:34:16', '0000-00-00 00:00:00'),
(544, 176, '5G7RXI', 'restaurant_note', '', '2017-11-28 14:34:52', '0000-00-00 00:00:00'),
(545, 176, '5G7RXI', 'restaurant_food_status', 'not_ready', '2017-11-28 14:34:52', '0000-00-00 00:00:00'),
(546, 176, '5G7RXI', 'restaurant_food_issue', '', '2017-11-28 14:34:52', '0000-00-00 00:00:00'),
(547, 177, '5G7RXI', 'restaurant_note', '', '2017-11-28 14:34:52', '0000-00-00 00:00:00'),
(548, 177, '5G7RXI', 'restaurant_food_status', 'not_ready', '2017-11-28 14:34:52', '0000-00-00 00:00:00'),
(549, 177, '5G7RXI', 'modifiers', '[{"name":"Extra chess","description":"","author":"3","cateogry":"1","default":"1","price":"0.2","image":"","group_forced":"1","group_multiselect":"1","0":"object:115"}]', '2017-11-28 14:34:52', '0000-00-00 00:00:00'),
(550, 177, '5G7RXI', 'restaurant_food_issue', '', '2017-11-28 14:34:52', '0000-00-00 00:00:00'),
(551, 178, '5G7RXI', 'restaurant_note', '', '2017-11-28 14:34:52', '0000-00-00 00:00:00'),
(552, 178, '5G7RXI', 'restaurant_food_status', 'not_ready', '2017-11-28 14:34:52', '0000-00-00 00:00:00'),
(553, 178, '5G7RXI', 'restaurant_food_issue', '', '2017-11-28 14:34:52', '0000-00-00 00:00:00'),
(554, 179, '1FDDBK', 'restaurant_note', '', '2017-11-28 14:36:05', '0000-00-00 00:00:00'),
(555, 179, '1FDDBK', 'restaurant_food_status', 'not_ready', '2017-11-28 14:36:05', '0000-00-00 00:00:00'),
(556, 179, '1FDDBK', 'restaurant_food_issue', '', '2017-11-28 14:36:05', '0000-00-00 00:00:00'),
(557, 180, '1FDDBK', 'restaurant_note', '', '2017-11-28 14:36:06', '0000-00-00 00:00:00'),
(558, 180, '1FDDBK', 'restaurant_food_status', 'not_ready', '2017-11-28 14:36:06', '0000-00-00 00:00:00'),
(559, 180, '1FDDBK', 'restaurant_food_issue', '', '2017-11-28 14:36:06', '0000-00-00 00:00:00'),
(560, 181, 'S8NJM0', 'restaurant_note', '', '2017-11-28 14:36:30', '0000-00-00 00:00:00'),
(561, 181, 'S8NJM0', 'restaurant_food_status', 'not_ready', '2017-11-28 14:36:30', '0000-00-00 00:00:00'),
(562, 181, 'S8NJM0', 'restaurant_food_issue', '', '2017-11-28 14:36:30', '0000-00-00 00:00:00'),
(563, 182, 'S8NJM0', 'restaurant_note', '', '2017-11-28 14:36:30', '0000-00-00 00:00:00'),
(564, 182, 'S8NJM0', 'restaurant_food_status', 'not_ready', '2017-11-28 14:36:30', '0000-00-00 00:00:00'),
(565, 182, 'S8NJM0', 'restaurant_food_issue', '', '2017-11-28 14:36:30', '0000-00-00 00:00:00'),
(566, 183, '81U2FC', 'restaurant_note', '', '2017-11-28 14:36:59', '0000-00-00 00:00:00'),
(567, 183, '81U2FC', 'restaurant_food_status', 'not_ready', '2017-11-28 14:36:59', '0000-00-00 00:00:00'),
(568, 183, '81U2FC', 'restaurant_food_issue', '', '2017-11-28 14:36:59', '0000-00-00 00:00:00'),
(569, 184, '81U2FC', 'restaurant_note', '', '2017-11-28 14:36:59', '0000-00-00 00:00:00'),
(570, 184, '81U2FC', 'restaurant_food_status', 'not_ready', '2017-11-28 14:36:59', '0000-00-00 00:00:00'),
(571, 184, '81U2FC', 'restaurant_food_issue', '', '2017-11-28 14:36:59', '0000-00-00 00:00:00'),
(572, 185, 'NX36SY', 'restaurant_note', '', '2017-11-28 14:37:55', '0000-00-00 00:00:00'),
(573, 185, 'NX36SY', 'restaurant_food_status', 'not_ready', '2017-11-28 14:37:55', '0000-00-00 00:00:00'),
(574, 185, 'NX36SY', 'restaurant_food_issue', '', '2017-11-28 14:37:55', '0000-00-00 00:00:00'),
(575, 186, 'NX36SY', 'restaurant_note', '', '2017-11-28 14:37:55', '0000-00-00 00:00:00'),
(576, 186, 'NX36SY', 'restaurant_food_status', 'not_ready', '2017-11-28 14:37:55', '0000-00-00 00:00:00'),
(577, 186, 'NX36SY', 'restaurant_food_issue', '', '2017-11-28 14:37:55', '0000-00-00 00:00:00'),
(578, 187, 'Y4OJSA', 'restaurant_note', '', '2017-11-28 14:38:44', '0000-00-00 00:00:00'),
(579, 187, 'Y4OJSA', 'restaurant_food_status', 'not_ready', '2017-11-28 14:38:44', '0000-00-00 00:00:00'),
(580, 187, 'Y4OJSA', 'restaurant_food_issue', '', '2017-11-28 14:38:44', '0000-00-00 00:00:00'),
(581, 188, 'Y4OJSA', 'restaurant_note', '', '2017-11-28 14:38:44', '0000-00-00 00:00:00'),
(582, 188, 'Y4OJSA', 'restaurant_food_status', 'not_ready', '2017-11-28 14:38:44', '0000-00-00 00:00:00'),
(583, 188, 'Y4OJSA', 'restaurant_food_issue', '', '2017-11-28 14:38:44', '0000-00-00 00:00:00'),
(584, 189, '4FMALO', 'restaurant_note', '', '2017-11-28 14:39:05', '0000-00-00 00:00:00'),
(585, 189, '4FMALO', 'restaurant_food_status', 'not_ready', '2017-11-28 14:39:05', '0000-00-00 00:00:00'),
(586, 189, '4FMALO', 'restaurant_food_issue', '', '2017-11-28 14:39:05', '0000-00-00 00:00:00'),
(587, 190, '4FMALO', 'restaurant_note', '', '2017-11-28 14:39:06', '0000-00-00 00:00:00'),
(588, 190, '4FMALO', 'restaurant_food_status', 'not_ready', '2017-11-28 14:39:06', '0000-00-00 00:00:00'),
(589, 190, '4FMALO', 'restaurant_food_issue', '', '2017-11-28 14:39:06', '0000-00-00 00:00:00'),
(590, 191, '6GA7OH', 'restaurant_note', '', '2017-11-28 14:39:30', '0000-00-00 00:00:00'),
(591, 191, '6GA7OH', 'restaurant_food_status', 'not_ready', '2017-11-28 14:39:30', '0000-00-00 00:00:00'),
(592, 191, '6GA7OH', 'restaurant_food_issue', '', '2017-11-28 14:39:30', '0000-00-00 00:00:00'),
(593, 192, '6GA7OH', 'restaurant_note', '', '2017-11-28 14:39:31', '0000-00-00 00:00:00'),
(594, 192, '6GA7OH', 'restaurant_food_status', 'not_ready', '2017-11-28 14:39:31', '0000-00-00 00:00:00'),
(595, 192, '6GA7OH', 'restaurant_food_issue', '', '2017-11-28 14:39:31', '0000-00-00 00:00:00'),
(596, 193, 'YXDFQ1', 'restaurant_note', '', '2017-11-28 14:54:42', '0000-00-00 00:00:00'),
(597, 193, 'YXDFQ1', 'restaurant_food_status', 'not_ready', '2017-11-28 14:54:42', '0000-00-00 00:00:00'),
(598, 193, 'YXDFQ1', 'restaurant_food_issue', '', '2017-11-28 14:54:42', '0000-00-00 00:00:00'),
(599, 194, 'YXDFQ1', 'restaurant_note', '', '2017-11-28 14:54:42', '0000-00-00 00:00:00'),
(600, 194, 'YXDFQ1', 'restaurant_food_status', 'not_ready', '2017-11-28 14:54:42', '0000-00-00 00:00:00'),
(601, 194, 'YXDFQ1', 'restaurant_food_issue', '', '2017-11-28 14:54:42', '0000-00-00 00:00:00'),
(602, 195, 'KKV1WP', 'restaurant_note', '', '2017-11-28 14:57:55', '0000-00-00 00:00:00'),
(603, 195, 'KKV1WP', 'restaurant_food_status', 'not_ready', '2017-11-28 14:57:55', '0000-00-00 00:00:00'),
(604, 195, 'KKV1WP', 'restaurant_food_issue', '', '2017-11-28 14:57:55', '0000-00-00 00:00:00'),
(605, 196, 'KKV1WP', 'restaurant_note', '', '2017-11-28 14:57:55', '0000-00-00 00:00:00'),
(606, 196, 'KKV1WP', 'restaurant_food_status', 'not_ready', '2017-11-28 14:57:55', '0000-00-00 00:00:00'),
(607, 196, 'KKV1WP', 'restaurant_food_issue', '', '2017-11-28 14:57:55', '0000-00-00 00:00:00'),
(608, 197, '38UJ5H', 'restaurant_note', '', '2017-11-28 14:58:35', '0000-00-00 00:00:00'),
(609, 197, '38UJ5H', 'restaurant_food_status', 'not_ready', '2017-11-28 14:58:35', '0000-00-00 00:00:00'),
(610, 197, '38UJ5H', 'restaurant_food_issue', '', '2017-11-28 14:58:35', '0000-00-00 00:00:00'),
(611, 198, '38UJ5H', 'restaurant_note', '', '2017-11-28 14:58:36', '0000-00-00 00:00:00'),
(612, 198, '38UJ5H', 'restaurant_food_status', 'not_ready', '2017-11-28 14:58:36', '0000-00-00 00:00:00'),
(613, 198, '38UJ5H', 'restaurant_food_issue', '', '2017-11-28 14:58:36', '0000-00-00 00:00:00'),
(614, 199, '38UJ5H', 'restaurant_note', '', '2017-11-28 14:58:36', '0000-00-00 00:00:00'),
(615, 199, '38UJ5H', 'restaurant_food_status', 'not_ready', '2017-11-28 14:58:36', '0000-00-00 00:00:00'),
(616, 199, '38UJ5H', 'restaurant_food_issue', '', '2017-11-28 14:58:36', '0000-00-00 00:00:00'),
(617, 200, '4CVZ2X', 'restaurant_note', '', '2017-11-28 14:58:54', '0000-00-00 00:00:00'),
(618, 200, '4CVZ2X', 'restaurant_food_status', 'not_ready', '2017-11-28 14:58:54', '0000-00-00 00:00:00'),
(619, 200, '4CVZ2X', 'restaurant_food_issue', '', '2017-11-28 14:58:54', '0000-00-00 00:00:00'),
(620, 201, '4CVZ2X', 'restaurant_note', '', '2017-11-28 14:58:54', '0000-00-00 00:00:00'),
(621, 201, '4CVZ2X', 'restaurant_food_status', 'not_ready', '2017-11-28 14:58:54', '0000-00-00 00:00:00'),
(622, 201, '4CVZ2X', 'restaurant_food_issue', '', '2017-11-28 14:58:54', '0000-00-00 00:00:00'),
(623, 202, '4CVZ2X', 'restaurant_note', '', '2017-11-28 14:58:55', '0000-00-00 00:00:00'),
(624, 202, '4CVZ2X', 'restaurant_food_status', 'not_ready', '2017-11-28 14:58:55', '0000-00-00 00:00:00'),
(625, 202, '4CVZ2X', 'restaurant_food_issue', '', '2017-11-28 14:58:55', '0000-00-00 00:00:00'),
(626, 203, 'G261KJ', 'restaurant_note', '', '2017-11-28 15:01:12', '0000-00-00 00:00:00'),
(627, 203, 'G261KJ', 'restaurant_food_status', 'not_ready', '2017-11-28 15:01:12', '0000-00-00 00:00:00'),
(628, 203, 'G261KJ', 'restaurant_food_issue', '', '2017-11-28 15:01:12', '0000-00-00 00:00:00'),
(629, 204, 'G261KJ', 'restaurant_note', '', '2017-11-28 15:01:12', '0000-00-00 00:00:00'),
(630, 204, 'G261KJ', 'restaurant_food_status', 'not_ready', '2017-11-28 15:01:12', '0000-00-00 00:00:00'),
(631, 204, 'G261KJ', 'restaurant_food_issue', '', '2017-11-28 15:01:12', '0000-00-00 00:00:00'),
(632, 205, 'CVV3TQ', 'restaurant_note', '', '2017-11-28 15:02:13', '0000-00-00 00:00:00'),
(633, 205, 'CVV3TQ', 'restaurant_food_status', 'not_ready', '2017-11-28 15:02:13', '0000-00-00 00:00:00'),
(634, 205, 'CVV3TQ', 'restaurant_food_issue', '', '2017-11-28 15:02:13', '0000-00-00 00:00:00'),
(635, 206, 'CVV3TQ', 'restaurant_note', '', '2017-11-28 15:02:14', '0000-00-00 00:00:00'),
(636, 206, 'CVV3TQ', 'restaurant_food_status', 'not_ready', '2017-11-28 15:02:14', '0000-00-00 00:00:00'),
(637, 206, 'CVV3TQ', 'restaurant_food_issue', '', '2017-11-28 15:02:14', '0000-00-00 00:00:00'),
(638, 207, 'CVV3TQ', 'restaurant_note', '', '2017-11-28 15:02:14', '0000-00-00 00:00:00'),
(639, 207, 'CVV3TQ', 'restaurant_food_status', 'not_ready', '2017-11-28 15:02:14', '0000-00-00 00:00:00'),
(640, 207, 'CVV3TQ', 'restaurant_food_issue', '', '2017-11-28 15:02:14', '0000-00-00 00:00:00'),
(641, 208, 'F97T5S', 'restaurant_note', '', '2017-11-28 15:02:30', '0000-00-00 00:00:00'),
(642, 208, 'F97T5S', 'restaurant_food_status', 'not_ready', '2017-11-28 15:02:30', '0000-00-00 00:00:00'),
(643, 208, 'F97T5S', 'restaurant_food_issue', '', '2017-11-28 15:02:30', '0000-00-00 00:00:00'),
(644, 209, 'QGO70J', 'restaurant_note', '', '2017-11-28 15:05:25', '0000-00-00 00:00:00'),
(645, 209, 'QGO70J', 'restaurant_food_status', 'not_ready', '2017-11-28 15:05:25', '0000-00-00 00:00:00'),
(646, 209, 'QGO70J', 'restaurant_food_issue', '', '2017-11-28 15:05:25', '0000-00-00 00:00:00'),
(647, 210, 'QGO70J', 'restaurant_note', '', '2017-11-28 15:05:25', '0000-00-00 00:00:00'),
(648, 210, 'QGO70J', 'restaurant_food_status', 'not_ready', '2017-11-28 15:05:25', '0000-00-00 00:00:00'),
(649, 210, 'QGO70J', 'restaurant_food_issue', '', '2017-11-28 15:05:25', '0000-00-00 00:00:00'),
(650, 211, 'J95KK2', 'restaurant_note', '', '2017-11-28 15:05:44', '0000-00-00 00:00:00'),
(651, 211, 'J95KK2', 'restaurant_food_status', 'not_ready', '2017-11-28 15:05:44', '0000-00-00 00:00:00'),
(652, 211, 'J95KK2', 'restaurant_food_issue', '', '2017-11-28 15:05:44', '0000-00-00 00:00:00'),
(653, 212, 'CFUMEG', 'restaurant_note', '', '2017-11-28 15:06:51', '0000-00-00 00:00:00'),
(654, 212, 'CFUMEG', 'restaurant_food_status', 'not_ready', '2017-11-28 15:06:51', '0000-00-00 00:00:00'),
(655, 212, 'CFUMEG', 'restaurant_food_issue', '', '2017-11-28 15:06:51', '0000-00-00 00:00:00'),
(656, 213, 'CFUMEG', 'restaurant_note', '', '2017-11-28 15:06:51', '0000-00-00 00:00:00'),
(657, 213, 'CFUMEG', 'restaurant_food_status', 'not_ready', '2017-11-28 15:06:51', '0000-00-00 00:00:00'),
(658, 213, 'CFUMEG', 'restaurant_food_issue', '', '2017-11-28 15:06:51', '0000-00-00 00:00:00'),
(659, 214, '3881CJ', 'restaurant_note', '', '2017-11-28 15:08:25', '0000-00-00 00:00:00'),
(660, 214, '3881CJ', 'restaurant_food_status', 'not_ready', '2017-11-28 15:08:25', '0000-00-00 00:00:00'),
(661, 214, '3881CJ', 'restaurant_food_issue', '', '2017-11-28 15:08:25', '0000-00-00 00:00:00'),
(662, 215, '3881CJ', 'restaurant_note', '', '2017-11-28 15:08:25', '0000-00-00 00:00:00'),
(663, 215, '3881CJ', 'restaurant_food_status', 'not_ready', '2017-11-28 15:08:25', '0000-00-00 00:00:00'),
(664, 215, '3881CJ', 'restaurant_food_issue', '', '2017-11-28 15:08:25', '0000-00-00 00:00:00'),
(665, 216, 'U31US2', 'restaurant_note', '', '2017-11-28 15:08:41', '0000-00-00 00:00:00'),
(666, 216, 'U31US2', 'restaurant_food_status', 'not_ready', '2017-11-28 15:08:41', '0000-00-00 00:00:00'),
(667, 216, 'U31US2', 'restaurant_food_issue', '', '2017-11-28 15:08:41', '0000-00-00 00:00:00'),
(668, 217, 'U31US2', 'restaurant_note', '', '2017-11-28 15:08:42', '0000-00-00 00:00:00'),
(669, 217, 'U31US2', 'restaurant_food_status', 'not_ready', '2017-11-28 15:08:42', '0000-00-00 00:00:00'),
(670, 217, 'U31US2', 'restaurant_food_issue', '', '2017-11-28 15:08:42', '0000-00-00 00:00:00'),
(671, 218, 'UMWE98', 'restaurant_note', '', '2017-11-28 15:09:11', '0000-00-00 00:00:00'),
(672, 218, 'UMWE98', 'restaurant_food_status', 'not_ready', '2017-11-28 15:09:11', '0000-00-00 00:00:00'),
(673, 218, 'UMWE98', 'restaurant_food_issue', '', '2017-11-28 15:09:11', '0000-00-00 00:00:00'),
(674, 219, 'UMWE98', 'restaurant_note', '', '2017-11-28 15:09:12', '0000-00-00 00:00:00'),
(675, 219, 'UMWE98', 'restaurant_food_status', 'not_ready', '2017-11-28 15:09:12', '0000-00-00 00:00:00'),
(676, 219, 'UMWE98', 'restaurant_food_issue', '', '2017-11-28 15:09:12', '0000-00-00 00:00:00'),
(677, 220, 'M68V9P', 'restaurant_note', '', '2017-11-28 15:09:42', '0000-00-00 00:00:00'),
(678, 220, 'M68V9P', 'restaurant_food_status', 'not_ready', '2017-11-28 15:09:42', '0000-00-00 00:00:00'),
(679, 220, 'M68V9P', 'restaurant_food_issue', '', '2017-11-28 15:09:42', '0000-00-00 00:00:00'),
(680, 221, 'M68V9P', 'restaurant_note', '', '2017-11-28 15:09:43', '0000-00-00 00:00:00'),
(681, 221, 'M68V9P', 'restaurant_food_status', 'not_ready', '2017-11-28 15:09:43', '0000-00-00 00:00:00'),
(682, 221, 'M68V9P', 'restaurant_food_issue', '', '2017-11-28 15:09:43', '0000-00-00 00:00:00'),
(683, 222, 'M68V9P', 'restaurant_note', '', '2017-11-28 15:09:43', '0000-00-00 00:00:00'),
(684, 222, 'M68V9P', 'restaurant_food_status', 'not_ready', '2017-11-28 15:09:43', '0000-00-00 00:00:00'),
(685, 222, 'M68V9P', 'restaurant_food_issue', '', '2017-11-28 15:09:43', '0000-00-00 00:00:00'),
(686, 223, 'M68V9P', 'restaurant_note', '', '2017-11-28 15:09:43', '0000-00-00 00:00:00'),
(687, 223, 'M68V9P', 'restaurant_food_status', 'not_ready', '2017-11-28 15:09:43', '0000-00-00 00:00:00'),
(688, 223, 'M68V9P', 'restaurant_food_issue', '', '2017-11-28 15:09:43', '0000-00-00 00:00:00'),
(689, 224, '9Z3N8R', 'restaurant_note', '', '2017-11-28 15:10:48', '0000-00-00 00:00:00'),
(690, 224, '9Z3N8R', 'restaurant_food_status', 'not_ready', '2017-11-28 15:10:48', '0000-00-00 00:00:00'),
(691, 224, '9Z3N8R', 'restaurant_food_issue', '', '2017-11-28 15:10:48', '0000-00-00 00:00:00'),
(692, 225, '9Z3N8R', 'restaurant_note', '', '2017-11-28 15:10:49', '0000-00-00 00:00:00'),
(693, 225, '9Z3N8R', 'restaurant_food_status', 'not_ready', '2017-11-28 15:10:49', '0000-00-00 00:00:00'),
(694, 225, '9Z3N8R', 'restaurant_food_issue', '', '2017-11-28 15:10:49', '0000-00-00 00:00:00'),
(695, 226, 'QX8956', 'restaurant_note', '', '2017-11-28 15:13:21', '0000-00-00 00:00:00'),
(696, 226, 'QX8956', 'restaurant_food_status', 'not_ready', '2017-11-28 15:13:21', '0000-00-00 00:00:00'),
(697, 226, 'QX8956', 'restaurant_food_issue', '', '2017-11-28 15:13:21', '0000-00-00 00:00:00'),
(698, 227, 'HL5YU1', 'restaurant_note', '', '2017-11-28 15:19:18', '0000-00-00 00:00:00'),
(699, 227, 'HL5YU1', 'restaurant_food_status', 'not_ready', '2017-11-28 15:19:18', '0000-00-00 00:00:00'),
(700, 227, 'HL5YU1', 'restaurant_food_issue', '', '2017-11-28 15:19:18', '0000-00-00 00:00:00'),
(701, 228, 'HL5YU1', 'restaurant_note', '', '2017-11-28 15:19:18', '0000-00-00 00:00:00'),
(702, 228, 'HL5YU1', 'restaurant_food_status', 'not_ready', '2017-11-28 15:19:18', '0000-00-00 00:00:00'),
(703, 228, 'HL5YU1', 'restaurant_food_issue', '', '2017-11-28 15:19:18', '0000-00-00 00:00:00'),
(704, 229, 'QPICWO', 'restaurant_note', '', '2017-11-28 15:20:12', '0000-00-00 00:00:00'),
(705, 229, 'QPICWO', 'restaurant_food_status', 'not_ready', '2017-11-28 15:20:12', '0000-00-00 00:00:00'),
(706, 229, 'QPICWO', 'restaurant_food_issue', '', '2017-11-28 15:20:12', '0000-00-00 00:00:00'),
(707, 230, 'QPICWO', 'restaurant_note', '', '2017-11-28 15:20:12', '0000-00-00 00:00:00'),
(708, 230, 'QPICWO', 'restaurant_food_status', 'not_ready', '2017-11-28 15:20:12', '0000-00-00 00:00:00'),
(709, 230, 'QPICWO', 'restaurant_food_issue', '', '2017-11-28 15:20:12', '0000-00-00 00:00:00'),
(710, 231, 'RBXT11', 'restaurant_note', '', '2017-11-28 15:23:04', '0000-00-00 00:00:00'),
(711, 231, 'RBXT11', 'restaurant_food_status', 'not_ready', '2017-11-28 15:23:04', '0000-00-00 00:00:00'),
(712, 231, 'RBXT11', 'restaurant_food_issue', '', '2017-11-28 15:23:04', '0000-00-00 00:00:00'),
(713, 232, 'T8JZ77', 'restaurant_note', '', '2017-11-28 15:23:17', '0000-00-00 00:00:00'),
(714, 232, 'T8JZ77', 'restaurant_food_status', 'not_ready', '2017-11-28 15:23:17', '0000-00-00 00:00:00'),
(715, 232, 'T8JZ77', 'restaurant_food_issue', '', '2017-11-28 15:23:17', '0000-00-00 00:00:00'),
(716, 233, 'H9RAZH', 'restaurant_note', '', '2017-11-28 15:25:30', '0000-00-00 00:00:00'),
(717, 233, 'H9RAZH', 'restaurant_food_status', 'not_ready', '2017-11-28 15:25:30', '0000-00-00 00:00:00'),
(718, 233, 'H9RAZH', 'restaurant_food_issue', '', '2017-11-28 15:25:30', '0000-00-00 00:00:00'),
(719, 234, 'H9RAZH', 'restaurant_note', '', '2017-11-28 15:25:30', '0000-00-00 00:00:00'),
(720, 234, 'H9RAZH', 'restaurant_food_status', 'not_ready', '2017-11-28 15:25:30', '0000-00-00 00:00:00'),
(721, 234, 'H9RAZH', 'restaurant_food_issue', '', '2017-11-28 15:25:30', '0000-00-00 00:00:00'),
(722, 235, '1F6VAB', 'restaurant_note', '', '2017-11-28 15:26:50', '0000-00-00 00:00:00'),
(723, 235, '1F6VAB', 'restaurant_food_status', 'not_ready', '2017-11-28 15:26:50', '0000-00-00 00:00:00'),
(724, 235, '1F6VAB', 'restaurant_food_issue', '', '2017-11-28 15:26:50', '0000-00-00 00:00:00'),
(725, 236, '1F6VAB', 'restaurant_note', '', '2017-11-28 15:26:51', '0000-00-00 00:00:00'),
(726, 236, '1F6VAB', 'restaurant_food_status', 'not_ready', '2017-11-28 15:26:51', '0000-00-00 00:00:00'),
(727, 236, '1F6VAB', 'restaurant_food_issue', '', '2017-11-28 15:26:51', '0000-00-00 00:00:00'),
(728, 237, '1F6VAB', 'restaurant_note', '', '2017-11-28 15:26:51', '0000-00-00 00:00:00'),
(729, 237, '1F6VAB', 'restaurant_food_status', 'not_ready', '2017-11-28 15:26:51', '0000-00-00 00:00:00'),
(730, 237, '1F6VAB', 'restaurant_food_issue', '', '2017-11-28 15:26:51', '0000-00-00 00:00:00'),
(731, 238, '1F6VAB', 'restaurant_note', '', '2017-11-28 15:26:51', '0000-00-00 00:00:00'),
(732, 238, '1F6VAB', 'restaurant_food_status', 'not_ready', '2017-11-28 15:26:51', '0000-00-00 00:00:00'),
(733, 238, '1F6VAB', 'restaurant_food_issue', '', '2017-11-28 15:26:51', '0000-00-00 00:00:00'),
(734, 239, '5XN2K0', 'restaurant_note', '', '2017-11-28 15:27:58', '0000-00-00 00:00:00'),
(735, 239, '5XN2K0', 'restaurant_food_status', 'not_ready', '2017-11-28 15:27:58', '0000-00-00 00:00:00'),
(736, 239, '5XN2K0', 'restaurant_food_issue', '', '2017-11-28 15:27:58', '0000-00-00 00:00:00'),
(737, 240, '5XN2K0', 'restaurant_note', '', '2017-11-28 15:27:58', '0000-00-00 00:00:00'),
(738, 240, '5XN2K0', 'restaurant_food_status', 'not_ready', '2017-11-28 15:27:58', '0000-00-00 00:00:00'),
(739, 240, '5XN2K0', 'restaurant_food_issue', '', '2017-11-28 15:27:58', '0000-00-00 00:00:00'),
(740, 241, 'BEK2BZ', 'restaurant_note', '', '2017-11-28 15:29:01', '0000-00-00 00:00:00'),
(741, 241, 'BEK2BZ', 'restaurant_food_status', 'not_ready', '2017-11-28 15:29:01', '0000-00-00 00:00:00'),
(742, 241, 'BEK2BZ', 'restaurant_food_issue', '', '2017-11-28 15:29:01', '0000-00-00 00:00:00'),
(743, 242, 'BEK2BZ', 'restaurant_note', '', '2017-11-28 15:29:01', '0000-00-00 00:00:00'),
(744, 242, 'BEK2BZ', 'restaurant_food_status', 'not_ready', '2017-11-28 15:29:01', '0000-00-00 00:00:00'),
(745, 242, 'BEK2BZ', 'restaurant_food_issue', '', '2017-11-28 15:29:01', '0000-00-00 00:00:00'),
(746, 243, 'VUP846', 'restaurant_note', '', '2017-11-28 15:29:43', '0000-00-00 00:00:00'),
(747, 243, 'VUP846', 'restaurant_food_status', 'not_ready', '2017-11-28 15:29:43', '0000-00-00 00:00:00'),
(748, 243, 'VUP846', 'restaurant_food_issue', '', '2017-11-28 15:29:43', '0000-00-00 00:00:00'),
(749, 244, 'VUP846', 'restaurant_note', '', '2017-11-28 15:29:43', '0000-00-00 00:00:00'),
(750, 244, 'VUP846', 'restaurant_food_status', 'not_ready', '2017-11-28 15:29:43', '0000-00-00 00:00:00'),
(751, 244, 'VUP846', 'restaurant_food_issue', '', '2017-11-28 15:29:43', '0000-00-00 00:00:00'),
(752, 245, 'DCDUX5', 'restaurant_note', '', '2017-11-28 15:30:22', '0000-00-00 00:00:00'),
(753, 245, 'DCDUX5', 'restaurant_food_status', 'not_ready', '2017-11-28 15:30:22', '0000-00-00 00:00:00'),
(754, 245, 'DCDUX5', 'restaurant_food_issue', '', '2017-11-28 15:30:22', '0000-00-00 00:00:00'),
(755, 246, 'DCDUX5', 'restaurant_note', '', '2017-11-28 15:30:22', '0000-00-00 00:00:00'),
(756, 246, 'DCDUX5', 'restaurant_food_status', 'not_ready', '2017-11-28 15:30:22', '0000-00-00 00:00:00'),
(757, 246, 'DCDUX5', 'restaurant_food_issue', '', '2017-11-28 15:30:22', '0000-00-00 00:00:00'),
(758, 247, 'IZB55U', 'restaurant_note', '', '2017-11-28 15:31:17', '0000-00-00 00:00:00'),
(759, 247, 'IZB55U', 'restaurant_food_status', 'not_ready', '2017-11-28 15:31:17', '0000-00-00 00:00:00'),
(760, 247, 'IZB55U', 'restaurant_food_issue', '', '2017-11-28 15:31:17', '0000-00-00 00:00:00'),
(761, 248, 'IZB55U', 'restaurant_note', '', '2017-11-28 15:31:17', '0000-00-00 00:00:00'),
(762, 248, 'IZB55U', 'restaurant_food_status', 'not_ready', '2017-11-28 15:31:17', '0000-00-00 00:00:00'),
(763, 248, 'IZB55U', 'restaurant_food_issue', '', '2017-11-28 15:31:17', '0000-00-00 00:00:00'),
(764, 249, 'X6IIVK', 'restaurant_note', '', '2017-11-28 15:32:27', '0000-00-00 00:00:00'),
(765, 249, 'X6IIVK', 'restaurant_food_status', 'not_ready', '2017-11-28 15:32:27', '0000-00-00 00:00:00'),
(766, 249, 'X6IIVK', 'restaurant_food_issue', '', '2017-11-28 15:32:27', '0000-00-00 00:00:00'),
(767, 250, 'X6IIVK', 'restaurant_note', '', '2017-11-28 15:32:27', '0000-00-00 00:00:00'),
(768, 250, 'X6IIVK', 'restaurant_food_status', 'not_ready', '2017-11-28 15:32:27', '0000-00-00 00:00:00'),
(769, 250, 'X6IIVK', 'restaurant_food_issue', '', '2017-11-28 15:32:27', '0000-00-00 00:00:00'),
(770, 251, '5TZW86', 'restaurant_note', '', '2017-11-28 15:39:42', '0000-00-00 00:00:00'),
(771, 251, '5TZW86', 'restaurant_food_status', 'not_ready', '2017-11-28 15:39:42', '0000-00-00 00:00:00'),
(772, 251, '5TZW86', 'restaurant_food_issue', '', '2017-11-28 15:39:42', '0000-00-00 00:00:00'),
(773, 252, '5TZW86', 'restaurant_note', '', '2017-11-28 15:39:43', '0000-00-00 00:00:00'),
(774, 252, '5TZW86', 'restaurant_food_status', 'not_ready', '2017-11-28 15:39:43', '0000-00-00 00:00:00'),
(775, 252, '5TZW86', 'restaurant_food_issue', '', '2017-11-28 15:39:43', '0000-00-00 00:00:00'),
(776, 253, '8BV0VT', 'restaurant_note', '', '2017-11-28 15:42:04', '0000-00-00 00:00:00'),
(777, 253, '8BV0VT', 'restaurant_food_status', 'not_ready', '2017-11-28 15:42:04', '0000-00-00 00:00:00'),
(778, 253, '8BV0VT', 'restaurant_food_issue', '', '2017-11-28 15:42:04', '0000-00-00 00:00:00'),
(779, 254, '8BV0VT', 'restaurant_note', '', '2017-11-28 15:42:05', '0000-00-00 00:00:00'),
(780, 254, '8BV0VT', 'restaurant_food_status', 'not_ready', '2017-11-28 15:42:05', '0000-00-00 00:00:00'),
(781, 254, '8BV0VT', 'restaurant_food_issue', '', '2017-11-28 15:42:05', '0000-00-00 00:00:00'),
(782, 255, 'MVPXYB', 'restaurant_note', '', '2017-11-28 15:42:45', '0000-00-00 00:00:00'),
(783, 255, 'MVPXYB', 'restaurant_food_status', 'not_ready', '2017-11-28 15:42:45', '0000-00-00 00:00:00'),
(784, 255, 'MVPXYB', 'restaurant_food_issue', '', '2017-11-28 15:42:45', '0000-00-00 00:00:00'),
(785, 256, 'MVPXYB', 'restaurant_note', '', '2017-11-28 15:42:45', '0000-00-00 00:00:00'),
(786, 256, 'MVPXYB', 'restaurant_food_status', 'not_ready', '2017-11-28 15:42:45', '0000-00-00 00:00:00'),
(787, 256, 'MVPXYB', 'restaurant_food_issue', '', '2017-11-28 15:42:45', '0000-00-00 00:00:00'),
(788, 257, 'TSXOOY', 'restaurant_note', '', '2017-11-28 15:44:31', '0000-00-00 00:00:00'),
(789, 257, 'TSXOOY', 'restaurant_food_status', 'not_ready', '2017-11-28 15:44:31', '0000-00-00 00:00:00'),
(790, 257, 'TSXOOY', 'restaurant_food_issue', '', '2017-11-28 15:44:31', '0000-00-00 00:00:00'),
(791, 258, 'TSXOOY', 'restaurant_note', '', '2017-11-28 15:44:31', '0000-00-00 00:00:00'),
(792, 258, 'TSXOOY', 'restaurant_food_status', 'not_ready', '2017-11-28 15:44:31', '0000-00-00 00:00:00'),
(793, 258, 'TSXOOY', 'restaurant_food_issue', '', '2017-11-28 15:44:31', '0000-00-00 00:00:00'),
(794, 259, '622HR1', 'restaurant_note', '', '2017-11-28 15:45:23', '0000-00-00 00:00:00'),
(795, 259, '622HR1', 'restaurant_food_status', 'not_ready', '2017-11-28 15:45:23', '0000-00-00 00:00:00'),
(796, 259, '622HR1', 'restaurant_food_issue', '', '2017-11-28 15:45:23', '0000-00-00 00:00:00'),
(797, 260, '622HR1', 'restaurant_note', '', '2017-11-28 15:45:23', '0000-00-00 00:00:00'),
(798, 260, '622HR1', 'restaurant_food_status', 'not_ready', '2017-11-28 15:45:23', '0000-00-00 00:00:00'),
(799, 260, '622HR1', 'restaurant_food_issue', '', '2017-11-28 15:45:23', '0000-00-00 00:00:00'),
(800, 261, 'L9SE84', 'restaurant_note', '', '2017-11-28 15:46:19', '0000-00-00 00:00:00'),
(801, 261, 'L9SE84', 'restaurant_food_status', 'not_ready', '2017-11-28 15:46:19', '0000-00-00 00:00:00'),
(802, 261, 'L9SE84', 'restaurant_food_issue', '', '2017-11-28 15:46:19', '0000-00-00 00:00:00');
INSERT INTO `tendoo_nexo_commandes_produits_meta` (`ID`, `REF_COMMAND_PRODUCT`, `REF_COMMAND_CODE`, `KEY`, `VALUE`, `DATE_CREATION`, `DATE_MODIFICATION`) VALUES
(803, 262, 'OGJCRN', 'restaurant_note', '', '2017-11-28 15:48:10', '0000-00-00 00:00:00'),
(804, 262, 'OGJCRN', 'restaurant_food_status', 'not_ready', '2017-11-28 15:48:10', '0000-00-00 00:00:00'),
(805, 262, 'OGJCRN', 'restaurant_food_issue', '', '2017-11-28 15:48:10', '0000-00-00 00:00:00'),
(806, 263, 'S3KTOD', 'restaurant_note', '', '2017-11-28 15:49:42', '0000-00-00 00:00:00'),
(807, 263, 'S3KTOD', 'restaurant_food_status', 'not_ready', '2017-11-28 15:49:42', '0000-00-00 00:00:00'),
(808, 263, 'S3KTOD', 'restaurant_food_issue', '', '2017-11-28 15:49:42', '0000-00-00 00:00:00'),
(809, 264, 'S3KTOD', 'restaurant_note', '', '2017-11-28 15:49:43', '0000-00-00 00:00:00'),
(810, 264, 'S3KTOD', 'restaurant_food_status', 'not_ready', '2017-11-28 15:49:43', '0000-00-00 00:00:00'),
(811, 264, 'S3KTOD', 'restaurant_food_issue', '', '2017-11-28 15:49:43', '0000-00-00 00:00:00'),
(812, 265, 'V6GSVK', 'restaurant_note', '', '2017-11-28 15:50:38', '0000-00-00 00:00:00'),
(813, 265, 'V6GSVK', 'restaurant_food_status', 'not_ready', '2017-11-28 15:50:38', '0000-00-00 00:00:00'),
(814, 265, 'V6GSVK', 'restaurant_food_issue', '', '2017-11-28 15:50:38', '0000-00-00 00:00:00'),
(815, 266, 'V6GSVK', 'restaurant_note', '', '2017-11-28 15:50:39', '0000-00-00 00:00:00'),
(816, 266, 'V6GSVK', 'restaurant_food_status', 'not_ready', '2017-11-28 15:50:39', '0000-00-00 00:00:00'),
(817, 266, 'V6GSVK', 'restaurant_food_issue', '', '2017-11-28 15:50:39', '0000-00-00 00:00:00'),
(818, 267, '7VA4JH', 'restaurant_note', '', '2017-11-28 15:52:07', '0000-00-00 00:00:00'),
(819, 267, '7VA4JH', 'restaurant_food_status', 'not_ready', '2017-11-28 15:52:07', '0000-00-00 00:00:00'),
(820, 267, '7VA4JH', 'restaurant_food_issue', '', '2017-11-28 15:52:07', '0000-00-00 00:00:00'),
(821, 268, '7VA4JH', 'restaurant_note', '', '2017-11-28 15:52:08', '0000-00-00 00:00:00'),
(822, 268, '7VA4JH', 'restaurant_food_status', 'not_ready', '2017-11-28 15:52:08', '0000-00-00 00:00:00'),
(823, 268, '7VA4JH', 'restaurant_food_issue', '', '2017-11-28 15:52:08', '0000-00-00 00:00:00'),
(824, 269, 'VZA42F', 'restaurant_note', '', '2017-11-28 15:54:44', '0000-00-00 00:00:00'),
(825, 269, 'VZA42F', 'restaurant_food_status', 'not_ready', '2017-11-28 15:54:44', '0000-00-00 00:00:00'),
(826, 269, 'VZA42F', 'restaurant_food_issue', '', '2017-11-28 15:54:44', '0000-00-00 00:00:00'),
(827, 270, 'VZA42F', 'restaurant_note', '', '2017-11-28 15:54:45', '0000-00-00 00:00:00'),
(828, 270, 'VZA42F', 'restaurant_food_status', 'not_ready', '2017-11-28 15:54:45', '0000-00-00 00:00:00'),
(829, 270, 'VZA42F', 'restaurant_food_issue', '', '2017-11-28 15:54:45', '0000-00-00 00:00:00'),
(830, 271, 'NOR3HN', 'restaurant_note', '', '2017-11-28 15:55:23', '0000-00-00 00:00:00'),
(831, 271, 'NOR3HN', 'restaurant_food_status', 'not_ready', '2017-11-28 15:55:23', '0000-00-00 00:00:00'),
(832, 271, 'NOR3HN', 'restaurant_food_issue', '', '2017-11-28 15:55:23', '0000-00-00 00:00:00'),
(833, 272, 'NOR3HN', 'restaurant_note', '', '2017-11-28 15:55:23', '0000-00-00 00:00:00'),
(834, 272, 'NOR3HN', 'restaurant_food_status', 'not_ready', '2017-11-28 15:55:23', '0000-00-00 00:00:00'),
(835, 272, 'NOR3HN', 'restaurant_food_issue', '', '2017-11-28 15:55:23', '0000-00-00 00:00:00'),
(836, 273, 'G61616', 'restaurant_note', '', '2017-11-28 15:58:05', '0000-00-00 00:00:00'),
(837, 273, 'G61616', 'restaurant_food_status', 'not_ready', '2017-11-28 15:58:05', '0000-00-00 00:00:00'),
(838, 273, 'G61616', 'restaurant_food_issue', '', '2017-11-28 15:58:05', '0000-00-00 00:00:00'),
(839, 274, 'G61616', 'restaurant_note', '', '2017-11-28 15:58:05', '0000-00-00 00:00:00'),
(840, 274, 'G61616', 'restaurant_food_status', 'not_ready', '2017-11-28 15:58:05', '0000-00-00 00:00:00'),
(841, 274, 'G61616', 'restaurant_food_issue', '', '2017-11-28 15:58:05', '0000-00-00 00:00:00'),
(842, 275, 'KHQTZ0', 'restaurant_note', '', '2017-11-28 15:58:38', '0000-00-00 00:00:00'),
(843, 275, 'KHQTZ0', 'restaurant_food_status', 'not_ready', '2017-11-28 15:58:38', '0000-00-00 00:00:00'),
(844, 275, 'KHQTZ0', 'restaurant_food_issue', '', '2017-11-28 15:58:38', '0000-00-00 00:00:00'),
(845, 276, 'KHQTZ0', 'restaurant_note', '', '2017-11-28 15:58:39', '0000-00-00 00:00:00'),
(846, 276, 'KHQTZ0', 'restaurant_food_status', 'not_ready', '2017-11-28 15:58:39', '0000-00-00 00:00:00'),
(847, 276, 'KHQTZ0', 'restaurant_food_issue', '', '2017-11-28 15:58:39', '0000-00-00 00:00:00'),
(848, 277, '2TRZY2', 'restaurant_note', '', '2017-11-28 16:00:48', '0000-00-00 00:00:00'),
(849, 277, '2TRZY2', 'restaurant_food_status', 'not_ready', '2017-11-28 16:00:48', '0000-00-00 00:00:00'),
(850, 277, '2TRZY2', 'restaurant_food_issue', '', '2017-11-28 16:00:48', '0000-00-00 00:00:00'),
(851, 278, '2TRZY2', 'restaurant_note', '', '2017-11-28 16:00:48', '0000-00-00 00:00:00'),
(852, 278, '2TRZY2', 'restaurant_food_status', 'not_ready', '2017-11-28 16:00:48', '0000-00-00 00:00:00'),
(853, 278, '2TRZY2', 'restaurant_food_issue', '', '2017-11-28 16:00:48', '0000-00-00 00:00:00'),
(854, 279, 'DYW963', 'restaurant_note', '', '2017-11-28 16:01:38', '0000-00-00 00:00:00'),
(855, 279, 'DYW963', 'restaurant_food_status', 'not_ready', '2017-11-28 16:01:38', '0000-00-00 00:00:00'),
(856, 279, 'DYW963', 'restaurant_food_issue', '', '2017-11-28 16:01:38', '0000-00-00 00:00:00'),
(857, 280, 'UC541X', 'restaurant_note', '', '2017-12-09 21:56:18', '0000-00-00 00:00:00'),
(858, 280, 'UC541X', 'restaurant_food_status', 'not_ready', '2017-12-09 21:56:18', '0000-00-00 00:00:00'),
(859, 280, 'UC541X', 'restaurant_food_issue', '', '2017-12-09 21:56:18', '0000-00-00 00:00:00'),
(860, 281, 'UC541X', 'restaurant_note', '', '2017-12-09 21:56:18', '0000-00-00 00:00:00'),
(861, 281, 'UC541X', 'restaurant_food_status', 'not_ready', '2017-12-09 21:56:18', '0000-00-00 00:00:00'),
(862, 281, 'UC541X', 'restaurant_food_issue', '', '2017-12-09 21:56:18', '0000-00-00 00:00:00'),
(863, 282, 'UC541X', 'restaurant_note', '', '2017-12-09 21:56:19', '0000-00-00 00:00:00'),
(864, 282, 'UC541X', 'restaurant_food_status', 'not_ready', '2017-12-09 21:56:19', '0000-00-00 00:00:00'),
(865, 282, 'UC541X', 'restaurant_food_issue', '', '2017-12-09 21:56:19', '0000-00-00 00:00:00'),
(866, 283, 'R7CE8B', 'restaurant_note', '', '2017-12-09 22:04:02', '0000-00-00 00:00:00'),
(867, 283, 'R7CE8B', 'restaurant_food_status', 'not_ready', '2017-12-09 22:04:02', '0000-00-00 00:00:00'),
(868, 283, 'R7CE8B', 'restaurant_food_issue', '', '2017-12-09 22:04:02', '0000-00-00 00:00:00'),
(869, 284, 'AWQMAL', 'restaurant_note', '', '2017-12-09 22:37:29', '0000-00-00 00:00:00'),
(870, 284, 'AWQMAL', 'restaurant_food_status', 'not_ready', '2017-12-09 22:37:29', '0000-00-00 00:00:00'),
(871, 284, 'AWQMAL', 'restaurant_food_issue', '', '2017-12-09 22:37:29', '0000-00-00 00:00:00'),
(872, 285, 'RHSUCY', 'restaurant_note', '', '2017-12-09 22:39:10', '0000-00-00 00:00:00'),
(873, 285, 'RHSUCY', 'restaurant_food_status', 'not_ready', '2017-12-09 22:39:10', '0000-00-00 00:00:00'),
(874, 285, 'RHSUCY', 'restaurant_food_issue', '', '2017-12-09 22:39:10', '0000-00-00 00:00:00'),
(875, 286, 'XQ3F4J', 'restaurant_note', '', '2017-12-09 22:39:53', '0000-00-00 00:00:00'),
(876, 286, 'XQ3F4J', 'restaurant_food_status', 'not_ready', '2017-12-09 22:39:53', '0000-00-00 00:00:00'),
(877, 286, 'XQ3F4J', 'restaurant_food_issue', '', '2017-12-09 22:39:53', '0000-00-00 00:00:00'),
(878, 287, 'BS29DA', 'restaurant_note', '', '2017-12-09 22:45:05', '0000-00-00 00:00:00'),
(879, 287, 'BS29DA', 'restaurant_food_status', 'not_ready', '2017-12-09 22:45:05', '0000-00-00 00:00:00'),
(880, 287, 'BS29DA', 'restaurant_food_issue', '', '2017-12-09 22:45:05', '0000-00-00 00:00:00'),
(881, 288, 'YZSAVX', 'restaurant_note', '', '2017-12-09 22:46:21', '0000-00-00 00:00:00'),
(882, 288, 'YZSAVX', 'restaurant_food_status', 'not_ready', '2017-12-09 22:46:21', '0000-00-00 00:00:00'),
(883, 288, 'YZSAVX', 'restaurant_food_issue', '', '2017-12-09 22:46:21', '0000-00-00 00:00:00'),
(884, 289, 'HBW8C3', 'restaurant_note', '', '2017-12-09 22:50:48', '0000-00-00 00:00:00'),
(885, 289, 'HBW8C3', 'restaurant_food_status', 'not_ready', '2017-12-09 22:50:48', '0000-00-00 00:00:00'),
(886, 289, 'HBW8C3', 'restaurant_food_issue', '', '2017-12-09 22:50:48', '0000-00-00 00:00:00'),
(887, 290, 'A2TUCR', 'restaurant_note', '', '2017-12-09 22:56:09', '0000-00-00 00:00:00'),
(888, 290, 'A2TUCR', 'restaurant_food_status', 'not_ready', '2017-12-09 22:56:09', '0000-00-00 00:00:00'),
(889, 290, 'A2TUCR', 'restaurant_food_issue', '', '2017-12-09 22:56:09', '0000-00-00 00:00:00'),
(890, 291, '0SDFUE', 'restaurant_note', '', '2017-12-09 22:58:57', '0000-00-00 00:00:00'),
(891, 291, '0SDFUE', 'restaurant_food_status', 'not_ready', '2017-12-09 22:58:57', '0000-00-00 00:00:00'),
(892, 291, '0SDFUE', 'restaurant_food_issue', '', '2017-12-09 22:58:57', '0000-00-00 00:00:00'),
(893, 292, '39V0A0', 'restaurant_note', '', '2017-12-09 23:04:45', '0000-00-00 00:00:00'),
(894, 292, '39V0A0', 'restaurant_food_status', 'not_ready', '2017-12-09 23:04:45', '0000-00-00 00:00:00'),
(895, 292, '39V0A0', 'restaurant_food_issue', '', '2017-12-09 23:04:45', '0000-00-00 00:00:00'),
(896, 293, 'DOKS60', 'restaurant_note', '', '2017-12-09 23:11:58', '0000-00-00 00:00:00'),
(897, 293, 'DOKS60', 'restaurant_food_status', 'not_ready', '2017-12-09 23:11:58', '0000-00-00 00:00:00'),
(898, 293, 'DOKS60', 'restaurant_food_issue', '', '2017-12-09 23:11:58', '0000-00-00 00:00:00'),
(899, 294, 'Z0IUQ2', 'restaurant_note', '', '2017-12-09 23:14:03', '0000-00-00 00:00:00'),
(900, 294, 'Z0IUQ2', 'restaurant_food_status', 'not_ready', '2017-12-09 23:14:03', '0000-00-00 00:00:00'),
(901, 294, 'Z0IUQ2', 'restaurant_food_issue', '', '2017-12-09 23:14:03', '0000-00-00 00:00:00'),
(902, 295, '6WW3IY', 'restaurant_note', '', '2017-12-09 23:18:17', '0000-00-00 00:00:00'),
(903, 295, '6WW3IY', 'restaurant_food_status', 'not_ready', '2017-12-09 23:18:17', '0000-00-00 00:00:00'),
(904, 295, '6WW3IY', 'restaurant_food_issue', '', '2017-12-09 23:18:17', '0000-00-00 00:00:00'),
(905, 296, 'FLZNF8', 'restaurant_note', '', '2017-12-10 00:45:26', '0000-00-00 00:00:00'),
(906, 296, 'FLZNF8', 'restaurant_food_status', 'not_ready', '2017-12-10 00:45:26', '0000-00-00 00:00:00'),
(907, 296, 'FLZNF8', 'restaurant_food_issue', '', '2017-12-10 00:45:26', '0000-00-00 00:00:00'),
(908, 297, 'PPNEF0', 'restaurant_note', '', '2017-12-10 01:06:41', '0000-00-00 00:00:00'),
(909, 297, 'PPNEF0', 'restaurant_food_status', 'not_ready', '2017-12-10 01:06:41', '0000-00-00 00:00:00'),
(910, 297, 'PPNEF0', 'restaurant_food_issue', '', '2017-12-10 01:06:41', '0000-00-00 00:00:00'),
(911, 298, 'EEE0BJ', 'restaurant_note', '', '2017-12-10 01:07:44', '0000-00-00 00:00:00'),
(912, 298, 'EEE0BJ', 'restaurant_food_status', 'not_ready', '2017-12-10 01:07:44', '0000-00-00 00:00:00'),
(913, 298, 'EEE0BJ', 'restaurant_food_issue', '', '2017-12-10 01:07:44', '0000-00-00 00:00:00'),
(914, 299, 'R1HWSV', 'restaurant_note', '', '2017-12-10 01:10:55', '0000-00-00 00:00:00'),
(915, 299, 'R1HWSV', 'restaurant_food_status', 'not_ready', '2017-12-10 01:10:55', '0000-00-00 00:00:00'),
(916, 299, 'R1HWSV', 'restaurant_food_issue', '', '2017-12-10 01:10:55', '0000-00-00 00:00:00'),
(917, 300, 'FU73D4', 'restaurant_note', '', '2017-12-10 01:20:02', '0000-00-00 00:00:00'),
(918, 300, 'FU73D4', 'restaurant_food_status', 'not_ready', '2017-12-10 01:20:02', '0000-00-00 00:00:00'),
(919, 300, 'FU73D4', 'restaurant_food_issue', '', '2017-12-10 01:20:02', '0000-00-00 00:00:00'),
(920, 301, '90W47H', 'restaurant_note', '', '2017-12-10 01:23:31', '0000-00-00 00:00:00'),
(921, 301, '90W47H', 'restaurant_food_status', 'not_ready', '2017-12-10 01:23:31', '0000-00-00 00:00:00'),
(922, 301, '90W47H', 'restaurant_food_issue', '', '2017-12-10 01:23:31', '0000-00-00 00:00:00'),
(923, 302, '98X6TO', 'restaurant_note', '', '2017-12-10 01:27:59', '0000-00-00 00:00:00'),
(924, 302, '98X6TO', 'restaurant_food_status', 'not_ready', '2017-12-10 01:27:59', '0000-00-00 00:00:00'),
(925, 302, '98X6TO', 'restaurant_food_issue', '', '2017-12-10 01:27:59', '0000-00-00 00:00:00'),
(926, 303, '6DCPEH', 'restaurant_note', '', '2017-12-10 01:29:16', '0000-00-00 00:00:00'),
(927, 303, '6DCPEH', 'restaurant_food_status', 'not_ready', '2017-12-10 01:29:16', '0000-00-00 00:00:00'),
(928, 303, '6DCPEH', 'restaurant_food_issue', '', '2017-12-10 01:29:16', '0000-00-00 00:00:00'),
(929, 304, '1QMLX1', 'restaurant_note', '', '2017-12-10 01:36:34', '0000-00-00 00:00:00'),
(930, 304, '1QMLX1', 'restaurant_food_status', 'not_ready', '2017-12-10 01:36:34', '0000-00-00 00:00:00'),
(931, 304, '1QMLX1', 'restaurant_food_issue', '', '2017-12-10 01:36:34', '0000-00-00 00:00:00'),
(932, 305, '5ATEIN', 'restaurant_note', '', '2017-12-10 01:44:14', '0000-00-00 00:00:00'),
(933, 305, '5ATEIN', 'restaurant_food_status', 'not_ready', '2017-12-10 01:44:14', '0000-00-00 00:00:00'),
(934, 305, '5ATEIN', 'restaurant_food_issue', '', '2017-12-10 01:44:14', '0000-00-00 00:00:00'),
(935, 306, 'R7D0JJ', 'restaurant_note', '', '2017-12-10 01:46:17', '0000-00-00 00:00:00'),
(936, 306, 'R7D0JJ', 'restaurant_food_status', 'not_ready', '2017-12-10 01:46:17', '0000-00-00 00:00:00'),
(937, 306, 'R7D0JJ', 'restaurant_food_issue', '', '2017-12-10 01:46:17', '0000-00-00 00:00:00'),
(938, 307, '0QGAI8', 'restaurant_note', '', '2017-12-10 01:53:35', '0000-00-00 00:00:00'),
(939, 307, '0QGAI8', 'restaurant_food_status', 'not_ready', '2017-12-10 01:53:35', '0000-00-00 00:00:00'),
(940, 307, '0QGAI8', 'restaurant_food_issue', '', '2017-12-10 01:53:35', '0000-00-00 00:00:00'),
(944, 309, '9BJU00', 'modifiers', '', '0000-00-00 00:00:00', '2017-12-11 00:21:39'),
(945, 309, '9BJU00', 'restaurant_food_issue', '', '0000-00-00 00:00:00', '2017-12-11 00:21:39'),
(946, 309, '9BJU00', 'restaurant_food_status', 'ready', '0000-00-00 00:00:00', '2017-12-11 00:21:39');

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_commandes_refunds`
--

CREATE TABLE `tendoo_nexo_commandes_refunds` (
  `ID` int(11) NOT NULL,
  `REF_COMMAND` int(11) NOT NULL,
  `REF_ITEM` int(11) NOT NULL,
  `QUANTITY` int(11) NOT NULL,
  `REF_UNIT` int(11) DEFAULT NULL,
  `AUTHOR` int(11) NOT NULL,
  `DATE_CREATION` datetime NOT NULL,
  `DATE_MODIFICATION` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_commandes_shippings`
--

CREATE TABLE `tendoo_nexo_commandes_shippings` (
  `id` int(11) NOT NULL,
  `ref_shipping` int(11) NOT NULL,
  `ref_order` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `surname` varchar(200) NOT NULL,
  `address_1` varchar(200) NOT NULL,
  `address_2` varchar(200) NOT NULL,
  `city` varchar(200) NOT NULL,
  `country` varchar(200) NOT NULL,
  `pobox` varchar(200) NOT NULL,
  `state` varchar(200) NOT NULL,
  `enterprise` varchar(200) NOT NULL,
  `title` varchar(200) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_coupons`
--

CREATE TABLE `tendoo_nexo_coupons` (
  `ID` int(11) NOT NULL,
  `CODE` varchar(200) NOT NULL,
  `DESCRIPTION` text NOT NULL,
  `DATE_CREATION` datetime NOT NULL,
  `DATE_MOD` datetime NOT NULL,
  `AUTHOR` int(11) NOT NULL,
  `DISCOUNT_TYPE` varchar(200) NOT NULL,
  `AMOUNT` float NOT NULL,
  `EXPIRY_DATE` datetime NOT NULL,
  `USAGE_COUNT` int(11) NOT NULL,
  `INDIVIDUAL_USE` int(11) NOT NULL,
  `PRODUCTS_IDS` text NOT NULL,
  `EXCLUDE_PRODUCTS_IDS` text NOT NULL,
  `USAGE_LIMIT` int(11) NOT NULL,
  `USAGE_LIMIT_PER_USER` int(11) NOT NULL,
  `LIMIT_USAGE_TO_X_ITEMS` int(11) NOT NULL,
  `FREE_SHIPPING` int(11) NOT NULL,
  `PRODUCT_CATEGORIES` text NOT NULL,
  `EXCLUDE_PRODUCT_CATEGORIES` text NOT NULL,
  `EXCLUDE_SALE_ITEMS` int(11) NOT NULL,
  `MINIMUM_AMOUNT` float NOT NULL,
  `MAXIMUM_AMOUNT` float NOT NULL,
  `USED_BY` text NOT NULL,
  `REWARDED_CASHIER` int(11) NOT NULL,
  `EMAIL_RESTRICTIONS` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_fournisseurs`
--

CREATE TABLE `tendoo_nexo_fournisseurs` (
  `ID` int(11) NOT NULL,
  `NOM` varchar(200) NOT NULL,
  `BP` varchar(200) NOT NULL,
  `TEL` varchar(200) NOT NULL,
  `EMAIL` varchar(200) NOT NULL,
  `DATE_CREATION` datetime NOT NULL,
  `DATE_MOD` datetime NOT NULL,
  `AUTHOR` varchar(200) NOT NULL,
  `DESCRIPTION` text NOT NULL,
  `PAYABLE` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tendoo_nexo_fournisseurs`
--

INSERT INTO `tendoo_nexo_fournisseurs` (`ID`, `NOM`, `BP`, `TEL`, `EMAIL`, `DATE_CREATION`, `DATE_MOD`, `AUTHOR`, `DESCRIPTION`, `PAYABLE`) VALUES
(1, 'Test Supplier', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_fournisseurs_history`
--

CREATE TABLE `tendoo_nexo_fournisseurs_history` (
  `ID` int(11) NOT NULL,
  `TYPE` varchar(200) NOT NULL,
  `BEFORE_AMOUNT` float NOT NULL,
  `AMOUNT` float NOT NULL,
  `AFTER_AMOUNT` float NOT NULL,
  `REF_PROVIDER` int(11) NOT NULL,
  `REF_INVOICE` int(11) NOT NULL,
  `REF_SUPPLY` int(11) NOT NULL,
  `DATE_CREATION` datetime NOT NULL,
  `DATE_MOD` datetime NOT NULL,
  `AUTHOR` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_historique`
--

CREATE TABLE `tendoo_nexo_historique` (
  `ID` int(11) NOT NULL,
  `TITRE` varchar(200) NOT NULL,
  `DETAILS` text NOT NULL,
  `DATE_CREATION` datetime NOT NULL,
  `DATE_MOD` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_notices`
--

CREATE TABLE `tendoo_nexo_notices` (
  `ID` int(11) NOT NULL,
  `TYPE` varchar(200) NOT NULL,
  `TITLE` varchar(200) NOT NULL,
  `MESSAGE` text NOT NULL,
  `ICON` varchar(200) NOT NULL,
  `LINK` varchar(200) NOT NULL,
  `REF_USER` int(11) NOT NULL,
  `DATE_CREATION` datetime NOT NULL,
  `DATE_MOD` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tendoo_nexo_notices`
--

INSERT INTO `tendoo_nexo_notices` (`ID`, `TYPE`, `TITLE`, `MESSAGE`, `ICON`, `LINK`, `REF_USER`, `DATE_CREATION`, `DATE_MOD`) VALUES
(3, 'text-warning', '', 'Nexo Store Advanced Manager, is not active, since NexoPOS multi Store feature is not active.', 'fa fa-info', 'http://localhost/resturpos/dashboard/nexo/stores-settings', 4, '2017-12-10 06:26:49', '0000-00-00 00:00:00'),
(4, 'text-warning', '', 'Nexo Store Advanced Manager, is not active, since NexoPOS multi Store feature is not active.', 'fa fa-info', 'http://localhost/resturpos/dashboard/nexo/stores-settings', 4, '2017-12-10 07:29:31', '0000-00-00 00:00:00'),
(5, 'text-warning', '', 'Nexo Store Advanced Manager, is not active, since NexoPOS multi Store feature is not active.', 'fa fa-info', 'http://localhost/resturpos/dashboard/nexo/stores-settings', 4, '2017-12-10 17:19:11', '0000-00-00 00:00:00'),
(6, 'text-success', '', 'The order <strong>9BJU00</strong> is ready', 'fa fa-cutlery', 'http://localhost/restoopos/dashboard/nexo/commandes/lists', 6, '2017-12-11 00:21:05', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_premium_backups`
--

CREATE TABLE `tendoo_nexo_premium_backups` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(200) NOT NULL,
  `FILE_LOCATION` text NOT NULL,
  `DATE_CREATION` datetime NOT NULL,
  `DATE_MODIFICATION` datetime NOT NULL,
  `AUTHOR` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_premium_factures`
--

CREATE TABLE `tendoo_nexo_premium_factures` (
  `ID` int(11) NOT NULL,
  `INTITULE` varchar(200) NOT NULL,
  `REF` varchar(200) NOT NULL,
  `MONTANT` float NOT NULL,
  `REF_CATEGORY` int(11) NOT NULL,
  `REF_PROVIDER` int(11) NOT NULL,
  `REF_USER` int(11) NOT NULL,
  `IMAGE` varchar(200) NOT NULL,
  `DESCRIPTION` text NOT NULL,
  `DATE_CREATION` datetime NOT NULL,
  `DATE_MODIFICATION` datetime NOT NULL,
  `AUTHOR` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_premium_factures_categories`
--

CREATE TABLE `tendoo_nexo_premium_factures_categories` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(200) NOT NULL,
  `DESCRIPTION` text NOT NULL,
  `DATE_CREATION` datetime NOT NULL,
  `DATE_MODIFICATION` datetime NOT NULL,
  `AUTHOR` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_rayons`
--

CREATE TABLE `tendoo_nexo_rayons` (
  `ID` int(11) NOT NULL,
  `TITRE` varchar(200) NOT NULL,
  `DESCRIPTION` text NOT NULL,
  `DATE_CREATION` datetime NOT NULL,
  `DATE_MOD` datetime NOT NULL,
  `AUTHOR` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_registers`
--

CREATE TABLE `tendoo_nexo_registers` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(200) NOT NULL,
  `DESCRIPTION` text NOT NULL,
  `IMAGE_URL` text,
  `AUTHOR` varchar(250) NOT NULL,
  `DATE_CREATION` datetime NOT NULL,
  `DATE_MOD` datetime NOT NULL,
  `STATUS` varchar(200) NOT NULL,
  `USED_BY` int(11) NOT NULL,
  `REF_KITCHEN` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_registers_activities`
--

CREATE TABLE `tendoo_nexo_registers_activities` (
  `ID` int(11) NOT NULL,
  `AUTHOR` int(11) NOT NULL,
  `TYPE` varchar(200) NOT NULL,
  `BALANCE` float NOT NULL,
  `DATE_CREATION` datetime NOT NULL,
  `DATE_MOD` datetime NOT NULL,
  `REF_REGISTER` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_restaurant_areas`
--

CREATE TABLE `tendoo_nexo_restaurant_areas` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(200) NOT NULL,
  `DESCRIPTION` text NOT NULL,
  `DATE_CREATION` datetime NOT NULL,
  `DATE_MODIFICATION` datetime NOT NULL,
  `AUTHOR` int(11) NOT NULL,
  `REF_ROOM` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tendoo_nexo_restaurant_areas`
--

INSERT INTO `tendoo_nexo_restaurant_areas` (`ID`, `NAME`, `DESCRIPTION`, `DATE_CREATION`, `DATE_MODIFICATION`, `AUTHOR`, `REF_ROOM`) VALUES
(1, 'Inside', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_restaurant_kitchens`
--

CREATE TABLE `tendoo_nexo_restaurant_kitchens` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(200) NOT NULL,
  `DESCRIPTION` text NOT NULL,
  `AUTHOR` int(11) NOT NULL,
  `DATE_CREATION` datetime NOT NULL,
  `DATE_MOD` datetime NOT NULL,
  `REF_CATEGORY` varchar(200) NOT NULL,
  `REF_ROOM` int(11) NOT NULL,
  `PRINTER` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tendoo_nexo_restaurant_kitchens`
--

INSERT INTO `tendoo_nexo_restaurant_kitchens` (`ID`, `NAME`, `DESCRIPTION`, `AUTHOR`, `DATE_CREATION`, `DATE_MOD`, `REF_CATEGORY`, `REF_ROOM`, `PRINTER`) VALUES
(1, 'Test Kitchen', '', 4, '2017-10-12 16:32:58', '2017-11-24 16:15:38', '1,3', 0, 'Epson V4');

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_restaurant_modifiers`
--

CREATE TABLE `tendoo_nexo_restaurant_modifiers` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(200) NOT NULL,
  `DESCRIPTION` text NOT NULL,
  `AUTHOR` int(11) NOT NULL,
  `DATE_CREATION` datetime NOT NULL,
  `DATE_MODIFICATION` datetime NOT NULL,
  `REF_CATEGORY` int(11) NOT NULL,
  `DEFAULT` tinyint(1) NOT NULL,
  `PRICE` float NOT NULL,
  `IMAGE` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tendoo_nexo_restaurant_modifiers`
--

INSERT INTO `tendoo_nexo_restaurant_modifiers` (`ID`, `NAME`, `DESCRIPTION`, `AUTHOR`, `DATE_CREATION`, `DATE_MODIFICATION`, `REF_CATEGORY`, `DEFAULT`, `PRICE`, `IMAGE`) VALUES
(1, 'Extra Onion', '', 3, '2017-10-15 19:33:43', '0000-00-00 00:00:00', 1, 0, 0, ''),
(2, 'Extra chess', '', 3, '2017-10-15 19:34:05', '0000-00-00 00:00:00', 1, 0, 0.2, '');

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_restaurant_modifiers_categories`
--

CREATE TABLE `tendoo_nexo_restaurant_modifiers_categories` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(200) NOT NULL,
  `DESCRIPTION` text NOT NULL,
  `AUTHOR` int(11) NOT NULL,
  `DATE_CREATION` datetime NOT NULL,
  `DATE_MODIFICATION` datetime NOT NULL,
  `FORCED` tinyint(1) NOT NULL,
  `MULTISELECT` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tendoo_nexo_restaurant_modifiers_categories`
--

INSERT INTO `tendoo_nexo_restaurant_modifiers_categories` (`ID`, `NAME`, `DESCRIPTION`, `AUTHOR`, `DATE_CREATION`, `DATE_MODIFICATION`, `FORCED`, `MULTISELECT`) VALUES
(1, 'Extra for Burger', '', 3, '2017-10-15 19:32:51', '0000-00-00 00:00:00', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_restaurant_tables`
--

CREATE TABLE `tendoo_nexo_restaurant_tables` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(200) NOT NULL,
  `DESCRIPTION` text NOT NULL,
  `MAX_SEATS` int(11) DEFAULT NULL,
  `CURRENT_SEATS_USED` int(11) DEFAULT NULL,
  `STATUS` varchar(200) DEFAULT NULL,
  `SINCE` datetime NOT NULL,
  `BOOKING_START` datetime NOT NULL,
  `DATE_CREATION` datetime NOT NULL,
  `DATE_MODIFICATION` datetime NOT NULL,
  `AUTHOR` int(11) NOT NULL,
  `REF_AREA` int(11) NOT NULL,
  `CURRENT_SESSION_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tendoo_nexo_restaurant_tables`
--

INSERT INTO `tendoo_nexo_restaurant_tables` (`ID`, `NAME`, `DESCRIPTION`, `MAX_SEATS`, `CURRENT_SEATS_USED`, `STATUS`, `SINCE`, `BOOKING_START`, `DATE_CREATION`, `DATE_MODIFICATION`, `AUTHOR`, `REF_AREA`, `CURRENT_SESSION_ID`) VALUES
(1, 'Test Table', '', 4, 0, 'in_use', '2017-10-12 17:31:05', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_restaurant_tables_relation_orders`
--

CREATE TABLE `tendoo_nexo_restaurant_tables_relation_orders` (
  `ID` int(11) NOT NULL,
  `REF_ORDER` int(11) NOT NULL,
  `REF_TABLE` int(11) NOT NULL,
  `REF_SESSION` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tendoo_nexo_restaurant_tables_relation_orders`
--

INSERT INTO `tendoo_nexo_restaurant_tables_relation_orders` (`ID`, `REF_ORDER`, `REF_TABLE`, `REF_SESSION`) VALUES
(1, 1, 1, 1),
(2, 1, 1, 1),
(3, 3, 1, 2),
(4, 3, 1, 2),
(5, 5, 1, 3),
(6, 5, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_restaurant_tables_sessions`
--

CREATE TABLE `tendoo_nexo_restaurant_tables_sessions` (
  `ID` int(11) NOT NULL,
  `REF_TABLE` int(11) NOT NULL,
  `SESSION_STARTS` datetime NOT NULL,
  `SESSION_ENDS` datetime NOT NULL,
  `AUTHOR` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tendoo_nexo_restaurant_tables_sessions`
--

INSERT INTO `tendoo_nexo_restaurant_tables_sessions` (`ID`, `REF_TABLE`, `SESSION_STARTS`, `SESSION_ENDS`, `AUTHOR`) VALUES
(1, 1, '2017-10-12 16:40:52', '2017-10-12 17:14:47', 2),
(2, 1, '2017-10-12 17:14:57', '2017-10-12 17:30:44', 2),
(3, 1, '2017-10-12 17:31:05', '0000-00-00 00:00:00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_stock_transfert`
--

CREATE TABLE `tendoo_nexo_stock_transfert` (
  `ID` int(11) NOT NULL,
  `TITLE` varchar(200) NOT NULL,
  `DESCRIPTION` text NOT NULL,
  `APPROUVED` int(11) NOT NULL,
  `APPROUVED_BY` int(11) NOT NULL,
  `TYPE` varchar(200) NOT NULL,
  `AUTHOR` int(11) NOT NULL,
  `DATE_CREATION` datetime NOT NULL,
  `DATE_MOD` datetime NOT NULL,
  `DESTINATION_STORE` int(11) NOT NULL,
  `FROM_STORE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_stock_transfert_items`
--

CREATE TABLE `tendoo_nexo_stock_transfert_items` (
  `ID` int(11) NOT NULL,
  `DESIGN` varchar(200) NOT NULL,
  `QUANTITY` float NOT NULL,
  `UNIT_PRICE` float NOT NULL,
  `TOTAL_PRICE` float NOT NULL,
  `REF_ITEM` int(11) NOT NULL,
  `DATE_CREATION` datetime NOT NULL,
  `DATE_MOD` datetime NOT NULL,
  `REF_TRANSFER` int(11) NOT NULL,
  `BARCODE` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_stores`
--

CREATE TABLE `tendoo_nexo_stores` (
  `ID` int(11) NOT NULL,
  `AUTHOR` int(11) NOT NULL,
  `STATUS` varchar(200) NOT NULL,
  `NAME` varchar(200) NOT NULL,
  `IMAGE` varchar(200) NOT NULL,
  `DESCRIPTION` text NOT NULL,
  `DATE_CREATION` datetime NOT NULL,
  `DATE_MOD` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_stores_activities`
--

CREATE TABLE `tendoo_nexo_stores_activities` (
  `ID` int(11) NOT NULL,
  `AUTHOR` int(11) NOT NULL,
  `TYPE` varchar(200) NOT NULL,
  `REF_STORE` int(11) NOT NULL,
  `DATE_CREATION` datetime NOT NULL,
  `DATE_MOD` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_nexo_taxes`
--

CREATE TABLE `tendoo_nexo_taxes` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(200) NOT NULL,
  `DESCRIPTION` text NOT NULL,
  `RATE` float NOT NULL,
  `AUTHOR` int(11) NOT NULL,
  `DATE_CREATION` datetime NOT NULL,
  `DATE_MOD` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_options`
--

CREATE TABLE `tendoo_options` (
  `id` int(11) UNSIGNED NOT NULL,
  `key` varchar(200) NOT NULL,
  `value` text,
  `autoload` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `app` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tendoo_options`
--

INSERT INTO `tendoo_options` (`id`, `key`, `value`, `autoload`, `user`, `app`) VALUES
(4, 'actives_modules', '{"0":"grocerycrud","2":"nexo_premium","4":"nexo-updater","5":"nexo-restaurant","6":"nexo","7":"food-stock"}', 1, 0, 'system'),
(5, 'nexo_premium_installed', 'true', 1, 0, 'system'),
(6, 'nexo_sms_invoice_template', '{{ site_name }} \\n \r\nBonjour {{ name }}, votre commande {{ order_code }} est prête. \\n\r\nTotal {{ order_topay }} \\n \r\nMerci pour votre confiance', 0, 0, 'system'),
(7, 'rest_key', '8FMHfiIOff31dAUDDN0CHa6pzwnbDCK7K99U9W0F', 1, 0, 'system'),
(8, 'database_version', '1.1', 1, 0, 'system'),
(9, 'site_name', 'Gulf Apps Demo', 1, 0, 'system'),
(10, 'site_language', 'en_US', 1, 0, 'system'),
(11, 'nexo_installed', 'true', 1, 0, 'system'),
(12, 'nexo_display_select_client', 'enable', 1, 0, 'system'),
(13, 'nexo_display_payment_means', 'enable', 1, 0, 'system'),
(14, 'nexo_display_amount_received', 'enable', 1, 0, 'system'),
(15, 'nexo_display_discount', 'enable', 1, 0, 'system'),
(16, 'nexo_currency_position', 'after', 1, 0, 'system'),
(17, 'nexo_receipt_theme', 'default', 1, 0, 'system'),
(18, 'nexo_enable_autoprinting', 'no', 1, 0, 'system'),
(19, 'nexo_devis_expiration', '7', 1, 0, 'system'),
(20, 'nexo_shop_street', 'Muscat', 1, 0, 'system'),
(21, 'nexo_shop_pobox', '112', 1, 0, 'system'),
(22, 'nexo_shop_email', 'jihad@gulf-apps.om', 1, 0, 'system'),
(23, 'how_many_before_discount', '', 1, 0, 'system'),
(24, 'nexo_products_labels', '5', 1, 0, 'system'),
(25, 'nexo_codebar_height', '100', 1, 0, 'system'),
(26, 'nexo_bar_width', '3', 1, 0, 'system'),
(27, 'nexo_soundfx', 'enable', 1, 0, 'system'),
(28, 'nexo_currency', 'OMR', 1, 0, 'system'),
(29, 'nexo_vat_percent', '10', 1, 0, 'system'),
(30, 'nexo_enable_autoprint', 'yes', 1, 0, 'system'),
(31, 'nexo_enable_smsinvoice', 'yes', 1, 0, 'system'),
(32, 'nexo_currency_iso', 'OMR', 1, 0, 'system'),
(33, 'nexo_compact_enabled', 'yes', 1, 0, 'system'),
(34, 'nexo_enable_shadow_price', 'no', 1, 0, 'system'),
(35, 'nexo_enable_stripe', 'no', 1, 0, 'system'),
(36, 'user_id', '2', 1, 0, 'system'),
(37, 'nexo_first_run', 'true', 1, 0, 'system'),
(38, 'dashboard_widget_position', '{"1":["nexo_profile"],"2":["nexo_sales_income"],"3":["sale_type_new"]}', 1, 2, 'system'),
(39, 'site_registration', '1', 1, 0, 'system'),
(40, 'require_validation', '1', 1, 0, 'system'),
(41, 'webdev_mode', '1', 1, 0, 'system'),
(42, 'migration_nexo-updater', NULL, 1, 0, 'system'),
(43, 'updater_validated', '744c4825-702d-4b42-87c8-b7c06a7d75b1', 1, 0, 'system'),
(44, 'migration_nexo-restaurant', NULL, 1, 0, 'system'),
(45, 'nexo_restaurant_installed', 'true', 1, 0, 'system'),
(46, 'restaurant_envato_licence', '80b11069-f54f-424c-9250-f12c7236c24b', 1, 0, 'system'),
(47, 'printer_gpc_proxy', '', 1, 0, 'system'),
(48, 'printing_option', 'kitchen_printers', 1, 0, 'system'),
(49, 'enable_kitchen_synthesizer', '', 1, 0, 'system'),
(50, 'disable_takeaway', '0', 1, 0, 'system'),
(51, 'disable_dinein', '0', 1, 0, 'system'),
(52, 'disable_delivery', '0', 1, 0, 'system'),
(53, 'disable_readyorders', '0', 1, 0, 'system'),
(54, 'disable_pendingorders', '0', 1, 0, 'system'),
(55, 'disable_saleslist', '0', 1, 0, 'system'),
(56, 'fresh_order_min', '1', 1, 0, 'system'),
(57, 'late_order_min', '', 1, 0, 'system'),
(58, 'too_late_order_min', '', 1, 0, 'system'),
(59, 'fresh_order_color', 'box-default', 1, 0, 'system'),
(60, 'late_order_color', 'box-default', 1, 0, 'system'),
(61, 'too_late_order_color', 'box-default', 1, 0, 'system'),
(62, 'refreshing_seconds', '', 1, 0, 'system'),
(63, 'disable_kitchen_screen', 'no', 1, 0, 'system'),
(64, 'disable_kitchen_print', 'no', 1, 0, 'system'),
(65, 'disable_area_rooms', '0', 1, 0, 'system'),
(66, 'enable_group_discount', 'disable', 1, 0, 'system'),
(67, 'discount_type', 'disable', 1, 0, 'system'),
(68, 'discount_percent', '', 1, 0, 'system'),
(69, 'discount_amount', '', 1, 0, 'system'),
(70, 'default_compte_client', '1', 1, 0, 'system'),
(71, 'nexo_saved_barcode', '["211802","821981","155760","801020","691808","660510","870492","250319","468500","414556","685636","358146","341022","844920","883014","921112","216857","973055"]', 1, 0, 'system'),
(72, 'order_code', '{"0":"BAXD6H","1":"M5ROHB","2":"IYYWKT","3":"0OTCWJ","4":"Y8DX2N","9":"MLP8QU","10":"OF3S0O","11":"GITLUO","12":"DJTTET","13":"2ATJL9","14":"4ZWPKQ","17":"MXCYL5","19":"V7I8EA","21":"F9OQQU","22":"3UULMC","23":"AASAC5","24":"LF4AY2","25":"BG1OUD","26":"9CMVRF","27":"Q0ZDKM","28":"IILTKE","29":"GQ1S1N","30":"GHW3LX","31":"6N6XPE","32":"FZSSQW","33":"GDGUH8","34":"ZUTP66","35":"2YTIA9","36":"U1IF8E","37":"94ZV55","38":"K52FGI","39":"4EZI8N","40":"RMKQGZ","41":"46W3T4","42":"HHZU41","43":"PFA1LN","44":"4CKFIC","45":"JH96L2","46":"3NGCJ7","47":"PW12V2","48":"NFGAQF","49":"H7KE0E","50":"AJVTWJ","51":"SSFCK0","52":"6XQ06H","53":"O4AUM3","54":"3VYGR8","55":"3CH364","56":"6D9J6L","57":"2V6GE5","58":"144RZC","59":"61O3RO","60":"MSJ3RE","61":"LWCWWS","62":"JPGBJQ","63":"LI4LP4","64":"W3775I","65":"S26MSC","89":"GBM2ZF","90":"NH6X0C","91":"OOK6AH","92":"PQ2SXH","93":"ZBY1JB","94":"SKTA9E","95":"12DQZN","96":"WOHYIO","97":"719L3I","98":"BJPKRR","99":"UV870G","100":"VLKR9W","101":"WNDPV0","102":"PC226T","103":"P3QVPT","104":"U07L5Q","105":"1VA0SY","106":"O3YSXZ","107":"38JLW4","108":"XBO3R3","109":"LWFNFX","110":"HOHJMB","111":"445HI7","112":"76BQQX","114":"JK38NY","118":"TD0PFE","122":"S8NJM0","123":"81U2FC","124":"NX36SY","127":"6GA7OH","128":"YXDFQ1","129":"KKV1WP","130":"38UJ5H","131":"4CVZ2X","132":"G261KJ","133":"CVV3TQ","134":"F97T5S","135":"QGO70J","136":"J95KK2","137":"CFUMEG","138":"3881CJ","139":"U31US2","140":"UMWE98","141":"B1WE9F","142":"M68V9P","143":"9Z3N8R","144":"QX8956","145":"HL5YU1","147":"RBXT11","148":"T8JZ77","149":"H9RAZH","150":"1F6VAB","151":"5XN2K0","152":"BEK2BZ","153":"VUP846","154":"DCDUX5","155":"IZB55U","156":"X6IIVK","157":"5TZW86","158":"8BV0VT","159":"MVPXYB","160":"TSXOOY","161":"622HR1","162":"L9SE84","163":"OGJCRN","164":"S3KTOD","165":"V6GSVK","166":"7VA4JH","167":"VZA42F","168":"NOR3HN","169":"G61616","170":"KHQTZ0","171":"2TRZY2","172":"DYW963","173":"UC541X","174":"R7CE8B","175":"AWQMAL","176":"RHSUCY","177":"XQ3F4J","178":"BS29DA","179":"YZSAVX","180":"HBW8C3","181":"A2TUCR","182":"0SDFUE","183":"39V0A0","184":"DOKS60","185":"Z0IUQ2","186":"6WW3IY","187":"FLZNF8","188":"PPNEF0","189":"EEE0BJ","190":"R1HWSV","191":"FU73D4","192":"90W47H","193":"98X6TO","194":"6DCPEH","195":"1QMLX1","196":"5ATEIN","197":"R7D0JJ","198":"0QGAI8","199":"9BJU00"}', 0, 0, 'system'),
(73, 'latest_release', '{"core":{"id":"3.1.3","name":"v3.1.3","description":"- Update Font Awesome.\\n","beta":false,"published":"2016-07-24T21:18:38Z","link":"https:\\/\\/api.github.com\\/repos\\/Blair2004\\/tendoo-cms\\/zipball\\/3.1.3"}}', 0, 0, 'system'),
(74, 'first-name', 'Jihad', 1, 3, 'users'),
(75, 'last-name', '', 1, 3, 'users'),
(76, 'theme-skin', 'skin-blue', 1, 3, 'users'),
(77, 'dashboard_widget_position', '{"1":["nexo_profile"],"2":["nexo_sales_income"],"3":["sale_type_new"]}', 1, 3, 'system'),
(78, 'site_description', '', 1, 0, 'system'),
(79, 'site_timezone', 'Asia/Muscat', 1, 0, 'system'),
(80, 'takeaway_kitchen', '1', 1, 0, 'system'),
(81, 'url_to_logo', 'http://gulf-apps.om/wp-content/uploads/2016/01/GulfAppswe.png', 1, 0, 'system'),
(82, 'logo_height', '250', 1, 0, 'system'),
(83, 'logo_width', '76', 1, 0, 'system'),
(84, 'receipt_col_1', '{customer_name}\r\n{customer_phone}\r\n{order_note}', 1, 0, 'system'),
(85, 'receipt_col_2', '', 1, 0, 'system'),
(86, 'nexo_bills_notices', '', 1, 0, 'system'),
(87, 'nexo_enable_registers', '', 1, 0, 'system'),
(88, 'nexo_enable_vat', 'non', 1, 0, 'system'),
(89, 'unit_item_discount_enabled', '', 1, 0, 'system'),
(90, 'hide_discount_button', 'no', 1, 0, 'system'),
(91, 'disable_coupon', 'no', 1, 0, 'system'),
(92, 'disable_shipping', 'no', 1, 0, 'system'),
(93, 'disable_customer_creation', 'no', 1, 0, 'system'),
(94, 'disable_quick_item', '', 1, 0, 'system'),
(95, 'nexo_shop_phone', '+968-94077701', 1, 0, 'system'),
(96, 'nexo_shop_fax', '', 1, 0, 'system'),
(97, 'nexo_other_details', '', 1, 0, 'system'),
(98, 'nexo_disable_frontend', 'enable', 1, 0, 'system'),
(99, 'nexo_logo_type', 'default', 1, 0, 'system'),
(100, 'nexo_logo_text', '', 1, 0, 'system'),
(101, 'nexo_logo_url', 'http://gulf-apps.om/wp-content/uploads/2016/01/GulfAppswe.png', 1, 0, 'system'),
(102, 'nexo_logo_width', '250', 1, 0, 'system'),
(103, 'nexo_logo_height', '76', 1, 0, 'system'),
(104, 'nexo_footer_text', 'www.gulf-apps.om', 1, 0, 'system'),
(105, 'nexo_date_format', '', 1, 0, 'system'),
(106, 'nexo_datetime_format', '', 1, 0, 'system'),
(107, 'nexo_js_datetime_format', '', 1, 0, 'system'),
(108, 'enable_quick_search', 'yes', 1, 0, 'system'),
(109, 'unit_price_changing', '', 1, 0, 'system'),
(110, 'nexo_enable_numpad', '', 1, 0, 'system'),
(111, 'keyshortcuts', '', 1, 0, 'system'),
(112, 'disable_partial_order', '', 1, 0, 'system'),
(113, 'show_item_taxes', '', 1, 0, 'system'),
(114, 'supply_receipt_col_1', '{customer_name}\r\n{customer_phone}\r\n{order_note}', 1, 0, 'system'),
(115, 'supply_receipt_col_2', '', 1, 0, 'system'),
(116, 'dashboard-sidebar', 'sidebar-expanded', 1, 3, 'system'),
(117, 'stock-manager-installed', 'true', 1, 0, 'system'),
(118, 'nexo_store', 'disabled', 1, 0, 'system'),
(119, 'first-name', '', 1, 4, 'users'),
(120, 'last-name', '', 1, 4, 'users'),
(121, 'theme-skin', 'skin-blue', 1, 4, 'users'),
(122, 'dashboard_widget_position', '{"1":["nexo_profile"],"2":["nexo_sales_income"],"3":["sale_type_new"]}', 1, 4, 'system'),
(123, 'dashboard-sidebar', 'sidebar-expanded', 1, 4, 'system'),
(124, 'migration_food-stock', NULL, 1, 0, 'system'),
(125, 'migration_stock-manager', NULL, 1, 0, 'system'),
(126, 'food-stock-installed', 'true', 1, 0, 'system'),
(127, 'payment_printer_name', 'Epson V4', 1, 0, 'users'),
(128, 'first-name', 'cashier', 1, 5, 'users'),
(129, 'last-name', 'cashier', 1, 5, 'users'),
(130, 'theme-skin', 'skin-blue', 1, 5, 'users'),
(131, 'first-name', 'shoper', 1, 6, 'users'),
(132, 'last-name', 'shoper', 1, 6, 'users'),
(133, 'theme-skin', 'skin-blue', 1, 6, 'users'),
(134, 'dashboard-sidebar', 'sidebar-expanded', 1, 5, 'system'),
(135, 'dashboard_widget_position', '{"1":["nexo_profile"]}', 1, 5, 'system'),
(136, 'migration_nexo', NULL, 1, 0, 'system'),
(137, 'dashboard_widget_position', '{"1":["nexo_profile"],"2":["nexo_sales_income"],"3":["sale_type_new"]}', 1, 6, 'system');

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_restapi_keys`
--

CREATE TABLE `tendoo_restapi_keys` (
  `id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `scopes` text,
  `app_name` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `user` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `expire` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tendoo_restapi_keys`
--

INSERT INTO `tendoo_restapi_keys` (`id`, `key`, `scopes`, `app_name`, `level`, `ignore_limits`, `user`, `date_created`, `expire`) VALUES
(1, '8FMHfiIOff31dAUDDN0CHa6pzwnbDCK7K99U9W0F', 'core', 'Tendoo CMS', 0, 0, 0, '2017-10-12 16:15:34', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tendoo_system_sessions`
--

CREATE TABLE `tendoo_system_sessions` (
  `id` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tendoo_aauth_groups`
--
ALTER TABLE `tendoo_aauth_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tendoo_aauth_perms`
--
ALTER TABLE `tendoo_aauth_perms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tendoo_aauth_perm_to_group`
--
ALTER TABLE `tendoo_aauth_perm_to_group`
  ADD PRIMARY KEY (`perm_id`,`group_id`);

--
-- Indexes for table `tendoo_aauth_perm_to_user`
--
ALTER TABLE `tendoo_aauth_perm_to_user`
  ADD PRIMARY KEY (`perm_id`,`user_id`);

--
-- Indexes for table `tendoo_aauth_pms`
--
ALTER TABLE `tendoo_aauth_pms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `full_index` (`id`,`sender_id`,`receiver_id`,`read`);

--
-- Indexes for table `tendoo_aauth_system_variables`
--
ALTER TABLE `tendoo_aauth_system_variables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tendoo_aauth_users`
--
ALTER TABLE `tendoo_aauth_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tendoo_aauth_user_to_group`
--
ALTER TABLE `tendoo_aauth_user_to_group`
  ADD PRIMARY KEY (`user_id`,`group_id`);

--
-- Indexes for table `tendoo_aauth_user_variables`
--
ALTER TABLE `tendoo_aauth_user_variables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_index` (`user_id`);

--
-- Indexes for table `tendoo_food_stock`
--
ALTER TABLE `tendoo_food_stock`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tendoo_food_stock_history`
--
ALTER TABLE `tendoo_food_stock_history`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tendoo_food_stock_item`
--
ALTER TABLE `tendoo_food_stock_item`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tendoo_nexo_arrivages`
--
ALTER TABLE `tendoo_nexo_arrivages`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tendoo_nexo_articles`
--
ALTER TABLE `tendoo_nexo_articles`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `SKU` (`SKU`),
  ADD UNIQUE KEY `CODEBAR` (`CODEBAR`);

--
-- Indexes for table `tendoo_nexo_articles_meta`
--
ALTER TABLE `tendoo_nexo_articles_meta`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tendoo_nexo_articles_stock_flow`
--
ALTER TABLE `tendoo_nexo_articles_stock_flow`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tendoo_nexo_articles_variations`
--
ALTER TABLE `tendoo_nexo_articles_variations`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tendoo_nexo_categories`
--
ALTER TABLE `tendoo_nexo_categories`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tendoo_nexo_clients`
--
ALTER TABLE `tendoo_nexo_clients`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tendoo_nexo_clients_address`
--
ALTER TABLE `tendoo_nexo_clients_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tendoo_nexo_clients_groups`
--
ALTER TABLE `tendoo_nexo_clients_groups`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tendoo_nexo_clients_meta`
--
ALTER TABLE `tendoo_nexo_clients_meta`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tendoo_nexo_commandes`
--
ALTER TABLE `tendoo_nexo_commandes`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `CODE` (`CODE`);

--
-- Indexes for table `tendoo_nexo_commandes_coupons`
--
ALTER TABLE `tendoo_nexo_commandes_coupons`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tendoo_nexo_commandes_meta`
--
ALTER TABLE `tendoo_nexo_commandes_meta`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tendoo_nexo_commandes_paiements`
--
ALTER TABLE `tendoo_nexo_commandes_paiements`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tendoo_nexo_commandes_produits`
--
ALTER TABLE `tendoo_nexo_commandes_produits`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tendoo_nexo_commandes_produits_meta`
--
ALTER TABLE `tendoo_nexo_commandes_produits_meta`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tendoo_nexo_commandes_refunds`
--
ALTER TABLE `tendoo_nexo_commandes_refunds`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tendoo_nexo_commandes_shippings`
--
ALTER TABLE `tendoo_nexo_commandes_shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tendoo_nexo_coupons`
--
ALTER TABLE `tendoo_nexo_coupons`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tendoo_nexo_fournisseurs`
--
ALTER TABLE `tendoo_nexo_fournisseurs`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tendoo_nexo_fournisseurs_history`
--
ALTER TABLE `tendoo_nexo_fournisseurs_history`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tendoo_nexo_historique`
--
ALTER TABLE `tendoo_nexo_historique`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tendoo_nexo_notices`
--
ALTER TABLE `tendoo_nexo_notices`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tendoo_nexo_premium_backups`
--
ALTER TABLE `tendoo_nexo_premium_backups`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tendoo_nexo_premium_factures`
--
ALTER TABLE `tendoo_nexo_premium_factures`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tendoo_nexo_premium_factures_categories`
--
ALTER TABLE `tendoo_nexo_premium_factures_categories`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tendoo_nexo_rayons`
--
ALTER TABLE `tendoo_nexo_rayons`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tendoo_nexo_registers`
--
ALTER TABLE `tendoo_nexo_registers`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tendoo_nexo_registers_activities`
--
ALTER TABLE `tendoo_nexo_registers_activities`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tendoo_nexo_restaurant_areas`
--
ALTER TABLE `tendoo_nexo_restaurant_areas`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tendoo_nexo_restaurant_kitchens`
--
ALTER TABLE `tendoo_nexo_restaurant_kitchens`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tendoo_nexo_restaurant_modifiers`
--
ALTER TABLE `tendoo_nexo_restaurant_modifiers`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tendoo_nexo_restaurant_modifiers_categories`
--
ALTER TABLE `tendoo_nexo_restaurant_modifiers_categories`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tendoo_nexo_restaurant_tables`
--
ALTER TABLE `tendoo_nexo_restaurant_tables`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tendoo_nexo_restaurant_tables_relation_orders`
--
ALTER TABLE `tendoo_nexo_restaurant_tables_relation_orders`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tendoo_nexo_restaurant_tables_sessions`
--
ALTER TABLE `tendoo_nexo_restaurant_tables_sessions`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tendoo_nexo_stock_transfert`
--
ALTER TABLE `tendoo_nexo_stock_transfert`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tendoo_nexo_stock_transfert_items`
--
ALTER TABLE `tendoo_nexo_stock_transfert_items`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tendoo_nexo_stores`
--
ALTER TABLE `tendoo_nexo_stores`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tendoo_nexo_stores_activities`
--
ALTER TABLE `tendoo_nexo_stores_activities`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tendoo_nexo_taxes`
--
ALTER TABLE `tendoo_nexo_taxes`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tendoo_options`
--
ALTER TABLE `tendoo_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tendoo_restapi_keys`
--
ALTER TABLE `tendoo_restapi_keys`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tendoo_aauth_groups`
--
ALTER TABLE `tendoo_aauth_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tendoo_aauth_perms`
--
ALTER TABLE `tendoo_aauth_perms`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;
--
-- AUTO_INCREMENT for table `tendoo_aauth_pms`
--
ALTER TABLE `tendoo_aauth_pms`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tendoo_aauth_system_variables`
--
ALTER TABLE `tendoo_aauth_system_variables`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tendoo_aauth_users`
--
ALTER TABLE `tendoo_aauth_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tendoo_aauth_user_variables`
--
ALTER TABLE `tendoo_aauth_user_variables`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tendoo_food_stock`
--
ALTER TABLE `tendoo_food_stock`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `tendoo_food_stock_history`
--
ALTER TABLE `tendoo_food_stock_history`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tendoo_food_stock_item`
--
ALTER TABLE `tendoo_food_stock_item`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `tendoo_nexo_arrivages`
--
ALTER TABLE `tendoo_nexo_arrivages`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tendoo_nexo_articles`
--
ALTER TABLE `tendoo_nexo_articles`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tendoo_nexo_articles_meta`
--
ALTER TABLE `tendoo_nexo_articles_meta`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tendoo_nexo_articles_stock_flow`
--
ALTER TABLE `tendoo_nexo_articles_stock_flow`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=311;
--
-- AUTO_INCREMENT for table `tendoo_nexo_articles_variations`
--
ALTER TABLE `tendoo_nexo_articles_variations`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tendoo_nexo_categories`
--
ALTER TABLE `tendoo_nexo_categories`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tendoo_nexo_clients`
--
ALTER TABLE `tendoo_nexo_clients`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tendoo_nexo_clients_address`
--
ALTER TABLE `tendoo_nexo_clients_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tendoo_nexo_clients_groups`
--
ALTER TABLE `tendoo_nexo_clients_groups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tendoo_nexo_clients_meta`
--
ALTER TABLE `tendoo_nexo_clients_meta`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tendoo_nexo_commandes`
--
ALTER TABLE `tendoo_nexo_commandes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;
--
-- AUTO_INCREMENT for table `tendoo_nexo_commandes_coupons`
--
ALTER TABLE `tendoo_nexo_commandes_coupons`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tendoo_nexo_commandes_meta`
--
ALTER TABLE `tendoo_nexo_commandes_meta`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;
--
-- AUTO_INCREMENT for table `tendoo_nexo_commandes_paiements`
--
ALTER TABLE `tendoo_nexo_commandes_paiements`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT for table `tendoo_nexo_commandes_produits`
--
ALTER TABLE `tendoo_nexo_commandes_produits`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=310;
--
-- AUTO_INCREMENT for table `tendoo_nexo_commandes_produits_meta`
--
ALTER TABLE `tendoo_nexo_commandes_produits_meta`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=947;
--
-- AUTO_INCREMENT for table `tendoo_nexo_commandes_refunds`
--
ALTER TABLE `tendoo_nexo_commandes_refunds`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tendoo_nexo_commandes_shippings`
--
ALTER TABLE `tendoo_nexo_commandes_shippings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tendoo_nexo_coupons`
--
ALTER TABLE `tendoo_nexo_coupons`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tendoo_nexo_fournisseurs`
--
ALTER TABLE `tendoo_nexo_fournisseurs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tendoo_nexo_fournisseurs_history`
--
ALTER TABLE `tendoo_nexo_fournisseurs_history`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tendoo_nexo_historique`
--
ALTER TABLE `tendoo_nexo_historique`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tendoo_nexo_notices`
--
ALTER TABLE `tendoo_nexo_notices`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tendoo_nexo_premium_backups`
--
ALTER TABLE `tendoo_nexo_premium_backups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tendoo_nexo_premium_factures`
--
ALTER TABLE `tendoo_nexo_premium_factures`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tendoo_nexo_premium_factures_categories`
--
ALTER TABLE `tendoo_nexo_premium_factures_categories`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tendoo_nexo_rayons`
--
ALTER TABLE `tendoo_nexo_rayons`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tendoo_nexo_registers`
--
ALTER TABLE `tendoo_nexo_registers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tendoo_nexo_registers_activities`
--
ALTER TABLE `tendoo_nexo_registers_activities`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tendoo_nexo_restaurant_areas`
--
ALTER TABLE `tendoo_nexo_restaurant_areas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tendoo_nexo_restaurant_kitchens`
--
ALTER TABLE `tendoo_nexo_restaurant_kitchens`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tendoo_nexo_restaurant_modifiers`
--
ALTER TABLE `tendoo_nexo_restaurant_modifiers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tendoo_nexo_restaurant_modifiers_categories`
--
ALTER TABLE `tendoo_nexo_restaurant_modifiers_categories`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tendoo_nexo_restaurant_tables`
--
ALTER TABLE `tendoo_nexo_restaurant_tables`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tendoo_nexo_restaurant_tables_relation_orders`
--
ALTER TABLE `tendoo_nexo_restaurant_tables_relation_orders`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tendoo_nexo_restaurant_tables_sessions`
--
ALTER TABLE `tendoo_nexo_restaurant_tables_sessions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tendoo_nexo_stock_transfert`
--
ALTER TABLE `tendoo_nexo_stock_transfert`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tendoo_nexo_stock_transfert_items`
--
ALTER TABLE `tendoo_nexo_stock_transfert_items`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tendoo_nexo_stores`
--
ALTER TABLE `tendoo_nexo_stores`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tendoo_nexo_stores_activities`
--
ALTER TABLE `tendoo_nexo_stores_activities`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tendoo_nexo_taxes`
--
ALTER TABLE `tendoo_nexo_taxes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tendoo_options`
--
ALTER TABLE `tendoo_options`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;
--
-- AUTO_INCREMENT for table `tendoo_restapi_keys`
--
ALTER TABLE `tendoo_restapi_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
