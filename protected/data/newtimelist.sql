/*
Navicat MySQL Data Transfer

Source Server         : 185.5.54.28
Source Server Version : 50531
Source Host           : localhost:3306
Source Database       : newtimelist

Target Server Type    : MYSQL
Target Server Version : 50531
File Encoding         : 65001

Date: 2013-08-25 17:07:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `company`
-- ----------------------------
-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('1', 'Indoreka');
INSERT INTO `company` VALUES ('2', 'Norvegiška kompanija');

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('101', 'Klientas 1', '');
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

-- ----------------------------
-- Table structure for `employee`
-- ----------------------------

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('4', 'Tomas', 'Neverdauskas', 'Pakalnių 50', '$2a$04$NkdHh6Y3xC1z7VXhWwsOne3Mmqy66oS9P/AcWs.txL6G7xRwga1q2', 'tomnev', 'topazas@gmail.com', 'admin', '123456', '2013-01-04', '1', '1', '1', '2', '3', '2', '5', '1');

-- ----------------------------
-- Table structure for `extra_job`
-- ----------------------------

-- ----------------------------
-- Records of extra_job
-- ----------------------------
INSERT INTO `extra_job` VALUES ('9', 'Durų išėmimas', 'Removing the Door');
INSERT INTO `extra_job` VALUES ('10', 'Laukimas kol atrakins objektą', 'Waiting before open this Objekt');
INSERT INTO `extra_job` VALUES ('11', 'Dulkių valymas', 'Dust Cleaning');
INSERT INTO `extra_job` VALUES ('12', 'Valymas', 'Cleaning');
INSERT INTO `extra_job` VALUES ('13', 'Baldų kraustymas', 'Moving Furniture');
INSERT INTO `extra_job` VALUES ('14', 'Medžiagų laukimas', 'Waiting for Materials');

-- ----------------------------
-- Table structure for `job`
-- ----------------------------

-- ----------------------------
-- Records of job
-- ----------------------------

-- ----------------------------
-- Table structure for `job_name`
-- ----------------------------

-- ----------------------------
-- Records of job_name
-- ----------------------------
INSERT INTO `job_name` VALUES ('8', 'Šlifavimas', 'Slipe Floor');
INSERT INTO `job_name` VALUES ('9', 'Ruoša', 'Make ready');
INSERT INTO `job_name` VALUES ('10', 'Medžiagų pristatymas', 'Material deliveries');
INSERT INTO `job_name` VALUES ('11', 'Dangos įnešimas/išnešimas', 'Vinyl loading/unloading');
INSERT INTO `job_name` VALUES ('12', 'Senos dangos šalinimas', 'Remove old vinyl');
INSERT INTO `job_name` VALUES ('13', 'Fleksavimas', 'Flex');
INSERT INTO `job_name` VALUES ('14', 'Šlifavimas', 'Slipe floor');
INSERT INTO `job_name` VALUES ('15', 'Gruntavimas', 'Primer');
INSERT INTO `job_name` VALUES ('16', 'Glaistymas', 'Sparkle');
INSERT INTO `job_name` VALUES ('17', 'Klijavimas', 'Glue Vinyl');
INSERT INTO `job_name` VALUES ('18', 'Dažymas', 'Paint');
INSERT INTO `job_name` VALUES ('19', 'Popieriaus klojimas', 'Paper cover');
INSERT INTO `job_name` VALUES ('20', 'Išklijuota Vinyl', 'Glue Vinyl');
INSERT INTO `job_name` VALUES ('21', 'Išklijuota akustinio Vinyl', 'Glue acoustic vinyl');
INSERT INTO `job_name` VALUES ('22', 'Išklijuota sienų dangos', 'Glue walls');
INSERT INTO `job_name` VALUES ('23', 'Užlenkimų ilgis', 'Hulkil');

-- ----------------------------
-- Table structure for `language`
-- ----------------------------
-- ----------------------------
-- Records of language
-- ----------------------------
INSERT INTO `language` VALUES ('1', 'Lietuvių k.');
INSERT INTO `language` VALUES ('2', 'Norvegų k.');
INSERT INTO `language` VALUES ('3', 'Anglų k.');

-- ----------------------------
-- Table structure for `material`
-- ----------------------------

-- ----------------------------
-- Records of material
-- ----------------------------
INSERT INTO `material` VALUES ('11', 'Gruntas', 'Primer');
INSERT INTO `material` VALUES ('12', 'Glaistas', 'Sparkle');
INSERT INTO `material` VALUES ('13', 'Klijai', 'Glue');
INSERT INTO `material` VALUES ('14', 'Danga', 'Vinyl');
INSERT INTO `material` VALUES ('15', '\"Syga\"', '\"Syga\"');
INSERT INTO `material` VALUES ('16', 'Dažai', 'Paint');

-- ----------------------------
-- Table structure for `message`
-- ----------------------------

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('2', 'Dėl atostogų', 'Prašau mane išleisti atostogų', '2013-07-16 00:00:00', '0', '4');
INSERT INTO `message` VALUES ('3', 'Dėl darbo', 'Prašau mane išleisti iš darbo, nes chaltūra gerai eina', '2013-07-16 00:00:00', '1', '4');

-- ----------------------------
-- Table structure for `month`
-- ----------------------------

-- ----------------------------
-- Records of month
-- ----------------------------
INSERT INTO `month` VALUES ('7', '2013', '2013-08-05', '2013-08-17', '33');

-- ----------------------------
-- Table structure for `project`
-- ----------------------------

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('105', '2013001', 'WGI lager Stange', '', '101', '2011-01-01', '2011-01-01', '0000-00-00', null, '0');
INSERT INTO `project` VALUES ('106', '2013002', 'WGI lager Oslo', '', '101', '2011-01-01', '2011-01-01', '0000-00-00', null, '0');
INSERT INTO `project` VALUES ('107', '2013003', 'Kontor', '', '101', '2011-01-01', '2011-01-01', '0000-00-00', null, '0');
INSERT INTO `project` VALUES ('108', '2013004', 'Schwartzgate 16 Drammen', '', '105', '2013-08-21', '2013-08-21', '2013-08-21', null, '1');
INSERT INTO `project` VALUES ('109', '2013005', 'Jacob aalAkerBrygge', '', '104', '2013-01-02', '2013-01-02', '2016-01-04', null, '0');
INSERT INTO `project` VALUES ('110', '2013006', '\'\'Festningen\'\'Kongsvinger', '', '101', '2013-01-11', '2013-01-11', '2013-01-24', null, '1');
INSERT INTO `project` VALUES ('111', '2013007', 'Vikafrisørene', '', '101', '2013-01-19', '2013-01-19', '2013-01-22', null, '1');
INSERT INTO `project` VALUES ('112', '2013008', 'Hjelms gate 6 Majorstue', '', '105', '2013-02-11', '2013-02-11', '2013-04-25', null, '1');
INSERT INTO `project` VALUES ('113', '2013009', 'SAGA Kino', '', '109', '2013-01-23', '2013-01-23', '2013-02-19', null, '1');
INSERT INTO `project` VALUES ('114', '2013010', '\'\'COLOSSEUM\'\' Kino', '', '101', '2013-01-04', '2013-01-04', '2013-04-01', null, '1');
INSERT INTO `project` VALUES ('115', '2013011', 'Skoggata Moss', '', '106', '2013-01-17', '2013-01-17', '2013-01-17', null, '1');
INSERT INTO `project` VALUES ('116', '2013012', 'Bergen Barnehage', '', '101', '2013-01-29', '2013-01-29', '2013-04-24', null, '1');
INSERT INTO `project` VALUES ('117', '2013013', 'Tangen', '', '101', '0000-00-00', '0000-00-00', '0000-00-00', null, '0');
INSERT INTO `project` VALUES ('118', '2013014', 'Sagdalen', '', '101', '2013-02-05', '2013-02-05', '2013-02-05', null, '1');
INSERT INTO `project` VALUES ('119', '2013015', 'AkerBrygge Brygedrift', '', '104', '2013-01-04', '2013-01-04', '2013-04-29', null, '1');
INSERT INTO `project` VALUES ('120', '2013016', 'Tromsø \"ELKJØP\"', '', '115', '2013-02-11', '2013-02-11', '2013-03-04', null, '1');
INSERT INTO `project` VALUES ('121', '2013017', 'Sandermoen/Rønning/Kongsvinger', '', '101', '2013-01-17', '2013-01-17', '0000-00-00', null, '0');

-- ----------------------------
-- Table structure for `size`
-- ----------------------------

-- ----------------------------
-- Records of size
-- ----------------------------
INSERT INTO `size` VALUES ('1', 'S');
INSERT INTO `size` VALUES ('2', 'M');
INSERT INTO `size` VALUES ('3', 'L');
INSERT INTO `size` VALUES ('4', 'XL');
INSERT INTO `size` VALUES ('5', 'XXL');
INSERT INTO `size` VALUES ('6', '2XL');
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

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO `status` VALUES ('1', 'Sukurtas', '', '1');
INSERT INTO `status` VALUES ('2', 'Pradėtas', '', '1');
INSERT INTO `status` VALUES ('3', 'Užbaigtas', '', '1');
