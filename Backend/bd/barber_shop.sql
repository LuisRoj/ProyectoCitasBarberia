-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-10-2024 a las 07:20:14
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12
CREATE DATABASE IF NOT EXISTS barberia_citas;
USE barberia_citas;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `barberia_citas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appointments`
--

CREATE TABLE `appointments` (
  `id` bigint(20) NOT NULL,
  `customers_id` bigint(20) NOT NULL,
  `employees_id` bigint(20) NOT NULL,
  `services_id` bigint(20) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `end_time` time NOT NULL,
  `cancelled` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `appointments`
--

INSERT INTO `appointments` (`id`, `customers_id`, `employees_id`, `services_id`, `datetime`, `end_time`, `cancelled`) VALUES
(18, 4, 3, 4, '2024-10-22 22:00:00', '17:45:00', 0),
(19, 4, 2, 4, '2024-10-22 22:00:00', '17:45:00', 0),
(20, 4, 3, 4, '2024-10-22 22:00:00', '17:45:00', 0),
(22, 8, 3, 4, '2024-10-22 23:00:00', '18:45:00', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `customers`
--

INSERT INTO `customers` (`id`, `first_name`, `last_name`, `phone`, `user_id`) VALUES
(1, 'Juan', 'Pérez', '555-1234', 2),
(2, 'María', 'García', '555-5678', NULL),
(3, 'Carlos', 'López', '555-9012', NULL),
(4, 'Patrick', 'Castillo', '123456789', 6),
(8, 'Jheyson', 'Castillo', '999999999', 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `profession` varchar(70) NOT NULL,
  `picture` mediumblob DEFAULT NULL,
  `picture_base64` text DEFAULT NULL,
  `working_days` varchar(7) NOT NULL,
  `active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `employees`
--

INSERT INTO `employees` (`id`, `first_name`, `last_name`, `profession`, `picture`, `picture_base64`, `working_days`, `active`) VALUES
(1, 'Miguel', 'Rodríguez', 'Barbero', NULL, NULL, 'Mon-Fri', 1),
(2, 'Sofía', 'Martínez', 'Barbera', NULL, NULL, 'Tue-Sat', 1),
(3, 'Patrick', 'Castillo', 'Barbero', NULL, 'url_de_imagen_por_defecto', 'Mon-Sun', 0),
(4, 'Juan', 'Pérez', 'Barbero', NULL, 'url_de_imagen_por_defecto', 'Wed-Sun', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employees_services`
--

CREATE TABLE `employees_services` (
  `employees_id` bigint(20) NOT NULL,
  `services_id` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `employees_services`
--

INSERT INTO `employees_services` (`employees_id`, `services_id`, `id`) VALUES
(1, 1, 0),
(1, 2, 0),
(1, 4, 0),
(2, 1, 0),
(2, 3, 0),
(2, 4, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employee_absent_on`
--

CREATE TABLE `employee_absent_on` (
  `id` bigint(20) NOT NULL,
  `employees_id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `from_hour` time DEFAULT NULL,
  `to_hour` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `employee_absent_on`
--

INSERT INTO `employee_absent_on` (`id`, `employees_id`, `date`, `from_hour`, `to_hour`) VALUES
(1, 1, '2024-10-15', '13:00:00', '17:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employee_schedules`
--

CREATE TABLE `employee_schedules` (
  `id` bigint(20) NOT NULL,
  `employees_id` bigint(20) NOT NULL,
  `from_hour` time NOT NULL,
  `to_hour` time NOT NULL,
  `available` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `employee_schedules`
--

INSERT INTO `employee_schedules` (`id`, `employees_id`, `from_hour`, `to_hour`, `available`) VALUES
(1, 1, '09:00:00', '17:00:00', 1),
(2, 2, '10:00:00', '18:00:00', 1),
(3, 3, '11:00:00', '20:00:00', 1),
(4, 4, '08:00:00', '16:00:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL,
  `name` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Customer');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `services`
--

CREATE TABLE `services` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(130) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `duration_minutes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `services`
--

INSERT INTO `services` (`id`, `name`, `description`, `price`, `duration_minutes`) VALUES
(1, 'Corte de Cabello', 'Corte de cabello estándar para hombres', 15.00, 30),
(2, 'Arreglo de Barba', 'Recorte y perfilado de barba', 10.00, 20),
(3, 'Afeitado Clásico', 'Afeitado con navaja tradicional', 12.00, 25),
(4, 'Corte y Barba', 'Combo de corte de cabello y arreglo de barba', 22.00, 45);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(130) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `token_expiration_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role_id`, `reset_password_token`, `token_expiration_date`) VALUES
(1, 'adminUser', 'admin@barbershop.com', 'adminPass', 1, NULL, NULL),
(2, 'customer1', 'customer1@example.com', '$2b$12$4SbbNifz21VECUdDpBse8uEyymB.F2ox5dV1/9zWcPy9ZD1dLVAcS', 2, NULL, NULL),
(6, 'PatrickCF', 'patrick30al@gmail.com', '$2a$10$lTl5qTKZUCpxooAfBYBxhugi3btAN3qNsMWMNR5.tMMNvj.WbxBF.', 2, NULL, NULL),
(18, 'JheysonJP', 'borekingventas@gmail.com', '$2a$10$gO6Ugho6dzkwHutUsrO1yeQISezu6wwmY56SE5Sp1eatyHNRtEu32', 2, NULL, NULL),
(19, 'JheysonCF', 'jheysoncf30@gmail.com', '$2a$10$koY55pMRm5iVDM.TMnVIkeLF8pDwP.q0SqW9jKE.MHdl4Mjv4LXmu', 1, NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customers_id` (`customers_id`),
  ADD KEY `employees_id` (`employees_id`),
  ADD KEY `services_id` (`services_id`);

--
-- Indices de la tabla `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user` (`user_id`);

--
-- Indices de la tabla `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `working_days` (`working_days`);

--
-- Indices de la tabla `employees_services`
--
ALTER TABLE `employees_services`
  ADD PRIMARY KEY (`employees_id`,`services_id`),
  ADD KEY `services_id` (`services_id`);

--
-- Indices de la tabla `employee_absent_on`
--
ALTER TABLE `employee_absent_on`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employees_id` (`employees_id`);

--
-- Indices de la tabla `employee_schedules`
--
ALTER TABLE `employee_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employees_id` (`employees_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `employee_absent_on`
--
ALTER TABLE `employee_absent_on`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `employee_schedules`
--
ALTER TABLE `employee_schedules`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`customers_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`employees_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `appointments_ibfk_3` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`);

--
-- Filtros para la tabla `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `employees_services`
--
ALTER TABLE `employees_services`
  ADD CONSTRAINT `employees_services_ibfk_1` FOREIGN KEY (`employees_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `employees_services_ibfk_2` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`);

--
-- Filtros para la tabla `employee_absent_on`
--
ALTER TABLE `employee_absent_on`
  ADD CONSTRAINT `employee_absent_on_ibfk_1` FOREIGN KEY (`employees_id`) REFERENCES `employees` (`id`);

--
-- Filtros para la tabla `employee_schedules`
--
ALTER TABLE `employee_schedules`
  ADD CONSTRAINT `employee_schedules_ibfk_1` FOREIGN KEY (`employees_id`) REFERENCES `employees` (`id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
