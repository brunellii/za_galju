-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2025 at 02:59 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data for table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"snap_to_grid\":\"off\",\"relation_lines\":\"true\",\"angular_direct\":\"direct\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"pizzeria\",\"table\":\"narudzbe\"},{\"db\":\"pizzeria\",\"table\":\"nacin_placanja\"},{\"db\":\"pizzeria\",\"table\":\"korisnici\"},{\"db\":\"pizzeria\",\"table\":\"bkp_narudzbe\"},{\"db\":\"pizzeria\",\"table\":\"mjesta\"},{\"db\":\"pizzeria\",\"table\":\"stavke_narudzbe\"},{\"db\":\"pizzeria\",\"table\":\"vrsta_hrane\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'pizzeria', 'korisnici', '{\"sorted_col\":\"`korisnici`.`korisnik_id` DESC\",\"CREATE_TIME\":\"2024-08-31 13:05:11\",\"col_order\":[0,1,2,3,5,4],\"col_visib\":[1,1,1,1,1,1]}', '2024-12-26 15:01:43'),
('root', 'pizzeria', 'narudzbe', '{\"sorted_col\":\"`narudzbe`.`korisnik_id` ASC\",\"CREATE_TIME\":\"2024-08-31 08:47:48\"}', '2024-12-28 15:39:12'),
('root', 'pizzeria', 'stavke_narudzbe', '{\"sorted_col\":\"`stavke_narudzbe`.`narudzba_id` DESC\"}', '2024-08-31 12:30:18'),
('root', 'pizzeria', 'vrsta_hrane', '{\"sorted_col\":\"`vrsta_hrane`.`vrsta_hrane_id` ASC\"}', '2024-09-02 21:06:39');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2025-01-09 13:59:08', '{\"Console\\/Mode\":\"collapse\",\"NavigationWidth\":395}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `pizzeria`
--
CREATE DATABASE IF NOT EXISTS `pizzeria` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pizzeria`;

-- --------------------------------------------------------

--
-- Table structure for table `korisnici`
--

CREATE TABLE `korisnici` (
  `korisnik_id` int(11) NOT NULL,
  `ime_prezime` varchar(255) NOT NULL,
  `ulica_br` varchar(255) NOT NULL,
  `mjesto_id` int(11) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `broj_mobitela` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `korisnici`
--

INSERT INTO `korisnici` (`korisnik_id`, `ime_prezime`, `ulica_br`, `mjesto_id`, `email`, `broj_mobitela`) VALUES
(1, 'Brunelli', 'A', NULL, 'antoniomarle@gmail.com', '0997853375'),
(2, 'Jasmin', 'starvor', NULL, 'jasminm@gmail.com', '876454356'),
(5, 'Brunelli', 'kolodvorska', NULL, 'batalinic@gmail.com', '12345678'),
(12, 'Brunelli', 'A', NULL, 'antoniomarle@gmail.com', '0997853375'),
(13, 'Bruno Tokalic', 'Kolodvorska', NULL, 'brunelli@gmail.com', '987654321'),
(14, 'Brunson', 'Doni', NULL, 'kruscic@gmail.com', '0987654321'),
(15, 'Dzeki', 'Music', NULL, 'dmusic@gmail.com', '0987654321'),
(16, 'Dzeki', 'Music', NULL, 'dmusic@gmail.com', '0987654321'),
(17, 'Petar Ivanda', 'Ante Starcevic 44', NULL, 'petarivanda@gmail.com', '098767854123'),
(18, 'Marija Tokalic', 'kolodvorska 22a', NULL, 'marijatokalic@gmail.com', '0981335557'),
(19, 'Senci', 'muhadina berunije 21', NULL, 'senci@gmail.com', '0987654321'),
(21, 'Marija Tokalic', 'rudeska 25', 4, 'marij@gmail.com', '9876123134'),
(22, 'Lucijic sarlijic', 'jagnedje 12', 21, 'lucija@gmail.com', '0987654321'),
(23, 'Marija', 'kolodvrska', 23, 'marijamarija@gmail.com', '0987654321'),
(24, 'Bruno Tokalic', 'dugo selo', 55, 'bruno@gmail.com', '0987654321'),
(25, 'a', 'b', 11, 'a@gmail.com', '9876543321'),
(26, 'Petar Ivanda', 'aehrujfiqw', 10, 'petar@gmail.com', '0987654321'),
(27, 'bruc', 'puska', 47, 'brunotokalic2@gmail.com', '0987654321'),
(28, 'Bruc', 'Puska', 23, 'brunotokalic90@gmail.com', '0987878787'),
(29, 'Bruneli', 'bruniqi', 50, 'brunotokalic2@gmail.com', '0987654321'),
(30, 'Bruceli', 'bruc', 35, 'brunotokalic2@gmail.com', '0987654321'),
(31, 'broun', 'boun', 50, 'brunotokalic2@gmail.com', '0987654321'),
(32, 'bruc', 'the', 55, 'brunelli@gmail.com', '12314541514'),
(33, 'bruc', 'the', 8, 'brunotokalic2@gmail.com', '123123123123'),
(34, 'Marija', 'Tokalic', 50, 'tokalicmarija1@gmail.com', '0912314134'),
(35, 'bruc', 'aaaa', 55, 'brunotokalic2@gmail.com', '1-3498134134'),
(36, 'Marija', 'Tokalic', 21, 'tokalicmarija1@gmail.com', '123123123123123'),
(37, 'brunellichickenoni', 'kolodvro', 55, 'brunotokalic90@gmail.com', '090987123134'),
(38, 'Lucija', 'Sarlija', 50, 'sarlija.lucija117@gmail.com', '0987654321'),
(39, 'Marijeta', 'Marijeta', 34, 'tokalicmarija1@gmail.com', '0987654321'),
(40, 'Bruno', 'Kasinska', 30, 'brunotokalic2@gmail.com', '0987654321'),
(41, 'B', 'a', 43, 'brunotokalic2@gmail.com', '19213012312312'),
(42, 'b', 'a', 47, 'brunotokalic2@gmail.com', '0987654321'),
(43, 'Lucija', 'a', 43, 'sarlija.lucija117@gmail.com', '1234567890'),
(44, 'franelli', 'martinbreg', 50, 'drmicfran2@gmail.com', '0987654321'),
(45, 'Bruno Tokalic', 'kasinska', 56, 'pizzasopranos40@gmail.com', '0987654321'),
(46, 'Brunelli', 'kolodvor', 21, 'brunotokalic2@gmail.com', '0987654321'),
(47, 'bruno', 'toks', 6, 'brunotokalic2@gmail.com', '0987654321'),
(48, 'bruno', 'toks', 43, 'brunotokalic2@gmail.com', '0987654321'),
(49, 'brunelli', 'chickens', 55, 'brunotokalic2@gmail.com', '0987654321'),
(50, 'bruno', 'tokalic', 35, 'brunotokalic2@gmail.com', '09876567890'),
(51, 'jura', 'kollodvor', 55, 'brunotokalic2@gmail.com', '0987654321'),
(52, 'brun', 'brun', 43, 'brunotokalic2@gmail.com', '0987654321'),
(53, 'bruno', 'bruno', 43, 'brunotokalic2@gmail.com', '0987543123'),
(54, 'bruno', 'bruno', 55, 'brunotokalic2@gmail.com', '9129830812031'),
(55, 'bruno tokalic', 'kolodvor', 55, 'brunotokalic2@gmail.com', '09876545123'),
(56, 'Bruno Tokalic', 'Kolodvor', 13, 'brunotokalic2@gmail.com', '0987654321'),
(57, 'br', 'br', 43, 'brunotokalic2@gmail.com', '0987654321'),
(58, 'bruno tokalic', 'krastovac', 43, 'brunotokalic2@gmail.com', '123123123123123123'),
(59, 'bruc', 'bruc', 11, 'brunotokalic2@gmail.com', '0987654321'),
(61, 'brunelli', 'brunelijeva', 55, 'brunotokalic2@gmail.com', '0987654321'),
(62, 'brunoi', 'bruno', 35, 'brunotokalic2@gmail.com', '09987654321'),
(63, 'bruno', 'bruno', 47, 'brunotokalic2@gmail.com', '0987654321'),
(64, 'br', 'br', 55, 'brunotokalic2@gmail.com', '123'),
(65, 'brunotokalic2@gmail.com', 'brunotokalic2@gmail.com', 50, 'brunotokalic2@gmail.com', '123'),
(66, 'a', 'a', 35, 'brunotokalic2@gmail.com', '0987654321'),
(67, 'b', 'b', 43, 'brunotokalic2@gmail.com', '0987654321'),
(68, 'br', 'br', 50, 'brunotokalic2@gmail.com', '0987654321'),
(69, 'bqqq', 'bqqq', 11, 'brunotokalic2@gmail.com', '0987654321'),
(70, 'Roko Tokalic', 'zmaj', 40, 'brunotokalic2@gmail.com', '0987654321'),
(71, 'brunelli', 'bubijeva', 56, 'brunobruno@gmail.com', '0987654321'),
(72, 'brunneli', 'bubijeva', 58, 'brunotokalic@gmail.com', '0987654321'),
(73, 'bruno', 'bruno', 23, 'bruno@gmail.com', '0987654321'),
(74, 'Bruc', 'kolodvorska 22a', 23, 'brunotokalic90@gmail.com', '0997853375'),
(75, 'bruno', 'kutak 21', 21, 'brunotokalic90@gmail.com', '997853375'),
(76, 'bruno', 'bruno', 43, 'brunotokalic90@gmail', '0997853375'),
(77, 'b', 'a', 47, 'brunotokalic90@gmail.com', '0997853375'),
(78, 'b', 'a', 11, 'brunotokalic90@gmail.com', '0997853375'),
(79, 'b', 't', 23, 'brunotokalic90@gmail.com', '0997853375'),
(80, 'bruno', 'tokalic', 50, 'brunotokalic90@gmail.com', '0997853375'),
(81, 'Bruno Tokalic', 'kolodvorska', 27, 'brunotokalic90@gmail.com', '0997853375'),
(82, 'brunotokalic', 'kolodvroska', 6, 'brunotokalic2@gmail.com', '0997853375'),
(83, 'bruno', 'bruno', 55, 'brunotokalic2@gmail.com', '0997853375'),
(84, 'brunotokalic', 'aaaaa', 43, 'brunotokalic90@gmail.com', '0997853375'),
(85, 'bruno tokalic', 'kolodvorska', 50, 'brunotokalic90@gmail.com', '997853375'),
(86, 'b', 'a', 50, '', '0997854412'),
(87, 'brunotokalic', 'bru', 23, '', '987654321'),
(88, 'b', 'a', 50, '', '91817456792'),
(89, 'testis testis', 'testis', 47, '', '09876541712'),
(90, 'testis2', 'test', 11, '', '987654321'),
(91, 'a', 'b', 23, '', '123123123123123'),
(92, 'b', 'a', 50, '', '123123123123'),
(93, 'bructest', 'testis', 47, '', '0997845541'),
(94, 'bruno tokalic', 'kolodvorska', 43, '', '0997853375'),
(98, 'bruconja', 'aaa', 2, '', '8778987879798'),
(99, 'dikidiki', 'kolol', 50, '', '123123123123'),
(100, 'trolololo', 'a', 55, '', '123123123123123'),
(101, 'kakakakaka', 'kakakkakaak', 55, '', '123123123123123'),
(102, 'kukulele', 'aaaaa', 11, '', '1112312312312'),
(103, 'brunotokstokalic', 'kolodvorska', 47, '', '74256258245'),
(104, 'brcubruc', 'kolo', 11, '', '11321231231231231231'),
(105, 'brunotokalic', 'kololo', 50, '', '667567567567567'),
(106, 'brururur', 'aaaa', 35, '', '+777259245245245'),
(107, 'brrrrrrr', 'uuuuuuuu', 50, '', '+385997853375'),
(108, 'brurrrrrrrrr', 'aaaaa', 50, 'kruhuhu@gmail.com', '+888965112547'),
(109, 'bruneeeeellli', 'kolodvor', 50, 'bruno@gmail.com', '0997853375'),
(110, 'kokoko', 'kokoko1', 2, '', '+385997853375'),
(111, 'bruno tokalic', 'kolo', 35, 'brunotokalic2@gmail.com', '+385997853375'),
(112, 'bruno tokalic', 'kolo', 50, 'brunotokalic2@gmail.com', '385997853375'),
(113, 'brunotokalic', 'bububub', 6, 'brunotokalic2@gmail.com', '385997853375'),
(114, 'brucbrc', 'a', 43, 'brunotokalic2@gmail.com', '385997853375'),
(115, 'aa', 'aa', 50, '', '+385997853375'),
(116, 'b', 'a', 55, '', '+385997853375');

-- --------------------------------------------------------

--
-- Table structure for table `mjesta`
--

CREATE TABLE `mjesta` (
  `mjesto_id` int(11) NOT NULL,
  `naziv` varchar(100) NOT NULL,
  `post_broj` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mjesta`
--

INSERT INTO `mjesta` (`mjesto_id`, `naziv`, `post_broj`) VALUES
(1, 'Zagreb, Centar grada', '10000'),
(2, 'Zagreb, Buzin', '10020'),
(3, 'Zagreb, Središće', '10040'),
(4, 'Zagreb, Rudeš', '10090'),
(5, 'Zagreb, Peščenica - Žitnjak', '10110'),
(6, 'Zagreb, Dugave', '10115'),
(7, 'Zagreb, Zapruđe', '10116'),
(8, 'Zagreb, Dubrava', '10120'),
(9, 'Zagreb, Maksimir', '10130'),
(10, 'Zagreb, Ravnice', '10132'),
(11, 'Zagreb, Bukovac', '10135'),
(12, 'Zagreb, Retkovec', '10136'),
(13, 'Zagreb, Čučerje', '10137'),
(14, 'Zagreb, Trnava', '10138'),
(15, 'Zagreb, Trešnjevka sjever', '10140'),
(16, 'Zagreb, Jarun', '10141'),
(17, 'Zagreb, Vrbani', '10142'),
(18, 'Zagreb, Prečko', '10145'),
(19, 'Zagreb, Špansko', '10146'),
(20, 'Zagreb, Malešnica', '10147'),
(21, 'Zagreb, Gajnice', '10148'),
(22, 'Zagreb, Novi Zagreb - Zapad', '10150'),
(23, 'Zagreb, Blato', '10151'),
(24, 'Zagreb, Savski Gaj', '10152'),
(25, 'Zagreb, Siget', '10153'),
(26, 'Zagreb, Lanište', '10154'),
(27, 'Zagreb, Lučko', '10155'),
(28, 'Zagreb, Novi Zagreb - Istok', '10160'),
(29, 'Zagreb, Sopot', '10161'),
(30, 'Zagreb, Utrine', '10162'),
(31, 'Zagreb, Travno', '10163'),
(32, 'Zagreb, Sloboština', '10164'),
(33, 'Zagreb, Jakuševec', '10165'),
(34, 'Zagreb, Buzin', '10166'),
(35, 'Zagreb, Hrelić', '10167'),
(36, 'Zagreb, Sesvete', '10170'),
(37, 'Zagreb, Sesvetski Kraljevec', '10171'),
(38, 'Zagreb, Sesvetska Sela', '10172'),
(39, 'Zagreb, Sesvetski Kraljevec - Kašina', '10173'),
(40, 'Zagreb, Kašina', '10174'),
(41, 'Zagreb, Soblinec', '10175'),
(42, 'Zagreb, Popovec', '10176'),
(43, 'Zagreb, Goranec', '10177'),
(44, 'Zagreb, Kučilovina', '10178'),
(45, 'Zagreb, Vugrovec Donji', '10179'),
(46, 'Zagreb, Črnomerec', '10180'),
(47, 'Zagreb, Bijenik', '10181'),
(48, 'Zagreb, Vrhovec', '10182'),
(49, 'Zagreb, Sveti Duh', '10183'),
(50, 'Zagreb, Gornji Stenjevec', '10184'),
(51, 'Zagreb, Šestine', '10185'),
(52, 'Zagreb, Podsljeme', '10190'),
(53, 'Zagreb, Stenjevec', '10200'),
(54, 'Zagreb, Podsused - Vrapče', '10250'),
(55, 'Zagreb, Gornja Bistra', '10251'),
(56, 'Zagreb, Donja Bistra', '10255'),
(57, 'Zagreb, Hrvatski Leskovac', '10256'),
(58, 'Zagreb, Kraljevečki Novaki', '10257'),
(59, 'Zagreb, Špansko', '10260'),
(60, 'Zagreb, Zaprešić (Područje zapadno od Zagreba)', '10290'),
(61, 'Zagreb, Sesvetski Kraljevec', '10310');

-- --------------------------------------------------------

--
-- Table structure for table `nacin_placanja`
--

CREATE TABLE `nacin_placanja` (
  `nacin_placanja_id` int(11) NOT NULL,
  `naziv_placanja` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nacin_placanja`
--

INSERT INTO `nacin_placanja` (`nacin_placanja_id`, `naziv_placanja`) VALUES
(1, 'Cash'),
(2, 'Card');

-- --------------------------------------------------------

--
-- Table structure for table `narudzbe`
--

CREATE TABLE `narudzbe` (
  `narudzba_id` int(11) NOT NULL,
  `cijena_narudzbe` decimal(10,2) NOT NULL,
  `datum_dostave` date DEFAULT curdate(),
  `datum_narudzbe` date DEFAULT curdate(),
  `korisnik_id` int(11) DEFAULT NULL,
  `nacin_placanja_id` int(11) DEFAULT NULL,
  `status_narudzbe` enum('waiting','preparing','delivery','completed','canceled') NOT NULL DEFAULT 'waiting'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `narudzbe`
--

INSERT INTO `narudzbe` (`narudzba_id`, `cijena_narudzbe`, `datum_dostave`, `datum_narudzbe`, `korisnik_id`, `nacin_placanja_id`, `status_narudzbe`) VALUES
(1, 12.00, '2024-08-31', '2024-08-31', 1, 1, 'completed'),
(2, 42.00, '2024-08-31', '2024-08-31', 2, 2, 'completed'),
(3, 41.00, '2024-08-31', '2024-08-31', 5, 1, 'completed'),
(13, 27.00, '2024-08-31', '2024-08-31', 1, 1, 'completed'),
(18, 34.00, '2024-08-31', '2024-08-31', 1, 1, 'waiting'),
(19, 34.00, '2024-08-31', '2024-08-31', 2, 1, 'waiting'),
(20, 13.00, '2024-08-31', '2024-08-31', 12, 1, 'waiting'),
(21, 14.00, '2024-08-31', '2024-08-31', 13, 2, 'waiting'),
(22, 29.00, '2024-08-31', '2024-08-31', 14, 2, 'waiting'),
(23, 29.00, '2024-08-31', '2024-08-31', 15, 1, 'waiting'),
(24, 29.00, '2024-08-31', '2024-08-31', 16, 1, 'waiting'),
(25, 69.00, '2024-08-31', '2024-08-31', 17, 1, 'waiting'),
(26, 15.00, '2024-08-31', '2024-08-31', 18, 1, 'waiting'),
(27, 14.00, '2024-08-31', '2024-08-31', 19, 1, 'waiting'),
(28, 16.00, '2024-08-31', '2024-08-31', 21, 1, 'waiting'),
(29, 16.00, '2024-08-31', '2024-08-31', 22, 1, 'waiting'),
(30, 16.00, '2024-08-31', '2024-08-31', 23, 1, 'waiting'),
(31, 14.00, '2024-08-31', '2024-08-31', 24, 2, 'waiting'),
(32, 13.00, '2024-08-31', '2024-08-31', 25, 1, 'waiting'),
(33, 14.00, '2024-08-31', '2024-08-31', 26, 1, 'waiting'),
(34, 12.00, '2024-08-31', '2024-08-31', 27, 1, 'waiting'),
(35, 12.00, '2024-08-31', '2024-08-31', 28, 2, 'waiting'),
(36, 15.00, '2024-08-31', '2024-08-31', 29, 1, 'waiting'),
(37, 15.00, '2024-08-31', '2024-08-31', 30, 1, 'waiting'),
(38, 15.00, '2024-08-31', '2024-08-31', 31, 1, 'waiting'),
(39, 14.00, '2024-09-01', '2024-09-01', 32, 1, 'waiting'),
(40, 15.00, '2024-09-01', '2024-09-01', 33, 1, 'waiting'),
(41, 15.00, '2024-09-01', '2024-09-01', 34, 1, 'waiting'),
(42, 14.00, '2024-09-01', '2024-09-01', 35, 1, 'waiting'),
(43, 16.00, '2024-09-01', '2024-09-01', 36, 1, 'waiting'),
(44, 15.00, '2024-09-01', '2024-09-01', 37, 1, 'waiting'),
(45, 14.00, '2024-09-01', '2024-09-01', 38, 1, 'waiting'),
(46, 14.00, '2024-09-01', '2024-09-01', 39, 1, 'waiting'),
(47, 14.00, '2024-09-01', '2024-09-01', 40, 2, 'waiting'),
(48, 29.00, '2024-09-01', '2024-09-01', 41, 1, 'waiting'),
(49, 15.00, '2024-09-01', '2024-09-01', 42, 1, 'waiting'),
(50, 44.00, '2024-09-01', '2024-09-01', 43, 1, 'preparing'),
(51, 15.00, '2024-09-01', '2024-09-01', 44, 1, 'waiting'),
(52, 15.00, '2024-09-02', '2024-09-02', 45, 1, 'waiting'),
(53, 14.00, '2024-09-02', '2024-09-02', 46, 1, 'waiting'),
(54, 29.00, '2024-09-02', '2024-09-02', 47, 1, 'waiting'),
(55, 42.00, '2024-09-02', '2024-09-02', 48, 1, 'waiting'),
(56, 15.00, '2024-09-04', '2024-09-04', 49, 1, 'waiting'),
(57, 16.00, '2024-09-04', '2024-09-04', 50, 1, 'waiting'),
(58, 16.00, '2024-09-04', '2024-09-04', 51, 1, 'waiting'),
(59, 16.00, '2024-09-04', '2024-09-04', 52, 1, 'waiting'),
(60, 15.00, '2024-09-04', '2024-09-04', 53, 1, 'waiting'),
(61, 46.00, '2024-09-04', '2024-09-04', 54, 1, 'waiting'),
(62, 15.00, '2024-09-04', '2024-09-04', 55, 1, 'waiting'),
(63, 31.00, '2024-09-04', '2024-09-04', 56, 1, 'waiting'),
(64, 15.00, '2024-09-04', '2024-09-04', 57, 1, 'waiting'),
(65, 17.00, '2024-09-04', '2024-09-04', 58, 1, 'waiting'),
(66, 17.00, '2024-09-04', '2024-09-04', 59, 1, 'waiting'),
(67, 25.00, '2024-09-04', '2024-09-04', 61, 1, 'waiting'),
(68, 16.00, '2024-09-04', '2024-09-04', 62, 1, 'waiting'),
(69, 12.00, '2024-09-04', '2024-09-04', 63, 1, 'waiting'),
(70, 15.00, '2024-09-04', '2024-09-04', 64, 1, 'waiting'),
(71, 16.00, '2024-09-04', '2024-09-04', 65, 1, 'waiting'),
(72, 14.00, '2024-09-04', '2024-09-04', 66, 1, 'waiting'),
(73, 15.00, '2024-09-04', '2024-09-04', 67, 1, 'waiting'),
(74, 14.00, '2024-09-04', '2024-09-04', 68, 1, 'waiting'),
(75, 14.00, '2024-09-04', '2024-09-04', 69, 1, 'waiting'),
(76, 18.00, '2024-09-07', '2024-09-07', 70, 1, 'waiting'),
(77, 41.00, '2024-09-11', '2024-09-11', 71, 1, 'waiting'),
(78, 15.00, '2024-09-11', '2024-09-11', 72, 1, 'waiting'),
(79, 14.00, '2024-09-11', '2024-09-11', 73, 1, 'waiting'),
(80, 12.00, '2024-12-21', '2024-12-21', 74, 1, 'waiting'),
(81, 48.00, '2024-12-21', '2024-12-21', 75, 1, 'waiting'),
(82, 14.00, '2024-12-21', '2024-12-21', 76, 1, 'waiting'),
(83, 14.00, '2024-12-21', '2024-12-21', 77, 1, 'waiting'),
(84, 28.00, '2024-12-21', '2024-12-21', 78, 1, 'waiting'),
(85, 15.00, '2024-12-21', '2024-12-21', 79, 1, 'waiting'),
(86, 12.00, '2024-12-21', '2024-12-21', 80, 1, 'waiting'),
(87, 32.00, '2024-12-21', '2024-12-21', 81, 1, 'waiting'),
(88, 16.00, '2024-12-23', '2024-12-23', 82, 1, 'waiting'),
(89, 14.00, '2024-12-23', '2024-12-23', 83, 1, 'waiting'),
(90, 14.00, '2024-12-23', '2024-12-23', 84, 1, 'waiting'),
(91, 80.00, '2024-12-26', '2024-12-26', 85, 1, 'waiting'),
(92, 32.00, '2024-12-26', '2024-12-26', 86, 1, 'waiting'),
(93, 15.00, '2024-12-26', '2024-12-26', 87, 2, 'waiting'),
(94, 30.00, '2024-12-26', '2024-12-26', 88, 2, 'waiting'),
(95, 30.00, '2024-12-26', '2024-12-26', 89, 1, 'waiting'),
(96, 15.00, '2024-12-26', '2024-12-26', 90, 1, 'waiting'),
(97, 30.00, '2024-12-26', '2024-12-26', 91, 2, 'waiting'),
(98, 15.00, '2024-12-26', '2024-12-26', 92, 1, 'waiting'),
(99, 17.00, '2024-12-26', '2024-12-26', 93, 1, 'waiting'),
(100, 15.00, '2024-12-28', '2024-12-28', 94, 1, 'completed'),
(104, 67.00, '2024-12-28', '2024-12-28', 98, 1, 'waiting'),
(105, 15.00, '2024-12-29', '2024-12-28', 99, 1, 'waiting'),
(106, 12.00, '2024-12-29', '2024-12-28', 100, 1, 'completed'),
(107, 17.00, '2024-12-29', '2024-12-28', 101, 1, ''),
(108, 17.00, '2024-12-29', '2024-12-28', 102, 1, ''),
(109, 17.00, '2024-12-29', '2024-12-28', 103, 1, ''),
(110, 15.00, '2024-12-29', '2024-12-28', 104, 1, ''),
(111, 15.00, '2024-12-29', '2024-12-28', 105, 1, ''),
(112, 14.00, '2024-12-29', '2024-12-28', 106, 1, ''),
(113, 14.00, '2024-12-29', '2024-12-28', 107, 1, ''),
(114, 15.00, '2024-12-29', '2024-12-28', 108, 1, ''),
(115, 15.00, '2024-12-29', '2024-12-28', 109, 1, ''),
(116, 32.00, '2025-01-08', '2025-01-07', 110, 2, ''),
(117, 60.00, '2025-01-08', '2025-01-07', 111, 1, ''),
(118, 15.00, '2025-01-08', '2025-01-07', 112, 1, ''),
(119, 15.00, '2025-01-08', '2025-01-07', 113, 1, ''),
(120, 12.00, '2025-01-08', '2025-01-07', 114, 1, ''),
(121, 30.00, '2025-01-09', '2025-01-08', 115, 1, ''),
(122, 15.00, '2025-01-09', '2025-01-08', 116, 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `stavke_narudzbe`
--

CREATE TABLE `stavke_narudzbe` (
  `stavka_id` int(11) NOT NULL,
  `narudzba_id` int(11) DEFAULT NULL,
  `vrsta_hrane_id` int(11) DEFAULT NULL,
  `cijena_stavke` decimal(10,2) NOT NULL,
  `kolicina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stavke_narudzbe`
--

INSERT INTO `stavke_narudzbe` (`stavka_id`, `narudzba_id`, `vrsta_hrane_id`, `cijena_stavke`, `kolicina`) VALUES
(1, 1, NULL, 12.00, 1),
(2, 2, NULL, 42.00, 1),
(3, 3, NULL, 41.00, 1),
(4, 13, 1, 0.00, 1),
(5, 13, 11, 0.00, 1),
(6, 18, 5, 16.00, 1),
(7, 18, 6, 18.00, 1),
(8, 19, 5, 16.00, 1),
(9, 19, 6, 18.00, 1),
(10, 20, 4, 13.00, 1),
(11, 21, 3, 14.00, 1),
(12, 22, 2, 15.00, 1),
(13, 22, 3, 14.00, 1),
(14, 23, 2, 15.00, 1),
(15, 23, 3, 14.00, 1),
(16, 24, 2, 15.00, 1),
(17, 24, 3, 14.00, 1),
(18, 25, 2, 15.00, 2),
(19, 25, 3, 14.00, 1),
(20, 25, 1, 12.00, 1),
(21, 25, 4, 13.00, 1),
(22, 26, 2, 15.00, 1),
(23, 27, 3, 14.00, 1),
(24, 28, 13, 16.00, 1),
(25, 29, 5, 16.00, 1),
(26, 30, 5, 16.00, 1),
(27, 31, 7, 14.00, 1),
(28, 32, 4, 13.00, 1),
(29, 33, 7, 14.00, 1),
(30, 34, 1, 12.00, 1),
(31, 35, 1, 12.00, 1),
(32, 36, 2, 15.00, 1),
(33, 37, 2, 15.00, 1),
(34, 38, 2, 15.00, 1),
(35, 39, 3, 14.00, 1),
(36, 40, 2, 15.00, 1),
(37, 41, 2, 15.00, 1),
(38, 42, 3, 14.00, 1),
(39, 43, 13, 16.00, 1),
(40, 44, 11, 15.00, 1),
(41, 45, 3, 14.00, 1),
(42, 46, 3, 14.00, 1),
(43, 47, 3, 14.00, 1),
(44, 48, 2, 15.00, 1),
(45, 48, 3, 14.00, 1),
(46, 49, 2, 15.00, 1),
(47, 50, 2, 15.00, 2),
(48, 50, 3, 14.00, 1),
(49, 51, 2, 15.00, 1),
(50, 52, 2, 15.00, 1),
(51, 53, 20, 18.00, 1),
(52, 54, 20, 14.00, 1),
(53, 54, 13, 15.00, 1),
(54, 55, 14, 13.00, 2),
(55, 55, 15, 16.00, 1),
(56, 56, 2, 15.00, 1),
(57, 57, 12, 16.00, 1),
(58, 58, 12, 16.00, 1),
(59, 59, 12, 16.00, 1),
(60, 60, 2, 15.00, 1),
(61, 61, 11, 17.00, 1),
(62, 61, 12, 16.00, 1),
(63, 61, 14, 13.00, 1),
(64, 62, 2, 15.00, 1),
(65, 63, 2, 15.00, 1),
(66, 63, 12, 16.00, 1),
(67, 64, 2, 15.00, 1),
(68, 65, 11, 17.00, 1),
(69, 66, 11, 17.00, 1),
(70, 67, 1, 12.00, 1),
(71, 67, 14, 13.00, 1),
(72, 68, 12, 16.00, 1),
(73, 69, 1, 12.00, 1),
(74, 70, 2, 15.00, 1),
(75, 71, 12, 16.00, 1),
(76, 72, 20, 14.00, 1),
(77, 73, 2, 15.00, 1),
(78, 74, 20, 14.00, 1),
(79, 75, 20, 14.00, 1),
(80, 76, 5, 18.00, 1),
(81, 77, 13, 15.00, 1),
(82, 77, 14, 13.00, 1),
(83, 77, 3, 13.00, 1),
(84, 78, 2, 15.00, 1),
(85, 79, 20, 14.00, 1),
(86, 80, 1, 12.00, 1),
(87, 81, 4, 16.00, 1),
(88, 81, 5, 18.00, 1),
(89, 81, 6, 14.00, 1),
(90, 82, 20, 14.00, 1),
(91, 83, 20, 14.00, 1),
(92, 84, 12, 16.00, 1),
(93, 84, 1, 12.00, 1),
(94, 85, 2, 15.00, 1),
(95, 86, 1, 12.00, 1),
(96, 87, 4, 16.00, 1),
(97, 87, 15, 16.00, 1),
(98, 88, 12, 16.00, 1),
(99, 89, 20, 14.00, 1),
(100, 90, 20, 14.00, 1),
(101, 91, 9, 12.00, 4),
(102, 91, 12, 16.00, 2),
(103, 92, 12, 16.00, 2),
(104, 93, 2, 15.00, 1),
(105, 94, 8, 15.00, 2),
(106, 95, 2, 15.00, 2),
(107, 96, 2, 15.00, 1),
(108, 97, 8, 15.00, 2),
(109, 98, 8, 15.00, 1),
(110, 99, 11, 17.00, 1),
(111, 100, 8, 15.00, 1),
(112, 104, 3, 13.00, 2),
(113, 104, 8, 15.00, 1),
(114, 104, 9, 12.00, 1),
(115, 104, 10, 14.00, 1),
(116, 105, 2, 15.00, 1),
(117, 106, 9, 12.00, 1),
(118, 107, 11, 17.00, 1),
(119, 108, 11, 17.00, 1),
(120, 109, 11, 17.00, 1),
(121, 110, 2, 15.00, 1),
(122, 111, 8, 15.00, 1),
(123, 112, 10, 14.00, 1),
(124, 113, 10, 14.00, 1),
(125, 114, 8, 15.00, 1),
(126, 115, 2, 15.00, 1),
(127, 116, 12, 16.00, 2),
(128, 117, 8, 15.00, 4),
(129, 118, 2, 15.00, 1),
(130, 119, 2, 15.00, 1),
(131, 120, 9, 12.00, 1),
(132, 121, 2, 15.00, 2),
(133, 122, 2, 15.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vrsta_hrane`
--

CREATE TABLE `vrsta_hrane` (
  `vrsta_hrane_id` int(11) NOT NULL,
  `naziv` varchar(100) NOT NULL,
  `vazeca_cijena` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vrsta_hrane`
--

INSERT INTO `vrsta_hrane` (`vrsta_hrane_id`, `naziv`, `vazeca_cijena`) VALUES
(1, 'Margherita', 12.00),
(2, 'Pepperoni', 15.00),
(3, 'Seafood Platter', 13.00),
(4, 'Charcuterie Board', 16.00),
(5, 'Mixed Grill Platter', 18.00),
(6, 'Mediterranean Platter', 14.00),
(7, 'Spaghetti Carbonara', 15.00),
(8, 'Buffalo', 15.00),
(9, 'Mushroom', 12.00),
(10, 'Four Cheese', 14.00),
(11, 'Penne Arrabbiata', 17.00),
(12, 'Fettuccine Alfredo', 16.00),
(13, 'BBQ Bacon Burger', 15.00),
(14, 'Lasagna Bolognese', 13.00),
(15, 'Mushroom Swiss Burger', 16.00),
(16, 'Veggie Burger', 14.00),
(17, 'Ribeye Steak', 15.00),
(18, 'Filet Mignon', 12.00),
(19, 'New York Strip', 18.00),
(20, 'T-Bone Steak', 14.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `korisnici`
--
ALTER TABLE `korisnici`
  ADD PRIMARY KEY (`korisnik_id`),
  ADD KEY `mjesto_id` (`mjesto_id`);

--
-- Indexes for table `mjesta`
--
ALTER TABLE `mjesta`
  ADD PRIMARY KEY (`mjesto_id`);

--
-- Indexes for table `nacin_placanja`
--
ALTER TABLE `nacin_placanja`
  ADD PRIMARY KEY (`nacin_placanja_id`);

--
-- Indexes for table `narudzbe`
--
ALTER TABLE `narudzbe`
  ADD PRIMARY KEY (`narudzba_id`),
  ADD KEY `korisnik_id` (`korisnik_id`),
  ADD KEY `nacin_placanja_id` (`nacin_placanja_id`);

--
-- Indexes for table `stavke_narudzbe`
--
ALTER TABLE `stavke_narudzbe`
  ADD PRIMARY KEY (`stavka_id`),
  ADD KEY `narudzba_id` (`narudzba_id`),
  ADD KEY `vrsta_hrane_id` (`vrsta_hrane_id`);

--
-- Indexes for table `vrsta_hrane`
--
ALTER TABLE `vrsta_hrane`
  ADD PRIMARY KEY (`vrsta_hrane_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `korisnici`
--
ALTER TABLE `korisnici`
  MODIFY `korisnik_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `mjesta`
--
ALTER TABLE `mjesta`
  MODIFY `mjesto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `nacin_placanja`
--
ALTER TABLE `nacin_placanja`
  MODIFY `nacin_placanja_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `narudzbe`
--
ALTER TABLE `narudzbe`
  MODIFY `narudzba_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `stavke_narudzbe`
--
ALTER TABLE `stavke_narudzbe`
  MODIFY `stavka_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `vrsta_hrane`
--
ALTER TABLE `vrsta_hrane`
  MODIFY `vrsta_hrane_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `korisnici`
--
ALTER TABLE `korisnici`
  ADD CONSTRAINT `korisnici_ibfk_1` FOREIGN KEY (`mjesto_id`) REFERENCES `mjesta` (`mjesto_id`);

--
-- Constraints for table `narudzbe`
--
ALTER TABLE `narudzbe`
  ADD CONSTRAINT `narudzbe_ibfk_1` FOREIGN KEY (`korisnik_id`) REFERENCES `korisnici` (`korisnik_id`),
  ADD CONSTRAINT `narudzbe_ibfk_2` FOREIGN KEY (`nacin_placanja_id`) REFERENCES `nacin_placanja` (`nacin_placanja_id`);

--
-- Constraints for table `stavke_narudzbe`
--
ALTER TABLE `stavke_narudzbe`
  ADD CONSTRAINT `stavke_narudzbe_ibfk_1` FOREIGN KEY (`narudzba_id`) REFERENCES `narudzbe` (`narudzba_id`),
  ADD CONSTRAINT `stavke_narudzbe_ibfk_2` FOREIGN KEY (`vrsta_hrane_id`) REFERENCES `vrsta_hrane` (`vrsta_hrane_id`);
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
