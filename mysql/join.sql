CREATE DATABASE IF NOT EXISTS `join` default charset utf8 COLLATE utf8_general_ci;

use `join`;



SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for rms_admin
-- ----------------------------
DROP TABLE IF EXISTS `rms_admin`;
CREATE TABLE `rms_admin` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称/姓名',
  `phone` bigint(11) NOT NULL DEFAULT '0' COMMENT '手机号',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `last_login_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上次登录时间',
  `last_login_ip` varchar(40) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `verify` varchar(32) NOT NULL DEFAULT '' COMMENT '证验码',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `role_id` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '对应角色ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `username` (`username`) USING BTREE,
  KEY `phone` (`phone`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE,
  KEY `update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='后台用户表';

-- ----------------------------
-- Records of rms_admin
-- ----------------------------
BEGIN;
INSERT INTO `rms_admin` VALUES (1, 'admin', '超级管理员', 18384244011, '09f0536f7514f88b575cc668bca9c340', 1557723499, '::1', 'ZdLZ4n', '254253325@qq.com', '拥有网站最高权限', 1555494500, 1557723499, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for rms_admin_login_error
-- ----------------------------
DROP TABLE IF EXISTS `rms_admin_login_error`;
CREATE TABLE `rms_admin_login_error` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login_error` tinyint(1) NOT NULL DEFAULT '0' COMMENT '登录错误次数',
  `error_time` int(10) NOT NULL DEFAULT '0' COMMENT '错误时间',
  `login_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '登录ip',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `login_error` (`login_error`) USING BTREE,
  KEY `error_time` (`error_time`) USING BTREE,
  KEY `login_ip` (`login_ip`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='后台用户登录出错限制';

-- ----------------------------
-- Records of rms_admin_login_error
-- ----------------------------
BEGIN;
INSERT INTO `rms_admin_login_error` VALUES (8, 2, 1540273823, '127.0.0.1');
INSERT INTO `rms_admin_login_error` VALUES (9, 41, 1555748007, '::1');
COMMIT;

-- ----------------------------
-- Table structure for rms_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `rms_admin_menu`;
CREATE TABLE `rms_admin_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `pid` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '上级菜单',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型 1显示 0不显示',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否禁用 1正常 0禁用',
  `order` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  `logo` varchar(255) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  KEY `type` (`type`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `order` (`order`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE,
  KEY `update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='后台菜单表';

-- ----------------------------
-- Records of rms_admin_menu
-- ----------------------------
BEGIN;
INSERT INTO `rms_admin_menu` VALUES (1, '管理员管理', 0, '0', 1, 1, 0, 'Hui-iconfont-root', 1540195023, 1552360414);
INSERT INTO `rms_admin_menu` VALUES (2, '管理员列表', 1, 'admin/admin/index', 1, 1, 0, '', 1540195061, 1552360414);
INSERT INTO `rms_admin_menu` VALUES (3, '菜单管理', 1, 'admin/admin_menu/index', 1, 1, 0, '', 1540195090, 1552360414);
INSERT INTO `rms_admin_menu` VALUES (4, '角色管理', 1, 'admin/admin_role/index', 1, 1, 0, '', 1540195124, 1552360414);
INSERT INTO `rms_admin_menu` VALUES (5, '添加管理员', 2, 'admin/admin/adminadd', 0, 1, 0, '', 1540195203, 1552360414);
INSERT INTO `rms_admin_menu` VALUES (6, '编辑管理员', 2, 'admin/admin/adminedit', 0, 1, 0, '', 1540195276, 1552360414);
INSERT INTO `rms_admin_menu` VALUES (7, '禁用管理员', 2, 'admin/admin/banuser', 0, 1, 0, '', 1540195315, 1552360414);
INSERT INTO `rms_admin_menu` VALUES (8, '删除管理员', 2, 'admin/admin/deluser', 0, 1, 0, '', 1540195418, 1552360414);
INSERT INTO `rms_admin_menu` VALUES (9, '添加菜单', 3, 'admin/admin_menu/menuadd', 0, 1, 0, '', 1540195489, 1552360414);
INSERT INTO `rms_admin_menu` VALUES (10, '编辑菜单', 3, 'admin/admin_menu/menuedit', 0, 1, 0, '', 1540195912, 1552360414);
INSERT INTO `rms_admin_menu` VALUES (11, '删除菜单', 3, 'admin/admin_menu/menudel', 0, 1, 0, '', 1540196122, 1552360414);
INSERT INTO `rms_admin_menu` VALUES (12, '添加角色', 4, 'admin/admin_role/roleadd', 0, 1, 0, '', 1540196277, 1552360414);
INSERT INTO `rms_admin_menu` VALUES (13, '修改角色', 4, 'admin/admin_role/roleedit', 0, 1, 0, '', 1540196326, 1552360414);
INSERT INTO `rms_admin_menu` VALUES (14, '删除角色', 4, 'admin/admin_role/roledel', 0, 1, 0, '', 1540196388, 1552360414);
INSERT INTO `rms_admin_menu` VALUES (16, '投标管理', 0, 'admin/index/index', 1, 1, 0, 'Hui-iconfont-hetong', 1555482661, 1555494484);
INSERT INTO `rms_admin_menu` VALUES (17, '供应商管理', 16, 'admin/supplier/index', 1, 1, 0, '', 1555482710, 1556619066);
INSERT INTO `rms_admin_menu` VALUES (19, '招标公告', 16, 'admin/notice/index', 1, 1, 0, '', 1555482766, 1556526006);
INSERT INTO `rms_admin_menu` VALUES (20, '中标公告', 16, 'admin/winning/index', 1, 1, 0, '', 1555482792, 1556610393);
COMMIT;

-- ----------------------------
-- Table structure for rms_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `rms_admin_role`;
CREATE TABLE `rms_admin_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `order` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段',
  `auth` text NOT NULL COMMENT '权限',
  `status` smallint(1) NOT NULL DEFAULT '0' COMMENT '状态 1 开启 2 禁用',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE,
  KEY `update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色信息列表';

-- ----------------------------
-- Records of rms_admin_role
-- ----------------------------
BEGIN;
INSERT INTO `rms_admin_role` VALUES (1, '超级管理员', '拥有网站最高权限', 1555495788, 1555495788, 0, '', 1);
COMMIT;

-- ----------------------------
-- Table structure for rms_bid
-- ----------------------------
DROP TABLE IF EXISTS `rms_bid`;
CREATE TABLE `rms_bid` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键 ----投标表',
  `user_id` int(10) unsigned NOT NULL COMMENT '关联用户表的id',
  `notice_id` int(11) NOT NULL COMMENT '关联发布公告表的id',
  `money` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '供应商报价',
  `accessory` text COMMENT '附件',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '修改时间',
  `delete_time` int(10) unsigned DEFAULT NULL COMMENT '删除时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态0未中标，1中标',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rms_bid
-- ----------------------------
BEGIN;
INSERT INTO `rms_bid` VALUES (23, 18, 88, 20000.00, 'a:2:{s:6:\"weixin\";s:54:\"/uploads/20190510/d52e328114b6073803141037c29928bd.png\";s:8:\"qianduan\";s:54:\"/uploads/20190510/d52e328114b6073803141037c29928bd.pdf\";}', 1557470920, 1557585305, NULL, 1);
INSERT INTO `rms_bid` VALUES (25, 19, 89, 1233321.00, 'a:2:{i:11;s:54:\"/uploads/20190510/8e8fb68a5d33d9c3797bce69ee0185d4.pdf\";i:22;s:54:\"/uploads/20190510/5516e7ef37bd55831a7fb1a709b7af7d.pdf\";}', 1557473033, 1557585330, NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for rms_bid_winning
-- ----------------------------
DROP TABLE IF EXISTS `rms_bid_winning`;
CREATE TABLE `rms_bid_winning` (
  `id` int(10) unsigned NOT NULL COMMENT '主键--中标公告',
  `bid_id` int(10) unsigned NOT NULL COMMENT '关联投标表的id',
  `Release_time` int(10) unsigned NOT NULL DEFAULT '86400' COMMENT '发布中标公告公示期时间(默认是24小时)可修改',
  `agency_fee` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否缴纳代理费 0 是未缴纳 1 是已缴纳',
  `status_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否发布中标公告  0 保存  1 发布',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `update` int(10) unsigned DEFAULT NULL COMMENT '修改时间',
  `delete_time` int(10) unsigned DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for rms_collection
-- ----------------------------
DROP TABLE IF EXISTS `rms_collection`;
CREATE TABLE `rms_collection` (
  `id` int(10) unsigned NOT NULL COMMENT '主键--关注表',
  `user_id` int(10) unsigned NOT NULL COMMENT '关联用户表id',
  `notice_id` int(10) unsigned NOT NULL COMMENT '关联招标公告表id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否关注 0 不关注 1 关注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for rms_details
-- ----------------------------
DROP TABLE IF EXISTS `rms_details`;
CREATE TABLE `rms_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(10) unsigned NOT NULL COMMENT '关联user表',
  `fdusername` varchar(15) NOT NULL COMMENT '法定代表人姓名',
  `idcard` char(18) NOT NULL COMMENT '法定代表人身份证',
  `phone` varchar(15) NOT NULL COMMENT '法代表人联系电话',
  `email` char(32) NOT NULL COMMENT '法代电子邮箱',
  `ywusername` varchar(15) NOT NULL COMMENT '业务联系人',
  `ywidcard` char(18) NOT NULL COMMENT '业务联系人身份证',
  `ywphone` varchar(15) NOT NULL COMMENT '业务联系人电话',
  `ywfax` varchar(15) NOT NULL COMMENT '业务传真号码',
  `ywemail` varchar(32) NOT NULL COMMENT '业务电子邮箱',
  `address` varchar(128) NOT NULL DEFAULT '' COMMENT '营业地址',
  `postcode` varchar(32) NOT NULL COMMENT '邮政编码',
  `openbank` varchar(32) NOT NULL COMMENT '开户银行',
  `accountname` varchar(32) NOT NULL COMMENT '开户名称',
  `bankaccount` varchar(32) NOT NULL COMMENT '银行账号',
  `suppliername` varchar(32) NOT NULL COMMENT '供应商名称',
  `regnumber` varchar(32) NOT NULL COMMENT '注册号',
  `regcapital` varchar(15) NOT NULL COMMENT '注册资本(人民币)',
  `regaddress` varchar(255) NOT NULL DEFAULT '' COMMENT '注册地址',
  `certificate` varchar(255) NOT NULL COMMENT '发证机关',
  `manage` varchar(255) NOT NULL COMMENT '主营范围',
  `license` varchar(255) NOT NULL DEFAULT '' COMMENT '营业执照附件',
  `tradestype` varchar(64) NOT NULL COMMENT '供应商所属行业',
  `create_time` int(11) unsigned DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned DEFAULT '0' COMMENT '修改时间',
  `delete_time` int(11) unsigned DEFAULT '0' COMMENT '删除时间',
  `creditcode` varchar(32) NOT NULL COMMENT '统一信用代码',
  `registertime` varchar(32) NOT NULL COMMENT '注册时间',
  `accessory` text COMMENT '资质附件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rms_details
-- ----------------------------
BEGIN;
INSERT INTO `rms_details` VALUES (9, 18, '天门', '429006199410088734', '15623979852', '254253325@qq.com', '天门人', '429006199410088734', '15623979852', '11111111', '254253325@qq.com', '河北省 石家庄市 长安区 汪岭社区', '111111', '招商', '周航', '913709837600480', '哲凌科技', '913709837600480111', '二十五', '天津市 天津市市辖区 和平区 香格里拉', '天门', '天门', 'a:2:{i:0;s:55:\"/register/20190510/d9ca3b7b1342d9c655b40523b4234f1c.png\";i:1;s:55:\"/register/20190510/d9ca3b7b1342d9c655b40523b4234f1c.jpg\";}', '制造业', 1557466434, 1557466434, 0, '91370983760048007L', '2019-05-10', 'a:2:{s:5:\"meizu\";s:55:\"/register/20190510/d9ca3b7b1342d9c655b40523b4234f1c.txt\";s:8:\"qianduan\";s:55:\"/register/20190510/d9ca3b7b1342d9c655b40523b4234f1c.pdf\";}');
INSERT INTO `rms_details` VALUES (10, 19, '天门', '429006199410088734', '15623979852', '254253325@qq.com', '天门人', '429006199410088734', '15623979852', '11111111', '254253325@qq.com', '山西省 长治市 城区 汪岭社区', '111111', '招商', '招商', '913709837600480', '哲凌科技', '913709837600480111', '二十五', '山西省 长治市 城区 汪岭社区', '天门', '天门', 'a:2:{i:0;s:55:\"/register/20190510/5723be701da3f1b20bd2ef9c29e4bc3b.txt\";i:1;s:55:\"/register/20190510/c0b8d59d8d6850497e81d368d57ceb6a.txt\";}', '农、林、牧、渔业', 1557472924, 1557472924, 0, '91370983760048007L', '2019-05-10', 'a:2:{i:111;s:55:\"/register/20190510/5723be701da3f1b20bd2ef9c29e4bc3b.png\";i:222;s:55:\"/register/20190510/5723be701da3f1b20bd2ef9c29e4bc3b.jpg\";}');
COMMIT;

-- ----------------------------
-- Table structure for rms_notice
-- ----------------------------
DROP TABLE IF EXISTS `rms_notice`;
CREATE TABLE `rms_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键   --- 招标公告表',
  `object_name` varchar(64) NOT NULL COMMENT '项目名称',
  `number` varchar(255) NOT NULL COMMENT '编号',
  `open_date` int(10) unsigned NOT NULL COMMENT '开标日期 精确到时分秒',
  `purchaser` varchar(64) NOT NULL COMMENT '采购机构',
  `area` varchar(128) NOT NULL DEFAULT '' COMMENT '行政区域',
  `industry` varchar(255) NOT NULL DEFAULT '' COMMENT '所属行业',
  `content` text NOT NULL COMMENT '公告正文(富文本)',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '修改时间',
  `delete_time` int(10) unsigned DEFAULT NULL COMMENT '删除时间',
  `release_time` int(10) unsigned DEFAULT '0' COMMENT '发布时间(发布公告时间,精确到时分秒)',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否发布 0 保存 1 发布',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '区分中标公告的新增字段 0---默认 1 ---新增',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截止投标日期(精确到时分秒)',
  `agency_fee` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否缴纳代理费 0 是未缴纳 1 是已缴纳',
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`) USING BTREE COMMENT '编号唯一性'
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rms_notice
-- ----------------------------
BEGIN;
INSERT INTO `rms_notice` VALUES (88, '武汉市扶贫项目', 'akg001', 1557471600, '12312312', '上海市', '制造业', '<p>&quot;验证码不能为空&quot;&quot;验证码不能为空&quot;&quot;验证码不能为空&quot;&quot;验证码不能为空&quot;</p>', 1557470741, 1557708879, NULL, 1557470762, 1, 0, 0, 1);
INSERT INTO `rms_notice` VALUES (89, '武汉市扶贫项目', 'akg002', 1557473416, '12312312', '上海市', '农、林、牧、渔业', '<p>12312312312</p>', 1557472592, 1557472592, NULL, 1557472600, 1, 0, 0, 1);
INSERT INTO `rms_notice` VALUES (90, '武汉市扶贫项目2', 'akg0012', 1557676800, '12312312', '浙江省', '制造业', '<p>12221</p>', 1557589685, 1557589685, NULL, 1557589690, 1, 0, 0, 0);
INSERT INTO `rms_notice` VALUES (91, '武汉市扶贫项目12', '123123123123', 1557590400, '12312312', '上海市', '制造业', '<p>1231</p>', 1557668548, 1557668548, NULL, 0, 0, 0, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for rms_tradestype
-- ----------------------------
DROP TABLE IF EXISTS `rms_tradestype`;
CREATE TABLE `rms_tradestype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pid` int(10) unsigned NOT NULL COMMENT '父类id',
  `type` varchar(255) NOT NULL COMMENT '类别名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rms_tradestype
-- ----------------------------
BEGIN;
INSERT INTO `rms_tradestype` VALUES (1, 0, '农、林、牧、渔业');
INSERT INTO `rms_tradestype` VALUES (2, 0, '采矿业');
INSERT INTO `rms_tradestype` VALUES (3, 0, '制造业');
INSERT INTO `rms_tradestype` VALUES (4, 0, '电力、燃气及水的生产和供应业');
INSERT INTO `rms_tradestype` VALUES (5, 0, '建筑业');
INSERT INTO `rms_tradestype` VALUES (6, 0, '交通运输、仓储和邮政业');
INSERT INTO `rms_tradestype` VALUES (7, 0, '信息传输、计算机服务和软件业');
INSERT INTO `rms_tradestype` VALUES (8, 0, '批发和零售业');
INSERT INTO `rms_tradestype` VALUES (9, 0, '住宿和餐饮业');
INSERT INTO `rms_tradestype` VALUES (10, 0, '金融业');
INSERT INTO `rms_tradestype` VALUES (11, 0, '房地产业');
INSERT INTO `rms_tradestype` VALUES (12, 0, '租赁和商务服务业');
INSERT INTO `rms_tradestype` VALUES (13, 0, '科学研究、技术服务和地质勘杳业');
INSERT INTO `rms_tradestype` VALUES (14, 0, '水利、环境和公共设施管理业');
INSERT INTO `rms_tradestype` VALUES (15, 0, '文化、体育和娱乐业');
INSERT INTO `rms_tradestype` VALUES (16, 0, '教育');
INSERT INTO `rms_tradestype` VALUES (17, 0, '卫生、社会保幢和社会福利业');
INSERT INTO `rms_tradestype` VALUES (18, 0, '文化、体育和娱乐业');
INSERT INTO `rms_tradestype` VALUES (19, 0, '公共管理和社会组织');
INSERT INTO `rms_tradestype` VALUES (20, 0, '国际组织');
INSERT INTO `rms_tradestype` VALUES (21, 1, '农业');
INSERT INTO `rms_tradestype` VALUES (22, 1, '林业');
INSERT INTO `rms_tradestype` VALUES (23, 1, '畜牧业');
INSERT INTO `rms_tradestype` VALUES (24, 1, '渔业');
INSERT INTO `rms_tradestype` VALUES (25, 2, '煤炭开采和洗选业');
INSERT INTO `rms_tradestype` VALUES (26, 2, '石油和天然气开采业');
INSERT INTO `rms_tradestype` VALUES (27, 2, '黑色金属矿采选业');
INSERT INTO `rms_tradestype` VALUES (28, 2, '有色金属矿采选业');
INSERT INTO `rms_tradestype` VALUES (29, 2, '非金属矿采选业');
INSERT INTO `rms_tradestype` VALUES (30, 2, '其他采矿业');
INSERT INTO `rms_tradestype` VALUES (31, 3, '农副食品加工业');
INSERT INTO `rms_tradestype` VALUES (32, 3, '食品制造业');
INSERT INTO `rms_tradestype` VALUES (33, 3, '饮料制造业');
INSERT INTO `rms_tradestype` VALUES (34, 3, '烟草制品业');
INSERT INTO `rms_tradestype` VALUES (35, 3, '纺织业');
INSERT INTO `rms_tradestype` VALUES (36, 3, '纺织服装、鞋、帽制造业');
INSERT INTO `rms_tradestype` VALUES (37, 3, '皮革、毛皮、羽毛（绒）及其制品业');
INSERT INTO `rms_tradestype` VALUES (38, 3, '木材加工及木、竹、藤、棕、草制品业');
INSERT INTO `rms_tradestype` VALUES (39, 3, '家具制造业');
INSERT INTO `rms_tradestype` VALUES (40, 3, '造纸及纸制品业');
INSERT INTO `rms_tradestype` VALUES (41, 3, '印刷业和记录媒介的复制');
INSERT INTO `rms_tradestype` VALUES (42, 3, '文教体育用品制造业');
INSERT INTO `rms_tradestype` VALUES (43, 3, '石油加工、炼焦及核燃料加工业');
INSERT INTO `rms_tradestype` VALUES (44, 3, '化学原料及化学制品制造业');
INSERT INTO `rms_tradestype` VALUES (45, 3, '医药制造业');
INSERT INTO `rms_tradestype` VALUES (46, 3, '化学纤维制造业');
INSERT INTO `rms_tradestype` VALUES (47, 3, '橡胶制品业');
INSERT INTO `rms_tradestype` VALUES (48, 3, '塑料制品业');
INSERT INTO `rms_tradestype` VALUES (49, 3, '非金属矿物制品业');
INSERT INTO `rms_tradestype` VALUES (50, 3, '黑色金属冶炼及压延加工业');
INSERT INTO `rms_tradestype` VALUES (51, 3, '有色金属冶炼及压延加工业');
INSERT INTO `rms_tradestype` VALUES (52, 3, '金属制品业');
INSERT INTO `rms_tradestype` VALUES (53, 3, '通用设备制造业');
INSERT INTO `rms_tradestype` VALUES (54, 3, '专用设备制造业');
INSERT INTO `rms_tradestype` VALUES (55, 3, '交通运输设备制造业');
INSERT INTO `rms_tradestype` VALUES (56, 3, '电气机械及器材制造业');
INSERT INTO `rms_tradestype` VALUES (57, 3, '通信设备、计算机及其他电子设备制造业');
INSERT INTO `rms_tradestype` VALUES (58, 3, '仪器仪表及文化、办公用机械制造业');
INSERT INTO `rms_tradestype` VALUES (59, 3, '工艺品及其他制造业');
INSERT INTO `rms_tradestype` VALUES (60, 3, '废弃资源和废旧材料回收加工业');
INSERT INTO `rms_tradestype` VALUES (61, 4, '电力、热力的生产和供应业');
INSERT INTO `rms_tradestype` VALUES (62, 4, '燃气生产和供应业');
INSERT INTO `rms_tradestype` VALUES (63, 4, '水的生产和供应业');
INSERT INTO `rms_tradestype` VALUES (64, 5, '房屋和土木工程建筑业');
INSERT INTO `rms_tradestype` VALUES (65, 5, '建筑安装业');
INSERT INTO `rms_tradestype` VALUES (66, 5, '建筑装饰业');
INSERT INTO `rms_tradestype` VALUES (67, 5, '其他建筑业');
INSERT INTO `rms_tradestype` VALUES (68, 6, '铁路运输业');
INSERT INTO `rms_tradestype` VALUES (69, 6, '道路运输业');
INSERT INTO `rms_tradestype` VALUES (70, 6, '城市公共交通业');
INSERT INTO `rms_tradestype` VALUES (71, 6, '水上运输业');
INSERT INTO `rms_tradestype` VALUES (72, 6, '航空运输业');
INSERT INTO `rms_tradestype` VALUES (73, 6, '管道运输业');
INSERT INTO `rms_tradestype` VALUES (74, 6, '装卸搬运和其他运输服务业');
INSERT INTO `rms_tradestype` VALUES (75, 6, '仓储业');
INSERT INTO `rms_tradestype` VALUES (76, 6, '邮政业');
INSERT INTO `rms_tradestype` VALUES (77, 7, '电信和其他信息传输服务业');
INSERT INTO `rms_tradestype` VALUES (78, 7, '计算机服务业');
INSERT INTO `rms_tradestype` VALUES (79, 7, '软件业');
INSERT INTO `rms_tradestype` VALUES (80, 8, '批发业');
INSERT INTO `rms_tradestype` VALUES (81, 8, '零售业');
INSERT INTO `rms_tradestype` VALUES (82, 9, '住宿业');
INSERT INTO `rms_tradestype` VALUES (83, 9, '餐饮业');
INSERT INTO `rms_tradestype` VALUES (84, 10, '银行业');
INSERT INTO `rms_tradestype` VALUES (85, 10, '证券业');
INSERT INTO `rms_tradestype` VALUES (86, 10, '保险业');
INSERT INTO `rms_tradestype` VALUES (87, 10, '其他金融活动');
INSERT INTO `rms_tradestype` VALUES (88, 11, '房地产业');
INSERT INTO `rms_tradestype` VALUES (89, 12, '租赁业');
INSERT INTO `rms_tradestype` VALUES (90, 12, '商务服务业');
INSERT INTO `rms_tradestype` VALUES (91, 13, '研究与试验发展');
INSERT INTO `rms_tradestype` VALUES (92, 13, '专业技术服务业');
INSERT INTO `rms_tradestype` VALUES (93, 13, '科技交流和推广服务业');
INSERT INTO `rms_tradestype` VALUES (94, 13, '地质勘查业');
INSERT INTO `rms_tradestype` VALUES (95, 14, '水利管理业');
INSERT INTO `rms_tradestype` VALUES (96, 14, '环境管理业');
INSERT INTO `rms_tradestype` VALUES (97, 14, '公共设施管理业');
INSERT INTO `rms_tradestype` VALUES (98, 15, '居民服务业');
INSERT INTO `rms_tradestype` VALUES (99, 15, '其他服务业');
INSERT INTO `rms_tradestype` VALUES (100, 16, '教育');
INSERT INTO `rms_tradestype` VALUES (101, 17, '卫生');
INSERT INTO `rms_tradestype` VALUES (102, 17, '社会保障业');
INSERT INTO `rms_tradestype` VALUES (103, 17, '社会福利业');
INSERT INTO `rms_tradestype` VALUES (104, 18, '新闻出版业');
INSERT INTO `rms_tradestype` VALUES (105, 18, '广播、电视、电影和音像业');
INSERT INTO `rms_tradestype` VALUES (106, 18, '文化艺术业');
INSERT INTO `rms_tradestype` VALUES (107, 18, '体育');
INSERT INTO `rms_tradestype` VALUES (108, 18, '娱乐业');
INSERT INTO `rms_tradestype` VALUES (109, 19, '中国共产党机关');
INSERT INTO `rms_tradestype` VALUES (110, 19, '国家机构');
INSERT INTO `rms_tradestype` VALUES (111, 19, '人民政协和民主党派');
INSERT INTO `rms_tradestype` VALUES (112, 19, '群众团体、社会团体和宗教组织');
INSERT INTO `rms_tradestype` VALUES (113, 19, '基层群众自治组织');
INSERT INTO `rms_tradestype` VALUES (114, 20, '国际组织');
COMMIT;

-- ----------------------------
-- Table structure for rms_user
-- ----------------------------
DROP TABLE IF EXISTS `rms_user`;
CREATE TABLE `rms_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '密码',
  `user_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '区分供应商和采购方',
  `login_limit` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '审核管理员操作注册日期不过24小时即可登录 0 -默认   1- 手动启用 ',
  `create_time` int(11) unsigned DEFAULT '0' COMMENT '创建时间(用户计算注册日期是否满足24小时)',
  `update_time` int(11) unsigned DEFAULT '0' COMMENT '更新时间',
  `audit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '账户审核状态  默认--0 1----审核通过 2----审核未通过',
  `tosx_time` int(10) unsigned DEFAULT NULL COMMENT '供应商去生效',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index` (`id`,`username`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of rms_user
-- ----------------------------
BEGIN;
INSERT INTO `rms_user` VALUES (18, 'admin', '9a968be17f59d04fd3035a987b9073db', 0, 0, 1557466434, 1557466434, 1, 1557719165);
INSERT INTO `rms_user` VALUES (19, 'adminadmin', '9a968be17f59d04fd3035a987b9073db', 0, 0, 1557472924, 1557472924, 2, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;