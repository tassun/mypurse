-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.10-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table pursedb.jinout
CREATE TABLE IF NOT EXISTS `jinout` (
  `userid` varchar(20) DEFAULT NULL,
  `site` varchar(15) DEFAULT NULL,
  `logseqno` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `logintime` datetime DEFAULT NULL,
  `logouttime` datetime DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `session` varchar(50) DEFAULT NULL,
  `kicker` varchar(20) DEFAULT NULL,
  `kicktime` datetime DEFAULT NULL,
  `browseragent` varchar(250) DEFAULT NULL,
  `browsername` varchar(50) DEFAULT NULL,
  `browserversion` varchar(50) DEFAULT NULL,
  `osname` varchar(50) DEFAULT NULL,
  `typename` varchar(50) DEFAULT NULL,
  `devicename` varchar(50) DEFAULT NULL,
  `familyname` varchar(50) DEFAULT NULL,
  `producername` varchar(50) DEFAULT NULL,
  UNIQUE KEY `logseqno` (`logseqno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ตารางเก็บรายการเข้าออกระบบ';

-- Data exporting was unselected.


-- Dumping structure for table pursedb.ladm
CREATE TABLE IF NOT EXISTS `ladm` (
  `keyid` varchar(55) DEFAULT NULL,
  `curtime` bigint(20) DEFAULT NULL,
  `trxtime` bigint(20) unsigned DEFAULT NULL,
  `edittime` datetime DEFAULT NULL,
  `owner` varchar(25) DEFAULT NULL,
  `process` varchar(15) DEFAULT NULL,
  `action` varchar(15) DEFAULT NULL,
  `seqno` int(11) unsigned DEFAULT NULL,
  `contents` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ตารางจัดเก็บข้อมูล log admin';

-- Data exporting was unselected.


-- Dumping structure for table pursedb.lms
CREATE TABLE IF NOT EXISTS `lms` (
  `keyid` varchar(50) DEFAULT NULL,
  `curtime` bigint(20) unsigned DEFAULT NULL,
  `trxtime` bigint(20) unsigned DEFAULT NULL,
  `edittime` datetime DEFAULT NULL,
  `owner` varchar(15) DEFAULT NULL,
  `process` varchar(15) DEFAULT NULL,
  `contents` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ตารางจัดเก็บ log sql contents';

-- Data exporting was unselected.


-- Dumping structure for table pursedb.tfavor
CREATE TABLE IF NOT EXISTS `tfavor` (
  `userid` varchar(20) NOT NULL,
  `programid` varchar(20) NOT NULL,
  `seqno` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`,`programid`,`seqno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table keep user favorite menu';

-- Data exporting was unselected.


-- Dumping structure for table pursedb.tprog
CREATE TABLE IF NOT EXISTS `tprog` (
  `product` varchar(30) NOT NULL DEFAULT '',
  `programid` varchar(20) NOT NULL,
  `progname` varchar(100) DEFAULT NULL,
  `progtype` varchar(2) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `parameters` varchar(80) DEFAULT NULL,
  `system` varchar(10) DEFAULT NULL,
  `iconfile` varchar(50) DEFAULT NULL,
  `iconstyle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`product`,`programid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ตารางเก็บรายชื่อโปรแกรม';

-- Data exporting was unselected.


-- Dumping structure for table pursedb.tproggrp
CREATE TABLE IF NOT EXISTS `tproggrp` (
  `groupname` varchar(20) NOT NULL,
  `programid` varchar(20) NOT NULL,
  PRIMARY KEY (`groupname`,`programid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table keep program by group';

-- Data exporting was unselected.


-- Dumping structure for table pursedb.trxd
CREATE TABLE IF NOT EXISTS `trxd` (
  `cdrefdate` date NOT NULL DEFAULT '0000-00-00',
  `cdcode` varchar(50) NOT NULL DEFAULT '',
  `userid` varchar(20) NOT NULL,
  `cdseqno` int(6) NOT NULL DEFAULT '0',
  `amt` decimal(20,2) DEFAULT '0.00',
  `remark` varchar(100) DEFAULT NULL,
  `editdate` date DEFAULT NULL,
  `edittime` time DEFAULT NULL,
  PRIMARY KEY (`cdrefdate`,`cdcode`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table pursedb.trxm
CREATE TABLE IF NOT EXISTS `trxm` (
  `cdrefdate` date NOT NULL DEFAULT '0000-00-00',
  `userid` varchar(20) NOT NULL DEFAULT '',
  `account` varchar(20) NOT NULL DEFAULT '',
  `amt` decimal(20,2) DEFAULT '0.00',
  `dnamt` decimal(20,2) DEFAULT '0.00',
  `cnamt` decimal(20,2) DEFAULT '0.00',
  `editdate` date DEFAULT NULL,
  `edittime` time DEFAULT NULL,
  `remark` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`cdrefdate`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table pursedb.trxp
CREATE TABLE IF NOT EXISTS `trxp` (
  `cdcode` varchar(50) NOT NULL DEFAULT '',
  `cdname` varchar(100) NOT NULL,
  `cdtype` char(1) DEFAULT '0' COMMENT '0=Payment,1=Receive',
  `cdstyle` varchar(50) DEFAULT NULL,
  `iconfile` varchar(50) DEFAULT NULL,
  `amt` decimal(20,2) DEFAULT '0.00',
  `ownflag` char(1) DEFAULT NULL COMMENT '1=Owner',
  `userid` varchar(10) DEFAULT NULL,
  `editdate` date DEFAULT NULL,
  `edittime` time DEFAULT NULL,
  PRIMARY KEY (`cdcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table pursedb.tul
CREATE TABLE IF NOT EXISTS `tul` (
  `seqno` bigint(15) NOT NULL DEFAULT '0',
  `curtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `userid` varchar(25) DEFAULT NULL,
  `site` varchar(15) DEFAULT NULL,
  `progid` varchar(25) DEFAULT NULL,
  `action` varchar(25) DEFAULT '',
  `remark` varchar(200) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ตารางจัดเก็บข้อมูล user tracking';

-- Data exporting was unselected.


-- Dumping structure for table pursedb.tuser
CREATE TABLE IF NOT EXISTS `tuser` (
  `userid` char(20) NOT NULL DEFAULT '',
  `username` char(50) DEFAULT NULL,
  `site` char(20) DEFAULT NULL,
  `userbranch` char(2) DEFAULT NULL,
  `usertname` char(50) DEFAULT NULL,
  `usertsurname` char(50) DEFAULT NULL,
  `userename` char(50) DEFAULT NULL,
  `useresurname` char(50) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `starttime` time DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `userpassword` char(100) DEFAULT NULL,
  `passwordexpiredate` date DEFAULT NULL,
  `deptcode` char(10) DEFAULT NULL,
  `divcode` char(10) DEFAULT NULL,
  `supervisor` char(20) DEFAULT NULL,
  `photoimage` char(100) DEFAULT NULL,
  `adminflag` char(1) DEFAULT NULL,
  `firstpage` char(50) DEFAULT NULL,
  `theme` char(20) DEFAULT NULL,
  `showphoto` char(1) DEFAULT NULL,
  `loginfailtimes` tinyint(3) unsigned DEFAULT '0',
  `lockflag` char(1) DEFAULT '0',
  `usertype` char(1) DEFAULT NULL,
  `iconfile` varchar(100) DEFAULT NULL,
  `accessdate` date DEFAULT NULL,
  `accesstime` time DEFAULT NULL,
  `accesshits` bigint(20) DEFAULT NULL,
  `failtime` bigint(20) DEFAULT NULL,
  `editdate` date DEFAULT NULL,
  `edittime` time DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `cardid` varchar(20) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `mobile` varchar(25) DEFAULT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `address3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table keep user info';

-- Data exporting was unselected.


-- Dumping structure for table pursedb.tusergrp
CREATE TABLE IF NOT EXISTS `tusergrp` (
  `userid` varchar(20) NOT NULL DEFAULT '',
  `groupname` varchar(20) NOT NULL DEFAULT '',
  `rolename` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`userid`,`groupname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table keep user in group';

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
