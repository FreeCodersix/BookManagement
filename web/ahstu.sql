/*
Navicat MySQL Data Transfer

Source Server         : zwy
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : ahstu

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-09-28 12:18:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `借书表`
-- ----------------------------
DROP TABLE IF EXISTS `借书表`;
CREATE TABLE `借书表` (
  `r_id` int(100) NOT NULL AUTO_INCREMENT,
  `u_id` int(10) NOT NULL COMMENT '用户id',
  `b_id` int(10) NOT NULL COMMENT '图书编号',
  `b_name` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `state` varchar(10) CHARACTER SET utf8mb4 NOT NULL COMMENT '申请类型',
  `loanTime` date DEFAULT NULL COMMENT '借阅日期',
  `returnTime` date DEFAULT NULL COMMENT '归还日期',
  `conti` varchar(4) CHARACTER SET utf8mb4 DEFAULT '否',
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of 借书表
-- ----------------------------
INSERT INTO `借书表` VALUES ('64', '233003', '189001', '百年孤独(译文)', '归还', '2019-09-15', '2019-12-15', '否');
INSERT INTO `借书表` VALUES ('65', '233003', '189001', '百年孤独(译文)', '归还', '2019-09-15', '2019-12-15', '否');
INSERT INTO `借书表` VALUES ('66', '233003', '189001', '百年孤独(译文)', '归还', '2019-09-15', '2019-12-15', '否');
INSERT INTO `借书表` VALUES ('67', '233003', '189001', '百年孤独(译文)', '归还', '2019-09-15', '2019-12-15', '否');
INSERT INTO `借书表` VALUES ('68', '233003', '189016', '我们仨', '归还', '2019-09-15', '2019-12-15', '否');
INSERT INTO `借书表` VALUES ('69', '233003', '189017', '阿Q正传', '归还', '2019-09-15', '2019-12-15', '否');
INSERT INTO `借书表` VALUES ('70', '233003', '189046', '莫泊桑短篇小说集', '归还', '2019-09-15', '2019-12-15', '否');
INSERT INTO `借书表` VALUES ('71', '233003', '189033', '红岩', '归还', '2019-09-15', '2019-12-15', '否');
INSERT INTO `借书表` VALUES ('72', '233003', '189006', '内心强大的女人最优雅', '归还', '2019-09-15', '2019-12-15', '否');
INSERT INTO `借书表` VALUES ('73', '233003', '189005', '墨菲定律', '归还', '2019-09-15', '2019-12-15', '否');
INSERT INTO `借书表` VALUES ('74', '233003', '189002', '世说新语', '归还', '2019-09-15', '2019-12-15', '否');
INSERT INTO `借书表` VALUES ('75', '233003', '189002', '世说新语', '归还', '2019-09-15', '2019-12-15', '否');
INSERT INTO `借书表` VALUES ('76', '233003', '189004', '红楼梦', '归还', '2019-09-15', '2019-12-15', '否');
INSERT INTO `借书表` VALUES ('77', '233003', '189003', '鬼谷子全集', '归还', '2019-09-15', '2019-12-15', '否');
INSERT INTO `借书表` VALUES ('78', '233003', '189003', '鬼谷子全集', '归还', '2019-09-15', '2019-12-15', '否');
INSERT INTO `借书表` VALUES ('79', '233003', '189001', '百年孤独(译文)', '归还', '2019-09-15', '2019-12-15', '否');
INSERT INTO `借书表` VALUES ('80', '233003', '189002', '世说新语', '归还', '2019-09-15', '2019-12-15', '否');
INSERT INTO `借书表` VALUES ('81', '233003', '189002', '世说新语', '归还', '2019-09-15', '2019-12-15', '否');
INSERT INTO `借书表` VALUES ('82', '233003', '189001', '百年孤独(译文)', '归还', '2019-09-16', '2019-12-16', '否');
INSERT INTO `借书表` VALUES ('83', '233003', '189002', '世说新语', '归还', '2019-09-17', '2019-12-17', '否');
INSERT INTO `借书表` VALUES ('84', '233003', '189001', '百年孤独(译文)', '归还', '2019-09-17', '2019-12-17', '否');
INSERT INTO `借书表` VALUES ('85', '233001', '189003', '鬼谷子全集', '归还', '2019-09-17', '2019-12-17', '否');
INSERT INTO `借书表` VALUES ('86', '233003', '189003', '鬼谷子全集', '归还', '2019-09-17', '2019-12-17', '否');
INSERT INTO `借书表` VALUES ('87', '233003', '189003', '鬼谷子全集', '归还', '2019-09-24', '2019-12-24', '否');
INSERT INTO `借书表` VALUES ('88', '233003', '189011', '摆渡人', '归还', '2019-09-24', '2019-12-24', '否');
INSERT INTO `借书表` VALUES ('89', '233003', '189008', '边城', '归还', '2019-09-24', '2019-12-24', '否');
INSERT INTO `借书表` VALUES ('90', '233003', '189008', '边城', '归还', '2019-09-24', '2019-12-24', '否');
INSERT INTO `借书表` VALUES ('91', '233003', '189004', '红楼梦', '归还', '2019-09-25', '2019-12-25', '否');
INSERT INTO `借书表` VALUES ('92', '233003', '189003', '鬼谷子全集', '归还', '2019-09-25', '2019-12-25', '否');
INSERT INTO `借书表` VALUES ('93', '233003', '189003', '鬼谷子全集', '归还', '2019-09-25', '2019-12-25', '否');
INSERT INTO `借书表` VALUES ('94', '233003', '189003', '鬼谷子全集', '归还', '2019-09-25', '2019-12-25', '否');
INSERT INTO `借书表` VALUES ('95', '233003', '189003', '鬼谷子全集', '归还', '2019-09-25', '2019-12-25', '否');
INSERT INTO `借书表` VALUES ('96', '233003', '189003', '鬼谷子全集', '归还', '2019-09-25', '2019-12-25', '否');
INSERT INTO `借书表` VALUES ('97', '233003', '189003', '鬼谷子全集', '归还', '2019-09-25', '2019-12-25', '否');
INSERT INTO `借书表` VALUES ('98', '233003', '189003', '鬼谷子全集', '归还', '2019-09-25', '2019-12-25', '否');
INSERT INTO `借书表` VALUES ('99', '233003', '189004', '红楼梦', '归还', '2019-09-25', '2019-12-25', '否');
INSERT INTO `借书表` VALUES ('100', '233003', '189007', '中华书法全集', '归还', '2019-09-25', '2019-12-25', '否');

-- ----------------------------
-- Table structure for `图书表`
-- ----------------------------
DROP TABLE IF EXISTS `图书表`;
CREATE TABLE `图书表` (
  `b_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '图书编号',
  `b_name` varchar(32) CHARACTER SET utf8mb4 NOT NULL COMMENT '图书名称',
  `b_class` varchar(16) CHARACTER SET utf8mb4 NOT NULL DEFAULT '未分类',
  `b_no` int(10) NOT NULL DEFAULT '0',
  `b_author` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '图书作者',
  `b_publisher` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '图书出版社',
  `b_pubDate` date DEFAULT NULL COMMENT '图书出版日期',
  `b_comment` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '图书简介',
  `b_ps` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=189067 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of 图书表
-- ----------------------------
INSERT INTO `图书表` VALUES ('189003', '鬼谷子全集', '哲学', '1000', '鬼谷子', '吉林出版集团有限责任公司', '2018-10-26', '战胜困境的强者法则，走向卓越的成功之道。', null);
INSERT INTO `图书表` VALUES ('189004', '红楼梦', '文学', '1000', '曹雪芹', '光明日报出版社', '2017-01-06', '以贾、史、王、薛四大家族的兴衰为背景，以富贵公子贾宝玉为视角，描绘了一批举止见识出于须眉之上的闺阁佳人的人生百态，', null);
INSERT INTO `图书表` VALUES ('189005', '墨菲定律', '成功', '1000', '	阳知行', '中国商业出版社', '2018-02-20', '自我认识：剖析人性中的优点与缺点', null);
INSERT INTO `图书表` VALUES ('189006', '内心强大的女人最优雅', '传记', '1000', '董卿', '吉林文史出版社', '2017-08-09', '不断成长，别断了自己通往高贵的路', null);
INSERT INTO `图书表` VALUES ('189007', '中华书法全集', '艺术', '1000', '无', '新华出版社', '2013-05-06', '书法', null);
INSERT INTO `图书表` VALUES ('189008', '边城', '散文', '1000', '沈从文', '民主与建设出版社', '2013-03-05', '它以20世纪30年代川湘交界的边城小镇茶峒为背景，以兼具抒情诗和小品文的优美笔触，描绘了湘西地区特有的风土人情；', null);
INSERT INTO `图书表` VALUES ('189009', '你若盛开蝴蝶自来', '文学', '1000', '杨承清', '北方妇女儿童出版社', '2015-05-05', '你若盛开，清风自来。', null);
INSERT INTO `图书表` VALUES ('189010', '围城', '文学', '1000', '钱钟书', '新华出版社', '1991-01-05', '城外的人想进去，围在城里的人想出来。', null);
INSERT INTO `图书表` VALUES ('189011', '摆渡人', '治愈', '1000', '付强', '百花洲文艺出版社', '2015-06-05', '一举摘得五项世界文学大奖,版权销售33个国家,是令千万读者灵魂震颤的心灵治愈小说。', null);
INSERT INTO `图书表` VALUES ('189012', '我不敢说,我怕被骂', '童书', '1000', '妮可.塔斯马', '北京联合出版公司', '2018-02-20', '我不敢说我怕被骂绘本幼儿故事书3-6岁幼儿园早教书启蒙睡前故事', null);
INSERT INTO `图书表` VALUES ('189013', '平凡的世界', '文学', '1000', '路遥', '上海译文出版社', '2013-05-06', '激励亿万读者的不朽经典，深受老师和学生喜爱的新课标推荐阅读书', null);
INSERT INTO `图书表` VALUES ('189014', '追风筝的人', '小说', '1000', '卡勒德.胡赛尼', '上海人民出版社', '2013-05-06', '全书围绕风筝与阿富汗的两个少年之间展开，一个富家少年与家中仆人关于风筝的故事，关于人性的背叛与救赎。', null);
INSERT INTO `图书表` VALUES ('189015', '活着', '小说', '1000', '余华', '作家出版社', '2012-08-05', '以中国内战和新中国成立后历次政治运动为背景，通过男主人公福贵一生的坎坷经历，反映了一代中国人的命运。', null);
INSERT INTO `图书表` VALUES ('189016', '我们仨', '传记', '1000', '杨绛', '三联书店', '2013-05-06', '该书讲述了一个单纯温馨的家庭几十年平淡无奇、相守相助、相聚相失的经历。作者杨绛以简洁而沉重的语言，回忆了先后离她而去的女儿钱瑗、丈夫钱锺书，以及一家三口那些快乐而艰难、爱与痛的日子。', null);
INSERT INTO `图书表` VALUES ('189017', '阿Q正传', '小说', '1000', ' 鲁迅', '北京联合出版公司', '2012-08-05', '小说以辛亥革命前后的中国农村为背景，描写了未庄流浪雇农阿Q，虽然干起活来“真能做”，但却一无所有，甚至连名姓都被人遗忘的故事。', null);
INSERT INTO `图书表` VALUES ('189018', '大江大河', '小说', '1000', '阿耐', '北京联合出版公司', '2019-07-08', '讲述了1978到1992年间改革开放的大背景下，以宋运辉、雷东宝、杨巡为代表的先行者们在变革浪潮中不断探索和突围的浮沉故事', null);
INSERT INTO `图书表` VALUES ('189019', '小王子', '文学', '1000', '李继宏', '天津人民出版社', '2018-02-20', '本书的主人公是来自外星球的小王子。书中以一位飞行员作为故事叙述者，讲述了小王子从自己星球出发前往地球的过程中，所经历的各种历险。作者以小王子的孩子式的眼光，透视出成人的空虚、盲目，愚妄和死板教条，用浅显天真的语言写出了人类的孤独寂寞、没有根基随风流浪的命运。同时，也表达出作者对金钱关系的批判，对真善美的讴歌。', null);
INSERT INTO `图书表` VALUES ('189020', '月亮与六便士', '小说', '1000', '毛姆', '浙江文艺出版社', '2015-05-05', '描述了一个原本平凡的伦敦证券经纪人思特里克兰德，突然着了艺术的魔，抛妻弃子，绝弃了旁人看来优裕美满的生活，奔赴南太平洋的塔希提岛，用圆笔谱写出自己光辉灿烂的生命，把生命的价值全部注入绚烂的画布的故事。', null);
INSERT INTO `图书表` VALUES ('189021', '演讲与口才', '演讲', '1000', '臧宝飞', '中国国际广播出版社', '2013-05-05', '演讲基本技巧方法 演讲准备 开场白技巧 体态语言运用 表达能力提升 演讲逻辑训练', null);
INSERT INTO `图书表` VALUES ('189022', '恶意', '小说', '1000', '东野圭吾', '南海出版公司', '2016-11-02', '《恶意》是日本作家东野圭吾挑战悬疑小说写作极限的佳作，是以加贺恭一郎为主人公的系列作品的第四部，该系列的上一部作品是《谁杀了她》，该系列的下一部作品是《我杀了他》。《恶意》于1996年由日本讲谈社出版发行单行本，文库本由讲谈社于2001年出版发行。《恶意》被媒体和读者列为东野圭吾的巅峰之作，与《白夜行》同享光辉与荣耀，这两部作品恰似两生花——《白夜行》为了爱粉身碎骨，《恶意》因为恨万劫不复。', null);
INSERT INTO `图书表` VALUES ('189023', '三体', '小说', '1000', '刘慈欣', '重庆出版', '2014-10-01', '作品讲述了地球人类文明和三体文明的信息交流、生死搏杀及两个文明在宇宙中的兴衰历程。其第一部经过刘宇昆翻译后获得了第73届雨果奖最佳长篇小说奖', null);
INSERT INTO `图书表` VALUES ('189024', '百年孤独', '小说', '1000', '加西亚·马尔克斯', '南海出版公司', '2015-06-05', '《百年孤独》，是哥伦比亚作家加西亚·马尔克斯创作的长篇小说，是其代表作，也是拉丁美洲魔幻现实主义文学的代表作，被誉为“再现拉丁美洲历史社会图景的鸿篇巨著”。', null);
INSERT INTO `图书表` VALUES ('189025', '哈利波特', '小说', '1000', 'J.K. ROWLING', '人民文学出版社', '2018-10-05', '《哈利·波特》（Harry Potter）是英国作家J·K·罗琳（J. K. Rowling）于1997～2007年所著的魔幻文学系列小说，共7部。其中前六部以霍格沃茨魔法学校（Hogwarts School of Witchcraft and Wizardry）为主要舞台，描写的是主人公——年轻的巫师学生哈利·波特在霍格沃茨前后六年的学习生活和冒险故事。', null);
INSERT INTO `图书表` VALUES ('189026', '全职高手', '网络小说', '1000', '蝴蝶兰', ' 广东羊城晚报出版社', '2014-01-05', '故事讲述网游荣耀中被誉为教科书级别的顶尖高手叶修，因为种种原因遭到俱乐部的驱逐，离开职业圈的他寄身于一家网吧成了一个小小的网管，但是，拥有十年游戏经验的他，在荣耀新开的第十区重新投入了游戏，带着对往昔的回忆，和一把未完成的自制武器，开始了重返巅峰之路。', null);
INSERT INTO `图书表` VALUES ('189027', '西游记', '文学', '1000', '吴承恩', '新华出版社', '2016-05-03', '师徒四人取经，历经九九八十一难，修成正果。', null);
INSERT INTO `图书表` VALUES ('189028', '水浒传', '文学', '1000', '施耐庵', '新华出版社', '2015-06-09', '梁山一百零八位好汉替天行道。', null);
INSERT INTO `图书表` VALUES ('189029', '三国演义', '文学', '1000', '罗贯中', '上海译文出版社', '2016-09-15', '东汉末年，三分天下。', null);
INSERT INTO `图书表` VALUES ('189030', '草房子', '童书', '1000', '曹文轩', '江苏少年儿童出版社', '2018-12-01', '小说的故事发生在油麻地，故事中通过对主人公男孩桑桑刻骨铭心而又终身难忘的六年小学生活的描写，讲述了五个孩子，桑桑、秃鹤、杜小康、细马、纸月和油麻地的老师蒋一轮、白雀关系的纠缠和孩子们苦痛的成长历程。', null);
INSERT INTO `图书表` VALUES ('189031', '艾青诗选', '文学', '1000', '艾青', '天地出版社', '2017-11-06', '《艾青诗选》是近代诗人艾青的诗歌选集，他的诗歌通常都富有“五四”战斗精神和饱满的进取精神。该诗歌集创作于1979年。', null);
INSERT INTO `图书表` VALUES ('189032', '古文观止', '散文', '1000', '吴楚材、吴调侯编', '中华', '2009-07-01', '《古文观止》是清人吴楚材、吴调侯于康熙三十三年（1694年）选定的古代散文选本。二吴均是浙江绍兴人，长期设馆授徒，该书是清朝康熙年间选编的一部供学塾使用的文学读本', null);
INSERT INTO `图书表` VALUES ('189033', '红岩', '长篇小说', '1000', '罗广斌、杨益言', '中国青年出版社', '2013-09-01', '红岩》描写人民解放军进军大西南的形势下，重庆的国民党当局疯狂镇压共产党领导的地下革命斗争。着重表现以齐晓轩、许云峰、江雪琴等共产党人在狱中所进行的英勇战斗，虽然最后惨遭屠杀，但却充分显示了共产党人视死如归的大无畏英雄气概', null);
INSERT INTO `图书表` VALUES ('189034', '骆驼祥子', '长篇小说', '1000', ' 舒庆春', ' 人民教育出版社', '1998-09-08', '《骆驼祥子》是人民艺术家——老舍（舒庆春）所著的长篇小说，描述了20世纪20年代军阀混战时期人力车夫的悲惨命运。祥子是旧社会劳苦大众的代表人物。', null);
INSERT INTO `图书表` VALUES ('189035', '昆虫记', '生物学', '1000', '让-亨利·卡西米尔·法布尔', '黑龙江美术出版社', '2015-09-06', '该作品是一部概括昆虫的种类、特征、习性和婚习的昆虫生物学著作，记录了昆虫真实的生活，表述的是昆虫为生存而斗争时表现出的灵性，还记载着法布尔痴迷昆虫研究的动因、生平抱负、知识背景、生活状况等等内容。', null);
INSERT INTO `图书表` VALUES ('189036', '朝花夕拾', '散文集', '1000', '鲁迅', '北京师范大学出版社', '2005-11-06', '文集以记事为主，饱含着浓烈的抒情气息，往往又夹以议论，做到了抒情、叙事和议论融为一体，优美和谐，朴实感人。作品富有诗情画意，又不时穿插着幽默和讽喻；形象生动，格调明朗，有强烈的感染力', null);
INSERT INTO `图书表` VALUES ('189037', '童年', '长篇自传体小说', '1000', '高尔基', '天地出版社', '2011-06-25', '该作讲述了阿廖沙（高尔基的乳名）三岁到十岁这一时期的童年生活，生动地再现了19世纪七八十年代前苏联下层人民的生活状况，写出了高尔基对苦难的认识，对社会人生的独特见解，字里行间涌动着一股生生不息的热望与坚强。', null);
INSERT INTO `图书表` VALUES ('189038', '海底两万里', '长篇小说', '1000', '儒勒·凡尔纳', '山东美术出版社', '2008-05-21', '说主要讲述了博物学家阿龙纳斯、其仆人康塞尔和鱼叉手尼德·兰一起随鹦鹉螺号潜艇船长尼摩周游海底的故事。', null);
INSERT INTO `图书表` VALUES ('189039', '儒林外史', '长篇小说', '1000', '吴敬梓', '中国文联出版社', '2015-05-08', '全书五十六回，以写实主义描绘各类人士对于“功名富贵”的不同表现，一方面真实的揭示人性被腐蚀的过程和原因，从而对当时吏治的腐败、科举的弊端礼教的虚伪等进行了深刻的批判和嘲讽；一方面热情地歌颂了少数人物以坚持自我的方式所作的对于人性的守护，从而寄寓了作者的理想。小说白话的运用已趋纯熟自如，人物性格的刻画也颇为深入细腻，尤其是采用高超的讽刺手法，使该书成为中国古典讽刺文学的佳作。', null);
INSERT INTO `图书表` VALUES ('189040', '人间失格', '中篇小说', '1000', '太宰治', ' 作家出版社', '1948-05-12', '人间失格》以“我”看到叶藏的三张照片后的感想开头，中间是叶藏的三篇手记，而三篇手记与照片对应，分别介绍了叶藏幼年、青年和壮年时代的经历，描述了叶藏是如何一步一步走向丧失为人资格的道路的', null);
INSERT INTO `图书表` VALUES ('189041', '世说新语', '小说集', '1000', '刘义庆', '中华书局', '2010-10-05', '《世说新语》是中国魏晋南北朝时期“笔记小说”的代表作，是我国最早的一部文言志人小说集。它原本有八卷，被遗失后只有三卷。', null);
INSERT INTO `图书表` VALUES ('189042', '浮生六记', '散文', '1000', '沈复', ' 天津人民出版社', '2012-11-12', '浮生六记》是清朝长洲人沈复（字三白，号梅逸）著于嘉庆十三年（1808年）的自传体散文。清朝王韬的妻兄杨引传在苏州的冷摊上发现《浮生六记》的残稿，只有四卷，交给当时在上海主持申报闻尊阁的王韬，以活字板刊行于1877年。“浮生”二字典出李白诗《春夜宴从弟桃李园序》中“夫天地者，万物之逆旅也；光阴者，百代之过客也。而浮生若梦，为欢几何？”。', null);
INSERT INTO `图书表` VALUES ('189043', '绿山墙的安妮 ', '小说', '1000', '露西·莫德·蒙哥马利', '山东美术出版社', '2013-05-12', '绿山墙的安妮》讲述了纯真善良、热爱生活的女主人公小安妮，自幼失去父母，11岁时被绿山墙的马修和玛丽拉兄妹领养，但她个性鲜明，富于幻想，而且自尊自强，凭借自己的刻苦勤奋，不但得到领养人的喜爱，也赢得老师和同学的关心和友谊。', null);
INSERT INTO `图书表` VALUES ('189044', '活着', '小说', '1000', '余华', '作家出版社', '2000-12-11', '《活着》是作家余华的代表作之一，讲述了在大时代背景下，随着内战、三反五反，大跃进，文化大革命等社会变革，徐福贵的人生和家庭不断经受着苦难，到了最后所有亲人都先后离他而去，仅剩下年老的他和一头老牛相依为命。', null);
INSERT INTO `图书表` VALUES ('189045', '斑羚飞渡', '小说', '1000', '沈石溪', ' 浙江少年儿童出版社', '2013-12-11', '该小说虚构描写的是一群被逼至绝境的斑羚，为了赢得种群的生存机会，用牺牲一半挽救另一半的方法摆脱困境的壮举。', null);
INSERT INTO `图书表` VALUES ('189046', '莫泊桑短篇小说集', '小说', '1000', '莫泊桑', ' 中国文联出版社', '2014-06-19', '莫泊桑是十九世纪世界三大著名短篇小说巨匠之一，1880年《羊脂球》的发表使他一举成名，该篇亦成为世界文学史上的经典之作。作者将处于社会最底层、受人歧视的妓女——“羊脂球”与形形色色、道貌岸然的所谓上层人物做对比，充分显示出前者极富正义感和同情心的美好心灵以及后者极端自私、寡廉鲜耻的丑恶灵魂。', null);
INSERT INTO `图书表` VALUES ('189047', '哈姆雷特', '小说', '1000', '莎士比亚', '团结出版社', '2014-07-25', '哈姆雷特（Hamlet）》是由英国剧作家威廉·莎士比亚创作于1599年至1602年间的一部悲剧作品。戏剧讲述了叔叔克劳狄斯谋害了哈姆雷特的父亲，篡取了王位，并娶了国王的遗孀乔特鲁德；哈姆雷特王子因此为父王向叔叔复仇。', null);
INSERT INTO `图书表` VALUES ('189048', '俗世奇人', '小说', '1000', '冯骥才', '作家出版社', '2011-11-25', '全书各篇文字极精短，半文半白，带有“三言两拍”笔意。书中所讲之事，又多以清末天津市井生活为背景，每篇专讲一个传奇人物生平事迹，素材均收集于长期流传津门的民间传说，故事生动有趣，惟妙惟肖，使人物跃然纸上，令人惊叹不已。', null);
INSERT INTO `图书表` VALUES ('189049', '	穆斯林的葬礼', '小说', '1000', '霍达', '北京十月文艺出版社', '2015-12-04', '霍达创作的《穆斯林的葬礼》是一部长篇小说， 一个穆斯林家族，六十年间的兴衰，三代人命运的沉 浮，两个发生在不同时代、有着不同内容却又交错扭 结的爱情悲剧。', null);
INSERT INTO `图书表` VALUES ('189050', '风会记得一朵花的香', '小说', '1000', '丁立梅', ' 金城出版社', '2005-03-06', '风会记得一朵花的香（修订版）》是作者丁立梅近年来创作的经典散文选集，汇集了100篇充满爱和哲理的智慧箴言。所选文章的特点是弘扬生活中无处不在的真、善、美，能给予读者以启迪，使读者从中收获成功的智慧，轻松的欢笑和深切的感动。', null);
INSERT INTO `图书表` VALUES ('189051', '朗读者', '小说', '1000', '本哈德·施林克', '译林出版社', '1997-05-08', '《朗读者》讲述男孩米夏和女人汉娜之间充满激情的忘年恋，而故事的深层含义则是近代德国人对于历史、暴行与原罪的自我鞭笞式的反思', null);
INSERT INTO `图书表` VALUES ('189052', '达·芬奇密码', '小说', '1000', '丹·布朗', '人民文学出版社', '2013-10-05', '小说集合了侦探，惊悚和阴谋论等多种风格，并激起了大众对某些宗教理论的普遍兴趣', null);
INSERT INTO `图书表` VALUES ('189053', '我与地坛', '散文', '1000', '史铁生', '人民文学出版社', '2010-05-14', '《我与地坛》是一篇长篇哲思抒情散文，中国当代作家史铁生著。这部作品是史铁生文学作品中，充满哲思又极为人性化的代表作之一。其前第一段和第二段被纳入人民教育出版社的高一教材中。是作者十五年来摇着轮椅在地坛思索的结晶。散文中饱含作者对人生的种种感悟，对亲情的深情讴歌。地坛只是一个载体，而文章的本质却是一个绝望的人寻求希望的过程，以及对母亲的思念', null);
INSERT INTO `图书表` VALUES ('189054', '让我陪你重返狼群', '小说', '1000', '李微漪', '安徽少年儿童出版社', '2003-12-13', '该书主要讲述作者无意间收养了一只刚出生的命悬一线的草原狼，细心在城市喂养几个月后，又带小狼重新回到草原，历经千辛万苦、九死一生，终于成功野化并帮小狼找到原始狼群的真实经历。这是迄今为止世界上首次个人成功野化放归的狼，这是世界狼文化中**部由女性当事人自述的纪实小说。', null);
INSERT INTO `图书表` VALUES ('189055', '巴黎圣母院', '长篇小说', '1000', '维克多·雨果', '广西师范大学出版社', '2016-05-30', '巴黎圣母院》以离奇和对比手法写了一个发生在15世纪法国的故事：巴黎圣母院副主教克罗德道貌岸然、蛇蝎心肠，先爱后恨，迫害吉ト赛女郎埃斯梅拉达。面目丑陋、心地善良的敲钟人卡西莫多为救女郎舍身。小说揭露了宗教的虚伪，宣告禁欲主义的破产，歌颂了下层劳动人民的善良、友爱、舍己为人，反映了雨果的人道主义思想', null);
INSERT INTO `图书表` VALUES ('189056', '无羁', '玄幻小说', '1000', '墨香铜臭', '四川文艺出版社', '2015-12-04', '《无羁》是一部由墨香铜臭所著玄幻小说，出版发行。', null);
INSERT INTO `图书表` VALUES ('189057', '森林报', '故事绘本', '1000', '维塔利·瓦连季诺维奇·比安基', '黑龙江美术出版社', '2016-03-12', '森林里新闻并不比城市里少。森林里也在进行着工作，也有愉快的节日和可悲的事件。森林里有森林里的英雄和强盗。可是，这些事情，城市报纸很少报道，所以谁也不知道这类林中新闻。', null);
INSERT INTO `图书表` VALUES ('189058', '世说新语', '小说集', '1000', '刘义庆', '江苏凤凰美术出版社', '2000-05-15', '《世说新语》是南朝时期所作的文言志人小说集，由南朝宋临川王刘义庆组织一批文人编写，又名《世说》。  其内容主要是记载东汉后期到魏晋间一些名士的言行与轶事', null);
INSERT INTO `图书表` VALUES ('189059', '牧牛小马斯摩奇', '儿童文学', '1000', '维尔·詹姆斯', '世界图书出版公司', '2017-10-15', '斯摩奇本是一匹野马，出生在荒原上，过着自由自在的生活，后来被一位名叫克林特的牛仔所捕获，成了一匹出色的牧牛马。斯摩奇生性聪颖，很快就在当地名噪一时，这也引来了众人对它的觊觎。终于有一天，它被人偷走了。随着主人的几经更换，斯摩奇也经历了种种境遇……', null);
INSERT INTO `图书表` VALUES ('189060', '静静的顿河', '长篇小说', '1000', '米哈依尔·亚历山大维奇·肖洛霍夫', '译林出版社', '2001-01-17', '《静静的顿河》展示了1912到1922年间，俄国社会的独特群体——顿河地区哥萨克人在第一次世界大战、二月革命和十月革命以及国内战争中的苦难历程。', null);
INSERT INTO `图书表` VALUES ('189061', '一千零一夜', '民间故事集', '1000', '阿拉伯人民', '北方文艺出版社', '2003-05-26', '该作讲述相传古代印度与中国之间有一萨桑国，国王山鲁亚尔生性残暴嫉妒，因王后行为不端，将其杀死，此后每日娶一少女，翌日晨即杀掉，以示报复。宰相的女儿山鲁佐德为拯救无辜的女子，自愿嫁给国王，用讲述故事方法吸引国王，每夜讲到最精彩处，天刚好亮了，使国王爱不忍杀，允她下一夜继续讲。', null);
INSERT INTO `图书表` VALUES ('189062', '我在深海处沐艳阳 ', '人物传记', '1000', '念归途', '网络文学', '2019-01-30', '在这一生里，我们该走怎样的路；在这路途里，我们又该怎样去选择。23岁的你我如何抉择？来，我们边走边说', null);
INSERT INTO `图书表` VALUES ('189063', '\r\n缘落红尘 ', '诗歌散文', '1000', '竹影摇风', '北方文艺出版社', '2018-02-16', '如果真有几道轮回，不管前生与后世在何方、在哪道轮回，既然今生有缘落入世间红尘，便当饮尽红尘中的悲欢离合，七情六欲，世间冷暖，完善天道轮回之甘苦。缘落红尘，收录了作者不同时期情感类为主的现代诗歌和旧体诗词作品。只是想用简练的文字记录、抒发生活中不同时期的情感！作品将不定期地更新。', null);
INSERT INTO `图书表` VALUES ('189064', '傲慢与偏见', '小说', '1000', ' 简·奥斯汀', '上海译文出版社', '1813-01-16', '这部作品以日常生活为素材，一反当时社会上流行的感伤小说的内容和矫揉造作的写作方法，生动地反映了18世纪末到19世纪初处于保守和闭塞状态下的英国乡镇生活和世态人情', null);
INSERT INTO `图书表` VALUES ('189065', '战旗依旧 ', '小说', '1000', '岚烟一七七', '江苏凤凰美术出版社', '2016-02-14', '我听说认同墨家“非命”的人，那群人总是仰着头，要“以命搏运”\r\n　　我只是个中州的史官，我一抬头就看见漫天的星宿。帝王、英雄、小人的命运都在星宿里。可那是未来的事情，我只写过去的事情，中州大汉后的历史终究会等来一个看客，我在这里备着一壶茶和一轮夏日繁星', null);
INSERT INTO `图书表` VALUES ('189066', '那年元旦的雪真美', '人物传记', '1000', '张家老三', '北京十月文艺出版社', '2019-02-16', '很久没有联系了，你还好吗？虽然我们仅是彼此的匆匆过客，不知为什么总是经常想到你', null);

-- ----------------------------
-- Table structure for `用户反馈表`
-- ----------------------------
DROP TABLE IF EXISTS `用户反馈表`;
CREATE TABLE `用户反馈表` (
  `u_id` int(10) NOT NULL,
  `type` varchar(10) CHARACTER SET utf8mb4 NOT NULL DEFAULT '问题',
  `content` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of 用户反馈表
-- ----------------------------
INSERT INTO `用户反馈表` VALUES ('233001', '投诉', '管理员小张态度恶劣');
INSERT INTO `用户反馈表` VALUES ('233003', '建议', '图书分类再细致一点');
INSERT INTO `用户反馈表` VALUES ('233004', '投诉', '管理员小江太吵');
INSERT INTO `用户反馈表` VALUES ('233005', '问题', '经常有人占位子');
INSERT INTO `用户反馈表` VALUES ('233006', '投诉', '图书馆有异味');
INSERT INTO `用户反馈表` VALUES ('233007', '问题', '没有报纸专区');
INSERT INTO `用户反馈表` VALUES ('233008', '建议', '增加一个报纸专区');
INSERT INTO `用户反馈表` VALUES ('233009', '投诉', '管理员小王在吸烟');
INSERT INTO `用户反馈表` VALUES ('233010', '投诉', '地面太滑很危险');

-- ----------------------------
-- Table structure for `用户表`
-- ----------------------------
DROP TABLE IF EXISTS `用户表`;
CREATE TABLE `用户表` (
  `u_id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8mb4 NOT NULL COMMENT '用户姓名',
  `password` varchar(64) CHARACTER SET utf8mb4 NOT NULL COMMENT '用户密码',
  `license` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `sex` char(1) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '性别',
  `age` int(4) DEFAULT NULL COMMENT '用户年龄',
  `telephone` varchar(11) CHARACTER SET utf8mb4 DEFAULT NULL,
  `address` varchar(256) CHARACTER SET utf8mb4 DEFAULT '安徽科技学院' COMMENT '住址',
  `birthday` date DEFAULT NULL,
  `begin_date` datetime DEFAULT NULL,
  `breakRule` varchar(2) CHARACTER SET utf8mb4 DEFAULT '0',
  `sumLoan` int(10) DEFAULT '0',
  `u_ps` varchar(100) CHARACTER SET utf8mb4 DEFAULT '0',
  `flag` varchar(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`u_id`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=233027 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of 用户表
-- ----------------------------
INSERT INTO `用户表` VALUES ('233001', 'cw', '123456', '111111', '男', '22', '18855064357', '安徽科技学院', '1998-02-07', '2019-05-07 12:36:11', '0', '0', null, '0');
INSERT INTO `用户表` VALUES ('233002', 'jack', '111111', '123132', '男', '31', '18834231873', '安徽科技学院', '1988-02-03', '2019-07-04 11:10:11', '0', '11', null, '0');
INSERT INTO `用户表` VALUES ('233003', 'lbw', '123456', '111113', '男', '23', '18892474323', '安徽科技学院', '1996-06-18', '2017-03-23 04:23:12', '0', '21', null, '0');
INSERT INTO `用户表` VALUES ('233004', 'wxz', '123454', '111114', '男', '20', '13790228712', '安徽科技学院', '1999-11-23', '2019-04-12 01:32:43', '0', '4', null, '0');
INSERT INTO `用户表` VALUES ('233005', 'Marry', '123455', '111115', '女', '12', '13478912784', '安徽科技学院', '2007-03-21', '2018-10-14 12:32:12', '0', '24', null, '0');
INSERT INTO `用户表` VALUES ('233006', 'Rose', '123456', '111116', '女', '15', '13488947283', '安徽科技学院', '2004-01-18', '2019-08-23 09:21:31', '0', '5', null, '0');
INSERT INTO `用户表` VALUES ('233007', 'Ronan', '123457', '111117', '男', '31', '13427849528', '安徽科技学院', '1988-04-21', '2015-12-12 04:22:12', '0', '51', null, '0');
INSERT INTO `用户表` VALUES ('233008', 'Anne', '123458', '111118', '女', '28', '15623894892', '安徽科技学院', '1991-12-31', '2013-02-04 21:21:21', '0', '87', null, '0');
INSERT INTO `用户表` VALUES ('233009', 'Tom', '123459', '111119', '男', '34', '17628374819', '安徽科技学院', '1985-02-23', '2004-12-06 13:34:12', '0', '63', null, '0');
INSERT INTO `用户表` VALUES ('233010', 'Alice', '123460', '111120', '女', '25', '15612389481', '安徽科技学院', '1994-06-02', '2005-06-22 14:23:36', '0', '53', null, '0');
INSERT INTO `用户表` VALUES ('233011', 'Candy', '123461', '111121', '女', '53', '13835283922', '安徽科技学院', '1966-03-23', '1998-03-23 12:32:34', '0', '83', null, '0');
INSERT INTO `用户表` VALUES ('233012', 'Linda', '123462', '111122', '女', '45', '13683294728', '安徽科技学院', '1974-09-12', '1996-08-12 13:42:12', '0', '74', null, '0');
INSERT INTO `用户表` VALUES ('233013', 'Romeo', '123463', '111123', '男', '26', '13927491581', '安徽科技学院', '1993-03-23', '2000-05-31 10:35:12', '0', '52', null, '0');
INSERT INTO `用户表` VALUES ('233014', 'Lisa', '123464', '111124', '女', '22', '18733289428', '安徽科技学院', '1997-12-18', '2013-10-10 23:12:04', '0', '56', null, '0');
INSERT INTO `用户表` VALUES ('233015', 'Nora', '123465', '111125', '女', '39', '13834895231', '安徽科技学院', '1980-03-25', '1995-04-24 07:22:41', '0', '47', null, '0');
INSERT INTO `用户表` VALUES ('233016', 'Jerry', '123466', '111126', '男', '49', '13982748910', '安徽科技学院', '1970-06-03', '2005-08-24 23:23:12', '0', '67', null, '0');
INSERT INTO `用户表` VALUES ('233017', 'Kevin', '123467', '111127', '男', '35', '13728495892', '安徽科技学院', '1984-09-29', '2017-04-10 21:42:14', '0', '36', null, '0');
INSERT INTO `用户表` VALUES ('233018', 'Emmy', '123468', '111128', '女', '18', '13821897419', '安徽科技学院', '2001-07-21', '2018-05-21 10:32:12', '0', '47', null, '0');
INSERT INTO `用户表` VALUES ('233019', 'Kate', '123469', '111129', '男', '29', '17638249752', '安徽科技学院', '1990-10-25', '2013-03-23 14:23:12', '0', '31', null, '0');
INSERT INTO `用户表` VALUES ('233020', 'Kasey', '123470', '111130', '女', '19', '15622389471', '安徽科技学院', '2000-04-05', '2019-02-12 11:32:51', '0', '37', null, '0');
INSERT INTO `用户表` VALUES ('233021', 'a', 'a', null, '男', '1', '11111111111', '安徽科技学院', '2019-01-16', null, '0', '0', null, '0');
INSERT INTO `用户表` VALUES ('233022', 'dmx', '123123', null, '女', '16', '13111111111', '', '2019-01-10', null, '0', '0', null, '0');
INSERT INTO `用户表` VALUES ('233023', 'as', '123456', null, '男', '14', '13111111112', '', '2019-01-16', null, '0', '0', null, '0');
INSERT INTO `用户表` VALUES ('233024', 'lbw', '123123', null, '男', '22', '13155090787', '安徽科技学院', '2019-01-18', null, '0', '0', null, '0');
INSERT INTO `用户表` VALUES ('233025', 'raky', '123456', null, '男', '18', '15256034003', '', '2015-01-04', null, '0', '0', null, '0');
INSERT INTO `用户表` VALUES ('233026', 'zwy', '123456', null, '男', '12', '13155090787', '', '2019-01-17', null, '0', '0', null, '1');

-- ----------------------------
-- Table structure for `管理员表`
-- ----------------------------
DROP TABLE IF EXISTS `管理员表`;
CREATE TABLE `管理员表` (
  `m_id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `m_name` varchar(12) CHARACTER SET utf8mb4 NOT NULL COMMENT '管理员姓名',
  `m_sex` varchar(2) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '管理员性别',
  `m_tele` varchar(12) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '管理员电话',
  `m_addr` varchar(12) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '管理员住址',
  `m_ps` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `m_authority` int(6) DEFAULT '0' COMMENT '权限默认0，10最高',
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10012 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of 管理员表
-- ----------------------------
INSERT INTO `管理员表` VALUES ('0000010001', '程威', '男', '18855064357', '安徽科技学院', null, '1');
INSERT INTO `管理员表` VALUES ('0000010002', '鲁博文', '男', '13155090787', '安徽科技学院', null, '0');
INSERT INTO `管理员表` VALUES ('0000010003', '王兴忠', '男', '18855068016', '安徽科技学院', null, '0');
INSERT INTO `管理员表` VALUES ('0000010004', '吴迪', '男', '13766502980', '蚌埠医学院', null, '0');
INSERT INTO `管理员表` VALUES ('0000010005', '董梦雪', '女', '18855069050', '安徽科技学院', null, '0');
INSERT INTO `管理员表` VALUES ('0000010006', '江厚波', '男', '15200634589', '安徽科技学院', null, '0');
INSERT INTO `管理员表` VALUES ('0000010007', '章哲', '男', '18966052034', '安徽科技学院', null, '0');
INSERT INTO `管理员表` VALUES ('0000010008', '孟雪霖', '女', '13915766502', '安徽财经大学', null, '0');
INSERT INTO `管理员表` VALUES ('0000010009', '林云', '女', '18015672615', '蚌埠学院', null, '0');
INSERT INTO `管理员表` VALUES ('0000010010', '周云波', '男', '18855062035', '安徽科技学院', null, '0');
INSERT INTO `管理员表` VALUES ('0000010011', '小张', '男', '13355065432', '绍兴文理学院', null, '0');
