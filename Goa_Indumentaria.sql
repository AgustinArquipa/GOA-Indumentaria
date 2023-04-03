-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 03-04-2023 a las 03:18:20
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Goa_Indumentaria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Credito`
--

CREATE TABLE `Credito` (
  `idTipoCredito` int(11) NOT NULL,
  `interes` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Credito`
--

INSERT INTO `Credito` (`idTipoCredito`, `interes`) VALUES
(1, '35%'),
(2, '15%');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Efectivo`
--

CREATE TABLE `Efectivo` (
  `idEfectivo` int(11) NOT NULL,
  `descuento` varchar(3) CHARACTER SET armscii8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Efectivo`
--

INSERT INTO `Efectivo` (`idEfectivo`, `descuento`) VALUES
(1, '25%'),
(2, '50%');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Pagos`
--

CREATE TABLE `Pagos` (
  `id` int(11) NOT NULL,
  `precio` bigint(20) NOT NULL,
  `idTipoEfectivo` int(11) DEFAULT NULL,
  `idTipoCredito` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Pagos`
--

INSERT INTO `Pagos` (`id`, `precio`, `idTipoEfectivo`, `idTipoCredito`) VALUES
(1, 3500, 2, NULL),
(2, 3500, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Producto`
--

CREATE TABLE `Producto` (
  `idProducto` int(11) NOT NULL,
  `descripcion` varchar(22) CHARACTER SET armscii8 NOT NULL,
  `talle` varchar(10) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `precio` bigint(20) NOT NULL,
  `temporada` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Producto`
--

INSERT INTO `Producto` (`idProducto`, `descripcion`, `talle`, `marca`, `precio`, `temporada`) VALUES
(1, 'Remera Over', 'S', 'Nike', 5000, 'Verano');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Credito`
--
ALTER TABLE `Credito`
  ADD PRIMARY KEY (`idTipoCredito`);

--
-- Indices de la tabla `Efectivo`
--
ALTER TABLE `Efectivo`
  ADD PRIMARY KEY (`idEfectivo`);

--
-- Indices de la tabla `Pagos`
--
ALTER TABLE `Pagos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idTipoCredito` (`idTipoCredito`),
  ADD KEY `idTipoEfectivo` (`idTipoEfectivo`);

--
-- Indices de la tabla `Producto`
--
ALTER TABLE `Producto`
  ADD PRIMARY KEY (`idProducto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Credito`
--
ALTER TABLE `Credito`
  MODIFY `idTipoCredito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Efectivo`
--
ALTER TABLE `Efectivo`
  MODIFY `idEfectivo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Pagos`
--
ALTER TABLE `Pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `Producto`
--
ALTER TABLE `Producto`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Pagos`
--
ALTER TABLE `Pagos`
  ADD CONSTRAINT `Pagos_ibfk_1` FOREIGN KEY (`idTipoCredito`) REFERENCES `Credito` (`idTipoCredito`),
  ADD CONSTRAINT `Pagos_ibfk_2` FOREIGN KEY (`idTipoEfectivo`) REFERENCES `Efectivo` (`idEfectivo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
