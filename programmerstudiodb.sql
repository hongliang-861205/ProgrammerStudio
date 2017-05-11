CREATE DATABASE `programmerstudiodb` /*!40100 DEFAULT CHARACTER SET utf8 */;

CREATE TABLE `pro_admin` (
  `admin_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(32) NOT NULL,
  `lastloginip` varchar(15) NOT NULL DEFAULT ' ',
  `lastlogintime` int(10) unsigned NOT NULL DEFAULT '0',
  `email` varchar(255) DEFAULT NULL,
  `realname` varchar(45) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `questions` varchar(255) DEFAULT NULL,
  `answers` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `pro_provider` (
  `provider_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `providername` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(32) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `pro_server` (
  `server_id` tinyint(3) unsigned NOT NULL,
  `serverip` varchar(15) NOT NULL,
  `serverport` smallint(5) unsigned NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(50) NOT NULL,
  `provider` tinyint(3) unsigned NOT NULL,
  `status` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`server_id`),
  KEY `fk_provider_id_idx` (`provider`),
  CONSTRAINT `fk_provider_id` FOREIGN KEY (`provider`) REFERENCES `pro_provider` (`provider_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `pro_domain` (
  `domain_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domainname` varchar(150) NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT '国际域名',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `expire` int(11) NOT NULL DEFAULT '0',
  `provider` tinyint(3) unsigned NOT NULL,
  `istcprecord` bit(1) NOT NULL DEFAULT b'0',
  `ispolicerecord` bit(1) NOT NULL,
  `owner` varchar(45) NOT NULL,
  PRIMARY KEY (`domain_id`),
  KEY `fk_domain_provider_id_idx` (`provider`),
  CONSTRAINT `fk_domain_provider_id` FOREIGN KEY (`provider`) REFERENCES `pro_provider` (`provider_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `pro_website` (
  `website_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `websitename` varchar(150) NOT NULL,
  `maindomain` varchar(255) NOT NULL,
  `secondarydomain` text,
  `adminusername` varchar(45) NOT NULL,
  `adminpassword` varchar(32) NOT NULL,
  `adminaddress` varchar(255) NOT NULL,
  `type` varchar(45) NOT NULL DEFAULT 'PC站',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `server_id` tinyint(3) unsigned NOT NULL,
  `ftpip` varchar(15) DEFAULT NULL,
  `ftpport` smallint(6) DEFAULT NULL,
  `ftpuser` varchar(150) DEFAULT NULL,
  `ftppassword` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`website_id`),
  KEY `fk_website_server_id_idx` (`server_id`),
  CONSTRAINT `fk_website_server_id` FOREIGN KEY (`server_id`) REFERENCES `pro_server` (`server_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

