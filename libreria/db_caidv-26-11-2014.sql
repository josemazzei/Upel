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

INSERT INTO participante_familiar VALUES("2","10425235","4","1","1");
INSERT INTO participante_familiar VALUES("4","5098876","6","1","0");
INSERT INTO participante_familiar VALUES("5","10898234","2","1","1");
INSERT INTO participante_familiar VALUES("5","20272773","3","0","1");
INSERT INTO participante_familiar VALUES("5","4090412","1","0","1");
INSERT INTO participante_familiar VALUES("7","20490356","3","1","1");
INSERT INTO participante_familiar VALUES("8","10768890","4","1","1");
INSERT INTO participante_familiar VALUES("8","10898234","2","0","1");
INSERT INTO participante_familiar VALUES("8","4090412","1","0","1");
INSERT INTO participante_familiar VALUES("9","10425235","2","1","1");
INSERT INTO participante_familiar VALUES("10","4090412","1","1","1");
INSERT INTO participante_familiar VALUES("11","10425235","2","1","1");
INSERT INTO participante_familiar VALUES("11","19239857","3","0","1");
INSERT INTO participante_familiar VALUES("11","4090412","6","0","1");
INSERT INTO participante_familiar VALUES("11","7090413","1","0","1");
INSERT INTO participante_familiar VALUES("12","10768890","1","1","1");
INSERT INTO participante_familiar VALUES("13","10452352","2","0","1");
INSERT INTO participante_familiar VALUES("13","9436326","1","1","1");



DROP TABLE tacceso;

CREATE TABLE `tacceso` (
  `idacceso` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` varchar(20) NOT NULL,
  `exitoacc` char(1) NOT NULL,
  `fechaacc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_salidaacc` datetime DEFAULT NULL,
  `ipacc` varchar(15) NOT NULL,
  `estatusacc` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idacceso`),
  KEY `fk_tacceso_tusuario1_idx` (`idusuario`),
  KEY `fk_tacceso_tservicio1_idx` (`exitoacc`)
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8;

INSERT INTO tacceso VALUES("3","administrador","1","2014-02-13 21:18:07","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("10","administrador","1","2014-02-13 21:41:03","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("19","admin","0","2014-02-13 21:47:19","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("20","admin","0","2014-02-13 21:47:22","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("21","admin","0","2014-02-13 21:47:24","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("22","admin","0","2014-02-13 21:47:27","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("23","admin","0","2014-02-13 21:47:29","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("24","administrador","1","2014-02-13 21:48:05","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("25","administrador","1","2014-02-13 21:49:29","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("27","administrador","1","2014-02-13 21:50:22","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("29","0","0","2014-02-13 22:03:51","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("30","0","0","2014-02-13 22:05:10","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("36","administrador","1","2014-02-13 22:11:16","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("37","administrador","1","2014-02-17 21:05:21","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("38","administrador","1","2014-02-17 21:11:49","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("39","4090423","1","2014-02-17 21:13:23","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("40","administrador","1","2014-02-17 21:13:44","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("41","administrador","1","2014-02-17 22:24:22","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("42","4090420","1","2014-02-17 22:27:01","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("43","administrador","1","2014-02-17 22:27:54","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("44","administrador","1","2014-02-17 22:45:46","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("47","administrador","1","2014-02-23 17:02:06","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("48","administrador","1","2014-02-23 17:07:15","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("49","administrador","1","2014-02-27 11:52:50","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("50","administrador","1","2015-01-01 23:40:59","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("51","administrador","1","2014-02-28 23:43:47","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("52","administrador","1","2014-03-05 18:32:01","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("53","administrador","1","2014-03-06 22:15:25","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("54","administrador","1","2014-03-13 22:40:32","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("55","administrador","1","2014-03-14 00:00:23","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("57","administrador","1","2014-03-14 15:59:12","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("58","administrador","1","2014-03-14 16:03:22","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("59","administrador","1","2014-03-15 01:45:27","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("60","administrador","1","2014-03-15 01:48:51","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("61","administrador","1","2014-03-17 21:19:03","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("63","administrador","1","2014-03-19 22:33:36","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("64","administrador","1","2014-03-20 21:48:53","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("65","administrador","1","2014-03-20 21:53:33","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("66","administrador","1","2014-03-21 03:38:51","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("67","administrador","1","2014-03-21 22:17:25","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("68","administrador","1","2014-03-28 18:08:16","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("69","administrador","1","2014-03-30 21:34:53","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("70","administrador","1","2014-03-31 18:34:54","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("71","administrador","1","2014-03-31 20:34:31","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("72","administrador","1","2014-04-02 00:53:26","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("73","administrador","1","2014-04-03 21:42:19","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("74","20158248","0","2014-04-04 11:16:24","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("75","20158248","0","2014-04-04 11:16:30","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("76","20158248","0","2014-04-04 11:16:34","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("77","20158248","0","2014-04-04 11:16:39","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("78","administrador","1","2014-04-04 11:16:47","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("79","10328765","1","2014-04-04 11:23:42","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("80","administrador","1","2014-04-04 11:34:22","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("81","administrador","1","2014-04-04 20:36:58","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("82","administrador","1","2014-04-04 21:31:12","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("83","administrador","1","2014-04-04 22:38:10","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("84","administrador","1","2014-04-04 22:43:10","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("85","administrador","1","2014-04-05 20:56:18","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("86","administrador","1","2014-04-06 23:35:19","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("87","administrador","1","2014-04-07 12:53:29","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("88","administrador","1","2014-04-12 15:34:06","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("89","administrador","1","2014-04-14 17:45:47","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("90","administrador","1","2014-04-15 17:06:24","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("91","administrador","1","2014-04-15 18:03:04","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("92","administrador","1","2014-04-16 17:46:30","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("93","administrador","1","2014-04-20 17:51:05","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("94","administrador","1","2014-04-24 21:16:32","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("95","administrador","1","2014-04-25 15:23:55","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("96","administrador","1","2014-04-25 20:09:27","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("97","administrador","1","2014-04-29 11:16:04","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("98","administrador","1","2014-04-29 13:56:07","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("99","administrador","1","2014-05-01 15:21:22","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("100","administrador","1","2014-05-01 22:30:36","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("101","administrador","1","2014-05-26 18:27:40","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("102","administrador","1","2014-06-12 21:39:37","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("104","administrador","1","2014-10-14 21:25:40","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("105","administrador","1","2014-10-15 17:30:54","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("106","administrador","1","2014-10-15 18:06:00","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("107","administrador","1","2014-10-15 18:32:30","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("108","administrador","1","2014-10-15 18:34:46","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("109","administrador","1","2014-10-15 18:36:20","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("111","administrador","1","2014-10-23 18:38:39","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("112","administrador","1","2014-10-28 17:45:45","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("113","administrador","1","2014-10-28 17:47:18","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("114","administrador","1","2014-10-28 17:47:25","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("115","administrador","1","2014-10-28 17:48:06","2014-10-28 17:48:06","127.0.0.1","0");
INSERT INTO tacceso VALUES("116","administrador","1","2014-10-28 18:38:50","2014-10-28 18:38:50","127.0.0.1","0");
INSERT INTO tacceso VALUES("118","adminasdfas","0","2014-10-28 18:49:19","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("120","Administrador","1","2014-10-28 18:52:01","2014-10-28 18:52:01","127.0.0.1","0");
INSERT INTO tacceso VALUES("123","Administrador","1","2014-10-28 19:00:11","2014-10-28 19:00:11","127.0.0.1","0");
INSERT INTO tacceso VALUES("124","Administrador","1","2014-10-28 19:00:42","2014-10-28 19:00:42","127.0.0.1","0");
INSERT INTO tacceso VALUES("126","Administrador","1","2014-10-28 19:02:11","2014-10-28 19:02:11","127.0.0.1","0");
INSERT INTO tacceso VALUES("128","Administrador","1","2014-10-28 19:46:52","2014-10-28 19:46:52","127.0.0.1","0");
INSERT INTO tacceso VALUES("130","Administrador","1","2014-10-28 19:52:57","2014-10-28 19:52:57","127.0.0.1","0");
INSERT INTO tacceso VALUES("131","Administrador","0","2014-10-28 19:53:03","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("132","Administrador","0","2014-10-28 19:53:10","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("133","Administrador","1","2014-10-28 20:11:16","2014-10-28 20:11:16","127.0.0.1","0");
INSERT INTO tacceso VALUES("134","Administrador","0","2014-10-28 20:11:23","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("135","Administrador","0","2014-10-28 20:11:41","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("136","Administrador","0","2014-10-28 20:13:32","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("137","Administrador","0","2014-10-28 20:13:37","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("138","Administrador","0","2014-10-28 20:13:39","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("139","Administrador","1","2014-10-28 20:14:41","2014-10-28 20:14:41","127.0.0.1","0");
INSERT INTO tacceso VALUES("140","Administrador","0","2014-10-28 20:14:47","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("141","Administrador","0","2014-10-28 20:14:51","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("142","Administrador","1","2014-10-28 20:14:59","2014-10-28 20:17:23","127.0.0.1","0");
INSERT INTO tacceso VALUES("143","Administrador","1","2014-10-28 20:17:27","2014-10-28 20:21:03","127.0.0.1","0");
INSERT INTO tacceso VALUES("144","Administrador","1","2014-10-28 20:21:07","2014-10-28 23:17:28","127.0.0.1","0");
INSERT INTO tacceso VALUES("145","Administrador","1","2014-10-29 19:16:19","2014-11-25 01:35:22","127.0.0.1","0");
INSERT INTO tacceso VALUES("146","Administrador","0","2014-11-04 20:53:05","0000-00-00 00:00:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("147","Administrador","1","2014-11-04 20:53:13","2014-11-25 01:35:22","127.0.0.1","0");
INSERT INTO tacceso VALUES("148","Administrador","1","2014-11-12 17:55:04","2014-11-13 09:56:19","127.0.0.1","0");
INSERT INTO tacceso VALUES("149","Administrador","1","2014-11-19 21:02:15","2014-11-20 00:01:04","127.0.0.1","0");
INSERT INTO tacceso VALUES("150","Administrador","1","2014-11-20 00:02:10","2014-11-20 00:02:43","127.0.0.1","0");
INSERT INTO tacceso VALUES("151","Administrador","1","2014-11-20 00:02:48","2014-11-20 01:02:16","127.0.0.1","0");
INSERT INTO tacceso VALUES("152","Administrador","1","2014-11-20 01:02:28","2014-11-20 01:02:33","127.0.0.1","0");
INSERT INTO tacceso VALUES("153","Administrador","1","2014-11-20 02:08:18","2014-11-25 01:35:22","127.0.0.1","0");
INSERT INTO tacceso VALUES("154","Administrador","1","2014-11-24 18:50:12","2014-11-25 01:35:22","127.0.0.1","0");
INSERT INTO tacceso VALUES("155","Administrador","1","2014-11-24 19:20:35","2014-11-24 23:11:23","127.0.0.1","0");
INSERT INTO tacceso VALUES("156","Administrador","1","2014-11-24 23:11:28","2014-11-24 23:11:31","127.0.0.1","0");
INSERT INTO tacceso VALUES("157","Administrador","1","2014-11-24 23:41:11","2014-11-25 00:23:00","127.0.0.1","0");
INSERT INTO tacceso VALUES("158","Administrador","1","2014-11-25 01:35:22","2014-11-25 01:35:22","127.0.0.1","0");
INSERT INTO tacceso VALUES("159","Administrador","1","2014-11-25 01:35:27","2014-11-25 01:35:28","127.0.0.1","0");
INSERT INTO tacceso VALUES("160","Administrador","1","2014-11-25 01:36:59","2014-11-25 02:01:19","127.0.0.1","0");
INSERT INTO tacceso VALUES("161","Administrador","1","2014-11-25 02:01:41","2014-11-25 02:02:33","127.0.0.1","0");
INSERT INTO tacceso VALUES("163","Administrador","1","2014-11-25 02:03:15","2014-11-25 02:04:16","127.0.0.1","0");
INSERT INTO tacceso VALUES("165","20276546","1","2014-11-25 02:05:08","2014-11-25 02:11:19","127.0.0.1","0");
INSERT INTO tacceso VALUES("166","Administrador","1","2014-11-25 02:11:22","2014-11-25 02:12:32","127.0.0.1","0");
INSERT INTO tacceso VALUES("167","20276546","1","2014-11-25 02:12:41","2014-11-25 02:15:41","127.0.0.1","0");
INSERT INTO tacceso VALUES("168","Administrador","1","2014-11-25 02:15:45","2014-11-25 02:16:53","127.0.0.1","0");
INSERT INTO tacceso VALUES("169","20276546","1","2014-11-25 02:17:02","2014-11-25 02:17:13","127.0.0.1","0");
INSERT INTO tacceso VALUES("170","Administrador","1","2014-11-25 02:17:50","2014-11-25 02:26:06","127.0.0.1","0");
INSERT INTO tacceso VALUES("171","20276546","1","2014-11-25 02:26:39","2014-11-25 02:33:08","127.0.0.1","0");
INSERT INTO tacceso VALUES("172","Administrador","1","2014-11-25 02:31:26","2014-11-25 02:34:06","192.168.1.104","0");
INSERT INTO tacceso VALUES("173","20276546","1","2014-11-25 02:33:27","2014-11-25 02:33:52","127.0.0.1","0");
INSERT INTO tacceso VALUES("174","Administrador","1","2014-11-25 19:35:04","2014-11-25 19:57:05","127.0.0.1","0");
INSERT INTO tacceso VALUES("175","Administrador","1","2014-11-25 19:57:10","2014-11-25 22:04:57","127.0.0.1","0");
INSERT INTO tacceso VALUES("176","Administrador","1","2014-11-25 20:30:36","2014-11-25 22:04:57","127.0.0.1","0");
INSERT INTO tacceso VALUES("177","Administrador","1","2014-11-25 22:05:00","2014-11-25 22:20:55","127.0.0.1","0");
INSERT INTO tacceso VALUES("178","Administrador","1","2014-11-25 22:20:59","2014-11-25 23:15:37","127.0.0.1","0");
INSERT INTO tacceso VALUES("179","Administrador","1","2014-11-25 23:15:40","2014-11-25 23:51:46","127.0.0.1","0");
INSERT INTO tacceso VALUES("180","Administrador","1","2014-11-25 23:51:48","2014-11-26 00:23:19","127.0.0.1","0");
INSERT INTO tacceso VALUES("181","Administrador","1","2014-11-26 00:23:22","0000-00-00 00:00:00","127.0.0.1","1");



DROP TABLE tarea_conocimiento;

CREATE TABLE `tarea_conocimiento` (
  `idarea_conocimiento` int(11) NOT NULL AUTO_INCREMENT,
  `nombreare` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `estatusare` char(1) COLLATE utf8_spanish2_ci DEFAULT '1',
  PRIMARY KEY (`idarea_conocimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO tarea_conocimiento VALUES("1","BRAILLE","1");
INSERT INTO tarea_conocimiento VALUES("2","INFORMATICA","1");
INSERT INTO tarea_conocimiento VALUES("3","MANUALIDADES","1");



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

INSERT INTO tasignatura VALUES("1","BRAILLE 1","4","2","1","1");
INSERT INTO tasignatura VALUES("2","BRAILLE 2","6","2","1","1");
INSERT INTO tasignatura VALUES("3","INFORMATICA 1","4","2","2","1");
INSERT INTO tasignatura VALUES("4","INFORMATICA 2","4","2","2","1");



DROP TABLE tasistencia;

CREATE TABLE `tasistencia` (
  `idasistencia` int(11) NOT NULL AUTO_INCREMENT,
  `idcurso_idparticipante` int(11) NOT NULL,
  `fechaasi` date NOT NULL,
  `asistenciaasi` char(1) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`idasistencia`),
  KEY `fk_tasistencia_tcurso_tparticipante_1` (`idcurso_idparticipante`),
  CONSTRAINT `fk_tasistencia_tcurso_tparticipante_1` FOREIGN KEY (`idcurso_idparticipante`) REFERENCES `tcurso_tparticipante` (`idcurso_participante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;




DROP TABLE taula;

CREATE TABLE `taula` (
  `idaula` int(11) NOT NULL AUTO_INCREMENT,
  `nombreaul` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `tipoaul` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `capacidadaul` int(3) NOT NULL,
  `estatusaul` char(1) COLLATE utf8_spanish2_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`idaula`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO taula VALUES("1","LABORATORIO-1","LABORATORIO","10","1");
INSERT INTO taula VALUES("2","AULA 1","AULA","30","1");



DROP TABLE tbitacora;

CREATE TABLE `tbitacora` (
  `idbitacora` int(11) NOT NULL AUTO_INCREMENT,
  `direccionbit` varchar(300) NOT NULL,
  `fechahorabit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `valoranteriorbit` varchar(30) DEFAULT NULL,
  `valornuevobit` varchar(30) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=885 DEFAULT CHARSET=utf8;

INSERT INTO tbitacora VALUES("1","/proyecto_CAIDV/vista/intranet.php","2014-01-29 17:05:21","","","127.0.0.1","-","Navegar","-","-","administrador","Inicio");
INSERT INTO tbitacora VALUES("2","/proyecto_CAIDV/vista/intranet.php?vista=seguridad/bitacora","2014-01-29 17:05:21","","","127.0.0.1","-","Navegar","-","-","administrador","seguridad/bitacora");
INSERT INTO tbitacora VALUES("3","/proyecto_CAIDV/vista/intranet.php?vista=seguridad/bitacora","2014-01-29 17:05:21","","","127.0.0.1","-","Navegar","-","-","administrador","seguridad/bitacora");
INSERT INTO tbitacora VALUES("4","/proyecto_CAIDV/vista/intranet.php?vista=seguridad/bitacora","2014-01-29 17:05:21","","","127.0.0.1","-","Navegar","-","-","administrador","seguridad/bitacora");
INSERT INTO tbitacora VALUES("5","http://localhost/proyecto_CAIDV/vista/intranet.php?vista=seguridad/registrar_rol","2014-01-29 17:06:59","","","127.0.0.1","-","Registro","*","trol","administrador","registrar_rol");
INSERT INTO tbitacora VALUES("6","http://localhost/proyecto_CAIDV/vista/intranet.php?vista=sistema/registrar_municipio","2014-01-29 17:07:02","","","127.0.0.1","-","Registro","*","tmunicipio","administrador","registrar_municipio");
INSERT INTO tbitacora VALUES("7","http://localhost/proyecto_CAIDV/vista/intranet.php?vista=sistema/registrar_municipio","2014-01-29 17:07:05","","","127.0.0.1","-","Registro","*","tmunicipio","administrador","registrar_municipio");
INSERT INTO tbitacora VALUES("8","http://localhost/proyecto_CAIDV/vista/intranet.php?vista=sistema/consultar_municipio&id=2","2014-01-29 10:01:00","Araures","Araure","127.0.0.1","Error en los datos","Modificar","descripcionmun","tmunicipio","administrador","editar_municipio");
INSERT INTO tbitacora VALUES("9","http://localhost/proyecto_CAIDV/vista/intranet.php?vista=sistema/consultar_municipio&id=2","2014-01-29 10:01:00","Araure","Araures","127.0.0.1","Error en los datos","Modificar","descripcionmun","tmunicipio","administrador","editar_municipio");
INSERT INTO tbitacora VALUES("10","http://localhost/proyecto_CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&id=22","2014-01-29 10:01:00","Consultar municipio","Consultar municipi","127.0.0.1","Error en los datos","Modificar","nombreser","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("11","http://localhost/proyecto_CAIDV/vista/intranet.php?vista=seguridad/consultar_servicio&id=22","2014-01-29 10:01:00","sistema/consultar_municipio","sistema/consultar_municipi","127.0.0.1","Error en los datos","Modificar","enlaceser","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("12","http://localhost/proyecto_CAIDV/vista/intranet.php?vista=seguridad/consultar_bitacora&id=11&o=2","2014-01-29 11:01:00","sistema/consultar_municipio","sistema/consultar_municipi","127.0.0.1","Cambios no deseados","Revertir los cambios","enlaceser","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("13","http://localhost/proyecto_CAIDV/vista/intranet.php?vista=seguridad/consultar_bitacora&id=10&o=2","2014-01-29 11:01:00","Consultar municipio","Consultar municipi","127.0.0.1","Cambios no deseados","Revertir los cambios","nombreser","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("14","http://localhost/proyecto_CAIDV/vista/intranet.php?vista=sistema/consultar_municipio&id=2","2014-01-29 11:01:00","Araures","Araure","127.0.0.1","Error en los datos","Modificar","descripcionmun","tmunicipio","administrador","editar_municipio");
INSERT INTO tbitacora VALUES("15","http://localhost/proyecto_CAIDV/vista/intranet.php?vista=seguridad/consultar_bitacora&id=14&o=2","2014-01-29 11:01:00","Araures","Araure","127.0.0.1","Cambios no deseados","Revertir los cambios","descripcionmun","tmunicipio","administrador","editar_municipio");
INSERT INTO tbitacora VALUES("16","http://localhost/proyecto_CAIDV/vista/intranet.php?vista=sistema/consultar_municipio&id=2","2014-01-29 11:01:00","Araures","Araure","127.0.0.1","Error en los datos","Modificar","descripcionmun","tmunicipio","administrador","editar_municipio");
INSERT INTO tbitacora VALUES("17","http://localhost/proyecto_CAIDV/vista/intranet.php?vista=seguridad/consultar_bitacora&id=16&o=2","2014-01-29 11:01:00","Araure","Araures","127.0.0.1","Cambios no deseados","Revertir los cambios","descripcionmun","tmunicipio","administrador","editar_municipio");
INSERT INTO tbitacora VALUES("18","http://localhost/proyecto_CAIDV/vista/intranet.php?vista=seguridad/consultar_bitacora&id=17&o=2","2014-01-29 11:01:00","Araures","Araure","127.0.0.1","Cambios no deseados","Revertir los cambios","descripcionmun","tmunicipio","administrador","editar_municipio");
INSERT INTO tbitacora VALUES("19","http://localhost/proyecto_CAIDV/vista/intranet.php?vista=sistema/consultar_municipio&id=1","2014-01-29 11:01:00","Páez","Páezs","127.0.0.1","Error en los datos","Modificar","descripcionmun","tmunicipio","administrador","editar_municipio");
INSERT INTO tbitacora VALUES("20","http://localhost/proyecto_CAIDV/vista/intranet.php?vista=sistema/consultar_municipio&id=1","2014-01-29 11:01:00","Páezs","Páez","127.0.0.1","Error en los datos","Modificar","descripcionmun","tmunicipio","administrador","editar_municipio");
INSERT INTO tbitacora VALUES("21","http://localhost/antonio/vista/intranet.php?vista=sistema/municipio","2014-01-30 10:01:00","","","127.0.0.1","Datos no necesarios","Eliminar","*","tmunicipio","administrador","eliminar_municipio");
INSERT INTO tbitacora VALUES("22","http://localhost/Antonio/vista/intranet.php?vista=sistema/registrar_municipio","2014-01-31 01:01:00","","","127.0.0.1","Cargar datos","Registrar","*","tmunicipio","administrador","registrar_municipio");
INSERT INTO tbitacora VALUES("23","http://localhost/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-01-31 04:01:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("24","http://localhost/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-01-31 04:01:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("25","http://localhost/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-01-31 04:01:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("26","http://localhost/Antonio/vista/intranet.php?vista=archivo/registrar_parentesco","2014-01-31 04:01:00","","","127.0.0.1","Cargar datos","Registrar","*","tparentesco","administrador","registrar_parentesco");
INSERT INTO tbitacora VALUES("27","http://localhost/Antonio/vista/intranet.php?vista=archivo/registrar_parentesco","2014-01-31 04:01:00","","","127.0.0.1","Cargar datos","Registrar","*","tparentesco","administrador","registrar_parentesco");
INSERT INTO tbitacora VALUES("28","http://localhost/Antonio/vista/intranet.php?vista=archivo/registrar_parentesco","2014-01-31 04:01:00","","","127.0.0.1","Cargar datos","Registrar","*","tparentesco","administrador","registrar_parentesco");
INSERT INTO tbitacora VALUES("29","http://localhost/Antonio/vista/intranet.php?vista=archivo/registrar_parentesco","2014-01-31 04:01:00","","","127.0.0.1","Cargar datos","Registrar","*","tparentesco","administrador","registrar_parentesco");
INSERT INTO tbitacora VALUES("30","http://localhost/Antonio/vista/intranet.php?vista=archivo/registrar_parentesco","2014-01-31 04:01:00","","","127.0.0.1","Cargar datos","Registrar","*","tparentesco","administrador","registrar_parentesco");
INSERT INTO tbitacora VALUES("31","http://localhost/Antonio/vista/intranet.php?vista=archivo/registrar_parentesco","2014-01-31 04:01:00","","","127.0.0.1","Cargar datos","Registrar","*","tparentesco","administrador","registrar_parentesco");
INSERT INTO tbitacora VALUES("32","http://localhost/Antonio/vista/intranet.php?vista=archivo/registrar_parentesco","2014-01-31 04:01:00","","","127.0.0.1","Cargar datos","Registrar","*","tparentesco","administrador","registrar_parentesco");
INSERT INTO tbitacora VALUES("33","http://localhost/antonio/vista/intranet.php?vista=archivo/consultar_parentesco&id=7","2014-01-31 04:01:00","Abuela","Abuelas","127.0.0.1","Error en los datos","Modificar","descripcionpar","tparentesco","administrador","editar_parentesco");
INSERT INTO tbitacora VALUES("34","http://localhost/antonio/vista/intranet.php?vista=seguridad/consultar_bitacora&id=33&o=2","2014-01-31 04:01:00","Abuelas","Abuela","127.0.0.1","Cambios no deseados","Revertir los cambios","descripcionpar","tparentesco","administrador","editar_parentesco");
INSERT INTO tbitacora VALUES("35","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-01-31 04:01:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("36","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-01-31 04:01:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("37","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-01-31 04:01:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("38","http://localhost/antonio/vista/intranet.php?vista=archivo/registrar_diagnostico","2014-01-31 04:01:00","","","127.0.0.1","Cargar datos","Registrar","*","tdiagnostico","administrador","registrar_diagnostico");
INSERT INTO tbitacora VALUES("39","http://localhost/antonio/vista/intranet.php?vista=archivo/registrar_diagnostico","2014-01-31 04:01:00","","","127.0.0.1","Cargar datos","Registrar","*","tdiagnostico","administrador","registrar_diagnostico");
INSERT INTO tbitacora VALUES("40","http://localhost/antonio/vista/intranet.php?vista=archivo/registrar_diagnostico","2014-01-31 04:01:00","","","127.0.0.1","Cargar datos","Registrar","*","tdiagnostico","administrador","registrar_diagnostico");
INSERT INTO tbitacora VALUES("41","http://localhost/antonio/vista/intranet.php?vista=archivo/consultar_diagnostico&id=1","2014-01-31 05:01:00","Ceguera leve","Ceguera leves","127.0.0.1","Error en los datos","Modificar","descripciondia","tdiagnostico","administrador","editar_diagnostico");
INSERT INTO tbitacora VALUES("42","http://localhost/antonio/vista/intranet.php?vista=seguridad/consultar_servicio&id=20","2014-01-31 05:01:00","2","3","127.0.0.1","Error en los datos","Modificar","idmodulo","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("43","http://localhost/antonio/vista/intranet.php?vista=seguridad/consultar_servicio&id=21","2014-01-31 05:01:00","2","3","127.0.0.1","Error en los datos","Modificar","idmodulo","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("44","http://localhost/antonio/vista/intranet.php?vista=seguridad/consultar_servicio&id=22","2014-01-31 05:01:00","2","3","127.0.0.1","Error en los datos","Modificar","idmodulo","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("45","http://localhost/antonio/vista/intranet.php?vista=archivo/registrar_diagnostico","2014-01-31 05:01:00","","","127.0.0.1","Cargar datos","Registrar","*","tdiagnostico","administrador","registrar_diagnostico");
INSERT INTO tbitacora VALUES("46","http://localhost/antonio/vista/intranet.php?vista=archivo/registrar_diagnostico","2014-01-31 05:01:00","","","127.0.0.1","Cargar datos","Registrar","*","tdiagnostico","administrador","registrar_diagnostico");
INSERT INTO tbitacora VALUES("47","http://localhost/antonio/vista/intranet.php?vista=archivo/consultar_diagnostico&id=3","2014-01-31 05:01:00","Ceguera severa","Ceguera cevera","127.0.0.1","Error en los datos","Modificar","descripciondia","tdiagnostico","administrador","editar_diagnostico");
INSERT INTO tbitacora VALUES("48","http://localhost/antonio/vista/intranet.php?vista=seguridad/consultar_bitacora&id=47&o=2","2014-01-31 05:01:00","Ceguera cevera","Ceguera severa","127.0.0.1","Cambios no deseados","Revertir los cambios","descripciondia","tdiagnostico","administrador","editar_diagnostico");
INSERT INTO tbitacora VALUES("49","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-01-31 06:01:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("50","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-01-31 06:01:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("51","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-01-31 06:01:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("52","http://localhost/antonio/vista/intranet.php?vista=archivo/registrar_localidad","2014-01-31 07:01:00","","","127.0.0.1","Cargar datos","Registrar","*","tlocalidad","administrador","registrar_localidad");
INSERT INTO tbitacora VALUES("53","http://localhost/antonio/vista/intranet.php?vista=archivo/consultar_localidad&id=1","2014-01-31 07:01:00","1","3","127.0.0.1","Error en los datos","Modificar","tmunicipio_municipio","tlocalidad","administrador","editar_localidad");
INSERT INTO tbitacora VALUES("54","http://localhost/antonio/vista/intranet.php?vista=archivo/consultar_localidad&id=1","2014-01-31 07:01:00","3","1","127.0.0.1","Error en los datos","Modificar","tmunicipio_municipio","tlocalidad","administrador","editar_localidad");
INSERT INTO tbitacora VALUES("55","http://localhost/antonio/vista/intranet.php?vista=seguridad/consultar_servicio&id=20","2014-01-31 09:01:00","sistema/municipio","archivo/municipio","127.0.0.1","Error en los datos","Modificar","enlaceser","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("56","http://localhost/antonio/vista/intranet.php?vista=seguridad/consultar_servicio&id=21","2014-01-31 09:01:00","sistema/registrar_municipio","archivo/registrar_municipio","127.0.0.1","Error en los datos","Modificar","enlaceser","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("57","http://localhost/antonio/vista/intranet.php?vista=seguridad/consultar_servicio&id=22","2014-01-31 09:01:00","sistema/consultar_municipio","archivo/consultar_municipio","127.0.0.1","Error en los datos","Modificar","enlaceser","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("58","http://localhost/Antonio/vista/intranet.php?vista=sistema/configurar","2014-02-01 12:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tsistema","administrador","registrar_configuracion");
INSERT INTO tbitacora VALUES("59","http://localhost/Antonio/vista/intranet.php?vista=sistema/configurar","2014-02-01 12:02:00","Bienvenidos","Bienvenidos al sistema","127.0.0.1","Error en los datos","Modificar","introducion","tsistema","administrador","editar_configuracion");
INSERT INTO tbitacora VALUES("60","http://localhost/Antonio/vista/intranet.php?vista=sistema/configurar","2014-02-01 12:02:00","3","1234567","127.0.0.1","Error en los datos","Modificar","clavepredeterminada","tsistema","administrador","editar_configuracion");
INSERT INTO tbitacora VALUES("61","http://localhost/Antonio/vista/intranet.php?vista=sistema/configurar","2014-02-01 12:02:00","1","2","127.0.0.1","Error en los datos","Modificar","nrointentos","tsistema","administrador","editar_configuracion");
INSERT INTO tbitacora VALUES("62","http://localhost/Antonio/vista/intranet.php?vista=sistema/configurar","2014-02-01 12:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tsistema","administrador","registrar_configuracion");
INSERT INTO tbitacora VALUES("63","http://localhost/Antonio/vista/intranet.php?vista=sistema/configurar","2014-02-01 12:02:00","Araure","Acarigua","127.0.0.1","Error en los datos","Modificar","direccion","tsistema","administrador","editar_configuracion");
INSERT INTO tbitacora VALUES("64","http://localhost/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-01 01:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("65","http://localhost/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-01 01:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("66","http://localhost/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-01 01:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("67","http://localhost/Antonio/vista/intranet.php?vista=archivo/registrar_grupo","2014-02-01 01:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tgrupo","administrador","registrar_grupo");
INSERT INTO tbitacora VALUES("68","http://localhost/Antonio/vista/intranet.php?vista=archivo/registrar_grupo&id=1","2014-02-01 01:02:00","18","12","127.0.0.1","Error en los datos","Modificar","edadmin","tgrupo","administrador","editar_grupo");
INSERT INTO tbitacora VALUES("69","http://localhost/Antonio/vista/intranet.php?vista=archivo/registrar_grupo&id=1","2014-02-01 01:02:00","25","18","127.0.0.1","Error en los datos","Modificar","edadmax","tgrupo","administrador","editar_grupo");
INSERT INTO tbitacora VALUES("70","http://localhost/proyecto_caidv/vista/intranet.php?vista=archivo/registrar_grupo&id=1","2014-02-01 05:02:00","18","17","127.0.0.1","Error en los datos","Modificar","edadmax","tgrupo","administrador","editar_grupo");
INSERT INTO tbitacora VALUES("71","http://localhost/proyecto_caidv/vista/intranet.php?vista=seguridad/consultar_bitacora&id=70&o=2","2014-02-01 05:02:00","17","18","127.0.0.1","Cambios no deseados","Revertir los cambios","edadmax","tgrupo","administrador","editar_grupo");
INSERT INTO tbitacora VALUES("72","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-06 03:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("73","http://localhost/Antonio/vista/intranet.php?vista=archivo/registrar_docente","2014-02-06 04:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tdocente","administrador","registrar_docente");
INSERT INTO tbitacora VALUES("74","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-06 06:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("75","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-06 06:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("76","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-06 06:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("77","http://localhost/antonio/vista/intranet.php?vista=archivo/registrar_institucion","2014-02-06 06:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tinstitucion","administrador","registrar_institucion");
INSERT INTO tbitacora VALUES("78","http://localhost/antonio/vista/intranet.php?vista=persona/registrar_participante","2014-02-06 06:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tparticipante","administrador","registrar_participante");
INSERT INTO tbitacora VALUES("79","http://localhost/antonio/vista/intranet.php?vista=seguridad/consultar_servicio&id=36","2014-02-06 06:02:00","archivo/registrar_docente","persona/registrar_docente","127.0.0.1","Error en los datos","Modificar","enlaceser","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("80","http://localhost/antonio/vista/intranet.php?vista=seguridad/consultar_servicio&id=36","2014-02-06 06:02:00","3","4","127.0.0.1","Error en los datos","Modificar","idmodulo","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("81","http://localhost/antonio/vista/intranet.php?vista=seguridad/consultar_servicio&id=37","2014-02-06 06:02:00","archivo/registrar_docente","persona/registrar_docente","127.0.0.1","Error en los datos","Modificar","enlaceser","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("82","http://localhost/antonio/vista/intranet.php?vista=seguridad/consultar_servicio&id=37","2014-02-06 06:02:00","3","4","127.0.0.1","Error en los datos","Modificar","idmodulo","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("83","http://localhost/antonio/vista/intranet.php?vista=seguridad/consultar_servicio&id=38","2014-02-06 06:02:00","archivo/docente","persona/docente","127.0.0.1","Error en los datos","Modificar","enlaceser","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("84","http://localhost/antonio/vista/intranet.php?vista=seguridad/consultar_servicio&id=38","2014-02-06 06:02:00","3","4","127.0.0.1","Error en los datos","Modificar","idmodulo","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("85","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-06 06:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("86","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-06 06:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("87","http://localhost/antonio/vista/intranet.php?vista=seguridad/consultar_servicio&id=37","2014-02-06 06:02:00","persona/registrar_docente","persona/consultar_docente","127.0.0.1","Error en los datos","Modificar","enlaceser","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("88","http://localhost/antonio/vista/intranet.php?vista=persona/registrar_participante&id=2","2014-02-06 06:02:00","07-10-2013","02-02-2010","127.0.0.1","Error en los datos","Modificar","fechanacimientopar","tparticipante","administrador","editar_participante");
INSERT INTO tbitacora VALUES("89","http://localhost/antonio/vista/intranet.php?vista=persona/registrar_participante&id=2","2014-02-06 06:02:00","0","2","127.0.0.1","Error en los datos","Modificar","numhijopar","tparticipante","administrador","editar_participante");
INSERT INTO tbitacora VALUES("90","http://localhost/antonio/vista/intranet.php?vista=persona/registrar_participante&id=2","2014-02-06 06:02:00","sdafafwaef","Urbano","127.0.0.1","Error en los datos","Modificar","medioviviendapar","tparticipante","administrador","editar_participante");
INSERT INTO tbitacora VALUES("91","http://localhost/antonio/vista/intranet.php?vista=persona/registrar_participante&id=2","2014-02-06 06:02:00","sdafafwaefwaef","Invadida","127.0.0.1","Error en los datos","Modificar","viviendapar","tparticipante","administrador","editar_participante");
INSERT INTO tbitacora VALUES("92","http://localhost/antonio/vista/intranet.php?vista=persona/registrar_participante&id=2","2014-02-06 06:02:00","sdafafwaefwaef","INREVI","127.0.0.1","Error en los datos","Modificar","tipoconstruccionpar","tparticipante","administrador","editar_participante");
INSERT INTO tbitacora VALUES("93","http://localhost/antonio/vista/intranet.php?vista=persona/registrar_participante&id=2","2014-02-06 06:02:00","s","1","127.0.0.1","Error en los datos","Modificar","braillepar","tparticipante","administrador","editar_participante");
INSERT INTO tbitacora VALUES("94","http://localhost/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-07 10:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("95","http://localhost/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-07 10:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("96","http://localhost/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-08 12:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("97","http://localhost/Antonio/vista/intranet.php?vista=curso/registrar_lapso","2014-02-08 12:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tlapso","administrador","registrar_lapso");
INSERT INTO tbitacora VALUES("98","http://localhost/Antonio/vista/intranet.php?vista=archivo/registrar_grupo","2014-02-08 12:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tgrupo","administrador","registrar_grupo");
INSERT INTO tbitacora VALUES("99","http://localhost/Antonio/vista/intranet.php?vista=curso/registrar_curso","2014-02-08 01:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso","administrador","registrar_curso");
INSERT INTO tbitacora VALUES("100","http://localhost/Antonio/vista/intranet.php?vista=curso/registrar_curso","2014-02-08 01:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso","administrador","registrar_curso");
INSERT INTO tbitacora VALUES("101","http://localhost/Antonio/vista/intranet.php?vista=curso/registrar_curso","2014-02-08 01:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso","administrador","registrar_curso");
INSERT INTO tbitacora VALUES("102","http://localhost/Antonio/vista/intranet.php?vista=curso/registrar_curso","2014-02-08 01:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso","administrador","registrar_curso");
INSERT INTO tbitacora VALUES("103","http://localhost/Antonio/vista/intranet.php?vista=curso/registrar_curso","2014-02-08 01:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso","administrador","registrar_curso");
INSERT INTO tbitacora VALUES("104","http://localhost/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-08 02:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("105","http://localhost/Antonio/vista/intranet.php?vista=curso/registrar_curso","2014-02-08 02:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso","administrador","registrar_curso");
INSERT INTO tbitacora VALUES("106","http://localhost/antonio/vista/registrar_familiar.php?f=0","2014-02-08 02:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tfamiliar","administrador","registrar_familiar");
INSERT INTO tbitacora VALUES("107","http://localhost/antonio/vista/intranet.php?vista=seguridad/consultar_servicio&id=17","2014-02-08 03:02:00","Bitacora","Auditoria de sistema","127.0.0.1","Error en los datos","Modificar","nombreser","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("108","http://localhost/antonio/vista/intranet.php?vista=archivo/registrar_localidad","2014-02-08 03:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tlocalidad","administrador","registrar_localidad");
INSERT INTO tbitacora VALUES("109","http://localhost/antonio/vista/intranet.php?vista=archivo/registrar_localidad","2014-02-08 03:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tlocalidad","administrador","registrar_localidad");
INSERT INTO tbitacora VALUES("110","http://localhost/antonio/vista/intranet.php?vista=archivo/registrar_localidad","2014-02-08 03:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tlocalidad","administrador","registrar_localidad");
INSERT INTO tbitacora VALUES("111","http://localhost/antonio/vista/intranet.php?vista=archivo/registrar_localidad","2014-02-08 03:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tlocalidad","administrador","registrar_localidad");
INSERT INTO tbitacora VALUES("112","http://localhost/antonio/vista/intranet.php?vista=archivo/registrar_localidad","2014-02-08 03:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tlocalidad","administrador","registrar_localidad");
INSERT INTO tbitacora VALUES("113","http://localhost/antonio/vista/intranet.php?vista=archivo/registrar_localidad","2014-02-08 03:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tlocalidad","administrador","registrar_localidad");
INSERT INTO tbitacora VALUES("114","http://localhost/antonio/vista/intranet.php?vista=archivo/registrar_localidad","2014-02-08 03:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tlocalidad","administrador","registrar_localidad");
INSERT INTO tbitacora VALUES("115","http://localhost/antonio/vista/intranet.php?vista=archivo/registrar_institucion&id=1","2014-02-08 03:02:00","1","2","127.0.0.1","Error en los datos","Modificar","tlocalidad_idlocalidad","tinstitucion","administrador","editar_institucion");
INSERT INTO tbitacora VALUES("116","http://localhost/antonio/vista/intranet.php?vista=archivo/registrar_institucion","2014-02-08 03:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tinstitucion","administrador","registrar_institucion");
INSERT INTO tbitacora VALUES("117","http://localhost/antonio/vista/intranet.php?vista=archivo/registrar_institucion&id=2","2014-02-08 03:02:00","Juan Perez","Juan Torrez","127.0.0.1","Error en los datos","Modificar","directorinst","tinstitucion","administrador","editar_institucion");
INSERT INTO tbitacora VALUES("118","http://localhost/antonio/vista/intranet.php?vista=persona/registrar_docente","2014-02-08 03:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tdocente","administrador","registrar_docente");
INSERT INTO tbitacora VALUES("119","http://localhost/antonio/vista/intranet.php?vista=persona/registrar_docente&id=15491963","2014-02-08 03:02:00","0255325235","02553252353","127.0.0.1","Error en los datos","Modificar","telefonodoc","tdocente","administrador","editar_docente");
INSERT INTO tbitacora VALUES("120","http://localhost/antonio/vista/intranet.php?vista=persona/registrar_docente&id=15491963","2014-02-08 03:02:00","AULA","ESPECIALISTA","127.0.0.1","Error en los datos","Modificar","tipodoc","tdocente","administrador","editar_docente");
INSERT INTO tbitacora VALUES("121","http://localhost/antonio/vista/intranet.php?vista=curso/registrar_lapso","2014-02-08 03:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tlapso","administrador","registrar_lapso");
INSERT INTO tbitacora VALUES("122","http://localhost/antonio/vista/intranet.php?vista=curso/registrar_curso","2014-02-08 03:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso","administrador","registrar_curso");
INSERT INTO tbitacora VALUES("123","http://localhost/Antonio/vista/intranet.php?vista=seguridad/consultar_servicio&id=19","2014-02-13 12:02:00","2","1","127.0.0.1","Error en los datos","Modificar","idmodulo","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("124","http://localhost/Antonio/vista/intranet.php?vista=seguridad/consultar_servicio&id=20","2014-02-13 12:02:00","3","2","127.0.0.1","Error en los datos","Modificar","idmodulo","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("125","http://localhost/Antonio/vista/intranet.php?vista=seguridad/consultar_servicio&id=21","2014-02-13 12:02:00","3","2","127.0.0.1","Error en los datos","Modificar","idmodulo","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("126","http://localhost/Antonio/vista/intranet.php?vista=seguridad/consultar_servicio&id=22","2014-02-13 12:02:00","3","2","127.0.0.1","Error en los datos","Modificar","idmodulo","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("127","http://localhost/Antonio/vista/intranet.php?vista=seguridad/consultar_servicio&id=23","2014-02-13 12:02:00","3","2","127.0.0.1","Error en los datos","Modificar","idmodulo","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("128","http://localhost/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-13 05:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("129","http://localhost/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-13 05:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("130","http://localhost/Antonio/vista/intranet.php?vista=persona/registrar_personal","2014-02-13 05:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tpersonal","administrador","registrar_personal");
INSERT INTO tbitacora VALUES("131","http://localhost/Antonio/vista/intranet.php?vista=persona/registrar_personal","2014-02-13 06:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tpersonal","administrador","registrar_personal");
INSERT INTO tbitacora VALUES("132","http://localhost/Antonio/vista/intranet.php?vista=persona/registrar_personal&id=20158248","2014-02-13 06:02:00","petraperez@","petraperez@gmail.com","127.0.0.1","Error en los datos","Modificar","correoper","tpersonal","administrador","editar_personal");
INSERT INTO tbitacora VALUES("133","http://localhost/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-13 06:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","20158248","registrar_servicio");
INSERT INTO tbitacora VALUES("134","http://localhost/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-13 06:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","20158248","registrar_servicio");
INSERT INTO tbitacora VALUES("135","http://localhost/Antonio/vista/intranet.php?vista=persona/registrar_personal","2014-02-13 06:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tpersonal","20158248","registrar_personal");
INSERT INTO tbitacora VALUES("136","http://localhost/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-13 07:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("137","http://localhost/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-13 07:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("138","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-14 02:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("139","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-14 02:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("140","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-14 02:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("141","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-14 02:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("142","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-14 02:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("143","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-14 02:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("144","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-14 02:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("145","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-14 02:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("146","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-14 02:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("147","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-14 02:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("148","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-14 02:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("149","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-14 02:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("150","http://localhost/antonio/vista/intranet.php?vista=archivo/registrar_aula","2014-02-14 02:02:00","","","127.0.0.1","Cargar datos","Registrar","*","taula","administrador","registrar_aula");
INSERT INTO tbitacora VALUES("151","http://localhost/antonio/vista/intranet.php?vista=archivo/registrar_aula&id=0","2014-02-14 02:02:00","asdasd","Laboratorio-1","127.0.0.1","Error en los datos","Modificar","nombreaul","taula","administrador","editar_aula");
INSERT INTO tbitacora VALUES("152","http://localhost/antonio/vista/intranet.php?vista=archivo/registrar_aula&id=0","2014-02-14 02:02:00","asdasd","Laboratorio","127.0.0.1","Error en los datos","Modificar","tipoaul","taula","administrador","editar_aula");
INSERT INTO tbitacora VALUES("153","http://localhost/antonio/vista/intranet.php?vista=archivo/registrar_aula&id=0","2014-02-14 02:02:00","0","10","127.0.0.1","Error en los datos","Modificar","capacidadaul","taula","administrador","editar_aula");
INSERT INTO tbitacora VALUES("154","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-14 03:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("155","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_rol","2014-02-14 03:02:00","","","127.0.0.1","Cargar datos","Registrar","*","trol","administrador","registrar_rol");
INSERT INTO tbitacora VALUES("156","http://localhost/antonio/vista/intranet.php?vista=seguridad/rol","2014-02-14 03:02:00","1","0","127.0.0.1","No sé utiliza","Eliminar","estatusser","trol","administrador","eliminar_rol");
INSERT INTO tbitacora VALUES("157","http://localhost/antonio/vista/intranet.php?vista=seguridad/rol","2014-02-14 03:02:00","0","1","127.0.0.1","No sé utiliza","Restaurar","estatusrol","trol","administrador","restaurar_rol");
INSERT INTO tbitacora VALUES("158","http://localhost/antonio/vista/intranet.php?vista=seguridad/rol","2014-02-14 03:02:00","1","0","127.0.0.1","No sé utiliza","Eliminar","estatusser","trol","administrador","eliminar_rol");
INSERT INTO tbitacora VALUES("159","http://localhost/antonio/vista/intranet.php?vista=seguridad/rol","2014-02-14 03:02:00","0","1","127.0.0.1","No sé utiliza","Restaurar","estatusrol","trol","administrador","restaurar_rol");
INSERT INTO tbitacora VALUES("160","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-14 03:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("161","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-14 03:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("162","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-14 03:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("163","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-14 03:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("164","http://localhost/antonio/vista/intranet.php?vista=archivo/localidad","2014-02-14 03:02:00","1","0","127.0.0.1","No sé utiliza","Eliminar","estatusser","tlocalidad","administrador","eliminar_localidad");
INSERT INTO tbitacora VALUES("165","http://localhost/antonio/vista/intranet.php?vista=archivo/localidad","2014-02-14 03:02:00","0","1","127.0.0.1","No sé utiliza","Restaurar","estatusser","tlocalidad","administrador","restaurar_localidad");
INSERT INTO tbitacora VALUES("166","http://localhost/antonio/vista/intranet.php?vista=archivo/localidad","2014-02-14 03:02:00","0","1","127.0.0.1","No sé utiliza","Restaurar","estatusser","tlocalidad","administrador","restaurar_localidad");
INSERT INTO tbitacora VALUES("167","http://localhost/antonio/vista/intranet.php?vista=archivo/localidad","2014-02-14 03:02:00","1","0","127.0.0.1","No sé utiliza","Eliminar","estatusser","tlocalidad","administrador","eliminar_localidad");
INSERT INTO tbitacora VALUES("168","http://localhost/antonio/vista/intranet.php?vista=archivo/municipio","2014-02-14 03:02:00","0","1","127.0.0.1","No sé utiliza","Restaurar","estatusmun","tmunicipio","administrador","restaurar_municipio");
INSERT INTO tbitacora VALUES("169","http://localhost/antonio/vista/intranet.php?vista=archivo/municipio","2014-02-14 03:02:00","1","0","127.0.0.1","No sé utiliza","Eliminar","estatusmun","tmunicipio","administrador","eliminar_municipio");
INSERT INTO tbitacora VALUES("170","http://localhost/antonio/vista/intranet.php?vista=archivo/registrar_municipio","2014-02-14 03:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tmunicipio","administrador","registrar_municipio");
INSERT INTO tbitacora VALUES("171","http://localhost/antonio/vista/intranet.php?vista=archivo/consultar_municipio&id=4","2014-02-14 03:02:00","asd","Esteller","127.0.0.1","Error en los datos","Modificar","descripcionmun","tmunicipio","administrador","editar_municipio");
INSERT INTO tbitacora VALUES("172","http://localhost/antonio/vista/intranet.php?vista=archivo/municipio","2014-02-14 03:02:00","1","0","127.0.0.1","No sé utiliza","Eliminar","estatusmun","tmunicipio","administrador","eliminar_municipio");
INSERT INTO tbitacora VALUES("173","http://localhost/antonio/vista/intranet.php?vista=archivo/municipio","2014-02-14 03:02:00","0","1","127.0.0.1","No sé utiliza","Restaurar","estatusmun","tmunicipio","administrador","restaurar_municipio");
INSERT INTO tbitacora VALUES("174","http://localhost/antonio/vista/intranet.php?vista=archivo/institucion","2014-02-14 03:02:00","0","1","127.0.0.1","No sé utiliza","Restaurar","estatusinst","tinstitucion","administrador","restaurar_institucion");
INSERT INTO tbitacora VALUES("175","http://localhost/antonio/vista/intranet.php?vista=archivo/diagnostico","2014-02-14 04:02:00","1","0","127.0.0.1","No sé utiliza","Eliminar","estatusdia","tdiagnostico","administrador","eliminar_diagnostico");
INSERT INTO tbitacora VALUES("176","http://localhost/antonio/vista/intranet.php?vista=archivo/diagnostico","2014-02-14 04:02:00","0","1","127.0.0.1","No sé utiliza","Restaurar","estatusdia","tdiagnostico","administrador","restaurar_diagnostico");
INSERT INTO tbitacora VALUES("177","http://localhost/antonio/vista/intranet.php?vista=archivo/diagnostico","2014-02-14 04:02:00","1","0","127.0.0.1","No sé utiliza","Eliminar","estatusdia","tdiagnostico","administrador","eliminar_diagnostico");
INSERT INTO tbitacora VALUES("178","http://localhost/antonio/vista/intranet.php?vista=archivo/diagnostico","2014-02-14 04:02:00","0","1","127.0.0.1","No sé utiliza","Restaurar","estatusdia","tdiagnostico","administrador","restaurar_diagnostico");
INSERT INTO tbitacora VALUES("179","http://localhost/antonio/vista/intranet.php?vista=archivo/registrar_diagnostico","2014-02-14 04:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tdiagnostico","administrador","registrar_diagnostico");
INSERT INTO tbitacora VALUES("180","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-14 04:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("181","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-14 04:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("182","http://localhost/antonio/vista/intranet.php?vista=persona/personal","2014-02-14 04:02:00","1","0","127.0.0.1","No sé utiliza","Eliminar","estatusper","tpersonal","administrador","eliminar_docente");
INSERT INTO tbitacora VALUES("183","http://localhost/antonio/vista/intranet.php?vista=persona/personal","2014-02-14 04:02:00","0","1","127.0.0.1","No sé utiliza","Restaurar","estatusper","tpersonal","administrador","restaurar_personal");
INSERT INTO tbitacora VALUES("184","http://localhost/antonio/vista/intranet.php?vista=persona/registrar_personal&id=21561769","2014-02-14 04:02:00","1","4","127.0.0.1","Error en los datos","Modificar","tdiagnostico_iddiagnostico","tpersonal","administrador","editar_personal");
INSERT INTO tbitacora VALUES("185","http://localhost/antonio/vista/intranet.php?vista=archivo/registrar_area","2014-02-14 04:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tarea_conocimiento","administrador","registrar_area");
INSERT INTO tbitacora VALUES("186","http://localhost/antonio/vista/intranet.php?vista=archivo/area_conocimiento","2014-02-14 04:02:00","1","0","127.0.0.1","No sé utiliza","Eliminar","estatusare","tarea_conocimiento","administrador","eliminar_area");
INSERT INTO tbitacora VALUES("187","http://localhost/antonio/vista/intranet.php?vista=archivo/area_conocimiento","2014-02-14 04:02:00","0","1","127.0.0.1","No sé utiliza","Restaurar","estatusare","tarea_conocimiento","administrador","restaurar_area");
INSERT INTO tbitacora VALUES("188","http://localhost/antonio/vista/intranet.php?vista=archivo/registrar_asignatura","2014-02-14 04:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tasignatura","administrador","registrar_asignatura");
INSERT INTO tbitacora VALUES("189","http://localhost/antonio/vista/intranet.php?vista=archivo/asignatura","2014-02-14 04:02:00","1","0","127.0.0.1","No sé utiliza","Eliminar","estatusasi","tasignatura","administrador","eliminar_asignatura");
INSERT INTO tbitacora VALUES("190","http://localhost/antonio/vista/intranet.php?vista=archivo/asignatura","2014-02-14 04:02:00","0","1","127.0.0.1","No sé utiliza","Restaurar","estatusasi","tasignatura","administrador","restaurar_asignatura");
INSERT INTO tbitacora VALUES("191","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-14 05:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("192","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-14 05:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("193","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-02-14 05:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("194","http://localhost/antonio/vista/intranet.php?vista=archivo/parentesco","2014-02-14 05:02:00","1","0","127.0.0.1","No sé utiliza","Eliminar","estatuspar","tparentesco","administrador","eliminar_parentesco");
INSERT INTO tbitacora VALUES("195","http://localhost/antonio/vista/intranet.php?vista=archivo/parentesco","2014-02-14 05:02:00","0","1","127.0.0.1","No sé utiliza","Restaurar","estatuspar","tparentesco","administrador","restaurar_parentesco");
INSERT INTO tbitacora VALUES("196","http://localhost/antonio/vista/intranet.php?vista=archivo/grupo","2014-02-14 05:02:00","1","0","127.0.0.1","No sé utiliza","Eliminar","estatusgru","tgrupo","administrador","eliminar_grupo");
INSERT INTO tbitacora VALUES("197","http://localhost/antonio/vista/intranet.php?vista=archivo/grupo","2014-02-14 05:02:00","0","1","127.0.0.1","No sé utiliza","Restaurar","estatusgru","tgrupo","administrador","restaurar_grupo");
INSERT INTO tbitacora VALUES("198","http://localhost/antonio/vista/intranet.php?vista=seguridad/consultar_servicio&id=33","2014-02-14 06:02:00","archivo/registrar_grupo","archivo/consultar_grupo","127.0.0.1","Error en los datos","Modificar","enlaceser","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("199","http://localhost/antonio/vista/intranet.php?vista=persona/registrar_personal","2014-02-18 01:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tpersonal","administrador","registrar_personal");
INSERT INTO tbitacora VALUES("200","http://localhost/antonio/vista/intranet.php?vista=persona/registrar_personal","2014-02-18 01:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tpersonal","administrador","registrar_personal");
INSERT INTO tbitacora VALUES("201","http://localhost/antonio/vista/intranet.php?vista=archivo/parentesco","2014-02-18 01:02:00","1","0","127.0.0.1","No sé utiliza","Eliminar","estatuspar","tparentesco","administrador","eliminar_parentesco");
INSERT INTO tbitacora VALUES("202","http://localhost/antonio/vista/intranet.php?vista=archivo/parentesco","2014-02-18 01:02:00","0","1","127.0.0.1","No sé utiliza","Restaurar","estatuspar","tparentesco","administrador","restaurar_parentesco");
INSERT INTO tbitacora VALUES("203","http://localhost/antonio/vista/intranet.php?vista=archivo/institucion","2014-02-18 01:02:00","1","0","127.0.0.1","No sé utiliza","Eliminar","estatusinst","tinstitucion","administrador","eliminar_institucion");
INSERT INTO tbitacora VALUES("204","http://localhost/antonio/vista/intranet.php?vista=archivo/institucion","2014-02-18 01:02:00","0","1","127.0.0.1","No sé utiliza","Restaurar","estatusinst","tinstitucion","administrador","restaurar_institucion");
INSERT INTO tbitacora VALUES("205","http://localhost/antonio/vista/intranet.php?vista=archivo/grupo","2014-02-18 01:02:00","1","0","127.0.0.1","No sé utiliza","Eliminar","estatusgru","tgrupo","administrador","eliminar_grupo");
INSERT INTO tbitacora VALUES("206","http://localhost/antonio/vista/intranet.php?vista=archivo/grupo","2014-02-18 01:02:00","0","1","127.0.0.1","No sé utiliza","Restaurar","estatusgru","tgrupo","administrador","restaurar_grupo");
INSERT INTO tbitacora VALUES("207","http://localhost/antonio/vista/intranet.php?vista=archivo/aula","2014-02-18 02:02:00","0","1","127.0.0.1","No sé utiliza","Restaurar","estatusaul","taula","administrador","restaurar_aula");
INSERT INTO tbitacora VALUES("208","http://localhost/antonio/vista/intranet.php?vista=archivo/area_conocimiento","2014-02-18 02:02:00","1","0","127.0.0.1","No sé utiliza","Eliminar","estatusare","tarea_conocimiento","administrador","eliminar_area");
INSERT INTO tbitacora VALUES("209","http://localhost/antonio/vista/intranet.php?vista=archivo/area_conocimiento","2014-02-18 02:02:00","0","1","127.0.0.1","No sé utiliza","Restaurar","estatusare","tarea_conocimiento","administrador","restaurar_area");
INSERT INTO tbitacora VALUES("210","http://localhost/antonio/vista/intranet.php?vista=archivo/asignatura","2014-02-18 02:02:00","1","0","127.0.0.1","No sé utiliza","Eliminar","estatusasi","tasignatura","administrador","eliminar_asignatura");
INSERT INTO tbitacora VALUES("211","http://localhost/antonio/vista/intranet.php?vista=archivo/asignatura","2014-02-18 02:02:00","0","1","127.0.0.1","No sé utiliza","Restaurar","estatusasi","tasignatura","administrador","restaurar_asignatura");
INSERT INTO tbitacora VALUES("212","http://localhost/antonio/vista/intranet.php?vista=persona/registrar_personal","2014-02-18 02:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tpersonal","administrador","registrar_personal");
INSERT INTO tbitacora VALUES("213","http://localhost/antonio/vista/intranet.php?vista=archivo/localidad","2014-02-23 09:02:00","0","1","127.0.0.1","No sé utiliza","Restaurar","estatusloc","tlocalidad","administrador","restaurar_localidad");
INSERT INTO tbitacora VALUES("214","http://localhost/antonio/vista/intranet.php?vista=archivo/localidad","2014-02-23 09:02:00","1","0","127.0.0.1","No sé utiliza","Eliminar","estatusloc","tlocalidad","administrador","eliminar_localidad");
INSERT INTO tbitacora VALUES("215","http://localhost/antonio/vista/intranet.php?vista=archivo/registrar_parentesco","2014-02-27 05:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tparentesco","administrador","registrar_parentesco");
INSERT INTO tbitacora VALUES("216","http://localhost/antonio/vista/intranet.php?vista=archivo/registrar_parentesco","2014-02-27 05:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tparentesco","administrador","registrar_parentesco");
INSERT INTO tbitacora VALUES("217","http://localhost/antonio/vista/intranet.php?vista=archivo/registrar_parentesco","2014-02-27 05:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tparentesco","administrador","registrar_parentesco");
INSERT INTO tbitacora VALUES("218","http://localhost/antonio/vista/intranet.php?vista=archivo/registrar_grupo","2014-02-27 06:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tgrupo","administrador","registrar_grupo");
INSERT INTO tbitacora VALUES("219","http://localhost/antonio/vista/intranet.php?vista=archivo/consultar_grupo&id=3","2014-02-27 06:02:00","Adultos","Grupo Adulto","127.0.0.1","Error en los datos","Modificar","nombregru","tgrupo","administrador","editar_grupo");
INSERT INTO tbitacora VALUES("220","http://localhost/antonio/vista/intranet.php?vista=archivo/registrar_aula","2014-02-27 06:02:00","","","127.0.0.1","Cargar datos","Registrar","*","taula","administrador","registrar_aula");
INSERT INTO tbitacora VALUES("221","http://localhost/antonio/vista/intranet.php?vista=archivo/registrar_asignatura","2014-02-27 06:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tasignatura","administrador","registrar_asignatura");
INSERT INTO tbitacora VALUES("222","http://localhost/antonio/vista/intranet.php?vista=archivo/registrar_area","2014-02-27 06:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tarea_conocimiento","administrador","registrar_area");
INSERT INTO tbitacora VALUES("223","http://localhost/antonio/vista/intranet.php?vista=archivo/consultar_area&id=2","2014-02-27 06:02:00","Sistema","Informática","127.0.0.1","Error en los datos","Modificar","nombreare","tarea_conocimiento","administrador","editar_area");
INSERT INTO tbitacora VALUES("224","http://localhost/antonio/vista/intranet.php?vista=archivo/consultar_area&id=2","2014-02-27 06:02:00","INFORMáTICA","INFORMATICA","127.0.0.1","Error en los datos","Modificar","nombreare","tarea_conocimiento","administrador","editar_area");
INSERT INTO tbitacora VALUES("225","http://localhost/antonio/vista/intranet.php?vista=archivo/consultar_diagnostico&id=4","2014-02-27 06:02:00","Sano","Sanos","127.0.0.1","Error en los datos","Modificar","descripciondia","tdiagnostico","administrador","editar_diagnostico");
INSERT INTO tbitacora VALUES("226","http://localhost/antonio/vista/intranet.php?vista=archivo/consultar_diagnostico&id=4","2014-02-27 06:02:00","Sanos","Sano","127.0.0.1","Error en los datos","Modificar","descripciondia","tdiagnostico","administrador","editar_diagnostico");
INSERT INTO tbitacora VALUES("227","http://localhost/antonio/vista/intranet.php?vista=persona/registrar_docente","2014-02-27 06:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tdocente","administrador","registrar_docente");
INSERT INTO tbitacora VALUES("228","http://localhost/antonio/vista/intranet.php?vista=persona/registrar_personal","2014-02-27 06:02:00","","","127.0.0.1","Cargar datos","Registrar","*","tpersonal","administrador","registrar_personal");
INSERT INTO tbitacora VALUES("229","http://localhost/antonio/vista/intranet.php?vista=sistema/configurar","2014-03-01 04:03:00","","210","127.0.0.1","Error en los datos","Modificar","tiempolapso","tsistema","administrador","editar_configuracion");
INSERT INTO tbitacora VALUES("230","http://localhost/antonio/vista/registrar_familiar.php?f=0","2014-03-06 12:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tfamiliar","administrador","registrar_familiar");
INSERT INTO tbitacora VALUES("231","http://localhost/antonio/vista/registrar_familiar.php?f=0","2014-03-06 12:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tfamiliar","administrador","registrar_familiar");
INSERT INTO tbitacora VALUES("232","http://localhost/antonio/vista/registrar_familiar.php?f=0","2014-03-06 01:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tfamiliar","administrador","registrar_familiar");
INSERT INTO tbitacora VALUES("233","http://localhost/antonio/vista/registrar_familiar.php?f=0","2014-03-06 01:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tfamiliar","administrador","registrar_familiar");
INSERT INTO tbitacora VALUES("234","http://localhost/antonio/vista/intranet.php?vista=persona/registrar_participante","2014-03-06 03:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tinscripcion","administrador","registrar_inscripcion");
INSERT INTO tbitacora VALUES("235","http://localhost/antonio/vista/registrar_familiar.php?f=0","2014-03-06 03:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tfamiliar","administrador","registrar_familiar");
INSERT INTO tbitacora VALUES("236","http://localhost/antonio/vista/intranet.php?vista=persona/registrar_participante","2014-03-06 03:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tinscripcion","administrador","registrar_inscripcion");
INSERT INTO tbitacora VALUES("237","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-03-06 04:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("238","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-03-06 04:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("239","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-03-06 04:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("240","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-03-06 04:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("241","http://localhost/antonio/vista/intranet.php?vista=seguridad/consultar_servicio&id=77","2014-03-06 04:03:00","sistema/noticias","sistema/noticia","127.0.0.1","Error en los datos","Modificar","enlaceser","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("242","http://localhost/antonio/vista/intranet.php?vista=sistema/registrar_noticia","2014-03-06 04:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tnoticia","administrador","registrar_noticia");
INSERT INTO tbitacora VALUES("243","http://localhost/antonio/vista/intranet.php?vista=sistema/consultar_noticia&id=1","2014-03-06 04:03:00","¡CORRUPTO Y DELINCUENTE! ACTU","¡CORRUPTO Y DELINCUENTE! ACTU","127.0.0.1","Error en los datos","Modificar","titulonot","tnoticia","administrador","editar_noticia");
INSERT INTO tbitacora VALUES("244","http://localhost/antonio/vista/intranet.php?vista=sistema/consultar_noticia&id=1","2014-03-06 04:03:00","¡CORRUPTO Y DELINCUENTE! ACTU","¡CORRUPTO Y DELINCUENTE! ACTU","127.0.0.1","Error en los datos","Modificar","titulonot","tnoticia","administrador","editar_noticia");
INSERT INTO tbitacora VALUES("245","http://localhost/antonio/vista/intranet.php?vista=sistema/consultar_noticia&id=1","2014-03-06 04:03:00","¡CORRUPTO Y DELINCUENTE! ACTU","¡CORRUPTO Y DELINCUENTE! ACTU","127.0.0.1","Error en los datos","Modificar","titulonot","tnoticia","administrador","editar_noticia");
INSERT INTO tbitacora VALUES("246","http://localhost/antonio/vista/intranet.php?vista=seguridad/servicio","2014-03-06 05:03:00","1","0","127.0.0.1","No sé utiliza","Eliminar","estatusser","tservicio","administrador","eliminar_servicio");
INSERT INTO tbitacora VALUES("247","http://localhost/antonio/vista/intranet.php?vista=seguridad/servicio","2014-03-06 05:03:00","0","1","127.0.0.1","No sé utiliza","Restaurar","estatusser","tservicio","administrador","restaurar_servicio");
INSERT INTO tbitacora VALUES("248","http://localhost/antonio/vista/intranet.php?vista=seguridad/rol","2014-03-06 05:03:00","1","0","127.0.0.1","No sé utiliza","Eliminar","estatusser","trol","administrador","eliminar_rol");
INSERT INTO tbitacora VALUES("249","http://localhost/antonio/vista/intranet.php?vista=seguridad/rol","2014-03-06 05:03:00","0","1","127.0.0.1","No sé utiliza","Restaurar","estatusrol","trol","administrador","restaurar_rol");
INSERT INTO tbitacora VALUES("250","http://localhost/antonio/vista/intranet.php?vista=seguridad/modulo","2014-03-06 05:03:00","0","1","127.0.0.1","Necesario","Restaurar","estatusmod","tmodulo","administrador","restaurar_modulo");
INSERT INTO tbitacora VALUES("251","http://localhost/antonio/vista/intranet.php?vista=seguridad/modulo","2014-03-06 05:03:00","1","0","127.0.0.1","No sé utiliza","Eliminar","estatusmod","tmodulo","administrador","eliminar_modulo");
INSERT INTO tbitacora VALUES("252","http://localhost/antonio/vista/intranet.php?vista=sistema/noticia","2014-03-06 05:03:00","1","0","127.0.0.1","No sé utiliza","Eliminar","estatusinst","tnoticia","administrador","eliminar_noticia");
INSERT INTO tbitacora VALUES("253","http://localhost/antonio/vista/intranet.php?vista=sistema/noticia","2014-03-06 05:03:00","0","1","127.0.0.1","No sé utiliza","Restaurar","estatusinst","tnoticia","administrador","restaurar_noticia");
INSERT INTO tbitacora VALUES("254","http://localhost/antonio/vista/intranet.php?vista=archivo/consultar_municipio&id=1","2014-03-07 02:03:00","PáEZ","PÁEZ","127.0.0.1","Error en los datos","Modificar","descripcionmun","tmunicipio","administrador","editar_municipio");
INSERT INTO tbitacora VALUES("255","http://localhost/antonio/vista/intranet.php?vista=persona/registrar_participante","2014-03-07 06:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tinscripcion","administrador","registrar_inscripcion");
INSERT INTO tbitacora VALUES("256","http://localhost/antonio/vista/registrar_familiar.php?f=0","2014-03-07 06:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tfamiliar","administrador","registrar_familiar");
INSERT INTO tbitacora VALUES("257","http://localhost/antonio/vista/intranet.php?vista=persona/registrar_participante","2014-03-07 06:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tinscripcion","administrador","registrar_inscripcion");
INSERT INTO tbitacora VALUES("258","http://localhost/antonio/vista/intranet.php?vista=persona/registrar_participante","2014-03-07 06:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tinscripcion","administrador","registrar_inscripcion");
INSERT INTO tbitacora VALUES("259","http://localhost/antonio/vista/intranet.php?vista=persona/registrar_participante","2014-03-07 06:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tinscripcion","administrador","registrar_inscripcion");
INSERT INTO tbitacora VALUES("260","http://localhost/antonio/vista/intranet.php?vista=seguridad/modulo","2014-03-07 06:03:00","0","1","127.0.0.1","Necesario","Restaurar","estatusmod","tmodulo","administrador","restaurar_modulo");
INSERT INTO tbitacora VALUES("261","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-03-07 06:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("262","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-03-07 06:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("263","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-03-07 06:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("264","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-03-07 06:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("265","http://localhost/antonio/vista/intranet.php?vista=sistema/registrar_slider","2014-03-07 07:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tslider","administrador","registrar_slider");
INSERT INTO tbitacora VALUES("266","http://localhost/antonio/vista/intranet.php?vista=sistema/registrar_slider","2014-03-07 07:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tslider","administrador","registrar_slider");
INSERT INTO tbitacora VALUES("267","http://localhost/antonio/vista/intranet.php?vista=sistema/consultar_slider&id=2","2014-03-07 07:03:00","MANUALIDADES","Trabajo Manual","127.0.0.1","Error en los datos","Modificar","titulosli","tslider","administrador","editar_slider");
INSERT INTO tbitacora VALUES("268","http://localhost/antonio/vista/intranet.php?vista=sistema/slider","2014-03-07 07:03:00","1","0","127.0.0.1","No sé utiliza","Eliminar","estatusinst","tslider","administrador","eliminar_slider");
INSERT INTO tbitacora VALUES("269","http://localhost/antonio/vista/intranet.php?vista=sistema/slider","2014-03-07 07:03:00","0","1","127.0.0.1","No sé utiliza","Restaurar","estatusinst","tslider","administrador","restaurar_slider");
INSERT INTO tbitacora VALUES("270","http://localhost/antonio/vista/registrar_familiar.php?f=2","2014-03-07 07:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tfamiliar","administrador","registrar_familiar");
INSERT INTO tbitacora VALUES("271","http://localhost/antonio/vista/registrar_familiar.php?f=0","2014-03-07 07:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tfamiliar","administrador","registrar_familiar");
INSERT INTO tbitacora VALUES("272","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_modulo","2014-03-14 04:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tmodulo","administrador","registrar_modulo");
INSERT INTO tbitacora VALUES("273","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-03-14 04:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("274","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-03-14 04:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("275","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-03-14 04:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("276","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-03-14 04:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("277","http://localhost/antonio/vista/intranet.php?vista=archivo/consultar_grupo&id=2","2014-03-14 04:03:00","6","4","127.0.0.1","Error en los datos","Modificar","edadmin","tgrupo","administrador","editar_grupo");
INSERT INTO tbitacora VALUES("278","http://localhost/antonio/vista/intranet.php?vista=archivo/registrar_grupo","2014-03-14 05:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tgrupo","administrador","registrar_grupo");
INSERT INTO tbitacora VALUES("279","http://localhost/antonio/vista/intranet.php?vista=archivo/consultar_grupo&id=3","2014-03-14 05:03:00","18","20","127.0.0.1","Error en los datos","Modificar","edadmin","tgrupo","administrador","editar_grupo");
INSERT INTO tbitacora VALUES("280","http://localhost/antonio/vista/intranet.php?vista=archivo/consultar_grupo&id=3","2014-03-14 05:03:00","45","50","127.0.0.1","Error en los datos","Modificar","edadmax","tgrupo","administrador","editar_grupo");
INSERT INTO tbitacora VALUES("281","http://localhost/antonio/vista/intranet.php?vista=archivo/consultar_grupo&id=1","2014-03-14 05:03:00","18","19","127.0.0.1","Error en los datos","Modificar","edadmax","tgrupo","administrador","editar_grupo");
INSERT INTO tbitacora VALUES("282","http://localhost/antonio/vista/intranet.php?vista=archivo/consultar_grupo&id=2","2014-03-14 05:03:00","9","11","127.0.0.1","Error en los datos","Modificar","edadmax","tgrupo","administrador","editar_grupo");
INSERT INTO tbitacora VALUES("283","http://localhost/antonio/vista/intranet.php?vista=curso/registrar_curso","2014-03-14 06:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso","administrador","registrar_curso");
INSERT INTO tbitacora VALUES("284","http://localhost/antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=22","2014-03-14 06:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso_tparticipante","administrador","inscribir_curso");
INSERT INTO tbitacora VALUES("285","http://localhost/antonio/vista/registrar_familiar.php?f=0","2014-03-15 06:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tfamiliar","administrador","registrar_familiar");
INSERT INTO tbitacora VALUES("286","http://localhost/antonio/vista/registrar_familiar.php?f=0","2014-03-18 01:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tfamiliar","administrador","registrar_familiar");
INSERT INTO tbitacora VALUES("287","http://localhost/antonio/vista/intranet.php?vista=persona/registrar_participante","2014-03-18 01:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tinscripcion","administrador","registrar_inscripcion");
INSERT INTO tbitacora VALUES("288","http://localhost/antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=22","2014-03-18 02:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso_tparticipante","administrador","inscribir_curso");
INSERT INTO tbitacora VALUES("289","http://localhost/Antonio/vista/intranet.php?vista=curso/registrar_curso","2014-03-21 05:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso","administrador","registrar_curso");
INSERT INTO tbitacora VALUES("290","http://localhost/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-03-21 06:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("291","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-03-21 08:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("292","http://localhost/antonio/vista/intranet.php?vista=archivo/registrar_asignatura","2014-03-22 02:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tasignatura","administrador","registrar_asignatura");
INSERT INTO tbitacora VALUES("293","http://localhost/antonio/vista/intranet.php?vista=archivo/registrar_asignatura&id=1","2014-03-22 02:03:00","","4","127.0.0.1","Error en los datos","Modificar","horasteoricas","tasignatura","administrador","editar_asignatura");
INSERT INTO tbitacora VALUES("294","http://localhost/antonio/vista/intranet.php?vista=archivo/registrar_asignatura&id=2","2014-03-22 02:03:00","","6","127.0.0.1","Error en los datos","Modificar","horasteoricas","tasignatura","administrador","editar_asignatura");
INSERT INTO tbitacora VALUES("295","http://localhost/antonio/vista/intranet.php?vista=archivo/registrar_asignatura&id=2","2014-03-22 02:03:00","","2","127.0.0.1","Error en los datos","Modificar","horaspracticas","tasignatura","administrador","editar_asignatura");
INSERT INTO tbitacora VALUES("296","http://localhost/antonio/vista/intranet.php?vista=curso/registrar_curso","2014-03-22 03:03:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso","administrador","registrar_curso");
INSERT INTO tbitacora VALUES("297","http://localhost/antonio/vista/intranet.php?vista=curso/registrar_curso","2014-04-01 02:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso","administrador","registrar_curso");
INSERT INTO tbitacora VALUES("298","http://localhost/antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=3","2014-04-01 02:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso_tparticipante","administrador","inscribir_curso");
INSERT INTO tbitacora VALUES("299","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 06:04:00","","JORGE","127.0.0.1","Error en los datos","Modificar","nombreunopar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("300","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 06:04:00","","JORGE","127.0.0.1","Error en los datos","Modificar","nombreunopar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("301","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 06:04:00","","JORGE","127.0.0.1","Error en los datos","Modificar","nombreunopar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("302","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 06:04:00","","JORGE","127.0.0.1","Error en los datos","Modificar","nombreunopar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("303","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 06:04:00","","JORGE","127.0.0.1","Error en los datos","Modificar","nombreunopar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("304","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 06:04:00","","JORGE","127.0.0.1","Error en los datos","Modificar","nombreunopar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("305","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 06:04:00","","JORGE","127.0.0.1","Error en los datos","Modificar","nombreunopar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("306","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 06:04:00","","jorge","127.0.0.1","Error en los datos","Modificar","nombreunopar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("307","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 06:04:00","","Jorge","127.0.0.1","Error en los datos","Modificar","nombreunopar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("308","http://localhost/antonio/vista/registrar_familiar.php?f=2","2014-04-02 06:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tfamiliar","administrador","registrar_familiar");
INSERT INTO tbitacora VALUES("309","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-04-02 06:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("310","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-04-02 06:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("311","http://localhost/antonio/vista/intranet.php?vista=persona/participante","2014-04-02 07:04:00","1","0","127.0.0.1","No sé utiliza","Eliminar","estatus","participante_familiar","administrador","eliminar_participante");
INSERT INTO tbitacora VALUES("312","http://localhost/antonio/vista/intranet.php?vista=persona/participante","2014-04-02 07:04:00","1","0","127.0.0.1","No sé utiliza","Eliminar","estatuspar","tparticipante","administrador","eliminar_participante");
INSERT INTO tbitacora VALUES("313","http://localhost/antonio/vista/intranet.php?vista=persona/participante","2014-04-02 07:04:00","1","0","127.0.0.1","No sé utiliza","Eliminar","estatusins","tinscripcion","administrador","eliminar_participante");
INSERT INTO tbitacora VALUES("314","http://localhost/antonio/vista/intranet.php?vista=persona/participante","2014-04-02 07:04:00","1","0","127.0.0.1","No sé utiliza","Restaurar","estatus","participante_familiar","administrador","restaurar_participante");
INSERT INTO tbitacora VALUES("315","http://localhost/antonio/vista/intranet.php?vista=persona/participante","2014-04-02 07:04:00","1","0","127.0.0.1","No sé utiliza","Restaurar","estatuspar","tparticipante","administrador","restaurar_participante");
INSERT INTO tbitacora VALUES("316","http://localhost/antonio/vista/intranet.php?vista=persona/participante","2014-04-02 07:04:00","1","0","127.0.0.1","No sé utiliza","Restaurar","estatusins","tinscripcion","administrador","restaurar_participante");
INSERT INTO tbitacora VALUES("317","http://localhost/antonio/vista/intranet.php?vista=persona/participante","2014-04-02 07:04:00","1","0","127.0.0.1","No sé utiliza","Eliminar","estatus","participante_familiar","administrador","eliminar_participante");
INSERT INTO tbitacora VALUES("318","http://localhost/antonio/vista/intranet.php?vista=persona/participante","2014-04-02 07:04:00","1","0","127.0.0.1","No sé utiliza","Eliminar","estatuspar","tparticipante","administrador","eliminar_participante");
INSERT INTO tbitacora VALUES("319","http://localhost/antonio/vista/intranet.php?vista=persona/participante","2014-04-02 07:04:00","1","0","127.0.0.1","No sé utiliza","Eliminar","estatusins","tinscripcion","administrador","eliminar_participante");
INSERT INTO tbitacora VALUES("320","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","","MENDEZ","127.0.0.1","Error en los datos","Modificar","apellidodospar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("321","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","INAVI","INREVI","127.0.0.1","Error en los datos","Modificar","tipoconstruccionpar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("322","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","Lu,Ma,Mi,Ju","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("323","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00"," ","  ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("324","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00"," ","  Problemas de transporte","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("325","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00"," ","  ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("326","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","Lu,Ma,Mi,Ju","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("327","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00"," ","  ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("328","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00"," ","  ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("329","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00"," ","  ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("330","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","Lu,Ma,Mi,Ju","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("331","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00"," ","  ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("332","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00"," ","  ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("333","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00"," ","  ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("334","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","Lu,Ma,Mi,Ju","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("335","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00"," ","  ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("336","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00"," ","  ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("337","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00"," ","  ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("338","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","Lu,Ma,Mi,Ju","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("339","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00"," ","  ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("340","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00"," ","  ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("341","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00"," ","  ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("342","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","TARDE","Mañana","127.0.0.1","Error en los datos","Modificar","disponibilidadins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("343","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","Lu,Ma,Mi,Vi","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("344","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","  ","   ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("345","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","  ","   Problemas de transporte","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("346","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","  ","   ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("347","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","MAñANA","MAÑANA","127.0.0.1","Error en los datos","Modificar","disponibilidadins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("348","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","Lu,Ma,Mi,Vi","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("349","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","   ","    ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("350","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","   PROBLEMAS DE TRANSPORTE","   PROBLEMAS DE TRANSPORTE ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("351","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","   ","    ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("352","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","MAÑANA","TARDE","127.0.0.1","Error en los datos","Modificar","disponibilidadins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("353","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","Lu,Ma,Mi,Vi","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("354","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","    ","     ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("355","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","   PROBLEMAS DE TRANSPORTE ","   PROBLEMAS DE TRANSPORTE  ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("356","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","    ","     ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("357","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","TARDE","MAÑANA","127.0.0.1","Error en los datos","Modificar","disponibilidadins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("358","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","Lu,Ma,Mi,Vi","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("359","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","     ","      ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("360","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","0","1","127.0.0.1","Error en los datos","Modificar","copiacedulains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("361","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","0","1","127.0.0.1","Error en los datos","Modificar","repitienteins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("362","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","   PROBLEMAS DE TRANSPORTE  ","   PROBLEMAS DE TRANSPORTE   ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("363","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","     ","      ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("364","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("365","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","      ","       ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("366","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","   PROBLEMAS DE TRANSPORTE   ","   PROBLEMAS DE TRANSPORTE    ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("367","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","      ","       ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("368","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("369","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","       ","        ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("370","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","   PROBLEMAS DE TRANSPORTE    ","   PROBLEMAS DE TRANSPORTE    ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("371","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","       ","        ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("372","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("373","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","        ","         ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("374","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","   PROBLEMAS DE TRANSPORTE    ","   PROBLEMAS DE TRANSPORTE    ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("375","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","        ","         ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("376","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("377","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","         ","          ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("378","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","   PROBLEMAS DE TRANSPORTE    ","   PROBLEMAS DE TRANSPORTE    ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("379","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","         ","          ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("380","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-02 07:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("381","http://localhost/antonio/vista/registrar_familiar.php?f=0","2014-04-02 07:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tfamiliar","administrador","registrar_familiar");
INSERT INTO tbitacora VALUES("382","http://localhost/antonio/vista/intranet.php?vista=archivo/consultar_asignatura&id=1","2014-04-02 08:04:00","0","2","127.0.0.1","Error en los datos","Modificar","horaspracticas","tasignatura","administrador","editar_asignatura");
INSERT INTO tbitacora VALUES("383","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-04-02 09:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("384","http://localhost/antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=4","2014-04-02 09:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso_tparticipante","administrador","inscribir_curso");
INSERT INTO tbitacora VALUES("385","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-04-02 09:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("386","http://localhost/antonio/vista/intranet.php?vista=curso/consultar_lapso&id=1","2014-04-02 09:04:00","APERTURADO","Cerrado","127.0.0.1","Error en los datos","Modificar","estadolap","tlapso","administrador","editar_lapso");
INSERT INTO tbitacora VALUES("387","http://localhost/antonio/vista/intranet.php?vista=archivo/consultar_diagnostico&id=1","2014-04-04 02:04:00","Ceguera leves","Sano","127.0.0.1","Error en los datos","Modificar","descripciondia","tdiagnostico","administrador","editar_diagnostico");
INSERT INTO tbitacora VALUES("388","http://localhost/antonio/vista/intranet.php?vista=archivo/consultar_diagnostico&id=2","2014-04-04 02:04:00","Ceguera moderada","Ceguera Leve","127.0.0.1","Error en los datos","Modificar","descripciondia","tdiagnostico","administrador","editar_diagnostico");
INSERT INTO tbitacora VALUES("389","http://localhost/antonio/vista/intranet.php?vista=archivo/consultar_diagnostico&id=3","2014-04-04 02:04:00","Ceguera severa","Ceguera Moderada","127.0.0.1","Error en los datos","Modificar","descripciondia","tdiagnostico","administrador","editar_diagnostico");
INSERT INTO tbitacora VALUES("390","http://localhost/antonio/vista/intranet.php?vista=archivo/consultar_diagnostico&id=4","2014-04-04 02:04:00","Sano","Ceguera Grave","127.0.0.1","Error en los datos","Modificar","descripciondia","tdiagnostico","administrador","editar_diagnostico");
INSERT INTO tbitacora VALUES("391","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-04 03:04:00","Rural","URBANO","127.0.0.1","Error en los datos","Modificar","medioviviendapar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("392","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-04 03:04:00","Propia","PROPIA","127.0.0.1","Error en los datos","Modificar","viviendapar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("393","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-04 03:04:00","INREVI","BLOQUES Y ZINC","127.0.0.1","Error en los datos","Modificar","tipoconstruccionpar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("394","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-04 03:04:00","0","2","127.0.0.1","Error en los datos","Modificar","tlocalidad_idlocalidad","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("395","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-04 03:04:00","Mañana","MAÑANA","127.0.0.1","Error en los datos","Modificar","disponibilidadins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("396","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-04 03:04:00","Lu","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("397","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-04 03:04:00"," ","  ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("398","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-04 03:04:00","0","2","127.0.0.1","Error en los datos","Modificar","tinstitucion_idinstitucion","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("399","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-04 03:04:00"," ","  ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("400","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-04 03:04:00"," ","  ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("401","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=7","2014-04-04 03:04:00","Urbano","RURAL","127.0.0.1","Error en los datos","Modificar","medioviviendapar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("402","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=7","2014-04-04 03:04:00","Alquilada","PROPIA","127.0.0.1","Error en los datos","Modificar","viviendapar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("403","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=7","2014-04-04 03:04:00","0","3","127.0.0.1","Error en los datos","Modificar","tlocalidad_idlocalidad","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("404","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=7","2014-04-04 03:04:00","Mañana","MAÑANA","127.0.0.1","Error en los datos","Modificar","disponibilidadins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("405","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=7","2014-04-04 03:04:00","Lu,Ma,Mi,Ju","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("406","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=7","2014-04-04 03:04:00"," ","  ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("407","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=7","2014-04-04 03:04:00"," Enfermedad"," Enfermedad ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("408","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=7","2014-04-04 03:04:00","  Posee una ceguera leve, pero","  Posee una ceguera leve, pero","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("409","http://localhost/antonio/vista/intranet.php?vista=persona/registrar_personal&id=4090420","2014-04-04 03:04:00","0","2","127.0.0.1","Error en los datos","Modificar","tlocalidad_idlocalidad","tpersonal","administrador","editar_personal");
INSERT INTO tbitacora VALUES("410","http://localhost/antonio/vista/intranet.php?vista=persona/registrar_personal&id=4090422","2014-04-04 03:04:00","0","2","127.0.0.1","Error en los datos","Modificar","tlocalidad_idlocalidad","tpersonal","administrador","editar_personal");
INSERT INTO tbitacora VALUES("411","http://localhost/antonio/vista/intranet.php?vista=persona/registrar_personal&id=20158248","2014-04-04 04:04:00","0","4","127.0.0.1","Error en los datos","Modificar","tlocalidad_idlocalidad","tpersonal","administrador","editar_personal");
INSERT INTO tbitacora VALUES("412","http://localhost/antonio/vista/intranet.php?vista=persona/registrar_personal&id=4090423","2014-04-04 04:04:00","0","2","127.0.0.1","Error en los datos","Modificar","tlocalidad_idlocalidad","tpersonal","administrador","editar_personal");
INSERT INTO tbitacora VALUES("413","http://localhost/antonio/vista/intranet.php?vista=persona/registrar_docente&id=15491963","2014-04-04 04:04:00","0","2","127.0.0.1","Error en los datos","Modificar","tlocalidad_idlocalidad","tdocente","administrador","editar_docente");
INSERT INTO tbitacora VALUES("414","http://localhost/antonio/vista/intranet.php?vista=persona/registrar_docente&id=15491963","2014-04-04 04:04:00","0","2","127.0.0.1","Error en los datos","Modificar","tlocalidad_idlocalidad","tdocente","administrador","editar_docente");
INSERT INTO tbitacora VALUES("415","http://localhost/antonio/vista/intranet.php?vista=persona/registrar_docente&id=20158248","2014-04-04 04:04:00","0","4","127.0.0.1","Error en los datos","Modificar","tlocalidad_idlocalidad","tdocente","administrador","editar_docente");
INSERT INTO tbitacora VALUES("416","http://localhost/antonio/vista/intranet.php?vista=persona/registrar_docente&id=20158248","2014-04-04 04:04:00","4","3","127.0.0.1","Error en los datos","Modificar","tlocalidad_idlocalidad","tdocente","administrador","editar_docente");
INSERT INTO tbitacora VALUES("417","http://localhost/antonio/vista/intranet.php?vista=persona/registrar_docente&id=202342342","2014-04-04 04:04:00","0","6","127.0.0.1","Error en los datos","Modificar","tlocalidad_idlocalidad","tdocente","administrador","editar_docente");
INSERT INTO tbitacora VALUES("418","http://localhost/antonio/vista/registrar_familiar.php?f=0","2014-04-04 04:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tfamiliar","administrador","registrar_familiar");
INSERT INTO tbitacora VALUES("419","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-04-04 04:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("420","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-04-04 04:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("421","http://localhost/antonio/vista/intranet.php?vista=seguridad/consultar_servicio&id=95","2014-04-04 04:04:00","DESBLOQUEAR","Desbloquear","127.0.0.1","Error en los datos","Modificar","nombreser","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("422","http://localhost/antonio/vista/intranet.php?vista=seguridad/consultar_servicio&id=95","2014-04-04 04:04:00","5","1","127.0.0.1","Error en los datos","Modificar","idmodulo","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("423","http://localhost/antonio/vista/intranet.php?vista=seguridad/consultar_servicio&id=94","2014-04-04 04:04:00","PRIMERA VEZ","Primera vez","127.0.0.1","Error en los datos","Modificar","nombreser","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("424","http://localhost/Antonio/vista/intranet.php?vista=persona/registrar_personal","2014-04-04 03:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tpersonal","administrador","registrar_personal");
INSERT INTO tbitacora VALUES("425","http://localhost/Antonio/vista/intranet.php?vista=seguridad/primera_vez","2014-04-04 03:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tpregunta","10328765","primera_vez");
INSERT INTO tbitacora VALUES("426","http://localhost/Antonio/vista/intranet.php?vista=seguridad/primera_vez","2014-04-04 03:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tpregunta","10328765","primera_vez");
INSERT INTO tbitacora VALUES("427","http://localhost/Antonio/vista/intranet.php?vista=seguridad/registrar_modulo","2014-04-04 04:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tmodulo","administrador","registrar_modulo");
INSERT INTO tbitacora VALUES("428","http://localhost/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-04-04 04:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("429","http://localhost/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-04-04 04:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("430","http://localhost/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-04-04 04:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("431","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-04 04:04:00","Urbano","RURAL","127.0.0.1","Error en los datos","Modificar","medioviviendapar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("432","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-04 04:04:00","Alquilada","PROPIA","127.0.0.1","Error en los datos","Modificar","viviendapar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("433","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-04 04:04:00","0","2","127.0.0.1","Error en los datos","Modificar","tlocalidad_idlocalidad","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("434","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-04 04:04:00","0","1","127.0.0.1","Error en los datos","Modificar","tinstitucion_idinstitucion","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("435","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-04 04:04:00","Mañana","MAÑANA","127.0.0.1","Error en los datos","Modificar","disponibilidadins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("436","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-04 04:04:00","Lu,Ma,Mi,Ju,Vi","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("437","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-04 04:04:00"," ","  ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("438","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-04 04:04:00","0","1","127.0.0.1","Error en los datos","Modificar","tinstitucion_idinstitucion","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("439","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-04 04:04:00"," ","  ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("440","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-04 04:04:00","   Posee una ceguera leve, per","   Posee una ceguera leve, per","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("441","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-04 04:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("442","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-04 04:04:00","  ","   ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("443","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-04 04:04:00","0","1","127.0.0.1","Error en los datos","Modificar","tinstitucion_idinstitucion","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("444","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-04 04:04:00","  ","   ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("445","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-04 04:04:00","   POSEE UNA CEGUERA LEVE, PER","   POSEE UNA CEGUERA LEVE, PER","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("446","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=7","2014-04-04 04:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("447","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=7","2014-04-04 04:04:00","  ","   ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("448","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=7","2014-04-04 04:04:00"," ENFERMEDAD "," ENFERMEDAD  ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("449","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=7","2014-04-04 04:04:00","  POSEE UNA CEGUERA LEVE, PERO","  POSEE UNA CEGUERA LEVE, PERO","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("450","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=12","2014-04-04 04:04:00","Urbano","URBANO","127.0.0.1","Error en los datos","Modificar","medioviviendapar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("451","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=12","2014-04-04 04:04:00","Propia","PROPIA","127.0.0.1","Error en los datos","Modificar","viviendapar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("452","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=12","2014-04-04 04:04:00","0","3","127.0.0.1","Error en los datos","Modificar","tlocalidad_idlocalidad","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("453","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=12","2014-04-04 04:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("454","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=12","2014-04-04 04:04:00","          ","           ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("455","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=12","2014-04-04 04:04:00","   PROBLEMAS DE TRANSPORTE    ","   PROBLEMAS DE TRANSPORTE    ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("456","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=12","2014-04-04 04:04:00","          ","           ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("457","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=12","2014-04-04 04:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("458","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=12","2014-04-04 04:04:00","           ","            ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("459","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=12","2014-04-04 04:04:00","   PROBLEMAS DE TRANSPORTE    ","   PROBLEMAS DE TRANSPORTE    ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("460","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=12","2014-04-04 04:04:00","           ","            ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("461","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=12","2014-04-04 04:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("462","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=12","2014-04-04 04:04:00","            ","             ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("463","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=12","2014-04-04 04:04:00","   PROBLEMAS DE TRANSPORTE    ","   PROBLEMAS DE TRANSPORTE    ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("464","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=12","2014-04-04 04:04:00","            ","             ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("465","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=12","2014-04-04 04:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("466","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=12","2014-04-04 04:04:00","             ","              ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("467","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=12","2014-04-04 04:04:00","   PROBLEMAS DE TRANSPORTE    ","   PROBLEMAS DE TRANSPORTE    ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("468","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=12","2014-04-04 04:04:00","             ","              ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("469","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=12","2014-04-04 04:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("470","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=12","2014-04-04 04:04:00","              ","               ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("471","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=12","2014-04-04 04:04:00","   PROBLEMAS DE TRANSPORTE    ","   PROBLEMAS DE TRANSPORTE    ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("472","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=12","2014-04-04 04:04:00","              ","               ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("473","http://localhost/Antonio/vista/intranet.php?vista=archivo/municipio","2014-04-04 04:04:00","0","1","127.0.0.1","No sé utiliza","Restaurar","estatusmun","tmunicipio","administrador","restaurar_municipio");
INSERT INTO tbitacora VALUES("474","http://localhost/Antonio/vista/intranet.php?vista=archivo/municipio","2014-04-04 04:04:00","1","0","127.0.0.1","No sé utiliza","Eliminar","estatusmun","tmunicipio","administrador","eliminar_municipio");
INSERT INTO tbitacora VALUES("475","http://localhost/Antonio/vista/intranet.php?vista=archivo/registrar_institucion","2014-04-04 05:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tinstitucion","administrador","registrar_institucion");
INSERT INTO tbitacora VALUES("476","http://localhost/Antonio/vista/intranet.php?vista=archivo/institucion","2014-04-04 05:04:00","1","0","127.0.0.1","No sé utiliza","Eliminar","estatusinst","tinstitucion","administrador","eliminar_institucion");
INSERT INTO tbitacora VALUES("477","http://localhost/Antonio/vista/intranet.php?vista=archivo/institucion","2014-04-04 05:04:00","0","1","127.0.0.1","No sé utiliza","Restaurar","estatusinst","tinstitucion","administrador","restaurar_institucion");
INSERT INTO tbitacora VALUES("478","http://localhost/Antonio/vista/intranet.php?vista=curso/consultar_lapso&id=2","2014-04-04 05:04:00","PROGRAMADO","Aperturado","127.0.0.1","Error en los datos","Modificar","estadolap","tlapso","administrador","editar_lapso");
INSERT INTO tbitacora VALUES("479","http://localhost/Antonio/vista/intranet.php?vista=archivo/registrar_area","2014-04-04 05:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tarea_conocimiento","administrador","registrar_area");
INSERT INTO tbitacora VALUES("480","http://localhost/Antonio/vista/intranet.php?vista=archivo/registrar_asignatura","2014-04-04 05:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tasignatura","administrador","registrar_asignatura");
INSERT INTO tbitacora VALUES("481","http://localhost/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-04-04 05:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("482","http://localhost/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-04-04 05:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("483","http://localhost/Antonio/vista/intranet.php?vista=curso/lapso","2014-04-04 06:04:00","0","1","127.0.0.1","No sé utiliza","Restaurar","estatuslap","tlapso","administrador","restaurar_lapso");
INSERT INTO tbitacora VALUES("484","http://localhost/Antonio/vista/intranet.php?vista=curso/lapso","2014-04-04 06:04:00","1","0","127.0.0.1","No sé utiliza","Eliminar","estatuslap","tlapso","administrador","eliminar_lapso");
INSERT INTO tbitacora VALUES("485","http://localhost/Antonio/vista/intranet.php?vista=curso/lapso","2014-04-04 06:04:00","0","1","127.0.0.1","No sé utiliza","Restaurar","estatuslap","tlapso","administrador","restaurar_lapso");
INSERT INTO tbitacora VALUES("486","http://localhost/Antonio/vista/intranet.php?vista=seguridad/rol","2014-04-04 06:04:00","1","0","127.0.0.1","No sé utiliza","Eliminar","estatusser","trol","administrador","eliminar_rol");
INSERT INTO tbitacora VALUES("487","http://localhost/Antonio/vista/intranet.php?vista=seguridad/rol","2014-04-04 06:04:00","0","1","127.0.0.1","No sé utiliza","Restaurar","estatusrol","trol","administrador","restaurar_rol");
INSERT INTO tbitacora VALUES("488","http://localhost/Antonio/vista/intranet.php?vista=seguridad/servicio","2014-04-04 06:04:00","1","0","127.0.0.1","No sé utiliza","Eliminar","estatusser","tservicio","administrador","eliminar_servicio");
INSERT INTO tbitacora VALUES("489","http://localhost/Antonio/vista/intranet.php?vista=seguridad/servicio","2014-04-04 06:04:00","0","1","127.0.0.1","No sé utiliza","Restaurar","estatusser","tservicio","administrador","restaurar_servicio");
INSERT INTO tbitacora VALUES("490","http://localhost/Antonio/vista/intranet.php?vista=curso/registrar_lapso","2014-04-04 06:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tlapso","administrador","registrar_lapso");
INSERT INTO tbitacora VALUES("491","http://localhost/Antonio/vista/intranet.php?vista=curso/registrar_curso","2014-04-04 06:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso","administrador","registrar_curso");
INSERT INTO tbitacora VALUES("492","http://localhost/Antonio/vista/intranet.php?vista=curso/registrar_curso","2014-04-04 06:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso","administrador","registrar_curso");
INSERT INTO tbitacora VALUES("493","http://localhost/Antonio/vista/intranet.php?vista=seguridad/consultar_servicio&id=92","2014-04-04 06:04:00","curso/cursos_ofertados","curso/cursos_inactivos","127.0.0.1","Error en los datos","Modificar","enlaceser","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("494","http://localhost/Antonio/vista/intranet.php?vista=seguridad/consultar_servicio&id=93","2014-04-04 06:04:00","curso/detalle_curso","curso/detalle_curso_inactivo","127.0.0.1","Error en los datos","Modificar","enlaceser","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("495","http://localhost/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-04-04 06:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("496","http://localhost/Antonio/vista/intranet.php?vista=curso/registrar_lapso","2014-04-04 07:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tlapso","administrador","registrar_lapso");
INSERT INTO tbitacora VALUES("497","http://localhost/Antonio/vista/intranet.php?vista=seguridad/consultar_servicio&id=85","2014-04-04 07:04:00","inscripcion/listado_participan","inscripcion/listado_participan","127.0.0.1","Error en los datos","Modificar","enlaceser","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("498","http://localhost/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-04-04 07:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("499","http://localhost/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-04-04 07:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("500","http://localhost/Antonio/vista/intranet.php?vista=seguridad/consultar_servicio&id=84","2014-04-04 07:04:00","inscripcion/listado_cursos","inscripcion/listado_cursos_ins","127.0.0.1","Error en los datos","Modificar","enlaceser","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("501","http://localhost/Antonio/vista/intranet.php?vista=seguridad/consultar_servicio&id=102","2014-04-04 07:04:00","Desincorporar Individual","Desincorporar participante","127.0.0.1","Error en los datos","Modificar","nombreser","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("502","http://localhost/Antonio/vista/intranet.php?vista=seguridad/consultar_servicio&id=103","2014-04-04 07:04:00","Desincorporación Masiva","Desincorporar participantes ma","127.0.0.1","Error en los datos","Modificar","nombreser","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("503","http://localhost/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-04-04 07:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("504","http://localhost/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-04-04 07:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("505","http://localhost/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=12","2014-04-04 08:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso_tparticipante","administrador","inscribir_curso");
INSERT INTO tbitacora VALUES("506","http://localhost/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=13","2014-04-04 08:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso_tparticipante","administrador","inscribir_curso");
INSERT INTO tbitacora VALUES("507","http://localhost/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-04-04 08:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("508","http://localhost/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-04-04 08:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("509","http://localhost/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=12","2014-04-04 09:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso_tparticipante","administrador","desincorporar_curso");
INSERT INTO tbitacora VALUES("510","http://localhost/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=13","2014-04-04 09:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso_tparticipante","administrador","inscribir_curso");
INSERT INTO tbitacora VALUES("511","http://localhost/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=13","2014-04-04 09:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso_tparticipante","administrador","desincorporar_curso");
INSERT INTO tbitacora VALUES("512","http://localhost/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=13","2014-04-04 09:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso_tparticipante","administrador","desincorporar_curso");
INSERT INTO tbitacora VALUES("513","http://localhost/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=13","2014-04-04 09:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso_tparticipante","administrador","desincorporar_curso");
INSERT INTO tbitacora VALUES("514","http://localhost/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=15","2014-04-04 10:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso_tparticipante","administrador","inscribir_curso");
INSERT INTO tbitacora VALUES("515","http://localhost/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-04-04 11:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("516","http://localhost/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-04-04 11:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("517","http://localhost/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=14","2014-04-04 11:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso_tparticipante","administrador","inscribir_curso");
INSERT INTO tbitacora VALUES("518","http://localhost/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=13","2014-04-04 11:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso_tparticipante","administrador","desincorporar_curso");
INSERT INTO tbitacora VALUES("519","http://localhost/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=10","2014-04-04 11:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso_tparticipante","administrador","inscribir_curso");
INSERT INTO tbitacora VALUES("520","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-04 11:04:00","EVW","Mijailovich","127.0.0.1","Error en los datos","Modificar","nombreunopar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("521","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-04 11:04:00","SADC","Krokatov","127.0.0.1","Error en los datos","Modificar","apellidounopar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("522","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-04 11:04:00","43534545645","02918572837","127.0.0.1","Error en los datos","Modificar","telefonopar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("523","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-04 11:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("524","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-04 11:04:00","  ","   ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("525","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-04 11:04:00","0","2","127.0.0.1","Error en los datos","Modificar","tinstitucion_idinstitucion","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("526","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-04 11:04:00","  ","   ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("527","http://localhost/Antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-04 11:04:00","  ","   ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("528","http://localhost/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-04-04 11:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("529","http://localhost/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-04-04 11:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("530","http://localhost/Antonio/vista/intranet.php?vista=seguridad/servicio","2014-04-04 11:04:00","1","0","127.0.0.1","No sé utiliza","Eliminar","estatusser","tservicio","administrador","eliminar_servicio");
INSERT INTO tbitacora VALUES("531","http://localhost/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-04-05 12:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("532","http://localhost/antonio/vista/intranet.php?vista=curso/registrar_lapso","2014-04-05 02:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tlapso","administrador","registrar_lapso");
INSERT INTO tbitacora VALUES("533","http://localhost/antonio/vista/intranet.php?vista=curso/registrar_lapso","2014-04-05 02:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tlapso","administrador","registrar_lapso");
INSERT INTO tbitacora VALUES("534","http://localhost/antonio/vista/intranet.php?vista=curso/registrar_lapso","2014-04-05 02:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tlapso","administrador","registrar_lapso");
INSERT INTO tbitacora VALUES("535","http://localhost/antonio/vista/intranet.php?vista=curso/registrar_curso","2014-04-05 02:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso","administrador","registrar_curso");
INSERT INTO tbitacora VALUES("536","http://localhost/antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=18","2014-04-05 02:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso_tparticipante","administrador","inscribir_curso");
INSERT INTO tbitacora VALUES("537","http://localhost/antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=19","2014-04-05 02:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso_tparticipante","administrador","inscribir_curso");
INSERT INTO tbitacora VALUES("538","http://localhost/antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=18","2014-04-05 02:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso_tparticipante","administrador","desincorporar_curso");
INSERT INTO tbitacora VALUES("539","http://localhost/antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=20","2014-04-05 02:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso_tparticipante","administrador","inscribir_curso");
INSERT INTO tbitacora VALUES("540","http://localhost/antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=17","2014-04-05 02:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso_tparticipante","administrador","inscribir_curso");
INSERT INTO tbitacora VALUES("541","http://localhost/antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=16","2014-04-05 02:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso_tparticipante","administrador","inscribir_curso");
INSERT INTO tbitacora VALUES("542","http://localhost/antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=21","2014-04-05 02:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso_tparticipante","administrador","inscribir_curso");
INSERT INTO tbitacora VALUES("543","http://localhost/antonio/vista/intranet.php?vista=curso/registrar_lapso","2014-04-05 03:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tlapso","administrador","registrar_lapso");
INSERT INTO tbitacora VALUES("544","http://localhost/CAIDV/vista/intranet.php?vista=curso/registrar_lapso","2014-04-05 03:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tlapso","administrador","registrar_lapso");
INSERT INTO tbitacora VALUES("545","http://localhost/antonio/vista/intranet.php?vista=curso/consultar_lapso&id=5","2014-04-05 03:04:00","APERTURADO","Cerrado","127.0.0.1","Error en los datos","Modificar","estadolap","tlapso","administrador","editar_lapso");
INSERT INTO tbitacora VALUES("546","http://localhost/antonio/vista/intranet.php?vista=curso/consultar_lapso&id=6","2014-04-05 04:04:00","PROGRAMADO","Aperturado","127.0.0.1","Error en los datos","Modificar","estadolap","tlapso","administrador","editar_lapso");
INSERT INTO tbitacora VALUES("547","http://localhost/antonio/vista/intranet.php?vista=curso/registrar_curso","2014-04-05 04:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso","administrador","registrar_curso");
INSERT INTO tbitacora VALUES("548","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-15 11:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("549","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-15 11:04:00","   ","    ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("550","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-15 11:04:00","0","1","127.0.0.1","Error en los datos","Modificar","tinstitucion_idinstitucion","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("551","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-15 11:04:00","   ","    ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("552","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-15 11:04:00","   POSEE UNA CEGUERA LEVE, PER","   POSEE UNA CEGUERA LEVE, PER","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("553","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-15 11:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("554","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-15 11:04:00","    ","     ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("555","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-15 11:04:00","0","1","127.0.0.1","Error en los datos","Modificar","tinstitucion_idinstitucion","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("556","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-15 11:04:00","    ","     ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("557","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-15 11:04:00","   POSEE UNA CEGUERA LEVE, PER","   POSEE UNA CEGUERA LEVE, PER","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("558","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-15 11:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("559","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-15 11:04:00","     ","      ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("560","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-15 11:04:00","0","1","127.0.0.1","Error en los datos","Modificar","tinstitucion_idinstitucion","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("561","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-15 11:04:00","     ","      ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("562","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-15 11:04:00","   POSEE UNA CEGUERA LEVE, PER","   POSEE UNA CEGUERA LEVE, PER","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("563","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-15 11:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("564","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-15 11:04:00","      ","       ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("565","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-15 11:04:00","0","1","127.0.0.1","Error en los datos","Modificar","tinstitucion_idinstitucion","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("566","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-15 11:04:00","      ","       ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("567","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-15 11:04:00","   POSEE UNA CEGUERA LEVE, PER","   POSEE UNA CEGUERA LEVE, PER","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("568","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("569","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","0","1","127.0.0.1","Error en los datos","Modificar","tinstitucion_idinstitucion","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("570","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("571","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","0","1","127.0.0.1","Error en los datos","Modificar","tinstitucion_idinstitucion","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("572","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("573","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","       ","        ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("574","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","0","1","127.0.0.1","Error en los datos","Modificar","tinstitucion_idinstitucion","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("575","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","       ","        ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("576","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","   POSEE UNA CEGUERA LEVE, PER","   POSEE UNA CEGUERA LEVE, PER","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("577","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("578","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","        ","         ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("579","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","0","1","127.0.0.1","Error en los datos","Modificar","tinstitucion_idinstitucion","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("580","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","        ","         ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("581","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","   POSEE UNA CEGUERA LEVE, PER","   POSEE UNA CEGUERA LEVE, PER","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("582","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("583","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","         ","          ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("584","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","0","1","127.0.0.1","Error en los datos","Modificar","tinstitucion_idinstitucion","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("585","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","         ","          ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("586","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","   POSEE UNA CEGUERA LEVE, PER","   POSEE UNA CEGUERA LEVE, PER","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("587","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("588","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","          ","           ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("589","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","0","1","127.0.0.1","Error en los datos","Modificar","tinstitucion_idinstitucion","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("590","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","          ","           ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("591","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","   POSEE UNA CEGUERA LEVE, PER","   POSEE UNA CEGUERA LEVE, PER","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("592","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("593","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","           ","            ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("594","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","0","1","127.0.0.1","Error en los datos","Modificar","tinstitucion_idinstitucion","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("595","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","           ","            ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("596","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","   POSEE UNA CEGUERA LEVE, PER","   POSEE UNA CEGUERA LEVE, PER","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("597","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("598","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","0","1","127.0.0.1","Error en los datos","Modificar","tinstitucion_idinstitucion","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("599","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("600","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","0","1","127.0.0.1","Error en los datos","Modificar","tinstitucion_idinstitucion","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("601","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("602","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","0","1","127.0.0.1","Error en los datos","Modificar","tinstitucion_idinstitucion","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("603","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("604","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","0","1","127.0.0.1","Error en los datos","Modificar","tinstitucion_idinstitucion","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("605","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("606","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","0","1","127.0.0.1","Error en los datos","Modificar","tinstitucion_idinstitucion","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("607","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("608","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","0","1","127.0.0.1","Error en los datos","Modificar","tinstitucion_idinstitucion","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("609","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("610","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","            ","             ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("611","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","0","1","127.0.0.1","Error en los datos","Modificar","tinstitucion_idinstitucion","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("612","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","            ","             ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("613","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 12:04:00","   POSEE UNA CEGUERA LEVE, PER","   POSEE UNA CEGUERA LEVE, PER","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("614","http://localhost/antonio/vista/registrar_familiar.php?f=0","2014-04-16 12:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tfamiliar","administrador","registrar_familiar");
INSERT INTO tbitacora VALUES("615","http://localhost/antonio/vista/registrar_familiar.php?f=2","2014-04-16 12:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tfamiliar","administrador","registrar_familiar");
INSERT INTO tbitacora VALUES("616","http://localhost/antonio/vista/intranet.php?vista=persona/registrar_participante","2014-04-16 12:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tinscripcion","administrador","registrar_inscripcion");
INSERT INTO tbitacora VALUES("617","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-16 12:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("618","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-16 12:04:00","   ","    ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("619","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-16 12:04:00","0","2","127.0.0.1","Error en los datos","Modificar","tinstitucion_idinstitucion","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("620","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-16 12:04:00","   ","    ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("621","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-16 12:04:00","   ","    ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("622","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-16 12:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("623","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-16 12:04:00","    ","     ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("624","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-16 12:04:00","0","2","127.0.0.1","Error en los datos","Modificar","tinstitucion_idinstitucion","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("625","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-16 12:04:00","    ","     ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("626","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-16 12:04:00","    ","     ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("627","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-16 12:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("628","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-16 12:04:00","     ","      ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("629","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-16 12:04:00","0","2","127.0.0.1","Error en los datos","Modificar","tinstitucion_idinstitucion","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("630","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-16 12:04:00","     ","      ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("631","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-16 12:04:00","     ","      ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("632","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-16 12:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("633","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-16 12:04:00","      ","       ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("634","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-16 12:04:00","0","2","127.0.0.1","Error en los datos","Modificar","tinstitucion_idinstitucion","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("635","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-16 12:04:00","      ","       ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("636","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-16 12:04:00","      ","       ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("637","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-16 12:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("638","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-16 12:04:00","       ","        ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("639","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-16 12:04:00","0","2","127.0.0.1","Error en los datos","Modificar","tinstitucion_idinstitucion","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("640","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-16 12:04:00","       ","        ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("641","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-16 12:04:00","       ","        ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("642","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-16 12:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("643","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-16 12:04:00","        ","         ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("644","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-16 12:04:00","0","2","127.0.0.1","Error en los datos","Modificar","tinstitucion_idinstitucion","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("645","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-16 12:04:00","        ","         ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("646","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-16 12:04:00","        ","         ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("647","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-16 12:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("648","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-16 12:04:00","         ","          ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("649","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-16 12:04:00","0","2","127.0.0.1","Error en los datos","Modificar","tinstitucion_idinstitucion","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("650","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-16 12:04:00","         ","          ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("651","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-16 12:04:00","         ","          ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("652","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-16 12:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("653","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-16 12:04:00","          ","           ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("654","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-16 12:04:00","0","2","127.0.0.1","Error en los datos","Modificar","tinstitucion_idinstitucion","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("655","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-16 12:04:00","          ","           ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("656","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-16 12:04:00","          ","           ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("657","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=7","2014-04-16 01:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("658","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=7","2014-04-16 01:04:00","   ","    ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("659","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=7","2014-04-16 01:04:00"," ENFERMEDAD  "," ENFERMEDAD   ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("660","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=7","2014-04-16 01:04:00","  POSEE UNA CEGUERA LEVE, PERO","  POSEE UNA CEGUERA LEVE, PERO","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("661","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 01:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("662","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 01:04:00","             ","              ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("663","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 01:04:00","0","1","127.0.0.1","Error en los datos","Modificar","tinstitucion_idinstitucion","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("664","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 01:04:00","             ","              ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("665","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=8","2014-04-16 01:04:00","   POSEE UNA CEGUERA LEVE, PER","   POSEE UNA CEGUERA LEVE, PER","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("666","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=12","2014-04-16 01:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("667","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=12","2014-04-16 01:04:00","               ","                ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("668","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=12","2014-04-16 01:04:00","   PROBLEMAS DE TRANSPORTE    ","   PROBLEMAS DE TRANSPORTE    ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("669","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=12","2014-04-16 01:04:00","               ","                ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("670","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-16 01:04:00","Urbano","RURAL","127.0.0.1","Error en los datos","Modificar","medioviviendapar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("671","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-16 01:04:00","Propia","PROPIA","127.0.0.1","Error en los datos","Modificar","viviendapar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("672","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-16 01:04:00","INREVI","INAVI","127.0.0.1","Error en los datos","Modificar","tipoconstruccionpar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("673","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-16 01:04:00","0","2","127.0.0.1","Error en los datos","Modificar","tlocalidad_idlocalidad","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("674","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-16 01:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("675","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-16 01:04:00","          ","           ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("676","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-16 01:04:00","   PROBLEMAS DE TRANSPORTE    ","   PROBLEMAS DE TRANSPORTE    ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("677","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-16 01:04:00","          ","           ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("678","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=4","2014-04-16 01:04:00","Urbano","URBANO","127.0.0.1","Error en los datos","Modificar","medioviviendapar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("679","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=4","2014-04-16 01:04:00","Propia","PROPIA","127.0.0.1","Error en los datos","Modificar","viviendapar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("680","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=4","2014-04-16 01:04:00","0","2","127.0.0.1","Error en los datos","Modificar","tlocalidad_idlocalidad","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("681","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=13","2014-04-20 11:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("682","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=13","2014-04-20 11:04:00"," ","  ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("683","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=13","2014-04-20 11:04:00"," ","  ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("684","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=13","2014-04-20 11:04:00"," ","  ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("685","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=9","2014-04-20 11:04:00","Urbano","URBANO","127.0.0.1","Error en los datos","Modificar","medioviviendapar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("686","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=9","2014-04-20 11:04:00","Propia","PROPIA","127.0.0.1","Error en los datos","Modificar","viviendapar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("687","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=9","2014-04-20 11:04:00","0","2","127.0.0.1","Error en los datos","Modificar","tlocalidad_idlocalidad","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("688","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=9","2014-04-20 11:04:00","Tarde","MAÑANA","127.0.0.1","Error en los datos","Modificar","disponibilidadins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("689","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=9","2014-04-20 11:04:00","Lu,Ma,Mi,Ju,Vi","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("690","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=9","2014-04-20 11:04:00"," ","  ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("691","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=9","2014-04-20 11:04:00","1","2","127.0.0.1","Error en los datos","Modificar","tinstitucion_idinstitucion","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("692","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=9","2014-04-20 11:04:00"," ","  ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("693","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=9","2014-04-20 11:04:00"," ","  ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("694","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=7","2014-04-24 04:04:00","N","V","127.0.0.1","Error en los datos","Modificar","nacionalidadpar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("695","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=7","2014-04-24 04:04:00","No","1","127.0.0.1","Error en los datos","Modificar","etniapar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("696","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=7","2014-04-24 04:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("697","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=7","2014-04-24 04:04:00","    ","     ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("698","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=7","2014-04-24 04:04:00"," ENFERMEDAD   "," ENFERMEDAD    ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("699","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=7","2014-04-24 04:04:00","  POSEE UNA CEGUERA LEVE, PERO","  POSEE UNA CEGUERA LEVE, PERO","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("700","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-24 04:04:00","N","E","127.0.0.1","Error en los datos","Modificar","nacionalidadpar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("701","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-24 04:04:00","332","3324444","127.0.0.1","Error en los datos","Modificar","cedulapar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("702","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-24 04:04:00","No","1","127.0.0.1","Error en los datos","Modificar","etniapar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("703","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-24 04:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("704","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-24 04:04:00","           ","            ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("705","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-24 04:04:00","0","2","127.0.0.1","Error en los datos","Modificar","tinstitucion_idinstitucion","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("706","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-24 04:04:00","           ","            ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("707","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-24 04:04:00","           ","            ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("708","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-24 04:04:00","E","V","127.0.0.1","Error en los datos","Modificar","nacionalidadpar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("709","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-24 04:04:00","3324444","13534635","127.0.0.1","Error en los datos","Modificar","cedulapar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("710","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-24 04:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("711","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-24 04:04:00","            ","             ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("712","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-24 04:04:00","0","2","127.0.0.1","Error en los datos","Modificar","tinstitucion_idinstitucion","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("713","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-24 04:04:00","            ","             ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("714","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=10","2014-04-24 04:04:00","            ","             ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("715","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-04-24 04:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("716","http://localhost/antonio/vista/intranet.php?vista=seguridad/consultar_servicio&id=113","2014-04-24 04:04:00","reporte/listado_participantes_","reporte/listado_participantes_","127.0.0.1","Error en los datos","Modificar","enlaceser","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("717","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-04-24 05:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("718","http://localhost/antonio/vista/intranet.php?vista=persona/participante","2014-04-24 05:04:00","1","0","127.0.0.1","No sé utiliza","Restaurar","estatus","participante_familiar","administrador","restaurar_participante");
INSERT INTO tbitacora VALUES("719","http://localhost/antonio/vista/intranet.php?vista=persona/participante","2014-04-24 05:04:00","1","0","127.0.0.1","No sé utiliza","Restaurar","estatuspar","tparticipante","administrador","restaurar_participante");
INSERT INTO tbitacora VALUES("720","http://localhost/antonio/vista/intranet.php?vista=persona/participante","2014-04-24 05:04:00","1","0","127.0.0.1","No sé utiliza","Restaurar","estatusins","tinscripcion","administrador","restaurar_participante");
INSERT INTO tbitacora VALUES("721","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=5","2014-04-24 05:04:00","N","V","127.0.0.1","Error en los datos","Modificar","nacionalidadpar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("722","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=5","2014-04-24 05:04:00","Urbano","URBANO","127.0.0.1","Error en los datos","Modificar","medioviviendapar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("723","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=5","2014-04-24 05:04:00","Propia","PROPIA","127.0.0.1","Error en los datos","Modificar","viviendapar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("724","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=5","2014-04-24 05:04:00","No","1","127.0.0.1","Error en los datos","Modificar","etniapar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("725","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=5","2014-04-24 05:04:00","0","2","127.0.0.1","Error en los datos","Modificar","tlocalidad_idlocalidad","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("726","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=5","2014-04-24 05:04:00","Mañana","MAÑANA","127.0.0.1","Error en los datos","Modificar","disponibilidadins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("727","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=5","2014-04-24 05:04:00","Lu,Mi,Ju,vi","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("728","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=5","2014-04-24 05:04:00"," ","  ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("729","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=5","2014-04-24 05:04:00","0","2","127.0.0.1","Error en los datos","Modificar","tinstitucion_idinstitucion","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("730","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=5","2014-04-24 05:04:00"," Enfermedad"," Enfermedad ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("731","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=5","2014-04-24 05:04:00"," Posee una ceguera leve, pero "," Posee una ceguera leve, pero ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("732","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=4","2014-04-24 05:04:00","N","V","127.0.0.1","Error en los datos","Modificar","nacionalidadpar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("733","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=4","2014-04-24 05:04:00","No","1","127.0.0.1","Error en los datos","Modificar","etniapar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("734","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-25 08:04:00","V","E","127.0.0.1","Error en los datos","Modificar","nacionalidadpar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("735","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-25 08:04:00","No","1","127.0.0.1","Error en los datos","Modificar","etniapar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("736","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-25 08:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("737","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-25 08:04:00","           ","            ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("738","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-25 08:04:00","   PROBLEMAS DE TRANSPORTE    ","   PROBLEMAS DE TRANSPORTE    ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("739","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-25 08:04:00","           ","            ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("740","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-25 08:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("741","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-25 08:04:00","            ","             ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("742","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-25 08:04:00","   PROBLEMAS DE TRANSPORTE    ","   PROBLEMAS DE TRANSPORTE    ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("743","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-25 08:04:00","            ","             ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("744","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-25 08:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("745","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-25 08:04:00","             ","              ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("746","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-25 08:04:00","   PROBLEMAS DE TRANSPORTE    ","   PROBLEMAS DE TRANSPORTE    ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("747","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-25 08:04:00","             ","              ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("748","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-25 08:04:00","LU,MA,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("749","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-25 08:04:00","              ","               ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("750","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-25 08:04:00","   PROBLEMAS DE TRANSPORTE    ","   PROBLEMAS DE TRANSPORTE    ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("751","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-25 08:04:00","              ","               ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("752","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-25 08:04:00","LU,MA,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("753","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-25 08:04:00","               ","                ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("754","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-25 08:04:00","   PROBLEMAS DE TRANSPORTE    ","   PROBLEMAS DE TRANSPORTE    ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("755","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-25 08:04:00","               ","                ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("756","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-25 08:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("757","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-25 08:04:00","                ","                 ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("758","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-25 08:04:00","   PROBLEMAS DE TRANSPORTE    ","   PROBLEMAS DE TRANSPORTE    ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("759","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-25 08:04:00","                ","                 ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("760","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-25 08:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("761","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-25 08:04:00","                 ","                  ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("762","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-25 08:04:00","   PROBLEMAS DE TRANSPORTE    ","   PROBLEMAS DE TRANSPORTE    ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("763","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-25 08:04:00","                 ","                  ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("764","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-25 08:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("765","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-25 08:04:00","                  ","                   ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("766","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-25 08:04:00","   PROBLEMAS DE TRANSPORTE    ","   PROBLEMAS DE TRANSPORTE    ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("767","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-25 08:04:00","                  ","                   ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("768","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-25 08:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("769","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-25 08:04:00","                   ","                    ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("770","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-25 08:04:00","   PROBLEMAS DE TRANSPORTE    ","   PROBLEMAS DE TRANSPORTE    ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("771","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=11","2014-04-25 08:04:00","                   ","                    ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("772","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=2","2014-04-25 08:04:00","asdasda","Julian","127.0.0.1","Error en los datos","Modificar","nombreunopar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("773","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=2","2014-04-25 08:04:00","asdasda","mighel","127.0.0.1","Error en los datos","Modificar","nombredospar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("774","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=2","2014-04-25 08:04:00","asdasdasd","gonzales","127.0.0.1","Error en los datos","Modificar","apellidounopar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("775","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=2","2014-04-25 08:04:00","asdasd","peroza","127.0.0.1","Error en los datos","Modificar","apellidodospar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("776","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=2","2014-04-25 08:04:00","2534522345","02556235423","127.0.0.1","Error en los datos","Modificar","telefonopar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("777","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=2","2014-04-25 08:04:00","sdafafwaefwaef","egawegweg","127.0.0.1","Error en los datos","Modificar","direccionpar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("778","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=2","2014-04-25 08:04:00","00-00-0000","17-07-2000","127.0.0.1","Error en los datos","Modificar","fechanacimientopar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("779","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=2","2014-04-25 08:04:00","0","1","127.0.0.1","Error en los datos","Modificar","numhijopar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("780","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=2","2014-04-25 08:04:00","sdafafwaef","URBANO","127.0.0.1","Error en los datos","Modificar","medioviviendapar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("781","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=2","2014-04-25 08:04:00","sdafafwaefwaef","ALQUILADA","127.0.0.1","Error en los datos","Modificar","viviendapar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("782","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=2","2014-04-25 08:04:00","sdafafwaefwaef","INAVI","127.0.0.1","Error en los datos","Modificar","tipoconstruccionpar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("783","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=2","2014-04-25 08:04:00","s","1","127.0.0.1","Error en los datos","Modificar","braillepar","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("784","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=2","2014-04-25 08:04:00","0","2","127.0.0.1","Error en los datos","Modificar","tlocalidad_idlocalidad","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("785","http://localhost/antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=23","2014-04-26 12:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso_tparticipante","administrador","desincorporar_curso");
INSERT INTO tbitacora VALUES("786","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=2","2014-04-26 01:04:00","MA�ANA","MAÑANA","127.0.0.1","Error en los datos","Modificar","disponibilidadins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("787","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=2","2014-04-26 01:04:00","LU,MA,MI,JU","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("788","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=2","2014-04-26 01:04:00",""," ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("789","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=2","2014-04-26 01:04:00","","1","127.0.0.1","Error en los datos","Modificar","tinstitucion_idinstitucion","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("790","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=2","2014-04-26 01:04:00",""," ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("791","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=2","2014-04-26 01:04:00",""," ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("792","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=7","2014-04-26 01:04:00","LU,MI,VI","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("793","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=7","2014-04-26 01:04:00","     ","      ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("794","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=7","2014-04-26 01:04:00"," ENFERMEDAD    "," ENFERMEDAD     ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("795","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=7","2014-04-26 01:04:00","  POSEE UNA CEGUERA LEVE, PERO","  POSEE UNA CEGUERA LEVE, PERO","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("796","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=4","2014-04-26 01:04:00","MA�ANA","MAÑANA","127.0.0.1","Error en los datos","Modificar","disponibilidadins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("797","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=4","2014-04-26 01:04:00","LU,MA,MI,JU","Array","127.0.0.1","Error en los datos","Modificar","diasasistenciains","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("798","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=4","2014-04-26 01:04:00",""," ","127.0.0.1","Error en los datos","Modificar","observacionins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("799","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=4","2014-04-26 01:04:00","","2","127.0.0.1","Error en los datos","Modificar","tinstitucion_idinstitucion","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("800","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=4","2014-04-26 01:04:00",""," ","127.0.0.1","Error en los datos","Modificar","motivocambioins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("801","http://localhost/antonio/vista/intranet.php?vista=persona/consultar_participante&id=4","2014-04-26 01:04:00",""," ","127.0.0.1","Error en los datos","Modificar","resumendiagnosticoins","tinscripcion","administrador","editar_inscripcion");
INSERT INTO tbitacora VALUES("802","http://localhost/antonio/vista/intranet.php?vista=persona/participante","2014-04-26 01:04:00","1","0","127.0.0.1","No sé utiliza","Eliminar","estatus","participante_familiar","administrador","eliminar_participante");
INSERT INTO tbitacora VALUES("803","http://localhost/antonio/vista/intranet.php?vista=persona/participante","2014-04-26 01:04:00","1","0","127.0.0.1","No sé utiliza","Eliminar","estatuspar","tparticipante","administrador","eliminar_participante");
INSERT INTO tbitacora VALUES("804","http://localhost/antonio/vista/intranet.php?vista=persona/participante","2014-04-26 01:04:00","1","0","127.0.0.1","No sé utiliza","Eliminar","estatusins","tinscripcion","administrador","eliminar_participante");
INSERT INTO tbitacora VALUES("805","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-04-26 01:04:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("806","http://localhost/antonio/vista/intranet.php?vista=seguridad/consultar_servicio&id=115","2014-04-26 01:04:00","reporte/listado_docentes_diagn","reporte/listado_docente_diagno","127.0.0.1","Error en los datos","Modificar","enlaceser","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("807","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-05-01 08:05:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("808","http://localhost/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-05-01 08:05:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("809","http://localhost/antonio/vista/intranet.php?vista=seguridad/consultar_servicio&id=116","2014-05-01 08:05:00","0","1","127.0.0.1","Error en los datos","Modificar","visibleser","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("810","http://localhost/antonio/vista/intranet.php?vista=seguridad/consultar_servicio&id=117","2014-05-01 08:05:00","ayuda/manual_usuario.pdf","ayuda/manual_usuario","127.0.0.1","Error en los datos","Modificar","enlaceser","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("811","http://localhost/antonio/vista/intranet.php?vista=seguridad/consultar_servicio&id=117","2014-05-01 08:05:00","0","1","127.0.0.1","Error en los datos","Modificar","visibleser","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("812","http://localhost/antonio/vista/intranet.php?vista=sistema/configurar","2014-05-01 09:05:00","Socialismo","Socialismo mismo","127.0.0.1","Error en los datos","Modificar","historia","tsistema","Administrador","editar_configuracion");
INSERT INTO tbitacora VALUES("813","http://localhost/antonio/vista/intranet.php?vista=sistema/configurar","2014-05-01 09:05:00","Socialismo mismo","Socialismo ","127.0.0.1","Error en los datos","Modificar","objetivos","tsistema","Administrador","editar_configuracion");
INSERT INTO tbitacora VALUES("814","http://localhost/antonio/vista/intranet.php?vista=sistema/configurar","2014-05-01 09:05:00","Socialismo ","1992","127.0.0.1","Error en los datos","Modificar","historia","tsistema","Administrador","editar_configuracion");
INSERT INTO tbitacora VALUES("815","http://localhost/antonio/vista/intranet.php?vista=sistema/configurar","2014-05-01 09:05:00","1992","Socialismo","127.0.0.1","Error en los datos","Modificar","objetivos","tsistema","Administrador","editar_configuracion");
INSERT INTO tbitacora VALUES("816","http://localhost/Antonio/vista/intranet.php?vista=inscripcion/inscripcion_masiva&id=23","2014-05-27 03:05:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso_tparticipante","administrador","inscribir_curso");
INSERT INTO tbitacora VALUES("817","http://localhost/Antonio/vista/intranet.php?vista=inscripcion/desincorporar_participantes&id=23","2014-05-27 03:05:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso_tparticipante","administrador","desincorporar_curso");
INSERT INTO tbitacora VALUES("818","http://localhost/Antonio/vista/intranet.php?vista=curso/consultar_lapso&id=6","2014-05-27 03:05:00","APERTURADO","Cerrado","127.0.0.1","Error en los datos","Modificar","estadolap","tlapso","administrador","editar_lapso");
INSERT INTO tbitacora VALUES("819","http://localhost/Antonio/vista/intranet.php?vista=curso/consultar_lapso&id=7","2014-05-27 03:05:00","PROGRAMADO","Aperturado","127.0.0.1","Error en los datos","Modificar","estadolap","tlapso","administrador","editar_lapso");
INSERT INTO tbitacora VALUES("820","http://localhost/Antonio/vista/intranet.php?vista=curso/registrar_curso","2014-05-27 03:05:00","","","127.0.0.1","Cargar datos","Registrar","*","tcurso","administrador","registrar_curso");
INSERT INTO tbitacora VALUES("821","http://localhost:8080/antonio/vista/intranet.php?vista=sistema/registrar_noticia","2014-10-16 12:10:00","","","127.0.0.1","Cargar datos","Registrar","*","tnoticia","administrador","registrar_noticia");
INSERT INTO tbitacora VALUES("822","http://localhost:8080/antonio/vista/intranet.php?vista=sistema/consultar_noticia&id=2","2014-10-16 12:10:00","<p>a asdasd asda asdg asdgas d","<p>a asdasd asda asdg asdgas d","127.0.0.1","Error en los datos","Modificar","textonot","tnoticia","administrador","editar_noticia");
INSERT INTO tbitacora VALUES("823","http://localhost:8080/antonio/vista/intranet.php?vista=sistema/consultar_noticia&id=1","2014-10-16 01:10:00","<p>Según los detalles \\\' de l","<p>Según los detalles \' de la","127.0.0.1","Error en los datos","Modificar","textonot","tnoticia","administrador","editar_noticia");
INSERT INTO tbitacora VALUES("824","http://localhost:8080/antonio/vista/intranet.php?vista=sistema/consultar_noticia&id=1","2014-10-16 01:10:00","<p>Según los detalles \\\' de l","<p>Seg&uacute;n los detalles \'","127.0.0.1","Error en los datos","Modificar","textonot","tnoticia","administrador","editar_noticia");
INSERT INTO tbitacora VALUES("825","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/consultar_lapso&id=7","2014-10-23 11:10:00","APERTURADO","Cerrado","127.0.0.1","Error en los datos","Modificar","estadolap","tlapso","administrador","editar_lapso");
INSERT INTO tbitacora VALUES("826","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/consultar_lapso&id=8","2014-10-23 11:10:00","01-01-2016","23-10-2014","127.0.0.1","Error en los datos","Modificar","fechainilap","tlapso","administrador","editar_lapso");
INSERT INTO tbitacora VALUES("827","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/consultar_lapso&id=8","2014-10-23 11:10:00","PROGRAMADO","Programado","127.0.0.1","Error en los datos","Modificar","estadolap","tlapso","administrador","editar_lapso");
INSERT INTO tbitacora VALUES("828","http://localhost:8080/Antonio/vista/intranet.php?vista=curso/consultar_lapso&id=8","2014-10-23 11:10:00","PROGRAMADO","Aperturado","127.0.0.1","Error en los datos","Modificar","estadolap","tlapso","administrador","editar_lapso");
INSERT INTO tbitacora VALUES("829","http://localhost:8080/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-10-28 09:10:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("830","http://localhost:8080/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-10-28 10:10:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("831","http://localhost:8080/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-11-12 10:11:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("832","http://localhost:8080/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-11-12 10:11:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("833","http://localhost:8080/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-11-12 10:11:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("834","http://localhost:8080/antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-11-12 10:11:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("835","http://localhost:8080/antonio/vista/intranet.php?vista=seguridad/consultar_servicio&id=120","2014-11-12 10:11:00","archivo/item.php","archivo/item","127.0.0.1","Error en los datos","Modificar","enlaceser","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("836","http://localhost:8080/antonio/vista/intranet.php?vista=archivo/registrar_item","2014-11-13 03:11:00","","","127.0.0.1","Cargar datos","Registrar","*","titem","administrador","registrar_item");
INSERT INTO tbitacora VALUES("837","http://localhost:8080/antonio/vista/intranet.php?vista=archivo/registrar_item","2014-11-13 04:11:00","","","127.0.0.1","Cargar datos","Registrar","*","titem","administrador","registrar_item");
INSERT INTO tbitacora VALUES("838","http://localhost:8080/antonio/vista/intranet.php?vista=archivo/item","2014-11-13 04:11:00","1","0","127.0.0.1","No sé utiliza","Eliminar","estatusasi","titem","administrador","eliminar_item");
INSERT INTO tbitacora VALUES("839","http://localhost:8080/antonio/vista/intranet.php?vista=archivo/item","2014-11-13 04:11:00","0","1","127.0.0.1","No sé utiliza","Restaurar","estatusasi","titem","administrador","restaurar_item");
INSERT INTO tbitacora VALUES("846","http://localhost:8080/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-11-20 03:11:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("847","http://localhost:8080/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-11-20 03:11:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("848","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/listado_docente_diagnostico","2014-11-19 23:32:55","","1","127.0.0.1","-","Reporte","id_diagnostico","-","administrador","listado_docentes_diagnostico");
INSERT INTO tbitacora VALUES("850","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/planilla_inscripcion","2014-11-19 23:32:06","","8","127.0.0.1","-","Reporte","idparticipante","-","administrador","plantilla_inscripcion");
INSERT INTO tbitacora VALUES("851","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/planilla_inscripcion","2014-11-19 23:32:09","","8","127.0.0.1","-","Reporte","idparticipante","-","administrador","plantilla_inscripcion");
INSERT INTO tbitacora VALUES("852","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/listado_docente_diagnostico","2014-11-19 11:11:00","","1","127.0.0.1","-","Reporte","id_diagnostico","-","administrador","listado_docentes_diagnostico");
INSERT INTO tbitacora VALUES("853","http://localhost:8080/Antonio/vista/intranet.php?vista=seguridad/consultar_bitacora_reporte&id=850","2014-11-19 11:11:00","","8","127.0.0.1","-","Reporte","idparticipante","-","administrador","plantilla_inscripcion");
INSERT INTO tbitacora VALUES("854","http://localhost:8080/Antonio/vista/intranet.php?vista=seguridad/bitacora_reporte","2014-11-19 11:11:00","","8","127.0.0.1","-","Reporte","idparticipante","-","administrador","plantilla_inscripcion");
INSERT INTO tbitacora VALUES("855","http://localhost:8080/Antonio/vista/intranet.php?vista=seguridad/bitacora_reporte","2014-11-19 11:11:00","","1","127.0.0.1","-","Reporte","id_diagnostico","-","administrador","listado_docentes_diagnostico");
INSERT INTO tbitacora VALUES("856","http://localhost:8080/Antonio/vista/intranet.php?vista=seguridad/bitacora_reporte","2014-11-19 11:11:00","","1","127.0.0.1","-","Reporte","id_diagnostico","-","administrador","listado_docentes_diagnostico");
INSERT INTO tbitacora VALUES("857","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/historial_curso","2014-11-19 11:11:00","","16","127.0.0.1","-","Reporte","idcurso","-","administrador","historial_curso");
INSERT INTO tbitacora VALUES("858","http://localhost:8080/Antonio/vista/intranet.php?vista=seguridad/bitacora_reporte","2014-11-19 11:11:00","","16","127.0.0.1","-","Reporte","idcurso","-","administrador","historial_curso");
INSERT INTO tbitacora VALUES("859","http://localhost:8080/Antonio/vista/intranet.php?vista=seguridad/consultar_bitacora_reporte&id=857","2014-11-19 11:11:00","","16","127.0.0.1","-","Reporte","idcurso","-","administrador","historial_curso");
INSERT INTO tbitacora VALUES("860","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/listado_participantes_huerfanos","2014-11-19 11:11:00","","","127.0.0.1","-","Reporte","-","-","administrador","listado_participantes_huerfanos");
INSERT INTO tbitacora VALUES("861","http://localhost:8080/Antonio/vista/intranet.php?vista=seguridad/bitacora_reporte","2014-11-19 11:11:00","","","127.0.0.1","-","Reporte","-","-","administrador","listado_participantes_huerfanos");
INSERT INTO tbitacora VALUES("862","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/listado_participantes_etnia","2014-11-19 11:11:00","","","127.0.0.1","-","Reporte","-","-","administrador","listado_participantes_etnia");
INSERT INTO tbitacora VALUES("863","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/participante_familiar","2014-11-19 11:11:00","","4090412","127.0.0.1","-","Reporte","id","-","administrador","familiar_participante");
INSERT INTO tbitacora VALUES("864","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/historial_participante","2014-11-19 11:11:00","","2","127.0.0.1","-","Reporte","idparticipante","-","administrador","historial_participante");
INSERT INTO tbitacora VALUES("865","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/historial_lapso","2014-11-19 11:11:00","","5","127.0.0.1","-","Reporte","idlapso","-","administrador","historial_lapso");
INSERT INTO tbitacora VALUES("866","http://localhost:8080/Antonio/vista/intranet.php?vista=seguridad/bitacora_reporte","2014-11-19 11:11:00","","5","127.0.0.1","-","Reporte","idlapso","-","administrador","historial_lapso");
INSERT INTO tbitacora VALUES("867","http://localhost:8080/Antonio/vista/intranet.php?vista=seguridad/bitacora_reporte","2014-11-19 11:11:00","","2","127.0.0.1","-","Reporte","idparticipante","-","administrador","historial_participante");
INSERT INTO tbitacora VALUES("868","http://localhost:8080/Antonio/vista/intranet.php?vista=seguridad/bitacora_reporte","2014-11-19 11:11:00","","4090412","127.0.0.1","-","Reporte","id","-","administrador","familiar_participante");
INSERT INTO tbitacora VALUES("869","http://localhost:8080/Antonio/vista/intranet.php?vista=seguridad/bitacora_reporte","2014-11-19 11:11:00","","","127.0.0.1","-","Reporte","-","-","administrador","listado_participantes_etnia");
INSERT INTO tbitacora VALUES("870","http://localhost:8080/Antonio/vista/intranet.php?vista=seguridad/bitacora_reporte","2014-11-19 11:11:00","","","127.0.0.1","-","Reporte","-","-","administrador","listado_participantes_huerfanos");
INSERT INTO tbitacora VALUES("871","http://localhost:8080/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-11-25 02:11:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("872","http://localhost:8080/Antonio/vista/intranet.php?vista=seguridad/consultar_servicio&id=126","2014-11-25 02:11:00","Bloquear Usuario","Bloquear/Desbloquear Usuario","127.0.0.1","Error en los datos","Modificar","nombreser","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("873","http://localhost:8080/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-11-25 02:11:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("874","http://localhost:8080/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-11-25 02:11:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("875","http://localhost:8080/Antonio/vista/intranet.php?vista=sistema/configurar","2014-11-25 04:11:00","","15","127.0.0.1","Error en los datos","Modificar","tiempoconexion","tsistema","administrador","editar_configuracion");
INSERT INTO tbitacora VALUES("876","http://localhost:8080/Antonio/vista/intranet.php?vista=sistema/configurar","2014-11-25 04:11:00","15","20","127.0.0.1","Error en los datos","Modificar","tiempoconexion","tsistema","administrador","editar_configuracion");
INSERT INTO tbitacora VALUES("877","http://localhost:8080/Antonio/vista/intranet.php?vista=sistema/configurar","2014-11-25 04:11:00","20","15","127.0.0.1","Error en los datos","Modificar","tiempoconexion","tsistema","administrador","editar_configuracion");
INSERT INTO tbitacora VALUES("878","http://localhost:8080/Antonio/vista/intranet.php?vista=persona/registrar_personal","2014-11-25 06:11:00","","","127.0.0.1","Cargar datos","Registrar","*","tpersonal","administrador","registrar_personal");
INSERT INTO tbitacora VALUES("879","http://localhost:8080/Antonio/vista/intranet.php?vista=sistema/configurar","2014-11-25 06:11:00","1234567","12345678","127.0.0.1","Error en los datos","Modificar","clavepredeterminada","tsistema","administrador","editar_configuracion");
INSERT INTO tbitacora VALUES("880","http://localhost:8080/Antonio/vista/intranet.php?vista=seguridad/registrar_servicio","2014-11-25 06:11:00","","","127.0.0.1","Cargar datos","Registrar","*","tservicio","administrador","registrar_servicio");
INSERT INTO tbitacora VALUES("881","http://localhost:8080/Antonio/vista/intranet.php?vista=seguridad/primera_vez","2014-11-25 06:11:00","","","127.0.0.1","Cargar datos","Registrar","*","tpregunta","20276546","primera_vez");
INSERT INTO tbitacora VALUES("882","http://localhost:8080/Antonio/vista/intranet.php?vista=seguridad/primera_vez","2014-11-25 06:11:00","","","127.0.0.1","Cargar datos","Registrar","*","tpregunta","20276546","primera_vez");
INSERT INTO tbitacora VALUES("883","http://localhost:8080/Antonio/vista/intranet.php?vista=seguridad/consultar_servicio&id=98","2014-11-25 06:11:00","seguridad/consultar_datos","seguridad/consultar_usuario","127.0.0.1","Error en los datos","Modificar","enlaceser","tservicio","administrador","editar_servicio");
INSERT INTO tbitacora VALUES("884","http://localhost:8080/Antonio/vista/intranet.php?vista=reporte/planilla_inscripcion","2014-11-25 02:11:00","","2","127.0.0.1","-","Reporte","idparticipante","-","20276546","plantilla_inscripcion");



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
  CONSTRAINT `fk_tclave_tusuario1` FOREIGN KEY (`tusuario_idusuario`) REFERENCES `tusuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

INSERT INTO tclave VALUES("1","d5aa170e875913b89d169c57b96b452548fabfff","2014-01-25","2014-02-13","0","administrador");
INSERT INTO tclave VALUES("2","20eabe5d64b0e216796e834f52d61fd0b70332fc","2014-02-13","2014-06-13","1","20158248");
INSERT INTO tclave VALUES("3","f7c3bc1d808e04732adf679965ccc34ca7ae3441","2014-02-13","2014-10-15","0","administrador");
INSERT INTO tclave VALUES("4","20eabe5d64b0e216796e834f52d61fd0b70332fc","2014-02-17","2014-06-17","1","4090423");
INSERT INTO tclave VALUES("5","20eabe5d64b0e216796e834f52d61fd0b70332fc","2014-02-17","2014-06-17","1","4090420");
INSERT INTO tclave VALUES("6","20eabe5d64b0e216796e834f52d61fd0b70332fc","2014-02-27","2014-06-27","1","19023142");
INSERT INTO tclave VALUES("7","20eabe5d64b0e216796e834f52d61fd0b70332fc","2014-04-04","2014-04-04","0","10328765");
INSERT INTO tclave VALUES("8","7c222fb2927d828af22f592134e8932480637c0d","2014-04-04","2014-08-02","1","10328765");
INSERT INTO tclave VALUES("9","a1ea88131cd3c74cee8e3f0712bfb707abe0e761","2014-10-15","2015-02-12","1","administrador");
INSERT INTO tclave VALUES("10","7c222fb2927d828af22f592134e8932480637c0d","2014-11-25","2014-11-25","0","20276546");
INSERT INTO tclave VALUES("11","741b25287d67df7f60127fe4b84067c2ae79a0db","2014-11-25","2015-03-25","1","20276546");



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
  PRIMARY KEY (`idcurso`),
  KEY `fk_tcurso_tlapso1_idx` (`tlapso_idlapso`),
  KEY `fk_tcurso_tgrupo1_idx` (`tgrupo_idgrupo`),
  KEY `tasignatura_idasignatura` (`tasignatura_idasignatura`),
  KEY `taula_idaula` (`taula_idaula`),
  CONSTRAINT `fk_tcurso_taula_1` FOREIGN KEY (`taula_idaula`) REFERENCES `taula` (`idaula`),
  CONSTRAINT `fk_tcurso_tgrupo1` FOREIGN KEY (`tgrupo_idgrupo`) REFERENCES `tgrupo` (`idgrupo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tcurso_tlapso1` FOREIGN KEY (`tlapso_idlapso`) REFERENCES `tlapso` (`idlapso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tcurso_ibfk_1` FOREIGN KEY (`tasignatura_idasignatura`) REFERENCES `tasignatura` (`idasignatura`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

INSERT INTO tcurso VALUES("16","GRUPO INFANTIL - BRAILLE 1","","30","2","5","2","1","2");
INSERT INTO tcurso VALUES("17","GRUPO INFANTIL - INFORMATICA 1","","10","2","5","2","3","1");
INSERT INTO tcurso VALUES("18","GRUPO ADULTO - BRAILLE 1","","20","2","5","3","1","2");
INSERT INTO tcurso VALUES("19","GRUPO ADULTO - INFORMATICA 1","","10","2","5","3","3","1");
INSERT INTO tcurso VALUES("20","GRUPO MAYOR - BRAILLE 2","","20","2","5","4","2","2");
INSERT INTO tcurso VALUES("21","GRUPO MAYOR - INFORMATICA 2","","10","2","5","4","4","1");
INSERT INTO tcurso VALUES("22","GRUPO JOVEN - BRAILLE 1","","10","2","6","1","1","1");
INSERT INTO tcurso VALUES("23","GRUPO ADULTO - BRAILLE 1","","10","2","6","3","1","1");
INSERT INTO tcurso VALUES("24","GRUPO ADULTO - INFORMATICA 1","","20","2","6","3","3","2");
INSERT INTO tcurso VALUES("25","GRUPO MAYOR - BRAILLE 1","","10","2","6","4","1","1");
INSERT INTO tcurso VALUES("26","GRUPO JOVEN - BRAILLE 1","","30","2","7","1","1","2");
INSERT INTO tcurso VALUES("27","GRUPO JOVEN - INFORMATICA 1","","10","2","7","1","3","1");
INSERT INTO tcurso VALUES("28","GRUPO INFANTIL - BRAILLE 1","","30","2","7","2","1","2");
INSERT INTO tcurso VALUES("29","GRUPO INFANTIL - INFORMATICA 1","","10","2","7","2","3","1");
INSERT INTO tcurso VALUES("30","GRUPO ADULTO - BRAILLE 2","","30","2","7","3","2","2");
INSERT INTO tcurso VALUES("31","GRUPO ADULTO - INFORMATICA 2","","10","2","7","3","4","1");
INSERT INTO tcurso VALUES("32","GRUPO MAYOR - BRAILLE 2","","30","2","7","4","2","2");
INSERT INTO tcurso VALUES("33","GRUPO MAYOR - INFORMATICA 2","","10","2","7","4","4","1");



DROP TABLE tcurso_tparticipante;

CREATE TABLE `tcurso_tparticipante` (
  `idcurso_participante` int(11) NOT NULL AUTO_INCREMENT,
  `tcurso_idcurso` int(11) NOT NULL,
  `tparticipante_idparticipante` int(11) NOT NULL,
  `estatus` char(1) DEFAULT '1',
  PRIMARY KEY (`idcurso_participante`),
  KEY `fk_tgrupo_has_tinscripcion_tgrupo1_idx` (`tcurso_idcurso`),
  KEY `fk_tcurso_tinscripcion_tparticipante1_idx` (`tparticipante_idparticipante`),
  CONSTRAINT `fk_tcurso_idcurso` FOREIGN KEY (`tcurso_idcurso`) REFERENCES `tcurso` (`idcurso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tcurso_tparticipante_ibfk_1` FOREIGN KEY (`tparticipante_idparticipante`) REFERENCES `tparticipante` (`idparticipante`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

INSERT INTO tcurso_tparticipante VALUES("15","23","4","2");
INSERT INTO tcurso_tparticipante VALUES("16","24","4","1");
INSERT INTO tcurso_tparticipante VALUES("17","25","8","2");
INSERT INTO tcurso_tparticipante VALUES("18","23","5","2");
INSERT INTO tcurso_tparticipante VALUES("19","24","5","2");
INSERT INTO tcurso_tparticipante VALUES("20","25","7","1");
INSERT INTO tcurso_tparticipante VALUES("21","23","9","2");
INSERT INTO tcurso_tparticipante VALUES("25","24","9","2");
INSERT INTO tcurso_tparticipante VALUES("26","23","9","1");
INSERT INTO tcurso_tparticipante VALUES("27","24","9","1");
INSERT INTO tcurso_tparticipante VALUES("28","22","13","1");
INSERT INTO tcurso_tparticipante VALUES("29","23","11","2");
INSERT INTO tcurso_tparticipante VALUES("30","23","12","2");
INSERT INTO tcurso_tparticipante VALUES("31","30","9","1");
INSERT INTO tcurso_tparticipante VALUES("32","31","9","1");
INSERT INTO tcurso_tparticipante VALUES("33","32","8","1");
INSERT INTO tcurso_tparticipante VALUES("34","33","8","1");



DROP TABLE tcurso_unidad;

CREATE TABLE `tcurso_unidad` (
  `tcurso_idcurso` int(11) NOT NULL,
  `tunidad_idunidad` int(11) NOT NULL,
  PRIMARY KEY (`tcurso_idcurso`),
  KEY `fk_tcurso_unidad_tunidad_1` (`tunidad_idunidad`),
  CONSTRAINT `fk_tcurso_unidad_tcurso_1` FOREIGN KEY (`tcurso_idcurso`) REFERENCES `tcurso` (`idcurso`),
  CONSTRAINT `fk_tcurso_unidad_tunidad_1` FOREIGN KEY (`tunidad_idunidad`) REFERENCES `tunidad` (`idunidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;




DROP TABLE tdiagnostico;

CREATE TABLE `tdiagnostico` (
  `iddiagnostico` int(11) NOT NULL AUTO_INCREMENT,
  `descripciondia` varchar(65) NOT NULL,
  `estatusdia` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`iddiagnostico`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO tdiagnostico VALUES("1","SANO","1");
INSERT INTO tdiagnostico VALUES("2","CEGUERA LEVE","1");
INSERT INTO tdiagnostico VALUES("3","CEGUERA MODERADA","1");
INSERT INTO tdiagnostico VALUES("4","CEGUERA GRAVE","1");



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

INSERT INTO tdocente VALUES("V","15491963","ANTONIO","JULIAN","SPADARO","DOMINGUEZ","M","1985-02-01","LLANO ALTO","02553252353","","TSU","ESPECIALISTA","1","1","2");
INSERT INTO tdocente VALUES("V","20158248","HENDIMAR","ANDREINA","ROSENDO","GIMENEZ","F","1991-06-07","URB. SAN JOSE II ARAURE, EDO PORTUGUESA.","04245026299","","T.S.U. INFORMATICA","ESPECIALISTA","1","1","3");
INSERT INTO tdocente VALUES("V","202342342","JULIAN","","CASTILLO","","M","2011-06-01","VILLA ARAURE","34523463246","","PSICOPEDAGOGO","ESPECIALISTA","1","4","6");



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
  CONSTRAINT `fk_tevaluacion_tcurso_tparticipante_1` FOREIGN KEY (`idcurso_idparticipante`) REFERENCES `tcurso_tparticipante` (`idcurso_participante`),
  CONSTRAINT `fk_tevaluacion_tinstrumento_1` FOREIGN KEY (`tinstrumento_idinstrumento`) REFERENCES `tinstrumento` (`idinstrumento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;




DROP TABLE tevaluacion_item;

CREATE TABLE `tevaluacion_item` (
  `tevaluacion_idevaluacion` int(11) NOT NULL,
  `titem_iditem` int(11) NOT NULL,
  `valor` varchar(500) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`tevaluacion_idevaluacion`),
  KEY `fk_tevaluacion_item_titem_1` (`titem_iditem`),
  CONSTRAINT `fk_tevaluacion_item_tevaluacion_1` FOREIGN KEY (`tevaluacion_idevaluacion`) REFERENCES `tevaluacion` (`idevaluacion`),
  CONSTRAINT `fk_tevaluacion_item_titem_1` FOREIGN KEY (`titem_iditem`) REFERENCES `titem` (`iditem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;




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

INSERT INTO tfamiliar VALUES("V","10425235","JACQUELIN","","MENDEZ","","F","04145236236","","1970-07-29","ACARIGUA, RESIDENCIAS PAEZ","MAESTRA","TECNICO SUPERIOR","2","5000","4","1","0");
INSERT INTO tfamiliar VALUES("V","10452352","MARIA","MAGDALENA","ORTIZ","PEREZ","F","02556236236","","1970-06-22","LA FUNDACIóN MENDOZA CASA 2","AMA DE CASA","BACHILLERATO","2","0","1","1","2");
INSERT INTO tfamiliar VALUES("V","10768890","JESUS","ALBERTO","LINAREZ","PEREZ","M","02556765433","","1970-02-17","ARAURE","ALBAÑIL","BACHILLERATO","2","6000","4","1","0");
INSERT INTO tfamiliar VALUES("V","10898234","MARIA","GRACIA","BETANCOURT","LOPEZ","F","041412512534","","1970-02-03","BARAURE 1","OBRERO","BACHILLERATO","2","5000","4","1","0");
INSERT INTO tfamiliar VALUES("V","12352523","MIGUEL","","PONCIO","PILATOS","M","02552623623","","1980-02-01","ACARIGUA, LOS CORTIJOS","FILóSOFO","DOCTORADO","1","500","4","1","0");
INSERT INTO tfamiliar VALUES("V","14325235","JULIAN","","PATRON","","M","04124532523","","1979-07-17","PAYARA","AGRICULTOR","BACHILLERATO","1","5000","1","1","6");
INSERT INTO tfamiliar VALUES("V","19239857","CARLOS","","SOTO","","M","04145213523","","1989-03-14","MARACAIBO","ESTUDIANTE","TECNICO SUPERIOR","1","8000","4","1","0");
INSERT INTO tfamiliar VALUES("V","20272773","JOSé","MARIA","COLMENARES","ROMO","M","02552362363","","1990-03-01","LOS APAMATES","ALBAñIL","BACHILLER","1","3500","4","1","0");
INSERT INTO tfamiliar VALUES("V","20490356","MIGUEL","ANGEL","TORREZ","CASTILLO","M","02554363463","","1990-05-14","LOS CORTIJOS","ESTUDIANTE","BACHILLERATO","1","0","4","1","0");
INSERT INTO tfamiliar VALUES("V","23235236","LAURA","","PEREZ","","F","02415235236","","1996-02-13","VALENCIA","ESTUDIANTE","BACHILLERATO","0","0","4","1","0");
INSERT INTO tfamiliar VALUES("V","4090412","LUIS","JORGE","MOSQUERA","MARTINS","M","02413151251","","1958-02-28","VALENCIA","CHOFER","BACHILLER","2","4000","4","1","0");
INSERT INTO tfamiliar VALUES("V","5098876","LUIS","","PEREZ","","F","02556236236","","1960-06-14","DVSEDBV","TRANSPORTISTA","PRIMARIA","2","6000","4","1","0");
INSERT INTO tfamiliar VALUES("V","7090413","LUIS","","SOTO","","M","04144363644","","1969-06-08","ACARIGUA,RESIDENCIAS PAEZ","ELECTRICISTA","BACHILLERATO","2","5000","4","1","0");
INSERT INTO tfamiliar VALUES("V","9436326","VICTOR","JESUS","ESPERANZA","GONZALES","M","04125236236","","1969-05-05","LA FUNDACIóN MENDOZA","OBRERO","TECNICO MEDIO","2","5000","1","1","2");



DROP TABLE tgrupo;

CREATE TABLE `tgrupo` (
  `idgrupo` int(11) NOT NULL AUTO_INCREMENT,
  `nombregru` varchar(45) NOT NULL,
  `descripciongru` varchar(45) DEFAULT NULL,
  `estatusgru` int(11) NOT NULL DEFAULT '1',
  `edadmin` char(2) NOT NULL,
  `edadmax` char(2) NOT NULL,
  PRIMARY KEY (`idgrupo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO tgrupo VALUES("1","GRUPO JOVEN","GRUPO DE JOVENES DE LA PATRIA. ","1","12","19");
INSERT INTO tgrupo VALUES("2","GRUPO INFANTIL","GRUPO DE NIñOS CON DISCAPACIDAD VISUAL.","1","4","11");
INSERT INTO tgrupo VALUES("3","GRUPO ADULTO","GRUPO DE PERSONAS MAYORES DE EDAD","1","20","50");
INSERT INTO tgrupo VALUES("4","GRUPO MAYOR","PERSONAS DE LA TERCERA EDAD","1","50","99");



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
  PRIMARY KEY (`idinscripcion`),
  KEY `fk_tinscripcion_tparticipante1_idx` (`idparticipante`),
  KEY `fk_tinscripcion_tinstitucion1_idx` (`tinstitucion_idinstitucion`),
  CONSTRAINT `fk_tinscripcion_tparticipante` FOREIGN KEY (`idparticipante`) REFERENCES `tparticipante` (`idparticipante`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

INSERT INTO tinscripcion VALUES("2","5","7","C","2014-03-05","MAÑANA","LU,MA,MI,JU","  ","20577777.jpeg","1","1","1","1","1","0"," ENFERMEDAD "," POSEE UNA CEGUERA LEVE, PERO CON EL TIEMPO A IDO EMPEORANDO ");
INSERT INTO tinscripcion VALUES("3","7","","","2014-03-05","MAÑANA","LU,MI,VI","      ","4043252.jpeg","1","0","1","1","0","0"," ENFERMEDAD     ","  POSEE UNA CEGUERA LEVE, PERO CON EL TIEMPO A IDO EMPEORANDO     ");
INSERT INTO tinscripcion VALUES("4","8","","","2014-03-07","MAÑANA","LU,MI,VI","              ","4090456.jpeg","1","1","1","1","1","0","              ","   POSEE UNA CEGUERA LEVE, PERO CON EL TIEMPO A IDO EMPEORANDO             ");
INSERT INTO tinscripcion VALUES("5","9","9","C","2014-03-07","MAÑANA","LU,MA,JU,VI","  ","20908764.jpeg","1","1","1","1","1","1","  ","  ");
INSERT INTO tinscripcion VALUES("6","10","1ER AñO","C","2014-03-07","MAÑANA","LU,MI,VI","             ","13534635.jpeg","1","1","1","1","1","0","             ","             ");
INSERT INTO tinscripcion VALUES("7","11","8VO","A","2014-03-07","MAÑANA","LU,MA,MI,VI","                    ","20325352.jpeg","1","1","1","1","1","1","   PROBLEMAS DE TRANSPORTE                 ","                    ");
INSERT INTO tinscripcion VALUES("8","12","","","2014-03-07","MAÑANA","LU,MI,VI","                ","19789657.jpeg","1","1","1","1","0","0","   PROBLEMAS DE TRANSPORTE             ","                ");
INSERT INTO tinscripcion VALUES("9","13","","","2014-04-15","MAÑANA","LU,MI,VI","  ","23532453.jpeg","1","1","1","1","1","0","  ","  ");
INSERT INTO tinscripcion VALUES("10","2","","","2014-04-17","MAÑANA","LU,MA,MI,JU"," ","2352345.jpeg","1","1","1","1","0","0"," "," ");
INSERT INTO tinscripcion VALUES("11","4","","","2014-04-20","MAÑANA","LU,MA,MI,JU"," ","20577777.jpeg","1","1","1","0","0","0"," "," ");



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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO tinstitucion VALUES("1","CAIDV","CRUZ ROJA","YO","1","2");
INSERT INTO tinstitucion VALUES("2","GENERAL PáEZ","CENTRO DE ACARIGUA","JUAN TORREZ","1","2");
INSERT INTO tinstitucion VALUES("3","HILARIóN LóPEZ","ARAURE, DETRAS DE LA POLAR","RUBERT OLIVARES","1","3");



DROP TABLE tinstrumento;

CREATE TABLE `tinstrumento` (
  `idinstrumento` int(11) NOT NULL AUTO_INCREMENT,
  `nombreins` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `tasignatura_idasignatura` int(11) NOT NULL,
  `estatusins` char(1) COLLATE utf8_spanish2_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`idinstrumento`),
  KEY `fk_tinstrumento_tasignatura_1` (`tasignatura_idasignatura`),
  CONSTRAINT `fk_tinstrumento_tasignatura_1` FOREIGN KEY (`tasignatura_idasignatura`) REFERENCES `tasignatura` (`idasignatura`),
  CONSTRAINT `fk_tinstrumento_tinstrumento_item_1` FOREIGN KEY (`idinstrumento`) REFERENCES `tinstrumento_item` (`tinstrumento_idinstrumento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;




DROP TABLE tinstrumento_item;

CREATE TABLE `tinstrumento_item` (
  `tinstrumento_idinstrumento` int(11) NOT NULL,
  `titem_iditem` int(11) NOT NULL,
  PRIMARY KEY (`tinstrumento_idinstrumento`),
  KEY `fk_tinstrumento_item_titem_1` (`titem_iditem`),
  CONSTRAINT `fk_tinstrumento_item_titem_1` FOREIGN KEY (`titem_iditem`) REFERENCES `titem` (`iditem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;




DROP TABLE titem;

CREATE TABLE `titem` (
  `iditem` int(11) NOT NULL AUTO_INCREMENT,
  `nombreite` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcionite` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `tipoite` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `estatusite` char(1) COLLATE utf8_spanish2_ci DEFAULT '1',
  PRIMARY KEY (`iditem`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO titem VALUES("1","MANEJO DE LA REGLA","INDICA EL NIVEL DE USO DE LA REGLA POR PARTE DEL PARTICIPANTE","radio","1");
INSERT INTO titem VALUES("2","MANEJO DEL ABECEDARIO","INDICA SI EL PARTICIPANTE MANEJA EL ABECEDARIO","radio","1");



DROP TABLE tlapso;

CREATE TABLE `tlapso` (
  `idlapso` int(11) NOT NULL AUTO_INCREMENT,
  `nombrelap` varchar(45) NOT NULL,
  `fechainilap` date DEFAULT NULL,
  `fechafinlap` date DEFAULT NULL,
  `estadolap` varchar(45) NOT NULL,
  `estatuslap` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idlapso`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

INSERT INTO tlapso VALUES("5","LAPSO ACADEMICO 2014-I","2014-04-06","2014-11-01","CERRADO","1");
INSERT INTO tlapso VALUES("6","LAPSO ACADEMICO 2014-II","2014-11-02","2015-05-30","CERRADO","1");
INSERT INTO tlapso VALUES("7","LAPSO ACADEMICO 2015-I","2015-05-31","2015-12-26","CERRADO","1");
INSERT INTO tlapso VALUES("8","LAPSO ACADEMICO 2016-I","2014-10-23","2016-07-28","APERTURADO","1");
INSERT INTO tlapso VALUES("9","LAPSO ACADEMICO 2016-II","2016-07-29","2017-02-23","PROGRAMADO","1");



DROP TABLE tlocalidad;

CREATE TABLE `tlocalidad` (
  `idlocalidad` int(11) NOT NULL AUTO_INCREMENT,
  `descripcionloc` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estatusloc` tinyint(1) NOT NULL DEFAULT '1',
  `tmunicipio_municipio` int(11) NOT NULL,
  PRIMARY KEY (`idlocalidad`),
  KEY `fk_tlocalidad_tmunicipio1_idx` (`tmunicipio_municipio`),
  CONSTRAINT `fk_tlocalidad_tmunicipio1` FOREIGN KEY (`tmunicipio_municipio`) REFERENCES `tmunicipio` (`idmunicipio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO tlocalidad VALUES("1","CAIDV","0","1");
INSERT INTO tlocalidad VALUES("2","ACARIGUA","1","1");
INSERT INTO tlocalidad VALUES("3","PARROQUIA ARAURE","1","3");
INSERT INTO tlocalidad VALUES("4","RIO ACARIGUA","1","3");
INSERT INTO tlocalidad VALUES("5","LA LUCIA","1","3");
INSERT INTO tlocalidad VALUES("6","PAYARA","1","1");
INSERT INTO tlocalidad VALUES("7","PIMPINELA ","1","1");
INSERT INTO tlocalidad VALUES("8","RAMóN PERAZA","1","1");



DROP TABLE tmodulo;

CREATE TABLE `tmodulo` (
  `idmodulo` int(11) NOT NULL AUTO_INCREMENT,
  `nombremod` varchar(30) NOT NULL,
  `estatusmod` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idmodulo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

INSERT INTO tmodulo VALUES("1","Administrar","1");
INSERT INTO tmodulo VALUES("2","Maestras","1");
INSERT INTO tmodulo VALUES("3","Curso","1");
INSERT INTO tmodulo VALUES("4","Persona","1");
INSERT INTO tmodulo VALUES("5","Seguridad","1");
INSERT INTO tmodulo VALUES("6","Reportes","1");
INSERT INTO tmodulo VALUES("7","Ayuda","1");
INSERT INTO tmodulo VALUES("8","Inscripción","1");
INSERT INTO tmodulo VALUES("9","Perfil","1");



DROP TABLE tmodulo_trol;

CREATE TABLE `tmodulo_trol` (
  `idmodulo` int(11) NOT NULL,
  `idrol` int(11) NOT NULL,
  `orden` int(11) NOT NULL,
  PRIMARY KEY (`idmodulo`,`idrol`),
  KEY `fk_tmodulo_has_trol_trol1_idx` (`idrol`),
  KEY `fk_tmodulo_has_trol_tmodulo1_idx` (`idmodulo`),
  CONSTRAINT `fk_tmodulo_has_trol_tmodulo1` FOREIGN KEY (`idmodulo`) REFERENCES `tmodulo` (`idmodulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tmodulo_has_trol_trol1` FOREIGN KEY (`idrol`) REFERENCES `trol` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO tmodulo_trol VALUES("1","1","1");
INSERT INTO tmodulo_trol VALUES("2","1","2");
INSERT INTO tmodulo_trol VALUES("3","1","3");
INSERT INTO tmodulo_trol VALUES("3","2","1");
INSERT INTO tmodulo_trol VALUES("3","3","1");
INSERT INTO tmodulo_trol VALUES("4","1","5");
INSERT INTO tmodulo_trol VALUES("4","3","3");
INSERT INTO tmodulo_trol VALUES("5","1","6");
INSERT INTO tmodulo_trol VALUES("6","1","7");
INSERT INTO tmodulo_trol VALUES("6","3","5");
INSERT INTO tmodulo_trol VALUES("7","1","8");
INSERT INTO tmodulo_trol VALUES("7","3","6");
INSERT INTO tmodulo_trol VALUES("8","1","4");
INSERT INTO tmodulo_trol VALUES("8","3","2");
INSERT INTO tmodulo_trol VALUES("9","3","4");



DROP TABLE tmunicipio;

CREATE TABLE `tmunicipio` (
  `idmunicipio` int(11) NOT NULL AUTO_INCREMENT,
  `descripcionmun` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estatusmun` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idmunicipio`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO tmunicipio VALUES("1","PÁEZ","1");
INSERT INTO tmunicipio VALUES("2","ARAURE","0");
INSERT INTO tmunicipio VALUES("3","ARAURE","1");
INSERT INTO tmunicipio VALUES("4","ESTELLER","1");



DROP TABLE tnoticia;

CREATE TABLE `tnoticia` (
  `idnoticia` int(11) NOT NULL AUTO_INCREMENT,
  `titulonot` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `textonot` text CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `imagennot` varchar(45) NOT NULL,
  `fechanot` date NOT NULL,
  `estatusnot` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idnoticia`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO tnoticia VALUES("1","¡CORRUPTO Y DELINCUENTE! ACTUAL DUEÑO DE GLOBOVISIÓN ES DEMANDADO ES EEUU","<p>Seg&uacute;n los detalles \\\' de la denuncia interpuesta ante la&nbsp;<strong>Embajada de Estados Unidos en Venezuela</strong>,&nbsp;<strong>Ra&uacute;l Antonio Gorr&iacute;n</strong>&nbsp;se sirvi&oacute; del diferencial cambiario venezolano para adquirir &ldquo;<strong>desproporcionadas ganancias</strong>&rdquo;. \\\'Una vez que obten&iacute;a los&nbsp;<strong>d&oacute;lares preferenciales</strong>, se los llevaba al pa&iacute;s norteamericano para darles &ldquo;<strong>apariencia</strong>&rdquo; de legalidad.<span id=\"\\&quot;\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;more-7300\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\&quot;\"></span></p>\n<p>Una vez m&aacute;s el cuestionado&nbsp;<strong>el actual due&ntilde;o del canal de noticias Globovisi&oacute;n</strong>&nbsp;es se&ntilde;alado de corrupto y delincuente. Esta vez las denuncias traspasaron las fronteras.&nbsp;<strong>Ra&uacute;l Antonio Gorr&iacute;n Belisario, un nombre que ya se escucha en las oficinas de las leyes estadounidenses</strong>.</p>\n<p>&nbsp;</p>\n<p>De acuerdo con portales locales de noticias, lavado de dinero ser&iacute;a uno de los delitos m&aacute;s graves que estar&iacute;a cometiendo Gorr&iacute;n en los Estados Unidos.&nbsp;<strong>Para las leyes internacionales este delito repercute en todas las naciones y es la segunda denuncia interpuesta contra el empresario por blanqueo de capitales.</strong></p>\n<p>Seg&uacute;n los detalles de la denuncia interpuesta ante la Embajada de Estados Unidos en Venezuela, Gorr&iacute;n se sirvi&oacute; del diferencial cambiario venezolano para adquirir &ldquo;<strong>desproporcionadas ganancias</strong>&rdquo;.</p>\n<p>&nbsp;</p>","Raul-Gorrin-Globovision-Venezuela-800x533.jpg","2014-03-06","1");
INSERT INTO tnoticia VALUES("2","NOTICIA DEL VIERNES, Y DEL LUNES","<p>a asdasd asda asdg asdgas dgasd gasdg a asdasd asda asdg asdgas dgasd gasdga asdasd asda asdg asdgas dgasd gasdga asdasd asda asdg asdgas dgasd gasdga asdasd asda asdg asdgas dgasd gasdga asdasd asda asdg asdgas dgasd gasdga asdasd asda asdg asdgas dgasd gasdga asdasd asda asdg asdgas dgasd gasdga asdasd asda asdg asdgas dgasd gasdga asdasd asda asdg asdgas dgasd gasdg.</p>","angelica.png","2014-10-16","1");



DROP TABLE tobjetivo;

CREATE TABLE `tobjetivo` (
  `idobjetivo` int(11) NOT NULL AUTO_INCREMENT,
  `nombreobj` varchar(500) COLLATE utf8_spanish2_ci NOT NULL,
  `contenidoobj` text COLLATE utf8_spanish2_ci NOT NULL,
  `estatusobj` char(1) COLLATE utf8_spanish2_ci NOT NULL DEFAULT '1',
  `tunidad_idunidad` int(11) NOT NULL,
  PRIMARY KEY (`idobjetivo`),
  KEY `fk_tobjetivo_tunidad_1` (`tunidad_idunidad`),
  CONSTRAINT `fk_tobjetivo_tunidad_1` FOREIGN KEY (`tunidad_idunidad`) REFERENCES `tunidad` (`idunidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;




DROP TABLE tparentesco;

CREATE TABLE `tparentesco` (
  `idparentesco` int(11) NOT NULL AUTO_INCREMENT,
  `descripcionpar` varchar(45) NOT NULL,
  `estatuspar` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idparentesco`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

INSERT INTO tparentesco VALUES("1","PADRE","1");
INSERT INTO tparentesco VALUES("2","MADRE","1");
INSERT INTO tparentesco VALUES("3","HERMANO","1");
INSERT INTO tparentesco VALUES("4","TIO","1");
INSERT INTO tparentesco VALUES("5","TIA","1");
INSERT INTO tparentesco VALUES("6","ABUELO","1");
INSERT INTO tparentesco VALUES("7","ABUELA","1");



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
  PRIMARY KEY (`idparticipante`),
  KEY `fk_tparticipante_tdiagnostico1_idx` (`tdiagnostico_iddiagnostico`),
  KEY `fk_tparticipante_tinstitucion1_idx` (`tinstitucion_idinstitucion`),
  KEY `tlocalidad_idlocalidad` (`tlocalidad_idlocalidad`),
  CONSTRAINT `fk_tparticipante_tdiagnostico1` FOREIGN KEY (`tdiagnostico_iddiagnostico`) REFERENCES `tdiagnostico` (`iddiagnostico`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

INSERT INTO tparticipante VALUES("2","V","2352345","JULIAN","MIGHEL","GONZALES","PEROZA","M","02556235423","","EGAWEGWEG","2000-07-17","1","URBANO","ALQUILADA","INAVI","1","0","1","2","1","1");
INSERT INTO tparticipante VALUES("4","V","20577777","LUIS","FERNANDO","PEREZ","CONTRERAS","M","04125293863","","ACARIGUA,BELLAS ARTES, CASA 6265","1991-06-01","2","URBANO","PROPIA","INAVI","0","1","1","2","2","0");
INSERT INTO tparticipante VALUES("5","V","20577777","LUIS","FERNANDO","PEREZ","CONTRERAS","M","04125293863","","ACARIGUA,BELLAS ARTES, CASA 6265","1991-06-01","2","URBANO","PROPIA","INAVI","0","1","1","2","2","1");
INSERT INTO tparticipante VALUES("7","V","4043252","MIGUEL","ANGEL","TORREZ","FERNANDEZ","M","02555362362","","LOS CORTIJOS","1960-02-16","2","RURAL","PROPIA","INAVI","0","1","2","3","0","1");
INSERT INTO tparticipante VALUES("8","V","4090456","LISANDRO","","RUIZ","","M","04125125125","","ARAURE","1956-01-27","1","RURAL","PROPIA","INAVI","0","No","1","2","1","1");
INSERT INTO tparticipante VALUES("9","V","20908764","CARLOS","ALBERTO","SOTO","MENDEZ","M","04125235236","","ACARIGUA, RESIDENCIAS PAEZ","1989-02-08","1","URBANO","PROPIA","INAVI","0","No","1","2","2","1");
INSERT INTO tparticipante VALUES("10","V","13534635","MIJAILOVICH","","KROKATOV","","M","02918572837","","ASDASD","2010-02-02","1","URBANO","PROPIA","BLOQUES Y ZINC","1","1","1","2","2","1");
INSERT INTO tparticipante VALUES("11","E","20325352","JORGE","","SOTO","MENDEZ","M","04125125125","","ACARIGUA, RESIDENCIAS PAEZ","1990-02-01","2","RURAL","PROPIA","INAVI","1","1","4","2","0","1");
INSERT INTO tparticipante VALUES("12","V","19789657","JESUS","","LINAREZ","","M","02556763678","","ARAURE","1989-07-25","2","URBANO","PROPIA","INAVI","0","No","4","3","0","1");
INSERT INTO tparticipante VALUES("13","V","23532453","VICTOR","JULIO","ESPERANZA","ORTIZ","M","04143453463","","LA FUNDACIóN MEDOZA CASA 2","2000-02-09","1","URBANO","PROPIA","INAVI","0","No","2","2","0","1");



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
INSERT INTO tpersonal VALUES("V","10328765","MARIA","","CASTILLO","","F","1974-06-24","maria.castillo@gmail.com","BARAURE","02556227382","DOCENTE ESPECIALISTA","1","1","3");
INSERT INTO tpersonal VALUES("V","19023142","JESUS","","CONTRERA","","M","1990-06-01","jesus.contrera@gmail.com","Araure","02552362362","DOCENTE","1","4","0");
INSERT INTO tpersonal VALUES("V","20158248","PETRA","ANDREA","PEREZ","RODRIGUEZ","F","1976-03-09","petraperez@gmail.com","URB. PRADOS DEL SOL","04127415151","SECRETARIA","1","1","4");
INSERT INTO tpersonal VALUES("V","20276546","JOSE","MIGUEL","PEREZ","TORRES","M","1990-06-12","jose.perez@gmail.com","ARAURE","02552352362","DIRECTOR","1","1","3");
INSERT INTO tpersonal VALUES("V","21561769","Miguel","jose","Torrez","Diaz","M","1970-01-01","meguel@gmail.com","Mijaguito","04129429239","Profesor","1","4","0");
INSERT INTO tpersonal VALUES("V","4090420","CARLOS","ALEJANDRO","FERNANDEZ","FERNANDEZ","M","1980-06-02","carlos.fernandez@gmail.com","Desarrollo Camburito","02559834934","Docente","1","4","2");
INSERT INTO tpersonal VALUES("V","4090422","JULIO","CESAR","TORREZ","PERALTA","M","1959-06-16","julio.torrez@gmail.com","LOS APAMATES","04152352352","DOCENTE","1","4","2");
INSERT INTO tpersonal VALUES("V","4090423","PABLO","MIGUEL","PEREZ","CASTILLO","M","1975-06-01","pablo.perez@gmail.com","DURIGUA","02550493634","PROFESOR","1","4","2");



DROP TABLE tpregunta;

CREATE TABLE `tpregunta` (
  `idpregunta` int(11) NOT NULL AUTO_INCREMENT,
  `pregunta` varchar(30) NOT NULL,
  `respuesta` varchar(30) NOT NULL,
  `tusuario_idusuario` varchar(20) NOT NULL,
  PRIMARY KEY (`idpregunta`),
  KEY `fk_tpregunta_tusuario1_idx` (`tusuario_idusuario`),
  CONSTRAINT `fk_tpregunta_tusuario1` FOREIGN KEY (`tusuario_idusuario`) REFERENCES `tusuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO tpregunta VALUES("1","COMO SE LLAMA MI PERRO","MANCHA","10328765");
INSERT INTO tpregunta VALUES("2","CUAL ES MI COLOR FAVORITO","ROJO","10328765");
INSERT INTO tpregunta VALUES("3","EQUIPO DE FUTBOL","REAL MADRID","20276546");
INSERT INTO tpregunta VALUES("4","SERIE DE TELEVISIóN FAVORITA","THE BIG BANG THEORY","20276546");



DROP TABLE trol;

CREATE TABLE `trol` (
  `idrol` int(11) NOT NULL AUTO_INCREMENT,
  `nombrerol` varchar(45) NOT NULL,
  `estatusrol` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO trol VALUES("1","administrador","1");
INSERT INTO trol VALUES("2","Docente","1");
INSERT INTO trol VALUES("3","Directora","1");



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
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;

INSERT INTO tservicio VALUES("1","Módulos","seguridad/modulo","1","1","1");
INSERT INTO tservicio VALUES("2","Registrar modulo","seguridad/registrar_modulo","0","1","1");
INSERT INTO tservicio VALUES("4","Servicio","seguridad/servicio","1","1","1");
INSERT INTO tservicio VALUES("5","Registrar servicio","seguridad/registrar_servicio","0","1","1");
INSERT INTO tservicio VALUES("7","Rol","seguridad/rol","1","1","1");
INSERT INTO tservicio VALUES("8","Registrar rol","seguridad/registrar_rol","0","1","1");
INSERT INTO tservicio VALUES("10","Asignacion de modulos/servicios","seguridad/asignacion","1","1","1");
INSERT INTO tservicio VALUES("11","Asignar módulos","seguridad/asignar_modulo","1","1","1");
INSERT INTO tservicio VALUES("12","Asignar servicios","seguridad/asignar_servicio","1","1","1");
INSERT INTO tservicio VALUES("13","Consultar módulo","seguridad/consultar_modulo","0","1","1");
INSERT INTO tservicio VALUES("14","Consultar servicio","seguridad/consultar_servicio","0","1","1");
INSERT INTO tservicio VALUES("15","Consultar rol","seguridad/consultar_rol","0","1","1");
INSERT INTO tservicio VALUES("17","Auditoria de sistema","seguridad/bitacora","1","1","1");
INSERT INTO tservicio VALUES("18","Consultar bitacora","seguridad/consultar_bitacora","0","1","1");
INSERT INTO tservicio VALUES("19","Configurar","sistema/configurar","1","1","1");
INSERT INTO tservicio VALUES("20","Municipio","archivo/municipio","1","1","2");
INSERT INTO tservicio VALUES("21","Registrar municipio","archivo/registrar_municipio","0","1","2");
INSERT INTO tservicio VALUES("22","Consultar municipio","archivo/consultar_municipio","0","1","2");
INSERT INTO tservicio VALUES("23","Parentesco","archivo/parentesco","1","1","2");
INSERT INTO tservicio VALUES("24","Registrar parentesco","archivo/registrar_parentesco","0","1","2");
INSERT INTO tservicio VALUES("25","Consultar parentesco","archivo/consultar_parentesco","0","1","2");
INSERT INTO tservicio VALUES("26","Diagnostico","archivo/diagnostico","1","1","2");
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
INSERT INTO tservicio VALUES("39","Institucion","archivo/institucion","1","1","2");
INSERT INTO tservicio VALUES("40","Registrar institución","archivo/registrar_institucion","0","1","2");
INSERT INTO tservicio VALUES("41","Consultar institución","archivo/consultar_institucion","0","1","2");
INSERT INTO tservicio VALUES("42","Participante","persona/participante","1","1","4");
INSERT INTO tservicio VALUES("43","Consultar Participante","persona/consultar_participante","0","1","4");
INSERT INTO tservicio VALUES("44","Lapso","curso/lapso","1","1","3");
INSERT INTO tservicio VALUES("45","Apertura lapso","curso/registrar_lapso","0","1","3");
INSERT INTO tservicio VALUES("46","Ofertar cursos","curso/registrar_curso","1","1","3");
INSERT INTO tservicio VALUES("47","Cursos ofertados","curso/curso","1","1","3");
INSERT INTO tservicio VALUES("48","Personal","persona/personal","1","1","4");
INSERT INTO tservicio VALUES("49","Registrar personal","persona/registrar_personal","0","1","4");
INSERT INTO tservicio VALUES("50","Eliminar servicio","seguridad/eliminar_servicio","0","1","1");
INSERT INTO tservicio VALUES("51","Eliminar modulo","seguridad/eliminar_modulo","0","1","1");
INSERT INTO tservicio VALUES("52","Cambiar clave","seguridad/cambiar_clave","1","1","5");
INSERT INTO tservicio VALUES("53","Pregunta secreta","seguridad/registrar_pregunta","1","1","5");
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
INSERT INTO tservicio VALUES("77","Noticias","sistema/noticia","1","1","1");
INSERT INTO tservicio VALUES("78","Consultar Noticia","sistema/consultar_noticia","0","1","1");
INSERT INTO tservicio VALUES("79","Eliminar Noticia","sistema/eliminar_noticia","0","1","1");
INSERT INTO tservicio VALUES("80","Registrar Slider","sistema/registrar_slider","0","1","1");
INSERT INTO tservicio VALUES("81","Slider","sistema/slider","1","1","1");
INSERT INTO tservicio VALUES("82","Consultar Slider","sistema/consultar_slider","0","1","1");
INSERT INTO tservicio VALUES("83","Eliminar Slider","sistema/eliminar_slider","0","1","1");
INSERT INTO tservicio VALUES("84","Inscripción masiva","inscripcion/listado_cursos_inscribir","1","1","8");
INSERT INTO tservicio VALUES("85","Inscripción individual","inscripcion/listado_participantes_inscribir","1","1","8");
INSERT INTO tservicio VALUES("86","Inscripción masiva","inscripcion/inscripcion_masiva","0","1","8");
INSERT INTO tservicio VALUES("87","Inscripción individual","inscripcion/inscripcion_individual","0","1","8");
INSERT INTO tservicio VALUES("88","Planilla de inscripción","reporte/planilla_inscripcion","1","1","6");
INSERT INTO tservicio VALUES("89","Familiares","reporte/familiar_participante ","1","0","6");
INSERT INTO tservicio VALUES("90","Eliminar participante","persona/eliminar_participante","0","1","4");
INSERT INTO tservicio VALUES("91","Eliminar Docente","persona/eliminar_docente","0","1","4");
INSERT INTO tservicio VALUES("92","Cursos Inactivos","curso/cursos_inactivos","1","1","3");
INSERT INTO tservicio VALUES("93","Consultar historial curso","curso/detalle_curso_inactivo","0","1","3");
INSERT INTO tservicio VALUES("94","Primera vez","seguridad/primera_vez","0","1","5");
INSERT INTO tservicio VALUES("95","Desbloquear","seguridad/desbloquear","1","1","1");
INSERT INTO tservicio VALUES("96","Cambiar clave","seguridad/cambiar_clave","1","1","9");
INSERT INTO tservicio VALUES("97","Pregunta secreta","seguridad/registrar_pregunta","1","1","9");
INSERT INTO tservicio VALUES("98","Consultar","seguridad/consultar_usuario","1","1","9");
INSERT INTO tservicio VALUES("99","Consultar Lapso","curso/consultar_lapso","0","1","3");
INSERT INTO tservicio VALUES("100","Eliminar lapso","curso/eliminar_lapso","0","1","3");
INSERT INTO tservicio VALUES("101","Consultar Curso","curso/detalle_curso_activo","0","1","3");
INSERT INTO tservicio VALUES("102","Desincorporar participante","inscripcion/listado_participantes_desincorporar","1","1","8");
INSERT INTO tservicio VALUES("103","Desincorporar participantes masivamente","inscripcion/listado_cursos_desincorporar","1","1","8");
INSERT INTO tservicio VALUES("104","Desincorporar participante","inscripcion/desincorporar_participante","0","1","8");
INSERT INTO tservicio VALUES("105","Desincorporar participantes","inscripcion/desincorporar_participantes","0","1","8");
INSERT INTO tservicio VALUES("106","Historial de participante","persona/historial_participante","1","1","4");
INSERT INTO tservicio VALUES("107","Historial de participante","persona/historial_participante_detalle","0","1","4");
INSERT INTO tservicio VALUES("108","Historial Lapso","reporte/historial_lapso","1","1","6");
INSERT INTO tservicio VALUES("109","Historial Lapso","historial_lapso","0","1","6");
INSERT INTO tservicio VALUES("110","Historial de participante","reporte/historial_participante","1","1","6");
INSERT INTO tservicio VALUES("111","Familiares","reporte/participante_familiar","1","1","6");
INSERT INTO tservicio VALUES("112","Historial Curso","reporte/historial_curso","1","1","6");
INSERT INTO tservicio VALUES("113","Listado Participantes-Etnia","reporte/listado_participantes_etnia","1","1","6");
INSERT INTO tservicio VALUES("114","Listado Participantes Huerfanos","reporte/listado_participantes_huerfanos","1","1","6");
INSERT INTO tservicio VALUES("115","Listado de Docentes-Diagnostico","reporte/listado_docente_diagnostico","1","1","6");
INSERT INTO tservicio VALUES("116","Acerca de...","ayuda/acerca","1","1","7");
INSERT INTO tservicio VALUES("117","Manual de Usuario","ayuda/manual_usuario","1","1","7");
INSERT INTO tservicio VALUES("118","Auditoria Usuarios","seguridad/auditoria_usuarios","1","1","1");
INSERT INTO tservicio VALUES("119","Consultar Usuario","seguridad/consultar_usuario","0","1","1");
INSERT INTO tservicio VALUES("120","Items","archivo/item","1","1","2");
INSERT INTO tservicio VALUES("121","Registrar Item","archivo/registrar_item","0","1","2");
INSERT INTO tservicio VALUES("122","Consultar item","archivo/consultar_item","0","1","2");
INSERT INTO tservicio VALUES("123","Eliminar item","archivo/eliminar_item","0","1","2");
INSERT INTO tservicio VALUES("124","Auditoria Reportes","seguridad/bitacora_reporte","1","1","1");
INSERT INTO tservicio VALUES("125","Consultar bitacora reporte","seguridad/consultar_bitacora_reporte","0","1","1");
INSERT INTO tservicio VALUES("126","Bloquear/Desbloquear Usuario","seguridad/bloquear","1","1","1");
INSERT INTO tservicio VALUES("127","Listado Claves","seguridad/listado_cambio_clave","1","1","1");
INSERT INTO tservicio VALUES("128","Consultar claves","seguridad/consultar_claves","0","1","1");
INSERT INTO tservicio VALUES("129","Primera vez","seguridad/primera_vez","0","1","9");



DROP TABLE tservicio_trol;

CREATE TABLE `tservicio_trol` (
  `idservicio` int(11) NOT NULL,
  `idrol` int(11) NOT NULL,
  `orden` int(11) DEFAULT NULL,
  PRIMARY KEY (`idservicio`,`idrol`),
  KEY `fk_tservicio_has_trol_trol1_idx` (`idrol`),
  KEY `fk_tservicio_has_trol_tservicio1_idx` (`idservicio`),
  CONSTRAINT `fk_tservicio_has_trol_trol1` FOREIGN KEY (`idrol`) REFERENCES `trol` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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
INSERT INTO tservicio_trol VALUES("18","1","0");
INSERT INTO tservicio_trol VALUES("19","1","12");
INSERT INTO tservicio_trol VALUES("20","1","1");
INSERT INTO tservicio_trol VALUES("21","1","0");
INSERT INTO tservicio_trol VALUES("22","1","0");
INSERT INTO tservicio_trol VALUES("23","1","5");
INSERT INTO tservicio_trol VALUES("24","1","0");
INSERT INTO tservicio_trol VALUES("25","1","0");
INSERT INTO tservicio_trol VALUES("26","1","4");
INSERT INTO tservicio_trol VALUES("27","1","0");
INSERT INTO tservicio_trol VALUES("28","1","0");
INSERT INTO tservicio_trol VALUES("29","1","2");
INSERT INTO tservicio_trol VALUES("30","1","0");
INSERT INTO tservicio_trol VALUES("31","1","0");
INSERT INTO tservicio_trol VALUES("32","1","0");
INSERT INTO tservicio_trol VALUES("33","1","0");
INSERT INTO tservicio_trol VALUES("34","1","6");
INSERT INTO tservicio_trol VALUES("35","1","0");
INSERT INTO tservicio_trol VALUES("35","3","0");
INSERT INTO tservicio_trol VALUES("36","1","0");
INSERT INTO tservicio_trol VALUES("36","3","0");
INSERT INTO tservicio_trol VALUES("37","1","0");
INSERT INTO tservicio_trol VALUES("37","3","0");
INSERT INTO tservicio_trol VALUES("38","1","1");
INSERT INTO tservicio_trol VALUES("38","2","1");
INSERT INTO tservicio_trol VALUES("38","3","2");
INSERT INTO tservicio_trol VALUES("39","1","3");
INSERT INTO tservicio_trol VALUES("40","1","0");
INSERT INTO tservicio_trol VALUES("41","1","0");
INSERT INTO tservicio_trol VALUES("42","1","2");
INSERT INTO tservicio_trol VALUES("42","2","2");
INSERT INTO tservicio_trol VALUES("42","3","3");
INSERT INTO tservicio_trol VALUES("43","1","0");
INSERT INTO tservicio_trol VALUES("43","3","0");
INSERT INTO tservicio_trol VALUES("44","1","1");
INSERT INTO tservicio_trol VALUES("44","3","1");
INSERT INTO tservicio_trol VALUES("45","1","0");
INSERT INTO tservicio_trol VALUES("45","3","0");
INSERT INTO tservicio_trol VALUES("46","1","2");
INSERT INTO tservicio_trol VALUES("46","3","2");
INSERT INTO tservicio_trol VALUES("47","1","3");
INSERT INTO tservicio_trol VALUES("47","3","3");
INSERT INTO tservicio_trol VALUES("48","1","3");
INSERT INTO tservicio_trol VALUES("48","2","3");
INSERT INTO tservicio_trol VALUES("48","3","4");
INSERT INTO tservicio_trol VALUES("49","1","0");
INSERT INTO tservicio_trol VALUES("49","3","0");
INSERT INTO tservicio_trol VALUES("50","1","0");
INSERT INTO tservicio_trol VALUES("51","1","0");
INSERT INTO tservicio_trol VALUES("52","1","1");
INSERT INTO tservicio_trol VALUES("53","1","2");
INSERT INTO tservicio_trol VALUES("54","1","7");
INSERT INTO tservicio_trol VALUES("55","1","0");
INSERT INTO tservicio_trol VALUES("56","1","0");
INSERT INTO tservicio_trol VALUES("57","1","0");
INSERT INTO tservicio_trol VALUES("58","1","8");
INSERT INTO tservicio_trol VALUES("59","1","0");
INSERT INTO tservicio_trol VALUES("60","1","0");
INSERT INTO tservicio_trol VALUES("61","1","0");
INSERT INTO tservicio_trol VALUES("62","1","9");
INSERT INTO tservicio_trol VALUES("63","1","0");
INSERT INTO tservicio_trol VALUES("64","1","0");
INSERT INTO tservicio_trol VALUES("65","1","0");
INSERT INTO tservicio_trol VALUES("66","1","0");
INSERT INTO tservicio_trol VALUES("67","1","0");
INSERT INTO tservicio_trol VALUES("68","1","0");
INSERT INTO tservicio_trol VALUES("69","1","0");
INSERT INTO tservicio_trol VALUES("70","1","0");
INSERT INTO tservicio_trol VALUES("71","1","0");
INSERT INTO tservicio_trol VALUES("71","3","0");
INSERT INTO tservicio_trol VALUES("72","1","0");
INSERT INTO tservicio_trol VALUES("72","3","0");
INSERT INTO tservicio_trol VALUES("73","1","0");
INSERT INTO tservicio_trol VALUES("74","1","0");
INSERT INTO tservicio_trol VALUES("75","1","0");
INSERT INTO tservicio_trol VALUES("76","1","0");
INSERT INTO tservicio_trol VALUES("77","1","9");
INSERT INTO tservicio_trol VALUES("78","1","0");
INSERT INTO tservicio_trol VALUES("79","1","0");
INSERT INTO tservicio_trol VALUES("80","1","0");
INSERT INTO tservicio_trol VALUES("81","1","10");
INSERT INTO tservicio_trol VALUES("82","1","0");
INSERT INTO tservicio_trol VALUES("83","1","0");
INSERT INTO tservicio_trol VALUES("84","1","1");
INSERT INTO tservicio_trol VALUES("84","3","1");
INSERT INTO tservicio_trol VALUES("85","1","2");
INSERT INTO tservicio_trol VALUES("85","3","2");
INSERT INTO tservicio_trol VALUES("86","1","0");
INSERT INTO tservicio_trol VALUES("86","3","0");
INSERT INTO tservicio_trol VALUES("87","1","0");
INSERT INTO tservicio_trol VALUES("87","3","0");
INSERT INTO tservicio_trol VALUES("88","1","1");
INSERT INTO tservicio_trol VALUES("88","3","1");
INSERT INTO tservicio_trol VALUES("90","1","0");
INSERT INTO tservicio_trol VALUES("90","3","0");
INSERT INTO tservicio_trol VALUES("91","1","0");
INSERT INTO tservicio_trol VALUES("91","3","0");
INSERT INTO tservicio_trol VALUES("92","1","4");
INSERT INTO tservicio_trol VALUES("92","3","4");
INSERT INTO tservicio_trol VALUES("93","1","0");
INSERT INTO tservicio_trol VALUES("93","3","0");
INSERT INTO tservicio_trol VALUES("94","1","0");
INSERT INTO tservicio_trol VALUES("96","3","1");
INSERT INTO tservicio_trol VALUES("97","3","2");
INSERT INTO tservicio_trol VALUES("98","3","3");
INSERT INTO tservicio_trol VALUES("99","1","0");
INSERT INTO tservicio_trol VALUES("99","3","0");
INSERT INTO tservicio_trol VALUES("100","1","0");
INSERT INTO tservicio_trol VALUES("100","3","0");
INSERT INTO tservicio_trol VALUES("101","1","0");
INSERT INTO tservicio_trol VALUES("101","3","0");
INSERT INTO tservicio_trol VALUES("102","1","4");
INSERT INTO tservicio_trol VALUES("102","3","3");
INSERT INTO tservicio_trol VALUES("103","1","3");
INSERT INTO tservicio_trol VALUES("103","3","4");
INSERT INTO tservicio_trol VALUES("104","1","0");
INSERT INTO tservicio_trol VALUES("104","3","0");
INSERT INTO tservicio_trol VALUES("105","1","0");
INSERT INTO tservicio_trol VALUES("105","3","0");
INSERT INTO tservicio_trol VALUES("106","1","4");
INSERT INTO tservicio_trol VALUES("106","3","1");
INSERT INTO tservicio_trol VALUES("107","1","0");
INSERT INTO tservicio_trol VALUES("107","3","0");
INSERT INTO tservicio_trol VALUES("108","1","3");
INSERT INTO tservicio_trol VALUES("108","3","7");
INSERT INTO tservicio_trol VALUES("109","1","0");
INSERT INTO tservicio_trol VALUES("109","3","0");
INSERT INTO tservicio_trol VALUES("110","1","4");
INSERT INTO tservicio_trol VALUES("110","3","6");
INSERT INTO tservicio_trol VALUES("111","1","2");
INSERT INTO tservicio_trol VALUES("111","3","5");
INSERT INTO tservicio_trol VALUES("112","1","5");
INSERT INTO tservicio_trol VALUES("112","3","4");
INSERT INTO tservicio_trol VALUES("113","1","6");
INSERT INTO tservicio_trol VALUES("113","3","3");
INSERT INTO tservicio_trol VALUES("114","1","7");
INSERT INTO tservicio_trol VALUES("114","3","2");
INSERT INTO tservicio_trol VALUES("115","1","8");
INSERT INTO tservicio_trol VALUES("115","3","8");
INSERT INTO tservicio_trol VALUES("116","1","1");
INSERT INTO tservicio_trol VALUES("116","3","1");
INSERT INTO tservicio_trol VALUES("117","1","2");
INSERT INTO tservicio_trol VALUES("117","3","2");
INSERT INTO tservicio_trol VALUES("118","1","7");
INSERT INTO tservicio_trol VALUES("119","1","0");
INSERT INTO tservicio_trol VALUES("120","1","10");
INSERT INTO tservicio_trol VALUES("121","1","0");
INSERT INTO tservicio_trol VALUES("122","1","0");
INSERT INTO tservicio_trol VALUES("123","1","0");
INSERT INTO tservicio_trol VALUES("124","1","8");
INSERT INTO tservicio_trol VALUES("125","1","0");
INSERT INTO tservicio_trol VALUES("126","1","11");
INSERT INTO tservicio_trol VALUES("127","1","13");
INSERT INTO tservicio_trol VALUES("128","1","0");
INSERT INTO tservicio_trol VALUES("129","3","0");



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

INSERT INTO tsistema VALUES("2","Bienvenidos al sistema","Salir adelante.","Con esfuerzo","1992","Socialismo","Acarigua","2","12345678","3","120","15","210");



DROP TABLE tslider;

CREATE TABLE `tslider` (
  `idslider` int(11) NOT NULL AUTO_INCREMENT,
  `titulosli` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `textosli` text COLLATE utf8_spanish2_ci NOT NULL,
  `imagensli` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `estatussli` char(1) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`idslider`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO tslider VALUES("1","CAIDV AVANZA","CAIDV avanza gracias a los planes de desarrollos implementados por el ministerio de educación","IMG00305-20120517-1004.jpg","1");
INSERT INTO tslider VALUES("2","TRABAJO MANUAL","Una clase de manualidades","IMG_5163.JPG","1");



DROP TABLE tunidad;

CREATE TABLE `tunidad` (
  `idunidad` int(11) NOT NULL AUTO_INCREMENT,
  `nombreuni` varchar(500) COLLATE utf8_spanish2_ci NOT NULL,
  `contenidouni` text COLLATE utf8_spanish2_ci NOT NULL,
  `estatusuni` char(1) COLLATE utf8_spanish2_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`idunidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;




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

INSERT INTO tusuario VALUES("10328765","CASTILLO MARIA","MARIA.CASTILLO@GMAIL.COM","1","2014-11-24 23:28:09","2","10328765","0");
INSERT INTO tusuario VALUES("19023142","CONTRERA JESUS","JESUS.CONTRERA@GMAIL.COM","1","2014-11-24 23:28:09","2","19023142","0");
INSERT INTO tusuario VALUES("20158248","Perez Petra","PETRAPEREZ@GMAIL.COM","1","2014-11-24 23:28:09","1","20158248","0");
INSERT INTO tusuario VALUES("20276546","PEREZ JOSE","JOSE.PEREZ@GMAIL.COM","1","2014-11-25 02:33:27","3","20276546","0");
INSERT INTO tusuario VALUES("21561769","Torrez Miguel","meguel@gmail.com","0","2014-11-24 23:28:09","1","21561769","0");
INSERT INTO tusuario VALUES("4090420","Fernandez Carlos","CARLOS.FERNANDEZ@GMAIL.COM","1","2014-11-24 23:28:09","2","4090420","0");
INSERT INTO tusuario VALUES("4090422","Torrez Julio","JULIO.TORREZ@GMAIL.COM","1","2014-11-24 23:28:09","2","4090422","0");
INSERT INTO tusuario VALUES("4090423","Perez Pablo","PABLO.PEREZ@GMAIL.COM","1","2014-11-24 23:28:09","2","4090423","0");
INSERT INTO tusuario VALUES("administrador","Web Master","webmaster@gmail.com","1","2014-11-26 00:37:34","1","0","0");



DROP TABLE tvalor_item;

CREATE TABLE `tvalor_item` (
  `idvalor_item` int(11) NOT NULL AUTO_INCREMENT,
  `valorval` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `estatusval` char(1) COLLATE utf8_spanish2_ci NOT NULL,
  `titem_iditem` int(11) DEFAULT NULL,
  PRIMARY KEY (`idvalor_item`),
  KEY `fk_tvalor_item_titem` (`titem_iditem`),
  CONSTRAINT `fk_tvalor_item_titem` FOREIGN KEY (`titem_iditem`) REFERENCES `titem` (`iditem`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO tvalor_item VALUES("16","Bajo","1","1");
INSERT INTO tvalor_item VALUES("17","Medio","1","1");
INSERT INTO tvalor_item VALUES("18","Muy Alto","1","1");
INSERT INTO tvalor_item VALUES("19","Nulo","1","2");
INSERT INTO tvalor_item VALUES("20","Bajo","1","2");
INSERT INTO tvalor_item VALUES("21","Medio","1","2");
INSERT INTO tvalor_item VALUES("22","Alto","1","2");



