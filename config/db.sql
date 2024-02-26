
----------------------------table------------------------------------
CREATE TABLE `banners` (
                           `id` int NOT NULL,
                           `image` varchar(255) NOT NULL COMMENT '图片地址',
                           `url` varchar(255) NOT NULL COMMENT '跳转地址',
                           `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态1生效2无效',
                           `sort` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '排序',
                           `type` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '预留字段',
                           `insert_time` datetime NOT NULL COMMENT '创建时间',
                           `update_time` datetime NOT NULL COMMENT '更新时间',
                           PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `categories` (
                              `id` int unsigned NOT NULL AUTO_INCREMENT,
                              `name` varchar(255) NOT NULL DEFAULT '',
                              `icon` varchar(255) NOT NULL DEFAULT '',
                              `sort` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '排序',
                              `status` tinyint unsigned NOT NULL DEFAULT '1',
                              `insert_time` datetime NOT NULL,
                              `update_time` datetime NOT NULL,
                              PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `subcategories` (
                              `id` int unsigned NOT NULL AUTO_INCREMENT,
                              `category_id` int unsigned NOT NULL DEFAULT '1',
                              `name` varchar(255) NOT NULL DEFAULT '',
                              `icon` varchar(255) NOT NULL DEFAULT '',
                              `sort` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '排序',
                              `status` tinyint unsigned NOT NULL DEFAULT '1',
                              `insert_time` datetime NOT NULL,
                              `update_time` datetime NOT NULL,
                              PRIMARY KEY (`id`)
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
