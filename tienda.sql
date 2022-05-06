-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 06-05-2022 a las 21:04:37
-- Versión del servidor: 10.6.3-MariaDB-log
-- Versión de PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `baners`
--

CREATE TABLE `baners` (
  `id` int(11) NOT NULL,
  `titulo` varchar(75) NOT NULL,
  `posicion` int(2) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `baners`
--

INSERT INTO `baners` (`id`, `titulo`, `posicion`, `estado`) VALUES
(1, 'baner principal', 1, 1),
(3, 'baner secundario', 2, 1),
(4, 'baner basicos', 3, 1),
(5, 'Lo nuevo', 4, 1),
(6, 'nuestras marcas', 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `canals`
--

CREATE TABLE `canals` (
  `id` int(3) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `canals`
--

INSERT INTO `canals` (`id`, `nombre`, `descripcion`, `estado`) VALUES
(1, 'TIENDA FISICA', 'COMERCIO REALIZADO EN LA MISMA TIENDA INDICADA', 1),
(2, 'CALL CENTER', 'REALIZADO POR MEDIO TELEFONICO', 1),
(3, 'PAGINA WEB', 'TRANSACCION REALIZADA EN LA PAGINA WEB', 1),
(5, 'REPARTO', 'REPARTO A DOMICILIO', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  `orden` int(2) DEFAULT NULL,
  `categorias_id` int(11) DEFAULT NULL,
  `slug` varchar(60) NOT NULL,
  `padre` varchar(1) DEFAULT NULL,
  `imagen` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `descripcion`, `estado`, `orden`, `categorias_id`, `slug`, `padre`, `imagen`) VALUES
(1, 'Mujer', 'Categoria principal de la web', 1, 1, NULL, 'mujer', 'S', 'public/cabeceras/mujer_desktop.png'),
(2, 'Hombre', 'Categoria principal de la web', 1, 2, NULL, 'hombre', 'S', 'public/cabeceras/hombre_desktop.png'),
(3, 'Básicos', 'categoria principal', 1, 3, NULL, 'basicos', 'S', 'public/cabeceras/basicos_desktop.png'),
(4, 'Niños', 'categoria principal de la web', 1, 4, NULL, 'ninos', 'S', 'public/cabeceras/kids_desktop.png'),
(5, 'Marcas', 'categoria principal de la web', 1, 5, NULL, 'marcas', 'S', NULL),
(6, 'Lo nuevo', 'categoria principal de la web', 1, 6, NULL, 'lo-nuevo', 'S', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `nombre` varchar(70) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  `rgb` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `colors`
--

INSERT INTO `colors` (`id`, `nombre`, `descripcion`, `estado`, `rgb`) VALUES
(1, 'AMARILLO', NULL, 1, '#FFFF01'),
(2, 'Blanco', NULL, 1, '#FFFFFF'),
(3, 'Rojo', NULL, 1, '#CC0000'),
(4, 'Negro', NULL, 1, '#000000'),
(5, 'Azul', NULL, 1, '#000066'),
(6, 'Marrón', NULL, 1, '#994c00'),
(7, 'Morado', NULL, 1, '#660066'),
(8, 'Verde', NULL, 1, '#006600'),
(9, 'Celeste', NULL, 1, '#0066CC'),
(10, 'Guinda', NULL, 1, '#952F57'),
(11, 'Rosado', NULL, 1, '#FF0368'),
(12, 'Beige', NULL, 1, '#E8C39E'),
(13, 'Gris', NULL, 1, '#808080'),
(14, 'Melón', NULL, 1, '#FBCA7F'),
(15, 'Mostaza', NULL, 1, '#FFDB58'),
(16, 'Turquesa', NULL, 1, '#5DC1B9'),
(17, 'Crema', NULL, 1, '#ffffbf'),
(18, 'Coral', NULL, 1, '#E4717A'),
(19, 'Azul Claro', NULL, 1, '#ADD8E6'),
(20, 'Naranja', NULL, 1, '#FF8000'),
(21, 'Coco', NULL, 1, '#965A3E'),
(22, 'Ladrillo', NULL, 1, '#a85958'),
(23, 'Camel', NULL, 1, '#724625'),
(24, 'Plomo', NULL, 1, '#9b9b9b'),
(25, 'Azul Oscuro', NULL, 1, '#252850'),
(26, 'Vino', NULL, 1, '#56070C'),
(27, 'Fucsia', NULL, 1, '#FF0080'),
(28, 'Lila', NULL, 1, '#FF0080'),
(29, 'Palo rosa', NULL, 1, '#DD969C'),
(30, 'Verde Oscuro', NULL, 1, '#2d572c');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conceptos`
--

CREATE TABLE `conceptos` (
  `id` int(3) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `tipo` varchar(1) NOT NULL COMMENT 'Q = queja\nR = reclamo',
  `descripcion` text DEFAULT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `conceptos`
--

INSERT INTO `conceptos` (`id`, `nombre`, `tipo`, `descripcion`, `estado`) VALUES
(1, 'OTROS', 'Q', 'QUEJA EN GENERAL', 1),
(2, 'OTROS', 'R', 'RECLAMOS OTROS', 1),
(3, 'PRODUCTO ERRADO Y/O CARACTERISTICAS DISTINTAS', 'R', 'PRODUCTO NO COINCIDE CON LO OFRECIDO', 1),
(4, 'PEDIDO NO ENTREGADO O CON RETRASO', 'R', 'CUANDO EL PEDIDO POR X RAZONES NO LLEGO HACER ENTREGADO AL CLIENTE', 1),
(5, 'ERROR DE PRECIO', 'R', 'ERROR EN EL PRECIO POR EQUIS MOTIVOS', 1),
(6, 'PRODUCTO CON DAÑO FISICO', 'R', 'PRODUCTO CON AVERIA POR AVERIGUAR', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `id` int(2) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `ubigeo` varchar(2) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`id`, `nombre`, `ubigeo`, `estado`) VALUES
(1, 'AMAZONAS', '01', 1),
(2, 'ANCASH', '02', 1),
(3, 'APURIMAC', '03', 1),
(4, 'AREQUIPA', '04', 1),
(5, 'AYACUCHO', '05', 1),
(6, 'CAJAMARCA', '06', 1),
(7, 'CALLAO', '07', 1),
(8, 'CUSCO', '08', 1),
(9, 'HUANCAVELICA', '09', 1),
(10, 'HUANUCO', '10', 1),
(11, 'ICA', '11', 1),
(12, 'JUNIN', '12', 1),
(13, 'LA LIBERTAD', '13', 1),
(14, 'LAMBAYEQUE', '14', 1),
(15, 'LIMA', '15', 1),
(16, 'LORETO', '16', 1),
(17, 'MADRE DE DIOS', '17', 1),
(18, 'MOQUEGUA', '18', 1),
(19, 'PASCO', '19', 1),
(20, 'PIURA', '20', 1),
(21, 'PUNO', '21', 1),
(22, 'SAN MARTIN', '22', 1),
(23, 'TACNA', '23', 1),
(24, 'TUMBES', '24', 1),
(25, 'UCAYALI', '25', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deseos`
--

CREATE TABLE `deseos` (
  `users_id` bigint(20) DEFAULT NULL,
  `productos_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallebaners`
--

CREATE TABLE `detallebaners` (
  `id` int(11) NOT NULL,
  `img` text NOT NULL,
  `url` text NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `baners_id` int(11) NOT NULL,
  `ancho` varchar(45) NOT NULL,
  `alto` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `detallebaners`
--

INSERT INTO `detallebaners` (`id`, `img`, `url`, `estado`, `baners_id`, `ancho`, `alto`) VALUES
(9, 'public/baners/150322_box1.png', 'https://tienda.sysapp.dev/#', 1, 1, '250', '332'),
(10, 'public/baners/150322_box2.png', 'https://tienda.sysapp.dev/#', 1, 1, '250', '332'),
(11, 'public/baners/150322_box3.png', 'https://tienda.sysapp.dev/#', 1, 1, '250', '332'),
(12, 'public/baners/150322_box4.png', 'https://tienda.sysapp.dev/#', 1, 1, '250', '332'),
(13, 'public/baners/150322_box5.png', 'https://tienda.sysapp.dev/#', 1, 1, '250', '332'),
(14, 'public/baners/dep_mujer.png', 'https://tienda.sysapp.dev/#', 1, 3, '332', '92'),
(15, 'public/baners/dep_hombre.png', 'https://tienda.sysapp.dev/#', 1, 3, '332', '92'),
(16, 'public/baners/dep_basicos.png', 'https://tienda.sysapp.dev/#', 1, 3, '332', '92'),
(17, 'public/baners/dep_kids.png', 'https://tienda.sysapp.dev/#', 1, 3, '332', '92'),
(18, 'public/baners/280222_basicos1.png', 'https://tienda.sysapp.dev/#', 1, 4, '662', '432'),
(19, 'public/baners/280222_basicos1a.png', 'https://tienda.sysapp.dev/#', 1, 4, '325', '432'),
(20, 'public/baners/280222_basicos1b.png', 'https://tienda.sysapp.dev/#', 1, 4, '325', '432'),
(21, 'public/baners/280222_lanzamiento1.png', 'https://tienda.sysapp.dev/#', 1, 5, '662', '432'),
(22, 'public/baners/280222_lanzamiento1b.png', 'https://tienda.sysapp.dev/#', 1, 5, '325', '432'),
(23, 'public/baners/280222_lanzamiento1a.png', 'https://tienda.sysapp.dev/#', 1, 5, '325', '432'),
(24, 'public/baners/xiomi.png', 'https://www.topitop.pe/arquivos/tpth.png?v=637721766805430000', 1, 6, '205', '250'),
(25, 'public/baners/hawk.png', 'https://tiendas.sysapp.dev/#', 1, 6, '205', '250'),
(26, 'public/baners/nyaw.png', 'https://tiendas.sysapp.dev/#', 1, 6, '205', '250'),
(27, 'public/baners/nyam.png', 'https://tiendas.sysapp.dev/#', 1, 6, '205', '250'),
(28, 'public/baners/tptm.png', 'https://tiendas.sysapp.dev/#', 1, 6, '205', '250'),
(29, 'public/baners/tpth.png', 'https://tiendas.sysapp.dev/#', 1, 6, '205', '250');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distritos`
--

CREATE TABLE `distritos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `ubigeo` varchar(2) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `provincias_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `distritos`
--

INSERT INTO `distritos` (`id`, `nombre`, `ubigeo`, `estado`, `provincias_id`) VALUES
(1, 'CHACHAPOYAS', '01', 1, 1),
(2, 'ASUNCIÓN', '02', 1, 1),
(3, 'BALSAS', '03', 1, 1),
(4, 'CHETO', '04', 1, 1),
(5, 'CHILIQUIN', '05', 1, 1),
(6, 'CHUQUIBAMBA', '06', 1, 1),
(7, 'GRANADA', '07', 1, 1),
(8, 'HUANCAS', '08', 1, 1),
(9, 'LA JALCA', '09', 1, 1),
(10, 'LEIMEBAMBA', '10', 1, 1),
(11, 'LEVANTO', '11', 1, 1),
(12, 'MAGDALENA', '12', 1, 1),
(13, 'MARISCAL CASTILLA', '13', 1, 1),
(14, 'MOLINOPAMPA', '14', 1, 1),
(15, 'MONTEVIDEO', '15', 1, 1),
(16, 'OLLEROS', '16', 1, 1),
(17, 'QUINJALCA', '17', 1, 1),
(18, 'SAN FRANCISCO DE DAGUAS', '18', 1, 1),
(19, 'SAN ISIDRO DE MAINO', '19', 1, 1),
(20, 'SOLOCO', '20', 1, 1),
(21, 'SONCHE', '21', 1, 1),
(22, 'BAGUA', '01', 1, 2),
(23, 'ARAMANGO', '02', 1, 2),
(24, 'COPALLIN', '03', 1, 2),
(25, 'EL PARCO', '04', 1, 2),
(26, 'IMAZA', '05', 1, 2),
(27, 'LA PECA', '06', 1, 2),
(28, 'JUMBILLA', '01', 1, 3),
(29, 'CHISQUILLA', '02', 1, 3),
(30, 'CHURUJA', '03', 1, 3),
(31, 'COROSHA', '04', 1, 3),
(32, 'CUISPES', '05', 1, 3),
(33, 'FLORIDA', '06', 1, 3),
(34, 'JAZAN', '07', 1, 3),
(35, 'RECTA', '08', 1, 3),
(36, 'SAN CARLOS', '09', 1, 3),
(37, 'SHIPASBAMBA', '10', 1, 3),
(38, 'VALERA', '11', 1, 3),
(39, 'YAMBRASBAMBA', '12', 1, 3),
(40, 'NIEVA', '01', 1, 4),
(41, 'EL CENEPA', '02', 1, 4),
(42, 'RÍO SANTIAGO', '03', 1, 4),
(43, 'LAMUD', '01', 1, 5),
(44, 'CAMPORREDONDO', '02', 1, 5),
(45, 'COCABAMBA', '03', 1, 5),
(46, 'COLCAMAR', '04', 1, 5),
(47, 'CONILA', '05', 1, 5),
(48, 'INGUILPATA', '06', 1, 5),
(49, 'LONGUITA', '07', 1, 5),
(50, 'LONYA CHICO', '08', 1, 5),
(51, 'LUYA', '09', 1, 5),
(52, 'LUYA VIEJO', '10', 1, 5),
(53, 'MARÍA', '11', 1, 5),
(54, 'OCALLI', '12', 1, 5),
(55, 'OCUMAL', '13', 1, 5),
(56, 'PISUQUIA', '14', 1, 5),
(57, 'PROVIDENCIA', '15', 1, 5),
(58, 'SAN CRISTÓBAL', '16', 1, 5),
(59, 'SAN FRANCISCO DE YESO', '17', 1, 5),
(60, 'SAN JERÓNIMO', '18', 1, 5),
(61, 'SAN JUAN DE LOPECANCHA', '19', 1, 5),
(62, 'SANTA CATALINA', '20', 1, 5),
(63, 'SANTO TOMAS', '21', 1, 5),
(64, 'TINGO', '22', 1, 5),
(65, 'TRITA', '23', 1, 5),
(66, 'SAN NICOLÁS', '01', 1, 6),
(67, 'CHIRIMOTO', '02', 1, 6),
(68, 'COCHAMAL', '03', 1, 6),
(69, 'HUAMBO', '04', 1, 6),
(70, 'LIMABAMBA', '05', 1, 6),
(71, 'LONGAR', '06', 1, 6),
(72, 'MARISCAL BENAVIDES', '07', 1, 6),
(73, 'MILPUC', '08', 1, 6),
(74, 'OMIA', '09', 1, 6),
(75, 'SANTA ROSA', '10', 1, 6),
(76, 'TOTORA', '11', 1, 6),
(77, 'VISTA ALEGRE', '12', 1, 6),
(78, 'BAGUA GRANDE', '01', 1, 7),
(79, 'CAJARURO', '02', 1, 7),
(80, 'CUMBA', '03', 1, 7),
(81, 'EL MILAGRO', '04', 1, 7),
(82, 'JAMALCA', '05', 1, 7),
(83, 'LONYA GRANDE', '06', 1, 7),
(84, 'YAMON', '07', 1, 7),
(85, 'HUARAZ', '01', 1, 8),
(86, 'COCHABAMBA', '02', 1, 8),
(87, 'COLCABAMBA', '03', 1, 8),
(88, 'HUANCHAY', '04', 1, 8),
(89, 'INDEPENDENCIA', '05', 1, 8),
(90, 'JANGAS', '06', 1, 8),
(91, 'LA LIBERTAD', '07', 1, 8),
(92, 'OLLEROS', '08', 1, 8),
(93, 'PAMPAS GRANDE', '09', 1, 8),
(94, 'PARIACOTO', '10', 1, 8),
(95, 'PIRA', '11', 1, 8),
(96, 'TARICA', '12', 1, 8),
(97, 'AIJA', '01', 1, 9),
(98, 'CORIS', '02', 1, 9),
(99, 'HUACLLAN', '03', 1, 9),
(100, 'LA MERCED', '04', 1, 9),
(101, 'SUCCHA', '05', 1, 9),
(102, 'LLAMELLIN', '01', 1, 10),
(103, 'ACZO', '02', 1, 10),
(104, 'CHACCHO', '03', 1, 10),
(105, 'CHINGAS', '04', 1, 10),
(106, 'MIRGAS', '05', 1, 10),
(107, 'SAN JUAN DE RONTOY', '06', 1, 10),
(108, 'CHACAS', '01', 1, 11),
(109, 'ACOCHACA', '02', 1, 11),
(110, 'CHIQUIAN', '01', 1, 12),
(111, 'ABELARDO PARDO LEZAMETA', '02', 1, 12),
(112, 'ANTONIO RAYMONDI', '03', 1, 12),
(113, 'AQUIA', '04', 1, 12),
(114, 'CAJACAY', '05', 1, 12),
(115, 'CANIS', '06', 1, 12),
(116, 'COLQUIOC', '07', 1, 12),
(117, 'HUALLANCA', '08', 1, 12),
(118, 'HUASTA', '09', 1, 12),
(119, 'HUAYLLACAYAN', '10', 1, 12),
(120, 'LA PRIMAVERA', '11', 1, 12),
(121, 'MANGAS', '12', 1, 12),
(122, 'PACLLON', '13', 1, 12),
(123, 'SAN MIGUEL DE CORPANQUI', '14', 1, 12),
(124, 'TICLLOS', '15', 1, 12),
(125, 'CARHUAZ', '01', 1, 13),
(126, 'ACOPAMPA', '02', 1, 13),
(127, 'AMASHCA', '03', 1, 13),
(128, 'ANTA', '04', 1, 13),
(129, 'ATAQUERO', '05', 1, 13),
(130, 'MARCARA', '06', 1, 13),
(131, 'PARIAHUANCA', '07', 1, 13),
(132, 'SAN MIGUEL DE ACO', '08', 1, 13),
(133, 'SHILLA', '09', 1, 13),
(134, 'TINCO', '10', 1, 13),
(135, 'YUNGAR', '11', 1, 13),
(136, 'SAN LUIS', '01', 1, 14),
(137, 'SAN NICOLÁS', '02', 1, 14),
(138, 'YAUYA', '03', 1, 14),
(139, 'CASMA', '01', 1, 15),
(140, 'BUENA VISTA ALTA', '02', 1, 15),
(141, 'COMANDANTE NOEL', '03', 1, 15),
(142, 'YAUTAN', '04', 1, 15),
(143, 'CORONGO', '01', 1, 16),
(144, 'ACO', '02', 1, 16),
(145, 'BAMBAS', '03', 1, 16),
(146, 'CUSCA', '04', 1, 16),
(147, 'LA PAMPA', '05', 1, 16),
(148, 'YANAC', '06', 1, 16),
(149, 'YUPAN', '07', 1, 16),
(150, 'HUARI', '01', 1, 17),
(151, 'ANRA', '02', 1, 17),
(152, 'CAJAY', '03', 1, 17),
(153, 'CHAVIN DE HUANTAR', '04', 1, 17),
(154, 'HUACACHI', '05', 1, 17),
(155, 'HUACCHIS', '06', 1, 17),
(156, 'HUACHIS', '07', 1, 17),
(157, 'HUANTAR', '08', 1, 17),
(158, 'MASIN', '09', 1, 17),
(159, 'PAUCAS', '10', 1, 17),
(160, 'PONTO', '11', 1, 17),
(161, 'RAHUAPAMPA', '12', 1, 17),
(162, 'RAPAYAN', '13', 1, 17),
(163, 'SAN MARCOS', '14', 1, 17),
(164, 'SAN PEDRO DE CHANA', '15', 1, 17),
(165, 'UCO', '16', 1, 17),
(166, 'HUARMEY', '01', 1, 18),
(167, 'COCHAPETI', '02', 1, 18),
(168, 'CULEBRAS', '03', 1, 18),
(169, 'HUAYAN', '04', 1, 18),
(170, 'MALVAS', '05', 1, 18),
(171, 'CARAZ', '01', 1, 19),
(172, 'HUALLANCA', '02', 1, 19),
(173, 'HUATA', '03', 1, 19),
(174, 'HUAYLAS', '04', 1, 19),
(175, 'MATO', '05', 1, 19),
(176, 'PAMPAROMAS', '06', 1, 19),
(177, 'PUEBLO LIBRE', '07', 1, 19),
(178, 'SANTA CRUZ', '08', 1, 19),
(179, 'SANTO TORIBIO', '09', 1, 19),
(180, 'YURACMARCA', '10', 1, 19),
(181, 'PISCOBAMBA', '01', 1, 20),
(182, 'CASCA', '02', 1, 20),
(183, 'ELEAZAR GUZMÁN BARRON', '03', 1, 20),
(184, 'FIDEL OLIVAS ESCUDERO', '04', 1, 20),
(185, 'LLAMA', '05', 1, 20),
(186, 'LLUMPA', '06', 1, 20),
(187, 'LUCMA', '07', 1, 20),
(188, 'MUSGA', '08', 1, 20),
(189, 'OCROS', '01', 1, 21),
(190, 'ACAS', '02', 1, 21),
(191, 'CAJAMARQUILLA', '03', 1, 21),
(192, 'CARHUAPAMPA', '04', 1, 21),
(193, 'COCHAS', '05', 1, 21),
(194, 'CONGAS', '06', 1, 21),
(195, 'LLIPA', '07', 1, 21),
(196, 'SAN CRISTÓBAL DE RAJAN', '08', 1, 21),
(197, 'SAN PEDRO', '09', 1, 21),
(198, 'SANTIAGO DE CHILCAS', '10', 1, 21),
(199, 'CABANA', '01', 1, 22),
(200, 'BOLOGNESI', '02', 1, 22),
(201, 'CONCHUCOS', '03', 1, 22),
(202, 'HUACASCHUQUE', '04', 1, 22),
(203, 'HUANDOVAL', '05', 1, 22),
(204, 'LACABAMBA', '06', 1, 22),
(205, 'LLAPO', '07', 1, 22),
(206, 'PALLASCA', '08', 1, 22),
(207, 'PAMPAS', '09', 1, 22),
(208, 'SANTA ROSA', '10', 1, 22),
(209, 'TAUCA', '11', 1, 22),
(210, 'POMABAMBA', '01', 1, 23),
(211, 'HUAYLLAN', '02', 1, 23),
(212, 'PAROBAMBA', '03', 1, 23),
(213, 'QUINUABAMBA', '04', 1, 23),
(214, 'RECUAY', '01', 1, 24),
(215, 'CATAC', '02', 1, 24),
(216, 'COTAPARACO', '03', 1, 24),
(217, 'HUAYLLAPAMPA', '04', 1, 24),
(218, 'LLACLLIN', '05', 1, 24),
(219, 'MARCA', '06', 1, 24),
(220, 'PAMPAS CHICO', '07', 1, 24),
(221, 'PARARIN', '08', 1, 24),
(222, 'TAPACOCHA', '09', 1, 24),
(223, 'TICAPAMPA', '10', 1, 24),
(224, 'CHIMBOTE', '01', 1, 25),
(225, 'CÁCERES DEL PERÚ', '02', 1, 25),
(226, 'COISHCO', '03', 1, 25),
(227, 'MACATE', '04', 1, 25),
(228, 'MORO', '05', 1, 25),
(229, 'NEPEÑA', '06', 1, 25),
(230, 'SAMANCO', '07', 1, 25),
(231, 'SANTA', '08', 1, 25),
(232, 'NUEVO CHIMBOTE', '09', 1, 25),
(233, 'SIHUAS', '01', 1, 26),
(234, 'ACOBAMBA', '02', 1, 26),
(235, 'ALFONSO UGARTE', '03', 1, 26),
(236, 'CASHAPAMPA', '04', 1, 26),
(237, 'CHINGALPO', '05', 1, 26),
(238, 'HUAYLLABAMBA', '06', 1, 26),
(239, 'QUICHES', '07', 1, 26),
(240, 'RAGASH', '08', 1, 26),
(241, 'SAN JUAN', '09', 1, 26),
(242, 'SICSIBAMBA', '10', 1, 26),
(243, 'YUNGAY', '01', 1, 27),
(244, 'CASCAPARA', '02', 1, 27),
(245, 'MANCOS', '03', 1, 27),
(246, 'MATACOTO', '04', 1, 27),
(247, 'QUILLO', '05', 1, 27),
(248, 'RANRAHIRCA', '06', 1, 27),
(249, 'SHUPLUY', '07', 1, 27),
(250, 'YANAMA', '08', 1, 27),
(251, 'ABANCAY', '01', 1, 28),
(252, 'CHACOCHE', '02', 1, 28),
(253, 'CIRCA', '03', 1, 28),
(254, 'CURAHUASI', '04', 1, 28),
(255, 'HUANIPACA', '05', 1, 28),
(256, 'LAMBRAMA', '06', 1, 28),
(257, 'PICHIRHUA', '07', 1, 28),
(258, 'SAN PEDRO DE CACHORA', '08', 1, 28),
(259, 'TAMBURCO', '09', 1, 28),
(260, 'ANDAHUAYLAS', '01', 1, 29),
(261, 'ANDARAPA', '02', 1, 29),
(262, 'CHIARA', '03', 1, 29),
(263, 'HUANCARAMA', '04', 1, 29),
(264, 'HUANCARAY', '05', 1, 29),
(265, 'HUAYANA', '06', 1, 29),
(266, 'KISHUARA', '07', 1, 29),
(267, 'PACOBAMBA', '08', 1, 29),
(268, 'PACUCHA', '09', 1, 29),
(269, 'PAMPACHIRI', '10', 1, 29),
(270, 'POMACOCHA', '11', 1, 29),
(271, 'SAN ANTONIO DE CACHI', '12', 1, 29),
(272, 'SAN JERÓNIMO', '13', 1, 29),
(273, 'SAN MIGUEL DE CHACCRAMPA', '14', 1, 29),
(274, 'SANTA MARÍA DE CHICMO', '15', 1, 29),
(275, 'TALAVERA', '16', 1, 29),
(276, 'TUMAY HUARACA', '17', 1, 29),
(277, 'TURPO', '18', 1, 29),
(278, 'KAQUIABAMBA', '19', 1, 29),
(279, 'JOSÉ MARÍA ARGUEDAS', '20', 1, 29),
(280, 'ANTABAMBA', '01', 1, 30),
(281, 'EL ORO', '02', 1, 30),
(282, 'HUAQUIRCA', '03', 1, 30),
(283, 'JUAN ESPINOZA MEDRANO', '04', 1, 30),
(284, 'OROPESA', '05', 1, 30),
(285, 'PACHACONAS', '06', 1, 30),
(286, 'SABAINO', '07', 1, 30),
(287, 'CHALHUANCA', '01', 1, 31),
(288, 'CAPAYA', '02', 1, 31),
(289, 'CARAYBAMBA', '03', 1, 31),
(290, 'CHAPIMARCA', '04', 1, 31),
(291, 'COLCABAMBA', '05', 1, 31),
(292, 'COTARUSE', '06', 1, 31),
(293, 'HUAYLLO', '07', 1, 31),
(294, 'JUSTO APU SAHUARAURA', '08', 1, 31),
(295, 'LUCRE', '09', 1, 31),
(296, 'POCOHUANCA', '10', 1, 31),
(297, 'SAN JUAN DE CHACÑA', '11', 1, 31),
(298, 'SAÑAYCA', '12', 1, 31),
(299, 'SORAYA', '13', 1, 31),
(300, 'TAPAIRIHUA', '14', 1, 31),
(301, 'TINTAY', '15', 1, 31),
(302, 'TORAYA', '16', 1, 31),
(303, 'YANACA', '17', 1, 31),
(304, 'TAMBOBAMBA', '01', 1, 32),
(305, 'COTABAMBAS', '02', 1, 32),
(306, 'COYLLURQUI', '03', 1, 32),
(307, 'HAQUIRA', '04', 1, 32),
(308, 'MARA', '05', 1, 32),
(309, 'CHALLHUAHUACHO', '06', 1, 32),
(310, 'CHINCHEROS', '01', 1, 33),
(311, 'ANCO_HUALLO', '02', 1, 33),
(312, 'COCHARCAS', '03', 1, 33),
(313, 'HUACCANA', '04', 1, 33),
(314, 'OCOBAMBA', '05', 1, 33),
(315, 'ONGOY', '06', 1, 33),
(316, 'URANMARCA', '07', 1, 33),
(317, 'RANRACANCHA', '08', 1, 33),
(318, 'CHUQUIBAMBILLA', '01', 1, 34),
(319, 'CURPAHUASI', '02', 1, 34),
(320, 'GAMARRA', '03', 1, 34),
(321, 'HUAYLLATI', '04', 1, 34),
(322, 'MAMARA', '05', 1, 34),
(323, 'MICAELA BASTIDAS', '06', 1, 34),
(324, 'PATAYPAMPA', '07', 1, 34),
(325, 'PROGRESO', '08', 1, 34),
(326, 'SAN ANTONIO', '09', 1, 34),
(327, 'SANTA ROSA', '10', 1, 34),
(328, 'TURPAY', '11', 1, 34),
(329, 'VILCABAMBA', '12', 1, 34),
(330, 'VIRUNDO', '13', 1, 34),
(331, 'CURASCO', '14', 1, 34),
(332, 'AREQUIPA', '01', 1, 35),
(333, 'ALTO SELVA ALEGRE', '02', 1, 35),
(334, 'CAYMA', '03', 1, 35),
(335, 'CERRO COLORADO', '04', 1, 35),
(336, 'CHARACATO', '05', 1, 35),
(337, 'CHIGUATA', '06', 1, 35),
(338, 'JACOBO HUNTER', '07', 1, 35),
(339, 'LA JOYA', '08', 1, 35),
(340, 'MARIANO MELGAR', '09', 1, 35),
(341, 'MIRAFLORES', '10', 1, 35),
(342, 'MOLLEBAYA', '11', 1, 35),
(343, 'PAUCARPATA', '12', 1, 35),
(344, 'POCSI', '13', 1, 35),
(345, 'POLOBAYA', '14', 1, 35),
(346, 'QUEQUEÑA', '15', 1, 35),
(347, 'SABANDIA', '16', 1, 35),
(348, 'SACHACA', '17', 1, 35),
(349, 'SAN JUAN DE SIGUAS', '18', 1, 35),
(350, 'SAN JUAN DE TARUCANI', '19', 1, 35),
(351, 'SANTA ISABEL DE SIGUAS', '20', 1, 35),
(352, 'SANTA RITA DE SIGUAS', '21', 1, 35),
(353, 'SOCABAYA', '22', 1, 35),
(354, 'TIABAYA', '23', 1, 35),
(355, 'UCHUMAYO', '24', 1, 35),
(356, 'VITOR', '25', 1, 35),
(357, 'YANAHUARA', '26', 1, 35),
(358, 'YARABAMBA', '27', 1, 35),
(359, 'YURA', '28', 1, 35),
(360, 'JOSÉ LUIS BUSTAMANTE Y RIVERO', '29', 1, 35),
(361, 'CAMANÁ', '01', 1, 36),
(362, 'JOSÉ MARÍA QUIMPER', '02', 1, 36),
(363, 'MARIANO NICOLÁS VALCÁRCEL', '03', 1, 36),
(364, 'MARISCAL CÁCERES', '04', 1, 36),
(365, 'NICOLÁS DE PIEROLA', '05', 1, 36),
(366, 'OCOÑA', '06', 1, 36),
(367, 'QUILCA', '07', 1, 36),
(368, 'SAMUEL PASTOR', '08', 1, 36),
(369, 'CARAVELÍ', '01', 1, 37),
(370, 'ACARÍ', '02', 1, 37),
(371, 'ATICO', '03', 1, 37),
(372, 'ATIQUIPA', '04', 1, 37),
(373, 'BELLA UNIÓN', '05', 1, 37),
(374, 'CAHUACHO', '06', 1, 37),
(375, 'CHALA', '07', 1, 37),
(376, 'CHAPARRA', '08', 1, 37),
(377, 'HUANUHUANU', '09', 1, 37),
(378, 'JAQUI', '10', 1, 37),
(379, 'LOMAS', '11', 1, 37),
(380, 'QUICACHA', '12', 1, 37),
(381, 'YAUCA', '13', 1, 37),
(382, 'APLAO', '01', 1, 38),
(383, 'ANDAGUA', '02', 1, 38),
(384, 'AYO', '03', 1, 38),
(385, 'CHACHAS', '04', 1, 38),
(386, 'CHILCAYMARCA', '05', 1, 38),
(387, 'CHOCO', '06', 1, 38),
(388, 'HUANCARQUI', '07', 1, 38),
(389, 'MACHAGUAY', '08', 1, 38),
(390, 'ORCOPAMPA', '09', 1, 38),
(391, 'PAMPACOLCA', '10', 1, 38),
(392, 'TIPAN', '11', 1, 38),
(393, 'UÑON', '12', 1, 38),
(394, 'URACA', '13', 1, 38),
(395, 'VIRACO', '14', 1, 38),
(396, 'CHIVAY', '01', 1, 39),
(397, 'ACHOMA', '02', 1, 39),
(398, 'CABANACONDE', '03', 1, 39),
(399, 'CALLALLI', '04', 1, 39),
(400, 'CAYLLOMA', '05', 1, 39),
(401, 'COPORAQUE', '06', 1, 39),
(402, 'HUAMBO', '07', 1, 39),
(403, 'HUANCA', '08', 1, 39),
(404, 'ICHUPAMPA', '09', 1, 39),
(405, 'LARI', '10', 1, 39),
(406, 'LLUTA', '11', 1, 39),
(407, 'MACA', '12', 1, 39),
(408, 'MADRIGAL', '13', 1, 39),
(409, 'SAN ANTONIO DE CHUCA', '14', 1, 39),
(410, 'SIBAYO', '15', 1, 39),
(411, 'TAPAY', '16', 1, 39),
(412, 'TISCO', '17', 1, 39),
(413, 'TUTI', '18', 1, 39),
(414, 'YANQUE', '19', 1, 39),
(415, 'MAJES', '20', 1, 39),
(416, 'CHUQUIBAMBA', '01', 1, 40),
(417, 'ANDARAY', '02', 1, 40),
(418, 'CAYARANI', '03', 1, 40),
(419, 'CHICHAS', '04', 1, 40),
(420, 'IRAY', '05', 1, 40),
(421, 'RÍO GRANDE', '06', 1, 40),
(422, 'SALAMANCA', '07', 1, 40),
(423, 'YANAQUIHUA', '08', 1, 40),
(424, 'MOLLENDO', '01', 1, 41),
(425, 'COCACHACRA', '02', 1, 41),
(426, 'DEAN VALDIVIA', '03', 1, 41),
(427, 'ISLAY', '04', 1, 41),
(428, 'MEJIA', '05', 1, 41),
(429, 'PUNTA DE BOMBÓN', '06', 1, 41),
(430, 'COTAHUASI', '01', 1, 42),
(431, 'ALCA', '02', 1, 42),
(432, 'CHARCANA', '03', 1, 42),
(433, 'HUAYNACOTAS', '04', 1, 42),
(434, 'PAMPAMARCA', '05', 1, 42),
(435, 'PUYCA', '06', 1, 42),
(436, 'QUECHUALLA', '07', 1, 42),
(437, 'SAYLA', '08', 1, 42),
(438, 'TAURIA', '09', 1, 42),
(439, 'TOMEPAMPA', '10', 1, 42),
(440, 'TORO', '11', 1, 42),
(441, 'AYACUCHO', '01', 1, 43),
(442, 'ACOCRO', '02', 1, 43),
(443, 'ACOS VINCHOS', '03', 1, 43),
(444, 'CARMEN ALTO', '04', 1, 43),
(445, 'CHIARA', '05', 1, 43),
(446, 'OCROS', '06', 1, 43),
(447, 'PACAYCASA', '07', 1, 43),
(448, 'QUINUA', '08', 1, 43),
(449, 'SAN JOSÉ DE TICLLAS', '09', 1, 43),
(450, 'SAN JUAN BAUTISTA', '10', 1, 43),
(451, 'SANTIAGO DE PISCHA', '11', 1, 43),
(452, 'SOCOS', '12', 1, 43),
(453, 'TAMBILLO', '13', 1, 43),
(454, 'VINCHOS', '14', 1, 43),
(455, 'JESÚS NAZARENO', '15', 1, 43),
(456, 'ANDRÉS AVELINO CÁCERES DORREGARAY', '16', 1, 43),
(457, 'CANGALLO', '01', 1, 44),
(458, 'CHUSCHI', '02', 1, 44),
(459, 'LOS MOROCHUCOS', '03', 1, 44),
(460, 'MARÍA PARADO DE BELLIDO', '04', 1, 44),
(461, 'PARAS', '05', 1, 44),
(462, 'TOTOS', '06', 1, 44),
(463, 'SANCOS', '01', 1, 45),
(464, 'CARAPO', '02', 1, 45),
(465, 'SACSAMARCA', '03', 1, 45),
(466, 'SANTIAGO DE LUCANAMARCA', '04', 1, 45),
(467, 'HUANTA', '01', 1, 46),
(468, 'AYAHUANCO', '02', 1, 46),
(469, 'HUAMANGUILLA', '03', 1, 46),
(470, 'IGUAIN', '04', 1, 46),
(471, 'LURICOCHA', '05', 1, 46),
(472, 'SANTILLANA', '06', 1, 46),
(473, 'SIVIA', '07', 1, 46),
(474, 'LLOCHEGUA', '08', 1, 46),
(475, 'CANAYRE', '09', 1, 46),
(476, 'UCHURACCAY', '10', 1, 46),
(477, 'PUCACOLPA', '11', 1, 46),
(478, 'SAN MIGUEL', '01', 1, 47),
(479, 'ANCO', '02', 1, 47),
(480, 'AYNA', '03', 1, 47),
(481, 'CHILCAS', '04', 1, 47),
(482, 'CHUNGUI', '05', 1, 47),
(483, 'LUIS CARRANZA', '06', 1, 47),
(484, 'SANTA ROSA', '07', 1, 47),
(485, 'TAMBO', '08', 1, 47),
(486, 'SAMUGARI', '09', 1, 47),
(487, 'ANCHIHUAY', '10', 1, 47),
(488, 'PUQUIO', '01', 1, 48),
(489, 'AUCARA', '02', 1, 48),
(490, 'CABANA', '03', 1, 48),
(491, 'CARMEN SALCEDO', '04', 1, 48),
(492, 'CHAVIÑA', '05', 1, 48),
(493, 'CHIPAO', '06', 1, 48),
(494, 'HUAC-HUAS', '07', 1, 48),
(495, 'LARAMATE', '08', 1, 48),
(496, 'LEONCIO PRADO', '09', 1, 48),
(497, 'LLAUTA', '10', 1, 48),
(498, 'LUCANAS', '11', 1, 48),
(499, 'OCAÑA', '12', 1, 48),
(500, 'OTOCA', '13', 1, 48),
(501, 'SAISA', '14', 1, 48),
(502, 'SAN CRISTÓBAL', '15', 1, 48),
(503, 'SAN JUAN', '16', 1, 48),
(504, 'SAN PEDRO', '17', 1, 48),
(505, 'SAN PEDRO DE PALCO', '18', 1, 48),
(506, 'SANCOS', '19', 1, 48),
(507, 'SANTA ANA DE HUAYCAHUACHO', '20', 1, 48),
(508, 'SANTA LUCIA', '21', 1, 48),
(509, 'CORACORA', '01', 1, 49),
(510, 'CHUMPI', '02', 1, 49),
(511, 'CORONEL CASTAÑEDA', '03', 1, 49),
(512, 'PACAPAUSA', '04', 1, 49),
(513, 'PULLO', '05', 1, 49),
(514, 'PUYUSCA', '06', 1, 49),
(515, 'SAN FRANCISCO DE RAVACAYCO', '07', 1, 49),
(516, 'UPAHUACHO', '08', 1, 49),
(517, 'PAUSA', '01', 1, 50),
(518, 'COLTA', '02', 1, 50),
(519, 'CORCULLA', '03', 1, 50),
(520, 'LAMPA', '04', 1, 50),
(521, 'MARCABAMBA', '05', 1, 50),
(522, 'OYOLO', '06', 1, 50),
(523, 'PARARCA', '07', 1, 50),
(524, 'SAN JAVIER DE ALPABAMBA', '08', 1, 50),
(525, 'SAN JOSÉ DE USHUA', '09', 1, 50),
(526, 'SARA SARA', '10', 1, 50),
(527, 'QUEROBAMBA', '01', 1, 51),
(528, 'BELÉN', '02', 1, 51),
(529, 'CHALCOS', '03', 1, 51),
(530, 'CHILCAYOC', '04', 1, 51),
(531, 'HUACAÑA', '05', 1, 51),
(532, 'MORCOLLA', '06', 1, 51),
(533, 'PAICO', '07', 1, 51),
(534, 'SAN PEDRO DE LARCAY', '08', 1, 51),
(535, 'SAN SALVADOR DE QUIJE', '09', 1, 51),
(536, 'SANTIAGO DE PAUCARAY', '10', 1, 51),
(537, 'SORAS', '11', 1, 51),
(538, 'HUANCAPI', '01', 1, 52),
(539, 'ALCAMENCA', '02', 1, 52),
(540, 'APONGO', '03', 1, 52),
(541, 'ASQUIPATA', '04', 1, 52),
(542, 'CANARIA', '05', 1, 52),
(543, 'CAYARA', '06', 1, 52),
(544, 'COLCA', '07', 1, 52),
(545, 'HUAMANQUIQUIA', '08', 1, 52),
(546, 'HUANCARAYLLA', '09', 1, 52),
(547, 'HUAYA', '10', 1, 52),
(548, 'SARHUA', '11', 1, 52),
(549, 'VILCANCHOS', '12', 1, 52),
(550, 'VILCAS HUAMAN', '01', 1, 53),
(551, 'ACCOMARCA', '02', 1, 53),
(552, 'CARHUANCA', '03', 1, 53),
(553, 'CONCEPCIÓN', '04', 1, 53),
(554, 'HUAMBALPA', '05', 1, 53),
(555, 'INDEPENDENCIA', '06', 1, 53),
(556, 'SAURAMA', '07', 1, 53),
(557, 'VISCHONGO', '08', 1, 53),
(558, 'CAJAMARCA', '01', 1, 54),
(559, 'ASUNCIÓN', '02', 1, 54),
(560, 'CHETILLA', '03', 1, 54),
(561, 'COSPAN', '04', 1, 54),
(562, 'ENCAÑADA', '05', 1, 54),
(563, 'JESÚS', '06', 1, 54),
(564, 'LLACANORA', '07', 1, 54),
(565, 'LOS BAÑOS DEL INCA', '08', 1, 54),
(566, 'MAGDALENA', '09', 1, 54),
(567, 'MATARA', '10', 1, 54),
(568, 'NAMORA', '11', 1, 54),
(569, 'SAN JUAN', '12', 1, 54),
(570, 'CAJABAMBA', '01', 1, 55),
(571, 'CACHACHI', '02', 1, 55),
(572, 'CONDEBAMBA', '03', 1, 55),
(573, 'SITACOCHA', '04', 1, 55),
(574, 'CELENDÍN', '01', 1, 56),
(575, 'CHUMUCH', '02', 1, 56),
(576, 'CORTEGANA', '03', 1, 56),
(577, 'HUASMIN', '04', 1, 56),
(578, 'JORGE CHÁVEZ', '05', 1, 56),
(579, 'JOSÉ GÁLVEZ', '06', 1, 56),
(580, 'MIGUEL IGLESIAS', '07', 1, 56),
(581, 'OXAMARCA', '08', 1, 56),
(582, 'SOROCHUCO', '09', 1, 56),
(583, 'SUCRE', '10', 1, 56),
(584, 'UTCO', '11', 1, 56),
(585, 'LA LIBERTAD DE PALLAN', '12', 1, 56),
(586, 'CHOTA', '01', 1, 57),
(587, 'ANGUIA', '02', 1, 57),
(588, 'CHADIN', '03', 1, 57),
(589, 'CHIGUIRIP', '04', 1, 57),
(590, 'CHIMBAN', '05', 1, 57),
(591, 'CHOROPAMPA', '06', 1, 57),
(592, 'COCHABAMBA', '07', 1, 57),
(593, 'CONCHAN', '08', 1, 57),
(594, 'HUAMBOS', '09', 1, 57),
(595, 'LAJAS', '10', 1, 57),
(596, 'LLAMA', '11', 1, 57),
(597, 'MIRACOSTA', '12', 1, 57),
(598, 'PACCHA', '13', 1, 57),
(599, 'PION', '14', 1, 57),
(600, 'QUEROCOTO', '15', 1, 57),
(601, 'SAN JUAN DE LICUPIS', '16', 1, 57),
(602, 'TACABAMBA', '17', 1, 57),
(603, 'TOCMOCHE', '18', 1, 57),
(604, 'CHALAMARCA', '19', 1, 57),
(605, 'CONTUMAZA', '01', 1, 58),
(606, 'CHILETE', '02', 1, 58),
(607, 'CUPISNIQUE', '03', 1, 58),
(608, 'GUZMANGO', '04', 1, 58),
(609, 'SAN BENITO', '05', 1, 58),
(610, 'SANTA CRUZ DE TOLEDO', '06', 1, 58),
(611, 'TANTARICA', '07', 1, 58),
(612, 'YONAN', '08', 1, 58),
(613, 'CUTERVO', '01', 1, 59),
(614, 'CALLAYUC', '02', 1, 59),
(615, 'CHOROS', '03', 1, 59),
(616, 'CUJILLO', '04', 1, 59),
(617, 'LA RAMADA', '05', 1, 59),
(618, 'PIMPINGOS', '06', 1, 59),
(619, 'QUEROCOTILLO', '07', 1, 59),
(620, 'SAN ANDRÉS DE CUTERVO', '08', 1, 59),
(621, 'SAN JUAN DE CUTERVO', '09', 1, 59),
(622, 'SAN LUIS DE LUCMA', '10', 1, 59),
(623, 'SANTA CRUZ', '11', 1, 59),
(624, 'SANTO DOMINGO DE LA CAPILLA', '12', 1, 59),
(625, 'SANTO TOMAS', '13', 1, 59),
(626, 'SOCOTA', '14', 1, 59),
(627, 'TORIBIO CASANOVA', '15', 1, 59),
(628, 'BAMBAMARCA', '01', 1, 60),
(629, 'CHUGUR', '02', 1, 60),
(630, 'HUALGAYOC', '03', 1, 60),
(631, 'JAÉN', '01', 1, 61),
(632, 'BELLAVISTA', '02', 1, 61),
(633, 'CHONTALI', '03', 1, 61),
(634, 'COLASAY', '04', 1, 61),
(635, 'HUABAL', '05', 1, 61),
(636, 'LAS PIRIAS', '06', 1, 61),
(637, 'POMAHUACA', '07', 1, 61),
(638, 'PUCARA', '08', 1, 61),
(639, 'SALLIQUE', '09', 1, 61),
(640, 'SAN FELIPE', '10', 1, 61),
(641, 'SAN JOSÉ DEL ALTO', '11', 1, 61),
(642, 'SANTA ROSA', '12', 1, 61),
(643, 'SAN IGNACIO', '01', 1, 62),
(644, 'CHIRINOS', '02', 1, 62),
(645, 'HUARANGO', '03', 1, 62),
(646, 'LA COIPA', '04', 1, 62),
(647, 'NAMBALLE', '05', 1, 62),
(648, 'SAN JOSÉ DE LOURDES', '06', 1, 62),
(649, 'TABACONAS', '07', 1, 62),
(650, 'PEDRO GÁLVEZ', '01', 1, 63),
(651, 'CHANCAY', '02', 1, 63),
(652, 'EDUARDO VILLANUEVA', '03', 1, 63),
(653, 'GREGORIO PITA', '04', 1, 63),
(654, 'ICHOCAN', '05', 1, 63),
(655, 'JOSÉ MANUEL QUIROZ', '06', 1, 63),
(656, 'JOSÉ SABOGAL', '07', 1, 63),
(657, 'SAN MIGUEL', '01', 1, 64),
(658, 'BOLÍVAR', '02', 1, 64),
(659, 'CALQUIS', '03', 1, 64),
(660, 'CATILLUC', '04', 1, 64),
(661, 'EL PRADO', '05', 1, 64),
(662, 'LA FLORIDA', '06', 1, 64),
(663, 'LLAPA', '07', 1, 64),
(664, 'NANCHOC', '08', 1, 64),
(665, 'NIEPOS', '09', 1, 64),
(666, 'SAN GREGORIO', '10', 1, 64),
(667, 'SAN SILVESTRE DE COCHAN', '11', 1, 64),
(668, 'TONGOD', '12', 1, 64),
(669, 'UNIÓN AGUA BLANCA', '13', 1, 64),
(670, 'SAN PABLO', '01', 1, 65),
(671, 'SAN BERNARDINO', '02', 1, 65),
(672, 'SAN LUIS', '03', 1, 65),
(673, 'TUMBADEN', '04', 1, 65),
(674, 'SANTA CRUZ', '01', 1, 66),
(675, 'ANDABAMBA', '02', 1, 66),
(676, 'CATACHE', '03', 1, 66),
(677, 'CHANCAYBAÑOS', '04', 1, 66),
(678, 'LA ESPERANZA', '05', 1, 66),
(679, 'NINABAMBA', '06', 1, 66),
(680, 'PULAN', '07', 1, 66),
(681, 'SAUCEPAMPA', '08', 1, 66),
(682, 'SEXI', '09', 1, 66),
(683, 'UTICYACU', '10', 1, 66),
(684, 'YAUYUCAN', '11', 1, 66),
(685, 'CALLAO', '01', 1, 67),
(686, 'BELLAVISTA', '02', 1, 67),
(687, 'CARMEN DE LA LEGUA REYNOSO', '03', 1, 67),
(688, 'LA PERLA', '04', 1, 67),
(689, 'LA PUNTA', '05', 1, 67),
(690, 'VENTANILLA', '06', 1, 67),
(691, 'MI PERÚ', '07', 1, 67),
(692, 'CUSCO', '01', 1, 68),
(693, 'CCORCA', '02', 1, 68),
(694, 'POROY', '03', 1, 68),
(695, 'SAN JERÓNIMO', '04', 1, 68),
(696, 'SAN SEBASTIAN', '05', 1, 68),
(697, 'SANTIAGO', '06', 1, 68),
(698, 'SAYLLA', '07', 1, 68),
(699, 'WANCHAQ', '08', 1, 68),
(700, 'ACOMAYO', '01', 1, 69),
(701, 'ACOPIA', '02', 1, 69),
(702, 'ACOS', '03', 1, 69),
(703, 'MOSOC LLACTA', '04', 1, 69),
(704, 'POMACANCHI', '05', 1, 69),
(705, 'RONDOCAN', '06', 1, 69),
(706, 'SANGARARA', '07', 1, 69),
(707, 'ANTA', '01', 1, 70),
(708, 'ANCAHUASI', '02', 1, 70),
(709, 'CACHIMAYO', '03', 1, 70),
(710, 'CHINCHAYPUJIO', '04', 1, 70),
(711, 'HUAROCONDO', '05', 1, 70),
(712, 'LIMATAMBO', '06', 1, 70),
(713, 'MOLLEPATA', '07', 1, 70),
(714, 'PUCYURA', '08', 1, 70),
(715, 'ZURITE', '09', 1, 70),
(716, 'CALCA', '01', 1, 71),
(717, 'COYA', '02', 1, 71),
(718, 'LAMAY', '03', 1, 71),
(719, 'LARES', '04', 1, 71),
(720, 'PISAC', '05', 1, 71),
(721, 'SAN SALVADOR', '06', 1, 71),
(722, 'TARAY', '07', 1, 71),
(723, 'YANATILE', '08', 1, 71),
(724, 'YANAOCA', '01', 1, 72),
(725, 'CHECCA', '02', 1, 72),
(726, 'KUNTURKANKI', '03', 1, 72),
(727, 'LANGUI', '04', 1, 72),
(728, 'LAYO', '05', 1, 72),
(729, 'PAMPAMARCA', '06', 1, 72),
(730, 'QUEHUE', '07', 1, 72),
(731, 'TUPAC AMARU', '08', 1, 72),
(732, 'SICUANI', '01', 1, 73),
(733, 'CHECACUPE', '02', 1, 73),
(734, 'COMBAPATA', '03', 1, 73),
(735, 'MARANGANI', '04', 1, 73),
(736, 'PITUMARCA', '05', 1, 73),
(737, 'SAN PABLO', '06', 1, 73),
(738, 'SAN PEDRO', '07', 1, 73),
(739, 'TINTA', '08', 1, 73),
(740, 'SANTO TOMAS', '01', 1, 74),
(741, 'CAPACMARCA', '02', 1, 74),
(742, 'CHAMACA', '03', 1, 74),
(743, 'COLQUEMARCA', '04', 1, 74),
(744, 'LIVITACA', '05', 1, 74),
(745, 'LLUSCO', '06', 1, 74),
(746, 'QUIÑOTA', '07', 1, 74),
(747, 'VELILLE', '08', 1, 74),
(748, 'ESPINAR', '01', 1, 75),
(749, 'CONDOROMA', '02', 1, 75),
(750, 'COPORAQUE', '03', 1, 75),
(751, 'OCORURO', '04', 1, 75),
(752, 'PALLPATA', '05', 1, 75),
(753, 'PICHIGUA', '06', 1, 75),
(754, 'SUYCKUTAMBO', '07', 1, 75),
(755, 'ALTO PICHIGUA', '08', 1, 75),
(756, 'SANTA ANA', '01', 1, 76),
(757, 'ECHARATE', '02', 1, 76),
(758, 'HUAYOPATA', '03', 1, 76),
(759, 'MARANURA', '04', 1, 76),
(760, 'OCOBAMBA', '05', 1, 76),
(761, 'QUELLOUNO', '06', 1, 76),
(762, 'KIMBIRI', '07', 1, 76),
(763, 'SANTA TERESA', '08', 1, 76),
(764, 'VILCABAMBA', '09', 1, 76),
(765, 'PICHARI', '10', 1, 76),
(766, 'INKAWASI', '11', 1, 76),
(767, 'VILLA VIRGEN', '12', 1, 76),
(768, 'VILLA KINTIARINA', '13', 1, 76),
(769, 'PARURO', '01', 1, 77),
(770, 'ACCHA', '02', 1, 77),
(771, 'CCAPI', '03', 1, 77),
(772, 'COLCHA', '04', 1, 77),
(773, 'HUANOQUITE', '05', 1, 77),
(774, 'OMACHA', '06', 1, 77),
(775, 'PACCARITAMBO', '07', 1, 77),
(776, 'PILLPINTO', '08', 1, 77),
(777, 'YAURISQUE', '09', 1, 77),
(778, 'PAUCARTAMBO', '01', 1, 78),
(779, 'CAICAY', '02', 1, 78),
(780, 'CHALLABAMBA', '03', 1, 78),
(781, 'COLQUEPATA', '04', 1, 78),
(782, 'HUANCARANI', '05', 1, 78),
(783, 'KOSÑIPATA', '06', 1, 78),
(784, 'URCOS', '01', 1, 79),
(785, 'ANDAHUAYLILLAS', '02', 1, 79),
(786, 'CAMANTI', '03', 1, 79),
(787, 'CCARHUAYO', '04', 1, 79),
(788, 'CCATCA', '05', 1, 79),
(789, 'CUSIPATA', '06', 1, 79),
(790, 'HUARO', '07', 1, 79),
(791, 'LUCRE', '08', 1, 79),
(792, 'MARCAPATA', '09', 1, 79),
(793, 'OCONGATE', '10', 1, 79),
(794, 'OROPESA', '11', 1, 79),
(795, 'QUIQUIJANA', '12', 1, 79),
(796, 'URUBAMBA', '01', 1, 80),
(797, 'CHINCHERO', '02', 1, 80),
(798, 'HUAYLLABAMBA', '03', 1, 80),
(799, 'MACHUPICCHU', '04', 1, 80),
(800, 'MARAS', '05', 1, 80),
(801, 'OLLANTAYTAMBO', '06', 1, 80),
(802, 'YUCAY', '07', 1, 80),
(803, 'HUANCAVELICA', '01', 1, 81),
(804, 'ACOBAMBILLA', '02', 1, 81),
(805, 'ACORIA', '03', 1, 81),
(806, 'CONAYCA', '04', 1, 81),
(807, 'CUENCA', '05', 1, 81),
(808, 'HUACHOCOLPA', '06', 1, 81),
(809, 'HUAYLLAHUARA', '07', 1, 81),
(810, 'IZCUCHACA', '08', 1, 81),
(811, 'LARIA', '09', 1, 81),
(812, 'MANTA', '10', 1, 81),
(813, 'MARISCAL CÁCERES', '11', 1, 81),
(814, 'MOYA', '12', 1, 81),
(815, 'NUEVO OCCORO', '13', 1, 81),
(816, 'PALCA', '14', 1, 81),
(817, 'PILCHACA', '15', 1, 81),
(818, 'VILCA', '16', 1, 81),
(819, 'YAULI', '17', 1, 81),
(820, 'ASCENSIÓN', '18', 1, 81),
(821, 'HUANDO', '19', 1, 81),
(822, 'ACOBAMBA', '01', 1, 82),
(823, 'ANDABAMBA', '02', 1, 82),
(824, 'ANTA', '03', 1, 82),
(825, 'CAJA', '04', 1, 82),
(826, 'MARCAS', '05', 1, 82),
(827, 'PAUCARA', '06', 1, 82),
(828, 'POMACOCHA', '07', 1, 82),
(829, 'ROSARIO', '08', 1, 82),
(830, 'LIRCAY', '01', 1, 83),
(831, 'ANCHONGA', '02', 1, 83),
(832, 'CALLANMARCA', '03', 1, 83),
(833, 'CCOCHACCASA', '04', 1, 83),
(834, 'CHINCHO', '05', 1, 83),
(835, 'CONGALLA', '06', 1, 83),
(836, 'HUANCA-HUANCA', '07', 1, 83),
(837, 'HUAYLLAY GRANDE', '08', 1, 83),
(838, 'JULCAMARCA', '09', 1, 83),
(839, 'SAN ANTONIO DE ANTAPARCO', '10', 1, 83),
(840, 'SANTO TOMAS DE PATA', '11', 1, 83),
(841, 'SECCLLA', '12', 1, 83),
(842, 'CASTROVIRREYNA', '01', 1, 84),
(843, 'ARMA', '02', 1, 84),
(844, 'AURAHUA', '03', 1, 84),
(845, 'CAPILLAS', '04', 1, 84),
(846, 'CHUPAMARCA', '05', 1, 84),
(847, 'COCAS', '06', 1, 84),
(848, 'HUACHOS', '07', 1, 84),
(849, 'HUAMATAMBO', '08', 1, 84),
(850, 'MOLLEPAMPA', '09', 1, 84),
(851, 'SAN JUAN', '10', 1, 84),
(852, 'SANTA ANA', '11', 1, 84),
(853, 'TANTARA', '12', 1, 84),
(854, 'TICRAPO', '13', 1, 84),
(855, 'CHURCAMPA', '01', 1, 85),
(856, 'ANCO', '02', 1, 85),
(857, 'CHINCHIHUASI', '03', 1, 85),
(858, 'EL CARMEN', '04', 1, 85),
(859, 'LA MERCED', '05', 1, 85),
(860, 'LOCROJA', '06', 1, 85),
(861, 'PAUCARBAMBA', '07', 1, 85),
(862, 'SAN MIGUEL DE MAYOCC', '08', 1, 85),
(863, 'SAN PEDRO DE CORIS', '09', 1, 85),
(864, 'PACHAMARCA', '10', 1, 85),
(865, 'COSME', '11', 1, 85),
(866, 'HUAYTARA', '01', 1, 86),
(867, 'AYAVI', '02', 1, 86),
(868, 'CÓRDOVA', '03', 1, 86),
(869, 'HUAYACUNDO ARMA', '04', 1, 86),
(870, 'LARAMARCA', '05', 1, 86),
(871, 'OCOYO', '06', 1, 86),
(872, 'PILPICHACA', '07', 1, 86),
(873, 'QUERCO', '08', 1, 86),
(874, 'QUITO-ARMA', '09', 1, 86),
(875, 'SAN ANTONIO DE CUSICANCHA', '10', 1, 86),
(876, 'SAN FRANCISCO DE SANGAYAICO', '11', 1, 86),
(877, 'SAN ISIDRO', '12', 1, 86),
(878, 'SANTIAGO DE CHOCORVOS', '13', 1, 86),
(879, 'SANTIAGO DE QUIRAHUARA', '14', 1, 86),
(880, 'SANTO DOMINGO DE CAPILLAS', '15', 1, 86),
(881, 'TAMBO', '16', 1, 86),
(882, 'PAMPAS', '01', 1, 87),
(883, 'ACOSTAMBO', '02', 1, 87),
(884, 'ACRAQUIA', '03', 1, 87),
(885, 'AHUAYCHA', '04', 1, 87),
(886, 'COLCABAMBA', '05', 1, 87),
(887, 'DANIEL HERNÁNDEZ', '06', 1, 87),
(888, 'HUACHOCOLPA', '07', 1, 87),
(889, 'HUARIBAMBA', '09', 1, 87),
(890, 'ÑAHUIMPUQUIO', '10', 1, 87),
(891, 'PAZOS', '11', 1, 87),
(892, 'QUISHUAR', '13', 1, 87),
(893, 'SALCABAMBA', '14', 1, 87),
(894, 'SALCAHUASI', '15', 1, 87),
(895, 'SAN MARCOS DE ROCCHAC', '16', 1, 87),
(896, 'SURCUBAMBA', '17', 1, 87),
(897, 'TINTAY PUNCU', '18', 1, 87),
(898, 'QUICHUAS', '19', 1, 87),
(899, 'ANDAYMARCA', '20', 1, 87),
(900, 'HUANUCO', '01', 1, 88),
(901, 'AMARILIS', '02', 1, 88),
(902, 'CHINCHAO', '03', 1, 88),
(903, 'CHURUBAMBA', '04', 1, 88),
(904, 'MARGOS', '05', 1, 88),
(905, 'QUISQUI (KICHKI)', '06', 1, 88),
(906, 'SAN FRANCISCO DE CAYRAN', '07', 1, 88),
(907, 'SAN PEDRO DE CHAULAN', '08', 1, 88),
(908, 'SANTA MARÍA DEL VALLE', '09', 1, 88),
(909, 'YARUMAYO', '10', 1, 88),
(910, 'PILLCO MARCA', '11', 1, 88),
(911, 'YACUS', '12', 1, 88),
(912, 'AMBO', '01', 1, 89),
(913, 'CAYNA', '02', 1, 89),
(914, 'COLPAS', '03', 1, 89),
(915, 'CONCHAMARCA', '04', 1, 89),
(916, 'HUACAR', '05', 1, 89),
(917, 'SAN FRANCISCO', '06', 1, 89),
(918, 'SAN RAFAEL', '07', 1, 89),
(919, 'TOMAY KICHWA', '08', 1, 89),
(920, 'LA UNIÓN', '01', 1, 90),
(921, 'CHUQUIS', '07', 1, 90),
(922, 'MARÍAS', '11', 1, 90),
(923, 'PACHAS', '13', 1, 90),
(924, 'QUIVILLA', '16', 1, 90),
(925, 'RIPAN', '17', 1, 90),
(926, 'SHUNQUI', '21', 1, 90),
(927, 'SILLAPATA', '22', 1, 90),
(928, 'YANAS', '23', 1, 90),
(929, 'HUACAYBAMBA', '01', 1, 91),
(930, 'CANCHABAMBA', '02', 1, 91),
(931, 'COCHABAMBA', '03', 1, 91),
(932, 'PINRA', '04', 1, 91),
(933, 'LLATA', '01', 1, 92),
(934, 'ARANCAY', '02', 1, 92),
(935, 'CHAVÍN DE PARIARCA', '03', 1, 92),
(936, 'JACAS GRANDE', '04', 1, 92),
(937, 'JIRCAN', '05', 1, 92),
(938, 'MIRAFLORES', '06', 1, 92),
(939, 'MONZÓN', '07', 1, 92),
(940, 'PUNCHAO', '08', 1, 92),
(941, 'PUÑOS', '09', 1, 92),
(942, 'SINGA', '10', 1, 92),
(943, 'TANTAMAYO', '11', 1, 92),
(944, 'RUPA-RUPA', '01', 1, 93),
(945, 'DANIEL ALOMÍA ROBLES', '02', 1, 93),
(946, 'HERMÍLIO VALDIZAN', '03', 1, 93),
(947, 'JOSÉ CRESPO Y CASTILLO', '04', 1, 93),
(948, 'LUYANDO', '05', 1, 93),
(949, 'MARIANO DAMASO BERAUN', '06', 1, 93),
(950, 'HUACRACHUCO', '01', 1, 94),
(951, 'CHOLON', '02', 1, 94),
(952, 'SAN BUENAVENTURA', '03', 1, 94),
(953, 'PANAO', '01', 1, 95),
(954, 'CHAGLLA', '02', 1, 95),
(955, 'MOLINO', '03', 1, 95),
(956, 'UMARI', '04', 1, 95),
(957, 'PUERTO INCA', '01', 1, 96),
(958, 'CODO DEL POZUZO', '02', 1, 96),
(959, 'HONORIA', '03', 1, 96),
(960, 'TOURNAVISTA', '04', 1, 96),
(961, 'YUYAPICHIS', '05', 1, 96),
(962, 'JESÚS', '01', 1, 97),
(963, 'BAÑOS', '02', 1, 97),
(964, 'JIVIA', '03', 1, 97),
(965, 'QUEROPALCA', '04', 1, 97),
(966, 'RONDOS', '05', 1, 97),
(967, 'SAN FRANCISCO DE ASÍS', '06', 1, 97),
(968, 'SAN MIGUEL DE CAURI', '07', 1, 97),
(969, 'CHAVINILLO', '01', 1, 98),
(970, 'CAHUAC', '02', 1, 98),
(971, 'CHACABAMBA', '03', 1, 98),
(972, 'APARICIO POMARES', '04', 1, 98),
(973, 'JACAS CHICO', '05', 1, 98),
(974, 'OBAS', '06', 1, 98),
(975, 'PAMPAMARCA', '07', 1, 98),
(976, 'CHORAS', '08', 1, 98),
(977, 'ICA', '01', 1, 99),
(978, 'LA TINGUIÑA', '02', 1, 99),
(979, 'LOS AQUIJES', '03', 1, 99),
(980, 'OCUCAJE', '04', 1, 99),
(981, 'PACHACUTEC', '05', 1, 99),
(982, 'PARCONA', '06', 1, 99),
(983, 'PUEBLO NUEVO', '07', 1, 99),
(984, 'SALAS', '08', 1, 99),
(985, 'SAN JOSÉ DE LOS MOLINOS', '09', 1, 99),
(986, 'SAN JUAN BAUTISTA', '10', 1, 99),
(987, 'SANTIAGO', '11', 1, 99),
(988, 'SUBTANJALLA', '12', 1, 99),
(989, 'TATE', '13', 1, 99),
(990, 'YAUCA DEL ROSARIO', '14', 1, 99),
(991, 'CHINCHA ALTA', '01', 1, 100),
(992, 'ALTO LARAN', '02', 1, 100),
(993, 'CHAVIN', '03', 1, 100),
(994, 'CHINCHA BAJA', '04', 1, 100),
(995, 'EL CARMEN', '05', 1, 100),
(996, 'GROCIO PRADO', '06', 1, 100),
(997, 'PUEBLO NUEVO', '07', 1, 100),
(998, 'SAN JUAN DE YANAC', '08', 1, 100),
(999, 'SAN PEDRO DE HUACARPANA', '09', 1, 100),
(1000, 'SUNAMPE', '10', 1, 100),
(1001, 'TAMBO DE MORA', '11', 1, 100),
(1002, 'NASCA', '01', 1, 101),
(1003, 'CHANGUILLO', '02', 1, 101),
(1004, 'EL INGENIO', '03', 1, 101),
(1005, 'MARCONA', '04', 1, 101),
(1006, 'VISTA ALEGRE', '05', 1, 101),
(1007, 'PALPA', '01', 1, 102),
(1008, 'LLIPATA', '02', 1, 102),
(1009, 'RÍO GRANDE', '03', 1, 102),
(1010, 'SANTA CRUZ', '04', 1, 102),
(1011, 'TIBILLO', '05', 1, 102),
(1012, 'PISCO', '01', 1, 103),
(1013, 'HUANCANO', '02', 1, 103),
(1014, 'HUMAY', '03', 1, 103),
(1015, 'INDEPENDENCIA', '04', 1, 103),
(1016, 'PARACAS', '05', 1, 103),
(1017, 'SAN ANDRÉS', '06', 1, 103),
(1018, 'SAN CLEMENTE', '07', 1, 103),
(1019, 'TUPAC AMARU INCA', '08', 1, 103),
(1020, 'HUANCAYO', '01', 1, 104),
(1021, 'CARHUACALLANGA', '04', 1, 104),
(1022, 'CHACAPAMPA', '05', 1, 104),
(1023, 'CHICCHE', '06', 1, 104),
(1024, 'CHILCA', '07', 1, 104),
(1025, 'CHONGOS ALTO', '08', 1, 104),
(1026, 'CHUPURO', '11', 1, 104),
(1027, 'COLCA', '12', 1, 104),
(1028, 'CULLHUAS', '13', 1, 104),
(1029, 'EL TAMBO', '14', 1, 104),
(1030, 'HUACRAPUQUIO', '16', 1, 104),
(1031, 'HUALHUAS', '17', 1, 104),
(1032, 'HUANCAN', '19', 1, 104),
(1033, 'HUASICANCHA', '20', 1, 104),
(1034, 'HUAYUCACHI', '21', 1, 104),
(1035, 'INGENIO', '22', 1, 104),
(1036, 'PARIAHUANCA', '24', 1, 104),
(1037, 'PILCOMAYO', '25', 1, 104),
(1038, 'PUCARA', '26', 1, 104),
(1039, 'QUICHUAY', '27', 1, 104),
(1040, 'QUILCAS', '28', 1, 104),
(1041, 'SAN AGUSTÍN', '29', 1, 104),
(1042, 'SAN JERÓNIMO DE TUNAN', '30', 1, 104),
(1043, 'SAÑO', '32', 1, 104),
(1044, 'SAPALLANGA', '33', 1, 104),
(1045, 'SICAYA', '34', 1, 104),
(1046, 'SANTO DOMINGO DE ACOBAMBA', '35', 1, 104),
(1047, 'VIQUES', '36', 1, 104),
(1048, 'CONCEPCIÓN', '01', 1, 105),
(1049, 'ACO', '02', 1, 105),
(1050, 'ANDAMARCA', '03', 1, 105),
(1051, 'CHAMBARA', '04', 1, 105),
(1052, 'COCHAS', '05', 1, 105),
(1053, 'COMAS', '06', 1, 105),
(1054, 'HEROÍNAS TOLEDO', '07', 1, 105),
(1055, 'MANZANARES', '08', 1, 105),
(1056, 'MARISCAL CASTILLA', '09', 1, 105),
(1057, 'MATAHUASI', '10', 1, 105),
(1058, 'MITO', '11', 1, 105),
(1059, 'NUEVE DE JULIO', '12', 1, 105),
(1060, 'ORCOTUNA', '13', 1, 105),
(1061, 'SAN JOSÉ DE QUERO', '14', 1, 105),
(1062, 'SANTA ROSA DE OCOPA', '15', 1, 105),
(1063, 'CHANCHAMAYO', '01', 1, 106),
(1064, 'PERENE', '02', 1, 106),
(1065, 'PICHANAQUI', '03', 1, 106),
(1066, 'SAN LUIS DE SHUARO', '04', 1, 106),
(1067, 'SAN RAMÓN', '05', 1, 106),
(1068, 'VITOC', '06', 1, 106),
(1069, 'JAUJA', '01', 1, 107),
(1070, 'ACOLLA', '02', 1, 107),
(1071, 'APATA', '03', 1, 107),
(1072, 'ATAURA', '04', 1, 107),
(1073, 'CANCHAYLLO', '05', 1, 107),
(1074, 'CURICACA', '06', 1, 107),
(1075, 'EL MANTARO', '07', 1, 107),
(1076, 'HUAMALI', '08', 1, 107),
(1077, 'HUARIPAMPA', '09', 1, 107),
(1078, 'HUERTAS', '10', 1, 107),
(1079, 'JANJAILLO', '11', 1, 107),
(1080, 'JULCÁN', '12', 1, 107),
(1081, 'LEONOR ORDÓÑEZ', '13', 1, 107),
(1082, 'LLOCLLAPAMPA', '14', 1, 107),
(1083, 'MARCO', '15', 1, 107),
(1084, 'MASMA', '16', 1, 107),
(1085, 'MASMA CHICCHE', '17', 1, 107),
(1086, 'MOLINOS', '18', 1, 107),
(1087, 'MONOBAMBA', '19', 1, 107),
(1088, 'MUQUI', '20', 1, 107),
(1089, 'MUQUIYAUYO', '21', 1, 107),
(1090, 'PACA', '22', 1, 107),
(1091, 'PACCHA', '23', 1, 107),
(1092, 'PANCAN', '24', 1, 107),
(1093, 'PARCO', '25', 1, 107),
(1094, 'POMACANCHA', '26', 1, 107),
(1095, 'RICRAN', '27', 1, 107),
(1096, 'SAN LORENZO', '28', 1, 107),
(1097, 'SAN PEDRO DE CHUNAN', '29', 1, 107),
(1098, 'SAUSA', '30', 1, 107),
(1099, 'SINCOS', '31', 1, 107),
(1100, 'TUNAN MARCA', '32', 1, 107),
(1101, 'YAULI', '33', 1, 107),
(1102, 'YAUYOS', '34', 1, 107),
(1103, 'JUNIN', '01', 1, 108),
(1104, 'CARHUAMAYO', '02', 1, 108),
(1105, 'ONDORES', '03', 1, 108),
(1106, 'ULCUMAYO', '04', 1, 108),
(1107, 'SATIPO', '01', 1, 109),
(1108, 'COVIRIALI', '02', 1, 109),
(1109, 'LLAYLLA', '03', 1, 109),
(1110, 'MAZAMARI', '04', 1, 109),
(1111, 'PAMPA HERMOSA', '05', 1, 109),
(1112, 'PANGOA', '06', 1, 109),
(1113, 'RÍO NEGRO', '07', 1, 109),
(1114, 'RÍO TAMBO', '08', 1, 109),
(1115, 'VIZCATAN DEL ENE', '09', 1, 109),
(1116, 'TARMA', '01', 1, 110),
(1117, 'ACOBAMBA', '02', 1, 110),
(1118, 'HUARICOLCA', '03', 1, 110),
(1119, 'HUASAHUASI', '04', 1, 110),
(1120, 'LA UNIÓN', '05', 1, 110),
(1121, 'PALCA', '06', 1, 110),
(1122, 'PALCAMAYO', '07', 1, 110),
(1123, 'SAN PEDRO DE CAJAS', '08', 1, 110),
(1124, 'TAPO', '09', 1, 110),
(1125, 'LA OROYA', '01', 1, 111),
(1126, 'CHACAPALPA', '02', 1, 111),
(1127, 'HUAY-HUAY', '03', 1, 111),
(1128, 'MARCAPOMACOCHA', '04', 1, 111),
(1129, 'MOROCOCHA', '05', 1, 111),
(1130, 'PACCHA', '06', 1, 111),
(1131, 'SANTA BÁRBARA DE CARHUACAYAN', '07', 1, 111),
(1132, 'SANTA ROSA DE SACCO', '08', 1, 111),
(1133, 'SUITUCANCHA', '09', 1, 111),
(1134, 'YAULI', '10', 1, 111),
(1135, 'CHUPACA', '01', 1, 112),
(1136, 'AHUAC', '02', 1, 112),
(1137, 'CHONGOS BAJO', '03', 1, 112),
(1138, 'HUACHAC', '04', 1, 112),
(1139, 'HUAMANCACA CHICO', '05', 1, 112),
(1140, 'SAN JUAN DE ISCOS', '06', 1, 112),
(1141, 'SAN JUAN DE JARPA', '07', 1, 112),
(1142, 'TRES DE DICIEMBRE', '08', 1, 112),
(1143, 'YANACANCHA', '09', 1, 112),
(1144, 'TRUJILLO', '01', 1, 113),
(1145, 'EL PORVENIR', '02', 1, 113),
(1146, 'FLORENCIA DE MORA', '03', 1, 113),
(1147, 'HUANCHACO', '04', 1, 113),
(1148, 'LA ESPERANZA', '05', 1, 113),
(1149, 'LAREDO', '06', 1, 113),
(1150, 'MOCHE', '07', 1, 113),
(1151, 'POROTO', '08', 1, 113),
(1152, 'SALAVERRY', '09', 1, 113),
(1153, 'SIMBAL', '10', 1, 113),
(1154, 'VICTOR LARCO HERRERA', '11', 1, 113),
(1155, 'ASCOPE', '01', 1, 114),
(1156, 'CHICAMA', '02', 1, 114),
(1157, 'CHOCOPE', '03', 1, 114),
(1158, 'MAGDALENA DE CAO', '04', 1, 114),
(1159, 'PAIJAN', '05', 1, 114),
(1160, 'RÁZURI', '06', 1, 114),
(1161, 'SANTIAGO DE CAO', '07', 1, 114),
(1162, 'CASA GRANDE', '08', 1, 114),
(1163, 'BOLÍVAR', '01', 1, 115),
(1164, 'BAMBAMARCA', '02', 1, 115),
(1165, 'CONDORMARCA', '03', 1, 115),
(1166, 'LONGOTEA', '04', 1, 115),
(1167, 'UCHUMARCA', '05', 1, 115),
(1168, 'UCUNCHA', '06', 1, 115),
(1169, 'CHEPEN', '01', 1, 116),
(1170, 'PACANGA', '02', 1, 116),
(1171, 'PUEBLO NUEVO', '03', 1, 116),
(1172, 'JULCAN', '01', 1, 117),
(1173, 'CALAMARCA', '02', 1, 117),
(1174, 'CARABAMBA', '03', 1, 117),
(1175, 'HUASO', '04', 1, 117),
(1176, 'OTUZCO', '01', 1, 118),
(1177, 'AGALLPAMPA', '02', 1, 118),
(1178, 'CHARAT', '04', 1, 118),
(1179, 'HUARANCHAL', '05', 1, 118),
(1180, 'LA CUESTA', '06', 1, 118),
(1181, 'MACHE', '08', 1, 118),
(1182, 'PARANDAY', '10', 1, 118),
(1183, 'SALPO', '11', 1, 118),
(1184, 'SINSICAP', '13', 1, 118),
(1185, 'USQUIL', '14', 1, 118),
(1186, 'SAN PEDRO DE LLOC', '01', 1, 119),
(1187, 'GUADALUPE', '02', 1, 119),
(1188, 'JEQUETEPEQUE', '03', 1, 119),
(1189, 'PACASMAYO', '04', 1, 119),
(1190, 'SAN JOSÉ', '05', 1, 119),
(1191, 'TAYABAMBA', '01', 1, 120),
(1192, 'BULDIBUYO', '02', 1, 120),
(1193, 'CHILLIA', '03', 1, 120),
(1194, 'HUANCASPATA', '04', 1, 120),
(1195, 'HUAYLILLAS', '05', 1, 120),
(1196, 'HUAYO', '06', 1, 120),
(1197, 'ONGON', '07', 1, 120),
(1198, 'PARCOY', '08', 1, 120),
(1199, 'PATAZ', '09', 1, 120),
(1200, 'PIAS', '10', 1, 120),
(1201, 'SANTIAGO DE CHALLAS', '11', 1, 120),
(1202, 'TAURIJA', '12', 1, 120),
(1203, 'URPAY', '13', 1, 120),
(1204, 'HUAMACHUCO', '01', 1, 121),
(1205, 'CHUGAY', '02', 1, 121),
(1206, 'COCHORCO', '03', 1, 121),
(1207, 'CURGOS', '04', 1, 121),
(1208, 'MARCABAL', '05', 1, 121),
(1209, 'SANAGORAN', '06', 1, 121),
(1210, 'SARIN', '07', 1, 121),
(1211, 'SARTIMBAMBA', '08', 1, 121),
(1212, 'SANTIAGO DE CHUCO', '01', 1, 122),
(1213, 'ANGASMARCA', '02', 1, 122),
(1214, 'CACHICADAN', '03', 1, 122),
(1215, 'MOLLEBAMBA', '04', 1, 122),
(1216, 'MOLLEPATA', '05', 1, 122),
(1217, 'QUIRUVILCA', '06', 1, 122),
(1218, 'SANTA CRUZ DE CHUCA', '07', 1, 122),
(1219, 'SITABAMBA', '08', 1, 122),
(1220, 'CASCAS', '01', 1, 123),
(1221, 'LUCMA', '02', 1, 123),
(1222, 'MARMOT', '03', 1, 123),
(1223, 'SAYAPULLO', '04', 1, 123),
(1224, 'VIRU', '01', 1, 124),
(1225, 'CHAO', '02', 1, 124),
(1226, 'GUADALUPITO', '03', 1, 124),
(1227, 'CHICLAYO', '01', 1, 125),
(1228, 'CHONGOYAPE', '02', 1, 125),
(1229, 'ETEN', '03', 1, 125),
(1230, 'ETEN PUERTO', '04', 1, 125),
(1231, 'JOSÉ LEONARDO ORTIZ', '05', 1, 125),
(1232, 'LA VICTORIA', '06', 1, 125),
(1233, 'LAGUNAS', '07', 1, 125),
(1234, 'MONSEFU', '08', 1, 125),
(1235, 'NUEVA ARICA', '09', 1, 125),
(1236, 'OYOTUN', '10', 1, 125),
(1237, 'PICSI', '11', 1, 125),
(1238, 'PIMENTEL', '12', 1, 125),
(1239, 'REQUE', '13', 1, 125),
(1240, 'SANTA ROSA', '14', 1, 125),
(1241, 'SAÑA', '15', 1, 125),
(1242, 'CAYALTI', '16', 1, 125),
(1243, 'PATAPO', '17', 1, 125),
(1244, 'POMALCA', '18', 1, 125),
(1245, 'PUCALA', '19', 1, 125),
(1246, 'TUMAN', '20', 1, 125),
(1247, 'FERREÑAFE', '01', 1, 126),
(1248, 'CAÑARIS', '02', 1, 126),
(1249, 'INCAHUASI', '03', 1, 126),
(1250, 'MANUEL ANTONIO MESONES MURO', '04', 1, 126),
(1251, 'PITIPO', '05', 1, 126),
(1252, 'PUEBLO NUEVO', '06', 1, 126),
(1253, 'LAMBAYEQUE', '01', 1, 127),
(1254, 'CHOCHOPE', '02', 1, 127),
(1255, 'ILLIMO', '03', 1, 127),
(1256, 'JAYANCA', '04', 1, 127),
(1257, 'MOCHUMI', '05', 1, 127),
(1258, 'MORROPE', '06', 1, 127),
(1259, 'MOTUPE', '07', 1, 127),
(1260, 'OLMOS', '08', 1, 127),
(1261, 'PACORA', '09', 1, 127),
(1262, 'SALAS', '10', 1, 127),
(1263, 'SAN JOSÉ', '11', 1, 127),
(1264, 'TUCUME', '12', 1, 127),
(1265, 'LIMA', '01', 1, 128),
(1266, 'ANCÓN', '02', 1, 128),
(1267, 'ATE', '03', 1, 128),
(1268, 'BARRANCO', '04', 1, 128),
(1269, 'BREÑA', '05', 1, 128),
(1270, 'CARABAYLLO', '06', 1, 128),
(1271, 'CHACLACAYO', '07', 1, 128),
(1272, 'CHORRILLOS', '08', 1, 128),
(1273, 'CIENEGUILLA', '09', 1, 128),
(1274, 'COMAS', '10', 1, 128),
(1275, 'EL AGUSTINO', '11', 1, 128),
(1276, 'INDEPENDENCIA', '12', 1, 128),
(1277, 'JESÚS MARÍA', '13', 1, 128),
(1278, 'LA MOLINA', '14', 1, 128),
(1279, 'LA VICTORIA', '15', 1, 128),
(1280, 'LINCE', '16', 1, 128),
(1281, 'LOS OLIVOS', '17', 1, 128),
(1282, 'LURIGANCHO', '18', 1, 128),
(1283, 'LURIN', '19', 1, 128),
(1284, 'MAGDALENA DEL MAR', '20', 1, 128),
(1285, 'PUEBLO LIBRE', '21', 1, 128),
(1286, 'MIRAFLORES', '22', 1, 128),
(1287, 'PACHACAMAC', '23', 1, 128),
(1288, 'PUCUSANA', '24', 1, 128),
(1289, 'PUENTE PIEDRA', '25', 1, 128),
(1290, 'PUNTA HERMOSA', '26', 1, 128),
(1291, 'PUNTA NEGRA', '27', 1, 128),
(1292, 'RÍMAC', '28', 1, 128),
(1293, 'SAN BARTOLO', '29', 1, 128),
(1294, 'SAN BORJA', '30', 1, 128),
(1295, 'SAN ISIDRO', '31', 1, 128),
(1296, 'SAN JUAN DE LURIGANCHO', '32', 1, 128),
(1297, 'SAN JUAN DE MIRAFLORES', '33', 1, 128),
(1298, 'SAN LUIS', '34', 1, 128),
(1299, 'SAN MARTÍN DE PORRES', '35', 1, 128),
(1300, 'SAN MIGUEL', '36', 1, 128),
(1301, 'SANTA ANITA', '37', 1, 128),
(1302, 'SANTA MARÍA DEL MAR', '38', 1, 128),
(1303, 'SANTA ROSA', '39', 1, 128),
(1304, 'SANTIAGO DE SURCO', '40', 1, 128),
(1305, 'SURQUILLO', '41', 1, 128),
(1306, 'VILLA EL SALVADOR', '42', 1, 128),
(1307, 'VILLA MARÍA DEL TRIUNFO', '43', 1, 128),
(1308, 'BARRANCA', '01', 1, 129),
(1309, 'PARAMONGA', '02', 1, 129),
(1310, 'PATIVILCA', '03', 1, 129),
(1311, 'SUPE', '04', 1, 129),
(1312, 'SUPE PUERTO', '05', 1, 129),
(1313, 'CAJATAMBO', '01', 1, 130),
(1314, 'COPA', '02', 1, 130),
(1315, 'GORGOR', '03', 1, 130),
(1316, 'HUANCAPON', '04', 1, 130),
(1317, 'MANAS', '05', 1, 130),
(1318, 'CANTA', '01', 1, 131),
(1319, 'ARAHUAY', '02', 1, 131),
(1320, 'HUAMANTANGA', '03', 1, 131),
(1321, 'HUAROS', '04', 1, 131),
(1322, 'LACHAQUI', '05', 1, 131),
(1323, 'SAN BUENAVENTURA', '06', 1, 131),
(1324, 'SANTA ROSA DE QUIVES', '07', 1, 131),
(1325, 'SAN VICENTE DE CAÑETE', '01', 1, 132),
(1326, 'ASIA', '02', 1, 132),
(1327, 'CALANGO', '03', 1, 132),
(1328, 'CERRO AZUL', '04', 1, 132),
(1329, 'CHILCA', '05', 1, 132),
(1330, 'COAYLLO', '06', 1, 132),
(1331, 'IMPERIAL', '07', 1, 132),
(1332, 'LUNAHUANA', '08', 1, 132),
(1333, 'MALA', '09', 1, 132),
(1334, 'NUEVO IMPERIAL', '10', 1, 132),
(1335, 'PACARAN', '11', 1, 132),
(1336, 'QUILMANA', '12', 1, 132),
(1337, 'SAN ANTONIO', '13', 1, 132),
(1338, 'SAN LUIS', '14', 1, 132),
(1339, 'SANTA CRUZ DE FLORES', '15', 1, 132),
(1340, 'ZÚÑIGA', '16', 1, 132),
(1341, 'HUARAL', '01', 1, 133),
(1342, 'ATAVILLOS ALTO', '02', 1, 133),
(1343, 'ATAVILLOS BAJO', '03', 1, 133),
(1344, 'AUCALLAMA', '04', 1, 133),
(1345, 'CHANCAY', '05', 1, 133),
(1346, 'IHUARI', '06', 1, 133),
(1347, 'LAMPIAN', '07', 1, 133),
(1348, 'PACARAOS', '08', 1, 133),
(1349, 'SAN MIGUEL DE ACOS', '09', 1, 133),
(1350, 'SANTA CRUZ DE ANDAMARCA', '10', 1, 133),
(1351, 'SUMBILCA', '11', 1, 133),
(1352, 'VEINTISIETE DE NOVIEMBRE', '12', 1, 133),
(1353, 'MATUCANA', '01', 1, 134),
(1354, 'ANTIOQUIA', '02', 1, 134),
(1355, 'CALLAHUANCA', '03', 1, 134),
(1356, 'CARAMPOMA', '04', 1, 134),
(1357, 'CHICLA', '05', 1, 134),
(1358, 'CUENCA', '06', 1, 134),
(1359, 'HUACHUPAMPA', '07', 1, 134),
(1360, 'HUANZA', '08', 1, 134),
(1361, 'HUAROCHIRI', '09', 1, 134),
(1362, 'LAHUAYTAMBO', '10', 1, 134),
(1363, 'LANGA', '11', 1, 134),
(1364, 'LARAOS', '12', 1, 134),
(1365, 'MARIATANA', '13', 1, 134),
(1366, 'RICARDO PALMA', '14', 1, 134),
(1367, 'SAN ANDRÉS DE TUPICOCHA', '15', 1, 134),
(1368, 'SAN ANTONIO', '16', 1, 134),
(1369, 'SAN BARTOLOMÉ', '17', 1, 134),
(1370, 'SAN DAMIAN', '18', 1, 134),
(1371, 'SAN JUAN DE IRIS', '19', 1, 134),
(1372, 'SAN JUAN DE TANTARANCHE', '20', 1, 134),
(1373, 'SAN LORENZO DE QUINTI', '21', 1, 134),
(1374, 'SAN MATEO', '22', 1, 134),
(1375, 'SAN MATEO DE OTAO', '23', 1, 134),
(1376, 'SAN PEDRO DE CASTA', '24', 1, 134),
(1377, 'SAN PEDRO DE HUANCAYRE', '25', 1, 134),
(1378, 'SANGALLAYA', '26', 1, 134),
(1379, 'SANTA CRUZ DE COCACHACRA', '27', 1, 134),
(1380, 'SANTA EULALIA', '28', 1, 134),
(1381, 'SANTIAGO DE ANCHUCAYA', '29', 1, 134),
(1382, 'SANTIAGO DE TUNA', '30', 1, 134),
(1383, 'SANTO DOMINGO DE LOS OLLEROS', '31', 1, 134),
(1384, 'SURCO', '32', 1, 134),
(1385, 'HUACHO', '01', 1, 135),
(1386, 'AMBAR', '02', 1, 135),
(1387, 'CALETA DE CARQUIN', '03', 1, 135),
(1388, 'CHECRAS', '04', 1, 135),
(1389, 'HUALMAY', '05', 1, 135),
(1390, 'HUAURA', '06', 1, 135),
(1391, 'LEONCIO PRADO', '07', 1, 135),
(1392, 'PACCHO', '08', 1, 135),
(1393, 'SANTA LEONOR', '09', 1, 135),
(1394, 'SANTA MARÍA', '10', 1, 135),
(1395, 'SAYAN', '11', 1, 135),
(1396, 'VEGUETA', '12', 1, 135),
(1397, 'OYON', '01', 1, 136),
(1398, 'ANDAJES', '02', 1, 136),
(1399, 'CAUJUL', '03', 1, 136),
(1400, 'COCHAMARCA', '04', 1, 136),
(1401, 'NAVAN', '05', 1, 136),
(1402, 'PACHANGARA', '06', 1, 136),
(1403, 'YAUYOS', '01', 1, 137),
(1404, 'ALIS', '02', 1, 137),
(1405, 'ALLAUCA', '03', 1, 137),
(1406, 'AYAVIRI', '04', 1, 137),
(1407, 'AZÁNGARO', '05', 1, 137),
(1408, 'CACRA', '06', 1, 137),
(1409, 'CARANIA', '07', 1, 137),
(1410, 'CATAHUASI', '08', 1, 137),
(1411, 'CHOCOS', '09', 1, 137),
(1412, 'COCHAS', '10', 1, 137),
(1413, 'COLONIA', '11', 1, 137),
(1414, 'HONGOS', '12', 1, 137),
(1415, 'HUAMPARA', '13', 1, 137),
(1416, 'HUANCAYA', '14', 1, 137),
(1417, 'HUANGASCAR', '15', 1, 137),
(1418, 'HUANTAN', '16', 1, 137),
(1419, 'HUAÑEC', '17', 1, 137),
(1420, 'LARAOS', '18', 1, 137),
(1421, 'LINCHA', '19', 1, 137),
(1422, 'MADEAN', '20', 1, 137),
(1423, 'MIRAFLORES', '21', 1, 137),
(1424, 'OMAS', '22', 1, 137),
(1425, 'PUTINZA', '23', 1, 137),
(1426, 'QUINCHES', '24', 1, 137),
(1427, 'QUINOCAY', '25', 1, 137),
(1428, 'SAN JOAQUÍN', '26', 1, 137),
(1429, 'SAN PEDRO DE PILAS', '27', 1, 137),
(1430, 'TANTA', '28', 1, 137),
(1431, 'TAURIPAMPA', '29', 1, 137),
(1432, 'TOMAS', '30', 1, 137),
(1433, 'TUPE', '31', 1, 137),
(1434, 'VIÑAC', '32', 1, 137),
(1435, 'VITIS', '33', 1, 137),
(1436, 'IQUITOS', '01', 1, 138),
(1437, 'ALTO NANAY', '02', 1, 138),
(1438, 'FERNANDO LORES', '03', 1, 138),
(1439, 'INDIANA', '04', 1, 138),
(1440, 'LAS AMAZONAS', '05', 1, 138),
(1441, 'MAZAN', '06', 1, 138),
(1442, 'NAPO', '07', 1, 138),
(1443, 'PUNCHANA', '08', 1, 138),
(1444, 'TORRES CAUSANA', '10', 1, 138),
(1445, 'BELÉN', '12', 1, 138),
(1446, 'SAN JUAN BAUTISTA', '13', 1, 138),
(1447, 'YURIMAGUAS', '01', 1, 139),
(1448, 'BALSAPUERTO', '02', 1, 139),
(1449, 'JEBEROS', '05', 1, 139),
(1450, 'LAGUNAS', '06', 1, 139),
(1451, 'SANTA CRUZ', '10', 1, 139),
(1452, 'TENIENTE CESAR LÓPEZ ROJAS', '11', 1, 139),
(1453, 'NAUTA', '01', 1, 140),
(1454, 'PARINARI', '02', 1, 140),
(1455, 'TIGRE', '03', 1, 140),
(1456, 'TROMPETEROS', '04', 1, 140),
(1457, 'URARINAS', '05', 1, 140),
(1458, 'RAMÓN CASTILLA', '01', 1, 141),
(1459, 'PEBAS', '02', 1, 141),
(1460, 'YAVARI', '03', 1, 141),
(1461, 'SAN PABLO', '04', 1, 141),
(1462, 'REQUENA', '01', 1, 142),
(1463, 'ALTO TAPICHE', '02', 1, 142),
(1464, 'CAPELO', '03', 1, 142),
(1465, 'EMILIO SAN MARTÍN', '04', 1, 142),
(1466, 'MAQUIA', '05', 1, 142),
(1467, 'PUINAHUA', '06', 1, 142),
(1468, 'SAQUENA', '07', 1, 142),
(1469, 'SOPLIN', '08', 1, 142),
(1470, 'TAPICHE', '09', 1, 142),
(1471, 'JENARO HERRERA', '10', 1, 142),
(1472, 'YAQUERANA', '11', 1, 142),
(1473, 'CONTAMANA', '01', 1, 143),
(1474, 'INAHUAYA', '02', 1, 143),
(1475, 'PADRE MÁRQUEZ', '03', 1, 143),
(1476, 'PAMPA HERMOSA', '04', 1, 143),
(1477, 'SARAYACU', '05', 1, 143),
(1478, 'VARGAS GUERRA', '06', 1, 143),
(1479, 'BARRANCA', '01', 1, 144),
(1480, 'CAHUAPANAS', '02', 1, 144),
(1481, 'MANSERICHE', '03', 1, 144),
(1482, 'MORONA', '04', 1, 144),
(1483, 'PASTAZA', '05', 1, 144),
(1484, 'ANDOAS', '06', 1, 144),
(1485, 'PUTUMAYO', '01', 1, 145),
(1486, 'ROSA PANDURO', '02', 1, 145),
(1487, 'TENIENTE MANUEL CLAVERO', '03', 1, 145),
(1488, 'YAGUAS', '04', 1, 145),
(1489, 'TAMBOPATA', '01', 1, 146),
(1490, 'INAMBARI', '02', 1, 146),
(1491, 'LAS PIEDRAS', '03', 1, 146),
(1492, 'LABERINTO', '04', 1, 146),
(1493, 'MANU', '01', 1, 147),
(1494, 'FITZCARRALD', '02', 1, 147),
(1495, 'MADRE DE DIOS', '03', 1, 147),
(1496, 'HUEPETUHE', '04', 1, 147),
(1497, 'IÑAPARI', '01', 1, 148),
(1498, 'IBERIA', '02', 1, 148),
(1499, 'TAHUAMANU', '03', 1, 148),
(1500, 'MOQUEGUA', '01', 1, 149),
(1501, 'CARUMAS', '02', 1, 149),
(1502, 'CUCHUMBAYA', '03', 1, 149),
(1503, 'SAMEGUA', '04', 1, 149),
(1504, 'SAN CRISTÓBAL', '05', 1, 149),
(1505, 'TORATA', '06', 1, 149),
(1506, 'OMATE', '01', 1, 150),
(1507, 'CHOJATA', '02', 1, 150),
(1508, 'COALAQUE', '03', 1, 150),
(1509, 'ICHUÑA', '04', 1, 150),
(1510, 'LA CAPILLA', '05', 1, 150),
(1511, 'LLOQUE', '06', 1, 150),
(1512, 'MATALAQUE', '07', 1, 150),
(1513, 'PUQUINA', '08', 1, 150),
(1514, 'QUINISTAQUILLAS', '09', 1, 150),
(1515, 'UBINAS', '10', 1, 150),
(1516, 'YUNGA', '11', 1, 150),
(1517, 'ILO', '01', 1, 151),
(1518, 'EL ALGARROBAL', '02', 1, 151),
(1519, 'PACOCHA', '03', 1, 151),
(1520, 'CHAUPIMARCA', '01', 1, 152),
(1521, 'HUACHON', '02', 1, 152),
(1522, 'HUARIACA', '03', 1, 152),
(1523, 'HUAYLLAY', '04', 1, 152),
(1524, 'NINACACA', '05', 1, 152),
(1525, 'PALLANCHACRA', '06', 1, 152),
(1526, 'PAUCARTAMBO', '07', 1, 152),
(1527, 'SAN FRANCISCO DE ASÍS DE YARUSYACAN', '08', 1, 152),
(1528, 'SIMON BOLÍVAR', '09', 1, 152),
(1529, 'TICLACAYAN', '10', 1, 152),
(1530, 'TINYAHUARCO', '11', 1, 152),
(1531, 'VICCO', '12', 1, 152),
(1532, 'YANACANCHA', '13', 1, 152),
(1533, 'YANAHUANCA', '01', 1, 153),
(1534, 'CHACAYAN', '02', 1, 153),
(1535, 'GOYLLARISQUIZGA', '03', 1, 153),
(1536, 'PAUCAR', '04', 1, 153),
(1537, 'SAN PEDRO DE PILLAO', '05', 1, 153),
(1538, 'SANTA ANA DE TUSI', '06', 1, 153),
(1539, 'TAPUC', '07', 1, 153),
(1540, 'VILCABAMBA', '08', 1, 153),
(1541, 'OXAPAMPA', '01', 1, 154),
(1542, 'CHONTABAMBA', '02', 1, 154),
(1543, 'HUANCABAMBA', '03', 1, 154),
(1544, 'PALCAZU', '04', 1, 154),
(1545, 'POZUZO', '05', 1, 154),
(1546, 'PUERTO BERMÚDEZ', '06', 1, 154),
(1547, 'VILLA RICA', '07', 1, 154),
(1548, 'CONSTITUCIÓN', '08', 1, 154),
(1549, 'PIURA', '01', 1, 155),
(1550, 'CASTILLA', '04', 1, 155),
(1551, 'ATACAOS', '05', 1, 155),
(1552, 'CURA MORI', '07', 1, 155),
(1553, 'EL TALLAN', '08', 1, 155),
(1554, 'LA ARENA', '09', 1, 155),
(1555, 'LA UNIÓN', '10', 1, 155),
(1556, 'LAS LOMAS', '11', 1, 155),
(1557, 'TAMBO GRANDE', '14', 1, 155),
(1558, 'VEINTISEIS DE OCTUBRE', '15', 1, 155),
(1559, 'AYABACA', '01', 1, 156),
(1560, 'FRIAS', '02', 1, 156),
(1561, 'JILILI', '03', 1, 156),
(1562, 'LAGUNAS', '04', 1, 156),
(1563, 'MONTERO', '05', 1, 156),
(1564, 'PACAIPAMPA', '06', 1, 156),
(1565, 'PAIMAS', '07', 1, 156),
(1566, 'SAPILLICA', '08', 1, 156);
INSERT INTO `distritos` (`id`, `nombre`, `ubigeo`, `estado`, `provincias_id`) VALUES
(1567, 'SICCHEZ', '09', 1, 156),
(1568, 'SUYO', '10', 1, 156),
(1569, 'HUANCABAMBA', '01', 1, 157),
(1570, 'CANCHAQUE', '02', 1, 157),
(1571, 'EL CARMEN DE LA FRONTERA', '03', 1, 157),
(1572, 'HUARMACA', '04', 1, 157),
(1573, 'LALAQUIZ', '05', 1, 157),
(1574, 'SAN MIGUEL DE EL FAIQUE', '06', 1, 157),
(1575, 'SONDOR', '07', 1, 157),
(1576, 'SONDORILLO', '08', 1, 157),
(1577, 'CHULUCANAS', '01', 1, 158),
(1578, 'BUENOS AIRES', '02', 1, 158),
(1579, 'CHALACO', '03', 1, 158),
(1580, 'LA MATANZA', '04', 1, 158),
(1581, 'MORROPON', '05', 1, 158),
(1582, 'SALITRAL', '06', 1, 158),
(1583, 'SAN JUAN DE BIGOTE', '07', 1, 158),
(1584, 'SANTA CATALINA DE MOSSA', '08', 1, 158),
(1585, 'SANTO DOMINGO', '09', 1, 158),
(1586, 'YAMANGO', '10', 1, 158),
(1587, 'PAITA', '01', 1, 159),
(1588, 'AMOTAPE', '02', 1, 159),
(1589, 'ARENAL', '03', 1, 159),
(1590, 'COLAN', '04', 1, 159),
(1591, 'LA HUACA', '05', 1, 159),
(1592, 'TAMARINDO', '06', 1, 159),
(1593, 'VICHAYAL', '07', 1, 159),
(1594, 'SULLANA', '01', 1, 160),
(1595, 'BELLAVISTA', '02', 1, 160),
(1596, 'IGNACIO ESCUDERO', '03', 1, 160),
(1597, 'LANCONES', '04', 1, 160),
(1598, 'MARCAVELICA', '05', 1, 160),
(1599, 'MIGUEL CHECA', '06', 1, 160),
(1600, 'QUERECOTILLO', '07', 1, 160),
(1601, 'SALITRAL', '08', 1, 160),
(1602, 'PARIÑAS', '01', 1, 161),
(1603, 'EL ALTO', '02', 1, 161),
(1604, 'LA BREA', '03', 1, 161),
(1605, 'LOBITOS', '04', 1, 161),
(1606, 'LOS ORGANOS', '05', 1, 161),
(1607, 'MANCORA', '06', 1, 161),
(1608, 'SECHURA', '01', 1, 162),
(1609, 'BELLAVISTA DE LA UNIÓN', '02', 1, 162),
(1610, 'BERNAL', '03', 1, 162),
(1611, 'CRISTO NOS VALGA', '04', 1, 162),
(1612, 'VICE', '05', 1, 162),
(1613, 'RINCONADA LLICUAR', '06', 1, 162),
(1614, 'PUNO', '01', 1, 163),
(1615, 'ACORA', '02', 1, 163),
(1616, 'AMANTANI', '03', 1, 163),
(1617, 'ATUNCOLLA', '04', 1, 163),
(1618, 'CAPACHICA', '05', 1, 163),
(1619, 'CHUCUITO', '06', 1, 163),
(1620, 'COATA', '07', 1, 163),
(1621, 'HUATA', '08', 1, 163),
(1622, 'MAÑAZO', '09', 1, 163),
(1623, 'PAUCARCOLLA', '10', 1, 163),
(1624, 'PICHACANI', '11', 1, 163),
(1625, 'PLATERIA', '12', 1, 163),
(1626, 'SAN ANTONIO', '13', 1, 163),
(1627, 'TIQUILLACA', '14', 1, 163),
(1628, 'VILQUE', '15', 1, 163),
(1629, 'AZÁNGARO', '01', 1, 164),
(1630, 'ACHAYA', '02', 1, 164),
(1631, 'ARAPA', '03', 1, 164),
(1632, 'ASILLO', '04', 1, 164),
(1633, 'CAMINACA', '05', 1, 164),
(1634, 'CHUPA', '06', 1, 164),
(1635, 'JOSÉ DOMINGO CHOQUEHUANCA', '07', 1, 164),
(1636, 'MUÑANI', '08', 1, 164),
(1637, 'POTONI', '09', 1, 164),
(1638, 'SAMAN', '10', 1, 164),
(1639, 'SAN ANTON', '11', 1, 164),
(1640, 'SAN JOSÉ', '12', 1, 164),
(1641, 'SAN JUAN DE SALINAS', '13', 1, 164),
(1642, 'SANTIAGO DE PUPUJA', '14', 1, 164),
(1643, 'TIRAPATA', '15', 1, 164),
(1644, 'MACUSANI', '01', 1, 165),
(1645, 'AJOYANI', '02', 1, 165),
(1646, 'AYAPATA', '03', 1, 165),
(1647, 'COASA', '04', 1, 165),
(1648, 'CORANI', '05', 1, 165),
(1649, 'CRUCERO', '06', 1, 165),
(1650, 'ITUATA', '07', 1, 165),
(1651, 'OLLACHEA', '08', 1, 165),
(1652, 'SAN GABAN', '09', 1, 165),
(1653, 'USICAYOS', '10', 1, 165),
(1654, 'JULI', '01', 1, 166),
(1655, 'DESAGUADERO', '02', 1, 166),
(1656, 'HUACULLANI', '03', 1, 166),
(1657, 'KELLUYO', '04', 1, 166),
(1658, 'PISACOMA', '05', 1, 166),
(1659, 'POMATA', '06', 1, 166),
(1660, 'ZEPITA', '07', 1, 166),
(1661, 'ILAVE', '01', 1, 167),
(1662, 'CAPAZO', '02', 1, 167),
(1663, 'PILCUYO', '03', 1, 167),
(1664, 'SANTA ROSA', '04', 1, 167),
(1665, 'CONDURIRI', '05', 1, 167),
(1666, 'HUANCANE', '01', 1, 168),
(1667, 'COJATA', '02', 1, 168),
(1668, 'HUATASANI', '03', 1, 168),
(1669, 'INCHUPALLA', '04', 1, 168),
(1670, 'PUSI', '05', 1, 168),
(1671, 'ROSASPATA', '06', 1, 168),
(1672, 'TARACO', '07', 1, 168),
(1673, 'VILQUE CHICO', '08', 1, 168),
(1674, 'LAMPA', '01', 1, 169),
(1675, 'CABANILLA', '02', 1, 169),
(1676, 'CALAPUJA', '03', 1, 169),
(1677, 'NICASIO', '04', 1, 169),
(1678, 'OCUVIRI', '05', 1, 169),
(1679, 'PALCA', '06', 1, 169),
(1680, 'PARATIA', '07', 1, 169),
(1681, 'PUCARA', '08', 1, 169),
(1682, 'SANTA LUCIA', '09', 1, 169),
(1683, 'VILAVILA', '10', 1, 169),
(1684, 'AYAVIRI', '01', 1, 170),
(1685, 'ANTAUTA', '02', 1, 170),
(1686, 'CUPI', '03', 1, 170),
(1687, 'LLALLI', '04', 1, 170),
(1688, 'MACARI', '05', 1, 170),
(1689, 'NUÑOA', '06', 1, 170),
(1690, 'ORURILLO', '07', 1, 170),
(1691, 'SANTA ROSA', '08', 1, 170),
(1692, 'UMACHIRI', '09', 1, 170),
(1693, 'MOHO', '01', 1, 171),
(1694, 'CONIMA', '02', 1, 171),
(1695, 'HUAYRAPATA', '03', 1, 171),
(1696, 'TILALI', '04', 1, 171),
(1697, 'PUTINA', '01', 1, 172),
(1698, 'ANANEA', '02', 1, 172),
(1699, 'PEDRO VILCA APAZA', '03', 1, 172),
(1700, 'QUILCAPUNCU', '04', 1, 172),
(1701, 'SINA', '05', 1, 172),
(1702, 'JULIACA', '01', 1, 173),
(1703, 'CABANA', '02', 1, 173),
(1704, 'CABANILLAS', '03', 1, 173),
(1705, 'CARACOTO', '04', 1, 173),
(1706, 'SANDIA', '01', 1, 174),
(1707, 'CUYOCUYO', '02', 1, 174),
(1708, 'LIMBANI', '03', 1, 174),
(1709, 'PATAMBUCO', '04', 1, 174),
(1710, 'PHARA', '05', 1, 174),
(1711, 'QUIACA', '06', 1, 174),
(1712, 'SAN JUAN DEL ORO', '07', 1, 174),
(1713, 'YANAHUAYA', '08', 1, 174),
(1714, 'ALTO INAMBARI', '09', 1, 174),
(1715, 'SAN PEDRO DE PUTINA PUNCO', '10', 1, 174),
(1716, 'YUNGUYO', '01', 1, 175),
(1717, 'ANAPIA', '02', 1, 175),
(1718, 'COPANI', '03', 1, 175),
(1719, 'CUTURAPI', '04', 1, 175),
(1720, 'OLLARAYA', '05', 1, 175),
(1721, 'TINICACHI', '06', 1, 175),
(1722, 'UNICACHI', '07', 1, 175),
(1723, 'MOYOBAMBA', '01', 1, 176),
(1724, 'CALZADA', '02', 1, 176),
(1725, 'HABANA', '03', 1, 176),
(1726, 'JEPELACIO', '04', 1, 176),
(1727, 'SORITOR', '05', 1, 176),
(1728, 'YANTALO', '06', 1, 176),
(1729, 'BELLAVISTA', '01', 1, 177),
(1730, 'ALTO BIAVO', '02', 1, 177),
(1731, 'BAJO BIAVO', '03', 1, 177),
(1732, 'HUALLAGA', '04', 1, 177),
(1733, 'SAN PABLO', '05', 1, 177),
(1734, 'SAN RAFAEL', '06', 1, 177),
(1735, 'SAN JOSÉ DE SISA', '01', 1, 178),
(1736, 'AGUA BLANCA', '02', 1, 178),
(1737, 'SAN MARTÍN', '03', 1, 178),
(1738, 'SANTA ROSA', '04', 1, 178),
(1739, 'SHATOJA', '05', 1, 178),
(1740, 'SAPOSOA', '01', 1, 179),
(1741, 'ALTO SAPOSOA', '02', 1, 179),
(1742, 'EL ESLABÓN', '03', 1, 179),
(1743, 'PISCOYACU', '04', 1, 179),
(1744, 'SACANCHE', '05', 1, 179),
(1745, 'TINGO DE SAPOSOA', '06', 1, 179),
(1746, 'LAMAS', '01', 1, 180),
(1747, 'ALONSO DE ALVARADO', '02', 1, 180),
(1748, 'BARRANQUITA', '03', 1, 180),
(1749, 'CAYNARACHI', '04', 1, 180),
(1750, 'CUÑUMBUQUI', '05', 1, 180),
(1751, 'PINTO RECODO', '06', 1, 180),
(1752, 'RUMISAPA', '07', 1, 180),
(1753, 'SAN ROQUE DE CUMBAZA', '08', 1, 180),
(1754, 'SHANAO', '09', 1, 180),
(1755, 'TABALOSOS', '10', 1, 180),
(1756, 'ZAPATERO', '11', 1, 180),
(1757, 'JUANJUÍ', '01', 1, 181),
(1758, 'CAMPANILLA', '02', 1, 181),
(1759, 'HUICUNGO', '03', 1, 181),
(1760, 'PACHIZA', '04', 1, 181),
(1761, 'PAJARILLO', '05', 1, 181),
(1762, 'PICOTA', '01', 1, 182),
(1763, 'BUENOS AIRES', '02', 1, 182),
(1764, 'CASPISAPA', '03', 1, 182),
(1765, 'PILLUANA', '04', 1, 182),
(1766, 'PUCACACA', '05', 1, 182),
(1767, 'SAN CRISTÓBAL', '06', 1, 182),
(1768, 'SAN HILARIÓN', '07', 1, 182),
(1769, 'SHAMBOYACU', '08', 1, 182),
(1770, 'TINGO DE PONASA', '09', 1, 182),
(1771, 'TRES UNIDOS', '10', 1, 182),
(1772, 'RIOJA', '01', 1, 183),
(1773, 'AWAJUN', '02', 1, 183),
(1774, 'ELÍAS SOPLIN VARGAS', '03', 1, 183),
(1775, 'NUEVA CAJAMARCA', '04', 1, 183),
(1776, 'PARDO MIGUEL', '05', 1, 183),
(1777, 'POSIC', '06', 1, 183),
(1778, 'SAN FERNANDO', '07', 1, 183),
(1779, 'YORONGOS', '08', 1, 183),
(1780, 'YURACYACU', '09', 1, 183),
(1781, 'TARAPOTO', '01', 1, 184),
(1782, 'ALBERTO LEVEAU', '02', 1, 184),
(1783, 'CACATACHI', '03', 1, 184),
(1784, 'CHAZUTA', '04', 1, 184),
(1785, 'CHIPURANA', '05', 1, 184),
(1786, 'EL PORVENIR', '06', 1, 184),
(1787, 'HUIMBAYOC', '07', 1, 184),
(1788, 'JUAN GUERRA', '08', 1, 184),
(1789, 'LA BANDA DE SHILCAYO', '09', 1, 184),
(1790, 'MORALES', '10', 1, 184),
(1791, 'PAPAPLAYA', '11', 1, 184),
(1792, 'SAN ANTONIO', '12', 1, 184),
(1793, 'SAUCE', '13', 1, 184),
(1794, 'SHAPAJA', '14', 1, 184),
(1795, 'TOCACHE', '01', 1, 185),
(1796, 'NUEVO PROGRESO', '02', 1, 185),
(1797, 'POLVORA', '03', 1, 185),
(1798, 'SHUNTE', '04', 1, 185),
(1799, 'UCHIZA', '05', 1, 185),
(1800, 'TACNA', '01', 1, 186),
(1801, 'ALTO DE LA ALIANZA', '02', 1, 186),
(1802, 'CALANA', '03', 1, 186),
(1803, 'CIUDAD NUEVA', '04', 1, 186),
(1804, 'INCLAN', '05', 1, 186),
(1805, 'PACHIA', '06', 1, 186),
(1806, 'PALCA', '07', 1, 186),
(1807, 'POCOLLAY', '08', 1, 186),
(1808, 'SAMA', '09', 1, 186),
(1809, 'CORONEL GREGORIO ALBARRACÍN LANCHIPA', '10', 1, 186),
(1810, 'CANDARAVE', '01', 1, 187),
(1811, 'CAIRANI', '02', 1, 187),
(1812, 'CAMILACA', '03', 1, 187),
(1813, 'CURIBAYA', '04', 1, 187),
(1814, 'HUANUARA', '05', 1, 187),
(1815, 'QUILAHUANI', '06', 1, 187),
(1816, 'LOCUMBA', '01', 1, 188),
(1817, 'ILABAYA', '02', 1, 188),
(1818, 'ITE', '03', 1, 188),
(1819, 'TARATA', '01', 1, 189),
(1820, 'HÉROES ALBARRACÍN', '02', 1, 189),
(1821, 'ESTIQUE', '03', 1, 189),
(1822, 'ESTIQUE-PAMPA', '04', 1, 189),
(1823, 'SITAJARA', '05', 1, 189),
(1824, 'SUSAPAYA', '06', 1, 189),
(1825, 'TARUCACHI', '07', 1, 189),
(1826, 'TICACO', '08', 1, 189),
(1827, 'TUMBES', '01', 1, 190),
(1828, 'CORRALES', '02', 1, 190),
(1829, 'LA CRUZ', '03', 1, 190),
(1830, 'PAMPAS DE HOSPITAL', '04', 1, 190),
(1831, 'SAN JACINTO', '05', 1, 190),
(1832, 'SAN JUAN DE LA VIRGEN', '06', 1, 190),
(1833, 'ZORRITOS', '01', 1, 191),
(1834, 'CASITAS', '02', 1, 191),
(1835, 'CANOAS DE PUNTA SAL', '03', 1, 191),
(1836, 'ZARUMILLA', '01', 1, 192),
(1837, 'AGUAS VERDES', '02', 1, 192),
(1838, 'MATAPALO', '03', 1, 192),
(1839, 'PAPAYAL', '04', 1, 192),
(1840, 'CALLERIA', '01', 1, 193),
(1841, 'CAMPOVERDE', '02', 1, 193),
(1842, 'IPARIA', '03', 1, 193),
(1843, 'MASISEA', '04', 1, 193),
(1844, 'YARINACOCHA', '05', 1, 193),
(1845, 'NUEVA REQUENA', '06', 1, 193),
(1846, 'MANANTAY', '07', 1, 193),
(1847, 'RAYMONDI', '01', 1, 194),
(1848, 'SEPAHUA', '02', 1, 194),
(1849, 'TAHUANIA', '03', 1, 194),
(1850, 'YURUA', '04', 1, 194),
(1851, 'PADRE ABAD', '01', 1, 195),
(1852, 'IRAZOLA', '02', 1, 195),
(1853, 'CURIMANA', '03', 1, 195),
(1854, 'NESHUYA', '04', 1, 195),
(1855, 'ALEXANDER VON HUMBOLDT', '05', 1, 195),
(1856, 'PURUS', '01', 1, 196);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE `documentos` (
  `id` varchar(2) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `documentos`
--

INSERT INTO `documentos` (`id`, `nombre`, `estado`) VALUES
('1', 'DNI', 1),
('4', 'CARNET DE EXTRANJERIA', 1),
('7', 'PASAPORTE', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `id` int(2) NOT NULL,
  `razon` varchar(70) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nosotros` longtext DEFAULT NULL,
  `preguntas` longtext DEFAULT NULL,
  `terminos` longtext DEFAULT NULL,
  `politicas` longtext DEFAULT NULL,
  `baselegales` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`id`, `razon`, `direccion`, `telefono`, `email`, `nosotros`, `preguntas`, `terminos`, `politicas`, `baselegales`) VALUES
(1, 'La Tienda', 'AV. universitaria 123', '1231234', 'ventas@tienda.pe', '<h2>Historia de Topitop</h2>\r\n\r\n<p>se puede resumir en las siguientes palabras:&nbsp;Dedicaci&oacute;n, perseverancia e Ingenio.</p>\r\n\r\n<p>Conocer la historia de los Hermanos Flores y de los miles de peruanos que brindaron su talento y capacidad en los primeros talleres de confecci&oacute;n textil, ahora convertidos en nuestra organizaci&oacute;n, es motivo de orgullo y nos complace contarla al mundo.</p>\r\n\r\n<h3>1960</h3>\r\n\r\n<p>Los Hermanos Flores sufren la temprana p&eacute;rdida de su padre. En medio del dolor y la necesidad de resolver el sustento de la familia ante las escasas oportunidades de su medio, deciden emigrar a otras ciudades. Manuel Flores viaja a Lima con el firme prop&oacute;sito de destacar como mec&aacute;nico industrial. Por su parte, Aquilino Flores de 12 a&ntilde;os viaja a Pisco, donde trabaj&oacute; en el apa&ntilde;amiento del algod&oacute;n. Llega a la capital y se inicia en la comercializaci&oacute;n de prendas de vestir en las calles de Lima.</p>\r\n\r\n<p><img src=\"https://www.topitop.pe/arquivos/topitop_history.jpg?v=637236828036130000\" /></p>\r\n\r\n<p>01 de enero de 1960</p>\r\n\r\n<h3>1970</h3>\r\n\r\n<p>Los Hermanos Flores combinan sus habilidades, adquieren m&aacute;quinas de coser, implementando un taller de confecciones e invitan a sus hermanos a iniciarse en las actividades de la industria textil. Con los a&ntilde;os expanden su actividad comercial y se implementan nuevos talleres de confecci&oacute;n. Comienza el abastecimiento de tiendas a terceros.</p>\r\n\r\n<p><img src=\"https://www.topitop.pe/arquivos/60.jpg?v=637236850080800000\" /></p>\r\n\r\n<p>01 de enero de 1970</p>\r\n\r\n<h3>1980</h3>\r\n\r\n<p>A inicios de los a&ntilde;os 80 el crecimiento contin&uacute;a en medio de los conflictos sociales de la &eacute;poca. Se incorpora el proceso de tejido y estampado como actividades de la empresa.</p>\r\n\r\n<p><img src=\"https://www.topitop.pe/arquivos/60.jpg?v=637236850080800000\" /></p>\r\n\r\n<p>01 de enero de 1980</p>\r\n\r\n<h3>1983</h3>\r\n\r\n<p>Nace la empresa Topy Top S.A. Expansi&oacute;n de actividades comerciales tanto en Lima como en las principales capitales de las provincias del Per&uacute;.</p>\r\n\r\n<p><img src=\"https://www.topitop.pe/arquivos/1983.jpg?v=637236850767500000\" /></p>\r\n\r\n<p>01 de enero de 1983</p>\r\n\r\n<h3>1986</h3>\r\n\r\n<p>Se inaugura la primera tienda Topy Top en Lima. Luego le siguen las tiendas en Trujillo, Arequipa, Piura, entre otras; reemplazando la venta v&iacute;a concesionarios.</p>\r\n\r\n<p><img src=\"https://www.topitop.pe/arquivos/1986.jpg?v=637236852723670000\" /></p>\r\n\r\n<p>01 de enero de 1986</p>\r\n\r\n<h3>1995</h3>\r\n\r\n<p>Se implementa la planta modelo para exportaciones en Z&aacute;rate hacia Argentina, Paraguay, Chile, Brasil, Ecuador y Colombia. Se inician las operaciones de tintorer&iacute;a de hilos y telas en nuestros procesos.</p>\r\n\r\n<p><img src=\"https://www.topitop.pe/arquivos/1995.jpg?v=637236853324230000\" /></p>\r\n\r\n<p>01 de enero de 1995</p>\r\n\r\n<h3>1996</h3>\r\n\r\n<p>Comienzan las primeras exportaciones utilizando el sistema Full Package.</p>\r\n\r\n<p><img src=\"https://www.topitop.pe/arquivos/60.jpg?v=637236850080800000\" /></p>\r\n\r\n<p>01 de enero de 1996</p>\r\n\r\n<h3>2000</h3>\r\n\r\n<p>Se crea la empresa Inka Knit S.A. para la manufactura del mercado local y se funda la empresa Express Jeans CO S.A. para el mercado exportaci&oacute;n.</p>\r\n\r\n<p><img src=\"https://www.topitop.pe/arquivos/60.jpg?v=637236850080800000\" /></p>\r\n\r\n<p>01 de enero de 2000</p>\r\n\r\n<h3>2001</h3>\r\n\r\n<p>Nacimiento del brazo Retail: La empresa comercializadora Trading Fashion Line para el mercado nacional y venezolano. Avance de la divisi&oacute;n Retail con la apertura de tiendas a nivel Local y en el exterior.</p>\r\n\r\n<p><img src=\"https://www.topitop.pe/arquivos/2001.jpg?v=637236854601000000\" /></p>\r\n\r\n<p>01 de enero de 2001</p>\r\n\r\n<h3>2003</h3>\r\n\r\n<p>Topitop recibe el nombramiento de Gran Comendador de la Orden de Trabajo, otorgado por el Ministerio de Trabajo y Promoci&oacute;n del empleo. Se obtiene la Certificaci&oacute;n de calidad ISO 9001 &ndash; 2000 para nuestras plantas y procesos industriales.</p>\r\n\r\n<p><img src=\"https://www.topitop.pe/arquivos/2003.jpg?v=637236855398000000\" /></p>\r\n\r\n<p>01 de enero de 2003</p>\r\n\r\n<h3>2005</h3>\r\n\r\n<p>Nos convertimos en el primer exportador de productos textiles y confecciones del Per&uacute;.</p>\r\n\r\n<p><img src=\"https://www.topitop.pe/arquivos/2005.jpg?v=637236856208130000\" /></p>\r\n\r\n<p>01 de enero de 2005</p>\r\n\r\n<h3>2006</h3>\r\n\r\n<p>Expandimos nuestra actividad Retail en Venezuela y Colombia.</p>\r\n\r\n<p><img src=\"https://www.topitop.pe/arquivos/2006.jpg?v=637236856977130000\" /></p>\r\n\r\n<p>01 de enero de 2006</p>\r\n\r\n<h3>2007</h3>\r\n\r\n<p>Cambio de identidad corporativa y marca comercial: Topy Top a Topitop.</p>\r\n\r\n<p><img src=\"https://www.topitop.pe/arquivos/2007.jpg?v=637236857422030000\" /></p>\r\n\r\n<p>01 de enero de 2007</p>\r\n\r\n<h3>2008</h3>\r\n\r\n<p>Implementaci&oacute;n de Gesti&oacute;n base SAP</p>\r\n\r\n<p><img src=\"https://www.topitop.pe/arquivos/2008.jpg?v=637236858149670000\" /></p>\r\n\r\n<p>01 de enero de 2008</p>\r\n\r\n<h3>2009</h3>\r\n\r\n<p>Obtenci&oacute;n de certificaci&oacute;n BASC y de la Asociaci&oacute;n de Buenos Empleadores (ABE). Apertura de planta textil en Lur&iacute;n e inicio de operaciones de hilatura a partir de fibras de algod&oacute;n.</p>\r\n\r\n<p><img src=\"https://www.topitop.pe/arquivos/2009_2.jpg?v=637236864947570000\" /></p>\r\n\r\n<p>01 de enero de 2009</p>\r\n\r\n<h3>2011</h3>\r\n\r\n<p>Se publica un art&iacute;culo period&iacute;stico de relevancia mundial en el Wall Street Journal de EEUU, sobre la vida y la historia de &eacute;xito de los hermanos Flores y el ascenso de Topitop en la clase media peruana.</p>\r\n\r\n<p><img src=\"https://www.topitop.pe/arquivos/2011.jpg?v=637236860157670000\" /></p>\r\n\r\n<p>01 de enero de 2011</p>\r\n\r\n<p>&lsaquo;&rsaquo;</p>', '<h2>FAQ - Order, Shipping, Etc.</h2>\r\n\r\n<ul>\r\n	<li>\r\n	<h2>When will my order arrive?</h2>\r\n\r\n	<p>Shipping time is set by our delivery partners, according to the delivery method chosen by you. Additional details can be found in the order confirmation</p>\r\n	</li>\r\n	<li>\r\n	<h2>How do I track my order?</h2>\r\n\r\n	<p>Once shipped, you&rsquo;ll get a confirmation email that includes a tracking number and additional information regarding tracking your order.</p>\r\n	</li>\r\n	<li>\r\n	<h2>What&rsquo;s your return policy?</h2>\r\n\r\n	<p>We allow the return of all items within 30 days of your original order&rsquo;s date. If you&rsquo;re interested in returning your items, send us an email with your order number and we&rsquo;ll ship a return label.</p>\r\n	</li>\r\n	<li>\r\n	<h2>How do I make changes to an existing order?</h2>\r\n\r\n	<p>Changes to an existing order can be made as long as the order is still in &ldquo;processing&rdquo; status. Please contact our team via email and we&rsquo;ll make sure to apply the needed changes. If your order has already been shipped, we cannot apply any changes to it. If you are unhappy with your order when it arrives, please contact us for any changes you may require.</p>\r\n	</li>\r\n	<li>\r\n	<h2>What shipping options do you have?</h2>\r\n\r\n	<p>For USA domestic orders we offer FedEx and USPS shipping.</p>\r\n	</li>\r\n	<li>\r\n	<h2>What payment methods do you accept?</h2>\r\n\r\n	<p>Any method of payments acceptable by you. For example: We accept MasterCard, Visa, American Express, PayPal, JCB Discover, Gift Cards, etc.</p>\r\n	</li>\r\n</ul>', '<h2>1.- REGISTRO DEL USUARIO O CLIENTE</h2>\r\n\r\n<p>Para el registro, el cliente debe proporcionar sus datos de identificaci&oacute;n fidedignos y necesarios (como nombre completo, n&uacute;mero de documento oficial de identidad, direcci&oacute;n domiciliaria, correo electr&oacute;nico y tel&eacute;fonos) los cuales podr&aacute;n ser validados posteriormente.</p>\r\n\r\n<p>El usuario inscrito en Tienda Online Topitop puede disponer la rectificaci&oacute;n, actualizaci&oacute;n, eliminaci&oacute;n y/o cancelaci&oacute;n de sus datos cuando lo estime conveniente. En todo caso, los datos podr&aacute;n ser cedidos o comunicados a empresas relacionadas, para la comercializaci&oacute;n de los productos y servicios distribuidos o prestados.</p>\r\n\r\n<p>Para comprar productos en el sitio, no es necesario estar registrado. El registro de cada usuario se verificar&aacute; completando y suscribiendo el formulario que aparece en el sitio y su posterior env&iacute;o, el cual se realiza autom&aacute;ticamente mediante un &quot;clic&quot; en el elemento respectivo. Los datos necesarios para el registro son los siguientes: Nombre, Apellidos, Email, Clave, Tipo de documento, N&uacute;mero de documento y Celular. Para acceder al registro del usuario, se deber&aacute;n aceptar los t&eacute;rminos y condiciones de la web, as&iacute; como la Pol&iacute;tica de Protecci&oacute;n Tratamiento de Datos Personales de Topitop. En caso de no registrarse, el usuario deber&aacute; completar los datos que se indican en el formulario de compra con el fin de hacer efectiva la adquisici&oacute;n de productos o servicios.</p>\r\n\r\n<p>Los usuarios que se registren no tendr&aacute;n que ingresar sus datos por cada compra posterior que realicen. Topitop utilizar&aacute; los datos de los usuarios que no se registren exclusivamente para los fines de compra que realice el usuario, sin realizar otro tipo de tratamiento de sus datos personales.</p>\r\n\r\n<h2>2.- CLAVE SECRETA</h2>\r\n\r\n<p>El usuario dispondr&aacute;, una vez registrado, de un correo y contrase&ntilde;a o clave definitiva que le permitir&aacute; el acceso personalizado, confidencial y seguro. El usuario tendr&aacute; la posibilidad de cambiar la clave de acceso, para lo cual deber&aacute; sujetarse al procedimiento establecido en el sitio respectivo. El usuario asume totalmente la responsabilidad por el mantenimiento de la confidencialidad de su clave secreta registrada en este sitio web, la cual le permite efectuar compras, solicitar servicios y obtener informaci&oacute;n. Dicha clave es de uso personal y su entrega a terceros, no involucra responsabilidad de Trading Fashion Line S.A.</p>\r\n\r\n<h2>3.- DERECHOS DEL USUARIO DE ESTE SITIO</h2>\r\n\r\n<p>El usuario gozar&aacute; de todos los derechos que le reconoce la legislaci&oacute;n sobre protecci&oacute;n al consumidor vigente en el territorio de Per&uacute;, y adem&aacute;s los que se le otorgan en estos t&eacute;rminos y condiciones. La sola visita de este sitio en el cual se ofrecen determinados bienes y el acceso a determinados servicios, no impone al consumidor obligaci&oacute;n alguna, a menos que haya aceptado en forma inequ&iacute;voca las condiciones ofrecidas por Topitop, en la forma indicada en estos T&eacute;rminos y condiciones, y Protecci&oacute;n de Datos Personales.</p>\r\n\r\n<h2>4.- PROCEDIMIENTO PARA HACER USO DE ESTE SITIO</h2>\r\n\r\n<p>En los contratos ofrecidos por medio de este sitio, Topitop informar&aacute;, de manera inequ&iacute;voca y f&aacute;cilmente accesible, los pasos que deben seguirse para celebrarlos.</p>\r\n\r\n<h2>5.- MEDIOS DE PAGOS QUE SE PODR&Aacute;N UTILIZAR EN ESTE SITIO</h2>\r\n\r\n<p>Los productos y servicios ofrecidos en este sitio, salvo que se se&ntilde;ale una forma diferente de pago para casos particulares u ofertas de determinados bienes o servicios, podr&aacute;n ser cancelados utilizando los siguientes medios de pago permitidos en este sitio:</p>\r\n\r\n<ul>\r\n	<li>Tarjetas de D&eacute;bito*</li>\r\n	<li>Tarjeta de Cr&eacute;dito &Uacute;NICA**</li>\r\n	<li>Otras tarjetas de cr&eacute;dito Visa, MasterCard, American Express y Diners Club, emitidas en Per&uacute; o en el extranjero siempre que mantengan un contrato vigente para tales efectos con Topitop. El uso de las tarjetas singularizadas precedentemente, se sujetar&aacute; a lo establecido en estos T&eacute;rminos y Condiciones y en relaci&oacute;n con su emisor, y a lo pactado en los respectivos Contratos de Apertura y Reglamento de Uso. En caso de contradicci&oacute;n, predominar&aacute; lo expresado en ese &uacute;ltimo instrumento. Trat&aacute;ndose de las tarjetas bancarias aceptadas en este sitio, los aspectos relativos a &eacute;stas, tales como la fecha de emisi&oacute;n, caducidad, cupo, bloqueos, clave secreta, plazos para hacer efectivas las devoluciones, extornos o anulaciones etc., se regir&aacute;n por el respectivo Contrato de Apertura y Reglamento de Uso, de tal forma que Topitop no tendr&aacute; responsabilidad en cualquiera de los aspectos se&ntilde;alados. El sitio podr&aacute; indicar determinadas condiciones de compra seg&uacute;n el medio de pago que utilice el usuario.</li>\r\n	<li>Pago en Agencias y Agentes Bancarios***: Es un medio de pago donde el cliente hace la reserva de su solicitud de compra y se le genera un cup&oacute;n de pao con el cual deber&aacute; acercarse a cualquiera de los establecimientos o agencias afiliados(as) a la empresa &ldquo;PagoEfectivo&rdquo; y realizar el pago del cup&oacute;n antes de la fecha de vencimiento indicado en el cup&oacute;n o en caso contrario se cancelar&aacute; la solicitud de compra realizada. Los establecimientos/plataformas afiliados(as) donde el cliente podr&aacute; realizar el pago de su cup&oacute;n son los bancos BBVA Continental (Banca por Internet, Agencia, Agente Express y Agente KASNET), Banco de Cr&eacute;dito del Per&uacute; BCP (Banca por internet, Agencias BCP y Agente BCP), Scotiabank (Banca por Internet, Agencia y Cajeros Express), Interbank (Banca por Internet, Agencia, Cajeros Global Net, Tiendas y Money Market Interbank), Agencias Western Union y establecimientos afiliados a Pago Efectivo y Full Carga. Para las devoluciones de dinero por pagos hechos con Pago En Agencias, por compras menores a S/. 300.00 (trescientos nuevos soles) se podr&aacute;n canjear por dinero en Efectivo en cualquiera de las tiendas Topitop. Para compras iguales o mayores a S/. 300.00 (trescientos nuevos soles) la devoluci&oacute;n se har&aacute; mediante un dep&oacute;sito a una cuenta corriente.</li>\r\n	<li>* El pago con tarjeta de d&eacute;bito se rige por los t&eacute;rminos y condiciones establecidos por la entidad bancaria emisora de la referida tarjeta.</li>\r\n</ul>\r\n\r\n<p>El pago en cuotas est&aacute; disponible para todas las tarjetas de cr&eacute;dito.</p>\r\n\r\n<h2>6.- TIPOS DE DEVOLUCIONES Y PROCESOS PARA LAS DEVOLUCIONES</h2>\r\n\r\n<p><strong>Devoluci&oacute;n extorno tarjetas:</strong></p>\r\n\r\n<p>Debes contactarse con nosotros a trav&eacute;s del correo de atenci&oacute;n al cliente:&nbsp;<a href=\"mailto:atencionalcliente@topitop.com.pe\">atencionalcliente@topitop.com.pe</a>, nuestra atenci&oacute;n es de lunes a viernes de 9:00am &ndash; 6:00pm, nuestro tiempo de respuesta es m&aacute;ximo de 72 horas h&aacute;biles. Indicarnos que desea la devoluci&oacute;n de dinero de la compra realizada. Le enviaremos un correo indic&aacute;ndole el proceso de devoluci&oacute;n, donde se detalla lo siguiente:</p>\r\n\r\n<p>Para proceder con la devoluci&oacute;n de su dinero y la anulaci&oacute;n de su pedido, es importante que tenga claro que la devoluci&oacute;n la haremos de manera autom&aacute;tica a trav&eacute;s de nuestra plataforma de pago y le enviaremos el soporte de dicho reembolso, en un plazo de 72 horas, sin embargo, el tiempo de devoluci&oacute;n o abono en su cuenta o tarjeta de cr&eacute;dito depender&aacute; de su entidad bancaria. PayU indica que, en un lapso de 15 a 25 d&iacute;as h&aacute;biles, usted podr&aacute; visualizar el abono en su cuenta o tarjeta de cr&eacute;dito, de acuerdo al medio de pago que usted utilizo, una vez nos confirme deseo de proceder con la devoluci&oacute;n de acuerdo a lo detallado, procederemos con la anulaci&oacute;n y devoluci&oacute;n de su dinero, adjuntaremos el comprobante de devoluci&oacute;n, el cual le servir&aacute; en caso de no visualizar el monto en el lapso indicado.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Devoluci&oacute;n pago efectivo:</strong></p>\r\n\r\n<p>Debes contactarse con nosotros a trav&eacute;s del correo de atenci&oacute;n al cliente:&nbsp;<a href=\"mailto:atencionalcliente@topitop.com.pe\">atencionalcliente@topitop.com.pe</a>, nuestra atenci&oacute;n es de lunes a viernes de 9:00am &ndash; 6:00pm, nuestro tiempo de respuesta es m&aacute;ximo de 72 horas h&aacute;biles. Indicarnos que desea la devoluci&oacute;n de dinero de la compra realizada. Le enviaremos un correo indic&aacute;ndole el proceso de devoluci&oacute;n, donde se detalla lo siguiente:</p>\r\n\r\n<p>Para proceder con la devoluci&oacute;n de su dinero necesitaremos nos env&iacute;a la informaci&oacute;n que a continuaci&oacute;n se detalla:</p>\r\n\r\n<ul>\r\n	<li>N&deg; de pedido</li>\r\n	<li>Nombres y Apellidos del titular de la cuenta</li>\r\n	<li>Dni</li>\r\n	<li>Correo</li>\r\n	<li>Nombre del Banco</li>\r\n	<li>Tipo de cuenta</li>\r\n	<li>N&deg; de Cta</li>\r\n	<li>C&oacute;digo de cuenta Interbancario (CCI)</li>\r\n	<li>Direcci&oacute;n</li>\r\n	<li>N&deg; de Tel&eacute;fono</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>El abono se realizar&aacute; en un m&aacute;ximo de 30 d&iacute;as h&aacute;biles, contados a partir del siguiente d&iacute;a h&aacute;bil de recibida la informaci&oacute;n solicitada.</p>\r\n\r\n<h2>7.- FORMACI&Oacute;N DEL CONSENTIMIENTO EN LOS CONTRATOS CELEBRADOS A TRAV&Eacute;S DE ESTE SITIO</h2>\r\n\r\n<p>A trav&eacute;s de este sitio web la empresa realizar&aacute; ofertas de bienes y servicios, que podr&aacute;n ser aceptadas a trav&eacute;s de la aceptaci&oacute;n por v&iacute;a electr&oacute;nica o telef&oacute;nica, y utilizando los mecanismos que el mismo sitio ofrece para ello. En atenci&oacute;n a lo expuesto, cuando el Usuario ingrese a la secci&oacute;n &ldquo;Bolsa de Compras&rdquo; y le d&eacute; &ldquo;click&rdquo; al bot&oacute;n &ldquo;Procesar Compra&rdquo;, esta acci&oacute;n implica que el Usuario ha enviado a Topitop una Solicitud de Compra la cual estar&aacute; sujeta a validaci&oacute;n por parte de Topitop. En efecto, toda aceptaci&oacute;n de compra quedar&aacute; sujeta a la condici&oacute;n suspensiva de que Topitop valide la solicitud de compra. As&iacute; pues, luego de que el Usuario env&iacute;e su Solicitud de Compra a Topitop, la misma le enviar&aacute; un correo electr&oacute;nico al Usuario indicando que la Solicitud de Compra que ha realizado en la Web se encuentra en proceso de validaci&oacute;n. En consecuencia, para toda operaci&oacute;n que se efect&uacute;e en este sitio, la confirmaci&oacute;n y/o validaci&oacute;n o verificaci&oacute;n por parte de Topitop, ser&aacute; requisito esencial para la formaci&oacute;n del consentimiento.</p>\r\n\r\n<p>Para validar la solicitud de compra, Topitop deber&aacute; verificar lo siguiente:</p>\r\n\r\n<ul>\r\n	<li>Confirmar el precio del art&iacute;culo de la orden. A pesar de nuestros mejores esfuerzos, de manera excepcional es posible que el precio de alguno de los productos ofrecidos en nuestra Tienda Online sea err&oacute;neo, por ello si el precio correcto del producto consignado en su solicitud de compra es m&aacute;s alto que el precio indicado en nuestra Tienda Online, nosotros nos contactaremos con usted en un plazo de 3 d&iacute;as &uacute;tiles para informarle este hecho a fin de que usted nos indique si procedemos con su env&iacute;o teniendo como precio de venta el correcto o si cancelamos su orden.</li>\r\n	<li>Que el medio de pago utilizado por el usuario es v&aacute;lido y aceptado.</li>\r\n	<li>Que los datos registrados por el cliente en el sitio coinciden con los proporcionados al efectuar su aceptaci&oacute;n de oferta.</li>\r\n	<li>Que dispone de los productos solicitados en stock.</li>\r\n</ul>\r\n\r\n<p>La etapa de validaci&oacute;n concluye con la emisi&oacute;n del correo de confirmaci&oacute;n de pedido por parte de Topitop.pe.</p>\r\n\r\n<p>&Uacute;nicamente luego de validada la Solicitud de Compra, los fondos previamente reservados ser&aacute;n definitivamente cargados a la tarjeta de cr&eacute;dito o debitados de la tarjeta d&eacute;bito del Usuario. Topitop se reserva el derecho de poder cambiar el estado de la orden en cualquier momento, siempre que se evidencie alg&uacute;n fraude en contra del titular de la compra o se produzca un error sist&eacute;mico que distorsione el precio de las ofertas.</p>\r\n\r\n<p>Concluida la validaci&oacute;n, Topitop contactar&aacute; al usuario telef&oacute;nicamente o, por correo electr&oacute;nico o utilizar&aacute; cualquier medio de comunicaci&oacute;n que garantice el debido y oportuno conocimiento del consumidor, el que se le indicar&aacute; previamente en el mismo sitio, a fin de informarle el resultado de la misma. El consentimiento se entender&aacute; formado desde el momento en que Topitop concluya con &eacute;xito la validaci&oacute;n e informe de la misma al usuario.</p>\r\n\r\n<p>En atenci&oacute;n a lo se&ntilde;alado en los p&aacute;rrafos precedentes, y como una medida de protecci&oacute;n a la seguridad de las transacciones, Topitop podr&aacute; dejar sin efecto las compras en las que los datos entregados por el cliente no coincidan con las bases de datos disponibles de Topitop, o respecto de las cuales no se hubiere efectuado la validaci&oacute;n se&ntilde;alada precedentemente dentro de las 48 horas siguientes a la solicitud de compra. Esto es, si fuese necesario contactar al titular de una cuenta, y pasadas las 48 horas siguientes a la solicitud de compra no fuese posible, Topitop dejar&aacute; sin efecto dicha transacci&oacute;n (esto como medida de seguridad para el cliente), procediendo a comunicar este hecho al Banco emisor de la tarjeta de cr&eacute;dito, d&eacute;bito utilizada por el consumidor al momento de enviar su solicitud de compra. El Banco emisor de la tarjeta de cr&eacute;dito, d&eacute;bito, que se utiliz&oacute; para realizar la solicitud de compra en el sitio deber&aacute; proceder con la devoluci&oacute;n del importe de acuerdo con sus Pol&iacute;ticas.</p>\r\n\r\n<h2>8.- DESPACHO DE LOS PRODUCTOS</h2>\r\n\r\n<p>Los productos adquiridos a trav&eacute;s de la p&aacute;gina web se sujetar&aacute;n a las condiciones de despacho y entrega elegidas por el cliente y disponibles en el Sitio. La informaci&oacute;n del lugar de env&iacute;o es de exclusiva responsabilidad del cliente. Por lo que ser&aacute; de tu responsabilidad la exactitud de los datos indicados para realizar una correcta y oportuna entrega de los productos a tu domicilio o direcci&oacute;n de env&iacute;o. Si hubiera alg&uacute;n error en la direcci&oacute;n, tu producto podr&iacute;a no llegar en la fecha indicada.</p>\r\n\r\n<p>Los plazos para el despacho y entrega, se cuentan desde el d&iacute;a posterior a la validaci&oacute;n de la compra y el medio de pago utilizado, es decir desde la emisi&oacute;n del comprobante de compra, consider&aacute;ndose d&iacute;as h&aacute;biles para el cumplimiento de dicho plazo.</p>\r\n\r\n<p>El Usuario s&oacute;lo podr&aacute; solicitar el cambio de direcci&oacute;n antes de recibir el correo con el comprobante de compra de Topitop, si en caso el cliente no ha ingresado la direcci&oacute;n correcta al momento de realizar la compra y el pago ya se encuentra confirmado, el cliente tendr&iacute;a que solicitar a Topitop la cancelaci&oacute;n de la compra inicial y crear una nueva con la direcci&oacute;n correcta, teniendo en cuenta que la venta y despacho de los productos est&aacute; condicionada a su disponibilidad, nuevo precio del producto, los nuevos plazos de entrega, establecidos por Topitop y los costos asociados a esta nueva direcci&oacute;n.</p>\r\n\r\n<p>Topitop no incurrir&aacute; en responsabilidad si por caso fortuito, fuerza mayor y/o desastres naturales Topitop o la empresa que contrate para el servicio de Courier no entregase el producto en la fecha acordada con el cliente.</p>\r\n\r\n<p>En caso no se logre realizar la entrega en la fecha programada, por responsabilidad del cliente, Topitop reprogramar&aacute; la entrega una (1) vez m&aacute;s previo acuerdo con el cliente. En caso no se culmine el proceso de entrega en el segundo intento, por responsabilidad del cliente, el pedido retornar&aacute; a nuestro Centro de Distribuci&oacute;n, donde estar&aacute; un lapso de 7 d&iacute;as h&aacute;biles. Si el cliente se comunica en ese lapso de tiempo, el env&iacute;o se reprogramar&aacute; a una de nuestras tiendas a nivel nacional, escogida por el cliente sin costo adicional. El cobro por el env&iacute;o a domicilio no se podr&aacute; devolver al cliente, ya Topitop cumpli&oacute; con las visitas.</p>\r\n\r\n<p>Si el cliente solicita se le env&iacute;e a su domicilio deber&aacute; cubrir el costo de env&iacute;o nuevamente.</p>\r\n\r\n<p>De no tener una comunicaci&oacute;n con el cliente en el tiempo mencionado, se proceder&aacute; con la anulaci&oacute;n de compra y devoluci&oacute;n/liberaci&oacute;n de los fondos al medio de pago utilizado, previa validaci&oacute;n y coordinaci&oacute;n con el cliente.</p>\r\n\r\n<p>La fecha estimada de entrega es referencial; es posible que el pedido llegue antes del d&iacute;a indicado. Agradecemos que el cliente est&eacute; atento a SMS y llamadas que pueda realizar la empresa de Courier, para coordinar las entregas.</p>\r\n\r\n<h2>9.- PLAZO DE VALIDEZ DE LA OFERTA Y PRECIO</h2>\r\n\r\n<p>El plazo de validez de la oferta es aquel que coincide con la fecha de vigencia indicada en la promoci&oacute;n o en virtud del agotamiento de las cantidades de productos disponibles para esa promoci&oacute;n debidamente informados al Usuario, o mientras la oferta se mantenga disponible, el menor de estos plazos. Cuando quiera que en una promoci&oacute;n no se indique una fecha de terminaci&oacute;n se entender&aacute; que la actividad se extender&aacute; hasta el agotamiento de los inventarios correspondientes.</p>\r\n\r\n<p>Los precios de los productos y servicios disponibles en el Sitio, mientras aparezcan como disponibles, solo tendr&aacute;n vigencia y aplicaci&oacute;n en &eacute;ste y no ser&aacute;n aplicables a otros canales de venta utilizados por las empresas, tales como, cat&aacute;logos o en tiendas f&iacute;sicas. Los precios de los productos ofrecidos en el Sitio est&aacute;n expresados en Soles. Los precios ofrecidos corresponden exclusivamente al valor del bien ofrecido y no incluyen gastos de transporte, manejo, env&iacute;o, accesorios que no se describan expresamente ni ning&uacute;n otro &iacute;tem adicional o cobro de intereses bancarios por el m&eacute;todo de pago utilizado.</p>\r\n\r\n<p>Adicionalmente, es posible que cierto n&uacute;mero de productos puedan tener un precio incorrecto. De existir un error tipogr&aacute;fico en alguno de los precios de los productos, si el precio correcto del art&iacute;culo es m&aacute;s alto que el que figura en la p&aacute;gina, a nuestra discreci&oacute;n, TOPITOP lo contactar&aacute; antes de que el producto sea enviado, y/o cancelaremos el pedido y le notificaremos acerca de la cancelaci&oacute;n. En este caso el cliente podr&aacute; contar con un saldo a favor o Nota de Cr&eacute;dito para futuras compras en Topitop o solicitar el reembolso de su dinero correspondiente al m&eacute;todo de pago utilizado.</p>\r\n\r\n<p>Topitop podr&aacute; modificar cualquier informaci&oacute;n contenida en este Sitio, incluyendo las relacionadas con mercader&iacute;as, servicios, precios, existencias y condiciones, en cualquier momento y sin previo aviso; caso contrario se informar&aacute; a todos los clientes o clientes afectados sobre las modificaciones de informaci&oacute;n relevantes; la expedici&oacute;n de correo correspondiente a la compra de un producto no genera aceptaci&oacute;n u obligaci&oacute;n confirmatoria de una determinada transacci&oacute;n.</p>\r\n\r\n<h2>10.- VENTA CON RETIRO EN TIENDA</h2>\r\n\r\n<p>La venta con Retiro en Tienda permite a nuestros clientes adquirir los productos ofrecidos en nuestra Tienda Online y recogerlos en cualquiera de nuestras tiendas habilitadas a nivel nacional. Se aplica a esta modalidad de venta las condiciones previstas en los puntos anteriores. Asimismo, se aplican las siguientes condiciones:</p>\r\n\r\n<ul>\r\n	<li>El cliente debe ingresar su solicitud de compra, la cual deber&aacute; pasar por el proceso de validaci&oacute;n. Dicha solicitud de compra deber&aacute; contener el nombre de la persona que retirar&aacute; el producto de la tienda y su n&uacute;mero de documento nacional de identidad (DNI). El producto a retirar s&oacute;lo ser&aacute; entregado a la persona que se detalla en dicha solicitud.</li>\r\n	<li>El cliente recibir&aacute; un e-mail informando que su solicitud de compra con retiro en tienda ha ingresado al proceso de validaci&oacute;n.</li>\r\n</ul>\r\n\r\n<p>Adem&aacute;s de lo previsto en el punto 6 la solicitud de compra no superar&aacute; el proceso de validaci&oacute;n si Topitop no cuenta con stock disponible de alguno de los productos detallados en la solicitud. En este caso, Topitop anular&aacute; la solicitud de compra y enviar&aacute; un e-mail al usuario informando dicha anulaci&oacute;n. Asimismo, gestionar&aacute; la devoluci&oacute;n del dinero al cliente. El per&iacute;odo de visualizaci&oacute;n de dicho monto en la cuenta del cliente variar&aacute; seg&uacute;n el banco correspondiente. Toda devoluci&oacute;n de compras con tarjetas de cr&eacute;dito o d&eacute;bito se realizar&aacute; a la misma tarjeta de la compra inicial considerando que el extorno no depende de nosotros sino del medio pago, tarjeta o entidad financiera que administre la tarjeta. En el caso de otros m&eacute;todos de pago, se podr&aacute; tramitar devoluciones en efectivo hasta un m&aacute;ximo de S/ 300.00, para montos superiores a este, se gestionar&aacute; la devoluci&oacute;n a una cuenta a nombre del titular de la compra, en ning&uacute;n caso a cuentas de terceros.</p>\r\n\r\n<p>Si la solicitud de compra supera con &eacute;xito el proceso de validaci&oacute;n, Topitop enviar&aacute; un e-mail al cliente inform&aacute;ndole que su compra ya est&aacute; lista para recojo. El cliente se obliga a retirar el/los producto(s) adquirido(s) dentro de los 5 d&iacute;as contados a partir de la recepci&oacute;n del referido e-mail; vencido dicho plazo sin que el cliente hubiese procedido a recoger el/los producto(s) por cualquiera razones, se entender&aacute; para todos los efectos y de manera irreversible que el cliente ha desistido de la compra realizada, por lo que &eacute;sta queda autom&aacute;ticamente sin valor ni efecto alguno. Topitop proceder&aacute; con la devoluci&oacute;n al cliente del importe pagado por el/los producto(s) en la transacci&oacute;n realizada v&iacute;a web y para tal efecto gestionar&aacute; con la pasarela de pago correspondiente el extorno que corresponde. El per&iacute;odo de visualizaci&oacute;n del monto extornado var&iacute;a seg&uacute;n el Banco emisor de la Tarjeta de Cr&eacute;dito. El cliente declara que ha sido expresamente informado de los alcances de esta condici&oacute;n, acept&aacute;ndose sin restricci&oacute;n alguna y bajo su entera responsabilidad.</p>\r\n\r\n<ul>\r\n	<li>La persona que recoja la mercader&iacute;a deber&aacute; acercarse con su documento de identidad y con el n&uacute;mero de pedido.</li>\r\n	<li>El producto estar&aacute; listo para que el cliente lo recoja en la tienda elegida cuando le llegue el e-mail de confirmaci&oacute;n. (Es preciso indicar que el cliente deber&aacute; de esperar este e-mail para acercarse a la tienda a recoger su compra).</li>\r\n	<li>Luego que le llegue el e-mail de confirmaci&oacute;n el cliente se acercar&aacute; a la tienda elegida para su compra y buscar&aacute; el punto de retiro (Deber&aacute; de considerar el horario de atenci&oacute;n de la tienda).</li>\r\n	<li>Cuando el cliente recoja su pedido en tienda, este ser&aacute; entregado en una bolsa sellada por temas de seguridad. Para la revisi&oacute;n de los productos, dicha bolsa se romper&aacute;. Si el cliente desea obtener una bolsa adicional para transportar sus productos tendr&aacute; la compra una bolsa en tienda.</li>\r\n</ul>\r\n\r\n<h2>11.- COMPROBANTES DE PAGO</h2>\r\n\r\n<p>Seg&uacute;n el reglamento de Comprobantes de Pago aprobado por la Resoluci&oacute;n de Superintendencia N&deg; 007-99 / SUNAT (RCP) y el Texto &Uacute;nico Ordenado de la Ley del Impuesto General a las Ventas e Impuesto Selectivo al Consumo, aprobado mediante Decreto Supremo N&deg; 055-99-EF y normas modificatorias (TUO del IGV), se concluye:</p>\r\n\r\n<p>&ldquo;No existe ning&uacute;n procedimiento vigente que permita el canje de boletas de venta por facturas, m&aacute;s a&uacute;n las notas de cr&eacute;dito no se encuentran previstas para modificar al adquirente o usuario que figura en el comprobante de pago original&rdquo;.</p>\r\n\r\n<p>Por lo cual el cliente deber&aacute; decidir correctamente el documento que solicitar&aacute; como comprobante al momento de su compra, ya que seg&uacute;n los p&aacute;rrafos citados no proceder&aacute; cambio alguno.</p>\r\n\r\n<p>Las facturas electr&oacute;nicas, las boletas de venta electr&oacute;nicas y las notas electr&oacute;nicas vinculadas a estos comprobantes electr&oacute;nicos ser&aacute;n puestas a disposici&oacute;n a trav&eacute;s de la p&aacute;gina web de la empresa (www.topitop.pe), para lo cual se enviar&aacute; al correo electr&oacute;nico designado por el cliente, los datos necesarios para que &eacute;ste pueda consultar el comprobante electr&oacute;nico en la se&ntilde;alada web y tenga la posibilidad de descargarlo, de acuerdo al Art&iacute;culo 15 de la Resoluci&oacute;n de Superintendencia N&deg; 097-2012/SUNAT, Resoluci&oacute;n de Superintendencia que crea el Sistema de Emisi&oacute;n Electr&oacute;nica desarrollado desde los sistemas del contribuyente.</p>\r\n\r\n<h2>12.- PROGRAMA DE FIDELIZACI&Oacute;N CLIENTE TOP</h2>\r\n\r\n<p>Las compras realizadas en la p&aacute;gina web de Topitop (www.topitop.pe) no acumulan puntos para quienes se encuentren suscritos en el programa de Cliente Top. Se acumular&aacute;n los puntos s&oacute;lo en las compras realizadas en tiendas f&iacute;sicas.</p>\r\n\r\n<h2>13.- VALIDEZ, PRECIO Y STOCK DE LAS OFERTAS CONTENIDAS EN ESTE SITIO</h2>\r\n\r\n<p>Los precios y servicios exhibidos en www.topitop.pe son exclusivos para las compras efectuadas en Tienda Virtual Topitop y no son aplicables a transacciones efectuadas en otras tiendas de Topitop. As&iacute; mismo los precios y servicios exhibidos en otras tiendas de Topitop, no necesariamente tienen aplicaci&oacute;n a las transacciones efectuadas en www.topitop.pe.</p>\r\n\r\n<p>En el supuesto negado que por un error o evento fuera del control de Topitop, el precio correcto del producto sea m&aacute;s alto que el precio consignado en su orden de compra, nos contactaremos con usted dentro de los 7 d&iacute;as h&aacute;biles siguientes a la transacci&oacute;n para informarle este hecho e indicarle el proceso de devoluci&oacute;n y anulaci&oacute;n de la orden.</p>\r\n\r\n<p>Los precios de los productos consignados en la Tienda Virtual Topitop son en moneda nacional, (S/.), y de igual manera los comprobantes de pago que se emiten.</p>\r\n\r\n<p>Los precios de los productos y servicios publicados en este sitio, se encuentran vigentes &uacute;nicamente mientras aparezcan en &eacute;l. Topitop.pe podr&aacute; modificar cualquier informaci&oacute;n contenida en este sitio, incluyendo las relacionadas con mercader&iacute;as, servicios, precios, existencias y condiciones, en cualquier momento y sin previo aviso</p>\r\n\r\n<p>Las compras realizadas en www.topitop.pe est&aacute;n sujetas a disponibilidad de stock. En caso no haya stock del producto, se informar&aacute; al cliente m&aacute;ximo en 7 d&iacute;as h&aacute;biles y se proceder&aacute; a anular la compra.</p>\r\n\r\n<p>El stock ofrecido es de 1 producto por oferta. Los productos publicados en este sitio son v&aacute;lidos exclusivamente para consumo familiar, no m&aacute;s de 1 oferta por persona y/o tarjeta de cr&eacute;dito.</p>\r\n\r\n<p>Las condiciones para cambio de art&iacute;culos son las expresadas en siguiente enlace:<a href=\"https://www.topitop.pe/cambios-y-devoluciones\">&nbsp;https://topitop.pe/cambios-y-devoluciones</a>&nbsp;y para su ejecuci&oacute;n es necesario cumplir con los requerimientos solicitados en &eacute;l.</p>\r\n\r\n<p>Topitop no se responsabiliza de la informaci&oacute;n proporcionada por otros sitios web y las consecuencias derivadas de ello, especialmente cuando el acceso al sitio de Tienda Virtual Topitop se ha efectuado a trav&eacute;s de un link o banner en sitios que no dispongan de contratos o alianzas con www.topitop.pe. Topitop se reserva el derecho a modificar cualquier informaci&oacute;n contenida en este sitio. Para mayor informaci&oacute;n sobres legales de nuestras promociones publicadas en nuestra p&aacute;gina web y otras p&aacute;ginas, ingresar aqu&iacute;&nbsp;<a href=\"https://topitop.pe/bases-legales\">https://topitop.pe/bases-legales</a></p>\r\n\r\n<h2>14.- MAILING</h2>\r\n\r\n<p>Todos los precios de los productos recibidos por Mailing y de remitente&nbsp;&ldquo;Topitop Per&uacute;&rdquo;&nbsp;tienen una vigencia seg&uacute;n fecha que aparezca en Bases Legales y de no tenerla se interpreta que se extender&aacute; hasta agotar stock.</p>', '<section class=\"accordeon_container\"><div class=\"container\"><div class=\"accordions\"><div class=\"intro\"><p>Trading Fashion Line S.A., en cumplimiento de la Ley, protege los datos personales de sus clientes, proveedores y personal de la empresa, de acuerdo con la siguiente Política de Protección de Datos Personales que describe: principios rectores, tratamiento de los datos personales y atención al ciudadano, aplicada a todo nivel de la empresa.</p></div><div class=\"accordion-item2\"><div class=\"accordion-title2\" data-tab=\"c_item10\"><h2>1.- PRINCIPIOS RECTORES<span class=\"accordein_icon\"></span></h2></div><div class=\"accordion-content2\" id=\"c_item10\"><p>Trading Fashion Line S.A. cumple con lo dispuesto por Ley y garantiza que:</p><ul><li>Recopila lícitamente los datos personales para fines explícitos, dados a conocer al titular de los datos.</li><li>Utiliza adecuadamente los datos personales registrados con el consentimiento de su titular.</li><li>Actualiza correctamente, con información veraz, los datos personales suministrados por el titular.</li><li>Protege la confidencialidad de los datos personales.</li><li>Implementa medidas de seguridad con el fin de preservar adecuadamente los datos personales.</li><li>Provee, al titular, de procedimientos transparentes de acceso a sus datos personales.</li></ul></div></div><div class=\"accordion-item2\"><div class=\"accordion-title2\" data-tab=\"c_item20\"><h2>2.- TRATAMIENTO DE LOS DATOS PERSONALES<span class=\"accordein_icon\"></span></h2></div><div class=\"accordion-content2\" id=\"c_item20\"><p>Trading Fashion Line S.A. registra los datos personales de sus clientes, proveedores o personal de la empresa con el consentimiento del titular de los datos.</p><p>Este consentimiento es básicamente verbal y manifiesto durante el trato con las personas en el punto de venta durante la atención a los clientes, con los proveedores en la gestión de compras o en el proceso de incorporación de personal nuevo y es el resultado de la explicación al titular clara y satisfactoria acerca de la finalidad por la cual se solicitan los datos personales.</p><p>Asimismo, en nuestra Tienda Online, este consentimiento se formaliza al aceptar los términos y condiciones mediante el check que el usuario activa durante su registro de datos para las compras por Internet.</p><p>En Trading Fashion Line S.A. a través de procedimientos adecuados, confidenciales y seguros tratamos legítimamente los datos personales con la finalidad de cumplir con nuestros compromisos con la sociedad, el Estado, nuestros clientes, proveedores y colaboradores.</p><p>Asimismo, Trading Fashion Line S.A. reconoce y garantiza los derechos de las personas, titulares de los datos personales, a conocer, actualizar, incluir, rectificar y suprimir sus datos personales en los bancos de datos administrados por la empresa. Asimismo, tienen derecho a:</p><ul><li>Asimismo, Trading Fashion Line S.A. reconoce y garantiza los derechos de las personas, titulares de los datos personales, a conocer, actualizar, incluir, rectificar y suprimir sus datos personales en los bancos de datos administrados por la empresa. Asimismo, tienen derecho a:</li><li>Oponerse al tratamiento de sus datos cuando existan motivos fundados y legítimos relativos a una concreta situación personal.</li></ul></div></div><div class=\"accordion-item2\"><div class=\"accordion-title2\" data-tab=\"c_item30\"><h2>3.- ATENCIÓN AL CIUDADANO<span class=\"accordein_icon\"></span></h2></div><div class=\"accordion-content2\" id=\"c_item30\"><p>Trading Fashion Line S.A. atiende las consultas o trámites relacionados con datos personales de los ciudadanos a través de la Gerencia de Marketing, ubicada en Av. Santuario 1323, Zárate, San Juan de Lurigancho, así como por vía correo electrónico dirigido a atencionalcliente@topitop.com.pe</p></div></div></div></div></section>', '<h2>1.- DELIVERY EN 48 HORAS</h2>\r\n\r\n<p>Promoci&oacute;n v&aacute;lida para aquellos deliverys dentro de las zonas de Lima Metropolitana. Las 48 horas ser&aacute;n tomadas en horas h&aacute;biles, no consideran fines de semana ni feriados. Las 48 horas ser&aacute;n efectivas a partir de la confirmaci&oacute;n del pago, dicha confirmaci&oacute;n ser&aacute; notificada a trav&eacute;s de un correo. En el caso de Pago Efectivo las 48 horas se considerar&aacute;n efectivas una vez que el cliente realiza el pago correctamente, en la empresa pago efectivo y el sistema aprueba dicho pago, el mismo tambi&eacute;n ser&aacute; confirmado a trav&eacute;s de un correo electr&oacute;nico que se env&iacute;a al cliente. Promoci&oacute;n v&aacute;lida s&oacute;lo para tienda online&nbsp;<a href=\"https://www.topitop.pe/www.topitop.pe\">www.topitop.pe</a></p>\r\n\r\n<p><strong>Distritos que participan del Delivery en 48 horas:</strong>&nbsp;Comas, Los Olivos, Independencia, San Mart&iacute;n de Porres, San Juan de Lurigancho, Santa Anita, Ate Vitarte, La Molina, El Agustino, San Juan de Miraflores, Villa Mar&iacute;a del Triunfo, Villa El Salvador, Cercado, San Luis, Bre&ntilde;a, La Victoria, Rimac, Lince, San Miguel, Jes&uacute;s Mar&iacute;a, Magdalena, Pueblo Libre, Barranco, Miraflores, Surco, San Borja, Surquillo, San Isidro, Chorrillos</p>\r\n\r\n<p>*Las 48 horas se contabilizan dentro de d&iacute;as h&aacute;biles, de lunes a viernes.</p>\r\n\r\n<p><strong>Distritos considerados Lima lejana. Delivery en 4 d&iacute;as h&aacute;biles:</strong>&nbsp;Ventanilla, Anc&oacute;n, Santa Rosa, Mi Per&uacute;, Carabayllo, Puente Piedra, Chosica, Chaclacayo, Cieneguilla, Lur&iacute;n, Pachacamac, Punta Hermosa, Pucusana, Punta Negra, Santa Mar&iacute;a, San Bartolo</p>\r\n\r\n<h2>2.- DELIVERY POR COMPRAS MAYORES A S/ 139</h2>\r\n\r\n<ul>\r\n	<li>Promoci&oacute;n v&aacute;lida del 15 de febrero al 15 de marzo del 2022.</li>\r\n	<li>V&aacute;lido por compras mayores a S/ 139 con cualquier medio de pago.</li>\r\n	<li>Promoci&oacute;n v&aacute;lida para Lima y provincias.</li>\r\n	<li>S&oacute;lo para consumo familiar.</li>\r\n	<li>Promoci&oacute;n v&aacute;lida s&oacute;lo para tienda online&nbsp;<a href=\"http://www.topitop.pe/\">www.topitop.pe</a></li>\r\n</ul>\r\n\r\n<h2>3.- VALE DE CUMPLEA&Ntilde;OS</h2>\r\n\r\n<ul>\r\n	<li>Debes suscribirte en el formulario que se encuentra en nuestra p&aacute;gina web, al suscribirte recibes informaci&oacute;n de nuestras promociones y el Vale de descuento de 15% por cumplea&ntilde;os, en el mes que corresponda.</li>\r\n	<li>Tu suscripci&oacute;n debe tener una antig&uuml;edad m&iacute;nima de 1 mes, antes de la fecha de tu cumplea&ntilde;os.</li>\r\n	<li>La informaci&oacute;n que ingreses ser&aacute; verificada.</li>\r\n	<li>Este 15% de dscto. aplica sobre los descuentos que est&eacute;n vigentes en la p&aacute;gina web en el momento que hagan efectivo el cup&oacute;n.</li>\r\n	<li>El Vale de cumplea&ntilde;os ser&aacute; de uso exclusivo para la persona que se registr&oacute;, es intransferible a un tercero.</li>\r\n	<li>El Vale es de un &uacute;nico uso durante el mes de tu cumplea&ntilde;os.</li>\r\n	<li>El Vale ser&aacute; enviando al correo que registraste en nuestro formulario.</li>\r\n	<li>Promoci&oacute;n v&aacute;lida s&oacute;lo para tienda online&nbsp;<a href=\"http://www.topitop.pe/\">www.topitop.pe</a></li>\r\n	<li>No es aplicable en tiendas f&iacute;sicas.</li>\r\n</ul>\r\n\r\n<h2>4.- CYBER INTERBANK</h2>\r\n\r\n<ul>\r\n	<li>Tienes 20% de dscto. adicional en toda la temporada Verano22 en&nbsp;<a href=\"http://www.topitop.pe/\">www.topitop.pe</a></li>\r\n	<li>Las prendas de la temporada Verano 22 estar&aacute;n identificadas con una etiqueta.</li>\r\n	<li>Promoci&oacute;n v&aacute;lida para tarjetas Interbank.</li>\r\n	<li>Disponible el 11 y 12 de octubre del 2021.</li>\r\n	<li>Descuento m&aacute;ximo de S/100.00 por compra.</li>\r\n	<li>Descuento exclusivo para tienda online.</li>\r\n	<li>No aplica en tiendas f&iacute;sicas.</li>\r\n</ul>\r\n\r\n<h2>5.- CUENTA SUELDO INTERBANK</h2>\r\n\r\n<ul>\r\n	<li>Tienes 10% de dscto. adicional en&nbsp;<a href=\"http://www.topitop.pe/\">www.topitop.pe</a></li>\r\n	<li>Promoci&oacute;n v&aacute;lida para tarjetas Interbank.</li>\r\n	<li>Disponible del 10 de octubre al 9 de enero del 2022.</li>\r\n	<li>Descuento m&aacute;ximo de S/100.00 por compra.</li>\r\n	<li>No aplica a precios con descuentos mayores al 30%.</li>\r\n	<li>No aplica en fechas de Cyber Days y Cyber Wow.</li>\r\n	<li>Descuento exclusivo para tienda online.</li>\r\n	<li>No aplica en tiendas f&iacute;sicas.</li>\r\n</ul>\r\n\r\n<h2>6.- CYBER TOP</h2>\r\n\r\n<ul>\r\n	<li>Hasta 60% de descuento en prendas y/o c&oacute;digos seleccionados.</li>\r\n	<li>V&aacute;lido del 28.03.22 al 31.03.22 y/o hasta agotar stock.</li>\r\n	<li>Stock m&iacute;nimo 02 unidades por producto.</li>\r\n	<li>Descuento aplica sobre precio actual.</li>\r\n	<li>No acumulable con otras promociones ni descuentos.</li>\r\n	<li>V&aacute;lido solo por el canal de venta online&nbsp;<a href=\"http://www.topitop.pe/\">www.topitop.pe</a></li>\r\n</ul>\r\n\r\n<h2>7.- DELIVERY EXPRESS EN 24 HORAS</h2>\r\n\r\n<p>Promoci&oacute;n v&aacute;lida para distritos seleccionados de Lima Metropolitana. Si se realiza el pedido antes de medio d&iacute;a la compra llegar&aacute; el mismo d&iacute;a, de realizar la compra pasado medio d&iacute;a lo estar&iacute;a recibiendo al d&iacute;a siguiente antes de medio d&iacute;a. El servicio no considera fines de semana ni feriados. Las 24 horas ser&aacute;n efectivas a partir de la confirmaci&oacute;n del pago, dicha confirmaci&oacute;n ser&aacute; notificada a trav&eacute;s de un correo. En el caso de Pago Efectivo las 24 horas se considerar&aacute;n efectivas una vez que el cliente realiza el pago correctamente, en la empresa pago efectivo y el sistema aprueba dicho pago, el mismo tambi&eacute;n ser&aacute; confirmado a trav&eacute;s de un correo electr&oacute;nico que se env&iacute;a al cliente. Promoci&oacute;n v&aacute;lida s&oacute;lo para tienda online www.topitop.pe</p>\r\n\r\n<p>Distritos que participan del Delivery Express en 24 horas: Comas, Los Olivos, Independencia, San Mart&iacute;n de Porres, San Juan de Lurigancho, Santa Anita, Ate Vitarte, La Molina, El Agustino, San Juan de Miraflores, Villa Mar&iacute;a del Triunfo, Villa El Salvador, Cercado, San Luis, Bre&ntilde;a, La Victoria, Rimac, Lince, San Miguel, Jes&uacute;s Mar&iacute;a, Magdalena, Pueblo Libre, Barranco, Miraflores, Surco, San Borja, Surquillo, San Isidro, Chorrillos</p>\r\n\r\n<p>*Las 24 horas se contabilizan dentro de d&iacute;as h&aacute;biles, de lunes a viernes. El servicio delivery express tiene un costo adicional, este se debe seleccionar durante el checkout para acceder a &eacute;l. S&oacute;lo se recibir&aacute;n pedidos de Delivery Express hasta el 29 de diciembre. En el caso de Delivery Express con Pago Efectivo, estos pagos deber&aacute;n realizarse el mismo 29 de diciembre para considerar su entrega el 30 de diciembre, de lo contrario el pedido llegar&aacute; el lunes 3 de enero 2022.</p>\r\n\r\n<p>Zonas restringidas: Las entregas en las zonas nombradas no est&aacute;n habilitadas para el servicio DELIVERY EXPRESS, debido a constantes incidentes.</p>\r\n\r\n<p>AAHH Puerto Nuevo Etapa 3 &ndash; Callao, AAHH Villa Mercedes &ndash; Callao, Tiwinza &ndash; Callao, Sarita Colonia Acapulco &ndash; Callao, AAHH Trapecio La Mar Brava &ndash; Callao, San Judas Tadeo &ndash; Calloa, AAHH Daniel Alcides Carrion &ndash; Callao, AAHH Coronel Francisco Bolognesi &ndash; Callao, AAHH Santa Rosita &ndash; SJL, AAHH Mano De Dios Etapa 3 &ndash; SJL, AAHH Nueva Jerusalen &ndash; SJL, AAHH La Planicie &ndash; SJL, AAHH Nueva Luz 2 &ndash; SJL, AAHH Cristo Rey &ndash; SJL, Jicamarca &ndash; SJL, Tambor &ndash; SJL.</p>\r\n\r\n<h2>8.- Concurso Giftcard S/100 &ndash; Encuesta Topitop.pe</h2>\r\n\r\n<ul>\r\n	<li>Premio: 1 Giftcard Topitop valorizada en S/ 100</li>\r\n	<li>Los participantes deben llenar la encuesta satisfactoriamente.</li>\r\n	<li>La ganadora o ganador ser&aacute; elegido aleatoriamente por su participaci&oacute;n en la encuesta.</li>\r\n	<li>Los participantes deber&aacute;n tener m&aacute;s de 18 a&ntilde;os al momento de concursar.</li>\r\n	<li>Concurso v&aacute;lido a nivel nacional del 22 al 31 de marzo de 2022, hasta las 23:59 horas.</li>\r\n	<li>Anunciaremos a la ganadora o ganador el 4 de abril de 2022 en nuestro facebook y recibir&aacute; un email con la Giftcard.</li>\r\n	<li>El Giftcard solo podr&aacute; ser usado en nuestra p&aacute;gina web&nbsp;<a href=\"http://www.topitop.pe/\">www.topitop.pe</a>.</li>\r\n	<li>El periodo para hacer uso de la Giftcard ser&aacute; desde el 4 al 17 de abril de 2022</li>\r\n	<li>V&aacute;lido para 1 solo uso.</li>\r\n</ul>\r\n\r\n<h2>9.- VALES DE 30 SOLES</h2>\r\n\r\n<ul>\r\n	<li>Del 28 al 31 de marzo del 2022 por compras desde S/120 con cualquier medio de pago, te regalamos un vale de S/30 para ser usado entre el 4 y el 17 de abril del 2022.</li>\r\n	<li>El cliente podr&aacute; aplicar su vale de S/30 en compras igual o mayores a S/120, estos vales no se acumulan en una sola compra, pueden ser usados en diferentes compras durante el periodo mencionado.</li>\r\n	<li>El o los vales ser&aacute;n enviados al correo del cliente que hizo la compra a partir del 1 de abril del 2022.</li>\r\n	<li>S&oacute;lo se genera un vale por ticket de compra.</li>\r\n	<li>S&oacute;lo para consumo familiar.</li>\r\n	<li>Promoci&oacute;n v&aacute;lida s&oacute;lo para tienda online&nbsp;<a href=\"http://www.topitop.pe/\">www.topitop.pe</a>.</li>\r\n</ul>\r\n\r\n<h2>10.- 30% + 10% ADICIONAL CON TARJETA DINERS</h2>\r\n\r\n<p>Comprando con tarjeta Diners del 4 al 10 de abril tienes 10% de dscto. adicional en la Colecci&oacute;n Verano. Adem&aacute;s, puedes pagar hasta en 6 cuotas sin intereses. Las prendas de la Colecci&oacute;n Verano estar&aacute;n identificadas con una etiqueta. Promoci&oacute;n v&aacute;lida s&oacute;lo para tarjetas Diners. Descuento m&aacute;ximo de S/100.00 por compra. No aplica en tiendas f&iacute;sicas. Descuento exclusivo para tienda online www.topitop.pe</p>\r\n\r\n<h2>11.- CUP&Oacute;N 10% ADICIONAL EN DENIM</h2>\r\n\r\n<ul>\r\n	<li>Del 4 al 18 de abril tienes 10% de dscto. adicional en todo Denim usando el cup&oacute;n XIMENADENIM.</li>\r\n	<li>Descuento m&aacute;ximo de S/100.00 por compra.</li>\r\n	<li>Stock m&iacute;nimo 2 unidades.</li>\r\n	<li>Descuento para tienda online <a href=\"https://www.topitop.pe\">www.topitop.pe</a></li>\r\n</ul>\r\n\r\n<h2>12.- CIERRA PUERTAS 3X2</h2>\r\n\r\n<p><strong>TIENDA ON LINE: </strong></p>\r\n\r\n<p>Cierra Puertas, aprovecha 3x2 en c&oacute;digos seleccionados. Vigencia el 9 y 10 de abril del 2022 y/o hasta agotar stock. V&aacute;lido en c&oacute;digos seleccionados. Descuento aplica sobre precio de etiqueta. Para el pago se considera las 2 prendas de mayor valor. Stock m&iacute;nimo 03 unidades. Solo para consumo familiar. No participan marcas terceras Porta y Bata. No acumulable con otras promociones ni descuentos. Promoci&oacute;n para tienda online <a href=\"http://www.topitop.pe\">www.topitop.pe</a></p>\r\n\r\n<p><strong>TIENDA F&Iacute;SICA: </strong></p>\r\n\r\n<p>Cierra puertas, Aprovecha 3x2 en toda la tienda. Vigencia el 9 y 10 de abril del 2022 y/o hasta agotar stock. Participa tienda f&iacute;sica y online. V&aacute;lido en c&oacute;digos seleccionados. Descuento aplica sobre precio de etiqueta. Para el pago se considera las 2 prendas de mayor valor. Stock m&iacute;nimo 03 unidades. Solo para consumo familiar. No participa KINNO ni concesionarios. No acumulable con otras promociones ni descuentos dentro de tienda. Participan todas las tiendas Topitop a nivel nacional a excepci&oacute;n de: Tienda Minka, Puente Piedra, Barranca, Huaraz, Tarma, Chimbote, Chosica, Huayc&aacute;n, Huacho, Royal Plaza, Huaral, Jes&uacute;s Mar&iacute;a. M&aacute;s informaci&oacute;n consultar en caja.</p>');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fits`
--

CREATE TABLE `fits` (
  `id` int(11) NOT NULL,
  `nombre` varchar(70) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `fits`
--

INSERT INTO `fits` (`id`, `nombre`, `descripcion`, `estado`) VALUES
(1, 'Relax', NULL, 1),
(2, 'Slim', NULL, 1),
(3, 'Confort', NULL, 1),
(4, 'Regular', NULL, 1),
(5, 'Skinny', NULL, 1),
(6, 'Clásico', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fotos`
--

CREATE TABLE `fotos` (
  `id` int(11) NOT NULL,
  `ruta` text NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `productos_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `fotos`
--

INSERT INTO `fotos` (`id`, `ruta`, `estado`, `productos_id`) VALUES
(1, 'public/productos/18561774_2.webp', 1, 1),
(2, 'public/productos/18561774_3.webp', 1, 1),
(3, 'public/productos/18561774_4.webp', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='			';

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id`, `nombre`, `descripcion`, `estado`) VALUES
(1, 'Bata', 'zzzzz', 1),
(2, 'Bubblegummers', NULL, 1),
(3, 'New York Woman', NULL, 1),
(4, 'Northstar', NULL, 1),
(5, 'Power', NULL, 1),
(6, 'Xiomi', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2021_12_14_010113_create_sessions_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `sku` varchar(12) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `detalles` text DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  `imagen` varchar(150) NOT NULL,
  `facebook` text DEFAULT NULL,
  `compartir` text DEFAULT NULL,
  `categorias_id` int(11) NOT NULL,
  `marcas_id` int(11) NOT NULL,
  `tipos_id` int(11) NOT NULL,
  `fits_id` int(11) NOT NULL,
  `colors_id` int(11) NOT NULL,
  `breve` varchar(200) NOT NULL,
  `precio` float(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `sku`, `nombre`, `descripcion`, `detalles`, `estado`, `imagen`, `facebook`, `compartir`, `categorias_id`, `marcas_id`, `tipos_id`, `fits_id`, `colors_id`, `breve`, `precio`) VALUES
(1, '1861774', 'topitop mujer', '<p>Topitop ha dise&ntilde;ado las prendas para pasar esta temporada con moda y estilo de la marca Topitop mujer. Renueva tu guardarropa con estos Polos Manga Corta en el color de tu preferencia y comb&iacute;nalos para armar tu look perfecto</p>', '<table border=\"0\" cellpadding=\"1\" cellspacing=\"1\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Fit</li>\r\n			</ul>\r\n			</td>\r\n			<td>&nbsp;Regular</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Tela</li>\r\n			</ul>\r\n			</td>\r\n			<td>&nbsp;Jersey Policoton</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Clase</li>\r\n			</ul>\r\n			</td>\r\n			<td>&nbsp;Polo</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Tipo de Manga</li>\r\n			</ul>\r\n			</td>\r\n			<td>&nbsp;Corta</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Tipo de Tejido</li>\r\n			</ul>\r\n			</td>\r\n			<td>&nbsp;Punto</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>', 1, 'public/productos/18561774_1.webp', NULL, NULL, 1, 5, 1, 1, 4, 'Polo Mujer I22d3 Negro', 49.90),
(2, '1861768', 'topitop mujer', '<p>Topitop ha dise&ntilde;ado las prendas para pasar esta temporada con moda y estilo de la marca Topitop mujer. Renueva tu guardarropa con estos Polos Manga Corta en el color de tu preferencia y comb&iacute;nalos para armar tu look perfecto</p>', '<table border=\"0\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Fit</li>\r\n			</ul>\r\n			</td>\r\n			<td>Regular</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Tela</li>\r\n			</ul>\r\n			</td>\r\n			<td>Jersey Policoton</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Clase</li>\r\n			</ul>\r\n			</td>\r\n			<td>Polo</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Tipo de Manga</li>\r\n			</ul>\r\n			</td>\r\n			<td>Corta</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Tipo de Tejido</li>\r\n			</ul>\r\n			</td>\r\n			<td>Punto</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>', 1, 'public/productos/18561768_1.webp', NULL, NULL, 1, 1, 1, 1, 9, 'Polo Mujer I22d3 Celeste Lavanda', 49.90),
(3, '1861750', 'topitop mujer', '<p>Topitop ha dise&ntilde;ado las prendas para pasar esta temporada con moda y estilo de la marca Topitop mujer. Renueva tu guardarropa con estos Polos Manga Corta en el color de tu preferencia y comb&iacute;nalos para armar tu look perfecto</p>', '<table border=\"0\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Fit</li>\r\n			</ul>\r\n			</td>\r\n			<td>Regular</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Tela</li>\r\n			</ul>\r\n			</td>\r\n			<td>Jersey Policoton</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Clase</li>\r\n			</ul>\r\n			</td>\r\n			<td>Polo</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Tipo de Manga</li>\r\n			</ul>\r\n			</td>\r\n			<td>Corta</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Tipo de Tejido</li>\r\n			</ul>\r\n			</td>\r\n			<td>Punto</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>', 1, 'public/productos/18561750_1.webp', NULL, NULL, 1, 1, 1, 1, 15, 'Polo Mujer I22d3 Mostaza Honey', 49.90),
(4, '1861744', 'TOPITOP MUJER', '<p>Topitop ha dise&ntilde;ado las prendas para pasar esta temporada con moda y estilo de la marca Topitop mujer. Renueva tu guardarropa con estos Polos Manga Corta en el color de tu preferencia y comb&iacute;nalos para armar tu look perfecto</p>', '<table border=\"0\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Fit</li>\r\n			</ul>\r\n			</td>\r\n			<td>Regular</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Tela</li>\r\n			</ul>\r\n			</td>\r\n			<td>Jersey Policoton</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Clase</li>\r\n			</ul>\r\n			</td>\r\n			<td>Polo</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Tipo de Manga</li>\r\n			</ul>\r\n			</td>\r\n			<td>Corta</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Tipo de Tejido</li>\r\n			</ul>\r\n			</td>\r\n			<td>Punto</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>', 1, 'public/productos/18561744_1.webp', NULL, NULL, 1, 1, 1, 1, 28, 'Polo Mujer I22d3 Lila Malva', 49.90),
(5, '1861995', 'TOPITOP MUJER', '<ul>\r\n	<li>Topitop ha dise&ntilde;ado las prendas para pasar esta temporada con moda y estilo de la marca Topitop mujer. Renueva tu guardarropa con estos&nbsp;<strong>Polos Manga Corta</strong>&nbsp;en el color de tu preferencia y comb&iacute;nalos para armar tu look perfecto</li>\r\n</ul>', '<table border=\"0\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Fit</li>\r\n			</ul>\r\n			</td>\r\n			<td>Regular</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Tela</li>\r\n			</ul>\r\n			</td>\r\n			<td>Jersey Licra</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Clase</li>\r\n			</ul>\r\n			</td>\r\n			<td>Polo</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Tipo de Manga</li>\r\n			</ul>\r\n			</td>\r\n			<td>Corta</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Tipo de Tejido</li>\r\n			</ul>\r\n			</td>\r\n			<td>Punto</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>', 1, 'public/productos/1861995_1.webp', NULL, NULL, 1, 1, 1, 1, 11, 'Polo Mujer Romeliad3 Rosado Confetti', 49.90),
(6, '1862013', 'TOPITOP MUJER', '<ul>\r\n	<li>Topitop ha dise&ntilde;ado las prendas para pasar esta temporada con moda y estilo de la marca Topitop mujer. Renueva tu guardarropa con estos&nbsp;<strong>Polos Manga Corta</strong>&nbsp;en el color de tu preferencia y comb&iacute;nalos para armar tu look perfecto</li>\r\n</ul>', '<table border=\"0\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Fit</li>\r\n			</ul>\r\n			</td>\r\n			<td>Regular</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Tela</li>\r\n			</ul>\r\n			</td>\r\n			<td>Jersey Policoton</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Clase</li>\r\n			</ul>\r\n			</td>\r\n			<td>Polo</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Tipo de Manga</li>\r\n			</ul>\r\n			</td>\r\n			<td>Corta</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Tipo de Tejido</li>\r\n			</ul>\r\n			</td>\r\n			<td>Punto</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>', 1, 'public/productos/1862013_1.webp', NULL, NULL, 1, 1, 1, 1, 6, 'Polo Mujer Romeliad3 Borgoña', 49.90),
(7, '1862019', 'TOPITOP MUJER', '<ul>\r\n	<li>Topitop ha dise&ntilde;ado las prendas para pasar esta temporada con moda y estilo de la marca Topitop mujer. Renueva tu guardarropa con estos&nbsp;<strong>Polos Manga Corta</strong>&nbsp;en el color de tu preferencia y comb&iacute;nalos para armar tu look perfecto</li>\r\n</ul>', '<table border=\"0\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Fit</li>\r\n			</ul>\r\n			</td>\r\n			<td>Regular</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Tela</li>\r\n			</ul>\r\n			</td>\r\n			<td>Jersey Licra</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Clase</li>\r\n			</ul>\r\n			</td>\r\n			<td>Polo</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Tipo de Manga</li>\r\n			</ul>\r\n			</td>\r\n			<td>Corta</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Tipo de Tejido</li>\r\n			</ul>\r\n			</td>\r\n			<td>Punto</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>', 1, 'public/productos/1862019_1.webp', NULL, NULL, 1, 1, 1, 1, 30, 'Polo Mujer Romeliad3 Verde Cemento', 49.90),
(8, '1862001', 'TOPITOP MUJER', '<ul>\r\n	<li>Topitop ha dise&ntilde;ado las prendas para pasar esta temporada con moda y estilo de la marca Topitop mujer. Renueva tu guardarropa con estos&nbsp;<strong>Polos Manga Corta</strong>&nbsp;en el color de tu preferencia y comb&iacute;nalos para armar tu look perfecto</li>\r\n</ul>', '<table border=\"0\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Fit</li>\r\n			</ul>\r\n			</td>\r\n			<td>Regular</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Tela</li>\r\n			</ul>\r\n			</td>\r\n			<td>Jersey Licra</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Clase</li>\r\n			</ul>\r\n			</td>\r\n			<td>Polo</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Tipo de Manga</li>\r\n			</ul>\r\n			</td>\r\n			<td>Corta</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Tipo de Tejido</li>\r\n			</ul>\r\n			</td>\r\n			<td>Punto</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>', 1, 'public/productos/1862001_1.webp', NULL, NULL, 1, 1, 1, 1, 5, 'Polo Mujer Romeliad3 Azulino Oscuro', 49.90),
(9, '1861818', 'TOPITOP MUJER', '<ul>\r\n	<li>Topitop ha dise&ntilde;ado las prendas para pasar esta temporada con moda y estilo de la marca Topitop mujer. Renueva tu guardarropa con estos&nbsp;<strong>Polos Manga Corta</strong>&nbsp;en el color de tu preferencia y comb&iacute;nalos para armar tu look perfecto</li>\r\n</ul>', '<table border=\"0\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Fit</li>\r\n			</ul>\r\n			</td>\r\n			<td>Regular</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Tela</li>\r\n			</ul>\r\n			</td>\r\n			<td>Jersey Licra</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Clase</li>\r\n			</ul>\r\n			</td>\r\n			<td>Polo</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Tipo de Manga</li>\r\n			</ul>\r\n			</td>\r\n			<td>Corta</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Tipo de Tejido</li>\r\n			</ul>\r\n			</td>\r\n			<td>Punto</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>', 1, 'public/productos/1861818_1.webp', NULL, NULL, 1, 1, 1, 1, 4, 'Polo Mujer Rominad3 Negro', 49.90),
(10, '1861812', 'TOPITOP MUJER', '<ul>\r\n	<li>Topitop ha dise&ntilde;ado las prendas para pasar esta temporada con moda y estilo de la marca Topitop mujer. Renueva tu guardarropa con estos&nbsp;<strong>Polos Manga Corta</strong>&nbsp;en el color de tu preferencia y comb&iacute;nalos para armar tu look perfecto</li>\r\n</ul>', '<table border=\"0\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Fit</li>\r\n			</ul>\r\n			</td>\r\n			<td>Regular</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Tela</li>\r\n			</ul>\r\n			</td>\r\n			<td>Jersey Licra</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Clase</li>\r\n			</ul>\r\n			</td>\r\n			<td>Polo</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Tipo de Manga</li>\r\n			</ul>\r\n			</td>\r\n			<td>Corta</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Tipo de Tejido</li>\r\n			</ul>\r\n			</td>\r\n			<td>Punto</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>', 1, 'public/productos/1861812_1.webp', NULL, NULL, 1, 1, 1, 1, 13, 'Polo Mujer Rominad3 Níquel Poly', 49.90),
(11, '1860915', 'TOPITOP HOMBRE', '<ul>\r\n	<li>Topitop ha dise&ntilde;ado las prendas para pasar esta temporada con moda y estilo de la marca Topitop Hombre. Renueva tu guardarropa con estos&nbsp;<strong>Polos para Hombre</strong>&nbsp;en el color de tu preferencia y comb&iacute;nalos para armar tu look perfecto</li>\r\n</ul>', NULL, 1, 'public/productos/1860916_5.webp', NULL, NULL, 2, 5, 1, 1, 5, 'Polo Hombre Ronald Azul Dutty', 49.90),
(12, '1853431', 'HAWK', '<ul>\r\n	<li>Topitop ha dise&ntilde;ado las prendas para pasar esta temporada con moda y estilo de la marca Hawk. Renueva tu guardarropa con estos&nbsp;<strong>Casacas Hombre</strong>&nbsp;en el color de tu preferencia y comb&iacute;nalos para armar tu look perfecto</li>\r\n</ul>', NULL, 1, 'public/productos/1853433_1.webp', NULL, NULL, 2, 4, 7, 3, 30, 'Casaca Hombre Michel4d Verde Cadmio', 209.90),
(13, '1853425', 'HAWK', '<ul>\r\n	<li>Topitop ha dise&ntilde;ado las prendas para pasar esta temporada con moda y estilo de la marca Hawk. Renueva tu guardarropa con estos&nbsp;<strong>Casacas Hombre</strong>&nbsp;en el color de tu preferencia y comb&iacute;nalos para armar tu look perfecto</li>\r\n</ul>', NULL, 1, 'public/productos/1853427_1.webp', NULL, NULL, 2, 4, 7, 3, 13, 'Casaca Hombre Liam4d Gris Oscuro', 169.90),
(14, '1882261', 'NORTHSTAR', '<p>Nueva colecci&oacute;n de Zapatillas Urbanas para hombre North Star. Las nuevas Tacy de North Star est&aacute;n inspiradas en un cl&aacute;sico de la moda retro. Un dise&ntilde;o renovado, con la esencia de un estilo moderno que combinaran perfecto con tu look de cada d&iacute;a. La suela de PVC aportar&aacute; un alto nivel de estabilidad y resistencia en cada paso. Adem&aacute;s, su plantilla cuenta con tecnolog&iacute;a LIFE NATURAL que elimina el 99% de g&eacute;rmenes y bacterias, 100% natural.</p>', '<table border=\"0\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Color</li>\r\n			</ul>\r\n			</td>\r\n			<td>Blanco</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>G&eacute;nero</li>\r\n			</ul>\r\n			</td>\r\n			<td>Hombre</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Suela</li>\r\n			</ul>\r\n			</td>\r\n			<td>Pvc</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Plantilla</li>\r\n			</ul>\r\n			</td>\r\n			<td>Textil</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li>Capellada</li>\r\n			</ul>\r\n			</td>\r\n			<td>Sintetico</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>', 1, 'public/productos/1882253_1.webp', NULL, NULL, 2, 4, 21, 4, 2, 'Zapatilla Hombre North Star Tacy Blanco', 139.90),
(15, '1862812', 'TOPITOP KIDS', '<ul>\r\n	<li>Topitop ha dise&ntilde;ado las prendas para pasar esta temporada con moda y estilo de la marca Topitop Kids. Renueva tu guardarropa con estos&nbsp;<strong>Polos Ni&ntilde;o</strong>&nbsp;en el color de tu preferencia y comb&iacute;nalos para armar tu look perfecto</li>\r\n</ul>', '<table border=\"0\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Material</td>\r\n			<td>Jersey Llano</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Fit</td>\r\n			<td>Regular</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Tela</td>\r\n			<td>Jersey Llano</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Clase</td>\r\n			<td>Polo</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Tipo de Manga</td>\r\n			<td>Larga</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Tipo de Tejido</td>\r\n			<td>Jersey Llano</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 1, 'public/productos/1862813_1.webp', NULL, NULL, 4, 2, 1, 4, 2, 'Polo Jovencito Adriel Blanco', 59.90);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_tallas`
--

CREATE TABLE `producto_tallas` (
  `id` int(11) NOT NULL,
  `productos_id` int(11) NOT NULL,
  `tallas_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `producto_tallas`
--

INSERT INTO `producto_tallas` (`id`, `productos_id`, `tallas_id`) VALUES
(1, 1, 3),
(2, 1, 4),
(3, 1, 5),
(4, 1, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincias`
--

CREATE TABLE `provincias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `ubigeo` varchar(2) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `departamentos_id` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `provincias`
--

INSERT INTO `provincias` (`id`, `nombre`, `ubigeo`, `estado`, `departamentos_id`) VALUES
(1, 'CHACHAPOYAS ', '01', 1, 1),
(2, 'BAGUA', '02', 1, 1),
(3, 'BONGARA', '03', 1, 1),
(4, 'CONDORCANQUI', '04', 1, 1),
(5, 'LUYA', '05', 1, 1),
(6, 'RODRIGUEZ DE MENDOZA', '06', 1, 1),
(7, 'UTCUBAMBA', '07', 1, 1),
(8, 'HUARAZ', '01', 1, 2),
(9, 'AIJA', '02', 1, 2),
(10, 'ANTONIO RAYMONDI', '03', 1, 2),
(11, 'ASUNCION', '04', 1, 2),
(12, 'BOLOGNESI', '05', 1, 2),
(13, 'CARHUAZ', '06', 1, 2),
(14, 'CARLOS FERMIN FITZCARRALD', '07', 1, 2),
(15, 'CASMA', '08', 1, 2),
(16, 'CORONGO', '09', 1, 2),
(17, 'HUARI', '10', 1, 2),
(18, 'HUARMEY', '11', 1, 2),
(19, 'HUAYLAS', '12', 1, 2),
(20, 'MARISCAL LUZURIAGA', '13', 1, 2),
(21, 'OCROS', '14', 1, 2),
(22, 'PALLASCA', '15', 1, 2),
(23, 'POMABAMBA', '16', 1, 2),
(24, 'RECUAY', '17', 1, 2),
(25, 'SANTA', '18', 1, 2),
(26, 'SIHUAS', '19', 1, 2),
(27, 'YUNGAY', '20', 1, 2),
(28, 'ABANCAY', '01', 1, 3),
(29, 'ANDAHUAYLAS', '02', 1, 3),
(30, 'ANTABAMBA', '03', 1, 3),
(31, 'AYMARAES', '04', 1, 3),
(32, 'COTABAMBAS', '05', 1, 3),
(33, 'CHINCHEROS', '06', 1, 3),
(34, 'GRAU', '07', 1, 3),
(35, 'AREQUIPA', '01', 1, 4),
(36, 'CAMANA', '02', 1, 4),
(37, 'CARAVELI', '03', 1, 4),
(38, 'CASTILLA', '04', 1, 4),
(39, 'CAYLLOMA', '05', 1, 4),
(40, 'CONDESUYOS', '06', 1, 4),
(41, 'ISLAY', '07', 1, 4),
(42, 'LA UNION', '08', 1, 4),
(43, 'HUAMANGA', '01', 1, 5),
(44, 'CANGALLO', '02', 1, 5),
(45, 'HUANCA SANCOS', '03', 1, 5),
(46, 'HUANTA', '04', 1, 5),
(47, 'LA MAR', '05', 1, 5),
(48, 'LUCANAS', '06', 1, 5),
(49, 'PARINACOCHAS', '07', 1, 5),
(50, 'PAUCAR DEL SARA SARA', '08', 1, 5),
(51, 'SUCRE', '09', 1, 5),
(52, 'VICTOR FAJARDO', '10', 1, 5),
(53, 'VILCAS HUAMAN', '11', 1, 5),
(54, 'CAJAMARCA', '01', 1, 6),
(55, 'CAJABAMBA', '02', 1, 6),
(56, 'CELENDIN', '03', 1, 6),
(57, 'CHOTA ', '04', 1, 6),
(58, 'CONTUMAZA', '05', 1, 6),
(59, 'CUTERVO', '06', 1, 6),
(60, 'HUALGAYOC', '07', 1, 6),
(61, 'JAEN', '08', 1, 6),
(62, 'SAN IGNACIO', '09', 1, 6),
(63, 'SAN MARCOS', '10', 1, 6),
(64, 'SAN MIGUEL', '11', 1, 6),
(65, 'SAN PABLO', '12', 1, 6),
(66, 'SANTA CRUZ', '13', 1, 6),
(67, 'PROV. CONST. DEL CALLAO', '01', 1, 7),
(68, 'CUSCO', '01', 1, 8),
(69, 'ACOMAYO', '02', 1, 8),
(70, 'ANTA', '03', 1, 8),
(71, 'CALCA', '04', 1, 8),
(72, 'CANAS', '05', 1, 8),
(73, 'CANCHIS', '06', 1, 8),
(74, 'CHUMBIVILCAS', '07', 1, 8),
(75, 'ESPINAR', '08', 1, 8),
(76, 'LA CONVENCION', '09', 1, 8),
(77, 'PARURO', '10', 1, 8),
(78, 'PAUCARTAMBO', '11', 1, 8),
(79, 'QUISPICANCHI', '12', 1, 8),
(80, 'URUBAMBA', '13', 1, 8),
(81, 'HUANCAVELICA', '01', 1, 9),
(82, 'ACOBAMBA', '02', 1, 9),
(83, 'ANGARAES', '03', 1, 9),
(84, 'CASTROVIRREYNA', '04', 1, 9),
(85, 'CHURCAMPA', '05', 1, 9),
(86, 'HUAYTARA', '06', 1, 9),
(87, 'TAYACAJA', '07', 1, 9),
(88, 'HUANUCO', '01', 1, 10),
(89, 'AMBO', '02', 1, 10),
(90, 'DOS DE MAYO', '03', 1, 10),
(91, 'HUACAYBAMBA', '04', 1, 10),
(92, 'HUAMALIES', '05', 1, 10),
(93, 'LEONCIO PRADO', '06', 1, 10),
(94, 'MARAÑON', '07', 1, 10),
(95, 'PACHITEA', '08', 1, 10),
(96, 'PUERTO INCA', '09', 1, 10),
(97, 'LAURICOCHA', '10', 1, 10),
(98, 'YAROWILCA', '11', 1, 10),
(99, 'ICA', '01', 1, 11),
(100, 'CHINCHA', '02', 1, 11),
(101, 'NAZCA', '03', 1, 11),
(102, 'PALPA', '04', 1, 11),
(103, 'PISCO', '05', 1, 11),
(104, 'HUANCAYO', '01', 1, 12),
(105, 'CONCEPCION', '02', 1, 12),
(106, 'CHANCHAMAYO', '03', 1, 12),
(107, 'JAUJA', '04', 1, 12),
(108, 'JUNIN', '05', 1, 12),
(109, 'SATIPO', '06', 1, 12),
(110, 'TARMA', '07', 1, 12),
(111, 'YAULI', '08', 1, 12),
(112, 'CHUPACA', '09', 1, 12),
(113, 'TRUJILLO', '01', 1, 13),
(114, 'ASCOPE', '02', 1, 13),
(115, 'BOLIVAR', '03', 1, 13),
(116, 'CHEPEN', '04', 1, 13),
(117, 'JULCAN', '05', 1, 13),
(118, 'OTUZCO', '06', 1, 13),
(119, 'PACASMAYO', '07', 1, 13),
(120, 'PATAZ', '08', 1, 13),
(121, 'SANCHEZ CARRION', '09', 1, 13),
(122, 'SANTIAGO DE CHUCO', '10', 1, 13),
(123, 'GRAN CHIMU', '11', 1, 13),
(124, 'VIRU', '12', 1, 13),
(125, 'CHICLAYO', '01', 1, 14),
(126, 'FERREÑAFE', '02', 1, 14),
(127, 'LAMBAYEQUE', '03', 1, 14),
(128, 'LIMA', '01', 1, 15),
(129, 'BARRANCA', '02', 1, 15),
(130, 'CAJATAMBO', '03', 1, 15),
(131, 'CANTA', '04', 1, 15),
(132, 'CAÑETE', '05', 1, 15),
(133, 'HUARAL', '06', 1, 15),
(134, 'HUAROCHIRI', '07', 1, 15),
(135, 'HUAURA', '08', 1, 15),
(136, 'OYON', '09', 1, 15),
(137, 'YAUYOS', '10', 1, 15),
(138, 'MAYNAS', '01', 1, 16),
(139, 'ALTO AMAZONAS', '02', 1, 16),
(140, 'LORETO', '03', 1, 16),
(141, 'MARISCAL RAMON CASTILLA', '04', 1, 16),
(142, 'REQUENA', '05', 1, 16),
(143, 'UCAYALI', '06', 1, 16),
(144, 'DATEM MARAÑON', '07', 1, 16),
(145, 'PUTUMAYO', '08', 1, 16),
(146, 'TAMBOPATA', '01', 1, 17),
(147, 'MANU', '02', 1, 17),
(148, 'TAHUAMANU', '03', 1, 17),
(149, 'MARISCAL NIETO', '01', 1, 18),
(150, 'GENERAL SANCHEZ CERRO', '02', 1, 18),
(151, 'ILO', '03', 1, 18),
(152, 'PASCO', '01', 1, 19),
(153, 'DANIEL ALCIDES CARRION', '02', 1, 19),
(154, 'OXAPAMPA', '03', 1, 19),
(155, 'PIURA', '01', 1, 20),
(156, 'AYABACA', '02', 1, 20),
(157, 'HUANCABAMBA', '03', 1, 20),
(158, 'MORROPON', '04', 1, 20),
(159, 'PAITA', '05', 1, 20),
(160, 'SULLANA', '06', 1, 20),
(161, 'TALARA', '07', 1, 20),
(162, 'SECHURA', '08', 1, 20),
(163, 'PUNO', '01', 1, 21),
(164, 'AZANGARO', '02', 1, 21),
(165, 'CARABAYA', '03', 1, 21),
(166, 'CHUCUITO', '04', 1, 21),
(167, 'EL COLLAO', '05', 1, 21),
(168, 'HUANCANE', '06', 1, 21),
(169, 'LAMPA', '07', 1, 21),
(170, 'MELGAR', '08', 1, 21),
(171, 'MOHO', '09', 1, 21),
(172, 'SAN ANTONIO DE PUTINA', '10', 1, 21),
(173, 'SAN ROMAN', '11', 1, 21),
(174, 'SANDIA', '12', 1, 21),
(175, 'YUNGUYO', '13', 1, 21),
(176, 'MOYOBAMBA', '01', 1, 22),
(177, 'BELLAVISTA', '02', 1, 22),
(178, 'EL DORADO', '03', 1, 22),
(179, 'HUALLAGA', '04', 1, 22),
(180, 'LAMAS', '05', 1, 22),
(181, 'MARISCAL CACERES', '06', 1, 22),
(182, 'PICOTA', '07', 1, 22),
(183, 'RIOJA', '08', 1, 22),
(184, 'SAN MARTIN', '09', 1, 22),
(185, 'TOCACHE', '10', 1, 22),
(186, 'TACNA', '01', 1, 23),
(187, 'CANDARAVE', '02', 1, 23),
(188, 'JORGE BASADRE', '03', 1, 23),
(189, 'TARATA', '04', 1, 23),
(190, 'TUMBES', '01', 1, 24),
(191, 'CONTRALMIRANTE VILLAR', '02', 1, 24),
(192, 'ZARUMILLA', '03', 1, 24),
(193, 'CORONEL PORTILLO', '01', 1, 25),
(194, 'ATALAYA', '02', 1, 25),
(195, 'PADRE ABAD', '03', 1, 25),
(196, 'PURUS', '04', 1, 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicidads`
--

CREATE TABLE `publicidads` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `superior` text DEFAULT NULL,
  `urlsuperior` text DEFAULT NULL,
  `slider` text DEFAULT NULL,
  `urlslider` text DEFAULT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `publicidads`
--

INSERT INTO `publicidads` (`id`, `nombre`, `superior`, `urlsuperior`, `slider`, `urlslider`, `estado`) VALUES
(1, 'Campaña escolar 2022', 'public/publicidad/cintillo_desktop_delivery24hrs.gif', 'http://tiendas.test/#', 'public/publicidad/270222_desktop_escolar.png', 'http://tiendas.test/#', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rapidas`
--

CREATE TABLE `rapidas` (
  `id` int(11) NOT NULL,
  `img` varchar(45) NOT NULL,
  `url` text NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `rapidas`
--

INSERT INTO `rapidas` (`id`, `img`, `url`, `estado`) VALUES
(1, 'public/rapidas/dep_mujer.png', 'https:/tienda.sysapp.dev/#', 1),
(2, 'public/rapidas/dep_hombre.png', 'https:/tienda.sysapp.dev/#', 1),
(3, 'public/rapidas/dep_basicos.png', 'https:/tienda.sysapp.dev/#', 1),
(4, 'public/rapidas/dep_kids.png', 'https:/tienda.sysapp.dev/#', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reclamos`
--

CREATE TABLE `reclamos` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `documento` varchar(12) NOT NULL,
  `cliente` varchar(150) NOT NULL,
  `domicilio` text NOT NULL,
  `email` varchar(150) NOT NULL,
  `celular` varchar(12) NOT NULL,
  `telefono` varchar(9) DEFAULT NULL,
  `menor` tinyint(1) NOT NULL,
  `docpadre` varchar(1) DEFAULT NULL,
  `numpadre` varchar(12) DEFAULT NULL,
  `padre` varchar(150) DEFAULT NULL,
  `emailpadre` varchar(150) DEFAULT NULL,
  `telefonopadre` varchar(12) DEFAULT NULL,
  `bien` varchar(1) DEFAULT NULL,
  `fechapedido` date DEFAULT NULL,
  `detalle` text DEFAULT NULL,
  `importe` float(10,2) DEFAULT NULL,
  `pedido` text DEFAULT NULL,
  `estado` varchar(1) DEFAULT NULL,
  `respondable` varchar(150) DEFAULT NULL,
  `fecharspta` date DEFAULT NULL,
  `ano` varchar(4) DEFAULT NULL,
  `resolucion` text DEFAULT NULL,
  `distritos_id` int(11) NOT NULL,
  `canals_id` int(3) NOT NULL,
  `conceptos_id` int(3) NOT NULL,
  `tiendas_id` int(3) NOT NULL,
  `documentos_id` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `reclamos`
--

INSERT INTO `reclamos` (`id`, `fecha`, `hora`, `documento`, `cliente`, `domicilio`, `email`, `celular`, `telefono`, `menor`, `docpadre`, `numpadre`, `padre`, `emailpadre`, `telefonopadre`, `bien`, `fechapedido`, `detalle`, `importe`, `pedido`, `estado`, `respondable`, `fecharspta`, `ano`, `resolucion`, `distritos_id`, `canals_id`, `conceptos_id`, `tiendas_id`, `documentos_id`) VALUES
(1, '2022-03-11', '19:40:07', '40773415', 'Nilton rivera silva', 'Callao', 'nrivera.web@gmail.com', '975305779', '975305779', 0, NULL, NULL, NULL, NULL, NULL, 'P', '2022-03-11', 'xxxx', 120.00, 'xxxx', 'I', NULL, NULL, '2022', NULL, 1126, 1, 3, 1, '1'),
(2, '2022-03-11', '19:40:07', '40773415', 'Nilton rivera silva', 'Callao', 'nrivera.web@gmail.com', '975305779', '975305779', 0, NULL, NULL, NULL, NULL, NULL, 'P', '2022-03-11', 'xxxx', 120.00, 'xxxx', 'I', NULL, NULL, '2022', NULL, 1126, 1, 3, 1, '1'),
(3, '2022-03-11', '19:40:07', '40773415', 'Nilton rivera silva', 'Callao', 'nrivera.web@gmail.com', '975305779', '975305779', 0, NULL, NULL, NULL, NULL, NULL, 'P', '2022-03-11', 'xxxx', 120.00, 'xxxx', 'I', NULL, NULL, '2022', NULL, 1126, 1, 3, 1, '1'),
(4, '2022-03-11', '19:40:07', '40773415', 'Nilton rivera silva', 'Callao', 'nrivera.web@gmail.com', '975305779', '975305779', 0, NULL, NULL, NULL, NULL, NULL, 'P', '2022-03-11', 'xxxx', 120.00, 'xxxx', 'I', NULL, NULL, '2022', NULL, 1126, 1, 3, 1, '1'),
(5, '2022-03-11', '19:40:07', '40773415', 'Nilton rivera silva', 'Callao', 'nrivera.web@gmail.com', '975305779', '975305779', 0, NULL, NULL, NULL, NULL, NULL, 'P', '2022-03-11', 'xxxx', 120.00, 'xxxx', 'I', NULL, NULL, '2022', NULL, 1126, 1, 3, 1, '1'),
(6, '2022-03-11', '19:53:10', '40773415', 'Nilton rivera silva', 'Callao', 'nrivera.web@gmail.com', '975305779', '975305779', 0, NULL, NULL, NULL, NULL, NULL, 'P', '2022-03-11', 'ssss', 100.00, 'ssss', 'I', NULL, NULL, '2022', NULL, 252, 1, 1, 1, '1'),
(7, '2022-03-11', '19:55:26', '40773415', 'Nilton rivera silva', 'Callao', 'nrivera.web@gmail.com', '975305779', '975305779', 0, NULL, NULL, NULL, NULL, NULL, 'P', '2022-03-11', 'ssss', 100.00, 'ssss', 'I', NULL, NULL, '2022', NULL, 443, 1, 3, 2, '1'),
(8, '2022-03-11', '20:00:18', '40773415', 'Nilton rivera silva', 'Callao', 'nrivera.web@gmail.com', '975305779', '975305779', 0, NULL, NULL, NULL, NULL, NULL, 'P', '2022-03-11', 'ssss', 100.00, 'ssss', 'I', NULL, NULL, '2022', NULL, 85, 1, 1, 1, '1'),
(9, '2022-03-11', '20:02:21', '40773415', 'Nilton rivera silva', 'Callao', 'nrivera.web@gmail.com', '975305779', '975305779', 0, NULL, NULL, NULL, NULL, NULL, 'P', '2022-03-11', 'ssss', 100.00, 'ssss', 'I', NULL, NULL, '2022', NULL, 2, 1, 3, 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reds`
--

CREATE TABLE `reds` (
  `id` int(3) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `ruta` varchar(150) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `reds`
--

INSERT INTO `reds` (`id`, `nombre`, `ruta`, `estado`) VALUES
(1, 'whatsapp', 'zxzxzxzxzx', 1),
(2, 'facebook', 'ggggg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestas`
--

CREATE TABLE `respuestas` (
  `id` int(11) NOT NULL,
  `respuesta` text NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `responsable` varchar(45) NOT NULL,
  `reclamos_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0DYhJ04iRJkY4B8Nvg8D8Sg7KC6Gp2tu1T3HxGLi', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiUFVJZTFibUtSRVdqcFoyZWhxOHdTSTJFanZDTnM3VlE4RW5kZzU3dSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTg6Imh0dHA6Ly90aWVuZGEudGVzdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRCUjFtNS9tWE9VRHI5ckR5YmtuczJlZlZYYmlMdmRMY0dHdEFjTGVSNTdCSkFGZHV6dmlZcSI7fQ==', 1650928749),
('6BzEDlWuhjbaNaPZZb6NSUudWUcwJoBfwDAmlENJ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiaDhSQ21aUlZicm5EdmRQbmdYRjRhMTBpRklCMEl6aFBJdTlkQm82YiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1650817392),
('A4Tvy1n7NQaV0G6pcb43olaWR3Vry2B5vtAsBito', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZHNFVXhObzQ4VmNreEwwQ3owWjR1N25YWjhISlJUVzc3T0czOXMyOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly90aWVuZGEudGVzdC9jYXRhbG9nby9wcm9kdWN0by8xIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1650828810),
('vdFLaMKhOWbx7qOIi0MzCrlHmlhSi6oEm8lrwwoF', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiczdtbnI4b1g2WDJ5ZUhkOGx1TXpjZWg0eXUza2p6RFdqZEkxbDhyRiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1650928740);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sliders`
--

CREATE TABLE `sliders` (
  `id` int(2) NOT NULL,
  `imagen` text NOT NULL,
  `mensaje` text DEFAULT NULL,
  `boton` varchar(45) DEFAULT NULL,
  `enlace` varchar(200) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `sliders`
--

INSERT INTO `sliders` (`id`, `imagen`, `mensaje`, `boton`, `enlace`, `estado`) VALUES
(2, 'public/slider/1.jpg', NULL, NULL, NULL, 1),
(3, 'public/slider/2.jpg', NULL, NULL, NULL, 1),
(4, 'public/slider/3.jpg', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suscriptors`
--

CREATE TABLE `suscriptors` (
  `id` int(11) NOT NULL,
  `email` varchar(150) NOT NULL,
  `fecnac` date NOT NULL,
  `genero` varchar(1) NOT NULL,
  `ninos` varchar(1) DEFAULT NULL,
  `politicaproteccion` varchar(1) NOT NULL,
  `fecreg` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tallas`
--

CREATE TABLE `tallas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(70) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tallas`
--

INSERT INTO `tallas` (`id`, `nombre`, `descripcion`, `estado`) VALUES
(1, 'TU', 'talla unica', 1),
(2, 'XS', 'extra small', 1),
(3, 'S', 'Small', 1),
(4, 'M', 'mediano', 1),
(5, 'L', 'Large', 1),
(6, 'XL', 'Extra Large', 1),
(7, '22', 'talla', 1),
(8, '23', NULL, 1),
(9, '24', NULL, 1),
(10, '25', NULL, 1),
(11, '26', NULL, 1),
(12, '27', NULL, 1),
(13, '28', NULL, 1),
(14, '29', NULL, 1),
(15, '30', NULL, 1),
(16, '31', NULL, 1),
(17, '32', NULL, 1),
(18, '33', NULL, 1),
(19, '34', NULL, 1),
(20, '35', NULL, 1),
(21, '36', NULL, 1),
(22, '37', NULL, 1),
(23, '38', NULL, 1),
(24, '39', NULL, 1),
(25, '40', NULL, 1),
(26, '41', NULL, 1),
(27, '42', NULL, 1),
(28, '43', NULL, 1),
(29, '44', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_team` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `teams`
--

INSERT INTO `teams` (`id`, `user_id`, `name`, `personal_team`, `created_at`, `updated_at`) VALUES
(1, 1, 'ingenieria', 1, '2021-12-14 00:33:42', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiendas`
--

CREATE TABLE `tiendas` (
  `id` int(3) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `empresa` varchar(100) NOT NULL,
  `ruc` varchar(11) NOT NULL,
  `direccion` text NOT NULL,
  `telefono` varchar(12) DEFAULT NULL,
  `imagen` text DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  `empresas_id` int(2) NOT NULL,
  `urldireccion` text NOT NULL,
  `detalle` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tiendas`
--

INSERT INTO `tiendas` (`id`, `nombre`, `empresa`, `ruc`, `direccion`, `telefono`, `imagen`, `estado`, `empresas_id`, `urldireccion`, `detalle`) VALUES
(1, 'Sede Principal', 'La Tienda - sede principal', '12345678901', 'AV. 28 DE JULIO 123', '1231234', NULL, 1, 1, 'Domingo: 09:30 am - 06:30 pm', NULL),
(2, 'SEDE WILSON', 'LA TIENDA - SEDE WILSON', '12345678901', 'AV. WILSON 258', '1231234', NULL, 1, 1, '', NULL),
(3, 'Sede Callao', 'La tienda callao', '12345678901', 'la perla', NULL, NULL, 1, 1, '', NULL),
(5, 'Sede Los Olivos', 'La Tienda', '12345678901', 'Av. Universitaria 1234', '1234567', 'public/tiendas/FONDO.jpg', 1, 1, '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3902.5384215017652!2d-77.08505398578836!3d-12.006407744418603!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105ce8c517460b3%3A0x284407572bdfd5e2!2sAv.%20Universitaria%202701%2C%20Los%20Olivos%2015108!5e0!3m2!1ses-419!2spe!4v1648681377822!5m2!1ses-419!2spe\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 'Lunes a Sábado: 09:30 am - 06:30 pm\r\nDomingo: 09:30 am - 06:30 pm');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos`
--

CREATE TABLE `tipos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  `imagen` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tipos`
--

INSERT INTO `tipos` (`id`, `nombre`, `descripcion`, `estado`, `imagen`) VALUES
(1, 'Polos', NULL, 1, 'public/guias/tallas_xiomi_mujer.webp'),
(2, 'Blusas', NULL, 1, 'public/guias/tallas_xiomi_mujer.webp'),
(3, 'Pantalones', NULL, 1, NULL),
(4, 'Shorts', NULL, 1, NULL),
(5, 'Chompas', NULL, 1, 'public/guias/tallas_xiomi_mujer.webp'),
(6, 'Vestidos', NULL, 1, NULL),
(7, 'Casacas', NULL, 1, NULL),
(8, 'Poleras', NULL, 1, NULL),
(9, 'Enterizos', NULL, 1, NULL),
(10, 'Bermudas', NULL, 1, NULL),
(11, 'BVDs', NULL, 1, NULL),
(12, 'Camisas', NULL, 1, NULL),
(13, 'Chalecos', NULL, 1, NULL),
(14, 'Jeans', NULL, 1, NULL),
(15, 'Ropa Interior', NULL, 1, NULL),
(16, 'Pijamas', NULL, 1, NULL),
(17, 'Leggings', NULL, 1, NULL),
(18, 'Abrigos', NULL, 1, NULL),
(19, 'Tops', NULL, 1, NULL),
(20, 'Mascarillas', NULL, 1, NULL),
(21, 'Zapatilla', 'ninguno', 1, 'public/guias/tallas_bata_a.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `logusu` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rol` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `logusu`, `password`, `rol`, `provider_id`, `avatar`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Ing. Nilton E. Rivera Silva', 'nrivera.web@gmail.com', NULL, 'nrivera', '$2y$10$BR1m5/mXOUDr9rDybkns2efVXbiLvdLcGGtAcLeR57BJAFduzviYq', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-14 06:10:12', '2022-03-30 17:03:37'),
(2, 'Humberto Medina', 'hmedina@gmail.com', NULL, 'hmedina', '$2y$10$A2AUR9cDDvmKY2qMsOIKEehuEk9WlBj9edEwX.4D6g1ZNWxE1G4rC', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-11 01:47:41', '2022-03-11 01:47:41');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `baners`
--
ALTER TABLE `baners`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `canals`
--
ALTER TABLE `canals`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_categorias_categorias1_idx` (`categorias_id`);

--
-- Indices de la tabla `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `conceptos`
--
ALTER TABLE `conceptos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `deseos`
--
ALTER TABLE `deseos`
  ADD KEY `fk_users_has_productos_productos1_idx` (`productos_id`),
  ADD KEY `fk_users_has_productos_users1_idx` (`users_id`);

--
-- Indices de la tabla `detallebaners`
--
ALTER TABLE `detallebaners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_detallebaners_baners1_idx` (`baners_id`);

--
-- Indices de la tabla `distritos`
--
ALTER TABLE `distritos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_distritos_provincias_idx` (`provincias_id`);

--
-- Indices de la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `fits`
--
ALTER TABLE `fits`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `fotos`
--
ALTER TABLE `fotos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_fotos_productos1_idx` (`productos_id`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_productos_categorias1_idx` (`categorias_id`),
  ADD KEY `fk_productos_marcas1_idx` (`marcas_id`),
  ADD KEY `fk_productos_tipos1_idx` (`tipos_id`),
  ADD KEY `fk_productos_fits1_idx` (`fits_id`),
  ADD KEY `fk_productos_colors1_idx` (`colors_id`);

--
-- Indices de la tabla `producto_tallas`
--
ALTER TABLE `producto_tallas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_productos_tallas_productos1_idx` (`productos_id`),
  ADD KEY `fk_productos_tallas_tallas1_idx` (`tallas_id`);

--
-- Indices de la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_provincias_departamentos1_idx` (`departamentos_id`);

--
-- Indices de la tabla `publicidads`
--
ALTER TABLE `publicidads`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rapidas`
--
ALTER TABLE `rapidas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reclamos`
--
ALTER TABLE `reclamos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_reclamos_distritos1_idx` (`distritos_id`),
  ADD KEY `fk_reclamos_canals1_idx` (`canals_id`),
  ADD KEY `fk_reclamos_conceptos1_idx` (`conceptos_id`),
  ADD KEY `fk_reclamos_tiendas1_idx` (`tiendas_id`),
  ADD KEY `fk_reclamos_documentos1_idx` (`documentos_id`);

--
-- Indices de la tabla `reds`
--
ALTER TABLE `reds`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_respuestas_reclamos2_idx` (`reclamos_id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `suscriptors`
--
ALTER TABLE `suscriptors`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tallas`
--
ALTER TABLE `tallas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teams_user_id_index` (`user_id`);

--
-- Indices de la tabla `tiendas`
--
ALTER TABLE `tiendas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tiendas_empresas1_idx` (`empresas_id`);

--
-- Indices de la tabla `tipos`
--
ALTER TABLE `tipos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `baners`
--
ALTER TABLE `baners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `canals`
--
ALTER TABLE `canals`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `conceptos`
--
ALTER TABLE `conceptos`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `detallebaners`
--
ALTER TABLE `detallebaners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `distritos`
--
ALTER TABLE `distritos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1857;

--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fits`
--
ALTER TABLE `fits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `fotos`
--
ALTER TABLE `fotos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `producto_tallas`
--
ALTER TABLE `producto_tallas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `provincias`
--
ALTER TABLE `provincias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT de la tabla `publicidads`
--
ALTER TABLE `publicidads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `rapidas`
--
ALTER TABLE `rapidas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `reclamos`
--
ALTER TABLE `reclamos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `reds`
--
ALTER TABLE `reds`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `suscriptors`
--
ALTER TABLE `suscriptors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tallas`
--
ALTER TABLE `tallas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tiendas`
--
ALTER TABLE `tiendas`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tipos`
--
ALTER TABLE `tipos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD CONSTRAINT `fk_categorias_categorias1` FOREIGN KEY (`categorias_id`) REFERENCES `categorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detallebaners`
--
ALTER TABLE `detallebaners`
  ADD CONSTRAINT `fk_detallebaners_baners1` FOREIGN KEY (`baners_id`) REFERENCES `baners` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `distritos`
--
ALTER TABLE `distritos`
  ADD CONSTRAINT `fk_distritos_provincias` FOREIGN KEY (`provincias_id`) REFERENCES `provincias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `fotos`
--
ALTER TABLE `fotos`
  ADD CONSTRAINT `fk_fotos_productos1` FOREIGN KEY (`productos_id`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_productos_categorias1` FOREIGN KEY (`categorias_id`) REFERENCES `categorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_productos_colors1` FOREIGN KEY (`colors_id`) REFERENCES `colors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_productos_fits1` FOREIGN KEY (`fits_id`) REFERENCES `fits` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_productos_marcas1` FOREIGN KEY (`marcas_id`) REFERENCES `marcas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_productos_tipos1` FOREIGN KEY (`tipos_id`) REFERENCES `tipos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto_tallas`
--
ALTER TABLE `producto_tallas`
  ADD CONSTRAINT `fk_productos_tallas_productos1` FOREIGN KEY (`productos_id`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_productos_tallas_tallas1` FOREIGN KEY (`tallas_id`) REFERENCES `tallas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD CONSTRAINT `fk_provincias_departamentos1` FOREIGN KEY (`departamentos_id`) REFERENCES `departamentos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reclamos`
--
ALTER TABLE `reclamos`
  ADD CONSTRAINT `fk_reclamos_canals1` FOREIGN KEY (`canals_id`) REFERENCES `canals` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_reclamos_conceptos1` FOREIGN KEY (`conceptos_id`) REFERENCES `conceptos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_reclamos_distritos1` FOREIGN KEY (`distritos_id`) REFERENCES `distritos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_reclamos_documentos1` FOREIGN KEY (`documentos_id`) REFERENCES `documentos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_reclamos_tiendas1` FOREIGN KEY (`tiendas_id`) REFERENCES `tiendas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD CONSTRAINT `fk_respuestas_reclamos2` FOREIGN KEY (`reclamos_id`) REFERENCES `reclamos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tiendas`
--
ALTER TABLE `tiendas`
  ADD CONSTRAINT `fk_tiendas_empresas1` FOREIGN KEY (`empresas_id`) REFERENCES `empresas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
