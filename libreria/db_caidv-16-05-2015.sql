DROP TABLE participante_familiar;

CREATE TABLE `participante_familiar` (
  `tparticipante_idparticipante` int(11) NOT NULL,
  `tfamiliar_idfamiliar` char(9) NOT NULL,
  `idparentesco` int(11) NOT NULL,
  `representante` char(1) NOT NULL DEFAULT '0',
  `estatus` char(1) DEFAULT '1',
  PRIMARY KEY (`tparticipante_idparticipante`,`tfamiliar_idfamiliar`),
  KEY `fk_tparticipante_has_tfamiliar_tfamiliar1_idx` (`tfamiliar_idfamiliar`),
  KEY `fk_tparticipante_has_tfamiliar_tparticipante1_idx` (`tparticipante_idparticipante`),
  KEY `fk_tparticipante_has_tfamiliar_tparentesco1_idx` (`idparentesco`),
  CONSTRAINT `fk_tparticipante_has_tfamiliar_tparentesco1` FOREIGN KEY (`idparentesco`) REFERENCES `tparentesco` (`idparentesco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `participante_familiar_ibfk_1` FOREIGN KEY (`tparticipante_idparticipante`) REFERENCES `tparticipante` (`idparticipante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `participante_familiar_ibfk_2` FOREIGN KEY (`tfamiliar_idfamiliar`) REFERENCES `tfamiliar` (`idfamiliar`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO participante_familiar VALUES("1","9837744","2","1","1");
INSERT INTO participante_familiar VALUES("2","11078708","2","1","1");
INSERT INTO participante_familiar VALUES("3","15493031","2","1","1");
INSERT INTO participante_familiar VALUES("4","16964940","2","1","1");
INSERT INTO participante_familiar VALUES("5","19170250","2","1","1");
INSERT INTO participante_familiar VALUES("6","11540170","1","0","1");
INSERT INTO participante_familiar VALUES("6","11847486","2","1","1");
INSERT INTO participante_familiar VALUES("7","11542861","2","1","1");
INSERT INTO participante_familiar VALUES("8","20157379","2","1","1");
INSERT INTO participante_familiar VALUES("9","18732314","2","1","1");
INSERT INTO participante_familiar VALUES("10","99999999","10","1","1");
INSERT INTO participante_familiar VALUES("11","17364390","2","1","1");
INSERT INTO participante_familiar VALUES("12","99999999","10","1","1");
INSERT INTO participante_familiar VALUES("13","99999999","10","1","1");
INSERT INTO participante_familiar VALUES("14","11079158","2","1","1");
INSERT INTO participante_familiar VALUES("15","99999999","10","1","1");
INSERT INTO participante_familiar VALUES("16","21563851","2","1","1");
INSERT INTO participante_familiar VALUES("17","99999999","10","1","1");
INSERT INTO participante_familiar VALUES("18","99999999","10","1","1");
INSERT INTO participante_familiar VALUES("19","99999999","10","1","1");
INSERT INTO participante_familiar VALUES("20","99999999","10","1","1");



DROP TABLE tacceso;

CREATE TABLE `tacceso` (
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
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8;

INSERT INTO tacceso VALUES("2","Administrador","1","2015-03-19 23:49:26","2015-03-23 19:03:51","2015-03-20 00:10:59","127.0.0.1","0");
INSERT INTO tacceso VALUES("4","Administrador","1","2015-03-20 10:29:34","2015-03-23 19:03:51","2015-03-20 11:29:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("5","Administrador","1","2015-03-23 18:03:03","2015-03-23 19:03:51","2015-03-23 18:29:11","192.168.1.100","0");
INSERT INTO tacceso VALUES("6","15491963","1","2015-03-23 18:14:19","2015-03-23 18:19:22","2015-03-23 18:18:54","192.168.1.80","0");
INSERT INTO tacceso VALUES("7","15491963","1","2015-03-23 18:22:12","2015-03-23 20:10:54","2015-03-23 18:45:35","192.168.1.80","0");
INSERT INTO tacceso VALUES("8","17960877","1","2015-03-23 18:39:06","2015-03-23 20:14:02","2015-03-23 20:12:12","192.168.1.102","0");
INSERT INTO tacceso VALUES("9","Administrador","1","2015-03-23 19:04:24","2015-03-23 20:38:17","2015-03-23 20:37:30","192.168.1.100","0");
INSERT INTO tacceso VALUES("10","15491963","0","2015-03-23 19:23:47","","0000-00-00 00:00:00","::1","0");
INSERT INTO tacceso VALUES("11","155491963","0","2015-03-23 19:24:12","","0000-00-00 00:00:00","::1","0");
INSERT INTO tacceso VALUES("12","15491963","0","2015-03-23 19:24:59","","0000-00-00 00:00:00","::1","0");
INSERT INTO tacceso VALUES("13","15491963","0","2015-03-23 19:25:33","","0000-00-00 00:00:00","::1","0");
INSERT INTO tacceso VALUES("14","15491963","0","2015-03-23 19:26:06","","0000-00-00 00:00:00","::1","0");
INSERT INTO tacceso VALUES("15","15491963","0","2015-03-23 19:35:48","","0000-00-00 00:00:00","192.168.1.80","0");
INSERT INTO tacceso VALUES("16","15491963","0","2015-03-23 19:41:32","","0000-00-00 00:00:00","::1","0");
INSERT INTO tacceso VALUES("17","12526145","1","2015-03-23 19:46:39","2015-03-23 19:50:24","2015-03-23 19:50:17","192.168.1.103","0");
INSERT INTO tacceso VALUES("18","15491963","1","2015-03-23 19:49:20","2015-03-23 20:10:54","2015-03-23 19:58:37","::1","0");
INSERT INTO tacceso VALUES("19","12526145","1","2015-03-23 19:51:28","2015-03-23 20:09:34","2015-03-23 19:52:19","192.168.1.103","0");
INSERT INTO tacceso VALUES("20","12526145","1","2015-03-23 20:10:14","2015-03-23 20:10:42","2015-03-23 20:10:31","192.168.1.103","0");
INSERT INTO tacceso VALUES("21","15491963","1","2015-03-23 20:11:24","2015-03-23 20:38:31","2015-03-23 20:24:52","::1","0");
INSERT INTO tacceso VALUES("22","12526145","1","2015-03-23 20:14:21","2015-03-23 20:17:07","2015-03-23 20:17:02","192.168.1.103","0");
INSERT INTO tacceso VALUES("23","17960877","1","2015-03-23 20:15:20","2015-03-23 20:26:43","2015-03-23 20:15:36","192.168.1.102","0");
INSERT INTO tacceso VALUES("24","17960877","1","2015-03-23 20:27:04","2015-03-24 18:39:56","2015-03-23 20:46:20","192.168.1.102","0");
INSERT INTO tacceso VALUES("25","12526145","1","2015-03-23 20:36:19","2015-03-24 18:35:01","2015-03-23 20:36:54","192.168.1.103","0");
INSERT INTO tacceso VALUES("26","15491963","1","2015-03-24 18:14:24","2015-03-24 19:54:11","2015-03-24 18:47:42","::1","0");
INSERT INTO tacceso VALUES("27","12526145","1","2015-03-24 18:35:28","2015-03-24 18:44:30","2015-03-24 18:35:52","192.168.1.100","0");
INSERT INTO tacceso VALUES("28","Administrador","1","2015-03-24 18:42:25","2015-03-24 20:08:52","2015-03-24 20:08:43","192.168.1.102","0");
INSERT INTO tacceso VALUES("29","12526145","1","2015-03-24 18:45:58","2015-03-24 18:56:34","2015-03-24 18:55:39","192.168.1.100","0");
INSERT INTO tacceso VALUES("30","17960877","1","2015-03-24 18:55:04","2015-03-24 19:03:09","2015-03-24 19:01:16","192.168.1.101","0");
INSERT INTO tacceso VALUES("31","12526145","1","2015-03-24 18:57:22","2015-03-24 19:15:21","2015-03-24 19:13:42","192.168.1.100","0");
INSERT INTO tacceso VALUES("32","17960877","1","2015-03-24 19:06:42","2015-03-24 19:11:06","2015-03-24 19:10:58","192.168.1.101","0");
INSERT INTO tacceso VALUES("33","17960877","1","2015-03-24 19:12:35","2015-03-24 19:15:04","2015-03-24 19:14:41","192.168.1.101","0");
INSERT INTO tacceso VALUES("34","17960877","1","2015-03-24 19:16:40","2015-03-24 20:08:40","2015-03-24 20:06:53","192.168.1.101","0");
INSERT INTO tacceso VALUES("35","12526145","1","2015-03-24 19:19:16","2015-03-24 22:13:51","2015-03-24 22:08:53","192.168.1.100","0");
INSERT INTO tacceso VALUES("36","18672728","1","2015-03-24 19:39:40","2015-03-24 19:48:38","2015-03-24 19:45:23","192.168.1.103","0");
INSERT INTO tacceso VALUES("37","15491963","1","2015-03-24 20:14:03","2015-05-04 14:55:47","2015-03-24 21:13:31","::1","0");
INSERT INTO tacceso VALUES("40","18672728","1","2015-03-24 21:12:54","2015-03-24 22:15:12","2015-03-24 22:12:29","192.168.1.104","0");
INSERT INTO tacceso VALUES("41","15491963","1","2015-03-24 21:51:33","2015-05-04 14:55:47","2015-03-24 21:57:24","::1","0");
INSERT INTO tacceso VALUES("42","15491963","1","2015-03-25 00:02:51","2015-05-04 14:55:47","2015-03-25 00:08:55","::1","0");
INSERT INTO tacceso VALUES("44","Administrador","1","2015-03-26 08:57:18","2015-03-26 12:21:22","2015-03-26 12:01:36","127.0.0.1","0");
INSERT INTO tacceso VALUES("45","ADMINISTRADOR","1","2015-03-27 10:03:15","2015-03-27 10:58:13","2015-03-27 10:46:55","127.0.0.1","0");
INSERT INTO tacceso VALUES("46","Administrador","1","2013-04-23 08:49:20","2013-04-23 15:26:58","2013-04-23 13:11:38","127.0.0.1","0");
INSERT INTO tacceso VALUES("47","Administrador","1","2013-04-23 13:57:29","2013-04-23 15:40:11","2013-04-23 15:32:28","127.0.0.1","0");
INSERT INTO tacceso VALUES("48","Administrador","1","2015-05-22 14:14:35","2015-05-22 16:04:11","2015-05-22 16:04:08","127.0.0.1","0");
INSERT INTO tacceso VALUES("49","Administrador","1","2015-05-22 16:55:19","","2015-05-22 18:44:13","127.0.0.1","0");
INSERT INTO tacceso VALUES("50","Administrador","1","2015-05-22 17:37:10","2015-05-22 19:10:24","2015-05-22 19:09:11","127.0.0.1","0");
INSERT INTO tacceso VALUES("54","15491963","0","2015-04-23 00:03:42","","0000-00-00 00:00:00","::1","0");
INSERT INTO tacceso VALUES("55","15491963","1","2015-04-23 00:04:19","2015-05-04 14:55:47","2015-04-23 00:05:50","::1","0");
INSERT INTO tacceso VALUES("56","15491963","1","2015-04-23 00:24:26","2015-05-04 14:55:47","2015-04-23 00:26:13","::1","0");
INSERT INTO tacceso VALUES("57","15491963","1","2015-04-23 09:28:21","2015-04-23 09:43:46","2015-04-23 09:32:54","::1","0");
INSERT INTO tacceso VALUES("58","15491963","1","2015-04-23 15:02:45","2015-05-04 14:55:47","2015-04-23 15:09:07","::1","0");
INSERT INTO tacceso VALUES("59","15491963","1","2015-04-24 15:18:13","2015-05-04 14:55:47","2015-04-24 15:30:28","::1","0");
INSERT INTO tacceso VALUES("60","15491963","1","2015-04-24 16:31:44","2015-05-04 14:55:47","2015-04-24 16:31:52","::1","0");
INSERT INTO tacceso VALUES("61","15491963","1","2015-04-24 16:45:58","2015-04-24 18:20:14","2015-04-24 18:13:20","::1","0");
INSERT INTO tacceso VALUES("62","15491963","1","2015-04-24 20:32:24","2015-05-04 14:55:47","2015-04-24 20:53:26","::1","0");
INSERT INTO tacceso VALUES("63","15491963","1","2015-04-24 21:29:28","2015-05-04 14:55:47","2015-04-24 21:29:47","::1","0");
INSERT INTO tacceso VALUES("64","15491963","1","2015-04-25 00:36:48","2015-04-25 02:31:26","2015-04-25 02:31:23","::1","0");
INSERT INTO tacceso VALUES("65","15491963","1","2015-04-25 15:09:22","2015-05-04 14:55:47","2015-04-25 15:09:42","::1","0");
INSERT INTO tacceso VALUES("66","15491963","1","2015-04-25 16:25:08","2015-05-04 14:55:47","2015-04-25 17:34:50","::1","0");
INSERT INTO tacceso VALUES("67","15491963","1","2015-04-26 11:46:49","2015-04-26 12:25:48","2015-04-26 12:25:08","::1","0");
INSERT INTO tacceso VALUES("68","15491963","1","2015-04-26 12:26:56","2015-04-26 12:31:15","2015-04-26 12:31:12","::1","0");
INSERT INTO tacceso VALUES("69","15491963","1","2015-04-26 12:32:34","2015-04-26 16:29:27","2015-04-26 16:29:19","::1","0");
INSERT INTO tacceso VALUES("70","15491963","1","2015-04-26 22:53:12","2015-05-04 14:55:47","2015-04-27 02:18:34","::1","0");
INSERT INTO tacceso VALUES("71","15491963","1","2015-04-27 02:27:16","2015-05-04 14:55:47","2015-04-27 02:27:34","::1","0");
INSERT INTO tacceso VALUES("72","15491963","1","2015-04-27 09:14:36","2015-05-04 14:55:47","2015-04-27 10:21:49","::1","0");
INSERT INTO tacceso VALUES("73","15491963","1","2015-04-27 14:46:55","2015-05-04 14:55:47","2015-04-27 17:32:36","::1","0");
INSERT INTO tacceso VALUES("74","15491963","1","2015-04-27 20:01:20","2015-04-27 20:18:00","2015-04-27 20:17:59","::1","0");
INSERT INTO tacceso VALUES("75","15491963","1","2015-04-27 20:18:45","2015-05-04 14:55:47","2015-04-27 20:18:57","::1","0");
INSERT INTO tacceso VALUES("76","15491963","0","2015-04-27 20:21:45","","0000-00-00 00:00:00","::1","0");
INSERT INTO tacceso VALUES("77","15491963","1","2015-04-27 20:22:22","2015-05-04 14:55:47","2015-04-27 22:44:02","::1","0");
INSERT INTO tacceso VALUES("78","15491963","1","2015-04-28 21:10:39","2015-05-04 14:55:47","2015-04-28 22:12:02","::1","0");
INSERT INTO tacceso VALUES("79","15491963","1","2015-04-29 00:00:34","2015-05-04 14:55:47","2015-04-29 00:57:45","::1","0");
INSERT INTO tacceso VALUES("80","15491963","1","2015-04-29 01:01:03","2015-05-04 14:55:47","2015-04-29 01:01:11","::1","0");
INSERT INTO tacceso VALUES("81","15491963","1","2015-04-29 09:15:33","2015-05-04 14:55:47","2015-04-29 10:45:43","::1","0");
INSERT INTO tacceso VALUES("82","15491963","1","2015-04-29 11:22:37","2015-05-04 14:55:47","2015-04-29 12:06:47","::1","0");
INSERT INTO tacceso VALUES("83","15491963","1","2015-04-29 13:22:32","2015-05-04 14:55:47","2015-04-29 16:12:47","::1","0");
INSERT INTO tacceso VALUES("84","15491963","1","2015-04-29 16:28:23","2015-05-04 14:55:47","2015-04-29 16:37:00","::1","0");
INSERT INTO tacceso VALUES("85","15491963","1","2015-04-29 17:26:15","2015-05-04 14:55:47","2015-04-29 17:44:31","::1","0");
INSERT INTO tacceso VALUES("86","15491963","1","2015-04-29 19:54:57","2015-04-29 20:47:07","2015-04-29 20:47:04","::1","0");
INSERT INTO tacceso VALUES("87","15491963","1","2015-05-01 14:33:22","2015-05-01 14:37:39","2015-05-01 14:37:21","::1","0");
INSERT INTO tacceso VALUES("88","15491963","1","2015-05-01 15:06:16","2015-05-01 17:45:35","2015-05-01 17:45:30","::1","0");
INSERT INTO tacceso VALUES("89","12526145","0","2015-05-01 15:07:57","","0000-00-00 00:00:00","192.168.1.100","0");
INSERT INTO tacceso VALUES("90","12526145","1","2015-05-01 15:08:33","2015-05-01 17:52:27","2015-05-01 17:47:44","192.168.1.100","0");
INSERT INTO tacceso VALUES("91","Administrador","0","2015-05-01 16:09:51","","0000-00-00 00:00:00","192.168.1.102","0");
INSERT INTO tacceso VALUES("92","15491963","0","2015-05-01 17:46:05","","0000-00-00 00:00:00","::1","0");
INSERT INTO tacceso VALUES("93","15491963","1","2015-05-01 17:46:29","2015-05-01 18:09:58","2015-05-01 18:02:39","::1","0");
INSERT INTO tacceso VALUES("94","15491963","1","2015-05-01 19:29:56","2015-05-04 14:55:47","2015-05-01 19:31:57","::1","0");
INSERT INTO tacceso VALUES("95","15491963","1","2015-05-02 01:28:47","2015-05-02 02:24:54","2015-05-02 02:24:50","::1","0");
INSERT INTO tacceso VALUES("96","15491963","1","2015-05-02 03:04:22","2015-05-02 03:11:01","2015-05-02 03:10:58","::1","0");
INSERT INTO tacceso VALUES("97","15491963","1","2015-05-02 03:14:17","2015-05-02 03:15:18","2015-05-02 03:15:11","::1","0");
INSERT INTO tacceso VALUES("98","15491963","1","2015-05-02 03:15:55","2015-05-02 03:19:44","2015-05-02 03:19:41","::1","0");
INSERT INTO tacceso VALUES("99","15491963","1","2015-05-02 07:09:38","2015-05-02 07:11:48","2015-05-02 07:10:46","::1","0");
INSERT INTO tacceso VALUES("100","15491963","1","2015-05-02 08:33:27","2015-05-02 08:54:14","2015-05-02 08:51:25","::1","0");
INSERT INTO tacceso VALUES("101","15491963","1","2015-05-02 08:54:39","2015-05-04 14:55:47","2015-05-02 08:54:46","::1","0");
INSERT INTO tacceso VALUES("102","15491963","1","2015-05-02 08:59:56","2015-05-02 09:10:32","2015-05-02 09:10:22","::1","0");
INSERT INTO tacceso VALUES("103","15491963","1","2015-05-02 09:31:52","2015-05-02 10:07:55","2015-05-02 10:07:17","::1","0");
INSERT INTO tacceso VALUES("104","15491963","1","2015-05-02 10:10:46","2015-05-02 10:54:26","2015-05-02 10:51:06","::1","0");
INSERT INTO tacceso VALUES("105","15491963","1","2015-05-02 12:26:41","2015-05-02 12:57:15","2015-05-02 12:56:13","::1","0");
INSERT INTO tacceso VALUES("106","15491963","1","2015-05-03 17:25:23","2015-05-04 14:55:47","2015-05-03 18:36:35","::1","0");
INSERT INTO tacceso VALUES("107","15491963","1","2015-05-03 19:01:42","2015-05-04 14:55:47","2015-05-03 19:04:02","::1","0");
INSERT INTO tacceso VALUES("108","15491963","1","2015-05-03 23:34:54","2015-05-04 14:55:47","2015-05-04 01:10:35","::1","0");
INSERT INTO tacceso VALUES("109","15491963","1","2015-05-04 01:19:11","2015-05-04 01:20:47","2015-05-04 01:20:37","::1","0");
INSERT INTO tacceso VALUES("110","15491963","1","2015-05-04 09:13:07","2015-05-04 14:55:47","2015-05-04 10:53:54","::1","0");
INSERT INTO tacceso VALUES("111","15491963","1","2015-05-04 14:56:02","2015-05-04 16:51:32","2015-05-04 16:50:46","::1","0");
INSERT INTO tacceso VALUES("112","15491963","1","2015-05-04 17:54:29","2015-05-04 18:17:45","2015-05-04 18:17:25","::1","0");
INSERT INTO tacceso VALUES("113","15491963","1","2015-05-04 19:55:31","2015-05-04 21:25:48","2015-05-04 21:25:42","::1","0");
INSERT INTO tacceso VALUES("114","15491963","1","2015-05-04 22:22:38","2015-05-04 22:48:02","2015-05-04 22:45:43","::1","0");
INSERT INTO tacceso VALUES("115","15491963","1","2015-05-04 22:49:57","2015-05-04 23:33:47","2015-05-04 23:33:37","::1","0");
INSERT INTO tacceso VALUES("116","15491963","1","2015-05-05 09:56:55","","2015-05-05 10:27:56","::1","0");
INSERT INTO tacceso VALUES("117","15491963","1","2015-05-05 14:40:37","","2015-05-05 16:00:04","::1","0");
INSERT INTO tacceso VALUES("118","15491963","1","2015-05-05 21:34:29","2015-05-06 01:19:40","2015-05-06 01:19:34","::1","0");
INSERT INTO tacceso VALUES("119","15491963","1","2015-05-06 09:02:49","","2015-05-06 11:56:09","::1","0");
INSERT INTO tacceso VALUES("120","15491963","1","2015-05-06 14:55:07","2015-05-06 15:54:24","2015-05-06 15:54:12","::1","0");
INSERT INTO tacceso VALUES("121","15491963","0","2015-05-06 20:31:20","","0000-00-00 00:00:00","::1","0");
INSERT INTO tacceso VALUES("122","15491963","1","2015-05-06 20:31:34","","2015-05-06 20:31:35","::1","0");
INSERT INTO tacceso VALUES("123","15491963","1","2015-05-06 20:31:35","","2015-05-06 20:45:50","::1","0");
INSERT INTO tacceso VALUES("124","15491963","1","2015-05-06 20:47:32","2015-05-06 21:56:57","2015-05-06 21:56:13","::1","0");
INSERT INTO tacceso VALUES("125","155491963","0","2015-05-07 09:20:29","","0000-00-00 00:00:00","::1","0");
INSERT INTO tacceso VALUES("126","15491963","1","2015-05-07 09:20:57","","2015-05-07 11:54:41","::1","0");
INSERT INTO tacceso VALUES("127","15491963","1","2015-05-07 14:19:08","","2015-05-07 17:42:37","::1","0");
INSERT INTO tacceso VALUES("128","Administrador","1","2015-05-07 20:10:06","2015-05-07 20:10:58","2015-05-07 20:10:13","127.0.0.1","0");
INSERT INTO tacceso VALUES("129","Administrador","0","2015-05-07 20:11:48","","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("130","Administrador","1","2015-05-07 20:11:54","2015-05-08 02:46:50","2015-05-08 02:41:27","127.0.0.1","0");
INSERT INTO tacceso VALUES("131","15491963","1","2015-05-08 09:56:02","2015-05-09 09:15:46","2015-05-08 10:59:19","::1","0");
INSERT INTO tacceso VALUES("132","145491963","0","2015-05-08 11:39:34","","0000-00-00 00:00:00","::1","0");
INSERT INTO tacceso VALUES("133","15491963","1","2015-05-08 11:39:49","2015-05-09 09:15:46","2015-05-08 11:57:56","::1","0");
INSERT INTO tacceso VALUES("134","15491963","1","2015-05-08 14:18:57","2015-05-08 15:33:22","2015-05-08 15:33:09","::1","0");
INSERT INTO tacceso VALUES("135","15491963","1","2015-05-08 19:43:42","2015-05-08 21:37:22","2015-05-08 21:36:19","::1","0");
INSERT INTO tacceso VALUES("136","15491963","1","2015-05-08 21:51:29","2015-05-09 09:15:46","2015-05-08 22:31:43","::1","0");
INSERT INTO tacceso VALUES("137","15491963","1","2015-05-09 07:32:07","2015-05-09 08:10:42","2015-05-09 08:10:40","::1","0");
INSERT INTO tacceso VALUES("138","15491963","0","2015-05-09 08:11:57","","0000-00-00 00:00:00","::1","0");
INSERT INTO tacceso VALUES("139","15491963","0","2015-05-09 08:12:08","","0000-00-00 00:00:00","::1","0");
INSERT INTO tacceso VALUES("140","15491963","1","2015-05-09 08:12:21","2015-05-09 09:15:46","2015-05-09 08:12:52","::1","0");
INSERT INTO tacceso VALUES("141","Admministrador","0","2015-05-09 09:16:19","","0000-00-00 00:00:00","::1","0");
INSERT INTO tacceso VALUES("142","Administrador","0","2015-05-09 09:16:42","","0000-00-00 00:00:00","::1","0");
INSERT INTO tacceso VALUES("143","Administrador","0","2015-05-09 09:17:08","","0000-00-00 00:00:00","::1","0");
INSERT INTO tacceso VALUES("144","Administrador","0","2015-05-09 09:17:33","","0000-00-00 00:00:00","::1","0");
INSERT INTO tacceso VALUES("145","Administrador","1","2015-05-09 09:20:06","2015-05-09 09:33:31","2015-05-09 09:23:46","::1","0");
INSERT INTO tacceso VALUES("146","15491963","1","2015-05-09 09:33:47","2015-05-09 10:43:35","2015-05-09 10:40:25","::1","0");
INSERT INTO tacceso VALUES("147","15491963","1","2015-05-13 21:53:31","","2015-05-13 22:54:17","::1","1");
INSERT INTO tacceso VALUES("148","15491963","1","2015-05-13 22:57:50","","2015-05-13 22:57:59","::1","1");
INSERT INTO tacceso VALUES("149","15491963","1","2015-05-13 23:00:10","2015-05-13 23:26:57","2015-05-13 23:25:43","::1","0");
INSERT INTO tacceso VALUES("150","15491963","1","2015-05-13 23:33:26","2015-05-14 00:19:51","2015-05-14 00:14:17","::1","0");
INSERT INTO tacceso VALUES("151","15491963","0","2015-05-14 00:35:20","","0000-00-00 00:00:00","::1","0");
INSERT INTO tacceso VALUES("152","15491963","1","2015-05-14 00:35:47","","2015-05-14 00:56:52","::1","1");
INSERT INTO tacceso VALUES("153","15491963","0","2015-05-16 09:51:14","","0000-00-00 00:00:00","::1","0");
INSERT INTO tacceso VALUES("154","15491963","0","2015-05-16 09:51:36","","0000-00-00 00:00:00","::1","0");
INSERT INTO tacceso VALUES("155","15491963","1","2015-05-16 09:52:01","","2015-05-16 10:15:28","::1","1");



DROP TABLE tarea_conocimiento;

CREATE TABLE `tarea_conocimiento` (
  `idarea_conocimiento` int(11) NOT NULL AUTO_INCREMENT,
  `nombreare` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `estatusare` char(1) COLLATE utf8_spanish2_ci DEFAULT '1',
  PRIMARY KEY (`idarea_conocimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO tarea_conocimiento VALUES("1","ATENCION INTEGRAL TEMPRANA","1");
INSERT INTO tarea_conocimiento VALUES("2","BRAILLE LECTURA Y ESCRITURA","1");
INSERT INTO tarea_conocimiento VALUES("3","ORIENTACION Y MOVILIDAD","1");
INSERT INTO tarea_conocimiento VALUES("4","ACTIVIDADES DE LA VIDA DIARIA","1");
INSERT INTO tarea_conocimiento VALUES("5","DEPORTE Y RECREACION","1");
INSERT INTO tarea_conocimiento VALUES("6","ESTIMULACION VISUAL","1");
INSERT INTO tarea_conocimiento VALUES("7","TECNICAS DE INFORMACION  Y COMUNICACION","1");



DROP TABLE tasignatura;

CREATE TABLE `tasignatura` (
  `idasignatura` int(11) NOT NULL AUTO_INCREMENT,
  `nombreasi` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `horasteoricas` int(11) DEFAULT NULL,
  `horaspracticas` int(11) DEFAULT NULL,
  `tarea_idarea_conocimiento` int(11) NOT NULL,
  `estatusasi` char(1) COLLATE utf8_spanish2_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`idasignatura`),
  KEY `tarea_idarea_conocimiento` (`tarea_idarea_conocimiento`),
  CONSTRAINT `tasignatura_ibfk_1` FOREIGN KEY (`tarea_idarea_conocimiento`) REFERENCES `tarea_conocimiento` (`idarea_conocimiento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO tasignatura VALUES("1","INFORMATICA","4","4","7","1");
INSERT INTO tasignatura VALUES("2","AVD","2","3","4","1");
INSERT INTO tasignatura VALUES("3","BRAILLE","2","4","2","1");
INSERT INTO tasignatura VALUES("4","ATENCION TEMPRANA","1","4","1","1");



DROP TABLE tasistencia;

CREATE TABLE `tasistencia` (
  `idasistencia` int(11) NOT NULL AUTO_INCREMENT,
  `idcurso_idparticipante` int(11) NOT NULL,
  `fechaasi` date NOT NULL,
  `asistenciaasi` char(1) COLLATE utf8_spanish2_ci NOT NULL,
  `observacionasi` text COLLATE utf8_spanish2_ci,
  PRIMARY KEY (`idasistencia`),
  KEY `fk_tasistencia_tcurso_tparticipante_1` (`idcurso_idparticipante`),
  CONSTRAINT `fk_tasistencia_tcurso_tparticipante_1` FOREIGN KEY (`idcurso_idparticipante`) REFERENCES `tcurso_tparticipante` (`idcurso_participante`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO tasistencia VALUES("1","1","2015-05-09","1","");
INSERT INTO tasistencia VALUES("2","2","2015-05-09","1","");
INSERT INTO tasistencia VALUES("3","3","2015-05-09","1","");
INSERT INTO tasistencia VALUES("4","4","2015-05-09","1","");
INSERT INTO tasistencia VALUES("5","5","2015-05-09","1","");



DROP TABLE tasistencia_objetivo;

CREATE TABLE `tasistencia_objetivo` (
  `tasistencia_idasistencia` int(11) NOT NULL,
  `tobjetivo_idobjetivo` int(11) NOT NULL,
  KEY `tasistencia_idasistencia` (`tasistencia_idasistencia`),
  KEY `tobjetivo_idobjetivo` (`tobjetivo_idobjetivo`),
  CONSTRAINT `tasistencia_objetivo_ibfk_1` FOREIGN KEY (`tasistencia_idasistencia`) REFERENCES `tasistencia` (`idasistencia`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `tasistencia_objetivo_ibfk_2` FOREIGN KEY (`tobjetivo_idobjetivo`) REFERENCES `tobjetivo` (`idobjetivo`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO tasistencia_objetivo VALUES("1","9");
INSERT INTO tasistencia_objetivo VALUES("2","9");
INSERT INTO tasistencia_objetivo VALUES("3","9");
INSERT INTO tasistencia_objetivo VALUES("4","9");
INSERT INTO tasistencia_objetivo VALUES("5","9");



DROP TABLE tasistencia_unidad;

CREATE TABLE `tasistencia_unidad` (
  `tasistencia_idasistencia` int(11) NOT NULL,
  `tunidad_idunidad` int(11) NOT NULL,
  KEY `tasistencia_idasistencia` (`tasistencia_idasistencia`),
  KEY `tunidad_idunidad` (`tunidad_idunidad`),
  CONSTRAINT `tasistencia_unidad_ibfk_1` FOREIGN KEY (`tasistencia_idasistencia`) REFERENCES `tasistencia` (`idasistencia`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `tasistencia_unidad_ibfk_2` FOREIGN KEY (`tunidad_idunidad`) REFERENCES `tunidad` (`idunidad`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO tasistencia_unidad VALUES("1","5");
INSERT INTO tasistencia_unidad VALUES("2","5");
INSERT INTO tasistencia_unidad VALUES("3","5");
INSERT INTO tasistencia_unidad VALUES("4","5");
INSERT INTO tasistencia_unidad VALUES("5","5");



DROP TABLE taula;

CREATE TABLE `taula` (
  `idaula` int(11) NOT NULL AUTO_INCREMENT,
  `nombreaul` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `tipoaul` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `capacidadaul` int(3) NOT NULL,
  `estatusaul` char(1) COLLATE utf8_spanish2_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`idaula`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO taula VALUES("1","AULA 1","AULA","18","1");
INSERT INTO taula VALUES("2","AULA 2","AULA","20","1");
INSERT INTO taula VALUES("3","AULA 3","AULA","20","1");
INSERT INTO taula VALUES("4","AULA 4","AULA","18","1");
INSERT INTO taula VALUES("5","AULA 5","AULA","18","1");
INSERT INTO taula VALUES("6","AULA 6","AULA","17","1");
INSERT INTO taula VALUES("7","AULA 7","AULA","16","1");
INSERT INTO taula VALUES("8","CBIT","LABORATORIO","20","1");
INSERT INTO taula VALUES("9","CANCHA MULTIPLE","CANCHA","30","1");



DROP TABLE tbitacora;

CREATE TABLE `tbitacora` (
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
) ENGINE=InnoDB AUTO_INCREMENT=7340 DEFAULT CHARSET=utf8;

INSERT INTO tbitacora VALUES("2001","http://localhost/CAIDV/vista/intranet.php?vista=sistema/configurar","2015-04-26 07:04:00","<blockquote>\n<h4>Así comenzó la educación de las personas con discapacidad visual del Estado Por","<ul>\n<li>\n<p>Así comenzó la educación de las personas con discapacidad visual del Estado Portug","::1","Error en los datos","Modificar","historia","tsistema","15491963","editar_configuracion");
INSERT INTO tbitacora VALUES("2002","/CAIDV/vista/intranet.php?vista=sistema/configurar","2015-04-26 07:04:00","","","::1","-","Navegar","-","-","15491963","sistema/configurar");
INSERT INTO tbitacora VALUES("2003","http://localhost/CAIDV/vista/intranet.php?vista=sistema/configurar","2015-04-26 07:04:00","<ul>\n<li>\n<p>Así comenzó la educación de las personas con discapacidad visual del Estado Portug","<p>Así comenzó la educación de las personas con discapacidad visual del Estado Portuguesa, con un","::1","Error en los datos","Modificar","historia","tsistema","15491963","editar_configuracion");
INSERT INTO tbitacora VALUES("2004","/CAIDV/vista/intranet.php?vista=sistema/configurar","2015-04-26 07:04:00","","","::1","-","Navegar","-","-","15491963","sistema/configurar");
INSERT INTO tbitacora VALUES("2005","http://localhost/CAIDV/vista/intranet.php?vista=sistema/configurar","2015-04-26 07:04:00","<p>Así comenzó la educación de las personas con discapacidad visual del Estado Portuguesa, con un","<p>Así comenzó la educación de las personas con discapacidad visual del Estado Portuguesa, con un","::1","Error en los datos","Modificar","historia","tsistema","15491963","editar_configuracion");
INSERT INTO tbitacora VALUES("2006","/CAIDV/vista/intranet.php?vista=sistema/configurar","2015-04-26 07:04:00","","","::1","-","Navegar","-","-","15491963","sistema/configurar");
INSERT INTO tbitacora VALUES("2007","http://localhost/CAIDV/vista/intranet.php?vista=sistema/configurar","2015-04-26 07:04:00","<p>Así comenzó la educación de las personas con discapacidad visual del Estado Portuguesa, con un","<div style=\"text-align: justify;\">Así comenzó la educación de las personas con discapacidad visua","::1","Error en los datos","Modificar","historia","tsistema","15491963","editar_configuracion");
INSERT INTO tbitacora VALUES("2008","/CAIDV/vista/intranet.php?vista=sistema/configurar","2015-04-26 07:04:00","","","::1","-","Navegar","-","-","15491963","sistema/configurar");
INSERT INTO tbitacora VALUES("2009","http://localhost/CAIDV/vista/intranet.php?vista=sistema/configurar","2015-04-26 07:04:00","<div style=\"text-align: justify;\">Así comenzó la educación de las personas con discapacidad visua","<div style=\"text-align: justify;\">Así comenzó la educación de las personas con discapacidad visua","::1","Error en los datos","Modificar","historia","tsistema","15491963","editar_configuracion");
INSERT INTO tbitacora VALUES("2010","/CAIDV/vista/intranet.php?vista=sistema/configurar","2015-04-26 07:04:00","","","::1","-","Navegar","-","-","15491963","sistema/configurar");
INSERT INTO tbitacora VALUES("2011","/CAIDV/vista/intranet.php?vista=sistema/noticia","2015-04-26 07:04:00","","","::1","-","Navegar","-","-","15491963","sistema/noticia");
INSERT INTO tbitacora VALUES("2012","/CAIDV/vista/intranet.php?vista=sistema/configurar","2015-04-26 07:04:00","","","::1","-","Navegar","-","-","15491963","sistema/configurar");
INSERT INTO tbitacora VALUES("2013","http://localhost/CAIDV/vista/intranet.php?vista=sistema/configurar","2015-04-26 07:04:00","<div style=\"text-align: justify;\">Así comenzó la educación de las personas con discapacidad visua","<p>Así comenzó la educación de las personas con discapacidad visual del Estado Portuguesa, con un","::1","Error en los datos","Modificar","historia","tsistema","15491963","editar_configuracion");
INSERT INTO tbitacora VALUES("2014","/CAIDV/vista/intranet.php?vista=sistema/configurar","2015-04-26 07:04:00","","","::1","-","Navegar","-","-","15491963","sistema/configurar");
INSERT INTO tbitacora VALUES("2015","http://localhost/CAIDV/vista/intranet.php?vista=sistema/configurar","2015-04-26 07:04:00","<p>Así comenzó la educación de las personas con discapacidad visual del Estado Portuguesa, con un","<p style=\"text-align: justify;\">Así comenzó la educación de las personas con discapacidad visual ","::1","Error en los datos","Modificar","historia","tsistema","15491963","editar_configuracion");
INSERT INTO tbitacora VALUES("2016","/CAIDV/vista/intranet.php?vista=sistema/configurar","2015-04-26 07:04:00","","","::1","-","Navegar","-","-","15491963","sistema/configurar");
INSERT INTO tbitacora VALUES("2017","http://localhost/CAIDV/vista/intranet.php?vista=sistema/configurar","2015-04-26 07:04:00","<p style=\"text-align: justify;\">Así comenzó la educación de las personas con discapacidad visual ","<p style=\"text-align: justify;\">Así comenzó la educación de las personas con discapacidad visual ","::1","Error en los datos","Modificar","historia","tsistema","15491963","editar_configuracion");
INSERT INTO tbitacora VALUES("2018","/CAIDV/vista/intranet.php?vista=sistema/configurar","2015-04-26 07:04:00","","","::1","-","Navegar","-","-","15491963","sistema/configurar");
INSERT INTO tbitacora VALUES("2019","/CAIDV/vista/intranet.php?vista=sistema/configurar","2015-04-26 07:04:00","","","::1","-","Navegar","-","-","15491963","sistema/configurar");
INSERT INTO tbitacora VALUES("2020","http://localhost/CAIDV/vista/intranet.php?vista=sistema/configurar","2015-04-26 07:04:00","<p style=\"text-align: justify;\">Así comenzó la educación de las personas con discapacidad visual ","<p style=\"text-align: justify;\">Así comenzó la educación de las personas con discapacidad visual ","::1","Error en los datos","Modificar","historia","tsistema","15491963","editar_configuracion");
INSERT INTO tbitacora VALUES("2021","/CAIDV/vista/intranet.php?vista=sistema/configurar","2015-04-26 07:04:00","","","::1","-","Navegar","-","-","15491963","sistema/configurar");
INSERT INTO tbitacora VALUES("2022","http://localhost/CAIDV/vista/intranet.php?vista=sistema/configurar","2015-04-26 07:04:00","<p style=\"text-align: justify;\">Así comenzó la educación de las personas con discapacidad visual ","<p style=\"text-align: justify;\">Así comenzó la educación de las personas con discapacidad visual ","::1","Error en los datos","Modificar","historia","tsistema","15491963","editar_configuracion");
INSERT INTO tbitacora VALUES("2023","/CAIDV/vista/intranet.php?vista=sistema/configurar","2015-04-26 07:04:00","","","::1","-","Navegar","-","-","15491963","sistema/configurar");
INSERT INTO tbitacora VALUES("2024","http://localhost/CAIDV/vista/intranet.php?vista=sistema/configurar","2015-04-26 07:04:00","<p style=\"text-align: justify;\">Así comenzó la educación de las personas con discapacidad visual ","<p style=\"text-align: justify;\">Así comenzó la educación de las personas con discapacidad visual ","::1","Error en los datos","Modificar","historia","tsistema","15491963","editar_configuracion");
INSERT INTO tbitacora VALUES("2025","/CAIDV/vista/intranet.php?vista=sistema/configurar","2015-04-26 07:04:00","","","::1","-","Navegar","-","-","15491963","sistema/configurar");
INSERT INTO tbitacora VALUES("2026","http://localhost/CAIDV/vista/intranet.php?vista=sistema/configurar","2015-04-26 07:04:00","<p style=\"text-align: justify;\">Así comenzó la educación de las personas con discapacidad visual ","<p style=\"text-align: justify;\">Así comenzó la educación de las personas con discapacidad visual ","::1","Error en los datos","Modificar","historia","tsistema","15491963","editar_configuracion");
INSERT INTO tbitacora VALUES("2027","/CAIDV/vista/intranet.php?vista=sistema/configurar","2015-04-26 07:04:00","","","::1","-","Navegar","-","-","15491963","sistema/configurar");
INSERT INTO tbitacora VALUES("2028","/CAIDV/vista/intranet.php?vista=sistema/configurar","2015-04-26 07:04:00","","","::1","-","Navegar","-","-","15491963","sistema/configurar");
INSERT INTO tbitacora VALUES("2029","http://localhost/CAIDV/vista/intranet.php?vista=sistema/configurar","2015-04-26 07:04:00","<p style=\"text-align: justify;\">Así comenzó la educación de las personas con discapacidad visual ","<p style=\"text-align: justify;\">Así comenzó la educación de las personas con discapacidad visual ","::1","Error en los datos","Modificar","historia","tsistema","15491963","editar_configuracion");
INSERT INTO tbitacora VALUES("2030","/CAIDV/vista/intranet.php?vista=sistema/configurar","2015-04-26 07:04:00","","","::1","-","Navegar","-","-","15491963","sistema/configurar");
INSERT INTO tbitacora VALUES("6081","/Antonio/vista/intranet.php","2015-05-07 08:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","Panel_inicio");
INSERT INTO tbitacora VALUES("6082","/Antonio/vista/intranet.php","2015-05-07 08:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","Panel_inicio");
INSERT INTO tbitacora VALUES("6083","/Antonio/vista/intranet.php","2015-05-07 08:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","Panel_inicio");
INSERT INTO tbitacora VALUES("6084","/Antonio/vista/intranet.php","2015-05-07 08:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","Panel_inicio");
INSERT INTO tbitacora VALUES("6085","/Antonio/vista/intranet.php","2015-05-07 08:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","Panel_inicio");
INSERT INTO tbitacora VALUES("6086","/Antonio/vista/intranet.php?vista=sistema/configurar","2015-05-07 08:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","sistema/configurar");
INSERT INTO tbitacora VALUES("6087","/Antonio/vista/intranet.php?vista=archivo/instrumento","2015-05-07 08:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","archivo/instrumento");
INSERT INTO tbitacora VALUES("6088","/Antonio/vista/intranet.php?vista=archivo/consultar_instrumento&id=4","2015-05-07 08:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","archivo/consultar_instrumento");
INSERT INTO tbitacora VALUES("6089","/Antonio/vista/intranet.php?vista=archivo/instrumento","2015-05-07 08:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","archivo/instrumento");
INSERT INTO tbitacora VALUES("6090","/Antonio/vista/intranet.php?vista=archivo/consultar_instrumento&id=5","2015-05-07 08:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","archivo/consultar_instrumento");
INSERT INTO tbitacora VALUES("6091","/Antonio/vista/intranet.php?vista=archivo/instrumento","2015-05-07 08:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","archivo/instrumento");
INSERT INTO tbitacora VALUES("6092","/Antonio/vista/intranet.php?vista=archivo/consultar_instrumento&id=2","2015-05-07 08:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","archivo/consultar_instrumento");
INSERT INTO tbitacora VALUES("6093","/Antonio/vista/intranet.php?vista=archivo/instrumento","2015-05-07 08:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","archivo/instrumento");
INSERT INTO tbitacora VALUES("6094","/Antonio/vista/intranet.php?vista=archivo/consultar_instrumento&id=3","2015-05-07 08:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","archivo/consultar_instrumento");
INSERT INTO tbitacora VALUES("6095","/Antonio/vista/intranet.php?vista=archivo/instrumento","2015-05-07 08:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","archivo/instrumento");
INSERT INTO tbitacora VALUES("6096","/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir","2015-05-07 08:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/listado_cursos_inscribir");
INSERT INTO tbitacora VALUES("6097","/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9","2015-05-07 08:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/inscripcion_masiva");
INSERT INTO tbitacora VALUES("6098","/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir","2015-05-07 08:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/listado_cursos_inscribir");
INSERT INTO tbitacora VALUES("6099","/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9","2015-05-07 08:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/inscripcion_masiva");
INSERT INTO tbitacora VALUES("6100","/Antonio/vista/intranet.php?vista=inscripcion/listado_participantes_inscribir","2015-05-07 08:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/listado_participantes_inscribir");
INSERT INTO tbitacora VALUES("6101","/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir","2015-05-07 08:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/listado_cursos_inscribir");
INSERT INTO tbitacora VALUES("6102","/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9","2015-05-07 08:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/inscripcion_masiva");
INSERT INTO tbitacora VALUES("6103","/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir","2015-05-07 08:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/listado_cursos_inscribir");
INSERT INTO tbitacora VALUES("6104","/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar","2015-05-07 08:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/listado_cursos_desincorporar");
INSERT INTO tbitacora VALUES("6105","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 08:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6106","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 08:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6107","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 08:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6108","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 08:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6109","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 08:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6110","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 08:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6111","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 08:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6112","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 08:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6113","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 08:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6114","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 08:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6115","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 08:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6116","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 08:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6117","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6118","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6119","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6120","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6121","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6122","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6123","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6124","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6125","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6126","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6127","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6128","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6129","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6130","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6131","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6132","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6133","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6134","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6135","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6136","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6137","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6138","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6139","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6140","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6141","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6142","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6143","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6144","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6145","http://localhost:8080/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-08 02:05:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso_tparticipante","administrador","desincorporar_curso");
INSERT INTO tbitacora VALUES("6146","/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/listado_cursos_desincorporar");
INSERT INTO tbitacora VALUES("6147","/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/listado_cursos_desincorporar");
INSERT INTO tbitacora VALUES("6148","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6149","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6150","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6151","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6152","http://localhost:8080/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-08 02:05:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso_tparticipante","administrador","desincorporar_curso");
INSERT INTO tbitacora VALUES("6153","/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/listado_cursos_desincorporar");
INSERT INTO tbitacora VALUES("6154","/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/listado_cursos_inscribir");
INSERT INTO tbitacora VALUES("6155","/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/inscripcion_masiva");
INSERT INTO tbitacora VALUES("6156","/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/listado_cursos_desincorporar");
INSERT INTO tbitacora VALUES("6157","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6158","http://localhost:8080/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-08 02:05:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso_tparticipante","administrador","desincorporar_curso");
INSERT INTO tbitacora VALUES("6159","/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/listado_cursos_desincorporar");
INSERT INTO tbitacora VALUES("6160","/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/listado_cursos_inscribir");
INSERT INTO tbitacora VALUES("6161","/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9","2015-05-07 09:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/inscripcion_masiva");
INSERT INTO tbitacora VALUES("6162","/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/inscripcion_masiva");
INSERT INTO tbitacora VALUES("6163","/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/inscripcion_masiva");
INSERT INTO tbitacora VALUES("6164","/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/inscripcion_masiva");
INSERT INTO tbitacora VALUES("6165","/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/inscripcion_masiva");
INSERT INTO tbitacora VALUES("6166","/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/inscripcion_masiva");
INSERT INTO tbitacora VALUES("6167","http://localhost:8080/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9","2015-05-08 02:05:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso_tparticipante","administrador","inscribir_curso");
INSERT INTO tbitacora VALUES("6168","/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/listado_cursos_inscribir");
INSERT INTO tbitacora VALUES("6169","/Antonio/vista/intranet.php?vista=inscripcion/listado_participantes_inscribir","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/listado_participantes_inscribir");
INSERT INTO tbitacora VALUES("6170","/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/inscripcion_individual");
INSERT INTO tbitacora VALUES("6171","/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/inscripcion_individual");
INSERT INTO tbitacora VALUES("6172","/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/inscripcion_individual");
INSERT INTO tbitacora VALUES("6173","/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/inscripcion_individual");
INSERT INTO tbitacora VALUES("6174","/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/inscripcion_individual");
INSERT INTO tbitacora VALUES("6175","/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/inscripcion_individual");
INSERT INTO tbitacora VALUES("6176","/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/inscripcion_individual");
INSERT INTO tbitacora VALUES("6177","/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/inscripcion_individual");
INSERT INTO tbitacora VALUES("6178","/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/inscripcion_individual");
INSERT INTO tbitacora VALUES("6179","/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/inscripcion_individual");
INSERT INTO tbitacora VALUES("6180","/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/inscripcion_individual");
INSERT INTO tbitacora VALUES("6181","/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/inscripcion_individual");
INSERT INTO tbitacora VALUES("6182","/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/inscripcion_individual");
INSERT INTO tbitacora VALUES("6183","/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/inscripcion_individual");
INSERT INTO tbitacora VALUES("6184","/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/inscripcion_individual");
INSERT INTO tbitacora VALUES("6185","/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/inscripcion_individual");
INSERT INTO tbitacora VALUES("6186","/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/inscripcion_individual");
INSERT INTO tbitacora VALUES("6187","/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/inscripcion_individual");
INSERT INTO tbitacora VALUES("6188","/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/inscripcion_individual");
INSERT INTO tbitacora VALUES("6189","/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/inscripcion_individual");
INSERT INTO tbitacora VALUES("6190","/Antonio/vista/intranet.php?vista=inscripcion/listado_participantes_inscribir","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/listado_participantes_inscribir");
INSERT INTO tbitacora VALUES("6191","/Antonio/vista/intranet.php?vista=inscripcion/listado_participantes_inscribir","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/listado_participantes_inscribir");
INSERT INTO tbitacora VALUES("6192","/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/inscripcion_individual");
INSERT INTO tbitacora VALUES("6193","/Antonio/vista/intranet.php?vista=inscripcion/listado_participantes_inscribir","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/listado_participantes_inscribir");
INSERT INTO tbitacora VALUES("6194","/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/listado_cursos_desincorporar");
INSERT INTO tbitacora VALUES("6195","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6196","/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/listado_cursos_desincorporar");
INSERT INTO tbitacora VALUES("6197","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6198","http://localhost:8080/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-08 02:05:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso_tparticipante","administrador","desincorporar_curso");
INSERT INTO tbitacora VALUES("6199","/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/listado_cursos_desincorporar");
INSERT INTO tbitacora VALUES("6200","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6201","http://localhost:8080/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-08 02:05:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso_tparticipante","administrador","desincorporar_curso");
INSERT INTO tbitacora VALUES("6202","/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/listado_cursos_desincorporar");
INSERT INTO tbitacora VALUES("6203","/Antonio/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/listado_participantes_desincorporar");
INSERT INTO tbitacora VALUES("6204","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=2","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participante");
INSERT INTO tbitacora VALUES("6205","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=2","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participante");
INSERT INTO tbitacora VALUES("6206","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=2","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participante");
INSERT INTO tbitacora VALUES("6207","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=2","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participante");
INSERT INTO tbitacora VALUES("6208","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=2","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participante");
INSERT INTO tbitacora VALUES("6209","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=2","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participante");
INSERT INTO tbitacora VALUES("6210","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=2","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participante");
INSERT INTO tbitacora VALUES("6211","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=2","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participante");
INSERT INTO tbitacora VALUES("6212","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=2","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participante");
INSERT INTO tbitacora VALUES("6213","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=2","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participante");
INSERT INTO tbitacora VALUES("6214","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=2","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participante");
INSERT INTO tbitacora VALUES("6215","/Antonio/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/listado_participantes_desincorporar");
INSERT INTO tbitacora VALUES("6216","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=2","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participante");
INSERT INTO tbitacora VALUES("6217","/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/listado_cursos_desincorporar");
INSERT INTO tbitacora VALUES("6218","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6219","/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/listado_cursos_desincorporar");
INSERT INTO tbitacora VALUES("6220","/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/listado_cursos_inscribir");
INSERT INTO tbitacora VALUES("6221","/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/inscripcion_masiva");
INSERT INTO tbitacora VALUES("6222","/Antonio/vista/intranet.php?vista=inscripcion/listado_participantes_inscribir","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/listado_participantes_inscribir");
INSERT INTO tbitacora VALUES("6223","/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=3&edad=6","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/inscripcion_individual");
INSERT INTO tbitacora VALUES("6224","/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=3&edad=6","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/inscripcion_individual");
INSERT INTO tbitacora VALUES("6225","/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=3&edad=6","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/inscripcion_individual");
INSERT INTO tbitacora VALUES("6226","/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=3&edad=6","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/inscripcion_individual");
INSERT INTO tbitacora VALUES("6227","/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=3&edad=6","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/inscripcion_individual");
INSERT INTO tbitacora VALUES("6228","/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=3&edad=6","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/inscripcion_individual");
INSERT INTO tbitacora VALUES("6229","/Antonio/vista/intranet.php?vista=inscripcion/listado_participantes_inscribir","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/listado_participantes_inscribir");
INSERT INTO tbitacora VALUES("6230","/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/listado_cursos_desincorporar");
INSERT INTO tbitacora VALUES("6231","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6232","http://localhost:8080/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-08 03:05:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso_tparticipante","administrador","desincorporar_curso");
INSERT INTO tbitacora VALUES("6233","/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/listado_cursos_desincorporar");
INSERT INTO tbitacora VALUES("6234","/Antonio/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/listado_participantes_desincorporar");
INSERT INTO tbitacora VALUES("6235","/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=2","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/desincorporar_participante");
INSERT INTO tbitacora VALUES("6236","/Antonio/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/listado_participantes_desincorporar");
INSERT INTO tbitacora VALUES("6237","/Antonio/vista/intranet.php?vista=reporte/participante_familiar","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/participante_familiar");
INSERT INTO tbitacora VALUES("6238","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/participante_familiar","2015-05-07 10:05:00","b047bf21-e157-42f2-ba1a-7dca03e262bb","11078708","127.0.0.1","-","Reporte","id","-","administrador","familiar_participante");
INSERT INTO tbitacora VALUES("6239","/Antonio/vista/intranet.php?vista=reporte/planilla_inscripcion","2015-05-07 10:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/planilla_inscripcion");
INSERT INTO tbitacora VALUES("6240","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/planilla_inscripcion","2015-05-07 10:05:00","beffb3cc-70dc-49b7-bdb7-642f2b3788cd","1","127.0.0.1","-","Reporte","idparticipante","-","administrador","plantilla_inscripcion");
INSERT INTO tbitacora VALUES("6241","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/planilla_inscripcion","2015-05-07 10:05:00","6b3d4f28-bef8-49a4-875d-8fd3cee44ee7","2","127.0.0.1","-","Reporte","idparticipante","-","administrador","plantilla_inscripcion");
INSERT INTO tbitacora VALUES("6242","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/planilla_inscripcion","2015-05-07 10:05:00","25e3cce3-1f3a-4c9f-92c3-58f25ad7a6e8","1","127.0.0.1","-","Reporte","idparticipante","-","administrador","plantilla_inscripcion");
INSERT INTO tbitacora VALUES("6243","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/planilla_inscripcion","2015-05-07 10:05:00","a6e6fcf6-fbdf-4a15-9076-caadec71e76d","2","127.0.0.1","-","Reporte","idparticipante","-","administrador","plantilla_inscripcion");
INSERT INTO tbitacora VALUES("6244","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/planilla_inscripcion","2015-05-07 10:05:00","c720e5cf-0b6b-42ff-897e-28d86cdc4af9","2","127.0.0.1","-","Reporte","idparticipante","-","administrador","plantilla_inscripcion");
INSERT INTO tbitacora VALUES("6245","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/planilla_inscripcion","2015-05-07 10:05:00","e18fe876-1372-433b-bf0a-f47d276fc5be","2","127.0.0.1","-","Reporte","idparticipante","-","administrador","plantilla_inscripcion");
INSERT INTO tbitacora VALUES("6246","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/planilla_inscripcion","2015-05-07 10:05:00","a2d4fd58-5f29-4851-893d-046318220c6e","2","127.0.0.1","-","Reporte","idparticipante","-","administrador","plantilla_inscripcion");
INSERT INTO tbitacora VALUES("6247","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/planilla_inscripcion","2015-05-07 10:05:00","73dd9cf3-c486-499c-87b6-d9e269955c14","2","127.0.0.1","-","Reporte","idparticipante","-","administrador","plantilla_inscripcion");
INSERT INTO tbitacora VALUES("6248","/Antonio/vista/intranet.php?vista=reporte/planilla_inscripcion","2015-05-07 11:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/planilla_inscripcion");
INSERT INTO tbitacora VALUES("6249","/Antonio/vista/intranet.php?vista=seguridad/asignar_servicio","2015-05-07 11:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","seguridad/asignar_servicio");
INSERT INTO tbitacora VALUES("6250","/Antonio/vista/intranet.php?vista=seguridad/asignar_servicio&id=1","2015-05-07 11:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","seguridad/asignar_servicio");
INSERT INTO tbitacora VALUES("6251","/Antonio/vista/intranet.php?vista=seguridad/servicio","2015-05-07 11:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","seguridad/servicio");
INSERT INTO tbitacora VALUES("6252","/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2015-05-07 11:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","seguridad/registrar_servicio");
INSERT INTO tbitacora VALUES("6253","http://localhost:8080/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2015-05-08 04:05:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("6254","/Antonio/vista/intranet.php?vista=seguridad/servicio","2015-05-07 11:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","seguridad/servicio");
INSERT INTO tbitacora VALUES("6255","/Antonio/vista/intranet.php?vista=seguridad/asignar_servicio","2015-05-07 11:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","seguridad/asignar_servicio");
INSERT INTO tbitacora VALUES("6256","/Antonio/vista/intranet.php?vista=seguridad/asignar_servicio&id=1","2015-05-07 11:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","seguridad/asignar_servicio");
INSERT INTO tbitacora VALUES("6257","/Antonio/vista/intranet.php?vista=seguridad/asignar_servicio","2015-05-07 11:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","seguridad/asignar_servicio");
INSERT INTO tbitacora VALUES("6258","/Antonio/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-07 11:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6259","/Antonio/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-07 11:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6260","/Antonio/vista/intranet.php?vista=consultar_evaluaciones&idparticipante=1","2015-05-07 11:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6261","/Antonio/vista/intranet.php","2015-05-07 11:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","Panel_inicio");
INSERT INTO tbitacora VALUES("6262","/Antonio/vista/intranet.php","2015-05-07 11:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","Panel_inicio");
INSERT INTO tbitacora VALUES("6263","/Antonio/vista/intranet.php?vista=seguridad/servicio","2015-05-07 11:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","seguridad/servicio");
INSERT INTO tbitacora VALUES("6264","/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2015-05-07 11:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","seguridad/registrar_servicio");
INSERT INTO tbitacora VALUES("6265","http://localhost:8080/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2015-05-08 04:05:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("6266","/Antonio/vista/intranet.php?vista=seguridad/servicio","2015-05-07 11:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","seguridad/servicio");
INSERT INTO tbitacora VALUES("6267","/Antonio/vista/intranet.php?vista=seguridad/asignar_servicio","2015-05-07 11:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","seguridad/asignar_servicio");
INSERT INTO tbitacora VALUES("6268","/Antonio/vista/intranet.php?vista=seguridad/asignar_servicio&id=1","2015-05-07 11:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","seguridad/asignar_servicio");
INSERT INTO tbitacora VALUES("6269","/Antonio/vista/intranet.php?vista=seguridad/asignar_servicio","2015-05-07 11:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","seguridad/asignar_servicio");
INSERT INTO tbitacora VALUES("6270","/Antonio/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-07 11:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6271","/Antonio/vista/intranet.php?vista=consultar_evaluaciones&idparticipante=1","2015-05-07 11:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6272","/Antonio/vista/intranet.php","2015-05-07 11:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","Panel_inicio");
INSERT INTO tbitacora VALUES("6273","/Antonio/vista/intranet.php","2015-05-07 11:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","Panel_inicio");
INSERT INTO tbitacora VALUES("6274","/Antonio/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-07 11:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6275","/Antonio/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-07 11:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6276","/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=1","2015-05-07 11:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6277","/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=1","2015-05-07 11:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6278","/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=1","2015-05-07 11:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6279","/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir","2015-05-07 11:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/listado_cursos_inscribir");
INSERT INTO tbitacora VALUES("6280","/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9","2015-05-07 11:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/inscripcion_masiva");
INSERT INTO tbitacora VALUES("6281","http://localhost:8080/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9","2015-05-08 04:05:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso_tparticipante","administrador","inscribir_curso");
INSERT INTO tbitacora VALUES("6282","/Antonio/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir","2015-05-07 11:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","inscripcion/listado_cursos_inscribir");
INSERT INTO tbitacora VALUES("6283","/Antonio/vista/intranet.php?vista=curso/evaluacion","2015-05-07 11:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","curso/evaluacion");
INSERT INTO tbitacora VALUES("6284","/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-07 11:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","curso/registrar_evaluacion");
INSERT INTO tbitacora VALUES("6285","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 04:05:00","","","127.0.0.1","Cargar datos","Registrar","*","tevaluacion","administrador","registrar_evaluacion");
INSERT INTO tbitacora VALUES("6286","/Antonio/vista/intranet.php?vista=curso/evaluacion","2015-05-07 11:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","curso/evaluacion");
INSERT INTO tbitacora VALUES("6287","/Antonio/vista/intranet.php?vista=curso/consultar_evaluacion&id=9","2015-05-07 11:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","curso/consultar_evaluacion");
INSERT INTO tbitacora VALUES("6288","/Antonio/vista/intranet.php?vista=curso/evaluacion","2015-05-07 11:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","curso/evaluacion");
INSERT INTO tbitacora VALUES("6289","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/evaluacion","2015-05-07 11:05:00","12331622-239f-4d01-a46b-a05e15ea2769","9","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6290","/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2","2015-05-07 11:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6291","/Antonio/vista/intranet.php?vista=seguridad/servicio","2015-05-07 11:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","seguridad/servicio");
INSERT INTO tbitacora VALUES("6292","/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2015-05-07 11:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","seguridad/registrar_servicio");
INSERT INTO tbitacora VALUES("6293","/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2","2015-05-08 12:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6294","/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2","2015-05-08 12:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6295","/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2","2015-05-08 12:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6296","/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2","2015-05-08 12:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6297","/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2","2015-05-08 12:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6298","/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2","2015-05-08 12:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6299","/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2","2015-05-08 12:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6300","/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2","2015-05-08 12:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6301","/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 12:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6302","/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 12:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6303","/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 12:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6304","/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 12:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6305","/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 12:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6306","/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 12:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6307","/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 12:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6308","/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 12:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6309","/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 12:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6310","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 12:05:00","786d0660-fccb-4db3-99d4-ebeef1e90615","9","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6311","/Antonio/vista/intranet.php?vista=curso/evaluacion","2015-05-08 12:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","curso/evaluacion");
INSERT INTO tbitacora VALUES("6312","/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 12:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","curso/registrar_evaluacion");
INSERT INTO tbitacora VALUES("6313","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 04:05:00","","","127.0.0.1","Cargar datos","Registrar","*","tevaluacion","administrador","registrar_evaluacion");
INSERT INTO tbitacora VALUES("6314","/Antonio/vista/intranet.php?vista=curso/evaluacion","2015-05-08 12:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","curso/evaluacion");
INSERT INTO tbitacora VALUES("6315","/Antonio/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-08 12:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6316","/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=1","2015-05-08 12:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6317","/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=1","2015-05-08 12:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6318","/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=1","2015-05-08 12:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6319","/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=1","2015-05-08 12:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6320","/Antonio/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-08 12:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6321","/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=1","2015-05-08 12:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6322","/Antonio/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-08 12:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6323","/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2","2015-05-08 12:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6324","/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2","2015-05-08 12:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6325","/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2","2015-05-08 12:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6326","/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 12:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6327","/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 12:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6328","/Antonio/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-08 12:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6329","/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2","2015-05-08 12:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6330","/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2","2015-05-08 12:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6331","/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2","2015-05-08 12:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6332","/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 12:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6333","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 12:05:00","4f1ed0d0-503f-408b-a96f-306cf6fab42f","9","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6334","http://localhost:8080/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2015-05-08 05:05:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("6335","/Antonio/vista/intranet.php?vista=seguridad/servicio","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","seguridad/servicio");
INSERT INTO tbitacora VALUES("6336","/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","seguridad/registrar_servicio");
INSERT INTO tbitacora VALUES("6337","http://localhost:8080/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2015-05-08 05:05:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("6338","/Antonio/vista/intranet.php?vista=seguridad/servicio","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","seguridad/servicio");
INSERT INTO tbitacora VALUES("6339","/Antonio/vista/intranet.php?vista=seguridad/asignar_servicio","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","seguridad/asignar_servicio");
INSERT INTO tbitacora VALUES("6340","/Antonio/vista/intranet.php?vista=seguridad/asignar_servicio&id=1","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","seguridad/asignar_servicio");
INSERT INTO tbitacora VALUES("6341","/Antonio/vista/intranet.php?vista=seguridad/asignar_servicio","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","seguridad/asignar_servicio");
INSERT INTO tbitacora VALUES("6342","/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6343","/Antonio/vista/intranet.php?vista=reporte/listado_participantes_asistencias","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/listado_participantes_asistencias");
INSERT INTO tbitacora VALUES("6344","/Antonio/vista/intranet.php?vista=seguridad/asignar_servicio","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","seguridad/asignar_servicio");
INSERT INTO tbitacora VALUES("6345","/Antonio/vista/intranet.php?vista=seguridad/servicio","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","seguridad/servicio");
INSERT INTO tbitacora VALUES("6346","/Antonio/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=150","2015-05-08 01:05:00","","","127.0.0.1","-","Consultar","-","-","administrador","seguridad/consultar_servicio");
INSERT INTO tbitacora VALUES("6347","http://localhost:8080/Antonio/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=150","2015-05-08 05:05:00","reporte/listado_participantes_asistencias","reporte/listado_participantes_asistencia","127.0.0.1","Error en los datos","Modificar","enlaceser","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("6348","/Antonio/vista/intranet.php?vista=seguridad/servicio","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","seguridad/servicio");
INSERT INTO tbitacora VALUES("6349","/Antonio/vista/intranet.php?vista=reporte/listado_participantes_asistencias","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/listado_participantes_asistencias");
INSERT INTO tbitacora VALUES("6350","/Antonio/vista/intranet.php","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","Panel_inicio");
INSERT INTO tbitacora VALUES("6351","/Antonio/vista/intranet.php","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","Panel_inicio");
INSERT INTO tbitacora VALUES("6352","/Antonio/vista/intranet.php?vista=reporte/listado_participantes_asistencia","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/listado_participantes_asistencia");
INSERT INTO tbitacora VALUES("6353","/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6354","/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6355","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","e8050b5d-8576-4842-addb-a36cb93965ed","9","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6356","/Antonio/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6357","/Antonio/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6358","/Antonio/vista/intranet.php?vista=reporte/listado_participantes_asistencia","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/listado_participantes_asistencia");
INSERT INTO tbitacora VALUES("6359","/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_asistencias");
INSERT INTO tbitacora VALUES("6360","/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_asistencias");
INSERT INTO tbitacora VALUES("6361","/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_asistencias");
INSERT INTO tbitacora VALUES("6362","/Antonio/vista/intranet.php?vista=curso/asistencia","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","curso/asistencia");
INSERT INTO tbitacora VALUES("6363","/Antonio/vista/intranet.php?vista=curso/registrar_asistencia&id=9","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","curso/registrar_asistencia");
INSERT INTO tbitacora VALUES("6364","/Antonio/vista/intranet.php?vista=curso/registrar_asistencia&id=9","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","curso/registrar_asistencia");
INSERT INTO tbitacora VALUES("6365","/Antonio/vista/intranet.php?vista=reporte/listado_participantes_asistencias","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/listado_participantes_asistencias");
INSERT INTO tbitacora VALUES("6366","/Antonio/vista/intranet.php","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","Panel_inicio");
INSERT INTO tbitacora VALUES("6367","/Antonio/vista/intranet.php","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","Panel_inicio");
INSERT INTO tbitacora VALUES("6368","/Antonio/vista/intranet.php?vista=reporte/listado_participantes_asistencia","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/listado_participantes_asistencia");
INSERT INTO tbitacora VALUES("6369","/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=1","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_asistencias");
INSERT INTO tbitacora VALUES("6370","/Antonio/vista/intranet.php?vista=reporte/listado_participantes_asistencia","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/listado_participantes_asistencia");
INSERT INTO tbitacora VALUES("6371","/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_asistencias");
INSERT INTO tbitacora VALUES("6372","/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_asistencias");
INSERT INTO tbitacora VALUES("6373","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","98c7433a-f038-475b-8fe6-d48e7003f528","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6374","/Antonio/vista/intranet.php?vista=curso/registrar_asistencia&id=9","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","curso/registrar_asistencia");
INSERT INTO tbitacora VALUES("6375","/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_asistencias");
INSERT INTO tbitacora VALUES("6376","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","73c1c4b3-dee1-47b5-a984-5ead294e2430","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6377","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_asistencia&id=9","2015-05-08 01:05:00","e2c85e33-a070-4f98-8eaa-d775e09f99f2","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6378","/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_asistencias");
INSERT INTO tbitacora VALUES("6379","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","c3d7f6b6-c4cf-40bb-858d-fce7e671706c","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6380","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","1e9a541a-7c15-4b69-9c4a-0b22c2d62d8a","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6381","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","51cdb56a-124f-4586-aa34-daad7e1dd243","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6382","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","fd545b15-e9ce-4aac-9a71-0c21438c8d52","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6383","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","8783069f-9f90-4afc-a8e4-cb9babcba1bc","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6384","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","b14dc8e1-cc47-48b3-a25f-7837a7668875","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6385","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","24e1f0f7-4761-415e-893b-671f2757a763","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6386","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","54e43bc6-d0ea-4528-acb2-c7c395bf7faf","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6387","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","0bc38fed-75d5-4757-a1c9-fe2bb01836ec","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6388","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","1cdec555-b021-4b37-ad7b-8686f4f8295c","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6389","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","7b1899e6-866a-4f95-881c-7e10fb02a1bd","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6390","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","3371ca4f-e186-4914-89d4-f9d716fe88bb","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6391","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","6b21664d-3575-4fd9-8bf6-f3e5a38a4629","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6392","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","dbbb5d9c-146c-4cc4-9052-a98546f1b83b","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6393","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","b2ad367d-2d84-40f3-8d7a-450ffb521503","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6394","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","3433246d-71bd-40ff-b93c-37d905e45d9e","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6395","/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_asistencias");
INSERT INTO tbitacora VALUES("6396","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","d50bc21b-f2aa-4b96-885a-846140b506b7","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6397","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","6e5b6833-8c99-4edf-88a3-204e6d7c4d33","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6398","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","0695e15b-ac09-4959-90de-d0699bf8741c","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6399","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","af89b7dd-6b31-4dc5-9f0a-c00c7b313bcf","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6400","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","fc8c6c26-b2f8-4e2d-bcbb-ea025c2e567f","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6401","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","56056e0d-63b8-4537-9735-4e30ebd71b69","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6402","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","109df3c4-ef7b-47cc-9d56-f06e30e09419","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6403","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","0f612eac-03e3-47e1-a328-287b7b7961fa","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6404","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","b2650e6b-ce6c-4895-a240-870ad0af4aca","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6405","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","1338b60f-5cc8-4a0f-b157-57db3f795d09","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6406","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","7677b7bd-a170-48ce-a655-36c08b62e6aa","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6407","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","c2de32b1-074d-44a6-8744-ec49f78ffd58","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6408","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","d37001e3-7aba-4333-af50-138bd8cb99d1","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6409","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","6b8af618-2271-458a-b97a-d9545ec26261","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6410","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","1ca93159-5922-42fd-b616-1ca1580b7e52","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6411","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","36370300-4bbc-44a8-882b-1cc77ddcb330","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6412","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","52ba8fd1-8e57-4bea-8466-aed75798f332","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6413","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","e53133f6-0516-4e67-a183-ebae6296a786","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6414","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","cf5caf59-441a-4e4e-ad59-773a017d4cd7","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6415","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 01:05:00","224589ba-3b0f-41b4-82d4-c6404a8fbc81","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6416","/Antonio/vista/intranet.php?vista=reporte/listado_participantes_asistencia","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/listado_participantes_asistencia");
INSERT INTO tbitacora VALUES("6417","/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=7","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_asistencias");
INSERT INTO tbitacora VALUES("6418","/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=7","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_asistencias");
INSERT INTO tbitacora VALUES("6419","/Antonio/vista/intranet.php?vista=reporte/listado_participantes_asistencia","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/listado_participantes_asistencia");
INSERT INTO tbitacora VALUES("6420","/Antonio/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=20","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_asistencias");
INSERT INTO tbitacora VALUES("6421","/Antonio/vista/intranet.php?vista=reporte/listado_participantes_asistencia","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/listado_participantes_asistencia");
INSERT INTO tbitacora VALUES("6422","/Antonio/vista/intranet.php?vista=curso/registrar_asistencia&id=9","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","curso/registrar_asistencia");
INSERT INTO tbitacora VALUES("6423","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_asistencia&id=9","2015-05-08 01:05:00","47ee5303-9347-4f08-a8ce-9fe03b25e818","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6424","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_asistencia&id=9","2015-05-08 01:05:00","9275e3e5-bed2-4a68-b342-ae6a56c18db8","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6425","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_asistencia&id=9","2015-05-08 01:05:00","e35b7860-ad0a-4acc-b35f-d90de4b60622","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6426","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_asistencia&id=9","2015-05-08 01:05:00","e1a5cf55-6ce0-4476-88ac-f710a59d2c47","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6427","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_asistencia&id=9","2015-05-08 01:05:00","67e30ac8-3452-4855-aa14-db4f3e31fd09","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6428","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_asistencia&id=9","2015-05-08 01:05:00","e78d3454-fb38-4eb5-bcc2-f4b49c1b4a28","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6429","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_asistencia&id=9","2015-05-08 01:05:00","989e3902-195a-4610-838e-32adb3f5e409","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6430","/Antonio/vista/intranet.php?vista=curso/evaluacion","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","curso/evaluacion");
INSERT INTO tbitacora VALUES("6431","/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 01:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","curso/registrar_evaluacion");
INSERT INTO tbitacora VALUES("6432","/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","curso/registrar_evaluacion");
INSERT INTO tbitacora VALUES("6433","/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","curso/registrar_evaluacion");
INSERT INTO tbitacora VALUES("6434","/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","curso/registrar_evaluacion");
INSERT INTO tbitacora VALUES("6435","/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","curso/registrar_evaluacion");
INSERT INTO tbitacora VALUES("6436","/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","curso/registrar_evaluacion");
INSERT INTO tbitacora VALUES("6437","/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","curso/registrar_evaluacion");
INSERT INTO tbitacora VALUES("6438","/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","curso/registrar_evaluacion");
INSERT INTO tbitacora VALUES("6439","/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","curso/registrar_evaluacion");
INSERT INTO tbitacora VALUES("6440","/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","curso/registrar_evaluacion");
INSERT INTO tbitacora VALUES("6441","/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","curso/registrar_evaluacion");
INSERT INTO tbitacora VALUES("6442","/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","curso/registrar_evaluacion");
INSERT INTO tbitacora VALUES("6443","/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","curso/registrar_evaluacion");
INSERT INTO tbitacora VALUES("6444","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","d6567c3e-2953-402e-aef7-5b8a9c90bc01","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6445","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","de914524-f3d9-4bd4-9914-f2f41c3c0014","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6446","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","9eb66ca4-b6f5-44fa-8629-951cd6cf53ae","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6447","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","02fd98c7-7ba9-48a0-842d-50a3abd4854c","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6448","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","763b86cc-01bc-427c-95f2-fedda79006b0","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6449","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","d4fe7dbd-8d02-413b-8fbd-234fb1d563e2","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6450","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","50bc2350-eafb-4cd7-b2f7-2ec79556823d","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6451","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","6441ce5c-7a88-4a29-822e-724697a9dcd5","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6452","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","6857f65d-658f-4e0d-9301-f6e23b3c76b3","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6453","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","b93d0f09-0506-4d7f-a5a0-01ef5882f432","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6454","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","6ce193dd-1eef-433d-8ecb-5c652ab6106b","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6455","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","5974617c-8660-47d5-8563-c5c771f32a3f","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6456","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","ad497e18-ad47-4b5d-8a37-8cf346a9b017","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6457","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","4f426a76-201a-48f7-825c-7bc6afc9eb31","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6458","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","308ccc50-36ee-4e60-a95c-1f19f18d98b8","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6459","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","a75c14db-4c80-41ad-92ec-930468b03f09","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6460","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","8dbcc25b-8107-4a96-8e2e-7e3b3522ecdc","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6461","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","abd56843-abb6-4039-ac73-8dea8f4cd160","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6462","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","18d3f6b5-7aca-40a8-bf49-34438ef9fe88","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6463","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","a6e2f285-d76e-4ef5-9a23-cf4f82c50fc4","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6464","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","7afe9da8-e05a-46bd-8c56-c0f278957dcf","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6465","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","67b93d43-81fc-4666-b30d-5ea777e3ce9f","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6466","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","b9fed072-bd33-4e9c-898c-fa1027b83d18","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6467","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","e54180ce-b553-42da-8c97-b6dc1c4dc1fa","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6468","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","ff06e4ef-66ad-49ec-94de-a1919e119d2f","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6469","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","a4fde622-f344-4dd6-bf80-c7baf87b73ee","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6470","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","e4a80994-82bf-4ee7-8a15-daa408f0ad3d","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6471","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","f396fad7-2dca-4a63-8d12-cc764d1668c6","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6472","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","ad69e631-f477-4680-a2e1-fd7dcd9be0ff","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6473","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","38ec7a13-c4fb-499b-a145-1ca4d1d9ec1c","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6474","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","bd0d11a4-fbe4-4a10-aa8b-234a119f3123","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6475","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","b17f6e39-142c-4bc9-b572-e48c3465b34f","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6476","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","0f380992-b06e-4830-965f-9a1495fc3e74","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6477","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","7f9ffda0-c9d9-4be4-a4d0-80e40268a8e6","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6478","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","578a5af8-32d5-4ec2-8733-2e233b853d6b","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6479","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","615486a2-676f-40af-8939-18fc8edf4e22","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6480","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","58ce5bf9-9571-4a32-bc40-0a8d67d963c8","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6481","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","5f9de5a2-8dff-455c-a2bc-fdddc5854990","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6482","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","47b87ef9-8afe-45c9-8747-b3ae64e0c146","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6483","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","7d6ed686-b5b3-42d0-a0d2-f1024855675e","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6484","/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","curso/registrar_evaluacion");
INSERT INTO tbitacora VALUES("6485","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","0f5ee473-4a57-4683-af46-6dc0a6798fb7","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6486","/Antonio/vista/intranet.php?vista=persona/participante","2015-05-08 02:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","persona/participante");
INSERT INTO tbitacora VALUES("6487","/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=1","2015-05-08 02:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","persona/consultar_participante");
INSERT INTO tbitacora VALUES("6488","/Antonio/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-08 02:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6489","/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2","2015-05-08 02:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6490","/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 02:05:00","","","127.0.0.1","-","Navegar","-","-","administrador","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6491","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 02:05:00","42cc4b9d-5158-4d33-b193-416405b07b13","9","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6492","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","b63146e5-ff17-4fd3-88a9-50d9c58e04ee","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6493","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","7e6bcd48-e28a-4f93-b1c1-bd51f5796e6e","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6494","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","203152d7-54cf-4e52-8e88-a6f5f71eea69","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6495","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","0896db0f-8339-408f-ab17-cb47542c2264","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6496","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","635157d8-2266-42f4-bd29-59ab012f7725","","127.0.0.1","-","Reporte","idevaluacion","-","administrador","evaluacion");
INSERT INTO tbitacora VALUES("6497","/CAIDV/vista/intranet.php","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","Panel_inicio");
INSERT INTO tbitacora VALUES("6498","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6499","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=1","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6500","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6501","/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_cursos_inscribir");
INSERT INTO tbitacora VALUES("6502","/CAIDV/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/inscripcion_masiva");
INSERT INTO tbitacora VALUES("6503","/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_inscribir","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_participantes_inscribir");
INSERT INTO tbitacora VALUES("6504","/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_cursos_inscribir");
INSERT INTO tbitacora VALUES("6505","/CAIDV/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/inscripcion_masiva");
INSERT INTO tbitacora VALUES("6506","/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_cursos_desincorporar");
INSERT INTO tbitacora VALUES("6507","/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6508","/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_cursos_desincorporar");
INSERT INTO tbitacora VALUES("6509","/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_participantes_desincorporar");
INSERT INTO tbitacora VALUES("6510","/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=2","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/desincorporar_participante");
INSERT INTO tbitacora VALUES("6511","/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_participantes_desincorporar");
INSERT INTO tbitacora VALUES("6512","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6513","/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=10","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/consultar_evaluacion");
INSERT INTO tbitacora VALUES("6514","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6515","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6516","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=9","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6517","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6518","http://localhost/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 10:05:00","dcb5d7f3-92fe-44d5-9fbd-67d142a54a7a","9","::1","-","Reporte","idevaluacion","-","15491963","evaluacion");
INSERT INTO tbitacora VALUES("6519","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_asistencia");
INSERT INTO tbitacora VALUES("6520","/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=1","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_asistencias");
INSERT INTO tbitacora VALUES("6521","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_asistencia");
INSERT INTO tbitacora VALUES("6522","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_asistencia");
INSERT INTO tbitacora VALUES("6523","/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=9","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_asistencias");
INSERT INTO tbitacora VALUES("6524","/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_asistencias");
INSERT INTO tbitacora VALUES("6525","http://localhost/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 10:05:00","5bf3598c-95f8-419e-a067-eef1984d7760","","::1","-","Reporte","idevaluacion","-","15491963","evaluacion");
INSERT INTO tbitacora VALUES("6526","http://localhost/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 10:05:00","5b2464f0-facc-46fe-b76e-372d8e2de51c","","::1","-","Reporte","idevaluacion","-","15491963","evaluacion");
INSERT INTO tbitacora VALUES("6527","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_asistencia");
INSERT INTO tbitacora VALUES("6528","/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_asistencias");
INSERT INTO tbitacora VALUES("6529","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_asistencia");
INSERT INTO tbitacora VALUES("6530","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6531","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=1","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6532","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6533","/CAIDV/vista/intranet.php","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","Panel_inicio");
INSERT INTO tbitacora VALUES("6534","/CAIDV/vista/intranet.php?vista=archivo/localidad","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","archivo/localidad");
INSERT INTO tbitacora VALUES("6535","/CAIDV/vista/intranet.php?vista=archivo/consultar_localidad&id=1","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","archivo/consultar_localidad");
INSERT INTO tbitacora VALUES("6536","/CAIDV/vista/intranet.php?vista=archivo/localidad","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","archivo/localidad");
INSERT INTO tbitacora VALUES("6537","/CAIDV/vista/intranet.php?vista=seguridad/servicio","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/servicio");
INSERT INTO tbitacora VALUES("6538","/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=150","2015-05-08 02:05:00","","","::1","-","Consultar","-","-","15491963","seguridad/consultar_servicio");
INSERT INTO tbitacora VALUES("6539","/CAIDV/vista/intranet.php?vista=seguridad/servicio","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/servicio");
INSERT INTO tbitacora VALUES("6540","/CAIDV/vista/intranet.php?vista=seguridad/registrar_servicio","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/registrar_servicio");
INSERT INTO tbitacora VALUES("6541","/CAIDV/vista/intranet.php?vista=seguridad/servicio","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/servicio");
INSERT INTO tbitacora VALUES("6542","/CAIDV/vista/intranet.php?vista=seguridad/registrar_servicio","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/registrar_servicio");
INSERT INTO tbitacora VALUES("6543","http://localhost/CAIDV/vista/intranet.php?vista=seguridad/registrar_servicio","2015-05-08 02:05:00","","","::1","Cargar datos","Registrar","*","tservicio","15491963","registrar_servicio");
INSERT INTO tbitacora VALUES("6544","/CAIDV/vista/intranet.php?vista=seguridad/servicio","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/servicio");
INSERT INTO tbitacora VALUES("6545","/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/asignar_servicio");
INSERT INTO tbitacora VALUES("6546","/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio&id=1","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/asignar_servicio");
INSERT INTO tbitacora VALUES("6547","/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/asignar_servicio");
INSERT INTO tbitacora VALUES("6548","/CAIDV/vista/intranet.php?vista=listado_asistencia","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","listado_asistencia");
INSERT INTO tbitacora VALUES("6549","http://localhost/CAIDV/vista/intranet.php?vista=listado_asistencia","2015-05-08 10:05:00","96de1aed-b1fe-4bb7-9c98-f1c1b7b9b4d4","","::1","-","Reporte","idevaluacion","-","15491963","evaluacion");
INSERT INTO tbitacora VALUES("6550","/CAIDV/vista/intranet.php?vista=curso/asistencia","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/asistencia");
INSERT INTO tbitacora VALUES("6551","/CAIDV/vista/intranet.php?vista=curso/registrar_asistencia&id=9","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/registrar_asistencia");
INSERT INTO tbitacora VALUES("6552","http://localhost/CAIDV/vista/intranet.php?vista=curso/registrar_asistencia&id=9","2015-05-08 10:05:00","6943b714-09c5-4790-96cb-afaacb76fc4e","","::1","-","Reporte","idevaluacion","-","15491963","evaluacion");
INSERT INTO tbitacora VALUES("6553","/CAIDV/vista/intranet.php?vista=curso/asistencia","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/asistencia");
INSERT INTO tbitacora VALUES("6554","/CAIDV/vista/intranet.php?vista=listado_asistencia","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","listado_asistencia");
INSERT INTO tbitacora VALUES("6555","/CAIDV/vista/intranet.php?vista=curso/asistencia","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/asistencia");
INSERT INTO tbitacora VALUES("6556","/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/asignar_servicio");
INSERT INTO tbitacora VALUES("6557","/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio&id=1","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/asignar_servicio");
INSERT INTO tbitacora VALUES("6558","/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/asignar_servicio");
INSERT INTO tbitacora VALUES("6559","/CAIDV/vista/intranet.php?vista=seguridad/servicio","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/servicio");
INSERT INTO tbitacora VALUES("6560","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6561","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6562","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6563","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=11","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6564","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6565","http://localhost/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 10:05:00","b9f06c45-dc2c-4ab3-91cf-f1b8c489f4b6","9","::1","-","Reporte","idevaluacion","-","15491963","evaluacion");
INSERT INTO tbitacora VALUES("6566","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6567","/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=10","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/consultar_evaluacion");
INSERT INTO tbitacora VALUES("6568","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6569","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6570","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=11","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6571","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6572","http://localhost/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 10:05:00","f4d8a44b-8b6c-47ac-ad69-16e864c3b7c7","9","::1","-","Reporte","idevaluacion","-","15491963","evaluacion");
INSERT INTO tbitacora VALUES("6573","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6574","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6575","/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=10","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/consultar_evaluacion");
INSERT INTO tbitacora VALUES("6576","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6577","/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=9","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/consultar_evaluacion");
INSERT INTO tbitacora VALUES("6578","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6579","/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=9","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/consultar_evaluacion");
INSERT INTO tbitacora VALUES("6580","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6581","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6582","/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=10","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/consultar_evaluacion");
INSERT INTO tbitacora VALUES("6583","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6584","/CAIDV/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/registrar_evaluacion");
INSERT INTO tbitacora VALUES("6585","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6586","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6587","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6588","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6589","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6590","http://localhost/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 10:05:00","318805a6-8513-4697-a306-4a53b6176497","9","::1","-","Reporte","idevaluacion","-","15491963","evaluacion");
INSERT INTO tbitacora VALUES("6591","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6592","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=11","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6593","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6594","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6595","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6596","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6597","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6598","http://localhost/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 10:05:00","7543f404-d9af-4923-830b-9f3454cd5e8d","9","::1","-","Reporte","idevaluacion","-","15491963","evaluacion");
INSERT INTO tbitacora VALUES("6599","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6600","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6601","/CAIDV/vista/intranet.php?vista=archivo/localidad","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","archivo/localidad");
INSERT INTO tbitacora VALUES("6602","/CAIDV/vista/intranet.php?vista=persona/historial_participante","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","persona/historial_participante");
INSERT INTO tbitacora VALUES("6603","http://localhost/CAIDV/vista/intranet.php?vista=persona/historial_participante","2015-05-08 10:05:00","c42a74d9-e951-4b8b-9450-ef9ded0c198e","1","::1","-","Reporte","idparticipante","-","15491963","historial_participante");
INSERT INTO tbitacora VALUES("6604","/CAIDV/vista/intranet.php?vista=persona/historial_participante_detalle&id=2","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","persona/historial_participante_detalle");
INSERT INTO tbitacora VALUES("6605","/CAIDV/vista/intranet.php?vista=persona/historial_participante","2015-05-08 02:05:00","","","::1","-","Navegar","-","-","15491963","persona/historial_participante");
INSERT INTO tbitacora VALUES("6606","http://localhost/CAIDV/vista/intranet.php?vista=persona/historial_participante","2015-05-08 10:05:00","23c965fe-bcc5-41d8-8391-2a2ce34dd874","2","::1","-","Reporte","idparticipante","-","15491963","historial_participante");
INSERT INTO tbitacora VALUES("6607","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_asistencia");
INSERT INTO tbitacora VALUES("6608","/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_asistencias");
INSERT INTO tbitacora VALUES("6609","/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_asistencias");
INSERT INTO tbitacora VALUES("6610","http://localhost/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 10:05:00","2a421bb6-410c-4358-87b9-9c8c5c4eae7f","","::1","-","Reporte","idevaluacion","-","15491963","evaluacion");
INSERT INTO tbitacora VALUES("6611","http://localhost/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 10:05:00","fac839f3-b37d-417a-a41a-ae596b5e27df","","::1","-","Reporte","idevaluacion","-","15491963","evaluacion");
INSERT INTO tbitacora VALUES("6612","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_asistencia");
INSERT INTO tbitacora VALUES("6613","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6614","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_asistencia");
INSERT INTO tbitacora VALUES("6615","/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_asistencias");
INSERT INTO tbitacora VALUES("6616","/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_asistencias");
INSERT INTO tbitacora VALUES("6617","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_asistencia");
INSERT INTO tbitacora VALUES("6618","/CAIDV/vista/intranet.php?vista=curso/lapso","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","curso/lapso");
INSERT INTO tbitacora VALUES("6619","/CAIDV/vista/intranet.php?vista=reporte/listado_docente_diagnostico","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_docente_diagnostico");
INSERT INTO tbitacora VALUES("6620","http://localhost/CAIDV/vista/intranet.php?vista=reporte/listado_docente_diagnostico","2015-05-08 10:05:00","2f1ad0e5-ed6d-4789-9944-77e5470fa4fa","1","::1","-","Reporte","id_diagnostico","-","15491963","listado_docentes_diagnostico");
INSERT INTO tbitacora VALUES("6621","/CAIDV/vista/intranet.php?vista=archivo/localidad","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","archivo/localidad");
INSERT INTO tbitacora VALUES("6622","/CAIDV/vista/intranet.php?vista=archivo/consultar_localidad&id=1","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","archivo/consultar_localidad");
INSERT INTO tbitacora VALUES("6623","/CAIDV/vista/intranet.php?vista=archivo/localidad","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","archivo/localidad");
INSERT INTO tbitacora VALUES("6624","/CAIDV/vista/intranet.php?vista=archivo/localidad","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","archivo/localidad");
INSERT INTO tbitacora VALUES("6625","/CAIDV/vista/intranet.php?vista=archivo/consultar_localidad&id=1","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","archivo/consultar_localidad");
INSERT INTO tbitacora VALUES("6626","/CAIDV/vista/intranet.php?vista=archivo/localidad","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","archivo/localidad");
INSERT INTO tbitacora VALUES("6627","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6628","/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=9","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","curso/consultar_evaluacion");
INSERT INTO tbitacora VALUES("6629","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6630","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6631","/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=9","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","curso/consultar_evaluacion");
INSERT INTO tbitacora VALUES("6632","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6633","/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=10","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","curso/consultar_evaluacion");
INSERT INTO tbitacora VALUES("6634","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6635","/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=10","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","curso/consultar_evaluacion");
INSERT INTO tbitacora VALUES("6636","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6637","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6638","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=9","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6639","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6640","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6641","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=9","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6642","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6643","http://localhost/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 10:05:00","f402ee4e-f4ca-41a4-a6c5-f469e8c23ef3","9","::1","-","Reporte","idevaluacion","-","15491963","evaluacion");
INSERT INTO tbitacora VALUES("6644","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6645","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6646","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6647","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=9","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6648","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6649","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6650","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=9","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6651","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6652","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6653","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6654","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=9","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6655","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6656","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-08 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6657","/CAIDV/vista/intranet.php","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","Panel_inicio");
INSERT INTO tbitacora VALUES("6658","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6659","/CAIDV/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/registrar_evaluacion");
INSERT INTO tbitacora VALUES("6660","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6661","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6662","/CAIDV/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/registrar_evaluacion");
INSERT INTO tbitacora VALUES("6663","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6664","/CAIDV/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/registrar_evaluacion");
INSERT INTO tbitacora VALUES("6665","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6666","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6667","/CAIDV/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/registrar_evaluacion");
INSERT INTO tbitacora VALUES("6668","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6669","/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=9","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/consultar_evaluacion");
INSERT INTO tbitacora VALUES("6670","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6671","/CAIDV/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/registrar_evaluacion");
INSERT INTO tbitacora VALUES("6672","http://localhost/CAIDV/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 11:05:00","d8917378-ed03-40fe-a479-b15d34e8c27f","","::1","-","Reporte","idevaluacion","-","15491963","evaluacion");
INSERT INTO tbitacora VALUES("6673","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6674","/CAIDV/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/registrar_evaluacion");
INSERT INTO tbitacora VALUES("6675","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6676","/CAIDV/vista/intranet.php?vista=curso/asistencia","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/asistencia");
INSERT INTO tbitacora VALUES("6677","/CAIDV/vista/intranet.php?vista=curso/registrar_asistencia&id=9","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/registrar_asistencia");
INSERT INTO tbitacora VALUES("6678","http://localhost/CAIDV/vista/intranet.php?vista=curso/registrar_asistencia&id=9","2015-05-08 11:05:00","af1106d9-8f23-4045-a5dc-53402bea74fa","","::1","-","Reporte","idevaluacion","-","15491963","evaluacion");
INSERT INTO tbitacora VALUES("6679","/CAIDV/vista/intranet.php?vista=curso/registrar_curso","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/registrar_curso");
INSERT INTO tbitacora VALUES("6680","/CAIDV/vista/intranet.php","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","Panel_inicio");
INSERT INTO tbitacora VALUES("6681","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6682","/CAIDV/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/registrar_evaluacion");
INSERT INTO tbitacora VALUES("6683","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6684","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6685","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6686","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6687","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6688","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6689","/CAIDV/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/registrar_evaluacion");
INSERT INTO tbitacora VALUES("6690","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6691","/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=9","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/consultar_evaluacion");
INSERT INTO tbitacora VALUES("6692","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6693","/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=10","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/consultar_evaluacion");
INSERT INTO tbitacora VALUES("6694","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6695","/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=9","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/consultar_evaluacion");
INSERT INTO tbitacora VALUES("6696","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6697","/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=9","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/consultar_evaluacion");
INSERT INTO tbitacora VALUES("6698","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6699","/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=10","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/consultar_evaluacion");
INSERT INTO tbitacora VALUES("6700","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6701","/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=9","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/consultar_evaluacion");
INSERT INTO tbitacora VALUES("6702","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6703","/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=9","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/consultar_evaluacion");
INSERT INTO tbitacora VALUES("6704","/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=9","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/consultar_evaluacion");
INSERT INTO tbitacora VALUES("6705","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6706","/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=9","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/consultar_evaluacion");
INSERT INTO tbitacora VALUES("6707","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6708","/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=9","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/consultar_evaluacion");
INSERT INTO tbitacora VALUES("6709","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6710","/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=9","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/consultar_evaluacion");
INSERT INTO tbitacora VALUES("6711","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6712","/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=9","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/consultar_evaluacion");
INSERT INTO tbitacora VALUES("6713","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6714","/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=9","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/consultar_evaluacion");
INSERT INTO tbitacora VALUES("6715","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6716","/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=9","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/consultar_evaluacion");
INSERT INTO tbitacora VALUES("6717","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-08 04:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("6718","/CAIDV/vista/intranet.php","2015-05-08 06:05:00","","","::1","-","Navegar","-","-","15491963","Panel_inicio");
INSERT INTO tbitacora VALUES("6719","/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir","2015-05-08 06:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_cursos_inscribir");
INSERT INTO tbitacora VALUES("6720","/CAIDV/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9","2015-05-08 06:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/inscripcion_masiva");
INSERT INTO tbitacora VALUES("6721","/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir","2015-05-08 06:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_cursos_inscribir");
INSERT INTO tbitacora VALUES("6722","/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar","2015-05-08 06:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_cursos_desincorporar");
INSERT INTO tbitacora VALUES("6723","/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-08 06:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6724","/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar","2015-05-08 06:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_cursos_desincorporar");
INSERT INTO tbitacora VALUES("6725","/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar","2015-05-08 06:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_participantes_desincorporar");
INSERT INTO tbitacora VALUES("6726","/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=2","2015-05-08 06:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/desincorporar_participante");
INSERT INTO tbitacora VALUES("6727","/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar","2015-05-08 06:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_participantes_desincorporar");
INSERT INTO tbitacora VALUES("6728","/CAIDV/vista/intranet.php?vista=reporte/historial_lapso","2015-05-08 06:05:00","","","::1","-","Navegar","-","-","15491963","reporte/historial_lapso");
INSERT INTO tbitacora VALUES("6729","http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_lapso","2015-05-08 02:05:00","82cf9c32-e2c2-456e-91c7-27dbe72486bc","2","::1","-","Reporte","idlapso","-","15491963","historial_lapso");
INSERT INTO tbitacora VALUES("6730","/CAIDV/vista/intranet.php?vista=reporte/historial_curso","2015-05-08 06:05:00","","","::1","-","Navegar","-","-","15491963","reporte/historial_curso");
INSERT INTO tbitacora VALUES("6731","http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_curso","2015-05-08 02:05:00","e9c318cd-29af-468b-bd9f-5d7b8e8b46bb","9","::1","-","Reporte","idcurso","-","15491963","historial_curso");
INSERT INTO tbitacora VALUES("6732","/CAIDV/vista/intranet.php?vista=reporte/historial_participante","2015-05-08 06:05:00","","","::1","-","Navegar","-","-","15491963","reporte/historial_participante");
INSERT INTO tbitacora VALUES("6733","/CAIDV/vista/intranet.php?vista=reporte/planilla_inscripcion","2015-05-08 06:05:00","","","::1","-","Navegar","-","-","15491963","reporte/planilla_inscripcion");
INSERT INTO tbitacora VALUES("6734","/CAIDV/vista/intranet.php?vista=reporte/participante_familiar","2015-05-08 06:05:00","","","::1","-","Navegar","-","-","15491963","reporte/participante_familiar");
INSERT INTO tbitacora VALUES("6735","/CAIDV/vista/intranet.php?vista=reporte/historial_lapso","2015-05-08 06:05:00","","","::1","-","Navegar","-","-","15491963","reporte/historial_lapso");
INSERT INTO tbitacora VALUES("6736","/CAIDV/vista/intranet.php?vista=reporte/historial_participante","2015-05-08 06:05:00","","","::1","-","Navegar","-","-","15491963","reporte/historial_participante");
INSERT INTO tbitacora VALUES("6737","http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_participante","2015-05-08 02:05:00","d01515be-8754-4fe3-9137-da0b4c94422f","2","::1","-","Reporte","idparticipante","-","15491963","historial_participante");
INSERT INTO tbitacora VALUES("6738","http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_participante","2015-05-08 02:05:00","56c4b10a-b91f-44bf-8971-459a8066d51e","11","::1","-","Reporte","idparticipante","-","15491963","historial_participante");
INSERT INTO tbitacora VALUES("6739","http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_participante","2015-05-08 02:05:00","a6dcea4c-d178-4c20-ae07-12eae70085f0","7","::1","-","Reporte","idparticipante","-","15491963","historial_participante");
INSERT INTO tbitacora VALUES("6740","http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_participante","2015-05-08 02:05:00","66cbbc75-3fd8-411a-a183-e3eb58a3f15c","11","::1","-","Reporte","idparticipante","-","15491963","historial_participante");
INSERT INTO tbitacora VALUES("6741","/CAIDV/vista/intranet.php?vista=archivo/localidad","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","archivo/localidad");
INSERT INTO tbitacora VALUES("6742","/CAIDV/vista/intranet.php?vista=curso/lapso","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","curso/lapso");
INSERT INTO tbitacora VALUES("6743","/CAIDV/vista/intranet.php?vista=reporte/historial_participante","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","reporte/historial_participante");
INSERT INTO tbitacora VALUES("6744","/CAIDV/vista/intranet.php?vista=reporte/historial_participante","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","reporte/historial_participante");
INSERT INTO tbitacora VALUES("6745","/CAIDV/vista/intranet.php?vista=reporte/historial_curso","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","reporte/historial_curso");
INSERT INTO tbitacora VALUES("6746","http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_curso","2015-05-08 02:05:00","ee5325a1-b57a-4b00-a8df-f36ec83b4647","9","::1","-","Reporte","idcurso","-","15491963","historial_curso");
INSERT INTO tbitacora VALUES("6747","/CAIDV/vista/intranet.php?vista=reporte/historial_lapso","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","reporte/historial_lapso");
INSERT INTO tbitacora VALUES("6748","http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_lapso","2015-05-08 02:05:00","2d9b9be2-e129-451d-ae12-9fe94be9c188","2","::1","-","Reporte","idlapso","-","15491963","historial_lapso");
INSERT INTO tbitacora VALUES("6749","/CAIDV/vista/intranet.php?vista=seguridad/servicio","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/servicio");
INSERT INTO tbitacora VALUES("6750","/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=108","2015-05-08 07:05:00","","","::1","-","Consultar","-","-","15491963","seguridad/consultar_servicio");
INSERT INTO tbitacora VALUES("6751","http://localhost/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=108","2015-05-08 07:05:00","Historial curso por lapso","Historial de lapso","::1","Error en los datos","Modificar","nombreser","tservicio","15491963","editar_servicio");
INSERT INTO tbitacora VALUES("6752","/CAIDV/vista/intranet.php?vista=seguridad/servicio","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/servicio");
INSERT INTO tbitacora VALUES("6753","/CAIDV/vista/intranet.php?vista=reporte/historial_curso","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","reporte/historial_curso");
INSERT INTO tbitacora VALUES("6754","/CAIDV/vista/intranet.php?vista=seguridad/servicio","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/servicio");
INSERT INTO tbitacora VALUES("6755","/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=112","2015-05-08 07:05:00","","","::1","-","Consultar","-","-","15491963","seguridad/consultar_servicio");
INSERT INTO tbitacora VALUES("6756","http://localhost/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=112","2015-05-08 07:05:00","Historial Curso","Historial de curso","::1","Error en los datos","Modificar","nombreser","tservicio","15491963","editar_servicio");
INSERT INTO tbitacora VALUES("6757","/CAIDV/vista/intranet.php?vista=seguridad/servicio","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/servicio");
INSERT INTO tbitacora VALUES("6758","/CAIDV/vista/intranet.php?vista=reporte/historial_participante","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","reporte/historial_participante");
INSERT INTO tbitacora VALUES("6759","/CAIDV/vista/intranet.php?vista=seguridad/servicio","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/servicio");
INSERT INTO tbitacora VALUES("6760","/CAIDV/vista/intranet.php?vista=reporte/historial_participante","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","reporte/historial_participante");
INSERT INTO tbitacora VALUES("6761","http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_participante","2015-05-08 02:05:00","41644841-af0b-49e0-9ee2-4056a960cb39","1","::1","-","Reporte","idparticipante","-","15491963","historial_participante");
INSERT INTO tbitacora VALUES("6762","/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=110","2015-05-08 07:05:00","","","::1","-","Consultar","-","-","15491963","seguridad/consultar_servicio");
INSERT INTO tbitacora VALUES("6763","http://localhost/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=110","2015-05-08 07:05:00","Historial de cursos inscrito por participante","Historial de cursos inscrito","::1","Error en los datos","Modificar","nombreser","tservicio","15491963","editar_servicio");
INSERT INTO tbitacora VALUES("6764","/CAIDV/vista/intranet.php?vista=seguridad/servicio","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/servicio");
INSERT INTO tbitacora VALUES("6765","/CAIDV/vista/intranet.php?vista=reporte/participante_familiar","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","reporte/participante_familiar");
INSERT INTO tbitacora VALUES("6766","/CAIDV/vista/intranet.php?vista=seguridad/servicio","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/servicio");
INSERT INTO tbitacora VALUES("6767","/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=148","2015-05-08 07:05:00","","","::1","-","Consultar","-","-","15491963","seguridad/consultar_servicio");
INSERT INTO tbitacora VALUES("6768","http://localhost/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=148","2015-05-08 07:05:00","Listado Participantes Evaluación","Participante por evaluación","::1","Error en los datos","Modificar","nombreser","tservicio","15491963","editar_servicio");
INSERT INTO tbitacora VALUES("6769","/CAIDV/vista/intranet.php?vista=seguridad/servicio","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/servicio");
INSERT INTO tbitacora VALUES("6770","/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=150","2015-05-08 07:05:00","","","::1","-","Consultar","-","-","15491963","seguridad/consultar_servicio");
INSERT INTO tbitacora VALUES("6771","http://localhost/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=150","2015-05-08 07:05:00","Listado Participantes Asistencias","Participantes asistencia","::1","Error en los datos","Modificar","nombreser","tservicio","15491963","editar_servicio");
INSERT INTO tbitacora VALUES("6772","/CAIDV/vista/intranet.php?vista=seguridad/servicio","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/servicio");
INSERT INTO tbitacora VALUES("6773","/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=150","2015-05-08 07:05:00","","","::1","-","Consultar","-","-","15491963","seguridad/consultar_servicio");
INSERT INTO tbitacora VALUES("6774","http://localhost/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=150","2015-05-08 07:05:00","Participantes asistencia","Participantes por asistencia","::1","Error en los datos","Modificar","nombreser","tservicio","15491963","editar_servicio");
INSERT INTO tbitacora VALUES("6775","/CAIDV/vista/intranet.php?vista=seguridad/servicio","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/servicio");
INSERT INTO tbitacora VALUES("6776","/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=150","2015-05-08 07:05:00","","","::1","-","Consultar","-","-","15491963","seguridad/consultar_servicio");
INSERT INTO tbitacora VALUES("6777","http://localhost/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=150","2015-05-08 07:05:00","Participantes por asistencia","Participante por asistencia","::1","Error en los datos","Modificar","nombreser","tservicio","15491963","editar_servicio");
INSERT INTO tbitacora VALUES("6778","/CAIDV/vista/intranet.php?vista=seguridad/servicio","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/servicio");
INSERT INTO tbitacora VALUES("6779","/CAIDV/vista/intranet.php?vista=reporte/planilla_inscripcion","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","reporte/planilla_inscripcion");
INSERT INTO tbitacora VALUES("6780","/CAIDV/vista/intranet.php?vista=reporte/participante_familiar","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","reporte/participante_familiar");
INSERT INTO tbitacora VALUES("6781","/CAIDV/vista/intranet.php?vista=reporte/historial_lapso","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","reporte/historial_lapso");
INSERT INTO tbitacora VALUES("6782","/CAIDV/vista/intranet.php?vista=reporte/historial_participante","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","reporte/historial_participante");
INSERT INTO tbitacora VALUES("6783","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_etnia","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_etnia");
INSERT INTO tbitacora VALUES("6784","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_huerfanos","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_huerfanos");
INSERT INTO tbitacora VALUES("6785","/CAIDV/vista/intranet.php?vista=reporte/listado_docente_diagnostico","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_docente_diagnostico");
INSERT INTO tbitacora VALUES("6786","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6787","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=1","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6788","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6789","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_asistencia");
INSERT INTO tbitacora VALUES("6790","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_asistencia");
INSERT INTO tbitacora VALUES("6791","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6792","/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_cursos_inscribir");
INSERT INTO tbitacora VALUES("6793","/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_inscribir","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_participantes_inscribir");
INSERT INTO tbitacora VALUES("6794","/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_cursos_desincorporar");
INSERT INTO tbitacora VALUES("6795","/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6796","/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_cursos_desincorporar");
INSERT INTO tbitacora VALUES("6797","/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_participantes_desincorporar");
INSERT INTO tbitacora VALUES("6798","/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=3","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/desincorporar_participante");
INSERT INTO tbitacora VALUES("6799","/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_participantes_desincorporar");
INSERT INTO tbitacora VALUES("6800","/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=3","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/desincorporar_participante");
INSERT INTO tbitacora VALUES("6801","/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_participantes_desincorporar");
INSERT INTO tbitacora VALUES("6802","/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=2","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/desincorporar_participante");
INSERT INTO tbitacora VALUES("6803","/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=2","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/desincorporar_participante");
INSERT INTO tbitacora VALUES("6804","/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_participantes_desincorporar");
INSERT INTO tbitacora VALUES("6805","/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_cursos_inscribir");
INSERT INTO tbitacora VALUES("6806","/CAIDV/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/inscripcion_masiva");
INSERT INTO tbitacora VALUES("6807","/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_cursos_desincorporar");
INSERT INTO tbitacora VALUES("6808","/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6809","/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_participantes_desincorporar");
INSERT INTO tbitacora VALUES("6810","/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=2","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/desincorporar_participante");
INSERT INTO tbitacora VALUES("6811","/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_participantes_desincorporar");
INSERT INTO tbitacora VALUES("6812","/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_participantes_desincorporar");
INSERT INTO tbitacora VALUES("6813","/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=2","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/desincorporar_participante");
INSERT INTO tbitacora VALUES("6814","/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_cursos_desincorporar");
INSERT INTO tbitacora VALUES("6815","/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6816","/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_cursos_desincorporar");
INSERT INTO tbitacora VALUES("6817","/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_inscribir","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_participantes_inscribir");
INSERT INTO tbitacora VALUES("6818","/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_participantes_desincorporar");
INSERT INTO tbitacora VALUES("6819","/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=2","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/desincorporar_participante");
INSERT INTO tbitacora VALUES("6820","/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_participantes_desincorporar");
INSERT INTO tbitacora VALUES("6821","/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_participantes_desincorporar");
INSERT INTO tbitacora VALUES("6822","/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=3","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/desincorporar_participante");
INSERT INTO tbitacora VALUES("6823","/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar","2015-05-08 07:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_participantes_desincorporar");
INSERT INTO tbitacora VALUES("6824","/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=8","2015-05-08 08:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/desincorporar_participante");
INSERT INTO tbitacora VALUES("6825","/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar","2015-05-08 08:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_participantes_desincorporar");
INSERT INTO tbitacora VALUES("6826","/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=9","2015-05-08 08:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/desincorporar_participante");
INSERT INTO tbitacora VALUES("6827","/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar","2015-05-08 08:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_participantes_desincorporar");
INSERT INTO tbitacora VALUES("6828","/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=9","2015-05-08 08:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/desincorporar_participante");
INSERT INTO tbitacora VALUES("6829","/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar","2015-05-08 08:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_participantes_desincorporar");
INSERT INTO tbitacora VALUES("6830","/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=9","2015-05-08 08:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/desincorporar_participante");
INSERT INTO tbitacora VALUES("6831","/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar","2015-05-08 08:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_participantes_desincorporar");
INSERT INTO tbitacora VALUES("6832","/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=11","2015-05-08 08:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/desincorporar_participante");
INSERT INTO tbitacora VALUES("6833","/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar","2015-05-08 08:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_participantes_desincorporar");
INSERT INTO tbitacora VALUES("6834","/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar","2015-05-08 08:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_cursos_desincorporar");
INSERT INTO tbitacora VALUES("6835","/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-08 08:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6836","/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar","2015-05-08 08:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_cursos_desincorporar");
INSERT INTO tbitacora VALUES("6837","/CAIDV/vista/intranet.php","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","Panel_inicio");
INSERT INTO tbitacora VALUES("6838","/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_cursos_desincorporar");
INSERT INTO tbitacora VALUES("6839","/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6840","/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_cursos_desincorporar");
INSERT INTO tbitacora VALUES("6841","/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=9","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/desincorporar_participantes");
INSERT INTO tbitacora VALUES("6842","/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_desincorporar","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_cursos_desincorporar");
INSERT INTO tbitacora VALUES("6843","/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_participantes_desincorporar");
INSERT INTO tbitacora VALUES("6844","/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=9","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/desincorporar_participante");
INSERT INTO tbitacora VALUES("6845","/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_participantes_desincorporar");
INSERT INTO tbitacora VALUES("6846","/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=9","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/desincorporar_participante");
INSERT INTO tbitacora VALUES("6847","/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_participantes_desincorporar");
INSERT INTO tbitacora VALUES("6848","/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=9","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/desincorporar_participante");
INSERT INTO tbitacora VALUES("6849","/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_participantes_desincorporar");
INSERT INTO tbitacora VALUES("6850","/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=9","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/desincorporar_participante");
INSERT INTO tbitacora VALUES("6851","/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_participantes_desincorporar");
INSERT INTO tbitacora VALUES("6852","/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_participantes_desincorporar");
INSERT INTO tbitacora VALUES("6853","/CAIDV/vista/intranet.php?vista=inscripcion/desincorporar_participante&id=9","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/desincorporar_participante");
INSERT INTO tbitacora VALUES("6854","/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_desincorporar","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_participantes_desincorporar");
INSERT INTO tbitacora VALUES("6855","/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_cursos_inscribir");
INSERT INTO tbitacora VALUES("6856","/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_cursos_inscribir");
INSERT INTO tbitacora VALUES("6857","/CAIDV/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/inscripcion_masiva");
INSERT INTO tbitacora VALUES("6858","/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_cursos_inscribir");
INSERT INTO tbitacora VALUES("6859","/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_cursos_inscribir");
INSERT INTO tbitacora VALUES("6860","/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_cursos_inscribir");
INSERT INTO tbitacora VALUES("6861","/CAIDV/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/inscripcion_masiva");
INSERT INTO tbitacora VALUES("6862","/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_cursos_inscribir");
INSERT INTO tbitacora VALUES("6863","/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_inscribir","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_participantes_inscribir");
INSERT INTO tbitacora VALUES("6864","/CAIDV/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=2&edad=6","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/inscripcion_individual");
INSERT INTO tbitacora VALUES("6865","/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_inscribir","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_participantes_inscribir");
INSERT INTO tbitacora VALUES("6866","/CAIDV/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=3&edad=6","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/inscripcion_individual");
INSERT INTO tbitacora VALUES("6867","/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_inscribir","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_participantes_inscribir");
INSERT INTO tbitacora VALUES("6868","/CAIDV/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=8&edad=4","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/inscripcion_individual");
INSERT INTO tbitacora VALUES("6869","/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_inscribir","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_participantes_inscribir");
INSERT INTO tbitacora VALUES("6870","/CAIDV/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=8&edad=4","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/inscripcion_individual");
INSERT INTO tbitacora VALUES("6871","/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_inscribir","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_participantes_inscribir");
INSERT INTO tbitacora VALUES("6872","/CAIDV/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=9&edad=4","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/inscripcion_individual");
INSERT INTO tbitacora VALUES("6873","/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_inscribir","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_participantes_inscribir");
INSERT INTO tbitacora VALUES("6874","/CAIDV/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=11&edad=5","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/inscripcion_individual");
INSERT INTO tbitacora VALUES("6875","/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_inscribir","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_participantes_inscribir");
INSERT INTO tbitacora VALUES("6876","/CAIDV/vista/intranet.php?vista=inscripcion/inscripcion_individual&id=11&edad=5","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/inscripcion_individual");
INSERT INTO tbitacora VALUES("6877","/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_inscribir","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_participantes_inscribir");
INSERT INTO tbitacora VALUES("6878","/CAIDV/vista/intranet.php?vista=curso/curso","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","curso/curso");
INSERT INTO tbitacora VALUES("6879","/CAIDV/vista/intranet.php?vista=curso/curso","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","curso/curso");
INSERT INTO tbitacora VALUES("6880","/CAIDV/vista/intranet.php?vista=curso/curso","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","curso/curso");
INSERT INTO tbitacora VALUES("6881","/CAIDV/vista/intranet.php?vista=curso/curso","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","curso/curso");
INSERT INTO tbitacora VALUES("6882","/CAIDV/vista/intranet.php?vista=curso/curso","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","curso/curso");
INSERT INTO tbitacora VALUES("6883","/CAIDV/vista/intranet.php?vista=curso/curso","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","curso/curso");
INSERT INTO tbitacora VALUES("6884","/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_cursos_inscribir");
INSERT INTO tbitacora VALUES("6885","/CAIDV/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/inscripcion_masiva");
INSERT INTO tbitacora VALUES("6886","/CAIDV/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=9","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/inscripcion_masiva");
INSERT INTO tbitacora VALUES("6887","/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_cursos_inscribir");
INSERT INTO tbitacora VALUES("6888","/CAIDV/vista/intranet.php?vista=reporte/historial_participante","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","reporte/historial_participante");
INSERT INTO tbitacora VALUES("6889","http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_participante","2015-05-08 08:05:00","e6687cbb-66b9-431b-a0e0-90e36531e4ba","1","::1","-","Reporte","idparticipante","-","15491963","historial_participante");
INSERT INTO tbitacora VALUES("6890","http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_participante","2015-05-08 08:05:00","2cc8958e-e1f3-4fca-8391-a61c0585a454","11","::1","-","Reporte","idparticipante","-","15491963","historial_participante");
INSERT INTO tbitacora VALUES("6891","/CAIDV/vista/intranet.php?vista=reporte/historial_participante","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","reporte/historial_participante");
INSERT INTO tbitacora VALUES("6892","/CAIDV/vista/intranet.php?vista=sistema/configurar","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","sistema/configurar");
INSERT INTO tbitacora VALUES("6893","/CAIDV/vista/intranet.php?vista=sistema/configurar","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","sistema/configurar");
INSERT INTO tbitacora VALUES("6894","/CAIDV/vista/intranet.php?vista=seguridad/bloquear","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/bloquear");
INSERT INTO tbitacora VALUES("6895","/CAIDV/vista/intranet.php","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","Panel_inicio");
INSERT INTO tbitacora VALUES("6896","/CAIDV/vista/intranet.php?vista=persona/participante","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","persona/participante");
INSERT INTO tbitacora VALUES("6897","/CAIDV/vista/intranet.php?vista=persona/consultar_participante&id=1","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","persona/consultar_participante");
INSERT INTO tbitacora VALUES("6898","/CAIDV/vista/intranet.php?vista=archivo/municipio","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","archivo/municipio");
INSERT INTO tbitacora VALUES("6899","/CAIDV/vista/intranet.php?vista=archivo/consultar_municipio&id=1","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","archivo/consultar_municipio");
INSERT INTO tbitacora VALUES("6900","/CAIDV/vista/intranet.php?vista=archivo/localidad","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","archivo/localidad");
INSERT INTO tbitacora VALUES("6901","/CAIDV/vista/intranet.php?vista=archivo/registrar_localidad","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","archivo/registrar_localidad");
INSERT INTO tbitacora VALUES("6902","/CAIDV/vista/intranet.php?vista=archivo/localidad","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","archivo/localidad");
INSERT INTO tbitacora VALUES("6903","/CAIDV/vista/intranet.php?vista=archivo/institucion","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","archivo/institucion");
INSERT INTO tbitacora VALUES("6904","/CAIDV/vista/intranet.php?vista=archivo/registrar_institucion","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","archivo/registrar_institucion");
INSERT INTO tbitacora VALUES("6905","/CAIDV/vista/intranet.php?vista=archivo/aula","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","archivo/aula");
INSERT INTO tbitacora VALUES("6906","/CAIDV/vista/intranet.php?vista=archivo/registrar_aula","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","archivo/registrar_aula");
INSERT INTO tbitacora VALUES("6907","/CAIDV/vista/intranet.php?vista=archivo/diagnostico","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","archivo/diagnostico");
INSERT INTO tbitacora VALUES("6908","/CAIDV/vista/intranet.php?vista=archivo/registrar_diagnostico","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","archivo/registrar_diagnostico");
INSERT INTO tbitacora VALUES("6909","/CAIDV/vista/intranet.php?vista=archivo/diagnostico","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","archivo/diagnostico");
INSERT INTO tbitacora VALUES("6910","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_asistencia");
INSERT INTO tbitacora VALUES("6911","/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=1","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_asistencias");
INSERT INTO tbitacora VALUES("6912","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_asistencia");
INSERT INTO tbitacora VALUES("6913","/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=11","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_asistencias");
INSERT INTO tbitacora VALUES("6914","/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_asistencias");
INSERT INTO tbitacora VALUES("6915","/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_asistencias");
INSERT INTO tbitacora VALUES("6916","/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_asistencias");
INSERT INTO tbitacora VALUES("6917","/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_asistencias");
INSERT INTO tbitacora VALUES("6918","/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_asistencias");
INSERT INTO tbitacora VALUES("6919","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_asistencia");
INSERT INTO tbitacora VALUES("6920","/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=11","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_asistencias");
INSERT INTO tbitacora VALUES("6921","/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_asistencias");
INSERT INTO tbitacora VALUES("6922","http://localhost/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 09:05:00","598283c8-fc63-4f7e-b38f-4ca7fb455607","","::1","-","Reporte","idevaluacion","-","15491963","evaluacion");
INSERT INTO tbitacora VALUES("6923","http://localhost/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-08 09:05:00","42d884d4-a8bf-4e15-a639-5cc8cedf15eb","","::1","-","Reporte","idevaluacion","-","15491963","evaluacion");
INSERT INTO tbitacora VALUES("6924","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_asistencia");
INSERT INTO tbitacora VALUES("6925","/CAIDV/vista/intranet.php?vista=reporte/historial_lapso","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","reporte/historial_lapso");
INSERT INTO tbitacora VALUES("6926","http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_lapso","2015-05-08 09:05:00","9884d24a-4276-403c-bfe7-435697b93d34","2","::1","-","Reporte","idlapso","-","15491963","historial_lapso");
INSERT INTO tbitacora VALUES("6927","/CAIDV/vista/intranet.php?vista=persona/historial_participante","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","persona/historial_participante");
INSERT INTO tbitacora VALUES("6928","/CAIDV/vista/intranet.php?vista=persona/historial_participante","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","persona/historial_participante");
INSERT INTO tbitacora VALUES("6929","http://localhost/CAIDV/vista/intranet.php?vista=persona/historial_participante","2015-05-08 09:05:00","b21b50b6-5262-4347-8845-e742a6f8fd26","11","::1","-","Reporte","idparticipante","-","15491963","historial_participante");
INSERT INTO tbitacora VALUES("6930","/CAIDV/vista/intranet.php?vista=reporte/historial_participante","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","reporte/historial_participante");
INSERT INTO tbitacora VALUES("6931","http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_participante","2015-05-08 09:05:00","062e062a-01c3-4f0d-9e2c-04a4b95d2e52","1","::1","-","Reporte","idparticipante","-","15491963","historial_participante");
INSERT INTO tbitacora VALUES("6932","/CAIDV/vista/intranet.php?vista=persona/historial_participante","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","persona/historial_participante");
INSERT INTO tbitacora VALUES("6933","/CAIDV/vista/intranet.php?vista=persona/historial_participante_detalle&id=11","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","persona/historial_participante_detalle");
INSERT INTO tbitacora VALUES("6934","/CAIDV/vista/intranet.php?vista=persona/historial_participante","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","persona/historial_participante");
INSERT INTO tbitacora VALUES("6935","/CAIDV/vista/intranet.php?vista=reporte/historial_participante","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","reporte/historial_participante");
INSERT INTO tbitacora VALUES("6936","http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_participante","2015-05-08 09:05:00","4bdda705-f1d8-480f-9ddd-c0df4b7299ae","11","::1","-","Reporte","idparticipante","-","15491963","historial_participante");
INSERT INTO tbitacora VALUES("6937","http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_participante","2015-05-08 09:05:00","f72f757f-570f-44bd-b647-fed977477357","11","::1","-","Reporte","idparticipante","-","15491963","historial_participante");
INSERT INTO tbitacora VALUES("6938","/CAIDV/vista/intranet.php?vista=persona/historial_participante","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","persona/historial_participante");
INSERT INTO tbitacora VALUES("6939","http://localhost/CAIDV/vista/intranet.php?vista=persona/historial_participante","2015-05-08 09:05:00","ee705561-72fc-42ef-8322-73710a7a4eaf","11","::1","-","Reporte","idparticipante","-","15491963","historial_participante");
INSERT INTO tbitacora VALUES("6940","/CAIDV/vista/intranet.php?vista=reporte/historial_participante","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","reporte/historial_participante");
INSERT INTO tbitacora VALUES("6941","/CAIDV/vista/intranet.php?vista=persona/historial_participante","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","persona/historial_participante");
INSERT INTO tbitacora VALUES("6942","/CAIDV/vista/intranet.php?vista=persona/historial_participante_detalle&id=1","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","persona/historial_participante_detalle");
INSERT INTO tbitacora VALUES("6943","/CAIDV/vista/intranet.php?vista=persona/historial_participante","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","persona/historial_participante");
INSERT INTO tbitacora VALUES("6944","/CAIDV/vista/intranet.php?vista=persona/historial_participante_detalle&id=11","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","persona/historial_participante_detalle");
INSERT INTO tbitacora VALUES("6945","/CAIDV/vista/intranet.php?vista=persona/historial_participante","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","persona/historial_participante");
INSERT INTO tbitacora VALUES("6946","/CAIDV/vista/intranet.php?vista=seguridad/servicio","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/servicio");
INSERT INTO tbitacora VALUES("6947","/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=147","2015-05-09 01:05:00","","","::1","-","Consultar","-","-","15491963","seguridad/consultar_servicio");
INSERT INTO tbitacora VALUES("6948","http://localhost/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=147","2015-05-09 01:05:00","Cursos inscrito por participante","Participante inscrito por cursos","::1","Error en los datos","Modificar","nombreser","tservicio","15491963","editar_servicio");
INSERT INTO tbitacora VALUES("6949","/CAIDV/vista/intranet.php?vista=seguridad/servicio","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/servicio");
INSERT INTO tbitacora VALUES("6950","/CAIDV/vista/intranet.php?vista=persona/historial_participante","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","persona/historial_participante");
INSERT INTO tbitacora VALUES("6951","/CAIDV/vista/intranet.php?vista=persona/historial_participante","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","persona/historial_participante");
INSERT INTO tbitacora VALUES("6952","/CAIDV/vista/intranet.php?vista=seguridad/servicio","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/servicio");
INSERT INTO tbitacora VALUES("6953","/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=110","2015-05-09 01:05:00","","","::1","-","Consultar","-","-","15491963","seguridad/consultar_servicio");
INSERT INTO tbitacora VALUES("6954","http://localhost/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=110","2015-05-09 01:05:00","Historial de cursos inscrito","Historial de cursos inscrito por participante","::1","Error en los datos","Modificar","nombreser","tservicio","15491963","editar_servicio");
INSERT INTO tbitacora VALUES("6955","/CAIDV/vista/intranet.php?vista=seguridad/servicio","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/servicio");
INSERT INTO tbitacora VALUES("6956","/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=147","2015-05-09 01:05:00","","","::1","-","Consultar","-","-","15491963","seguridad/consultar_servicio");
INSERT INTO tbitacora VALUES("6957","/CAIDV/vista/intranet.php?vista=seguridad/servicio","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/servicio");
INSERT INTO tbitacora VALUES("6958","/CAIDV/vista/intranet.php?vista=reporte/historial_participante","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","reporte/historial_participante");
INSERT INTO tbitacora VALUES("6959","/CAIDV/vista/intranet.php?vista=seguridad/servicio","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/servicio");
INSERT INTO tbitacora VALUES("6960","/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=107","2015-05-09 01:05:00","","","::1","-","Consultar","-","-","15491963","seguridad/consultar_servicio");
INSERT INTO tbitacora VALUES("6961","/CAIDV/vista/intranet.php?vista=persona/participante","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","persona/participante");
INSERT INTO tbitacora VALUES("6962","/CAIDV/vista/intranet.php?vista=persona/consultar_participante&id=1","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","persona/consultar_participante");
INSERT INTO tbitacora VALUES("6963","/CAIDV/vista/intranet.php?vista=persona/personal","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","persona/personal");
INSERT INTO tbitacora VALUES("6964","/CAIDV/vista/intranet.php?vista=persona/consultar_participante&id=1","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","persona/consultar_participante");
INSERT INTO tbitacora VALUES("6965","/CAIDV/vista/intranet.php?vista=persona/participante","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","persona/participante");
INSERT INTO tbitacora VALUES("6966","/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=107","2015-05-09 01:05:00","","","::1","-","Consultar","-","-","15491963","seguridad/consultar_servicio");
INSERT INTO tbitacora VALUES("6967","/CAIDV/vista/intranet.php?vista=persona/historial_participante_detalle","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","persona/historial_participante_detalle");
INSERT INTO tbitacora VALUES("6968","/CAIDV/vista/intranet.php?vista=persona/historial_participante","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","persona/historial_participante");
INSERT INTO tbitacora VALUES("6969","/CAIDV/vista/intranet.php?vista=persona/historial_participante_detalle&id=1","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","persona/historial_participante_detalle");
INSERT INTO tbitacora VALUES("6970","/CAIDV/vista/intranet.php?vista=persona/historial_participante","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","persona/historial_participante");
INSERT INTO tbitacora VALUES("6971","/CAIDV/vista/intranet.php?vista=persona/historial_participante_detalle","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","persona/historial_participante_detalle");
INSERT INTO tbitacora VALUES("6972","/CAIDV/vista/intranet.php?vista=seguridad/servicio","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/servicio");
INSERT INTO tbitacora VALUES("6973","/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=107","2015-05-09 01:05:00","","","::1","-","Consultar","-","-","15491963","seguridad/consultar_servicio");
INSERT INTO tbitacora VALUES("6974","http://localhost/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=107","2015-05-09 01:05:00","4","3","::1","Error en los datos","Modificar","idmodulo","tservicio","15491963","editar_servicio");
INSERT INTO tbitacora VALUES("6975","/CAIDV/vista/intranet.php?vista=seguridad/servicio","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/servicio");
INSERT INTO tbitacora VALUES("6976","/CAIDV/vista/intranet.php?vista=seguridad/servicio","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/servicio");
INSERT INTO tbitacora VALUES("6977","/CAIDV/vista/intranet.php?vista=seguridad/servicio","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/servicio");
INSERT INTO tbitacora VALUES("6978","/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=110","2015-05-09 01:05:00","","","::1","-","Consultar","-","-","15491963","seguridad/consultar_servicio");
INSERT INTO tbitacora VALUES("6979","http://localhost/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=110","2015-05-09 01:05:00","Historial de cursos inscrito por participante","Historial participante inscrito por curso","::1","Error en los datos","Modificar","nombreser","tservicio","15491963","editar_servicio");
INSERT INTO tbitacora VALUES("6980","/CAIDV/vista/intranet.php?vista=seguridad/servicio","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/servicio");
INSERT INTO tbitacora VALUES("6981","/CAIDV/vista/intranet.php?vista=reporte/participante_familiar","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","reporte/participante_familiar");
INSERT INTO tbitacora VALUES("6982","/CAIDV/vista/intranet.php?vista=reporte/historial_lapso","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","reporte/historial_lapso");
INSERT INTO tbitacora VALUES("6983","http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_lapso","2015-05-08 09:05:00","752c082b-5004-435f-b64e-7dec24853740","2","::1","-","Reporte","idlapso","-","15491963","historial_lapso");
INSERT INTO tbitacora VALUES("6984","/CAIDV/vista/intranet.php?vista=reporte/historial_curso","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","reporte/historial_curso");
INSERT INTO tbitacora VALUES("6985","http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_curso","2015-05-08 09:05:00","a291596a-797a-4e88-bb39-2afa7cc0335b","9","::1","-","Reporte","idcurso","-","15491963","historial_curso");
INSERT INTO tbitacora VALUES("6986","http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_curso","2015-05-08 09:05:00","adfa9852-a818-4207-81bf-8a53b2fd6208","10","::1","-","Reporte","idcurso","-","15491963","historial_curso");
INSERT INTO tbitacora VALUES("6987","/CAIDV/vista/intranet.php?vista=reporte/listado_docente_diagnostico","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_docente_diagnostico");
INSERT INTO tbitacora VALUES("6988","http://localhost/CAIDV/vista/intranet.php?vista=reporte/listado_docente_diagnostico","2015-05-08 09:05:00","126bf954-79ca-486d-985e-cb90047d1647","1","::1","-","Reporte","id_diagnostico","-","15491963","listado_docentes_diagnostico");
INSERT INTO tbitacora VALUES("6989","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6990","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=11","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6991","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=11&idlapso=2&idcurso=9","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6992","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=11&idlapso=2&idcurso=9","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6993","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=11&idlapso=2&idcurso=9","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6994","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6995","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=11","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6996","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=11&idlapso=2&idcurso=9","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6997","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=11&idlapso=2&idcurso=9","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("6998","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("6999","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=11","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("7000","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=11&idlapso=2&idcurso=9","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("7001","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("7002","/CAIDV/vista/intranet.php?vista=reporte/historial_participante","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","reporte/historial_participante");
INSERT INTO tbitacora VALUES("7003","http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_participante","2015-05-08 09:05:00","dbfcafd3-6f03-4f0e-a71f-b09df6cbe1bc","11","::1","-","Reporte","idparticipante","-","15491963","historial_participante");
INSERT INTO tbitacora VALUES("7004","/CAIDV/vista/intranet.php?vista=curso/cursos_inactivos","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","curso/cursos_inactivos");
INSERT INTO tbitacora VALUES("7005","/CAIDV/vista/intranet.php?vista=curso/detalle_curso_inactivo&id=10","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","curso/detalle_curso_inactivo");
INSERT INTO tbitacora VALUES("7006","/CAIDV/vista/intranet.php?vista=curso/cursos_inactivos","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","curso/cursos_inactivos");
INSERT INTO tbitacora VALUES("7007","/CAIDV/vista/intranet.php?vista=curso/detalle_curso_inactivo&id=10","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","curso/detalle_curso_inactivo");
INSERT INTO tbitacora VALUES("7008","/CAIDV/vista/intranet.php?vista=curso/detalle_curso_inactivo&id=10","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/detalle_curso_inactivo");
INSERT INTO tbitacora VALUES("7009","/CAIDV/vista/intranet.php?vista=curso/detalle_curso_inactivo&id=10","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/detalle_curso_inactivo");
INSERT INTO tbitacora VALUES("7010","/CAIDV/vista/intranet.php?vista=curso/detalle_curso_inactivo&id=10","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/detalle_curso_inactivo");
INSERT INTO tbitacora VALUES("7011","/CAIDV/vista/intranet.php?vista=curso/detalle_curso_inactivo&id=10","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/detalle_curso_inactivo");
INSERT INTO tbitacora VALUES("7012","/CAIDV/vista/intranet.php?vista=curso/detalle_curso_inactivo&id=10","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/detalle_curso_inactivo");
INSERT INTO tbitacora VALUES("7013","/CAIDV/vista/intranet.php?vista=curso/cursos_inactivos","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/cursos_inactivos");
INSERT INTO tbitacora VALUES("7014","/CAIDV/vista/intranet.php?vista=curso/curso","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/curso");
INSERT INTO tbitacora VALUES("7015","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_asistencia");
INSERT INTO tbitacora VALUES("7016","/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=11","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_asistencias");
INSERT INTO tbitacora VALUES("7017","/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_asistencias");
INSERT INTO tbitacora VALUES("7018","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_asistencia");
INSERT INTO tbitacora VALUES("7019","/CAIDV/vista/intranet.php","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","Panel_inicio");
INSERT INTO tbitacora VALUES("7020","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("7021","/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=9","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/consultar_evaluacion");
INSERT INTO tbitacora VALUES("7022","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("7023","/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=10","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/consultar_evaluacion");
INSERT INTO tbitacora VALUES("7024","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("7025","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("7026","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("7027","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_asistencia");
INSERT INTO tbitacora VALUES("7028","/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_asistencias");
INSERT INTO tbitacora VALUES("7029","/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=9","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_asistencias");
INSERT INTO tbitacora VALUES("7030","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("7031","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("7032","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=9","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("7033","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("7034","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=16","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("7035","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("7036","/CAIDV/vista/intranet.php?vista=curso/asistencia","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/asistencia");
INSERT INTO tbitacora VALUES("7037","/CAIDV/vista/intranet.php?vista=curso/registrar_asistencia&id=9","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/registrar_asistencia");
INSERT INTO tbitacora VALUES("7038","/CAIDV/vista/intranet.php?vista=curso/asistencia","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/asistencia");
INSERT INTO tbitacora VALUES("7039","/CAIDV/vista/intranet.php?vista=curso/asistencia","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/asistencia");
INSERT INTO tbitacora VALUES("7040","/CAIDV/vista/intranet.php?vista=curso/registrar_asistencia&id=9","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/registrar_asistencia");
INSERT INTO tbitacora VALUES("7041","/CAIDV/vista/intranet.php?vista=reporte/historial_curso","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/historial_curso");
INSERT INTO tbitacora VALUES("7042","http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_curso","2015-05-08 10:05:00","7de0d7ef-b0a4-4020-b98b-5a610a5b94c5","9","::1","-","Reporte","idcurso","-","15491963","historial_curso");
INSERT INTO tbitacora VALUES("7043","/CAIDV/vista/intranet.php?vista=reporte/historial_curso","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/historial_curso");
INSERT INTO tbitacora VALUES("7044","/CAIDV/vista/intranet.php?vista=reporte/historial_curso","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/historial_curso");
INSERT INTO tbitacora VALUES("7045","/CAIDV/vista/intranet.php?vista=reporte/historial_lapso","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/historial_lapso");
INSERT INTO tbitacora VALUES("7046","http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_lapso","2015-05-08 10:05:00","cc3f71ce-10f2-4323-bc9e-cb2f2eb8df2b","2","::1","-","Reporte","idlapso","-","15491963","historial_lapso");
INSERT INTO tbitacora VALUES("7047","http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_lapso","2015-05-08 10:05:00","5566631a-4cb2-43c1-90a4-a1250145eab5","3","::1","-","Reporte","idlapso","-","15491963","historial_lapso");
INSERT INTO tbitacora VALUES("7048","/CAIDV/vista/intranet.php?vista=seguridad/modulo","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/modulo");
INSERT INTO tbitacora VALUES("7049","/CAIDV/vista/intranet.php?vista=seguridad/asignar_modulo","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/asignar_modulo");
INSERT INTO tbitacora VALUES("7050","/CAIDV/vista/intranet.php?vista=seguridad/asignar_modulo&id=1","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/asignar_modulo");
INSERT INTO tbitacora VALUES("7051","/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio&id=1","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/asignar_servicio");
INSERT INTO tbitacora VALUES("7052","/CAIDV/vista/intranet.php?vista=seguridad/asignar_modulo","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/asignar_modulo");
INSERT INTO tbitacora VALUES("7053","/CAIDV/vista/intranet.php?vista=seguridad/asignar_modulo&id=1","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/asignar_modulo");
INSERT INTO tbitacora VALUES("7054","/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio&id=1","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/asignar_servicio");
INSERT INTO tbitacora VALUES("7055","/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/asignar_servicio");
INSERT INTO tbitacora VALUES("7056","/CAIDV/vista/intranet.php?vista=seguridad/asignar_modulo","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/asignar_modulo");
INSERT INTO tbitacora VALUES("7057","/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/asignar_servicio");
INSERT INTO tbitacora VALUES("7058","/CAIDV/vista/intranet.php?vista=seguridad/servicio","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/servicio");
INSERT INTO tbitacora VALUES("7059","/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=52","2015-05-09 02:05:00","","","::1","-","Consultar","-","-","15491963","seguridad/consultar_servicio");
INSERT INTO tbitacora VALUES("7060","http://localhost/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=52","2015-05-09 02:05:00","5","1","::1","Error en los datos","Modificar","idmodulo","tservicio","15491963","editar_servicio");
INSERT INTO tbitacora VALUES("7061","/CAIDV/vista/intranet.php?vista=seguridad/servicio","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/servicio");
INSERT INTO tbitacora VALUES("7062","/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=53","2015-05-09 02:05:00","","","::1","-","Consultar","-","-","15491963","seguridad/consultar_servicio");
INSERT INTO tbitacora VALUES("7063","http://localhost/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=53","2015-05-09 02:05:00","5","1","::1","Error en los datos","Modificar","idmodulo","tservicio","15491963","editar_servicio");
INSERT INTO tbitacora VALUES("7064","/CAIDV/vista/intranet.php?vista=seguridad/servicio","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/servicio");
INSERT INTO tbitacora VALUES("7065","/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/asignar_servicio");
INSERT INTO tbitacora VALUES("7066","/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio&id=1","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/asignar_servicio");
INSERT INTO tbitacora VALUES("7067","/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/asignar_servicio");
INSERT INTO tbitacora VALUES("7068","/CAIDV/vista/intranet.php?vista=seguridad/asignar_modulo","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/asignar_modulo");
INSERT INTO tbitacora VALUES("7069","/CAIDV/vista/intranet.php","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","Panel_inicio");
INSERT INTO tbitacora VALUES("7070","/CAIDV/vista/intranet.php?vista=ayuda/acerca","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","ayuda/acerca");
INSERT INTO tbitacora VALUES("7071","/CAIDV/vista/intranet.php?vista=ayuda/acerca","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","ayuda/acerca");
INSERT INTO tbitacora VALUES("7072","/CAIDV/vista/intranet.php?vista=ayuda/acerca","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","ayuda/acerca");
INSERT INTO tbitacora VALUES("7073","/CAIDV/vista/intranet.php?vista=ayuda/acerca","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","ayuda/acerca");
INSERT INTO tbitacora VALUES("7074","/CAIDV/vista/intranet.php?vista=ayuda/acerca","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","ayuda/acerca");
INSERT INTO tbitacora VALUES("7075","/CAIDV/vista/intranet.php?vista=ayuda/acerca","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","ayuda/acerca");
INSERT INTO tbitacora VALUES("7076","/CAIDV/vista/intranet.php?vista=ayuda/acerca","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","ayuda/acerca");
INSERT INTO tbitacora VALUES("7077","/CAIDV/vista/intranet.php?vista=ayuda/acerca","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","ayuda/acerca");
INSERT INTO tbitacora VALUES("7078","/CAIDV/vista/intranet.php?vista=ayuda/acerca","2015-05-09 03:05:00","","","::1","-","Navegar","-","-","15491963","ayuda/acerca");
INSERT INTO tbitacora VALUES("7079","/CAIDV/vista/intranet.php?vista=ayuda/acerca","2015-05-09 03:05:00","","","::1","-","Navegar","-","-","15491963","ayuda/acerca");
INSERT INTO tbitacora VALUES("7080","/CAIDV/vista/intranet.php","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","Panel_inicio");
INSERT INTO tbitacora VALUES("7081","/CAIDV/vista/intranet.php","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","Panel_inicio");
INSERT INTO tbitacora VALUES("7082","/CAIDV/vista/intranet.php?vista=archivo/asignatura","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","archivo/asignatura");
INSERT INTO tbitacora VALUES("7083","/CAIDV/vista/intranet.php?vista=archivo/consultar_asignatura&id=1","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","archivo/consultar_asignatura");
INSERT INTO tbitacora VALUES("7084","/CAIDV/vista/intranet.php?vista=archivo/asignatura","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","archivo/asignatura");
INSERT INTO tbitacora VALUES("7085","/CAIDV/vista/intranet.php?vista=archivo/consultar_asignatura&id=1","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","archivo/consultar_asignatura");
INSERT INTO tbitacora VALUES("7086","http://localhost/CAIDV/vista/intranet.php?vista=archivo/consultar_asignatura&id=1","2015-05-09 12:05:00","","","::1","Error en los datos","Modificar","","tasignatura","15491963","editar_asignatura");
INSERT INTO tbitacora VALUES("7087","/CAIDV/vista/intranet.php?vista=archivo/asignatura","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","archivo/asignatura");
INSERT INTO tbitacora VALUES("7088","/CAIDV/vista/intranet.php?vista=archivo/consultar_asignatura&id=1","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","archivo/consultar_asignatura");
INSERT INTO tbitacora VALUES("7089","http://localhost/CAIDV/vista/intranet.php?vista=archivo/consultar_asignatura&id=1","2015-05-09 12:05:00","","","::1","Error en los datos","Modificar","","tasignatura","15491963","editar_asignatura");
INSERT INTO tbitacora VALUES("7090","/CAIDV/vista/intranet.php?vista=archivo/asignatura","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","archivo/asignatura");
INSERT INTO tbitacora VALUES("7091","/CAIDV/vista/intranet.php","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","Panel_inicio");
INSERT INTO tbitacora VALUES("7092","/CAIDV/vista/intranet.php","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","Panel_inicio");
INSERT INTO tbitacora VALUES("7093","/CAIDV/vista/intranet.php?vista=archivo/asignatura","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","archivo/asignatura");
INSERT INTO tbitacora VALUES("7094","/CAIDV/vista/intranet.php?vista=archivo/consultar_asignatura&id=1","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","archivo/consultar_asignatura");
INSERT INTO tbitacora VALUES("7095","http://localhost/CAIDV/vista/intranet.php?vista=archivo/consultar_asignatura&id=1","2015-05-09 12:05:00","","","::1","Error en los datos","Modificar","","tasignatura","15491963","editar_asignatura");
INSERT INTO tbitacora VALUES("7096","/CAIDV/vista/intranet.php?vista=archivo/asignatura","2015-05-09 12:05:00","","","::1","-","Navegar","-","-","15491963","archivo/asignatura");
INSERT INTO tbitacora VALUES("7097","/CAIDV/vista/intranet.php","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","Panel_inicio");
INSERT INTO tbitacora VALUES("7098","/CAIDV/vista/intranet.php","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","Panel_inicio");
INSERT INTO tbitacora VALUES("7099","/CAIDV/vista/intranet.php?vista=curso/registrar_curso","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","15491963","curso/registrar_curso");
INSERT INTO tbitacora VALUES("7100","/CAIDV/vista/intranet.php","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","administrador","Panel_inicio");
INSERT INTO tbitacora VALUES("7101","/CAIDV/vista/intranet.php?vista=curso/registrar_curso","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","administrador","curso/registrar_curso");
INSERT INTO tbitacora VALUES("7102","/CAIDV/vista/intranet.php","2015-05-09 01:05:00","","","::1","-","Navegar","-","-","administrador","Panel_inicio");
INSERT INTO tbitacora VALUES("7103","/CAIDV/vista/intranet.php","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","Panel_inicio");
INSERT INTO tbitacora VALUES("7104","/CAIDV/vista/intranet.php?vista=sistema/noticia","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","sistema/noticia");
INSERT INTO tbitacora VALUES("7105","/CAIDV/vista/intranet.php?vista=sistema/registrar_noticia","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","sistema/registrar_noticia");
INSERT INTO tbitacora VALUES("7106","/CAIDV/vista/intranet.php?vista=sistema/noticia","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","sistema/noticia");
INSERT INTO tbitacora VALUES("7107","/CAIDV/vista/intranet.php","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","Panel_inicio");
INSERT INTO tbitacora VALUES("7108","/CAIDV/vista/intranet.php?vista=seguridad/rol","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/rol");
INSERT INTO tbitacora VALUES("7109","/CAIDV/vista/intranet.php?vista=seguridad/registrar_rol","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/registrar_rol");
INSERT INTO tbitacora VALUES("7110","/CAIDV/vista/intranet.php?vista=seguridad/rol","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/rol");
INSERT INTO tbitacora VALUES("7111","/CAIDV/vista/intranet.php?vista=seguridad/modulo","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/modulo");
INSERT INTO tbitacora VALUES("7112","/CAIDV/vista/intranet.php?vista=seguridad/consultar_modulo&o=Consultar&id=1","2015-05-09 02:05:00","","","::1","-","Consultar","-","-","15491963","seguridad/consultar_modulo");
INSERT INTO tbitacora VALUES("7113","http://localhost/CAIDV/vista/intranet.php?vista=seguridad/consultar_modulo&o=Consultar&id=1","2015-05-09 02:05:00","Administrar","Administración","::1","Error en los datos","Modificar","nombremod","tmodulo","15491963","editar_modulo");
INSERT INTO tbitacora VALUES("7114","/CAIDV/vista/intranet.php?vista=seguridad/modulo","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/modulo");
INSERT INTO tbitacora VALUES("7115","/CAIDV/vista/intranet.php?vista=seguridad/servicio","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/servicio");
INSERT INTO tbitacora VALUES("7116","/CAIDV/vista/intranet.php?vista=seguridad/asignar_modulo","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/asignar_modulo");
INSERT INTO tbitacora VALUES("7117","/CAIDV/vista/intranet.php?vista=seguridad/asignar_modulo&id=1","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/asignar_modulo");
INSERT INTO tbitacora VALUES("7118","/CAIDV/vista/intranet.php","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","Panel_inicio");
INSERT INTO tbitacora VALUES("7119","/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/asignar_servicio");
INSERT INTO tbitacora VALUES("7120","/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio&id=1","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/asignar_servicio");
INSERT INTO tbitacora VALUES("7121","/CAIDV/vista/intranet.php?vista=seguridad/asignar_modulo","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/asignar_modulo");
INSERT INTO tbitacora VALUES("7122","/CAIDV/vista/intranet.php?vista=seguridad/bitacora","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/bitacora");
INSERT INTO tbitacora VALUES("7123","/CAIDV/vista/intranet.php?vista=seguridad/consultar_bitacora&id=7122&o=Consultar","2015-05-09 02:05:00","","","::1","-","Consultar","-","-","15491963","seguridad/consultar_bitacora");
INSERT INTO tbitacora VALUES("7124","/CAIDV/vista/intranet.php?vista=seguridad/bitacora","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/bitacora");
INSERT INTO tbitacora VALUES("7125","/CAIDV/vista/intranet.php?vista=seguridad/auditoria_usuarios","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/auditoria_usuarios");
INSERT INTO tbitacora VALUES("7126","/CAIDV/vista/intranet.php?vista=seguridad/consultar_usuario&id=15491963","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/consultar_usuario");
INSERT INTO tbitacora VALUES("7127","/CAIDV/vista/intranet.php?vista=seguridad/bitacora_reporte","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/bitacora_reporte");
INSERT INTO tbitacora VALUES("7128","/CAIDV/vista/intranet.php?vista=sistema/noticia","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","sistema/noticia");
INSERT INTO tbitacora VALUES("7129","/CAIDV/vista/intranet.php?vista=sistema/slider","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","sistema/slider");
INSERT INTO tbitacora VALUES("7130","/CAIDV/vista/intranet.php?vista=seguridad/bloquear","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/bloquear");
INSERT INTO tbitacora VALUES("7131","/CAIDV/vista/intranet.php?vista=seguridad/bloquear","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/bloquear");
INSERT INTO tbitacora VALUES("7132","/CAIDV/vista/intranet.php?vista=sistema/configurar","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","sistema/configurar");
INSERT INTO tbitacora VALUES("7133","/CAIDV/vista/intranet.php?vista=sistema/configurar","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","sistema/configurar");
INSERT INTO tbitacora VALUES("7134","/CAIDV/vista/intranet.php?vista=seguridad/cambiar_clave","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/cambiar_clave");
INSERT INTO tbitacora VALUES("7135","/CAIDV/vista/intranet.php","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","Panel_inicio");
INSERT INTO tbitacora VALUES("7136","/CAIDV/vista/intranet.php?vista=seguridad/registrar_pregunta","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/registrar_pregunta");
INSERT INTO tbitacora VALUES("7137","/CAIDV/vista/intranet.php","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","Panel_inicio");
INSERT INTO tbitacora VALUES("7138","/CAIDV/vista/intranet.php?vista=archivo/municipio","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","archivo/municipio");
INSERT INTO tbitacora VALUES("7139","/CAIDV/vista/intranet.php?vista=archivo/registrar_municipio","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","archivo/registrar_municipio");
INSERT INTO tbitacora VALUES("7140","/CAIDV/vista/intranet.php?vista=archivo/municipio","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","archivo/municipio");
INSERT INTO tbitacora VALUES("7141","/CAIDV/vista/intranet.php?vista=archivo/consultar_municipio&id=1","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","archivo/consultar_municipio");
INSERT INTO tbitacora VALUES("7142","/CAIDV/vista/intranet.php?vista=archivo/municipio","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","archivo/municipio");
INSERT INTO tbitacora VALUES("7143","/CAIDV/vista/intranet.php?vista=archivo/localidad","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","archivo/localidad");
INSERT INTO tbitacora VALUES("7144","/CAIDV/vista/intranet.php?vista=archivo/institucion","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","archivo/institucion");
INSERT INTO tbitacora VALUES("7145","/CAIDV/vista/intranet.php?vista=archivo/diagnostico","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","archivo/diagnostico");
INSERT INTO tbitacora VALUES("7146","/CAIDV/vista/intranet.php?vista=archivo/parentesco","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","archivo/parentesco");
INSERT INTO tbitacora VALUES("7147","/CAIDV/vista/intranet.php?vista=archivo/institucion","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","archivo/institucion");
INSERT INTO tbitacora VALUES("7148","/CAIDV/vista/intranet.php?vista=archivo/registrar_institucion","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","archivo/registrar_institucion");
INSERT INTO tbitacora VALUES("7149","/CAIDV/vista/intranet.php?vista=archivo/institucion","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","archivo/institucion");
INSERT INTO tbitacora VALUES("7150","/CAIDV/vista/intranet.php?vista=archivo/registrar_institucion&id=2","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","archivo/registrar_institucion");
INSERT INTO tbitacora VALUES("7151","/CAIDV/vista/intranet.php?vista=archivo/institucion","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","archivo/institucion");
INSERT INTO tbitacora VALUES("7152","/CAIDV/vista/intranet.php?vista=archivo/grupo","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","archivo/grupo");
INSERT INTO tbitacora VALUES("7153","/CAIDV/vista/intranet.php?vista=archivo/registrar_grupo","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","archivo/registrar_grupo");
INSERT INTO tbitacora VALUES("7154","http://localhost/CAIDV/vista/intranet.php?vista=archivo/registrar_grupo","2015-05-09 02:05:00","","","::1","Cargar datos","Registrar","*","tgrupo","15491963","registrar_grupo");
INSERT INTO tbitacora VALUES("7155","/CAIDV/vista/intranet.php?vista=archivo/grupo","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","archivo/grupo");
INSERT INTO tbitacora VALUES("7156","http://localhost/CAIDV/vista/intranet.php?vista=archivo/grupo","2015-05-09 02:05:00","1","0","::1","No sé utiliza","Eliminar","estatusgru","tgrupo","15491963","eliminar_grupo");
INSERT INTO tbitacora VALUES("7157","/CAIDV/vista/intranet.php?vista=archivo/grupo","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","archivo/grupo");
INSERT INTO tbitacora VALUES("7158","/CAIDV/vista/intranet.php?vista=archivo/aula","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","archivo/aula");
INSERT INTO tbitacora VALUES("7159","/CAIDV/vista/intranet.php?vista=archivo/area_conocimiento","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","archivo/area_conocimiento");
INSERT INTO tbitacora VALUES("7160","/CAIDV/vista/intranet.php?vista=archivo/consultar_area&id=1","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","archivo/consultar_area");
INSERT INTO tbitacora VALUES("7161","/CAIDV/vista/intranet.php?vista=archivo/area_conocimiento","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","archivo/area_conocimiento");
INSERT INTO tbitacora VALUES("7162","/CAIDV/vista/intranet.php?vista=archivo/asignatura","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","archivo/asignatura");
INSERT INTO tbitacora VALUES("7163","/CAIDV/vista/intranet.php?vista=archivo/consultar_asignatura&id=1","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","archivo/consultar_asignatura");
INSERT INTO tbitacora VALUES("7164","/CAIDV/vista/intranet.php?vista=archivo/asignatura","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","archivo/asignatura");
INSERT INTO tbitacora VALUES("7165","/CAIDV/vista/intranet.php?vista=archivo/item","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","archivo/item");
INSERT INTO tbitacora VALUES("7166","/CAIDV/vista/intranet.php?vista=archivo/consultar_item&id=1","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","archivo/consultar_item");
INSERT INTO tbitacora VALUES("7167","/CAIDV/vista/intranet.php?vista=archivo/item","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","archivo/item");
INSERT INTO tbitacora VALUES("7168","/CAIDV/vista/intranet.php?vista=archivo/instrumento","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","archivo/instrumento");
INSERT INTO tbitacora VALUES("7169","/CAIDV/vista/intranet.php?vista=archivo/consultar_instrumento&id=1","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","archivo/consultar_instrumento");
INSERT INTO tbitacora VALUES("7170","/CAIDV/vista/intranet.php?vista=archivo/instrumento","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","archivo/instrumento");
INSERT INTO tbitacora VALUES("7171","/CAIDV/vista/intranet.php?vista=persona/docente","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","persona/docente");
INSERT INTO tbitacora VALUES("7172","/CAIDV/vista/intranet.php?vista=persona/participante","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","persona/participante");
INSERT INTO tbitacora VALUES("7173","/CAIDV/vista/intranet.php?vista=persona/registrar_participante","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","persona/registrar_participante");
INSERT INTO tbitacora VALUES("7174","/CAIDV/vista/intranet.php?vista=persona/participante","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","persona/participante");
INSERT INTO tbitacora VALUES("7175","http://localhost/CAIDV/vista/intranet.php?vista=persona/participante","2015-05-09 10:05:00","bc3caf8d-1168-4108-ae95-007c7b01c075","1","::1","-","Reporte","idparticipante","-","15491963","plantilla_inscripcion");
INSERT INTO tbitacora VALUES("7176","/CAIDV/vista/intranet.php?vista=persona/personal","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","persona/personal");
INSERT INTO tbitacora VALUES("7177","/CAIDV/vista/intranet.php?vista=curso/lapso","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/lapso");
INSERT INTO tbitacora VALUES("7178","/CAIDV/vista/intranet.php?vista=curso/registrar_curso","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/registrar_curso");
INSERT INTO tbitacora VALUES("7179","http://localhost/CAIDV/vista/intranet.php?vista=curso/registrar_curso","2015-05-09 02:05:00","","","::1","Cargar datos","Registrar","*","tcurso","15491963","registrar_curso");
INSERT INTO tbitacora VALUES("7180","/CAIDV/vista/intranet.php?vista=curso/curso","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/curso");
INSERT INTO tbitacora VALUES("7181","/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_cursos_inscribir");
INSERT INTO tbitacora VALUES("7182","/CAIDV/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=1","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/inscripcion_masiva");
INSERT INTO tbitacora VALUES("7183","http://localhost/CAIDV/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=1","2015-05-09 02:05:00","","","::1","Cargar datos","Registrar","*","tcurso_tparticipante","15491963","inscribir_curso");
INSERT INTO tbitacora VALUES("7184","/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_cursos_inscribir");
INSERT INTO tbitacora VALUES("7185","/CAIDV/vista/intranet.php?vista=curso/asistencia","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/asistencia");
INSERT INTO tbitacora VALUES("7186","/CAIDV/vista/intranet.php?vista=curso/registrar_asistencia&id=1","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/registrar_asistencia");
INSERT INTO tbitacora VALUES("7187","/CAIDV/vista/intranet.php?vista=curso/registrar_asistencia&id=1","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/registrar_asistencia");
INSERT INTO tbitacora VALUES("7188","http://localhost/CAIDV/vista/intranet.php?vista=curso/registrar_asistencia&id=1","2015-05-09 10:05:00","8de3a5a3-55a7-49f2-a86a-af643e28d0b5","","::1","-","Reporte","idevaluacion","-","15491963","evaluacion");
INSERT INTO tbitacora VALUES("7189","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("7190","/CAIDV/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-09 02:05:00","","","::1","-","Navegar","-","-","15491963","curso/registrar_evaluacion");
INSERT INTO tbitacora VALUES("7191","http://localhost/CAIDV/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-09 10:05:00","e3754ef7-39bd-44b3-9366-6a66c89ef98e","","::1","-","Reporte","idevaluacion","-","15491963","evaluacion");
INSERT INTO tbitacora VALUES("7192","http://localhost/CAIDV/vista/intranet.php?vista=curso/registrar_evaluacion","2015-05-09 03:05:00","","","::1","Cargar datos","Registrar","*","tevaluacion","15491963","registrar_evaluacion");
INSERT INTO tbitacora VALUES("7193","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-09 03:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("7194","/CAIDV/vista/intranet.php?vista=reporte/planilla_inscripcion","2015-05-09 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/planilla_inscripcion");
INSERT INTO tbitacora VALUES("7195","http://localhost/CAIDV/vista/intranet.php?vista=reporte/planilla_inscripcion","2015-05-09 10:05:00","d8bffb56-1c57-459d-b2c6-3cff059983dc","1","::1","-","Reporte","idparticipante","-","15491963","plantilla_inscripcion");
INSERT INTO tbitacora VALUES("7196","/CAIDV/vista/intranet.php?vista=reporte/participante_familiar","2015-05-09 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/participante_familiar");
INSERT INTO tbitacora VALUES("7197","http://localhost/CAIDV/vista/intranet.php?vista=reporte/participante_familiar","2015-05-09 10:05:00","8547c3fe-4b5f-4a0d-b41a-5bd73b833524","9837744","::1","-","Reporte","id","-","15491963","familiar_participante");
INSERT INTO tbitacora VALUES("7198","/CAIDV/vista/intranet.php?vista=reporte/historial_lapso","2015-05-09 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/historial_lapso");
INSERT INTO tbitacora VALUES("7199","http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_lapso","2015-05-09 10:05:00","02f6159d-d5d7-433f-b1e5-159869f3b224","2","::1","-","Reporte","idlapso","-","15491963","historial_lapso");
INSERT INTO tbitacora VALUES("7200","/CAIDV/vista/intranet.php?vista=reporte/historial_participante","2015-05-09 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/historial_participante");
INSERT INTO tbitacora VALUES("7201","http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_participante","2015-05-09 10:05:00","841eb144-76b6-4f2e-97e2-88a2935c7073","1","::1","-","Reporte","idparticipante","-","15491963","historial_participante");
INSERT INTO tbitacora VALUES("7202","http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_participante","2015-05-09 10:05:00","3c1565fc-838f-48ad-b594-d967e64c7dc8","2","::1","-","Reporte","idparticipante","-","15491963","historial_participante");
INSERT INTO tbitacora VALUES("7203","/CAIDV/vista/intranet.php?vista=reporte/historial_curso","2015-05-09 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/historial_curso");
INSERT INTO tbitacora VALUES("7204","http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_curso","2015-05-09 10:05:00","3ee6fcab-086a-42d3-bdaa-1222afd0e85c","1","::1","-","Reporte","idcurso","-","15491963","historial_curso");
INSERT INTO tbitacora VALUES("7205","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_etnia","2015-05-09 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_etnia");
INSERT INTO tbitacora VALUES("7206","http://localhost/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_etnia","2015-05-09 10:05:00","68318f68-f12d-4dd9-88c0-76745604906f","","::1","-","Reporte","-","-","15491963","listado_participantes_etnia");
INSERT INTO tbitacora VALUES("7207","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_huerfanos","2015-05-09 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_huerfanos");
INSERT INTO tbitacora VALUES("7208","/CAIDV/vista/intranet.php?vista=reporte/listado_docente_diagnostico","2015-05-09 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_docente_diagnostico");
INSERT INTO tbitacora VALUES("7209","http://localhost/CAIDV/vista/intranet.php?vista=reporte/listado_docente_diagnostico","2015-05-09 10:05:00","32f9dbce-f9d5-466c-8e15-fcb91d103c13","1","::1","-","Reporte","id_diagnostico","-","15491963","listado_docentes_diagnostico");
INSERT INTO tbitacora VALUES("7210","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-09 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("7211","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2","2015-05-09 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("7212","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=1","2015-05-09 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("7213","http://localhost/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=1","2015-05-09 10:05:00","dcf16bbe-ec0d-4ab1-8249-af6f12c8f821","1","::1","-","Reporte","idevaluacion","-","15491963","evaluacion");
INSERT INTO tbitacora VALUES("7214","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-09 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("7215","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia","2015-05-09 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_asistencia");
INSERT INTO tbitacora VALUES("7216","/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2","2015-05-09 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_asistencias");
INSERT INTO tbitacora VALUES("7217","/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=1","2015-05-09 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_asistencias");
INSERT INTO tbitacora VALUES("7218","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia","2015-05-09 03:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_asistencia");
INSERT INTO tbitacora VALUES("7219","/CAIDV/vista/intranet.php","2015-05-09 03:05:00","","","::1","-","Navegar","-","-","15491963","Panel_inicio");
INSERT INTO tbitacora VALUES("7220","/CAIDV/vista/intranet.php","2015-05-14 02:05:00","","","::1","-","Navegar","-","-","15491963","Panel_inicio");
INSERT INTO tbitacora VALUES("7221","/CAIDV/vista/intranet.php?vista=ayuda/acerca","2015-05-14 02:05:00","","","::1","-","Navegar","-","-","15491963","ayuda/acerca");
INSERT INTO tbitacora VALUES("7222","/CAIDV/vista/intranet.php","2015-05-14 02:05:00","","","::1","-","Navegar","-","-","15491963","Panel_inicio");
INSERT INTO tbitacora VALUES("7223","/CAIDV/vista/intranet.php?vista=ayuda/acerca","2015-05-14 02:05:00","","","::1","-","Navegar","-","-","15491963","ayuda/acerca");
INSERT INTO tbitacora VALUES("7224","/CAIDV/vista/intranet.php?vista=ayuda/acerca","2015-05-14 02:05:00","","","::1","-","Navegar","-","-","15491963","ayuda/acerca");
INSERT INTO tbitacora VALUES("7225","/CAIDV/vista/intranet.php?vista=ayuda/acerca","2015-05-14 02:05:00","","","::1","-","Navegar","-","-","15491963","ayuda/acerca");
INSERT INTO tbitacora VALUES("7226","/CAIDV/vista/intranet.php?vista=ayuda/acerca","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","ayuda/acerca");
INSERT INTO tbitacora VALUES("7227","/CAIDV/vista/intranet.php?vista=ayuda/acerca","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","ayuda/acerca");
INSERT INTO tbitacora VALUES("7228","/CAIDV/vista/intranet.php?vista=ayuda/acerca","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","ayuda/acerca");
INSERT INTO tbitacora VALUES("7229","/CAIDV/vista/intranet.php?vista=ayuda/acerca","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","ayuda/acerca");
INSERT INTO tbitacora VALUES("7230","/CAIDV/vista/intranet.php?vista=ayuda/acerca","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","ayuda/acerca");
INSERT INTO tbitacora VALUES("7231","/CAIDV/vista/intranet.php?vista=ayuda/acerca","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","ayuda/acerca");
INSERT INTO tbitacora VALUES("7232","/CAIDV/vista/intranet.php?vista=ayuda/acerca","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","ayuda/acerca");
INSERT INTO tbitacora VALUES("7233","/CAIDV/vista/intranet.php?vista=ayuda/acerca","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","ayuda/acerca");
INSERT INTO tbitacora VALUES("7234","/CAIDV/vista/intranet.php?vista=ayuda/acerca","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","ayuda/acerca");
INSERT INTO tbitacora VALUES("7235","/CAIDV/vista/intranet.php?vista=ayuda/acerca","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","ayuda/acerca");
INSERT INTO tbitacora VALUES("7236","/CAIDV/vista/intranet.php?vista=ayuda/acerca","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","ayuda/acerca");
INSERT INTO tbitacora VALUES("7237","/CAIDV/vista/intranet.php?vista=ayuda/acerca","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","ayuda/acerca");
INSERT INTO tbitacora VALUES("7238","/CAIDV/vista/intranet.php?vista=ayuda/acerca","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","ayuda/acerca");
INSERT INTO tbitacora VALUES("7239","/CAIDV/vista/intranet.php?vista=ayuda/acerca","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","ayuda/acerca");
INSERT INTO tbitacora VALUES("7240","/CAIDV/vista/intranet.php?vista=ayuda/acerca","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","ayuda/acerca");
INSERT INTO tbitacora VALUES("7241","/CAIDV/vista/intranet.php?vista=ayuda/acerca","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","ayuda/acerca");
INSERT INTO tbitacora VALUES("7242","/CAIDV/vista/intranet.php?vista=ayuda/acerca","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","ayuda/acerca");
INSERT INTO tbitacora VALUES("7243","/CAIDV/vista/intranet.php?vista=ayuda/acerca","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","ayuda/acerca");
INSERT INTO tbitacora VALUES("7244","/CAIDV/vista/intranet.php","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","Panel_inicio");
INSERT INTO tbitacora VALUES("7245","/CAIDV/vista/intranet.php?vista=ayuda/acerca","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","ayuda/acerca");
INSERT INTO tbitacora VALUES("7246","/CAIDV/vista/intranet.php","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","Panel_inicio");
INSERT INTO tbitacora VALUES("7247","/CAIDV/vista/intranet.php","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","Panel_inicio");
INSERT INTO tbitacora VALUES("7248","/CAIDV/vista/intranet.php","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","Panel_inicio");
INSERT INTO tbitacora VALUES("7249","/CAIDV/vista/intranet.php?vista=persona/participante","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","persona/participante");
INSERT INTO tbitacora VALUES("7250","/CAIDV/vista/intranet.php?vista=persona/registrar_participante","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","persona/registrar_participante");
INSERT INTO tbitacora VALUES("7251","/CAIDV/vista/intranet.php?vista=persona/participante","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","persona/participante");
INSERT INTO tbitacora VALUES("7252","/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_cursos_inscribir");
INSERT INTO tbitacora VALUES("7253","/CAIDV/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=1","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/inscripcion_masiva");
INSERT INTO tbitacora VALUES("7254","/CAIDV/vista/intranet.php?vista=inscripcion/listado_cursos_inscribir","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_cursos_inscribir");
INSERT INTO tbitacora VALUES("7255","/CAIDV/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=1","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/inscripcion_masiva");
INSERT INTO tbitacora VALUES("7256","/CAIDV/vista/intranet.php?vista=curso/registrar_curso","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","curso/registrar_curso");
INSERT INTO tbitacora VALUES("7257","/CAIDV/vista/intranet.php?vista=archivo/grupo","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","archivo/grupo");
INSERT INTO tbitacora VALUES("7258","/CAIDV/vista/intranet.php?vista=archivo/consultar_grupo&id=3","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","archivo/consultar_grupo");
INSERT INTO tbitacora VALUES("7259","http://localhost/CAIDV/vista/intranet.php?vista=archivo/consultar_grupo&id=3","2015-05-14 03:05:00","15","16","::1","Error en los datos","Modificar","edadmin","tgrupo","15491963","editar_grupo");
INSERT INTO tbitacora VALUES("7260","/CAIDV/vista/intranet.php?vista=archivo/grupo","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","archivo/grupo");
INSERT INTO tbitacora VALUES("7261","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("7262","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("7263","/CAIDV/vista/intranet.php?vista=curso/consultar_evaluacion&id=1","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","curso/consultar_evaluacion");
INSERT INTO tbitacora VALUES("7264","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("7265","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("7266","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("7267","/CAIDV/vista/intranet.php?vista=curso/evaluacion","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","curso/evaluacion");
INSERT INTO tbitacora VALUES("7268","/CAIDV/vista/intranet.php?vista=curso/registrar_curso","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","curso/registrar_curso");
INSERT INTO tbitacora VALUES("7269","http://localhost/CAIDV/vista/intranet.php?vista=curso/registrar_curso","2015-05-14 03:05:00","","","::1","Cargar datos","Registrar","*","tcurso","15491963","registrar_curso");
INSERT INTO tbitacora VALUES("7270","/CAIDV/vista/intranet.php?vista=curso/curso","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","curso/curso");
INSERT INTO tbitacora VALUES("7271","/CAIDV/vista/intranet.php?vista=inscripcion/listado_participantes_inscribir","2015-05-14 03:05:00","","","::1","-","Navegar","-","-","15491963","inscripcion/listado_participantes_inscribir");
INSERT INTO tbitacora VALUES("7272","/CAIDV/vista/intranet.php","2015-05-14 04:05:00","","","::1","-","Navegar","-","-","15491963","Panel_inicio");
INSERT INTO tbitacora VALUES("7273","/CAIDV/vista/intranet.php?vista=reporte/planilla_inscripcion","2015-05-14 04:05:00","","","::1","-","Navegar","-","-","15491963","reporte/planilla_inscripcion");
INSERT INTO tbitacora VALUES("7274","/CAIDV/vista/intranet.php?vista=reporte/planilla_inscripcion","2015-05-14 04:05:00","","","::1","-","Navegar","-","-","15491963","reporte/planilla_inscripcion");
INSERT INTO tbitacora VALUES("7275","http://localhost/CAIDV/vista/intranet.php?vista=reporte/planilla_inscripcion","2015-05-13 11:05:00","2ae918a0-e9c8-4545-92f9-32efc725ee79","2","::1","-","Reporte","idparticipante","-","15491963","plantilla_inscripcion");
INSERT INTO tbitacora VALUES("7276","/CAIDV/vista/intranet.php?vista=reporte/participante_familiar","2015-05-14 04:05:00","","","::1","-","Navegar","-","-","15491963","reporte/participante_familiar");
INSERT INTO tbitacora VALUES("7277","/CAIDV/vista/intranet.php?vista=reporte/planilla_inscripcion","2015-05-14 04:05:00","","","::1","-","Navegar","-","-","15491963","reporte/planilla_inscripcion");
INSERT INTO tbitacora VALUES("7278","http://localhost/CAIDV/vista/intranet.php?vista=reporte/planilla_inscripcion","2015-05-13 11:05:00","2ac3fc3a-2f57-40a1-983d-f96147d01398","2","::1","-","Reporte","idparticipante","-","15491963","plantilla_inscripcion");
INSERT INTO tbitacora VALUES("7279","/CAIDV/vista/intranet.php?vista=reporte/participante_familiar","2015-05-14 04:05:00","","","::1","-","Navegar","-","-","15491963","reporte/participante_familiar");
INSERT INTO tbitacora VALUES("7280","/CAIDV/vista/intranet.php?vista=reporte/planilla_inscripcion","2015-05-14 04:05:00","","","::1","-","Navegar","-","-","15491963","reporte/planilla_inscripcion");
INSERT INTO tbitacora VALUES("7281","http://localhost/CAIDV/vista/intranet.php?vista=reporte/planilla_inscripcion","2015-05-13 11:05:00","ebf6d0ac-831f-47b0-8b20-a3d4c553bf06","2","::1","-","Reporte","idparticipante","-","15491963","plantilla_inscripcion");
INSERT INTO tbitacora VALUES("7282","http://localhost/CAIDV/vista/intranet.php?vista=reporte/planilla_inscripcion","2015-05-13 11:05:00","14fe215a-1008-46b1-b8cf-6999aa0f8ef6","2","::1","-","Reporte","idparticipante","-","15491963","plantilla_inscripcion");
INSERT INTO tbitacora VALUES("7283","http://localhost/CAIDV/vista/intranet.php?vista=reporte/planilla_inscripcion","2015-05-13 11:05:00","20382ea2-c6fb-4618-83f5-bdaf5cc7f288","4","::1","-","Reporte","idparticipante","-","15491963","plantilla_inscripcion");
INSERT INTO tbitacora VALUES("7284","/CAIDV/vista/intranet.php?vista=reporte/participante_familiar","2015-05-14 04:05:00","","","::1","-","Navegar","-","-","15491963","reporte/participante_familiar");
INSERT INTO tbitacora VALUES("7285","http://localhost/CAIDV/vista/intranet.php?vista=reporte/participante_familiar","2015-05-14 12:05:00","3ba34aa6-8c95-44a7-a48e-a747c57696b6","9837744","::1","-","Reporte","id","-","15491963","familiar_participante");
INSERT INTO tbitacora VALUES("7286","/CAIDV/vista/intranet.php?vista=reporte/historial_lapso","2015-05-14 04:05:00","","","::1","-","Navegar","-","-","15491963","reporte/historial_lapso");
INSERT INTO tbitacora VALUES("7287","http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_lapso","2015-05-14 12:05:00","4a2b8e5b-e1a4-43a2-a335-a958f45a2514","2","::1","-","Reporte","idlapso","-","15491963","historial_lapso");
INSERT INTO tbitacora VALUES("7288","/CAIDV/vista/intranet.php?vista=reporte/historial_participante","2015-05-14 04:05:00","","","::1","-","Navegar","-","-","15491963","reporte/historial_participante");
INSERT INTO tbitacora VALUES("7289","http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_participante","2015-05-14 12:05:00","3c717771-9c79-490e-a2dc-ad9eff4b328a","2","::1","-","Reporte","idparticipante","-","15491963","historial_participante");
INSERT INTO tbitacora VALUES("7290","/CAIDV/vista/intranet.php?vista=reporte/historial_curso","2015-05-14 04:05:00","","","::1","-","Navegar","-","-","15491963","reporte/historial_curso");
INSERT INTO tbitacora VALUES("7291","http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_curso","2015-05-14 12:05:00","8c941243-2fda-4c78-8143-61d357c7a8ef","1","::1","-","Reporte","idcurso","-","15491963","historial_curso");
INSERT INTO tbitacora VALUES("7292","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_huerfanos","2015-05-14 04:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_huerfanos");
INSERT INTO tbitacora VALUES("7293","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_etnia","2015-05-14 04:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_etnia");
INSERT INTO tbitacora VALUES("7294","http://localhost/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_etnia","2015-05-14 12:05:00","10c1bdaa-d9bb-4dc0-8a04-882032c07bfe","","::1","-","Reporte","-","-","15491963","listado_participantes_etnia");
INSERT INTO tbitacora VALUES("7295","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_etnia","2015-05-14 04:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_etnia");
INSERT INTO tbitacora VALUES("7296","http://localhost/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_etnia","2015-05-14 12:05:00","fff52b27-ac2a-40de-9a73-c41cfdfedf72","","::1","-","Reporte","-","-","15491963","listado_participantes_etnia");
INSERT INTO tbitacora VALUES("7297","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_huerfanos","2015-05-14 04:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_huerfanos");
INSERT INTO tbitacora VALUES("7298","/CAIDV/vista/intranet.php?vista=reporte/listado_docente_diagnostico","2015-05-14 04:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_docente_diagnostico");
INSERT INTO tbitacora VALUES("7299","http://localhost/CAIDV/vista/intranet.php?vista=reporte/listado_docente_diagnostico","2015-05-14 12:05:00","3a09a55a-f7c6-42a4-ae33-81fd3d8fa722","1","::1","-","Reporte","id_diagnostico","-","15491963","listado_docentes_diagnostico");
INSERT INTO tbitacora VALUES("7300","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_evaluaciones","2015-05-14 04:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_evaluaciones");
INSERT INTO tbitacora VALUES("7301","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2","2015-05-14 04:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("7302","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=1","2015-05-14 04:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("7303","http://localhost/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2&idlapso=2&idcurso=1","2015-05-14 12:05:00","1779db3c-6e85-43c2-9fd9-8aec3fec631f","1","::1","-","Reporte","idevaluacion","-","15491963","evaluacion");
INSERT INTO tbitacora VALUES("7304","/CAIDV/vista/intranet.php?vista=reporte/consultar_evaluaciones&idparticipante=2","2015-05-14 04:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_evaluaciones");
INSERT INTO tbitacora VALUES("7305","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_asistencia","2015-05-14 04:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_asistencia");
INSERT INTO tbitacora VALUES("7306","/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2","2015-05-14 04:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_asistencias");
INSERT INTO tbitacora VALUES("7307","/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=1","2015-05-14 04:05:00","","","::1","-","Navegar","-","-","15491963","reporte/consultar_asistencias");
INSERT INTO tbitacora VALUES("7308","http://localhost/CAIDV/vista/intranet.php?vista=reporte/consultar_asistencias&idparticipante=2&idlapso=2&idcurso=1","2015-05-14 12:05:00","68e7f768-cf46-43dd-ad20-726abc0050da","","::1","-","Reporte","idevaluacion","-","15491963","evaluacion");
INSERT INTO tbitacora VALUES("7309","/CAIDV/vista/intranet.php?vista=reporte/planilla_inscripcion","2015-05-14 04:05:00","","","::1","-","Navegar","-","-","15491963","reporte/planilla_inscripcion");
INSERT INTO tbitacora VALUES("7310","http://localhost/CAIDV/vista/intranet.php?vista=reporte/planilla_inscripcion","2015-05-14 12:05:00","69ba4828-1839-413a-b82d-4a23dea030ed","20","::1","-","Reporte","idparticipante","-","15491963","plantilla_inscripcion");
INSERT INTO tbitacora VALUES("7311","http://localhost/CAIDV/vista/intranet.php?vista=reporte/planilla_inscripcion","2015-05-14 12:05:00","b0233567-04f8-47d5-aa96-0364577c9db5","20","::1","-","Reporte","idparticipante","-","15491963","plantilla_inscripcion");
INSERT INTO tbitacora VALUES("7312","http://localhost/CAIDV/vista/intranet.php?vista=reporte/planilla_inscripcion","2015-05-14 12:05:00","dfc9ead8-44a5-46df-b76b-dc628d4f2c82","18","::1","-","Reporte","idparticipante","-","15491963","plantilla_inscripcion");
INSERT INTO tbitacora VALUES("7313","/CAIDV/vista/intranet.php","2015-05-14 05:05:00","","","::1","-","Navegar","-","-","15491963","Panel_inicio");
INSERT INTO tbitacora VALUES("7314","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_huerfanos","2015-05-14 05:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_huerfanos");
INSERT INTO tbitacora VALUES("7315","/CAIDV/vista/intranet.php?vista=archivo/grupo","2015-05-14 05:05:00","","","::1","-","Navegar","-","-","15491963","archivo/grupo");
INSERT INTO tbitacora VALUES("7316","http://localhost/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_huerfanos","2015-05-14 12:05:00","b8dfb158-4f5e-40a9-a459-6bbd54c254a0","","::1","-","Reporte","-","-","15491963","listado_participantes_huerfanos");
INSERT INTO tbitacora VALUES("7317","/CAIDV/vista/intranet.php?vista=archivo/grupo","2015-05-14 05:05:00","","","::1","-","Navegar","-","-","15491963","archivo/grupo");
INSERT INTO tbitacora VALUES("7318","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_huerfanos","2015-05-14 05:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_huerfanos");
INSERT INTO tbitacora VALUES("7319","http://localhost/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_huerfanos","2015-05-14 12:05:00","affffbe3-bc68-4632-971c-026e1f9a098f","","::1","-","Reporte","-","-","15491963","listado_participantes_huerfanos");
INSERT INTO tbitacora VALUES("7320","/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_huerfanos","2015-05-14 05:05:00","","","::1","-","Navegar","-","-","15491963","reporte/listado_participantes_huerfanos");
INSERT INTO tbitacora VALUES("7321","http://localhost/CAIDV/vista/intranet.php?vista=reporte/listado_participantes_huerfanos","2015-05-14 12:05:00","997ab1c2-81ac-4205-8f8f-b324b4ec305d","","::1","-","Reporte","-","-","15491963","listado_participantes_huerfanos");
INSERT INTO tbitacora VALUES("7322","/CAIDV/vista/intranet.php","2015-05-16 02:05:00","","","::1","-","Navegar","-","-","15491963","Panel_inicio");
INSERT INTO tbitacora VALUES("7323","/CAIDV/vista/intranet.php?vista=seguridad/rol","2015-05-16 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/rol");
INSERT INTO tbitacora VALUES("7324","/CAIDV/vista/intranet.php?vista=seguridad/bitacora","2015-05-16 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/bitacora");
INSERT INTO tbitacora VALUES("7325","/CAIDV/vista/intranet.php?vista=seguridad/consultar_bitacora&id=7259&o=Consultar","2015-05-16 02:05:00","","","::1","-","Consultar","-","-","15491963","seguridad/consultar_bitacora");
INSERT INTO tbitacora VALUES("7326","/CAIDV/vista/intranet.php?vista=reporte/historial_participante","2015-05-16 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/historial_participante");
INSERT INTO tbitacora VALUES("7327","/CAIDV/vista/intranet.php?vista=reporte/historial_lapso","2015-05-16 02:05:00","","","::1","-","Navegar","-","-","15491963","reporte/historial_lapso");
INSERT INTO tbitacora VALUES("7328","http://localhost/CAIDV/vista/intranet.php?vista=reporte/historial_lapso","2015-05-16 10:05:00","3021da72-267e-4484-a694-09e7e09a8f6f","2","::1","-","Reporte","idlapso","-","15491963","historial_lapso");
INSERT INTO tbitacora VALUES("7329","/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio","2015-05-16 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/asignar_servicio");
INSERT INTO tbitacora VALUES("7330","/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio&id=1","2015-05-16 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/asignar_servicio");
INSERT INTO tbitacora VALUES("7331","/CAIDV/vista/intranet.php","2015-05-16 02:05:00","","","::1","-","Navegar","-","-","15491963","Panel_inicio");
INSERT INTO tbitacora VALUES("7332","/CAIDV/vista/intranet.php?vista=seguridad/servicio","2015-05-16 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/servicio");
INSERT INTO tbitacora VALUES("7333","/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=130","2015-05-16 02:05:00","","","::1","-","Consultar","-","-","15491963","seguridad/consultar_servicio");
INSERT INTO tbitacora VALUES("7334","http://localhost/CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&o=Consultar&id=130","2015-05-16 02:05:00","5","1","::1","Error en los datos","Modificar","idmodulo","tservicio","15491963","editar_servicio");
INSERT INTO tbitacora VALUES("7335","/CAIDV/vista/intranet.php?vista=seguridad/servicio","2015-05-16 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/servicio");
INSERT INTO tbitacora VALUES("7336","/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio","2015-05-16 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/asignar_servicio");
INSERT INTO tbitacora VALUES("7337","/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio&id=1","2015-05-16 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/asignar_servicio");
INSERT INTO tbitacora VALUES("7338","/CAIDV/vista/intranet.php?vista=seguridad/asignar_servicio","2015-05-16 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/asignar_servicio");
INSERT INTO tbitacora VALUES("7339","/CAIDV/vista/intranet.php?vista=seguridad/mantenimiento_bd","2015-05-16 02:05:00","","","::1","-","Navegar","-","-","15491963","seguridad/mantenimiento_bd");



DROP TABLE tclave;

CREATE TABLE `tclave` (
  `idclave` int(11) NOT NULL AUTO_INCREMENT,
  `clavecla` varchar(45) NOT NULL,
  `fechainiciocla` date NOT NULL,
  `fechafincla` date NOT NULL,
  `estatuscla` tinyint(1) NOT NULL DEFAULT '1',
  `tusuario_idusuario` varchar(20) NOT NULL,
  PRIMARY KEY (`idclave`),
  KEY `fk_tclave_tusuario1_idx` (`tusuario_idusuario`),
  CONSTRAINT `fk_tclave_tusuario1` FOREIGN KEY (`tusuario_idusuario`) REFERENCES `tusuario` (`idusuario`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

INSERT INTO tclave VALUES("1","96cab341bae5567148a5e5d9e636e13e","2014-01-25","2014-02-13","0","administrador");
INSERT INTO tclave VALUES("3","f7c3bc1d808e04732adf679965ccc34ca7ae3441","2014-02-13","2014-10-15","0","administrador");
INSERT INTO tclave VALUES("9","a1ea88131cd3c74cee8e3f0712bfb707abe0e761","2014-10-15","2015-02-22","0","administrador");
INSERT INTO tclave VALUES("13","7cc24b2198339d797e704bc53c6527dc6b400b59","2015-02-22","2015-06-22","1","administrador");
INSERT INTO tclave VALUES("14","7c222fb2927d828af22f592134e8932480637c0d","2015-03-23","2015-03-23","0","15491963");
INSERT INTO tclave VALUES("15","47fa7fdd4db234bc01c34c85e5e0add77d4a1cc9","2015-03-23","2015-07-21","1","15491963");
INSERT INTO tclave VALUES("16","7c222fb2927d828af22f592134e8932480637c0d","2015-03-23","2015-07-21","1","17960877");
INSERT INTO tclave VALUES("17","7c222fb2927d828af22f592134e8932480637c0d","2015-03-23","2015-03-23","0","12526145");
INSERT INTO tclave VALUES("18","085d79cf841505f3e79f043884f8875416324966","2015-03-23","2015-07-21","1","12526145");
INSERT INTO tclave VALUES("19","7c222fb2927d828af22f592134e8932480637c0d","2015-03-24","2015-07-22","1","18672728");



DROP TABLE tcurso;

CREATE TABLE `tcurso` (
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
  KEY `taula_idaula` (`taula_idaula`),
  CONSTRAINT `fk_tcurso_taula_1` FOREIGN KEY (`taula_idaula`) REFERENCES `taula` (`idaula`),
  CONSTRAINT `fk_tcurso_tgrupo1` FOREIGN KEY (`tgrupo_idgrupo`) REFERENCES `tgrupo` (`idgrupo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tcurso_tlapso1` FOREIGN KEY (`tlapso_idlapso`) REFERENCES `tlapso` (`idlapso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tcurso_ibfk_1` FOREIGN KEY (`tasignatura_idasignatura`) REFERENCES `tasignatura` (`idasignatura`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO tcurso VALUES("1","INICIAL - INFORMATICA","","20","1","2","1","1","8","19307641");
INSERT INTO tcurso VALUES("2","JUVENIL - INFORMATICA","","20","1","2","2","1","8","19376868");



DROP TABLE tcurso_tparticipante;

CREATE TABLE `tcurso_tparticipante` (
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
  KEY `fk_tcurso_tinscripcion_tparticipante1_idx` (`tparticipante_idparticipante`),
  CONSTRAINT `fk_tcurso_idcurso` FOREIGN KEY (`tcurso_idcurso`) REFERENCES `tcurso` (`idcurso`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `tcurso_tparticipante_ibfk_1` FOREIGN KEY (`tparticipante_idparticipante`) REFERENCES `tparticipante` (`idparticipante`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO tcurso_tparticipante VALUES("1","1","2","1","2015-05-09","","","10143804","");
INSERT INTO tcurso_tparticipante VALUES("2","1","3","1","2015-05-09","","","10143804","");
INSERT INTO tcurso_tparticipante VALUES("3","1","8","1","2015-05-09","","","10143804","");
INSERT INTO tcurso_tparticipante VALUES("4","1","9","1","2015-05-09","","","10143804","");
INSERT INTO tcurso_tparticipante VALUES("5","1","11","1","2015-05-09","","","10143804","");



DROP TABLE tdiagnostico;

CREATE TABLE `tdiagnostico` (
  `iddiagnostico` int(11) NOT NULL AUTO_INCREMENT,
  `descripciondia` varchar(65) NOT NULL,
  `estatusdia` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`iddiagnostico`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO tdiagnostico VALUES("1","VISION NORMAL","1");
INSERT INTO tdiagnostico VALUES("2","BAJA VISION","1");
INSERT INTO tdiagnostico VALUES("3","CIEGO","1");
INSERT INTO tdiagnostico VALUES("4","CIEGA","1");



DROP TABLE tdocente;

CREATE TABLE `tdocente` (
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
  KEY `fk_tprofesor_tdiagnostico1_idx` (`tdiagnostico_iddiagnostico`),
  CONSTRAINT `fk_tprofesor_tdiagnostico1` FOREIGN KEY (`tdiagnostico_iddiagnostico`) REFERENCES `tdiagnostico` (`iddiagnostico`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO tdocente VALUES("V","10143804","YAJAIRA","","SOTO","","F","1967-12-05","ARAURE","04245642522","","LICENCIADO EN EDUCACION","ESPECIALISTA","1","1","2");
INSERT INTO tdocente VALUES("V","10636038","JOHNNY","","MENA","","M","1969-06-15","ARAURE","04168391072","","LICENCIADO EN EDUCACION","ESPECIALISTA","1","1","2");
INSERT INTO tdocente VALUES("V","11542306","AURA","","TORREALBA","","F","1973-04-11","ACARIGUA","04263083310","","LICENCIADA EN EDUCACION","AULA","1","1","1");
INSERT INTO tdocente VALUES("V","11544033","JULIMAR","","CONDE","","F","1972-05-05","ACARIGUA","04167597154","","PREGRADO","ESPECIALISTA","1","1","1");
INSERT INTO tdocente VALUES("V","11549138","MARIA","","RODRIGUEZ","","F","1964-07-17","ARAURE","04145943812","","LICENCIADO EN EDUCACION","ESPECIALISTA","1","1","2");
INSERT INTO tdocente VALUES("V","11849063","JAVIER","","FUIGUEREDO","","M","1974-03-20","ACARIGUA","04161502524","","LICENCIADO EN EDUCACION","AULA","1","3","1");
INSERT INTO tdocente VALUES("V","12265074","ANA","MARIA","SERRADA","","F","1974-01-18","ARAURE","04161456847","","TSU EN EDUCACION","AULA","1","1","2");
INSERT INTO tdocente VALUES("V","12965189","CARMEN","","SALCEDO","","F","1975-01-04","ACARIGUA","04245199580","","PREGRADO","AULA","1","1","1");
INSERT INTO tdocente VALUES("V","13072250","MEIBRY","","GRIMAN","","F","1976-03-08","ACARIGUA","04145527240","","LICENCIADO EN EDUCACION","ESPECIALISTA","1","1","1");
INSERT INTO tdocente VALUES("V","13306670","MARLE","","ALVARADO","","F","1976-06-04","ARAURE","04267551363","","LICENCIADO EN EDUCACION","AULA","1","1","2");
INSERT INTO tdocente VALUES("V","19307641","CRITOBAL","","OSPINO","","M","1986-02-28","ARAURE","04167556649","","LICENCIADO EN EDUCACION","AULA","1","3","2");
INSERT INTO tdocente VALUES("V","19376868","IVON","","CAMACHO","","F","1987-08-09","ACARIGUA","04145787444","","LICENCIADO EN EDUCACION","AULA","1","1","1");
INSERT INTO tdocente VALUES("V","5957406","CARMEN","","LOBO","","F","1959-10-31","ACARIGUA","04260308331","","POSTGRADO","ESPECIALISTA","1","1","1");
INSERT INTO tdocente VALUES("V","7596895","YAJAIRA","","PADILLA","","F","1962-02-23","ACARIGUA","04163510058","","LICENCIADO EN EDUCACION","AULA","1","1","1");



DROP TABLE tevaluacion;

CREATE TABLE `tevaluacion` (
  `idevaluacion` int(11) NOT NULL AUTO_INCREMENT,
  `fechaeva` datetime NOT NULL,
  `observacioneva` text COLLATE utf8_spanish2_ci,
  `estatuseva` char(1) COLLATE utf8_spanish2_ci DEFAULT '1',
  `idcurso_idparticipante` int(11) NOT NULL,
  `tinstrumento_idinstrumento` int(11) DEFAULT NULL,
  PRIMARY KEY (`idevaluacion`),
  KEY `fk_tevaluacion_tcurso_tparticipante_1` (`idcurso_idparticipante`),
  KEY `fk_tevaluacion_tinstrumento_1` (`tinstrumento_idinstrumento`),
  CONSTRAINT `fk_tevaluacion_tcurso_tparticipante_1` FOREIGN KEY (`idcurso_idparticipante`) REFERENCES `tcurso_tparticipante` (`idcurso_participante`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_tevaluacion_tinstrumento_1` FOREIGN KEY (`tinstrumento_idinstrumento`) REFERENCES `tinstrumento` (`idinstrumento`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO tevaluacion VALUES("1","2015-05-09 00:00:00","","1","1","1");



DROP TABLE tevaluacion_item;

CREATE TABLE `tevaluacion_item` (
  `tevaluacion_idevaluacion` int(11) NOT NULL,
  `titem_iditem` int(11) NOT NULL,
  `valor` varchar(500) COLLATE utf8_spanish2_ci DEFAULT NULL,
  KEY `fk_tevaluacion_item_titem_1` (`titem_iditem`),
  KEY `fk_tevaluacion_evaluacion_idevaluacion_1` (`tevaluacion_idevaluacion`),
  CONSTRAINT `fk_tevaluacion_item_tevaluacion_1` FOREIGN KEY (`tevaluacion_idevaluacion`) REFERENCES `tevaluacion` (`idevaluacion`),
  CONSTRAINT `fk_tevaluacion_item_titem_1` FOREIGN KEY (`titem_iditem`) REFERENCES `titem` (`iditem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO tevaluacion_item VALUES("1","1","SI LOGRO LOS OBJETIVOS");
INSERT INTO tevaluacion_item VALUES("1","2","BUEN AVANCE");



DROP TABLE tfamiliar;

CREATE TABLE `tfamiliar` (
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
  KEY `fk_tfamiliar_tdiagnostico1_idx` (`tdiagnostico_iddiagnostico`),
  CONSTRAINT `fk_tfamiliar_tdiagnostico1` FOREIGN KEY (`tdiagnostico_iddiagnostico`) REFERENCES `tdiagnostico` (`iddiagnostico`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO tfamiliar VALUES("V","11078708","GRISELIDYS","","SILVA","","F","04161234568","","1978-07-19","ARAURE","AMA DE CASA","BACHILLERATO","2","5000","1","1","2");
INSERT INTO tfamiliar VALUES("V","11079158","NAYIVEL","","AMAYA","","F","00000000000","","1973-04-26","CASERíO SABANETICA CALLE PRINCIPAL CASA S/N","AMA DE CASA","BACHILLERATO","1","0","1","1","1");
INSERT INTO tfamiliar VALUES("V","11540170","RAFAEL ","RAMON","ADJUNTA","REYES","M","04165368716","","1974-06-04","BARRIO SANTA  ELENA AV. 5 ENTRE CALLES 1 Y 2 CASA NRO 15.","OBRERO","PRIMARIA","6","5400","1","1","1");
INSERT INTO tfamiliar VALUES("V","11542861","CARDINA","","MEDINA","","F","04164514140","","1973-02-05","CASERíO MIJAGUITO CALLE PRINCIPAL CASA # 55","AMA DE CASA","BACHILLERATO","2","0","1","1","1");
INSERT INTO tfamiliar VALUES("V","11847486","MIRY ","","ORTIZ","","F","04165368716","","1974-06-04","BARRIO \"SANTA ELENA\" AV. 5 ENTRE CALLES 1 Y 2. CASA NRO. 15 ","OFICIO DEL HOGAR","PRIMARIA","5","0","1","1","1");
INSERT INTO tfamiliar VALUES("V","13353263","MARIA","EUGENIA","REYES","PEñA","F","04145146347","","1977-06-13","LA MIEL","GERENTE","LICENCIADO","2","20000","1","1","2");
INSERT INTO tfamiliar VALUES("V","15493031","YASIREé ","","HERNáNDEZ","","F","04148876543","","1960-02-05","DIRECCION","AMA DE CASA","PRIMARIA","3","3000","1","1","1");
INSERT INTO tfamiliar VALUES("V","16964940","CAROLINA","","QUEVEDO","","F","04262405761","","1975-11-26","BARRIO LA DEMOCRACIA AV. 1 CALLEJóN 1 CASA #32","AMA DE CASA","TECNICO MEDIO","3","5000","1","1","1");
INSERT INTO tfamiliar VALUES("V","17364390","LEIDY","","LOPEZ","","F","00000000000","","1986-12-07","URB DURIGUA 2 CALLE 4 CASA 1","AMA DE CASA","BACHILLERATO","2","0","1","1","1");
INSERT INTO tfamiliar VALUES("V","18732314","MARIANGELA","","QUEVEDO","","F","04268492413","","1987-07-30","RIO ACARIGUA CALLE 1 SECTOR EL SAMAN","ESTUDIANTE","BACHILLERATO","1","0","1","1","7");
INSERT INTO tfamiliar VALUES("V","19170250","MARISOL","","MONTES","","F","04167528081","","1989-02-08","BARRIO LA PAZ","OFICIO DEL HOGAR","BACHILLERATO","2","5600","1","1","1");
INSERT INTO tfamiliar VALUES("V","20157379","JOSCARLY","","RUIZ","","M","04160389433","","1992-07-07","URB SAN JOSE 2 LOTE A CASA 39","ESTUDIANTE","BACHILLERATO","1","0","1","1","2");
INSERT INTO tfamiliar VALUES("V","21563851","YURAIMA","","MEDINA","","F","00000000000","","1993-09-20","URB. SAN JOSé II CALLE 15 TERRAZA # 05","ESTUDIANTE","BACHILLERATO","1","0","1","1","2");
INSERT INTO tfamiliar VALUES("V","9837744","LEONOR","","MENDOZA","","F","04266526658","","1974-07-17","URB. TRICENTENARIA F-8 CASA # 08","AMA DE CASA","BACHILLERATO","2","6000","1","1","2");
INSERT INTO tfamiliar VALUES("V","99999999","MISMO","","SE REPRESENTA ASI","","M","00000000000","","2000-01-01","NO APLICA","NO APLICA","PRIMARIA","0","0","1","1","1");



DROP TABLE tgrupo;

CREATE TABLE `tgrupo` (
  `idgrupo` int(11) NOT NULL AUTO_INCREMENT,
  `nombregru` varchar(45) NOT NULL,
  `descripciongru` varchar(45) DEFAULT NULL,
  `estatusgru` int(11) NOT NULL DEFAULT '1',
  `edadmin` char(2) NOT NULL,
  `edadmax` char(2) NOT NULL,
  PRIMARY KEY (`idgrupo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO tgrupo VALUES("1","INICIAL"," NIÑOS EN EDADES ENTRE CERO Y SEIS AÑ","1","0","6");
INSERT INTO tgrupo VALUES("2","JUVENIL","ESTE GRUPO ESTA COMPREDIDO POR NIÑOS DE SIET","1","7","15");
INSERT INTO tgrupo VALUES("3","ADULTO","ESTA COMPRENDIDO POR PERSONAS DE QUINCE AÑOS","1","16","99");



DROP TABLE tinscripcion;

CREATE TABLE `tinscripcion` (
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
  KEY `fk_tinscripcion_tinstitucion1_idx` (`tinstitucion_idinstitucion`),
  CONSTRAINT `fk_tinscripcion_tparticipante` FOREIGN KEY (`idparticipante`) REFERENCES `tparticipante` (`idparticipante`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

INSERT INTO tinscripcion VALUES("1","1","2 DO","A","2015-03-24","MAÑANA","LU","  BAJA VISION         ","09837744.jpeg","1","1","1","1","0","10","       "," ACROMATOPSIA CONGéNITA.          ","1","BACHILLER","MAÑANA","MARIA","","ALBA QUINTANA","","","","9837744","6000.00","0.00","","limpieza","1","las mañanas");
INSERT INTO tinscripcion VALUES("2","2","1 ERO","A","2015-03-24","TARDE","LU,MA,MI,JU,VI"," NINGUNA ","","0","0","1","1","0","5"," REFORZAR APRENDIZAJE "," MICROFTALMUS OD. DIGéNESIS DEL SEGMENTO ANTERIOR. ","1","PRIMARIA","MAÑANA","CRISTOBLA","04245554321","JAVIER","04147875436","","","11078708","5000.00","0.00","","limpieza","1","las mañanas");
INSERT INTO tinscripcion VALUES("3","3","1RO","B","2015-03-24","MAÑANA","LU,MI"," VDSFDSGFGFGS    ","15493031.jpeg","1","1","1","1","1","6"," DSD    "," MIOPíA MAGNA EN AMBOS OJOS ASOCIADA.    ","1","PRIMARIA","TARDE","ASDSD","34232323","ASDSAD","213342434","","","15493031","0.00","0.00","Beca Madres del Barrio","Cocinar","1","manana");
INSERT INTO tinscripcion VALUES("4","4","5 TO","B","2015-03-24","TARDE","LU,MA,MI,JU,VI"," CIEGO TOTALMENTE   ","","1","0","1","1","0","4"," MEJOR ADAPTACION   "," MICROFTALMUS BILATERAL CONGENITO   ","1","PRIMARIA","MAÑANA","NO ","00000000000","NO","00000000000","","","16964940","0.00","0.00","el esposo cubre los gastos","limpieza","0","");
INSERT INTO tinscripcion VALUES("5","5","1","A","2015-03-24","MAÑANA","LU,MA,MI,JU,VI","APáTICO A LOS GRUPOS    ","19170250.jpeg","1","1","1","1","0","1"," NINGUNO    "," RETINOPATíA DE LA PREMATURIDAD    ","1","PRIMARIA","TARDE","YULIMAR CONDE","02556659490","GENESIS PARADA","02556645789","","","19170250","5600.00","0.00","trabaja de oficios de hogares","cocinar y limpiar","0","");
INSERT INTO tinscripcion VALUES("6","6","6TO","B","2015-03-26","MAÑANA","MI"," ASISTE SEMANLMENTE AL CAIDV    ","11847486.jpeg","1","1","1","1","0","9","     "," MICROFTALMO EN AMBOS OJOS    ","1","PRIMARIA","TARDE","ALBA QUINTANA","04127743137","","","","","11847486","0.00","0.00","no","no","0","");
INSERT INTO tinscripcion VALUES("7","7","","","2015-05-01","MAÑANA","LU,MA,MI,JU,VI"," NO APLICA","","1","0","1","1","0","0"," "," CATARATA CONGéNITA","0","NINGUNO","","","","","","","","","0.00","0.00","no","no","0","");
INSERT INTO tinscripcion VALUES("8","8","PRIMER  NIVEL","","2015-05-01","MAÑANA","LU,MA,MI,JU,VI"," ","","1","0","1","1","0","14"," "," LEUCOMA CORNEAL Y GLAUCOMA BILATERAL CONGéN","1","PRE-ESCOLAR","MAÑANA","IVON CAMACHO","","","","","","","0.00","0.00","","ELEBORACION DE MANUELIDADES","1","TODOS LOS DIAS");
INSERT INTO tinscripcion VALUES("9","9","1 ER NIVEL","","2015-05-01","MAÑANA","LU,MA,MI,JU,VI"," ","","1","0","1","1","0","15"," "," MICROFTALMUS","1","PRE-ESCOLAR","MAÑANA","","","","","","","","0.00","0.00","","","0","");
INSERT INTO tinscripcion VALUES("10","10","4TO","B","2015-05-01","MAÑANA","LU,MA","   ","","1","1","1","1","0","10","   ","  CATARATA CONGéNITA.\n ","1","PRIMARIA","TARDE","","","","","","","99999999","0.00","0.00","","","1","");
INSERT INTO tinscripcion VALUES("11","11","3 ER NIVEL","","2015-05-01","MAÑANA","LU,MA,MI,JU,VI"," ","","1","0","1","1","0","14"," ","NIGTASMUS HORIZONTAL PENDULAR, MIOPíA, ESTRABISMO ","1","PRE-ESCOLAR","MAÑANA","","","","","","","","0.00","0.00","","","0","");
INSERT INTO tinscripcion VALUES("12","12","","","2015-05-01","MAÑANA","LU,MA,MI,JU,VI","  ","","1","1","1","1","0","0","  "," ATROFIA óPTICA BILATERAL\n ","0","NINGUNO","","","","","","","","99999999","0.00","0.00","","","1","");
INSERT INTO tinscripcion VALUES("13","13","","","2015-05-01","MAÑANA","LU,MA,MI,JU,VI"," ","","1","1","1","1","0","7"," "," RETINOSIS PIGMENTARIA\n","1","NINGUNO","MAÑANA","","","","","","","","0.00","0.00","","","1","");
INSERT INTO tinscripcion VALUES("14","14","2 DO GRADO","","2015-05-01","MAÑANA","LU,MA,MI,JU,VI"," ","","1","0","1","1","0","12"," "," RETINOPATíA DE LA PREMATURIDAD","1","PRIMARIA","MAÑANA","","","IVON CAMACHO","","","","","0.00","0.00","","","0","");
INSERT INTO tinscripcion VALUES("15","15","","","2015-05-01","MAÑANA","LU,MA,MI,JU,VI"," ","","1","1","1","1","0","7"," "," RETINOSIS PIGMENTARIA\n","1","NINGUNO","MAÑANA","","","","","","","","0.00","0.00","","","1","");
INSERT INTO tinscripcion VALUES("16","16","4 TO GRADO","","2015-05-01","MAÑANA","LU,MA,MI,JU,VI"," ","","1","0","1","1","0","12"," "," AMAUROSIS CONGéNITA LEBER","1","PRIMARIA","MAÑANA","","","IVON CAMACHO","","","","","0.00","0.00","","","0","");
INSERT INTO tinscripcion VALUES("17","17","","","2015-05-01","MAÑANA","LU,MA,MI,JU,VI"," ","","1","1","1","1","0","7"," "," CIEGO\n","1","NINGUNO","MAÑANA","","","","","","","","0.00","0.00","","","1","");
INSERT INTO tinscripcion VALUES("18","18","","","2015-05-01","MAÑANA","LU,MA,MI,JU,VI"," ","","1","1","1","1","0","7"," "," LEUCOMA Y GLAUCOMA EN AMBOS OJOS\n\n","1","NINGUNO","MAÑANA","","","","","","","","0.00","0.00","","","1","");
INSERT INTO tinscripcion VALUES("19","19","","","2015-05-01","MAÑANA","LU,MA,MI,JU,VI"," ","","1","1","1","1","0","7"," "," RETINOBLASTOMA BILATERAL\n","1","NINGUNO","MAÑANA","","","","","","","","0.00","0.00","","","1","");
INSERT INTO tinscripcion VALUES("20","20","","","2015-05-01","MAÑANA","LU,MA,MI,JU,VI"," ","","1","1","1","1","0","7"," "," ANIRIDIA CONGéNITA.\n","1","NINGUNO","MAÑANA","","","","","","","","0.00","0.00","","","1","");



DROP TABLE tinstitucion;

CREATE TABLE `tinstitucion` (
  `idinstitucion` int(11) NOT NULL AUTO_INCREMENT,
  `descripcioninst` varchar(40) NOT NULL,
  `direccioninst` varchar(60) NOT NULL,
  `directorinst` varchar(60) NOT NULL,
  `estatusinst` tinyint(1) NOT NULL DEFAULT '1',
  `tlocalidad_idlocalidad` int(11) NOT NULL,
  PRIMARY KEY (`idinstitucion`),
  KEY `fk_tinstitucion_tlocalidad1_idx` (`tlocalidad_idlocalidad`),
  CONSTRAINT `fk_tinstitucion_tlocalidad1` FOREIGN KEY (`tlocalidad_idlocalidad`) REFERENCES `tlocalidad` (`idlocalidad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

INSERT INTO tinstitucion VALUES("1","LICEO BOLIVARIANO JOSE ANTONIO PAEZ","AV. LIBERTADOR Y AV. 32 FRENTE A LA PLAZA ANDRES ELOY BLANCO","LICENCIADA MARITZA GUTIERREZ","1","1");
INSERT INTO tinstitucion VALUES("2","ETIR SIMON BOLIVAR","AV. JOSE ANTONIO PAEZ FRENTE AL PARQUE MUSIU CARMELO ","LICENCIADA CARMINA LOMBANO","1","1");
INSERT INTO tinstitucion VALUES("3","LICEO BOLIVARIANO CINCO DE DICIEMBRE","CALLE 31 VIA CEMENTERIO VIEJO AL LADO DEL EDIFICIO DE MALARI","LICENCIADO CARLOS HERNANDEZ","1","1");
INSERT INTO tinstitucion VALUES("4","UNIDAD EDUCATIVA FE Y ALEGRIA NTRA SRA D","CALLE 28 CON AV 53 SECTOR BELLA VISTA 2","LICENCIADO EVELIN ZAPATA","1","1");
INSERT INTO tinstitucion VALUES("5"," UEN VEINTICUATRO DE JULIO","URB. 24 DE JULIO","MARIAN TAMAYO","1","2");
INSERT INTO tinstitucion VALUES("6","ESCUELA BASICA PAYARA","PAYARA","FULANO","1","3");
INSERT INTO tinstitucion VALUES("7","CAIDV","CALLE LUIS BRAILLE SECTOR LOS CORTIJOS DETRAS DE BELLAS ARTE","LIC IRMA SANCHEZ","1","1");
INSERT INTO tinstitucion VALUES("8","E B MANUELITA SAENS","ARAURE","LIC ","1","2");
INSERT INTO tinstitucion VALUES("9","COLEGIO FE Y ALEGRIA","SECTOR FE Y ALEGRIA","LIC","1","1");
INSERT INTO tinstitucion VALUES("10","E P JESUS HORIZONTE Y CAMINO","ACARIGUA","LIC","1","1");
INSERT INTO tinstitucion VALUES("11","U E E ALBERTO LEVYS MORA","BARRIO ANDRES ELOY BLANCO","LIC ","1","1");
INSERT INTO tinstitucion VALUES("12","U E N SABANETICA","SABANETICA","LIC","1","1");
INSERT INTO tinstitucion VALUES("13","U E N B YOLANDA DE PERUZZINE","URB BARAURE CENTRO ","LIC","1","2");
INSERT INTO tinstitucion VALUES("14","C E I ARAURE","ARAURE","LIC","1","2");
INSERT INTO tinstitucion VALUES("15","C E I LISANDRO AVARADO","ACARIGUA","LIC","1","1");
INSERT INTO tinstitucion VALUES("16","C E I SAMUEL ROBINSON","ACARIGUA","LIC","1","1");



DROP TABLE tinstrumento;

CREATE TABLE `tinstrumento` (
  `idinstrumento` int(11) NOT NULL AUTO_INCREMENT,
  `nombreins` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `tasignatura_idasignatura` int(11) NOT NULL,
  `estatusins` char(1) COLLATE utf8_spanish2_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`idinstrumento`),
  KEY `fk_tinstrumento_tasignatura_1` (`tasignatura_idasignatura`),
  CONSTRAINT `fk_tinstrumento_tasignatura_1` FOREIGN KEY (`tasignatura_idasignatura`) REFERENCES `tasignatura` (`idasignatura`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO tinstrumento VALUES("1","EVALUACIÓN DE LOS APRENDIZAJES","1","1");
INSERT INTO tinstrumento VALUES("2","EVALUACIÓN DE LOS APRENDIZAJES","2","1");
INSERT INTO tinstrumento VALUES("3","EVALUACIÓN DE LOS APRENDIZAJES","3","1");
INSERT INTO tinstrumento VALUES("4","ASPECTO FISIOLÓGICO","2","1");
INSERT INTO tinstrumento VALUES("5","ASPECTO COGNITIVO","2","1");



DROP TABLE tinstrumento_item;

CREATE TABLE `tinstrumento_item` (
  `tinstrumento_idinstrumento` int(11) NOT NULL,
  `titem_iditem` int(11) NOT NULL,
  `espacio` varchar(10) COLLATE utf8_spanish2_ci DEFAULT NULL,
  KEY `fk_tinstrumento_item_titem_1` (`titem_iditem`),
  KEY `fk_tinstrumento_item_tinstrumento_1` (`tinstrumento_idinstrumento`),
  CONSTRAINT `fk_tinstrumento_item_titem_1` FOREIGN KEY (`titem_iditem`) REFERENCES `titem` (`iditem`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tinstrumento_item_ibfk_1` FOREIGN KEY (`tinstrumento_idinstrumento`) REFERENCES `tinstrumento` (`idinstrumento`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO tinstrumento_item VALUES("1","1","completo");
INSERT INTO tinstrumento_item VALUES("1","2","completo");
INSERT INTO tinstrumento_item VALUES("2","1","completo");
INSERT INTO tinstrumento_item VALUES("2","2","completo");
INSERT INTO tinstrumento_item VALUES("3","1","completo");
INSERT INTO tinstrumento_item VALUES("3","2","completo");
INSERT INTO tinstrumento_item VALUES("4","3","mitad");
INSERT INTO tinstrumento_item VALUES("4","4","mitad");
INSERT INTO tinstrumento_item VALUES("4","5","mitad");
INSERT INTO tinstrumento_item VALUES("4","6","mitad");
INSERT INTO tinstrumento_item VALUES("4","9","mitad");
INSERT INTO tinstrumento_item VALUES("4","10","mitad");
INSERT INTO tinstrumento_item VALUES("4","11","mitad");
INSERT INTO tinstrumento_item VALUES("4","12","mitad");
INSERT INTO tinstrumento_item VALUES("5","13","mitad");
INSERT INTO tinstrumento_item VALUES("5","14","mitad");
INSERT INTO tinstrumento_item VALUES("5","29","mitad");
INSERT INTO tinstrumento_item VALUES("5","15","mitad");
INSERT INTO tinstrumento_item VALUES("5","16","mitad");
INSERT INTO tinstrumento_item VALUES("5","17","mitad");
INSERT INTO tinstrumento_item VALUES("5","18","mitad");
INSERT INTO tinstrumento_item VALUES("5","19","mitad");
INSERT INTO tinstrumento_item VALUES("5","20","mitad");
INSERT INTO tinstrumento_item VALUES("5","21","mitad");
INSERT INTO tinstrumento_item VALUES("5","22","mitad");
INSERT INTO tinstrumento_item VALUES("5","23","mitad");
INSERT INTO tinstrumento_item VALUES("5","24","mitad");
INSERT INTO tinstrumento_item VALUES("5","25","mitad");
INSERT INTO tinstrumento_item VALUES("5","26","mitad");
INSERT INTO tinstrumento_item VALUES("5","27","mitad");
INSERT INTO tinstrumento_item VALUES("5","28","mitad");



DROP TABLE titem;

CREATE TABLE `titem` (
  `iditem` int(11) NOT NULL AUTO_INCREMENT,
  `nombreite` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcionite` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `tipoite` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `estatusite` char(1) COLLATE utf8_spanish2_ci DEFAULT '1',
  PRIMARY KEY (`iditem`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO titem VALUES("1","DESCRIPCION DE LOGROS","DESCRIPCION DEL APRENDIZAJE","textarea","1");
INSERT INTO titem VALUES("2","OBSERVACIONES","OBSERVACIONES DEL DOCENTE","textarea","1");
INSERT INTO titem VALUES("3","SEXO","SEXO DEL PARTICIPANTE","select","1");
INSERT INTO titem VALUES("4","EDAD","EDAD DEL PARTICIPANTE","text","1");
INSERT INTO titem VALUES("5","PESO","PESO DEL PARTICIPANTE","text","1");
INSERT INTO titem VALUES("6","TALLA CAMISA","TALLAS DEL PARTICIPANTE ","text","1");
INSERT INTO titem VALUES("7","TALLA PANTALON","TALLA DEL PANTEALON","text","1");
INSERT INTO titem VALUES("8","TALLA ZAPATOS","TALLA DEL CALZADO","text","1");
INSERT INTO titem VALUES("9","ESTATURA","ESTATURA DEL PARTICIPANTE","text","1");
INSERT INTO titem VALUES("10","DESCAPACIDAD","TIPO DE DISCAPACIDADES DEL PARTICIPANTE","checkbox","1");
INSERT INTO titem VALUES("11","VACUNAS ","VACUNAS APLICADAS AL PARTICIPANTE","textarea","1");
INSERT INTO titem VALUES("12","CONTROLA ESFíNTERES","SI EL PARTICIPANTE CONTROLA ESFíNTERES\n","select","1");
INSERT INTO titem VALUES("13","ESTILO DE APRENDIZAJE VISUAL","ESTILO DE APRENDIZAJE DEL PARTICIPANTE","select","1");
INSERT INTO titem VALUES("14","ESTILO DE APRENDIZAJE AUDITIVO","ESTILO DE APRENDIZAJE DEL PARTICIPANTE","select","1");
INSERT INTO titem VALUES("15","PRONUNCIA CORRECTAMENTE","DESARROLLO DEL LENGUAJE DEL PARETICIPANTE","select","1");
INSERT INTO titem VALUES("16","CONVERSA CON COHERENCIA","DESARROLLO DEL LENGUAJE DEL PARTICIPANTE","select","1");
INSERT INTO titem VALUES("17","ATIENDE A LAS ACTIVIDADES","ATENCIóN Y CONCENTRACIóN","select","1");
INSERT INTO titem VALUES("18","SE CONCENTRA POR 15 MINUTOS","ATENCIóN Y CONCENTRACIóN","select","1");
INSERT INTO titem VALUES("19","SU ATENCIóN ES DISPERSA","ATENCIóN Y CONCENTRACIóN","select","1");
INSERT INTO titem VALUES("20","COMPRENDE Y RAZONA","ATENCIóN Y CONCENTRACIóN","select","1");
INSERT INTO titem VALUES("21","REPITE SECUENCIA DE PALABRAS","ATENCION Y CONCENTRACION","select","1");
INSERT INTO titem VALUES("22","RESPONDE A PREGUNTAS SIMPLES","ATENCION Y CONCENTRACION","select","1");
INSERT INTO titem VALUES("23","REACCIONA ANTE SABORES","SENSOPERCEPCION","select","1");
INSERT INTO titem VALUES("24","REACCIONA ANTE OLORES","SENSOPERCEPCION","select","1");
INSERT INTO titem VALUES("25","REACCIONA AL LLAMADO DE SU NOMBRE","SENSOPERCEPCION","select","1");
INSERT INTO titem VALUES("26","REACCIóN ANTE ESTíMULOS SONOROS","SENSOPERCEPCION","select","1");
INSERT INTO titem VALUES("27","SU RITMO AL HABLAR ES LENTO","OTROS","select","1");
INSERT INTO titem VALUES("28","SU VOCABULARIO ESTá RELACIONADO CON SU AMBIENTE","OTROS","select","1");
INSERT INTO titem VALUES("29","ESTILO DE APRENDIZAJE TACTIL","ESTILO DEL APRENDIZAJE","select","1");
INSERT INTO titem VALUES("30","ES EXPRESIVO (A)","DESARROLLO DEL LENGUAJE","select","1");



DROP TABLE tlapso;

CREATE TABLE `tlapso` (
  `idlapso` int(11) NOT NULL AUTO_INCREMENT,
  `nombrelap` varchar(45) NOT NULL,
  `fechainilap` date DEFAULT NULL,
  `fechafinlap` date DEFAULT NULL,
  `estadolap` varchar(45) NOT NULL,
  `estatuslap` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idlapso`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO tlapso VALUES("2","LAPSO 2014-2015","2014-09-15","2015-06-11","APERTURADO","1");
INSERT INTO tlapso VALUES("3","LAPSO 2015-2016","2015-09-14","2016-06-09","PROGRAMADO","1");



DROP TABLE tlocalidad;

CREATE TABLE `tlocalidad` (
  `idlocalidad` int(11) NOT NULL AUTO_INCREMENT,
  `descripcionloc` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estatusloc` tinyint(1) NOT NULL DEFAULT '1',
  `tmunicipio_municipio` int(11) NOT NULL,
  PRIMARY KEY (`idlocalidad`),
  KEY `fk_tlocalidad_tmunicipio1_idx` (`tmunicipio_municipio`),
  CONSTRAINT `fk_tlocalidad_tmunicipio1` FOREIGN KEY (`tmunicipio_municipio`) REFERENCES `tmunicipio` (`idmunicipio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

INSERT INTO tlocalidad VALUES("1","ACARIGUA","1","1");
INSERT INTO tlocalidad VALUES("2","ARAURE","1","2");
INSERT INTO tlocalidad VALUES("3","PAYARA","1","1");
INSERT INTO tlocalidad VALUES("4","PINPINELA","1","1");
INSERT INTO tlocalidad VALUES("5","RAMON PERAZA","1","1");
INSERT INTO tlocalidad VALUES("6","AGUA BLANCA","1","3");
INSERT INTO tlocalidad VALUES("7","RIO ACARIGUA","1","2");
INSERT INTO tlocalidad VALUES("8","PIRITU","1","4");
INSERT INTO tlocalidad VALUES("9","UVERAL","1","4");
INSERT INTO tlocalidad VALUES("10","GUANARE","1","5");
INSERT INTO tlocalidad VALUES("11","CORDOBA","1","5");
INSERT INTO tlocalidad VALUES("12","GUANARITO","1","6");
INSERT INTO tlocalidad VALUES("13","TRINIDAD DE LA CAPILLA","1","6");
INSERT INTO tlocalidad VALUES("14","DIVINA PASTORA","1","6");
INSERT INTO tlocalidad VALUES("15","PENA BLANCA","1","14");
INSERT INTO tlocalidad VALUES("16","APARICION","1","7");
INSERT INTO tlocalidad VALUES("17","LA ESTACION","1","7");
INSERT INTO tlocalidad VALUES("18","OSPINO","1","7");
INSERT INTO tlocalidad VALUES("19","CANO DELGADITO","1","8");
INSERT INTO tlocalidad VALUES("20","PAPELON","1","8");
INSERT INTO tlocalidad VALUES("21","ANTOLíN TOVAR ANQUINO","1","9");
INSERT INTO tlocalidad VALUES("22","BOCONOITO","1","9");
INSERT INTO tlocalidad VALUES("23","SANTA FE","1","10");
INSERT INTO tlocalidad VALUES("24","SAN RAFAEL DE ONOTO","1","10");
INSERT INTO tlocalidad VALUES("25","THERMO MORALES","1","10");
INSERT INTO tlocalidad VALUES("26","FLORIDA","1","11");
INSERT INTO tlocalidad VALUES("27"," EL PLAYON","1","11");
INSERT INTO tlocalidad VALUES("28","BISCUCUY","1","12");
INSERT INTO tlocalidad VALUES("29","CONCEPCIóN","1","12");
INSERT INTO tlocalidad VALUES("30","SAN JOSE DE SAGUAZ","1","12");
INSERT INTO tlocalidad VALUES("31","SAN RAFAEL DE PALO ALZADO","1","12");
INSERT INTO tlocalidad VALUES("32","UVENCIO ANTONIO VELáSQUEZ","1","12");
INSERT INTO tlocalidad VALUES("33","VILLA ROSA","1","12");
INSERT INTO tlocalidad VALUES("34","VILLA BRUZUAL","1","13");
INSERT INTO tlocalidad VALUES("35","CANELONES","1","13");
INSERT INTO tlocalidad VALUES("36","SANTA CRUZ","1","13");
INSERT INTO tlocalidad VALUES("37","SAN ISIDRO LABRADOR","1","13");



DROP TABLE tmodulo;

CREATE TABLE `tmodulo` (
  `idmodulo` int(11) NOT NULL AUTO_INCREMENT,
  `nombremod` varchar(30) NOT NULL,
  `estatusmod` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idmodulo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO tmodulo VALUES("1","Administración","1");
INSERT INTO tmodulo VALUES("2","Configuración","1");
INSERT INTO tmodulo VALUES("3","Curso","1");
INSERT INTO tmodulo VALUES("4","Persona","1");
INSERT INTO tmodulo VALUES("5","Seguridad","1");
INSERT INTO tmodulo VALUES("6","Reporte","1");
INSERT INTO tmodulo VALUES("7","Ayuda","1");
INSERT INTO tmodulo VALUES("8","Inscripción","1");



DROP TABLE tmodulo_trol;

CREATE TABLE `tmodulo_trol` (
  `idmodulo` int(11) NOT NULL,
  `idrol` int(11) NOT NULL,
  `orden` int(11) NOT NULL,
  PRIMARY KEY (`idmodulo`,`idrol`),
  KEY `fk_tmodulo_has_trol_trol1_idx` (`idrol`),
  KEY `fk_tmodulo_has_trol_tmodulo1_idx` (`idmodulo`),
  CONSTRAINT `fk_tmodulo_has_trol_tmodulo1` FOREIGN KEY (`idmodulo`) REFERENCES `tmodulo` (`idmodulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tmodulo_has_trol_trol1` FOREIGN KEY (`idrol`) REFERENCES `trol` (`idrol`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO tmodulo_trol VALUES("1","1","1");
INSERT INTO tmodulo_trol VALUES("1","2","1");
INSERT INTO tmodulo_trol VALUES("1","3","1");
INSERT INTO tmodulo_trol VALUES("1","4","1");
INSERT INTO tmodulo_trol VALUES("2","1","2");
INSERT INTO tmodulo_trol VALUES("2","2","2");
INSERT INTO tmodulo_trol VALUES("2","3","2");
INSERT INTO tmodulo_trol VALUES("2","4","2");
INSERT INTO tmodulo_trol VALUES("3","1","4");
INSERT INTO tmodulo_trol VALUES("3","2","3");
INSERT INTO tmodulo_trol VALUES("3","3","3");
INSERT INTO tmodulo_trol VALUES("3","4","3");
INSERT INTO tmodulo_trol VALUES("4","1","3");
INSERT INTO tmodulo_trol VALUES("4","2","5");
INSERT INTO tmodulo_trol VALUES("4","3","5");
INSERT INTO tmodulo_trol VALUES("4","4","5");
INSERT INTO tmodulo_trol VALUES("5","2","6");
INSERT INTO tmodulo_trol VALUES("5","3","6");
INSERT INTO tmodulo_trol VALUES("5","4","6");
INSERT INTO tmodulo_trol VALUES("6","1","6");
INSERT INTO tmodulo_trol VALUES("6","2","7");
INSERT INTO tmodulo_trol VALUES("6","3","7");
INSERT INTO tmodulo_trol VALUES("6","4","7");
INSERT INTO tmodulo_trol VALUES("7","1","7");
INSERT INTO tmodulo_trol VALUES("7","2","8");
INSERT INTO tmodulo_trol VALUES("7","3","8");
INSERT INTO tmodulo_trol VALUES("7","4","8");
INSERT INTO tmodulo_trol VALUES("8","1","5");
INSERT INTO tmodulo_trol VALUES("8","2","4");
INSERT INTO tmodulo_trol VALUES("8","3","4");
INSERT INTO tmodulo_trol VALUES("8","4","4");



DROP TABLE tmunicipio;

CREATE TABLE `tmunicipio` (
  `idmunicipio` int(11) NOT NULL AUTO_INCREMENT,
  `descripcionmun` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estatusmun` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idmunicipio`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

INSERT INTO tmunicipio VALUES("1","PAEZ","1");
INSERT INTO tmunicipio VALUES("2","ARAURE","1");
INSERT INTO tmunicipio VALUES("3","AGUA BLANCA","1");
INSERT INTO tmunicipio VALUES("4","ESTELLER","1");
INSERT INTO tmunicipio VALUES("5","GUANARE","1");
INSERT INTO tmunicipio VALUES("6","GUANARITO","1");
INSERT INTO tmunicipio VALUES("7","OSPINO","1");
INSERT INTO tmunicipio VALUES("8","PAPELON","1");
INSERT INTO tmunicipio VALUES("9","SAN GENARO DE BOCONOITO","1");
INSERT INTO tmunicipio VALUES("10","SAN RAFAEL DE ONOTO","1");
INSERT INTO tmunicipio VALUES("11","SANTA ROSALIA","1");
INSERT INTO tmunicipio VALUES("12","SUCRE","1");
INSERT INTO tmunicipio VALUES("13","TUREN","1");
INSERT INTO tmunicipio VALUES("14","MONSEÑOR JOSE VICENTE DE UNDA","1");



DROP TABLE tnoticia;

CREATE TABLE `tnoticia` (
  `idnoticia` int(11) NOT NULL AUTO_INCREMENT,
  `titulonot` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `textonot` text CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `imagennot` varchar(45) NOT NULL,
  `fechanot` date NOT NULL,
  `estatusnot` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idnoticia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE tobjetivo;

CREATE TABLE `tobjetivo` (
  `idobjetivo` int(11) NOT NULL AUTO_INCREMENT,
  `nombreobj` varchar(500) COLLATE utf8_spanish2_ci NOT NULL,
  `contenidoobj` text COLLATE utf8_spanish2_ci NOT NULL,
  `estatusobj` char(1) COLLATE utf8_spanish2_ci NOT NULL DEFAULT '1',
  `tunidad_idunidad` int(11) NOT NULL,
  PRIMARY KEY (`idobjetivo`),
  KEY `fk_tobjetivo_tunidad_1` (`tunidad_idunidad`),
  CONSTRAINT `fk_tobjetivo_tunidad_1` FOREIGN KEY (`tunidad_idunidad`) REFERENCES `tunidad` (`idunidad`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO tobjetivo VALUES("1","Conceptos básicos","Conceptos básicos","1","1");
INSERT INTO tobjetivo VALUES("9","FUNDAMENTOS Y ANTECEDENTES","DEFINICION, EVOLUCION, CLASIFICACION USO, IMPORTANCIA Y FUNCIONAMIENTO BASICO.\n                                                                    \n                                                                    ","1","5");
INSERT INTO tobjetivo VALUES("10","PERIFERICOS DEENTRADA,SALIDA Y MIXTOS","CONCEPTOS, UTILIDAD, TIPOS Y CLASIFICACION. \n                                                                    \n                                                                    ","1","5");
INSERT INTO tobjetivo VALUES("11","INTRODUCCION A LA  REDES","DEFINICION, FUNCIONAIENTO, COMPONENTE BASICOS, ASPECTOS GENERALES Y ANTECENDENTE DE INTERNET.\n                                                                    \n                                                                    ","1","5");



DROP TABLE tparentesco;

CREATE TABLE `tparentesco` (
  `idparentesco` int(11) NOT NULL AUTO_INCREMENT,
  `descripcionpar` varchar(45) NOT NULL,
  `estatuspar` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idparentesco`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

INSERT INTO tparentesco VALUES("1","PADRE","1");
INSERT INTO tparentesco VALUES("2","MADRE","1");
INSERT INTO tparentesco VALUES("3","TIO","1");
INSERT INTO tparentesco VALUES("4","HERMANO","1");
INSERT INTO tparentesco VALUES("5","PRIMO","1");
INSERT INTO tparentesco VALUES("6","SOBRINO","1");
INSERT INTO tparentesco VALUES("7","ABUELO","1");
INSERT INTO tparentesco VALUES("8","ABUELA","1");
INSERT INTO tparentesco VALUES("9","TIA","1");
INSERT INTO tparentesco VALUES("10","NO APLICA","1");
INSERT INTO tparentesco VALUES("11","PRIMA","1");



DROP TABLE tparticipante;

CREATE TABLE `tparticipante` (
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
  KEY `tlocalidad_idlocalidad` (`tlocalidad_idlocalidad`),
  CONSTRAINT `fk_tparticipante_tdiagnostico1` FOREIGN KEY (`tdiagnostico_iddiagnostico`) REFERENCES `tdiagnostico` (`iddiagnostico`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

INSERT INTO tparticipante VALUES("1","V","09837744","LEONEL","ANDRES","GONZALEZ","","M","04266526658","leonel@gmail.com","URB. TRICENTENARIA F-8 CASA # 08","2006-11-02","2","RURAL","PROPIA","BLOQUES Y ZINC","0","0","2","2","10","1","2","2");
INSERT INTO tparticipante VALUES("2","V","11078708","JAIMAR","JOSE","CASTILLO","SANCHEZ","F","04245469080","janmar@gmail.com","URB. PRADOS DEL SOL SECTOR VENEZUELA E/T 2 Y 3 CALLE 8 CASA # 23","2008-10-01","1","URBANO","PROPIA","INAVI","0","0","3","1","5","1","1","1");
INSERT INTO tparticipante VALUES("3","V","15493031","OSMAR ","","HERNANDEZ","","M","04145568346","coreo@dfr.com","PAYARA CENTRO CALLE 11 C/AV 2 # 11","2008-05-29","3","URBANO","PROPIA","INAVI","0","0","3","1","6","1","2","1");
INSERT INTO tparticipante VALUES("4","V","16964940","JESUS","DANIEL","NIEVES","Q","M","04262405761","jesusdnieves@hotmail.com","BARRIO LA DEMOCRACIA AV. 1 CALLEJóN 1 CASA #32","2004-05-12","2","URBANO","PROPIA","BLOQUES Y ZINC","1","0","3","1","4","1","3","1");
INSERT INTO tparticipante VALUES("5","V","19170250","RONNY","","RODRIGUEZ","","M","04167528081","ronny@hotmail.com","BARRIO LA PAZ ","2006-12-09","1","RURAL","INVADIDA","BLOQUES Y ZINC","0","0","2","1","1","1","1","1");
INSERT INTO tparticipante VALUES("6","V","11847486","NAYILETH","MARIANELA","ADJUNTA","ORTIZ","F","04165368716","","BARRIO \"SANTA ELENA\", AV. 5 ENTRE CALLES 1 Y 2 CASA NRO. 15 ","2002-12-01","4","URBANO","PROPIA","BLOQUES Y ZINC","0","0","3","1","9","1","1","1");
INSERT INTO tparticipante VALUES("7","V","11542861","HEIBER","","PARADA","","M","04164514140","heiber@hotmail.com","CASERíO MIJAGUITO CALLE PRINCIPAL CASA # 55","1999-11-11","1","RURAL","PROPIA","BLOQUES Y ZINC","0","0","2","1","0","1","1","1");
INSERT INTO tparticipante VALUES("8","V","20157379","FRANCISBETH","","COLMENAREZ","","F","04160389433","","URB. SAN JOSE 2 LOTE A CASA 39","2010-12-13","1","URBANO","PROPIA","INAVI","0","0","2","2","0","1","1","2");
INSERT INTO tparticipante VALUES("9","V","18732314","FEDERICA","","QUEVEDO","","F","04268492413","","RIO ACARIGUA CALLE 1 SECTOR EL SAMAN","2010-06-01","1","RURAL","PROPIA","BLOQUES Y ZINC","0","0","3","7","0","1","1","2");
INSERT INTO tparticipante VALUES("10","V","24587474","JEAN","CARLOS","QUIROZ","","M","00000000000","","BARRIO BOLíVAR SECTOR LA LAGUNITA CALLE 5 C/A 8\n","1994-02-01","2","URBANO","PROPIA","INAVI","0","0","2","1","0","1","1","1");
INSERT INTO tparticipante VALUES("11","V","17364390","MICHELLY","","DURAN","","F","00000000000","","URB DURIGUA 2 CALLE 4 CASA 1","2009-07-28","2","URBANO","PROPIA","INAVI","0","0","2","1","0","1","2","2");
INSERT INTO tparticipante VALUES("12","V","24567206","ERIKA","","MARTINEZ","","F","05226224844","","C.H. SIMóN BOLíVAR TORRE 11-B APART. # \n","1989-08-27","1","URBANO","PROPIA","INAVI","0","0","2","1","0","1","1","1");
INSERT INTO tparticipante VALUES("13","V","18691718","YEARLESKY","","GUERRERO","","F","02556155551","","C.H. SIMóN BOLíVAR\n","1989-09-27","1","URBANO","PROPIA","INAVI","0","0","2","1","0","1","1","1");
INSERT INTO tparticipante VALUES("14","V","11079158","GRECIA","","PEROZA","","F","00000000000","","CASERíO SABANETICA CALLE PRINCIPAL CASA S/N","2006-07-15","1","RURAL","PROPIA","BLOQUES Y ZINC","1","0","2","1","0","1","1","2");
INSERT INTO tparticipante VALUES("15","V","19377573","MARIA","DE LOS ANGELES","BASTIDAS","","F","04267407396","","LOS MALABARES CALLE PRINCIPAL SECTOR LA CAñADA S/N \n","1986-11-19","1","RURAL","PROPIA","BLOQUES Y ZINC","0","0","2","2","0","1","1","2");
INSERT INTO tparticipante VALUES("16","V","21563851","KEVIN","","MARQUEZ","","M","00000000000","","URB. SAN JOSé II CALLE 15 TERRAZA # 05","2004-05-25","1","URBANO","PROPIA","INAVI","1","0","2","2","0","1","1","2");
INSERT INTO tparticipante VALUES("17","V","15070543","ROMMY","","CASTAñEDA","","M","04145593057","","URB. EL BOSQUE AV. PRINCIPAL #51 SECTOR VILLA ARAURE I\n","1981-02-16","1","URBANO","PROPIA","INAVI","0","0","3","2","0","1","1","2");
INSERT INTO tparticipante VALUES("18","V","16041804","YUSLEIDDY","","MáRQUEZ","","F","02556156996","","AV. 5 DE DICIEMBRE C/A 29 C/C 23 EDIF. VERCHONI # 08 \n","1979-06-16","1","URBANO","PROPIA","INAVI","0","0","4","2","0","1","1","2");
INSERT INTO tparticipante VALUES("19","V","12446689","MARIáNGEL","","SáNCHEZ","","F","04167547627","","URB. LA GOAJIRA CALLE F VDA 10  CASA # 01\n","1971-12-15","1","URBANO","PROPIA","INAVI","0","0","4","2","0","1","1","2");
INSERT INTO tparticipante VALUES("20","V","11847413","MINERVA","","GALLARDO","","F","04167547627","","URB. TRICENTENARIA MANZANA L-2 CASA #12\n","1971-09-25","1","URBANO","PROPIA","INAVI","0","0","2","2","0","1","1","2");



DROP TABLE tpersonal;

CREATE TABLE `tpersonal` (
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

INSERT INTO tpersonal VALUES("V","0","Administrador","Administrador","Administrador","Administrador","M","2012-02-01","","CAIDV 2014","02556616161","WebMaster","1","1","0");
INSERT INTO tpersonal VALUES("","12526145","LEIBI","","GONZALEZ","","M","1975-08-12","leibigon@gmail.com","VILLAS DEL PILAR","04125278606","WEB MASTER","1","1","2");
INSERT INTO tpersonal VALUES("V","15491963","ANTONIO","ALBERTO","SPADARO","BONIFACIO","M","1981-07-30","SPADARO.ANTO@GMAIL.COM","LLANO ALTO","04145591333","WEB MASTER","1","1","2");
INSERT INTO tpersonal VALUES("V","17960877","EFREN ","","DIAZ","MARTINEZ","M","1988-05-05","EDM_126@HOTMAIL.COM","VILLA ARAURE 2","04121516744","WEB MASTER","1","1","2");
INSERT INTO tpersonal VALUES("V","18672728","JORGE","","APONTE","","M","1987-12-17","coreo@sdd.com","ARAURE","04125351857","ASISTENTE","1","1","2");



DROP TABLE tpregunta;

CREATE TABLE `tpregunta` (
  `idpregunta` int(11) NOT NULL AUTO_INCREMENT,
  `pregunta` varchar(30) NOT NULL,
  `respuesta` varchar(30) NOT NULL,
  `tusuario_idusuario` varchar(20) NOT NULL,
  PRIMARY KEY (`idpregunta`),
  KEY `fk_tpregunta_tusuario1_idx` (`tusuario_idusuario`),
  CONSTRAINT `fk_tpregunta_tusuario1` FOREIGN KEY (`tusuario_idusuario`) REFERENCES `tusuario` (`idusuario`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO tpregunta VALUES("1","QUIEN ERES?","ANTONIOSPADARO","15491963");
INSERT INTO tpregunta VALUES("2","MASCOTA","PEPITO","15491963");
INSERT INTO tpregunta VALUES("3","PERRO?","TOBI","12526145");
INSERT INTO tpregunta VALUES("4","APELLIDO","TOVAR","12526145");
INSERT INTO tpregunta VALUES("5","LUGAR DE NACIMIENTO DE LA MADR","ACARIGUA","17960877");
INSERT INTO tpregunta VALUES("6","PROFESOR FAVORITO","AQUILES","17960877");



DROP TABLE trol;

CREATE TABLE `trol` (
  `idrol` int(11) NOT NULL AUTO_INCREMENT,
  `nombrerol` varchar(45) NOT NULL,
  `estatusrol` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO trol VALUES("1","ADMINISTRADOR","1");
INSERT INTO trol VALUES("2","DIRECTOR(A)","1");
INSERT INTO trol VALUES("3","DOCENTE","1");
INSERT INTO trol VALUES("4","SECRETARIA","1");
INSERT INTO trol VALUES("5","SUB-DIRECTORA","1");



DROP TABLE tservicio;

CREATE TABLE `tservicio` (
  `idservicio` int(11) NOT NULL AUTO_INCREMENT,
  `nombreser` varchar(50) NOT NULL,
  `enlaceser` varchar(50) NOT NULL,
  `visibleser` tinyint(4) NOT NULL DEFAULT '1',
  `estatusser` tinyint(4) NOT NULL DEFAULT '1',
  `idmodulo` int(11) NOT NULL,
  PRIMARY KEY (`idservicio`),
  KEY `fk_tservicio_tmodulo1_idx` (`idmodulo`),
  CONSTRAINT `fk_tservicio_tmodulo1` FOREIGN KEY (`idmodulo`) REFERENCES `tmodulo` (`idmodulo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;

INSERT INTO tservicio VALUES("1","Módulo","seguridad/modulo","1","1","1");
INSERT INTO tservicio VALUES("2","Registrar modulo","seguridad/registrar_modulo","0","1","1");
INSERT INTO tservicio VALUES("4","Servicio","seguridad/servicio","1","1","1");
INSERT INTO tservicio VALUES("5","Registrar servicio","seguridad/registrar_servicio","0","1","1");
INSERT INTO tservicio VALUES("7","Rol","seguridad/rol","1","1","1");
INSERT INTO tservicio VALUES("8","Registrar rol","seguridad/registrar_rol","0","1","1");
INSERT INTO tservicio VALUES("10","Asignacion de modulos/servicios","seguridad/asignacion","1","1","1");
INSERT INTO tservicio VALUES("11","Asignar módulo","seguridad/asignar_modulo","1","1","1");
INSERT INTO tservicio VALUES("12","Asignar servicio","seguridad/asignar_servicio","1","1","1");
INSERT INTO tservicio VALUES("13","Consultar módulo","seguridad/consultar_modulo","0","1","1");
INSERT INTO tservicio VALUES("14","Consultar servicio","seguridad/consultar_servicio","0","1","1");
INSERT INTO tservicio VALUES("15","Consultar rol","seguridad/consultar_rol","0","1","1");
INSERT INTO tservicio VALUES("17","Auditoria de sistema","seguridad/bitacora","1","1","1");
INSERT INTO tservicio VALUES("18","Consultar bitacora","seguridad/consultar_bitacora","0","1","1");
INSERT INTO tservicio VALUES("19","Configurar sistema ","sistema/configurar","1","1","1");
INSERT INTO tservicio VALUES("20","Municipio","archivo/municipio","1","1","2");
INSERT INTO tservicio VALUES("21","Registrar municipio","archivo/registrar_municipio","0","1","2");
INSERT INTO tservicio VALUES("22","Consultar municipio","archivo/consultar_municipio","0","1","2");
INSERT INTO tservicio VALUES("23","Parentesco","archivo/parentesco","1","1","2");
INSERT INTO tservicio VALUES("24","Registrar parentesco","archivo/registrar_parentesco","0","1","2");
INSERT INTO tservicio VALUES("25","Consultar parentesco","archivo/consultar_parentesco","0","1","2");
INSERT INTO tservicio VALUES("26","Condición visual","archivo/diagnostico","1","1","2");
INSERT INTO tservicio VALUES("27","Registrar diagnostico","archivo/registrar_diagnostico","0","1","2");
INSERT INTO tservicio VALUES("28","Consultar diagnostico","archivo/consultar_diagnostico","0","1","2");
INSERT INTO tservicio VALUES("29","Localidad","archivo/localidad","1","1","2");
INSERT INTO tservicio VALUES("30","Registrar localidad","archivo/registrar_localidad","0","1","2");
INSERT INTO tservicio VALUES("31","Consultar localidad","archivo/consultar_localidad","0","1","2");
INSERT INTO tservicio VALUES("32","Registrar Grupo","archivo/registrar_grupo","0","1","2");
INSERT INTO tservicio VALUES("33","Consultar Grupo","archivo/consultar_grupo","0","1","2");
INSERT INTO tservicio VALUES("34","Grupo","archivo/grupo","1","1","2");
INSERT INTO tservicio VALUES("35","Registrar participante","persona/registrar_participante","0","1","4");
INSERT INTO tservicio VALUES("36","Registrar Docente","persona/registrar_docente","0","1","4");
INSERT INTO tservicio VALUES("37","Consultar docente","persona/consultar_docente","0","1","4");
INSERT INTO tservicio VALUES("38","Docente","persona/docente","1","1","4");
INSERT INTO tservicio VALUES("39","Institución","archivo/institucion","1","1","2");
INSERT INTO tservicio VALUES("40","Registrar institución","archivo/registrar_institucion","0","1","2");
INSERT INTO tservicio VALUES("41","Consultar institución","archivo/consultar_institucion","0","1","2");
INSERT INTO tservicio VALUES("42","Hoja de vida del Participante","persona/participante","1","1","4");
INSERT INTO tservicio VALUES("43","Consultar Participante","persona/consultar_participante","0","1","4");
INSERT INTO tservicio VALUES("44","Lapso","curso/lapso","1","1","3");
INSERT INTO tservicio VALUES("45","Apertura lapso","curso/registrar_lapso","0","1","3");
INSERT INTO tservicio VALUES("46","Planificar curso","curso/registrar_curso","1","1","3");
INSERT INTO tservicio VALUES("47","Curso activo / trasladar ","curso/curso","1","1","3");
INSERT INTO tservicio VALUES("48","Personal","persona/personal","1","1","4");
INSERT INTO tservicio VALUES("49","Registrar personal","persona/registrar_personal","0","1","4");
INSERT INTO tservicio VALUES("50","Eliminar servicio","seguridad/eliminar_servicio","0","1","1");
INSERT INTO tservicio VALUES("51","Eliminar modulo","seguridad/eliminar_modulo","0","1","1");
INSERT INTO tservicio VALUES("52","Cambiar clave","seguridad/cambiar_clave","1","1","1");
INSERT INTO tservicio VALUES("53","Pregunta secreta","seguridad/registrar_pregunta","1","1","1");
INSERT INTO tservicio VALUES("54","Aula","archivo/aula","1","1","2");
INSERT INTO tservicio VALUES("55","Registrar aula","archivo/registrar_aula","0","1","2");
INSERT INTO tservicio VALUES("56","Consultar aula","archivo/consultar_aula","0","1","2");
INSERT INTO tservicio VALUES("57","Eliminar aula","archivo/eliminar_aula","0","1","2");
INSERT INTO tservicio VALUES("58","Area de Conocimiento","archivo/area_conocimiento","1","1","2");
INSERT INTO tservicio VALUES("59","Registrar Area de Conocimiento","archivo/registrar_area","0","1","2");
INSERT INTO tservicio VALUES("60","Consultar Area de Conocimiento","archivo/consultar_area","0","1","2");
INSERT INTO tservicio VALUES("61","Eliminar Area de Conocimiento","archivo/eliminar_area","0","1","2");
INSERT INTO tservicio VALUES("62","Asignatura","archivo/asignatura","1","1","2");
INSERT INTO tservicio VALUES("63","Registrar Asignatura","archivo/registrar_asignatura","0","1","2");
INSERT INTO tservicio VALUES("64","Consultar Asignatura","archivo/consultar_asignatura","0","1","2");
INSERT INTO tservicio VALUES("65","Eliminar Asignatura","archivo/eliminar_asignatura","0","1","2");
INSERT INTO tservicio VALUES("66","Eliminar rol","seguridad/eliminar_rol","0","1","1");
INSERT INTO tservicio VALUES("67","Eliminar localidad","archivo/eliminar_localidad","0","1","2");
INSERT INTO tservicio VALUES("68","Eliminar municipio","archivo/eliminar_municipio","0","1","2");
INSERT INTO tservicio VALUES("69","Eliminar institución","archivo/eliminar_institucion","0","1","2");
INSERT INTO tservicio VALUES("70","Eliminar diagnostico","archivo/eliminar_diagnostico","0","1","2");
INSERT INTO tservicio VALUES("71","Consultar personal","persona/consultar_personal","0","1","4");
INSERT INTO tservicio VALUES("72","Eliminar Personal","persona/eliminar_personal","0","1","4");
INSERT INTO tservicio VALUES("73","Eliminar parentesco","archivo/eliminar_parentesco","0","1","2");
INSERT INTO tservicio VALUES("74","Eliminar Grupo","archivo/eliminar_grupo","0","1","2");
INSERT INTO tservicio VALUES("75","Eliminar aula","archivo/eliminar_aula","0","1","2");
INSERT INTO tservicio VALUES("76","Registrar Noticia","sistema/registrar_noticia","0","1","1");
INSERT INTO tservicio VALUES("77","Noticia","sistema/noticia","1","1","1");
INSERT INTO tservicio VALUES("78","Consultar Noticia","sistema/consultar_noticia","0","1","1");
INSERT INTO tservicio VALUES("79","Eliminar Noticia","sistema/eliminar_noticia","0","1","1");
INSERT INTO tservicio VALUES("80","Registrar Slider","sistema/registrar_slider","0","1","1");
INSERT INTO tservicio VALUES("81","Slider","sistema/slider","1","1","1");
INSERT INTO tservicio VALUES("82","Consultar Slider","sistema/consultar_slider","0","1","1");
INSERT INTO tservicio VALUES("83","Eliminar Slider","sistema/eliminar_slider","0","1","1");
INSERT INTO tservicio VALUES("84","Inscripción masiva por curso","inscripcion/listado_cursos_inscribir","1","1","8");
INSERT INTO tservicio VALUES("85","Inscripción por participante","inscripcion/listado_participantes_inscribir","1","1","8");
INSERT INTO tservicio VALUES("86","Inscripción masiva","inscripcion/inscripcion_masiva","0","1","8");
INSERT INTO tservicio VALUES("87","Inscripción individual","inscripcion/inscripcion_individual","0","1","8");
INSERT INTO tservicio VALUES("88","Hoja de vida del Participante","reporte/planilla_inscripcion","1","1","6");
INSERT INTO tservicio VALUES("89","Familiares","reporte/familiar_participante ","1","0","6");
INSERT INTO tservicio VALUES("90","Eliminar participante","persona/eliminar_participante","0","1","4");
INSERT INTO tservicio VALUES("91","Eliminar Docente","persona/eliminar_docente","0","1","4");
INSERT INTO tservicio VALUES("92","Curso Inactivo","curso/cursos_inactivos","1","1","3");
INSERT INTO tservicio VALUES("93","Consultar historial curso","curso/detalle_curso_inactivo","0","1","3");
INSERT INTO tservicio VALUES("94","Primera vez","seguridad/primera_vez","0","1","5");
INSERT INTO tservicio VALUES("95","Desbloquear","seguridad/desbloquear","1","1","1");
INSERT INTO tservicio VALUES("99","Consultar Lapso","curso/consultar_lapso","0","1","3");
INSERT INTO tservicio VALUES("100","Eliminar lapso","curso/eliminar_lapso","0","1","3");
INSERT INTO tservicio VALUES("101","Consultar Curso","curso/detalle_curso_activo","0","1","3");
INSERT INTO tservicio VALUES("102","Desincorporar por participante ","inscripcion/listado_participantes_desincorporar","1","1","8");
INSERT INTO tservicio VALUES("103","Desincorporar masivamente por curso","inscripcion/listado_cursos_desincorporar","1","1","8");
INSERT INTO tservicio VALUES("104","Desincorporar participante","inscripcion/desincorporar_participante","0","1","8");
INSERT INTO tservicio VALUES("105","Desincorporar participantes","inscripcion/desincorporar_participantes","0","1","8");
INSERT INTO tservicio VALUES("107","historial de cursos por participante","persona/historial_participante_detalle","0","1","3");
INSERT INTO tservicio VALUES("108","Historial de lapso","reporte/historial_lapso","1","1","6");
INSERT INTO tservicio VALUES("109","Historial Lapso","historial_lapso","0","1","6");
INSERT INTO tservicio VALUES("110","Historial participante inscrito por curso","reporte/historial_participante","1","1","6");
INSERT INTO tservicio VALUES("111","Familiar por participante","reporte/participante_familiar","1","1","6");
INSERT INTO tservicio VALUES("112","Historial de curso","reporte/historial_curso","1","1","6");
INSERT INTO tservicio VALUES("113","Listado Participante - Etnia","reporte/listado_participantes_etnia","1","1","6");
INSERT INTO tservicio VALUES("114","Listado Participante - Huerfano","reporte/listado_participantes_huerfanos","1","1","6");
INSERT INTO tservicio VALUES("115","Listado de docente por condición visual","reporte/listado_docente_diagnostico","1","1","6");
INSERT INTO tservicio VALUES("116","Acerca de...","ayuda/acerca","1","1","7");
INSERT INTO tservicio VALUES("117","Manual de Usuario","ayuda/manual_usuario","1","1","7");
INSERT INTO tservicio VALUES("118","Auditoria de Usuario","seguridad/auditoria_usuarios","1","1","1");
INSERT INTO tservicio VALUES("119","Consultar Usuario","seguridad/consultar_usuario","0","1","1");
INSERT INTO tservicio VALUES("120","Criterio de evaluación","archivo/item","1","1","2");
INSERT INTO tservicio VALUES("121","Registrar Item","archivo/registrar_item","0","1","2");
INSERT INTO tservicio VALUES("122","Consultar item","archivo/consultar_item","0","1","2");
INSERT INTO tservicio VALUES("123","Eliminar item","archivo/eliminar_item","0","1","2");
INSERT INTO tservicio VALUES("124","Auditoria de Reporte","seguridad/bitacora_reporte","1","1","1");
INSERT INTO tservicio VALUES("125","Consultar bitacora reporte","seguridad/consultar_bitacora_reporte","0","1","1");
INSERT INTO tservicio VALUES("126","Bloquear/Desbloquear Usuario","seguridad/bloquear","1","1","1");
INSERT INTO tservicio VALUES("127","Historial de clave","seguridad/listado_cambio_clave","1","1","1");
INSERT INTO tservicio VALUES("128","Consultar claves","seguridad/consultar_claves","0","1","1");
INSERT INTO tservicio VALUES("130","Mantenimiento Base de datos","seguridad/mantenimiento_bd","1","1","1");
INSERT INTO tservicio VALUES("131","Asistencia","curso/asistencia","1","1","3");
INSERT INTO tservicio VALUES("132","Registrar Asistencia","curso/registrar_asistencia","0","1","3");
INSERT INTO tservicio VALUES("133","Instrumento","archivo/instrumento","1","1","2");
INSERT INTO tservicio VALUES("134","Registrar Instrumento","archivo/registrar_instrumento","0","1","2");
INSERT INTO tservicio VALUES("135","Consultar instrumento","archivo/consultar_instrumento","0","1","2");
INSERT INTO tservicio VALUES("136","Eliminar instrumento","archivo/eliminar_instrumento","0","1","2");
INSERT INTO tservicio VALUES("137","Evaluación","curso/evaluacion","1","1","3");
INSERT INTO tservicio VALUES("138","Familiar","persona/familiar","1","1","4");
INSERT INTO tservicio VALUES("139","Registrar Evaluacion","curso/registrar_evaluacion","0","1","3");
INSERT INTO tservicio VALUES("140","Consultar Evaluación","curso/consultar_evaluacion","0","1","3");
INSERT INTO tservicio VALUES("141","Eliminar Evaluación","curso/eliminar_evaluacion","0","1","3");
INSERT INTO tservicio VALUES("142","Registrar Familiar","persona/registrar_familiar","0","1","4");
INSERT INTO tservicio VALUES("143","Consultar Familiar","persona/consultar_familiar","0","1","4");
INSERT INTO tservicio VALUES("144","Eliminar Familiar","persona/eliminar_familiar","0","1","4");
INSERT INTO tservicio VALUES("145","Términos y condiciones ","ayuda/terminos_condiciones","1","1","7");
INSERT INTO tservicio VALUES("146","Normas y procedimientos","ayuda/normas_procedimientos","1","1","7");
INSERT INTO tservicio VALUES("147","Participante inscrito por cursos","persona/historial_participante","1","1","3");
INSERT INTO tservicio VALUES("148","Participante por evaluación","reporte/listado_participantes_evaluaciones","1","1","6");
INSERT INTO tservicio VALUES("149","Consultar Evaluación","reporte/consultar_evaluaciones","0","1","6");
INSERT INTO tservicio VALUES("150","Participante por asistencia","reporte/listado_participantes_asistencia","1","1","6");
INSERT INTO tservicio VALUES("151","Consultar Asistencias","reporte/consultar_asistencias","0","1","6");



DROP TABLE tservicio_trol;

CREATE TABLE `tservicio_trol` (
  `idservicio` int(11) NOT NULL,
  `idrol` int(11) NOT NULL,
  `orden` int(11) DEFAULT NULL,
  PRIMARY KEY (`idservicio`,`idrol`),
  KEY `fk_tservicio_has_trol_trol1_idx` (`idrol`),
  KEY `fk_tservicio_has_trol_tservicio1_idx` (`idservicio`),
  CONSTRAINT `fk_tservicio_has_trol_trol1` FOREIGN KEY (`idrol`) REFERENCES `trol` (`idrol`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_tservicio_has_trol_tservicio1` FOREIGN KEY (`idservicio`) REFERENCES `tservicio` (`idservicio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO tservicio_trol VALUES("1","1","2");
INSERT INTO tservicio_trol VALUES("2","1","0");
INSERT INTO tservicio_trol VALUES("4","1","3");
INSERT INTO tservicio_trol VALUES("5","1","0");
INSERT INTO tservicio_trol VALUES("7","1","1");
INSERT INTO tservicio_trol VALUES("8","1","0");
INSERT INTO tservicio_trol VALUES("11","1","4");
INSERT INTO tservicio_trol VALUES("12","1","5");
INSERT INTO tservicio_trol VALUES("13","1","0");
INSERT INTO tservicio_trol VALUES("14","1","0");
INSERT INTO tservicio_trol VALUES("15","1","0");
INSERT INTO tservicio_trol VALUES("17","1","6");
INSERT INTO tservicio_trol VALUES("17","2","1");
INSERT INTO tservicio_trol VALUES("18","1","0");
INSERT INTO tservicio_trol VALUES("18","2","0");
INSERT INTO tservicio_trol VALUES("19","1","0");
INSERT INTO tservicio_trol VALUES("19","2","7");
INSERT INTO tservicio_trol VALUES("20","1","1");
INSERT INTO tservicio_trol VALUES("20","2","1");
INSERT INTO tservicio_trol VALUES("20","4","1");
INSERT INTO tservicio_trol VALUES("21","1","0");
INSERT INTO tservicio_trol VALUES("21","2","0");
INSERT INTO tservicio_trol VALUES("21","4","0");
INSERT INTO tservicio_trol VALUES("22","1","0");
INSERT INTO tservicio_trol VALUES("22","2","0");
INSERT INTO tservicio_trol VALUES("22","4","0");
INSERT INTO tservicio_trol VALUES("23","1","5");
INSERT INTO tservicio_trol VALUES("23","2","5");
INSERT INTO tservicio_trol VALUES("23","4","4");
INSERT INTO tservicio_trol VALUES("24","1","0");
INSERT INTO tservicio_trol VALUES("24","2","0");
INSERT INTO tservicio_trol VALUES("24","4","0");
INSERT INTO tservicio_trol VALUES("25","1","0");
INSERT INTO tservicio_trol VALUES("25","2","0");
INSERT INTO tservicio_trol VALUES("25","4","0");
INSERT INTO tservicio_trol VALUES("26","1","4");
INSERT INTO tservicio_trol VALUES("26","2","4");
INSERT INTO tservicio_trol VALUES("26","4","3");
INSERT INTO tservicio_trol VALUES("27","1","0");
INSERT INTO tservicio_trol VALUES("27","2","0");
INSERT INTO tservicio_trol VALUES("27","4","0");
INSERT INTO tservicio_trol VALUES("28","1","0");
INSERT INTO tservicio_trol VALUES("28","2","0");
INSERT INTO tservicio_trol VALUES("28","4","0");
INSERT INTO tservicio_trol VALUES("29","1","2");
INSERT INTO tservicio_trol VALUES("29","2","2");
INSERT INTO tservicio_trol VALUES("29","4","2");
INSERT INTO tservicio_trol VALUES("30","1","0");
INSERT INTO tservicio_trol VALUES("30","2","0");
INSERT INTO tservicio_trol VALUES("30","4","0");
INSERT INTO tservicio_trol VALUES("31","1","0");
INSERT INTO tservicio_trol VALUES("31","2","0");
INSERT INTO tservicio_trol VALUES("31","4","0");
INSERT INTO tservicio_trol VALUES("32","1","0");
INSERT INTO tservicio_trol VALUES("32","2","0");
INSERT INTO tservicio_trol VALUES("32","4","0");
INSERT INTO tservicio_trol VALUES("33","1","0");
INSERT INTO tservicio_trol VALUES("33","2","0");
INSERT INTO tservicio_trol VALUES("33","4","0");
INSERT INTO tservicio_trol VALUES("34","1","6");
INSERT INTO tservicio_trol VALUES("34","2","6");
INSERT INTO tservicio_trol VALUES("34","4","5");
INSERT INTO tservicio_trol VALUES("35","1","0");
INSERT INTO tservicio_trol VALUES("35","2","0");
INSERT INTO tservicio_trol VALUES("35","3","0");
INSERT INTO tservicio_trol VALUES("35","4","0");
INSERT INTO tservicio_trol VALUES("36","1","0");
INSERT INTO tservicio_trol VALUES("36","2","0");
INSERT INTO tservicio_trol VALUES("36","4","0");
INSERT INTO tservicio_trol VALUES("37","1","0");
INSERT INTO tservicio_trol VALUES("37","2","0");
INSERT INTO tservicio_trol VALUES("37","4","0");
INSERT INTO tservicio_trol VALUES("38","1","1");
INSERT INTO tservicio_trol VALUES("38","2","1");
INSERT INTO tservicio_trol VALUES("38","4","1");
INSERT INTO tservicio_trol VALUES("39","1","3");
INSERT INTO tservicio_trol VALUES("39","2","3");
INSERT INTO tservicio_trol VALUES("39","3","1");
INSERT INTO tservicio_trol VALUES("39","4","0");
INSERT INTO tservicio_trol VALUES("40","1","0");
INSERT INTO tservicio_trol VALUES("40","2","0");
INSERT INTO tservicio_trol VALUES("40","4","0");
INSERT INTO tservicio_trol VALUES("41","1","0");
INSERT INTO tservicio_trol VALUES("41","2","0");
INSERT INTO tservicio_trol VALUES("41","4","0");
INSERT INTO tservicio_trol VALUES("42","1","3");
INSERT INTO tservicio_trol VALUES("42","2","2");
INSERT INTO tservicio_trol VALUES("42","3","0");
INSERT INTO tservicio_trol VALUES("42","4","2");
INSERT INTO tservicio_trol VALUES("43","1","0");
INSERT INTO tservicio_trol VALUES("43","2","0");
INSERT INTO tservicio_trol VALUES("43","3","0");
INSERT INTO tservicio_trol VALUES("43","4","0");
INSERT INTO tservicio_trol VALUES("44","1","1");
INSERT INTO tservicio_trol VALUES("44","2","1");
INSERT INTO tservicio_trol VALUES("44","4","1");
INSERT INTO tservicio_trol VALUES("45","1","0");
INSERT INTO tservicio_trol VALUES("45","2","0");
INSERT INTO tservicio_trol VALUES("45","4","0");
INSERT INTO tservicio_trol VALUES("46","1","2");
INSERT INTO tservicio_trol VALUES("46","2","2");
INSERT INTO tservicio_trol VALUES("46","4","2");
INSERT INTO tservicio_trol VALUES("47","1","3");
INSERT INTO tservicio_trol VALUES("47","2","3");
INSERT INTO tservicio_trol VALUES("47","3","1");
INSERT INTO tservicio_trol VALUES("47","4","3");
INSERT INTO tservicio_trol VALUES("48","1","4");
INSERT INTO tservicio_trol VALUES("48","2","3");
INSERT INTO tservicio_trol VALUES("48","4","3");
INSERT INTO tservicio_trol VALUES("49","1","0");
INSERT INTO tservicio_trol VALUES("49","2","0");
INSERT INTO tservicio_trol VALUES("49","4","0");
INSERT INTO tservicio_trol VALUES("50","1","0");
INSERT INTO tservicio_trol VALUES("51","1","0");
INSERT INTO tservicio_trol VALUES("52","1","13");
INSERT INTO tservicio_trol VALUES("52","2","1");
INSERT INTO tservicio_trol VALUES("52","3","1");
INSERT INTO tservicio_trol VALUES("52","4","1");
INSERT INTO tservicio_trol VALUES("53","1","14");
INSERT INTO tservicio_trol VALUES("53","2","2");
INSERT INTO tservicio_trol VALUES("53","3","2");
INSERT INTO tservicio_trol VALUES("53","4","2");
INSERT INTO tservicio_trol VALUES("54","1","7");
INSERT INTO tservicio_trol VALUES("54","2","7");
INSERT INTO tservicio_trol VALUES("54","4","6");
INSERT INTO tservicio_trol VALUES("55","1","0");
INSERT INTO tservicio_trol VALUES("55","2","0");
INSERT INTO tservicio_trol VALUES("55","4","0");
INSERT INTO tservicio_trol VALUES("56","1","0");
INSERT INTO tservicio_trol VALUES("56","2","0");
INSERT INTO tservicio_trol VALUES("56","4","0");
INSERT INTO tservicio_trol VALUES("57","1","0");
INSERT INTO tservicio_trol VALUES("57","2","0");
INSERT INTO tservicio_trol VALUES("57","4","0");
INSERT INTO tservicio_trol VALUES("58","1","8");
INSERT INTO tservicio_trol VALUES("58","2","8");
INSERT INTO tservicio_trol VALUES("58","4","7");
INSERT INTO tservicio_trol VALUES("59","1","0");
INSERT INTO tservicio_trol VALUES("59","2","0");
INSERT INTO tservicio_trol VALUES("59","4","0");
INSERT INTO tservicio_trol VALUES("60","1","0");
INSERT INTO tservicio_trol VALUES("60","2","0");
INSERT INTO tservicio_trol VALUES("60","4","0");
INSERT INTO tservicio_trol VALUES("61","1","0");
INSERT INTO tservicio_trol VALUES("61","2","0");
INSERT INTO tservicio_trol VALUES("61","4","0");
INSERT INTO tservicio_trol VALUES("62","1","9");
INSERT INTO tservicio_trol VALUES("62","2","9");
INSERT INTO tservicio_trol VALUES("62","4","8");
INSERT INTO tservicio_trol VALUES("63","1","0");
INSERT INTO tservicio_trol VALUES("63","2","0");
INSERT INTO tservicio_trol VALUES("63","4","0");
INSERT INTO tservicio_trol VALUES("64","1","0");
INSERT INTO tservicio_trol VALUES("64","2","0");
INSERT INTO tservicio_trol VALUES("64","4","0");
INSERT INTO tservicio_trol VALUES("65","1","0");
INSERT INTO tservicio_trol VALUES("65","2","0");
INSERT INTO tservicio_trol VALUES("65","4","0");
INSERT INTO tservicio_trol VALUES("66","1","0");
INSERT INTO tservicio_trol VALUES("67","1","0");
INSERT INTO tservicio_trol VALUES("67","2","0");
INSERT INTO tservicio_trol VALUES("67","4","0");
INSERT INTO tservicio_trol VALUES("68","1","0");
INSERT INTO tservicio_trol VALUES("68","2","0");
INSERT INTO tservicio_trol VALUES("68","4","0");
INSERT INTO tservicio_trol VALUES("69","1","0");
INSERT INTO tservicio_trol VALUES("69","2","0");
INSERT INTO tservicio_trol VALUES("69","3","0");
INSERT INTO tservicio_trol VALUES("69","4","0");
INSERT INTO tservicio_trol VALUES("70","1","0");
INSERT INTO tservicio_trol VALUES("70","2","0");
INSERT INTO tservicio_trol VALUES("70","4","0");
INSERT INTO tservicio_trol VALUES("71","1","0");
INSERT INTO tservicio_trol VALUES("71","2","0");
INSERT INTO tservicio_trol VALUES("71","4","0");
INSERT INTO tservicio_trol VALUES("72","1","0");
INSERT INTO tservicio_trol VALUES("72","2","0");
INSERT INTO tservicio_trol VALUES("72","4","0");
INSERT INTO tservicio_trol VALUES("73","1","0");
INSERT INTO tservicio_trol VALUES("73","2","0");
INSERT INTO tservicio_trol VALUES("73","4","0");
INSERT INTO tservicio_trol VALUES("74","1","0");
INSERT INTO tservicio_trol VALUES("74","2","0");
INSERT INTO tservicio_trol VALUES("74","4","0");
INSERT INTO tservicio_trol VALUES("75","1","0");
INSERT INTO tservicio_trol VALUES("75","2","0");
INSERT INTO tservicio_trol VALUES("75","4","0");
INSERT INTO tservicio_trol VALUES("76","1","0");
INSERT INTO tservicio_trol VALUES("76","2","0");
INSERT INTO tservicio_trol VALUES("77","1","9");
INSERT INTO tservicio_trol VALUES("77","2","4");
INSERT INTO tservicio_trol VALUES("77","4","1");
INSERT INTO tservicio_trol VALUES("78","1","0");
INSERT INTO tservicio_trol VALUES("78","2","0");
INSERT INTO tservicio_trol VALUES("79","1","0");
INSERT INTO tservicio_trol VALUES("79","2","0");
INSERT INTO tservicio_trol VALUES("80","1","0");
INSERT INTO tservicio_trol VALUES("80","2","0");
INSERT INTO tservicio_trol VALUES("81","1","10");
INSERT INTO tservicio_trol VALUES("81","2","5");
INSERT INTO tservicio_trol VALUES("81","4","2");
INSERT INTO tservicio_trol VALUES("82","1","0");
INSERT INTO tservicio_trol VALUES("82","2","0");
INSERT INTO tservicio_trol VALUES("83","1","0");
INSERT INTO tservicio_trol VALUES("83","2","0");
INSERT INTO tservicio_trol VALUES("84","1","1");
INSERT INTO tservicio_trol VALUES("84","2","1");
INSERT INTO tservicio_trol VALUES("84","3","1");
INSERT INTO tservicio_trol VALUES("84","4","1");
INSERT INTO tservicio_trol VALUES("85","1","2");
INSERT INTO tservicio_trol VALUES("85","2","2");
INSERT INTO tservicio_trol VALUES("85","3","2");
INSERT INTO tservicio_trol VALUES("85","4","2");
INSERT INTO tservicio_trol VALUES("86","1","0");
INSERT INTO tservicio_trol VALUES("86","2","0");
INSERT INTO tservicio_trol VALUES("86","3","0");
INSERT INTO tservicio_trol VALUES("86","4","0");
INSERT INTO tservicio_trol VALUES("87","1","0");
INSERT INTO tservicio_trol VALUES("87","2","0");
INSERT INTO tservicio_trol VALUES("87","3","0");
INSERT INTO tservicio_trol VALUES("87","4","0");
INSERT INTO tservicio_trol VALUES("88","1","1");
INSERT INTO tservicio_trol VALUES("88","2","1");
INSERT INTO tservicio_trol VALUES("88","3","1");
INSERT INTO tservicio_trol VALUES("88","4","1");
INSERT INTO tservicio_trol VALUES("90","1","0");
INSERT INTO tservicio_trol VALUES("90","2","0");
INSERT INTO tservicio_trol VALUES("90","4","0");
INSERT INTO tservicio_trol VALUES("91","1","0");
INSERT INTO tservicio_trol VALUES("91","2","0");
INSERT INTO tservicio_trol VALUES("91","4","0");
INSERT INTO tservicio_trol VALUES("92","1","4");
INSERT INTO tservicio_trol VALUES("92","2","4");
INSERT INTO tservicio_trol VALUES("92","4","4");
INSERT INTO tservicio_trol VALUES("93","1","0");
INSERT INTO tservicio_trol VALUES("93","2","0");
INSERT INTO tservicio_trol VALUES("93","3","0");
INSERT INTO tservicio_trol VALUES("93","4","0");
INSERT INTO tservicio_trol VALUES("94","2","0");
INSERT INTO tservicio_trol VALUES("94","3","0");
INSERT INTO tservicio_trol VALUES("94","4","0");
INSERT INTO tservicio_trol VALUES("99","1","0");
INSERT INTO tservicio_trol VALUES("99","2","0");
INSERT INTO tservicio_trol VALUES("99","4","0");
INSERT INTO tservicio_trol VALUES("100","1","0");
INSERT INTO tservicio_trol VALUES("100","2","0");
INSERT INTO tservicio_trol VALUES("100","4","0");
INSERT INTO tservicio_trol VALUES("101","1","0");
INSERT INTO tservicio_trol VALUES("101","2","0");
INSERT INTO tservicio_trol VALUES("101","3","0");
INSERT INTO tservicio_trol VALUES("101","4","0");
INSERT INTO tservicio_trol VALUES("102","1","4");
INSERT INTO tservicio_trol VALUES("102","2","3");
INSERT INTO tservicio_trol VALUES("102","4","4");
INSERT INTO tservicio_trol VALUES("103","1","3");
INSERT INTO tservicio_trol VALUES("103","2","4");
INSERT INTO tservicio_trol VALUES("103","4","3");
INSERT INTO tservicio_trol VALUES("104","1","0");
INSERT INTO tservicio_trol VALUES("104","2","0");
INSERT INTO tservicio_trol VALUES("104","4","0");
INSERT INTO tservicio_trol VALUES("105","1","0");
INSERT INTO tservicio_trol VALUES("105","2","0");
INSERT INTO tservicio_trol VALUES("105","4","0");
INSERT INTO tservicio_trol VALUES("107","1","0");
INSERT INTO tservicio_trol VALUES("107","3","0");
INSERT INTO tservicio_trol VALUES("108","1","3");
INSERT INTO tservicio_trol VALUES("108","2","7");
INSERT INTO tservicio_trol VALUES("108","3","2");
INSERT INTO tservicio_trol VALUES("108","4","3");
INSERT INTO tservicio_trol VALUES("109","1","0");
INSERT INTO tservicio_trol VALUES("109","2","0");
INSERT INTO tservicio_trol VALUES("109","4","0");
INSERT INTO tservicio_trol VALUES("110","1","4");
INSERT INTO tservicio_trol VALUES("110","2","6");
INSERT INTO tservicio_trol VALUES("110","3","3");
INSERT INTO tservicio_trol VALUES("110","4","4");
INSERT INTO tservicio_trol VALUES("111","1","2");
INSERT INTO tservicio_trol VALUES("111","2","5");
INSERT INTO tservicio_trol VALUES("111","3","4");
INSERT INTO tservicio_trol VALUES("111","4","2");
INSERT INTO tservicio_trol VALUES("112","1","5");
INSERT INTO tservicio_trol VALUES("112","2","2");
INSERT INTO tservicio_trol VALUES("112","3","5");
INSERT INTO tservicio_trol VALUES("112","4","5");
INSERT INTO tservicio_trol VALUES("113","1","6");
INSERT INTO tservicio_trol VALUES("113","2","4");
INSERT INTO tservicio_trol VALUES("113","4","6");
INSERT INTO tservicio_trol VALUES("114","1","7");
INSERT INTO tservicio_trol VALUES("114","2","3");
INSERT INTO tservicio_trol VALUES("114","4","7");
INSERT INTO tservicio_trol VALUES("115","1","8");
INSERT INTO tservicio_trol VALUES("115","2","8");
INSERT INTO tservicio_trol VALUES("115","4","8");
INSERT INTO tservicio_trol VALUES("116","1","1");
INSERT INTO tservicio_trol VALUES("116","2","1");
INSERT INTO tservicio_trol VALUES("116","3","1");
INSERT INTO tservicio_trol VALUES("116","4","1");
INSERT INTO tservicio_trol VALUES("117","1","2");
INSERT INTO tservicio_trol VALUES("117","2","2");
INSERT INTO tservicio_trol VALUES("117","3","2");
INSERT INTO tservicio_trol VALUES("117","4","2");
INSERT INTO tservicio_trol VALUES("118","1","7");
INSERT INTO tservicio_trol VALUES("118","2","2");
INSERT INTO tservicio_trol VALUES("119","1","0");
INSERT INTO tservicio_trol VALUES("119","2","0");
INSERT INTO tservicio_trol VALUES("120","1","10");
INSERT INTO tservicio_trol VALUES("120","2","10");
INSERT INTO tservicio_trol VALUES("120","3","2");
INSERT INTO tservicio_trol VALUES("121","1","0");
INSERT INTO tservicio_trol VALUES("121","2","0");
INSERT INTO tservicio_trol VALUES("121","3","0");
INSERT INTO tservicio_trol VALUES("122","1","0");
INSERT INTO tservicio_trol VALUES("122","2","0");
INSERT INTO tservicio_trol VALUES("122","3","0");
INSERT INTO tservicio_trol VALUES("123","1","0");
INSERT INTO tservicio_trol VALUES("123","2","0");
INSERT INTO tservicio_trol VALUES("123","3","0");
INSERT INTO tservicio_trol VALUES("124","1","8");
INSERT INTO tservicio_trol VALUES("124","2","3");
INSERT INTO tservicio_trol VALUES("125","1","0");
INSERT INTO tservicio_trol VALUES("125","2","0");
INSERT INTO tservicio_trol VALUES("126","1","11");
INSERT INTO tservicio_trol VALUES("126","2","6");
INSERT INTO tservicio_trol VALUES("127","2","8");
INSERT INTO tservicio_trol VALUES("128","1","0");
INSERT INTO tservicio_trol VALUES("128","2","0");
INSERT INTO tservicio_trol VALUES("130","1","12");
INSERT INTO tservicio_trol VALUES("130","2","3");
INSERT INTO tservicio_trol VALUES("130","4","3");
INSERT INTO tservicio_trol VALUES("131","1","6");
INSERT INTO tservicio_trol VALUES("131","2","5");
INSERT INTO tservicio_trol VALUES("131","3","2");
INSERT INTO tservicio_trol VALUES("131","4","5");
INSERT INTO tservicio_trol VALUES("132","1","0");
INSERT INTO tservicio_trol VALUES("132","2","0");
INSERT INTO tservicio_trol VALUES("132","3","0");
INSERT INTO tservicio_trol VALUES("132","4","0");
INSERT INTO tservicio_trol VALUES("133","1","11");
INSERT INTO tservicio_trol VALUES("133","2","11");
INSERT INTO tservicio_trol VALUES("133","3","3");
INSERT INTO tservicio_trol VALUES("134","1","0");
INSERT INTO tservicio_trol VALUES("134","2","0");
INSERT INTO tservicio_trol VALUES("134","3","0");
INSERT INTO tservicio_trol VALUES("135","1","0");
INSERT INTO tservicio_trol VALUES("135","2","0");
INSERT INTO tservicio_trol VALUES("135","3","0");
INSERT INTO tservicio_trol VALUES("136","1","0");
INSERT INTO tservicio_trol VALUES("136","2","0");
INSERT INTO tservicio_trol VALUES("136","3","0");
INSERT INTO tservicio_trol VALUES("136","4","0");
INSERT INTO tservicio_trol VALUES("137","1","8");
INSERT INTO tservicio_trol VALUES("138","1","2");
INSERT INTO tservicio_trol VALUES("139","1","0");
INSERT INTO tservicio_trol VALUES("140","1","0");
INSERT INTO tservicio_trol VALUES("141","1","0");
INSERT INTO tservicio_trol VALUES("142","1","0");
INSERT INTO tservicio_trol VALUES("143","1","0");
INSERT INTO tservicio_trol VALUES("144","1","0");
INSERT INTO tservicio_trol VALUES("145","1","3");
INSERT INTO tservicio_trol VALUES("145","2","3");
INSERT INTO tservicio_trol VALUES("145","3","3");
INSERT INTO tservicio_trol VALUES("145","4","3");
INSERT INTO tservicio_trol VALUES("146","1","4");
INSERT INTO tservicio_trol VALUES("146","2","4");
INSERT INTO tservicio_trol VALUES("146","3","4");
INSERT INTO tservicio_trol VALUES("146","4","4");
INSERT INTO tservicio_trol VALUES("147","1","5");
INSERT INTO tservicio_trol VALUES("148","1","9");
INSERT INTO tservicio_trol VALUES("149","1","0");
INSERT INTO tservicio_trol VALUES("150","1","10");
INSERT INTO tservicio_trol VALUES("151","1","0");



DROP TABLE tsistema;

CREATE TABLE `tsistema` (
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO tsistema VALUES("2","<p>Bienvenidos al sistema..</p>","<p>Administrar las políticas de educación especial en el área de las deficiencias visuales a la población atendida</p>","<p style=\"text-align: justify;\">Alcanzar el máximo nivel de desarrollo de los participantes para su plena realización personal, social, profesional y laboral.</p>","<p style=\"text-align: justify;\">Así comenzó la educación de las personas con discapacidad visual del Estado Portuguesa, con un sueño compartido con otras personas, movidos por un sentimiento común, la pérdida del sentido de la vista. Un grupo de personas se reúne con la idea de formar una institución que le brindará atención educativa a todas las personas con discapacidad visual, y motivados por el señor Erasmo Conde quien dirigía la Asociación Portugueseña de Ciegos, quien contaba con todo el apoyo de sus miembros, se crea el Instituto de ciegos del estado Portuguesa que funcionó desde 1986 hasta 1991 con personal voluntario, en forma asistemática, su labor fue más de captación y preparación de recursos humanos y de información a la comunidad, promoción y divulgación, que de una atención propiamente dicha. La capacitación del personal voluntario en el área de las deficiencias visuales, estuvo a cargo en un principio por profesionales del Centro de Rehabilitación para el Discapacitado Visual adscrito al Ministerio de Sanidad de Caracas, dirigido por el Dr. Antonio Isea, mediante un gran programa de atención basado en la comunidad, con seis cursos intensivos a los cuales asistieron numerosas personas de toda la colectividad de Acarigua – Araure, quedando solamente tres, comprometidos con la idea y con el objetivo claro por el cual se iba a luchar. El 15 de enero de 1992, el anterior Instituto se convierte en Centro de Atención Integral de Deficiencias Visuales, funcionando en un salón de un módulo tipo R-2, sede de la Asociación Portugueseña de Personas con Discapacidad Visual, bajo la supervisión del Departamento de Educación Especial y de la Dirección de Educación del estado, recibiendo apoyo en la parte Técnico –Administrativo- Docente con dos líneas de mando lo cual creó una situación de ambigüedad, lo que trajo como consecuencia problemas para la consecución de recursos tanto económicos como de dotación de mobiliario, equipos, personal docente y técnico (Psicólogo, Oftalmólogo y Trabajador Social) El 21 de enero de ese mismo año, el CAIDV inicia la educación integrada de niños y niñas con discapacidad visual en el ámbito de preescolar, para ello se realiza un taller denominado “Integración del niño Ciego al aula Regular”, auspiciado por los dos docentes que laboraban en ese momento, quienes estaban recién nombrados oficialmente, uno por el Ministerio de Educación (el Sr. Erasmo Conde) y la otra por la Dirección de Educación (la docente Blanca Torres) Es en 1997 cuando el Ministerio de Educación en una revisión y reorientación del modelo educativo para las personas con discapacidad visual promueve unas jornadas con la nueva política y conceptualización de atención educativa de las personas ciegas: y el documento presentado establece que todas las instituciones que imparten educación a personas ciegas desde ese momento se denominarán “Centro de Atención Integral” (CAI), lo que en principio se le cuestionaba a Portuguesa, en ese momento se le dio la razón.Es importante mencionar que este CAI es el primero en su género en el ámbito nacional, producto de la sinergia, sin embargo esto no fue suficiente para su codificación, porque el Ministerio de Educación alegaba que el personal del CAI era casi en su totalidad de la Dirección de Educación y no le brindaba apoyo. Fue en el año 2003, cuando la Dirección de Educación del Estado Portuguesa, en el marco de la creación de la Coordinación de Educación Especial, le asigna al CAIDV Acarigua el Código Educativo N° 099000. Otro aspecto relevante es que para lograr el gran sueño, ha sido necesario un cúmulo de esfuerzos para conservarlo y hacerlo realidad, es necesario reforzar la imagen inicial de trabajo para lograr lo que queremos, cultivando la cultura del esfuerzo y la búsqueda constante de nuevas formas de actuar, así mismo se requiere desarrollar todo un programa mental que integre los planes tomando en cuenta nuestras fortalezas y oportunidades. En general se podría decir que la experiencia de estos 20 años, ha sido a grandes rasgos, la siguiente:</p>\n<ul style=\"text-align: justify;\">\n<li>\n<p>Se crea la organización en la cual se pone de manifiesto mayor interés en la integración a la vida diaria.</p>\n</li>\n</ul>\n<ul style=\"text-align: justify;\">\n<li>\n<p>Se afronta la problemática de la persona con discapacidad visual desde una óptica más compleja, involucrando niños, niñas, adolescentes, jóvenes y adultos en la preparación indispensable para desenvolverse en la vida.</p>\n</li>\n</ul>\n<ul style=\"text-align: justify;\">\n<li>\n<p>&nbsp;Se crea otro CAI en la ciudad de Guanare con características similares a éste para la atención de los municipios adyacentes.</p>\n</li>\n</ul>\n<ul style=\"text-align: justify;\">\n<li>\n<p>Se logra la construcción de otra R-2 ampliando así el espacio físico para la población del momento, e independizando el Área Educativa del Área gremial.</p>\n</li>\n</ul>\n<ul style=\"text-align: justify;\">\n<li>\n<p>Se inicia la integración en niveles y modalidades del sistema educativo.</p>\n</li>\n</ul>\n<ul style=\"text-align: justify;\">\n<li>\n<p>Se inicia la integración laboral de la persona con discapacidad.</p>\n</li>\n</ul>\n<ul>\n<li>\n<p>En el año escolar 2005-2006, se inicia la aplicación del Proyecto de Tecnologías Adaptativas para personas con discapacidad visual, mediante el Software Jaws, primero con la formación de un docente (TSU María José Garantota) y actualmente con los participantes integrados en educación media, diversificada y universitaria. En otro orden de ideas la institución es tomada en cuenta actualmente como centro de pasantías de CEDUPORT, institución que forma auxiliares de educación Especial, y la Universidad Bolivariana en la cátedra de formación de docentes, Colegio Universitario Fermín Toro y Colegio Universitario Monseñor de Talavera, además en este centro se le ofrece atención formativa a estudiantes de diferentes universidades locales que asisten para investigar aspectos asociados al área de las deficiencias visuales. El CAIDV Acarigua es una unidad operativa que funciona como servicio de apoyo de la modalidad de Educación Especial, brinda atención educativa integral a la población de niños, niñas, adolescentes, jóvenes y adultos con discapacidad visual, con o sin discapacidad asociada ubicados en los (7) siete municipios de la parte norte del estado Portuguesa, a través de 2 alternativas de atención:</p>\n</li>\n</ul>\n<ol style=\"text-align: justify;\">\n<li>\n<p>Directa: en el propio CAI, a la población con o sin discapacidad asociada, que aún no ha sido integrada ni educativa ni laboralmente, o no puede ser integrada.</p>\n</li>\n<li>\n<p>Como unidad de Apoyo, a fin de garantizar:</p>\n</li>\n</ol>\n<ul style=\"padding-left: 30px; text-align: justify;\">\n<li>\n<p>Atención integral temprana a niños, y niñas con discapacidad visual con o sin discapacidad asociada, cuyas edades estén comprendidas entre 0 y 6 años, atendidos en los Centros de Desarrollo Infantil, así como garantizar la continuidad del proceso educativo de esta población.</p>\n</li>\n</ul>\n<ul style=\"padding-left: 30px;\">\n<li>\n<p style=\"text-align: justify;\">El proceso de integración escolar de esta población en los niveles de Educación Preescolar, Básica, Media, Diversificada, Superior, Modalidades de Educación Especial y Educación de Adultos. Los CAI, por su condición de Unidad de apoyo, no están concebidos para brindar escolaridad a su población, pues esto es competencia de los planteles donde están integrados los educandos, razón por la cual se deben realizar acciones de manera cooperativa y coordinada con estas instancias educativas y con otros sectores (salud, social, entre otros).</p>\n</li>\n</ul>","<ul>\n<li>\n<p>Brindar atención Integral a niños, niñas, adolescentes, jóvenes y adultos con discapacidad visual, con o sin discapacidad asociada, a fin de desarrollar habilidades y destrezas que le permitan maximizar sus potencialidades y optimizar sus posibilidades para la integración familiar, educativa, comunitaria.</p>\n</li>\n</ul>\n<div>\n<ul>\n<li>\n<p>Aplicar estrategias que faciliten la formación y capacitación de jóvenes y adultos con discapacidad visual, con o sin discapacidades asociadas, mediante la articulación intrasectorial e intersectorial con la finalidad de lograr su Integración Socio laboral.</p>\n</li>\n</ul>\n<ul>\n<li>\n<p>Orientar a la familia y comunidad en general para que participe activamente en el proceso de Integración Social de niños, niñas, adolescentes, jóvenes y adultos con discapacidad visual con o sin discapacidad asociada, mediante charlas, talleres, jornadas de difusión, conferencias y otras actividades educativas, culturales, artísticas, recreativas, deportivas, científicas y tecnológicas.</p>\n</li>\n</ul>\n<ul>\n<li style=\"text-align: justify;\">\n<p>Ofrecer atención integral a la persona con discapacidad visual o baja visión considerando tanto sus potencialidades como las condiciones que faciliten su integración social.</p>\n</li>\n</ul>\n<ul>\n<li>\n<p>Fomentar el respeto por los derechos de la persona con discapacidad visual.</p>\n</li>\n</ul>\n<ul>\n<li>\n<p>Promover atención preventiva e integral de la persona con discapacidad visual o con baja visión desde su nacimiento, a fin de lograr el máximo aprovechamiento de sus potencialidades y su integración al núcleo familiar, escolar y social.</p>\n</li>\n</ul>\n<ul>\n<li>\n<p>Incorporar la familia y la comunidad al proceso educativo de la persona con discapacidad visual y con baja visión.</p>\n</li>\n</ul>\n<ul>\n<li>\n<p>Promover la capacitación de la persona con discapacidad visual para su incorporación en el campo laboral.</p>\n</li>\n</ul>\n</div>\n<div>&nbsp;</div>","<p>Calle Luis Braille con Av. Circunvalación detrás del Centro de Bellas Artes sector Los Cortijos.</p>","2","12345678","4","120","60","270");



DROP TABLE tslider;

CREATE TABLE `tslider` (
  `idslider` int(11) NOT NULL AUTO_INCREMENT,
  `titulosli` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `textosli` text COLLATE utf8_spanish2_ci NOT NULL,
  `imagensli` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `estatussli` char(1) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`idslider`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO tslider VALUES("1","CAIDV AVANZA","Presentación a la Comunidad CAIDV del proyecto.","IMG00305-20120517-1004.jpg","1");
INSERT INTO tslider VALUES("2","TRABAJO MANUAL","Una clase de manualidades","IMG_5163.JPG","1");
INSERT INTO tslider VALUES("3","PROYECTO SISCAIDV","Implantando el proyecto en el Laboratorio CEBIT del CAIDV","IMG-20150206-WA0002.jpg","1");



DROP TABLE tunidad;

CREATE TABLE `tunidad` (
  `idunidad` int(11) NOT NULL AUTO_INCREMENT,
  `nombreuni` varchar(500) COLLATE utf8_spanish2_ci NOT NULL,
  `estatusuni` char(1) COLLATE utf8_spanish2_ci NOT NULL DEFAULT '1',
  `tasignatura_idasignatura` int(11) NOT NULL,
  PRIMARY KEY (`idunidad`),
  KEY `tasignatura_idasignatura` (`tasignatura_idasignatura`),
  CONSTRAINT `tunidad_ibfk_1` FOREIGN KEY (`tasignatura_idasignatura`) REFERENCES `tasignatura` (`idasignatura`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO tunidad VALUES("1","Conceptos básicos","1","4");
INSERT INTO tunidad VALUES("5","LA COMPUTADORA ","1","1");



DROP TABLE tusuario;

CREATE TABLE `tusuario` (
  `idusuario` varchar(20) NOT NULL,
  `nombreusu` varchar(45) NOT NULL,
  `emailusu` varchar(55) NOT NULL,
  `estatususu` tinyint(1) NOT NULL DEFAULT '1',
  `ultima_actividadusu` datetime NOT NULL,
  `trol_idrol` int(11) NOT NULL,
  `cedula` char(9) DEFAULT 'S/C',
  `intentos_fallidos` int(11) NOT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `fk_tusuario_trol1_idx` (`trol_idrol`),
  CONSTRAINT `fk_tusuario_trol1` FOREIGN KEY (`trol_idrol`) REFERENCES `trol` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO tusuario VALUES("12526145","GONZALEZ LEIBI","LEIBIGON@GMAIL.COM","0","2015-05-01 17:47:44","1","12526145","0");
INSERT INTO tusuario VALUES("15491963","SPADARO ANTONIO","SPADARO.ANTO@GMAIL.COM","1","2015-05-16 10:15:28","1","15491963","0");
INSERT INTO tusuario VALUES("17960877","DIAZ EFREN ","EDM_126@HOTMAIL.COM","1","2015-03-24 22:01:46","1","17960877","0");
INSERT INTO tusuario VALUES("18672728","APONTE JORGE","COREO@SDD.COM","1","2015-03-24 22:12:29","1","18672728","0");
INSERT INTO tusuario VALUES("administrador","Web Master","webmaster@gmail.com","1","2015-05-09 09:23:46","1","0","0");



DROP TABLE tvalor_item;

CREATE TABLE `tvalor_item` (
  `idvalor_item` int(11) NOT NULL AUTO_INCREMENT,
  `valorval` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `estatusval` char(1) COLLATE utf8_spanish2_ci NOT NULL,
  `titem_iditem` int(11) DEFAULT NULL,
  PRIMARY KEY (`idvalor_item`),
  KEY `fk_tvalor_item_titem` (`titem_iditem`),
  CONSTRAINT `fk_tvalor_item_titem` FOREIGN KEY (`titem_iditem`) REFERENCES `titem` (`iditem`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO tvalor_item VALUES("3","VISUAL","1","10");
INSERT INTO tvalor_item VALUES("4","AUDITIVA","1","10");
INSERT INTO tvalor_item VALUES("5","LINGUISTICA","1","10");
INSERT INTO tvalor_item VALUES("6","MOTORA","1","10");
INSERT INTO tvalor_item VALUES("7","COGNITIVA","1","10");
INSERT INTO tvalor_item VALUES("8","SI","1","12");
INSERT INTO tvalor_item VALUES("9","NO","1","12");
INSERT INTO tvalor_item VALUES("10","MASCULINO","1","3");
INSERT INTO tvalor_item VALUES("11","FEMENINO","1","3");
INSERT INTO tvalor_item VALUES("16","SI","1","13");
INSERT INTO tvalor_item VALUES("17","NO","1","13");
INSERT INTO tvalor_item VALUES("18","SI","1","14");
INSERT INTO tvalor_item VALUES("19","NO","1","14");
INSERT INTO tvalor_item VALUES("20","SI","1","15");
INSERT INTO tvalor_item VALUES("21","NO","1","15");
INSERT INTO tvalor_item VALUES("22","SI","1","16");
INSERT INTO tvalor_item VALUES("23","NO","1","16");
INSERT INTO tvalor_item VALUES("24","SI","1","17");
INSERT INTO tvalor_item VALUES("25","NO","1","17");
INSERT INTO tvalor_item VALUES("26","SI","1","18");
INSERT INTO tvalor_item VALUES("27","NO","1","18");
INSERT INTO tvalor_item VALUES("28","SI","1","19");
INSERT INTO tvalor_item VALUES("29","NO","1","19");
INSERT INTO tvalor_item VALUES("30","SI","1","20");
INSERT INTO tvalor_item VALUES("31","NO","1","20");
INSERT INTO tvalor_item VALUES("32","SI","1","21");
INSERT INTO tvalor_item VALUES("33","NO","1","21");
INSERT INTO tvalor_item VALUES("34","SI","1","22");
INSERT INTO tvalor_item VALUES("35","NO","1","22");
INSERT INTO tvalor_item VALUES("36","SI","1","23");
INSERT INTO tvalor_item VALUES("37","NO","1","23");
INSERT INTO tvalor_item VALUES("38","SI","1","24");
INSERT INTO tvalor_item VALUES("39","NO","1","24");
INSERT INTO tvalor_item VALUES("40","SI","1","25");
INSERT INTO tvalor_item VALUES("41","NO","1","25");
INSERT INTO tvalor_item VALUES("42","SI","1","26");
INSERT INTO tvalor_item VALUES("43","NO","1","26");
INSERT INTO tvalor_item VALUES("44","SI","1","27");
INSERT INTO tvalor_item VALUES("45","NO","1","27");
INSERT INTO tvalor_item VALUES("46","SI","1","28");
INSERT INTO tvalor_item VALUES("47","NO","1","28");
INSERT INTO tvalor_item VALUES("48","SI","1","29");
INSERT INTO tvalor_item VALUES("49","NO","1","29");
INSERT INTO tvalor_item VALUES("50","SI","1","30");
INSERT INTO tvalor_item VALUES("51","NO","1","30");



