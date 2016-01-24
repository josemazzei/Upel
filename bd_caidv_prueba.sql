-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 21-05-2015 a las 00:44:16
-- Versión del servidor: 5.6.12-log
-- Versión de PHP: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `bd_caidv_prueba`
--
CREATE DATABASE IF NOT EXISTS `bd_caidv_prueba` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci;
USE `bd_caidv_prueba`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participante_familiar`
--

CREATE TABLE IF NOT EXISTS `participante_familiar` (
  `tparticipante_idparticipante` int(11) NOT NULL,
  `tfamiliar_idfamiliar` char(9) NOT NULL,
  `idparentesco` int(11) NOT NULL,
  `representante` char(1) NOT NULL DEFAULT '0',
  `estatus` char(1) DEFAULT '1',
  PRIMARY KEY (`tparticipante_idparticipante`,`tfamiliar_idfamiliar`),
  KEY `fk_tparticipante_has_tfamiliar_tfamiliar1_idx` (`tfamiliar_idfamiliar`),
  KEY `fk_tparticipante_has_tfamiliar_tparticipante1_idx` (`tparticipante_idparticipante`),
  KEY `fk_tparticipante_has_tfamiliar_tparentesco1_idx` (`idparentesco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `participante_familiar`
--

INSERT INTO `participante_familiar` (`tparticipante_idparticipante`, `tfamiliar_idfamiliar`, `idparentesco`, `representante`, `estatus`) VALUES
(1, '9837744', 2, '1', '1'),
(2, '11078708', 2, '1', '1'),
(3, '15493031', 2, '1', '1'),
(4, '16964940', 2, '1', '1'),
(5, '19170250', 2, '1', '1'),
(6, '11540170', 1, '0', '1'),
(6, '11847486', 2, '1', '1'),
(7, '11542861', 2, '1', '1'),
(8, '20157379', 2, '1', '1'),
(9, '18732314', 2, '1', '1'),
(10, '99999999', 10, '1', '1'),
(11, '17364390', 2, '1', '1'),
(12, '99999999', 10, '1', '1'),
(13, '99999999', 10, '1', '1'),
(14, '11079158', 2, '1', '1'),
(15, '99999999', 10, '1', '1'),
(16, '21563851', 2, '1', '1'),
(17, '99999999', 10, '1', '1'),
(18, '99999999', 10, '1', '1'),
(19, '99999999', 10, '1', '1'),
(20, '99999999', 10, '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tacceso`
--

CREATE TABLE IF NOT EXISTS `tacceso` (
  `idacceso` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` varchar(20) NOT NULL,
  `exitoacc` char(1) NOT NULL,
  `fechaacc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_salidaacc` datetime DEFAULT NULL,
  `ultima_actividadacc` datetime NOT NULL,
  `ipacc` varchar(15) NOT NULL,
  `estatusacc` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idacceso`),
  KEY `fk_tacceso_tusuario1_idx` (`idusuario`),
  KEY `fk_tacceso_tservicio1_idx` (`exitoacc`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=158 ;

--
-- Volcado de datos para la tabla `tacceso`
--

INSERT INTO `tacceso` (`idacceso`, `idusuario`, `exitoacc`, `fechaacc`, `fecha_salidaacc`, `ultima_actividadacc`, `ipacc`, `estatusacc`) VALUES
(2, 'Administrador', '1', '2015-03-20 04:19:26', '2015-03-23 19:03:51', '2015-03-20 00:10:59', '127.0.0.1', '0'),
(4, 'Administrador', '1', '2015-03-20 14:59:34', '2015-03-23 19:03:51', '2015-03-20 11:29:00', '127.0.0.1', '0'),
(5, 'Administrador', '1', '2015-03-23 22:33:03', '2015-03-23 19:03:51', '2015-03-23 18:29:11', '192.168.1.100', '0'),
(6, '15491963', '1', '2015-03-23 22:44:19', '2015-03-23 18:19:22', '2015-03-23 18:18:54', '192.168.1.80', '0'),
(7, '15491963', '1', '2015-03-23 22:52:12', '2015-03-23 20:10:54', '2015-03-23 18:45:35', '192.168.1.80', '0'),
(8, '17960877', '1', '2015-03-23 23:09:06', '2015-03-23 20:14:02', '2015-03-23 20:12:12', '192.168.1.102', '0'),
(9, 'Administrador', '1', '2015-03-23 23:34:24', '2015-03-23 20:38:17', '2015-03-23 20:37:30', '192.168.1.100', '0'),
(10, '15491963', '0', '2015-03-23 23:53:47', NULL, '0000-00-00 00:00:00', '::1', '0'),
(11, '155491963', '0', '2015-03-23 23:54:12', NULL, '0000-00-00 00:00:00', '::1', '0'),
(12, '15491963', '0', '2015-03-23 23:54:59', NULL, '0000-00-00 00:00:00', '::1', '0'),
(13, '15491963', '0', '2015-03-23 23:55:33', NULL, '0000-00-00 00:00:00', '::1', '0'),
(14, '15491963', '0', '2015-03-23 23:56:06', NULL, '0000-00-00 00:00:00', '::1', '0'),
(15, '15491963', '0', '2015-03-24 00:05:48', NULL, '0000-00-00 00:00:00', '192.168.1.80', '0'),
(16, '15491963', '0', '2015-03-24 00:11:32', NULL, '0000-00-00 00:00:00', '::1', '0'),
(17, '12526145', '1', '2015-03-24 00:16:39', '2015-03-23 19:50:24', '2015-03-23 19:50:17', '192.168.1.103', '0'),
(18, '15491963', '1', '2015-03-24 00:19:20', '2015-03-23 20:10:54', '2015-03-23 19:58:37', '::1', '0'),
(19, '12526145', '1', '2015-03-24 00:21:28', '2015-03-23 20:09:34', '2015-03-23 19:52:19', '192.168.1.103', '0'),
(20, '12526145', '1', '2015-03-24 00:40:14', '2015-03-23 20:10:42', '2015-03-23 20:10:31', '192.168.1.103', '0'),
(21, '15491963', '1', '2015-03-24 00:41:24', '2015-03-23 20:38:31', '2015-03-23 20:24:52', '::1', '0'),
(22, '12526145', '1', '2015-03-24 00:44:21', '2015-03-23 20:17:07', '2015-03-23 20:17:02', '192.168.1.103', '0'),
(23, '17960877', '1', '2015-03-24 00:45:20', '2015-03-23 20:26:43', '2015-03-23 20:15:36', '192.168.1.102', '0'),
(24, '17960877', '1', '2015-03-24 00:57:04', '2015-03-24 18:39:56', '2015-03-23 20:46:20', '192.168.1.102', '0'),
(25, '12526145', '1', '2015-03-24 01:06:19', '2015-03-24 18:35:01', '2015-03-23 20:36:54', '192.168.1.103', '0'),
(26, '15491963', '1', '2015-03-24 22:44:24', '2015-03-24 19:54:11', '2015-03-24 18:47:42', '::1', '0'),
(27, '12526145', '1', '2015-03-24 23:05:28', '2015-03-24 18:44:30', '2015-03-24 18:35:52', '192.168.1.100', '0'),
(28, 'Administrador', '1', '2015-03-24 23:12:25', '2015-03-24 20:08:52', '2015-03-24 20:08:43', '192.168.1.102', '0'),
(29, '12526145', '1', '2015-03-24 23:15:58', '2015-03-24 18:56:34', '2015-03-24 18:55:39', '192.168.1.100', '0'),
(30, '17960877', '1', '2015-03-24 23:25:04', '2015-03-24 19:03:09', '2015-03-24 19:01:16', '192.168.1.101', '0'),
(31, '12526145', '1', '2015-03-24 23:27:22', '2015-03-24 19:15:21', '2015-03-24 19:13:42', '192.168.1.100', '0'),
(32, '17960877', '1', '2015-03-24 23:36:42', '2015-03-24 19:11:06', '2015-03-24 19:10:58', '192.168.1.101', '0'),
(33, '17960877', '1', '2015-03-24 23:42:35', '2015-03-24 19:15:04', '2015-03-24 19:14:41', '192.168.1.101', '0'),
(34, '17960877', '1', '2015-03-24 23:46:40', '2015-03-24 20:08:40', '2015-03-24 20:06:53', '192.168.1.101', '0'),
(35, '12526145', '1', '2015-03-24 23:49:16', '2015-03-24 22:13:51', '2015-03-24 22:08:53', '192.168.1.100', '0'),
(36, '18672728', '1', '2015-03-25 00:09:40', '2015-03-24 19:48:38', '2015-03-24 19:45:23', '192.168.1.103', '0'),
(37, '15491963', '1', '2015-03-25 00:44:03', '2015-05-04 14:55:47', '2015-03-24 21:13:31', '::1', '0'),
(40, '18672728', '1', '2015-03-25 01:42:54', '2015-03-24 22:15:12', '2015-03-24 22:12:29', '192.168.1.104', '0'),
(41, '15491963', '1', '2015-03-25 02:21:33', '2015-05-04 14:55:47', '2015-03-24 21:57:24', '::1', '0'),
(42, '15491963', '1', '2015-03-25 04:32:51', '2015-05-04 14:55:47', '2015-03-25 00:08:55', '::1', '0'),
(44, 'Administrador', '1', '2015-03-26 13:27:18', '2015-03-26 12:21:22', '2015-03-26 12:01:36', '127.0.0.1', '0'),
(45, 'ADMINISTRADOR', '1', '2015-03-27 14:33:15', '2015-03-27 10:58:13', '2015-03-27 10:46:55', '127.0.0.1', '0'),
(46, 'Administrador', '1', '2013-04-23 13:19:20', '2013-04-23 15:26:58', '2013-04-23 13:11:38', '127.0.0.1', '0'),
(47, 'Administrador', '1', '2013-04-23 18:27:29', '2013-04-23 15:40:11', '2013-04-23 15:32:28', '127.0.0.1', '0'),
(48, 'Administrador', '1', '2015-05-22 18:44:35', '2015-05-22 16:04:11', '2015-05-22 16:04:08', '127.0.0.1', '0'),
(49, 'Administrador', '1', '2015-05-22 21:25:19', NULL, '2015-05-22 18:44:13', '127.0.0.1', '0'),
(50, 'Administrador', '1', '2015-05-22 22:07:10', '2015-05-22 19:10:24', '2015-05-22 19:09:11', '127.0.0.1', '0'),
(54, '15491963', '0', '2015-04-23 04:33:42', NULL, '0000-00-00 00:00:00', '::1', '0'),
(55, '15491963', '1', '2015-04-23 04:34:19', '2015-05-04 14:55:47', '2015-04-23 00:05:50', '::1', '0'),
(56, '15491963', '1', '2015-04-23 04:54:26', '2015-05-04 14:55:47', '2015-04-23 00:26:13', '::1', '0'),
(57, '15491963', '1', '2015-04-23 13:58:21', '2015-04-23 09:43:46', '2015-04-23 09:32:54', '::1', '0'),
(58, '15491963', '1', '2015-04-23 19:32:45', '2015-05-04 14:55:47', '2015-04-23 15:09:07', '::1', '0'),
(59, '15491963', '1', '2015-04-24 19:48:13', '2015-05-04 14:55:47', '2015-04-24 15:30:28', '::1', '0'),
(60, '15491963', '1', '2015-04-24 21:01:44', '2015-05-04 14:55:47', '2015-04-24 16:31:52', '::1', '0'),
(61, '15491963', '1', '2015-04-24 21:15:58', '2015-04-24 18:20:14', '2015-04-24 18:13:20', '::1', '0'),
(62, '15491963', '1', '2015-04-25 01:02:24', '2015-05-04 14:55:47', '2015-04-24 20:53:26', '::1', '0'),
(63, '15491963', '1', '2015-04-25 01:59:28', '2015-05-04 14:55:47', '2015-04-24 21:29:47', '::1', '0'),
(64, '15491963', '1', '2015-04-25 05:06:48', '2015-04-25 02:31:26', '2015-04-25 02:31:23', '::1', '0'),
(65, '15491963', '1', '2015-04-25 19:39:22', '2015-05-04 14:55:47', '2015-04-25 15:09:42', '::1', '0'),
(66, '15491963', '1', '2015-04-25 20:55:08', '2015-05-04 14:55:47', '2015-04-25 17:34:50', '::1', '0'),
(67, '15491963', '1', '2015-04-26 16:16:49', '2015-04-26 12:25:48', '2015-04-26 12:25:08', '::1', '0'),
(68, '15491963', '1', '2015-04-26 16:56:56', '2015-04-26 12:31:15', '2015-04-26 12:31:12', '::1', '0'),
(69, '15491963', '1', '2015-04-26 17:02:34', '2015-04-26 16:29:27', '2015-04-26 16:29:19', '::1', '0'),
(70, '15491963', '1', '2015-04-27 03:23:12', '2015-05-04 14:55:47', '2015-04-27 02:18:34', '::1', '0'),
(71, '15491963', '1', '2015-04-27 06:57:16', '2015-05-04 14:55:47', '2015-04-27 02:27:34', '::1', '0'),
(72, '15491963', '1', '2015-04-27 13:44:36', '2015-05-04 14:55:47', '2015-04-27 10:21:49', '::1', '0'),
(73, '15491963', '1', '2015-04-27 19:16:55', '2015-05-04 14:55:47', '2015-04-27 17:32:36', '::1', '0'),
(74, '15491963', '1', '2015-04-28 00:31:20', '2015-04-27 20:18:00', '2015-04-27 20:17:59', '::1', '0'),
(75, '15491963', '1', '2015-04-28 00:48:45', '2015-05-04 14:55:47', '2015-04-27 20:18:57', '::1', '0'),
(76, '15491963', '0', '2015-04-28 00:51:45', NULL, '0000-00-00 00:00:00', '::1', '0'),
(77, '15491963', '1', '2015-04-28 00:52:22', '2015-05-04 14:55:47', '2015-04-27 22:44:02', '::1', '0'),
(78, '15491963', '1', '2015-04-29 01:40:39', '2015-05-04 14:55:47', '2015-04-28 22:12:02', '::1', '0'),
(79, '15491963', '1', '2015-04-29 04:30:34', '2015-05-04 14:55:47', '2015-04-29 00:57:45', '::1', '0'),
(80, '15491963', '1', '2015-04-29 05:31:03', '2015-05-04 14:55:47', '2015-04-29 01:01:11', '::1', '0'),
(81, '15491963', '1', '2015-04-29 13:45:33', '2015-05-04 14:55:47', '2015-04-29 10:45:43', '::1', '0'),
(82, '15491963', '1', '2015-04-29 15:52:37', '2015-05-04 14:55:47', '2015-04-29 12:06:47', '::1', '0'),
(83, '15491963', '1', '2015-04-29 17:52:32', '2015-05-04 14:55:47', '2015-04-29 16:12:47', '::1', '0'),
(84, '15491963', '1', '2015-04-29 20:58:23', '2015-05-04 14:55:47', '2015-04-29 16:37:00', '::1', '0'),
(85, '15491963', '1', '2015-04-29 21:56:15', '2015-05-04 14:55:47', '2015-04-29 17:44:31', '::1', '0'),
(86, '15491963', '1', '2015-04-30 00:24:57', '2015-04-29 20:47:07', '2015-04-29 20:47:04', '::1', '0'),
(87, '15491963', '1', '2015-05-01 19:03:22', '2015-05-01 14:37:39', '2015-05-01 14:37:21', '::1', '0'),
(88, '15491963', '1', '2015-05-01 19:36:16', '2015-05-01 17:45:35', '2015-05-01 17:45:30', '::1', '0'),
(89, '12526145', '0', '2015-05-01 19:37:57', NULL, '0000-00-00 00:00:00', '192.168.1.100', '0'),
(90, '12526145', '1', '2015-05-01 19:38:33', '2015-05-01 17:52:27', '2015-05-01 17:47:44', '192.168.1.100', '0'),
(91, 'Administrador', '0', '2015-05-01 20:39:51', NULL, '0000-00-00 00:00:00', '192.168.1.102', '0'),
(92, '15491963', '0', '2015-05-01 22:16:05', NULL, '0000-00-00 00:00:00', '::1', '0'),
(93, '15491963', '1', '2015-05-01 22:16:29', '2015-05-01 18:09:58', '2015-05-01 18:02:39', '::1', '0'),
(94, '15491963', '1', '2015-05-01 23:59:56', '2015-05-04 14:55:47', '2015-05-01 19:31:57', '::1', '0'),
(95, '15491963', '1', '2015-05-02 05:58:47', '2015-05-02 02:24:54', '2015-05-02 02:24:50', '::1', '0'),
(96, '15491963', '1', '2015-05-02 07:34:22', '2015-05-02 03:11:01', '2015-05-02 03:10:58', '::1', '0'),
(97, '15491963', '1', '2015-05-02 07:44:17', '2015-05-02 03:15:18', '2015-05-02 03:15:11', '::1', '0'),
(98, '15491963', '1', '2015-05-02 07:45:55', '2015-05-02 03:19:44', '2015-05-02 03:19:41', '::1', '0'),
(99, '15491963', '1', '2015-05-02 11:39:38', '2015-05-02 07:11:48', '2015-05-02 07:10:46', '::1', '0'),
(100, '15491963', '1', '2015-05-02 13:03:27', '2015-05-02 08:54:14', '2015-05-02 08:51:25', '::1', '0'),
(101, '15491963', '1', '2015-05-02 13:24:39', '2015-05-04 14:55:47', '2015-05-02 08:54:46', '::1', '0'),
(102, '15491963', '1', '2015-05-02 13:29:56', '2015-05-02 09:10:32', '2015-05-02 09:10:22', '::1', '0'),
(103, '15491963', '1', '2015-05-02 14:01:52', '2015-05-02 10:07:55', '2015-05-02 10:07:17', '::1', '0'),
(104, '15491963', '1', '2015-05-02 14:40:46', '2015-05-02 10:54:26', '2015-05-02 10:51:06', '::1', '0'),
(105, '15491963', '1', '2015-05-02 16:56:41', '2015-05-02 12:57:15', '2015-05-02 12:56:13', '::1', '0'),
(106, '15491963', '1', '2015-05-03 21:55:23', '2015-05-04 14:55:47', '2015-05-03 18:36:35', '::1', '0'),
(107, '15491963', '1', '2015-05-03 23:31:42', '2015-05-04 14:55:47', '2015-05-03 19:04:02', '::1', '0'),
(108, '15491963', '1', '2015-05-04 04:04:54', '2015-05-04 14:55:47', '2015-05-04 01:10:35', '::1', '0'),
(109, '15491963', '1', '2015-05-04 05:49:11', '2015-05-04 01:20:47', '2015-05-04 01:20:37', '::1', '0'),
(110, '15491963', '1', '2015-05-04 13:43:07', '2015-05-04 14:55:47', '2015-05-04 10:53:54', '::1', '0'),
(111, '15491963', '1', '2015-05-04 19:26:02', '2015-05-04 16:51:32', '2015-05-04 16:50:46', '::1', '0'),
(112, '15491963', '1', '2015-05-04 22:24:29', '2015-05-04 18:17:45', '2015-05-04 18:17:25', '::1', '0'),
(113, '15491963', '1', '2015-05-05 00:25:31', '2015-05-04 21:25:48', '2015-05-04 21:25:42', '::1', '0'),
(114, '15491963', '1', '2015-05-05 02:52:38', '2015-05-04 22:48:02', '2015-05-04 22:45:43', '::1', '0'),
(115, '15491963', '1', '2015-05-05 03:19:57', '2015-05-04 23:33:47', '2015-05-04 23:33:37', '::1', '0'),
(116, '15491963', '1', '2015-05-05 14:26:55', NULL, '2015-05-05 10:27:56', '::1', '0'),
(117, '15491963', '1', '2015-05-05 19:10:37', NULL, '2015-05-05 16:00:04', '::1', '0'),
(118, '15491963', '1', '2015-05-06 02:04:29', '2015-05-06 01:19:40', '2015-05-06 01:19:34', '::1', '0'),
(119, '15491963', '1', '2015-05-06 13:32:49', NULL, '2015-05-06 11:56:09', '::1', '0'),
(120, '15491963', '1', '2015-05-06 19:25:07', '2015-05-06 15:54:24', '2015-05-06 15:54:12', '::1', '0'),
(121, '15491963', '0', '2015-05-07 01:01:20', NULL, '0000-00-00 00:00:00', '::1', '0'),
(122, '15491963', '1', '2015-05-07 01:01:34', NULL, '2015-05-06 20:31:35', '::1', '0'),
(123, '15491963', '1', '2015-05-07 01:01:35', NULL, '2015-05-06 20:45:50', '::1', '0'),
(124, '15491963', '1', '2015-05-07 01:17:32', '2015-05-06 21:56:57', '2015-05-06 21:56:13', '::1', '0'),
(125, '155491963', '0', '2015-05-07 13:50:29', NULL, '0000-00-00 00:00:00', '::1', '0'),
(126, '15491963', '1', '2015-05-07 13:50:57', NULL, '2015-05-07 11:54:41', '::1', '0'),
(127, '15491963', '1', '2015-05-07 18:49:08', NULL, '2015-05-07 17:42:37', '::1', '0'),
(128, 'Administrador', '1', '2015-05-08 00:40:06', '2015-05-07 20:10:58', '2015-05-07 20:10:13', '127.0.0.1', '0'),
(129, 'Administrador', '0', '2015-05-08 00:41:48', NULL, '0000-00-00 00:00:00', '127.0.0.1', '0'),
(130, 'Administrador', '1', '2015-05-08 00:41:54', '2015-05-08 02:46:50', '2015-05-08 02:41:27', '127.0.0.1', '0'),
(131, '15491963', '1', '2015-05-08 14:26:02', '2015-05-09 09:15:46', '2015-05-08 10:59:19', '::1', '0'),
(132, '145491963', '0', '2015-05-08 16:09:34', NULL, '0000-00-00 00:00:00', '::1', '0'),
(133, '15491963', '1', '2015-05-08 16:09:49', '2015-05-09 09:15:46', '2015-05-08 11:57:56', '::1', '0'),
(134, '15491963', '1', '2015-05-08 18:48:57', '2015-05-08 15:33:22', '2015-05-08 15:33:09', '::1', '0'),
(135, '15491963', '1', '2015-05-09 00:13:42', '2015-05-08 21:37:22', '2015-05-08 21:36:19', '::1', '0'),
(136, '15491963', '1', '2015-05-09 02:21:29', '2015-05-09 09:15:46', '2015-05-08 22:31:43', '::1', '0'),
(137, '15491963', '1', '2015-05-09 12:02:07', '2015-05-09 08:10:42', '2015-05-09 08:10:40', '::1', '0'),
(138, '15491963', '0', '2015-05-09 12:41:57', NULL, '0000-00-00 00:00:00', '::1', '0'),
(139, '15491963', '0', '2015-05-09 12:42:08', NULL, '0000-00-00 00:00:00', '::1', '0'),
(140, '15491963', '1', '2015-05-09 12:42:21', '2015-05-09 09:15:46', '2015-05-09 08:12:52', '::1', '0'),
(141, 'Admministrador', '0', '2015-05-09 13:46:19', NULL, '0000-00-00 00:00:00', '::1', '0'),
(142, 'Administrador', '0', '2015-05-09 13:46:42', NULL, '0000-00-00 00:00:00', '::1', '0'),
(143, 'Administrador', '0', '2015-05-09 13:47:08', NULL, '0000-00-00 00:00:00', '::1', '0'),
(144, 'Administrador', '0', '2015-05-09 13:47:33', NULL, '0000-00-00 00:00:00', '::1', '0'),
(145, 'Administrador', '1', '2015-05-09 13:50:06', '2015-05-09 09:33:31', '2015-05-09 09:23:46', '::1', '0'),
(146, '15491963', '1', '2015-05-09 14:03:47', '2015-05-09 10:43:35', '2015-05-09 10:40:25', '::1', '0'),
(147, '15491963', '1', '2015-05-14 02:23:31', NULL, '2015-05-13 22:54:17', '::1', '1'),
(148, '15491963', '1', '2015-05-14 03:27:50', NULL, '2015-05-13 22:57:59', '::1', '1'),
(149, '15491963', '1', '2015-05-14 03:30:10', '2015-05-13 23:26:57', '2015-05-13 23:25:43', '::1', '0'),
(150, '15491963', '1', '2015-05-14 04:03:26', '2015-05-14 00:19:51', '2015-05-14 00:14:17', '::1', '0'),
(151, '15491963', '0', '2015-05-14 05:05:20', NULL, '0000-00-00 00:00:00', '::1', '0'),
(152, '15491963', '1', '2015-05-14 05:05:47', NULL, '2015-05-14 00:56:52', '::1', '1'),
(153, '15491963', '0', '2015-05-16 14:21:14', NULL, '0000-00-00 00:00:00', '::1', '0'),
(154, '15491963', '0', '2015-05-16 14:21:36', NULL, '0000-00-00 00:00:00', '::1', '0'),
(155, '15491963', '1', '2015-05-16 14:22:01', NULL, '2015-05-16 10:36:44', '::1', '1'),
(156, '15491963', '1', '2015-05-16 20:26:07', NULL, '2015-05-16 16:07:57', '::1', '1'),
(157, '15491963', '1', '2015-05-21 00:39:07', '2015-05-20 20:12:54', '2015-05-20 20:12:52', '::1', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarea_conocimiento`
--

CREATE TABLE IF NOT EXISTS `tarea_conocimiento` (
  `idarea_conocimiento` int(11) NOT NULL AUTO_INCREMENT,
  `nombreare` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `estatusare` char(1) COLLATE utf8_spanish2_ci DEFAULT '1',
  PRIMARY KEY (`idarea_conocimiento`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `tarea_conocimiento`
--

INSERT INTO `tarea_conocimiento` (`idarea_conocimiento`, `nombreare`, `estatusare`) VALUES
(1, 'ATENCION INTEGRAL TEMPRANA', '1'),
(2, 'BRAILLE LECTURA Y ESCRITURA', '1'),
(3, 'ORIENTACION Y MOVILIDAD', '1'),
(4, 'ACTIVIDADES DE LA VIDA DIARIA', '1'),
(5, 'DEPORTE Y RECREACION', '1'),
(6, 'ESTIMULACION VISUAL', '1'),
(7, 'TECNICAS DE INFORMACION  Y COMUNICACION', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tasignatura`
--

CREATE TABLE IF NOT EXISTS `tasignatura` (
  `idasignatura` int(11) NOT NULL AUTO_INCREMENT,
  `nombreasi` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `horasteoricas` int(11) DEFAULT NULL,
  `horaspracticas` int(11) DEFAULT NULL,
  `tarea_idarea_conocimiento` int(11) NOT NULL,
  `estatusasi` char(1) COLLATE utf8_spanish2_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`idasignatura`),
  KEY `tarea_idarea_conocimiento` (`tarea_idarea_conocimiento`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `tasignatura`
--

INSERT INTO `tasignatura` (`idasignatura`, `nombreasi`, `horasteoricas`, `horaspracticas`, `tarea_idarea_conocimiento`, `estatusasi`) VALUES
(1, 'INFORMATICA', 4, 4, 7, '1'),
(2, 'AVD', 2, 3, 4, '1'),
(3, 'BRAILLE', 2, 4, 2, '1'),
(4, 'ATENCION TEMPRANA', 1, 4, 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tasistencia`
--

CREATE TABLE IF NOT EXISTS `tasistencia` (
  `idasistencia` int(11) NOT NULL AUTO_INCREMENT,
  `idcurso_idparticipante` int(11) NOT NULL,
  `fechaasi` date NOT NULL,
  `asistenciaasi` char(1) COLLATE utf8_spanish2_ci NOT NULL,
  `observacionasi` text COLLATE utf8_spanish2_ci,
  PRIMARY KEY (`idasistencia`),
  KEY `fk_tasistencia_tcurso_tparticipante_1` (`idcurso_idparticipante`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `tasistencia`
--

INSERT INTO `tasistencia` (`idasistencia`, `idcurso_idparticipante`, `fechaasi`, `asistenciaasi`, `observacionasi`) VALUES
(1, 1, '2015-05-09', '1', ''),
(2, 2, '2015-05-09', '1', ''),
(3, 3, '2015-05-09', '1', ''),
(4, 4, '2015-05-09', '1', ''),
(5, 5, '2015-05-09', '1', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tasistencia_objetivo`
--

CREATE TABLE IF NOT EXISTS `tasistencia_objetivo` (
  `tasistencia_idasistencia` int(11) NOT NULL,
  `tobjetivo_idobjetivo` int(11) NOT NULL,
  KEY `tasistencia_idasistencia` (`tasistencia_idasistencia`),
  KEY `tobjetivo_idobjetivo` (`tobjetivo_idobjetivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tasistencia_objetivo`
--

INSERT INTO `tasistencia_objetivo` (`tasistencia_idasistencia`, `tobjetivo_idobjetivo`) VALUES
(1, 9),
(2, 9),
(3, 9),
(4, 9),
(5, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tasistencia_unidad`
--

CREATE TABLE IF NOT EXISTS `tasistencia_unidad` (
  `tasistencia_idasistencia` int(11) NOT NULL,
  `tunidad_idunidad` int(11) NOT NULL,
  KEY `tasistencia_idasistencia` (`tasistencia_idasistencia`),
  KEY `tunidad_idunidad` (`tunidad_idunidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tasistencia_unidad`
--

INSERT INTO `tasistencia_unidad` (`tasistencia_idasistencia`, `tunidad_idunidad`) VALUES
(1, 5),
(2, 5),
(3, 5),
(4, 5),
(5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `taula`
--

CREATE TABLE IF NOT EXISTS `taula` (
  `idaula` int(11) NOT NULL AUTO_INCREMENT,
  `nombreaul` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `tipoaul` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `capacidadaul` int(3) NOT NULL,
  `estatusaul` char(1) COLLATE utf8_spanish2_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`idaula`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `taula`
--

INSERT INTO `taula` (`idaula`, `nombreaul`, `tipoaul`, `capacidadaul`, `estatusaul`) VALUES
(1, 'AULA 1', 'AULA', 18, '1'),
(2, 'AULA 2', 'AULA', 20, '1'),
(3, 'AULA 3', 'AULA', 20, '1'),
(4, 'AULA 4', 'AULA', 18, '1'),
(5, 'AULA 5', 'AULA', 18, '1'),
(6, 'AULA 6', 'AULA', 17, '1'),
(7, 'AULA 7', 'AULA', 16, '1'),
(8, 'CBIT', 'LABORATORIO', 20, '1'),
(9, 'CANCHA MULTIPLE', 'CANCHA', 30, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbitacora`
--

CREATE TABLE IF NOT EXISTS `tbitacora` (
  `idbitacora` int(11) NOT NULL AUTO_INCREMENT,
  `direccionbit` varchar(300) NOT NULL,
  `fechahorabit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `valoranteriorbit` varchar(100) DEFAULT NULL,
  `valornuevobit` varchar(100) DEFAULT NULL,
  `ipbit` varchar(30) NOT NULL,
  `motivobit` varchar(20) NOT NULL,
  `operacionbit` varchar(20) NOT NULL,
  `campobit` varchar(45) NOT NULL,
  `tablabit` varchar(45) NOT NULL,
  `idusuario` varchar(20) NOT NULL,
  `serviciobit` varchar(50) NOT NULL DEFAULT 'Inicio',
  PRIMARY KEY (`idbitacora`),
  KEY `fk_tbitacora_tmotivo1_idx` (`motivobit`),
  KEY `fk_tbitacora_toperacion1_idx` (`operacionbit`),
  KEY `fk_tbitacora_tcampo1_idx` (`campobit`),
  KEY `fk_tbitacora_tusuario1_idx` (`idusuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7387 ;

--
-- Volcado de datos para la tabla `tbitacora`
--

INSERT INTO `tbitacora` (`idbitacora`, `direccionbit`, `fechahorabit`, `valoranteriorbit`, `valornuevobit`, `ipbit`, `motivobit`, `operacionbit`, `campobit`, `tablabit`, `idusuario`, `serviciobit`) VALUES
(2001, 'http://localhost/CAIDV/vista/intranet.php?vista=sistema/configurar', '2015-04-26 11:34:00', '<blockquote>\r\n<h4>AsÃ­ comenzÃ³ la educaciÃ³n de las personas con discapacidad visual del Estado Por', '<ul>\r\n<li>\r\n<p>AsÃ­ comenzÃ³ la educaciÃ³n de las personas con discapacidad visual del Estado Portug', '::1', 'Error en los datos', 'Modificar', 'historia', 'tsistema', '15491963', 'editar_configuracion'),
(2002, '/CAIDV/vista/intranet.php?vista=sistema/configurar', '2015-04-26 11:34:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'sistema/configurar'),
(2003, 'http://localhost/CAIDV/vista/intranet.php?vista=sistema/configurar', '2015-04-26 11:34:00', '<ul>\r\n<li>\r\n<p>AsÃ­ comenzÃ³ la educaciÃ³n de las personas con discapacidad visual del Estado Portug', '<p>AsÃ­ comenzÃ³ la educaciÃ³n de las personas con discapacidad visual del Estado Portuguesa, con un', '::1', 'Error en los datos', 'Modificar', 'historia', 'tsistema', '15491963', 'editar_configuracion'),
(2004, '/CAIDV/vista/intranet.php?vista=sistema/configurar', '2015-04-26 11:34:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'sistema/configurar'),
(2005, 'http://localhost/CAIDV/vista/intranet.php?vista=sistema/configurar', '2015-04-26 11:34:00', '<p>AsÃ­ comenzÃ³ la educaciÃ³n de las personas con discapacidad visual del Estado Portuguesa, con un', '<p>AsÃ­ comenzÃ³ la educaciÃ³n de las personas con discapacidad visual del Estado Portuguesa, con un', '::1', 'Error en los datos', 'Modificar', 'historia', 'tsistema', '15491963', 'editar_configuracion'),
(2006, '/CAIDV/vista/intranet.php?vista=sistema/configurar', '2015-04-26 11:34:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'sistema/configurar'),
(2007, 'http://localhost/CAIDV/vista/intranet.php?vista=sistema/configurar', '2015-04-26 11:34:00', '<p>AsÃ­ comenzÃ³ la educaciÃ³n de las personas con discapacidad visual del Estado Portuguesa, con un', '<div style="text-align: justify;">AsÃ­ comenzÃ³ la educaciÃ³n de las personas con discapacidad visua', '::1', 'Error en los datos', 'Modificar', 'historia', 'tsistema', '15491963', 'editar_configuracion'),
(2008, '/CAIDV/vista/intranet.php?vista=sistema/configurar', '2015-04-26 11:34:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'sistema/configurar'),
(2009, 'http://localhost/CAIDV/vista/intranet.php?vista=sistema/configurar', '2015-04-26 11:34:00', '<div style="text-align: justify;">AsÃ­ comenzÃ³ la educaciÃ³n de las personas con discapacidad visua', '<div style="text-align: justify;">AsÃ­ comenzÃ³ la educaciÃ³n de las personas con discapacidad visua', '::1', 'Error en los datos', 'Modificar', 'historia', 'tsistema', '15491963', 'editar_configuracion'),
(2010, '/CAIDV/vista/intranet.php?vista=sistema/configurar', '2015-04-26 11:34:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'sistema/configurar'),
(2011, '/CAIDV/vista/intranet.php?vista=sistema/noticia', '2015-04-26 11:34:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'sistema/noticia'),
(2012, '/CAIDV/vista/intranet.php?vista=sistema/configurar', '2015-04-26 11:34:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'sistema/configurar'),
(2013, 'http://localhost/CAIDV/vista/intranet.php?vista=sistema/configurar', '2015-04-26 11:34:00', '<div style="text-align: justify;">AsÃ­ comenzÃ³ la educaciÃ³n de las personas con discapacidad visua', '<p>AsÃ­ comenzÃ³ la educaciÃ³n de las personas con discapacidad visual del Estado Portuguesa, con un', '::1', 'Error en los datos', 'Modificar', 'historia', 'tsistema', '15491963', 'editar_configuracion'),
(2014, '/CAIDV/vista/intranet.php?vista=sistema/configurar', '2015-04-26 11:34:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'sistema/configurar'),
(2015, 'http://localhost/CAIDV/vista/intranet.php?vista=sistema/configurar', '2015-04-26 11:34:00', '<p>AsÃ­ comenzÃ³ la educaciÃ³n de las personas con discapacidad visual del Estado Portuguesa, con un', '<p style="text-align: justify;">AsÃ­ comenzÃ³ la educaciÃ³n de las personas con discapacidad visual ', '::1', 'Error en los datos', 'Modificar', 'historia', 'tsistema', '15491963', 'editar_configuracion'),
(2016, '/CAIDV/vista/intranet.php?vista=sistema/configurar', '2015-04-26 11:34:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'sistema/configurar'),
(2017, 'http://localhost/CAIDV/vista/intranet.php?vista=sistema/configurar', '2015-04-26 11:34:00', '<p style="text-align: justify;">AsÃ­ comenzÃ³ la educaciÃ³n de las personas con discapacidad visual ', '<p style="text-align: justify;">AsÃ­ comenzÃ³ la educaciÃ³n de las personas con discapacidad visual ', '::1', 'Error en los datos', 'Modificar', 'historia', 'tsistema', '15491963', 'editar_configuracion'),
(2018, '/CAIDV/vista/intranet.php?vista=sistema/configurar', '2015-04-26 11:34:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'sistema/configurar'),
(2019, '/CAIDV/vista/intranet.php?vista=sistema/configurar', '2015-04-26 11:34:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'sistema/configurar'),
(2020, 'http://localhost/CAIDV/vista/intranet.php?vista=sistema/configurar', '2015-04-26 11:34:00', '<p style="text-align: justify;">AsÃ­ comenzÃ³ la educaciÃ³n de las personas con discapacidad visual ', '<p style="text-align: justify;">AsÃ­ comenzÃ³ la educaciÃ³n de las personas con discapacidad visual ', '::1', 'Error en los datos', 'Modificar', 'historia', 'tsistema', '15491963', 'editar_configuracion'),
(2021, '/CAIDV/vista/intranet.php?vista=sistema/configurar', '2015-04-26 11:34:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'sistema/configurar'),
(2022, 'http://localhost/CAIDV/vista/intranet.php?vista=sistema/configurar', '2015-04-26 11:34:00', '<p style="text-align: justify;">AsÃ­ comenzÃ³ la educaciÃ³n de las personas con discapacidad visual ', '<p style="text-align: justify;">AsÃ­ comenzÃ³ la educaciÃ³n de las personas con discapacidad visual ', '::1', 'Error en los datos', 'Modificar', 'historia', 'tsistema', '15491963', 'editar_configuracion'),
(2023, '/CAIDV/vista/intranet.php?vista=sistema/configurar', '2015-04-26 11:34:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'sistema/configurar'),
(2024, 'http://localhost/CAIDV/vista/intranet.php?vista=sistema/configurar', '2015-04-26 11:34:00', '<p style="text-align: justify;">AsÃ­ comenzÃ³ la educaciÃ³n de las personas con discapacidad visual ', '<p style="text-align: justify;">AsÃ­ comenzÃ³ la educaciÃ³n de las personas con discapacidad visual ', '::1', 'Error en los datos', 'Modificar', 'historia', 'tsistema', '15491963', 'editar_configuracion'),
(2025, '/CAIDV/vista/intranet.php?vista=sistema/configurar', '2015-04-26 11:34:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'sistema/configurar'),
(2026, 'http://localhost/CAIDV/vista/intranet.php?vista=sistema/configurar', '2015-04-26 11:34:00', '<p style="text-align: justify;">AsÃ­ comenzÃ³ la educaciÃ³n de las personas con discapacidad visual ', '<p style="text-align: justify;">AsÃ­ comenzÃ³ la educaciÃ³n de las personas con discapacidad visual ', '::1', 'Error en los datos', 'Modificar', 'historia', 'tsistema', '15491963', 'editar_configuracion'),
(2027, '/CAIDV/vista/intranet.php?vista=sistema/configurar', '2015-04-26 11:34:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'sistema/configurar'),
(2028, '/CAIDV/vista/intranet.php?vista=sistema/configurar', '2015-04-26 11:34:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'sistema/configurar'),
(2029, 'http://localhost/CAIDV/vista/intranet.php?vista=sistema/configurar', '2015-04-26 11:34:00', '<p style="text-align: justify;">AsÃ­ comenzÃ³ la educaciÃ³n de las personas con discapacidad visual ', '<p style="text-align: justify;">AsÃ­ comenzÃ³ la educaciÃ³n de las personas con discapacidad visual ', '::1', 'Error en los datos', 'Modificar', 'historia', 'tsistema', '15491963', 'editar_configuracion'),
(2030, '/CAIDV/vista/intranet.php?vista=sistema/configurar', '2015-04-26 11:34:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'sistema/configurar'),
(6081, '/Antonio/vista/intranet.php', '2015-05-07 12:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'Panel_inicio'),
(6082, '/Antonio/vista/intranet.php', '2015-05-07 12:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'Panel_inicio'),
(6083, '/Antonio/vista/intranet.php', '2015-05-07 12:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'Panel_inicio'),
(6084, '/Antonio/vista/intranet.php', '2015-05-07 12:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'Panel_inicio'),
(6085, '/Antonio/vista/intranet.php', '2015-05-07 12:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'Panel_inicio'),
(6086, '/Antonio/vista/intranet.php?vista=sistema/configurar', '2015-05-07 12:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'sistema/configurar'),
(6087, '/Antonio/vista/intranet.php?vista=archivo/instrumento', '2015-05-07 12:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'archivo/instrumento'),
(6088, '/Antonio/vista/intranet.php?vista=archivo/consultar_instrumento&id=4', '2015-05-07 12:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'archivo/consultar_instrumento'),
(6089, '/Antonio/vista/intranet.php?vista=archivo/instrumento', '2015-05-07 12:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'archivo/instrumento'),
(6090, '/Antonio/vista/intranet.php?vista=archivo/consultar_instrumento&id=5', '2015-05-07 12:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'archivo/consultar_instrumento'),
(6091, '/Antonio/vista/intranet.php?vista=archivo/instrumento', '2015-05-07 12:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'archivo/instrumento'),
(6092, '/Antonio/vista/intranet.php?vista=archivo/consultar_instrumento&id=2', '2015-05-07 12:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'archivo/consultar_instrumento'),
(6093, '/Antonio/vista/intranet.php?vista=archivo/instrumento', '2015-05-07 12:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'archivo/instrumento'),
(6094, '/Antonio/vista/intranet.php?vista=archivo/consultar_instrumento&id=3', '2015-05-07 12:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'archivo/consultar_instrumento'),
(6095, '/Antonio/vista/intranet.php?vista=archivo/instrumento', '2015-05-07 12:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'archivo/instrumento'),
(6096, '/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir', '2015-05-07 12:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/listado_cursos_inscribir'),
(6097, '/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9', '2015-05-07 12:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/inscripcion_masiva'),
(6098, '/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir', '2015-05-07 12:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/listado_cursos_inscribir'),
(6099, '/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9', '2015-05-07 12:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/inscripcion_masiva'),
(6100, '/Antonio/vista/intranet.php?vista=inscripcion/listado_participantes_inscribir', '2015-05-07 12:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/listado_participantes_inscribir'),
(6101, '/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir', '2015-05-07 12:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/listado_cursos_inscribir'),
(6102, '/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9', '2015-05-07 12:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/inscripcion_masiva'),
(6103, '/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir', '2015-05-07 12:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/listado_cursos_inscribir'),
(6104, '/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar', '2015-05-07 12:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/listado_cursos_desincorporar'),
(6105, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 12:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6106, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 12:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6107, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 12:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6108, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 12:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6109, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 12:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6110, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 12:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6111, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 12:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6112, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 12:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6113, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 12:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6114, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 12:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6115, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 12:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6116, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 12:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6117, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6118, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6119, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6120, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6121, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6122, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6123, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6124, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6125, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6126, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6127, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6128, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6129, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6130, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6131, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6132, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6133, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6134, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6135, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6136, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6137, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6138, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6139, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6140, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6141, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6142, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6143, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6144, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6145, 'http://localhost:8080/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-08 06:35:00', '', '', '127.0.0.1', 'Cargar datos', 'Registrar', '*', 'tcurso_tparticipante', 'administrador', 'desincorporar_curso'),
(6146, '/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/listado_cursos_desincorporar'),
(6147, '/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/listado_cursos_desincorporar'),
(6148, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6149, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6150, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6151, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6152, 'http://localhost:8080/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-08 06:35:00', '', '', '127.0.0.1', 'Cargar datos', 'Registrar', '*', 'tcurso_tparticipante', 'administrador', 'desincorporar_curso'),
(6153, '/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/listado_cursos_desincorporar'),
(6154, '/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/listado_cursos_inscribir'),
(6155, '/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/inscripcion_masiva'),
(6156, '/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/listado_cursos_desincorporar'),
(6157, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6158, 'http://localhost:8080/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-08 06:35:00', '', '', '127.0.0.1', 'Cargar datos', 'Registrar', '*', 'tcurso_tparticipante', 'administrador', 'desincorporar_curso'),
(6159, '/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/listado_cursos_desincorporar'),
(6160, '/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/listado_cursos_inscribir'),
(6161, '/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9', '2015-05-07 13:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/inscripcion_masiva'),
(6162, '/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/inscripcion_masiva'),
(6163, '/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/inscripcion_masiva'),
(6164, '/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/inscripcion_masiva'),
(6165, '/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/inscripcion_masiva'),
(6166, '/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/inscripcion_masiva'),
(6167, 'http://localhost:8080/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9', '2015-05-08 06:35:00', '', '', '127.0.0.1', 'Cargar datos', 'Registrar', '*', 'tcurso_tparticipante', 'administrador', 'inscribir_curso'),
(6168, '/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/listado_cursos_inscribir'),
(6169, '/Antonio/vista/intranet.php?vista=inscripcion/listado_participantes_inscribir', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/listado_participantes_inscribir'),
(6170, '/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/inscripcion_individual'),
(6171, '/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/inscripcion_individual'),
(6172, '/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/inscripcion_individual'),
(6173, '/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/inscripcion_individual'),
(6174, '/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/inscripcion_individual'),
(6175, '/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/inscripcion_individual'),
(6176, '/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/inscripcion_individual'),
(6177, '/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/inscripcion_individual'),
(6178, '/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/inscripcion_individual'),
(6179, '/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/inscripcion_individual'),
(6180, '/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/inscripcion_individual'),
(6181, '/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/inscripcion_individual'),
(6182, '/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/inscripcion_individual'),
(6183, '/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/inscripcion_individual'),
(6184, '/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/inscripcion_individual'),
(6185, '/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/inscripcion_individual'),
(6186, '/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/inscripcion_individual'),
(6187, '/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/inscripcion_individual'),
(6188, '/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/inscripcion_individual'),
(6189, '/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/inscripcion_individual'),
(6190, '/Antonio/vista/intranet.php?vista=inscripcion/listado_participantes_inscribir', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/listado_participantes_inscribir'),
(6191, '/Antonio/vista/intranet.php?vista=inscripcion/listado_participantes_inscribir', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/listado_participantes_inscribir'),
(6192, '/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/inscripcion_individual'),
(6193, '/Antonio/vista/intranet.php?vista=inscripcion/listado_participantes_inscribir', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/listado_participantes_inscribir'),
(6194, '/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/listado_cursos_desincorporar'),
(6195, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6196, '/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/listado_cursos_desincorporar'),
(6197, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6198, 'http://localhost:8080/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-08 06:35:00', '', '', '127.0.0.1', 'Cargar datos', 'Registrar', '*', 'tcurso_tparticipante', 'administrador', 'desincorporar_curso'),
(6199, '/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/listado_cursos_desincorporar'),
(6200, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6201, 'http://localhost:8080/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-08 06:35:00', '', '', '127.0.0.1', 'Cargar datos', 'Registrar', '*', 'tcurso_tparticipante', 'administrador', 'desincorporar_curso'),
(6202, '/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/listado_cursos_desincorporar'),
(6203, '/Antonio/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/listado_participantes_desincorporar'),
(6204, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=2', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participante'),
(6205, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=2', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participante'),
(6206, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=2', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participante'),
(6207, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=2', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participante'),
(6208, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=2', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participante'),
(6209, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=2', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participante'),
(6210, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=2', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participante'),
(6211, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=2', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participante'),
(6212, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=2', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participante'),
(6213, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=2', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participante'),
(6214, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=2', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participante'),
(6215, '/Antonio/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/listado_participantes_desincorporar'),
(6216, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=2', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participante'),
(6217, '/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/listado_cursos_desincorporar'),
(6218, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6219, '/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/listado_cursos_desincorporar'),
(6220, '/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/listado_cursos_inscribir'),
(6221, '/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/inscripcion_masiva'),
(6222, '/Antonio/vista/intranet.php?vista=inscripcion/listado_participantes_inscribir', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/listado_participantes_inscribir'),
(6223, '/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=3&edad=6', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/inscripcion_individual'),
(6224, '/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=3&edad=6', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/inscripcion_individual'),
(6225, '/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=3&edad=6', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/inscripcion_individual'),
(6226, '/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=3&edad=6', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/inscripcion_individual'),
(6227, '/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=3&edad=6', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/inscripcion_individual'),
(6228, '/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=3&edad=6', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/inscripcion_individual'),
(6229, '/Antonio/vista/intranet.php?vista=inscripcion/listado_participantes_inscribir', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/listado_participantes_inscribir'),
(6230, '/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/listado_cursos_desincorporar'),
(6231, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participantes'),
(6232, 'http://localhost:8080/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-08 07:35:00', '', '', '127.0.0.1', 'Cargar datos', 'Registrar', '*', 'tcurso_tparticipante', 'administrador', 'desincorporar_curso'),
(6233, '/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/listado_cursos_desincorporar'),
(6234, '/Antonio/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/listado_participantes_desincorporar'),
(6235, '/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=2', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/desincorporar_participante'),
(6236, '/Antonio/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/listado_participantes_desincorporar'),
(6237, '/Antonio/vista/intranet.php?vista=reporte/participante_familiar', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/participante_familiar'),
(6238, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/participante_familiar', '2015-05-07 14:35:00', 'b047bf21-e157-42f2-ba1a-7dca03e262bb', '11078708', '127.0.0.1', '-', 'Reporte', 'id', '-', 'administrador', 'familiar_participante'),
(6239, '/Antonio/vista/intranet.php?vista=reporte/planilla_inscripcion', '2015-05-07 14:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/planilla_inscripcion'),
(6240, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/planilla_inscripcion', '2015-05-07 14:35:00', 'beffb3cc-70dc-49b7-bdb7-642f2b3788cd', '1', '127.0.0.1', '-', 'Reporte', 'idparticipante', '-', 'administrador', 'plantilla_inscripcion'),
(6241, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/planilla_inscripcion', '2015-05-07 14:35:00', '6b3d4f28-bef8-49a4-875d-8fd3cee44ee7', '2', '127.0.0.1', '-', 'Reporte', 'idparticipante', '-', 'administrador', 'plantilla_inscripcion'),
(6242, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/planilla_inscripcion', '2015-05-07 14:35:00', '25e3cce3-1f3a-4c9f-92c3-58f25ad7a6e8', '1', '127.0.0.1', '-', 'Reporte', 'idparticipante', '-', 'administrador', 'plantilla_inscripcion'),
(6243, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/planilla_inscripcion', '2015-05-07 14:35:00', 'a6e6fcf6-fbdf-4a15-9076-caadec71e76d', '2', '127.0.0.1', '-', 'Reporte', 'idparticipante', '-', 'administrador', 'plantilla_inscripcion'),
(6244, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/planilla_inscripcion', '2015-05-07 14:35:00', 'c720e5cf-0b6b-42ff-897e-28d86cdc4af9', '2', '127.0.0.1', '-', 'Reporte', 'idparticipante', '-', 'administrador', 'plantilla_inscripcion'),
(6245, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/planilla_inscripcion', '2015-05-07 14:35:00', 'e18fe876-1372-433b-bf0a-f47d276fc5be', '2', '127.0.0.1', '-', 'Reporte', 'idparticipante', '-', 'administrador', 'plantilla_inscripcion'),
(6246, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/planilla_inscripcion', '2015-05-07 14:35:00', 'a2d4fd58-5f29-4851-893d-046318220c6e', '2', '127.0.0.1', '-', 'Reporte', 'idparticipante', '-', 'administrador', 'plantilla_inscripcion'),
(6247, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/planilla_inscripcion', '2015-05-07 14:35:00', '73dd9cf3-c486-499c-87b6-d9e269955c14', '2', '127.0.0.1', '-', 'Reporte', 'idparticipante', '-', 'administrador', 'plantilla_inscripcion'),
(6248, '/Antonio/vista/intranet.php?vista=reporte/planilla_inscripcion', '2015-05-07 15:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/planilla_inscripcion'),
(6249, '/Antonio/vista/intranet.php?vista=seguridad/asignar_servicio', '2015-05-07 15:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'seguridad/asignar_servicio'),
(6250, '/Antonio/vista/intranet.php?vista=seguridad/asignar_servicio&id=1', '2015-05-07 15:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'seguridad/asignar_servicio'),
(6251, '/Antonio/vista/intranet.php?vista=seguridad/servicio', '2015-05-07 15:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'seguridad/servicio'),
(6252, '/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio', '2015-05-07 15:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'seguridad/registrar_servicio'),
(6253, 'http://localhost:8080/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio', '2015-05-08 08:35:00', '', '', '127.0.0.1', 'Cargar datos', 'Registrar', '*', 'tservicio', 'administrador', 'registrar_servicio'),
(6254, '/Antonio/vista/intranet.php?vista=seguridad/servicio', '2015-05-07 15:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'seguridad/servicio'),
(6255, '/Antonio/vista/intranet.php?vista=seguridad/asignar_servicio', '2015-05-07 15:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'seguridad/asignar_servicio'),
(6256, '/Antonio/vista/intranet.php?vista=seguridad/asignar_servicio&id=1', '2015-05-07 15:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'seguridad/asignar_servicio'),
(6257, '/Antonio/vista/intranet.php?vista=seguridad/asignar_servicio', '2015-05-07 15:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'seguridad/asignar_servicio'),
(6258, '/Antonio/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-07 15:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/listado_participantes_evaluaciones'),
(6259, '/Antonio/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-07 15:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/listado_participantes_evaluaciones'),
(6260, '/Antonio/vista/intranet.php?vista=consultar_evaluaciones&idparticipante=1', '2015-05-07 15:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'consultar_evaluaciones'),
(6261, '/Antonio/vista/intranet.php', '2015-05-07 15:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'Panel_inicio'),
(6262, '/Antonio/vista/intranet.php', '2015-05-07 15:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'Panel_inicio'),
(6263, '/Antonio/vista/intranet.php?vista=seguridad/servicio', '2015-05-07 15:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'seguridad/servicio'),
(6264, '/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio', '2015-05-07 15:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'seguridad/registrar_servicio'),
(6265, 'http://localhost:8080/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio', '2015-05-08 08:35:00', '', '', '127.0.0.1', 'Cargar datos', 'Registrar', '*', 'tservicio', 'administrador', 'registrar_servicio'),
(6266, '/Antonio/vista/intranet.php?vista=seguridad/servicio', '2015-05-07 15:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'seguridad/servicio'),
(6267, '/Antonio/vista/intranet.php?vista=seguridad/asignar_servicio', '2015-05-07 15:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'seguridad/asignar_servicio'),
(6268, '/Antonio/vista/intranet.php?vista=seguridad/asignar_servicio&id=1', '2015-05-07 15:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'seguridad/asignar_servicio'),
(6269, '/Antonio/vista/intranet.php?vista=seguridad/asignar_servicio', '2015-05-07 15:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'seguridad/asignar_servicio'),
(6270, '/Antonio/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-07 15:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/listado_participantes_evaluaciones'),
(6271, '/Antonio/vista/intranet.php?vista=consultar_evaluaciones&idparticipante=1', '2015-05-07 15:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'consultar_evaluaciones'),
(6272, '/Antonio/vista/intranet.php', '2015-05-07 15:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'Panel_inicio'),
(6273, '/Antonio/vista/intranet.php', '2015-05-07 15:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'Panel_inicio'),
(6274, '/Antonio/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-07 15:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/listado_participantes_evaluaciones'),
(6275, '/Antonio/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-07 15:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/listado_participantes_evaluaciones'),
(6276, '/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=1', '2015-05-07 15:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_evaluaciones'),
(6277, '/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=1', '2015-05-07 15:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_evaluaciones');
INSERT INTO `tbitacora` (`idbitacora`, `direccionbit`, `fechahorabit`, `valoranteriorbit`, `valornuevobit`, `ipbit`, `motivobit`, `operacionbit`, `campobit`, `tablabit`, `idusuario`, `serviciobit`) VALUES
(6278, '/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=1', '2015-05-07 15:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_evaluaciones'),
(6279, '/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir', '2015-05-07 15:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/listado_cursos_inscribir'),
(6280, '/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9', '2015-05-07 15:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/inscripcion_masiva'),
(6281, 'http://localhost:8080/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9', '2015-05-08 08:35:00', '', '', '127.0.0.1', 'Cargar datos', 'Registrar', '*', 'tcurso_tparticipante', 'administrador', 'inscribir_curso'),
(6282, '/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir', '2015-05-07 15:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'inscripcion/listado_cursos_inscribir'),
(6283, '/Antonio/vista/intranet.php?vista=curso/evaluacion', '2015-05-07 15:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'curso/evaluacion'),
(6284, '/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-07 15:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'curso/registrar_evaluacion'),
(6285, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 08:35:00', '', '', '127.0.0.1', 'Cargar datos', 'Registrar', '*', 'tevaluacion', 'administrador', 'registrar_evaluacion'),
(6286, '/Antonio/vista/intranet.php?vista=curso/evaluacion', '2015-05-07 15:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'curso/evaluacion'),
(6287, '/Antonio/vista/intranet.php?vista=curso/consultar_evaluacion&id=9', '2015-05-07 15:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'curso/consultar_evaluacion'),
(6288, '/Antonio/vista/intranet.php?vista=curso/evaluacion', '2015-05-07 15:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'curso/evaluacion'),
(6289, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/evaluacion', '2015-05-07 15:35:00', '12331622-239f-4d01-a46b-a05e15ea2769', '9', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6290, '/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2', '2015-05-07 15:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_evaluaciones'),
(6291, '/Antonio/vista/intranet.php?vista=seguridad/servicio', '2015-05-07 15:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'seguridad/servicio'),
(6292, '/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio', '2015-05-07 15:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'seguridad/registrar_servicio'),
(6293, '/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2', '2015-05-08 16:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_evaluaciones'),
(6294, '/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2', '2015-05-08 16:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_evaluaciones'),
(6295, '/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2', '2015-05-08 16:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_evaluaciones'),
(6296, '/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2', '2015-05-08 16:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_evaluaciones'),
(6297, '/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2', '2015-05-08 16:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_evaluaciones'),
(6298, '/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2', '2015-05-08 16:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_evaluaciones'),
(6299, '/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2', '2015-05-08 16:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_evaluaciones'),
(6300, '/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2', '2015-05-08 16:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_evaluaciones'),
(6301, '/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 16:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_evaluaciones'),
(6302, '/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 16:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_evaluaciones'),
(6303, '/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 16:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_evaluaciones'),
(6304, '/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 16:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_evaluaciones'),
(6305, '/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 16:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_evaluaciones'),
(6306, '/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 16:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_evaluaciones'),
(6307, '/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 16:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_evaluaciones'),
(6308, '/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 16:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_evaluaciones'),
(6309, '/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 16:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_evaluaciones'),
(6310, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 16:35:00', '786d0660-fccb-4db3-99d4-ebeef1e90615', '9', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6311, '/Antonio/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 16:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'curso/evaluacion'),
(6312, '/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 16:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'curso/registrar_evaluacion'),
(6313, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 08:35:00', '', '', '127.0.0.1', 'Cargar datos', 'Registrar', '*', 'tevaluacion', 'administrador', 'registrar_evaluacion'),
(6314, '/Antonio/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 16:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'curso/evaluacion'),
(6315, '/Antonio/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-08 16:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/listado_participantes_evaluaciones'),
(6316, '/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=1', '2015-05-08 16:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_evaluaciones'),
(6317, '/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=1', '2015-05-08 16:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_evaluaciones'),
(6318, '/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=1', '2015-05-08 16:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_evaluaciones'),
(6319, '/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=1', '2015-05-08 16:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_evaluaciones'),
(6320, '/Antonio/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-08 16:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/listado_participantes_evaluaciones'),
(6321, '/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=1', '2015-05-08 16:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_evaluaciones'),
(6322, '/Antonio/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-08 16:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/listado_participantes_evaluaciones'),
(6323, '/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2', '2015-05-08 16:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_evaluaciones'),
(6324, '/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2', '2015-05-08 16:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_evaluaciones'),
(6325, '/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2', '2015-05-08 16:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_evaluaciones'),
(6326, '/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 16:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_evaluaciones'),
(6327, '/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 16:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_evaluaciones'),
(6328, '/Antonio/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-08 16:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/listado_participantes_evaluaciones'),
(6329, '/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2', '2015-05-08 16:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_evaluaciones'),
(6330, '/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2', '2015-05-08 16:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_evaluaciones'),
(6331, '/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2', '2015-05-08 16:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_evaluaciones'),
(6332, '/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 16:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_evaluaciones'),
(6333, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 16:35:00', '4f1ed0d0-503f-408b-a96f-306cf6fab42f', '9', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6334, 'http://localhost:8080/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio', '2015-05-08 09:35:00', '', '', '127.0.0.1', 'Cargar datos', 'Registrar', '*', 'tservicio', 'administrador', 'registrar_servicio'),
(6335, '/Antonio/vista/intranet.php?vista=seguridad/servicio', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'seguridad/servicio'),
(6336, '/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'seguridad/registrar_servicio'),
(6337, 'http://localhost:8080/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio', '2015-05-08 09:35:00', '', '', '127.0.0.1', 'Cargar datos', 'Registrar', '*', 'tservicio', 'administrador', 'registrar_servicio'),
(6338, '/Antonio/vista/intranet.php?vista=seguridad/servicio', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'seguridad/servicio'),
(6339, '/Antonio/vista/intranet.php?vista=seguridad/asignar_servicio', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'seguridad/asignar_servicio'),
(6340, '/Antonio/vista/intranet.php?vista=seguridad/asignar_servicio&id=1', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'seguridad/asignar_servicio'),
(6341, '/Antonio/vista/intranet.php?vista=seguridad/asignar_servicio', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'seguridad/asignar_servicio'),
(6342, '/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_evaluaciones'),
(6343, '/Antonio/vista/intranet.php?vista=reporte/listado_participantes_asistencias', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/listado_participantes_asistencias'),
(6344, '/Antonio/vista/intranet.php?vista=seguridad/asignar_servicio', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'seguridad/asignar_servicio'),
(6345, '/Antonio/vista/intranet.php?vista=seguridad/servicio', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'seguridad/servicio'),
(6346, '/Antonio/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=150', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Consultar', '-', '-', 'administrador', 'seguridad/consultar_servicio'),
(6347, 'http://localhost:8080/Antonio/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=150', '2015-05-08 09:35:00', 'reporte/listado_participantes_asistencias', 'reporte/listado_participantes_asistencia', '127.0.0.1', 'Error en los datos', 'Modificar', 'enlaceser', 'tservicio', 'administrador', 'editar_servicio'),
(6348, '/Antonio/vista/intranet.php?vista=seguridad/servicio', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'seguridad/servicio'),
(6349, '/Antonio/vista/intranet.php?vista=reporte/listado_participantes_asistencias', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/listado_participantes_asistencias'),
(6350, '/Antonio/vista/intranet.php', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'Panel_inicio'),
(6351, '/Antonio/vista/intranet.php', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'Panel_inicio'),
(6352, '/Antonio/vista/intranet.php?vista=reporte/listado_participantes_asistencia', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/listado_participantes_asistencia'),
(6353, '/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_evaluaciones'),
(6354, '/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_evaluaciones'),
(6355, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', 'e8050b5d-8576-4842-addb-a36cb93965ed', '9', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6356, '/Antonio/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/listado_participantes_evaluaciones'),
(6357, '/Antonio/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/listado_participantes_evaluaciones'),
(6358, '/Antonio/vista/intranet.php?vista=reporte/listado_participantes_asistencia', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/listado_participantes_asistencia'),
(6359, '/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_asistencias'),
(6360, '/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_asistencias'),
(6361, '/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_asistencias'),
(6362, '/Antonio/vista/intranet.php?vista=curso/asistencia', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'curso/asistencia'),
(6363, '/Antonio/vista/intranet.php?vista=curso/registrar_asistencia&id=9', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'curso/registrar_asistencia'),
(6364, '/Antonio/vista/intranet.php?vista=curso/registrar_asistencia&id=9', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'curso/registrar_asistencia'),
(6365, '/Antonio/vista/intranet.php?vista=reporte/listado_participantes_asistencias', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/listado_participantes_asistencias'),
(6366, '/Antonio/vista/intranet.php', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'Panel_inicio'),
(6367, '/Antonio/vista/intranet.php', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'Panel_inicio'),
(6368, '/Antonio/vista/intranet.php?vista=reporte/listado_participantes_asistencia', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/listado_participantes_asistencia'),
(6369, '/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=1', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_asistencias'),
(6370, '/Antonio/vista/intranet.php?vista=reporte/listado_participantes_asistencia', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/listado_participantes_asistencia'),
(6371, '/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_asistencias'),
(6372, '/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_asistencias'),
(6373, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', '98c7433a-f038-475b-8fe6-d48e7003f528', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6374, '/Antonio/vista/intranet.php?vista=curso/registrar_asistencia&id=9', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'curso/registrar_asistencia'),
(6375, '/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_asistencias'),
(6376, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', '73c1c4b3-dee1-47b5-a984-5ead294e2430', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6377, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_asistencia&id=9', '2015-05-08 05:35:00', 'e2c85e33-a070-4f98-8eaa-d775e09f99f2', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6378, '/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_asistencias'),
(6379, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', 'c3d7f6b6-c4cf-40bb-858d-fce7e671706c', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6380, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', '1e9a541a-7c15-4b69-9c4a-0b22c2d62d8a', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6381, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', '51cdb56a-124f-4586-aa34-daad7e1dd243', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6382, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', 'fd545b15-e9ce-4aac-9a71-0c21438c8d52', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6383, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', '8783069f-9f90-4afc-a8e4-cb9babcba1bc', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6384, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', 'b14dc8e1-cc47-48b3-a25f-7837a7668875', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6385, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', '24e1f0f7-4761-415e-893b-671f2757a763', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6386, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', '54e43bc6-d0ea-4528-acb2-c7c395bf7faf', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6387, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', '0bc38fed-75d5-4757-a1c9-fe2bb01836ec', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6388, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', '1cdec555-b021-4b37-ad7b-8686f4f8295c', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6389, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', '7b1899e6-866a-4f95-881c-7e10fb02a1bd', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6390, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', '3371ca4f-e186-4914-89d4-f9d716fe88bb', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6391, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', '6b21664d-3575-4fd9-8bf6-f3e5a38a4629', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6392, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', 'dbbb5d9c-146c-4cc4-9052-a98546f1b83b', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6393, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', 'b2ad367d-2d84-40f3-8d7a-450ffb521503', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6394, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', '3433246d-71bd-40ff-b93c-37d905e45d9e', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6395, '/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_asistencias'),
(6396, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', 'd50bc21b-f2aa-4b96-885a-846140b506b7', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6397, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', '6e5b6833-8c99-4edf-88a3-204e6d7c4d33', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6398, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', '0695e15b-ac09-4959-90de-d0699bf8741c', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6399, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', 'af89b7dd-6b31-4dc5-9f0a-c00c7b313bcf', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6400, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', 'fc8c6c26-b2f8-4e2d-bcbb-ea025c2e567f', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6401, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', '56056e0d-63b8-4537-9735-4e30ebd71b69', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6402, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', '109df3c4-ef7b-47cc-9d56-f06e30e09419', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6403, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', '0f612eac-03e3-47e1-a328-287b7b7961fa', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6404, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', 'b2650e6b-ce6c-4895-a240-870ad0af4aca', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6405, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', '1338b60f-5cc8-4a0f-b157-57db3f795d09', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6406, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', '7677b7bd-a170-48ce-a655-36c08b62e6aa', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6407, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', 'c2de32b1-074d-44a6-8744-ec49f78ffd58', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6408, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', 'd37001e3-7aba-4333-af50-138bd8cb99d1', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6409, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', '6b8af618-2271-458a-b97a-d9545ec26261', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6410, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', '1ca93159-5922-42fd-b616-1ca1580b7e52', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6411, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', '36370300-4bbc-44a8-882b-1cc77ddcb330', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6412, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', '52ba8fd1-8e57-4bea-8466-aed75798f332', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6413, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', 'e53133f6-0516-4e67-a183-ebae6296a786', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6414, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', 'cf5caf59-441a-4e4e-ad59-773a017d4cd7', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6415, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 05:35:00', '224589ba-3b0f-41b4-82d4-c6404a8fbc81', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6416, '/Antonio/vista/intranet.php?vista=reporte/listado_participantes_asistencia', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/listado_participantes_asistencia'),
(6417, '/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=7', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_asistencias'),
(6418, '/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=7', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_asistencias'),
(6419, '/Antonio/vista/intranet.php?vista=reporte/listado_participantes_asistencia', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/listado_participantes_asistencia'),
(6420, '/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=20', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_asistencias'),
(6421, '/Antonio/vista/intranet.php?vista=reporte/listado_participantes_asistencia', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/listado_participantes_asistencia'),
(6422, '/Antonio/vista/intranet.php?vista=curso/registrar_asistencia&id=9', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'curso/registrar_asistencia'),
(6423, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_asistencia&id=9', '2015-05-08 05:35:00', '47ee5303-9347-4f08-a8ce-9fe03b25e818', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6424, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_asistencia&id=9', '2015-05-08 05:35:00', '9275e3e5-bed2-4a68-b342-ae6a56c18db8', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6425, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_asistencia&id=9', '2015-05-08 05:35:00', 'e35b7860-ad0a-4acc-b35f-d90de4b60622', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6426, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_asistencia&id=9', '2015-05-08 05:35:00', 'e1a5cf55-6ce0-4476-88ac-f710a59d2c47', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6427, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_asistencia&id=9', '2015-05-08 05:35:00', '67e30ac8-3452-4855-aa14-db4f3e31fd09', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6428, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_asistencia&id=9', '2015-05-08 05:35:00', 'e78d3454-fb38-4eb5-bcc2-f4b49c1b4a28', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6429, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_asistencia&id=9', '2015-05-08 05:35:00', '989e3902-195a-4610-838e-32adb3f5e409', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6430, '/Antonio/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'curso/evaluacion'),
(6431, '/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 05:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'curso/registrar_evaluacion'),
(6432, '/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'curso/registrar_evaluacion'),
(6433, '/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'curso/registrar_evaluacion'),
(6434, '/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'curso/registrar_evaluacion'),
(6435, '/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'curso/registrar_evaluacion'),
(6436, '/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'curso/registrar_evaluacion'),
(6437, '/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'curso/registrar_evaluacion'),
(6438, '/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'curso/registrar_evaluacion'),
(6439, '/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'curso/registrar_evaluacion'),
(6440, '/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'curso/registrar_evaluacion'),
(6441, '/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'curso/registrar_evaluacion'),
(6442, '/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'curso/registrar_evaluacion'),
(6443, '/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'curso/registrar_evaluacion'),
(6444, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', 'd6567c3e-2953-402e-aef7-5b8a9c90bc01', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6445, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', 'de914524-f3d9-4bd4-9914-f2f41c3c0014', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6446, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '9eb66ca4-b6f5-44fa-8629-951cd6cf53ae', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6447, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '02fd98c7-7ba9-48a0-842d-50a3abd4854c', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6448, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '763b86cc-01bc-427c-95f2-fedda79006b0', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6449, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', 'd4fe7dbd-8d02-413b-8fbd-234fb1d563e2', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6450, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '50bc2350-eafb-4cd7-b2f7-2ec79556823d', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6451, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '6441ce5c-7a88-4a29-822e-724697a9dcd5', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6452, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '6857f65d-658f-4e0d-9301-f6e23b3c76b3', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6453, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', 'b93d0f09-0506-4d7f-a5a0-01ef5882f432', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6454, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '6ce193dd-1eef-433d-8ecb-5c652ab6106b', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6455, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '5974617c-8660-47d5-8563-c5c771f32a3f', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6456, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', 'ad497e18-ad47-4b5d-8a37-8cf346a9b017', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6457, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '4f426a76-201a-48f7-825c-7bc6afc9eb31', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6458, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '308ccc50-36ee-4e60-a95c-1f19f18d98b8', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6459, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', 'a75c14db-4c80-41ad-92ec-930468b03f09', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6460, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '8dbcc25b-8107-4a96-8e2e-7e3b3522ecdc', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6461, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', 'abd56843-abb6-4039-ac73-8dea8f4cd160', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6462, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '18d3f6b5-7aca-40a8-bf49-34438ef9fe88', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6463, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', 'a6e2f285-d76e-4ef5-9a23-cf4f82c50fc4', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6464, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '7afe9da8-e05a-46bd-8c56-c0f278957dcf', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6465, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '67b93d43-81fc-4666-b30d-5ea777e3ce9f', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6466, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', 'b9fed072-bd33-4e9c-898c-fa1027b83d18', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6467, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', 'e54180ce-b553-42da-8c97-b6dc1c4dc1fa', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6468, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', 'ff06e4ef-66ad-49ec-94de-a1919e119d2f', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6469, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', 'a4fde622-f344-4dd6-bf80-c7baf87b73ee', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6470, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', 'e4a80994-82bf-4ee7-8a15-daa408f0ad3d', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6471, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', 'f396fad7-2dca-4a63-8d12-cc764d1668c6', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6472, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', 'ad69e631-f477-4680-a2e1-fd7dcd9be0ff', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6473, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '38ec7a13-c4fb-499b-a145-1ca4d1d9ec1c', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6474, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', 'bd0d11a4-fbe4-4a10-aa8b-234a119f3123', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6475, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', 'b17f6e39-142c-4bc9-b572-e48c3465b34f', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6476, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '0f380992-b06e-4830-965f-9a1495fc3e74', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6477, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '7f9ffda0-c9d9-4be4-a4d0-80e40268a8e6', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6478, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '578a5af8-32d5-4ec2-8733-2e233b853d6b', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6479, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '615486a2-676f-40af-8939-18fc8edf4e22', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6480, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '58ce5bf9-9571-4a32-bc40-0a8d67d963c8', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6481, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '5f9de5a2-8dff-455c-a2bc-fdddc5854990', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6482, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '47b87ef9-8afe-45c9-8747-b3ae64e0c146', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6483, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '7d6ed686-b5b3-42d0-a0d2-f1024855675e', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6484, '/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'curso/registrar_evaluacion'),
(6485, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '0f5ee473-4a57-4683-af46-6dc0a6798fb7', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6486, '/Antonio/vista/intranet.php?vista=persona/participante', '2015-05-08 06:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'persona/participante'),
(6487, '/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=1', '2015-05-08 06:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'persona/consultar_participante'),
(6488, '/Antonio/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-08 06:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/listado_participantes_evaluaciones'),
(6489, '/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2', '2015-05-08 06:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_evaluaciones'),
(6490, '/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 06:35:00', '', '', '127.0.0.1', '-', 'Navegar', '-', '-', 'administrador', 'reporte/consultar_evaluaciones'),
(6491, 'http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 06:35:00', '42cc4b9d-5158-4d33-b193-416405b07b13', '9', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6492, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', 'b63146e5-ff17-4fd3-88a9-50d9c58e04ee', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6493, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '7e6bcd48-e28a-4f93-b1c1-bd51f5796e6e', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6494, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '203152d7-54cf-4e52-8e88-a6f5f71eea69', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6495, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '0896db0f-8339-408f-ab17-cb47542c2264', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion');
INSERT INTO `tbitacora` (`idbitacora`, `direccionbit`, `fechahorabit`, `valoranteriorbit`, `valornuevobit`, `ipbit`, `motivobit`, `operacionbit`, `campobit`, `tablabit`, `idusuario`, `serviciobit`) VALUES
(6496, 'http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '635157d8-2266-42f4-bd29-59ab012f7725', '', '127.0.0.1', '-', 'Reporte', 'idevaluacion', '-', 'administrador', 'evaluacion'),
(6497, '/CAIDV/vista/intranet.php', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'Panel_inicio'),
(6498, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_evaluaciones'),
(6499, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=1', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(6500, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_evaluaciones'),
(6501, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_cursos_inscribir'),
(6502, '/CAIDV/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/inscripcion_masiva'),
(6503, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_inscribir', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_participantes_inscribir'),
(6504, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_cursos_inscribir'),
(6505, '/CAIDV/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/inscripcion_masiva'),
(6506, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_cursos_desincorporar'),
(6507, '/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/desincorporar_participantes'),
(6508, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_cursos_desincorporar'),
(6509, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_participantes_desincorporar'),
(6510, '/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=2', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/desincorporar_participante'),
(6511, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_participantes_desincorporar'),
(6512, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6513, '/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=10', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/consultar_evaluacion'),
(6514, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6515, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_evaluaciones'),
(6516, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=9', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(6517, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(6518, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 14:35:00', 'dcb5d7f3-92fe-44d5-9fbd-67d142a54a7a', '9', '::1', '-', 'Reporte', 'idevaluacion', '-', '15491963', 'evaluacion'),
(6519, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_asistencia'),
(6520, '/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=1', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_asistencias'),
(6521, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_asistencia'),
(6522, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_asistencia'),
(6523, '/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=9', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_asistencias'),
(6524, '/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_asistencias'),
(6525, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 14:35:00', '5bf3598c-95f8-419e-a067-eef1984d7760', '', '::1', '-', 'Reporte', 'idevaluacion', '-', '15491963', 'evaluacion'),
(6526, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 14:35:00', '5b2464f0-facc-46fe-b76e-372d8e2de51c', '', '::1', '-', 'Reporte', 'idevaluacion', '-', '15491963', 'evaluacion'),
(6527, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_asistencia'),
(6528, '/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_asistencias'),
(6529, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_asistencia'),
(6530, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_evaluaciones'),
(6531, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=1', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(6532, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_evaluaciones'),
(6533, '/CAIDV/vista/intranet.php', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'Panel_inicio'),
(6534, '/CAIDV/vista/intranet.php?vista=archivo/localidad', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/localidad'),
(6535, '/CAIDV/vista/intranet.php?vista=archivo/consultar_localidad&id=1', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/consultar_localidad'),
(6536, '/CAIDV/vista/intranet.php?vista=archivo/localidad', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/localidad'),
(6537, '/CAIDV/vista/intranet.php?vista=seguridad/servicio', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/servicio'),
(6538, '/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=150', '2015-05-08 06:35:00', '', '', '::1', '-', 'Consultar', '-', '-', '15491963', 'seguridad/consultar_servicio'),
(6539, '/CAIDV/vista/intranet.php?vista=seguridad/servicio', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/servicio'),
(6540, '/CAIDV/vista/intranet.php?vista=seguridad/registrar_servicio', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/registrar_servicio'),
(6541, '/CAIDV/vista/intranet.php?vista=seguridad/servicio', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/servicio'),
(6542, '/CAIDV/vista/intranet.php?vista=seguridad/registrar_servicio', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/registrar_servicio'),
(6543, 'http://localhost/CAIDV/vista/intranet.php?vista=seguridad/registrar_servicio', '2015-05-08 06:35:00', '', '', '::1', 'Cargar datos', 'Registrar', '*', 'tservicio', '15491963', 'registrar_servicio'),
(6544, '/CAIDV/vista/intranet.php?vista=seguridad/servicio', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/servicio'),
(6545, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_servicio'),
(6546, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio&id=1', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_servicio'),
(6547, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_servicio'),
(6548, '/CAIDV/vista/intranet.php?vista=listado_asistencia', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'listado_asistencia'),
(6549, 'http://localhost/CAIDV/vista/intranet.php?vista=listado_asistencia', '2015-05-08 14:35:00', '96de1aed-b1fe-4bb7-9c98-f1c1b7b9b4d4', '', '::1', '-', 'Reporte', 'idevaluacion', '-', '15491963', 'evaluacion'),
(6550, '/CAIDV/vista/intranet.php?vista=curso/asistencia', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/asistencia'),
(6551, '/CAIDV/vista/intranet.php?vista=curso/registrar_asistencia&id=9', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/registrar_asistencia'),
(6552, 'http://localhost/CAIDV/vista/intranet.php?vista=curso/registrar_asistencia&id=9', '2015-05-08 14:35:00', '6943b714-09c5-4790-96cb-afaacb76fc4e', '', '::1', '-', 'Reporte', 'idevaluacion', '-', '15491963', 'evaluacion'),
(6553, '/CAIDV/vista/intranet.php?vista=curso/asistencia', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/asistencia'),
(6554, '/CAIDV/vista/intranet.php?vista=listado_asistencia', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'listado_asistencia'),
(6555, '/CAIDV/vista/intranet.php?vista=curso/asistencia', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/asistencia'),
(6556, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_servicio'),
(6557, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio&id=1', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_servicio'),
(6558, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_servicio'),
(6559, '/CAIDV/vista/intranet.php?vista=seguridad/servicio', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/servicio'),
(6560, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_evaluaciones'),
(6561, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_evaluaciones'),
(6562, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_evaluaciones'),
(6563, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=11', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(6564, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(6565, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 14:35:00', 'b9f06c45-dc2c-4ab3-91cf-f1b8c489f4b6', '9', '::1', '-', 'Reporte', 'idevaluacion', '-', '15491963', 'evaluacion'),
(6566, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6567, '/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=10', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/consultar_evaluacion'),
(6568, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6569, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_evaluaciones'),
(6570, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=11', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(6571, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(6572, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 14:35:00', 'f4d8a44b-8b6c-47ac-ad69-16e864c3b7c7', '9', '::1', '-', 'Reporte', 'idevaluacion', '-', '15491963', 'evaluacion'),
(6573, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_evaluaciones'),
(6574, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6575, '/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=10', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/consultar_evaluacion'),
(6576, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6577, '/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=9', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/consultar_evaluacion'),
(6578, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6579, '/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=9', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/consultar_evaluacion'),
(6580, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6581, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6582, '/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=10', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/consultar_evaluacion'),
(6583, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6584, '/CAIDV/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/registrar_evaluacion'),
(6585, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6586, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_evaluaciones'),
(6587, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_evaluaciones'),
(6588, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(6589, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(6590, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 14:35:00', '318805a6-8513-4697-a306-4a53b6176497', '9', '::1', '-', 'Reporte', 'idevaluacion', '-', '15491963', 'evaluacion'),
(6591, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_evaluaciones'),
(6592, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=11', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(6593, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(6594, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_evaluaciones'),
(6595, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_evaluaciones'),
(6596, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(6597, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(6598, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 14:35:00', '7543f404-d9af-4923-830b-9f3454cd5e8d', '9', '::1', '-', 'Reporte', 'idevaluacion', '-', '15491963', 'evaluacion'),
(6599, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_evaluaciones'),
(6600, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6601, '/CAIDV/vista/intranet.php?vista=archivo/localidad', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/localidad'),
(6602, '/CAIDV/vista/intranet.php?vista=persona/historial_participante', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'persona/historial_participante'),
(6603, 'http://localhost/CAIDV/vista/intranet.php?vista=persona/historial_participante', '2015-05-08 14:35:00', 'c42a74d9-e951-4b8b-9450-ef9ded0c198e', '1', '::1', '-', 'Reporte', 'idparticipante', '-', '15491963', 'historial_participante'),
(6604, '/CAIDV/vista/intranet.php?vista=persona/historial_participante_detalle&id=2', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'persona/historial_participante_detalle'),
(6605, '/CAIDV/vista/intranet.php?vista=persona/historial_participante', '2015-05-08 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'persona/historial_participante'),
(6606, 'http://localhost/CAIDV/vista/intranet.php?vista=persona/historial_participante', '2015-05-08 14:35:00', '23c965fe-bcc5-41d8-8391-2a2ce34dd874', '2', '::1', '-', 'Reporte', 'idparticipante', '-', '15491963', 'historial_participante'),
(6607, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_asistencia'),
(6608, '/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_asistencias'),
(6609, '/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_asistencias'),
(6610, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 14:35:00', '2a421bb6-410c-4358-87b9-9c8c5c4eae7f', '', '::1', '-', 'Reporte', 'idevaluacion', '-', '15491963', 'evaluacion'),
(6611, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 14:35:00', 'fac839f3-b37d-417a-a41a-ae596b5e27df', '', '::1', '-', 'Reporte', 'idevaluacion', '-', '15491963', 'evaluacion'),
(6612, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_asistencia'),
(6613, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_evaluaciones'),
(6614, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_asistencia'),
(6615, '/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_asistencias'),
(6616, '/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_asistencias'),
(6617, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_asistencia'),
(6618, '/CAIDV/vista/intranet.php?vista=curso/lapso', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/lapso'),
(6619, '/CAIDV/vista/intranet.php?vista=reporte/listado_docente_diagnostico', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_docente_diagnostico'),
(6620, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/listado_docente_diagnostico', '2015-05-08 14:35:00', '2f1ad0e5-ed6d-4789-9944-77e5470fa4fa', '1', '::1', '-', 'Reporte', 'id_diagnostico', '-', '15491963', 'listado_docentes_diagnostico'),
(6621, '/CAIDV/vista/intranet.php?vista=archivo/localidad', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/localidad'),
(6622, '/CAIDV/vista/intranet.php?vista=archivo/consultar_localidad&id=1', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/consultar_localidad'),
(6623, '/CAIDV/vista/intranet.php?vista=archivo/localidad', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/localidad'),
(6624, '/CAIDV/vista/intranet.php?vista=archivo/localidad', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/localidad'),
(6625, '/CAIDV/vista/intranet.php?vista=archivo/consultar_localidad&id=1', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/consultar_localidad'),
(6626, '/CAIDV/vista/intranet.php?vista=archivo/localidad', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/localidad'),
(6627, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6628, '/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=9', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/consultar_evaluacion'),
(6629, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6630, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6631, '/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=9', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/consultar_evaluacion'),
(6632, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6633, '/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=10', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/consultar_evaluacion'),
(6634, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6635, '/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=10', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/consultar_evaluacion'),
(6636, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6637, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_evaluaciones'),
(6638, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=9', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(6639, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(6640, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_evaluaciones'),
(6641, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=9', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(6642, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(6643, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 14:35:00', 'f402ee4e-f4ca-41a4-a6c5-f469e8c23ef3', '9', '::1', '-', 'Reporte', 'idevaluacion', '-', '15491963', 'evaluacion'),
(6644, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_evaluaciones'),
(6645, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6646, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_evaluaciones'),
(6647, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=9', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(6648, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(6649, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_evaluaciones'),
(6650, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=9', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(6651, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(6652, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_evaluaciones'),
(6653, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_evaluaciones'),
(6654, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=9', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(6655, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(6656, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-08 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_evaluaciones'),
(6657, '/CAIDV/vista/intranet.php', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'Panel_inicio'),
(6658, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6659, '/CAIDV/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/registrar_evaluacion'),
(6660, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6661, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6662, '/CAIDV/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/registrar_evaluacion'),
(6663, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6664, '/CAIDV/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/registrar_evaluacion'),
(6665, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6666, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6667, '/CAIDV/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/registrar_evaluacion'),
(6668, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6669, '/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=9', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/consultar_evaluacion'),
(6670, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6671, '/CAIDV/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/registrar_evaluacion'),
(6672, 'http://localhost/CAIDV/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 15:35:00', 'd8917378-ed03-40fe-a479-b15d34e8c27f', '', '::1', '-', 'Reporte', 'idevaluacion', '-', '15491963', 'evaluacion'),
(6673, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6674, '/CAIDV/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/registrar_evaluacion'),
(6675, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6676, '/CAIDV/vista/intranet.php?vista=curso/asistencia', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/asistencia'),
(6677, '/CAIDV/vista/intranet.php?vista=curso/registrar_asistencia&id=9', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/registrar_asistencia'),
(6678, 'http://localhost/CAIDV/vista/intranet.php?vista=curso/registrar_asistencia&id=9', '2015-05-08 15:35:00', 'af1106d9-8f23-4045-a5dc-53402bea74fa', '', '::1', '-', 'Reporte', 'idevaluacion', '-', '15491963', 'evaluacion'),
(6679, '/CAIDV/vista/intranet.php?vista=curso/registrar_curso', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/registrar_curso'),
(6680, '/CAIDV/vista/intranet.php', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'Panel_inicio'),
(6681, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6682, '/CAIDV/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/registrar_evaluacion'),
(6683, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6684, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6685, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6686, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6687, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6688, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6689, '/CAIDV/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/registrar_evaluacion'),
(6690, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6691, '/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=9', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/consultar_evaluacion'),
(6692, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6693, '/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=10', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/consultar_evaluacion'),
(6694, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6695, '/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=9', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/consultar_evaluacion'),
(6696, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6697, '/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=9', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/consultar_evaluacion'),
(6698, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6699, '/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=10', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/consultar_evaluacion'),
(6700, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6701, '/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=9', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/consultar_evaluacion'),
(6702, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6703, '/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=9', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/consultar_evaluacion'),
(6704, '/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=9', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/consultar_evaluacion'),
(6705, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6706, '/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=9', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/consultar_evaluacion'),
(6707, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6708, '/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=9', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/consultar_evaluacion'),
(6709, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6710, '/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=9', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/consultar_evaluacion'),
(6711, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6712, '/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=9', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/consultar_evaluacion'),
(6713, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6714, '/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=9', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/consultar_evaluacion'),
(6715, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6716, '/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=9', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/consultar_evaluacion'),
(6717, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-08 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(6718, '/CAIDV/vista/intranet.php', '2015-05-08 10:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'Panel_inicio'),
(6719, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir', '2015-05-08 10:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_cursos_inscribir'),
(6720, '/CAIDV/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9', '2015-05-08 10:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/inscripcion_masiva'),
(6721, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir', '2015-05-08 10:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_cursos_inscribir'),
(6722, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar', '2015-05-08 10:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_cursos_desincorporar'),
(6723, '/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-08 10:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/desincorporar_participantes'),
(6724, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar', '2015-05-08 10:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_cursos_desincorporar'),
(6725, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar', '2015-05-08 10:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_participantes_desincorporar'),
(6726, '/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=2', '2015-05-08 10:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/desincorporar_participante'),
(6727, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar', '2015-05-08 10:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_participantes_desincorporar'),
(6728, '/CAIDV/vista/intranet.php?vista=reporte/historial_lapso', '2015-05-08 10:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/historial_lapso'),
(6729, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_lapso', '2015-05-08 06:35:00', '82cf9c32-e2c2-456e-91c7-27dbe72486bc', '2', '::1', '-', 'Reporte', 'idlapso', '-', '15491963', 'historial_lapso'),
(6730, '/CAIDV/vista/intranet.php?vista=reporte/historial_curso', '2015-05-08 10:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/historial_curso'),
(6731, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_curso', '2015-05-08 06:35:00', 'e9c318cd-29af-468b-bd9f-5d7b8e8b46bb', '9', '::1', '-', 'Reporte', 'idcurso', '-', '15491963', 'historial_curso'),
(6732, '/CAIDV/vista/intranet.php?vista=reporte/historial_participante', '2015-05-08 10:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/historial_participante'),
(6733, '/CAIDV/vista/intranet.php?vista=reporte/planilla_inscripcion', '2015-05-08 10:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/planilla_inscripcion'),
(6734, '/CAIDV/vista/intranet.php?vista=reporte/participante_familiar', '2015-05-08 10:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/participante_familiar'),
(6735, '/CAIDV/vista/intranet.php?vista=reporte/historial_lapso', '2015-05-08 10:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/historial_lapso'),
(6736, '/CAIDV/vista/intranet.php?vista=reporte/historial_participante', '2015-05-08 10:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/historial_participante'),
(6737, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_participante', '2015-05-08 06:35:00', 'd01515be-8754-4fe3-9137-da0b4c94422f', '2', '::1', '-', 'Reporte', 'idparticipante', '-', '15491963', 'historial_participante'),
(6738, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_participante', '2015-05-08 06:35:00', '56c4b10a-b91f-44bf-8971-459a8066d51e', '11', '::1', '-', 'Reporte', 'idparticipante', '-', '15491963', 'historial_participante'),
(6739, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_participante', '2015-05-08 06:35:00', 'a6dcea4c-d178-4c20-ae07-12eae70085f0', '7', '::1', '-', 'Reporte', 'idparticipante', '-', '15491963', 'historial_participante'),
(6740, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_participante', '2015-05-08 06:35:00', '66cbbc75-3fd8-411a-a183-e3eb58a3f15c', '11', '::1', '-', 'Reporte', 'idparticipante', '-', '15491963', 'historial_participante'),
(6741, '/CAIDV/vista/intranet.php?vista=archivo/localidad', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/localidad'),
(6742, '/CAIDV/vista/intranet.php?vista=curso/lapso', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/lapso'),
(6743, '/CAIDV/vista/intranet.php?vista=reporte/historial_participante', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/historial_participante'),
(6744, '/CAIDV/vista/intranet.php?vista=reporte/historial_participante', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/historial_participante'),
(6745, '/CAIDV/vista/intranet.php?vista=reporte/historial_curso', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/historial_curso'),
(6746, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_curso', '2015-05-08 06:35:00', 'ee5325a1-b57a-4b00-a8df-f36ec83b4647', '9', '::1', '-', 'Reporte', 'idcurso', '-', '15491963', 'historial_curso'),
(6747, '/CAIDV/vista/intranet.php?vista=reporte/historial_lapso', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/historial_lapso'),
(6748, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_lapso', '2015-05-08 06:35:00', '2d9b9be2-e129-451d-ae12-9fe94be9c188', '2', '::1', '-', 'Reporte', 'idlapso', '-', '15491963', 'historial_lapso'),
(6749, '/CAIDV/vista/intranet.php?vista=seguridad/servicio', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/servicio'),
(6750, '/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=108', '2015-05-08 11:35:00', '', '', '::1', '-', 'Consultar', '-', '-', '15491963', 'seguridad/consultar_servicio'),
(6751, 'http://localhost/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=108', '2015-05-08 11:35:00', 'Historial curso por lapso', 'Historial de lapso', '::1', 'Error en los datos', 'Modificar', 'nombreser', 'tservicio', '15491963', 'editar_servicio'),
(6752, '/CAIDV/vista/intranet.php?vista=seguridad/servicio', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/servicio'),
(6753, '/CAIDV/vista/intranet.php?vista=reporte/historial_curso', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/historial_curso'),
(6754, '/CAIDV/vista/intranet.php?vista=seguridad/servicio', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/servicio'),
(6755, '/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=112', '2015-05-08 11:35:00', '', '', '::1', '-', 'Consultar', '-', '-', '15491963', 'seguridad/consultar_servicio'),
(6756, 'http://localhost/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=112', '2015-05-08 11:35:00', 'Historial Curso', 'Historial de curso', '::1', 'Error en los datos', 'Modificar', 'nombreser', 'tservicio', '15491963', 'editar_servicio'),
(6757, '/CAIDV/vista/intranet.php?vista=seguridad/servicio', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/servicio'),
(6758, '/CAIDV/vista/intranet.php?vista=reporte/historial_participante', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/historial_participante'),
(6759, '/CAIDV/vista/intranet.php?vista=seguridad/servicio', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/servicio'),
(6760, '/CAIDV/vista/intranet.php?vista=reporte/historial_participante', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/historial_participante'),
(6761, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_participante', '2015-05-08 06:35:00', '41644841-af0b-49e0-9ee2-4056a960cb39', '1', '::1', '-', 'Reporte', 'idparticipante', '-', '15491963', 'historial_participante');
INSERT INTO `tbitacora` (`idbitacora`, `direccionbit`, `fechahorabit`, `valoranteriorbit`, `valornuevobit`, `ipbit`, `motivobit`, `operacionbit`, `campobit`, `tablabit`, `idusuario`, `serviciobit`) VALUES
(6762, '/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=110', '2015-05-08 11:35:00', '', '', '::1', '-', 'Consultar', '-', '-', '15491963', 'seguridad/consultar_servicio'),
(6763, 'http://localhost/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=110', '2015-05-08 11:35:00', 'Historial de cursos inscrito por participante', 'Historial de cursos inscrito', '::1', 'Error en los datos', 'Modificar', 'nombreser', 'tservicio', '15491963', 'editar_servicio'),
(6764, '/CAIDV/vista/intranet.php?vista=seguridad/servicio', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/servicio'),
(6765, '/CAIDV/vista/intranet.php?vista=reporte/participante_familiar', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/participante_familiar'),
(6766, '/CAIDV/vista/intranet.php?vista=seguridad/servicio', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/servicio'),
(6767, '/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=148', '2015-05-08 11:35:00', '', '', '::1', '-', 'Consultar', '-', '-', '15491963', 'seguridad/consultar_servicio'),
(6768, 'http://localhost/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=148', '2015-05-08 11:35:00', 'Listado Participantes EvaluaciÃ³n', 'Participante por evaluaciÃ³n', '::1', 'Error en los datos', 'Modificar', 'nombreser', 'tservicio', '15491963', 'editar_servicio'),
(6769, '/CAIDV/vista/intranet.php?vista=seguridad/servicio', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/servicio'),
(6770, '/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=150', '2015-05-08 11:35:00', '', '', '::1', '-', 'Consultar', '-', '-', '15491963', 'seguridad/consultar_servicio'),
(6771, 'http://localhost/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=150', '2015-05-08 11:35:00', 'Listado Participantes Asistencias', 'Participantes asistencia', '::1', 'Error en los datos', 'Modificar', 'nombreser', 'tservicio', '15491963', 'editar_servicio'),
(6772, '/CAIDV/vista/intranet.php?vista=seguridad/servicio', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/servicio'),
(6773, '/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=150', '2015-05-08 11:35:00', '', '', '::1', '-', 'Consultar', '-', '-', '15491963', 'seguridad/consultar_servicio'),
(6774, 'http://localhost/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=150', '2015-05-08 11:35:00', 'Participantes asistencia', 'Participantes por asistencia', '::1', 'Error en los datos', 'Modificar', 'nombreser', 'tservicio', '15491963', 'editar_servicio'),
(6775, '/CAIDV/vista/intranet.php?vista=seguridad/servicio', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/servicio'),
(6776, '/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=150', '2015-05-08 11:35:00', '', '', '::1', '-', 'Consultar', '-', '-', '15491963', 'seguridad/consultar_servicio'),
(6777, 'http://localhost/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=150', '2015-05-08 11:35:00', 'Participantes por asistencia', 'Participante por asistencia', '::1', 'Error en los datos', 'Modificar', 'nombreser', 'tservicio', '15491963', 'editar_servicio'),
(6778, '/CAIDV/vista/intranet.php?vista=seguridad/servicio', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/servicio'),
(6779, '/CAIDV/vista/intranet.php?vista=reporte/planilla_inscripcion', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/planilla_inscripcion'),
(6780, '/CAIDV/vista/intranet.php?vista=reporte/participante_familiar', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/participante_familiar'),
(6781, '/CAIDV/vista/intranet.php?vista=reporte/historial_lapso', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/historial_lapso'),
(6782, '/CAIDV/vista/intranet.php?vista=reporte/historial_participante', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/historial_participante'),
(6783, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_etnia', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_etnia'),
(6784, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_huerfanos', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_huerfanos'),
(6785, '/CAIDV/vista/intranet.php?vista=reporte/listado_docente_diagnostico', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_docente_diagnostico'),
(6786, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_evaluaciones'),
(6787, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=1', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(6788, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_evaluaciones'),
(6789, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_asistencia'),
(6790, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_asistencia'),
(6791, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_evaluaciones'),
(6792, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_cursos_inscribir'),
(6793, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_inscribir', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_participantes_inscribir'),
(6794, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_cursos_desincorporar'),
(6795, '/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/desincorporar_participantes'),
(6796, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_cursos_desincorporar'),
(6797, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_participantes_desincorporar'),
(6798, '/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=3', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/desincorporar_participante'),
(6799, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_participantes_desincorporar'),
(6800, '/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=3', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/desincorporar_participante'),
(6801, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_participantes_desincorporar'),
(6802, '/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=2', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/desincorporar_participante'),
(6803, '/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=2', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/desincorporar_participante'),
(6804, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_participantes_desincorporar'),
(6805, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_cursos_inscribir'),
(6806, '/CAIDV/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/inscripcion_masiva'),
(6807, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_cursos_desincorporar'),
(6808, '/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/desincorporar_participantes'),
(6809, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_participantes_desincorporar'),
(6810, '/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=2', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/desincorporar_participante'),
(6811, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_participantes_desincorporar'),
(6812, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_participantes_desincorporar'),
(6813, '/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=2', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/desincorporar_participante'),
(6814, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_cursos_desincorporar'),
(6815, '/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/desincorporar_participantes'),
(6816, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_cursos_desincorporar'),
(6817, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_inscribir', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_participantes_inscribir'),
(6818, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_participantes_desincorporar'),
(6819, '/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=2', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/desincorporar_participante'),
(6820, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_participantes_desincorporar'),
(6821, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_participantes_desincorporar'),
(6822, '/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=3', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/desincorporar_participante'),
(6823, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar', '2015-05-08 11:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_participantes_desincorporar'),
(6824, '/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=8', '2015-05-08 12:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/desincorporar_participante'),
(6825, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar', '2015-05-08 12:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_participantes_desincorporar'),
(6826, '/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=9', '2015-05-08 12:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/desincorporar_participante'),
(6827, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar', '2015-05-08 12:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_participantes_desincorporar'),
(6828, '/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=9', '2015-05-08 12:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/desincorporar_participante'),
(6829, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar', '2015-05-08 12:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_participantes_desincorporar'),
(6830, '/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=9', '2015-05-08 12:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/desincorporar_participante'),
(6831, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar', '2015-05-08 12:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_participantes_desincorporar'),
(6832, '/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=11', '2015-05-08 12:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/desincorporar_participante'),
(6833, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar', '2015-05-08 12:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_participantes_desincorporar'),
(6834, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar', '2015-05-08 12:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_cursos_desincorporar'),
(6835, '/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-08 12:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/desincorporar_participantes'),
(6836, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar', '2015-05-08 12:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_cursos_desincorporar'),
(6837, '/CAIDV/vista/intranet.php', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'Panel_inicio'),
(6838, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_cursos_desincorporar'),
(6839, '/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/desincorporar_participantes'),
(6840, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_cursos_desincorporar'),
(6841, '/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/desincorporar_participantes'),
(6842, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_cursos_desincorporar'),
(6843, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_participantes_desincorporar'),
(6844, '/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=9', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/desincorporar_participante'),
(6845, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_participantes_desincorporar'),
(6846, '/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=9', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/desincorporar_participante'),
(6847, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_participantes_desincorporar'),
(6848, '/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=9', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/desincorporar_participante'),
(6849, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_participantes_desincorporar'),
(6850, '/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=9', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/desincorporar_participante'),
(6851, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_participantes_desincorporar'),
(6852, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_participantes_desincorporar'),
(6853, '/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=9', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/desincorporar_participante'),
(6854, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_participantes_desincorporar'),
(6855, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_cursos_inscribir'),
(6856, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_cursos_inscribir'),
(6857, '/CAIDV/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/inscripcion_masiva'),
(6858, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_cursos_inscribir'),
(6859, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_cursos_inscribir'),
(6860, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_cursos_inscribir'),
(6861, '/CAIDV/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/inscripcion_masiva'),
(6862, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_cursos_inscribir'),
(6863, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_inscribir', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_participantes_inscribir'),
(6864, '/CAIDV/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=2&edad=6', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/inscripcion_individual'),
(6865, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_inscribir', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_participantes_inscribir'),
(6866, '/CAIDV/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=3&edad=6', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/inscripcion_individual'),
(6867, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_inscribir', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_participantes_inscribir'),
(6868, '/CAIDV/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=8&edad=4', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/inscripcion_individual'),
(6869, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_inscribir', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_participantes_inscribir'),
(6870, '/CAIDV/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=8&edad=4', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/inscripcion_individual'),
(6871, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_inscribir', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_participantes_inscribir'),
(6872, '/CAIDV/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/inscripcion_individual'),
(6873, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_inscribir', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_participantes_inscribir'),
(6874, '/CAIDV/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=11&edad=5', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/inscripcion_individual'),
(6875, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_inscribir', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_participantes_inscribir'),
(6876, '/CAIDV/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=11&edad=5', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/inscripcion_individual'),
(6877, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_inscribir', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_participantes_inscribir'),
(6878, '/CAIDV/vista/intranet.php?vista=curso/curso', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/curso'),
(6879, '/CAIDV/vista/intranet.php?vista=curso/curso', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/curso'),
(6880, '/CAIDV/vista/intranet.php?vista=curso/curso', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/curso'),
(6881, '/CAIDV/vista/intranet.php?vista=curso/curso', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/curso'),
(6882, '/CAIDV/vista/intranet.php?vista=curso/curso', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/curso'),
(6883, '/CAIDV/vista/intranet.php?vista=curso/curso', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/curso'),
(6884, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_cursos_inscribir'),
(6885, '/CAIDV/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/inscripcion_masiva'),
(6886, '/CAIDV/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/inscripcion_masiva'),
(6887, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_cursos_inscribir'),
(6888, '/CAIDV/vista/intranet.php?vista=reporte/historial_participante', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/historial_participante'),
(6889, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_participante', '2015-05-08 12:35:00', 'e6687cbb-66b9-431b-a0e0-90e36531e4ba', '1', '::1', '-', 'Reporte', 'idparticipante', '-', '15491963', 'historial_participante'),
(6890, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_participante', '2015-05-08 12:35:00', '2cc8958e-e1f3-4fca-8391-a61c0585a454', '11', '::1', '-', 'Reporte', 'idparticipante', '-', '15491963', 'historial_participante'),
(6891, '/CAIDV/vista/intranet.php?vista=reporte/historial_participante', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/historial_participante'),
(6892, '/CAIDV/vista/intranet.php?vista=sistema/configurar', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'sistema/configurar'),
(6893, '/CAIDV/vista/intranet.php?vista=sistema/configurar', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'sistema/configurar'),
(6894, '/CAIDV/vista/intranet.php?vista=seguridad/bloquear', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/bloquear'),
(6895, '/CAIDV/vista/intranet.php', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'Panel_inicio'),
(6896, '/CAIDV/vista/intranet.php?vista=persona/participante', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'persona/participante'),
(6897, '/CAIDV/vista/intranet.php?vista=persona/consultar_participante&id=1', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'persona/consultar_participante'),
(6898, '/CAIDV/vista/intranet.php?vista=archivo/municipio', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/municipio'),
(6899, '/CAIDV/vista/intranet.php?vista=archivo/consultar_municipio&id=1', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/consultar_municipio'),
(6900, '/CAIDV/vista/intranet.php?vista=archivo/localidad', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/localidad'),
(6901, '/CAIDV/vista/intranet.php?vista=archivo/registrar_localidad', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/registrar_localidad'),
(6902, '/CAIDV/vista/intranet.php?vista=archivo/localidad', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/localidad'),
(6903, '/CAIDV/vista/intranet.php?vista=archivo/institucion', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/institucion'),
(6904, '/CAIDV/vista/intranet.php?vista=archivo/registrar_institucion', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/registrar_institucion'),
(6905, '/CAIDV/vista/intranet.php?vista=archivo/aula', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/aula'),
(6906, '/CAIDV/vista/intranet.php?vista=archivo/registrar_aula', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/registrar_aula'),
(6907, '/CAIDV/vista/intranet.php?vista=archivo/diagnostico', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/diagnostico'),
(6908, '/CAIDV/vista/intranet.php?vista=archivo/registrar_diagnostico', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/registrar_diagnostico'),
(6909, '/CAIDV/vista/intranet.php?vista=archivo/diagnostico', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/diagnostico'),
(6910, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_asistencia'),
(6911, '/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=1', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_asistencias'),
(6912, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_asistencia'),
(6913, '/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=11', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_asistencias'),
(6914, '/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_asistencias'),
(6915, '/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_asistencias'),
(6916, '/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_asistencias'),
(6917, '/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_asistencias'),
(6918, '/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_asistencias'),
(6919, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_asistencia'),
(6920, '/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=11', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_asistencias'),
(6921, '/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_asistencias'),
(6922, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 13:35:00', '598283c8-fc63-4f7e-b38f-4ca7fb455607', '', '::1', '-', 'Reporte', 'idevaluacion', '-', '15491963', 'evaluacion'),
(6923, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-08 13:35:00', '42d884d4-a8bf-4e15-a639-5cc8cedf15eb', '', '::1', '-', 'Reporte', 'idevaluacion', '-', '15491963', 'evaluacion'),
(6924, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_asistencia'),
(6925, '/CAIDV/vista/intranet.php?vista=reporte/historial_lapso', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/historial_lapso'),
(6926, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_lapso', '2015-05-08 13:35:00', '9884d24a-4276-403c-bfe7-435697b93d34', '2', '::1', '-', 'Reporte', 'idlapso', '-', '15491963', 'historial_lapso'),
(6927, '/CAIDV/vista/intranet.php?vista=persona/historial_participante', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'persona/historial_participante'),
(6928, '/CAIDV/vista/intranet.php?vista=persona/historial_participante', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'persona/historial_participante'),
(6929, 'http://localhost/CAIDV/vista/intranet.php?vista=persona/historial_participante', '2015-05-08 13:35:00', 'b21b50b6-5262-4347-8845-e742a6f8fd26', '11', '::1', '-', 'Reporte', 'idparticipante', '-', '15491963', 'historial_participante'),
(6930, '/CAIDV/vista/intranet.php?vista=reporte/historial_participante', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/historial_participante'),
(6931, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_participante', '2015-05-08 13:35:00', '062e062a-01c3-4f0d-9e2c-04a4b95d2e52', '1', '::1', '-', 'Reporte', 'idparticipante', '-', '15491963', 'historial_participante'),
(6932, '/CAIDV/vista/intranet.php?vista=persona/historial_participante', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'persona/historial_participante'),
(6933, '/CAIDV/vista/intranet.php?vista=persona/historial_participante_detalle&id=11', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'persona/historial_participante_detalle'),
(6934, '/CAIDV/vista/intranet.php?vista=persona/historial_participante', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'persona/historial_participante'),
(6935, '/CAIDV/vista/intranet.php?vista=reporte/historial_participante', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/historial_participante'),
(6936, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_participante', '2015-05-08 13:35:00', '4bdda705-f1d8-480f-9ddd-c0df4b7299ae', '11', '::1', '-', 'Reporte', 'idparticipante', '-', '15491963', 'historial_participante'),
(6937, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_participante', '2015-05-08 13:35:00', 'f72f757f-570f-44bd-b647-fed977477357', '11', '::1', '-', 'Reporte', 'idparticipante', '-', '15491963', 'historial_participante'),
(6938, '/CAIDV/vista/intranet.php?vista=persona/historial_participante', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'persona/historial_participante'),
(6939, 'http://localhost/CAIDV/vista/intranet.php?vista=persona/historial_participante', '2015-05-08 13:35:00', 'ee705561-72fc-42ef-8322-73710a7a4eaf', '11', '::1', '-', 'Reporte', 'idparticipante', '-', '15491963', 'historial_participante'),
(6940, '/CAIDV/vista/intranet.php?vista=reporte/historial_participante', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/historial_participante'),
(6941, '/CAIDV/vista/intranet.php?vista=persona/historial_participante', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'persona/historial_participante'),
(6942, '/CAIDV/vista/intranet.php?vista=persona/historial_participante_detalle&id=1', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'persona/historial_participante_detalle'),
(6943, '/CAIDV/vista/intranet.php?vista=persona/historial_participante', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'persona/historial_participante'),
(6944, '/CAIDV/vista/intranet.php?vista=persona/historial_participante_detalle&id=11', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'persona/historial_participante_detalle'),
(6945, '/CAIDV/vista/intranet.php?vista=persona/historial_participante', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'persona/historial_participante'),
(6946, '/CAIDV/vista/intranet.php?vista=seguridad/servicio', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/servicio'),
(6947, '/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=147', '2015-05-09 05:35:00', '', '', '::1', '-', 'Consultar', '-', '-', '15491963', 'seguridad/consultar_servicio'),
(6948, 'http://localhost/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=147', '2015-05-09 05:35:00', 'Cursos inscrito por participante', 'Participante inscrito por cursos', '::1', 'Error en los datos', 'Modificar', 'nombreser', 'tservicio', '15491963', 'editar_servicio'),
(6949, '/CAIDV/vista/intranet.php?vista=seguridad/servicio', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/servicio'),
(6950, '/CAIDV/vista/intranet.php?vista=persona/historial_participante', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'persona/historial_participante'),
(6951, '/CAIDV/vista/intranet.php?vista=persona/historial_participante', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'persona/historial_participante'),
(6952, '/CAIDV/vista/intranet.php?vista=seguridad/servicio', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/servicio'),
(6953, '/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=110', '2015-05-09 05:35:00', '', '', '::1', '-', 'Consultar', '-', '-', '15491963', 'seguridad/consultar_servicio'),
(6954, 'http://localhost/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=110', '2015-05-09 05:35:00', 'Historial de cursos inscrito', 'Historial de cursos inscrito por participante', '::1', 'Error en los datos', 'Modificar', 'nombreser', 'tservicio', '15491963', 'editar_servicio'),
(6955, '/CAIDV/vista/intranet.php?vista=seguridad/servicio', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/servicio'),
(6956, '/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=147', '2015-05-09 05:35:00', '', '', '::1', '-', 'Consultar', '-', '-', '15491963', 'seguridad/consultar_servicio'),
(6957, '/CAIDV/vista/intranet.php?vista=seguridad/servicio', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/servicio'),
(6958, '/CAIDV/vista/intranet.php?vista=reporte/historial_participante', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/historial_participante'),
(6959, '/CAIDV/vista/intranet.php?vista=seguridad/servicio', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/servicio'),
(6960, '/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=107', '2015-05-09 05:35:00', '', '', '::1', '-', 'Consultar', '-', '-', '15491963', 'seguridad/consultar_servicio'),
(6961, '/CAIDV/vista/intranet.php?vista=persona/participante', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'persona/participante'),
(6962, '/CAIDV/vista/intranet.php?vista=persona/consultar_participante&id=1', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'persona/consultar_participante'),
(6963, '/CAIDV/vista/intranet.php?vista=persona/personal', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'persona/personal'),
(6964, '/CAIDV/vista/intranet.php?vista=persona/consultar_participante&id=1', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'persona/consultar_participante'),
(6965, '/CAIDV/vista/intranet.php?vista=persona/participante', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'persona/participante'),
(6966, '/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=107', '2015-05-09 05:35:00', '', '', '::1', '-', 'Consultar', '-', '-', '15491963', 'seguridad/consultar_servicio'),
(6967, '/CAIDV/vista/intranet.php?vista=persona/historial_participante_detalle', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'persona/historial_participante_detalle'),
(6968, '/CAIDV/vista/intranet.php?vista=persona/historial_participante', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'persona/historial_participante'),
(6969, '/CAIDV/vista/intranet.php?vista=persona/historial_participante_detalle&id=1', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'persona/historial_participante_detalle'),
(6970, '/CAIDV/vista/intranet.php?vista=persona/historial_participante', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'persona/historial_participante'),
(6971, '/CAIDV/vista/intranet.php?vista=persona/historial_participante_detalle', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'persona/historial_participante_detalle'),
(6972, '/CAIDV/vista/intranet.php?vista=seguridad/servicio', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/servicio'),
(6973, '/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=107', '2015-05-09 05:35:00', '', '', '::1', '-', 'Consultar', '-', '-', '15491963', 'seguridad/consultar_servicio'),
(6974, 'http://localhost/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=107', '2015-05-09 05:35:00', '4', '3', '::1', 'Error en los datos', 'Modificar', 'idmodulo', 'tservicio', '15491963', 'editar_servicio'),
(6975, '/CAIDV/vista/intranet.php?vista=seguridad/servicio', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/servicio'),
(6976, '/CAIDV/vista/intranet.php?vista=seguridad/servicio', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/servicio'),
(6977, '/CAIDV/vista/intranet.php?vista=seguridad/servicio', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/servicio'),
(6978, '/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=110', '2015-05-09 05:35:00', '', '', '::1', '-', 'Consultar', '-', '-', '15491963', 'seguridad/consultar_servicio'),
(6979, 'http://localhost/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=110', '2015-05-09 05:35:00', 'Historial de cursos inscrito por participante', 'Historial participante inscrito por curso', '::1', 'Error en los datos', 'Modificar', 'nombreser', 'tservicio', '15491963', 'editar_servicio'),
(6980, '/CAIDV/vista/intranet.php?vista=seguridad/servicio', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/servicio'),
(6981, '/CAIDV/vista/intranet.php?vista=reporte/participante_familiar', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/participante_familiar'),
(6982, '/CAIDV/vista/intranet.php?vista=reporte/historial_lapso', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/historial_lapso'),
(6983, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_lapso', '2015-05-08 13:35:00', '752c082b-5004-435f-b64e-7dec24853740', '2', '::1', '-', 'Reporte', 'idlapso', '-', '15491963', 'historial_lapso'),
(6984, '/CAIDV/vista/intranet.php?vista=reporte/historial_curso', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/historial_curso'),
(6985, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_curso', '2015-05-08 13:35:00', 'a291596a-797a-4e88-bb39-2afa7cc0335b', '9', '::1', '-', 'Reporte', 'idcurso', '-', '15491963', 'historial_curso'),
(6986, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_curso', '2015-05-08 13:35:00', 'adfa9852-a818-4207-81bf-8a53b2fd6208', '10', '::1', '-', 'Reporte', 'idcurso', '-', '15491963', 'historial_curso'),
(6987, '/CAIDV/vista/intranet.php?vista=reporte/listado_docente_diagnostico', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_docente_diagnostico'),
(6988, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/listado_docente_diagnostico', '2015-05-08 13:35:00', '126bf954-79ca-486d-985e-cb90047d1647', '1', '::1', '-', 'Reporte', 'id_diagnostico', '-', '15491963', 'listado_docentes_diagnostico'),
(6989, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_evaluaciones'),
(6990, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=11', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(6991, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=11&idlapso=2&idcurso=9', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(6992, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=11&idlapso=2&idcurso=9', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(6993, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=11&idlapso=2&idcurso=9', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(6994, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_evaluaciones'),
(6995, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=11', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(6996, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=11&idlapso=2&idcurso=9', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(6997, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=11&idlapso=2&idcurso=9', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(6998, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_evaluaciones'),
(6999, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=11', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(7000, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=11&idlapso=2&idcurso=9', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(7001, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_evaluaciones'),
(7002, '/CAIDV/vista/intranet.php?vista=reporte/historial_participante', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/historial_participante'),
(7003, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_participante', '2015-05-08 13:35:00', 'dbfcafd3-6f03-4f0e-a71f-b09df6cbe1bc', '11', '::1', '-', 'Reporte', 'idparticipante', '-', '15491963', 'historial_participante'),
(7004, '/CAIDV/vista/intranet.php?vista=curso/cursos_inactivos', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/cursos_inactivos'),
(7005, '/CAIDV/vista/intranet.php?vista=curso/detalle_curso_inactivo&id=10', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/detalle_curso_inactivo'),
(7006, '/CAIDV/vista/intranet.php?vista=curso/cursos_inactivos', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/cursos_inactivos'),
(7007, '/CAIDV/vista/intranet.php?vista=curso/detalle_curso_inactivo&id=10', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/detalle_curso_inactivo'),
(7008, '/CAIDV/vista/intranet.php?vista=curso/detalle_curso_inactivo&id=10', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/detalle_curso_inactivo'),
(7009, '/CAIDV/vista/intranet.php?vista=curso/detalle_curso_inactivo&id=10', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/detalle_curso_inactivo'),
(7010, '/CAIDV/vista/intranet.php?vista=curso/detalle_curso_inactivo&id=10', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/detalle_curso_inactivo'),
(7011, '/CAIDV/vista/intranet.php?vista=curso/detalle_curso_inactivo&id=10', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/detalle_curso_inactivo'),
(7012, '/CAIDV/vista/intranet.php?vista=curso/detalle_curso_inactivo&id=10', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/detalle_curso_inactivo'),
(7013, '/CAIDV/vista/intranet.php?vista=curso/cursos_inactivos', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/cursos_inactivos');
INSERT INTO `tbitacora` (`idbitacora`, `direccionbit`, `fechahorabit`, `valoranteriorbit`, `valornuevobit`, `ipbit`, `motivobit`, `operacionbit`, `campobit`, `tablabit`, `idusuario`, `serviciobit`) VALUES
(7014, '/CAIDV/vista/intranet.php?vista=curso/curso', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/curso'),
(7015, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_asistencia'),
(7016, '/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=11', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_asistencias'),
(7017, '/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_asistencias'),
(7018, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_asistencia'),
(7019, '/CAIDV/vista/intranet.php', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'Panel_inicio'),
(7020, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(7021, '/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=9', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/consultar_evaluacion'),
(7022, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(7023, '/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=10', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/consultar_evaluacion'),
(7024, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(7025, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(7026, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_evaluaciones'),
(7027, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_asistencia'),
(7028, '/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_asistencias'),
(7029, '/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_asistencias'),
(7030, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_evaluaciones'),
(7031, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(7032, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(7033, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_evaluaciones'),
(7034, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=16', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(7035, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_evaluaciones'),
(7036, '/CAIDV/vista/intranet.php?vista=curso/asistencia', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/asistencia'),
(7037, '/CAIDV/vista/intranet.php?vista=curso/registrar_asistencia&id=9', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/registrar_asistencia'),
(7038, '/CAIDV/vista/intranet.php?vista=curso/asistencia', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/asistencia'),
(7039, '/CAIDV/vista/intranet.php?vista=curso/asistencia', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/asistencia'),
(7040, '/CAIDV/vista/intranet.php?vista=curso/registrar_asistencia&id=9', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/registrar_asistencia'),
(7041, '/CAIDV/vista/intranet.php?vista=reporte/historial_curso', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/historial_curso'),
(7042, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_curso', '2015-05-08 14:35:00', '7de0d7ef-b0a4-4020-b98b-5a610a5b94c5', '9', '::1', '-', 'Reporte', 'idcurso', '-', '15491963', 'historial_curso'),
(7043, '/CAIDV/vista/intranet.php?vista=reporte/historial_curso', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/historial_curso'),
(7044, '/CAIDV/vista/intranet.php?vista=reporte/historial_curso', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/historial_curso'),
(7045, '/CAIDV/vista/intranet.php?vista=reporte/historial_lapso', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/historial_lapso'),
(7046, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_lapso', '2015-05-08 14:35:00', 'cc3f71ce-10f2-4323-bc9e-cb2f2eb8df2b', '2', '::1', '-', 'Reporte', 'idlapso', '-', '15491963', 'historial_lapso'),
(7047, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_lapso', '2015-05-08 14:35:00', '5566631a-4cb2-43c1-90a4-a1250145eab5', '3', '::1', '-', 'Reporte', 'idlapso', '-', '15491963', 'historial_lapso'),
(7048, '/CAIDV/vista/intranet.php?vista=seguridad/modulo', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/modulo'),
(7049, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_modulo', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_modulo'),
(7050, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_modulo&id=1', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_modulo'),
(7051, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio&id=1', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_servicio'),
(7052, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_modulo', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_modulo'),
(7053, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_modulo&id=1', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_modulo'),
(7054, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio&id=1', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_servicio'),
(7055, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_servicio'),
(7056, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_modulo', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_modulo'),
(7057, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_servicio'),
(7058, '/CAIDV/vista/intranet.php?vista=seguridad/servicio', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/servicio'),
(7059, '/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=52', '2015-05-09 06:35:00', '', '', '::1', '-', 'Consultar', '-', '-', '15491963', 'seguridad/consultar_servicio'),
(7060, 'http://localhost/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=52', '2015-05-09 06:35:00', '5', '1', '::1', 'Error en los datos', 'Modificar', 'idmodulo', 'tservicio', '15491963', 'editar_servicio'),
(7061, '/CAIDV/vista/intranet.php?vista=seguridad/servicio', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/servicio'),
(7062, '/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=53', '2015-05-09 06:35:00', '', '', '::1', '-', 'Consultar', '-', '-', '15491963', 'seguridad/consultar_servicio'),
(7063, 'http://localhost/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=53', '2015-05-09 06:35:00', '5', '1', '::1', 'Error en los datos', 'Modificar', 'idmodulo', 'tservicio', '15491963', 'editar_servicio'),
(7064, '/CAIDV/vista/intranet.php?vista=seguridad/servicio', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/servicio'),
(7065, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_servicio'),
(7066, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio&id=1', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_servicio'),
(7067, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_servicio'),
(7068, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_modulo', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_modulo'),
(7069, '/CAIDV/vista/intranet.php', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'Panel_inicio'),
(7070, '/CAIDV/vista/intranet.php?vista=ayuda/acerca', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'ayuda/acerca'),
(7071, '/CAIDV/vista/intranet.php?vista=ayuda/acerca', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'ayuda/acerca'),
(7072, '/CAIDV/vista/intranet.php?vista=ayuda/acerca', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'ayuda/acerca'),
(7073, '/CAIDV/vista/intranet.php?vista=ayuda/acerca', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'ayuda/acerca'),
(7074, '/CAIDV/vista/intranet.php?vista=ayuda/acerca', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'ayuda/acerca'),
(7075, '/CAIDV/vista/intranet.php?vista=ayuda/acerca', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'ayuda/acerca'),
(7076, '/CAIDV/vista/intranet.php?vista=ayuda/acerca', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'ayuda/acerca'),
(7077, '/CAIDV/vista/intranet.php?vista=ayuda/acerca', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'ayuda/acerca'),
(7078, '/CAIDV/vista/intranet.php?vista=ayuda/acerca', '2015-05-09 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'ayuda/acerca'),
(7079, '/CAIDV/vista/intranet.php?vista=ayuda/acerca', '2015-05-09 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'ayuda/acerca'),
(7080, '/CAIDV/vista/intranet.php', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'Panel_inicio'),
(7081, '/CAIDV/vista/intranet.php', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'Panel_inicio'),
(7082, '/CAIDV/vista/intranet.php?vista=archivo/asignatura', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/asignatura'),
(7083, '/CAIDV/vista/intranet.php?vista=archivo/consultar_asignatura&id=1', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/consultar_asignatura'),
(7084, '/CAIDV/vista/intranet.php?vista=archivo/asignatura', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/asignatura'),
(7085, '/CAIDV/vista/intranet.php?vista=archivo/consultar_asignatura&id=1', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/consultar_asignatura'),
(7086, 'http://localhost/CAIDV/vista/intranet.php?vista=archivo/consultar_asignatura&id=1', '2015-05-09 16:35:00', '', '', '::1', 'Error en los datos', 'Modificar', '', 'tasignatura', '15491963', 'editar_asignatura'),
(7087, '/CAIDV/vista/intranet.php?vista=archivo/asignatura', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/asignatura'),
(7088, '/CAIDV/vista/intranet.php?vista=archivo/consultar_asignatura&id=1', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/consultar_asignatura'),
(7089, 'http://localhost/CAIDV/vista/intranet.php?vista=archivo/consultar_asignatura&id=1', '2015-05-09 16:35:00', '', '', '::1', 'Error en los datos', 'Modificar', '', 'tasignatura', '15491963', 'editar_asignatura'),
(7090, '/CAIDV/vista/intranet.php?vista=archivo/asignatura', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/asignatura'),
(7091, '/CAIDV/vista/intranet.php', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'Panel_inicio'),
(7092, '/CAIDV/vista/intranet.php', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'Panel_inicio'),
(7093, '/CAIDV/vista/intranet.php?vista=archivo/asignatura', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/asignatura'),
(7094, '/CAIDV/vista/intranet.php?vista=archivo/consultar_asignatura&id=1', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/consultar_asignatura'),
(7095, 'http://localhost/CAIDV/vista/intranet.php?vista=archivo/consultar_asignatura&id=1', '2015-05-09 16:35:00', '', '', '::1', 'Error en los datos', 'Modificar', '', 'tasignatura', '15491963', 'editar_asignatura'),
(7096, '/CAIDV/vista/intranet.php?vista=archivo/asignatura', '2015-05-09 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/asignatura'),
(7097, '/CAIDV/vista/intranet.php', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'Panel_inicio'),
(7098, '/CAIDV/vista/intranet.php', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'Panel_inicio'),
(7099, '/CAIDV/vista/intranet.php?vista=curso/registrar_curso', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/registrar_curso'),
(7100, '/CAIDV/vista/intranet.php', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', 'administrador', 'Panel_inicio'),
(7101, '/CAIDV/vista/intranet.php?vista=curso/registrar_curso', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', 'administrador', 'curso/registrar_curso'),
(7102, '/CAIDV/vista/intranet.php', '2015-05-09 05:35:00', '', '', '::1', '-', 'Navegar', '-', '-', 'administrador', 'Panel_inicio'),
(7103, '/CAIDV/vista/intranet.php', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'Panel_inicio'),
(7104, '/CAIDV/vista/intranet.php?vista=sistema/noticia', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'sistema/noticia'),
(7105, '/CAIDV/vista/intranet.php?vista=sistema/registrar_noticia', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'sistema/registrar_noticia'),
(7106, '/CAIDV/vista/intranet.php?vista=sistema/noticia', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'sistema/noticia'),
(7107, '/CAIDV/vista/intranet.php', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'Panel_inicio'),
(7108, '/CAIDV/vista/intranet.php?vista=seguridad/rol', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/rol'),
(7109, '/CAIDV/vista/intranet.php?vista=seguridad/registrar_rol', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/registrar_rol'),
(7110, '/CAIDV/vista/intranet.php?vista=seguridad/rol', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/rol'),
(7111, '/CAIDV/vista/intranet.php?vista=seguridad/modulo', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/modulo'),
(7112, '/CAIDV/vista/intranet.php?vista=seguridad/consultar_modulo&o=Consultar&id=1', '2015-05-09 06:35:00', '', '', '::1', '-', 'Consultar', '-', '-', '15491963', 'seguridad/consultar_modulo'),
(7113, 'http://localhost/CAIDV/vista/intranet.php?vista=seguridad/consultar_modulo&o=Consultar&id=1', '2015-05-09 06:35:00', 'Administrar', 'AdministraciÃ³n', '::1', 'Error en los datos', 'Modificar', 'nombremod', 'tmodulo', '15491963', 'editar_modulo'),
(7114, '/CAIDV/vista/intranet.php?vista=seguridad/modulo', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/modulo'),
(7115, '/CAIDV/vista/intranet.php?vista=seguridad/servicio', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/servicio'),
(7116, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_modulo', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_modulo'),
(7117, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_modulo&id=1', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_modulo'),
(7118, '/CAIDV/vista/intranet.php', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'Panel_inicio'),
(7119, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_servicio'),
(7120, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio&id=1', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_servicio'),
(7121, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_modulo', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_modulo'),
(7122, '/CAIDV/vista/intranet.php?vista=seguridad/bitacora', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/bitacora'),
(7123, '/CAIDV/vista/intranet.php?vista=seguridad/consultar_bitacora&id=7122&o=Consultar', '2015-05-09 06:35:00', '', '', '::1', '-', 'Consultar', '-', '-', '15491963', 'seguridad/consultar_bitacora'),
(7124, '/CAIDV/vista/intranet.php?vista=seguridad/bitacora', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/bitacora'),
(7125, '/CAIDV/vista/intranet.php?vista=seguridad/auditoria_usuarios', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/auditoria_usuarios'),
(7126, '/CAIDV/vista/intranet.php?vista=seguridad/consultar_usuario&id=15491963', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/consultar_usuario'),
(7127, '/CAIDV/vista/intranet.php?vista=seguridad/bitacora_reporte', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/bitacora_reporte'),
(7128, '/CAIDV/vista/intranet.php?vista=sistema/noticia', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'sistema/noticia'),
(7129, '/CAIDV/vista/intranet.php?vista=sistema/slider', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'sistema/slider'),
(7130, '/CAIDV/vista/intranet.php?vista=seguridad/bloquear', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/bloquear'),
(7131, '/CAIDV/vista/intranet.php?vista=seguridad/bloquear', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/bloquear'),
(7132, '/CAIDV/vista/intranet.php?vista=sistema/configurar', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'sistema/configurar'),
(7133, '/CAIDV/vista/intranet.php?vista=sistema/configurar', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'sistema/configurar'),
(7134, '/CAIDV/vista/intranet.php?vista=seguridad/cambiar_clave', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/cambiar_clave'),
(7135, '/CAIDV/vista/intranet.php', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'Panel_inicio'),
(7136, '/CAIDV/vista/intranet.php?vista=seguridad/registrar_pregunta', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/registrar_pregunta'),
(7137, '/CAIDV/vista/intranet.php', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'Panel_inicio'),
(7138, '/CAIDV/vista/intranet.php?vista=archivo/municipio', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/municipio'),
(7139, '/CAIDV/vista/intranet.php?vista=archivo/registrar_municipio', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/registrar_municipio'),
(7140, '/CAIDV/vista/intranet.php?vista=archivo/municipio', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/municipio'),
(7141, '/CAIDV/vista/intranet.php?vista=archivo/consultar_municipio&id=1', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/consultar_municipio'),
(7142, '/CAIDV/vista/intranet.php?vista=archivo/municipio', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/municipio'),
(7143, '/CAIDV/vista/intranet.php?vista=archivo/localidad', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/localidad'),
(7144, '/CAIDV/vista/intranet.php?vista=archivo/institucion', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/institucion'),
(7145, '/CAIDV/vista/intranet.php?vista=archivo/diagnostico', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/diagnostico'),
(7146, '/CAIDV/vista/intranet.php?vista=archivo/parentesco', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/parentesco'),
(7147, '/CAIDV/vista/intranet.php?vista=archivo/institucion', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/institucion'),
(7148, '/CAIDV/vista/intranet.php?vista=archivo/registrar_institucion', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/registrar_institucion'),
(7149, '/CAIDV/vista/intranet.php?vista=archivo/institucion', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/institucion'),
(7150, '/CAIDV/vista/intranet.php?vista=archivo/registrar_institucion&id=2', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/registrar_institucion'),
(7151, '/CAIDV/vista/intranet.php?vista=archivo/institucion', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/institucion'),
(7152, '/CAIDV/vista/intranet.php?vista=archivo/grupo', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/grupo'),
(7153, '/CAIDV/vista/intranet.php?vista=archivo/registrar_grupo', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/registrar_grupo'),
(7154, 'http://localhost/CAIDV/vista/intranet.php?vista=archivo/registrar_grupo', '2015-05-09 06:35:00', '', '', '::1', 'Cargar datos', 'Registrar', '*', 'tgrupo', '15491963', 'registrar_grupo'),
(7155, '/CAIDV/vista/intranet.php?vista=archivo/grupo', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/grupo'),
(7156, 'http://localhost/CAIDV/vista/intranet.php?vista=archivo/grupo', '2015-05-09 06:35:00', '1', '0', '::1', 'No sÃ© utiliza', 'Eliminar', 'estatusgru', 'tgrupo', '15491963', 'eliminar_grupo'),
(7157, '/CAIDV/vista/intranet.php?vista=archivo/grupo', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/grupo'),
(7158, '/CAIDV/vista/intranet.php?vista=archivo/aula', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/aula'),
(7159, '/CAIDV/vista/intranet.php?vista=archivo/area_conocimiento', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/area_conocimiento'),
(7160, '/CAIDV/vista/intranet.php?vista=archivo/consultar_area&id=1', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/consultar_area'),
(7161, '/CAIDV/vista/intranet.php?vista=archivo/area_conocimiento', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/area_conocimiento'),
(7162, '/CAIDV/vista/intranet.php?vista=archivo/asignatura', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/asignatura'),
(7163, '/CAIDV/vista/intranet.php?vista=archivo/consultar_asignatura&id=1', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/consultar_asignatura'),
(7164, '/CAIDV/vista/intranet.php?vista=archivo/asignatura', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/asignatura'),
(7165, '/CAIDV/vista/intranet.php?vista=archivo/item', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/item'),
(7166, '/CAIDV/vista/intranet.php?vista=archivo/consultar_item&id=1', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/consultar_item'),
(7167, '/CAIDV/vista/intranet.php?vista=archivo/item', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/item'),
(7168, '/CAIDV/vista/intranet.php?vista=archivo/instrumento', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/instrumento'),
(7169, '/CAIDV/vista/intranet.php?vista=archivo/consultar_instrumento&id=1', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/consultar_instrumento'),
(7170, '/CAIDV/vista/intranet.php?vista=archivo/instrumento', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/instrumento'),
(7171, '/CAIDV/vista/intranet.php?vista=persona/docente', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'persona/docente'),
(7172, '/CAIDV/vista/intranet.php?vista=persona/participante', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'persona/participante'),
(7173, '/CAIDV/vista/intranet.php?vista=persona/registrar_participante', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'persona/registrar_participante'),
(7174, '/CAIDV/vista/intranet.php?vista=persona/participante', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'persona/participante'),
(7175, 'http://localhost/CAIDV/vista/intranet.php?vista=persona/participante', '2015-05-09 14:35:00', 'bc3caf8d-1168-4108-ae95-007c7b01c075', '1', '::1', '-', 'Reporte', 'idparticipante', '-', '15491963', 'plantilla_inscripcion'),
(7176, '/CAIDV/vista/intranet.php?vista=persona/personal', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'persona/personal'),
(7177, '/CAIDV/vista/intranet.php?vista=curso/lapso', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/lapso'),
(7178, '/CAIDV/vista/intranet.php?vista=curso/registrar_curso', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/registrar_curso'),
(7179, 'http://localhost/CAIDV/vista/intranet.php?vista=curso/registrar_curso', '2015-05-09 06:35:00', '', '', '::1', 'Cargar datos', 'Registrar', '*', 'tcurso', '15491963', 'registrar_curso'),
(7180, '/CAIDV/vista/intranet.php?vista=curso/curso', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/curso'),
(7181, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_cursos_inscribir'),
(7182, '/CAIDV/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=1', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/inscripcion_masiva'),
(7183, 'http://localhost/CAIDV/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=1', '2015-05-09 06:35:00', '', '', '::1', 'Cargar datos', 'Registrar', '*', 'tcurso_tparticipante', '15491963', 'inscribir_curso'),
(7184, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_cursos_inscribir'),
(7185, '/CAIDV/vista/intranet.php?vista=curso/asistencia', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/asistencia'),
(7186, '/CAIDV/vista/intranet.php?vista=curso/registrar_asistencia&id=1', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/registrar_asistencia'),
(7187, '/CAIDV/vista/intranet.php?vista=curso/registrar_asistencia&id=1', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/registrar_asistencia'),
(7188, 'http://localhost/CAIDV/vista/intranet.php?vista=curso/registrar_asistencia&id=1', '2015-05-09 14:35:00', '8de3a5a3-55a7-49f2-a86a-af643e28d0b5', '', '::1', '-', 'Reporte', 'idevaluacion', '-', '15491963', 'evaluacion'),
(7189, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(7190, '/CAIDV/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-09 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/registrar_evaluacion'),
(7191, 'http://localhost/CAIDV/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-09 14:35:00', 'e3754ef7-39bd-44b3-9366-6a66c89ef98e', '', '::1', '-', 'Reporte', 'idevaluacion', '-', '15491963', 'evaluacion'),
(7192, 'http://localhost/CAIDV/vista/intranet.php?vista=curso/registrar_evaluacion', '2015-05-09 07:35:00', '', '', '::1', 'Cargar datos', 'Registrar', '*', 'tevaluacion', '15491963', 'registrar_evaluacion'),
(7193, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-09 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(7194, '/CAIDV/vista/intranet.php?vista=reporte/planilla_inscripcion', '2015-05-09 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/planilla_inscripcion'),
(7195, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/planilla_inscripcion', '2015-05-09 14:35:00', 'd8bffb56-1c57-459d-b2c6-3cff059983dc', '1', '::1', '-', 'Reporte', 'idparticipante', '-', '15491963', 'plantilla_inscripcion'),
(7196, '/CAIDV/vista/intranet.php?vista=reporte/participante_familiar', '2015-05-09 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/participante_familiar'),
(7197, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/participante_familiar', '2015-05-09 14:35:00', '8547c3fe-4b5f-4a0d-b41a-5bd73b833524', '9837744', '::1', '-', 'Reporte', 'id', '-', '15491963', 'familiar_participante'),
(7198, '/CAIDV/vista/intranet.php?vista=reporte/historial_lapso', '2015-05-09 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/historial_lapso'),
(7199, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_lapso', '2015-05-09 14:35:00', '02f6159d-d5d7-433f-b1e5-159869f3b224', '2', '::1', '-', 'Reporte', 'idlapso', '-', '15491963', 'historial_lapso'),
(7200, '/CAIDV/vista/intranet.php?vista=reporte/historial_participante', '2015-05-09 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/historial_participante'),
(7201, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_participante', '2015-05-09 14:35:00', '841eb144-76b6-4f2e-97e2-88a2935c7073', '1', '::1', '-', 'Reporte', 'idparticipante', '-', '15491963', 'historial_participante'),
(7202, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_participante', '2015-05-09 14:35:00', '3c1565fc-838f-48ad-b594-d967e64c7dc8', '2', '::1', '-', 'Reporte', 'idparticipante', '-', '15491963', 'historial_participante'),
(7203, '/CAIDV/vista/intranet.php?vista=reporte/historial_curso', '2015-05-09 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/historial_curso'),
(7204, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_curso', '2015-05-09 14:35:00', '3ee6fcab-086a-42d3-bdaa-1222afd0e85c', '1', '::1', '-', 'Reporte', 'idcurso', '-', '15491963', 'historial_curso'),
(7205, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_etnia', '2015-05-09 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_etnia'),
(7206, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_etnia', '2015-05-09 14:35:00', '68318f68-f12d-4dd9-88c0-76745604906f', '', '::1', '-', 'Reporte', '-', '-', '15491963', 'listado_participantes_etnia'),
(7207, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_huerfanos', '2015-05-09 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_huerfanos'),
(7208, '/CAIDV/vista/intranet.php?vista=reporte/listado_docente_diagnostico', '2015-05-09 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_docente_diagnostico'),
(7209, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/listado_docente_diagnostico', '2015-05-09 14:35:00', '32f9dbce-f9d5-466c-8e15-fcb91d103c13', '1', '::1', '-', 'Reporte', 'id_diagnostico', '-', '15491963', 'listado_docentes_diagnostico'),
(7210, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-09 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_evaluaciones'),
(7211, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2', '2015-05-09 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(7212, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=1', '2015-05-09 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(7213, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=1', '2015-05-09 14:35:00', 'dcf16bbe-ec0d-4ab1-8249-af6f12c8f821', '1', '::1', '-', 'Reporte', 'idevaluacion', '-', '15491963', 'evaluacion'),
(7214, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-09 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_evaluaciones'),
(7215, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia', '2015-05-09 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_asistencia'),
(7216, '/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2', '2015-05-09 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_asistencias'),
(7217, '/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=1', '2015-05-09 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_asistencias'),
(7218, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia', '2015-05-09 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_asistencia'),
(7219, '/CAIDV/vista/intranet.php', '2015-05-09 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'Panel_inicio'),
(7220, '/CAIDV/vista/intranet.php', '2015-05-14 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'Panel_inicio'),
(7221, '/CAIDV/vista/intranet.php?vista=ayuda/acerca', '2015-05-14 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'ayuda/acerca'),
(7222, '/CAIDV/vista/intranet.php', '2015-05-14 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'Panel_inicio'),
(7223, '/CAIDV/vista/intranet.php?vista=ayuda/acerca', '2015-05-14 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'ayuda/acerca'),
(7224, '/CAIDV/vista/intranet.php?vista=ayuda/acerca', '2015-05-14 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'ayuda/acerca'),
(7225, '/CAIDV/vista/intranet.php?vista=ayuda/acerca', '2015-05-14 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'ayuda/acerca'),
(7226, '/CAIDV/vista/intranet.php?vista=ayuda/acerca', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'ayuda/acerca'),
(7227, '/CAIDV/vista/intranet.php?vista=ayuda/acerca', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'ayuda/acerca'),
(7228, '/CAIDV/vista/intranet.php?vista=ayuda/acerca', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'ayuda/acerca'),
(7229, '/CAIDV/vista/intranet.php?vista=ayuda/acerca', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'ayuda/acerca'),
(7230, '/CAIDV/vista/intranet.php?vista=ayuda/acerca', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'ayuda/acerca'),
(7231, '/CAIDV/vista/intranet.php?vista=ayuda/acerca', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'ayuda/acerca'),
(7232, '/CAIDV/vista/intranet.php?vista=ayuda/acerca', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'ayuda/acerca'),
(7233, '/CAIDV/vista/intranet.php?vista=ayuda/acerca', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'ayuda/acerca'),
(7234, '/CAIDV/vista/intranet.php?vista=ayuda/acerca', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'ayuda/acerca'),
(7235, '/CAIDV/vista/intranet.php?vista=ayuda/acerca', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'ayuda/acerca'),
(7236, '/CAIDV/vista/intranet.php?vista=ayuda/acerca', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'ayuda/acerca'),
(7237, '/CAIDV/vista/intranet.php?vista=ayuda/acerca', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'ayuda/acerca'),
(7238, '/CAIDV/vista/intranet.php?vista=ayuda/acerca', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'ayuda/acerca'),
(7239, '/CAIDV/vista/intranet.php?vista=ayuda/acerca', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'ayuda/acerca'),
(7240, '/CAIDV/vista/intranet.php?vista=ayuda/acerca', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'ayuda/acerca'),
(7241, '/CAIDV/vista/intranet.php?vista=ayuda/acerca', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'ayuda/acerca'),
(7242, '/CAIDV/vista/intranet.php?vista=ayuda/acerca', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'ayuda/acerca'),
(7243, '/CAIDV/vista/intranet.php?vista=ayuda/acerca', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'ayuda/acerca'),
(7244, '/CAIDV/vista/intranet.php', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'Panel_inicio'),
(7245, '/CAIDV/vista/intranet.php?vista=ayuda/acerca', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'ayuda/acerca'),
(7246, '/CAIDV/vista/intranet.php', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'Panel_inicio'),
(7247, '/CAIDV/vista/intranet.php', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'Panel_inicio'),
(7248, '/CAIDV/vista/intranet.php', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'Panel_inicio'),
(7249, '/CAIDV/vista/intranet.php?vista=persona/participante', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'persona/participante'),
(7250, '/CAIDV/vista/intranet.php?vista=persona/registrar_participante', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'persona/registrar_participante'),
(7251, '/CAIDV/vista/intranet.php?vista=persona/participante', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'persona/participante'),
(7252, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_cursos_inscribir'),
(7253, '/CAIDV/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=1', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/inscripcion_masiva'),
(7254, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_cursos_inscribir'),
(7255, '/CAIDV/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=1', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/inscripcion_masiva'),
(7256, '/CAIDV/vista/intranet.php?vista=curso/registrar_curso', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/registrar_curso'),
(7257, '/CAIDV/vista/intranet.php?vista=archivo/grupo', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/grupo'),
(7258, '/CAIDV/vista/intranet.php?vista=archivo/consultar_grupo&id=3', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/consultar_grupo'),
(7259, 'http://localhost/CAIDV/vista/intranet.php?vista=archivo/consultar_grupo&id=3', '2015-05-14 07:35:00', '15', '16', '::1', 'Error en los datos', 'Modificar', 'edadmin', 'tgrupo', '15491963', 'editar_grupo'),
(7260, '/CAIDV/vista/intranet.php?vista=archivo/grupo', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/grupo'),
(7261, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(7262, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(7263, '/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=1', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/consultar_evaluacion'),
(7264, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(7265, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(7266, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(7267, '/CAIDV/vista/intranet.php?vista=curso/evaluacion', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/evaluacion'),
(7268, '/CAIDV/vista/intranet.php?vista=curso/registrar_curso', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/registrar_curso'),
(7269, 'http://localhost/CAIDV/vista/intranet.php?vista=curso/registrar_curso', '2015-05-14 07:35:00', '', '', '::1', 'Cargar datos', 'Registrar', '*', 'tcurso', '15491963', 'registrar_curso'),
(7270, '/CAIDV/vista/intranet.php?vista=curso/curso', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'curso/curso'),
(7271, '/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_inscribir', '2015-05-14 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'inscripcion/listado_participantes_inscribir'),
(7272, '/CAIDV/vista/intranet.php', '2015-05-14 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'Panel_inicio'),
(7273, '/CAIDV/vista/intranet.php?vista=reporte/planilla_inscripcion', '2015-05-14 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/planilla_inscripcion'),
(7274, '/CAIDV/vista/intranet.php?vista=reporte/planilla_inscripcion', '2015-05-14 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/planilla_inscripcion'),
(7275, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/planilla_inscripcion', '2015-05-13 15:35:00', '2ae918a0-e9c8-4545-92f9-32efc725ee79', '2', '::1', '-', 'Reporte', 'idparticipante', '-', '15491963', 'plantilla_inscripcion'),
(7276, '/CAIDV/vista/intranet.php?vista=reporte/participante_familiar', '2015-05-14 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/participante_familiar'),
(7277, '/CAIDV/vista/intranet.php?vista=reporte/planilla_inscripcion', '2015-05-14 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/planilla_inscripcion'),
(7278, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/planilla_inscripcion', '2015-05-13 15:35:00', '2ac3fc3a-2f57-40a1-983d-f96147d01398', '2', '::1', '-', 'Reporte', 'idparticipante', '-', '15491963', 'plantilla_inscripcion'),
(7279, '/CAIDV/vista/intranet.php?vista=reporte/participante_familiar', '2015-05-14 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/participante_familiar'),
(7280, '/CAIDV/vista/intranet.php?vista=reporte/planilla_inscripcion', '2015-05-14 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/planilla_inscripcion'),
(7281, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/planilla_inscripcion', '2015-05-13 15:35:00', 'ebf6d0ac-831f-47b0-8b20-a3d4c553bf06', '2', '::1', '-', 'Reporte', 'idparticipante', '-', '15491963', 'plantilla_inscripcion'),
(7282, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/planilla_inscripcion', '2015-05-13 15:35:00', '14fe215a-1008-46b1-b8cf-6999aa0f8ef6', '2', '::1', '-', 'Reporte', 'idparticipante', '-', '15491963', 'plantilla_inscripcion'),
(7283, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/planilla_inscripcion', '2015-05-13 15:35:00', '20382ea2-c6fb-4618-83f5-bdaf5cc7f288', '4', '::1', '-', 'Reporte', 'idparticipante', '-', '15491963', 'plantilla_inscripcion'),
(7284, '/CAIDV/vista/intranet.php?vista=reporte/participante_familiar', '2015-05-14 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/participante_familiar'),
(7285, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/participante_familiar', '2015-05-14 16:35:00', '3ba34aa6-8c95-44a7-a48e-a747c57696b6', '9837744', '::1', '-', 'Reporte', 'id', '-', '15491963', 'familiar_participante'),
(7286, '/CAIDV/vista/intranet.php?vista=reporte/historial_lapso', '2015-05-14 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/historial_lapso'),
(7287, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_lapso', '2015-05-14 16:35:00', '4a2b8e5b-e1a4-43a2-a335-a958f45a2514', '2', '::1', '-', 'Reporte', 'idlapso', '-', '15491963', 'historial_lapso'),
(7288, '/CAIDV/vista/intranet.php?vista=reporte/historial_participante', '2015-05-14 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/historial_participante'),
(7289, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_participante', '2015-05-14 16:35:00', '3c717771-9c79-490e-a2dc-ad9eff4b328a', '2', '::1', '-', 'Reporte', 'idparticipante', '-', '15491963', 'historial_participante'),
(7290, '/CAIDV/vista/intranet.php?vista=reporte/historial_curso', '2015-05-14 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/historial_curso'),
(7291, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_curso', '2015-05-14 16:35:00', '8c941243-2fda-4c78-8143-61d357c7a8ef', '1', '::1', '-', 'Reporte', 'idcurso', '-', '15491963', 'historial_curso'),
(7292, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_huerfanos', '2015-05-14 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_huerfanos'),
(7293, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_etnia', '2015-05-14 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_etnia'),
(7294, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_etnia', '2015-05-14 16:35:00', '10c1bdaa-d9bb-4dc0-8a04-882032c07bfe', '', '::1', '-', 'Reporte', '-', '-', '15491963', 'listado_participantes_etnia'),
(7295, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_etnia', '2015-05-14 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_etnia'),
(7296, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_etnia', '2015-05-14 16:35:00', 'fff52b27-ac2a-40de-9a73-c41cfdfedf72', '', '::1', '-', 'Reporte', '-', '-', '15491963', 'listado_participantes_etnia'),
(7297, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_huerfanos', '2015-05-14 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_huerfanos'),
(7298, '/CAIDV/vista/intranet.php?vista=reporte/listado_docente_diagnostico', '2015-05-14 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_docente_diagnostico'),
(7299, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/listado_docente_diagnostico', '2015-05-14 16:35:00', '3a09a55a-f7c6-42a4-ae33-81fd3d8fa722', '1', '::1', '-', 'Reporte', 'id_diagnostico', '-', '15491963', 'listado_docentes_diagnostico');
INSERT INTO `tbitacora` (`idbitacora`, `direccionbit`, `fechahorabit`, `valoranteriorbit`, `valornuevobit`, `ipbit`, `motivobit`, `operacionbit`, `campobit`, `tablabit`, `idusuario`, `serviciobit`) VALUES
(7300, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones', '2015-05-14 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_evaluaciones'),
(7301, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2', '2015-05-14 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(7302, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=1', '2015-05-14 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(7303, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=1', '2015-05-14 16:35:00', '1779db3c-6e85-43c2-9fd9-8aec3fec631f', '1', '::1', '-', 'Reporte', 'idevaluacion', '-', '15491963', 'evaluacion'),
(7304, '/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2', '2015-05-14 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_evaluaciones'),
(7305, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia', '2015-05-14 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_asistencia'),
(7306, '/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2', '2015-05-14 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_asistencias'),
(7307, '/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=1', '2015-05-14 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/consultar_asistencias'),
(7308, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=1', '2015-05-14 16:35:00', '68e7f768-cf46-43dd-ad20-726abc0050da', '', '::1', '-', 'Reporte', 'idevaluacion', '-', '15491963', 'evaluacion'),
(7309, '/CAIDV/vista/intranet.php?vista=reporte/planilla_inscripcion', '2015-05-14 08:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/planilla_inscripcion'),
(7310, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/planilla_inscripcion', '2015-05-14 16:35:00', '69ba4828-1839-413a-b82d-4a23dea030ed', '20', '::1', '-', 'Reporte', 'idparticipante', '-', '15491963', 'plantilla_inscripcion'),
(7311, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/planilla_inscripcion', '2015-05-14 16:35:00', 'b0233567-04f8-47d5-aa96-0364577c9db5', '20', '::1', '-', 'Reporte', 'idparticipante', '-', '15491963', 'plantilla_inscripcion'),
(7312, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/planilla_inscripcion', '2015-05-14 16:35:00', 'dfc9ead8-44a5-46df-b76b-dc628d4f2c82', '18', '::1', '-', 'Reporte', 'idparticipante', '-', '15491963', 'plantilla_inscripcion'),
(7313, '/CAIDV/vista/intranet.php', '2015-05-14 09:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'Panel_inicio'),
(7314, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_huerfanos', '2015-05-14 09:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_huerfanos'),
(7315, '/CAIDV/vista/intranet.php?vista=archivo/grupo', '2015-05-14 09:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/grupo'),
(7316, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_huerfanos', '2015-05-14 16:35:00', 'b8dfb158-4f5e-40a9-a459-6bbd54c254a0', '', '::1', '-', 'Reporte', '-', '-', '15491963', 'listado_participantes_huerfanos'),
(7317, '/CAIDV/vista/intranet.php?vista=archivo/grupo', '2015-05-14 09:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/grupo'),
(7318, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_huerfanos', '2015-05-14 09:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_huerfanos'),
(7319, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_huerfanos', '2015-05-14 16:35:00', 'affffbe3-bc68-4632-971c-026e1f9a098f', '', '::1', '-', 'Reporte', '-', '-', '15491963', 'listado_participantes_huerfanos'),
(7320, '/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_huerfanos', '2015-05-14 09:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/listado_participantes_huerfanos'),
(7321, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_huerfanos', '2015-05-14 16:35:00', '997ab1c2-81ac-4205-8f8f-b324b4ec305d', '', '::1', '-', 'Reporte', '-', '-', '15491963', 'listado_participantes_huerfanos'),
(7322, '/CAIDV/vista/intranet.php', '2015-05-16 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'Panel_inicio'),
(7323, '/CAIDV/vista/intranet.php?vista=seguridad/rol', '2015-05-16 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/rol'),
(7324, '/CAIDV/vista/intranet.php?vista=seguridad/bitacora', '2015-05-16 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/bitacora'),
(7325, '/CAIDV/vista/intranet.php?vista=seguridad/consultar_bitacora&id=7259&o=Consultar', '2015-05-16 06:35:00', '', '', '::1', '-', 'Consultar', '-', '-', '15491963', 'seguridad/consultar_bitacora'),
(7326, '/CAIDV/vista/intranet.php?vista=reporte/historial_participante', '2015-05-16 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/historial_participante'),
(7327, '/CAIDV/vista/intranet.php?vista=reporte/historial_lapso', '2015-05-16 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/historial_lapso'),
(7328, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_lapso', '2015-05-16 14:35:00', '3021da72-267e-4484-a694-09e7e09a8f6f', '2', '::1', '-', 'Reporte', 'idlapso', '-', '15491963', 'historial_lapso'),
(7329, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio', '2015-05-16 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_servicio'),
(7330, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio&id=1', '2015-05-16 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_servicio'),
(7331, '/CAIDV/vista/intranet.php', '2015-05-16 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'Panel_inicio'),
(7332, '/CAIDV/vista/intranet.php?vista=seguridad/servicio', '2015-05-16 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/servicio'),
(7333, '/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=130', '2015-05-16 06:35:00', '', '', '::1', '-', 'Consultar', '-', '-', '15491963', 'seguridad/consultar_servicio'),
(7334, 'http://localhost/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=130', '2015-05-16 06:35:00', '5', '1', '::1', 'Error en los datos', 'Modificar', 'idmodulo', 'tservicio', '15491963', 'editar_servicio'),
(7335, '/CAIDV/vista/intranet.php?vista=seguridad/servicio', '2015-05-16 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/servicio'),
(7336, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio', '2015-05-16 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_servicio'),
(7337, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio&id=1', '2015-05-16 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_servicio'),
(7338, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio', '2015-05-16 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_servicio'),
(7339, '/CAIDV/vista/intranet.php?vista=seguridad/mantenimiento_bd', '2015-05-16 06:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/mantenimiento_bd'),
(7340, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio&id=1', '2015-05-16 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_servicio'),
(7341, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio', '2015-05-16 07:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_servicio'),
(7342, '/CAIDV/vista/intranet.php', '2015-05-16 12:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'Panel_inicio'),
(7343, '/CAIDV/vista/intranet.php?vista=sistema/configurar', '2015-05-16 12:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'sistema/configurar'),
(7344, '/CAIDV/vista/intranet.php?vista=sistema/configurar', '2015-05-16 12:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'sistema/configurar'),
(7345, '/CAIDV/vista/intranet.php?vista=seguridad/rol', '2015-05-16 12:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/rol'),
(7346, '/CAIDV/vista/intranet.php?vista=seguridad/consultar_rol&o=Consultar&id=1', '2015-05-16 12:35:00', '', '', '::1', '-', 'Consultar', '-', '-', '15491963', 'seguridad/consultar_rol'),
(7347, '/CAIDV/vista/intranet.php?vista=seguridad/rol', '2015-05-16 12:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/rol'),
(7348, '/CAIDV/vista/intranet.php?vista=seguridad/modulo', '2015-05-16 12:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/modulo'),
(7349, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio', '2015-05-16 12:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_servicio'),
(7350, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio&id=1', '2015-05-16 12:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_servicio'),
(7351, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_modulo', '2015-05-16 12:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_modulo'),
(7352, '/CAIDV/vista/intranet.php?vista=seguridad/bitacora', '2015-05-16 12:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/bitacora'),
(7353, '/CAIDV/vista/intranet.php?vista=seguridad/auditoria_usuarios', '2015-05-16 12:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/auditoria_usuarios'),
(7354, '/CAIDV/vista/intranet.php?vista=seguridad/consultar_usuario&id=15491963', '2015-05-16 12:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/consultar_usuario'),
(7355, '/CAIDV/vista/intranet.php?vista=seguridad/bitacora_reporte', '2015-05-16 12:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/bitacora_reporte'),
(7356, 'http://localhost/CAIDV/vista/intranet.php?vista=seguridad/bitacora_reporte', '2015-05-16 08:35:00', 'dbdd4d5a-913b-4be6-8fcd-6a0cc6881ef4', '2', '::1', '-', 'Reporte', 'idlapso', '-', '15491963', 'historial_lapso'),
(7357, '/CAIDV/vista/intranet.php?vista=seguridad/consultar_bitacora_reporte&id=7328', '2015-05-16 12:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/consultar_bitacora_reporte'),
(7358, '/CAIDV/vista/intranet.php?vista=seguridad/bitacora_reporte', '2015-05-16 12:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/bitacora_reporte'),
(7359, '/CAIDV/vista/intranet.php?vista=seguridad/bitacora', '2015-05-16 12:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/bitacora'),
(7360, '/CAIDV/vista/intranet.php?vista=seguridad/consultar_bitacora&id=7259&o=Consultar', '2015-05-16 12:35:00', '', '', '::1', '-', 'Consultar', '-', '-', '15491963', 'seguridad/consultar_bitacora'),
(7361, 'http://localhost/CAIDV/vista/intranet.php?vista=seguridad/consultar_bitacora&id=7259&o=Consultar', '2015-05-16 12:35:00', '16', '15', '::1', 'Cambios no deseados', 'Revertir los cambios', 'edadmin', 'tgrupo', '15491963', 'editar_grupo'),
(7362, '/CAIDV/vista/intranet.php?vista=seguridad/bitacora', '2015-05-16 12:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/bitacora'),
(7363, '/CAIDV/vista/intranet.php?vista=archivo/grupo', '2015-05-16 12:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/grupo'),
(7364, '/CAIDV/vista/intranet.php?vista=archivo/consultar_grupo&id=3', '2015-05-16 12:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/consultar_grupo'),
(7365, '/CAIDV/vista/intranet.php?vista=archivo/grupo', '2015-05-16 12:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'archivo/grupo'),
(7366, '/CAIDV/vista/intranet.php?vista=reporte/planilla_inscripcion', '2015-05-16 12:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'reporte/planilla_inscripcion'),
(7367, 'http://localhost/CAIDV/vista/intranet.php?vista=reporte/planilla_inscripcion', '2015-05-16 08:35:00', '1a72972a-d88a-4ec8-8a26-ec32497e857b', '1', '::1', '-', 'Reporte', 'idparticipante', '-', '15491963', 'plantilla_inscripcion'),
(7368, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio', '2015-05-16 12:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_servicio'),
(7369, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio&id=1', '2015-05-16 12:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_servicio'),
(7370, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio', '2015-05-16 12:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_servicio'),
(7371, '/CAIDV/vista/intranet.php?vista=seguridad/mantenimiento_bd', '2015-05-16 12:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/mantenimiento_bd'),
(7372, '/CAIDV/vista/intranet.php', '2015-05-21 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'Panel_inicio'),
(7373, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_modulo', '2015-05-21 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_modulo'),
(7374, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_modulo&id=1', '2015-05-21 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_modulo'),
(7375, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio&id=1', '2015-05-21 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_servicio'),
(7376, '/CAIDV/vista/intranet.php?vista=seguridad/servicio', '2015-05-21 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/servicio'),
(7377, '/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=52', '2015-05-21 16:35:00', '', '', '::1', '-', 'Consultar', '-', '-', '15491963', 'seguridad/consultar_servicio'),
(7378, 'http://localhost/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=52', '2015-05-21 16:35:00', '1', '5', '::1', 'Error en los datos', 'Modificar', 'idmodulo', 'tservicio', '15491963', 'editar_servicio'),
(7379, '/CAIDV/vista/intranet.php?vista=seguridad/servicio', '2015-05-21 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/servicio'),
(7380, '/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=53', '2015-05-21 16:35:00', '', '', '::1', '-', 'Consultar', '-', '-', '15491963', 'seguridad/consultar_servicio'),
(7381, 'http://localhost/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=53', '2015-05-21 16:35:00', '1', '5', '::1', 'Error en los datos', 'Modificar', 'idmodulo', 'tservicio', '15491963', 'editar_servicio'),
(7382, '/CAIDV/vista/intranet.php?vista=seguridad/servicio', '2015-05-21 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/servicio'),
(7383, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio', '2015-05-21 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_servicio'),
(7384, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio&id=1', '2015-05-21 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_servicio'),
(7385, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio', '2015-05-21 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_servicio'),
(7386, '/CAIDV/vista/intranet.php?vista=seguridad/asignar_modulo', '2015-05-21 16:35:00', '', '', '::1', '-', 'Navegar', '-', '-', '15491963', 'seguridad/asignar_modulo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tclave`
--

CREATE TABLE IF NOT EXISTS `tclave` (
  `idclave` int(11) NOT NULL AUTO_INCREMENT,
  `clavecla` varchar(45) NOT NULL,
  `fechainiciocla` date NOT NULL,
  `fechafincla` date NOT NULL,
  `estatuscla` tinyint(1) NOT NULL DEFAULT '1',
  `tusuario_idusuario` varchar(20) NOT NULL,
  PRIMARY KEY (`idclave`),
  KEY `fk_tclave_tusuario1_idx` (`tusuario_idusuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Volcado de datos para la tabla `tclave`
--

INSERT INTO `tclave` (`idclave`, `clavecla`, `fechainiciocla`, `fechafincla`, `estatuscla`, `tusuario_idusuario`) VALUES
(1, '96cab341bae5567148a5e5d9e636e13e', '2014-01-25', '2014-02-13', 0, 'administrador'),
(3, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', '2014-02-13', '2014-10-15', 0, 'administrador'),
(9, 'a1ea88131cd3c74cee8e3f0712bfb707abe0e761', '2014-10-15', '2015-02-22', 0, 'administrador'),
(13, '7cc24b2198339d797e704bc53c6527dc6b400b59', '2015-02-22', '2015-06-22', 1, 'administrador'),
(14, '7c222fb2927d828af22f592134e8932480637c0d', '2015-03-23', '2015-03-23', 0, '15491963'),
(15, '47fa7fdd4db234bc01c34c85e5e0add77d4a1cc9', '2015-03-23', '2015-07-21', 1, '15491963'),
(16, '7c222fb2927d828af22f592134e8932480637c0d', '2015-03-23', '2015-07-21', 1, '17960877'),
(17, '7c222fb2927d828af22f592134e8932480637c0d', '2015-03-23', '2015-03-23', 0, '12526145'),
(18, '085d79cf841505f3e79f043884f8875416324966', '2015-03-23', '2015-07-21', 1, '12526145'),
(19, '7c222fb2927d828af22f592134e8932480637c0d', '2015-03-24', '2015-07-22', 1, '18672728');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tcurso`
--

CREATE TABLE IF NOT EXISTS `tcurso` (
  `idcurso` int(11) NOT NULL AUTO_INCREMENT,
  `nombrecur` varchar(100) NOT NULL,
  `desgripcioncur` varchar(40) NOT NULL,
  `capacidadcur` int(11) NOT NULL,
  `estatuscur` char(1) NOT NULL DEFAULT '1',
  `tlapso_idlapso` int(11) NOT NULL,
  `tgrupo_idgrupo` int(11) NOT NULL,
  `tasignatura_idasignatura` int(11) NOT NULL,
  `taula_idaula` int(11) DEFAULT NULL,
  `tdocente_iddocente` int(11) NOT NULL,
  PRIMARY KEY (`idcurso`),
  KEY `fk_tcurso_tlapso1_idx` (`tlapso_idlapso`),
  KEY `fk_tcurso_tgrupo1_idx` (`tgrupo_idgrupo`),
  KEY `tasignatura_idasignatura` (`tasignatura_idasignatura`),
  KEY `taula_idaula` (`taula_idaula`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `tcurso`
--

INSERT INTO `tcurso` (`idcurso`, `nombrecur`, `desgripcioncur`, `capacidadcur`, `estatuscur`, `tlapso_idlapso`, `tgrupo_idgrupo`, `tasignatura_idasignatura`, `taula_idaula`, `tdocente_iddocente`) VALUES
(1, 'INICIAL - INFORMATICA', '', 20, '1', 2, 1, 1, 8, 19307641),
(2, 'JUVENIL - INFORMATICA', '', 20, '1', 2, 2, 1, 8, 19376868);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tcurso_tparticipante`
--

CREATE TABLE IF NOT EXISTS `tcurso_tparticipante` (
  `idcurso_participante` int(11) NOT NULL AUTO_INCREMENT,
  `tcurso_idcurso` int(11) NOT NULL,
  `tparticipante_idparticipante` int(11) NOT NULL,
  `estatus` char(1) DEFAULT '1',
  `fecha_inscripcion` date DEFAULT NULL,
  `fecha_egreso` date DEFAULT NULL,
  `motivo` text,
  `idresponsable_ing` char(9) DEFAULT NULL,
  `idresponsable_egr` char(9) DEFAULT NULL,
  PRIMARY KEY (`idcurso_participante`),
  KEY `fk_tgrupo_has_tinscripcion_tgrupo1_idx` (`tcurso_idcurso`),
  KEY `fk_tcurso_tinscripcion_tparticipante1_idx` (`tparticipante_idparticipante`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `tcurso_tparticipante`
--

INSERT INTO `tcurso_tparticipante` (`idcurso_participante`, `tcurso_idcurso`, `tparticipante_idparticipante`, `estatus`, `fecha_inscripcion`, `fecha_egreso`, `motivo`, `idresponsable_ing`, `idresponsable_egr`) VALUES
(1, 1, 2, '1', '2015-05-09', NULL, NULL, '10143804', NULL),
(2, 1, 3, '1', '2015-05-09', NULL, NULL, '10143804', NULL),
(3, 1, 8, '1', '2015-05-09', NULL, NULL, '10143804', NULL),
(4, 1, 9, '1', '2015-05-09', NULL, NULL, '10143804', NULL),
(5, 1, 11, '1', '2015-05-09', NULL, NULL, '10143804', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tdiagnostico`
--

CREATE TABLE IF NOT EXISTS `tdiagnostico` (
  `iddiagnostico` int(11) NOT NULL AUTO_INCREMENT,
  `descripciondia` varchar(65) NOT NULL,
  `estatusdia` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`iddiagnostico`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `tdiagnostico`
--

INSERT INTO `tdiagnostico` (`iddiagnostico`, `descripciondia`, `estatusdia`) VALUES
(1, 'VISION NORMAL', '1'),
(2, 'BAJA VISION', '1'),
(3, 'CIEGO', '1'),
(4, 'CIEGA', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tdocente`
--

CREATE TABLE IF NOT EXISTS `tdocente` (
  `nacionalidaddoc` char(1) DEFAULT 'V',
  `iddocente` char(9) NOT NULL,
  `nombreunodoc` varchar(45) NOT NULL,
  `nombredosdoc` varchar(45) DEFAULT NULL,
  `apellidounodoc` varchar(45) NOT NULL,
  `apellidodosdoc` varchar(45) DEFAULT NULL,
  `sexodoc` char(1) NOT NULL,
  `fechanacimientodoc` date NOT NULL,
  `direcciondoc` varchar(200) NOT NULL,
  `telefonodoc` varchar(12) NOT NULL,
  `correodoc` varchar(55) DEFAULT NULL,
  `titulodoc` varchar(30) NOT NULL,
  `tipodoc` varchar(45) DEFAULT NULL,
  `estatusdoc` char(1) NOT NULL DEFAULT '1',
  `tdiagnostico_iddiagnostico` int(11) NOT NULL,
  `tlocalidad_idlocalidad` int(11) NOT NULL,
  PRIMARY KEY (`iddocente`),
  KEY `fk_tprofesor_tdiagnostico1_idx` (`tdiagnostico_iddiagnostico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tdocente`
--

INSERT INTO `tdocente` (`nacionalidaddoc`, `iddocente`, `nombreunodoc`, `nombredosdoc`, `apellidounodoc`, `apellidodosdoc`, `sexodoc`, `fechanacimientodoc`, `direcciondoc`, `telefonodoc`, `correodoc`, `titulodoc`, `tipodoc`, `estatusdoc`, `tdiagnostico_iddiagnostico`, `tlocalidad_idlocalidad`) VALUES
('V', '10143804', 'YAJAIRA', '', 'SOTO', '', 'F', '1967-12-05', 'ARAURE', '04245642522', NULL, 'LICENCIADO EN EDUCACION', 'ESPECIALISTA', '1', 1, 2),
('V', '10636038', 'JOHNNY', '', 'MENA', '', 'M', '1969-06-15', 'ARAURE', '04168391072', NULL, 'LICENCIADO EN EDUCACION', 'ESPECIALISTA', '1', 1, 2),
('V', '11542306', 'AURA', '', 'TORREALBA', '', 'F', '1973-04-11', 'ACARIGUA', '04263083310', NULL, 'LICENCIADA EN EDUCACION', 'AULA', '1', 1, 1),
('V', '11544033', 'JULIMAR', '', 'CONDE', '', 'F', '1972-05-05', 'ACARIGUA', '04167597154', NULL, 'PREGRADO', 'ESPECIALISTA', '1', 1, 1),
('V', '11549138', 'MARIA', '', 'RODRIGUEZ', '', 'F', '1964-07-17', 'ARAURE', '04145943812', NULL, 'LICENCIADO EN EDUCACION', 'ESPECIALISTA', '1', 1, 2),
('V', '11849063', 'JAVIER', '', 'FUIGUEREDO', '', 'M', '1974-03-20', 'ACARIGUA', '04161502524', NULL, 'LICENCIADO EN EDUCACION', 'AULA', '1', 3, 1),
('V', '12265074', 'ANA', 'MARIA', 'SERRADA', '', 'F', '1974-01-18', 'ARAURE', '04161456847', NULL, 'TSU EN EDUCACION', 'AULA', '1', 1, 2),
('V', '12965189', 'CARMEN', '', 'SALCEDO', '', 'F', '1975-01-04', 'ACARIGUA', '04245199580', NULL, 'PREGRADO', 'AULA', '1', 1, 1),
('V', '13072250', 'MEIBRY', '', 'GRIMAN', '', 'F', '1976-03-08', 'ACARIGUA', '04145527240', NULL, 'LICENCIADO EN EDUCACION', 'ESPECIALISTA', '1', 1, 1),
('V', '13306670', 'MARLE', '', 'ALVARADO', '', 'F', '1976-06-04', 'ARAURE', '04267551363', NULL, 'LICENCIADO EN EDUCACION', 'AULA', '1', 1, 2),
('V', '19307641', 'CRITOBAL', '', 'OSPINO', '', 'M', '1986-02-28', 'ARAURE', '04167556649', NULL, 'LICENCIADO EN EDUCACION', 'AULA', '1', 3, 2),
('V', '19376868', 'IVON', '', 'CAMACHO', '', 'F', '1987-08-09', 'ACARIGUA', '04145787444', NULL, 'LICENCIADO EN EDUCACION', 'AULA', '1', 1, 1),
('V', '5957406', 'CARMEN', '', 'LOBO', '', 'F', '1959-10-31', 'ACARIGUA', '04260308331', NULL, 'POSTGRADO', 'ESPECIALISTA', '1', 1, 1),
('V', '7596895', 'YAJAIRA', '', 'PADILLA', '', 'F', '1962-02-23', 'ACARIGUA', '04163510058', NULL, 'LICENCIADO EN EDUCACION', 'AULA', '1', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tevaluacion`
--

CREATE TABLE IF NOT EXISTS `tevaluacion` (
  `idevaluacion` int(11) NOT NULL AUTO_INCREMENT,
  `fechaeva` datetime NOT NULL,
  `observacioneva` text COLLATE utf8_spanish2_ci,
  `estatuseva` char(1) COLLATE utf8_spanish2_ci DEFAULT '1',
  `idcurso_idparticipante` int(11) NOT NULL,
  `tinstrumento_idinstrumento` int(11) DEFAULT NULL,
  PRIMARY KEY (`idevaluacion`),
  KEY `fk_tevaluacion_tcurso_tparticipante_1` (`idcurso_idparticipante`),
  KEY `fk_tevaluacion_tinstrumento_1` (`tinstrumento_idinstrumento`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `tevaluacion`
--

INSERT INTO `tevaluacion` (`idevaluacion`, `fechaeva`, `observacioneva`, `estatuseva`, `idcurso_idparticipante`, `tinstrumento_idinstrumento`) VALUES
(1, '2015-05-09 00:00:00', '', '1', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tevaluacion_item`
--

CREATE TABLE IF NOT EXISTS `tevaluacion_item` (
  `tevaluacion_idevaluacion` int(11) NOT NULL,
  `titem_iditem` int(11) NOT NULL,
  `valor` varchar(500) COLLATE utf8_spanish2_ci DEFAULT NULL,
  KEY `fk_tevaluacion_item_titem_1` (`titem_iditem`),
  KEY `fk_tevaluacion_evaluacion_idevaluacion_1` (`tevaluacion_idevaluacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tevaluacion_item`
--

INSERT INTO `tevaluacion_item` (`tevaluacion_idevaluacion`, `titem_iditem`, `valor`) VALUES
(1, 1, 'SI LOGRO LOS OBJETIVOS'),
(1, 2, 'BUEN AVANCE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tfamiliar`
--

CREATE TABLE IF NOT EXISTS `tfamiliar` (
  `nacionalidadfam` char(1) DEFAULT 'V',
  `idfamiliar` char(9) NOT NULL,
  `nombreunofam` varchar(45) NOT NULL,
  `nombredosfam` varchar(45) DEFAULT NULL,
  `apellidounofam` varchar(45) NOT NULL,
  `apellidodosfam` varchar(45) DEFAULT NULL,
  `sexofam` char(1) NOT NULL,
  `telefonofam` varchar(12) NOT NULL,
  `correofam` varchar(55) DEFAULT NULL,
  `fechanacimientofam` date NOT NULL,
  `direccionfam` varchar(200) NOT NULL,
  `ocupacionfam` varchar(30) NOT NULL,
  `gradoinstrucfam` varchar(20) NOT NULL,
  `numhijofam` int(2) NOT NULL,
  `ingresofam` double NOT NULL,
  `tdiagnostico_iddiagnostico` int(11) NOT NULL,
  `estatusfam` char(1) NOT NULL DEFAULT '1',
  `tlocalidad_idlocalidad` int(11) NOT NULL,
  PRIMARY KEY (`idfamiliar`),
  KEY `fk_tfamiliar_tdiagnostico1_idx` (`tdiagnostico_iddiagnostico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tfamiliar`
--

INSERT INTO `tfamiliar` (`nacionalidadfam`, `idfamiliar`, `nombreunofam`, `nombredosfam`, `apellidounofam`, `apellidodosfam`, `sexofam`, `telefonofam`, `correofam`, `fechanacimientofam`, `direccionfam`, `ocupacionfam`, `gradoinstrucfam`, `numhijofam`, `ingresofam`, `tdiagnostico_iddiagnostico`, `estatusfam`, `tlocalidad_idlocalidad`) VALUES
('V', '11078708', 'GRISELIDYS', '', 'SILVA', '', 'F', '04161234568', NULL, '1978-07-19', 'ARAURE', 'AMA DE CASA', 'BACHILLERATO', 2, 5000, 1, '1', 2),
('V', '11079158', 'NAYIVEL', '', 'AMAYA', '', 'F', '00000000000', NULL, '1973-04-26', 'CASERÃ­O SABANETICA CALLE PRINCIPAL CASA S/N', 'AMA DE CASA', 'BACHILLERATO', 1, 0, 1, '1', 1),
('V', '11540170', 'RAFAEL ', 'RAMON', 'ADJUNTA', 'REYES', 'M', '04165368716', NULL, '1974-06-04', 'BARRIO SANTA  ELENA AV. 5 ENTRE CALLES 1 Y 2 CASA NRO 15.', 'OBRERO', 'PRIMARIA', 6, 5400, 1, '1', 1),
('V', '11542861', 'CARDINA', '', 'MEDINA', '', 'F', '04164514140', NULL, '1973-02-05', 'CASERÃ­O MIJAGUITO CALLE PRINCIPAL CASA # 55', 'AMA DE CASA', 'BACHILLERATO', 2, 0, 1, '1', 1),
('V', '11847486', 'MIRY ', '', 'ORTIZ', '', 'F', '04165368716', NULL, '1974-06-04', 'BARRIO "SANTA ELENA" AV. 5 ENTRE CALLES 1 Y 2. CASA NRO. 15 ', 'OFICIO DEL HOGAR', 'PRIMARIA', 5, 0, 1, '1', 1),
('V', '13353263', 'MARIA', 'EUGENIA', 'REYES', 'PEÃ±A', 'F', '04145146347', NULL, '1977-06-13', 'LA MIEL', 'GERENTE', 'LICENCIADO', 2, 20000, 1, '1', 2),
('V', '15493031', 'YASIREÃ© ', '', 'HERNÃ¡NDEZ', '', 'F', '04148876543', NULL, '1960-02-05', 'DIRECCION', 'AMA DE CASA', 'PRIMARIA', 3, 3000, 1, '1', 1),
('V', '16964940', 'CAROLINA', '', 'QUEVEDO', '', 'F', '04262405761', NULL, '1975-11-26', 'BARRIO LA DEMOCRACIA AV. 1 CALLEJÃ³N 1 CASA #32', 'AMA DE CASA', 'TECNICO MEDIO', 3, 5000, 1, '1', 1),
('V', '17364390', 'LEIDY', '', 'LOPEZ', '', 'F', '00000000000', NULL, '1986-12-07', 'URB DURIGUA 2 CALLE 4 CASA 1', 'AMA DE CASA', 'BACHILLERATO', 2, 0, 1, '1', 1),
('V', '18732314', 'MARIANGELA', '', 'QUEVEDO', '', 'F', '04268492413', NULL, '1987-07-30', 'RIO ACARIGUA CALLE 1 SECTOR EL SAMAN', 'ESTUDIANTE', 'BACHILLERATO', 1, 0, 1, '1', 7),
('V', '19170250', 'MARISOL', '', 'MONTES', '', 'F', '04167528081', NULL, '1989-02-08', 'BARRIO LA PAZ', 'OFICIO DEL HOGAR', 'BACHILLERATO', 2, 5600, 1, '1', 1),
('V', '20157379', 'JOSCARLY', '', 'RUIZ', '', 'M', '04160389433', NULL, '1992-07-07', 'URB SAN JOSE 2 LOTE A CASA 39', 'ESTUDIANTE', 'BACHILLERATO', 1, 0, 1, '1', 2),
('V', '21563851', 'YURAIMA', '', 'MEDINA', '', 'F', '00000000000', NULL, '1993-09-20', 'URB. SAN JOSÃ© II CALLE 15 TERRAZA # 05', 'ESTUDIANTE', 'BACHILLERATO', 1, 0, 1, '1', 2),
('V', '9837744', 'LEONOR', '', 'MENDOZA', '', 'F', '04266526658', NULL, '1974-07-17', 'URB. TRICENTENARIA F-8 CASA # 08', 'AMA DE CASA', 'BACHILLERATO', 2, 6000, 1, '1', 2),
('V', '99999999', 'MISMO', '', 'SE REPRESENTA ASI', '', 'M', '00000000000', NULL, '2000-01-01', 'NO APLICA', 'NO APLICA', 'PRIMARIA', 0, 0, 1, '1', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tgrupo`
--

CREATE TABLE IF NOT EXISTS `tgrupo` (
  `idgrupo` int(11) NOT NULL AUTO_INCREMENT,
  `nombregru` varchar(45) NOT NULL,
  `descripciongru` varchar(45) DEFAULT NULL,
  `estatusgru` int(11) NOT NULL DEFAULT '1',
  `edadmin` char(2) NOT NULL,
  `edadmax` char(2) NOT NULL,
  PRIMARY KEY (`idgrupo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `tgrupo`
--

INSERT INTO `tgrupo` (`idgrupo`, `nombregru`, `descripciongru`, `estatusgru`, `edadmin`, `edadmax`) VALUES
(1, 'INICIAL', ' NIÃ‘OS EN EDADES ENTRE CERO Y SEIS AÃ‘', 1, '0', '6'),
(2, 'JUVENIL', 'ESTE GRUPO ESTA COMPREDIDO POR NIÃ‘OS DE SIET', 1, '7', '15'),
(3, 'ADULTO', 'ESTA COMPRENDIDO POR PERSONAS DE QUINCE AÃ‘OS', 1, '15', '99');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tinscripcion`
--

CREATE TABLE IF NOT EXISTS `tinscripcion` (
  `idinscripcion` int(11) NOT NULL AUTO_INCREMENT,
  `idparticipante` int(11) NOT NULL,
  `gradoins` varchar(45) DEFAULT NULL,
  `seccionins` varchar(45) DEFAULT NULL,
  `fechains` date NOT NULL,
  `disponibilidadins` varchar(15) NOT NULL,
  `diasasistenciains` varchar(20) NOT NULL,
  `observacionins` varchar(150) DEFAULT NULL,
  `fotoins` varchar(45) NOT NULL,
  `partidanacimientoins` tinyint(4) NOT NULL,
  `copiacedulains` tinyint(4) NOT NULL,
  `informemedico` tinyint(4) NOT NULL,
  `estatusins` char(1) NOT NULL DEFAULT '1',
  `repitienteins` tinyint(4) NOT NULL,
  `tinstitucion_idinstitucion` int(11) DEFAULT NULL COMMENT 'institucion de la cual proviene',
  `motivocambioins` varchar(45) DEFAULT NULL,
  `resumendiagnosticoins` text,
  `estudia_actualmente` int(1) NOT NULL,
  `grado_instruccion` varchar(50) DEFAULT NULL,
  `turno` varchar(15) DEFAULT NULL,
  `docente_grado` varchar(100) DEFAULT NULL,
  `telefono_docente_grado` varchar(11) DEFAULT NULL,
  `docente_aula_integrada` varchar(100) DEFAULT NULL,
  `telefono_docente_aula_integrada` varchar(11) DEFAULT NULL,
  `director_institucion` varchar(100) DEFAULT NULL,
  `telefono_director_institucion` varchar(11) DEFAULT NULL,
  `tfamiliar_idresponsable` char(9) DEFAULT NULL,
  `ingresomensual` float(10,2) DEFAULT NULL,
  `otroingreso` float(10,2) DEFAULT NULL,
  `noingreso` varchar(255) DEFAULT NULL,
  `colaborarcaidv` text,
  `aprenderbraille` char(1) DEFAULT NULL,
  `tiempo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idinscripcion`),
  KEY `fk_tinscripcion_tparticipante1_idx` (`idparticipante`),
  KEY `fk_tinscripcion_tinstitucion1_idx` (`tinstitucion_idinstitucion`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Volcado de datos para la tabla `tinscripcion`
--

INSERT INTO `tinscripcion` (`idinscripcion`, `idparticipante`, `gradoins`, `seccionins`, `fechains`, `disponibilidadins`, `diasasistenciains`, `observacionins`, `fotoins`, `partidanacimientoins`, `copiacedulains`, `informemedico`, `estatusins`, `repitienteins`, `tinstitucion_idinstitucion`, `motivocambioins`, `resumendiagnosticoins`, `estudia_actualmente`, `grado_instruccion`, `turno`, `docente_grado`, `telefono_docente_grado`, `docente_aula_integrada`, `telefono_docente_aula_integrada`, `director_institucion`, `telefono_director_institucion`, `tfamiliar_idresponsable`, `ingresomensual`, `otroingreso`, `noingreso`, `colaborarcaidv`, `aprenderbraille`, `tiempo`) VALUES
(1, 1, '2 DO', 'A', '2015-03-24', 'MAÃ‘ANA', 'LU', '  BAJA VISION         ', '09837744.jpeg', 1, 1, 1, '1', 0, 10, '       ', ' ACROMATOPSIA CONGÃ©NITA.          ', 1, 'BACHILLER', 'MAÃ‘ANA', 'MARIA', '', 'ALBA QUINTANA', '', '', '', '9837744', 6000.00, 0.00, '', 'limpieza', '1', 'las maÃ±anas'),
(2, 2, '1 ERO', 'A', '2015-03-24', 'TARDE', 'LU,MA,MI,JU,VI', ' NINGUNA ', '', 0, 0, 1, '1', 0, 5, ' REFORZAR APRENDIZAJE ', ' MICROFTALMUS OD. DIGÃ©NESIS DEL SEGMENTO ANTERIOR. ', 1, 'PRIMARIA', 'MAÃ‘ANA', 'CRISTOBLA', '04245554321', 'JAVIER', '04147875436', '', '', '11078708', 5000.00, 0.00, '', 'limpieza', '1', 'las maÃ±anas'),
(3, 3, '1RO', 'B', '2015-03-24', 'MAÃ‘ANA', 'LU,MI', ' VDSFDSGFGFGS    ', '15493031.jpeg', 1, 1, 1, '1', 1, 6, ' DSD    ', ' MIOPÃ­A MAGNA EN AMBOS OJOS ASOCIADA.    ', 1, 'PRIMARIA', 'TARDE', 'ASDSD', '34232323', 'ASDSAD', '213342434', '', '', '15493031', 0.00, 0.00, 'Beca Madres del Barrio', 'Cocinar', '1', 'manana'),
(4, 4, '5 TO', 'B', '2015-03-24', 'TARDE', 'LU,MA,MI,JU,VI', ' CIEGO TOTALMENTE   ', '', 1, 0, 1, '1', 0, 4, ' MEJOR ADAPTACION   ', ' MICROFTALMUS BILATERAL CONGENITO   ', 1, 'PRIMARIA', 'MAÃ‘ANA', 'NO ', '00000000000', 'NO', '00000000000', '', '', '16964940', 0.00, 0.00, 'el esposo cubre los gastos', 'limpieza', '0', ''),
(5, 5, '1', 'A', '2015-03-24', 'MAÃ‘ANA', 'LU,MA,MI,JU,VI', 'APÃ¡TICO A LOS GRUPOS    ', '19170250.jpeg', 1, 1, 1, '1', 0, 1, ' NINGUNO    ', ' RETINOPATÃ­A DE LA PREMATURIDAD    ', 1, 'PRIMARIA', 'TARDE', 'YULIMAR CONDE', '02556659490', 'GENESIS PARADA', '02556645789', '', '', '19170250', 5600.00, 0.00, 'trabaja de oficios de hogares', 'cocinar y limpiar', '0', ''),
(6, 6, '6TO', 'B', '2015-03-26', 'MAÃ‘ANA', 'MI', ' ASISTE SEMANLMENTE AL CAIDV    ', '11847486.jpeg', 1, 1, 1, '1', 0, 9, '     ', ' MICROFTALMO EN AMBOS OJOS    ', 1, 'PRIMARIA', 'TARDE', 'ALBA QUINTANA', '04127743137', '', '', '', '', '11847486', 0.00, 0.00, 'no', 'no', '0', ''),
(7, 7, '', '', '2015-05-01', 'MAÃ‘ANA', 'LU,MA,MI,JU,VI', ' NO APLICA', '', 1, 0, 1, '1', 0, 0, ' ', ' CATARATA CONGÃ©NITA', 0, 'NINGUNO', '', '', '', '', '', '', '', '', 0.00, 0.00, 'no', 'no', '0', ''),
(8, 8, 'PRIMER  NIVEL', '', '2015-05-01', 'MAÃ‘ANA', 'LU,MA,MI,JU,VI', ' ', '', 1, 0, 1, '1', 0, 14, ' ', ' LEUCOMA CORNEAL Y GLAUCOMA BILATERAL CONGÃ©N', 1, 'PRE-ESCOLAR', 'MAÃ‘ANA', 'IVON CAMACHO', '', '', '', '', '', '', 0.00, 0.00, '', 'ELEBORACION DE MANUELIDADES', '1', 'TODOS LOS DIAS'),
(9, 9, '1 ER NIVEL', '', '2015-05-01', 'MAÃ‘ANA', 'LU,MA,MI,JU,VI', ' ', '', 1, 0, 1, '1', 0, 15, ' ', ' MICROFTALMUS', 1, 'PRE-ESCOLAR', 'MAÃ‘ANA', '', '', '', '', '', '', '', 0.00, 0.00, '', '', '0', ''),
(10, 10, '4TO', 'B', '2015-05-01', 'MAÃ‘ANA', 'LU,MA', '   ', '', 1, 1, 1, '1', 0, 10, '   ', '  CATARATA CONGÃ©NITA.\r\n ', 1, 'PRIMARIA', 'TARDE', '', '', '', '', '', '', '99999999', 0.00, 0.00, '', '', '1', ''),
(11, 11, '3 ER NIVEL', '', '2015-05-01', 'MAÃ‘ANA', 'LU,MA,MI,JU,VI', ' ', '', 1, 0, 1, '1', 0, 14, ' ', 'NIGTASMUS HORIZONTAL PENDULAR, MIOPÃ­A, ESTRABISMO ', 1, 'PRE-ESCOLAR', 'MAÃ‘ANA', '', '', '', '', '', '', '', 0.00, 0.00, '', '', '0', ''),
(12, 12, '', '', '2015-05-01', 'MAÃ‘ANA', 'LU,MA,MI,JU,VI', '  ', '', 1, 1, 1, '1', 0, 0, '  ', ' ATROFIA Ã³PTICA BILATERAL\r\n ', 0, 'NINGUNO', '', '', '', '', '', '', '', '99999999', 0.00, 0.00, '', '', '1', ''),
(13, 13, '', '', '2015-05-01', 'MAÃ‘ANA', 'LU,MA,MI,JU,VI', ' ', '', 1, 1, 1, '1', 0, 7, ' ', ' RETINOSIS PIGMENTARIA\r\n', 1, 'NINGUNO', 'MAÃ‘ANA', '', '', '', '', '', '', '', 0.00, 0.00, '', '', '1', ''),
(14, 14, '2 DO GRADO', '', '2015-05-01', 'MAÃ‘ANA', 'LU,MA,MI,JU,VI', ' ', '', 1, 0, 1, '1', 0, 12, ' ', ' RETINOPATÃ­A DE LA PREMATURIDAD', 1, 'PRIMARIA', 'MAÃ‘ANA', '', '', 'IVON CAMACHO', '', '', '', '', 0.00, 0.00, '', '', '0', ''),
(15, 15, '', '', '2015-05-01', 'MAÃ‘ANA', 'LU,MA,MI,JU,VI', ' ', '', 1, 1, 1, '1', 0, 7, ' ', ' RETINOSIS PIGMENTARIA\r\n', 1, 'NINGUNO', 'MAÃ‘ANA', '', '', '', '', '', '', '', 0.00, 0.00, '', '', '1', ''),
(16, 16, '4 TO GRADO', '', '2015-05-01', 'MAÃ‘ANA', 'LU,MA,MI,JU,VI', ' ', '', 1, 0, 1, '1', 0, 12, ' ', ' AMAUROSIS CONGÃ©NITA LEBER', 1, 'PRIMARIA', 'MAÃ‘ANA', '', '', 'IVON CAMACHO', '', '', '', '', 0.00, 0.00, '', '', '0', ''),
(17, 17, '', '', '2015-05-01', 'MAÃ‘ANA', 'LU,MA,MI,JU,VI', ' ', '', 1, 1, 1, '1', 0, 7, ' ', ' CIEGO\r\n', 1, 'NINGUNO', 'MAÃ‘ANA', '', '', '', '', '', '', '', 0.00, 0.00, '', '', '1', ''),
(18, 18, '', '', '2015-05-01', 'MAÃ‘ANA', 'LU,MA,MI,JU,VI', ' ', '', 1, 1, 1, '1', 0, 7, ' ', ' LEUCOMA Y GLAUCOMA EN AMBOS OJOS\r\n\r\n', 1, 'NINGUNO', 'MAÃ‘ANA', '', '', '', '', '', '', '', 0.00, 0.00, '', '', '1', ''),
(19, 19, '', '', '2015-05-01', 'MAÃ‘ANA', 'LU,MA,MI,JU,VI', ' ', '', 1, 1, 1, '1', 0, 7, ' ', ' RETINOBLASTOMA BILATERAL\r\n', 1, 'NINGUNO', 'MAÃ‘ANA', '', '', '', '', '', '', '', 0.00, 0.00, '', '', '1', ''),
(20, 20, '', '', '2015-05-01', 'MAÃ‘ANA', 'LU,MA,MI,JU,VI', ' ', '', 1, 1, 1, '1', 0, 7, ' ', ' ANIRIDIA CONGÃ©NITA.\r\n', 1, 'NINGUNO', 'MAÃ‘ANA', '', '', '', '', '', '', '', 0.00, 0.00, '', '', '1', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tinstitucion`
--

CREATE TABLE IF NOT EXISTS `tinstitucion` (
  `idinstitucion` int(11) NOT NULL AUTO_INCREMENT,
  `descripcioninst` varchar(40) NOT NULL,
  `direccioninst` varchar(60) NOT NULL,
  `directorinst` varchar(60) NOT NULL,
  `estatusinst` tinyint(1) NOT NULL DEFAULT '1',
  `tlocalidad_idlocalidad` int(11) NOT NULL,
  PRIMARY KEY (`idinstitucion`),
  KEY `fk_tinstitucion_tlocalidad1_idx` (`tlocalidad_idlocalidad`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Volcado de datos para la tabla `tinstitucion`
--

INSERT INTO `tinstitucion` (`idinstitucion`, `descripcioninst`, `direccioninst`, `directorinst`, `estatusinst`, `tlocalidad_idlocalidad`) VALUES
(1, 'LICEO BOLIVARIANO JOSE ANTONIO PAEZ', 'AV. LIBERTADOR Y AV. 32 FRENTE A LA PLAZA ANDRES ELOY BLANCO', 'LICENCIADA MARITZA GUTIERREZ', 1, 1),
(2, 'ETIR SIMON BOLIVAR', 'AV. JOSE ANTONIO PAEZ FRENTE AL PARQUE MUSIU CARMELO ', 'LICENCIADA CARMINA LOMBANO', 1, 1),
(3, 'LICEO BOLIVARIANO CINCO DE DICIEMBRE', 'CALLE 31 VIA CEMENTERIO VIEJO AL LADO DEL EDIFICIO DE MALARI', 'LICENCIADO CARLOS HERNANDEZ', 1, 1),
(4, 'UNIDAD EDUCATIVA FE Y ALEGRIA NTRA SRA D', 'CALLE 28 CON AV 53 SECTOR BELLA VISTA 2', 'LICENCIADO EVELIN ZAPATA', 1, 1),
(5, ' UEN VEINTICUATRO DE JULIO', 'URB. 24 DE JULIO', 'MARIAN TAMAYO', 1, 2),
(6, 'ESCUELA BASICA PAYARA', 'PAYARA', 'FULANO', 1, 3),
(7, 'CAIDV', 'CALLE LUIS BRAILLE SECTOR LOS CORTIJOS DETRAS DE BELLAS ARTE', 'LIC IRMA SANCHEZ', 1, 1),
(8, 'E B MANUELITA SAENS', 'ARAURE', 'LIC ', 1, 2),
(9, 'COLEGIO FE Y ALEGRIA', 'SECTOR FE Y ALEGRIA', 'LIC', 1, 1),
(10, 'E P JESUS HORIZONTE Y CAMINO', 'ACARIGUA', 'LIC', 1, 1),
(11, 'U E E ALBERTO LEVYS MORA', 'BARRIO ANDRES ELOY BLANCO', 'LIC ', 1, 1),
(12, 'U E N SABANETICA', 'SABANETICA', 'LIC', 1, 1),
(13, 'U E N B YOLANDA DE PERUZZINE', 'URB BARAURE CENTRO ', 'LIC', 1, 2),
(14, 'C E I ARAURE', 'ARAURE', 'LIC', 1, 2),
(15, 'C E I LISANDRO AVARADO', 'ACARIGUA', 'LIC', 1, 1),
(16, 'C E I SAMUEL ROBINSON', 'ACARIGUA', 'LIC', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tinstrumento`
--

CREATE TABLE IF NOT EXISTS `tinstrumento` (
  `idinstrumento` int(11) NOT NULL AUTO_INCREMENT,
  `nombreins` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `tasignatura_idasignatura` int(11) NOT NULL,
  `estatusins` char(1) COLLATE utf8_spanish2_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`idinstrumento`),
  KEY `fk_tinstrumento_tasignatura_1` (`tasignatura_idasignatura`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `tinstrumento`
--

INSERT INTO `tinstrumento` (`idinstrumento`, `nombreins`, `tasignatura_idasignatura`, `estatusins`) VALUES
(1, 'EVALUACIÃ“N DE LOS APRENDIZAJES', 1, '1'),
(2, 'EVALUACIÃ“N DE LOS APRENDIZAJES', 2, '1'),
(3, 'EVALUACIÃ“N DE LOS APRENDIZAJES', 3, '1'),
(4, 'ASPECTO FISIOLÃ“GICO', 2, '1'),
(5, 'ASPECTO COGNITIVO', 2, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tinstrumento_item`
--

CREATE TABLE IF NOT EXISTS `tinstrumento_item` (
  `tinstrumento_idinstrumento` int(11) NOT NULL,
  `titem_iditem` int(11) NOT NULL,
  `espacio` varchar(10) COLLATE utf8_spanish2_ci DEFAULT NULL,
  KEY `fk_tinstrumento_item_titem_1` (`titem_iditem`),
  KEY `fk_tinstrumento_item_tinstrumento_1` (`tinstrumento_idinstrumento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tinstrumento_item`
--

INSERT INTO `tinstrumento_item` (`tinstrumento_idinstrumento`, `titem_iditem`, `espacio`) VALUES
(1, 1, 'completo'),
(1, 2, 'completo'),
(2, 1, 'completo'),
(2, 2, 'completo'),
(3, 1, 'completo'),
(3, 2, 'completo'),
(4, 3, 'mitad'),
(4, 4, 'mitad'),
(4, 5, 'mitad'),
(4, 6, 'mitad'),
(4, 9, 'mitad'),
(4, 10, 'mitad'),
(4, 11, 'mitad'),
(4, 12, 'mitad'),
(5, 13, 'mitad'),
(5, 14, 'mitad'),
(5, 29, 'mitad'),
(5, 15, 'mitad'),
(5, 16, 'mitad'),
(5, 17, 'mitad'),
(5, 18, 'mitad'),
(5, 19, 'mitad'),
(5, 20, 'mitad'),
(5, 21, 'mitad'),
(5, 22, 'mitad'),
(5, 23, 'mitad'),
(5, 24, 'mitad'),
(5, 25, 'mitad'),
(5, 26, 'mitad'),
(5, 27, 'mitad'),
(5, 28, 'mitad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `titem`
--

CREATE TABLE IF NOT EXISTS `titem` (
  `iditem` int(11) NOT NULL AUTO_INCREMENT,
  `nombreite` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcionite` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `tipoite` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `estatusite` char(1) COLLATE utf8_spanish2_ci DEFAULT '1',
  PRIMARY KEY (`iditem`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=31 ;

--
-- Volcado de datos para la tabla `titem`
--

INSERT INTO `titem` (`iditem`, `nombreite`, `descripcionite`, `tipoite`, `estatusite`) VALUES
(1, 'DESCRIPCION DE LOGROS', 'DESCRIPCION DEL APRENDIZAJE', 'textarea', '1'),
(2, 'OBSERVACIONES', 'OBSERVACIONES DEL DOCENTE', 'textarea', '1'),
(3, 'SEXO', 'SEXO DEL PARTICIPANTE', 'select', '1'),
(4, 'EDAD', 'EDAD DEL PARTICIPANTE', 'text', '1'),
(5, 'PESO', 'PESO DEL PARTICIPANTE', 'text', '1'),
(6, 'TALLA CAMISA', 'TALLAS DEL PARTICIPANTE ', 'text', '1'),
(7, 'TALLA PANTALON', 'TALLA DEL PANTEALON', 'text', '1'),
(8, 'TALLA ZAPATOS', 'TALLA DEL CALZADO', 'text', '1'),
(9, 'ESTATURA', 'ESTATURA DEL PARTICIPANTE', 'text', '1'),
(10, 'DESCAPACIDAD', 'TIPO DE DISCAPACIDADES DEL PARTICIPANTE', 'checkbox', '1'),
(11, 'VACUNAS ', 'VACUNAS APLICADAS AL PARTICIPANTE', 'textarea', '1'),
(12, 'CONTROLA ESFÃ­NTERES', 'SI EL PARTICIPANTE CONTROLA ESFÃ­NTERES\r\n', 'select', '1'),
(13, 'ESTILO DE APRENDIZAJE VISUAL', 'ESTILO DE APRENDIZAJE DEL PARTICIPANTE', 'select', '1'),
(14, 'ESTILO DE APRENDIZAJE AUDITIVO', 'ESTILO DE APRENDIZAJE DEL PARTICIPANTE', 'select', '1'),
(15, 'PRONUNCIA CORRECTAMENTE', 'DESARROLLO DEL LENGUAJE DEL PARETICIPANTE', 'select', '1'),
(16, 'CONVERSA CON COHERENCIA', 'DESARROLLO DEL LENGUAJE DEL PARTICIPANTE', 'select', '1'),
(17, 'ATIENDE A LAS ACTIVIDADES', 'ATENCIÃ³N Y CONCENTRACIÃ³N', 'select', '1'),
(18, 'SE CONCENTRA POR 15 MINUTOS', 'ATENCIÃ³N Y CONCENTRACIÃ³N', 'select', '1'),
(19, 'SU ATENCIÃ³N ES DISPERSA', 'ATENCIÃ³N Y CONCENTRACIÃ³N', 'select', '1'),
(20, 'COMPRENDE Y RAZONA', 'ATENCIÃ³N Y CONCENTRACIÃ³N', 'select', '1'),
(21, 'REPITE SECUENCIA DE PALABRAS', 'ATENCION Y CONCENTRACION', 'select', '1'),
(22, 'RESPONDE A PREGUNTAS SIMPLES', 'ATENCION Y CONCENTRACION', 'select', '1'),
(23, 'REACCIONA ANTE SABORES', 'SENSOPERCEPCION', 'select', '1'),
(24, 'REACCIONA ANTE OLORES', 'SENSOPERCEPCION', 'select', '1'),
(25, 'REACCIONA AL LLAMADO DE SU NOMBRE', 'SENSOPERCEPCION', 'select', '1'),
(26, 'REACCIÃ³N ANTE ESTÃ­MULOS SONOROS', 'SENSOPERCEPCION', 'select', '1'),
(27, 'SU RITMO AL HABLAR ES LENTO', 'OTROS', 'select', '1'),
(28, 'SU VOCABULARIO ESTÃ¡ RELACIONADO CON SU AMBIENTE', 'OTROS', 'select', '1'),
(29, 'ESTILO DE APRENDIZAJE TACTIL', 'ESTILO DEL APRENDIZAJE', 'select', '1'),
(30, 'ES EXPRESIVO (A)', 'DESARROLLO DEL LENGUAJE', 'select', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tlapso`
--

CREATE TABLE IF NOT EXISTS `tlapso` (
  `idlapso` int(11) NOT NULL AUTO_INCREMENT,
  `nombrelap` varchar(45) NOT NULL,
  `fechainilap` date DEFAULT NULL,
  `fechafinlap` date DEFAULT NULL,
  `estadolap` varchar(45) NOT NULL,
  `estatuslap` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idlapso`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `tlapso`
--

INSERT INTO `tlapso` (`idlapso`, `nombrelap`, `fechainilap`, `fechafinlap`, `estadolap`, `estatuslap`) VALUES
(2, 'LAPSO 2014-2015', '2014-09-15', '2015-06-11', 'APERTURADO', '1'),
(3, 'LAPSO 2015-2016', '2015-09-14', '2016-06-09', 'PROGRAMADO', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tlocalidad`
--

CREATE TABLE IF NOT EXISTS `tlocalidad` (
  `idlocalidad` int(11) NOT NULL AUTO_INCREMENT,
  `descripcionloc` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estatusloc` tinyint(1) NOT NULL DEFAULT '1',
  `tmunicipio_municipio` int(11) NOT NULL,
  PRIMARY KEY (`idlocalidad`),
  KEY `fk_tlocalidad_tmunicipio1_idx` (`tmunicipio_municipio`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- Volcado de datos para la tabla `tlocalidad`
--

INSERT INTO `tlocalidad` (`idlocalidad`, `descripcionloc`, `estatusloc`, `tmunicipio_municipio`) VALUES
(1, 'ACARIGUA', 1, 1),
(2, 'ARAURE', 1, 2),
(3, 'PAYARA', 1, 1),
(4, 'PINPINELA', 1, 1),
(5, 'RAMON PERAZA', 1, 1),
(6, 'AGUA BLANCA', 1, 3),
(7, 'RIO ACARIGUA', 1, 2),
(8, 'PIRITU', 1, 4),
(9, 'UVERAL', 1, 4),
(10, 'GUANARE', 1, 5),
(11, 'CORDOBA', 1, 5),
(12, 'GUANARITO', 1, 6),
(13, 'TRINIDAD DE LA CAPILLA', 1, 6),
(14, 'DIVINA PASTORA', 1, 6),
(15, 'PENA BLANCA', 1, 14),
(16, 'APARICION', 1, 7),
(17, 'LA ESTACION', 1, 7),
(18, 'OSPINO', 1, 7),
(19, 'CANO DELGADITO', 1, 8),
(20, 'PAPELON', 1, 8),
(21, 'ANTOLÃ­N TOVAR ANQUINO', 1, 9),
(22, 'BOCONOITO', 1, 9),
(23, 'SANTA FE', 1, 10),
(24, 'SAN RAFAEL DE ONOTO', 1, 10),
(25, 'THERMO MORALES', 1, 10),
(26, 'FLORIDA', 1, 11),
(27, ' EL PLAYON', 1, 11),
(28, 'BISCUCUY', 1, 12),
(29, 'CONCEPCIÃ³N', 1, 12),
(30, 'SAN JOSE DE SAGUAZ', 1, 12),
(31, 'SAN RAFAEL DE PALO ALZADO', 1, 12),
(32, 'UVENCIO ANTONIO VELÃ¡SQUEZ', 1, 12),
(33, 'VILLA ROSA', 1, 12),
(34, 'VILLA BRUZUAL', 1, 13),
(35, 'CANELONES', 1, 13),
(36, 'SANTA CRUZ', 1, 13),
(37, 'SAN ISIDRO LABRADOR', 1, 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tmodulo`
--

CREATE TABLE IF NOT EXISTS `tmodulo` (
  `idmodulo` int(11) NOT NULL AUTO_INCREMENT,
  `nombremod` varchar(30) NOT NULL,
  `estatusmod` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idmodulo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `tmodulo`
--

INSERT INTO `tmodulo` (`idmodulo`, `nombremod`, `estatusmod`) VALUES
(1, 'AdministraciÃ³n', 1),
(2, 'ConfiguraciÃ³n', 1),
(3, 'Curso', 1),
(4, 'Persona', 1),
(5, 'Seguridad', 1),
(6, 'Reporte', 1),
(7, 'Ayuda', 1),
(8, 'InscripciÃ³n', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tmodulo_trol`
--

CREATE TABLE IF NOT EXISTS `tmodulo_trol` (
  `idmodulo` int(11) NOT NULL,
  `idrol` int(11) NOT NULL,
  `orden` int(11) NOT NULL,
  PRIMARY KEY (`idmodulo`,`idrol`),
  KEY `fk_tmodulo_has_trol_trol1_idx` (`idrol`),
  KEY `fk_tmodulo_has_trol_tmodulo1_idx` (`idmodulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tmodulo_trol`
--

INSERT INTO `tmodulo_trol` (`idmodulo`, `idrol`, `orden`) VALUES
(1, 1, 1),
(1, 2, 1),
(1, 3, 1),
(1, 4, 1),
(2, 1, 2),
(2, 2, 2),
(2, 3, 2),
(2, 4, 2),
(3, 1, 4),
(3, 2, 3),
(3, 3, 3),
(3, 4, 3),
(4, 1, 3),
(4, 2, 5),
(4, 3, 5),
(4, 4, 5),
(5, 1, 6),
(5, 2, 6),
(5, 3, 6),
(5, 4, 6),
(6, 1, 7),
(6, 2, 7),
(6, 3, 7),
(6, 4, 7),
(7, 1, 8),
(7, 2, 8),
(7, 3, 8),
(7, 4, 8),
(8, 1, 5),
(8, 2, 4),
(8, 3, 4),
(8, 4, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tmunicipio`
--

CREATE TABLE IF NOT EXISTS `tmunicipio` (
  `idmunicipio` int(11) NOT NULL AUTO_INCREMENT,
  `descripcionmun` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estatusmun` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idmunicipio`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `tmunicipio`
--

INSERT INTO `tmunicipio` (`idmunicipio`, `descripcionmun`, `estatusmun`) VALUES
(1, 'PAEZ', 1),
(2, 'ARAURE', 1),
(3, 'AGUA BLANCA', 1),
(4, 'ESTELLER', 1),
(5, 'GUANARE', 1),
(6, 'GUANARITO', 1),
(7, 'OSPINO', 1),
(8, 'PAPELON', 1),
(9, 'SAN GENARO DE BOCONOITO', 1),
(10, 'SAN RAFAEL DE ONOTO', 1),
(11, 'SANTA ROSALIA', 1),
(12, 'SUCRE', 1),
(13, 'TUREN', 1),
(14, 'MONSEÃ‘OR JOSE VICENTE DE UNDA', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tnoticia`
--

CREATE TABLE IF NOT EXISTS `tnoticia` (
  `idnoticia` int(11) NOT NULL AUTO_INCREMENT,
  `titulonot` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `textonot` text CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `imagennot` varchar(45) NOT NULL,
  `fechanot` date NOT NULL,
  `estatusnot` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idnoticia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tobjetivo`
--

CREATE TABLE IF NOT EXISTS `tobjetivo` (
  `idobjetivo` int(11) NOT NULL AUTO_INCREMENT,
  `nombreobj` varchar(500) COLLATE utf8_spanish2_ci NOT NULL,
  `contenidoobj` text COLLATE utf8_spanish2_ci NOT NULL,
  `estatusobj` char(1) COLLATE utf8_spanish2_ci NOT NULL DEFAULT '1',
  `tunidad_idunidad` int(11) NOT NULL,
  PRIMARY KEY (`idobjetivo`),
  KEY `fk_tobjetivo_tunidad_1` (`tunidad_idunidad`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `tobjetivo`
--

INSERT INTO `tobjetivo` (`idobjetivo`, `nombreobj`, `contenidoobj`, `estatusobj`, `tunidad_idunidad`) VALUES
(1, 'Conceptos bÃ¡sicos', 'Conceptos bÃ¡sicos', '1', 1),
(9, 'FUNDAMENTOS Y ANTECEDENTES', 'DEFINICION, EVOLUCION, CLASIFICACION USO, IMPORTANCIA Y FUNCIONAMIENTO BASICO.\r\n                                                                    \r\n                                                                    ', '1', 5),
(10, 'PERIFERICOS DEENTRADA,SALIDA Y MIXTOS', 'CONCEPTOS, UTILIDAD, TIPOS Y CLASIFICACION. \r\n                                                                    \r\n                                                                    ', '1', 5),
(11, 'INTRODUCCION A LA  REDES', 'DEFINICION, FUNCIONAIENTO, COMPONENTE BASICOS, ASPECTOS GENERALES Y ANTECENDENTE DE INTERNET.\r\n                                                                    \r\n                                                                    ', '1', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tparentesco`
--

CREATE TABLE IF NOT EXISTS `tparentesco` (
  `idparentesco` int(11) NOT NULL AUTO_INCREMENT,
  `descripcionpar` varchar(45) NOT NULL,
  `estatuspar` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idparentesco`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `tparentesco`
--

INSERT INTO `tparentesco` (`idparentesco`, `descripcionpar`, `estatuspar`) VALUES
(1, 'PADRE', '1'),
(2, 'MADRE', '1'),
(3, 'TIO', '1'),
(4, 'HERMANO', '1'),
(5, 'PRIMO', '1'),
(6, 'SOBRINO', '1'),
(7, 'ABUELO', '1'),
(8, 'ABUELA', '1'),
(9, 'TIA', '1'),
(10, 'NO APLICA', '1'),
(11, 'PRIMA', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tparticipante`
--

CREATE TABLE IF NOT EXISTS `tparticipante` (
  `idparticipante` int(11) NOT NULL AUTO_INCREMENT,
  `nacionalidadpar` char(1) DEFAULT 'V',
  `cedulapar` char(9) DEFAULT NULL,
  `nombreunopar` varchar(45) NOT NULL,
  `nombredospar` varchar(45) DEFAULT NULL,
  `apellidounopar` varchar(45) NOT NULL,
  `apellidodospar` varchar(45) DEFAULT NULL,
  `sexopar` char(1) NOT NULL,
  `telefonopar` varchar(12) NOT NULL,
  `correopar` varchar(55) DEFAULT NULL,
  `direccionpar` varchar(200) NOT NULL,
  `fechanacimientopar` date NOT NULL,
  `numhijopar` tinyint(1) DEFAULT NULL,
  `medioviviendapar` varchar(10) NOT NULL,
  `viviendapar` varchar(20) DEFAULT NULL,
  `tipoconstruccionpar` varchar(30) DEFAULT NULL,
  `braillepar` char(1) DEFAULT NULL,
  `etniapar` varchar(2) DEFAULT 'No',
  `tdiagnostico_iddiagnostico` int(11) NOT NULL,
  `tlocalidad_idlocalidad` int(11) NOT NULL,
  `tinstitucion_idinstitucion` int(11) DEFAULT NULL,
  `estatuspar` char(1) NOT NULL DEFAULT '1',
  `numerohermanospar` int(4) DEFAULT NULL,
  `tlocalidad_idlugarnacimiento` int(11) DEFAULT NULL,
  PRIMARY KEY (`idparticipante`),
  KEY `fk_tparticipante_tdiagnostico1_idx` (`tdiagnostico_iddiagnostico`),
  KEY `fk_tparticipante_tinstitucion1_idx` (`tinstitucion_idinstitucion`),
  KEY `tlocalidad_idlocalidad` (`tlocalidad_idlocalidad`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Volcado de datos para la tabla `tparticipante`
--

INSERT INTO `tparticipante` (`idparticipante`, `nacionalidadpar`, `cedulapar`, `nombreunopar`, `nombredospar`, `apellidounopar`, `apellidodospar`, `sexopar`, `telefonopar`, `correopar`, `direccionpar`, `fechanacimientopar`, `numhijopar`, `medioviviendapar`, `viviendapar`, `tipoconstruccionpar`, `braillepar`, `etniapar`, `tdiagnostico_iddiagnostico`, `tlocalidad_idlocalidad`, `tinstitucion_idinstitucion`, `estatuspar`, `numerohermanospar`, `tlocalidad_idlugarnacimiento`) VALUES
(1, 'V', '09837744', 'LEONEL', 'ANDRES', 'GONZALEZ', '', 'M', '04266526658', 'leonel@gmail.com', 'URB. TRICENTENARIA F-8 CASA # 08', '2006-11-02', 2, 'RURAL', 'PROPIA', 'BLOQUES Y ZINC', '0', '0', 2, 2, 10, '1', 2, 2),
(2, 'V', '11078708', 'JAIMAR', 'JOSE', 'CASTILLO', 'SANCHEZ', 'F', '04245469080', 'janmar@gmail.com', 'URB. PRADOS DEL SOL SECTOR VENEZUELA E/T 2 Y 3 CALLE 8 CASA # 23', '2008-10-01', 1, 'URBANO', 'PROPIA', 'INAVI', '0', '0', 3, 1, 5, '1', 1, 1),
(3, 'V', '15493031', 'OSMAR ', '', 'HERNANDEZ', '', 'M', '04145568346', 'coreo@dfr.com', 'PAYARA CENTRO CALLE 11 C/AV 2 # 11', '2008-05-29', 3, 'URBANO', 'PROPIA', 'INAVI', '0', '0', 3, 1, 6, '1', 2, 1),
(4, 'V', '16964940', 'JESUS', 'DANIEL', 'NIEVES', 'Q', 'M', '04262405761', 'jesusdnieves@hotmail.com', 'BARRIO LA DEMOCRACIA AV. 1 CALLEJÃ³N 1 CASA #32', '2004-05-12', 2, 'URBANO', 'PROPIA', 'BLOQUES Y ZINC', '1', '0', 3, 1, 4, '1', 3, 1),
(5, 'V', '19170250', 'RONNY', '', 'RODRIGUEZ', '', 'M', '04167528081', 'ronny@hotmail.com', 'BARRIO LA PAZ ', '2006-12-09', 1, 'RURAL', 'INVADIDA', 'BLOQUES Y ZINC', '0', '0', 2, 1, 1, '1', 1, 1),
(6, 'V', '11847486', 'NAYILETH', 'MARIANELA', 'ADJUNTA', 'ORTIZ', 'F', '04165368716', '', 'BARRIO "SANTA ELENA", AV. 5 ENTRE CALLES 1 Y 2 CASA NRO. 15 ', '2002-12-01', 4, 'URBANO', 'PROPIA', 'BLOQUES Y ZINC', '0', '0', 3, 1, 9, '1', 1, 1),
(7, 'V', '11542861', 'HEIBER', '', 'PARADA', '', 'M', '04164514140', 'heiber@hotmail.com', 'CASERÃ­O MIJAGUITO CALLE PRINCIPAL CASA # 55', '1999-11-11', 1, 'RURAL', 'PROPIA', 'BLOQUES Y ZINC', '0', '0', 2, 1, 0, '1', 1, 1),
(8, 'V', '20157379', 'FRANCISBETH', '', 'COLMENAREZ', '', 'F', '04160389433', '', 'URB. SAN JOSE 2 LOTE A CASA 39', '2010-12-13', 1, 'URBANO', 'PROPIA', 'INAVI', '0', '0', 2, 2, 0, '1', 1, 2),
(9, 'V', '18732314', 'FEDERICA', '', 'QUEVEDO', '', 'F', '04268492413', '', 'RIO ACARIGUA CALLE 1 SECTOR EL SAMAN', '2010-06-01', 1, 'RURAL', 'PROPIA', 'BLOQUES Y ZINC', '0', '0', 3, 7, 0, '1', 1, 2),
(10, 'V', '24587474', 'JEAN', 'CARLOS', 'QUIROZ', '', 'M', '00000000000', '', 'BARRIO BOLÃ­VAR SECTOR LA LAGUNITA CALLE 5 C/A 8\r\n', '1994-02-01', 2, 'URBANO', 'PROPIA', 'INAVI', '0', '0', 2, 1, 0, '1', 1, 1),
(11, 'V', '17364390', 'MICHELLY', '', 'DURAN', '', 'F', '00000000000', '', 'URB DURIGUA 2 CALLE 4 CASA 1', '2009-07-28', 2, 'URBANO', 'PROPIA', 'INAVI', '0', '0', 2, 1, 0, '1', 2, 2),
(12, 'V', '24567206', 'ERIKA', '', 'MARTINEZ', '', 'F', '05226224844', '', 'C.H. SIMÃ³N BOLÃ­VAR TORRE 11-B APART. # \r\n', '1989-08-27', 1, 'URBANO', 'PROPIA', 'INAVI', '0', '0', 2, 1, 0, '1', 1, 1),
(13, 'V', '18691718', 'YEARLESKY', '', 'GUERRERO', '', 'F', '02556155551', '', 'C.H. SIMÃ³N BOLÃ­VAR\r\n', '1989-09-27', 1, 'URBANO', 'PROPIA', 'INAVI', '0', '0', 2, 1, 0, '1', 1, 1),
(14, 'V', '11079158', 'GRECIA', '', 'PEROZA', '', 'F', '00000000000', '', 'CASERÃ­O SABANETICA CALLE PRINCIPAL CASA S/N', '2006-07-15', 1, 'RURAL', 'PROPIA', 'BLOQUES Y ZINC', '1', '0', 2, 1, 0, '1', 1, 2),
(15, 'V', '19377573', 'MARIA', 'DE LOS ANGELES', 'BASTIDAS', '', 'F', '04267407396', '', 'LOS MALABARES CALLE PRINCIPAL SECTOR LA CAÃ±ADA S/N \r\n', '1986-11-19', 1, 'RURAL', 'PROPIA', 'BLOQUES Y ZINC', '0', '0', 2, 2, 0, '1', 1, 2),
(16, 'V', '21563851', 'KEVIN', '', 'MARQUEZ', '', 'M', '00000000000', '', 'URB. SAN JOSÃ© II CALLE 15 TERRAZA # 05', '2004-05-25', 1, 'URBANO', 'PROPIA', 'INAVI', '1', '0', 2, 2, 0, '1', 1, 2),
(17, 'V', '15070543', 'ROMMY', '', 'CASTAÃ±EDA', '', 'M', '04145593057', '', 'URB. EL BOSQUE AV. PRINCIPAL #51 SECTOR VILLA ARAURE I\r\n', '1981-02-16', 1, 'URBANO', 'PROPIA', 'INAVI', '0', '0', 3, 2, 0, '1', 1, 2),
(18, 'V', '16041804', 'YUSLEIDDY', '', 'MÃ¡RQUEZ', '', 'F', '02556156996', '', 'AV. 5 DE DICIEMBRE C/A 29 C/C 23 EDIF. VERCHONI # 08 \r\n', '1979-06-16', 1, 'URBANO', 'PROPIA', 'INAVI', '0', '0', 4, 2, 0, '1', 1, 2),
(19, 'V', '12446689', 'MARIÃ¡NGEL', '', 'SÃ¡NCHEZ', '', 'F', '04167547627', '', 'URB. LA GOAJIRA CALLE F VDA 10  CASA # 01\r\n', '1971-12-15', 1, 'URBANO', 'PROPIA', 'INAVI', '0', '0', 4, 2, 0, '1', 1, 2),
(20, 'V', '11847413', 'MINERVA', '', 'GALLARDO', '', 'F', '04167547627', '', 'URB. TRICENTENARIA MANZANA L-2 CASA #12\r\n', '1971-09-25', 1, 'URBANO', 'PROPIA', 'INAVI', '0', '0', 2, 2, 0, '1', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tpersonal`
--

CREATE TABLE IF NOT EXISTS `tpersonal` (
  `nacionalidadper` char(1) COLLATE utf8_spanish2_ci DEFAULT 'V',
  `idpersonal` char(9) COLLATE utf8_spanish2_ci NOT NULL,
  `nombreunoper` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `nombredosper` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `apellidounoper` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `apellidodosper` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `sexoper` char(1) COLLATE utf8_spanish2_ci NOT NULL,
  `fechanacimientoper` date NOT NULL,
  `correoper` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `direccionper` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `telefonoper` varchar(12) COLLATE utf8_spanish2_ci NOT NULL,
  `cargoper` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `estatusper` char(1) COLLATE utf8_spanish2_ci NOT NULL DEFAULT '1',
  `tdiagnostico_iddiagnostico` int(11) NOT NULL,
  `tlocalidad_idlocalidad` int(11) NOT NULL,
  PRIMARY KEY (`idpersonal`),
  KEY `fk_tprofesor_tdiagnostico1_idx` (`tdiagnostico_iddiagnostico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tpersonal`
--

INSERT INTO `tpersonal` (`nacionalidadper`, `idpersonal`, `nombreunoper`, `nombredosper`, `apellidounoper`, `apellidodosper`, `sexoper`, `fechanacimientoper`, `correoper`, `direccionper`, `telefonoper`, `cargoper`, `estatusper`, `tdiagnostico_iddiagnostico`, `tlocalidad_idlocalidad`) VALUES
('V', '0', 'Administrador', 'Administrador', 'Administrador', 'Administrador', 'M', '2012-02-01', '', 'CAIDV 2014', '02556616161', 'WebMaster', '1', 1, 0),
('', '12526145', 'LEIBI', '', 'GONZALEZ', '', 'M', '1975-08-12', 'leibigon@gmail.com', 'VILLAS DEL PILAR', '04125278606', 'WEB MASTER', '1', 1, 2),
('V', '15491963', 'ANTONIO', 'ALBERTO', 'SPADARO', 'BONIFACIO', 'M', '1981-07-30', 'SPADARO.ANTO@GMAIL.COM', 'LLANO ALTO', '04145591333', 'WEB MASTER', '1', 1, 2),
('V', '17960877', 'EFREN ', '', 'DIAZ', 'MARTINEZ', 'M', '1988-05-05', 'EDM_126@HOTMAIL.COM', 'VILLA ARAURE 2', '04121516744', 'WEB MASTER', '1', 1, 2),
('V', '18672728', 'JORGE', '', 'APONTE', '', 'M', '1987-12-17', 'coreo@sdd.com', 'ARAURE', '04125351857', 'ASISTENTE', '1', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tpregunta`
--

CREATE TABLE IF NOT EXISTS `tpregunta` (
  `idpregunta` int(11) NOT NULL AUTO_INCREMENT,
  `pregunta` varchar(30) NOT NULL,
  `respuesta` varchar(30) NOT NULL,
  `tusuario_idusuario` varchar(20) NOT NULL,
  PRIMARY KEY (`idpregunta`),
  KEY `fk_tpregunta_tusuario1_idx` (`tusuario_idusuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `tpregunta`
--

INSERT INTO `tpregunta` (`idpregunta`, `pregunta`, `respuesta`, `tusuario_idusuario`) VALUES
(1, 'QUIEN ERES?', 'ANTONIOSPADARO', '15491963'),
(2, 'MASCOTA', 'PEPITO', '15491963'),
(3, 'PERRO?', 'TOBI', '12526145'),
(4, 'APELLIDO', 'TOVAR', '12526145'),
(5, 'LUGAR DE NACIMIENTO DE LA MADR', 'ACARIGUA', '17960877'),
(6, 'PROFESOR FAVORITO', 'AQUILES', '17960877');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trol`
--

CREATE TABLE IF NOT EXISTS `trol` (
  `idrol` int(11) NOT NULL AUTO_INCREMENT,
  `nombrerol` varchar(45) NOT NULL,
  `estatusrol` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `trol`
--

INSERT INTO `trol` (`idrol`, `nombrerol`, `estatusrol`) VALUES
(1, 'ADMINISTRADOR', 1),
(2, 'DIRECTOR(A)', 1),
(3, 'DOCENTE', 1),
(4, 'SECRETARIA', 1),
(5, 'SUB-DIRECTORA', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tservicio`
--

CREATE TABLE IF NOT EXISTS `tservicio` (
  `idservicio` int(11) NOT NULL AUTO_INCREMENT,
  `nombreser` varchar(50) NOT NULL,
  `enlaceser` varchar(50) NOT NULL,
  `visibleser` tinyint(4) NOT NULL DEFAULT '1',
  `estatusser` tinyint(4) NOT NULL DEFAULT '1',
  `idmodulo` int(11) NOT NULL,
  PRIMARY KEY (`idservicio`),
  KEY `fk_tservicio_tmodulo1_idx` (`idmodulo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=152 ;

--
-- Volcado de datos para la tabla `tservicio`
--

INSERT INTO `tservicio` (`idservicio`, `nombreser`, `enlaceser`, `visibleser`, `estatusser`, `idmodulo`) VALUES
(1, 'MÃ³dulo', 'seguridad/modulo', 1, 1, 1),
(2, 'Registrar modulo', 'seguridad/registrar_modulo', 0, 1, 1),
(4, 'Servicio', 'seguridad/servicio', 1, 1, 1),
(5, 'Registrar servicio', 'seguridad/registrar_servicio', 0, 1, 1),
(7, 'Rol', 'seguridad/rol', 1, 1, 1),
(8, 'Registrar rol', 'seguridad/registrar_rol', 0, 1, 1),
(10, 'Asignacion de modulos/servicios', 'seguridad/asignacion', 1, 1, 1),
(11, 'Asignar mÃ³dulo', 'seguridad/asignar_modulo', 1, 1, 1),
(12, 'Asignar servicio', 'seguridad/asignar_servicio', 1, 1, 1),
(13, 'Consultar mÃ³dulo', 'seguridad/consultar_modulo', 0, 1, 1),
(14, 'Consultar servicio', 'seguridad/consultar_servicio', 0, 1, 1),
(15, 'Consultar rol', 'seguridad/consultar_rol', 0, 1, 1),
(17, 'Auditoria de sistema', 'seguridad/bitacora', 1, 1, 1),
(18, 'Consultar bitacora', 'seguridad/consultar_bitacora', 0, 1, 1),
(19, 'Configurar sistema ', 'sistema/configurar', 1, 1, 1),
(20, 'Municipio', 'archivo/municipio', 1, 1, 2),
(21, 'Registrar municipio', 'archivo/registrar_municipio', 0, 1, 2),
(22, 'Consultar municipio', 'archivo/consultar_municipio', 0, 1, 2),
(23, 'Parentesco', 'archivo/parentesco', 1, 1, 2),
(24, 'Registrar parentesco', 'archivo/registrar_parentesco', 0, 1, 2),
(25, 'Consultar parentesco', 'archivo/consultar_parentesco', 0, 1, 2),
(26, 'CondiciÃ³n visual', 'archivo/diagnostico', 1, 1, 2),
(27, 'Registrar diagnostico', 'archivo/registrar_diagnostico', 0, 1, 2),
(28, 'Consultar diagnostico', 'archivo/consultar_diagnostico', 0, 1, 2),
(29, 'Localidad', 'archivo/localidad', 1, 1, 2),
(30, 'Registrar localidad', 'archivo/registrar_localidad', 0, 1, 2),
(31, 'Consultar localidad', 'archivo/consultar_localidad', 0, 1, 2),
(32, 'Registrar Grupo', 'archivo/registrar_grupo', 0, 1, 2),
(33, 'Consultar Grupo', 'archivo/consultar_grupo', 0, 1, 2),
(34, 'Grupo', 'archivo/grupo', 1, 1, 2),
(35, 'Registrar participante', 'persona/registrar_participante', 0, 1, 4),
(36, 'Registrar Docente', 'persona/registrar_docente', 0, 1, 4),
(37, 'Consultar docente', 'persona/consultar_docente', 0, 1, 4),
(38, 'Docente', 'persona/docente', 1, 1, 4),
(39, 'InstituciÃ³n', 'archivo/institucion', 1, 1, 2),
(40, 'Registrar instituciÃ³n', 'archivo/registrar_institucion', 0, 1, 2),
(41, 'Consultar instituciÃ³n', 'archivo/consultar_institucion', 0, 1, 2),
(42, 'Hoja de vida del Participante', 'persona/participante', 1, 1, 4),
(43, 'Consultar Participante', 'persona/consultar_participante', 0, 1, 4),
(44, 'Lapso', 'curso/lapso', 1, 1, 3),
(45, 'Apertura lapso', 'curso/registrar_lapso', 0, 1, 3),
(46, 'Planificar curso', 'curso/registrar_curso', 1, 1, 3),
(47, 'Curso activo / trasladar ', 'curso/curso', 1, 1, 3),
(48, 'Personal', 'persona/personal', 1, 1, 4),
(49, 'Registrar personal', 'persona/registrar_personal', 0, 1, 4),
(50, 'Eliminar servicio', 'seguridad/eliminar_servicio', 0, 1, 1),
(51, 'Eliminar modulo', 'seguridad/eliminar_modulo', 0, 1, 1),
(52, 'Cambiar clave', 'seguridad/cambiar_clave', 1, 1, 5),
(53, 'Pregunta secreta', 'seguridad/registrar_pregunta', 1, 1, 5),
(54, 'Aula', 'archivo/aula', 1, 1, 2),
(55, 'Registrar aula', 'archivo/registrar_aula', 0, 1, 2),
(56, 'Consultar aula', 'archivo/consultar_aula', 0, 1, 2),
(57, 'Eliminar aula', 'archivo/eliminar_aula', 0, 1, 2),
(58, 'Area de Conocimiento', 'archivo/area_conocimiento', 1, 1, 2),
(59, 'Registrar Area de Conocimiento', 'archivo/registrar_area', 0, 1, 2),
(60, 'Consultar Area de Conocimiento', 'archivo/consultar_area', 0, 1, 2),
(61, 'Eliminar Area de Conocimiento', 'archivo/eliminar_area', 0, 1, 2),
(62, 'Asignatura', 'archivo/asignatura', 1, 1, 2),
(63, 'Registrar Asignatura', 'archivo/registrar_asignatura', 0, 1, 2),
(64, 'Consultar Asignatura', 'archivo/consultar_asignatura', 0, 1, 2),
(65, 'Eliminar Asignatura', 'archivo/eliminar_asignatura', 0, 1, 2),
(66, 'Eliminar rol', 'seguridad/eliminar_rol', 0, 1, 1),
(67, 'Eliminar localidad', 'archivo/eliminar_localidad', 0, 1, 2),
(68, 'Eliminar municipio', 'archivo/eliminar_municipio', 0, 1, 2),
(69, 'Eliminar instituciÃ³n', 'archivo/eliminar_institucion', 0, 1, 2),
(70, 'Eliminar diagnostico', 'archivo/eliminar_diagnostico', 0, 1, 2),
(71, 'Consultar personal', 'persona/consultar_personal', 0, 1, 4),
(72, 'Eliminar Personal', 'persona/eliminar_personal', 0, 1, 4),
(73, 'Eliminar parentesco', 'archivo/eliminar_parentesco', 0, 1, 2),
(74, 'Eliminar Grupo', 'archivo/eliminar_grupo', 0, 1, 2),
(75, 'Eliminar aula', 'archivo/eliminar_aula', 0, 1, 2),
(76, 'Registrar Noticia', 'sistema/registrar_noticia', 0, 1, 1),
(77, 'Noticia', 'sistema/noticia', 1, 1, 1),
(78, 'Consultar Noticia', 'sistema/consultar_noticia', 0, 1, 1),
(79, 'Eliminar Noticia', 'sistema/eliminar_noticia', 0, 1, 1),
(80, 'Registrar Slider', 'sistema/registrar_slider', 0, 1, 1),
(81, 'Slider', 'sistema/slider', 1, 1, 1),
(82, 'Consultar Slider', 'sistema/consultar_slider', 0, 1, 1),
(83, 'Eliminar Slider', 'sistema/eliminar_slider', 0, 1, 1),
(84, 'InscripciÃ³n masiva por curso', 'inscripcion/listado_cursos_inscribir', 1, 1, 8),
(85, 'InscripciÃ³n por participante', 'inscripcion/listado_participantes_inscribir', 1, 1, 8),
(86, 'InscripciÃ³n masiva', 'inscripcion/inscripcion_masiva', 0, 1, 8),
(87, 'InscripciÃ³n individual', 'inscripcion/inscripcion_individual', 0, 1, 8),
(88, 'Hoja de vida del Participante', 'reporte/planilla_inscripcion', 1, 1, 6),
(89, 'Familiares', 'reporte/familiar_participante ', 1, 0, 6),
(90, 'Eliminar participante', 'persona/eliminar_participante', 0, 1, 4),
(91, 'Eliminar Docente', 'persona/eliminar_docente', 0, 1, 4),
(92, 'Curso Inactivo', 'curso/cursos_inactivos', 1, 1, 3),
(93, 'Consultar historial curso', 'curso/detalle_curso_inactivo', 0, 1, 3),
(94, 'Primera vez', 'seguridad/primera_vez', 0, 1, 5),
(95, 'Desbloquear', 'seguridad/desbloquear', 1, 1, 1),
(99, 'Consultar Lapso', 'curso/consultar_lapso', 0, 1, 3),
(100, 'Eliminar lapso', 'curso/eliminar_lapso', 0, 1, 3),
(101, 'Consultar Curso', 'curso/detalle_curso_activo', 0, 1, 3),
(102, 'Desincorporar por participante ', 'inscripcion/listado_participantes_desincorporar', 1, 1, 8),
(103, 'Desincorporar masivamente por curso', 'inscripcion/listado_cursos_desincorporar', 1, 1, 8),
(104, 'Desincorporar participante', 'inscripcion/desincorporar_participante', 0, 1, 8),
(105, 'Desincorporar participantes', 'inscripcion/desincorporar_participantes', 0, 1, 8),
(107, 'historial de cursos por participante', 'persona/historial_participante_detalle', 0, 1, 3),
(108, 'Historial de lapso', 'reporte/historial_lapso', 1, 1, 6),
(109, 'Historial Lapso', 'historial_lapso', 0, 1, 6),
(110, 'Historial participante inscrito por curso', 'reporte/historial_participante', 1, 1, 6),
(111, 'Familiar por participante', 'reporte/participante_familiar', 1, 1, 6),
(112, 'Historial de curso', 'reporte/historial_curso', 1, 1, 6),
(113, 'Listado Participante - Etnia', 'reporte/listado_participantes_etnia', 1, 1, 6),
(114, 'Listado Participante - Huerfano', 'reporte/listado_participantes_huerfanos', 1, 1, 6),
(115, 'Listado de docente por condiciÃ³n visual', 'reporte/listado_docente_diagnostico', 1, 1, 6),
(116, 'Acerca de...', 'ayuda/acerca', 1, 1, 7),
(117, 'Manual de Usuario', 'ayuda/manual_usuario', 1, 1, 7),
(118, 'Auditoria de Usuario', 'seguridad/auditoria_usuarios', 1, 1, 1),
(119, 'Consultar Usuario', 'seguridad/consultar_usuario', 0, 1, 1),
(120, 'Criterio de evaluaciÃ³n', 'archivo/item', 1, 1, 2),
(121, 'Registrar Item', 'archivo/registrar_item', 0, 1, 2),
(122, 'Consultar item', 'archivo/consultar_item', 0, 1, 2),
(123, 'Eliminar item', 'archivo/eliminar_item', 0, 1, 2),
(124, 'Auditoria de Reporte', 'seguridad/bitacora_reporte', 1, 1, 1),
(125, 'Consultar bitacora reporte', 'seguridad/consultar_bitacora_reporte', 0, 1, 1),
(126, 'Bloquear/Desbloquear Usuario', 'seguridad/bloquear', 1, 1, 1),
(127, 'Historial de clave', 'seguridad/listado_cambio_clave', 1, 1, 1),
(128, 'Consultar claves', 'seguridad/consultar_claves', 0, 1, 1),
(130, 'Mantenimiento Base de datos', 'seguridad/mantenimiento_bd', 1, 1, 1),
(131, 'Asistencia', 'curso/asistencia', 1, 1, 3),
(132, 'Registrar Asistencia', 'curso/registrar_asistencia', 0, 1, 3),
(133, 'Instrumento', 'archivo/instrumento', 1, 1, 2),
(134, 'Registrar Instrumento', 'archivo/registrar_instrumento', 0, 1, 2),
(135, 'Consultar instrumento', 'archivo/consultar_instrumento', 0, 1, 2),
(136, 'Eliminar instrumento', 'archivo/eliminar_instrumento', 0, 1, 2),
(137, 'EvaluaciÃ³n', 'curso/evaluacion', 1, 1, 3),
(138, 'Familiar', 'persona/familiar', 1, 1, 4),
(139, 'Registrar Evaluacion', 'curso/registrar_evaluacion', 0, 1, 3),
(140, 'Consultar EvaluaciÃ³n', 'curso/consultar_evaluacion', 0, 1, 3),
(141, 'Eliminar EvaluaciÃ³n', 'curso/eliminar_evaluacion', 0, 1, 3),
(142, 'Registrar Familiar', 'persona/registrar_familiar', 0, 1, 4),
(143, 'Consultar Familiar', 'persona/consultar_familiar', 0, 1, 4),
(144, 'Eliminar Familiar', 'persona/eliminar_familiar', 0, 1, 4),
(145, 'TÃ©rminos y condiciones ', 'ayuda/terminos_condiciones', 1, 1, 7),
(146, 'Normas y procedimientos', 'ayuda/normas_procedimientos', 1, 1, 7),
(147, 'Participante inscrito por cursos', 'persona/historial_participante', 1, 1, 3),
(148, 'Participante por evaluaciÃ³n', 'reporte/listado_participantes_evaluaciones', 1, 1, 6),
(149, 'Consultar EvaluaciÃ³n', 'reporte/consultar_evaluaciones', 0, 1, 6),
(150, 'Participante por asistencia', 'reporte/listado_participantes_asistencia', 1, 1, 6),
(151, 'Consultar Asistencias', 'reporte/consultar_asistencias', 0, 1, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tservicio_trol`
--

CREATE TABLE IF NOT EXISTS `tservicio_trol` (
  `idservicio` int(11) NOT NULL,
  `idrol` int(11) NOT NULL,
  `orden` int(11) DEFAULT NULL,
  PRIMARY KEY (`idservicio`,`idrol`),
  KEY `fk_tservicio_has_trol_trol1_idx` (`idrol`),
  KEY `fk_tservicio_has_trol_tservicio1_idx` (`idservicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tservicio_trol`
--

INSERT INTO `tservicio_trol` (`idservicio`, `idrol`, `orden`) VALUES
(1, 1, 2),
(2, 1, 0),
(4, 1, 3),
(5, 1, 0),
(7, 1, 1),
(8, 1, 0),
(11, 1, 4),
(12, 1, 5),
(13, 1, 0),
(14, 1, 0),
(15, 1, 0),
(17, 1, 6),
(17, 2, 1),
(18, 1, 0),
(18, 2, 0),
(19, 1, 0),
(19, 2, 7),
(20, 1, 1),
(20, 2, 1),
(20, 4, 1),
(21, 1, 0),
(21, 2, 0),
(21, 4, 0),
(22, 1, 0),
(22, 2, 0),
(22, 4, 0),
(23, 1, 5),
(23, 2, 5),
(23, 4, 4),
(24, 1, 0),
(24, 2, 0),
(24, 4, 0),
(25, 1, 0),
(25, 2, 0),
(25, 4, 0),
(26, 1, 4),
(26, 2, 4),
(26, 4, 3),
(27, 1, 0),
(27, 2, 0),
(27, 4, 0),
(28, 1, 0),
(28, 2, 0),
(28, 4, 0),
(29, 1, 2),
(29, 2, 2),
(29, 4, 2),
(30, 1, 0),
(30, 2, 0),
(30, 4, 0),
(31, 1, 0),
(31, 2, 0),
(31, 4, 0),
(32, 1, 0),
(32, 2, 0),
(32, 4, 0),
(33, 1, 0),
(33, 2, 0),
(33, 4, 0),
(34, 1, 6),
(34, 2, 6),
(34, 4, 5),
(35, 1, 0),
(35, 2, 0),
(35, 3, 0),
(35, 4, 0),
(36, 1, 0),
(36, 2, 0),
(36, 4, 0),
(37, 1, 0),
(37, 2, 0),
(37, 4, 0),
(38, 1, 1),
(38, 2, 1),
(38, 4, 1),
(39, 1, 3),
(39, 2, 3),
(39, 3, 1),
(39, 4, 0),
(40, 1, 0),
(40, 2, 0),
(40, 4, 0),
(41, 1, 0),
(41, 2, 0),
(41, 4, 0),
(42, 1, 3),
(42, 2, 2),
(42, 3, 0),
(42, 4, 2),
(43, 1, 0),
(43, 2, 0),
(43, 3, 0),
(43, 4, 0),
(44, 1, 1),
(44, 2, 1),
(44, 4, 1),
(45, 1, 0),
(45, 2, 0),
(45, 4, 0),
(46, 1, 2),
(46, 2, 2),
(46, 4, 2),
(47, 1, 3),
(47, 2, 3),
(47, 3, 1),
(47, 4, 3),
(48, 1, 4),
(48, 2, 3),
(48, 4, 3),
(49, 1, 0),
(49, 2, 0),
(49, 4, 0),
(50, 1, 0),
(51, 1, 0),
(52, 1, 1),
(52, 2, 1),
(52, 3, 1),
(52, 4, 1),
(53, 1, 2),
(53, 2, 2),
(53, 3, 2),
(53, 4, 2),
(54, 1, 7),
(54, 2, 7),
(54, 4, 6),
(55, 1, 0),
(55, 2, 0),
(55, 4, 0),
(56, 1, 0),
(56, 2, 0),
(56, 4, 0),
(57, 1, 0),
(57, 2, 0),
(57, 4, 0),
(58, 1, 8),
(58, 2, 8),
(58, 4, 7),
(59, 1, 0),
(59, 2, 0),
(59, 4, 0),
(60, 1, 0),
(60, 2, 0),
(60, 4, 0),
(61, 1, 0),
(61, 2, 0),
(61, 4, 0),
(62, 1, 9),
(62, 2, 9),
(62, 4, 8),
(63, 1, 0),
(63, 2, 0),
(63, 4, 0),
(64, 1, 0),
(64, 2, 0),
(64, 4, 0),
(65, 1, 0),
(65, 2, 0),
(65, 4, 0),
(66, 1, 0),
(67, 1, 0),
(67, 2, 0),
(67, 4, 0),
(68, 1, 0),
(68, 2, 0),
(68, 4, 0),
(69, 1, 0),
(69, 2, 0),
(69, 3, 0),
(69, 4, 0),
(70, 1, 0),
(70, 2, 0),
(70, 4, 0),
(71, 1, 0),
(71, 2, 0),
(71, 4, 0),
(72, 1, 0),
(72, 2, 0),
(72, 4, 0),
(73, 1, 0),
(73, 2, 0),
(73, 4, 0),
(74, 1, 0),
(74, 2, 0),
(74, 4, 0),
(75, 1, 0),
(75, 2, 0),
(75, 4, 0),
(76, 1, 0),
(76, 2, 0),
(77, 1, 9),
(77, 2, 4),
(77, 4, 1),
(78, 1, 0),
(78, 2, 0),
(79, 1, 0),
(79, 2, 0),
(80, 1, 0),
(80, 2, 0),
(81, 1, 10),
(81, 2, 5),
(81, 4, 2),
(82, 1, 0),
(82, 2, 0),
(83, 1, 0),
(83, 2, 0),
(84, 1, 1),
(84, 2, 1),
(84, 3, 1),
(84, 4, 1),
(85, 1, 2),
(85, 2, 2),
(85, 3, 2),
(85, 4, 2),
(86, 1, 0),
(86, 2, 0),
(86, 3, 0),
(86, 4, 0),
(87, 1, 0),
(87, 2, 0),
(87, 3, 0),
(87, 4, 0),
(88, 1, 1),
(88, 2, 1),
(88, 3, 1),
(88, 4, 1),
(90, 1, 0),
(90, 2, 0),
(90, 4, 0),
(91, 1, 0),
(91, 2, 0),
(91, 4, 0),
(92, 1, 4),
(92, 2, 4),
(92, 4, 4),
(93, 1, 0),
(93, 2, 0),
(93, 3, 0),
(93, 4, 0),
(94, 1, 0),
(94, 2, 0),
(94, 3, 0),
(94, 4, 0),
(99, 1, 0),
(99, 2, 0),
(99, 4, 0),
(100, 1, 0),
(100, 2, 0),
(100, 4, 0),
(101, 1, 0),
(101, 2, 0),
(101, 3, 0),
(101, 4, 0),
(102, 1, 4),
(102, 2, 3),
(102, 4, 4),
(103, 1, 3),
(103, 2, 4),
(103, 4, 3),
(104, 1, 0),
(104, 2, 0),
(104, 4, 0),
(105, 1, 0),
(105, 2, 0),
(105, 4, 0),
(107, 1, 0),
(107, 3, 0),
(108, 1, 3),
(108, 2, 7),
(108, 3, 2),
(108, 4, 3),
(109, 1, 0),
(109, 2, 0),
(109, 4, 0),
(110, 1, 4),
(110, 2, 6),
(110, 3, 3),
(110, 4, 4),
(111, 1, 2),
(111, 2, 5),
(111, 3, 4),
(111, 4, 2),
(112, 1, 5),
(112, 2, 2),
(112, 3, 5),
(112, 4, 5),
(113, 1, 6),
(113, 2, 4),
(113, 4, 6),
(114, 1, 7),
(114, 2, 3),
(114, 4, 7),
(115, 1, 8),
(115, 2, 8),
(115, 4, 8),
(116, 1, 1),
(116, 2, 1),
(116, 3, 1),
(116, 4, 1),
(117, 1, 2),
(117, 2, 2),
(117, 3, 2),
(117, 4, 2),
(118, 1, 7),
(118, 2, 2),
(119, 1, 0),
(119, 2, 0),
(120, 1, 10),
(120, 2, 10),
(120, 3, 2),
(121, 1, 0),
(121, 2, 0),
(121, 3, 0),
(122, 1, 0),
(122, 2, 0),
(122, 3, 0),
(123, 1, 0),
(123, 2, 0),
(123, 3, 0),
(124, 1, 8),
(124, 2, 3),
(125, 1, 0),
(125, 2, 0),
(126, 1, 11),
(126, 2, 6),
(127, 2, 8),
(128, 1, 0),
(128, 2, 0),
(130, 1, 19),
(130, 2, 3),
(130, 4, 3),
(131, 1, 6),
(131, 2, 5),
(131, 3, 2),
(131, 4, 5),
(132, 1, 0),
(132, 2, 0),
(132, 3, 0),
(132, 4, 0),
(133, 1, 11),
(133, 2, 11),
(133, 3, 3),
(134, 1, 0),
(134, 2, 0),
(134, 3, 0),
(135, 1, 0),
(135, 2, 0),
(135, 3, 0),
(136, 1, 0),
(136, 2, 0),
(136, 3, 0),
(136, 4, 0),
(137, 1, 8),
(138, 1, 2),
(139, 1, 0),
(140, 1, 0),
(141, 1, 0),
(142, 1, 0),
(143, 1, 0),
(144, 1, 0),
(145, 1, 3),
(145, 2, 3),
(145, 3, 3),
(145, 4, 3),
(146, 1, 4),
(146, 2, 4),
(146, 3, 4),
(146, 4, 4),
(147, 1, 5),
(148, 1, 9),
(149, 1, 0),
(150, 1, 10),
(151, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tsistema`
--

CREATE TABLE IF NOT EXISTS `tsistema` (
  `idconfiguracion` int(11) NOT NULL AUTO_INCREMENT,
  `introducion` text,
  `mision` text,
  `vision` text,
  `historia` text,
  `objetivos` text,
  `direccion` text,
  `nropreguntas` varchar(2) DEFAULT NULL,
  `clavepredeterminada` varchar(45) DEFAULT NULL,
  `nrointentos` varchar(45) DEFAULT NULL,
  `tiempocaducida` varchar(3) DEFAULT NULL,
  `tiempoconexion` int(11) DEFAULT NULL,
  `tiempolapso` int(11) DEFAULT NULL,
  PRIMARY KEY (`idconfiguracion`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `tsistema`
--

INSERT INTO `tsistema` (`idconfiguracion`, `introducion`, `mision`, `vision`, `historia`, `objetivos`, `direccion`, `nropreguntas`, `clavepredeterminada`, `nrointentos`, `tiempocaducida`, `tiempoconexion`, `tiempolapso`) VALUES
(2, '<p>Bienvenidos al sistema..</p>', '<p>Administrar las polÃ­ticas de educaciÃ³n especial en el Ã¡rea de las deficiencias visuales a la poblaciÃ³n atendida</p>', '<p style="text-align: justify;">Alcanzar el mÃ¡ximo nivel de desarrollo de los participantes para su plena realizaciÃ³n personal, social, profesional y laboral.</p>', '<p style="text-align: justify;">AsÃ­ comenzÃ³ la educaciÃ³n de las personas con discapacidad visual del Estado Portuguesa, con un sueÃ±o compartido con otras personas, movidos por un sentimiento comÃºn, la pÃ©rdida del sentido de la vista. Un grupo de personas se reÃºne con la idea de formar una instituciÃ³n que le brindarÃ¡ atenciÃ³n educativa a todas las personas con discapacidad visual, y motivados por el seÃ±or Erasmo Conde quien dirigÃ­a la AsociaciÃ³n PortugueseÃ±a de Ciegos, quien contaba con todo el apoyo de sus miembros, se crea el Instituto de ciegos del estado Portuguesa que funcionÃ³ desde 1986 hasta 1991 con personal voluntario, en forma asistemÃ¡tica, su labor fue mÃ¡s de captaciÃ³n y preparaciÃ³n de recursos humanos y de informaciÃ³n a la comunidad, promociÃ³n y divulgaciÃ³n, que de una atenciÃ³n propiamente dicha. La capacitaciÃ³n del personal voluntario en el Ã¡rea de las deficiencias visuales, estuvo a cargo en un principio por profesionales del Centro de RehabilitaciÃ³n para el Discapacitado Visual adscrito al Ministerio de Sanidad de Caracas, dirigido por el Dr. Antonio Isea, mediante un gran programa de atenciÃ³n basado en la comunidad, con seis cursos intensivos a los cuales asistieron numerosas personas de toda la colectividad de Acarigua â€“ Araure, quedando solamente tres, comprometidos con la idea y con el objetivo claro por el cual se iba a luchar. El 15 de enero de 1992, el anterior Instituto se convierte en Centro de AtenciÃ³n Integral de Deficiencias Visuales, funcionando en un salÃ³n de un mÃ³dulo tipo R-2, sede de la AsociaciÃ³n PortugueseÃ±a de Personas con Discapacidad Visual, bajo la supervisiÃ³n del Departamento de EducaciÃ³n Especial y de la DirecciÃ³n de EducaciÃ³n del estado, recibiendo apoyo en la parte TÃ©cnico â€“Administrativo- Docente con dos lÃ­neas de mando lo cual creÃ³ una situaciÃ³n de ambigÃ¼edad, lo que trajo como consecuencia problemas para la consecuciÃ³n de recursos tanto econÃ³micos como de dotaciÃ³n de mobiliario, equipos, personal docente y tÃ©cnico (PsicÃ³logo, OftalmÃ³logo y Trabajador Social) El 21 de enero de ese mismo aÃ±o, el CAIDV inicia la educaciÃ³n integrada de niÃ±os y niÃ±as con discapacidad visual en el Ã¡mbito de preescolar, para ello se realiza un taller denominado â€œIntegraciÃ³n del niÃ±o Ciego al aula Regularâ€, auspiciado por los dos docentes que laboraban en ese momento, quienes estaban reciÃ©n nombrados oficialmente, uno por el Ministerio de EducaciÃ³n (el Sr. Erasmo Conde) y la otra por la DirecciÃ³n de EducaciÃ³n (la docente Blanca Torres) Es en 1997 cuando el Ministerio de EducaciÃ³n en una revisiÃ³n y reorientaciÃ³n del modelo educativo para las personas con discapacidad visual promueve unas jornadas con la nueva polÃ­tica y conceptualizaciÃ³n de atenciÃ³n educativa de las personas ciegas: y el documento presentado establece que todas las instituciones que imparten educaciÃ³n a personas ciegas desde ese momento se denominarÃ¡n â€œCentro de AtenciÃ³n Integralâ€ (CAI), lo que en principio se le cuestionaba a Portuguesa, en ese momento se le dio la razÃ³n.Es importante mencionar que este CAI es el primero en su gÃ©nero en el Ã¡mbito nacional, producto de la sinergia, sin embargo esto no fue suficiente para su codificaciÃ³n, porque el Ministerio de EducaciÃ³n alegaba que el personal del CAI era casi en su totalidad de la DirecciÃ³n de EducaciÃ³n y no le brindaba apoyo. Fue en el aÃ±o 2003, cuando la DirecciÃ³n de EducaciÃ³n del Estado Portuguesa, en el marco de la creaciÃ³n de la CoordinaciÃ³n de EducaciÃ³n Especial, le asigna al CAIDV Acarigua el CÃ³digo Educativo NÂ° 099000. Otro aspecto relevante es que para lograr el gran sueÃ±o, ha sido necesario un cÃºmulo de esfuerzos para conservarlo y hacerlo realidad, es necesario reforzar la imagen inicial de trabajo para lograr lo que queremos, cultivando la cultura del esfuerzo y la bÃºsqueda constante de nuevas formas de actuar, asÃ­ mismo se requiere desarrollar todo un programa mental que integre los planes tomando en cuenta nuestras fortalezas y oportunidades. En general se podrÃ­a decir que la experiencia de estos 20 aÃ±os, ha sido a grandes rasgos, la siguiente:</p>\r\n<ul style="text-align: justify;">\r\n<li>\r\n<p>Se crea la organizaciÃ³n en la cual se pone de manifiesto mayor interÃ©s en la integraciÃ³n a la vida diaria.</p>\r\n</li>\r\n</ul>\r\n<ul style="text-align: justify;">\r\n<li>\r\n<p>Se afronta la problemÃ¡tica de la persona con discapacidad visual desde una Ã³ptica mÃ¡s compleja, involucrando niÃ±os, niÃ±as, adolescentes, jÃ³venes y adultos en la preparaciÃ³n indispensable para desenvolverse en la vida.</p>\r\n</li>\r\n</ul>\r\n<ul style="text-align: justify;">\r\n<li>\r\n<p>&nbsp;Se crea otro CAI en la ciudad de Guanare con caracterÃ­sticas similares a Ã©ste para la atenciÃ³n de los municipios adyacentes.</p>\r\n</li>\r\n</ul>\r\n<ul style="text-align: justify;">\r\n<li>\r\n<p>Se logra la construcciÃ³n de otra R-2 ampliando asÃ­ el espacio fÃ­sico para la poblaciÃ³n del momento, e independizando el Ãrea Educativa del Ãrea gremial.</p>\r\n</li>\r\n</ul>\r\n<ul style="text-align: justify;">\r\n<li>\r\n<p>Se inicia la integraciÃ³n en niveles y modalidades del sistema educativo.</p>\r\n</li>\r\n</ul>\r\n<ul style="text-align: justify;">\r\n<li>\r\n<p>Se inicia la integraciÃ³n laboral de la persona con discapacidad.</p>\r\n</li>\r\n</ul>\r\n<ul>\r\n<li>\r\n<p>En el aÃ±o escolar 2005-2006, se inicia la aplicaciÃ³n del Proyecto de TecnologÃ­as Adaptativas para personas con discapacidad visual, mediante el Software Jaws, primero con la formaciÃ³n de un docente (TSU MarÃ­a JosÃ© Garantota) y actualmente con los participantes integrados en educaciÃ³n media, diversificada y universitaria. En otro orden de ideas la instituciÃ³n es tomada en cuenta actualmente como centro de pasantÃ­as de CEDUPORT, instituciÃ³n que forma auxiliares de educaciÃ³n Especial, y la Universidad Bolivariana en la cÃ¡tedra de formaciÃ³n de docentes, Colegio Universitario FermÃ­n Toro y Colegio Universitario MonseÃ±or de Talavera, ademÃ¡s en este centro se le ofrece atenciÃ³n formativa a estudiantes de diferentes universidades locales que asisten para investigar aspectos asociados al Ã¡rea de las deficiencias visuales. El CAIDV Acarigua es una unidad operativa que funciona como servicio de apoyo de la modalidad de EducaciÃ³n Especial, brinda atenciÃ³n educativa integral a la poblaciÃ³n de niÃ±os, niÃ±as, adolescentes, jÃ³venes y adultos con discapacidad visual, con o sin discapacidad asociada ubicados en los (7) siete municipios de la parte norte del estado Portuguesa, a travÃ©s de 2 alternativas de atenciÃ³n:</p>\r\n</li>\r\n</ul>\r\n<ol style="text-align: justify;">\r\n<li>\r\n<p>Directa: en el propio CAI, a la poblaciÃ³n con o sin discapacidad asociada, que aÃºn no ha sido integrada ni educativa ni laboralmente, o no puede ser integrada.</p>\r\n</li>\r\n<li>\r\n<p>Como unidad de Apoyo, a fin de garantizar:</p>\r\n</li>\r\n</ol>\r\n<ul style="padding-left: 30px; text-align: justify;">\r\n<li>\r\n<p>AtenciÃ³n integral temprana a niÃ±os, y niÃ±as con discapacidad visual con o sin discapacidad asociada, cuyas edades estÃ©n comprendidas entre 0 y 6 aÃ±os, atendidos en los Centros de Desarrollo Infantil, asÃ­ como garantizar la continuidad del proceso educativo de esta poblaciÃ³n.</p>\r\n</li>\r\n</ul>\r\n<ul style="padding-left: 30px;">\r\n<li>\r\n<p style="text-align: justify;">El proceso de integraciÃ³n escolar de esta poblaciÃ³n en los niveles de EducaciÃ³n Preescolar, BÃ¡sica, Media, Diversificada, Superior, Modalidades de EducaciÃ³n Especial y EducaciÃ³n de Adultos. Los CAI, por su condiciÃ³n de Unidad de apoyo, no estÃ¡n concebidos para brindar escolaridad a su poblaciÃ³n, pues esto es competencia de los planteles donde estÃ¡n integrados los educandos, razÃ³n por la cual se deben realizar acciones de manera cooperativa y coordinada con estas instancias educativas y con otros sectores (salud, social, entre otros).</p>\r\n</li>\r\n</ul>', '<ul>\r\n<li>\r\n<p>Brindar atenciÃ³n Integral a niÃ±os, niÃ±as, adolescentes, jÃ³venes y adultos con discapacidad visual, con o sin discapacidad asociada, a fin de desarrollar habilidades y destrezas que le permitan maximizar sus potencialidades y optimizar sus posibilidades para la integraciÃ³n familiar, educativa, comunitaria.</p>\r\n</li>\r\n</ul>\r\n<div>\r\n<ul>\r\n<li>\r\n<p>Aplicar estrategias que faciliten la formaciÃ³n y capacitaciÃ³n de jÃ³venes y adultos con discapacidad visual, con o sin discapacidades asociadas, mediante la articulaciÃ³n intrasectorial e intersectorial con la finalidad de lograr su IntegraciÃ³n Socio laboral.</p>\r\n</li>\r\n</ul>\r\n<ul>\r\n<li>\r\n<p>Orientar a la familia y comunidad en general para que participe activamente en el proceso de IntegraciÃ³n Social de niÃ±os, niÃ±as, adolescentes, jÃ³venes y adultos con discapacidad visual con o sin discapacidad asociada, mediante charlas, talleres, jornadas de difusiÃ³n, conferencias y otras actividades educativas, culturales, artÃ­sticas, recreativas, deportivas, cientÃ­ficas y tecnolÃ³gicas.</p>\r\n</li>\r\n</ul>\r\n<ul>\r\n<li style="text-align: justify;">\r\n<p>Ofrecer atenciÃ³n integral a la persona con discapacidad visual o baja visiÃ³n considerando tanto sus potencialidades como las condiciones que faciliten su integraciÃ³n social.</p>\r\n</li>\r\n</ul>\r\n<ul>\r\n<li>\r\n<p>Fomentar el respeto por los derechos de la persona con discapacidad visual.</p>\r\n</li>\r\n</ul>\r\n<ul>\r\n<li>\r\n<p>Promover atenciÃ³n preventiva e integral de la persona con discapacidad visual o con baja visiÃ³n desde su nacimiento, a fin de lograr el mÃ¡ximo aprovechamiento de sus potencialidades y su integraciÃ³n al nÃºcleo familiar, escolar y social.</p>\r\n</li>\r\n</ul>\r\n<ul>\r\n<li>\r\n<p>Incorporar la familia y la comunidad al proceso educativo de la persona con discapacidad visual y con baja visiÃ³n.</p>\r\n</li>\r\n</ul>\r\n<ul>\r\n<li>\r\n<p>Promover la capacitaciÃ³n de la persona con discapacidad visual para su incorporaciÃ³n en el campo laboral.</p>\r\n</li>\r\n</ul>\r\n</div>\r\n<div>&nbsp;</div>', '<p>Calle Luis Braille con Av. CircunvalaciÃ³n detrÃ¡s del Centro de Bellas Artes sector Los Cortijos.</p>', '2', '12345678', '4', '120', 60, 270);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tslider`
--

CREATE TABLE IF NOT EXISTS `tslider` (
  `idslider` int(11) NOT NULL AUTO_INCREMENT,
  `titulosli` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `textosli` text COLLATE utf8_spanish2_ci NOT NULL,
  `imagensli` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `estatussli` char(1) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`idslider`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `tslider`
--

INSERT INTO `tslider` (`idslider`, `titulosli`, `textosli`, `imagensli`, `estatussli`) VALUES
(1, 'CAIDV AVANZA', 'PresentaciÃ³n a la Comunidad CAIDV del proyecto.', 'IMG00305-20120517-1004.jpg', '1'),
(2, 'TRABAJO MANUAL', 'Una clase de manualidades', 'IMG_5163.JPG', '1'),
(3, 'PROYECTO SISCAIDV', 'Implantando el proyecto en el Laboratorio CEBIT del CAIDV', 'IMG-20150206-WA0002.jpg', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tunidad`
--

CREATE TABLE IF NOT EXISTS `tunidad` (
  `idunidad` int(11) NOT NULL AUTO_INCREMENT,
  `nombreuni` varchar(500) COLLATE utf8_spanish2_ci NOT NULL,
  `estatusuni` char(1) COLLATE utf8_spanish2_ci NOT NULL DEFAULT '1',
  `tasignatura_idasignatura` int(11) NOT NULL,
  PRIMARY KEY (`idunidad`),
  KEY `tasignatura_idasignatura` (`tasignatura_idasignatura`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `tunidad`
--

INSERT INTO `tunidad` (`idunidad`, `nombreuni`, `estatusuni`, `tasignatura_idasignatura`) VALUES
(1, 'Conceptos bÃ¡sicos', '1', 4),
(5, 'LA COMPUTADORA ', '1', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tusuario`
--

CREATE TABLE IF NOT EXISTS `tusuario` (
  `idusuario` varchar(20) NOT NULL,
  `nombreusu` varchar(45) NOT NULL,
  `emailusu` varchar(55) NOT NULL,
  `estatususu` tinyint(1) NOT NULL DEFAULT '1',
  `ultima_actividadusu` datetime NOT NULL,
  `trol_idrol` int(11) NOT NULL,
  `cedula` char(9) DEFAULT 'S/C',
  `intentos_fallidos` int(11) NOT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `fk_tusuario_trol1_idx` (`trol_idrol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tusuario`
--

INSERT INTO `tusuario` (`idusuario`, `nombreusu`, `emailusu`, `estatususu`, `ultima_actividadusu`, `trol_idrol`, `cedula`, `intentos_fallidos`) VALUES
('12526145', 'GONZALEZ LEIBI', 'LEIBIGON@GMAIL.COM', 0, '2015-05-01 17:47:44', 1, '12526145', 0),
('15491963', 'SPADARO ANTONIO', 'SPADARO.ANTO@GMAIL.COM', 1, '2015-05-20 20:12:52', 1, '15491963', 0),
('17960877', 'DIAZ EFREN ', 'EDM_126@HOTMAIL.COM', 1, '2015-03-24 22:01:46', 1, '17960877', 0),
('18672728', 'APONTE JORGE', 'COREO@SDD.COM', 1, '2015-03-24 22:12:29', 1, '18672728', 0),
('administrador', 'Web Master', 'webmaster@gmail.com', 1, '2015-05-09 09:23:46', 1, '0', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tvalor_item`
--

CREATE TABLE IF NOT EXISTS `tvalor_item` (
  `idvalor_item` int(11) NOT NULL AUTO_INCREMENT,
  `valorval` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `estatusval` char(1) COLLATE utf8_spanish2_ci NOT NULL,
  `titem_iditem` int(11) DEFAULT NULL,
  PRIMARY KEY (`idvalor_item`),
  KEY `fk_tvalor_item_titem` (`titem_iditem`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=52 ;

--
-- Volcado de datos para la tabla `tvalor_item`
--

INSERT INTO `tvalor_item` (`idvalor_item`, `valorval`, `estatusval`, `titem_iditem`) VALUES
(3, 'VISUAL', '1', 10),
(4, 'AUDITIVA', '1', 10),
(5, 'LINGUISTICA', '1', 10),
(6, 'MOTORA', '1', 10),
(7, 'COGNITIVA', '1', 10),
(8, 'SI', '1', 12),
(9, 'NO', '1', 12),
(10, 'MASCULINO', '1', 3),
(11, 'FEMENINO', '1', 3),
(16, 'SI', '1', 13),
(17, 'NO', '1', 13),
(18, 'SI', '1', 14),
(19, 'NO', '1', 14),
(20, 'SI', '1', 15),
(21, 'NO', '1', 15),
(22, 'SI', '1', 16),
(23, 'NO', '1', 16),
(24, 'SI', '1', 17),
(25, 'NO', '1', 17),
(26, 'SI', '1', 18),
(27, 'NO', '1', 18),
(28, 'SI', '1', 19),
(29, 'NO', '1', 19),
(30, 'SI', '1', 20),
(31, 'NO', '1', 20),
(32, 'SI', '1', 21),
(33, 'NO', '1', 21),
(34, 'SI', '1', 22),
(35, 'NO', '1', 22),
(36, 'SI', '1', 23),
(37, 'NO', '1', 23),
(38, 'SI', '1', 24),
(39, 'NO', '1', 24),
(40, 'SI', '1', 25),
(41, 'NO', '1', 25),
(42, 'SI', '1', 26),
(43, 'NO', '1', 26),
(44, 'SI', '1', 27),
(45, 'NO', '1', 27),
(46, 'SI', '1', 28),
(47, 'NO', '1', 28),
(48, 'SI', '1', 29),
(49, 'NO', '1', 29),
(50, 'SI', '1', 30),
(51, 'NO', '1', 30);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `participante_familiar`
--
ALTER TABLE `participante_familiar`
  ADD CONSTRAINT `fk_tparticipante_has_tfamiliar_tparentesco1` FOREIGN KEY (`idparentesco`) REFERENCES `tparentesco` (`idparentesco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `participante_familiar_ibfk_1` FOREIGN KEY (`tparticipante_idparticipante`) REFERENCES `tparticipante` (`idparticipante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `participante_familiar_ibfk_2` FOREIGN KEY (`tfamiliar_idfamiliar`) REFERENCES `tfamiliar` (`idfamiliar`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tasignatura`
--
ALTER TABLE `tasignatura`
  ADD CONSTRAINT `tasignatura_ibfk_1` FOREIGN KEY (`tarea_idarea_conocimiento`) REFERENCES `tarea_conocimiento` (`idarea_conocimiento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tasistencia`
--
ALTER TABLE `tasistencia`
  ADD CONSTRAINT `fk_tasistencia_tcurso_tparticipante_1` FOREIGN KEY (`idcurso_idparticipante`) REFERENCES `tcurso_tparticipante` (`idcurso_participante`);

--
-- Filtros para la tabla `tasistencia_objetivo`
--
ALTER TABLE `tasistencia_objetivo`
  ADD CONSTRAINT `tasistencia_objetivo_ibfk_1` FOREIGN KEY (`tasistencia_idasistencia`) REFERENCES `tasistencia` (`idasistencia`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `tasistencia_objetivo_ibfk_2` FOREIGN KEY (`tobjetivo_idobjetivo`) REFERENCES `tobjetivo` (`idobjetivo`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tasistencia_unidad`
--
ALTER TABLE `tasistencia_unidad`
  ADD CONSTRAINT `tasistencia_unidad_ibfk_1` FOREIGN KEY (`tasistencia_idasistencia`) REFERENCES `tasistencia` (`idasistencia`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `tasistencia_unidad_ibfk_2` FOREIGN KEY (`tunidad_idunidad`) REFERENCES `tunidad` (`idunidad`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tclave`
--
ALTER TABLE `tclave`
  ADD CONSTRAINT `fk_tclave_tusuario1` FOREIGN KEY (`tusuario_idusuario`) REFERENCES `tusuario` (`idusuario`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tcurso`
--
ALTER TABLE `tcurso`
  ADD CONSTRAINT `fk_tcurso_taula_1` FOREIGN KEY (`taula_idaula`) REFERENCES `taula` (`idaula`),
  ADD CONSTRAINT `fk_tcurso_tgrupo1` FOREIGN KEY (`tgrupo_idgrupo`) REFERENCES `tgrupo` (`idgrupo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tcurso_tlapso1` FOREIGN KEY (`tlapso_idlapso`) REFERENCES `tlapso` (`idlapso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tcurso_ibfk_1` FOREIGN KEY (`tasignatura_idasignatura`) REFERENCES `tasignatura` (`idasignatura`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tcurso_tparticipante`
--
ALTER TABLE `tcurso_tparticipante`
  ADD CONSTRAINT `fk_tcurso_idcurso` FOREIGN KEY (`tcurso_idcurso`) REFERENCES `tcurso` (`idcurso`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `tcurso_tparticipante_ibfk_1` FOREIGN KEY (`tparticipante_idparticipante`) REFERENCES `tparticipante` (`idparticipante`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tdocente`
--
ALTER TABLE `tdocente`
  ADD CONSTRAINT `fk_tprofesor_tdiagnostico1` FOREIGN KEY (`tdiagnostico_iddiagnostico`) REFERENCES `tdiagnostico` (`iddiagnostico`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tevaluacion`
--
ALTER TABLE `tevaluacion`
  ADD CONSTRAINT `fk_tevaluacion_tcurso_tparticipante_1` FOREIGN KEY (`idcurso_idparticipante`) REFERENCES `tcurso_tparticipante` (`idcurso_participante`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tevaluacion_tinstrumento_1` FOREIGN KEY (`tinstrumento_idinstrumento`) REFERENCES `tinstrumento` (`idinstrumento`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tevaluacion_item`
--
ALTER TABLE `tevaluacion_item`
  ADD CONSTRAINT `fk_tevaluacion_item_tevaluacion_1` FOREIGN KEY (`tevaluacion_idevaluacion`) REFERENCES `tevaluacion` (`idevaluacion`),
  ADD CONSTRAINT `fk_tevaluacion_item_titem_1` FOREIGN KEY (`titem_iditem`) REFERENCES `titem` (`iditem`);

--
-- Filtros para la tabla `tfamiliar`
--
ALTER TABLE `tfamiliar`
  ADD CONSTRAINT `fk_tfamiliar_tdiagnostico1` FOREIGN KEY (`tdiagnostico_iddiagnostico`) REFERENCES `tdiagnostico` (`iddiagnostico`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tinscripcion`
--
ALTER TABLE `tinscripcion`
  ADD CONSTRAINT `fk_tinscripcion_tparticipante` FOREIGN KEY (`idparticipante`) REFERENCES `tparticipante` (`idparticipante`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tinstitucion`
--
ALTER TABLE `tinstitucion`
  ADD CONSTRAINT `fk_tinstitucion_tlocalidad1` FOREIGN KEY (`tlocalidad_idlocalidad`) REFERENCES `tlocalidad` (`idlocalidad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tinstrumento`
--
ALTER TABLE `tinstrumento`
  ADD CONSTRAINT `fk_tinstrumento_tasignatura_1` FOREIGN KEY (`tasignatura_idasignatura`) REFERENCES `tasignatura` (`idasignatura`);

--
-- Filtros para la tabla `tinstrumento_item`
--
ALTER TABLE `tinstrumento_item`
  ADD CONSTRAINT `fk_tinstrumento_item_titem_1` FOREIGN KEY (`titem_iditem`) REFERENCES `titem` (`iditem`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tinstrumento_item_ibfk_1` FOREIGN KEY (`tinstrumento_idinstrumento`) REFERENCES `tinstrumento` (`idinstrumento`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tlocalidad`
--
ALTER TABLE `tlocalidad`
  ADD CONSTRAINT `fk_tlocalidad_tmunicipio1` FOREIGN KEY (`tmunicipio_municipio`) REFERENCES `tmunicipio` (`idmunicipio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tmodulo_trol`
--
ALTER TABLE `tmodulo_trol`
  ADD CONSTRAINT `fk_tmodulo_has_trol_tmodulo1` FOREIGN KEY (`idmodulo`) REFERENCES `tmodulo` (`idmodulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tmodulo_has_trol_trol1` FOREIGN KEY (`idrol`) REFERENCES `trol` (`idrol`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tobjetivo`
--
ALTER TABLE `tobjetivo`
  ADD CONSTRAINT `fk_tobjetivo_tunidad_1` FOREIGN KEY (`tunidad_idunidad`) REFERENCES `tunidad` (`idunidad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tparticipante`
--
ALTER TABLE `tparticipante`
  ADD CONSTRAINT `fk_tparticipante_tdiagnostico1` FOREIGN KEY (`tdiagnostico_iddiagnostico`) REFERENCES `tdiagnostico` (`iddiagnostico`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tpregunta`
--
ALTER TABLE `tpregunta`
  ADD CONSTRAINT `fk_tpregunta_tusuario1` FOREIGN KEY (`tusuario_idusuario`) REFERENCES `tusuario` (`idusuario`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tservicio`
--
ALTER TABLE `tservicio`
  ADD CONSTRAINT `fk_tservicio_tmodulo1` FOREIGN KEY (`idmodulo`) REFERENCES `tmodulo` (`idmodulo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tservicio_trol`
--
ALTER TABLE `tservicio_trol`
  ADD CONSTRAINT `fk_tservicio_has_trol_trol1` FOREIGN KEY (`idrol`) REFERENCES `trol` (`idrol`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tservicio_has_trol_tservicio1` FOREIGN KEY (`idservicio`) REFERENCES `tservicio` (`idservicio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tunidad`
--
ALTER TABLE `tunidad`
  ADD CONSTRAINT `tunidad_ibfk_1` FOREIGN KEY (`tasignatura_idasignatura`) REFERENCES `tasignatura` (`idasignatura`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tusuario`
--
ALTER TABLE `tusuario`
  ADD CONSTRAINT `fk_tusuario_trol1` FOREIGN KEY (`trol_idrol`) REFERENCES `trol` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tvalor_item`
--
ALTER TABLE `tvalor_item`
  ADD CONSTRAINT `fk_tvalor_item_titem` FOREIGN KEY (`titem_iditem`) REFERENCES `titem` (`iditem`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
