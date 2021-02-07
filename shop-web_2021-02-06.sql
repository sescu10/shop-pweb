# ************************************************************
# Sequel Ace SQL dump
# Version 2060
#
# https://sequel-ace.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.29-0ubuntu0.18.04.1)
# Database: shop-web
# Generation Time: 2021-02-06 17:04:10 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2019_08_19_000000_create_failed_jobs_table',1),
	(4,'2020_12_08_141818_create_product_table',1),
	(5,'2020_12_08_142249_create_orders_table',1),
	(6,'2020_12_08_142440_create_order_products_table',1),
	(7,'2020_12_08_174504_create_reviews_table',1),
	(8,'2020_12_08_180643_create_permission_tables',1),
	(9,'2020_12_09_203700_create_product_images_table',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table model_has_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `model_has_permissions`;

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`)
VALUES
	(1,'App\\Models\\User',1),
	(1,'App\\Models\\User',2),
	(1,'App\\Models\\User',3),
	(1,'App\\Models\\User',4),
	(1,'App\\Models\\User',5);

/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table model_has_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `model_has_roles`;

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`)
VALUES
	(1,'App\\Models\\User',1),
	(1,'App\\Models\\User',2),
	(1,'App\\Models\\User',3),
	(1,'App\\Models\\User',4),
	(1,'App\\Models\\User',5);

/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_products`;

CREATE TABLE `order_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `no_products` tinyint(4) NOT NULL,
  `total_price` double(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_products_order_id_index` (`order_id`),
  KEY `order_products_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `order_products` WRITE;
/*!40000 ALTER TABLE `order_products` DISABLE KEYS */;

INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `no_products`, `total_price`, `created_at`, `updated_at`)
VALUES
	(1,1,3,4,168.00,'2021-01-22 22:02:02','2021-01-22 22:02:02'),
	(2,1,4,1,68.00,'2021-01-22 22:02:02','2021-01-22 22:02:02'),
	(3,2,3,4,168.00,'2021-02-03 15:31:05','2021-02-03 15:31:05'),
	(4,2,2,4,160.00,'2021-02-03 15:31:05','2021-02-03 15:31:05'),
	(5,2,7,2,96.00,'2021-02-03 15:31:05','2021-02-03 15:31:05'),
	(6,2,8,2,50.00,'2021-02-03 15:31:05','2021-02-03 15:31:05');

/*!40000 ALTER TABLE `order_products` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `no_products` tinyint(4) NOT NULL,
  `total_price` double(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;

INSERT INTO `orders` (`id`, `user_id`, `no_products`, `total_price`, `created_at`, `updated_at`)
VALUES
	(1,1,5,236.00,'2021-01-22 22:02:02','2021-01-22 22:02:02'),
	(2,1,12,474.00,'2021-02-03 15:31:05','2021-02-03 15:31:05');

/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`)
VALUES
	(1,'admin','web','2021-01-22 21:41:34','2021-01-22 21:41:34'),
	(2,'customer','web','2021-01-22 21:41:34','2021-01-22 21:41:34');

/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product_images
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_images`;

CREATE TABLE `product_images` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `path` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;

INSERT INTO `product_images` (`id`, `product_id`, `path`, `created_at`, `updated_at`)
VALUES
	(1,1,'/img/1.png','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(2,1,'/img/4.png','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(3,1,'/img/5.png','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(4,2,'/img/4.png','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(5,2,'/img/4.png','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(6,2,'/img/3.png','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(7,3,'/img/5.png','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(8,3,'/img/6.png','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(9,3,'/img/5.png','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(10,4,'/img/2.png','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(11,4,'/img/1.png','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(12,4,'/img/7.png','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(13,5,'/img/2.png','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(14,5,'/img/6.png','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(15,5,'/img/3.png','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(16,6,'/img/5.png','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(17,6,'/img/1.png','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(18,6,'/img/1.png','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(19,7,'/img/3.png','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(20,7,'/img/7.png','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(21,7,'/img/4.png','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(22,8,'/img/2.png','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(23,8,'/img/5.png','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(24,8,'/img/1.png','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(25,9,'/img/4.png','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(26,9,'/img/5.png','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(27,9,'/img/4.png','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(28,10,'/img/7.png','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(29,10,'/img/3.png','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(30,10,'/img/3.png','2021-01-22 21:41:35','2021-01-22 21:41:35');

/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('collectible','shipment','downloadable') COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_name_index` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;

INSERT INTO `products` (`id`, `name`, `description`, `type`, `price`, `created_at`, `updated_at`)
VALUES
	(1,'Item1','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque congue interdum congue. Mauris sed odio turpis. Morbi lectus leo, ornare eu convallis id, laoreet non sapien. Donec molestie volutpat nisi, vulputate iaculis sapien efficitur sit amet. Vivamus sodales velit eget mauris scelerisque pretium. Pellentesque dui risus, eleifend ut dapibus ut, posuere ac ligula. Etiam ac felis et magna imperdiet sollicitudin. Praesent a mi non sapien volutpat laoreet sed vitae magna. Sed quis arcu eget lectus placerat lobortis et eget dui. Donec tempus feugiat enim, at mollis ligula semper et. Duis libero sem, lacinia non urna a, feugiat commodo ex. Sed quis imperdiet urna. Nulla ut quam urna.\n\nFusce a euismod tellus. Nullam massa dolor, ultricies quis facilisis id, aliquam in libero. Nam tempor imperdiet sapien, quis tempor augue bibendum id. Phasellus efficitur augue a maximus vulputate. Curabitur sed velit bibendum, convallis eros ut, congue nisl. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla quis urna quis eros placerat dictum. Aliquam iaculis, massa ac mollis lacinia, metus justo rhoncus diam, in fermentum lectus libero vel sapien. Donec vel feugiat enim, ac euismod lacus. Sed vitae consectetur felis. Nunc ullamcorper posuere ligula, sit amet sagittis nibh eleifend non. Quisque vel ligula tincidunt, ornare purus non, viverra risus. Ut pretium eleifend magna a fringilla. Maecenas vitae pellentesque erat, quis pellentesque mi. Proin non nisl lectus. Vivamus augue nisi, faucibus id ante in, tempus dictum tellus.','collectible',20.00,'2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(2,'Item2','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque congue interdum congue. Mauris sed odio turpis. Morbi lectus leo, ornare eu convallis id, laoreet non sapien. Donec molestie volutpat nisi, vulputate iaculis sapien efficitur sit amet. Vivamus sodales velit eget mauris scelerisque pretium. Pellentesque dui risus, eleifend ut dapibus ut, posuere ac ligula. Etiam ac felis et magna imperdiet sollicitudin. Praesent a mi non sapien volutpat laoreet sed vitae magna. Sed quis arcu eget lectus placerat lobortis et eget dui. Donec tempus feugiat enim, at mollis ligula semper et. Duis libero sem, lacinia non urna a, feugiat commodo ex. Sed quis imperdiet urna. Nulla ut quam urna.\n\nFusce a euismod tellus. Nullam massa dolor, ultricies quis facilisis id, aliquam in libero. Nam tempor imperdiet sapien, quis tempor augue bibendum id. Phasellus efficitur augue a maximus vulputate. Curabitur sed velit bibendum, convallis eros ut, congue nisl. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla quis urna quis eros placerat dictum. Aliquam iaculis, massa ac mollis lacinia, metus justo rhoncus diam, in fermentum lectus libero vel sapien. Donec vel feugiat enim, ac euismod lacus. Sed vitae consectetur felis. Nunc ullamcorper posuere ligula, sit amet sagittis nibh eleifend non. Quisque vel ligula tincidunt, ornare purus non, viverra risus. Ut pretium eleifend magna a fringilla. Maecenas vitae pellentesque erat, quis pellentesque mi. Proin non nisl lectus. Vivamus augue nisi, faucibus id ante in, tempus dictum tellus.','collectible',40.00,'2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(3,'Item3','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque congue interdum congue. Mauris sed odio turpis. Morbi lectus leo, ornare eu convallis id, laoreet non sapien. Donec molestie volutpat nisi, vulputate iaculis sapien efficitur sit amet. Vivamus sodales velit eget mauris scelerisque pretium. Pellentesque dui risus, eleifend ut dapibus ut, posuere ac ligula. Etiam ac felis et magna imperdiet sollicitudin. Praesent a mi non sapien volutpat laoreet sed vitae magna. Sed quis arcu eget lectus placerat lobortis et eget dui. Donec tempus feugiat enim, at mollis ligula semper et. Duis libero sem, lacinia non urna a, feugiat commodo ex. Sed quis imperdiet urna. Nulla ut quam urna.\n\nFusce a euismod tellus. Nullam massa dolor, ultricies quis facilisis id, aliquam in libero. Nam tempor imperdiet sapien, quis tempor augue bibendum id. Phasellus efficitur augue a maximus vulputate. Curabitur sed velit bibendum, convallis eros ut, congue nisl. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla quis urna quis eros placerat dictum. Aliquam iaculis, massa ac mollis lacinia, metus justo rhoncus diam, in fermentum lectus libero vel sapien. Donec vel feugiat enim, ac euismod lacus. Sed vitae consectetur felis. Nunc ullamcorper posuere ligula, sit amet sagittis nibh eleifend non. Quisque vel ligula tincidunt, ornare purus non, viverra risus. Ut pretium eleifend magna a fringilla. Maecenas vitae pellentesque erat, quis pellentesque mi. Proin non nisl lectus. Vivamus augue nisi, faucibus id ante in, tempus dictum tellus.','collectible',42.00,'2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(4,'Item4','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque congue interdum congue. Mauris sed odio turpis. Morbi lectus leo, ornare eu convallis id, laoreet non sapien. Donec molestie volutpat nisi, vulputate iaculis sapien efficitur sit amet. Vivamus sodales velit eget mauris scelerisque pretium. Pellentesque dui risus, eleifend ut dapibus ut, posuere ac ligula. Etiam ac felis et magna imperdiet sollicitudin. Praesent a mi non sapien volutpat laoreet sed vitae magna. Sed quis arcu eget lectus placerat lobortis et eget dui. Donec tempus feugiat enim, at mollis ligula semper et. Duis libero sem, lacinia non urna a, feugiat commodo ex. Sed quis imperdiet urna. Nulla ut quam urna.\n\nFusce a euismod tellus. Nullam massa dolor, ultricies quis facilisis id, aliquam in libero. Nam tempor imperdiet sapien, quis tempor augue bibendum id. Phasellus efficitur augue a maximus vulputate. Curabitur sed velit bibendum, convallis eros ut, congue nisl. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla quis urna quis eros placerat dictum. Aliquam iaculis, massa ac mollis lacinia, metus justo rhoncus diam, in fermentum lectus libero vel sapien. Donec vel feugiat enim, ac euismod lacus. Sed vitae consectetur felis. Nunc ullamcorper posuere ligula, sit amet sagittis nibh eleifend non. Quisque vel ligula tincidunt, ornare purus non, viverra risus. Ut pretium eleifend magna a fringilla. Maecenas vitae pellentesque erat, quis pellentesque mi. Proin non nisl lectus. Vivamus augue nisi, faucibus id ante in, tempus dictum tellus.','downloadable',68.00,'2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(5,'Item5','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque congue interdum congue. Mauris sed odio turpis. Morbi lectus leo, ornare eu convallis id, laoreet non sapien. Donec molestie volutpat nisi, vulputate iaculis sapien efficitur sit amet. Vivamus sodales velit eget mauris scelerisque pretium. Pellentesque dui risus, eleifend ut dapibus ut, posuere ac ligula. Etiam ac felis et magna imperdiet sollicitudin. Praesent a mi non sapien volutpat laoreet sed vitae magna. Sed quis arcu eget lectus placerat lobortis et eget dui. Donec tempus feugiat enim, at mollis ligula semper et. Duis libero sem, lacinia non urna a, feugiat commodo ex. Sed quis imperdiet urna. Nulla ut quam urna.\n\nFusce a euismod tellus. Nullam massa dolor, ultricies quis facilisis id, aliquam in libero. Nam tempor imperdiet sapien, quis tempor augue bibendum id. Phasellus efficitur augue a maximus vulputate. Curabitur sed velit bibendum, convallis eros ut, congue nisl. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla quis urna quis eros placerat dictum. Aliquam iaculis, massa ac mollis lacinia, metus justo rhoncus diam, in fermentum lectus libero vel sapien. Donec vel feugiat enim, ac euismod lacus. Sed vitae consectetur felis. Nunc ullamcorper posuere ligula, sit amet sagittis nibh eleifend non. Quisque vel ligula tincidunt, ornare purus non, viverra risus. Ut pretium eleifend magna a fringilla. Maecenas vitae pellentesque erat, quis pellentesque mi. Proin non nisl lectus. Vivamus augue nisi, faucibus id ante in, tempus dictum tellus.','collectible',45.00,'2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(6,'Item6','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque congue interdum congue. Mauris sed odio turpis. Morbi lectus leo, ornare eu convallis id, laoreet non sapien. Donec molestie volutpat nisi, vulputate iaculis sapien efficitur sit amet. Vivamus sodales velit eget mauris scelerisque pretium. Pellentesque dui risus, eleifend ut dapibus ut, posuere ac ligula. Etiam ac felis et magna imperdiet sollicitudin. Praesent a mi non sapien volutpat laoreet sed vitae magna. Sed quis arcu eget lectus placerat lobortis et eget dui. Donec tempus feugiat enim, at mollis ligula semper et. Duis libero sem, lacinia non urna a, feugiat commodo ex. Sed quis imperdiet urna. Nulla ut quam urna.\n\nFusce a euismod tellus. Nullam massa dolor, ultricies quis facilisis id, aliquam in libero. Nam tempor imperdiet sapien, quis tempor augue bibendum id. Phasellus efficitur augue a maximus vulputate. Curabitur sed velit bibendum, convallis eros ut, congue nisl. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla quis urna quis eros placerat dictum. Aliquam iaculis, massa ac mollis lacinia, metus justo rhoncus diam, in fermentum lectus libero vel sapien. Donec vel feugiat enim, ac euismod lacus. Sed vitae consectetur felis. Nunc ullamcorper posuere ligula, sit amet sagittis nibh eleifend non. Quisque vel ligula tincidunt, ornare purus non, viverra risus. Ut pretium eleifend magna a fringilla. Maecenas vitae pellentesque erat, quis pellentesque mi. Proin non nisl lectus. Vivamus augue nisi, faucibus id ante in, tempus dictum tellus.','collectible',12.00,'2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(7,'Item7','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque congue interdum congue. Mauris sed odio turpis. Morbi lectus leo, ornare eu convallis id, laoreet non sapien. Donec molestie volutpat nisi, vulputate iaculis sapien efficitur sit amet. Vivamus sodales velit eget mauris scelerisque pretium. Pellentesque dui risus, eleifend ut dapibus ut, posuere ac ligula. Etiam ac felis et magna imperdiet sollicitudin. Praesent a mi non sapien volutpat laoreet sed vitae magna. Sed quis arcu eget lectus placerat lobortis et eget dui. Donec tempus feugiat enim, at mollis ligula semper et. Duis libero sem, lacinia non urna a, feugiat commodo ex. Sed quis imperdiet urna. Nulla ut quam urna.\n\nFusce a euismod tellus. Nullam massa dolor, ultricies quis facilisis id, aliquam in libero. Nam tempor imperdiet sapien, quis tempor augue bibendum id. Phasellus efficitur augue a maximus vulputate. Curabitur sed velit bibendum, convallis eros ut, congue nisl. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla quis urna quis eros placerat dictum. Aliquam iaculis, massa ac mollis lacinia, metus justo rhoncus diam, in fermentum lectus libero vel sapien. Donec vel feugiat enim, ac euismod lacus. Sed vitae consectetur felis. Nunc ullamcorper posuere ligula, sit amet sagittis nibh eleifend non. Quisque vel ligula tincidunt, ornare purus non, viverra risus. Ut pretium eleifend magna a fringilla. Maecenas vitae pellentesque erat, quis pellentesque mi. Proin non nisl lectus. Vivamus augue nisi, faucibus id ante in, tempus dictum tellus.','shipment',48.00,'2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(8,'Item8','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque congue interdum congue. Mauris sed odio turpis. Morbi lectus leo, ornare eu convallis id, laoreet non sapien. Donec molestie volutpat nisi, vulputate iaculis sapien efficitur sit amet. Vivamus sodales velit eget mauris scelerisque pretium. Pellentesque dui risus, eleifend ut dapibus ut, posuere ac ligula. Etiam ac felis et magna imperdiet sollicitudin. Praesent a mi non sapien volutpat laoreet sed vitae magna. Sed quis arcu eget lectus placerat lobortis et eget dui. Donec tempus feugiat enim, at mollis ligula semper et. Duis libero sem, lacinia non urna a, feugiat commodo ex. Sed quis imperdiet urna. Nulla ut quam urna.\n\nFusce a euismod tellus. Nullam massa dolor, ultricies quis facilisis id, aliquam in libero. Nam tempor imperdiet sapien, quis tempor augue bibendum id. Phasellus efficitur augue a maximus vulputate. Curabitur sed velit bibendum, convallis eros ut, congue nisl. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla quis urna quis eros placerat dictum. Aliquam iaculis, massa ac mollis lacinia, metus justo rhoncus diam, in fermentum lectus libero vel sapien. Donec vel feugiat enim, ac euismod lacus. Sed vitae consectetur felis. Nunc ullamcorper posuere ligula, sit amet sagittis nibh eleifend non. Quisque vel ligula tincidunt, ornare purus non, viverra risus. Ut pretium eleifend magna a fringilla. Maecenas vitae pellentesque erat, quis pellentesque mi. Proin non nisl lectus. Vivamus augue nisi, faucibus id ante in, tempus dictum tellus.','shipment',25.00,'2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(9,'Item9','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque congue interdum congue. Mauris sed odio turpis. Morbi lectus leo, ornare eu convallis id, laoreet non sapien. Donec molestie volutpat nisi, vulputate iaculis sapien efficitur sit amet. Vivamus sodales velit eget mauris scelerisque pretium. Pellentesque dui risus, eleifend ut dapibus ut, posuere ac ligula. Etiam ac felis et magna imperdiet sollicitudin. Praesent a mi non sapien volutpat laoreet sed vitae magna. Sed quis arcu eget lectus placerat lobortis et eget dui. Donec tempus feugiat enim, at mollis ligula semper et. Duis libero sem, lacinia non urna a, feugiat commodo ex. Sed quis imperdiet urna. Nulla ut quam urna.\n\nFusce a euismod tellus. Nullam massa dolor, ultricies quis facilisis id, aliquam in libero. Nam tempor imperdiet sapien, quis tempor augue bibendum id. Phasellus efficitur augue a maximus vulputate. Curabitur sed velit bibendum, convallis eros ut, congue nisl. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla quis urna quis eros placerat dictum. Aliquam iaculis, massa ac mollis lacinia, metus justo rhoncus diam, in fermentum lectus libero vel sapien. Donec vel feugiat enim, ac euismod lacus. Sed vitae consectetur felis. Nunc ullamcorper posuere ligula, sit amet sagittis nibh eleifend non. Quisque vel ligula tincidunt, ornare purus non, viverra risus. Ut pretium eleifend magna a fringilla. Maecenas vitae pellentesque erat, quis pellentesque mi. Proin non nisl lectus. Vivamus augue nisi, faucibus id ante in, tempus dictum tellus.','downloadable',10.00,'2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(10,'Item10','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque congue interdum congue. Mauris sed odio turpis. Morbi lectus leo, ornare eu convallis id, laoreet non sapien. Donec molestie volutpat nisi, vulputate iaculis sapien efficitur sit amet. Vivamus sodales velit eget mauris scelerisque pretium. Pellentesque dui risus, eleifend ut dapibus ut, posuere ac ligula. Etiam ac felis et magna imperdiet sollicitudin. Praesent a mi non sapien volutpat laoreet sed vitae magna. Sed quis arcu eget lectus placerat lobortis et eget dui. Donec tempus feugiat enim, at mollis ligula semper et. Duis libero sem, lacinia non urna a, feugiat commodo ex. Sed quis imperdiet urna. Nulla ut quam urna.\n\nFusce a euismod tellus. Nullam massa dolor, ultricies quis facilisis id, aliquam in libero. Nam tempor imperdiet sapien, quis tempor augue bibendum id. Phasellus efficitur augue a maximus vulputate. Curabitur sed velit bibendum, convallis eros ut, congue nisl. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla quis urna quis eros placerat dictum. Aliquam iaculis, massa ac mollis lacinia, metus justo rhoncus diam, in fermentum lectus libero vel sapien. Donec vel feugiat enim, ac euismod lacus. Sed vitae consectetur felis. Nunc ullamcorper posuere ligula, sit amet sagittis nibh eleifend non. Quisque vel ligula tincidunt, ornare purus non, viverra risus. Ut pretium eleifend magna a fringilla. Maecenas vitae pellentesque erat, quis pellentesque mi. Proin non nisl lectus. Vivamus augue nisi, faucibus id ante in, tempus dictum tellus.','collectible',120.00,'2021-01-22 21:41:35','2021-01-22 21:41:35');

/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table reviews
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reviews`;

CREATE TABLE `reviews` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `note` double(3,2) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;

INSERT INTO `reviews` (`id`, `product_id`, `user_id`, `note`, `comment`, `created_at`, `updated_at`)
VALUES
	(1,1,2,5.00,'Curabitur felis neque, tincidunt ac cursus at, pellentesque sit amet augue. Cras sagittis convallis varius. Nullam sagittis fermentum augue, interdum accumsan lectus molestie a. Nullam quis vehicula mauris. Aliquam et tristique leo, in tempus leo. Ut sodales ut lectus vitae tristique. Nam quis diam dolor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Phasellus condimentum augue non nibh facilisis dignissim. Ut cursus ligula sit amet lacus tempor, ut suscipit tellus vestibulum. Curabitur posuere felis non libero imperdiet, id venenatis diam lobortis. Nullam sit amet libero congue, ultrices quam eu, tristique dui. Praesent laoreet suscipit erat, ac congue velit efficitur sit amet. Aenean eget tincidunt magna.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(2,1,1,5.00,'Proin enim elit, rutrum ut venenatis nec, euismod non odio. Nunc blandit arcu sed ligula laoreet, eu gravida est elementum. Pellentesque id sem sapien. Quisque tristique nunc purus, ac tristique lacus interdum sed. Sed auctor dui sed augue rhoncus tempus. Aenean mi ex, dignissim sit amet pellentesque vitae, aliquam non magna. Cras lorem arcu, gravida quis feugiat vitae, tristique vehicula ex. Aenean tempus blandit erat, vel ultrices velit blandit id. Ut nec sodales nulla. Nam semper ipsum turpis, sed imperdiet leo faucibus eu. Duis id fringilla augue. Donec vel facilisis urna, et vestibulum libero. Aenean tincidunt id magna fringilla dapibus. Donec suscipit vehicula sollicitudin.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(3,1,3,5.00,'Curabitur felis neque, tincidunt ac cursus at, pellentesque sit amet augue. Cras sagittis convallis varius. Nullam sagittis fermentum augue, interdum accumsan lectus molestie a. Nullam quis vehicula mauris. Aliquam et tristique leo, in tempus leo. Ut sodales ut lectus vitae tristique. Nam quis diam dolor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Phasellus condimentum augue non nibh facilisis dignissim. Ut cursus ligula sit amet lacus tempor, ut suscipit tellus vestibulum. Curabitur posuere felis non libero imperdiet, id venenatis diam lobortis. Nullam sit amet libero congue, ultrices quam eu, tristique dui. Praesent laoreet suscipit erat, ac congue velit efficitur sit amet. Aenean eget tincidunt magna.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(4,1,1,5.00,'Curabitur felis neque, tincidunt ac cursus at, pellentesque sit amet augue. Cras sagittis convallis varius. Nullam sagittis fermentum augue, interdum accumsan lectus molestie a. Nullam quis vehicula mauris. Aliquam et tristique leo, in tempus leo. Ut sodales ut lectus vitae tristique. Nam quis diam dolor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Phasellus condimentum augue non nibh facilisis dignissim. Ut cursus ligula sit amet lacus tempor, ut suscipit tellus vestibulum. Curabitur posuere felis non libero imperdiet, id venenatis diam lobortis. Nullam sit amet libero congue, ultrices quam eu, tristique dui. Praesent laoreet suscipit erat, ac congue velit efficitur sit amet. Aenean eget tincidunt magna.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(5,1,4,5.00,'Fusce a euismod tellus. Nullam massa dolor, ultricies quis facilisis id, aliquam in libero. Nam tempor imperdiet sapien, quis tempor augue bibendum id. Phasellus efficitur augue a maximus vulputate. Curabitur sed velit bibendum, convallis eros ut, congue nisl. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla quis urna quis eros placerat dictum. Aliquam iaculis, massa ac mollis lacinia, metus justo rhoncus diam, in fermentum lectus libero vel sapien. Donec vel feugiat enim, ac euismod lacus. Sed vitae consectetur felis. Nunc ullamcorper posuere ligula, sit amet sagittis nibh eleifend non. Quisque vel ligula tincidunt, ornare purus non, viverra risus. Ut pretium eleifend magna a fringilla. Maecenas vitae pellentesque erat, quis pellentesque mi. Proin non nisl lectus. Vivamus augue nisi, faucibus id ante in, tempus dictum tellus.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(6,1,4,5.00,'Fusce sed molestie ligula, id dapibus tellus. Fusce nec lacus arcu. Fusce a consequat turpis. Maecenas dapibus diam non cursus cursus. Sed vel eleifend libero, vel pellentesque turpis. Vivamus eget ullamcorper augue. Nunc in ultricies orci. Sed semper lorem non quam iaculis, et tincidunt leo malesuada. Ut egestas felis id eros maximus, ac varius est molestie. Donec at aliquet eros, eget commodo urna. Donec ultrices risus varius turpis rutrum rutrum id nec tellus. In porttitor sodales hendrerit. Fusce non porta odio. Suspendisse potenti.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(7,2,2,5.00,'Proin enim elit, rutrum ut venenatis nec, euismod non odio. Nunc blandit arcu sed ligula laoreet, eu gravida est elementum. Pellentesque id sem sapien. Quisque tristique nunc purus, ac tristique lacus interdum sed. Sed auctor dui sed augue rhoncus tempus. Aenean mi ex, dignissim sit amet pellentesque vitae, aliquam non magna. Cras lorem arcu, gravida quis feugiat vitae, tristique vehicula ex. Aenean tempus blandit erat, vel ultrices velit blandit id. Ut nec sodales nulla. Nam semper ipsum turpis, sed imperdiet leo faucibus eu. Duis id fringilla augue. Donec vel facilisis urna, et vestibulum libero. Aenean tincidunt id magna fringilla dapibus. Donec suscipit vehicula sollicitudin.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(8,2,5,5.00,'Proin enim elit, rutrum ut venenatis nec, euismod non odio. Nunc blandit arcu sed ligula laoreet, eu gravida est elementum. Pellentesque id sem sapien. Quisque tristique nunc purus, ac tristique lacus interdum sed. Sed auctor dui sed augue rhoncus tempus. Aenean mi ex, dignissim sit amet pellentesque vitae, aliquam non magna. Cras lorem arcu, gravida quis feugiat vitae, tristique vehicula ex. Aenean tempus blandit erat, vel ultrices velit blandit id. Ut nec sodales nulla. Nam semper ipsum turpis, sed imperdiet leo faucibus eu. Duis id fringilla augue. Donec vel facilisis urna, et vestibulum libero. Aenean tincidunt id magna fringilla dapibus. Donec suscipit vehicula sollicitudin.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(9,2,5,5.00,'Proin enim elit, rutrum ut venenatis nec, euismod non odio. Nunc blandit arcu sed ligula laoreet, eu gravida est elementum. Pellentesque id sem sapien. Quisque tristique nunc purus, ac tristique lacus interdum sed. Sed auctor dui sed augue rhoncus tempus. Aenean mi ex, dignissim sit amet pellentesque vitae, aliquam non magna. Cras lorem arcu, gravida quis feugiat vitae, tristique vehicula ex. Aenean tempus blandit erat, vel ultrices velit blandit id. Ut nec sodales nulla. Nam semper ipsum turpis, sed imperdiet leo faucibus eu. Duis id fringilla augue. Donec vel facilisis urna, et vestibulum libero. Aenean tincidunt id magna fringilla dapibus. Donec suscipit vehicula sollicitudin.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(10,2,4,5.00,'Curabitur felis neque, tincidunt ac cursus at, pellentesque sit amet augue. Cras sagittis convallis varius. Nullam sagittis fermentum augue, interdum accumsan lectus molestie a. Nullam quis vehicula mauris. Aliquam et tristique leo, in tempus leo. Ut sodales ut lectus vitae tristique. Nam quis diam dolor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Phasellus condimentum augue non nibh facilisis dignissim. Ut cursus ligula sit amet lacus tempor, ut suscipit tellus vestibulum. Curabitur posuere felis non libero imperdiet, id venenatis diam lobortis. Nullam sit amet libero congue, ultrices quam eu, tristique dui. Praesent laoreet suscipit erat, ac congue velit efficitur sit amet. Aenean eget tincidunt magna.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(11,2,4,5.00,'Curabitur felis neque, tincidunt ac cursus at, pellentesque sit amet augue. Cras sagittis convallis varius. Nullam sagittis fermentum augue, interdum accumsan lectus molestie a. Nullam quis vehicula mauris. Aliquam et tristique leo, in tempus leo. Ut sodales ut lectus vitae tristique. Nam quis diam dolor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Phasellus condimentum augue non nibh facilisis dignissim. Ut cursus ligula sit amet lacus tempor, ut suscipit tellus vestibulum. Curabitur posuere felis non libero imperdiet, id venenatis diam lobortis. Nullam sit amet libero congue, ultrices quam eu, tristique dui. Praesent laoreet suscipit erat, ac congue velit efficitur sit amet. Aenean eget tincidunt magna.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(12,2,2,5.00,'Fusce sed molestie ligula, id dapibus tellus. Fusce nec lacus arcu. Fusce a consequat turpis. Maecenas dapibus diam non cursus cursus. Sed vel eleifend libero, vel pellentesque turpis. Vivamus eget ullamcorper augue. Nunc in ultricies orci. Sed semper lorem non quam iaculis, et tincidunt leo malesuada. Ut egestas felis id eros maximus, ac varius est molestie. Donec at aliquet eros, eget commodo urna. Donec ultrices risus varius turpis rutrum rutrum id nec tellus. In porttitor sodales hendrerit. Fusce non porta odio. Suspendisse potenti.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(13,2,4,5.00,'Proin enim elit, rutrum ut venenatis nec, euismod non odio. Nunc blandit arcu sed ligula laoreet, eu gravida est elementum. Pellentesque id sem sapien. Quisque tristique nunc purus, ac tristique lacus interdum sed. Sed auctor dui sed augue rhoncus tempus. Aenean mi ex, dignissim sit amet pellentesque vitae, aliquam non magna. Cras lorem arcu, gravida quis feugiat vitae, tristique vehicula ex. Aenean tempus blandit erat, vel ultrices velit blandit id. Ut nec sodales nulla. Nam semper ipsum turpis, sed imperdiet leo faucibus eu. Duis id fringilla augue. Donec vel facilisis urna, et vestibulum libero. Aenean tincidunt id magna fringilla dapibus. Donec suscipit vehicula sollicitudin.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(14,3,2,5.00,'Proin enim elit, rutrum ut venenatis nec, euismod non odio. Nunc blandit arcu sed ligula laoreet, eu gravida est elementum. Pellentesque id sem sapien. Quisque tristique nunc purus, ac tristique lacus interdum sed. Sed auctor dui sed augue rhoncus tempus. Aenean mi ex, dignissim sit amet pellentesque vitae, aliquam non magna. Cras lorem arcu, gravida quis feugiat vitae, tristique vehicula ex. Aenean tempus blandit erat, vel ultrices velit blandit id. Ut nec sodales nulla. Nam semper ipsum turpis, sed imperdiet leo faucibus eu. Duis id fringilla augue. Donec vel facilisis urna, et vestibulum libero. Aenean tincidunt id magna fringilla dapibus. Donec suscipit vehicula sollicitudin.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(15,3,2,5.00,'Fusce a euismod tellus. Nullam massa dolor, ultricies quis facilisis id, aliquam in libero. Nam tempor imperdiet sapien, quis tempor augue bibendum id. Phasellus efficitur augue a maximus vulputate. Curabitur sed velit bibendum, convallis eros ut, congue nisl. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla quis urna quis eros placerat dictum. Aliquam iaculis, massa ac mollis lacinia, metus justo rhoncus diam, in fermentum lectus libero vel sapien. Donec vel feugiat enim, ac euismod lacus. Sed vitae consectetur felis. Nunc ullamcorper posuere ligula, sit amet sagittis nibh eleifend non. Quisque vel ligula tincidunt, ornare purus non, viverra risus. Ut pretium eleifend magna a fringilla. Maecenas vitae pellentesque erat, quis pellentesque mi. Proin non nisl lectus. Vivamus augue nisi, faucibus id ante in, tempus dictum tellus.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(16,3,2,5.00,'Fusce a euismod tellus. Nullam massa dolor, ultricies quis facilisis id, aliquam in libero. Nam tempor imperdiet sapien, quis tempor augue bibendum id. Phasellus efficitur augue a maximus vulputate. Curabitur sed velit bibendum, convallis eros ut, congue nisl. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla quis urna quis eros placerat dictum. Aliquam iaculis, massa ac mollis lacinia, metus justo rhoncus diam, in fermentum lectus libero vel sapien. Donec vel feugiat enim, ac euismod lacus. Sed vitae consectetur felis. Nunc ullamcorper posuere ligula, sit amet sagittis nibh eleifend non. Quisque vel ligula tincidunt, ornare purus non, viverra risus. Ut pretium eleifend magna a fringilla. Maecenas vitae pellentesque erat, quis pellentesque mi. Proin non nisl lectus. Vivamus augue nisi, faucibus id ante in, tempus dictum tellus.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(17,3,1,5.00,'Fusce sed molestie ligula, id dapibus tellus. Fusce nec lacus arcu. Fusce a consequat turpis. Maecenas dapibus diam non cursus cursus. Sed vel eleifend libero, vel pellentesque turpis. Vivamus eget ullamcorper augue. Nunc in ultricies orci. Sed semper lorem non quam iaculis, et tincidunt leo malesuada. Ut egestas felis id eros maximus, ac varius est molestie. Donec at aliquet eros, eget commodo urna. Donec ultrices risus varius turpis rutrum rutrum id nec tellus. In porttitor sodales hendrerit. Fusce non porta odio. Suspendisse potenti.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(18,3,5,5.00,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque congue interdum congue. Mauris sed odio turpis. Morbi lectus leo, ornare eu convallis id, laoreet non sapien. Donec molestie volutpat nisi, vulputate iaculis sapien efficitur sit amet. Vivamus sodales velit eget mauris scelerisque pretium. Pellentesque dui risus, eleifend ut dapibus ut, posuere ac ligula. Etiam ac felis et magna imperdiet sollicitudin. Praesent a mi non sapien volutpat laoreet sed vitae magna. Sed quis arcu eget lectus placerat lobortis et eget dui. Donec tempus feugiat enim, at mollis ligula semper et. Duis libero sem, lacinia non urna a, feugiat commodo ex. Sed quis imperdiet urna. Nulla ut quam urna.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(19,3,5,5.00,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque congue interdum congue. Mauris sed odio turpis. Morbi lectus leo, ornare eu convallis id, laoreet non sapien. Donec molestie volutpat nisi, vulputate iaculis sapien efficitur sit amet. Vivamus sodales velit eget mauris scelerisque pretium. Pellentesque dui risus, eleifend ut dapibus ut, posuere ac ligula. Etiam ac felis et magna imperdiet sollicitudin. Praesent a mi non sapien volutpat laoreet sed vitae magna. Sed quis arcu eget lectus placerat lobortis et eget dui. Donec tempus feugiat enim, at mollis ligula semper et. Duis libero sem, lacinia non urna a, feugiat commodo ex. Sed quis imperdiet urna. Nulla ut quam urna.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(20,4,5,5.00,'Proin enim elit, rutrum ut venenatis nec, euismod non odio. Nunc blandit arcu sed ligula laoreet, eu gravida est elementum. Pellentesque id sem sapien. Quisque tristique nunc purus, ac tristique lacus interdum sed. Sed auctor dui sed augue rhoncus tempus. Aenean mi ex, dignissim sit amet pellentesque vitae, aliquam non magna. Cras lorem arcu, gravida quis feugiat vitae, tristique vehicula ex. Aenean tempus blandit erat, vel ultrices velit blandit id. Ut nec sodales nulla. Nam semper ipsum turpis, sed imperdiet leo faucibus eu. Duis id fringilla augue. Donec vel facilisis urna, et vestibulum libero. Aenean tincidunt id magna fringilla dapibus. Donec suscipit vehicula sollicitudin.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(21,4,3,5.00,'Proin enim elit, rutrum ut venenatis nec, euismod non odio. Nunc blandit arcu sed ligula laoreet, eu gravida est elementum. Pellentesque id sem sapien. Quisque tristique nunc purus, ac tristique lacus interdum sed. Sed auctor dui sed augue rhoncus tempus. Aenean mi ex, dignissim sit amet pellentesque vitae, aliquam non magna. Cras lorem arcu, gravida quis feugiat vitae, tristique vehicula ex. Aenean tempus blandit erat, vel ultrices velit blandit id. Ut nec sodales nulla. Nam semper ipsum turpis, sed imperdiet leo faucibus eu. Duis id fringilla augue. Donec vel facilisis urna, et vestibulum libero. Aenean tincidunt id magna fringilla dapibus. Donec suscipit vehicula sollicitudin.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(22,4,3,5.00,'Proin enim elit, rutrum ut venenatis nec, euismod non odio. Nunc blandit arcu sed ligula laoreet, eu gravida est elementum. Pellentesque id sem sapien. Quisque tristique nunc purus, ac tristique lacus interdum sed. Sed auctor dui sed augue rhoncus tempus. Aenean mi ex, dignissim sit amet pellentesque vitae, aliquam non magna. Cras lorem arcu, gravida quis feugiat vitae, tristique vehicula ex. Aenean tempus blandit erat, vel ultrices velit blandit id. Ut nec sodales nulla. Nam semper ipsum turpis, sed imperdiet leo faucibus eu. Duis id fringilla augue. Donec vel facilisis urna, et vestibulum libero. Aenean tincidunt id magna fringilla dapibus. Donec suscipit vehicula sollicitudin.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(23,4,2,5.00,'Curabitur felis neque, tincidunt ac cursus at, pellentesque sit amet augue. Cras sagittis convallis varius. Nullam sagittis fermentum augue, interdum accumsan lectus molestie a. Nullam quis vehicula mauris. Aliquam et tristique leo, in tempus leo. Ut sodales ut lectus vitae tristique. Nam quis diam dolor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Phasellus condimentum augue non nibh facilisis dignissim. Ut cursus ligula sit amet lacus tempor, ut suscipit tellus vestibulum. Curabitur posuere felis non libero imperdiet, id venenatis diam lobortis. Nullam sit amet libero congue, ultrices quam eu, tristique dui. Praesent laoreet suscipit erat, ac congue velit efficitur sit amet. Aenean eget tincidunt magna.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(24,4,3,5.00,'Fusce sed molestie ligula, id dapibus tellus. Fusce nec lacus arcu. Fusce a consequat turpis. Maecenas dapibus diam non cursus cursus. Sed vel eleifend libero, vel pellentesque turpis. Vivamus eget ullamcorper augue. Nunc in ultricies orci. Sed semper lorem non quam iaculis, et tincidunt leo malesuada. Ut egestas felis id eros maximus, ac varius est molestie. Donec at aliquet eros, eget commodo urna. Donec ultrices risus varius turpis rutrum rutrum id nec tellus. In porttitor sodales hendrerit. Fusce non porta odio. Suspendisse potenti.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(25,4,5,5.00,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque congue interdum congue. Mauris sed odio turpis. Morbi lectus leo, ornare eu convallis id, laoreet non sapien. Donec molestie volutpat nisi, vulputate iaculis sapien efficitur sit amet. Vivamus sodales velit eget mauris scelerisque pretium. Pellentesque dui risus, eleifend ut dapibus ut, posuere ac ligula. Etiam ac felis et magna imperdiet sollicitudin. Praesent a mi non sapien volutpat laoreet sed vitae magna. Sed quis arcu eget lectus placerat lobortis et eget dui. Donec tempus feugiat enim, at mollis ligula semper et. Duis libero sem, lacinia non urna a, feugiat commodo ex. Sed quis imperdiet urna. Nulla ut quam urna.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(26,5,3,5.00,'Fusce a euismod tellus. Nullam massa dolor, ultricies quis facilisis id, aliquam in libero. Nam tempor imperdiet sapien, quis tempor augue bibendum id. Phasellus efficitur augue a maximus vulputate. Curabitur sed velit bibendum, convallis eros ut, congue nisl. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla quis urna quis eros placerat dictum. Aliquam iaculis, massa ac mollis lacinia, metus justo rhoncus diam, in fermentum lectus libero vel sapien. Donec vel feugiat enim, ac euismod lacus. Sed vitae consectetur felis. Nunc ullamcorper posuere ligula, sit amet sagittis nibh eleifend non. Quisque vel ligula tincidunt, ornare purus non, viverra risus. Ut pretium eleifend magna a fringilla. Maecenas vitae pellentesque erat, quis pellentesque mi. Proin non nisl lectus. Vivamus augue nisi, faucibus id ante in, tempus dictum tellus.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(27,5,5,5.00,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque congue interdum congue. Mauris sed odio turpis. Morbi lectus leo, ornare eu convallis id, laoreet non sapien. Donec molestie volutpat nisi, vulputate iaculis sapien efficitur sit amet. Vivamus sodales velit eget mauris scelerisque pretium. Pellentesque dui risus, eleifend ut dapibus ut, posuere ac ligula. Etiam ac felis et magna imperdiet sollicitudin. Praesent a mi non sapien volutpat laoreet sed vitae magna. Sed quis arcu eget lectus placerat lobortis et eget dui. Donec tempus feugiat enim, at mollis ligula semper et. Duis libero sem, lacinia non urna a, feugiat commodo ex. Sed quis imperdiet urna. Nulla ut quam urna.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(28,5,2,5.00,'Fusce sed molestie ligula, id dapibus tellus. Fusce nec lacus arcu. Fusce a consequat turpis. Maecenas dapibus diam non cursus cursus. Sed vel eleifend libero, vel pellentesque turpis. Vivamus eget ullamcorper augue. Nunc in ultricies orci. Sed semper lorem non quam iaculis, et tincidunt leo malesuada. Ut egestas felis id eros maximus, ac varius est molestie. Donec at aliquet eros, eget commodo urna. Donec ultrices risus varius turpis rutrum rutrum id nec tellus. In porttitor sodales hendrerit. Fusce non porta odio. Suspendisse potenti.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(29,5,4,5.00,'Fusce a euismod tellus. Nullam massa dolor, ultricies quis facilisis id, aliquam in libero. Nam tempor imperdiet sapien, quis tempor augue bibendum id. Phasellus efficitur augue a maximus vulputate. Curabitur sed velit bibendum, convallis eros ut, congue nisl. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla quis urna quis eros placerat dictum. Aliquam iaculis, massa ac mollis lacinia, metus justo rhoncus diam, in fermentum lectus libero vel sapien. Donec vel feugiat enim, ac euismod lacus. Sed vitae consectetur felis. Nunc ullamcorper posuere ligula, sit amet sagittis nibh eleifend non. Quisque vel ligula tincidunt, ornare purus non, viverra risus. Ut pretium eleifend magna a fringilla. Maecenas vitae pellentesque erat, quis pellentesque mi. Proin non nisl lectus. Vivamus augue nisi, faucibus id ante in, tempus dictum tellus.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(30,5,4,5.00,'Fusce a euismod tellus. Nullam massa dolor, ultricies quis facilisis id, aliquam in libero. Nam tempor imperdiet sapien, quis tempor augue bibendum id. Phasellus efficitur augue a maximus vulputate. Curabitur sed velit bibendum, convallis eros ut, congue nisl. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla quis urna quis eros placerat dictum. Aliquam iaculis, massa ac mollis lacinia, metus justo rhoncus diam, in fermentum lectus libero vel sapien. Donec vel feugiat enim, ac euismod lacus. Sed vitae consectetur felis. Nunc ullamcorper posuere ligula, sit amet sagittis nibh eleifend non. Quisque vel ligula tincidunt, ornare purus non, viverra risus. Ut pretium eleifend magna a fringilla. Maecenas vitae pellentesque erat, quis pellentesque mi. Proin non nisl lectus. Vivamus augue nisi, faucibus id ante in, tempus dictum tellus.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(31,5,1,5.00,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque congue interdum congue. Mauris sed odio turpis. Morbi lectus leo, ornare eu convallis id, laoreet non sapien. Donec molestie volutpat nisi, vulputate iaculis sapien efficitur sit amet. Vivamus sodales velit eget mauris scelerisque pretium. Pellentesque dui risus, eleifend ut dapibus ut, posuere ac ligula. Etiam ac felis et magna imperdiet sollicitudin. Praesent a mi non sapien volutpat laoreet sed vitae magna. Sed quis arcu eget lectus placerat lobortis et eget dui. Donec tempus feugiat enim, at mollis ligula semper et. Duis libero sem, lacinia non urna a, feugiat commodo ex. Sed quis imperdiet urna. Nulla ut quam urna.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(32,6,2,5.00,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque congue interdum congue. Mauris sed odio turpis. Morbi lectus leo, ornare eu convallis id, laoreet non sapien. Donec molestie volutpat nisi, vulputate iaculis sapien efficitur sit amet. Vivamus sodales velit eget mauris scelerisque pretium. Pellentesque dui risus, eleifend ut dapibus ut, posuere ac ligula. Etiam ac felis et magna imperdiet sollicitudin. Praesent a mi non sapien volutpat laoreet sed vitae magna. Sed quis arcu eget lectus placerat lobortis et eget dui. Donec tempus feugiat enim, at mollis ligula semper et. Duis libero sem, lacinia non urna a, feugiat commodo ex. Sed quis imperdiet urna. Nulla ut quam urna.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(33,6,3,5.00,'Proin enim elit, rutrum ut venenatis nec, euismod non odio. Nunc blandit arcu sed ligula laoreet, eu gravida est elementum. Pellentesque id sem sapien. Quisque tristique nunc purus, ac tristique lacus interdum sed. Sed auctor dui sed augue rhoncus tempus. Aenean mi ex, dignissim sit amet pellentesque vitae, aliquam non magna. Cras lorem arcu, gravida quis feugiat vitae, tristique vehicula ex. Aenean tempus blandit erat, vel ultrices velit blandit id. Ut nec sodales nulla. Nam semper ipsum turpis, sed imperdiet leo faucibus eu. Duis id fringilla augue. Donec vel facilisis urna, et vestibulum libero. Aenean tincidunt id magna fringilla dapibus. Donec suscipit vehicula sollicitudin.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(34,6,4,5.00,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque congue interdum congue. Mauris sed odio turpis. Morbi lectus leo, ornare eu convallis id, laoreet non sapien. Donec molestie volutpat nisi, vulputate iaculis sapien efficitur sit amet. Vivamus sodales velit eget mauris scelerisque pretium. Pellentesque dui risus, eleifend ut dapibus ut, posuere ac ligula. Etiam ac felis et magna imperdiet sollicitudin. Praesent a mi non sapien volutpat laoreet sed vitae magna. Sed quis arcu eget lectus placerat lobortis et eget dui. Donec tempus feugiat enim, at mollis ligula semper et. Duis libero sem, lacinia non urna a, feugiat commodo ex. Sed quis imperdiet urna. Nulla ut quam urna.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(39,7,3,5.00,'Curabitur felis neque, tincidunt ac cursus at, pellentesque sit amet augue. Cras sagittis convallis varius. Nullam sagittis fermentum augue, interdum accumsan lectus molestie a. Nullam quis vehicula mauris. Aliquam et tristique leo, in tempus leo. Ut sodales ut lectus vitae tristique. Nam quis diam dolor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Phasellus condimentum augue non nibh facilisis dignissim. Ut cursus ligula sit amet lacus tempor, ut suscipit tellus vestibulum. Curabitur posuere felis non libero imperdiet, id venenatis diam lobortis. Nullam sit amet libero congue, ultrices quam eu, tristique dui. Praesent laoreet suscipit erat, ac congue velit efficitur sit amet. Aenean eget tincidunt magna.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(40,7,4,5.00,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque congue interdum congue. Mauris sed odio turpis. Morbi lectus leo, ornare eu convallis id, laoreet non sapien. Donec molestie volutpat nisi, vulputate iaculis sapien efficitur sit amet. Vivamus sodales velit eget mauris scelerisque pretium. Pellentesque dui risus, eleifend ut dapibus ut, posuere ac ligula. Etiam ac felis et magna imperdiet sollicitudin. Praesent a mi non sapien volutpat laoreet sed vitae magna. Sed quis arcu eget lectus placerat lobortis et eget dui. Donec tempus feugiat enim, at mollis ligula semper et. Duis libero sem, lacinia non urna a, feugiat commodo ex. Sed quis imperdiet urna. Nulla ut quam urna.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(41,7,5,5.00,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque congue interdum congue. Mauris sed odio turpis. Morbi lectus leo, ornare eu convallis id, laoreet non sapien. Donec molestie volutpat nisi, vulputate iaculis sapien efficitur sit amet. Vivamus sodales velit eget mauris scelerisque pretium. Pellentesque dui risus, eleifend ut dapibus ut, posuere ac ligula. Etiam ac felis et magna imperdiet sollicitudin. Praesent a mi non sapien volutpat laoreet sed vitae magna. Sed quis arcu eget lectus placerat lobortis et eget dui. Donec tempus feugiat enim, at mollis ligula semper et. Duis libero sem, lacinia non urna a, feugiat commodo ex. Sed quis imperdiet urna. Nulla ut quam urna.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(42,7,4,5.00,'Fusce sed molestie ligula, id dapibus tellus. Fusce nec lacus arcu. Fusce a consequat turpis. Maecenas dapibus diam non cursus cursus. Sed vel eleifend libero, vel pellentesque turpis. Vivamus eget ullamcorper augue. Nunc in ultricies orci. Sed semper lorem non quam iaculis, et tincidunt leo malesuada. Ut egestas felis id eros maximus, ac varius est molestie. Donec at aliquet eros, eget commodo urna. Donec ultrices risus varius turpis rutrum rutrum id nec tellus. In porttitor sodales hendrerit. Fusce non porta odio. Suspendisse potenti.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(43,7,2,5.00,'Fusce sed molestie ligula, id dapibus tellus. Fusce nec lacus arcu. Fusce a consequat turpis. Maecenas dapibus diam non cursus cursus. Sed vel eleifend libero, vel pellentesque turpis. Vivamus eget ullamcorper augue. Nunc in ultricies orci. Sed semper lorem non quam iaculis, et tincidunt leo malesuada. Ut egestas felis id eros maximus, ac varius est molestie. Donec at aliquet eros, eget commodo urna. Donec ultrices risus varius turpis rutrum rutrum id nec tellus. In porttitor sodales hendrerit. Fusce non porta odio. Suspendisse potenti.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(44,7,3,5.00,'Curabitur felis neque, tincidunt ac cursus at, pellentesque sit amet augue. Cras sagittis convallis varius. Nullam sagittis fermentum augue, interdum accumsan lectus molestie a. Nullam quis vehicula mauris. Aliquam et tristique leo, in tempus leo. Ut sodales ut lectus vitae tristique. Nam quis diam dolor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Phasellus condimentum augue non nibh facilisis dignissim. Ut cursus ligula sit amet lacus tempor, ut suscipit tellus vestibulum. Curabitur posuere felis non libero imperdiet, id venenatis diam lobortis. Nullam sit amet libero congue, ultrices quam eu, tristique dui. Praesent laoreet suscipit erat, ac congue velit efficitur sit amet. Aenean eget tincidunt magna.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(45,8,4,5.00,'Fusce sed molestie ligula, id dapibus tellus. Fusce nec lacus arcu. Fusce a consequat turpis. Maecenas dapibus diam non cursus cursus. Sed vel eleifend libero, vel pellentesque turpis. Vivamus eget ullamcorper augue. Nunc in ultricies orci. Sed semper lorem non quam iaculis, et tincidunt leo malesuada. Ut egestas felis id eros maximus, ac varius est molestie. Donec at aliquet eros, eget commodo urna. Donec ultrices risus varius turpis rutrum rutrum id nec tellus. In porttitor sodales hendrerit. Fusce non porta odio. Suspendisse potenti.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(46,8,1,5.00,'Proin enim elit, rutrum ut venenatis nec, euismod non odio. Nunc blandit arcu sed ligula laoreet, eu gravida est elementum. Pellentesque id sem sapien. Quisque tristique nunc purus, ac tristique lacus interdum sed. Sed auctor dui sed augue rhoncus tempus. Aenean mi ex, dignissim sit amet pellentesque vitae, aliquam non magna. Cras lorem arcu, gravida quis feugiat vitae, tristique vehicula ex. Aenean tempus blandit erat, vel ultrices velit blandit id. Ut nec sodales nulla. Nam semper ipsum turpis, sed imperdiet leo faucibus eu. Duis id fringilla augue. Donec vel facilisis urna, et vestibulum libero. Aenean tincidunt id magna fringilla dapibus. Donec suscipit vehicula sollicitudin.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(47,8,5,5.00,'Curabitur felis neque, tincidunt ac cursus at, pellentesque sit amet augue. Cras sagittis convallis varius. Nullam sagittis fermentum augue, interdum accumsan lectus molestie a. Nullam quis vehicula mauris. Aliquam et tristique leo, in tempus leo. Ut sodales ut lectus vitae tristique. Nam quis diam dolor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Phasellus condimentum augue non nibh facilisis dignissim. Ut cursus ligula sit amet lacus tempor, ut suscipit tellus vestibulum. Curabitur posuere felis non libero imperdiet, id venenatis diam lobortis. Nullam sit amet libero congue, ultrices quam eu, tristique dui. Praesent laoreet suscipit erat, ac congue velit efficitur sit amet. Aenean eget tincidunt magna.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(48,8,1,5.00,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque congue interdum congue. Mauris sed odio turpis. Morbi lectus leo, ornare eu convallis id, laoreet non sapien. Donec molestie volutpat nisi, vulputate iaculis sapien efficitur sit amet. Vivamus sodales velit eget mauris scelerisque pretium. Pellentesque dui risus, eleifend ut dapibus ut, posuere ac ligula. Etiam ac felis et magna imperdiet sollicitudin. Praesent a mi non sapien volutpat laoreet sed vitae magna. Sed quis arcu eget lectus placerat lobortis et eget dui. Donec tempus feugiat enim, at mollis ligula semper et. Duis libero sem, lacinia non urna a, feugiat commodo ex. Sed quis imperdiet urna. Nulla ut quam urna.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(49,8,3,5.00,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque congue interdum congue. Mauris sed odio turpis. Morbi lectus leo, ornare eu convallis id, laoreet non sapien. Donec molestie volutpat nisi, vulputate iaculis sapien efficitur sit amet. Vivamus sodales velit eget mauris scelerisque pretium. Pellentesque dui risus, eleifend ut dapibus ut, posuere ac ligula. Etiam ac felis et magna imperdiet sollicitudin. Praesent a mi non sapien volutpat laoreet sed vitae magna. Sed quis arcu eget lectus placerat lobortis et eget dui. Donec tempus feugiat enim, at mollis ligula semper et. Duis libero sem, lacinia non urna a, feugiat commodo ex. Sed quis imperdiet urna. Nulla ut quam urna.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(50,8,1,5.00,'Proin enim elit, rutrum ut venenatis nec, euismod non odio. Nunc blandit arcu sed ligula laoreet, eu gravida est elementum. Pellentesque id sem sapien. Quisque tristique nunc purus, ac tristique lacus interdum sed. Sed auctor dui sed augue rhoncus tempus. Aenean mi ex, dignissim sit amet pellentesque vitae, aliquam non magna. Cras lorem arcu, gravida quis feugiat vitae, tristique vehicula ex. Aenean tempus blandit erat, vel ultrices velit blandit id. Ut nec sodales nulla. Nam semper ipsum turpis, sed imperdiet leo faucibus eu. Duis id fringilla augue. Donec vel facilisis urna, et vestibulum libero. Aenean tincidunt id magna fringilla dapibus. Donec suscipit vehicula sollicitudin.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(51,8,4,5.00,'Fusce a euismod tellus. Nullam massa dolor, ultricies quis facilisis id, aliquam in libero. Nam tempor imperdiet sapien, quis tempor augue bibendum id. Phasellus efficitur augue a maximus vulputate. Curabitur sed velit bibendum, convallis eros ut, congue nisl. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla quis urna quis eros placerat dictum. Aliquam iaculis, massa ac mollis lacinia, metus justo rhoncus diam, in fermentum lectus libero vel sapien. Donec vel feugiat enim, ac euismod lacus. Sed vitae consectetur felis. Nunc ullamcorper posuere ligula, sit amet sagittis nibh eleifend non. Quisque vel ligula tincidunt, ornare purus non, viverra risus. Ut pretium eleifend magna a fringilla. Maecenas vitae pellentesque erat, quis pellentesque mi. Proin non nisl lectus. Vivamus augue nisi, faucibus id ante in, tempus dictum tellus.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(52,9,2,5.00,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque congue interdum congue. Mauris sed odio turpis. Morbi lectus leo, ornare eu convallis id, laoreet non sapien. Donec molestie volutpat nisi, vulputate iaculis sapien efficitur sit amet. Vivamus sodales velit eget mauris scelerisque pretium. Pellentesque dui risus, eleifend ut dapibus ut, posuere ac ligula. Etiam ac felis et magna imperdiet sollicitudin. Praesent a mi non sapien volutpat laoreet sed vitae magna. Sed quis arcu eget lectus placerat lobortis et eget dui. Donec tempus feugiat enim, at mollis ligula semper et. Duis libero sem, lacinia non urna a, feugiat commodo ex. Sed quis imperdiet urna. Nulla ut quam urna.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(53,9,4,5.00,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque congue interdum congue. Mauris sed odio turpis. Morbi lectus leo, ornare eu convallis id, laoreet non sapien. Donec molestie volutpat nisi, vulputate iaculis sapien efficitur sit amet. Vivamus sodales velit eget mauris scelerisque pretium. Pellentesque dui risus, eleifend ut dapibus ut, posuere ac ligula. Etiam ac felis et magna imperdiet sollicitudin. Praesent a mi non sapien volutpat laoreet sed vitae magna. Sed quis arcu eget lectus placerat lobortis et eget dui. Donec tempus feugiat enim, at mollis ligula semper et. Duis libero sem, lacinia non urna a, feugiat commodo ex. Sed quis imperdiet urna. Nulla ut quam urna.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(54,9,2,5.00,'Fusce sed molestie ligula, id dapibus tellus. Fusce nec lacus arcu. Fusce a consequat turpis. Maecenas dapibus diam non cursus cursus. Sed vel eleifend libero, vel pellentesque turpis. Vivamus eget ullamcorper augue. Nunc in ultricies orci. Sed semper lorem non quam iaculis, et tincidunt leo malesuada. Ut egestas felis id eros maximus, ac varius est molestie. Donec at aliquet eros, eget commodo urna. Donec ultrices risus varius turpis rutrum rutrum id nec tellus. In porttitor sodales hendrerit. Fusce non porta odio. Suspendisse potenti.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(55,9,5,5.00,'Fusce sed molestie ligula, id dapibus tellus. Fusce nec lacus arcu. Fusce a consequat turpis. Maecenas dapibus diam non cursus cursus. Sed vel eleifend libero, vel pellentesque turpis. Vivamus eget ullamcorper augue. Nunc in ultricies orci. Sed semper lorem non quam iaculis, et tincidunt leo malesuada. Ut egestas felis id eros maximus, ac varius est molestie. Donec at aliquet eros, eget commodo urna. Donec ultrices risus varius turpis rutrum rutrum id nec tellus. In porttitor sodales hendrerit. Fusce non porta odio. Suspendisse potenti.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(56,9,4,5.00,'Fusce a euismod tellus. Nullam massa dolor, ultricies quis facilisis id, aliquam in libero. Nam tempor imperdiet sapien, quis tempor augue bibendum id. Phasellus efficitur augue a maximus vulputate. Curabitur sed velit bibendum, convallis eros ut, congue nisl. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla quis urna quis eros placerat dictum. Aliquam iaculis, massa ac mollis lacinia, metus justo rhoncus diam, in fermentum lectus libero vel sapien. Donec vel feugiat enim, ac euismod lacus. Sed vitae consectetur felis. Nunc ullamcorper posuere ligula, sit amet sagittis nibh eleifend non. Quisque vel ligula tincidunt, ornare purus non, viverra risus. Ut pretium eleifend magna a fringilla. Maecenas vitae pellentesque erat, quis pellentesque mi. Proin non nisl lectus. Vivamus augue nisi, faucibus id ante in, tempus dictum tellus.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(57,9,4,5.00,'Proin enim elit, rutrum ut venenatis nec, euismod non odio. Nunc blandit arcu sed ligula laoreet, eu gravida est elementum. Pellentesque id sem sapien. Quisque tristique nunc purus, ac tristique lacus interdum sed. Sed auctor dui sed augue rhoncus tempus. Aenean mi ex, dignissim sit amet pellentesque vitae, aliquam non magna. Cras lorem arcu, gravida quis feugiat vitae, tristique vehicula ex. Aenean tempus blandit erat, vel ultrices velit blandit id. Ut nec sodales nulla. Nam semper ipsum turpis, sed imperdiet leo faucibus eu. Duis id fringilla augue. Donec vel facilisis urna, et vestibulum libero. Aenean tincidunt id magna fringilla dapibus. Donec suscipit vehicula sollicitudin.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(58,9,1,5.00,'Fusce a euismod tellus. Nullam massa dolor, ultricies quis facilisis id, aliquam in libero. Nam tempor imperdiet sapien, quis tempor augue bibendum id. Phasellus efficitur augue a maximus vulputate. Curabitur sed velit bibendum, convallis eros ut, congue nisl. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla quis urna quis eros placerat dictum. Aliquam iaculis, massa ac mollis lacinia, metus justo rhoncus diam, in fermentum lectus libero vel sapien. Donec vel feugiat enim, ac euismod lacus. Sed vitae consectetur felis. Nunc ullamcorper posuere ligula, sit amet sagittis nibh eleifend non. Quisque vel ligula tincidunt, ornare purus non, viverra risus. Ut pretium eleifend magna a fringilla. Maecenas vitae pellentesque erat, quis pellentesque mi. Proin non nisl lectus. Vivamus augue nisi, faucibus id ante in, tempus dictum tellus.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(59,10,5,5.00,'Fusce a euismod tellus. Nullam massa dolor, ultricies quis facilisis id, aliquam in libero. Nam tempor imperdiet sapien, quis tempor augue bibendum id. Phasellus efficitur augue a maximus vulputate. Curabitur sed velit bibendum, convallis eros ut, congue nisl. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla quis urna quis eros placerat dictum. Aliquam iaculis, massa ac mollis lacinia, metus justo rhoncus diam, in fermentum lectus libero vel sapien. Donec vel feugiat enim, ac euismod lacus. Sed vitae consectetur felis. Nunc ullamcorper posuere ligula, sit amet sagittis nibh eleifend non. Quisque vel ligula tincidunt, ornare purus non, viverra risus. Ut pretium eleifend magna a fringilla. Maecenas vitae pellentesque erat, quis pellentesque mi. Proin non nisl lectus. Vivamus augue nisi, faucibus id ante in, tempus dictum tellus.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(60,10,4,5.00,'Fusce a euismod tellus. Nullam massa dolor, ultricies quis facilisis id, aliquam in libero. Nam tempor imperdiet sapien, quis tempor augue bibendum id. Phasellus efficitur augue a maximus vulputate. Curabitur sed velit bibendum, convallis eros ut, congue nisl. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla quis urna quis eros placerat dictum. Aliquam iaculis, massa ac mollis lacinia, metus justo rhoncus diam, in fermentum lectus libero vel sapien. Donec vel feugiat enim, ac euismod lacus. Sed vitae consectetur felis. Nunc ullamcorper posuere ligula, sit amet sagittis nibh eleifend non. Quisque vel ligula tincidunt, ornare purus non, viverra risus. Ut pretium eleifend magna a fringilla. Maecenas vitae pellentesque erat, quis pellentesque mi. Proin non nisl lectus. Vivamus augue nisi, faucibus id ante in, tempus dictum tellus.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(61,10,2,5.00,'Proin enim elit, rutrum ut venenatis nec, euismod non odio. Nunc blandit arcu sed ligula laoreet, eu gravida est elementum. Pellentesque id sem sapien. Quisque tristique nunc purus, ac tristique lacus interdum sed. Sed auctor dui sed augue rhoncus tempus. Aenean mi ex, dignissim sit amet pellentesque vitae, aliquam non magna. Cras lorem arcu, gravida quis feugiat vitae, tristique vehicula ex. Aenean tempus blandit erat, vel ultrices velit blandit id. Ut nec sodales nulla. Nam semper ipsum turpis, sed imperdiet leo faucibus eu. Duis id fringilla augue. Donec vel facilisis urna, et vestibulum libero. Aenean tincidunt id magna fringilla dapibus. Donec suscipit vehicula sollicitudin.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(62,10,1,5.00,'Proin enim elit, rutrum ut venenatis nec, euismod non odio. Nunc blandit arcu sed ligula laoreet, eu gravida est elementum. Pellentesque id sem sapien. Quisque tristique nunc purus, ac tristique lacus interdum sed. Sed auctor dui sed augue rhoncus tempus. Aenean mi ex, dignissim sit amet pellentesque vitae, aliquam non magna. Cras lorem arcu, gravida quis feugiat vitae, tristique vehicula ex. Aenean tempus blandit erat, vel ultrices velit blandit id. Ut nec sodales nulla. Nam semper ipsum turpis, sed imperdiet leo faucibus eu. Duis id fringilla augue. Donec vel facilisis urna, et vestibulum libero. Aenean tincidunt id magna fringilla dapibus. Donec suscipit vehicula sollicitudin.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(63,10,3,5.00,'Proin enim elit, rutrum ut venenatis nec, euismod non odio. Nunc blandit arcu sed ligula laoreet, eu gravida est elementum. Pellentesque id sem sapien. Quisque tristique nunc purus, ac tristique lacus interdum sed. Sed auctor dui sed augue rhoncus tempus. Aenean mi ex, dignissim sit amet pellentesque vitae, aliquam non magna. Cras lorem arcu, gravida quis feugiat vitae, tristique vehicula ex. Aenean tempus blandit erat, vel ultrices velit blandit id. Ut nec sodales nulla. Nam semper ipsum turpis, sed imperdiet leo faucibus eu. Duis id fringilla augue. Donec vel facilisis urna, et vestibulum libero. Aenean tincidunt id magna fringilla dapibus. Donec suscipit vehicula sollicitudin.','2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(64,10,4,5.00,'Fusce a euismod tellus. Nullam massa dolor, ultricies quis facilisis id, aliquam in libero. Nam tempor imperdiet sapien, quis tempor augue bibendum id. Phasellus efficitur augue a maximus vulputate. Curabitur sed velit bibendum, convallis eros ut, congue nisl. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla quis urna quis eros placerat dictum. Aliquam iaculis, massa ac mollis lacinia, metus justo rhoncus diam, in fermentum lectus libero vel sapien. Donec vel feugiat enim, ac euismod lacus. Sed vitae consectetur felis. Nunc ullamcorper posuere ligula, sit amet sagittis nibh eleifend non. Quisque vel ligula tincidunt, ornare purus non, viverra risus. Ut pretium eleifend magna a fringilla. Maecenas vitae pellentesque erat, quis pellentesque mi. Proin non nisl lectus. Vivamus augue nisi, faucibus id ante in, tempus dictum tellus.','2021-01-22 21:41:35','2021-01-22 21:41:35');

/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table role_has_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role_has_permissions`;

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`)
VALUES
	(1,'admin','web','2021-01-22 21:41:34','2021-01-22 21:41:34'),
	(2,'customer','web','2021-01-22 21:41:34','2021-01-22 21:41:34');

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_pic_path` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `biography` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_first_name_index` (`first_name`),
  KEY `users_last_name_index` (`last_name`),
  KEY `users_phone_number_index` (`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone_number`, `email_verified_at`, `password`, `profile_pic_path`, `remember_token`, `biography`, `created_at`, `updated_at`)
VALUES
	(1,'Sescu','Andrei','sescu.andrei@yahoo.com',NULL,'2021-01-22 21:41:34','$2y$10$oqL.91hk7O3OjzgrSO0HGuBkeB9mCSqmk3NwABChrQ/BOiZ/gBwDy','/img/profile_image.png',NULL,NULL,'2021-01-22 21:41:34','2021-01-22 21:41:34'),
	(2,'Bogdan','George','george.bogdan@yahoo.com',NULL,'2021-01-22 21:41:34','$2y$10$OL6yX7fZZH0VCLjuVmHaO.GVkU9qprJ8cvQL4fbtclXm7XpG30iR2','/img/bogdan.png',NULL,NULL,'2021-01-22 21:41:34','2021-01-22 21:41:34'),
	(3,'Robu','Emanuel','robu.ana@yahoo.com',NULL,'2021-01-22 21:41:35','$2y$10$5bTpG7QPE5PtwAJkZdaVFO5nOIiZoLmfdBopOmbunDvdt61Gi/qTe','/img/emanuel.png',NULL,NULL,'2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(4,'Antoci','Maria','antoci.maria@yahoo.com',NULL,'2021-01-22 21:41:35','$2y$10$Ih/vnIj0yalK7MuX9WOleeno8z7Hs8/bIF9A2woylGXrsS4OwI9Vy','/img/ioana.png',NULL,NULL,'2021-01-22 21:41:35','2021-01-22 21:41:35'),
	(5,'Vladescu','Ionut','vladescu.ionut@yahoo.com',NULL,'2021-01-22 21:41:35','$2y$10$a0Hr1/6r4Zh8dQK2eyYV1u1hN6AziNczVpc3xvCxP3j75CUGjz.E6','/img/marian.png',NULL,NULL,'2021-01-22 21:41:35','2021-01-22 21:41:35');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
