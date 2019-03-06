# ************************************************************
# Sequel Pro SQL dump
# Version 5438
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.37)
# Database: comphanny
# Generation Time: 2019-03-06 06:30:38 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table cphy_assetindexdata
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_assetindexdata`;

CREATE TABLE `cphy_assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cphy_assetindexdata_sessionId_volumeId_idx` (`sessionId`,`volumeId`),
  KEY `cphy_assetindexdata_volumeId_idx` (`volumeId`),
  CONSTRAINT `cphy_assetindexdata_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `cphy_volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table cphy_assets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_assets`;

CREATE TABLE `cphy_assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cphy_assets_filename_folderId_idx` (`filename`,`folderId`),
  KEY `cphy_assets_folderId_idx` (`folderId`),
  KEY `cphy_assets_volumeId_idx` (`volumeId`),
  CONSTRAINT `cphy_assets_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `cphy_volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cphy_assets_id_fk` FOREIGN KEY (`id`) REFERENCES `cphy_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cphy_assets_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `cphy_volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cphy_assets` WRITE;
/*!40000 ALTER TABLE `cphy_assets` DISABLE KEYS */;

INSERT INTO `cphy_assets` (`id`, `volumeId`, `folderId`, `filename`, `kind`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(6,1,1,'smilies-bank-sit-rest-160739.jpeg','image',1920,1280,472978,NULL,NULL,NULL,'2019-03-03 12:45:31','2019-03-03 12:45:31','2019-03-03 12:45:31','9d95e906-0f25-498a-a8dc-855a293dcb59'),
	(7,3,3,'founder.png','image',512,512,21437,NULL,NULL,NULL,'2019-03-03 13:53:04','2019-03-03 13:53:04','2019-03-03 13:53:04','fd0b18c1-eca1-448a-a6eb-e6e1637e341b'),
	(9,3,3,'coder.png','image',512,512,20315,NULL,NULL,NULL,'2019-03-03 13:53:54','2019-03-03 13:53:54','2019-03-03 13:53:54','0a5c709f-63c8-43ba-a6c5-bbb4e585290b'),
	(13,3,3,'designer.png','image',512,512,21254,NULL,NULL,NULL,'2019-03-03 13:57:53','2019-03-03 13:57:54','2019-03-03 13:57:54','74f34ed5-39bf-4689-ae80-2bca110c8373'),
	(15,2,2,'comphanny.png','image',1903,962,75587,NULL,NULL,NULL,'2019-03-03 15:59:43','2019-03-03 15:59:43','2019-03-03 15:59:43','f4347282-2500-44cf-8aaf-7e0b954ea73f'),
	(16,2,2,'comphanny-products.png','image',1440,723,228703,NULL,NULL,NULL,'2019-03-03 16:11:14','2019-03-03 16:11:14','2019-03-03 16:11:14','c7b1c2a3-da65-41e6-9205-ae97b24a6a41'),
	(17,2,2,'website-001.jpeg','image',1920,1257,256504,NULL,NULL,NULL,'2019-03-03 16:14:22','2019-03-03 16:14:23','2019-03-03 16:14:23','2261b83a-3e39-4ca5-aaa0-cef79201fa71'),
	(18,2,2,'website-002.jpeg','image',1280,853,140987,NULL,NULL,NULL,'2019-03-03 16:16:54','2019-03-03 16:16:54','2019-03-03 16:16:54','1b3791fd-61a2-455c-810e-a3851e16b91c');

/*!40000 ALTER TABLE `cphy_assets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cphy_assettransformindex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_assettransformindex`;

CREATE TABLE `cphy_assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cphy_assettransformindex_volumeId_assetId_location_idx` (`volumeId`,`assetId`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cphy_assettransformindex` WRITE;
/*!40000 ALTER TABLE `cphy_assettransformindex` DISABLE KEYS */;

INSERT INTO `cphy_assettransformindex` (`id`, `assetId`, `filename`, `format`, `location`, `volumeId`, `fileExists`, `inProgress`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,6,'smilies-bank-sit-rest-160739.jpeg',NULL,'_pageBanner',1,1,0,'2019-03-03 13:00:25','2019-03-03 13:00:25','2019-03-03 13:00:25','998c813c-57bf-44cd-a123-3aa993941199'),
	(2,9,'coder.png',NULL,'_profileSm',3,1,0,'2019-03-03 14:19:16','2019-03-03 14:19:16','2019-03-03 14:19:17','96bfe867-e24e-4398-947b-70e5bc9c72b3'),
	(3,13,'designer.png',NULL,'_profileSm',3,1,0,'2019-03-03 14:19:16','2019-03-03 14:19:16','2019-03-03 14:19:18','cba87a4f-9fbb-4e17-bda0-b1551bd96677'),
	(4,7,'founder.png',NULL,'_profileSm',3,1,0,'2019-03-03 14:19:16','2019-03-03 14:19:16','2019-03-03 14:19:17','3b9e9bd1-930d-4e8a-8a7c-f182f71e05b8'),
	(5,7,'founder.png',NULL,'_profileLg',3,1,0,'2019-03-03 14:51:28','2019-03-03 14:51:28','2019-03-03 14:51:29','78faa47e-849f-40ae-8a7f-7b1274deb495'),
	(6,17,'website-001.jpeg',NULL,'_thumbBannerSm',2,1,0,'2019-03-03 16:30:24','2019-03-03 16:30:24','2019-03-03 16:30:25','e340db37-a1ed-42cc-8cc6-9fd84c882009'),
	(7,17,'website-001.jpeg',NULL,'_pageBanner',2,1,0,'2019-03-03 16:34:44','2019-03-03 16:34:44','2019-03-03 16:34:45','5c0cf7c5-0c68-4310-8669-f60400caa60c'),
	(8,7,'founder.png',NULL,'_cardThumbSm',3,1,0,'2019-03-03 17:16:02','2019-03-03 17:16:02','2019-03-03 17:16:02','0ee8d6f1-8d32-4332-b226-eccc1d0fa819'),
	(9,13,'designer.png',NULL,'_cardThumbSm',3,1,0,'2019-03-03 17:16:02','2019-03-03 17:16:02','2019-03-03 17:16:02','c3d7aa59-b7e4-4da9-b14f-984320388597'),
	(10,9,'coder.png',NULL,'_cardThumbSm',3,1,0,'2019-03-03 17:16:02','2019-03-03 17:16:02','2019-03-03 17:16:03','d64e77b3-c14e-475e-8610-ddabd4301210'),
	(11,18,'website-002.jpeg',NULL,'_cardThumbLg',2,1,0,'2019-03-03 17:18:03','2019-03-03 17:18:03','2019-03-03 17:18:03','1dad3452-7553-4768-a0e2-72f1a9546996'),
	(12,17,'website-001.jpeg',NULL,'_thumbBanner',2,1,0,'2019-03-03 18:00:47','2019-03-03 18:00:47','2019-03-03 18:00:47','cf532ac2-c630-4b6a-8a95-48d1f93e39e0');

/*!40000 ALTER TABLE `cphy_assettransformindex` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cphy_assettransforms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_assettransforms`;

CREATE TABLE `cphy_assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cphy_assettransforms_name_unq_idx` (`name`),
  UNIQUE KEY `cphy_assettransforms_handle_unq_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cphy_assettransforms` WRITE;
/*!40000 ALTER TABLE `cphy_assettransforms` DISABLE KEYS */;

INSERT INTO `cphy_assettransforms` (`id`, `name`, `handle`, `mode`, `position`, `width`, `height`, `format`, `quality`, `interlace`, `dimensionChangeTime`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Page Banner','pageBanner','crop','center-center',1110,624,NULL,NULL,'none','2019-03-03 12:10:25','2019-03-03 12:10:25','2019-03-03 12:10:25','e8607822-82c3-45da-9ff0-d610e946101f'),
	(2,'Thumb Banner','thumbBanner','crop','center-center',538,302,NULL,NULL,'none','2019-03-03 16:28:50','2019-03-03 12:11:20','2019-03-03 16:28:50','65cdef0b-c238-4005-b65a-4ba831221824'),
	(3,'Card Thumb Small','cardThumbSm','crop','center-center',116,155,NULL,NULL,'none','2019-03-03 17:14:20','2019-03-03 12:12:18','2019-03-03 17:14:20','9df14a11-c54f-4004-8019-0a59a11ba789'),
	(4,'Thumb Banner Small','thumbBannerSm','crop','center-center',347,195,NULL,NULL,'none','2019-03-03 16:28:40','2019-03-03 12:13:26','2019-03-03 16:28:40','3b5b0809-6c19-439f-949a-64e023128ad7'),
	(5,'Card Thumb Large','cardThumbLg','crop','center-center',369,276,NULL,NULL,'none','2019-03-03 17:13:58','2019-03-03 12:14:54','2019-03-03 17:13:58','aabb7f35-70e2-44b9-8ddb-d76430265137');

/*!40000 ALTER TABLE `cphy_assettransforms` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cphy_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_categories`;

CREATE TABLE `cphy_categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cphy_categories_groupId_idx` (`groupId`),
  KEY `cphy_categories_parentId_fk` (`parentId`),
  CONSTRAINT `cphy_categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `cphy_categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cphy_categories_id_fk` FOREIGN KEY (`id`) REFERENCES `cphy_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cphy_categories_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `cphy_categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cphy_categories` WRITE;
/*!40000 ALTER TABLE `cphy_categories` DISABLE KEYS */;

INSERT INTO `cphy_categories` (`id`, `groupId`, `parentId`, `deletedWithGroup`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(25,1,NULL,NULL,'2019-03-03 17:31:53','2019-03-03 17:35:00','9137a00f-1b08-4857-a604-499ae8c9bcd5'),
	(26,1,NULL,NULL,'2019-03-03 17:32:15','2019-03-03 17:34:50','cdfd6104-7879-49f9-b34e-c5f20fd4b4af'),
	(27,1,NULL,NULL,'2019-03-03 17:32:38','2019-03-03 17:35:10','d40f0990-7a53-4579-b59a-2f77c754f14a'),
	(28,1,NULL,NULL,'2019-03-03 17:33:02','2019-03-03 17:35:21','d7937736-6a65-4698-972b-3ccb4caea159');

/*!40000 ALTER TABLE `cphy_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cphy_categorygroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_categorygroups`;

CREATE TABLE `cphy_categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cphy_categorygroups_name_idx` (`name`),
  KEY `cphy_categorygroups_handle_idx` (`handle`),
  KEY `cphy_categorygroups_structureId_idx` (`structureId`),
  KEY `cphy_categorygroups_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `cphy_categorygroups_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `cphy_categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `cphy_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `cphy_categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `cphy_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cphy_categorygroups` WRITE;
/*!40000 ALTER TABLE `cphy_categorygroups` DISABLE KEYS */;

INSERT INTO `cphy_categorygroups` (`id`, `structureId`, `fieldLayoutId`, `name`, `handle`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,1,11,'Product Types','productTypes','2019-03-03 17:29:02','2019-03-03 17:34:16',NULL,'c46db0a2-6965-486d-893f-effff9b4b4f1');

/*!40000 ALTER TABLE `cphy_categorygroups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cphy_categorygroups_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_categorygroups_sites`;

CREATE TABLE `cphy_categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cphy_categorygroups_sites_groupId_siteId_unq_idx` (`groupId`,`siteId`),
  KEY `cphy_categorygroups_sites_siteId_idx` (`siteId`),
  CONSTRAINT `cphy_categorygroups_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `cphy_categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cphy_categorygroups_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `cphy_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cphy_categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `cphy_categorygroups_sites` DISABLE KEYS */;

INSERT INTO `cphy_categorygroups_sites` (`id`, `groupId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,1,1,'product-types/{slug}','products/_category.twig','2019-03-03 17:29:02','2019-03-03 17:34:16','6f3bea2b-924a-41c9-8554-2638138f44e1');

/*!40000 ALTER TABLE `cphy_categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cphy_content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_content`;

CREATE TABLE `cphy_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_bodyHtml` text,
  `field_text` text,
  `field_bodyPlain` text,
  `field_blockquoteHeading` text,
  `field_blockquoteContent` text,
  `field_imageAltText` text,
  `field_titlePosition` text,
  `field_joinedDate` datetime DEFAULT NULL,
  `field_byline` text,
  `field_isFounder` tinyint(1) DEFAULT NULL,
  `field_profileBody` text,
  `field_profileOrder` smallint(1) DEFAULT NULL,
  `field_productHtml` text,
  `field_techStack` text,
  `field_isFeatured` tinyint(1) DEFAULT NULL,
  `field_typeDescription` text,
  `field_typeIcon` text,
  `field_productDescription` text,
  `field_productTagline` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cphy_content_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `cphy_content_siteId_idx` (`siteId`),
  KEY `cphy_content_title_idx` (`title`),
  CONSTRAINT `cphy_content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `cphy_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cphy_content_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `cphy_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cphy_content` WRITE;
/*!40000 ALTER TABLE `cphy_content` DISABLE KEYS */;

INSERT INTO `cphy_content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_bodyHtml`, `field_text`, `field_bodyPlain`, `field_blockquoteHeading`, `field_blockquoteContent`, `field_imageAltText`, `field_titlePosition`, `field_joinedDate`, `field_byline`, `field_isFounder`, `field_profileBody`, `field_profileOrder`, `field_productHtml`, `field_techStack`, `field_isFeatured`, `field_typeDescription`, `field_typeIcon`, `field_productDescription`, `field_productTagline`)
VALUES
	(1,1,1,NULL,'2019-03-03 09:27:20','2019-03-06 06:29:59','16e51977-f009-4057-8dee-e1b161244a38',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(2,2,1,'Homepage','2019-03-03 10:07:54','2019-03-03 15:11:34','779e5087-4592-4730-a82c-3fec45d05198',NULL,'com:Phanny',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(3,3,1,'Products','2019-03-03 10:11:22','2019-03-03 10:12:17','c177f75b-d742-4230-8b5b-18c9c406bc71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(4,4,1,'Contact','2019-03-03 10:18:45','2019-03-03 12:16:59','a5b42ee9-1f02-4907-b9cb-4dd8514f5553',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(5,5,1,'About','2019-03-03 12:29:21','2019-03-03 13:22:43','255ad4b1-8d39-4c1e-a8bc-211885c34125','<h1>Lorem Ipsum</h1>\n<p><strong>Lorem ipsum</strong> dolor sit amet, consectetur adipiscing elit. Vivamus tincidunt pulvinar imperdiet. Ut non maximus tellus. Sed luctus ante sed pulvinar malesuada. Proin egestas gravida purus, nec sodales orci consequat at. Suspendisse potenti. Nam eget auctor ante, in molestie lorem. Nam imperdiet mauris id lacus eleifend, nec molestie magna.</p>\n<ul><li>One</li><li>Two</li><li>Three</li></ul>',NULL,NULL,'Why choose us?','Because we are a super-duper cool phun team!','About page banner',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(6,6,1,'Smilies-bank-sit-rest-160739','2019-03-03 12:45:31','2019-03-03 12:45:31','089d3280-0926-4d21-b3f8-48e8fd81399a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(7,7,1,'Founder','2019-03-03 13:53:04','2019-03-03 13:53:04','d36dcf3a-1446-4d63-957b-b8e92c0b8aa2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(8,8,1,'Mr. Patriarch Sr.','2019-03-03 13:53:12','2019-03-03 14:49:40','ff949272-497a-48ad-b267-2987451ef3bd',NULL,NULL,NULL,NULL,NULL,NULL,'Founder / CEO','2019-01-17 08:00:00','Duh?',1,'<h1>Lorem Ipsum</h1>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla egestas condimentum egestas. Proin scelerisque finibus velit. Quisque a mauris in libero semper posuere vitae sed elit. Aenean euismod est eget nulla iaculis laoreet. Vivamus aliquam porttitor dui, vitae cursus turpis fringilla non. Vivamus vel urna aliquam, scelerisque enim vitae, feugiat massa. Cras facilisis lectus eu nibh scelerisque tristique.</p>\n<h2>Why I founded this company</h2>\n<p>Integer hendrerit feugiat libero. Proin et suscipit ante. Aenean eget ante pretium, auctor nisi vitae, dictum augue. Integer hendrerit a enim sit amet mollis. Vestibulum porta feugiat scelerisque. Aliquam tincidunt nibh lectus, eu vulputate felis cursus non. Ut et libero non mauris.</p>\n<ol><li>First reason</li><li>Second reason</li><li>Third reason</li></ol>\n<h2>My first script</h2>\n<pre>&lt;script&gt;\n console.log(\'Some code here\');\n&lt;/script&gt;</pre>',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(9,9,1,'Coder','2019-03-03 13:53:54','2019-03-03 13:53:54','414dc878-3a08-4e07-84cf-984fe9095883',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(10,10,1,'Phanpy Dev','2019-03-03 13:56:52','2019-03-03 14:49:40','28f605e6-1dfc-4da2-82e9-09304c38fe81',NULL,NULL,NULL,NULL,NULL,NULL,'Team Lead / Web Developer','2019-01-31 08:00:00','I <3 coding!',0,'<h1>Lorem Ipsum</h1>\n<p>Minim irure consequat cupidatat cillum in. Enim non aliquip eu ullamco consequat esse mollit in nisi et. Labore in reprehenderit occaecat non eiusmod sunt ea minim amet commodo ullamco veniam do. Excepteur excepteur id reprehenderit amet.</p>\n<pre>var someVar;</pre>',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(11,11,1,'Mr. Patriarch Sr. copy','2019-03-03 13:57:12','2019-03-03 13:57:12','50269440-b20d-401e-9a1c-49bcad6bed92',NULL,NULL,NULL,NULL,NULL,NULL,'Founder / CEO','2019-01-17 08:00:00','Duh?',1,'<h1>Lorem Ipsum</h1>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla egestas condimentum egestas. Proin scelerisque finibus velit. Quisque a mauris in libero semper posuere vitae sed elit. Aenean euismod est eget nulla iaculis laoreet. Vivamus aliquam porttitor dui, vitae cursus turpis fringilla non. Vivamus vel urna aliquam, scelerisque enim vitae, feugiat massa. Cras facilisis lectus eu nibh scelerisque tristique.</p>\n<h2>Why I founded this company</h2>\n<p>Integer hendrerit feugiat libero. Proin et suscipit ante. Aenean eget ante pretium, auctor nisi vitae, dictum augue. Integer hendrerit a enim sit amet mollis. Vestibulum porta feugiat scelerisque. Aliquam tincidunt nibh lectus, eu vulputate felis cursus non. Ut et libero non mauris.</p><ol><li>First reason</li><li>Second reason</li><li>Third reason</li></ol><h2>My first script</h2>\n<pre>&lt;script&gt;\n console.log(\'Some code here\');\n&lt;/script&gt;</pre>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(12,12,1,'Phanpy Design','2019-03-03 13:57:27','2019-03-03 14:49:40','78363e4e-a723-4ba6-99f3-00e9becfebc6',NULL,NULL,NULL,NULL,NULL,NULL,'Lead Designer / UX Designer','2019-01-31 08:00:00','I <3 coding!',0,'<h1>Lorem Ipsum</h1>\n<p>Minim irure consequat cupidatat cillum in. Enim non aliquip eu ullamco consequat esse mollit in nisi et. Labore in reprehenderit occaecat non eiusmod sunt ea minim amet commodo ullamco veniam do. Excepteur excepteur id reprehenderit amet.</p>',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(13,13,1,'Designer','2019-03-03 13:57:53','2019-03-03 13:57:53','f568bcbf-137e-46fc-9912-97de72cc1d32',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(14,14,1,'Products','2019-03-03 15:15:19','2019-03-03 15:27:23','68795841-27ad-4568-bc37-2648a6dd24cf',NULL,NULL,'Minim irure consequat cupidatat cillum in. Enim non aliquip eu ullamco consequat esse mollit in nisi et. Labore in reprehenderit occaecat non eiusmod sunt ea minim amet commodo ullamco veniam do.\n\nExcepteur excepteur id reprehenderit amet.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>Minim irure consequat cupidatat cillum in. Enim non aliquip eu ullamco consequat esse mollit in nisi et. Labore in reprehenderit occaecat non eiusmod sunt ea minim amet commodo ullamco veniam do.</p><p>Excepteur excepteur id reprehenderit amet.</p>',NULL,NULL,NULL,NULL,NULL,NULL),
	(15,15,1,'Comphanny','2019-03-03 15:59:42','2019-03-03 15:59:42','27826aa0-0aad-4845-beca-88b845f4c560',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(16,16,1,'Comphanny-products','2019-03-03 16:11:13','2019-03-03 16:11:13','725b9917-e919-436a-b796-44d26d29e7b4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(17,17,1,'Website-001','2019-03-03 16:14:22','2019-03-03 16:14:22','444ca3fe-9c4b-42aa-965a-3a29af62fe2c',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(18,18,1,'Website-002','2019-03-03 16:16:54','2019-03-03 16:16:54','554eda78-3c4e-4ee9-8382-6256de306546',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(19,19,1,'Sample Product Entry','2019-03-03 16:17:03','2019-03-04 12:32:19','22648fda-69dc-4fde-ba78-ea2e3c6f6de0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"PHP7\",\"col2\":\"\"},{\"col1\":\"CraftCMS\",\"col2\":\"https://craftcms.com/\"}]',0,NULL,NULL,'Some description',NULL),
	(20,25,1,'Website','2019-03-03 17:31:53','2019-03-03 17:35:00','470682ae-20d7-4d72-ba0d-31db66a72621',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Website description','fal fa-browser',NULL,NULL),
	(21,26,1,'Web App','2019-03-03 17:32:15','2019-03-03 17:34:49','639c225c-5941-495a-b2a9-8cd1c447e215',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Web App category','fal fa-globe',NULL,NULL),
	(22,27,1,'Mobile App','2019-03-03 17:32:38','2019-03-03 17:35:10','399fd3f2-4bd3-4d29-991c-c8d8bf69849f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Mobile App description','fal fa-mobile',NULL,NULL),
	(23,28,1,'Web Service','2019-03-03 17:33:02','2019-03-03 17:35:20','d034d2fb-b0ab-4002-9efa-41784834a5fb',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Web Service description','fal fa-cloud',NULL,NULL),
	(24,29,1,'Featured Product 1','2019-03-03 17:56:13','2019-03-04 12:32:28','3fb83707-d01d-40db-8c70-b93a2c685928',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"PHP7\",\"col2\":\"\"},{\"col1\":\"CraftCMS\",\"col2\":\"https://craftcms.com/\"}]',1,NULL,NULL,'Some description','Some tagline'),
	(25,35,1,'Featured Product 2','2019-03-03 17:56:45','2019-03-04 12:32:19','170fc774-a8c6-4ab8-95ed-62c73d71ee5c',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"PHP7\",\"col2\":\"\"},{\"col1\":\"CraftCMS\",\"col2\":\"https://craftcms.com/\"}]',1,NULL,NULL,'Some description 2',NULL);

/*!40000 ALTER TABLE `cphy_content` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cphy_craftidtokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_craftidtokens`;

CREATE TABLE `cphy_craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cphy_craftidtokens_userId_fk` (`userId`),
  CONSTRAINT `cphy_craftidtokens_userId_fk` FOREIGN KEY (`userId`) REFERENCES `cphy_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table cphy_deprecationerrors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_deprecationerrors`;

CREATE TABLE `cphy_deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cphy_deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cphy_deprecationerrors` WRITE;
/*!40000 ALTER TABLE `cphy_deprecationerrors` DISABLE KEYS */;

INSERT INTO `cphy_deprecationerrors` (`id`, `key`, `fingerprint`, `lastOccurrence`, `file`, `line`, `message`, `traces`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(18,'ElementQuery::getIterator()','/Users/davina/Developer/proj-comphanny-cms/templates/index.twig:41','2019-03-06 06:27:54','/Users/davina/Developer/proj-comphanny-cms/templates/index.twig',41,'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":464,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\CategoryQuery\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/storage/runtime/compiled_templates/58/58fb65bd6899873fa5f18ec1a64457bd2b0f4c79ed6b49adf7520bbf61ca9fa8.php\",\"line\":93,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_4923081c982fda9f0407dc7e08b020ddf67ed39769fed5f38c8c2fea566f3faa\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/twig/twig/lib/Twig/Template.php\",\"line\":189,\"class\":\"__TwigTemplate_4923081c982fda9f0407dc7e08b020ddf67ed39769fed5f38c8c2fea566f3faa\",\"method\":\"block_main\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, \\\"SORT_REGULAR\\\" => 0, ...], [\\\"main\\\" => [__TwigTemplate_4923081c982fda9f0407dc7e08b020ddf67ed39769fed5f38c8c2fea566f3faa, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_9d8be5146c8fe45cee25c62324ae2393125c735a1c57994826872e20533c86bb\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/storage/runtime/compiled_templates/ff/ff811b6f13dee6c971268c9e684406b05e094a098b4cddc9660ab82a080202d9.php\",\"line\":115,\"class\":\"Twig_Template\",\"method\":\"displayBlock\",\"args\":\"\\\"main\\\", [\\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, \\\"SORT_REGULAR\\\" => 0, ...], [\\\"main\\\" => [__TwigTemplate_4923081c982fda9f0407dc7e08b020ddf67ed39769fed5f38c8c2fea566f3faa, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_9d8be5146c8fe45cee25c62324ae2393125c735a1c57994826872e20533c86bb\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/twig/twig/lib/Twig/Template.php\",\"line\":386,\"class\":\"__TwigTemplate_9d8be5146c8fe45cee25c62324ae2393125c735a1c57994826872e20533c86bb\",\"method\":\"doDisplay\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, \\\"SORT_REGULAR\\\" => 0, ...], [\\\"main\\\" => [__TwigTemplate_4923081c982fda9f0407dc7e08b020ddf67ed39769fed5f38c8c2fea566f3faa, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_9d8be5146c8fe45cee25c62324ae2393125c735a1c57994826872e20533c86bb\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, \\\"SORT_REGULAR\\\" => 0, ...], [\\\"main\\\" => [__TwigTemplate_4923081c982fda9f0407dc7e08b020ddf67ed39769fed5f38c8c2fea566f3faa, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_9d8be5146c8fe45cee25c62324ae2393125c735a1c57994826872e20533c86bb\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/twig/twig/lib/Twig/Template.php\",\"line\":363,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, \\\"SORT_REGULAR\\\" => 0, ...], [\\\"main\\\" => [__TwigTemplate_4923081c982fda9f0407dc7e08b020ddf67ed39769fed5f38c8c2fea566f3faa, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_9d8be5146c8fe45cee25c62324ae2393125c735a1c57994826872e20533c86bb\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, \\\"SORT_REGULAR\\\" => 0, ...], [\\\"main\\\" => [__TwigTemplate_4923081c982fda9f0407dc7e08b020ddf67ed39769fed5f38c8c2fea566f3faa, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_9d8be5146c8fe45cee25c62324ae2393125c735a1c57994826872e20533c86bb\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/storage/runtime/compiled_templates/58/58fb65bd6899873fa5f18ec1a64457bd2b0f4c79ed6b49adf7520bbf61ca9fa8.php\",\"line\":28,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, \\\"SORT_REGULAR\\\" => 0, ...], [\\\"main\\\" => [__TwigTemplate_4923081c982fda9f0407dc7e08b020ddf67ed39769fed5f38c8c2fea566f3faa, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_4923081c982fda9f0407dc7e08b020ddf67ed39769fed5f38c8c2fea566f3faa\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/twig/twig/lib/Twig/Template.php\",\"line\":386,\"class\":\"__TwigTemplate_4923081c982fda9f0407dc7e08b020ddf67ed39769fed5f38c8c2fea566f3faa\",\"method\":\"doDisplay\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, \\\"SORT_REGULAR\\\" => 0, ...], [\\\"main\\\" => [__TwigTemplate_4923081c982fda9f0407dc7e08b020ddf67ed39769fed5f38c8c2fea566f3faa, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_4923081c982fda9f0407dc7e08b020ddf67ed39769fed5f38c8c2fea566f3faa\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, \\\"SORT_REGULAR\\\" => 0, ...], [\\\"main\\\" => [__TwigTemplate_4923081c982fda9f0407dc7e08b020ddf67ed39769fed5f38c8c2fea566f3faa, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_4923081c982fda9f0407dc7e08b020ddf67ed39769fed5f38c8c2fea566f3faa\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/twig/twig/lib/Twig/Template.php\",\"line\":363,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, \\\"SORT_REGULAR\\\" => 0, ...], [\\\"main\\\" => [__TwigTemplate_4923081c982fda9f0407dc7e08b020ddf67ed39769fed5f38c8c2fea566f3faa, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_4923081c982fda9f0407dc7e08b020ddf67ed39769fed5f38c8c2fea566f3faa\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[], []\"},{\"objectClass\":\"__TwigTemplate_4923081c982fda9f0407dc7e08b020ddf67ed39769fed5f38c8c2fea566f3faa\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/twig/twig/lib/Twig/Template.php\",\"line\":371,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[]\"},{\"objectClass\":\"__TwigTemplate_4923081c982fda9f0407dc7e08b020ddf67ed39769fed5f38c8c2fea566f3faa\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/twig/twig/lib/Twig/Environment.php\",\"line\":289,\"class\":\"Twig_Template\",\"method\":\"render\",\"args\":\"[]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/View.php\",\"line\":337,\"class\":\"Twig_Environment\",\"method\":\"render\",\"args\":\"\\\"\\\", []\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/View.php\",\"line\":384,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"\\\", []\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/Controller.php\",\"line\":161,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"\\\", []\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":78,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"\\\", []\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"\\\", []\"},{\"objectClass\":null,\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"\\\", []]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/Controller.php\",\"line\":109,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/Application.php\",\"line\":297,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/Application.php\",\"line\":286,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2019-03-06 06:27:54','2019-03-06 06:27:54','76d5d9f8-1eb9-4b57-8845-0b74499b0c6a'),
	(19,'ElementQuery::getIterator()','/Users/davina/Developer/proj-comphanny-cms/templates/products/index.twig:32','2019-03-06 06:24:33','/Users/davina/Developer/proj-comphanny-cms/templates/products/index.twig',32,'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":464,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\CategoryQuery\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/storage/runtime/compiled_templates/75/75bf8952e4d3b630d25edc2111cb64070fffc48d66e2c44f21682cd70d66c503.php\",\"line\":90,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_7c3e916a27e52a50e750f1f6e162000b0cc56838f5e908685847bee6514dd1fd\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/twig/twig/lib/Twig/Template.php\",\"line\":189,\"class\":\"__TwigTemplate_7c3e916a27e52a50e750f1f6e162000b0cc56838f5e908685847bee6514dd1fd\",\"method\":\"block_main\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"main\\\" => [__TwigTemplate_7c3e916a27e52a50e750f1f6e162000b0cc56838f5e908685847bee6514dd1fd, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_9d8be5146c8fe45cee25c62324ae2393125c735a1c57994826872e20533c86bb\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/storage/runtime/compiled_templates/ff/ff811b6f13dee6c971268c9e684406b05e094a098b4cddc9660ab82a080202d9.php\",\"line\":115,\"class\":\"Twig_Template\",\"method\":\"displayBlock\",\"args\":\"\\\"main\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"main\\\" => [__TwigTemplate_7c3e916a27e52a50e750f1f6e162000b0cc56838f5e908685847bee6514dd1fd, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_9d8be5146c8fe45cee25c62324ae2393125c735a1c57994826872e20533c86bb\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/twig/twig/lib/Twig/Template.php\",\"line\":386,\"class\":\"__TwigTemplate_9d8be5146c8fe45cee25c62324ae2393125c735a1c57994826872e20533c86bb\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"main\\\" => [__TwigTemplate_7c3e916a27e52a50e750f1f6e162000b0cc56838f5e908685847bee6514dd1fd, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_9d8be5146c8fe45cee25c62324ae2393125c735a1c57994826872e20533c86bb\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"main\\\" => [__TwigTemplate_7c3e916a27e52a50e750f1f6e162000b0cc56838f5e908685847bee6514dd1fd, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_9d8be5146c8fe45cee25c62324ae2393125c735a1c57994826872e20533c86bb\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/twig/twig/lib/Twig/Template.php\",\"line\":363,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"main\\\" => [__TwigTemplate_7c3e916a27e52a50e750f1f6e162000b0cc56838f5e908685847bee6514dd1fd, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_9d8be5146c8fe45cee25c62324ae2393125c735a1c57994826872e20533c86bb\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"main\\\" => [__TwigTemplate_7c3e916a27e52a50e750f1f6e162000b0cc56838f5e908685847bee6514dd1fd, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_9d8be5146c8fe45cee25c62324ae2393125c735a1c57994826872e20533c86bb\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/storage/runtime/compiled_templates/75/75bf8952e4d3b630d25edc2111cb64070fffc48d66e2c44f21682cd70d66c503.php\",\"line\":28,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"main\\\" => [__TwigTemplate_7c3e916a27e52a50e750f1f6e162000b0cc56838f5e908685847bee6514dd1fd, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_7c3e916a27e52a50e750f1f6e162000b0cc56838f5e908685847bee6514dd1fd\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/twig/twig/lib/Twig/Template.php\",\"line\":386,\"class\":\"__TwigTemplate_7c3e916a27e52a50e750f1f6e162000b0cc56838f5e908685847bee6514dd1fd\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"main\\\" => [__TwigTemplate_7c3e916a27e52a50e750f1f6e162000b0cc56838f5e908685847bee6514dd1fd, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_7c3e916a27e52a50e750f1f6e162000b0cc56838f5e908685847bee6514dd1fd\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"main\\\" => [__TwigTemplate_7c3e916a27e52a50e750f1f6e162000b0cc56838f5e908685847bee6514dd1fd, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_7c3e916a27e52a50e750f1f6e162000b0cc56838f5e908685847bee6514dd1fd\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/twig/twig/lib/Twig/Template.php\",\"line\":363,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"main\\\" => [__TwigTemplate_7c3e916a27e52a50e750f1f6e162000b0cc56838f5e908685847bee6514dd1fd, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_7c3e916a27e52a50e750f1f6e162000b0cc56838f5e908685847bee6514dd1fd\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"__TwigTemplate_7c3e916a27e52a50e750f1f6e162000b0cc56838f5e908685847bee6514dd1fd\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/twig/twig/lib/Twig/Template.php\",\"line\":371,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_7c3e916a27e52a50e750f1f6e162000b0cc56838f5e908685847bee6514dd1fd\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/twig/twig/lib/Twig/Environment.php\",\"line\":289,\"class\":\"Twig_Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/View.php\",\"line\":337,\"class\":\"Twig_Environment\",\"method\":\"render\",\"args\":\"\\\"products/index.twig\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/View.php\",\"line\":384,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"products/index.twig\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/Controller.php\",\"line\":161,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"products/index.twig\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":78,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"products/index.twig\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"products/index.twig\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"products/index.twig\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"products/index.twig\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"products\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/Controller.php\",\"line\":109,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"products/index.twig\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"products\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"products/index.twig\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"products\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/Application.php\",\"line\":297,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"products/index.twig\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"products\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"products/index.twig\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"products\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/Application.php\",\"line\":286,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2019-03-06 06:24:33','2019-03-06 06:24:33','a5dc9d57-03cb-4a1c-83de-4072983b71de'),
	(20,'ElementQuery::getIterator()','/Users/davina/Developer/proj-comphanny-cms/templates/products/_entry.twig:21','2019-03-06 06:24:26','/Users/davina/Developer/proj-comphanny-cms/templates/products/_entry.twig',21,'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":464,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\CategoryQuery\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/storage/runtime/compiled_templates/02/0220b29797f7c0bb8f9556ab29dae3c13bbe7f04dfc7819497055cae77212f61.php\",\"line\":71,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_dab64d0e3732d218af2c15def7eca51021b0abb66569aa6ae942a887ec49bab6\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/twig/twig/lib/Twig/Template.php\",\"line\":189,\"class\":\"__TwigTemplate_dab64d0e3732d218af2c15def7eca51021b0abb66569aa6ae942a887ec49bab6\",\"method\":\"block_main\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"main\\\" => [__TwigTemplate_dab64d0e3732d218af2c15def7eca51021b0abb66569aa6ae942a887ec49bab6, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_9d8be5146c8fe45cee25c62324ae2393125c735a1c57994826872e20533c86bb\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/storage/runtime/compiled_templates/ff/ff811b6f13dee6c971268c9e684406b05e094a098b4cddc9660ab82a080202d9.php\",\"line\":115,\"class\":\"Twig_Template\",\"method\":\"displayBlock\",\"args\":\"\\\"main\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"main\\\" => [__TwigTemplate_dab64d0e3732d218af2c15def7eca51021b0abb66569aa6ae942a887ec49bab6, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_9d8be5146c8fe45cee25c62324ae2393125c735a1c57994826872e20533c86bb\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/twig/twig/lib/Twig/Template.php\",\"line\":386,\"class\":\"__TwigTemplate_9d8be5146c8fe45cee25c62324ae2393125c735a1c57994826872e20533c86bb\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"main\\\" => [__TwigTemplate_dab64d0e3732d218af2c15def7eca51021b0abb66569aa6ae942a887ec49bab6, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_9d8be5146c8fe45cee25c62324ae2393125c735a1c57994826872e20533c86bb\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"main\\\" => [__TwigTemplate_dab64d0e3732d218af2c15def7eca51021b0abb66569aa6ae942a887ec49bab6, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_9d8be5146c8fe45cee25c62324ae2393125c735a1c57994826872e20533c86bb\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/twig/twig/lib/Twig/Template.php\",\"line\":363,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"main\\\" => [__TwigTemplate_dab64d0e3732d218af2c15def7eca51021b0abb66569aa6ae942a887ec49bab6, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_9d8be5146c8fe45cee25c62324ae2393125c735a1c57994826872e20533c86bb\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"main\\\" => [__TwigTemplate_dab64d0e3732d218af2c15def7eca51021b0abb66569aa6ae942a887ec49bab6, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_9d8be5146c8fe45cee25c62324ae2393125c735a1c57994826872e20533c86bb\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/storage/runtime/compiled_templates/02/0220b29797f7c0bb8f9556ab29dae3c13bbe7f04dfc7819497055cae77212f61.php\",\"line\":28,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"main\\\" => [__TwigTemplate_dab64d0e3732d218af2c15def7eca51021b0abb66569aa6ae942a887ec49bab6, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_dab64d0e3732d218af2c15def7eca51021b0abb66569aa6ae942a887ec49bab6\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/twig/twig/lib/Twig/Template.php\",\"line\":386,\"class\":\"__TwigTemplate_dab64d0e3732d218af2c15def7eca51021b0abb66569aa6ae942a887ec49bab6\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"main\\\" => [__TwigTemplate_dab64d0e3732d218af2c15def7eca51021b0abb66569aa6ae942a887ec49bab6, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_dab64d0e3732d218af2c15def7eca51021b0abb66569aa6ae942a887ec49bab6\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"main\\\" => [__TwigTemplate_dab64d0e3732d218af2c15def7eca51021b0abb66569aa6ae942a887ec49bab6, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_dab64d0e3732d218af2c15def7eca51021b0abb66569aa6ae942a887ec49bab6\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/twig/twig/lib/Twig/Template.php\",\"line\":363,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"main\\\" => [__TwigTemplate_dab64d0e3732d218af2c15def7eca51021b0abb66569aa6ae942a887ec49bab6, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_dab64d0e3732d218af2c15def7eca51021b0abb66569aa6ae942a887ec49bab6\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"__TwigTemplate_dab64d0e3732d218af2c15def7eca51021b0abb66569aa6ae942a887ec49bab6\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/twig/twig/lib/Twig/Template.php\",\"line\":371,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_dab64d0e3732d218af2c15def7eca51021b0abb66569aa6ae942a887ec49bab6\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/twig/twig/lib/Twig/Environment.php\",\"line\":289,\"class\":\"Twig_Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/View.php\",\"line\":337,\"class\":\"Twig_Environment\",\"method\":\"render\",\"args\":\"\\\"products/_entry.twig\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/View.php\",\"line\":384,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"products/_entry.twig\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/Controller.php\",\"line\":161,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"products/_entry.twig\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":78,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"products/_entry.twig\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"products/_entry.twig\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"products/_entry.twig\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"products/_entry.twig\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"products/sample-product-entry-1\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/Controller.php\",\"line\":109,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"products/_entry.twig\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"products/sample-product-entry-1\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"products/_entry.twig\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"products/sample-product-entry-1\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/Application.php\",\"line\":297,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"products/_entry.twig\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"products/sample-product-entry-1\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"products/_entry.twig\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"products/sample-product-entry-1\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/Application.php\",\"line\":286,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2019-03-06 06:24:26','2019-03-06 06:24:26','4e6812b4-f8fd-431f-a134-de5921f306a6'),
	(21,'ElementQuery::getIterator()','/Users/davina/Developer/proj-comphanny-cms/templates/products/_entry.twig:47','2019-03-04 12:32:32','/Users/davina/Developer/proj-comphanny-cms/templates/products/_entry.twig',47,'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":464,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/storage/runtime/compiled_templates/1e/1e8f3e36fb5ac4e2b6cff0a3f1906dd0abab5c3f5b7d84e9841ffd1799375ff5.php\",\"line\":138,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_f1e41c37e9e08ceb8d60ad87e58a6d9e480a11598e2ae6a416fc370a39e50557\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/twig/twig/lib/Twig/Template.php\",\"line\":189,\"class\":\"__TwigTemplate_f1e41c37e9e08ceb8d60ad87e58a6d9e480a11598e2ae6a416fc370a39e50557\",\"method\":\"block_main\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"main\\\" => [__TwigTemplate_f1e41c37e9e08ceb8d60ad87e58a6d9e480a11598e2ae6a416fc370a39e50557, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_74ceb8b66cba5e837bc121c986351f8c44ac2b2805448521949caa43641e7776\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/storage/runtime/compiled_templates/35/35921e1b69f6824f499a88022802dac500842161257b46f47822eb1372cdf0d9.php\",\"line\":118,\"class\":\"Twig_Template\",\"method\":\"displayBlock\",\"args\":\"\\\"main\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"main\\\" => [__TwigTemplate_f1e41c37e9e08ceb8d60ad87e58a6d9e480a11598e2ae6a416fc370a39e50557, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_74ceb8b66cba5e837bc121c986351f8c44ac2b2805448521949caa43641e7776\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/twig/twig/lib/Twig/Template.php\",\"line\":386,\"class\":\"__TwigTemplate_74ceb8b66cba5e837bc121c986351f8c44ac2b2805448521949caa43641e7776\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"main\\\" => [__TwigTemplate_f1e41c37e9e08ceb8d60ad87e58a6d9e480a11598e2ae6a416fc370a39e50557, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_74ceb8b66cba5e837bc121c986351f8c44ac2b2805448521949caa43641e7776\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"main\\\" => [__TwigTemplate_f1e41c37e9e08ceb8d60ad87e58a6d9e480a11598e2ae6a416fc370a39e50557, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_74ceb8b66cba5e837bc121c986351f8c44ac2b2805448521949caa43641e7776\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/twig/twig/lib/Twig/Template.php\",\"line\":363,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"main\\\" => [__TwigTemplate_f1e41c37e9e08ceb8d60ad87e58a6d9e480a11598e2ae6a416fc370a39e50557, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_74ceb8b66cba5e837bc121c986351f8c44ac2b2805448521949caa43641e7776\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"main\\\" => [__TwigTemplate_f1e41c37e9e08ceb8d60ad87e58a6d9e480a11598e2ae6a416fc370a39e50557, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_74ceb8b66cba5e837bc121c986351f8c44ac2b2805448521949caa43641e7776\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/storage/runtime/compiled_templates/1e/1e8f3e36fb5ac4e2b6cff0a3f1906dd0abab5c3f5b7d84e9841ffd1799375ff5.php\",\"line\":28,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"main\\\" => [__TwigTemplate_f1e41c37e9e08ceb8d60ad87e58a6d9e480a11598e2ae6a416fc370a39e50557, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_f1e41c37e9e08ceb8d60ad87e58a6d9e480a11598e2ae6a416fc370a39e50557\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/twig/twig/lib/Twig/Template.php\",\"line\":386,\"class\":\"__TwigTemplate_f1e41c37e9e08ceb8d60ad87e58a6d9e480a11598e2ae6a416fc370a39e50557\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"main\\\" => [__TwigTemplate_f1e41c37e9e08ceb8d60ad87e58a6d9e480a11598e2ae6a416fc370a39e50557, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_f1e41c37e9e08ceb8d60ad87e58a6d9e480a11598e2ae6a416fc370a39e50557\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"main\\\" => [__TwigTemplate_f1e41c37e9e08ceb8d60ad87e58a6d9e480a11598e2ae6a416fc370a39e50557, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_f1e41c37e9e08ceb8d60ad87e58a6d9e480a11598e2ae6a416fc370a39e50557\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/twig/twig/lib/Twig/Template.php\",\"line\":363,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"main\\\" => [__TwigTemplate_f1e41c37e9e08ceb8d60ad87e58a6d9e480a11598e2ae6a416fc370a39e50557, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_f1e41c37e9e08ceb8d60ad87e58a6d9e480a11598e2ae6a416fc370a39e50557\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"__TwigTemplate_f1e41c37e9e08ceb8d60ad87e58a6d9e480a11598e2ae6a416fc370a39e50557\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/twig/twig/lib/Twig/Template.php\",\"line\":371,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_f1e41c37e9e08ceb8d60ad87e58a6d9e480a11598e2ae6a416fc370a39e50557\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/twig/twig/lib/Twig/Environment.php\",\"line\":289,\"class\":\"Twig_Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/View.php\",\"line\":337,\"class\":\"Twig_Environment\",\"method\":\"render\",\"args\":\"\\\"products/_entry.twig\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/View.php\",\"line\":384,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"products/_entry.twig\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/Controller.php\",\"line\":161,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"products/_entry.twig\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":78,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"products/_entry.twig\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"products/_entry.twig\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"products/_entry.twig\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"products/_entry.twig\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/Controller.php\",\"line\":109,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"products/_entry.twig\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"products/_entry.twig\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/Application.php\",\"line\":297,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"products/_entry.twig\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"products/_entry.twig\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/Application.php\",\"line\":286,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null},{\"objectClass\":null,\"file\":\"/Users/davina/.composer/vendor/laravel/valet/server.php\",\"line\":158,\"class\":null,\"method\":\"require\",\"args\":\"\\\"/Users/davina/Developer/proj-comphanny-cms/web/index.php\\\"\"}]','2019-03-04 12:32:32','2019-03-04 12:32:32','45662fb7-2b89-42f9-b01b-382dafbe3d48'),
	(41,'ElementQuery::getIterator()','/Users/davina/Developer/proj-comphanny-cms/templates/products/_entry.twig:49','2019-03-06 06:24:26','/Users/davina/Developer/proj-comphanny-cms/templates/products/_entry.twig',49,'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":464,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/storage/runtime/compiled_templates/02/0220b29797f7c0bb8f9556ab29dae3c13bbe7f04dfc7819497055cae77212f61.php\",\"line\":143,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_dab64d0e3732d218af2c15def7eca51021b0abb66569aa6ae942a887ec49bab6\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/twig/twig/lib/Twig/Template.php\",\"line\":189,\"class\":\"__TwigTemplate_dab64d0e3732d218af2c15def7eca51021b0abb66569aa6ae942a887ec49bab6\",\"method\":\"block_main\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"main\\\" => [__TwigTemplate_dab64d0e3732d218af2c15def7eca51021b0abb66569aa6ae942a887ec49bab6, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_9d8be5146c8fe45cee25c62324ae2393125c735a1c57994826872e20533c86bb\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/storage/runtime/compiled_templates/ff/ff811b6f13dee6c971268c9e684406b05e094a098b4cddc9660ab82a080202d9.php\",\"line\":115,\"class\":\"Twig_Template\",\"method\":\"displayBlock\",\"args\":\"\\\"main\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"main\\\" => [__TwigTemplate_dab64d0e3732d218af2c15def7eca51021b0abb66569aa6ae942a887ec49bab6, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_9d8be5146c8fe45cee25c62324ae2393125c735a1c57994826872e20533c86bb\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/twig/twig/lib/Twig/Template.php\",\"line\":386,\"class\":\"__TwigTemplate_9d8be5146c8fe45cee25c62324ae2393125c735a1c57994826872e20533c86bb\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"main\\\" => [__TwigTemplate_dab64d0e3732d218af2c15def7eca51021b0abb66569aa6ae942a887ec49bab6, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_9d8be5146c8fe45cee25c62324ae2393125c735a1c57994826872e20533c86bb\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"main\\\" => [__TwigTemplate_dab64d0e3732d218af2c15def7eca51021b0abb66569aa6ae942a887ec49bab6, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_9d8be5146c8fe45cee25c62324ae2393125c735a1c57994826872e20533c86bb\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/twig/twig/lib/Twig/Template.php\",\"line\":363,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"main\\\" => [__TwigTemplate_dab64d0e3732d218af2c15def7eca51021b0abb66569aa6ae942a887ec49bab6, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_9d8be5146c8fe45cee25c62324ae2393125c735a1c57994826872e20533c86bb\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"main\\\" => [__TwigTemplate_dab64d0e3732d218af2c15def7eca51021b0abb66569aa6ae942a887ec49bab6, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_9d8be5146c8fe45cee25c62324ae2393125c735a1c57994826872e20533c86bb\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/storage/runtime/compiled_templates/02/0220b29797f7c0bb8f9556ab29dae3c13bbe7f04dfc7819497055cae77212f61.php\",\"line\":28,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"main\\\" => [__TwigTemplate_dab64d0e3732d218af2c15def7eca51021b0abb66569aa6ae942a887ec49bab6, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_dab64d0e3732d218af2c15def7eca51021b0abb66569aa6ae942a887ec49bab6\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/twig/twig/lib/Twig/Template.php\",\"line\":386,\"class\":\"__TwigTemplate_dab64d0e3732d218af2c15def7eca51021b0abb66569aa6ae942a887ec49bab6\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"main\\\" => [__TwigTemplate_dab64d0e3732d218af2c15def7eca51021b0abb66569aa6ae942a887ec49bab6, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_dab64d0e3732d218af2c15def7eca51021b0abb66569aa6ae942a887ec49bab6\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"main\\\" => [__TwigTemplate_dab64d0e3732d218af2c15def7eca51021b0abb66569aa6ae942a887ec49bab6, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_dab64d0e3732d218af2c15def7eca51021b0abb66569aa6ae942a887ec49bab6\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/twig/twig/lib/Twig/Template.php\",\"line\":363,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"main\\\" => [__TwigTemplate_dab64d0e3732d218af2c15def7eca51021b0abb66569aa6ae942a887ec49bab6, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_dab64d0e3732d218af2c15def7eca51021b0abb66569aa6ae942a887ec49bab6\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"__TwigTemplate_dab64d0e3732d218af2c15def7eca51021b0abb66569aa6ae942a887ec49bab6\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/twig/twig/lib/Twig/Template.php\",\"line\":371,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_dab64d0e3732d218af2c15def7eca51021b0abb66569aa6ae942a887ec49bab6\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/twig/twig/lib/Twig/Environment.php\",\"line\":289,\"class\":\"Twig_Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/View.php\",\"line\":337,\"class\":\"Twig_Environment\",\"method\":\"render\",\"args\":\"\\\"products/_entry.twig\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/View.php\",\"line\":384,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"products/_entry.twig\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/Controller.php\",\"line\":161,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"products/_entry.twig\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":78,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"products/_entry.twig\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"products/_entry.twig\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"products/_entry.twig\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"products/_entry.twig\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"products/sample-product-entry-1\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/Controller.php\",\"line\":109,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"products/_entry.twig\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"products/sample-product-entry-1\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"products/_entry.twig\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"products/sample-product-entry-1\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/Application.php\",\"line\":297,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"products/_entry.twig\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"products/sample-product-entry-1\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"products/_entry.twig\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"products/sample-product-entry-1\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/craftcms/cms/src/web/Application.php\",\"line\":286,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/davina/Developer/proj-comphanny-cms/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2019-03-06 06:24:26','2019-03-06 06:24:26','7e061c42-a65d-4f3d-a6a5-0ae530e17d0a');

/*!40000 ALTER TABLE `cphy_deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cphy_elementindexsettings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_elementindexsettings`;

CREATE TABLE `cphy_elementindexsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cphy_elementindexsettings_type_unq_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table cphy_elements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_elements`;

CREATE TABLE `cphy_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cphy_elements_dateDeleted_idx` (`dateDeleted`),
  KEY `cphy_elements_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `cphy_elements_type_idx` (`type`),
  KEY `cphy_elements_enabled_idx` (`enabled`),
  KEY `cphy_elements_archived_dateCreated_idx` (`archived`,`dateCreated`),
  CONSTRAINT `cphy_elements_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `cphy_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cphy_elements` WRITE;
/*!40000 ALTER TABLE `cphy_elements` DISABLE KEYS */;

INSERT INTO `cphy_elements` (`id`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,NULL,'craft\\elements\\User',1,0,'2019-03-03 09:27:20','2019-03-06 06:29:59',NULL,'22ad533a-0397-422a-a4b9-9ab730357046'),
	(2,4,'craft\\elements\\Entry',1,0,'2019-03-03 10:07:54','2019-03-03 15:11:34',NULL,'88670b57-e213-4776-a0c0-0a6783c92808'),
	(3,NULL,'craft\\elements\\Entry',1,0,'2019-03-03 10:11:22','2019-03-03 10:12:17','2019-03-03 10:12:17','737552d5-a205-4869-bdd3-7c87e22d91e5'),
	(4,NULL,'craft\\elements\\Entry',1,0,'2019-03-03 10:18:45','2019-03-03 12:16:59',NULL,'82bf6ced-775f-4134-bccb-886e45e6d6d2'),
	(5,2,'craft\\elements\\Entry',1,0,'2019-03-03 12:29:21','2019-03-03 13:22:43',NULL,'1bf51f09-de00-4876-854e-ab29b80d4db3'),
	(6,NULL,'craft\\elements\\Asset',1,0,'2019-03-03 12:45:31','2019-03-03 12:45:31',NULL,'f4b2914b-3e4f-4e2a-8515-e6f77467a9ef'),
	(7,NULL,'craft\\elements\\Asset',1,0,'2019-03-03 13:53:04','2019-03-03 13:53:04',NULL,'296884b0-bc4e-4fd6-a992-44864f4d81d8'),
	(8,3,'craft\\elements\\Entry',1,0,'2019-03-03 13:53:12','2019-03-03 14:49:40',NULL,'c66d9125-c69f-4178-acac-73886c733ed3'),
	(9,NULL,'craft\\elements\\Asset',1,0,'2019-03-03 13:53:54','2019-03-03 13:53:54',NULL,'6778752a-6517-4fd9-8175-d838eea2b0cd'),
	(10,3,'craft\\elements\\Entry',1,0,'2019-03-03 13:56:52','2019-03-03 14:49:40',NULL,'2ac6cdc0-a1e6-4eb0-b33f-b97c1dbcb8d3'),
	(11,3,'craft\\elements\\Entry',1,0,'2019-03-03 13:57:12','2019-03-03 13:57:12','2019-03-03 13:57:22','3c605ad4-37b6-4332-ab50-83711bf65605'),
	(12,3,'craft\\elements\\Entry',1,0,'2019-03-03 13:57:27','2019-03-03 14:49:40',NULL,'93c0bf9c-d752-4f6e-a72b-b06186dfca7a'),
	(13,NULL,'craft\\elements\\Asset',1,0,'2019-03-03 13:57:53','2019-03-03 13:57:53',NULL,'8e4d6a65-7735-433b-8435-4b36caa7ed61'),
	(14,5,'craft\\elements\\Entry',1,0,'2019-03-03 15:15:18','2019-03-03 15:27:23',NULL,'711343b9-14a5-44be-86dc-593f8001c11d'),
	(15,NULL,'craft\\elements\\Asset',1,0,'2019-03-03 15:59:42','2019-03-03 15:59:42',NULL,'b21cf48e-9955-4307-85c0-775a16733a0d'),
	(16,NULL,'craft\\elements\\Asset',1,0,'2019-03-03 16:11:13','2019-03-03 16:11:13',NULL,'bec177b7-6dc6-4716-bce2-b04923e1818e'),
	(17,NULL,'craft\\elements\\Asset',1,0,'2019-03-03 16:14:22','2019-03-03 16:14:22',NULL,'01a4b799-da51-408e-a8dc-ceb3d3f85a37'),
	(18,NULL,'craft\\elements\\Asset',1,0,'2019-03-03 16:16:54','2019-03-03 16:16:54',NULL,'f73c2116-f41c-4c06-8b9c-d28f3e9c54e7'),
	(19,10,'craft\\elements\\Entry',1,0,'2019-03-03 16:17:03','2019-03-04 12:32:19',NULL,'5a1e9c91-5de9-47a7-9c81-3f9582fb9996'),
	(20,6,'craft\\elements\\MatrixBlock',1,0,'2019-03-03 16:17:03','2019-03-04 12:32:19',NULL,'ef2af5bf-679c-485d-935e-f504646cf404'),
	(21,7,'craft\\elements\\MatrixBlock',1,0,'2019-03-03 16:17:03','2019-03-04 12:32:19',NULL,'c7c893d6-acae-48b6-8682-1cf720ce6f0d'),
	(22,8,'craft\\elements\\MatrixBlock',1,0,'2019-03-03 16:17:03','2019-03-04 12:32:19',NULL,'dbde1920-5f45-4116-924e-72c4892f4dee'),
	(23,7,'craft\\elements\\MatrixBlock',1,0,'2019-03-03 16:17:03','2019-03-04 12:32:19',NULL,'64d6a14d-46a9-427d-b686-3a0ac71ba2c9'),
	(24,9,'craft\\elements\\MatrixBlock',1,0,'2019-03-03 16:17:03','2019-03-04 12:32:19',NULL,'c6850b26-54c1-4a24-8526-40c2a731925a'),
	(25,11,'craft\\elements\\Category',1,0,'2019-03-03 17:31:53','2019-03-03 17:35:00',NULL,'fa3be1ca-090c-40ea-bd83-04c216b39afb'),
	(26,11,'craft\\elements\\Category',1,0,'2019-03-03 17:32:15','2019-03-03 17:34:49',NULL,'20fd2d5a-e3fc-4e9d-9a07-34913a53e581'),
	(27,11,'craft\\elements\\Category',1,0,'2019-03-03 17:32:38','2019-03-03 17:35:10',NULL,'f9ea7d7d-2b38-4e31-a5f6-202aff8a5cb8'),
	(28,11,'craft\\elements\\Category',1,0,'2019-03-03 17:33:02','2019-03-03 17:35:20',NULL,'80b5323b-d583-45ac-8d91-95dc80de3f2b'),
	(29,10,'craft\\elements\\Entry',1,0,'2019-03-03 17:56:13','2019-03-04 12:32:28',NULL,'734c8a55-a2a0-4a14-91d7-9383229b8b6a'),
	(30,6,'craft\\elements\\MatrixBlock',1,0,'2019-03-03 17:56:13','2019-03-04 12:32:28',NULL,'531d132f-37d3-4a65-a28b-4d138a2b3c96'),
	(31,7,'craft\\elements\\MatrixBlock',1,0,'2019-03-03 17:56:13','2019-03-04 12:32:28',NULL,'56e5dd35-3936-4df5-88a6-1a37b7ec9090'),
	(32,8,'craft\\elements\\MatrixBlock',1,0,'2019-03-03 17:56:13','2019-03-04 12:32:28',NULL,'82a42ace-00a4-41f6-9c05-b68bc7aed917'),
	(33,7,'craft\\elements\\MatrixBlock',1,0,'2019-03-03 17:56:13','2019-03-04 12:32:28',NULL,'f02153ee-eb18-4b7a-b7dd-3e8842051a99'),
	(34,9,'craft\\elements\\MatrixBlock',1,0,'2019-03-03 17:56:13','2019-03-04 12:32:28',NULL,'d4204c7d-0088-4257-b887-8594af6b4a59'),
	(35,10,'craft\\elements\\Entry',1,0,'2019-03-03 17:56:45','2019-03-04 12:32:19',NULL,'70dca31a-7c26-4e53-9f4a-552b10775ebb'),
	(36,6,'craft\\elements\\MatrixBlock',1,0,'2019-03-03 17:56:46','2019-03-04 12:32:19',NULL,'d09824fc-63da-4e19-a9e3-a64e144ebffa'),
	(37,7,'craft\\elements\\MatrixBlock',1,0,'2019-03-03 17:56:46','2019-03-04 12:32:19',NULL,'cca1d59d-66a3-47f9-a1e7-2dd41239c3ea'),
	(38,8,'craft\\elements\\MatrixBlock',1,0,'2019-03-03 17:56:46','2019-03-04 12:32:19',NULL,'2cb2199a-f526-4371-921b-4b4edcdd0e59'),
	(39,7,'craft\\elements\\MatrixBlock',1,0,'2019-03-03 17:56:46','2019-03-04 12:32:19',NULL,'940d6cf0-43b9-40eb-9680-15d7481993d1'),
	(40,9,'craft\\elements\\MatrixBlock',1,0,'2019-03-03 17:56:46','2019-03-04 12:32:19',NULL,'17eb0d6d-5472-4db3-a416-236d979862e6');

/*!40000 ALTER TABLE `cphy_elements` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cphy_elements_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_elements_sites`;

CREATE TABLE `cphy_elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cphy_elements_sites_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `cphy_elements_sites_siteId_idx` (`siteId`),
  KEY `cphy_elements_sites_slug_siteId_idx` (`slug`,`siteId`),
  KEY `cphy_elements_sites_enabled_idx` (`enabled`),
  KEY `cphy_elements_sites_uri_siteId_idx` (`uri`,`siteId`),
  CONSTRAINT `cphy_elements_sites_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `cphy_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cphy_elements_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `cphy_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cphy_elements_sites` WRITE;
/*!40000 ALTER TABLE `cphy_elements_sites` DISABLE KEYS */;

INSERT INTO `cphy_elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,1,NULL,NULL,1,'2019-03-03 09:27:20','2019-03-06 06:29:59','1e157ec7-a54a-402f-a245-1e4d7a1699fc'),
	(2,2,1,'home','',1,'2019-03-03 10:07:54','2019-03-03 15:11:34','af7e8a0e-62c1-4875-8f08-981e3bca2f06'),
	(3,3,1,'products','products',1,'2019-03-03 10:11:22','2019-03-03 10:12:17','172e117a-2ec7-48ef-8aed-47202a3b4a16'),
	(4,4,1,'contact','contact',1,'2019-03-03 10:18:45','2019-03-03 12:16:59','5a095191-e5d6-4ebb-a7ea-66d4861aa0f2'),
	(5,5,1,'about','about',1,'2019-03-03 12:29:21','2019-03-03 13:22:43','3d724071-b580-4cb9-912f-8a40f9a5bdfe'),
	(6,6,1,NULL,NULL,1,'2019-03-03 12:45:31','2019-03-03 12:45:31','a571857f-bfef-4c5a-9491-134a6a77393f'),
	(7,7,1,NULL,NULL,1,'2019-03-03 13:53:04','2019-03-03 13:53:04','0d695b42-95a8-482f-9c0a-0e0b89f4daeb'),
	(8,8,1,'mr-patriarch-sr','company/mr-patriarch-sr',1,'2019-03-03 13:53:12','2019-03-03 14:49:40','f7d2b2d4-7015-420f-83eb-33bf3d125903'),
	(9,9,1,NULL,NULL,1,'2019-03-03 13:53:54','2019-03-03 13:53:54','119db419-a790-4309-9596-877d618da116'),
	(10,10,1,'phanpy-dev','company/phanpy-dev',1,'2019-03-03 13:56:52','2019-03-03 14:49:40','fa2c177a-e587-4c19-bdca-9e501a4df789'),
	(11,11,1,'mr-patriarch-sr','company/mr-patriarch-sr',1,'2019-03-03 13:57:12','2019-03-03 13:57:12','07d5fed3-5e65-488f-833d-455f14f212d6'),
	(12,12,1,'phanpy-design','company/phanpy-design',1,'2019-03-03 13:57:27','2019-03-03 14:49:40','8da19270-9b88-410e-ae72-2d17bc875b49'),
	(13,13,1,NULL,NULL,1,'2019-03-03 13:57:53','2019-03-03 13:57:53','c028670a-6651-4c3f-9cef-a6c2765608e7'),
	(14,14,1,'products','products',1,'2019-03-03 15:15:19','2019-03-03 15:27:23','325dc1e6-0729-4f4c-8885-a76145a4bd98'),
	(15,15,1,NULL,NULL,1,'2019-03-03 15:59:42','2019-03-03 15:59:42','f2cc9b8d-a130-4fc7-b3ce-2fe46c36a1f0'),
	(16,16,1,NULL,NULL,1,'2019-03-03 16:11:13','2019-03-03 16:11:13','4f90485f-fcc5-4754-b2f9-37d1936b3e46'),
	(17,17,1,NULL,NULL,1,'2019-03-03 16:14:22','2019-03-03 16:14:22','70e84275-3da5-48f9-a4ac-c483348556b5'),
	(18,18,1,NULL,NULL,1,'2019-03-03 16:16:54','2019-03-03 16:16:54','ebb2d24e-b750-4997-9894-6bc382ba6694'),
	(19,19,1,'sample-product-entry','products/sample-product-entry',1,'2019-03-03 16:17:03','2019-03-04 12:32:19','8809e182-8317-4162-b798-7aa03e6f1a8d'),
	(20,20,1,NULL,NULL,1,'2019-03-03 16:17:03','2019-03-04 12:32:19','81745477-0c79-48f4-b20c-c102b3d8e500'),
	(21,21,1,NULL,NULL,1,'2019-03-03 16:17:03','2019-03-04 12:32:19','634abb2e-1581-4973-9f86-6a7b8f7218ad'),
	(22,22,1,NULL,NULL,1,'2019-03-03 16:17:03','2019-03-04 12:32:19','5b7ffb14-f861-4867-8332-ed34e546d02e'),
	(23,23,1,NULL,NULL,1,'2019-03-03 16:17:03','2019-03-04 12:32:19','c05278ee-f37c-4cef-9ce8-bf36673ac130'),
	(24,24,1,NULL,NULL,1,'2019-03-03 16:17:03','2019-03-04 12:32:19','a78ad53d-bb68-4f05-8837-f683527b0c6a'),
	(25,25,1,'website','product-types/website',1,'2019-03-03 17:31:53','2019-03-03 17:35:00','c9acfb72-e151-423c-a63d-cb553bfe54d7'),
	(26,26,1,'web-app','product-types/web-app',1,'2019-03-03 17:32:15','2019-03-03 17:34:49','83d12d09-6ac7-47ff-b1b8-849ec48f58e0'),
	(27,27,1,'mobile-app','product-types/mobile-app',1,'2019-03-03 17:32:38','2019-03-03 17:35:10','e46b8194-ff13-4ae3-a83c-6cdf77a94492'),
	(28,28,1,'web-service','product-types/web-service',1,'2019-03-03 17:33:02','2019-03-03 17:35:20','3ce66f8a-4483-44aa-a018-34e2742f0bf6'),
	(29,29,1,'sample-product-entry-1','products/sample-product-entry-1',1,'2019-03-03 17:56:13','2019-03-04 12:32:28','1da05f02-bc25-4991-90f0-39cca4bcccc7'),
	(30,30,1,NULL,NULL,1,'2019-03-03 17:56:13','2019-03-04 12:32:28','f5e63480-6c16-42b3-aeb3-1e77f0531a53'),
	(31,31,1,NULL,NULL,1,'2019-03-03 17:56:13','2019-03-04 12:32:28','3e8f1adc-8e01-470f-85db-7f629f699337'),
	(32,32,1,NULL,NULL,1,'2019-03-03 17:56:13','2019-03-04 12:32:28','a8526305-d31b-4841-943b-a17fb3198c4b'),
	(33,33,1,NULL,NULL,1,'2019-03-03 17:56:13','2019-03-04 12:32:28','2033e88a-ffbd-4297-93b6-b710264fae9c'),
	(34,34,1,NULL,NULL,1,'2019-03-03 17:56:13','2019-03-04 12:32:28','cd351fff-73f1-4da3-9f2f-29810152b9de'),
	(35,35,1,'sample-product-entry-1-1','products/sample-product-entry-1-1',1,'2019-03-03 17:56:45','2019-03-04 12:32:19','dec134ee-b798-4c61-b1b1-915efe26b04c'),
	(36,36,1,NULL,NULL,1,'2019-03-03 17:56:46','2019-03-04 12:32:19','b56f4e2e-f34c-428a-a977-9bfd9e6a2e04'),
	(37,37,1,NULL,NULL,1,'2019-03-03 17:56:46','2019-03-04 12:32:19','5776b94b-d774-4bdb-ad9c-45725c3578fb'),
	(38,38,1,NULL,NULL,1,'2019-03-03 17:56:46','2019-03-04 12:32:19','69772139-e1f6-4299-86e2-fffe344d9185'),
	(39,39,1,NULL,NULL,1,'2019-03-03 17:56:46','2019-03-04 12:32:19','20f75e17-218b-48bd-ad5c-8c7860334280'),
	(40,40,1,NULL,NULL,1,'2019-03-03 17:56:46','2019-03-04 12:32:19','75e57e70-5fb1-4b82-b036-eacefc6edda7');

/*!40000 ALTER TABLE `cphy_elements_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cphy_entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_entries`;

CREATE TABLE `cphy_entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cphy_entries_postDate_idx` (`postDate`),
  KEY `cphy_entries_expiryDate_idx` (`expiryDate`),
  KEY `cphy_entries_authorId_idx` (`authorId`),
  KEY `cphy_entries_sectionId_idx` (`sectionId`),
  KEY `cphy_entries_typeId_idx` (`typeId`),
  KEY `cphy_entries_parentId_fk` (`parentId`),
  CONSTRAINT `cphy_entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `cphy_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cphy_entries_id_fk` FOREIGN KEY (`id`) REFERENCES `cphy_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cphy_entries_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `cphy_entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `cphy_entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `cphy_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cphy_entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `cphy_entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cphy_entries` WRITE;
/*!40000 ALTER TABLE `cphy_entries` DISABLE KEYS */;

INSERT INTO `cphy_entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(2,1,NULL,1,NULL,'2019-03-03 10:07:00',NULL,NULL,'2019-03-03 10:07:55','2019-03-03 15:11:34','7bc35c48-aecd-45c1-8b27-0f38c5b555b4'),
	(3,2,NULL,2,NULL,'2019-03-03 10:11:00',NULL,1,'2019-03-03 10:11:22','2019-03-03 10:12:17','20d69b17-507b-4f8d-b6e7-a2a464641bfd'),
	(4,5,NULL,5,NULL,'2019-03-03 10:18:00',NULL,NULL,'2019-03-03 10:18:45','2019-03-03 12:16:59','2fdea59f-a0b9-418e-86cb-7c50f13be793'),
	(5,6,NULL,6,NULL,'2019-03-03 12:29:00',NULL,NULL,'2019-03-03 12:29:21','2019-03-03 13:22:43','ca717037-c888-4b3b-b233-fffeee9b96e5'),
	(8,4,NULL,4,1,'2019-03-03 13:53:00',NULL,NULL,'2019-03-03 13:53:12','2019-03-03 14:49:40','eaad4362-6355-4b82-bc1c-693a1b455f59'),
	(10,4,NULL,4,1,'2019-03-03 13:56:00',NULL,NULL,'2019-03-03 13:56:52','2019-03-03 14:49:40','7f9669e4-4e36-420f-ac7b-bd9a866db23e'),
	(11,4,NULL,4,1,'2019-03-03 13:53:00',NULL,0,'2019-03-03 13:57:12','2019-03-03 13:57:12','1cb45dc2-9c25-4626-badb-6ae10830d274'),
	(12,4,NULL,4,1,'2019-03-03 13:56:00',NULL,NULL,'2019-03-03 13:57:27','2019-03-03 14:49:40','bf6cf3fb-fe37-4c90-b07f-00c2650b9b37'),
	(14,3,NULL,3,NULL,'2019-03-03 15:15:00',NULL,NULL,'2019-03-03 15:15:19','2019-03-03 15:27:23','ca598a3c-c306-4070-af7d-1490b05ba0eb'),
	(19,7,NULL,7,1,'2019-03-03 16:17:00',NULL,NULL,'2019-03-03 16:17:03','2019-03-04 12:32:19','405d73a3-9d45-46ca-b2b0-4559e1a05c28'),
	(29,7,NULL,7,1,'2019-03-03 16:17:00',NULL,NULL,'2019-03-03 17:56:13','2019-03-04 12:32:28','d0d934a7-f585-42eb-86f2-fb6c6852186b'),
	(35,7,NULL,7,1,'2019-03-03 16:17:00',NULL,NULL,'2019-03-03 17:56:45','2019-03-04 12:32:19','71b631cc-7a19-4a05-a770-9f0fb1d1efc9');

/*!40000 ALTER TABLE `cphy_entries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cphy_entrydrafts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_entrydrafts`;

CREATE TABLE `cphy_entrydrafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `notes` text,
  `data` mediumtext NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cphy_entrydrafts_sectionId_idx` (`sectionId`),
  KEY `cphy_entrydrafts_entryId_siteId_idx` (`entryId`,`siteId`),
  KEY `cphy_entrydrafts_siteId_idx` (`siteId`),
  KEY `cphy_entrydrafts_creatorId_idx` (`creatorId`),
  CONSTRAINT `cphy_entrydrafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `cphy_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cphy_entrydrafts_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `cphy_entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cphy_entrydrafts_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `cphy_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cphy_entrydrafts_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `cphy_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table cphy_entrytypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_entrytypes`;

CREATE TABLE `cphy_entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleLabel` varchar(255) DEFAULT 'Title',
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cphy_entrytypes_name_sectionId_idx` (`name`,`sectionId`),
  KEY `cphy_entrytypes_handle_sectionId_idx` (`handle`,`sectionId`),
  KEY `cphy_entrytypes_sectionId_idx` (`sectionId`),
  KEY `cphy_entrytypes_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `cphy_entrytypes_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `cphy_entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `cphy_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `cphy_entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `cphy_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cphy_entrytypes` WRITE;
/*!40000 ALTER TABLE `cphy_entrytypes` DISABLE KEYS */;

INSERT INTO `cphy_entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleLabel`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,1,NULL,'Homepage','homepage',0,'','{section.name|raw}',1,'2019-03-03 10:07:54','2019-03-03 15:11:32',NULL,'0334a6c4-8346-48b7-94fb-3f80699e785d'),
	(2,2,NULL,'Products','products',0,NULL,'{section.name|raw}',1,'2019-03-03 10:11:22','2019-03-03 10:11:22','2019-03-03 10:12:17','6e2c2fee-0b72-4c25-9233-ee268e27c06d'),
	(3,3,5,'Products','products',1,'Title','',1,'2019-03-03 10:17:00','2019-03-03 15:27:02',NULL,'b9d8c4f7-66f2-4dc3-a6d1-cc8525bf3a89'),
	(4,4,3,'Company','company',1,'Name','',1,'2019-03-03 10:18:14','2019-03-03 14:49:39',NULL,'66a2d7b7-9d49-4844-bd2e-b8eb9d7161f3'),
	(5,5,NULL,'Contact','contact',0,NULL,'{section.name|raw}',1,'2019-03-03 10:18:45','2019-03-03 10:18:45',NULL,'afbf0700-9b7e-4719-b604-c41c2ef56d0f'),
	(6,6,2,'About','about',0,'','{section.name|raw}',1,'2019-03-03 12:29:21','2019-03-03 13:22:30',NULL,'62d0b1c7-4086-41a1-9cb0-1c33b92fe123'),
	(7,7,10,'Product Item','productItem',1,'Title','',1,'2019-03-03 15:14:51','2019-03-04 12:32:17',NULL,'e9c310fb-2b5b-4a95-a522-40aba5a5498c');

/*!40000 ALTER TABLE `cphy_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cphy_entryversions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_entryversions`;

CREATE TABLE `cphy_entryversions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `siteId` int(11) NOT NULL,
  `num` smallint(6) unsigned NOT NULL,
  `notes` text,
  `data` mediumtext NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cphy_entryversions_sectionId_idx` (`sectionId`),
  KEY `cphy_entryversions_entryId_siteId_idx` (`entryId`,`siteId`),
  KEY `cphy_entryversions_siteId_idx` (`siteId`),
  KEY `cphy_entryversions_creatorId_idx` (`creatorId`),
  CONSTRAINT `cphy_entryversions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `cphy_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `cphy_entryversions_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `cphy_entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cphy_entryversions_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `cphy_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cphy_entryversions_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `cphy_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cphy_entryversions` WRITE;
/*!40000 ALTER TABLE `cphy_entryversions` DISABLE KEYS */;

INSERT INTO `cphy_entryversions` (`id`, `entryId`, `sectionId`, `creatorId`, `siteId`, `num`, `notes`, `data`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,2,1,1,1,1,'Revision from Mar 3, 2019, 3:08:09 AM','{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Homepage\",\"slug\":\"home\",\"postDate\":1551607620,\"expiryDate\":null,\"enabled\":\"1\",\"newParentId\":null,\"fields\":[]}','2019-03-03 11:08:29','2019-03-03 11:08:29','4830749e-5458-405c-9c64-dcb03e22ab36'),
	(2,2,1,1,1,2,'','{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Homepage\",\"slug\":\"home\",\"postDate\":1551607620,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":\"Comphanny\",\"1\":\"Tagline\"}}','2019-03-03 11:08:29','2019-03-03 11:08:29','3b35569b-f210-44c7-8bff-a2d463d9efcd'),
	(3,5,6,1,1,1,'Revision from Mar 3, 2019, 4:42:01 AM','{\"typeId\":\"6\",\"authorId\":null,\"title\":\"About\",\"slug\":\"about\",\"postDate\":1551616140,\"expiryDate\":null,\"enabled\":\"1\",\"newParentId\":null,\"fields\":{\"6\":[]}}','2019-03-03 12:45:50','2019-03-03 12:45:50','76d30482-8e8e-4b7d-a683-b0b4e07d7490'),
	(4,5,6,1,1,2,'','{\"typeId\":\"6\",\"authorId\":null,\"title\":\"About\",\"slug\":\"about\",\"postDate\":1551616140,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"8\":\"Because we are a super-duper cool phun team!\",\"7\":\"Why choose us?\",\"6\":[\"6\"]}}','2019-03-03 12:45:50','2019-03-03 12:45:50','9b24d58e-6070-45b1-9a68-0236326fa6c7'),
	(5,5,6,1,1,3,'','{\"typeId\":\"6\",\"authorId\":null,\"title\":\"About\",\"slug\":\"about\",\"postDate\":1551616140,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"8\":\"Because we are a <em>super-duper cool phun</em> team!\",\"7\":\"Why choose us?\",\"6\":[\"6\"]}}','2019-03-03 12:53:54','2019-03-03 12:53:54','a4c63edb-571f-463c-b167-1bd932481d96'),
	(6,5,6,1,1,4,'','{\"typeId\":\"6\",\"authorId\":null,\"title\":\"About\",\"slug\":\"about\",\"postDate\":1551616140,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"8\":\"Because we are a super-duper cool phun team!\",\"7\":\"Why choose us?\",\"6\":[\"6\"]}}','2019-03-03 12:54:14','2019-03-03 12:54:14','d1b80fe1-4bfb-4fa3-aa80-57c4b0ba9153'),
	(7,5,6,1,1,5,'','{\"typeId\":\"6\",\"authorId\":null,\"title\":\"About\",\"slug\":\"about\",\"postDate\":1551616140,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"8\":\"Because we are a super-duper cool phun team!\",\"7\":\"Why choose us?\",\"9\":\"About page banner\",\"6\":[\"6\"]}}','2019-03-03 12:57:05','2019-03-03 12:57:05','e6a2048e-68c6-4447-b3a0-bab7e3e20ac3'),
	(8,5,6,1,1,6,'','{\"typeId\":\"6\",\"authorId\":null,\"title\":\"About\",\"slug\":\"about\",\"postDate\":1551616140,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"8\":\"Because we are a super-duper cool phun team!\",\"7\":\"Why choose us?\",\"3\":\"<h1>Lorem Ipsum</h1><p><strong>Lorem ipsum</strong> dolor sit amet, consectetur adipiscing elit. Vivamus <br />tincidunt pulvinar imperdiet. Ut non maximus tellus. Sed luctus ante sed<br /> pulvinar malesuada. Proin egestas gravida purus, nec sodales orci <br />consequat at. Suspendisse potenti. Nam eget auctor ante, in molestie <br />lorem. Nam imperdiet mauris id lacus eleifend, nec molestie magna <br />eleifend. Suspendisse finibus egestas tellus in egestas. Nunc vestibulum<br /> leo a orci tempor, ac tempor velit porta. In pulvinar ante ac blandit <br />sodales. Nullam porttitor dictum pulvinar. Suspendisse in ex eu nisl <br />consectetur egestas non eget dui. Fusce vel leo urna. Quisque ac laoreet<br /> quam, vitae lacinia justo. Phasellus et ipsum egestas, rhoncus nulla <br />in, iaculis lorem. Vestibulum dignissim tincidunt dolor id scelerisque.</p><ul><li>One</li><li>Two</li><li>Three</li></ul>\",\"9\":\"About page banner\",\"6\":[\"6\"]}}','2019-03-03 13:04:15','2019-03-03 13:04:15','3ed525d8-938d-4118-85da-e4755e6d8908'),
	(9,5,6,1,1,7,'','{\"typeId\":\"6\",\"authorId\":null,\"title\":\"About\",\"slug\":\"about\",\"postDate\":1551616140,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"8\":\"Because we are a super-duper cool phun team!\",\"7\":\"Why choose us?\",\"3\":\"<h1>Lorem Ipsum</h1>\\n<p><strong>Lorem ipsum</strong> dolor sit amet, consectetur adipiscing elit. Vivamus tincidunt pulvinar imperdiet. Ut non maximus tellus. Sed luctus ante sed pulvinar malesuada. Proin egestas gravida purus, nec sodales orci consequat at. Suspendisse potenti. Nam eget auctor ante, in molestie lorem. Nam imperdiet mauris id lacus eleifend, nec molestie magna.</p>\\n<ul><li>One</li><li>Two</li><li>Three</li></ul>\",\"9\":\"About page banner\",\"6\":[\"6\"]}}','2019-03-03 13:05:17','2019-03-03 13:05:17','c8ccc315-1485-4ca2-9d44-11d6ed49e62a'),
	(10,5,6,1,1,8,'','{\"typeId\":\"6\",\"authorId\":null,\"title\":\"About\",\"slug\":\"about\",\"postDate\":1551616140,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"15\":[\"6\"],\"8\":\"Because we are a super-duper cool phun team!\",\"7\":\"Why choose us?\",\"3\":\"<h1>Lorem Ipsum</h1>\\n<p><strong>Lorem ipsum</strong> dolor sit amet, consectetur adipiscing elit. Vivamus tincidunt pulvinar imperdiet. Ut non maximus tellus. Sed luctus ante sed pulvinar malesuada. Proin egestas gravida purus, nec sodales orci consequat at. Suspendisse potenti. Nam eget auctor ante, in molestie lorem. Nam imperdiet mauris id lacus eleifend, nec molestie magna.</p>\\n<ul><li>One</li><li>Two</li><li>Three</li></ul>\",\"9\":\"About page banner\"}}','2019-03-03 13:22:44','2019-03-03 13:22:44','bb19cf3f-e6c3-414f-be18-69f293bd537f'),
	(11,8,4,1,1,1,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Mr. Patriarch Sr.\",\"slug\":\"mr-patriarch-sr\",\"postDate\":1551621180,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"12\":\"Duh?\",\"14\":true,\"11\":\"2019-01-17 08:00:00\",\"16\":\"<h1>Lorem Ipsum</h1>\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla egestas condimentum egestas. Proin scelerisque finibus velit. Quisque a mauris in libero semper posuere vitae sed elit. Aenean euismod est eget nulla iaculis laoreet. Vivamus aliquam porttitor dui, vitae cursus turpis fringilla non. Vivamus vel urna aliquam, scelerisque enim vitae, feugiat massa. Cras facilisis lectus eu nibh scelerisque tristique.</p>\\n<h2>Why I founded this company</h2>\\n<p>Integer hendrerit feugiat libero. Proin et suscipit ante. Aenean eget ante pretium, auctor nisi vitae, dictum augue. Integer hendrerit a enim sit amet mollis. Vestibulum porta feugiat scelerisque. Aliquam tincidunt nibh lectus, eu vulputate felis cursus non. Ut et libero non mauris.</p><ol><li>First reason</li><li>Second reason</li><li>Third reason</li></ol><h2>My first script</h2>\\n<pre>&lt;script&gt;\\n console.log(\'Some code here\');\\n&lt;/script&gt;</pre>\",\"13\":[\"7\"],\"10\":\"Founder / CEO\"}}','2019-03-03 13:53:12','2019-03-03 13:53:12','a0569c4c-8390-44cb-8c61-1db8aefb1749'),
	(12,10,4,1,1,1,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Phanpy\",\"slug\":\"phanpy\",\"postDate\":1551621360,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"12\":\"I <3 coding!\",\"14\":false,\"11\":\"2019-01-31 08:00:00\",\"16\":\"<h1>Lorem Ipsum</h1><p>Minim irure consequat cupidatat cillum in. Enim non aliquip eu ullamco consequat esse mollit in nisi et. Labore in reprehenderit occaecat non eiusmod sunt ea minim amet commodo ullamco veniam do. Excepteur excepteur id reprehenderit amet.</p><pre>var someVar;</pre>\",\"13\":[\"9\"],\"10\":\"Team Lead / Web Developer\"}}','2019-03-03 13:56:52','2019-03-03 13:56:52','79ddf7e6-f776-4116-98c6-446e1103f171'),
	(13,10,4,1,1,2,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Phanpy Dev\",\"slug\":\"phanpy-1\",\"postDate\":1551621360,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"12\":\"I <3 coding!\",\"14\":false,\"11\":\"2019-01-31 08:00:00\",\"16\":\"<h1>Lorem Ipsum</h1>\\n<p>Minim irure consequat cupidatat cillum in. Enim non aliquip eu ullamco consequat esse mollit in nisi et. Labore in reprehenderit occaecat non eiusmod sunt ea minim amet commodo ullamco veniam do. Excepteur excepteur id reprehenderit amet.</p>\\n<pre>var someVar;</pre>\",\"13\":[\"9\"],\"10\":\"Team Lead / Web Developer\"}}','2019-03-03 13:57:37','2019-03-03 13:57:37','132a9870-4f18-439b-be31-653df4c4f469'),
	(14,12,4,1,1,1,'Revision from Mar 3, 2019, 5:57:27 AM','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Phanpy copy\",\"slug\":\"phanpy\",\"postDate\":1551621360,\"expiryDate\":null,\"enabled\":\"1\",\"newParentId\":null,\"fields\":{\"12\":\"I <3 coding!\",\"14\":false,\"11\":\"2019-01-31 08:00:00\",\"16\":\"<h1>Lorem Ipsum</h1><p>Minim irure consequat cupidatat cillum in. Enim non aliquip eu ullamco consequat esse mollit in nisi et. Labore in reprehenderit occaecat non eiusmod sunt ea minim amet commodo ullamco veniam do. Excepteur excepteur id reprehenderit amet.</p><pre>var someVar;</pre>\",\"13\":[\"9\"],\"10\":\"Team Lead / Web Developer\"}}','2019-03-03 13:58:17','2019-03-03 13:58:17','6f564cfd-fdcc-43a2-afc8-93a6baff0727'),
	(15,12,4,1,1,2,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Phanpy Design\",\"slug\":\"phanpy\",\"postDate\":1551621360,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"12\":\"I <3 coding!\",\"14\":false,\"11\":\"2019-01-31 08:00:00\",\"16\":\"<h1>Lorem Ipsum</h1>\\n<p>Minim irure consequat cupidatat cillum in. Enim non aliquip eu ullamco consequat esse mollit in nisi et. Labore in reprehenderit occaecat non eiusmod sunt ea minim amet commodo ullamco veniam do. Excepteur excepteur id reprehenderit amet.</p>\",\"13\":[\"13\"],\"10\":\"Lead Designer / UX Designer\"}}','2019-03-03 13:58:18','2019-03-03 13:58:18','91a17d4a-2493-41e1-9b11-b8ae31f6ccfe'),
	(16,10,4,1,1,3,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Phanpy Dev\",\"slug\":\"phanpy-dev\",\"postDate\":1551621360,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"12\":\"I <3 coding!\",\"14\":false,\"11\":\"2019-01-31 08:00:00\",\"16\":\"<h1>Lorem Ipsum</h1>\\n<p>Minim irure consequat cupidatat cillum in. Enim non aliquip eu ullamco consequat esse mollit in nisi et. Labore in reprehenderit occaecat non eiusmod sunt ea minim amet commodo ullamco veniam do. Excepteur excepteur id reprehenderit amet.</p>\\n<pre>var someVar;</pre>\",\"13\":[\"9\"],\"10\":\"Team Lead / Web Developer\"}}','2019-03-03 14:02:51','2019-03-03 14:02:51','c6eeed9b-cc07-473e-9b78-4a816bcb78dd'),
	(17,12,4,1,1,3,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Phanpy Design\",\"slug\":\"phanpy-design\",\"postDate\":1551621360,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"12\":\"I <3 coding!\",\"14\":false,\"11\":\"2019-01-31 08:00:00\",\"16\":\"<h1>Lorem Ipsum</h1>\\n<p>Minim irure consequat cupidatat cillum in. Enim non aliquip eu ullamco consequat esse mollit in nisi et. Labore in reprehenderit occaecat non eiusmod sunt ea minim amet commodo ullamco veniam do. Excepteur excepteur id reprehenderit amet.</p>\",\"13\":[\"13\"],\"10\":\"Lead Designer / UX Designer\"}}','2019-03-03 14:03:03','2019-03-03 14:03:03','925fa3f6-b413-4d91-b334-fedc0558c534'),
	(18,8,4,1,1,2,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Mr. Patriarch Sr.\",\"slug\":\"mr-patriarch-sr\",\"postDate\":1551621180,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"12\":\"Duh?\",\"14\":true,\"11\":\"2019-01-17 08:00:00\",\"16\":\"<h1>Lorem Ipsum</h1>\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla egestas condimentum egestas. Proin scelerisque finibus velit. Quisque a mauris in libero semper posuere vitae sed elit. Aenean euismod est eget nulla iaculis laoreet. Vivamus aliquam porttitor dui, vitae cursus turpis fringilla non. Vivamus vel urna aliquam, scelerisque enim vitae, feugiat massa. Cras facilisis lectus eu nibh scelerisque tristique.</p>\\n<h2>Why I founded this company</h2>\\n<p>Integer hendrerit feugiat libero. Proin et suscipit ante. Aenean eget ante pretium, auctor nisi vitae, dictum augue. Integer hendrerit a enim sit amet mollis. Vestibulum porta feugiat scelerisque. Aliquam tincidunt nibh lectus, eu vulputate felis cursus non. Ut et libero non mauris.</p>\\n<ol><li>First reason</li><li>Second reason</li><li>Third reason</li></ol>\\n<h2>My first script</h2>\\n<pre>&lt;script&gt;\\n console.log(\'Some code here\');\\n&lt;/script&gt;</pre>\",\"13\":[\"7\"],\"17\":\"1\",\"10\":\"Founder / CEO\"}}','2019-03-03 14:22:27','2019-03-03 14:22:27','21dd82fa-d402-4e32-921d-43bc7d31a0e5'),
	(19,10,4,1,1,4,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Phanpy Dev\",\"slug\":\"phanpy-dev\",\"postDate\":1551621360,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"12\":\"I <3 coding!\",\"14\":false,\"11\":\"2019-01-31 08:00:00\",\"16\":\"<h1>Lorem Ipsum</h1>\\n<p>Minim irure consequat cupidatat cillum in. Enim non aliquip eu ullamco consequat esse mollit in nisi et. Labore in reprehenderit occaecat non eiusmod sunt ea minim amet commodo ullamco veniam do. Excepteur excepteur id reprehenderit amet.</p>\\n<pre>var someVar;</pre>\",\"13\":[\"9\"],\"17\":\"0\",\"10\":\"Team Lead / Web Developer\"}}','2019-03-03 14:26:19','2019-03-03 14:26:19','fd0c54ad-a59f-43f4-932c-579cf0dc9df0'),
	(20,12,4,1,1,4,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Phanpy Design\",\"slug\":\"phanpy-design\",\"postDate\":1551621360,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"12\":\"I <3 coding!\",\"14\":false,\"11\":\"2019-01-31 08:00:00\",\"16\":\"<h1>Lorem Ipsum</h1>\\n<p>Minim irure consequat cupidatat cillum in. Enim non aliquip eu ullamco consequat esse mollit in nisi et. Labore in reprehenderit occaecat non eiusmod sunt ea minim amet commodo ullamco veniam do. Excepteur excepteur id reprehenderit amet.</p>\",\"13\":[\"13\"],\"17\":\"0\",\"10\":\"Lead Designer / UX Designer\"}}','2019-03-03 14:26:30','2019-03-03 14:26:30','dcc4e297-2926-44b3-a672-206e935f26f8'),
	(21,2,1,1,1,3,'','{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Homepage\",\"slug\":\"home\",\"postDate\":1551607620,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"18\":\"Phun, phamily phans\",\"4\":\"com:Phanny\"}}','2019-03-03 15:07:20','2019-03-03 15:07:20','35c4f890-c8ef-470f-bf25-54f2f50dc26f'),
	(22,14,3,1,1,1,'Revision from Mar 3, 2019, 7:20:57 AM','{\"typeId\":\"3\",\"authorId\":null,\"title\":\"Products\",\"slug\":\"products\",\"postDate\":1551626100,\"expiryDate\":null,\"enabled\":\"1\",\"newParentId\":null,\"fields\":[]}','2019-03-03 15:23:34','2019-03-03 15:23:34','70e98376-4a82-4c01-b706-78ff553d56e9'),
	(23,14,3,1,1,2,'','{\"typeId\":\"3\",\"authorId\":null,\"title\":\"Products\",\"slug\":\"products\",\"postDate\":1551626100,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"5\":\"Minim irure consequat cupidatat cillum in. Enim non aliquip eu ullamco consequat esse mollit in nisi et. Labore in reprehenderit occaecat non eiusmod sunt ea minim amet commodo ullamco veniam do. Excepteur excepteur id reprehenderit amet.\"}}','2019-03-03 15:23:34','2019-03-03 15:23:34','f025619e-03e4-44f7-9931-9978d2c19cdd'),
	(24,14,3,1,1,3,'','{\"typeId\":\"3\",\"authorId\":null,\"title\":\"Products\",\"slug\":\"products\",\"postDate\":1551626100,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"5\":\"Minim irure consequat cupidatat cillum in. Enim non aliquip eu ullamco consequat esse mollit in nisi et. Labore in reprehenderit occaecat non eiusmod sunt ea minim amet commodo ullamco veniam do.\\n\\nExcepteur excepteur id reprehenderit amet.\"}}','2019-03-03 15:23:47','2019-03-03 15:23:47','b8832ad7-6c0f-4e56-9322-388e102c945f'),
	(25,14,3,1,1,4,'','{\"typeId\":\"3\",\"authorId\":null,\"title\":\"Products\",\"slug\":\"products\",\"postDate\":1551626100,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"19\":\"<p>Minim irure consequat cupidatat cillum in. Enim non aliquip eu ullamco consequat esse mollit in nisi et. Labore in reprehenderit occaecat non eiusmod sunt ea minim amet commodo ullamco veniam do.</p><p>Excepteur excepteur id reprehenderit amet.</p>\"}}','2019-03-03 15:27:23','2019-03-03 15:27:23','ac9f336b-8a1d-4d11-b77d-8a113b4c651d'),
	(26,19,7,1,1,1,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"Sample Product Entry\",\"slug\":\"sample-product-entry\",\"postDate\":1551629820,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"22\":{\"20\":{\"type\":\"quote\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"heading\":\"Quote Heading\",\"contentPlain\":\"Quote content\",\"footer\":\"Quote footer\"}},\"21\":{\"type\":\"pageContent\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"contentPlain\":\"Plain content here.\",\"contentHtml\":\"<p>Content <strong>here</strong>.</p>\"}},\"22\":{\"type\":\"card\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"heading\":\"Some Content\",\"contentPlain\":\"Plain content\",\"contentHtml\":\"<p>Lorem Ipsum</p><p>HTML Content</p>\"}},\"23\":{\"type\":\"pageContent\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"contentPlain\":\"Some plain content here.\",\"contentHtml\":\"\"}},\"24\":{\"type\":\"cardImage\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"heading\":\"Card with a side Image\",\"sideImage\":[\"18\"],\"contentHtml\":\"<h3>Lorem Ipsum</h3>\\n<p>Some <code>HTML</code> content</p>\",\"contentPlain\":\"Some plain image-card content\"}}},\"20\":[\"17\"],\"21\":[{\"col1\":\"PHP7\",\"col2\":\"\"},{\"col1\":\"CraftCMS\",\"col2\":\"https://craftcms.com/\"}]}}','2019-03-03 16:17:03','2019-03-03 16:17:03','a28d9efd-007a-4794-af98-edc67bc76ac7'),
	(27,19,7,1,1,2,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"Sample Product Entry\",\"slug\":\"sample-product-entry\",\"postDate\":1551629820,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"22\":{\"20\":{\"type\":\"quote\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"heading\":\"Quote Heading\",\"contentPlain\":\"Quote content\",\"footer\":\"Quote footer\"}},\"21\":{\"type\":\"pageContent\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"contentPlain\":\"Plain content here.\",\"contentHtml\":\"<p>Content <strong>here</strong>.</p>\"}},\"22\":{\"type\":\"card\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"heading\":\"Some Content\",\"contentPlain\":\"Plain content\",\"contentHtml\":\"<h3>Lorem Ipsum</h3>\\n<p>HTML Content</p>\"}},\"23\":{\"type\":\"pageContent\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"contentPlain\":\"Some plain content here.\",\"contentHtml\":\"\"}},\"24\":{\"type\":\"cardImage\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"heading\":\"Card with a side Image\",\"sideImage\":[\"18\"],\"contentHtml\":\"<h3>Lorem Ipsum</h3>\\n<p>Some <code>HTML</code> content</p>\",\"contentPlain\":\"Some plain image-card content\"}}},\"20\":[\"17\"],\"21\":[{\"col1\":\"PHP7\",\"col2\":\"\"},{\"col1\":\"CraftCMS\",\"col2\":\"https://craftcms.com/\"}]}}','2019-03-03 17:07:06','2019-03-03 17:07:06','5f739626-a2e0-44a1-98bd-07a7d7f037a0'),
	(28,19,7,1,1,3,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"Sample Product Entry\",\"slug\":\"sample-product-entry\",\"postDate\":1551629820,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"22\":{\"20\":{\"type\":\"quote\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"heading\":\"Quote Heading\",\"contentPlain\":\"Quote content\",\"footer\":\"Quote footer\"}},\"21\":{\"type\":\"pageContent\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"contentPlain\":\"Plain content here.\",\"contentHtml\":\"<p>Content <strong>here</strong>.</p>\"}},\"22\":{\"type\":\"card\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"heading\":\"Some Content\",\"contentPlain\":\"Plain content\",\"contentHtml\":\"<h3>Lorem Ipsum</h3>\\n<p>HTML Content</p>\"}},\"23\":{\"type\":\"pageContent\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"contentPlain\":\"Some plain content here.\",\"contentHtml\":\"\"}},\"24\":{\"type\":\"cardImage\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"heading\":\"Card with a side Image\",\"sideImage\":[\"18\"],\"contentHtml\":\"<h3>Lorem Ipsum</h3>\\n<p>Some <code>HTML</code> content</p>\",\"contentPlain\":\"Some plain image-card content\"}}},\"20\":[\"17\"],\"38\":[\"25\",\"26\",\"27\",\"28\"],\"21\":[{\"col1\":\"PHP7\",\"col2\":\"\"},{\"col1\":\"CraftCMS\",\"col2\":\"https://craftcms.com/\"}]}}','2019-03-03 17:38:35','2019-03-03 17:38:35','1b9dc867-4d46-4de1-8f52-9cc79b43b62b'),
	(29,19,7,1,1,4,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"Sample Product Entry\",\"slug\":\"sample-product-entry\",\"postDate\":1551629820,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"22\":{\"20\":{\"type\":\"quote\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"heading\":\"Quote Heading\",\"contentPlain\":\"Quote content\",\"footer\":\"Quote footer\"}},\"21\":{\"type\":\"pageContent\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"contentPlain\":\"Plain content here.\",\"contentHtml\":\"<p>Content <strong>here</strong>.</p>\"}},\"22\":{\"type\":\"card\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"heading\":\"Some Content\",\"contentPlain\":\"Plain content\",\"contentHtml\":\"<h3>Lorem Ipsum</h3>\\n<p>HTML Content</p>\"}},\"23\":{\"type\":\"pageContent\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"contentPlain\":\"Some plain content here.\",\"contentHtml\":\"\"}},\"24\":{\"type\":\"cardImage\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"heading\":\"Card with a side Image\",\"sideImage\":[\"18\"],\"contentHtml\":\"<h3>Lorem Ipsum</h3>\\n<p>Some <code>HTML</code> content</p>\",\"contentPlain\":\"Some plain image-card content\"}}},\"20\":[\"17\"],\"39\":\"Some description\",\"38\":[\"25\",\"26\",\"27\",\"28\"],\"21\":[{\"col1\":\"PHP7\",\"col2\":\"\"},{\"col1\":\"CraftCMS\",\"col2\":\"https://craftcms.com/\"}]}}','2019-03-03 17:55:22','2019-03-03 17:55:22','2d3aba39-db4b-409a-b827-27f7032342b6'),
	(30,19,7,1,1,5,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"Sample Product Entry\",\"slug\":\"sample-product-entry\",\"postDate\":1551629820,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"35\":false,\"22\":{\"20\":{\"type\":\"quote\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"heading\":\"Quote Heading\",\"contentPlain\":\"Quote content\",\"footer\":\"Quote footer\"}},\"21\":{\"type\":\"pageContent\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"contentPlain\":\"Plain content here.\",\"contentHtml\":\"<p>Content <strong>here</strong>.</p>\"}},\"22\":{\"type\":\"card\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"heading\":\"Some Content\",\"contentPlain\":\"Plain content\",\"contentHtml\":\"<h3>Lorem Ipsum</h3>\\n<p>HTML Content</p>\"}},\"23\":{\"type\":\"pageContent\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"contentPlain\":\"Some plain content here.\",\"contentHtml\":\"\"}},\"24\":{\"type\":\"cardImage\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"heading\":\"Card with a side Image\",\"sideImage\":[\"18\"],\"contentHtml\":\"<h3>Lorem Ipsum</h3>\\n<p>Some <code>HTML</code> content</p>\",\"contentPlain\":\"Some plain image-card content\"}}},\"20\":[\"17\"],\"39\":\"Some description\",\"38\":[\"25\",\"26\",\"27\",\"28\"],\"21\":[{\"col1\":\"PHP7\",\"col2\":\"\"},{\"col1\":\"CraftCMS\",\"col2\":\"https://craftcms.com/\"}]}}','2019-03-03 17:56:04','2019-03-03 17:56:04','9ce306cd-0041-437c-8b4d-9ffeee59cda9'),
	(31,29,7,1,1,1,'Revision from Mar 3, 2019, 9:56:13 AM','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"Sample Product Entry copy\",\"slug\":\"sample-product-entry\",\"postDate\":1551629820,\"expiryDate\":null,\"enabled\":\"1\",\"newParentId\":null,\"fields\":{\"35\":false,\"22\":{\"30\":{\"type\":\"quote\",\"enabled\":\"1\",\"collapsed\":false,\"fields\":{\"heading\":\"Quote Heading\",\"contentPlain\":\"Quote content\",\"footer\":\"Quote footer\"}},\"31\":{\"type\":\"pageContent\",\"enabled\":\"1\",\"collapsed\":false,\"fields\":{\"contentPlain\":\"Plain content here.\",\"contentHtml\":\"<p>Content <strong>here</strong>.</p>\"}},\"32\":{\"type\":\"card\",\"enabled\":\"1\",\"collapsed\":false,\"fields\":{\"heading\":\"Some Content\",\"contentPlain\":\"Plain content\",\"contentHtml\":\"<h3>Lorem Ipsum</h3>\\n<p>HTML Content</p>\"}},\"33\":{\"type\":\"pageContent\",\"enabled\":\"1\",\"collapsed\":false,\"fields\":{\"contentPlain\":\"Some plain content here.\",\"contentHtml\":null}},\"34\":{\"type\":\"cardImage\",\"enabled\":\"1\",\"collapsed\":false,\"fields\":{\"heading\":\"Card with a side Image\",\"sideImage\":[\"18\"],\"contentHtml\":\"<h3>Lorem Ipsum</h3>\\n<p>Some <code>HTML</code> content</p>\",\"contentPlain\":\"Some plain image-card content\"}}},\"20\":[\"17\"],\"39\":\"Some description\",\"38\":[\"25\",\"26\",\"27\",\"28\"],\"21\":[{\"col1\":\"PHP7\",\"col2\":\"\"},{\"col1\":\"CraftCMS\",\"col2\":\"https://craftcms.com/\"}]}}','2019-03-03 17:56:37','2019-03-03 17:56:37','bf35876b-47c6-43d8-b8b5-9d7fd1137b2a'),
	(32,29,7,1,1,2,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"Featured Product 1\",\"slug\":\"sample-product-entry-1\",\"postDate\":1551629820,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"35\":true,\"22\":{\"30\":{\"type\":\"quote\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"heading\":\"Quote Heading\",\"contentPlain\":\"Quote content\",\"footer\":\"Quote footer\"}},\"31\":{\"type\":\"pageContent\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"contentPlain\":\"Plain content here.\",\"contentHtml\":\"<p>Content <strong>here</strong>.</p>\"}},\"32\":{\"type\":\"card\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"heading\":\"Some Content\",\"contentPlain\":\"Plain content\",\"contentHtml\":\"<h3>Lorem Ipsum</h3>\\n<p>HTML Content</p>\"}},\"33\":{\"type\":\"pageContent\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"contentPlain\":\"Some plain content here.\",\"contentHtml\":\"\"}},\"34\":{\"type\":\"cardImage\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"heading\":\"Card with a side Image\",\"sideImage\":[\"18\"],\"contentHtml\":\"<h3>Lorem Ipsum</h3>\\n<p>Some <code>HTML</code> content</p>\",\"contentPlain\":\"Some plain image-card content\"}}},\"20\":[\"17\"],\"39\":\"Some description\",\"38\":[\"25\",\"26\",\"27\",\"28\"],\"21\":[{\"col1\":\"PHP7\",\"col2\":\"\"},{\"col1\":\"CraftCMS\",\"col2\":\"https://craftcms.com/\"}]}}','2019-03-03 17:56:38','2019-03-03 17:56:38','bf66beab-ecee-41b2-b56d-0b6023309a04'),
	(33,35,7,1,1,1,'Revision from Mar 3, 2019, 9:56:45 AM','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"Featured Product 1 copy\",\"slug\":\"sample-product-entry-1\",\"postDate\":1551629820,\"expiryDate\":null,\"enabled\":\"1\",\"newParentId\":null,\"fields\":{\"35\":true,\"22\":{\"36\":{\"type\":\"quote\",\"enabled\":\"1\",\"collapsed\":false,\"fields\":{\"heading\":\"Quote Heading\",\"contentPlain\":\"Quote content\",\"footer\":\"Quote footer\"}},\"37\":{\"type\":\"pageContent\",\"enabled\":\"1\",\"collapsed\":false,\"fields\":{\"contentPlain\":\"Plain content here.\",\"contentHtml\":\"<p>Content <strong>here</strong>.</p>\"}},\"38\":{\"type\":\"card\",\"enabled\":\"1\",\"collapsed\":false,\"fields\":{\"heading\":\"Some Content\",\"contentPlain\":\"Plain content\",\"contentHtml\":\"<h3>Lorem Ipsum</h3>\\n<p>HTML Content</p>\"}},\"39\":{\"type\":\"pageContent\",\"enabled\":\"1\",\"collapsed\":false,\"fields\":{\"contentPlain\":\"Some plain content here.\",\"contentHtml\":null}},\"40\":{\"type\":\"cardImage\",\"enabled\":\"1\",\"collapsed\":false,\"fields\":{\"heading\":\"Card with a side Image\",\"sideImage\":[\"18\"],\"contentHtml\":\"<h3>Lorem Ipsum</h3>\\n<p>Some <code>HTML</code> content</p>\",\"contentPlain\":\"Some plain image-card content\"}}},\"20\":[\"17\"],\"39\":\"Some description\",\"38\":[\"25\",\"26\",\"27\",\"28\"],\"21\":[{\"col1\":\"PHP7\",\"col2\":\"\"},{\"col1\":\"CraftCMS\",\"col2\":\"https://craftcms.com/\"}]}}','2019-03-03 17:57:04','2019-03-03 17:57:04','5474bada-0750-444b-9436-a39ee3ca8fd3'),
	(34,35,7,1,1,2,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"Featured Product 2\",\"slug\":\"sample-product-entry-1-1\",\"postDate\":1551629820,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"35\":true,\"22\":{\"36\":{\"type\":\"quote\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"heading\":\"Quote Heading\",\"contentPlain\":\"Quote content\",\"footer\":\"Quote footer\"}},\"37\":{\"type\":\"pageContent\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"contentPlain\":\"Plain content here.\",\"contentHtml\":\"<p>Content <strong>here</strong>.</p>\"}},\"38\":{\"type\":\"card\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"heading\":\"Some Content\",\"contentPlain\":\"Plain content\",\"contentHtml\":\"<h3>Lorem Ipsum</h3>\\n<p>HTML Content</p>\"}},\"39\":{\"type\":\"pageContent\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"contentPlain\":\"Some plain content here.\",\"contentHtml\":\"\"}},\"40\":{\"type\":\"cardImage\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"heading\":\"Card with a side Image\",\"sideImage\":[\"18\"],\"contentHtml\":\"<h3>Lorem Ipsum</h3>\\n<p>Some <code>HTML</code> content</p>\",\"contentPlain\":\"Some plain image-card content\"}}},\"20\":[\"17\"],\"39\":\"Some description 2\",\"38\":[\"25\",\"26\",\"27\",\"28\"],\"21\":[{\"col1\":\"PHP7\",\"col2\":\"\"},{\"col1\":\"CraftCMS\",\"col2\":\"https://craftcms.com/\"}]}}','2019-03-03 17:57:04','2019-03-03 17:57:04','adb2b6c6-9080-4556-bb27-15c65e34c3a2'),
	(35,29,7,1,1,3,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"Featured Product 1\",\"slug\":\"sample-product-entry-1\",\"postDate\":1551629820,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"35\":true,\"22\":{\"30\":{\"type\":\"quote\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"heading\":\"Quote Heading\",\"contentPlain\":\"Quote content\",\"footer\":\"Quote footer\"}},\"31\":{\"type\":\"pageContent\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"contentPlain\":\"Plain content here.\",\"contentHtml\":\"<p>Content <strong>here</strong>.</p>\"}},\"32\":{\"type\":\"card\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"heading\":\"Some Content\",\"contentPlain\":\"Plain content\",\"contentHtml\":\"<h3>Lorem Ipsum</h3>\\n<p>HTML Content</p>\"}},\"33\":{\"type\":\"pageContent\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"contentPlain\":\"Some plain content here.\",\"contentHtml\":\"\"}},\"34\":{\"type\":\"cardImage\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"heading\":\"Card with a side Image\",\"sideImage\":[\"18\"],\"contentHtml\":\"<h3>Lorem Ipsum</h3>\\n<p>Some <code>HTML</code> content</p>\",\"contentPlain\":\"Some plain image-card content\"}}},\"20\":[\"17\"],\"39\":\"Some description\",\"38\":[\"25\",\"28\"],\"21\":[{\"col1\":\"PHP7\",\"col2\":\"\"},{\"col1\":\"CraftCMS\",\"col2\":\"https://craftcms.com/\"}]}}','2019-03-03 17:57:12','2019-03-03 17:57:12','06e04c1a-2dcf-4134-87e7-aeb1c01e3f0f'),
	(36,35,7,1,1,3,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"Featured Product 2\",\"slug\":\"sample-product-entry-1-1\",\"postDate\":1551629820,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"35\":true,\"22\":{\"36\":{\"type\":\"quote\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"heading\":\"Quote Heading\",\"contentPlain\":\"Quote content\",\"footer\":\"Quote footer\"}},\"37\":{\"type\":\"pageContent\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"contentPlain\":\"Plain content here.\",\"contentHtml\":\"<p>Content <strong>here</strong>.</p>\"}},\"38\":{\"type\":\"card\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"heading\":\"Some Content\",\"contentPlain\":\"Plain content\",\"contentHtml\":\"<h3>Lorem Ipsum</h3>\\n<p>HTML Content</p>\"}},\"39\":{\"type\":\"pageContent\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"contentPlain\":\"Some plain content here.\",\"contentHtml\":\"\"}},\"40\":{\"type\":\"cardImage\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"heading\":\"Card with a side Image\",\"sideImage\":[\"18\"],\"contentHtml\":\"<h3>Lorem Ipsum</h3>\\n<p>Some <code>HTML</code> content</p>\",\"contentPlain\":\"Some plain image-card content\"}}},\"20\":[\"17\"],\"39\":\"Some description 2\",\"38\":[\"25\",\"26\",\"27\"],\"21\":[{\"col1\":\"PHP7\",\"col2\":\"\"},{\"col1\":\"CraftCMS\",\"col2\":\"https://craftcms.com/\"}]}}','2019-03-03 17:57:22','2019-03-03 17:57:22','bd157192-6ea3-4839-81b6-4a59dfd43344'),
	(37,29,7,1,1,4,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"Featured Product 1\",\"slug\":\"sample-product-entry-1\",\"postDate\":1551629820,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"35\":true,\"22\":{\"30\":{\"type\":\"quote\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"heading\":\"Quote Heading\",\"contentPlain\":\"Quote content\",\"footer\":\"Quote footer\"}},\"31\":{\"type\":\"pageContent\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"contentPlain\":\"Plain content here.\",\"contentHtml\":\"<p>Content <strong>here</strong>.</p>\"}},\"32\":{\"type\":\"card\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"heading\":\"Some Content\",\"contentPlain\":\"Plain content\",\"contentHtml\":\"<h3>Lorem Ipsum</h3>\\n<p>HTML Content</p>\"}},\"33\":{\"type\":\"pageContent\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"contentPlain\":\"Some plain content here.\",\"contentHtml\":\"\"}},\"34\":{\"type\":\"cardImage\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"heading\":\"Card with a side Image\",\"sideImage\":[\"18\"],\"contentHtml\":\"<h3>Lorem Ipsum</h3>\\n<p>Some <code>HTML</code> content</p>\",\"contentPlain\":\"Some plain image-card content\"}}},\"20\":[\"17\"],\"39\":\"Some description\",\"40\":\"Some tagline\",\"38\":[\"25\",\"28\"],\"21\":[{\"col1\":\"PHP7\",\"col2\":\"\"},{\"col1\":\"CraftCMS\",\"col2\":\"https://craftcms.com/\"}]}}','2019-03-04 12:32:29','2019-03-04 12:32:29','3525e353-806b-426d-aba0-829ca252e147');

/*!40000 ALTER TABLE `cphy_entryversions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cphy_fieldgroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_fieldgroups`;

CREATE TABLE `cphy_fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cphy_fieldgroups_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cphy_fieldgroups` WRITE;
/*!40000 ALTER TABLE `cphy_fieldgroups` DISABLE KEYS */;

INSERT INTO `cphy_fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Common','2019-03-03 09:27:20','2019-03-03 09:27:20','fd1f04b0-5c66-4a29-8d77-84e8361d1292'),
	(4,'About','2019-03-03 12:39:46','2019-03-03 12:39:46','b882c19e-9c8f-4b94-a6e8-d98af21f6caf'),
	(5,'Company','2019-03-03 13:11:36','2019-03-03 13:11:36','11a4c139-08e0-4f50-a680-fe62292fe16b'),
	(6,'Product','2019-03-03 15:24:34','2019-03-03 15:24:34','3da128c7-3dde-466a-a522-34f005de8634');

/*!40000 ALTER TABLE `cphy_fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cphy_fieldlayoutfields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_fieldlayoutfields`;

CREATE TABLE `cphy_fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cphy_fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  KEY `cphy_fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  KEY `cphy_fieldlayoutfields_tabId_idx` (`tabId`),
  KEY `cphy_fieldlayoutfields_fieldId_idx` (`fieldId`),
  CONSTRAINT `cphy_fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `cphy_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cphy_fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `cphy_fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cphy_fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `cphy_fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cphy_fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `cphy_fieldlayoutfields` DISABLE KEYS */;

INSERT INTO `cphy_fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(17,2,6,9,0,4,'2019-03-03 13:22:30','2019-03-03 13:22:30','13a88657-2b1a-4061-9684-b525a575108a'),
	(18,2,6,3,1,5,'2019-03-03 13:22:30','2019-03-03 13:22:30','e54c1e9e-1178-4c0b-b06f-231cf49c5d30'),
	(19,2,6,8,1,2,'2019-03-03 13:22:30','2019-03-03 13:22:30','70301b68-ba01-47f1-bce8-5f7cb80e5e71'),
	(20,2,6,7,1,1,'2019-03-03 13:22:30','2019-03-03 13:22:30','ee5bd186-472a-4768-9a1b-1fff897b4220'),
	(21,2,6,15,1,3,'2019-03-03 13:22:30','2019-03-03 13:22:30','0a6d2ff8-046d-4373-9184-18d63e0bd5dd'),
	(47,3,11,14,0,5,'2019-03-03 14:49:39','2019-03-03 14:49:39','42fe2c02-30e4-42f2-8a92-8bcc0ec6ba40'),
	(48,3,11,11,1,3,'2019-03-03 14:49:39','2019-03-03 14:49:39','0a321c6a-637e-4b5e-82d5-f5dfd4ba9ae1'),
	(49,3,11,13,1,1,'2019-03-03 14:49:39','2019-03-03 14:49:39','4dfb3dc9-fd0a-4cb9-93cc-c706123ecec1'),
	(50,3,11,16,1,7,'2019-03-03 14:49:39','2019-03-03 14:49:39','0b841055-e821-458a-aa70-c1767422ed1d'),
	(51,3,11,12,0,4,'2019-03-03 14:49:39','2019-03-03 14:49:39','2b652805-f10d-48e5-8d05-e0241bb2d057'),
	(52,3,11,10,1,2,'2019-03-03 14:49:39','2019-03-03 14:49:39','9cd18f24-759a-4a38-8334-adc244e100e7'),
	(53,3,11,17,1,6,'2019-03-03 14:49:39','2019-03-03 14:49:39','01511829-7971-40f3-9620-e71aa747c73d'),
	(55,4,12,4,0,1,'2019-03-03 15:06:49','2019-03-03 15:06:49','fc1d2845-c100-4edc-b13a-23077425e02b'),
	(57,5,14,19,0,1,'2019-03-03 15:27:02','2019-03-03 15:27:02','216c4e9c-961a-465c-8347-8ad46a02b45d'),
	(58,6,15,23,0,3,'2019-03-03 15:56:18','2019-03-03 15:56:18','6536a925-1f35-4194-afdd-65a36ab8f5ae'),
	(59,6,15,24,0,2,'2019-03-03 15:56:18','2019-03-03 15:56:18','61432b4e-f5c4-46e6-ada9-61f15fe1d3a0'),
	(60,6,15,25,0,1,'2019-03-03 15:56:18','2019-03-03 15:56:18','ccbc208a-9682-4412-981a-c7a58fce0239'),
	(61,7,16,26,0,2,'2019-03-03 15:56:18','2019-03-03 15:56:18','98536dd2-f161-4870-af08-17ae46da99fb'),
	(62,7,16,27,0,1,'2019-03-03 15:56:18','2019-03-03 15:56:18','fedd231c-d595-4ccf-90a4-2ea188aa70a9'),
	(63,8,17,28,0,2,'2019-03-03 15:56:19','2019-03-03 15:56:19','8f1e33c6-caef-4571-86cd-2831a5d3de2b'),
	(64,8,17,29,0,3,'2019-03-03 15:56:19','2019-03-03 15:56:19','f6643f60-c729-4285-a682-0751be72685c'),
	(65,8,17,30,0,1,'2019-03-03 15:56:19','2019-03-03 15:56:19','68b1a339-f51d-42fc-b9cd-d03fc42c2dcc'),
	(66,9,18,31,0,1,'2019-03-03 15:56:20','2019-03-03 15:56:20','88ecfc76-83eb-4743-b394-81ff224f48f1'),
	(67,9,18,32,0,2,'2019-03-03 15:56:20','2019-03-03 15:56:20','0fac1314-44fd-4e85-852a-5150d4c2895e'),
	(68,9,18,33,0,3,'2019-03-03 15:56:20','2019-03-03 15:56:20','d226481d-919a-4f8e-9892-c635e9a118fb'),
	(69,9,18,34,0,4,'2019-03-03 15:56:20','2019-03-03 15:56:20','c6ae2b7d-9dc2-4881-b5bb-643650a6583a'),
	(74,11,21,36,0,1,'2019-03-03 17:34:16','2019-03-03 17:34:16','17c6ef15-15a1-4352-96fb-2ce2ff2c4712'),
	(75,11,21,37,0,2,'2019-03-03 17:34:16','2019-03-03 17:34:16','84728270-93da-4a96-a7ea-2d893b5ac906'),
	(91,10,25,21,0,6,'2019-03-04 12:32:17','2019-03-04 12:32:17','ef012fec-d06a-4145-b795-f1837de1d5a4'),
	(92,10,25,38,0,5,'2019-03-04 12:32:17','2019-03-04 12:32:17','8fc5dbf6-75bd-48ce-86e7-f388ff83b95e'),
	(93,10,25,22,1,7,'2019-03-04 12:32:17','2019-03-04 12:32:17','57ed6bf6-88ac-4dda-8c47-c64df45e516e'),
	(94,10,25,35,0,1,'2019-03-04 12:32:17','2019-03-04 12:32:17','94c93756-31bb-484d-a102-0966c22e6e8d'),
	(95,10,25,40,0,3,'2019-03-04 12:32:17','2019-03-04 12:32:17','5dca18cd-88dc-43c2-b057-e624e3bd8671'),
	(96,10,25,20,1,2,'2019-03-04 12:32:17','2019-03-04 12:32:17','33db39ec-27ce-41bd-ba69-7a8d408554a7'),
	(97,10,25,39,0,4,'2019-03-04 12:32:17','2019-03-04 12:32:17','f619ff9b-e5cb-47c9-ae40-a9326f761d82');

/*!40000 ALTER TABLE `cphy_fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cphy_fieldlayouts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_fieldlayouts`;

CREATE TABLE `cphy_fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cphy_fieldlayouts_dateDeleted_idx` (`dateDeleted`),
  KEY `cphy_fieldlayouts_type_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cphy_fieldlayouts` WRITE;
/*!40000 ALTER TABLE `cphy_fieldlayouts` DISABLE KEYS */;

INSERT INTO `cphy_fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,'craft\\elements\\Entry','2019-03-03 11:08:08','2019-03-03 11:11:09','2019-03-03 11:13:20','857e2b12-e3ff-45f7-b1d5-5eaecc9c9270'),
	(2,'craft\\elements\\Entry','2019-03-03 12:42:00','2019-03-03 13:22:30',NULL,'1596cc38-2225-4058-9aca-8ba132d1e6a6'),
	(3,'craft\\elements\\Entry','2019-03-03 13:24:40','2019-03-03 14:49:39',NULL,'19fffde0-a292-4ac2-87aa-f50ccc2f66cf'),
	(4,'craft\\elements\\Entry','2019-03-03 15:06:49','2019-03-03 15:06:49','2019-03-03 15:11:32','bd79bb92-f41c-43ce-8778-8cfc760f2e0b'),
	(5,'craft\\elements\\Entry','2019-03-03 15:20:56','2019-03-03 15:27:02',NULL,'258b6883-ed48-4341-9f6a-30e713310118'),
	(6,'craft\\elements\\MatrixBlock','2019-03-03 15:56:18','2019-03-03 15:56:18',NULL,'84691447-0234-4cb5-a469-0b4003262bbf'),
	(7,'craft\\elements\\MatrixBlock','2019-03-03 15:56:18','2019-03-03 15:56:18',NULL,'720b050f-66e7-464b-8714-278f3cbf70b2'),
	(8,'craft\\elements\\MatrixBlock','2019-03-03 15:56:19','2019-03-03 15:56:19',NULL,'d2eb5182-500b-46c2-a34d-8c548ad06813'),
	(9,'craft\\elements\\MatrixBlock','2019-03-03 15:56:20','2019-03-03 15:56:20',NULL,'8f69a596-1140-459c-a361-2298cbad2e31'),
	(10,'craft\\elements\\Entry','2019-03-03 15:57:51','2019-03-04 12:32:17',NULL,'730913d5-5a1d-4e6f-86b8-8217959ee9e7'),
	(11,'craft\\elements\\Category','2019-03-03 17:31:11','2019-03-03 17:34:16',NULL,'b4276dd1-febe-4064-863a-e6d53b0a09dd');

/*!40000 ALTER TABLE `cphy_fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cphy_fieldlayouttabs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_fieldlayouttabs`;

CREATE TABLE `cphy_fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cphy_fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  KEY `cphy_fieldlayouttabs_layoutId_idx` (`layoutId`),
  CONSTRAINT `cphy_fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `cphy_fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cphy_fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `cphy_fieldlayouttabs` DISABLE KEYS */;

INSERT INTO `cphy_fieldlayouttabs` (`id`, `layoutId`, `name`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(2,1,'Home',1,'2019-03-03 11:11:09','2019-03-03 11:11:09','ee003cd0-4ed5-41c7-b61a-355dbdf42bc3'),
	(6,2,'About',1,'2019-03-03 13:22:30','2019-03-03 13:22:30','ba19e9a4-bfc2-4656-a1c4-6f682d281e5a'),
	(11,3,'Company',1,'2019-03-03 14:49:39','2019-03-03 14:49:39','80c03e99-21bc-4e4f-a4d2-665127debbdc'),
	(12,4,'Homepage',1,'2019-03-03 15:06:49','2019-03-03 15:06:49','24807e6c-3347-4a4d-a342-0c4a7201aa8c'),
	(14,5,'Products',1,'2019-03-03 15:27:02','2019-03-03 15:27:02','4c9bdbe0-83ec-4c8a-92a5-336d089b7796'),
	(15,6,'Content',1,'2019-03-03 15:56:18','2019-03-03 15:56:18','d77f43d5-234a-4293-8400-9135b34be5e7'),
	(16,7,'Content',1,'2019-03-03 15:56:18','2019-03-03 15:56:18','851680fa-ac38-4119-8937-8b3ad4dc9288'),
	(17,8,'Content',1,'2019-03-03 15:56:19','2019-03-03 15:56:19','3df45c81-d796-4527-bc72-80ab92375392'),
	(18,9,'Content',1,'2019-03-03 15:56:20','2019-03-03 15:56:20','dfc2049f-63fc-43e5-bbf0-67e1ca830685'),
	(21,11,'Type',1,'2019-03-03 17:34:16','2019-03-03 17:34:16','2b576cad-275e-4c58-8bf5-0428a8b27f2f'),
	(25,10,'Product',1,'2019-03-04 12:32:17','2019-03-04 12:32:17','4576de9c-dead-48a0-92c2-c281e7b00148');

/*!40000 ALTER TABLE `cphy_fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cphy_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_fields`;

CREATE TABLE `cphy_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cphy_fields_handle_context_unq_idx` (`handle`,`context`),
  KEY `cphy_fields_groupId_idx` (`groupId`),
  KEY `cphy_fields_context_idx` (`context`),
  CONSTRAINT `cphy_fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `cphy_fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cphy_fields` WRITE;
/*!40000 ALTER TABLE `cphy_fields` DISABLE KEYS */;

INSERT INTO `cphy_fields` (`id`, `groupId`, `name`, `handle`, `context`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(3,1,'Body HTML','bodyHtml','global','Limited HTML content editor',1,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"cleanupHtml\":\"1\",\"columnType\":\"text\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\"}','2019-03-03 12:32:41','2019-03-03 12:39:04','5662aa6b-0ca2-4358-911a-64246cbaf912'),
	(4,1,'Text','text','global','',1,'none',NULL,'craft\\fields\\PlainText','{\"charLimit\":\"500\",\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\"}','2019-03-03 12:34:39','2019-03-03 15:11:32','f00afdc4-cf64-49e2-a2f9-be1394891fee'),
	(5,1,'Body Plain','bodyPlain','global','',1,'none',NULL,'craft\\fields\\PlainText','{\"charLimit\":\"\",\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"1\",\"placeholder\":\"\"}','2019-03-03 12:36:07','2019-03-03 12:39:22','8803ee0c-7d81-40eb-9c69-14b0be90dfb7'),
	(6,1,'Page Banner','pageBanner','global','The page\'s large banner image',1,'site',NULL,'craft\\fields\\Assets','{\"allowedKinds\":null,\"defaultUploadLocationSource\":\"volume:c5545297-3c20-42eb-9d7a-6e914b34ecba\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"\",\"localizeRelations\":false,\"restrictFiles\":\"\",\"selectionLabel\":\"\",\"singleUploadLocationSource\":\"volume:c5545297-3c20-42eb-9d7a-6e914b34ecba\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":\"\",\"viewMode\":\"list\"}','2019-03-03 12:37:19','2019-03-03 12:37:19','3beb45b5-1b65-4b56-9530-dca1674ab01e'),
	(7,4,'Blockquote Heading','blockquoteHeading','global','The about page\'s quote heading',1,'none',NULL,'craft\\fields\\PlainText','{\"charLimit\":\"500\",\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\"}','2019-03-03 12:40:25','2019-03-03 12:52:41','7edf7b39-7737-4f87-83e1-6d6bf312ad4d'),
	(8,4,'Blockquote Content','blockquoteContent','global','The blockquote\'s content',1,'none',NULL,'craft\\fields\\PlainText','{\"charLimit\":\"\",\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"1\",\"placeholder\":\"\"}','2019-03-03 12:41:18','2019-03-03 12:41:18','73157979-814e-433c-8213-d8744f299bd6'),
	(9,1,'Image Alt Text','imageAltText','global','The the alt attribute of an image',1,'none',NULL,'craft\\fields\\PlainText','{\"charLimit\":\"\",\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\"}','2019-03-03 12:56:16','2019-03-03 12:56:16','40aa7dd3-251d-4ca0-a822-f150f903c950'),
	(10,5,'Title & Position','titlePosition','global','The staff\'s title and positon',1,'none',NULL,'craft\\fields\\PlainText','{\"charLimit\":\"\",\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\"}','2019-03-03 13:12:46','2019-03-03 13:13:35','e0636c64-ec4a-4ec3-ad06-a1b8f6d892dc'),
	(11,5,'Joined Date','joinedDate','global','The date that the staff joined the company',1,'none',NULL,'craft\\fields\\Date','{\"minuteIncrement\":\"60\",\"showDate\":true,\"showTime\":false}','2019-03-03 13:14:18','2019-03-03 13:14:37','44ae2fbe-0add-4691-9585-412043036bf9'),
	(12,5,'Byline','byline','global','The staff\'s byline or brief description of own personality',1,'none',NULL,'craft\\fields\\PlainText','{\"charLimit\":\"500\",\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"1\",\"placeholder\":\"\"}','2019-03-03 13:16:44','2019-03-03 13:17:06','a12b4642-5e3e-47db-bc0a-46313fc102f8'),
	(13,5,'Profile Image','profileImage','global','',1,'site',NULL,'craft\\fields\\Assets','{\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:4819b2f4-6231-466c-908f-96633885cd58\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"restrictFiles\":\"1\",\"selectionLabel\":\"\",\"singleUploadLocationSource\":\"volume:c5545297-3c20-42eb-9d7a-6e914b34ecba\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":[\"volume:4819b2f4-6231-466c-908f-96633885cd58\"],\"targetSiteId\":null,\"useSingleFolder\":\"\",\"viewMode\":\"large\"}','2019-03-03 13:18:47','2019-03-03 13:23:26','60006ef0-dde8-4e41-be3d-56a93d26b242'),
	(14,5,'Is Founder','isFounder','global','Indicate if staff is company founder',1,'none',NULL,'craft\\fields\\Lightswitch','{\"default\":\"\"}','2019-03-03 13:20:18','2019-03-03 13:20:18','014e6c9d-aafb-4767-a71a-856958d56c3d'),
	(15,4,'About Page Banner','aboutPageBanner','global','',1,'site',NULL,'craft\\fields\\Assets','{\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:c5545297-3c20-42eb-9d7a-6e914b34ecba\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"restrictFiles\":\"1\",\"selectionLabel\":\"\",\"singleUploadLocationSource\":\"volume:c5545297-3c20-42eb-9d7a-6e914b34ecba\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":[\"volume:c5545297-3c20-42eb-9d7a-6e914b34ecba\"],\"targetSiteId\":null,\"useSingleFolder\":\"\",\"viewMode\":\"large\"}','2019-03-03 13:21:29','2019-03-03 13:21:29','c3a35e9b-a1d5-4d28-b978-d6bf59d68e48'),
	(16,5,'Profile Body','profileBody','global','Main content of a staff\'s profile',1,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":[\"4819b2f4-6231-466c-908f-96633885cd58\"],\"cleanupHtml\":\"1\",\"columnType\":\"text\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\"}','2019-03-03 13:26:04','2019-03-03 13:26:04','765f79a6-6214-4cc4-993f-832864ebb97d'),
	(17,5,'Profile Order','profileOrder','global','Sorting order of profiles as it appears on the website.\r\nFor default sorting, set it to zero (0).',1,'none',NULL,'craft\\fields\\Number','{\"decimals\":0,\"defaultValue\":\"0\",\"max\":\"5\",\"min\":\"0\",\"size\":null}','2019-03-03 14:21:39','2019-03-03 14:27:19','f6d740f0-9f36-4bd7-899d-a5a0c219cf77'),
	(19,6,'Product Html','productHtml','global','',1,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":[\"f15fa10d-026b-4f9c-88f5-ca84334c8615\"],\"cleanupHtml\":\"1\",\"columnType\":\"text\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\"}','2019-03-03 15:26:34','2019-03-03 15:28:37','c6258fc4-3e46-4cd8-a367-bd83edca4f7d'),
	(20,6,'Product Banner','productBanner','global','',1,'site',NULL,'craft\\fields\\Assets','{\"allowedKinds\":null,\"defaultUploadLocationSource\":\"volume:f15fa10d-026b-4f9c-88f5-ca84334c8615\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"restrictFiles\":\"\",\"selectionLabel\":\"\",\"singleUploadLocationSource\":\"volume:c5545297-3c20-42eb-9d7a-6e914b34ecba\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":[\"volume:f15fa10d-026b-4f9c-88f5-ca84334c8615\"],\"targetSiteId\":null,\"useSingleFolder\":\"\",\"viewMode\":\"list\"}','2019-03-03 15:37:01','2019-03-03 15:37:01','c506b7ea-fb2d-482c-895c-6314a4b3f804'),
	(21,6,'Tech Stack','techStack','global','The technology stack used in this project / product',1,'none',NULL,'craft\\fields\\Table','{\"addRowLabel\":\"Add tech stack\",\"columnType\":\"text\",\"columns\":{\"col1\":{\"handle\":\"name\",\"heading\":\"Name\",\"type\":\"singleline\",\"width\":\"\"},\"col2\":{\"handle\":\"url\",\"heading\":\"URL\",\"type\":\"singleline\",\"width\":\"\"}},\"defaults\":{\"row1\":{\"col1\":\"\",\"col2\":\"\"}},\"maxRows\":\"\",\"minRows\":\"\"}','2019-03-03 15:40:28','2019-03-03 15:40:28','36e81bca-7d11-444f-a986-5eec1750f2ce'),
	(22,6,'Item Page Content','itemPageContent','global','',1,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_itempagecontent}}\",\"localizeBlocks\":false,\"maxBlocks\":\"\",\"minBlocks\":\"\"}','2019-03-03 15:56:17','2019-03-03 15:56:17','85bce812-c924-4def-99ff-bbacbe7a9ea4'),
	(23,NULL,'Footer','footer','matrixBlockType:52493481-51a0-43af-96b3-4b53761e981b','',1,'none',NULL,'craft\\fields\\PlainText','{\"charLimit\":\"\",\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\"}','2019-03-03 15:56:17','2019-03-03 15:56:17','420243ac-fbf2-484f-908c-7d2151ae2d2e'),
	(24,NULL,'Content Plain','contentPlain','matrixBlockType:52493481-51a0-43af-96b3-4b53761e981b','',1,'none',NULL,'craft\\fields\\PlainText','{\"charLimit\":\"\",\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\"}','2019-03-03 15:56:17','2019-03-03 15:56:17','d2094651-c413-4f5b-9ac0-6f93c734f408'),
	(25,NULL,'Heading','heading','matrixBlockType:52493481-51a0-43af-96b3-4b53761e981b','',1,'none',NULL,'craft\\fields\\PlainText','{\"charLimit\":\"500\",\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\"}','2019-03-03 15:56:17','2019-03-03 15:56:17','d37e608d-7f04-4dbb-8d46-88944718211a'),
	(26,NULL,'Content HTML','contentHtml','matrixBlockType:2af320ff-5d5b-4a55-877a-5372506da01a','Use this field for content that requires custom styling such as headings, bold, etc.',1,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":[\"f15fa10d-026b-4f9c-88f5-ca84334c8615\"],\"cleanupHtml\":\"1\",\"columnType\":\"text\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\"}','2019-03-03 15:56:18','2019-03-03 15:56:18','048f38ba-0760-4cb5-b3b8-7825d5b86dd1'),
	(27,NULL,'Content Plain','contentPlain','matrixBlockType:2af320ff-5d5b-4a55-877a-5372506da01a','Use this field for content that doesn\'t require custom styling',1,'none',NULL,'craft\\fields\\PlainText','{\"charLimit\":\"\",\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"1\",\"placeholder\":\"\"}','2019-03-03 15:56:18','2019-03-03 15:56:18','c521d730-9f7e-4d96-9472-bfe8e4eec946'),
	(28,NULL,'Content Plain','contentPlain','matrixBlockType:dca56809-20bf-4ca7-b883-62e37ef14043','Use this for content that doesn\'t require custom styling',1,'none',NULL,'craft\\fields\\PlainText','{\"charLimit\":\"\",\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"1\",\"placeholder\":\"\"}','2019-03-03 15:56:18','2019-03-03 15:56:18','1d701a98-391c-4436-a2fe-3f83b2e48862'),
	(29,NULL,'Content HTML','contentHtml','matrixBlockType:dca56809-20bf-4ca7-b883-62e37ef14043','Use this field for content that requires custom styling',1,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":[\"f15fa10d-026b-4f9c-88f5-ca84334c8615\"],\"cleanupHtml\":\"1\",\"columnType\":\"text\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\"}','2019-03-03 15:56:19','2019-03-03 15:56:19','c870d54d-fc33-4ae2-9800-2ab919801eb6'),
	(30,NULL,'Heading','heading','matrixBlockType:dca56809-20bf-4ca7-b883-62e37ef14043','',1,'none',NULL,'craft\\fields\\PlainText','{\"charLimit\":\"\",\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\"}','2019-03-03 15:56:19','2019-03-03 15:56:19','fcaeff1b-3048-480e-aaab-d1c500c29e5e'),
	(31,NULL,'Heading','heading','matrixBlockType:166feb77-b689-48b2-8495-8a3b13d38d9b','',1,'none',NULL,'craft\\fields\\PlainText','{\"charLimit\":\"\",\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\"}','2019-03-03 15:56:19','2019-03-03 15:56:19','0fc569f5-5ffa-4aee-8990-37eaa0954947'),
	(32,NULL,'Side Image','sideImage','matrixBlockType:166feb77-b689-48b2-8495-8a3b13d38d9b','',1,'site',NULL,'craft\\fields\\Assets','{\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:c5545297-3c20-42eb-9d7a-6e914b34ecba\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"restrictFiles\":\"1\",\"selectionLabel\":\"\",\"singleUploadLocationSource\":\"volume:f15fa10d-026b-4f9c-88f5-ca84334c8615\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":[\"volume:f15fa10d-026b-4f9c-88f5-ca84334c8615\"],\"targetSiteId\":null,\"useSingleFolder\":\"1\",\"viewMode\":\"large\"}','2019-03-03 15:56:19','2019-03-03 15:56:19','5d0f499d-bd68-4430-9386-f35e34a4c4f6'),
	(33,NULL,'Content HTML','contentHtml','matrixBlockType:166feb77-b689-48b2-8495-8a3b13d38d9b','Use this field for content that requires custom styling',1,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":[\"f15fa10d-026b-4f9c-88f5-ca84334c8615\"],\"cleanupHtml\":\"1\",\"columnType\":\"text\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\"}','2019-03-03 15:56:19','2019-03-03 15:56:19','6a67a240-9924-4d96-b17d-02f667935966'),
	(34,NULL,'Content Plain','contentPlain','matrixBlockType:166feb77-b689-48b2-8495-8a3b13d38d9b','Use this field for content that doesn\'t require custom styling',1,'none',NULL,'craft\\fields\\PlainText','{\"charLimit\":\"\",\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\"}','2019-03-03 15:56:20','2019-03-03 15:56:20','98acfc9c-7e3a-4915-93ca-54de64963128'),
	(35,6,'Featured','isFeatured','global','',1,'none',NULL,'craft\\fields\\Lightswitch','{\"default\":\"\"}','2019-03-03 16:18:29','2019-03-03 16:18:29','91eb4bde-939b-40e4-9fe7-9e06a48b7c20'),
	(36,6,'Product Type Description','typeDescription','global','',1,'none',NULL,'craft\\fields\\PlainText','{\"charLimit\":\"500\",\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\"}','2019-03-03 17:30:05','2019-03-03 17:30:05','457bdcc8-9ea6-4e86-b048-8cd07a773da6'),
	(37,6,'Product Type Icon','typeIcon','global','The icon of the product type',1,'none',NULL,'craft\\fields\\PlainText','{\"charLimit\":\"500\",\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\"}','2019-03-03 17:33:46','2019-03-03 17:33:46','9360a1ff-4255-42fa-a58e-b9de94db9098'),
	(38,1,'Product Types','productTypes','global','',1,'site',NULL,'craft\\fields\\Categories','{\"branchLimit\":\"5\",\"limit\":null,\"localizeRelations\":false,\"selectionLabel\":\"Add a product type\",\"source\":\"group:c46db0a2-6965-486d-893f-effff9b4b4f1\",\"sources\":\"*\",\"targetSiteId\":null,\"viewMode\":null}','2019-03-03 17:36:34','2019-03-03 17:44:38','4e3b0fd7-0344-47a9-9019-0791d342c2c0'),
	(39,6,'Product Description','productDescription','global','',1,'none',NULL,'craft\\fields\\PlainText','{\"charLimit\":\"500\",\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\"}','2019-03-03 17:54:31','2019-03-03 17:54:31','dffa1967-b783-4747-82e2-23d1b23371b9'),
	(40,6,'Product Tagline','productTagline','global','',1,'none',NULL,'craft\\fields\\PlainText','{\"charLimit\":\"500\",\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\"}','2019-03-04 12:31:11','2019-03-04 12:31:11','ada36bad-7416-4fc6-b7b1-823fbaeff868');

/*!40000 ALTER TABLE `cphy_fields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cphy_globalsets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_globalsets`;

CREATE TABLE `cphy_globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cphy_globalsets_name_unq_idx` (`name`),
  UNIQUE KEY `cphy_globalsets_handle_unq_idx` (`handle`),
  KEY `cphy_globalsets_fieldLayoutId_idx` (`fieldLayoutId`),
  CONSTRAINT `cphy_globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `cphy_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `cphy_globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `cphy_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table cphy_info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_info`;

CREATE TABLE `cphy_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `config` mediumtext,
  `configMap` mediumtext,
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cphy_info` WRITE;
/*!40000 ALTER TABLE `cphy_info` DISABLE KEYS */;

INSERT INTO `cphy_info` (`id`, `version`, `schemaVersion`, `maintenance`, `config`, `configMap`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'3.1.16','3.1.25',0,'a:14:{s:14:\"categoryGroups\";a:1:{s:36:\"c46db0a2-6965-486d-893f-effff9b4b4f1\";a:5:{s:12:\"fieldLayouts\";a:1:{s:36:\"b4276dd1-febe-4064-863a-e6d53b0a09dd\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:6:\"fields\";a:2:{s:36:\"457bdcc8-9ea6-4e86-b048-8cd07a773da6\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}s:36:\"9360a1ff-4255-42fa-a58e-b9de94db9098\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:2;}}s:4:\"name\";s:4:\"Type\";s:9:\"sortOrder\";i:1;}}}}s:6:\"handle\";s:12:\"productTypes\";s:4:\"name\";s:13:\"Product Types\";s:12:\"siteSettings\";a:1:{s:36:\"e2d75038-c4ed-417b-8edb-5a1037eaf3b0\";a:3:{s:7:\"hasUrls\";b:1;s:8:\"template\";s:23:\"products/_category.twig\";s:9:\"uriFormat\";s:20:\"product-types/{slug}\";}}s:9:\"structure\";a:2:{s:9:\"maxLevels\";s:1:\"2\";s:3:\"uid\";s:36:\"c911fe41-25c1-4e8b-92fd-275a7a5556a1\";}}}s:12:\"dateModified\";i:1551853293;s:5:\"email\";a:3:{s:9:\"fromEmail\";s:21:\"comphanny@example.com\";s:8:\"fromName\";s:9:\"Comphanny\";s:13:\"transportType\";s:37:\"craft\\mail\\transportadapters\\Sendmail\";}s:11:\"fieldGroups\";a:4:{s:36:\"11a4c139-08e0-4f50-a680-fe62292fe16b\";a:1:{s:4:\"name\";s:7:\"Company\";}s:36:\"3da128c7-3dde-466a-a522-34f005de8634\";a:1:{s:4:\"name\";s:7:\"Product\";}s:36:\"b882c19e-9c8f-4b94-a6e8-d98af21f6caf\";a:1:{s:4:\"name\";s:5:\"About\";}s:36:\"fd1f04b0-5c66-4a29-8d77-84e8361d1292\";a:1:{s:4:\"name\";s:6:\"Common\";}}s:6:\"fields\";a:25:{s:36:\"014e6c9d-aafb-4767-a71a-856958d56c3d\";a:10:{s:17:\"contentColumnType\";s:7:\"boolean\";s:10:\"fieldGroup\";s:36:\"11a4c139-08e0-4f50-a680-fe62292fe16b\";s:6:\"handle\";s:9:\"isFounder\";s:12:\"instructions\";s:36:\"Indicate if staff is company founder\";s:4:\"name\";s:10:\"Is Founder\";s:10:\"searchable\";b:1;s:8:\"settings\";a:1:{s:7:\"default\";s:0:\"\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"none\";s:4:\"type\";s:24:\"craft\\fields\\Lightswitch\";}s:36:\"36e81bca-7d11-444f-a986-5eec1750f2ce\";a:10:{s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"3da128c7-3dde-466a-a522-34f005de8634\";s:6:\"handle\";s:9:\"techStack\";s:12:\"instructions\";s:51:\"The technology stack used in this project / product\";s:4:\"name\";s:10:\"Tech Stack\";s:10:\"searchable\";b:1;s:8:\"settings\";a:6:{s:11:\"addRowLabel\";s:14:\"Add tech stack\";s:10:\"columnType\";s:4:\"text\";s:7:\"columns\";a:2:{s:4:\"col1\";a:4:{s:6:\"handle\";s:4:\"name\";s:7:\"heading\";s:4:\"Name\";s:4:\"type\";s:10:\"singleline\";s:5:\"width\";s:0:\"\";}s:4:\"col2\";a:4:{s:6:\"handle\";s:3:\"url\";s:7:\"heading\";s:3:\"URL\";s:4:\"type\";s:10:\"singleline\";s:5:\"width\";s:0:\"\";}}s:8:\"defaults\";a:1:{s:4:\"row1\";a:2:{s:4:\"col1\";s:0:\"\";s:4:\"col2\";s:0:\"\";}}s:7:\"maxRows\";s:0:\"\";s:7:\"minRows\";s:0:\"\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"none\";s:4:\"type\";s:18:\"craft\\fields\\Table\";}s:36:\"3beb45b5-1b65-4b56-9530-dca1674ab01e\";a:10:{s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";s:36:\"fd1f04b0-5c66-4a29-8d77-84e8361d1292\";s:6:\"handle\";s:10:\"pageBanner\";s:12:\"instructions\";s:29:\"The page\'s large banner image\";s:4:\"name\";s:11:\"Page Banner\";s:10:\"searchable\";b:1;s:8:\"settings\";a:14:{s:12:\"allowedKinds\";N;s:27:\"defaultUploadLocationSource\";s:43:\"volume:c5545297-3c20-42eb-9d7a-6e914b34ecba\";s:28:\"defaultUploadLocationSubpath\";s:0:\"\";s:5:\"limit\";s:0:\"\";s:17:\"localizeRelations\";b:0;s:13:\"restrictFiles\";s:0:\"\";s:14:\"selectionLabel\";s:0:\"\";s:26:\"singleUploadLocationSource\";s:43:\"volume:c5545297-3c20-42eb-9d7a-6e914b34ecba\";s:27:\"singleUploadLocationSubpath\";s:0:\"\";s:6:\"source\";N;s:7:\"sources\";s:1:\"*\";s:12:\"targetSiteId\";N;s:15:\"useSingleFolder\";s:0:\"\";s:8:\"viewMode\";s:4:\"list\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"site\";s:4:\"type\";s:19:\"craft\\fields\\Assets\";}s:36:\"40aa7dd3-251d-4ca0-a822-f150f903c950\";a:10:{s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"fd1f04b0-5c66-4a29-8d77-84e8361d1292\";s:6:\"handle\";s:12:\"imageAltText\";s:12:\"instructions\";s:33:\"The the alt attribute of an image\";s:4:\"name\";s:14:\"Image Alt Text\";s:10:\"searchable\";b:1;s:8:\"settings\";a:6:{s:9:\"charLimit\";s:0:\"\";s:4:\"code\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";s:11:\"initialRows\";s:1:\"4\";s:9:\"multiline\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"none\";s:4:\"type\";s:22:\"craft\\fields\\PlainText\";}s:36:\"44ae2fbe-0add-4691-9585-412043036bf9\";a:10:{s:17:\"contentColumnType\";s:8:\"datetime\";s:10:\"fieldGroup\";s:36:\"11a4c139-08e0-4f50-a680-fe62292fe16b\";s:6:\"handle\";s:10:\"joinedDate\";s:12:\"instructions\";s:42:\"The date that the staff joined the company\";s:4:\"name\";s:11:\"Joined Date\";s:10:\"searchable\";b:1;s:8:\"settings\";a:3:{s:15:\"minuteIncrement\";s:2:\"60\";s:8:\"showDate\";b:1;s:8:\"showTime\";b:0;}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"none\";s:4:\"type\";s:17:\"craft\\fields\\Date\";}s:36:\"457bdcc8-9ea6-4e86-b048-8cd07a773da6\";a:10:{s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"3da128c7-3dde-466a-a522-34f005de8634\";s:6:\"handle\";s:15:\"typeDescription\";s:12:\"instructions\";s:0:\"\";s:4:\"name\";s:24:\"Product Type Description\";s:10:\"searchable\";b:1;s:8:\"settings\";a:6:{s:9:\"charLimit\";s:3:\"500\";s:4:\"code\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";s:11:\"initialRows\";s:1:\"4\";s:9:\"multiline\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"none\";s:4:\"type\";s:22:\"craft\\fields\\PlainText\";}s:36:\"4e3b0fd7-0344-47a9-9019-0791d342c2c0\";a:10:{s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";s:36:\"fd1f04b0-5c66-4a29-8d77-84e8361d1292\";s:6:\"handle\";s:12:\"productTypes\";s:12:\"instructions\";s:0:\"\";s:4:\"name\";s:13:\"Product Types\";s:10:\"searchable\";b:1;s:8:\"settings\";a:8:{s:11:\"branchLimit\";s:1:\"5\";s:5:\"limit\";N;s:17:\"localizeRelations\";b:0;s:14:\"selectionLabel\";s:18:\"Add a product type\";s:6:\"source\";s:42:\"group:c46db0a2-6965-486d-893f-effff9b4b4f1\";s:7:\"sources\";s:1:\"*\";s:12:\"targetSiteId\";N;s:8:\"viewMode\";N;}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"site\";s:4:\"type\";s:23:\"craft\\fields\\Categories\";}s:36:\"5662aa6b-0ca2-4358-911a-64246cbaf912\";a:10:{s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"fd1f04b0-5c66-4a29-8d77-84e8361d1292\";s:6:\"handle\";s:8:\"bodyHtml\";s:12:\"instructions\";s:27:\"Limited HTML content editor\";s:4:\"name\";s:9:\"Body HTML\";s:10:\"searchable\";b:1;s:8:\"settings\";a:7:{s:19:\"availableTransforms\";s:1:\"*\";s:16:\"availableVolumes\";s:1:\"*\";s:11:\"cleanupHtml\";s:1:\"1\";s:10:\"columnType\";s:4:\"text\";s:14:\"purifierConfig\";s:0:\"\";s:10:\"purifyHtml\";s:1:\"1\";s:14:\"redactorConfig\";s:0:\"\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"none\";s:4:\"type\";s:20:\"craft\\redactor\\Field\";}s:36:\"60006ef0-dde8-4e41-be3d-56a93d26b242\";a:10:{s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";s:36:\"11a4c139-08e0-4f50-a680-fe62292fe16b\";s:6:\"handle\";s:12:\"profileImage\";s:12:\"instructions\";s:0:\"\";s:4:\"name\";s:13:\"Profile Image\";s:10:\"searchable\";b:1;s:8:\"settings\";a:14:{s:12:\"allowedKinds\";a:1:{i:0;s:5:\"image\";}s:27:\"defaultUploadLocationSource\";s:43:\"volume:4819b2f4-6231-466c-908f-96633885cd58\";s:28:\"defaultUploadLocationSubpath\";s:0:\"\";s:5:\"limit\";s:1:\"1\";s:17:\"localizeRelations\";b:0;s:13:\"restrictFiles\";s:1:\"1\";s:14:\"selectionLabel\";s:0:\"\";s:26:\"singleUploadLocationSource\";s:43:\"volume:c5545297-3c20-42eb-9d7a-6e914b34ecba\";s:27:\"singleUploadLocationSubpath\";s:0:\"\";s:6:\"source\";N;s:7:\"sources\";a:1:{i:0;s:43:\"volume:4819b2f4-6231-466c-908f-96633885cd58\";}s:12:\"targetSiteId\";N;s:15:\"useSingleFolder\";s:0:\"\";s:8:\"viewMode\";s:5:\"large\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"site\";s:4:\"type\";s:19:\"craft\\fields\\Assets\";}s:36:\"73157979-814e-433c-8213-d8744f299bd6\";a:10:{s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"b882c19e-9c8f-4b94-a6e8-d98af21f6caf\";s:6:\"handle\";s:17:\"blockquoteContent\";s:12:\"instructions\";s:24:\"The blockquote\'s content\";s:4:\"name\";s:18:\"Blockquote Content\";s:10:\"searchable\";b:1;s:8:\"settings\";a:6:{s:9:\"charLimit\";s:0:\"\";s:4:\"code\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";s:11:\"initialRows\";s:1:\"4\";s:9:\"multiline\";s:1:\"1\";s:11:\"placeholder\";s:0:\"\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"none\";s:4:\"type\";s:22:\"craft\\fields\\PlainText\";}s:36:\"765f79a6-6214-4cc4-993f-832864ebb97d\";a:10:{s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"11a4c139-08e0-4f50-a680-fe62292fe16b\";s:6:\"handle\";s:11:\"profileBody\";s:12:\"instructions\";s:33:\"Main content of a staff\'s profile\";s:4:\"name\";s:12:\"Profile Body\";s:10:\"searchable\";b:1;s:8:\"settings\";a:7:{s:19:\"availableTransforms\";s:1:\"*\";s:16:\"availableVolumes\";a:1:{i:0;s:36:\"4819b2f4-6231-466c-908f-96633885cd58\";}s:11:\"cleanupHtml\";s:1:\"1\";s:10:\"columnType\";s:4:\"text\";s:14:\"purifierConfig\";s:0:\"\";s:10:\"purifyHtml\";s:1:\"1\";s:14:\"redactorConfig\";s:0:\"\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"none\";s:4:\"type\";s:20:\"craft\\redactor\\Field\";}s:36:\"7edf7b39-7737-4f87-83e1-6d6bf312ad4d\";a:10:{s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"b882c19e-9c8f-4b94-a6e8-d98af21f6caf\";s:6:\"handle\";s:17:\"blockquoteHeading\";s:12:\"instructions\";s:30:\"The about page\'s quote heading\";s:4:\"name\";s:18:\"Blockquote Heading\";s:10:\"searchable\";b:1;s:8:\"settings\";a:6:{s:9:\"charLimit\";s:3:\"500\";s:4:\"code\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";s:11:\"initialRows\";s:1:\"4\";s:9:\"multiline\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"none\";s:4:\"type\";s:22:\"craft\\fields\\PlainText\";}s:36:\"85bce812-c924-4def-99ff-bbacbe7a9ea4\";a:10:{s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";s:36:\"3da128c7-3dde-466a-a522-34f005de8634\";s:6:\"handle\";s:15:\"itemPageContent\";s:12:\"instructions\";s:0:\"\";s:4:\"name\";s:17:\"Item Page Content\";s:10:\"searchable\";b:1;s:8:\"settings\";a:4:{s:12:\"contentTable\";s:34:\"{{%matrixcontent_itempagecontent}}\";s:14:\"localizeBlocks\";b:0;s:9:\"maxBlocks\";s:0:\"\";s:9:\"minBlocks\";s:0:\"\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"site\";s:4:\"type\";s:19:\"craft\\fields\\Matrix\";}s:36:\"8803ee0c-7d81-40eb-9c69-14b0be90dfb7\";a:10:{s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"fd1f04b0-5c66-4a29-8d77-84e8361d1292\";s:6:\"handle\";s:9:\"bodyPlain\";s:12:\"instructions\";s:0:\"\";s:4:\"name\";s:10:\"Body Plain\";s:10:\"searchable\";b:1;s:8:\"settings\";a:6:{s:9:\"charLimit\";s:0:\"\";s:4:\"code\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";s:11:\"initialRows\";s:1:\"4\";s:9:\"multiline\";s:1:\"1\";s:11:\"placeholder\";s:0:\"\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"none\";s:4:\"type\";s:22:\"craft\\fields\\PlainText\";}s:36:\"91eb4bde-939b-40e4-9fe7-9e06a48b7c20\";a:10:{s:17:\"contentColumnType\";s:7:\"boolean\";s:10:\"fieldGroup\";s:36:\"3da128c7-3dde-466a-a522-34f005de8634\";s:6:\"handle\";s:10:\"isFeatured\";s:12:\"instructions\";s:0:\"\";s:4:\"name\";s:8:\"Featured\";s:10:\"searchable\";b:1;s:8:\"settings\";a:1:{s:7:\"default\";s:0:\"\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"none\";s:4:\"type\";s:24:\"craft\\fields\\Lightswitch\";}s:36:\"9360a1ff-4255-42fa-a58e-b9de94db9098\";a:10:{s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"3da128c7-3dde-466a-a522-34f005de8634\";s:6:\"handle\";s:8:\"typeIcon\";s:12:\"instructions\";s:28:\"The icon of the product type\";s:4:\"name\";s:17:\"Product Type Icon\";s:10:\"searchable\";b:1;s:8:\"settings\";a:6:{s:9:\"charLimit\";s:3:\"500\";s:4:\"code\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";s:11:\"initialRows\";s:1:\"4\";s:9:\"multiline\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"none\";s:4:\"type\";s:22:\"craft\\fields\\PlainText\";}s:36:\"a12b4642-5e3e-47db-bc0a-46313fc102f8\";a:10:{s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"11a4c139-08e0-4f50-a680-fe62292fe16b\";s:6:\"handle\";s:6:\"byline\";s:12:\"instructions\";s:58:\"The staff\'s byline or brief description of own personality\";s:4:\"name\";s:6:\"Byline\";s:10:\"searchable\";b:1;s:8:\"settings\";a:6:{s:9:\"charLimit\";s:3:\"500\";s:4:\"code\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";s:11:\"initialRows\";s:1:\"4\";s:9:\"multiline\";s:1:\"1\";s:11:\"placeholder\";s:0:\"\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"none\";s:4:\"type\";s:22:\"craft\\fields\\PlainText\";}s:36:\"ada36bad-7416-4fc6-b7b1-823fbaeff868\";a:10:{s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"3da128c7-3dde-466a-a522-34f005de8634\";s:6:\"handle\";s:14:\"productTagline\";s:12:\"instructions\";s:0:\"\";s:4:\"name\";s:15:\"Product Tagline\";s:10:\"searchable\";b:1;s:8:\"settings\";a:6:{s:9:\"charLimit\";s:3:\"500\";s:4:\"code\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";s:11:\"initialRows\";s:1:\"4\";s:9:\"multiline\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"none\";s:4:\"type\";s:22:\"craft\\fields\\PlainText\";}s:36:\"c3a35e9b-a1d5-4d28-b978-d6bf59d68e48\";a:10:{s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";s:36:\"b882c19e-9c8f-4b94-a6e8-d98af21f6caf\";s:6:\"handle\";s:15:\"aboutPageBanner\";s:12:\"instructions\";s:0:\"\";s:4:\"name\";s:17:\"About Page Banner\";s:10:\"searchable\";b:1;s:8:\"settings\";a:14:{s:12:\"allowedKinds\";a:1:{i:0;s:5:\"image\";}s:27:\"defaultUploadLocationSource\";s:43:\"volume:c5545297-3c20-42eb-9d7a-6e914b34ecba\";s:28:\"defaultUploadLocationSubpath\";s:0:\"\";s:5:\"limit\";s:1:\"1\";s:17:\"localizeRelations\";b:0;s:13:\"restrictFiles\";s:1:\"1\";s:14:\"selectionLabel\";s:0:\"\";s:26:\"singleUploadLocationSource\";s:43:\"volume:c5545297-3c20-42eb-9d7a-6e914b34ecba\";s:27:\"singleUploadLocationSubpath\";s:0:\"\";s:6:\"source\";N;s:7:\"sources\";a:1:{i:0;s:43:\"volume:c5545297-3c20-42eb-9d7a-6e914b34ecba\";}s:12:\"targetSiteId\";N;s:15:\"useSingleFolder\";s:0:\"\";s:8:\"viewMode\";s:5:\"large\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"site\";s:4:\"type\";s:19:\"craft\\fields\\Assets\";}s:36:\"c506b7ea-fb2d-482c-895c-6314a4b3f804\";a:10:{s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";s:36:\"3da128c7-3dde-466a-a522-34f005de8634\";s:6:\"handle\";s:13:\"productBanner\";s:12:\"instructions\";s:0:\"\";s:4:\"name\";s:14:\"Product Banner\";s:10:\"searchable\";b:1;s:8:\"settings\";a:14:{s:12:\"allowedKinds\";N;s:27:\"defaultUploadLocationSource\";s:43:\"volume:f15fa10d-026b-4f9c-88f5-ca84334c8615\";s:28:\"defaultUploadLocationSubpath\";s:0:\"\";s:5:\"limit\";s:1:\"1\";s:17:\"localizeRelations\";b:0;s:13:\"restrictFiles\";s:0:\"\";s:14:\"selectionLabel\";s:0:\"\";s:26:\"singleUploadLocationSource\";s:43:\"volume:c5545297-3c20-42eb-9d7a-6e914b34ecba\";s:27:\"singleUploadLocationSubpath\";s:0:\"\";s:6:\"source\";N;s:7:\"sources\";a:1:{i:0;s:43:\"volume:f15fa10d-026b-4f9c-88f5-ca84334c8615\";}s:12:\"targetSiteId\";N;s:15:\"useSingleFolder\";s:0:\"\";s:8:\"viewMode\";s:4:\"list\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"site\";s:4:\"type\";s:19:\"craft\\fields\\Assets\";}s:36:\"c6258fc4-3e46-4cd8-a367-bd83edca4f7d\";a:10:{s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"3da128c7-3dde-466a-a522-34f005de8634\";s:6:\"handle\";s:11:\"productHtml\";s:12:\"instructions\";s:0:\"\";s:4:\"name\";s:12:\"Product Html\";s:10:\"searchable\";b:1;s:8:\"settings\";a:7:{s:19:\"availableTransforms\";s:1:\"*\";s:16:\"availableVolumes\";a:1:{i:0;s:36:\"f15fa10d-026b-4f9c-88f5-ca84334c8615\";}s:11:\"cleanupHtml\";s:1:\"1\";s:10:\"columnType\";s:4:\"text\";s:14:\"purifierConfig\";s:0:\"\";s:10:\"purifyHtml\";s:1:\"1\";s:14:\"redactorConfig\";s:0:\"\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"none\";s:4:\"type\";s:20:\"craft\\redactor\\Field\";}s:36:\"dffa1967-b783-4747-82e2-23d1b23371b9\";a:10:{s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"3da128c7-3dde-466a-a522-34f005de8634\";s:6:\"handle\";s:18:\"productDescription\";s:12:\"instructions\";s:0:\"\";s:4:\"name\";s:19:\"Product Description\";s:10:\"searchable\";b:1;s:8:\"settings\";a:6:{s:9:\"charLimit\";s:3:\"500\";s:4:\"code\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";s:11:\"initialRows\";s:1:\"4\";s:9:\"multiline\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"none\";s:4:\"type\";s:22:\"craft\\fields\\PlainText\";}s:36:\"e0636c64-ec4a-4ec3-ad06-a1b8f6d892dc\";a:10:{s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"11a4c139-08e0-4f50-a680-fe62292fe16b\";s:6:\"handle\";s:13:\"titlePosition\";s:12:\"instructions\";s:29:\"The staff\'s title and positon\";s:4:\"name\";s:16:\"Title & Position\";s:10:\"searchable\";b:1;s:8:\"settings\";a:6:{s:9:\"charLimit\";s:0:\"\";s:4:\"code\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";s:11:\"initialRows\";s:1:\"4\";s:9:\"multiline\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"none\";s:4:\"type\";s:22:\"craft\\fields\\PlainText\";}s:36:\"f00afdc4-cf64-49e2-a2f9-be1394891fee\";a:10:{s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"fd1f04b0-5c66-4a29-8d77-84e8361d1292\";s:6:\"handle\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:4:\"name\";s:4:\"Text\";s:10:\"searchable\";b:1;s:8:\"settings\";a:6:{s:9:\"charLimit\";s:3:\"500\";s:4:\"code\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";s:11:\"initialRows\";s:1:\"4\";s:9:\"multiline\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"none\";s:4:\"type\";s:22:\"craft\\fields\\PlainText\";}s:36:\"f6d740f0-9f36-4bd7-899d-a5a0c219cf77\";a:10:{s:17:\"contentColumnType\";s:11:\"smallint(1)\";s:10:\"fieldGroup\";s:36:\"11a4c139-08e0-4f50-a680-fe62292fe16b\";s:6:\"handle\";s:12:\"profileOrder\";s:12:\"instructions\";s:97:\"Sorting order of profiles as it appears on the website.\r\nFor default sorting, set it to zero (0).\";s:4:\"name\";s:13:\"Profile Order\";s:10:\"searchable\";b:1;s:8:\"settings\";a:5:{s:8:\"decimals\";i:0;s:12:\"defaultValue\";s:1:\"0\";s:3:\"max\";s:1:\"5\";s:3:\"min\";s:1:\"0\";s:4:\"size\";N;}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"none\";s:4:\"type\";s:19:\"craft\\fields\\Number\";}}s:15:\"imageTransforms\";a:5:{s:36:\"3b5b0809-6c19-439f-949a-64e023128ad7\";a:9:{s:6:\"format\";N;s:6:\"handle\";s:13:\"thumbBannerSm\";s:6:\"height\";s:3:\"195\";s:9:\"interlace\";s:4:\"none\";s:4:\"mode\";s:4:\"crop\";s:4:\"name\";s:18:\"Thumb Banner Small\";s:8:\"position\";s:13:\"center-center\";s:7:\"quality\";N;s:5:\"width\";s:3:\"347\";}s:36:\"65cdef0b-c238-4005-b65a-4ba831221824\";a:9:{s:6:\"format\";N;s:6:\"handle\";s:11:\"thumbBanner\";s:6:\"height\";s:3:\"302\";s:9:\"interlace\";s:4:\"none\";s:4:\"mode\";s:4:\"crop\";s:4:\"name\";s:12:\"Thumb Banner\";s:8:\"position\";s:13:\"center-center\";s:7:\"quality\";N;s:5:\"width\";s:3:\"538\";}s:36:\"9df14a11-c54f-4004-8019-0a59a11ba789\";a:9:{s:6:\"format\";N;s:6:\"handle\";s:11:\"cardThumbSm\";s:6:\"height\";s:3:\"155\";s:9:\"interlace\";s:4:\"none\";s:4:\"mode\";s:4:\"crop\";s:4:\"name\";s:16:\"Card Thumb Small\";s:8:\"position\";s:13:\"center-center\";s:7:\"quality\";N;s:5:\"width\";s:3:\"116\";}s:36:\"aabb7f35-70e2-44b9-8ddb-d76430265137\";a:9:{s:6:\"format\";N;s:6:\"handle\";s:11:\"cardThumbLg\";s:6:\"height\";s:3:\"276\";s:9:\"interlace\";s:4:\"none\";s:4:\"mode\";s:4:\"crop\";s:4:\"name\";s:16:\"Card Thumb Large\";s:8:\"position\";s:13:\"center-center\";s:7:\"quality\";N;s:5:\"width\";s:3:\"369\";}s:36:\"e8607822-82c3-45da-9ff0-d610e946101f\";a:9:{s:6:\"format\";N;s:6:\"handle\";s:10:\"pageBanner\";s:6:\"height\";s:3:\"624\";s:9:\"interlace\";s:4:\"none\";s:4:\"mode\";s:4:\"crop\";s:4:\"name\";s:11:\"Page Banner\";s:8:\"position\";s:13:\"center-center\";s:7:\"quality\";N;s:5:\"width\";s:4:\"1110\";}}s:16:\"matrixBlockTypes\";a:4:{s:36:\"166feb77-b689-48b2-8495-8a3b13d38d9b\";a:6:{s:5:\"field\";s:36:\"85bce812-c924-4def-99ff-bbacbe7a9ea4\";s:12:\"fieldLayouts\";a:1:{s:36:\"8f69a596-1140-459c-a361-2298cbad2e31\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:6:\"fields\";a:4:{s:36:\"0fc569f5-5ffa-4aee-8990-37eaa0954947\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}s:36:\"5d0f499d-bd68-4430-9386-f35e34a4c4f6\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:2;}s:36:\"6a67a240-9924-4d96-b17d-02f667935966\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:3;}s:36:\"98acfc9c-7e3a-4915-93ca-54de64963128\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:4;}}s:4:\"name\";s:7:\"Content\";s:9:\"sortOrder\";i:1;}}}}s:6:\"fields\";a:4:{s:36:\"0fc569f5-5ffa-4aee-8990-37eaa0954947\";a:10:{s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";N;s:6:\"handle\";s:7:\"heading\";s:12:\"instructions\";s:0:\"\";s:4:\"name\";s:7:\"Heading\";s:10:\"searchable\";b:1;s:8:\"settings\";a:6:{s:9:\"charLimit\";s:0:\"\";s:4:\"code\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";s:11:\"initialRows\";s:1:\"4\";s:9:\"multiline\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"none\";s:4:\"type\";s:22:\"craft\\fields\\PlainText\";}s:36:\"5d0f499d-bd68-4430-9386-f35e34a4c4f6\";a:10:{s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";N;s:6:\"handle\";s:9:\"sideImage\";s:12:\"instructions\";s:0:\"\";s:4:\"name\";s:10:\"Side Image\";s:10:\"searchable\";b:1;s:8:\"settings\";a:14:{s:12:\"allowedKinds\";a:1:{i:0;s:5:\"image\";}s:27:\"defaultUploadLocationSource\";s:43:\"volume:c5545297-3c20-42eb-9d7a-6e914b34ecba\";s:28:\"defaultUploadLocationSubpath\";s:0:\"\";s:5:\"limit\";s:1:\"1\";s:17:\"localizeRelations\";b:0;s:13:\"restrictFiles\";s:1:\"1\";s:14:\"selectionLabel\";s:0:\"\";s:26:\"singleUploadLocationSource\";s:43:\"volume:f15fa10d-026b-4f9c-88f5-ca84334c8615\";s:27:\"singleUploadLocationSubpath\";s:0:\"\";s:6:\"source\";N;s:7:\"sources\";a:1:{i:0;s:43:\"volume:f15fa10d-026b-4f9c-88f5-ca84334c8615\";}s:12:\"targetSiteId\";N;s:15:\"useSingleFolder\";s:1:\"1\";s:8:\"viewMode\";s:5:\"large\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"site\";s:4:\"type\";s:19:\"craft\\fields\\Assets\";}s:36:\"6a67a240-9924-4d96-b17d-02f667935966\";a:10:{s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";N;s:6:\"handle\";s:11:\"contentHtml\";s:12:\"instructions\";s:55:\"Use this field for content that requires custom styling\";s:4:\"name\";s:12:\"Content HTML\";s:10:\"searchable\";b:1;s:8:\"settings\";a:7:{s:19:\"availableTransforms\";s:1:\"*\";s:16:\"availableVolumes\";a:1:{i:0;s:36:\"f15fa10d-026b-4f9c-88f5-ca84334c8615\";}s:11:\"cleanupHtml\";s:1:\"1\";s:10:\"columnType\";s:4:\"text\";s:14:\"purifierConfig\";s:0:\"\";s:10:\"purifyHtml\";s:1:\"1\";s:14:\"redactorConfig\";s:0:\"\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"none\";s:4:\"type\";s:20:\"craft\\redactor\\Field\";}s:36:\"98acfc9c-7e3a-4915-93ca-54de64963128\";a:10:{s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";N;s:6:\"handle\";s:12:\"contentPlain\";s:12:\"instructions\";s:62:\"Use this field for content that doesn\'t require custom styling\";s:4:\"name\";s:13:\"Content Plain\";s:10:\"searchable\";b:1;s:8:\"settings\";a:6:{s:9:\"charLimit\";s:0:\"\";s:4:\"code\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";s:11:\"initialRows\";s:1:\"4\";s:9:\"multiline\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"none\";s:4:\"type\";s:22:\"craft\\fields\\PlainText\";}}s:6:\"handle\";s:9:\"cardImage\";s:4:\"name\";s:10:\"Image Card\";s:9:\"sortOrder\";i:4;}s:36:\"2af320ff-5d5b-4a55-877a-5372506da01a\";a:6:{s:5:\"field\";s:36:\"85bce812-c924-4def-99ff-bbacbe7a9ea4\";s:12:\"fieldLayouts\";a:1:{s:36:\"720b050f-66e7-464b-8714-278f3cbf70b2\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:6:\"fields\";a:2:{s:36:\"048f38ba-0760-4cb5-b3b8-7825d5b86dd1\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:2;}s:36:\"c521d730-9f7e-4d96-9472-bfe8e4eec946\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}}s:4:\"name\";s:7:\"Content\";s:9:\"sortOrder\";i:1;}}}}s:6:\"fields\";a:2:{s:36:\"048f38ba-0760-4cb5-b3b8-7825d5b86dd1\";a:10:{s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";N;s:6:\"handle\";s:11:\"contentHtml\";s:12:\"instructions\";s:84:\"Use this field for content that requires custom styling such as headings, bold, etc.\";s:4:\"name\";s:12:\"Content HTML\";s:10:\"searchable\";b:1;s:8:\"settings\";a:7:{s:19:\"availableTransforms\";s:1:\"*\";s:16:\"availableVolumes\";a:1:{i:0;s:36:\"f15fa10d-026b-4f9c-88f5-ca84334c8615\";}s:11:\"cleanupHtml\";s:1:\"1\";s:10:\"columnType\";s:4:\"text\";s:14:\"purifierConfig\";s:0:\"\";s:10:\"purifyHtml\";s:1:\"1\";s:14:\"redactorConfig\";s:0:\"\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"none\";s:4:\"type\";s:20:\"craft\\redactor\\Field\";}s:36:\"c521d730-9f7e-4d96-9472-bfe8e4eec946\";a:10:{s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";N;s:6:\"handle\";s:12:\"contentPlain\";s:12:\"instructions\";s:62:\"Use this field for content that doesn\'t require custom styling\";s:4:\"name\";s:13:\"Content Plain\";s:10:\"searchable\";b:1;s:8:\"settings\";a:6:{s:9:\"charLimit\";s:0:\"\";s:4:\"code\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";s:11:\"initialRows\";s:1:\"4\";s:9:\"multiline\";s:1:\"1\";s:11:\"placeholder\";s:0:\"\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"none\";s:4:\"type\";s:22:\"craft\\fields\\PlainText\";}}s:6:\"handle\";s:11:\"pageContent\";s:4:\"name\";s:12:\"Page Content\";s:9:\"sortOrder\";i:2;}s:36:\"52493481-51a0-43af-96b3-4b53761e981b\";a:6:{s:5:\"field\";s:36:\"85bce812-c924-4def-99ff-bbacbe7a9ea4\";s:12:\"fieldLayouts\";a:1:{s:36:\"84691447-0234-4cb5-a469-0b4003262bbf\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:6:\"fields\";a:3:{s:36:\"420243ac-fbf2-484f-908c-7d2151ae2d2e\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:3;}s:36:\"d2094651-c413-4f5b-9ac0-6f93c734f408\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:2;}s:36:\"d37e608d-7f04-4dbb-8d46-88944718211a\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}}s:4:\"name\";s:7:\"Content\";s:9:\"sortOrder\";i:1;}}}}s:6:\"fields\";a:3:{s:36:\"420243ac-fbf2-484f-908c-7d2151ae2d2e\";a:10:{s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";N;s:6:\"handle\";s:6:\"footer\";s:12:\"instructions\";s:0:\"\";s:4:\"name\";s:6:\"Footer\";s:10:\"searchable\";b:1;s:8:\"settings\";a:6:{s:9:\"charLimit\";s:0:\"\";s:4:\"code\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";s:11:\"initialRows\";s:1:\"4\";s:9:\"multiline\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"none\";s:4:\"type\";s:22:\"craft\\fields\\PlainText\";}s:36:\"d2094651-c413-4f5b-9ac0-6f93c734f408\";a:10:{s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";N;s:6:\"handle\";s:12:\"contentPlain\";s:12:\"instructions\";s:0:\"\";s:4:\"name\";s:13:\"Content Plain\";s:10:\"searchable\";b:1;s:8:\"settings\";a:6:{s:9:\"charLimit\";s:0:\"\";s:4:\"code\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";s:11:\"initialRows\";s:1:\"4\";s:9:\"multiline\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"none\";s:4:\"type\";s:22:\"craft\\fields\\PlainText\";}s:36:\"d37e608d-7f04-4dbb-8d46-88944718211a\";a:10:{s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";N;s:6:\"handle\";s:7:\"heading\";s:12:\"instructions\";s:0:\"\";s:4:\"name\";s:7:\"Heading\";s:10:\"searchable\";b:1;s:8:\"settings\";a:6:{s:9:\"charLimit\";s:3:\"500\";s:4:\"code\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";s:11:\"initialRows\";s:1:\"4\";s:9:\"multiline\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"none\";s:4:\"type\";s:22:\"craft\\fields\\PlainText\";}}s:6:\"handle\";s:5:\"quote\";s:4:\"name\";s:5:\"Quote\";s:9:\"sortOrder\";i:1;}s:36:\"dca56809-20bf-4ca7-b883-62e37ef14043\";a:6:{s:5:\"field\";s:36:\"85bce812-c924-4def-99ff-bbacbe7a9ea4\";s:12:\"fieldLayouts\";a:1:{s:36:\"d2eb5182-500b-46c2-a34d-8c548ad06813\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:6:\"fields\";a:3:{s:36:\"1d701a98-391c-4436-a2fe-3f83b2e48862\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:2;}s:36:\"c870d54d-fc33-4ae2-9800-2ab919801eb6\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:3;}s:36:\"fcaeff1b-3048-480e-aaab-d1c500c29e5e\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}}s:4:\"name\";s:7:\"Content\";s:9:\"sortOrder\";i:1;}}}}s:6:\"fields\";a:3:{s:36:\"1d701a98-391c-4436-a2fe-3f83b2e48862\";a:10:{s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";N;s:6:\"handle\";s:12:\"contentPlain\";s:12:\"instructions\";s:56:\"Use this for content that doesn\'t require custom styling\";s:4:\"name\";s:13:\"Content Plain\";s:10:\"searchable\";b:1;s:8:\"settings\";a:6:{s:9:\"charLimit\";s:0:\"\";s:4:\"code\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";s:11:\"initialRows\";s:1:\"4\";s:9:\"multiline\";s:1:\"1\";s:11:\"placeholder\";s:0:\"\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"none\";s:4:\"type\";s:22:\"craft\\fields\\PlainText\";}s:36:\"c870d54d-fc33-4ae2-9800-2ab919801eb6\";a:10:{s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";N;s:6:\"handle\";s:11:\"contentHtml\";s:12:\"instructions\";s:55:\"Use this field for content that requires custom styling\";s:4:\"name\";s:12:\"Content HTML\";s:10:\"searchable\";b:1;s:8:\"settings\";a:7:{s:19:\"availableTransforms\";s:1:\"*\";s:16:\"availableVolumes\";a:1:{i:0;s:36:\"f15fa10d-026b-4f9c-88f5-ca84334c8615\";}s:11:\"cleanupHtml\";s:1:\"1\";s:10:\"columnType\";s:4:\"text\";s:14:\"purifierConfig\";s:0:\"\";s:10:\"purifyHtml\";s:1:\"1\";s:14:\"redactorConfig\";s:0:\"\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"none\";s:4:\"type\";s:20:\"craft\\redactor\\Field\";}s:36:\"fcaeff1b-3048-480e-aaab-d1c500c29e5e\";a:10:{s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";N;s:6:\"handle\";s:7:\"heading\";s:12:\"instructions\";s:0:\"\";s:4:\"name\";s:7:\"Heading\";s:10:\"searchable\";b:1;s:8:\"settings\";a:6:{s:9:\"charLimit\";s:0:\"\";s:4:\"code\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";s:11:\"initialRows\";s:1:\"4\";s:9:\"multiline\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"none\";s:4:\"type\";s:22:\"craft\\fields\\PlainText\";}}s:6:\"handle\";s:4:\"card\";s:4:\"name\";s:4:\"Card\";s:9:\"sortOrder\";i:3;}}s:7:\"plugins\";a:2:{s:9:\"architect\";a:3:{s:7:\"edition\";s:8:\"standard\";s:7:\"enabled\";b:1;s:13:\"schemaVersion\";s:5:\"2.0.0\";}s:8:\"redactor\";a:3:{s:7:\"edition\";s:8:\"standard\";s:7:\"enabled\";b:1;s:13:\"schemaVersion\";s:5:\"2.2.2\";}}s:8:\"sections\";a:6:{s:36:\"191ff4d9-22bf-4fc1-a47b-1123392d5f47\";a:7:{s:16:\"enableVersioning\";b:1;s:10:\"entryTypes\";a:1:{s:36:\"0334a6c4-8346-48b7-94fb-3f80699e785d\";a:6:{s:6:\"handle\";s:8:\"homepage\";s:13:\"hasTitleField\";b:0;s:4:\"name\";s:8:\"Homepage\";s:9:\"sortOrder\";i:1;s:11:\"titleFormat\";s:18:\"{section.name|raw}\";s:10:\"titleLabel\";s:0:\"\";}}s:6:\"handle\";s:8:\"homepage\";s:4:\"name\";s:8:\"Homepage\";s:16:\"propagateEntries\";b:1;s:12:\"siteSettings\";a:1:{s:36:\"e2d75038-c4ed-417b-8edb-5a1037eaf3b0\";a:4:{s:16:\"enabledByDefault\";b:1;s:7:\"hasUrls\";b:1;s:8:\"template\";s:10:\"index.twig\";s:9:\"uriFormat\";s:1:\"/\";}}s:4:\"type\";s:6:\"single\";}s:36:\"750379a3-ba67-4a47-a6cc-e9b79bfca59f\";a:7:{s:16:\"enableVersioning\";b:1;s:10:\"entryTypes\";a:1:{s:36:\"b9d8c4f7-66f2-4dc3-a6d1-cc8525bf3a89\";a:7:{s:12:\"fieldLayouts\";a:1:{s:36:\"258b6883-ed48-4341-9f6a-30e713310118\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:6:\"fields\";a:1:{s:36:\"c6258fc4-3e46-4cd8-a367-bd83edca4f7d\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}}s:4:\"name\";s:8:\"Products\";s:9:\"sortOrder\";i:1;}}}}s:6:\"handle\";s:8:\"products\";s:13:\"hasTitleField\";b:1;s:4:\"name\";s:8:\"Products\";s:9:\"sortOrder\";i:1;s:11:\"titleFormat\";s:0:\"\";s:10:\"titleLabel\";s:5:\"Title\";}}s:6:\"handle\";s:8:\"products\";s:4:\"name\";s:8:\"Products\";s:16:\"propagateEntries\";b:1;s:12:\"siteSettings\";a:1:{s:36:\"e2d75038-c4ed-417b-8edb-5a1037eaf3b0\";a:4:{s:16:\"enabledByDefault\";b:1;s:7:\"hasUrls\";b:1;s:8:\"template\";s:19:\"products/index.twig\";s:9:\"uriFormat\";s:9:\"/products\";}}s:4:\"type\";s:6:\"single\";}s:36:\"82a69350-9107-4234-a575-59ba64b45ed5\";a:7:{s:16:\"enableVersioning\";b:1;s:10:\"entryTypes\";a:1:{s:36:\"afbf0700-9b7e-4719-b604-c41c2ef56d0f\";a:6:{s:6:\"handle\";s:7:\"contact\";s:13:\"hasTitleField\";b:0;s:4:\"name\";s:7:\"Contact\";s:9:\"sortOrder\";i:1;s:11:\"titleFormat\";s:18:\"{section.name|raw}\";s:10:\"titleLabel\";N;}}s:6:\"handle\";s:7:\"contact\";s:4:\"name\";s:7:\"Contact\";s:16:\"propagateEntries\";b:1;s:12:\"siteSettings\";a:1:{s:36:\"e2d75038-c4ed-417b-8edb-5a1037eaf3b0\";a:4:{s:16:\"enabledByDefault\";b:1;s:7:\"hasUrls\";b:1;s:8:\"template\";s:18:\"contact/index.twig\";s:9:\"uriFormat\";s:7:\"contact\";}}s:4:\"type\";s:6:\"single\";}s:36:\"942fad99-0dfc-48e7-a565-fcfba401a8a3\";a:7:{s:16:\"enableVersioning\";b:1;s:10:\"entryTypes\";a:1:{s:36:\"66a2d7b7-9d49-4844-bd2e-b8eb9d7161f3\";a:7:{s:12:\"fieldLayouts\";a:1:{s:36:\"19fffde0-a292-4ac2-87aa-f50ccc2f66cf\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:6:\"fields\";a:7:{s:36:\"014e6c9d-aafb-4767-a71a-856958d56c3d\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:5;}s:36:\"44ae2fbe-0add-4691-9585-412043036bf9\";a:2:{s:8:\"required\";b:1;s:9:\"sortOrder\";i:3;}s:36:\"60006ef0-dde8-4e41-be3d-56a93d26b242\";a:2:{s:8:\"required\";b:1;s:9:\"sortOrder\";i:1;}s:36:\"765f79a6-6214-4cc4-993f-832864ebb97d\";a:2:{s:8:\"required\";b:1;s:9:\"sortOrder\";i:7;}s:36:\"a12b4642-5e3e-47db-bc0a-46313fc102f8\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:4;}s:36:\"e0636c64-ec4a-4ec3-ad06-a1b8f6d892dc\";a:2:{s:8:\"required\";b:1;s:9:\"sortOrder\";i:2;}s:36:\"f6d740f0-9f36-4bd7-899d-a5a0c219cf77\";a:2:{s:8:\"required\";b:1;s:9:\"sortOrder\";i:6;}}s:4:\"name\";s:7:\"Company\";s:9:\"sortOrder\";i:1;}}}}s:6:\"handle\";s:7:\"company\";s:13:\"hasTitleField\";b:1;s:4:\"name\";s:7:\"Company\";s:9:\"sortOrder\";i:1;s:11:\"titleFormat\";s:0:\"\";s:10:\"titleLabel\";s:4:\"Name\";}}s:6:\"handle\";s:7:\"company\";s:4:\"name\";s:7:\"Company\";s:16:\"propagateEntries\";b:1;s:12:\"siteSettings\";a:1:{s:36:\"e2d75038-c4ed-417b-8edb-5a1037eaf3b0\";a:4:{s:16:\"enabledByDefault\";b:1;s:7:\"hasUrls\";b:1;s:8:\"template\";s:19:\"company/_staff.twig\";s:9:\"uriFormat\";s:14:\"company/{slug}\";}}s:4:\"type\";s:7:\"channel\";}s:36:\"b056c259-c354-4920-b190-3028a2c5a441\";a:7:{s:16:\"enableVersioning\";b:1;s:10:\"entryTypes\";a:1:{s:36:\"62d0b1c7-4086-41a1-9cb0-1c33b92fe123\";a:7:{s:12:\"fieldLayouts\";a:1:{s:36:\"1596cc38-2225-4058-9aca-8ba132d1e6a6\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:6:\"fields\";a:5:{s:36:\"40aa7dd3-251d-4ca0-a822-f150f903c950\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:4;}s:36:\"5662aa6b-0ca2-4358-911a-64246cbaf912\";a:2:{s:8:\"required\";b:1;s:9:\"sortOrder\";i:5;}s:36:\"73157979-814e-433c-8213-d8744f299bd6\";a:2:{s:8:\"required\";b:1;s:9:\"sortOrder\";i:2;}s:36:\"7edf7b39-7737-4f87-83e1-6d6bf312ad4d\";a:2:{s:8:\"required\";b:1;s:9:\"sortOrder\";i:1;}s:36:\"c3a35e9b-a1d5-4d28-b978-d6bf59d68e48\";a:2:{s:8:\"required\";b:1;s:9:\"sortOrder\";i:3;}}s:4:\"name\";s:5:\"About\";s:9:\"sortOrder\";i:1;}}}}s:6:\"handle\";s:5:\"about\";s:13:\"hasTitleField\";b:0;s:4:\"name\";s:5:\"About\";s:9:\"sortOrder\";i:1;s:11:\"titleFormat\";s:18:\"{section.name|raw}\";s:10:\"titleLabel\";s:0:\"\";}}s:6:\"handle\";s:5:\"about\";s:4:\"name\";s:5:\"About\";s:16:\"propagateEntries\";b:1;s:12:\"siteSettings\";a:1:{s:36:\"e2d75038-c4ed-417b-8edb-5a1037eaf3b0\";a:4:{s:16:\"enabledByDefault\";b:1;s:7:\"hasUrls\";b:1;s:8:\"template\";s:17:\"about/_entry.twig\";s:9:\"uriFormat\";s:5:\"about\";}}s:4:\"type\";s:6:\"single\";}s:36:\"ffc7df34-fdb5-457c-aa15-5b93b9146df8\";a:7:{s:16:\"enableVersioning\";b:1;s:10:\"entryTypes\";a:1:{s:36:\"e9c310fb-2b5b-4a95-a522-40aba5a5498c\";a:7:{s:12:\"fieldLayouts\";a:1:{s:36:\"730913d5-5a1d-4e6f-86b8-8217959ee9e7\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:6:\"fields\";a:7:{s:36:\"36e81bca-7d11-444f-a986-5eec1750f2ce\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:6;}s:36:\"4e3b0fd7-0344-47a9-9019-0791d342c2c0\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:5;}s:36:\"85bce812-c924-4def-99ff-bbacbe7a9ea4\";a:2:{s:8:\"required\";b:1;s:9:\"sortOrder\";i:7;}s:36:\"91eb4bde-939b-40e4-9fe7-9e06a48b7c20\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}s:36:\"ada36bad-7416-4fc6-b7b1-823fbaeff868\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:3;}s:36:\"c506b7ea-fb2d-482c-895c-6314a4b3f804\";a:2:{s:8:\"required\";b:1;s:9:\"sortOrder\";i:2;}s:36:\"dffa1967-b783-4747-82e2-23d1b23371b9\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:4;}}s:4:\"name\";s:7:\"Product\";s:9:\"sortOrder\";i:1;}}}}s:6:\"handle\";s:11:\"productItem\";s:13:\"hasTitleField\";b:1;s:4:\"name\";s:12:\"Product Item\";s:9:\"sortOrder\";i:1;s:11:\"titleFormat\";s:0:\"\";s:10:\"titleLabel\";s:5:\"Title\";}}s:6:\"handle\";s:12:\"productItems\";s:4:\"name\";s:13:\"Product Items\";s:16:\"propagateEntries\";b:1;s:12:\"siteSettings\";a:1:{s:36:\"e2d75038-c4ed-417b-8edb-5a1037eaf3b0\";a:4:{s:16:\"enabledByDefault\";b:1;s:7:\"hasUrls\";b:1;s:8:\"template\";s:20:\"products/_entry.twig\";s:9:\"uriFormat\";s:15:\"products/{slug}\";}}s:4:\"type\";s:7:\"channel\";}}s:10:\"siteGroups\";a:1:{s:36:\"63404c82-7eba-42b0-9ed2-01ffc278562e\";a:1:{s:4:\"name\";s:9:\"Comphanny\";}}s:5:\"sites\";a:1:{s:36:\"e2d75038-c4ed-417b-8edb-5a1037eaf3b0\";a:8:{s:7:\"baseUrl\";s:17:\"$DEFAULT_SITE_URL\";s:6:\"handle\";s:7:\"default\";s:7:\"hasUrls\";b:1;s:8:\"language\";s:5:\"en-US\";s:4:\"name\";s:9:\"Comphanny\";s:7:\"primary\";b:1;s:9:\"siteGroup\";s:36:\"63404c82-7eba-42b0-9ed2-01ffc278562e\";s:9:\"sortOrder\";i:1;}}s:6:\"system\";a:5:{s:7:\"edition\";s:4:\"solo\";s:4:\"live\";b:1;s:4:\"name\";s:9:\"Comphanny\";s:13:\"schemaVersion\";s:6:\"3.1.25\";s:8:\"timeZone\";s:19:\"America/Los_Angeles\";}s:5:\"users\";a:5:{s:23:\"allowPublicRegistration\";b:0;s:12:\"defaultGroup\";N;s:12:\"photoSubpath\";s:0:\"\";s:14:\"photoVolumeUid\";N;s:24:\"requireEmailVerification\";b:1;}s:7:\"volumes\";a:3:{s:36:\"4819b2f4-6231-466c-908f-96633885cd58\";a:7:{s:6:\"handle\";s:8:\"profiles\";s:7:\"hasUrls\";b:1;s:4:\"name\";s:8:\"Profiles\";s:8:\"settings\";a:1:{s:4:\"path\";s:26:\"$FILE_SYSTEM_PATH_PROFILES\";}s:9:\"sortOrder\";s:1:\"3\";s:4:\"type\";s:19:\"craft\\volumes\\Local\";s:3:\"url\";s:24:\"$ASSET_BASE_URL_PROFILES\";}s:36:\"c5545297-3c20-42eb-9d7a-6e914b34ecba\";a:7:{s:6:\"handle\";s:5:\"about\";s:7:\"hasUrls\";b:1;s:4:\"name\";s:5:\"About\";s:8:\"settings\";a:1:{s:4:\"path\";s:23:\"$FILE_SYSTEM_PATH_ABOUT\";}s:9:\"sortOrder\";s:1:\"1\";s:4:\"type\";s:19:\"craft\\volumes\\Local\";s:3:\"url\";s:21:\"$ASSET_BASE_URL_ABOUT\";}s:36:\"f15fa10d-026b-4f9c-88f5-ca84334c8615\";a:7:{s:6:\"handle\";s:8:\"products\";s:7:\"hasUrls\";b:1;s:4:\"name\";s:8:\"Products\";s:8:\"settings\";a:1:{s:4:\"path\";s:26:\"$FILE_SYSTEM_PATH_PRODUCTS\";}s:9:\"sortOrder\";s:1:\"2\";s:4:\"type\";s:19:\"craft\\volumes\\Local\";s:3:\"url\";s:24:\"$ASSET_BASE_URL_PRODUCTS\";}}}','{\"dateModified\":\"@config/project.yaml\",\"email\":\"@config/project.yaml\",\"fieldGroups\":\"@config/project.yaml\",\"fields\":\"@config/project.yaml\",\"imageTransforms\":\"@config/project.yaml\",\"matrixBlockTypes\":\"@config/project.yaml\",\"plugins\":\"@config/project.yaml\",\"sections\":\"@config/project.yaml\",\"siteGroups\":\"@config/project.yaml\",\"sites\":\"@config/project.yaml\",\"system\":\"@config/project.yaml\",\"users\":\"@config/project.yaml\",\"volumes\":\"@config/project.yaml\",\"categoryGroups\":\"@config/project.yaml\"}','Eq0PZoTq3ZzX','2019-03-03 09:27:20','2019-03-06 06:21:33','48f9fe50-79dc-4600-8d82-2fdaf9473c06');

/*!40000 ALTER TABLE `cphy_info` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cphy_matrixblocks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_matrixblocks`;

CREATE TABLE `cphy_matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `ownerSiteId` int(11) DEFAULT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cphy_matrixblocks_ownerId_idx` (`ownerId`),
  KEY `cphy_matrixblocks_fieldId_idx` (`fieldId`),
  KEY `cphy_matrixblocks_typeId_idx` (`typeId`),
  KEY `cphy_matrixblocks_sortOrder_idx` (`sortOrder`),
  KEY `cphy_matrixblocks_ownerSiteId_idx` (`ownerSiteId`),
  CONSTRAINT `cphy_matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `cphy_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cphy_matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `cphy_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cphy_matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `cphy_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cphy_matrixblocks_ownerSiteId_fk` FOREIGN KEY (`ownerSiteId`) REFERENCES `cphy_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cphy_matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `cphy_matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cphy_matrixblocks` WRITE;
/*!40000 ALTER TABLE `cphy_matrixblocks` DISABLE KEYS */;

INSERT INTO `cphy_matrixblocks` (`id`, `ownerId`, `ownerSiteId`, `fieldId`, `typeId`, `sortOrder`, `deletedWithOwner`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(20,19,NULL,22,1,1,NULL,'2019-03-03 16:17:03','2019-03-04 12:32:19','ef9807dd-bc67-440b-acf5-e4c75b15b191'),
	(21,19,NULL,22,2,2,NULL,'2019-03-03 16:17:03','2019-03-04 12:32:19','0c287c4d-2cf0-43fa-b232-428f8ee960ce'),
	(22,19,NULL,22,3,3,NULL,'2019-03-03 16:17:03','2019-03-04 12:32:19','4cf6fbd3-c5de-4c67-90cd-fc0ac9e47634'),
	(23,19,NULL,22,2,4,NULL,'2019-03-03 16:17:03','2019-03-04 12:32:19','5c73cdaf-a43d-4210-a4fb-91b49fbe92a0'),
	(24,19,NULL,22,4,5,NULL,'2019-03-03 16:17:03','2019-03-04 12:32:19','2034cddf-8130-4d99-b030-9819d580b009'),
	(30,29,NULL,22,1,1,NULL,'2019-03-03 17:56:13','2019-03-04 12:32:28','6efd82b7-2f17-4b15-bae7-c7ec30aa3816'),
	(31,29,NULL,22,2,2,NULL,'2019-03-03 17:56:13','2019-03-04 12:32:28','b2dc6846-5177-47c0-b129-316e06d896a9'),
	(32,29,NULL,22,3,3,NULL,'2019-03-03 17:56:13','2019-03-04 12:32:28','ce2367a8-7e60-4f18-b75f-0c504d2d5198'),
	(33,29,NULL,22,2,4,NULL,'2019-03-03 17:56:13','2019-03-04 12:32:28','32234b9b-86c7-4dc6-b297-49cca9c0d283'),
	(34,29,NULL,22,4,5,NULL,'2019-03-03 17:56:13','2019-03-04 12:32:28','681741f9-4091-478d-b2e3-249cd25d2265'),
	(36,35,NULL,22,1,1,NULL,'2019-03-03 17:56:46','2019-03-04 12:32:19','199d2e59-9ce4-402e-84d7-b49aba1b57c3'),
	(37,35,NULL,22,2,2,NULL,'2019-03-03 17:56:46','2019-03-04 12:32:19','6f1495fe-647e-464e-ae38-7672e6ce1497'),
	(38,35,NULL,22,3,3,NULL,'2019-03-03 17:56:46','2019-03-04 12:32:19','ea109a1e-0242-4dc6-8493-ed9ffd70033e'),
	(39,35,NULL,22,2,4,NULL,'2019-03-03 17:56:46','2019-03-04 12:32:19','49bfbc25-4f42-47b1-abf2-7f80d45f48a1'),
	(40,35,NULL,22,4,5,NULL,'2019-03-03 17:56:46','2019-03-04 12:32:19','84e6e474-fafb-45bf-bded-028130bcf5d0');

/*!40000 ALTER TABLE `cphy_matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cphy_matrixblocktypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_matrixblocktypes`;

CREATE TABLE `cphy_matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cphy_matrixblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  UNIQUE KEY `cphy_matrixblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  KEY `cphy_matrixblocktypes_fieldId_idx` (`fieldId`),
  KEY `cphy_matrixblocktypes_fieldLayoutId_idx` (`fieldLayoutId`),
  CONSTRAINT `cphy_matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `cphy_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cphy_matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `cphy_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cphy_matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `cphy_matrixblocktypes` DISABLE KEYS */;

INSERT INTO `cphy_matrixblocktypes` (`id`, `fieldId`, `fieldLayoutId`, `name`, `handle`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,22,6,'Quote','quote',1,'2019-03-03 15:56:18','2019-03-03 15:56:18','52493481-51a0-43af-96b3-4b53761e981b'),
	(2,22,7,'Page Content','pageContent',2,'2019-03-03 15:56:18','2019-03-03 15:56:18','2af320ff-5d5b-4a55-877a-5372506da01a'),
	(3,22,8,'Card','card',3,'2019-03-03 15:56:19','2019-03-03 15:56:19','dca56809-20bf-4ca7-b883-62e37ef14043'),
	(4,22,9,'Image Card','cardImage',4,'2019-03-03 15:56:20','2019-03-03 15:56:20','166feb77-b689-48b2-8495-8a3b13d38d9b');

/*!40000 ALTER TABLE `cphy_matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cphy_matrixcontent_itempagecontent
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_matrixcontent_itempagecontent`;

CREATE TABLE `cphy_matrixcontent_itempagecontent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_quote_footer` text,
  `field_quote_contentPlain` text,
  `field_quote_heading` text,
  `field_pageContent_contentHtml` text,
  `field_pageContent_contentPlain` text,
  `field_card_contentPlain` text,
  `field_card_contentHtml` text,
  `field_card_heading` text,
  `field_cardImage_heading` text,
  `field_cardImage_contentHtml` text,
  `field_cardImage_contentPlain` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cphy_matrixcontent_itempagecontent_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `cphy_matrixcontent_itempagecontent_siteId_fk` (`siteId`),
  CONSTRAINT `cphy_matrixcontent_itempagecontent_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `cphy_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cphy_matrixcontent_itempagecontent_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `cphy_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cphy_matrixcontent_itempagecontent` WRITE;
/*!40000 ALTER TABLE `cphy_matrixcontent_itempagecontent` DISABLE KEYS */;

INSERT INTO `cphy_matrixcontent_itempagecontent` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_quote_footer`, `field_quote_contentPlain`, `field_quote_heading`, `field_pageContent_contentHtml`, `field_pageContent_contentPlain`, `field_card_contentPlain`, `field_card_contentHtml`, `field_card_heading`, `field_cardImage_heading`, `field_cardImage_contentHtml`, `field_cardImage_contentPlain`)
VALUES
	(1,20,1,'2019-03-03 16:17:03','2019-03-04 12:32:19','4464d8a6-824e-4e2a-8a09-333b38cfed35','Quote footer','Quote content','Quote Heading',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(2,21,1,'2019-03-03 16:17:03','2019-03-04 12:32:19','1ad7af55-fdb5-4372-962c-3529c8ba3337',NULL,NULL,NULL,'<p>Content <strong>here</strong>.</p>','Plain content here.',NULL,NULL,NULL,NULL,NULL,NULL),
	(3,22,1,'2019-03-03 16:17:03','2019-03-04 12:32:19','18d64e22-0f19-46de-a125-e1b52df543f7',NULL,NULL,NULL,NULL,NULL,'Plain content','<h3>Lorem Ipsum</h3>\n<p>HTML Content</p>','Some Content',NULL,NULL,NULL),
	(4,23,1,'2019-03-03 16:17:03','2019-03-04 12:32:19','b56b8882-d625-49b0-b3a8-1c74bd2d191b',NULL,NULL,NULL,NULL,'Some plain content here.',NULL,NULL,NULL,NULL,NULL,NULL),
	(5,24,1,'2019-03-03 16:17:03','2019-03-04 12:32:19','6b6f6ffa-1bcb-4277-bce1-ec8c9b2da909',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Card with a side Image','<h3>Lorem Ipsum</h3>\n<p>Some <code>HTML</code> content</p>','Some plain image-card content'),
	(6,30,1,'2019-03-03 17:56:13','2019-03-04 12:32:28','f098ee3f-799e-4143-ba94-1149598c3ff8','Quote footer','Quote content','Quote Heading',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(7,31,1,'2019-03-03 17:56:13','2019-03-04 12:32:28','7874089f-ee82-4516-95e5-a2e95383895d',NULL,NULL,NULL,'<p>Content <strong>here</strong>.</p>','Plain content here.',NULL,NULL,NULL,NULL,NULL,NULL),
	(8,32,1,'2019-03-03 17:56:13','2019-03-04 12:32:28','357e1db3-3023-4e59-b6f6-f239cdb1d39e',NULL,NULL,NULL,NULL,NULL,'Plain content','<h3>Lorem Ipsum</h3>\n<p>HTML Content</p>','Some Content',NULL,NULL,NULL),
	(9,33,1,'2019-03-03 17:56:13','2019-03-04 12:32:28','e65f13dd-1d44-4343-a4f1-326de1bd4a56',NULL,NULL,NULL,'','Some plain content here.',NULL,NULL,NULL,NULL,NULL,NULL),
	(10,34,1,'2019-03-03 17:56:13','2019-03-04 12:32:28','e6d17949-7acc-446f-b7ae-282285dc983a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Card with a side Image','<h3>Lorem Ipsum</h3>\n<p>Some <code>HTML</code> content</p>','Some plain image-card content'),
	(11,36,1,'2019-03-03 17:56:46','2019-03-04 12:32:19','49f10000-0e8f-4efa-ab27-bfb5330943a6','Quote footer','Quote content','Quote Heading',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(12,37,1,'2019-03-03 17:56:46','2019-03-04 12:32:19','6670c72d-1f9f-441e-825b-99b79dbc1886',NULL,NULL,NULL,'<p>Content <strong>here</strong>.</p>','Plain content here.',NULL,NULL,NULL,NULL,NULL,NULL),
	(13,38,1,'2019-03-03 17:56:46','2019-03-04 12:32:19','34b9ed4a-9848-441c-a196-108bd0f6467c',NULL,NULL,NULL,NULL,NULL,'Plain content','<h3>Lorem Ipsum</h3>\n<p>HTML Content</p>','Some Content',NULL,NULL,NULL),
	(14,39,1,'2019-03-03 17:56:46','2019-03-04 12:32:19','64103ba2-8d69-4c85-a8e8-d40e8dbdddce',NULL,NULL,NULL,NULL,'Some plain content here.',NULL,NULL,NULL,NULL,NULL,NULL),
	(15,40,1,'2019-03-03 17:56:46','2019-03-04 12:32:19','4191e50e-7a0a-4bbc-94fd-29b05caf7e60',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Card with a side Image','<h3>Lorem Ipsum</h3>\n<p>Some <code>HTML</code> content</p>','Some plain image-card content');

/*!40000 ALTER TABLE `cphy_matrixcontent_itempagecontent` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cphy_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_migrations`;

CREATE TABLE `cphy_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pluginId` int(11) DEFAULT NULL,
  `type` enum('app','plugin','content') NOT NULL DEFAULT 'app',
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cphy_migrations_pluginId_idx` (`pluginId`),
  KEY `cphy_migrations_type_pluginId_idx` (`type`,`pluginId`),
  CONSTRAINT `cphy_migrations_pluginId_fk` FOREIGN KEY (`pluginId`) REFERENCES `cphy_plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cphy_migrations` WRITE;
/*!40000 ALTER TABLE `cphy_migrations` DISABLE KEYS */;

INSERT INTO `cphy_migrations` (`id`, `pluginId`, `type`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,NULL,'app','Install','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','09441150-2f68-4592-bb70-ae066ab2dce7'),
	(2,NULL,'app','m150403_183908_migrations_table_changes','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','abcf5606-e52b-4dbc-aae0-830490579eed'),
	(3,NULL,'app','m150403_184247_plugins_table_changes','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','a163257d-1752-4b10-838c-6b213483cec9'),
	(4,NULL,'app','m150403_184533_field_version','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','36d4e941-0e22-48fb-8052-7360c3ba3841'),
	(5,NULL,'app','m150403_184729_type_columns','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','82a910ee-3eda-4a05-82ff-0bc54ec9d92a'),
	(6,NULL,'app','m150403_185142_volumes','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','77cf4bd1-2f51-4948-b8d9-85c5c91f1f55'),
	(7,NULL,'app','m150428_231346_userpreferences','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','2275151e-4e81-4dd2-81da-05de2dd868f3'),
	(8,NULL,'app','m150519_150900_fieldversion_conversion','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','2ea50357-fb6c-455e-b076-add5ef2f1f91'),
	(9,NULL,'app','m150617_213829_update_email_settings','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','be76ae32-f6e2-4716-b511-b007f553cdb1'),
	(10,NULL,'app','m150721_124739_templatecachequeries','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','83e1aba9-3f51-4d69-bb2c-98bd75f9c670'),
	(11,NULL,'app','m150724_140822_adjust_quality_settings','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','12937dbe-e63b-4733-83df-561d50a434e5'),
	(12,NULL,'app','m150815_133521_last_login_attempt_ip','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','37fbf5dc-6d32-4ac3-acc3-3533aa295363'),
	(13,NULL,'app','m151002_095935_volume_cache_settings','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','e2b97dcb-b073-40ce-9f27-2cfe5877fad7'),
	(14,NULL,'app','m151005_142750_volume_s3_storage_settings','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','f3c58f05-3dce-4124-9005-5245d630c723'),
	(15,NULL,'app','m151016_133600_delete_asset_thumbnails','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','4765b354-77cf-4553-9162-44ef81aadcaa'),
	(16,NULL,'app','m151209_000000_move_logo','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','03ace48c-d0c3-4cb0-8e0d-dbc532d4a53b'),
	(17,NULL,'app','m151211_000000_rename_fileId_to_assetId','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','7cdffbd0-ecd0-427f-991c-fc737c270478'),
	(18,NULL,'app','m151215_000000_rename_asset_permissions','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','3202385f-6019-4036-8f6d-b67d58bbe334'),
	(19,NULL,'app','m160707_000001_rename_richtext_assetsource_setting','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','2da82b69-6f6c-4b8e-afe5-68b3cfb4c4f7'),
	(20,NULL,'app','m160708_185142_volume_hasUrls_setting','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','aff7e799-baaf-40d4-915b-e379564f95b5'),
	(21,NULL,'app','m160714_000000_increase_max_asset_filesize','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','c0d0a2ab-5c98-48b5-ad76-23838cd582f2'),
	(22,NULL,'app','m160727_194637_column_cleanup','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','e6681ad6-d3d1-4836-9ed2-cbc359e3d9e2'),
	(23,NULL,'app','m160804_110002_userphotos_to_assets','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','74e7fbde-cc5f-40d7-8932-707f33e42ce2'),
	(24,NULL,'app','m160807_144858_sites','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','36db1134-e251-4733-8630-ede909606243'),
	(25,NULL,'app','m160829_000000_pending_user_content_cleanup','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','da5e5d4f-2909-4eff-a7c6-7793437d6cd3'),
	(26,NULL,'app','m160830_000000_asset_index_uri_increase','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','f758c719-5edc-4c88-a488-e4caceb44d13'),
	(27,NULL,'app','m160912_230520_require_entry_type_id','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','927ce75e-4fee-43f5-bf17-29f12aeaf899'),
	(28,NULL,'app','m160913_134730_require_matrix_block_type_id','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','ea0d47bc-0911-4f96-a830-f2a4aa4017b8'),
	(29,NULL,'app','m160920_174553_matrixblocks_owner_site_id_nullable','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','ddf1b3a4-2334-4a86-9f56-9f0fdcb1dba3'),
	(30,NULL,'app','m160920_231045_usergroup_handle_title_unique','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','5014d8eb-e161-4c48-9828-f09693d99519'),
	(31,NULL,'app','m160925_113941_route_uri_parts','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','f9189fb5-d4e4-457d-a130-d562927acdd1'),
	(32,NULL,'app','m161006_205918_schemaVersion_not_null','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','704d9053-5427-493f-a376-ea7a23c2af1a'),
	(33,NULL,'app','m161007_130653_update_email_settings','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','ff818354-6b7d-4d6c-9f16-7c9d061f8de7'),
	(34,NULL,'app','m161013_175052_newParentId','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','14a48517-3f3b-45b5-9802-eef1b9944231'),
	(35,NULL,'app','m161021_102916_fix_recent_entries_widgets','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','c525c756-69b7-4287-a6ff-835f9092d6de'),
	(36,NULL,'app','m161021_182140_rename_get_help_widget','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','19457d14-e9c1-4b75-a8f8-4ce7087758b8'),
	(37,NULL,'app','m161025_000000_fix_char_columns','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','afbbf94d-d982-4b5d-b82c-b94223e75968'),
	(38,NULL,'app','m161029_124145_email_message_languages','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','87e80a9c-32c4-4dbf-9e0e-bf88ec020c88'),
	(39,NULL,'app','m161108_000000_new_version_format','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','6e7c196f-9cca-4668-891e-046b65108a3f'),
	(40,NULL,'app','m161109_000000_index_shuffle','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','a2dc83c5-8428-47d1-8524-6d9f27907225'),
	(41,NULL,'app','m161122_185500_no_craft_app','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','2104c98a-9d48-4cba-bf19-620736fa972a'),
	(42,NULL,'app','m161125_150752_clear_urlmanager_cache','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','e1b421c7-c8c2-4c3e-b78d-1f0ed272aaad'),
	(43,NULL,'app','m161220_000000_volumes_hasurl_notnull','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','c5038210-6d3d-4786-b69f-c9e99f3c7e02'),
	(44,NULL,'app','m170114_161144_udates_permission','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','eb3da769-7f98-42a8-a3bc-6f9a56baa411'),
	(45,NULL,'app','m170120_000000_schema_cleanup','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','0844c36d-9aa4-4392-8162-fa51730a5ad2'),
	(46,NULL,'app','m170126_000000_assets_focal_point','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','b879b6c8-f72e-4c1a-bb18-733448150c95'),
	(47,NULL,'app','m170206_142126_system_name','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','f7f7a51c-a54d-4596-8bed-ba665f92b7f7'),
	(48,NULL,'app','m170217_044740_category_branch_limits','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','cb44d289-6a09-4579-92ce-ee387b4d24da'),
	(49,NULL,'app','m170217_120224_asset_indexing_columns','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','c11caba3-ea37-4fd9-a104-f3ac092f75fe'),
	(50,NULL,'app','m170223_224012_plain_text_settings','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','64d1f5fc-4351-449f-b12d-61a61b4cfa76'),
	(51,NULL,'app','m170227_120814_focal_point_percentage','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','4865923e-6072-4e17-b857-1c36e69ca8b8'),
	(52,NULL,'app','m170228_171113_system_messages','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','d12546a3-31bf-49fb-a6ea-5dc1edcd6b3e'),
	(53,NULL,'app','m170303_140500_asset_field_source_settings','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','4ead7ed4-60f9-4685-99ca-9a451cc0030b'),
	(54,NULL,'app','m170306_150500_asset_temporary_uploads','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','f52a5850-066e-49cf-9f43-af2efd9cd053'),
	(55,NULL,'app','m170523_190652_element_field_layout_ids','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','881d5c83-a8d9-42a2-9253-8cf016d18da7'),
	(56,NULL,'app','m170612_000000_route_index_shuffle','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','3c0ec724-7f14-41eb-b040-c03d5dabdeb3'),
	(57,NULL,'app','m170621_195237_format_plugin_handles','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','d99fe6e6-7f82-4432-a5b0-c3414c11b255'),
	(58,NULL,'app','m170630_161027_deprecation_line_nullable','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','c565f9ec-3255-4277-985c-039451040716'),
	(59,NULL,'app','m170630_161028_deprecation_changes','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','b556988e-8e78-40e0-a834-c6b4592cbd12'),
	(60,NULL,'app','m170703_181539_plugins_table_tweaks','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','2c8d9e94-6471-444a-a537-b7e45ff79af1'),
	(61,NULL,'app','m170704_134916_sites_tables','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','835f0aa2-7a65-41cf-90ea-ed0e792c6dd6'),
	(62,NULL,'app','m170706_183216_rename_sequences','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','d14046ba-bc56-4d4e-9e30-d1cbfdb30e61'),
	(63,NULL,'app','m170707_094758_delete_compiled_traits','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','7ea4b88d-56b9-4c23-928c-84b5fecd8b6c'),
	(64,NULL,'app','m170731_190138_drop_asset_packagist','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','96000fe1-1c33-4333-9a38-e22c1ce2c0b6'),
	(65,NULL,'app','m170810_201318_create_queue_table','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','d64f343c-80be-435d-acd9-fa5d2585accd'),
	(66,NULL,'app','m170816_133741_delete_compiled_behaviors','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','617e957b-47e4-4b40-b111-9d8fcd256412'),
	(67,NULL,'app','m170903_192801_longblob_for_queue_jobs','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','53cba6ae-9755-49d4-9f0a-23d639e5b2c7'),
	(68,NULL,'app','m170914_204621_asset_cache_shuffle','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','d2b87944-200f-44ed-b95c-36a1215d76ef'),
	(69,NULL,'app','m171011_214115_site_groups','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','f1da172a-54c7-4ccb-b555-733db23ca44f'),
	(70,NULL,'app','m171012_151440_primary_site','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','37892dc0-217a-4571-9c3b-c8179662f5b3'),
	(71,NULL,'app','m171013_142500_transform_interlace','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','b0bb7713-0fc8-4df4-a637-317fbe4eb126'),
	(72,NULL,'app','m171016_092553_drop_position_select','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','7baba33b-ed9e-470e-96d4-da478a9442a0'),
	(73,NULL,'app','m171016_221244_less_strict_translation_method','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','d24e80bc-a4b0-4ad0-85eb-3ef4b2a24c5d'),
	(74,NULL,'app','m171107_000000_assign_group_permissions','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','35f1e0ab-0abf-4104-8def-fc767790918d'),
	(75,NULL,'app','m171117_000001_templatecache_index_tune','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','f14214f6-f4af-48d9-a8d6-6c0247e56cf5'),
	(76,NULL,'app','m171126_105927_disabled_plugins','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','b7f8a5ea-a441-4db6-8bbb-bb2163c79033'),
	(77,NULL,'app','m171130_214407_craftidtokens_table','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','9c5d6fa0-aa50-4a83-996e-08e690826b2c'),
	(78,NULL,'app','m171202_004225_update_email_settings','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','dbf50bef-a7c5-4aba-a052-fdba95c001fa'),
	(79,NULL,'app','m171204_000001_templatecache_index_tune_deux','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','78d56186-a6c9-4b4c-9d24-4fdd59e6a373'),
	(80,NULL,'app','m171205_130908_remove_craftidtokens_refreshtoken_column','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','1d8aa890-3418-4e80-86d3-db983e9f2663'),
	(81,NULL,'app','m171218_143135_longtext_query_column','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','b2d16a9e-5ae7-4275-89c8-3eb4e8e6ed3a'),
	(82,NULL,'app','m171231_055546_environment_variables_to_aliases','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','1d848037-f3b3-47be-916a-4490e198b7c0'),
	(83,NULL,'app','m180113_153740_drop_users_archived_column','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','76055b7e-a750-4db5-9433-0bfbcead9dfb'),
	(84,NULL,'app','m180122_213433_propagate_entries_setting','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','4c98c727-a0ea-4a54-9ca6-2c31c695acb7'),
	(85,NULL,'app','m180124_230459_fix_propagate_entries_values','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','d02f8121-fede-4662-a0e8-1bd59851a504'),
	(86,NULL,'app','m180128_235202_set_tag_slugs','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','0a4bb6fc-5da5-47f6-970b-7b7e59b66a3e'),
	(87,NULL,'app','m180202_185551_fix_focal_points','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','5f8d5d26-0475-43d3-ac5f-0c8091b2ce78'),
	(88,NULL,'app','m180217_172123_tiny_ints','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','1b5ab737-4865-4829-bfc0-f8197e61286e'),
	(89,NULL,'app','m180321_233505_small_ints','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','6d02dd8b-6a57-46f3-ba49-ead70bb08b8f'),
	(90,NULL,'app','m180328_115523_new_license_key_statuses','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','685c3b42-90de-40fb-84fc-cf5e84c785d1'),
	(91,NULL,'app','m180404_182320_edition_changes','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','73783c6f-57fb-464c-9057-d12db2ed5d04'),
	(92,NULL,'app','m180411_102218_fix_db_routes','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','bc3c3496-1760-4d71-88b3-392e7c214397'),
	(93,NULL,'app','m180416_205628_resourcepaths_table','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','3893c601-2284-48d8-b0ca-a6af2c82d610'),
	(94,NULL,'app','m180418_205713_widget_cleanup','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','d6775978-8cb2-4db8-9d72-2a6cbff01bbb'),
	(95,NULL,'app','m180425_203349_searchable_fields','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','914f3d2c-fc1d-4cf6-b3df-895c70e5d19e'),
	(96,NULL,'app','m180516_153000_uids_in_field_settings','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','e7e8b1af-c3f7-4a46-a4cf-54f6bf073c69'),
	(97,NULL,'app','m180517_173000_user_photo_volume_to_uid','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','5e57b673-b9f6-47cd-996e-8d85a8b52fcd'),
	(98,NULL,'app','m180518_173000_permissions_to_uid','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','f725f17c-3664-4866-858a-cd5a2a038ac0'),
	(99,NULL,'app','m180520_173000_matrix_context_to_uids','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','10f75a30-7244-4c30-9ced-210f8257938b'),
	(100,NULL,'app','m180521_173000_initial_yml_and_snapshot','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','f140174d-b58d-459e-b30b-7c1911eabc12'),
	(101,NULL,'app','m180731_162030_soft_delete_sites','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','01a44726-c46a-439f-967b-a5681931c3b0'),
	(102,NULL,'app','m180810_214427_soft_delete_field_layouts','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','61ea9c5a-911f-4b52-aaac-63dd9c485153'),
	(103,NULL,'app','m180810_214439_soft_delete_elements','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','ee99be79-b0f7-47cf-86a3-4c1b39dc4729'),
	(104,NULL,'app','m180824_193422_case_sensitivity_fixes','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','7c214e5c-3c86-474a-9574-94ab42236806'),
	(105,NULL,'app','m180901_151639_fix_matrixcontent_tables','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','1915f5bb-0834-4571-a2ad-f75e216f3738'),
	(106,NULL,'app','m180904_112109_permission_changes','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','fa43ba0a-2e94-4ecc-b3e8-b041d557ce4a'),
	(107,NULL,'app','m180910_142030_soft_delete_sitegroups','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','4e44f7f9-57bd-42aa-b3f9-77fa0f62d6b5'),
	(108,NULL,'app','m181011_160000_soft_delete_asset_support','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','28016bdc-c563-4ef3-909c-89dd08d94e60'),
	(109,NULL,'app','m181016_183648_set_default_user_settings','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','1f90a60f-91b2-43dd-95ef-815fc534749f'),
	(110,NULL,'app','m181017_225222_system_config_settings','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','92656715-8d20-406b-9deb-edfc6e1c49c4'),
	(111,NULL,'app','m181018_222343_drop_userpermissions_from_config','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','5d54f6fd-0a68-47a0-8ec6-546b638e06de'),
	(112,NULL,'app','m181029_130000_add_transforms_routes_to_config','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','a5c5e140-ef74-40cd-8bd5-b8de46ad8139'),
	(113,NULL,'app','m181112_203955_sequences_table','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','a3ecb645-13e2-4526-9501-a7259d8d8b6f'),
	(114,NULL,'app','m181121_001712_cleanup_field_configs','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','ca1b3de6-f835-4b20-8023-30243e55ec7d'),
	(115,NULL,'app','m181128_193942_fix_project_config','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','649a0af8-ef80-4653-b6f9-8c08a5a253f3'),
	(116,NULL,'app','m181130_143040_fix_schema_version','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','582b29bf-fcc3-48c7-be57-58131b85d71c'),
	(117,NULL,'app','m181211_143040_fix_entry_type_uids','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','983f0158-4fad-4028-a433-543d19f91991'),
	(118,NULL,'app','m181213_102500_config_map_aliases','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','c06d0ca2-c921-4d3e-90d9-4e3181812806'),
	(119,NULL,'app','m181217_153000_fix_structure_uids','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','65cf5cbb-9d0b-49d2-ba0f-2bbdd428e240'),
	(120,NULL,'app','m190104_152725_store_licensed_plugin_editions','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','fa726439-6517-4601-8557-bf604d6c0afa'),
	(121,NULL,'app','m190108_110000_cleanup_project_config','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','20115651-35b1-420f-b145-8757622d916b'),
	(122,NULL,'app','m190108_113000_asset_field_setting_change','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','d7779ff6-f56e-4379-acbe-f4af1591f9bb'),
	(123,NULL,'app','m190109_172845_fix_colspan','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','28dc0d2b-3a07-4709-8703-5b453504bfbf'),
	(124,NULL,'app','m190110_150000_prune_nonexisting_sites','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','4fb5be0c-0fd8-4382-9986-ea33de13117e'),
	(125,NULL,'app','m190110_214819_soft_delete_volumes','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','45591375-1aa8-45f3-9ca7-fbc5780a1e21'),
	(126,NULL,'app','m190112_124737_fix_user_settings','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','a4ff3a18-7e2b-42c1-8185-a5905cc9c7a7'),
	(127,NULL,'app','m190112_131225_fix_field_layouts','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','2695359d-4ace-484e-885b-41f568ff4614'),
	(128,NULL,'app','m190112_201010_more_soft_deletes','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','2b662f3f-1fae-4309-970d-1b8a63d8b5ce'),
	(129,NULL,'app','m190114_143000_more_asset_field_setting_changes','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','1c96aa19-cab9-4b6a-90d6-fe12e8f26c79'),
	(130,NULL,'app','m190121_120000_rich_text_config_setting','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','871cea10-3596-49ff-bf82-8204d6f596d2'),
	(131,NULL,'app','m190125_191628_fix_email_transport_password','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','d0488347-d4c2-49bc-86cc-0a7f0b2b341c'),
	(132,NULL,'app','m190128_181422_cleanup_volume_folders','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','0d2ae488-e1c2-4b34-943d-2d78a199b495'),
	(133,NULL,'app','m190205_140000_fix_asset_soft_delete_index','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','0d4e20bb-e4d9-4e56-8680-944990d36f42'),
	(134,NULL,'app','m190208_140000_reset_project_config_mapping','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','1081b655-8783-4816-b1a2-f46d478bcad0'),
	(135,NULL,'app','m190218_143000_element_index_settings_uid','2019-03-03 09:27:21','2019-03-03 09:27:21','2019-03-03 09:27:21','eff08b4f-c424-4fd5-918d-0acc90d6fb86'),
	(136,2,'plugin','m180430_204710_remove_old_plugins','2019-03-03 09:48:54','2019-03-03 09:48:54','2019-03-03 09:48:54','d9eb411d-adb6-4db3-b591-10f26a4453c5'),
	(137,2,'plugin','Install','2019-03-03 09:48:54','2019-03-03 09:48:54','2019-03-03 09:48:54','b41ef87b-032d-432d-babf-c30d29115a0f');

/*!40000 ALTER TABLE `cphy_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cphy_plugins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_plugins`;

CREATE TABLE `cphy_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cphy_plugins_handle_unq_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cphy_plugins` WRITE;
/*!40000 ALTER TABLE `cphy_plugins` DISABLE KEYS */;

INSERT INTO `cphy_plugins` (`id`, `handle`, `version`, `schemaVersion`, `licenseKeyStatus`, `licensedEdition`, `installDate`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'architect','2.2.11','2.0.0','unknown',NULL,'2019-03-03 09:48:54','2019-03-03 09:48:54','2019-03-06 05:38:21','eac075aa-d386-4d19-a8fb-9b98a10206bd'),
	(2,'redactor','2.3.2','2.2.2','unknown',NULL,'2019-03-03 09:48:54','2019-03-03 09:48:54','2019-03-06 05:38:21','360901d9-6a02-4eb4-b914-7a0170de17f0');

/*!40000 ALTER TABLE `cphy_plugins` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cphy_queue
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_queue`;

CREATE TABLE `cphy_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `cphy_queue_fail_timeUpdated_timePushed_idx` (`fail`,`timeUpdated`,`timePushed`),
  KEY `cphy_queue_fail_timeUpdated_delay_idx` (`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table cphy_relations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_relations`;

CREATE TABLE `cphy_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cphy_relations_fieldId_sourceId_sourceSiteId_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `cphy_relations_sourceId_idx` (`sourceId`),
  KEY `cphy_relations_targetId_idx` (`targetId`),
  KEY `cphy_relations_sourceSiteId_idx` (`sourceSiteId`),
  CONSTRAINT `cphy_relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `cphy_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cphy_relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `cphy_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cphy_relations_sourceSiteId_fk` FOREIGN KEY (`sourceSiteId`) REFERENCES `cphy_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cphy_relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `cphy_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cphy_relations` WRITE;
/*!40000 ALTER TABLE `cphy_relations` DISABLE KEYS */;

INSERT INTO `cphy_relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(17,6,5,NULL,6,1,'2019-03-03 13:22:30','2019-03-03 13:22:30','b4833164-3907-49af-a413-43a9c8b4102e'),
	(18,15,5,NULL,6,1,'2019-03-03 13:22:43','2019-03-03 13:22:43','786a3a1d-8d1a-488e-a3cd-a497db8e86f4'),
	(21,13,11,NULL,7,1,'2019-03-03 13:57:12','2019-03-03 13:57:12','ca7dcc46-7d7a-45c0-8549-24b54bc3f2c2'),
	(48,13,8,NULL,7,1,'2019-03-03 14:49:40','2019-03-03 14:49:40','eaca1ec7-259d-4b12-ab39-f3d31bf842d1'),
	(49,13,10,NULL,9,1,'2019-03-03 14:49:40','2019-03-03 14:49:40','778c5957-bff2-4c10-9475-8fa7847493f9'),
	(50,13,12,NULL,13,1,'2019-03-03 14:49:40','2019-03-03 14:49:40','22c81ad7-3f09-4daa-8322-bc037e96699f'),
	(155,20,19,NULL,17,1,'2019-03-04 12:32:19','2019-03-04 12:32:19','77db3cc1-df87-4fd6-9fd5-a3e4cdbb7bfa'),
	(156,38,19,NULL,25,1,'2019-03-04 12:32:19','2019-03-04 12:32:19','bc9f70f3-513b-4c56-8d8d-2b00bea94ff4'),
	(157,38,19,NULL,26,2,'2019-03-04 12:32:19','2019-03-04 12:32:19','58d5bd8b-732f-4231-b5ec-a94200442b99'),
	(158,38,19,NULL,27,3,'2019-03-04 12:32:19','2019-03-04 12:32:19','126541b6-3fb3-45d1-886d-55cecee80d7d'),
	(159,38,19,NULL,28,4,'2019-03-04 12:32:19','2019-03-04 12:32:19','974cb483-fe14-4103-afd1-4dc3c661c351'),
	(160,32,24,NULL,18,1,'2019-03-04 12:32:19','2019-03-04 12:32:19','e3001a46-5ff3-4886-b6f7-4283f6212fd1'),
	(165,20,35,NULL,17,1,'2019-03-04 12:32:19','2019-03-04 12:32:19','a83fbc45-ca3b-4c70-8f87-f3abe8863681'),
	(166,38,35,NULL,25,1,'2019-03-04 12:32:19','2019-03-04 12:32:19','c10dff94-a7b3-408a-823f-1b7e5b40b251'),
	(167,38,35,NULL,26,2,'2019-03-04 12:32:19','2019-03-04 12:32:19','54566b7b-b98c-4706-9081-90a200b7401b'),
	(168,38,35,NULL,27,3,'2019-03-04 12:32:19','2019-03-04 12:32:19','98f2dc63-d4bd-4a58-bd14-2e0c503831c2'),
	(169,32,40,NULL,18,1,'2019-03-04 12:32:19','2019-03-04 12:32:19','b935efc8-61b6-4de3-a390-ce489e7b0616'),
	(170,20,29,NULL,17,1,'2019-03-04 12:32:28','2019-03-04 12:32:28','43b00c02-0f96-4a4c-af95-715f8d3ca0c9'),
	(171,38,29,NULL,25,1,'2019-03-04 12:32:28','2019-03-04 12:32:28','08aae8aa-6694-4dc4-8e4e-5356ee8724ab'),
	(172,38,29,NULL,28,2,'2019-03-04 12:32:28','2019-03-04 12:32:28','ba3780a3-ec9d-4cca-ba9a-701b7641ab60'),
	(173,32,34,NULL,18,1,'2019-03-04 12:32:28','2019-03-04 12:32:28','e65abf39-cc90-4e29-9a83-4cf0bc84ecfb');

/*!40000 ALTER TABLE `cphy_relations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cphy_resourcepaths
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_resourcepaths`;

CREATE TABLE `cphy_resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cphy_resourcepaths` WRITE;
/*!40000 ALTER TABLE `cphy_resourcepaths` DISABLE KEYS */;

INSERT INTO `cphy_resourcepaths` (`hash`, `path`)
VALUES
	('10953fa4','@app/web/assets/updateswidget/dist'),
	('1ad3bf4f','@app/web/assets/sites/dist'),
	('1e079365','@app/web/assets/craftsupport/dist'),
	('1fda6f13','@lib/fileupload'),
	('21058a6','@lib/prismjs'),
	('2b79f88f','@app/web/assets/fields/dist'),
	('2c1ed6c1','@app/web/assets/dashboard/dist'),
	('2d82c4c4','@app/web/assets/deprecationerrors/dist'),
	('2e2f7dca','@app/web/assets/recententries/dist'),
	('2f6c8d04','@lib/fabric'),
	('33625a47','@app/web/assets/cp/dist'),
	('375c4f39','@app/web/assets/login/dist'),
	('39a36f5','@app/web/assets/matrix/dist'),
	('3a2a593a','@lib/garnishjs'),
	('43153b5','@app/web/assets/generalsettings/dist'),
	('466667dd','@lib/velocity'),
	('4a7911f9','@app/web/assets/feed/dist'),
	('4ed6213','@pennebaker/architect/assetbundles/indexcpsection/dist'),
	('511918d6','@app/web/assets/utilities/dist'),
	('534c4369','@lib/selectize'),
	('5452d598','@app/web/assets/edittransform/dist'),
	('57e990a0','@bower/jquery/dist'),
	('592007e3','@lib/xregexp'),
	('5a41c835','@lib/jquery.payment'),
	('66df5f96','@lib/timepicker'),
	('6ed59bd2','@app/web/assets/plugins/dist'),
	('6fc35158','@lib'),
	('7326eed','@lib/picturefill'),
	('77ce345a','@craft/redactor/assets/field/dist'),
	('78793b55','@lib/element-resize-detector'),
	('8442b443','@app/web/assets/tablesettings/dist'),
	('8551c529','@lib/xregexp'),
	('86300aff','@lib/jquery.payment'),
	('8b98526a','@bower/jquery/dist'),
	('8cffc78','@lib/jquery-ui'),
	('8d68da1c','@app/web/assets/utilities/dist'),
	('8f3d81a3','@lib/selectize'),
	('9608d333','@app/web/assets/feed/dist'),
	('96522f','@lib/jquery-touch-events'),
	('969e26bf','@lib/datepicker-i18n'),
	('98e1a4d8','@app/web/assets/edituser/dist'),
	('9974ebc','@lib/d3'),
	('9a17a517','@lib/velocity'),
	('a408f99f','@lib/element-resize-detector'),
	('a7c2875c','@app/web/assets/matrixsettings/dist'),
	('a8dcfccb','@app/web/assets/editcategory/dist'),
	('a94a9da','@vendor/craftcms/redactor/lib/redactor'),
	('b3b29392','@lib'),
	('c27651af','@app/web/assets/craftsupport/dist'),
	('c3abadd9','@lib/fileupload'),
	('cb814c1','@app/web/assets/editentry/dist'),
	('cce4fd6e','@app/web/assets/updateswidget/dist'),
	('d4be3eb2','@lib/jquery-ui'),
	('d5e68c76','@lib/d3'),
	('d840917f','@app/web/assets/generalsettings/dist'),
	('dae6b900','@app/web/assets/installer/dist'),
	('db43ac27','@lib/picturefill'),
	('dcb1af51','@app/web/assets/updater/dist'),
	('dce790e5','@lib/jquery-touch-events'),
	('e65b9bf0','@lib/garnishjs'),
	('eb2d8df3','@app/web/assets/login/dist'),
	('ef13988d','@app/web/assets/cp/dist'),
	('f06f140b','@app/web/assets/dashboard/dist'),
	('f25ebf00','@app/web/assets/recententries/dist'),
	('f31d4fce','@lib/fabric'),
	('f42bd5a6','@app/web/assets/pluginstore/dist');

/*!40000 ALTER TABLE `cphy_resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cphy_searchindex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_searchindex`;

CREATE TABLE `cphy_searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `cphy_searchindex_keywords_idx` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `cphy_searchindex` WRITE;
/*!40000 ALTER TABLE `cphy_searchindex` DISABLE KEYS */;

INSERT INTO `cphy_searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`)
VALUES
	(1,'username',0,1,' comphanny '),
	(1,'firstname',0,1,' com '),
	(1,'lastname',0,1,' phanny '),
	(1,'fullname',0,1,' com phanny '),
	(1,'email',0,1,' comphanny example com '),
	(1,'slug',0,1,''),
	(2,'slug',0,1,' home '),
	(2,'title',0,1,' homepage '),
	(3,'slug',0,1,' products '),
	(3,'title',0,1,' products '),
	(4,'slug',0,1,' contact '),
	(4,'title',0,1,' contact '),
	(2,'field',2,1,' comphanny '),
	(2,'field',1,1,' tagline '),
	(5,'slug',0,1,' about '),
	(5,'title',0,1,' about '),
	(5,'field',7,1,' why choose us '),
	(5,'field',8,1,' because we are a super duper cool phun team '),
	(5,'field',6,1,' smilies bank sit rest 160739 '),
	(6,'filename',0,1,' smilies bank sit rest 160739 jpeg '),
	(6,'extension',0,1,' jpeg '),
	(6,'kind',0,1,' image '),
	(6,'slug',0,1,''),
	(6,'title',0,1,' smilies bank sit rest 160739 '),
	(5,'field',9,1,' about page banner '),
	(5,'field',3,1,' lorem ipsum lorem ipsum dolor sit amet consectetur adipiscing elit vivamus tincidunt pulvinar imperdiet ut non maximus tellus sed luctus ante sed pulvinar malesuada proin egestas gravida purus nec sodales orci consequat at suspendisse potenti nam eget auctor ante in molestie lorem nam imperdiet mauris id lacus eleifend nec molestie magna onetwothree '),
	(5,'field',15,1,' smilies bank sit rest 160739 '),
	(7,'filename',0,1,' founder png '),
	(7,'extension',0,1,' png '),
	(7,'kind',0,1,' image '),
	(7,'slug',0,1,''),
	(7,'title',0,1,' founder '),
	(8,'field',13,1,' founder '),
	(8,'field',10,1,' founder ceo '),
	(8,'field',11,1,''),
	(8,'field',12,1,' duh '),
	(8,'field',14,1,' 1 '),
	(8,'field',16,1,' lorem ipsum lorem ipsum dolor sit amet consectetur adipiscing elit nulla egestas condimentum egestas proin scelerisque finibus velit quisque a mauris in libero semper posuere vitae sed elit aenean euismod est eget nulla iaculis laoreet vivamus aliquam porttitor dui vitae cursus turpis fringilla non vivamus vel urna aliquam scelerisque enim vitae feugiat massa cras facilisis lectus eu nibh scelerisque tristique why i founded this company integer hendrerit feugiat libero proin et suscipit ante aenean eget ante pretium auctor nisi vitae dictum augue integer hendrerit a enim sit amet mollis vestibulum porta feugiat scelerisque aliquam tincidunt nibh lectus eu vulputate felis cursus non ut et libero non mauris first reasonsecond reasonthird reason my first script script console log some code here script '),
	(8,'slug',0,1,' mr patriarch sr '),
	(8,'title',0,1,' mr patriarch sr '),
	(9,'filename',0,1,' coder png '),
	(9,'extension',0,1,' png '),
	(9,'kind',0,1,' image '),
	(9,'slug',0,1,''),
	(9,'title',0,1,' coder '),
	(10,'field',13,1,' coder '),
	(10,'field',10,1,' team lead web developer '),
	(10,'field',11,1,''),
	(10,'field',12,1,' i '),
	(10,'field',14,1,''),
	(10,'field',16,1,' lorem ipsum minim irure consequat cupidatat cillum in enim non aliquip eu ullamco consequat esse mollit in nisi et labore in reprehenderit occaecat non eiusmod sunt ea minim amet commodo ullamco veniam do excepteur excepteur id reprehenderit amet var somevar '),
	(10,'slug',0,1,' phanpy dev '),
	(10,'title',0,1,' phanpy dev '),
	(11,'field',13,1,' founder '),
	(11,'field',10,1,' founder ceo '),
	(11,'field',11,1,''),
	(11,'field',12,1,' duh '),
	(11,'field',14,1,' 1 '),
	(11,'field',16,1,' lorem ipsum lorem ipsum dolor sit amet consectetur adipiscing elit nulla egestas condimentum egestas proin scelerisque finibus velit quisque a mauris in libero semper posuere vitae sed elit aenean euismod est eget nulla iaculis laoreet vivamus aliquam porttitor dui vitae cursus turpis fringilla non vivamus vel urna aliquam scelerisque enim vitae feugiat massa cras facilisis lectus eu nibh scelerisque tristique why i founded this company integer hendrerit feugiat libero proin et suscipit ante aenean eget ante pretium auctor nisi vitae dictum augue integer hendrerit a enim sit amet mollis vestibulum porta feugiat scelerisque aliquam tincidunt nibh lectus eu vulputate felis cursus non ut et libero non mauris first reasonsecond reasonthird reasonmy first script script console log some code here script '),
	(11,'slug',0,1,' mr patriarch sr '),
	(11,'title',0,1,' mr patriarch sr copy '),
	(12,'field',13,1,' designer '),
	(12,'field',10,1,' lead designer ux designer '),
	(12,'field',11,1,''),
	(12,'field',12,1,' i '),
	(12,'field',14,1,''),
	(12,'field',16,1,' lorem ipsum minim irure consequat cupidatat cillum in enim non aliquip eu ullamco consequat esse mollit in nisi et labore in reprehenderit occaecat non eiusmod sunt ea minim amet commodo ullamco veniam do excepteur excepteur id reprehenderit amet '),
	(12,'slug',0,1,' phanpy design '),
	(12,'title',0,1,' phanpy design '),
	(13,'filename',0,1,' designer png '),
	(13,'extension',0,1,' png '),
	(13,'kind',0,1,' image '),
	(13,'slug',0,1,''),
	(13,'title',0,1,' designer '),
	(8,'field',17,1,' 1 '),
	(10,'field',17,1,' 0 '),
	(12,'field',17,1,' 0 '),
	(2,'field',4,1,' com phanny '),
	(2,'field',18,1,' phun phamily phans '),
	(14,'slug',0,1,' products '),
	(14,'title',0,1,' products '),
	(14,'field',5,1,' minim irure consequat cupidatat cillum in enim non aliquip eu ullamco consequat esse mollit in nisi et labore in reprehenderit occaecat non eiusmod sunt ea minim amet commodo ullamco veniam do excepteur excepteur id reprehenderit amet '),
	(14,'field',19,1,' minim irure consequat cupidatat cillum in enim non aliquip eu ullamco consequat esse mollit in nisi et labore in reprehenderit occaecat non eiusmod sunt ea minim amet commodo ullamco veniam do excepteur excepteur id reprehenderit amet '),
	(15,'filename',0,1,' comphanny png '),
	(15,'extension',0,1,' png '),
	(15,'kind',0,1,' image '),
	(15,'slug',0,1,''),
	(15,'title',0,1,' comphanny '),
	(16,'filename',0,1,' comphanny products png '),
	(16,'extension',0,1,' png '),
	(16,'kind',0,1,' image '),
	(16,'slug',0,1,''),
	(16,'title',0,1,' comphanny products '),
	(17,'filename',0,1,' website 001 jpeg '),
	(17,'extension',0,1,' jpeg '),
	(17,'kind',0,1,' image '),
	(17,'slug',0,1,''),
	(17,'title',0,1,' website 001 '),
	(18,'filename',0,1,' website 002 jpeg '),
	(18,'extension',0,1,' jpeg '),
	(18,'kind',0,1,' image '),
	(18,'slug',0,1,''),
	(18,'title',0,1,' website 002 '),
	(19,'field',20,1,' website 001 '),
	(19,'field',21,1,' php7 php7 craftcms https craftcms com craftcms https craftcms com '),
	(19,'field',22,1,' quote content quote footer quote heading content here plain content here lorem ipsum html content plain content some content some plain content here lorem ipsum some html content some plain image card content card with a side image website 002 '),
	(20,'field',25,1,' quote heading '),
	(20,'field',24,1,' quote content '),
	(20,'field',23,1,' quote footer '),
	(20,'slug',0,1,''),
	(21,'field',27,1,' plain content here '),
	(21,'field',26,1,' content here '),
	(21,'slug',0,1,''),
	(22,'field',30,1,' some content '),
	(22,'field',28,1,' plain content '),
	(22,'field',29,1,' lorem ipsum html content '),
	(22,'slug',0,1,''),
	(23,'field',27,1,' some plain content here '),
	(23,'field',26,1,''),
	(23,'slug',0,1,''),
	(24,'field',31,1,' card with a side image '),
	(24,'field',32,1,' website 002 '),
	(24,'field',33,1,' lorem ipsum some html content '),
	(24,'field',34,1,' some plain image card content '),
	(24,'slug',0,1,''),
	(19,'slug',0,1,' sample product entry '),
	(19,'title',0,1,' sample product entry '),
	(25,'field',36,1,' website description '),
	(25,'slug',0,1,' website '),
	(25,'title',0,1,' website '),
	(26,'field',36,1,' web app category '),
	(26,'slug',0,1,' web app '),
	(26,'title',0,1,' web app '),
	(27,'field',36,1,' mobile app description '),
	(27,'slug',0,1,' mobile app '),
	(27,'title',0,1,' mobile app '),
	(28,'field',36,1,' web service description '),
	(28,'slug',0,1,' web service '),
	(28,'title',0,1,' web service '),
	(25,'field',37,1,' fal fa browser '),
	(26,'field',37,1,' fal fa globe '),
	(27,'field',37,1,' fal fa mobile '),
	(28,'field',37,1,' fal fa cloud '),
	(19,'field',38,1,' website web app mobile app web service '),
	(19,'field',39,1,' some description '),
	(19,'field',35,1,''),
	(29,'field',35,1,' 1 '),
	(29,'field',20,1,' website 001 '),
	(29,'field',39,1,' some description '),
	(29,'field',38,1,' website web service '),
	(29,'field',21,1,' php7 php7 craftcms https craftcms com craftcms https craftcms com '),
	(29,'field',22,1,' quote content quote footer quote heading content here plain content here lorem ipsum html content plain content some content some plain content here lorem ipsum some html content some plain image card content card with a side image website 002 '),
	(30,'field',25,1,' quote heading '),
	(30,'field',24,1,' quote content '),
	(30,'field',23,1,' quote footer '),
	(30,'slug',0,1,''),
	(31,'field',27,1,' plain content here '),
	(31,'field',26,1,' content here '),
	(31,'slug',0,1,''),
	(32,'field',30,1,' some content '),
	(32,'field',28,1,' plain content '),
	(32,'field',29,1,' lorem ipsum html content '),
	(32,'slug',0,1,''),
	(33,'field',27,1,' some plain content here '),
	(33,'field',26,1,''),
	(33,'slug',0,1,''),
	(34,'field',31,1,' card with a side image '),
	(34,'field',32,1,' website 002 '),
	(34,'field',33,1,' lorem ipsum some html content '),
	(34,'field',34,1,' some plain image card content '),
	(34,'slug',0,1,''),
	(29,'slug',0,1,' sample product entry 1 '),
	(29,'title',0,1,' featured product 1 '),
	(35,'field',35,1,' 1 '),
	(35,'field',20,1,' website 001 '),
	(35,'field',39,1,' some description 2 '),
	(35,'field',38,1,' website web app mobile app '),
	(35,'field',21,1,' php7 php7 craftcms https craftcms com craftcms https craftcms com '),
	(35,'field',22,1,' quote content quote footer quote heading content here plain content here lorem ipsum html content plain content some content some plain content here lorem ipsum some html content some plain image card content card with a side image website 002 '),
	(36,'field',25,1,' quote heading '),
	(36,'field',24,1,' quote content '),
	(36,'field',23,1,' quote footer '),
	(36,'slug',0,1,''),
	(37,'field',27,1,' plain content here '),
	(37,'field',26,1,' content here '),
	(37,'slug',0,1,''),
	(38,'field',30,1,' some content '),
	(38,'field',28,1,' plain content '),
	(38,'field',29,1,' lorem ipsum html content '),
	(38,'slug',0,1,''),
	(39,'field',27,1,' some plain content here '),
	(39,'field',26,1,''),
	(39,'slug',0,1,''),
	(40,'field',31,1,' card with a side image '),
	(40,'field',32,1,' website 002 '),
	(40,'field',33,1,' lorem ipsum some html content '),
	(40,'field',34,1,' some plain image card content '),
	(40,'slug',0,1,''),
	(35,'slug',0,1,' sample product entry 1 1 '),
	(35,'title',0,1,' featured product 2 '),
	(19,'field',40,1,''),
	(29,'field',40,1,' some tagline '),
	(35,'field',40,1,'');

/*!40000 ALTER TABLE `cphy_searchindex` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cphy_sections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_sections`;

CREATE TABLE `cphy_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagateEntries` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cphy_sections_handle_idx` (`handle`),
  KEY `cphy_sections_name_idx` (`name`),
  KEY `cphy_sections_structureId_idx` (`structureId`),
  KEY `cphy_sections_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `cphy_sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `cphy_structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cphy_sections` WRITE;
/*!40000 ALTER TABLE `cphy_sections` DISABLE KEYS */;

INSERT INTO `cphy_sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `propagateEntries`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,NULL,'Homepage','homepage','single',1,1,'2019-03-03 10:07:54','2019-03-03 15:11:32',NULL,'191ff4d9-22bf-4fc1-a47b-1123392d5f47'),
	(2,NULL,'Products','products','single',1,1,'2019-03-03 10:11:22','2019-03-03 10:12:17','2019-03-03 10:12:17','b836226f-cede-4efc-ba75-0d05bc7b60dc'),
	(3,NULL,'Products','products','single',1,1,'2019-03-03 10:17:00','2019-03-03 15:27:01',NULL,'750379a3-ba67-4a47-a6cc-e9b79bfca59f'),
	(4,NULL,'Company','company','channel',1,1,'2019-03-03 10:18:14','2019-03-03 14:49:39',NULL,'942fad99-0dfc-48e7-a565-fcfba401a8a3'),
	(5,NULL,'Contact','contact','single',1,1,'2019-03-03 10:18:45','2019-03-03 12:16:58',NULL,'82a69350-9107-4234-a575-59ba64b45ed5'),
	(6,NULL,'About','about','single',1,1,'2019-03-03 12:29:21','2019-03-03 13:22:29',NULL,'b056c259-c354-4920-b190-3028a2c5a441'),
	(7,NULL,'Product Items','productItems','channel',1,1,'2019-03-03 15:14:51','2019-03-04 12:32:17',NULL,'ffc7df34-fdb5-457c-aa15-5b93b9146df8');

/*!40000 ALTER TABLE `cphy_sections` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cphy_sections_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_sections_sites`;

CREATE TABLE `cphy_sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cphy_sections_sites_sectionId_siteId_unq_idx` (`sectionId`,`siteId`),
  KEY `cphy_sections_sites_siteId_idx` (`siteId`),
  CONSTRAINT `cphy_sections_sites_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `cphy_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cphy_sections_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `cphy_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cphy_sections_sites` WRITE;
/*!40000 ALTER TABLE `cphy_sections_sites` DISABLE KEYS */;

INSERT INTO `cphy_sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,1,1,'/','index.twig',1,'2019-03-03 10:07:54','2019-03-03 15:11:32','3e0485bd-3805-4b17-9c75-df029cc85300'),
	(2,2,1,1,'products','index',1,'2019-03-03 10:11:22','2019-03-03 10:12:17','b6447c85-7e86-4dea-a587-c50504fcfc1e'),
	(3,3,1,1,'/products','products/index.twig',1,'2019-03-03 10:17:00','2019-03-03 15:27:01','bf29afd0-abf3-4397-9631-683f9faba993'),
	(4,4,1,1,'company/{slug}','company/_staff.twig',1,'2019-03-03 10:18:14','2019-03-03 14:49:39','f80c6e9f-cf68-4ee1-8db9-01670bccc204'),
	(5,5,1,1,'contact','contact/index.twig',1,'2019-03-03 10:18:45','2019-03-03 12:16:58','1e5a8a09-93a2-408b-8a4a-0b04afdf8c2d'),
	(6,6,1,1,'about','about/_entry.twig',1,'2019-03-03 12:29:21','2019-03-03 13:22:29','ebb915c6-f0de-4b56-b3e2-0c16f286a32f'),
	(7,7,1,1,'products/{slug}','products/_entry.twig',1,'2019-03-03 15:14:51','2019-03-04 12:32:17','38d0e600-3afd-4fe0-83ca-1f8d228df8d0');

/*!40000 ALTER TABLE `cphy_sections_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cphy_sequences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_sequences`;

CREATE TABLE `cphy_sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table cphy_sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_sessions`;

CREATE TABLE `cphy_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cphy_sessions_uid_idx` (`uid`),
  KEY `cphy_sessions_token_idx` (`token`),
  KEY `cphy_sessions_dateUpdated_idx` (`dateUpdated`),
  KEY `cphy_sessions_userId_idx` (`userId`),
  CONSTRAINT `cphy_sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `cphy_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cphy_sessions` WRITE;
/*!40000 ALTER TABLE `cphy_sessions` DISABLE KEYS */;

INSERT INTO `cphy_sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(8,1,'9D9YgDKLl9fxk5d5tjqjJDV4hXyp9AA-lYUSBC8P0CWjNPnIDnppIp6fDyrHXBdcjvLm6vakhrWt_tZfHwMuWZqWFhCdjGJJh1B7','2019-03-06 06:30:00','2019-03-06 06:30:08','cb161fac-5582-4f25-b1c7-949f40af1256'),
	(9,1,'DsQUc44zJi72H82HzjvWGPyj2GMBZc-jLDIw24bwjznDZSSiylaBL5EH96hlIlKQfJVR_4Cb5U9UOSB5kteuGUbotIA6f_r3w4u7','2019-03-06 06:30:24','2019-03-06 06:30:30','31006b7a-5866-40f7-bd80-389ecd3b3f3f');

/*!40000 ALTER TABLE `cphy_sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cphy_shunnedmessages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_shunnedmessages`;

CREATE TABLE `cphy_shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cphy_shunnedmessages_userId_message_unq_idx` (`userId`,`message`),
  CONSTRAINT `cphy_shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `cphy_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table cphy_sitegroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_sitegroups`;

CREATE TABLE `cphy_sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cphy_sitegroups_name_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cphy_sitegroups` WRITE;
/*!40000 ALTER TABLE `cphy_sitegroups` DISABLE KEYS */;

INSERT INTO `cphy_sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,'Comphanny','2019-03-03 09:27:20','2019-03-03 09:27:20',NULL,'63404c82-7eba-42b0-9ed2-01ffc278562e');

/*!40000 ALTER TABLE `cphy_sitegroups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cphy_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_sites`;

CREATE TABLE `cphy_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cphy_sites_dateDeleted_idx` (`dateDeleted`),
  KEY `cphy_sites_handle_idx` (`handle`),
  KEY `cphy_sites_sortOrder_idx` (`sortOrder`),
  KEY `cphy_sites_groupId_fk` (`groupId`),
  CONSTRAINT `cphy_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `cphy_sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cphy_sites` WRITE;
/*!40000 ALTER TABLE `cphy_sites` DISABLE KEYS */;

INSERT INTO `cphy_sites` (`id`, `groupId`, `primary`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,1,1,'Comphanny','default','en-US',1,'$DEFAULT_SITE_URL',1,'2019-03-03 09:27:20','2019-03-03 09:27:20',NULL,'e2d75038-c4ed-417b-8edb-5a1037eaf3b0');

/*!40000 ALTER TABLE `cphy_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cphy_structureelements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_structureelements`;

CREATE TABLE `cphy_structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cphy_structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  KEY `cphy_structureelements_root_idx` (`root`),
  KEY `cphy_structureelements_lft_idx` (`lft`),
  KEY `cphy_structureelements_rgt_idx` (`rgt`),
  KEY `cphy_structureelements_level_idx` (`level`),
  KEY `cphy_structureelements_elementId_idx` (`elementId`),
  CONSTRAINT `cphy_structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `cphy_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cphy_structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `cphy_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cphy_structureelements` WRITE;
/*!40000 ALTER TABLE `cphy_structureelements` DISABLE KEYS */;

INSERT INTO `cphy_structureelements` (`id`, `structureId`, `elementId`, `root`, `lft`, `rgt`, `level`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,NULL,1,1,10,0,'2019-03-03 17:31:53','2019-03-03 17:33:02','598e34fd-758d-4dab-a2aa-f3656df537ab'),
	(2,1,25,1,2,3,1,'2019-03-03 17:31:53','2019-03-03 17:31:53','9547ed5a-2cf0-4b71-9fbb-8606c6e47722'),
	(3,1,26,1,4,5,1,'2019-03-03 17:32:15','2019-03-03 17:32:15','77f841a6-b3d9-43f4-b57d-c824317eea48'),
	(4,1,27,1,6,7,1,'2019-03-03 17:32:38','2019-03-03 17:32:38','cbb7d208-eb98-4229-869b-f337014ed452'),
	(5,1,28,1,8,9,1,'2019-03-03 17:33:02','2019-03-03 17:33:02','ad62cc79-5dc1-432b-9b97-72552a010dbe');

/*!40000 ALTER TABLE `cphy_structureelements` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cphy_structures
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_structures`;

CREATE TABLE `cphy_structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cphy_structures_dateDeleted_idx` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cphy_structures` WRITE;
/*!40000 ALTER TABLE `cphy_structures` DISABLE KEYS */;

INSERT INTO `cphy_structures` (`id`, `maxLevels`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,2,'2019-03-03 17:29:02','2019-03-03 17:34:16',NULL,'c911fe41-25c1-4e8b-92fd-275a7a5556a1');

/*!40000 ALTER TABLE `cphy_structures` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cphy_systemmessages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_systemmessages`;

CREATE TABLE `cphy_systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cphy_systemmessages_key_language_unq_idx` (`key`,`language`),
  KEY `cphy_systemmessages_language_idx` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table cphy_taggroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_taggroups`;

CREATE TABLE `cphy_taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cphy_taggroups_name_idx` (`name`),
  KEY `cphy_taggroups_handle_idx` (`handle`),
  KEY `cphy_taggroups_dateDeleted_idx` (`dateDeleted`),
  KEY `cphy_taggroups_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `cphy_taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `cphy_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table cphy_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_tags`;

CREATE TABLE `cphy_tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cphy_tags_groupId_idx` (`groupId`),
  CONSTRAINT `cphy_tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `cphy_taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cphy_tags_id_fk` FOREIGN KEY (`id`) REFERENCES `cphy_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table cphy_templatecacheelements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_templatecacheelements`;

CREATE TABLE `cphy_templatecacheelements` (
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  KEY `cphy_templatecacheelements_cacheId_idx` (`cacheId`),
  KEY `cphy_templatecacheelements_elementId_idx` (`elementId`),
  CONSTRAINT `cphy_templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `cphy_templatecaches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cphy_templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `cphy_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table cphy_templatecachequeries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_templatecachequeries`;

CREATE TABLE `cphy_templatecachequeries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `query` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cphy_templatecachequeries_cacheId_idx` (`cacheId`),
  KEY `cphy_templatecachequeries_type_idx` (`type`),
  CONSTRAINT `cphy_templatecachequeries_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `cphy_templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table cphy_templatecaches
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_templatecaches`;

CREATE TABLE `cphy_templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cphy_templatecaches_cacheKey_siteId_expiryDate_path_idx` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  KEY `cphy_templatecaches_cacheKey_siteId_expiryDate_idx` (`cacheKey`,`siteId`,`expiryDate`),
  KEY `cphy_templatecaches_siteId_idx` (`siteId`),
  CONSTRAINT `cphy_templatecaches_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `cphy_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table cphy_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_tokens`;

CREATE TABLE `cphy_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cphy_tokens_token_unq_idx` (`token`),
  KEY `cphy_tokens_expiryDate_idx` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cphy_tokens` WRITE;
/*!40000 ALTER TABLE `cphy_tokens` DISABLE KEYS */;

INSERT INTO `cphy_tokens` (`id`, `token`, `route`, `usageLimit`, `usageCount`, `expiryDate`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'bDoiDjEPF5bFZIKSEbBj3_5tB59PyHQp','[\"live-preview/preview\",{\"previewAction\":\"entries/preview-entry\",\"userId\":\"1\"}]',NULL,NULL,'2019-03-05 12:23:41','2019-03-04 12:23:41','2019-03-04 12:23:41','fe56ab36-d974-4f24-80a4-89d0f43dd358');

/*!40000 ALTER TABLE `cphy_tokens` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cphy_usergroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_usergroups`;

CREATE TABLE `cphy_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cphy_usergroups_handle_unq_idx` (`handle`),
  UNIQUE KEY `cphy_usergroups_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table cphy_usergroups_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_usergroups_users`;

CREATE TABLE `cphy_usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cphy_usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  KEY `cphy_usergroups_users_userId_idx` (`userId`),
  CONSTRAINT `cphy_usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `cphy_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cphy_usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `cphy_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table cphy_userpermissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_userpermissions`;

CREATE TABLE `cphy_userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cphy_userpermissions_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table cphy_userpermissions_usergroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_userpermissions_usergroups`;

CREATE TABLE `cphy_userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cphy_userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  KEY `cphy_userpermissions_usergroups_groupId_idx` (`groupId`),
  CONSTRAINT `cphy_userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `cphy_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cphy_userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `cphy_userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table cphy_userpermissions_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_userpermissions_users`;

CREATE TABLE `cphy_userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cphy_userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  KEY `cphy_userpermissions_users_userId_idx` (`userId`),
  CONSTRAINT `cphy_userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `cphy_userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cphy_userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `cphy_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table cphy_userpreferences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_userpreferences`;

CREATE TABLE `cphy_userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text,
  PRIMARY KEY (`userId`),
  CONSTRAINT `cphy_userpreferences_userId_fk` FOREIGN KEY (`userId`) REFERENCES `cphy_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cphy_userpreferences` WRITE;
/*!40000 ALTER TABLE `cphy_userpreferences` DISABLE KEYS */;

INSERT INTO `cphy_userpreferences` (`userId`, `preferences`)
VALUES
	(1,'{\"language\":\"en-US\",\"weekStartDay\":\"1\",\"enableDebugToolbarForSite\":false,\"enableDebugToolbarForCp\":false}');

/*!40000 ALTER TABLE `cphy_userpreferences` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cphy_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_users`;

CREATE TABLE `cphy_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cphy_users_uid_idx` (`uid`),
  KEY `cphy_users_verificationCode_idx` (`verificationCode`),
  KEY `cphy_users_email_idx` (`email`),
  KEY `cphy_users_username_idx` (`username`),
  KEY `cphy_users_photoId_fk` (`photoId`),
  CONSTRAINT `cphy_users_id_fk` FOREIGN KEY (`id`) REFERENCES `cphy_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cphy_users_photoId_fk` FOREIGN KEY (`photoId`) REFERENCES `cphy_assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cphy_users` WRITE;
/*!40000 ALTER TABLE `cphy_users` DISABLE KEYS */;

INSERT INTO `cphy_users` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'comphanny',NULL,'Com','Phanny','comphanny@example.com','$2y$13$YUJ7jxGyURbi2Jt00kgQVePCV6RCoUeFki1dmu6i91n38E0QQrr8S',1,0,0,0,'2019-03-06 06:30:24',NULL,NULL,NULL,'2019-03-06 06:30:18',NULL,1,NULL,NULL,NULL,0,'2019-03-06 06:30:00','2019-03-03 09:27:20','2019-03-06 06:30:24','b246a2f6-bc88-438c-bf43-e294363f0007');

/*!40000 ALTER TABLE `cphy_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cphy_volumefolders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_volumefolders`;

CREATE TABLE `cphy_volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cphy_volumefolders_name_parentId_volumeId_unq_idx` (`name`,`parentId`,`volumeId`),
  KEY `cphy_volumefolders_parentId_idx` (`parentId`),
  KEY `cphy_volumefolders_volumeId_idx` (`volumeId`),
  CONSTRAINT `cphy_volumefolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `cphy_volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cphy_volumefolders_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `cphy_volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cphy_volumefolders` WRITE;
/*!40000 ALTER TABLE `cphy_volumefolders` DISABLE KEYS */;

INSERT INTO `cphy_volumefolders` (`id`, `parentId`, `volumeId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,NULL,1,'About','','2019-03-03 12:01:29','2019-03-06 06:21:07','f31d7dc2-4b95-4356-baab-69b4efe82735'),
	(2,NULL,2,'Products','','2019-03-03 12:02:47','2019-03-06 06:21:33','fc5f7120-a6d2-4355-804b-2b705a04c3be'),
	(3,NULL,3,'Profiles','','2019-03-03 12:03:42','2019-03-06 06:20:35','24af9b77-5d7f-431e-9194-29e63023c1d3'),
	(4,NULL,NULL,'Temporary source',NULL,'2019-03-03 12:43:54','2019-03-03 12:43:54','370eb769-9d13-4930-83ab-7b1de164ddca'),
	(5,4,NULL,'user_1','user_1/','2019-03-03 12:43:54','2019-03-03 12:43:54','eaacf389-ca13-43cd-97ed-2f84b9dae130');

/*!40000 ALTER TABLE `cphy_volumefolders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cphy_volumes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_volumes`;

CREATE TABLE `cphy_volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) DEFAULT NULL,
  `settings` text,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cphy_volumes_name_idx` (`name`),
  KEY `cphy_volumes_handle_idx` (`handle`),
  KEY `cphy_volumes_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `cphy_volumes_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `cphy_volumes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `cphy_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cphy_volumes` WRITE;
/*!40000 ALTER TABLE `cphy_volumes` DISABLE KEYS */;

INSERT INTO `cphy_volumes` (`id`, `fieldLayoutId`, `name`, `handle`, `type`, `hasUrls`, `url`, `settings`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,NULL,'About','about','craft\\volumes\\Local',1,'$ASSET_BASE_URL_ABOUT','{\"path\":\"$FILE_SYSTEM_PATH_ABOUT\"}',1,'2019-03-03 12:01:29','2019-03-06 06:21:07',NULL,'c5545297-3c20-42eb-9d7a-6e914b34ecba'),
	(2,NULL,'Products','products','craft\\volumes\\Local',1,'$ASSET_BASE_URL_PRODUCTS','{\"path\":\"$FILE_SYSTEM_PATH_PRODUCTS\"}',2,'2019-03-03 12:02:47','2019-03-06 06:21:33',NULL,'f15fa10d-026b-4f9c-88f5-ca84334c8615'),
	(3,NULL,'Profiles','profiles','craft\\volumes\\Local',1,'$ASSET_BASE_URL_PROFILES','{\"path\":\"$FILE_SYSTEM_PATH_PROFILES\"}',3,'2019-03-03 12:03:42','2019-03-06 06:20:35',NULL,'4819b2f4-6231-466c-908f-96633885cd58');

/*!40000 ALTER TABLE `cphy_volumes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cphy_widgets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cphy_widgets`;

CREATE TABLE `cphy_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cphy_widgets_userId_idx` (`userId`),
  CONSTRAINT `cphy_widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `cphy_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cphy_widgets` WRITE;
/*!40000 ALTER TABLE `cphy_widgets` DISABLE KEYS */;

INSERT INTO `cphy_widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"section\":\"*\",\"siteId\":\"1\",\"limit\":10}',1,'2019-03-03 09:47:09','2019-03-03 09:47:09','85e3f51c-a9cd-4747-b797-79be972b9226'),
	(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2019-03-03 09:47:09','2019-03-03 09:47:09','bd4eecb9-9755-41b4-87ff-2c044c01e26d'),
	(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2019-03-03 09:47:09','2019-03-03 09:47:09','6d271f32-f724-4c13-8481-9ac5d8377eb8'),
	(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2019-03-03 09:47:09','2019-03-03 09:47:09','a50e6ac7-c91a-4004-aed9-5eaedbc0288f');

/*!40000 ALTER TABLE `cphy_widgets` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
