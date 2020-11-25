/*
 Navicat Premium Data Transfer

 Source Server         : localhost-mysql
 Source Server Type    : MySQL
 Source Server Version : 50730
 Source Host           : localhost:3306
 Source Schema         : ssm

 Target Server Type    : MySQL
 Target Server Version : 50730
 File Encoding         : 65001

 Date: 25/11/2020 23:02:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phoneNum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('38cecbcc-1818-11ea-8c63-f430b9d976db', '张三', '小张', '17456123789', '1234568524@qq.com');
INSERT INTO `member` VALUES ('72b7f46e-1819-11ea-8c63-f430b9d976db', '李四', '小李', '15642662654', '543168456@qq.com');
INSERT INTO `member` VALUES ('72b88d99-1819-11ea-8c63-f430b9d976db', '王五', '小王', '13454678123', '4166316579@qq.com');
INSERT INTO `member` VALUES ('72b90d5c-1819-11ea-8c63-f430b9d976db', '赵六', '小赵', '15456781364', '13468516456@qq.com');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `orderNum` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `orderTime` datetime(0) NULL DEFAULT NULL,
  `peopleCount` int(10) NULL DEFAULT NULL,
  `orderDesc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `payType` int(10) NULL DEFAULT NULL,
  `orderStatus` int(10) NULL DEFAULT NULL,
  `productId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `memberId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `productId`(`productId`) USING BTREE,
  INDEX `memberId`(`memberId`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`memberId`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('25d25ec3-181a-11ea-8c63-f430b9d976db', '67890', '2020-10-02 12:00:00', 5, '第一个订单', 0, 1, '55939db0-1696-11ea-8b75-f430b9d976db', '38cecbcc-1818-11ea-8c63-f430b9d976db');
INSERT INTO `orders` VALUES ('962a7670-1819-11ea-8c63-f430b9d976db', '45613', '2020-10-02 12:00:00', 2, '第二个订单', 0, 1, '55939db0-1696-11ea-8b75-f430b9d976db', '72b7f46e-1819-11ea-8c63-f430b9d976db');
INSERT INTO `orders` VALUES ('962b19fc-1819-11ea-8c63-f430b9d976db', '46519', '2020-10-02 12:00:00', 3, '第三个订单', 1, 1, '5c8d4c9c-1770-11ea-8c63-f430b9d976db', '72b7f46e-1819-11ea-8c63-f430b9d976db');
INSERT INTO `orders` VALUES ('962b66d5-1819-11ea-8c63-f430b9d976db', '67891', '2020-10-02 12:00:00', 0, '第四个订单', 2, 1, '5c8d4c9c-1770-11ea-8c63-f430b9d976db', '72b88d99-1819-11ea-8c63-f430b9d976db');
INSERT INTO `orders` VALUES ('962bae70-1819-11ea-8c63-f430b9d976db', '69851', '2020-10-02 12:00:00', 0, '第五个订单', 1, 1, '85d7c6bb-176d-11ea-8c63-f430b9d976db', '72b88d99-1819-11ea-8c63-f430b9d976db');
INSERT INTO `orders` VALUES ('962bff28-1819-11ea-8c63-f430b9d976db', '67892', '2020-10-02 12:00:00', 0, '第六个订单', 1, 0, '85d7c6bb-176d-11ea-8c63-f430b9d976db', '72b88d99-1819-11ea-8c63-f430b9d976db');
INSERT INTO `orders` VALUES ('962c470a-1819-11ea-8c63-f430b9d976db', '67893', '2020-10-02 12:00:00', 0, '第七个订单', 0, 1, 'b618954c-1696-11ea-8b75-f430b9d976db', '72b90d5c-1819-11ea-8c63-f430b9d976db');
INSERT INTO `orders` VALUES ('962c90b1-1819-11ea-8c63-f430b9d976db', '67894', '2020-10-02 12:00:00', 0, '第八个订单', 0, 1, 'ba5ad7eb-1696-11ea-8b75-f430b9d976db', '72b90d5c-1819-11ea-8c63-f430b9d976db');
INSERT INTO `orders` VALUES ('d33634fa-1818-11ea-8c63-f430b9d976db', '67895', '2020-10-02 12:00:00', 0, '第九个订单', 0, 1, '55939db0-1696-11ea-8b75-f430b9d976db', '38cecbcc-1818-11ea-8c63-f430b9d976db');
INSERT INTO `orders` VALUES ('d37a836b-1819-11ea-8c63-f430b9d976db', '67896', '2020-10-02 12:00:00', 0, '第十个订单', 0, 1, '55939db0-1696-11ea-8b75-f430b9d976db', '38cecbcc-1818-11ea-8c63-f430b9d976db');
INSERT INTO `orders` VALUES ('d37acedb-1819-11ea-8c63-f430b9d976db', '67897', '2020-10-02 12:00:00', 0, '第十一个订单', 0, 1, '55939db0-1696-11ea-8b75-f430b9d976db', '72b7f46e-1819-11ea-8c63-f430b9d976db');
INSERT INTO `orders` VALUES ('d37b0ce3-1819-11ea-8c63-f430b9d976db', '67898', '2020-10-02 12:00:00', 0, '第十二个订单', 0, 1, '5c8d4c9c-1770-11ea-8c63-f430b9d976db', '72b7f46e-1819-11ea-8c63-f430b9d976db');
INSERT INTO `orders` VALUES ('d37b5832-1819-11ea-8c63-f430b9d976db', '67899', '2020-10-02 12:00:00', 0, '第十三个订单', 0, 1, '5c8d4c9c-1770-11ea-8c63-f430b9d976db', '72b88d99-1819-11ea-8c63-f430b9d976db');
INSERT INTO `orders` VALUES ('d37b9b76-1819-11ea-8c63-f430b9d976db', '67900', '2020-10-02 12:00:00', 0, '第十四个订单', 0, 1, '85d7c6bb-176d-11ea-8c63-f430b9d976db', '72b88d99-1819-11ea-8c63-f430b9d976db');
INSERT INTO `orders` VALUES ('d37bd7a9-1819-11ea-8c63-f430b9d976db', '67901', '2020-10-02 12:00:00', 0, '第十五个订单', 0, 1, '85d7c6bb-176d-11ea-8c63-f430b9d976db', '72b88d99-1819-11ea-8c63-f430b9d976db');
INSERT INTO `orders` VALUES ('d37c2955-1819-11ea-8c63-f430b9d976db', '67902', '2020-10-02 12:00:00', 0, '第十六个订单', 0, 1, 'b618954c-1696-11ea-8b75-f430b9d976db', '72b90d5c-1819-11ea-8c63-f430b9d976db');
INSERT INTO `orders` VALUES ('d37c960a-1819-11ea-8c63-f430b9d976db', '67903', '2020-10-02 12:00:00', 0, '第十七个订单', 0, 1, 'ba5ad7eb-1696-11ea-8b75-f430b9d976db', '72b90d5c-1819-11ea-8c63-f430b9d976db');

-- ----------------------------
-- Table structure for orders_traveller
-- ----------------------------
DROP TABLE IF EXISTS `orders_traveller`;
CREATE TABLE `orders_traveller`  (
  `ordersId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `travellerId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `ordersId`(`ordersId`) USING BTREE,
  INDEX `travellerId`(`travellerId`) USING BTREE,
  CONSTRAINT `orders_traveller_ibfk_1` FOREIGN KEY (`ordersId`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_traveller_ibfk_2` FOREIGN KEY (`travellerId`) REFERENCES `traveller` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orders_traveller
-- ----------------------------
INSERT INTO `orders_traveller` VALUES ('25d25ec3-181a-11ea-8c63-f430b9d976db', 'ff1a3ace-183c-11ea-8c63-f430b9d976db');
INSERT INTO `orders_traveller` VALUES ('25d25ec3-181a-11ea-8c63-f430b9d976db', 'ff1c0839-183c-11ea-8c63-f430b9d976db');
INSERT INTO `orders_traveller` VALUES ('25d25ec3-181a-11ea-8c63-f430b9d976db', 'ff1c6b5f-183c-11ea-8c63-f430b9d976db');
INSERT INTO `orders_traveller` VALUES ('25d25ec3-181a-11ea-8c63-f430b9d976db', 'ff1d88be-183c-11ea-8c63-f430b9d976db');
INSERT INTO `orders_traveller` VALUES ('25d25ec3-181a-11ea-8c63-f430b9d976db', 'ff1cde41-183c-11ea-8c63-f430b9d976db');
INSERT INTO `orders_traveller` VALUES ('962a7670-1819-11ea-8c63-f430b9d976db', 'ff1a3ace-183c-11ea-8c63-f430b9d976db');
INSERT INTO `orders_traveller` VALUES ('962a7670-1819-11ea-8c63-f430b9d976db', 'ff1c0839-183c-11ea-8c63-f430b9d976db');
INSERT INTO `orders_traveller` VALUES ('962b19fc-1819-11ea-8c63-f430b9d976db', 'ff1c6b5f-183c-11ea-8c63-f430b9d976db');
INSERT INTO `orders_traveller` VALUES ('962b19fc-1819-11ea-8c63-f430b9d976db', 'ff1d88be-183c-11ea-8c63-f430b9d976db');
INSERT INTO `orders_traveller` VALUES ('962b19fc-1819-11ea-8c63-f430b9d976db', 'ff1cde41-183c-11ea-8c63-f430b9d976db');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `permissionName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('31f31ef5-197d-11ea-8c63-f430b9d976db', 'user.findAll', '/user/findAll.do');
INSERT INTO `permission` VALUES ('31f38fc6-197d-11ea-8c63-f430b9d976db', 'user.findById', '/user/findById.do');
INSERT INTO `permission` VALUES ('ae7c4a70-1990-11ea-8c63-f430b9d976db', 'role.findAll', '/role/findAll.do');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `productNum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `productName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cityName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DepartureTime` datetime(0) NULL DEFAULT NULL,
  `productPrice` decimal(10, 2) NULL DEFAULT NULL,
  `productDesc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `productStatus` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('55939db0-1696-11ea-8b75-f430b9d976db', 'itcase-001', '北京三日游', '北京', '2019-12-01 10:10:00', 1200.00, '不错的旅行', 1);
INSERT INTO `product` VALUES ('5c8d4c9c-1770-11ea-8c63-f430b9d976db', 'itcase-005', '广州一日游', '广州', '2019-12-13 13:00:00', 1000.00, '这是一个不错的产品！', 1);
INSERT INTO `product` VALUES ('85d7c6bb-176d-11ea-8c63-f430b9d976db', 'itcase-004', '西藏旅行', '拉萨', '2020-01-10 12:00:00', 988.00, '西藏的风景不错', 1);
INSERT INTO `product` VALUES ('b618954c-1696-11ea-8b75-f430b9d976db', 'itcase-002', '上海五日游', '上海', '2019-12-01 10:10:00', 1800.00, '魔都我来了', 0);
INSERT INTO `product` VALUES ('ba5ad7eb-1696-11ea-8b75-f430b9d976db', 'itcase-003', '杭州七日游', '杭州', '2019-12-01 10:10:00', 1200.00, '我爱杭州', 1);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `roleName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roleDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('0d6d42a7-18f1-11ea-8c63-f430b9d976db', 'USER', '普通用户');
INSERT INTO `role` VALUES ('36313847-198c-11ea-8c63-f430b9d976db', 'guest', '测试账户');
INSERT INTO `role` VALUES ('cc905c36-18f0-11ea-8c63-f430b9d976db', 'ADMIN', '管理员');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `roleId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `permissionId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `roleId`(`roleId`) USING BTREE,
  INDEX `permissionId`(`permissionId`) USING BTREE,
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('cc905c36-18f0-11ea-8c63-f430b9d976db', '31f31ef5-197d-11ea-8c63-f430b9d976db');
INSERT INTO `role_permission` VALUES ('cc905c36-18f0-11ea-8c63-f430b9d976db', '31f38fc6-197d-11ea-8c63-f430b9d976db');
INSERT INTO `role_permission` VALUES ('0d6d42a7-18f1-11ea-8c63-f430b9d976db', '31f31ef5-197d-11ea-8c63-f430b9d976db');
INSERT INTO `role_permission` VALUES ('36313847-198c-11ea-8c63-f430b9d976db', '31f31ef5-197d-11ea-8c63-f430b9d976db');
INSERT INTO `role_permission` VALUES ('36313847-198c-11ea-8c63-f430b9d976db', '31f38fc6-197d-11ea-8c63-f430b9d976db');

-- ----------------------------
-- Table structure for syslog
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `visitTime` datetime(0) NULL DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `executionTime` bigint(100) NULL DEFAULT NULL,
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of syslog
-- ----------------------------
INSERT INTO `syslog` VALUES ('010316f8-2f23-11eb-ab07-f430b9d976db', '2020-11-25 21:34:55', 'root', '0:0:0:0:0:0:0:1', '/user/findAll.do', 35, '[??]com.hrp.ssm.controller.UserController[???]findAll');
INSERT INTO `syslog` VALUES ('01116103-2007-11ea-a8dd-f430b9d976db', '2019-12-16 21:21:44', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 99, '[类名]com.hrp.ssm.controller.OrdersController[方法名]findAll');
INSERT INTO `syslog` VALUES ('0258aead-1b53-11ea-a4ae-f430b9d976db', '2019-12-10 21:43:12', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 43, '[类名]com.hrp.ssm.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('0359a39a-2007-11ea-a8dd-f430b9d976db', '2019-12-16 21:21:48', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 17, '[类名]com.hrp.ssm.controller.OrdersController[方法名]findAll');
INSERT INTO `syslog` VALUES ('03661734-2f23-11eb-ab07-f430b9d976db', '2020-11-25 21:34:59', 'root', '0:0:0:0:0:0:0:1', '/user/findAll.do', 4, '[??]com.hrp.ssm.controller.UserController[???]findAll');
INSERT INTO `syslog` VALUES ('046a8d21-2007-11ea-a8dd-f430b9d976db', '2019-12-16 21:21:49', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 18, '[类名]com.hrp.ssm.controller.OrdersController[方法名]findAll');
INSERT INTO `syslog` VALUES ('05a02378-2007-11ea-a8dd-f430b9d976db', '2019-12-16 21:21:51', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 11, '[类名]com.hrp.ssm.controller.OrdersController[方法名]findAll');
INSERT INTO `syslog` VALUES ('06897467-2f23-11eb-ab07-f430b9d976db', '2020-11-25 21:35:04', 'root', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 13, '[??]com.hrp.ssm.controller.UserController[???]findUserByIdAndAllRole');
INSERT INTO `syslog` VALUES ('07e97560-2007-11ea-a8dd-f430b9d976db', '2019-12-16 21:21:55', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 10, '[类名]com.hrp.ssm.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('0b113c42-2f23-11eb-ab07-f430b9d976db', '2020-11-25 21:35:12', 'root', '0:0:0:0:0:0:0:1', '/role/findAll.do', 20, '[??]com.hrp.ssm.controller.RoleController[???]findAll');
INSERT INTO `syslog` VALUES ('0b8a1813-3ec6-11ea-839f-f430b9d976db', '2020-01-25 00:24:50', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 219, '[类名]com.hrp.ssm.controller.OrdersController[方法名]findAll');
INSERT INTO `syslog` VALUES ('0d87ffe7-3ec6-11ea-839f-f430b9d976db', '2020-01-25 00:24:53', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 14, '[类名]com.hrp.ssm.controller.OrdersController[方法名]findAll');
INSERT INTO `syslog` VALUES ('0f06b0da-3ec6-11ea-839f-f430b9d976db', '2020-01-25 00:24:56', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 26, '[类名]com.hrp.ssm.controller.RoleController[方法名]findAll');
INSERT INTO `syslog` VALUES ('18a434de-1b54-11ea-a4ae-f430b9d976db', '2019-12-10 21:50:59', 'root', '127.0.0.1', '/product/findAll.do', 12, '[类名]com.hrp.ssm.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('33e27b6a-3e84-11ea-8491-f430b9d976db', '2020-01-24 16:33:31', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 40, '[类名]com.hrp.ssm.controller.UserController[方法名]findAll');
INSERT INTO `syslog` VALUES ('43343317-3e84-11ea-8491-f430b9d976db', '2020-01-24 16:33:57', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 90, '[类名]com.hrp.ssm.controller.OrdersController[方法名]findAll');
INSERT INTO `syslog` VALUES ('450f9cde-3e84-11ea-8491-f430b9d976db', '2020-01-24 16:34:00', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 20, '[类名]com.hrp.ssm.controller.OrdersController[方法名]findAll');
INSERT INTO `syslog` VALUES ('459fe950-3e84-11ea-8491-f430b9d976db', '2020-01-24 16:34:01', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 10, '[类名]com.hrp.ssm.controller.OrdersController[方法名]findAll');
INSERT INTO `syslog` VALUES ('cb9c0da6-1b53-11ea-a4ae-f430b9d976db', '2019-12-10 21:48:49', 'admin', '127.0.0.1', '/orders/findAll.do', 148, '[类名]com.hrp.ssm.controller.OrdersController[方法名]findAll');
INSERT INTO `syslog` VALUES ('d045b25c-6a56-11ea-b2b0-f430b9d976db', '2020-03-20 10:59:26', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 81, '[类名]com.hrp.ssm.controller.UserController[方法名]findAll');
INSERT INTO `syslog` VALUES ('d1b4ab40-1b56-11ea-a4ae-f430b9d976db', '2019-12-10 22:10:28', 'root', '127.0.0.1', '/user/findAll.do', 22, '[类名]com.hrp.ssm.controller.UserController[方法名]findAll');
INSERT INTO `syslog` VALUES ('d57961d4-1b53-11ea-a4ae-f430b9d976db', '2019-12-10 21:49:06', 'admin', '127.0.0.1', '/role/findAll.do', 17, '[类名]com.hrp.ssm.controller.RoleController[方法名]findAll');
INSERT INTO `syslog` VALUES ('d753bed4-6a56-11ea-b2b0-f430b9d976db', '2020-03-20 10:59:38', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 15, '[类名]com.hrp.ssm.controller.UserController[方法名]findAll');
INSERT INTO `syslog` VALUES ('fb2d89f7-2006-11ea-a8dd-f430b9d976db', '2019-12-16 21:21:34', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 57, '[类名]com.hrp.ssm.controller.UserController[方法名]findAll');
INSERT INTO `syslog` VALUES ('fe944c01-2006-11ea-a8dd-f430b9d976db', '2019-12-16 21:21:40', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 31, '[类名]com.hrp.ssm.controller.ProductController[方法名]findAll');

-- ----------------------------
-- Table structure for traveller
-- ----------------------------
DROP TABLE IF EXISTS `traveller`;
CREATE TABLE `traveller`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phoneNum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `credentialsType` int(10) NULL DEFAULT NULL,
  `credentialsNum` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `travellerType` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of traveller
-- ----------------------------
INSERT INTO `traveller` VALUES ('ff1a3ace-183c-11ea-8c63-f430b9d976db', '张三', '男', '135456789123', 0, '360789199810235689', 0);
INSERT INTO `traveller` VALUES ('ff1c0839-183c-11ea-8c63-f430b9d976db', '李四', '男', '135465133731', 0, '360789199410146956', 0);
INSERT INTO `traveller` VALUES ('ff1c6b5f-183c-11ea-8c63-f430b9d976db', '章明', '男', '135456465463', 0, '360789199101161687', 0);
INSERT INTO `traveller` VALUES ('ff1cde41-183c-11ea-8c63-f430b9d976db', '赵琦', '女', '135456784145', 0, '360789194304155689', 0);
INSERT INTO `traveller` VALUES ('ff1d20db-183c-11ea-8c63-f430b9d976db', '刘思', '女', '138456234123', 0, '360789199803024645', 0);
INSERT INTO `traveller` VALUES ('ff1d88be-183c-11ea-8c63-f430b9d976db', '拉丝', '男', '189453164845', 1, '360789199108256766', 0);
INSERT INTO `traveller` VALUES ('ff1dd198-183c-11ea-8c63-f430b9d976db', '余斌', '男', '135456789123', 0, '360789199406114567', 0);
INSERT INTO `traveller` VALUES ('ff1e4ba4-183c-11ea-8c63-f430b9d976db', '曾武', '男', '135456789123', 2, '360789200001051234', 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phoneNum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('6f316267-1a8e-11ea-8c63-f430b9d976db', '168743163@qq.com', 'iu', '$2a$10$LOvLMo.YqoZo42pAlekWKutAguep9zU/NOfTY4oM3dR4nGFabhPB2', '16456789132', 1);
INSERT INTO `user` VALUES ('75634081-1899-11ea-8c63-f430b9d976db', '1234568524@qq.com', 'admin', '$2a$10$LOvLMo.YqoZo42pAlekWKutAguep9zU/NOfTY4oM3dR4nGFabhPB2', '135456789123', 1);
INSERT INTO `user` VALUES ('7563ee6f-1899-11ea-8c63-f430b9d976db', '5431684564@qq.com', 'root', '$2a$10$LOvLMo.YqoZo42pAlekWKutAguep9zU/NOfTY4oM3dR4nGFabhPB2', '164567891346', 1);
INSERT INTO `user` VALUES ('75643db6-1899-11ea-8c63-f430b9d976db', '4531646316@qq.com', '123', '$2a$10$LOvLMo.YqoZo42pAlekWKutAguep9zU/NOfTY4oM3dR4nGFabhPB2', '136494134646', 1);
INSERT INTO `user` VALUES ('75648d91-1899-11ea-8c63-f430b9d976db', '45319612456@qq.com', 'sss', '$2a$10$LOvLMo.YqoZo42pAlekWKutAguep9zU/NOfTY4oM3dR4nGFabhPB2', '164567137461', 0);
INSERT INTO `user` VALUES ('7564e188-1899-11ea-8c63-f430b9d976db', '7619434663@qq.com', '222', '$2a$10$LOvLMo.YqoZo42pAlekWKutAguep9zU/NOfTY4oM3dR4nGFabhPB2', '197416541345', 0);
INSERT INTO `user` VALUES ('75652272-1899-11ea-8c63-f430b9d976db', '1234567464@qq.com', '雷阳波', '$2a$10$LOvLMo.YqoZo42pAlekWKutAguep9zU/NOfTY4oM3dR4nGFabhPB2', '154567231646', 1);
INSERT INTO `user` VALUES ('f49ac582-1960-11ea-8c63-f430b9d976db', '2134125325@qq.com', '奥巴马', '$2a$10$LOvLMo.YqoZo42pAlekWKutAguep9zU/NOfTY4oM3dR4nGFabhPB2', '16456789134', 1);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `userId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roleId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `userId`(`userId`) USING BTREE,
  INDEX `roleId`(`roleId`) USING BTREE,
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('75634081-1899-11ea-8c63-f430b9d976db', 'cc905c36-18f0-11ea-8c63-f430b9d976db');
INSERT INTO `user_role` VALUES ('75634081-1899-11ea-8c63-f430b9d976db', '0d6d42a7-18f1-11ea-8c63-f430b9d976db');
INSERT INTO `user_role` VALUES ('75648d91-1899-11ea-8c63-f430b9d976db', '0d6d42a7-18f1-11ea-8c63-f430b9d976db');
INSERT INTO `user_role` VALUES ('75648d91-1899-11ea-8c63-f430b9d976db', 'cc905c36-18f0-11ea-8c63-f430b9d976db');
INSERT INTO `user_role` VALUES ('7563ee6f-1899-11ea-8c63-f430b9d976db', '0d6d42a7-18f1-11ea-8c63-f430b9d976db');
INSERT INTO `user_role` VALUES ('7563ee6f-1899-11ea-8c63-f430b9d976db', '36313847-198c-11ea-8c63-f430b9d976db');
INSERT INTO `user_role` VALUES ('7563ee6f-1899-11ea-8c63-f430b9d976db', 'cc905c36-18f0-11ea-8c63-f430b9d976db');
INSERT INTO `user_role` VALUES ('75643db6-1899-11ea-8c63-f430b9d976db', '0d6d42a7-18f1-11ea-8c63-f430b9d976db');
INSERT INTO `user_role` VALUES ('75634081-1899-11ea-8c63-f430b9d976db', '36313847-198c-11ea-8c63-f430b9d976db');

SET FOREIGN_KEY_CHECKS = 1;
