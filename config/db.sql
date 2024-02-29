
----------------------------table------------------------------------


/*
 Navicat Premium Data Transfer

 Source Server         : --DOCKER--MySQL80
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : mall

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 27/02/2024 15:03:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for banners
-- ----------------------------
DROP TABLE IF EXISTS `banners`;
CREATE TABLE `banners` (
                           `id` bigint NOT NULL,
                           `image` varchar(255) NOT NULL COMMENT '图片地址',
                           `url` varchar(255) NOT NULL COMMENT '跳转地址',
                           `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态1生效2无效',
                           `sort` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '排序',
                           `type` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '预留字段',
                           `insert_time` datetime NOT NULL COMMENT '创建时间',
                           `update_time` datetime NOT NULL COMMENT '更新时间',
                           PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
                              `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                              `name` varchar(255) NOT NULL DEFAULT '',
                              `icon` varchar(255) NOT NULL DEFAULT '',
                              `sort` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '排序',
                              `status` tinyint unsigned NOT NULL DEFAULT '1',
                              `insert_time` datetime NOT NULL,
                              `update_time` datetime NOT NULL,
                              PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for product_attribute_values
-- ----------------------------
DROP TABLE IF EXISTS `product_attribute_values`;
CREATE TABLE `product_attribute_values` (
                                                `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                                `attribute_id` bigint unsigned NOT NULL,
                                                `attribute_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
                                                `status` tinyint unsigned NOT NULL DEFAULT '1',
                                                `sort` bigint unsigned NOT NULL DEFAULT '1',
                                                `insert_time` datetime NOT NULL COMMENT '创建时间',
                                                `update_time` datetime NOT NULL COMMENT '更新时间',
                                                PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for product_attributes
-- ----------------------------
DROP TABLE IF EXISTS `product_attributes`;
CREATE TABLE `product_attributes` (
                                          `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                          `product_id` bigint unsigned NOT NULL,
                                          `name` varchar(255) NOT NULL DEFAULT '',
                                          `status` tinyint unsigned NOT NULL DEFAULT '1',
                                          `sort` bigint unsigned NOT NULL DEFAULT '1',
                                          `insert_time` datetime NOT NULL COMMENT '创建时间',
                                          `update_time` datetime NOT NULL COMMENT '更新时间',
                                          PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for product_skus
-- ----------------------------
DROP TABLE IF EXISTS `product_skus`;
CREATE TABLE `product_skus` (
                                `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                `product_id` bigint unsigned NOT NULL,
                                `attribute` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
                                `stock` bigint unsigned NOT NULL DEFAULT '1',
                                `status` tinyint unsigned NOT NULL DEFAULT '1',
                                `insert_time` datetime NOT NULL COMMENT '创建时间',
                                `update_time` datetime NOT NULL COMMENT '更新时间',
                                PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for product_snapshots
-- ----------------------------
DROP TABLE IF EXISTS `product_snapshots`;
CREATE TABLE `product_snapshots` (
                                     `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                     `product_id` bigint unsigned NOT NULL,
                                     `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
                                     `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                     `price` decimal(10,2) NOT NULL DEFAULT '0.01',
                                     `shipping_fee` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
                                     `category_id` bigint unsigned NOT NULL DEFAULT '1',
                                     `subcategory_id` bigint unsigned NOT NULL DEFAULT '1',
                                     `status` tinyint unsigned NOT NULL DEFAULT '1',
                                     `sort` bigint NOT NULL DEFAULT '1',
                                     `version` bigint unsigned NOT NULL DEFAULT '1',
                                     `sold` bigint unsigned NOT NULL DEFAULT '0',
                                     `insert_time` datetime NOT NULL,
                                     `update_time` datetime NOT NULL,
                                     PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
                            `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                            `name` varchar(255) NOT NULL DEFAULT '',
                            `desc` text NOT NULL,
                            `price` decimal(10,2) NOT NULL DEFAULT '0.01',
                            `shipping_fee` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
                            `category_id` bigint unsigned NOT NULL DEFAULT '1',
                            `subcategory_id` bigint unsigned NOT NULL DEFAULT '1',
                            `status` tinyint unsigned NOT NULL DEFAULT '1',
                            `sort` bigint NOT NULL DEFAULT '1',
                            `sort_id` bigint NOT NULL DEFAULT '1',
                            `version` bigint unsigned NOT NULL DEFAULT '1',
                            `sold` bigint unsigned NOT NULL DEFAULT '0',
                            `insert_time` datetime NOT NULL,
                            `update_time` datetime NOT NULL,
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for subcategories
-- ----------------------------
DROP TABLE IF EXISTS `subcategories`;
CREATE TABLE `subcategories` (
                                 `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                 `category_id` bigint unsigned NOT NULL DEFAULT '1',
                                 `name` varchar(255) NOT NULL DEFAULT '',
                                 `icon` varchar(255) NOT NULL DEFAULT '',
                                 `sort` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '排序',
                                 `status` tinyint unsigned NOT NULL DEFAULT '1',
                                 `insert_time` datetime NOT NULL,
                                 `update_time` datetime NOT NULL,
                                 PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
                         `id` int unsigned NOT NULL AUTO_INCREMENT,
                         `area_code` int unsigned NOT NULL DEFAULT '86',
                         `mobile` bigint unsigned DEFAULT NULL,
                         `email` varchar(255) DEFAULT NULL,
                         `status` tinyint unsigned NOT NULL DEFAULT '1',
                         `insert_time` datetime NOT NULL,
                         `update_time` datetime NOT NULL,
                         PRIMARY KEY (`id`),
                         UNIQUE KEY `unique_mobile` (`area_code`,`mobile`),
                         UNIQUE KEY `unique_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




----------- data --------------------------------

-- banner
INSERT INTO `mall`.`banners` (`id`, `image`, `url`, `status`, `sort`, `type`, `insert_time`, `update_time`) VALUES (1, '1.png', 'banner1', 1, 1, 1, '2024-02-26 16:10:11', '2024-02-26 16:10:11');

-- categories
INSERT INTO `mall`.`categories` (`id`, `name`, `icon`, `status`, `insert_time`, `update_time`) VALUES (1, '推荐', '', 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`categories` (`id`, `name`, `icon`, `status`, `insert_time`, `update_time`) VALUES (2, '食品', '', 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`categories` (`id`, `name`, `icon`, `status`, `insert_time`, `update_time`) VALUES (3, '百货', '', 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`categories` (`id`, `name`, `icon`, `status`, `insert_time`, `update_time`) VALUES (4, '电脑', '', 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`categories` (`id`, `name`, `icon`, `status`, `insert_time`, `update_time`) VALUES (5, '水果', '', 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`categories` (`id`, `name`, `icon`, `status`, `insert_time`, `update_time`) VALUES (6, '医药', '', 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`categories` (`id`, `name`, `icon`, `status`, `insert_time`, `update_time`) VALUES (7, '手机', '', 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`categories` (`id`, `name`, `icon`, `status`, `insert_time`, `update_time`) VALUES (8, '电器', '', 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`categories` (`id`, `name`, `icon`, `status`, `insert_time`, `update_time`) VALUES (9, '家装', '', 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`categories` (`id`, `name`, `icon`, `status`, `insert_time`, `update_time`) VALUES (10, '家具', '', 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`categories` (`id`, `name`, `icon`, `status`, `insert_time`, `update_time`) VALUES (11, '男装', '', 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`categories` (`id`, `name`, `icon`, `status`, `insert_time`, `update_time`) VALUES (12, '车品', '', 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');

-- subcategories
INSERT INTO `mall`.`subcategories` (`id`, `category_id`, `name`, `icon`, `sort`, `status`, `insert_time`, `update_time`) VALUES (1, 1, '推荐', '', 1, 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`subcategories` (`id`, `category_id`, `name`, `icon`, `sort`, `status`, `insert_time`, `update_time`) VALUES (2, 1, '食品', '', 1, 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`subcategories` (`id`, `category_id`, `name`, `icon`, `sort`, `status`, `insert_time`, `update_time`) VALUES (3, 1, '百货', '', 1, 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`subcategories` (`id`, `category_id`, `name`, `icon`, `sort`, `status`, `insert_time`, `update_time`) VALUES (4, 1, '电脑', '', 1, 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`subcategories` (`id`, `category_id`, `name`, `icon`, `sort`, `status`, `insert_time`, `update_time`) VALUES (5, 1, '水果', '', 1, 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`subcategories` (`id`, `category_id`, `name`, `icon`, `sort`, `status`, `insert_time`, `update_time`) VALUES (6, 1, '医药', '', 1, 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`subcategories` (`id`, `category_id`, `name`, `icon`, `sort`, `status`, `insert_time`, `update_time`) VALUES (7, 1, '手机', '', 1, 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`subcategories` (`id`, `category_id`, `name`, `icon`, `sort`, `status`, `insert_time`, `update_time`) VALUES (8, 1, '电器', '', 1, 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`subcategories` (`id`, `category_id`, `name`, `icon`, `sort`, `status`, `insert_time`, `update_time`) VALUES (9, 1, '家装', '', 1, 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`subcategories` (`id`, `category_id`, `name`, `icon`, `sort`, `status`, `insert_time`, `update_time`) VALUES (10, 1, '家具', '', 1, 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`subcategories` (`id`, `category_id`, `name`, `icon`, `sort`, `status`, `insert_time`, `update_time`) VALUES (11, 1, '男装', '', 1, 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`subcategories` (`id`, `category_id`, `name`, `icon`, `sort`, `status`, `insert_time`, `update_time`) VALUES (12, 1, '车品', '', 1, 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`subcategories` (`id`, `category_id`, `name`, `icon`, `sort`, `status`, `insert_time`, `update_time`) VALUES (13, 7, '苹果', '', 1, 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`subcategories` (`id`, `category_id`, `name`, `icon`, `sort`, `status`, `insert_time`, `update_time`) VALUES (14, 7, '华为', '', 1, 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`subcategories` (`id`, `category_id`, `name`, `icon`, `sort`, `status`, `insert_time`, `update_time`) VALUES (15, 7, '小米', '', 1, 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`subcategories` (`id`, `category_id`, `name`, `icon`, `sort`, `status`, `insert_time`, `update_time`) VALUES (16, 7, 'OPPO', '', 1, 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`subcategories` (`id`, `category_id`, `name`, `icon`, `sort`, `status`, `insert_time`, `update_time`) VALUES (17, 7, 'vivo', '', 1, 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`subcategories` (`id`, `category_id`, `name`, `icon`, `sort`, `status`, `insert_time`, `update_time`) VALUES (18, 7, '荣耀', '', 1, 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`subcategories` (`id`, `category_id`, `name`, `icon`, `sort`, `status`, `insert_time`, `update_time`) VALUES (19, 7, '一加', '', 1, 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`subcategories` (`id`, `category_id`, `name`, `icon`, `sort`, `status`, `insert_time`, `update_time`) VALUES (20, 7, '三星', '', 1, 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`subcategories` (`id`, `category_id`, `name`, `icon`, `sort`, `status`, `insert_time`, `update_time`) VALUES (21, 7, '魅族', '', 1, 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');

-- products
INSERT INTO `mall`.`products` (`id`, `name`, `image`, `desc`, `price`, `shipping_fee`, `category_id`, `subcategory_id`, `status`, `sort`,`sort_id`, `version`, `sold`, `insert_time`, `update_time`) VALUES (1, 'iphone5', 'iphone5', 'iphone5', 2999.99, 0.00, 7, 13, 1, 1, 1, 0, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`products` (`id`, `name`, `image`, `desc`, `price`, `shipping_fee`, `category_id`, `subcategory_id`, `status`, `sort`,`sort_id`, `version`, `sold`, `insert_time`, `update_time`) VALUES (2, 'iphone6', 'iphone6','iphone6', 2999.99, 0.00, 7, 13, 1, 1, 1, 0, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`products` (`id`, `name`, `image`, `desc`, `price`, `shipping_fee`, `category_id`, `subcategory_id`, `status`, `sort`,`sort_id`, `version`, `sold`, `insert_time`, `update_time`) VALUES (3, 'iphone7', 'iphone7', 'iphone7', 2999.99, 0.00, 7, 13, 1, 1, 1, 0, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`products` (`id`, `name`, `image`, `desc`, `price`, `shipping_fee`, `category_id`, `subcategory_id`, `status`, `sort`,`sort_id`, `version`, `sold`, `insert_time`, `update_time`) VALUES (4, 'iphone8', 'iphone8', 'iphone8', 2999.99, 0.00, 7, 13, 1, 1, 1, 0, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`products` (`id`, `name`, `image`, `desc`, `price`, `shipping_fee`, `category_id`, `subcategory_id`, `status`, `sort`,`sort_id`, `version`, `sold`, `insert_time`, `update_time`) VALUES (5, 'iphone9', 'iphone9', 'iphone9', 2999.99, 0.00, 7, 13, 1, 1, 1, 0, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`products` (`id`, `name`, `image`, `desc`, `price`, `shipping_fee`, `category_id`, `subcategory_id`, `status`, `sort`,`sort_id`, `version`, `sold`, `insert_time`, `update_time`) VALUES (6, 'iphoneX', 'iphoneX', 'iphoneX', 2999.99, 0.00, 7, 13, 1, 1, 1, 0, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`products` (`id`, `name`, `image`, `desc`, `price`, `shipping_fee`, `category_id`, `subcategory_id`, `status`, `sort`,`sort_id`, `version`, `sold`, `insert_time`, `update_time`) VALUES (7, 'iphone12', 'iphone12', 'iphone12', 2999.99, 0.00, 7, 13, 1, 1, 1, 0, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`products` (`id`, `name`, `image`, `desc`, `price`, `shipping_fee`, `category_id`, `subcategory_id`, `status`, `sort`,`sort_id`, `version`, `sold`, `insert_time`, `update_time`) VALUES (8, 'iphone13', 'iphone13', 'iphone13', 2999.99, 0.00, 7, 13, 1, 1, 1, 0, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`products` (`id`, `name`, `image`, `desc`, `price`, `shipping_fee`, `category_id`, `subcategory_id`, `status`, `sort`,`sort_id`, `version`, `sold`, `insert_time`, `update_time`) VALUES (9, 'iphone14', 'iphone14', 'iphone14', 2999.99, 0.00, 7, 13, 1, 1, 1, 0, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`products` (`id`, `name`, `image`, `desc`, `price`, `shipping_fee`, `category_id`, `subcategory_id`, `status`, `sort`,`sort_id`, `version`, `sold`, `insert_time`, `update_time`) VALUES (10, 'iphone15', 'iphone15', 'iphone15', 2999.99, 0.00, 7, 13, 1, 1, 1, 0, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`products` (`id`, `name`, `image`, `desc`, `price`, `shipping_fee`, `category_id`, `subcategory_id`, `status`, `sort`,`sort_id`, `version`, `sold`, `insert_time`, `update_time`) VALUES (11, 'iphone16', 'iphone16', 'iphone16', 2999.99, 0.00, 7, 13, 1, 1, 1, 0, '2024-02-26 17:12:23', '2024-02-26 17:12:23');

-- product_attributes
INSERT INTO `mall`.`product_attributes` (`id`, `product_id`, `name`, `status`, `sort`, `insert_time`, `update_time`) VALUES (1, 1, '颜色', 1, 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`product_attributes` (`id`, `product_id`, `name`, `status`, `sort`, `insert_time`, `update_time`) VALUES (2, 1, '存储容量', 1, 2, '2024-02-26 17:12:23', '2024-02-26 17:12:23');

-- product_attribute_values
INSERT INTO `mall`.`product_attribute_values` (`id`, `attribute_id`, `attribute_name`, `status`, `sort`, `insert_time`, `update_time`) VALUES (1, 1, '黑色', 1, 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`product_attribute_values` (`id`, `attribute_id`, `attribute_name`, `status`, `sort`, `insert_time`, `update_time`) VALUES (2, 1, '白色', 1, 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`product_attribute_values` (`id`, `attribute_id`, `attribute_name`, `status`, `sort`, `insert_time`, `update_time`) VALUES (3, 1, '蓝色', 1, 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`product_attribute_values` (`id`, `attribute_id`, `attribute_name`, `status`, `sort`, `insert_time`, `update_time`) VALUES (4, 1, '粉色', 1, 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`product_attribute_values` (`id`, `attribute_id`, `attribute_name`, `status`, `sort`, `insert_time`, `update_time`) VALUES (5, 2, '128GB', 1, 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`product_attribute_values` (`id`, `attribute_id`, `attribute_name`, `status`, `sort`, `insert_time`, `update_time`) VALUES (6, 2, '256GB', 1, 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`product_attribute_values` (`id`, `attribute_id`, `attribute_name`, `status`, `sort`, `insert_time`, `update_time`) VALUES (7, 2, '512GB', 1, 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');

-- product_skus
INSERT INTO `mall`.`product_skus` (`id`, `product_id`, `attribute`, `price`, `stock`, `status`, `insert_time`, `update_time`) VALUES (1, 1, '1:1_2:5', 2999.99, 1, 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`product_skus` (`id`, `product_id`, `attribute`, `price`, `stock`, `status`, `insert_time`, `update_time`) VALUES (2, 1, '1:1_2:6', 3199.99, 2, 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`product_skus` (`id`, `product_id`, `attribute`, `price`, `stock`, `status`, `insert_time`, `update_time`) VALUES (3, 1, '1:1_2:7', 3899.99, 3, 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`product_skus` (`id`, `product_id`, `attribute`, `price`, `stock`, `status`, `insert_time`, `update_time`) VALUES (4, 1, '1:2_2:5', 3399.99, 4, 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`product_skus` (`id`, `product_id`, `attribute`, `price`, `stock`, `status`, `insert_time`, `update_time`) VALUES (5, 1, '1:2_2:6', 3499.99, 5, 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`product_skus` (`id`, `product_id`, `attribute`, `price`, `stock`, `status`, `insert_time`, `update_time`) VALUES (6, 1, '1:2_2:7', 3799.99, 6, 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`product_skus` (`id`, `product_id`, `attribute`, `price`, `stock`, `status`, `insert_time`, `update_time`) VALUES (7, 1, '1:3_2:1', 3999.99, 7, 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');
INSERT INTO `mall`.`product_skus` (`id`, `product_id`, `attribute`, `price`, `stock`, `status`, `insert_time`, `update_time`) VALUES (8, 1, '1:4_2:1', 3599.99, 8, 1, '2024-02-26 17:12:23', '2024-02-26 17:12:23');

