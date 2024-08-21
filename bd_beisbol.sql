-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-08-2024 a las 23:43:35
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
-- Base de datos: `bd_beisbol`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_campeonatos`
--

CREATE TABLE `t_campeonatos` (
  `id_campeonato` int(11) NOT NULL,
  `nombre_campeonato` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_campeonatos`
--

INSERT INTO `t_campeonatos` (`id_campeonato`, `nombre_campeonato`) VALUES
(1, 'LVBP'),
(2, 'Serie del Caribe'),
(3, 'LMBP'),
(4, 'Serie Interamericana');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_equipos`
--

CREATE TABLE `t_equipos` (
  `id_equipo` int(11) NOT NULL,
  `nombre_equipo` varchar(50) NOT NULL,
  `id_liga` int(11) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `estadio` varchar(50) NOT NULL,
  `id_manager` int(11) NOT NULL,
  `ruta_img_equipo` varchar(50) NOT NULL,
  `fundacion_equipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_equipos`
--

INSERT INTO `t_equipos` (`id_equipo`, `nombre_equipo`, `id_liga`, `ciudad`, `estadio`, `id_manager`, `ruta_img_equipo`, `fundacion_equipo`) VALUES
(1, 'Leones del Caracas', 1, 'Estadio Monumental de Caracas', 'Estadio Monumental de Caracas', 1, 'img/equipos/leones.png', 1946),
(2, 'Navegantes del Magallanes', 1, 'Valencia', 'Estadio José Bernardo Pérez', 2, 'img/equipos/magallanes.png', NULL),
(3, 'Tigres de Aragua', 1, 'Maracay', 'Estadio José Pérez Colmenares', 3, 'img/equipos/tigres.png', NULL),
(4, 'Cardenales de Lara', 1, 'Barquisimeto', 'Estadio Antonio Herrera Gutiérrez', 4, 'img/equipos/cardenales.png', NULL),
(5, 'Tiburones de La Guaira', 1, 'Caracas', 'Estadio Universitario', 5, 'img/equipos/tiburones.png', NULL),
(6, 'Bravos de Margarita', 1, 'Porlamar', 'Estadio Nueva Esparta', 6, 'img/equipos/bravos.png', NULL),
(7, 'Caribes de Anzoátegui', 1, 'Puerto La Cruz', 'Estadio Alfonso \"Chico\" Carrasquel', 7, 'img/equipos/caribes.png', NULL),
(8, 'Águilas del Zulia', 1, 'Maracaibo', 'Estadio Luis Aparicio \"El Grande\"', 8, 'img/equipos/aguilas.png', NULL),
(9, 'Caciques de Distrito', 2, 'Caracas', 'Estadio Universitario', 9, 'img/equipos/caciques.png', NULL),
(10, 'Centauros de La Guaira', 2, 'La Guaira', 'Estadio Forum de La Guaira​​', 10, 'img/equipos/centauros.png', NULL),
(11, 'Delfines de La Guaira', 2, 'La Guaira', 'Estadio Forum de La Guaira​​', 7, 'img/equipos/delfines.png', NULL),
(12, 'Guerreros de Lara', 2, 'Valencia', 'Estadio José Bernardo Pérez', 11, 'img/equipos/guerreros.png', NULL),
(13, 'Lideres de Miranda', 2, 'Maracay', 'Estadio José Pérez Colmenares', 12, 'img/equipos/lideres.png', NULL),
(14, 'Marineros de Carabobo', 2, 'Valencia', 'Estadio José Bernardo Pérez', 13, 'img/equipos/marineros.png', NULL),
(15, 'Samanes de Aragua', 2, 'Valencia', 'Estadio José Bernardo Pérez', 14, 'img/equipos/samanes.png', NULL),
(16, 'Senadores de Caracas', 2, 'Caracas', 'Estadio Universitario', 15, 'img/equipos/senadores.png', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_equipo_campeonato`
--

CREATE TABLE `t_equipo_campeonato` (
  `id_equipo_campeonato` int(11) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `id_campeonato` int(11) NOT NULL,
  `numero_campeonatos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_equipo_campeonato`
--

INSERT INTO `t_equipo_campeonato` (`id_equipo_campeonato`, `id_equipo`, `id_campeonato`, `numero_campeonatos`) VALUES
(1, 1, 1, 21),
(2, 1, 2, 2),
(3, 1, 4, 1),
(4, 2, 1, 13),
(5, 2, 2, 2),
(6, 3, 1, 10),
(7, 3, 2, 1),
(8, 4, 1, 6),
(9, 5, 1, 8),
(10, 5, 2, 1),
(11, 7, 1, 4),
(12, 8, 1, 6),
(13, 8, 2, 2),
(14, 16, 3, 3),
(15, 14, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_jugadores`
--

CREATE TABLE `t_jugadores` (
  `id_jugador` int(11) NOT NULL,
  `nombre_jugador` varchar(50) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `numero` int(2) DEFAULT NULL,
  `fecha_nacimiento_jugador` date NOT NULL,
  `lugar_nacimiento_jugador` varchar(50) DEFAULT NULL,
  `nacionalidad_jugador` varchar(50) NOT NULL,
  `posicion` varchar(50) NOT NULL,
  `altura` double DEFAULT NULL,
  `peso` double DEFAULT NULL,
  `brazo_bateo` varchar(4) DEFAULT NULL,
  `brazo_lanzamiento` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_jugadores`
--

INSERT INTO `t_jugadores` (`id_jugador`, `nombre_jugador`, `id_equipo`, `numero`, `fecha_nacimiento_jugador`, `lugar_nacimiento_jugador`, `nacionalidad_jugador`, `posicion`, `altura`, `peso`, `brazo_bateo`, `brazo_lanzamiento`) VALUES
(1, 'Alfred Gutierrez', 1, 18, '1995-06-12', 'Nueva Esparta, Venezuela', 'venezuela', 'P', 190, 93, 'D', 'D'),
(2, 'Aliangel Lopez', 1, 67, '1994-02-18', 'El Tigre, Anzoategui', 'Venezuela', 'P', 185, 88, 'I', 'I'),
(3, 'Anthony Vizcaya', 1, 76, '1993-10-24', 'Barquisimeto, Edo. Lara', 'Venezuela', 'P', 183, 99, 'D', 'D'),
(4, 'Edwin Fierro', 1, 0, '1993-08-30', 'Sonora, México', 'Mexico', 'P', 185, 90, 'D', 'D'),
(5, 'Emilio Márquez', 1, 0, '1998-04-28', 'Upata, Edo. Bolívar', 'Venezuela', 'P', 170, 70, 'I', 'I'),
(6, 'Franklin Dacosta', 1, 38, '2000-02-27', 'Caracas, Dtto. Capital', 'Venezuela', 'P', 185, 82, 'I', 'I'),
(7, 'Jesús Varga', 1, 0, '1998-08-18', 'La Guaira, Edo. Vargas', 'Venezuela', 'P', 188, 85, 'D', 'D'),
(8, 'Jhoulys Chacín', 1, 45, '1988-01-07', 'Maracaibo ,Zulia', 'Venezuela', 'P', 191, 98, 'D', 'D'),
(9, 'Jose Mujica', 1, 54, '1996-06-29', 'Valencia ,Carabobo', 'Venezuela', 'P', 188, 113, 'D', 'D'),
(10, 'Joshua Cornielly', 1, 34, '2001-01-15', 'Caracas, Dtto. Capital', 'Venezuela', 'P', 188, 77, 'D', 'D'),
(11, 'Lázaro Blanco', 1, 56, '1986-02-27', 'Granma, Cuba', 'Cuba', 'P', 190, 96, 'D', 'D'),
(12, 'Mayckol Guaipe', 1, 65, '1990-08-11', 'Barcelona ,Anzoategui', 'Venezuela', 'P', 190, 80, 'D', 'D'),
(13, 'Miguel Rodriguez', 1, 87, '1999-02-26', 'Maracay, Edo Aragua', 'Venezuela', 'P', 190, 90, 'D', 'D'),
(14, 'Miguel Socolovich', 1, 55, '1986-07-24', 'Caracas ,Dtto. Capital', 'Venezuela', 'P', 185, 93, 'D', 'D'),
(15, 'Norwith Gudiño', 1, 85, '1995-11-22', 'Puerto Cabello ,Carabobo', 'Venezuela', 'P', 188, 92, 'D', 'D'),
(16, 'Ricardo Rodriguez', 1, 68, '1992-08-31', 'Maracay ,Aragua', 'Venezuela', 'P', 188, 100, 'D', 'D'),
(17, 'Rito Lugo', 1, 83, '1995-11-03', 'Macuto, Edo. Vargas', 'Venezuela', 'P', 178, 77, 'I', 'I'),
(18, 'Ruben Alaniz Jr', 1, 81, '1991-06-14', 'Texas', 'USA', 'P', 180, 85, 'D', 'D'),
(19, 'Samuel Pérez', 1, 58, '1999-11-29', 'Barquisimeto, Lara', 'Venezuela', 'P', 175, 80, 'I', 'I'),
(20, 'Wilfredo Boscan', 1, 63, '1989-10-26', 'Maracaibo, Edo. Zulia', 'Venezuela', 'P', 188, 103, 'D', 'D'),
(21, 'Freddy Fermín', 1, 78, '1995-05-16', 'Puerto Ordaz, Edo. Bolíva', 'Venezuela', 'C', 175, 91, 'D', 'D'),
(22, 'Gabriel Lino ', 1, 75, '1993-05-17', 'Maracay ,Aragua', 'Venezuela', 'C', 191, 91, 'D', 'D'),
(23, 'Jhonny Pereda', 1, 89, '1996-04-18', 'San Juan De Los Morros ,Guarico', 'Venezuela', 'C', 185, 92, 'D', 'D'),
(24, 'Balbino Fuenmayor', 1, 28, '1989-11-26', 'Valencia ,Carabobo', 'Venezuela', '1B', 190, 104, 'D', 'D'),
(25, 'Cesar Hernandez', 1, 10, '1990-05-23', 'Valencia ,Carabobo', 'Venezuela', '2B', 177, 79, 'A', 'D'),
(26, 'Gabriel Noriega', 1, 13, '1990-09-13', 'Maturin ,Monagas', 'Venezuela', 'SS', 188, 82, 'D', 'D'),
(27, 'Harold Castro', 1, 3, '1993-11-30', 'Caracas ,Distrito Capital', 'Venezuela', '2B', 178, 88, 'D', 'D'),
(28, 'Jose Rondon', 1, 9, '1994-03-03', 'Villa De Cura ,Aragua', 'Venezuela', 'SS', 185, 98, 'D', 'D'),
(29, 'Orlando Arcia', 1, 5, '1994-08-04', 'Barcelona ,Anzoategui', 'Venezuela', 'SS', 187, 85, 'D', 'D'),
(30, 'Wilfredo Tovar', 1, 7, '1991-08-11', 'Santa Teresa ,Miranda', 'Venezuela', '2B', 170, 82, 'D', 'D'),
(31, 'Aldrem Corredor', 1, 37, '1995-10-27', 'Ocumare Del Tuy ,Miranda', 'Venezuela', 'OF', 183, 92, 'I', 'I'),
(32, 'Ángel Aponte', 1, 0, '2000-02-03', 'Ocumare Del Tuy ,Miranda', 'Venezuela', 'OF', 183, 72, 'D', 'D'),
(33, 'Harold Ramíre', 1, 0, '1994-09-06', 'Cartagena, Colombia', 'Colombia', 'OF', 180, 100, 'D', 'D'),
(34, 'Oswaldo Arcia', 1, 31, '1991-05-09', 'Anaco ,Anzoategui', 'Venezuela', 'OF', 183, 104, 'I', 'D'),
(35, 'Teodoro Martinez', 1, 52, '1992-03-16', 'La Guaira ,Vargas', 'Venezuela', 'OF', 178, 88, 'D', 'D'),
(36, 'Anderson Martinez', 2, 82, '1993-02-22', 'Barquisimeto, Edo. Lara', 'Venezuela', 'P', 190, 81, 'D', 'D'),
(37, 'Angel Acevedo', 2, 50, '1998-09-19', 'Calabozo, Edo. Guarico', 'Venezuela', 'P', 185, 92, 'D', 'D'),
(38, 'Anthony Vizcaya', 2, 76, '1993-10-24', 'Barquisimeto, Edo. Lara', 'Venezuela', 'P', 183, 99, 'D', 'D'),
(39, 'Deolis Guerra', 2, 22, '1989-04-17', 'San Felix, Edo. Bolivar', 'Venezuela', 'P', 196, 111, 'D', 'D'),
(40, 'Erick Leal', 2, 35, '1995-03-17', 'Valencia, Edo. Carabobo', 'Venezuela', 'P', 190, 81, 'D', 'D'),
(41, 'Hansel Rodriguez', 2, 73, '1997-02-27', 'Santo Domingo, Rep. Dominicana', 'Republica Dominicana', 'P', 188, 95, 'D', 'D'),
(42, 'Henderson Alvarez', 2, 37, '1990-04-18', 'Valencia, Edo. Carabobo', 'Venezuela', 'P', 183, 92, 'D', 'D'),
(43, 'Ian Kahaloa', 2, 51, '1997-10-03', 'Hawaii, United States', 'USA', 'P', 185, 83, 'D', 'D'),
(44, 'Jesús Ménd', 2, 99, '2004-07-30', 'Valencia, Edo. Carabobo', 'Venezuela', 'P', 180, 81, 'D', 'D'),
(45, 'Jesus Tinoco', 2, 38, '1995-04-30', 'Maturin, Edo. Monagas', 'Venezuela', 'P', 193, 117, 'D', 'D'),
(46, 'Jhan Zambrano', 2, 72, '2001-12-21', 'Villa De Cura, Edo. Aragua', 'Venezuela', 'P', 187, 77, 'D', 'D'),
(47, 'Jose Torres', 2, 14, '1993-09-24', 'Caracas, Distrito Capital', 'Venezuela', 'P', 188, 78, 'I', 'I'),
(48, 'Josh Maciejewski', 2, 94, '1995-08-14', 'North Carolina, United States', 'USA', 'P', 190, 95, 'D', 'I'),
(49, 'Luis Martinez', 2, 95, '1995-01-29', 'Carupano, Edo. Sucre', 'Venezuela', 'P', 198, 90, 'D', 'D'),
(50, 'Reynaldo Alvarez', 2, 71, '2001-07-16', 'La Habana, Cuba', 'Cuba', 'P', 180, 90, 'D', 'D'),
(51, 'Wilker Palma', 2, 0, '2002-05-08', 'Valencia', 'Venezuela', 'P', 187, 82, 'D', 'D'),
(52, 'Wilking Rodriguez', 2, 56, '1990-03-02', 'Puerto Cabello ,Carabobo', 'Venezuela', 'P', 185, 160, 'D', 'D'),
(53, 'Williams Ramirez', 2, 49, '1992-08-08', 'Republica Dominicana', 'Republica Dominicana', 'P', 185, 90, 'D', 'D'),
(54, 'Wuilder Rodriguez', 2, 83, '1993-01-21', 'Puerto Cabello, Edo. Carabobo', 'Venezuela', 'P', 188, 85, 'D', 'D'),
(55, 'Arturo Nieto', 2, 63, '1992-12-09', 'Maracay, Edo. Aragua', 'Venezuela', 'C', 188, 97, 'D', 'D'),
(56, 'Carlos Perez', 2, 45, '1990-10-27', 'Valencia, Edo. Carabobo', 'Venezuela', 'C', 178, 95, 'D', 'D'),
(57, 'Luis Torrens', 2, 40, '1996-05-02', 'Valencia, Edo. Carabobo', 'Venezuela', 'C', 183, 98, 'D', 'D'),
(58, 'Angelo Castellano', 2, 26, '1995-01-13', 'San Diego, Edo. Carabobo', 'Venezuela', 'SS', 178, 74, 'D', 'D'),
(59, 'Diego Velasquez', 2, 1, '2003-10-01', 'Maracay, Edo. Aragua', 'Venezuela', 'SS', 185, 89, 'A', 'D'),
(60, 'Edwin Garcia ', 2, 6, '1991-03-01', 'Mariara, Edo. Carabobo', 'Venezuela', 'SS', 185, 83, 'D', 'D'),
(61, 'Jose Gomez', 2, 7, '1996-12-10', 'Caracas, Dto. Capital', 'Venezuela', 'SS', 180, 79, 'D', 'D'),
(62, 'Jose Peraza', 2, 18, '1994-04-30', 'Barinas, Edo. Barinas', 'Venezuela', '2B', 183, 95, 'D', 'D'),
(63, 'Renato Nuñez', 2, 39, '1994-04-04', 'Valencia, Edo. Carabobo', 'Venezuela', '3B', 185, 99, 'D', 'D'),
(64, 'Wilmer Flores', 2, 9, '1991-08-06', 'Valencia, Edo. Carabobo', 'Venezuela', '1B', 190, 96, 'D', 'D'),
(65, 'Alberth Martinez ', 2, 75, '1991-01-23', 'San Felix, Edo. Bolivar', 'Venezuela', 'OF', 185, 77, 'D', 'D'),
(66, 'Diego Rincones', 2, 8, '1999-06-14', 'Ciudad Bolivar, Edo. Bolivar', 'Venezuela', 'OF', 180, 90, 'D', 'D'),
(67, 'Miguel Aparicio', 2, 52, '1999-03-17', 'San Carlos, Edo. Cojedes', 'Venezuela', 'OF', 183, 74, 'I', 'I'),
(68, 'Romer Cuadrado', 2, 32, '1997-09-12', 'Maturin, Edo. Monagas', 'Venezuela', 'OF', 193, 83, 'D', 'D'),
(69, 'Victor Bericoto ', 2, 87, '2001-12-03', 'Maracay, Edo. Aragua', 'Venezuela', 'OF', 185, 70, 'D', 'D'),
(70, 'Adrian Sanchez', 3, 74, '1998-06-27', 'Aragua', 'Venezuela', 'P', 180, 80, 'D', 'D'),
(71, 'Anderson Severino', 3, 53, '1994-09-17', 'Santo Domingo, Rd', 'Republica Dominicana', 'P', 178, 86, 'I', 'I'),
(72, 'Bruce Rondon', 3, 99, '1990-12-09', 'Valencia, Edo. Carabobo', 'Venezuela', 'P', 190, 124, 'D', 'D'),
(73, 'Christian Mejias', 3, 29, '1999-05-19', 'Valencia, Carabobo', 'Venezuela', 'P', 183, 72, 'D', 'D'),
(74, 'Claudio Custodio', 3, 51, '1990-10-30', 'Sabana G De B, Republica Dominicana', 'Republica Dominicana', 'P', 180, 70, 'D', 'D'),
(75, 'Eduardo Figueroa', 3, 23, '1988-11-30', 'Barquisimeto, Lara', 'Venezuela', 'P', 185, 84, 'D', 'D'),
(76, 'Eiker Huizi', 3, 52, '2000-09-24', 'Caracas, Dtto. Capital', 'Venezuela', 'P', 182, 72, 'D', 'D'),
(77, 'Guillermo Moscoso', 3, 70, '1983-11-14', 'Maracay ,Aragua', 'Venezuela', 'P', 185, 90, 'A', 'D'),
(78, 'Jesus Zambrano', 3, 69, '1986-08-23', 'Valencia ,Carabobo', 'Venezuela', 'P', 178, 77, 'D', 'D'),
(79, 'Jonathan Vargas', 3, 37, '1989-05-29', 'Acarigua ,Portuguesa', 'Venezuela', 'P', 180, 80, 'D', 'I'),
(80, 'Jorgan Cavanerio', 3, 35, '1994-08-18', 'Cagua ,Aragua', 'Venezuela', 'P', 185, 87, 'D', 'D'),
(81, 'Jorge Rondon', 3, 44, '1988-09-16', 'Calabozo, Edo. Guarico', 'Venezuela', 'P', 185, 97, 'D', 'I'),
(82, 'Jose Martinez', 3, 48, '1999-04-23', 'Caracas,Dtto Capital', 'Venezuela', 'P', 180, 77, 'D', 'I'),
(83, 'Leonel Campos', 3, 45, '1987-07-17', 'Valera ,Trujillo', 'Venezuela', 'P', 187, 113, 'D', 'D'),
(84, 'Luis Rijo', 3, 60, '1998-09-06', 'Valencia,Carabobo,Venezuela', 'Venezuela', 'P', 188, 77, 'D', 'D'),
(85, 'Luis Santos', 3, 72, '1991-02-11', 'Bonao', 'Republica Dominicana', 'P', 183, 102, 'D', 'D'),
(86, 'Omar Bencomo', 3, 49, '1989-02-10', 'Valencia ,Carabobo', 'Venezuela', 'P', 178, 95, 'D', 'D'),
(87, 'Rogel Villalba', 3, 65, '2000-07-26', 'Caracas', 'Venezuela', 'P', 183, 81, 'D', 'D'),
(88, 'Gersel Pitre', 3, 30, '1996-09-09', 'Maracay ,Aragua', 'Venezuela', 'C', 183, 105, 'D', 'D'),
(89, 'Jesus Sucre', 3, 55, '1988-04-30', 'Cumaná, Edo. Sucr', 'Venezuela', 'C', 183, 90, 'D', 'D'),
(90, 'Luis Alvarez', 3, 50, '1990-02-28', 'Barquisimeto, Edo. Lara', 'Venezuela', 'C', 180, 104, 'D', 'D'),
(91, 'Rafael Marchan', 3, 31, '1999-02-25', 'San Cristobal, Tachira.', 'Venezuela', 'C', 175, 77, 'D', 'A'),
(92, 'Yorman Rodriguez', 3, 10, '1997-07-23', 'Maracay ,Aragua', 'Venezuela', 'C', 179, 85, 'D', 'D'),
(93, 'Alexi Amarista', 3, 2, '1989-04-06', 'Barcelona ,Anzoategui', 'Venezuela', '2B', 168, 70, 'I', 'D'),
(94, 'Angel Aguilar', 3, 6, '1995-06-13', 'Barinas ,Barinas', 'Venezuela', 'SS', 183, 77, 'D', 'D'),
(95, 'Daniel Mayora', 3, 16, '1985-07-27', 'Naiguata, Edo. La Guaira', 'Venezuela', 'IF', 180, 79, 'D', 'D'),
(96, 'Keyber Rodriguez ', 3, 22, '2000-10-24', 'Maracay, Venezuela', 'Venezuela', 'SS', 182, 72, 'D', 'D'),
(97, 'Leobaldo Piñ', 3, 21, '1994-06-29', 'Maracay ,Aragua', 'Venezuela', 'SS', 185, 97, 'D', 'D'),
(98, 'Yonathan Mendoza', 3, 67, '1994-02-10', 'Quibor ,Lara', 'Venezuela', 'SS', 0, 0, 'I', 'D'),
(99, 'Carlos Tocci', 3, 16, '1995-08-23', 'Maracay ,Aragua', 'Venezuela', 'OF', 184, 87, 'D', 'D'),
(100, 'Jose Martinez ', 3, 40, '1988-07-25', 'La Guaira ,Vargas', 'Venezuela', 'OF', 0, 0, 'D', 'D'),
(101, 'Jose Pirela', 3, 28, '1989-11-21', 'Valera, Edo. Trujillo', 'Venezuela', 'OF', 183, 99, 'D', 'D'),
(102, 'Leobaldo Cabrera', 3, 97, '1998-01-21', 'Cabimas ,Zulia', 'Venezuela', 'OF', 183, 77, 'D', 'D'),
(103, 'Manuel Melendez', 3, 71, '1997-01-10', 'Carora ,Lara', 'Venezuela', 'OF', 180, 74, 'I', 'I'),
(104, 'Yermin Mercedes', 3, 73, '1993-02-14', 'La Romana, Republica Dominicana', 'Republica Dominicana', 'OF', 180, 111, 'D', 'D'),
(105, 'Brayan Perez', 4, 0, '2000-09-05', 'Valencia, Carabobo', 'Venezuela', 'P', 181, 87, 'I', 'I'),
(106, 'Diego Moreno', 4, 50, '1987-07-21', 'Barlovento ,Miranda', 'Venezuela', 'P', 185, 106, 'D', 'D'),
(107, 'Fabian Blanco', 4, 65, '1997-12-22', 'Maracay ,Aragua', 'Venezuela', 'P', 183, 93, 'I', 'I'),
(108, 'Franklin Van Gurp', 4, 0, '1995-10-26', 'Isla San Maarten', 'Republica Dominicana', 'P', 187, 85, 'D', 'D'),
(109, 'Héctor Rodrígu', 4, 80, '1997-12-27', 'San Felipe, Edo. Yaracuy', 'Venezuela', 'P', 175, 75, 'I', 'I'),
(110, 'Jhoulys Chacin', 4, 45, '1988-01-07', 'Maracaibo ,Zulia', 'Venezuela', 'P', 191, 98, 'D', 'D'),
(111, 'Jose Ascanio', 4, 42, '1985-05-02', 'Maracay, Edo. Aragua', 'Venezuela', 'P', 180, 88, 'D', 'D'),
(112, 'Jose Bravo', 4, 0, '1997-06-10', 'Tijuana', 'Mexico', 'P', 180, 80, 'D', 'D'),
(113, 'Anderson Espinoza', 4, 0, '1998-03-09', 'Caracas ,Distrito Capital', 'Venezuela', 'P', 183, 73, 'D', 'D'),
(114, 'Luis Rico', 4, 71, '1993-11-29', 'Pto La Cruz ,Anzoategui', 'Venezuela', 'P', 185, 81, 'I', 'I'),
(115, 'Maximo Castillo', 4, 54, '1999-05-04', 'Caracas ,Distrito Capital', 'Venezuela', 'P', 190, 200, 'D', 'D'),
(116, 'Michele Vassalotti', 4, 37, '2000-08-02', 'Valencia, Edo. Carabobo', 'Venezuela', 'P', 187, 81, 'D', 'D'),
(117, 'Nestor Molina', 4, 36, '1989-01-09', 'Valencia ,Carabobo', 'Venezuela', 'P', 185, 99, 'D', 'D'),
(118, 'Pedro Garcia', 4, 68, '1995-03-21', 'Maracaibo', 'Venezuela', 'P', 179, 78, 'D', 'D'),
(119, 'Raul Rivero', 4, 69, '1986-05-06', 'Cumana ,Sucre', 'Venezuela', 'P', 183, 100, 'D', 'D'),
(120, 'Rodrigo Benoit', 4, 18, '1994-02-23', 'Santiago', 'Republica Dominicana', 'P', 188, 90, 'D', 'D'),
(121, 'Silvino Bracho', 4, 56, '1992-07-17', 'Maracaibo, Edo. Zulia', 'Venezuela', 'P', 178, 86, 'D', 'D'),
(122, 'Vicente Campos', 4, 34, '1992-07-27', 'La Sabana ,Vargas', 'Venezuela', 'P', 190, 104, 'D', 'D'),
(123, 'Wilser Barrios', 4, 81, '1998-03-21', 'Valencia', 'Venezuela', 'P', 186, 85, 'D', 'D'),
(124, 'Yapson Gomez', 4, 30, '1993-10-02', 'San Cristobal ,Tachira', 'Venezuela', 'P', 178, 72, 'I', 'i'),
(125, 'Carlos Narvaez', 4, 75, '1998-11-26', 'Maracay', 'Venezuela', 'C', 180, 90, 'D', 'D'),
(126, 'Hendrik Clementina', 4, 49, '1997-06-17', 'Curazao', 'Curazao', 'C', 188, 110, 'D', 'D'),
(127, 'Jose Sibrian', 4, 56, '1998-10-24', 'Siquisique ,Lara', 'Venezuela', 'C', 180, 79, 'D', 'D'),
(128, 'Yojhan Quevedo', 4, 16, '1993-11-06', 'Maracaibo ,Zulia', 'Venezuela', 'C', 185, 97, 'A', 'D'),
(129, 'Cesar Daniel Izturis', 4, 2, '1999-11-11', 'Barquisimeto ,Lara', 'Venezuela', 'SS', 180, 65, 'D', 'D'),
(130, 'Hernan Perez', 4, 26, '1991-03-26', 'Maracay ,Aragua', 'Venezuela', 'SS', 187, 110, 'D', 'D'),
(131, 'Ildemaro Vargas', 4, 10, '1991-07-16', 'Caripe ,Monagas', 'Venezuela', 'SS', 183, 77, 'D', 'D'),
(132, 'Javier Sanoja', 4, 22, '2002-09-03', 'Maracay', 'Venezuela', 'SS', 179, 80, 'D', 'D'),
(133, 'Jecksson Flores', 4, 66, '1993-10-28', 'Ciudad Bolivar ,Bolivar', 'Venezuela', 'SS', 180, 65, 'D', 'D'),
(134, 'Jermain Palacios', 4, 4, '1993-09-29', 'Barquisimeto ,Lara', 'Venezuela', 'SS', 183, 65, 'D', 'D'),
(135, 'Juniel Querecuto', 4, 5, '1992-09-19', 'Barquisimeto ,Lara', 'Venezuela', 'SS', 175, 89, 'A', 'D'),
(136, 'Rangel Ravelo', 4, 44, '1992-04-24', 'La Habana, Cuba', 'Cuba', '1B', 186, 102, 'D', 'D'),
(137, 'Angel Reyes', 4, 30, '1995-05-06', 'Barcelona, Edo. Anzoátegu', 'Venezuela', 'OF', 183, 80, 'D', 'D'),
(138, 'Gorkys Hernandez', 4, 7, '1987-09-07', 'Guiria ,Sucre', 'Venezuela', 'OF', 182, 80, 'D', 'D'),
(139, 'Juan Teixeira', 4, 85, '1998-02-01', 'Caracas', 'Venezuela', 'OF', 179, 83, 'D', 'D'),
(140, 'Odubel Herrera', 4, 29, '1991-12-29', 'Bobure ,Zulia', 'Venezuela', 'OF', 180, 92, 'I', 'D'),
(141, 'Angel Padron', 5, 66, '1997-09-16', 'Maracay ,Aragua', 'Venezuela', 'P', 180, 79, 'D', 'D'),
(142, 'Anthony Castro', 5, 44, '1995-04-13', 'Caracas, Distrito Capital', 'Venezuela', 'P', 188, 86, 'D', 'D'),
(143, 'Arnaldo Hernandez', 5, 67, '1996-02-09', 'San Felix ,Bolivar', 'Venezuela', 'P', 183, 79, 'D', 'D'),
(144, 'Carlos Suniaga', 5, 79, '1997-05-26', 'Porlamar ,Nueva Esparta', 'Venezuela', 'P', 188, 85, 'D', 'D'),
(145, 'David Reyes', 5, 0, '1990-04-12', 'Sinaloa', 'Mexico', 'P', 183, 86, 'D', 'D'),
(146, 'Eduardo Paredes', 5, 58, '1995-03-06', 'Valera ,Trujillo', 'Venezuela', 'P', 185, 104, 'D', 'D'),
(147, 'Elvis Araujo', 5, 98, '1991-07-15', 'Maracaibo, Edo. Zulia', 'Venezuela', 'P', 201, 125, 'I', 'I'),
(148, 'Emilio Vargas', 5, 0, '1996-08-12', 'Moca, Republica Dominicana', 'Venezuela', 'P', 190, 99, 'D', 'D'),
(149, 'Emilker Guzman', 5, 62, '1999-02-10', 'Charallave, Miranda', 'Venezuela', 'P', 179, 73, 'D', 'D'),
(150, 'Eudis Idrogo', 5, 18, '1995-06-06', 'Maturin, Edo. Monagas', 'Venezuela', 'P', 185, 89, 'I', 'I'),
(151, 'Jesus Pirela', 5, 49, '1989-03-13', 'Mara ,Zulia', 'Venezuela', 'P', 183, 70, 'D', 'D'),
(152, 'Junior Guerra', 5, 25, '1985-01-16', 'San Felix ,Bolivar', 'Venezuela', 'P', 183, 92, 'D', 'D'),
(153, 'Karlo Seijas', 5, 68, '2000-09-06', 'San Mateo, Aragua', 'Venezuela', 'P', 185, 98, 'D', 'D'),
(154, 'Luis Madero', 5, 12, '1997-08-15', 'Maracay ,Aragua', 'Venezuela', 'P', 185, 88, 'D', 'D'),
(155, 'Pedro Rodriguez', 5, 70, '1987-10-31', 'Barcelona ,Anzoategui', 'Venezuela', 'P', 183, 84, 'D', 'D'),
(156, 'Ricardo Pinto', 5, 46, '1994-01-20', 'Guacara ,Carabobo', 'Venezuela', 'P', 183, 88, 'D', 'D'),
(157, 'Tiago Da Silva', 5, 0, '1985-03-28', 'Sao Paulo', 'Brasil', 'P', 180, 80, 'D', 'D'),
(158, 'Will Changarotty', 5, 39, '1995-10-19', 'Maracaibo ,Zulia', 'Venezuela', 'P', 183, 75, 'D', 'D'),
(159, 'Francisco Arcia', 5, 37, '1984-09-14', 'La Guaira ,Vargas', 'Venezuela', 'C', 180, 91, 'D', 'D'),
(160, 'Jose Briceno', 5, 35, '1992-09-19', 'Caracas ,Distrito Capital', 'Venezuela', 'C', 178, 74, 'D', 'D'),
(161, 'Luis Torrens', 5, 96, '1996-05-02', 'Valencia, Edo. Carabobo', 'Venezuela', 'C', 183, 98, 'D', 'D'),
(162, 'Sebastian Rivero', 5, 0, '1998-11-16', 'Maracay ,Aragua', 'Venezuela', 'C', 175, 80, 'D', 'D'),
(163, 'Alcides Escobar', 5, 2, '1986-12-16', 'La Sabana ,Vargas', 'Venezuela', 'SS', 185, 93, 'D', 'D'),
(164, 'Brayan Rocchio', 5, 4, '2001-01-13', 'Valencia, Carabobo', 'Venezuela', 'IF', 178, 77, 'A', 'D'),
(165, 'Carlos Rivero', 5, 7, '1988-05-20', 'Barquisimeto ,Lara', 'Venezuela', '3B', 190, 99, 'D', 'D'),
(166, 'Ehire Adrianza', 5, 21, '1989-08-21', 'Guarenas ,Miranda', 'Venezuela', 'SS', 185, 90, 'A', 'D'),
(167, 'Leonardo Reginatto', 5, 22, '1990-04-10', 'Curitiba', 'Brasil', '3B', 188, 90, 'D', 'D'),
(168, 'Maikel Garcia', 5, 5, '2000-03-03', 'La Sabana, Edo. Vargas', 'Venezuela', 'SS', 188, 73, 'D', 'D'),
(169, 'Wilson Garcia', 5, 10, '1994-01-11', 'Caracas ,Distrito Capital', 'Venezuela', '1B', 180, 100, 'D', 'D'),
(170, 'Anthony Jimenez', 5, 0, '1995-10-21', 'Nueva Bolivia ,Merida', 'Venezuela', 'OF', 180, 75, 'D', 'D'),
(171, 'Danry Vasquez', 5, 99, '1994-01-08', 'Ocumare Del Tuy ,Miranda', 'Venezuela', 'OF', 191, 86, 'D', 'I'),
(172, 'Franklin Barreto', 5, 1, '1996-02-27', 'Petare ,Miranda', 'Venezuela', 'OF', 177, 80, 'D', 'D'),
(173, 'Harold Ramírez', 5, 0, '1994-09-06', 'Cartagena, Colombia', 'Colombia', 'OF', 180, 100, 'D', 'D'),
(174, 'Lorenzo Cedrola', 5, 43, '1998-01-12', 'Caracas, Distrito Capital, Venezuela', 'Venezuela', 'OF', 173, 69, 'D', 'D'),
(175, 'Ronald Acuña', 5, 13, '1997-12-18', 'La Guaira ,Vargas', 'Venezuela', 'OF', 183, 93, 'D', 'D'),
(176, 'Yasiel Puig', 5, 31, '1990-12-07', 'Cienfuegos', 'Cuba', 'OF', 188, 108, 'D', 'D'),
(177, 'Adrian Luna', 6, 32, '2001-07-27', 'Porlamar', 'Venezuela', 'P', 180, 85, 'D', 'D'),
(178, 'Carlos Navas', 6, 65, '1992-08-13', 'Puerto Cabello ,Carabobo', 'Venezuela', 'P', 183, 98, 'D', 'D'),
(179, 'David Ramos', 6, 30, '1991-09-13', 'Valencia ,Carabobo', 'Venezuela', 'P', 183, 79, 'D', 'D'),
(180, 'Dedgar Jimenez', 6, 66, '1996-03-06', 'Araure ,Portuguesa', 'Venezuela', 'P', 191, 95, 'I', 'I'),
(181, 'Felix Doubront', 6, 69, '1989-10-23', 'Puerto Cabello, Edo. Carabobo', 'Venezuela', 'P', 188, 109, 'I', 'I'),
(182, 'Gio Soto', 6, 43, '1991-05-18', 'Puerto Rico', 'Puerto Rico', 'P', 185, 95, 'I', 'I'),
(183, 'Gustavo Rodriguez', 6, 20, '2001-01-08', 'Cumana, Estado Sucre', 'Venezuela', 'P', 190, 92, 'D', 'D'),
(184, 'Henry Centeno', 6, 71, '1994-08-24', 'Araya ,Sucre', 'Venezuela', 'P', 187, 78, 'D', 'D'),
(185, 'Jesus Balaguer', 6, 0, '1993-08-12', 'La Habana', 'Cuba', 'P', 186, 80, 'D', 'D'),
(186, 'Jesus Castillo', 6, 27, '1995-08-27', 'Valencia, Carabobo', 'Venezuela', 'P', 186, 81, 'I', 'I'),
(187, 'Jose Panacual', 6, 0, '2002-01-13', 'Rio Chico,Miranda', 'Venezuela', 'P', 181, 80, 'D', 'D'),
(188, 'Luis Alcala', 6, 0, '2000-11-07', 'Guiria, Estado Sucre', 'Venezuela', 'P', 180, 70, 'D', 'D'),
(189, 'Luis Torres', 6, 57, '1994-06-04', 'Barquisimeto ,Lara', 'Venezuela', 'P', 191, 86, 'D', 'D'),
(190, 'Melvi Acosta', 6, 25, '1995-06-02', 'Guiria, Estado Sucre', 'Venezuela', 'P', 188, 80, 'D', 'D'),
(191, 'Osmel Morales', 6, 73, '1992-12-30', 'Villa De Cura ,Aragua', 'Venezuela', 'P', 191, 89, 'D', 'D'),
(192, 'Raul Rangel', 6, 38, '2002-10-09', 'Caracas, Distrito Capital', 'Venezuela', 'P', 180, 75, 'D', 'D'),
(193, 'Sonny Vargas', 6, 0, '2000-11-08', 'Valencia, Edo. Carabobo', 'Venezuela', 'P', 187, 83, 'I', 'I'),
(194, 'Werner Leal', 6, 0, '1995-07-08', 'Puerto Cabello ,Carabobo', 'Venezuela', 'P', 187, 75, 'D', 'D'),
(195, 'Yender Caramo', 6, 45, '1991-08-25', 'San Felix ,Bolivar', 'Venezuela', 'P', 183, 85, 'D', 'D'),
(196, 'Carlos Perez', 6, 12, '1996-09-10', 'Valencia ,Carabobo', 'Venezuela', 'C', 180, 85, 'D', 'D'),
(197, 'David Rodriguez', 6, 7, '1997-07-07', 'Barcelona, Edo. Anzoategui', 'Venezuela', 'C', 185, 97, 'D', 'D'),
(198, 'Jason Lopez', 6, 17, '1998-03-16', 'Valencia ,Carabobo', 'Venezuela', 'C', 177, 80, 'D', 'D'),
(199, 'Juan Graterol', 6, 24, '1989-02-14', 'Maracay ,Aragua', 'Venezuela', 'C', 185, 102, 'D', 'D'),
(200, 'Wilson Ramos', 6, 40, '1980-01-01', 'Valencia ,Carabobo', 'Venezuela', 'C', 185, 109, 'D', 'D'),
(201, 'Alberto Gonzalez', 6, 12, '1983-04-18', 'Maracaibo, Edo. Zulia', 'Venezuela', 'IF', 178, 88, 'D', 'D'),
(202, 'Breyvic Valera', 6, 15, '1992-01-08', 'Montalban, Estado Carabobo', 'Venezuela', '2B', 180, 80, 'A', 'D'),
(203, 'Jose Martinez', 6, 22, '1996-08-15', 'Machiques De Perija, Zulia', 'Brasil', 'SS', 178, 84, 'D', 'D'),
(204, 'Kevin Maitan', 6, 3, '2000-02-12', 'Puerto Cabello ,Carabobo', 'Venezuela', 'SS', 183, 75, 'D', 'D'),
(205, 'Lizandro Espinoza', 6, 0, '2002-11-20', 'Higuerote, Miranda', 'Venezuela', '1B', 180, 75, 'D', 'D'),
(206, 'Raul Rivas', 6, 2, '1996-10-27', 'Cumana , Estado Sucre', 'Venezuela', '2B', 178, 73, 'A', 'A'),
(207, 'Esney Chacon', 6, 0, '2000-03-17', 'Porlamar,Nueva Esparta,Venezuela', 'Venezuela', 'OF', 188, 77, 'D', 'I'),
(208, 'Moises Gomez', 6, 60, '1998-08-27', 'Caracas, Distrito Capital', 'Venezuela', 'OF', 180, 90, 'D', 'D'),
(209, 'Ramon Flores', 6, 31, '1992-03-26', 'Barinas ,Estado Barinas', 'Colombia', 'OF', 178, 86, 'I', 'I'),
(210, 'Tomo Otosaka', 6, 6, '1994-01-06', 'Kanagawa', 'Japon', 'OF', 180, 82, 'I', 'D'),
(211, 'Cristian Hernandez', 7, 21, '2000-09-23', 'Barcelona, Anzoategui', 'Venezuela', 'P', 180, 80, 'D', 'D'),
(212, 'David Richardson', 7, 42, '1991-01-31', 'Florida', 'USA', 'P', 170, 77, 'D', 'D'),
(213, 'Edgar Escobar', 7, 96, '1997-01-02', 'Granma, Cuba', 'Cuba', 'P', 185, 99, 'D', 'D'),
(214, 'Emerson Martinez', 7, 69, '1995-01-11', 'Barcelona ,Anzoategui', 'Venezuela', 'P', 180, 80, 'D', 'D'),
(215, 'Frainger Aranguren', 7, 58, '1997-03-17', 'Caracas, Dtto Federal', 'Venezuela', 'P', 180, 80, 'D', 'D'),
(216, 'Gabriel Yanez', 7, 67, '1999-07-22', 'El Tigre, Anzoategui', 'Venezuela', 'P', 175, 85, 'D', 'D'),
(217, 'Heribert Garcia', 7, 59, '1999-10-02', 'Ciudad Bolivar, Bolivar', 'Venezuela', 'P', 175, 80, 'D', 'D'),
(218, 'Jean Toledo', 7, 64, '1981-03-06', 'Barcelona ,Anzoategui', 'Venezuela', 'P', 188, 90, 'D', 'D'),
(219, 'Jesus Paricaguan', 7, 71, '1995-12-03', 'Barcelona ,Anzoategui', 'Venezuela', 'P', 181, 70, 'D', 'D'),
(220, 'Jose Torres', 7, 76, '1993-09-24', 'Caracas ,Distrito Capital', 'Venezuela', 'P', 185, 86, 'I', 'I'),
(221, 'Leonard Garcia', 7, 0, '2003-08-11', 'Barcelona, Anzoategui', 'Venezuela', 'P', 175, 80, 'I', 'I'),
(222, 'Liarvis Breto', 7, 73, '1993-04-10', 'Barinas ,Barinas', 'Venezuela', 'P', 180, 79, 'I', 'I'),
(223, 'Loiger Padron', 7, 89, '1991-01-31', 'Puerto Ordaz ,Bolivar', 'Venezuela', 'P', 181, 80, 'D', 'D'),
(224, 'Luis Amaya', 7, 61, '1998-08-26', 'Punto Fijo ,Falcon', 'Venezuela', 'P', 178, 71, 'I', 'I'),
(225, 'Luis Escobar', 7, 78, '1996-05-30', 'Cartagena', 'Colombia', 'P', 180, 98, 'D', 'D'),
(226, 'Orlando Barrios', 7, 97, '2001-08-27', 'Coro, Falcon', 'Venezuela', 'P', 195, 85, 'D', 'D'),
(227, 'Ryan Zimmerman', 7, 12, '1995-12-28', 'Minnesota', 'USA', 'P', 175, 80, 'D', 'D'),
(228, 'Yeizo Campos', 7, 44, '1996-04-29', 'Barcelona, Anzoátegu', 'Venezuela', 'P', 175, 78, 'D', 'D'),
(229, 'Ramon Cabrera', 7, 38, '1989-11-05', 'Caracas ,Dtto. Capital', 'Venezuela', 'C', 172, 84, 'D', 'A'),
(230, 'Ricardo Genoves', 7, 9, '1998-07-13', 'Caracas, Distrito Capital', 'Venezuela', 'C', 170, 77, 'D', 'D'),
(231, 'Tomas Telis', 7, 23, '1991-06-18', 'El Tigre, Anzoategui', 'Venezuela', 'C', 178, 85, 'A', 'D'),
(232, 'Wilfred Astudillo', 7, 0, '2000-03-14', 'Barcelona, Anzoategui', 'Venezuela', 'C', 180, 85, 'D', 'D'),
(233, 'Antonio Piñer', 7, 35, '1999-03-15', 'Bejuma ,Carabobo', 'Venezuela', 'SS', 183, 58, 'D', 'D'),
(234, 'Asdrubal Cabrera', 7, 13, '1985-11-13', 'Puerto La Cruz ,Anzoategui', 'Venezuela', '1B', 178, 80, 'D', 'D'),
(235, 'Balbino Fuenmayor', 7, 28, '1989-11-26', 'Valencia ,Carabobo', 'Venezuela', '1B', 190, 104, 'D', 'D'),
(236, 'Jose Fernandez ', 7, 46, '2003-09-22', 'Santa Fe, Sucre', 'Venezuela', 'SS', 175, 80, 'D', 'D'),
(237, 'Kevin Vicuna ', 7, 3, '1989-01-14', 'Maracay ,Aragua', 'Venezuela', '2B', 178, 75, 'D', 'D'),
(238, 'Luis Sardiña', 7, 34, '1993-05-16', 'Puerto Ordaz ,Bolivar', 'Venezuela', 'SS', 180, 80, 'A', 'D'),
(239, 'Niuman Romero ', 7, 4, '1985-01-24', 'Barcelona ,Anzoategui', 'Venezuela', '3B', 185, 86, 'A', 'D'),
(240, 'Wilmer Perez', 7, 55, '1998-04-16', 'Valencia, Carabobo', 'Venezuela', '3B', 175, 80, 'D', 'D'),
(241, 'Herlis Rodriguez', 7, 37, '1994-10-06', 'Colon ,Tachira', 'Venezuela', 'OF', 180, 96, 'I', 'I'),
(242, 'Jesus Bugarin', 7, 45, '2001-12-02', 'Ciudad Piar, Bolivar', 'Venezuela', 'OF', 175, 80, 'D', 'D'),
(243, 'Roberto Chirinos', 7, 8, '2000-09-08', 'Pariaguan, Anzoategui', 'Venezuela', 'OF', 175, 75, 'D', 'D'),
(244, 'Alejandro Chacin', 8, 38, '1993-06-24', 'Maracay, Edo. Aragua', 'Venezuela', 'P', 175, 90, 'D', 'D'),
(245, 'Alvin Herrera', 8, 41, '1993-03-15', 'Guatire, Edo. Miranda', 'Venezuela', 'P', 185, 74, 'D', 'D'),
(246, 'Amilcar Medina', 8, 58, '2004-09-02', 'Maracaibo, Edo. Zulia', 'Venezuela', 'P', 190, 70, 'D', 'D'),
(247, 'Anderson Muño', 8, 74, '1998-08-04', 'La Cañada, Edo. Zuli', 'Venezuela', 'P', 175, 75, 'D', 'D'),
(248, 'Angel Rondon', 8, 70, '1997-12-01', 'Higuey', 'Republica Dominicana', 'P', 185, 92, 'D', 'D'),
(249, 'Carlos Betancourt', 8, 42, '2001-03-27', 'Cumana, Edo. Sucre', 'Venezuela', 'P', 177, 80, 'D', 'D'),
(250, 'Carlos Quevedo', 8, 34, '1989-09-30', 'Valencia, Edo. Carabobo', 'Venezuela', 'P', 185, 90, 'D', 'D'),
(251, 'Danny Rondon', 8, 67, '1987-06-21', 'Maracaibo, Edo. Zulia', 'Venezuela', 'P', 180, 83, 'D', 'D'),
(252, 'Eduardo Jimenez', 8, 52, '1995-04-04', 'Araya, Edo. Sucre', 'Venezuela', 'P', 188, 97, 'D', 'D'),
(253, 'Eiberson Castellano', 8, 46, '2001-05-09', 'Maracaibo, Edo. Zulia', 'Venezuela', 'P', 190, 80, 'D', 'D'),
(254, 'Elvis Araujo', 8, 54, '1991-07-15', 'Maracaibo, Edo. Zulia', 'Venezuela', 'P', 201, 110, 'I', 'I'),
(255, 'Eudis Idrogo', 8, 18, '1995-06-06', 'Maturin, Edo. Monagas', 'Venezuela', 'P', 185, 89, 'I', 'I'),
(256, 'Francisco Carrillo', 8, 39, '1990-03-15', 'Maracay, Edo. Aragua', 'Venezuela', 'P', 183, 86, 'D', 'D'),
(257, 'Ismael Guillon', 8, 57, '1992-02-13', 'Tocuyito, Edo. Carabobo', 'Venezuela', 'P', 188, 100, 'I', 'I'),
(258, 'Jefferson Medina', 8, 71, '1993-05-23', 'Cabimas, Edo. Zulia', 'Colombia', 'P', 185, 90, 'D', 'D'),
(259, 'Jorge Tavarez', 8, 40, '1995-08-04', 'Loma De Cabrera', 'Republica Dominicana', 'P', 178, 68, 'D', 'D'),
(260, 'Jose Davila', 8, 48, '2002-11-09', 'Maracaibo, Edo. Zulia', 'Venezuela', 'P', 180, 85, 'D', 'D'),
(261, 'Hector Sanchez', 8, 44, '1989-11-17', 'Maracay, Edo. Aragua', 'Venezuela', 'C', 183, 85, 'A', 'D'),
(262, 'Luis Hernánde', 8, 43, '2000-09-06', 'Tovar, Edo. Mérid', 'Venezuela', 'C', 178, 68, 'D', 'D'),
(263, 'Omar Andres Martinez', 8, 60, '2001-07-05', 'San Félix, Edo. Boliva', 'Venezuela', 'C', 178, 85, 'I', 'D'),
(264, 'Andres Chaparro', 8, 87, '1999-05-04', 'El Vigia, Edo. Mérid', 'Venezuela', '3B', 182, 90, 'D', 'D'),
(265, 'Eduardo Torrealba', 8, 21, '1999-03-26', 'Barquisimeto, Edo. Lara', 'Venezuela', 'SS', 176, 64, 'D', 'D'),
(266, 'Jesus Chirinos', 8, 50, '2001-07-27', 'Bachaquero, Edo. Zulia', 'Venezuela', '1B', 183, 80, 'D', 'D'),
(267, 'José Colmenares', 8, 14, '2002-04-03', 'San Cristóbal, Edo. Táchi', 'Venezuela', 'IF', 180, 78, 'D', 'D'),
(268, 'Jose Salas', 8, 10, '2003-04-26', 'Caracas, Dto. Capital', 'Venezuela', 'SS', 183, 86, 'D', 'A'),
(269, 'Luis Castro ', 8, 5, '1995-09-19', 'Caja Seca, Edo. Zulia', 'Venezuela', '2B', 185, 84, 'D', 'D'),
(270, 'Nerwilliam Cedeño', 8, 35, '2002-03-16', 'Río Tucaní, Edo. Mér', 'Venezuela', '2B', 175, 77, 'D', 'D'),
(271, 'Alexander Romero', 8, 17, '1983-09-09', 'Maracaibo, Edo. Zulia', 'Venezuela', 'OF', 183, 93, 'I', 'D'),
(272, 'Alexander Suarez', 8, 33, '2001-12-20', 'Valera, Edo. Trujillo', 'Venezuela', 'OF', 182, 80, 'D', 'D'),
(273, 'Angel Reyes ', 8, 30, '1995-05-06', 'Barcelona, Edo. Anzoátegu', 'Venezuela', 'OF', 183, 80, 'D', 'D'),
(274, 'Edgar Basabe', 8, 99, '2004-04-27', 'Bobures, Edo. Zulia', 'Venezuela', 'OF', 182, 76, 'D', 'D'),
(275, 'Niko Hulsizer ', 8, 66, '1997-02-01', 'Mohnton, Pennsylvania', 'USA', 'OF', 183, 102, 'D', 'D'),
(276, 'Simon Muzziotti', 8, 7, '1998-12-27', 'Cumaná, Edo. Sucr', 'Venezuela', 'OF', 183, 80, 'I', 'I'),
(277, 'Yonathan Perlaza ', 8, 63, '1998-11-10', 'Río Tucaní, Edo. Zul', 'Venezuela', 'OF', 178, 75, 'D', 'D');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_ligas`
--

CREATE TABLE `t_ligas` (
  `id_liga` int(11) NOT NULL,
  `nombre_liga` varchar(50) NOT NULL,
  `ruta_img_liga` varchar(50) NOT NULL,
  `fundacion_liga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_ligas`
--

INSERT INTO `t_ligas` (`id_liga`, `nombre_liga`, `ruta_img_liga`, `fundacion_liga`) VALUES
(1, 'Liga Venezolana de Beisbol Profesional            ', 'img/ligas/lvbp.png', 1945),
(2, 'Liga Mayor de Beisbol Profesional', 'img/ligas/lmbp.png', 2021);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_manager`
--

CREATE TABLE `t_manager` (
  `id_manager` int(11) NOT NULL,
  `nombre_manager` varchar(50) NOT NULL,
  `fecha_nacimiento_manager` date DEFAULT NULL,
  `nacionalidad_manager` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_manager`
--

INSERT INTO `t_manager` (`id_manager`, `nombre_manager`, `fecha_nacimiento_manager`, `nacionalidad_manager`) VALUES
(1, 'José Alguacil', '1972-08-09', 'Venezuela'),
(2, 'Eduardo Pérez', '1968-05-10', 'Venezuela'),
(3, 'Welby Bailey', '1957-03-28', 'USA'),
(4, 'Henry Blanco', '1971-08-29', 'Venezuela'),
(5, 'Oswaldo Guillén', '1964-01-20', 'Venezuela'),
(6, 'José Moreno', '1967-02-25', 'Venezuela'),
(7, 'Jackson Melián', '1980-01-07', 'Venezuela'),
(8, ' Lipso Nava', NULL, 'Venezuela'),
(9, 'Robert Pérez', '1969-06-04', 'Venezuela'),
(10, 'Ángel Tovar', NULL, 'Venezuela'),
(11, 'Cesar Izturis', '1980-02-10', 'Venezuela'),
(12, 'Carlos García', '1967-10-15', 'Venezuela'),
(13, 'Robinson Chirinos', '1984-05-06', 'Venezuela'),
(14, 'Marco Davalillo', '1967-07-06', 'Venezuela'),
(15, 'Víctor Garate', '1984-07-25', 'Venezuela');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_usuarios`
--

CREATE TABLE `t_usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `nivel_permiso` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_usuarios`
--

INSERT INTO `t_usuarios` (`id_usuario`, `nombre_usuario`, `contrasena`, `nivel_permiso`) VALUES
(4, 'sergio', '12345', 1),
(5, 'sergiomantenimiento', '12345', 2),
(6, 'sergioadmin', '12345', 3),
(7, 'mario', '12345', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `t_campeonatos`
--
ALTER TABLE `t_campeonatos`
  ADD PRIMARY KEY (`id_campeonato`);

--
-- Indices de la tabla `t_equipos`
--
ALTER TABLE `t_equipos`
  ADD PRIMARY KEY (`id_equipo`),
  ADD KEY `id_liga` (`id_liga`),
  ADD KEY `id_manager` (`id_manager`);

--
-- Indices de la tabla `t_equipo_campeonato`
--
ALTER TABLE `t_equipo_campeonato`
  ADD PRIMARY KEY (`id_equipo_campeonato`),
  ADD KEY `id_equipo` (`id_equipo`),
  ADD KEY `id_campeonato` (`id_campeonato`);

--
-- Indices de la tabla `t_jugadores`
--
ALTER TABLE `t_jugadores`
  ADD PRIMARY KEY (`id_jugador`),
  ADD KEY `id_equipo` (`id_equipo`);

--
-- Indices de la tabla `t_ligas`
--
ALTER TABLE `t_ligas`
  ADD PRIMARY KEY (`id_liga`);

--
-- Indices de la tabla `t_manager`
--
ALTER TABLE `t_manager`
  ADD PRIMARY KEY (`id_manager`);

--
-- Indices de la tabla `t_usuarios`
--
ALTER TABLE `t_usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `t_campeonatos`
--
ALTER TABLE `t_campeonatos`
  MODIFY `id_campeonato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `t_equipos`
--
ALTER TABLE `t_equipos`
  MODIFY `id_equipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `t_equipo_campeonato`
--
ALTER TABLE `t_equipo_campeonato`
  MODIFY `id_equipo_campeonato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `t_jugadores`
--
ALTER TABLE `t_jugadores`
  MODIFY `id_jugador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=280;

--
-- AUTO_INCREMENT de la tabla `t_ligas`
--
ALTER TABLE `t_ligas`
  MODIFY `id_liga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `t_manager`
--
ALTER TABLE `t_manager`
  MODIFY `id_manager` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `t_usuarios`
--
ALTER TABLE `t_usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `t_equipos`
--
ALTER TABLE `t_equipos`
  ADD CONSTRAINT `t_equipos_ibfk_1` FOREIGN KEY (`id_manager`) REFERENCES `t_manager` (`id_manager`),
  ADD CONSTRAINT `t_equipos_ibfk_2` FOREIGN KEY (`id_liga`) REFERENCES `t_ligas` (`id_liga`);

--
-- Filtros para la tabla `t_equipo_campeonato`
--
ALTER TABLE `t_equipo_campeonato`
  ADD CONSTRAINT `t_equipo_campeonato_ibfk_1` FOREIGN KEY (`id_campeonato`) REFERENCES `t_campeonatos` (`id_campeonato`),
  ADD CONSTRAINT `t_equipo_campeonato_ibfk_2` FOREIGN KEY (`id_equipo`) REFERENCES `t_equipos` (`id_equipo`);

--
-- Filtros para la tabla `t_jugadores`
--
ALTER TABLE `t_jugadores`
  ADD CONSTRAINT `t_jugadores_ibfk_1` FOREIGN KEY (`id_equipo`) REFERENCES `t_equipos` (`id_equipo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
