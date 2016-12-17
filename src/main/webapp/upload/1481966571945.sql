/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50548
Source Host           : localhost:3306
Source Database       : od

Target Server Type    : MYSQL
Target Server Version : 50548
File Encoding         : 65001

Date: 2016-12-17 16:23:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for od_department
-- ----------------------------
DROP TABLE IF EXISTS `od_department`;
CREATE TABLE `od_department` (
  `dep_id` int(11) NOT NULL AUTO_INCREMENT,
  `dep_name` varchar(255) DEFAULT NULL,
  `dep_desc` varchar(255) DEFAULT NULL,
  `dep_role` int(11) DEFAULT NULL,
  `dep_manager` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of od_department
-- ----------------------------
INSERT INTO `od_department` VALUES ('1', '党委办公室', null, null, '王清连');
INSERT INTO `od_department` VALUES ('2', '第一党', null, null, null);
INSERT INTO `od_department` VALUES ('3', '党委组织部', null, null, '宋亚伟');
INSERT INTO `od_department` VALUES ('4', '党委宣传部', null, null, '宋亚伟');
INSERT INTO `od_department` VALUES ('5', '党委统战部', null, null, '宋亚伟');
INSERT INTO `od_department` VALUES ('6', '党校', null, null, null);
INSERT INTO `od_department` VALUES ('7', '学生处', null, null, '刘莉莉');
INSERT INTO `od_department` VALUES ('8', '保卫处', null, null, '梅宪宾');
INSERT INTO `od_department` VALUES ('9', '党委研究生工作部', null, null, '宋亚伟');
INSERT INTO `od_department` VALUES ('10', '纪委', null, null, '陈自录');
INSERT INTO `od_department` VALUES ('11', '监察处', null, null, '陈自录');
INSERT INTO `od_department` VALUES ('12', '纪委办公室主任', null, null, null);
INSERT INTO `od_department` VALUES ('13', '校工会', null, null, '宋亚伟');
INSERT INTO `od_department` VALUES ('14', '校工会办公室', null, null, '');
INSERT INTO `od_department` VALUES ('15', '校团委', null, null, '宋亚伟');
INSERT INTO `od_department` VALUES ('16', '校长办公室', null, null, '李成伟');
INSERT INTO `od_department` VALUES ('17', '发展规划处', null, null, '苗双虎');
INSERT INTO `od_department` VALUES ('18', '人事处', null, null, '杨松璋');
INSERT INTO `od_department` VALUES ('19', '教务处', null, null, '冯启高');
INSERT INTO `od_department` VALUES ('20', '科技处', null, null, '何松林');
INSERT INTO `od_department` VALUES ('21', '研究生处', null, null, '何松林');
INSERT INTO `od_department` VALUES ('22', '招生就业处', null, null, '杨松璋');
INSERT INTO `od_department` VALUES ('23', '国际交流处', null, null, '刘莉莉');
INSERT INTO `od_department` VALUES ('24', '财务处', null, null, '苗双虎');
INSERT INTO `od_department` VALUES ('25', '资产处', null, null, '杨松璋');
INSERT INTO `od_department` VALUES ('26', '审计处', null, null, '苗双虎');
INSERT INTO `od_department` VALUES ('27', '后勤管理处', null, null, '何松林');
INSERT INTO `od_department` VALUES ('28', '基建处', null, null, '梅宪宾');
INSERT INTO `od_department` VALUES ('29', '离退休职工管理处', null, null, '杨松璋');
INSERT INTO `od_department` VALUES ('30', '学报编辑部', null, null, '刘莉莉');
INSERT INTO `od_department` VALUES ('31', '第三党', null, null, '');
INSERT INTO `od_department` VALUES ('32', '第四党', null, null, '');
INSERT INTO `od_department` VALUES ('33', '网络信息部', null, null, '');
INSERT INTO `od_department` VALUES ('34', '网络信息中心', null, null, '苗双虎');
INSERT INTO `od_department` VALUES ('35', '实验中心', null, null, '何松林');
INSERT INTO `od_department` VALUES ('36', '标本馆', null, null, '苗双虎');
INSERT INTO `od_department` VALUES ('37', '档案馆', null, null, '苗双虎');
INSERT INTO `od_department` VALUES ('38', '成人教育学院', null, null, '冯启高');
INSERT INTO `od_department` VALUES ('39', '职业教育培训中心', null, null, '冯启高');
INSERT INTO `od_department` VALUES ('40', '第五党', null, null, '');
INSERT INTO `od_department` VALUES ('41', '后勤服务集团', null, null, '何松林');
INSERT INTO `od_department` VALUES ('42', '高等职业技术学院', null, null, '冯启高');
INSERT INTO `od_department` VALUES ('43', '实业开发总公司', null, null, '何松林');
INSERT INTO `od_department` VALUES ('44', '校医院', null, null, '杨松璋');
INSERT INTO `od_department` VALUES ('45', '河南省杂交小麦工程技术研究中心', null, null, '王清连');
INSERT INTO `od_department` VALUES ('46', '教育科学研究所', null, null, '宋亚伟');
INSERT INTO `od_department` VALUES ('47', '教科教学督导办公室', null, null, '冯启高');
INSERT INTO `od_department` VALUES ('48', '新科学院', null, null, '梅宪宾');
INSERT INTO `od_department` VALUES ('49', '生命科技学院', null, null, '王清连');
INSERT INTO `od_department` VALUES ('50', '经济与管理学院', null, null, '李成伟');
INSERT INTO `od_department` VALUES ('51', '机电学院', null, null, '宋亚伟');
INSERT INTO `od_department` VALUES ('52', '食品学院', null, null, '冯启高');
INSERT INTO `od_department` VALUES ('53', '图书馆', null, null, '刘莉莉');
INSERT INTO `od_department` VALUES ('54', '园林园艺学院', null, null, '杨松璋');
INSERT INTO `od_department` VALUES ('55', '资源与环境学院', null, null, '梅宪宾');
INSERT INTO `od_department` VALUES ('56', '服装学院', null, null, '苗双虎');
INSERT INTO `od_department` VALUES ('57', '信息工程学院', null, null, '何松林');
INSERT INTO `od_department` VALUES ('58', '艺术学院', null, null, '冯启高');
INSERT INTO `od_department` VALUES ('59', '化学化工学院', null, null, '刘莉莉');
INSERT INTO `od_department` VALUES ('60', '计算化学研究所', null, null, '刘莉莉');
INSERT INTO `od_department` VALUES ('61', '数学科学学院', null, null, '杨松璋');
INSERT INTO `od_department` VALUES ('62', '文法学院', null, null, '陈自录');
INSERT INTO `od_department` VALUES ('63', '外国语学院', null, null, '梅宪宾');
INSERT INTO `od_department` VALUES ('64', '教育科学学院', null, null, '宋亚伟');
INSERT INTO `od_department` VALUES ('65', '体育学院', null, null, '何松林');
INSERT INTO `od_department` VALUES ('66', '马克思主义教育学院', null, null, '刘莉莉');
INSERT INTO `od_department` VALUES ('67', '第二党', null, null, '冯启高');
INSERT INTO `od_department` VALUES ('69', '动物科技学院', null, null, '苗双虎');
INSERT INTO `od_department` VALUES ('70', '校长办公室', null, null, '李成伟');
INSERT INTO `od_department` VALUES ('71', '党委武装部', null, null, '宋亚伟');
INSERT INTO `od_department` VALUES ('72', '党委学生工作部', null, null, '宋亚伟');
INSERT INTO `od_department` VALUES ('73', '河南科技学院', null, null, null);
INSERT INTO `od_department` VALUES ('74', '校友会', null, null, '梅宪宾');

-- ----------------------------
-- Table structure for od_evaluate
-- ----------------------------
DROP TABLE IF EXISTS `od_evaluate`;
CREATE TABLE `od_evaluate` (
  `eval_id` int(11) NOT NULL AUTO_INCREMENT,
  `eval_evalby` int(11) DEFAULT NULL,
  `eval_evalto` int(11) DEFAULT NULL,
  `eval_rank` int(11) DEFAULT NULL,
  `eval_cate` int(11) DEFAULT NULL,
  `eval_desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`eval_id`),
  KEY `FK_evalby` (`eval_evalby`),
  KEY `FK_evalto` (`eval_evalto`),
  CONSTRAINT `FK_evalby` FOREIGN KEY (`eval_evalby`) REFERENCES `od_user` (`user_id`),
  CONSTRAINT `FK_evalto` FOREIGN KEY (`eval_evalto`) REFERENCES `od_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of od_evaluate
-- ----------------------------

-- ----------------------------
-- Table structure for od_role
-- ----------------------------
DROP TABLE IF EXISTS `od_role`;
CREATE TABLE `od_role` (
  `role_id` int(255) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  `role_desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of od_role
-- ----------------------------
INSERT INTO `od_role` VALUES ('1', '校正厅', null);
INSERT INTO `od_role` VALUES ('2', '校副厅', null);
INSERT INTO `od_role` VALUES ('3', '党群部门', null);
INSERT INTO `od_role` VALUES ('4', '教学书记副书记', null);
INSERT INTO `od_role` VALUES ('5', '行政教辅部门', null);
INSERT INTO `od_role` VALUES ('6', '院系院长副院长', null);

-- ----------------------------
-- Table structure for od_user
-- ----------------------------
DROP TABLE IF EXISTS `od_user`;
CREATE TABLE `od_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `user_num` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_np` int(11) DEFAULT NULL,
  `user_report` varchar(255) DEFAULT NULL,
  `user_duty` varchar(255) DEFAULT NULL,
  `user_desc` varchar(255) DEFAULT NULL,
  `user_dep` int(11) DEFAULT NULL,
  `user_role` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `FK_user_role` (`user_role`),
  KEY `FK_user_dep` (`user_dep`),
  CONSTRAINT `FK_user_dep` FOREIGN KEY (`user_dep`) REFERENCES `od_department` (`dep_id`),
  CONSTRAINT `FK_user_role` FOREIGN KEY (`user_role`) REFERENCES `od_role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of od_user
-- ----------------------------
INSERT INTO `od_user` VALUES ('1', '郭建勋', 'guojianxun', '123456', '1', '', '党委办公室副主任', '', '1', '3');
INSERT INTO `od_user` VALUES ('2', '王三虎', 'wangerhu', '123456', '0', '', '党委组织部长', '', '3', '3');
INSERT INTO `od_user` VALUES ('3', '张玉新', 'zhangyuxin', '123456', '1', '', '党委组织副部长', '', '3', '3');
INSERT INTO `od_user` VALUES ('4', '姚刚', 'yaogang', '123456', '0', '', '党委宣传部部长', '', '4', '3');
INSERT INTO `od_user` VALUES ('5', '吴玲玲', 'wulingling', '123456', '1', '', '党委宣传部副部长', '', '4', '3');
INSERT INTO `od_user` VALUES ('6', '赵长春1', 'zhaochangchun', '123456', '0', '', '党校副校长', '', '3', '3');
INSERT INTO `od_user` VALUES ('7', '旦永刚', 'danyonggang', '123456', '0', '', '纪委副书记', '', '10', '3');
INSERT INTO `od_user` VALUES ('8', '宋荷英', 'songheying', '123456', '0', '', '党委统战部部长', '', '5', '3');
INSERT INTO `od_user` VALUES ('9', '王清连', 'wangqinglian', '123456', null, '', '校书记', '', '73', '1');
INSERT INTO `od_user` VALUES ('10', '郭秋平', 'guoqiuping', '123456', '0', '', '党委办公室主任', '', '1', '3');
INSERT INTO `od_user` VALUES ('11', '李峰梅', 'lifengmei', '123456', '0', '', '第一党总支书', '', '1', '3');
INSERT INTO `od_user` VALUES ('12', '陈腾', 'chenteng', '123456', '1', '', '纪委办公室主任', '', '10', '3');
INSERT INTO `od_user` VALUES ('13', '张彦军', 'zhangyanjun', '123456', '0', '', '院长办公室主任', '', '16', '5');
INSERT INTO `od_user` VALUES ('14', '杨永生', 'yangyongsheng', '123456', '1', '', '院长办公室副主任', '', '16', '5');
INSERT INTO `od_user` VALUES ('15', '李光磊', 'liguanglei', '123456', '1', '', '院长办公室副主任', '', '74', '5');
INSERT INTO `od_user` VALUES ('16', '马海燕', 'mahaiyan', '123456', '0', '', '校工会副主席', '', '13', '3');
INSERT INTO `od_user` VALUES ('17', '王俭敏', 'wangjianmin', '123456', '1', '', '院长办公室副主任', '', '16', '5');
INSERT INTO `od_user` VALUES ('18', '陈红卫', 'chenhongwei', '123456', '0', '', '发展规划处处长', '', '17', '5');
INSERT INTO `od_user` VALUES ('19', '刘明久', 'liumingjiu', '123456', '0', '', '生命科技学院院长', '', '49', '6');
INSERT INTO `od_user` VALUES ('20', '张天安', 'zhangtianan', '123456', '1', '', '发展规划处副处长', '', '17', '5');
INSERT INTO `od_user` VALUES ('21', '宋飞琼', 'songfeiqiong', '123456', '0', '', '人事处处长', '', '18', '5');
INSERT INTO `od_user` VALUES ('22', '茹振钢', 'ruzhengang', '123456', '0', '', '河南省杂交小麦工程技术研究中心主任', '', '45', '6');
INSERT INTO `od_user` VALUES ('23', '常景玲', 'changjingling', '123456', '1', '', '生命科技学院副院长', '', '49', '6');
INSERT INTO `od_user` VALUES ('24', '周  岩', 'zhouyan', '123456', '1', '', '生命科技学院副院长', '', '49', '6');
INSERT INTO `od_user` VALUES ('25', '胡海燕', 'huhaiyan', '123456', '1', '', '生命科技学院副院长', '', '49', '6');
INSERT INTO `od_user` VALUES ('26', '娄国强', 'louguoqiang', '123456', '0', '', '校工会副主席', '', '13', '3');
INSERT INTO `od_user` VALUES ('27', '黄中文', 'huangzhongli', '123456', '1', '', '生命科技学院副院长', '', '49', '6');
INSERT INTO `od_user` VALUES ('28', '胡铁柱', 'hutiezhu', '123456', '1', '', '河南省杂交小麦工程技术研究中心副主任', '', '45', '6');
INSERT INTO `od_user` VALUES ('29', '李  波', 'libo', '123456', '1', '', '人事处副处长', '', '18', '5');
INSERT INTO `od_user` VALUES ('30', '闫秀敏', 'yanxiumin', '123456', '0', '', '经济管理学院院长', '', '50', '6');
INSERT INTO `od_user` VALUES ('31', '郎群秀', 'langqunxiu', '123456', '1', '', '经济与管理学院副院长', '', '50', '6');
INSERT INTO `od_user` VALUES ('32', '冯  霞', 'fengxia', '123456', '1', '', '人事处副处长', '', '18', '5');
INSERT INTO `od_user` VALUES ('33', '龚俊朋', 'gongjunpeng', '123456', '1', '', '校工会副主席', '', '13', '3');
INSERT INTO `od_user` VALUES ('34', '张宏军', 'zhanghongjun', '123456', '1', '', '经济与管理学院副院长', '', '50', '6');
INSERT INTO `od_user` VALUES ('35', '郭运瑞', 'guoyunrui', '123456', '0', '', '教务处处长', '', '19', '5');
INSERT INTO `od_user` VALUES ('36', '郭立', 'guoli', '123456', '0', '', '校团委书记', '', '15', '3');
INSERT INTO `od_user` VALUES ('37', '傅  宇', 'fuyu', '123456', '0', '', '教务处常务副处长', '', '19', '5');
INSERT INTO `od_user` VALUES ('38', '史保金', 'shibaojin', '123456', '0', '', '教育教学督导办公室主任', '', '47', '5');
INSERT INTO `od_user` VALUES ('39', '苏建修', 'sujianxiu', '123456', '0', '', '机电学院院长', '', '51', '6');
INSERT INTO `od_user` VALUES ('40', '孙用明', 'sunyongming', '123456', '1', '', '教务处副处长', '', '19', '5');
INSERT INTO `od_user` VALUES ('41', '于江傲', 'yujiangao', '123456', '1', '', '校团委副书记', '', '15', '3');
INSERT INTO `od_user` VALUES ('42', '孔晓红', 'kongxiaohong', '123456', '1', '', '机电学院副院长', '', '51', '6');
INSERT INTO `od_user` VALUES ('43', '赵新亮', 'zhaoxinliang', '123456', '1', '', '教务处副处长', '', '19', '5');
INSERT INTO `od_user` VALUES ('44', '杜家熙', 'dujiaxi', '123456', '1', '', '机电学院副院长', '', '51', '6');
INSERT INTO `od_user` VALUES ('46', '孙俊良', 'sunjunliang', '123456', '0', '', '科技处处长', '', '20', '5');
INSERT INTO `od_user` VALUES ('47', '李勇峰', 'liyongfeng', '123456', '1', '', '机电学院副院长', '', '51', '6');
INSERT INTO `od_user` VALUES ('48', '王  锐', 'wangrui', '123456', '1', '', '科技处副处长', '', '20', '5');
INSERT INTO `od_user` VALUES ('49', '马汉军', 'mahanjun', '123456', '0', '', '食品学院院长', '', '52', '6');
INSERT INTO `od_user` VALUES ('50', '王新宇', 'wangxinyu', '123456', '0', '', '第二党总支书记', '', '67', '3');
INSERT INTO `od_user` VALUES ('51', '李保丽', 'libaoli', '123456', '1', '', '科技处副处长', '', '20', '5');
INSERT INTO `od_user` VALUES ('52', '周俊国', 'zhoujunguo', '123456', '1', '', '科技处副处长', '', '20', '5');
INSERT INTO `od_user` VALUES ('53', '魏新军', 'weixinjun', '123456', '1', '', '食品学院副院长', '', '52', '6');
INSERT INTO `od_user` VALUES ('54', '翟居怀', 'zhaijuhuai', '123456', '0', '', '学生处处长', '', '7', '5');
INSERT INTO `od_user` VALUES ('55', '何雅璞', 'heyapu', '123456', '0', '', '第三党总支书记', '', '31', '3');
INSERT INTO `od_user` VALUES ('56', '马新岭', 'maxinling', '123456', '1', '', '学生处副处长', '', '7', '5');
INSERT INTO `od_user` VALUES ('57', '莫海珍', 'mohaizhen', '123456', '1', '', '食品学院副院长', '', '52', '6');
INSERT INTO `od_user` VALUES ('58', '赵亦芳', 'zhaoyifang', '123456', '0', '', '第四党总支书记', '', '32', '3');
INSERT INTO `od_user` VALUES ('59', '张令文', 'zhanglingwen', '123456', '1', '', '食品学院副院长', '', '52', '6');
INSERT INTO `od_user` VALUES ('60', '杨宾峰', 'yangbinfeng', '123456', '1', '', '学生处副处长', '', '7', '5');
INSERT INTO `od_user` VALUES ('61', '乔有职', 'qiaoyouzhi', '123456', '0', '', '第五党总支书记', '', '40', '3');
INSERT INTO `od_user` VALUES ('62', '云  鹏', 'yunpeng', '123456', '1', '', '学生处副处长', '', '7', '5');
INSERT INTO `od_user` VALUES ('63', '胡建和', 'hujianhe', '123456', '0', '', '动物科学学院院长', '', '69', '6');
INSERT INTO `od_user` VALUES ('64', '王自良', 'wangziliang', '123456', '0', '', '研究生处处长', '', '21', '5');
INSERT INTO `od_user` VALUES ('65', '贺永惠', 'heyonghui', '123456', '1', '', '动物科学学院副院长', '', '69', '6');
INSERT INTO `od_user` VALUES ('66', '陈金山', 'chengjinshan', '123456', '1', '', '动物科学学院副院长', '', '69', '6');
INSERT INTO `od_user` VALUES ('67', '徐兆栋', 'xuzhaodong', '123456', '1', '', '研究生处副处长', '', '21', '5');
INSERT INTO `od_user` VALUES ('68', '葛亚明', 'geyaming', '123456', '1', '', '动物科学学院副院长', '', '69', '6');
INSERT INTO `od_user` VALUES ('69', '许光日', 'xuguangri', '123456', '1', '', '研究生处副处长', '', '21', '5');
INSERT INTO `od_user` VALUES ('70', '刘会超', 'liuhuichao', '123456', '0', '', '园林园艺学院院长', '', '54', '6');
INSERT INTO `od_user` VALUES ('71', '刘明鹏', 'liumingpeng', '123456', '0', '', '离退休职工管理处处长', '', '29', '3');
INSERT INTO `od_user` VALUES ('72', '何二毛', 'heermao', '123456', '0', '', '招生就业处处长', '', '22', '5');
INSERT INTO `od_user` VALUES ('73', '王吉田', 'wangjitian', '123456', '1', '', '招生就业处副处长', '', '22', '5');
INSERT INTO `od_user` VALUES ('74', '郑树景', 'zhengshujing', '123456', '1', '', '园林园艺副院长', '', '54', '6');
INSERT INTO `od_user` VALUES ('75', '李  刚', 'ligang', '123456', '1', '', '招生就业处副处长', '', '22', '5');
INSERT INTO `od_user` VALUES ('76', '赵瑞香', 'zhaoruixiang', '123456', '0', '', '国际交流处处长', '', '23', '5');
INSERT INTO `od_user` VALUES ('77', '周建设', 'zhoujianshe', '123456', '0', '', '财务处处长', '', '24', '5');
INSERT INTO `od_user` VALUES ('78', '扈惠灵', 'huhuiling', '123456', '1', '', '园林园艺副院长', '', '54', '6');
INSERT INTO `od_user` VALUES ('79', '陈锡岭', 'chenxiling', '123456', '0', '', '资源与环境学院院长', '', '55', '6');
INSERT INTO `od_user` VALUES ('80', '吴大付', 'wudafu', '123456', '1', '', '资源与环境学院副院长', '', '55', '6');
INSERT INTO `od_user` VALUES ('81', '郜庆炉', 'gaoqinglu', '123456', '0', '', '党委研究生工作部部长', '', '9', '3');
INSERT INTO `od_user` VALUES ('82', '孙居文', 'sunjuwen', '123456', '1', '', '财务处副处长', '', '24', '5');
INSERT INTO `od_user` VALUES ('83', '石明旺', 'shimingwang', '123456', '1', '', '资源与环境学院副院长', '', '55', '6');
INSERT INTO `od_user` VALUES ('84', '苗  芳', 'miaofang', '123456', '1', '', '财务处副处长', '', '24', '5');
INSERT INTO `od_user` VALUES ('85', '赵明富', 'zhaomingfu', '123456', '0', '', '信息工程学院院长', '', '57', '6');
INSERT INTO `od_user` VALUES ('86', '余  周', 'yuzhou', '123456', '1', '', '信息工程学院副院长', '', '57', '6');
INSERT INTO `od_user` VALUES ('87', '李国厚', 'liguohou', '123456', '1', '', '信息工程学院副院长', '', '57', '6');
INSERT INTO `od_user` VALUES ('88', '牛立元', 'niuliyuan', '123456', '0', '', '资产处处长', '', '25', '5');
INSERT INTO `od_user` VALUES ('89', '杨清河', 'yangqinghe', '123456', '0', '', '纪委正处级组织员', '1', '10', '3');
INSERT INTO `od_user` VALUES ('90', '张晓云', 'zhangxiaoyun', '123456', '1', '', '资产处副处长', '', '25', '5');
INSERT INTO `od_user` VALUES ('91', '古乐声', 'gulesheng', '123456', '1', '', '信息工程学院副院长', '', '57', '6');
INSERT INTO `od_user` VALUES ('92', '张立华', 'zhanglihua', '123456', '0', '', '审计处处长', '', '26', '5');
INSERT INTO `od_user` VALUES ('93', '贾  洁', 'jiajie', '123456', '1', '', '审计处副处长', '', '26', '5');
INSERT INTO `od_user` VALUES ('94', '张裕平', 'zhangyuping', '123456', '0', '', '化学化工学院院长', '', '59', '6');
INSERT INTO `od_user` VALUES ('95', '刘慧英', 'liuhuiying', '123456', '0', '', '党委统战部正处级组织员', '1', '4', '3');
INSERT INTO `od_user` VALUES ('96', '李  新', 'lixin', '123456', '0', '', '后勤管理处处长', '', '27', '5');
INSERT INTO `od_user` VALUES ('97', '连照勋', 'lianzhaoxun', '123456', '1', '', '化学化工学院副院长', '', '59', '6');
INSERT INTO `od_user` VALUES ('98', '李志峰', 'lizhifeng', '123456', '1', '', '后勤管理处副处长', '', '27', '5');
INSERT INTO `od_user` VALUES ('99', '冯喜兰', 'fengxilan', '123456', '1', '', '化学化工学院副院长', '', '59', '6');
INSERT INTO `od_user` VALUES ('100', '游红伟', 'youhongwei', '123456', '1', '', '后勤管理处副处长', '', '27', '5');
INSERT INTO `od_user` VALUES ('101', '李明友', 'limingyou', '123456', '0', '', '校工会正处级调研员', '1', '13', '3');
INSERT INTO `od_user` VALUES ('102', '武庆顺', 'wuqingshun', '123456', '0', '', '基建处处长', '', '28', '5');
INSERT INTO `od_user` VALUES ('103', '谷永庆', 'guyongqing', '123456', '1', '', '化学化工学院副院长', '', '59', '6');
INSERT INTO `od_user` VALUES ('104', '梁文生', 'liangwensheng', '123456', '1', '', '基建处副处长', '', '28', '5');
INSERT INTO `od_user` VALUES ('105', '姚树文', 'yaoshuwen', '123456', '1', '', '计算化学研究所所长', '', '60', '6');
INSERT INTO `od_user` VALUES ('106', '申万胜', 'shenwansheng', '123456', '1', '', '基建处总工程师', '', '28', '5');
INSERT INTO `od_user` VALUES ('107', '刘持忠', 'liuchizhong', '123456', '0', '', '生命科技学院党委书记', '', '49', '4');
INSERT INTO `od_user` VALUES ('108', '周全星', 'zhouquanxing', '123456', '0', '', '文法学院副院长', '', '62', '6');
INSERT INTO `od_user` VALUES ('109', '宋金狮', 'songjinshi', '123456', '0', '', '保卫处处长', '', '8', '5');
INSERT INTO `od_user` VALUES ('110', '王振军', 'wangzhenjun', '123456', '1', '', '文法学院副院长', '', '62', '6');
INSERT INTO `od_user` VALUES ('111', '宫海军', 'gonghaijun', '123456', '1', '', '保卫处副处长', '', '8', '5');
INSERT INTO `od_user` VALUES ('112', '张东旭', 'zhangdongxu', '123456', '1', '', '文法学院副院长', '', '62', '6');
INSERT INTO `od_user` VALUES ('113', '虎燕子', 'huyanzi', '123456', '1', '', '生命科技学院副党委书记', '', '49', '4');
INSERT INTO `od_user` VALUES ('114', '张少颖', 'zhangshaoying', '123456', '1', '', '保卫处副处长', '', '8', '5');
INSERT INTO `od_user` VALUES ('115', '李建芹', 'lijianqin', '123456', '0', '', '教育科学学院副院长', '', '64', '6');
INSERT INTO `od_user` VALUES ('116', '申家龙', 'shenjialong', '123456', '0', '', '教育科学研究所所长', '', '46', '6');
INSERT INTO `od_user` VALUES ('117', '韩香月', 'hanxiangyue', '123456', '0', '', '离退休职工管理处处长', '', '29', '5');
INSERT INTO `od_user` VALUES ('118', '马根喜', 'maxigen', '123456', '1', '', '离退休职工管理处副处长', '', '29', '5');
INSERT INTO `od_user` VALUES ('119', '刘秋云', 'liuqiuyun', '123456', '1', '', '教育科学学院副院长', '', '64', '6');
INSERT INTO `od_user` VALUES ('120', '刘刚', 'liugang', '123456', '0', '', '经济与管理学院党委书记', '', '50', '4');
INSERT INTO `od_user` VALUES ('121', '赵  坤', 'zhaokun', '123456', '0', '', '图书馆馆长', '', '53', '5');
INSERT INTO `od_user` VALUES ('122', '狄九凤', 'dijiufeng', '123456', '1', '', '图书馆副馆长', '', '53', '5');
INSERT INTO `od_user` VALUES ('123', '李小丽', 'lixiaoli', '123456', '1', '', '教育科学学院副院长', '', '64', '6');
INSERT INTO `od_user` VALUES ('124', '王玉婷', 'wangyuting', '123456', '1', '', '图书馆副馆长', '', '53', '5');
INSERT INTO `od_user` VALUES ('125', '张慧辉', 'zhanghuihui', '123456', '1', '', '经济与管理学院党委副书记', '', '50', '4');
INSERT INTO `od_user` VALUES ('126', '张社字', 'zhangshezi', '123456', '0', '', '学报编辑部主任', '', '30', '5');
INSERT INTO `od_user` VALUES ('127', '周  启', 'zhouqi', '123456', '1', '', '教育科学研究所副所长。', '', '46', '6');
INSERT INTO `od_user` VALUES ('128', '邓天福', 'dengtianfu', '123456', '1', '', '学报编辑部副主任', '', '30', '5');
INSERT INTO `od_user` VALUES ('129', '张新词', 'zhangxinci', '123456', '0', '', '艺术学院院长', '', '58', '6');
INSERT INTO `od_user` VALUES ('130', '张红岩', 'zhanghongyan', '123456', '1', '', '学报编辑部副主任', '', '30', '5');
INSERT INTO `od_user` VALUES ('131', '余鹏', 'yupeng', '123456', '0', '', '机电学院党委书记', '', '51', '4');
INSERT INTO `od_user` VALUES ('132', '张思镜', 'zhangsijing', '123456', '1', '', '艺术学院副院长', '', '58', '6');
INSERT INTO `od_user` VALUES ('133', '马孝琴', 'maxiaoqin', '123456', '0', '', '网络信息中心主任', '', '34', '5');
INSERT INTO `od_user` VALUES ('134', '肖文显', 'xiaowenxian', '123456', '1', '', '网络信息中心副主任', '', '34', '5');
INSERT INTO `od_user` VALUES ('135', '李印', 'liyin', '123456', '1', '', '机电学院副党委书记', '', '51', '4');
INSERT INTO `od_user` VALUES ('136', '姬英涛', 'jiyingtao', '123456', '1', '', '艺术学院副院长', '', '58', '6');
INSERT INTO `od_user` VALUES ('137', '郑竹林', 'zhengzhulin', '123456', '0', '', '实验中心主任', '', '35', '5');
INSERT INTO `od_user` VALUES ('138', '雷保杰', 'leibaojie', '123456', '1', '', '艺术学院副院长', '', '58', '6');
INSERT INTO `od_user` VALUES ('139', '马金友', 'majinyou', '123456', '1', '', '实验中心副主任', '', '35', '5');
INSERT INTO `od_user` VALUES ('140', '赵良', 'zhaoliang', '123456', '0', '', '食品学院党委书记', '', '52', '4');
INSERT INTO `od_user` VALUES ('141', '周萍', 'zhouping', '123456', '0', '', '服装学院副院长', '', '56', '6');
INSERT INTO `od_user` VALUES ('142', '田孟魁', 'tianmengkui', '123456', '0', '', '成人教育学院院长', '', '38', '5');
INSERT INTO `od_user` VALUES ('143', '段卫红', 'duanweihong', '123456', '1', '', '服装学院副院长', '', '56', '6');
INSERT INTO `od_user` VALUES ('144', '王洪亮', 'wanghongliang', '123456', '0', '', '职业教育培训中心主任', '', '39', '5');
INSERT INTO `od_user` VALUES ('145', '樊跃峰', 'fanyuefeng', '123456', '1', '', '机电学院副党委书记', '', '52', '4');
INSERT INTO `od_user` VALUES ('146', '贾喜玲', 'jiaxiling', '123456', '1', '', '成人教育学院副院长', '', '38', '5');
INSERT INTO `od_user` VALUES ('147', '常丽霞', 'changlixia', '123456', '1', '', '服装学院副院长', '', '56', '6');
INSERT INTO `od_user` VALUES ('148', '齐安国', 'qianguo', '123456', '1', '', '成人教育学院副院长', '', '38', '5');
INSERT INTO `od_user` VALUES ('149', '尤太生', 'youtaisheng', '123456', '0', '', '动物科学学院党委书记', '', '69', '4');
INSERT INTO `od_user` VALUES ('150', '张万琴', 'zhangwanqin', '123456', '0', '', '数学科学学院副院长', '', '61', '6');
INSERT INTO `od_user` VALUES ('151', '杨景旗', 'yangjingqi', '123456', '1', '', '职业教育培训中心副主任', '', '39', '5');
INSERT INTO `od_user` VALUES ('152', '王鲁伟', 'wangluwei', '123456', '1', '', '后勤服务集团副总经理', '', '41', '5');
INSERT INTO `od_user` VALUES ('153', '刘弘', 'liuhong', '123456', '1', '', '动物科学学院党委副书记', '', '69', '4');
INSERT INTO `od_user` VALUES ('154', '宋合成', 'songhecheng', '123456', '1', '', '后勤服务集团副总经理', '', '41', '5');
INSERT INTO `od_user` VALUES ('155', '董  瑞', 'dongrui', '123456', '1', '', '数学科学学院副院长', '', '61', '6');
INSERT INTO `od_user` VALUES ('156', '焦  涛', 'jiaotao', '123456', '0', '', '实业开发总公司总经理', '', '43', '5');
INSERT INTO `od_user` VALUES ('157', '冀红举', 'jihongju', '123456', '0', '', '园林园艺学院党委书记', '', '54', '4');
INSERT INTO `od_user` VALUES ('158', '赵  颖', 'zhaoying', '123456', '0', '', '外国语学院院长', '', '63', '6');
INSERT INTO `od_user` VALUES ('159', '张建设', 'zhangjianshe', '123456', '1', '', '实业开发总公司副总经理', '', '43', '5');
INSERT INTO `od_user` VALUES ('160', '李会民', 'lihuimin', '123456', '1', '', '外国语学院副院长', '', '63', '6');
INSERT INTO `od_user` VALUES ('161', '何茶叶', 'hechaye', '123456', '0', '', '校医院院长', '', '44', '5');
INSERT INTO `od_user` VALUES ('162', '陈松玲', 'chensongling', '123456', '1', '', '园林园艺学院党委副书记', '', '54', '4');
INSERT INTO `od_user` VALUES ('163', '万文龙', 'wanwenlong', '123456', '1', '', '外国语学院副院长', '', '63', '6');
INSERT INTO `od_user` VALUES ('164', '王振河', 'wangzhenhe', '123456', '0', '', '标本馆馆长', '', '36', '5');
INSERT INTO `od_user` VALUES ('165', '徐  武', 'xuwu', '123456', '0', '', '档案馆馆长', '', '37', '5');
INSERT INTO `od_user` VALUES ('166', '雷  鹏', 'leipeng', '123456', '0', '', '体育学院院长', '', '65', '6');
INSERT INTO `od_user` VALUES ('167', '高扬帆', 'gaoyangfan', '123456', '0', '', '资源与环境学院党委书记', '', '55', '4');
INSERT INTO `od_user` VALUES ('168', '乐玉忠', 'leyuzhong', '123456', '1', '', '体育学院副院长', '', '65', '6');
INSERT INTO `od_user` VALUES ('169', '李军民', 'lijunmin', '123456', '1', '', '资源与环境学院党委副书记', '', '55', '4');
INSERT INTO `od_user` VALUES ('170', '徐现峰', 'xuxianfeng', '123456', '1', '', '体育学院副院长', '', '65', '6');
INSERT INTO `od_user` VALUES ('171', '陈  桦', 'chenhua', '123456', '1', '', '后勤管理处副处级督导员', '', '27', '5');
INSERT INTO `od_user` VALUES ('172', '张桓武', 'zhanghengwu', '123456', '1', '', '', '', '73', '5');
INSERT INTO `od_user` VALUES ('173', '王冰蔚', 'wangbingwei', '123456', '0', '', '马克思主义教育学院院长', '', '66', '6');
INSERT INTO `od_user` VALUES ('174', '卫全民', 'weiquanmin', '123456', '0', '', '资产处正处级调研员', '1', '25', '5');
INSERT INTO `od_user` VALUES ('175', '郎瑞红', 'langruihong', '123456', '0', '', '信息工程学院党委书记', '', '57', '4');
INSERT INTO `od_user` VALUES ('176', '孙喜英', 'sunxiying', '123456', '1', '', '马克思主义教育学院副院长', '', '66', '6');
INSERT INTO `od_user` VALUES ('177', '李广保', 'liguangbao', '123456', '0', '', '成教学院正处级督导员', '1', '38', '5');
INSERT INTO `od_user` VALUES ('178', '陈锡渠', 'chenxiqu', '123456', '0', '', '高等职业技术学院院长', '', '42', '6');
INSERT INTO `od_user` VALUES ('179', '刘克平', 'liukeping', '123456', '1', '', '信息工程学院党委副书记', '', '57', '4');
INSERT INTO `od_user` VALUES ('180', '韩友刚', 'hanyougang', '123456', '0', '', '离退休职工管理处正处级调研员', '1', '29', '5');
INSERT INTO `od_user` VALUES ('181', '杨文平', 'yangwenping', '123456', '1', '', '高等职业技术学院副院长', '', '42', '6');
INSERT INTO `od_user` VALUES ('182', '刘希忠', 'liuxizhong', '123456', '0', '', '实业开发总公司副处级督导员', '1', '1', '5');
INSERT INTO `od_user` VALUES ('183', '杨国友', 'yangguowen', '123456', '1', '', '高等职业技术学院副院长', '', '42', '6');
INSERT INTO `od_user` VALUES ('184', '郭东升', 'guodongsheng', '123456', '0', '', '化学化工学院党委书记', '', '59', '4');
INSERT INTO `od_user` VALUES ('185', '吴艳兵', 'wuyanbing', '123456', '1', '', '高等职业技术学院副院长', '', '42', '6');
INSERT INTO `od_user` VALUES ('186', '郭超杰', 'guochaojie', '123456', '1', '', '化学化工学院党委副书记', '', '59', '4');
INSERT INTO `od_user` VALUES ('187', '于祯', 'yuzhen', '123456', '0', '', '文法学院党委书记', '', '62', '4');
INSERT INTO `od_user` VALUES ('188', '刘鸣滔', 'liuningtao', '123456', '0', '', '新科学院院长', '', '48', '6');
INSERT INTO `od_user` VALUES ('189', '李小琼', 'lixiaoqiong', '123456', '1', '', '文法学院党委副书记', '', '62', '4');
INSERT INTO `od_user` VALUES ('190', '张传来', 'zhangchuanlai', '123456', '1', '', '新科学院副院长', '', '48', '6');
INSERT INTO `od_user` VALUES ('191', '孟景舟', 'mengjingzhou', '123456', '0', '', '教育科学学院党委书记', '', '64', '4');
INSERT INTO `od_user` VALUES ('192', '张宝剑', 'zhangbaojian', '123456', '1', '', '新科学院副院长', '', '48', '6');
INSERT INTO `od_user` VALUES ('193', '朱宏', 'zhuhong', '123456', '1', '', '教育科学学院党委副书记', '', '64', '4');
INSERT INTO `od_user` VALUES ('194', '姚素梅', 'yaosumei', '123456', '1', '', '新科学院副院长', '', '48', '6');
INSERT INTO `od_user` VALUES ('195', '洪新华', 'hongxinhua', '123456', '1', '', '信工学院副处级调研员', '', '57', '6');
INSERT INTO `od_user` VALUES ('196', '张平', 'zhangping', '123456', '0', '', '艺术学院党委书记', '', '58', '4');
INSERT INTO `od_user` VALUES ('197', '孟  丽', 'mengli', '123456', '1', '', '生命科技学院副处级督导员', '', '49', '6');
INSERT INTO `od_user` VALUES ('198', '孙科祥', 'sunkexiang', '123456', '1', '', '食品学院副处级督导员', '', '52', '6');
INSERT INTO `od_user` VALUES ('199', '徐小玉', 'xuxiaoyu', '123456', '1', '', '艺术学院党委副书记', '', '58', '4');
INSERT INTO `od_user` VALUES ('200', '高跃', 'gaoyue', '123456', '0', '', '服装学院党委书记', '', '56', '4');
INSERT INTO `od_user` VALUES ('201', '邓沛栖', 'dengpeiqi', '123456', '1', '', '服装学院党委副书记', '', '56', '4');
INSERT INTO `od_user` VALUES ('202', '叶孟韬', 'yemengtao', '123456', '0', '', '数学科学学院党委书记', '', '61', '4');
INSERT INTO `od_user` VALUES ('203', '胡付广', 'hufuguang', '123456', '1', '', '数学科学学院党委副书记', '', '61', '4');
INSERT INTO `od_user` VALUES ('204', '娄天军', 'loutianjun', '123456', '0', '', '外国语学院党委书记', '', '63', '4');
INSERT INTO `od_user` VALUES ('205', '王秀金', 'wangxiujin', '123456', '1', '', '外国语学院党委副书记', '', '63', '4');
INSERT INTO `od_user` VALUES ('206', '任建成', 'renjiancheng', '123456', '0', '', '体育学院党委书记', '', '65', '4');
INSERT INTO `od_user` VALUES ('207', '杜兴安', 'duxingan', '123456', '1', '', '体育学院党委副书记', '', '65', '4');
INSERT INTO `od_user` VALUES ('208', '张涛', 'zhangtao', '123456', '0', '', '马克思主义教育学院党支部书记', '', '66', '4');
INSERT INTO `od_user` VALUES ('209', '巴新华', 'baxinhua', '123456', '0', '', '高等职业技术学院党委书记', '', '42', '4');
INSERT INTO `od_user` VALUES ('210', '丁福虎', 'dingfuhu', '123456', '1', '', '高等职业技术学院党委副书记', '', '42', '4');
INSERT INTO `od_user` VALUES ('211', '张忠迪', 'zahngzhomgdi', '123456', '0', '', '新科学院党委书记', '', '48', '4');
INSERT INTO `od_user` VALUES ('212', '牛玉', 'niuyu', '123456', '1', '', '新科学院党委副书记', '', '48', '4');
INSERT INTO `od_user` VALUES ('213', '熊仁杰', 'xiongrenjie', '123456', '1', '', '新科学院党委副书记', '', '48', '4');
INSERT INTO `od_user` VALUES ('214', '游春山', 'youchunshan', '123456', '0', '', '机电学院正处级调研员', '1', '51', '4');
INSERT INTO `od_user` VALUES ('215', '宋建伟', 'songjianwei', '123456', '0', '', '园艺园林学院正处级调研员', '1', '54', '4');
INSERT INTO `od_user` VALUES ('216', '谢桂英', 'xieguiying', '123456', '0', '', '信息工程学院正处级调研员', '1', '57', '4');
INSERT INTO `od_user` VALUES ('217', '李成伟', 'lichengwei', '123456', null, '', '校长', '', '73', '1');
INSERT INTO `od_user` VALUES ('218', '宋亚伟', 'songyawei', '123456', null, null, null, null, '73', '2');
INSERT INTO `od_user` VALUES ('219', '冯启高', 'fengqigao', '123456', null, null, null, null, '73', '2');
INSERT INTO `od_user` VALUES ('220', '苗双虎', 'miaoshuanghu', '123456', null, null, null, null, '73', '2');
INSERT INTO `od_user` VALUES ('221', '杨松璋', 'yangsongzhang', '123456', null, null, null, null, '73', '2');
INSERT INTO `od_user` VALUES ('222', '梅宪宾', 'meixianbin', '123456', null, null, null, null, '73', '2');
INSERT INTO `od_user` VALUES ('223', '何松林', 'hesonglin', '123456', null, null, null, null, '73', '2');
INSERT INTO `od_user` VALUES ('224', '刘莉莉', 'liulili', '123456', null, null, null, null, '73', '2');
INSERT INTO `od_user` VALUES ('225', '陈自录', 'chenzilu', '123456', null, null, null, null, '73', '2');
INSERT INTO `od_user` VALUES ('228', '田福禄', 'tianfulu', '123456', '0', '', '', '', '11', '3');
INSERT INTO `od_user` VALUES ('229', 'admin', 'admin', 'admin', null, null, null, null, '73', '1');
