/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.6.21-log : Database - db_axcw
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_axcw` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_axcw`;

/*Table structure for table `t_admin` */

DROP TABLE IF EXISTS `t_admin`;

CREATE TABLE `t_admin` (
  `userId` int(11) NOT NULL,
  `userName` varchar(66) DEFAULT NULL,
  `userPw` longtext,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_admin` */

insert  into `t_admin`(`userId`,`userName`,`userPw`) values (1,'a','a');

/*Table structure for table `t_care` */

DROP TABLE IF EXISTS `t_care`;

CREATE TABLE `t_care` (
  `care_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `care_desc` varchar(120) NOT NULL COMMENT '寄养备注',
  `care_time` int(11) NOT NULL COMMENT '寄养时间 单位天',
  `care_user` int(11) NOT NULL COMMENT '寄养人的ID',
  `care_state` int(11) NOT NULL DEFAULT '0' COMMENT '寄养的状态 0 表示未通过 1 表示通过',
  `care_phone` varchar(20) NOT NULL COMMENT '寄养人的电话号码',
  `care_start_date` date NOT NULL COMMENT '寄养开始时间',
  `care_price` decimal(7,2) NOT NULL COMMENT '寄养价格',
  PRIMARY KEY (`care_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `t_care` */

insert  into `t_care`(`care_id`,`care_desc`,`care_time`,`care_user`,`care_state`,`care_phone`,`care_start_date`,`care_price`) values (4,'敢于改变原本',2,2,1,'18908352144','2017-04-19','30.00'),(5,'fasdfasd',4,2,0,'18908352144','2017-04-20','400.00'),(6,'fasdfasdgsdfh',3,2,0,'18908352144','2017-04-19','300.00');

/*Table structure for table `t_catelog` */

DROP TABLE IF EXISTS `t_catelog`;

CREATE TABLE `t_catelog` (
  `catelog_id` int(11) NOT NULL,
  `catelog_name` varchar(50) DEFAULT NULL,
  `catelog_del` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`catelog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_catelog` */

insert  into `t_catelog`(`catelog_id`,`catelog_name`,`catelog_del`) values (1,'狗狗宠物吧','no'),(2,'猫猫宠物吧','no'),(3,'鸟类宠物吧','no'),(4,'水族宠物吧','no');

/*Table structure for table `t_chongwu` */

DROP TABLE IF EXISTS `t_chongwu`;

CREATE TABLE `t_chongwu` (
  `id` int(11) NOT NULL DEFAULT '0',
  `orgId` int(11) DEFAULT NULL,
  `biaoti` varchar(255) DEFAULT NULL,
  `mingcheng` varchar(500) DEFAULT NULL,
  `nianling` varchar(11) DEFAULT NULL,
  `jieshao` varchar(5000) DEFAULT NULL,
  `fujian` varchar(50) DEFAULT NULL,
  `fabushi` varchar(255) DEFAULT NULL,
  `zt` varchar(255) DEFAULT NULL,
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_chongwu` */

insert  into `t_chongwu`(`id`,`orgId`,`biaoti`,`mingcheng`,`nianling`,`jieshao`,`fujian`,`fabushi`,`zt`,`del`) values (2,3,'狗 --- 赠送狗狗，免费领养','狗狗','6个月','小奶狗都很可爱哦品相不错的是一直投喂的流浪狗生的四只我不求锦衣玉食但求不离不弃但是一定要绝育避免重蹈覆辙 可以联系我微信或者QQ：158648093','/upload/1464203232998.jpg','2017-04-05 03:05','已领养','no'),(3,3,'狗 --- 一个月大的小奶狗1只','小奶狗','一个月','一个月大的小奶狗，狗妈妈自家女儿家养的小宠物狗，狗的爸爸就不知道了，一窝5只，先挑先选。好像都是棕色的。加QQ：八九四二二九九可看更多图。品种估计是小形犬的小串串。不是名贵品种。。<br />','/upload/1464203323532.jpg','2017-04-05 03:07','待领养','no'),(4,3,'好心人带我到新家吧.','狗狗','6个月','本人因出国工作.<br />\r\n无法领养.先寻好心人领养.<br />\r\n要求有一定经济能力.爱心.耐心的好心人.<br />','/upload/1464203383681.jpg','2017-04-05 03:08','待领养','no'),(5,3,'狗 --- 2个月小公狗，求领养！','小公狗','2个月','朋友家刚生的小公狗，免费领养，希望找到真心待他的主人！','/upload/1464203415709.jpg','2017-04-05 03:09','待领养','no'),(6,3,'2岁的大金毛领养，望爱心人士领养，好好对她','大金毛','2岁','一只大金毛，2岁了，已打疫苗，可爱粘人，生育过小金毛，现由于公司成立集团，其中一个子公司在广西，我需要到广西工作，而且我老家就是广西的，老家也有一个大金毛了，我也很舍不得她，毕竟一起生活了那么久，但是由于很多元素，还是觉得送养会比较合适！所以现在送与有爱心有时间的人士领养，希望以后出门圈狗绳，不离不弃。','/upload/1464203475516.jpg','2017-04-05 03:10','待领养','no');

/*Table structure for table `t_gonggao` */

DROP TABLE IF EXISTS `t_gonggao`;

CREATE TABLE `t_gonggao` (
  `gonggao_id` int(11) NOT NULL,
  `gonggao_title` varchar(50) DEFAULT NULL,
  `gonggao_content` varchar(5000) DEFAULT NULL,
  `gonggao_data` varchar(77) DEFAULT NULL,
  `fujian` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`gonggao_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_gonggao` */

insert  into `t_gonggao`(`gonggao_id`,`gonggao_title`,`gonggao_content`,`gonggao_data`,`fujian`) values (1,'身体最缺乏的几类抗衰老食物(组图)','<p>&ldquo;我会多快老去？&rdquo;答案与你的饮食与生活习惯息息相关。我们无法阻止衰老，却能延缓它的到来。关键在于我们吃什么，我们怎样运动。针对抵抗衰老这个问题，加州大学洛杉矶分校人类营养中心副主任苏珊&middot;鲍尔曼教授为大家提供了以下建议：<br />\r\n&nbsp;</p>\r\n<p>每一天，甚至每一秒，我们的身体都在与氧气打交道，这是我们新陈代谢的必需。但氧气也有副作用。氧化过程形成的氧自由基是一种高活性分子，如果不对其予以控制，会对身体，我们的DNA产生破坏。就像原本平滑坚固的铁，在空气中长时间与氧发生反应而氧化生锈一样。氧化导致的细胞损坏被认为是人体衰老并引发多种疾病的根源。怎样防止我们的身体&ldquo;生锈&rdquo;？我们需要一个强大的防御系统。</p>\r\n<p>各色水果和蔬菜是最有效的抗氧化物质来源，四届全美最佳医生得主，康宝莱营养与科学顾问委员会主席大卫&middot;赫伯博士曾经撰写畅销书《多彩膳食全解码》，其中提到一个有趣的观点：&ldquo;颜色保护你的身体免受氧损害&rdquo;。</p>','2017-04-05 03:26','/img/zanwu.jpg'),(2,'专家揭秘15种常见的错误饮食观念','<p>水果都含有丰富的维生素C</p>\r\n<p>这种看法是片面的，以100克水果的维生素C的含量来计算，猕猴桃含420毫克，鲜枣含380毫克，草莓含80毫克，橙含49毫克，枇杷含36克，桔含30毫克，柿子含30毫克。但葡萄、无花果、苹果各自只有5毫克，香蕉，桃子各含10毫克，梨子仅含4毫克。因此，要想补充足够的维生素C，吃水果时应有所选择。</p>\r\n<p>2吃得好就等于有营养</p>\r\n<p>有些食品的价格便宜，但营养价值却较高。比如胡萝卜的价格比冬笋便宜得多，而胡萝卜的营养价值却比冬笋高得多。又如，莴苣只吃茎不吃叶，其实叶子的营养价值要比茎高得多，只要采用适宜烹调方式，叶子仍可制成美味的菜肴。</p>\r\n<p>3植物油十全十美</p>\r\n<p>美国生化学家称，植物油中的不饱和脂肪酸虽不是致癌物质，但它有助于癌发生和发育的作用。正确的办法是要注重饮食的合理搭配，适当地吃一些动物性食品对身体健康有益。</p>\r\n<p>4小葱拌豆腐色香味俱全</p>\r\n<p>豆腐里含有钙质，而葱中含有草酸。草酸很容易和钙质溶和，生成草酸钙。这种草酸钙是不容易为人体所吸收的，从而也就破坏了豆腐对人体的营养作用。</p>','2017-04-05 03:27','/img/zanwu.jpg'),(3,'谨慎吃这七种可能感染细菌的食品 附解决办法','每年都有许多人因为食品问题染病，其中大多数人是因为吃水果、蔬菜、烤鸡或凉拌菜。美国MSN网站公布以下七种食品，在食用时一定要慎重','2017-04-05 03:27','/img/zanwu.jpg'),(4,'dddddddddddddddddddddddddddddddddd','dddddddddddddddddddddddddddd','2017-04-05 03:28','/img/zanwu.jpg'),(5,'测试测试测试测试测试测试测试测试测试测试测试','测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试','2017-04-05 03:28','/img/zanwu.jpg'),(6,'的到底得到的得到的得到的得到的得到的得到的得到','的地方','2017-04-05 03:29','/img/zanwu.jpg');

/*Table structure for table `t_huifu` */

DROP TABLE IF EXISTS `t_huifu`;

CREATE TABLE `t_huifu` (
  `id` int(11) NOT NULL,
  `title` varchar(55) DEFAULT NULL,
  `content` varchar(5000) DEFAULT NULL,
  `shijian` varchar(50) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `zhuti_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_huifu` */

insert  into `t_huifu`(`id`,`title`,`content`,`shijian`,`userId`,`zhuti_id`) values (3,NULL,'信息内容','2017-04-06',2,3),(4,NULL,'信息内容dddddddddddddd','2017-04-06',2,3);

/*Table structure for table `t_lingyang` */

DROP TABLE IF EXISTS `t_lingyang`;

CREATE TABLE `t_lingyang` (
  `id` int(11) NOT NULL,
  `xingming` varchar(200) DEFAULT NULL,
  `zhuzhi` varchar(3000) DEFAULT NULL,
  `lianxi` varchar(255) DEFAULT NULL,
  `jieshao` varchar(50) DEFAULT NULL,
  `chongwuId` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `huifu` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_lingyang` */

insert  into `t_lingyang`(`id`,`xingming`,`zhuzhi`,`lianxi`,`jieshao`,`chongwuId`,`user_id`,`huifu`) values (1,'刘三','北京路11#','13555555555','我很喜欢宠物',2,2,'ok');

/*Table structure for table `t_liuyan` */

DROP TABLE IF EXISTS `t_liuyan`;

CREATE TABLE `t_liuyan` (
  `id` int(11) NOT NULL,
  `neirong` varchar(3000) DEFAULT NULL,
  `liuyanshi` varchar(55) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `huifu` varchar(3000) DEFAULT NULL,
  `huifushi` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_liuyan` */

insert  into `t_liuyan`(`id`,`neirong`,`liuyanshi`,`userId`,`huifu`,`huifushi`) values (1,'2222222222222222222222222222222222222222222222222222222','2017-04-05 12:01',1,'11','2017-04-05 11:23'),(2,'测试留言板测试留言板测试留言板测试留言板测试留言板测试留言板测试留言板测试','2017-04-05 11:01',1,'111111111111','2017-04-05 11:56');

/*Table structure for table `t_org` */

DROP TABLE IF EXISTS `t_org`;

CREATE TABLE `t_org` (
  `id` int(11) NOT NULL,
  `mingcheng` varchar(50) DEFAULT NULL,
  `p_org_id` int(11) DEFAULT NULL,
  `leixing` varchar(255) DEFAULT NULL,
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_org` */

insert  into `t_org`(`id`,`mingcheng`,`p_org_id`,`leixing`,`del`) values (1,'猫',0,'类别','no'),(3,'狗',0,'类别','no'),(4,'其它',0,'类别','no');

/*Table structure for table `t_show` */

DROP TABLE IF EXISTS `t_show`;

CREATE TABLE `t_show` (
  `show_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `show_title` varchar(100) NOT NULL COMMENT '标题',
  `show_stars` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `show_user` int(11) NOT NULL COMMENT '发表宠物秀的用户',
  `show_file_name` varchar(100) NOT NULL COMMENT '宠物秀的文件名',
  PRIMARY KEY (`show_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_show` */

/*Table structure for table `t_show_star` */

DROP TABLE IF EXISTS `t_show_star`;

CREATE TABLE `t_show_star` (
  `star_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '点赞id',
  `star_show` int(11) NOT NULL COMMENT '点赞的宠物秀的id',
  `star_user` int(11) NOT NULL COMMENT '点赞宠物秀的用户Id',
  PRIMARY KEY (`star_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_show_star` */

/*Table structure for table `t_tupian` */

DROP TABLE IF EXISTS `t_tupian`;

CREATE TABLE `t_tupian` (
  `id` int(11) NOT NULL DEFAULT '0',
  `xinwen_id` int(11) DEFAULT NULL,
  `jieshao` varchar(3000) DEFAULT NULL,
  `fujian` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_tupian` */

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `user_pw` varchar(50) DEFAULT NULL,
  `user_realname` varchar(50) DEFAULT NULL,
  `user_sex` varchar(255) DEFAULT NULL,
  `user_address` varchar(50) DEFAULT NULL,
  `user_tel` varchar(50) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_del` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`user_id`,`user_name`,`user_pw`,`user_realname`,`user_sex`,`user_address`,`user_tel`,`user_email`,`user_del`) values (2,'liusan','000000','刘三','男','北京','13666666666','liusan@yahoo.cn','no'),(3,'liqian','000000','李强','男','北京','13777777777','lqiand@163.cn','no');

/*Table structure for table `t_xinwen` */

DROP TABLE IF EXISTS `t_xinwen`;

CREATE TABLE `t_xinwen` (
  `id` int(11) NOT NULL,
  `biaoti` varchar(200) DEFAULT NULL,
  `neirong` varchar(3000) DEFAULT NULL,
  `fujian` varchar(255) DEFAULT NULL,
  `shijian` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_xinwen` */

insert  into `t_xinwen`(`id`,`biaoti`,`neirong`,`fujian`,`shijian`) values (1,'白领族这些狗狗啱你养','<p style=\"text-align: left\">都市白领一族，几乎每天都要面对很大的工作和生活压力，忙碌一天，挤公交、地铁回到家，身心俱疲。如果此时有一只可爱的汪星人热情扑来，跟你亲昵一番，你那紧缩的眉毛可能就会顿时舒展开来，所有的烦恼也会一扫而光。</p>\r\n<p style=\"text-align: left\">与自己喜欢的狗狗待在一起，是十分快乐的，它们就像家里不可或缺的一员。虽然，喂养起来有些麻烦，无可否认，狗狗或猫猫的确是人们生活的绝佳伴侣，尤其是只身在大城市打拼的白领一族。</p>\r\n<p style=\"text-align: left\">南沙宠爱有家宠物店店主AMY告诉记者，在她的宠物店里，有40%的客人都是上班族，狗狗是他们每天都想尽快回家的原动力。不过，大公司的白领通常都比较忙，加班更是家常便饭，打理狗狗的时间比较少。因此，选对一只能配合自己工作、生活节奏的狗狗就显得十分重要，AMY向大家推荐以下几个品种：</p>\r\n<p style=\"text-align: left\">柯基犬 不会在家里捣乱</p>\r\n<p style=\"text-align: left\">柯基犬身型矮小，力气较大，给人感觉体格结实、充满活力的形象。但是，由于它们的腿很短，所以跳不上床，也不会乱翻桌子和沙发，这点优势让主人家会很省心。它们性格很温和，即使想从它嘴巴里抢食物，也不会反抗。</p>\r\n<p style=\"text-align: left\">金毛犬 会干活，是主人的贴心小棉袄</p>\r\n<p style=\"text-align: left\">金毛也是大型犬种，很多主人都反映它们掉毛情况严重，食量较大，但它们就是喜欢饲养。因为金毛犬很聪明，学东西很快，容易听从主人指令；性格温和，和主人也很贴心。为主人衔报纸、衔着菜篮和主人一起去买菜这种场景会经常出现，是家人绝对的好伴侣。</p>','/upload/1464198294567.jpg','2017-04-03 01:44'),(2,'郑州上演宠物狗“选美”百变狗狗萌翻全场','<p style=\"text-align: left\">中新网郑州5月13日电（记者　周小云）&ldquo;哆哆，立正、齐步走&hellip;&hellip;&rdquo;5月13日，河南郑州通信社区，一场宠物狗选美比赛热闹举行，在主人的口令下，一只萨摩耶犬完成了和主人的登台走秀。当日，共有约50只狗狗来到现场，和主人一起登台竞技，角逐&ldquo;最美萌犬奖&rdquo;。</p>\r\n<p style=\"text-align: left\">在选美现场，美容后的狗狗们各个神清气爽，比赛还没有开始，它们就先在场地边热起了身，灵活地在广场内穿梭&ldquo;参观&rdquo;，兴奋不已。</p>\r\n<p style=\"text-align: left\">腊肠犬、萨摩耶犬、泰迪犬、约克夏犬、比熊犬&hellip;&hellip;不同品种的宠物狗争奇斗艳，它们中有刚满1岁的&ldquo;新人&rdquo;，也有身经百战的选美&ldquo;老将&rdquo;，现场不仅有狗狗装扮比赛、选美比赛，还有狗狗训练展示，好不热闹。</p>\r\n<p style=\"text-align: left\">选美环节中，通过狗狗和主人互动以及狗狗的才艺展示，评审团根据参赛小狗的外观、身体条件以及执行主人的命令的能力进行综合评估。经过各项严格的比赛后，最终一只拥有可爱与出色表现的泰迪犬妮妮脱颖而出，摘得&ldquo;最美萌犬奖&rdquo;桂冠。</p>\r\n<p style=\"text-align: left\">妮妮的主人张女士告诉记者，她感觉这个活动很酷，不仅让爱狗人士与宠物狗建立一个健康愉快的关系，也为狗狗增加了交流互动的机会，比赛中，这些宠物狗看上去都非常兴奋。</p>\r\n<p style=\"text-align: left\">提起为何要举办&ldquo;宠物狗选美&rdquo;活动，社区负责人张统晓说，通过这场别样的狗狗选美赛，不仅拉近了居民之间的距离，也解决了宠物狗纠纷的问题，许多家庭和狗狗今天都来参加了此次活动，居民在这里与狗狗玩得很开心。</p>\r\n<p style=\"text-align: left\">据悉，本次活动是郑州通信花园社区举办的首届&ldquo;社区文化庙会&rdquo;中的一项活动，除宠物狗选美大赛，还有居民厨艺展、书法赛、象棋赛、门球赛等。</p>','/upload/1464198351469.jpg','2017-04-03 01:45'),(3,'上海爱狗人士举办“宠物主题婚礼” 成群萌','2016年5月6日，上海新郎翟江和新娘康茜婷在外马路举行了一场盛大空前的宠物主题婚礼。图为亮相宠物主题婚礼的萌宠。<span jquery17200772937327572712=\"29\" style=\"line-height: 1.8em\">当日，前来祝贺的亲友都把自己的宠物犬进行了一番打扮，盛装出席祝贺，整场婚礼俨然变成了宠物派对，异常喜庆热闹。新郎新娘因为一只宠物犬而喜结良缘，他们身边的朋友也多为爱狗人士，由此夫妻俩突发奇想策划了这场宠物主题婚礼，为人生留下美好记忆。(忽如远行客摄/光明图片)</span>','/upload/1464198389159.jpg','2017-04-05 01:45');

/*Table structure for table `t_zhuti` */

DROP TABLE IF EXISTS `t_zhuti`;

CREATE TABLE `t_zhuti` (
  `id` int(11) NOT NULL,
  `title` varchar(55) DEFAULT NULL,
  `content` varchar(5000) DEFAULT NULL,
  `fujian` varchar(55) DEFAULT NULL,
  `fujianYuanshiming` varchar(50) DEFAULT NULL,
  `shijian` varchar(50) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `catelog_id` int(11) NOT NULL,
  `shifouding` varchar(55) DEFAULT NULL,
  `shifoujing` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_zhuti` */

insert  into `t_zhuti`(`id`,`title`,`content`,`fujian`,`fujianYuanshiming`,`shijian`,`userId`,`catelog_id`,`shifouding`,`shifoujing`) values (1,'顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶','信息内容顶顶顶顶顶顶顶顶顶顶顶顶顶顶','','','2017-04-03',2,1,'否','否'),(2,'大神帮忙鉴定下，谢谢了。','信息内容','','','2017-04-03',2,1,'否','否'),(3,'来自星星的狗！请大家帮忙看看是什么串串！几个月大了','信息内容','','','2017-04-03',2,1,'否','否'),(4,'求助！爱犬走失','信息内容','','','2017-04-03',2,1,'否','否'),(5,'春季到来人宠消毒不可小看哦','信息内容','','','2017-04-03',2,1,'否','否'),(6,'狗狗10岁了 需要注意些什么呢','信息内容','','','2017-04-03',2,1,'否','否'),(7,'ddddddddddddddddd','信息内容','','','2017-04-03',2,1,'否','否'),(8,'的辅导费地方反反复复发反反复复','信息内容','','','2017-04-08',2,1,'否','否');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
