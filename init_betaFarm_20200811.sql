-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: betaFarm
-- ------------------------------------------------------
-- Server version	5.7.31-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `CERTIFICATE_LIST`
--

DROP TABLE IF EXISTS `CERTIFICATE_LIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CERTIFICATE_LIST` (
  `certificate_list_id` int(11) NOT NULL AUTO_INCREMENT,
  `mark_name` varchar(60) COLLATE utf8_bin NOT NULL,
  `mark_image_addr` varchar(255) COLLATE utf8_bin NOT NULL,
  `abbreviation` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`certificate_list_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CERTIFICATE_LIST`
--

LOCK TABLES `CERTIFICATE_LIST` WRITE;
/*!40000 ALTER TABLE `CERTIFICATE_LIST` DISABLE KEYS */;
INSERT INTO `CERTIFICATE_LIST` VALUES (1,'台灣優良農產品','../static/photo/CERTIFICATE_MARK_SYSTEM/a06d1510-3bff-11ea-ab4d-000c291f8aea.jpg','CAS'),(2,'有機農產品','../static/photo/CERTIFICATE_MARK_SYSTEM/81a3cfc8-3c01-11ea-ab4d-000c291f8aea.jpg',''),(3,'產銷履歷農產品','../static/photo/CERTIFICATE_MARK_SYSTEM/da674890-3c03-11ea-ab4d-000c291f8aea.jpg','TAP');
/*!40000 ALTER TABLE `CERTIFICATE_LIST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CERTIFICATE_MRAK`
--

DROP TABLE IF EXISTS `CERTIFICATE_MRAK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CERTIFICATE_MRAK` (
  `mark_id` int(11) NOT NULL AUTO_INCREMENT,
  `image_addr` varchar(255) COLLATE utf8_bin NOT NULL,
  `effective_date` date NOT NULL,
  `farm_id` varchar(5) COLLATE utf8_bin NOT NULL,
  `field_id` int(10) NOT NULL,
  `is_old` int(11) NOT NULL DEFAULT '0',
  `certificate_list_id` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`mark_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CERTIFICATE_MRAK`
--

LOCK TABLES `CERTIFICATE_MRAK` WRITE;
/*!40000 ALTER TABLE `CERTIFICATE_MRAK` DISABLE KEYS */;
/*!40000 ALTER TABLE `CERTIFICATE_MRAK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CONTROL_OBJ_LIST`
--

DROP TABLE IF EXISTS `CONTROL_OBJ_LIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CONTROL_OBJ_LIST` (
  `control_obj_code` int(11) NOT NULL AUTO_INCREMENT,
  `control_obj_name` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`control_obj_code`),
  UNIQUE KEY `control_obj_name_UNIQUE` (`control_obj_name`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CONTROL_OBJ_LIST`
--

LOCK TABLES `CONTROL_OBJ_LIST` WRITE;
/*!40000 ALTER TABLE `CONTROL_OBJ_LIST` DISABLE KEYS */;
INSERT INTO `CONTROL_OBJ_LIST` VALUES (9,'南黃薊馬'),(13,'夜蛾類'),(7,'根瘤線蟲'),(20,'根腐病'),(8,'棉蚜'),(17,'烏鴉'),(12,'瓜實蠅'),(14,'瓜螟'),(10,'番茄斑潛蠅'),(16,'病毒'),(3,'白粉病'),(19,'白蟻'),(18,'線蟲'),(2,'苗立枯病'),(5,'蔓枯病'),(15,'赤葉蟎'),(11,'銀葉粉蝨'),(1,'雞母蟲'),(4,'露菌病'),(21,'麻雀'),(6,'黑點根腐病');
/*!40000 ALTER TABLE `CONTROL_OBJ_LIST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CULTIVAR_LIST`
--

DROP TABLE IF EXISTS `CULTIVAR_LIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CULTIVAR_LIST` (
  `cultivar_id` int(11) NOT NULL AUTO_INCREMENT,
  `cultivar_code` int(3) NOT NULL,
  `cultivar_name` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`cultivar_id`,`cultivar_code`)
) ENGINE=InnoDB AUTO_INCREMENT=896 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CULTIVAR_LIST`
--

LOCK TABLES `CULTIVAR_LIST` WRITE;
/*!40000 ALTER TABLE `CULTIVAR_LIST` DISABLE KEYS */;
INSERT INTO `CULTIVAR_LIST` VALUES (1,1,'椰子'),(2,2,'釋迦'),(3,3,'草莓-進口'),(4,4,'藍莓-進口藍莓'),(5,5,'百香果-其他'),(6,6,'百香果-改良種'),(7,7,'小番茄-聖女'),(8,8,'小番茄-玉女'),(9,9,'火龍果-白肉'),(10,10,'火龍果-紅肉'),(11,11,'櫻桃-進口'),(12,12,'榴槤-進口'),(13,13,'其他'),(14,14,'其他-進口'),(15,15,'香蕉-其他'),(16,16,'香蕉'),(17,17,'香蕉-芭蕉紅芭蕉'),(18,18,'香蕉-旦蕉'),(19,19,'鳳梨-其他'),(20,20,'鳳梨-金鑽鳳梨'),(21,21,'鳳梨-甜蜜蜜'),(22,22,'鳳梨-牛奶鳳梨'),(23,23,'椪柑-進口'),(24,24,'甜橙-進口'),(25,25,'雜柑-檸檬'),(26,26,'雜柑-桔子'),(27,27,'雜柑-無子檸檬'),(28,28,'雜柑-進口'),(29,29,'黃秋葵'),(30,30,'百果-進口'),(31,31,'花椰菜-青梗'),(32,32,'花椰菜-進口'),(33,33,'胡瓜-黑刺'),(34,34,'花胡瓜-其他'),(35,35,'花胡瓜'),(36,36,'冬瓜-白皮'),(37,37,'冬瓜-青皮'),(38,38,'絲瓜-其他'),(39,39,'絲瓜-絲瓜'),(40,40,'絲瓜-角瓜'),(41,41,'絲瓜-長絲瓜'),(42,42,'苦瓜-其他'),(43,43,'苦瓜-白大米'),(44,44,'苦瓜-青大米'),(45,45,'苦瓜-山苦瓜'),(46,46,'苦瓜-翠綠'),(47,47,'扁蒲-圓形'),(48,48,'扁蒲-花蒲'),(49,49,'扁蒲-梨子蒲'),(50,50,'茄子-其他'),(51,51,'茄子-麻荸茄'),(52,52,'茄子-日本種'),(53,53,'蕃茄-黑柿'),(54,54,'蕃茄-牛蕃茄'),(55,55,'甜椒-其他'),(56,56,'甜椒-新香'),(57,57,'甜椒-彩色種'),(58,58,'甜椒-青椒'),(59,59,'豌豆-紅花'),(60,60,'豌豆-甜豌豆'),(61,61,'豌豆-進口'),(62,62,'菜豆-白色'),(63,63,'菜豆-青色'),(64,64,'菜豆-紅色'),(65,65,'敏豆-白豆'),(66,66,'敏豆-粉豆'),(67,67,'敏豆-翼豆'),(68,68,'敏豆-醜豆'),(69,69,'毛豆-豆莢'),(70,70,'毛豆-豆仁'),(71,71,'青花苔-進口'),(72,72,'越瓜-加工'),(73,73,'南瓜-其他'),(74,74,'南瓜-木瓜形'),(75,75,'南瓜-圓形'),(76,76,'南瓜-黃如意'),(77,77,'南瓜-青如意'),(78,78,'南瓜-栗子'),(79,79,'南瓜-進口'),(80,80,'隼人瓜'),(81,81,'隼人瓜-瓜苗'),(82,82,'石蓮花'),(83,83,'辣椒-紅小'),(84,84,'辣椒-青小'),(85,85,'辣椒-雞心'),(86,86,'辣椒-朝天椒'),(87,87,'辣椒-青龍'),(88,88,'辣椒-糯米椒'),(89,89,'金針花'),(90,90,'玉米-其他'),(91,91,'玉米-白玉米'),(92,92,'玉米-超甜白'),(93,93,'玉米-玉米筍'),(94,94,'玉米-糯米(黑)'),(95,95,'玉米-甜軟殼'),(96,96,'玉米-糯米(白)'),(97,97,'玉米-進口'),(98,98,'落花生-生落花生'),(99,99,'落花生-熟落花生'),(100,100,'黃金果'),(101,101,'酪梨'),(102,102,'奇異果-進口'),(103,103,'波羅蜜'),(104,104,'葡萄柚-進口紅肉'),(105,105,'木瓜-網室紅肉'),(106,106,'木瓜-日昇種'),(107,107,'木瓜-青木瓜'),(108,108,'荔枝-其他'),(109,109,'荔枝-黑葉'),(110,110,'荔枝-糯米'),(111,111,'荔枝-桂味'),(112,112,'龍眼-粉殼'),(113,113,'甘藍-其他'),(114,114,'甘藍-初秋'),(115,115,'甘藍-改良種'),(116,116,'甘藍-紫色'),(117,117,'甘藍-進口'),(118,118,'小白菜-其他'),(119,119,'小白菜-土白菜'),(120,120,'小白菜-蚵仔白'),(121,121,'小白菜-奶油白'),(122,122,'小白菜-水耕'),(123,123,'包心白菜-其他'),(124,124,'包心白菜-包白'),(125,125,'包心白菜-包頭蓮'),(126,126,'包心白-進口'),(127,127,'青江白菜-小梗'),(128,128,'皇宮菜-小葉'),(129,129,'皇宮菜-大葉'),(130,130,'蕹菜-小葉'),(131,131,'蕹菜-水蕹菜'),(132,132,'芹菜-白梗'),(133,133,'芹菜-西洋芹菜'),(134,134,'芹菜-山芹菜'),(135,135,'芹菜-進口'),(136,136,'菠菜-角葉'),(137,137,'萵苣菜-其他'),(138,138,'萵苣菜-廣東萵'),(139,139,'萵苣菜-結球萵'),(140,140,'萵苣菜-本島圓葉'),(141,141,'萵苣菜-油麥菜'),(142,142,'萵苣菜-蘿美'),(143,143,'萵苣菜-紅捲綠捲'),(144,144,'萵苣菜-水耕'),(145,145,'萵苣菜-進口'),(146,146,'芥菜-小芥菜'),(147,147,'芥藍菜'),(148,148,'芥藍菜-芥藍芽'),(149,149,'莧菜-紅莧菜'),(150,150,'莧菜-白莧菜'),(151,151,'油菜'),(152,152,'油菜-小松菜'),(153,153,'甘藷葉'),(154,154,'芫荽'),(155,155,'九層塔'),(156,156,'羅勒'),(157,157,'紅鳳菜-紅鳳菜'),(158,158,'茴香'),(159,159,'海菜-海帶'),(160,160,'海菜-水蓮'),(161,161,'巴西利'),(162,162,'蕨菜-過貓'),(163,163,'人參葉'),(164,164,'藤川七-川七葉'),(165,165,'洋菇'),(166,166,'洋菇(盒)-盒裝'),(167,167,'草菇'),(168,168,'濕木耳-其他'),(169,169,'濕木耳'),(170,170,'溼香菇'),(171,171,'金絲菇-其他'),(172,172,'金絲菇'),(173,173,'金絲菇(盒)-盒裝'),(174,174,'蠔菇-鮑魚菇'),(175,175,'巴西蘑菇'),(176,176,'巴西蘑菇-盒裝'),(177,177,'秀珍菇'),(178,178,'杏鮑菇'),(179,179,'杏鮑菇-盒裝'),(180,180,'鴻禧菇'),(181,181,'珊瑚菇'),(182,182,'珊瑚菇-盒裝'),(183,183,'柳松菇'),(184,184,'其他菇類-其他菇類'),(185,185,'李-其他'),(186,186,'李-黃肉李'),(187,187,'李-加州李'),(188,188,'李-進口'),(189,189,'梨-秋水梨'),(190,190,'梨-世紀梨'),(191,191,'梨-新興梨'),(192,192,'梨-豐水梨'),(193,193,'梨-4029梨'),(194,194,'鹹菜-帶葉'),(195,195,'雪裡紅'),(196,196,'其他蔬菜'),(197,197,'蘿蔔乾'),(198,198,'醃瓜-漬'),(199,199,'熟筍-箭竹筍'),(200,200,'筍茸'),(201,201,'朴菜'),(202,202,'梨-蜜梨'),(203,203,'番石榴-珍珠芭'),(204,204,'番石榴-紅心'),(205,205,'番石榴-帝王芭'),(206,206,'番石榴-世紀芭'),(207,207,'蓮霧-其他'),(208,208,'蓮霧-紅蓮霧'),(209,209,'蓮霧-巴掌蓮霧'),(210,210,'芒果-其他'),(211,211,'芒果-愛文'),(212,212,'芒果-紅龍玉文'),(213,213,'芒果-本島'),(214,214,'芒果-夏雪'),(215,215,'芒果-黑香金興'),(216,216,'芒果-金煌'),(217,217,'芒果-芒果青'),(218,218,'葡萄-巨峰'),(219,219,'葡萄-進口'),(220,220,'蘿蔔-矸仔'),(221,221,'蘿蔔-櫻桃'),(222,222,'蘿蔔-甜菜根'),(223,223,'蘿蔔-進口'),(224,224,'胡蘿蔔-未洗'),(225,225,'胡蘿蔔-清洗'),(226,226,'馬鈴薯-本產'),(227,227,'馬鈴薯-進口'),(228,228,'洋蔥-本產'),(229,229,'洋蔥-進口'),(230,230,'青蔥-日蔥'),(231,231,'青蔥-紅蔥頭'),(232,232,'青蔥-粉蔥'),(233,233,'韭菜-白頭'),(234,234,'韭菜-韭菜黃'),(235,235,'韭菜-韭菜花'),(236,236,'韭菜-青頭'),(237,237,'大蒜-軟梗'),(238,238,'大蒜-蒜頭'),(239,239,'大蒜-蒜仁'),(240,240,'大蒜-蒜瓣'),(241,241,'竹筍-麻竹筍'),(242,242,'竹筍-綠竹筍'),(243,243,'竹筍-烏殼綠'),(244,244,'竹筍-去殼'),(245,245,'芋-檳榔心芋'),(246,246,'芋-里芋'),(247,247,'芋-芋莖'),(248,248,'荸薺'),(249,249,'荸薺-加工'),(250,250,'豆薯'),(251,251,'牛蒡-進口'),(252,252,'蓮藕'),(253,253,'蓮藕-蓮子'),(254,254,'甘薯-其他'),(255,255,'甘薯-臺農57號'),(256,256,'甘薯-芋仔甘薯'),(257,257,'甘薯-臺農66號'),(258,258,'薑-老薑'),(259,259,'薑-嫩薑'),(260,260,'茭白筍-帶殼'),(261,261,'茭白筍-去殼'),(262,262,'菱角-去殼'),(263,263,'薯蕷-紅薯蕷'),(264,264,'薯蕷-白薯蕷'),(265,265,'薯蕷-進口'),(266,266,'蘆筍-白蘆筍'),(267,267,'蘆筍-綠蘆筍'),(268,268,'蘆筍-蘆筍花'),(269,269,'蘆筍-進口'),(270,270,'芽菜類-綠豆芽'),(271,271,'芽菜類-黃豆牙'),(272,272,'芽菜類-豌豆嬰'),(273,273,'芽菜類-苜宿芽'),(274,274,'百合'),(275,275,'晚香玉筍'),(276,276,'西瓜-大西瓜'),(277,277,'西瓜-黃肉'),(278,278,'西瓜-秀鈴'),(279,279,'西瓜-進口'),(280,280,'甜瓜-美濃'),(281,281,'甜瓜-溫室吊瓜'),(282,282,'洋香瓜-其他'),(283,283,'洋香瓜-網狀紅肉'),(284,284,'洋香瓜-網狀綠肉'),(285,285,'洋香瓜-進口'),(286,286,'蘋果-富士(進口)'),(287,287,'桃子-水蜜桃'),(288,288,'水蜜桃-進口'),(289,289,'甜桃-甜桃進口'),(290,290,'桃子-進口'),(291,291,'康乃馨-紅'),(292,292,'康乃馨-櫻紅'),(293,293,'小可愛-紅'),(294,294,'美女撫子-綠石竹'),(295,295,'火鶴花-火鶴花'),(296,296,'火鶴花-混色'),(297,297,'火鶴花-紅色'),(298,298,'火鶴花-紅紅心'),(299,299,'火鶴花-紅綠邊'),(300,300,'火鶴花-丘比特'),(301,301,'火鶴花-千里達'),(302,302,'火鶴花-月光'),(303,303,'火鶴花-桔綠邊'),(304,304,'火鶴花-黃瑪莉'),(305,305,'火鶴花-粉色'),(306,306,'火鶴花-夏粉　'),(307,307,'火鶴花-粉綠邊'),(308,308,'火鶴花-夢幻'),(309,309,'火鶴花-粉佳人'),(310,310,'火鶴花-羅莎'),(311,311,'火鶴花-花仙子'),(312,312,'火鶴花-彩虹'),(313,313,'火鶴花-太極'),(314,314,'火鶴花-小紅莓'),(315,315,'火鶴花-翠綠'),(316,316,'火鶴花-白黃心'),(317,317,'火鶴花-花紫'),(318,318,'火鶴花-咖啡紅'),(319,319,'火鶴花-咖啡條紋'),(320,320,'火鶴花-黑珍珠'),(321,321,'大菊-黃精競'),(322,322,'大菊-白天星'),(323,323,'小菊-混合色'),(324,324,'小菊-小紅娘'),(325,325,'小菊-卡洛琳'),(326,326,'小菊-金'),(327,327,'小菊-黃'),(328,328,'小菊-黃丁字菊'),(329,329,'小菊-吉祥黃'),(330,330,'小菊-吉祥小粉'),(331,331,'小菊-粉日記'),(332,332,'小菊-珍珠白'),(333,333,'小菊-白斯不列'),(334,334,'小菊-染色小菊'),(335,335,'非洲菊-混合色'),(336,336,'非洲菊-橙'),(337,337,'非洲菊-太陽神'),(338,338,'非洲菊-黃'),(339,339,'非洲菊-伊斯瑪拉'),(340,340,'非洲菊-粉紅魅力'),(341,341,'非洲菊-白'),(342,342,'非洲菊-迷你混色'),(343,343,'劍蘭-雙色金紅'),(344,344,'劍蘭-２６５號'),(345,345,'劍蘭-青殼粉'),(346,346,'其它花卉-其它花卉'),(347,347,'柔麗絲-柔麗絲'),(348,348,'八卦草(黃河)-八卦草(黃河)'),(349,349,'金鎚花-金鎚花'),(350,350,'黃梔花-黃梔花'),(351,351,'天堂鳥-天堂鳥'),(352,352,'小天堂鳥-桔帶紅'),(353,353,'鶴焦-鶴焦'),(354,354,'紅娘垂蕉-紅娘垂蕉'),(355,355,'垂焦-垂焦'),(356,356,'美人蕉-美人蕉'),(357,357,'石玫瑰-石玫瑰'),(358,358,'野薑花-白'),(359,359,'紅薑花-紅'),(360,360,'嘉蘭<火焰百合>-嘉蘭<火焰百合>'),(361,361,'夜來香-單瓣'),(362,362,'夜來香-重瓣'),(363,363,'初雪草-初雪草'),(364,364,'秀線-秀線'),(365,365,'千日紅-千日紅'),(366,366,'向日葵-單瓣'),(367,367,'雞冠花-雞冠花'),(368,368,'雞冠花-清紅'),(369,369,'雞冠花-黃'),(370,370,'雞冠花-綠'),(371,371,'雞冠花-紫紅'),(372,372,'珊瑚鳳梨-珊瑚鳳梨'),(373,373,'麒麟草-麒麟草'),(374,374,'繡球花-粉'),(375,375,'繡球花-白'),(376,376,'繡球花-藍'),(377,377,'繡球花-水藍'),(378,378,'迥香-白'),(379,379,'睡蓮-睡蓮'),(380,380,'伯利恆之星-伯利恆之星'),(381,381,'茉莉花-茉莉花'),(382,382,'深山櫻-深山櫻'),(383,383,'百子蓮<愛情花>-百子蓮<愛情花>'),(384,384,'蘭花-蘭花'),(385,385,'腎藥蘭-腎藥蘭'),(386,386,'千代蘭-千代蘭'),(387,387,'萬代蘭-萬代蘭'),(388,388,'黃后蘭-黃后蘭'),(389,389,'萬代蘭-巨輪黃'),(390,390,'萬代蘭-巨輪粉'),(391,391,'萬代蘭-巨輪白'),(392,392,'萬代蘭-巨輪紫'),(393,393,'萬代蘭-巨輪棕'),(394,394,'香水文心蘭-香水文心蘭'),(395,395,'檸檬綠文心蘭-檸檬綠文心蘭'),(396,396,'石斛蘭-粉'),(397,397,'石斛蘭-白'),(398,398,'蝴蝶蘭-紅色'),(399,399,'蝴蝶蘭-黃色'),(400,400,'蝴蝶蘭-粉色'),(401,401,'蝴蝶蘭-白黃心'),(402,402,'玫瑰-玫瑰'),(403,403,'玫瑰-紅'),(404,404,'玫瑰-新櫻紅'),(405,405,'玫瑰-翡翠紅'),(406,406,'玫瑰-萬年紅'),(407,407,'玫瑰-埔里之星'),(408,408,'玫瑰-新橙色'),(409,409,'玫瑰-粉'),(410,410,'玫瑰-黛安娜粉'),(411,411,'玫瑰-桃紅'),(412,412,'玫瑰-甜心'),(413,413,'玫瑰-新鐵達尼'),(414,414,'玫瑰-卡蜜拉'),(415,415,'玫瑰-翡翠粉'),(416,416,'玫瑰-維納斯'),(417,417,'玫瑰-翡翠香檳'),(418,418,'玫瑰-珍愛你'),(419,419,'玫瑰-綠'),(420,420,'玫瑰-翡翠白'),(421,421,'玫瑰-紫'),(422,422,'玫瑰-紫天王'),(423,423,'玫瑰-紫愛你'),(424,424,'玫瑰-山中傳奇'),(425,425,'玫瑰-迷你紅'),(426,426,'玫瑰-迷你黃'),(427,427,'玫瑰-迷你粉'),(428,428,'玫瑰-迷你雙色'),(429,429,'香水百合-雙朵'),(430,430,'香水百合-三朵'),(431,431,'香水百合-多朵'),(432,432,'香水百合-紅雙朵'),(433,433,'香水百合-紅三朵'),(434,434,'香水百合-紅多朵'),(435,435,'香水百合-黃三朵'),(436,436,'香水百合-黃多朵'),(437,437,'香水百合-粉'),(438,438,'香水百合-粉雙朵'),(439,439,'香水百合-粉三朵'),(440,440,'香水百合-粉多朵'),(441,441,'香水百合-白多朵'),(442,442,'香水百合-索邦妮多朵'),(443,443,'香水百合-馬可波羅粉'),(444,444,'香水百合-馬可波羅粉單朵'),(445,445,'香水百合-馬可波羅粉雙朵'),(446,446,'香水百合-馬可波羅粉三朵'),(447,447,'香水百合-馬可波羅粉多朵'),(448,448,'水晶香水-雙朵'),(449,449,'水晶香水-三朵'),(450,450,'水晶香水-多朵'),(451,451,'薇薇安娜-三朵'),(452,452,'香水百合-耶蘿琳'),(453,453,'香水百合-耶蘿琳三朵'),(454,454,'香水百合-耶蘿琳多朵'),(455,455,'OT曼尼薩-OT曼尼薩'),(456,456,'OT曼尼薩-雙朵'),(457,457,'OT曼尼薩-三朵'),(458,458,'OT曼尼薩-多朵'),(459,459,'OT多娜托-多朵'),(460,460,'香水百合-賽拉諾三朵'),(461,461,'香水百合-賽拉諾多朵'),(462,462,'鐵砲百合-雷山一號單朵'),(463,463,'鐵砲百合-雷山一號雙朵'),(464,464,'鐵砲百合-雷山一號三朵'),(465,465,'洋桔梗-洋桔梗'),(466,466,'洋桔梗-單瓣紫'),(467,467,'洋桔梗-雙瓣(混色)'),(468,468,'洋桔梗-雙瓣紅'),(469,469,'洋桔梗-艾瑞娜桃'),(470,470,'洋桔梗-雙瓣粉'),(471,471,'洋桔梗-艾瑞娜彩粉'),(472,472,'洋桔梗-雙瓣彩藍'),(473,473,'洋桔梗-雙瓣綠'),(474,474,'洋桔梗-艾瑞娜綠'),(475,475,'洋桔梗-雙瓣白'),(476,476,'洋桔梗-艾瑞娜白'),(477,477,'洋桔梗-雙瓣紫'),(478,478,'洋桔梗-羅西娜薰衣草紫'),(479,479,'洋桔梗-羅西娜紫'),(480,480,'洋桔梗-順風紫'),(481,481,'洋桔梗-雙瓣白紫邊'),(482,482,'星辰花-黃'),(483,483,'星辰花-大湖魅力'),(484,484,'星辰花-白'),(485,485,'星辰花-紫'),(486,486,'粉孔雀-粉孔雀'),(487,487,'卡斯比亞-帶葉'),(488,488,'卡斯比亞-無葉'),(489,489,'滿天星-銀河'),(490,490,'水晶花-粉鑽'),(491,491,'切葉類-切葉類'),(492,492,'尤加利葉-尤加利葉'),(493,493,'唐棉-唐棉'),(494,494,'黃椰心葉-葉'),(495,495,'銀龍柳-銀龍柳'),(496,496,'電信蘭葉-電信蘭葉'),(497,497,'七里香-七里香'),(498,498,'火鶴葉-火鶴葉'),(499,499,'葉蘭-葉蘭'),(500,500,'八角金盤-八角金盤'),(501,501,'蓮蓬-蓮蓬'),(502,502,'扁柏-扁柏'),(503,503,'鋸齒蔓綠絨葉-鋸齒蔓綠絨葉'),(504,504,'高梁-高梁'),(505,505,'新文竹-新文竹'),(506,506,'牛頭茄-牛頭茄'),(507,507,'山蘇葉-山蘇葉'),(508,508,'百合竹-百合竹'),(509,509,'天堂鳥葉-天堂鳥葉'),(510,510,'雪松-雪松'),(511,511,'春樹蘭-香樹蘭'),(512,512,'火龍果-火龍果'),(513,513,'綠春蘭葉-綠春蘭葉'),(514,514,'水燭葉-水燭葉'),(515,515,'山防風-山防風'),(516,516,'高山羊齒-高山羊齒'),(517,517,'青竹-青竹'),(518,518,'紅竹-紅竹'),(519,519,'白竹-白竹'),(520,520,'進口康乃馨-中大輪'),(521,521,'進口康乃馨-混合色'),(522,522,'進口康乃馨-多朵混色'),(523,523,'進口大菊-進口大菊'),(524,524,'進口大菊-黃'),(525,525,'進口大菊-黃乒乓'),(526,526,'進口大菊-粉'),(527,527,'進口大菊-粉乒乓'),(528,528,'進口大菊-綠絲菊'),(529,529,'進口大菊-綠乒乓'),(530,530,'進口大菊-白'),(531,531,'進口大菊-白乒乓'),(532,532,'進口小菊-進口小菊'),(533,533,'進口小菊-混合色'),(534,534,'進口小菊-紅'),(535,535,'進口小菊-黃'),(536,536,'進口小菊-粉'),(537,537,'進口小菊-綠'),(538,538,'進口小菊-白'),(539,539,'進口小菊-青心小白'),(540,540,'進口小菊-染色小菊'),(541,541,'進口其它花卉-進口其它花卉'),(542,542,'進口水仙百合-混色'),(543,543,'進口水仙百合-橙'),(544,544,'進口水仙百合-黃'),(545,545,'進口水仙百合-粉'),(546,546,'進口水仙百合-白'),(547,547,'進口水仙百合-紫'),(548,548,'進口針墊花-進口針墊花'),(549,549,'進口帝王花-進口帝王花'),(550,550,'進口繡球花-進口繡球花'),(551,551,'進口臘梅-進口臘梅'),(552,552,'鬱金香-進口 非洲'),(553,553,'進口石斛蘭-深紅'),(554,554,'進口切葉類-進口切葉類'),(555,555,'進口樺木(假葉)-進口樺木(假葉)'),(556,556,'進口高山羊齒-進口高山羊齒'),(557,557,'椰子-剝殼'),(558,558,'甘蔗-帶皮'),(559,559,'小番茄-其他'),(560,560,'雜柑-其他'),(561,561,'其他花類'),(562,562,'冬瓜-其他'),(563,563,'茄子-胭脂茄'),(564,564,'豌豆-豌豆苗'),(565,565,'南瓜-東昇'),(566,566,'辣椒-其他'),(567,567,'洛神花'),(568,568,'橄欖'),(569,569,'栗子'),(570,570,'荔枝-玉荷包'),(571,571,'荔枝-竹葉黑'),(572,572,'甘藍-甘藍心'),(573,573,'甘藍-甘藍芽'),(574,574,'甘藍-改良尖'),(575,575,'包心白菜-成功白'),(576,576,'包心白菜-冬白芽'),(577,577,'蕹菜-大葉'),(578,578,'芥菜-芥菜仁'),(579,579,'芥菜-大芥菜'),(580,580,'菾菜-茄茉菜'),(581,581,'蕨菜-山蘇'),(582,582,'西洋菜'),(583,583,'濕木耳(盒)-盒裝'),(584,584,'鴻禧菇-其他'),(585,585,'鴻禧菇-盒裝'),(586,586,'柳松菇-盒裝'),(587,587,'梨-幸水梨'),(588,588,'梨-進口'),(589,589,'熟筍-桂竹筍'),(590,590,'番石榴-其他'),(591,591,'番石榴-水晶無仔'),(592,592,'蓮霧-子彈型'),(593,593,'胡蘿蔔-進口'),(594,594,'青蔥-北蔥'),(595,595,'大蒜-蔥蒜'),(596,596,'芋-麵芋'),(597,597,'牛蒡'),(598,598,'薑-其他'),(599,599,'薑-粉薑'),(600,600,'蕎頭-露蕎'),(601,601,'半天筍'),(602,602,'金針筍'),(603,603,'西瓜-鳳光、英妙'),(604,604,'蘋果-秋香(進口)'),(605,605,'小番茄-一般'),(606,606,'扁蒲-長形'),(607,607,'甜椒-進口'),(608,608,'辣椒-進口'),(609,609,'玉米-甜硬殼'),(610,610,'龍眼-其他'),(611,611,'楊桃-紅龍'),(612,612,'青蔥-進口蔥'),(613,613,'竹筍-桂竹筍'),(614,614,'球莖甘藍'),(615,615,'芽菜類-其他'),(616,616,'西瓜-其他'),(617,617,'西瓜-紅肉'),(618,618,'扁蒲-其他'),(619,619,'青花苔'),(620,620,'酪梨-進口'),(621,621,'葡萄柚-白肉'),(622,622,'木瓜-一般紅肉'),(623,623,'梨-其他'),(624,624,'西洋梨-西洋梨進口'),(625,625,'竹筍-孟宗筍'),(626,626,'甜瓜-其他'),(627,627,'芥藍菜-進口'),(628,628,'蘋果-其他'),(629,629,'山竹-山竹'),(630,630,'紅毛丹-紅毛丹'),(631,631,'小可愛-(混色)'),(632,632,'火鶴花-紅青心'),(633,633,'小菊-粉'),(634,634,'小菊-林克小白'),(635,635,'劍蘭-４號'),(636,636,'劍蘭-康威'),(637,637,'小天堂鳥-粉紅'),(638,638,'黃金鳥-黃金鳥'),(639,639,'觀音蓮-觀音蓮'),(640,640,'薑荷花-薑荷花'),(641,641,'玉蘭花-玉蘭花'),(642,642,'雞冠花-粉'),(643,643,'觀花鳳梨花-觀花鳳梨花'),(644,644,'玫瑰-佳娜紅'),(645,645,'玫瑰-卡門'),(646,646,'玫瑰-新香檳粉'),(647,647,'玫瑰-鐵達尼'),(648,648,'玫瑰-東方之星'),(649,649,'玫瑰-白'),(650,650,'香水百合-香水百合'),(651,651,'香水百合-紅'),(652,652,'水晶香水-水晶香水'),(653,653,'薇薇安娜-雙朵'),(654,654,'香水百合-康卡多三朵'),(655,655,'香水百合-康卡多多朵'),(656,656,'百合-巴卡蒂多朵'),(657,657,'百合-塔拉果二朵'),(658,658,'百合-塔拉果三朵'),(659,659,'百合-塔拉果多朵'),(660,660,'星辰花-混色'),(661,661,'滿天星-白'),(662,662,'虎斑木葉-虎斑木葉'),(663,663,'龍文蘭-龍文蘭'),(664,664,'米柳-米柳'),(665,665,'進口滿天星-白'),(666,666,'龍眼-龍眼肉'),(667,667,'楊桃-馬來亞種'),(668,668,'醃瓜-乾'),(669,669,'筍乾'),(670,670,'西瓜-黑美人'),(671,671,'李-紅肉李'),(672,672,'蘋果-惠(進口)'),(673,673,'康乃馨-多朵(混色)'),(674,674,'小菊-日本黃'),(675,675,'小菊-白'),(676,676,'劍蘭-混合色'),(677,677,'劍蘭-紅'),(678,678,'劍蘭-新種紅'),(679,679,'雞冠花-暗紅'),(680,680,'萬代蘭-巨輪紅'),(681,681,'石斛蘭-深紅'),(682,682,'香水百合-白三朵'),(683,683,'越瓜'),(684,684,'香水百合-索邦妮三朵'),(685,685,'OT曼尼薩-單朵'),(686,686,'OT多娜托-三朵'),(687,687,'洋桔梗-皇后白'),(688,688,'星點木-星點木'),(689,689,'蘋果-其他(進口)'),(690,690,'火鶴花-雪碧粉'),(691,691,'火鶴花-王妃'),(692,692,'火鶴花-綠紅心'),(693,693,'火鶴花-雷夢娜'),(694,694,'火鶴花-白色'),(695,695,'小菊-秋陽'),(696,696,'非洲菊-沙丘'),(697,697,'非洲菊-粉'),(698,698,'非洲菊-粉美麗'),(699,699,'非洲菊-白雪'),(700,700,'劍蘭-２３５號'),(701,701,'水仙百合-混色'),(702,702,'鳳梨花-鳳梨花'),(703,703,'仙丹花-仙丹花'),(704,704,'玫瑰-比浪卡'),(705,705,'玫瑰-雙色'),(706,706,'OT多娜托-OT多娜托'),(707,707,'OT多娜托-雙朵'),(708,708,'鐵砲百合-雷山一號多朵'),(709,709,'壽松-壽松'),(710,710,'玉羊齒-玉羊齒'),(711,711,'黃金竹-黃金竹'),(712,712,'非洲菊-紫王子'),(713,713,'玫瑰-混合色'),(714,714,'香水百合-康卡多雙朵'),(715,715,'百合-塔拉果'),(716,716,'洋桔梗-神奇白紫'),(717,717,'滿天星-牽牛星'),(718,718,'水晶花-黃鑽'),(719,719,'菠菜-進口'),(720,720,'鹹菜-清心'),(721,721,'桶筍-麻竹筍'),(722,722,'桶筍-綠竹筍'),(723,723,'桶筍-桂竹筍'),(724,724,'桶筍-箭竹筍'),(725,725,'筍絲'),(726,726,'蓮藕-進口'),(727,727,'桃子-其他'),(728,728,'花椰菜-白梗'),(729,729,'豌豆-白花'),(730,730,'芹菜-青梗'),(731,731,'菠菜-圓葉'),(732,732,'蘿蔔-其他'),(733,733,'大蒜-硬梗'),(734,734,'萊豆-豆莢'),(735,735,'海菜-龍鬚菜'),(736,736,'筍片'),(737,737,'茭白筍'),(738,738,'秀珍菇-其他'),(739,739,'杏鮑菇-其他'),(740,740,'胡瓜-改良種'),(741,741,'甘藍-甜甘藍'),(742,742,'蘿蔔-梅花'),(743,743,'茼蒿'),(744,744,'半天花'),(745,745,'蘋果-五爪(進口)'),(746,746,'桃子-福壽桃'),(747,747,'火鶴花-蘋果綠'),(748,748,'火鶴花-香檳'),(749,749,'火鶴花-白青心'),(750,750,'火鶴花-月亮女神'),(751,751,'火鶴花-大地'),(752,752,'松蟲草-松蟲草'),(753,753,'水仙百合-粉'),(754,754,'翠珠花-翠珠花'),(755,755,'夕霧草-夕霧草'),(756,756,'大理花-紅色'),(757,757,'薊花(紅花)-薊花(紅花)'),(758,758,'觀果鳳梨花-觀果鳳梨花'),(759,759,'海芋-紅'),(760,760,'海芋-黃'),(761,761,'貝殼花-貝殼花'),(762,762,'腎藥蘭-淺紅色'),(763,763,'拖鞋蘭-拖鞋蘭'),(764,764,'大文心蘭-大文心蘭'),(765,765,'蝴蝶蘭-混色'),(766,766,'蝴蝶蘭-線條'),(767,767,'玫瑰-紅衣武士'),(768,768,'鐵砲百合-白單朵'),(769,769,'洋桔梗-雙瓣黃'),(770,770,'星辰花-紫色之戀'),(771,771,'紫孔雀-春天'),(772,772,'水晶花-混合'),(773,773,'射干-射千'),(774,774,'紐西蘭麻-紐西蘭麻'),(775,775,'進口泡盛草-進口泡盛草'),(776,776,'進口虎頭蘭-大輪'),(777,777,'進口玫瑰-混合色'),(778,778,'進口玫瑰-紅'),(779,779,'進口玫瑰-櫻紅'),(780,780,'進口玫瑰-白'),(781,781,'進口玫瑰-紫'),(782,782,'秀珍菇(盒)-盒裝'),(783,783,'猴頭菇'),(784,784,'猴頭菇-盒裝'),(785,785,'青蔥-大蔥'),(786,786,'甘蔗筍'),(787,787,'桃子-早桃'),(788,788,'菜豆-其他'),(789,789,'敏豆-青豆'),(790,790,'香瓜梨'),(791,791,'柚子-紅柚'),(792,792,'萵苣菜-本島尖葉'),(793,793,'李-桃接李'),(794,794,'芒果-聖心'),(795,795,'蕃茄-粉柿'),(796,796,'青花苔-青花筍'),(797,797,'紅鳳菜-白鳳菜'),(798,798,'芒果-凱特'),(799,799,'玫瑰-胭脂'),(800,800,'洋桔梗-順風綠'),(801,801,'斑葉蘭-斑葉蘭'),(802,802,'進口牡丹花-進口牡丹花'),(803,803,'進口小蒼蘭-粉色'),(804,804,'進口鬱金香-紅色'),(805,805,'進口鬱金香-橙色'),(806,806,'進口鬱金香-黃色'),(807,807,'進口鬱金香-白色'),(808,808,'進口玫瑰-粉'),(809,809,'桃子-鶯歌桃'),(810,810,'桃子-甜桃'),(811,811,'小菊-日本小紅'),(812,812,'非洲菊-紅'),(813,813,'香水百合-紅單朵'),(814,814,'香水百合-耶蘿琳雙朵'),(815,815,'火鶴花-珊瑚粉'),(816,816,'水仙百合-白'),(817,817,'香水百合-單朵'),(818,818,'黃椰心-黃椰心'),(819,819,'進口鬱金香-粉色'),(820,820,'嘉德麗蘭-嘉德麗蘭'),(821,821,'萬代蘭-巨輪混'),(822,822,'進口康乃馨-櫻紅'),(823,823,'包心白菜-天津白'),(824,824,'休市'),(825,825,'美女撫子-美女撫子'),(826,826,'火鶴花-吉祥'),(827,827,'火鶴花-森林'),(828,828,'大菊-大菊'),(829,829,'大理花-混色'),(830,830,'繡球花-繡球花'),(831,831,'海芋-混色'),(832,832,'紫嬌花-紫嬌花'),(833,833,'樹蘭-樹蘭'),(834,834,'萬代蘭-巨輪橙'),(835,835,'石斛蘭-綠寶石黃'),(836,836,'蝴蝶蘭-斑點'),(837,837,'香水百合-黃雙朵'),(838,838,'香水百合-康卡多'),(839,839,'香水百合-凱麗湖雙朵'),(840,840,'香水百合-凱麗湖三朵'),(841,841,'香水百合'),(842,842,'鐵砲百合-白'),(843,843,'鐵砲百合-白雙朵'),(844,844,'洋桔梗-莫內馬林白紫'),(845,845,'洋桔梗-順風杏粉'),(846,846,'洋桔梗-卡門紫'),(847,847,'補血草-補血草'),(848,848,'星辰花-粉仙紫'),(849,849,'觀賞辣椒-觀賞辣椒'),(850,850,'花竹-花竹'),(851,851,'進口康乃馨-紅'),(852,852,'進口康乃馨-粉'),(853,853,'進口康乃馨-淺粉'),(854,854,'進口康乃馨-紫'),(855,855,'進口狐尾百合-進口狐尾百合'),(856,856,'進口丹頂(蔥花)-進口丹頂(蔥花)'),(857,857,'進口大飛燕草-進口大飛燕草'),(858,858,'進口小蒼蘭-混色'),(859,859,'進口小蒼蘭-黃色'),(860,860,'進口小蒼蘭-白色'),(861,861,'進口小蒼蘭-紫色'),(862,862,'進口風信子-進口風信子'),(863,863,'進口鬱金香-紫色'),(864,864,'進口鬱金香-雙色'),(865,865,'進口海芋-橙'),(866,866,'進口海芋-黃'),(867,867,'進口海芋-粉'),(868,868,'進口海芋-白'),(869,869,'進口金翠花-進口金翠花'),(870,870,'進口玫瑰-進口玫瑰'),(871,871,'進口洋桔梗-三角桔梗'),(872,872,'香水百合-白'),(873,873,'洋桔梗-羅西娜綠'),(874,874,'新西蘭葉-新西蘭葉'),(875,875,'珠廉-珠廉'),(876,876,'康乃馨-多朵櫻紅'),(877,877,'大菊-混合色'),(878,878,'新西蘭株-新西蘭株'),(879,879,'香櫞-佛手'),(880,880,'康乃馨-多朵粉'),(881,881,'火鶴花-總統'),(882,882,'劍蘭-粉'),(883,883,'孔雀草-孔雀草'),(884,884,'染大菊-白東洋'),(885,885,'進口康乃馨-黃'),(886,886,'進口康乃馨-白帶紫'),(887,887,'進口康乃馨-黃帶紅'),(888,888,'菱角-生菱角'),(889,889,'敏豆-其他'),(890,890,'蛋黃果-仙桃'),(891,891,'洋香瓜-光面綠肉'),(892,892,'菱角-熟菱角'),(893,893,'冬瓜-進口'),(894,894,'萵苣莖'),(895,895,'黑種草-黑種草');
/*!40000 ALTER TABLE `CULTIVAR_LIST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CULT_WORK_LIST`
--

DROP TABLE IF EXISTS `CULT_WORK_LIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CULT_WORK_LIST` (
  `cult_work_id` int(11) NOT NULL,
  `cult_work_code` int(3) NOT NULL,
  `cult_work_tw_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `cult_work_cn_name` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`cult_work_id`,`cult_work_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CULT_WORK_LIST`
--

LOCK TABLES `CULT_WORK_LIST` WRITE;
/*!40000 ALTER TABLE `CULT_WORK_LIST` DISABLE KEYS */;
INSERT INTO `CULT_WORK_LIST` VALUES (10010,10010,'清園','清園'),(10020,10020,'土壤消毒','土壤消毒'),(10030,10030,'調節土壤pH值','調節土壤pH值'),(10040,10040,'土壤有機質改良','土壤有機質改良'),(10050,10050,'整地(作畦)','整地(作畦)'),(10060,10060,'設施操作','設施操作'),(10061,10061,'覆蓋塑膠布','覆蓋塑膠布'),(10062,10062,'架隧道棚','架隧道棚'),(10063,10063,'設攀爬架（網）','設攀爬架（網）'),(10064,10064,'裝灌溉/滴灌設施','裝灌溉/滴灌設施'),(20010,20010,'播種育苗','播種育苗'),(20020,20020,'苗圃定植/移植','苗圃定植'),(20030,20030,'種苗消毒','種苗消毒'),(20040,20040,'催芽','催芽'),(20050,20050,'補植','補植'),(20060,20060,'嫁接','嫁接'),(30010,30010,'除草','除草'),(30020,30020,'培土','培土'),(30030,30030,'施肥','施肥'),(30040,30040,'灌溉','灌溉'),(30050,30050,'病蟲害管理','病蟲害管理'),(30060,30060,'整枝/去側蔓','整枝/去側蔓'),(30070,30070,'引蔓/固蔓','引蔓/固蔓'),(30080,30080,'授粉','授粉'),(30081,30081,'授粉(昆蟲)','授粉(昆蟲)'),(30082,30082,'授粉(人工)','授粉(人工)'),(30090,30090,'摘心','摘心'),(30091,30091,'幼苗期摘心','幼苗期摘心'),(30092,30092,'主蔓摘心','主蔓摘心'),(30093,30093,'留果枝摘心','留果枝摘心'),(30100,30100,'疏果','疏果'),(30110,30110,'襯果墊','襯果墊'),(30120,30120,'吊果','吊果'),(30130,30130,'套袋','套袋'),(30140,30140,'除葉','除葉'),(30150,30150,'排水','排水'),(90010,90010,'其他','其他');
/*!40000 ALTER TABLE `CULT_WORK_LIST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CULT_WORK_RECORD`
--

DROP TABLE IF EXISTS `CULT_WORK_RECORD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CULT_WORK_RECORD` (
  `farm_id` varchar(5) COLLATE utf8_bin NOT NULL,
  `region_id` int(10) NOT NULL,
  `gacp_no` varchar(20) COLLATE utf8_bin NOT NULL,
  `record_item` int(2) NOT NULL,
  `word_date` date NOT NULL,
  `reg_user_id` int(11) NOT NULL,
  `memo` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `image_addr` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `is_old` int(11) NOT NULL DEFAULT '0',
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`record_id`,`farm_id`,`region_id`,`record_item`,`gacp_no`,`is_old`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CULT_WORK_RECORD`
--

LOCK TABLES `CULT_WORK_RECORD` WRITE;
/*!40000 ALTER TABLE `CULT_WORK_RECORD` DISABLE KEYS */;
/*!40000 ALTER TABLE `CULT_WORK_RECORD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CULT_WORK_REORD`
--

DROP TABLE IF EXISTS `CULT_WORK_REORD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CULT_WORK_REORD` (
  `farm_id` varchar(5) COLLATE utf8_bin NOT NULL,
  `region_id` int(11) NOT NULL,
  `gacp_no` varchar(20) COLLATE utf8_bin NOT NULL,
  `record_item` int(11) NOT NULL,
  `word_date` date NOT NULL,
  `image_addr` varchar(255) COLLATE utf8_bin NOT NULL,
  `memo` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `reg_user_id` int(11) NOT NULL,
  `is_old` int(11) NOT NULL,
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`record_id`,`farm_id`,`region_id`,`record_item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CULT_WORK_REORD`
--

LOCK TABLES `CULT_WORK_REORD` WRITE;
/*!40000 ALTER TABLE `CULT_WORK_REORD` DISABLE KEYS */;
/*!40000 ALTER TABLE `CULT_WORK_REORD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FARM_INFO`
--

DROP TABLE IF EXISTS `FARM_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FARM_INFO` (
  `farm_id` varchar(5) COLLATE utf8_bin NOT NULL,
  `province_id` int(10) NOT NULL,
  `local_id` int(10) NOT NULL,
  `local_agent_id` int(5) NOT NULL,
  `farm_addr` varchar(100) COLLATE utf8_bin NOT NULL,
  `farm_area` double(10,2) NOT NULL,
  `arable_area` double(10,2) NOT NULL,
  `area_unit` int(11) NOT NULL,
  `tgap_no` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `farm_user` varchar(50) COLLATE utf8_bin NOT NULL,
  `farm_name` varchar(45) COLLATE utf8_bin NOT NULL,
  `tel_no` varchar(15) COLLATE utf8_bin NOT NULL,
  `email` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `wechat_id` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `line_id` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `create_user` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `update_user` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `farm_introduction` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`farm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FARM_INFO`
--

LOCK TABLES `FARM_INFO` WRITE;
/*!40000 ALTER TABLE `FARM_INFO` DISABLE KEYS */;
/*!40000 ALTER TABLE `FARM_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FERT_CONS_LIST`
--

DROP TABLE IF EXISTS `FERT_CONS_LIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FERT_CONS_LIST` (
  `fert_cons_id` int(11) NOT NULL AUTO_INCREMENT,
  `fert_cons_code` int(3) NOT NULL,
  `fert_cons_name` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fert_cons_id`,`fert_cons_code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FERT_CONS_LIST`
--

LOCK TABLES `FERT_CONS_LIST` WRITE;
/*!40000 ALTER TABLE `FERT_CONS_LIST` DISABLE KEYS */;
INSERT INTO `FERT_CONS_LIST` VALUES (1,1,'基肥'),(4,4,'追肥');
/*!40000 ALTER TABLE `FERT_CONS_LIST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FERT_CONS_RECORD`
--

DROP TABLE IF EXISTS `FERT_CONS_RECORD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FERT_CONS_RECORD` (
  `fert_id` int(11) NOT NULL AUTO_INCREMENT,
  `farm_id` varchar(5) COLLATE utf8_bin NOT NULL,
  `region_id` int(10) NOT NULL,
  `gacp_no` varchar(20) COLLATE utf8_bin NOT NULL,
  `fert_code` int(2) NOT NULL,
  `fert_date` date NOT NULL,
  `application_qty` double(10,2) NOT NULL,
  `reg_user_id` int(11) NOT NULL,
  `memo` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `purchase_id` int(11) NOT NULL,
  `is_old` int(11) NOT NULL DEFAULT '0',
  `unit` int(11) NOT NULL,
  `standard_qty` double(12,5) NOT NULL,
  PRIMARY KEY (`fert_id`,`farm_id`,`region_id`,`fert_code`,`is_old`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FERT_CONS_RECORD`
--

LOCK TABLES `FERT_CONS_RECORD` WRITE;
/*!40000 ALTER TABLE `FERT_CONS_RECORD` DISABLE KEYS */;
/*!40000 ALTER TABLE `FERT_CONS_RECORD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FERT_INFO`
--

DROP TABLE IF EXISTS `FERT_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FERT_INFO` (
  `material_code` int(11) NOT NULL AUTO_INCREMENT,
  `material_no` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`material_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FERT_INFO`
--

LOCK TABLES `FERT_INFO` WRITE;
/*!40000 ALTER TABLE `FERT_INFO` DISABLE KEYS */;
/*!40000 ALTER TABLE `FERT_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FERT_PURCH_RECORD`
--

DROP TABLE IF EXISTS `FERT_PURCH_RECORD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FERT_PURCH_RECORD` (
  `record_id` int(10) NOT NULL AUTO_INCREMENT,
  `farm_id` varchar(5) COLLATE utf8_bin NOT NULL,
  `region_id` int(10) NOT NULL,
  `purch_date` date NOT NULL,
  `label` varchar(100) COLLATE utf8_bin NOT NULL,
  `price` double(10,2) NOT NULL,
  `qty` double(10,2) NOT NULL,
  `subtotal` double(12,2) DEFAULT NULL,
  `memo` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `sup_id` int(5) DEFAULT NULL,
  `is_old` int(11) NOT NULL DEFAULT '0',
  `up_file` varchar(200) COLLATE utf8_bin NOT NULL,
  `qty_unit` int(11) NOT NULL,
  `lot_number` varchar(30) COLLATE utf8_bin NOT NULL,
  `material_code` int(11) NOT NULL,
  PRIMARY KEY (`record_id`,`farm_id`,`region_id`,`is_old`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FERT_PURCH_RECORD`
--

LOCK TABLES `FERT_PURCH_RECORD` WRITE;
/*!40000 ALTER TABLE `FERT_PURCH_RECORD` DISABLE KEYS */;
/*!40000 ALTER TABLE `FERT_PURCH_RECORD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FIELD_INFO`
--

DROP TABLE IF EXISTS `FIELD_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FIELD_INFO` (
  `field_id` int(3) unsigned zerofill NOT NULL DEFAULT '000',
  `farm_id` varchar(5) COLLATE utf8_bin NOT NULL,
  `arable_area` double(10,2) NOT NULL,
  `field_user` varchar(100) COLLATE utf8_bin NOT NULL,
  `field_facility` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `Soil_type` int(3) NOT NULL,
  `fiele_method` int(2) NOT NULL,
  `create_date` date DEFAULT NULL,
  `create_user` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `update_user` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `standard_area` double(12,5) NOT NULL,
  `arable_area_unit` int(11) NOT NULL DEFAULT '3',
  `city_id` int(11) NOT NULL,
  `town_id` int(11) NOT NULL,
  `cadastral` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`field_id`,`farm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FIELD_INFO`
--

LOCK TABLES `FIELD_INFO` WRITE;
/*!40000 ALTER TABLE `FIELD_INFO` DISABLE KEYS */;
/*!40000 ALTER TABLE `FIELD_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FIELD_METHOD_LIST`
--

DROP TABLE IF EXISTS `FIELD_METHOD_LIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FIELD_METHOD_LIST` (
  `field_method` int(2) NOT NULL,
  `field_method_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`field_method`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FIELD_METHOD_LIST`
--

LOCK TABLES `FIELD_METHOD_LIST` WRITE;
/*!40000 ALTER TABLE `FIELD_METHOD_LIST` DISABLE KEYS */;
INSERT INTO `FIELD_METHOD_LIST` VALUES (1,'大田'),(2,'溫室');
/*!40000 ALTER TABLE `FIELD_METHOD_LIST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GACP_FORM_LOG`
--

DROP TABLE IF EXISTS `GACP_FORM_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GACP_FORM_LOG` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gacp_no` varchar(20) COLLATE utf8_bin NOT NULL,
  `farm_id` varchar(5) COLLATE utf8_bin NOT NULL,
  `field_id` int(11) NOT NULL,
  `log_table` varchar(50) COLLATE utf8_bin NOT NULL,
  `create_date` date NOT NULL,
  `create_user` varchar(30) COLLATE utf8_bin NOT NULL,
  `update_date` date DEFAULT NULL,
  `update_user` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `action` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GACP_FORM_LOG`
--

LOCK TABLES `GACP_FORM_LOG` WRITE;
/*!40000 ALTER TABLE `GACP_FORM_LOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `GACP_FORM_LOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GACP_LIST_LOG`
--

DROP TABLE IF EXISTS `GACP_LIST_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GACP_LIST_LOG` (
  `gacp_no` varchar(20) COLLATE utf8_bin NOT NULL,
  `farm_id` varchar(5) COLLATE utf8_bin NOT NULL,
  `region_id` int(10) NOT NULL,
  `log_table` varchar(50) COLLATE utf8_bin NOT NULL,
  `create_date` date DEFAULT NULL,
  `create_user` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `update_user` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `status` int(11) NOT NULL,
  `image_addr` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `purchase_link` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `purchase_link_name` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `is_organic` int(11) NOT NULL,
  `organic_affidavit` int(11) NOT NULL,
  `planning_planting_date` date NOT NULL,
  `ipcam_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `cwb_no` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`farm_id`,`region_id`,`gacp_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GACP_LIST_LOG`
--

LOCK TABLES `GACP_LIST_LOG` WRITE;
/*!40000 ALTER TABLE `GACP_LIST_LOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `GACP_LIST_LOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GRADING_CODE_LIST`
--

DROP TABLE IF EXISTS `GRADING_CODE_LIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GRADING_CODE_LIST` (
  `grading_code` int(2) NOT NULL,
  `grading_code_name` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`grading_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GRADING_CODE_LIST`
--

LOCK TABLES `GRADING_CODE_LIST` WRITE;
/*!40000 ALTER TABLE `GRADING_CODE_LIST` DISABLE KEYS */;
INSERT INTO `GRADING_CODE_LIST` VALUES (1,'A級'),(2,'B級'),(3,'C級'),(4,'特級'),(5,'優級'),(6,'良級'),(7,'無分級'),(98,'無分級'),(99,'總產出(加工處理後總重量)');
/*!40000 ALTER TABLE `GRADING_CODE_LIST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HARVEST_RECORD`
--

DROP TABLE IF EXISTS `HARVEST_RECORD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HARVEST_RECORD` (
  `record_id` int(2) NOT NULL AUTO_INCREMENT,
  `farm_id` varchar(5) COLLATE utf8_bin NOT NULL,
  `region_id` int(10) NOT NULL,
  `gacp_no` varchar(20) COLLATE utf8_bin NOT NULL,
  `word_date` date NOT NULL,
  `harvest_qty` double(10,2) DEFAULT NULL,
  `word_memo` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `memo` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `reg_user_id` int(11) NOT NULL,
  `is_old` int(11) NOT NULL DEFAULT '0',
  `unit` int(11) NOT NULL,
  `standard_qty` double(12,5) NOT NULL,
  `grading_code` int(11) NOT NULL,
  `storage_code` int(11) NOT NULL,
  PRIMARY KEY (`record_id`,`farm_id`,`region_id`,`is_old`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HARVEST_RECORD`
--

LOCK TABLES `HARVEST_RECORD` WRITE;
/*!40000 ALTER TABLE `HARVEST_RECORD` DISABLE KEYS */;
/*!40000 ALTER TABLE `HARVEST_RECORD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ITEMS`
--

DROP TABLE IF EXISTS `ITEMS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ITEMS` (
  `item_no` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(45) COLLATE utf8_bin NOT NULL,
  `type_code` int(2) NOT NULL,
  `memo` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `organic_material_no` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pest_reg_no` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `fert_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `reg_file_no` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `row_material` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ingredients` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `cultivar_id` int(11) DEFAULT NULL,
  `update_user` varchar(45) COLLATE utf8_bin NOT NULL,
  `label` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `sup_id` int(11) NOT NULL,
  PRIMARY KEY (`item_no`),
  UNIQUE KEY `item_name_UNIQUE` (`item_name`),
  UNIQUE KEY `organic_material_no_UNIQUE` (`organic_material_no`),
  UNIQUE KEY `pest_reg_no_UNIQUE` (`pest_reg_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2320 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ITEMS`
--

LOCK TABLES `ITEMS` WRITE;
/*!40000 ALTER TABLE `ITEMS` DISABLE KEYS */;
INSERT INTO `ITEMS` VALUES (1,'DicaLite太可愛(矽藻土)',3,'','有機資審字第107036號','植保進字第00021號',NULL,NULL,NULL,'矽藻土',NULL,'admin','誼華實業有限公司',84),(2,'HB-101天然植物活力液',4,'','有機資審字第101009號',NULL,NULL,NULL,'杉、檜、松、車前草等之萃取液',NULL,NULL,'admin','亞太清鈴股份有限公司',87),(3,'ㄚ勇伯(阿巴汀)',3,'',NULL,'農藥製字第06092號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%)',NULL,'admin','華夏科學農化股份有限公司',106),(4,'ㄟ果來(賽速安)',3,'',NULL,'農藥製字第05895號',NULL,NULL,NULL,'3-(2-chloro-1,3-thiazol-5-ylmethyl)-5-methyl-1,3,5-oxadiazinan-4-ylidene(nitro)amine 25.000 (%) ',NULL,'admin','洽益化學股份有限公司',108),(5,'一乾二淨(派滅淨)',3,'',NULL,'農藥製字第06515號',NULL,NULL,NULL,'(E)-4,5-dihydro-6-methyl-4-(3-pyridylmethyleneamino)-1,2,4- triazin-3(2H)-one 25.000 (%)   ',NULL,'admin','嘉農企業股份有限公司',117),(6,'一代宗師(亞托待克利)',3,'',NULL,'農藥製字第06443號',NULL,NULL,NULL,'(1) methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate...200 g/L (2) cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1-ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether...125 g/L 325 G/L (32.5% W/V)  ',NULL,'admin','光華化學股份有限公司',77),(7,'一多好(阿巴汀)',3,'',NULL,'農藥進字第02610號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%)',NULL,'admin','惠光股份有限公司',121),(8,'一定勇(阿巴汀)',3,'',NULL,'農藥製字第05052號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%)                             ',NULL,'admin','大成化學工業股份有限公司',127),(9,'一定好(益達胺)',3,'',NULL,'農藥製字第05520號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%)',NULL,'admin','正農化學股份有限公司',130),(10,'一定安(益達胺)',3,'',NULL,'農藥進字第02719號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 18.200 (%) ',NULL,'admin','海博生技股份有限公司',146),(11,'一帖靈(益達胺)',3,'',NULL,'農藥製字第05812號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 18.200 (%) ',NULL,'admin','利台化學工業股份有限公司',116),(12,'一度勇(阿巴汀)',3,'',NULL,'農藥進字第02718號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%)',NULL,'admin','松樹國際有限公司',137),(13,'一掃淨(賽滅淨)',3,'',NULL,'農藥製字第06237號',NULL,NULL,NULL,'N-cyclopropyl-1,3,5-triazine-2,4,6-triamine 8.900  (%) ',NULL,'admin','臺聯實業股份有限公司',107),(14,'一條龍(陶斯寧)',3,'',NULL,'農藥製字第03222號',NULL,NULL,NULL,'(1) O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate…22.5%  (2)(RS)-α-cyano-3-phenoxybenzyl (1RS)-cis-trans-3-(2,2-dichlorovinyl)-2,2-dimethylcyclopropanecarboxylate…2.5%',NULL,'admin','正農化學股份有限公司',130),(15,'一流爺(益達胺)',3,'',NULL,'農藥進字第02735號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%)',NULL,'admin','聯合農化股份有限公司',150),(16,'一直勇(阿巴汀)',3,'',NULL,'農藥製字第06440號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%)',NULL,'admin','功力化學工業股份有限公司',187),(17,'一直旺(腈硫醌銅)',3,'',NULL,'農藥進字第02098號',NULL,NULL,NULL,'(1) 5,10-dihydro-5,10-dioxonaphtho[2,3-b]-1,4-dithiine-2,3-dicarbonitrile...13% (2) dicopper chloride trihydroxide...42% (CU25%)',NULL,'admin','嘉濱貿易有限公司',111),(18,'一直讚(派滅淨)',3,'',NULL,'農藥製字第06483號',NULL,NULL,NULL,'(E)-4,5-dihydro-6-methyl-4-(3-pyridylmethyleneamino)-1,2,4- triazin-3(2H)-one 25.000 (%)',NULL,'admin','國豐化學工業股份有限公司',112),(19,'一路發(達滅芬)',3,'',NULL,'農藥製字第05719號',NULL,NULL,NULL,'(E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine  50.000 (%)',NULL,'admin','安旺特股份有限公司',120),(20,'一陽指 50% (馬拉松)',3,'',NULL,'農藥製字第06435號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 95.000 (%)  ',NULL,'admin','立農化學股份有限公司',143),(21,'一零一(派滅淨)',3,'',NULL,'農藥製字第06474號',NULL,NULL,NULL,'(E)-4,5-dihydro-6-methyl-4-(3-pyridylmethyleneamino)-1,2,4- triazin-3(2H)-one 25.000 (%) ',NULL,'admin','正農化學股份有限公司',130),(22,'一頂勇(阿巴汀)',3,'',NULL,'農藥進字第02613號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%)',NULL,'admin','嘉農企業股份有限公司',117),(23,'一點紅(陶斯寧)',3,'',NULL,'農藥製字第06313號',NULL,NULL,NULL,'(1) O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate…45.45% (2) (RS)-α-cyano-3-phenoxybenzyl (1RS)-cis-trans-3-(2,2-dichlorovinyl)-2,2-dimethylcyclopropanecarboxylate…4.55%',NULL,'admin','好速化學股份有限公司',118),(24,'一點露(三元硫酸銅)',3,'',NULL,'農藥製字第06587號',NULL,NULL,NULL,'cupric sulfate-tricupric hydroxide 27.120 (%)    ',NULL,'admin','洽益化學股份有限公司',108),(25,'三效能(阿巴汀)',3,'',NULL,'農藥製字第06137號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%)',NULL,'admin','台灣正豐植保股份有限公司',128),(26,'三能剋(賽滅淨)',3,'',NULL,'農藥製字第05014號',NULL,NULL,NULL,'N-cyclopropyl-1,3,5-triazine-2,4,6-triamine 75.000 (%)',NULL,'admin','瑞芳植物保護股份有限公司',115),(27,'上介棒(快得寧)',3,'',NULL,'農藥製字第04697號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 33.500 (%)',NULL,'admin','國豐化學工業股份有限公司',112),(28,'上好(賽洛寧)',3,'',NULL,'農藥製字第03756號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.500  (%)  ',NULL,'admin','嘉泰企業股份有限公司',102),(29,'上帝功(賽洛寧)',3,'',NULL,'農藥製字第05320號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.800  (%) ',NULL,'admin','安旺特股份有限公司',120),(30,'上旺喜(第滅寧)',3,'',NULL,'農藥製字第06404號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%) ',NULL,'admin','聯利農業科技股份有限公司',103),(31,'上蓋靈(四氯異苯腈)',3,'',NULL,'農藥製字第02346號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  75.000 (%)',NULL,'admin','東和化學企業股份有限公司',109),(32,'不倒翁(本達樂)',3,'',NULL,'農藥製字第05188號',NULL,NULL,NULL,' methyl N-phenylacetyl-N-2,6-xylyl-DL-alaninate  5.000 (%)',NULL,'admin','富農化學工業股份有限公司',132),(33,'不忙露(鋅錳克絕)',3,'',NULL,'農藥進字第03165號',NULL,NULL,NULL,'(1) 1-(2-cyano-2-methoxyiminoacetyl)-3-ethylurea…8% (2) manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt…64%',NULL,'admin','日農科技股份有限公司',105),(34,'不怕蠅(賽滅淨)',3,'',NULL,'農藥進字第03409號',NULL,NULL,NULL,'N-cyclopropyl-1,3,5-triazine-2,4,6-triamine 75.000 (%)',NULL,'admin','日農科技股份有限公司',105),(35,'世介勇(待克利)',3,'',NULL,'農藥製字第04304號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%) ',NULL,'admin','興農股份有限公司',85),(36,'世大冬(加保扶)',3,'',NULL,'農藥製字第03949號',NULL,NULL,NULL,'2,3-dihydro-2,2-dimethylbenzofuran-7-yl methylcarbamate  3.000 (%)',NULL,'admin','世大農化工廠股份有限公司	',114),(37,'世大達菌能(四氯異苯腈)',3,'',NULL,'農藥製字第02349號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  75.000 (%)',NULL,'admin','世大農化工廠股份有限公司	',114),(38,'世界棒(快得寧)',3,'',NULL,'農藥製字第00917號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 33.500 (%) ',NULL,'admin','臺益工業股份有限公司',39),(39,'世界稱(亞托敏)',3,'',NULL,'農藥進字第02923號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','雋農實業股份有限公司',136),(40,'中華蛋白天然茁壯劑',2,'液態有機質肥料','有機資審字第105016號',NULL,'液態有機質肥料(5-15)','肥製(質)字第0823003號','大豆粕、糖蜜','全氮2.0%全磷酐0.5%全氧化鉀1.0%有機質20.0%',NULL,'admin','中華蛋白股份有限公司',52),(41,'丹克利(得克利)',3,'',NULL,'農藥進字第02819號',NULL,NULL,NULL,'(RS)-1-p-chlorophenyl-4,4-dimethyl-3-(1H-1,2,4-triazol-1- ylmethyl)pentan-3-ol 25.900 (%)',NULL,'admin','台灣富美實有限公司',140),(42,'久寶寧(撲滅寧)',3,'',NULL,'農藥進字第03170號',NULL,NULL,NULL,' N-(3,5-dichlorophenyl)-1,2-dimethylcyclopropane-1,2-dicarboximide  50.000 (%)',NULL,'admin','大成化學工業股份有限公司',127),(43,'乎你旺(賽速安)',3,'',NULL,'農藥製字第06402號',NULL,NULL,NULL,'3-(2-chloro-1,3-thiazol-5-ylmethyl)-5-methyl-1,3,5-oxadiazinan-4-ylidene(nitro)amine 25.000 (%)',NULL,'admin','台農三和化工股份有限公司',119),(44,'乎依發(達滅芬)',3,'',NULL,'農藥進字第02884號',NULL,NULL,NULL,'(E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine  50.000 (%)',NULL,'admin','萬得發有限公司',125),(45,'乎力讚(亞托待克利)',3,'',NULL,'農藥製字第06128號',NULL,NULL,NULL,'(1) methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate...200 g/L (2) cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1-ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether...125 g/L 325 G/L (32.5% W/V)',NULL,'admin','惠光股份有限公司',121),(46,'乎粒勇(三氟得克利)',3,'',NULL,'農藥進字第02773號',NULL,NULL,NULL,'(1) methyl (E)-methoxyimino-{(E)-α-[1-(α,α,α-trifluoro-m-tolyl)ethylideneaminooxy]-o-tolyl}acetate...9.1% (2) (RS)-1-p-chlorophenyl-4,4-dimethyl-3-(1H-1,2,4-triazol-1- ylmethyl)pentan-3-ol...18.2%',NULL,'admin','台灣拜耳股份有限公司',101),(47,'五一五一(亞托敏)',3,'',NULL,'農藥進字第02869號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','萬得發有限公司',125),(48,'五告讚(本達樂)',3,'',NULL,'農藥進字第03327號',NULL,NULL,NULL,' methyl N-{2-[1-(4-chlorophenyl)pyrazol-3-yloxymethyl]phenyl}(N-methoxy)carbamate  23.600 (%)',NULL,'admin','嘉濱貿易有限公司',111),(49,'五星上將(百克敏)',3,'',NULL,'農藥進字第03257號',NULL,NULL,NULL,'methyl N-{2-[1-(4-chlorophenyl)pyrazol-3-yloxymethyl]phenyl}(N-methoxy)carbamate  23.600 (%)',NULL,'admin','安旺特股份有限公司',120),(50,'五雷(益達胺)',3,'',NULL,'農藥製字第06063號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 18.200 (%) ',NULL,'admin','瑞芳植物保護股份有限公司',115),(51,'亞托敏(農會農化廠)',3,'',NULL,'農藥製字第06265號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','中華民國農會附設各級農會農化廠',131),(52,'亞滅培 (農會農化廠)',3,'',NULL,'農藥製字第05841號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%)',NULL,'admin','中華民國農會附設各級農會農化廠',131),(53,'亞滅培-讚(亞滅培)',3,'',NULL,'農藥進字第02899號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%)',NULL,'admin','萬得發有限公司',125),(54,'享好(得芬諾)',3,'',NULL,'農藥進字第02750號',NULL,NULL,NULL,' N-tert-butyl-N’-(4-ethylbenzoyl)-3,5-dimethylbenzohydrazide  19.700 (%)',NULL,'admin','優必樂有限公司',151),(55,'享發(達滅芬)',3,'',NULL,'農藥進字第02512號',NULL,NULL,NULL,'(E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine  50.000 (%)',NULL,'admin','民信有限公司',173),(56,'介不同(祿芬隆)',3,'',NULL,'農藥進字第03126號',NULL,NULL,NULL,'(RS)-1-[2,5-dichloro-4-(1,1,2,3,3,3-hexafluoropropoxy)- phenyl]-3-(2,6-difluorobenzoyl)-urea  4.400 (%)',NULL,'admin','嘉濱貿易有限公司',111),(57,'介合用(菲克利)',3,'',NULL,'農藥進字第02407號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 5.000  (%)   ',NULL,'admin','萬得發有限公司',125),(58,'介好敵(百利普芬)',3,'',NULL,'農藥製字第05931號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 11.000 (%)   ',NULL,'admin','好速化學股份有限公司',118),(59,'介好殺(納乃得)',3,'',NULL,'農藥進字第01816號',NULL,NULL,NULL,' S-methyl N-(methylcarbamoyloxy)thioacetimidate  40.000 (%)',NULL,'admin','安農股份有限公司',156),(60,'介好用(菲克利)',3,'',NULL,'農藥製字第05360號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 5.000  (%)  ',NULL,'admin','洽益化學股份有限公司',108),(61,'介好除-精(百利普芬)',3,'',NULL,'農藥製字第06093號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 11.000 (%)',NULL,'admin','嘉農企業股份有限公司',117),(62,'介新(波爾多)',3,'',NULL,'農藥進字第02527號',NULL,NULL,NULL,'BORDEAUX MIXTURE 72.000 (%)',NULL,'admin','高事達農化有限公司',155),(63,'介旺(達滅克敏)',3,'',NULL,'農藥進字第03317號',NULL,NULL,NULL,'(1) methyl N-{2-[1-(4-chlorophenyl)-1H-pyrazol-3-yloxymethyl]phenyl}(N-methoxy)carbamate...6.7% (2) (E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine...12.0%',NULL,'admin','嘉濱貿易有限公司',111),(64,'介時走(百利普芬)',3,'',NULL,'農藥製字第06148號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 11.000 (%) ',NULL,'admin','台農三和化工股份有限公司',119),(65,'介有效(百利普芬)',3,'',NULL,'農藥進字第02886號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 11.000 (%) ',NULL,'admin','朝暘生化開發有限公司',171),(66,'介殺(百利普芬)',3,'',NULL,'農藥進字第03414號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 11.000 (%)',NULL,'admin','嘉濱貿易有限公司',111),(67,'介殼寧(大滅松)',3,'',NULL,'農藥製字第00680號',NULL,NULL,NULL,' O, O-dimethyl-S-methylcarbamoylmethyl phosphorodithioate  44.000 (%)',NULL,'admin','安旺特股份有限公司',120),(68,'介殼淨(百利普芬)',3,'',NULL,'農藥製字第05934號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 11.000 (%) ',NULL,'admin','利台化學工業股份有限公司',116),(69,'介猛(波爾多)',3,'',NULL,'農藥進字第02767號',NULL,NULL,NULL,'BORDEAUX MIXTURE 72.000 (%)  ',NULL,'admin','高事達農化有限公司',155),(70,'介百力(百利普芬)',3,'',NULL,'農藥製字第06013號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 11.000 (%) ',NULL,'admin','嘉泰企業股份有限公司',102),(71,'介穩(派滅淨)',3,'',NULL,'農藥進字第03318號',NULL,NULL,NULL,'(E)-4,5-dihydro-6-methyl-4-(3-pyridylmethyleneamino)-1,2,4- triazin-3(2H)-one 50.000 (%)',NULL,'admin','嘉濱貿易有限公司',111),(72,'介親切(陶斯寧)',3,'',NULL,'農藥製字第03913號',NULL,NULL,NULL,'(1) O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate…22.5%  (2)(RS)-α-cyano-3-phenoxybenzyl (1RS)-cis-trans-3-(2,2-dichlorovinyl)-2,2-dimethylcyclopropanecarboxylate…2.5%',NULL,'admin','台農三和化工股份有限公司',119),(73,'介順(撲克拉錳)',3,'',NULL,'農藥進字第01967號',NULL,NULL,NULL,'N-propyl-N-[2-(2,4,6-trichlorophenoxy)ethyl]imidazole-1-carboxamide complex with manganese(II) chloride 50.000 (%) ',NULL,'admin','臺聯實業股份有限公司',107),(74,'仙克寧(四氯異苯腈)',3,'',NULL,'農藥製字第01993號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  75.000 (%)',NULL,'admin','洽益化學股份有限公司',108),(75,'代喜多(第滅寧)',3,'',NULL,'農藥製字第05032號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.400  (%)    ',NULL,'admin','瑞芳植物保護股份有限公司',115),(76,'伊頂安(益達胺)',3,'',NULL,'農藥製字第05747號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%) ',NULL,'admin','惠大實業股份有限公司',157),(77,'伯樂菌(甲基鋅乃浦)',3,'',NULL,'農藥製字第06425號',NULL,NULL,NULL,' polymeric zinc 1,2-propylenebis(dithiocarbamate)  70.000 (%)',NULL,'admin','洽益化學股份有限公司',108),(78,'佈飛松 (農會農化廠)',3,'',NULL,'農藥製字第04653號',NULL,NULL,NULL,'O-4-bromo-2-chlorophenyl O-ethyl S-propyl phosphorothioate 43.000 (%)  ',NULL,'admin','中華民國農會附設各級農會農化廠',131),(79,'住友福祿寶(蘇力菌)',3,'',NULL,'農藥進字第02392號',NULL,NULL,NULL,' BACILLUS THURINGIENSIS, SUBSPECIES AIZAWAI, STRAIN NB200, FERMENTATION SOLIDS AND SOLUBLES  54.000 (%)',NULL,'admin','台灣住友化學股份有限公司',160),(80,'住友速滅寧(撲滅寧)',3,'',NULL,'農藥進字第01258號',NULL,NULL,NULL,' N-(3,5-dichlorophenyl)-1,2-dimethylcyclopropane-1,2-dicarboximide  50.000 (%)',NULL,'admin','台灣住友化學股份有限公司',160),(81,'作夥來(陶斯松)',3,'',NULL,'農藥製字第05700號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 44.900 (%)',NULL,'admin','立農化學股份有限公司',143),(82,'你尚稱(賽滅淨)',3,'',NULL,'農藥進字第03059號',NULL,NULL,NULL,'N-cyclopropyl-1,3,5-triazine-2,4,6-triamine 75.000 (%)',NULL,'admin','嘉濱貿易有限公司',111),(83,'佰儷晶-開心肥',2,'','有機資審字第106016號',NULL,'貝殼粉肥料(4-13)','肥進(微)字第0928001號','方解石礦(天然碳酸鈣)','鹼度(CaO計):36%',NULL,'admin','優健萌葳生物醫藥有限公司',57),(84,'佳事通(嘉賜銅)',3,'',NULL,'農藥製字第06379號',NULL,NULL,NULL,'(1) [5-amino-2-methyl-6-(2,3,4,5,6,-pentahydroxycyclohexyloxy) tetrahydropyran-3-yl] amino-α-iminoacetic acid hydrochloride hydrate...5.7% ( Kasugamycin...5% ) (2) copper oxychloride (CU 45%)...75.6%',NULL,'admin','嘉泰企業股份有限公司',102),(85,'佳倍寧(加保利)',3,'',NULL,'農藥進字第01704號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 85.000 (%)',NULL,'admin','德方有限公司',175),(86,'佳喜(第滅寧)',3,'',NULL,'農藥製字第01533號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%)',NULL,'admin','華夏科學農化股份有限公司',106),(87,'佳喜精(第滅寧)',3,'',NULL,'農藥製字第06069號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.400  (%) ',NULL,'admin','華夏科學農化股份有限公司',106),(88,'佳寶利(加保利)',3,'',NULL,'農藥進字第01691號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 85.000 (%) ',NULL,'admin','合林企業有限公司',166),(89,'佳寶力(加保利)',3,'',NULL,'農藥製字第04994號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 85.000 (%)',NULL,'admin','台灣日產化工股份有限公司',104),(90,'佳絲本(陶斯松)',3,'',NULL,'農藥製字第01265號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 10.000 (%) ',NULL,'admin','惠光股份有限公司',121),(91,'來仙(錳乃浦)',3,'',NULL,'農藥進字第01831號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','雅飛有限公司',126),(92,'來就福水(因滅汀)',3,'',NULL,'農藥製字第05736號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','臺益工業股份有限公司',39),(93,'來靈(硫敵克)',3,'',NULL,'農藥進字第01501號',NULL,NULL,NULL,'3,7,9,13-tetramethyl-5,11-dioxa-2,8,14-trithia-4,7,9,12-tetra-azapentadeca-3,12-diene-6,10-dione 75.000 (%)',NULL,'admin','台灣拜耳股份有限公司',101),(94,'依護果(依普同)',3,'',NULL,'農藥進字第02427號',NULL,NULL,NULL,'3-(3,5-dichlorophenyl)-N-isopropyl-2,4-dioxoimidazolidine-1-carboxamide  50.000 (%)',NULL,'admin','雅飛有限公司',126),(95,'保你根(毆殺滅)',3,'',NULL,'農藥製字第04339號',NULL,NULL,NULL,' N,N-dimethyl-2-methylcarbamoyloxyimino-2-(methylthio)acetamide  5.000 (%)',NULL,'admin','興農股份有限公司',85),(96,'保健勢(普拔克)',3,'',NULL,'農藥進字第03181號',NULL,NULL,NULL,' propyl 3-(dimethylamino)propylcarbamate hydrochloride  66.500 (%)',NULL,'admin','萬得發有限公司',125),(97,'保允得(福瑞松)',3,'',NULL,'農藥製字第02904號',NULL,NULL,NULL,' O,O-diethyl S-ethylthiomethyl phosphorodithioate  10.000 (%)',NULL,'admin','龍燈生物科技股份有限公司',76),(98,'保全青(快得保淨)',3,'',NULL,'農藥製字第03936號',NULL,NULL,NULL,'(1) dimethyl 4,4’-(o-phenylene)bis(3-thioallophanate)...35%(2) bis(quinolin-8-olato-O,N)copper...40%',NULL,'admin','世大農化工廠股份有限公司	',114),(99,'保利春(甲基多保淨)',3,'',NULL,'農藥製字第03419號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 70.000 (%) ',NULL,'admin','大勝化學工業股份有限公司',110),(100,'保好果(白克列)',3,'',NULL,'農藥進字第02777號',NULL,NULL,NULL,'2-chloro-N-(4’-chlorobiphenyl-2-yl)nicotinamide 42.400 (%)',NULL,'admin','台灣巴斯夫股份有限公司',123),(101,'保如意(克福隆)',3,'',NULL,'農藥進字第02065號',NULL,NULL,NULL,'1-[3, 5-dichloro-4-(3-chloro-5-trifluoromethyl-2-pyridyloxy)phenyl]-3-(2,6-difluorobenzoyl)urea 5.000  (%) ',NULL,'admin','啟承有限公司',186),(102,'保庇(待克利)',3,'',NULL,'農藥進字第03247號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%)',NULL,'admin','安旺特股份有限公司',120),(103,'保果旺(氫氧化銅)',3,'',NULL,'農藥進字第01204號',NULL,NULL,NULL,' CUPRIC HYDROXIDE  77.000 (%)',NULL,'admin','嘉濱貿易有限公司',111),(104,'保果精(甲基多保淨)',3,'',NULL,'農藥進字第03381號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 40.000 (%)  ',NULL,'admin','威玖生技有限公司',142),(105,'保樹在(礦物油)',3,'',NULL,'農藥製字第03682號',NULL,NULL,NULL,'ALIPHATIC HYDROCARBONS 95.000 (%)',NULL,'admin','日農科技股份有限公司',105),(106,'保毒本(陶斯松)',3,'',NULL,'農藥製字第04142號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%) ',NULL,'admin','眾益農業生技股份有限公司',124),(107,'保田園(福瑞松)',3,'',NULL,'農藥製字第02913號',NULL,NULL,NULL,' O,O-diethyl S-ethylthiomethyl phosphorodithioate  10.000 (%)',NULL,'admin','正農化學股份有限公司',130),(108,'保穀(馬拉松)',3,'',NULL,'農藥製字第04378號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 25.000 (%)  ',NULL,'admin','富農化學工業股份有限公司',132),(109,'保粒明(保粒黴素 甲)',3,'',NULL,'農藥進字第02136號',NULL,NULL,NULL,' 5-(2-amino-5-O-carbamoyl-2-deoxy-L-xylonamido)-1,5-dideoxy-1-(1,2,3,4-tetrahydro-5-hydroxymethyl-2,4-dioxopyrimidin-1-yl)-β-D-allofuranuronic acid  50%(POLYOXIN-B 500,000AmBu/g)',NULL,'admin','興農股份有限公司',85),(110,'保粒穗(貝芬同)',3,'',NULL,'農藥製字第05596號',NULL,NULL,NULL,'(1) methyl benzimidazol-2-ylcarbamate...30% (2) 3-(3,5-dichlorophenyl)-N-isopropyl-2,4-dioxoimidazolidine-1-carboxamide...25%',NULL,'admin','興農股份有限公司',85),(111,'保粒讚(保粒黴素 甲)',3,'',NULL,'農藥製字第04522號',NULL,NULL,NULL,' 5-(2-amino-5-O-carbamoyl-2-deoxy-L-xylonamido)-1,5-dideoxy-1-(1,2,3,4-tetrahydro-5-hydroxymethyl-2,4-dioxopyrimidin-1-yl)-β-D-allofuranuronic acid  50%(POLYOXIN-B 500,000AmBu/g)',NULL,'admin','興農股份有限公司',85),(112,'保護寧(甲基多保淨)',3,'',NULL,'農藥進字第01953號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 70.000 (%)',NULL,'admin','東鋒股份有限公司',154),(113,'保農安四十五(錳乃浦)',3,'',NULL,'農藥製字第02042號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','國豐化學工業股份有限公司',112),(114,'保青(第滅寧)',3,'',NULL,'農藥製字第03956號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%) ',NULL,'admin','好速化學股份有限公司',118),(115,'信心(邁克尼)',3,'',NULL,'農藥製字第05271號',NULL,NULL,NULL,'2-p-chlorophenyl-2-(1H-1,2,4-triazol-1-ylmethyl)hexanenitrile 40.000 (%) ',NULL,'admin','惠光股份有限公司',121),(116,'信生(邁克尼)',3,'',NULL,'農藥進字第01075號',NULL,NULL,NULL,'2-p-chlorophenyl-2-(1H-1,2,4-triazol-1-ylmethyl)hexanenitrile 40.000 (%) ',NULL,'admin','台灣道禮股份有限公司',174),(117,'俺收多(甲基鋅乃浦)',3,'',NULL,'農藥製字第04762號',NULL,NULL,NULL,' polymeric zinc 1,2-propylenebis(dithiocarbamate)  70.000 (%)',NULL,'admin','嘉農企業股份有限公司',117),(118,'個卡好(加保利)',3,'',NULL,'農藥製字第04511號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 40.000 (%)',NULL,'admin','國豐化學工業股份有限公司',112),(119,'倍奇(氫氧化銅)',3,'',NULL,'農藥進字第02810號',NULL,NULL,NULL,' CUPRIC HYDROXIDE  61.400 (%)',NULL,'admin','台灣龍燈股份有限公司',152),(120,'倍易淨(菲克利)',3,'',NULL,'農藥進字第02181號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 10.000 (%)',NULL,'admin','易利特開發有限公司',138),(121,'倍福農(克熱淨)',3,'',NULL,'農藥製字第02649號',NULL,NULL,NULL,'1,1’-iminodi(octamethylene)diguanidinium triacetate 25.000 (%)  ',NULL,'admin','億豐農化廠股份有限公司',122),(122,'億力松(乃力松)',3,'',NULL,'農藥製字第02788號',NULL,NULL,NULL,'1,2-DIBROMO-2,2-DICHLOROETHYL DIMETHYL PHOSPHATE  58.000 (%)',NULL,'admin','台灣正豐植保股份有限公司',128),(123,'億喜(第滅寧)',3,'',NULL,'農藥製字第03006號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%)',NULL,'admin','利台化學工業股份有限公司',116),(124,'億嘉靈(益滅松)',3,'',NULL,'農藥製字第02446號',NULL,NULL,NULL,' O,O-dimethyl S-phthalimidomethyl phosphorodithioate  50.000 (%)',NULL,'admin','利台化學工業股份有限公司',116),(125,'億治蟲(因滅汀)',3,'',NULL,'農藥製字第05460號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','億豐農化廠股份有限公司',122),(126,'億級棒 (快得寧) (富農化學)',3,'',NULL,'農藥製字第00459號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 33.500 (%)',NULL,'admin','富農化學工業股份有限公司',132),(127,'億級棒(快得寧) (世大農化)',3,'',NULL,'農藥製字第04290號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 33.500 (%)  ',NULL,'admin','世大農化工廠股份有限公司	',114),(128,'億級粉(快得寧)',3,'',NULL,'農藥進字第03109號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 80.000 (%)',NULL,'admin','萬得發有限公司',125),(129,'億綠通(三泰芬)',3,'',NULL,'農藥製字第05746號',NULL,NULL,NULL,'1-(4-chlorophenoxy)-3,3-dimethyl-1-(1H-1,2,4-triazol-1-yl)butan-2-one 25.000 (%)',NULL,'admin','安旺特股份有限公司',120),(130,'億萬(陶斯松)',3,'',NULL,'農藥製字第02725號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 2.500  (%)',NULL,'admin','台灣正豐植保股份有限公司',128),(131,'億萬生–２２(錳乃浦)',3,'',NULL,'農藥製字第01758號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric)  80.000 (%)',NULL,'admin','台灣正豐植保股份有限公司',128),(132,'優億利 25% (布芬大利松)',3,'',NULL,'農藥製字第03679號',NULL,NULL,NULL,'(1)  (Z)-2-tert-butylimino-3-isopropyl-5-phenyl-1, 3, 5-thiadiazinan-4-one...5%   (2)O,O-diethyl O-2-isopropyl-6-methylpyrimidin-4-yl phosphorothioate ...20%',NULL,'admin','中華民國農會附設各級農會農化廠',131),(133,'優億利 5% (布芬大利松)',3,'',NULL,'農藥製字第04072號',NULL,NULL,NULL,'(1) (Z)-2-tert-butylimino-3-isopropyl-5-phenyl-1, 3, 5-thiadiazinan-4-one...2%              (2)O,O-diethyl O-2-isopropyl-6-methylpyrimidin-4-yl phosphorothioate ...3%',NULL,'admin','中華民國農會附設各級農會農化廠',131),(134,'優先(待克利)',3,'',NULL,'農藥製字第05646號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%) ',NULL,'admin','安旺特股份有限公司',120),(135,'優克菌(氫氧化銅)',3,'',NULL,'農藥製字第04086號',NULL,NULL,NULL,' CUPRIC HYDROXIDE  77.000 (%)',NULL,'admin','瑞芳植物保護股份有限公司',115),(136,'優果讚(亞托敏)',3,'',NULL,'農藥進字第03271號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  50.000 (%)',NULL,'admin','美商雅柏生活科技有限公司臺灣分公司',148),(137,'優洗洗(甲基鋅乃浦)',3,'',NULL,'農藥進字第03373號',NULL,NULL,NULL,' polymeric zinc 1,2-propylenebis(dithiocarbamate)  70.000 (%)',NULL,'admin','國寶國際有限公司',153),(138,'優生45(錳乃浦)',3,'',NULL,'農藥進字第02690號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','優必樂有限公司',151),(139,'允好(鋅錳克絕)',3,'',NULL,'農藥進字第02960號',NULL,NULL,NULL,'(1) 1-(2-cyano-2-methoxyiminoacetyl)-3-ethylurea…8% (2) manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt…64%',NULL,'admin','安農股份有限公司',156),(140,'允妥當(克福隆)',3,'',NULL,'農藥進字第01850號',NULL,NULL,NULL,'1-[3, 5-dichloro-4-(3-chloro-5-trifluoromethyl-2-pyridyloxy)phenyl]-3-(2,6-difluorobenzoyl)urea 5.000  (%) ',NULL,'admin','東鋒股份有限公司',154),(141,'允強(可尼丁)',3,'',NULL,'農藥製字第06552號',NULL,NULL,NULL,'(E)-1-(2-chloro-1,3-thiazol-5-ylmethyl)-3-methyl-2- nitroguanidine 16.000 (%)',NULL,'admin','聯利農業科技股份有限公司',103),(142,'允擋好(賓得克利)',3,'',NULL,'農藥進字第02111號',NULL,NULL,NULL,'(1) 1-(4-chlorobenzyl)-1-cyclopentyl-3-phenylurea...15% (2) (RS)-1-p-chlorophenyl-4,4-dimethyl-3-(1H-1,2,4-triazol-1- ylmethyl)pentan-3-ol...10%',NULL,'admin','台灣拜耳股份有限公司',101),(143,'允殺淨 1%(馬拉松)',3,'',NULL,'農藥製字第00104號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 1.000  (%)  ',NULL,'admin','龍燈生物科技股份有限公司',76),(144,'允殺淨 25%(馬拉松)',3,'',NULL,'農藥製字第00090號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 25.000 (%)',NULL,'admin','龍燈生物科技股份有限公司',76),(145,'允讚(布芬淨)',3,'',NULL,'農藥進字第01446號',NULL,NULL,NULL,'(Z)-2-tert-butylimino-3-isopropyl-5-phenyl-1, 3, 5-thiadiazinan-4-one 25.000 (%)',NULL,'admin','安農股份有限公司',156),(146,'元氣精(依普同)',3,'',NULL,'農藥進字第03244號',NULL,NULL,NULL,'3-(3,5-dichlorophenyl)-N-isopropyl-2,4-dioxoimidazolidine-1-carboxamide  23.700 (%)',NULL,'admin','安旺特股份有限公司',120),(147,'光華勇(阿巴汀)',3,'',NULL,'農藥製字第06095號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%)    ',NULL,'admin','光華化學股份有限公司',77),(148,'克圖淨(賽滅淨)',3,'',NULL,'農藥製字第04652號',NULL,NULL,NULL,'N-cyclopropyl-1,3,5-triazine-2,4,6-triamine 75.000 (%) ',NULL,'admin','中華民國農會附設各級農會農化廠',131),(149,'克星丹(甲基多保淨)',3,'',NULL,'農藥進字第00079號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 70.000 (%)',NULL,'admin','生力化學工業股份有限公司',139),(150,'克普定(克絕波爾多)',3,'',NULL,'農藥進字第00960號',NULL,NULL,NULL,'(1) 1-(2-cyano-2-methoxyiminoacetyl)-3-ethylurea...3% (2) BORDEAUX MIXTURE...90%',NULL,'admin','台灣龍燈股份有限公司',152),(151,'克果蠅(馬拉松)',3,'',NULL,'農藥製字第04457號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 25.000 (%)  ',NULL,'admin','國豐化學工業股份有限公司',112),(152,'克氯靈(四氯異苯腈)',3,'',NULL,'農藥製字第02303號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  75.000 (%)',NULL,'admin','嘉農企業股份有限公司',117),(153,'克滅蟲(陶斯松)',3,'',NULL,'農藥進字第01820號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%) ',NULL,'admin','合林企業有限公司',166),(154,'克爛寶(腐絕快得寧)',3,'',NULL,'農藥製字第04723號',NULL,NULL,NULL,'(1) 2-(THIAZOL-4-YL)BENZIMIDAZOLE....................18%(2) BIS(QUINOLIN-8-OLATO-O,N)COPPER..................35%',NULL,'admin','瑞芳植物保護股份有限公司',115),(155,'克瓜菌(銅快得寧)',3,'',NULL,'農藥製字第04233號',NULL,NULL,NULL,'(1) bis(quinolin-8-olato-O,N)copper...30% (2) cupric hydroxide...10%',NULL,'admin','瑞芳植物保護股份有限公司',115),(156,'克疫寶(克收欣)',3,'',NULL,'農藥製字第06358號',NULL,NULL,NULL,'methyl (E)-methoxyimino[2-(o-tolyloxymethyl)phenyl]acetate 44.200 (%)',NULL,'admin','臺聯實業股份有限公司',107),(157,'克百龍(賽普洛)',3,'',NULL,'農藥進字第02321號',NULL,NULL,NULL,'4-cyclopropyl-6-methyl-N-phenylpyrimidin-2-amine 50.000 (%)  ',NULL,'admin','台灣先正達股份有限公司',144),(158,'克粉靈(布瑞莫)',3,'',NULL,'農藥進字第00610號',NULL,NULL,NULL,'5-butyl-2-ethylamino-6-methylpyrimidin-4-yl dimethylsulfamate 250 G/L (25% W/V) ',NULL,'admin','聯利農業科技股份有限公司',103),(159,'克紋精(菲克利)',3,'',NULL,'農藥進字第02342號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 10.000 (%)',NULL,'admin','雅飛有限公司',126),(160,'克菌多(氫氧化銅)',3,'',NULL,'農藥進字第02296號',NULL,NULL,NULL,' CUPRIC HYDROXIDE  53.800 (%)',NULL,'admin','台灣杜邦農業科學股份有限公司',161),(161,'克菌寧(四氯保淨)',3,'',NULL,'農藥製字第01992號',NULL,NULL,NULL,'(1) dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate)...20% (2) tetrachloroisophthalonitrile...50%',NULL,'admin','洽益化學股份有限公司',108),(162,'克菌精(菲克利)',3,'',NULL,'農藥製字第05135號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 5.000  (%)',NULL,'admin','聯利農業科技股份有限公司',103),(163,'克蟲霸(因滅汀)',3,'',NULL,'農藥製字第05393號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','嘉泰企業股份有限公司',102),(164,'免怨炭(腈硫醌)',3,'',NULL,'農藥進字第02910號',NULL,NULL,NULL,'5,10-dihydro-5,10-dioxonaphtho[2,3-b]-1,4-dithiine-2,3-dicarbonitrile 70.000 (%)  ',NULL,'admin','萬得發有限公司',125),(165,'免煩(陶斯松)',3,'',NULL,'農藥進字第01102號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 22.500 (%)',NULL,'admin','全臺農藥有限公司',182),(166,'免萬炭(待克利)',3,'',NULL,'農藥製字第05464號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%)  ',NULL,'admin','嘉泰企業股份有限公司',102),(167,'免露(鋅錳克絕)',3,'',NULL,'農藥進字第03204號',NULL,NULL,NULL,'(1) 1-(2-cyano-2-methoxyiminoacetyl)-3-ethylurea…8% (2) manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt…64%',NULL,'admin','松樹國際有限公司',137),(168,'免驚蟲(因滅汀)',3,'',NULL,'農藥進字第03191號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','景茂貿易有限公司',158),(169,'全多寧(陶斯松)',3,'',NULL,'農藥進字第03077號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%) ',NULL,'admin','嘉濱貿易有限公司',111),(170,'全掃(乃力松)',3,'',NULL,'農藥製字第04237號',NULL,NULL,NULL,'1,2-DIBROMO-2,2-DICHLOROETHYL DIMETHYL PHOSPHATE  58.000 (%)',NULL,'admin','興農股份有限公司',85),(171,'全滅露－鋅錳(鋅錳滅達樂)',3,'',NULL,'農藥製字第04728號',NULL,NULL,NULL,'(1) manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt...48%(2) methyl N-(methoxyacetyl)-N-(2,6-xylyl)-DL-alaninate...10%',NULL,'admin','富農化學工業股份有限公司',132),(172,'全靈(納乃得)',3,'',NULL,'農藥製字第03285號',NULL,NULL,NULL,' S-methyl N-(methylcarbamoyloxy)thioacetimidate  40.000 (%)',NULL,'admin','正農化學股份有限公司',130),(173,'六六大順(陶斯寧)',3,'',NULL,'農藥製字第05419號',NULL,NULL,NULL,'(1) O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate…45.45% (2) (RS)-α-cyano-3-phenoxybenzyl (1RS)-cis-trans-3-(2,2-dichlorovinyl)-2,2-dimethylcyclopropanecarboxylate…4.55%',NULL,'admin','安旺特股份有限公司',120),(174,'冠世界(亞滅培)',3,'',NULL,'農藥製字第05973號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%) ',NULL,'admin','台農三和化工股份有限公司',119),(175,'冠天下(亞滅培)',3,'',NULL,'農藥製字第04763號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%)',NULL,'admin','臺灣庵原農藥股份有限公司',113),(176,'冠王星(畢芬寧)',3,'',NULL,'農藥進字第02677號',NULL,NULL,NULL,'2-methylbiphenyl-3-ylmethyl (Z)-(1RS,3RS)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate  2.800 (%)',NULL,'admin','安旺特股份有限公司',120),(177,'冠菌清(氫氧化銅)',3,'',NULL,'農藥進字第02839號',NULL,NULL,NULL,' CUPRIC HYDROXIDE  57.600 (%)',NULL,'admin','台灣嘉潔股份有限公司',169),(178,'凱潤(百克敏)',3,'',NULL,'農藥製字第06349號',NULL,NULL,NULL,' methyl N-{2-[1-(4-chlorophenyl)pyrazol-3-yloxymethyl]phenyl}(N-methoxy)carbamate  23.600 (%)',NULL,'admin','瑞芳植物保護股份有限公司',115),(179,'凱速靈(第滅寧)',3,'',NULL,'農藥進字第02398號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.400  (%) ',NULL,'admin','鴻鋒化學有限公司',134),(180,'凸統久(菲克利)',3,'',NULL,'農藥製字第05057號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 5.000  (%) ',NULL,'admin','臺聯實業股份有限公司',107),(181,'出運(菲克利)',3,'',NULL,'農藥製字第05384號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 5.000  (%)',NULL,'admin','安旺特股份有限公司',120),(182,'出頭天(百克敏)',3,'',NULL,'農藥進字第03428號',NULL,NULL,NULL,' methyl N-{2-[1-(4-chlorophenyl)pyrazol-3-yloxymethyl]phenyl}(N-methoxy)carbamate  23.600 (%)',NULL,'admin','萬得發有限公司',125),(183,'利克除(四氯異苯腈)',3,'',NULL,'農藥進字第02898號',NULL,NULL,NULL,'tetrachloroisophthalonitrile  75.000 (%)',NULL,'admin','萬得發有限公司',125),(184,'利台允ㄟ好(賓得克利)',3,'',NULL,'農藥製字第05726號',NULL,NULL,NULL,'(1) 1-(4-chlorobenzyl)-1-cyclopentyl-3-phenylurea...15% (2) (RS)-1-p-chlorophenyl-4,4-dimethyl-3-(1H-1,2,4-triazol-1- ylmethyl)pentan-3-ol...10%',NULL,'admin','利台化學工業股份有限公司',116),(185,'利台蟲ㄟ除(因滅汀)',3,'',NULL,'農藥製字第05459號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','利台化學工業股份有限公司',116),(186,'利富農(乃力松)',3,'',NULL,'農藥製字第00559號',NULL,NULL,NULL,'1,2-DIBROMO-2,2-DICHLOROETHYL DIMETHYL PHOSPHATE  58.000 (%)',NULL,'admin','台灣日產化工股份有限公司',104),(187,'利果蔬(錳乃浦)',3,'',NULL,'農藥製字第04680號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','利台化學工業股份有限公司',116),(188,'利枯淨(菲克利)',3,'',NULL,'農藥進字第02151號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 10.000 (%) ',NULL,'admin','易利特開發有限公司',138),(189,'利粉靈(依滅列)',3,'',NULL,'農藥製字第02693號',NULL,NULL,NULL,'(±)-1-(β-allyloxy-2,4-dichlorophenylethyl)imidazole 21.200 (%) ',NULL,'admin','世大農化工廠股份有限公司	',114),(190,'利統勇(亞滅培)',3,'',NULL,'農藥製字第05741號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%)',NULL,'admin','利台化學工業股份有限公司',116),(191,'利能收(賽滅淨)',3,'',NULL,'農藥進字第02260號',NULL,NULL,NULL,'N-cyclopropyl-1,3,5-triazine-2,4,6-triamine 75.000 (%) ',NULL,'admin','雅飛有限公司',126),(192,'利菜農(賽達松)',3,'',NULL,'農藥製字第00373號',NULL,NULL,NULL,' S-α-ethoxycarbonylbenzyl O,O-dimethyl phosphorodithioate  50.000 (%)',NULL,'admin','龍燈生物科技股份有限公司',76),(193,'利萬能(納乃得)',3,'',NULL,'農藥製字第03468號',NULL,NULL,NULL,' S-methyl N-(methylcarbamoyloxy)thioacetimidate  40.000 (%)',NULL,'admin','利台化學工業股份有限公司',116),(194,'利農產(賽達松)',3,'',NULL,'農藥製字第00368號',NULL,NULL,NULL,' S-α-ethoxycarbonylbenzyl O,O-dimethyl phosphorodithioate  50.000 (%)',NULL,'admin','台灣正豐植保股份有限公司',128),(195,'刺蟲(第滅寧)',3,'',NULL,'農藥製字第05672號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.400  (%) ',NULL,'admin','光華化學股份有限公司',77),(196,'剋介寶(大滅松)',3,'',NULL,'農藥製字第01661號',NULL,NULL,NULL,' O, O-dimethyl-S-methylcarbamoylmethyl phosphorodithioate  44.000 (%)',NULL,'admin','富農化學工業股份有限公司',132),(197,'剋毒蛾(得芬諾)',3,'',NULL,'農藥製字第05725號',NULL,NULL,NULL,' N-tert-butyl-N’-(4-ethylbenzoyl)-3,5-dimethylbenzohydrazide  19.700 (%)',NULL,'admin','利台化學工業股份有限公司',116),(198,'剋炭白(克收欣)',3,'',NULL,'農藥進字第03423號',NULL,NULL,NULL,' methyl (E)-methoxyimino[2-(o-tolyloxymethyl)phenyl]acetate  44.200 (%)',NULL,'admin','嘉濱貿易有限公司',111),(199,'剋炭酸(待克利)',3,'',NULL,'農藥製字第06061號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%)',NULL,'admin','華夏科學農化股份有限公司',106),(200,'剋瓜蠅(克蠅香)',3,'',NULL,'農藥製字第04444號',NULL,NULL,NULL,'(1) 4-(P-ACETOXYPHENYL)-2-BUTANONE...42.7%                   (2) METHYL EUGENOL...42.3%',NULL,'admin','嘉農企業股份有限公司',117),(201,'剋疫菌(普拔克)',3,'',NULL,'農藥進字第02926號',NULL,NULL,NULL,' propyl 3-(dimethylamino)propylcarbamate hydrochloride  66.500 (%)',NULL,'admin','優必樂有限公司',151),(202,'剋菌王(四氯異苯腈)',3,'',NULL,'農藥進字第03004號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  40.000 (%)',NULL,'admin','青山貿易有限公司',147),(203,'剋菌精(四氯異苯腈)',3,'',NULL,'農藥製字第05193號',NULL,NULL,NULL,'tetrachloroisophthalonitrile  40.000 (%)',NULL,'admin','臺益工業股份有限公司',39),(204,'剋蟲(乃力松)',3,'',NULL,'農藥製字第03392號',NULL,NULL,NULL,'1,2-DIBROMO-2,2-DICHLOROETHYL DIMETHYL PHOSPHATE  58.000 (%)',NULL,'admin','正農化學股份有限公司',130),(205,'剋蟲寧(加保利)',3,'',NULL,'農藥進字第01109號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 50.000 (%)  ',NULL,'admin','全臺農藥有限公司',182),(206,'剋蟲王(阿巴汀)',3,'',NULL,'農藥製字第05972號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%) ',NULL,'admin','百泰生物科技股份有限公司',26),(207,'剋蠅(馬拉松)',3,'',NULL,'農藥製字第04286號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 25.000 (%)  ',NULL,'admin','嘉農企業股份有限公司',117),(208,'剌馬(第滅寧)',3,'',NULL,'農藥製字第04173號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%) ',NULL,'admin','光華化學股份有限公司',77),(209,'創裕牌加佳肥混合有機質肥料',2,'','有機資審字第107029號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0491011號','蓖麻粕、芝麻粕、黃豆粕、肉骨粉、米糠','全氮5.0%全磷酐3.0%全氧化鉀2.0%有機質85.0%',NULL,'admin','創裕有機有限公司',64),(210,'力克蟲(乃力松)',3,'',NULL,'農藥製字第04784號',NULL,NULL,NULL,'1,2-DIBROMO-2,2-DICHLOROETHYL DIMETHYL PHOSPHATE  58.000 (%)',NULL,'admin','東和化學企業股份有限公司',109),(211,'力頭飽(益達胺)',3,'',NULL,'農藥製字第05403號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%)',NULL,'admin','臺聯實業股份有限公司',107),(212,'功力 1%(賽洛寧)',3,'',NULL,'農藥進字第02593號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 1.000  (%)',NULL,'admin','雅飛有限公司',126),(213,'功力 2.8%(賽洛寧)',3,'',NULL,'農藥進字第02236號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.800  (%)  ',NULL,'admin','雅飛有限公司',126),(214,'功夫(賽洛寧)',3,'',NULL,'農藥進字第00806號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.800  (%)  ',NULL,'admin','台灣先正達股份有限公司',144),(215,'加保利 (農會農化廠)',3,'',NULL,'農藥製字第01222號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 85.000 (%)',NULL,'admin','中華民國農會附設各級農會農化廠',131),(216,'加保扶(農會農化廠)',3,'',NULL,'農藥製字第03347號',NULL,NULL,NULL,'2,3-dihydro-2,2-dimethylbenzofuran-7-yl methylcarbamate  3.000 (%)',NULL,'admin','中華民國農會附設各級農會農化廠',131),(217,'加保讚(加保利)',3,'',NULL,'農藥製字第06247號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 40.000 (%)   ',NULL,'admin','台農三和化工股份有限公司',119),(218,'加倍利(加保利)',3,'',NULL,'農藥製字第01371號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 50.000 (%)',NULL,'admin','瑞芳植物保護股份有限公司',115),(219,'加倍勇(亞滅培)',3,'',NULL,'農藥製字第05687號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%) ',NULL,'admin','東和化學企業股份有限公司',109),(220,'加富冬(快得寧)',3,'',NULL,'農藥製字第04238號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 33.500 (%) ',NULL,'admin','瑞芳植物保護股份有限公司',115),(221,'加寶麗(加保利)',3,'',NULL,'農藥製字第06479號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 85.000 (%) ',NULL,'admin','華夏科學農化股份有限公司',106),(222,'加瑞農(嘉賜銅)',3,'',NULL,'農藥製字第00765號',NULL,NULL,NULL,'(1) [5-amino-2-methyl-6-(2,3,4,5,6,-pentahydroxycyclohexyloxy) tetrahydropyran-3-yl] amino-α-iminoacetic acid...2% (2) copper oxychloride...75.5%',NULL,'admin','大勝化學工業股份有限公司',110),(223,'加速靈(賽達松)',3,'',NULL,'農藥製字第03164號',NULL,NULL,NULL,' S-α-ethoxycarbonylbenzyl O,O-dimethyl phosphorodithioate  50.000 (%)',NULL,'admin','世大農化工廠股份有限公司	',114),(224,'助沒蟎(芬普蟎)',3,'',NULL,'農藥製字第05964號',NULL,NULL,NULL,'tert-butyl (E)-α-(1,3-dimethyl-5-phenoxypyrazol-4-ylmethyleneamino-oxy)-p-toluate 5.000  (%) ',NULL,'admin','東和化學企業股份有限公司',109),(225,'勁功夫(賽洛寧)',3,'',NULL,'農藥進字第02188號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.460  (%) ',NULL,'admin','台灣先正達股份有限公司',144),(226,'勁勇(賽洛寧)',3,'',NULL,'農藥進字第02255號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.800  (%) ',NULL,'admin','台灣瑪斯德股份有限公司',145),(227,'勁厲害(益達胺)',3,'',NULL,'農藥進字第02880號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 18.200 (%)',NULL,'admin','萬得發有限公司',125),(228,'勁夠力(賽速安)',3,'',NULL,'農藥進字第02211號',NULL,NULL,NULL,'3-(2-chloro-1,3-thiazol-5-ylmethyl)-5-methyl-1,3,5-oxadiazinan-4-ylidene(nitro)amine 10.000 (%)',NULL,'admin','台灣先正達股份有限公司',144),(229,'勁好(第滅寧)',3,'',NULL,'農藥進字第02400號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.400  (%) ',NULL,'admin','合林企業有限公司',166),(230,'勁強(賽洛寧)',3,'',NULL,'農藥進字第02306號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.800  (%)',NULL,'admin','合林企業有限公司',166),(231,'勁有利(待克利)',3,'',NULL,'農藥製字第06107號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%)',NULL,'admin','立農化學股份有限公司',143),(232,'勁殺(第滅寧)',3,'',NULL,'農藥進字第02290號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%) ',NULL,'admin','合林企業有限公司',166),(233,'勁讚(百利普芬)',3,'',NULL,'農藥製字第05987號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 11.000 (%)',NULL,'admin','惠光股份有限公司',121),(234,'勁豪(四氯福多寧)',3,'',NULL,'農藥進字第02700號',NULL,NULL,NULL,'(1) α-α-α-trifluoro-3’-isopropoxy-o-toluanilide...10.3% (2) tetrachloroisophthalonitrile...38.6%',NULL,'admin','日佳農葯股份有限公司',178),(235,'勁通用(賽洛寧)',3,'',NULL,'農藥製字第05935號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.500  (%) ',NULL,'admin','日農科技股份有限公司',105),(236,'勇伯(托福松)',3,'',NULL,'農藥製字第05558號',NULL,NULL,NULL,' S-tert-butylthiomethyl O,O-diethyl phosphorodithioate  10.000 (%)',NULL,'admin','臺聯實業股份有限公司',107),(237,'勇健健(亞托敏)',3,'',NULL,'農藥進字第02914號',NULL,NULL,NULL,'methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  10.000 (%)',NULL,'admin','美商雅柏生活科技有限公司臺灣分公司',148),(238,'勇克蟎(阿巴汀)',3,'',NULL,'農藥製字第05896號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%)',NULL,'admin','洽益化學股份有限公司',108),(239,'勇哥(阿巴汀)',3,'',NULL,'農藥製字第05555號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%) ',NULL,'admin','利台化學工業股份有限公司',116),(240,'勇將 5%(加保利)',3,'',NULL,'農藥製字第04105號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 5.000  (%)',NULL,'admin','臺益工業股份有限公司',39),(241,'勇將 85%(加保利)',3,'',NULL,'農藥製字第03524號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 85.000 (%)',NULL,'admin','臺益工業股份有限公司',39),(242,'勇將水仙(加保利)',3,'',NULL,'農藥製字第00114號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 40.000 (%)',NULL,'admin','臺益工業股份有限公司',39),(243,'勇治(阿巴汀)',3,'',NULL,'農藥進字第03482號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%) ',NULL,'admin','高事達農化有限公司',155),(244,'勇馬(滅賜克)',3,'',NULL,'農藥製字第04489號',NULL,NULL,NULL,'4-METHYLTHIO-3,5-XYLYL-METHYLCARBAMATE 50.000 (%)',NULL,'admin','興農股份有限公司',85),(245,'勝投王(馬拉松)',3,'',NULL,'農藥製字第06384號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 50.000 (%)',NULL,'admin','立農化學股份有限公司',143),(246,'勝生(邁克尼)',3,'',NULL,'農藥進字第02696號',NULL,NULL,NULL,'2-p-chlorophenyl-2-(1H-1,2,4-triazol-1-ylmethyl)hexanenitrile 40.000 (%)  ',NULL,'admin','雅飛有限公司',126),(247,'包你勇(阿巴汀)',3,'',NULL,'農藥製字第05379號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%)     ',NULL,'admin','立農化學股份有限公司',143),(248,'包力錳(撲克拉錳)',3,'',NULL,'農藥進字第02409號',NULL,NULL,NULL,'N-propyl-N-[2-(2,4,6-trichlorophenoxy)ethyl]imidazole-1-carboxamide complex with manganese(II) chloride 50.000 (%) ',NULL,'admin','雅飛有限公司',126),(249,'包天威(亞滅培)',3,'',NULL,'農藥進字第03242號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%) ',NULL,'admin','安旺特股份有限公司',120),(250,'包尅蟎(芬普蟎)',3,'',NULL,'農藥製字第05939號',NULL,NULL,NULL,'tert-butyl (E)-α-(1,3-dimethyl-5-phenoxypyrazol-4-ylmethyleneamino-oxy)-p-toluate 5.000  (%) ',NULL,'admin','聯利農業科技股份有限公司',103),(251,'包收成(陶斯松)',3,'',NULL,'農藥製字第04181號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%) ',NULL,'admin','嘉泰企業股份有限公司',102),(252,'包攻(菲克利)',3,'',NULL,'農藥製字第05505號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 5.000  (%) ',NULL,'admin','世大農化工廠股份有限公司	',114),(253,'包有效(賽扶寧)',3,'',NULL,'農藥進字第02652號',NULL,NULL,NULL,'(RS)-α-cyano-4-fluoro-3-phenoxybenzyl (1RS,3RS;1RS,3SR)-3-(2,2-dichlorovinyl)-2,2-dimethylcyclopropanecarboxylate 5.700  (%)  ',NULL,'admin','優必樂有限公司',151),(254,'包正青(依普同)',3,'',NULL,'農藥製字第05029號',NULL,NULL,NULL,'3-(3,5-dichlorophenyl)-N-isopropyl-2,4-dioxoimidazolidine-1-carboxamide  23.700 (%)',NULL,'admin','興農股份有限公司',85),(255,'包清天(菲克利)',3,'',NULL,'農藥製字第05146號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 10.000 (%)   ',NULL,'admin','世大農化工廠股份有限公司	',114),(256,'包滅菌(貝芬四克利)',3,'',NULL,'農藥進字第02307號',NULL,NULL,NULL,'(1) methyl benzimidazol-2-ylcarbamate...13.39% (2) (RS)-2-(2,4-dichlorophenyl)-3-(1H-1,2,4-triazol-1-yl)propyl 1,1,2,2-tetrafluoroethyl ether...11.16%',NULL,'admin','台灣龍燈股份有限公司',152),(257,'包炭(待克利)',3,'',NULL,'農藥進字第02568號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 10.000 (%)',NULL,'admin','萬得發有限公司',125),(258,'包穗滿(菲克利)',3,'',NULL,'農藥製字第05200號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 10.000 (%) ',NULL,'admin','臺灣庵原農藥股份有限公司',113),(259,'包讚(納得亞滅寧)',3,'',NULL,'農藥製字第04454號',NULL,NULL,NULL,'納乃得 12% 亞滅寧 1.5%',NULL,'admin','世大農化工廠股份有限公司	',114),(260,'包速達精(克收欣)',3,'',NULL,'農藥進字第02584號',NULL,NULL,NULL,' methyl (E)-methoxyimino[2-(o-tolyloxymethyl)phenyl]acetate  44.200 (%)',NULL,'admin','雅飛有限公司',126),(261,'包金讚(撲克拉錳)',3,'',NULL,'農藥進字第02501號',NULL,NULL,NULL,'N-propyl-N-[2-(2,4,6-trichlorophenoxy)ethyl]imidazole-1-carboxamide complex with manganese(II) chloride 50.000 (%)     ',NULL,'admin','台灣瑪斯德股份有限公司',145),(262,'包順事(亞滅培)',3,'',NULL,'農藥製字第05734號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%)',NULL,'admin','瑞芳植物保護股份有限公司',115),(263,'包順利(腈硫醌)',3,'',NULL,'農藥製字第05140號',NULL,NULL,NULL,' 5,10-dihydro-5,10-dioxonaphtho[2,3-b]-1,4-dithiine-2,3-dicarbonitrile  22.700 (%)',NULL,'admin','聯利農業科技股份有限公司',103),(264,'北極星(畢芬寧)',3,'',NULL,'農藥製字第06522號',NULL,NULL,NULL,'2-methylbiphenyl-3-ylmethyl (Z)-(1RS,3RS)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate  2.500 (%)',NULL,'admin','台農三和化工股份有限公司',119),(265,'北海小英雄(可尼丁)',3,'',NULL,'農藥製字第04967號',NULL,NULL,NULL,'(E)-1-(2-chloro-1,3-thiazol-5-ylmethyl)-3-methyl-2- nitroguanidine 16.000 (%) ',NULL,'admin','立農化學股份有限公司',143),(266,'十八銅人(銅快得寧)',3,'',NULL,'農藥製字第06432號',NULL,NULL,NULL,'(1) bis(quinolin-8-olato-O,N)copper...30% (2) cupric hydroxide...10%',NULL,'admin','東和化學企業股份有限公司',109),(267,'千心魔(賽洛寧)',3,'',NULL,'農藥製字第05341號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.800  (%)',NULL,'admin','洽益化學股份有限公司',108),(268,'千百利(賽洛寧)',3,'',NULL,'農藥進字第02189號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.800  (%)',NULL,'admin','翰金興業有限公司',165),(269,'協益牌有機質肥料6號',2,'','有機資審字第107041號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0163015號','花生殼粉、花生粕','全氮4.2%全磷酐2.5%全氧化鉀1.8%有機質83.3%',NULL,'admin','添進肥料工廠有限公司',67),(270,'南波萬(亞滅培)',3,'',NULL,'農藥進字第03140號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%)',NULL,'admin','雅飛有限公司',126),(271,'卡實讚(益達胺)',3,'',NULL,'農藥進字第02482號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%)',NULL,'admin','優必樂有限公司',151),(272,'卡是讚(鋅錳滅達樂)',3,'',NULL,'農藥進字第02800號',NULL,NULL,NULL,'(1) manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt...60% (2) (RS)-2-(4-chlorophenyl)-N-[3-methoxy-4-(prop-2-ynyloxy)phenethyl]-2-(prop-2-ynyloxy)acetamide...5%',NULL,'admin','台灣先正達股份有限公司',144),(273,'卡有力(乃力松)',3,'',NULL,'農藥製字第04334號',NULL,NULL,NULL,'1,2-DIBROMO-2,2-DICHLOROETHYL DIMETHYL PHOSPHATE  58.000 (%)',NULL,'admin','眾益農業生技股份有限公司',124),(274,'卡順利(益滅松)',3,'',NULL,'農藥進字第02115號',NULL,NULL,NULL,' O,O-dimethyl S-phthalimidomethyl phosphorodithioate  50.000 (%)',NULL,'admin','威群國際有限公司',164),(275,'印地安(賽速安)',3,'',NULL,'農藥進字第03141號',NULL,NULL,NULL,'3-(2-chloro-1,3-thiazol-5-ylmethyl)-5-methyl-1,3,5-oxadiazinan-4-ylidene(nitro)amine 25.000 (%)',NULL,'admin','青山貿易有限公司',147),(276,'印度生-四五(錳乃浦)',3,'',NULL,'農藥進字第03274號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','安旺特股份有限公司',120),(277,'原氣肥433',2,'','有機資審字第105010號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0622025號','芝麻粕、菜籽粕、米糠、肉骨粉、魚粉、蟹殼、菸草','全氮4.5%全磷酐3.0%全氧化鉀3.0%有機質70.0%',NULL,'admin','三木實業有限公司',40),(278,'去煞掌 2%(益達胺)',3,'',NULL,'農藥進字第02544號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 2.000  (%)',NULL,'admin','雅飛有限公司',126),(279,'去煞掌 9.6%(益達胺)',3,'',NULL,'農藥進字第02254號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%)',NULL,'admin','雅飛有限公司',126),(280,'參謀總長(百克敏)',3,'',NULL,'農藥進字第03479號',NULL,NULL,NULL,' methyl N-{2-[1-(4-chlorophenyl)pyrazol-3-yloxymethyl]phenyl}(N-methoxy)carbamate  23.600 (%)',NULL,'admin','大成化學工業股份有限公司',127),(281,'双倍靈(祿芬隆)',3,'',NULL,'農藥進字第03200號',NULL,NULL,NULL,'(RS)-1-[2,5-dichloro-4-(1,1,2,3,3,3-hexafluoropropoxy)- phenyl]-3-(2,6-difluorobenzoyl)-urea  4.400 (%)',NULL,'admin','大成化學工業股份有限公司',127),(282,'双响炮(亞托待克利)',3,'',NULL,'農藥進字第03232號',NULL,NULL,NULL,'(1) methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate...200 g/L (2) cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1-ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether...125 g/L',NULL,'admin','青山貿易有限公司',147),(283,'双效星(畢芬寧)',3,'',NULL,'農藥製字第06302號',NULL,NULL,NULL,'2-methylbiphenyl-3-ylmethyl (Z)-(1RS,3RS)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate  2.500 (%)',NULL,'admin','聯利農業科技股份有限公司',103),(284,'双殺(布芬淨)',3,'',NULL,'農藥製字第05791號',NULL,NULL,NULL,'(Z)-2-tert-butylimino-3-isopropyl-5-phenyl-1, 3, 5-thiadiazinan-4-one 25.000 (%)',NULL,'admin','臺聯實業股份有限公司',107),(285,'双福星(畢芬寧)',3,'',NULL,'農藥製字第05963號',NULL,NULL,NULL,'2-methylbiphenyl-3-ylmethyl (Z)-(1RS,3RS)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate  2.800 (%)',NULL,'admin','洽益化學股份有限公司',108),(286,'双重發(布芬第滅寧)',3,'',NULL,'農藥製字第05752號',NULL,NULL,NULL,'(1) (S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate…0.69%    (2) (Z)-2-tert-butylimino-3-isopropyl-5-phenyl-1, 3, 5-thiadiazinan-4-one…11.09%',NULL,'admin','臺聯實業股份有限公司',107),(287,'双頭龍(派滅淨)',3,'',NULL,'農藥製字第06286號',NULL,NULL,NULL,'(E)-4,5-dihydro-6-methyl-4-(3-pyridylmethyleneamino)-1,2,4- triazin-3(2H)-one 50.000 (%)  ',NULL,'admin','洽益化學股份有限公司',108),(288,'可再多 37.5% (氫氧化銅)',3,'',NULL,'農藥製字第02345號',NULL,NULL,NULL,' CUPRIC HYDROXIDE  37.500 (%)',NULL,'admin','東和化學企業股份有限公司',109),(289,'可再多(氫氧化銅)',3,'',NULL,'農藥製字第02489號',NULL,NULL,NULL,'CUPRIC HYDROXIDE 77.000 (%)',NULL,'admin','東和化學企業股份有限公司',109),(290,'可利得(氫氧化銅)',3,'',NULL,'農藥製字第02831號',NULL,NULL,NULL,' CUPRIC HYDROXIDE  77.000 (%)',NULL,'admin','中華民國農會附設各級農會農化廠',131),(291,'可果美(依普同)',3,'',NULL,'農藥進字第03303號',NULL,NULL,NULL,'3-(3,5-dichlorophenyl)-N-isopropyl-2,4-dioxoimidazolidine-1-carboxamide  50.000 (%)',NULL,'admin','耕得貿易股份有限公司',141),(292,'可殺菌(甲基多保淨)',3,'',NULL,'農藥製字第02582號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 70.000 (%)',NULL,'admin','東和化學企業股份有限公司',109),(293,'台喜精(第滅寧)',3,'',NULL,'農藥進字第02279號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.400  (%) ',NULL,'admin','雅飛有限公司',126),(294,'台灣寶(枯草桿菌)',3,'','有機資審字第101011號','農藥製字第04764號',NULL,NULL,NULL,'枯草桿菌BacillussubtilisY1336ViablesporesofBacillussubtilisY133650%1×109CFU/g(51EP)；其他增量劑50%',NULL,'admin','光華化學股份有限公司',77),(295,'台灣水寶(枯草桿菌)',3,'','有機資審字第101007號','農藥製字第05323號',NULL,NULL,NULL,'枯草桿菌 Bacillus subtilis Y1336 Viable spores of Bacillus subtilis Y1336 1 × 108 CFU/ml 以上',NULL,'admin','百泰生物科技股份有限公司',26),(296,'台灣紅(氟芬隆)',3,'',NULL,'農藥進字第03049號',NULL,NULL,NULL,'1-[4-(2-chloro-α,α,α-trifluoro-p-tolyloxy)-2-fluorophenyl]-3-(2,6-difluorobenzoyl)urea  9.600 (%)',NULL,'admin','嘉濱貿易有限公司',111),(297,'台生水仙(錳乃浦)',3,'',NULL,'農藥製字第03001號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  33.000 (%)',NULL,'admin','臺益工業股份有限公司',39),(298,'台生粉(錳乃浦)',3,'',NULL,'農藥製字第04835號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','世大農化工廠股份有限公司	',114),(299,'台生精(錳乃浦)',3,'',NULL,'農藥製字第01670號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  33.000 (%)',NULL,'admin','惠光股份有限公司',121),(300,'台福將(益達胺)',3,'',NULL,'農藥製字第05378號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 18.200 (%)',NULL,'admin','臺益工業股份有限公司',39),(301,'台糖牌田寶有機質粒肥P25號',2,'','有機資審字第100010號',NULL,'植物渣粕肥料(5-01)','肥製(質)字第0005018號','菜籽粕、米糠、大豆粕、椰子粕、芝麻粕、蓖麻粕','全氮5.5%全磷酐2%全氧化鉀2%有機質85%',NULL,'admin','台灣糖業股份有限公司新營副產加工廠',29),(302,'台美速(大滅松)',3,'',NULL,'農藥製字第00976號',NULL,NULL,NULL,' O, O-dimethyl-S-methylcarbamoylmethyl phosphorodithioate  44.000 (%)',NULL,'admin','大成化學工業股份有限公司',127),(303,'台農讚(賽滅淨)',3,'',NULL,'農藥製字第06508號',NULL,NULL,NULL,'N-cyclopropyl-1,3,5-triazine-2,4,6-triamine 8.900  (%)',NULL,'admin','台農三和化工股份有限公司',119),(304,'台農馬拉松(馬拉松)',3,'',NULL,'農藥製字第06529號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 50.000 (%)   ',NULL,'admin','台農三和化工股份有限公司',119),(305,'台鉄(益達胺)',3,'',NULL,'農藥製字第05165號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%) ',NULL,'admin','嘉農企業股份有限公司',117),(306,'合作夥(陶斯松)',3,'',NULL,'農藥進字第02642號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 44.900 (%)',NULL,'admin','合林企業有限公司',166),(307,'合農時(托福松)',3,'',NULL,'農藥製字第04180號',NULL,NULL,NULL,' S-tert-butylthiomethyl O,O-diethyl phosphorodithioate  10.000 (%)',NULL,'admin','富農化學工業股份有限公司',132),(308,'吉利收(陶斯松)',3,'',NULL,'農藥製字第04760號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%) ',NULL,'admin','臺灣庵原農藥股份有限公司',113),(309,'吉利松(陶斯松)',3,'',NULL,'農藥製字第04211號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%) ',NULL,'admin','華夏科學農化股份有限公司',106),(310,'吉利龍(佈飛松)',3,'',NULL,'農藥製字第03233號',NULL,NULL,NULL,'O-4-bromo-2-chlorophenyl O-ethyl S-propyl phosphorothioate 43.000 (%) ',NULL,'admin','富農化學工業股份有限公司',132),(311,'吉圃力有機質肥料',2,'','有機資審字第108010號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0266013號','禽畜糞、植物性廢渣、蓖麻粕','全氮5.0%全磷酐2.0%全氧化鉀2.0%有機質80.0%',NULL,'admin','順豐有機肥料有限公司',46),(312,'吉山發牌10號混合有機質肥料',2,'','有機資審字第107025號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0011010號','骨粉、花生殼粉、黄豆粉、蓖麻粕、魚粉','全氮3.8%全磷酐2.2%全氧化鉀2.0%有機質80.0%',NULL,'admin','欣農發實業股份有限公司',32),(313,'吉山發牌3號混合有機質肥料',2,'','有機資審字第101001號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0011003號','骨粉、花生殼粉、黃豆粉、蓖麻粕、魚粉','全氮5%全磷酐2.5%全氧化鉀2.5%有機質80%',NULL,'admin','欣農發實業股份有限公司',32),(314,'吉旺(依普同)',3,'',NULL,'農藥進字第01617號',NULL,NULL,NULL,'3-(3,5-dichlorophenyl)-N-isopropyl-2,4-dioxoimidazolidine-1-carboxamide  50.000 (%)',NULL,'admin','大勝化學工業股份有限公司',110),(315,'吉時保 40%(甲基多保淨)',3,'',NULL,'農藥製字第05047號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 40.000 (%)',NULL,'admin','台灣日產化工股份有限公司',104),(316,'吉時保 70%(甲基多保淨)',3,'',NULL,'農藥製字第04959號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 70.000 (%)',NULL,'admin','台灣日產化工股份有限公司',104),(317,'吉發(達滅芬)',3,'',NULL,'農藥製字第05578號',NULL,NULL,NULL,'(E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine  50.000 (%)',NULL,'admin','聯利農業科技股份有限公司',103),(318,'吉贏(可尼丁)',3,'',NULL,'農藥製字第04962號',NULL,NULL,NULL,'(E)-1-(2-chloro-1,3-thiazol-5-ylmethyl)-3-methyl-2- nitroguanidine 0.500  (%)  ',NULL,'admin','立農化學股份有限公司',143),(319,'同好用(依普同)',3,'',NULL,'農藥進字第01973號',NULL,NULL,NULL,'3-(3,5-dichlorophenyl)-N-isopropyl-2,4-dioxoimidazolidine-1-carboxamide  23.700 (%)',NULL,'admin','臺聯實業股份有限公司',107),(320,'同發順(氟尼胺)',3,'',NULL,'農藥進字第03367號',NULL,NULL,NULL,'N-cyanomethyl-4-(trifluoromethyl)nicotinamide 10.000 (%)',NULL,'admin','萬得發有限公司',125),(321,'吸汁王 25%(布芬淨)',3,'',NULL,'農藥進字第02985號',NULL,NULL,NULL,'(Z)-2-tert-butylimino-3-isopropyl-5-phenyl-1, 3, 5-thiadiazinan-4-one 25.000 (%) ',NULL,'admin','萬得發有限公司',125),(322,'吸汁王 40%(布芬淨)',3,'',NULL,'農藥進字第02966號',NULL,NULL,NULL,'(Z)-2-tert-butylimino-3-isopropyl-5-phenyl-1, 3, 5-thiadiazinan-4-one 40.000 (%)',NULL,'admin','萬得發有限公司',125),(323,'呃樂(達特南)',3,'',NULL,'農藥製字第06565號',NULL,NULL,NULL,'(RS)-1-methyl-2-nitro-3-(tetrahydro-3-furylmethyl)guanidine 20.000 (%)',NULL,'admin','立農化學股份有限公司',143),(324,'呼你勇(因滅汀)',3,'',NULL,'農藥製字第05937號',NULL,NULL,NULL,'因滅汀 5%',NULL,'admin','洽益化學股份有限公司',108),(325,'呼你發(達特南)',3,'',NULL,'農藥進字第03355號',NULL,NULL,NULL,'(RS)-1-methyl-2-nitro-3-(tetrahydro-3-furylmethyl)guanidine 20.000 (%)',NULL,'admin','嘉濱貿易有限公司',111),(326,'呼您發(菲克利)',3,'',NULL,'農藥進字第02362號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 23.000 (%) ',NULL,'admin','台灣先正達股份有限公司',144),(327,'和益靈(益滅松)',3,'',NULL,'農藥製字第02101號',NULL,NULL,NULL,' O,O-dimethyl S-phthalimidomethyl phosphorodithioate  50.000 (%)',NULL,'admin','東和化學企業股份有限公司',109),(328,'哥倆好(嘉賜快得寧)',3,'',NULL,'農藥製字第05930號',NULL,NULL,NULL,'(1) 1L-1,3,4/2,5,6-1-DEOXY-2,3,4,5,6-PENTAHYDROXYCYCLOHEXYL 2-AMINO-2,3,4,6-TETRADEOXY-4-(α-IMINOGLYCINO)-α-D-ARABINO-HEXOPYRANOSIDE..................3.5% (2) BIS(QUINOLIN-8-OLATO-O,N)COPPER.....................40%',NULL,'admin','日農科技股份有限公司',105),(329,'哥兩好(貝芬菲克利)',3,'',NULL,'農藥製字第05357號',NULL,NULL,NULL,'(1) METHYL BENZIMIDAZOL-2-YLCARBAMATE..........24.5%(2) (RS)-2-(2,4-DICHLOROPHENYL)-1-(1H-1,2,4-TRIAZOL-1-YL)HEXAN-2-OL.........10%',NULL,'admin','聯利農業科技股份有限公司',103),(330,'啪利啪利(撲滅寧)',3,'',NULL,'農藥製字第06099號',NULL,NULL,NULL,' N-(3,5-dichlorophenyl)-1,2-dimethylcyclopropane-1,2-dicarboximide  50.000 (%)',NULL,'admin','興農股份有限公司',85),(331,'喜來樂(第滅寧)',3,'',NULL,'農藥進字第02334號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%)',NULL,'admin','易利特開發有限公司',138),(332,'喜地雅(賽達松)',3,'',NULL,'農藥進字第02875號',NULL,NULL,NULL,' S-α-ethoxycarbonylbenzyl O,O-dimethyl phosphorodithioate  50.000 (%)',NULL,'admin','蒙狄生股份有限公司',159),(333,'喜巴樂(本達樂)',3,'',NULL,'農藥製字第06037號',NULL,NULL,NULL,' methyl N-phenylacetyl-N-2,6-xylyl-DL-alaninate  35.000 (%)',NULL,'admin','安旺特股份有限公司',120),(334,'喜旺(保粒快得寧)',3,'',NULL,'農藥製字第04241號',NULL,NULL,NULL,'(1) 5-(2-AMINO-5-0-CARBAMOAL-2-DEOXY-L-XYLONAMIDO)-5-DEOXY-1     -(1,2,3,4-TETRAHYDRO-5-HYDROXYMETHYL-2,4-DIOXOPYRIMIDINY     )D-ALLOFURANURONIC ACID...5%                             (2) bis(quinolin-8-olato-O,N)copper ...45%',NULL,'admin','興農股份有限公司',85),(335,'喜樂果(貝芬同)',3,'',NULL,'農藥進字第03488號',NULL,NULL,NULL,'(1) methyl benzimidazol-2-ylcarbamate...25% (2) 3-(3,5-dichlorophenyl)-N-isopropyl-2,4-dioxoimidazolidine-1-carboxamide...25%',NULL,'admin','嘉濱貿易有限公司',111),(336,'喜洋洋(第滅寧)',3,'',NULL,'農藥進字第02430號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%)  ',NULL,'admin','易利特開發有限公司',138),(337,'喜無蟲(第滅寧)',3,'',NULL,'農藥製字第05297號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.400  (%)',NULL,'admin','嘉泰企業股份有限公司',102),(338,'嘉保利(加保利)',3,'',NULL,'農藥製字第04821號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 85.000 (%) ',NULL,'admin','臺聯實業股份有限公司',107),(339,'嘉保淨(快得保淨)',3,'',NULL,'農藥製字第03034號',NULL,NULL,NULL,'(1) dimethyl 4,4’-(o-phenylene)bis(3-thioallophanate)...35%(2) bis(quinolin-8-olato-O,N)copper...40%',NULL,'admin','嘉農企業股份有限公司',117),(340,'嘉倍有效－精(百利普芬)',3,'',NULL,'農藥進字第03085號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 11.000 (%)  ',NULL,'admin','嘉農企業股份有限公司',117),(341,'嘉大銅(氫氧化銅)',3,'',NULL,'農藥製字第04819號',NULL,NULL,NULL,' CUPRIC HYDROXIDE  77.000 (%)',NULL,'admin','臺聯實業股份有限公司',107),(342,'嘉安泰(賽洛寧)',3,'',NULL,'農藥製字第04011號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 1.000  (%)   ',NULL,'admin','嘉泰企業股份有限公司',102),(343,'嘉寧(納乃得)',3,'',NULL,'農藥製字第04826號',NULL,NULL,NULL,' S-methyl N-(methylcarbamoyloxy)thioacetimidate  40.000 (%)',NULL,'admin','臺聯實業股份有限公司',107),(344,'嘉得寧(納乃得)',3,'',NULL,'農藥進字第01585號',NULL,NULL,NULL,' S-methyl N-(methylcarbamoyloxy)thioacetimidate  25.000 (%)',NULL,'admin','瑞福企業有限公司',162),(345,'嘉斯本(陶斯松)',3,'',NULL,'農藥製字第04674號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%)',NULL,'admin','臺聯實業股份有限公司',107),(346,'嘉樂寶(氫氧化銅)',3,'',NULL,'農藥製字第04687號',NULL,NULL,NULL,' CUPRIC HYDROXIDE  37.500 (%)',NULL,'admin','臺聯實業股份有限公司',107),(347,'嘉樂達(鋅錳克絕)',3,'',NULL,'農藥進字第01975號',NULL,NULL,NULL,'(1) 1-(2-cyano-2-methoxyiminoacetyl)-3-ethylurea…8% (2) manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt…64%',NULL,'admin','臺聯實業股份有限公司',107),(348,'嘉泰寧(快得寧)',3,'',NULL,'農藥製字第04182號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 33.500 (%)',NULL,'admin','嘉泰企業股份有限公司',102),(349,'嘉洛寧(賽洛寧)',3,'',NULL,'農藥進字第02580號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.800  (%)  ',NULL,'admin','嘉農企業股份有限公司',117),(350,'嘉潔第一讚(益達胺)',3,'',NULL,'農藥進字第02769號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 18.200 (%)',NULL,'admin','台灣嘉潔股份有限公司',169),(351,'嘉益精(錳乃浦)',3,'',NULL,'農藥製字第04807號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  33.000 (%)',NULL,'admin','嘉農企業股份有限公司',117),(352,'嘉福農(納乃得)',3,'',NULL,'農藥製字第00960號',NULL,NULL,NULL,' S-methyl N-(methylcarbamoyloxy)thioacetimidate  40.000 (%)',NULL,'admin','嘉泰企業股份有限公司',102),(353,'嘉賜銅(農會農化廠)',3,'',NULL,'農藥製字第05988號',NULL,NULL,NULL,'(1) [5-amino-2-methyl-6-(2,3,4,5,6,-pentahydroxycyclohexyloxy) tetrahydropyran-3-yl] amino-α-iminoacetic acid hydrochloride hydrate...5.7% ( Kasugamycin...5% ) (2) copper oxychloride (CU 45%)...75.6%',NULL,'admin','中華民國農會附設各級農會農化廠',131),(354,'嘉速寧(嘉賜快得寧)',3,'',NULL,'農藥製字第06098號',NULL,NULL,NULL,'(1) 1L-1,3,4/2,5,6-1-DEOXY-2,3,4,5,6-PENTAHYDROXYCYCLOHEXYL 2-AMINO-2,3,4,6-TETRADEOXY-4-(α-IMINOGLYCINO)-α-D-ARABINO-HEXOPYRANOSIDE..................3.5% (2) BIS(QUINOLIN-8-OLATO-O,N)COPPER.....................40%',NULL,'admin','國豐化學工業股份有限公司',112),(355,'嘸你ㄟ死(賽速安勃)',3,'原生產商不同',NULL,'農藥進字第02744號 or 農藥進03096號',NULL,NULL,NULL,'(1) 3-(2-chloro-1,3-thiazol-5-ylmethyl)-5-methyl-1,3,5-oxadiazinan-4-ylidene(nitro)amine...200G/L (2) 3-bromo-4’-chloro-1-(3-chloro-2-pyridyl)-2’-methyl-6’-(methylcarbamoyl)pyrazole-5-carboxanilide...100G/L',NULL,'admin','台灣先正達股份有限公司',144),(356,'嘸菌擾(亞托敏)',3,'',NULL,'農藥進字第03043號',NULL,NULL,NULL,'methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','日農科技股份有限公司',105),(357,'噴卡多(乃力松)',3,'',NULL,'農藥製字第04337號',NULL,NULL,NULL,'1,2-DIBROMO-2,2-DICHLOROETHYL DIMETHYL PHOSPHATE  58.000 (%)',NULL,'admin','臺益工業股份有限公司',39),(358,'噴卡省(納乃得)',3,'',NULL,'農藥製字第04289號',NULL,NULL,NULL,' S-methyl N-(methylcarbamoyloxy)thioacetimidate  40.000 (%)',NULL,'admin','臺益工業股份有限公司',39),(359,'噴蟲樂(陶斯松)',3,'',NULL,'農藥進字第00619號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%) ',NULL,'admin','聯利農業科技股份有限公司',103),(360,'嚮馬(得克利)',3,'',NULL,'農藥製字第05214號',NULL,NULL,NULL,'(RS)-1-p-chlorophenyl-4,4-dimethyl-3-(1H-1,2,4-triazol-1- ylmethyl)pentan-3-ol 25.900 (%) ',NULL,'admin','臺聯實業股份有限公司',107),(361,'四季安(氟尼胺)',3,'',NULL,'農藥進字第03359號',NULL,NULL,NULL,'N-cyanomethyl-4-(trifluoromethyl)nicotinamide 10.000 (%)',NULL,'admin','日農科技股份有限公司',105),(362,'四季油(礦物油)',3,'',NULL,'農藥製字第01876號',NULL,NULL,NULL,'ALIPHATIC HYDROCARBONS 95.000 (%)',NULL,'admin','台農三和化工股份有限公司',119),(363,'四季紅(氟尼胺)',3,'',NULL,'農藥進字第02523號',NULL,NULL,NULL,'N-cyanomethyl-4-(trifluoromethyl)nicotinamide 10.000 (%)',NULL,'admin','台灣石原產業股份有限公司',172),(364,'四氯異苯腈(農會農化廠)',3,'',NULL,'農藥製字第06571號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  40.000 (%)',NULL,'admin','中華民國農會附設各級農會農化廠',131),(365,'回生丹(待克利)',3,'',NULL,'農藥製字第05171號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%)    ',NULL,'admin','臺聯實業股份有限公司',107),(366,'因得克虫(因得克)',3,'',NULL,'農藥進字第03322號',NULL,NULL,NULL,' methyl (S)-N-[7-chloro-2,3,4a,5-tetrahydro-4a-(methoxycarbonyl)indeno[1,2-e][1,3,4]oxadiazin-2-ylcarbonyl]-4’-(trifluoromethoxy)carbanilate  14.500 (%)',NULL,'admin','萬得發有限公司',125),(367,'固力旺(賽速安)',3,'',NULL,'農藥進字第03361號',NULL,NULL,NULL,'3-(2-chloro-1,3-thiazol-5-ylmethyl)-5-methyl-1,3,5-oxadiazinan-4-ylidene(nitro)amine 25.000 (%)',NULL,'admin','嘉濱貿易有限公司',111),(368,'固本(本達樂)',3,'',NULL,'農藥製字第05584號',NULL,NULL,NULL,' methyl N-phenylacetyl-N-2,6-xylyl-DL-alaninate  35.000 (%)',NULL,'admin','世大農化工廠股份有限公司	',114),(369,'固根(依得利)',3,'',NULL,'農藥製字第03719號',NULL,NULL,NULL,' ethyl 4-methylthio-m-tolyl isopropylphosphoramidate  10.000 (%)',NULL,'admin','興農股份有限公司',85),(370,'國峰特1號',2,'','有機資審字第105004號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0462027號','蓖麻粕、椰子粕、菜籽粕、咖啡渣、黃豆粕、米糠','全氮4.2%全磷酐2.0%全氧化鉀2.0%有機質65.0%',NULL,'admin','國峰生物科技股份有限公司',47),(371,'國豐寧(快得寧)',3,'',NULL,'農藥製字第04189號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 40.000 (%)  ',NULL,'admin','國豐化學工業股份有限公司',112),(372,'國豐雙讚(亞托待克利)',3,'',NULL,'農藥製字第06119號',NULL,NULL,NULL,'(1) methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate...200 g/L (2) cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1-ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether...125 g/L 325 G/L (32.5% W/V)',NULL,'admin','國豐化學工業股份有限公司',112),(373,'土蟲清(陶斯松)',3,'',NULL,'農藥進字第02011號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 5.000  (%) ',NULL,'admin','合林企業有限公司',166),(374,'土豪',2,'','有機資審字第107007號',NULL,'雜項次量微量要素肥料(4-41)','肥進(微)字第0784026號','雜滷石','全氧化鉀14.0%水溶性氧化鈣12.0%水溶性氧化鎂6.0%',NULL,'admin','良農現代化農業科技股份有限公司',50),(375,'地喜(第滅寧)',3,'',NULL,'農藥進字第01672號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%)',NULL,'admin','瑞泓生技有限公司',184),(376,'地強(托福毆殺滅)',3,'',NULL,'農藥製字第04240號',NULL,NULL,NULL,'(1) S-(TERT-BUTYLTHIO)METHYL-O,O-DIETHYLPHOSPHORODITHIOATE..    ...5%                                                   (2) METHYL-N,N-DIMETHYL-N-(METHYLCARBAMOYLOXY)-1-THIOOXAMIM-    IDATE.....5%',NULL,'admin','興農股份有限公司',85),(377,'地掃(福瑞松)',3,'',NULL,'農藥製字第02027號',NULL,NULL,NULL,' O,O-diethyl S-ethylthiomethyl phosphorodithioate  10.000 (%)',NULL,'admin','興農股份有限公司',85),(378,'地根旺蚵貝粉',2,'','有機資審字第106003號',NULL,'貝殼粉肥料(4-13)','肥製(微)字第0380001號','牡蠣殼','鹼度(以CaO計):45.7%',NULL,'admin','保證責任彰化縣王功農漁牧生產合作社',53),(379,'地球春(菲克利)',3,'',NULL,'農藥製字第05538號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 10.000 (%) ',NULL,'admin','正農化學股份有限公司',130),(380,'地疫斬(本達樂)',3,'',NULL,'農藥製字第05593號',NULL,NULL,NULL,'methyl N-phenylacetyl-N-2,6-xylyl-DL-alaninate  5.000 (%)',NULL,'admin','世大農化工廠股份有限公司	',114),(381,'地神(納乃得)',3,'',NULL,'農藥製字第03311號',NULL,NULL,NULL,' S-methyl N-(methylcarbamoyloxy)thioacetimidate  40.000 (%)',NULL,'admin','惠光股份有限公司',121),(382,'地神(芬滅松)',3,'',NULL,'農藥製字第04278號',NULL,NULL,NULL,'ethyl 4-methylthio-m-tolyl isopropylphosphoramidate  40.000 (%)',NULL,'admin','興農股份有限公司',85),(383,'地虎(納乃得)',3,'',NULL,'農藥製字第03330號',NULL,NULL,NULL,' S-methyl N-(methylcarbamoyloxy)thioacetimidate  40.000 (%)',NULL,'admin','大勝化學工業股份有限公司',110),(384,'報喜(第滅寧)',3,'',NULL,'農藥進字第02345號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.400  (%)',NULL,'admin','易利特開發有限公司',138),(385,'壹定稱(亞托敏)',3,'',NULL,'農藥製字第05959號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','日農科技股份有限公司',105),(386,'壹等勇(阿巴汀)',3,'原生產商不同',NULL,'農藥進字第01934號 or 農藥進字第02273號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%)     ',NULL,'admin','台灣先正達股份有限公司',144),(387,'壹等壹(氟芬隆)',3,'',NULL,'農藥製字第06208號',NULL,NULL,NULL,'1-[4-(2-chloro-α,α,α-trifluoro-p-tolyloxy)-2-fluorophenyl]-3-(2,6-difluorobenzoyl)urea  9.600 (%)',NULL,'admin','興農股份有限公司',85),(388,'壹級好(阿巴汀)',3,'',NULL,'農藥製字第05903號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%)',NULL,'admin','好速化學股份有限公司',118),(389,'壹頂讚(菲克利)',3,'',NULL,'農藥進字第02270號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 5.000  (%) ',NULL,'admin','德方有限公司',175),(390,'外星丹(得芬諾)',3,'',NULL,'農藥製字第05641號',NULL,NULL,NULL,' N-tert-butyl-N’-(4-ethylbenzoyl)-3,5-dimethylbenzohydrazide  70.000 (%)',NULL,'admin','安旺特股份有限公司',120),(391,'多保帝(賽福保淨)',3,'',NULL,'農藥進字第01603號',NULL,NULL,NULL,'(1) (E)-4-chloro-α,α,α-trifluoro-N-(1-imidazol-1-yl-2-propoxyethylidene)-o-toluidine...15% (2) dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate)...45%',NULL,'admin','瑞繐股份有限公司',168),(392,'多保精(甲基多保淨)',3,'',NULL,'農藥製字第04777號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 40.000 (%) ',NULL,'admin','興農股份有限公司',85),(393,'多利仁(賽福座)',3,'',NULL,'農藥製字第03752號',NULL,NULL,NULL,'(E)-4-chloro-α,α,α-trifluoro-N-(1-imidazol-1-yl-2-propoxyethylidene)-o-toluidine 30.000 (%)',NULL,'admin','臺灣庵原農藥股份有限公司',113),(394,'多利旺(錳乃浦)',3,'',NULL,'農藥製字第05547號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','正農化學股份有限公司',130),(395,'多富民(賽福座)',3,'',NULL,'農藥進字第00965號',NULL,NULL,NULL,'(E)-4-chloro-α,α,α-trifluoro-N-(1-imidazol-1-yl-2-propoxyethylidene)-o-toluidine 30.000 (%) ',NULL,'admin','瑞繐股份有限公司',168),(396,'多寶(四氯保淨)',3,'',NULL,'農藥製字第00050號',NULL,NULL,NULL,'(1) dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate)...20% (2) tetrachloroisophthalonitrile...50% 70.000 (%)                             ',NULL,'admin','惠光股份有限公司',121),(397,'多寶健(甲基多保淨)',3,'',NULL,'農藥進字第02248號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 70.000 (%) ',NULL,'admin','高事達農化有限公司',155),(398,'多斃菌(甲基多保淨)',3,'',NULL,'農藥進字第02487號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 40.000 (%)',NULL,'admin','雅飛有限公司',126),(399,'多滅菌(甲基多保淨)',3,'',NULL,'農藥製字第02438號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 70.000 (%)',NULL,'admin','富農化學工業股份有限公司',132),(400,'多猛哥(亞托敏)',3,'',NULL,'農藥進字第02883號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','青山貿易有限公司',147),(401,'多福(納乃得)',3,'',NULL,'農藥進字第03093號',NULL,NULL,NULL,' S-methyl N-(methylcarbamoyloxy)thioacetimidate  40.000 (%)',NULL,'admin','嘉濱貿易有限公司',111),(402,'多福淨(甲基多保淨)',3,'',NULL,'農藥製字第01158號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 70.000 (%)',NULL,'admin','惠光股份有限公司',121),(403,'多福進(甲基多保淨)',3,'',NULL,'農藥製字第02612號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 70.000 (%)  ',NULL,'admin','日農科技股份有限公司',105),(404,'多禧(第滅寧)',3,'',NULL,'農藥進字第02167號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%) ',NULL,'admin','雅飛有限公司',126),(405,'多菌清(甲基多保淨)',3,'',NULL,'農藥製字第02138號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 70.000 (%)',NULL,'admin','興農股份有限公司',85),(406,'夜蛾斯(祿芬隆)',3,'',NULL,'農藥進字第03270號',NULL,NULL,NULL,'(RS)-1-[2,5-dichloro-4-(1,1,2,3,3,3-hexafluoropropoxy)- phenyl]-3-(2,6-difluorobenzoyl)-urea  4.400 (%)',NULL,'admin','安旺特股份有限公司',120),(407,'夠旺穩達達(芬瑞莫)',3,'',NULL,'農藥製字第05160號',NULL,NULL,NULL,'(±)-2,4’-dichloro-α-(pyrimidin-5-yl)benzhydryl alcohol 12.000 (%)',NULL,'admin','臺益工業股份有限公司',39),(408,'大丈夫(亞托敏)',3,'',NULL,'農藥進字第02977號',NULL,NULL,NULL,'methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','聯合農化股份有限公司',150),(409,'大保庇(陶斯松)',3,'',NULL,'農藥製字第06369號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%)',NULL,'admin','洽益化學股份有限公司',108),(410,'大偵探(待克利)',3,'',NULL,'農藥進字第03234號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%)     ',NULL,'admin','青山貿易有限公司',147),(411,'大億丹(福瑞松)',3,'',NULL,'農藥製字第02311號',NULL,NULL,NULL,' O,O-diethyl S-ethylthiomethyl phosphorodithioate  10.000 (%)',NULL,'admin','台灣正豐植保股份有限公司',128),(412,'大克寧(四氯異苯腈)',3,'',NULL,'農藥製字第02034號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  75.000 (%)',NULL,'admin','聯利農業科技股份有限公司',103),(413,'大克寧精(四氯異苯腈)',3,'',NULL,'農藥製字第05258號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  40.000 (%)',NULL,'admin','聯利農業科技股份有限公司',103),(414,'大克寶(加保利)',3,'',NULL,'農藥製字第03084號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 85.000 (%)',NULL,'admin','龍燈生物科技股份有限公司',76),(415,'大克病(四氯異苯腈)',3,'',NULL,'農藥製字第01396',NULL,NULL,NULL,' tetrachloroisophthalonitrile  75.000 (%)',NULL,'admin','中華民國農會附設各級農會農化廠',131),(416,'大克能(四氯異苯腈)',3,'',NULL,'農藥製字第02329號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  75.000 (%)',NULL,'admin','龍燈生物科技股份有限公司',76),(417,'大利多(納得亞滅寧)',3,'',NULL,'農藥製字第04549號',NULL,NULL,NULL,'納乃得 12% 亞滅寧 1.5%',NULL,'admin','大成化學工業股份有限公司',127),(418,'大剋靈精(四氯異苯腈)',3,'',NULL,'農藥製字第06301號',NULL,NULL,NULL,'tetrachloroisophthalonitrile  40.000 (%)',NULL,'admin','台農三和化工股份有限公司',119),(419,'大力(第滅寧)',3,'',NULL,'農藥進字第01588號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%)',NULL,'admin','合林企業有限公司',166),(420,'大勝冬(加保扶)',3,'',NULL,'農藥製字第04466號',NULL,NULL,NULL,'2,3-dihydro-2,2-dimethylbenzofuran-7-yl methylcarbamate  3.000 (%)',NULL,'admin','大勝化學工業股份有限公司',110),(421,'大卡稱(亞托敏)',3,'',NULL,'農藥進字第03383號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','耕得貿易股份有限公司',141),(422,'大可寧(四氯異苯腈)',3,'',NULL,' 農藥進字第00949號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  75.000 (%)',NULL,'admin','生力化學工業股份有限公司',139),(423,'大可靈(四氯異苯腈)',3,'',NULL,'農藥製字第00398號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  75.000 (%)',NULL,'admin','惠光股份有限公司',121),(424,'大可靈精(四氯異苯腈)',3,'',NULL,'農藥製字第05078號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  40.000 (%)',NULL,'admin','惠光股份有限公司',121),(425,'大吉昌(依普同)',3,'',NULL,'農藥進字第03148號',NULL,NULL,NULL,'3-(3,5-dichlorophenyl)-N-isopropyl-2,4-dioxoimidazolidine-1-carboxamide  23.700 (%)',NULL,'admin','大成化學工業股份有限公司',127),(426,'大好丹-銅(腈硫醌銅)',3,'',NULL,'農藥製字第05186號',NULL,NULL,NULL,'(1) 5,10-dihydro-5,10-dioxonaphtho[2,3-b]-1,4-dithiine-2,3-dicarbonitrile...13% (2) dicopper chloride trihydroxide...42% (CU25%)  55.000 (%)',NULL,'admin','富農化學工業股份有限公司',132),(427,'大寧(第滅寧)',3,'',NULL,'農藥製字第03617號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%)',NULL,'admin','龍燈生物科技股份有限公司',76),(428,'大寶天機(蘇力菌)',3,'',NULL,'農藥進字第01375號',NULL,NULL,NULL,' BACILLUS THURINGIENSIS VAR.KURSTAKI  2.3% 1,600IU/MG(1,323DBM UNIT/MG)',NULL,'admin','台灣住友化學股份有限公司',160),(429,'大成發(達滅芬)',3,'',NULL,'農藥進字第03137號',NULL,NULL,NULL,'(E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine  50.000 (%)',NULL,'admin','大成化學工業股份有限公司',127),(430,'大成發－精(達滅芬)',3,'',NULL,'農藥進字第03492號',NULL,NULL,NULL,'(E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine  50.000 (%)',NULL,'admin','大成化學工業股份有限公司',127),(431,'大成禧(第滅寧)',3,'',NULL,'農藥製字第03903號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%) ',NULL,'admin','大成化學工業股份有限公司',127),(432,'大成禧-精(第滅寧)',3,'',NULL,'農藥製字第05854號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%)',NULL,'admin','大成化學工業股份有限公司',127),(433,'大撲殺(畢芬寧)',3,'',NULL,'農藥製字第06235號',NULL,NULL,NULL,'2-methylbiphenyl-3-ylmethyl (Z)-(1RS,3RS)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate  2.500 (%)',NULL,'admin','光華化學股份有限公司',77),(434,'大新４５(錳乃浦)',3,'',NULL,'農藥進字第01933號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','聯合農化股份有限公司',150),(435,'大旺寶(陶斯松)',3,'',NULL,'農藥進字第01104號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 25.000 (%) ',NULL,'admin','全臺農藥有限公司',182),(436,'大昇(錳乃浦)',3,'',NULL,'農藥進字第02592號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','雅飛有限公司',126),(437,'大桔松(馬拉松)',3,'',NULL,'農藥製字第00894號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 50.000 (%)',NULL,'admin','華夏科學農化股份有限公司',106),(438,'大滅松(農會農化廠)',3,'',NULL,'農藥製字第01959號',NULL,NULL,NULL,' O, O-dimethyl-S-methylcarbamoylmethyl phosphorodithioate  20.000 (%)',NULL,'admin','中華民國農會附設各級農會農化廠',131),(439,'大生霸王(錳乃浦)',3,'',NULL,'農藥進字第00192號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  33.000 (%)',NULL,'admin','台灣道禮股份有限公司',174),(440,'大當家(達特南)',3,'',NULL,'農藥進字第03400號',NULL,NULL,NULL,'(RS)-1-methyl-2-nitro-3-(tetrahydro-3-furylmethyl)guanidine 20.000 (%)',NULL,'admin','朝暘生化開發有限公司',171),(441,'大發–Ｍ(錳乃浦)',3,'',NULL,'農藥製字第03192號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric)  80.000 (%)',NULL,'admin','臺灣庵原農藥股份有限公司',113),(442,'大益靈(益滅松)',3,'',NULL,'農藥製字第00447號',NULL,NULL,NULL,' O,O-dimethyl S-phthalimidomethyl phosphorodithioate  50.000 (%)',NULL,'admin','龍燈生物科技股份有限公司',76),(443,'大福精(得芬諾)',3,'',NULL,'農藥製字第06567號',NULL,NULL,NULL,' N-tert-butyl-N’-(4-ethylbenzoyl)-3,5-dimethylbenzohydrazide  19.700 (%)',NULL,'admin','臺聯實業股份有限公司',107),(444,'大福隆(得芬諾)',3,'',NULL,'農藥製字第06586號',NULL,NULL,NULL,' N-tert-butyl-N’-(4-ethylbenzoyl)-3,5-dimethylbenzohydrazide  70.000 (%)',NULL,'admin','臺聯實業股份有限公司',107),(445,'大禧精(第滅寧)',3,'',NULL,'農藥進字第01444號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.400  (%)',NULL,'admin','台灣拜耳股份有限公司',101),(446,'大總管(百克敏)',3,'',NULL,'農藥進字第03480號',NULL,NULL,NULL,'methyl N-{2-[1-(4-chlorophenyl)pyrazol-3-yloxymethyl]phenyl}(N-methoxy)carbamate  23.600 (%)',NULL,'admin','威玖生技有限公司',142),(447,'大美速(大滅松)',3,'',NULL,'農藥製字第00167號',NULL,NULL,NULL,' O, O-dimethyl-S-methylcarbamoylmethyl phosphorodithioate  44.000 (%)',NULL,'admin','惠光股份有限公司',121),(448,'大茂黑基肥',2,'','有機資審字第103018號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0622031號','花生仁殼粕、蓖麻粕、米糠、魚粉、蝦蟹殼粉','全氮4.0%全磷酐1.6%全氧化鉀1.6%有機質75%',NULL,'admin','三木實業有限公司',40),(449,'大蟲松(馬拉松)',3,'',NULL,'農藥製字第04326號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 25.000 (%) ',NULL,'admin','世大農化工廠股份有限公司	',114),(450,'大豐收(賽果培)',3,'',NULL,'農藥製字第06471號',NULL,'(Z)-3-(6-chloro-3-pyridylmethyl)-1,3-thiazolidin-2-ylidenecyanamide 40.400 (%)',NULL,'(Z)-3-(6-chloro-3-pyridylmethyl)-1,3-thiazolidin-2-ylidenecyanamide 40.400 (%)',NULL,'admin','台農三和化工股份有限公司',119),(451,'大贏家(百利普芬)',3,'',NULL,'農藥進字第02911號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 11.000 (%) ',NULL,'admin','萬得發有限公司',125),(452,'大輪(百利普芬)',3,'',NULL,'農藥製字第06144號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 11.000 (%) ',NULL,'admin','臺聯實業股份有限公司',107),(453,'大開殺介(百利普芬)',3,'',NULL,'農藥製字第06182號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 11.000 (%)',NULL,'admin','安旺特股份有限公司',120),(454,'大駭客(待克利)',3,'',NULL,'農藥進字第02939號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%)      ',NULL,'admin','嘉濱貿易有限公司',111),(455,'大龍炮(大滅松)',3,'',NULL,'農藥製字第03486號',NULL,NULL,NULL,' O, O-dimethyl-S-methylcarbamoylmethyl phosphorodithioate  44.000 (%)',NULL,'admin','光華化學股份有限公司',77),(456,'天下無蟲窄域油(礦物油)',3,'','有機資審字第108011號','農藥進字第03427號',NULL,NULL,NULL,'礦物油Aliphatichydrocarbons99%；乳化劑1%',NULL,'admin','良農現代化農業科技股份有限公司',50),(457,'天公掌(益達胺)',3,'',NULL,'農藥進字第02404號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%) ',NULL,'admin','民信有限公司',173),(458,'天劍(賽洛寧)',3,'',NULL,'農藥製字第05118號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.800  (%)   ',NULL,'admin','利台化學工業股份有限公司',116),(459,'天地勇(亞滅培)',3,'',NULL,'農藥製字第05946號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%)',NULL,'admin','國豐化學工業股份有限公司',112),(460,'天威(亞滅培)',3,'',NULL,'農藥製字第04983號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%)  ',NULL,'admin','大勝化學工業股份有限公司',110),(461,'天官(密滅汀)',3,'',NULL,'農藥進字第01743號',NULL,NULL,NULL,'密滅汀 1%',NULL,'admin','大勝化學工業股份有限公司',110),(462,'天寶(腈硫醌)',3,'',NULL,'農藥製字第04937號',NULL,NULL,NULL,' 5,10-dihydro-5,10-dioxonaphtho[2,3-b]-1,4-dithiine-2,3-dicarbonitrile  22.700 (%)',NULL,'admin','興農股份有限公司',85),(463,'天帝掃(益達胺)',3,'',NULL,'農藥製字第04895號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 18.200 (%)',NULL,'admin','興農股份有限公司',85),(464,'天帥(亞滅培)',3,'',NULL,'農藥製字第05480號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%)',NULL,'admin','台灣日產化工股份有限公司',104),(465,'天強(毆殺滅)',3,'',NULL,'農藥製字第04712號',NULL,NULL,NULL,' N,N-dimethyl-2-methylcarbamoyloxyimino-2-(methylthio)acetamide  10.000 (%)',NULL,'admin','興農股份有限公司',85),(466,'天王星(畢芬寧)',3,'',NULL,'農藥製字第04464號',NULL,NULL,NULL,'2-methylbiphenyl-3-ylmethyl (Z)-(1RS,3RS)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate  2.800 (%)',NULL,'admin','世大農化工廠股份有限公司	',114),(467,'天王精(畢芬寧)',3,'',NULL,'農藥製字第06209號',NULL,NULL,NULL,'2-methylbiphenyl-3-ylmethyl (Z)-(1RS,3RS)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate  2.500 (%)',NULL,'admin','華夏科學農化股份有限公司',106),(468,'天生-45(錳乃浦)',3,'',NULL,'農藥製字第01494號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','安旺特股份有限公司',120),(469,'天禧(第滅寧)',3,'',NULL,'農藥進字第02339號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.400  (%) ',NULL,'admin','百泰生物科技股份有限公司',26),(470,'天霸王(錳乃浦)',3,'',NULL,'農藥進字第02687號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','聯合農化股份有限公司',150),(471,'天霸王精(錳乃浦)',3,'',NULL,'農藥進字第03458號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  33.000 (%)',NULL,'admin','松樹國際有限公司',137),(472,'太勇(阿巴汀)',3,'',NULL,'農藥進字第03226號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%)',NULL,'admin','安旺特股份有限公司',120),(473,'太喜(第滅寧)',3,'',NULL,'農藥製字第04534號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%)',NULL,'admin','國豐化學工業股份有限公司',112),(474,'太星(佈飛松)',3,'',NULL,'農藥製字第05044號',NULL,NULL,NULL,'O-4-bromo-2-chlorophenyl O-ethyl S-propyl phosphorothioate 43.000 (%)',NULL,'admin','光華化學股份有限公司',77),(475,'太極(益達胺)',3,'',NULL,'農藥製字第05033號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%)',NULL,'admin','光華化學股份有限公司',77),(476,'太空掌(益達胺)',3,'',NULL,'農藥製字第05157號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%) ',NULL,'admin','華夏科學農化股份有限公司',106),(477,'奕旺牌有機質肥料',2,'','有機資審字第106021號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0702001號','蓖麻粕、菜籽粕、芝麻粕、米糠','全氮6.0%全磷酐2.0%全氧化鉀1.5%有機質80.0%',NULL,'admin','奕翰行',93),(478,'好伶俐(硫敵克)',3,'',NULL,'農藥製字第06326號',NULL,NULL,NULL,'3,7,9,13-tetramethyl-5,11-dioxa-2,8,14-trithia-4,7,9,12-tetra-azapentadeca-3,12-diene-6,10-dione 34.000 (%)',NULL,'admin','日農科技股份有限公司',105),(479,'好作伙 44.9%(陶斯松)',3,'',NULL,'農藥進字第01878號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 44.900 (%)',NULL,'admin','台灣道禮股份有限公司',174),(480,'好作伴 75%(陶斯松)',3,'',NULL,'農藥進字第02146號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 75.000 (%) ',NULL,'admin','台灣道禮股份有限公司',174),(481,'好保利(加保利)',3,'',NULL,'農藥製字第00120號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 85.000 (%)',NULL,'admin','正農化學股份有限公司',130),(482,'好優(派滅淨)',3,'',NULL,'農藥製字第06191號',NULL,NULL,NULL,'(E)-4,5-dihydro-6-methyl-4-(3-pyridylmethyleneamino)-1,2,4- triazin-3(2H)-one 25.000 (%)',NULL,'admin','安旺特股份有限公司',120),(483,'好光景(克凡派)',3,'',NULL,'農藥進字第01793號',NULL,NULL,NULL,'4-bromo-2-(4-chlorophenyl)-1-ethoxymethyl-5-trifluoromethylpyrrole-3-carbonitrile 10.000 (%)',NULL,'admin','台灣巴斯夫股份有限公司',123),(484,'好光采(克凡派)',3,'',NULL,'農藥進字第03541號',NULL,NULL,NULL,'4-bromo-2-(4-chlorophenyl)-1-ethoxymethyl-5-trifluoromethylpyrrole-3-carbonitrile 10.000 (%)',NULL,'admin','朝暘生化開發有限公司',171),(485,'好免貢(加保利)',3,'',NULL,'農藥製字第02967號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 39.500 (%) ',NULL,'admin','好速化學股份有限公司',118),(486,'好利冬(加保扶)',3,'',NULL,'農藥製字第05254號',NULL,NULL,NULL,'2,3-dihydro-2,2-dimethylbenzofuran-7-yl methylcarbamate  3.000 (%)',NULL,'admin','光華化學股份有限公司',77),(487,'好利旺(亞托待克利)',3,'',NULL,'農藥進字第03545號',NULL,NULL,NULL,'(1) methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate...200 g/L (2) cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1-ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether...125 g/L 325 G/L (32.5% W/V)',NULL,'admin','高事達農化有限公司',155),(488,'好利精(待克利)',3,'',NULL,'農藥製字第05491號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%) ',NULL,'admin','東和化學企業股份有限公司',109),(489,'好力力(納乃得)',3,'',NULL,'農藥進字第01772號',NULL,NULL,NULL,' S-methyl N-(methylcarbamoyloxy)thioacetimidate  40.000 (%)',NULL,'admin','海博生技股份有限公司',146),(490,'好力通(三泰芬)',3,'',NULL,'農藥製字第04177號',NULL,NULL,NULL,'1-(4-chlorophenoxy)-3,3-dimethyl-1-(1H-1,2,4-triazol-1-yl)butan-2-one 5.000  (%)  ',NULL,'admin','好速化學股份有限公司',118),(491,'好功夫(賽洛寧)',3,'',NULL,'農藥進字第01844號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 5.000  (%) ',NULL,'admin','台灣先正達股份有限公司',144),(492,'好加讚(亞托待克利)',3,'',NULL,'農藥進字第02554號 or 農藥進字第03135號',NULL,NULL,NULL,'(1) methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate...200 g/L (2) cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1-ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether...125 g/L 325 G/L (32.5% W/V)  ',NULL,'admin','台灣先正達股份有限公司',144),(493,'好助手(賽達松)',3,'',NULL,'農藥製字第00735號',NULL,NULL,NULL,' S-α-ethoxycarbonylbenzyl O,O-dimethyl phosphorodithioate  50.000 (%)',NULL,'admin','臺益工業股份有限公司',39),(494,'好厝邊(陶斯松)',3,'',NULL,'農藥製字第03902號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%)           ',NULL,'admin','台農三和化工股份有限公司',119),(495,'好參祥(賽洛寧)',3,'',NULL,'農藥進字第03065號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.500  (%) ',NULL,'admin','萬得發有限公司',125),(496,'好吉兆(陶斯松)',3,'',NULL,'農藥製字第04849號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 5.000  (%)',NULL,'admin','日農科技股份有限公司',105),(497,'好吉強(陶斯松)',3,'',NULL,'農藥進字第01885號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%) ',NULL,'admin','台灣富美實有限公司',140),(498,'好吉調(菲克利)',3,'',NULL,'農藥製字第05943號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 10.000 (%) ',NULL,'admin','日農科技股份有限公司',105),(499,'好吉馬(馬拉松)',3,'',NULL,' 農藥進字第01248號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 50.000 (%) ',NULL,'admin','台灣富美實有限公司',140),(500,'好嘉在(亞托待克利)',3,'',NULL,'農藥進字第03426號',NULL,NULL,NULL,'(1) methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate...200 g/L (2) cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1-ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether...125 g/L 325 G/L (32.5% W/V)',NULL,'admin','嘉農企業股份有限公司',117),(501,'好威力(白克列)',3,'',NULL,'農藥進字第03390號',NULL,NULL,NULL,'2-chloro-N-(4’-chlorobiphenyl-2-yl)nicotinamide 50.000 (%) ',NULL,'admin','日農科技股份有限公司',105),(502,'好家在(陶斯松)',3,'',NULL,'農藥製字第04058號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 25.000 (%)',NULL,'admin','國豐化學工業股份有限公司',112),(503,'好幫手(加保扶)',3,'',NULL,'農藥製字第03767號',NULL,NULL,NULL,'2,3-dihydro-2,2-dimethylbenzofuran-7-yl methylcarbamate  3.000 (%)',NULL,'admin','臺益工業股份有限公司',39),(504,'好得淨(快得保淨)',3,'',NULL,'農藥製字第03216號',NULL,NULL,NULL,'(1) dimethyl 4,4’-(o-phenylene)bis(3-thioallophanate)...35%(2) bis(quinolin-8-olato-O,N)copper...40%',NULL,'admin','龍燈生物科技股份有限公司',76),(505,'好意-45(錳乃浦)',3,'',NULL,'農藥製字第01441號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','惠光股份有限公司',121),(506,'好搭檔(三泰芬)',3,'',NULL,'農藥製字第04831號',NULL,NULL,NULL,'1-(4-chlorophenoxy)-3,3-dimethyl-1-(1H-1,2,4-triazol-1-yl)butan-2-one 25.000 (%) ',NULL,'admin','洽益化學股份有限公司',108),(507,'好收成4號',2,'','有機資審字第104005號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0335013號','花生殼粉、蓖麻粕、米糠、菸沙、黃豆','全氮4.0%全磷酐2.0%全氧化鉀2.0%有機質68.4%',NULL,'admin','弘裕農產加工廠',45),(508,'好收欣(克收欣)',3,'',NULL,'農藥進字第02587號',NULL,NULL,NULL,' methyl (E)-methoxyimino[2-(o-tolyloxymethyl)phenyl]acetate  50.000 (%)',NULL,'admin','雅飛有限公司',126),(509,'好施期(克凡派)',3,'',NULL,'農藥進字第03395號',NULL,NULL,NULL,'4-bromo-2-(4-chlorophenyl)-1-ethoxymethyl-5-trifluoromethylpyrrole-3-carbonitrile 10.000 (%)  ',NULL,'admin','高事達農化有限公司',155),(510,'好是松(陶斯松)',3,'',NULL,'農藥製字第00152號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 25.000 (%) ',NULL,'admin','龍燈生物科技股份有限公司',76),(511,'好時機(克凡派)',3,'',NULL,'農藥製字第05329號',NULL,NULL,NULL,'4-bromo-2-(4-chlorophenyl)-1-ethoxymethyl-5-trifluoromethylpyrrole-3-carbonitrile 10.000 (%)',NULL,'admin','嘉泰企業股份有限公司',102),(512,'好景氣(克凡派)',3,'',NULL,'農藥進字第03525號',NULL,NULL,NULL,'4-bromo-2-(4-chlorophenyl)-1-ethoxymethyl-5-trifluoromethylpyrrole-3-carbonitrile 10.000 (%) ',NULL,'admin','日農科技股份有限公司',105),(513,'好朋油(礦物油)',3,'',NULL,'農藥製字第02146號',NULL,NULL,NULL,'ALIPHATIC HYDROCARBONS 95.000 (%)',NULL,'admin','光華化學股份有限公司',77),(514,'好本事(陶斯松)',3,'',NULL,'農藥進字第03345號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%)',NULL,'admin','日農科技股份有限公司',105),(515,'好本領(佈飛松)',3,'',NULL,'農藥進字第02154號',NULL,NULL,NULL,'O-4-bromo-2-chlorophenyl O-ethyl S-propyl phosphorothioate 43.000 (%)',NULL,'admin','易利特開發有限公司',138),(516,'好果油(礦物油)',3,'',NULL,'農藥製字第00619號',NULL,NULL,NULL,'ALIPHATIC HYDROCARBONS 95.000 (%)  ',NULL,'admin','利台化學工業股份有限公司',116),(517,'好果穗(得克利)',3,'',NULL,'農藥製字第06535號',NULL,NULL,NULL,'(RS)-1-p-chlorophenyl-4,4-dimethyl-3-(1H-1,2,4-triazol-1- ylmethyl)pentan-3-ol 25.900 (%)',NULL,'admin','興農股份有限公司',85),(518,'好枝春(快得寧)',3,'',NULL,'農藥製字第03900號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 40.000 (%)  ',NULL,'admin','好速化學股份有限公司',118),(519,'好桔青(大滅松)',3,'',NULL,'農藥進字第01779號',NULL,NULL,NULL,' O, O-dimethyl-S-methylcarbamoylmethyl phosphorodithioate  44.000 (%)',NULL,'admin','台灣富美實有限公司',140),(520,'好棒棒(亞托敏)',3,'',NULL,'農藥進字第02979號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','優必樂有限公司',151),(521,'好歡喜(第滅寧)',3,'',NULL,'農藥製字第05820號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.400  (%) ',NULL,'admin','好速化學股份有限公司',118),(522,'好氣派(克凡派)',3,'',NULL,'農藥製字第05364號',NULL,NULL,NULL,'4-bromo-2-(4-chlorophenyl)-1-ethoxymethyl-5-trifluoromethylpyrrole-3-carbonitrile 10.000 (%)  ',NULL,'admin','台灣日產化工股份有限公司',104),(523,'好消息(克凡派)',3,'',NULL,'農藥進字第02855號',NULL,NULL,NULL,'4-bromo-2-(4-chlorophenyl)-1-ethoxymethyl-5-trifluoromethylpyrrole-3-carbonitrile 10.000 (%)   ',NULL,'admin','萬得發有限公司',125),(524,'好清去(克凡派)',3,'',NULL,'農藥製字第05308號',NULL,NULL,NULL,'4-bromo-2-(4-chlorophenyl)-1-ethoxymethyl-5-trifluoromethylpyrrole-3-carbonitrile 10.000 (%) ',NULL,'admin','興農股份有限公司',85),(525,'好清淨(菲克利)',3,'',NULL,'農藥進字第02286號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 5.000  (%) ',NULL,'admin','易利特開發有限公司',138),(526,'好用途(賽滅淨)',3,'',NULL,'農藥製字第06275號',NULL,NULL,NULL,'N-cyclopropyl-1,3,5-triazine-2,4,6-triamine 75.000 (%) ',NULL,'admin','日農科技股份有限公司',105),(527,'好田丹(加保扶)',3,'',NULL,'農藥製字第00183號',NULL,NULL,NULL,'2,3-dihydro-2,2-dimethylbenzofuran-7-yl methylcarbamate  3.000 (%)',NULL,'admin','聯利農業科技股份有限公司',103),(528,'好田地(賽速安勃)',3,'原生產商不同',NULL,'農藥進字第02797號 or 農藥進字第03069號',NULL,NULL,NULL,'(1) 3-(2-chloro-1,3-thiazol-5-ylmethyl)-5-methyl-1,3,5-oxadiazinan-4-ylidene(nitro)amine...20% (2) 3-bromo-4’-chloro-1-(3-chloro-2-pyridyl)-2’-methyl-6’-(methylcarbamoyl)pyrazole-5-carboxanilide...20%',NULL,'admin','台灣先正達股份有限公司',144),(529,'好益丹(益滅松)',3,'',NULL,'農藥製字第04695號',NULL,NULL,NULL,' O,O-dimethyl S-phthalimidomethyl phosphorodithioate  50.000 (%)',NULL,'admin','好速化學股份有限公司',118),(530,'好秧甲(得克利)',3,'',NULL,'農藥製字第05666號',NULL,NULL,NULL,'(RS)-1-p-chlorophenyl-4,4-dimethyl-3-(1H-1,2,4-triazol-1- ylmethyl)pentan-3-ol 25.900 (%) ',NULL,'admin','大勝化學工業股份有限公司',110),(531,'好紋淨(菲克利)',3,'',NULL,'農藥製字第05328號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 10.000 (%) ',NULL,'admin','東和化學企業股份有限公司',109),(532,'好結果(依普同)',3,'',NULL,'農藥進字第02951號',NULL,NULL,NULL,'3-(3,5-dichlorophenyl)-N-isopropyl-2,4-dioxoimidazolidine-1-carboxamide  50.000 (%)',NULL,'admin','日農科技股份有限公司',105),(533,'好絕配(貝芬待克利)',3,'',NULL,'農藥製字第05583號',NULL,NULL,NULL,'(1) METHYL BENZIMIDAZOL-2-YLCARBAMATE...................11.9%(2) CIS,TRANS-3-CHLORO-4-[4-METHYL-2-(1H-1,2,4-TRIAZOL-1-YLMETHYL)-1,3-DIOXOLAN-2-YL)PHENYL-4-CHLOROPHENYL ETHER..5.9% 17.800 (%)',NULL,'admin','東和化學企業股份有限公司',109),(534,'好綠旺(因滅汀)',3,'',NULL,' 農藥進字第02084號',NULL,NULL,NULL,'因滅汀 5%',NULL,'admin','台灣先正達股份有限公司',144),(535,'好美德(福瑞松)',3,'',NULL,'農藥進字第01156號',NULL,NULL,NULL,' O,O-diethyl S-ethylthiomethyl phosphorodithioate  10.000 (%)',NULL,'admin','松樹國際有限公司',137),(536,'好美特(福瑞松)',3,'',NULL,'農藥進字第00224號',NULL,NULL,NULL,' O,O-diethyl S-ethylthiomethyl phosphorodithioate  10.000 (%)',NULL,'admin','東鋒股份有限公司',154),(537,'好膽嘜走(佈飛松)',3,'',NULL,'農藥進字第03262號',NULL,NULL,NULL,'O-4-bromo-2-chlorophenyl O-ethyl S-propyl phosphorothioate 43.000 (%)',NULL,'admin','美商雅柏生活科技有限公司臺灣分公司',148),(538,'好菌淨(快得保淨)',3,'',NULL,'農藥製字第00001號',NULL,NULL,NULL,'(1) dimethyl 4,4’-(o-phenylene)bis(3-thioallophanate)...35%(2) bis(quinolin-8-olato-O,N)copper...40%',NULL,'admin','好速化學股份有限公司',118),(539,'好菜園(賜諾殺)',3,'',NULL,'農藥進字第02014號',NULL,NULL,NULL,'A MIXTURE OF SPINOSYN A AND SPINOSYN D 11.600 (%)',NULL,'admin','台灣道禮股份有限公司',174),(540,'好萬能(納得亞滅寧)',3,'',NULL,'農藥製字第04709號',NULL,NULL,NULL,'納乃得 12% 亞滅寧 1.5%',NULL,'admin','惠大實業股份有限公司',157),(541,'好賽雷(賽速安)',3,'',NULL,'農藥進字第02801號',NULL,NULL,NULL,'3-(2-chloro-1,3-thiazol-5-ylmethyl)-5-methyl-1,3,5-oxadiazinan-4-ylidene(nitro)amine 25.000 (%)',NULL,'admin','雅飛有限公司',126),(542,'好身手(克凡派)',3,'',NULL,'農藥進字第02756號',NULL,NULL,NULL,'4-bromo-2-(4-chlorophenyl)-1-ethoxymethyl-5-trifluoromethylpyrrole-3-carbonitrile 10.000 (%)  ',NULL,'admin','優必樂有限公司',151),(543,'好逗陣(納得亞滅寧)',3,'',NULL,'農藥製字第04719號',NULL,NULL,NULL,'納乃得 12% 亞滅寧 1.5%',NULL,'admin','東和化學企業股份有限公司',109),(544,'好速–４５(錳乃浦)',3,'',NULL,'農藥製字第00468號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','好速化學股份有限公司',118),(545,'好速克利(達克利)',3,'',NULL,'農藥製字第04249號',NULL,NULL,NULL,'(E)-(R)-1-(2,4-DICHLOROPHENYL)-4,4-DIMETHYL-2-(1H-1,2,4-TRIAZ0L-1-YL)PENT-1-EN-3-OL 5.000  (%) ',NULL,'admin','好速化學股份有限公司',118),(546,'好速多(甲基鋅乃浦)',3,'',NULL,'農藥製字第04151號',NULL,NULL,NULL,' polymeric zinc 1,2-propylenebis(dithiocarbamate)  70.000 (%)',NULL,'admin','好速化學股份有限公司',118),(547,'好速大王(錳乃浦)',3,'',NULL,'農藥製字第04741號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  33.000 (%)',NULL,'admin','好速化學股份有限公司',118),(548,'好速家寶(加保利)',3,'',NULL,'農藥製字第00466號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 85.000 (%)',NULL,'admin','好速化學股份有限公司',118),(549,'好速松(陶斯松)',3,'',NULL,'農藥製字第03988號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%)  ',NULL,'admin','好速化學股份有限公司',118),(550,'好速松‧精(陶斯松)',3,'',NULL,'農藥製字第06346號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%) ',NULL,'admin','好速化學股份有限公司',118),(551,'好速油(礦物油)',3,'',NULL,'農藥製字第04749號',NULL,NULL,NULL,'ALIPHATIC HYDROCARBONS 95.000 (%)',NULL,'admin','好速化學股份有限公司',118),(552,'好速滅培(亞滅培)',3,'',NULL,'農藥製字第05707號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%)',NULL,'admin','好速化學股份有限公司',118),(553,'好速滅靈(撲滅寧)',3,'',NULL,'農藥製字第04254號',NULL,NULL,NULL,' N-(3,5-dichlorophenyl)-1,2-dimethylcyclopropane-1,2-dicarboximide  50.000 (%)',NULL,'admin','好速化學股份有限公司',118),(554,'好速特甲菌(甲基多保淨)',3,'',NULL,'農藥製字第02966號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 70.000 (%)',NULL,'admin','好速化學股份有限公司',118),(555,'好運到(克收欣)',3,'',NULL,'農藥進字第01814號',NULL,NULL,NULL,' methyl (E)-methoxyimino[2-(o-tolyloxymethyl)phenyl]acetate  50.000 (%)',NULL,'admin','台灣巴斯夫股份有限公司',123),(556,'好達寧(四氯異苯腈)',3,'',NULL,'農藥製字第02266號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  75.000 (%)',NULL,'admin','好速化學股份有限公司',118),(557,'好醫生(錳乃浦)',3,'',NULL,'農藥製字第05909號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  33.000 (%)',NULL,'admin','日農科技股份有限公司',105),(558,'好銹紋(菲克利)',3,'',NULL,'農藥製字第05101號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 10.000 (%)',NULL,'admin','好速化學股份有限公司',118),(559,'好雷菌(腈硫醌)',3,'',NULL,'農藥製字第05021號',NULL,NULL,NULL,' 5,10-dihydro-5,10-dioxonaphtho[2,3-b]-1,4-dithiine-2,3-dicarbonitrile  22.700 (%)',NULL,'admin','臺益工業股份有限公司',39),(560,'好靈光(硫敵克)',3,'',NULL,'農藥進字第03437號',NULL,NULL,NULL,'3,7,9,13-tetramethyl-5,11-dioxa-2,8,14-trithia-4,7,9,12-tetra-azapentadeca-3,12-diene-6,10-dione 34.000 (%)',NULL,'admin','日農科技股份有限公司',105),(561,'好靠山(克凡派)',3,'',NULL,'農藥製字第06558號',NULL,NULL,NULL,'4-bromo-2-(4-chlorophenyl)-1-ethoxymethyl-5-trifluoromethylpyrrole-3-carbonitrile 10.000 (%)',NULL,'admin','好速化學股份有限公司',118),(562,'好順利(益滅松)',3,'',NULL,'農藥進字第00145號',NULL,NULL,NULL,' O,O-dimethyl S-phthalimidomethyl phosphorodithioate  50.000 (%)',NULL,'admin','高事達農化有限公司',155),(563,'好馬力(馬拉松)',3,'',NULL,'農藥製字第00490號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 50.000 (%)  ',NULL,'admin','光華化學股份有限公司',77),(564,'好馬松(馬拉松)',3,'',NULL,'農藥製字第00469號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 50.000 (%)  ',NULL,'admin','好速化學股份有限公司',118),(565,'如來掌(益達胺)',3,'',NULL,'農藥製字第05196號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%)',NULL,'admin','瑞芳植物保護股份有限公司',115),(566,'如來神功(賽洛寧)',3,'',NULL,'農藥製字第05150號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.800  (%)   ',NULL,'admin','華夏科學農化股份有限公司',106),(567,'如來神掌 2%(益達胺)',3,'',NULL,'農藥製字第05361號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 2.000  (%)',NULL,'admin','聯利農業科技股份有限公司',103),(568,'如來神掌 9.6%(益達胺)',3,'',NULL,'農藥製字第05174號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%)',NULL,'admin','聯利農業科技股份有限公司',103),(569,'妥凍(快得克絕)',3,'',NULL,'農藥製字第04305號',NULL,NULL,NULL,'(1) BIS(QUINOLIN-8-OLATO-O,N)COPPER...40%(2) 1-(2-CYANO-2-METHOXYIMINOACETYL)3-ETHYLUREA...8%',NULL,'admin','興農股份有限公司',85),(570,'妥普淨(甲基多保淨)',3,'',NULL,'農藥製字第00969號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 70.000 (%) ',NULL,'admin','臺益工業股份有限公司',39),(571,'妥普精(甲基多保淨)',3,'',NULL,'農藥製字第05137號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 40.000 (%)',NULL,'admin','聯利農業科技股份有限公司',103),(572,'妥當勇(阿巴汀)',3,'',NULL,'農藥進字第03353號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%)',NULL,'admin','日農科技股份有限公司',105),(573,'妥白絲(平克座)',3,'',NULL,'農藥製字第04982號',NULL,NULL,NULL,'1-(2,4-dichloro-β-propylphenethyl)-1H-1,2,4-triazole 10.500 (%)   ',NULL,'admin','世大農化工廠股份有限公司	',114),(574,'姜子牙(賽洛寧)',3,'',NULL,'農藥製字第05875號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 5.000  (%)',NULL,'admin','洽益化學股份有限公司',108),(575,'威力旺(白克列)',3,'',NULL,'農藥進字第02319號',NULL,NULL,NULL,'2-chloro-N-(4’-chlorobiphenyl-2-yl)nicotinamide 50.000 (%)    ',NULL,'admin','台灣巴斯夫股份有限公司',123),(576,'威星(護矽得)',3,'',NULL,'農藥進字第02476號',NULL,NULL,NULL,'bis(4-fluorophenyl)(methyl)(1H-1,2,4-triazol-1-ylmethyl)silane 37.000 (%) ',NULL,'admin','雅飛有限公司',126),(577,'威生寶－４５(錳乃浦)',3,'',NULL,'農藥進字第03006號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','益欣股份有限公司',176),(578,'威生４５(錳乃浦)',3,'',NULL,'農藥進字第03534號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','威玖生技有限公司',142),(579,'威震百方(百克敏)',3,'',NULL,'農藥進字第03538號',NULL,NULL,NULL,'methyl N-{2-[1-(4-chlorophenyl)pyrazol-3-yloxymethyl]phenyl}(N-methoxy)carbamate  23.600 (%)',NULL,'admin','東鋒股份有限公司',154),(580,'威風精(第滅寧)',3,'',NULL,'農藥製字第05511號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.400  (%)',NULL,'admin','正農化學股份有限公司',130),(581,'守護者(亞托敏)',3,'',NULL,'農藥進字第03235號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','東鋒股份有限公司',154),(582,'安久多(甲基鋅乃浦)',3,'',NULL,'農藥製字第02123號',NULL,NULL,NULL,' polymeric zinc 1,2-propylenebis(dithiocarbamate)  70.000 (%)',NULL,'admin','利台化學工業股份有限公司',116),(583,'安全多(甲基鋅乃浦)',3,'',NULL,'農藥進字第02517號',NULL,NULL,NULL,' polymeric zinc 1,2-propylenebis(dithiocarbamate)  70.000 (%)',NULL,'admin','嘉農企業股份有限公司',117),(584,'安多寶淨(甲基多保淨)',3,'',NULL,'農藥製字第06219號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 40.000 (%)',NULL,'admin','安旺特股份有限公司',120),(585,'安大收(甲基鋅乃浦) (台灣拜耳)',3,'',NULL,'農藥進字第02303號',NULL,NULL,NULL,' polymeric zinc 1,2-propylenebis(dithiocarbamate)  70.000 (%)',NULL,'admin','台灣拜耳股份有限公司',101),(586,'安大收(甲基鋅乃浦) (興農)',3,'',NULL,'農藥製字第01194號',NULL,NULL,NULL,' polymeric zinc 1,2-propylenebis(dithiocarbamate)  70.000 (%)',NULL,'admin','興農股份有限公司',85),(587,'安太歲(賽普洛)',3,'',NULL,'農藥進字第03190號',NULL,NULL,NULL,'4-cyclopropyl-6-methyl-N-phenylpyrimidin-2-amine 50.000 (%)     ',NULL,'admin','萬得發有限公司',125),(588,'安得利(納乃得)',3,'',NULL,'農藥進字第01241號',NULL,NULL,NULL,' S-methyl N-(methylcarbamoyloxy)thioacetimidate  40.000 (%)',NULL,'admin','正農化學股份有限公司',130),(589,'安心多(甲基鋅乃浦)',3,'',NULL,'農藥進字第03212號',NULL,NULL,NULL,' polymeric zinc 1,2-propylenebis(dithiocarbamate)  70.000 (%)',NULL,'admin','優必樂有限公司',151),(590,'安心寶',3,'','有機資審字第 101008 號','農藥製字第 05148 號',NULL,NULL,NULL,'純白鏈黴菌素 Fermentation metabolites of Streptomyces candidus of Y21007-2 700 PCU/g',NULL,'admin','百泰生物科技股份有限公司',26),(591,'安心１００(甲基鋅乃浦)',3,'',NULL,'農藥進字第02868號',NULL,NULL,NULL,' polymeric zinc 1,2-propylenebis(dithiocarbamate)  70.000 (%)',NULL,'admin','海博生技股份有限公司',146),(592,'安收多(甲基鋅乃浦)',3,'',NULL,'農藥進字第00373號',NULL,NULL,NULL,' polymeric zinc 1,2-propylenebis(dithiocarbamate)  70.000 (%)',NULL,'admin','台灣拜耳股份有限公司',101),(593,'安普落(布芬淨)',3,'',NULL,'農藥進字第01574號',NULL,NULL,NULL,'(Z)-2-tert-butylimino-3-isopropyl-5-phenyl-1, 3, 5-thiadiazinan-4-one 25.000 (%) ',NULL,'admin','易利特開發有限公司',138),(594,'安果寧(菲克利)',3,'',NULL,'農藥製字第05015號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 5.000  (%) ',NULL,'admin','嘉農企業股份有限公司',117),(595,'安滅樂(菲克利)',3,'',NULL,'農藥進字第01112號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 5.000  (%) ',NULL,'admin','台灣先正達股份有限公司',144),(596,'安疽樂葉(甲基鋅乃浦)',3,'',NULL,'農藥進字第03518號',NULL,NULL,NULL,' polymeric zinc 1,2-propylenebis(dithiocarbamate)  70.000 (%)',NULL,'admin','松樹國際有限公司',137),(597,'安穩收(甲基鋅乃浦)',3,'',NULL,'農藥進字第03513號',NULL,NULL,NULL,' polymeric zinc 1,2-propylenebis(dithiocarbamate)  70.000 (%)',NULL,'admin','雅飛有限公司',126),(598,'安農-百利普芬(百利普芬)',3,'',NULL,'農藥進字第03014號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 0.500  (%) ',NULL,'admin','萬得發有限公司',125),(599,'安農松(陶斯松)',3,'',NULL,'農藥進字第02641號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%)   ',NULL,'admin','安農股份有限公司',156),(600,'安農白大生(甲基鋅乃浦)',3,'',NULL,'農藥進字第03332號',NULL,NULL,NULL,' polymeric zinc 1,2-propylenebis(dithiocarbamate)  70.000 (%)',NULL,'admin','安農股份有限公司',156),(601,'富貴紅(甲基鋅乃浦)',3,'',NULL,'農藥進字第02934號',NULL,NULL,NULL,' polymeric zinc 1,2-propylenebis(dithiocarbamate)  70.000 (%)',NULL,'admin','嘉濱貿易有限公司',111),(602,'富貴通(三泰芬)',3,'',NULL,'農藥進字第01689號',NULL,NULL,NULL,'1-(4-chlorophenoxy)-3,3-dimethyl-1-(1H-1,2,4-triazol-1-yl)butan-2-one 25.000 (%)',NULL,'admin','合林企業有限公司',166),(603,'富農冬(加保扶)',3,'',NULL,'農藥製字第03409號',NULL,NULL,NULL,'2,3-dihydro-2,2-dimethylbenzofuran-7-yl methylcarbamate  3.000 (%)',NULL,'admin','富農化學工業股份有限公司',132),(604,'富農夏油(礦物油)',3,'',NULL,'農藥製字第00878號',NULL,NULL,NULL,'ALIPHATIC HYDROCARBONS 95.000 (%)  ',NULL,'admin','富農化學工業股份有限公司',132),(605,'富農大生(錳乃浦)',3,'',NULL,'農藥進字第03222號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','富農化學工業股份有限公司',132),(606,'富農星(護矽得)',3,'',NULL,'農藥進字第02546號',NULL,NULL,NULL,'bis(4-fluorophenyl)(methyl)(1H-1,2,4-triazol-1-ylmethyl)silane 37.000 (%)',NULL,'admin','萬得發有限公司',125),(607,'富雨(陶斯松)',3,'',NULL,'農藥製字第04056號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%)   ',NULL,'admin','大勝化學工業股份有限公司',110),(608,'富靈(納乃得)',3,'',NULL,'農藥製字第02221號',NULL,NULL,NULL,' S-methyl N-(methylcarbamoyloxy)thioacetimidate  40.000 (%)',NULL,'admin','嘉農企業股份有限公司',117),(609,'寶剋力(待克利)',3,'',NULL,'農藥進字第02432號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%) ',NULL,'admin','鴻鋒化學有限公司',134),(610,'寶剋菌(百克敏)',3,'',NULL,'農藥進字第03296號',NULL,NULL,NULL,' methyl N-{2-[1-(4-chlorophenyl)pyrazol-3-yloxymethyl]phenyl}(N-methoxy)carbamate  23.600 (%)',NULL,'admin','日農科技股份有限公司',105),(611,'寶囍(第滅寧)',3,'',NULL,'農藥進字第02223號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%) ',NULL,'admin','瑞福企業有限公司',162),(612,'寶多利(四克利)',3,'',NULL,'農藥製字第06323號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-3-(1H-1,2,4-triazol-1-yl)propyl 1,1,2,2-tetrafluoroethyl ether 11.600 (%) ',NULL,'admin','聯利農業科技股份有限公司',103),(613,'寶島牌同安有夠勇',2,'','有機資審字第102012號',NULL,'植物渣粕肥料(5-01)','肥製(質)字第0622012號','菜籽粕、芝麻粕、椰子粕、蓖麻粕、黃豆粉、米糠','全氮5.5%全磷酐2.5%全氧化鉀2.1%有機質90%',NULL,'admin','三木實業有限公司',40),(614,'寶島牌有夠大',2,'','有機資審字第108013號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0738034號','蓖麻粕、芝麻粕、花生粕、米糠、棕梠灰、肉骨粉、蟹殼粉','全氮4.3%全磷酐2.3%全氧化鉀6.3%有機質70.0%',NULL,'admin','豫豐實業有限公司',54),(615,'寶島牌甜美肥',2,'','有機資審字第108012號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0738033號','蓖麻粕、菜子粕、芝麻粕、米糠、棕梠灰、骨粉、蟹殼粉、蚵殼粉','全氮3.5%全磷酐5.0%全氧化鉀5.0%有機質65.0%',NULL,'admin','豫豐實業有限公司',54),(616,'寶正發(達滅芬)',3,'',NULL,'農藥進字第03402號',NULL,NULL,NULL,'(E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine  50.000 (%)',NULL,'admin','日農科技股份有限公司',105),(617,'寶禧(第滅寧)',3,'',NULL,'農藥進字第01567號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%)   ',NULL,'admin','耕得貿易股份有限公司',141),(618,'寶立旺(貝芬四克利)',3,'',NULL,'農藥製字第06546號',NULL,NULL,NULL,'(1) methyl benzimidazol-2-ylcarbamate...13.39% (2) (RS)-2-(2,4-dichlorophenyl)-3-(1H-1,2,4-triazol-1-yl)propyl 1,1,2,2-tetrafluoroethyl ether...11.16%',NULL,'admin','聯利農業科技股份有限公司',103),(619,'寶粒讚(撲克拉錳)',3,'',NULL,'農藥製字第06572號',NULL,NULL,NULL,'N-propyl-N-[2-(2,4,6-trichlorophenoxy)ethyl]imidazole-1-carboxamide complex with manganese(II) chloride 50.000 (%) ',NULL,'admin','洽益化學股份有限公司',108),(620,'寶綠展(撲克拉錳)',3,'',NULL,'農藥進字第03416號',NULL,NULL,NULL,'N-propyl-N-[2-(2,4,6-trichlorophenoxy)ethyl]imidazole-1-carboxamide complex with manganese(II) chloride 50.000 (%) ',NULL,'admin','日農科技股份有限公司',105),(621,'寶綠新(克收欣)',3,'',NULL,'農藥進字第03364號',NULL,NULL,NULL,' methyl (E)-methoxyimino[2-(o-tolyloxymethyl)phenyl]acetate  44.200 (%)',NULL,'admin','日農科技股份有限公司',105),(622,'寶農收(馬拉松)',3,'',NULL,'農藥製字第00482號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 50.000 (%) ',NULL,'admin','惠光股份有限公司',121),(623,'寶運旺(克收欣)',3,'',NULL,'農藥製字第06291號',NULL,NULL,NULL,'methyl (E)-methoxyimino[2-(o-tolyloxymethyl)phenyl]acetate 44.200 (%)',NULL,'admin','日農科技股份有限公司',105),(624,'寶馬(亞托待克利)',3,'',NULL,'農藥製字第06198號',NULL,NULL,NULL,'(1) methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate...200 g/L (2) cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1-ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether...125 g/L',NULL,'admin','好速化學股份有限公司',118),(625,'尅冬螟(益滅松)',3,'',NULL,'農藥製字第04701號',NULL,NULL,NULL,' O,O-dimethyl S-phthalimidomethyl phosphorodithioate  50.000 (%)',NULL,'admin','瑞芳植物保護股份有限公司',115),(626,'尅土菌(依得利)',3,'',NULL,'農藥進字第00498號',NULL,NULL,NULL,' ethyl 3-trichloromethyl-1,2,4-thiadiazol-5-yl ether  35.000 (%)',NULL,'admin','聯合農化股份有限公司',150),(627,'尅地菌(依得利)',3,'',NULL,'農藥進字第00499號',NULL,NULL,NULL,' ethyl 3-trichloromethyl-1,2,4-thiadiazol-5-yl ether  25.000 (%)',NULL,'admin','聯合農化股份有限公司',150),(628,'專治蟲(陶斯松)',3,'',NULL,'農藥製字第04026號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 25.000 (%) ',NULL,'admin','嘉泰企業股份有限公司',102),(629,'對罩時(菲克利)',3,'',NULL,'農藥進字第02169號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 5.000  (%) ',NULL,'admin','臺聯實業股份有限公司',107),(630,'小灰俠(撲滅寧)',3,'',NULL,'農藥製字第06342號',NULL,NULL,NULL,' N-(3,5-dichlorophenyl)-1,2-dimethylcyclopropane-1,2-dicarboximide  50.000 (%)',NULL,'admin','臺灣庵原農藥股份有限公司',113),(631,'小當家(可尼丁)',3,'',NULL,'農藥進字第03175號',NULL,NULL,NULL,'(E)-1-(2-chloro-1,3-thiazol-5-ylmethyl)-3-methyl-2- nitroguanidine 16.000 (%) ',NULL,'admin','朝暘生化開發有限公司',171),(632,'尚丁真(百利普芬)',3,'',NULL,'農藥製字第06431號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 11.000 (%)',NULL,'admin','臺益工業股份有限公司',39),(633,'尚介殺(百利普芬)',3,'',NULL,'農藥製字第06199號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 11.000 (%)  ',NULL,'admin','日農科技股份有限公司',105),(634,'尚介稱(亞托敏)',3,'',NULL,'農藥進字第02878號',NULL,NULL,NULL,'methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','海博生技股份有限公司',146),(635,'尚介蝨(百利普芬)',3,'',NULL,'農藥製字第06476號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 11.000 (%)',NULL,'admin','富農化學工業股份有限公司',132),(636,'尚介讚(納得亞滅寧)',3,'',NULL,'農藥製字第04547號',NULL,NULL,NULL,'納乃得 12% 亞滅寧 1.5%',NULL,'admin','利台化學工業股份有限公司',116),(637,'尚優秀(菲克利)',3,'',NULL,'農藥進字第02071號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 5.000  (%) ',NULL,'admin','嘉濱貿易有限公司',111),(638,'尚勇(益滅賽寧)',3,'',NULL,'農藥製字第04523號',NULL,NULL,NULL,'(1)O,O-dimethyl S-phthalimidomethyl phosphorodithioate…30%  (2)(RS)-α-cyano-3-phenoxybenzyl(1RS)-cis-trans-3-(2,2-dichlorovinyl)-2,2-dimethyl cyclopropanecarboxylate …10%',NULL,'admin','東和化學企業股份有限公司',109),(639,'尚勇保淨(甲基多保淨)',3,'',NULL,'農藥製字第06188號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 40.000 (%) ',NULL,'admin','台農三和化工股份有限公司',119),(640,'尚托檔(四氯保淨)',3,'',NULL,'農藥製字第05350號','',NULL,NULL,'(1) dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate)...20% (2) tetrachloroisophthalonitrile...50% 70.000 (%)   ',NULL,'admin','興農股份有限公司',85),(641,'尚方寶劍(因滅汀)',3,'',NULL,'農藥製字第05647號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','安旺特股份有限公司',120),(642,'尚發(達滅芬)',3,'',NULL,'農藥進字第02511號',NULL,NULL,NULL,'(E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine  50.000 (%)',NULL,'admin','雅飛有限公司',126),(643,'尚穩(因滅汀)',3,'',NULL,'農藥進字第02912號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','嘉農企業股份有限公司',117),(644,'尚紅(腈硫醌)',3,'',NULL,'農藥製字第05826號',NULL,NULL,NULL,'5,10-dihydro-5,10-dioxonaphtho[2,3-b]-1,4-dithiine-2,3-dicarbonitrile 70.000 (%)   ',NULL,'admin','臺聯實業股份有限公司',107),(645,'尚興(普拔克)',3,'',NULL,'農藥進字第01968號',NULL,NULL,NULL,' propyl 3-(dimethylamino)propylcarbamate hydrochloride  66.500 (%)',NULL,'admin','臺聯實業股份有限公司',107),(646,'尚蓋勇(阿巴汀)',3,'',NULL,'農藥製字第06486號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%) ',NULL,'admin','眾益農業生技股份有限公司',124),(647,'尚蓋讚(亞托待克利)',3,'',NULL,'農藥製字第06079號',NULL,NULL,NULL,'(1) methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate...200 g/L (2) cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1-ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether...125 g/L 325 G/L (32.5% W/V) ',NULL,'admin','嘉農企業股份有限公司',117),(648,'尚讚牌6號',2,'','有機資審字第107013號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0344033號','芝麻粕、米糠、椰纖、蓖麻粕、油棕灰','全氮6.0%全磷酐3.0%全氧化鉀3.0%有機質84.0%',NULL,'admin','台灣阿米諾酸股份有限公司',61),(649,'尚讚牌8號',2,'105/4/28首次遴選通過106/10/23該產品成分鋅超過250mg/kg、銅超過100mg/kg，無法符合「肥料管理法」規定，遴選終止108/01/14第二次遴選通過','有機資審字第107033號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0344027號','蓖麻粕、芝麻粕、花生殼、油棕灰、米糠','全氮5.3%全磷酐3.5%全氧化鉀2.5%有機質86.7%',NULL,'admin','台灣阿米諾酸股份有限公司',61),(650,'尚賜配(蘇力菌)',3,'',NULL,'農藥進字第01080號',NULL,NULL,NULL,' BACILLUS THURINGIENSIS SUBSPECIES KURSTAKI SOLIDS, SPORES AND LEPIDOPTERAN ACTIVE TOXINS(32,000 IU/MG)  85.000 (%)',NULL,'admin','安農股份有限公司',156),(651,'尚青(快得保淨)',3,'',NULL,'農藥製字第04724號',NULL,NULL,NULL,'(1) dimethyl 4,4’-(o-phenylene)bis(3-thioallophanate)...35%(2) bis(quinolin-8-olato-O,N)copper...40%',NULL,'admin','臺聯實業股份有限公司',107),(652,'尬意－４５(錳乃浦)',3,'',NULL,'農藥進字第02887號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','惠光股份有限公司',121),(653,'屠蟲刀苦楝油',3,'','有機資審字第105013號','植保製字第00003號',NULL,NULL,NULL,'苦楝油',NULL,'admin','良農現代化農業科技股份有限公司',50),(654,'嶺先牌根寶',2,'','有機資審字第103007號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0217020號','腐熟樹皮、蝦殼蟹粉、骨粉、菜籽粕、油桐灰、蓖麻粕','全氮4.5%全磷酐6.0%全氧化鉀4.0%有機質50%',NULL,'admin','嶺先興業股份有限公司',37),(655,'嶺先牌活力肥',2,'103/4/25首次遴選通過105/10/13主成分有機質及水分不符規定，遴選終止107/4/18第二次遴選通過','有機資審字第107004號',NULL,'一般堆肥(5-10)','肥製(質)字第0217019號','腐熟樹皮、木屑、米糠、菜籽粕','全氮2.0% 全磷酐10.% 全氧化鉀1.0% 有機質50.0%',NULL,'admin','嶺先興業股份有限公司',37),(656,'嶺峰牌-農得寶',2,'','有機資審字第106006號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0217024號','腐熟樹皮、菜子粕、蓖麻粕、骨粉、棕櫚灰','全氮4.0%全磷酐3.0%全氧化鉀3.0%有機質70.0%',NULL,'admin','嶺先興業股份有限公司',37),(657,'嶺峰牌-農得寶1號',2,'','有機資審字第106007號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0217025號','菜子粕、棉子粕、蝦蟹殼粉、骨粉、棕櫚灰','全氮6.0%全磷酐3.0%全氧化鉀3.0%有機質75.0%',NULL,'admin','嶺先興業股份有限公司',37),(658,'嶺峰牌-農得寶2號',2,'','有機資審字第106008號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0217026號','黃豆粉、菜子粕、蝦蟹殼粉、泥炭、骨粉、棕櫚灰','全氮4.0%全磷酐3.5%全氧化鉀6.0%有機質70.0%',NULL,'admin','嶺先興業股份有限公司',37),(659,'巧實勇(阿巴汀)',3,'',NULL,'農藥製字第05415號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%) ',NULL,'admin','台灣日產化工股份有限公司',104),(660,'巧是猛(待克利)',3,'',NULL,'農藥製字第05608號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 10.000 (%) ',NULL,'admin','興農股份有限公司',85),(661,'巴勝(布芬淨)',3,'',NULL,'農藥製字第05253號',NULL,NULL,NULL,'(Z)-2-tert-butylimino-3-isopropyl-5-phenyl-1, 3, 5-thiadiazinan-4-one 40.000 (%)',NULL,'admin','聯利農業科技股份有限公司',103),(662,'巴斯丹精(克收欣)',3,'',NULL,'農藥進字第01813號',NULL,NULL,NULL,' methyl (E)-methoxyimino[2-(o-tolyloxymethyl)phenyl]acetate  44.200 (%)',NULL,'admin','台灣巴斯夫股份有限公司',123),(663,'巴面通(阿巴汀)',3,'',NULL,'農藥製字第04896號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%)                        ',NULL,'admin','興農股份有限公司',85),(664,'希特樂(賽滅淨)',3,'',NULL,'農藥製字第06241號',NULL,NULL,NULL,'N-cyclopropyl-1,3,5-triazine-2,4,6-triamine 75.000 (%)',NULL,'admin','臺聯實業股份有限公司',107),(665,'帝寶(第滅寧)',3,'',NULL,'農藥製字第05235號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.400  (%)',NULL,'admin','富農化學工業股份有限公司',132),(666,'帝滅寧(第滅寧)',3,'',NULL,'農藥製字第04014號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%) ',NULL,'admin','富農化學工業股份有限公司',132),(667,'帝美年(第滅寧)',3,'',NULL,'農藥製字第01900號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%)',NULL,'admin','安旺特股份有限公司',120),(668,'帶安分(達滅芬)',3,'',NULL,'農藥製字第05606號',NULL,NULL,NULL,'(E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine  50.000 (%)',NULL,'admin','東和化學企業股份有限公司',109),(669,'常發(達滅芬)',3,'',NULL,'農藥製字第05407號',NULL,NULL,NULL,'(E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine  50.000 (%)',NULL,'admin','台灣日產化工股份有限公司',104),(670,'常蓋寧(佈飛松)',3,'',NULL,'農藥製字第06110號',NULL,NULL,NULL,'O-4-bromo-2-chlorophenyl O-ethyl S-propyl phosphorothioate 43.000 (%)',NULL,'admin','臺聯實業股份有限公司',107),(671,'年年好運(克收欣)',3,'',NULL,'農藥製字第06339號',NULL,NULL,NULL,'methyl (E)-methoxyimino[2-(o-tolyloxymethyl)phenyl]acetate 44.200 (%)',NULL,'admin','華夏科學農化股份有限公司',106),(672,'幾霸芬(百利普芬)',3,'',NULL,'農藥製字第06053號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 11.000 (%)  ',NULL,'admin','興農股份有限公司',85),(673,'庵原佈飛松(佈飛松)',3,'',NULL,'農藥製字第05684號',NULL,NULL,NULL,'O-4-bromo-2-chlorophenyl O-ethyl S-propyl phosphorothioate 43.000 (%) ',NULL,'admin','臺灣庵原農藥股份有限公司',113),(674,'庵原克凡派(克凡派)',3,'',NULL,'農藥製字第06547號',NULL,NULL,NULL,'4-bromo-2-(4-chlorophenyl)-1-ethoxymethyl-5-trifluoromethylpyrrole-3-carbonitrile 10.000 (%) ',NULL,'admin','臺灣庵原農藥股份有限公司',113),(675,'庵原大滅松(大滅松)',3,'',NULL,'農藥製字第00412號',NULL,NULL,NULL,' O, O-dimethyl-S-methylcarbamoylmethyl phosphorodithioate  44.000 (%)',NULL,'admin','臺灣庵原農藥股份有限公司',113),(676,'庵原達克靈(四氯異苯腈)',3,'',NULL,'農藥製字第01213號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  75.000 (%)',NULL,'admin','臺灣庵原農藥股份有限公司',113),(677,'庵原達克靈.精(四氯異苯腈)',3,'',NULL,'農藥製字第04985號',NULL,NULL,NULL,'tetrachloroisophthalonitrile  40.000 (%)',NULL,'admin','臺灣庵原農藥股份有限公司',113),(678,'庵原阿巴汀(阿巴汀)',3,'',NULL,'農藥製字第05637號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%) ',NULL,'admin','臺灣庵原農藥股份有限公司',113),(679,'庵原靈(納乃得)',3,'',NULL,'農藥製字第05703號',NULL,NULL,NULL,' S-methyl N-(methylcarbamoyloxy)thioacetimidate  40.000 (%)',NULL,'admin','臺灣庵原農藥股份有限公司',113),(680,'弄綜通(達滅芬)',3,'',NULL,'農藥製字第06576號',NULL,NULL,NULL,'(E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine  50.000 (%)',NULL,'admin','大勝化學工業股份有限公司',110),(681,'強力殺(益達胺)',3,'',NULL,'農藥製字第04973號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%) ',NULL,'admin','臺灣庵原農藥股份有限公司',113),(682,'強強滾 40.8%(陶斯松)',3,'',NULL,'農藥製字第06336號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%) ',NULL,'admin','立農化學股份有限公司',143),(683,'強強滾 75%(陶斯松)',3,'',NULL,'農藥進字第03239號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 75.000 (%)',NULL,'admin','美商雅柏生活科技有限公司臺灣分公司',148),(684,'強必勇(亞滅培)',3,'',NULL,'農藥製字第05435號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%)',NULL,'admin','億豐農化廠股份有限公司',122),(685,'強效 25%(布芬淨)',3,'',NULL,'農藥進字第03254號',NULL,NULL,NULL,'(Z)-2-tert-butylimino-3-isopropyl-5-phenyl-1, 3, 5-thiadiazinan-4-one 25.000 (%)',NULL,'admin','安旺特股份有限公司',120),(686,'強效 40%(布芬淨)',3,'',NULL,'農藥進字第03276號',NULL,NULL,NULL,'(Z)-2-tert-butylimino-3-isopropyl-5-phenyl-1, 3, 5-thiadiazinan-4-one 40.000 (%)  ',NULL,'admin','安旺特股份有限公司',120),(687,'強斯陶(陶斯松)',3,'',NULL,'農藥製字第04147號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 5.000  (%)',NULL,'admin','瑞芳植物保護股份有限公司',115),(688,'強棒(待克利)',3,'',NULL,'農藥製字第05723號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%)',NULL,'admin','正農化學股份有限公司',130),(689,'強蟎牛(阿巴汀)',3,'',NULL,'農藥製字第05199號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%)   ',NULL,'admin','聯利農業科技股份有限公司',103),(690,'強龍(錳乃浦)',3,'',NULL,'農藥進字第02212號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','大勝化學工業股份有限公司',110),(691,'征露靈(四氯異苯腈)',3,'',NULL,'農藥製字第03389號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  75.000 (%)',NULL,'admin','正農化學股份有限公司',130),(692,'得人疼(得芬諾)',3,'',NULL,'農藥製字第06434號',NULL,NULL,NULL,' N-tert-butyl-N’-(4-ethylbenzoyl)-3,5-dimethylbenzohydrazide  70.000 (%)',NULL,'admin','東和化學企業股份有限公司',109),(693,'得來速(得克利)',3,'',NULL,'農藥製字第06396號',NULL,NULL,NULL,'(RS)-1-p-chlorophenyl-4,4-dimethyl-3-(1H-1,2,4-triazol-1- ylmethyl)pentan-3-ol 25.900 (%)    ',NULL,'admin','東和化學企業股份有限公司',109),(694,'得卡多(得克利)',3,'',NULL,'農藥製字第05890號',NULL,NULL,NULL,'(RS)-1-p-chlorophenyl-4,4-dimethyl-3-(1H-1,2,4-triazol-1- ylmethyl)pentan-3-ol 25.900 (%) ',NULL,'admin','安旺特股份有限公司',120),(695,'得天下(得芬諾)',3,'',NULL,'農藥製字第06269號',NULL,NULL,NULL,' N-tert-butyl-N’-(4-ethylbenzoyl)-3,5-dimethylbenzohydrazide  19.700 (%)',NULL,'admin','東和化學企業股份有限公司',109),(696,'得安寧(快得寧)',3,'',NULL,'農藥製字第01980號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 40.000 (%) ',NULL,'admin','正農化學股份有限公司',130),(697,'得寧寶(快得寧)',3,'',NULL,'農藥製字第00460號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 40.000 (%) ',NULL,'admin','富農化學工業股份有限公司',132),(698,'得斯寧(陶斯寧)',3,'',NULL,'農藥製字第02606號',NULL,NULL,NULL,'(1) O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate…22.5%  (2)(RS)-α-cyano-3-phenoxybenzyl (1RS)-cis-trans-3-(2,2-dichlorovinyl)-2,2-dimethylcyclopropanecarboxylate…2.5%',NULL,'admin','華隆化學股份有限公司',129),(699,'得斯本(陶斯松)',3,'',NULL,'農藥進字第02987號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 44.900 (%)   ',NULL,'admin','雅飛有限公司',126),(700,'德克利(得克利)',3,'',NULL,'農藥製字第06429號',NULL,NULL,NULL,'(RS)-1-p-chlorophenyl-4,4-dimethyl-3-(1H-1,2,4-triazol-1- ylmethyl)pentan-3-ol 25.900 (%)         ',NULL,'admin','光華化學股份有限公司',77),(701,'必利菜(賽達松)',3,'',NULL,'農藥製字第01141號',NULL,NULL,NULL,' S-α-ethoxycarbonylbenzyl O,O-dimethyl phosphorodithioate  50.000 (%)',NULL,'admin','大勝化學工業股份有限公司',110),(702,'必殺劑(陶斯松)',3,'',NULL,'農藥進字第02856號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 50.000 (%)   ',NULL,'admin','萬得發有限公司',125),(703,'必洛斯 10%(陶斯松)',3,'',NULL,'農藥製字第02459號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 10.000 (%)',NULL,'admin','正農化學股份有限公司',130),(704,'必洛斯 25%(陶斯松)',3,'',NULL,'農藥製字第02058號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 25.000 (%) ',NULL,'admin','正農化學股份有限公司',130),(705,'忍者(賽洛寧)',3,'',NULL,'農藥進字第03080號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.460  (%)   ',NULL,'admin','美商雅柏生活科技有限公司臺灣分公司',148),(706,'快保淨(快得保淨)',3,'',NULL,'農藥製字第00919號',NULL,NULL,NULL,'(1) dimethyl 4,4’-(o-phenylene)bis(3-thioallophanate)...35%(2) bis(quinolin-8-olato-O,N)copper...40%',NULL,'admin','臺益工業股份有限公司',39),(707,'快克利(納得亞滅寧)',3,'',NULL,'農藥製字第04669號',NULL,NULL,NULL,'納乃得 12% 亞滅寧 1.5%',NULL,'admin','臺聯實業股份有限公司',107),(708,'快克疫(達滅芬)',3,'',NULL,'農藥製字第06226號',NULL,NULL,NULL,'(E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine  50.000 (%)',NULL,'admin','華夏科學農化股份有限公司',106),(709,'快刀(賽果培)',3,'',NULL,'農藥進字第03166號',NULL,NULL,NULL,'(Z)-3-(6-chloro-3-pyridylmethyl)-1,3-thiazolidin-2-ylidenecyanamide 40.400 (%)',NULL,'admin','萬得發有限公司',125),(710,'快得樂(快得滅達樂)',3,'',NULL,'農藥製字第05678號',NULL,NULL,NULL,'(1) BIS(QUINOLIN-8-OLATO-O,N)COPPER......................48%(2) METHYL N-(METHOXYACETYL)-N-(2,6-XYLYL)-DL-ALANINATE...6%',NULL,'admin','國豐化學工業股份有限公司',112),(711,'快得淨(快得保淨)',3,'',NULL,'農藥製字第02857號',NULL,NULL,NULL,'(1) dimethyl 4,4’-(o-phenylene)bis(3-thioallophanate)...35%(2) bis(quinolin-8-olato-O,N)copper...40%',NULL,'admin','光華化學股份有限公司',77),(712,'快收欣(克收欣)',3,'',NULL,'農藥製字第05433號',NULL,NULL,NULL,'methyl (E)-methoxyimino[2-(o-tolyloxymethyl)phenyl]acetate 44.200 (%)',NULL,'admin','台灣日產化工股份有限公司',104),(713,'快樂農(快得寧)',3,'',NULL,'農藥進字第00241號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 40.000 (%)',NULL,'admin','嘉泰企業股份有限公司',102),(714,'快洛寧(賽洛寧)',3,'',NULL,'農藥製字第05073號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.800  (%)   ',NULL,'admin','惠大實業股份有限公司',157),(715,'快淨(快得寧)',3,'',NULL,'農藥製字第03938號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 33.500 (%)',NULL,'admin','龍燈生物科技股份有限公司',76),(716,'快滅菌(四氯異苯腈)',3,'',NULL,'農藥製字第04956號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  40.000 (%)',NULL,'admin','嘉泰企業股份有限公司',102),(717,'快滅速(大滅松)',3,'',NULL,'農藥製字第01312號',NULL,NULL,NULL,'O, O-dimethyl-S-methylcarbamoylmethyl phosphorodithioate  44.000 (%)',NULL,'admin','聯利農業科技股份有限公司',103),(718,'快益清(快得寧)',3,'',NULL,'農藥製字第04018號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 40.000 (%) ',NULL,'admin','嘉泰企業股份有限公司',102),(719,'快絕(快得克絕)',3,'',NULL,'農藥製字第05049號',NULL,NULL,NULL,'(1) BIS(QUINOLIN-8-OLATO-O,N)COPPER...40%(2) 1-(2-CYANO-2-METHOXYIMINOACETYL)3-ETHYLUREA...8%',NULL,'admin','嘉泰企業股份有限公司',102),(720,'快豐收(快得保淨)',3,'',NULL,'農藥製字第02583號',NULL,NULL,NULL,'(1) dimethyl 4,4’-(o-phenylene)bis(3-thioallophanate)...35%(2) bis(quinolin-8-olato-O,N)copper...40%',NULL,'admin','東和化學企業股份有限公司',109),(721,'快速淨(甲基多保淨)',3,'',NULL,'農藥製字第02471號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 70.000 (%) ',NULL,'admin','台灣正豐植保股份有限公司',128),(722,'惠光一多好(阿巴汀)',3,'',NULL,'農藥製字第05623號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%)  ',NULL,'admin','惠光股份有限公司',121),(723,'惠光冬(加保扶)',3,'',NULL,'農藥製字第02798號',NULL,NULL,NULL,'2,3-dihydro-2,2-dimethylbenzofuran-7-yl methylcarbamate  3.000 (%)',NULL,'admin','惠光股份有限公司',121),(724,'惠光夏油(礦物油)',3,'',NULL,'農藥製字第00673號',NULL,NULL,NULL,'ALIPHATIC HYDROCARBONS 95.000 (%)',NULL,'admin','惠光股份有限公司',121),(725,'惠光無帝比(益達胺)',3,'',NULL,'農藥製字第05724號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 18.200 (%)',NULL,'admin','惠光股份有限公司',121),(726,'惠光牌馬拉松(馬拉松)',3,'',NULL,'農藥製字第00484號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 25.000 (%) ',NULL,'admin','惠光股份有限公司',121),(727,'惠光蟎速伏(得芬瑞)',3,'',NULL,'農藥製字第05498號',NULL,NULL,NULL,' N-(4-tert-butylbenzyl)-4-chloro-3-ethyl-1-methylpyrazole-5-carboxamide  10.000 (%)',NULL,'admin','惠光股份有限公司',121),(728,'惠大強(陶斯寧)',3,'',NULL,'農藥製字第03798號',NULL,NULL,NULL,'(1) O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate…22.5%  (2)(RS)-α-cyano-3-phenoxybenzyl (1RS)-cis-trans-3-(2,2-dichlorovinyl)-2,2-dimethylcyclopropanecarboxylate…2.5%',NULL,'admin','惠大實業股份有限公司',157),(729,'惠生４５(錳乃浦)',3,'',NULL,'農藥進字第03233號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','惠光股份有限公司',121),(730,'惠發(達滅芬)',3,'',NULL,'農藥進字第02605號',NULL,NULL,NULL,'(E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine  50.000 (%)',NULL,'admin','惠光股份有限公司',121),(731,'惠紋寧(菲克利)',3,'',NULL,'農藥製字第05038號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 10.000 (%) ',NULL,'admin','惠大實業股份有限公司',157),(732,'惦惦死 34%(硫敵克)',3,'',NULL,'農藥進字第02925號',NULL,NULL,NULL,'3,7,9,13-tetramethyl-5,11-dioxa-2,8,14-trithia-4,7,9,12-tetra-azapentadeca-3,12-diene-6,10-dione 34.000 (%)',NULL,'admin','萬得發有限公司',125),(733,'惦惦死 75%(硫敵克)',3,'',NULL,'農藥進字第03227號',NULL,NULL,NULL,'3,7,9,13-tetramethyl-5,11-dioxa-2,8,14-trithia-4,7,9,12-tetra-azapentadeca-3,12-diene-6,10-dione 75.000 (%) ',NULL,'admin','萬得發有限公司',125),(734,'愛你錳(錳乃浦)',3,'',NULL,'農藥進字第02313號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  33.000 (%)',NULL,'admin','青山貿易有限公司',147),(735,'愛力克(邁克尼)',3,'',NULL,'農藥進字第01949號',NULL,NULL,NULL,'2-p-chlorophenyl-2-(1H-1,2,4-triazol-1-ylmethyl)hexanenitrile 40.000 (%)',NULL,'admin','臺聯實業股份有限公司',107),(736,'愛吃蟲(蘇力菌)',3,'',NULL,'農藥進字第01792號',NULL,NULL,NULL,'BACILLUS THURINGIENSIS, SUBSP.AIZAWAI,STRAIN ABTS-1857,FERMENTATION SOLIDS AND SOLUBLES  10.8% (7,000 DBMU/MG)',NULL,'admin','台灣住友化學股份有限公司',160),(737,'愛將(諾伐隆)',3,'',NULL,'農藥進字第02394號',NULL,NULL,NULL,'(±)-1-[3-chloro-4-(1,1,2-trifluoro-2-trifluoromethoxyethoxy)phenyl]-3-(2,6-difluorobenzoyl)urea 100 G/L (10% W/V)',NULL,'admin','聯利農業科技股份有限公司',103),(738,'愛心多(加保利)',3,'',NULL,'農藥製字第04844號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 5.000  (%) ',NULL,'admin','日農科技股份有限公司',105),(739,'愛扶農 (克福隆) (農會農化廠)',3,'',NULL,'農藥製字第03142號',NULL,NULL,NULL,'1-[3, 5-dichloro-4-(3-chloro-5-trifluoromethyl-2-pyridyloxy)phenyl]-3-(2,6-difluorobenzoyl)urea 5.000  (%)  ',NULL,'admin','中華民國農會附設各級農會農化廠',131),(740,'愛果生(錳乃浦)',3,'',NULL,'農藥進字第02352號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','保加利亞商艾格立亞股份有限公司台灣分公司',167),(741,'愛果蔬 25%(馬拉松)',3,'',NULL,'農藥製字第00296號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 25.000 (%)',NULL,'admin','日農科技股份有限公司',105),(742,'愛果蔬 50%(馬拉松)',3,'',NULL,'農藥製字第03669號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 50.000 (%)   ',NULL,'admin','日農科技股份有限公司',105),(743,'愛樂福(派滅淨)',3,'',NULL,'農藥進字第03221號',NULL,NULL,NULL,'(E)-4,5-dihydro-6-methyl-4-(3-pyridylmethyleneamino)-1,2,4- triazin-3(2H)-one 25.000 (%) ',NULL,'admin','嘉濱貿易有限公司',111),(744,'愛滅能(陶斯松)',3,'',NULL,'農藥製字第02160號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%) ',NULL,'admin','洽益化學股份有限公司',108),(745,'愛福好(賽洛寧)',3,'',NULL,'農藥製字第05272號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.800  (%)   ',NULL,'admin','臺聯實業股份有限公司',107),(746,'愛米松(益滅松)',3,'',NULL,'農藥製字第04456號',NULL,NULL,NULL,'O,O-dimethyl S-phthalimidomethyl phosphorodithioate  50.000 (%)',NULL,'admin','國豐化學工業股份有限公司',112),(747,'愛農產(賽達松)',3,'',NULL,'農藥製字第00411號',NULL,NULL,NULL,' S-α-ethoxycarbonylbenzyl O,O-dimethyl phosphorodithioate  50.000 (%)',NULL,'admin','臺灣庵原農藥股份有限公司',113),(748,'愛逮完(祿芬隆)',3,'',NULL,'農藥進字第02637號',NULL,NULL,NULL,'(RS)-1-[2,5-dichloro-4-(1,1,2,3,3,3-hexafluoropropoxy)- phenyl]-3-(2,6-difluorobenzoyl)-urea  4.400 (%)',NULL,'admin','萬得發有限公司',125),(749,'愛達農(賽達松)',3,'',NULL,'農藥製字第01012號',NULL,NULL,NULL,' S-α-ethoxycarbonylbenzyl O,O-dimethyl phosphorodithioate  50.000 (%)c',NULL,'admin','光華化學股份有限公司',77),(750,'愛鋅錳(錳乃浦)',3,'',NULL,'農藥進字第02019號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','瑞福企業有限公司',162),(751,'慶台灣(亞托敏)',3,'',NULL,'農藥製字第05867號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','世大農化工廠股份有限公司	',114),(752,'我最紅(賽滅淨)',3,'',NULL,'農藥進字第03057號',NULL,NULL,NULL,'N-cyclopropyl-1,3,5-triazine-2,4,6-triamine 8.900  (%) ',NULL,'admin','嘉濱貿易有限公司',111),(753,'戰力(待克利)',3,'',NULL,'農藥進字第02359號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%)',NULL,'admin','雅飛有限公司',126),(754,'戰炭(待克利)',3,'',NULL,'農藥進字第02377號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%)  ',NULL,'admin','萬得發有限公司',125),(755,'戰炭大王(待克利)',3,'',NULL,'農藥進字第02860號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%) ',NULL,'admin','萬得發有限公司',125),(756,'戰甲(益達胺)',3,'',NULL,'農藥製字第06068號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 18.200 (%) ',NULL,'admin','華夏科學農化股份有限公司',106),(757,'戰神(賽洛寧)',3,'',NULL,'農藥進字第02374號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.800  (%) ',NULL,'admin','鴻鋒化學有限公司',134),(758,'戰蟲(第滅寧)',3,'',NULL,'農藥進字第02598號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.400  (%)',NULL,'admin','優必樂有限公司',151),(759,'戰鬥力(待克利)',3,'',NULL,'農藥進字第02481號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%) ',NULL,'admin','益欣股份有限公司',176),(760,'戰龍(賽速安)',3,'',NULL,'農藥進字第03292號',NULL,NULL,NULL,'3-(2-chloro-1,3-thiazol-5-ylmethyl)-5-methyl-1,3,5-oxadiazinan-4-ylidene(nitro)amine 25.000 (%)',NULL,'admin','美商雅柏生活科技有限公司臺灣分公司',148),(761,'手路菜(腈硫醌)',3,'',NULL,'農藥進字第03182號',NULL,NULL,NULL,'5,10-dihydro-5,10-dioxonaphtho[2,3-b]-1,4-dithiine-2,3-dicarbonitrile 42.200 (%)   ',NULL,'admin','嘉濱貿易有限公司',111),(762,'打蚜薊(陶斯松)',3,'',NULL,'農藥進字第02788號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%)',NULL,'admin','松樹國際有限公司',137),(763,'打鉄男(達特南)',3,'',NULL,'農藥進字第03377號',NULL,NULL,NULL,'(RS)-1-methyl-2-nitro-3-(tetrahydro-3-furylmethyl)guanidine 20.000 (%)',NULL,'admin','高事達農化有限公司',155),(764,'托斯本(陶斯松)',3,'',NULL,'農藥製字第03950號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%) ',NULL,'admin','瑞芳植物保護股份有限公司',115),(765,'托福松(農會農化廠)',3,'',NULL,'農藥製字第04343號',NULL,NULL,NULL,' S-tert-butylthiomethyl O,O-diethyl phosphorodithioate  10.000 (%)',NULL,'admin','中華民國農會附設各級農會農化廠',131),(766,'抑菌寶(賽座滅)',3,'',NULL,'農藥進字第03532號',NULL,NULL,NULL,' 4-chloro-2-cyano-N,N-dimethyl-5-p-tolylimidazole-1-sulfonamide  9.400 (%)',NULL,'admin','嘉濱貿易有限公司',111),(767,'抗斑點(四氯異苯腈)',3,'',NULL,'農藥進字第02964號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  75.000 (%)',NULL,'admin','萬得發有限公司',125),(768,'抗病(免得爛)',3,'',NULL,'農藥進字第00969號',NULL,NULL,NULL,' zinc ammoniate ethylenebis(dithiocarbamate)-poly(ethylenethiuram disulfide)  80.000 (%)',NULL,'admin','台灣巴斯夫股份有限公司',123),(769,'抗統特(托福松)',3,'',NULL,'農藥進字第00222號',NULL,NULL,NULL,' S-tert-butylthiomethyl O,O-diethyl phosphorodithioate  10.000 (%)',NULL,'admin','東鋒股份有限公司',154),(770,'抗蚜靈(賽速安)',3,'',NULL,'農藥製字第06308號',NULL,NULL,NULL,'3-(2-chloro-1,3-thiazol-5-ylmethyl)-5-methyl-1,3,5-oxadiazinan-4-ylidene(nitro)amine 25.000 (%)',NULL,'admin','嘉泰企業股份有限公司',102),(771,'抗蝶(益滅賽寧)',3,'',NULL,'農藥製字第05969號',NULL,NULL,NULL,'(1)O,O-dimethyl S-phthalimidomethyl phosphorodithioate…30%  (2)(RS)-α-cyano-3-phenoxybenzyl(1RS)-cis-trans-3-(2,2-dichlorovinyl)-2,2-dimethyl cyclopropanecarboxylate …10%',NULL,'admin','安旺特股份有限公司',120),(772,'抗蟲得(托福松)',3,'',NULL,'農藥製字第05807號',NULL,NULL,NULL,' S-tert-butylthiomethyl O,O-diethyl phosphorodithioate  10.000 (%)',NULL,'admin','臺灣庵原農藥股份有限公司',113),(773,'抗蟲敵(托福松)',3,'',NULL,'農藥製字第04714號',NULL,NULL,NULL,' S-tert-butylthiomethyl O,O-diethyl phosphorodithioate  10.000 (%)',NULL,'admin','東和化學企業股份有限公司',109),(774,'抗蟲竹(托福松)',3,'',NULL,'農藥製字第06426號',NULL,NULL,NULL,' S-tert-butylthiomethyl O,O-diethyl phosphorodithioate  10.000 (%)',NULL,'admin','台農三和化工股份有限公司',119),(775,'抗蟲靈(托福松)',3,'',NULL,'農藥製字第05408號',NULL,NULL,NULL,' S-tert-butylthiomethyl O,O-diethyl phosphorodithioate  10.000 (%)',NULL,'admin','洽益化學股份有限公司',108),(776,'拔蟲去(陶斯松)',3,'',NULL,'農藥進字第01947號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%)',NULL,'admin','瑞福企業有限公司',162),(777,'拚速度(因得克)',3,'',NULL,'農藥製字第06485號',NULL,NULL,NULL,'methyl (S)-N-[7-chloro-2,3,4a,5-tetrahydro-4a-(methoxycarbonyl)indeno[1,2-e][1,3,4]oxadiazin-2-ylcarbonyl]-4’-(trifluoromethoxy)carbanilate  14.500 (%)',NULL,'admin','華夏科學農化股份有限公司',106),(778,'拜勝格',3,'',NULL,'農藥進字第01432號',NULL,NULL,NULL,'貝他賽扶寧  2.900 (%)',NULL,'admin','台灣拜耳股份有限公司',101),(779,'拜好當(三泰隆)',3,'',NULL,'農藥進字第00882號',NULL,NULL,NULL,'(1RS,2RS;1RS,2SR)-1-(4-chlorophenoxy)-3,3-dimethyl-1-(1H-1,2,4-triazol-1-yl)-butan-2-ol 23.000 (%) 乳化劑 77.000(%)',NULL,'admin','台灣拜耳股份有限公司',101),(780,'拜薊剋(滅賜克)',3,'',NULL,'農藥製字第04392號',NULL,NULL,NULL,'4-METHYLTHIO-3,5-XYLYL-METHYLCARBAMATE 50.000 (%)  ',NULL,'admin','瑞芳植物保護股份有限公司',115),(781,'指揮官(福隆納乃得)',3,'',NULL,'農藥製字第05796號',NULL,NULL,NULL,'(1) 1-(4-chlorophenyl)-3-(2,6-difluorobenzoyl)urea...7%      (2) S-methyl N-(methylcarbamoyloxy)thioacetimidate...23%  30.000 (%)',NULL,'admin','臺益工業股份有限公司',39),(782,'捕虫手(陶斯松)',3,'',NULL,'農藥進字第03042號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 50.000 (%)',NULL,'admin','嘉濱貿易有限公司',111),(783,'掌心雷(佈飛松)',3,'',NULL,'農藥製字第04427號',NULL,NULL,NULL,'O-4-bromo-2-chlorophenyl O-ethyl S-propyl phosphorothioate 43.000 (%) ',NULL,'admin','東和化學企業股份有限公司',109),(784,'掌門人(益達胺)',3,'',NULL,'農藥製字第05142號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%)   ',NULL,'admin','台灣日產化工股份有限公司',104),(785,'探戈 (乳劑) (待克利)',3,'',NULL,'農藥製字第05580號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%)',NULL,'admin','惠光股份有限公司',121),(786,'探戈 (水懸劑) (待克利)',3,'',NULL,'農藥製字第06584號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%) ',NULL,'admin','惠光股份有限公司',121),(787,'接地氣(因得克)',3,'',NULL,'農藥製字第06556號',NULL,NULL,NULL,'methyl (S)-N-[7-chloro-2,3,4a,5-tetrahydro-4a-(methoxycarbonyl)indeno[1,2-e][1,3,4]oxadiazin-2-ylcarbonyl]-4’-(trifluoromethoxy)carbanilate  14.500 (%)',NULL,'admin','安旺特股份有限公司',120),(788,'揪稱(亞托敏)',3,'',NULL,'農藥製字第05904號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','瑞芳植物保護股份有限公司',115),(789,'搏氣魄(百克敏)',3,'',NULL,'農藥進字第03125號',NULL,NULL,NULL,'methyl N-{2-[1-(4-chlorophenyl)pyrazol-3-yloxymethyl]phenyl}(N-methoxy)carbamate  23.600 (%)',NULL,'admin','萬得發有限公司',125),(790,'撞死蟲(賽達松)',3,'',NULL,'農藥製字第06142號',NULL,NULL,NULL,' S-α-ethoxycarbonylbenzyl O,O-dimethyl phosphorodithioate  50.000 (%)',NULL,'admin','臺聯實業股份有限公司',107),(791,'撲滅殺(陶斯寧)',3,'',NULL,'農藥製字第06073號',NULL,NULL,NULL,'(1) O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate…45.45% (2) (RS)-α-cyano-3-phenoxybenzyl (1RS)-cis-trans-3-(2,2-dichlorovinyl)-2,2-dimethylcyclopropanecarboxylate…4.55%',NULL,'admin','日農科技股份有限公司',105),(792,'擊發(無水硫酸銅	)',3,'',NULL,'農藥進字第02095號',NULL,NULL,NULL,'COPPER SULFATE ANHYDRATE(Cu 12%) 30.000 (%)',NULL,'admin','品全農業有限公司',190),(793,'擋尚久(白克列)',3,'',NULL,'農藥製字第06555號',NULL,NULL,NULL,'2-chloro-N-(4’-chlorobiphenyl-2-yl)nicotinamide 42.400 (%) ',NULL,'admin','國豐化學工業股份有限公司',112),(794,'擱巧好(得芬諾)',3,'',NULL,'農藥製字第05292號',NULL,NULL,NULL,' N-tert-butyl-N’-(4-ethylbenzoyl)-3,5-dimethylbenzohydrazide  19.700 (%)',NULL,'admin','惠光股份有限公司',121),(795,'擱抹嘜(邁克尼)',3,'',NULL,'農藥製字第05522號',NULL,NULL,NULL,'2-p-chlorophenyl-2-(1H-1,2,4-triazol-1-ylmethyl)hexanenitrile 13.400 (%)',NULL,'admin','惠光股份有限公司',121),(796,'攏作伙(陶斯松)',3,'',NULL,'農藥製字第05412號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 50.000 (%) ',NULL,'admin','安旺特股份有限公司',120),(797,'攏克死(第滅寧)',3,'',NULL,'農藥進字第02980號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.400  (%) ',NULL,'admin','嘉濱貿易有限公司',111),(798,'攏嘸蟲(因滅汀)',3,'',NULL,'農藥製字第05470號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','瑞芳植物保護股份有限公司',115),(799,'攏好(待克利)',3,'',NULL,'農藥製字第05404號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%)',NULL,'admin','日農科技股份有限公司',105),(800,'攏是為了你(賽洛寧)',3,'',NULL,'農藥製字第06221號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.460  (%)',NULL,'admin','大勝化學工業股份有限公司',110),(801,'攏會通(賽洛寧)',3,'',NULL,'農藥製字第05299號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.800  (%) ',NULL,'admin','日農科技股份有限公司',105),(802,'攏治(待克利)',3,'',NULL,'農藥進字第02772號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 10.000 (%)',NULL,'admin','雋農實業股份有限公司',136),(803,'攏無粉(邁克尼)',3,'',NULL,'農藥製字第06139號',NULL,NULL,NULL,'2-p-chlorophenyl-2-(1H-1,2,4-triazol-1-ylmethyl)hexanenitrile 40.000 (%) ',NULL,'admin','光華化學股份有限公司',77),(804,'攏無菌(銅快得寧)',3,'',NULL,'農藥進字第00948號',NULL,NULL,NULL,'(1) bis(quinolin-8-olato-O,N)copper...30% (2) cupric hydroxide...10%',NULL,'admin','嘉泰企業股份有限公司',102),(805,'攏無蛾(祿芬隆)',3,'',NULL,'農藥進字第02725號',NULL,NULL,NULL,'(RS)-1-[2,5-dichloro-4-(1,1,2,3,3,3-hexafluoropropoxy)- phenyl]-3-(2,6-difluorobenzoyl)-urea  4.400 (%)',NULL,'admin','雅飛有限公司',126),(806,'攏珍順(待克利)',3,'',NULL,'農藥製字第05753號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 10.000 (%) ',NULL,'admin','惠光股份有限公司',121),(807,'攏總挺(陶斯松)',3,'',NULL,'農藥製字第06460號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 50.000 (%)',NULL,'admin','大成化學工業股份有限公司',127),(808,'攏總稱(亞托敏)',3,'',NULL,'農藥製字第06024號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','臺益工業股份有限公司',39),(809,'攏讚(三泰芬)',3,'',NULL,'農藥製字第04118號',NULL,NULL,NULL,'1-(4-chlorophenoxy)-3,3-dimethyl-1-(1H-1,2,4-triazol-1-yl)butan-2-one 25.000 (%) ',NULL,'admin','正農化學股份有限公司',130),(810,'攏蹤管(百克敏)',3,'',NULL,'農藥進字第03380號',NULL,NULL,NULL,' methyl N-{2-[1-(4-chlorophenyl)pyrazol-3-yloxymethyl]phenyl}(N-methoxy)carbamate  23.600 (%)',NULL,'admin','優必樂有限公司',151),(811,'效死本(陶斯松)',3,'',NULL,'農藥進字第01718號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%)   ',NULL,'admin','恒欣股份有限公司',183),(812,'斑保淨(快得保淨)',3,'',NULL,'農藥製字第02057號',NULL,NULL,NULL,'(1) dimethyl 4,4’-(o-phenylene)bis(3-thioallophanate)...35%(2) bis(quinolin-8-olato-O,N)copper...40%',NULL,'admin','正農化學股份有限公司',130),(813,'斯巴達精(克收欣)',3,'',NULL,'農藥進字第02406號',NULL,NULL,NULL,' methyl (E)-methoxyimino[2-(o-tolyloxymethyl)phenyl]acetate  44.200 (%)',NULL,'admin','鴻鋒化學有限公司',134),(814,'斯紋(保粒黴素 丁)',3,'',NULL,'農藥進字第02666號',NULL,NULL,NULL,'5-(2-amino-5-O-carbamoyl-2-deoxy-L-xylonamido)-1-(5-carboxy-1,2,3,4-tetrahydro-2,4-dioxopyrimidin-1-yl)-1,5-dideoxy-β-D-allofuranuronic acid 11.300 (%) ',NULL,'admin','立農化學股份有限公司',143),(815,'斯翹翹(布芬淨)',3,'',NULL,'農藥進字第03307號',NULL,NULL,NULL,'(Z)-2-tert-butylimino-3-isopropyl-5-phenyl-1, 3, 5-thiadiazinan-4-one 40.000 (%)',NULL,'admin','大成化學工業股份有限公司',127),(816,'新-剋星(待克利)',3,'',NULL,'農藥進字第02412號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 10.000 (%) ',NULL,'admin','萬得發有限公司',125),(817,'新-報你發(達滅芬)',3,'',NULL,'農藥進字第02378號',NULL,NULL,NULL,'(E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine  50.000 (%)',NULL,'admin','萬得發有限公司',125),(818,'新-汽巴讚(賽滅淨)',3,'',NULL,'農藥進字第01240號',NULL,NULL,NULL,'N-cyclopropyl-1,3,5-triazine-2,4,6-triamine 8.900  (%) ',NULL,'admin','台灣先正達股份有限公司',144),(819,'新-祝蓋旺(因滅汀)',3,'',NULL,'農藥製字第05664號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','大成化學工業股份有限公司',127),(820,'新-脫百絲(平克座)',3,'',NULL,'農藥進字第02132號',NULL,NULL,NULL,'1-(2,4-dichloro-β-propylphenethyl)-1H-1,2,4-triazole 19.000 (%)   ',NULL,'admin','台灣先正達股份有限公司',144),(821,'新-農治(待克利)',3,'',NULL,'農藥進字第01809號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 10.000 (%)',NULL,'admin','台灣先正達股份有限公司',144),(822,'新世大寧(益滅賽寧)',3,'',NULL,'農藥製字第04465號',NULL,NULL,NULL,'(1)O,O-dimethyl S-phthalimidomethyl phosphorodithioate…30%  (2)(RS)-α-cyano-3-phenoxybenzyl(1RS)-cis-trans-3-(2,2-dichlorovinyl)-2,2-dimethyl cyclopropanecarboxylate …10%',NULL,'admin','世大農化工廠股份有限公司	',114),(823,'新世通(三泰芬)',3,'',NULL,'農藥製字第04395號',NULL,NULL,NULL,'1-(4-chlorophenoxy)-3,3-dimethyl-1-(1H-1,2,4-triazol-1-yl)butan-2-one 25.000 (%)  ',NULL,'admin','世大農化工廠股份有限公司	',114),(824,'新利賀(撲滅寧)',3,'',NULL,'農藥進字第01785號',NULL,NULL,NULL,' N-(3,5-dichlorophenyl)-1,2-dimethylcyclopropane-1,2-dicarboximide  50.000 (%)',NULL,'admin','民信有限公司',173),(825,'新喜精(第滅寧)',3,'',NULL,'農藥製字第04966號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.400  (%)',NULL,'admin','嘉農企業股份有限公司',117),(826,'新囍(第滅寧)',3,'',NULL,'農藥進字第02354號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%) ',NULL,'admin','青山貿易有限公司',147),(827,'新大寶(蘇力菌)',3,'',NULL,'農藥進字第00710號',NULL,NULL,NULL,' BACILLUS THURINGIENSIS SUBSP. KURSTAKI, STRAIN ABTS-351, DRIED FERMENTATION SOLIDS AND SOLUBLES (含量為微生物發固形物、孢子及殺蟲毒蛋白等之總量 16,000 IU/MG)  23.700 (%)',NULL,'admin','台灣住友化學股份有限公司',160),(828,'新大生霸王(錳乃浦)',3,'',NULL,'農藥進字第02685號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  47.500 (%)',NULL,'admin','台灣道禮股份有限公司',174),(829,'新太喜(第滅寧)',3,'',NULL,'農藥製字第06305號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%)',NULL,'admin','國豐化學工業股份有限公司',112),(830,'新好松(益滅松)',3,'',NULL,'農藥製字第00625號',NULL,NULL,NULL,' O,O-dimethyl S-phthalimidomethyl phosphorodithioate  50.000 (%)',NULL,'admin','惠光股份有限公司',121),(831,'新好顧(陶斯松)',3,'',NULL,'農藥製字第05532號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 50.000 (%)  ',NULL,'admin','臺聯實業股份有限公司',107),(832,'新安美農(菲克利)',3,'',NULL,'農藥製字第04713號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 5.000  (%) ',NULL,'admin','富農化學工業股份有限公司',132),(833,'新富王(錳乃浦)',3,'',NULL,'農藥製字第04806號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','嘉農企業股份有限公司',117),(834,'新寶淨(甲基多保淨)',3,'',NULL,'農藥製字第01211號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 70.000 (%) ',NULL,'admin','臺灣庵原農藥股份有限公司',113),(835,'新寶淨–70(甲基多保淨)',3,'',NULL,'農藥製字第02258號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 70.000 (%)  ',NULL,'admin','國豐化學工業股份有限公司',112),(836,'新寶淨‧精(甲基多保淨)',3,'',NULL,'農藥製字第05092號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 40.000 (%)  ',NULL,'admin','臺灣庵原農藥股份有限公司',113),(837,'新寶綠新(克收欣)',3,'',NULL,'農藥進字第03495號',NULL,NULL,NULL,' methyl (E)-methoxyimino[2-(o-tolyloxymethyl)phenyl]acetate  50.000 (%)',NULL,'admin','日農科技股份有限公司',105),(838,'新寶運旺(克收欣)',3,'',NULL,'農藥製字第06446號',NULL,NULL,NULL,' methyl (E)-methoxyimino[2-(o-tolyloxymethyl)phenyl]acetate  50.000 (%)',NULL,'admin','日農科技股份有限公司',105),(839,'新將星(畢芬寧)',3,'',NULL,'農藥製字第04968號',NULL,NULL,NULL,'2-methylbiphenyl-3-ylmethyl (Z)-(1RS,3RS)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate  2.500 (%)',NULL,'admin','大勝化學工業股份有限公司',110),(840,'新希望(貝芬菲克利)',3,'',NULL,'農藥製字第05059號',NULL,NULL,NULL,'(1) METHYL BENZIMIDAZOL-2-YLCARBAMATE..........24.5% (2) (RS)-2-(2,4-DICHLOROPHENYL)-1-(1H-1,2,4-TRIAZOL-1-YL)HEXAN-2-OL.........10%',NULL,'admin','惠光股份有限公司',121),(841,'新幹線(益達胺)',3,'',NULL,'農藥進字第02525號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%)  ',NULL,'admin','嘉農企業股份有限公司',117),(842,'新彗星(畢芬寧)',3,'',NULL,'農藥進字第03346號',NULL,NULL,NULL,'2-methylbiphenyl-3-ylmethyl (Z)-(1RS,3RS)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate  2.800 (%)',NULL,'admin','台灣瑪斯德股份有限公司',145),(843,'新德記3號有機質肥料',2,'','有機資審字第104006號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0762005號','黃豆粕、花生粕、魚粉、肉骨粉、米糠、蓖麻粕、泥炭土','全氮5.0% 全磷酐3.0% 全氧化鉀2.0% 有機質80%',NULL,'admin','新德記肥料廠',44),(844,'新德記522有機質肥料',2,'','有機資審字第106012號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0762011號','黃豆粕、花生粕、米糠、蓖麻粕、黑芝麻粕','全氮5.0%全磷酐2.6%全氧化鉀2.0%有機質80.0%',NULL,'admin','新德記肥料廠',44),(845,'新德記生技534',2,'','有機資審字第107034號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0762018號','黃豆粕、花生粕、魚粉、肉骨粉、米糠、蓖麻粕、泥炭土、棕梠灰','全氮5.0%全磷酐3.0%全氧化鉀3.2%有機質80.0%',NULL,'admin','新德記肥料廠',44),(846,'新德記生技622',2,'','有機資審字第107035號',NULL,'植物渣粕肥料(5-01)','肥製(質)字第0762017號','黃豆粕、花生粕、菜籽粕、黑芝麻粕、米糠、蓖麻粕','全氮6.0%全磷酐2.0%全氧化鉀2.0%有機質80.0%',NULL,'admin','新德記肥料廠',44),(847,'新德記豆餅肥',2,'','有機資審字第107019號',NULL,'植物渣粕肥料(5-01)','肥製(質)字第0762012號','黃豆','全氮6.5%全磷酐1.0%全氧化鉀2.0%有機質90.0%',NULL,'admin','新德記肥料廠',44),(848,'新慧星(畢芬寧)',3,'',NULL,'農藥進字第02304號',NULL,NULL,NULL,'2-methylbiphenyl-3-ylmethyl (Z)-(1RS,3RS)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate  2.800 (%)',NULL,'admin','台灣瑪斯德股份有限公司',145),(849,'新戰車(待克利)',3,'',NULL,'農藥製字第04478號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%)',NULL,'admin','瑞芳植物保護股份有限公司',115),(850,'新時代(依普同)',3,'',NULL,'農藥進字第03251號',NULL,NULL,NULL,'3-(3,5-dichlorophenyl)-N-isopropyl-2,4-dioxoimidazolidine-1-carboxamide  50.000 (%)',NULL,'admin','安旺特股份有限公司',120),(851,'新果斯(四氯保淨)',3,'',NULL,'農藥製字第03494號',NULL,NULL,NULL,'(1) dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate)...20% (2) tetrachloroisophthalonitrile...50%',NULL,'admin','臺益工業股份有限公司',39),(852,'新樂園(菲克利)',3,'',NULL,'農藥進字第02323號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 10.000 (%)',NULL,'admin','耕得貿易股份有限公司',141),(853,'新毒斯寧-精(陶斯寧)',3,'',NULL,'農藥製字第05316號',NULL,NULL,NULL,'(1) O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate…45.45% (2) (RS)-α-cyano-3-phenoxybenzyl (1RS)-cis-trans-3-(2,2-dichlorovinyl)-2,2-dimethylcyclopropanecarboxylate…4.55%',NULL,'admin','大成化學工業股份有限公司',127),(854,'新氣象(菲克利)',3,'',NULL,'農藥製字第04972號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 10.000 (%)  ',NULL,'admin','惠光股份有限公司',121),(855,'新泰勇(平克座)',3,'',NULL,'農藥製字第05575號',NULL,NULL,NULL,'1-(2,4-dichloro-β-propylphenethyl)-1H-1,2,4-triazole 19.000 (%) ',NULL,'admin','國豐化學工業股份有限公司',112),(856,'新火霹靂(益達胺)',3,'',NULL,'農藥進字第03122號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 18.200 (%) ',NULL,'admin','台灣瑪斯德股份有限公司',145),(857,'新百克靈(四氯異苯腈)',3,'',NULL,'農藥製字第06277號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  75.000 (%)',NULL,'admin','日農科技股份有限公司',105),(858,'新百菌清(四氯異苯腈)',3,'',NULL,'農藥進字第03415號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  75.000 (%)',NULL,'admin','日農科技股份有限公司',105),(859,'新穩常笑(布芬淨)',3,'',NULL,'農藥進字第03487號',NULL,NULL,NULL,'(Z)-2-tert-butylimino-3-isopropyl-5-phenyl-1, 3, 5-thiadiazinan-4-one 40.000 (%)    ',NULL,'admin','日農科技股份有限公司',105),(860,'新統稱(三元硫酸銅)',3,'',NULL,'農藥進字第03530號',NULL,NULL,NULL,'cupric sulfate-tricupric hydroxide 27.120 (%)  ',NULL,'admin','名方有限公司',179),(861,'新輕功(嘉賜銅)',3,'',NULL,'農藥進字第00922號',NULL,NULL,NULL,'(1) [5-amino-2-methyl-6-(2,3,4,5,6,-pentahydroxycyclohexyloxy) tetrahydropyran-3-yl] amino-α-iminoacetic acid hydrochloride hydrate...5.7% ( Kasugamycin...5% ) (2) copper oxychloride (CU 45%)...75.6%',NULL,'admin','大勝化學工業股份有限公司',110),(862,'新農夫(賽洛寧)',3,'',NULL,'農藥製字第05831號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 5.000  (%)   ',NULL,'admin','國豐化學工業股份有限公司',112),(863,'新農家福(納得亞滅寧)',3,'',NULL,'農藥製字第04866號',NULL,NULL,NULL,'納乃得 12% 亞滅寧 1.5%',NULL,'admin','眾益農業生技股份有限公司',124),(864,'新農益(甲基多保淨)',3,'',NULL,'農藥製字第04827號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 70.000 (%) ',NULL,'admin','臺聯實業股份有限公司',107),(865,'新長紅(益達胺)',3,'',NULL,'農藥製字第05001號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%)  ',NULL,'admin','大勝化學工業股份有限公司',110),(866,'新關刀(益達胺)',3,'',NULL,'農藥製字第05007號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%)    ',NULL,'admin','世大農化工廠股份有限公司	',114),(867,'新雙福(加保利)',3,'',NULL,'農藥製字第04441號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 40.000 (%) ',NULL,'admin','世大農化工廠股份有限公司	',114),(868,'新雷彈(腈硫醌)',3,'',NULL,'農藥進字第02301號',NULL,NULL,NULL,'5,10-dihydro-5,10-dioxonaphtho[2,3-b]-1,4-dithiine-2,3-dicarbonitrile 70.000 (%)  ',NULL,'admin','雅飛有限公司',126),(869,'新－東方不敗(百利普芬)',3,'',NULL,'農藥進字第03136號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 11.000 (%) ',NULL,'admin','大成化學工業股份有限公司',127),(870,'方圓牌天茂有機質肥料',2,'','有機資審字第103009號',NULL,'雜項堆肥(5-11)','肥製(質)字第0644002號','動物性廢渣、畜禽糞、畜禽屠屖下腳料、粗糠','全氮3.0%全磷酐2.0%全氧化鉀2.0%有機質65%',NULL,'admin','方圓生化科技有限公司',38),(871,'施美文(加保利)',3,'',NULL,'農藥製字第00328號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 85.000 (%)  ',NULL,'admin','東和化學企業股份有限公司',109),(872,'旋風掌(益達胺)',3,'',NULL,'農藥進字第02299號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%)  ',NULL,'admin','維丰國際股份有限公司',189),(873,'日曹強必勇(亞滅培)',3,'',NULL,'農藥進字第01977號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%) ',NULL,'admin','台灣住友商事股份有限公司',188),(874,'日曹油(礦物油)',3,'',NULL,'農藥進字第02261號',NULL,NULL,NULL,'ALIPHATIC HYDROCARBONS 97.000 (%)    ',NULL,'admin','儂泰貿易有限公司',181),(875,'日產克靈(四氯異苯腈)',3,'',NULL,'農藥製字第06373號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  75.000 (%)',NULL,'admin','台灣日產化工股份有限公司',104),(876,'日產大生(錳乃浦)',3,'',NULL,'農藥進字第02586號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','台灣日產化工股份有限公司',104),(877,'日產虫蹺蹺(因滅汀)',3,'',NULL,'農藥製字第05783號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','台灣日產化工股份有限公司',104),(878,'日產靈(納乃得)',3,'',NULL,'農藥製字第04998號',NULL,NULL,NULL,' S-methyl N-(methylcarbamoyloxy)thioacetimidate  40.000 (%)',NULL,'admin','台灣日產化工股份有限公司',104),(879,'日禧(第滅寧)',3,'',NULL,'農藥製字第04766號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%)  ',NULL,'admin','台灣日產化工股份有限公司',104),(880,'日禧精(第滅寧)',3,'',NULL,'農藥製字第04963號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.400  (%)',NULL,'admin','台灣日產化工股份有限公司',104),(881,'日農保利果(保粒黴素 丁)',3,'',NULL,'農藥進字第00674號',NULL,NULL,NULL,'5-(2-amino-5-O-carbamoyl-2-deoxy-L-xylonamido)-1-(5-carboxy-1,2,3,4-tetrahydro-2,4-dioxopyrimidin-1-yl)-1,5-dideoxy-β-D-allofuranuronic acid 2.250  (%)    ',NULL,'admin','日佳農葯股份有限公司',178),(882,'早滿意(佈飛松)',3,'',NULL,'農藥製字第04557號',NULL,NULL,NULL,'O-4-bromo-2-chlorophenyl O-ethyl S-propyl phosphorothioate 43.000 (%) ',NULL,'admin','日農科技股份有限公司',105),(883,'旺來松(陶斯松)',3,'',NULL,'農藥進字第01714號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%)  ',NULL,'admin','翰金興業有限公司',165),(884,'旺利星(畢芬寧)',3,'',NULL,'農藥製字第05884號',NULL,NULL,NULL,'2-methylbiphenyl-3-ylmethyl (Z)-(1RS,3RS)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate  2.800 (%)',NULL,'admin','聯利農業科技股份有限公司',103),(885,'旺天下(亞托敏)',3,'',NULL,'農藥製字第06168號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  50.000 (%)',NULL,'admin','聯利農業科技股份有限公司',103),(886,'旺強(毆殺滅)',3,'',NULL,'農藥進字第03507號',NULL,NULL,NULL,' N,N-dimethyl-2-methylcarbamoyloxyimino-2-(methylthio)acetamide  10.000 (%)',NULL,'admin','海博生技股份有限公司',146),(887,'旺得(納乃得)',3,'',NULL,'農藥製字第03294號',NULL,NULL,NULL,' S-methyl N-(methylcarbamoyloxy)thioacetimidate  40.000 (%)',NULL,'admin','龍燈生物科技股份有限公司',76),(888,'旺旺好(得芬諾)',3,'',NULL,'農藥製字第05739號',NULL,NULL,NULL,' N-tert-butyl-N’-(4-ethylbenzoyl)-3,5-dimethylbenzohydrazide  19.700 (%)',NULL,'admin','安旺特股份有限公司',120),(889,'旺果油(礦物油)',3,'',NULL,'農藥製字第00667號',NULL,NULL,NULL,'ALIPHATIC HYDROCARBONS 95.000 (%) ',NULL,'admin','安旺特股份有限公司',120),(890,'旺生(錳乃浦)',3,'',NULL,'農藥進字第00752號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  33.000 (%)',NULL,'admin','安農股份有限公司',156),(891,'旺立冬(加保扶)',3,'',NULL,'農藥製字第04386號',NULL,NULL,NULL,'2,3-dihydro-2,2-dimethylbenzofuran-7-yl methylcarbamate  3.000 (%)',NULL,'admin','瑞芳植物保護股份有限公司',115),(892,'旺立強(加保利)',3,'',NULL,'農藥製字第00063號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 85.000 (%)',NULL,'admin','聯利農業科技股份有限公司',103),(893,'旺綠生(錳乃浦)',3,'',NULL,'農藥製字第04857號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','光華化學股份有限公司',77),(894,'旺綠通(三泰芬)',3,'',NULL,'農藥製字第02386號',NULL,NULL,NULL,'1-(4-chlorophenoxy)-3,3-dimethyl-1-(1H-1,2,4-triazol-1-yl)butan-2-one 5.000  (%)  ',NULL,'admin','安旺特股份有限公司',120),(895,'旺角(因得克)',3,'',NULL,'農藥製字第06372號',NULL,NULL,NULL,' methyl (S)-N-[7-chloro-2,3,4a,5-tetrahydro-4a-(methoxycarbonyl)indeno[1,2-e][1,3,4]oxadiazin-2-ylcarbonyl]-4’-(trifluoromethoxy)carbanilate  14.500 (%)',NULL,'admin','洽益化學股份有限公司',108),(896,'旺運(三氟得克利)',3,'',NULL,'農藥進字第03462號',NULL,NULL,NULL,'(1) methyl (E)-methoxyimino-{(E)-α-[1-(α,α,α-trifluoro-m-tolyl)ethylideneaminooxy]-o-tolyl}acetate...9.1% (2) (RS)-1-p-chlorophenyl-4,4-dimethyl-3-(1H-1,2,4-triazol-1- ylmethyl)pentan-3-ol...18.2%',NULL,'admin','雅飛有限公司',126),(897,'昌牧特金讚',2,'','有機資審字第108005號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0666021號','蓖麻粕、菜籽粕、豆粕、米糠、肉骨粉','全氮8.0%全磷酐2.1%全氧化鉀1.8%有機質90.0%',NULL,'admin','金峰生物科技有限公司',59),(898,'明日之星(畢芬寧)',3,'',NULL,'農藥製字第06096號',NULL,NULL,NULL,'2-methylbiphenyl-3-ylmethyl (Z)-(1RS,3RS)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate  2.800 (%)',NULL,'admin','臺益工業股份有限公司',39),(899,'明星(畢芬寧)',3,'',NULL,'農藥製字第06011號',NULL,NULL,NULL,'2-methylbiphenyl-3-ylmethyl (Z)-(1RS,3RS)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate  2.500 (%)',NULL,'admin','安旺特股份有限公司',120),(900,'易利特陶斯松(陶斯松)',3,'',NULL,'農藥進字第02552號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%) ',NULL,'admin','易利特開發有限公司',138),(901,'易利讚(賽滅淨)',3,'',NULL,'農藥進字第02203號',NULL,NULL,NULL,'N-cyclopropyl-1,3,5-triazine-2,4,6-triamine 75.000 (%) ',NULL,'admin','易利特開發有限公司',138),(902,'易利通(三泰芬)',3,'',NULL,'農藥進字第01573號',NULL,NULL,NULL,'1-(4-chlorophenoxy)-3,3-dimethyl-1-(1H-1,2,4-triazol-1-yl)butan-2-one 25.000 (%) ',NULL,'admin','易利特開發有限公司',138),(903,'易收好(依滅列)',3,'',NULL,'農藥製字第04637號',NULL,NULL,NULL,'(±)-1-(β-allyloxy-2,4-dichlorophenylethyl)imidazole 21.200 (%)',NULL,'admin','中華民國農會附設各級農會農化廠',131),(904,'易枯能(殺紋寧)',3,'',NULL,'農藥進字第01609號',NULL,NULL,NULL,'5-methylisoxazole-3-ol 30.000 (%)',NULL,'admin','易利特開發有限公司',138),(905,'易樂產(賽達松)',3,'',NULL,'農藥製字第00628號',NULL,NULL,NULL,' S-α-ethoxycarbonylbenzyl O,O-dimethyl phosphorodithioate  50.000 (%)',NULL,'admin','惠光股份有限公司',121),(906,'易治炭-精(待克利)',3,'',NULL,'農藥製字第05836號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%)',NULL,'admin','嘉農企業股份有限公司',117),(907,'易滅淨(菲克利)',3,'',NULL,'農藥進字第02107號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 5.000  (%)',NULL,'admin','易利特開發有限公司',138),(908,'易百拉(依滅列)',3,'',NULL,'農藥製字第03939號',NULL,NULL,NULL,'(±)-1-(β-allyloxy-2,4-dichlorophenylethyl)imidazole 21.200 (%)  ',NULL,'admin','正農化學股份有限公司',130),(909,'易福松(福瑞松)',3,'',NULL,'農藥進字第01879號',NULL,NULL,NULL,' O,O-diethyl S-ethylthiomethyl phosphorodithioate  10.000 (%)',NULL,'admin','易利特開發有限公司',138),(910,'星天地(畢芬寧)',3,'',NULL,'農藥製字第06028號',NULL,NULL,NULL,'2-methylbiphenyl-3-ylmethyl (Z)-(1RS,3RS)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate  2.800 (%)',NULL,'admin','正農化學股份有限公司',130),(911,'星寶達(鋅錳本達樂)',3,'',NULL,'農藥製字第04957號',NULL,NULL,NULL,'(1) MANGANESE ETHYLENEBIS(DITHIOCARBAMATE)(POLYMERIC) COMPLEX WITH ZINC SALT..........................................65%(2) METHYL N-PHENYLACETYL-N-2,6-XYLYL-DL-ALANINATE.......8%',NULL,'admin','台灣日產化工股份有限公司',104),(912,'春日黴素(嘉賜銅)',3,'',NULL,'農藥進字第02050號',NULL,NULL,NULL,'(1) [5-amino-2-methyl-6-(2,3,4,5,6,-pentahydroxycyclohexyloxy) tetrahydropyran-3-yl] amino-α-iminoacetic acid...2% (2) copper oxychloride...75.5%',NULL,'admin','久農貿易有限公司',170),(913,'昭和達克靈(四氯異苯腈)',3,'',NULL,'農藥進字第00408號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  75.000 (%)',NULL,'admin','瑞繐股份有限公司',168),(914,'普尅菌(普拔克)',3,'',NULL,'農藥進字第00403號',NULL,NULL,NULL,' propyl 3-(dimethylamino)propylcarbamate hydrochloride  66.500 (%)',NULL,'admin','台灣拜耳股份有限公司',101),(915,'普盛二號',2,'','有機資審字第105009號',NULL,'雜項堆肥(5-11)','肥製(質)字第0872009號','羽毛、蝦蟹殼、魚料、米糠、菸草、豆粉、糖蜜、菇類培植廢棄包、棕櫚灰','全氮3.5%全磷酐3.0%全氧化鉀2.5%有機質79.5%',NULL,'admin','普盛生物科技股份有限公司',48),(916,'普羅旺(普拔克)',3,'',NULL,'農藥進字第02603號',NULL,NULL,NULL,' propyl 3-(dimethylamino)propylcarbamate hydrochloride  66.500 (%)',NULL,'admin','鴻鋒化學有限公司',134),(917,'景安(益達胺)',3,'',NULL,'農藥進字第03388號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 18.200 (%) ',NULL,'admin','日農科技股份有限公司',105),(918,'有夠力(陶斯寧)',3,'',NULL,'農藥製字第05270號',NULL,NULL,NULL,'(1) O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate…22.5%  (2)(RS)-α-cyano-3-phenoxybenzyl (1RS)-cis-trans-3-(2,2-dichlorovinyl)-2,2-dimethylcyclopropanecarboxylate…2.5%',NULL,'admin','龍燈生物科技股份有限公司',76),(919,'有夠勇(阿巴汀)',3,'',NULL,'農藥製字第05650號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%) ',NULL,'admin','台農三和化工股份有限公司',119),(920,'有夠強(亞滅培)',3,'',NULL,'農藥製字第05762號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%)',NULL,'admin','立農化學股份有限公司',143),(921,'有夠湧',2,'','有機資審字第108014號',NULL,'液態有機質肥料(5-15)','肥製(質)字第0559171號','魚精、黃豆粉','全氮3.0%全磷酐2.2%全氧化鉀1.9%有機質33.5%',NULL,'admin','沅渼生物科技股份有限公司',69),(922,'有夠稱(亞托敏)',3,'',NULL,'農藥製字第06044號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','大勝化學工業股份有限公司',110),(923,'有夠讚(益達胺)',3,'',NULL,'農藥製字第05438號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 28.800 (%)  ',NULL,'admin','大勝化學工業股份有限公司',110),(924,'有貴人(快得寧)',3,'',NULL,'農藥製字第04671號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 40.000 (%) ',NULL,'admin','東和化學企業股份有限公司',109),(925,'有錢途(克凡派)',3,'',NULL,'農藥進字第02714號',NULL,NULL,NULL,'4-bromo-2-(4-chlorophenyl)-1-ethoxymethyl-5-trifluoromethylpyrrole-3-carbonitrile 10.000 (%) ',NULL,'admin','法台貿易有限公司',135),(926,'有露用(普拔克)',3,'',NULL,'農藥進字第02572號',NULL,NULL,NULL,' propyl 3-(dimethylamino)propylcarbamate hydrochloride  66.500 (%)',NULL,'admin','保加利亞商艾格立亞股份有限公司台灣分公司',167),(927,'望佳多(福多寧)',3,'',NULL,'農藥進字第01728號',NULL,NULL,NULL,' α-α-α-trifluoro-3’-isopropoxy-o-toluanilide  15.000 (%)',NULL,'admin','日佳農葯股份有限公司',178),(928,'望勇勤(阿巴汀)',3,'',NULL,'農藥製字第05083號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%) ',NULL,'admin','世大農化工廠股份有限公司	',114),(929,'未銹斗(得克利)',3,'',NULL,'農藥製字第05290號',NULL,NULL,NULL,'(RS)-1-p-chlorophenyl-4,4-dimethyl-3-(1H-1,2,4-triazol-1- ylmethyl)pentan-3-ol 25.900 (%) ',NULL,'admin','惠光股份有限公司',121),(930,'杜邦統讚(凡殺克絕)',3,'',NULL,'農藥進字第02128號',NULL,NULL,NULL,'(1) 3-anilino-5-methyl-5-(4-phenoxyphenyl)-1,3-oxazolidine-2,4-dione...22.5% (2) 1-(2-cyano-2-methoxyiminoacetyl)-3-ethylurea...30%',NULL,'admin','台灣杜邦農業科學股份有限公司',161),(931,'東和丹(加保扶)',3,'',NULL,'農藥製字第04778號',NULL,NULL,NULL,'2,3-dihydro-2,2-dimethylbenzofuran-7-yl methylcarbamate  3.000 (%)',NULL,'admin','東和化學企業股份有限公司',109),(932,'東和好(加保利)',3,'',NULL,'農藥製字第05250號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 40.000 (%) ',NULL,'admin','東和化學企業股份有限公司',109),(933,'東方不敗(百利普芬)',3,'',NULL,'農藥進字第03163號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 11.000 (%)    ',NULL,'admin','大成化學工業股份有限公司',127),(934,'東豐牌No.1有機質肥料',2,'','有機資審字第100012號',NULL,'雜項堆肥(5-11)','肥製(質)字第0180003號','禽畜糞、米糠、蓖麻粕','全氮4.9%全磷酐2.1%全氧化鉀1.9%有機質65%',NULL,'admin','有限責任花蓮縣花東有機農產加工生產合作社',28),(935,'東農牌10號有機質肥料',2,'','有機資審字第101020號',NULL,'一般堆肥(5-10)','肥製(質)字第0042034號','蔗渣、花生殼、菇類培植廢棄包、花生碎尾仁','全氮2.4%全磷酐2.4%全氧化鉀1.2%有機質56%',NULL,'admin','保證責任嘉義縣東石合作農場',27),(936,'東農牌11號有機質肥料',2,'','有機資審字第103003號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0042022號','蔗渣、花生粕、米糠、芝麻粕、椰子粕、蓖麻粕','全氮4.0%全磷酐2.0%全氧化鉀2.0%有機質74%',NULL,'admin','保證責任嘉義縣東石合作農場',27),(937,'東農牌1號有機質肥料',2,'','有機資審字第100006號',NULL,'植物渣粕肥料(5-01)','肥製(質)字第0042029號','花生粕、米糠、芝麻粕、椰子粕、蓖麻粕、黃豆粕','全氮5.5%全磷酐2.6%全氧化鉀2.3%有機質82%',NULL,'admin','保證責任嘉義縣東石合作農場',27),(938,'松三太子(三泰芬)',3,'',NULL,'農藥進字第01519號',NULL,NULL,NULL,'1-(4-chlorophenoxy)-3,3-dimethyl-1-(1H-1,2,4-triazol-1-yl)butan-2-one 25.000 (%)',NULL,'admin','松樹國際有限公司',137),(939,'松克贊(白克松)',3,'',NULL,'農藥製字第03772號',NULL,NULL,NULL,'O-(1-(4-CHLOROPHENYL)-4-PYRAZOLYL)-O-ETHYL-S-                PROPYL PHOSPHOROTHIOATE 35.000 (%)  ',NULL,'admin','立農化學股份有限公司',143),(940,'松大滅松(大滅松)',3,'',NULL,'農藥進字第01100號',NULL,NULL,NULL,' O, O-dimethyl-S-methylcarbamoylmethyl phosphorodithioate  44.000 (%)',NULL,'admin','松樹國際有限公司',137),(941,'松好作夥(陶斯松)',3,'',NULL,'農藥進字第01318號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 25.000 (%) ',NULL,'admin','松樹國際有限公司',137),(942,'松好斯本(陶斯松)',3,'',NULL,'農藥進字第01319號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%)   ',NULL,'admin','松樹國際有限公司',137),(943,'松拜律通(三泰芬)',3,'',NULL,'農藥進字第01614號',NULL,NULL,NULL,'1-(4-chlorophenoxy)-3,3-dimethyl-1-(1H-1,2,4-triazol-1-yl)butan-2-one 25.000 (%) ',NULL,'admin','松樹國際有限公司',137),(944,'松樹大禧(第滅寧)',3,'',NULL,'農藥進字第01303號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%) ',NULL,'admin','松樹國際有限公司',137),(945,'松樹納克(加保利)',3,'',NULL,'農藥進字第01157號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 50.000 (%)  ',NULL,'admin','松樹國際有限公司',137),(946,'松樹馬拉(馬拉松)',3,'',NULL,'農藥進字第01708號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 25.000 (%)',NULL,'admin','松樹國際有限公司',137),(947,'松疫奇棒(快得寧)',3,'',NULL,'農藥進字第01556號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 33.500 (%) ',NULL,'admin','松樹國際有限公司',137),(948,'松疫急粉(快得寧)',3,'',NULL,'農藥進字第01557號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 40.000 (%)  ',NULL,'admin','松樹國際有限公司',137),(949,'松穩夠本(陶斯松)',3,'',NULL,'農藥進字第01210號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 25.000 (%) ',NULL,'admin','松樹國際有限公司',137),(950,'松蘇力菌(蘇力菌)',3,'',NULL,'農藥進字第01467號',NULL,NULL,NULL,' VIABLE SPORES OF BACILLUS THURINGIENSIS  16,000IU/MG',NULL,'admin','松樹國際有限公司',137),(951,'果來特(賽速安)',3,'',NULL,'農藥進字第02204號',NULL,NULL,NULL,'3-(2-chloro-1,3-thiazol-5-ylmethyl)-5-methyl-1,3,5-oxadiazinan-4-ylidene(nitro)amine 25.000 (%)',NULL,'admin','台灣先正達股份有限公司',144),(952,'果再來(亞托敏)',3,'',NULL,'農藥進字第02447號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  50.000 (%)',NULL,'admin','台灣先正達股份有限公司',144),(953,'果再青(氫氧化銅)',3,'',NULL,'農藥進字第01979號',NULL,NULL,NULL,' CUPRIC HYDROXIDE  77.500 (%)',NULL,'admin','貝士得開發企業有限公司',163),(954,'果卡好(第滅寧)',3,'',NULL,'農藥製字第02271號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%)',NULL,'admin','惠大實業股份有限公司',157),(955,'果太保(三元硫酸銅)',3,'',NULL,'農藥進字第02219號',NULL,NULL,NULL,'cupric sulfate-tricupric hydroxide (Cu...14.94%(W/W)) 27.120 (%)',NULL,'admin','嘉濱貿易有限公司',111),(956,'果好收(菲克利)',3,'',NULL,'農藥進字第02361號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 5.000  (%)',NULL,'admin','台灣龍燈股份有限公司',152),(957,'果必佳(滅派林)',3,'',NULL,'農藥進字第02094號',NULL,NULL,NULL,'N-(4-Methyl-6-prop-1-ynylpyrimidin-2-yl)aniline 40.000 (%)  ',NULL,'admin','臺灣庵原農藥股份有限公司',113),(958,'果樂達(益發靈)',3,'',NULL,'農藥製字第04544號',NULL,NULL,NULL,'N-DICHLOROFLUOROMETHYLTHIO-N’,N’-DIMETHYL-N-PHENYLSULFAMIDE 50.000 (%)',NULL,'admin','興農股份有限公司',85),(959,'果神(三元硫酸銅)',3,'',NULL,' 農藥製字第04977號',NULL,NULL,NULL,'cupric sulfate-tricupric hydroxide (Cu...14.94%(W/W)) 27.120 (%)     ',NULL,'admin','臺聯實業股份有限公司',107),(960,'果穩讚(快得保淨)',3,'',NULL,'農藥製字第04369號',NULL,NULL,NULL,'(1) dimethyl 4,4’-(o-phenylene)bis(3-thioallophanate)...35%(2) bis(quinolin-8-olato-O,N)copper...40%',NULL,'admin','利台化學工業股份有限公司',116),(961,'果興旺(錳乃浦)',3,'',NULL,'農藥製字第03546號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','臺益工業股份有限公司',39),(962,'果菜多-101(氫氧化銅)',3,'',NULL,'農藥進字第00745號',NULL,NULL,NULL,' CUPRIC HYDROXIDE  77.000 (%)',NULL,'admin','瑞繐股份有限公司',168),(963,'果菜寶(氫氧化銅)',3,'',NULL,'農藥製字第04374號',NULL,NULL,NULL,' CUPRIC HYDROXIDE  77.000 (%)',NULL,'admin','利台化學工業股份有限公司',116),(964,'果菜旺(氫氧化銅)',3,'',NULL,'農藥進字第02791號',NULL,NULL,NULL,' CUPRIC HYDROXIDE  37.500 (%)',NULL,'admin','瑞繐股份有限公司',168),(965,'果蟲寶(加保利)',3,'',NULL,'農藥製字第04366號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 40.000 (%)',NULL,'admin','利台化學工業股份有限公司',116),(966,'果蠅寶(馬拉松)',3,'',NULL,'農藥製字第05784號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 50.000 (%) ',NULL,'admin','安旺特股份有限公司',120),(967,'果蠅粉(馬拉松)',3,'',NULL,'農藥製字第03308號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 25.000 (%)  ',NULL,'admin','聯利農業科技股份有限公司',103),(968,'果賜寶(亞托待克利)',3,'',NULL,'農藥製字第06116號',NULL,NULL,NULL,'(1) methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate...200 g/L (2) cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1-ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether...125 g/L 325 G/L (32.5% W/V) ',NULL,'admin','臺聯實業股份有限公司',107),(969,'果金賺(畢芬寧)',3,'',NULL,'農藥製字第05825號',NULL,NULL,NULL,'2-methylbiphenyl-3-ylmethyl (Z)-(1RS,3RS)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate  2.800 (%)',NULL,'admin','臺聯實業股份有限公司',107),(970,'枝枝青(氫氧化銅)',3,'',NULL,'農藥製字第02645號',NULL,NULL,NULL,' CUPRIC HYDROXIDE  37.500 (%)',NULL,'admin','好速化學股份有限公司',118),(971,'根尚勇(本達樂)',3,'',NULL,'農藥製字第05009號',NULL,NULL,NULL,' methyl N-phenylacetyl-N-2,6-xylyl-DL-alaninate  35.000 (%)',NULL,'admin','台灣日產化工股份有限公司',104),(972,'棟蓋久(依普同)',3,'',NULL,'農藥進字第03406號',NULL,NULL,NULL,'3-(3,5-dichlorophenyl)-N-isopropyl-2,4-dioxoimidazolidine-1-carboxamide  23.700 (%)',NULL,'admin','嘉濱貿易有限公司',111),(973,'樂克寧(快得寧)',3,'',NULL,'農藥製字第00696號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 33.500 (%)',NULL,'admin','嘉農企業股份有限公司',117),(974,'樂嘉6號肥',2,'','有機資審字第106004號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0431096號','蓖麻粕、菜籽粕、花生粕、棕櫚粕、芝麻粕、骨粉','全氮6.0%全磷酐3.0%全氧化鉀2.0%有機質85.0%',NULL,'admin','金農友企業股份有限公司',41),(975,'樂嘉瓜果甜',2,'','有機資審字第106014號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0431100號','蓖麻粕、菜籽粕、椰子粕、棕梠灰、魚精','全氮4.5%全磷酐2.0%全氧化鉀6.0%有機質85.0%',NULL,'admin','金農友企業股份有限公司',41),(976,'樂土(托福松)',3,'',NULL,'農藥製字第03860號',NULL,NULL,NULL,' S-tert-butylthiomethyl O,O-diethyl phosphorodithioate  10.000 (%)',NULL,'admin','興農股份有限公司',85),(977,'樂富果(依普同)',3,'',NULL,'農藥進字第03228號',NULL,NULL,NULL,'3-(3,5-dichlorophenyl)-N-isopropyl-2,4-dioxoimidazolidine-1-carboxamide  50.000 (%)',NULL,'admin','台灣富美實有限公司',140),(978,'樂得淨(甲基多保淨)',3,'',NULL,'農藥製字第04020號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 70.000 (%) ',NULL,'admin','嘉泰企業股份有限公司',102),(979,'樂心(陶斯松)',3,'',NULL,'農藥製字第03221號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 5.000  (%) ',NULL,'admin','正農化學股份有限公司',130),(980,'樂斯本(陶斯松)',3,'',NULL,'農藥製字第01347號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 2.500  (%)',NULL,'admin','聯利農業科技股份有限公司',103),(981,'樂樂安(祿芬隆)',3,'',NULL,'農藥製字第06407號',NULL,NULL,NULL,'(RS)-1-[2,5-dichloro-4-(1,1,2,3,3,3-hexafluoropropoxy)- phenyl]-3-(2,6-difluorobenzoyl)-urea  4.400 (%)',NULL,'admin','東和化學企業股份有限公司',109),(982,'樂豐收(賓得克利)',3,'',NULL,'農藥製字第06472號',NULL,NULL,NULL,'(1) 1-(4-chlorobenzyl)-1-cyclopentyl-3-phenylurea...15% (2) (RS)-1-p-chlorophenyl-4,4-dimethyl-3-(1H-1,2,4-triazol-1- ylmethyl)pentan-3-ol...10%',NULL,'admin','台農三和化工股份有限公司',119),(983,'樂農寶(枯草桿菌Y1336)',3,'',NULL,'農藥製字第05454號',NULL,NULL,NULL,'BACILLUS SUBTILIS Y1336    VIABLE SPORES OF BACILLUS SUBTILIS Y1336 50% 1X10^9 CFU/G  以上',NULL,'admin','百泰生物科技股份有限公司',26),(984,'樂陶陶(陶斯松)',3,'',NULL,'農藥製字第05790號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 50.000 (%)',NULL,'admin','利台化學工業股份有限公司',116),(985,'標靶(得克利)',3,'',NULL,'農藥製字第05699號',NULL,NULL,NULL,'(RS)-1-p-chlorophenyl-4,4-dimethyl-3-(1H-1,2,4-triazol-1- ylmethyl)pentan-3-ol 25.900 (%)',NULL,'admin','利台化學工業股份有限公司',116),(986,'欣德寶(腈硫醌)',3,'',NULL,'農藥進字第02152號',NULL,NULL,NULL,'5,10-dihydro-5,10-dioxonaphtho[2,3-b]-1,4-dithiine-2,3-dicarbonitrile 70.000 (%) ',NULL,'admin','翰金興業有限公司',165),(987,'歐囉讚(陶斯寧)',3,'',NULL,'農藥製字第05918號',NULL,NULL,NULL,'(1) O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate…45.45% (2) (RS)-α-cyano-3-phenoxybenzyl (1RS)-cis-trans-3-(2,2-dichlorovinyl)-2,2-dimethylcyclopropanecarboxylate…4.55%',NULL,'admin','臺益工業股份有限公司',39),(988,'歐斯寧(第滅寧)',3,'',NULL,'農藥製字第05183號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%)',NULL,'admin','臺灣庵原農藥股份有限公司',113),(989,'正港勇(阿巴汀)',3,'',NULL,'農藥製字第05530號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%)',NULL,'admin','瑞芳植物保護股份有限公司',115),(990,'正港稱(亞托敏)',3,'',NULL,'農藥製字第06300號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  50.000 (%)',NULL,'admin','華夏科學農化股份有限公司',106),(991,'正豐冬(加保扶)',3,'',NULL,'農藥製字第02469號',NULL,NULL,NULL,'2,3-dihydro-2,2-dimethylbenzofuran-7-yl methylcarbamate  3.000 (%)',NULL,'admin','台灣正豐植保股份有限公司',128),(992,'正豐勇(亞滅培)',3,'',NULL,'農藥製字第06574號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%)',NULL,'admin','台灣正豐植保股份有限公司',128),(993,'正豐強(亞托敏)',3,'',NULL,'農藥製字第06573號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','台灣正豐植保股份有限公司',128),(994,'正豐穩(因滅汀)',3,'',NULL,'農藥製字第06520號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','台灣正豐植保股份有限公司',128),(995,'正豪勇(亞滅培)',3,'',NULL,'農藥製字第05573號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%)',NULL,'admin','日農科技股份有限公司',105),(996,'正通(依滅列)',3,'',NULL,'農藥製字第04355號',NULL,NULL,NULL,'(±)-1-(β-allyloxy-2,4-dichlorophenylethyl)imidazole 21.200 (%) ',NULL,'admin','臺益工業股份有限公司',39),(997,'死勁離(因滅汀)',3,'',NULL,'農藥進字第03319號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','優必樂有限公司',151),(998,'殊立菌(蘇力菌)',3,'',NULL,'農藥製字第03923號',NULL,NULL,NULL,' VIABLE SPORES OF BACILLUS THURINGIENSIS  16,000IU/MG',NULL,'admin','興農股份有限公司',85),(999,'殺地蟲(福瑞松)',3,'',NULL,'農藥製字第03397號',NULL,NULL,NULL,' O,O-diethyl S-ethylthiomethyl phosphorodithioate  10.000 (%)',NULL,'admin','聯利農業科技股份有限公司',103),(1000,'殺天虎(益達胺)',3,'',NULL,'農藥製字第05386號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%)      ',NULL,'admin','日農科技股份有限公司',105),(1001,'殺必死(因滅汀)',3,'',NULL,'農藥製字第06538號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','嘉農企業股份有限公司',117),(1002,'殺必蝨(派滅淨)',3,'',NULL,'農藥製字第06470號',NULL,NULL,NULL,'(E)-4,5-dihydro-6-methyl-4-(3-pyridylmethyleneamino)-1,2,4- triazin-3(2H)-one 25.000 (%)     ',NULL,'admin','立農化學股份有限公司',143),(1003,'殺滅速(大滅松)',3,'',NULL,'農藥製字第03274號',NULL,NULL,NULL,' O, O-dimethyl-S-methylcarbamoylmethyl phosphorodithioate  44.000 (%)',NULL,'admin','惠大實業股份有限公司',157),(1004,'殺無赦(亞滅培)',3,'',NULL,'農藥製字第06075號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%)',NULL,'admin','正農化學股份有限公司',130),(1005,'殺猛(加保利)',3,'',NULL,'農藥製字第03897號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 85.000 (%)',NULL,'admin','富農化學工業股份有限公司',132),(1006,'殺紋寧 (農會農化廠)',3,'',NULL,'農藥製字第02829號',NULL,NULL,NULL,'5-methylisoxazole-3-ol 30.000 (%)',NULL,'admin','中華民國農會附設各級農會農化廠',131),(1007,'殺能蟲(賽滅淨)',3,'',NULL,'農藥製字第04870號',NULL,NULL,NULL,'N-cyclopropyl-1,3,5-triazine-2,4,6-triamine 8.900  (%)',NULL,'admin','興農股份有限公司',85),(1008,'殺菌淨(甲基多保淨)',3,'',NULL,'農藥製字第05351號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 40.000 (%) ',NULL,'admin','洽益化學股份有限公司',108),(1009,'殺菌王(甲基多保淨)',3,'',NULL,'農藥製字第02328號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 70.000 (%)   ',NULL,'admin','龍燈生物科技股份有限公司',76),(1010,'殺蟲利(因滅汀)',3,'',NULL,'農藥製字第05486號',NULL,NULL,NULL,'因滅汀 5%',NULL,'admin','中華民國農會附設各級農會農化廠',131),(1011,'殺蟲讚(加保利)',3,'',NULL,'農藥製字第06262號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 85.000 (%)',NULL,'admin','台農三和化工股份有限公司',119),(1012,'毒佳絲 44.9%(陶斯松)',3,'',NULL,'農藥製字第05381號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 44.900 (%) ',NULL,'admin','聯利農業科技股份有限公司',103),(1013,'毒佳絲 5%(陶斯松)',3,'',NULL,'農藥製字第05180號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 5.000  (%)',NULL,'admin','聯利農業科技股份有限公司',103),(1014,'毒斯精(陶斯松)',3,'',NULL,'農藥製字第05153號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%)',NULL,'admin','聯利農業科技股份有限公司',103),(1015,'毒斯蟲(陶斯松)',3,'',NULL,'農藥製字第03283號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%) ',NULL,'admin','正農化學股份有限公司',130),(1016,'毒死蟲(陶斯松)',3,'',NULL,'農藥製字第04035號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%) ',NULL,'admin','東和化學企業股份有限公司',109),(1017,'毒絲本 2.5%(陶斯松)',3,'',NULL,'農藥製字第02749號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 2.500  (%) ',NULL,'admin','惠光股份有限公司',121),(1018,'毒絲本 40.8%(陶斯松)',3,'',NULL,'農藥製字第00197號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%)',NULL,'admin','惠光股份有限公司',121),(1019,'毒絲本 5%(陶斯松)',3,'',NULL,'農藥製字第01159號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 5.000  (%)',NULL,'admin','惠光股份有限公司',121),(1020,'毒絲本 50%(陶斯松)',3,'',NULL,'農藥製字第05705號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 50.000 (%)  ',NULL,'admin','惠光股份有限公司',121),(1021,'毒線蟲(依得利)',3,'',NULL,'農藥製字第00166號',NULL,NULL,NULL,' ethyl 4-methylthio-m-tolyl isopropylphosphoramidate  10.000 (%)',NULL,'admin','惠光股份有限公司',121),(1022,'毒蟲勇(陶斯松)',3,'',NULL,'農藥進字第01688號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 25.000 (%) ',NULL,'admin','合林企業有限公司',166),(1023,'毒蟲本(陶斯松)',3,'',NULL,'農藥製字第04280號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 5.000  (%)   ',NULL,'admin','世大農化工廠股份有限公司	',114),(1024,'毒蟲精(加保利)',3,'',NULL,'農藥製字第02244號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 39.500 (%)',NULL,'admin','聯利農業科技股份有限公司',103),(1025,'毒速丹 25%(陶斯松)',3,'',NULL,'農藥製字第00690號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 25.000 (%) ',NULL,'admin','臺益工業股份有限公司',39),(1026,'毒速丹 5%(陶斯松)',3,'',NULL,'農藥製字第04136號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 5.000  (%) ',NULL,'admin','臺益工業股份有限公司',39),(1027,'比久寧(佈飛松)',3,'',NULL,'農藥進字第01974號',NULL,NULL,NULL,'O-4-bromo-2-chlorophenyl O-ethyl S-propyl phosphorothioate 43.000 (%) ',NULL,'admin','臺聯實業股份有限公司',107),(1028,'水傷靈(四氯保淨)',3,'',NULL,'農藥製字第03483號',NULL,NULL,NULL,'(1) dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate)...20% (2) tetrachloroisophthalonitrile...50%',NULL,'admin','正農化學股份有限公司',130),(1029,'水咚咚(阿巴汀)',3,'',NULL,'農藥製字第05552號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%) ',NULL,'admin','日農科技股份有限公司',105),(1030,'水噴噴(陶斯寧)',3,'',NULL,'農藥製字第05321號',NULL,NULL,NULL,'(1) O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate…45.45% (2) (RS)-α-cyano-3-phenoxybenzyl (1RS)-cis-trans-3-(2,2-dichlorovinyl)-2,2-dimethylcyclopropanecarboxylate…4.55%',NULL,'admin','東和化學企業股份有限公司',109),(1031,'水姑娘(派滅淨)',3,'',NULL,'農藥製字第06447號',NULL,NULL,NULL,'(E)-4,5-dihydro-6-methyl-4-(3-pyridylmethyleneamino)-1,2,4- triazin-3(2H)-one 25.000 (%)',NULL,'admin','洽益化學股份有限公司',108),(1032,'水擱讚(亞托待克利)',3,'',NULL,'農藥製字第06029號',NULL,NULL,NULL,'(1) methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate...200 g/L (2) cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1-ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether...125 g/L 325 G/L (32.5% W/V) ',NULL,'admin','瑞芳植物保護股份有限公司',115),(1033,'永富王(托福松)',3,'',NULL,'農藥製字第04517號',NULL,NULL,NULL,' S-tert-butylthiomethyl O,O-diethyl phosphorodithioate  10.000 (%)',NULL,'admin','惠光股份有限公司',121),(1034,'永讚(賽達松)',3,'',NULL,'農藥製字第00737號',NULL,NULL,NULL,' S-α-ethoxycarbonylbenzyl O,O-dimethyl phosphorodithioate  50.000 (%)',NULL,'admin','眾益農業生技股份有限公司',124),(1035,'汰斯蟲(陶斯松)',3,'',NULL,'農藥進字第01631號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%)   ',NULL,'admin','易利特開發有限公司',138),(1036,'汰白粉(白克列)',3,'',NULL,'農藥進字第03229號',NULL,NULL,NULL,'2-chloro-N-(4’-chlorobiphenyl-2-yl)nicotinamide 50.000 (%)',NULL,'admin','雅飛有限公司',126),(1037,'汽嘉讚(賽滅淨)',3,'',NULL,'農藥進字第03429號',NULL,NULL,NULL,'N-cyclopropyl-1,3,5-triazine-2,4,6-triamine 75.000 (%) ',NULL,'admin','台灣先正達股份有限公司',144),(1038,'沃鬆2號專業栽培介質',2,'','有機資審字第104002號',NULL,'有機質栽培介質(7-03)','肥製(輔)字第0776036號','泥炭、椰殼、石灰','全氮1.2%全磷酐0.2%全氧化鉀0.2%有機質85.0%',NULL,'admin','大益農業科技股份有限公司',43),(1039,'沒疫健(曼普胺)',3,'',NULL,'農藥進字第02771號',NULL,NULL,NULL,'(RS)-2-(4-chlorophenyl)-N-[3-methoxy-4-(prop-2-ynyloxy)phenethyl]-2-(prop-2-ynyloxy)acetamide  250 G/L (25% W/V)',NULL,'admin','台灣先正達股份有限公司',144),(1040,'沒看蟲(賽洛寧)',3,'',NULL,'農藥進字第02599號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.800  (%)  ',NULL,'admin','優必樂有限公司',151),(1041,'沖天炮(大滅松)',3,'',NULL,'農藥製字第04521號',NULL,NULL,NULL,' O, O-dimethyl-S-methylcarbamoylmethyl phosphorodithioate  44.000 (%)',NULL,'admin','世大農化工廠股份有限公司	',114),(1042,'油夠好用',3,'','有機資審字第107037號','植保製字第00071號',NULL,NULL,NULL,'苦楝油',NULL,'admin','興農股份有限公司',85),(1043,'治多星(畢芬寧)',3,'',NULL,'農藥進字第02284號',NULL,NULL,NULL,'2-methylbiphenyl-3-ylmethyl (Z)-(1RS,3RS)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate  2.800 (%)',NULL,'admin','雅飛有限公司',126),(1044,'治斑寧(依普同)',3,'',NULL,'農藥進字第02840號',NULL,NULL,NULL,'3-(3,5-dichlorophenyl)-N-isopropyl-2,4-dioxoimidazolidine-1-carboxamide  50.000 (%)',NULL,'admin','生力化學工業股份有限公司',139),(1045,'治枯寧(菲克利)',3,'',NULL,'農藥製字第05134號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 10.000 (%)    ',NULL,'admin','華夏科學農化股份有限公司',106),(1046,'治滅蟲(大滅松)',3,'',NULL,'農藥製字第00182號',NULL,NULL,NULL,' O, O-dimethyl-S-methylcarbamoylmethyl phosphorodithioate  44.000 (%)',NULL,'admin','國豐化學工業股份有限公司',112),(1047,'治炭素(待克利)',3,'',NULL,'農藥製字第05338號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%) ',NULL,'admin','台灣日產化工股份有限公司',104),(1048,'治炭酸(待克利)',3,'',NULL,'農藥製字第06310號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%)',NULL,'admin','華夏科學農化股份有限公司',106),(1049,'治爛菌(大克爛)',3,'',NULL,'農藥製字第03809號',NULL,NULL,NULL,'2,6-DICHLORO-4-NITROANILINE 50.000 (%) ',NULL,'admin','興農股份有限公司',85),(1050,'治直好(四氯曼普胺)',3,'',NULL,'農藥進字第02842號',NULL,NULL,NULL,'(1) tetrachloroisophthalonitrile...400 G/L(40% W/V) (2) (RS)-2-(4-chlorophenyl)-N-[3-methoxy-4-(prop-2-ynyloxy)phenethyl]-2-(prop-2-ynyloxy)acetamide...40 G/L(4% W/V)',NULL,'admin','台灣先正達股份有限公司',144),(1051,'治紋枯(菲克利)',3,'',NULL,'農藥製字第05056號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 10.000 (%)',NULL,'admin','利台化學工業股份有限公司',116),(1052,'治紋淨(菲克利)',3,'',NULL,'農藥進字第02338號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 10.000 (%)',NULL,'admin','東鋒股份有限公司',154),(1053,'治蟲寧(第滅寧)',3,'',NULL,'農藥進字第02480號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%)',NULL,'admin','海博生技股份有限公司',146),(1054,'治蟲寶(加保利)',3,'',NULL,'農藥製字第00612號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 85.000 (%)',NULL,'admin','利台化學工業股份有限公司',116),(1055,'治蟲淨(賽滅淨)',3,'',NULL,'農藥進字第02520號',NULL,NULL,NULL,'N-cyclopropyl-1,3,5-triazine-2,4,6-triamine 75.000 (%) ',NULL,'admin','海博生技股份有限公司',146),(1056,'治蟲王(阿巴汀)',3,'',NULL,'農藥進字第02329號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%)',NULL,'admin','春匯有限公司',149),(1057,'治蠅寶(馬拉松)',3,'',NULL,'農藥製字第04817號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 25.000 (%)     ',NULL,'admin','洽益化學股份有限公司',108),(1058,'治露寶(普拔克)',3,'',NULL,'農藥製字第04721號',NULL,NULL,NULL,' propyl 3-(dimethylamino)propylcarbamate hydrochloride  39.500 (%)',NULL,'admin','興農股份有限公司',85),(1059,'治黃葉',3,'','有機資審字第106022號','農藥製字第06172號',NULL,NULL,NULL,'蕈狀芽孢桿菌BacillusmycoidesAGB011×10^8CFU/g以上；其他增量劑99%',NULL,'admin','聯發生物科技股份有限公司',81),(1060,'泉力精(氫氧化銅)',3,'',NULL,'農藥製字第05327號',NULL,NULL,NULL,' CUPRIC HYDROXIDE  37.500 (%)',NULL,'admin','國豐化學工業股份有限公司',112),(1061,'泉功利(賽洛寧)',3,'',NULL,'農藥製字第05744號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.500  (%)  ',NULL,'admin','國豐化學工業股份有限公司',112),(1062,'泉成祝好(得芬諾)',3,'',NULL,'農藥製字第05671號',NULL,NULL,NULL,'N-tert-butyl-N’-(4-ethylbenzoyl)-3,5-dimethylbenzohydrazide  19.700 (%)',NULL,'admin','國豐化學工業股份有限公司',112),(1063,'法-財一級棒(快得寧)',3,'',NULL,'農藥製字第04991號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 33.500 (%) ',NULL,'admin','大成化學工業股份有限公司',127),(1064,'法-財卡讚(加保利)',3,'',NULL,'農藥製字第04952號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 40.000 (%)  ',NULL,'admin','大成化學工業股份有限公司',127),(1065,'法-財如意(撲克拉錳)',3,'',NULL,'農藥進字第02694號',NULL,NULL,NULL,'N-propyl-N-[2-(2,4,6-trichlorophenoxy)ethyl]imidazole-1-carboxamide complex with manganese(II) chloride 50.000 (%)   ',NULL,'admin','法台貿易有限公司',135),(1066,'法-財寶你豪(賓得克利)',3,'',NULL,'農藥製字第05546號',NULL,NULL,NULL,'(1) 1-(4-chlorobenzyl)-1-cyclopentyl-3-phenylurea...15% (2) (RS)-1-p-chlorophenyl-4,4-dimethyl-3-(1H-1,2,4-triazol-1- ylmethyl)pentan-3-ol...10%',NULL,'admin','大成化學工業股份有限公司',127),(1067,'法-財正武功(賽洛寧)',3,'',NULL,'農藥進字第02547號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.800  (%)',NULL,'admin','法台貿易有限公司',135),(1068,'法-財源到(克收欣)',3,'',NULL,'農藥進字第02628號',NULL,NULL,NULL,' methyl (E)-methoxyimino[2-(o-tolyloxymethyl)phenyl]acetate  44.200 (%)',NULL,'admin','法台貿易有限公司',135),(1069,'法-財翔強(邁克尼)',3,'',NULL,'農藥製字第05396號',NULL,NULL,NULL,'2-p-chlorophenyl-2-(1H-1,2,4-triazol-1-ylmethyl)hexanenitrile 13.400 (%)',NULL,'admin','大成化學工業股份有限公司',127),(1070,'法-財翔鴻(賽達松)',3,'',NULL,'農藥製字第00503號',NULL,NULL,NULL,' S-α-ethoxycarbonylbenzyl O,O-dimethyl phosphorodithioate  50.000 (%)',NULL,'admin','大成化學工業股份有限公司',127),(1071,'法-財蟲寶(因滅汀)',3,'',NULL,'農藥進字第02720號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','法台貿易有限公司',135),(1072,'法-財賺蓋多(菲克利)',3,'',NULL,'農藥製字第05635號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 23.000 (%)',NULL,'admin','大成化學工業股份有限公司',127),(1073,'法-財霸王(錳乃浦)',3,'',NULL,'農藥製字第05000號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  33.000 (%)',NULL,'admin','大成化學工業股份有限公司',127),(1074,'法-財飽飽(克收欣)',3,'',NULL,'農藥進字第02706號',NULL,NULL,NULL,' methyl (E)-methoxyimino[2-(o-tolyloxymethyl)phenyl]acetate  44.200 (%)',NULL,'admin','大成化學工業股份有限公司',127),(1075,'法-達保淨(甲基多保淨)',3,'',NULL,'農藥製字第04906號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 40.000 (%) ',NULL,'admin','大成化學工業股份有限公司',127),(1076,'法財-大富豪(賽洛寧)',3,'',NULL,'農藥製字第05026號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.800  (%)  ',NULL,'admin','大成化學工業股份有限公司',127),(1077,'法財-特別稱(亞托待克利)',3,'',NULL,'農藥製字第06220號',NULL,NULL,NULL,'(1) methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate...200 g/L (2) cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1-ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether...125 g/L 325 G/L (32.5% W/V)',NULL,'admin','大成化學工業股份有限公司',127),(1078,'法財-金翔喨(百利普芬)',3,'',NULL,'農藥製字第06271號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 11.000 (%) ',NULL,'admin','大成化學工業股份有限公司',127),(1079,'法財-雙鐵水(益達胺)',3,'',NULL,'農藥製字第05257號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 18.200 (%)  ',NULL,'admin','大成化學工業股份有限公司',127),(1080,'法財大家囍(第滅寧)',3,'',NULL,'農藥進字第02743號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.400  (%)',NULL,'admin','法台貿易有限公司',135),(1081,'法財特別好(待克利)',3,'',NULL,'農藥進字第03084號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%) ',NULL,'admin','大成化學工業股份有限公司',127),(1082,'法財猛(待克利)',3,'',NULL,'農藥進字第03171號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 10.000 (%)',NULL,'admin','大成化學工業股份有限公司',127),(1083,'法財禧寶精(第滅寧)',3,'',NULL,'農藥製字第04901號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.400  (%) ',NULL,'admin','大成化學工業股份有限公司',127),(1084,'法財賜露-精(四氯異苯腈)',3,'',NULL,'農藥製字第05274號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  40.000 (%)',NULL,'admin','大成化學工業股份有限公司',127),(1085,'法財金夠力(益達胺)',3,'',NULL,'農藥進字第03455號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 28.800 (%)',NULL,'admin','大成化學工業股份有限公司',127),(1086,'法財－双倍好(益達胺)',3,'',NULL,'農藥製字第06464號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 28.800 (%)',NULL,'admin','大成化學工業股份有限公司',127),(1087,'法財－攏相挺(陶斯松)',3,'',NULL,'農藥進字第03298號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 50.000 (%) ',NULL,'admin','大成化學工業股份有限公司',127),(1088,'法財－炭健康(待克利)',3,'',NULL,'農藥進字第03161號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%)  ',NULL,'admin','大成化學工業股份有限公司',127),(1089,'法財－行好運(克收欣)',3,'',NULL,'農藥進字第03160號',NULL,NULL,NULL,' methyl (E)-methoxyimino[2-(o-tolyloxymethyl)phenyl]acetate  50.000 (%)',NULL,'admin','大成化學工業股份有限公司',127),(1090,'法－財得利(得克利)',3,'',NULL,'農藥製字第05645號',NULL,NULL,NULL,'(RS)-1-p-chlorophenyl-4,4-dimethyl-3-(1H-1,2,4-triazol-1- ylmethyl)pentan-3-ol 25.900 (%) ',NULL,'admin','大成化學工業股份有限公司',127),(1091,'法－財得福(得芬諾)',3,'',NULL,'農藥製字第05548號',NULL,NULL,NULL,' N-tert-butyl-N’-(4-ethylbenzoyl)-3,5-dimethylbenzohydrazide  19.700 (%)',NULL,'admin','大成化學工業股份有限公司',127),(1092,'法－財翔稱(亞托敏)',3,'',NULL,'農藥進字第03378號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','大成化學工業股份有限公司',127),(1093,'法－財賀你旺(貝芬待克利)',3,'',NULL,'農藥製字第05715號',NULL,NULL,NULL,'(1) METHYL BENZIMIDAZOL-2-YLCARBAMATE...................11.9%(2) CIS,TRANS-3-CHLORO-4-[4-METHYL-2-(1H-1,2,4-TRIAZOL-1-YLMETHYL)-1,3-DIOXOLAN-2-YL)PHENYL-4-CHLOROPHENYL ETHER..5.9% 17.800 (%)',NULL,'admin','大成化學工業股份有限公司',127),(1094,'法－財金多(護矽得)',3,'',NULL,'農藥進字第03159號',NULL,NULL,NULL,'bis(4-fluorophenyl)(methyl)(1H-1,2,4-triazol-1-ylmethyl)silane 37.000 (%) ',NULL,'admin','大成化學工業股份有限公司',127),(1095,'法－達稻果滿(菲克利)',3,'',NULL,'農藥進字第03155號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 5.000  (%)',NULL,'admin','大成化學工業股份有限公司',127),(1096,'泰利(普拔克)',3,'',NULL,'農藥進字第01595號',NULL,NULL,NULL,' propyl 3-(dimethylamino)propylcarbamate hydrochloride  66.500 (%)',NULL,'admin','台灣龍燈股份有限公司',152),(1097,'泰勇(平克座)',3,'',NULL,'農藥製字第05471號',NULL,NULL,NULL,'1-(2,4-dichloro-β-propylphenethyl)-1H-1,2,4-triazole 10.500 (%)    ',NULL,'admin','國豐化學工業股份有限公司',112),(1098,'泰喜(第滅寧)',3,'',NULL,'農藥製字第03876號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%)',NULL,'admin','台農三和化工股份有限公司',119),(1099,'泰好(貝芬同)',3,'',NULL,'農藥製字第04066號',NULL,NULL,NULL,'(1) methyl benzimidazol-2-ylcarbamate...30% (2) 3-(3,5-dichlorophenyl)-N-isopropyl-2,4-dioxoimidazolidine-1-carboxamide...25%',NULL,'admin','龍燈生物科技股份有限公司',76),(1100,'泰好勇(阿巴汀)',3,'',NULL,'農藥製字第05453號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%) ',NULL,'admin','嘉泰企業股份有限公司',102),(1101,'泰強(三元硫酸銅)',3,'',NULL,'農藥製字第05772號',NULL,NULL,NULL,'cupric sulfate-tricupric hydroxide 27.120 (%)     ',NULL,'admin','興農股份有限公司',85),(1102,'泰斯松(陶斯松)',3,'',NULL,'農藥進字第01963號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 25.000 (%)',NULL,'admin','蒙狄生股份有限公司',159),(1103,'泰順強(布芬第滅寧)',3,'',NULL,'農藥製字第05248號',NULL,NULL,NULL,'(1) (S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate…0.69% (2) (Z)-2-tert-butylimino-3-isopropyl-5-phenyl-1, 3, 5-thiadiazinan-4-one…11.09% 11.780 (%) ',NULL,'admin','聯利農業科技股份有限公司',103),(1104,'洗得美(菲克利)',3,'',NULL,'農藥製字第06583號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 23.000 (%)',NULL,'admin','大勝化學工業股份有限公司',110),(1105,'洗菌強(亞托敏)',3,'',NULL,'農藥進字第03087號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','國寶國際有限公司',153),(1106,'洗跳仔(佈飛松)',3,'',NULL,'農藥進字第02836號',NULL,NULL,NULL,'O-4-bromo-2-chlorophenyl O-ethyl S-propyl phosphorothioate 43.000 (%) ',NULL,'admin','美商雅柏生活科技有限公司臺灣分公司',148),(1107,'活力發(菲克利)',3,'',NULL,'農藥製字第06190號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 23.000 (%) ',NULL,'admin','日農科技股份有限公司',105),(1108,'活綠好康牌活綠旺1號',2,'','有機資審字第108004號',NULL,'雜項有機質肥料(5-13)','肥製(質)字第0471010號','花生粕、菜仔粕、米糠、黃豆、蓖麻粕、泥碳、肉骨粉、酒槽','全氮6.0%全磷酐3.0%全氧化鉀3.0%有機質83.0%',NULL,'admin','長興生物科技股份有限公司',65),(1109,'洽益冬(加保扶)',3,'',NULL,'農藥製字第05483號',NULL,NULL,NULL,'2,3-dihydro-2,2-dimethylbenzofuran-7-yl methylcarbamate  3.000 (%)',NULL,'admin','洽益化學股份有限公司',108),(1110,'海派(亞托敏)',3,'',NULL,'農藥進字第03214號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','高事達農化有限公司',155),(1111,'海王星(畢芬寧)',3,'',NULL,'農藥進字第02524號',NULL,NULL,NULL,'2-methylbiphenyl-3-ylmethyl (Z)-(1RS,3RS)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate  2.800 (%)',NULL,'admin','優必樂有限公司',151),(1112,'涮益大蒜萃取液',3,'','有機資審字第108027號','植保製字第00103號',NULL,NULL,NULL,'大蒜萃取液',NULL,'admin','保證責任雲林縣詔安聯合社區合作農場',86),(1113,'淨果精(快得寧)',3,'',NULL,'農藥製字第04004號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 33.500 (%)',NULL,'admin','興農股份有限公司',85),(1114,'添好運(可尼丁)',3,'',NULL,'農藥進字第03350號',NULL,NULL,NULL,'(E)-1-(2-chloro-1,3-thiazol-5-ylmethyl)-3-methyl-2- nitroguanidine 16.000 (%) ',NULL,'admin','嘉濱貿易有限公司',111),(1115,'添氣好(賽滅淨)',3,'',NULL,'農藥進字第02601號',NULL,NULL,NULL,'N-cyclopropyl-1,3,5-triazine-2,4,6-triamine 75.000 (%)',NULL,'admin','萬得發有限公司',125),(1116,'添福(氟芬隆)',3,'',NULL,'農藥進字第01558號',NULL,NULL,NULL,'1-[4-(2-chloro-α,α,α-trifluoro-p-tolyloxy)-2-fluorophenyl]-3-(2,6-difluorobenzoyl)urea  100 G/L (10% W/V)',NULL,'admin','台灣巴斯夫股份有限公司',123),(1117,'清乾淨(派滅淨)',3,'',NULL,'農藥製字第06560號',NULL,NULL,NULL,'(E)-4,5-dihydro-6-methyl-4-(3-pyridylmethyleneamino)-1,2,4- triazin-3(2H)-one 50.000 (%)',NULL,'admin','嘉農企業股份有限公司',117),(1118,'清尚好(得芬諾)',3,'',NULL,'農藥製字第05624號',NULL,NULL,NULL,'N-tert-butyl-N’-(4-ethylbenzoyl)-3,5-dimethylbenzohydrazide  19.700 (%)',NULL,'admin','臺益工業股份有限公司',39),(1119,'清蟲(因滅汀)',3,'',NULL,'農藥進字第02653號',NULL,NULL,NULL,'因滅汀 5%',NULL,'admin','雋農實業股份有限公司',136),(1120,'清蟲寧(賽洛寧)',3,'',NULL,'農藥進字第02396號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.800  (%)   ',NULL,'admin','恒欣股份有限公司',183),(1121,'清龍(腈硫醌)',3,'',NULL,'農藥製字第04964號',NULL,NULL,NULL,' 5,10-dihydro-5,10-dioxonaphtho[2,3-b]-1,4-dithiine-2,3-dicarbonitrile  42.200 (%)',NULL,'admin','台灣日產化工股份有限公司',104),(1122,'渴蛾斃死(得芬諾)',3,'',NULL,'農藥進字第01748號',NULL,NULL,NULL,' N-tert-butyl-N’-(4-ethylbenzoyl)-3,5-dimethylbenzohydrazide  19.700 (%)',NULL,'admin','台灣住友化學股份有限公司',160),(1123,'滅地蟲(托福松)',3,'',NULL,'農藥製字第03132號',NULL,NULL,NULL,' S-tert-butylthiomethyl O,O-diethyl phosphorodithioate  10.000 (%)',NULL,'admin','聯利農業科技股份有限公司',103),(1124,'滅多多(因滅汀)',3,'',NULL,'農藥進字第02787號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','海博生技股份有限公司',146),(1125,'滅潛蠅(賽滅淨)',3,'',NULL,'農藥製字第06341號',NULL,NULL,NULL,'N-cyclopropyl-1,3,5-triazine-2,4,6-triamine 8.900  (%) ',NULL,'admin','國豐化學工業股份有限公司',112),(1126,'滅炭(得克利)',3,'',NULL,'農藥進字第02662號',NULL,NULL,NULL,'(RS)-1-p-chlorophenyl-4,4-dimethyl-3-(1H-1,2,4-triazol-1- ylmethyl)pentan-3-ol 250 G/L (25% W/V) ',NULL,'admin','聯利農業科技股份有限公司',103),(1127,'滅稻蝨(布芬淨)',3,'',NULL,'農藥製字第05409號',NULL,NULL,NULL,'(Z)-2-tert-butylimino-3-isopropyl-5-phenyl-1, 3, 5-thiadiazinan-4-one 40.000 (%)',NULL,'admin','中華民國農會附設各級農會農化廠',131),(1128,'滅粉克(三泰芬)',3,'',NULL,'農藥進字第01705號',NULL,NULL,NULL,'1-(4-chlorophenoxy)-3,3-dimethyl-1-(1H-1,2,4-triazol-1-yl)butan-2-one 25.000 (%) ',NULL,'admin','德方有限公司',175),(1129,'滅紋精(菲克利)',3,'',NULL,'農藥製字第06167號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 23.000 (%) ',NULL,'admin','華夏科學農化股份有限公司',106),(1130,'滅絕蝨汰(派滅淨)',3,'',NULL,'農藥進字第02937號',NULL,NULL,NULL,'(E)-4,5-dihydro-6-methyl-4-(3-pyridylmethyleneamino)-1,2,4- triazin-3(2H)-one 25.000 (%)',NULL,'admin','優必樂有限公司',151),(1131,'滅線蟲(滅線蟲)',3,'',NULL,'農藥製字第04164號',NULL,NULL,NULL,' bis(2-chloro-1-methylethyl) ether  80.000 (%)',NULL,'admin','瑞芳植物保護股份有限公司',115),(1132,'滅菌丹(甲基多保淨)',3,'',NULL,'農藥製字第01807號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 70.000 (%) ',NULL,'admin','洽益化學股份有限公司',108),(1133,'滅菌威(賽普護汰寧)',3,'',NULL,'農藥進字第03320號',NULL,NULL,NULL,'(1) 4-cyclopropyl-6-methyl-N-phenylpyrimidin-2-amine...37.5%(2) 4-(2,2-difluoro-1,3-benzodioxol-4-yl)pyrrole-3-carbonitrile...25%',NULL,'admin','台灣瑪斯德股份有限公司',145),(1134,'滅菌精(甲基多保淨)',3,'',NULL,'農藥製字第05233號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 40.000 (%)',NULL,'admin','嘉農企業股份有限公司',117),(1135,'滅蟲汀(因滅汀)',3,'',NULL,'農藥進字第03407號',NULL,NULL,NULL,'因滅汀 5%',NULL,'admin','蒙狄生股份有限公司',159),(1136,'滅蟲素(因滅汀)',3,'',NULL,'農藥製字第05816號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','洽益化學股份有限公司',108),(1137,'滅靈蟲(賽滅淨)',3,'',NULL,'農藥製字第06279號',NULL,NULL,NULL,'N-cyclopropyl-1,3,5-triazine-2,4,6-triamine 75.000 (%)',NULL,'admin','國豐化學工業股份有限公司',112),(1138,'滴死(第滅寧)',3,'',NULL,'農藥進字第00196號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%)',NULL,'admin','生力化學工業股份有限公司',139),(1139,'滿園春(百利普芬)',3,'',NULL,'農藥製字第06049號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 11.000 (%)',NULL,'admin','洽益化學股份有限公司',108),(1140,'滿地王特效有機質肥料',2,'','有機資審字第107011號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0270008號','肉骨粉、蓖麻粕、玉米果粉、菸草屑','全氮5.3%全磷酐3.0%全氧化鉀2.5%有機質78.0%',NULL,'admin','崇容實業',60),(1141,'滿天星(畢芬寧)',3,'',NULL,'農藥製字第06009號',NULL,NULL,NULL,'2-methylbiphenyl-3-ylmethyl (Z)-(1RS,3RS)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate  2.800 (%)',NULL,'admin','國豐化學工業股份有限公司',112),(1142,'滿朝青(賓得克利)',3,'',NULL,'農藥製字第05540號',NULL,NULL,NULL,'(1) 1-(4-chlorobenzyl)-1-cyclopentyl-3-phenylurea...15% (2) (RS)-1-p-chlorophenyl-4,4-dimethyl-3-(1H-1,2,4-triazol-1- ylmethyl)pentan-3-ol...10%',NULL,'admin','臺聯實業股份有限公司',107),(1143,'漂丿(益滅松)',3,'',NULL,'農藥製字第03420號',NULL,NULL,NULL,' O,O-dimethyl S-phthalimidomethyl phosphorodithioate  50.000 (%)',NULL,'admin','大勝化學工業股份有限公司',110),(1144,'潔蚜淨(派滅淨)',3,'',NULL,'農藥製字第06497號',NULL,NULL,NULL,'(E)-4,5-dihydro-6-methyl-4-(3-pyridylmethyleneamino)-1,2,4- triazin-3(2H)-one 25.000 (%) ',NULL,'admin','台農三和化工股份有限公司',119),(1145,'火力夠(四氯右滅達樂)',3,'',NULL,'農藥進字第02746號',NULL,NULL,NULL,'(1) tetrachloroisophthalonitrile...40.000%(W/V) (2) methyl N-(methoxyacetyl)-N-(2,6-xylyl)-D-alaninate...4.000%(W/V)',NULL,'admin','台灣先正達股份有限公司',144),(1146,'火影無(百利普芬)',3,'',NULL,'農藥製字第06382號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 0.500  (%)  ',NULL,'admin','台農三和化工股份有限公司',119),(1147,'火霹靂(益達胺)',3,'',NULL,'農藥進字第02226號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%)',NULL,'admin','台灣瑪斯德股份有限公司',145),(1148,'灰姑娘(撲滅寧)',3,'',NULL,'農藥製字第06368號',NULL,NULL,NULL,' N-(3,5-dichlorophenyl)-1,2-dimethylcyclopropane-1,2-dicarboximide  50.000 (%)',NULL,'admin','洽益化學股份有限公司',108),(1149,'炭光光(待克利)',3,'',NULL,'農藥進字第03112號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%) ',NULL,'admin','嘉農企業股份有限公司',117),(1150,'炭克淨(待克利)',3,'',NULL,'農藥製字第05907號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%)',NULL,'admin','惠大實業股份有限公司',157),(1151,'炭免驚(腈硫醌)',3,'',NULL,'農藥進字第02921號',NULL,NULL,NULL,'5,10-dihydro-5,10-dioxonaphtho[2,3-b]-1,4-dithiine-2,3-dicarbonitrile 42.200 (%)     ',NULL,'admin','萬得發有限公司',125),(1152,'炭剋(待克利)',3,'',NULL,'農藥進字第03116號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 250 G/L (25% W/V)',NULL,'admin','台灣先正達股份有限公司',144),(1153,'炭剋星(腈硫醌)',3,'',NULL,'農藥製字第05618號',NULL,NULL,NULL,' 5,10-dihydro-5,10-dioxonaphtho[2,3-b]-1,4-dithiine-2,3-dicarbonitrile  42.200 (%)',NULL,'admin','洽益化學股份有限公司',108),(1154,'炭友(貝芬待克利)',3,'',NULL,'農藥製字第06175號',NULL,NULL,NULL,'(1) METHYL BENZIMIDAZOL-2-YLCARBAMATE...................11.9%(2) CIS,TRANS-3-CHLORO-4-[4-METHYL-2-(1H-1,2,4-TRIAZOL-1-YLMETHYL)-1,3-DIOXOLAN-2-YL)PHENYL-4-CHLOROPHENYL ETHER..5.9% 17.800 (%)',NULL,'admin','台農三和化工股份有限公司',119),(1155,'炭吉(待克利)',3,'',NULL,'農藥製字第04993號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 250 G/L (25% W/V)',NULL,'admin','世大農化工廠股份有限公司	',114),(1156,'炭大吉(得克利)',3,'',NULL,'農藥製字第06055號',NULL,NULL,NULL,'(RS)-1-p-chlorophenyl-4,4-dimethyl-3-(1H-1,2,4-triazol-1- ylmethyl)pentan-3-ol 25.900 (%) ',NULL,'admin','華夏科學農化股份有限公司',106),(1157,'炭寧(待克利)',3,'',NULL,'農藥進字第02818號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%)',NULL,'admin','春匯有限公司',149),(1158,'炭寶-精(腈硫醌)',3,'',NULL,'農藥製字第06222號',NULL,NULL,NULL,'5,10-dihydro-5,10-dioxonaphtho[2,3-b]-1,4-dithiine-2,3-dicarbonitrile 42.200 (%)',NULL,'admin','大成化學工業股份有限公司',127),(1159,'炭尚好(待克利)',3,'',NULL,'農藥進字第03044號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 250 G/L (25% W/V)',NULL,'admin','國豐化學工業股份有限公司',112),(1160,'炭快除(腐絕快得寧)',3,'',NULL,'農藥製字第04885號',NULL,NULL,NULL,'(1) 2-(THIAZOL-4-YL)BENZIMIDAZOLE....................18%(2) BIS(QUINOLIN-8-OLATO-O,N)COPPER..................35%',NULL,'admin','富農化學工業股份有限公司',132),(1161,'炭息(待克利)',3,'',NULL,'農藥進字第02691號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%)',NULL,'admin','嘉農企業股份有限公司',117),(1162,'炭星(腈硫醌)',3,'',NULL,'農藥進字第01559號',NULL,NULL,NULL,'5,10-dihydro-5,10-dioxonaphtho[2,3-b]-1,4-dithiine-2,3-dicarbonitrile 42.200 (%)  ',NULL,'admin','台灣巴斯夫股份有限公司',123),(1163,'炭淨多(亞托待克利)',3,'',NULL,'農藥製字第06267號',NULL,NULL,NULL,'(1) methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate...200 g/L (2) cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1-ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether...125 g/L 325 G/L (32.5% W/V) ',NULL,'admin','臺益工業股份有限公司',39),(1164,'炭清心(得克利)',3,'',NULL,'農藥製字第06554號',NULL,NULL,NULL,'(RS)-1-p-chlorophenyl-4,4-dimethyl-3-(1H-1,2,4-triazol-1- ylmethyl)pentan-3-ol 25.900 (%)',NULL,'admin','世大農化工廠股份有限公司	',114),(1165,'炭清贏(亞托待克利)',3,'',NULL,'農藥製字第05955號',NULL,NULL,NULL,'(1) methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate...200 g/L (2) cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1-ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether...125 g/L 325 G/L (32.5% W/V)  ',NULL,'admin','世大農化工廠股份有限公司	',114),(1166,'炭無露ＳＣ(四氯異苯腈)',3,'',NULL,'農藥進字第02697號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  40.000 (%)',NULL,'admin','海博生技股份有限公司',146),(1167,'炭究好(待克利)',3,'',NULL,'農藥製字第06087號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 10.000 (%)',NULL,'admin','國豐化學工業股份有限公司',112),(1168,'炭竹機有機質肥料',2,'','有機資審字第108009號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0266012號','竹屑、菇類培植廢棄包、米糠、蓖麻粕','全氮5.5%全磷酐2.5%全氧化鉀3.0%有機質80.0%',NULL,'admin','順豐有機肥料有限公司',46),(1169,'炭素靈(亞托待克利)',3,'',NULL,'農藥製字第06228號',NULL,NULL,NULL,'(1) methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate...200 g/L (2) cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1-ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether...125 g/L 325 G/L (32.5% W/V)  ',NULL,'admin','台農三和化工股份有限公司',119),(1170,'炭絕精(待克利)',3,'',NULL,'農藥製字第05202號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%)',NULL,'admin','聯利農業科技股份有限公司',103),(1171,'炭總管(待克利)',3,'',NULL,'農藥製字第05656號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%)   ',NULL,'admin','大成化學工業股份有限公司',127),(1172,'炭蹤清(待克利)',3,'',NULL,'農藥進字第03199號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%)  ',NULL,'admin','景茂貿易有限公司',158),(1173,'炭鋤(待克利)',3,'',NULL,'農藥進字第02761號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%)',NULL,'admin','雋農實業股份有限公司',136),(1174,'炭霸(亞托待克利)',3,'',NULL,'農藥製字第06117號',NULL,NULL,NULL,'(1) methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate...200 g/L (2) cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1-ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether...125 g/L 325 G/L (32.5% W/V) ',NULL,'admin','世大農化工廠股份有限公司	',114),(1175,'炮双台(快得克絕)',3,'',NULL,'農藥製字第05087號',NULL,NULL,NULL,'(1) BIS(QUINOLIN-8-OLATO-O,N)COPPER...40%(2) 1-(2-CYANO-2-METHOXYIMINOACETYL)3-ETHYLUREA...8%',NULL,'admin','臺聯實業股份有限公司',107),(1176,'無地跑(派滅淨)',3,'',NULL,'農藥進字第02312號',NULL,NULL,NULL,'(E)-4,5-dihydro-6-methyl-4-(3-pyridylmethyleneamino)-1,2,4- triazin-3(2H)-one 50.000 (%)',NULL,'admin','台灣先正達股份有限公司',144),(1177,'無地避(益達胺)',3,'',NULL,'農藥製字第05309號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 0.030  (%) ',NULL,'admin','惠光股份有限公司',121),(1178,'無炭(得克利)',3,'',NULL,'農藥製字第06252號',NULL,NULL,NULL,'(RS)-1-p-chlorophenyl-4,4-dimethyl-3-(1H-1,2,4-triazol-1- ylmethyl)pentan-3-ol 25.900 (%) ',NULL,'admin','瑞芳植物保護股份有限公司',115),(1179,'無粉蝨(亞滅培)',3,'',NULL,'農藥進字第02834號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%)',NULL,'admin','萬得發有限公司',125),(1180,'無臭馬拉松(馬拉松)',3,'',NULL,'農藥製字第03650號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 50.000 (%) ',NULL,'admin','中華民國農會附設各級農會農化廠',131),(1181,'無芬寧(三泰芬)',3,'',NULL,'農藥製字第04500號',NULL,NULL,NULL,'1-(4-chlorophenoxy)-3,3-dimethyl-1-(1H-1,2,4-triazol-1-yl)butan-2-one 25.000 (%)  ',NULL,'admin','嘉農企業股份有限公司',117),(1182,'無菌了(亞托敏)',3,'',NULL,'農藥進字第03110號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','嘉農企業股份有限公司',117),(1183,'無虫(第滅寧)',3,'',NULL,'農藥製字第05377號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.400  (%) ',NULL,'admin','洽益化學股份有限公司',108),(1184,'燕子依普同(依普同)',3,'',NULL,'農藥製字第05794號',NULL,NULL,NULL,'3-(3,5-dichlorophenyl)-N-isopropyl-2,4-dioxoimidazolidine-1-carboxamide  23.700 (%)',NULL,'admin','臺益工業股份有限公司',39),(1185,'燕子牌一刀流魚粉肥',2,'','有機資審字第106011號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0076140號','魚粉、米糠、菜籽粕、蓖麻粕、黃豆粉、油棕灰、肉骨粉','全氮4.5%全磷酐4.0%全氧化鉀3.8%有機質77.6%',NULL,'admin','臺益工業股份有限公司',39),(1186,'燕子牌十全基肥10號',2,'108/12/11原「燕子牌十全基肥」變更名稱','有機資審字第103016號',NULL,'雜項堆肥(5-11)','肥製(質)字第0076171號','米糠、菜籽粕、蓖麻粕、花生粕、魚粉、蚵殼粉','全氮4%全磷酐3%全氧化鉀2.5%有機質70%',NULL,'admin','臺益工業股份有限公司',39),(1187,'燕子牌台灣基肥10號',2,'108/12/11原「燕子牌台灣基肥」變更名稱','有機資審字第103014號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0076137號','豆粉、米糠、花生粕、菜籽粕、蓖麻粕、魚骨粉、菇類培植廢棄包','全氮5.3%全磷酐3.5%全氧化鉀3.3%有機質70%',NULL,'admin','臺益工業股份有限公司',39),(1188,'燕子牌高蛋白農場耕作肥',2,'','有機資審字第103015號',NULL,'植物渣粕肥料(5-01)','肥製(質)字第0076154號','菜籽粕(10.12%)、米糠、芝麻粕、花生粕、黃豆粉','全氮7% 全磷酐2.2% 全氧化鉀2.2% 有機質82%',NULL,'admin','臺益工業股份有限公司',39),(1189,'燕子芬蟎意(芬普蟎)',3,'',NULL,'農藥製字第05897號',NULL,NULL,NULL,'tert-butyl (E)-α-(1,3-dimethyl-5-phenoxypyrazol-4-ylmethyleneamino-oxy)-p-toluate 5.000  (%) ',NULL,'admin','臺益工業股份有限公司',39),(1190,'燕子陶斯本(陶斯松)',3,'',NULL,'農藥製字第00691號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%)',NULL,'admin','臺益工業股份有限公司',39),(1191,'爽克(待克利)',3,'',NULL,'農藥進字第02594號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%) ',NULL,'admin','易利特開發有限公司',138),(1192,'特佳靈(第滅寧)',3,'',NULL,'農藥製字第01726號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%)',NULL,'admin','華隆化學股份有限公司',129),(1193,'特優(派滅淨)',3,'',NULL,'農藥進字第02754號',NULL,NULL,NULL,'(E)-4,5-dihydro-6-methyl-4-(3-pyridylmethyleneamino)-1,2,4- triazin-3(2H)-one 25.000 (%)',NULL,'admin','安旺特股份有限公司',120),(1194,'特勇(亞滅培)',3,'',NULL,'農藥製字第05607號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%)',NULL,'admin','興農股份有限公司',85),(1195,'特威效(佈飛松)',3,'',NULL,'農藥製字第04947號',NULL,NULL,NULL,'O-4-bromo-2-chlorophenyl O-ethyl S-propyl phosphorothioate 43.000 (%)',NULL,'admin','台灣日產化工股份有限公司',104),(1196,'特效(布芬淨)',3,'',NULL,'農藥進字第02809號',NULL,NULL,NULL,'(Z)-2-tert-butylimino-3-isopropyl-5-phenyl-1, 3, 5-thiadiazinan-4-one 25.000 (%) ',NULL,'admin','安旺特股份有限公司',120),(1197,'特易滅(亞滅培)',3,'',NULL,'農藥進字第02963號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%)',NULL,'admin','易利特開發有限公司',138),(1198,'特有效(賽速安)',3,'',NULL,'農藥製字第06549號',NULL,NULL,NULL,'3-(2-chloro-1,3-thiazol-5-ylmethyl)-5-methyl-1,3,5-oxadiazinan-4-ylidene(nitro)amine 25.000 (%) ',NULL,'admin','日農科技股份有限公司',105),(1199,'特殺(馬拉松)',3,'',NULL,'農藥製字第03594號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 1.000  (%)   ',NULL,'admin','利台化學工業股份有限公司',116),(1200,'特賜寧(陶斯寧)',3,'',NULL,'農藥製字第04061號',NULL,NULL,NULL,'(1) O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate…22.5%  (2)(RS)-α-cyano-3-phenoxybenzyl (1RS)-cis-trans-3-(2,2-dichlorovinyl)-2,2-dimethylcyclopropanecarboxylate…2.5%',NULL,'admin','國豐化學工業股份有限公司',112),(1201,'特賜本(陶斯松)',3,'',NULL,'農藥製字第04059號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 22.500 (%) ',NULL,'admin','國豐化學工業股份有限公司',112),(1202,'特速滅(陶斯松)',3,'',NULL,'農藥製字第03393號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%)  ',NULL,'admin','利台化學工業股份有限公司',116),(1203,'牽手(快得寧)',3,'',NULL,'農藥進字第01116號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 80.000 (%)',NULL,'admin','台石股份有限公司',191),(1204,'狀元露(菲克利)',3,'',NULL,'農藥進字第01950號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 5.000  (%) ',NULL,'admin','翰金興業有限公司',165),(1205,'猛將(亞滅培)',3,'',NULL,'農藥進字第02803號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%) ',NULL,'admin','春匯有限公司',149),(1206,'猛龍(亞滅培)',3,'',NULL,'農藥製字第05832號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%)',NULL,'admin','光華化學股份有限公司',77),(1207,'猴賽雷(克凡派)',3,'',NULL,'農藥製字第06578號',NULL,NULL,NULL,'4-bromo-2-(4-chlorophenyl)-1-ethoxymethyl-5-trifluoromethylpyrrole-3-carbonitrile 10.000 (%)',NULL,'admin','大勝化學工業股份有限公司',110),(1208,'獨佳(蘇力菌)',3,'',NULL,'農藥進字第01328號',NULL,NULL,NULL,' BACILLUS THURINGIENSIS SUBSPECIES KURSTAKI STRAIN EG2371 SOLID, SPORES AND LEPIDOPTERAN ACTIVE TOXINS 16,000IU/MG, 17918 DMBU/MG  40.000 (%)',NULL,'admin','嘉農企業股份有限公司',117),(1209,'獨斯本(陶斯松)',3,'',NULL,'農藥進字第02285號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%) ',NULL,'admin','雅飛有限公司',126),(1210,'獲園甲(得克利)',3,'',NULL,'農藥製字第05958號',NULL,NULL,NULL,'(RS)-1-p-chlorophenyl-4,4-dimethyl-3-(1H-1,2,4-triazol-1- ylmethyl)pentan-3-ol 25.900 (%)',NULL,'admin','台灣日產化工股份有限公司',104),(1211,'獲達多(得克利)',3,'',NULL,'農藥進字第01810號',NULL,NULL,NULL,'(RS)-1-p-chlorophenyl-4,4-dimethyl-3-(1H-1,2,4-triazol-1- ylmethyl)pentan-3-ol 25.900 (%)',NULL,'admin','台灣拜耳股份有限公司',101),(1212,'玖育綠植肥6號混合粕類有機質肥料',2,'','有機資審字第107023號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0524008號','蓖麻粕、花生粕、芝麻粕、煙草','全氮5.5%全磷酐2.2%全氧化鉀1.5%有機質85.0%',NULL,'admin','玖育生化科技有限公司',63),(1213,'珍希罕(益達胺)',3,'',NULL,'農藥進字第03249號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 18.200 (%)',NULL,'admin','安旺特股份有限公司',120),(1214,'珍果益(益滅賽寧)',3,'',NULL,'農藥製字第04634號',NULL,NULL,NULL,'(1)O,O-dimethyl S-phthalimidomethyl phosphorodithioate…30%  (2)(RS)-α-cyano-3-phenoxybenzyl(1RS)-cis-trans-3-(2,2-dichlorovinyl)-2,2-dimethyl cyclopropanecarboxylate …10%',NULL,'admin','富農化學工業股份有限公司',132),(1215,'班長(第滅寧)',3,'',NULL,'農藥製字第05830號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.400  (%) ',NULL,'admin','利台化學工業股份有限公司',116),(1216,'現代靈(福化利)',3,'',NULL,'農藥製字第04091號',NULL,NULL,NULL,'(RS)-α-cyano-3-phenoxybenzyl N-(2-chloro-α,α,α-trifluoro-p-tolyl)-D-valinate 25.000 (%) ',NULL,'admin','世大農化工廠股份有限公司	',114),(1217,'瑞多福(福瑞松)',3,'',NULL,'農藥製字第04044號',NULL,NULL,NULL,' O,O-diethyl S-ethylthiomethyl phosphorodithioate  10.000 (%)',NULL,'admin','瑞芳植物保護股份有限公司',115),(1218,'瑞泓寶(加保利)',3,'',NULL,'農藥進字第01669號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 85.000 (%)',NULL,'admin','瑞泓生技有限公司',184),(1219,'瑞炭吉(三氟敏)',3,'',NULL,'農藥進字第03315號',NULL,NULL,NULL,' methyl (E)-methoxyimino-{(E)-α-[1-(α,α,α-trifluoro-m-tolyl)ethylideneaminooxy]-o-tolyl}acetate  50.000 (%)',NULL,'admin','台灣科研生物技術有限公司',133),(1220,'瑞紋清(菲克利)',3,'',NULL,'農藥進字第02032號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 10.000 (%)',NULL,'admin','翰金興業有限公司',165),(1221,'瓜保正(銅快得寧)',3,'',NULL,'農藥製字第04841號',NULL,NULL,NULL,'(1) bis(quinolin-8-olato-O,N)copper...30% (2) cupric hydroxide...10%',NULL,'admin','臺聯實業股份有限公司',107),(1222,'瓜寶(四氯保淨)',3,'',NULL,'農藥進字第00703號',NULL,NULL,NULL,'(1) dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate)...20% (2) tetrachloroisophthalonitrile...50%',NULL,'admin','生力化學工業股份有限公司',139),(1223,'瓜旺(銅快得寧)',3,'',NULL,'農藥製字第04743號',NULL,NULL,NULL,'(1) bis(quinolin-8-olato-O,N)copper...30% (2) cupric hydroxide...10%',NULL,'admin','國豐化學工業股份有限公司',112),(1224,'瓜果多(銅快得寧)',3,'',NULL,'農藥製字第04396號',NULL,NULL,NULL,'(1) bis(quinolin-8-olato-O,N)copper...30% (2) cupric hydroxide...10%',NULL,'admin','利台化學工業股份有限公司',116),(1225,'瓜樂透(四氯保淨)',3,'',NULL,'農藥製字第05448號',NULL,NULL,NULL,'(1) dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate)...20% (2) tetrachloroisophthalonitrile...50%',NULL,'admin','安旺特股份有限公司',120),(1226,'瓜瓜叫(貝芬待克利)',3,'',NULL,'農藥製字第05642號',NULL,NULL,NULL,'(1) METHYL BENZIMIDAZOL-2-YLCARBAMATE...................11.9%(2) CIS,TRANS-3-CHLORO-4-[4-METHYL-2-(1H-1,2,4-TRIAZOL-1-YLMETHYL)-1,3-DIOXOLAN-2-YL)PHENYL-4-CHLOROPHENYL ETHER..5.9% 17.800 (%) ',NULL,'admin','聯利農業科技股份有限公司',103),(1227,'瓜瓜樂(依滅列)',3,'',NULL,'農藥製字第04468號',NULL,NULL,NULL,'(±)-1-(β-allyloxy-2,4-dichlorophenylethyl)imidazole 21.200 (%) ',NULL,'admin','東和化學企業股份有限公司',109),(1228,'甘露(四氯異苯腈)',3,'',NULL,'農藥製字第06256號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  40.000 (%)',NULL,'admin','安旺特股份有限公司',120),(1229,'生果旺(依普同)',3,'',NULL,'農藥進字第03397號',NULL,NULL,NULL,'3-(3,5-dichlorophenyl)-N-isopropyl-2,4-dioxoimidazolidine-1-carboxamide  23.700 (%)',NULL,'admin','日農科技股份有限公司',105),(1230,'用未仙(賽達松)',3,'',NULL,'農藥製字第02686號',NULL,NULL,NULL,' S-α-ethoxycarbonylbenzyl O,O-dimethyl phosphorodithioate  50.000 (%)',NULL,'admin','東和化學企業股份有限公司',109),(1231,'田園綠(納乃得)',3,'',NULL,'農藥製字第03934號',NULL,NULL,NULL,' S-methyl N-(methylcarbamoyloxy)thioacetimidate  40.000 (%)',NULL,'admin','世大農化工廠股份有限公司	',114),(1232,'田多滿(克收欣)',3,'',NULL,'農藥製字第06385號',NULL,NULL,NULL,' methyl (E)-methoxyimino[2-(o-tolyloxymethyl)phenyl]acetate  50.000 (%)',NULL,'admin','臺聯實業股份有限公司',107),(1233,'田大帥(菲克利)',3,'',NULL,'農藥製字第04905號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 10.000 (%)',NULL,'admin','臺聯實業股份有限公司',107),(1234,'田樂牌田樂一號高級有機質肥料',2,'101/4/9首次遴選通過105/1/17有機質未達標準及水分超標，無法符合「肥料種類品目及規格」規定，遴選終止106/9/12第二次遴選通過','有機資審字第106009號',NULL,'禽畜糞堆肥(5-09)','肥製(質)字第0295001號','禽畜糞、菇類培植廢棄包','全氮2.3%全磷酐2.7%全氧化2.0%有機質68.7%',NULL,'admin','田酪股份有限公司',55),(1235,'田武士 25%(布芬淨)',3,'',NULL,'農藥進字第02970號',NULL,NULL,NULL,'(Z)-2-tert-butylimino-3-isopropyl-5-phenyl-1, 3, 5-thiadiazinan-4-one 25.000 (%)',NULL,'admin','美商雅柏生活科技有限公司臺灣分公司',148),(1236,'田武士 40%(布芬淨)',3,'',NULL,'農藥進字第02976號',NULL,NULL,NULL,'(Z)-2-tert-butylimino-3-isopropyl-5-phenyl-1, 3, 5-thiadiazinan-4-one 40.000 (%) ',NULL,'admin','美商雅柏生活科技有限公司臺灣分公司',148),(1237,'田老大(菲克利)',3,'',NULL,'農藥製字第06151號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 23.000 (%) ',NULL,'admin','臺聯實業股份有限公司',107),(1238,'田董(嘉賜銅)',3,'',NULL,'農藥製字第05745號',NULL,NULL,NULL,'(1) [5-amino-2-methyl-6-(2,3,4,5,6,-pentahydroxycyclohexyloxy) tetrahydropyran-3-yl] amino-α-iminoacetic acid hydrochloride hydrate...5.7% ( Kasugamycin...5% ) (2) copper oxychloride (CU 45%)...75.6%',NULL,'admin','臺聯實業股份有限公司',107),(1239,'田頭家(托福松)',3,'',NULL,'農藥製字第05094號',NULL,NULL,NULL,' S-tert-butylthiomethyl O,O-diethyl phosphorodithioate  10.000 (%)',NULL,'admin','嘉泰企業股份有限公司',102),(1240,'甲基多保淨 (農會農化廠)',3,'',NULL,'農藥製字第04921號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 70.000 (%) ',NULL,'admin','中華民國農會附設各級農會農化廠',131),(1241,'甲基特斃菌(甲基多保淨)',3,'',NULL,'農藥進字第00346號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 70.000 (%) ',NULL,'admin','瑞繐股份有限公司',168),(1242,'甲基特斃菌.精(甲基多保淨)',3,'',NULL,'農藥進字第01480號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 40.000 (%) ',NULL,'admin','瑞繐股份有限公司',168),(1243,'甲基－多保淨(甲基多保淨)',3,'',NULL,'農藥製字第05553號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 40.000 (%) ',NULL,'admin','立農化學股份有限公司',143),(1244,'甲清淨(甲基多保淨)',3,'',NULL,'農藥進字第01664號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 70.000 (%)  ',NULL,'admin','瑞泓生技有限公司',184),(1245,'申公豹(益達胺)',3,'',NULL,'農藥製字第05370號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%)',NULL,'admin','洽益化學股份有限公司',108),(1246,'畢可喜(依得利)',3,'',NULL,'農藥進字第01686號',NULL,NULL,NULL,' ethyl 3-trichloromethyl-1,2,4-thiadiazol-5-yl ether  35.000 (%)',NULL,'admin','臺聯實業股份有限公司',107),(1247,'畢雕(畢芬寧)',3,'',NULL,'農藥製字第06315號',NULL,NULL,NULL,'2-methylbiphenyl-3-ylmethyl (Z)-(1RS,3RS)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate  2.800 (%)',NULL,'admin','華夏科學農化股份有限公司',106),(1248,'疫ㄟ好(達滅芬)',3,'',NULL,'農藥製字第05701號',NULL,NULL,NULL,'(E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine  50.000 (%)',NULL,'admin','瑞芳植物保護股份有限公司',115),(1249,'疫定好(嘉賜快得寧)',3,'',NULL,'農藥製字第04842號',NULL,NULL,NULL,'(1) 1L-1,3,4/2,5,6-1-DEOXY-2,3,4,5,6-PENTAHYDROXYCYCLOHEXYL 2-AMINO-2,3,4,6-TETRADEOXY-4-(α-IMINOGLYCINO)-α-D-ARABINO-HEXOPYRANOSIDE..................3.5% (2) BIS(QUINOLIN-8-OLATO-O,N)COPPER.....................40%',NULL,'admin','大勝化學工業股份有限公司',110),(1250,'疫定除(亞托敏)',3,'',NULL,'農藥進字第03195號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','臺益工業股份有限公司',39),(1251,'疫把罩(達滅芬)',3,'',NULL,'農藥進字第02683號',NULL,NULL,NULL,'(E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine  50.000 (%)',NULL,'admin','雋農實業股份有限公司',136),(1252,'疫菌王(達滅芬)',3,'',NULL,'農藥進字第02703號',NULL,NULL,NULL,'(E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine  50.000 (%)',NULL,'admin','安旺特股份有限公司',120),(1253,'疫露好(鋅錳克絕)',3,'',NULL,'農藥進字第03123號',NULL,NULL,NULL,'(1) 1-(2-cyano-2-methoxyiminoacetyl)-3-ethylurea…8% (2) manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt…64%',NULL,'admin','雅飛有限公司',126),(1254,'疫露安(福賽快得寧)',3,'',NULL,'農藥製字第06366號',NULL,NULL,NULL,'(1) ALUMINIUM TRIS-O-ETHYLPHOSPHONATE................40%(2) BIS(QUINOLIN-8-OLATO-O,N)COPPER..................40%',NULL,'admin','日農科技股份有限公司',105),(1255,'疫露棒(快得寧)',3,'',NULL,'農藥製字第04388號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 33.500 (%)  ',NULL,'admin','利台化學工業股份有限公司',116),(1256,'疫露滅(鋅錳滅達樂)',3,'',NULL,'農藥製字第04704號',NULL,NULL,NULL,'(1) manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt...48%(2) methyl N-(methoxyacetyl)-N-(2,6-xylyl)-DL-alaninate...10%',NULL,'admin','東和化學企業股份有限公司',109),(1257,'疫頂勇(嘉賜快得寧)',3,'',NULL,'農藥製字第06027號',NULL,NULL,NULL,'(1) 1L-1,3,4/2,5,6-1-DEOXY-2,3,4,5,6-PENTAHYDROXYCYCLOHEXYL 2-AMINO-2,3,4,6-TETRADEOXY-4-(α-IMINOGLYCINO)-α-D-ARABINO-HEXOPYRANOSIDE..................3.5% (2) BIS(QUINOLIN-8-OLATO-O,N)COPPER.....................40%',NULL,'admin','世大農化工廠股份有限公司	',114),(1258,'疾速靈(撲滅寧)',3,'',NULL,'農藥進字第02488號',NULL,NULL,NULL,' N-(3,5-dichlorophenyl)-1,2-dimethylcyclopropane-1,2-dicarboximide  50.000 (%)',NULL,'admin','優必樂有限公司',151),(1259,'白炭黑(克收欣)',3,'',NULL,'農藥進字第02779號',NULL,NULL,NULL,' methyl (E)-methoxyimino[2-(o-tolyloxymethyl)phenyl]acetate  50.000 (%)',NULL,'admin','雋農實業股份有限公司',136),(1260,'白粉水仙(依瑞莫)',3,'',NULL,'農藥製字第00694號',NULL,NULL,NULL,'5-butyl-2-ethylamino-6-methylpyrimidin-4-ol 25.000 (%) ',NULL,'admin','臺益工業股份有限公司',39),(1261,'白粉王(貝芬依滅列)',3,'',NULL,'農藥製字第05515號',NULL,NULL,NULL,'(1) METHYL BENZIMIDAZOL-2-YLCARBAMATE.....................30% (2) (±)-1-(β-ALLYLOXY-2,4-DICHLOROPHENYLETHYL)IMIDAZOLE..10%',NULL,'admin','正農化學股份有限公司',130),(1262,'白紋寧(四克利)',3,'',NULL,'農藥進字第02131號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-3-(1H-1,2,4-triazol-1-yl)propyl 1,1,2,2-tetrafluoroethyl ether 10.700 (%) ',NULL,'admin','台灣龍燈股份有限公司',152),(1263,'白菇寧(三泰芬)',3,'',NULL,'農藥進字第01616號',NULL,NULL,NULL,'1-(4-chlorophenoxy)-3,3-dimethyl-1-(1H-1,2,4-triazol-1-yl)butan-2-one 5.000  (%) ',NULL,'admin','嘉濱貿易有限公司',111),(1264,'白鬚肥',2,'','有機資審字第107024號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0738018號','菜籽粕、蓖麻粕、花生粕、肉骨粉、黃豆粉、芝麻粕、棕梠灰','全氮5.5%全磷酐2.5%全氧化鉀2.5%有機質80.0%',NULL,'admin','豫豐實業有限公司',54),(1265,'百克寧(四氯異苯腈)',3,'',NULL,'農藥製字第00184號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  75.000 (%)',NULL,'admin','日農科技股份有限公司',105),(1266,'百克蝨 40%(加保利)',3,'',NULL,'農藥製字第02613號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 40.000 (%) ',NULL,'admin','日農科技股份有限公司',105),(1267,'百克蝨 85%(加保利)',3,'',NULL,'農藥製字第01769號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 85.000 (%) ',NULL,'admin','日農科技股份有限公司',105),(1268,'百克露(四氯異苯腈)',3,'',NULL,'農藥製字第05456號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  40.000 (%)',NULL,'admin','東和化學企業股份有限公司',109),(1269,'百克靈精(四氯異苯腈)',3,'',NULL,'農藥製字第06205號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  40.000 (%)',NULL,'admin','日農科技股份有限公司',105),(1270,'百力強(百利普芬)',3,'',NULL,'農藥製字第06370號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 11.000 (%)',NULL,'admin','臺灣庵原農藥股份有限公司',113),(1271,'百力通(三泰芬)',3,'',NULL,'農藥製字第02075號',NULL,NULL,NULL,'1-(4-chlorophenoxy)-3,3-dimethyl-1-(1H-1,2,4-triazol-1-yl)butan-2-one 5.000  (%)',NULL,'admin','利台化學工業股份有限公司',116),(1272,'百斬(克收欣)',3,'',NULL,'農藥製字第06420號',NULL,NULL,NULL,'methyl (E)-methoxyimino[2-(o-tolyloxymethyl)phenyl]acetate 44.200 (%)',NULL,'admin','洽益化學股份有限公司',108),(1273,'百樹寧(賽扶寧)',3,'',NULL,'農藥進字第02484號',NULL,NULL,NULL,'(RS)-α-cyano-4-fluoro-3-phenoxybenzyl (1RS,3RS;1RS,3SR)-3-(2,2-dichlorovinyl)-2,2-dimethylcyclopropanecarboxylate 5.700  (%) ',NULL,'admin','鴻鋒化學有限公司',134),(1274,'百泰生技1號',2,'','有機資審字第108022號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0622055號','蓖麻粕、菜籽粕、肉骨粉、米糠、棕櫚灰、泥炭','全氮5.1%全磷酐2.5%全氧化鉀2.1%有機質80.0%',NULL,'admin','三木實業有限公司',40),(1275,'百祥(百克敏)',3,'',NULL,'農藥進字第03517號',NULL,NULL,NULL,'methyl N-{2-[1-(4-chlorophenyl)pyrazol-3-yloxymethyl]phenyl}(N-methoxy)carbamate  23.600 (%)',NULL,'admin','台灣日產化工股份有限公司',104),(1276,'百福樂(賽扶寧)',3,'',NULL,'農藥進字第02539號',NULL,NULL,NULL,'(RS)-α-cyano-4-fluoro-3-phenoxybenzyl (1RS,3RS;1RS,3SR)-3-(2,2-dichlorovinyl)-2,2-dimethylcyclopropanecarboxylate 5.700  (%) ',NULL,'admin','維丰國際股份有限公司',189),(1277,'百菌清(四氯異苯腈)',3,'',NULL,'農藥進字第03496號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  75.000 (%)',NULL,'admin','日農科技股份有限公司',105),(1278,'百蟲離(因得克)',3,'',NULL,'農藥進字第03441號',NULL,NULL,NULL,' methyl (S)-N-[7-chloro-2,3,4a,5-tetrahydro-4a-(methoxycarbonyl)indeno[1,2-e][1,3,4]oxadiazin-2-ylcarbonyl]-4’-(trifluoromethoxy)carbanilate  14.500 (%)',NULL,'admin','日農科技股份有限公司',105),(1279,'百蟲靈(陶斯松)',3,'',NULL,'農藥製字第03453號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%) ',NULL,'admin','龍燈生物科技股份有限公司',76),(1280,'百農靈 2.5%(陶斯松)',3,'',NULL,'農藥製字第02429號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 2.500  (%)',NULL,'admin','日農科技股份有限公司',105),(1281,'百農靈 40.8%(陶斯松)',3,'',NULL,'農藥製字第03881號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%) ',NULL,'admin','日農科技股份有限公司',105),(1282,'百農靈 50%(陶斯松)',3,'',NULL,'農藥製字第06047號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 50.000 (%)',NULL,'admin','日農科技股份有限公司',105),(1283,'百露蝨(百利普芬)',3,'',NULL,'農藥製字第05977號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 11.000 (%) ',NULL,'admin','東和化學企業股份有限公司',109),(1284,'百面勇(阿巴汀)',3,'',NULL,'農藥製字第05388號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%)   ',NULL,'admin','安旺特股份有限公司',120),(1285,'皇國果寶(礦物油)',3,'',NULL,' 農藥進字第00707號',NULL,NULL,NULL,'ALIPHATIC HYDROCARBONS 95.000 (%)',NULL,'admin','皇國貿易有限公司',180),(1286,'皇帝大(益達胺)',3,'',NULL,'農藥製字第05312號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 18.200 (%)  ',NULL,'admin','臺聯實業股份有限公司',107),(1287,'益利產(賽達松)',3,'',NULL,'農藥製字第02356號',NULL,NULL,NULL,' S-α-ethoxycarbonylbenzyl O,O-dimethyl phosphorodithioate  50.000 (%)',NULL,'admin','嘉農企業股份有限公司',117),(1288,'益剋菌(菲克利)',3,'',NULL,' 農藥進字第02405號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 5.000  (%)',NULL,'admin','恒欣股份有限公司',183),(1289,'益吉讚(快得寧)',3,'',NULL,'農藥製字第03250號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 40.000 (%)',NULL,'admin','利台化學工業股份有限公司',116),(1290,'益定讚(益達胺)',3,'',NULL,'農藥製字第04979號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%)',NULL,'admin','富農化學工業股份有限公司',132),(1291,'益樂殺(賽達松)',3,'',NULL,'農藥製字第00424號',NULL,NULL,NULL,' S-α-ethoxycarbonylbenzyl O,O-dimethyl phosphorodithioate  50.000 (%)',NULL,'admin','興農股份有限公司',85),(1292,'益殺松(馬拉松)',3,'',NULL,'農藥製字第02531號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 50.000 (%) ',NULL,'admin','洽益化學股份有限公司',108),(1293,'益治丹(益滅松)',3,'',NULL,'農藥製字第02480號',NULL,NULL,NULL,' O,O-dimethyl S-phthalimidomethyl phosphorodithioate  50.000 (%)',NULL,'admin','洽益化學股份有限公司',108),(1294,'益禧精(第滅寧)',3,'',NULL,'農藥進字第02363號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.400  (%)  ',NULL,'admin','恒欣股份有限公司',183),(1295,'益美能(益滅松)',3,'',NULL,'農藥製字第04001號',NULL,NULL,NULL,' O,O-dimethyl S-phthalimidomethyl phosphorodithioate  50.000 (%)',NULL,'admin','正農化學股份有限公司',130),(1296,'益能牌一號有機質肥料',2,'','有機資審字第102015號',NULL,'雜項堆肥(5-11)','肥製(質)字第0160006號','禽畜糞、菇類培植廢棄包(太空包)、植物性廢渣(茶渣)','全氮3.4%全磷酐2.4%全氧化鉀1.5%有機質85%',NULL,'admin','益農農業社',36),(1297,'益路產(賽達松)',3,'',NULL,'農藥進字第01625號',NULL,NULL,NULL,' S-α-ethoxycarbonylbenzyl O,O-dimethyl phosphorodithioate  50.000 (%)',NULL,'admin','耕得貿易股份有限公司',141),(1298,'益農丹(益滅松)',3,'',NULL,'農藥製字第04643號',NULL,NULL,NULL,' O,O-dimethyl S-phthalimidomethyl phosphorodithioate  50.000 (%)',NULL,'admin','中華民國農會附設各級農會農化廠',131),(1299,'益農友(益滅松)',3,'',NULL,'農藥製字第02951號',NULL,NULL,NULL,' O,O-dimethyl S-phthalimidomethyl phosphorodithioate  50.000 (%)',NULL,'admin','光華化學股份有限公司',77),(1300,'益農寶(氫氧化銅)',3,'',NULL,'農藥製字第03882號',NULL,NULL,NULL,' CUPRIC HYDROXIDE  77.000 (%)',NULL,'admin','日農科技股份有限公司',105),(1301,'益農產(賽達松)',3,'',NULL,'農藥製字第00568號',NULL,NULL,NULL,' S-α-ethoxycarbonylbenzyl O,O-dimethyl phosphorodithioate  50.000 (%)',NULL,'admin','台灣日產化工股份有限公司',104),(1302,'益速通(三泰芬)',3,'',NULL,'農藥製字第04486號',NULL,NULL,NULL,'1-(4-chlorophenoxy)-3,3-dimethyl-1-(1H-1,2,4-triazol-1-yl)butan-2-one 25.000 (%) ',NULL,'admin','國豐化學工業股份有限公司',112),(1303,'益速龍(佈飛松)',3,'',NULL,'農藥進字第02367號',NULL,NULL,NULL,'O-4-bromo-2-chlorophenyl O-ethyl S-propyl phosphorothioate 43.000 (%) ',NULL,'admin','益欣股份有限公司',176),(1304,'益達胺 18.2% (農會農化廠)',3,'',NULL,'農藥製字第06424號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 18.200 (%)',NULL,'admin','中華民國農會附設各級農會農化廠',131),(1305,'省時本(陶斯松)',3,'',NULL,'農藥製字第03887號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%) ',NULL,'admin','興農股份有限公司',85),(1306,'省淨茤(益達胺)',3,'',NULL,'農藥製字第05345號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 2.000  (%)',NULL,'admin','臺益工業股份有限公司',39),(1307,'眞嘉讚(亞托待克利)',3,'',NULL,'農藥製字第06521號',NULL,NULL,NULL,'(1) methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate...200 g/L (2) cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1-ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether...125 g/L',NULL,'admin','華夏科學農化股份有限公司',106),(1308,'眞夠力(亞滅培)',3,'',NULL,'農藥製字第06258號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%) ',NULL,'admin','華夏科學農化股份有限公司',106),(1309,'眞蛾樂(得芬諾)',3,'',NULL,'農藥製字第06232號',NULL,NULL,NULL,' N-tert-butyl-N’-(4-ethylbenzoyl)-3,5-dimethylbenzohydrazide  19.700 (%)',NULL,'admin','華夏科學農化股份有限公司',106),(1310,'眞豐收(賽果培)',3,'',NULL,'農藥製字第06413號',NULL,NULL,NULL,'(Z)-3-(6-chloro-3-pyridylmethyl)-1,3-thiazolidin-2-ylidenecyanamide 40.400 (%)',NULL,'admin','華夏科學農化股份有限公司',106),(1311,'真-力樂滅(鋅錳滅達樂)',3,'',NULL,'農藥進字第02267號',NULL,NULL,NULL,'(1) manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt...48%(2) methyl N-(methoxyacetyl)-N-(2,6-xylyl)-DL-alaninate...10%',NULL,'admin','貝士得開發企業有限公司',163),(1312,'真乾淨(甲基多保淨)',3,'',NULL,'農藥製字第06348號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 40.000 (%)',NULL,'admin','瑞芳植物保護股份有限公司',115),(1313,'真伶俐(硫敵克)',3,'',NULL,'農藥製字第06531號',NULL,NULL,NULL,'3,7,9,13-tetramethyl-5,11-dioxa-2,8,14-trithia-4,7,9,12-tetra-azapentadeca-3,12-diene-6,10-dione 75.000 (%)',NULL,'admin','日農科技股份有限公司',105),(1314,'真愛用(賽洛寧)',3,'',NULL,'農藥製字第05024號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.800  (%)   ',NULL,'admin','台灣日產化工股份有限公司',104),(1315,'真托福(托福松)',3,'',NULL,'農藥製字第04846號',NULL,NULL,NULL,' S-tert-butylthiomethyl O,O-diethyl phosphorodithioate  10.000 (%)',NULL,'admin','日農科技股份有限公司',105),(1316,'真有力(賽洛寧)',3,'',NULL,'農藥進字第02252號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.800  (%)  ',NULL,'admin','貝士得開發企業有限公司',163),(1317,'真本頂(菲克利)',3,'',NULL,'農藥製字第05633號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 23.000 (%) ',NULL,'admin','惠光股份有限公司',121),(1318,'真正勇(阿巴汀)',3,'',NULL,'農藥製字第05722號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%) ',NULL,'admin','正農化學股份有限公司',130),(1319,'真清優(百利普芬)',3,'',NULL,'農藥製字第06189號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 11.000 (%) ',NULL,'admin','正農化學股份有限公司',130),(1320,'真清去(第滅寧)',3,'',NULL,'農藥製字第04503號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%)  ',NULL,'admin','瑞芳植物保護股份有限公司',115),(1321,'真清蠅(賽滅淨)',3,'',NULL,'農藥製字第04565號',NULL,NULL,NULL,'N-cyclopropyl-1,3,5-triazine-2,4,6-triamine 8.900  (%)',NULL,'admin','惠光股份有限公司',121),(1322,'真清露(鋅錳克絕)',3,'',NULL,'農藥進字第02201號',NULL,NULL,NULL,'(1) 1-(2-cyano-2-methoxyiminoacetyl)-3-ethylurea…8% (2) manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt…64%',NULL,'admin','貝士得開發企業有限公司',163),(1323,'真無蠅(賽滅淨)',3,'',NULL,'農藥製字第04742號',NULL,NULL,NULL,'N-cyclopropyl-1,3,5-triazine-2,4,6-triamine 75.000 (%)',NULL,'admin','惠光股份有限公司',121),(1324,'真甘丹(普拔克)',3,'',NULL,'農藥製字第05902號',NULL,NULL,NULL,' propyl 3-(dimethylamino)propylcarbamate hydrochloride  39.500 (%)',NULL,'admin','惠光股份有限公司',121),(1325,'真省力(賽洛寧)',3,'',NULL,'農藥製字第06403號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.500  (%)   ',NULL,'admin','台農三和化工股份有限公司',119),(1326,'真省功(賽洛寧)',3,'',NULL,'農藥製字第06378號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 5.000  (%) ',NULL,'admin','台農三和化工股份有限公司',119),(1327,'真福氣(賽扶寧)',3,'',NULL,'農藥製字第04097號',NULL,NULL,NULL,'(RS)-α-cyano-4-fluoro-3-phenoxybenzyl (1RS,3RS;1RS,3SR)-3-(2,2-dichlorovinyl)-2,2-dimethylcyclopropanecarboxylate 5.700  (%) ',NULL,'admin','瑞芳植物保護股份有限公司',115),(1328,'真讚(福瑞松)',3,'',NULL,'農藥製字第04853號',NULL,NULL,NULL,' O,O-diethyl S-ethylthiomethyl phosphorodithioate  10.000 (%)',NULL,'admin','日農科技股份有限公司',105),(1329,'真讚同(依普同)',3,'',NULL,'農藥製字第05013號',NULL,NULL,NULL,'3-(3,5-dichlorophenyl)-N-isopropyl-2,4-dioxoimidazolidine-1-carboxamide  50.000 (%)',NULL,'admin','興農股份有限公司',85),(1330,'真豪用(陶斯寧)',3,'',NULL,'農藥製字第05806號',NULL,NULL,NULL,'(1) O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate…45.45% (2) (RS)-α-cyano-3-phenoxybenzyl (1RS)-cis-trans-3-(2,2-dichlorovinyl)-2,2-dimethylcyclopropanecarboxylate…4.55%',NULL,'admin','惠光股份有限公司',121),(1331,'真賜錫(陶斯松)',3,'',NULL,'農藥進字第01513號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 22.500 (%) ',NULL,'admin','臺聯實業股份有限公司',107),(1332,'真霹靂(益達胺)',3,'',NULL,'農藥進字第03189號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 18.200 (%) ',NULL,'admin','台灣瑪斯德股份有限公司',145),(1333,'真靈(硫敵克)',3,'',NULL,'農藥製字第05133號',NULL,NULL,NULL,'3,7,9,13-tetramethyl-5,11-dioxa-2,8,14-trithia-4,7,9,12-tetra-azapentadeca-3,12-diene-6,10-dione 75.000 (%)',NULL,'admin','國豐化學工業股份有限公司',112),(1334,'真靈精(硫敵克)',3,'',NULL,'農藥製字第05209號',NULL,NULL,NULL,'3,7,9,13-tetramethyl-5,11-dioxa-2,8,14-trithia-4,7,9,12-tetra-azapentadeca-3,12-diene-6,10-dione 34.000 (%)',NULL,'admin','國豐化學工業股份有限公司',112),(1335,'真青翠(快諾芬)',3,'',NULL,'農藥進字第02199號',NULL,NULL,NULL,'5,7-dichloro-4-quinolyl 4-fluorophenyl ether 22.580 (%)  ',NULL,'admin','台灣道禮股份有限公司',174),(1336,'真順(益滅松)',3,'',NULL,'農藥製字第05259號',NULL,NULL,NULL,' O,O-dimethyl S-phthalimidomethyl phosphorodithioate  50.000 (%)',NULL,'admin','興農股份有限公司',85),(1337,'真額樂(益達胺)',3,'',NULL,'農藥製字第04944號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%)',NULL,'admin','國豐化學工業股份有限公司',112),(1338,'真額樂-精(益達胺)',3,'',NULL,'農藥製字第05263號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 18.200 (%)',NULL,'admin','國豐化學工業股份有限公司',112),(1339,'眾喜(第滅寧)',3,'',NULL,'農藥製字第04113號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%)   ',NULL,'admin','眾益農業生技股份有限公司',124),(1340,'眾果生(馬拉松)',3,'',NULL,'農藥製字第00801號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 50.000 (%)   ',NULL,'admin','眾益農業生技股份有限公司',124),(1341,'矮仔冬瓜(加保扶)',3,'',NULL,'農藥製字第00103號',NULL,NULL,NULL,'2,3-dihydro-2,2-dimethylbenzofuran-7-yl methylcarbamate  3.000 (%)',NULL,'admin','龍燈生物科技股份有限公司',76),(1342,'研發(達滅芬)',3,'',NULL,'農藥進字第03121號',NULL,NULL,NULL,'(E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine  50.000 (%)',NULL,'admin','台灣科研生物技術有限公司',133),(1343,'確保淨(甲基多保淨)',3,'',NULL,'農藥製字第03540號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 70.000 (%)',NULL,'admin','世大農化工廠股份有限公司	',114),(1344,'確保淨－精(甲基多保淨)',3,'',NULL,'農藥製字第06066號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 40.000 (%) ',NULL,'admin','世大農化工廠股份有限公司	',114),(1345,'確實勇(阿巴汀)',3,'',NULL,'農藥製字第05499號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%)',NULL,'admin','國豐化學工業股份有限公司',112),(1346,'確實多(氫氧化銅)',3,'',NULL,'農藥製字第04394號',NULL,NULL,NULL,' CUPRIC HYDROXIDE  77.000 (%)',NULL,'admin','世大農化工廠股份有限公司	',114),(1347,'確實大(派滅淨)',3,'',NULL,'農藥製字第05549號',NULL,NULL,NULL,'(E)-4,5-dihydro-6-methyl-4-(3-pyridylmethyleneamino)-1,2,4- triazin-3(2H)-one 25.000 (%)',NULL,'admin','世大農化工廠股份有限公司	',114),(1348,'確實讚(派滅淨)',3,'',NULL,'農藥進字第02785號',NULL,NULL,NULL,'(E)-4,5-dihydro-6-methyl-4-(3-pyridylmethyleneamino)-1,2,4- triazin-3(2H)-one 25.000 (%)',NULL,'admin','雅飛有限公司',126),(1349,'確斯寧(陶斯寧)',3,'',NULL,'農藥製字第05729號',NULL,NULL,NULL,'(1) O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate…45.45% (2) (RS)-α-cyano-3-phenoxybenzyl (1RS)-cis-trans-3-(2,2-dichlorovinyl)-2,2-dimethylcyclopropanecarboxylate…4.55%',NULL,'admin','立農化學股份有限公司',143),(1350,'礦物油 (嘉農企業股份有限公司)',3,'',NULL,'農藥製字第02620號',NULL,NULL,NULL,'ALIPHATIC HYDROCARBONS 95.000 (%)',NULL,'admin','嘉農企業股份有限公司',117),(1351,'礦物油(農會農化廠)',3,'',NULL,'農藥製字第01219號',NULL,NULL,NULL,'ALIPHATIC HYDROCARBONS 95.000 (%)',NULL,'admin','中華民國農會附設各級農會農化廠',131),(1352,'礦物油(億豐農化廠股份有限公司)',3,'',NULL,'農藥製字第01126號',NULL,NULL,NULL,'ALIPHATIC HYDROCARBONS 95.000 (%)  ',NULL,'admin','億豐農化廠股份有限公司',122),(1353,'礦物油(台灣日產化工股份有限公司)',3,'',NULL,'農藥製字第00572號',NULL,NULL,NULL,'ALIPHATIC HYDROCARBONS 95.000 (%)',NULL,'admin','台灣日產化工股份有限公司',104),(1354,'礦物油(台灣正豐植保股份有限公司)',3,'',NULL,'農藥製字第00081號',NULL,NULL,NULL,'ALIPHATIC HYDROCARBONS 95.000 (%) ',NULL,'admin','台灣正豐植保股份有限公司',128),(1355,'礦物油(大成化學工業股份有限公司)',3,'',NULL,'農藥製字第01885號',NULL,NULL,NULL,'ALIPHATIC HYDROCARBONS 95.000 (%)',NULL,'admin','大成化學工業股份有限公司',127),(1356,'礦物油(惠大實業股份有限公司)',3,'',NULL,'農藥製字第00255號',NULL,NULL,NULL,'ALIPHATIC HYDROCARBONS 95.000 (%)',NULL,'admin','惠大實業股份有限公司',157),(1357,'礦物油(華夏科學農化股份)',3,'',NULL,'農藥製字第03575號',NULL,NULL,NULL,'ALIPHATIC HYDROCARBONS 95.000 (%)',NULL,'admin','華夏科學農化股份有限公司',106),(1358,'祝你發(菲克利)',3,'',NULL,'農藥進字第03394號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 23.000 (%)',NULL,'admin','日農科技股份有限公司',105),(1359,'祝勇健(第滅寧)',3,'',NULL,'農藥製字第06500號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.400  (%)',NULL,'admin','惠光股份有限公司',121),(1360,'祝好收(賽洛寧)',3,'',NULL,'農藥製字第05276號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.800  (%)   ',NULL,'admin','東和化學企業股份有限公司',109),(1361,'祝清氣(派滅淨)',3,'',NULL,'農藥進字第03309號',NULL,NULL,NULL,'(E)-4,5-dihydro-6-methyl-4-(3-pyridylmethyleneamino)-1,2,4- triazin-3(2H)-one 25.000 (%) ',NULL,'admin','大成化學工業股份有限公司',127),(1362,'祝禾勇(腐絕快得寧)',3,'',NULL,'農藥製字第04780號',NULL,NULL,NULL,'(1) 2-(THIAZOL-4-YL)BENZIMIDAZOLE....................18%(2) BIS(QUINOLIN-8-OLATO-O,N)COPPER..................35%',NULL,'admin','世大農化工廠股份有限公司	',114),(1363,'祝自然(賜諾殺)',3,'',NULL,'農藥進字第02740號',NULL,NULL,NULL,'A MIXTURE OF SPINOSYN A AND SPINOSYN D 80.000 (%)',NULL,'admin','台灣道禮股份有限公司',174),(1364,'祝讚(納得亞滅寧)',3,'',NULL,'農藥製字第04642號',NULL,NULL,NULL,'納乃得 12% 亞滅寧 1.5%',NULL,'admin','日農科技股份有限公司',105),(1365,'祝豐成(賽果培)',3,'',NULL,'農藥進字第02553號',NULL,NULL,NULL,'(Z)-3-(6-chloro-3-pyridylmethyl)-1,3-thiazolidin-2-ylidenecyanamide 40.400 (%)',NULL,'admin','台灣拜耳股份有限公司',101),(1366,'祝豐收(菲克利)',3,'',NULL,'農藥進字第03061號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 5.000  (%) ',NULL,'admin','嘉濱貿易有限公司',111),(1367,'祝靈(納乃得)',3,'',NULL,'農藥製字第05405號',NULL,NULL,NULL,' S-methyl N-(methylcarbamoyloxy)thioacetimidate  40.000 (%)',NULL,'admin','安旺特股份有限公司',120),(1368,'神農丹(腈硫醌)',3,'',NULL,'農藥製字第05735號',NULL,NULL,NULL,'5,10-dihydro-5,10-dioxonaphtho[2,3-b]-1,4-dithiine-2,3-dicarbonitrile 42.200 (%)',NULL,'admin','臺聯實業股份有限公司',107),(1369,'神雷(四氯保淨)',3,'',NULL,'農藥製字第00400號',NULL,NULL,NULL,'(1) dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate)...20% (2) tetrachloroisophthalonitrile...50%',NULL,'admin','日農科技股份有限公司',105),(1370,'神駒(亞托待克利)',3,'',NULL,'農藥製字第06197號',NULL,NULL,NULL,'(1) methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate...200 g/L (2) cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1-ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether...125 g/L 325 G/L (32.5% W/V)',NULL,'admin','洽益化學股份有限公司',108),(1371,'神龍(菲克利)',3,'',NULL,'農藥製字第04785號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 10.000 (%)',NULL,'admin','富農化學工業股份有限公司',132),(1372,'祥介勇(佈飛松)',3,'',NULL,'農藥製字第04504號',NULL,NULL,NULL,'O-4-bromo-2-chlorophenyl O-ethyl S-propyl phosphorothioate 43.000 (%)',NULL,'admin','世大農化工廠股份有限公司	',114),(1373,'祥介好(達滅芬)',3,'',NULL,'農藥進字第02901號',NULL,NULL,NULL,'(E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine  50.000 (%)',NULL,'admin','東鋒股份有限公司',154),(1374,'祥介讚(達滅芬)',3,'',NULL,'農藥製字第06132號',NULL,NULL,NULL,'(E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine  50.000 (%)',NULL,'admin','光華化學股份有限公司',77),(1375,'祥優(達滅芬)',3,'',NULL,'農藥進字第02724號',NULL,NULL,NULL,'(E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine  50.000 (%)',NULL,'admin','台灣瑪斯德股份有限公司',145),(1376,'祥冷攢(賽洛寧)',3,'',NULL,'農藥進字第02351號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.800  (%)  ',NULL,'admin','嘉濱貿易有限公司',111),(1377,'祥好用(阿巴汀)',3,'',NULL,'農藥製字第05577號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%) ',NULL,'admin','臺聯實業股份有限公司',107),(1378,'祥寶(四氯異苯腈)',3,'',NULL,'農藥製字第05022號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  40.000 (%)',NULL,'admin','臺聯實業股份有限公司',107),(1379,'祥展(達滅芬)',3,'',NULL,'農藥進字第02413號',NULL,NULL,NULL,'(E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine  50.000 (%)',NULL,'admin','鴻鋒化學有限公司',134),(1380,'祥強(達滅芬)',3,'',NULL,'農藥製字第06077號',NULL,NULL,NULL,'(E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine  50.000 (%)',NULL,'admin','台農三和化工股份有限公司',119),(1381,'祥猛(益滅賽寧)',3,'',NULL,'農藥製字第04475號',NULL,NULL,NULL,'(1)O,O-dimethyl S-phthalimidomethyl phosphorodithioate…30%  (2)(RS)-α-cyano-3-phenoxybenzyl(1RS)-cis-trans-3-(2,2-dichlorovinyl)-2,2-dimethyl cyclopropanecarboxylate …10%',NULL,'admin','台灣正豐植保股份有限公司',128),(1382,'祥發(達滅芬)',3,'',NULL,'農藥進字第02967號',NULL,NULL,NULL,'(E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine  50.000 (%)',NULL,'admin','台灣巴斯夫股份有限公司',123),(1383,'祥稱(達滅芬)',3,'',NULL,'農藥製字第05296號',NULL,NULL,NULL,'(E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine  50.000 (%)',NULL,'admin','富農化學工業股份有限公司',132),(1384,'祥讚(快得寧)',3,'',NULL,'農藥進字第01274號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 33.500 (%) ',NULL,'admin','儂泰貿易有限公司',181),(1385,'祥靈(硫敵克)',3,'',NULL,'農藥進字第02551號',NULL,NULL,NULL,'3,7,9,13-tetramethyl-5,11-dioxa-2,8,14-trithia-4,7,9,12-tetra-azapentadeca-3,12-diene-6,10-dione 75.000 (%) ',NULL,'admin','優必樂有限公司',151),(1386,'祥順(加保利)',3,'',NULL,'農藥製字第04737號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 40.000 (%) ',NULL,'admin','臺聯實業股份有限公司',107),(1387,'福元精(依普同)',3,'',NULL,'農藥進字第03079號',NULL,NULL,NULL,'3-(3,5-dichlorophenyl)-N-isopropyl-2,4-dioxoimidazolidine-1-carboxamide  23.700 (%)',NULL,'admin','台灣富美實有限公司',140),(1388,'福到(得克利)',3,'',NULL,'農藥進字第02995號',NULL,NULL,NULL,'(RS)-1-p-chlorophenyl-4,4-dimethyl-3-(1H-1,2,4-triazol-1- ylmethyl)pentan-3-ol 25.900 (%)  ',NULL,'admin','嘉濱貿易有限公司',111),(1389,'福力克(邁克尼)',3,'',NULL,'農藥進字第01948號',NULL,NULL,NULL,'2-p-chlorophenyl-2-(1H-1,2,4-triazol-1-ylmethyl)hexanenitrile 13.400 (%)  ',NULL,'admin','臺聯實業股份有限公司',107),(1390,'福力松(陶斯松)',3,'',NULL,'農藥進字第01739號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%) ',NULL,'admin','耕得貿易股份有限公司',141),(1391,'福加仁(加保福化利)',3,'',NULL,'農藥製字第03790號',NULL,NULL,NULL,'(1) (RS)-α-CYANO-3-PHENOXYBENZYL N-(2-CHLORO-α,α,α   -TRIFLUORO-P-TOLYL)-D-VALINATE…10%                        (2) 1-NAPHTHYL METHYLCARBAMATE…30% 40.000 (%) ',NULL,'admin','臺灣庵原農藥股份有限公司',113),(1392,'福壽牌大自然生技基肥',2,'','有機資審字第101017號',NULL,'一般堆肥(5-10)','肥製(質)字第0085036號','米糠、蔗渣、菇類培植廢棄包','全氮2.5%全磷酐2.5%全氧化鉀1.5%有機質60%',NULL,'admin','福壽實業股份有限公司',25),(1393,'福壽牌年年發1號',2,'','有機資審字第107018號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0085183號','芝麻粕、蓖麻粕、米糠','全氮5.5%全磷酐3.0%全氧化鉀2.0%有機質80.0%',NULL,'admin','福壽實業股份有限公司',25),(1394,'福壽牌生機栽培專用肥 426',2,'','有機資審字第100001號',NULL,'混合有機質肥料(5-12)','肥製(質)字第 0085078號','蓖蔴粕、菜籽粕、椰子 粕、芝麻粕、草木灰 ','全氮 4% 全磷酐 2% 全氧化鉀 6% 有機質 70%',NULL,'admin','福壽實業股份有限公司',25),(1395,'福壽牌生機栽培專用肥522',2,'','有機資審字第100014號',NULL,'植物渣粕肥料(5-01)','肥製(質)字第0085098號','菜籽粕(10%)、芝麻粕、椰子粕(25%)、米糠','全氮5%全磷酐2%全氧化鉀2%有機質70%',NULL,'admin','福壽實業股份有限公司',25),(1396,'福壽牌生機栽培專用肥532',2,'106/7/4原「福壽牌特級有夠肥7號」變更名稱','有機資審字第101018號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0085103號','大豆粕、菜籽粕(1%)、蓖麻粕(12%)、花生粕、芝麻粕、椰子粕(20%)、米糠','全氮5%全磷酐3%全氧化鉀2%有機質75%',NULL,'admin','福壽實業股份有限公司',25),(1397,'福壽牌苦楝油',3,'','有機資審字第107032號','植保製字第00009號',NULL,NULL,NULL,'苦楝油',NULL,'admin','福壽實業股份有限公司',25),(1398,'福多寧(農會農化廠)',3,'',NULL,'農藥製字第04317號',NULL,NULL,NULL,' α-α-α-trifluoro-3’-isopropoxy-o-toluanilide  20.000 (%)',NULL,'admin','中華民國農會附設各級農會農化廠',131),(1399,'福大尼(氟尼胺)',3,'',NULL,'農藥進字第03385號',NULL,NULL,NULL,'N-cyanomethyl-4-(trifluoromethyl)nicotinamide 10.000 (%)',NULL,'admin','嘉濱貿易有限公司',111),(1400,'福寶(因得克)',3,'',NULL,'農藥製字第06397號',NULL,NULL,NULL,' methyl (S)-N-[7-chloro-2,3,4a,5-tetrahydro-4a-(methoxycarbonyl)indeno[1,2-e][1,3,4]oxadiazin-2-ylcarbonyl]-4’-(trifluoromethoxy)carbanilate  14.500 (%)',NULL,'admin','好速化學股份有限公司',118),(1401,'福得寶(腈硫醌)',3,'',NULL,'農藥進字第00566號',NULL,NULL,NULL,'5,10-dihydro-5,10-dioxonaphtho[2,3-b]-1,4-dithiine-2,3-dicarbonitrile 70.000 (%)   ',NULL,'admin','台灣巴斯夫股份有限公司',123),(1402,'福旺(三氟敏)',3,'',NULL,'農藥進字第03104號',NULL,NULL,NULL,' methyl (E)-methoxyimino-{(E)-α-[1-(α,α,α-trifluoro-m-tolyl)ethylideneaminooxy]-o-tolyl}acetate  50.000 (%)',NULL,'admin','大勝化學工業股份有限公司',110),(1403,'福氣(加保福化利)',3,'',NULL,'農藥製字第04773號',NULL,NULL,NULL,'(1) (RS)-α-CYANO-3-PHENOXYBENZYL N-(2-CHLORO-α,α,α   -TRIFLUORO-P-TOLYL)-D-VALINATE…10%                        (2) 1-NAPHTHYL METHYLCARBAMATE…30% 40.000 (%) ',NULL,'admin','世大農化工廠股份有限公司	',114),(1404,'福燦松(陶斯松)',3,'',NULL,'農藥進字第02765號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%) ',NULL,'admin','安農股份有限公司',156),(1405,'福瑞得(福瑞松)',3,'',NULL,'農藥製字第04775號',NULL,NULL,NULL,' O,O-diethyl S-ethylthiomethyl phosphorodithioate  10.000 (%)',NULL,'admin','東和化學企業股份有限公司',109),(1406,'福瑞松(農會農化廠)',3,'',NULL,'農藥製字第00232號',NULL,NULL,NULL,' O,O-diethyl S-ethylthiomethyl phosphorodithioate  10.000 (%)',NULL,'admin','中華民國農會附設各級農會農化廠',131),(1407,'福益松(福瑞松)',3,'',NULL,'農藥製字第05482號',NULL,NULL,NULL,' O,O-diethyl S-ethylthiomethyl phosphorodithioate  10.000 (%)',NULL,'admin','洽益化學股份有限公司',108),(1408,'福祿壽(祿芬隆)',3,'',NULL,'農藥製字第06210號',NULL,NULL,NULL,'(RS)-1-[2,5-dichloro-4-(1,1,2,3,3,3-hexafluoropropoxy)- phenyl]-3-(2,6-difluorobenzoyl)-urea  4.400 (%)',NULL,'admin','臺益工業股份有限公司',39),(1409,'福立大(依普同)',3,'',NULL,'農藥製字第06490號',NULL,NULL,NULL,'3-(3,5-dichlorophenyl)-N-isopropyl-2,4-dioxoimidazolidine-1-carboxamide  50.000 (%)',NULL,'admin','大勝化學工業股份有限公司',110),(1410,'福美龍(益滅松)',3,'',NULL,'農藥製字第04862號',NULL,NULL,NULL,'O,O-dimethyl S-phthalimidomethyl phosphorodithioate  50.000 (%)',NULL,'admin','臺益工業股份有限公司',39),(1411,'福臨(三氟敏)',3,'',NULL,'農藥進字第02164號',NULL,NULL,NULL,' methyl (E)-methoxyimino-{(E)-α-[1-(α,α,α-trifluoro-m-tolyl)ethylideneaminooxy]-o-tolyl}acetate  50.000 (%)',NULL,'admin','台灣拜耳股份有限公司',101),(1412,'福露收(甲鋅保淨)',3,'',NULL,'農藥製字第04314號',NULL,NULL,NULL,'(1)polymeric zinc 1,2-propylenebis(dithiocarbamate)   .....45%         (2)dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate)  .....30%',NULL,'admin','興農股份有限公司',85),(1413,'福順(三氟敏)',3,'',NULL,'農藥進字第03371號',NULL,NULL,NULL,' methyl (E)-methoxyimino-{(E)-α-[1-(α,α,α-trifluoro-m-tolyl)ethylideneaminooxy]-o-tolyl}acetate  50.000 (%)',NULL,'admin','雅飛有限公司',126),(1414,'禾力發(達滅芬)',3,'',NULL,'農藥製字第05777號',NULL,NULL,NULL,'(E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine  50.000 (%)',NULL,'admin','世大農化工廠股份有限公司	',114),(1415,'禾力稱(賽滅淨)',3,'',NULL,'農藥製字第06503號',NULL,NULL,NULL,'N-cyclopropyl-1,3,5-triazine-2,4,6-triamine 75.000 (%)',NULL,'admin','台農三和化工股份有限公司',119),(1416,'禾立旺(賽滅淨)',3,'',NULL,'農藥製字第04996號',NULL,NULL,NULL,'N-cyclopropyl-1,3,5-triazine-2,4,6-triamine 75.000 (%)',NULL,'admin','世大農化工廠股份有限公司	',114),(1417,'科研-總殺菌(氫氧化銅)',3,'',NULL,'農藥進字第03266號',NULL,NULL,NULL,'CUPRIC HYDROXIDE  53.800 (%)',NULL,'admin','優必樂有限公司',151),(1418,'稱上天(亞托敏)',3,'',NULL,'農藥進字第02928號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','春匯有限公司',149),(1419,'稱乘稱(亞托敏)',3,'',NULL,'農藥進字第03196號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','法台貿易有限公司',135),(1420,'稱介久(亞托敏)',3,'',NULL,'農藥進字第03046號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','聯利農業科技股份有限公司',103),(1421,'稱介讚(亞托待克利)',3,'',NULL,'農藥進字第03329號',NULL,NULL,NULL,'(1) methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate...200 g/L (2) cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1-ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether...125 g/L 325 G/L (32.5% W/V)',NULL,'admin','春匯有限公司',149),(1422,'稱全台(亞托敏)',3,'',NULL,'農藥製字第05920號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','嘉農企業股份有限公司',117),(1423,'稱刮刮(亞托敏)',3,'',NULL,'農藥製字第05989號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','龍燈生物科技股份有限公司',76),(1424,'稱勁玖(亞托敏)',3,'',NULL,'農藥進字第03129號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','優必樂有限公司',151),(1425,'稱嘎(亞托敏)',3,'',NULL,'農藥製字第06031號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','華夏科學農化股份有限公司',106),(1426,'稱嘜丸(亞托敏)',3,'',NULL,'農藥製字第06334號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  50.000 (%)',NULL,'admin','嘉泰企業股份有限公司',102),(1427,'稱嘜停(亞托敏)',3,'',NULL,'農藥製字第04945號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','嘉泰企業股份有限公司',102),(1428,'稱嘜利(亞托待克利)',3,'',NULL,'農藥製字第06371號',NULL,NULL,NULL,'(1) methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate...200 g/L (2) cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1-ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether...125 g/L',NULL,'admin','嘉泰企業股份有限公司',102),(1429,'稱天下(亞托敏)',3,'',NULL,'農藥製字第05940號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','聯利農業科技股份有限公司',103),(1430,'稱天地(亞托敏)',3,'',NULL,'農藥進字第02948號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','安旺特股份有限公司',120),(1431,'稱好速(亞托敏)',3,'',NULL,'農藥製字第05933號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','好速化學股份有限公司',118),(1432,'稱尚久(亞托敏)',3,'',NULL,'農藥製字第05591號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','國豐化學工業股份有限公司',112),(1433,'稱恬恬(亞托敏)',3,'',NULL,'農藥進字第02110號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  10.000 (%)',NULL,'admin','台灣先正達股份有限公司',144),(1434,'稱某煞(亞托敏)',3,'',NULL,'農藥製字第06140號',NULL,NULL,NULL,'methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','台農三和化工股份有限公司',119),(1435,'稱無限(亞托敏)',3,'',NULL,'農藥進字第01825號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  250 G/L (25% W/V)',NULL,'admin','台灣先正達股份有限公司',144),(1436,'稱稱叫(亞托敏)',3,'',NULL,'農藥製字第05976號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','東和化學企業股份有限公司',109),(1437,'稱豐收(亞托敏)',3,'',NULL,'農藥製字第05898號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','興農股份有限公司',85),(1438,'稱通玖(亞托敏)',3,'',NULL,'農藥進字第03529號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','威玖生技有限公司',142),(1439,'稱霸天下(亞托敏)',3,'',NULL,'農藥製字第06010號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','安旺特股份有限公司',120),(1440,'稱霸年(百克敏)',3,'',NULL,'農藥製字第06539號',NULL,NULL,NULL,' methyl N-{2-[1-(4-chlorophenyl)pyrazol-3-yloxymethyl]phenyl}(N-methoxy)carbamate  23.600 (%)',NULL,'admin','臺灣庵原農藥股份有限公司',113),(1441,'稱麥條(克收欣)',3,'',NULL,'農藥製字第05303號',NULL,NULL,NULL,'methyl (E)-methoxyimino[2-(o-tolyloxymethyl)phenyl]acetate 44.200 (%)',NULL,'admin','興農股份有限公司',85),(1442,'稻欉青(菲克利)',3,'',NULL,'農藥進字第02710號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 10.000 (%)',NULL,'admin','法台貿易有限公司',135),(1443,'稻穗勇(菲克利)',3,'',NULL,'農藥進字第02289號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 10.000 (%) ',NULL,'admin','合林企業有限公司',166),(1444,'稻紋精(菲克利)',3,'',NULL,'農藥製字第05131號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 10.000 (%)',NULL,'admin','中華民國農會附設各級農會農化廠',131),(1445,'穗安淨(菲克利)',3,'',NULL,'農藥製字第05012號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 10.000 (%)',NULL,'admin','大成化學工業股份有限公司',127),(1446,'穗紋淨(菲克利)',3,'',NULL,'農藥製字第04009號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 10.000 (%) ',NULL,'admin','嘉泰企業股份有限公司',102),(1447,'穗飽滿(菲克利)',3,'',NULL,'農藥製字第05125號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 10.000 (%) ',NULL,'admin','洽益化學股份有限公司',108),(1448,'穩介讚(陶斯寧)',3,'',NULL,'農藥製字第05343號',NULL,NULL,NULL,'(1) O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate…45.45% (2) (RS)-α-cyano-3-phenoxybenzyl (1RS)-cis-trans-3-(2,2-dichlorovinyl)-2,2-dimethylcyclopropanecarboxylate…4.55%',NULL,'admin','利台化學工業股份有限公司',116),(1449,'穩凍(保粒保淨)',3,'',NULL,'農藥製字第04409號',NULL,NULL,NULL,'(1)5-(2-amino-5-O-carbamoyl-2-deoxy-L-xylonamido)-1,5-dideoxy-1-(1,2,3,4-tetrahydro-5-hydroxymethyl-2,4-dioxopyrimidin-1-yl)-β-D-allofuranuronic acid …..7%                                        (2)DIMETHYL 4,4\'-(O-PHENYLENE)BIS(3-THIOALLOPHANATE)…40%',NULL,'admin','興農股份有限公司',85),(1450,'穩効 25%(布芬淨)',3,'',NULL,'農藥進字第00162號',NULL,NULL,NULL,'(Z)-2-tert-butylimino-3-isopropyl-5-phenyl-1, 3, 5-thiadiazinan-4-one 25.000 (%)  ',NULL,'admin','日佳農葯股份有限公司',178),(1451,'穩効 40%(布芬淨)',3,'',NULL,'農藥進字第01023號',NULL,NULL,NULL,'(Z)-2-tert-butylimino-3-isopropyl-5-phenyl-1, 3, 5-thiadiazinan-4-one 40.000 (%)',NULL,'admin','日佳農葯股份有限公司',178),(1452,'穩夠本(陶斯松)',3,'',NULL,'農藥進字第01209號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%)',NULL,'admin','松樹國際有限公司',137),(1453,'穩好(得芬諾)',3,'',NULL,'農藥製字第05916號',NULL,NULL,NULL,' N-tert-butyl-N’-(4-ethylbenzoyl)-3,5-dimethylbenzohydrazide  19.700 (%)',NULL,'admin','洽益化學股份有限公司',108),(1454,'穩好大生(甲基鋅乃浦)',3,'',NULL,'農藥進字第03272號',NULL,NULL,NULL,' polymeric zinc 1,2-propylenebis(dithiocarbamate)  70.000 (%)',NULL,'admin','聯利農業科技股份有限公司',103),(1455,'穩好清(亞托待克利)',3,'',NULL,'農藥製字第06183號',NULL,NULL,NULL,'(1) methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate...200 g/L (2) cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1-ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether...125 g/L',NULL,'admin','日農科技股份有限公司',105),(1456,'穩宋 25%(布芬淨)',3,'',NULL,'農藥製字第05203號',NULL,NULL,NULL,'(Z)-2-tert-butylimino-3-isopropyl-5-phenyl-1, 3, 5-thiadiazinan-4-one 25.000 (%)',NULL,'admin','興農股份有限公司',85),(1457,'穩宋 40%(布芬淨)',3,'',NULL,'農藥製字第05192號',NULL,NULL,NULL,'(Z)-2-tert-butylimino-3-isopropyl-5-phenyl-1, 3, 5-thiadiazinan-4-one 40.000 (%)',NULL,'admin','興農股份有限公司',85),(1458,'穩尚強(亞滅培)',3,'',NULL,'農藥進字第02657號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%) ',NULL,'admin','嘉農企業股份有限公司',117),(1459,'穩常笑(布芬淨)',3,'',NULL,'農藥進字第03449號',NULL,NULL,NULL,'(Z)-2-tert-butylimino-3-isopropyl-5-phenyl-1, 3, 5-thiadiazinan-4-one 25.000 (%)  ',NULL,'admin','日農科技股份有限公司',105),(1460,'穩快好(賓得克利)',3,'',NULL,'農藥製字第05397號',NULL,NULL,NULL,'(1) 1-(4-chlorobenzyl)-1-cyclopentyl-3-phenylurea...15% (2) (RS)-1-p-chlorophenyl-4,4-dimethyl-3-(1H-1,2,4-triazol-1- ylmethyl)pentan-3-ol...10%',NULL,'admin','聯利農業科技股份有限公司',103),(1461,'穩旺(布芬淨)',3,'',NULL,'農藥進字第02434號',NULL,NULL,NULL,'(Z)-2-tert-butylimino-3-isopropyl-5-phenyl-1, 3, 5-thiadiazinan-4-one 25.000 (%)   ',NULL,'admin','雅飛有限公司',126),(1462,'穩殺淨(益達胺)',3,'',NULL,'農藥製字第05129號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%)',NULL,'admin','龍燈生物科技股份有限公司',76),(1463,'穩淨(布芬淨)',3,'',NULL,'農藥進字第01509號',NULL,NULL,NULL,'(Z)-2-tert-butylimino-3-isopropyl-5-phenyl-1, 3, 5-thiadiazinan-4-one 25.000 (%)',NULL,'admin','東鋒股份有限公司',154),(1464,'穩淨炭(亞托待克利)',3,'',NULL,'農藥製字第06548號',NULL,NULL,NULL,'(1) methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate...200 g/L (2) cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1-ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether...125 g/L',NULL,'admin','東和化學企業股份有限公司',109),(1465,'穩清(益達胺)',3,'',NULL,'農藥進字第02635號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%)  ',NULL,'admin','法台貿易有限公司',135),(1466,'穩炭(腈硫醌)',3,'',NULL,'農藥進字第02946號',NULL,NULL,NULL,'5,10-dihydro-5,10-dioxonaphtho[2,3-b]-1,4-dithiine-2,3-dicarbonitrile 70.000 (%)  ',NULL,'admin','萬得發有限公司',125),(1467,'穩無蚜(布芬淨)',3,'',NULL,'農藥進字第01675號',NULL,NULL,NULL,'(Z)-2-tert-butylimino-3-isopropyl-5-phenyl-1, 3, 5-thiadiazinan-4-one 25.000 (%)',NULL,'admin','瑞泓生技有限公司',184),(1468,'穩讚(布芬淨)',3,'',NULL,'農藥進字第00831號',NULL,NULL,NULL,'(Z)-2-tert-butylimino-3-isopropyl-5-phenyl-1, 3, 5-thiadiazinan-4-one 25.000 (%)',NULL,'admin','生力化學工業股份有限公司',139),(1469,'穩賺吉(待克利)',3,'',NULL,'農藥製字第06389號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 10.000 (%)',NULL,'admin','臺聯實業股份有限公司',107),(1470,'穩青(馬拉松)',3,'',NULL,'農藥製字第04127號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 50.000 (%)  ',NULL,'admin','好速化學股份有限公司',118),(1471,'穩響(賽洛寧)',3,'',NULL,'農藥製字第05167號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.800  (%)   ',NULL,'admin','大勝化學工業股份有限公司',110),(1472,'空手道(賽洛寧)',3,'',NULL,'農藥製字第05020號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.800  (%)   ',NULL,'admin','惠光股份有限公司',121),(1473,'立枯宝(殺紋寧)',3,'',NULL,'農藥製字第04860號',NULL,NULL,NULL,'5-methylisoxazole-3-ol 30.000 (%)',NULL,'admin','大勝化學工業股份有限公司',110),(1474,'立枯靈(殺紋寧)',3,'',NULL,'農藥進字第00432號',NULL,NULL,NULL,'5-methylisoxazole-3-ol 30.000 (%)',NULL,'admin','大勝化學工業股份有限公司',110),(1475,'立農-因滅汀(因滅汀)',3,'',NULL,'農藥製字第05625號',NULL,NULL,NULL,'因滅汀 5%',NULL,'admin','立農化學股份有限公司',143),(1476,'立農光明灯(保粒黴素 丁)',3,'',NULL,'農藥進字第03531號',NULL,NULL,NULL,'5-(2-amino-5-O-carbamoyl-2-deoxy-L-xylonamido)-1-(5-carboxy-1,2,3,4-tetrahydro-2,4-dioxopyrimidin-1-yl)-1,5-dideoxy-β-D-allofuranuronic acid 5.000  (%)',NULL,'admin','立農化學股份有限公司',143),(1477,'立農友効(布芬益化利)',3,'',NULL,'農藥製字第05097號',NULL,NULL,NULL,'(1) (Z)-2-tert-butylimino-3-isopropyl-5-phenyl-1, 3, 5-thiadiazinan-4-one …10%              (2) (S)-α-cyano-3-phenoxybenzyl (S)-2-(4- chlorophenyl)-3-methylbutyrate …1%',NULL,'admin','立農化學股份有限公司',143),(1478,'立農壹哥(亞托敏)',3,'',NULL,'農藥製字第06337號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  50.000 (%)',NULL,'admin','立農化學股份有限公司',143),(1479,'立農托福松(托福松)',3,'',NULL,'農藥製字第04933號',NULL,NULL,NULL,' S-tert-butylthiomethyl O,O-diethyl phosphorodithioate  10.000 (%)',NULL,'admin','立農化學股份有限公司',143),(1480,'立農穩收成(甲基鋅乃浦)',3,'',NULL,'農藥進字第03342號',NULL,NULL,NULL,' polymeric zinc 1,2-propylenebis(dithiocarbamate)  70.000 (%)',NULL,'admin','立農化學股份有限公司',143),(1481,'立農第滅寧(第滅寧)',3,'',NULL,'農藥製字第06173號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.400  (%)     ',NULL,'admin','立農化學股份有限公司',143),(1482,'立農速滅靈(撲滅寧)',3,'',NULL,'農藥製字第05041號',NULL,NULL,NULL,' N-(3,5-dichlorophenyl)-1,2-dimethylcyclopropane-1,2-dicarboximide  50.000 (%)',NULL,'admin','立農化學股份有限公司',143),(1483,'立達安(益達胺)',3,'',NULL,'農藥製字第05519號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%) ',NULL,'admin','立農化學股份有限公司',143),(1484,'立達樂(銅右滅達樂)',3,'',NULL,'農藥製字第05130號',NULL,NULL,NULL,'(1) methyl N-(methoxyacetyl)-N-(2,6-xylyl)-D-alaninate...2.5%(2) copper oxychloride...69.1%',NULL,'admin','立農化學股份有限公司',143),(1485,'第一金(亞托敏)',3,'',NULL,'農藥製字第05908號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','利台化學工業股份有限公司',116),(1486,'第壹勇(阿巴汀)',3,'',NULL,'農藥進字第02660號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%)',NULL,'admin','雋農實業股份有限公司',136),(1487,'第滅寧 2.4% (農會農化廠)',3,'',NULL,'農藥製字第06288號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.400  (%) ',NULL,'admin','中華民國農會附設各級農會農化廠',131),(1488,'第滅寧 2.8% (農會農化廠)',3,'',NULL,'農藥製字第04452號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%) ',NULL,'admin','中華民國農會附設各級農會農化廠',131),(1489,'第滅精(第滅寧)',3,'',NULL,'農藥製字第05215號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.400  (%)',NULL,'admin','國豐化學工業股份有限公司',112),(1490,'第王星(畢芬寧)',3,'',NULL,'農藥製字第05151號',NULL,NULL,NULL,'2-methylbiphenyl-3-ylmethyl (Z)-(1RS,3RS)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate  2.800 (%)',NULL,'admin','好速化學股份有限公司',118),(1491,'篤農家(馬拉松)',3,'',NULL,'農藥製字第03538號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 1.000  (%)',NULL,'admin','日農科技股份有限公司',105),(1492,'米倉(馬拉松)',3,'',NULL,'農藥製字第00062號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 1.000  (%)       ',NULL,'admin','聯利農業科技股份有限公司',103),(1493,'粉乾淨(白克列)',3,'',NULL,'農藥進字第03343號',NULL,NULL,NULL,'2-chloro-N-(4’-chlorobiphenyl-2-yl)nicotinamide 50.000 (%)',NULL,'admin','嘉濱貿易有限公司',111),(1494,'粉克靈(依瑞莫)',3,'',NULL,'農藥製字第02268號',NULL,NULL,NULL,'5-butyl-2-ethylamino-6-methylpyrimidin-4-ol 25.000 (%) ',NULL,'admin','嘉農企業股份有限公司',117),(1495,'粉多靈(硫酸銅)',3,'',NULL,'農藥進字第02364號',NULL,NULL,NULL,'COPPER SULFATE (COPPER SULFATE PENTAHYDRATE 21.36%) (CUPRIC AMMONIUM FORMATE AND TANNATE COMPLEX) (CU:5.5%) 21.400 (%) ',NULL,'admin','嘉濱貿易有限公司',111),(1496,'粉好效(邁克尼)',3,'',NULL,'農藥進字第02577號',NULL,NULL,NULL,'2-p-chlorophenyl-2-(1H-1,2,4-triazol-1-ylmethyl)hexanenitrile 13.400 (%) ',NULL,'admin','萬得發有限公司',125),(1497,'粉好治(二氟林)',3,'',NULL,'農藥進字第02210號',NULL,NULL,NULL,'(RS)-5-chloro-N-[1-(4-difluoromethoxyphenyl)propyl]-6- methylpyrimidin-4-ylamine 10.000 (%)',NULL,'admin','興農股份有限公司',85),(1498,'粉害怕 13.4%(邁克尼)',3,'',NULL,'農藥製字第05677號',NULL,NULL,NULL,'2-p-chlorophenyl-2-(1H-1,2,4-triazol-1-ylmethyl)hexanenitrile 13.400 (%)',NULL,'admin','國豐化學工業股份有限公司',112),(1499,'粉害怕 40%(邁克尼)',3,'',NULL,'農藥製字第05798號',NULL,NULL,NULL,'2-p-chlorophenyl-2-(1H-1,2,4-triazol-1-ylmethyl)hexanenitrile 40.000 (%)',NULL,'admin','國豐化學工業股份有限公司',112),(1500,'粉殺淨(白克列)',3,'',NULL,'農藥進字第03457號',NULL,NULL,NULL,'2-chloro-N-(4’-chlorobiphenyl-2-yl)nicotinamide 42.400 (%)',NULL,'admin','嘉濱貿易有限公司',111),(1501,'粉清除(菲克利)',3,'',NULL,'農藥製字第05788號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 5.000  (%)   ',NULL,'admin','日農科技股份有限公司',105),(1502,'粉炭吉(得克利)',3,'',NULL,'農藥進字第03363號',NULL,NULL,NULL,'(RS)-1-p-chlorophenyl-4,4-dimethyl-3-(1H-1,2,4-triazol-1- ylmethyl)pentan-3-ol 25.900 (%)   ',NULL,'admin','台灣科研生物技術有限公司',133),(1503,'粉煞(平克座)',3,'',NULL,'農藥製字第05793號',NULL,NULL,NULL,'1-(2,4-dichloro-β-propylphenethyl)-1H-1,2,4-triazole 19.000 (%)',NULL,'admin','臺聯實業股份有限公司',107),(1504,'粉蝨寶(亞滅培)',3,'',NULL,'農藥製字第05617號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%)',NULL,'admin','安旺特股份有限公司',120),(1505,'粉贊(邁克尼)',3,'',NULL,'農藥製字第05481號',NULL,NULL,NULL,'2-p-chlorophenyl-2-(1H-1,2,4-triazol-1-ylmethyl)hexanenitrile 13.400 (%)',NULL,'admin','瑞芳植物保護股份有限公司',115),(1506,'粉銹精(菲克利)',3,'',NULL,'農藥進字第02075號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 5.000  (%) ',NULL,'admin','台灣沙爾達有限公司',192),(1507,'粉霸(貝芬依滅列)',3,'',NULL,'農藥製字第04877號',NULL,NULL,NULL,'(1) METHYL BENZIMIDAZOL-2-YLCARBAMATE.....................30% (2) (±)-1-(β-ALLYLOXY-2,4-DICHLOROPHENYLETHYL)IMIDAZOLE..10%',NULL,'admin','富農化學工業股份有限公司',132),(1508,'紅不讓(快得寧)',3,'',NULL,'農藥製字第02490號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 33.500 (%)',NULL,'admin','東和化學企業股份有限公司',109),(1509,'紅到發(亞托敏)',3,'',NULL,'農藥進字第02981號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','嘉濱貿易有限公司',111),(1510,'紅帥(福隆納乃得)',3,'',NULL,'農藥製字第03796號',NULL,NULL,NULL,'(1) 1-(4-chlorophenyl)-3-(2,6-difluorobenzoyl)urea...7%      (2) S-methyl N-(methylcarbamoyloxy)thioacetimidate...23%  30.000 (%)',NULL,'admin','惠光股份有限公司',121),(1511,'紅運發(快得滅達樂)',3,'',NULL,'農藥製字第05443號',NULL,NULL,NULL,'(1) BIS(QUINOLIN-8-OLATO-O,N)COPPER......................48%(2) METHYL N-(METHOXYACETYL)-N-(2,6-XYLYL)-DL-ALANINATE...6%',NULL,'admin','臺聯實業股份有限公司',107),(1512,'紋定青(賓得克利)',3,'',NULL,'農藥製字第05550號',NULL,NULL,NULL,'(1) 1-(4-chlorobenzyl)-1-cyclopentyl-3-phenylurea...15% (2) (RS)-1-p-chlorophenyl-4,4-dimethyl-3-(1H-1,2,4-triazol-1- ylmethyl)pentan-3-ol...10% 25.000 (%)',NULL,'admin','惠光股份有限公司',121),(1513,'紋枯寧(殺紋寧)',3,'',NULL,'農藥製字第03717號',NULL,NULL,NULL,'5-methylisoxazole-3-ol 30.000 (%)  ',NULL,'admin','聯利農業科技股份有限公司',103),(1514,'紋枯淨(菲克利)',3,'',NULL,'農藥製字第06157號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 10.000 (%)',NULL,'admin','台灣正豐植保股份有限公司',128),(1515,'紋清(菲克利)',3,'',NULL,'農藥製字第06036號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 23.000 (%) ',NULL,'admin','好速化學股份有限公司',118),(1516,'紋炭(賓得克利)',3,'',NULL,'農藥製字第05535號',NULL,NULL,NULL,'(1) 1-(4-chlorobenzyl)-1-cyclopentyl-3-phenylurea...15% (2) (RS)-1-p-chlorophenyl-4,4-dimethyl-3-(1H-1,2,4-triazol-1- ylmethyl)pentan-3-ol...10%',NULL,'admin','國豐化學工業股份有限公司',112),(1517,'紋炭吉(賓得克利)',3,'',NULL,'農藥製字第06359號',NULL,NULL,NULL,'(1) 1-(4-chlorobenzyl)-1-cyclopentyl-3-phenylurea...15% (2) (RS)-1-p-chlorophenyl-4,4-dimethyl-3-(1H-1,2,4-triazol-1- ylmethyl)pentan-3-ol...10%',NULL,'admin','日農科技股份有限公司',105),(1518,'紋炭擊(三氟敏)',3,'',NULL,'農藥進字第02983號',NULL,NULL,NULL,' methyl (E)-methoxyimino-{(E)-α-[1-(α,α,α-trifluoro-m-tolyl)ethylideneaminooxy]-o-tolyl}acetate  50.000 (%)',NULL,'admin','瑞芳植物保護股份有限公司',115),(1519,'紋絕(菲克利)',3,'',NULL,'農藥製字第05155號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 10.000 (%)',NULL,'admin','瑞芳植物保護股份有限公司',115),(1520,'納克(加保利)',3,'',NULL,'農藥製字第02940號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 85.000 (%) ',NULL,'admin','臺灣庵原農藥股份有限公司',113),(1521,'納力農(乃力松)',3,'',NULL,'農藥製字第03170號',NULL,NULL,NULL,'1,2-DIBROMO-2,2-DICHLOROETHYL DIMETHYL PHOSPHATE  58.000 (%)',NULL,'admin','華隆化學股份有限公司',129),(1522,'納滅好(納得亞滅寧)',3,'',NULL,'農藥製字第04654號',NULL,NULL,NULL,'納乃得 12% 亞滅寧 1.5%',NULL,'admin','富農化學工業股份有限公司',132),(1523,'納薩(亞托待克利)',3,'',NULL,'農藥製字第06035號',NULL,NULL,NULL,'(1) methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate...200 g/L (2) cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1-ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether...125 g/L 325 G/L (32.5% W/V)',NULL,'admin','安旺特股份有限公司',120),(1524,'純德牌VS-34有機質營養液肥1',2,'液態有機質肥料','有機資審字第105014號',NULL,'液態有機質肥料(5-15)','肥製(質)字第0285015號','奶粉、魚精、酵母粉、海藻精、葡萄糖、糖蜜','全氮0.8% 全磷酐0.3% 全氧化鉀0.3% 有機質8.0%',NULL,'admin','陽田生物科技股份有限公司',51),(1525,'純德牌VS-34高級有機質肥料-竹級',2,'','有機資審字第107022號',NULL,'雜項堆肥(5-11)','肥製(質)字第0509016號','菇類培植廢棄包、米糠、蓖麻粕、芝麻粕、花生粕、甲殼質(蝦、蟹)、蚵殼粉','全氮3.0%全磷酐2.5%全氧化鉀1.5%有機質85.0%',NULL,'admin','田園生物科技有限公司',62),(1526,'純德牌肥夠多633',2,'','有機資審字第107014號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0509020號','芝麻粕、蓖麻粕、骨粉、花生粕、米糠、黃豆粉','全氮6.0%全磷酐3.0%全氧化鉀3.0%有機質88.0%',NULL,'admin','田園生物科技有限公司',62),(1527,'純陽掌(益達胺)',3,'',NULL,'農藥製字第05217號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%) ',NULL,'admin','臺益工業股份有限公司',39),(1528,'終結者(百克敏)',3,'',NULL,'農藥進字第03526號',NULL,NULL,NULL,' methyl N-{2-[1-(4-chlorophenyl)pyrazol-3-yloxymethyl]phenyl}(N-methoxy)carbamate  23.600 (%)',NULL,'admin','優必樂有限公司',151),(1529,'絕對旺(快得寧)',3,'',NULL,'農藥製字第03857號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 40.000 (%) ',NULL,'admin','安旺特股份有限公司',120),(1530,'絕招(快得依普同)',3,'',NULL,'農藥製字第04878號',NULL,NULL,NULL,'(1) BIS(QUINOLIN-8-OLATO-O,N)COPPER................34% (2) 3-(3,5-DICHLOROPHENYL)-N-ISOPROPYL-2,4-DIOXOIMIDAZOLIDINE-1-CARBOXAMIDE...................16.5%',NULL,'admin','嘉泰企業股份有限公司',102),(1531,'絕滅蝨(加保利)',3,'',NULL,'農藥製字第01054號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 50.000 (%)',NULL,'admin','國豐化學工業股份有限公司',112),(1532,'絕菌寶(鋅波爾多)',3,'',NULL,'農藥進字第01078號',NULL,NULL,NULL,'(1) BASIC COPPER SULFATE.....58% (CU 32%)  (2) BASIC ZINC SULFATE.......15% (ZN 8%)',NULL,'admin','台石股份有限公司',191),(1533,'絕菌王(快得寧)',3,'',NULL,'農藥製字第04422號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 80.000 (%)',NULL,'admin','嘉農企業股份有限公司',117),(1534,'絕蟲靈(因滅汀)',3,'',NULL,'農藥進字第02671號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','安旺特股份有限公司',120),(1535,'統介勇(凡殺克絕)',3,'',NULL,'農藥進字第03349號',NULL,NULL,NULL,'(1) 3-anilino-5-methyl-5-(4-phenoxyphenyl)-1,3-oxazolidine-2,4-dione...22.5% (2) 1-(2-cyano-2-methoxyiminoacetyl)-3-ethylurea...30%',NULL,'admin','嘉濱貿易有限公司',111),(1536,'統介蝨(百利普芬)',3,'',NULL,'農藥進字第03062號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 11.000 (%) ',NULL,'admin','雅飛有限公司',126),(1537,'統勇(克收欣)',3,'',NULL,'農藥製字第05314號',NULL,NULL,NULL,'methyl (E)-methoxyimino[2-(o-tolyloxymethyl)phenyl]acetate 44.200 (%) ',NULL,'admin','嘉泰企業股份有限公司',102),(1538,'統友效(百利普芬)',3,'',NULL,'農藥進字第01937號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 11.000 (%)',NULL,'admin','台灣住友化學股份有限公司',160),(1539,'統好用(亞滅培)',3,'',NULL,'農藥製字第05721號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%)',NULL,'admin','洽益化學股份有限公司',108),(1540,'統有效(百利普芬)',3,'',NULL,'農藥製字第06331號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 11.000 (%)',NULL,'admin','華夏科學農化股份有限公司',106),(1541,'統殺(陶斯松)',3,'',NULL,'農藥製字第04157號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%) ',NULL,'admin','光華化學股份有限公司',77),(1542,'統發(達滅芬)',3,'',NULL,'農藥進字第03398號',NULL,NULL,NULL,'(E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine  50.000 (%)',NULL,'admin','日農科技股份有限公司',105),(1543,'統青(菲克利)',3,'',NULL,'農藥進字第02494號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 5.000  (%) ',NULL,'admin','興農股份有限公司',85),(1544,'絲絲去(因得克)',3,'',NULL,'農藥製字第06455號',NULL,NULL,NULL,' methyl (S)-N-[7-chloro-2,3,4a,5-tetrahydro-4a-(methoxycarbonyl)indeno[1,2-e][1,3,4]oxadiazin-2-ylcarbonyl]-4’-(trifluoromethoxy)carbanilate  14.500 (%)',NULL,'admin','臺灣庵原農藥股份有限公司',113),(1545,'綜有效(百利普芬)',3,'',NULL,'農藥製字第06437號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 11.000 (%) ',NULL,'admin','功力化學工業股份有限公司',187),(1546,'綜無蟲(益達胺)',3,'',NULL,'農藥製字第06390號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%)',NULL,'admin','功力化學工業股份有限公司',187),(1547,'綠光牌綠之肥',2,'','有機資審字第107015號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0738026號','菜籽粕、蓖麻粕、米糠、麩皮、棕梠灰、肉骨粉','全氮5.0%全磷酐3.0%全氧化鉀3.0%有機質80.0%',NULL,'admin','豫豐實業有限公司',54),(1548,'綠林九號',2,'','有機資審字第101021號',NULL,'植物渣粕肥料(5-01)','肥製(質)字第0687001號','蓖麻粕、花生粕、米糠、芝麻粕','全氮4.3%全磷酐3%全氧化鉀2%有機質80%',NULL,'admin','綠林生物科技股份有限公司',34),(1549,'綠林牌好康522',2,'','有機資審字第107027號',NULL,'植物渣粕肥料(5-01)','肥製(質)字第0687033號','花生粕、菜籽粕、蓖麻粕、芝麻粕、麩皮','全氮5.0%全磷酐2.0%全氧化鉀2.0%有機質85.0%',NULL,'admin','綠林生物科技股份有限公司',34),(1550,'綠林牌好康633',2,'','有機資審字第107028號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0687034號','花生粕、菜籽粕、芝麻粕、骨粉、棕櫚灰、麩皮','全氮6.0% 全磷酐3.0% 全氧化鉀3.0% 有機質85.0%',NULL,'admin','綠林生物科技股份有限公司',34),(1551,'綠林牌綠林99合肥',2,'','有機資審字第103020號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0687018號','花生粕、菜仔粕、大豆粕、芝麻粕、骨粉、草木灰、麥麩','全氮6%全磷酐3%全氧化鉀3%有機質80%',NULL,'admin','綠林生物科技股份有限公司',34),(1552,'綠林牌芝麻粕',2,'','有機資審字第106019號',NULL,'植物渣粕肥料(5-01)','肥製(質)字第0687030號','芝麻粕','全氮7.0%全磷酐3.4%全氧化鉀1.3%有機質85.0%',NULL,'admin','綠林生物科技股份有限公司',34),(1553,'綠油油窄域油(礦物油)',3,'','有機資審字第106017號','農藥進字第02570號',NULL,NULL,NULL,'礦物油Aliphatichydrocarbons99%；乳化劑1%',NULL,'admin','玉田地有限公司',82),(1554,'綠滅菌(快得保淨)',3,'',NULL,'農藥製字第04235號',NULL,NULL,NULL,'(1) dimethyl 4,4’-(o-phenylene)bis(3-thioallophanate)...35%(2) bis(quinolin-8-olato-O,N)copper...40%',NULL,'admin','瑞芳植物保護股份有限公司',115),(1555,'網春豐(安美速)',3,'',NULL,'農藥進字第02747號',NULL,NULL,NULL,'3-(3-bromo-6-fluoro-2-methylindol-1-ylsulfonyl)-N,N-dimethyl-1H-1,2,4-triazole-1-sulfonamide  17.700 (%)',NULL,'admin','台灣日產化工股份有限公司',104),(1556,'線虫寶(依得利)',3,'',NULL,'農藥進字第02023號',NULL,NULL,NULL,' ethyl 4-methylthio-m-tolyl isopropylphosphoramidate  40.000 (%)',NULL,'admin','東鋒股份有限公司',154),(1557,'線虫靈(依得利)',3,'',NULL,'農藥製字第05911號',NULL,NULL,NULL,' ethyl 4-methylthio-m-tolyl isopropylphosphoramidate  10.000 (%)',NULL,'admin','正農化學股份有限公司',130),(1558,'線蟲去(滅線蟲)',3,'',NULL,'農藥進字第00854號',NULL,NULL,NULL,' bis(2-chloro-1-methylethyl) ether  30.000 (%)',NULL,'admin','青山貿易有限公司',147),(1559,'練丹田(加保扶)',3,'',NULL,'農藥製字第06281號',NULL,NULL,NULL,'2,3-dihydro-2,2-dimethylbenzofuran-7-yl methylcarbamate  3.000 (%)',NULL,'admin','華夏科學農化股份有限公司',106),(1560,'練武功(益達胺)',3,'',NULL,'農藥製字第05781號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 18.200 (%)',NULL,'admin','正農化學股份有限公司',130),(1561,'總ㄟ好(百克敏)',3,'',NULL,'農藥進字第03476號',NULL,NULL,NULL,' methyl N-{2-[1-(4-chlorophenyl)pyrazol-3-yloxymethyl]phenyl}(N-methoxy)carbamate  23.600 (%)',NULL,'admin','高事達農化有限公司',155),(1562,'總司令(百克敏)',3,'',NULL,'農藥進字第02268號',NULL,NULL,NULL,' methyl N-{2-[1-(4-chlorophenyl)pyrazol-3-yloxymethyl]phenyl}(N-methoxy)carbamate  23.600 (%)',NULL,'admin','台灣巴斯夫股份有限公司',123),(1563,'總寧精(錳乃浦)',3,'',NULL,'農藥製字第04754號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  33.000 (%)',NULL,'admin','利台化學工業股份有限公司',116),(1564,'總抗病(免得克敏)',3,'',NULL,'農藥進字第03304號',NULL,NULL,NULL,'(1) zinc ammoniate ethylenebis (dithiocarbamate)-poly(ethylenethiuram disulfide)...55%(2) methylN-{2-[1-(4-chlorophenyl)pyrazol-3-yloxymethyl]phenyl}(N-methoxy)carbamate...5%',NULL,'admin','台灣巴斯夫股份有限公司',123),(1565,'總掌管(百克敏)',3,'',NULL,'農藥製字第06417號',NULL,NULL,NULL,' methyl N-{2-[1-(4-chlorophenyl)pyrazol-3-yloxymethyl]phenyl}(N-methoxy)carbamate  23.600 (%)',NULL,'admin','嘉泰企業股份有限公司',102),(1566,'總滅靈(納乃得)',3,'',NULL,'農藥製字第03155號',NULL,NULL,NULL,' S-methyl N-(methylcarbamoyloxy)thioacetimidate  40.000 (%)',NULL,'admin','富農化學工業股份有限公司',132),(1567,'總無蟲(因滅汀)',3,'',NULL,'農藥製字第06034號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','台農三和化工股份有限公司',119),(1568,'總發(達滅克敏)',3,'',NULL,'農藥進字第02445號',NULL,NULL,NULL,'(1) methyl N-{2-[1-(4-chlorophenyl)-1H-pyrazol-3-yloxymethyl]phenyl}(N-methoxy)carbamate...6.7% (2) (E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine...12.0%',NULL,'admin','台灣巴斯夫股份有限公司',123),(1569,'總素靈(百克敏)',3,'',NULL,'農藥製字第06536號',NULL,NULL,NULL,' methyl N-{2-[1-(4-chlorophenyl)pyrazol-3-yloxymethyl]phenyl}(N-methoxy)carbamate  23.600 (%)',NULL,'admin','國豐化學工業股份有限公司',112),(1570,'總除(百克敏)',3,'',NULL,'農藥進字第03223號',NULL,NULL,NULL,' methyl N-{2-[1-(4-chlorophenyl)pyrazol-3-yloxymethyl]phenyl}(N-methoxy)carbamate  23.600 (%)',NULL,'admin','朝暘生化開發有限公司',171),(1571,'羅力(硫敵克)',3,'',NULL,'農藥製字第05122號',NULL,NULL,NULL,'3,7,9,13-tetramethyl-5,11-dioxa-2,8,14-trithia-4,7,9,12-tetra-azapentadeca-3,12-diene-6,10-dione 34.000 (%)',NULL,'admin','興農股份有限公司',85),(1572,'羅蔓讚(賽滅淨)',3,'',NULL,'農藥進字第03158號',NULL,NULL,NULL,'N-cyclopropyl-1,3,5-triazine-2,4,6-triamine 75.000 (%) ',NULL,'admin','大成化學工業股份有限公司',127),(1573,'美升(錳乃浦)',3,'',NULL,'農藥進字第00678號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','德方有限公司',175),(1574,'美吉克(陶斯松)',3,'',NULL,'農藥製字第04670號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 2.500  (%)',NULL,'admin','臺聯實業股份有限公司',107),(1575,'美國-雙倍贊(蘇力菌)',3,'',NULL,'農藥進字第01492號',NULL,NULL,NULL,' Bacillus thuringiensis subspecies aizawai strain gc-91 solids, spores and lepidopteran active toxins  50.000 (%)',NULL,'admin','優必樂有限公司',151),(1576,'美多寧(加保利)',3,'',NULL,'農藥製字第04601號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 50.000 (%)',NULL,'admin','世大農化工廠股份有限公司	',114),(1577,'美多綠酵素有機質肥料',2,'','有機資審字第107030號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0738027號','鳳梨發酵液、肉骨粉、菜籽粕、黃豆粉、蓖麻粕、米糠、棕梠灰','全氮6.0%全磷酐3.0%全氧化鉀2.5%有機質80.0%',NULL,'admin','豫豐實業有限公司',54),(1578,'美果丹(貝芬菲克利)',3,'',NULL,'農藥製字第06046號',NULL,NULL,NULL,'(1) METHYL BENZIMIDAZOL-2-YLCARBAMATE..........24.5% (2) (RS)-2-(2,4-DICHLOROPHENYL)-1-(1H-1,2,4-TRIAZOL-1-YL)HEXAN-2-OL.........10%',NULL,'admin','安旺特股份有限公司',120),(1579,'美果寶(錳乃浦)',3,'',NULL,'農藥進字第00632號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','合林企業有限公司',166),(1580,'美果松 1%(馬拉松)',3,'',NULL,'農藥製字第03117號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 1.000  (%) ',NULL,'admin','興農股份有限公司',85),(1581,'美果松 25%(馬拉松)',3,'',NULL,'農藥製字第00283號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 25.000 (%)   ',NULL,'admin','興農股份有限公司',85),(1582,'美果松 50%(馬拉松)',3,'',NULL,'農藥製字第00284號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 50.000 (%)   ',NULL,'admin','興農股份有限公司',85),(1583,'美果松 91%(馬拉松)',3,'',NULL,'農藥製字第02573號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 91.000 (%) ',NULL,'admin','興農股份有限公司',85),(1584,'美果油(礦物油)',3,'',NULL,'農藥製字第00549號',NULL,NULL,NULL,'ALIPHATIC HYDROCARBONS 95.000 (%) ',NULL,'admin','興農股份有限公司',85),(1585,'美果精(依普同)',3,'',NULL,'農藥製字第06489號',NULL,NULL,NULL,'3-(3,5-dichlorophenyl)-N-isopropyl-2,4-dioxoimidazolidine-1-carboxamide  23.700 (%)',NULL,'admin','大勝化學工業股份有限公司',110),(1586,'美果銅(快得寧)',3,'',NULL,'農藥製字第02338號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 40.000 (%)',NULL,'admin','興農股份有限公司',85),(1587,'美果靈(四氯保淨)',3,'',NULL,'農藥製字第03005號',NULL,NULL,NULL,'(1) dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate)...20% (2) tetrachloroisophthalonitrile...50%',NULL,'admin','大勝化學工業股份有限公司',110),(1588,'美樂多(賽福保淨)',3,'',NULL,'農藥製字第04336號',NULL,NULL,NULL,'(1) (E)-4-chloro-α,α,α-trifluoro-N-(1-imidazol-1-yl-2-propoxyethylidene)-o-toluidine...15% (2) dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate)...45%',NULL,'admin','臺灣庵原農藥股份有限公司',113),(1589,'美樂果(依普同)',3,'',NULL,'農藥製字第04277號',NULL,NULL,NULL,'3-(3,5-dichlorophenyl)-N-isopropyl-2,4-dioxoimidazolidine-1-carboxamide  50.000 (%)',NULL,'admin','嘉泰企業股份有限公司',102),(1590,'美生─45(錳乃浦)',3,'',NULL,'農藥進字第02640號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','朝暘生化開發有限公司',171),(1591,'美舒果(大滅松)',3,'',NULL,'農藥製字第04772號',NULL,NULL,NULL,' O, O-dimethyl-S-methylcarbamoylmethyl phosphorodithioate  44.000 (%)',NULL,'admin','臺聯實業股份有限公司',107),(1592,'美麗果(依普同)',3,'',NULL,'農藥進字第02072號',NULL,NULL,NULL,'3-(3,5-dichlorophenyl)-N-isopropyl-2,4-dioxoimidazolidine-1-carboxamide  50.000 (%)',NULL,'admin','松樹國際有限公司',137),(1593,'翔勇(達滅芬)',3,'',NULL,'農藥進字第02609號',NULL,NULL,NULL,'(E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine  50.000 (%)',NULL,'admin','嘉農企業股份有限公司',117),(1594,'翔鹿牌好栽培',2,'','有機資審字第104004號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0831007號','花生仁殼粕、椰子粕、米糠、菜子粕、芝麻粕、蓖麻粕','全氮5.2%全磷酐3.0%全氧化鉀2.0%有機質70%',NULL,'admin','翔鹿股份有限公司',42),(1595,'翔鹿牌好豐富',2,'','有機資審字第108023號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0831017號','菜子粕、蓖麻粕、椰子粕、芝麻粕、苦茶粕、泥炭、草木灰','全氮4.5%全磷酐2.5%全氧化鉀7.5%有機質75.0%',NULL,'admin','翔鹿股份有限公司',42),(1596,'老主固(四氯異苯腈)',3,'',NULL,'農藥製字第05243號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  40.000 (%)',NULL,'admin','台灣日產化工股份有限公司',104),(1597,'老江湖(克凡派)',3,'',NULL,'農藥製字第06557號',NULL,NULL,NULL,'4-bromo-2-(4-chlorophenyl)-1-ethoxymethyl-5-trifluoromethylpyrrole-3-carbonitrile 10.000 (%)',NULL,'admin','洽益化學股份有限公司',108),(1598,'老貴諾(快得寧)',3,'',NULL,'農藥製字第03945號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 40.000 (%)',NULL,'admin','世大農化工廠股份有限公司	',114),(1599,'耐久香(克蠅香)',3,'',NULL,'農藥製字第00785號',NULL,NULL,NULL,'(1) 4-(P-ACETOXYPHENYL)-2-BUTANONE...42.7%                   (2) METHYL EUGENOL...42.3% 85.000 (%)                ',NULL,'admin','聯利農業科技股份有限公司',103),(1600,'联联興(腈硫醌銅)',3,'',NULL,'農藥製字第05786號',NULL,NULL,NULL,'(1) 5,10-dihydro-5,10-dioxonaphtho[2,3-b]-1,4-dithiine-2,3-dicarbonitrile...13% (2) dicopper chloride trihydroxide...42% (CU25%)',NULL,'admin','臺聯實業股份有限公司',107),(1601,'聖鬥士(達特南)',3,'',NULL,'農藥製字第06588號',NULL,NULL,NULL,'(RS)-1-methyl-2-nitro-3-(tetrahydro-3-furylmethyl)guanidine 20.000 (%) ',NULL,'admin','興農股份有限公司',85),(1602,'聯保淨(甲基多保淨)',3,'',NULL,'農藥製字第03655號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 70.000 (%) ',NULL,'admin','聯利農業科技股份有限公司',103),(1603,'聯克(丁基加保扶)',3,'',NULL,'農藥製字第05344號',NULL,NULL,NULL,'2,3-dihydro-2,2-dimethylbenzofuran-7-yl (dibutylaminothio) methylcarbamate  3.000 (%)',NULL,'admin','聯利農業科技股份有限公司',103),(1604,'聯利大生(錳乃浦)',3,'',NULL,'農藥製字第03623號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','聯利農業科技股份有限公司',103),(1605,'聯功(賽洛寧)',3,'',NULL,'農藥製字第05198號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.800  (%) ',NULL,'admin','聯利農業科技股份有限公司',103),(1606,'聯喜(第滅寧)',3,'',NULL,'農藥製字第01162號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%)',NULL,'admin','聯利農業科技股份有限公司',103),(1607,'聯喜冬精(第滅寧)',3,'',NULL,'農藥製字第05147號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.400  (%)',NULL,'admin','聯利農業科技股份有限公司',103),(1608,'聯安油(礦物油)',3,'',NULL,'農藥製字第01165號',NULL,NULL,NULL,'ALIPHATIC HYDROCARBONS 95.000 (%)',NULL,'admin','聯利農業科技股份有限公司',103),(1609,'聯將軍(亞滅培)',3,'',NULL,'農藥製字第05604號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%)',NULL,'admin','聯利農業科技股份有限公司',103),(1610,'聯掌(益達胺)',3,'',NULL,'農藥製字第05237號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 18.200 (%)  ',NULL,'admin','聯利農業科技股份有限公司',103),(1611,'聯棒(快得寧)',3,'',NULL,'農藥製字第04272號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 33.500 (%)',NULL,'admin','聯利農業科技股份有限公司',103),(1612,'聯真功(賽洛寧)',3,'',NULL,'農藥製字第05349號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 5.000  (%) ',NULL,'admin','聯利農業科技股份有限公司',103),(1613,'聯綜(百利普芬)',3,'',NULL,'農藥製字第05945號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 11.000 (%) ',NULL,'admin','聯利農業科技股份有限公司',103),(1614,'聯速利(菲克利)',3,'',NULL,'農藥製字第05159號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 10.000 (%) ',NULL,'admin','聯利農業科技股份有限公司',103),(1615,'聯霸(得芬諾)',3,'',NULL,'農藥製字第05479號',NULL,NULL,NULL,'N-tert-butyl-N’-(4-ethylbenzoyl)-3,5-dimethylbenzohydrazide  19.700 (%)',NULL,'admin','聯利農業科技股份有限公司',103),(1616,'聯順(陶斯寧)',3,'',NULL,'農藥製字第05422號',NULL,NULL,NULL,'(1) O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate…45.45% (2) (RS)-α-cyano-3-phenoxybenzyl (1RS)-cis-trans-3-(2,2-dichlorovinyl)-2,2-dimethylcyclopropanecarboxylate…4.55%',NULL,'admin','聯利農業科技股份有限公司',103),(1617,'聯馬精(馬拉松)',3,'',NULL,'農藥製字第00783號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 50.000 (%) ',NULL,'admin','聯利農業科技股份有限公司',103),(1618,'脫白粉(平克座)',3,'',NULL,'農藥製字第04311號',NULL,NULL,NULL,'1-(2,4-dichloro-β-propylphenethyl)-1H-1,2,4-triazole 10.500 (%)',NULL,'admin','富農化學工業股份有限公司',132),(1619,'脫線蟲(滅線蟲)',3,'',NULL,'農藥製字第04350號',NULL,NULL,NULL,' bis(2-chloro-1-methylethyl) ether  80.000 (%)',NULL,'admin','利台化學工業股份有限公司',116),(1620,'自立全家福(錳乃浦)',3,'',NULL,'農藥製字第03086號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric)  37.000 (%)',NULL,'admin','日農科技股份有限公司',105),(1621,'自立大喜精(第滅寧)',3,'',NULL,'農藥製字第05740號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.400  (%) ',NULL,'admin','日農科技股份有限公司',105),(1622,'自立果寶精(氫氧化銅)',3,'',NULL,'農藥製字第01770號',NULL,NULL,NULL,' CUPRIC HYDROXIDE  37.500 (%)',NULL,'admin','日農科技股份有限公司',105),(1623,'自立果農靈(邁克尼)',3,'',NULL,'農藥製字第05465號',NULL,NULL,NULL,'2-p-chlorophenyl-2-(1H-1,2,4-triazol-1-ylmethyl)hexanenitrile 13.400 (%) ',NULL,'admin','日農科技股份有限公司',105),(1624,'自立雙富(加保扶)',3,'',NULL,'農藥製字第04843號',NULL,NULL,NULL,'2,3-dihydro-2,2-dimethylbenzofuran-7-yl methylcarbamate  3.000 (%)',NULL,'admin','日農科技股份有限公司',105),(1625,'自耕農－大生(錳乃浦)',3,'',NULL,'農藥進字第02932號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','國豐化學工業股份有限公司',112),(1626,'至尊(賽滅淨)',3,'',NULL,'農藥製字第04658號',NULL,NULL,NULL,'N-cyclopropyl-1,3,5-triazine-2,4,6-triamine 8.900  (%)',NULL,'admin','世大農化工廠股份有限公司	',114),(1627,'臺喜精王(第滅寧)',3,'',NULL,'農藥製字第04110號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%)',NULL,'admin','臺益工業股份有限公司',39),(1628,'臺益熊戰(阿巴汀)',3,'',NULL,'農藥製字第05589號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%) ',NULL,'admin','臺益工業股份有限公司',39),(1629,'臺聯(氟芬隆)',3,'',NULL,'農藥製字第05698號',NULL,NULL,NULL,'1-[4-(2-chloro-α,α,α-trifluoro-p-tolyloxy)-2-fluorophenyl]-3-(2,6-difluorobenzoyl)urea  9.600 (%)',NULL,'admin','臺聯實業股份有限公司',107),(1630,'臺聯丹®(加保扶)',3,'',NULL,'農藥製字第05420號',NULL,NULL,NULL,'2,3-dihydro-2,2-dimethylbenzofuran-7-yl methylcarbamate  3.000 (%)',NULL,'admin','臺聯實業股份有限公司',107),(1631,'臺聯馬拉松(馬拉松)',3,'',NULL,'農藥製字第04725號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 50.000 (%)    ',NULL,'admin','臺聯實業股份有限公司',107),(1632,'興旺(亞托待克利)',3,'',NULL,'農藥製字第06545號',NULL,NULL,NULL,'(1) methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate...200 g/L (2) cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1-ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether...125 g/L',NULL,'admin','聯利農業科技股份有限公司',103),(1633,'興時本(陶斯松)',3,'',NULL,'農藥製字第05002號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 50.000 (%)',NULL,'admin','興農股份有限公司',85),(1634,'興穩煞(賽滅淨)',3,'',NULL,'農藥製字第06418號',NULL,NULL,NULL,'N-cyclopropyl-1,3,5-triazine-2,4,6-triamine 75.000 (%)',NULL,'admin','興農股份有限公司',85),(1635,'興紗文 5%(加保利)',3,'',NULL,'農藥製字第02984號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 5.000  (%) ',NULL,'admin','興農股份有限公司',85),(1636,'興紗文 85%(加保利)',3,'',NULL,'農藥製字第03675號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 85.000 (%)  ',NULL,'admin','興農股份有限公司',85),(1637,'興紗福(加保利)',3,'',NULL,'農藥製字第01603號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 39.500 (%) ',NULL,'admin','興農股份有限公司',85),(1638,'興農丹(加保扶)',3,'',NULL,'農藥製字第01599號',NULL,NULL,NULL,'2,3-dihydro-2,2-dimethylbenzofuran-7-yl methylcarbamate  3.000 (%)',NULL,'admin','興農股份有限公司',85),(1639,'興農地菌克(依得利)',3,'',NULL,'農藥製字第04974號',NULL,NULL,NULL,' ethyl 3-trichloromethyl-1,2,4-thiadiazol-5-yl ether  25.000 (%)',NULL,'admin','興農股份有限公司',85),(1640,'興農寶(枯草桿菌)',3,'','有機資審字第107042號','農藥製字第05277號',NULL,NULL,NULL,'枯草桿菌BacillussubtilisY1336ViablesporesofBacillussubtilisY133650%1×10^9CFU/g以上；其他成分50%',NULL,'admin','興農股份有限公司',85),(1641,'興農星(護矽得)',3,'',NULL,'農藥製字第05238號',NULL,NULL,NULL,'bis(4-fluorophenyl)(methyl)(1H-1,2,4-triazol-1-ylmethyl)silane 37.000 (%) ',NULL,'admin','興農股份有限公司',85),(1642,'興農樂無蟲(賽洛寧)',3,'',NULL,'農藥製字第05597號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 5.000  (%)   ',NULL,'admin','興農股份有限公司',85),(1643,'興農樂菌清(達滅芬)',3,'',NULL,'農藥製字第06544號',NULL,NULL,NULL,'(E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine  50.000 (%)',NULL,'admin','興農股份有限公司',85),(1644,'興農牌新樂園2號',2,'','有機資審字第106018號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0687028號','花生粕、芝麻粕、麩皮、骨粉及風化褐煤','全氮5.1%全磷酐2.1%全氧化鉀2.1%有機質80.0%腐植酸15%',NULL,'admin','綠林生物科技股份有限公司',34),(1645,'興農生(錳乃浦)',3,'',NULL,'農藥製字第04872號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  33.000 (%)',NULL,'admin','興農股份有限公司',85),(1646,'興農生–４５(鋅錳乃浦)',3,'',NULL,'農藥製字第02452號',NULL,NULL,NULL,'manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','興農股份有限公司',85),(1647,'興農白力強(三泰芬)',3,'',NULL,'農藥製字第04430號',NULL,NULL,NULL,'1-(4-chlorophenoxy)-3,3-dimethyl-1-(1H-1,2,4-triazol-1-yl)butan-2-one 25.000 (%)',NULL,'admin','興農股份有限公司',85),(1648,'興農農特寧(納乃得)',3,'',NULL,'農藥製字第00543號',NULL,NULL,NULL,'S-methyl N-(methylcarbamoyloxy)thioacetimidate  40.000 (%)',NULL,'admin','興農股份有限公司',85),(1649,'興農露露精(四氯異苯腈)',3,'',NULL,'農藥製字第04953號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  40.000 (%)',NULL,'admin','興農股份有限公司',85),(1650,'良農苦楝粕',2,'進口肥料','有機資審字第105008號',NULL,'植物渣粕肥料(5-01)','肥進(質)字第0784001號','苦楝粕','全氮5.0%全磷酐1.5%全氧化鉀2.0%有機質90.0%',NULL,'admin','良農現代化農業科技股份有限公司',50),(1651,'良農葵克立',3,'','有機資審字第107026號','植保製字第00041號',NULL,NULL,NULL,'植物油類(葵花油)、甘油椰油酸酯',NULL,'admin','良農現代化農業科技股份有限公司',50),(1652,'艾滅丁(因滅汀)',3,'',NULL,'農藥製字第05477號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','臺灣庵原農藥股份有限公司',113),(1653,'花木蘭(快得保淨)',3,'',NULL,'農藥製字第04828號',NULL,NULL,NULL,'(1) dimethyl 4,4’-(o-phenylene)bis(3-thioallophanate)...35%(2) bis(quinolin-8-olato-O,N)copper...40%',NULL,'admin','臺聯實業股份有限公司',107),(1654,'花田綠地花果蔬菜通用培養土',2,'','有機資審字第104001號',NULL,'有機質栽培介質(7-03)','肥製(輔)字第0776029號','泥炭、椰殼、石灰、珍珠石','全氮1.0%全磷酐0.2%全氧化鉀0.2%有機質90%',NULL,'admin','大益農業科技股份有限公司',43),(1655,'苹果多保淨(甲基多保淨)',3,'',NULL,'農藥進字第01634號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 70.000 (%)   ',NULL,'admin','松樹國際有限公司',137),(1656,'莫粉生(蟎離丹)',3,'',NULL,'農藥製字第00713號',NULL,NULL,NULL,'S,S-(6-METHYLQUINOXALINE-2,3-DIYL) DITHIOCARBONATE 25.000 (%) ',NULL,'admin','興農股份有限公司',85),(1657,'菌全滅(貝芬菲克利)',3,'',NULL,'農藥製字第06451號',NULL,NULL,NULL,'(1) METHYL BENZIMIDAZOL-2-YLCARBAMATE..........24.5% (2) (RS)-2-(2,4-DICHLOROPHENYL)-1-(1H-1,2,4-TRIAZOL-1-YL)HEXAN-2-OL.........10%',NULL,'admin','台農三和化工股份有限公司',119),(1658,'菌全除(待克利)',3,'',NULL,'農藥製字第05981號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%)',NULL,'admin','台農三和化工股份有限公司',119),(1659,'菌嘜來(腈硫醌)',3,'',NULL,'農藥製字第05102號',NULL,NULL,NULL,' 5,10-dihydro-5,10-dioxonaphtho[2,3-b]-1,4-dithiine-2,3-dicarbonitrile  22.700 (%)',NULL,'admin','嘉泰企業股份有限公司',102),(1660,'菌好滅(貝芬菲克利)',3,'',NULL,'農藥製字第05490號',NULL,NULL,NULL,'(1) METHYL BENZIMIDAZOL-2-YLCARBAMATE..........24.5% (2) (RS)-2-(2,4-DICHLOROPHENYL)-1-(1H-1,2,4-TRIAZOL-1-YL)HEXAN-2-OL.........10%',NULL,'admin','洽益化學股份有限公司',108),(1661,'菌敵-M(鋅錳滅達樂)',3,'',NULL,'農藥進字第00191號',NULL,NULL,NULL,'(1) manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt...65% (2) methyl N-phenylacetyl-N-2,6-xylyl-D-alaninate...4%',NULL,'admin','台灣龍燈股份有限公司',152),(1662,'菌滅淨(甲基多保淨)',3,'',NULL,'農藥製字第06327號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 70.000 (%)',NULL,'admin','台農三和化工股份有限公司',119),(1663,'菌瑞去(待克利)',3,'',NULL,'農藥進字第02581號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 250 G/L (25% W/V)',NULL,'admin','台灣先正達股份有限公司',144),(1664,'菌立清(依普同)',3,'',NULL,'農藥進字第02915號',NULL,NULL,NULL,'3-(3,5-dichlorophenyl)-N-isopropyl-2,4-dioxoimidazolidine-1-carboxamide  23.700 (%)',NULL,'admin','萬得發有限公司',125),(1665,'菌總清(三泰芬)',3,'',NULL,'農藥製字第05587號',NULL,NULL,NULL,'1-(4-chlorophenoxy)-3,3-dimethyl-1-(1H-1,2,4-triazol-1-yl)butan-2-one 25.000 (%)  ',NULL,'admin','臺聯實業股份有限公司',107),(1666,'菌藥精(甲基多保淨)',3,'',NULL,'農藥製字第04941號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 40.000 (%) ',NULL,'admin','臺益工業股份有限公司',39),(1667,'菜利農(賽達松)',3,'',NULL,'農藥製字第01227號',NULL,NULL,NULL,' S-α-ethoxycarbonylbenzyl O,O-dimethyl phosphorodithioate  50.000 (%)',NULL,'admin','國豐化學工業股份有限公司',112),(1668,'菜友(賽達松)',3,'',NULL,'農藥製字第03244號',NULL,NULL,NULL,' S-α-ethoxycarbonylbenzyl O,O-dimethyl phosphorodithioate  50.000 (%)',NULL,'admin','日農科技股份有限公司',105),(1669,'菜嘸蟲(賽達松)',3,'',NULL,'農藥製字第03352號',NULL,NULL,NULL,' S-α-ethoxycarbonylbenzyl O,O-dimethyl phosphorodithioate  50.000 (%)',NULL,'admin','瑞芳植物保護股份有限公司',115),(1670,'菜寶(蘇力菌)',3,'',NULL,'農藥製字第00268號',NULL,NULL,NULL,' VIABLE SPORES OF BACILLUS THURINGIENSIS  3.000 (%)',NULL,'admin','中華民國農會附設各級農會農化廠',131),(1671,'菜蟲淨(因滅汀)',3,'',NULL,'農藥製字第05760號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','世大農化工廠股份有限公司	',114),(1672,'菜蟲精(賽達松)',3,'',NULL,'農藥製字第02482號',NULL,NULL,NULL,' S-α-ethoxycarbonylbenzyl O,O-dimethyl phosphorodithioate  50.000 (%)',NULL,'admin','洽益化學股份有限公司',108),(1673,'菜蟲離(因滅汀)',3,'',NULL,'農藥製字第05496號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','立農化學股份有限公司',143),(1674,'華夏松(大滅松)',3,'',NULL,'農藥製字第03710號',NULL,NULL,NULL,' O, O-dimethyl-S-methylcarbamoylmethyl phosphorodithioate  44.000 (%)',NULL,'admin','華夏科學農化股份有限公司',106),(1675,'菲你不可(菲克利)',3,'',NULL,'農藥製字第06475號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 23.000 (%)',NULL,'admin','國豐化學工業股份有限公司',112),(1676,'菲來發(菲克利)',3,'',NULL,'農藥製字第06445號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 10.000 (%)',NULL,'admin','國豐化學工業股份有限公司',112),(1677,'菲哥(菲克利)',3,'',NULL,'農藥製字第04932號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 10.000 (%) ',NULL,'admin','臺益工業股份有限公司',39),(1678,'菲常好(菲克利)',3,'',NULL,'農藥製字第04946號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 23.000 (%)',NULL,'admin','嘉泰企業股份有限公司',102),(1679,'菲常旺(菲克利)',3,'',NULL,'農藥製字第05713號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 23.000 (%)',NULL,'admin','安旺特股份有限公司',120),(1680,'菲特利(菲克利)',3,'',NULL,'農藥製字第05227號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 5.000  (%) ',NULL,'admin','臺灣庵原農藥股份有限公司',113),(1681,'萬事欣(克收欣)',3,'',NULL,'農藥進字第02496號',NULL,NULL,NULL,' methyl (E)-methoxyimino[2-(o-tolyloxymethyl)phenyl]acetate  50.000 (%)',NULL,'admin','萬得發有限公司',125),(1682,'萬事興(菲克利)',3,'',NULL,'農藥製字第06202號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 23.000 (%)',NULL,'admin','瑞芳植物保護股份有限公司',115),(1683,'萬佳多 20% (福多寧)',3,'',NULL,'農藥進字第01081號',NULL,NULL,NULL,' α-α-α-trifluoro-3’-isopropoxy-o-toluanilide  20.000 (%)',NULL,'admin','日佳農葯股份有限公司',178),(1684,'萬佳多 50% (福多寧)',3,'',NULL,'農藥進字第00255號',NULL,NULL,NULL,' α-α-α-trifluoro-3’-isopropoxy-o-toluanilide  50.000 (%)',NULL,'admin','日佳農葯股份有限公司',178),(1685,'萬克殺(納乃得)',3,'',NULL,'農藥製字第00177號',NULL,NULL,NULL,' S-methyl N-(methylcarbamoyloxy)thioacetimidate  40.000 (%)',NULL,'admin','日農科技股份有限公司',105),(1686,'萬克蝨(加保利)',3,'',NULL,'農藥製字第02909號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 85.000 (%) ',NULL,'admin','嘉泰企業股份有限公司',102),(1687,'萬冬紅(腈硫醌)',3,'',NULL,'農藥進字第03103號',NULL,NULL,NULL,'5,10-dihydro-5,10-dioxonaphtho[2,3-b]-1,4-dithiine-2,3-dicarbonitrile 70.000 (%)   ',NULL,'admin','嘉濱貿易有限公司',111),(1688,'萬剋靈(硫敵克)',3,'',NULL,'農藥進字第03542號',NULL,NULL,NULL,'3,7,9,13-tetramethyl-5,11-dioxa-2,8,14-trithia-4,7,9,12-tetra-azapentadeca-3,12-diene-6,10-dione 75.000 (%) ',NULL,'admin','日農科技股份有限公司',105),(1689,'萬喜精(菲克利)',3,'',NULL,'農藥製字第05281號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 5.000  (%)',NULL,'admin','瑞芳植物保護股份有限公司',115),(1690,'萬威(賽普護汰寧)',3,'',NULL,'農藥進字第03167號',NULL,NULL,NULL,'(1) 4-cyclopropyl-6-methyl-N-phenylpyrimidin-2-amine...37.5%(2) 4-(2,2-difluoro-1,3-benzodioxol-4-yl)pyrrole-3-carbonitrile...25% 62.500 (%)',NULL,'admin','萬得發有限公司',125),(1691,'萬家欣(克收欣)',3,'',NULL,'農藥進字第02562號',NULL,NULL,NULL,' methyl (E)-methoxyimino[2-(o-tolyloxymethyl)phenyl]acetate  44.200 (%)',NULL,'admin','萬得發有限公司',125),(1692,'萬寧粉(納乃得)',3,'',NULL,'農藥製字第06194號',NULL,NULL,NULL,' S-methyl N-(methylcarbamoyloxy)thioacetimidate  40.000 (%)',NULL,'admin','光華化學股份有限公司',77),(1693,'萬尅靈(四氯異苯腈)',3,'',NULL,'農藥製字第01681號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  75.000 (%)',NULL,'admin','大勝化學工業股份有限公司',110),(1694,'萬市通(亞托待克利)',3,'',NULL,'農藥進字第03434號',NULL,NULL,NULL,'(1) methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate...200 g/L (2) cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1-ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether...125 g/L 325 G/L (32.5% W/V) ',NULL,'admin','嘉濱貿易有限公司',111),(1695,'萬年青 33.5% (快得寧)',3,'',NULL,'農藥製字第01896號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 33.500 (%)',NULL,'admin','惠光股份有限公司',121),(1696,'萬年青 40%(快得寧)',3,'',NULL,'農藥製字第01897號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 40.000 (%)',NULL,'admin','惠光股份有限公司',121),(1697,'萬強(毆殺滅)',3,'',NULL,'農藥製字第05230號',NULL,NULL,NULL,' N,N-dimethyl-2-methylcarbamoyloxyimino-2-(methylthio)acetamide  10.000 (%)',NULL,'admin','台灣杜邦農業科學股份有限公司',161),(1698,'萬強-進(毆殺滅)',3,'',NULL,'農藥進字第02163號',NULL,NULL,NULL,' N,N-dimethyl-2-methylcarbamoyloxyimino-2-(methylthio)acetamide  5.000 (%)',NULL,'admin','台灣杜邦農業科學股份有限公司',161),(1699,'萬得丁(可尼丁)',3,'',NULL,'農藥進字第03147號',NULL,NULL,NULL,'(E)-1-(2-chloro-1,3-thiazol-5-ylmethyl)-3-methyl-2- nitroguanidine 16.000 (%) ',NULL,'admin','萬得發有限公司',125),(1700,'萬得丁-粒(可尼丁)',3,'',NULL,'農藥進字第03173號',NULL,NULL,NULL,'(E)-1-(2-chloro-1,3-thiazol-5-ylmethyl)-3-methyl-2- nitroguanidine 0.500  (%) ',NULL,'admin','萬得發有限公司',125),(1701,'萬得克(得克利)',3,'',NULL,'農藥進字第02986號',NULL,NULL,NULL,'(RS)-1-p-chlorophenyl-4,4-dimethyl-3-(1H-1,2,4-triazol-1- ylmethyl)pentan-3-ol 25.900 (%) ',NULL,'admin','萬得發有限公司',125),(1702,'萬得寧(快得寧)',3,'',NULL,'農藥製字第02427號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 40.000 (%) ',NULL,'admin','光華化學股份有限公司',77),(1703,'萬得生 33%(錳乃浦)',3,'',NULL,'農藥進字第02621號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  33.000 (%)',NULL,'admin','萬得發有限公司',125),(1704,'萬得生 80%(錳乃浦)',3,'',NULL,'農藥進字第02843號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','萬得發有限公司',125),(1705,'萬果好–４５(錳乃浦)',3,'',NULL,'農藥製字第02917號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','東和化學企業股份有限公司',109),(1706,'萬果生(錳乃浦)',3,'',NULL,'農藥製字第03257號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','日農科技股份有限公司',105),(1707,'萬果福(大滅松)',3,'',NULL,'農藥製字第03683號',NULL,NULL,NULL,' O, O-dimethyl-S-methylcarbamoylmethyl phosphorodithioate  44.000 (%)',NULL,'admin','日農科技股份有限公司',105),(1708,'萬枝春(快得寧)',3,'',NULL,'農藥製字第03514號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 33.500 (%)',NULL,'admin','好速化學股份有限公司',118),(1709,'萬滅靈(錳乃浦)',3,'',NULL,'農藥製字第01757號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','台灣正豐植保股份有限公司',128),(1710,'萬無一蝨(派滅淨)',3,'',NULL,'農藥製字第06525號',NULL,NULL,NULL,'(E)-4,5-dihydro-6-methyl-4-(3-pyridylmethyleneamino)-1,2,4- triazin-3(2H)-one 25.000 (%)   ',NULL,'admin','臺益工業股份有限公司',39),(1711,'萬生｜２００(錳乃浦)',3,'',NULL,'農藥進字第00166號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','聯合農化股份有限公司',150),(1712,'萬福勇(三氟得克利)',3,'',NULL,'農藥進字第03467號',NULL,NULL,NULL,'(1) methyl (E)-methoxyimino-{(E)-α-[1-(α,α,α-trifluoro-m-tolyl)ethylideneaminooxy]-o-tolyl}acetate...9.1% (2) (RS)-1-p-chlorophenyl-4,4-dimethyl-3-(1H-1,2,4-triazol-1- ylmethyl)pentan-3-ol...18.2% 27.300 (%) ',NULL,'admin','萬得發有限公司',125),(1713,'萬福果(依普同)',3,'',NULL,'農藥進字第02917號',NULL,NULL,NULL,'3-(3,5-dichlorophenyl)-N-isopropyl-2,4-dioxoimidazolidine-1-carboxamide  50.000 (%)',NULL,'admin','萬得發有限公司',125),(1714,'萬福精(依普同)',3,'',NULL,'農藥進字第02490號',NULL,NULL,NULL,'3-(3,5-dichlorophenyl)-N-isopropyl-2,4-dioxoimidazolidine-1-carboxamide  23.700 (%)',NULL,'admin','萬得發有限公司',125),(1715,'萬能松(托福松)',3,'',NULL,'農藥製字第02960號',NULL,NULL,NULL,' S-tert-butylthiomethyl O,O-diethyl phosphorodithioate  10.000 (%)',NULL,'admin','台灣正豐植保股份有限公司',128),(1716,'萬菌清－精(四氯異苯腈)',3,'',NULL,'農藥進字第02907號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  40.000 (%)',NULL,'admin','萬得發有限公司',125),(1717,'萬讚(賽滅淨)',3,'',NULL,'農藥進字第02287號',NULL,NULL,NULL,'N-cyclopropyl-1,3,5-triazine-2,4,6-triamine 75.000 (%)',NULL,'admin','萬得發有限公司',125),(1718,'萬里馬(亞托敏)',3,'',NULL,'農藥進字第03026號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  50.000 (%)',NULL,'admin','萬得發有限公司',125),(1719,'萬靈(納乃得)',3,'',NULL,'農藥製字第04986號',NULL,NULL,NULL,' S-methyl N-(methylcarbamoyloxy)thioacetimidate  40.000 (%)',NULL,'admin','台灣杜邦農業科學股份有限公司',161),(1720,'萬順丹(加保扶)',3,'',NULL,'農藥製字第03484號',NULL,NULL,NULL,'2,3-dihydro-2,2-dimethylbenzofuran-7-yl methylcarbamate  3.000 (%)',NULL,'admin','正農化學股份有限公司',130),(1721,'葛來麥(益達胺)',3,'',NULL,'農藥進字第02663號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%) ',NULL,'admin','現達國際生物科技有限公司',177),(1722,'葛立麥(益達胺)',3,'',NULL,'農藥製字第06171號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 18.200 (%)  ',NULL,'admin','立農化學股份有限公司',143),(1723,'葛達麥(益達胺)',3,'',NULL,'農藥進字第02272號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%)',NULL,'admin','現達國際生物科技有限公司',177),(1724,'蒂王肥2',2,'','有機資審字第107031號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0129003號','肉骨粉、花生粕、菜籽粕、蓖麻粕','全氮5.0%全磷酐2.0%全氧化鉀2.0%有機質80.0%',NULL,'admin','蒂興企業廠',66),(1725,'蓋好擋(三泰隆)',3,'',NULL,'農藥製字第03982號',NULL,NULL,NULL,'(1RS,2RS;1RS,2SR)-1-(4-chlorophenoxy)-3,3-dimethyl-1-(1H-1,2,4-triazol-1-yl)-butan-2-ol 23.000 (%) 乳化劑+其他成分 77.000(%)',NULL,'admin','興農股份有限公司',85),(1726,'蓋妥擋(布芬淨)',3,'',NULL,'農藥進字第03169號',NULL,NULL,NULL,'(Z)-2-tert-butylimino-3-isopropyl-5-phenyl-1, 3, 5-thiadiazinan-4-one 25.000 (%)  ',NULL,'admin','大成化學工業股份有限公司',127),(1727,'蓋性格',3,'',NULL,'農藥製字第04445號',NULL,NULL,NULL,'貝他賽扶寧  2.900 (%)',NULL,'admin','興農股份有限公司',85),(1728,'蓋有效(佈飛松)',3,'',NULL,'農藥製字第06340號',NULL,NULL,NULL,'O-4-bromo-2-chlorophenyl O-ethyl S-propyl phosphorothioate 43.000 (%)',NULL,'admin','台農三和化工股份有限公司',119),(1729,'蓋猛(佈飛松)',3,'',NULL,'農藥製字第04407號',NULL,NULL,NULL,'O-4-bromo-2-chlorophenyl O-ethyl S-propyl phosphorothioate 43.000 (%)',NULL,'admin','興農股份有限公司',85),(1730,'蓋順事(陶斯寧)',3,'',NULL,'農藥製字第06181號',NULL,NULL,NULL,'(1) O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate…45.45% (2) (RS)-α-cyano-3-phenoxybenzyl (1RS)-cis-trans-3-(2,2-dichlorovinyl)-2,2-dimethylcyclopropanecarboxylate…4.55%',NULL,'admin','華夏科學農化股份有限公司',106),(1731,'蔬果益(賽座滅)',3,'',NULL,'農藥進字第03489號',NULL,NULL,NULL,' 4-chloro-2-cyano-N,N-dimethyl-5-p-tolylimidazole-1-sulfonamide  9.400 (%)',NULL,'admin','日農科技股份有限公司',105),(1732,'薊蚜清(第滅寧)',3,'',NULL,'農藥進字第02829號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%)',NULL,'admin','松樹國際有限公司',137),(1733,'薊馬靈(第滅寧)',3,'',NULL,'農藥製字第02835號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%)',NULL,'admin','世大農化工廠股份有限公司	',114),(1734,'藍保萬 33%(錳乃浦)',3,'',NULL,'農藥進字第03336號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  33.000 (%)',NULL,'admin','國寶國際有限公司',153),(1735,'藍保萬 80%(錳乃浦)',3,'',NULL,'農藥進字第02953號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','美商雅柏生活科技有限公司臺灣分公司',148),(1736,'藍得 0.5%(可尼丁)',3,'',NULL,'農藥進字第02217號',NULL,NULL,NULL,'(E)-1-(2-chloro-1,3-thiazol-5-ylmethyl)-3-methyl-2- nitroguanidine 0.500  (%) ',NULL,'admin','台灣住友化學股份有限公司',160),(1737,'藍得 16%(可尼丁)',3,'',NULL,'農藥進字第02216號',NULL,NULL,NULL,'(E)-1-(2-chloro-1,3-thiazol-5-ylmethyl)-3-methyl-2- nitroguanidine 16.000 (%)',NULL,'admin','台灣住友化學股份有限公司',160),(1738,'藍珠(免得爛)',3,'',NULL,'農藥進字第03258號',NULL,NULL,NULL,' zinc ammoniate ethylenebis(dithiocarbamate)-poly(ethylenethiuram disulfide)  80.000 (%)',NULL,'admin','嘉濱貿易有限公司',111),(1739,'藍田牌好地肥1號',2,'','有機資審字第103019號',NULL,'植物渣粕肥料(5-01)','肥製(質)字第0622026號','蓖麻粕、花生粕、芝麻粕、菜仔粕','全氮5.0%全磷酐2.0%全氧化鉀1.5%有機質85%',NULL,'admin','三木實業有限公司',40),(1740,'藍田牌好地肥3號',2,'','有機資審字第103022號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0622028號','蓖麻粕、菜仔粕、菸葉、肉骨粉、蝦蟹瞉粉','全氮5%全磷酐2.5%全氧化鉀2.0%有機質75%',NULL,'admin','三木實業有限公司',40),(1741,'藍青(氫氧化銅)',3,'',NULL,'農藥進字第01812號',NULL,NULL,NULL,' CUPRIC HYDROXIDE  77.000 (%)',NULL,'admin','安農股份有限公司',156),(1742,'蘇滅寶(蘇力菌)',3,'',NULL,'農藥製字第02698號',NULL,NULL,NULL,'VIABLE SPORES OF BACILLUS THURINGIENSIS  3.000 (%)',NULL,'admin','臺益工業股份有限公司',39),(1743,'蘭蔓(賽座滅)',3,'',NULL,'農藥進字第02196號',NULL,NULL,NULL,' 4-chloro-2-cyano-N,N-dimethyl-5-p-tolylimidazole-1-sulfonamide  9.400 (%)',NULL,'admin','台灣石原產業股份有限公司',172),(1744,'虫嘸去(因滅汀)',3,'',NULL,'農藥進字第02711號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','東鋒股份有限公司',154),(1745,'虫拜拜(因滅汀)',3,'',NULL,'農藥進字第02638號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','雋農實業股份有限公司',136),(1746,'虫攏去(因滅汀)',3,'',NULL,'農藥製字第06292號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','正農化學股份有限公司',130),(1747,'蚜沒陪(亞滅培)',3,'',NULL,'農藥進字第02874號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%)',NULL,'admin','松樹國際有限公司',137),(1748,'蚜滅跌(亞滅培)',3,'',NULL,'農藥製字第05901號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%)',NULL,'admin','嘉農企業股份有限公司',117),(1749,'蚜科醫生(賽速安)',3,'',NULL,'農藥進字第02895號',NULL,NULL,NULL,'3-(2-chloro-1,3-thiazol-5-ylmethyl)-5-methyl-1,3,5-oxadiazinan-4-ylidene(nitro)amine 25.000 (%) ',NULL,'admin','萬得發有限公司',125),(1750,'蛛擱亮(芬普蟎)',3,'',NULL,'農藥製字第05828號',NULL,NULL,NULL,'tert-butyl (E)-α-(1,3-dimethyl-5-phenoxypyrazol-4-ylmethyleneamino-oxy)-p-toluate 5.000  (%) ',NULL,'admin','利台化學工業股份有限公司',116),(1751,'蛛自清(芬普蟎)',3,'',NULL,'農藥製字第05876號',NULL,NULL,NULL,'tert-butyl (E)-α-(1,3-dimethyl-5-phenoxypyrazol-4-ylmethyleneamino-oxy)-p-toluate 5.000  (%)',NULL,'admin','世大農化工廠股份有限公司	',114),(1752,'蛾仔殲(祿芬隆)',3,'',NULL,'農藥製字第06427號',NULL,NULL,NULL,'(RS)-1-[2,5-dichloro-4-(1,1,2,3,3,3-hexafluoropropoxy)- phenyl]-3-(2,6-difluorobenzoyl)-urea  4.400 (%)',NULL,'admin','眾益農業生技股份有限公司',124),(1753,'蛾作仙(祿芬隆)',3,'',NULL,'農藥製字第06260號',NULL,NULL,NULL,'(RS)-1-[2,5-dichloro-4-(1,1,2,3,3,3-hexafluoropropoxy)- phenyl]-3-(2,6-difluorobenzoyl)-urea  4.400 (%)',NULL,'admin','世大農化工廠股份有限公司	',114),(1754,'蛾樂天(祿芬隆)',3,'',NULL,'農藥進字第02069號',NULL,NULL,NULL,'(RS)-1-[2,5-dichloro-4-(1,1,2,3,3,3-hexafluoropropoxy)- phenyl]-3-(2,6-difluorobenzoyl)-urea  50 G/L (5% W/V)',NULL,'admin','台灣先正達股份有限公司',144),(1755,'蛾賣來(得芬諾)',3,'',NULL,'農藥製字第05749號',NULL,NULL,NULL,' N-tert-butyl-N’-(4-ethylbenzoyl)-3,5-dimethylbenzohydrazide  70.000 (%)',NULL,'admin','國豐化學工業股份有限公司',112),(1756,'蜂寶(福化利)',3,'',NULL,'農藥進字第02060號',NULL,NULL,NULL,'(RS)-α-cyano-3-phenoxybenzyl N-(2-chloro-α,α,α-trifluoro-p-tolyl)-D-valinate 240 G/L (24% W/V) ',NULL,'admin','聯利農業科技股份有限公司',103),(1757,'蜱蟎精(芬普蟎)',3,'',NULL,'農藥製字第05891號',NULL,NULL,NULL,'tert-butyl (E)-α-(1,3-dimethyl-5-phenoxypyrazol-4-ylmethyleneamino-oxy)-p-toluate 5.000  (%)   ',NULL,'admin','安旺特股份有限公司',120),(1758,'蝨中寶(布芬淨)',3,'',NULL,'農藥進字第01619號',NULL,NULL,NULL,'(Z)-2-tert-butylimino-3-isopropyl-5-phenyl-1, 3, 5-thiadiazinan-4-one 25.000 (%)  ',NULL,'admin','嘉濱貿易有限公司',111),(1759,'蝨介清(百利普芬)',3,'',NULL,'農藥製字第06514號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 11.000 (%) ',NULL,'admin','眾益農業生技股份有限公司',124),(1760,'蝨介讚(百利普芬)',3,'',NULL,'農藥進字第03439號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 11.000 (%)',NULL,'admin','日農科技股份有限公司',105),(1761,'蝨延穩(達特南)',3,'',NULL,'農藥進字第03471號',NULL,NULL,NULL,'(RS)-1-methyl-2-nitro-3-(tetrahydro-3-furylmethyl)guanidine 20.000 (%)',NULL,'admin','鴻鋒化學有限公司',134),(1762,'蝨殼而止(百利普芬)',3,'',NULL,'農藥製字第06133號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 11.000 (%) ',NULL,'admin','台灣日產化工股份有限公司',104),(1763,'蝨翹翹(派滅淨)',3,'',NULL,'農藥進字第03120號',NULL,NULL,NULL,'(E)-4,5-dihydro-6-methyl-4-(3-pyridylmethyleneamino)-1,2,4- triazin-3(2H)-one 25.000 (%)  ',NULL,'admin','優必樂有限公司',151),(1764,'蝨薊清(亞滅培)',3,'',NULL,'農藥進字第03127號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%)',NULL,'admin','嘉農企業股份有限公司',117),(1765,'蝨阻(派滅淨)',3,'',NULL,'農藥進字第02982號',NULL,NULL,NULL,'(E)-4,5-dihydro-6-methyl-4-(3-pyridylmethyleneamino)-1,2,4- triazin-3(2H)-one 25.000 (%)  ',NULL,'admin','萬得發有限公司',125),(1766,'蝨靖(派滅淨)',3,'',NULL,'農藥進字第02502號',NULL,NULL,NULL,'(E)-4,5-dihydro-6-methyl-4-(3-pyridylmethyleneamino)-1,2,4- triazin-3(2H)-one 25.000 (%) ',NULL,'admin','鴻鋒化學有限公司',134),(1767,'螨分(阿巴汀)',3,'',NULL,'農藥製字第05319號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%) ',NULL,'admin','富農化學工業股份有限公司',132),(1768,'蟎効(芬普蟎)',3,'',NULL,'農藥進字第01414號',NULL,NULL,NULL,'tert-butyl (E)-α-(1,3-dimethyl-5-phenoxypyrazol-4-ylmethyleneamino-oxy)-p-toluate 5.000  (%)',NULL,'admin','日佳農葯股份有限公司',178),(1769,'蟎厲害(芬普蟎)',3,'',NULL,'農藥製字第06356號',NULL,NULL,NULL,'tert-butyl (E)-α-(1,3-dimethyl-5-phenoxypyrazol-4-ylmethyleneamino-oxy)-p-toluate 5.000  (%)',NULL,'admin','瑞芳植物保護股份有限公司',115),(1770,'蟎攏清(芬普蟎)',3,'',NULL,'農藥製字第06186號',NULL,NULL,NULL,'tert-butyl (E)-α-(1,3-dimethyl-5-phenoxypyrazol-4-ylmethyleneamino-oxy)-p-toluate 5.000  (%)  ',NULL,'admin','台農三和化工股份有限公司',119),(1771,'蟎蚤蠅(佈飛松)',3,'',NULL,'農藥進字第03259號',NULL,NULL,NULL,'O-4-bromo-2-chlorophenyl O-ethyl S-propyl phosphorothioate 43.000 (%)',NULL,'admin','日農科技股份有限公司',105),(1772,'蟲ㄟ死(因滅汀)',3,'',NULL,'農藥進字第03314號',NULL,NULL,NULL,'因滅汀 5%',NULL,'admin','優必樂有限公司',151),(1773,'蟲倒倒(因滅汀)',3,'',NULL,'農藥製字第05287號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','惠光股份有限公司',121),(1774,'蟲全除(賽達松)',3,'',NULL,'農藥製字第06438號',NULL,NULL,NULL,' S-α-ethoxycarbonylbenzyl O,O-dimethyl phosphorodithioate  50.000 (%)',NULL,'admin','台農三和化工股份有限公司',119),(1775,'蟲卵克(得芬諾)',3,'',NULL,'農藥進字第03201號',NULL,NULL,NULL,' N-tert-butyl-N’-(4-ethylbenzoyl)-3,5-dimethylbenzohydrazide  70.000 (%)',NULL,'admin','萬得發有限公司',125),(1776,'蟲呸(陶斯寧)',3,'',NULL,'農藥製字第04805號',NULL,NULL,NULL,'(1) O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate…22.5%  (2)(RS)-α-cyano-3-phenoxybenzyl (1RS)-cis-trans-3-(2,2-dichlorovinyl)-2,2-dimethylcyclopropanecarboxylate…2.5%',NULL,'admin','瑞芳植物保護股份有限公司',115),(1777,'蟲呼死(因滅汀)',3,'',NULL,'農藥製字第05430號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','聯利農業科技股份有限公司',103),(1778,'蟲嘸影(因滅汀)',3,'',NULL,'農藥製字第06436號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','富農化學工業股份有限公司',132),(1779,'蟲孔鏘(派滅淨)',3,'',NULL,'農藥進字第03344號',NULL,NULL,NULL,'(E)-4,5-dihydro-6-methyl-4-(3-pyridylmethyleneamino)-1,2,4- triazin-3(2H)-one 50.000 (%)',NULL,'admin','優必樂有限公司',151),(1780,'蟲必効(陶斯松)',3,'',NULL,'農藥製字第03983號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 25.000 (%)',NULL,'admin','瑞芳植物保護股份有限公司',115),(1781,'蟲必滅(益達胺)',3,'',NULL,'農藥製字第05556號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 18.200 (%)  ',NULL,'admin','洽益化學股份有限公司',108),(1782,'蟲攏死(因滅汀)',3,'',NULL,'農藥製字第05952號',NULL,NULL,NULL,'因滅汀 5%',NULL,'admin','台農三和化工股份有限公司',119),(1783,'蟲敗敗(賽洛寧)',3,'',NULL,'農藥進字第02349號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.800  (%) ',NULL,'admin','易利特開發有限公司',138),(1784,'蟲會剉(陶斯松)',3,'',NULL,'農藥製字第05382號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 50.000 (%)',NULL,'admin','東和化學企業股份有限公司',109),(1785,'蟲有効(百利普芬)',3,'',NULL,'農藥進字第02929號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 11.000 (%)  ',NULL,'admin','松樹國際有限公司',137),(1786,'蟲末日(佈飛松)',3,'',NULL,'農藥進字第02631號',NULL,NULL,NULL,'O-4-bromo-2-chlorophenyl O-ethyl S-propyl phosphorothioate 43.000 (%) ',NULL,'admin','青山貿易有限公司',147),(1787,'蟲死定(因滅汀)',3,'',NULL,'農藥製字第05441號',NULL,NULL,NULL,'因滅汀 5%',NULL,'admin','聯利農業科技股份有限公司',103),(1788,'蟲沒命(因滅汀)',3,'',NULL,'農藥製字第06575號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','國豐化學工業股份有限公司',112),(1789,'蟲淨(第滅寧)',3,'',NULL,'農藥製字第01908號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%) ',NULL,'admin','日農科技股份有限公司',105),(1790,'蟲清利(因滅汀)',3,'',NULL,'農藥製字第05223號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','興農股份有限公司',85),(1791,'蟲清去(因得克)',3,'',NULL,'農藥製字第06513號',NULL,NULL,NULL,'methyl (S)-N-[7-chloro-2,3,4a,5-tetrahydro-4a-(methoxycarbonyl)indeno[1,2-e][1,3,4]oxadiazin-2-ylcarbonyl]-4’-(trifluoromethoxy)carbanilate  14.500 (%)',NULL,'admin','台農三和化工股份有限公司',119),(1792,'蟲溜溜(因滅汀)',3,'',NULL,'農藥進字第02688號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','雅飛有限公司',126),(1793,'蟲滅寧(第滅寧)',3,'',NULL,'農藥製字第02739號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%) ',NULL,'admin','洽益化學股份有限公司',108),(1794,'蟲無氣(賽洛寧)',3,'',NULL,'農藥進字第02933號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 5.000  (%)',NULL,'admin','萬得發有限公司',125),(1795,'蟲煞(陶斯松)',3,'',NULL,'農藥製字第03888號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 5.000  (%)  ',NULL,'admin','興農股份有限公司',85),(1796,'蟲真驚(賽洛寧)',3,'',NULL,'農藥製字第05030號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.800  (%)  ',NULL,'admin','興農股份有限公司',85),(1797,'蟲絕(因滅汀)',3,'',NULL,'農藥進字第02620號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','台灣瑪斯德股份有限公司',145),(1798,'蟲絕丹(因滅汀)',3,'',NULL,'農藥進字第03339號',NULL,NULL,NULL,'因滅汀 5%',NULL,'admin','台灣瑪斯德股份有限公司',145),(1799,'蟲絕寶(因滅汀)',3,'',NULL,'農藥進字第03370號',NULL,NULL,NULL,'因滅汀 5%',NULL,'admin','台灣瑪斯德股份有限公司',145),(1800,'蟲緊酸(因得克)',3,'',NULL,' 農藥製字第06569號',NULL,NULL,NULL,'methyl (S)-N-[7-chloro-2,3,4a,5-tetrahydro-4a-(methoxycarbonyl)indeno[1,2-e][1,3,4]oxadiazin-2-ylcarbonyl]-4’-(trifluoromethoxy)carbanilate  14.500 (%)',NULL,'admin','國豐化學工業股份有限公司',112),(1801,'蟲落跑(陶斯松)',3,'',NULL,'農藥製字第05592號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 5.000  (%)',NULL,'admin','東和化學企業股份有限公司',109),(1802,'蟲蟎克(克凡派)',3,'',NULL,'農藥進字第03047號',NULL,NULL,NULL,'4-bromo-2-(4-chlorophenyl)-1-ethoxymethyl-5-trifluoromethylpyrrole-3-carbonitrile 10.000 (%)   ',NULL,'admin','萬得發有限公司',125),(1803,'蟲蟲有危機(因滅汀)',3,'',NULL,'農藥製字第05582號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','東和化學企業股份有限公司',109),(1804,'蟲蹤無(畢芬寧)',3,'',NULL,'農藥製字第04879號',NULL,NULL,NULL,'2-methylbiphenyl-3-ylmethyl (Z)-(1RS,3RS)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate  2.800 (%)',NULL,'admin','興農股份有限公司',85),(1805,'蟲速淨(佈飛松)',3,'',NULL,'農藥製字第04348號',NULL,NULL,NULL,'O-4-bromo-2-chlorophenyl O-ethyl S-propyl phosphorothioate 43.000 (%)',NULL,'admin','惠光股份有限公司',121),(1806,'蟲除除(因滅汀)',3,'',NULL,'農藥製字第05510號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','惠大實業股份有限公司',157),(1807,'蟲離離(因滅汀)',3,'',NULL,'農藥進字第01982號',NULL,NULL,NULL,'因滅汀 19.2 G/L (1.92% W/V)',NULL,'admin','台灣先正達股份有限公司',144),(1808,'蟲驚驚(硫敵克)',3,'',NULL,'農藥製字第04774號',NULL,NULL,NULL,'3,7,9,13-tetramethyl-5,11-dioxa-2,8,14-trithia-4,7,9,12-tetra-azapentadeca-3,12-diene-6,10-dione 75.000 (%)',NULL,'admin','東和化學企業股份有限公司',109),(1809,'蟻毒不回(百利普芬)',3,'',NULL,'農藥製字第06131號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 0.500  (%)',NULL,'admin','台灣日產化工股份有限公司',104),(1810,'蟻頂搶(阿巴汀)',3,'',NULL,'農藥製字第06381號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 0.011  (%)',NULL,'admin','台農三和化工股份有限公司',119),(1811,'行大運(撲滅寧)',3,'',NULL,'農藥進字第02294號',NULL,NULL,NULL,' N-(3,5-dichlorophenyl)-1,2-dimethylcyclopropane-1,2-dicarboximide  50.000 (%)',NULL,'admin','萬得發有限公司',125),(1812,'衝不停(亞托敏)',3,'',NULL,'農藥進字第02854號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','萬得發有限公司',125),(1813,'衝到發(亞托敏)',3,'',NULL,'農藥進字第02938號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','雅飛有限公司',126),(1814,'褔你發(第滅寧)',3,'',NULL,'農藥製字第05442號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.400  (%) ',NULL,'admin','龍燈生物科技股份有限公司',76),(1815,'西敏(加保利)',3,'',NULL,'農藥進字第02579號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 85.000 (%) ',NULL,'admin','雅飛有限公司',126),(1816,'西樂寧(賽洛寧)',3,'',NULL,'農藥製字第05181號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.800  (%)   ',NULL,'admin','臺灣庵原農藥股份有限公司',113),(1817,'要發達(亞托敏)',3,'',NULL,'農藥進字第03019號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  50.000 (%)',NULL,'admin','萬得發有限公司',125),(1818,'覆露滅(甲鋅毆殺斯)',3,'',NULL,'農藥製字第03917號',NULL,NULL,NULL,'(1) POLYMER ZINC 1,2-PROPYLENEBIS(DITHIOCARBAMATE).......56%(2) 2-METHOXY-N-(2-OXO-1,3-OXAZOLIDIN-3YL)-ACETO-2’,6’-    XYLIDIDE.............................................8%',NULL,'admin','興農股份有限公司',85),(1819,'見招(蘇力菌)',3,'',NULL,'農藥製字第05036號',NULL,NULL,NULL,' VIABLE SPORES OF BACILLUS THURINGIENSIS  16,000IU/MG',NULL,'admin','嘉農企業股份有限公司',117),(1820,'見達利(蘇力菌)',3,'',NULL,'農藥進字第01543號',NULL,NULL,NULL,' BACILLUS THURINGIENSIS, SUBSP. AIZAWAI, STRAIN ABTS-1857, FERMENTATION SOLIDS AND SOLUBLES(35,000 DBMU/MG)   48.100 (%)',NULL,'admin','台灣住友化學股份有限公司',160),(1821,'討勁久(賽速安)',3,'',NULL,'農藥進字第02143號',NULL,NULL,NULL,'3-(2-chloro-1,3-thiazol-5-ylmethyl)-5-methyl-1,3,5-oxadiazinan-4-ylidene(nitro)amine 25.000 (%)     ',NULL,'admin','台灣先正達股份有限公司',144),(1822,'諾發(達滅芬)',3,'',NULL,'農藥製字第05610號',NULL,NULL,NULL,'(E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine  50.000 (%)',NULL,'admin','日農科技股份有限公司',105),(1823,'諾貝爾(益滅松)',3,'',NULL,'農藥製字第05492號',NULL,NULL,NULL,'O,O-dimethyl S-phthalimidomethyl phosphorodithioate  50.000 (%)',NULL,'admin','安旺特股份有限公司',120),(1824,'護你好(甲基多保淨)',3,'',NULL,'農藥製字第05489號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 40.000 (%)  ',NULL,'admin','大勝化學工業股份有限公司',110),(1825,'護利寶(加保利)',3,'',NULL,'農藥製字第01267號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 39.500 (%)',NULL,'admin','富農化學工業股份有限公司',132),(1826,'護原精(依普同)',3,'',NULL,'農藥進字第02448號',NULL,NULL,NULL,'3-(3,5-dichlorophenyl)-N-isopropyl-2,4-dioxoimidazolidine-1-carboxamide  23.700 (%)',NULL,'admin','雅飛有限公司',126),(1827,'護根(毆殺滅)',3,'',NULL,'農藥進字第00827號',NULL,NULL,NULL,' N,N-dimethyl-2-methylcarbamoyloxyimino-2-(methylthio)acetamide  10.000 (%)',NULL,'admin','生力化學工業股份有限公司',139),(1828,'讚四方(亞托待克利)',3,'',NULL,'農藥進字第03341號',NULL,NULL,NULL,'(1) methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate...200 g/L (2) cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1-ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether...125 g/L',NULL,'admin','朝暘生化開發有限公司',171),(1829,'讚果英雄(亞托待克利)',3,'',NULL,'農藥製字第06154號',NULL,NULL,NULL,'(1) methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate...200 g/L (2) cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1-ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether...125 g/L',NULL,'admin','台灣日產化工股份有限公司',104),(1830,'讚讚加(亞托待克利)',3,'',NULL,'農藥進字第03115號',NULL,NULL,NULL,'(1) methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate...200 g/L (2) cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1-ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether...125 g/L',NULL,'admin','萬得發有限公司',125),(1831,'豐收喜(第滅寧)',3,'',NULL,'農藥製字第04080號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%)',NULL,'admin','東和化學企業股份有限公司',109),(1832,'豐收喜精(第滅寧)',3,'',NULL,'農藥製字第05285號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.400  (%)',NULL,'admin','東和化學企業股份有限公司',109),(1833,'豐收樂(待克利)',3,'',NULL,'農藥製字第06444號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%) ',NULL,'admin','台農三和化工股份有限公司',119),(1834,'豐樂寶(賽達松)',3,'',NULL,'農藥製字第02263號',NULL,NULL,NULL,' S-α-ethoxycarbonylbenzyl O,O-dimethyl phosphorodithioate  50.000 (%)',NULL,'admin','富農化學工業股份有限公司',132),(1835,'豐田一號高級有機質肥料',2,'','有機資審字第108020號',NULL,'禽畜糞堆肥(5-09)','肥製(質)字第0295020號','禽畜糞、菇類培植廢棄包','全氮2.3%全磷酐2.7%全氧化鉀2.0%有機質70.0%',NULL,'admin','田酪股份有限公司',55),(1836,'豐達松(賽達松)',3,'',NULL,'農藥製字第02103號',NULL,NULL,NULL,' S-α-ethoxycarbonylbenzyl O,O-dimethyl phosphorodithioate  50.000 (%)',NULL,'admin','正農化學股份有限公司',130),(1837,'豪工夫(賽洛寧)',3,'',NULL,'農藥製字第04992號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.800  (%)   ',NULL,'admin','世大農化工廠股份有限公司	',114),(1838,'貝克利(貝芬菲克利)',3,'',NULL,'農藥製字第05236號',NULL,NULL,NULL,'(1) METHYL BENZIMIDAZOL-2-YLCARBAMATE..........24.5% (2) (RS)-2-(2,4-DICHLOROPHENYL)-1-(1H-1,2,4-TRIAZOL-1-YL)HEXAN-2-OL.........10%',NULL,'admin','臺益工業股份有限公司',39),(1839,'貝利(貝芬菲克利)',3,'',NULL,'農藥製字第05997號',NULL,NULL,NULL,'(1) METHYL BENZIMIDAZOL-2-YLCARBAMATE..........24.5%(2) (RS)-2-(2,4-DICHLOROPHENYL)-1-(1H-1,2,4-TRIAZOL-1-YL)HEXAN-2-OL.........10%',NULL,'admin','富農化學工業股份有限公司',132),(1840,'貝士得金鑽(亞滅培)',3,'',NULL,'農藥進字第02739號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%)',NULL,'admin','貝士得開發企業有限公司',163),(1841,'貴寶(蘇力菌)',3,'',NULL,'農藥製字第00769號',NULL,NULL,NULL,' VIABLE SPORES OF BACILLUS THURINGIENSIS  3.000 (%)',NULL,'admin','聯利農業科技股份有限公司',103),(1842,'賓利(賓得克利)',3,'',NULL,'農藥製字第06007號',NULL,NULL,NULL,'(1) 1-(4-chlorobenzyl)-1-cyclopentyl-3-phenylurea...15% (2) (RS)-1-p-chlorophenyl-4,4-dimethyl-3-(1H-1,2,4-triazol-1- ylmethyl)pentan-3-ol...10%',NULL,'admin','安旺特股份有限公司',120),(1843,'賓得克利 (賓得克利) (農會農化廠)',3,'',NULL,'農藥製字第06240號',NULL,NULL,NULL,'(1) 1-(4-chlorobenzyl)-1-cyclopentyl-3-phenylurea...15% (2) (RS)-1-p-chlorophenyl-4,4-dimethyl-3-(1H-1,2,4-triazol-1- ylmethyl)pentan-3-ol...10%',NULL,'admin','中華民國農會附設各級農會農化廠',131),(1844,'賓磅叫(賓得克利)',3,'',NULL,'農藥製字第06123號',NULL,NULL,NULL,'(1) 1-(4-chlorobenzyl)-1-cyclopentyl-3-phenylurea...15% (2) (RS)-1-p-chlorophenyl-4,4-dimethyl-3-(1H-1,2,4-triazol-1- ylmethyl)pentan-3-ol...10%',NULL,'admin','華夏科學農化股份有限公司',106),(1845,'賜久安(賽速安)',3,'',NULL,'農藥製字第05840號',NULL,NULL,NULL,'3-(2-chloro-1,3-thiazol-5-ylmethyl)-5-methyl-1,3,5-oxadiazinan-4-ylidene(nitro)amine 25.000 (%)',NULL,'admin','聯利農業科技股份有限公司',103),(1846,'賜季財(可尼丁)',3,'',NULL,'農藥進字第03261號',NULL,NULL,NULL,'(E)-1-(2-chloro-1,3-thiazol-5-ylmethyl)-3-methyl-2- nitroguanidine 0.500  (%)',NULL,'admin','嘉濱貿易有限公司',111),(1847,'賜安(馬拉松)',3,'',NULL,'農藥製字第00557號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 50.000 (%)',NULL,'admin','台灣日產化工股份有限公司',104),(1848,'賜寶(因得克)',3,'',NULL,'農藥製字第06582號',NULL,NULL,NULL,' methyl (S)-N-[7-chloro-2,3,4a,5-tetrahydro-4a-(methoxycarbonyl)indeno[1,2-e][1,3,4]oxadiazin-2-ylcarbonyl]-4’-(trifluoromethoxy)carbanilate  14.500 (%)',NULL,'admin','聯利農業科技股份有限公司',103),(1849,'賜必寧(陶斯寧)',3,'',NULL,'農藥製字第04685號',NULL,NULL,NULL,'(1) O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate…22.5%  (2)(RS)-α-cyano-3-phenoxybenzyl (1RS)-cis-trans-3-(2,2-dichlorovinyl)-2,2-dimethylcyclopropanecarboxylate…2.5%',NULL,'admin','臺聯實業股份有限公司',107),(1850,'賜果丹(快得寧)',3,'',NULL,'農藥製字第02846號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 40.000 (%) ',NULL,'admin','日農科技股份有限公司',105),(1851,'賜果寧(馬拉松)',3,'',NULL,'農藥製字第04474號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 25.000 (%)  ',NULL,'admin','台灣正豐植保股份有限公司',128),(1852,'賜果露(快得寧)',3,'',NULL,'農藥製字第02847號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 33.500 (%)',NULL,'admin','日農科技股份有限公司',105),(1853,'賜福(亞滅培)',3,'',NULL,'農藥進字第02804號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%)',NULL,'admin','青山貿易有限公司',147),(1854,'賜美丹(益滅賽寧)',3,'',NULL,'農藥製字第04375號',NULL,NULL,NULL,'(1)O,O-dimethyl S-phthalimidomethyl phosphorodithioate…30%  (2)(RS)-α-cyano-3-phenoxybenzyl(1RS)-cis-trans-3-(2,2-dichlorovinyl)-2,2-dimethyl cyclopropanecarboxylate …10%',NULL,'admin','利台化學工業股份有限公司',116),(1855,'賜而發',4,'','農藥製字第04902號',NULL,NULL,NULL,'O-4-bromo-2-chlorophenyl O-ethyl S-propyl phosphorothioate 43.000 (%) ',NULL,NULL,'admin','國豐化學工業股份有限公司',112),(1856,'賜良地(托福松)',3,'',NULL,'農藥製字第04716號',NULL,NULL,NULL,' S-tert-butylthiomethyl O,O-diethyl phosphorodithioate  10.000 (%)',NULL,'admin','光華化學股份有限公司',77),(1857,'賜農富(托福松)',3,'',NULL,'農藥製字第03284號',NULL,NULL,NULL,' S-tert-butylthiomethyl O,O-diethyl phosphorodithioate  10.000 (%)',NULL,'admin','正農化學股份有限公司',130),(1858,'賺實(平克座)',3,'',NULL,'農藥進字第02905號',NULL,NULL,NULL,'1-(2,4-dichloro-β-propylphenethyl)-1H-1,2,4-triazole 10.500 (%) ',NULL,'admin','松樹國際有限公司',137),(1859,'賽得靈(賽洛寧)',3,'',NULL,'農藥製字第05680號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 1.000  (%)   ',NULL,'admin','正農化學股份有限公司',130),(1860,'賽敏王(加保利)',3,'',NULL,'農藥製字第04316號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 40.000 (%) ',NULL,'admin','眾益農業生技股份有限公司',124),(1861,'賽文(加保利)',3,'',NULL,'農藥進字第03187號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 44.100 (%) ',NULL,'admin','達通國際興業有限公司',185),(1862,'賽洛寧(農會農化廠)',3,'',NULL,'農藥製字第05048號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.800  (%)   ',NULL,'admin','中華民國農會附設各級農會農化廠',131),(1863,'賽滅得(福瑞松)',3,'',NULL,'農藥製字第02779號',NULL,NULL,NULL,' O,O-diethyl S-ethylthiomethyl phosphorodithioate  10.000 (%)',NULL,'admin','富農化學工業股份有限公司',132),(1864,'賽達松(農會農化廠)',3,'',NULL,'農藥製字第02833號',NULL,NULL,NULL,'S-α-ethoxycarbonylbenzyl O,O-dimethyl phosphorodithioate  92.000 (%)',NULL,'admin','中華民國農會附設各級農會農化廠',131),(1865,'賽達松(安農股份有限公司)',3,'',NULL,'農藥進字第03334號',NULL,NULL,NULL,' S-α-ethoxycarbonylbenzyl O,O-dimethyl phosphorodithioate  50.000 (%)',NULL,'admin','安農股份有限公司',156),(1866,'賽門(加保利)',3,'',NULL,'農藥製字第05363號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 85.000 (%) ',NULL,'admin','安旺特股份有限公司',120),(1867,'贏長(百克敏)',3,'',NULL,'農藥進字第03347號',NULL,NULL,NULL,' methyl N-{2-[1-(4-chlorophenyl)pyrazol-3-yloxymethyl]phenyl}(N-methoxy)carbamate  23.600 (%)',NULL,'admin','鴻鋒化學有限公司',134),(1868,'走運(達特南)',3,'',NULL,'農藥進字第03323號',NULL,NULL,NULL,'(RS)-1-methyl-2-nitro-3-(tetrahydro-3-furylmethyl)guanidine 20.000 (%) ',NULL,'admin','萬得發有限公司',125),(1869,'超好效(邁克尼)',3,'',NULL,'農藥進字第02600號',NULL,NULL,NULL,'2-p-chlorophenyl-2-(1H-1,2,4-triazol-1-ylmethyl)hexanenitrile 40.000 (%)',NULL,'admin','萬得發有限公司',125),(1870,'超忽好(得芬諾)',3,'',NULL,'農藥進字第02882號',NULL,NULL,NULL,' N-tert-butyl-N’-(4-ethylbenzoyl)-3,5-dimethylbenzohydrazide  19.700 (%)',NULL,'admin','萬得發有限公司',125),(1871,'超星(菲克利)',3,'',NULL,'農藥製字第05152號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 5.000  (%)',NULL,'admin','光華化學股份有限公司',77),(1872,'超棒(快得寧)',3,'',NULL,'農藥製字第00695號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 33.500 (%) ',NULL,'admin','光華化學股份有限公司',77),(1873,'越禧(第滅寧)',3,'',NULL,'農藥進字第02249號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%)  ',NULL,'admin','雅飛有限公司',126),(1874,'趨勢(派滅淨)',3,'',NULL,'農藥進字第03178號',NULL,NULL,NULL,'(E)-4,5-dihydro-6-methyl-4-(3-pyridylmethyleneamino)-1,2,4- triazin-3(2H)-one 25.000 (%) ',NULL,'admin','台灣先正達股份有限公司',144),(1875,'跑不掉(派滅淨)',3,'',NULL,'農藥進字第02950號',NULL,NULL,NULL,'(E)-4,5-dihydro-6-methyl-4-(3-pyridylmethyleneamino)-1,2,4- triazin-3(2H)-one 50.000 (%)     ',NULL,'admin','萬得發有限公司',125),(1876,'跑無路(派滅淨)',3,'',NULL,'農藥進字第02528號',NULL,NULL,NULL,'(E)-4,5-dihydro-6-methyl-4-(3-pyridylmethyleneamino)-1,2,4- triazin-3(2H)-one 25.000 (%)  ',NULL,'admin','萬得發有限公司',125),(1877,'跑無路-丹(派滅淨)',3,'',NULL,'農藥進字第03037號',NULL,NULL,NULL,'(E)-4,5-dihydro-6-methyl-4-(3-pyridylmethyleneamino)-1,2,4- triazin-3(2H)-one 50.000 (%) ',NULL,'admin','萬得發有限公司',125),(1878,'跑真快(派滅淨)',3,'',NULL,'農藥製字第06562號',NULL,NULL,NULL,'(E)-4,5-dihydro-6-methyl-4-(3-pyridylmethyleneamino)-1,2,4- triazin-3(2H)-one 50.000 (%) ',NULL,'admin','台農三和化工股份有限公司',119),(1879,'跑若飛(派滅淨)',3,'',NULL,'農藥進字第03435號',NULL,NULL,NULL,'(E)-4,5-dihydro-6-methyl-4-(3-pyridylmethyleneamino)-1,2,4- triazin-3(2H)-one 50.000 (%) ',NULL,'admin','朝暘生化開發有限公司',171),(1880,'跳仔王(派滅淨)',3,'',NULL,'農藥進字第02633號',NULL,NULL,NULL,'(E)-4,5-dihydro-6-methyl-4-(3-pyridylmethyleneamino)-1,2,4- triazin-3(2H)-one 25.000 (%)    ',NULL,'admin','優必樂有限公司',151),(1881,'跳蟲淨(佈飛松)',3,'',NULL,'農藥製字第04351號',NULL,NULL,NULL,'O-4-bromo-2-chlorophenyl O-ethyl S-propyl phosphorothioate 43.000 (%)',NULL,'admin','瑞芳植物保護股份有限公司',115),(1882,'輕功(嘉賜銅)',3,'',NULL,'農藥製字第03332號',NULL,NULL,NULL,'(1) [5-amino-2-methyl-6-(2,3,4,5,6,-pentahydroxycyclohexyloxy) tetrahydropyran-3-yl] amino-α-iminoacetic acid hydrochloride hydrate...5.7% ( Kasugamycin...5% ) (2) copper oxychloride (CU 45%)...75.6%',NULL,'admin','大勝化學工業股份有限公司',110),(1883,'輝常水(貝芬菲克利)',3,'',NULL,'農藥製字第06278號',NULL,NULL,NULL,'(1) METHYL BENZIMIDAZOL-2-YLCARBAMATE..........24.5%(2) (RS)-2-(2,4-DICHLOROPHENYL)-1-(1H-1,2,4-TRIAZOL-1-YL)HEXAN-2-OL.........10%',NULL,'admin','興農股份有限公司',85),(1884,'輝常讚(貝芬菲克利)',3,'',NULL,'農藥製字第05067號',NULL,NULL,NULL,'(1) METHYL BENZIMIDAZOL-2-YLCARBAMATE..........24.5% (2) (RS)-2-(2,4-DICHLOROPHENYL)-1-(1H-1,2,4-TRIAZOL-1-YL)HEXAN-2-OL.........10%',NULL,'admin','興農股份有限公司',85),(1885,'輝藥農業微生物有機肥-溶磷益生菌',2,'','有機資審字第108018號',NULL,'溶磷菌肥料(8-03)','肥製(生)字第1003001號','益能牌二號有機質肥料、米糠、玉米粉、天然沸石粉、溶磷菌(Bacilluslicheniformis，地衣芽孢桿菌)菌粉(臺灣物種編號110246)','全氮2.5%全磷酐3.0%全氧化鉀1.5%溶磷菌有效活菌數1.3*10^9CFU/公克',NULL,'admin','輝藥農業科技股份有限公司',68),(1886,'農事寶 25%(陶斯松)',3,'',NULL,'農藥製字第04145號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 25.000 (%) ',NULL,'admin','富農化學工業股份有限公司',132),(1887,'農事寶 40.8%(陶斯松)',3,'',NULL,'農藥製字第04013號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%)',NULL,'admin','富農化學工業股份有限公司',132),(1888,'農事寶 5%(陶斯松)',3,'',NULL,'農藥製字第04340號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 5.000  (%)  ',NULL,'admin','富農化學工業股份有限公司',132),(1889,'農保淨(甲基多保淨)',3,'',NULL,'農藥製字第00721號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 70.000 (%)',NULL,'admin','光華化學股份有限公司',77),(1890,'農克蜂(克蠅香)',3,'',NULL,'農藥製字第04989號',NULL,NULL,NULL,'(1) 4-(P-ACETOXYPHENYL)-2-BUTANONE...42.7%                   (2) METHYL EUGENOL...42.3%',NULL,'admin','興農股份有限公司',85),(1891,'農包讚(撲克拉錳)',3,'',NULL,'農藥製字第06449號',NULL,NULL,NULL,'N-propyl-N-[2-(2,4,6-trichlorophenoxy)ethyl]imidazole-1-carboxamide complex with manganese(II) chloride 50.000 (%)',NULL,'admin','日農科技股份有限公司',105),(1892,'農友牌台肥二號有機質肥料',2,'101/1/17首次遴選通過106/11/29有機質62.7％，不符該肥料登記76.0%容許限值66.0%以上之規定，遴選終止108/04/19二次遴選通過','有機資審字第107040號',NULL,'一般堆肥(5-10)','肥製(質)字第0042025號','蔗渣、花生殼、菇類培植廢棄包、花生碎尾仁','全氮2.5%全磷酐2.5%全氧化鉀1.3%有機質76%',NULL,'admin','保證責任嘉義縣東石合作農場',27),(1893,'農友牌台肥活力6號生技營養劑',2,'','有機資審字第107021號',NULL,'液態有機質肥料(5-15)','肥製(質)字第0465023號','棕櫚灰、海鳥糞、風化煤','全磷酐0.2%全氧化鉀1.3%有機質5.0%',NULL,'admin','台灣肥料股份有限公司苗栗廠',49),(1894,'農友牌台肥生技11號有機質肥料',2,'','有機資審字第105007號',NULL,'雜項堆肥(5-11)','肥製(質)字第0465020號','麥粕、腐熟木屑、棕櫚灰、蓖麻粕、大豆粕、芝麻粕、花生粕、米糠','全氮2.5%全磷酐2.0%全氧化1.5%有機質76.0%',NULL,'admin','台灣肥料股份有限公司苗栗廠',49),(1895,'農友牌台肥生技5號有機質肥料',2,'','有機資審字第105006號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0465021號','麥粕、腐熟木屑、棕櫚灰、蓖麻粕、大豆粕、芝麻粕、花生粕、米糠','全氮5.0%全磷酐2.5%全氧化鉀2.5%有機質88.0%',NULL,'admin','台灣肥料股份有限公司苗栗廠',49),(1896,'農友牌台肥硝磷基黑旺特1號有機質複合肥料',2,'',NULL,NULL,'雜項複合肥料(6-05)','肥製(複)字第0792034號','氯化鉀、磷礦、泥炭、液氨、硝酸、硫酸','氮-磷酐-氧化鉀(N-P2O5-K2O) 20-5-10-60',NULL,'admin','台灣肥料股份有限公司',193),(1897,'農友牌氯化鉀',2,'',NULL,NULL,'氯化鉀肥料(3-01)','肥進(鉀)字第0365036號','鉀礦','水溶性氧化鉀 60%',NULL,'admin','台灣肥料股份有限公司',193),(1898,'農友牌生技12號有機質肥料',2,'','有機資審字第107039號',NULL,'雜項堆肥(5-11)','肥製(質)字第0042045號','菇類培植廢棄包、禽畜糞、蓖麻粕','全氮3.0%全磷酐3.0%全氧化鉀2.0%有機質70.0%',NULL,'admin','保證責任嘉義縣東石合作農場',27),(1899,'農友牌生技1號有機質肥料',2,'','有機資審字第100007號',NULL,'植物渣粕肥料(5-01)','肥製(質)字第0042024號','花生粕、米糠、芝麻粕、椰子粕、蓖麻粕、黃豆粕','全氮5%全磷酐2.5%全氧化鉀2.5%有機質81%',NULL,'admin','保證責任嘉義縣東石合作農場',27),(1900,'農友牌生技3號有機質肥料',2,'','有機資審字第103002號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0042035號','花生粕、米糠、芝麻粕、蔗渣、椰子粕、蓖麻粕','全氮5.0%全磷酐2.5%全氧化鉀2.5%有機質88%',NULL,'admin','保證責任嘉義縣東石合作農場',27),(1901,'農友牌過磷酸鈣',2,'',NULL,NULL,'過磷酸鈣肥料(2-01)','肥製(磷)字第0792026號','硫酸、磷礦','檸檬酸銨溶性磷酐18%',NULL,'admin','台灣肥料股份有限公司',193),(1902,'農和樂(祿芬隆)',3,'',NULL,'農藥製字第06274號',NULL,NULL,NULL,'(RS)-1-[2,5-dichloro-4-(1,1,2,3,3,3-hexafluoropropoxy)- phenyl]-3-(2,6-difluorobenzoyl)-urea  4.400 (%)',NULL,'admin','日農科技股份有限公司',105),(1903,'農基旺天下',2,'','有機資審字第107038號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0431081號','蓖麻粕、菜籽粕、花生粕、棕櫚粕、骨粉','全氮4.5%全磷酐2.4%全氧化鉀2.3%有機質85.0%',NULL,'admin','金農友企業股份有限公司',41),(1904,'農多利(菲克利)',3,'',NULL,'農藥製字第05205號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 10.000 (%)',NULL,'admin','大勝化學工業股份有限公司',110),(1905,'農大發(待克利)',3,'',NULL,'農藥進字第02999號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 10.000 (%)',NULL,'admin','嘉濱貿易有限公司',111),(1906,'農好勇(阿巴汀)',3,'',NULL,'農藥進字第02160號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%)',NULL,'admin','台灣瑪斯德股份有限公司',145),(1907,'農好喜多讚(亞托待克利)',3,'',NULL,'農藥進字第03312號',NULL,NULL,NULL,'(1) methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate...200 g/L (2) cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1-ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether...125 g/L 325 G/L (32.5% W/V)',NULL,'admin','台灣瑪斯德股份有限公司',145),(1908,'農好強(待克利)',3,'',NULL,'農藥進字第03290號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%) ',NULL,'admin','台灣瑪斯德股份有限公司',145),(1909,'農好治(祿芬隆)',3,'',NULL,'農藥進字第03216號',NULL,NULL,NULL,'(RS)-1-[2,5-dichloro-4-(1,1,2,3,3,3-hexafluoropropoxy)- phenyl]-3-(2,6-difluorobenzoyl)-urea  4.400 (%)',NULL,'admin','台灣瑪斯德股份有限公司',145),(1910,'農好稱大喜(亞托敏)',3,'',NULL,'農藥進字第02865號',NULL,NULL,NULL,'methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','台灣瑪斯德股份有限公司',145),(1911,'農好速安(賽速安)',3,'原生產商不同',NULL,'農藥進字第03499號 or 農藥進字第03500號',NULL,NULL,NULL,'3-(2-chloro-1,3-thiazol-5-ylmethyl)-5-methyl-1,3,5-oxadiazinan-4-ylidene(nitro)amine 25.000 (%) ',NULL,'admin','台灣瑪斯德股份有限公司',145),(1912,'農威(賽普護汰寧)',3,'',NULL,'農藥進字第03338號',NULL,NULL,NULL,'(1) 4-cyclopropyl-6-methyl-N-phenylpyrimidin-2-amine...37.5%(2) 4-(2,2-difluoro-1,3-benzodioxol-4-yl)pyrrole-3-carbonitrile...25%',NULL,'admin','朝暘生化開發有限公司',171),(1913,'農寶(依普同)',3,'',NULL,'農藥製字第04792號',NULL,NULL,NULL,'3-(3,5-dichlorophenyl)-N-isopropyl-2,4-dioxoimidazolidine-1-carboxamide  50.000 (%)',NULL,'admin','東和化學企業股份有限公司',109),(1914,'農寶牌農寶二號肥料',2,'','有機資審字第108017號',NULL,'禽畜糞堆肥(5-09)','肥製(質)字第0981002號','豬糞、菇類培植廢棄包','全氮3.0%全磷酐4.0%全氧化鉀1.5%有機質75.0%',NULL,'admin','漢寶農畜產企業股份有限公司',72),(1915,'農寶精(依普同)',3,'',NULL,' 農藥製字第04793號',NULL,NULL,NULL,'3-(3,5-dichlorophenyl)-N-isopropyl-2,4-dioxoimidazolidine-1-carboxamide  23.700 (%)',NULL,'admin','東和化學企業股份有限公司',109),(1916,'農得意(陶斯寧)',3,'',NULL,'農藥進字第02185號',NULL,NULL,NULL,'(1) O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate…22.5%  (2)(RS)-α-cyano-3-phenoxybenzyl (1RS)-cis-trans-3-(2,2-dichlorovinyl)-2,2-dimethylcyclopropanecarboxylate…2.5%',NULL,'admin','易利特開發有限公司',138),(1917,'農收多(甲基鋅乃浦)',3,'',NULL,'農藥製字第01395號',NULL,NULL,NULL,' polymeric zinc 1,2-propylenebis(dithiocarbamate)  70.000 (%)',NULL,'admin','中華民國農會附設各級農會農化廠',131),(1918,'農會寶(枯草桿菌Y1336)',3,'',NULL,'農藥製字第05096號',NULL,NULL,NULL,'BACILLUS SUBTILIS Y1336  VIABLE SPORES OF BACILLUS SUBTILIS Y1336 50% 1X10^9 CFU/G  以上',NULL,'admin','中華民國農會附設各級農會農化廠',131),(1919,'農會牌-新炭霜(待克利)',3,'',NULL,'農藥製字第05501號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%)',NULL,'admin','中華民國農會附設各級農會農化廠',131),(1920,'農會牌因滅汀(因滅汀)',3,'',NULL,'農藥製字第05518號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','中華民國農會附設各級農會農化廠',131),(1921,'農會贊(益達胺)',3,'',NULL,'農藥製字第04988號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%)',NULL,'admin','中華民國農會附設各級農會農化廠',131),(1922,'農會露(達滅芬)',3,'',NULL,'農藥製字第05848號',NULL,NULL,NULL,'(E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine  50.000 (%)',NULL,'admin','中華民國農會附設各級農會農化廠',131),(1923,'農有利(菲克利)',3,'',NULL,'農藥進字第03442號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 5.000  (%) ',NULL,'admin','貝士得開發企業有限公司',163),(1924,'農村牌地之肥',2,'','有機資審字第107012號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0270007號','肉骨粉、骨油、蓖麻粕、菜籽粕、玉米果粉、菸草屑','全氮5.5%全磷酐3.0%全氧化鉀1.8%有機質80.0%',NULL,'admin','崇容實業',60),(1925,'農沒蟲(因滅汀)',3,'',NULL,'農藥製字第05814號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','日農科技股份有限公司',105),(1926,'農治蟲(祿芬隆)',3,'',NULL,'農藥進字第03119號',NULL,NULL,NULL,'(RS)-1-[2,5-dichloro-4-(1,1,2,3,3,3-hexafluoropropoxy)- phenyl]-3-(2,6-difluorobenzoyl)-urea  4.400 (%)',NULL,'admin','國豐化學工業股份有限公司',112),(1927,'農益多-農皂',3,'','有機資審字第106023號','植保製字第00006號',NULL,NULL,NULL,'脂肪酸鹽類(皂鹽類)',NULL,'admin','東精生物科技有限公司',80),(1928,'農神牌五穀大帝有夠勇中勇',2,'','有機資審字第107008號',NULL,'植物渣粕肥料(5-01)','肥製(質)字第0738022號','菜籽粕、芝麻粕、椰子粕、蓖麻粕、黃豆粉、米糠','全氮5.5%全磷酐2.5%全氧化鉀2.1%有機質90.0%',NULL,'admin','豫豐實業有限公司',54),(1929,'農總好(四氯異苯腈)',3,'',NULL,'農藥製字第03783號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  75.000 (%)',NULL,'admin','富農化學工業股份有限公司',132),(1930,'農總水(四氯異苯腈)',3,'',NULL,'農藥製字第06501號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  40.000 (%)',NULL,'admin','富農化學工業股份有限公司',132),(1931,'農總讚(派滅淨)',3,'',NULL,'農藥製字第04390號',NULL,NULL,NULL,'(E)-4,5-dihydro-6-methyl-4-(3-pyridylmethyleneamino)-1,2,4- triazin-3(2H)-one 25.000 (%) ',NULL,'admin','富農化學工業股份有限公司',132),(1932,'農總通(三泰芬)',3,'',NULL,'農藥製字第04542號',NULL,NULL,NULL,'1-(4-chlorophenoxy)-3,3-dimethyl-1-(1H-1,2,4-triazol-1-yl)butan-2-one 5.000  (%)  ',NULL,'admin','台灣正豐植保股份有限公司',128),(1933,'農達牌永農生機426',2,'','有機資審字第108016號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0687037號','花生粕、芝麻粕、蓖麻粕、菸葉粉、棕櫚灰、麩皮','全氮4.0%全磷酐2.0%全氧化鉀6.2%有機質80.0%',NULL,'admin','綠林生物科技股份有限公司',34),(1934,'農金旺(白克列)',3,'',NULL,'農藥製字第06441號',NULL,NULL,NULL,'2-chloro-N-(4’-chlorobiphenyl-2-yl)nicotinamide 50.000 (%) ',NULL,'admin','日農科技股份有限公司',105),(1935,'農金旺精(白克列)',3,'',NULL,'農藥製字第06430號',NULL,NULL,NULL,'2-chloro-N-(4’-chlorobiphenyl-2-yl)nicotinamide 42.400 (%) ',NULL,'admin','日農科技股份有限公司',105),(1936,'農靈(納乃得)',3,'',NULL,'農藥製字第03073號',NULL,NULL,NULL,' S-methyl N-(methylcarbamoyloxy)thioacetimidate  40.000 (%)',NULL,'admin','好速化學股份有限公司',118),(1937,'迅雷(因滅汀)',3,'',NULL,'農藥製字第05651號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','光華化學股份有限公司',77),(1938,'迪迪特(賽速安)',3,'',NULL,'農藥進字第03418號',NULL,NULL,NULL,'3-(2-chloro-1,3-thiazol-5-ylmethyl)-5-methyl-1,3,5-oxadiazinan-4-ylidene(nitro)amine 25.000 (%) ',NULL,'admin','朝暘生化開發有限公司',171),(1939,'送喜(第滅寧)',3,'',NULL,'農藥進字第02311號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.400  (%)',NULL,'admin','易利特開發有限公司',138),(1940,'透冬水(菲克利)',3,'',NULL,'農藥進字第02168號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 10.000 (%) ',NULL,'admin','臺聯實業股份有限公司',107),(1941,'透欉青(貝芬菲克利)',3,'',NULL,'農藥製字第05066號',NULL,NULL,NULL,'(1) METHYL BENZIMIDAZOL-2-YLCARBAMATE..........24.5% (2) (RS)-2-(2,4-DICHLOROPHENYL)-1-(1H-1,2,4-TRIAZOL-1-YL)HEXAN-2-OL.........10%',NULL,'admin','臺聯實業股份有限公司',107),(1942,'透腳青(氫氧化銅)',3,'',NULL,'農藥製字第05008號',NULL,NULL,NULL,' CUPRIC HYDROXIDE  37.500 (%)',NULL,'admin','興農股份有限公司',85),(1943,'逗陣(益滅賽寧)',3,'',NULL,'農藥製字第03737號',NULL,NULL,NULL,'(1)O,O-dimethyl S-phthalimidomethyl phosphorodithioate…30%  (2)(RS)-α-cyano-3-phenoxybenzyl(1RS)-cis-trans-3-(2,2-dichlorovinyl)-2,2-dimethyl cyclopropanecarboxylate …10%',NULL,'admin','大勝化學工業股份有限公司',110),(1944,'這個好(賽普待克利)',3,'',NULL,'農藥進字第03213號',NULL,NULL,NULL,'(1) 4-CYCLOPROPYL-6-METHYL-N-PHENYLPYRIMIDIN-2-AMINE......25% (2) CIS,TRANS-3-CHLORO-4-[4-METHYL-2-(1H-1,2,4-TRIAZOL-1-YLMETHYL)-1,3-DIOXOLAN-2-YL)PHENYL-4-CHLOROPHENYL ETHER...................................................6.25% 31.250 (%) ',NULL,'admin','萬得發有限公司',125),(1945,'通勇(賽洛寧)',3,'',NULL,'農藥製字第05088號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.800  (%) ',NULL,'admin','富農化學工業股份有限公司',132),(1946,'通咬(亞滅培)',3,'',NULL,'農藥製字第05529號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%) ',NULL,'admin','臺聯實業股份有限公司',107),(1947,'通好(菲克利腐絕)',3,'',NULL,'農藥製字第04292號',NULL,NULL,NULL,'(1) (RS)-2-(2,4-DICHLOROPHENYL)-1-(1H-1,2,4-TRIAZOL-1-YL)HEXAN-2-OL...........................................2.8%(2) 2-(THIAZOL-4-YL)BENZIMIDAZOLE.....................20%',NULL,'admin','好速化學股份有限公司',118),(1948,'通寧(納乃得)',3,'',NULL,'農藥製字第02732號',NULL,NULL,NULL,' S-methyl N-(methylcarbamoyloxy)thioacetimidate  40.000 (%)',NULL,'admin','台灣正豐植保股份有限公司',128),(1949,'通殺寧(第滅寧)',3,'',NULL,'農藥製字第03814號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%)',NULL,'admin','惠光股份有限公司',121),(1950,'通用(第滅寧)',3,'',NULL,'農藥製字第05019號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.400  (%)',NULL,'admin','臺聯實業股份有限公司',107),(1951,'通蝨強固勇(亞滅培)',3,'',NULL,'農藥製字第05855號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%)',NULL,'admin','世大農化工廠股份有限公司	',114),(1952,'通順(貝芬同)',3,'',NULL,'農藥進字第01621號',NULL,NULL,NULL,'(1) methyl benzimidazol-2-ylcarbamate...25% (2) 3-(3,5-dichlorophenyl)-N-isopropyl-2,4-dioxoimidazolidine-1-carboxamide...25%',NULL,'admin','嘉濱貿易有限公司',111),(1953,'速克保(甲基多保淨)',3,'',NULL,'農藥進字第01855號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 70.000 (%)',NULL,'admin','恒欣股份有限公司',183),(1954,'速克寧(撲滅寧)',3,'',NULL,'農藥進字第01622號',NULL,NULL,NULL,' N-(3,5-dichlorophenyl)-1,2-dimethylcyclopropane-1,2-dicarboximide  50.000 (%)',NULL,'admin','嘉濱貿易有限公司',111),(1955,'速克達(四氯保淨)',3,'',NULL,'農藥製字第02826號',NULL,NULL,NULL,'(1) dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate)...20% (2) tetrachloroisophthalonitrile...50%',NULL,'admin','臺灣庵原農藥股份有限公司',113),(1956,'速利効(布芬益化利)',3,'',NULL,'農藥製字第04251號',NULL,NULL,NULL,'(1) (Z)-2-tert-butylimino-3-isopropyl-5-phenyl-1, 3, 5-thiadiazinan-4-one …10%              (2) (S)-α-cyano-3-phenoxybenzyl (S)-2-(4- chlorophenyl)-3-methylbutyrate …1% 11.000 (%) ',NULL,'admin','好速化學股份有限公司',118),(1957,'速利殺(蘇力菌)',3,'',NULL,'農藥進字第00779號',NULL,NULL,NULL,'BACILLUS THURINGIENSIS SUBSPECIES KURSTAKI SOLIDS, SPORES AND LEPIDOPTERAN ACTIVE TOXINS  (含量為微生物發固形物、孢子及殺蟲毒蛋白等之總量 16,000 IU/MG)  70.000 (%)',NULL,'admin','安農股份有限公司',156),(1958,'速利菌(待克利)',3,'',NULL,'農藥製字第05765號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%) ',NULL,'admin','好速化學股份有限公司',118),(1959,'速剋露(甲鋅毆殺斯)',3,'',NULL,'農藥製字第04649號',NULL,NULL,NULL,'(1) POLYMER ZINC 1,2-PROPYLENEBIS(DITHIOCARBAMATE).......56%(2) 2-METHOXY-N-(2-OXO-1,3-OXAZOLIDIN-3YL)-ACETO-2’,6’-    XYLIDIDE.............................................8%',NULL,'admin','好速化學股份有限公司',118),(1960,'速力寶(庫斯蘇力菌E-911)',3,'',NULL,'農藥製字第05500號',NULL,NULL,NULL,' Bacillus thuringiensis subsp. kurstaki strain E-911  60% (30,000 DBMU/MG)',NULL,'admin','福壽實業股份有限公司',25),(1961,'速力龍(佈飛松)',3,'',NULL,'農藥進字第00771號',NULL,NULL,NULL,'O-4-bromo-2-chlorophenyl O-ethyl S-propyl phosphorothioate 500 G/L (50% W/V)',NULL,'admin','台灣先正達股份有限公司',144),(1962,'速可脫(馬拉松)',3,'',NULL,'農藥製字第02503號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 25.000 (%)',NULL,'admin','臺益工業股份有限公司',39),(1963,'速喜精(依普同)',3,'',NULL,'農藥進字第03419號',NULL,NULL,NULL,'3-(3,5-dichlorophenyl)-N-isopropyl-2,4-dioxoimidazolidine-1-carboxamide  23.700 (%)',NULL,'admin','威玖生技有限公司',142),(1964,'速好掌(益達胺)',3,'',NULL,'農藥製字第05799號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 18.200 (%) ',NULL,'admin','好速化學股份有限公司',118),(1965,'速威(賽普護汰寧)',3,'',NULL,'農藥進字第01925號',NULL,NULL,NULL,'(1) 4-cyclopropyl-6-methyl-N-phenylpyrimidin-2-amine...37.5%(2) 4-(2,2-difluoro-1,3-benzodioxol-4-yl)pyrrole-3-carbonitrile...25% 62.500 (%)',NULL,'admin','台灣先正達股份有限公司',144),(1966,'速敏(加保利)',3,'',NULL,'農藥製字第00264號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 85.000 (%)',NULL,'admin','光華化學股份有限公司',77),(1967,'速施蟲(陶斯松)',3,'',NULL,'農藥製字第04333號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 25.000 (%) ',NULL,'admin','好速化學股份有限公司',118),(1968,'速果丹(益發靈)',3,'',NULL,'農藥製字第04622號',NULL,NULL,NULL,'N-DICHLOROFLUOROMETHYLTHIO-N’,N’-DIMETHYL-N-PHENYLSULFAMIDE 50.000 (%) ',NULL,'admin','好速化學股份有限公司',118),(1969,'速樂農(第滅寧)',3,'',NULL,'農藥製字第02811號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%) ',NULL,'admin','立農化學股份有限公司',143),(1970,'速殺掌(益達胺)',3,'',NULL,'農藥製字第05090號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%)  ',NULL,'admin','好速化學股份有限公司',118),(1971,'速治寧(四氯異苯腈)',3,'',NULL,'農藥製字第03660號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  75.000 (%)',NULL,'admin','利台化學工業股份有限公司',116),(1972,'速治蟲(佈飛松)',3,'',NULL,'農藥進字第02213號',NULL,NULL,NULL,'O-4-bromo-2-chlorophenyl O-ethyl S-propyl phosphorothioate 43.000 (%) ',NULL,'admin','合林企業有限公司',166),(1973,'速滅汀(因滅汀)',3,'',NULL,'農藥製字第05842號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','好速化學股份有限公司',118),(1974,'速滅薊(滅賜克)',3,'',NULL,'農藥製字第04623號',NULL,NULL,NULL,'4-METHYLTHIO-3,5-XYLYL-METHYLCARBAMATE 50.000 (%) ',NULL,'admin','好速化學股份有限公司',118),(1975,'速滅露(四氯異苯腈)',3,'',NULL,'農藥製字第05644號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  40.000 (%)',NULL,'admin','正農化學股份有限公司',130),(1976,'速疫清(達滅芬)',3,'',NULL,'農藥製字第05773號',NULL,NULL,NULL,'(E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine  50.000 (%)',NULL,'admin','好速化學股份有限公司',118),(1977,'速百威(益達胺)',3,'',NULL,'農藥進字第03063號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%)    ',NULL,'admin','嘉濱貿易有限公司',111),(1978,'速益寧(撲滅寧)',3,'',NULL,'農藥進字第00829號',NULL,NULL,NULL,' N-(3,5-dichlorophenyl)-1,2-dimethylcyclopropane-1,2-dicarboximide  50.000 (%)',NULL,'admin','生力化學工業股份有限公司',139),(1979,'速絕(亞滅培)',3,'',NULL,'農藥進字第02850號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%)',NULL,'admin','美商雅柏生活科技有限公司臺灣分公司',148),(1980,'速綠佳(碳酸氫鉀)',3,'',NULL,'農藥進字第02112號',NULL,NULL,NULL,'POTASSIUM HYDROGENCARBONATE 80.000 (%)',NULL,'admin','立農化學股份有限公司',143),(1981,'速落寧(伽瑪賽洛寧)',3,'',NULL,'農藥進字第02353號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate 1.500  (%) ',NULL,'admin','台灣富美實有限公司',140),(1982,'速速安(賽速安)',3,'',NULL,'農藥製字第06355號',NULL,NULL,NULL,'3-(2-chloro-1,3-thiazol-5-ylmethyl)-5-methyl-1,3,5-oxadiazinan-4-ylidene(nitro)amine 25.000 (%) ',NULL,'admin','臺灣庵原農藥股份有限公司',113),(1983,'速配(鋅錳克絕)',3,'',NULL,'農藥製字第04975號',NULL,NULL,NULL,'(1) 1-(2-cyano-2-methoxyiminoacetyl)-3-ethylurea…8% (2) manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt…64%',NULL,'admin','臺聯實業股份有限公司',107),(1984,'速霸露(達滅芬)',3,'',NULL,'農藥製字第05708號',NULL,NULL,NULL,'(E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine  50.000 (%)',NULL,'admin','臺灣庵原農藥股份有限公司',113),(1985,'逢禧精(第滅寧)',3,'',NULL,'農藥製字第06410號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.400  (%)   ',NULL,'admin','台農三和化工股份有限公司',119),(1986,'連環炮(亞托待克利)',3,'',NULL,'農藥製字第06090號',NULL,NULL,NULL,'(1) methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate...200 g/L (2) cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1-ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether...125 g/L 325 G/L (32.5% W/V)',NULL,'admin','利台化學工業股份有限公司',116),(1987,'過好冬(加保扶)',3,'',NULL,'農藥製字第06491號',NULL,NULL,NULL,'2,3-dihydro-2,2-dimethylbenzofuran-7-yl methylcarbamate  3.000 (%)',NULL,'admin','台農三和化工股份有限公司',119),(1988,'道氏本(陶斯松)',3,'',NULL,'農藥進字第00078號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%)',NULL,'admin','生力化學工業股份有限公司',139),(1989,'道禮農順(陶斯寧)',3,'',NULL,'農藥進字第01890號',NULL,NULL,NULL,'(1) O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate…45.45% (2) (RS)-α-cyano-3-phenoxybenzyl (1RS)-cis-trans-3-(2,2-dichlorovinyl)-2,2-dimethylcyclopropanecarboxylate…4.55%',NULL,'admin','台灣道禮股份有限公司',174),(1990,'道禮金大生M-45(錳乃浦)',3,'',NULL,'農藥進字第00428號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','台灣道禮股份有限公司',174),(1991,'道禮金大生Ｍ–４５(錳乃浦)',3,'',NULL,'農藥進字第00866號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','台灣道禮股份有限公司',174),(1992,'達克尼克(四氯異苯腈)',3,'',NULL,'農藥製字第03525號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  75.000 (%)',NULL,'admin','臺益工業股份有限公司',39),(1993,'達克爛(大克爛)',3,'',NULL,'農藥製字第00158號',NULL,NULL,NULL,'2,6-DICHLORO-4-NITROANILINE 50.000 (%)',NULL,'admin','日農科技股份有限公司',105),(1994,'達克靈．精(四氯異苯腈)',3,'',NULL,'農藥進字第01086號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  40.000 (%)',NULL,'admin','瑞繐股份有限公司',168),(1995,'達冠精(第滅寧)',3,'',NULL,'農藥製字第05951號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.400  (%) ',NULL,'admin','世大農化工廠股份有限公司	',114),(1996,'達剋能粒(四氯異苯腈)',3,'',NULL,'農藥進字第00677號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  75.000 (%)',NULL,'admin','德方有限公司',175),(1997,'達可尼 40%(四氯異苯腈)',3,'',NULL,'農藥進字第02975號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  40.000 (%)',NULL,'admin','朝暘生化開發有限公司',171),(1998,'達可尼(四氯異苯腈)',3,'',NULL,'農藥進字第02974號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  75.000 (%)',NULL,'admin','朝暘生化開發有限公司',171),(1999,'達喜 0.055%(第滅寧)',3,'',NULL,'農藥製字第04900號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 0.055  (%)',NULL,'admin','興農股份有限公司',85),(2000,'達喜 0.5%(第滅寧)',3,'',NULL,'農藥製字第04755號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 0.500  (%) ',NULL,'admin','興農股份有限公司',85),(2001,'達喜 2.8%(第滅寧)',3,'',NULL,'農藥製字第01837號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%)  ',NULL,'admin','興農股份有限公司',85),(2002,'達喜精(第滅寧)',3,'',NULL,'農藥製字第04936號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.400  (%) ',NULL,'admin','興農股份有限公司',85),(2003,'達官(第滅寧)',3,'',NULL,'農藥進字第02178號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%) ',NULL,'admin','現達國際生物科技有限公司',177),(2004,'達德寧(第滅寧)',3,'',NULL,'農藥進字第02370號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.400  (%)   ',NULL,'admin','現達國際生物科技有限公司',177),(2005,'達摩掌(益達胺)',3,'',NULL,'農藥製字第05307號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%)',NULL,'admin','安旺特股份有限公司',120),(2006,'達滅速(大滅松)',3,'',NULL,'農藥製字第04402號',NULL,NULL,NULL,' O, O-dimethyl-S-methylcarbamoylmethyl phosphorodithioate  44.000 (%)',NULL,'admin','興農股份有限公司',85),(2007,'達特靈天然有機殺蟲劑(矽藻土)',3,'','有機資審字第105012號','植保進字第00011號',NULL,NULL,NULL,'矽藻土',NULL,'admin','潤麒實業有限公司',79),(2008,'達異精(四氯異苯腈)',3,'',NULL,'農藥製字第05667號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  40.000 (%)',NULL,'admin','光華化學股份有限公司',77),(2009,'達益靈(四氯異苯腈)',3,'',NULL,'農藥製字第02147號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  75.000 (%)',NULL,'admin','光華化學股份有限公司',77),(2010,'達立寧(第滅寧)',3,'',NULL,'農藥製字第06360號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%) ',NULL,'admin','立農化學股份有限公司',143),(2011,'達菌能－精(四氯異苯腈)',3,'',NULL,'農藥製字第06112號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  40.000 (%)',NULL,'admin','世大農化工廠股份有限公司	',114),(2012,'達農產(賽達松)',3,'',NULL,'農藥進字第02522號',NULL,NULL,NULL,' S-α-ethoxycarbonylbenzyl O,O-dimethyl phosphorodithioate  50.000 (%)',NULL,'admin','貝士得開發企業有限公司',163),(2013,'達陞粉(錳乃浦)',3,'',NULL,'農藥進字第03521號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','現達國際生物科技有限公司',177),(2014,'達露(四氯異苯腈)',3,'',NULL,'農藥製字第02237號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  75.000 (%)',NULL,'admin','安旺特股份有限公司',120),(2015,'酷斯拉(菲克利)',3,'',NULL,'農藥製字第05774號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 23.000 (%)  ',NULL,'admin','利台化學工業股份有限公司',116),(2016,'金-億級棒(快得寧)',3,'',NULL,'農藥進字第03105號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 33.500 (%) ',NULL,'admin','萬得發有限公司',125),(2017,'金-泰勇(平克座)',3,'',NULL,'農藥製字第05670號',NULL,NULL,NULL,'1-(2,4-dichloro-β-propylphenethyl)-1H-1,2,4-triazole 25.000 (%)',NULL,'admin','國豐化學工業股份有限公司',112),(2018,'金-立農靈(百利普芬)',3,'',NULL,'農藥製字第05502號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 11.000 (%)   ',NULL,'admin','立農化學股份有限公司',143),(2019,'金-農無蟲(祿芬隆)',3,'',NULL,'農藥進字第02994號',NULL,NULL,NULL,'(RS)-1-[2,5-dichloro-4-(1,1,2,3,3,3-hexafluoropropoxy)- phenyl]-3-(2,6-difluorobenzoyl)-urea  4.400 (%)',NULL,'admin','萬得發有限公司',125),(2020,'金─治疫讚(右滅達樂)',3,'',NULL,'農藥進字第02085號',NULL,NULL,NULL,' methyl N-(methoxyacetyl)-N-(2,6-xylyl)-D-alaninate  2.500 (%)',NULL,'admin','台灣先正達股份有限公司',144),(2021,'金─高手(銅右滅達樂)',3,'',NULL,'農藥進字第03193號',NULL,NULL,NULL,'(1) methyl N-(methoxyacetyl)-N-(2,6-xylyl)-D-alaninate...2.5%(2) copper oxychloride...69.1%',NULL,'admin','台灣先正達股份有限公司',144),(2022,'金代捕完(百利普芬)',3,'',NULL,'農藥進字第02698號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 11.000 (%)',NULL,'admin','萬得發有限公司',125),(2023,'金佰利(益達胺)',3,'',NULL,'農藥進字第03098號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 18.200 (%) ',NULL,'admin','嘉濱貿易有限公司',111),(2024,'金保淨(甲基多保淨)',3,'',NULL,'農藥製字第02643號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 70.000 (%)  ',NULL,'admin','正農化學股份有限公司',130),(2025,'金優銹(菲克利)',3,'',NULL,'農藥製字第05805號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 23.000 (%) ',NULL,'admin','臺益工業股份有限公司',39),(2026,'金利果(本達樂)',3,'',NULL,'農藥進字第02241號',NULL,NULL,NULL,' methyl N-phenylacetyl-N-2,6-xylyl-DL-alaninate  35.000 (%)',NULL,'admin','翰金興業有限公司',165),(2027,'金加味(鋅錳克絕)',3,'',NULL,'農藥進字第02758號',NULL,NULL,NULL,'(1) 1-(2-cyano-2-methoxyiminoacetyl)-3-ethylurea…8% (2) manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt…64%',NULL,'admin','保加利亞商艾格立亞股份有限公司台灣分公司',167),(2028,'金勇固',2,'107/8/1原「純德牌維生寶622」變更名稱','有機資審字第106005號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0431097號','蓖麻粕、椰子粕、花生粕、芝麻粕、骨粉','全氮6.0%全磷酐2.0%全氧化鉀2.0%有機質85.0%',NULL,'admin','金農友企業股份有限公司',41),(2029,'金多利(四克利)',3,'',NULL,'農藥製字第06468號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-3-(1H-1,2,4-triazol-1-yl)propyl 1,1,2,2-tetrafluoroethyl ether 10.700 (%)',NULL,'admin','聯利農業科技股份有限公司',103),(2030,'金大富(百利普芬)',3,'',NULL,'農藥進字第02811號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 11.000 (%) ',NULL,'admin','貝士得開發企業有限公司',163),(2031,'金太寶(庫斯蘇力菌ABTS-351)',3,'',NULL,'農藥進字第02888號',NULL,NULL,NULL,' Bacillus thuringiensis subsp. kurstaki strain ABTS-351 fermentation solids, spores and insecticidal tonxins ... 54%; 32000 IU/mg  54.000 (%)',NULL,'admin','台灣住友化學股份有限公司',160),(2032,'金好勇(陶斯松)',3,'',NULL,'農藥製字第06524號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 50.000 (%) ',NULL,'admin','光華化學股份有限公司',77),(2033,'金好用(百利普芬)',3,'',NULL,'農藥製字第06158號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 11.000 (%) ',NULL,'admin','國豐化學工業股份有限公司',112),(2034,'金富丹(菲克利腐絕)',3,'',NULL,'農藥製字第04293號',NULL,NULL,NULL,'(1) (RS)-2-(2,4-DICHLOROPHENYL)-1-(1H-1,2,4-TRIAZOL-1-YL)HEXAN-2-OL.............................................3% (2) 2-(THIAZOL-4-YL)BENZIMIDAZOLE.....................20%',NULL,'admin','好速化學股份有限公司',118),(2035,'金富貴(益達胺)',3,'',NULL,'農藥進字第02228號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%) ',NULL,'admin','瑞福企業有限公司',162),(2036,'金寶滿',2,'','有機資審字第103021號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0431072號','蓖麻粕、菜籽粕、椰子粕、花生粕、芝麻粕、骨粉','全氮6%全磷酐4.0%全氧化鉀2.0%有機質85%',NULL,'admin','金農友企業股份有限公司',41),(2037,'金峰2號地勇',2,'','有機資審字第108006號',NULL,'禽畜糞堆肥(5-09)','肥製(質)字第0666020號','禽畜糞、粗糠','全氮3.0%全磷酐2.5%全氧化鉀2.0%有機質50.0%',NULL,'admin','金峰生物科技有限公司',59),(2038,'金峰5號農勇',2,'108/4/25原「農勇有機質肥料」變更名稱','有機資審字第107009號',NULL,'雜項堆肥(5-11)','肥製(質)字第0666015號','禽畜糞、蓖麻粕、米糠、粗糠','全氮3.0%全磷酐2.1%全氧化鉀2.0%有機質60.0%',NULL,'admin','金峰生物科技有限公司',59),(2039,'金峰8號地寶',2,'108/4/25原「金峰牌地寶」變更名稱','有機資審字第107020號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0666016號','蓖麻粕、米糠','全氮5.0% 全磷酐2.1% 全氧化鉀2.1% 有機質80.0%',NULL,'admin','金峰生物科技有限公司',59),(2040,'金希望(貝芬菲克利)',3,'',NULL,'農藥製字第05413號',NULL,NULL,NULL,'(1) METHYL BENZIMIDAZOL-2-YLCARBAMATE..........24.5%(2) (RS)-2-(2,4-DICHLOROPHENYL)-1-(1H-1,2,4-TRIAZOL-1-YL)HEXAN-2-OL.........10%',NULL,'admin','惠光股份有限公司',121),(2041,'金得利(第滅寧)',3,'',NULL,'農藥製字第04686號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%)  ',NULL,'admin','臺聯實業股份有限公司',107),(2042,'金快殺(因得克)',3,'',NULL,'農藥進字第03509號',NULL,NULL,NULL,' methyl (S)-N-[7-chloro-2,3,4a,5-tetrahydro-4a-(methoxycarbonyl)indeno[1,2-e][1,3,4]oxadiazin-2-ylcarbonyl]-4’-(trifluoromethoxy)carbanilate  14.500 (%)',NULL,'admin','安農股份有限公司',156),(2043,'金抗蟲地(托福松)',3,'',NULL,'農藥製字第04376號',NULL,NULL,NULL,' S-tert-butylthiomethyl O,O-diethyl phosphorodithioate  10.000 (%)',NULL,'admin','臺益工業股份有限公司',39),(2044,'金押霸(陶斯寧)',3,'',NULL,'農藥製字第03932號',NULL,NULL,NULL,'(1) O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate…22.5% (2)(RS)-α-cyano-3-phenoxybenzyl (1RS)-cis-trans-3-(2,2-dichlorovinyl)-2,2-dimethylcyclopropanecarboxylate…2.5%',NULL,'admin','世大農化工廠股份有限公司	',114),(2045,'金旺牌有機質肥料',2,'','有機資審字第108024號',NULL,'一般堆肥(5-10)','肥製(質)字第0280010號','禽畜糞、菇類培植廢棄包、豆粕、蓖麻粕、米糠','全氮3.0%全磷酐3.0%全氧化鉀2.0%有機質60.0%',NULL,'admin','金大堆肥共同處理場',71),(2046,'金旺生-四五(錳乃浦)',3,'',NULL,'農藥進字第02879號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','安旺特股份有限公司',120),(2047,'金有效(第滅寧)',3,'',NULL,'農藥進字第01110號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%) ',NULL,'admin','全臺農藥有限公司',182),(2048,'金果多(得克利)',3,'',NULL,'農藥製字第05269號',NULL,NULL,NULL,'(RS)-1-p-chlorophenyl-4,4-dimethyl-3-(1H-1,2,4-triazol-1- ylmethyl)pentan-3-ol 25.900 (%) ',NULL,'admin','國豐化學工業股份有限公司',112),(2049,'金正勇(陶斯松)',3,'',NULL,'農藥進字第02238號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 50.000 (%)  ',NULL,'admin','台灣富美實有限公司',140),(2050,'金正安(益達胺)',3,'',NULL,'農藥進字第02534號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 18.200 (%)',NULL,'admin','台灣富美實有限公司',140),(2051,'金正強(阿巴汀)',3,'',NULL,'農藥進字第02452號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%) ',NULL,'admin','台灣富美實有限公司',140),(2052,'金正美(得克利)',3,'',NULL,'農藥製字第05674號',NULL,NULL,NULL,'(RS)-1-p-chlorophenyl-4,4-dimethyl-3-(1H-1,2,4-triazol-1- ylmethyl)pentan-3-ol 25.900 (%) ',NULL,'admin','臺益工業股份有限公司',39),(2053,'金沙利(益達胺)',3,'',NULL,'農藥進字第02331號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%)  ',NULL,'admin','翰金興業有限公司',165),(2054,'金沙掌(益達胺)',3,'',NULL,'農藥進字第02024號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 18.200 (%)',NULL,'admin','台灣拜耳股份有限公司',101),(2055,'金滅菌(待克利)',3,'',NULL,'農藥製字第05663號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%)',NULL,'admin','國豐化學工業股份有限公司',112),(2056,'金滿天星(畢芬寧)',3,'',NULL,'農藥製字第06164號',NULL,NULL,NULL,'2-methylbiphenyl-3-ylmethyl (Z)-(1RS,3RS)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate  2.500 (%)',NULL,'admin','國豐化學工業股份有限公司',112),(2057,'金滿點(撲滅寧)',3,'',NULL,'農藥進字第03157號',NULL,NULL,NULL,' N-(3,5-dichlorophenyl)-1,2-dimethylcyclopropane-1,2-dicarboximide  50.000 (%)',NULL,'admin','安旺特股份有限公司',120),(2058,'金炭吉(亞托敏)',3,'',NULL,'農藥製字第05998號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','立農化學股份有限公司',143),(2059,'金爍爍(因滅汀)',3,'',NULL,'農藥製字第05306號',NULL,NULL,NULL,'因滅汀 5%',NULL,'admin','惠光股份有限公司',121),(2060,'金牌(達滅芬)',3,'',NULL,'農藥進字第02375號',NULL,NULL,NULL,'(E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine  50.000 (%)',NULL,'admin','臺聯實業股份有限公司',107),(2061,'金牌農金肥6號',2,'','有機資審字第106001號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0738007號','菜籽粕、蓖麻粕、花生粕、芝麻粕、肉骨粉、米糠、麩皮','全氮5.5%全磷酐3.0%全氧化鉀2.1%有機質80.0%',NULL,'admin','豫豐實業有限公司',54),(2062,'金祥泰(達滅芬)',3,'',NULL,'農藥製字第05256號',NULL,NULL,NULL,'(E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine  50.000 (%)',NULL,'admin','嘉泰企業股份有限公司',102),(2063,'金福連殺(益滅賽寧)',3,'',NULL,'農藥製字第04485號',NULL,NULL,NULL,'(1)O,O-dimethyl S-phthalimidomethyl phosphorodithioate…30%  (2)(RS)-α-cyano-3-phenoxybenzyl(1RS)-cis-trans-3-(2,2-dichlorovinyl)-2,2-dimethyl cyclopropanecarboxylate …10%',NULL,'admin','國豐化學工業股份有限公司',112),(2064,'金禾收(菲克利)',3,'',NULL,'農藥進字第02965號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 10.000 (%)',NULL,'admin','嘉濱貿易有限公司',111),(2065,'金稱(亞托敏)',3,'',NULL,'農藥製字第05947號',NULL,NULL,NULL,'methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','洽益化學股份有限公司',108),(2066,'金紅(亞托敏)',3,'',NULL,'農藥進字第02823號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','台灣富美實有限公司',140),(2067,'金羅力(硫敵克)',3,'',NULL,'農藥製字第05175號',NULL,NULL,NULL,'3,7,9,13-tetramethyl-5,11-dioxa-2,8,14-trithia-4,7,9,12-tetra-azapentadeca-3,12-diene-6,10-dione 75.000 (%)',NULL,'admin','興農股份有限公司',85),(2068,'金菜園(賜諾殺)',3,'',NULL,'農藥進字第01995號',NULL,NULL,NULL,'A MIXTURE OF SPINOSYN A AND SPINOSYN D 2.500  (%)',NULL,'admin','台灣道禮股份有限公司',174),(2069,'金豐收',2,'','有機資審字第108001號',NULL,'液態有機質肥料(5-15)','肥製(質)字第0666018號','肉骨粉、豆粕、米糠','全氮3.9%全磷酐3.9%全氧化鉀2.1%有機質30.0%',NULL,'admin','金峰生物科技有限公司',59),(2070,'金財源(克收欣)',3,'',NULL,'農藥進字第03481號',NULL,NULL,NULL,' methyl (E)-methoxyimino[2-(o-tolyloxymethyl)phenyl]acetate  50.000 (%)',NULL,'admin','嘉濱貿易有限公司',111),(2071,'金賀喜(亞托敏)',3,'',NULL,'農藥製字第06211號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','光華化學股份有限公司',77),(2072,'金賀炭(待克利)',3,'',NULL,'農藥製字第06018號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%)',NULL,'admin','光華化學股份有限公司',77),(2073,'金賽滅地(福瑞松)',3,'',NULL,'農藥製字第04578號',NULL,NULL,NULL,' O,O-diethyl S-ethylthiomethyl phosphorodithioate  10.000 (%)',NULL,'admin','臺益工業股份有限公司',39),(2074,'金贊(亞滅培)',3,'',NULL,'農藥製字第05714號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%)',NULL,'admin','嘉泰企業股份有限公司',102),(2075,'金輕鬆(待克利)',3,'',NULL,'農藥製字第05682號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%)',NULL,'admin','臺益工業股份有限公司',39),(2076,'金農夫(賽洛寧)',3,'',NULL,'農藥製字第04884號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.800  (%)   ',NULL,'admin','國豐化學工業股份有限公司',112),(2077,'金速效(因滅汀)',3,'',NULL,'農藥製字第05808號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','臺聯實業股份有限公司',107),(2078,'金鋼棒(益達胺)',3,'',NULL,'農藥製字第05462號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 18.200 (%) ',NULL,'admin','嘉泰企業股份有限公司',102),(2079,'金錢牌有機質肥料3號',2,'','有機資審字第108015號',NULL,'植物渣粕肥料(5-01)','肥製(質)字第0517003號','黃豆粉、菜籽粕、蓖麻粕、米糠','全氮6.0%全磷酐2.1%全氧化鉀1.8%有機質78.0%',NULL,'admin','富祥肥料股份有限公司',70),(2080,'金鐘罩(撲滅寧)',3,'',NULL,'農藥進字第01600號',NULL,NULL,NULL,'N-(3,5-dichlorophenyl)-1,2-dimethylcyclopropane-1,2-dicarboximide  50.000 (%)',NULL,'admin','東鋒股份有限公司',154),(2081,'金雞牌賜倍效(枯草桿菌WG6-14)',3,'',NULL,'農藥製字第05348號',NULL,NULL,NULL,'BACILLUS SUBTILIS WG6-14 1×10^10 CFU/ML',NULL,'admin','沅渼生物科技股份有限公司',69),(2082,'金鼎勇(因滅汀)',3,'',NULL,'農藥進字第02602號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','鴻鋒化學有限公司',134),(2083,'銅介勇(氫氧化銅)',3,'',NULL,'農藥製字第06303號',NULL,NULL,NULL,' CUPRIC HYDROXIDE  53.800 (%)',NULL,'admin','臺聯實業股份有限公司',107),(2084,'銅介稱(氫氧化銅)',3,'',NULL,'農藥進字第03510號',NULL,NULL,NULL,' CUPRIC HYDROXIDE  53.800 (%)',NULL,'admin','嘉濱貿易有限公司',111),(2085,'銅介讚(嘉賜銅)',3,'',NULL,'農藥製字第06245號',NULL,NULL,NULL,'(1) [5-amino-2-methyl-6-(2,3,4,5,6,-pentahydroxycyclohexyloxy) tetrahydropyran-3-yl] amino-α-iminoacetic acid hydrochloride hydrate...5.7% ( Kasugamycin...5% ) (2) copper oxychloride (CU 45%)...75.6%',NULL,'admin','日農科技股份有限公司',105),(2086,'銅佳猛(銅錳乃浦)',3,'',NULL,'農藥製字第04891號',NULL,NULL,NULL,'(1) MANGANESE ETHYLENEBISDITHIOCARBAMATE...30%               (2) COPPER SULPHATE (CU 13%)...52%',NULL,'admin','聯利農業科技股份有限公司',103),(2087,'銅優多(氫氧化銅)',3,'',NULL,'農藥製字第05728號',NULL,NULL,NULL,' CUPRIC HYDROXIDE  37.500 (%)',NULL,'admin','聯利農業科技股份有限公司',103),(2088,'銅司令(快得寧)',3,'',NULL,'農藥製字第03102號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 40.000 (%) ',NULL,'admin','聯利農業科技股份有限公司',103),(2089,'銅尚讚(三元硫酸銅)',3,'',NULL,' 農藥製字第05010號',NULL,NULL,NULL,'cupric sulfate-tricupric hydroxide (Cu...14.94%(W/W)) 27.120 (%) ',NULL,'admin','好速化學股份有限公司',118),(2090,'銅快樂(快得寧)',3,'',NULL,'農藥製字第04823號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 40.000 (%) ',NULL,'admin','臺聯實業股份有限公司',107),(2091,'銅霸王(硫酸快得寧)',3,'',NULL,'農藥製字第03565號',NULL,NULL,NULL,'(1) COPPER-8-QUINOLATE 10%  (2) BASIC COPPER SULFATE 29% (CU 16%) 39.000 (%)',NULL,'admin','聯利農業科技股份有限公司',103),(2092,'銅高尚(三元硫酸銅)',3,'',NULL,'農藥進字第01376號',NULL,NULL,NULL,'cupric sulfate-tricupric hydroxide (Cu...14.94%(W/W)) 27.120 (%)      ',NULL,'admin','台灣日產化工股份有限公司',104),(2093,'銹紋清(菲克利)',3,'',NULL,'農藥進字第02076號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 10.000 (%)',NULL,'admin','台灣沙爾達有限公司',192),(2094,'銹露能(四氯異苯腈)',3,'',NULL,'農藥進字第01051號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  40.000 (%)',NULL,'admin','德方有限公司',175),(2095,'鋅錳天王(錳乃浦)',3,'',NULL,'農藥進字第01981號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','安農股份有限公司',156),(2096,'鋼鐵人(達特南)',3,'',NULL,'農藥進字第03393號',NULL,NULL,NULL,'(RS)-1-methyl-2-nitro-3-(tetrahydro-3-furylmethyl)guanidine 20.000 (%) ',NULL,'admin','安旺特股份有限公司',120),(2097,'鐵力士(益達胺)',3,'',NULL,'農藥進字第02808號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%)',NULL,'admin','松樹國際有限公司',137),(2098,'鐵定讚(益達胺)',3,'',NULL,'農藥製字第06033號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 18.200 (%)  ',NULL,'admin','富農化學工業股份有限公司',132),(2099,'鐵布衫 2%(益達胺)',3,'',NULL,'農藥製字第04617號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 2.000  (%)   ',NULL,'admin','興農股份有限公司',85),(2100,'鐵布衫 9.6%(益達胺)',3,'',NULL,'農藥製字第04408號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%) ',NULL,'admin','興農股份有限公司',85),(2101,'鐵捕(益達胺)',3,'',NULL,'農藥進字第02861號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 18.200 (%)',NULL,'admin','雋農實業股份有限公司',136),(2102,'鐵捕頭(益達胺)',3,'',NULL,'農藥進字第02262號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%)   ',NULL,'admin','易利特開發有限公司',138),(2103,'鐵支露(鋅錳克絕)',3,'',NULL,'農藥進字第02806號',NULL,NULL,NULL,'(1) 1-(2-cyano-2-methoxyiminoacetyl)-3-ethylurea…8% (2) manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt…64%',NULL,'admin','台灣日產化工股份有限公司',104),(2104,'鐵榔頭(益達胺)',3,'',NULL,'農藥進字第02947號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 18.200 (%)   ',NULL,'admin','恒欣股份有限公司',183),(2105,'鐵煞星(益達胺)',3,'',NULL,'農藥進字第02324號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%)   ',NULL,'admin','合林企業有限公司',166),(2106,'鐵牛牌高效能6號',2,'','有機資審字第102011號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0039011號','黃豆、黃豆粕、米糠粕、菜仔粕、花生粕、酒糟粕、煙葉','全氮4.2%全磷酐2.0%全氧化鉀2.0%有機質81%',NULL,'admin','長岡化工股份有限公司',35),(2107,'鐵狀元(益達胺)',3,'',NULL,'農藥製字第06152號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%) ',NULL,'admin','台灣正豐植保股份有限公司',128),(2108,'鐵衛(益達胺)',3,'',NULL,'農藥進字第02876號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%) ',NULL,'admin','朝暘生化開發有限公司',171),(2109,'鐵金剛(達特南)',3,'',NULL,'農藥進字第02298號',NULL,NULL,NULL,'(RS)-1-methyl-2-nitro-3-(tetrahydro-3-furylmethyl)guanidine 20.000 (%)',NULL,'admin','惠光股份有限公司',121),(2110,'鐵關公(益達胺)',3,'',NULL,'農藥進字第03027號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 18.200 (%)  ',NULL,'admin','萬得發有限公司',125),(2111,'鐵頭功(益達胺)',3,'',NULL,'農藥製字第06593號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 28.800 (%)',NULL,'admin','惠光股份有限公司',121),(2112,'長好(得芬諾)',3,'',NULL,'農藥進字第02477號',NULL,NULL,NULL,' N-tert-butyl-N’-(4-ethylbenzoyl)-3,5-dimethylbenzohydrazide  19.700 (%)',NULL,'admin','雅飛有限公司',126),(2113,'長岡牌豐田3號',2,'','有機資審字第107017號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0039005號','花生粕、黃豆粕、菜籽粕、蓖麻粕、肉骨粉(含魚渣)','全氮5.0%全磷酐3.0%全氧化鉀3.0%有機質78.6%',NULL,'admin','長岡化工股份有限公司',35),(2114,'長欣(得克利)',3,'',NULL,'農藥製字第05567號',NULL,NULL,NULL,'(RS)-1-p-chlorophenyl-4,4-dimethyl-3-(1H-1,2,4-triazol-1- ylmethyl)pentan-3-ol 25.900 (%) ',NULL,'admin','日農科技股份有限公司',105),(2115,'長興牌活綠旺2號',2,'','有機資審字第108002號',NULL,'一般堆肥(5-10)','肥製(質)字第0471027號','花生粕、米糠、菇類培植廢棄包','全氮2.5%全磷酐1.5%全氧化鉀1.5%有機質78.4%',NULL,'admin','長興生物科技股份有限公司',65),(2116,'長興牌花生粕',2,'','有機資審字第107016號',NULL,'植物渣粕肥料(5-01)','肥製(質)字第0471019號','花生粕','全氮7.0%全磷酐1.4%全氧化鉀1.4%有機質94.8%',NULL,'admin','長興生物科技股份有限公司',65),(2117,'長虹牌高纖維醱酵有機質肥料',2,'102/10/30首次遴選通過107/02/09全氮含量檢驗值3.44%，不符該肥料品目全氮含量不得超過3.0%之規定；全磷酐含量檢驗值3.58%，不符該肥料登記1.5%之容許值上限2.7%之規定；有機質含量檢驗質68.6%，不符該肥料登記90%之容許值下限80%之','有機資審字第108003號',NULL,'一般堆肥(5-10)','肥製(質)字第0436006號','玉米芯、米糠、椰子殼纖粉、菸葉粉','全氮2.5%全磷酐1.5%全氧化鉀1.5%有機質90.0%',NULL,'admin','長虹堆肥場',56),(2118,'長虹牌高胺基醱酵有機質肥料',2,'','有機資審字第106010號',NULL,'雜項堆肥(5-11)','肥製(質)字第0436003號','禽畜糞、禽畜屠宰下腳料、羽毛、菇類培植廢棄包','全氮4.0% 全磷酐2.5% 全氧化鉀2.0% 有機質70.0%',NULL,'admin','長虹堆肥場',56),(2119,'開殺蚧(派滅淨)',3,'',NULL,'農藥製字第06224號',NULL,NULL,NULL,'(E)-4,5-dihydro-6-methyl-4-(3-pyridylmethyleneamino)-1,2,4- triazin-3(2H)-one 25.000 (%) ',NULL,'admin','大勝化學工業股份有限公司',110),(2120,'閣來討(賽速安)',3,'',NULL,'農藥製字第05845號',NULL,NULL,NULL,'3-(2-chloro-1,3-thiazol-5-ylmethyl)-5-methyl-1,3,5-oxadiazinan-4-ylidene(nitro)amine 25.000 (%) ',NULL,'admin','國豐化學工業股份有限公司',112),(2121,'關佬爺(益達胺)',3,'',NULL,'農藥製字第05513號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 18.200 (%)',NULL,'admin','世大農化工廠股份有限公司	',114),(2122,'阻蝨爺(派滅淨)',3,'',NULL,'農藥製字第06577號',NULL,NULL,NULL,'(E)-4,5-dihydro-6-methyl-4-(3-pyridylmethyleneamino)-1,2,4- triazin-3(2H)-one 25.000 (%)',NULL,'admin','光華化學股份有限公司',77),(2123,'阿凡達(亞滅培)',3,'',NULL,'農藥進字第03073號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%)',NULL,'admin','耕得貿易股份有限公司',141),(2124,'阿土伯(亞托敏)',3,'',NULL,'農藥製字第06129號',NULL,NULL,NULL,'methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','富農化學工業股份有限公司',132),(2125,'阿妥品(亞托敏)',3,'',NULL,'農藥製字第05980號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','台灣日產化工股份有限公司',104),(2126,'阿巴勇(阿巴汀)',3,'',NULL,'農藥製字第05695號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%) ',NULL,'admin','惠大實業股份有限公司',157),(2127,'阿巴汀 (農會農化廠)',3,'',NULL,'農藥製字第05659號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%) ',NULL,'admin','中華民國農會附設各級農會農化廠',131),(2128,'阿拉丁(阿巴汀)',3,'',NULL,'農藥進字第02166號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%)',NULL,'admin','易利特開發有限公司',138),(2129,'阿拉神功(賽洛寧)',3,'',NULL,'農藥製字第05395號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 1.000  (%)  ',NULL,'admin','安旺特股份有限公司',120),(2130,'阿殺力(亞滅培)',3,'',NULL,'農藥進字第03172號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%)',NULL,'admin','嘉濱貿易有限公司',111),(2131,'阿猴城牌有機質肥料1號',2,'','有機資審字第100015號',NULL,'禽畜糞堆肥(5-09)','肥製(質)字第0167001號','牛糞、豬糞、雞糞、木屑','全氮2.5%全磷酐2.3%全氧化鉀2%有機質61%',NULL,'admin','屏東縣南州地區農會',30),(2132,'阿米哥(亞托敏)',3,'',NULL,'農藥進字第03472號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  50.000 (%)',NULL,'admin','青山貿易有限公司',147),(2133,'阿莎力(陶斯寧)',3,'',NULL,'農藥製字第05447號',NULL,NULL,NULL,'(1) O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate…45.45% (2) (RS)-α-cyano-3-phenoxybenzyl (1RS)-cis-trans-3-(2,2-dichlorovinyl)-2,2-dimethylcyclopropanecarboxylate…4.55%',NULL,'admin','興農股份有限公司',85),(2134,'阿里巴巴(阿巴汀)',3,'',NULL,'農藥製字第05414號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%) ',NULL,'admin','東和化學企業股份有限公司',109),(2135,'降龍十八掌(益達胺)',3,'',NULL,'農藥製字第05365號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 18.200 (%)',NULL,'admin','東和化學企業股份有限公司',109),(2136,'除拔介(百利普芬)',3,'',NULL,'農藥製字第06317號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 11.000 (%) ',NULL,'admin','世大農化工廠股份有限公司	',114),(2137,'除枯寧(殺紋寧)',3,'',NULL,'農藥進字第02109號',NULL,NULL,NULL,'5-methylisoxazole-3-ol 30.000 (%) ',NULL,'admin','東鋒股份有限公司',154),(2138,'除炭寶(待克利)',3,'',NULL,'農藥製字第06032號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%)',NULL,'admin','富農化學工業股份有限公司',132),(2139,'除炭粉(四氯異苯腈)',3,'',NULL,'農藥製字第06105號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  75.000 (%)',NULL,'admin','瑞芳植物保護股份有限公司',115),(2140,'除炭靈(亞托待克利)',3,'',NULL,'農藥製字第06532號',NULL,NULL,NULL,'(1) methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate...200 g/L (2) cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1-ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether...125 g/L 325 G/L (32.5% W/V)',NULL,'admin','富農化學工業股份有限公司',132),(2141,'除紋淨(菲克利)',3,'',NULL,'農藥製字第05331號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 10.000 (%)',NULL,'admin','安旺特股份有限公司',120),(2142,'除絲蟲(陶斯松)',3,'',NULL,'農藥製字第03992號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%)',NULL,'admin','大成化學工業股份有限公司',127),(2143,'除菌王(待克利)',3,'',NULL,'農藥製字第05689號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%)  ',NULL,'admin','洽益化學股份有限公司',108),(2144,'除菌靈(四氯異苯腈)',3,'',NULL,'農藥製字第06124號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  40.000 (%)',NULL,'admin','華夏科學農化股份有限公司',106),(2145,'除菜蟲(因滅汀)',3,'',NULL,'農藥製字第06138號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','華夏科學農化股份有限公司',106),(2146,'除虫精(第滅寧)',3,'',NULL,'農藥製字第05232號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.400  (%)',NULL,'admin','臺灣庵原農藥股份有限公司',113),(2147,'除蝨寶(賽速安)',3,'',NULL,'農藥進字第03387號',NULL,NULL,NULL,'3-(2-chloro-1,3-thiazol-5-ylmethyl)-5-methyl-1,3,5-oxadiazinan-4-ylidene(nitro)amine 25.000 (%) ',NULL,'admin','安旺特股份有限公司',120),(2148,'除露炭(四氯異苯腈)',3,'',NULL,'農藥製字第06070號',NULL,NULL,NULL,'tetrachloroisophthalonitrile  40.000 (%)',NULL,'admin','瑞芳植物保護股份有限公司',115),(2149,'除露霸(鋅錳克絕)',3,'',NULL,'農藥進字第02350號',NULL,NULL,NULL,'(1) 1-(2-cyano-2-methoxyiminoacetyl)-3-ethylurea…8% (2) manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt…64%',NULL,'admin','瑞福企業有限公司',162),(2150,'陶剋兇(陶斯寧)',3,'',NULL,'農藥製字第05917號',NULL,NULL,NULL,'(1) O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate…45.45% (2) (RS)-α-cyano-3-phenoxybenzyl (1RS)-cis-trans-3-(2,2-dichlorovinyl)-2,2-dimethylcyclopropanecarboxylate…4.55%',NULL,'admin','世大農化工廠股份有限公司	',114),(2151,'陶園(陶斯松)',3,'',NULL,'農藥進字第03245號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%) ',NULL,'admin','安旺特股份有限公司',120),(2152,'陶大松 25%(陶斯松)',3,'',NULL,'農藥製字第03942號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 25.000 (%) ',NULL,'admin','世大農化工廠股份有限公司	',114),(2153,'陶大松 40.8%(陶斯松)',3,'',NULL,'農藥製字第03931號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%)',NULL,'admin','世大農化工廠股份有限公司	',114),(2154,'陶太郎(陶斯松)',3,'',NULL,'農藥進字第01931號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%) ',NULL,'admin','瑞泓生技有限公司',184),(2155,'陶斯本(陶斯松)',3,'',NULL,'農藥製字第04279號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 25.000 (%) ',NULL,'admin','利台化學工業股份有限公司',116),(2156,'陶斯松 25% (農會農化廠)',3,'',NULL,'農藥製字第04450號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 25.000 (%) ',NULL,'admin','中華民國農會附設各級農會農化廠',131),(2157,'陶斯松 40.8% (農會農化廠)',3,'',NULL,'農藥製字第04451號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%)',NULL,'admin','中華民國農會附設各級農會農化廠',131),(2158,'陶蟲本 25%(陶斯松)',3,'',NULL,'農藥製字第05145號 or 農藥進字第02092號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 25.000 (%)  ',NULL,'admin','台灣日產化工股份有限公司',104),(2159,'陶蟲本 40.8%(陶斯松)',3,'',NULL,'農藥製字第04744號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%) ',NULL,'admin','台灣日產化工股份有限公司',104),(2160,'陶蟲本 5%(陶斯松)',3,'',NULL,'農藥製字第05158號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 5.000  (%) ',NULL,'admin','台灣日產化工股份有限公司',104),(2161,'隆無蟲(祿芬隆)',3,'',NULL,'農藥製字第05767號',NULL,NULL,NULL,'(RS)-1-[2,5-dichloro-4-(1,1,2,3,3,3-hexafluoropropoxy)- phenyl]-3-(2,6-difluorobenzoyl)-urea  4.400 (%)',NULL,'admin','國豐化學工業股份有限公司',112),(2162,'雄好(賽氟菲克利)',3,'',NULL,'農藥製字第06318號',NULL,NULL,NULL,'(1) 2’,6’-dibromo-2-methyl-4’-trifluoromethoxy-4-trifluoromethyl-1,3-thiazole-5-carboxanilide...5.25% (2) (RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl)hexan-2-ol...10%',NULL,'admin','台灣日產化工股份有限公司',104),(2163,'雅蔓尼(賽座滅)',3,'',NULL,'農藥進字第03340號',NULL,NULL,NULL,' 4-chloro-2-cyano-N,N-dimethyl-5-p-tolylimidazole-1-sulfonamide  9.400 (%)',NULL,'admin','雅飛有限公司',126),(2164,'雅飛大將軍(百克敏)',3,'',NULL,'農藥進字第03528號',NULL,NULL,NULL,' methyl N-{2-[1-(4-chlorophenyl)pyrazol-3-yloxymethyl]phenyl}(N-methoxy)carbamate  23.600 (%)',NULL,'admin','雅飛有限公司',126),(2165,'雅飛好派頭(克凡派)',3,'',NULL,'農藥進字第03075號',NULL,NULL,NULL,'4-bromo-2-(4-chlorophenyl)-1-ethoxymethyl-5-trifluoromethylpyrrole-3-carbonitrile 10.000 (%) ',NULL,'admin','雅飛有限公司',126),(2166,'雅飛尚讚(凡殺克絕)',3,'',NULL,'農藥進字第03360號',NULL,NULL,NULL,'(1) 3-anilino-5-methyl-5-(4-phenoxyphenyl)-1,3-oxazolidine-2,4-dione...22.5% (2) 1-(2-cyano-2-methoxyiminoacetyl)-3-ethylurea...30%',NULL,'admin','雅飛有限公司',126),(2167,'雅飛控病(免得爛)',3,'',NULL,'農藥進字第03537號',NULL,NULL,NULL,' zinc ammoniate ethylenebis(dithiocarbamate)-poly(ethylenethiuram disulfide)  80.000 (%)',NULL,'admin','雅飛有限公司',126),(2168,'雅飛速寶(因得克)',3,'',NULL,'農藥進字第03131號',NULL,NULL,NULL,' methyl (S)-N-[7-chloro-2,3,4a,5-tetrahydro-4a-(methoxycarbonyl)indeno[1,2-e][1,3,4]oxadiazin-2-ylcarbonyl]-4’-(trifluoromethoxy)carbanilate  14.500 (%)',NULL,'admin','雅飛有限公司',126),(2169,'集馬寧(陶斯寧)',3,'',NULL,'農藥製字第05534號',NULL,NULL,NULL,'(1) O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate…45.45% (2) (RS)-α-cyano-3-phenoxybenzyl (1RS)-cis-trans-3-(2,2-dichlorovinyl)-2,2-dimethylcyclopropanecarboxylate…4.55%',NULL,'admin','正農化學股份有限公司',130),(2170,'雙剋(待克利)',3,'',NULL,'農藥進字第02612號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%)',NULL,'admin','優必樂有限公司',151),(2171,'雙吉(貝芬待克利)',3,'',NULL,'農藥製字第05763號',NULL,NULL,NULL,'(1) METHYL BENZIMIDAZOL-2-YLCARBAMATE...................11.9%(2) CIS,TRANS-3-CHLORO-4-[4-METHYL-2-(1H-1,2,4-TRIAZOL-1-YLMETHYL)-1,3-DIOXOLAN-2-YL)PHENYL-4-CHLOROPHENYL ETHER..5.9%',NULL,'admin','臺聯實業股份有限公司',107),(2172,'雙喜丹精(第滅寧)',3,'',NULL,'農藥製字第04939號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.400  (%)',NULL,'admin','臺益工業股份有限公司',39),(2173,'雙寶淨(甲基多保淨)',3,'',NULL,'農藥製字第05333號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 70.000 (%)       ',NULL,'admin','安旺特股份有限公司',120),(2174,'雙強(亞托待克利)',3,'',NULL,'農藥進字第03205號',NULL,NULL,NULL,'(1) methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate...200 g/L (2) cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1-ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether...125 g/L',NULL,'admin','海博生技股份有限公司',146),(2175,'雙星(達滅芬)',3,'',NULL,'農藥製字第05588號',NULL,NULL,NULL,'(E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine  50.000 (%)',NULL,'admin','臺聯實業股份有限公司',107),(2176,'雙核心(嘉賜快得寧)',3,'',NULL,'農藥製字第05766號',NULL,NULL,NULL,'(1) 1L-1,3,4/2,5,6-1-DEOXY-2,3,4,5,6-PENTAHYDROXYCYCLOHEXYL 2-AMINO-2,3,4,6-TETRADEOXY-4-(α-IMINOGLYCINO)-α-D-ARABINO-HEXOPYRANOSIDE..................3.5% (2) BIS(QUINOLIN-8-OLATO-O,N)COPPER.....................40%',NULL,'admin','利台化學工業股份有限公司',116),(2177,'雙發(達滅芬)',3,'',NULL,'農藥進字第03255號',NULL,NULL,NULL,'(E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine  50.000 (%)',NULL,'admin','嘉濱貿易有限公司',111),(2178,'雙禧(第滅寧)',3,'',NULL,'農藥製字第04049號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%) ',NULL,'admin','正農化學股份有限公司',130),(2179,'雙禧精(第滅寧)',3,'',NULL,'農藥製字第05330號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.400  (%)',NULL,'admin','安旺特股份有限公司',120),(2180,'雙贊(福賽快得寧)',3,'',NULL,'農藥製字第04771號',NULL,NULL,NULL,'(1) ALUMINIUM TRIS-O-ETHYLPHOSPHONATE................40%(2) BIS(QUINOLIN-8-OLATO-O,N)COPPER..................40%',NULL,'admin','惠光股份有限公司',121),(2181,'雙贏(布芬第滅寧)',3,'',NULL,'農藥製字第05244號',NULL,NULL,NULL,'(1) (S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate…0.69%    (2) (Z)-2-tert-butylimino-3-isopropyl-5-phenyl-1, 3, 5-thiadiazinan-4-one…11.09% 11.780 (%) ',NULL,'admin','興農股份有限公司',85),(2182,'雙頭鷹(克熱淨)',3,'',NULL,'農藥進字第02108號',NULL,NULL,NULL,'1,1’-iminodi(octamethylene)diguanidinium tris(alkylbenzenesulfonate) 40.000 (%)',NULL,'admin','台灣住友商事股份有限公司',188),(2183,'零菌潔(甲基多保淨)',3,'',NULL,'農藥製字第02661號',NULL,NULL,NULL,'dimethyl 4,4’-(ο-phenylene)bis(3-thioallophanate) 70.000 (%)  ',NULL,'admin','嘉農企業股份有限公司',117),(2184,'零菌益(亞托敏)',3,'',NULL,'農藥進字第03208號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','嘉農企業股份有限公司',117),(2185,'雷公掌(益達胺)',3,'',NULL,'農藥製字第05383號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 18.200 (%) ',NULL,'admin','安旺特股份有限公司',120),(2186,'雷彈精(腈硫醌)',3,'',NULL,'農藥進字第02543號',NULL,NULL,NULL,'5,10-dihydro-5,10-dioxonaphtho[2,3-b]-1,4-dithiine-2,3-dicarbonitrile 42.200 (%)   ',NULL,'admin','雅飛有限公司',126),(2187,'露一手(普拔克)',3,'',NULL,'農藥進字第03074號',NULL,NULL,NULL,' propyl 3-(dimethylamino)propylcarbamate hydrochloride  66.500 (%)',NULL,'admin','青山貿易有限公司',147),(2188,'露光光(鋅錳克絕)',3,'',NULL,'農藥製字第05121號',NULL,NULL,NULL,'(1) 1-(2-cyano-2-methoxyiminoacetyl)-3-ethylurea…8% (2) manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt…64%',NULL,'admin','大勝化學工業股份有限公司',110),(2189,'露必清(達滅芬)',3,'',NULL,'農藥製字第05692號',NULL,NULL,NULL,'(E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine  50.000 (%)',NULL,'admin','洽益化學股份有限公司',108),(2190,'露特疫(三氟敏)',3,'',NULL,'農藥進字第03325號',NULL,NULL,NULL,' methyl (E)-methoxyimino-{(E)-α-[1-(α,α,α-trifluoro-m-tolyl)ethylideneaminooxy]-o-tolyl}acetate  50.000 (%)',NULL,'admin','嘉濱貿易有限公司',111),(2191,'露疫失(鋅錳滅達樂)',3,'',NULL,'農藥進字第02356號',NULL,NULL,NULL,'(1) manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt...48%(2) methyl N-(methoxyacetyl)-N-(2,6-xylyl)-DL-alaninate...10%',NULL,'admin','瑞福企業有限公司',162),(2192,'露疫安(達滅克敏)',3,'',NULL,'農藥進字第03348號',NULL,NULL,NULL,'(1) methyl N-{2-[1-(4-chlorophenyl)-1H-pyrazol-3-yloxymethyl]phenyl}(N-methoxy)carbamate...6.7% (2) (E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine...12.0%',NULL,'admin','朝暘生化開發有限公司',171),(2193,'露疫淨(賽座滅)',3,'',NULL,'農藥進字第03365號',NULL,NULL,NULL,' 4-chloro-2-cyano-N,N-dimethyl-5-p-tolylimidazole-1-sulfonamide  9.400 (%)',NULL,'admin','嘉濱貿易有限公司',111),(2194,'露疫精-鋅錳(鋅錳滅達樂)',3,'',NULL,'農藥製字第04598號',NULL,NULL,NULL,'(1) manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt...48%(2) methyl N-(methoxyacetyl)-N-(2,6-xylyl)-DL-alaninate...10%',NULL,'admin','利台化學工業股份有限公司',116),(2195,'露的精(四氯異苯腈)',3,'',NULL,'農藥進字第02503號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  40.000 (%)',NULL,'admin','優必樂有限公司',151),(2196,'露穩滅(快得滅達樂)',3,'',NULL,'農藥製字第04855號',NULL,NULL,NULL,'(1) BIS(QUINOLIN-8-OLATO-O,N)COPPER......................48%(2) METHYL N-(METHOXYACETYL)-N-(2,6-XYLYL)-DL-ALANINATE...6%',NULL,'admin','興農股份有限公司',85),(2197,'露絕(鋅錳克絕)',3,'',NULL,'農藥進字第03219號',NULL,NULL,NULL,'(1) 1-(2-cyano-2-methoxyiminoacetyl)-3-ethylurea…8% (2) manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt…64%',NULL,'admin','益欣股份有限公司',176),(2198,'露速淨(鋅錳滅達樂)',3,'',NULL,'農藥製字第01790號',NULL,NULL,NULL,'(1) manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt...48%(2) methyl N-(methoxyacetyl)-N-(2,6-xylyl)-DL-alaninate...10%',NULL,'admin','惠光股份有限公司',121),(2199,'露露(四氯異苯腈)',3,'',NULL,'農藥製字第02033號',NULL,NULL,NULL,' tetrachloroisophthalonitrile  75.000 (%)',NULL,'admin','興農股份有限公司',85),(2200,'露露清(普拔克)',3,'',NULL,'農藥進字第03305號',NULL,NULL,NULL,' propyl 3-(dimethylamino)propylcarbamate hydrochloride  66.500 (%)',NULL,'admin','耕得貿易股份有限公司',141),(2201,'霸天靈(納乃得)',3,'',NULL,'農藥製字第06488號',NULL,NULL,NULL,' S-methyl N-(methylcarbamoyloxy)thioacetimidate  40.000 (%)',NULL,'admin','華夏科學農化股份有限公司',106),(2202,'霸王丹(加保扶)',3,'',NULL,'農藥製字第04926號',NULL,NULL,NULL,'2,3-dihydro-2,2-dimethylbenzofuran-7-yl methylcarbamate  3.000 (%)',NULL,'admin','嘉泰企業股份有限公司',102),(2203,'霸王星(畢芬寧)',3,'',NULL,'農藥製字第04911號',NULL,NULL,NULL,'2-methylbiphenyl-3-ylmethyl (Z)-(1RS,3RS)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate  2.500 (%)',NULL,'admin','嘉泰企業股份有限公司',102),(2204,'霸生(錳乃浦)',3,'',NULL,'農藥進字第02133號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','安農股份有限公司',156),(2205,'霸蟲清(因滅汀)',3,'',NULL,'農藥進字第03403號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','日農科技股份有限公司',105),(2206,'霸面清(賽洛寧)',3,'',NULL,'農藥進字第02567號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.800  (%)  ',NULL,'admin','聯合農化股份有限公司',150),(2207,'霸面清-夏油(礦物油)',3,'',NULL,'農藥製字第05023號',NULL,NULL,NULL,'ALIPHATIC HYDROCARBONS, HYDROTREATED LIGHT PARAFFINIC   95.000 (%) ',NULL,'admin','世大農化工廠股份有限公司	',114),(2208,'霸面稱(亞托敏)',3,'',NULL,'農藥製字第05731號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','臺灣庵原農藥股份有限公司',113),(2209,'霹力寧(陶斯松)',3,'',NULL,'農藥進字第01706號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 25.000 (%)',NULL,'admin','德方有限公司',175),(2210,'霹靂克(陶斯松)',3,'',NULL,'農藥進字第01701號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 40.800 (%) ',NULL,'admin','德方有限公司',175),(2211,'霹靂掌(益達胺)',3,'',NULL,'農藥製字第05081號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%) ',NULL,'admin','利台化學工業股份有限公司',116),(2212,'霹靂金剛(達特南)',3,'',NULL,'農藥進字第03152號',NULL,NULL,NULL,'(RS)-1-methyl-2-nitro-3-(tetrahydro-3-furylmethyl)guanidine 20.000 (%)',NULL,'admin','雅飛有限公司',126),(2213,'霹靂馬(賽普洛)',3,'',NULL,'農藥進字第01736號',NULL,NULL,NULL,'4-cyclopropyl-6-methyl-N-phenylpyrimidin-2-amine 50.000 (%) ',NULL,'admin','台灣先正達股份有限公司',144),(2214,'青利利(因滅汀)',3,'',NULL,'農藥進字第02712號',NULL,NULL,NULL,'因滅汀 2.15%',NULL,'admin','大成化學工業股份有限公司',127),(2215,'青台生(錳乃浦)',3,'',NULL,'農藥進字第02507號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','高事達農化有限公司',155),(2216,'青山蟎有效(芬普蟎)',3,'',NULL,'農藥進字第03021號',NULL,NULL,NULL,'tert-butyl (E)-α-(1,3-dimethyl-5-phenoxypyrazol-4-ylmethyleneamino-oxy)-p-toluate 5.000  (%)  ',NULL,'admin','青山貿易有限公司',147),(2217,'青春牌碩果素',2,'','有機資審字第101003號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0004001號','豆粉、魚粉、肉骨粉、米糠、菜籽粕','全氮4.5%全磷酐3.5%全氧化鉀1.5%有機質87%',NULL,'admin','力漢企業股份有限公司',31),(2218,'青春牌菁翠素',2,'','有機資審字第101004號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0004003號','豆粉、菜籽粕、肉骨粉、魚粉、苜蓿','全氮5%全磷酐2.4%全氧化鉀1.5%有機質81%',NULL,'admin','力漢企業股份有限公司',31),(2219,'青春牌超級肥',2,'','有機資審字第101005號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0004005號','豆粉、菜籽粕、肉骨粉、魚粉、苜蓿','全氮4%全磷酐2%全氧化鉀1%有機質80%',NULL,'admin','力漢企業股份有限公司',31),(2220,'青棒棒(賽洛寧)',3,'',NULL,'農藥進字第02186號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.800  (%)  ',NULL,'admin','瑞福企業有限公司',162),(2221,'青萬能(納乃得)',3,'',NULL,'農藥製字第03369號',NULL,NULL,NULL,' S-methyl N-(methylcarbamoyloxy)thioacetimidate  40.000 (%)',NULL,'admin','聯利農業科技股份有限公司',103),(2222,'青萬零粉(納乃得)',3,'',NULL,'農藥進字第01505號',NULL,NULL,NULL,' S-methyl N-(methylcarbamoyloxy)thioacetimidate  40.000 (%)',NULL,'admin','松樹國際有限公司',137),(2223,'青蔥寧(益滅松)',3,'',NULL,'農藥製字第04085號',NULL,NULL,NULL,' O,O-dimethyl S-phthalimidomethyl phosphorodithioate  50.000 (%)',NULL,'admin','世大農化工廠股份有限公司	',114),(2224,'青蟲王(益滅賽寧)',3,'',NULL,'農藥製字第04429號',NULL,NULL,NULL,'(1)O,O-dimethyl S-phthalimidomethyl phosphorodithioate…30%  (2)(RS)-α-cyano-3-phenoxybenzyl(1RS)-cis-trans-3-(2,2-dichlorovinyl)-2,2-dimethyl cyclopropanecarboxylate …10%',NULL,'admin','臺益工業股份有限公司',39),(2225,'青跳跳(菲克利)',3,'',NULL,'農藥製字第06005號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 10.000 (%) ',NULL,'admin','台農三和化工股份有限公司',119),(2226,'青蹦蹦(菲克利)',3,'',NULL,'農藥製字第06015號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 23.000 (%)',NULL,'admin','台農三和化工股份有限公司',119),(2227,'青靈得(納乃得)',3,'',NULL,'農藥製字第00699號',NULL,NULL,NULL,' S-methyl N-(methylcarbamoyloxy)thioacetimidate  40.000 (%)',NULL,'admin','中華民國農會附設各級農會農化廠',131),(2228,'非常稱(亞托敏)',3,'',NULL,'農藥進字第02796號',NULL,NULL,NULL,'methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','臺聯實業股份有限公司',107),(2229,'非常霸(亞托敏)',3,'',NULL,'農藥製字第05792號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','臺聯實業股份有限公司',107),(2230,'非死不可(亞滅培)',3,'',NULL,'農藥進字第02851號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%)',NULL,'admin','東鋒股份有限公司',154),(2231,'靠山(亞滅培)',3,'',NULL,'農藥進字第02647號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%)',NULL,'admin','雋農實業股份有限公司',136),(2232,'順吉利(馬拉松)',3,'',NULL,'農藥製字第04098號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 25.000 (%)      ',NULL,'admin','瑞芳植物保護股份有限公司',115),(2233,'順豐掌(益達胺)',3,'',NULL,'農藥製字第05347號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 9.600  (%) ',NULL,'admin','東和化學企業股份有限公司',109),(2234,'順豐經典有機質肥料',2,'','有機資審字第105001號',NULL,'一般堆肥(5-10)','肥製(質)字第0266003號','稻殼、木屑、禽畜糞、植物性廢渣(咖啡渣)','全氮2.0%全磷酐2.0%全氧化鉀1.6%有機質76.0%',NULL,'admin','順豐有機肥料有限公司',46),(2235,'顧全精(得克利)',3,'',NULL,'農藥製字第05727號',NULL,NULL,NULL,'(RS)-1-p-chlorophenyl-4,4-dimethyl-3-(1H-1,2,4-triazol-1- ylmethyl)pentan-3-ol 25.900 (%)',NULL,'admin','聯利農業科技股份有限公司',103),(2236,'顧基層(賽洛寧)',3,'',NULL,'農藥製字第06502號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.460  (%) ',NULL,'admin','好速化學股份有限公司',118),(2237,'顧心腹(益滅松)',3,'',NULL,'農藥製字第06272號',NULL,NULL,NULL,' O,O-dimethyl S-phthalimidomethyl phosphorodithioate  50.000 (%)',NULL,'admin','華夏科學農化股份有限公司',106),(2238,'顧根本(依得利)',3,'',NULL,'農藥製字第06551號',NULL,NULL,NULL,' ethyl 4-methylthio-m-tolyl isopropylphosphoramidate  40.000 (%)',NULL,'admin','正農化學股份有限公司',130),(2239,'顧洗菌(亞托敏)',3,'',NULL,'農藥進字第03330號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','美商雅柏生活科技有限公司臺灣分公司',148),(2240,'顧田寶(托福松)',3,'',NULL,'農藥製字第04160號',NULL,NULL,NULL,'S-tert-butylthiomethyl O,O-diethyl phosphorodithioate  10.000 (%)',NULL,'admin','瑞芳植物保護股份有限公司',115),(2241,'顧真闊(陶斯松)',3,'',NULL,'農藥製字第05571號',NULL,NULL,NULL,'O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate 5.000  (%) ',NULL,'admin','臺聯實業股份有限公司',107),(2242,'顧美美(鋅錳乃浦)',3,'',NULL,'農藥進字第02942號',NULL,NULL,NULL,'manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','國寶國際有限公司',153),(2243,'飛龍掌(馬拉松)',3,'',NULL,'農藥製字第00311號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 50.000 (%)',NULL,'admin','利台化學工業股份有限公司',116),(2244,'香兒寶(賜諾殺)',3,'',NULL,'農藥進字第02365號',NULL,NULL,NULL,'A MIXTURE OF SPINOSYN A AND SPINOSYN D 0.020  (%) ',NULL,'admin','台灣道禮股份有限公司',174),(2245,'馬上安(馬拉松)',3,'',NULL,'農藥製字第04513號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 25.000 (%)   ',NULL,'admin','東和化學企業股份有限公司',109),(2246,'馬來松(馬拉松)',3,'',NULL,'農藥製字第00317號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 50.000 (%)      ',NULL,'admin','安旺特股份有限公司',120),(2247,'馬克精(三泰隆)',3,'',NULL,'農藥進字第01731號',NULL,NULL,NULL,'(1RS,2RS;1RS,2SR)-1-(4-chlorophenoxy)-3,3-dimethyl-1-(1H-1,2,4-triazol-1-yl)-butan-2-ol 23.000 (%) 乳化劑 77.000(%)',NULL,'admin','聯利農業科技股份有限公司',103),(2248,'馬力蝨(馬拉松)',3,'',NULL,'農藥製字第02220號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 1.000  (%)    ',NULL,'admin','嘉農企業股份有限公司',117),(2249,'馬拉松 50% (農會農化廠)',3,'',NULL,'農藥製字第00845號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 50.000 (%) ',NULL,'admin','中華民國農會附設各級農會農化廠',131),(2250,'馬拉松 50% (台灣正豐植保股份有限公司)',3,'',NULL,'農藥製字第00085號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 50.000 (%)',NULL,'admin','台灣正豐植保股份有限公司',128),(2251,'馬拉松 50% (合林企業有限公司)',3,'',NULL,'農藥進字第01819號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 50.000 (%)   ',NULL,'admin','合林企業有限公司',166),(2252,'馬拉松 50% (嘉農企業股份有限公司)',3,'',NULL,'農藥製字第02369號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 50.000 (%) ',NULL,'admin','嘉農企業股份有限公司',117),(2253,'馬拉松 50% (國豐化學工業股份有限公司)',3,'',NULL,'農藥製字第01055號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 50.000 (%)   ',NULL,'admin','國豐化學工業股份有限公司',112),(2254,'馬拉松 50% (大勝化學工業股份有限公司)',3,'',NULL,'農藥製字第00768號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 50.000 (%) ',NULL,'admin','大勝化學工業股份有限公司',110),(2255,'馬拉松 50% (大成化學工業股份有限公司)',3,'',NULL,'農藥製字第00335號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 50.000 (%)',NULL,'admin','大成化學工業股份有限公司',127),(2256,'馬拉松 50% (恒欣股份有限公司)',3,'',NULL,'農藥進字第01720號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 50.000 (%) ',NULL,'admin','恒欣股份有限公司',183),(2257,'馬拉松 50% (洽益化學)',3,'',NULL,'農藥製字第01811號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 1.000  (%) ',NULL,'admin','洽益化學股份有限公司',108),(2258,'馬拉松 50% (臺灣庵原農藥)',3,'',NULL,'農藥製字第00408號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 50.000 (%) ',NULL,'admin','臺灣庵原農藥股份有限公司',113),(2259,'馬拉松 50% (臺益工業股份有限公司)',3,'',NULL,'農藥製字第03520號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 50.000 (%)      ',NULL,'admin','臺益工業股份有限公司',39),(2260,'馬殺(馬拉松)',3,'',NULL,'農藥進字第02086號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 50.000 (%)',NULL,'admin','安農股份有限公司',156),(2261,'馬煞激(馬拉松)',3,'',NULL,'農藥製字第05983號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 50.000 (%) ',NULL,'admin','東和化學企業股份有限公司',109),(2262,'驚天動地(達滅克敏)',3,'',NULL,'農藥進字第03185號',NULL,NULL,NULL,'(1) methyl N-{2-[1-(4-chlorophenyl)-1H-pyrazol-3-yloxymethyl]phenyl}(N-methoxy)carbamate...6.7% (2) (E,Z)-4-[3-(4-chlorophenyl)-3-(3,4-dimethoxyphenyl)acryloyl] morpholine...12.0%',NULL,'admin','萬得發有限公司',125),(2263,'驚炭(待克利)',3,'',NULL,'農藥進字第02462號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%)',NULL,'admin','優必樂有限公司',151),(2264,'驚虫(第滅寧)',3,'',NULL,'農藥製字第05168號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.800  (%) ',NULL,'admin','大勝化學工業股份有限公司',110),(2265,'驚虫精(第滅寧)',3,'',NULL,'農藥製字第05211號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (1R,3R)-3-(2,2-dibromovinyl)-2,2-dimethylcyclopropanecarboxylate 2.400  (%) ',NULL,'admin','大勝化學工業股份有限公司',110),(2266,'高喜精(加保利)',3,'',NULL,'農藥製字第04236號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 40.000 (%)',NULL,'admin','瑞芳植物保護股份有限公司',115),(2267,'高招(蘇力菌)',3,'',NULL,'農藥進字第02220號',NULL,NULL,NULL,' BACILLUS THURINGIENSIS SUBSPECIES KURSTAKI STRAIN EG7841  LEPIDOPTERAN ACTIVE TOXIN (64,000 IU/mg)  40.000 (%)',NULL,'admin','嘉農企業股份有限公司',117),(2268,'高派滅(派滅淨)',3,'',NULL,'農藥製字第06276號',NULL,NULL,NULL,'(E)-4,5-dihydro-6-methyl-4-(3-pyridylmethyleneamino)-1,2,4- triazin-3(2H)-one 50.000 (%)  ',NULL,'admin','安旺特股份有限公司',120),(2269,'高竿(加保利)',3,'',NULL,'農藥製字第04315號',NULL,NULL,NULL,'1-naphthyl methylcarbamate 40.000 (%) ',NULL,'admin','臺益工業股份有限公司',39),(2270,'高級夏油九五(礦物油)',3,'',NULL,'農藥製字第01139號',NULL,NULL,NULL,'ALIPHATIC HYDROCARBONS 95.000 (%)   ',NULL,'admin','大勝化學工業股份有限公司',110),(2271,'高財生(錳乃浦)',3,'',NULL,'農藥進字第03498號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','高事達農化有限公司',155),(2272,'高速攻露(嘉賜銅)',3,'',NULL,'農藥製字第03377號',NULL,NULL,NULL,'(1) [5-amino-2-methyl-6-(2,3,4,5,6,-pentahydroxycyclohexyloxy) tetrahydropyran-3-yl] amino-α-iminoacetic acid hydrochloride hydrate...5.7% ( Kasugamycin...5% ) (2) copper oxychloride (CU 45%)...75.6%',NULL,'admin','世大農化工廠股份有限公司	',114),(2273,'高鉄(益達胺)',3,'',NULL,'農藥製字第05560號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 18.200 (%) ',NULL,'admin','嘉農企業股份有限公司',117),(2274,'魯力(益滅松)',3,'',NULL,'農藥製字第04024號',NULL,NULL,NULL,' O,O-dimethyl S-phthalimidomethyl phosphorodithioate  50.000 (%)',NULL,'admin','嘉泰企業股份有限公司',102),(2275,'鴻福生(錳乃浦)',3,'',NULL,'農藥進字第01980號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric)  80.000 (%)',NULL,'admin','安農股份有限公司',156),(2276,'鴻鋒亞托敏(亞托敏)',3,'',NULL,' 農藥進字第03142號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','鴻鋒化學有限公司',134),(2277,'鴻鋒滅培(亞滅培)',3,'',NULL,'農藥進字第03060號',NULL,NULL,NULL,'(E)-N^1-[(6-chloro-3-pyridyl)methyl]-N^2-cyano-N^1-methylacetamidine 20.000 (%)',NULL,'admin','鴻鋒化學有限公司',134),(2278,'鴻鋒福祿旺(依普同)',3,'',NULL,'農藥進字第02571號',NULL,NULL,NULL,'3-(3,5-dichlorophenyl)-N-isopropyl-2,4-dioxoimidazolidine-1-carboxamide  23.700 (%)',NULL,'admin','鴻鋒化學有限公司',134),(2279,'麻吉(祿芬隆)',3,'',NULL,'農藥製字第06178號',NULL,NULL,NULL,'(RS)-1-[2,5-dichloro-4-(1,1,2,3,3,3-hexafluoropropoxy)- phenyl]-3-(2,6-difluorobenzoyl)-urea  4.400 (%)',NULL,'admin','洽益化學股份有限公司',108),(2280,'黑潔剋(待克利)',3,'',NULL,'農藥製字第05984號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%)',NULL,'admin','臺灣庵原農藥股份有限公司',113),(2281,'黑珍珠(福瑞松)',3,'',NULL,'農藥進字第00726號',NULL,NULL,NULL,' O,O-diethyl S-ethylthiomethyl phosphorodithioate  10.000 (%)',NULL,'admin','臺灣庵原農藥股份有限公司',113),(2282,'黑白絕(依滅列)',3,'',NULL,'農藥製字第04524號',NULL,NULL,NULL,'(±)-1-(β-allyloxy-2,4-dichlorophenylethyl)imidazole 21.200 (%)',NULL,'admin','利台化學工業股份有限公司',116),(2283,'黑金剛(福瑞松)',3,'',NULL,'農藥進字第01453號',NULL,NULL,NULL,' O,O-diethyl S-ethylthiomethyl phosphorodithioate  10.000 (%)',NULL,'admin','翰金興業有限公司',165),(2284,'黑馬(陶斯寧)',3,'',NULL,'農藥製字第05833號',NULL,NULL,NULL,'(1) O, O-diethyl O-3, 5, 6-trichloro-2-pyridyl phosphorothioate…45.45% (2) (RS)-α-cyano-3-phenoxybenzyl (1RS)-cis-trans-3-(2,2-dichlorovinyl)-2,2-dimethylcyclopropanecarboxylate…4.55%',NULL,'admin','臺聯實業股份有限公司',107),(2285,'黑麒麟(阿巴汀)',3,'',NULL,'農藥進字第03486號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%)   ',NULL,'admin','青山貿易有限公司',147),(2286,'黑龍寶(福瑞松)',3,'',NULL,'農藥進字第02010號',NULL,NULL,NULL,' O,O-diethyl S-ethylthiomethyl phosphorodithioate  10.000 (%)',NULL,'admin','合林企業有限公司',166),(2287,'黑龜跳仔(佈飛松)',3,'',NULL,'農藥製字第05892號',NULL,NULL,NULL,'O-4-bromo-2-chlorophenyl O-ethyl S-propyl phosphorothioate 43.000 (%)  ',NULL,'admin','安旺特股份有限公司',120),(2288,'黴下落(派美尼)',3,'',NULL,'農藥進字第03146號',NULL,NULL,NULL,'N-(4,6-dimethylpyrimidin-2-yl)aniline 37.400 (%) ',NULL,'admin','萬得發有限公司',125),(2289,'黴克靈(依瑞莫)',3,'',NULL,'農藥進字第02591號',NULL,NULL,NULL,'5-butyl-2-ethylamino-6-methylpyrimidin-4-ol 25.000 (%) ',NULL,'admin','臺聯實業股份有限公司',107),(2290,'黴問題(白克列)',3,'',NULL,'農藥進字第03003號',NULL,NULL,NULL,'2-chloro-N-(4’-chlorobiphenyl-2-yl)nicotinamide 50.000 (%) ',NULL,'admin','萬得發有限公司',125),(2291,'黴白跑(白克列)',3,'',NULL,'農藥進字第03101號',NULL,NULL,NULL,'2-chloro-N-(4’-chlorobiphenyl-2-yl)nicotinamide 50.000 (%)  ',NULL,'admin','萬得發有限公司',125),(2292,'黴絕(依瑞莫)',3,'',NULL,'農藥製字第02073號',NULL,NULL,NULL,'5-butyl-2-ethylamino-6-methylpyrimidin-4-ol 25.000 (%)',NULL,'admin','日農科技股份有限公司',105),(2293,'黴關係(撲滅寧)',3,'',NULL,'農藥進字第03036號',NULL,NULL,NULL,' N-(3,5-dichlorophenyl)-1,2-dimethylcyclopropane-1,2-dicarboximide  50.000 (%)',NULL,'admin','萬得發有限公司',125),(2294,'龍勇(阿巴汀)',3,'',NULL,'農藥製字第05622號',NULL,NULL,NULL,'>80% avermectin B1a: 5-O-demethyl avermectin A1a             <20% avermectin B1b: 5-O-demethyl-25-de-(1-methylpropyl)-25-(1-methylethyl)avermectin A1a 2.000  (%)',NULL,'admin','龍燈生物科技股份有限公司',76),(2295,'龍喀菌(亞托敏)',3,'',NULL,'農藥製字第06056號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','大成化學工業股份有限公司',127),(2296,'龍巴斯(錳乃浦)',3,'',NULL,'農藥進字第00354號',NULL,NULL,NULL,' manganese ethylenebis(dithiocarbamate) (polymeric) complex with zinc salt  80.000 (%)',NULL,'admin','蒙狄生股份有限公司',159),(2297,'龍挺利(得克利)',3,'',NULL,'農藥製字第05710號',NULL,NULL,NULL,'(RS)-1-p-chlorophenyl-4,4-dimethyl-3-(1H-1,2,4-triazol-1- ylmethyl)pentan-3-ol 25.900 (%) ',NULL,'admin','龍燈生物科技股份有限公司',76),(2298,'龍旺星(畢芬寧)',3,'',NULL,'農藥製字第06057號',NULL,NULL,NULL,'2-methylbiphenyl-3-ylmethyl (Z)-(1RS,3RS)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate  2.800 (%)',NULL,'admin','龍燈生物科技股份有限公司',76),(2299,'龍有賺(待克利)',3,'',NULL,'農藥製字第05655號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%) ',NULL,'admin','龍燈生物科技股份有限公司',76),(2300,'龍滅淨(賽滅淨)',3,'',NULL,'農藥製字第06594號',NULL,NULL,NULL,'N-cyclopropyl-1,3,5-triazine-2,4,6-triamine 8.900  (%) ',NULL,'admin','龍燈生物科技股份有限公司',76),(2301,'龍燈依滅列(依滅列)',3,'',NULL,'農藥製字第04769號',NULL,NULL,NULL,'(±)-1-(β-allyloxy-2,4-dichlorophenylethyl)imidazole 21.200 (%)',NULL,'admin','龍燈生物科技股份有限公司',76),(2302,'龍燈允殺好(馬拉松)',3,'',NULL,'農藥製字第00316號',NULL,NULL,NULL,'diethyl (dimethoxythiophosphorylthio)succinate 50.000 (%)',NULL,'admin','龍燈生物科技股份有限公司',76),(2303,'龍燈大滅松(大滅松)',3,'',NULL,'農藥製字第00372號',NULL,NULL,NULL,' O, O-dimethyl-S-methylcarbamoylmethyl phosphorodithioate  44.000 (%)',NULL,'admin','龍燈生物科技股份有限公司',76),(2304,'龍燈快得寧(快得寧)',3,'',NULL,'農藥製字第00151號',NULL,NULL,NULL,'bis(quinolin-8-olato-O,N)copper 40.000 (%)',NULL,'admin','龍燈生物科技股份有限公司',76),(2305,'龍燈精鏈油(礦物油)',3,'','有機資審字第103001號','農藥製字第00584號',NULL,NULL,NULL,'礦物油Aliphatichydrocarbons95%；其他增量劑5%',NULL,'admin','龍燈生物科技股份有限公司',76),(2306,'龍畢寧(畢芬寧)',3,'',NULL,'農藥製字第06347號',NULL,NULL,NULL,'2-methylbiphenyl-3-ylmethyl (Z)-(1RS,3RS)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate  2.500 (%)',NULL,'admin','龍燈生物科技股份有限公司',76),(2307,'龍發威(納得亞滅寧)',3,'',NULL,'農藥製字第04079號',NULL,NULL,NULL,'納乃得 12% 亞滅寧 1.5%',NULL,'admin','光華化學股份有限公司',77),(2308,'龍百利(百利普芬)',3,'',NULL,'農藥製字第05962號',NULL,NULL,NULL,'4-phenoxyphenyl (RS)-2-(2-pyridyloxy)propyl ether 11.000 (%)  ',NULL,'admin','龍燈生物科技股份有限公司',76),(2309,'龍福果(依普同)',3,'',NULL,'農藥進字第02079號',NULL,NULL,NULL,'3-(3,5-dichlorophenyl)-N-isopropyl-2,4-dioxoimidazolidine-1-carboxamide  50.000 (%)',NULL,'admin','易利特開發有限公司',138),(2310,'龍稱(亞托敏)',3,'',NULL,'農藥進字第03008號',NULL,NULL,NULL,' methyl (E)-2-{2-[6-(2-cyanophenoxy)pyrimidin-4-yloxy]phenyl}-3-methoxyacrylate  23.000 (%)',NULL,'admin','台灣龍燈股份有限公司',152),(2311,'龍總颱(益達胺)',3,'',NULL,'農藥製字第05603號',NULL,NULL,NULL,'1-(6-chloro-3-pyridylmethyl)-N-nitroimidazolidin-2-ylideneamine 18.200 (%)',NULL,'admin','龍燈生物科技股份有限公司',76),(2312,'龍腈炭(腈硫醌)',3,'',NULL,'農藥製字第05643號',NULL,NULL,NULL,' 5,10-dihydro-5,10-dioxonaphtho[2,3-b]-1,4-dithiine-2,3-dicarbonitrile  42.200 (%)',NULL,'admin','龍燈生物科技股份有限公司',76),(2313,'龍菁翠(菲克利)',3,'',NULL,'農藥製字第05654號',NULL,NULL,NULL,'(RS)-2-(2,4-dichlorophenyl)-1-(1H-1,2,4-triazol-1-yl) hexan-2-ol 23.000 (%)',NULL,'admin','龍燈生物科技股份有限公司',76),(2314,'龍虎牌龍騰生技肥',2,'','有機資審字第101015號',NULL,'混合有機質肥料(5-12)','肥製(質)字第0010009號','豆粉、菜籽粕、蓖麻粕、糖蜜','全氮5.5%全磷酐2.2%全氧化鉀2.2%有機質86%',NULL,'admin','三傑飼料股份有限公司',33),(2315,'龍蟎吉(芬普蟎)',3,'',NULL,'農藥製字第05990號',NULL,NULL,NULL,'tert-butyl (E)-α-(1,3-dimethyl-5-phenoxypyrazol-4-ylmethyleneamino-oxy)-p-toluate 5.000  (%)',NULL,'admin','龍燈生物科技股份有限公司',76),(2316,'龍財寧(益滅賽寧)',3,'',NULL,'農藥製字第05335號',NULL,NULL,NULL,'(1)O,O-dimethyl S-phthalimidomethyl phosphorodithioate…30%  (2)(RS)-α-cyano-3-phenoxybenzyl(1RS)-cis-trans-3-(2,2-dichlorovinyl)-2,2-dimethyl cyclopropanecarboxylate …10%',NULL,'admin','龍燈生物科技股份有限公司',76),(2317,'龍速安(賽速安)',3,'',NULL,'農藥製字第06329號',NULL,NULL,NULL,'3-(2-chloro-1,3-thiazol-5-ylmethyl)-5-methyl-1,3,5-oxadiazinan-4-ylidene(nitro)amine 25.000 (%) ',NULL,'admin','龍燈生物科技股份有限公司',76),(2318,'龍頭(待克利)',3,'',NULL,'農藥製字第05681號',NULL,NULL,NULL,'cis,trans-3-chloro-4-[4-methyl-2-(1H-1,2,4-triazol-1- ylmethyl)-1,3-dioxolan-2-yl]phenyl-4-chlorophenyl ether 24.900 (%)',NULL,'admin','利台化學工業股份有限公司',116),(2319,'龍顧(賽洛寧)',3,'',NULL,'農藥製字第05615號',NULL,NULL,NULL,'(S)-α-cyano-3-phenoxybenzyl (Z)-(1R,3R)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate and (R)-α-cyano-3-phenoxybenzyl (Z)-(1S,3S)-3-(2-chloro-3,3,3-trifluoroprop-1-enyl)-2,2-dimethylcyclopropanecarboxylate (1:1) 2.800  (%)  ',NULL,'admin','龍燈生物科技股份有限公司',76);
/*!40000 ALTER TABLE `ITEMS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LOCAL`
--

DROP TABLE IF EXISTS `LOCAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LOCAL` (
  `local_id` int(10) NOT NULL AUTO_INCREMENT,
  `local_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `local_ne_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `local_abbr` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `region_id` int(10) NOT NULL,
  `province_id` int(10) NOT NULL,
  `local_postal_code` int(10) NOT NULL,
  PRIMARY KEY (`local_id`,`local_postal_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2289 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOCAL`
--

LOCK TABLES `LOCAL` WRITE;
/*!40000 ALTER TABLE `LOCAL` DISABLE KEYS */;
INSERT INTO `LOCAL` VALUES (0,'台灣','Taiwan',NULL,0,0,0),(1,'呼和浩特 ','Hohhot ','HET ',1,1,10000),(2,'土默特左旗 ','Tumed Left Banner ',' ',1,1,10100),(3,'托克托 ','Tuoketuo ',' ',1,1,10200),(4,'和林格尔 ','Horinger ',' ',1,1,11500),(5,'清水河 ','Qingshuihe ',' ',1,1,11600),(6,'武川 ','Wuchuan ',' ',1,1,11700),(7,'四子王旗 ','Siziwang Banner ',' ',1,1,11800),(8,'集宁 ','Jining ',' ',1,1,12000),(9,'丰镇 ','Fengzhen ',' ',1,1,12100),(10,'察哈尔右翼前旗 ','Chahar Right Front Banner ',' ',1,1,12200),(11,'卓资 ','Zhuozi ',' ',1,1,12300),(12,'察哈尔右翼后旗 ','Chahar Right Rear Banner ',' ',1,1,12400),(13,'苏尼特右旗 ','Sonid Right Banner ',' ',1,1,12500),(14,'二连浩特 ','Erenhot ',' ',1,1,12600),(15,'苏尼特左旗 ','Sonid Left Banner ',' ',1,1,13100),(16,'镶黄旗 ','Boarder Yellow Banner ',' ',1,1,13200),(17,'化德 ','Huade  ',' ',1,1,13300),(18,'商都 ','Shangdu  ',' ',1,1,13400),(19,'察哈尔右翼中旗 ','Chahar Right Middle Banner ',' ',1,1,13500),(20,'兴和 ','Xinghe ',' ',1,1,13600),(21,'凉城 ','Liangcheng  ',' ',1,1,13700),(22,'包头 ','Baotou ','BAV ',1,1,14000),(23,'白云鄂博 ','Bayan Obo ',' ',1,1,14080),(24,'土默特右旗 ','Tumd Right Banner ',' ',1,1,14100),(25,'固阳 ','Guyang  ',' ',1,1,14200),(26,'达茂旗 ','Darhan Muminggan Joint Banner ',' ',1,1,14300),(27,'达拉特旗 ','Dalad Banner ',' ',1,1,14300),(28,'乌拉特前旗 ','Urad Front Banner ',' ',1,1,14400),(29,'临河 ','Linhe ',' ',1,1,15000),(30,'五原 ','Wuyuan ',' ',1,1,15100),(31,'磴口 ','Dengkou  ',' ',1,1,15200),(32,'乌拉特中旗 ','Urad Middle Banner ',' ',1,1,15300),(33,'杭锦后旗 ','Hanggin Rear Banner ',' ',1,1,15400),(34,'乌拉特后旗 ','Urad Middle Rear Banner ',' ',1,1,15500),(35,'乌海 ','Wuhai ','WUA ',1,1,16000),(36,'鄂托克旗 ','Otog Banner ',' ',1,1,16100),(37,'鄂托克前旗 ','Otog Front Banner ',' ',1,1,16200),(38,'东胜 ','Dongsheng  ',' ',1,1,17000),(39,'准格尔旗 ','Jungar Banner ',' ',1,1,17100),(40,'伊金霍洛旗 ','Ejin Horo Banner ',' ',1,1,17200),(41,'乌审 ','Wushen  ',' ',1,1,17300),(42,'杭棉旗 ','Hanggin Banner ',' ',1,1,17400),(43,'海拉尔 ','Hailar  ','HLD ',1,1,21000),(44,'鄂温克 ','Evenki  ',' ',1,1,21100),(45,'新巴尔虎左旗 ','Prairie Chenbarhu Left banner ',' ',1,1,21200),(46,'新巴尔虎右旗 ','Prairie Chenbarhu Right banner ',' ',1,1,21300),(47,'满洲里 ','Manzhouli ',' ',1,1,21400),(48,'陈巴尔虎旗 ','Prairie Chenbarhu banner ',' ',1,1,21500),(49,'牙克石 ','Yakeshi ',' ',1,1,22100),(50,'额尔古纳 ','Ergun  ',' ',1,1,22200),(51,'根河 ','Genhe ',' ',1,1,22300),(52,'鄂伦春 ','Oroqen  ',' ',1,1,22400),(53,'赤峰 ','Chifeng ','CIF ',1,1,24000),(54,'宁城 ','Ningcheng ',' ',1,1,24200),(55,'敖汉旗 ','Aohan  Banner ',' ',1,1,24300),(56,'喀喇沁旗 ','Harqin Banner ',' ',1,1,24400),(57,'翁牛特旗 ','Ongniud Banner ',' ',1,1,24500),(58,'巴林右旗 ','Baarin Right Banner ',' ',1,1,25100),(59,'林西 ','Linxi  ',' ',1,1,25200),(60,'克什克腾旗 ','Hexigten Banner ',' ',1,1,25300),(61,'巴林左旗 ','Baarin Left Banner ',' ',1,1,25400),(62,'阿鲁科尔沁 ','Ar Horqin Banner ',' ',1,1,25500),(63,'锡林浩特 ','Xilin Hot ','XIL ',1,1,26000),(64,'阿马嗄旗 ','Amaa Banner ',' ',1,1,26100),(65,'西乌珠穆沁旗 ','West Ujimqin banner ',' ',1,1,26200),(66,'东乌珠穆沁旗 ','East Ujimqin Banner ',' ',1,1,26300),(67,'太仆寺旗 ','Taipusi Banner ',' ',1,1,27000),(68,'正镶白旗 ','Zhengxiangbai Banner ',' ',1,1,27100),(69,'正蓝旗 ','Zhenglan Banner ',' ',1,1,27200),(70,'多伦 ','Duolun ',' ',1,1,27300),(71,'通辽 ','Tongliao ','TGO ',1,1,28000),(72,'科尔沁左翼后旗 ',' Horqin Left Back Banner ',' ',1,1,28100),(73,'库伦旗 ','Hure Banner ',' ',1,1,28200),(74,'奈曼旗 ',' Naiman Banner ',' ',1,1,28300),(75,'开鲁 ','Kailu ',' ',1,1,28400),(76,'扎鲁特旗 ','Jarud Banner ',' ',1,1,29100),(77,'霍林郭勒 ','Holingol  ',' ',1,1,29200),(78,'科尔沁左翼中旗 ',' Horqin Left Middle Banner ',' ',1,1,29300),(79,'科尔沁右翼中旗 ','Horqin Right Middle Banner ',' ',1,1,29400),(80,'太原 ','Taiyuan ','TYN ',1,2,30000),(81,'阳曲 ','Yangqu  ',' ',1,2,30100),(82,'古交 ','Gujiao ',' ',1,2,30200),(83,'娄烦 ','Loufan  ',' ',1,2,30300),(84,'清徐 ','Qingxu  ',' ',1,2,30400),(85,'交城 ','Jiaochen  ',' ',1,2,30500),(86,'榆次 ','Yuci  ',' ',1,2,30600),(87,'太谷 ','Taigu  ',' ',1,2,30800),(88,'祁县 ','Qi xian ',' ',1,2,30900),(89,'平遥 ','Pingyao ',' ',1,2,31100),(90,'介休 ','Jiexiu ',' ',1,2,31200),(91,'灵石 ','Lingshi ',' ',1,2,31300),(92,'霍州 ','Huozhou ',' ',1,2,31400),(93,'汾西 ','Fenxi  ',' ',1,2,31500),(94,'洪洞 ','Hongdong  ',' ',1,2,31600),(95,'寿阳 ','Shouyang ',' ',1,2,31700),(96,'榆社 ','Yushe  ',' ',1,2,31800),(97,'文水 ','Wenshui  ',' ',1,2,32100),(98,'孝义 ','Xiaoyi ',' ',1,2,32300),(99,'交口 ','Jiaokou ',' ',1,2,32400),(100,'石楼 ','Shilou ',' ',1,2,32500),(101,'左权 ','Zuoquan ',' ',1,2,32600),(102,'和顺 ','Heshun  ',' ',1,2,32700),(103,'离石 ','Lishi  ',' ',1,2,33000),(104,'方山 ','Fangshan  ',' ',1,2,33100),(105,'临县 ','Lin xian ',' ',1,2,33200),(106,'汾阳 ','Fenyang ',' ',1,2,33200),(107,'柳林 ','Liulin ',' ',1,2,33300),(108,'中阳 ','Zhongyang  ',' ',1,2,33400),(109,'忻州 ','Xinzhou ',' ',1,2,34000),(110,'原平 ','Yuanping ',' ',1,2,34100),(111,'代县 ','Dai xian ',' ',1,2,34200),(112,'繁峙 ','Fanshi  ',' ',1,2,34300),(113,'灵丘 ','Lingqiu  ',' ',1,2,34400),(114,'静乐 ','Jingle  ',' ',1,2,35100),(115,'岚县 ','Lan xian ',' ',1,2,35200),(116,'兴县 ','Xing xian ',' ',1,2,35300),(117,'定襄 ','Dingxiang  ',' ',1,2,35400),(118,'五台 ','Wutai  ',' ',1,2,35500),(119,'宁武 ','Ningwu  ',' ',1,2,36000),(120,'神池 ','Shenchi  ',' ',1,2,36100),(121,'五寨 ','Wuzhai  ',' ',1,2,36200),(122,'岢岚 ','Kelan  ',' ',1,2,36300),(123,'偏关 ','Pianguan  ',' ',1,2,36400),(124,'河曲 ','Hequ  ',' ',1,2,36500),(125,'保德 ','Baode  ',' ',1,2,36600),(126,'大同 ','Datong ','DAT ',1,2,37000),(127,'左云 ','Zuoyun  ',' ',1,2,37100),(128,'右玉 ','Youyu  ',' ',1,2,37200),(129,'大同县 ','Datong  ',' ',1,2,37300),(130,'浑源 ','Hunyuan  ',' ',1,2,37400),(131,'广灵 ','Guangling  ',' ',1,2,37500),(132,'应县 ','Yingxian ',' ',1,2,37600),(133,'阳高 ','Yanggao  ',' ',1,2,38100),(134,'天镇 ','Tianzhen ',' ',1,2,38200),(135,'怀仁 ','Huairen  ',' ',1,2,38300),(136,'山阴 ','Shanyin ',' ',1,2,38400),(137,'朔州 ','Shuozhou ',' ',1,2,38500),(138,'临汾 ','Linfen  ',' ',1,2,41000),(139,'蒲县 ','Puxian ',' ',1,2,41200),(140,'隰县 ','Xixian ',' ',1,2,41300),(141,'永和 ','Yonghe ',' ',1,2,41400),(142,'襄汾 ','Xiangfen  ',' ',1,2,41500),(143,'乡宁 ','Xiangning ',' ',1,2,42100),(144,'吉县 ','Jixian ',' ',1,2,42200),(145,'大宁 ','Daning  ',' ',1,2,42300),(146,'古县 ','Guxian ',' ',1,2,42400),(147,'安泽 ','Anze  ',' ',1,2,42500),(148,'浮山 ','Fushan ',' ',1,2,42600),(149,'候马 ','Houma ',' ',1,2,43000),(150,'新绛 ','Xinjiang  ',' ',1,2,43100),(151,'稷山 ','Jishan  ',' ',1,2,43200),(152,'河津 ','Kawazu ',' ',1,2,43300),(153,'曲沃 ','Quwo  ',' ',1,2,43400),(154,'翼城 ','Yicheng  ',' ',1,2,43500),(155,'绛县 ','Jiangxian ',' ',1,2,43600),(156,'垣曲 ','Yuanqu ',' ',1,2,43700),(157,'闻喜 ','Wenxi  ',' ',1,2,43800),(158,'运城 ','Yuncheng  ',' ',1,2,44000),(159,'临猗 ','Linyi  ',' ',1,2,44100),(160,'万荣 ','Wanrong ',' ',1,2,44200),(161,'平陆 ','Pinglu  ',' ',1,2,44300),(162,'夏县 ','Xiaxian ',' ',1,2,44400),(163,'永剂 ','Yongji ',' ',1,2,44500),(164,'芮城 ','Ruicheng  ',' ',1,2,44600),(165,'阳泉 ','Yangquan ',' ',1,2,45000),(166,'孟县 ','Mengxian ',' ',1,2,45100),(167,'平定 ','Pingding ',' ',1,2,45200),(168,'昔阳 ','Xiyang ',' ',1,2,45300),(169,'长治 ','Changzhi  ','CIH ',1,2,46000),(170,'屯留 ','Tunliu  ',' ',1,2,46100),(171,'襄垣 ','Xiangyuan  ',' ',1,2,46200),(172,'武乡 ','Wuxiang  ',' ',1,2,46300),(173,'沁县 ','Qinxian ',' ',1,2,46400),(174,'沁源 ','Qinyuan ',' ',1,2,46500),(175,'长子 ','Zhangzi  ',' ',1,2,46600),(176,'高平 ','Gaoping ',' ',1,2,46700),(177,'长治县 ','Changzhi  ',' ',1,2,47100),(178,'壶关 ','Huguan ',' ',1,2,47300),(179,'平顺 ','Pingshun ',' ',1,2,47400),(180,'潞城 ','Lucheng ',' ',1,2,47500),(181,'黎城 ','Licheng ',' ',1,2,47600),(182,'晋城 ','Jincheng ',' ',1,2,48000),(183,'阳城 ','Yangcheng ',' ',1,2,48100),(184,'沁水 ','Qinshui  ',' ',1,2,48200),(185,'陵川 ','Lingchuan  ',' ',1,2,48300),(186,'石家庄 ','Shijiazhuang  ','SJW ',1,3,50000),(187,'获鹿 ','Huolu ',' ',1,3,50200),(188,'井陉 ','Jingxing  ',' ',1,3,50300),(189,'平山 ','Pingshan  ',' ',1,3,50400),(190,'灵寿 ','Lingshou  ',' ',1,3,50500),(191,'行唐 ','Xingtang  ',' ',1,3,50600),(192,'新乐 ','Xinle ',' ',1,3,50700),(193,'正定 ','Zhengding  ',' ',1,3,50800),(194,'元氏 ','Yuanshi  ',' ',1,3,51100),(195,'赞皇 ','Zanhuang ',' ',1,3,51200),(196,'高邑 ','Gaoyi  ',' ',1,3,51300),(197,'栾城 ','Luancheng  ',' ',1,3,51400),(198,'赵县 ','Zhaoxian ',' ',1,3,51500),(199,'宁晋 ','Ningjin  ',' ',1,3,51600),(200,'新河 ','Xinhe ',' ',1,3,51700),(201,'南宫 ','Nangong  ',' ',1,3,51800),(202,'晋州 ','Jinju  ',' ',1,3,52200),(203,'辛集 ','Xinji ',' ',1,3,52300),(204,'无极 ','Wuji ',' ',1,3,52400),(205,'深泽 ','Shenze  ',' ',1,3,52500),(206,'安平 ','Anping ',' ',1,3,52600),(207,'铙阳 ','Naoyang ',' ',1,3,52700),(208,'深州 ','Shenzhou ',' ',1,3,52800),(209,'衡水 ','Hengshui  ',' ',1,3,53000),(210,'枣强 ','Zaoqiang ',' ',1,3,53100),(211,'冀县 ','Jixian ',' ',1,3,53200),(212,'武强 ','Wuqiang ',' ',1,3,53300),(213,'武邑 ','Wuyi ',' ',1,3,53400),(214,'景县 ','Jiangxian ',' ',1,3,53500),(215,'邢台 ','Xingtai ',' ',1,3,54000),(216,'沙河 ','Shahe ',' ',1,3,54100),(217,'内丘 ','Neiqiu  ',' ',1,3,54200),(218,'临城 ','Lincheng ',' ',1,3,54300),(219,'南和 ','Nanhe ',' ',1,3,54400),(220,'平乡 ','Pingxiang ',' ',1,3,54500),(221,'广宗 ','guangzong ',' ',1,3,54600),(222,'威县 ','Weixian ',' ',1,3,54700),(223,'清河 ','Qinghe ',' ',1,3,54800),(224,'任县 ','Renxian ',' ',1,3,55100),(225,'巨鹿 ','Gulu ',' ',1,3,55200),(226,'隆尧 ','Longyao ',' ',1,3,55300),(227,'柏乡 ','BaiXiang ',' ',1,3,55400),(228,'邯郸 ','Handan  ','HDG ',1,3,56000),(229,'武安 ','Wuan ',' ',1,3,56300),(230,'涉县 ','Shexian ',' ',1,3,56400),(231,'磁县 ','Cixian ',' ',1,3,56500),(232,'临漳 ','Linzhang  ',' ',1,3,56600),(233,'成安 ','Chengan ',' ',1,3,56700),(234,'魏县 ','Weixian ',' ',1,3,56800),(235,'大名 ','Daming ',' ',1,3,56900),(236,'永年 ','Yongnian ',' ',1,3,57100),(237,'曲周 ','quzhou ',' ',1,3,57200),(238,'鸡泽 ','Jize ',' ',1,3,57300),(239,'丘县 ','Qiuxian ',' ',1,3,57400),(240,'肥乡 ','Feixian ',' ',1,3,57500),(241,'广平 ','Guangpin ',' ',1,3,57600),(242,'馆陶 ','Guantao ',' ',1,3,57700),(243,'临西 ','Linxi  ',' ',1,3,57800),(244,'沧州 ','Cangzhou ',' ',1,3,61000),(245,'黄骅 ','Huanghua ',' ',1,3,61100),(246,'海兴 ','Haixing  ',' ',1,3,61200),(247,'盐山 ','Yanshan  ',' ',1,3,61300),(248,'孟村 ','Mengcun  ',' ',1,3,61400),(249,'南皮 ','Nanpi ',' ',1,3,61500),(250,'东光 ','Dongguang ',' ',1,3,61600),(251,'阜城 ','Fucheng ',' ',1,3,61700),(252,'吴桥 ','Wuqiao  ',' ',1,3,61800),(253,'泊头 ','Botou ',' ',1,3,62100),(254,'献县 ','Xianxian ',' ',1,3,62200),(255,'肃宁 ','Suning  ',' ',1,3,62300),(256,'河间 ','Hejian ',' ',1,3,62400),(257,'任丘 ','Renqiu ',' ',1,3,62500),(258,'青县 ','Qingxian ',' ',1,3,62600),(259,'唐山 ','Tangshan ',' ',1,3,63000),(260,'唐海 ','Tanghai ',' ',1,3,63200),(261,'丰南 ','Fengnan ',' ',1,3,63300),(262,'滦南 ','Luannan ',' ',1,3,63500),(263,'乐亭 ','Leting ',' ',1,3,63600),(264,'滦县 ','Luanxian ',' ',1,3,63700),(265,'丰润 ','Fengrun ',' ',1,3,64000),(266,'玉田 ','Yutian ',' ',1,3,64100),(267,'遵化 ','Zunhua ',' ',1,3,64200),(268,'迁西 ','Qianxi ',' ',1,3,64300),(269,'迁安 ','Qianan ',' ',1,3,64400),(270,'霸州 ','Bazhou ',' ',1,3,65700),(271,'秦皇岛 ','Qinhuangdao ','SHP ',1,3,66000),(272,'抚宁 ','Funing ',' ',1,3,66300),(273,'卢龙 ','Lulong ',' ',1,3,66400),(274,'青龙 ','Qinglong ',' ',1,3,66500),(275,'昌黎 ','Changli ',' ',1,3,66600),(276,'承德 ','Chengde ',' ',1,3,67000),(277,'兴隆 ','Xinglong ',' ',1,3,67300),(278,'承德县 ','Chengde ',' ',1,3,67400),(279,'平泉 ','Pingquan ',' ',1,3,67500),(280,'宽城 ','Kuancheng ',' ',1,3,67600),(281,'隆化 ','Longhua  ',' ',1,3,68100),(282,'滦平 ','Luanping  ',' ',1,3,68200),(283,'丰宁 ','Fengning ',' ',1,3,68300),(284,'围场 ','Weichang ',' ',1,3,68400),(285,'保定 ','Baoding ',' ',1,3,71000),(286,'清苑 ','Qingyuan ',' ',1,3,71100),(287,'安国 ','Anguo ',' ',1,3,71200),(288,'博野 ','Boye ',' ',1,3,71300),(289,'蠡县 ','Lixian ',' ',1,3,71400),(290,'高阳 ','Gaoyang ',' ',1,3,71500),(291,'安新 ','Anxin ',' ',1,3,71600),(292,'容城 ','Rongcheng ',' ',1,3,71700),(293,'雄县 ','Xiongxian ',' ',1,3,71800),(294,'潢城 ','Huangcheng ',' ',1,3,72100),(295,'顺平 ','Shunping ',' ',1,3,72200),(296,'唐县 ','Tangxian ',' ',1,3,72300),(297,'望都 ','Wangdu ',' ',1,3,72400),(298,'徐水 ','Xushui ',' ',1,3,72500),(299,'定兴 ','Dingxing ',' ',1,3,72600),(300,'涿州 ','Zhuozhou ',' ',1,3,72700),(301,'定州 ','Dingzhou ',' ',1,3,73000),(302,'曲阳 ','Quyang ',' ',1,3,73100),(303,'阜平 ','Fuping ',' ',1,3,73200),(304,'高碑店 ','Gaobeidian ',' ',1,3,74000),(305,'涞水 ','Laishui ',' ',1,3,74100),(306,'易县 ','Yixian ',' ',1,3,74200),(307,'张家口 ','Zhangjiakou ',' ',1,3,75000),(308,'宣化 ','Xuanhua ',' ',1,3,75100),(309,'怀来 ','Huailai ',' ',1,3,75400),(310,'赤城 ','Chicheng ',' ',1,3,75500),(311,'涿鹿 ','Zhuolu ',' ',1,3,75600),(312,'蔚县 ','Yunxian ',' ',1,3,75700),(313,'阳原 ','Yangyuan ',' ',1,3,75800),(314,'怀安 ','Huaian ',' ',1,3,76100),(315,'万全 ','Wanquan ',' ',1,3,76200),(316,'崇礼 ','Chongli ',' ',1,3,76300),(317,'张北 ','Zhangbei ',' ',1,3,76400),(318,'沽源 ','Guyuan ',' ',1,3,76500),(319,'康保 ','Kangbao ',' ',1,3,76600),(320,'尚义 ','Shangyi ',' ',1,3,76700),(321,'4 ','Beijing ','PEK ',1,4,100000),(322,'通县 ','Tongxian ',' ',1,4,101100),(323,'平台 ','Pingtai ',' ',1,4,101200),(324,'顺义 ','Shunyi ',' ',1,4,101300),(325,'怀柔 ','Huairou ',' ',1,4,101400),(326,'密云 ','Miyun ',' ',1,4,101500),(327,'三河 ','Sanhe ',' ',1,3,101600),(328,'大厂 ','Dachang ',' ',1,3,101700),(329,'延庆 ','Yanqing ',' ',1,4,102100),(330,'昌平 ','Changping ',' ',1,4,102200),(331,'大兴 ','Daxing ',' ',1,4,102600),(332,'固安 ','Guan ',' ',1,3,102700),(333,'廊坊 ','Langfang ',' ',1,3,102800),(334,'涞源 ','Laiyuan ',' ',1,3,102900),(335,'沈阳 ','Shenyang ','SHE ',5,5,110000),(336,'辽中 ','Liaozhong ',' ',5,5,110200),(337,'新民 ','Xinmin ',' ',5,5,110300),(338,'辽阳 ','Liaoyang ',' ',5,5,111000),(339,'辽阳县 ','Liaoyangxian ',' ',5,5,111200),(340,'灯塔 ','Dengta ',' ',5,5,111300),(341,'铁岭 ','Tieling ',' ',5,5,112000),(342,'法库 ','Faku ',' ',5,5,112100),(343,'康平 ','Kangping ',' ',5,5,112200),(344,'开原 ','Kaiyuan ',' ',5,5,112300),(345,'西丰 ','Xifeng ',' ',5,5,112400),(346,'昌图 ','Changtu ',' ',5,5,112500),(347,'铁岭县 ','Tielingxian ',' ',5,5,112600),(348,'铁法 ','Tiefa ',' ',5,5,112700),(349,'抚顺 ','Fushun ',' ',5,5,113000),(350,'抚顺县 ','Fushunxian ',' ',5,5,113100),(351,'新宾 ','Xinbin ',' ',5,5,113200),(352,'清原 ','Qingyuan ',' ',5,5,113300),(353,'鞍山 ','Anshan ',' ',5,5,114000),(354,'台安 ','Taian ',' ',5,5,114100),(355,'海城 ','Haicheng ',' ',5,5,114200),(356,'岫岩 ','Xiuyan ',' ',5,5,114300),(357,'营口 ','Yingkou ',' ',5,5,115000),(358,'大石桥 ','Dashiqiao ',' ',5,5,115100),(359,'盖州 ','Gaizhou ',' ',5,5,115200),(360,'大连 ','Dalian ','DLC ',5,5,116000),(361,'金县 ','Jinxian ',' ',5,5,116100),(362,'普兰店市 ','Pulandian  ',' ',5,5,116200),(363,'瓦房店 ','Wafangdian ',' ',5,5,116300),(364,'庄河 ','Zhuanghe ',' ',5,5,116400),(365,'长海 ','Changhai ',' ',5,5,116500),(366,'金州 ','Jinzhou ',' ',5,5,116600),(367,'本溪 ','Benxi ',' ',5,5,117000),(368,'本溪县 ','Benxixian ',' ',5,5,117100),(369,'桓仁 ','Huanren ',' ',5,5,117200),(370,'丹东 ','Dandong ','DDG ',5,5,118000),(371,'凤城 ','Fengcheng ',' ',5,5,118100),(372,'宽甸 ','Kuandian ',' ',5,5,118200),(373,'东港 ','Donggang ',' ',5,5,118300),(374,'锦州 ','Jinzhou ',' ',5,5,121000),(375,'义县 ','Yixian ',' ',5,5,121100),(376,'凌海 ','Linghai ',' ',5,5,121200),(377,'北宁 ','Beining ',' ',5,5,121300),(378,'黑山 ','Heishan ',' ',5,5,121400),(379,'葫芦岛 ','Huludao ',' ',5,5,121500),(380,'兴城 ','Xingcheng ',' ',5,5,121600),(381,'绥中 ','Suizhong ',' ',5,5,121700),(382,'朝阳 ','Chaoyang ','CHG ',5,5,122000),(383,'北票 ','Beipiao ',' ',5,5,122100),(384,'建昌 ','Jianchang ',' ',5,5,122200),(385,'喀喇沁左翼 ','Harqin Left Wing ',' ',5,5,122300),(386,'建平 ','Jianping ',' ',5,5,122400),(387,'凌源 ','Lingyuan ',' ',5,5,122500),(388,'朝阳县 ','Chaoyangxian ',' ',5,5,122600),(389,'阜新 ','Fuxin ',' ',5,5,123000),(390,'阜新县 ','Fuxinxian ',' ',5,5,123100),(391,'彰武 ','Zhangwu ',' ',5,5,123200),(392,'盘锦 ','Panjin ',' ',5,5,124000),(393,'盘山 ','Panshan ',' ',5,5,124100),(394,'大洼 ','Dawa ',' ',5,5,124200),(395,'长春 ','Changchun ','CGQ ',5,6,130000),(396,'农安 ','Nongan ',' ',5,6,130200),(397,'德惠 ','Dehui ',' ',5,6,130300),(398,'榆树 ','Yushu ',' ',5,6,130400),(399,'九台 ','Jiutai ',' ',5,6,130500),(400,'双阳 ','Shuangyang ',' ',5,6,130600),(401,'松原 ','Songyuan ',' ',5,6,131000),(402,'前郭 ','Qianguo ',' ',5,6,131100),(403,'扶余 ','Fuyu ',' ',5,6,131200),(404,'大安 ','Daan ',' ',5,6,131300),(405,'干安 ','Qianan ',' ',5,6,131400),(406,'长岭 ','Changling ',' ',5,6,131500),(407,'6 ','Jilin ',' ',5,6,132000),(408,'永吉 ','Yongji ',' ',5,6,132200),(409,'磐石 ','Panshi ',' ',5,6,132300),(410,'桦甸 ','Huadian ',' ',5,6,132400),(411,'蛟河 ','Jiaohe ',' ',5,6,132500),(412,'舒兰 ','Shulan ',' ',5,6,132600),(413,'延吉 ','Yanji ',' ',5,6,133000),(414,'图们 ','Tumen ',' ',5,6,133100),(415,'汪清 ','Wangqing ',' ',5,6,133200),(416,'珲春 ','Huichun ',' ',5,6,133300),(417,'龙井 ','Longjing ',' ',5,6,133400),(418,'和龙 ','Helong ',' ',5,6,133500),(419,'安图 ','Antu ',' ',5,6,133600),(420,'敦化 ','Dunhua ',' ',5,6,133700),(421,'通化 ','Tonghua ',' ',5,6,134000),(422,'通化县 ','Tonghuaxian ',' ',5,6,134100),(423,'临江 ','Linjiang ',' ',5,6,134100),(424,'集安 ','Jian ',' ',5,6,134200),(425,'江源 ','Jiangyuan ',' ',5,6,134300),(426,'长白 ','Changbai ',' ',5,6,134400),(427,'抚松 ','Fusong ',' ',5,6,134500),(428,'梅河口 ','Meihekou ',' ',5,6,135000),(429,'辉南 ','Huinan ',' ',5,6,135100),(430,'靖宇 ','Jingyu ',' ',5,6,135200),(431,'柳河 ','Liuhe ',' ',5,6,135300),(432,'四平 ','Siping ',' ',5,6,136000),(433,'公主岭 ','Gongzhuling ',' ',5,6,136100),(434,'辽源 ','Liaoyuan ',' ',5,6,136200),(435,'东丰 ','Dongfeng ',' ',5,6,136300),(436,'双辽 ','Shuangliao ',' ',5,6,136400),(437,'犁树 ','Lishu ',' ',5,6,136500),(438,'东辽 ','Dongliao ',' ',5,6,136600),(439,'白城 ','Baicheng ',' ',5,6,137000),(440,'洮南 ','Taonan ',' ',5,6,137100),(441,'通榆 ','Tongyu ',' ',5,6,137200),(442,'镇赉 ','Zhenlai ',' ',5,6,137300),(443,'乌兰浩特 ','Ulanhot ',' ',1,1,137400),(444,'突泉 ','Tuquan  ',' ',1,1,137500),(445,'扎赉特旗 ','Jalaid Banner ',' ',1,1,137600),(446,'哈尔滨 ','Haerbin ','HRB ',5,7,150000),(447,'双城 ','Shuangcheng ',' ',5,7,150100),(448,'五常 ','Wuchang ',' ',5,7,150200),(449,'阿城 ','Acheng ',' ',5,7,150300),(450,'宾县 ','Binxian ',' ',5,7,150400),(451,'呼兰 ','Hulan ',' ',5,7,150500),(452,'尚志 ','Shangzhi ',' ',5,7,150600),(453,'延寿 ','Yanshou ',' ',5,7,150700),(454,'方正 ','Fangzheng ',' ',5,7,150800),(455,'通河 ','Tonghe ',' ',5,7,150900),(456,'肇东 ','Zhaodong ',' ',5,7,151100),(457,'肇州 ','Zhaozhou ',' ',5,7,151200),(458,'肇源 ','Zhaoyuan ',' ',5,7,151300),(459,'安达 ','Anda ',' ',5,7,151400),(460,'兰西 ','Lanxi ',' ',5,7,151500),(461,'青冈 ','Qinggang ',' ',5,7,151600),(462,'明水 ','Mingshui ',' ',5,7,151700),(463,'巴彦 ','Bayan ',' ',5,7,151800),(464,'木兰 ','Mulan ',' ',5,7,151900),(465,'绥化 ','Suihua ',' ',5,7,152000),(466,'望奎 ','Wangkui ',' ',5,7,152100),(467,'绥棱 ','Suileng ',' ',5,7,152200),(468,'海伦 ','Hailun ',' ',5,7,152300),(469,'庆安 ','Qingan ',' ',5,7,152400),(470,'铁力 ','Tieli ',' ',5,7,152500),(471,'伊春 ','Yichun ',' ',5,7,153000),(472,'嘉荫 ','Jiayin ',' ',5,7,153200),(473,'佳木斯 ','Jiamusi ','JMU ',5,7,154000),(474,'鹤岗 ','Hegang ',' ',5,7,154100),(475,'萝北 ','Luobei ',' ',5,7,154200),(476,'桦川 ','Huachuan ',' ',5,7,154300),(477,'桦南 ','Huanan ',' ',5,7,154400),(478,'勃利 ','Boli ',' ',5,7,154500),(479,'七台河 ','Qitaihe ',' ',5,7,154600),(480,'汤原 ','Tangyuan ',' ',5,7,154700),(481,'依兰 ','Yilan ',' ',5,7,154800),(482,'集贤 ','Jixian ',' ',5,7,154900),(483,'双鸭山 ','Shuangyashan ',' ',5,7,155100),(484,'富锦 ','Fujin ',' ',5,7,156100),(485,'绥滨 ','Suibin ',' ',5,7,156200),(486,'同江 ','Tongjiang ',' ',5,7,156400),(487,'抚远 ','Fuyuan ',' ',5,7,156500),(488,'宝清 ','Baoqing ',' ',5,7,156600),(489,'饶河 ','Raohe ',' ',5,7,156700),(490,'友谊 ','Youyi ',' ',5,7,156900),(491,'牡丹江 ','Mudanjiang ','MDG ',5,7,157000),(492,'海林 ','Hailin ',' ',5,7,157100),(493,'东宁 ','Dongning ',' ',5,7,157200),(494,'绥芬河 ','Suifenhe ',' ',5,7,157300),(495,'宁安 ','Ningan ',' ',5,7,157400),(496,'穆棱 ','Muling ',' ',5,7,157500),(497,'林口 ','Linkou ',' ',5,7,157600),(498,'鸡西 ','Jixi ',' ',5,7,158100),(499,'鸡东 ','Jidong ',' ',5,7,158200),(500,'密山 ','Mishan ',' ',5,7,158300),(501,'虎林 ','Hulin ',' ',5,7,158400),(502,'齐齐哈尔 ','Qiqihaer ','NDG ',5,7,161000),(503,'龙江 ','Longjiang ',' ',5,7,161100),(504,'富裕 ','Fuyu ',' ',5,7,161200),(505,'讷河 ','Nehe ',' ',5,7,161300),(506,'嫩江 ','Nenjiang ',' ',5,7,161400),(507,'依安 ','Yian ',' ',5,7,161500),(508,'克山 ','Keshan ',' ',5,7,161600),(509,'拜泉 ','Baiquan ',' ',5,7,161700),(510,'克东 ','Kedong ',' ',5,7,161800),(511,'杜尔伯特 ','Dorbod  ',' ',5,7,162000),(512,'甘南 ','Gannan ',' ',5,7,162100),(513,'林甸 ','Lindian ',' ',5,7,162300),(514,'泰来 ','Tailai ',' ',5,7,162400),(515,'扎兰屯 ','Zalantun ',' ',1,1,162650),(516,'阿荣旗 ','Arong Banner ',' ',1,1,162750),(517,'莫力达瓦旗 ','Morin Dawa Banner ',' ',1,1,162800),(518,'大庆 ','Daqing ','DQA ',5,7,163000),(519,'北安 ','Beian ',' ',5,7,164000),(520,'五大连池 ','Wudalianchi  ',' ',5,7,164100),(521,'孙吴 ','Sunwu ',' ',5,7,164200),(522,'黑河 ','Heihe ',' ',5,7,164300),(523,'逊克 ','Xunke ',' ',5,7,164400),(524,'五大连池 ','Wudalianchi  ',' ',5,7,164500),(525,'加格达奇 ','Jiagedaqi ',' ',5,7,165000),(526,'呼玛 ','Huma ',' ',5,7,165100),(527,'塔河 ','Tahe ',' ',5,7,165200),(528,'漠河 ','Mohe ',' ',5,7,165300),(529,'8 ','Shanghai ','SHA ',3,8,200000),(530,'8县 ','Shanghaixian ',' ',3,8,201100),(531,'川沙 ','Chuansha ',' ',3,8,201200),(532,'南汇 ','Nanhui ',' ',3,8,201300),(533,'奉贤 ','Fengxian ',' ',3,8,201400),(534,'金山 ','Jinshan ',' ',3,8,201500),(535,'松江 ','Songjiang ',' ',3,8,201600),(536,'青浦 ','Qingpu ',' ',3,8,201700),(537,'嘉定 ','Jiading ',' ',3,8,201800),(538,'崇明 ','Chongming ',' ',3,8,202100),(539,'嵊泗 ','Shengsi ',' ',3,13,202450),(540,'南京 ','Nanjing ','NKG ',3,9,210000),(541,'江宁 ','Jiangning ',' ',3,9,211100),(542,'溧水 ','Lishui ',' ',3,9,211200),(543,'高淳 ','Gaochun ',' ',3,9,211300),(544,'仪征 ','Yizheng ',' ',3,9,211400),(545,'六合 ','Liuhe ',' ',3,9,211500),(546,'金湖 ','Jinhu ',' ',3,9,211600),(547,'盱眙 ','Xuyi ',' ',3,9,211700),(548,'江浦 ','Jiangpu ',' ',3,9,211800),(549,'泗洪 ','Sihong ',' ',3,9,211900),(550,'镇江 ','Zhenjiang ',' ',3,9,212000),(551,'丹徒 ','Dantu ',' ',3,9,212100),(552,'扬中 ','Yangzhong ',' ',3,9,212200),(553,'丹阳 ','Danyang ',' ',3,9,212300),(554,'句容 ','Jurong ',' ',3,9,212400),(555,'常州 ','Changzhou ','CZX ',3,9,213000),(556,'武进 ','Wujin ',' ',3,9,213100),(557,'金坛 ','Jintan ',' ',3,9,213200),(558,'溧阳 ','Liyang ',' ',3,9,213300),(559,'无锡 ','Wuxi ','WUX ',3,9,214000),(560,'锡山 ','Xishan ',' ',3,9,214100),(561,'宜兴 ','Yixing ',' ',3,9,214200),(562,'江阴 ','Jiangyin ',' ',3,9,214400),(563,'靖江 ','Jingjiang ',' ',3,9,214500),(564,'苏州 ','Suzhou ',' ',3,9,215000),(565,'吴县 ','Wuxian ',' ',3,9,215100),(566,'吴江 ','Wujiang ',' ',3,9,215200),(567,'昆山 ','Kunshan ',' ',3,9,215300),(568,'太仓 ','Taicang ',' ',3,9,215400),(569,'常熟 ','Changshu ',' ',3,9,215500),(570,'张家港 ','Zhangjiagang ',' ',3,9,215600),(571,'徐州 ','Xuzhou ','XUZ ',3,9,221000),(572,'铜山 ','Tongshan ',' ',3,9,221100),(573,'睢宁 ','Suining ',' ',3,9,221200),(574,'邳州 ','Pizhou ',' ',3,9,221300),(575,'新沂 ','Xinyi ',' ',3,9,221400),(576,'沛县 ','Peixian ',' ',3,9,221600),(577,'丰县 ','Fengxian ',' ',3,9,221700),(578,'连云港 ','Lianyungang ','LYG ',3,9,222000),(579,'赣榆 ','Ganyu ',' ',3,9,222100),(580,'灌云 ','Guanyun ',' ',3,9,222200),(581,'东海 ','Donghai ',' ',3,9,222300),(582,'淮阴 ','Huaiyin ',' ',3,9,223000),(583,'洪泽 ','Hongze ',' ',3,9,223100),(584,'淮安 ','Huaian ',' ',3,9,223200),(585,'淮阴县 ','Huaiyinxian ',' ',3,9,223300),(586,'涟水 ','Lianshui ',' ',3,9,223400),(587,'灌南 ','Guannan ',' ',3,9,223500),(588,'沭阳 ','Shuyang  ',' ',3,9,223600),(589,'泗阳 ','Siyang ',' ',3,9,223700),(590,'宿迁 ','Suqian ',' ',3,9,223800),(591,'盐城 ','Yancheng ','YNZ ',3,9,224000),(592,'大丰 ','Dafeng ',' ',3,9,224100),(593,'东台 ','Dongtai ',' ',3,9,224200),(594,'射阳 ','Sheyang ',' ',3,9,224300),(595,'阜宁 ','Funing ',' ',3,9,224400),(596,'滨海 ','Binhai ',' ',3,9,224500),(597,'响水 ','Xiangshui ',' ',3,9,224600),(598,'建湖 ','Jianhu ',' ',3,9,224700),(599,'扬州 ','Yangzhou ',' ',3,9,225000),(600,'邗江 ','Hanjiang ',' ',3,9,225100),(601,'江都 ','Jiangdou ',' ',3,9,225200),(602,'泰州 ','Taizhou ',' ',3,9,225300),(603,'泰兴 ','Taixing ',' ',3,9,225400),(604,'姜堰 ','Jiangyan ',' ',3,9,225500),(605,'高邮 ','Gaoyou ',' ',3,9,225600),(606,'兴化 ','Xinghua ',' ',3,9,225700),(607,'宝应 ','Baoying ',' ',3,9,225800),(608,'海门 ','Haimen ',' ',3,9,226100),(609,'启东 ','Qidong ',' ',3,9,226200),(610,'通州市 ','Tongzhou ',' ',3,9,226300),(611,'南通 ','Nantong ',' ',3,9,226300),(612,'如东 ','Rudong ',' ',3,9,226400),(613,'如皋 ','Rugao ',' ',3,9,226500),(614,'海安 ','Haian ',' ',3,9,226600),(615,'合肥 ','Hefei ','HFE ',3,10,230000),(616,'长丰 ','Changfeng ',' ',3,10,231100),(617,'肥西 ','Feixi ',' ',3,10,231200),(618,'舒城 ','Shucheng ',' ',3,10,231300),(619,'桐城 ','Tongcheng ',' ',3,10,231400),(620,'庐江 ','Lujiang ',' ',3,10,231500),(621,'肥东 ','Feidong ',' ',3,10,231600),(622,'淮南 ','Huainan ',' ',3,10,232000),(623,'凤台 ','Fengtai ',' ',3,10,232100),(624,'寿县 ','Shouxian ',' ',3,10,232200),(625,'蚌埠 ','Bangbu ',' ',3,10,233000),(626,'凤阳 ','Fengyang ',' ',3,10,233100),(627,'定远 ','Dingyuan ',' ',3,10,233200),(628,'五河 ','Wuhe ',' ',3,10,233300),(629,'怀远 ','Huaiyuan ',' ',3,10,233400),(630,'蒙城 ','Mengcheng ',' ',3,10,233500),(631,'涡阳 ','Woyang ',' ',3,10,233600),(632,'固镇 ','Guzhen ',' ',3,10,233700),(633,'宿州 ','Suzhou ',' ',3,10,234000),(634,'灵壁 ','Lingbi ',' ',3,10,234200),(635,'泗县 ','Sixian ',' ',3,10,234300),(636,'淮北 ','Huaibei ',' ',3,10,235000),(637,'濉溪 ','Suixi ',' ',3,10,235100),(638,'萧县 ','Xiaoxian ',' ',3,10,235200),(639,'砀山 ','Dangshan ',' ',3,10,235300),(640,'阜阳 ','Fuyang ',' ',3,10,236000),(641,'颍上 ','Yingshang ',' ',3,10,236200),(642,'阜南 ','Funan ',' ',3,10,236300),(643,'临泉 ','Linquan ',' ',3,10,236400),(644,'界首 ','Jieshou ',' ',3,10,236500),(645,'太和 ','Taihe ',' ',3,10,236600),(646,'利辛 ','Lixin ',' ',3,10,236700),(647,'毫州 ','Haozhou ',' ',3,10,236800),(648,'六安 ','Liuan ',' ',3,10,237000),(649,'霍山 ','Huoshan ',' ',3,10,237200),(650,'金寨 ','Jinzhai ',' ',3,10,237300),(651,'霍邱 ','Huoqiu ',' ',3,10,237400),(652,'巢湖 ','Chaohu ',' ',3,10,238000),(653,'含山 ','Hanshan ',' ',3,10,238100),(654,'和县 ','Hexian ',' ',3,10,238200),(655,'无为 ','Wuwei ',' ',3,10,238300),(656,'滁州 ','Chuzhou ',' ',3,10,239000),(657,'来安 ','Laian ',' ',3,10,239200),(658,'天长 ','TianChang ',' ',3,10,239300),(659,'明光 ','Mingguang ',' ',3,10,239400),(660,'全椒 ','Quanjiao ',' ',3,10,239500),(661,'芜湖 ','Wuhu ',' ',3,10,241000),(662,'芜湖县 ','Wuhu ',' ',3,10,241100),(663,'繁昌 ','Fanchang ',' ',3,10,241200),(664,'宣州 ','Xuanzhou ',' ',3,10,242000),(665,'郎溪 ','Langxi ',' ',3,10,242100),(666,'广德 ','Guangde ',' ',3,10,242200),(667,'宁国 ','Ningguo ',' ',3,10,242300),(668,'南陵 ','Nanling ',' ',3,10,242400),(669,'泾县 ','Jingxian ',' ',3,10,242500),(670,'旌德 ','Jingde ',' ',3,10,242600),(671,'青阳 ','Qingyang ',' ',3,10,242800),(672,'马鞍山 ','Maanshan ',' ',3,10,243000),(673,'当涂 ','Dangtu ',' ',3,10,243100),(674,'成武 ','Chengwu ',' ',3,11,243600),(675,'铜陵 ','Tongling ',' ',3,10,244000),(676,'铜陵县 ','Tongling ',' ',3,10,244100),(677,'黄山 ','Huangshan ','TXN ',3,10,245000),(678,'石台 ','Shitai ',' ',3,10,245100),(679,'歙县 ','Shexian ',' ',3,10,245200),(680,'绩溪 ','Jixi ',' ',3,10,245300),(681,'休宁 ','Xiuning ',' ',3,10,245400),(682,'黟县 ','Yixian ',' ',3,10,245500),(683,'祁门 ','Qimen ',' ',3,10,245600),(684,'安庆 ','Anqing ','AQG ',3,10,246000),(685,'怀宁 ','Huaining ',' ',3,10,246100),(686,'望江 ','Wangjiang ',' ',3,10,246200),(687,'潜山 ','Qianshan ',' ',3,10,246300),(688,'太湖 ','Taihu ',' ',3,10,246400),(689,'宿松 ','Susong ',' ',3,10,246500),(690,'岳西 ','Yuexi ',' ',3,10,246600),(691,'枞阳 ','Zongyang ',' ',3,10,246700),(692,'贵池 ','Guichi ',' ',3,10,247100),(693,'东至 ','Dongzhi ',' ',3,10,247200),(694,'济南 ','Jinan ','TNA ',3,11,250000),(695,'章丘 ','Zhangqiu ',' ',3,11,250200),(696,'长清 ','Changqing ',' ',3,11,250300),(697,'平阴 ','Pingyin ',' ',3,11,250400),(698,'齐河 ','Qihe ',' ',3,11,251100),(699,'禹城 ','Yucheng ',' ',3,11,251200),(700,'高唐 ','Gaotang ',' ',3,11,251300),(701,'济阳 ','Jiyang ',' ',3,11,251400),(702,'临邑 ','Linyi  ',' ',3,11,251500),(703,'商河 ','Shanghe ',' ',3,11,251600),(704,'惠民 ','Huimin ',' ',3,11,251700),(705,'阳信 ','Yangxin ',' ',3,11,251800),(706,'无棣 ','Wudi ',' ',3,11,251900),(707,'聊城 ','Liaocheng ',' ',3,11,252000),(708,'茌平 ','Chiping ',' ',3,11,252100),(709,'东阿 ','Donga ',' ',3,11,252200),(710,'阳谷 ','Yanggu ',' ',3,11,252300),(711,'莘县 ','Shenxian ',' ',3,11,252400),(712,'冠县 ','Guanxian ',' ',3,11,252500),(713,'临清 ','Linqing ',' ',3,11,252600),(714,'德州 ','Dezhou ',' ',3,11,253000),(715,'平原 ','Pingyuan ',' ',3,11,253100),(716,'夏津 ','Xiajin ',' ',3,11,253200),(717,'武城 ','Wucheng ',' ',3,11,253300),(718,'宁津 ','Ningjin ',' ',3,11,253400),(719,'陵县 ','Lingxian ',' ',3,11,253500),(720,'乐陵 ','Leling ',' ',3,11,253600),(721,'庆云 ','Qingyun ',' ',3,11,253700),(722,'故城 ','Gucheng ',' ',1,3,253800),(723,'淄博 ','Zibo ',' ',3,11,255000),(724,'沂源 ','Yiyuan ',' ',3,11,256100),(725,'邹平 ','Zouping ',' ',3,11,256200),(726,'高青 ','Gaoqing ',' ',3,11,256300),(727,'桓台 ','Huantai ',' ',3,11,256400),(728,'博兴 ','Boxing ',' ',3,11,256500),(729,'滨州 ','Binzhou ',' ',3,11,256600),(730,'沾化 ','Zhanhua ',' ',3,11,256800),(731,'东营 ','Dongying ','DOY ',3,11,257000),(732,'河口 ','Hekou ',' ',3,11,257200),(733,'广饶 ','Guangrao ',' ',3,11,257300),(734,'利津 ','Lijin ',' ',3,11,257400),(735,'垦利 ','Kenli ',' ',3,11,257500),(736,'潍坊 ','Weifang ','WEF ',3,11,261000),(737,'昌邑 ','Changyi ',' ',3,11,261300),(738,'莱州 ','Laizhou ',' ',3,11,261400),(739,'高密 ','Gaomi ',' ',3,11,261500),(740,'安丘 ','Anqiu ',' ',3,11,262100),(741,'诸城 ','Zhucheng ',' ',3,11,262200),(742,'五莲 ','Wulian ',' ',3,11,262300),(743,'昌乐 ','Changle ',' ',3,11,262400),(744,'青州 ','Qingzhou ',' ',3,11,262500),(745,'临朐 ','Linqu ',' ',3,11,262600),(746,'寿光 ','Shouguang ',' ',3,11,262700),(747,'平度 ','Pingdu ',' ',3,11,262800),(748,'烟台 ','Yantai ','YNT ',3,11,264000),(749,'牟平 ','Muping ',' ',3,11,264100),(750,'威海 ','Weihai ',' ',3,11,264200),(751,'荣城 ','Rongcheng ',' ',3,11,264300),(752,'文登 ','Wendeng ',' ',3,11,264400),(753,'乳山 ','Rushan ',' ',3,11,264500),(754,'海阳 ','Haiyang ',' ',3,11,265100),(755,'莱阳 ','Laiyang ',' ',3,11,265200),(756,'栖霞 ','Qixia ',' ',3,11,265300),(757,'招远 ','Zhaoyuan ',' ',3,11,265400),(758,'蓬莱 ','Penglai ',' ',3,11,265600),(759,'龙口 ','Longkou ',' ',3,11,265700),(760,'长岛 ','Changdao ',' ',3,11,265800),(761,'青岛 ','Qingdao ','TAO ',3,11,266000),(762,'即墨 ','Jimo ',' ',3,11,266200),(763,'胶州 ','Jiaozhou ',' ',3,11,266300),(764,'胶南 ','Jiaonan ',' ',3,11,266400),(765,'莱西 ','Laixi ',' ',3,11,266600),(766,'泰安 ','Taian ',' ',3,11,271000),(767,'莱芜 ','Laiwu ',' ',3,11,271100),(768,'新泰 ','Xintai ',' ',3,11,271200),(769,'宁阳 ','Ningyang ',' ',3,11,271400),(770,'东平 ','Dongping ',' ',3,11,271500),(771,'肥城 ','Feicheng ',' ',3,11,271600),(772,'兖州 ','Yanzhou ',' ',3,11,272000),(773,'济宁 ','Jining ',' ',3,11,272100),(774,'金乡 ','Jinxiang ',' ',3,11,272200),(775,'鱼台 ','Yutai ',' ',3,11,272300),(776,'嘉祥 ','Jiaxiang ',' ',3,11,272400),(777,'汶上 ','Wenshang ',' ',3,11,272500),(778,'曲阜 ','Qufu ',' ',3,11,273100),(779,'泗水 ','Sishui ',' ',3,11,273200),(780,'平邑 ','Pingyi ',' ',3,11,273300),(781,'费县 ','Feixian ',' ',3,11,273400),(782,'邹城 ','Zoucheng ',' ',3,11,273500),(783,'单县 ','Shanxian ',' ',3,11,273700),(784,'荷泽 ','Heze ',' ',3,11,274000),(785,'定陶 ','Dingtao ',' ',3,11,274100),(786,'曹县 ','Caoxian ',' ',3,11,274400),(787,'东明 ','Dongming ',' ',3,11,274500),(788,'鄄城 ','Juancheng ',' ',3,11,274600),(789,'郓城 ','Yuncheng ',' ',3,11,274700),(790,'梁山 ','Liangshan ',' ',3,11,274800),(791,'巨野 ','Juye ',' ',3,11,274900),(792,'临沂 ','Linyi ','LYI ',3,11,276000),(793,'郯城 ','Tancheng ',' ',3,11,276100),(794,'蒙阴 ','Mengyin ',' ',3,11,276200),(795,'沂南 ','Yinan ',' ',3,11,276300),(796,'沂水 ','Yishui ',' ',3,11,276400),(797,'莒南 ','Junan ',' ',3,11,276600),(798,'临沭 ','Linshu ',' ',3,11,276700),(799,'日照 ','Rizhao ',' ',3,11,276800),(800,'枣庄 ','Zaozhuang ',' ',3,11,277100),(801,'滕州 ','Tengzhou ',' ',3,11,277500),(802,'微山 ','Weishan ',' ',3,11,277600),(803,'苍山 ','Cangshan ',' ',3,11,277700),(804,'12 ','Tianjin ','TSN ',1,12,300000),(805,'宁河 ','Ninghe ',' ',1,12,301500),(806,'静海 ','Jinghai ',' ',1,12,301600),(807,'武清 ','Wuqing ',' ',1,12,301700),(808,'宝坻 ','Baodi ',' ',1,12,301800),(809,'蓟县 ','Jixian ',' ',1,12,301900),(810,'香河 ','Xianghe ',' ',1,3,302550),(811,'永清 ','Yongqing ',' ',1,3,302650),(812,'文安 ','Wenan ',' ',1,3,302850),(813,'大城 ','Dacheng ',' ',1,3,302950),(814,'杭州 ','Hangzhou ','HGH ',3,13,310000),(815,'余杭 ','Yuhang ',' ',3,13,311100),(816,'萧山 ','Xiaoshan ',' ',3,13,311200),(817,'临安 ','Linan ',' ',3,13,311300),(818,'富阳 ','Fuyang ',' ',3,13,311400),(819,'桐庐 ','Tonglu ',' ',3,13,311500),(820,'建德 ','Jiande ',' ',3,13,311600),(821,'淳安 ','Chunan ',' ',3,13,311700),(822,'诸暨 ','Zhuji ',' ',3,13,311800),(823,'绍兴 ','Shaoxing ',' ',3,13,312000),(824,'绍兴县 ','Shaoxing ',' ',3,13,312300),(825,'上虞 ','Shangyu ',' ',3,13,312300),(826,'嵊县 ','Shengxian ',' ',3,13,312400),(827,'新昌 ','Xinchang ',' ',3,13,312500),(828,'湖州 ','Huzhou ',' ',3,13,313000),(829,'长兴 ','Changxing ',' ',3,13,313100),(830,'德清 ','Deqing ',' ',3,13,313200),(831,'安吉 ','Anji ',' ',3,13,313300),(832,'嘉兴 ','Jiaxing ',' ',3,13,314000),(833,'嘉善 ','Jiashan ',' ',3,13,314100),(834,'平湖 ','Pinghu ',' ',3,13,314200),(835,'海盐 ','Haiyan ',' ',3,13,314300),(836,'海宁 ','Haining ',' ',3,13,314400),(837,'桐乡 ','Tongxiang ',' ',3,13,314500),(838,'宁波 ','Ningbo ','NGB ',3,13,315000),(839,'鄞县 ','Yinxian ',' ',3,13,315100),(840,'镇海 ','Zhenhai ',' ',3,13,315200),(841,'慈溪 ','Cixi ',' ',3,13,315300),(842,'余姚 ','Yuyao ',' ',3,13,315400),(843,'奉化 ','Fenghua ',' ',3,13,315500),(844,'宁海 ','Ninghai ',' ',3,13,315600),(845,'象山 ','Xiangshan ',' ',3,13,315700),(846,'舟山 ','Zhoushan ','HSN ',3,13,316000),(847,'普陀 ','Putuo ',' ',3,13,316100),(848,'岱山 ','Daishan ',' ',3,13,316200),(849,'台州 ','Taizhou ',' ',3,13,317000),(850,'临海 ','Linhai ',' ',3,13,317000),(851,'三门 ','Sanmen ',' ',3,13,317100),(852,'天台 ','Tiantai ',' ',3,13,317200),(853,'仙居 ','Xianju ',' ',3,13,317300),(854,'黄岩 ','Huangyan ',' ',3,13,317400),(855,'温岭 ','Wenling ',' ',3,13,317500),(856,'玉环 ','Yuhuan ',' ',3,13,317600),(857,'椒江 ','Jiaojiang ',' ',3,13,317700),(858,'金华 ','Jinhua ',' ',3,13,321000),(859,'金华县 ','Jinhua ',' ',3,13,321000),(860,'兰溪 ','Lanxi ',' ',3,13,321100),(861,'武义 ','Wuyi ',' ',3,13,321200),(862,'永康 ','Yongkang ',' ',3,13,321300),(863,'缙云 ','Jinyun ',' ',3,13,321400),(864,'义乌 ','Yiwu ','YIW ',3,13,322000),(865,'东阳 ','Dongyang ',' ',3,13,322100),(866,'浦江 ','Pujiang ',' ',3,13,322200),(867,'磐安 ','Panan ',' ',3,13,322300),(868,'修水 ','Xiushui ',' ',3,14,322400),(869,'丽水 ','Lishui ',' ',3,13,323000),(870,'遂昌 ','Suichang ',' ',3,13,323300),(871,'松阳 ','Songyang ',' ',3,13,323400),(872,'景宁 ','Jingning ',' ',3,13,323500),(873,'云和 ','Yunhe ',' ',3,13,323600),(874,'龙泉 ','Longquan ',' ',3,13,323700),(875,'庆元 ','Qingyuan ',' ',3,13,323800),(876,'青田 ','Qingtian ',' ',3,13,323900),(877,'衢州 ','Quzhou ','JUZ ',3,13,324000),(878,'衢县 ','Quxian ',' ',3,13,324000),(879,'江山 ','Jiangshan ',' ',3,13,324100),(880,'常山 ','Changshan ',' ',3,13,324200),(881,'开化 ','Kaihua ',' ',3,13,324300),(882,'龙游 ','Longyou ',' ',3,13,324400),(883,'温州 ','Wenzhou ','WNZ ',3,13,325000),(884,'瓯海 ','Ouhai ',' ',3,13,325000),(885,'永嘉 ','Yongjia ',' ',3,13,325100),(886,'瑞安 ','Ruian ',' ',3,13,325200),(887,'文成 ','Wencheng ',' ',3,13,325300),(888,'平阳 ','Pingyang ',' ',3,13,325400),(889,'泰顺 ','Taishun ',' ',3,13,325500),(890,'乐清 ','Leqing ',' ',3,13,325600),(891,'洞头 ','Dongtou ',' ',3,13,325700),(892,'苍南 ','Cangnan ',' ',3,13,325800),(893,'南昌 ','Nanchang ','KHN ',3,14,330000),(894,'新建 ','Xinjian ',' ',3,14,330100),(895,'南昌县 ','Nanchang ',' ',3,14,330200),(896,'永修 ','Yongxiu ',' ',3,14,330300),(897,'德安 ','Dean ',' ',3,14,330400),(898,'安义 ','Anyi ',' ',3,14,330500),(899,'靖安 ','Jingan ',' ',3,14,330600),(900,'奉新 ','Fengxin ',' ',3,14,330700),(901,'高安 ','Gaoan ',' ',3,14,330800),(902,'丰城 ','Fengcheng ',' ',3,14,331100),(903,'樟树 ','Zhangshu ',' ',3,14,331200),(904,'新干 ','Xingan ',' ',3,14,331300),(905,'峡江 ','Xiajiang ',' ',3,14,331400),(906,'永丰 ','Yongfeng ',' ',3,14,331500),(907,'吉水 ','Jishui ',' ',3,14,331600),(908,'进贤 ','Jinxian ',' ',3,14,331700),(909,'东乡 ','Dongxiang ',' ',3,14,331800),(910,'九江 ','Jiujiang ','JIU ',3,14,332000),(911,'九江县 ','Jiujiang ',' ',3,14,332100),(912,'武宁 ','Wuning ',' ',3,14,332300),(913,'湖口 ','Hukou ',' ',3,14,332500),(914,'都昌 ','Duchang ',' ',3,14,332600),(915,'彭泽 ','Pengze ',' ',3,14,332700),(916,'星子 ','Xingzi ',' ',3,14,332800),(917,'庐山 ','Lushan ',' ',3,14,332900),(918,'景德镇 ','Jingdezhen ','JDZ ',3,14,333000),(919,'鄱阳 ','Poyang ',' ',3,14,333100),(920,'婺源 ','Wuyuan ',' ',3,14,333200),(921,'瑞昌 ','Ruichang ',' ',3,14,333200),(922,'乐平 ','Leping ',' ',3,14,333300),(923,'浮梁 ','Fuliang ',' ',3,14,333400),(924,'上饶 ','Shangrao ',' ',3,14,334000),(925,'上饶县 ','Shangrao ',' ',3,14,334100),(926,'德兴 ','Dexing ',' ',3,14,334200),(927,'横峰 ','Hengfeng ',' ',3,14,334300),(928,'弋阳 ','Yiyang ',' ',3,14,334400),(929,'铅山 ','Qianshan ',' ',3,14,334500),(930,'广丰 ','Guangfeng ',' ',3,14,334600),(931,'玉山 ','Yushan ',' ',3,14,334700),(932,'鹰潭 ','Yingtan ',' ',3,14,335000),(933,'余干 ','Yugan ',' ',3,14,335100),(934,'余江 ','Yujiang ',' ',3,14,335200),(935,'资溪 ','Zixi ',' ',3,14,335300),(936,'贵溪 ','Guixi ',' ',3,14,335400),(937,'万年 ','Wannian ',' ',3,14,335500),(938,'宜春 ','Yichun ',' ',3,14,336000),(939,'万载 ','Wanzai ',' ',3,14,336100),(940,'铜鼓 ','Tonggu ',' ',3,14,336200),(941,'宜丰 ','Yifeng ',' ',3,14,336300),(942,'上高 ','Shanggao ',' ',3,14,336400),(943,'新余 ','Xinyu ',' ',3,14,336500),(944,'分宜 ','Fenyi ',' ',3,14,336600),(945,'萍乡 ','Pingxiang ',' ',3,14,337000),(946,'莲花 ','Lianhua ',' ',3,14,337100),(947,'赣州 ','Ganzhou ','KOW ',3,14,341000),(948,'赣县 ','Ganxian ',' ',3,14,341100),(949,'上犹 ','Shangyou ',' ',3,14,341200),(950,'崇义 ','Chongyi ',' ',3,14,341300),(951,'南康 ','Nankang ',' ',3,14,341400),(952,'大余 ','Dayu ',' ',3,14,341500),(953,'信丰 ','Xinfeng ',' ',3,14,341600),(954,'龙南 ','Longnan ',' ',3,14,341700),(955,'全南 ','Quannan ',' ',3,14,341800),(956,'定南 ','Dingnan ',' ',3,14,341900),(957,'安远 ','Anyuan ',' ',3,14,342100),(958,'寻乌 ','Xunwu ',' ',3,14,342200),(959,'于都 ','Yudu ',' ',3,14,342300),(960,'兴国 ','Xingguo ',' ',3,14,342400),(961,'瑞金 ','Ruijin ',' ',3,14,342500),(962,'会昌 ','Huichang ',' ',3,14,342600),(963,'石城 ','Shicheng ',' ',3,14,342700),(964,'宁都 ','Ningdu ',' ',3,14,342800),(965,'吉安 ','Jian ','JGS ',3,14,343000),(966,'吉安县 ','Jian ',' ',3,14,343100),(967,'安福 ','Anfu ',' ',3,14,343200),(968,'永新 ','Yongxin ',' ',3,14,343400),(969,'宁冈 ','Ninggang ',' ',3,14,343500),(970,'井岗山 ','Jinggangshan ',' ',3,14,343600),(971,'泰和 ','Taihe ',' ',3,14,343700),(972,'万安 ','Wanan ',' ',3,14,343800),(973,'遂川 ','Suichuan ',' ',3,14,343900),(974,'抚州 ','Fuzhou ',' ',3,14,344000),(975,'临川 ','Linchuan ',' ',3,14,344100),(976,'崇仁 ','Chongren ',' ',3,14,344200),(977,'乐安 ','Lean ',' ',3,14,344300),(978,'宜黄 ','Yihuang ',' ',3,14,344400),(979,'南丰 ','Nanfeng ',' ',3,14,344500),(980,'黎川 ','Lichuan ',' ',3,14,344600),(981,'南城 ','Nancheng ',' ',3,14,344700),(982,'金溪 ','Jinxi ',' ',3,14,344800),(983,'广昌 ','Guangchang ',' ',3,14,344900),(984,'福州 ','Fuzhou ','FOC ',3,15,350000),(985,'闽候 ','Minhou ',' ',3,15,350100),(986,'长乐 ','Zhangle ',' ',3,15,350200),(987,'福清 ','Fuqing ',' ',3,15,350300),(988,'平潭 ','Pingtan ',' ',3,15,350400),(989,'连江 ','Lianjiang ',' ',3,15,350500),(990,'罗源 ','Luoyuan ',' ',3,15,350600),(991,'永泰 ','Yongtai ',' ',3,15,350700),(992,'闽清 ','Minqing ',' ',3,15,350800),(993,'莆田 ','Putian ',' ',3,15,351100),(994,'仙游 ','Xianyou ',' ',3,15,351200),(995,'宁德 ','Ningde ',' ',3,15,352100),(996,'古田 ','Gutian ',' ',3,15,352200),(997,'屏南 ','Pingnan ',' ',3,15,352300),(998,'南平 ','Nanping ',' ',3,15,353000),(999,'建瓯 ','Jianou ',' ',3,15,353100),(1000,'顺昌 ','Shunchang ',' ',3,15,353200),(1001,'将乐 ','Jiangle ',' ',3,15,353300),(1002,'浦城 ','Pucheng ',' ',3,15,353400),(1003,'松溪 ','Songxi ',' ',3,15,353500),(1004,'政和 ','Zhenghe ',' ',3,15,353600),(1005,'邵武 ','Shaowu ',' ',3,15,354000),(1006,'光泽 ','Guangze ',' ',3,15,354100),(1007,'建阳 ','Jianyang ',' ',3,15,354200),(1008,'武夷山 ','Wuyishan ',' ',3,15,354300),(1009,'泰宁 ','Taining ',' ',3,15,354400),(1010,'建宁 ','Jianning ',' ',3,15,354500),(1011,'福安 ','Fuan ',' ',3,15,355000),(1012,'霞浦 ','Xiapu ',' ',3,15,355100),(1013,'福鼎 ','Fuding ',' ',3,15,355200),(1014,'柘荣 ','Zherong ',' ',3,15,355300),(1015,'周宁 ','Zhouning ',' ',3,15,355400),(1016,'寿宁 ','Shouning ',' ',3,15,355500),(1017,'厦门 ','Xiamen  ','XMN ',3,15,361000),(1018,'同安 ','Tongan ',' ',3,15,361100),(1019,'泉州 ','Quanzhou ','JIN ',3,15,362000),(1020,'惠安 ','Huian ',' ',3,15,362100),(1021,'晋江 ','Jinjiang ',' ',3,15,362200),(1022,'南安 ','Nanan ',' ',3,15,362300),(1023,'安溪 ','Anxi ',' ',3,15,362400),(1024,'德化 ','Dehua ',' ',3,15,362500),(1025,'永春 ','Yongchun ',' ',3,15,362600),(1026,'石狮 ','Shishi ',' ',3,15,362700),(1027,'漳州 ','Zhangzhou ',' ',3,15,363000),(1028,'龙海 ','Longhai ',' ',3,15,363100),(1029,'漳浦 ','Zhangpu ',' ',3,15,363200),(1030,'云霄 ','Yunxiao ',' ',3,15,363300),(1031,'东山 ','Dongshan ',' ',3,15,363400),(1032,'诏安 ','Zhaoan ',' ',3,15,363500),(1033,'南靖 ','Nanjing ',' ',3,15,363600),(1034,'平和 ','Pinghe ',' ',3,15,363700),(1035,'华安 ','Huaan ',' ',3,15,363800),(1036,'长泰 ','Zhangtai ',' ',3,15,363900),(1037,'龙岩 ','Longyan ','LCX ',3,15,364000),(1038,'永定 ','Yongding ',' ',3,15,364100),(1039,'上杭 ','Shanghang ',' ',3,15,364200),(1040,'武平 ','Wuping ',' ',3,15,364300),(1041,'漳平 ','Zhangping ',' ',3,15,364400),(1042,'三明 ','Sanming ',' ',3,15,365000),(1043,'尤溪 ','Youxi ',' ',3,15,365100),(1044,'明溪 ','Mingxi ',' ',3,15,365200),(1045,'清流 ','Qingliu ',' ',3,15,365300),(1046,'宁化 ','Ninghua ',' ',3,15,365400),(1047,'沙县 ','Shaxian ',' ',3,15,365500),(1048,'永安 ','Yongan ',' ',3,15,366000),(1049,'大田 ','Datian ',' ',3,15,366100),(1050,'连城 ','Liancheng ',' ',3,15,366200),(1051,'长汀 ','Changting ',' ',3,15,366300),(1052,'16 ','Chongqing ','CKG ',7,16,400000),(1053,'北碚 ','Beibei ',' ',7,16,400700),(1054,'南桐 ','Nantong ',' ',7,16,400800),(1055,'双桥 ','Shuangqiao ',' ',7,16,400900),(1056,'江北 ','Jiangbei ',' ',7,16,401120),(1057,'长寿 ','Changshou ',' ',7,16,401220),(1058,'巴县 ','Baxian ',' ',7,16,401320),(1059,'綦江 ','Qijiang ',' ',7,16,401420),(1060,'合川 ','Hechuan ',' ',7,16,401520),(1061,'永川 ','Yongchuan ',' ',7,16,402000),(1062,'江津 ','Jiangjin ',' ',7,16,402260),(1063,'大足 ','Dazu ',' ',7,16,402360),(1064,'荣昌 ','Rongchang ',' ',7,16,402460),(1065,'铜梁 ','Tongliang ',' ',7,16,402560),(1066,'潼南 ','Tongnan ',' ',7,16,402660),(1067,'壁山 ','Bishan ',' ',7,16,402760),(1068,'万县 ','Wanxian ',' ',7,16,404000),(1069,'忠县 ','Zhongxian ',' ',7,16,404300),(1070,'云阳 ','Yunyang ',' ',7,16,404500),(1071,'奉节 ','Fengjie ',' ',7,16,404600),(1072,'巫山 ','Wushan ',' ',7,16,404700),(1073,'梁平 ','Liangping ',' ',7,16,405200),(1074,'开县 ','Kaixian ',' ',7,16,405400),(1075,'巫溪 ','Wuxi ',' ',7,16,405800),(1076,'城口 ','Chengkou ',' ',7,16,405900),(1077,'涪陵 ','Fuling ',' ',7,16,408000),(1078,'丰都 ','Fengdu ',' ',7,16,408200),(1079,'垫江 ','Dianjiang ',' ',7,16,408300),(1080,'南川 ','Nanchuan ',' ',7,16,408400),(1081,'武隆 ','Wulong ',' ',7,16,408500),(1082,'石柱 ','Shizhu ',' ',7,16,409100),(1083,'黔江 ','Qianjiang ',' ',7,16,409700),(1084,'长沙 ','Changsha ','CSX ',2,17,410000),(1085,'长沙县 ','Changsha ',' ',2,17,410100),(1086,'望城 ','Wangcheng ',' ',2,17,410200),(1087,'浏阳 ','Liuyang ',' ',2,17,410300),(1088,'平江 ','Pingjiang ',' ',2,17,410400),(1089,'湘阴 ','Xiangyin ',' ',2,17,410500),(1090,'宁乡 ','Ningxiang ',' ',2,17,410600),(1091,'湘潭 ','Xiangtan ',' ',2,17,411100),(1092,'湘潭县 ','Xiangtan ',' ',2,17,411200),(1093,'韶山 ','Shaoshan ',' ',2,17,411300),(1094,'湘乡 ','Xiangxiang ',' ',2,17,411400),(1095,'双峰 ','Shuangfeng ',' ',2,17,411500),(1096,'株洲 ','Zhuzhou ',' ',2,17,412000),(1097,'株洲县 ','Zhuzhou ',' ',2,17,412100),(1098,'醴陵 ','Liling ',' ',2,17,412200),(1099,'攸县 ','Youxian ',' ',2,17,412300),(1100,'茶陵 ','Chaling ',' ',2,17,412400),(1101,'炎陵 ','Yanling ',' ',2,17,412500),(1102,'益阳 ','Yiyang ',' ',2,17,413000),(1103,'沅江 ','Yuanjiang ',' ',2,17,413100),(1104,'南县 ','Nanxian ',' ',2,17,413200),(1105,'桃江 ','Taojiang ',' ',2,17,413400),(1106,'安化 ','Anhua ',' ',2,17,413500),(1107,'岳阳 ','Yueyang ',' ',2,17,414000),(1108,'岳阳县 ','Yueyang ',' ',2,17,414100),(1109,'华容 ','Huarong ',' ',2,17,414200),(1110,'临湘 ','Linxiang ',' ',2,17,414300),(1111,'汨罗 ','Miluo ',' ',2,17,414400),(1112,'常德 ','Changde ',' ',2,17,415100),(1113,'临澧 ','Linli ',' ',2,17,415200),(1114,'石门 ','Shimen ',' ',2,17,415300),(1115,'津市 ','Jinshi ',' ',2,17,415400),(1116,'安乡 ','Anxiang ',' ',2,17,415600),(1117,'慈利 ','Cili ',' ',2,17,415800),(1118,'汉寿 ','Hanshou ',' ',2,17,415900),(1119,'吉首 ','Jishou ',' ',2,17,416000),(1120,'泸溪 ','Luxi ',' ',2,17,416100),(1121,'凤凰 ','Fenghuang ',' ',2,17,416200),(1122,'古丈 ','Guzhang ',' ',2,17,416300),(1123,'花垣 ','Huayuan ',' ',2,17,416400),(1124,'保靖 ','Baojing ',' ',2,17,416500),(1125,'张家界 ','Zhangjiajie ',' ',2,17,416600),(1126,'永顺 ','Yongshun ',' ',2,17,416700),(1127,'龙山 ','Longshan ',' ',2,17,416800),(1128,'桑植 ','Sangzhi ',' ',2,17,416900),(1129,'娄底 ','Loudi ',' ',2,17,417000),(1130,'涟源 ','Lianyuan ',' ',2,17,417100),(1131,'冷水江 ','Lengshuijiang ',' ',2,17,417500),(1132,'新化 ','Xinhua ',' ',2,17,417600),(1133,'怀化 ','Huaihua ','HJJ ',2,17,418000),(1134,'黔阳 ','Qianyang ',' ',2,17,418100),(1135,'洪江 ','Hongjiang ',' ',2,17,418200),(1136,'会同 ','Huitong ',' ',2,17,418300),(1137,'靖州 ','Jingzhou ',' ',2,17,418400),(1138,'通道 ','Tongdao ',' ',2,17,418500),(1139,'芷江 ','Zhijiang ',' ',2,17,419100),(1140,'新晃 ','Xinhuang ',' ',2,17,419200),(1141,'溆浦 ','Xupu ',' ',2,17,419300),(1142,'麻阳 ','Mayang ',' ',2,17,419400),(1143,'辰溪 ','Chenxi ',' ',2,17,419500),(1144,'沅陵 ','Yuanling ',' ',2,17,419600),(1145,'衡阳 ','Hengyang ',' ',2,17,421000),(1146,'衡南 ','Hengnan ',' ',2,17,421100),(1147,'衡阳县 ','Hengyang ',' ',2,17,421200),(1148,'衡山 ','Hengshan ',' ',2,17,421300),(1149,'衡东 ','Hengdong ',' ',2,17,421400),(1150,'常宁 ','Changning ',' ',2,17,421500),(1151,'祁东 ','Qidong ',' ',2,17,421600),(1152,'祁阳 ','Qiyang ',' ',2,17,421700),(1153,'耒阳 ','Leiyang ',' ',2,17,421800),(1154,'邵阳 ','Shaoyang ',' ',2,17,422000),(1155,'邵阳县 ','Shaoyang ',' ',2,17,422100),(1156,'隆回 ','Longhui ',' ',2,17,422200),(1157,'洞口 ','Dongkou ',' ',2,17,422300),(1158,'武岗 ','Wugang ',' ',2,17,422400),(1159,'城步 ','Chengbu ',' ',2,17,422500),(1160,'绥宁 ','Suining ',' ',2,17,422600),(1161,'新宁 ','Xinning ',' ',2,17,422700),(1162,'邵东 ','Shaodong ',' ',2,17,422800),(1163,'新邵 ','Xinshao ',' ',2,17,422900),(1164,'郴州 ','Chenzhou ',' ',2,17,423000),(1165,'永兴 ','Yongxing ',' ',2,17,423300),(1166,'资兴 ','Zixing ',' ',2,17,423400),(1167,'桂东 ','Guidong ',' ',2,17,423500),(1168,'安仁 ','Anren ',' ',2,17,423600),(1169,'汝城 ','Rucheng ',' ',2,17,424100),(1170,'宜章 ','Yizhang ',' ',2,17,424200),(1171,'临武 ','Linwu ',' ',2,17,424300),(1172,'桂阳 ','Guiyang ',' ',2,17,424400),(1173,'嘉禾 ','Jiahe ',' ',2,17,424500),(1174,'永州 ','Yongzhou ','LLF ',2,17,425000),(1175,'双牌 ','Shuangpai ',' ',2,17,425200),(1176,'道县 ','Daoxian ',' ',2,17,425300),(1177,'江永 ','Jiangyong ',' ',2,17,425400),(1178,'澧县 ','Lixian ',' ',2,17,425500),(1179,'江华 ','Jianghua ',' ',2,17,425500),(1180,'宁远 ','Ningyuan ',' ',2,17,425600),(1181,'新田 ','Xintian ',' ',2,17,425700),(1182,'桃源 ','Taoyuan ',' ',2,17,425700),(1183,'蓝山 ','Lanshan ',' ',2,17,425800),(1184,'东安 ','Dongan ',' ',2,17,425900),(1185,'武汉 ','Wuhan ','WUH ',2,18,430000),(1186,'蔡甸 ','Caidian ',' ',2,18,430100),(1187,'武昌 ','Wuchang ',' ',2,18,430200),(1188,'武昌县 ','Wuchang ',' ',2,18,430200),(1189,'新洲 ','Xinzhou ',' ',2,18,431400),(1190,'红安 ','Hongan ',' ',2,18,431500),(1191,'麻城 ','Macheng ',' ',2,18,431600),(1192,'天门 ','Tianmen ',' ',2,18,431700),(1193,'京山 ','Jingshan ',' ',2,18,431800),(1194,'钟祥 ','Zhongxiang ',' ',2,18,431900),(1195,'孝感 ','Xiaogan ',' ',2,18,432100),(1196,'黄陂 ','Huangpi ',' ',2,18,432200),(1197,'汉川 ','Hanchuan ',' ',2,18,432300),(1198,'应城 ','Yingcheng ',' ',2,18,432400),(1199,'云梦 ','Yunmeng ',' ',2,18,432500),(1200,'安陆 ','Anlu ',' ',2,18,432600),(1201,'广水 ','Guangshui ',' ',2,18,432700),(1202,'大悟 ','Dawu ',' ',2,18,432800),(1203,'江汉 ','Jianghan ',' ',2,18,433000),(1204,'潜江 ','Qianjiang ',' ',2,18,433100),(1205,'洪湖 ','Honghu ',' ',2,18,433200),(1206,'监利 ','Jianli ',' ',2,18,433300),(1207,'沙市 ','Shashi ',' ',2,18,434000),(1208,'荆沙 ','Jingsha ',' ',2,18,434100),(1209,'松滋 ','Songzi ',' ',2,18,434200),(1210,'公安 ','Gongan ',' ',2,18,434300),(1211,'石首 ','Shishou ',' ',2,18,434400),(1212,'荆门 ','Jingmen ',' ',2,18,434500),(1213,'黄石 ','Huangshi ',' ',2,18,435000),(1214,'大冶 ','Daye ',' ',2,18,435100),(1215,'阳新 ','Yangxin ',' ',2,18,435200),(1216,'鄂州 ','Ezhou ',' ',2,18,436000),(1217,'黄州 ','Huangzhou ',' ',2,18,436100),(1218,'黄冈 ','Huanggang ',' ',2,18,436100),(1219,'浠水 ','Xishui ',' ',2,18,436200),(1220,'蕲春 ','Qichun ',' ',2,18,436300),(1221,'武穴 ','Wuxue ',' ',2,18,436400),(1222,'黄梅 ','Huangmei ',' ',2,18,436500),(1223,'罗田 ','Luotian ',' ',2,18,436600),(1224,'英山 ','Yingshan ',' ',2,18,436700),(1225,'咸宁 ','Xianning ',' ',2,18,437000),(1226,'嘉鱼 ','Jiayu ',' ',2,18,437200),(1227,'蒲圻 ','Puqi ',' ',2,18,437300),(1228,'通城 ','Tongcheng ',' ',2,18,437400),(1229,'崇阳 ','Chongyang ',' ',2,18,437500),(1230,'通山 ','Tongshan ',' ',2,18,437600),(1231,'襄樊 ','Xiangfan ','XFN ',2,18,441000),(1232,'襄阳 ','Xiangyang ',' ',2,18,441100),(1233,'枣阳 ','Zaoyang ',' ',2,18,441200),(1234,'随枣 ','Suizao ',' ',2,18,441200),(1235,'随州 ','Suizhou ',' ',2,18,441300),(1236,'宜城 ','Yicheng ',' ',2,18,441400),(1237,'南漳 ','Nanzhang ',' ',2,18,441500),(1238,'保康 ','Baokang ',' ',2,18,441600),(1239,'谷城 ','Gucheng ',' ',2,18,441700),(1240,'老河口 ','Laohekou ',' ',2,18,441800),(1241,'丹江口 ','Danjiangkou ',' ',2,18,441900),(1242,'十堰 ','Shiyan ',' ',2,18,442000),(1243,'房县 ','Fangxian ',' ',2,18,442100),(1244,'竹山 ','Zhushan ',' ',2,18,442200),(1245,'竹溪 ','Zhuxi ',' ',2,18,442300),(1246,'神农架 ','Shennongjia ',' ',2,18,442400),(1247,'郧县 ','Yunxian ',' ',2,18,442500),(1248,'郧西 ','Yunxi ',' ',2,18,442600),(1249,'宜昌 ','Yichang ','YIH ',2,18,443000),(1250,'宜昌县 ','Yichang ',' ',2,18,443100),(1251,'枝江 ','Zhijiang ',' ',2,18,443200),(1252,'枝城 ','Zhicheng ',' ',2,18,443300),(1253,'五峰 ','Wufeng ',' ',2,18,443400),(1254,'长阳 ','Changyang ',' ',2,18,443500),(1255,'秭归 ','Zigui ',' ',2,18,443600),(1256,'兴山 ','Xingshan ',' ',2,18,443700),(1257,'当阳 ','Dangyang ',' ',2,18,444100),(1258,'远发 ','Yuanfa ',' ',2,18,444200),(1259,'巴东 ','Badong ',' ',2,18,444300),(1260,'恩施 ','Enshi ',' ',2,18,445000),(1261,'建始 ','Jianshi ',' ',2,18,445300),(1262,'利川 ','Lichuan ',' ',2,18,445400),(1263,'宣恩 ','Xuanen ',' ',2,18,445500),(1264,'咸丰 ','Xianfeng ',' ',2,18,445600),(1265,'来凤 ','Laifeng ',' ',2,18,445700),(1266,'鹤峰 ','Hefeng ',' ',2,18,445800),(1267,'郑州 ','Zhengzhou ','CGO ',2,19,450000),(1268,'荥阳 ','Xingyang ',' ',2,19,450100),(1269,'上街 ','Shangjie ',' ',2,19,451000),(1270,'新郑 ','Xinzheng ',' ',2,19,451100),(1271,'巩县 ','Gongxian ',' ',2,19,451200),(1272,'中牟 ','Zhongmou ',' ',2,19,451400),(1273,'尉氏 ','Weishi ',' ',2,19,452100),(1274,'通许 ','Tongxu ',' ',2,19,452200),(1275,'新密 ','Xinmi ',' ',2,19,452300),(1276,'登封 ','Dengfeng ',' ',2,19,452400),(1277,'禹州 ','Yuzhou ',' ',2,19,452500),(1278,'襄城 ','Xiangcheng ',' ',2,19,452600),(1279,'卫辉 ','Weihui ',' ',2,19,453100),(1280,'延津 ','Yanjin ',' ',2,19,453200),(1281,'封丘 ','Fengqiu ',' ',2,19,453300),(1282,'长垣 ','Zhangyuan ',' ',2,19,453400),(1283,'原阳 ','Yuanyang ',' ',2,19,453500),(1284,'辉县 ','Huixian ',' ',2,19,453600),(1285,'新乡 ','Xinxiang ',' ',2,19,453700),(1286,'获嘉 ','Huojia ',' ',2,19,453800),(1287,'焦作 ','Jiaozuo ',' ',2,19,454100),(1288,'修武 ','Xiuwu ',' ',2,19,454300),(1289,'博爱 ','Boai ',' ',2,19,454400),(1290,'沁阳 ','Qinyang ',' ',2,19,454500),(1291,'济源 ','Jiyuan ',' ',2,19,454600),(1292,'孟县 ','Mengxian ',' ',2,19,454700),(1293,'温县 ','Wenxian ',' ',2,19,454800),(1294,'武陟 ','Wuzhi ',' ',2,19,454900),(1295,'安阳 ','Anyang ',' ',2,19,455000),(1296,'安阳县 ','Anyang ',' ',2,19,455100),(1297,'汤阴 ','Tangyin ',' ',2,19,456100),(1298,'浚县 ','Xunxian ',' ',2,19,456200),(1299,'内黄 ','Neihuang ',' ',2,19,456300),(1300,'滑县 ','Huaxian ',' ',2,19,456400),(1301,'林县 ','Linxian ',' ',2,19,456500),(1302,'鹤壁 ','Hebi ',' ',2,19,456600),(1303,'淇县 ','Qixian ',' ',2,19,456700),(1304,'濮阳 ','Puyang ',' ',2,19,457000),(1305,'濮阳县 ','Puyang ',' ',2,19,457002),(1306,'清丰 ','Qingfeng ',' ',2,19,457300),(1307,'南乐 ','Nanle ',' ',2,19,457400),(1308,'范县 ','Fanxian ',' ',2,19,457500),(1309,'台前 ','Taiqian ',' ',2,19,457600),(1310,'许昌 ','Xuchang ',' ',2,19,461000),(1311,'鄢陵 ','Yanling ',' ',2,19,461200),(1312,'扶沟 ','Fugou ',' ',2,19,461300),(1313,'长葛 ','Changge ',' ',2,19,461500),(1314,'漯河 ','Luohe ',' ',2,19,462000),(1315,'西平 ','Xiping ',' ',2,19,462100),(1316,'郾城 ','Yancheng ',' ',2,19,462300),(1317,'舞阳 ','Wuyang ',' ',2,19,462400),(1318,'舞钢 ','Wugang ',' ',2,19,462500),(1319,'临颖 ','Linying ',' ',2,19,462600),(1320,'驻马店 ','Zhumadian ',' ',2,19,463000),(1321,'遂平 ','Suiping ',' ',2,19,463100),(1322,'确山 ','Queshan ',' ',2,19,463200),(1323,'汝南 ','Runan ',' ',2,19,463300),(1324,'平舆 ','Pingyu ',' ',2,19,463400),(1325,'新蔡 ','Xincai ',' ',2,19,463500),(1326,'正阳 ','Zhengyang ',' ',2,19,463600),(1327,'泌阳 ','Miyang ',' ',2,19,463700),(1328,'上蔡 ','Shangcai ',' ',2,19,463800),(1329,'信阳 ','Xinyang ',' ',2,19,464000),(1330,'信阳县 ','Xinyang ',' ',2,19,464100),(1331,'罗山 ','Luoshan ',' ',2,19,464200),(1332,'息县 ','Xixian ',' ',2,19,464300),(1333,'淮滨 ','Huaibin ',' ',2,19,464400),(1334,'潢川 ','Huangchuan ',' ',2,19,465100),(1335,'固始 ','Gushi ',' ',2,19,465200),(1336,'商城 ','Shangcheng ',' ',2,19,465300),(1337,'光山 ','Guangshan ',' ',2,19,465400),(1338,'新县 ','Xinxian ',' ',2,19,465500),(1339,'周口 ','Zhoukou ',' ',2,19,466000),(1340,'商水 ','Shangshui ',' ',2,19,466100),(1341,'项城 ','Xiangcheng ',' ',2,19,466200),(1342,'沈丘 ','Shenqiu ',' ',2,19,466300),(1343,'西华 ','Xihua ',' ',2,19,466600),(1344,'淮阳 ','Huaiyang ',' ',2,19,466700),(1345,'平顶山 ','Pingdingshan ',' ',2,19,467000),(1346,'郏县 ','Jiaxian ',' ',2,19,467100),(1347,'叶县 ','Yexian ',' ',2,19,467200),(1348,'鲁山 ','Lushan ',' ',2,19,467300),(1349,'宝丰 ','Baofeng ',' ',2,19,467400),(1350,'汝州 ','Ruzhou ',' ',2,19,467500),(1351,'洛阳 ','Luoyang ','LYA ',2,19,471000),(1352,'孟津 ','Mengjin ',' ',2,19,471100),(1353,'汝阳 ','Ruyang ',' ',2,19,471200),(1354,'伊川 ','Yichuan ',' ',2,19,471300),(1355,'嵩县 ','Songxian ',' ',2,19,471400),(1356,'栾川 ','Luanchuan ',' ',2,19,471500),(1357,'宜阳 ','Yiyang ',' ',2,19,471600),(1358,'洛宁 ','Luoning ',' ',2,19,471700),(1359,'新安 ','Xinan ',' ',2,19,471800),(1360,'偃师 ','Yanshi ',' ',2,19,471900),(1361,'三门峡 ','Sanmenxia ',' ',2,19,472000),(1362,'陕县 ','Shanxian ',' ',2,19,472100),(1363,'卢氏 ','Lushi ',' ',2,19,472200),(1364,'义马 ','Yima ',' ',2,19,472300),(1365,'渑池 ','Mianchi ',' ',2,19,472400),(1366,'灵宝 ','Lingbao ',' ',2,19,472500),(1367,'卧龙 ','Wolong ',' ',2,19,473000),(1368,'宛城 ','Wancheng ',' ',2,19,473100),(1369,'方城 ','Fangcheng ',' ',2,19,473200),(1370,'社旗 ','Sheqi ',' ',2,19,473300),(1371,'唐河 ','Tanghe ',' ',2,19,473400),(1372,'新野 ','Xinye ',' ',2,19,473500),(1373,'邓州 ','Dengzhou ',' ',2,19,474100),(1374,'镇平 ','Zhenping ',' ',2,19,474200),(1375,'内乡 ','Neixiang ',' ',2,19,474300),(1376,'浙川 ','Zhechuan ',' ',2,19,474400),(1377,'西峡 ','Xixia ',' ',2,19,474500),(1378,'南召 ','Nanzhao ',' ',2,19,474600),(1379,'桐柏 ','Tongbai ',' ',2,19,474700),(1380,'开封 ','Kaifeng ',' ',2,19,475000),(1381,'开封县 ','Kaifeng ',' ',2,19,475100),(1382,'杞县 ','Qixian ',' ',2,19,475200),(1383,'兰考 ','Lankao ',' ',2,19,475300),(1384,'太康 ','Taikang ',' ',2,19,475400),(1385,'商丘 ','Shangqiu ',' ',2,19,476000),(1386,'商丘县 ','Shangqiu ',' ',2,19,476100),(1387,'柘城 ','Zhecheng ',' ',2,19,476200),(1388,'虞城 ','Yucheng ',' ',2,19,476300),(1389,'夏邑 ','Xiayi ',' ',2,19,476400),(1390,'永城 ','Yongcheng ',' ',2,19,476600),(1391,'宁陵 ','Ningling ',' ',2,19,476700),(1392,'民权 ','Minquan ',' ',2,19,476800),(1393,'睢县 ','Suixian ',' ',2,19,476900),(1394,'郸城 ','Dancheng ',' ',2,19,477100),(1395,'鹿邑 ','Luyi ',' ',2,19,477200),(1396,'广州 ','Guangzhou ','CAN ',4,20,510000),(1397,'花县 ','Huaxian ',' ',4,20,510800),(1398,'从化 ','Conghua ',' ',4,20,510900),(1399,'新丰 ','Xinfeng ',' ',4,20,511100),(1400,'龙门 ','Longmen ',' ',4,20,511200),(1401,'增城 ','Zengcheng ',' ',4,20,511300),(1402,'番禺 ','Fanyu ',' ',4,20,511400),(1403,'清远 ','Qingyuan ',' ',4,20,511500),(1404,'佛冈 ','Fogang ',' ',4,20,511600),(1405,'东莞 ','Dongwan ',' ',4,20,511700),(1406,'韶关 ','Shaoguan ',' ',4,20,512000),(1407,'曲江 ','Qujiang ',' ',4,20,512100),(1408,'乐昌 ','Lechang ',' ',4,20,512200),(1409,'仁化 ','Renhua ',' ',4,20,512300),(1410,'南雄 ','Nanxiong ',' ',4,20,512400),(1411,'始兴 ','Shixing ',' ',4,20,512500),(1412,'翁源 ','Wengyuan ',' ',4,20,512600),(1413,'乳源 ','Ruyuan ',' ',4,20,512700),(1414,'英德 ','Yingde ',' ',4,20,513000),(1415,'阳山 ','Yangshan ',' ',4,20,513100),(1416,'连山 ','Lianshan ',' ',4,20,513200),(1417,'连南 ','Liannan ',' ',4,20,513300),(1418,'连州 ','Lianzhou ',' ',4,20,513400),(1419,'梅州 ','Meizhou ',' ',4,20,514000),(1420,'梅县 ','Meixian ','MXZ ',4,20,514000),(1421,'蕉岭 ','Jiaoling ',' ',4,20,514100),(1422,'大埔 ','Dapu ',' ',4,20,514200),(1423,'丰顺 ','Fengshun ',' ',4,20,514300),(1424,'五华 ','Wuhua ',' ',4,20,514400),(1425,'兴宁 ','Xingning ',' ',4,20,514500),(1426,'平远 ','Pingyuan ',' ',4,20,514600),(1427,'汕头 ','Shantou ','SWA ',4,20,515000),(1428,'潮阳 ','Chaoyang ',' ',4,20,515100),(1429,'惠来 ','Huilai ',' ',4,20,515200),(1430,'普宁 ','Puning ',' ',4,20,515300),(1431,'揭西 ','Jiexi ',' ',4,20,515400),(1432,'揭阳 ','Jieyang ',' ',4,20,515500),(1433,'揭东 ','Jiedong ',' ',4,20,515500),(1434,'潮州 ','Chaozhou ',' ',4,20,515600),(1435,'潮安 ','Chaoan ',' ',4,20,515600),(1436,'饶平 ','Raoping ',' ',4,20,515700),(1437,'澄海 ','Chenghai ',' ',4,20,515800),(1438,'南澳 ','Nanao ',' ',4,20,515900),(1439,'惠州 ','Huizhou ',' ',4,20,516000),(1440,'博罗 ','Boluo ',' ',4,20,516100),(1441,'惠阳 ','Huiyang ',' ',4,20,516200),(1442,'海丰 ','Haifeng ',' ',4,20,516400),(1443,'陆丰 ','Lufeng ',' ',4,20,516500),(1444,'汕尾 ','Shanwei ',' ',4,20,516600),(1445,'陆河 ','Luhe ',' ',4,20,516700),(1446,'河源 ','Heyuan ',' ',4,20,517000),(1447,'连平 ','Lianping ',' ',4,20,517100),(1448,'和平 ','Heping ',' ',4,20,517200),(1449,'龙川 ','Longchuan ',' ',4,20,517300),(1450,'紫金 ','Zijin ',' ',4,20,517400),(1451,'深圳 ','Shenzhen ','SZX ',4,20,518000),(1452,'宝安 ','Baoan ',' ',4,20,518100),(1453,'珠海 ','Zhuhai ','ZUH ',4,20,519000),(1454,'斗门 ','Doumen ',' ',4,20,519100),(1455,'湛江 ','Zhanjiang ','ZHA ',4,20,524000),(1456,'徐闻 ','Xuwen ',' ',4,20,524100),(1457,'雷州 ','Leizhou ',' ',4,20,524200),(1458,'遂溪 ','Suixi ',' ',4,20,524300),(1459,'廉江 ','Lianjiang ',' ',4,20,524400),(1460,'吴川 ','Wuchuan ',' ',4,20,524500),(1461,'茂名 ','Maoming ',' ',4,20,525000),(1462,'化州 ','Huazhou ',' ',4,20,525100),(1463,'高州 ','Gaozhou ',' ',4,20,525200),(1464,'信宜 ','Xinyi ',' ',4,20,525300),(1465,'电白 ','Dianbai ',' ',4,20,525400),(1466,'肇庆 ','Zhaoqing ',' ',4,20,526000),(1467,'高要 ','Gaoyao ',' ',4,20,526100),(1468,'四会 ','Sihui ',' ',4,20,526200),(1469,'惠东 ','Huidong ',' ',4,20,526300),(1470,'广宁 ','Guangning ',' ',4,20,526300),(1471,'怀集 ','Huaiji ',' ',4,20,526400),(1472,'封开 ','Fengkai ',' ',4,20,526500),(1473,'德庆 ','Deqing ',' ',4,20,526600),(1474,'郁南 ','Yunan ',' ',4,20,527100),(1475,'罗定 ','Luoding ',' ',4,20,527200),(1476,'云浮 ','Yunfu ',' ',4,20,527300),(1477,'新兴 ','Xinxing ',' ',4,20,527400),(1478,'佛山 ','Foshan ',' ',4,20,528000),(1479,'三水 ','Sanshui ',' ',4,20,528100),(1480,'南海 ','Nanhai ',' ',4,20,528200),(1481,'顺德 ','Shunde ',' ',4,20,528300),(1482,'中山 ','Zhongshan ',' ',4,20,528400),(1483,'高明 ','Gaoming ',' ',4,20,528500),(1484,'江门 ','Jiangmen ',' ',4,20,529000),(1485,'新会 ','Xinhui ',' ',4,20,529100),(1486,'台山 ','Taishan ',' ',4,20,529200),(1487,'开平 ','Kaiping ',' ',4,20,529300),(1488,'恩平 ','Enping ',' ',4,20,529400),(1489,'阳江 ','Yangjiang ',' ',4,20,529500),(1490,'阳东 ','Yangdong ',' ',4,20,529500),(1491,'阳春 ','Yangchun ',' ',4,20,529600),(1492,'鹤山 ','Heshan ',' ',4,20,529700),(1493,'阳西 ','Yangxi ',' ',4,20,529800),(1494,'南宁 ','Nanning ','NNG ',4,21,530000),(1495,'武鸣 ','Wuming ',' ',4,21,530100),(1496,'邕宁 ','Yongning ',' ',4,21,530200),(1497,'横县 ','Hengxian ',' ',4,21,530300),(1498,'宾阳 ','Binyang ',' ',4,21,530400),(1499,'上林 ','Shanglin ',' ',4,21,530500),(1500,'马山 ','Mashan ',' ',4,21,530600),(1501,'都安 ','Duan ',' ',4,21,530700),(1502,'大化 ','Dahua ',' ',4,21,530800),(1503,'平果 ','Pingguo ',' ',4,21,531400),(1504,'田东 ','Tiandong ',' ',4,21,531500),(1505,'扶绥 ','Fusui ',' ',4,21,532100),(1506,'崇左 ','Chongzuo ',' ',4,21,532200),(1507,'大新 ','Daxin ',' ',4,21,532300),(1508,'龙州 ','Longzhou ',' ',4,21,532400),(1509,'宁明 ','Ningming ',' ',4,21,532500),(1510,'凭祥 ','Pingxiang ',' ',4,21,532600),(1511,'隆安 ','Longan ',' ',4,21,532700),(1512,'天等 ','Tiandeng ',' ',4,21,532800),(1513,'百色 ','Baise ','AEB ',4,21,533000),(1514,'凌云 ','Lingyun ',' ',4,21,533100),(1515,'乐业 ','Leye ',' ',4,21,533200),(1516,'田林 ','Tianlin ',' ',4,21,533300),(1517,'绥阳 ','Suiyang ',' ',7,22,533300),(1518,'隆林 ','Longlin ',' ',4,21,533400),(1519,'西林 ','Xilin ',' ',4,21,533500),(1520,'田阳 ','Tianyang ',' ',4,21,533600),(1521,'德保 ','Debao ',' ',4,21,533700),(1522,'靖西 ','Jingxi ',' ',4,21,533800),(1523,'那坡 ','Napo ',' ',4,21,533900),(1524,'钦州 ','Qinzhou ',' ',4,21,535000),(1525,'浦北 ','Pubei ',' ',4,21,535300),(1526,'灵山 ','Lingshan ',' ',4,21,535400),(1527,'上思 ','Shangsi ',' ',4,21,535500),(1528,'防城港 ','Fangchenggang ',' ',4,21,535700),(1529,'北海 ','Beihai ','BHY ',4,21,536000),(1530,'合浦 ','Hepu ',' ',4,21,536100),(1531,'玉林 ','Yulin ',' ',4,21,537000),(1532,'贵港 ','Guigang ',' ',4,21,537100),(1533,'桂平 ','Guiping ',' ',4,21,537200),(1534,'平南 ','Pingnan ',' ',4,21,537300),(1535,'北流 ','Beiliu ',' ',4,21,537400),(1536,'容县 ','Rongxian ',' ',4,21,537500),(1537,'博白 ','Bobai ',' ',4,21,537600),(1538,'陆川 ','Luchuan ',' ',4,21,537700),(1539,'桂林 ','Guilin ','KWL ',4,21,541000),(1540,'临桂 ','Lingui ',' ',4,21,541100),(1541,'灵川 ','Lingchuan ',' ',4,21,541200),(1542,'兴安 ','Xingan ',' ',4,21,541300),(1543,'资源 ','Ziyuan ',' ',4,21,541400),(1544,'全州 ','Quanzhou ',' ',4,21,541500),(1545,'灌阳 ','Guanyang ',' ',4,21,541600),(1546,'龙胜 ','Longsheng ',' ',4,21,541700),(1547,'永福 ','Yongfu ',' ',4,21,541800),(1548,'阳朔 ','Yangshuo ',' ',4,21,541900),(1549,'平乐 ','Pingle ',' ',4,21,542400),(1550,'恭城 ','Gongcheng ',' ',4,21,542500),(1551,'钟山 ','Zhongshan ',' ',4,21,542600),(1552,'富川 ','Fuchuan ',' ',4,21,542700),(1553,'八步 ','Babu ',' ',4,21,542800),(1554,'梧州 ','Wuzhou ','WUZ ',4,21,543000),(1555,'苍梧 ','Cangwu ',' ',4,21,543100),(1556,'岑溪 ','Cenxi ',' ',4,21,543200),(1557,'藤县 ','Tengxian ',' ',4,21,543300),(1558,'柳州 ','Liuzhou ','LZH ',4,21,545000),(1559,'柳江 ','Liujiang ',' ',4,21,545100),(1560,'柳城 ','Liucheng ',' ',4,21,545200),(1561,'融水 ','Rongshui ',' ',4,21,545300),(1562,'融安 ','Rongan ',' ',4,21,545400),(1563,'三江 ','Sanjiang ',' ',4,21,545500),(1564,'鹿寨 ','Luzhai ',' ',4,21,545600),(1565,'金秀 ','Jinxiu ',' ',4,21,545700),(1566,'象州 ','Xiangzhou ',' ',4,21,545800),(1567,'武宣 ','Wuxuan ',' ',4,21,545900),(1568,'来宾 ','Laibin ',' ',4,21,546100),(1569,'忻城 ','Xincheng ',' ',4,21,546200),(1570,'宜州 ','Yizhou ',' ',4,21,546300),(1571,'罗城 ','Luocheng ',' ',4,21,546400),(1572,'合山 ','Heshan ',' ',4,21,546500),(1573,'荔浦 ','Lipu ',' ',4,21,546600),(1574,'蒙山 ','Mengshan ',' ',4,21,546700),(1575,'昭平 ','Zhaoping ',' ',4,21,546800),(1576,'河池 ','Hechi ',' ',4,21,547000),(1577,'环江 ','Huanjiang ',' ',4,21,547100),(1578,'南丹 ','Nandan ',' ',4,21,547200),(1579,'天峨 ','Tiane ',' ',4,21,547300),(1580,'东兰 ','Donglan ',' ',4,21,547400),(1581,'巴马 ','Bama ',' ',4,21,547500),(1582,'凤山 ','Fengshan ',' ',4,21,547600),(1583,'贵阳 ','Guiyang ','KWE ',7,22,550000),(1584,'罗甸 ','Luodian ',' ',7,22,550100),(1585,'修文 ','Xiuwen ',' ',7,22,550200),(1586,'开阳 ','Kaiyang ',' ',7,22,550300),(1587,'瓮安 ','Wengan ',' ',7,22,550400),(1588,'福泉 ','Fuquan ',' ',7,22,550500),(1589,'惠水 ','Huishui ',' ',7,22,550600),(1590,'长顺 ','Changshun ',' ',7,22,550700),(1591,'紫云 ','Ziyun ',' ',7,22,550800),(1592,'息烽 ','Xifeng ',' ',7,22,551100),(1593,'龙里 ','Longli ',' ',7,22,551200),(1594,'贵定 ','Guiding ',' ',7,22,551300),(1595,'清镇 ','Qingzhen ',' ',7,22,551400),(1596,'黔西 ','Qianxi ',' ',7,22,551500),(1597,'大方 ','Dafang ',' ',7,22,551600),(1598,'毕节 ','Bijie ',' ',7,22,551700),(1599,'金沙 ','Jinsha ',' ',7,22,551800),(1600,'织金 ','Zhijin ',' ',7,22,552100),(1601,'册亨 ','Ceheng ',' ',7,22,552200),(1602,'望谟 ','Wangmo ',' ',7,22,552300),(1603,'安龙 ','Anlong ',' ',7,22,552400),(1604,'六盘水 ','Liupanshui ',' ',7,22,553000),(1605,'威宁 ','Weining ',' ',7,22,553100),(1606,'赫章 ','Hezhang ',' ',7,22,553200),(1607,'纳雍 ','Nayong ',' ',7,22,553300),(1608,'六枝 ','Liuzhi ',' ',7,22,553400),(1609,'玉屏 ','Yuping ',' ',7,22,554000),(1610,'松桃 ','Songtao ',' ',7,22,554100),(1611,'万山 ','Wanshan ',' ',7,22,554200),(1612,'江口 ','Jiangkou ',' ',7,22,554400),(1613,'石阡 ','Shiqian ',' ',7,22,555100),(1614,'印江 ','Yinjiang ',' ',7,22,555200),(1615,'凯里 ','Kaili ',' ',7,22,556000),(1616,'黄平 ','Huangping ',' ',7,22,556100),(1617,'施秉 ','Shibing ',' ',7,22,556200),(1618,'台江 ','Taijiang ',' ',7,22,556300),(1619,'剑河 ','Jianhe ',' ',7,22,556400),(1620,'三穗 ','Sansui ',' ',7,22,556500),(1621,'天柱 ','Tianzhu ',' ',7,22,556600),(1622,'锦屏 ','Jinping ',' ',7,22,556700),(1623,'雷山 ','Leishan ',' ',7,22,557100),(1624,'榕江 ','Rongjiang ',' ',7,22,557200),(1625,'黎平 ','Liping ',' ',7,22,557300),(1626,'从江 ','Congjiang ',' ',7,22,557400),(1627,'丹寨 ','Danzhai ',' ',7,22,557500),(1628,'麻江 ','Majiang ',' ',7,22,557600),(1629,'镇远 ','Zhenyuan ',' ',7,22,557700),(1630,'岑巩 ','Cengong ',' ',7,22,557800),(1631,'都匀 ','Douyun ',' ',7,22,558000),(1632,'独山 ','Dushan ',' ',7,22,558200),(1633,'平塘 ','Pingtang ',' ',7,22,558300),(1634,'荔波 ','Libo ',' ',7,22,558400),(1635,'安顺 ','Anshun ','AVA ',7,22,561000),(1636,'平坝 ','Pingba ',' ',7,22,561100),(1637,'镇宁 ','Zhenning ',' ',7,22,561200),(1638,'关岭 ','Guanling ',' ',7,22,561300),(1639,'晴隆 ','Qinglong ',' ',7,22,561400),(1640,'普安 ','Puan ',' ',7,22,561500),(1641,'盘县 ','Panxian ',' ',7,22,561600),(1642,'普定 ','Puding ',' ',7,22,562100),(1643,'贞丰 ','Zhenfeng ',' ',7,22,562200),(1644,'兴仁 ','Xingren ',' ',7,22,562300),(1645,'兴义 ','Xingyi ',' ',7,22,562400),(1646,'遵义 ','Zunyi ',' ',7,22,563000),(1647,'遵义县 ','Zunyi ',' ',7,22,563100),(1648,'桐梓 ','Tongzi ',' ',7,22,563200),(1649,'正安 ','Zhengan ',' ',7,22,563400),(1650,'道真 ','Daozhen ',' ',7,22,563500),(1651,'湄潭 ','Meitan ',' ',7,22,564100),(1652,'凤冈 ','Fenggang ',' ',7,22,564200),(1653,'务川 ','Wuchuan ',' ',7,22,564300),(1654,'铜仁 ','Tongren ',' ',7,22,564300),(1655,'余庆 ','Yuqing ',' ',7,22,564400),(1656,'仁怀 ','Renhuai ',' ',7,22,564500),(1657,'习水 ','Xishui ',' ',7,22,564600),(1658,'赤水 ','Chishui ',' ',7,22,564700),(1659,'思南 ','Sinan ',' ',7,22,565100),(1660,'德江 ','Dejiang ',' ',7,22,565200),(1661,'沿河 ','Yanhe ',' ',7,22,565300),(1662,'海口 ','Haikou ','HAK ',4,23,570000),(1663,'琼山 ','Qiongshan ',' ',4,23,571100),(1664,'安定 ','Anding ',' ',4,23,571200),(1665,'文昌 ','Wenchang ',' ',4,23,571300),(1666,'琼海 ','Qionghai ',' ',4,23,571400),(1667,'万宁 ','Wanning ',' ',4,23,571500),(1668,'屯昌 ','Tunchang ',' ',4,23,571600),(1669,'儋州 ','Danzhou ',' ',4,23,571700),(1670,'临高 ','Lingao ',' ',4,23,571800),(1671,'澄迈 ','Chengmai ',' ',4,23,571900),(1672,'三亚 ','Sanya ','SYX ',4,23,572000),(1673,'通什 ','Tongshi ',' ',4,23,572200),(1674,'保亭 ','Baoting ',' ',4,23,572300),(1675,'陵水 ','Lingshui ',' ',4,23,572400),(1676,'乐东 ','Ledong ',' ',4,23,572500),(1677,'东方 ','Dongfang ',' ',4,23,572600),(1678,'昌江 ','Changjiang ',' ',4,23,572700),(1679,'白沙 ','Baisha ',' ',4,23,572800),(1680,'琼中 ','Qiongzhong ',' ',4,23,572900),(1681,'洋浦 ','Yangpu ',' ',4,23,578000),(1682,'成都 ','Chengdou ','CTU ',7,24,610000),(1683,'双流 ','Shuangliu ',' ',7,24,610200),(1684,'金堂 ','Jintang ',' ',7,24,610400),(1685,'新都 ','Xindou ',' ',7,24,610500),(1686,'温江 ','Wenjiang ',' ',7,24,611100),(1687,'崇州 ','Chongzhou ',' ',7,24,611200),(1688,'大邑 ','Dayi ',' ',7,24,611300),(1689,'新津 ','Xinjin ',' ',7,24,611400),(1690,'邛崃 ','Qionglai ',' ',7,24,611500),(1691,'蒲江 ','Pujiang ',' ',7,24,611600),(1692,'郫县 ','Pixian ',' ',7,24,611700),(1693,'都江堰 ','Doujiangyan ',' ',7,24,611800),(1694,'彭州 ','Pengzhou ',' ',7,24,611900),(1695,'眉山 ','Meishan ',' ',7,24,612100),(1696,'丹梭 ','Dansuo ',' ',7,24,612200),(1697,'洪雅 ','Hongya ',' ',7,24,612300),(1698,'青神 ','Qingshen ',' ',7,24,612400),(1699,'仁寿 ','Renshou ',' ',7,24,612500),(1700,'井研 ','Jingyan ',' ',7,24,612600),(1701,'彭山 ','Pengshan ',' ',7,24,612700),(1702,'乐山 ','Leshan ',' ',7,24,614000),(1703,'夹江 ','Jiajiang  ',' ',7,24,614100),(1704,'峨眉山 ','Emeishan ',' ',7,24,614200),(1705,'峨边 ','Ebian ',' ',7,24,614300),(1706,'犍为 ','Jianwei ',' ',7,24,614400),(1707,'沐川 ','Muchuan ',' ',7,24,614500),(1708,'马边 ','Mabian ',' ',7,24,614600),(1709,'金口河 ','Jinkouhe ',' ',7,24,614700),(1710,'西昌 ','Xichang ','XIC ',7,24,615000),(1711,'会理 ','Huili ',' ',7,24,615100),(1712,'会东 ','Huidong ',' ',7,24,615200),(1713,'普格 ','Puge ',' ',7,24,615300),(1714,'宁南 ','Ningnan ',' ',7,24,615400),(1715,'冕宁 ','Mianning ',' ',7,24,615600),(1716,'盐源 ','Yanyuan ',' ',7,24,615700),(1717,'木里 ','Muli ',' ',7,24,615800),(1718,'昭觉 ','Zhaojue  ',' ',7,24,616100),(1719,'金阳 ','Jinyang ',' ',7,24,616200),(1720,'布拖 ','Butuo ',' ',7,24,616300),(1721,'美姑 ','Meigu ',' ',7,24,616400),(1722,'雷波 ','Leibo ',' ',7,24,616500),(1723,'越西 ','Yuexi ',' ',7,24,616600),(1724,'喜德 ','Xide ',' ',7,24,616700),(1725,'甘洛 ','Ganluo ',' ',7,24,616800),(1726,'攀枝花 ','Panzhihua ','PZI ',7,24,617000),(1727,'盐边 ','Yanbian ',' ',7,24,617100),(1728,'米易 ','Miyi ',' ',7,24,617200),(1729,'华坪 ','Huaping ',' ',7,25,617300),(1730,'中江 ','Zhongjiang ',' ',7,24,618100),(1731,'绵竹 ','Mianzhu ',' ',7,24,618200),(1732,'德阳 ','Deyang ',' ',7,24,618200),(1733,'广汉 ','Guanghan ',' ',7,24,618300),(1734,'什邡 ','Shifang ',' ',7,24,618400),(1735,'绵阳 ','Mianyang ','MIG ',7,24,621000),(1736,'三台 ','Santai ',' ',7,24,621100),(1737,'盐亭 ','Yanting ',' ',7,24,621600),(1738,'江油 ','Jiangyou ',' ',7,24,621700),(1739,'梓潼 ','Zitong ',' ',7,24,622100),(1740,'平武 ','Pingwu ',' ',7,24,622500),(1741,'安县 ','Anxian ',' ',7,24,622600),(1742,'汶川 ','Wenchuan ',' ',7,24,623000),(1743,'理县 ','Lixian ',' ',7,24,623100),(1744,'松潘 ','Songpan ',' ',7,24,623300),(1745,'马尔康 ','Barkam ',' ',7,24,624000),(1746,'雅安 ','Yaan ',' ',7,24,625000),(1747,'名山 ','Mingshan ',' ',7,24,625100),(1748,'荥经 ','Yingjing ',' ',7,24,625200),(1749,'汉源 ','Hanyuan ',' ',7,24,625300),(1750,'石棉 ','Shimian ',' ',7,24,625400),(1751,'天全 ','Tianquan ',' ',7,24,625500),(1752,'芦山 ','Lushan ',' ',7,24,625600),(1753,'宝兴 ','Baoxing ',' ',7,24,625700),(1754,'康定 ','Kangding ','KGT ',7,24,626000),(1755,'广元 ','Guangyuan ','GYS ',7,24,628000),(1756,'青川 ','Qingchuan ',' ',7,24,628100),(1757,'旺苍 ','Wangcang ',' ',7,24,628200),(1758,'剑阁 ','Jiange ',' ',7,24,628300),(1759,'苍溪 ','Cangxi ',' ',7,24,628400),(1760,'遂宁 ','Suining ',' ',7,24,629000),(1761,'蓬溪 ','Pengxi ',' ',7,24,629100),(1762,'射洪 ','Shehong ',' ',7,24,629200),(1763,'璧山 ','Bishan ',' ',7,24,632700),(1764,'大竹 ','Dazhu ',' ',7,24,635100),(1765,'渠县 ','Quxian ',' ',7,24,635200),(1766,'邻水 ','Linshui ',' ',7,24,635300),(1767,'平昌 ','Pingchang ',' ',7,24,635400),(1768,'巴中 ','Bazhong ',' ',7,24,635500),(1769,'南江 ','Nanjiang ',' ',7,24,635600),(1770,'通江 ','Tongjiang ',' ',7,24,635700),(1771,'宣汉 ','Xuanhan ',' ',7,24,636100),(1772,'开江 ','Kaijiang ',' ',7,24,636200),(1773,'万源 ','Wanyuan ',' ',7,24,636300),(1774,'达川 ','Dachuan ',' ',7,24,636400),(1775,'南充 ','Nanchong ',' ',7,24,637100),(1776,'西充 ','Xichong ',' ',7,24,637200),(1777,'南部 ','Nanbu ',' ',7,24,637300),(1778,'阆中 ','Langzhong ',' ',7,24,637400),(1779,'仪陇 ','Yilong ',' ',7,24,637600),(1780,'广安 ','Guangan ',' ',7,24,638000),(1781,'营山 ','Yingshan ',' ',7,24,638150),(1782,'蓬安 ','Pengan ',' ',7,24,638200),(1783,'岳池 ','Yuechi ',' ',7,24,638300),(1784,'武胜 ','Wusheng ',' ',7,24,638400),(1785,'华蓥 ','Huaying ',' ',7,24,638600),(1786,'内江 ','Neijiang ',' ',7,24,641000),(1787,'资中 ','Zizhong ',' ',7,24,641200),(1788,'资阳 ','Ziyang ',' ',7,24,641300),(1789,'简阳 ','Jianyang ',' ',7,24,641400),(1790,'乐至 ','Lezhi ',' ',7,24,641500),(1791,'隆昌 ','Longchang ',' ',7,24,642100),(1792,'威远 ','Weiyuan ',' ',7,24,642400),(1793,'自贡 ','Zigong ',' ',7,24,643000),(1794,'荣县 ','Rongxian ',' ',7,24,643100),(1795,'富顺 ','Fushun ',' ',7,24,643200),(1796,'宜宾 ','Yibin ','YBP ',7,24,644000),(1797,'南溪 ','Nanxi ',' ',7,24,644100),(1798,'江安 ','Jiangan ',' ',7,24,644200),(1799,'长宁 ','Changning ',' ',7,24,644300),(1800,'兴文 ','Xingwen ',' ',7,24,644400),(1801,'珙县 ','Gongxian ',' ',7,24,644500),(1802,'高县 ','Gaoxian ',' ',7,24,645100),(1803,'筠连 ','Junlian ',' ',7,24,645200),(1804,'屏山 ','Pingshan ',' ',7,24,645300),(1805,'泸州 ','Luzhou ',' ',7,24,646000),(1806,'合江 ','Hejiang ',' ',7,24,646200),(1807,'纳溪 ','Naxi ',' ',7,24,646300),(1808,'叙永 ','Xuyong ',' ',7,24,646400),(1809,'古蔺 ','Gulin ',' ',7,24,646500),(1810,'彭水 ','Pengshui ',' ',7,24,648600),(1811,'酉阳 ','Youyang ',' ',7,24,648800),(1812,'秀山 ','Xiushan ',' ',7,24,648900),(1813,'昆明 ','Kunming ','KMG ',7,25,650000),(1814,'安宁 ','Anning ',' ',7,25,650300),(1815,'富民 ','Fumin ',' ',7,25,650400),(1816,'呈贡 ','Chenggong ',' ',7,25,650500),(1817,'晋宁 ','Jinning ',' ',7,25,650600),(1818,'易门 ','Yimen ',' ',7,25,651100),(1819,'禄丰 ','Lufeng ',' ',7,25,651200),(1820,'元谋 ','Yuanmou ',' ',7,25,651300),(1821,'永仁 ','Yongren ',' ',7,25,651400),(1822,'禄劝 ','Luquan ',' ',7,25,651500),(1823,'武定 ','Wuding ',' ',7,25,651600),(1824,'嵩明 ','Songming ',' ',7,25,651700),(1825,'宜良 ','Yiliang ',' ',7,25,652100),(1826,'石林 ','Shilin  ',' ',7,25,652200),(1827,'弥勒 ','Mile ',' ',7,25,652300),(1828,'泸西 ','Luxi ',' ',7,25,652400),(1829,'澄江 ','Chengjiang ',' ',7,25,652500),(1830,'江川 ','Jiangchuan ',' ',7,25,652600),(1831,'通海 ','Tonghai ',' ',7,25,652700),(1832,'华宁 ','Huaning ',' ',7,25,652800),(1833,'玉溪 ','Yuxi ',' ',7,25,653100),(1834,'峨山 ','Eshan ',' ',7,25,653200),(1835,'元江 ','Yuanjiang ',' ',7,25,653300),(1836,'新平 ','Xinping ',' ',7,25,653400),(1837,'东川 ','Dongchuan ',' ',7,25,654100),(1838,'会泽 ','Huize ',' ',7,25,654200),(1839,'建水 ','Jianshui ',' ',7,25,654300),(1840,'红河 ','Honghe ',' ',7,25,654400),(1841,'巧家 ','Qiaojia ',' ',7,25,654600),(1842,'墨江 ','Mojiang ',' ',7,25,654800),(1843,'曲靖 ','Qujing ',' ',7,25,655000),(1844,'马龙 ','Malong ',' ',7,25,655100),(1845,'寻甸 ','Xundian ',' ',7,25,655200),(1846,'富源 ','Fuyuan ',' ',7,25,655500),(1847,'陆良 ','Luliang ',' ',7,25,655600),(1848,'师宗 ','Shizong ',' ',7,25,655700),(1849,'昭通 ','Zhaotong ','ZAT ',7,25,657000),(1850,'鲁甸 ','Ludian ',' ',7,25,657100),(1851,'镇雄 ','Zhenxiong ',' ',7,25,657200),(1852,'永善 ','Yongshan ',' ',7,25,657300),(1853,'大关 ','Daguan ',' ',7,25,657400),(1854,'盐津 ','Yanjin ',' ',7,25,657500),(1855,'彝良 ','Yiliang ',' ',7,25,657600),(1856,'绥江 ','Suijiang ',' ',7,25,657700),(1857,'水富 ','Shuifu ',' ',7,25,657800),(1858,'威信 ','Weixin ',' ',7,25,657900),(1859,'开远 ','Kaiyuan ',' ',7,25,661000),(1860,'蒙自 ','Mengzi ',' ',7,25,661100),(1861,'屏边 ','Pingbian ',' ',7,25,661200),(1862,'河口 ','Hekou ',' ',7,25,661300),(1863,'个旧 ','Gejiu ',' ',7,25,661400),(1864,'金平 ','Jinping ',' ',7,25,661500),(1865,'石屏 ','Shiping ',' ',7,25,662200),(1866,'元阳 ','Yuanyang ',' ',7,25,662400),(1867,'绿春 ','Luchun ',' ',7,25,662500),(1868,'文山 ','Wenshan ','WNH ',7,25,663000),(1869,'砚山 ','Yanshan ',' ',7,25,663100),(1870,'丘北 ','Qiubei ',' ',7,25,663200),(1871,'广南 ','Guangnan ',' ',7,25,663300),(1872,'富宁 ','Funing ',' ',7,25,663400),(1873,'西畴 ','Xichou ',' ',7,25,663500),(1874,'麻栗坡 ','Malipo ',' ',7,25,663600),(1875,'马关 ','Maguan ',' ',7,25,663700),(1876,'思茅 ','Simao ',' ',7,25,665000),(1877,'普洱 ','Puer ',' ',7,25,665100),(1878,'宣威 ','Xuanwei ',' ',7,25,665400),(1879,'澜沧 ','Lancang ',' ',7,25,665600),(1880,'西盟 ','Ximeng ',' ',7,25,665700),(1881,'孟连 ','Menglian ',' ',7,25,665800),(1882,'罗平 ','Luoping ',' ',7,25,665800),(1883,'江城 ','Jiangcheng ',' ',7,25,665900),(1884,'景洪 ','Jinghong ',' ',7,25,666100),(1885,'孟海 ','Menghai ',' ',7,25,666200),(1886,'猛腊 ','Mengla ',' ',7,25,666300),(1887,'景谷 ','Jinggu ',' ',7,25,666400),(1888,'镇沅 ','Zhenyuan ',' ',7,25,666500),(1889,'大理 ','Dali ','DLU ',7,25,671000),(1890,'洱源 ','Eryuan ',' ',7,25,671200),(1891,'剑川 ','Jianchuan ',' ',7,25,671300),(1892,'兰坪 ','Lanping ',' ',7,25,671400),(1893,'鹤庆 ','Heqing ',' ',7,25,671500),(1894,'宾川 ','Binchuan ',' ',7,25,671600),(1895,'祥云 ','Xiangyun ',' ',7,25,672100),(1896,'巍山 ','Weishan ',' ',7,25,672400),(1897,'漾濞 ','Yangbi ',' ',7,25,672500),(1898,'永平 ','Yongping ',' ',7,25,672600),(1899,'云龙 ','Yunlong ',' ',7,25,672700),(1900,'六库 ','Liuku ',' ',7,25,673100),(1901,'泸水 ','Lushui ',' ',7,25,673200),(1902,'福贡 ','Fugong ',' ',7,25,673400),(1903,'贡山 ','Gongshan ',' ',7,25,673500),(1904,'丽江 ','Lijiang ',' ',7,25,674100),(1905,'永胜 ','Yongsheng ',' ',7,25,674200),(1906,'宁蒗 ','Ninglang ',' ',7,25,674300),(1907,'中甸 ','Zhongdian ',' ',7,25,674400),(1908,'德钦 ','Deqen ',' ',7,25,674500),(1909,'维西 ','Weixi ',' ',7,25,674600),(1910,'楚雄 ','Chuxiong ',' ',7,25,675000),(1911,'双柏 ','Shuangbai ',' ',7,25,675100),(1912,'南华 ','Nanhua ',' ',7,25,675200),(1913,'姚安 ','Yaoan ',' ',7,25,675300),(1914,'大姚 ','Dayao ',' ',7,25,675400),(1915,'牟定 ','Mouding ',' ',7,25,675500),(1916,'弥渡 ','Midu ',' ',7,25,675600),(1917,'南涧 ','Nanjian ',' ',7,25,675700),(1918,'云县 ','Yunxian ',' ',7,25,675800),(1919,'凤庆 ','Fengqing ',' ',7,25,675900),(1920,'景东 ','Jingdong ',' ',7,25,676200),(1921,'临沧 ','Lincang ','LNJ ',7,25,677000),(1922,'双江 ','Shuangjiang ',' ',7,25,677300),(1923,'沧源 ','Cangyuan ',' ',7,25,677400),(1924,'耿马 ','Gengma ',' ',7,25,677500),(1925,'永德 ','Yongde ',' ',7,25,677600),(1926,'镇康 ','Zhenkang ',' ',7,25,677700),(1927,'保山 ','Baoshan ','BSD ',7,25,678000),(1928,'昌宁 ','Changning ',' ',7,25,678100),(1929,'施甸 ','Shidian ',' ',7,25,678200),(1930,'龙陵 ','Longling ',' ',7,25,678300),(1931,'潞西 ','Luxi ',' ',7,25,678400),(1932,'畹町 ','Wanding ',' ',7,25,678500),(1933,'瑞丽 ','Ruili ',' ',7,25,678600),(1934,'陇川 ','Longchuan ',' ',7,25,678700),(1935,'腾冲 ','Tengchong ',' ',7,25,679100),(1936,'梁河 ','Lianghe ',' ',7,25,679200),(1937,'盈江 ','Yingjiang ',' ',7,25,679300),(1938,'西安 ','Xian ','XIY ',6,26,710000),(1939,'长安 ','Changan ',' ',6,26,710100),(1940,'高陵 ','Gaoling ',' ',6,26,710200),(1941,'户县 ','Huxian ',' ',6,26,710300),(1942,'周至 ','Zhouzhi ',' ',6,26,710400),(1943,'蓝田 ','Lantian ',' ',6,26,710500),(1944,'临潼 ','Lintong ',' ',6,26,710600),(1945,'淳化 ','Chunhua ',' ',6,26,711200),(1946,'旬邑 ','Xunyi ',' ',6,26,711300),(1947,'柞水 ','Zhashui ',' ',6,26,711400),(1948,'镇安 ','Zhenan ',' ',6,26,711500),(1949,'宁陕 ','Ningshan ',' ',6,26,711600),(1950,'富平 ','Fuping ',' ',6,26,711700),(1951,'咸阳 ','Xianyang ',' ',6,26,712000),(1952,'武功 ','Wugong ',' ',6,26,712200),(1953,'兴平 ','Xingping ',' ',6,26,713100),(1954,'礼泉 ','Liquan ',' ',6,26,713200),(1955,'干县 ','Qianxian ',' ',6,26,713300),(1956,'永寿 ','Yongshou ',' ',6,26,713400),(1957,'彬县 ','Binxian ',' ',6,26,713500),(1958,'镇巴 ','Zhenba ',' ',6,26,713600),(1959,'长武 ','Changwu ',' ',6,26,713600),(1960,'泾阳 ','Jingyang ',' ',6,26,713700),(1961,'三原 ','Sanyuan ',' ',6,26,713800),(1962,'渭南 ','Weinan ',' ',6,26,714000),(1963,'华县 ','Huaxian ',' ',6,26,714100),(1964,'华阴 ','Huayin ',' ',6,26,714200),(1965,'潼关 ','Tongguan ',' ',6,26,714300),(1966,'大荔 ','Dali ',' ',6,26,715100),(1967,'澄城 ','Chengcheng ',' ',6,26,715200),(1968,'合阳 ','Heyang ',' ',6,26,715300),(1969,'韩城 ','Hancheng ',' ',6,26,715400),(1970,'蒲城 ','Pucheng ',' ',6,26,715500),(1971,'白水 ','Baishui ',' ',6,26,715600),(1972,'黄龙 ','Huanglong ',' ',6,26,715700),(1973,'延安 ','Yanan ','ENY ',6,26,716000),(1974,'甘泉 ','Ganquan ',' ',6,26,716100),(1975,'宜川 ','Yichuan ',' ',6,26,716200),(1976,'延长 ','Yanchang ',' ',6,26,717100),(1977,'延川 ','Yanchuan ',' ',6,26,717200),(1978,'子长 ','Zichang ',' ',6,26,717300),(1979,'安塞 ','Ansai ',' ',6,26,717400),(1980,'志丹 ','Zhidan ',' ',6,26,717500),(1981,'吴旗 ','Wuqi ',' ',6,26,717600),(1982,'绥德 ','Suide ',' ',6,26,718000),(1983,'米脂 ','Mizhi ',' ',6,26,718100),(1984,'吴堡 ','Wubao ',' ',6,26,718200),(1985,'清涧 ','Qingjian ',' ',6,26,718300),(1986,'子洲 ','Zizhou ',' ',6,26,718400),(1987,'靖边 ','Jingbian ',' ',6,26,718500),(1988,'定边 ','Dingbian ',' ',6,26,718600),(1989,'榆林 ','Yulin ','UYN ',6,26,719000),(1990,'横山 ','Hengshan ',' ',6,26,719100),(1991,'佳县 ','Jiaxian ',' ',6,26,719200),(1992,'神木 ','Shenmu ',' ',6,26,719300),(1993,'府谷 ','Fugu ',' ',6,26,719400),(1994,'宝鸡 ','Baoji ',' ',6,26,721000),(1995,'千阳 ','Qianyang ',' ',6,26,721100),(1996,'陇县 ','Longxian ',' ',6,26,721200),(1997,'宝鸡县 ','Baoji ',' ',6,26,721300),(1998,'凤翔 ','Fengxiang ',' ',6,26,721400),(1999,'麟游 ','Linyou ',' ',6,26,721500),(2000,'太白 ','Taibai ',' ',6,26,721600),(2001,'凤县 ','Fengxian ',' ',6,26,721700),(2002,'扶风 ','Fufeng ',' ',6,26,722200),(2003,'眉县 ','Meixian ',' ',6,26,722300),(2004,'岐山 ','Qishan ',' ',6,26,722400),(2005,'汉中 ','Hanzhong ','HZG ',6,26,723000),(2006,'南郑 ','Nanzheng ',' ',6,26,723100),(2007,'城固 ','Chenggu ',' ',6,26,723200),(2008,'洋县 ','Yangxian ',' ',6,26,723300),(2009,'佛坪 ','Foping ',' ',6,26,723400),(2010,'西乡 ','Xixiang ',' ',6,26,723500),(2011,'留坝 ','Liuba ',' ',6,26,724100),(2012,'勉县 ','Mianxian ',' ',6,26,724200),(2013,'略阳 ','Lueyang ',' ',6,26,724300),(2014,'宁强 ','Ningqiang ',' ',6,26,724400),(2015,'安康 ','Ankang ','AKA ',6,26,725000),(2016,'汉阴 ','Hanyin ',' ',6,26,725100),(2017,'石泉 ','Shiquan ',' ',6,26,725200),(2018,'紫阳 ','Ziyang ',' ',6,26,725300),(2019,'岚皋 ','Langao ',' ',6,26,725400),(2020,'平利 ','Pingli ',' ',6,26,725500),(2021,'镇坪 ','Zhenping ',' ',6,26,725600),(2022,'旬阳 ','Xunyang ',' ',6,26,725700),(2023,'白河 ','Baihe ',' ',6,26,725800),(2024,'商州 ','Shangzhou ',' ',6,26,726000),(2025,'洛南 ','Luonan ',' ',6,26,726100),(2026,'丹凤 ','Danfeng ',' ',6,26,726200),(2027,'商南 ','Shangnan ',' ',6,26,726300),(2028,'山阳 ','Shanyang ',' ',6,26,726400),(2029,'铜川 ','Tongchuan ',' ',6,26,727000),(2030,'耀县 ','Yaoxian ',' ',6,26,727100),(2031,'宜君 ','Yijun ',' ',6,26,727200),(2032,'黄陵 ','Huangling ',' ',6,26,727300),(2033,'洛川 ','Luochuan ',' ',6,26,727400),(2034,'富县 ','Fuxian ',' ',6,26,727500),(2035,'兰州 ','Lanzhou ','LHW ',6,27,730000),(2036,'红古区 ','Honggu ',' ',6,27,730000),(2037,'榆中 ','Yuzhong ',' ',6,27,730100),(2038,'皋兰 ','Gaolan ',' ',6,27,730200),(2039,'永登 ','Yongdeng ',' ',6,27,730300),(2040,'景泰 ','Jingtai ',' ',6,27,730400),(2041,'临洮 ','Lintao ',' ',6,27,730500),(2042,'靖远 ','Jingyuan ',' ',6,27,730600),(2043,'白银 ','Baiyin ',' ',6,27,730900),(2044,'临夏市 ','Linxia ',' ',6,27,731100),(2045,'和政 ','Hezheng ',' ',6,27,731200),(2046,'广河 ','Guanghe ',' ',6,27,731300),(2047,'东乡 ','Dongxiang ',' ',6,27,731400),(2048,'康乐 ','Kangle ',' ',6,27,731500),(2049,'永靖 ','Yongjing ',' ',6,27,731600),(2050,'积石山 ','Jishishan ',' ',6,27,731700),(2051,'临夏县 ','Linxia ',' ',6,27,731800),(2052,'金昌 ','Jinchang ',' ',6,27,733000),(2053,'古浪 ','Gulang ',' ',6,27,733100),(2054,'天祝 ','Tianzhu ',' ',6,27,733200),(2055,'民勤 ','Minqin ',' ',6,27,733300),(2056,'张掖 ','Zhangye ',' ',6,27,734000),(2057,'山丹 ','Shandan ',' ',6,27,734100),(2058,'临泽 ','Linze ',' ',6,27,734200),(2059,'高台 ','Gaotai ',' ',6,27,734300),(2060,'肃南 ','Sunan ',' ',6,27,734400),(2061,'民乐 ','Minle ',' ',6,27,734500),(2062,'酒泉 ','Jiuquan ',' ',6,27,735000),(2063,'嘉峪关 ','Jiayuguan ',' ',6,27,735100),(2064,'玉门 ','Yumen ',' ',6,27,735200),(2065,'金塔 ','Jinta ',' ',6,27,735300),(2066,'额济纳旗 ','Ejin Banner ',' ',1,1,735400),(2067,'瓜州 ','Guazhou  ',' ',6,27,736100),(2068,'敦煌 ','Dunhuang ',' ',6,27,736200),(2069,'肃北 ','Subei ',' ',6,27,736300),(2070,'阿克塞 ','Akesai ',' ',6,27,736400),(2071,'金川 ','Jinchuan ',' ',6,27,737100),(2072,'永昌 ','Yongchang ',' ',6,27,737200),(2073,'阿拉善右旗 ','Alxa  Right Banner ',' ',1,1,737300),(2074,'天水 ','Tianshui ','THQ ',6,27,741000),(2075,'甘谷 ','Gangu ',' ',6,27,741200),(2076,'武山 ','Wushan ',' ',6,27,741300),(2077,'清水 ','Qingshui ',' ',6,27,741400),(2078,'张家川 ','Zhangjiachuan ',' ',6,27,741500),(2079,'秦安 ','Qinan ',' ',6,27,741600),(2080,'庄浪 ','Zhuanglang ',' ',6,27,741700),(2081,'西和 ','Xihe ',' ',6,27,742100),(2082,'礼县 ','Lixian ',' ',6,27,742200),(2083,'徽县 ','Huixian ',' ',6,27,742300),(2084,'两当 ','Liangdang ',' ',6,27,742400),(2085,'成县 ','Chengxian ',' ',6,27,742500),(2086,'定西 ','Dingxi ',' ',6,27,743000),(2087,'会宁 ','Huining ',' ',6,27,743200),(2088,'通渭 ','Tongwei ',' ',6,27,743300),(2089,'静宁 ','Jingning ',' ',6,27,743400),(2090,'平凉 ','Pingliang ',' ',6,27,744000),(2091,'华亭 ','Huating ',' ',6,27,744100),(2092,'崇信 ','Chongxin ',' ',6,27,744200),(2093,'泾川 ','Jingchuan ',' ',6,27,744300),(2094,'灵台 ','Lingtai ',' ',6,27,744400),(2095,'镇原 ','Zhenyuan ',' ',6,27,744500),(2096,'西峰 ','Xifeng ',' ',6,27,745000),(2097,'庆阳 ','Qingyang ',' ',6,27,745100),(2098,'宁县 ','Ningxian ',' ',6,27,745200),(2099,'正宁 ','Zhengning ',' ',6,27,745300),(2100,'合水 ','Heshui ',' ',6,27,745400),(2101,'华池 ','Huachi ',' ',6,27,745600),(2102,'环县 ','Huanxian ',' ',6,27,745700),(2103,'武都 ','Wudu ',' ',6,27,746000),(2104,'舟曲 ','Zhouqu ',' ',6,27,746300),(2105,'文县 ','Wenxian ',' ',6,27,746400),(2106,'康县 ','Kangxian ',' ',6,27,746500),(2107,'甘南 ','Gannan  ',' ',6,27,747000),(2108,'夏河 ','Xiahe ',' ',6,27,747100),(2109,'碌曲 ','Luqu ',' ',6,27,747200),(2110,'玛曲 ','Maqu ',' ',6,27,747300),(2111,'迭部 ','Diebu ',' ',6,27,747400),(2112,'临潭 ','Lintan ',' ',6,27,747500),(2113,'卓尼 ','Zhuoni ',' ',6,27,747600),(2114,'陇西 ','Longxi ',' ',6,27,748100),(2115,'渭源 ','Weiyuan ',' ',6,27,748200),(2116,'漳县 ','Zhangxian ',' ',6,27,748300),(2117,'岷县 ','Minxian ',' ',6,27,748400),(2118,'宕昌 ','Dangchang ',' ',6,27,748500),(2119,'银川 ','Yinchuan ','INC ',6,28,750000),(2120,'永宁 ','Yongning ',' ',6,28,750100),(2121,'贺兰 ','Helan ',' ',6,28,750200),(2122,'阿拉善左旗 ','Alxa  Left Banner ',' ',1,1,750300),(2123,'吴忠 ','Wuzhong ',' ',6,28,751100),(2124,'中宁 ','Zhongning ',' ',6,28,751200),(2125,'同心 ','Tongxin ',' ',6,28,751300),(2126,'灵武 ','Lingwu ',' ',6,28,751400),(2127,'盐池 ','Yanchi ',' ',6,28,751500),(2128,'青铜峡 ','Qingtongxia ',' ',6,28,751600),(2129,'中卫 ','Zhongwei ',' ',6,28,751700),(2130,'石嘴山 ','Shizuishan ',' ',6,28,753000),(2131,'平罗 ','Pingluo ',' ',6,28,753400),(2132,'陶乐 ','Taole ',' ',6,28,753500),(2133,'惠农 ','Huinong ',' ',6,28,753600),(2134,'固原 ','Guyuan ',' ',6,28,756000),(2135,'海原 ','Haiyuan ',' ',6,28,756100),(2136,'西吉 ','Xiji ',' ',6,28,756200),(2137,'隆德 ','Longde ',' ',6,28,756300),(2138,'泾源 ','Jingyuan ',' ',6,28,756400),(2139,'彭阳 ','Pengyang ',' ',6,28,756500),(2140,'西宁 ','Xining ','XNN ',6,29,810000),(2141,'大通 ','Datong ',' ',6,29,810100),(2142,'门源 ','Menyuan ',' ',6,29,810300),(2143,'祁连 ','Qilian ',' ',6,29,810400),(2144,'互助 ','Huzhu ',' ',6,29,810500),(2145,'乐都 ','Ledu ',' ',6,29,810700),(2146,'民和 ','Minhe ',' ',6,29,810800),(2147,'化隆 ','Hualong ',' ',6,29,810900),(2148,'循化 ','Xunhua ',' ',6,29,811100),(2149,'尖扎 ','Jianzha ',' ',6,29,811200),(2150,'同仁 ','Tongren ',' ',6,29,811300),(2151,'泽库 ','Zeku ',' ',6,29,811400),(2152,'19 ','Henan ',' ',6,29,811500),(2153,'湟中 ','Huangzhong ',' ',6,29,811600),(2154,'贵德 ','Guide ',' ',6,29,811700),(2155,'龙羊峡 ','Longyangxia ',' ',6,29,811800),(2156,'湟源 ','Huangyuan ',' ',6,29,812100),(2157,'海晏 ','Haiyan ',' ',6,29,812200),(2158,'刚察 ','Gangcha ',' ',6,29,812300),(2159,'共和 ','Gonghe ',' ',6,29,813000),(2160,'贵南 ','Guinan ',' ',6,29,813100),(2161,'同德 ','Tongde ',' ',6,29,813200),(2162,'兴海 ','Xinghai ',' ',6,29,813300),(2163,'玛多 ','Maduo ',' ',6,29,813500),(2164,'玛沁 ','Maqin ',' ',6,29,814000),(2165,'甘德 ','Gande ',' ',6,29,814100),(2166,'达日 ','Dari ',' ',6,29,814200),(2167,'班玛 ','Banma ',' ',6,29,814300),(2168,'玉树 ','Yushu ',' ',6,29,815000),(2169,'称多 ','Chindu ',' ',6,29,815100),(2170,'囊谦 ','Nangqian ',' ',6,29,815200),(2171,'杂多 ','Zadoi  ',' ',6,29,815300),(2172,'治多 ','Zhidoi ',' ',6,29,815400),(2173,'曲麻莱 ','Qumalai ',' ',6,29,815500),(2174,'格尔木 ','Geermu ','GOQ ',6,29,816000),(2175,'都兰 ','Dulan ',' ',6,29,816100),(2176,'德令哈 ','Delingha ',' ',6,29,817000),(2177,'乌兰 ','Wulan ',' ',6,29,817100),(2178,'天峻 ','Tianjun ',' ',6,29,817200),(2179,'大柴旦 ','Dachaidan ',' ',6,29,817300),(2180,'冷湖 ','Lenghu ',' ',6,29,817400),(2181,'茫崖 ','Mangya ',' ',6,29,817500),(2182,'乌鲁木齐 ','Wulumuqi ','URC ',6,30,830000),(2183,'昌吉 ','Changji ',' ',6,30,831100),(2184,'米泉 ','Miquan ',' ',6,30,831400),(2185,'阜康 ','Fukang ',' ',6,30,831500),(2186,'吉木萨尔 ','Jimusaer ',' ',6,30,831700),(2187,'奇台 ','Qitai ',' ',6,30,831800),(2188,'木垒 ','Mulei ',' ',6,30,831900),(2189,'石河子 ','Shihezi ',' ',6,30,832000),(2190,'沙湾 ','Shawan ',' ',6,30,832100),(2191,'玛纳斯 ','Manasi ',' ',6,30,832200),(2192,'乌苏 ','Wusu ',' ',6,30,833000),(2193,'奎屯 ','Kuitun ',' ',6,30,833200),(2194,'精河 ','Jinghe ',' ',6,30,833300),(2195,'博乐 ','Bole ',' ',6,30,833400),(2196,'温泉 ','Wenquan ',' ',6,30,833500),(2197,'克拉玛依 ','Kelamayi ',' ',6,30,834000),(2198,'和布克赛尔 ','Hoboksar  ',' ',6,30,834400),(2199,'托里 ','Tuoli ',' ',6,30,834500),(2200,'额敏 ','Emin ',' ',6,30,834600),(2201,'塔城 ','Tacheng ',' ',6,30,834700),(2202,'裕民 ','Yumin ',' ',6,30,834800),(2203,'伊宁 ','Yining ',' ',6,30,835000),(2204,'霍城 ','Huocheng ',' ',6,30,835200),(2205,'察布查尔 ','Chabuchaer ',' ',6,30,835300),(2206,'巩留 ','Gongliu ',' ',6,30,835400),(2207,'特克斯 ','Tekesi ',' ',6,30,835500),(2208,'昭苏 ','Zhaosu ',' ',6,30,835600),(2209,'尼勒克 ','Nileke ',' ',6,30,835700),(2210,'新源 ','Xinyuan ',' ',6,30,835800),(2211,'富蕴 ','Fuyun ',' ',6,30,836100),(2212,'青河 ','Qinghe ',' ',6,30,836200),(2213,'福海 ','Fuhai ',' ',6,30,836400),(2214,'阿勒泰 ','Aletai ',' ',6,30,836500),(2215,'布尔津 ','Burqin  ',' ',6,30,836600),(2216,'哈巴河 ','Habahe ',' ',6,30,836700),(2217,'吉木乃 ','Jimunai ',' ',6,30,836800),(2218,'吐鲁番 ','Tulufan ',' ',6,30,838000),(2219,'托克逊 ','Tuokexun ',' ',6,30,838100),(2220,'鄯善 ','Shanshan ',' ',6,30,838200),(2221,'哈密 ','Hami ',' ',6,30,839000),(2222,'巴里坤 ','Barkol  ',' ',6,30,839200),(2223,'伊吾 ','Yiwu ',' ',6,30,839300),(2224,'库尔勒 ','Kuerle ','KRL ',6,30,841000),(2225,'焉耆 ','Yanqi ',' ',6,30,841100),(2226,'和硕 ','Heshuo ',' ',6,30,841200),(2227,'和静 ','Hejing ',' ',6,30,841300),(2228,'博湖 ','Bohu ',' ',6,30,841400),(2229,'尉犁 ','Yuli ',' ',6,30,841500),(2230,'轮台 ','Luntai ',' ',6,30,841600),(2231,'若羌 ','Ruoqiang ',' ',6,30,841800),(2232,'且末 ','Qiemo ',' ',6,30,841900),(2233,'库车 ','Kuche ','KCA ',6,30,842000),(2234,'新和 ','Xinhe ',' ',6,30,842100),(2235,'沙雅 ','Shaya ',' ',6,30,842200),(2236,'拜城 ','Baicheng ',' ',6,30,842300),(2237,'阿克苏 ','Akesu ','AKU ',6,30,843000),(2238,'温宿 ','Wensu ',' ',6,30,843100),(2239,'阿瓦提 ','Awati ',' ',6,30,843200),(2240,'阿拉尔 ','Alaer ',' ',6,30,843300),(2241,'乌什 ','Wushi ',' ',6,30,843400),(2242,'阿合奇 ','Aheqi ',' ',6,30,843500),(2243,'柯坪 ','Keping ',' ',6,30,843600),(2244,'巴楚 ','Bachu ',' ',6,30,843800),(2245,'喀什 ','Kashgar  ','KHG ',6,30,844000),(2246,'疏附 ','Shufu ',' ',6,30,844100),(2247,'疏勒 ','Shule ',' ',6,30,844200),(2248,'伽师 ','Payzawat  ',' ',6,30,844300),(2249,'英吉沙 ','Yengisar  ',' ',6,30,844500),(2250,'麦盖提 ','Makit  ',' ',6,30,844600),(2251,'莎车 ','Shache ',' ',6,30,844700),(2252,'泽普 ','Zepu ',' ',6,30,844800),(2253,'叶城 ','Yecheng ',' ',6,30,844900),(2254,'皮山 ','Pishan ',' ',6,30,845100),(2255,'塔什库尔干 ','Tashikuergan ',' ',6,30,845200),(2256,'阿图什 ','Atushi ',' ',6,30,845300),(2257,'乌恰 ','Wuqia ',' ',6,30,845400),(2258,'阿克陶 ','Aketao ',' ',6,30,845500),(2259,'和田 ','Hetian ',' ',6,30,848000),(2260,'墨玉 ','Moyu ',' ',6,30,848100),(2261,'洛浦 ','Luopu ',' ',6,30,848200),(2262,'策勒 ','Qira  ',' ',6,30,848300),(2263,'于田 ','Yutian ',' ',6,30,848400),(2264,'民丰 ','Minfeng ',' ',6,30,848500),(2265,'拉萨 ','Lasa ','LXA ',7,32,850000),(2266,'林芝 ','Linzhi ',' ',7,32,850400),(2267,'曲水 ','Qushui ',' ',7,32,850600),(2268,'贡嘎 ','Gongga ',' ',7,32,850700),(2269,'扎囊 ','Zhanang ',' ',7,32,850800),(2270,'尼木 ','Nimu ',' ',7,32,851300),(2271,'堆龙德庆 ','Duilongdeqing ',' ',7,32,851400),(2272,'那曲 ','Nagqu ',' ',7,32,852000),(2273,'巴青 ','Baqing ',' ',7,32,852100),(2274,'索县 ','Suoxian ',' ',7,32,852200),(2275,'比如 ','Biru ',' ',7,32,852300),(2276,'班戈 ','Bange ',' ',7,32,852500),(2277,'尼玛 ','Nima ',' ',7,32,852600),(2278,'昌都 ','Changdu ','BPX ',7,32,854000),(2279,'江达 ','Jomda ',' ',7,32,854100),(2280,'芒康 ','Mangkang ',' ',7,32,854500),(2281,'八宿 ','Baxiu ',' ',7,32,854600),(2282,'洛隆 ','Luolong ',' ',7,32,855400),(2283,'丁青 ','Dingqing ',' ',7,32,855700),(2284,'山南 ','Shannan ',' ',7,32,856000),(2285,'日喀则 ','Rikaze ',' ',7,32,857000),(2286,'仁布 ','Renbu ',' ',7,32,857200),(2287,'阿里 ','Ali ',' ',7,32,859000),(2288,'措勤 ','Cuoqin ',' ',7,32,859300);
/*!40000 ALTER TABLE `LOCAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LOCAL_AGENT_INFO`
--

DROP TABLE IF EXISTS `LOCAL_AGENT_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LOCAL_AGENT_INFO` (
  `local_agent_id` int(5) NOT NULL AUTO_INCREMENT,
  `local_id` int(10) NOT NULL,
  `province_id` int(10) NOT NULL,
  `local_agent_name` varchar(30) COLLATE utf8_bin NOT NULL,
  `local_agent_addr` varchar(100) COLLATE utf8_bin NOT NULL,
  `tel_no` varchar(15) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`local_agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOCAL_AGENT_INFO`
--

LOCK TABLES `LOCAL_AGENT_INFO` WRITE;
/*!40000 ALTER TABLE `LOCAL_AGENT_INFO` DISABLE KEYS */;
/*!40000 ALTER TABLE `LOCAL_AGENT_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OTHER_INFO`
--

DROP TABLE IF EXISTS `OTHER_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OTHER_INFO` (
  `material_code` int(11) NOT NULL AUTO_INCREMENT,
  `material_no` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`material_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OTHER_INFO`
--

LOCK TABLES `OTHER_INFO` WRITE;
/*!40000 ALTER TABLE `OTHER_INFO` DISABLE KEYS */;
/*!40000 ALTER TABLE `OTHER_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OTHER_INSPECTION_INFO`
--

DROP TABLE IF EXISTS `OTHER_INSPECTION_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OTHER_INSPECTION_INFO` (
  `oii_no` int(11) NOT NULL AUTO_INCREMENT,
  `farm_id` varchar(5) COLLATE utf8_bin NOT NULL,
  `region_id` int(10) NOT NULL,
  `gacp_no` varchar(20) COLLATE utf8_bin NOT NULL,
  `up_date` date NOT NULL,
  `up_file` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `memo` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `is_old` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`oii_no`,`farm_id`,`region_id`,`is_old`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OTHER_INSPECTION_INFO`
--

LOCK TABLES `OTHER_INSPECTION_INFO` WRITE;
/*!40000 ALTER TABLE `OTHER_INSPECTION_INFO` DISABLE KEYS */;
/*!40000 ALTER TABLE `OTHER_INSPECTION_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OTHER_NOTES`
--

DROP TABLE IF EXISTS `OTHER_NOTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OTHER_NOTES` (
  `farm_id` varchar(5) COLLATE utf8_bin NOT NULL,
  `region_id` int(10) NOT NULL,
  `gacp_no` varchar(20) COLLATE utf8_bin NOT NULL,
  `other_date` date NOT NULL,
  `memo` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `reg_user_id` int(11) NOT NULL,
  `is_old` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`farm_id`,`region_id`,`other_date`,`is_old`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OTHER_NOTES`
--

LOCK TABLES `OTHER_NOTES` WRITE;
/*!40000 ALTER TABLE `OTHER_NOTES` DISABLE KEYS */;
/*!40000 ALTER TABLE `OTHER_NOTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OTHER_PURCH_RECORD`
--

DROP TABLE IF EXISTS `OTHER_PURCH_RECORD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OTHER_PURCH_RECORD` (
  `record_id` int(10) NOT NULL AUTO_INCREMENT,
  `farm_id` varchar(5) COLLATE utf8_bin NOT NULL,
  `region_id` int(10) NOT NULL,
  `purch_date` date NOT NULL,
  `label` varchar(100) COLLATE utf8_bin NOT NULL,
  `price` double(10,2) NOT NULL,
  `qty` double(10,2) NOT NULL,
  `subtotal` double(12,2) DEFAULT NULL,
  `memo` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `sup_id` int(5) DEFAULT NULL,
  `is_old` int(11) NOT NULL DEFAULT '0',
  `up_file` varchar(200) COLLATE utf8_bin NOT NULL,
  `qty_unit` int(11) NOT NULL,
  `lot_number` varchar(30) COLLATE utf8_bin NOT NULL,
  `material_code` int(11) NOT NULL,
  PRIMARY KEY (`record_id`,`farm_id`,`region_id`,`is_old`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OTHER_PURCH_RECORD`
--

LOCK TABLES `OTHER_PURCH_RECORD` WRITE;
/*!40000 ALTER TABLE `OTHER_PURCH_RECORD` DISABLE KEYS */;
/*!40000 ALTER TABLE `OTHER_PURCH_RECORD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ovum`
--

DROP TABLE IF EXISTS `Ovum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ovum` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ovum`
--

LOCK TABLES `Ovum` WRITE;
/*!40000 ALTER TABLE `Ovum` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ovum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PESTS_DISEASES_RECORD`
--

DROP TABLE IF EXISTS `PESTS_DISEASES_RECORD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PESTS_DISEASES_RECORD` (
  `pd_no` int(11) NOT NULL AUTO_INCREMENT,
  `farm_id` varchar(5) COLLATE utf8_bin NOT NULL,
  `region_id` int(10) NOT NULL,
  `gacp_no` varchar(20) COLLATE utf8_bin NOT NULL,
  `fert_date` date NOT NULL,
  `control_obj_code` int(11) NOT NULL,
  `application_qty` double(10,2) NOT NULL,
  `dilution_ratio` double(10,2) NOT NULL,
  `preve_method` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `purchase_id` int(11) NOT NULL,
  `reg_user_id` int(11) NOT NULL,
  `is_old` int(11) NOT NULL DEFAULT '0',
  `unit` int(11) NOT NULL,
  `standard_qty` double(12,5) NOT NULL,
  PRIMARY KEY (`pd_no`,`farm_id`,`region_id`,`is_old`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PESTS_DISEASES_RECORD`
--

LOCK TABLES `PESTS_DISEASES_RECORD` WRITE;
/*!40000 ALTER TABLE `PESTS_DISEASES_RECORD` DISABLE KEYS */;
/*!40000 ALTER TABLE `PESTS_DISEASES_RECORD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PESTS_DISEASES_UPLOD`
--

DROP TABLE IF EXISTS `PESTS_DISEASES_UPLOD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PESTS_DISEASES_UPLOD` (
  `pdu_no` int(11) NOT NULL AUTO_INCREMENT,
  `farm_id` varchar(5) COLLATE utf8_bin NOT NULL,
  `up_date` date NOT NULL,
  `up_file` varchar(200) COLLATE utf8_bin NOT NULL,
  `memo` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `is_old` int(11) NOT NULL,
  PRIMARY KEY (`pdu_no`,`farm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PESTS_DISEASES_UPLOD`
--

LOCK TABLES `PESTS_DISEASES_UPLOD` WRITE;
/*!40000 ALTER TABLE `PESTS_DISEASES_UPLOD` DISABLE KEYS */;
/*!40000 ALTER TABLE `PESTS_DISEASES_UPLOD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POST_HARVEST_RECORD`
--

DROP TABLE IF EXISTS `POST_HARVEST_RECORD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `POST_HARVEST_RECORD` (
  `record_id` int(11) NOT NULL,
  `farm_id` varchar(5) COLLATE utf8_bin NOT NULL,
  `region_id` int(11) NOT NULL,
  `gacp_no` varchar(20) COLLATE utf8_bin NOT NULL,
  `word_date` date NOT NULL,
  `word_memo` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `harvest_no` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `grading_code` int(11) DEFAULT NULL,
  `grading_qty` decimal(10,2) DEFAULT NULL,
  `storage_code` int(11) DEFAULT NULL,
  `storage_qty` decimal(10,2) DEFAULT NULL,
  `memo` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `reg_user_id` int(11) DEFAULT NULL,
  `is_old` int(11) NOT NULL,
  PRIMARY KEY (`record_id`,`farm_id`,`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POST_HARVEST_RECORD`
--

LOCK TABLES `POST_HARVEST_RECORD` WRITE;
/*!40000 ALTER TABLE `POST_HARVEST_RECORD` DISABLE KEYS */;
/*!40000 ALTER TABLE `POST_HARVEST_RECORD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PREVENTION_INFO`
--

DROP TABLE IF EXISTS `PREVENTION_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PREVENTION_INFO` (
  `material_code` int(11) NOT NULL AUTO_INCREMENT,
  `material_no` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`material_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PREVENTION_INFO`
--

LOCK TABLES `PREVENTION_INFO` WRITE;
/*!40000 ALTER TABLE `PREVENTION_INFO` DISABLE KEYS */;
/*!40000 ALTER TABLE `PREVENTION_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PREVE_PURCH_RECORD`
--

DROP TABLE IF EXISTS `PREVE_PURCH_RECORD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PREVE_PURCH_RECORD` (
  `record_id` int(10) NOT NULL AUTO_INCREMENT,
  `farm_id` varchar(5) COLLATE utf8_bin NOT NULL,
  `region_id` int(10) NOT NULL,
  `purch_date` date NOT NULL,
  `label` varchar(100) COLLATE utf8_bin NOT NULL,
  `price` double(10,2) NOT NULL,
  `qty` double(10,2) NOT NULL,
  `subtotal` double(12,2) DEFAULT NULL,
  `memo` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `sup_id` int(5) DEFAULT NULL,
  `is_old` int(11) NOT NULL DEFAULT '0',
  `up_file` varchar(200) COLLATE utf8_bin NOT NULL,
  `qty_unit` int(11) NOT NULL,
  `lot_number` varchar(30) COLLATE utf8_bin NOT NULL,
  `material_code` int(11) NOT NULL,
  PRIMARY KEY (`record_id`,`farm_id`,`region_id`,`is_old`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PREVE_PURCH_RECORD`
--

LOCK TABLES `PREVE_PURCH_RECORD` WRITE;
/*!40000 ALTER TABLE `PREVE_PURCH_RECORD` DISABLE KEYS */;
/*!40000 ALTER TABLE `PREVE_PURCH_RECORD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROVINCE`
--

DROP TABLE IF EXISTS `PROVINCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROVINCE` (
  `province_id` int(10) NOT NULL AUTO_INCREMENT,
  `province_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `province_ne_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `province_abbr` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `province_group_no` int(10) NOT NULL,
  `province_postal_code` int(10) NOT NULL,
  PRIMARY KEY (`province_id`,`province_postal_code`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROVINCE`
--

LOCK TABLES `PROVINCE` WRITE;
/*!40000 ALTER TABLE `PROVINCE` DISABLE KEYS */;
INSERT INTO `PROVINCE` VALUES (0,'台灣','Taiwan','TW',0,0),(1,'内蒙古','Inner Mongoria IM','NM',1,1),(2,'内蒙古','Inner Mongoria','NM',1,2),(3,'山西','Shanxi','SX',2,3),(4,'山西','Shanxi ','SX',2,4),(5,'河北','Hebei ','HE',3,5),(6,'河北','Hebei ','HE',3,6),(7,'河北','Hebei ','HE',3,7),(8,'北京','Beijing ','BJ',4,10),(9,'辽宁','Liaoning','LN',5,11),(10,'辽宁','Liaoning','LN',5,12),(11,'吉林','Jilin ','JL',6,13),(12,'黑龙江','Heilongjiang ','HL',7,15),(13,'黑龙江','Heilongjiang ','HL',7,16),(14,'上海','Shanghai ','SH',8,20),(15,'江苏','Jiangsu ','JS',9,21),(16,'江苏','Jiangsu ','JS',9,22),(17,'安徽','Anhui ','AH',10,23),(18,'安徽','Anhui ','AH',10,24),(19,'山东','Shandong ','SD',11,25),(20,'山东','Shandong ','SD',11,26),(21,'山东','Shandong ','SD',11,27),(22,'天津','Tianjing','TJ',12,30),(23,'浙江','Zhejiang','ZJ',13,31),(24,'浙江','Zhejiang','ZJ',13,32),(25,'江西','Jiangxi ','JX',14,33),(26,'江西','Jiangxi ','JX',14,34),(27,'福建','Fujian ','FJ',15,35),(28,'福建','Fujian ','FJ',15,36),(29,'重庆','Chongqing','CQ',16,40),(30,'湖南','Hunan ','HN',17,41),(31,'湖南','Hunan ','HN',17,42),(32,'湖北','Hubei ','HB',18,43),(33,'湖北','Hubei ','HB',18,44),(34,'河南','Henan ','HA',19,45),(35,'河南','Henan ','HA',19,46),(36,'河南','Henan ','HA',19,47),(37,'广东','Guangdong ','GD',20,51),(38,'广东','Guangdong ','GD',20,52),(39,'广西','Guangxi ','GX',21,53),(40,'广西','Guangxi ','GX',21,54),(41,'贵州','Guizhou ','GZ',22,55),(42,'贵州','Guizhou ','GZ',22,56),(43,'海南','Hainan ','HI',23,57),(44,'四川','Sichuan','SC',24,61),(45,'四川','Sichuan','SC',24,62),(46,'四川','Sichuan','SC',24,63),(47,'四川','Sichuan','SC',24,64),(48,'云南','Yunnan ','YN',25,65),(49,'云南','Yunnan ','YN',25,66),(50,'云南','Yunnan ','YN',25,67),(51,'陕西','Shaanxi','SN',26,71),(52,'陕西','Shaanxi','SN',26,72),(53,'甘肃','Gansu ','GS',27,73),(54,'甘肃','Gansu ','GS',27,74),(55,'宁夏','Ningxia ','NX',28,75),(56,'青海','Qinghai ','QH',29,81),(57,'新疆','Xinjiang ','XJ',30,83),(58,'新疆','Xinjiang ','XJ',30,84),(59,'西藏','Tibet','XZ',31,85),(60,'西藏','Tibet','XZ',31,86);
/*!40000 ALTER TABLE `PROVINCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROV_LICE_INFO`
--

DROP TABLE IF EXISTS `PROV_LICE_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROV_LICE_INFO` (
  `proc_lice_id` int(5) NOT NULL AUTO_INCREMENT,
  `province_id` int(10) NOT NULL,
  `proc_lice_neme` varchar(30) COLLATE utf8_bin NOT NULL,
  `proc_lice_addr` varchar(100) COLLATE utf8_bin NOT NULL,
  `tel_no` varchar(15) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`proc_lice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROV_LICE_INFO`
--

LOCK TABLES `PROV_LICE_INFO` WRITE;
/*!40000 ALTER TABLE `PROV_LICE_INFO` DISABLE KEYS */;
/*!40000 ALTER TABLE `PROV_LICE_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REGION`
--

DROP TABLE IF EXISTS `REGION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REGION` (
  `region_id` int(10) NOT NULL AUTO_INCREMENT,
  `region_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `region_en_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `region_abbr` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REGION`
--

LOCK TABLES `REGION` WRITE;
/*!40000 ALTER TABLE `REGION` DISABLE KEYS */;
INSERT INTO `REGION` VALUES (1,'华北','North China','NULL'),(2,'华中','Central China','NULL'),(3,'华东','East China','NULL'),(4,'华南','Southern China','NULL'),(5,'东北','Northeastern China','NULL'),(6,'西北','Northwest China','NULL'),(7,'西南','Southwest China','NULL');
/*!40000 ALTER TABLE `REGION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SALES_INFO`
--

DROP TABLE IF EXISTS `SALES_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SALES_INFO` (
  `sales_sup_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_bin NOT NULL,
  `tel_no` varchar(15) COLLATE utf8_bin NOT NULL,
  `farm_addr` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `wechat_id` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `memo` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `is_old` int(11) NOT NULL DEFAULT '0',
  `update_farm_id` int(11) NOT NULL,
  PRIMARY KEY (`sales_sup_id`,`is_old`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SALES_INFO`
--

LOCK TABLES `SALES_INFO` WRITE;
/*!40000 ALTER TABLE `SALES_INFO` DISABLE KEYS */;
/*!40000 ALTER TABLE `SALES_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEED_REGIS_FORM`
--

DROP TABLE IF EXISTS `SEED_REGIS_FORM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEED_REGIS_FORM` (
  `regis_id` int(11) NOT NULL AUTO_INCREMENT,
  `farm_id` varchar(5) COLLATE utf8_bin NOT NULL,
  `region_id` int(10) NOT NULL,
  `gacp_no` varchar(20) COLLATE utf8_bin NOT NULL,
  `cultivar_code` int(11) NOT NULL,
  `seed_qty` double(10,1) NOT NULL,
  `purch_date` date DEFAULT NULL,
  `item_no` int(11) NOT NULL,
  `reg_user_id` int(11) NOT NULL,
  `is_old` int(11) NOT NULL DEFAULT '0',
  `seed_qty_unit` int(11) NOT NULL,
  `self_reserved` int(11) NOT NULL DEFAULT '0',
  `sup_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`regis_id`,`region_id`,`gacp_no`,`item_no`,`is_old`,`sup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEED_REGIS_FORM`
--

LOCK TABLES `SEED_REGIS_FORM` WRITE;
/*!40000 ALTER TABLE `SEED_REGIS_FORM` DISABLE KEYS */;
/*!40000 ALTER TABLE `SEED_REGIS_FORM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEED_SOURCE_LIST`
--

DROP TABLE IF EXISTS `SEED_SOURCE_LIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEED_SOURCE_LIST` (
  `seed_source_code` int(2) NOT NULL,
  `seed_source_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`seed_source_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEED_SOURCE_LIST`
--

LOCK TABLES `SEED_SOURCE_LIST` WRITE;
/*!40000 ALTER TABLE `SEED_SOURCE_LIST` DISABLE KEYS */;
INSERT INTO `SEED_SOURCE_LIST` VALUES (1,'自行培育'),(2,'購買');
/*!40000 ALTER TABLE `SEED_SOURCE_LIST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHIPPMENT_RECORD`
--

DROP TABLE IF EXISTS `SHIPPMENT_RECORD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHIPPMENT_RECORD` (
  `sr_no` int(11) NOT NULL AUTO_INCREMENT,
  `farm_id` varchar(5) COLLATE utf8_bin NOT NULL,
  `region_id` int(10) NOT NULL,
  `gacp_no` varchar(20) COLLATE utf8_bin NOT NULL,
  `harvest_no` varchar(10) COLLATE utf8_bin NOT NULL,
  `sales_date` date NOT NULL,
  `sales_sup_id` int(10) NOT NULL,
  `shipment_qty` double(10,2) NOT NULL,
  `package_qty` double(10,2) NOT NULL,
  `sales_amount` double(12,2) NOT NULL,
  `stamp_flow_no` varchar(100) COLLATE utf8_bin NOT NULL,
  `item_grading` int(2) NOT NULL,
  `memo` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `reg_user_id` int(11) NOT NULL,
  `is_old` int(11) NOT NULL,
  `shipment_qty_unit` int(11) NOT NULL,
  `shipment_qty_standard` double(12,5) NOT NULL,
  `package_qty_unit` int(11) NOT NULL,
  `package_qty_standard` double(12,5) NOT NULL,
  PRIMARY KEY (`sr_no`,`farm_id`,`region_id`,`is_old`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHIPPMENT_RECORD`
--

LOCK TABLES `SHIPPMENT_RECORD` WRITE;
/*!40000 ALTER TABLE `SHIPPMENT_RECORD` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHIPPMENT_RECORD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SOIL_TYPE_LIST`
--

DROP TABLE IF EXISTS `SOIL_TYPE_LIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SOIL_TYPE_LIST` (
  `soil_type` int(3) NOT NULL,
  `soil_type_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`soil_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SOIL_TYPE_LIST`
--

LOCK TABLES `SOIL_TYPE_LIST` WRITE;
/*!40000 ALTER TABLE `SOIL_TYPE_LIST` DISABLE KEYS */;
INSERT INTO `SOIL_TYPE_LIST` VALUES (1,'淋育土（Alfisol）'),(2,'灰燼土（Andisol）'),(3,'旱境土（Aridisol）'),(4,'新成土（Entisol）'),(5,'有機質土（Histosol）'),(6,'弱育土（Inceptisol）'),(7,'黑沃土（Mollisol）'),(8,'氧化土（Oxisol）'),(9,'淋澱土（Spodosol]）'),(10,'極育土（Ultisol）'),(11,'膨轉土（Vertisol）'),(12,'其他');
/*!40000 ALTER TABLE `SOIL_TYPE_LIST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STORAGE_CODE_LIST`
--

DROP TABLE IF EXISTS `STORAGE_CODE_LIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STORAGE_CODE_LIST` (
  `storage_code` int(2) NOT NULL,
  `storage_code_name` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`storage_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STORAGE_CODE_LIST`
--

LOCK TABLES `STORAGE_CODE_LIST` WRITE;
/*!40000 ALTER TABLE `STORAGE_CODE_LIST` DISABLE KEYS */;
INSERT INTO `STORAGE_CODE_LIST` VALUES (1,'冷凍'),(2,'冷藏'),(3,'乾燥'),(4,'醃漬'),(5,'發酵'),(6,'高溫殺菌'),(7,'添加防腐劑'),(98,'其他'),(99,'總產出(加工處理後總重量)');
/*!40000 ALTER TABLE `STORAGE_CODE_LIST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SUPPLIER`
--

DROP TABLE IF EXISTS `SUPPLIER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SUPPLIER` (
  `sup_id` int(5) NOT NULL AUTO_INCREMENT,
  `sup_name` varchar(20) COLLATE utf8_bin NOT NULL,
  `busi_id` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `type_code` int(2) DEFAULT NULL,
  `user_name` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `tel_no` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `sup_addr` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `wechat_id` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `memo` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `update_user` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`sup_id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SUPPLIER`
--

LOCK TABLES `SUPPLIER` WRITE;
/*!40000 ALTER TABLE `SUPPLIER` DISABLE KEYS */;
INSERT INTO `SUPPLIER` VALUES (0,'自培育種',NULL,8,NULL,'none',NULL,NULL,NULL,NULL,'admin'),(1,'使用者新增種苗',NULL,8,'none',NULL,NULL,NULL,NULL,NULL,'admin'),(3,'福壽實業股份有限公司',NULL,2,'','047810159','臺中市沙鹿區沙田路45號','yrwang@fwusow.com.tw','','','admin'),(4,'百泰生物科技股份有限公司',NULL,3,'','037586333','苗栗縣竹南鎮竹南科學園區科東三路 6 號 5 樓 【苗栗縣竹南鎮科東三路 2 號 5 樓(竹南科學園區)】','dila@biontech.com.tw','','','admin'),(5,'保證責任嘉義縣東石合作農場',NULL,2,'','053799951','嘉義縣東石鄉蔦松村40-34號','ts.cf@msa.hinet.net','','','admin'),(6,'有限責任花蓮縣花東有機農產加工生產合作社',NULL,2,'','038880181','花蓮縣玉里鎮東豐里棣芬71-3號','1217judy@pchome.com.tw','','','admin'),(7,'台灣糖業股份有限公司新營副產加工廠',NULL,2,'','066220095','台南市柳營區人和里義士路5段690號','a62971@taisugar.com.tw','','','admin'),(8,'屏東縣南州地區農會',NULL,2,'','088643640','屏東縣南州鄉壽元村大同路153巷600號','t8641397@ms42.hinet.net','','','admin'),(9,'力漢企業股份有限公司',NULL,2,'','076952511','高雄市路竹區環球路15號','contact@lihan.com.tw','','','admin'),(10,'欣農發實業股份有限公司',NULL,2,'','0492631234','南投縣竹山鎮延正里江西路38-2號','slf.com@msa.hinet.net','','','admin'),(11,'三傑飼料股份有限公司',NULL,2,'','076965141','高雄市路竹區鴨寮里復興路282號','lsam282@yahoo.com.tw','','','admin'),(12,'綠林生物科技股份有限公司',NULL,2,'','047812558','臺中市北屯區昌平東三路58號2樓','b020271ying@yahoo.com.tw','','','admin'),(13,'長岡化工股份有限公司',NULL,2,'','052373767','嘉義市北港路746巷9號','chang.kung99@msa.hinet.net','','','admin'),(14,'益農農業社',NULL,2,'','0910044989','桃園縣新屋鄉東明村7鄰16之1號1樓','','','','admin'),(15,'嶺先興業股份有限公司',NULL,2,'','066863036','台南市東山區東原里68之2號','abc6861666@yahoo.com.tw','','','admin'),(16,'方圓生化科技有限公司',NULL,2,'','048946957','彰化縣大城鄉南平路3-2號','Leoone99@gmail.com','','','admin'),(17,'臺益工業股份有限公司',NULL,2,'','034830878','桃園市觀音區保障里9鄰68之1號','tai.yeh@msa.hinet.net','','','admin'),(18,'三木實業有限公司',NULL,2,'','048953118','彰化縣二林鎮南光里安和街20號','sanmu2007@gmail.com','','','admin'),(19,'金農友企業股份有限公司',NULL,2,'','048983111','彰化縣芳苑鄉斗苑路頂後段600號','n12270501@yahoo.com.tw','','','admin'),(20,'翔鹿股份有限公司',NULL,2,'','065858107','台南市善化區光文里建業路56號','cmj@s1u.com.tw','','','admin'),(21,'大益農業科技股份有限公司',NULL,2,'','087626263','台北市松山區南京東路4段164號9樓之6','info@dahant.com','','','admin'),(22,'新德記肥料廠',NULL,2,'','039657536','宜蘭縣五結鄉鎮安村西河路一路128巷92號','marklee10705@gmail.com','','','admin'),(23,'弘裕農產加工廠',NULL,2,'','057884558','雲林縣元長鄉子茂村150號','getuo150@yahoo.com.tw','','','admin'),(24,'順豐有機肥料有限公司',NULL,2,'','034861576','桃園市新屋區永興里8鄰東興路2段1448號1樓','csf@csfong.com','','','admin'),(25,'國峰生物科技股份有限公司',NULL,2,'','076972259','高雄市路竹區大仁路520巷7-1號','Homeway3849@gmail.com','','','admin'),(26,'普盛生物科技股份有限公司',NULL,2,'','0426380869','台中市梧棲區草湳里臨港路三段168巷149弄26號','a26380869@hotmail.com','','','admin'),(27,'台灣肥料股份有限公司苗栗廠',NULL,2,'','037260601','苗栗縣苗栗市福安里26鄰福星210號','bdwang@taifer.com.tw','','','admin'),(28,'良農現代化農業科技股份有限公司',NULL,2,'','052381832','嘉義縣太保市過溝里中興路9號','kidshsu@greenchem.com.tw','','','admin'),(29,'陽田生物科技股份有限公司',NULL,2,'','052213338','嘉義縣民雄鄉頭橋工業區工業三路9-2號','es410371@gmail.com','','','admin'),(30,'中華蛋白股份有限公司',NULL,2,'','037351158','苗栗縣苗栗市新川里3鄰龍岡8-1號','chunghwaprotein@gmail.com','','','admin'),(31,'保證責任彰化縣王功農漁牧生產合作社',NULL,2,'','048932156','彰化縣芳苑鄉王功村漁港三路43號','Wkc.jf@msa.hinet.net','','','admin'),(32,'豫豐實業有限公司',NULL,2,'','076165088','高雄市燕巢區深水里湖內巷5-16號','Y2749.y6068@msa.hinet.net','','','admin'),(33,'田酪股份有限公司',NULL,2,'','048754559','彰化縣田中鎮北路里中山街407巷5號','fs881018@gmail.com','','','admin'),(34,'長虹堆肥場',NULL,2,'','0928396233','屏東縣屏東市華山里莊敬街1段231巷9號','sjdjd@ms21.hinet.net','','','admin'),(35,'優健萌葳生物醫藥有限公司',NULL,2,'','0988201987','臺北市中山區北安路578巷8弄11號','formosa.beauty@msa.hinet.net','','','admin'),(36,'保證責任雲林縣油車合作農場',NULL,2,'','055518899','雲林縣莿桐鄉六合村新興路10-19號','Tsztung.youche@msa.hinet.net','','','admin'),(37,'金峰生物科技有限公司',NULL,2,'','087733057','屏東縣里港鄉中和村南進路10之6號','wfc7733@gmail.com','','','admin'),(38,'崇容實業',NULL,2,'','067830856','臺南市鹽水區坔頭港里坔頭港200之100號','rong0856@gmail.com','','','admin'),(39,'台灣阿米諾酸股份有限公司',NULL,2,'','052371933','嘉義縣太保市嘉太工業區中興路17號','taiwanamino@gmail.com','','','admin'),(40,'田園生物科技有限公司',NULL,2,'','052792900','嘉義縣竹崎鄉灣橋村灣橋387巷17號','es410371@gmail.com','','','admin'),(41,'玖育生化科技有限公司',NULL,2,'','0422138683','臺中市東區東門里旱溪西路一段246號2樓','d.y.c.2519@gmail.com','','','admin'),(42,'創裕有機有限公司',NULL,2,'','048932721','彰化縣芳苑鄉民生村建成路180巷29號','ejcc0504@gmail.com','','','admin'),(43,'長興生物科技股份有限公司',NULL,2,'','052372667','嘉義縣中埔鄉隆興村湖仔厝21-2號1樓','chang.kung99@msa.hinet.net','','','admin'),(44,'蒂興企業廠',NULL,2,'','0426832632','台中市外埔區月眉西路500巷1號','bw5788@gmail.com','','','admin'),(45,'添進肥料工廠有限公司',NULL,2,'','057721015','雲林縣四湖鄉林厝村文化路20巷57號','q7871058@yahoo.com.tw','','','admin'),(46,'輝藥農業科技股份有限公司',NULL,2,'','0287515379','臺北市內湖區洲子街81號2樓','radiance9315@gmail.com','','','admin'),(47,'沅渼生物科技股份有限公司',NULL,2,'','0425330077','臺中市豐原區三和路398-1號','YM@yuan-mei.com.tw','','','admin'),(48,'富祥肥料股份有限公司',NULL,2,'','067835121','臺南市學甲區新達里山寮1-1號','Ch48@ms54.hinet.ent','','','admin'),(49,'金大堆肥共同處理場',NULL,2,'','048683930','彰化縣芳苑鄉文津村芳草路16號','chinta@chinta.tw','','','admin'),(50,'漢寶農畜產企業股份有限公司',NULL,2,'','0423376408','台中市烏日區中山路三段102號2樓','zobo2510@gmail.com','','','admin'),(51,'龍燈生物科技股份有限公司',NULL,3,'','0225552169','台北市大同區承德路2段81號3樓 【台南市永康區龍埔街566號】','smwang@rotam.com','','','admin'),(52,'光華化學股份有限公司',NULL,3,'','035762131','新竹市南隘里南湖路三號 【新竹市南隘里南湖路三號】','joanna@agridoctor.com.tw','','','admin'),(53,'潤麒實業有限公司',NULL,3,'','077195558','高雄市鳳山區光遠路81號 【嘉義縣鹿草鄉光潭村240之1號】','ss2200@ms31.hinet.net','','','admin'),(54,'東精生物科技有限公司',NULL,3,'','0425282668','臺中市豐原區豐原大道二段217巷27號 【臺中市豐原區豐年路109巷106弄20號】','service@dongjing.url.tw','','','admin'),(55,'聯發生物科技股份有限公司',NULL,3,'','087627111','屏東縣長治鄉農環路9號 【屏東縣長治鄉農環路9號】','wilsonwei@agbt.com.tw','','','admin'),(56,'玉田地有限公司',NULL,3,'','037466129','苗栗縣頭份市公園七街25號1樓 【立農化學股份有限公司：雲林縣莿桐鄉埔子村榮村 48-1號】','pcc.ag168@msa.hinet.net','','','admin'),(57,'誼華實業有限公司',NULL,3,'','075545957','高雄市鼓山區中華一路336號11樓之1【 高雄市鼓山區中華一路336號11樓之 1】','sales@gihhwa.com','','','admin'),(58,'興農股份有限公司',NULL,3,'','0426933841','臺中市大肚區中和里南榮路101號 【臺中市大肚區中和里南榮路101號】','sinhuang@sinon.com.tw','','','admin'),(59,'保證責任雲林縣詔安聯合社區合作農場',NULL,3,'','055872116','雲林縣西螺鎮安定里安定172-1號 【雲林縣西螺鎮安定里安定172-1號】','handson.person@msa.hinet.net','','','admin'),(60,'亞太清鈴股份有限公司',NULL,4,'','0223631001','台北市大安區溫州街74巷2弄8號1樓','j.s.yu@hb-101.com.tw','','','admin'),(61,'奕翰行',NULL,2,'','055890248','雲林縣林內鄉林中村長安路26號1樓','ahe.linna@yahoo.com.tw','','','admin'),(62,'農友牌種苗有限公司',NULL,9,'','076519668','高雄市大樹區竹寮里竹寮路114-6號','vege@knownyou.com','','','admin'),(63,'台灣拜耳股份有限公司',NULL,3,'','0281011000','台北市信義區信義路五段7號54F','drugsafety.taiwan@bayer.com','','','admin'),(64,'嘉泰企業股份有限公司',NULL,3,'','034501297','桃園市平鎮區金陵路七段457號',NULL,'','','admin'),(65,'聯利農業科技股份有限公司',NULL,3,'','087229588','90843屏東縣長治鄉香楊村香楊路79號',NULL,'','','admin'),(66,'台灣日產化工股份有限公司',NULL,3,'','27217371','彰化縣伸港鄉蚵寮村線工北一路15號',NULL,'','','admin'),(67,'日農科技股份有限公司',NULL,3,'','067832157','臺南市學甲區德安寮3之28號',NULL,'','','admin'),(68,'華夏科學農化股份有限公司',NULL,3,'','055842388','雲林縣莿桐鄉甘西村中村12號',NULL,'','','admin'),(69,'臺聯實業股份有限公司',NULL,3,'','066530216','73054台南市新營區忠孝路64號',NULL,'','','admin'),(70,'洽益化學股份有限公司',NULL,3,'','067942876','台南市將軍區長榮里165號',NULL,'','','admin'),(71,'東和化學企業股份有限公司',NULL,3,'','047910280','彰化縣伸港鄉蚵寮村線工北一路11號',NULL,'','','admin'),(72,'大勝化學工業股份有限公司',NULL,3,'','055842450','雲林縣莿桐鄉莿桐村農校路3號',NULL,'','','admin'),(73,'嘉濱貿易有限公司',NULL,3,'','063129288','臺南巿永康區中華路1-89號',NULL,'','','admin'),(74,'國豐化學工業股份有限公司',NULL,3,'','034788006','桃園市楊梅區永寧里老莊路2號',NULL,'','','admin'),(75,'臺灣庵原農藥股份有限公司',NULL,3,'','0225818156','雲林縣虎尾鎮頂溪里過溪111號',NULL,'','','admin'),(76,'世大農化工廠股份有限公司	',NULL,3,'','033875570','桃園市大溪區信義路1332號',NULL,'','','admin'),(77,'瑞芳植物保護股份有限公司',NULL,3,'','052267112','嘉義縣民雄鄉菁埔村1-6號',NULL,'','','admin'),(78,'利台化學工業股份有限公司',NULL,3,'','047523105','彰化市彰鹿路154號',NULL,'','','admin'),(79,'嘉農企業股份有限公司',NULL,3,'','035762122','新竹市南隘里南湖路1號',NULL,'','','admin'),(80,'好速化學股份有限公司',NULL,3,'','035762115','新竹市南隘里南湖路7號',NULL,'','','admin'),(81,'台農三和化工股份有限公司',NULL,3,'','047910406','彰化縣線西鄉頂庄村線工北三路22號',NULL,'','','admin'),(82,'安旺特股份有限公司',NULL,3,'','047910358','彰化縣線西鄉頂庄村16鄰線工北三路20號',NULL,'','','admin'),(83,'惠光股份有限公司',NULL,3,'','065702181','台南市麻豆區苓子林17-10號',NULL,'','','admin'),(84,'億豐農化廠股份有限公司',NULL,3,'','0422778755','41148台中市太平區光隆里光興路597巷60號',NULL,'','','admin'),(85,'台灣巴斯夫股份有限公司',NULL,3,'','0225068131','臺北巿松江路八十七號（帝國大廈）十六樓',NULL,'','','admin'),(86,'眾益農業生技股份有限公司',NULL,3,'','034221078','桃園市中壢區五權里中正路1043號',NULL,'','','admin'),(87,'萬得發有限公司',NULL,3,'','0425621106','428台中市大雅區中清路4段821號',NULL,'','','admin'),(88,'雅飛有限公司',NULL,3,'','0287125800','臺北巿敦化北路207號5樓之二',NULL,'','','admin'),(89,'大成化學工業股份有限公司',NULL,3,'','0426832837','43858台中市外埔區三崁里二崁一路266巷28號',NULL,'','','admin'),(90,'台灣正豐植保股份有限公司',NULL,3,'','053795185','嘉義縣東石鄉洲仔村洲仔123-3號',NULL,'','','admin'),(91,'華隆化學股份有限公司',NULL,3,'','0227522198','台中市清水區中山路498之3號',NULL,'','','admin'),(92,'正農化學股份有限公司',NULL,3,'','0227731661','彰化縣伸港鄉蚵寮村線工北一路十三號',NULL,'','','admin'),(93,'中華民國農會附設各級農會農化廠',NULL,3,'','055842101','雲林縣莿桐鄉甘西村中村1號',NULL,'','','admin'),(94,'富農化學工業股份有限公司',NULL,3,'','034834492','桃園市觀音區保障里9鄰草漯51之10號',NULL,'','','admin'),(95,'台灣科研生物技術有限公司',NULL,3,'','0423932121','台中市北屯區文心路三段1027號9樓',NULL,'','','admin'),(96,'鴻鋒化學有限公司',NULL,3,'','0226321115','台北市信義區基隆路一段143號5樓之8',NULL,'','','admin'),(97,'法台貿易有限公司',NULL,3,'','0426832598','台中市臺灣大道三段306巷39弄9號',NULL,'','','admin'),(98,'雋農實業股份有限公司',NULL,3,'','0422994577','台中市西屯區華美西街二段491號',NULL,'','','admin'),(99,'松樹國際有限公司',NULL,3,'','0285227922','新北市新莊區思源路175號8樓',NULL,'','','admin'),(100,'易利特開發有限公司',NULL,3,'','0227789349','臺北巿復興南路一段五十七號三樓',NULL,'','','admin'),(101,'生力化學工業股份有限公司',NULL,3,'','0225113151','臺北巿長春路六五號七樓',NULL,'','','admin'),(102,'台灣富美實有限公司',NULL,3,'','0422542785','臺中市西屯區府會園道179號3樓',NULL,'','','admin'),(103,'耕得貿易股份有限公司',NULL,3,'','0227212886','台北巿松山區長安東路二段二一五號十樓之六',NULL,'','','admin'),(104,'威玖生技有限公司',NULL,3,'','0422337457','台中市北區錦祥街43之3號',NULL,'','','admin'),(105,'立農化學股份有限公司',NULL,3,'','055842106','雲林縣莿桐鄉埔子村榮村48-1號',NULL,'','','admin'),(106,'台灣先正達股份有限公司',NULL,3,'','0225592901','臺北市松山區敦化南路一段二號十一樓',NULL,'','','admin'),(107,'台灣瑪斯德股份有限公司',NULL,3,'','0422206969','台中市西區忠勤街三四一號三樓',NULL,'','','admin'),(108,'海博生技股份有限公司',NULL,3,'','0424727053','台中巿南屯區東興路一段551號3樓',NULL,'','','admin'),(109,'青山貿易有限公司',NULL,3,'','0225239899','臺北巿中山北路一段 85 號 9 樓',NULL,'','','admin'),(110,'美商雅柏生活科技有限公司臺灣分公司',NULL,3,'','034024880','桃園市中壢區正大街52號3樓',NULL,'','','admin'),(111,'春匯有限公司',NULL,3,'','035762131','新竹市香山區南隘里南湖路3號',NULL,'','','admin'),(112,'聯合農化股份有限公司',NULL,3,'','0422932121','台中市北屯區文心路三段1027號9樓',NULL,'','','admin'),(113,'優必樂有限公司',NULL,3,'','0422932121','台中市北屯區水湳里文心路三段1027號9樓',NULL,'','','admin'),(114,'台灣龍燈股份有限公司',NULL,3,'','0225552169','台北市承德路二段81號3樓',NULL,'','','admin'),(115,'國寶國際有限公司',NULL,3,'','034315920','桃園市中壢區五權里正大街52號3樓',NULL,'','','admin'),(116,'東鋒股份有限公司',NULL,3,'','0227731661','臺北巿復興北路一號一一樓之四',NULL,'','','admin'),(117,'高事達農化有限公司',NULL,3,'','0225319311','台北市中山北路二段四十六號四樓之二',NULL,'','','admin'),(118,'安農股份有限公司',NULL,3,'','0222999570','新北市新莊區五權二路26號之2',NULL,'','','admin'),(119,'惠大實業股份有限公司',NULL,3,'','0422781005','台中市太平區永豐路398巷8號',NULL,'','','admin'),(120,'景茂貿易有限公司',NULL,3,'','062207263','臺南巿北區成功路2號6樓13室',NULL,'','','admin'),(121,'蒙狄生股份有限公司',NULL,3,'','0225817261','台北市南京西路1-1號7樓',NULL,'','','admin'),(122,'台灣住友化學股份有限公司',NULL,3,'','0225064528','臺北巿南京東路二段二０六號一三樓之四',NULL,'','','admin'),(123,'台灣杜邦農業科學股份有限公司',NULL,3,'','034793103','桃園市龍潭區三和里楊銅路2段801號',NULL,'','','admin'),(124,'瑞福企業有限公司',NULL,3,'','0225252781','台北市中山北路一段 85 號 9 樓',NULL,'','','admin'),(125,'貝士得開發企業有限公司',NULL,3,'','0223947096','台北市忠孝東路一段八五號十三樓之五',NULL,'','','admin'),(126,'威群國際有限公司',NULL,3,'','0227979218','臺北市內湖路一段91巷35弄64號3樓',NULL,'','','admin'),(127,'翰金興業有限公司',NULL,3,'','0228839161','台北巿承德路四段二四四號六樓',NULL,'','','admin'),(128,'合林企業有限公司',NULL,3,'','0226007191','臺北巿南昌路二段178-2號3樓',NULL,'','','admin'),(129,'保加利亞商艾格立亞股份有限公司台灣分公司',NULL,3,'','052355704','嘉義縣水上鄉中庄村中庄15號',NULL,'','','admin'),(130,'瑞繐股份有限公司',NULL,3,'','0225613124','臺北巿南京東路二段九七號十樓',NULL,'','','admin'),(131,'台灣嘉潔股份有限公司',NULL,3,'','055876967','雲林縣西螺鎮正興里光復西路一一四號',NULL,'','','admin'),(132,'久農貿易有限公司',NULL,3,'','0225147370','台北市復興北路三一一號十一樓',NULL,'','','admin'),(133,'朝暘生化開發有限公司',NULL,3,'','063129288','台中市西屯區河南路一段170號2F-4',NULL,'','','admin'),(134,'台灣石原產業股份有限公司',NULL,3,'','0225045387','臺北巿松江路八七號十一樓之一',NULL,'','','admin'),(135,'民信有限公司',NULL,3,'','048811618','彰化縣溪湖鎮湖東里英山街63號',NULL,'','','admin'),(136,'台灣道禮股份有限公司',NULL,3,'','0227758452','臺北巿松山區敦化北路167號14樓',NULL,'','','admin'),(137,'德方有限公司',NULL,3,'','0226007191','台北巿南昌路2段178-2號3樓',NULL,'','','admin'),(138,'益欣股份有限公司',NULL,3,'','062667217','臺南巿仁德區保安里開發六路16號2樓',NULL,'','','admin'),(139,'現達國際生物科技有限公司',NULL,3,'','0229862187','台北市大安區忠孝東路4段295號3樓',NULL,'','','admin'),(140,'日佳農葯股份有限公司',NULL,3,'','0225558709','臺北巿南京西路二二號九樓之二',NULL,'','','admin'),(141,'名方有限公司',NULL,3,'','0227199430','臺北市萬華區昆明街269號1樓',NULL,'','','admin'),(142,'皇國貿易有限公司',NULL,3,'','042918336','台中巿大雅路四七三之四號',NULL,'','','admin'),(143,'儂泰貿易有限公司',NULL,3,'','0422232679','臺中巿北區原子街二二之三號一樓',NULL,'','','admin'),(144,'全臺農藥有限公司',NULL,3,'','0225147370','臺北巿復興北路311號11樓',NULL,'','','admin'),(145,'恒欣股份有限公司',NULL,3,'','062377101','臺南巿仁德區保安里開發六路16號一樓',NULL,'','','admin'),(146,'瑞泓生技有限公司',NULL,3,'','052268385','嘉義市西區磚?里大統路173號2樓',NULL,'','','admin'),(147,'達通國際興業有限公司',NULL,3,'','0227979218','114台北市內湖路一段91巷35弄64號3樓',NULL,'','','admin'),(148,'啟承有限公司',NULL,3,'','0227789080','臺北市文山區興隆路二段220巷31弄52號2樓',NULL,'','','admin'),(149,'功力化學工業股份有限公司',NULL,3,'','0422702121','台中市太平區新平路1段196號',NULL,'','','admin'),(150,'台灣住友商事股份有限公司',NULL,3,'','0227158982','臺北巿敦化北路二六０號八樓',NULL,'','','admin'),(151,'維丰國際股份有限公司',NULL,3,'','0226687682','新北市永和區保平路111巷2弄1號4樓',NULL,'','','admin'),(152,'品全農業有限公司',NULL,3,'','0492358441','南投縣南投市營北里營北路98巷1號',NULL,'','','admin'),(153,'台石股份有限公司',NULL,3,'','0225637186','臺北巿松江路四二號六樓',NULL,'','','admin'),(154,'台灣沙爾達有限公司',NULL,3,'','0422337457','臺北市松山區敦化北路170號3樓',NULL,'','','admin'),(155,'台灣肥料股份有限公司',NULL,2,'','0225422231','10457 台北市中山區南京東路二段88號6樓',NULL,'','','admin');
/*!40000 ALTER TABLE `SUPPLIER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SUPPLIER_TYPE_LIST`
--

DROP TABLE IF EXISTS `SUPPLIER_TYPE_LIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SUPPLIER_TYPE_LIST` (
  `type_code` int(2) NOT NULL,
  `type_name` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SUPPLIER_TYPE_LIST`
--

LOCK TABLES `SUPPLIER_TYPE_LIST` WRITE;
/*!40000 ALTER TABLE `SUPPLIER_TYPE_LIST` DISABLE KEYS */;
INSERT INTO `SUPPLIER_TYPE_LIST` VALUES (1,'種苗'),(2,'肥料'),(3,'防治'),(4,'其他'),(5,'倉儲'),(6,'工程發包'),(7,'物流'),(8,'農場'),(9,'使用者新增');
/*!40000 ALTER TABLE `SUPPLIER_TYPE_LIST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atpressure`
--

DROP TABLE IF EXISTS `atpressure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atpressure` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `atpressure_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atpressure`
--

LOCK TABLES `atpressure` WRITE;
/*!40000 ALTER TABLE `atpressure` DISABLE KEYS */;
/*!40000 ALTER TABLE `atpressure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atpressure_daily`
--

DROP TABLE IF EXISTS `atpressure_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atpressure_daily` (
  `atp_date` date NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`atp_date`,`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atpressure_daily`
--

LOCK TABLES `atpressure_daily` WRITE;
/*!40000 ALTER TABLE `atpressure_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `atpressure_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atpressure_hour`
--

DROP TABLE IF EXISTS `atpressure_hour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atpressure_hour` (
  `atp_date` date NOT NULL,
  `atp_hour` time NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`atp_date`,`atp_hour`,`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atpressure_hour`
--

LOCK TABLES `atpressure_hour` WRITE;
/*!40000 ALTER TABLE `atpressure_hour` DISABLE KEYS */;
/*!40000 ALTER TABLE `atpressure_hour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bug1`
--

DROP TABLE IF EXISTS `bug1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bug1` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  UNIQUE KEY `UC_field_time` (`field`,`timestamp`),
  CONSTRAINT `bug1_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bug1`
--

LOCK TABLES `bug1` WRITE;
/*!40000 ALTER TABLE `bug1` DISABLE KEYS */;
/*!40000 ALTER TABLE `bug1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bug1_daily`
--

DROP TABLE IF EXISTS `bug1_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bug1_daily` (
  `bug1_date` date NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`bug1_date`,`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bug1_daily`
--

LOCK TABLES `bug1_daily` WRITE;
/*!40000 ALTER TABLE `bug1_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `bug1_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co2`
--

DROP TABLE IF EXISTS `co2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co2` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  UNIQUE KEY `UC_field_time` (`field`,`timestamp`),
  CONSTRAINT `co2_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co2`
--

LOCK TABLES `co2` WRITE;
/*!40000 ALTER TABLE `co2` DISABLE KEYS */;
/*!40000 ALTER TABLE `co2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co2_daily`
--

DROP TABLE IF EXISTS `co2_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co2_daily` (
  `co2_date` date NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`co2_date`,`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co2_daily`
--

LOCK TABLES `co2_daily` WRITE;
/*!40000 ALTER TABLE `co2_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `co2_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumption`
--

DROP TABLE IF EXISTS `consumption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consumption` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  UNIQUE KEY `UC_field_time` (`field`,`timestamp`),
  CONSTRAINT `consumption_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumption`
--

LOCK TABLES `consumption` WRITE;
/*!40000 ALTER TABLE `consumption` DISABLE KEYS */;
/*!40000 ALTER TABLE `consumption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controller_access`
--

DROP TABLE IF EXISTS `controller_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controller_access` (
  `access_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `controller_id` int(11) NOT NULL,
  PRIMARY KEY (`access_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controller_access`
--

LOCK TABLES `controller_access` WRITE;
/*!40000 ALTER TABLE `controller_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `controller_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controller_list`
--

DROP TABLE IF EXISTS `controller_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controller_list` (
  `controller_id` int(11) NOT NULL AUTO_INCREMENT,
  `controller_name` varchar(45) COLLATE utf8_bin NOT NULL,
  `controller_alias` varchar(45) COLLATE utf8_bin NOT NULL,
  `host_mac` varchar(45) COLLATE utf8_bin NOT NULL,
  `creator_id` int(11) NOT NULL,
  PRIMARY KEY (`controller_id`),
  UNIQUE KEY `controller_name_UNIQUE` (`controller_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controller_list`
--

LOCK TABLES `controller_list` WRITE;
/*!40000 ALTER TABLE `controller_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `controller_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `current1`
--

DROP TABLE IF EXISTS `current1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `current1` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  UNIQUE KEY `UC_field_time` (`field`,`timestamp`),
  CONSTRAINT `current1_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `current1`
--

LOCK TABLES `current1` WRITE;
/*!40000 ALTER TABLE `current1` DISABLE KEYS */;
/*!40000 ALTER TABLE `current1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farm_visible_material`
--

DROP TABLE IF EXISTS `farm_visible_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `farm_visible_material` (
  `item_no` int(11) NOT NULL,
  `farm_id` int(11) NOT NULL,
  `visible` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_no`,`farm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farm_visible_material`
--

LOCK TABLES `farm_visible_material` WRITE;
/*!40000 ALTER TABLE `farm_visible_material` DISABLE KEYS */;
/*!40000 ALTER TABLE `farm_visible_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field`
--

DROP TABLE IF EXISTS `field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `alias` varchar(50) COLLATE utf8_bin NOT NULL,
  `iframe` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `creator_id` int(10) DEFAULT NULL,
  `ipcam` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `other_chk` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field`
--

LOCK TABLES `field` WRITE;
/*!40000 ALTER TABLE `field` DISABLE KEYS */;
/*!40000 ALTER TABLE `field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_sensor`
--

DROP TABLE IF EXISTS `field_sensor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_sensor` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` int(11) NOT NULL,
  `sensor` int(11) NOT NULL,
  `df_name` varchar(50) COLLATE utf8_bin NOT NULL,
  `alias` varchar(50) COLLATE utf8_bin NOT NULL,
  `unit` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `icon` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `bg_color` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UC_field_df_name` (`field`,`df_name`),
  KEY `sensor` (`sensor`),
  CONSTRAINT `field_sensor_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`),
  CONSTRAINT `field_sensor_ibfk_2` FOREIGN KEY (`sensor`) REFERENCES `sensor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_sensor`
--

LOCK TABLES `field_sensor` WRITE;
/*!40000 ALTER TABLE `field_sensor` DISABLE KEYS */;
/*!40000 ALTER TABLE `field_sensor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `humidity`
--

DROP TABLE IF EXISTS `humidity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `humidity` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  UNIQUE KEY `UC_field_time` (`field`,`timestamp`),
  CONSTRAINT `humidity_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `humidity`
--

LOCK TABLES `humidity` WRITE;
/*!40000 ALTER TABLE `humidity` DISABLE KEYS */;
/*!40000 ALTER TABLE `humidity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `humidity_daily`
--

DROP TABLE IF EXISTS `humidity_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `humidity_daily` (
  `hum_date` date NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`hum_date`,`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `humidity_daily`
--

LOCK TABLES `humidity_daily` WRITE;
/*!40000 ALTER TABLE `humidity_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `humidity_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipcam_img`
--

DROP TABLE IF EXISTS `ipcam_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipcam_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `name` varchar(20) NOT NULL,
  `img_path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipcam_img`
--

LOCK TABLES `ipcam_img` WRITE;
/*!40000 ALTER TABLE `ipcam_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipcam_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k`
--

DROP TABLE IF EXISTS `k`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `k` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  UNIQUE KEY `UC_field_time` (`field`,`timestamp`),
  CONSTRAINT `k_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k`
--

LOCK TABLES `k` WRITE;
/*!40000 ALTER TABLE `k` DISABLE KEYS */;
/*!40000 ALTER TABLE `k` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kalium_daily`
--

DROP TABLE IF EXISTS `kalium_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kalium_daily` (
  `kalium_date` date NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`kalium_date`,`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kalium_daily`
--

LOCK TABLES `kalium_daily` WRITE;
/*!40000 ALTER TABLE `kalium_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `kalium_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linebot_data`
--

DROP TABLE IF EXISTS `linebot_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `linebot_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_nickname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `farm_id` int(11) DEFAULT NULL,
  `user_linebot_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `Channel_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `Channel_ID` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `Channel_secret` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `Channel_access_token` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linebot_data`
--

LOCK TABLES `linebot_data` WRITE;
/*!40000 ALTER TABLE `linebot_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `linebot_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lka`
--

DROP TABLE IF EXISTS `lka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lka` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `lka_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lka`
--

LOCK TABLES `lka` WRITE;
/*!40000 ALTER TABLE `lka` DISABLE KEYS */;
/*!40000 ALTER TABLE `lka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `luminance`
--

DROP TABLE IF EXISTS `luminance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `luminance` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  UNIQUE KEY `UC_field_time` (`field`,`timestamp`),
  CONSTRAINT `luminance_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `luminance`
--

LOCK TABLES `luminance` WRITE;
/*!40000 ALTER TABLE `luminance` DISABLE KEYS */;
/*!40000 ALTER TABLE `luminance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `luminance_daily`
--

DROP TABLE IF EXISTS `luminance_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `luminance_daily` (
  `lum_date` date NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`lum_date`,`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `luminance_daily`
--

LOCK TABLES `luminance_daily` WRITE;
/*!40000 ALTER TABLE `luminance_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `luminance_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m101`
--

DROP TABLE IF EXISTS `m101`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m101` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `m101_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m101`
--

LOCK TABLES `m101` WRITE;
/*!40000 ALTER TABLE `m101` DISABLE KEYS */;
/*!40000 ALTER TABLE `m101` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m102`
--

DROP TABLE IF EXISTS `m102`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m102` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `m102_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m102`
--

LOCK TABLES `m102` WRITE;
/*!40000 ALTER TABLE `m102` DISABLE KEYS */;
/*!40000 ALTER TABLE `m102` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m103`
--

DROP TABLE IF EXISTS `m103`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m103` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `m103_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m103`
--

LOCK TABLES `m103` WRITE;
/*!40000 ALTER TABLE `m103` DISABLE KEYS */;
/*!40000 ALTER TABLE `m103` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m104`
--

DROP TABLE IF EXISTS `m104`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m104` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `m104_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m104`
--

LOCK TABLES `m104` WRITE;
/*!40000 ALTER TABLE `m104` DISABLE KEYS */;
/*!40000 ALTER TABLE `m104` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m105`
--

DROP TABLE IF EXISTS `m105`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m105` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `m105_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m105`
--

LOCK TABLES `m105` WRITE;
/*!40000 ALTER TABLE `m105` DISABLE KEYS */;
/*!40000 ALTER TABLE `m105` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m106`
--

DROP TABLE IF EXISTS `m106`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m106` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `m106_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m106`
--

LOCK TABLES `m106` WRITE;
/*!40000 ALTER TABLE `m106` DISABLE KEYS */;
/*!40000 ALTER TABLE `m106` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m107`
--

DROP TABLE IF EXISTS `m107`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m107` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `m107_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m107`
--

LOCK TABLES `m107` WRITE;
/*!40000 ALTER TABLE `m107` DISABLE KEYS */;
/*!40000 ALTER TABLE `m107` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m108`
--

DROP TABLE IF EXISTS `m108`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m108` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `m108_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m108`
--

LOCK TABLES `m108` WRITE;
/*!40000 ALTER TABLE `m108` DISABLE KEYS */;
/*!40000 ALTER TABLE `m108` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m2101`
--

DROP TABLE IF EXISTS `m2101`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m2101` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `m2101_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m2101`
--

LOCK TABLES `m2101` WRITE;
/*!40000 ALTER TABLE `m2101` DISABLE KEYS */;
/*!40000 ALTER TABLE `m2101` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m2102`
--

DROP TABLE IF EXISTS `m2102`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m2102` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `m2102_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m2102`
--

LOCK TABLES `m2102` WRITE;
/*!40000 ALTER TABLE `m2102` DISABLE KEYS */;
/*!40000 ALTER TABLE `m2102` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m2103`
--

DROP TABLE IF EXISTS `m2103`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m2103` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `m2103_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m2103`
--

LOCK TABLES `m2103` WRITE;
/*!40000 ALTER TABLE `m2103` DISABLE KEYS */;
/*!40000 ALTER TABLE `m2103` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m2104`
--

DROP TABLE IF EXISTS `m2104`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m2104` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `m2104_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m2104`
--

LOCK TABLES `m2104` WRITE;
/*!40000 ALTER TABLE `m2104` DISABLE KEYS */;
/*!40000 ALTER TABLE `m2104` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m2105`
--

DROP TABLE IF EXISTS `m2105`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m2105` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `m2105_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m2105`
--

LOCK TABLES `m2105` WRITE;
/*!40000 ALTER TABLE `m2105` DISABLE KEYS */;
/*!40000 ALTER TABLE `m2105` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m2106`
--

DROP TABLE IF EXISTS `m2106`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m2106` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `m2106_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m2106`
--

LOCK TABLES `m2106` WRITE;
/*!40000 ALTER TABLE `m2106` DISABLE KEYS */;
/*!40000 ALTER TABLE `m2106` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m2107`
--

DROP TABLE IF EXISTS `m2107`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m2107` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `m2107_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m2107`
--

LOCK TABLES `m2107` WRITE;
/*!40000 ALTER TABLE `m2107` DISABLE KEYS */;
/*!40000 ALTER TABLE `m2107` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m2108`
--

DROP TABLE IF EXISTS `m2108`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m2108` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `m2108_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m2108`
--

LOCK TABLES `m2108` WRITE;
/*!40000 ALTER TABLE `m2108` DISABLE KEYS */;
/*!40000 ALTER TABLE `m2108` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m2109`
--

DROP TABLE IF EXISTS `m2109`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m2109` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `m2109_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m2109`
--

LOCK TABLES `m2109` WRITE;
/*!40000 ALTER TABLE `m2109` DISABLE KEYS */;
/*!40000 ALTER TABLE `m2109` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m2110`
--

DROP TABLE IF EXISTS `m2110`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m2110` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `m2110_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m2110`
--

LOCK TABLES `m2110` WRITE;
/*!40000 ALTER TABLE `m2110` DISABLE KEYS */;
/*!40000 ALTER TABLE `m2110` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m2114`
--

DROP TABLE IF EXISTS `m2114`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m2114` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `m2114_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m2114`
--

LOCK TABLES `m2114` WRITE;
/*!40000 ALTER TABLE `m2114` DISABLE KEYS */;
/*!40000 ALTER TABLE `m2114` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m301`
--

DROP TABLE IF EXISTS `m301`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m301` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `m301_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m301`
--

LOCK TABLES `m301` WRITE;
/*!40000 ALTER TABLE `m301` DISABLE KEYS */;
/*!40000 ALTER TABLE `m301` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m302`
--

DROP TABLE IF EXISTS `m302`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m302` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `m302_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m302`
--

LOCK TABLES `m302` WRITE;
/*!40000 ALTER TABLE `m302` DISABLE KEYS */;
/*!40000 ALTER TABLE `m302` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m303`
--

DROP TABLE IF EXISTS `m303`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m303` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `m303_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m303`
--

LOCK TABLES `m303` WRITE;
/*!40000 ALTER TABLE `m303` DISABLE KEYS */;
/*!40000 ALTER TABLE `m303` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m304`
--

DROP TABLE IF EXISTS `m304`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m304` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `m304_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m304`
--

LOCK TABLES `m304` WRITE;
/*!40000 ALTER TABLE `m304` DISABLE KEYS */;
/*!40000 ALTER TABLE `m304` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m305`
--

DROP TABLE IF EXISTS `m305`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m305` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `m305_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m305`
--

LOCK TABLES `m305` WRITE;
/*!40000 ALTER TABLE `m305` DISABLE KEYS */;
/*!40000 ALTER TABLE `m305` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m306`
--

DROP TABLE IF EXISTS `m306`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m306` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `m306_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m306`
--

LOCK TABLES `m306` WRITE;
/*!40000 ALTER TABLE `m306` DISABLE KEYS */;
/*!40000 ALTER TABLE `m306` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m307`
--

DROP TABLE IF EXISTS `m307`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m307` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `m307_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m307`
--

LOCK TABLES `m307` WRITE;
/*!40000 ALTER TABLE `m307` DISABLE KEYS */;
/*!40000 ALTER TABLE `m307` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m308`
--

DROP TABLE IF EXISTS `m308`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m308` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `m308_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m308`
--

LOCK TABLES `m308` WRITE;
/*!40000 ALTER TABLE `m308` DISABLE KEYS */;
/*!40000 ALTER TABLE `m308` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m309`
--

DROP TABLE IF EXISTS `m309`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m309` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `m309_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m309`
--

LOCK TABLES `m309` WRITE;
/*!40000 ALTER TABLE `m309` DISABLE KEYS */;
/*!40000 ALTER TABLE `m309` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m310`
--

DROP TABLE IF EXISTS `m310`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m310` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `m310_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m310`
--

LOCK TABLES `m310` WRITE;
/*!40000 ALTER TABLE `m310` DISABLE KEYS */;
/*!40000 ALTER TABLE `m310` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m311`
--

DROP TABLE IF EXISTS `m311`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m311` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `m311_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m311`
--

LOCK TABLES `m311` WRITE;
/*!40000 ALTER TABLE `m311` DISABLE KEYS */;
/*!40000 ALTER TABLE `m311` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m312`
--

DROP TABLE IF EXISTS `m312`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m312` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `m312_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m312`
--

LOCK TABLES `m312` WRITE;
/*!40000 ALTER TABLE `m312` DISABLE KEYS */;
/*!40000 ALTER TABLE `m312` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m313`
--

DROP TABLE IF EXISTS `m313`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m313` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `m313_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m313`
--

LOCK TABLES `m313` WRITE;
/*!40000 ALTER TABLE `m313` DISABLE KEYS */;
/*!40000 ALTER TABLE `m313` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m314`
--

DROP TABLE IF EXISTS `m314`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m314` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `m314_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m314`
--

LOCK TABLES `m314` WRITE;
/*!40000 ALTER TABLE `m314` DISABLE KEYS */;
/*!40000 ALTER TABLE `m314` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m315`
--

DROP TABLE IF EXISTS `m315`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m315` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `m315_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m315`
--

LOCK TABLES `m315` WRITE;
/*!40000 ALTER TABLE `m315` DISABLE KEYS */;
/*!40000 ALTER TABLE `m315` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m316`
--

DROP TABLE IF EXISTS `m316`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m316` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `m316_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m316`
--

LOCK TABLES `m316` WRITE;
/*!40000 ALTER TABLE `m316` DISABLE KEYS */;
/*!40000 ALTER TABLE `m316` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_list`
--

DROP TABLE IF EXISTS `market_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_list` (
  `market_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `market_name` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`market_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_list`
--

LOCK TABLES `market_list` WRITE;
/*!40000 ALTER TABLE `market_list` DISABLE KEYS */;
INSERT INTO `market_list` VALUES (1,'台北二'),(3,'台北一'),(4,'板橋區'),(5,'三重區'),(6,'桃農'),(7,'台中市'),(13,'南投市'),(14,'嘉義市'),(17,'高雄市'),(19,'鳳山區'),(20,'屏東市'),(21,'台東市'),(22,'花蓮市'),(23,'宜蘭市');
/*!40000 ALTER TABLE `market_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moisture1`
--

DROP TABLE IF EXISTS `moisture1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moisture1` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  UNIQUE KEY `UC_field_time` (`field`,`timestamp`),
  CONSTRAINT `moisture1_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moisture1`
--

LOCK TABLES `moisture1` WRITE;
/*!40000 ALTER TABLE `moisture1` DISABLE KEYS */;
/*!40000 ALTER TABLE `moisture1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moisture_daily`
--

DROP TABLE IF EXISTS `moisture_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moisture_daily` (
  `moist_date` date NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`moist_date`,`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moisture_daily`
--

LOCK TABLES `moisture_daily` WRITE;
/*!40000 ALTER TABLE `moisture_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `moisture_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `n`
--

DROP TABLE IF EXISTS `n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `n` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  UNIQUE KEY `UC_field_time` (`field`,`timestamp`),
  CONSTRAINT `n_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `n`
--

LOCK TABLES `n` WRITE;
/*!40000 ALTER TABLE `n` DISABLE KEYS */;
/*!40000 ALTER TABLE `n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nami`
--

DROP TABLE IF EXISTS `nami`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nami` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `nami_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nami`
--

LOCK TABLES `nami` WRITE;
/*!40000 ALTER TABLE `nami` DISABLE KEYS */;
/*!40000 ALTER TABLE `nami` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nitrogen_daily`
--

DROP TABLE IF EXISTS `nitrogen_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nitrogen_daily` (
  `nitr_date` date NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`nitr_date`,`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nitrogen_daily`
--

LOCK TABLES `nitrogen_daily` WRITE;
/*!40000 ALTER TABLE `nitrogen_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `nitrogen_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ovum_daily`
--

DROP TABLE IF EXISTS `ovum_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ovum_daily` (
  `ovum_date` date NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`ovum_date`,`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ovum_daily`
--

LOCK TABLES `ovum_daily` WRITE;
/*!40000 ALTER TABLE `ovum_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `ovum_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `p`
--

DROP TABLE IF EXISTS `p`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `p` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  UNIQUE KEY `UC_field_time` (`field`,`timestamp`),
  CONSTRAINT `p_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `p`
--

LOCK TABLES `p` WRITE;
/*!40000 ALTER TABLE `p` DISABLE KEYS */;
/*!40000 ALTER TABLE `p` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ph1`
--

DROP TABLE IF EXISTS `ph1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ph1` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  UNIQUE KEY `UC_field_time` (`field`,`timestamp`),
  CONSTRAINT `ph1_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ph1`
--

LOCK TABLES `ph1` WRITE;
/*!40000 ALTER TABLE `ph1` DISABLE KEYS */;
/*!40000 ALTER TABLE `ph1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ph_daily`
--

DROP TABLE IF EXISTS `ph_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ph_daily` (
  `ph_date` date NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`ph_date`,`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ph_daily`
--

LOCK TABLES `ph_daily` WRITE;
/*!40000 ALTER TABLE `ph_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `ph_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phosphorum_daily`
--

DROP TABLE IF EXISTS `phosphorum_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phosphorum_daily` (
  `phos_date` date NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`phos_date`,`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phosphorum_daily`
--

LOCK TABLES `phosphorum_daily` WRITE;
/*!40000 ALTER TABLE `phosphorum_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `phosphorum_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `power1`
--

DROP TABLE IF EXISTS `power1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `power1` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  UNIQUE KEY `UC_field_time` (`field`,`timestamp`),
  CONSTRAINT `power1_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `power1`
--

LOCK TABLES `power1` WRITE;
/*!40000 ALTER TABLE `power1` DISABLE KEYS */;
/*!40000 ALTER TABLE `power1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainmeter`
--

DROP TABLE IF EXISTS `rainmeter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rainmeter` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  UNIQUE KEY `UC_field_time` (`field`,`timestamp`),
  CONSTRAINT `rainmeter_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainmeter`
--

LOCK TABLES `rainmeter` WRITE;
/*!40000 ALTER TABLE `rainmeter` DISABLE KEYS */;
/*!40000 ALTER TABLE `rainmeter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainmeter_daily`
--

DROP TABLE IF EXISTS `rainmeter_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rainmeter_daily` (
  `rain_date` date NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`rain_date`,`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainmeter_daily`
--

LOCK TABLES `rainmeter_daily` WRITE;
/*!40000 ALTER TABLE `rainmeter_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `rainmeter_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relay_icons`
--

DROP TABLE IF EXISTS `relay_icons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relay_icons` (
  `icon_id` int(11) NOT NULL AUTO_INCREMENT,
  `icon_name` varchar(45) COLLATE utf8_bin NOT NULL,
  `icon_path` varchar(255) COLLATE utf8_bin NOT NULL,
  `relay_type` int(11) NOT NULL,
  PRIMARY KEY (`icon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relay_icons`
--

LOCK TABLES `relay_icons` WRITE;
/*!40000 ALTER TABLE `relay_icons` DISABLE KEYS */;
INSERT INTO `relay_icons` VALUES (1,'預設','../static/relay_icon/default.svg',0),(2,'澆水灌溉','../static/relay_icon/water.svg',1),(3,'施肥','../static/relay_icon/fert.svg',16),(4,'風扇','../static/relay_icon/fan.svg',32),(5,'燈光','../static/relay_icon/lamp.svg',48),(6,'遮陽','../static/relay_icon/sun.svg',64),(7,'擋風','../static/relay_icon/wind.svg',80),(8,'施藥','../static/relay_icon/pest.svg',96);
/*!40000 ALTER TABLE `relay_icons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensor`
--

DROP TABLE IF EXISTS `sensor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `df_name` varchar(50) COLLATE utf8_bin NOT NULL,
  `alias` varchar(50) COLLATE utf8_bin NOT NULL,
  `unit` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `icon` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `bg_color` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `df_name` (`df_name`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensor`
--

LOCK TABLES `sensor` WRITE;
/*!40000 ALTER TABLE `sensor` DISABLE KEYS */;
INSERT INTO `sensor` VALUES (1,'atpressure','AtPressure-O','大氣壓力','hPa','ion-android-cloud','bg-aqua'),(2,'co2','CO2-O','二氧化碳','ppm','ion-android-car','bg-gray'),(3,'temperature','Temperature-O','溫度','℃','ion-thermometer','bg-orange'),(4,'humidity','Humidity-O','濕度','%','ion-waterdrop ','bg-aqua'),(5,'windspeed','WindSpeed-O','風速','m/s','fa-location-arrow','bg-teal'),(6,'rainmeter','RainMeter-O','雨量','mm','fa-umbrella','bg-blue'),(7,'bugs','Bug1-O','蟲數','隻/24hr','ion-bug','bg-green'),(8,'uv','UV1-O','紫外線','UVI','ion-android-sunny','bg-purple'),(9,'moisture','Moisture1-O','土壤濕度','%','ion-waterdrop','bg-orange'),(10,'ph','PH1-O','土壤酸鹼','ph','fa-flask','bg-maroon'),(11,'luminance','Luminance-O','照度','Lux','ion-android-sunny','bg-yellow'),(12,'spore','Spore-O','孢子萌發率','%','fa-drupal','bg-olive'),(13,'ovum','Ovum-O','蟲卵孵化率','%','ion-bug','bg-green'),(14,'SoilTemp','SoilTemp1-O','土壤溫度','℃','ion-thermometer','bg-maroon'),(15,'SoilEC','SoilEC1-O','土壤EC','uS/cm','ion-erlenmeyer-flask-bubbles','bg-maroon'),(17,'warning','warning-O','警示','unit','fa-warning','bg-red'),(41,'THW','THW-O','體感溫度','℃','fa-odnoklassniki','bg-maroon'),(42,'scale','weight-O','电子秤重','g',' fa-balance-scale','bg-teal'),(59,'M101','M101','溫度','℃','ion-thermometer','bg-orange'),(60,'M102','M102','大氣壓力','hPa','ion-android-cloud','bg-aqua'),(61,'M103','M103','濕度','%','ion-waterdrop	','bg-aqua'),(62,'M104','M104','二氧化碳','ppm','ion-android-car','bg-gray'),(63,'M105','M105','紫外線指數','UVI','ion-android-sunny','bg-purple'),(64,'M106','M106','照度','Lux','ion-android-sunny	','bg-yellow'),(65,'M107','M107','風速','m/s','fa-location-arrow	','bg-teal'),(66,'M108','M108','雨量','mm','fa-umbrella','bg-blue'),(67,'M2101','M2101','溫度','℃','ion-thermometer','bg-orange'),(68,'M2102','M2102','大氣壓力','hPa','ion-android-cloud','bg-aqua'),(69,'M2103','M2103','濕度','%','ion-waterdrop','bg-aqua'),(70,'M2104','M2104','二氧化碳','ppm','ion-android-car','bg-gray'),(71,'M2105','M2105','紫外線','UVI','ion-android-sunny','bg-purple'),(72,'M2106','M2106','照度','Lux','ion-android-sunny','bg-yellow'),(73,'M2107','M2107','土壤濕度','%','ion-waterdrop','bg-orange'),(74,'M2108','M2108','土壤溫度','℃','ion-thermometer','bg-maroon'),(75,'M2109','M2109','土壤EC','uS/cm','ion-erlenmeyer-flask-bubbles','bg-maroon'),(76,'M2110','M2110','蟲罐','隻/24hr','ion-bug','bg-green'),(77,'M2114','M2114','土壤酸鹼','mL/L','fa-flask','bg-maroon'),(78,'M2201','M2201','溫度','℃','ion-thermometer','bg-orange'),(79,'M2202','M2202','大氣壓力','hPa','ion-android-cloud','bg-aqua'),(80,'M2203','M2203','濕度','%','ion-waterdrop','bg-aqua'),(81,'M2204','M2204','二氧化碳','ppm','ion-android-car','bg-gray'),(82,'M2205','M2205','紫外線','UVI','ion-android-sunny','bg-purple'),(83,'M2206','M2206','照度','Lux','ion-android-sunny','bg-yellow'),(84,'M2207','M2207','土壤濕度','%','ion-waterdrop','bg-orange'),(85,'M2208','M2208','土壤溫度','℃','ion-thermometer','bg-maroon'),(86,'M2209','M2209','土壤EC','uS/cm','ion-erlenmeyer-flask-bubbles','bg-maroon'),(87,'M2210','M2210','蟲罐','隻/24hr','ion-bug','bg-green'),(88,'M2214','M2214','土壤酸鹼','mL/L','fa-flask','bg-maroon'),(89,'M2301','M2301','溫度','℃','ion-thermometer','bg-orange'),(90,'M2302','M2302','大氣壓力','hPa','ion-android-cloud','bg-aqua'),(91,'M2303','M2303','濕度','%','ion-waterdrop','bg-aqua'),(92,'M2304','M2304','二氧化碳','ppm','ion-android-car','bg-gray'),(93,'M2305','M2305','紫外線','UVI','ion-android-sunny','bg-purple'),(94,'M2306','M2306','照度','Lux','ion-android-sunny','bg-yellow'),(95,'M2307','M2307','土壤濕度','%','ion-waterdrop','bg-orange'),(96,'M2308','M2308','土壤溫度','℃','ion-thermometer','bg-maroon'),(97,'M2309','M2309','土壤EC','uS/cm','ion-erlenmeyer-flask-bubbles','bg-maroon'),(98,'M2310','M2310','蟲罐','隻/24hr','ion-bug','bg-green'),(99,'M2314','M2314','土壤酸鹼','mL/L','fa-flask','bg-maroon'),(100,'M2401','M2401','溫度','℃','ion-thermometer','bg-orange'),(101,'M2402','M2402','大氣壓力','hPa','ion-android-cloud','bg-aqua'),(102,'M2403','M2403','濕度','%','ion-waterdrop','bg-aqua'),(103,'M2404','M2404','二氧化碳','ppm','ion-android-car','bg-gray'),(104,'M2405','M2405','紫外線','UVI','ion-android-sunny','bg-purple'),(105,'M2406','M2406','照度','Lux','ion-android-sunny','bg-yellow'),(106,'M2407','M2407','土壤濕度','%','ion-waterdrop','bg-orange'),(107,'M2408','M2408','土壤溫度','℃','ion-thermometer','bg-maroon'),(108,'M2409','M2409','土壤EC','uS/cm','ion-erlenmeyer-flask-bubbles','bg-maroon'),(109,'M2410','M2410','蟲罐','隻/24hr','ion-bug','bg-green'),(110,'M2414','M2414','土壤酸鹼','mL/L','fa-flask','bg-maroon'),(111,'M301','M301','繼電器','relay','fa-toggle-on','bg-gray'),(112,'M302','M302','繼電器','relay','fa-toggle-on','bg-gray'),(113,'M303','M303','繼電器','relay','fa-toggle-on','bg-gray'),(114,'M304','M304','繼電器','relay','fa-toggle-on','bg-gray'),(115,'M305','M305','繼電器','relay','fa-toggle-on','bg-gray'),(116,'M306','M306','繼電器','relay','fa-toggle-on','bg-gray'),(117,'M307','M307','繼電器','relay','fa-toggle-on','bg-gray'),(118,'M308','M308','繼電器','relay','fa-toggle-on','bg-gray'),(119,'M309','M309','繼電器','relay','fa-toggle-on','bg-gray'),(120,'M310','M310','繼電器','relay','fa-toggle-on','bg-gray'),(121,'M311','M311','繼電器','relay','fa-toggle-on','bg-gray'),(122,'M312','M312','繼電器','relay','fa-toggle-on','bg-gray'),(123,'M313','M313','繼電器','relay','fa-toggle-on','bg-gray'),(124,'M314','M314','繼電器','relay','fa-toggle-on','bg-gray'),(125,'M315','M315','繼電器','relay','fa-toggle-on','bg-gray'),(126,'M316','M316','繼電器','relay','fa-toggle-on','bg-gray');
/*!40000 ALTER TABLE `sensor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensor_test`
--

DROP TABLE IF EXISTS `sensor_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensor_test` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `sensor_test_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensor_test`
--

LOCK TABLES `sensor_test` WRITE;
/*!40000 ALTER TABLE `sensor_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `sensor_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_info`
--

DROP TABLE IF EXISTS `server_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_info` (
  `server_id` varchar(50) COLLATE utf8_bin NOT NULL,
  `server_ipv4` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`server_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_info`
--

LOCK TABLES `server_info` WRITE;
/*!40000 ALTER TABLE `server_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `server_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soilec1`
--

DROP TABLE IF EXISTS `soilec1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soilec1` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  UNIQUE KEY `UC_field_time` (`field`,`timestamp`),
  CONSTRAINT `soilec1_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soilec1`
--

LOCK TABLES `soilec1` WRITE;
/*!40000 ALTER TABLE `soilec1` DISABLE KEYS */;
/*!40000 ALTER TABLE `soilec1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soilec_daily`
--

DROP TABLE IF EXISTS `soilec_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soilec_daily` (
  `soilec_date` date NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`soilec_date`,`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soilec_daily`
--

LOCK TABLES `soilec_daily` WRITE;
/*!40000 ALTER TABLE `soilec_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `soilec_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soiltemp1`
--

DROP TABLE IF EXISTS `soiltemp1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soiltemp1` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  UNIQUE KEY `UC_field_time` (`field`,`timestamp`),
  CONSTRAINT `soiltemp1_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soiltemp1`
--

LOCK TABLES `soiltemp1` WRITE;
/*!40000 ALTER TABLE `soiltemp1` DISABLE KEYS */;
/*!40000 ALTER TABLE `soiltemp1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soiltemp_daily`
--

DROP TABLE IF EXISTS `soiltemp_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soiltemp_daily` (
  `soiltemp_date` date NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`soiltemp_date`,`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soiltemp_daily`
--

LOCK TABLES `soiltemp_daily` WRITE;
/*!40000 ALTER TABLE `soiltemp_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `soiltemp_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spore`
--

DROP TABLE IF EXISTS `spore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spore` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  UNIQUE KEY `UC_field_time` (`field`,`timestamp`),
  CONSTRAINT `spore_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spore`
--

LOCK TABLES `spore` WRITE;
/*!40000 ALTER TABLE `spore` DISABLE KEYS */;
/*!40000 ALTER TABLE `spore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spore_daily`
--

DROP TABLE IF EXISTS `spore_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spore_daily` (
  `spore_date` date NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`spore_date`,`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spore_daily`
--

LOCK TABLES `spore_daily` WRITE;
/*!40000 ALTER TABLE `spore_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `spore_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taiwan_city_list`
--

DROP TABLE IF EXISTS `taiwan_city_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taiwan_city_list` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taiwan_city_list`
--

LOCK TABLES `taiwan_city_list` WRITE;
/*!40000 ALTER TABLE `taiwan_city_list` DISABLE KEYS */;
INSERT INTO `taiwan_city_list` VALUES (1,'基隆市'),(2,'臺北市'),(3,'新北市'),(4,'桃園市'),(5,'新竹市'),(6,'新竹縣'),(7,'宜蘭縣'),(8,'苗栗縣'),(9,'臺中市'),(10,'彰化縣'),(11,'南投縣'),(12,'雲林縣'),(13,'嘉義市'),(14,'嘉義縣'),(15,'臺南市'),(16,'高雄市'),(17,'屏東縣'),(18,'花蓮縣'),(19,'臺東縣'),(20,'澎湖縣'),(21,'金門縣'),(22,'連江縣');
/*!40000 ALTER TABLE `taiwan_city_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taiwan_town_list`
--

DROP TABLE IF EXISTS `taiwan_town_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taiwan_town_list` (
  `town_id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_bin NOT NULL,
  `postal_code` int(11) NOT NULL,
  PRIMARY KEY (`town_id`)
) ENGINE=InnoDB AUTO_INCREMENT=422 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taiwan_town_list`
--

LOCK TABLES `taiwan_town_list` WRITE;
/*!40000 ALTER TABLE `taiwan_town_list` DISABLE KEYS */;
INSERT INTO `taiwan_town_list` VALUES (1,1,'仁愛區',200),(2,1,'信義區',201),(3,1,'中正區',202),(4,1,'中山區',203),(5,1,'安樂區',204),(6,1,'暖暖區',205),(7,1,'七堵區',206),(8,2,'中正區',100),(9,2,'大同區',103),(10,2,'中山區',104),(11,2,'松山區',105),(12,2,'大安區',106),(13,2,'萬華區',108),(14,2,'信義區',110),(15,2,'士林區',111),(16,2,'北投區',112),(17,2,'內湖區',114),(18,2,'南港區',115),(19,2,'文山區',116),(20,3,'板橋區',220),(21,3,'新莊區',242),(22,3,'中和區',235),(23,3,'永和區',234),(24,3,'土城區',236),(25,3,'樹林區',238),(26,3,'三峽區',237),(27,3,'鶯歌區',239),(28,3,'三重區',241),(29,3,'蘆洲區',247),(30,3,'五股區',248),(31,3,'泰山區',243),(32,3,'林口區',244),(33,3,'八里區',249),(34,3,'淡水區',251),(35,3,'三芝區',252),(36,3,'石門區',253),(37,3,'金山區',208),(38,3,'萬里區',207),(39,3,'汐止區',221),(40,3,'瑞芳區',224),(41,3,'貢寮區',228),(42,3,'平溪區',226),(43,3,'雙溪區',227),(44,3,'新店區',231),(45,3,'深坑區',222),(46,3,'石碇區',223),(47,3,'坪林區',232),(48,3,'烏來區',233),(49,4,'桃園區',330),(50,4,'中壢區',320),(51,4,'平鎮區',324),(52,4,'八德區',334),(53,4,'楊梅區',326),(54,4,'蘆竹區',338),(55,4,'大溪區',335),(56,4,'龍潭區',325),(57,4,'龜山區',333),(58,4,'大園區',337),(59,4,'觀音區',328),(60,4,'新屋區',327),(61,4,'復興區',336),(62,5,'東區',300),(63,5,'北區',300),(64,5,'香山區',300),(65,6,'竹北市',302),(66,6,'竹東鎮',310),(67,6,'新埔鎮',305),(68,6,'關西鎮',306),(69,6,'湖口鄉',303),(70,6,'新豐鄉',304),(71,6,'峨眉鄉',315),(72,6,'寶山鄉',308),(73,6,'北埔鄉',314),(74,6,'芎林鄉',307),(75,6,'橫山鄉',312),(76,6,'尖石鄉',313),(77,6,'五峰鄉',311),(78,7,'宜蘭市',260),(79,7,'頭城鎮',261),(80,7,'礁溪鄉',262),(81,7,'壯圍鄉',263),(82,7,'員山鄉',264),(83,7,'羅東鎮',265),(84,7,'蘇澳鎮',270),(85,7,'五結鄉',268),(86,7,'三星鄉',266),(87,7,'冬山鄉',269),(88,7,'大同鄉',267),(89,7,'南澳鄉',272),(90,8,'苗栗市',360),(91,8,'頭份市',351),(92,8,'竹南鎮',350),(93,8,'後龍鎮',356),(94,8,'通霄鎮',357),(95,8,'苑裡鎮',358),(96,8,'卓蘭鎮',369),(97,8,'造橋鄉',361),(98,8,'西湖鄉',368),(99,8,'頭屋鄉',362),(100,8,'公館鄉',363),(101,8,'銅鑼鄉',366),(102,8,'三義鄉',367),(103,8,'大湖鄉',364),(104,8,'獅潭鄉',354),(105,8,'三灣鄉',352),(106,8,'南庄鄉',353),(107,8,'泰安鄉',365),(108,9,'中區',400),(109,9,'東區',401),(110,9,'南區',402),(111,9,'西區',403),(112,9,'北區',404),(113,9,'北屯區',406),(114,9,'西屯區',407),(115,9,'南屯區',408),(116,9,'太平區',411),(117,9,'大里區',412),(118,9,'霧峰區',413),(119,9,'烏日區',414),(120,9,'豐原區',420),(121,9,'后里區',421),(122,9,'石岡區',422),(123,9,'東勢區',423),(124,9,'新社區',426),(125,9,'潭子區',427),(126,9,'大雅區',428),(127,9,'神岡區',429),(128,9,'大肚區',432),(129,9,'沙鹿區',433),(130,9,'龍井區',434),(131,9,'梧棲區',435),(132,9,'清水區',436),(133,9,'大甲區',437),(134,9,'外埔區',438),(135,9,'大安區',439),(136,9,'和平區',424),(137,10,'彰化市',500),(138,10,'員林市',510),(139,10,'和美鎮',508),(140,10,'鹿港鎮',505),(141,10,'溪湖鎮',514),(142,10,'二林鎮',526),(143,10,'田中鎮',520),(144,10,'北斗鎮',521),(145,10,'花壇鄉',503),(146,10,'芬園鄉',502),(147,10,'大村鄉',515),(148,10,'永靖鄉',512),(149,10,'伸港鄉',509),(150,10,'線西鄉',507),(151,10,'福興鄉',506),(152,10,'秀水鄉',504),(153,10,'埔心鄉',513),(154,10,'埔鹽鄉',516),(155,10,'大城鄉',527),(156,10,'芳苑鄉',528),(157,10,'竹塘鄉',525),(158,10,'社頭鄉',511),(159,10,'二水鄉',530),(160,10,'田尾鄉',522),(161,10,'埤頭鄉',523),(162,10,'溪州鄉',524),(163,11,'南投市',540),(164,11,'埔里鎮',545),(165,11,'草屯鎮',542),(166,11,'竹山鎮',557),(167,11,'集集鎮',552),(168,11,'名間鄉',551),(169,11,'鹿谷鄉',558),(170,11,'中寮鄉',541),(171,11,'魚池鄉',555),(172,11,'國姓鄉',544),(173,11,'水里鄉',553),(174,11,'信義鄉',556),(175,11,'仁愛鄉',546),(196,12,'斗六市',640),(197,12,'斗南鎮',630),(198,12,'林內鄉',643),(199,12,'古坑鄉',646),(200,12,'大埤鄉',631),(201,12,'莿桐鄉',647),(202,12,'虎尾鎮',632),(203,12,'西螺鎮',648),(204,12,'土庫鎮',633),(205,12,'褒忠鎮',634),(206,12,'二崙鄉',649),(207,12,'崙背鄉',637),(208,12,'麥寮鄉',638),(209,12,'臺西鄉',636),(210,12,'東勢鄉',635),(211,12,'北港鎮',651),(212,12,'元長鄉',655),(213,12,'四湖鄉',654),(214,12,'口湖鄉',653),(215,12,'水林鄉',652),(216,13,'東區',600),(217,13,'西區',600),(218,14,'太保市',612),(219,14,'朴子市',613),(220,14,'布袋鎮',625),(221,14,'大林鎮',622),(222,14,'民雄鄉',621),(223,14,'溪口鄉',623),(224,14,'新港鄉',616),(225,14,'六腳鄉',615),(226,14,'東石鄉',614),(227,14,'義竹鄉',624),(228,14,'水上鄉',611),(229,14,'中埔鄉',608),(230,14,'竹崎鄉',606),(231,14,'梅山鄉',604),(232,14,'番路鄉',603),(233,14,'大埔鄉',607),(234,14,'阿里山鄉',605),(235,15,'中西區',700),(236,15,'東區',701),(237,15,'南區',702),(238,15,'北區',704),(239,15,'安平區',708),(240,15,'安南區',709),(241,15,'永康區',710),(242,15,'歸仁區',711),(243,15,'新化區',712),(244,15,'左鎮區',713),(245,15,'玉井區',714),(246,15,'楠西區',715),(247,15,'南化區',716),(248,15,'仁德區',717),(249,15,'關廟區',718),(250,15,'龍崎區',719),(251,15,'官田區',720),(252,15,'麻豆區',721),(253,15,'佳里區',722),(254,15,'西港區',723),(255,15,'七股區',724),(256,15,'將軍區',725),(257,15,'學甲區',726),(258,15,'北門區',727),(259,15,'新營區',730),(260,15,'後壁區',731),(261,15,'白河區',732),(262,15,'東山區',733),(263,15,'六甲區',734),(264,15,'下營區',735),(265,15,'柳營區',736),(266,15,'鹽水區',737),(267,15,'善化區',741),(268,15,'大內區',742),(269,15,'山上區',743),(270,15,'新市區',744),(271,15,'安定區',745),(272,16,'楠梓區',811),(273,16,'左營區',813),(274,16,'鼓山區',804),(275,16,'三民區',807),(276,16,'鹽埕區',803),(277,16,'前金區',801),(278,16,'新興區',800),(279,16,'苓雅區',802),(280,16,'前鎮區',806),(281,16,'旗津區',805),(282,16,'小港區',812),(283,16,'鳳山區',830),(284,16,'大寮區',831),(285,16,'鳥松區',833),(286,16,'林園區',832),(287,16,'仁武區',814),(288,16,'大樹區',840),(289,16,'大社區',815),(290,16,'岡山區',820),(291,16,'路竹區',821),(292,16,'橋頭區',825),(293,16,'梓官區',826),(294,16,'彌陀區',827),(295,16,'永安區',828),(296,16,'燕巢區',824),(297,16,'田寮區',823),(298,16,'阿蓮區',822),(299,16,'茄萣區',852),(300,16,'湖內區',829),(301,16,'旗山區',842),(302,16,'美濃區',843),(303,16,'內門區',845),(304,16,'杉林區',846),(305,16,'甲仙區',847),(306,16,'六龜區',844),(307,16,'茂林區',851),(308,16,'桃源區',848),(309,16,'那瑪夏區',849),(343,17,'屏東市',900),(344,17,'潮州鎮',920),(345,17,'東港鎮',928),(346,17,'恆春鎮',946),(347,17,'萬丹鄉',913),(348,17,'崁頂鄉',924),(349,17,'新園鄉',932),(350,17,'林邊鄉',927),(351,17,'南州鄉',926),(352,17,'琉球鄉',929),(353,17,'枋寮鄉',940),(354,17,'枋山鄉',941),(355,17,'車城鄉',944),(356,17,'滿州鄉',947),(357,17,'高樹鄉',906),(358,17,'九如鄉',904),(359,17,'鹽埔鄉',907),(360,17,'里港鄉',905),(361,17,'內埔鄉',912),(362,17,'竹田鄉',911),(363,17,'長治鄉',908),(364,17,'麟洛鄉',909),(365,17,'萬巒鄉',923),(366,17,'新埤鄉',925),(367,17,'佳冬鄉',931),(368,17,'霧臺鄉',902),(369,17,'泰武鄉',921),(370,17,'瑪家鄉',903),(371,17,'來義鄉',922),(372,17,'春日鄉',942),(373,17,'獅子鄉',943),(374,17,'牡丹鄉',945),(375,17,'三地門鄉',901),(376,18,'花蓮市',970),(377,18,'吉安鄉',973),(378,18,'壽豐鄉',974),(379,18,'新城鄉',971),(380,18,'鳳林鎮',975),(381,18,'光復鄉',976),(382,18,'玉里鎮',981),(383,18,'豐濱鄉',977),(384,18,'瑞穗鄉',978),(385,18,'富里鄉',983),(386,18,'秀林鄉',972),(387,18,'萬榮鄉',979),(388,18,'卓溪鄉',982),(389,19,'臺東市',950),(390,19,'成功鎮',961),(391,19,'關山鎮',956),(392,19,'長濱鄉',962),(393,19,'池上鄉',958),(394,19,'東河鄉',959),(395,19,'鹿野鄉',955),(396,19,'卑南鄉',954),(397,19,'大武鄉',965),(398,19,'綠島鄉',951),(399,19,'太麻里鄉',963),(400,19,'海端鄉',957),(401,19,'延平鄉',953),(402,19,'金峰鄉',964),(403,19,'達仁鄉',966),(404,19,'蘭嶼鄉',952),(405,20,'馬公市',880),(406,20,'湖西鄉',885),(407,20,'白沙鄉',884),(408,20,'西嶼鄉',881),(409,20,'望安鄉',882),(410,20,'七美鄉',883),(411,21,'金城鎮',893),(412,21,'金湖鎮',891),(413,21,'金沙鎮',890),(414,21,'金寧鄉',892),(415,21,'烈嶼鄉',894),(416,21,'烏坵鄉',896),(417,22,'南竿鄉',209),(418,22,'北竿鄉',210),(419,22,'莒光鄉',211),(420,22,'東引鄉',212),(421,14,'鹿草鄉',611);
/*!40000 ALTER TABLE `taiwan_town_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temperature`
--

DROP TABLE IF EXISTS `temperature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temperature` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  UNIQUE KEY `UC_field_time` (`field`,`timestamp`),
  CONSTRAINT `temperature_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temperature`
--

LOCK TABLES `temperature` WRITE;
/*!40000 ALTER TABLE `temperature` DISABLE KEYS */;
/*!40000 ALTER TABLE `temperature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temperature_daily`
--

DROP TABLE IF EXISTS `temperature_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temperature_daily` (
  `tempe_date` date NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`tempe_date`,`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temperature_daily`
--

LOCK TABLES `temperature_daily` WRITE;
/*!40000 ALTER TABLE `temperature_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `temperature_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `test_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turmeric`
--

DROP TABLE IF EXISTS `turmeric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turmeric` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  UNIQUE KEY `UC_field_time` (`field`,`timestamp`),
  CONSTRAINT `turmeric_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turmeric`
--

LOCK TABLES `turmeric` WRITE;
/*!40000 ALTER TABLE `turmeric` DISABLE KEYS */;
/*!40000 ALTER TABLE `turmeric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit_type`
--

DROP TABLE IF EXISTS `unit_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(45) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_type`
--

LOCK TABLES `unit_type` WRITE;
/*!40000 ALTER TABLE `unit_type` DISABLE KEYS */;
INSERT INTO `unit_type` VALUES (1,'area'),(2,'weight'),(3,'volume'),(4,'length'),(5,'seeding'),(6,'material');
/*!40000 ALTER TABLE `unit_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `units` (
  `unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `type_id` int(11) NOT NULL,
  `is_standard` int(11) NOT NULL,
  `standard_zoom` decimal(10,5) NOT NULL,
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES (1,'平方公尺',1,0,0.00010),(2,'公畝',1,0,0.01000),(3,'公頃',1,1,1.00000),(4,'平方公里',1,0,100.00000),(5,'坪',1,0,0.00033),(6,'分',1,0,0.09699),(7,'甲',1,0,0.96992),(8,'公克',2,0,0.00100),(9,'公斤',2,1,1.00000),(10,'公噸',2,0,1000.00000),(11,'台斤',2,0,0.60000),(12,'兩',2,0,0.03750),(13,'錢',2,0,0.00375),(14,'毫升',3,0,0.00100),(15,'公升',3,1,1.00000),(16,'公噸',3,0,1000.00000),(17,'加侖',3,0,3.78541),(18,'公分',4,0,0.01000),(19,'公尺',4,1,1.00000),(20,'株',5,0,0.00000),(21,'公斤(種子、種塊等)',5,0,0.00000),(22,'公克',6,0,0.00100),(23,'公斤',6,1,1.00000),(24,'公噸',6,0,1000.00000),(25,'毫升',6,0,0.00100),(26,'公升',6,0,1.00000);
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `is_superuser` int(1) NOT NULL,
  `memo` text COLLATE utf8_bin NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `trace_sys_flag` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','pbkdf2:sha256:150000$4dqyrbmt$7dd78f10b229302fcc87b018043cd17244b3bd9989b8cd42cad0638084a71af4',1,'',NULL,1,0),(2,'demo','pbkdf2:sha256:150000$O9CQkGz1$bff3beda8b15b8cf12e66a74725020ecb845c9a4ee3d4aa514a4a4771db1a9fd',0,'',1,1,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_access`
--

DROP TABLE IF EXISTS `user_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_access` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `field` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `user` (`user`),
  KEY `field` (`field`),
  CONSTRAINT `user_access_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`id`),
  CONSTRAINT `user_access_ibfk_2` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_access`
--

LOCK TABLES `user_access` WRITE;
/*!40000 ALTER TABLE `user_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv1`
--

DROP TABLE IF EXISTS `uv1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv1` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  UNIQUE KEY `UC_field_time` (`field`,`timestamp`),
  CONSTRAINT `uv1_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv1`
--

LOCK TABLES `uv1` WRITE;
/*!40000 ALTER TABLE `uv1` DISABLE KEYS */;
/*!40000 ALTER TABLE `uv1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_daily`
--

DROP TABLE IF EXISTS `uv_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_daily` (
  `uv_date` date NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`uv_date`,`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_daily`
--

LOCK TABLES `uv_daily` WRITE;
/*!40000 ALTER TABLE `uv_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `uv_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volt1`
--

DROP TABLE IF EXISTS `volt1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volt1` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  UNIQUE KEY `UC_field_time` (`field`,`timestamp`),
  CONSTRAINT `volt1_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volt1`
--

LOCK TABLES `volt1` WRITE;
/*!40000 ALTER TABLE `volt1` DISABLE KEYS */;
/*!40000 ALTER TABLE `volt1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weather_bureau_12hr`
--

DROP TABLE IF EXISTS `weather_bureau_12hr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weather_bureau_12hr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` datetime DEFAULT NULL,
  `city` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `area` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `avg_temp` int(3) DEFAULT NULL,
  `avg_Td` int(3) DEFAULT NULL,
  `avg_RH` int(10) DEFAULT NULL,
  `MaxT` int(3) DEFAULT NULL,
  `MinT` int(3) DEFAULT NULL,
  `MaxAT` int(3) DEFAULT NULL,
  `MinAT` int(3) DEFAULT NULL,
  `MaxCI` int(3) DEFAULT NULL,
  `MinCI` int(3) DEFAULT NULL,
  `rainfall_12hr` int(3) DEFAULT NULL,
  `UVI` int(3) DEFAULT NULL,
  `wind_direction` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `wind_speed` int(3) DEFAULT NULL,
  `WeatherDescription` varchar(225) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather_bureau_12hr`
--

LOCK TABLES `weather_bureau_12hr` WRITE;
/*!40000 ALTER TABLE `weather_bureau_12hr` DISABLE KEYS */;
/*!40000 ALTER TABLE `weather_bureau_12hr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weather_locationCode_data`
--

DROP TABLE IF EXISTS `weather_locationCode_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weather_locationCode_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_Code` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `location_name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `Altitude` double DEFAULT NULL,
  `lon` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `lat` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `city` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `area` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=594 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather_locationCode_data`
--

LOCK TABLES `weather_locationCode_data` WRITE;
/*!40000 ALTER TABLE `weather_locationCode_data` DISABLE KEYS */;
INSERT INTO `weather_locationCode_data` VALUES (1,'466850','五分山雷達站',756,'121.7812','25.0712','新北市','瑞芳區'),(2,'466880','板橋',9.7,'121.442','24.9976','新北市','板橋區'),(3,'466900','淡水',19,'121.4489','25.1649','新北市','淡水區'),(4,'466910','鞍部',825.8,'121.5297','25.1826','臺北市','北投區'),(5,'466920','臺北',6.3,'121.5149','25.0377','臺北市','中正區'),(6,'466930','竹子湖',607.1,'121.5445','25.1621','臺北市','北投區'),(7,'466940','基隆',26.7,'121.7405','25.1333','基隆市','仁愛區'),(8,'466950','彭佳嶼',101.7,'122.0797','25.628','基隆市','中正區'),(9,'466990','花蓮',16,'121.6133','23.9751','花蓮縣','花蓮市'),(10,'467050','新屋',20.6,'121.0475','25.0067','桃園市','新屋區'),(11,'467060','蘇澳',24.9,'121.8574','24.5967','宜蘭縣','蘇澳鎮'),(12,'467080','宜蘭',7.2,'121.7565','24.764','宜蘭縣','宜蘭市'),(13,'467110','金門',47.9,'118.2893','24.4073','金門縣','金城鎮'),(14,'467300','東吉島',43,'119.6675','23.257','澎湖縣','望安鄉'),(15,'467350','澎湖',10.7,'119.5631','23.5655','澎湖縣','馬公市'),(16,'467410','臺南',40.8,'120.2048','22.9932','臺南市','中西區'),(17,'467420','永康',8.1,'120.2367','23.0384','臺南市','永康區'),(18,'467440','高雄',2.3,'120.3157','22.566','高雄市','前鎮'),(19,'467480','嘉義',26.9,'120.4329','23.4959','嘉義市','西區'),(20,'467490','臺中',84,'120.6841','24.1457','臺中市','北區'),(21,'467530','阿里山',2413.4,'120.8132','23.5082','嘉義縣','阿里山鄉'),(22,'467540','大武',8.1,'120.9038','22.3557','臺東縣','大武鄉'),(23,'467550','玉山',3844.8,'120.9595','23.4876','南投縣','信義鄉'),(24,'467571','新竹',26.9,'121.0142','24.8279','新竹縣','竹北市'),(25,'467590','恆春',22.1,'120.7463','22.0039','屏東縣','恆春鎮'),(26,'467610','成功',33.5,'121.3734','23.0975','臺東縣','成功鎮'),(27,'467620','蘭嶼',324,'121.5583','22.037','臺東縣','蘭嶼鄉'),(28,'467650','日月潭',1017.5,'120.9081','23.8813','南投縣','魚池鄉'),(29,'467660','臺東',9,'121.1546','22.7522','臺東縣','臺東市'),(30,'467770','梧棲',31.7,'120.5234','24.256','臺中市','梧棲區'),(31,'467790','墾丁雷達站',42,'120.808','21.9482','屏東縣','恆春鎮'),(32,'467990','馬祖',97.8,'119.9234','26.1693','連江縣','南竿鄉'),(33,'C0A520','山佳',48,'121.402','24.9749','新北市','樹林區'),(34,'C0A530','坪林',300,'121.7094','24.9382','新北市','坪林區'),(35,'C0A540','四堵',401,'121.7459','24.8928','新北市','坪林區'),(36,'C0A550','泰平',422,'121.8237','24.9712','新北市','雙溪區'),(37,'C0A560','福山',405,'121.5028','24.7762','新北市','烏來區'),(38,'C0A570','桶後',360,'121.598','24.8482','新北市','烏來區'),(39,'C0A640','石碇',241,'121.6629','24.9939','新北市','石碇區'),(40,'C0A650','火燒寮',287,'121.7429','25.0027','新北市','平溪區'),(41,'C0A660','瑞芳',97,'121.8011','25.1132','新北市','瑞芳區'),(42,'C0A860','大坪',362,'121.633','25.1659','新北市','萬里區'),(43,'C0A870','五指山',685,'121.6087','25.1322','新北市','汐止區'),(44,'C0A880','福隆',6,'121.9421','25.0178','新北市','貢寮區'),(45,'C0A890','雙溪',40,'121.8642','25.036','新北市','雙溪區'),(46,'C0A920','富貴角',196,'121.5653','25.2638','新北市','石門區'),(47,'C0A931','三和',216,'121.5952','25.2332','新北市','金山區'),(48,'C0A940','金山',49,'121.644','25.2236','新北市','金山區'),(49,'C0A950','鼻頭角',60,'121.9234','25.129','新北市','瑞芳區'),(50,'C0A970','三貂角',96,'122.0021','25.0076','新北市','貢寮區'),(51,'C0A980','社子',11,'121.4697','25.1095','臺北市','士林區'),(52,'C0A9A0','大直',24,'121.5429','25.078','臺北市','中山區'),(53,'C0A9C0','天母',35,'121.5372','25.1175','臺北市','士林區'),(54,'C0A9E0','士林',26,'121.503','25.0903','臺北市','士林區'),(55,'C0A9F0','內湖',35,'121.5755','25.0794','臺北市','內湖區'),(56,'C0AC40','大屯山',1079,'121.5224','25.1757','臺北市','北投區'),(57,'C0AC60','三峽',55,'121.3697','24.939','新北市','三峽區'),(58,'C0AC70','信義',71,'121.5646','25.0378','臺北市','信義區'),(59,'C0AC80','文山',40,'121.5757','25.0024','臺北市','文山區'),(60,'C0ACA0','新莊',25,'121.4468','25.0515','新北市','新莊區'),(61,'C0AD00','三芝',86,'121.5019','25.2581','新北市','三芝區'),(62,'C0AD10','八里',27,'121.4039','25.1502','新北市','八里區'),(63,'C0AD30','蘆洲',20,'121.4723','25.0866','新北市','蘆洲區'),(64,'C0AD40','土城',32,'121.4452','24.9732','新北市','土城區'),(65,'C0AD50','鶯歌',84,'121.3463','24.9515','新北市','鶯歌區'),(66,'C0AG90','中和',25,'121.4904','24.9926','新北市','中和區'),(67,'C0AH00','汐止',38,'121.6588','25.0669','新北市','汐止區'),(68,'C0AH10','永和',30,'121.5081','25.0113','新北市','永和區'),(69,'C0AH30','五分山',755,'121.7808','25.0713','新北市','瑞芳區'),(70,'C0AH40','平等',426,'121.5771','25.1291','臺北市','士林區'),(71,'C0AH50','林口',275,'121.3808','25.0722','新北市','林口區'),(72,'C0AH70','松山',34,'121.5504','25.0487','臺北市','松山區'),(73,'C0AH80','深坑',68,'121.6283','25.0027','新北市','深坑區'),(74,'C0AH90','福山植物園',660,'121.5814','24.7607','新北市','烏來區'),(75,'C0AI00','五股',188,'121.4273','25.0745','新北市','五股區'),(76,'C0AI10','屈尺',76,'121.5448','24.9218','新北市','新店區'),(77,'C0AI20','白沙灣',25,'121.5191','25.2831','新北市','石門區'),(78,'C0AI30','三重',26,'121.5006','25.0573','新北市','三重區'),(79,'C0AI40','石牌',35,'121.5132','25.1156','臺北市','北投區'),(80,'C0B010','七堵',38,'121.7171','25.0948','基隆市','七堵區'),(81,'C0B020','基隆嶼',86,'121.7839','25.1914','基隆市','中正區'),(82,'C0C460','復興',482,'121.3523','24.8202','桃園市','復興區'),(83,'C0C480','桃園',105,'121.3232','24.9924','桃園市','桃園區'),(84,'C0C490','八德',157,'121.2833','24.9287','桃園市','八德區'),(85,'C0C540','大園',46,'121.226','25.0478','桃園市','大園區'),(86,'C0C590','觀音',72,'121.1533','25.0271','桃園市','觀音區'),(87,'C0C620','蘆竹',19,'121.2658','25.0843','桃園市','蘆竹區'),(88,'C0C630','大溪',209,'121.2655','24.8829','桃園市','大溪區'),(89,'C0C650','平鎮',208,'121.2146','24.8975','桃園市','平鎮'),(90,'C0C660','楊梅',176,'121.143','24.9124','桃園市','楊梅區'),(91,'C0C670','龍潭',250,'121.2214','24.8701','桃園市','龍潭區'),(92,'C0C680','龜山',228,'121.3866','25.0285','桃園市','龜山區'),(93,'C0C700','中壢',151,'121.2564','24.9777','桃園市','中壢區'),(94,'C0C710','大溪永福',143,'121.325','24.8929','桃園市','大溪區'),(95,'C0D360','梅花',523,'121.2086','24.6783','新竹縣','尖石鄉'),(96,'C0D390','關西',146,'121.1739','24.7982','新竹縣','關西鎮'),(97,'C0D430','峨眉',87,'121.0172','24.6905','新竹縣','峨眉鄉'),(98,'C0D480','打鐵坑',223,'121.1508','24.8497','新竹縣','新埔鎮'),(99,'C0D540','橫山',227,'121.1169','24.7112','新竹縣','橫山鄉'),(100,'C0D550','雪霸',1956,'121.1161','24.527','新竹縣','五峰鄉'),(101,'C0D560','竹東',147,'121.0579','24.7671','新竹縣','竹東鎮'),(102,'C0D570','香山',15,'120.9055','24.7469','新竹市','香山區'),(103,'C0D580','寶山',120,'121.0252','24.735','新竹縣','寶山鄉'),(104,'C0D590','新豐',143,'120.9772','24.8707','新竹縣','新豐鄉'),(105,'C0D650','湖口',97,'121.0436','24.9048','新竹縣','湖口鄉'),(106,'C0D660','新竹市東區',65,'120.9869','24.7987','新竹市','東區'),(107,'C0E420','竹南',19,'120.8889','24.709','苗栗縣','竹南鎮'),(108,'C0E430','南庄',258,'121.0002','24.6018','苗栗縣','南庄鄉'),(109,'C0E520','大湖',320,'120.8709','24.4149','苗栗縣','大湖鄉'),(110,'C0E540','後龍',32,'120.7839','24.6065','苗栗縣','後龍鎮'),(111,'C0E550','明德',84,'120.8854','24.5835','苗栗縣','頭屋鄉'),(112,'C0E590','通霄',40,'120.7046','24.4719','苗栗縣','通霄鎮'),(113,'C0E610','馬都安',850,'120.9302','24.4513','苗栗縣','泰安鄉'),(114,'C0E730','頭份',26,'120.9122','24.6882','苗栗縣','頭份市'),(115,'C0E740','造橋',27,'120.8648','24.6371','苗栗縣','造橋鄉'),(116,'C0E750','苗栗',62,'120.8246','24.5646','苗栗縣','苗栗市'),(117,'C0E780','銅鑼',160,'120.7909','24.4897','苗栗縣','銅鑼鄉'),(118,'C0E790','卓蘭',344,'120.8248','24.3128','苗栗縣','卓蘭鎮'),(119,'C0E810','西湖',53,'120.7485','24.5629','苗栗縣','西湖鄉'),(120,'C0E820','獅潭',220,'120.92','24.5391','苗栗縣','獅潭鄉'),(121,'C0E830','苑裡',37,'120.6531','24.4397','苗栗縣','苑裡鎮'),(122,'C0E850','大河',104,'120.9486','24.6181','苗栗縣','三灣鄉'),(123,'C0E870','高鐵苗栗',34,'120.8261','24.6073','苗栗縣','後龍鎮'),(124,'C0E880','三義',507,'120.7521','24.4078','苗栗縣','三義鄉'),(125,'C0F000','大肚',273,'120.5721','24.153','臺中市','大肚區'),(126,'C0F0A0','雪山圈谷',3587,'121.2363','24.3886','臺中市','和平區'),(127,'C0F0B0','石岡',311,'120.7776','24.2761','臺中市','石岡區'),(128,'C0F0C0','中坑',983,'120.9033','24.2485','臺中市','和平區'),(129,'C0F0D0','審馬陣',3171,'121.4203','24.3817','臺中市','和平區'),(130,'C0F0E0','南湖圈谷',3557,'121.4447','24.3637','臺中市','和平區'),(131,'C0F850','東勢',379,'120.833','24.2464','臺中市','東勢區'),(132,'C0F861','梨山',2215,'121.2437','24.2475','臺中市','和平區'),(133,'C0F930','大甲',100,'120.6404','24.3477','臺中市','大甲區'),(134,'C0F970','大坑',145,'120.7223','24.1731','臺中市','北屯區'),(135,'C0F9A0','中竹林',425,'120.7511','24.1036','臺中市','太平區'),(136,'C0F9I0','神岡',194,'120.6583','24.2725','臺中市','神岡區'),(137,'C0F9K0','大安',30,'120.588','24.3451','臺中市','大安區'),(138,'C0F9L0','后里',253,'120.7297','24.3104','臺中市','后里區'),(139,'C0F9M0','豐原',230,'120.7207','24.2543','臺中市','豐原區'),(140,'C0F9N0','大里',75,'120.7014','24.0925','臺中市','大里區'),(141,'C0F9O0','潭子',175,'120.7039','24.2131','臺中市','潭子區'),(142,'C0F9P0','清水',26,'120.5622','24.3123','臺中市','清水區'),(143,'C0F9Q0','外埔',149,'120.7057','24.3478','臺中市','外埔區'),(144,'C0F9R0','龍井',20,'120.529','24.1845','臺中市','龍井區'),(145,'C0F9S0','烏日',43,'120.6241','24.1071','臺中市','烏日區'),(146,'C0F9T0','西屯',111,'120.6413','24.1795','臺中市','西屯區'),(147,'C0F9U0','南屯',74,'120.638','24.137','臺中市','南屯區'),(148,'C0F9V0','新社',525,'120.8158','24.2002','臺中市','新社區'),(149,'C0F9X0','大雅(中科園區)',166,'120.6245','24.2153','臺中市','大雅區'),(150,'C0F9Y0','桃山',3313,'121.3038','24.4327','臺中市','和平區'),(151,'C0F9Z0','雪山東峰',3193,'121.2687','24.3888','臺中市','和平區'),(152,'C0G620','芬園',110,'120.6213','24.0157','彰化縣','芬園鄉'),(153,'C0G640','鹿港',17,'120.4305','24.0753','彰化縣','鹿港鎮'),(154,'C0G650','員林',34,'120.5856','23.9465','彰化縣','員林市'),(155,'C0G660','溪湖',27,'120.4791','23.9484','彰化縣','溪湖鎮'),(156,'C0G720','溪州',50,'120.4991','23.8516','彰化縣','溪州鄉'),(157,'C0G730','二林',27,'120.3761','23.9033','彰化縣','二林鎮'),(158,'C0G740','大城',24,'120.3209','23.8525','彰化縣','大城鄉'),(159,'C0G750','竹塘',31,'120.3825','23.8466','彰化縣','竹塘鄉'),(160,'C0G760','高鐵彰化',53,'120.5746','23.8752','彰化縣','田中鎮'),(161,'C0G770','福興',15,'120.4377','24.0413','彰化縣','福興鄉'),(162,'C0G780','秀水',27,'120.5039','24.0341','彰化縣','秀水鄉'),(163,'C0G800','埔鹽',15,'120.4317','24.0004','彰化縣','埔鹽鄉'),(164,'C0G810','埔心',26,'120.5255','23.9476','彰化縣','埔心鄉'),(165,'C0G820','田尾',29,'120.5094','23.9017','彰化縣','田尾鄉'),(166,'C0G830','埤頭',27,'120.4528','23.866','彰化縣','埤頭鄉'),(167,'C0G840','北斗',32,'120.5142','23.8776','彰化縣','北斗鎮'),(168,'C0G860','社頭',45,'120.5862','23.8976','彰化縣','社頭鄉'),(169,'C0G870','芳苑',12,'120.32','23.9223','彰化縣','芳苑鄉'),(170,'C0G880','二水',92,'120.6173','23.8107','彰化縣','二水鄉'),(171,'C0G890','伸港',24,'120.4844','24.1489','彰化縣','伸港鄉'),(172,'C0G900','線西',20,'120.4435','24.1434','彰化縣','線西鄉'),(173,'C0G910','花壇',42,'120.5495','24.0321','彰化縣','彰化縣花壇鄉'),(174,'C0H890','埔里',440,'120.9524','23.9722','南投縣','埔里鎮'),(175,'C0H950','中寮',192,'120.7664','23.8844','南投縣','中寮鄉'),(176,'C0H960','草屯',120,'120.6809','23.9737','南投縣','草屯鎮'),(177,'C0H990','昆陽',3076,'121.2736','24.1213','南投縣','仁愛鄉'),(178,'C0H9A0','神木村',1595,'120.8437','23.5327','南投縣','信義鄉'),(179,'C0H9C0','合歡山',3402,'121.2725','24.1434','南投縣','仁愛鄉'),(180,'C0I010','廬山',1562,'121.1818','24.0333','南投縣','仁愛鄉'),(181,'C0I080','信義',536,'120.851','23.6897','南投縣','信義鄉'),(182,'C0I090','鳳凰',910,'120.7873','23.7281','南投縣','鹿谷鄉'),(183,'C0I110','竹山',161,'120.6882','23.7612','南投縣','竹山鎮'),(184,'C0I360','水里',300,'120.8498','23.8126','南投縣','水里鄉'),(185,'C0I370','魚池',671,'120.9414','23.8957','南投縣','魚池鄉'),(186,'C0I380','集集',258,'120.8015','23.8282','南投縣','集集鎮'),(187,'C0I390','仁愛',1184,'121.1322','24.0221','南投縣','仁愛鄉'),(188,'C0I410','名間',180,'120.7014','23.8371','南投縣','名間鄉'),(189,'C0I420','國姓',305,'120.8551','24.0378','南投縣','國姓鄉'),(190,'C0I460','南投',110,'120.6873','23.9115','南投縣','南投市'),(191,'C0I480','梅峰',2165,'121.1736','24.0853','南投縣','仁愛鄉'),(192,'C0I490','萬大林道',1601,'121.0914','23.9282','南投縣','仁愛鄉'),(193,'C0I520','玉山風口',3860,'120.956','23.4705','南投縣','信義鄉'),(194,'C0I530','小奇萊',3014,'121.2957','24.1318','南投縣','仁愛鄉'),(195,'C0I540','奇萊稜線',3344,'121.3265','24.1092','南投縣','仁愛鄉'),(196,'C0K240','草嶺',1132,'120.6935','23.5956','雲林縣','古坑鄉'),(197,'C0K250','崙背',12,'120.3189','23.7556','雲林縣','崙背鄉'),(198,'C0K280','四湖',23,'120.2271','23.6304','雲林縣','四湖鄉'),(199,'C0K291','宜梧',8,'120.1693','23.5363','雲林縣','口湖鄉'),(200,'C0K330','虎尾',38,'120.442','23.7192','雲林縣','虎尾鎮'),(201,'C0K390','土庫',31,'120.3956','23.679','雲林縣','土庫鎮'),(202,'C0K400','斗六',65,'120.5411','23.7206','雲林縣','斗六市'),(203,'C0K410','北港',20,'120.2928','23.574','雲林縣','北港鎮'),(204,'C0K420','西螺',42,'120.4674','23.8004','雲林縣','西螺鎮'),(205,'C0K430','褒忠',30,'120.3036','23.6909','雲林縣','褒忠鄉'),(206,'C0K440','二崙',35,'120.4089','23.7728','雲林縣','二崙鄉'),(207,'C0K450','大埤',35,'120.4315','23.6461','雲林縣','大埤鄉'),(208,'C0K460','斗南',60,'120.4784','23.6787','雲林縣','斗南鎮'),(209,'C0K470','林內',97,'120.6096','23.7487','雲林縣','林內鄉'),(210,'C0K480','莿桐',56,'120.5024','23.7612','雲林縣','莿桐鄉'),(211,'C0K490','古坑',91,'120.5598','23.6543','雲林縣','古坑鄉'),(212,'C0K500','元長',12,'120.315','23.6498','雲林縣','元長鄉'),(213,'C0K510','水林',10,'120.246','23.5729','雲林縣','水林鄉'),(214,'C0K520','雲林東勢',10,'120.1548','23.6744','雲林縣','東勢鄉'),(215,'C0K530','臺西',12,'120.1976','23.7015','雲林縣','台西鄉'),(216,'C0K550','蔦松',15,'120.2297','23.5143','雲林縣','水林鄉'),(217,'C0K560','棋山',117,'120.6034','23.6865','雲林縣','古坑鄉'),(218,'C0K580','高鐵雲林',26,'120.4179','23.7375','雲林縣','虎尾鎮'),(219,'C0M410','馬頭山',245,'120.582','23.3244','嘉義縣','大埔鄉'),(220,'C0M520','東後寮',15,'120.2481','23.3699','嘉義縣','義竹鄉'),(221,'C0M530','奮起湖',1385,'120.6993','23.4939','嘉義縣','竹崎鄉'),(222,'C0M640','中埔',155,'120.5229','23.4254','嘉義縣','中埔鄉'),(223,'C0M650','朴子',20,'120.239','23.4346','嘉義縣','朴子市'),(224,'C0M660','溪口',40,'120.4036','23.6041','嘉義縣','溪口鄉'),(225,'C0M670','大林',43,'120.4584','23.6006','嘉義縣','大林鎮'),(226,'C0M680','太保',37,'120.3315','23.4551','嘉義縣','太保市'),(227,'C0M690','水上',33,'120.3889','23.4197','嘉義縣','水上鄉'),(228,'C0M700','竹崎',150,'120.5555','23.5262','嘉義縣','竹崎鄉'),(229,'C0M710','東石',15,'120.1539','23.4589','嘉義縣','東石鄉'),(230,'C0M720','番路',225,'120.5542','23.4647','嘉義縣','番路鄉'),(231,'C0M730','嘉義市東區',40,'120.4605','23.4577','嘉義市','親水路123 號'),(232,'C0M740','六腳',15,'120.2906','23.4929','嘉義縣','六腳鄉'),(233,'C0M750','布袋',10,'120.1678','23.3809','嘉義縣','布袋鎮'),(234,'C0M760','民雄',40,'120.4285','23.5518','嘉義縣','民雄鄉'),(235,'C0M770','嘉義梅山',164,'120.5556','23.5854','嘉義縣','梅山鄉'),(236,'C0M780','鹿草',30,'120.3084','23.4113','嘉義縣','鹿草鄉'),(237,'C0M790','新港',15,'120.3457','23.5533','嘉義縣','新港鄉'),(238,'C0M800','茶山',440,'120.6648','23.2991','嘉義縣','阿里山鄉'),(239,'C0M810','里佳',1354,'120.7166','23.3891','嘉義縣','阿里山鄉'),(240,'C0M820','達邦',980,'120.7495','23.454','嘉義縣','阿里山鄉'),(241,'C0M830','山美',540,'120.6682','23.3838','嘉義縣','阿里山鄉'),(242,'C0M850','表湖',695,'120.6417','23.2419','嘉義縣','大埔鄉'),(243,'C0O810','曾文',161,'120.4973','23.2197','臺南市','楠西區'),(244,'C0O830','北寮',127,'120.495','23.0796','臺南市','南化區'),(245,'C0O840','王爺宮',134,'120.4009','23.2221','臺南市','六甲區'),(246,'C0O860','大內',38,'120.3608','23.1189','臺南市','大內區'),(247,'C0O900','善化',9,'120.2972','23.1129','臺南市','善化區'),(248,'C0O930','玉井',69,'120.4606','23.126','臺南市','玉井區'),(249,'C0O950','安南',4,'120.1449','23.0767','臺南市','安南區'),(250,'C0O960','崎頂',112,'120.3693','22.9595','臺南市','龍崎區'),(251,'C0O970','虎頭埤',71,'120.3479','23.0214','臺南市','新化區'),(252,'C0O980','新市',18,'120.2982','23.0616','臺南市','新市'),(253,'C0O990','媽廟',18,'120.2935','22.9918','臺南市','歸仁區'),(254,'C0R100','尾寮山',1006,'120.6839','22.8331','屏東縣','三地門鄉'),(255,'C0R130','阿禮',1040,'120.7437','22.7429','屏東縣','霧台鄉'),(256,'C0R140','瑪家',740,'120.6866','22.6829','屏東縣','瑪家鄉'),(257,'C0R150','三地門',105,'120.6399','22.7099','屏東縣','內埔鄉'),(258,'C0R160','鹽埔新圍',45,'120.5308','22.7396','屏東縣','鹽埔鄉'),(259,'C0R170','屏東',26,'120.4941','22.6603','屏東縣','屏東市'),(260,'C0R190','赤山',32,'120.6143','22.5923','屏東縣','萬巒鄉'),(261,'C0R220','潮州',23,'120.54','22.5344','屏東縣','潮州鎮'),(262,'C0R240','來義',87,'120.6251','22.5273','屏東縣','萬巒鄉'),(263,'C0R260','春日',76,'120.6283','22.3704','屏東縣','春日鄉'),(264,'C0R270','琉球嶼',51,'120.3622','22.3322','屏東縣','琉球鄉'),(265,'C0R280','檳榔',242,'120.8368','22.0761','屏東縣','滿州鄉'),(266,'C0R320','車城',7,'120.7161','22.074','屏東縣','車城鄉'),(267,'C0R341','牡丹',230,'120.7926','22.13','屏東縣','199縣'),(268,'C0R350','貓鼻頭',35,'120.7358','21.9218','屏東縣','恆春鎮'),(269,'C0R440','大漢山',1654,'120.7532','22.4053','屏東縣','春日鄉'),(270,'C0R470','高樹',103,'120.6008','22.8264','屏東縣','高樹鄉'),(271,'C0R480','長治',57,'120.5426','22.6931','屏東縣','長治鄉'),(272,'C0R490','九如',49,'120.4905','22.7405','屏東縣','九如鄉'),(273,'C0R510','萬丹',31,'120.4904','22.5878','屏東縣','萬丹鄉'),(274,'C0R520','崁頂',18,'120.5069','22.5148','屏東縣','崁頂鄉'),(275,'C0R530','林邊',16,'120.51','22.4308','屏東縣','林邊鄉'),(276,'C0R540','佳冬',17,'120.5524','22.4195','屏東縣','佳冬鄉'),(277,'C0R550','新埤',38,'120.5829','22.4679','屏東縣','新埤鄉'),(278,'C0R560','新園',22,'120.4616','22.5434','屏東縣','新園鄉'),(279,'C0R570','麟洛',37,'120.5272','22.6508','屏東縣','麟洛鄉'),(280,'C0R580','南州',10,'120.5027','22.4859','屏東縣','南州鄉'),(281,'C0R590','里港',72,'120.4946','22.7792','屏東縣','里港鄉'),(282,'C0R600','舊泰武',766,'120.6649','22.5882','屏東縣','泰武鄉'),(283,'C0R620','墾雷',34,'120.8553','21.9008','屏東縣','恆春鎮'),(284,'C0R640','東港',21,'120.4407','22.4625','屏東縣','東港鎮'),(285,'C0R650','竹田',29,'120.5434','22.5849','屏東縣','竹田鄉'),(286,'C0R660','枋寮',20,'120.5906','22.3677','屏東縣','枋寮鄉'),(287,'C0R670','楓港',26,'120.6922','22.1901','屏東縣','枋山鄉'),(288,'C0R680','佳樂水',13,'120.8616','21.9936','屏東縣','滿州鄉'),(289,'C0R690','墾丁',348,'120.8103','21.9668','屏東縣','恆春鎮'),(290,'C0R700','枋山',19,'120.6611','22.2468','屏東縣','枋山鄉'),(291,'C0R720','旭海',214,'120.8876','22.2054','屏東縣','牡丹鄉'),(292,'C0S660','下馬',794,'121.0703','23.1504','臺東縣','海端鄉'),(293,'C0S680','紅葉山',1659,'121.0392','22.9198','臺東縣','延平鄉'),(294,'C0S690','太麻里',522,'120.9853','22.609','臺東縣','太麻里鄉'),(295,'C0S700','知本',507,'121.0056','22.6849','臺東縣','卑南鄉'),(296,'C0S710','鹿野',382,'121.123','22.9177','臺東縣','鹿野鄉'),(297,'C0S730','綠島',110,'121.4753','22.6672','臺東縣','綠島鄉'),(298,'C0S740','池上',289,'121.2095','23.1196','臺東縣','池上鄉'),(299,'C0S750','向陽',2280,'120.9861','23.2484','臺東縣','海端鄉'),(300,'C0S760','紅石',1621,'121.1262','23.0691','臺東縣','海端鄉'),(301,'C0S770','大溪山',375,'120.9433','22.4785','臺東縣','太麻里鄉'),(302,'C0S790','金崙',236,'120.9669','22.5381','臺東縣','太麻里鄉'),(303,'C0S810','東河',65,'121.304','22.9727','臺東縣','東河鄉'),(304,'C0S830','長濱',288,'121.412','23.2868','臺東縣','長濱鄉'),(305,'C0S840','南田',22,'120.8892','22.2797','臺東縣','達仁鄉'),(306,'C0S890','關山',238,'121.175','23.0395','臺東縣','關山鎮'),(307,'C0S900','蘭嶼高中',27,'121.5121','22.0491','臺東縣','蘭嶼鄉'),(308,'C0S910','蘭嶼燈塔',212,'121.4951','22.083','臺東縣','蘭嶼鄉'),(309,'C0S920','金峰嘉蘭',133,'120.9609','22.5988','臺東縣','金峰鄉'),(310,'C0S930','延平',248,'121.0841','22.9026','臺東縣','臺東縣延平鄉'),(311,'C0S940','石寧山',150,'121.4066','23.2238','臺東縣','長濱鄉'),(312,'C0S950','七塊厝',415,'121.2299','22.9545','臺東縣','東河鄉'),(313,'C0S960','香蘭',32,'120.9934','22.5876','臺東縣','太麻里鄉'),(314,'C0S970','加津林',19,'120.9269','22.4162','臺東縣','大武鄉'),(315,'C0S980','勝林山',903,'120.8938','22.4304','臺東縣','達仁鄉'),(316,'C0S990','山豬窟',409,'120.8574','22.3186','臺東縣','大武鄉'),(317,'C0SA00','歷坵',466,'120.8919','22.521','臺東縣','金峰鄉'),(318,'C0SA10','檳榔四格山',411,'121.1093','22.81','臺東縣','卑南鄉'),(319,'C0SA20','金崙山',857,'120.9597','22.5674','臺東縣','太麻里鄉'),(320,'C0SA30','都歷',93,'121.3236','23.0203','臺東縣','成功鎮'),(321,'C0SA40','瑞和',200,'121.1567','22.9744','臺東縣','鹿野鄉'),(322,'C0SA80','土坂',136,'120.8875','22.4529','臺東縣','達仁鄉'),(323,'C0T790','大禹嶺',2830,'121.3161','24.1861','花蓮縣','秀林鄉'),(324,'C0T820','天祥',550,'121.4956','24.1796','花蓮縣','秀林鄉'),(325,'C0T870','鯉魚潭',135,'121.5089','23.9356','花蓮縣','壽豐鄉'),(326,'C0T900','西林',160,'121.4415','23.8119','花蓮縣','萬榮鄉'),(327,'C0T960','光復',120,'121.425','23.6607','花蓮縣','光復鄉'),(328,'C0T9A0','月眉山',498,'121.5398','23.8099','花蓮縣','壽豐鄉'),(329,'C0T9B0','水源',558,'121.5372','23.9919','花蓮縣','秀林鄉'),(330,'C0T9D0','和中',8,'121.741','24.2668','花蓮縣','秀林鄉'),(331,'C0T9E0','大坑',415,'121.582','23.8806','花蓮縣','壽豐鄉'),(332,'C0T9F0','水璉',251,'121.5425','23.7971','花蓮縣','壽豐鄉'),(333,'C0T9G0','鳳林山',605,'121.4201','23.7353','花蓮縣','鳳林鎮'),(334,'C0T9H0','加路蘭山',725,'121.5274','23.6829','花蓮縣','豐濱鄉'),(335,'C0T9I0','豐濱',152,'121.5148','23.5839','花蓮縣','豐濱鄉'),(336,'C0T9M0','靜浦',92,'121.495','23.4552','花蓮縣','豐濱鄉'),(337,'C0T9N0','富里',261,'121.2494','23.1716','花蓮縣','富里鄉'),(338,'C0U520','雙連埤',517,'121.6413','24.753','宜蘭縣','員山鄉'),(339,'C0U600','礁溪',10,'121.7655','24.8175','宜蘭縣','礁溪鄉'),(340,'C0U650','玉蘭',442,'121.5871','24.6753','宜蘭縣','大同鄉'),(341,'C0U710','太平山',1942,'121.5257','24.5055','宜蘭縣','大同鄉'),(342,'C0U720','南山',1260,'121.3817','24.4374','宜蘭縣','大同鄉'),(343,'C0U750','龜山島',398,'121.9531','24.8417','宜蘭縣','頭城鎮'),(344,'C0U760','東澳',22,'121.8332','24.522','宜蘭縣','南澳鄉'),(345,'C0U770','南澳',5,'121.8102','24.4494','宜蘭縣','南澳鄉'),(346,'C0U780','五結',15,'121.7979','24.6864','宜蘭縣','五結鄉'),(347,'C0U860','頭城',5,'121.8308','24.8532','宜蘭縣','頭城鎮'),(348,'C0U870','大礁溪',474,'121.6751','24.791','宜蘭縣','礁溪鄉'),(349,'C0U890','三星',116,'121.653','24.6681','宜蘭縣','三星鄉'),(350,'C0U900','內城',63,'121.6877','24.7181','宜蘭縣','員山鄉'),(351,'C0U910','冬山',17,'121.7937','24.6337','宜蘭縣','冬山鄉'),(352,'C0U940','羅東',25,'121.7493','24.6818','宜蘭縣','羅東鎮'),(353,'C0U950','鶯子嶺',1012,'121.7924','24.8975','宜蘭縣','頭城鎮'),(354,'C0U960','翠峰湖',1885,'121.608','24.5109','宜蘭縣','大同鄉'),(355,'C0U970','大福',7,'121.8139','24.8006','宜蘭縣','壯圍鄉'),(356,'C0U980','坪林石牌',573,'121.774','24.8648','宜蘭縣','頭城鎮'),(357,'C0U990','員山',31,'121.7225','24.7444','宜蘭縣','員山鄉'),(358,'C0UA00','土場',392,'121.4953','24.5765','宜蘭縣','大同鄉'),(359,'C0UA10','鴛鴦湖',1711,'121.4122','24.5903','宜蘭縣','大同鄉'),(360,'C0UA20','多加屯',2619,'121.3732','24.3686','宜蘭縣','大同鄉'),(361,'C0UA30','白嶺',1397,'121.519','24.5278','宜蘭縣','大同鄉'),(362,'C0UA40','西德山',1121,'121.7526','24.5606','宜蘭縣','南澳鄉'),(363,'C0UA50','西帽山',808,'121.8026','24.5554','宜蘭縣','南澳鄉'),(364,'C0UA60','樟樹山',566,'121.7833','24.4139','宜蘭縣','南澳鄉'),(365,'C0UA70','桃源谷',547,'121.8889','24.9626','宜蘭縣','頭城鎮'),(366,'C0V210','復興',734,'120.8061','23.2224','高雄市','桃源區'),(367,'C0V250','甲仙',298,'120.5918','23.0801','高雄市','甲仙區'),(368,'C0V260','月眉',126,'120.5399','22.971','高雄市','杉林區'),(369,'C0V310','美濃',46,'120.5192','22.8987','高雄市','美濃區'),(370,'C0V350','溪埔',36,'120.4468','22.7386','高雄市','大樹區'),(371,'C0V360','內門',94,'120.4668','22.9755','高雄市','內門區'),(372,'C0V370','古亭坑',74,'120.4019','22.8932','高雄市','田寮區'),(373,'C0V400','阿公店',56,'120.3555','22.8042','高雄市','燕巢區'),(374,'C0V440','鳳山',27,'120.3561','22.6467','高雄市','鳳山區'),(375,'C0V450','鳳森',51,'120.3926','22.5451','高雄市','小港區'),(376,'C0V490','新興',20,'120.2988','22.6274','高雄市','新興區'),(377,'C0V500','旗津',6,'120.2859','22.5886','高雄市','旗津區'),(378,'C0V530','阿蓮',34,'120.3275','22.8832','高雄市','阿蓮區'),(379,'C0V610','梓官',22,'120.2672','22.7606','高雄市','梓官區'),(380,'C0V620','永安',18,'120.2369','22.8232','高雄市','永安區'),(381,'C0V630','茄萣',19,'120.1826','22.9066','高雄市','茄萣區'),(382,'C0V640','湖內',35,'120.2445','22.8871','高雄市','湖內區'),(383,'C0V650','彌陀',28,'120.2464','22.7838','高雄市','彌陀區'),(384,'C0V660','岡山',25,'120.295','22.7971','高雄市','岡山區'),(385,'C0V670','楠梓',20,'120.286','22.7198','高雄市','楠梓區'),(386,'C0V680','仁武',40,'120.3477','22.7011','高雄市','仁武區'),(387,'C0V690','鼓山',30,'120.2756','22.6233','高雄市','鼓山區'),(388,'C0V700','三民',24,'120.3112','22.645','高雄市','三民區'),(389,'C0V710','苓雅',34,'120.3307','22.6227','高雄市','苓雅區'),(390,'C0V720','林園',15,'120.3945','22.5077','高雄市','林園區'),(391,'C0V730','大寮',33,'120.3957','22.6056','高雄市','大寮區'),(392,'C0V740','旗山',60,'120.4836','22.8886','高雄市','旗山區'),(393,'C0V750','路竹',50,'120.2594','22.855','高雄市','路竹區'),(394,'C0V760','橋頭',30,'120.3058','22.7578','高雄市','橋頭區'),(395,'C0V770','大社',26,'120.3466','22.7303','高雄市','大社區'),(396,'C0V790','萬山',410,'120.6881','22.9059','高雄市','茂林區'),(397,'C0V800','六龜',256,'120.6336','22.9979','高雄市','六龜區'),(398,'C0V810','左營',32,'120.2849','22.6749','高雄市','左營區'),(399,'C0V820','小林',441,'120.6333','23.1484','高雄市','甲仙區'),(400,'C0W110','東莒',16,'119.9807','25.9652','連江縣','莒光鄉'),(401,'C0W120','西嶼',58,'119.4684','23.5626','澎湖縣','西嶼鄉'),(402,'C0W130','花嶼',18,'119.3228','23.4001','澎湖縣','望安鄉'),(403,'C0W140','金沙',21,'118.4088','24.4883','金門縣','金沙鎮'),(404,'C0W150','金寧',42,'118.329','24.4577','金門縣','金寧鄉'),(405,'C0W160','烏坵',49,'119.4496','24.9944','金門縣','烏坵鄉'),(406,'C0W170','東引',42,'120.4836','26.3588','連江縣','東引鄉'),(407,'C0X050','東河',25,'120.3856','23.2966','臺南市','東山區'),(408,'C0X060','下營',19,'120.2563','23.227','臺南市','下營區'),(409,'C0X080','佳里',2,'120.1451','23.173','臺南市','佳里區'),(410,'C0X100','臺南市北區',10,'120.1942','23.0104','臺南市','北區'),(411,'C0X110','臺南市南區',20,'120.1884','22.9612','臺南市','南區'),(412,'C0X120','麻豆',28,'120.2486','23.1833','臺南市','麻豆區'),(413,'C0X130','官田',27,'120.3154','23.1932','臺南市','官田區'),(414,'C0X140','西港',17,'120.2031','23.1256','臺南市','西港區'),(415,'C0X150','安定',18,'120.2278','23.1026','臺南市','安定區'),(416,'C0X160','仁德',26,'120.2577','22.9683','臺南市','仁德區'),(417,'C0X170','關廟',50,'120.3278','22.963','臺南市','關廟區'),(418,'C0X180','山上',62,'120.3633','23.0757','臺南市','山上區'),(419,'C0X190','安平',10,'120.1522','22.9932','臺南市','安平區'),(420,'C0X200','左鎮',61,'120.4085','23.0568','臺南市','左鎮'),(421,'C0X210','白河',38,'120.4144','23.3475','臺南市','白河區'),(422,'C0X220','學甲',26,'120.1822','23.2304','臺南市','學甲區'),(423,'C0X230','鹽水',29,'120.2476','23.2726','臺南市','鹽水區'),(424,'C0X240','關子嶺',394,'120.508','23.3312','臺南市','白河區'),(425,'C0X250','新營',33,'120.3167','23.3107','臺南市','新營區'),(426,'C0X260','後壁',39,'120.3623','23.3664','臺南市','後壁區'),(427,'C0X280','將軍',22,'120.1358','23.215','臺南市','將軍區'),(428,'C0X290','北門',10,'120.1255','23.2678','臺南市','北門區'),(429,'C0X300','鹿寮',70,'120.4773','23.386','臺南市','白河區'),(430,'C0X310','七股',9,'120.0863','23.1473','臺南市','七股區'),(431,'C0X320','柳營',30,'120.3753','23.2533','臺南市','柳營區'),(432,'C0Z020','明里',211,'121.2623','23.2087','花蓮縣','富里鄉'),(433,'C0Z050','佳心',824,'121.2132','23.3457','花蓮縣','卓溪鄉'),(434,'C0Z061','玉里',174,'121.3397','23.3215','花蓮縣','玉里鎮'),(435,'C0Z070','舞鶴',247,'121.3741','23.4681','花蓮縣','瑞穗鄉'),(436,'C0Z080','富源',298,'121.3782','23.5876','花蓮縣','光復鄉'),(437,'C0Z100','東華',36,'121.5498','23.8953','花蓮縣','壽豐鄉'),(438,'C0Z150','吉安光華',27,'121.5952','23.9309','花蓮縣','吉安鄉'),(439,'C0Z160','鳳林',124,'121.4534','23.7461','花蓮縣','鳳林鎮'),(440,'C0Z170','卓溪',199,'121.3033','23.3443','花蓮縣','卓溪鄉'),(441,'C0Z180','新城',34,'121.6045','24.0395','花蓮縣','新城鄉'),(442,'C0Z190','富世',62,'121.6297','24.1474','花蓮縣','秀林鄉'),(443,'C0Z200','萬榮',153,'121.4201','23.7092','花蓮縣','鳳林鎮'),(444,'C0Z210','瑞穗',126,'121.3902','23.5239','花蓮縣','瑞穗鄉'),(445,'C0Z220','和平林道',589,'121.6563','24.3439','花蓮縣','秀林鄉'),(446,'C0Z230','和平',31,'121.7701','24.3072','花蓮縣','秀林鄉'),(447,'C0Z250','瑞穗林道',1124,'121.3069','23.4928','花蓮縣','卓溪鄉'),(448,'C0Z270','蕃薯寮',343,'121.5401','23.7384','花蓮縣','壽豐鄉'),(449,'C0Z280','德武',224,'121.4107','23.4743','花蓮縣','玉里鎮'),(450,'C0Z290','赤柯山',946,'121.3829','23.3689','花蓮縣','玉里鎮'),(451,'C0Z300','東里',182,'121.3055','23.2685','花蓮縣','富里鄉'),(452,'C0Z310','清水斷崖',59,'121.6891','24.2183','花蓮縣','秀林鄉'),(453,'C0Z320','清水林道',646,'121.1883','23.2713','花蓮縣','卓溪鄉'),(454,'C0Z330','安通山',488,'121.3485','23.2907','花蓮縣','玉里鎮'),(455,'C1A630','下盆',527,'121.5386','24.771','新北市','烏來區'),(456,'C1A9N0','四十份',435,'121.5933','24.9342','新北市','新店區'),(457,'C1AC50','關渡',111,'121.4693','25.1335','臺北市','北投區'),(458,'C1C510','水尾',106,'121.0872','24.9401','桃園市','楊梅區'),(459,'C1D380','新埔',65,'121.0383','24.8475','新竹縣','新埔鎮'),(460,'C1D400','鳥嘴山',839,'121.2839','24.7191','新竹縣','尖石鄉'),(461,'C1D410','白蘭',1290,'121.0799','24.5794','新竹縣','五峰鄉'),(462,'C1D420','太閣南',1279,'121.1606','24.6328','新竹縣','五峰鄉'),(463,'C1D630','飛鳳山',462,'121.1192','24.7665','新竹縣','芎林鄉'),(464,'C1D640','外坪(五指山)',718,'121.091','24.6444','新竹縣','北埔鄉'),(465,'C1E451','象鼻',950,'120.9402','24.3686','苗栗縣','泰安鄉'),(466,'C1E461','松安',1325,'120.986','24.398','苗栗縣','泰安鄉'),(467,'C1E480','鳳美',576,'121.0347','24.5548','苗栗縣','南庄鄉'),(468,'C1E511','新開',326,'120.827','24.3477','苗栗縣','大湖鄉'),(469,'C1E601','南勢',125,'120.7348','24.5725','苗栗縣','後龍鎮'),(470,'C1E670','南礦',1209,'121.0028','24.5383','苗栗縣','南庄鄉'),(471,'C1E681','南勢山',977,'120.9238','24.4217','苗栗縣','泰安鄉'),(472,'C1E691','南湖',786,'120.8375','24.4014','苗栗縣','大湖鄉'),(473,'C1E701','八卦',737,'120.9276','24.4918','苗栗縣','泰安鄉'),(474,'C1E711','馬拉邦山',990,'120.9017','24.3673','苗栗縣','大湖鄉'),(475,'C1E721','泰安',1409,'120.968','24.489','苗栗縣','泰安鄉'),(476,'C1E770','公館',83,'120.8308','24.5269','苗栗縣','公館鄉'),(477,'C1F871','上谷關',1000,'121.0186','24.2035','臺中市','和平區'),(478,'C1F891','稍來',2205,'121.0011','24.2657','臺中市','和平區'),(479,'C1F911','新伯公',417,'120.8411','24.2214','臺中市','東勢區'),(480,'C1F941','雪嶺',2620,'121.0266','24.2806','臺中市','和平區'),(481,'C1F9B1','桐林',130,'120.7352','24.0662','臺中市','霧峰區'),(482,'C1F9C1','白冷',610,'120.9299','24.1828','臺中市','和平區'),(483,'C1F9D1','白毛台',639,'120.8869','24.1583','臺中市','新社區'),(484,'C1F9E1','龍安',563,'120.832','24.1605','臺中市','新社區'),(485,'C1F9F1','伯公龍',500,'120.849','24.2724','臺中市','東勢區'),(486,'C1F9G1','慶福山',810,'120.8484','24.1809','臺中市','東勢區'),(487,'C1F9H1','烏石坑',930,'120.9458','24.2791','臺中市','和平區'),(488,'C1F9J1','清水林',723,'120.8204','24.0712','臺中市','太平區'),(489,'C1F9W0','德基',1970,'121.1903','24.2548','臺中市','和平區'),(490,'C1G691','下水埔',110,'120.5676','23.8161','彰化縣','溪州鄉'),(491,'C1H000','翠峰',2454,'121.2052','24.1094','南投縣','仁愛鄉'),(492,'C1H860','瑞岩',1840,'121.1835','24.1238','南投縣','仁愛鄉'),(493,'C1H900','清流',934,'120.963','24.0808','南投縣','仁愛鄉'),(494,'C1H920','長豐',736,'120.8799','24.102','南投縣','國姓鄉'),(495,'C1H941','雙冬',630,'120.8022','23.9674','南投縣','草屯鎮'),(496,'C1H971','六分寮',428,'120.6378','23.9251','南投縣','南投市'),(497,'C1H9B1','阿眉',1710,'120.9947','24.1263','南投縣','仁愛鄉'),(498,'C1I020','萬大',1120,'121.1323','23.9798','南投縣','仁愛鄉'),(499,'C1I030','武界',948,'121.0525','23.9132','南投縣','仁愛鄉'),(500,'C1I050','丹大',2568,'121.1411','23.7537','南投縣','信義鄉'),(501,'C1I070','和社',825,'120.8889','23.5911','南投縣','信義鄉'),(502,'C1I101','溪頭',1810,'120.8076','23.6618','南投縣','鹿谷鄉'),(503,'C1I121','大鞍',1515,'120.76','23.6784','南投縣','竹山鎮'),(504,'C1I131','桶頭',311,'120.6541','23.6419','南投縣','竹山鎮'),(505,'C1I140','卡奈托灣',1700,'121.0879','23.7544','南投縣','信義鄉'),(506,'C1I150','青雲',393,'120.9494','23.7934','南投縣','信義鄉'),(507,'C1I201','中心崙',677,'120.7121','23.7287','南投縣','竹山鎮'),(508,'C1I211','蘆竹湳',529,'120.812','23.934','南投縣','中寮鄉'),(509,'C1I220','樟湖',1098,'120.847','23.9053','南投縣','國姓鄉'),(510,'C1I230','九份二山',837,'120.845','23.9619','南投縣','國姓鄉'),(511,'C1I240','外大坪',725,'120.9179','23.9587','南投縣','埔里鎮'),(512,'C1I250','鯉潭',732,'120.9911','23.9619','南投縣','埔里鎮'),(513,'C1I260','北坑',601,'121.0069','23.9246','南投縣','埔里鎮'),(514,'C1I280','埔中',439,'120.6426','23.8208','南投縣','名間鄉'),(515,'C1I290','豐丘',1151,'120.8874','23.6682','南投縣','信義鄉'),(516,'C1I310','西巒',1033,'120.884','23.7545','南投縣','信義鄉'),(517,'C1I320','奧萬大',1275,'121.1786','23.953','南投縣','仁愛鄉'),(518,'C1I330','楓樹林',1266,'121.0761','23.9868','南投縣','仁愛鄉'),(519,'C1I340','新興橋',897,'120.8687','23.5633','南投縣','信義鄉'),(520,'C1I400','凌霄',1399,'121.0045','24.0188','南投縣','仁愛鄉'),(521,'C1I430','翠華',2415,'121.2243','24.192','南投縣','仁愛鄉'),(522,'C1I440','新高口',2540,'120.8789','23.4787','南投縣','信義鄉'),(523,'C1I450','望鄉山',3025,'120.9443','23.5942','南投縣','信義鄉'),(524,'C1I470','杉林溪',1680,'120.7864','23.6395','南投縣','竹山鎮'),(525,'C1I500','大尖山',2017,'120.9949','23.8586','南投縣','仁愛鄉'),(526,'C1I510','線浸林道',1208,'120.833','23.7615','南投縣','鹿谷鄉'),(527,'C1K540','口湖',15,'120.1805','23.5853','雲林縣','口湖鄉'),(528,'C1M390','龍美',1090,'120.6544','23.4067','嘉義縣','番路鄉'),(529,'C1M400','菜瓜坪',369,'120.5761','23.2519','嘉義縣','大埔鄉'),(530,'C1M480','獨立山',840,'120.6078','23.537','嘉義縣','竹崎鄉'),(531,'C1M600','頭凍',986,'120.6033','23.4064','嘉義縣','番路鄉'),(532,'C1M610','石磐龍',1083,'120.6635','23.4966','嘉義縣','竹崎鄉'),(533,'C1M620','瑞里',1252,'120.6752','23.5451','嘉義縣','梅山鄉'),(534,'C1M640','十字',1567,'120.7537','23.4922','嘉義縣','阿里山鄉'),(535,'C1N001','沙崙',24,'120.3094','22.9355','臺南市','歸仁區'),(536,'C1O850','環湖',44,'120.4186','23.1486','臺南市','大內區'),(537,'C1O870','大棟山',1249,'120.5223','23.3116','臺南市','白河區'),(538,'C1O880','關山',223,'120.5941','23.1734','臺南市','南化區'),(539,'C1O921','楠西',115,'120.4841','23.1835','臺南市','楠西區'),(540,'C1R110','口社',110,'120.6452','22.7701','屏東縣','三地門鄉'),(541,'C1R120','上德文',820,'120.7044','22.7633','屏東縣','三地門鄉'),(542,'C1R250','力里',92,'120.6292','22.4281','屏東縣','春日鄉'),(543,'C1R290','石門山',260,'120.7566','22.1126','屏東縣','牡丹鄉'),(544,'C1R610','西大武山',1828,'120.7322','22.6177','屏東縣','泰武鄉'),(545,'C1R630','龍泉',60,'120.5909','22.667','屏東縣','內埔鄉'),(546,'C1S670','摩天',1580,'121.027','23.1995','臺東縣','海端鄉'),(547,'C1S800','華源',80,'121.0233','22.6579','臺東縣','太麻里鄉'),(548,'C1S820','金峰',177,'120.9332','22.591','臺東縣','金峰鄉'),(549,'C1S850','豐南',489,'121.2624','23.1221','花蓮縣','富里鄉'),(550,'C1S860','利嘉',516,'121.0505','22.8094','臺東縣','卑南鄉'),(551,'C1S870','南美山',222,'121.3823','23.1503','臺東縣','成功鎮'),(552,'C1S880','壽卡',474,'120.8589','22.2389','臺東縣','達仁鄉'),(553,'C1SA70','都蘭',62,'121.2269','22.8779','臺東縣','東河鄉'),(554,'C1T800','洛韶',1260,'121.454','24.2046','花蓮縣','秀林鄉'),(555,'C1T810','慈恩',2049,'121.3884','24.192','花蓮縣','秀林鄉'),(556,'C1T830','布洛灣',675,'121.5713','24.1718','花蓮縣','秀林鄉'),(557,'C1T920','中興',68,'121.4987','23.7695','花蓮縣','壽豐鄉'),(558,'C1T940','大觀',539,'121.3731','23.7142','花蓮縣','萬榮鄉'),(559,'C1T950','太安',1050,'121.3701','23.6667','花蓮縣','萬榮鄉'),(560,'C1T970','大農',183,'121.4133','23.6152','花蓮縣','光復鄉'),(561,'C1T980','龍澗',1306,'121.4113','24.0233','花蓮縣','秀林鄉'),(562,'C1T990','高寮',128,'121.3568','23.3942','花蓮縣','玉里鎮'),(563,'C1TA00','太魯閣',94,'121.6236','24.1577','花蓮縣','秀林鄉'),(564,'C1U501','牛鬥',280,'121.5737','24.6378','宜蘭縣','大同鄉'),(565,'C1U670','寒溪',105,'121.7169','24.634','宜蘭縣','冬山鄉'),(566,'C1U690','新寮',101,'121.7513','24.6256','宜蘭縣','冬山鄉'),(567,'C1U830','烏石鼻',618,'121.8394','24.4827','宜蘭縣','蘇澳鎮'),(568,'C1U840','東澳嶺',750,'121.8485','24.5378','宜蘭縣','南澳鄉'),(569,'C1U850','觀音海岸',665,'121.7786','24.3832','宜蘭縣','南澳鄉'),(570,'C1U880','北關',8,'121.8719','24.9065','宜蘭縣','頭城鎮'),(571,'C1U920','思源',2085,'121.3472','24.3931','宜蘭縣','大同鄉'),(572,'C1V160','達卡努瓦',1040,'120.7053','23.2798','高雄市','那瑪夏區'),(573,'C1V170','排雲',3690,'120.9541','23.4636','高雄市','桃源區'),(574,'C1V190','南天池',2700,'120.9118','23.274','高雄市','桃源區'),(575,'C1V200','梅山',870,'120.8236','23.2684','高雄市','桃源區'),(576,'C1V220','小關山',1781,'120.8136','23.1542','高雄市','桃源區'),(577,'C1V231','高中',731,'120.7167','23.1349','高雄市','桃源區'),(578,'C1V300','御油山',1637,'120.7154','23.002','高雄市','桃源區'),(579,'C1V340','大津',190,'120.646','22.8883','高雄市','六龜區'),(580,'C1V390','尖山',60,'120.3678','22.8132','高雄市','燕巢區'),(581,'C1V570','吉東',82,'120.5454','22.8542','高雄市','美濃區'),(582,'C1V580','溪南(特生中心)',1656,'120.7885','23.085','高雄市','桃源區'),(583,'C1V590','新發',741,'120.6461','23.057','高雄市','六龜區'),(584,'C1V600','藤枝',1561,'120.757','23.072','高雄市','桃源區'),(585,'C1V780','多納林道',1050,'120.7379','22.888','高雄市','茂林區'),(586,'C1X040','東原',232,'120.4638','23.2916','臺南市','東山區'),(587,'C1Z030','紅葉',218,'121.3388','23.4931','花蓮縣','萬榮鄉'),(588,'C1Z040','立山',434,'121.3274','23.4434','花蓮縣','卓溪鄉'),(589,'C1Z110','三棧',680,'121.60501','24.11557','花蓮縣','秀林鄉'),(590,'C1Z120','壽豐',62,'121.50808','23.870853','花蓮縣','壽豐鄉'),(591,'C1Z130','銅門',187,'121.4928','23.9657','花蓮縣','秀林鄉'),(592,'C1Z140','荖溪',950,'121.4596','23.8906','花蓮縣','秀林鄉'),(593,'C1Z240','中平林道',1163,'121.2676','23.4212','花蓮縣','卓溪鄉');
/*!40000 ALTER TABLE `weather_locationCode_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weight`
--

DROP TABLE IF EXISTS `weight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weight` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `weight_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weight`
--

LOCK TABLES `weight` WRITE;
/*!40000 ALTER TABLE `weight` DISABLE KEYS */;
/*!40000 ALTER TABLE `weight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `windspeed`
--

DROP TABLE IF EXISTS `windspeed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `windspeed` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  UNIQUE KEY `UC_field_time` (`field`,`timestamp`),
  CONSTRAINT `windspeed_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `windspeed`
--

LOCK TABLES `windspeed` WRITE;
/*!40000 ALTER TABLE `windspeed` DISABLE KEYS */;
/*!40000 ALTER TABLE `windspeed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `windspeed_daily`
--

DROP TABLE IF EXISTS `windspeed_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `windspeed_daily` (
  `win_date` date NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`win_date`,`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `windspeed_daily`
--

LOCK TABLES `windspeed_daily` WRITE;
/*!40000 ALTER TABLE `windspeed_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `windspeed_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wtq`
--

DROP TABLE IF EXISTS `wtq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wtq` (
  `timestamp` datetime NOT NULL,
  `field` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`field`),
  KEY `field` (`field`),
  CONSTRAINT `wtq_ibfk_1` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wtq`
--

LOCK TABLES `wtq` WRITE;
/*!40000 ALTER TABLE `wtq` DISABLE KEYS */;
/*!40000 ALTER TABLE `wtq` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-11 15:40:23
