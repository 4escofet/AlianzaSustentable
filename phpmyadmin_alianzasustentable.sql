-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-09-2024 a las 00:43:29
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
-- Base de datos: `alianzasustentable`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diccionario`
--

CREATE TABLE `diccionario` (
  `id_diccionario` int(11) NOT NULL,
  `id_pregunta` int(11) DEFAULT NULL,
  `valor` int(11) NOT NULL,
  `descripcion` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entidad`
--

CREATE TABLE `entidad` (
  `id_entidad` int(11) NOT NULL,
  `CUIT` int(11) DEFAULT NULL,
  `Nombre` char(50) DEFAULT NULL,
  `Domicilio` char(50) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entidad_evaluador`
--

CREATE TABLE `entidad_evaluador` (
  `id_entidad_evaluador` int(11) NOT NULL,
  `id_entidad` int(11) DEFAULT NULL,
  `id_evaluador` int(11) DEFAULT NULL,
  `Fecha_asignacion` datetime DEFAULT NULL,
  `Fecha_fin_asignacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluador`
--

CREATE TABLE `evaluador` (
  `id_evaluador` int(11) NOT NULL,
  `CUIT` int(11) DEFAULT NULL,
  `Nombre` char(50) DEFAULT NULL,
  `Domicilio` char(50) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formularios`
--

CREATE TABLE `formularios` (
  `id_formulario` int(11) NOT NULL,
  `Nombre` char(50) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `valido` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE `preguntas` (
  `id_pregunta` int(11) NOT NULL,
  `id_formulario` int(11) DEFAULT NULL,
  `Texto_pregunta` text DEFAULT NULL,
  `tipo_respuesta` varchar(10) DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

CREATE TABLE `proyecto` (
  `id_proyecto` int(11) NOT NULL,
  `id_entidad_madre` int(11) DEFAULT NULL,
  `Nombre_proyecto` char(50) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `id_evaluador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto_entidades`
--

CREATE TABLE `proyecto_entidades` (
  `id_proyecto_entidades` int(11) NOT NULL,
  `id_proyecto` int(11) DEFAULT NULL,
  `id_entidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto_formularios`
--

CREATE TABLE `proyecto_formularios` (
  `id_proyecto_formulario` int(11) NOT NULL,
  `id_proyecto` int(11) DEFAULT NULL,
  `id_formulario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestas`
--

CREATE TABLE `respuestas` (
  `id_respuesta` int(11) NOT NULL,
  `id_pregunta` int(11) DEFAULT NULL,
  `id_entidad` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `id_diccionario` int(11) DEFAULT NULL,
  `valor_respuesta` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `diccionario`
--
ALTER TABLE `diccionario`
  ADD PRIMARY KEY (`id_diccionario`),
  ADD KEY `fk_diccionario_pregunta` (`id_pregunta`);

--
-- Indices de la tabla `entidad`
--
ALTER TABLE `entidad`
  ADD PRIMARY KEY (`id_entidad`);

--
-- Indices de la tabla `entidad_evaluador`
--
ALTER TABLE `entidad_evaluador`
  ADD PRIMARY KEY (`id_entidad_evaluador`),
  ADD KEY `fk_entidad` (`id_entidad`),
  ADD KEY `fk_evaluador` (`id_evaluador`);

--
-- Indices de la tabla `evaluador`
--
ALTER TABLE `evaluador`
  ADD PRIMARY KEY (`id_evaluador`);

--
-- Indices de la tabla `formularios`
--
ALTER TABLE `formularios`
  ADD PRIMARY KEY (`id_formulario`);

--
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`id_pregunta`),
  ADD KEY `fk_formulario` (`id_formulario`);

--
-- Indices de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD PRIMARY KEY (`id_proyecto`),
  ADD KEY `fk_entidad_madre` (`id_entidad_madre`),
  ADD KEY `fk_proyecto_evaluador` (`id_evaluador`);

--
-- Indices de la tabla `proyecto_entidades`
--
ALTER TABLE `proyecto_entidades`
  ADD PRIMARY KEY (`id_proyecto_entidades`),
  ADD KEY `fk_proyecto` (`id_proyecto`),
  ADD KEY `fk_proyecto_entidad` (`id_entidad`);

--
-- Indices de la tabla `proyecto_formularios`
--
ALTER TABLE `proyecto_formularios`
  ADD PRIMARY KEY (`id_proyecto_formulario`),
  ADD KEY `fk_proyecto_formulario_proyecto` (`id_proyecto`),
  ADD KEY `fk_proyecto_formulario_formulario` (`id_formulario`);

--
-- Indices de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD PRIMARY KEY (`id_respuesta`),
  ADD KEY `fk_respuesta_pregunta` (`id_pregunta`),
  ADD KEY `fk_respuesta_entidad` (`id_entidad`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `diccionario`
--
ALTER TABLE `diccionario`
  ADD CONSTRAINT `fk_diccionario_pregunta` FOREIGN KEY (`id_pregunta`) REFERENCES `preguntas` (`id_pregunta`);

--
-- Filtros para la tabla `entidad_evaluador`
--
ALTER TABLE `entidad_evaluador`
  ADD CONSTRAINT `fk_entidad` FOREIGN KEY (`id_entidad`) REFERENCES `entidad` (`id_entidad`),
  ADD CONSTRAINT `fk_evaluador` FOREIGN KEY (`id_evaluador`) REFERENCES `evaluador` (`id_evaluador`);

--
-- Filtros para la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD CONSTRAINT `fk_formulario` FOREIGN KEY (`id_formulario`) REFERENCES `formularios` (`id_formulario`);

--
-- Filtros para la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD CONSTRAINT `fk_entidad_madre` FOREIGN KEY (`id_entidad_madre`) REFERENCES `entidad` (`id_entidad`),
  ADD CONSTRAINT `fk_proyecto_evaluador` FOREIGN KEY (`id_evaluador`) REFERENCES `evaluador` (`id_evaluador`);

--
-- Filtros para la tabla `proyecto_entidades`
--
ALTER TABLE `proyecto_entidades`
  ADD CONSTRAINT `fk_proyecto` FOREIGN KEY (`id_proyecto`) REFERENCES `proyecto` (`id_proyecto`),
  ADD CONSTRAINT `fk_proyecto_entidad` FOREIGN KEY (`id_entidad`) REFERENCES `entidad` (`id_entidad`);

--
-- Filtros para la tabla `proyecto_formularios`
--
ALTER TABLE `proyecto_formularios`
  ADD CONSTRAINT `fk_proyecto_formulario_formulario` FOREIGN KEY (`id_formulario`) REFERENCES `formularios` (`id_formulario`),
  ADD CONSTRAINT `fk_proyecto_formulario_proyecto` FOREIGN KEY (`id_proyecto`) REFERENCES `proyecto` (`id_proyecto`);

--
-- Filtros para la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD CONSTRAINT `fk_respuesta_entidad` FOREIGN KEY (`id_entidad`) REFERENCES `entidad` (`id_entidad`),
  ADD CONSTRAINT `fk_respuesta_pregunta` FOREIGN KEY (`id_pregunta`) REFERENCES `preguntas` (`id_pregunta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
