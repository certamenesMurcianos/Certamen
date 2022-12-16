-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-12-2022 a las 11:38:32
-- Versión del servidor: 10.4.19-MariaDB-log
-- Versión de PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `certamenes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bandas_de_musica`
--

CREATE TABLE `bandas_de_musica` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_de_musicos` int(11) NOT NULL,
  `nombre_director` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pueblo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provincia` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo_postal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `certamenes_id` int(11) DEFAULT NULL,
  `correo_electronico` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `bandas_de_musica`
--

INSERT INTO `bandas_de_musica` (`id`, `nombre`, `numero_de_musicos`, `nombre_director`, `pueblo`, `provincia`, `codigo_postal`, `telefono`, `certamenes_id`, `correo_electronico`) VALUES
(1, 'Música en los Garres', 103, 'Antonio Guirao Fernández', 'Los Garres', 'Murcia', '33003', '222333444', NULL, 'losgarres@gmail.com\r\n'),
(2, 'Mediza Sillasa', 106, 'Josefa Ayala Albaladejo', 'Cieza', 'Murcia', '33022', '777888999', NULL, 'cieza@gmail.com'),
(3, 'Músicos Cartagineses', 89, 'Antonio Guirao Fernández', 'Cartagena', 'Murcia', '11220', '555666777', NULL, 'cartagena@gmail.com'),
(4, 'Agrupación Musical Juvenil', 109, 'Andrés Pérez Bernabé', 'Cabezo de Torres', 'Murcia', '30110', '999888666', NULL, 'cabezo@gmail.com'),
(5, 'Amigos de la Música', 90, 'Luisa Otero López', 'Beniaján', 'Murcia', '22011', '222888444', NULL, 'beniajan@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `certamenes`
--

CREATE TABLE `certamenes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `lugar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banda_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `banda_id`) VALUES
(1, 'cabezo@gmail.com', '[]', '$2y$13$3/9rxXu6uDeE8wDq7UuyWOd.Qvy6cBKEI3xuJb/nb7i2lqiU1w2Qq', 4),
(3, 'beniajan@gmail.com', '[]', '$2y$13$tX66FP7ey5it9zuufZp85.KTGrmuis5E0VP6InStMMtn8D9neCLiq', 5),
(4, 'losgarres@gmail.com', '[]', '$2y$13$v2zLUKEe6Bqow7BcHAc5JuLdc1Rw2NvqFnjDdikMcrpeY/j/MzOvO', 1),
(5, 'cieza@gmail.com', '[]', '$2y$13$cvDtpDeecjab5A85EhWC..UqbKbrYTvFov2O7I3POR45yTQ1glqnO', 2),
(6, 'cartagena@gmail.com', '[]', '$2y$13$mIqoje31h90RlHq1oUsGquPSi0antOjpPPVKc0M7WBIQEvQbMNhPq', 3),
(7, 'lorca@gmail.com', '[]', '$2y$13$CQcn3nxWQqtQPicrI2pctO.9qxDEmrJN/YZbjE56suz7N0hnSbDxy', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bandas_de_musica`
--
ALTER TABLE `bandas_de_musica`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_3F13DCEEF8EE352` (`certamenes_id`);

--
-- Indices de la tabla `certamenes`
--
ALTER TABLE `certamenes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`),
  ADD UNIQUE KEY `UNIQ_8D93D6499EFB0C1D` (`banda_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bandas_de_musica`
--
ALTER TABLE `bandas_de_musica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `certamenes`
--
ALTER TABLE `certamenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bandas_de_musica`
--
ALTER TABLE `bandas_de_musica`
  ADD CONSTRAINT `FK_3F13DCEEF8EE352` FOREIGN KEY (`certamenes_id`) REFERENCES `certamenes` (`id`);

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_8D93D6499EFB0C1D` FOREIGN KEY (`banda_id`) REFERENCES `bandas_de_musica` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
