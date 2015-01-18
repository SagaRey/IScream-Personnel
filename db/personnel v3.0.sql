/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50612
Source Host           : 127.0.0.1:3306
Source Database       : personnel

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2013-07-19 02:48:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for departments
-- ----------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `depid` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `parentdepid` int(4) DEFAULT NULL,
  `type` tinyint(2) NOT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `established` date NOT NULL,
  PRIMARY KEY (`depid`),
  UNIQUE KEY `name` (`name`),
  KEY `parentdepid` (`parentdepid`),
  CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`parentdepid`) REFERENCES `departments` (`depid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1015 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of departments
-- ----------------------------
INSERT INTO `departments` VALUES ('1000', '公司', null, '0', '51234000', '2007-01-01');
INSERT INTO `departments` VALUES ('1001', '行政部', '1000', '1', '51234101', '2007-01-02');
INSERT INTO `departments` VALUES ('1002', '营销部', '1000', '1', '51234200', '2007-01-05');
INSERT INTO `departments` VALUES ('1003', '市场中心', '1000', '1', '51234300', '2007-01-07');
INSERT INTO `departments` VALUES ('1004', '客服部', '1000', '1', '51234400', '2007-01-02');
INSERT INTO `departments` VALUES ('1005', '后勤部', '1000', '1', '51234500', '2007-01-02');
INSERT INTO `departments` VALUES ('1006', '人力资源部', '1001', '1', '51234101', '2007-01-03');
INSERT INTO `departments` VALUES ('1007', '运营管理部', '1001', '1', '51234102', '2007-01-03');
INSERT INTO `departments` VALUES ('1008', '产品事业部', '1002', '1', '51234201', '2007-01-06');
INSERT INTO `departments` VALUES ('1009', '销售部', '1002', '1', '51234202', '2007-01-06');
INSERT INTO `departments` VALUES ('1010', '策划部', '1003', '1', '51234301', '2007-01-10');
INSERT INTO `departments` VALUES ('1011', '调研部', '1003', '1', '51234302', '2007-01-10');
INSERT INTO `departments` VALUES ('1012', '工程部', '1003', '1', '51234303', '2007-01-10');
INSERT INTO `departments` VALUES ('1013', '渠道个人服务部', '1004', '1', '51234401', '2007-01-03');
INSERT INTO `departments` VALUES ('1014', '个人客服服务部', '1004', '1', '51234402', '2007-01-03');

-- ----------------------------
-- Table structure for dimission
-- ----------------------------
DROP TABLE IF EXISTS `dimission`;
CREATE TABLE `dimission` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `empid` int(8) NOT NULL,
  `dimissiondate` date NOT NULL,
  `type` tinyint(2) NOT NULL,
  `istalent` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `empid` (`empid`),
  CONSTRAINT `dimission_ibfk_1` FOREIGN KEY (`empid`) REFERENCES `employees` (`empid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dimission
-- ----------------------------
INSERT INTO `dimission` VALUES ('1', '10000000', '2013-07-08', '0', '0');
INSERT INTO `dimission` VALUES ('2', '10000003', '2008-06-28', '0', '1');
INSERT INTO `dimission` VALUES ('3', '10000013', '2013-04-04', '0', '0');
INSERT INTO `dimission` VALUES ('4', '10000011', '2013-03-01', '1', '1');
INSERT INTO `dimission` VALUES ('5', '10000016', '2011-02-11', '1', '1');
INSERT INTO `dimission` VALUES ('10', '10000001', '2013-07-19', '0', '1');
INSERT INTO `dimission` VALUES ('11', '10000002', '2013-07-20', '1', '0');

-- ----------------------------
-- Table structure for employees
-- ----------------------------
DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `empid` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `sex` varchar(6) DEFAULT NULL,
  `type` tinyint(2) NOT NULL,
  `birthday` date NOT NULL,
  `identity` varchar(18) DEFAULT NULL,
  `depid` int(4) NOT NULL,
  `postid` int(4) NOT NULL,
  `hiredate` date NOT NULL,
  `nativeplace` varchar(16) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`empid`),
  UNIQUE KEY `identity` (`identity`),
  KEY `depid` (`depid`),
  KEY `postid` (`postid`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`depid`) REFERENCES `departments` (`depid`) ON UPDATE CASCADE,
  CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`postid`) REFERENCES `posts` (`postid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10000020 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employees
-- ----------------------------
INSERT INTO `employees` VALUES ('10000000', '李承泽', 'male', '0', '1973-03-06', '412326199303062718', '1000', '6000', '2007-01-01', '天津', '52345789', 'iscream@126.com');
INSERT INTO `employees` VALUES ('10000001', '章则', 'male', '0', '1980-08-18', '134215198008181761', '1001', '6001', '2008-03-28', '北京', '56662210', 'vamoos@163.com');
INSERT INTO `employees` VALUES ('10000002', '李蕾', 'female', '0', '1982-09-20', '346789198209205621', '1001', '6002', '2010-03-28', '上海', '54443332', '7894321997@qq.com');
INSERT INTO `employees` VALUES ('10000003', '钱小样', 'female', '0', '1982-07-20', '346789198207205621', '1001', '6005', '2007-03-08', '安徽', '59043332', 'vandas@126.com');
INSERT INTO `employees` VALUES ('10000004', '吴炜', 'male', '0', '1985-07-08', '342789198207085621', '1007', '6006', '2012-03-28', '福建', '53343332', '2231137@qq.com');
INSERT INTO `employees` VALUES ('10000005', '孔融', 'male', '0', '1982-01-20', '345789198201205621', '1006', '6008', '2010-05-28', '山东', '53233332', '02336332@qq.com');
INSERT INTO `employees` VALUES ('10000006', '李白', 'male', '1', '1992-03-13', '346789198203135621', '1010', '6008', '2009-02-22', '四川', '55643332', 'ddwdwd@127.com');
INSERT INTO `employees` VALUES ('10000007', '王泽鉴', 'male', '0', '1972-09-20', '346789197209205621', '1010', '6009', '2010-03-28', '云南', '57890332', 'deerrikk@134.com');
INSERT INTO `employees` VALUES ('10000008', '胡小梅', 'female', '1', '1982-11-22', '346789198211225621', '1004', '6011', '2012-03-01', '上海', '54893332', '566778@qq.com');
INSERT INTO `employees` VALUES ('10000009', '叶小野', null, '1', '1985-11-20', null, '1008', '6014', '2013-03-28', null, '53452333', '1258567@qq.com');
INSERT INTO `employees` VALUES ('10000010', '陈灰灰', 'male', '0', '1985-01-20', '346789198501205621', '1008', '6016', '2013-01-28', '广东', '53678332', '6664327@qq.com');
INSERT INTO `employees` VALUES ('10000011', '胡志明', 'male', '0', '1971-04-20', '346789198504205621', '1008', '6017', '2007-05-08', '甘肃', '56784332', '76558567@qq.com');
INSERT INTO `employees` VALUES ('10000012', '吴宝宝', 'female', '1', '1986-12-10', '346789198612105621', '1012', '6018', '2011-02-10', '浙江', '53478942', '78800057@qq.com');
INSERT INTO `employees` VALUES ('10000013', '李琳', 'male', '0', '1990-11-20', '346789199011205621', '1009', '6019', '2012-06-18', '河南', '56666132', '899808567@qq.com');
INSERT INTO `employees` VALUES ('10000014', '郁达夫', 'male', '1', '1985-12-13', '346789198512135621', '1009', '6019', '2008-04-08', '湖北', '52134542', '34348567@qq.com');
INSERT INTO `employees` VALUES ('10000015', '吉喆', null, '1', '1992-12-20', null, '1013', '6020', '2013-08-08', null, '53531332', '2432458567@qq.com');
INSERT INTO `employees` VALUES ('10000016', '何宇', 'male', '0', '1987-04-10', '346789198704105621', '1012', '6018', '2011-01-11', '河北', '5322442', '78533057@qq.com');
INSERT INTO `employees` VALUES ('10000017', '赵琪', 'female', '0', '1990-11-10', '346789199011105621', '1013', '6018', '2011-02-10', '辽宁', '53113214', '724257@qq.com');
INSERT INTO `employees` VALUES ('10000018', '周梧州', 'male', '0', '1986-01-13', '346789198601135621', '1007', '6005', '2011-02-10', '天津', '53224942', '756457@qq.com');
INSERT INTO `employees` VALUES ('10000019', '汪丁丁', 'female', '1', '1991-12-10', '346789199112105621', '1009', '6019', '2013-05-17', '浙江', '53423942', '73252057@qq.com');

-- ----------------------------
-- Table structure for managements
-- ----------------------------
DROP TABLE IF EXISTS `managements`;
CREATE TABLE `managements` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `password` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of managements
-- ----------------------------
INSERT INTO `managements` VALUES ('1', 'admin', 'admin');

-- ----------------------------
-- Table structure for mobilizedep
-- ----------------------------
DROP TABLE IF EXISTS `mobilizedep`;
CREATE TABLE `mobilizedep` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `empid` int(8) NOT NULL,
  `originaldepid` int(4) NOT NULL,
  `currentdepid` int(4) NOT NULL,
  `mobilizedate` date NOT NULL,
  `type` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `empid` (`empid`),
  KEY `originaldepid` (`originaldepid`),
  KEY `currentdepid` (`currentdepid`),
  CONSTRAINT `mobilizedep_ibfk_1` FOREIGN KEY (`empid`) REFERENCES `employees` (`empid`) ON UPDATE CASCADE,
  CONSTRAINT `mobilizedep_ibfk_2` FOREIGN KEY (`originaldepid`) REFERENCES `departments` (`depid`) ON UPDATE CASCADE,
  CONSTRAINT `mobilizedep_ibfk_3` FOREIGN KEY (`currentdepid`) REFERENCES `departments` (`depid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mobilizedep
-- ----------------------------
INSERT INTO `mobilizedep` VALUES ('1', '10000005', '1006', '1011', '2013-02-12', '0');
INSERT INTO `mobilizedep` VALUES ('2', '10000011', '1008', '1003', '2013-04-20', '2');
INSERT INTO `mobilizedep` VALUES ('3', '10000004', '1007', '1001', '2013-10-25', '1');
INSERT INTO `mobilizedep` VALUES ('4', '10000005', '1001', '1002', '2013-07-19', '0');
INSERT INTO `mobilizedep` VALUES ('5', '10000004', '1001', '1002', '2013-07-19', '1');

-- ----------------------------
-- Table structure for mobilizepost
-- ----------------------------
DROP TABLE IF EXISTS `mobilizepost`;
CREATE TABLE `mobilizepost` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `empid` int(8) NOT NULL,
  `originalpostid` int(4) NOT NULL,
  `currentpostid` int(4) NOT NULL,
  `mobilizedate` date NOT NULL,
  `type` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `empid` (`empid`),
  KEY `originalpostid` (`originalpostid`),
  KEY `currentpostid` (`currentpostid`),
  CONSTRAINT `mobilizepost_ibfk_1` FOREIGN KEY (`empid`) REFERENCES `employees` (`empid`) ON UPDATE CASCADE,
  CONSTRAINT `mobilizepost_ibfk_2` FOREIGN KEY (`originalpostid`) REFERENCES `posts` (`postid`) ON UPDATE CASCADE,
  CONSTRAINT `mobilizepost_ibfk_3` FOREIGN KEY (`currentpostid`) REFERENCES `posts` (`postid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mobilizepost
-- ----------------------------
INSERT INTO `mobilizepost` VALUES ('1', '10000012', '6018', '6015', '2013-03-12', '2');
INSERT INTO `mobilizepost` VALUES ('2', '10000001', '6001', '6012', '2012-05-20', '1');
INSERT INTO `mobilizepost` VALUES ('3', '10000007', '6009', '6002', '2011-10-05', '0');
INSERT INTO `mobilizepost` VALUES ('5', '10000001', '6002', '6009', '2013-07-19', '0');

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `postid` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `type` tinyint(2) NOT NULL,
  `establishment` int(4) DEFAULT NULL,
  PRIMARY KEY (`postid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6021 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES ('6000', '总经理', '0', '1');
INSERT INTO `posts` VALUES ('6001', '行政总监', '0', '1');
INSERT INTO `posts` VALUES ('6002', '市场总监', '0', '1');
INSERT INTO `posts` VALUES ('6003', '人力资源部经理', '0', '1');
INSERT INTO `posts` VALUES ('6004', '产品主管', '0', '1');
INSERT INTO `posts` VALUES ('6005', '公关主管', '0', '1');
INSERT INTO `posts` VALUES ('6006', '后勤主任', '1', '1');
INSERT INTO `posts` VALUES ('6007', '广告专员', '1', '10');
INSERT INTO `posts` VALUES ('6008', '文案专员', '1', '25');
INSERT INTO `posts` VALUES ('6009', '创意专员', '1', '38');
INSERT INTO `posts` VALUES ('6010', '促销专员', '1', '67');
INSERT INTO `posts` VALUES ('6011', '商务代表', '1', '18');
INSERT INTO `posts` VALUES ('6012', '商务助理', '1', '8');
INSERT INTO `posts` VALUES ('6013', '销售代表', '1', '80');
INSERT INTO `posts` VALUES ('6014', '保安', '1', '10');
INSERT INTO `posts` VALUES ('6015', '清洁工', '1', '15');
INSERT INTO `posts` VALUES ('6016', '餐饮服务人员', '1', '12');
INSERT INTO `posts` VALUES ('6017', '司机', '1', '80');
INSERT INTO `posts` VALUES ('6018', '生产工人', '1', '800');
INSERT INTO `posts` VALUES ('6019', '销售人员', '1', '200');
INSERT INTO `posts` VALUES ('6020', '售后服务人员', '1', '36');

-- ----------------------------
-- Table structure for probationary
-- ----------------------------
DROP TABLE IF EXISTS `probationary`;
CREATE TABLE `probationary` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `empid` int(8) NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `status` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `empid` (`empid`),
  CONSTRAINT `probationary_ibfk_1` FOREIGN KEY (`empid`) REFERENCES `employees` (`empid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of probationary
-- ----------------------------
INSERT INTO `probationary` VALUES ('1', '10000008', '2012-03-01', '2012-04-01', '0');
INSERT INTO `probationary` VALUES ('2', '10000009', '2013-03-28', '2003-04-28', '0');
INSERT INTO `probationary` VALUES ('3', '10000010', '2013-01-28', '2013-02-28', '1');
INSERT INTO `probationary` VALUES ('4', '10000015', '2013-07-08', '2013-08-08', '0');
INSERT INTO `probationary` VALUES ('5', '10000001', '2013-07-19', '2013-08-23', '0');
INSERT INTO `probationary` VALUES ('6', '10000002', '2013-07-19', '2013-07-31', '1');

-- ----------------------------
-- Table structure for talents
-- ----------------------------
DROP TABLE IF EXISTS `talents`;
CREATE TABLE `talents` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `sex` varchar(2) NOT NULL,
  `birthday` date NOT NULL,
  `identity` varchar(18) NOT NULL,
  `nativeplace` varchar(16) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of talents
-- ----------------------------
INSERT INTO `talents` VALUES ('1', '杨晓过', '男', '1992-03-13', '346789198203135621', '青海', '56784321', 'jfefuffe@163.com');
INSERT INTO `talents` VALUES ('2', '孙宇', '女', '1988-02-27', '341224198802271672', '安徽', '53738283', '2444342@qq.com');
INSERT INTO `talents` VALUES ('3', '张宇泽', '男', '1983-03-08', '356728198303081374', '湖北', '58883221', 'edgy@sina.com');
INSERT INTO `talents` VALUES ('4', '樊小鱼', '女', '1991-12-23', '388774199112233432', '湖南', '58349922', 'dsdda@123.com');
INSERT INTO `talents` VALUES ('5', '张一帆', '女', '1981-05-17', '145367198105173452', '天津', '58329232', 'snsijie@163.com');
INSERT INTO `talents` VALUES ('6', '张翼德', '男', '1981-07-08', '167288198107083627', '四川', '58238292', '1323232@qq.com');
INSERT INTO `talents` VALUES ('7', '刘玄德', '男', '1979-08-19', '274722197908197327', '四川', '58283828', '1313121@qq.com');
INSERT INTO `talents` VALUES ('8', '孙尚香', '女', '1989-04-28', '133243198904288833', '浙江', '58232992', 'jddjklc@182.com');
INSERT INTO `talents` VALUES ('9', '习艺一', '男', '1990-09-10', '343291199009109933', '北京', '58239291', 'beijing@110.com');
INSERT INTO `talents` VALUES ('10', '班得瑞', '女', '1991-10-10', '148382199110109291', '北京', '59293293', 'djwduw@167.com');
INSERT INTO `talents` VALUES ('11', '罗斯福', '男', '1980-09-09', '223231233333333333', '天津', '33111212', 'defd@163.com');

-- ----------------------------
-- View structure for departmentinfo
-- ----------------------------
DROP VIEW IF EXISTS `departmentinfo`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `departmentinfo` AS select dep.depid,dep.name,dep.parentdepid,d.name parentdepname,dep.type,dep.phone,dep.established
	from departments dep left join departments d
	on dep.parentdepid = d.depid ;

-- ----------------------------
-- View structure for dimissioninfo
-- ----------------------------
DROP VIEW IF EXISTS `dimissioninfo`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `dimissioninfo` AS select dim.id,dim.empid,e.name empname,dim.dimissiondate ,e.depid depid,d.name depname,e.postid postid,p.name postname,dim.type,dim.istalent
	from dimission dim,employees e,departments d,posts p
	where dim.empid = e.empid and e.depid = d.depid and e.postid = p.postid ;

-- ----------------------------
-- View structure for employeeinfo
-- ----------------------------
DROP VIEW IF EXISTS `employeeinfo`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `employeeinfo` AS select e.empid,e.name,e.sex,e.type,e.birthday,e.identity,e.depid,d.name depname,e.postid,p.name postname,e.hiredate,e.nativeplace,e.phone,e.email
	from employees e,departments d,posts p
	where e.depid = d.depid and e.postid = p.postid ;

-- ----------------------------
-- View structure for mobilizedepinfo
-- ----------------------------
DROP VIEW IF EXISTS `mobilizedepinfo`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `mobilizedepinfo` AS select m.id,m.empid,e.name empname,m.originaldepid,d1.name originaldepname,m.currentdepid,d2.name currentdepname,m.mobilizedate,m.type
	from mobilizedep m,employees e,departments d1,departments d2
	where m.empid = e.empid and m.originaldepid = d1.depid and m.currentdepid = d2.depid ;

-- ----------------------------
-- View structure for mobilizepostinfo
-- ----------------------------
DROP VIEW IF EXISTS `mobilizepostinfo`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `mobilizepostinfo` AS select m.id,m.empid,e.name empname,m.originalpostid,p1.name originalpostname,m.currentpostid,p2.name currentpostname,m.mobilizedate,m.type
	from mobilizepost m,employees e,posts p1,posts p2
	where m.empid = e.empid and m.originalpostid = p1.postid and m.currentpostid = p2.postid ;

-- ----------------------------
-- View structure for probationaryinfo
-- ----------------------------
DROP VIEW IF EXISTS `probationaryinfo`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `probationaryinfo` AS select pro.id,pro.empid,e.name empname,pro.startdate,pro.enddate,e.depid,d.name depname,e.postid,p.name postname,pro.status
	from probationary pro,employees e,departments d,posts p
	where pro.empid = e.empid and e.depid = d.depid and e.postid = p.postid ;
