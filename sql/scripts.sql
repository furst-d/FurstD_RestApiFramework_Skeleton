-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20220629.14f90d77f8
-- https://www.phpmyadmin.net/
--
-- Počítač: localhost
-- Vytvořeno: Čtv 30. čen 2022, 13:40
-- Verze serveru: 10.4.24-MariaDB
-- Verze PHP: 8.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `rest_students`
--
CREATE DATABASE IF NOT EXISTS `rest_students` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `rest_students`;

-- --------------------------------------------------------

--
-- Struktura tabulky `auth_roles`
--

CREATE TABLE `auth_roles` (
                              `role_id` int(11) NOT NULL,
                              `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Vypisuji data pro tabulku `auth_roles`
--

INSERT INTO `auth_roles` (`role_id`, `name`) VALUES
                                                 (1, 'Default'),
                                                 (2, 'Admin');

-- --------------------------------------------------------

--
-- Struktura tabulky `auth_users`
--

CREATE TABLE `auth_users` (
                              `user_id` int(11) NOT NULL,
                              `username` varchar(255) NOT NULL,
                              `password` varchar(255) NOT NULL,
                              `role_id` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

--
-- Struktura tabulky `cities`
--

CREATE TABLE `cities` (
                          `city_id` int(11) NOT NULL,
                          `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Vypisuji data pro tabulku `cities`
--

INSERT INTO `cities` (`city_id`, `name`) VALUES
                                             (1, 'Praha'),
                                             (2, 'Brno'),
                                             (3, 'Pardubice'),
                                             (4, 'Jihlava');

-- --------------------------------------------------------

--
-- Struktura tabulky `marks`
--

CREATE TABLE `marks` (
                         `mark_id` int(11) NOT NULL,
                         `student_id` int(11) NOT NULL,
                         `mark` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Vypisuji data pro tabulku `marks`
--

INSERT INTO `marks` (`mark_id`, `student_id`, `mark`) VALUES
                                                          (1, 2, 3),
                                                          (2, 2, 4),
                                                          (3, 1, 5);

-- --------------------------------------------------------

--
-- Struktura tabulky `students`
--

CREATE TABLE `students` (
                            `student_id` int(11) NOT NULL,
                            `name` varchar(30) NOT NULL,
                            `surname` varchar(50) NOT NULL,
                            `city_id` int(11) NOT NULL,
                            `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Vypisuji data pro tabulku `students`
--

INSERT INTO `students` (`student_id`, `name`, `surname`, `city_id`, `created_at`) VALUES
                                                                                      (1, 'Karel', 'Novák', 1, '2022-04-23 11:37:24'),
                                                                                      (2, 'Petr', 'West', 2, '2022-04-23 11:37:24'),
                                                                                      (3, 'David', 'Kral', 1, '2022-04-24 16:25:05'),
                                                                                      (4, 'Martina', 'Malá', 1, '2022-04-24 17:27:46'),
                                                                                      (5, 'David', 'Kral', 1, '2022-04-24 17:27:48'),
                                                                                      (6, 'John', 'Doe', 1, '2022-06-08 15:12:46'),
                                                                                      (7, 'Johnas', 'Doe', 1, '2022-06-08 15:18:24'),
                                                                                      (8, 'Radek', 'Kuchar', 3, '2022-06-08 15:39:49'),
                                                                                      (9, 'Radim', 'Lukeš', 4, '2022-06-08 15:55:33'),
                                                                                      (10, 'Karel', 'Lukeš', 4, '2022-06-09 15:48:34'),
                                                                                      (11, 'Ondřej', 'Lukeš', 4, '2022-06-09 15:52:30'),
                                                                                      (12, 'Jaromír', 'Lukeš', 4, '2022-06-09 16:03:14');

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `auth_roles`
--
ALTER TABLE `auth_roles`
    ADD PRIMARY KEY (`role_id`);

--
-- Indexy pro tabulku `auth_users`
--
ALTER TABLE `auth_users`
    ADD PRIMARY KEY (`user_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexy pro tabulku `cities`
--
ALTER TABLE `cities`
    ADD PRIMARY KEY (`city_id`);

--
-- Indexy pro tabulku `marks`
--
ALTER TABLE `marks`
    ADD PRIMARY KEY (`mark_id`),
  ADD KEY `student_fk` (`student_id`);

--
-- Indexy pro tabulku `students`
--
ALTER TABLE `students`
    ADD PRIMARY KEY (`student_id`),
  ADD KEY `city_fk` (`city_id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `auth_roles`
--
ALTER TABLE `auth_roles`
    MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pro tabulku `auth_users`
--
ALTER TABLE `auth_users`
    MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pro tabulku `cities`
--
ALTER TABLE `cities`
    MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pro tabulku `marks`
--
ALTER TABLE `marks`
    MODIFY `mark_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pro tabulku `students`
--
ALTER TABLE `students`
    MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `auth_users`
--
ALTER TABLE `auth_users`
    ADD CONSTRAINT `auth_users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `auth_roles` (`role_id`) ON UPDATE CASCADE;

--
-- Omezení pro tabulku `marks`
--
ALTER TABLE `marks`
    ADD CONSTRAINT `student_fk` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Omezení pro tabulku `students`
--
ALTER TABLE `students`
    ADD CONSTRAINT `city_fk` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`);


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20220629.14f90d77f8
-- https://www.phpmyadmin.net/
--
-- Počítač: localhost
-- Vytvořeno: Čtv 30. čen 2022, 13:40
-- Verze serveru: 10.4.24-MariaDB
-- Verze PHP: 8.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `rest_students`
--
CREATE DATABASE IF NOT EXISTS `rest_students` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `rest_students`;

-- --------------------------------------------------------

--
-- Struktura tabulky `auth_roles`
--

CREATE TABLE `auth_roles` (
                              `role_id` int(11) NOT NULL,
                              `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Vypisuji data pro tabulku `auth_roles`
--

INSERT INTO `auth_roles` (`role_id`, `name`) VALUES
                                                 (1, 'Default'),
                                                 (2, 'Admin');

-- --------------------------------------------------------

--
-- Struktura tabulky `auth_users`
--

CREATE TABLE `auth_users` (
                              `user_id` int(11) NOT NULL,
                              `username` varchar(255) NOT NULL,
                              `password` varchar(255) NOT NULL,
                              `role_id` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

--
-- Struktura tabulky `cities`
--

CREATE TABLE `cities` (
                          `city_id` int(11) NOT NULL,
                          `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Vypisuji data pro tabulku `cities`
--

INSERT INTO `cities` (`city_id`, `name`) VALUES
                                             (1, 'Praha'),
                                             (2, 'Brno'),
                                             (3, 'Pardubice'),
                                             (4, 'Jihlava');

-- --------------------------------------------------------

--
-- Struktura tabulky `marks`
--

CREATE TABLE `marks` (
                         `mark_id` int(11) NOT NULL,
                         `student_id` int(11) NOT NULL,
                         `mark` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Vypisuji data pro tabulku `marks`
--

INSERT INTO `marks` (`mark_id`, `student_id`, `mark`) VALUES
                                                          (1, 2, 3),
                                                          (2, 2, 4),
                                                          (3, 1, 5);

-- --------------------------------------------------------

--
-- Struktura tabulky `students`
--

CREATE TABLE `students` (
                            `student_id` int(11) NOT NULL,
                            `name` varchar(30) NOT NULL,
                            `surname` varchar(50) NOT NULL,
                            `city_id` int(11) NOT NULL,
                            `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Vypisuji data pro tabulku `students`
--

INSERT INTO `students` (`student_id`, `name`, `surname`, `city_id`, `created_at`) VALUES
                                                                                      (1, 'Karel', 'Novák', 1, '2022-04-23 11:37:24'),
                                                                                      (2, 'Petr', 'West', 2, '2022-04-23 11:37:24'),
                                                                                      (3, 'David', 'Kral', 1, '2022-04-24 16:25:05'),
                                                                                      (4, 'Martina', 'Malá', 1, '2022-04-24 17:27:46'),
                                                                                      (5, 'David', 'Kral', 1, '2022-04-24 17:27:48'),
                                                                                      (6, 'John', 'Doe', 1, '2022-06-08 15:12:46'),
                                                                                      (7, 'Johnas', 'Doe', 1, '2022-06-08 15:18:24'),
                                                                                      (8, 'Radek', 'Kuchar', 3, '2022-06-08 15:39:49'),
                                                                                      (9, 'Radim', 'Lukeš', 4, '2022-06-08 15:55:33'),
                                                                                      (10, 'Karel', 'Lukeš', 4, '2022-06-09 15:48:34'),
                                                                                      (11, 'Ondřej', 'Lukeš', 4, '2022-06-09 15:52:30'),
                                                                                      (12, 'Jaromír', 'Lukeš', 4, '2022-06-09 16:03:14');

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `auth_roles`
--
ALTER TABLE `auth_roles`
    ADD PRIMARY KEY (`role_id`);

--
-- Indexy pro tabulku `auth_users`
--
ALTER TABLE `auth_users`
    ADD PRIMARY KEY (`user_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexy pro tabulku `cities`
--
ALTER TABLE `cities`
    ADD PRIMARY KEY (`city_id`);

--
-- Indexy pro tabulku `marks`
--
ALTER TABLE `marks`
    ADD PRIMARY KEY (`mark_id`),
  ADD KEY `student_fk` (`student_id`);

--
-- Indexy pro tabulku `students`
--
ALTER TABLE `students`
    ADD PRIMARY KEY (`student_id`),
  ADD KEY `city_fk` (`city_id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `auth_roles`
--
ALTER TABLE `auth_roles`
    MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pro tabulku `auth_users`
--
ALTER TABLE `auth_users`
    MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pro tabulku `cities`
--
ALTER TABLE `cities`
    MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pro tabulku `marks`
--
ALTER TABLE `marks`
    MODIFY `mark_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pro tabulku `students`
--
ALTER TABLE `students`
    MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `auth_users`
--
ALTER TABLE `auth_users`
    ADD CONSTRAINT `auth_users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `auth_roles` (`role_id`) ON UPDATE CASCADE;

--
-- Omezení pro tabulku `marks`
--
ALTER TABLE `marks`
    ADD CONSTRAINT `student_fk` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Omezení pro tabulku `students`
--
ALTER TABLE `students`
    ADD CONSTRAINT `city_fk` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`);


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



