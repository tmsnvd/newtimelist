/*
Navicat MySQL Data Transfer

Source Server         : 185.5.54.28
Source Server Version : 50531
Source Host           : localhost:3306
Source Database       : newtimelist

Target Server Type    : MYSQL
Target Server Version : 50531
File Encoding         : 65001

Date: 2013-07-22 17:13:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `company`
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
`id`  int(11) NOT NULL ,
`title`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
`id`  int(11) NOT NULL ,
`title`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
`id`  int(11) NOT NULL ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`surname`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`address`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`password`  varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`username`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`usertype`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`phone`  varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`started`  date NULL DEFAULT NULL ,
`company_id`  int(11) NULL DEFAULT NULL ,
`language_id`  int(11) NULL DEFAULT NULL ,
`is_active`  tinyint(1) NULL DEFAULT NULL ,
`tshirt_size_id`  int(11) NULL DEFAULT NULL ,
`jersey_size_id`  int(11) NULL DEFAULT NULL ,
`trousers_size_id`  int(11) NULL DEFAULT NULL ,
`boots_size_id`  int(11) NULL DEFAULT NULL ,
`coat_size_id`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`tshirt_size_id`) REFERENCES `size` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`jersey_size_id`) REFERENCES `size` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`trousers_size_id`) REFERENCES `size` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`boots_size_id`) REFERENCES `size` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`coat_size_id`) REFERENCES `size` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `extra_job`
-- ----------------------------
DROP TABLE IF EXISTS `extra_job`;
CREATE TABLE `extra_job` (
`id`  int(11) NOT NULL ,
`title`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`language_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `job`
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
`id`  int(11) NOT NULL ,
`title`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`language_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `language`
-- ----------------------------
DROP TABLE IF EXISTS `language`;
CREATE TABLE `language` (
`id`  int(11) NOT NULL ,
`title`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `material`
-- ----------------------------
DROP TABLE IF EXISTS `material`;
CREATE TABLE `material` (
`id`  int(11) NOT NULL ,
`title`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`language_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
`id`  int(11) NOT NULL ,
`title`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Pavadinimas' ,
`description`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Tekstas' ,
`create_time`  datetime NOT NULL COMMENT 'Data' ,
`read`  tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Perskaitytas' ,
`employee_id`  int(11) NOT NULL COMMENT 'Darbuotojas' ,
PRIMARY KEY (`id`),
FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `month`
-- ----------------------------
DROP TABLE IF EXISTS `month`;
CREATE TABLE `month` (
`id`  int(11) NOT NULL ,
`start`  date NOT NULL ,
`end`  date NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `project`
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
`id`  int(11) NOT NULL ,
`pid`  varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Projekto ID' ,
`title`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Pavadinimas' ,
`adress`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'Adresas' ,
`customer_id`  int(11) NULL DEFAULT NULL COMMENT 'Klientas' ,
`start`  date NULL DEFAULT NULL COMMENT 'Pradžia' ,
`project_start`  date NULL DEFAULT NULL COMMENT 'Įgyvendinimo pradžia' ,
`project_end`  date NULL DEFAULT NULL COMMENT 'Pabaiga' ,
`status_id`  int(11) NULL DEFAULT NULL COMMENT 'Statusas' ,
`is_checkout`  tinyint(1) NULL DEFAULT NULL COMMENT 'Sumokėta' ,
PRIMARY KEY (`id`),
FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `size`
-- ----------------------------
DROP TABLE IF EXISTS `size`;
CREATE TABLE `size` (
`id`  int(11) NOT NULL ,
`title`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `status`
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
`id`  int(11) NOT NULL ,
`title`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`language_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Indexes structure for table employee
-- ----------------------------
CREATE INDEX `size_fk1` ON `employee`(`tshirt_size_id`) USING BTREE ;
CREATE INDEX `size_fk2` ON `employee`(`jersey_size_id`) USING BTREE ;
CREATE INDEX `size_fk3` ON `employee`(`trousers_size_id`) USING BTREE ;
CREATE INDEX `size_fk4` ON `employee`(`boots_size_id`) USING BTREE ;
CREATE INDEX `size_fk5` ON `employee`(`coat_size_id`) USING BTREE ;
CREATE INDEX `lang_fk3` ON `employee`(`language_id`) USING BTREE ;
CREATE INDEX `comp_fk1` ON `employee`(`company_id`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table extra_job
-- ----------------------------
CREATE INDEX `lang_fk1` ON `extra_job`(`language_id`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table material
-- ----------------------------
CREATE INDEX `lang_fk2` ON `material`(`language_id`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table message
-- ----------------------------
CREATE INDEX `messa_empl` ON `message`(`employee_id`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table project
-- ----------------------------
CREATE INDEX `status_fk1` ON `project`(`status_id`) USING BTREE ;
CREATE INDEX `customer_fk1` ON `project`(`customer_id`) USING BTREE ;
