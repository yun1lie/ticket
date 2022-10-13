/*
 Navicat Premium Data Transfer

 Source Server         : my
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : ticket

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 14/10/2022 00:57:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `adminId` int(0) NOT NULL,
  `adminKey` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`adminId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (202210, '123456');

-- ----------------------------
-- Table structure for passenger
-- ----------------------------
DROP TABLE IF EXISTS `passenger`;
CREATE TABLE `passenger`  (
  `ID` int(0) NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of passenger
-- ----------------------------
INSERT INTO `passenger` VALUES (1, 'admin', 'female', '115');
INSERT INTO `passenger` VALUES (13232, 'alice`', 'female', '115');

-- ----------------------------
-- Table structure for station
-- ----------------------------
DROP TABLE IF EXISTS `station`;
CREATE TABLE `station`  (
  `stationName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `City` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`stationName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stationop
-- ----------------------------
DROP TABLE IF EXISTS `stationop`;
CREATE TABLE `stationop`  (
  `ID` int(0) NOT NULL,
  `operation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` datetime(0) NULL DEFAULT NULL,
  `operation_pk` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `params` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket`  (
  `ID` int(0) NOT NULL AUTO_INCREMENT,
  `money` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `trainId` int(0) NULL DEFAULT NULL,
  `seat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ticket
-- ----------------------------
INSERT INTO `ticket` VALUES (1, '10', 1, '1');
INSERT INTO `ticket` VALUES (2, '20', 2, '1');

-- ----------------------------
-- Table structure for ticketpassenger
-- ----------------------------
DROP TABLE IF EXISTS `ticketpassenger`;
CREATE TABLE `ticketpassenger`  (
  `tpID` int(0) NOT NULL AUTO_INCREMENT,
  `passengerID` int(0) NULL DEFAULT NULL,
  `money` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `trainId` int(0) NULL DEFAULT NULL,
  `seat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tpID`) USING BTREE,
  INDEX `passengerID`(`passengerID`) USING BTREE,
  INDEX `trainId`(`trainId`) USING BTREE,
  CONSTRAINT `ticketpassenger_ibfk_1` FOREIGN KEY (`passengerID`) REFERENCES `passenger` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ticketpassenger_ibfk_2` FOREIGN KEY (`trainId`) REFERENCES `train` (`TrainID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ticketpassenger
-- ----------------------------
INSERT INTO `ticketpassenger` VALUES (1, 13232, '30', 1, '1');
INSERT INTO `ticketpassenger` VALUES (3, 13232, '40', 2, '1');
INSERT INTO `ticketpassenger` VALUES (4, 13232, '50', 3, 'first');
INSERT INTO `ticketpassenger` VALUES (7, 13232, '50', 2, 'first');
INSERT INTO `ticketpassenger` VALUES (13, 13232, '100', 1, 'first');
INSERT INTO `ticketpassenger` VALUES (14, 13232, '100', 1, 'first');
INSERT INTO `ticketpassenger` VALUES (15, 13232, '70', 2, 'first');
INSERT INTO `ticketpassenger` VALUES (16, 13232, '100', 1, 'second');

-- ----------------------------
-- Table structure for train
-- ----------------------------
DROP TABLE IF EXISTS `train`;
CREATE TABLE `train`  (
  `TrainID` int(0) NOT NULL,
  `TrainType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `StartStation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ArriveStation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `StartTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ArriveTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `firstSeat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `secondSeat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `firstPrice` decimal(10, 2) NULL DEFAULT NULL,
  `secondPrice` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`TrainID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of train
-- ----------------------------
INSERT INTO `train` VALUES (1, '0', 'New York', 'Waston', '2022-11-1', '2022-11-2', '36', '499', 100.00, 35.00);
INSERT INTO `train` VALUES (2, '0', 'London', 'Liverpool', '2022-09-28', '2022-09-28', '34', '100', 70.00, 25.00);
INSERT INTO `train` VALUES (3, '0', 'Conventry', 'Leeds', '2022-06-24', '2022-06-24', '27', '160', 85.00, 30.00);
INSERT INTO `train` VALUES (4, '0', 'Manchester', 'Sheffield', '2022-08-23', '2022-08-23', '56', '78', 90.00, 24.00);

-- ----------------------------
-- Table structure for trainoperation
-- ----------------------------
DROP TABLE IF EXISTS `trainoperation`;
CREATE TABLE `trainoperation`  (
  `ID` int(0) NOT NULL,
  `operation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operationPk` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `params` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userID` int(0) NOT NULL,
  `userKey` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `passengerID` int(0) NULL DEFAULT NULL,
  `jurisdiction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`userID`) USING BTREE,
  INDEX `passengerID`(`passengerID`) USING BTREE,
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`passengerID`) REFERENCES `passenger` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1001, '123456', 1, '0');
INSERT INTO `user` VALUES (202201, '123456', 13232, '1');

SET FOREIGN_KEY_CHECKS = 1;
