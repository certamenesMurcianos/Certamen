-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-12-2022 a las 20:59:28
-- Versión del servidor: 10.4.22-MariaDB-log
-- Versión de PHP: 7.4.27

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
  `pueblo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provincia` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo_postal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `certamenes_id` int(11) DEFAULT NULL,
  `nombre_director` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jueces_id` int(11) DEFAULT NULL,
  `correo_electronico` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `bandas_de_musica`
--

INSERT INTO `bandas_de_musica` (`id`, `nombre`, `numero_de_musicos`, `pueblo`, `provincia`, `codigo_postal`, `telefono`, `certamenes_id`, `nombre_director`, `jueces_id`, `correo_electronico`) VALUES
(1, 'Madrileños', 40, 'Infante', 'Murcia', '30011', '968379221', NULL, 'Jorge Salas', NULL, ''),
(2, 'Metaleros gallegos', 10, 'Lugo', 'Galicia', '79201', '968214367', NULL, 'Tomás Varela', NULL, ''),
(3, 'Guitarreros andaluces', 5, 'Andalucía', 'Sevilla', '64698', '968546312', NULL, 'Jorge Salas', NULL, '');

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

--
-- Volcado de datos para la tabla `certamenes`
--

INSERT INTO `certamenes` (`id`, `nombre`, `fecha`, `lugar`) VALUES
(1, 'Guitarras y más instrumentos', '2022-10-20', 'Sevilla'),
(2, 'Temas navideños', '2022-12-27', 'Murcia'),
(3, 'Canciones castellanas', '2022-12-19', 'Valencia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jueces`
--

CREATE TABLE `jueces` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provincia` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo_postal` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `jueces`
--

INSERT INTO `jueces` (`id`, `nombre`, `provincia`, `codigo_postal`, `telefono`) VALUES
(1, 'Constantino', 'Galicia', '47628', '968421295');

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
(1, 'miguelbeltri00@gmail.com', '[]', '$2y$13$CPyTdXiBox7HW4kTDKQUr./MFM6/Vy8Qkh0AYriA8XO1S2xu9OOQy', NULL),
(2, 'mbc@gmail.com', '[]', '$2y$13$9mk02pcJmbWeYnFYzTMZkeISxiYGrRKRwIOrOIcMyv8HBdqFfWJD6', NULL);

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
-- Indices de la tabla `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indices de la tabla `jueces`
--
ALTER TABLE `jueces`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `certamenes`
--
ALTER TABLE `certamenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `jueces`
--
ALTER TABLE `jueces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
