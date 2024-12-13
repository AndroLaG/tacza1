-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-11-2023 a las 00:57:01
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.0.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ven`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_factura` (IN `id` INT, IN `idv` INT)  NO SQL
insert into factura values(null,id,null,null,null,idv)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_productos` (IN `n` VARCHAR(100) CHARSET utf8, IN `p` INT(11), IN `st` INT(11), IN `t` INT(11), IN `c` VARCHAR(9) CHARSET utf8)  NO SQL
insert into productos values(null,n,p,st,t,c)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editar_productos` (IN `n` VARCHAR(45) CHARSET utf8, IN `p` INT(11), IN `st` INT(11), IN `t` INT(11), IN `id` INT(11), IN `c` VARCHAR(9) CHARSET utf8)  NO SQL
update productos
set nom_producto=n, precio=p, stock=st, id_tipo=t, condicion=c
where id_producto=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_productos` (IN `id` INT(11), IN `c` VARCHAR(9) CHARSET utf8)  NO SQL
update productos
SET
condicion=c
where id_producto=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_productos` ()  NO SQL
select * from productos$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_productos_id` (IN `id` INT(11))  NO SQL
select * from productos where id_producto=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_tipo` ()  NO SQL
select * from tipo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_agregar_cliente` (IN `nom` VARCHAR(60) CHARSET utf8, IN `dir` VARCHAR(60) CHARSET utf8, IN `tel` VARCHAR(45) CHARSET utf8)  insert INTO cliente VALUES(null,nom,dir,tel)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cliente_id` (IN `id` INT)  SELECT * FROM cliente where id_cliente=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_detalle_factura` (IN `id` INT, IN `idp` INT, IN `can` INT, IN `pre` INT)  insert into detalle_factura values (id,idp,can,pre)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_editar_factura` (IN `id` INT, IN `st` INT, IN `igv` INT, IN `total` INT)  update factura
set
subtotal=st,
igv=igv,
total=total
where id_factura=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listar` (IN `id` INT(11))  SELECT * FROM productos WHERE id_producto=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listar_facturas` ()  select 
            f.id_factura,c.nom_cliente,f.id_cliente,f.fecha,f.subtotal,f.igv,f.total,f.condicion
             from
              factura as f,cliente as c
              where
              f.id_cliente=c.id_cliente
              order by f.id_factura asc$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listar_vendedores` ()  NO SQL
SELECT * FROM vendedor$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_modificar_cliente` (IN `nom` VARCHAR(60) CHARSET utf8, IN `dir` VARCHAR(60) CHARSET utf8, IN `tel` VARCHAR(45) CHARSET utf8, IN `id` INT)  update cliente 
set
nom_cliente=nom,
direccion=dir,
telefono=tel                
where id_cliente=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_producto_stock` (IN `idp` INT, IN `sto` INT)  update productos
set
stock=stock - sto
where id_producto=idp$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nom_cliente` varchar(60) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `direccion` varchar(60) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `telefono` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nom_cliente`, `direccion`, `telefono`) VALUES
(1, 'JUAN PEREIRA TORRES', 'AV. EL SOL 988', '954635436'),
(2, 'MARIA TERRONES LUNA', 'AV. CESAR VALLEJO 346', '94536239'),
(3, 'MARIO MORENO TORRES', 'AV. MARIATEGUI 897', '934253745'),
(4, 'MARCOS ANTONIO SANDOVAL', 'AV. MASYDASE 666', '94389547'),
(5, 'JOSE EDUARDO VEGA ESTRADA', 'AV. JORGE CHAVEZ 678', '95498293'),
(30, 'NATHALY ROJAS VEGA', 'AV. JORGE CHAVEZ 150', '97834673'),
(31, 'MATHIAS MAMANI ROJAS', 'AV. MATHI MATHI 345', '93290589'),
(32, 'VALERIA MAMANI ROJAS', 'AV. NOSE 676', '93247854'),
(35, 'FRANCISCO NAHUEL CRUZ VEGA', 'AV. AREQUIPA 777', '97676785'),
(108, 'BLANCA ESTRADA AÑORGA', 'AV. AREQUIPA 444', '34543456'),
(119, 'JUAN CARLOS HERNANDEZ SAONA', 'AV. MICAELA BASTIDAS 666', '98475776'),
(120, 'MARIAPAZ CRUZ VEGA', 'AV. JORGE CHAVEZ 283', '98475746'),
(128, 'MIGUEL CHIPANA BARRIENTOS', 'AV. SANTA ANITA 234', '92344378'),
(130, 'MAURO CULI JANAMPA', 'AV. MICAELA BASTIDAS 543', '94654654'),
(131, 'MARIA CABRERA LOPEZ', 'AV. MARIATEGI 456', '95564673'),
(132, 'JAVIER CARMONA ALVAREZ', 'AV. SAN BORJA 6643', '94362737'),
(160, 'PAOLO GUERRERO', 'AV. LA VIDENA 567', '954463564'),
(161, 'MANUEL VARGAS', 'AV. NOSE', '988847545'),
(162, 'ROBERTO PALACIOS', 'AV. CHORRILLOS 555', '966655443'),
(191, 'SDFSD', 'SDFSDF', '243234356');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `destinatario_factura`
--

CREATE TABLE `destinatario_factura` (
  `id_destinatario_factura` int(11) NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `rut` varchar(50) NOT NULL,
  `direccion` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `ciudad` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `comuna` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `fax` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `destinatario_factura`
--

INSERT INTO `destinatario_factura` (`id_destinatario_factura`, `nombre`, `rut`, `direccion`, `ciudad`, `comuna`, `telefono`, `correo`, `fax`) VALUES
(1, 'Harry Potter', '8976786786', 'hascabán', 'haward', 'los magos', '4543', 'magia@gmail.com', '9879798'),
(2, 'ron wisly', '876786', 'amigo de harry', 'haward', 'haward', '98798', 'ron@hotmail.com', '8978'),
(3, 'hermaioni ', '897678678', 'vive en santiago', 'santiago', 'la florida', '0989', 'maga@yahoo.es', '9087'),
(4, 'lord voldemort', '43543', 'el inframundo', 'san josé', 'san josé', '89798', 'magonegro@hotmail.com', '7897987'),
(5, 'albios ceverus', '987987', 'su mansión', 'haward', 'haward', '98789', 'magocobarde@hotmail.com', '789798'),
(6, 'lucius malfoy', '98798', 'su casa millonaria', 'destierro', '98789', '98798', 'maguito@malofoy.com', '897');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_factura`
--

CREATE TABLE `detalle_factura` (
  `id_factura` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `detalle_factura`
--

INSERT INTO `detalle_factura` (`id_factura`, `id_producto`, `cantidad`, `precio`) VALUES
(1, 1, 2, 250),
(3, 1, 1, 250),
(4, 1, 1, 250),
(9, 1, 2, 250),
(12, 1, 2, 250),
(16, 1, 1, 250),
(19, 1, 1, 2221),
(20, 1, 1, 2221),
(21, 1, 2, 2221),
(22, 1, 2, 2221),
(23, 1, 2, 2221),
(25, 1, 2, 300),
(26, 1, 2, 300),
(27, 1, 2, 300),
(29, 1, 2, 670),
(48, 1, 2, 670),
(49, 1, 2, 670),
(50, 1, 3, 670),
(51, 1, 2, 670),
(52, 1, 2, 670),
(53, 1, 2, 670),
(54, 1, 2, 670),
(56, 1, 2, 670),
(58, 1, 2, 670),
(1, 2, 1, 300),
(10, 2, 1, 300),
(15, 2, 2, 300),
(2, 3, 2, 400),
(8, 3, 1, 400),
(26, 3, 10, 3),
(28, 3, 10, 3),
(32, 3, 2, 50),
(40, 3, 2, 50),
(41, 3, 2, 50),
(42, 3, 2, 50),
(45, 3, 3, 50),
(3, 4, 2, 19),
(7, 4, 1, 19),
(8, 4, 2, 19),
(12, 4, 4, 19),
(14, 4, 1, 19),
(15, 4, 1, 19),
(16, 4, 1, 19),
(17, 4, 2, 19),
(25, 4, 1, 2),
(28, 4, 10, 2),
(7, 5, 2, 30),
(9, 5, 4, 30),
(11, 5, 1, 30),
(12, 5, 3, 30),
(13, 5, 20, 30),
(29, 5, 3, 60),
(43, 5, 2, 60),
(46, 5, 2, 60),
(48, 5, 2, 60),
(3, 6, 2, 90),
(4, 6, 2, 90),
(12, 6, 1, 90),
(17, 6, 1, 90),
(44, 6, 2, 45),
(45, 6, 2, 45),
(47, 6, 1, 45),
(50, 6, 1, 45),
(19, 7, 2, 45),
(20, 7, 2, 45),
(32, 7, 1, 45),
(40, 7, 1, 45),
(41, 7, 1, 45),
(42, 7, 1, 45),
(46, 7, 4, 45),
(54, 7, 1, 45),
(56, 7, 2, 45),
(27, 8, 10, 300),
(43, 8, 1, 300),
(44, 9, 3, 300),
(45, 9, 3, 300),
(47, 9, 2, 300),
(53, 9, 2, 300),
(58, 9, 1, 300);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `id_detalle_venta` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_factura` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`id_detalle_venta`, `id_producto`, `cantidad`, `id_factura`) VALUES
(1, 1, 2, 3),
(2, 2, 3, 3),
(3, 1, 3, 5),
(4, 2, 3, 5),
(5, 3, 2, 4),
(6, 5, 4, 4),
(7, 1, 2, 7),
(8, 2, 3, 7),
(9, 3, 1, 9),
(10, 5, 1, 9),
(11, 6, 1, 9),
(12, 4, 2, 9),
(13, 1, 2, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id_factura` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `subtotal` int(11) DEFAULT NULL,
  `igv` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `condicion` varchar(11) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id_factura`, `id_cliente`, `fecha`, `subtotal`, `igv`, `total`, `condicion`) VALUES
(1, 2, '2021-11-11', 800, 152, 952, 'ACTIVO'),
(2, 3, '2021-12-23', 400, 76, 476, 'ACTIVO'),
(4, 3, '2022-01-12', 430, 82, 512, 'ACTIVO'),
(7, 1, '2022-01-31', 79, 15, 94, 'ACTIVO'),
(8, 1, '2022-02-02', 438, 83, 521, 'ACTIVO'),
(9, 1, '2022-02-10', 620, 118, 738, 'ACTIVO'),
(10, 3, '2022-02-18', 300, 57, 357, 'ACTIVO'),
(11, 2, '2022-02-28', 30, 6, 36, 'ACTIVO'),
(12, 1, '2022-03-01', 756, 144, 900, 'ACTIVO'),
(13, 3, '2022-03-11', 600, 114, 714, 'ACTIVO'),
(14, 3, '2022-03-08', 19, 4, 23, 'ACTIVO'),
(15, 2, '2022-03-11', 619, 118, 737, 'ACTIVO'),
(16, 1, '2022-03-24', 269, 51, 320, 'ACTIVO'),
(17, 2, '2022-04-02', 128, 24, 152, 'ACTIVO'),
(19, 2, '2022-04-05', 2311, 439, 2750, 'ACTIVO'),
(20, 3, '2022-04-05', 2311, 439, 2750, 'ACTIVO'),
(21, 1, '2022-04-08', 4442, 843, 5285, 'ACTIVO'),
(22, 3, '2022-04-13', 4442, 843, 5285, 'ACTIVO'),
(23, 2, '2022-04-19', 4442, 843, 5285, 'ACTIVO'),
(25, 2, '2022-04-28', 602, 114, 716, 'ACTIVO'),
(26, 1, '2022-04-28', 630, 119, 749, 'ACTIVO'),
(27, 2, '2022-05-03', 3600, 684, 4284, 'ACTIVO'),
(28, 1, '2022-05-10', 50, 9, 59, 'ACTIVO'),
(29, 4, '2022-05-12', 1520, 288, 1808, 'ACTIVO'),
(30, 5, '2022-05-16', 145, 27, 172, 'ACTIVO'),
(31, 108, '2022-05-19', 145, 27, 172, 'ACTIVO'),
(32, 1, '2022-05-22', 145, 27, 172, 'ACTIVO'),
(40, 32, '2022-05-31', 145, 27, 172, 'ACTIVO'),
(41, 4, '2022-06-02', 145, 27, 172, 'ACTIVO'),
(42, 114, '2022-06-08', 145, 27, 172, 'ACTIVO'),
(43, 32, '2022-06-16', 420, 79, 499, 'ACTIVO'),
(44, 35, '2022-06-20', 990, 188, 1178, 'ACTIVO'),
(45, 1, '2022-06-21', 990, 188, 1178, 'ACTIVO'),
(46, 3, '2022-06-29', 300, 57, 357, 'ACTIVO'),
(47, 4, '2022-07-01', 645, 122, 767, 'ACTIVO'),
(48, 35, '2022-07-07', 1460, 277, 1737, 'ACTIVO'),
(49, 1, '2022-07-13', 1340, 254, 1594, 'ACTIVO'),
(50, 2, '2022-07-21', 2055, 390, 2445, 'ACTIVO'),
(51, 4, '2022-07-24', 1340, 254, 1594, 'ACTIVO'),
(52, 1, '2022-07-30', 1340, 254, 1594, 'ACTIVO'),
(53, 3, '2022-08-03', 1940, 368, 2308, 'ACTIVO'),
(54, 2, '2022-08-11', 1385, 263, 1648, 'ACTIVO'),
(55, 2, '2022-08-12', 0, 0, 0, 'ACTIVO'),
(56, 3, '2022-08-18', 1430, 271, 1701, 'ACTIVO'),
(57, 1, '2022-08-22', 0, 0, 0, 'ACTIVO'),
(58, 3, '2022-08-24', 1640, 311, 1951, 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

CREATE TABLE `perfiles` (
  `id_perfil` int(11) NOT NULL,
  `perfil` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `perfiles`
--

INSERT INTO `perfiles` (`id_perfil`, `perfil`) VALUES
(1, 'ADMINISTRADOR'),
(2, 'OPERADOR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nom_producto` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `precio` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `condicion` varchar(9) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nom_producto`, `precio`, `stock`, `id_tipo`, `condicion`) VALUES
(1, 'MONITOR 24\'\' LG', 670, 79, 2, 'ACTIVO'),
(3, 'MOUSE LONGITECH', 50, 143, 4, 'ACTIVO'),
(5, 'USB KISTONG 32GB', 60, 191, 6, 'ACTIVO'),
(6, 'MOUSE OPTICO IBM', 45, 44, 4, 'ACTIVO'),
(7, 'TECLADO LONGITECH', 45, 98, 5, 'ACTIVO'),
(8, 'DISCO DURO SAMSUNG', 300, 89, 1, 'ACTIVO'),
(9, 'DISCO DURO SOLIDO', 300, 189, 3, 'ACTIVO'),
(10, 'IMPRESORA EPSON STYLUS L475', 350, 100, 1, 'ACTIVO'),
(11, 'USB HP 128', 50, 100, 6, 'ACTIVO'),
(12, 'USB', 69, 177, 6, 'ACTIVO'),
(13, 'USB LG 128GB', 70, 100, 6, 'ACTIVO'),
(21, 'BBB', 10, 20, 4, 'ACTIVO'),
(22, 'AAA', 10, 67, 3, 'ACTIVO'),
(23, 'ZZZ', 24, 333, 4, 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `supervisor`
--

CREATE TABLE `supervisor` (
  `id_supervisor` int(11) NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `supervisor`
--

INSERT INTO `supervisor` (`id_supervisor`, `nombre`, `correo`, `telefono`) VALUES
(1, 'Pedro Menares', 'pedro@hotmail.com', '987689'),
(2, 'María Mardónez', 'maria@gmail.com', '342'),
(3, 'César Cancino Zapata', '71373516', 'yo@cesarcancino.com'),
(4, 'Juan Catalán Peña González', 'juanito@hotmail.com', '11122423');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE `tipo` (
  `id_tipo` int(11) NOT NULL,
  `tipo` varchar(45) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`id_tipo`, `tipo`) VALUES
(1, 'IMPRESORAS'),
(2, 'MONITORES'),
(3, 'DISCO DUROS'),
(4, 'MOUSES'),
(5, 'TECLADOS'),
(6, 'USB');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_producto`
--

CREATE TABLE `tipo_producto` (
  `id_tipo` int(11) NOT NULL,
  `tipo` varchar(150) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipo_producto`
--

INSERT INTO `tipo_producto` (`id_tipo`, `tipo`) VALUES
(1, 'Computación'),
(2, 'Abarrotes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuarios` int(11) NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `id_perfil` int(11) NOT NULL,
  `usu` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `pass` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuarios`, `nombre`, `correo`, `fecha_ingreso`, `id_perfil`, `usu`, `pass`) VALUES
(1, 'JOSE EDUARDO VEGA ESTRADA', 'vejose@gmail.com', '2014-08-18', 1, 'JOSE', 'PROFESOR'),
(2, 'ROSA DIAZ TORRES', 'rosa_dt@hotmail.com', '2014-08-18', 2, 'ROSA', 'VENTAS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedor`
--

CREATE TABLE `vendedor` (
  `id_vendedor` int(11) NOT NULL,
  `nom_vendedor` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `direccion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vendedor`
--

INSERT INTO `vendedor` (`id_vendedor`, `nom_vendedor`, `telefono`, `direccion`) VALUES
(1, 'CÉSAR CANCINO', '71373516', 'AV. LOS ALAMOS 344'),
(2, 'Miguel Gutiérrez', '778698', 'AV. LOS GIRASOLES 777'),
(3, 'Andrés Martínez', '98798', 'AV. AVIACIÓN 123'),
(4, 'Carlos Estévez', '09879', 'AV. EL SOL 333'),
(5, 'Gonzalo Pérez', '342', 'AV. REVOLUCIÓN 5644'),
(6, 'Ana Ñandú', '98798798', 'AV. LOS ALAMOS 1234'),
(7, 'Andrés Iniesta', '87988', 'AV. LOS PRECURSORES 989'),
(8, 'juliano robles', '2874555', 'AV. BOLIVAR 100'),
(9, 'jose vega estrada', '2874099', 'AV. JORGE CHAVEZ 367'),
(10, 'anibal torres', '987656782', 'AV. AVIACIÓN 444'),
(13, 'ines torres ccalpa', '657464736', 'AV. LOS GIRASOLES 1234'),
(14, 'aaaa', '6666666', 'AV. LOS PRECURSORES 199'),
(15, 'else torres', '2345678', 'AV. MICAELA BASTIDAS 677'),
(16, 'else torres', '2345678', 'AV. BOLIVAR 555'),
(17, 'pedrito masna', '6666666', 'AV. LOS HEROES 666'),
(18, 'manuel davila carreño', '2874099', 'AV. PACHACAMAC 888'),
(19, 'juanito alimaña', '2676565', 'AV. LOS HEROES 643'),
(20, 'AAAA', '2837465', 'AV. MICAELA BASTIDAS 6999'),
(21, 'MARCOS SANDOVAL YEREN', '998003378', 'AV. CESAR VALLEJO 234'),
(22, 'WILLIAM QUISPE SANTIAGO', '985656666', 'AV. JORGE CHAVEZ 688'),
(23, 'LEONARD CANALES LEON', '977574456', 'AV. MOVILES 666'),
(24, 'MIGUEL PANDA TORRES', '999434777', 'AV. PARQUE INDUSTRIAL 555'),
(25, 'LUISA RAMIREZ BUENDIA', '988774545', 'AV. VILLA MARIA 777');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_destinatario_factura` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `id_vendedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_venta`, `id_cliente`, `id_destinatario_factura`, `total`, `fecha`, `id_vendedor`) VALUES
(1, 1, 1, 2556, '2012-10-15 21:12:38', 7),
(2, 2, 3, 6000, '2012-10-15 21:13:06', 6),
(3, 1, 1, 45663, '2012-11-03 16:45:37', 7),
(4, 1, 5, 44442, '2014-12-01 08:31:29', 3),
(5, 22, 3, 13210, '2014-12-02 18:42:54', 6);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `destinatario_factura`
--
ALTER TABLE `destinatario_factura`
  ADD PRIMARY KEY (`id_destinatario_factura`);

--
-- Indices de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD PRIMARY KEY (`id_producto`,`id_factura`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`id_detalle_venta`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id_factura`);

--
-- Indices de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD PRIMARY KEY (`id_perfil`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_tipo` (`id_tipo`);

--
-- Indices de la tabla `supervisor`
--
ALTER TABLE `supervisor`
  ADD PRIMARY KEY (`id_supervisor`);

--
-- Indices de la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indices de la tabla `tipo_producto`
--
ALTER TABLE `tipo_producto`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuarios`),
  ADD KEY `id_perfil_idx` (`id_perfil`);

--
-- Indices de la tabla `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`id_vendedor`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT de la tabla `destinatario_factura`
--
ALTER TABLE `destinatario_factura`
  MODIFY `id_destinatario_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id_detalle_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  MODIFY `id_perfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `supervisor`
--
ALTER TABLE `supervisor`
  MODIFY `id_supervisor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipo`
--
ALTER TABLE `tipo`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tipo_producto`
--
ALTER TABLE `tipo_producto`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `vendedor`
--
ALTER TABLE `vendedor`
  MODIFY `id_vendedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_tipo`) REFERENCES `tipo` (`id_tipo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `id_perfil` FOREIGN KEY (`id_perfil`) REFERENCES `perfiles` (`id_perfil`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
