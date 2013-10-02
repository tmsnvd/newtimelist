/*
Navicat MySQL Data Transfer

Source Server         : 185.5.54.28
Source Server Version : 50531
Source Host           : localhost:3306
Source Database       : newtimelist

Target Server Type    : MYSQL
Target Server Version : 50531
File Encoding         : 65001

Date: 2013-09-27 16:28:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `company`
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('1', 'Indoreka');
INSERT INTO `company` VALUES ('2', 'WANG');

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT 'Pavadinimas',
  `description` text COMMENT 'Aprašymas',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('101', 'Customer\'s name?', '');
INSERT INTO `customer` VALUES ('104', 'Jan Pederson', '');
INSERT INTO `customer` VALUES ('105', 'Malermesterbedrift Regnbuen AS', '');
INSERT INTO `customer` VALUES ('106', 'Tom Lilevik', '');
INSERT INTO `customer` VALUES ('107', 'Regnbuen', '');
INSERT INTO `customer` VALUES ('108', 'Vidar Sandermoen', '');
INSERT INTO `customer` VALUES ('109', 'Malmesterfirmaet Pedersen & Sikkerbøl AS', '');
INSERT INTO `customer` VALUES ('110', 'Pedersen & Sikkerbøl AS', '');
INSERT INTO `customer` VALUES ('111', 'Tom Lilevik', '');
INSERT INTO `customer` VALUES ('112', 'Ula', '');
INSERT INTO `customer` VALUES ('113', 'GERFLOR', '');
INSERT INTO `customer` VALUES ('114', 'BERMINGRUD', '');
INSERT INTO `customer` VALUES ('115', 'ELKJØP', '');
INSERT INTO `customer` VALUES ('116', 'Ronny Sjølie', '');
INSERT INTO `customer` VALUES ('117', 'Øyvind Ask', '');
INSERT INTO `customer` VALUES ('118', 'Torkild', '');
INSERT INTO `customer` VALUES ('119', '-', '-');
INSERT INTO `customer` VALUES ('120', 'WANG Gulv & Interiør AS', 'Uthusvegen 21\r\n2335 Stange');

-- ----------------------------
-- Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `birthday` date NOT NULL,
  `postcode` varchar(128) DEFAULT NULL COMMENT 'Pašto kodas',
  `address` text,
  `password` varchar(512) NOT NULL,
  `username` varchar(256) NOT NULL,
  `email` varchar(512) NOT NULL,
  `usertype` varchar(128) NOT NULL,
  `phone_no` varchar(512) DEFAULT NULL COMMENT 'Telefono n. (NO)',
  `phone` varchar(512) DEFAULT NULL,
  `status` varchar(128) DEFAULT NULL COMMENT 'Statusas',
  `started` date DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `tshirt_size_id` int(11) DEFAULT NULL,
  `jersey_size_id` int(11) DEFAULT NULL,
  `trousers_size_id` int(11) DEFAULT NULL,
  `boots_size_id` int(11) DEFAULT NULL,
  `coat_size_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `size_fk1` (`tshirt_size_id`) USING BTREE,
  KEY `size_fk2` (`jersey_size_id`) USING BTREE,
  KEY `size_fk3` (`trousers_size_id`) USING BTREE,
  KEY `size_fk4` (`boots_size_id`) USING BTREE,
  KEY `size_fk5` (`coat_size_id`) USING BTREE,
  KEY `lang_fk3` (`language_id`) USING BTREE,
  KEY `comp_fk1` (`company_id`) USING BTREE,
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`),
  CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`tshirt_size_id`) REFERENCES `size` (`id`),
  CONSTRAINT `employee_ibfk_4` FOREIGN KEY (`jersey_size_id`) REFERENCES `size` (`id`),
  CONSTRAINT `employee_ibfk_5` FOREIGN KEY (`trousers_size_id`) REFERENCES `size` (`id`),
  CONSTRAINT `employee_ibfk_6` FOREIGN KEY (`boots_size_id`) REFERENCES `size` (`id`),
  CONSTRAINT `employee_ibfk_7` FOREIGN KEY (`coat_size_id`) REFERENCES `size` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('21', 'Test', 'User', '0000-00-00', null, 'a', '$2a$04$NkdHh6Y3xC1z7VXhWwsOne3Mmqy66oS9P/AcWs.txL6G7xRwga1q2', 'tomnev', 'test@test.lt', 'admin', null, null, null, null, null, null, '1', null, null, null, null, null);
INSERT INTO `employee` VALUES ('22', 'Donatas', 'Staškas', '0000-00-00', null, 'Tilžės g. 27b-18, Šiauliai', '$2a$04$PZ6y10.xfg0wYHhBGl5OouewLzTJLh81fza/wI32ISpn53CN8gKvq', 'Donatas', 'dstaskas@gmail.com', 'admin', '', '+37061238444', null, '2013-09-18', '1', '1', '1', '3', '3', '3', '13', '4');
INSERT INTO `employee` VALUES ('23', 'Aivaras', 'Ambrozaitis', '0000-00-00', null, 'Debesų g. 16, Dercekliai, Klaipėdos raj.', '$2a$04$jN8iUVlbxyZhAip4zEEzy.HGKtw0.0TY.bckiHlaGqhzYkti11UjO', 'Aivaras', 'aivaras.am@gmail.com', 'worker', '+4795210209', '+37067016337', null, '2012-01-01', '2', '1', '1', '2', '3', '3', '13', '3');
INSERT INTO `employee` VALUES ('24', 'Vidmantas', 'Galdikas', '0000-00-00', null, 'Renetų g. 11, Klaipėda', '$2a$04$FisZK1tl8CZCFkYcACpT8.8BMXNzhnmyIMp2OWFds9cwu3O1NqXXi', 'Vidmantas', 'galdikasvidmantas@gmail.com', 'worker', '+4795428140', '+37068057274', null, '2013-09-25', '2', '1', '1', '5', '5', '4', '15', '5');
INSERT INTO `employee` VALUES ('25', 'Marius', 'Silickis', '0000-00-00', null, 'Paukščių takas 2a-65, Šiauliai', '$2a$04$TQXLP9riddkPzaiTQ9RX8.GLxbIRM8uzA9nf/I7fdVl/1bVmG17LK', 'Marius', 'marius-81@hotmail.com', 'admin', '+4791395185', '', null, '2008-01-01', '2', '1', '1', '3', '3', '4', '13', '3');
INSERT INTO `employee` VALUES ('26', 'Aivaras', 'Sakalauskas', '0000-00-00', null, 'Liepų g. 3-6, Judrėnai, Klaipėdos raj.', '$2a$04$f9LABaS0Wjfs1wU5bofAveWCYEenew2O2y0jl1hrx8sKR3GKBSB12', 'Aivaras', 'aivaras.sak@gmail.com', 'worker', '+4792530621', '+37063089077', null, '2012-03-01', '2', '1', '1', '2', '2', '1', '12', '2');
INSERT INTO `employee` VALUES ('27', 'Eugenijus', 'Podlesnis', '0000-00-00', null, 'Žemaitės g. 59-19, Telšiai', '$2a$04$m97lz1rzadp3Q6Bp7f0DJOv0fgsRxERI75f6zHYWNsAwSyAE9WHc.', 'Eugenijus', 'eugenijus.podlesnis@gmail.com', 'worker', '+4793935964', '+37060035504', null, '2013-09-22', '2', '1', '1', '2', '3', '2', '13', '3');
INSERT INTO `employee` VALUES ('28', 'Viktoras', 'Nebeskis', '0000-00-00', null, 'Taikos pr. 113-56, Klaipėda', '$2a$04$F42Ce6QVbEwrE1JEbeQjxOv753xNBX/Pm1gkjG65ZhXKwX.N6OBGW', 'Viktoras', 'viktorasnebeskis@yahoo.com', 'worker', '+4796815861', '+37061545422', null, '2012-09-22', '2', '1', '1', '5', '5', '5', '14', '6');
INSERT INTO `employee` VALUES ('29', 'Vytautas', 'Paulauskas', '0000-00-00', null, 'Laukų g. 15-1, Klaipėda', '$2a$04$VbZoY/548H80KyrqB98yluSIeVa9jiGuLkWFsGdBbQuT/f0cXCmFm', 'Vytautas', 'vytaspaul@gmail.com', 'worker', '+4796696005', '+37067722523', null, '2013-02-08', '2', '1', '1', '3', '3', '3', '12', '3');
INSERT INTO `employee` VALUES ('30', 'Edvinas', 'Vaitiekūnas', '0000-00-00', null, 'Danės g. 37-15, Klaipėda', '$2a$04$HRcXiln9fi8CMSF/E6y.ge6a6AqnIfgmF9eE8WeAy4UMHER1TWUZW', 'Edvinas', 'edwys3@gmail.com ', 'worker', '+474731451', '+37064663188', null, '2013-03-01', '2', '1', '1', '2', '3', '3', '13', '3');
INSERT INTO `employee` VALUES ('31', 'Alvydas', 'Šedleckis', '0000-00-00', null, 'Rambyno g. 14-11, Telšiai', '$2a$04$Yf/k4i3CvxsW1YHoiTkT/uTwUjDQBq.ZG.3ex8H4FAhVob3FCSeJu', 'Alvydas', 'alvydassed@gmail.com', 'worker', '', '+37064538096', null, '2013-08-29', '2', '1', '1', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for `extra_job`
-- ----------------------------
DROP TABLE IF EXISTS `extra_job`;
CREATE TABLE `extra_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title_lt` varchar(1024) NOT NULL COMMENT 'Pavadinimas',
  `title_no` varchar(1024) NOT NULL COMMENT 'Pavadinimas',
  `title_en` varchar(1024) NOT NULL,
  `unit` varchar(256) NOT NULL COMMENT 'Matavimo vienetas',
  PRIMARY KEY (`id`),
  KEY `lang_fk1` (`title_no`(255)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of extra_job
-- ----------------------------
INSERT INTO `extra_job` VALUES ('9', 'Durų išėmimas', 'Removing the Door', 'Removing the Door', 'h');
INSERT INTO `extra_job` VALUES ('10', 'Laukimas kol atrakins objektą', 'Waiting before open this Object', 'Waiting before open this Object', 'h');
INSERT INTO `extra_job` VALUES ('11', 'Dulkių valymas', 'Dust Cleaning', 'Dust Cleaning', 'h');
INSERT INTO `extra_job` VALUES ('12', 'Valymas', 'Cleaning', 'Cleaning', 'h');
INSERT INTO `extra_job` VALUES ('13', 'Baldų kraustymas', 'Moving Furniture', 'Moving Furniture', 'h');
INSERT INTO `extra_job` VALUES ('14', 'Medžiagų laukimas', 'Waiting for Materials', 'Waiting for Materials', 'h');

-- ----------------------------
-- Table structure for `job`
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` date NOT NULL COMMENT 'Sukurtas',
  `work_start` time NOT NULL DEFAULT '00:00:00' COMMENT 'Darbo pradžia',
  `work_end` time NOT NULL DEFAULT '00:00:00' COMMENT 'Darbo pabaiga',
  `travel_time` time NOT NULL DEFAULT '00:00:00' COMMENT 'Kelionės laikas',
  `parking_cost` int(11) DEFAULT '0' COMMENT 'Parkavimo išlaidos',
  `comment` text COMMENT 'Komentaras',
  `project_id` int(11) NOT NULL,
  `bonus` int(11) DEFAULT '0' COMMENT 'Bonusas',
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `job_em1` (`employee_id`) USING BTREE,
  KEY `job_pr1` (`project_id`) USING BTREE,
  CONSTRAINT `job_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `job_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of job
-- ----------------------------
INSERT INTO `job` VALUES ('1', '1970-01-01', '00:00:00', '00:00:00', '00:00:00', '0', '', '105', '0', '22');
INSERT INTO `job` VALUES ('2', '1970-01-01', '00:00:00', '00:00:00', '00:00:00', '0', '', '116', '0', '22');
INSERT INTO `job` VALUES ('3', '1970-01-01', '00:00:00', '00:00:00', '00:00:00', '0', '', '112', '0', '22');
INSERT INTO `job` VALUES ('8', '2013-09-27', '16:15:00', '16:15:00', '00:15:00', '0', '10', '106', '0', '23');

-- ----------------------------
-- Table structure for `job_name`
-- ----------------------------
DROP TABLE IF EXISTS `job_name`;
CREATE TABLE `job_name` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title_lt` varchar(1024) NOT NULL COMMENT 'Pavadinimas',
  `title_no` varchar(1024) NOT NULL COMMENT 'Pavadinimas',
  `title_en` varchar(1024) NOT NULL COMMENT 'Pavadinimas',
  `unit` varchar(256) NOT NULL COMMENT 'Matavimo vienetas',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of job_name
-- ----------------------------
INSERT INTO `job_name` VALUES ('8', 'Šlifavimas', 'Slipe Floor', 'Slipe Floor', 'm^2');
INSERT INTO `job_name` VALUES ('9', 'Ruoša', 'Make ready', 'Make ready', 'h');
INSERT INTO `job_name` VALUES ('10', 'Medžiagų pristatymas', 'Material deliveries', 'Material deliveries', 'h');
INSERT INTO `job_name` VALUES ('11', 'Dangos įnešimas/išnešimas', 'Vinyl loading/unloading', 'Vinyl loading/unloading', 'h');
INSERT INTO `job_name` VALUES ('12', 'Senos dangos šalinimas', 'Remove old vinyl', 'Remove old vinyl', 'h');
INSERT INTO `job_name` VALUES ('13', 'Fleksavimas', 'Flex', 'Flex', 'm^2');
INSERT INTO `job_name` VALUES ('14', 'Šlifavimas', 'Slipe floor', 'Slipe floor', 'm^2');
INSERT INTO `job_name` VALUES ('15', 'Gruntavimas', 'Primer', 'Primer', 'm^2');
INSERT INTO `job_name` VALUES ('16', 'Glaistymas', 'Sparkle', 'Sparkle', 'm^2');
INSERT INTO `job_name` VALUES ('17', 'Klijavimas', 'Glue Vinyl', 'Glue Vinyl', 'm^2');
INSERT INTO `job_name` VALUES ('18', 'Dažymas', 'Painting', 'Painting', 'm^2');
INSERT INTO `job_name` VALUES ('19', 'Popieriaus klojimas', 'Paper cover', 'Paper cover', 'm^2');
INSERT INTO `job_name` VALUES ('20', 'Išklijuota Vinyl', 'Glue Vinyl', 'Glue Vinyl', 'm^2');
INSERT INTO `job_name` VALUES ('21', 'Išklijuota akustinio Vinyl', 'Glue acoustic vinyl', 'Glue acoustic vinyl', 'm^2');
INSERT INTO `job_name` VALUES ('22', 'Išklijuota sienų dangos', 'Glue walls', 'Glue walls', 'm^2');
INSERT INTO `job_name` VALUES ('23', 'Užlenkimų ilgis', 'Hulkil', 'Hulkil', 'm^2');

-- ----------------------------
-- Table structure for `job_to_extra_job`
-- ----------------------------
DROP TABLE IF EXISTS `job_to_extra_job`;
CREATE TABLE `job_to_extra_job` (
  `job_id` int(11) NOT NULL,
  `extra_job_id` int(11) NOT NULL,
  PRIMARY KEY (`job_id`,`extra_job_id`),
  KEY `extrajob1` (`extra_job_id`) USING BTREE,
  CONSTRAINT `job_to_extra_job_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `job_to_extra_job_ibfk_2` FOREIGN KEY (`extra_job_id`) REFERENCES `extra_job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of job_to_extra_job
-- ----------------------------
INSERT INTO `job_to_extra_job` VALUES ('8', '10');

-- ----------------------------
-- Table structure for `job_to_job_name`
-- ----------------------------
DROP TABLE IF EXISTS `job_to_job_name`;
CREATE TABLE `job_to_job_name` (
  `job_id` int(11) NOT NULL,
  `job_name_id` int(11) NOT NULL,
  `value` varchar(256) NOT NULL,
  PRIMARY KEY (`job_id`,`job_name_id`),
  KEY `job_name1` (`job_name_id`) USING BTREE,
  CONSTRAINT `job_to_job_name_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `job_to_job_name_ibfk_2` FOREIGN KEY (`job_name_id`) REFERENCES `job_name` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of job_to_job_name
-- ----------------------------
INSERT INTO `job_to_job_name` VALUES ('8', '10', '');

-- ----------------------------
-- Table structure for `job_to_material`
-- ----------------------------
DROP TABLE IF EXISTS `job_to_material`;
CREATE TABLE `job_to_material` (
  `job_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  PRIMARY KEY (`job_id`,`material_id`),
  KEY `materialid` (`material_id`) USING BTREE,
  CONSTRAINT `job_to_material_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `job_to_material_ibfk_2` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of job_to_material
-- ----------------------------
INSERT INTO `job_to_material` VALUES ('8', '14');

-- ----------------------------
-- Table structure for `language`
-- ----------------------------
DROP TABLE IF EXISTS `language`;
CREATE TABLE `language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of language
-- ----------------------------
INSERT INTO `language` VALUES ('1', 'Lietuvių k.');
INSERT INTO `language` VALUES ('2', 'Norway');
INSERT INTO `language` VALUES ('3', 'English');

-- ----------------------------
-- Table structure for `material`
-- ----------------------------
DROP TABLE IF EXISTS `material`;
CREATE TABLE `material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title_lt` varchar(1024) NOT NULL COMMENT 'Pavadinimas',
  `title_no` varchar(1024) NOT NULL COMMENT 'Pavadinimas',
  `title_en` varchar(1024) NOT NULL COMMENT 'Pavadinimas',
  `unit` varchar(256) NOT NULL COMMENT 'Matavimo vienetas',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of material
-- ----------------------------
INSERT INTO `material` VALUES ('11', 'Gruntas', 'Primer', 'Primer', 'kg');
INSERT INTO `material` VALUES ('12', 'Glaistas', 'Sparkle', 'Sparkle', 'kg');
INSERT INTO `material` VALUES ('13', 'Klijai', 'Glue', 'Glue', 'kg');
INSERT INTO `material` VALUES ('14', 'Danga', 'Vinyl', 'Vinyl', 'm^2');
INSERT INTO `material` VALUES ('15', '\"Syga\"', '\"Syga\"', '\"Syga\"', 'kg');
INSERT INTO `material` VALUES ('16', 'Dažai', 'Paint', 'Paint', 'kg');

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL COMMENT 'Pavadinimas',
  `description` text NOT NULL COMMENT 'Tekstas',
  `create_time` datetime NOT NULL COMMENT 'Data',
  `read` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Perskaitytas',
  `employee_id` int(11) NOT NULL COMMENT 'Darbuotojas',
  PRIMARY KEY (`id`),
  KEY `messa_empl` (`employee_id`) USING BTREE,
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for `month`
-- ----------------------------
DROP TABLE IF EXISTS `month`;
CREATE TABLE `month` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) NOT NULL COMMENT 'Metai',
  `month` int(2) NOT NULL COMMENT 'Mėnuo',
  `start` date NOT NULL COMMENT 'Pradžia',
  `end` date NOT NULL COMMENT 'Pabaiga',
  `week` int(11) NOT NULL COMMENT 'Savaitė',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of month
-- ----------------------------

-- ----------------------------
-- Table structure for `project`
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(8) DEFAULT NULL COMMENT 'Projekto ID',
  `title` varchar(1024) NOT NULL COMMENT 'Pavadinimas',
  `adress` text COMMENT 'Adresas',
  `customer_id` int(11) DEFAULT NULL COMMENT 'Klientas',
  `start` date DEFAULT NULL COMMENT 'Pradžia',
  `project_start` date DEFAULT NULL COMMENT 'Įgyvendinimo pradžia',
  `project_end` date DEFAULT NULL COMMENT 'Pabaiga',
  `status_id` int(11) DEFAULT NULL COMMENT 'Statusas',
  `is_checkout` tinyint(1) DEFAULT NULL COMMENT 'Sumokėta',
  `payment_date` date DEFAULT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status_fk1` (`status_id`) USING BTREE,
  KEY `customer_fk1` (`customer_id`) USING BTREE,
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `project_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('105', '2013001', 'WGI lager Stange', '', '119', '2013-01-01', null, null, null, '0', null, '0');
INSERT INTO `project` VALUES ('106', '2013002', 'WGI lager Oslo', '', '119', '2013-01-01', null, null, null, '0', null, '0');
INSERT INTO `project` VALUES ('107', '2013003', 'Kontor', '', '119', '2013-01-01', null, null, null, '0', null, '0');
INSERT INTO `project` VALUES ('108', '2013004', 'Schwartzgate 16 Drammen', '', '105', '2013-01-03', '2013-01-04', '2013-04-02', null, '1', null, '1');
INSERT INTO `project` VALUES ('109', '2013005', 'Jacob aalAkerBrygge', '', '104', '2013-01-04', null, null, null, '0', null, '0');
INSERT INTO `project` VALUES ('110', '2013006', '\'\'Festningen\'\'Kongsvinger', '', '101', '2013-01-10', '2013-01-11', '2013-01-24', null, '1', null, '1');
INSERT INTO `project` VALUES ('111', '2013007', 'Vikafrisørene', '', '101', '2013-01-18', '2013-01-19', '2013-01-22', null, '1', null, '1');
INSERT INTO `project` VALUES ('112', '2013008', 'Hjelms gate 6 Majorstue', '', '105', '2013-02-10', '2013-02-11', '2013-04-25', null, '1', null, '1');
INSERT INTO `project` VALUES ('113', '2013009', 'SAGA Kino', '', '109', '2013-01-22', '2013-01-23', '2013-02-19', null, '1', null, '1');
INSERT INTO `project` VALUES ('114', '2013010', '\'\'COLOSSEUM\'\' Kino', '', '101', '2013-01-03', '2013-01-04', '2013-01-04', null, '1', null, '1');
INSERT INTO `project` VALUES ('115', '2013011', 'Skoggata Moss', '', '106', '2013-01-16', '2013-01-17', '2013-01-17', null, '1', null, '1');
INSERT INTO `project` VALUES ('116', '2013012', 'Bergen Barnehage', '', '101', '2013-01-28', '2013-01-29', '2013-02-18', null, '1', null, '1');
INSERT INTO `project` VALUES ('117', '2013013', 'Tangen', '', '101', '2013-09-26', null, null, null, '0', null, '0');
INSERT INTO `project` VALUES ('118', '2013014', 'Sagdalen', '', '101', '2013-02-04', '2013-02-05', '2013-02-05', null, '1', null, '1');
INSERT INTO `project` VALUES ('119', '2013015', 'AkerBrygge Brygedrift', '', '104', '2013-01-03', '2013-01-04', '2013-04-29', null, '1', null, '1');
INSERT INTO `project` VALUES ('120', '2013016', 'Tromsø \"ELKJØP\"', '', '115', '2013-02-08', '2013-02-11', '2013-03-04', null, '1', null, '1');
INSERT INTO `project` VALUES ('121', '2013017', 'Sandermoen/Rønning/Kongsvinger', '', '101', '2013-01-16', '2013-01-17', '2013-09-26', null, '1', null, '1');
INSERT INTO `project` VALUES ('122', '2013018', ' Sigtunet 2 1408 Kråkstad', '', '105', '2013-02-11', '2013-02-12', '2013-02-12', null, '1', null, '1');
INSERT INTO `project` VALUES ('123', '2013019', 'ASKO Kalbakken', '', '105', '2013-02-13', '2013-02-14', '2013-03-07', null, '1', null, '1');
INSERT INTO `project` VALUES ('124', '2013020', 'Elverum DNB', null, '101', '2013-02-13', '2013-01-14', '2013-01-17', null, '1', null, '1');
INSERT INTO `project` VALUES ('125', '2013021', 'Fagprofil', null, '119', '2013-01-01', null, null, null, '0', null, '0');
INSERT INTO `project` VALUES ('126', '2013022', 'Røning Installsjon', null, '101', '2013-05-14', '2013-01-15', '2013-01-15', null, '1', null, '1');
INSERT INTO `project` VALUES ('127', '2013023', 'Trygve Stakkes Veg Kongsvinger', null, '101', '2013-01-14', '2013-01-15', '2013-01-15', null, '1', null, '1');
INSERT INTO `project` VALUES ('128', '2013024', 'Apotek 1 Gulset , Skien', null, '101', '2013-02-18', '2013-02-19', '2013-02-19', null, '1', null, '1');
INSERT INTO `project` VALUES ('129', '2013025', 'Årnes \"Apotek 1\"', null, '101', '2013-02-25', '2013-02-26', '2013-02-28', null, '1', null, '1');
INSERT INTO `project` VALUES ('130', '2013026', 'Edwin Ruds', null, '106', '2013-03-04', '2013-03-05', '2013-03-07', null, '1', null, '1');
INSERT INTO `project` VALUES ('131', '2013027', 'Tyribakken 19, Oslo', null, '105', '2013-02-27', '2013-02-28', '2013-02-28', null, '1', null, '1');
INSERT INTO `project` VALUES ('132', '2013028', 'Monglerud Frisøre', null, '101', '2013-03-10', '2013-03-11', '2013-03-15', null, '1', null, '1');
INSERT INTO `project` VALUES ('133', '2013029', 'Lillestrøm Bo og beh. senter', null, '101', '2013-03-11', '2013-03-12', '2013-03-21', null, '1', null, '1');
INSERT INTO `project` VALUES ('134', '2013030', 'Holtveien 20 1177‎ Oslo', null, '101', '2013-03-17', '2013-03-18', '2013-03-18', null, '1', null, '1');
INSERT INTO `project` VALUES ('135', '2013031', 'Otestad House', null, '120', '2013-03-17', '2013-03-18', '2013-08-29', null, '1', null, '1');
INSERT INTO `project` VALUES ('136', '2013032', 'Idun gata 2', null, '101', '2013-03-21', '2013-03-22', '2013-04-26', null, '1', null, '1');
INSERT INTO `project` VALUES ('137', '2013033', 'AkerBrygge Det Norske', null, '101', '2013-05-21', '2013-05-22', '2013-05-30', null, '1', null, '1');
INSERT INTO `project` VALUES ('138', '2013034', '\"LEFDAL\" Stømen', null, '101', '2013-04-05', '2013-04-06', '2013-04-15', null, '1', null, '1');
INSERT INTO `project` VALUES ('139', '2013035', 'Askim entreprenør AS', null, '101', '2013-04-07', '2013-04-08', '2013-04-16', null, '1', null, '1');
INSERT INTO `project` VALUES ('140', '2013036', '\"Parfymelle\" Jeshaim', null, '101', '2013-04-12', '2013-04-15', '2013-04-15', null, '1', null, '1');
INSERT INTO `project` VALUES ('141', '2013037', 'Vintebro \"ELKJØP\"', null, '115', '2013-04-16', '2013-04-17', '2013-05-04', null, '1', null, '1');
INSERT INTO `project` VALUES ('142', '2013038', 'Hasselbakken FUS-barnehage', null, '101', '2013-04-17', '2013-04-18', '2013-04-18', null, '1', null, '1');
INSERT INTO `project` VALUES ('143', '2013039', 'Apotek 1 Sarpsborg ', null, '101', '2013-04-22', '2013-04-23', '2013-04-23', null, '1', null, '1');
INSERT INTO `project` VALUES ('144', '2013040', 'Hospital Ventilation I', null, '101', '2013-09-26', '2013-09-26', '2013-09-26', null, '1', null, '1');
INSERT INTO `project` VALUES ('145', '2013041', 'Hospital Ventilation II', null, '101', '2013-06-17', '2013-06-18', '2013-09-19', null, '1', null, '1');
INSERT INTO `project` VALUES ('146', '2013042', 'Hospital 2', null, '101', '2013-09-03', '2013-09-04', '2013-09-24', null, '1', null, '0');
INSERT INTO `project` VALUES ('147', '2013043', 'Hospital 3', null, '101', '2013-09-03', '2013-09-26', null, null, '0', null, '0');
INSERT INTO `project` VALUES ('148', '2013044', 'Hospital 4', null, '101', '2013-09-02', '2013-09-26', null, null, '0', null, '0');
INSERT INTO `project` VALUES ('149', '2013045', 'Hospital 5', null, '101', '2013-09-02', '2013-09-26', null, null, '0', null, '0');
INSERT INTO `project` VALUES ('150', '2013046', 'Hospital 6', null, '101', '2013-09-02', '2013-09-26', null, null, '0', null, '0');
INSERT INTO `project` VALUES ('151', '2013047', 'Hospital 7', null, '101', '2013-09-02', '2013-09-26', null, null, '0', null, '0');
INSERT INTO `project` VALUES ('152', '2013048', 'Hospital 8', null, '101', '2013-09-02', '2013-09-26', null, null, '0', null, '0');
INSERT INTO `project` VALUES ('153', '2013049', 'Hospital 9', null, '101', '2013-09-02', '2013-09-26', null, null, '0', null, '0');
INSERT INTO `project` VALUES ('154', '2013050', 'Hospital 10', null, '101', '2013-09-02', '2013-09-26', null, null, '0', null, '0');
INSERT INTO `project` VALUES ('155', '2013051', 'Vestby \"Parfymelle\"', null, '101', '2013-04-26', '2013-04-29', '2013-05-10', null, '1', null, '1');
INSERT INTO `project` VALUES ('156', '2013052', '\'\"OLIVIA\" Restaurant', null, '101', '2013-04-26', '2013-04-29', '2013-04-29', null, '1', null, '1');
INSERT INTO `project` VALUES ('157', '2013053', 'Øvre Jacobsil BHG Tronheim', null, '107', '2013-05-03', '2013-05-06', '2013-06-12', null, '1', null, '1');
INSERT INTO `project` VALUES ('158', '2013054', '\"Vitus apotek\" Bekkestua', null, '113', '2013-05-10', '2013-05-11', '2013-06-11', null, '1', null, '1');
INSERT INTO `project` VALUES ('159', '2013055', 'Kristian walbys veg 3 2212 Kongsvinger', null, '101', '2013-05-20', '2013-05-21', '2013-05-21', null, '1', null, '1');
INSERT INTO `project` VALUES ('160', '2013056', 'Innredning og design kontor', null, '101', '2013-05-22', '2013-05-23', '2013-05-23', null, '1', null, '1');
INSERT INTO `project` VALUES ('161', '2013057', 'Apotek1 Stange', null, '101', '2013-05-22', '2013-05-23', '2013-05-29', null, '1', null, '1');
INSERT INTO `project` VALUES ('162', '2013058', 'Sparebank1 Våler', null, '101', '2013-05-26', '2013-05-27', '2013-05-29', null, '1', null, '1');
INSERT INTO `project` VALUES ('163', '2013059', 'EIK, BO OG BEHANDLINGSENT', null, '101', '2013-05-28', '2013-05-29', null, null, '0', null, '0');
INSERT INTO `project` VALUES ('164', '2013060', 'Eitilstad Barnehage', null, '101', '2013-05-21', '2013-05-22', '2013-05-22', null, '1', null, '1');
INSERT INTO `project` VALUES ('165', '2013061', 'AkerBrygge stears', null, '109', '2013-05-29', '2013-05-30', '2013-05-30', null, '1', null, '1');
INSERT INTO `project` VALUES ('166', '2013062', 'Parfymelle Drobak', null, '101', '2013-06-02', '2013-06-03', '2013-06-03', null, '1', null, '1');
INSERT INTO `project` VALUES ('167', '2013063', 'Forsikringsarbeider ØMF Kongsvinger', null, '101', '2013-06-02', '2013-06-03', '2013-06-07', null, '1', null, '1');
INSERT INTO `project` VALUES ('168', '2013064', 'Eterstad BHG service', null, '101', '2013-06-03', '2013-06-04', '2013-06-04', null, '1', null, '1');
INSERT INTO `project` VALUES ('169', '2013065', 'Slemmestad Nyveien 37', null, '105', '2013-06-04', '2013-06-05', '2013-06-25', null, '1', null, '1');
INSERT INTO `project` VALUES ('170', '2013066', 'MAXI storesenter', null, '101', '2013-06-04', '2013-06-05', '2013-06-06', null, '1', null, '1');
INSERT INTO `project` VALUES ('171', '2013067', 'Tune Bygg 4', null, '101', '2013-06-09', '2013-06-10', '2013-06-20', null, '1', null, '1');
INSERT INTO `project` VALUES ('172', '2013068', 'Elverum Kjopsenter', null, '119', '2013-06-10', '2013-06-11', '2013-06-17', null, '1', null, '1');
INSERT INTO `project` VALUES ('173', '2013069', 'Vestby BHG', null, '101', '2013-06-20', '2013-06-21', '2013-06-29', null, '1', null, '1');
INSERT INTO `project` VALUES ('174', '2013070', '\"COLOSSEUM\" Kino data room', null, '101', '2013-06-19', '2013-06-20', '2013-06-21', null, '1', null, '1');
INSERT INTO `project` VALUES ('175', '2013071', '\"LINDEX\" Sarpsborg', null, '101', '2013-06-20', '2013-06-21', '2013-07-06', null, '1', null, '1');
INSERT INTO `project` VALUES ('176', '2013072', 'Greverud Kirke', null, '101', '2013-06-24', '2013-06-25', '2013-08-14', null, '1', null, '1');
INSERT INTO `project` VALUES ('177', '2013073', 'LINDEX Tronhaim', null, '101', '2013-06-30', '2013-07-01', '2013-07-06', null, '1', null, '1');
INSERT INTO `project` VALUES ('178', '2013074', 'Kjelleveien Tønsberg', null, '101', '2013-07-28', '2013-07-29', '2013-08-15', null, '1', null, '1');
INSERT INTO `project` VALUES ('179', '2013075', 'Roverud Ugdomskole', null, '101', '2013-08-05', '2013-08-06', '2013-08-28', null, '1', null, '1');
INSERT INTO `project` VALUES ('180', '2013076', 'Sven oftedalsvei 10 Oslo', null, '119', '2013-08-21', '2013-08-22', '2013-08-30', null, '1', null, '1');
INSERT INTO `project` VALUES ('181', '2013077', 'Lorenskog \"ELKJØP\"', null, '115', '2013-08-15', '2013-08-16', '2013-08-29', null, '1', null, '1');
INSERT INTO `project` VALUES ('182', '2013078', 'Sognsveien 85 Oslo', null, '101', '2013-09-08', '2013-09-09', '2013-10-31', null, '0', null, '0');
INSERT INTO `project` VALUES ('183', '2013079', 'Urtegata 32 Oslo', null, '101', '2013-09-17', '2013-09-18', null, null, '0', null, '0');
INSERT INTO `project` VALUES ('184', '2013080', 'Kjeller Militærboliger', null, '101', '2013-09-03', '2013-09-04', null, null, '0', null, '0');
INSERT INTO `project` VALUES ('185', '2013081', 'Drammensveien 147 Oslo', null, '101', '2013-09-22', '2013-09-23', null, null, '0', null, '0');
INSERT INTO `project` VALUES ('186', '2013082', 'Rosenholm campus', null, '101', '2013-09-24', '2013-09-25', null, null, '0', null, '0');

-- ----------------------------
-- Table structure for `setting`
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `value` varchar(256) NOT NULL,
  `employee_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of setting
-- ----------------------------
INSERT INTO `setting` VALUES ('11', 'jobName/admin', '75', '21');
INSERT INTO `setting` VALUES ('12', 'material/admin', '25', '21');
INSERT INTO `setting` VALUES ('13', 'customer/admin', '50', '21');
INSERT INTO `setting` VALUES ('14', 'project/admin', '50', '21');
INSERT INTO `setting` VALUES ('15', 'project/invoice', '100', '21');
INSERT INTO `setting` VALUES ('16', 'job_name/admin', '50', '21');
INSERT INTO `setting` VALUES ('17', 'extraJob/admin', '50', '21');
INSERT INTO `setting` VALUES ('18', 'project/admin', '500', '22');
INSERT INTO `setting` VALUES ('19', 'project/invoice', '100', '22');
INSERT INTO `setting` VALUES ('20', 'project/admin', '100', '20');
INSERT INTO `setting` VALUES ('21', 'project/invoice', '50', '20');

-- ----------------------------
-- Table structure for `size`
-- ----------------------------
DROP TABLE IF EXISTS `size`;
CREATE TABLE `size` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of size
-- ----------------------------
INSERT INTO `size` VALUES ('1', 'S');
INSERT INTO `size` VALUES ('2', 'M');
INSERT INTO `size` VALUES ('3', 'L');
INSERT INTO `size` VALUES ('4', 'XL');
INSERT INTO `size` VALUES ('5', 'XXL');
INSERT INTO `size` VALUES ('6', 'XXXL');
INSERT INTO `size` VALUES ('7', '37');
INSERT INTO `size` VALUES ('8', '38');
INSERT INTO `size` VALUES ('9', '39');
INSERT INTO `size` VALUES ('10', '40');
INSERT INTO `size` VALUES ('11', '41');
INSERT INTO `size` VALUES ('12', '42');
INSERT INTO `size` VALUES ('13', '43');
INSERT INTO `size` VALUES ('14', '44');
INSERT INTO `size` VALUES ('15', '45');
INSERT INTO `size` VALUES ('16', '46');
INSERT INTO `size` VALUES ('17', '47');

-- ----------------------------
-- Table structure for `status`
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title_lt` varchar(1024) NOT NULL COMMENT 'Pavadinimas',
  `title_no` varchar(1024) NOT NULL COMMENT 'Pavadinimas',
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO `status` VALUES ('1', 'Sukurtas', '', '1');
INSERT INTO `status` VALUES ('2', 'Pradėtas', '', '1');
INSERT INTO `status` VALUES ('3', 'Užbaigtas', '', '1');
