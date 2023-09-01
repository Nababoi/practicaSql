-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-09-2023 a las 18:58:58
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `instituto`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `editarMateria` (IN `p_materia` VARCHAR(20), IN `p_horas` INT, IN `p_duracion` VARCHAR(20))   BEGIN
        UPDATE materia set horas = p_horas, duracion = p_duracion where nombreMateria = p_materia;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editarMateriaAlumno` (IN `p_materia` VARCHAR(20), IN `p_nombre` VARCHAR(20), IN `p_apellido` VARCHAR(20), IN `p_nuevaMateria` VARCHAR(20))   BEGIN
    DECLARE alumnoId INT;
    DECLARE materiaId INT;
    DECLARE materiaNuevaId INT;

    -- Obtener el ID del alumno
    SELECT Nlegajo INTO alumnoId
    FROM alumno
    WHERE nombre = p_nombre AND apellido = p_apellido;
    
    -- Obtener el ID de la materia
    SELECT id INTO materiaId
    FROM materia
    WHERE nombreMateria = p_materia;
    
        -- Obtener el ID de la materia nueva
    SELECT id INTO materiaNuevaId
    FROM materia
    WHERE nombreMateria = p_nuevaMateria;

    -- Actualizar la relación alumno-materia
    UPDATE alumnoMateria
    SET idMateria = materiaNuevaId
    WHERE idAlumno = alumnoId AND idMateria = materiaId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarMateriaProfesor` (IN `profesorNombre` VARCHAR(255), IN `materiaNombre` VARCHAR(255), IN `profesorApellido` VARCHAR(20), IN `materiaNuevaNombre` VARCHAR(20))   BEGIN
    DECLARE profesorId INT;
    DECLARE materiaId INT;
    DECLARE materiaNuevaId INT;

    -- Obtener el ID del profesor
    SELECT Nlegajo INTO profesorId
    FROM profesor
    WHERE nombre = profesorNombre and apellido = profesorApellido;

    -- Obtener el ID de la materia
    SELECT id INTO materiaId
    FROM materia
    WHERE nombreMateria = materiaNombre;

        -- Obtener el ID de la materia nueva
    SELECT id INTO materiaNuevaId
    FROM materia
    WHERE nombreMateria = materiaNuevaNombre;

    -- Actualizar la relación profesor-materia
    UPDATE profesorMateria
    SET idMateria = materiaNuevaId
    WHERE idProfesor = profesorId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editarProfesorAlumno` (IN `p_materia` VARCHAR(20), IN `p_nombre` VARCHAR(20), IN `p_apellido` VARCHAR(20), IN `p_materiaNueva` VARCHAR(20))   BEGIN
    DECLARE profesorId INT;
    DECLARE materiaId INT;
    DECLARE materiaNuevaId INT;

    -- Obtener el ID del profesor
    SELECT Nlegajo INTO profesorId
    FROM profesor
    WHERE nombre = p_nombre AND apellido = p_apellido;
    
    -- Obtener el ID de la materia
    SELECT id INTO materiaId
    FROM materia
    WHERE nombreMateria = p_materia;
    
        -- Obtener el ID de la materia nueva
    SELECT id INTO materiaNuevaId
    FROM materia
    WHERE nombreMateria = p_nuevaMateria;

    -- Actualizar la relación alumno-materia
    UPDATE profesorMateria
    SET idMateria = materiaNuevaId
    WHERE idProfesor = profesorId AND idMateria = materiaId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarAlumnoMateria` (IN `p_alumno` INT(20), IN `p_materia` INT(20))   BEGIN
insert into alumnomateria(idAlumno,idMateria) values(p_alumno,p_materia);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarDatosMateria` (IN `p_nombreMateria` VARCHAR(20), IN `p_horas` INT, IN `p_aula` INT, IN `p_duracion` VARCHAR(20))   BEGIN

        INSERT INTO Materia(nombreMateria, horas, aula, duracion) 
        VALUES (p_nombreMateria, p_horas, p_aula,p_duracion);
        

       
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarDatosPersona` (IN `p_nombre` VARCHAR(20), IN `p_apellido` VARCHAR(20), IN `p_dni` VARCHAR(20), IN `p_tabla` VARCHAR(20))   BEGIN
    IF p_tabla = 'Alumno' THEN
        INSERT INTO Alumno (nombre, apellido, DNI) 
        VALUES (p_nombre, p_apellido, p_dni);
    ELSEIF p_tabla = 'Profesor' THEN
        INSERT INTO Profesor (nombre, apellido, DNI) 
        VALUES (p_nombre, p_apellido, p_dni);
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ingrese un nombre de tabla válido';
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarDatosProfesor` (IN `p_nombre` VARCHAR(20), IN `p_apellido` VARCHAR(20), IN `p_dni` VARCHAR(20))   BEGIN

        INSERT INTO Profesor (nombre, apellido, DNI) 
        VALUES (p_nombre, p_apellido, p_dni);
     
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarProfesorMateria` (IN `p_profesor` INT, IN `p_materia` INT)   BEGIN
	insert into profesormateria(idProfesor,idMateria) values(p_profesor,p_materia);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `Nlegajo` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `apellido` varchar(20) DEFAULT NULL,
  `DNI` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`Nlegajo`, `nombre`, `apellido`, `DNI`) VALUES
(1, 'Ramiro', 'Barcala', 13364117),
(2, 'Agustin', 'Bondonno', 41361117),
(3, 'Franco', 'Bonini', 43164117),
(4, 'Gonzalo', 'Carabajal', 43164117);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnomateria`
--

CREATE TABLE `alumnomateria` (
  `id` int(11) NOT NULL,
  `idAlumno` int(11) DEFAULT NULL,
  `idMateria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alumnomateria`
--

INSERT INTO `alumnomateria` (`id`, `idAlumno`, `idMateria`) VALUES
(1, 2, 2),
(2, 1, 1),
(3, 3, 5),
(4, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `id` int(11) NOT NULL,
  `nombreMateria` varchar(20) DEFAULT NULL,
  `horas` int(2) DEFAULT NULL,
  `aula` int(2) DEFAULT NULL,
  `duracion` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`id`, `nombreMateria`, `horas`, `aula`, `duracion`) VALUES
(1, 'Programacion1', 6, 5, 'Cuatrimestral'),
(2, 'Fisica1', 5, 7, 'Anual'),
(3, 'Analisis1', 8, 5, 'Anual'),
(4, 'Algebra', 5, 7, 'Anual'),
(5, 'Administracion', 4, 5, 'Cuatrimestral');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `Nlegajo` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `apellido` varchar(20) DEFAULT NULL,
  `dni` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`Nlegajo`, `nombre`, `apellido`, `dni`) VALUES
(1, 'Pedro', 'Sadowski', 43164117),
(2, 'Jhonny', 'Kepler', 43164117),
(3, 'Marcos', 'Dijtrack', 43164117),
(4, 'Miqueas', 'Babage', 43164736);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesormateria`
--

CREATE TABLE `profesormateria` (
  `id` int(11) NOT NULL,
  `idProfesor` int(11) DEFAULT NULL,
  `idMateria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `profesormateria`
--

INSERT INTO `profesormateria` (`id`, `idProfesor`, `idMateria`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 4, 1),
(4, 3, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`Nlegajo`);

--
-- Indices de la tabla `alumnomateria`
--
ALTER TABLE `alumnomateria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idAlumno` (`idAlumno`),
  ADD KEY `idMateria` (`idMateria`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`Nlegajo`);

--
-- Indices de la tabla `profesormateria`
--
ALTER TABLE `profesormateria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idProfesor` (`idProfesor`),
  ADD KEY `idMateria` (`idMateria`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumno`
--
ALTER TABLE `alumno`
  MODIFY `Nlegajo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `alumnomateria`
--
ALTER TABLE `alumnomateria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `materia`
--
ALTER TABLE `materia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `profesor`
--
ALTER TABLE `profesor`
  MODIFY `Nlegajo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `profesormateria`
--
ALTER TABLE `profesormateria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnomateria`
--
ALTER TABLE `alumnomateria`
  ADD CONSTRAINT `alumnomateria_ibfk_1` FOREIGN KEY (`idAlumno`) REFERENCES `alumno` (`Nlegajo`),
  ADD CONSTRAINT `alumnomateria_ibfk_2` FOREIGN KEY (`idMateria`) REFERENCES `materia` (`id`);

--
-- Filtros para la tabla `profesormateria`
--
ALTER TABLE `profesormateria`
  ADD CONSTRAINT `profesormateria_ibfk_1` FOREIGN KEY (`idProfesor`) REFERENCES `profesor` (`Nlegajo`),
  ADD CONSTRAINT `profesormateria_ibfk_2` FOREIGN KEY (`idMateria`) REFERENCES `materia` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
