-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-06-2024 a las 13:25:00
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `persistencia_bd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` bigint(20) NOT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `dni` int(11) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `fk_domicilio` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `apellido`, `dni`, `nombre`, `fk_domicilio`) VALUES
(1, 'Garcia', 12345, 'Rodrigo', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_factura`
--

CREATE TABLE `detalle_factura` (
  `id` bigint(20) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `fk_disco` bigint(20) DEFAULT NULL,
  `fk_factura` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `detalle_factura`
--

INSERT INTO `detalle_factura` (`id`, `cantidad`, `subtotal`, `fk_disco`, `fk_factura`) VALUES
(1, 2, 300, 1, 1),
(2, 3, 600, 2, 1),
(3, 1, 170, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `disco`
--

CREATE TABLE `disco` (
  `id` bigint(20) NOT NULL,
  `autor` varchar(255) DEFAULT NULL,
  `denominacion` varchar(255) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `disco`
--

INSERT INTO `disco` (`id`, `autor`, `denominacion`, `precio`, `titulo`) VALUES
(1, 'Faith No More', 'Rock', 150, 'Angel Dust'),
(2, 'Babasonicos', 'Pop', 200, 'Jessico'),
(3, 'The cure', 'Rock Alternativo', 170, 'Wish');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `disco_genero`
--

CREATE TABLE `disco_genero` (
  `disco_id` bigint(20) NOT NULL,
  `genero_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `disco_genero`
--

INSERT INTO `disco_genero` (`disco_id`, `genero_id`) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domicilio`
--

CREATE TABLE `domicilio` (
  `id` bigint(20) NOT NULL,
  `calle` varchar(255) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `domicilio`
--

INSERT INTO `domicilio` (`id`, `calle`, `numero`) VALUES
(1, 'San Juan', 1655);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id` bigint(20) NOT NULL,
  `fecha` varchar(255) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `fk_cliente` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id`, `fecha`, `total`, `fk_cliente`) VALUES
(1, '06/09/2024', 1070, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `id` bigint(20) NOT NULL,
  `denominacion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id`, `denominacion`) VALUES
(1, 'Rock'),
(2, 'Rock Alternativo'),
(3, 'Pop');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_jlcg5nhnauli1hu4ojldsedaw` (`dni`),
  ADD KEY `FKraj5dyt7g3b7b9dj5o6aha8j8` (`fk_domicilio`);

--
-- Indices de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK4s8bhgahat3w88j76andofjw0` (`fk_disco`),
  ADD KEY `FKpivyynb1ekrqvoej3r9tsy2ms` (`fk_factura`);

--
-- Indices de la tabla `disco`
--
ALTER TABLE `disco`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `disco_genero`
--
ALTER TABLE `disco_genero`
  ADD KEY `FK6bs1a905r9t4d2b4dlnhbyg63` (`genero_id`),
  ADD KEY `FKany1ss9r0i7yjmuwqiqn01hiw` (`disco_id`);

--
-- Indices de la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKf33dllie6u5tuebm3xqtnw8rn` (`fk_cliente`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `disco`
--
ALTER TABLE `disco`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `domicilio`
--
ALTER TABLE `domicilio`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `FKraj5dyt7g3b7b9dj5o6aha8j8` FOREIGN KEY (`fk_domicilio`) REFERENCES `domicilio` (`id`);

--
-- Filtros para la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD CONSTRAINT `FK4s8bhgahat3w88j76andofjw0` FOREIGN KEY (`fk_disco`) REFERENCES `disco` (`id`),
  ADD CONSTRAINT `FKpivyynb1ekrqvoej3r9tsy2ms` FOREIGN KEY (`fk_factura`) REFERENCES `factura` (`id`);

--
-- Filtros para la tabla `disco_genero`
--
ALTER TABLE `disco_genero`
  ADD CONSTRAINT `FK6bs1a905r9t4d2b4dlnhbyg63` FOREIGN KEY (`genero_id`) REFERENCES `genero` (`id`),
  ADD CONSTRAINT `FKany1ss9r0i7yjmuwqiqn01hiw` FOREIGN KEY (`disco_id`) REFERENCES `disco` (`id`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `FKf33dllie6u5tuebm3xqtnw8rn` FOREIGN KEY (`fk_cliente`) REFERENCES `cliente` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
