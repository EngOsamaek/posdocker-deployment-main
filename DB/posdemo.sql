-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 18, 2022 at 09:05 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `posdemo`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add pizza', 7, 'add_pizza'),
(26, 'Can change pizza', 7, 'change_pizza'),
(27, 'Can delete pizza', 7, 'delete_pizza'),
(28, 'Can view pizza', 7, 'view_pizza'),
(29, 'Can add burger', 8, 'add_burger'),
(30, 'Can change burger', 8, 'change_burger'),
(31, 'Can delete burger', 8, 'delete_burger'),
(32, 'Can view burger', 8, 'view_burger'),
(33, 'Can add bills', 9, 'add_bills'),
(34, 'Can change bills', 9, 'change_bills'),
(35, 'Can delete bills', 9, 'delete_bills'),
(36, 'Can view bills', 9, 'view_bills'),
(37, 'Can add menu_items', 10, 'add_menu_items'),
(38, 'Can change menu_items', 10, 'change_menu_items'),
(39, 'Can delete menu_items', 10, 'delete_menu_items'),
(40, 'Can view menu_items', 10, 'view_menu_items');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$320000$W4Xo6tX9On3KBFHBEkynxb$ixDaCaW2x+00L9KZ/P+Q5QhQrYi9csCv65DHgvZhINc=', '2022-02-17 14:31:50.472674', 1, 'rakan', '', '', 'rfarhoudah.2001@gmail.com', 1, 1, '2022-02-14 20:37:41.256184');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-02-14 20:41:38.588293', '1', 'Burger object (1)', 1, '[{\"added\": {}}]', 8, 1),
(2, '2022-02-14 20:42:04.715165', '2', 'Burger object (2)', 1, '[{\"added\": {}}]', 8, 1),
(3, '2022-02-14 20:43:03.542302', '1', 'Pizza object (1)', 1, '[{\"added\": {}}]', 7, 1),
(4, '2022-02-14 20:43:24.957272', '2', 'Pizza object (2)', 1, '[{\"added\": {}}]', 7, 1),
(5, '2022-02-15 18:41:25.291809', '3', 'Burger object (3)', 1, '[{\"added\": {}}]', 8, 1),
(6, '2022-02-17 19:53:45.164605', '1', 'menu_items object (1)', 1, '[{\"added\": {}}]', 10, 1),
(7, '2022-02-17 19:54:47.157603', '2', 'menu_items object (2)', 1, '[{\"added\": {}}]', 10, 1),
(8, '2022-02-17 19:55:23.489718', '3', 'menu_items object (3)', 1, '[{\"added\": {}}]', 10, 1),
(9, '2022-02-17 19:56:53.537442', '4', 'menu_items object (4)', 1, '[{\"added\": {}}]', 10, 1),
(10, '2022-02-17 19:57:33.693326', '5', 'menu_items object (5)', 1, '[{\"added\": {}}]', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(9, 'POS_App', 'bills'),
(8, 'POS_App', 'burger'),
(10, 'POS_App', 'menu_items'),
(7, 'POS_App', 'pizza'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-02-14 20:04:51.092894'),
(2, 'auth', '0001_initial', '2022-02-14 20:04:51.437783'),
(3, 'admin', '0001_initial', '2022-02-14 20:04:51.597692'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-02-14 20:04:51.605690'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-02-14 20:04:51.614686'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-02-14 20:04:51.664670'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-02-14 20:04:51.697660'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-02-14 20:04:51.713655'),
(9, 'auth', '0004_alter_user_username_opts', '2022-02-14 20:04:51.720653'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-02-14 20:04:51.756642'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-02-14 20:04:51.758640'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-02-14 20:04:51.766637'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-02-14 20:04:51.781633'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-02-14 20:04:51.794629'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-02-14 20:04:51.810624'),
(16, 'auth', '0011_update_proxy_permissions', '2022-02-14 20:04:51.818621'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-02-14 20:04:51.834617'),
(18, 'sessions', '0001_initial', '2022-02-14 20:04:51.858608'),
(19, 'POS_App', '0001_initial', '2022-02-14 20:23:04.982235'),
(20, 'POS_App', '0002_burger', '2022-02-14 20:27:41.357166'),
(21, 'POS_App', '0003_bills', '2022-02-17 14:46:56.651371'),
(22, 'POS_App', '0004_rename_items_bills_createdby', '2022-02-17 15:01:42.731985'),
(23, 'POS_App', '0005_rename_total_bills_total', '2022-02-17 15:02:21.974373'),
(24, 'POS_App', '0006_menu_items_delete_pizza', '2022-02-17 19:51:36.564741'),
(25, 'POS_App', '0007_bills_date_alter_bills_total', '2022-02-17 21:02:45.596494'),
(26, 'POS_App', '0008_alter_bills_date', '2022-02-17 21:06:21.276693');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('3q07aeltyhz4qa9nf2z10kdviin677n8', '.eJxVjEEOwiAQRe_C2hBAJoBL956BDDOjVA1NSrtqvLsh6UK3_733d5VxW2veuix5YnVRVp1-t4L0kjYAP7E9Zk1zW5ep6KHog3Z9m1ne18P9O6jY66hjAiEKhqkIenEsiY2NQMkzoZyLCHLwzqQAAExgTIni7tF4TGzV5wsdcDjy:1nJi74:QPQjV_bvOjzyaWXGvS4nIyiOWxELRIvPooPX3Eg6caI', '2022-02-28 20:38:22.704204'),
('lwzl3glw9eeii0s8xevugqnh41cmsnyk', '.eJxVjEEOwiAQRe_C2hBAJoBL956BDDOjVA1NSrtqvLsh6UK3_733d5VxW2veuix5YnVRVp1-t4L0kjYAP7E9Zk1zW5ep6KHog3Z9m1ne18P9O6jY66hjAiEKhqkIenEsiY2NQMkzoZyLCHLwzqQAAExgTIni7tF4TGzV5wsdcDjy:1nKhp0:1a0rm0mBZDfgfb5aFkC6gr5HTPerawD4QDo-4gNUPkI', '2022-03-03 14:31:50.477672');

-- --------------------------------------------------------

--
-- Table structure for table `pos_app_bills`
--

CREATE TABLE `pos_app_bills` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(120) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pos_app_bills`
--

INSERT INTO `pos_app_bills` (`id`, `createdby`, `total`, `date`) VALUES
(1, 'edwfefdf', '10.50', '2022-02-18 00:00:00.000000'),
(2, 'Test Uesr', '10.50', '2022-02-18 00:00:00.000000'),
(3, 'Test User', '40.00', '2022-02-18 00:00:00.000000'),
(4, 'Test User', '40.00', '2022-02-18 00:00:00.000000'),
(5, 'Test User', '40.00', '2022-02-18 00:00:00.000000'),
(6, 'Test User', '40.00', '2022-02-18 00:00:00.000000'),
(7, 'Test User', '40.00', '2022-02-18 00:00:00.000000'),
(8, 'Test User', '25.00', '2022-02-18 00:00:00.000000'),
(9, 'Test User', '30.00', '2022-02-18 00:00:00.000000'),
(10, 'Test User', '0.00', '2022-02-18 00:00:00.000000'),
(11, 'Test User', '0.00', '2022-02-18 00:00:00.000000'),
(12, 'Test User', '0.00', '2022-02-18 00:00:00.000000'),
(13, 'Test User', '30.00', '2022-02-18 00:00:00.000000'),
(14, 'Test User', '15.00', '2022-02-18 00:00:00.000000'),
(15, 'Test User', '15.00', '2022-02-18 00:00:00.000000'),
(16, 'Test User', '15.00', '2022-02-18 00:00:00.000000'),
(17, 'Test User', '30.00', '2022-02-18 00:00:00.000000'),
(18, 'Test User', '15.00', '2022-02-18 00:00:00.000000'),
(19, 'Test User', '30.00', '2022-02-18 00:00:00.000000'),
(20, 'Test User', '15.00', '2022-02-18 00:00:00.000000'),
(21, 'Test User', '30.00', '2022-02-18 00:00:00.000000'),
(22, 'Test User', '15.00', '2022-02-18 00:00:00.000000'),
(23, 'Test User', '120.00', '2022-02-18 00:00:00.000000'),
(24, 'Test User', '60.00', '2022-02-18 00:00:00.000000'),
(25, 'Test User', '15.00', '2022-02-18 00:00:00.000000'),
(26, 'Test User', '55.00', '2022-02-18 00:00:00.000000'),
(27, 'Test User', '15.99', '2022-02-18 00:00:00.000000'),
(28, 'Test User', '197.94', '2022-02-18 00:00:00.000000'),
(29, 'Test User', '80.94', '2022-02-18 00:00:00.000000'),
(30, 'Test User', '146.59', '2022-02-18 00:00:00.000000'),
(31, 'Test User', '31.98', '2022-02-18 00:00:00.000000'),
(32, 'Test User', '149.97', '2022-02-17 21:06:39.174845'),
(33, 'Test User', '130.60', '2022-02-17 21:11:00.064357'),
(34, 'Test User', '2728.57', '2022-02-17 21:16:02.563069'),
(35, 'Test User', '41.49', '2022-02-18 13:09:00.532593'),
(36, 'Test User', '15.99', '2022-02-18 13:09:02.740489'),
(37, 'Test User', '15.99', '2022-02-18 13:11:55.449022'),
(38, 'Test User', '15.99', '2022-02-18 13:11:58.676891'),
(39, 'Test User', '15.99', '2022-02-18 13:13:06.106552');

-- --------------------------------------------------------

--
-- Table structure for table `pos_app_burger`
--

CREATE TABLE `pos_app_burger` (
  `id` bigint(20) NOT NULL,
  `name` varchar(120) NOT NULL,
  `priceM` decimal(4,2) NOT NULL,
  `priceL` decimal(4,2) NOT NULL,
  `pImage` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pos_app_burger`
--

INSERT INTO `pos_app_burger` (`id`, `name`, `priceM`, `priceL`, `pImage`) VALUES
(1, 'Burger1', '10.50', '16.00', 'https://res.cloudinary.com/dmledf14h/image/upload/v1644871288/photo-1571091718767-18b5b1457add_x5xdai.jpg'),
(2, 'burger2', '13.20', '22.00', 'https://res.cloudinary.com/dmledf14h/image/upload/v1644871288/1623142221_om54ky.jpg'),
(3, 'Dark Burger', '15.20', '22.60', 'https://res.cloudinary.com/dmledf14h/image/upload/v1644950467/bb_cyulbv.jpg');

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
(1, 'INDI CHICKEN TIKKA', '** Due to supply issues, spring onions may not be available at your local store.** Seasoned chicken, diced paneer cheese', '15.99', 'https://res.cloudinary.com/dmledf14h/image/upload/v1644871368/depositphotos_50523105-stock-photo-pizza-with-tomatoes_d6b5ka.jpg'),
(2, 'BBQ MEATLOVERS', 'Crispy rasher bacon, pepperoni pieces, seasoned ground beef, smoky leg ham & Italian sausage, all on a BBQ sauce base', '25.50', 'https://res.cloudinary.com/dmledf14h/image/upload/v1645127680/AU_P019_en_hero_4055_yim9ij.jpg'),
(3, 'SIMPLY CHEESE', 'Simply topped with lots of melted mozzarella goodness', '15.99', 'https://res.cloudinary.com/dmledf14h/image/upload/v1645127717/AU_P015_en_hero_4055_ftq6vh.jpg'),
(4, 'EXTRA LARGE PEPPERONI', 'A Domino\'s classic. Slices of crispy pepperoni & creamy mozzarella', '30.15', 'https://res.cloudinary.com/dmledf14h/image/upload/v1645127808/AU_P0162XL_en_hero_8332_egjmbg.jpg'),
(5, 'MINI 3 MEATS', 'Domino\'s pepperoni, Italian sausage & seasoned ground beef, made on Deep Pan crust', '10.99', 'https://res.cloudinary.com/dmledf14h/image/upload/v1645127846/AU_P453DA_en_hero_9228_qihxyu.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `pos_app_bills`
--
ALTER TABLE `pos_app_bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_app_burger`
--
ALTER TABLE `pos_app_burger`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_app_menu_items`
--
ALTER TABLE `pos_app_menu_items`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `pos_app_bills`
--
ALTER TABLE `pos_app_bills`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `pos_app_burger`
--
ALTER TABLE `pos_app_burger`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pos_app_menu_items`
--
ALTER TABLE `pos_app_menu_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
