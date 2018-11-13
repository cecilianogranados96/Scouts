-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 13-11-2018 a las 22:41:46
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `guia2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alergia`
--

CREATE TABLE `alergia` (
  `id_alergia` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `sintomas_medicamentos` varchar(200) NOT NULL,
  `sintomas_picaduras` varchar(200) NOT NULL,
  `detalle_inyeccion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alergia`
--

INSERT INTO `alergia` (`id_alergia`, `nombre`, `sintomas_medicamentos`, `sintomas_picaduras`, `detalle_inyeccion`) VALUES
(1, 'NOMBRE ALERGIA', 'SINTOMAS MEDICOS', 'PICADURAS', 'INYECCION\r\n');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alergia_x_formulario`
--

CREATE TABLE `alergia_x_formulario` (
  `id_alergia` int(11) NOT NULL,
  `id_formulario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alergia_x_formulario`
--

INSERT INTO `alergia_x_formulario` (`id_alergia`, `id_formulario`) VALUES
(1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area_bitacora`
--

CREATE TABLE `area_bitacora` (
  `id_area` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `area_bitacora`
--

INSERT INTO `area_bitacora` (`id_area`, `nombre`) VALUES
(1, 'Sociabilidad'),
(2, 'Afectividad'),
(3, 'Espiritualidad'),
(4, 'Caracter'),
(5, 'Corporalidad'),
(6, 'Creatividad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area_brujula`
--

CREATE TABLE `area_brujula` (
  `id_area` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `area_brujula`
--

INSERT INTO `area_brujula` (`id_area`, `nombre`) VALUES
(1, 'Historia, guia y scout'),
(2, 'Cabuyeria'),
(3, 'Claves y codigos'),
(4, 'Fuegos y fogones'),
(5, 'Herramientas'),
(6, 'Campismo y aire libre'),
(7, 'Cocina y nutricion'),
(8, 'Asecho y observacion'),
(9, 'Comunicaciones'),
(10, 'Navegacion terrestre'),
(11, 'Salud y bienestar'),
(12, 'Civismo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area_x_bitacora`
--

CREATE TABLE `area_x_bitacora` (
  `id_area` int(11) NOT NULL,
  `id_bitacora` int(11) NOT NULL,
  `porcentaje` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area_x_brujula`
--

CREATE TABLE `area_x_brujula` (
  `id_area` int(11) NOT NULL,
  `id_brujula` int(11) NOT NULL,
  `cedula` int(11) NOT NULL,
  `porcentaje` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `area_x_brujula`
--

INSERT INTO `area_x_brujula` (`id_area`, `id_brujula`, `cedula`, `porcentaje`) VALUES
(1, 1, 116590468, 11),
(1, 2, 116590468, 2),
(1, 3, 116590468, 11),
(2, 1, 116590468, 12),
(2, 4, 116590468, 55),
(3, 2, 116590468, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE `bitacora` (
  `id_bitacora_cedula` int(11) NOT NULL,
  `id_bitacora` int(11) NOT NULL,
  `cedula` int(11) NOT NULL,
  `area_bitacora` int(11) NOT NULL,
  `nombre_reto` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `porcentaje` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `bitacora`
--

INSERT INTO `bitacora` (`id_bitacora_cedula`, `id_bitacora`, `cedula`, `area_bitacora`, `nombre_reto`, `fecha`, `porcentaje`) VALUES
(1, 3, 116590468, 3, 'nombre reto', '2018-11-02', 12),
(2, 2, 116590468, 3, 'es', '2018-11-02', 1),
(3, 3, 116590468, 5, 'cr', '2018-11-02', 2),
(4, 4, 116590468, 3, '2211', '2018-11-02', 11),
(5, 4, 116590468, 6, 'scdcsc', '2018-11-02', 44),
(6, 2, 116590468, 3, 'nombre reto', '2018-11-06', 99);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brujula`
--

CREATE TABLE `brujula` (
  `id_brujula` int(11) NOT NULL,
  `id_scout` int(11) NOT NULL,
  `tipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `canton`
--

CREATE TABLE `canton` (
  `id_canton` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `id_provincia` int(11) NOT NULL,
  `numero` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `canton`
--

INSERT INTO `canton` (`id_canton`, `nombre`, `id_provincia`, `numero`) VALUES
(1, 'San Jose', 1, '01'),
(2, 'Escazu', 1, '02'),
(3, 'Desamparados', 1, '03'),
(4, 'Puriscal', 1, '04'),
(5, 'Tarrazú', 1, '05'),
(6, 'Aserri', 1, '06'),
(7, 'Mora', 1, '07'),
(8, 'Goicoechea', 1, '08'),
(9, 'Santa Ana', 1, '09'),
(10, 'Alajuelita', 1, '10'),
(11, 'Vasquez de Coronado', 1, '11'),
(12, 'Acosta', 1, '12'),
(13, 'Tibas', 1, '13'),
(14, 'Moravia', 1, '14'),
(15, 'Montes de Oca', 1, '15'),
(16, 'Turrubares', 1, '16'),
(17, 'Dota', 1, '17'),
(18, 'Curridabat', 1, '18'),
(19, 'Perez Zeledon', 1, '19'),
(20, 'Leon Cortez', 1, '20'),
(21, 'Alajuela', 2, '01'),
(22, 'San Ramon', 2, '02'),
(23, 'Grecia', 2, '03'),
(24, 'San Mateo', 2, '04'),
(25, 'Atenas', 2, '05'),
(26, 'Naranjo', 2, '06'),
(27, 'Palmares', 2, '07'),
(28, 'Poas', 2, '08'),
(29, 'Orotina', 2, '09'),
(30, 'San Carlos', 2, '10'),
(31, 'Alfaro Ruiz', 2, '11'),
(32, 'Valverde Vega', 2, '12'),
(33, 'Upala', 2, '13'),
(34, 'Los Chiles', 2, '14'),
(35, 'Guatuso', 2, '15'),
(36, 'Cartago', 3, '01'),
(37, 'Paraiso', 3, '02'),
(38, 'La Union', 3, '03'),
(39, 'Jimenez', 3, '04'),
(40, 'Turrialba', 3, '05'),
(41, 'Alvarado', 3, '06'),
(42, 'Oreamuno', 3, '07'),
(43, 'El Guarco', 3, '08'),
(44, 'Heredia', 4, '01'),
(45, 'Barva', 4, '02'),
(46, 'Santo Domingo', 4, '03'),
(47, 'Santa Barbara', 4, '04'),
(48, 'San Rafael', 4, '05'),
(49, 'San Isidro', 4, '06'),
(50, 'Belen', 4, '07'),
(51, 'Flores', 4, '08'),
(52, 'San Pablo', 4, '09'),
(53, 'Sarapiqui', 4, '10'),
(54, 'Liberia', 5, '01'),
(55, 'Nicoya', 5, '02'),
(56, 'Santa Cruz', 5, '03'),
(57, 'Bagaces', 5, '04'),
(58, 'Carrillo', 5, '05'),
(59, 'Cañas', 5, '06'),
(60, 'Abangares', 5, '07'),
(61, 'Tilaran', 5, '08'),
(62, 'Nandayure', 5, '09'),
(63, 'La Cruz', 5, '10'),
(64, 'Hojancha', 5, '11'),
(65, 'Puntarenas', 6, '01'),
(66, 'Esparza', 6, '02'),
(67, 'Buenos Aires', 6, '03'),
(68, 'Montes de Oro', 6, '04'),
(69, 'Osa', 6, '05'),
(70, 'Aguirre', 6, '06'),
(71, 'Golfito', 6, '07'),
(72, 'Coto Brus', 6, '08'),
(73, 'Parrita', 6, '09'),
(74, 'Corredores', 6, '10'),
(75, 'Garabito', 6, '11'),
(76, 'Limon', 7, '01'),
(77, 'Pococi', 7, '02'),
(78, 'Siquirres', 7, '03'),
(79, 'Talamanca', 7, '04'),
(80, 'Matina', 7, '05'),
(81, 'Guacimo', 7, '06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distrito`
--

CREATE TABLE `distrito` (
  `id_distrito` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `id_canton` int(11) NOT NULL,
  `numero` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `distrito`
--

INSERT INTO `distrito` (`id_distrito`, `nombre`, `id_canton`, `numero`) VALUES
(1, 'Carmen', 1, '01'),
(2, 'Merced', 1, '02'),
(3, 'Hospital', 1, '03'),
(4, 'Catedral', 1, '04'),
(5, 'Zapote', 1, '05'),
(6, 'San Francisco de Dos Rios', 1, '06'),
(7, 'Uruca', 1, '07'),
(8, 'Mata Redonda', 1, '08'),
(9, 'Pavas', 1, '09'),
(10, 'Hatillo', 1, '10'),
(11, 'San Sebastian', 1, '10'),
(12, 'Escazu', 2, '01'),
(13, 'San Antonio', 2, '02'),
(14, 'San Rafael', 2, '03'),
(15, 'Desamparados', 3, '01'),
(16, 'San Miguel', 3, '02'),
(17, 'San Juan de Dios', 3, '03'),
(18, 'San Rafael Arriba', 3, '04'),
(19, 'San Antonio', 3, '05'),
(20, 'Frailes', 3, '06'),
(21, 'Patarra', 3, '07'),
(22, 'San Cristobal', 3, '08'),
(23, 'Rosario', 3, '09'),
(24, 'Damas', 3, '10'),
(25, 'San Rafael Abajo', 3, '11'),
(26, 'Gravillas', 3, '12'),
(27, 'Los Guidos', 3, '13'),
(28, 'Santiago', 4, '01'),
(29, 'Mercedes Sur', 4, '02'),
(30, 'Barbacoas', 4, '03'),
(31, 'Grito Alto', 4, '04'),
(32, 'San Rafael', 4, '05'),
(33, 'Candelarita', 4, '06'),
(34, 'Desamparaditos', 4, '07'),
(35, 'San Antonio', 4, '08'),
(36, 'Chires', 4, '09'),
(37, 'San Marcos', 5, '01'),
(38, 'San Lorenzo', 5, '02'),
(39, 'San Carlos', 5, '03'),
(40, 'Aserri', 6, '01'),
(41, 'Tarbaca o Praga', 6, '02'),
(42, 'Vuelta de Jorco', 6, '03'),
(43, 'San Gabriel', 6, '04'),
(44, 'La Legua', 6, '05'),
(45, 'Monterrey', 6, '06'),
(46, 'Salitrillos', 6, '07'),
(47, 'Colon', 7, '01'),
(48, 'Guayabo', 7, '02'),
(49, 'Tabarcia', 7, '03'),
(50, 'Piedras Negras', 7, '04'),
(51, 'Picagres', 7, '05'),
(52, 'Guadalupe', 8, '01'),
(53, 'San Francisco', 8, '02'),
(54, 'Calle Blancos', 8, '03'),
(55, 'Mata de Platano', 8, '04'),
(56, 'Ipis', 8, '05'),
(57, 'Rancho Redondo', 8, '06'),
(58, 'Purral', 8, '07'),
(59, 'Santa Ana', 9, '01'),
(60, 'Salitral', 9, '02'),
(61, 'Pozos o Concepcion', 9, '03'),
(62, 'Uruca o San Joaquín', 9, '04'),
(63, 'Piedades', 9, '05'),
(64, 'Brasil', 9, '06'),
(65, 'Alajuelita', 10, '01'),
(66, 'San Josecito', 10, '02'),
(67, 'San Antonio', 10, '03'),
(68, 'Concepcion', 10, '04'),
(69, 'San Felipe', 10, '05'),
(70, 'San Isidro', 11, '01'),
(71, 'San Rafael', 11, '02'),
(72, 'Dulce Nombre o Jesus', 11, '03'),
(73, 'Patalillo', 11, '04'),
(74, 'Cascajal', 11, '05'),
(75, 'San Ignacio', 12, '01'),
(76, 'Guaitil', 12, '02'),
(77, 'Palmichal', 12, '03'),
(78, 'Cangrejal', 12, '04'),
(79, 'Sabanillas', 12, '05'),
(80, 'San Juan', 13, '01'),
(81, 'Cinco Esquinas', 13, '02'),
(82, 'Anselmo Llorente', 13, '03'),
(83, 'Leon XIII', 13, '04'),
(84, 'Colima', 13, '05'),
(85, 'San Vicente', 14, '01'),
(86, 'San Jeronimo', 14, '02'),
(87, 'Trinidad', 14, '03'),
(88, 'San Pedro', 15, '01'),
(89, 'Sabanilla', 15, '02'),
(90, 'Mercedes o Betania', 15, '03'),
(91, 'San Rafael', 15, '04'),
(92, 'San Pablo', 16, '01'),
(93, 'San Pedro', 16, '02'),
(94, 'San Juan de Mata', 16, '03'),
(95, 'San Luis', 16, '04'),
(96, 'Carara', 16, '05'),
(97, 'Santa Maria', 17, '01'),
(98, 'Jardin', 17, '02'),
(99, 'Copey', 17, '03'),
(100, 'Curridabat', 18, '01'),
(101, 'Granadilla', 18, '02'),
(102, 'Sanchez', 18, '03'),
(103, 'Tirrases', 18, '04'),
(104, 'San Isidro del General', 19, '01'),
(105, 'General', 19, '02'),
(106, 'Daniel Flores', 19, '03'),
(107, 'Rivas', 19, '04'),
(108, 'San Pedro', 19, '05'),
(109, 'Platanares', 19, '06'),
(110, 'Pejibaye', 19, '07'),
(111, 'Cajon o Carmen', 19, '08'),
(112, 'Baru', 19, '09'),
(113, 'Rio Nuevo', 19, '10'),
(114, 'Páramo', 19, '11'),
(115, 'San Pablo', 20, '01'),
(116, 'San Andres', 20, '02'),
(117, 'Llano Bonito', 20, '03'),
(118, 'San Isidro', 20, '04'),
(119, 'Santa Cruz', 20, '05'),
(120, 'San Antonio', 20, '06'),
(121, 'Alajuela', 21, '01'),
(122, 'San Jose', 21, '02'),
(123, 'Carrizal', 21, '03'),
(124, 'San Antonio', 21, '04'),
(125, 'Guacima', 21, '05'),
(126, 'San Isidro', 21, '06'),
(127, 'Sabanilla', 21, '07'),
(128, 'San Rafael', 21, '08'),
(129, 'Rio Segundo', 21, '09'),
(130, 'Desamparados', 21, '10'),
(131, 'Turrucares', 21, '11'),
(132, 'Tambor', 21, '12'),
(133, 'Garita', 21, '13'),
(134, 'Sarapiqui', 21, '14'),
(135, 'San Ramon', 22, '01'),
(136, 'Santiago', 22, '02'),
(137, 'San Juan', 22, '03'),
(138, 'Piedades Norte', 22, '04'),
(139, 'Piedades Sur', 22, '05'),
(140, 'San Rafael', 22, '06'),
(141, 'San Isidro', 22, '07'),
(142, 'Angeles', 22, '08'),
(143, 'Alfaro', 22, '09'),
(144, 'Volio', 22, '10'),
(145, 'Concepcion', 22, '11'),
(146, 'Zapotal', 22, '12'),
(147, 'San Isidro de Peñas Blancas', 22, '13'),
(148, 'Grecia', 23, '01'),
(149, 'San Isidro', 23, '02'),
(150, 'San Jose', 23, '03'),
(151, 'San Roque', 23, '04'),
(152, 'Tacares', 23, '05'),
(153, 'Rio Cuarto', 23, '06'),
(154, 'Puente de Piedra', 23, '07'),
(155, 'Bolivar', 23, '08'),
(156, 'San Mateo', 24, '01'),
(157, 'Desmonte', 24, '02'),
(158, 'Jesus Maria', 24, '03'),
(159, 'Atenas', 25, '01'),
(160, 'Jesus', 25, '02'),
(161, 'Mercedes', 25, '03'),
(162, 'San Isidro', 25, '04'),
(163, 'Concepcion', 25, '05'),
(164, 'San Jose', 25, '06'),
(165, 'Santa Eulalia', 25, '07'),
(166, 'Escobal', 25, '08'),
(167, 'Naranjo', 26, '01'),
(168, 'San Miguel', 26, '02'),
(169, 'San Jose', 26, '03'),
(170, 'Cirri Sur', 26, '04'),
(171, 'San Jeronimo', 26, '05'),
(172, 'San Juan', 26, '06'),
(173, 'Rosario', 26, '07'),
(174, 'Palmares', 27, '01'),
(175, 'Zaragoza', 27, '01'),
(176, 'Buenos Aires', 27, '01'),
(177, 'Santiago', 27, '01'),
(178, 'Candelaria', 27, '01'),
(179, 'Esquipulas', 27, '01'),
(180, 'La Granja', 27, '01'),
(181, 'San Pedro', 28, '01'),
(182, 'San Juan', 28, '02'),
(183, 'San Rafael', 28, '03'),
(184, 'Carrillos', 28, '04'),
(185, 'Sabana Redonda', 28, '05'),
(186, 'Orotina', 29, '01'),
(187, 'Mastate', 29, '02'),
(188, 'Hacienda Vieja', 29, '03'),
(189, 'Coyolar', 29, '04'),
(190, 'Ceiba', 29, '05'),
(191, 'Quesada', 30, '01'),
(192, 'Florencia', 30, '02'),
(193, 'Buenavista', 30, '03'),
(194, 'Aguas Zarcas', 30, '04'),
(195, 'Venecia', 30, '05'),
(196, 'Pital', 30, '06'),
(197, 'Fortuna', 30, '07'),
(198, 'Tigra', 30, '08'),
(199, 'Palmera', 30, '09'),
(200, 'Venado', 30, '10'),
(201, 'Cutris', 30, '11'),
(202, 'Monterrey', 30, '12'),
(203, 'Pocosol', 30, '13'),
(204, 'Zarcero', 31, '01'),
(205, 'Laguna', 31, '02'),
(206, 'Tapezco', 31, '03'),
(207, 'Guadalupe', 31, '04'),
(208, 'Palmira', 31, '05'),
(209, 'Zapote', 31, '06'),
(210, 'Brisas', 31, '07'),
(211, 'Sarchi Norte', 32, '01'),
(212, 'Sarchi Sur', 32, '02'),
(213, 'Toro Amarillo', 32, '03'),
(214, 'San Pedro', 32, '04'),
(215, 'Rodriguez', 32, '05'),
(216, 'Upala', 33, '01'),
(217, 'Aguas Claras', 33, '02'),
(218, 'San Jose o Pizote', 33, '03'),
(219, 'Bijagua', 33, '04'),
(220, 'Delicias', 33, '05'),
(221, 'Dos Rios', 33, '06'),
(222, 'Yolillal', 33, '07'),
(223, 'Los Chiles', 34, '01'),
(224, 'Caño Negro', 34, '02'),
(225, 'El Amparo', 34, '03'),
(226, 'San Jorge', 34, '04'),
(227, 'San Rafael', 35, '01'),
(228, 'Buenavista', 35, '02'),
(229, 'Cote', 35, '03'),
(230, 'Oriental', 36, '01'),
(231, 'Occidental', 36, '02'),
(232, 'Carmen', 36, '03'),
(233, 'San Nicolas', 36, '04'),
(234, 'Aguacaliente o San Francisco', 36, '05'),
(235, 'Guadalupe o Arenilla', 36, '06'),
(236, 'Corralillo', 36, '07'),
(237, 'Tierra Blanca', 36, '08'),
(238, 'Dulce Nombre', 36, '09'),
(239, 'Llano Grande', 36, '10'),
(240, 'Quebradilla', 36, '11'),
(241, 'Paraiso', 37, '01'),
(242, 'Santiago', 37, '02'),
(243, 'Orosi', 37, '03'),
(244, 'Cachi', 37, '04'),
(245, 'Llanos de Santa Lucia', 37, '05'),
(246, 'Tres Rios', 38, '01'),
(247, 'San Diego', 38, '02'),
(248, 'San Juan', 38, '03'),
(249, 'San Rafael', 38, '04'),
(250, 'Concepcion', 38, '05'),
(251, 'Dulce Nombre', 38, '06'),
(252, 'San Ramon', 38, '07'),
(253, 'Rio Azul', 38, '08'),
(254, 'Juan Viñas', 39, '01'),
(255, 'Tucurrique', 39, '02'),
(256, 'Pejibaye', 39, '03'),
(257, 'Turrialba', 40, '01'),
(258, 'La Suiza', 40, '02'),
(259, 'Peralta', 40, '03'),
(260, 'Santa Cruz', 40, '04'),
(261, 'Santa Teresita', 40, '05'),
(262, 'Pavones', 40, '06'),
(263, 'Tuis', 40, '07'),
(264, 'Tayutic', 40, '08'),
(265, 'Santa Rosa', 40, '09'),
(266, 'Tres Equis', 40, '10'),
(267, 'La Isabel', 40, '11'),
(268, 'Chirripo', 40, '12'),
(269, 'Pacayas', 41, '01'),
(270, 'Cervantes', 41, '02'),
(271, 'Capellades', 41, '03'),
(272, 'San Rafael', 42, '01'),
(273, 'Cot', 42, '02'),
(274, 'Potrero Cerrado', 42, '03'),
(275, 'Cipreses', 42, '04'),
(276, 'Santa Rosa', 42, '05'),
(277, 'Tejar', 43, '01'),
(278, 'San Isidro', 43, '02'),
(279, 'Tobosi', 43, '03'),
(280, 'Patio de Agua', 43, '04'),
(281, 'Heredia', 44, '01'),
(282, 'Mercedes', 44, '02'),
(283, 'San Francisco', 44, '03'),
(284, 'Ulloa', 44, '04'),
(285, 'Vara Blanca', 44, '05'),
(286, 'Barva', 45, '01'),
(287, 'San Pedro', 45, '02'),
(288, 'San Pablo', 45, '03'),
(289, 'San Roque', 45, '04'),
(290, 'Santa Lucia', 45, '05'),
(291, 'San Jose de la Montaña', 45, '06'),
(292, 'Santo Domingo', 46, '01'),
(293, 'San Vicente', 46, '02'),
(294, 'San Miguel', 46, '03'),
(295, 'Paracito', 46, '04'),
(296, 'Santo Tomas', 46, '05'),
(297, 'Santa Rosa', 46, '06'),
(298, 'Tures', 46, '07'),
(299, 'Para', 46, '08'),
(300, 'Santa Barbara', 47, '01'),
(301, 'San Pedro', 47, '02'),
(302, 'San Juan', 47, '03'),
(303, 'Jesus', 47, '04'),
(304, 'Santo Domingo del Roble', 47, '05'),
(305, 'Puraba', 47, '06'),
(306, 'San Rafael', 48, '01'),
(307, 'San Josecito', 48, '02'),
(308, 'Santiago', 48, '03'),
(309, 'Angeles', 48, '04'),
(310, 'Concepcion', 48, '05'),
(311, 'San Isidro', 49, '01'),
(312, 'San Jose', 49, '02'),
(313, 'Concepcion', 49, '03'),
(314, 'San Francisco', 49, '04'),
(315, 'San Antonio', 50, '01'),
(316, 'La Rivera', 50, '02'),
(317, 'Asuncion', 50, '03'),
(318, 'San Joaquin', 51, '01'),
(319, 'Barrantes', 51, '02'),
(320, 'Llorente', 51, '03'),
(321, 'San Pablo', 52, '01'),
(322, 'Puerto Viejo', 53, '01'),
(323, 'La Virgen', 53, '02'),
(324, 'Horquetas', 53, '03'),
(325, 'Llanuras del Gaspar', 53, '04'),
(326, 'Cureña', 53, '05'),
(327, 'Liberia', 54, '01'),
(328, 'Cañas Dulces', 54, '02'),
(329, 'Mayorga', 54, '03'),
(330, 'Nacascolo', 54, '04'),
(331, 'Curubande', 54, '05'),
(332, 'Nicoya', 55, '01'),
(333, 'Mansion', 55, '02'),
(334, 'San Antonio', 55, '03'),
(335, 'Quebrada Honda', 55, '04'),
(336, 'Samara', 55, '05'),
(337, 'Nosara', 55, '06'),
(338, 'Belen de Nosarita', 55, '07'),
(339, 'Santa Cruz', 56, '01'),
(340, 'Bolson', 56, '02'),
(341, 'Veintisiete de Abril', 56, '03'),
(342, 'Tempate', 56, '04'),
(343, 'Cartagena', 56, '05'),
(344, 'Cuajiniquil', 56, '06'),
(345, 'Diria', 56, '07'),
(346, 'Cabo Velas', 56, '08'),
(347, 'Tamarindo', 56, '09'),
(348, 'Bagaces', 57, '01'),
(349, 'Fortuna', 57, '02'),
(350, 'Mogote', 57, '03'),
(351, 'Rio Naranjo', 57, '04'),
(352, 'Filadelfia', 58, '01'),
(353, 'Palmira', 58, '02'),
(354, 'Sardinal', 58, '03'),
(355, 'Belen', 58, '04'),
(356, 'Cañas', 59, '01'),
(357, 'Palmira', 59, '02'),
(358, 'San Miguel', 59, '03'),
(359, 'Bebedero', 59, '04'),
(360, 'Porozal', 59, '05'),
(361, 'Juntas', 60, '01'),
(362, 'Sierra', 60, '02'),
(363, 'San Juan', 60, '03'),
(364, 'Colorado', 60, '04'),
(365, 'Tilaran', 61, '01'),
(366, 'Quebrada Grande', 61, '02'),
(367, 'Tronadora', 61, '03'),
(368, 'Santa Rosa', 61, '04'),
(369, 'Libano', 61, '05'),
(370, 'Tierras Morenas', 61, '06'),
(371, 'Arenal', 61, '07'),
(372, 'Carmona', 62, '01'),
(373, 'Santa Rita', 62, '02'),
(374, 'Zapotal', 62, '03'),
(375, 'San Pablo', 62, '04'),
(376, 'Porvenir', 62, '05'),
(377, 'Bejuco', 62, '06'),
(378, 'La Cruz', 63, '01'),
(379, 'Santa Cecilia', 63, '02'),
(380, 'Garita', 63, '03'),
(381, 'Santa Elena', 63, '04'),
(382, 'Hojancha', 64, '01'),
(383, 'Monte Romo', 64, '02'),
(384, 'Puerto Carrillo', 64, '03'),
(385, 'Huacas', 64, '04'),
(386, 'Puntarenas', 65, '01'),
(387, 'Pitahaya', 65, '02'),
(388, 'Chomes', 65, '03'),
(389, 'Lepanto', 65, '04'),
(390, 'Paquera', 65, '05'),
(391, 'Manzanillo', 65, '06'),
(392, 'Guacimal', 65, '07'),
(393, 'Barranca', 65, '08'),
(394, 'Monte Verde', 65, '09'),
(395, 'Isla del Coco', 65, '10'),
(396, 'Cobano', 65, '11'),
(397, 'Chacarita', 65, '12'),
(398, 'Chira', 65, '13'),
(399, 'Acapulco', 65, '14'),
(400, 'El Roble', 65, '15'),
(401, 'Arancibia', 65, '16'),
(402, 'Espiritu Santo', 66, '01'),
(403, 'San Juan Grande', 66, '02'),
(404, 'Macacona', 66, '03'),
(405, 'San Rafael', 66, '04'),
(406, 'San Jeronimo', 66, '05'),
(407, 'Buenos Aires', 67, '01'),
(408, 'Volcan', 67, '02'),
(409, 'Potrero Grande', 67, '03'),
(410, 'Boruca', 67, '04'),
(411, 'Pilas', 67, '05'),
(412, 'Colinas o Bajo de Maiz', 67, '06'),
(413, 'Changuenas', 67, '07'),
(414, 'Biolley', 67, '08'),
(415, 'Brunka', 67, '09'),
(416, 'Miramar', 68, '01'),
(417, 'Union', 68, '02'),
(418, 'San Isidro', 68, '03'),
(419, 'Cortes', 69, '01'),
(420, 'Palmar', 69, '02'),
(421, 'Sierpe', 69, '03'),
(422, 'Bahia Ballena', 69, '04'),
(423, 'Piedras Blancas', 69, '05'),
(424, 'Quepos', 70, '01'),
(425, 'Savegre', 70, '02'),
(426, 'Naranjito', 70, '03'),
(427, 'Golfito', 71, '01'),
(428, 'Puerto Jimenez', 71, '02'),
(429, 'Guaycara', 71, '03'),
(430, 'Pavones o Villa Conte', 71, '04'),
(431, 'San Vito', 72, '01'),
(432, 'Sabalito', 72, '02'),
(433, 'Agua Buena', 72, '03'),
(434, 'Limoncito', 72, '04'),
(435, 'Pittier', 72, '05'),
(436, 'Parrita', 73, '01'),
(437, 'Corredores', 74, '01'),
(438, 'La Cuesta', 74, '02'),
(439, 'Paso Canoas', 74, '03'),
(440, 'Laurel', 74, '04'),
(441, 'Jaco', 75, '01'),
(442, 'Tarcoles', 75, '02'),
(443, 'Limon', 76, '01'),
(444, 'Valle la Estrella', 76, '02'),
(445, 'Rio Blanco', 76, '03'),
(446, 'Matama', 76, '04'),
(447, 'Guapiles', 77, '01'),
(448, 'Jimenez', 77, '02'),
(449, 'Rita', 77, '03'),
(450, 'Roxana', 77, '04'),
(451, 'Cariari', 77, '05'),
(452, 'Colorado', 77, '06'),
(453, 'Siquirres', 78, '01'),
(454, 'Pacuarito', 78, '02'),
(455, 'Florida', 78, '03'),
(456, 'Germania', 78, '04'),
(457, 'Cairo', 78, '05'),
(458, 'Alegria', 78, '06'),
(459, 'Bratsi', 79, '01'),
(460, 'Sixaola', 79, '02'),
(461, 'Cahuita', 79, '03'),
(462, 'Telire', 79, '04'),
(463, 'Matina', 80, '01'),
(464, 'Batan', 80, '02'),
(465, 'Carrandi', 80, '03'),
(466, 'Guacimo', 81, '01'),
(467, 'Mercedes', 81, '02'),
(468, 'Pocora', 81, '03'),
(469, 'Rio Jimenez', 81, '04'),
(470, 'Duacari', 81, '05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `educacion`
--

CREATE TABLE `educacion` (
  `id_educacion` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `educacion`
--

INSERT INTO `educacion` (`id_educacion`, `nombre`) VALUES
(1, 'Primaria - primer ciclo'),
(2, 'Primaria - segundo ciclo'),
(3, 'Secundaria - tercer ciclo'),
(4, 'Secundaria - cuarto ciclo'),
(5, 'Bachillerato'),
(6, 'Licenciatura'),
(7, 'Maestria'),
(8, 'Especialidad'),
(9, 'Doctorado'),
(10, 'Primaria - primer ciclo'),
(11, 'Primaria - segundo ciclo'),
(12, 'Secundaria - tercer ciclo'),
(13, 'Secundaria - cuarto ciclo'),
(14, 'Bachillerato'),
(15, 'Licenciatura'),
(16, 'Maestria'),
(17, 'Especialidad'),
(18, 'Doctorado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encargado`
--

CREATE TABLE `encargado` (
  `id-encargado` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `telefono` varchar(8) NOT NULL,
  `scout` tinyint(4) NOT NULL DEFAULT '0',
  `parentesco` varchar(15) NOT NULL,
  `cedula_persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `encargado`
--

INSERT INTO `encargado` (`id-encargado`, `nombre`, `correo`, `telefono`, `scout`, `parentesco`, `cedula_persona`) VALUES
(2, 'JOSE CECILIANO', 'cecilianogranados96@gmail.com', '86069871', 2, 'Abuel@', 116590468);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encargado_x_scout`
--

CREATE TABLE `encargado_x_scout` (
  `id_encargado` int(11) NOT NULL,
  `id_scout` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfermedad`
--

CREATE TABLE `enfermedad` (
  `id_enfermedad` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `enfermedad`
--

INSERT INTO `enfermedad` (`id_enfermedad`, `nombre`) VALUES
(28, 'Abuso de drogas'),
(2, 'Alcoholismo'),
(18, 'Alergias'),
(14, 'Anemia'),
(33, 'Anestesia general'),
(25, 'Artritis'),
(3, 'Asma'),
(16, 'Bronquitis'),
(27, 'Cáncer o tumor'),
(12, 'Claustrofobia'),
(5, 'Colitis'),
(34, 'Convulsiones'),
(17, 'Diabetes'),
(19, 'Dolores de cabeza (frecuentes)'),
(15, 'Dolores de espalda (recurrentes)'),
(6, 'Epilepsia'),
(24, 'Hemofilia'),
(8, 'Hemorroides'),
(20, 'Hernias'),
(9, 'Migraña'),
(23, 'Nervios'),
(22, 'Operaciones quirúrgicas'),
(21, 'Parálisis (polio)'),
(1, 'Presión alta'),
(13, 'Presión baja'),
(30, 'Problemas de circulación'),
(7, 'Problemas de la vesícula'),
(29, 'Problemas de la vista/ojos'),
(31, 'Problemas de riñones'),
(26, 'Sangre en eses'),
(4, 'Sangre en orina'),
(10, 'Transtornos mentales'),
(11, 'Transtornos sanguíneos'),
(32, 'Tuberculosis');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfermedad_x_fomulario`
--

CREATE TABLE `enfermedad_x_fomulario` (
  `id_enfermedad` int(11) NOT NULL,
  `id_formulario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `enfermedad_x_fomulario`
--

INSERT INTO `enfermedad_x_fomulario` (`id_enfermedad`, `id_formulario`) VALUES
(2, 3),
(3, 3),
(25, 3),
(33, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `id_especialidad` int(11) NOT NULL,
  `cedula` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `tipo` int(11) NOT NULL,
  `reto` int(11) NOT NULL,
  `aprobado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`id_especialidad`, `cedula`, `fecha`, `tipo`, `reto`, `aprobado`) VALUES
(8, 116590468, '2018-11-01', 1, 1, 1),
(9, 116590468, '2018-11-01', 1, 8, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formulario_medico`
--

CREATE TABLE `formulario_medico` (
  `id_formulario` int(11) NOT NULL,
  `cedula` int(11) NOT NULL,
  `tipo_sangre` varchar(3) NOT NULL,
  `descripcion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `formulario_medico`
--

INSERT INTO `formulario_medico` (`id_formulario`, `cedula`, `tipo_sangre`, `descripcion`) VALUES
(3, 116590468, 'Bp', 'DESCRIPCION DE ENFEMEDADES');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamento`
--

CREATE TABLE `medicamento` (
  `id_medicamento` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `dosis` varchar(100) NOT NULL,
  `indicacion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `medicamento`
--

INSERT INTO `medicamento` (`id_medicamento`, `nombre`, `dosis`, `indicacion`) VALUES
(1, 'ibuprofeno', '1', '12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamento_x_formulario`
--

CREATE TABLE `medicamento_x_formulario` (
  `id_medicamento` int(11) NOT NULL,
  `id_formulario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `medicamento_x_formulario`
--

INSERT INTO `medicamento_x_formulario` (`id_medicamento`, `id_formulario`) VALUES
(1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `cedula` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `seccion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `nivel_educacion` int(11) DEFAULT NULL,
  `distrito` int(11) NOT NULL,
  `direccion_exacta` text COLLATE utf8_spanish_ci NOT NULL,
  `genero` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`cedula`, `nombre`, `seccion`, `fecha_nacimiento`, `fecha_ingreso`, `nivel_educacion`, `distrito`, `direccion_exacta`, `genero`) VALUES
(116590468, 'Jose Andres Ceciliano', 'Tropa', '1996-11-15', '2018-11-01', 14, 40, 'Aserri, BM', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE `provincia` (
  `id_provincia` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `numero` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `provincia`
--

INSERT INTO `provincia` (`id_provincia`, `nombre`, `numero`) VALUES
(1, 'San Jose', '1'),
(2, 'Alajuela', '2'),
(3, 'Cartago', '3'),
(4, 'Heredia', '4'),
(5, 'Guanacaste', '5'),
(6, 'Puntarenas', '6'),
(7, 'Limon', '7');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reto_bitacora`
--

CREATE TABLE `reto_bitacora` (
  `id_reto` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reto_bitacora`
--

INSERT INTO `reto_bitacora` (`id_reto`, `nombre`) VALUES
(1, 'nombre reto bitacora');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reto_especialidad`
--

CREATE TABLE `reto_especialidad` (
  `id_reto` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `imagen` mediumblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reto_especialidad`
--

INSERT INTO `reto_especialidad` (`id_reto`, `id_tipo`, `nombre`, `imagen`) VALUES
(1, 1, 'ARTE', NULL),
(2, 1, 'ARTES DIGITALES', NULL),
(3, 1, 'ARTES MODERNAS', NULL),
(4, 1, 'ARTE URBANO', NULL),
(5, 1, 'ARQUITECTURA', NULL),
(6, 1, 'ARTESANÍA', NULL),
(7, 1, 'BAILE', NULL),
(8, 1, 'BALLLET', NULL),
(9, 1, 'CERÁMICA', NULL),
(10, 1, 'COLECCIONISMO', NULL),
(11, 1, 'COSTURA', NULL),
(12, 1, 'CULTURA INDÍGENA', NULL),
(13, 1, 'DIBUJO', NULL),
(14, 1, 'ESCRITURA', NULL),
(15, 1, 'ESCULTURA', NULL),
(16, 1, 'FOTOGRAFÍA', NULL),
(17, 1, 'LECTURA', NULL),
(18, 1, 'MANUALIDADES', NULL),
(19, 1, 'MÚSICA', NULL),
(20, 1, 'RADIO', NULL),
(21, 1, 'TEATRO', NULL),
(22, 1, 'PINTURA', NULL),
(23, 1, 'TATTOS', NULL),
(24, 1, 'TRADICIONES COSTARRICENSES', NULL),
(25, 2, 'AGRICULTURA', NULL),
(26, 2, 'ASTRONIMÍA', NULL),
(27, 2, 'BIOLOGÍA', NULL),
(28, 2, 'BOTÁNICA', NULL),
(29, 2, 'CIENCIA AGRARIA', NULL),
(30, 2, 'CIENCIAS SOCIALES', NULL),
(31, 2, 'ECOLOGÍA', NULL),
(32, 2, 'ELECTRICISTA', NULL),
(33, 2, 'ENTOMOLOGÍA', NULL),
(34, 2, 'FÍSICA', NULL),
(35, 2, 'GEOGRAFÍA', NULL),
(36, 2, 'GEOLOGÍA', NULL),
(37, 2, 'HERPETOLOGÍA', NULL),
(38, 2, 'ICTIOLOGÍA', NULL),
(39, 2, 'INFORMÁTICA', NULL),
(40, 2, 'INGENIERÍA', NULL),
(41, 2, 'MASTOZOOLOGÍA', NULL),
(42, 2, 'MATEMÁTICAS', NULL),
(43, 2, 'METEOROLOGÍA', NULL),
(44, 2, 'MICROBIOLOGÍA', NULL),
(45, 2, 'ORNITOLOGÍA', NULL),
(46, 2, 'QUÍMICA', NULL),
(47, 2, 'REDES', NULL),
(48, 2, 'ROBÓTICA', NULL),
(49, 3, 'ACONDICIONAMIENTO FÍSICO', NULL),
(50, 3, 'AERÓBICOS', NULL),
(51, 3, 'AJEDREZ', NULL),
(52, 3, 'ARTES MARCIALES', NULL),
(53, 3, 'ATLETISMO', NULL),
(54, 3, 'BÁSQUETBOL', NULL),
(55, 3, 'BÉISBOL', NULL),
(56, 3, 'BOLICHE', NULL),
(57, 3, 'CICLISMO', NULL),
(58, 3, 'FÚTBOL', NULL),
(59, 3, 'FÚTBOL AMERICANO', NULL),
(60, 3, 'KAYAK', NULL),
(61, 3, 'GOLF', NULL),
(62, 3, 'NATACIÓN', NULL),
(63, 3, 'PATINAJE', NULL),
(64, 3, 'PATINAJE EN HIELO', NULL),
(65, 3, 'PATINETA', NULL),
(66, 3, 'PESCA DEPORTIVA', NULL),
(67, 3, 'SNORKELING', NULL),
(68, 3, 'SURF', NULL),
(69, 3, 'TENNIS', NULL),
(70, 3, 'TIRO AL BLANCO', NULL),
(71, 3, 'VOLEIBOL', NULL),
(72, 3, 'YOGA', NULL),
(73, 4, 'AVICULTURA', NULL),
(74, 4, 'CAMINATA EN EL BOSQUE', NULL),
(75, 4, 'CAMPISMO', NULL),
(76, 4, 'CARTOGRAFÍA', NULL),
(77, 4, 'COCINA DE CAMPAMENTO', NULL),
(78, 4, 'CUIDO DE ANIMALES', NULL),
(79, 4, 'CONVIVENCIA CON LA NATURALEZA', NULL),
(80, 4, 'ESCALADA', NULL),
(81, 4, 'EXCURSIONISMO', NULL),
(82, 4, 'EXPLORACIÓN', NULL),
(83, 4, 'FLORA', NULL),
(84, 4, 'HIDROLOGÍA', NULL),
(85, 4, 'MANEJO DE HERRAMIENTAS', NULL),
(86, 4, 'MEDIO AMBIENTE', NULL),
(87, 4, 'NAVEGACIÓN', NULL),
(88, 4, 'OBSERVACIÓN DE ESTRELLAS', NULL),
(89, 4, 'ORIENTACIÓN Y TOPOGRAFÍA', NULL),
(90, 4, 'PIONERISMO', NULL),
(91, 4, 'RASTREO', NULL),
(92, 4, 'RECICLAJE', NULL),
(93, 4, 'SERVICIO FORESTAL', NULL),
(94, 4, 'SUPERVIVENCIA EN LA NATURALEZA', NULL),
(95, 4, 'VIDA SILVESTRE', NULL),
(96, 4, 'ZOOLOGÍA', NULL),
(97, 5, 'ALFABETIZACIÓN', NULL),
(98, 5, 'ARBORIZACIÓN', NULL),
(99, 5, 'ATENCIÓN AL ADULTO MAYOR', NULL),
(100, 5, 'ATENCIÓN', NULL),
(101, 5, 'BOMBEROS', NULL),
(102, 5, 'CIVISMO', NULL),
(103, 5, 'CUIDADO DE LA CASA', NULL),
(104, 5, 'CUIDO DEL ENTRONO', NULL),
(105, 5, 'DEFENSA CIVIL', NULL),
(106, 5, 'HISTORIA DEL ESCULTISMO Y GUIDISMO', NULL),
(107, 5, 'INTERPRETACIÓN', NULL),
(108, 5, 'NUTRICIÓN', NULL),
(109, 5, 'ORIENTACIÓN URBANA', NULL),
(110, 5, 'PARAMÉDICO', NULL),
(111, 5, 'PREPARACIÓN PARA EMERGENCIAS', NULL),
(112, 5, 'PUERICULTURA', NULL),
(113, 5, 'SALVAVIDAS', NULL),
(114, 5, 'SALUBRIDAD E HIGIENE', NULL),
(115, 5, 'SEGURIDAD VIAL', NULL),
(116, 5, 'SERVICIO COMUNITARIO', NULL),
(117, 5, 'SERVICIO DE CUIDO', NULL),
(118, 5, 'SEGURIDAD EN LA NATURALEZA', NULL),
(119, 5, 'VOLUNTARIADO', NULL),
(120, 5, 'ZONAS COMUNES RECREATIVAS', NULL),
(121, 6, 'ADVENTISTA', NULL),
(122, 6, 'AYUDA DURANTE LA MISA', NULL),
(123, 6, 'BUDISMO', NULL),
(124, 6, 'CATOLISISMO', NULL),
(125, 6, 'CONSTRUCTOR DE PAZ', NULL),
(126, 6, 'CRISTIANISMO', NULL),
(127, 6, 'HINDUÍSMO', NULL),
(128, 6, 'HISTORIA DE LAS RELIGIONES', NULL),
(129, 6, 'JUDAÍSMO', NULL),
(130, 6, 'MUSULMÁN', NULL),
(131, 6, 'PARTICIPACIÓN EN ACTIVIDADES RELIGIOSAS', NULL),
(132, 6, 'REFLEXIONISTA', NULL),
(133, 6, 'TESTIGOS DE JEHOVÁ', NULL),
(134, 1, 'ARTE', NULL),
(135, 1, 'ARTES DIGITALES', NULL),
(136, 1, 'ARTES MODERNAS', NULL),
(137, 1, 'ARTE URBANO', NULL),
(138, 1, 'ARQUITECTURA', NULL),
(139, 1, 'ARTESANÍA', NULL),
(140, 1, 'BAILE', NULL),
(141, 1, 'BALLLET', NULL),
(142, 1, 'CERÁMICA', NULL),
(143, 1, 'COLECCIONISMO', NULL),
(144, 1, 'COSTURA', NULL),
(145, 1, 'CULTURA INDÍGENA', NULL),
(146, 1, 'DIBUJO', NULL),
(147, 1, 'ESCRITURA', NULL),
(148, 1, 'ESCULTURA', NULL),
(149, 1, 'FOTOGRAFÍA', NULL),
(150, 1, 'LECTURA', NULL),
(151, 1, 'MANUALIDADES', NULL),
(152, 1, 'MÚSICA', NULL),
(153, 1, 'RADIO', NULL),
(154, 1, 'TEATRO', NULL),
(155, 1, 'PINTURA', NULL),
(156, 1, 'TATTOS', NULL),
(157, 1, 'TRADICIONES COSTARRICENSES', NULL),
(158, 2, 'AGRICULTURA', NULL),
(159, 2, 'ASTRONIMÍA', NULL),
(160, 2, 'BIOLOGÍA', NULL),
(161, 2, 'BOTÁNICA', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reto_x_area`
--

CREATE TABLE `reto_x_area` (
  `id_reto` int(11) NOT NULL,
  `id_area` int(11) NOT NULL,
  `id_bitacora` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_final` date DEFAULT NULL,
  `porcentaje` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reto_x_tipo`
--

CREATE TABLE `reto_x_tipo` (
  `id_reto` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `id_especialidad` int(11) NOT NULL,
  `aprovado` tinyint(4) NOT NULL DEFAULT '0',
  `fecha` date NOT NULL,
  `reto` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salud`
--

CREATE TABLE `salud` (
  `id_salud` int(11) NOT NULL,
  `naturaleza` varchar(100) NOT NULL,
  `año` int(11) NOT NULL,
  `cuanto_tiempo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salud_x_formulario`
--

CREATE TABLE `salud_x_formulario` (
  `id_salud` int(11) NOT NULL,
  `id_formulario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_bitacora`
--

CREATE TABLE `tipo_bitacora` (
  `id_tipo` int(11) NOT NULL,
  `nombre` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_bitacora`
--

INSERT INTO `tipo_bitacora` (`id_tipo`, `nombre`) VALUES
(2, 'Aventurero'),
(5, 'Explorador'),
(3, 'Intrepido'),
(4, 'Pionero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_brujula`
--

CREATE TABLE `tipo_brujula` (
  `id_tipo` int(11) NOT NULL,
  `nombre` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_brujula`
--

INSERT INTO `tipo_brujula` (`id_tipo`, `nombre`) VALUES
(1, 'Bronce'),
(2, 'Plata'),
(3, 'Oro'),
(4, 'Platino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_especialidad`
--

CREATE TABLE `tipo_especialidad` (
  `id_tipo` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_especialidad`
--

INSERT INTO `tipo_especialidad` (`id_tipo`, `nombre`) VALUES
(1, 'Arte, Expresión y Cultura'),
(2, 'Ciencia y Tecnología'),
(3, 'Deportes'),
(4, 'Vida en naturaleza y Ecología'),
(5, 'Servicio a los demás'),
(6, 'Desarrollo Espiritual');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE `ubicacion` (
  `id_persona` int(11) NOT NULL,
  `id_provincia` int(11) NOT NULL,
  `id_canton` int(11) NOT NULL,
  `id_distrito` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `usuario`, `pass`) VALUES
(1, 'ADMINISTRADOR', 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacuna`
--

CREATE TABLE `vacuna` (
  `id_vacuna` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `vacuna`
--

INSERT INTO `vacuna` (`id_vacuna`, `nombre`) VALUES
(2, 'Difteria'),
(8, 'Hepatitis A'),
(9, 'Hepatitis B'),
(3, 'Polio'),
(6, 'Rabia'),
(4, 'Rubiola'),
(5, 'Sarampion'),
(1, 'Tetano'),
(7, 'Tifoidea');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacuna_x_formulario`
--

CREATE TABLE `vacuna_x_formulario` (
  `id_vacuna` int(11) NOT NULL,
  `id_formulario` int(11) NOT NULL,
  `puesta` tinyint(4) NOT NULL DEFAULT '0',
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alergia`
--
ALTER TABLE `alergia`
  ADD PRIMARY KEY (`id_alergia`);

--
-- Indices de la tabla `alergia_x_formulario`
--
ALTER TABLE `alergia_x_formulario`
  ADD PRIMARY KEY (`id_alergia`,`id_formulario`),
  ADD KEY `formularioAlergia_idx` (`id_formulario`);

--
-- Indices de la tabla `area_bitacora`
--
ALTER TABLE `area_bitacora`
  ADD PRIMARY KEY (`id_area`);

--
-- Indices de la tabla `area_brujula`
--
ALTER TABLE `area_brujula`
  ADD PRIMARY KEY (`id_area`);

--
-- Indices de la tabla `area_x_bitacora`
--
ALTER TABLE `area_x_bitacora`
  ADD PRIMARY KEY (`id_area`,`id_bitacora`),
  ADD KEY `bitacora_idx` (`id_bitacora`);

--
-- Indices de la tabla `area_x_brujula`
--
ALTER TABLE `area_x_brujula`
  ADD PRIMARY KEY (`id_area`,`id_brujula`,`cedula`),
  ADD KEY `brujula_idx` (`cedula`);

--
-- Indices de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`id_bitacora_cedula`),
  ADD KEY `cedula_bitacora` (`cedula`),
  ADD KEY `tipo_bitacora` (`id_bitacora`),
  ADD KEY `area_bitacora` (`area_bitacora`);

--
-- Indices de la tabla `brujula`
--
ALTER TABLE `brujula`
  ADD PRIMARY KEY (`id_brujula`,`id_scout`,`tipo`),
  ADD KEY `scoutBrujula_idx` (`id_scout`),
  ADD KEY `tipoBrujula_idx` (`tipo`);

--
-- Indices de la tabla `canton`
--
ALTER TABLE `canton`
  ADD PRIMARY KEY (`id_canton`),
  ADD KEY `provincia_idx` (`id_provincia`);

--
-- Indices de la tabla `distrito`
--
ALTER TABLE `distrito`
  ADD PRIMARY KEY (`id_distrito`),
  ADD KEY `canton_idx` (`id_canton`);

--
-- Indices de la tabla `educacion`
--
ALTER TABLE `educacion`
  ADD PRIMARY KEY (`id_educacion`);

--
-- Indices de la tabla `encargado`
--
ALTER TABLE `encargado`
  ADD PRIMARY KEY (`id-encargado`),
  ADD KEY `cedula` (`cedula_persona`);

--
-- Indices de la tabla `encargado_x_scout`
--
ALTER TABLE `encargado_x_scout`
  ADD PRIMARY KEY (`id_encargado`,`id_scout`),
  ADD KEY `scouts_idx` (`id_scout`);

--
-- Indices de la tabla `enfermedad`
--
ALTER TABLE `enfermedad`
  ADD PRIMARY KEY (`id_enfermedad`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`);

--
-- Indices de la tabla `enfermedad_x_fomulario`
--
ALTER TABLE `enfermedad_x_fomulario`
  ADD PRIMARY KEY (`id_enfermedad`,`id_formulario`),
  ADD KEY `formulario_idx` (`id_formulario`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`id_especialidad`,`cedula`,`tipo`),
  ADD KEY `scoutEspecialidad_idx` (`cedula`),
  ADD KEY `tipo_idx` (`tipo`),
  ADD KEY `id_reto` (`reto`);

--
-- Indices de la tabla `formulario_medico`
--
ALTER TABLE `formulario_medico`
  ADD PRIMARY KEY (`id_formulario`),
  ADD KEY `cedula_form` (`cedula`);

--
-- Indices de la tabla `medicamento`
--
ALTER TABLE `medicamento`
  ADD PRIMARY KEY (`id_medicamento`);

--
-- Indices de la tabla `medicamento_x_formulario`
--
ALTER TABLE `medicamento_x_formulario`
  ADD PRIMARY KEY (`id_medicamento`,`id_formulario`),
  ADD KEY `formularioSalud_idx` (`id_formulario`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`cedula`),
  ADD UNIQUE KEY `cedula_UNIQUE` (`cedula`),
  ADD KEY `educacion` (`nivel_educacion`);

--
-- Indices de la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`id_provincia`),
  ADD UNIQUE KEY `numero_UNIQUE` (`numero`);

--
-- Indices de la tabla `reto_bitacora`
--
ALTER TABLE `reto_bitacora`
  ADD PRIMARY KEY (`id_reto`);

--
-- Indices de la tabla `reto_especialidad`
--
ALTER TABLE `reto_especialidad`
  ADD PRIMARY KEY (`id_reto`,`id_tipo`);

--
-- Indices de la tabla `reto_x_area`
--
ALTER TABLE `reto_x_area`
  ADD PRIMARY KEY (`id_reto`,`id_area`,`id_bitacora`),
  ADD KEY `areaBitacora_idx` (`id_area`),
  ADD KEY `retoAreaBitacora_idx` (`id_bitacora`);

--
-- Indices de la tabla `reto_x_tipo`
--
ALTER TABLE `reto_x_tipo`
  ADD PRIMARY KEY (`id_reto`,`id_tipo`,`id_especialidad`),
  ADD KEY `tipoEspecialidad_idx` (`id_tipo`),
  ADD KEY `retoTipoEspecialidad_idx` (`id_especialidad`);

--
-- Indices de la tabla `salud`
--
ALTER TABLE `salud`
  ADD PRIMARY KEY (`id_salud`);

--
-- Indices de la tabla `salud_x_formulario`
--
ALTER TABLE `salud_x_formulario`
  ADD PRIMARY KEY (`id_salud`,`id_formulario`),
  ADD KEY `formularioSalud_idx` (`id_formulario`);

--
-- Indices de la tabla `tipo_bitacora`
--
ALTER TABLE `tipo_bitacora`
  ADD PRIMARY KEY (`id_tipo`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`);

--
-- Indices de la tabla `tipo_brujula`
--
ALTER TABLE `tipo_brujula`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indices de la tabla `tipo_especialidad`
--
ALTER TABLE `tipo_especialidad`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indices de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD PRIMARY KEY (`id_persona`,`id_provincia`,`id_canton`,`id_distrito`),
  ADD KEY `provinciaUbicacion_idx` (`id_provincia`),
  ADD KEY `cantonUbicacion_idx` (`id_canton`),
  ADD KEY `distritoUbicacion_idx` (`id_distrito`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `vacuna`
--
ALTER TABLE `vacuna`
  ADD PRIMARY KEY (`id_vacuna`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`);

--
-- Indices de la tabla `vacuna_x_formulario`
--
ALTER TABLE `vacuna_x_formulario`
  ADD PRIMARY KEY (`id_vacuna`,`id_formulario`),
  ADD KEY `formularioVacuna_idx` (`id_formulario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alergia`
--
ALTER TABLE `alergia`
  MODIFY `id_alergia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `area_bitacora`
--
ALTER TABLE `area_bitacora`
  MODIFY `id_area` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `area_brujula`
--
ALTER TABLE `area_brujula`
  MODIFY `id_area` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `id_bitacora_cedula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `brujula`
--
ALTER TABLE `brujula`
  MODIFY `id_brujula` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `canton`
--
ALTER TABLE `canton`
  MODIFY `id_canton` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT de la tabla `distrito`
--
ALTER TABLE `distrito`
  MODIFY `id_distrito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=471;

--
-- AUTO_INCREMENT de la tabla `educacion`
--
ALTER TABLE `educacion`
  MODIFY `id_educacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `encargado`
--
ALTER TABLE `encargado`
  MODIFY `id-encargado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `enfermedad`
--
ALTER TABLE `enfermedad`
  MODIFY `id_enfermedad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `id_especialidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `formulario_medico`
--
ALTER TABLE `formulario_medico`
  MODIFY `id_formulario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `medicamento`
--
ALTER TABLE `medicamento`
  MODIFY `id_medicamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `medicamento_x_formulario`
--
ALTER TABLE `medicamento_x_formulario`
  MODIFY `id_medicamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `provincia`
--
ALTER TABLE `provincia`
  MODIFY `id_provincia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `reto_bitacora`
--
ALTER TABLE `reto_bitacora`
  MODIFY `id_reto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `reto_especialidad`
--
ALTER TABLE `reto_especialidad`
  MODIFY `id_reto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT de la tabla `salud`
--
ALTER TABLE `salud`
  MODIFY `id_salud` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_bitacora`
--
ALTER TABLE `tipo_bitacora`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tipo_brujula`
--
ALTER TABLE `tipo_brujula`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipo_especialidad`
--
ALTER TABLE `tipo_especialidad`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `vacuna`
--
ALTER TABLE `vacuna`
  MODIFY `id_vacuna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alergia_x_formulario`
--
ALTER TABLE `alergia_x_formulario`
  ADD CONSTRAINT `alergia` FOREIGN KEY (`id_alergia`) REFERENCES `alergia` (`id_alergia`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `formularioAlergia` FOREIGN KEY (`id_formulario`) REFERENCES `formulario_medico` (`id_formulario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `area_x_brujula`
--
ALTER TABLE `area_x_brujula`
  ADD CONSTRAINT `areaBrujula` FOREIGN KEY (`id_area`) REFERENCES `area_brujula` (`id_area`),
  ADD CONSTRAINT `cedula_brujula` FOREIGN KEY (`cedula`) REFERENCES `persona` (`cedula`);

--
-- Filtros para la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD CONSTRAINT `area_bitacora` FOREIGN KEY (`area_bitacora`) REFERENCES `area_bitacora` (`id_area`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cedula_bitacora` FOREIGN KEY (`cedula`) REFERENCES `persona` (`cedula`),
  ADD CONSTRAINT `tipo_bitacora` FOREIGN KEY (`id_bitacora`) REFERENCES `tipo_bitacora` (`id_tipo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `brujula`
--
ALTER TABLE `brujula`
  ADD CONSTRAINT `scoutBrujula` FOREIGN KEY (`id_scout`) REFERENCES `persona` (`cedula`),
  ADD CONSTRAINT `tipoBrujula` FOREIGN KEY (`tipo`) REFERENCES `tipo_brujula` (`id_tipo`);

--
-- Filtros para la tabla `canton`
--
ALTER TABLE `canton`
  ADD CONSTRAINT `provincia` FOREIGN KEY (`id_provincia`) REFERENCES `provincia` (`id_provincia`);

--
-- Filtros para la tabla `distrito`
--
ALTER TABLE `distrito`
  ADD CONSTRAINT `canton` FOREIGN KEY (`id_canton`) REFERENCES `canton` (`id_canton`);

--
-- Filtros para la tabla `encargado`
--
ALTER TABLE `encargado`
  ADD CONSTRAINT `cedula` FOREIGN KEY (`cedula_persona`) REFERENCES `persona` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `encargado_x_scout`
--
ALTER TABLE `encargado_x_scout`
  ADD CONSTRAINT `encargados` FOREIGN KEY (`id_encargado`) REFERENCES `encargado` (`id-encargado`),
  ADD CONSTRAINT `scouts` FOREIGN KEY (`id_scout`) REFERENCES `persona` (`cedula`);

--
-- Filtros para la tabla `enfermedad_x_fomulario`
--
ALTER TABLE `enfermedad_x_fomulario`
  ADD CONSTRAINT `enfermedad` FOREIGN KEY (`id_enfermedad`) REFERENCES `enfermedad` (`id_enfermedad`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `formularioEnfermedad` FOREIGN KEY (`id_formulario`) REFERENCES `formulario_medico` (`id_formulario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD CONSTRAINT `cedula_especialidad` FOREIGN KEY (`cedula`) REFERENCES `persona` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_reto` FOREIGN KEY (`reto`) REFERENCES `reto_especialidad` (`id_reto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tipo` FOREIGN KEY (`tipo`) REFERENCES `tipo_especialidad` (`id_tipo`);

--
-- Filtros para la tabla `formulario_medico`
--
ALTER TABLE `formulario_medico`
  ADD CONSTRAINT `cedula_form` FOREIGN KEY (`cedula`) REFERENCES `persona` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `medicamento_x_formulario`
--
ALTER TABLE `medicamento_x_formulario`
  ADD CONSTRAINT `formularioMedicamento` FOREIGN KEY (`id_formulario`) REFERENCES `formulario_medico` (`id_formulario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `medicamento` FOREIGN KEY (`id_medicamento`) REFERENCES `medicamento` (`id_medicamento`);

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `educacion` FOREIGN KEY (`nivel_educacion`) REFERENCES `educacion` (`id_educacion`);

--
-- Filtros para la tabla `reto_x_area`
--
ALTER TABLE `reto_x_area`
  ADD CONSTRAINT `area` FOREIGN KEY (`id_area`) REFERENCES `area_bitacora` (`id_area`),
  ADD CONSTRAINT `retoArea` FOREIGN KEY (`id_reto`) REFERENCES `reto_bitacora` (`id_reto`);

--
-- Filtros para la tabla `reto_x_tipo`
--
ALTER TABLE `reto_x_tipo`
  ADD CONSTRAINT `retoEspecialidad` FOREIGN KEY (`id_reto`) REFERENCES `reto_especialidad` (`id_reto`),
  ADD CONSTRAINT `retoTipoEspecialidad` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidad` (`id_especialidad`),
  ADD CONSTRAINT `tipoEspecialidad` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_especialidad` (`id_tipo`);

--
-- Filtros para la tabla `salud_x_formulario`
--
ALTER TABLE `salud_x_formulario`
  ADD CONSTRAINT `formularioSalud` FOREIGN KEY (`id_formulario`) REFERENCES `formulario_medico` (`id_formulario`),
  ADD CONSTRAINT `salud` FOREIGN KEY (`id_salud`) REFERENCES `salud` (`id_salud`);

--
-- Filtros para la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD CONSTRAINT `cantonUbicacion` FOREIGN KEY (`id_canton`) REFERENCES `canton` (`id_canton`),
  ADD CONSTRAINT `distritoUbicacion` FOREIGN KEY (`id_distrito`) REFERENCES `distrito` (`id_distrito`),
  ADD CONSTRAINT `personaUbicacion` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`cedula`),
  ADD CONSTRAINT `provinciaUbicacion` FOREIGN KEY (`id_provincia`) REFERENCES `provincia` (`id_provincia`);

--
-- Filtros para la tabla `vacuna_x_formulario`
--
ALTER TABLE `vacuna_x_formulario`
  ADD CONSTRAINT `formularioVacuna` FOREIGN KEY (`id_formulario`) REFERENCES `formulario_medico` (`id_formulario`),
  ADD CONSTRAINT `vacuna` FOREIGN KEY (`id_vacuna`) REFERENCES `vacuna` (`id_vacuna`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
