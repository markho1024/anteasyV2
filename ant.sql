/*
Navicat MySQL Data Transfer

Source Server         : momo
Source Server Version : 50521
Source Host           : localhost:3306
Source Database       : ant

Target Server Type    : MYSQL
Target Server Version : 50521
File Encoding         : 65001

Date: 2012-04-21 20:05:03
*/

SET FOREIGN_KEY_CHECKS=0;

DROP DATABASE IF EXISTS ant;
CREATE DATABASE ant;

-- ----------------------------
-- Table structure for `clazz`
-- ----------------------------
DROP TABLE IF EXISTS `clazz`;
CREATE TABLE `clazz` (
  `clazz_id` int(32) NOT NULL DEFAULT '0',
  `college_id` int(32) DEFAULT NULL,
  `major_id` int(32) DEFAULT NULL,
  `clazz_name` varchar(64) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `status` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`clazz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clazz
-- ----------------------------
INSERT INTO `clazz` VALUES ('0', '1', '101', '土院01班', '砝码夺柑地 在砝码砝码夺柑地 在砝码', '2012-03-16', '1');
INSERT INTO `clazz` VALUES ('801', '3', '8', '视风1—1', '硅夺在城 在地', '2012-03-17', '1');
INSERT INTO `clazz` VALUES ('20120802', '3', '309', '计院01班级', '夺在在在在 ', '2012-03-17', '1');
INSERT INTO `clazz` VALUES ('2012000803', '3', '8', '平右极好', '', '2012-03-21', '91');
INSERT INTO `clazz` VALUES ('2012000804', '4', '309', '压力4白', '砝码', '2012-04-18', '1');
INSERT INTO `clazz` VALUES ('2012031101', '3', '8', 'kk88', 'kk88', '2012-04-03', '91');

-- ----------------------------
-- Table structure for `college`
-- ----------------------------
DROP TABLE IF EXISTS `college`;
CREATE TABLE `college` (
  `college_id` int(32) NOT NULL DEFAULT '0',
  `college_name` varchar(64) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `status` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`college_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of college
-- ----------------------------
INSERT INTO `college` VALUES ('1', '股东现学院', '11', '2012-03-14', '1');
INSERT INTO `college` VALUES ('2', '中文学院', '232', '2012-03-15', '1');
INSERT INTO `college` VALUES ('3', '计算机学院', 'DODO', '2012-03-01', '1');
INSERT INTO `college` VALUES ('4', '土木学院', 'soso', '2012-03-18', '1');
INSERT INTO `college` VALUES ('5', '数学学院', '奔', '2012-03-15', '1');
INSERT INTO `college` VALUES ('6', '地理学院', '没的说', '2012-03-14', '91');
INSERT INTO `college` VALUES ('7', '物理de', '物理', '2012-03-17', '1');
INSERT INTO `college` VALUES ('8', '浮图学院', '中喹', '2012-03-01', '91');
INSERT INTO `college` VALUES ('9', '哥们中会', '极胡', '2012-03-01', '1');
INSERT INTO `college` VALUES ('10', 'rererrer', '', '2012-04-12', '1');
INSERT INTO `college` VALUES ('11', 'erewrer', 'erwerwerw', '2012-04-04', '1');
INSERT INTO `college` VALUES ('12', '33333', '343', null, '1');
INSERT INTO `college` VALUES ('13', 'efdfd', 'dfdf', null, '1');
INSERT INTO `college` VALUES ('14', 'e3434', '', null, '1');
INSERT INTO `college` VALUES ('15', 'rere', 'dfdf', '2012-03-08', '1');
INSERT INTO `college` VALUES ('16', 'e', '', null, '1');
INSERT INTO `college` VALUES ('17', '12345 ', '对方的', '2012-03-01', '1');
INSERT INTO `college` VALUES ('18', '事纱院', 'ert', '2012-04-12', null);
INSERT INTO `college` VALUES ('19', '没不夺炽', '辰辰', '2012-04-01', '1');
INSERT INTO `college` VALUES ('20', '没有车', '砝码', '2012-04-02', '1');
INSERT INTO `college` VALUES ('21', '中国优乐美', '侉基杰因', '2012-04-04', '1');

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `course_id` int(32) NOT NULL DEFAULT '0',
  `course_name` varchar(64) DEFAULT NULL,
  `college_id` int(32) DEFAULT NULL,
  `course_kind` varchar(4) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `status` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('310010', '机不胡在', '5', '1', '在在以', '2012-03-01', '91');
INSERT INTO `course` VALUES ('320011', '右手的道(1)', '3', '1', '中华', '2012-04-04', '91');
INSERT INTO `course` VALUES ('320012', '右手的道(2)', '3', '2', '中华', '2012-04-04', '1');
INSERT INTO `course` VALUES ('320013', '右手的道(3)', '3', '2', '中华', '2012-04-04', '1');
INSERT INTO `course` VALUES ('320014', '右手的道(4)', '3', '2', '中华', '2012-04-04', '1');
INSERT INTO `course` VALUES ('320021', '发发大大(1)', '3', '2', '', '2012-04-08', '1');
INSERT INTO `course` VALUES ('320022', '发发大大(2)', '3', '2', '', '2012-04-08', '1');
INSERT INTO `course` VALUES ('510010', '数理须左夺砝码', '5', '1', '4', '2012-03-06', '1');
INSERT INTO `course` VALUES ('510011', '数理须仍(1)', '5', '1', '4', '2012-03-06', '1');
INSERT INTO `course` VALUES ('510012', '数理须仍(2)', '5', '1', '4', '2012-03-06', '1');
INSERT INTO `course` VALUES ('510013', '数理须仍(3)', '5', '1', '4', '2012-03-06', '1');
INSERT INTO `course` VALUES ('510014', '数理须仍(4)', '5', '1', '4', '2012-03-06', '1');
INSERT INTO `course` VALUES ('520010', '叛国的分号', '5', '2', '八课时', '2012-04-02', '91');
INSERT INTO `course` VALUES ('520011', '叛国的分号(1)', '5', '2', '八课时', '2012-04-02', '1');
INSERT INTO `course` VALUES ('520012', '叛国的分号(2)', '5', '2', '八课时', '2012-04-02', '1');
INSERT INTO `course` VALUES ('520013', '叛国的分号(3)', '5', '2', '八课时', '2012-04-02', '1');
INSERT INTO `course` VALUES ('520014', '叛国的分号(4)', '5', '2', '八课时', '2012-04-02', '1');
INSERT INTO `course` VALUES ('520015', '叛国的分号(5)', '5', '2', '八课时', '2012-04-02', '1');
INSERT INTO `course` VALUES ('520016', '叛国的分号(6)', '5', '2', '八课时', '2012-04-02', '1');
INSERT INTO `course` VALUES ('520017', '叛国的分号(7)', '5', '2', '八课时', '2012-04-02', '1');
INSERT INTO `course` VALUES ('520018', '叛国的分号(8)', '5', '2', '八课时', '2012-04-02', '1');

-- ----------------------------
-- Table structure for `dict`
-- ----------------------------
DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict` (
  `dict_id` int(32) NOT NULL DEFAULT '0',
  `dict_type` varchar(32) DEFAULT NULL,
  `dict_code` varchar(4) DEFAULT NULL,
  `dict_name` varchar(64) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dict
-- ----------------------------
INSERT INTO `dict` VALUES ('1', 'user_type', '0', '管理员', null, '2012-03-17', '9');
INSERT INTO `dict` VALUES ('2', 'user_type', '2', '学院管理员', null, '2012-03-17', '2');
INSERT INTO `dict` VALUES ('3', 'user_type', '3', '教师', null, '2012-03-17', '1');
INSERT INTO `dict` VALUES ('4', 'user_type', '4', '学生', null, '2012-03-17', '1');
INSERT INTO `dict` VALUES ('5', 'user_type', '1', '学校管理员', null, '2012-03-17', '9');
INSERT INTO `dict` VALUES ('11', 'status', '1', '正常', null, '2012-03-17', '1');
INSERT INTO `dict` VALUES ('12', 'status', '9', '删除', null, '2012-03-17', '1');
INSERT INTO `dict` VALUES ('20', 'student_type', '0', '专科生', null, '2012-03-17', '1');
INSERT INTO `dict` VALUES ('21', 'student_type', '1', '本科生', null, '2012-03-17', '1');
INSERT INTO `dict` VALUES ('22', 'student_type', '2', '研究生', null, '2012-03-17', '1');
INSERT INTO `dict` VALUES ('40', 'party', '0', '群众', null, null, '1');
INSERT INTO `dict` VALUES ('41', 'party', '1', '共青团员', null, '2012-03-18', '1');
INSERT INTO `dict` VALUES ('42', 'party', '2', '共产党员', null, '2012-03-18', '1');
INSERT INTO `dict` VALUES ('43', 'party', '3', '民主党派', null, '2012-03-21', '1');
INSERT INTO `dict` VALUES ('71', 'course_kind', '1', '专业课', null, null, '1');
INSERT INTO `dict` VALUES ('72', 'course_kind', '2', '公开课', null, null, '1');
INSERT INTO `dict` VALUES ('80', 'score_type', '1', '正考', null, '2012-03-26', '1');
INSERT INTO `dict` VALUES ('81', 'score_type', '9', '补考', null, '2012-03-22', '1');
INSERT INTO `dict` VALUES ('111', 'status', '91', '已取消', null, '2012-03-17', '1');
INSERT INTO `dict` VALUES ('112', 'status', '95', '已离职', null, '2012-03-20', '1');
INSERT INTO `dict` VALUES ('113', 'status', '96', '已退学', null, '2012-03-20', '1');
INSERT INTO `dict` VALUES ('114', 'status', '97', '已锁定', null, null, '1');
INSERT INTO `dict` VALUES ('210', 'course_type', '1', '必修', null, '2012-03-22', '1');
INSERT INTO `dict` VALUES ('211', 'course_type', '2', '限选', null, '2012-03-22', '1');
INSERT INTO `dict` VALUES ('212', 'course_type', '3', '任选', null, '2012-03-22', '1');
INSERT INTO `dict` VALUES ('301', 'log_status', '1', '未录', null, null, '1');
INSERT INTO `dict` VALUES ('309', 'log_status', '9', '已录', null, null, '1');
INSERT INTO `dict` VALUES ('421', 'table_week', '1', '星期一', '', null, '1');
INSERT INTO `dict` VALUES ('422', 'table_week', '2', '星期二', null, null, '1');
INSERT INTO `dict` VALUES ('423', 'table_week', '3', '星期三', null, null, '1');
INSERT INTO `dict` VALUES ('424', 'table_week', '4', '星期四', null, null, '1');
INSERT INTO `dict` VALUES ('425', 'table_week', '5', '星期五', null, null, '1');
INSERT INTO `dict` VALUES ('426', 'table_week', '6', '星期六', null, null, '1');
INSERT INTO `dict` VALUES ('427', 'table_week', '7', '星期天', null, null, '1');
INSERT INTO `dict` VALUES ('431', 'table_day', '1', '第一大节', null, null, '1');
INSERT INTO `dict` VALUES ('432', 'table_day', '2', '第二大节', null, null, '1');
INSERT INTO `dict` VALUES ('433', 'table_day', '3', '第三大节', null, null, '1');
INSERT INTO `dict` VALUES ('434', 'table_day', '4', '第四大节', null, null, '1');
INSERT INTO `dict` VALUES ('435', 'table_day', '5', '第五大节', null, null, '1');
INSERT INTO `dict` VALUES ('441', 'period_type', '10', '全周', null, null, '1');
INSERT INTO `dict` VALUES ('444', 'period_type', '40', '1-14周', null, null, '1');
INSERT INTO `dict` VALUES ('445', 'period_type', '50', '1-15周', null, null, '1');
INSERT INTO `dict` VALUES ('446', 'period_type', '60', '1-16周', null, null, '1');
INSERT INTO `dict` VALUES ('447', 'period_type', '70', '1-17周', null, null, '1');
INSERT INTO `dict` VALUES ('448', 'period_type', '80', '1-18周', null, null, '1');
INSERT INTO `dict` VALUES ('449', 'period_type', '90', '1-19周', null, null, '1');
INSERT INTO `dict` VALUES ('551', 'score_kind', '1', '考试', null, null, '1');
INSERT INTO `dict` VALUES ('552', 'score_kind', '2', '考查', null, null, '1');
INSERT INTO `dict` VALUES ('560', 'score', 'E', '未通过', null, null, '1');
INSERT INTO `dict` VALUES ('561', 'score', 'D', '通过', null, null, '1');
INSERT INTO `dict` VALUES ('562', 'score', 'C', '中等', null, null, '1');
INSERT INTO `dict` VALUES ('563', 'score', 'B', '良好', null, null, '1');
INSERT INTO `dict` VALUES ('564', 'score', 'A', '优秀', null, null, '1');
INSERT INTO `dict` VALUES ('881', 'message', '1', '未读取', null, null, '1');
INSERT INTO `dict` VALUES ('882', 'message', '2', '未回复', null, null, '1');
INSERT INTO `dict` VALUES ('885', 'message', '5', '已读取', null, null, '1');
INSERT INTO `dict` VALUES ('886', 'message', '6', '已回复', null, null, '1');
INSERT INTO `dict` VALUES ('1001', 'sex', '1', '男', null, '2012-03-17', '1');
INSERT INTO `dict` VALUES ('1002', 'sex', '0', '女', null, '2012-03-17', '1');
INSERT INTO `dict` VALUES ('4421', 'period_type', '21', '单周', null, null, '1');
INSERT INTO `dict` VALUES ('4422', 'period_type', '22', '双周', null, null, '1');
INSERT INTO `dict` VALUES ('4431', 'period_type', '31', '1-9周', null, null, '1');
INSERT INTO `dict` VALUES ('4432', 'period_type', '32', '10-18周', null, null, '1');

-- ----------------------------
-- Table structure for `grade`
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `grade_id` int(32) NOT NULL DEFAULT '0',
  `grade_name` varchar(32) DEFAULT NULL,
  `student_type` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`grade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('111', '大一上', '1');
INSERT INTO `grade` VALUES ('112', '大一下', '1');
INSERT INTO `grade` VALUES ('211', '研一上', '2');
INSERT INTO `grade` VALUES ('212', '研一下', '2');
INSERT INTO `grade` VALUES ('911', '专一上', '0');
INSERT INTO `grade` VALUES ('912', '专一下', '0');

-- ----------------------------
-- Table structure for `major`
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major` (
  `major_id` int(32) NOT NULL DEFAULT '0',
  `major_name` varchar(64) DEFAULT NULL,
  `college_id` int(32) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `status` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`major_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES ('8', '计院1+2', '3', '奔', '2012-03-17', '1');
INSERT INTO `major` VALUES ('101', '日本语', '1', '小鬼了', '2012-03-17', '1');
INSERT INTO `major` VALUES ('201', '中古32', '12', '', '2012-03-01', '91');
INSERT INTO `major` VALUES ('309', '中车有学', '4', '夺', '2012-03-17', '1');
INSERT INTO `major` VALUES ('310', '软件日记', '3', '软件日记', '2012-04-04', '1');
INSERT INTO `major` VALUES ('311', '网络工程', '3', '网络工程', '2012-04-04', '1');

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `message_id` int(32) NOT NULL DEFAULT '0',
  `setter` varchar(32) DEFAULT NULL,
  `getter` varchar(32) DEFAULT NULL,
  `is_read` varchar(4) DEFAULT NULL,
  `is_reply` varchar(4) DEFAULT NULL,
  `read_date` date DEFAULT NULL,
  `tittle` varchar(64) DEFAULT NULL,
  `remark` varchar(1024) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `status` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', 'momoca', 'admin', '5', '6', null, 'zhong', 'df', '2012-04-02', '1');
INSERT INTO `message` VALUES ('2', 'admin', '10000', '5', '2', '2012-04-08', 'df', 'dadf', '2012-04-02', '1');
INSERT INTO `message` VALUES ('3', 'admin', '2012031001', '5', '2', '2012-04-04', 'MOMO', 'sekomo', '2012-04-02', '1');
INSERT INTO `message` VALUES ('4', '10000', 'admin', '1', '2', null, '跳在', 'df', '2012-04-03', '1');
INSERT INTO `message` VALUES ('5', '1203001', 'admin', '5', '2', '2012-04-04', 'admin', 'admin', '2012-04-03', '1');
INSERT INTO `message` VALUES ('6', '2012031001', '1203001', '1', '2', null, 'khdfd', 'dfasdfas', '2012-04-04', '1');

-- ----------------------------
-- Table structure for `open`
-- ----------------------------
DROP TABLE IF EXISTS `open`;
CREATE TABLE `open` (
  `open_id` int(32) NOT NULL,
  `course_id` int(32) DEFAULT NULL,
  `order_id` int(16) DEFAULT NULL,
  `college_id` int(32) DEFAULT NULL,
  `teacher_id` int(32) DEFAULT NULL,
  `table_day` varchar(4) DEFAULT NULL,
  `table_week` varchar(4) DEFAULT NULL,
  `period_type` varchar(4) DEFAULT NULL,
  `score_kind` varchar(4) DEFAULT NULL,
  `count_limit` int(4) DEFAULT NULL,
  `count_now` int(4) DEFAULT NULL,
  `period` int(4) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `course_type` varchar(4) DEFAULT NULL,
  `credit` float(5,0) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`open_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of open
-- ----------------------------
INSERT INTO `open` VALUES ('1', '520014', '0', '1', '1203002', '1', '1', '10', '1', '9', '1', '2', '123', '1', '2', '', '2012-04-02', '1');
INSERT INTO `open` VALUES ('2', '510012', '0', '2', '1203001', '1', '1', '10', '2', '9', '1', '2', 'dede', '1', '3', 'dede', '2012-04-02', '1');
INSERT INTO `open` VALUES ('3', '510012', '1', '3', '1207002', '5', '1', '10', '1', '9', '1', '40', '面枯', '1', '9', '夺', '2012-04-02', '1');
INSERT INTO `open` VALUES ('4', '510011', '0', '5', '1203001', '1', '1', '10', '1', '22', '1', '21', '22', '1', '2', '', '2012-04-03', '1');
INSERT INTO `open` VALUES ('5', '320011', '0', '3', '1202001', '1', '1', '40', '1', '4', '1', '4', '4', '1', '4', '4', '2012-04-05', '91');
INSERT INTO `open` VALUES ('6', '320011', '0', '3', '1202001', '1', '1', '10', '1', '22', '1', '22', '22', '1', '22', '22', null, '91');
INSERT INTO `open` VALUES ('7', '320011', '1', '3', '1203003', '2', '1', '10', '2', '11', '1', '11', '11', '2', '11', '11', null, '1');

-- ----------------------------
-- Table structure for `param`
-- ----------------------------
DROP TABLE IF EXISTS `param`;
CREATE TABLE `param` (
  `param_id` int(4) NOT NULL DEFAULT '0',
  `param_name` varchar(32) DEFAULT NULL,
  `param_value` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`param_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of param
-- ----------------------------
INSERT INTO `param` VALUES ('1', 'pageCount', '20');
INSERT INTO `param` VALUES ('2', 'choiceDate', '4-20>8-20');
INSERT INTO `param` VALUES ('3', 'logDate', '4-10>8-10');

-- ----------------------------
-- Table structure for `pick`
-- ----------------------------
DROP TABLE IF EXISTS `pick`;
CREATE TABLE `pick` (
  `pick_id` int(32) NOT NULL,
  `student_id` int(32) DEFAULT NULL,
  `open_id` int(32) DEFAULT NULL,
  `score_type` varchar(4) DEFAULT NULL,
  `score` varchar(32) DEFAULT NULL,
  `point` int(1) DEFAULT NULL,
  `log_status` varchar(4) DEFAULT NULL,
  `exam_date` date DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `status` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`pick_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pick
-- ----------------------------
INSERT INTO `pick` VALUES ('5', '2012041001', '7', '1', 'A', '4', '9', '2012-04-21', '', '2012-04-21', '1');
INSERT INTO `pick` VALUES ('6', '2012031001', '2', '1', 'C', '2', '9', '2012-04-18', '', '2012-04-21', '1');

-- ----------------------------
-- Table structure for `plan`
-- ----------------------------
DROP TABLE IF EXISTS `plan`;
CREATE TABLE `plan` (
  `plan_id` int(32) NOT NULL,
  `major_id` int(32) DEFAULT NULL,
  `course_id` int(32) DEFAULT NULL,
  `student_type` varchar(4) DEFAULT NULL,
  `grade_id` int(4) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `status` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plan
-- ----------------------------
INSERT INTO `plan` VALUES ('1', '309', '320014', '2', '211', '', '2012-04-05', '1');
INSERT INTO `plan` VALUES ('2', '101', '310010', '1', '111', '212', null, '1');
INSERT INTO `plan` VALUES ('4', '310', '320013', '1', '111', 'ddd', '2012-04-08', '1');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `student_id` int(32) NOT NULL DEFAULT '0',
  `student_name` varchar(64) DEFAULT NULL,
  `college_id` int(32) DEFAULT NULL,
  `major_id` int(32) DEFAULT NULL,
  `clazz_id` int(32) DEFAULT NULL,
  `student_type` varchar(4) DEFAULT NULL,
  `sex` varchar(4) DEFAULT NULL,
  `id_card` varchar(20) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `nation` varchar(64) DEFAULT NULL,
  `party` varchar(4) DEFAULT NULL,
  `jion_date` date DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `home_address` varchar(256) DEFAULT NULL,
  `mail_code` varchar(16) DEFAULT NULL,
  `hometown` varchar(64) DEFAULT NULL,
  `gra_school` varchar(64) DEFAULT NULL,
  `home_phone` varchar(16) DEFAULT NULL,
  `parent_name` varchar(64) DEFAULT NULL,
  `parent_phone` varchar(16) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `status` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('2012031001', '中亚春', '3', '8', '2012000804', '1', '1', '430922199912242343', '2012-04-01', '地', '0', '2012-04-04', '1234548888', 'es@qq.com', 'dfefe', '123456', '胡胯', '夺春佣兵', '1234567899', 'dded', '1234567890', '', '2012-04-05', '1');
INSERT INTO `student` VALUES ('2012041001', 'koko', '4', '309', '2012000804', '1', '1', '452322199012202343', '2012-01-01', 'ee', '0', '2012-04-19', '1234567890', '3@qq.com', '121221', '121221', 'ee', '2323', '122112121212', 'ddd', '1234567890', '211212', '2012-04-03', '1');

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `teacher_id` int(32) NOT NULL DEFAULT '0',
  `teacher_name` varchar(64) DEFAULT NULL,
  `college_id` int(32) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `status` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1202001', 'dede', '3', '7654321233', '738@qq.com', '', '2012-04-02', '1');
INSERT INTO `teacher` VALUES ('1203001', '张为', '3', '1234567888', 'rew@164.com', 'dfd ', '2012-03-17', '1');
INSERT INTO `teacher` VALUES ('1203002', '没胡的', '14', '1234567890', '22@qq.com', 'w', '2012-03-01', '1');
INSERT INTO `teacher` VALUES ('1203003', 'fdsf', '3', 'dfdsfdfd', '360@qq.com', 'dfdf', '2012-03-01', '95');
INSERT INTO `teacher` VALUES ('1203005', '中以有', '3', '1234455533', '1@qq.com', 'dfd', '2012-04-07', '1');
INSERT INTO `teacher` VALUES ('1207001', '笑命', '7', '11111111111', '67@ww.com', 'dfd ', '2012-03-02', '1');
INSERT INTO `teacher` VALUES ('1207002', '中税费改革', '7', '1342352345324', '234@qq.com', 'dfdffd', '2012-03-01', '95');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(32) NOT NULL DEFAULT '0',
  `login_id` varchar(32) NOT NULL DEFAULT '',
  `user_name` varchar(64) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `college_id` int(32) DEFAULT NULL,
  `user_type` varchar(4) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `status` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1203001', '张为', 'java', '3', '3', 'fr', '2012-03-27', '1');
INSERT INTO `user` VALUES ('2', '1203002', '没胡的', '1203002', '3', '3', 'd', null, '97');
INSERT INTO `user` VALUES ('3', '2012030001', '实验室', '12345', '3', '4', '', null, '1');
INSERT INTO `user` VALUES ('4', 'admin', '系统管理员', 'admin', null, '0', '', null, '1');
INSERT INTO `user` VALUES ('5', '10000', '学校管理员', '000000', null, '1', 'momoca', null, '97');
INSERT INTO `user` VALUES ('6', '2012031001', '中亚春', 'javame', '3', '4', null, null, '1');
INSERT INTO `user` VALUES ('7', '21', '中国优乐美', '21st', '21', '2', null, null, '1');
INSERT INTO `user` VALUES ('8', '3', '计算机学院', '3st', '3', '2', null, null, '1');
INSERT INTO `user` VALUES ('9', '2012041001', 'koko', '2012041001st', '4', '4', null, null, '1');
INSERT INTO `user` VALUES ('10', '1203005', '中以有', '1203005st', '3', '3', null, null, '1');
