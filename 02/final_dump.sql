-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 172.16.7.85    Database: univer008_saushkin
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.24.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `director` (
  `#director` int NOT NULL AUTO_INCREMENT,
  `dirname` varchar(25) NOT NULL,
  `facult` varchar(10) NOT NULL,
  PRIMARY KEY (`#director`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` VALUES (1,'Классов','ИФМИТО'),(2,'Петров','ИД'),(3,'Иванов','ИФМИТО'),(4,'Гейбука','ИФМИТО');
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `#employee` int NOT NULL AUTO_INCREMENT,
  `empname` varchar(25) NOT NULL,
  `director_#director` int NOT NULL,
  `post_postname` varchar(15) NOT NULL,
  PRIMARY KEY (`#employee`),
  KEY `fk_employee_director1_idx` (`director_#director`),
  KEY `fk_employee_post1_idx` (`post_postname`),
  CONSTRAINT `fk_employee_director1` FOREIGN KEY (`director_#director`) REFERENCES `director` (`#director`),
  CONSTRAINT `fk_employee_post1` FOREIGN KEY (`post_postname`) REFERENCES `post` (`postname`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'ПЕТРОВ',2,'СТ.ПР'),(2,'КЛАССОВ',1,'ДОЦЕНТ'),(3,'СТУПИН',3,'ДОЦЕНТ'),(4,'РОЗОВ ',4,'АССИСТЕНТ'),(5,'БАЛАШОВ',2,'ПРОФЕССОР');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_has_subject`
--

DROP TABLE IF EXISTS `employee_has_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_has_subject` (
  `employee_#employee` int NOT NULL,
  `subject_#subj` int NOT NULL,
  PRIMARY KEY (`employee_#employee`,`subject_#subj`),
  KEY `fk_employee_has_subject_subject1_idx` (`subject_#subj`),
  KEY `fk_employee_has_subject_employee1_idx` (`employee_#employee`),
  CONSTRAINT `fk_employee_has_subject_employee1` FOREIGN KEY (`employee_#employee`) REFERENCES `employee` (`#employee`),
  CONSTRAINT `fk_employee_has_subject_subject1` FOREIGN KEY (`subject_#subj`) REFERENCES `subject` (`#subj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_has_subject`
--

LOCK TABLES `employee_has_subject` WRITE;
/*!40000 ALTER TABLE `employee_has_subject` DISABLE KEYS */;
INSERT INTO `employee_has_subject` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `employee_has_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group` (
  `#gr` char(10) NOT NULL,
  `napr` mediumtext NOT NULL,
  `profil` mediumtext,
  PRIMARY KEY (`#gr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES ('1','ИСИТ','ИСИТВО'),('2','АТ','ОВСАЙНТ'),('3','МО','МО'),('4','МИ','МИ');
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lessontype`
--

DROP TABLE IF EXISTS `lessontype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lessontype` (
  `lessonname` varchar(12) NOT NULL,
  PRIMARY KEY (`lessonname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessontype`
--

LOCK TABLES `lessontype` WRITE;
/*!40000 ALTER TABLE `lessontype` DISABLE KEYS */;
INSERT INTO `lessontype` VALUES ('ЛАБ.Р'),('ЛЕКЦИЯ'),('СЕМИНАР');
/*!40000 ALTER TABLE `lessontype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `postname` varchar(15) NOT NULL,
  PRIMARY KEY (`postname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES ('АССИСТЕНТ'),('ДОЦЕНТ'),('ПРОФЕССОР'),('СТ.ПР');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `#week` int NOT NULL,
  `day` char(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `group_#gr` char(10) NOT NULL,
  `subject_#subj` int NOT NULL,
  `lessontype_lessonname` varchar(12) NOT NULL,
  `#room` char(3) NOT NULL,
  PRIMARY KEY (`#week`,`day`,`group_#gr`,`subject_#subj`,`lessontype_lessonname`),
  KEY `fk_group_has_subject_subject1_idx` (`subject_#subj`),
  KEY `fk_group_has_subject_group1_idx` (`group_#gr`),
  KEY `fk_group_has_subject_lessontype1_idx` (`lessontype_lessonname`),
  CONSTRAINT `fk_group_has_subject_group1` FOREIGN KEY (`group_#gr`) REFERENCES `group` (`#gr`),
  CONSTRAINT `fk_group_has_subject_lessontype1` FOREIGN KEY (`lessontype_lessonname`) REFERENCES `lessontype` (`lessonname`),
  CONSTRAINT `fk_group_has_subject_subject1` FOREIGN KEY (`subject_#subj`) REFERENCES `subject` (`#subj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,'ВТ','2',4,'СЕМИНАР','405'),(1,'ПН','1',1,'ЛАБ.Р','301'),(1,'ПН','1',1,'ЛЕКЦИЯ','301'),(1,'ПН','3',1,'ЛАБ.Р','301'),(1,'СР','2',2,'ЛАБ.Р','204'),(1,'СР','3',5,'ЛЕКЦИЯ','208'),(1,'СР','4',5,'ЛЕКЦИЯ','208'),(2,'ВТ','4',4,'ЛАБ.Р','105'),(2,'ПН','3',1,'ЛАБ.Р','301'),(2,'ПН','4',1,'СЕМИНАР','301'),(2,'ПТ','3',3,'ЛЕКЦИЯ','205'),(2,'СР','1',5,'ЛЕКЦИЯ','208'),(2,'СР','1',5,'СЕМИНАР','208'),(2,'ЧТ','1',5,'ЛАБ.Р','208'),(2,'ЧТ','2',5,'ЛЕКЦИЯ','208');
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `#stud` int NOT NULL AUTO_INCREMENT,
  `studname` varchar(25) NOT NULL,
  `director_#director` int NOT NULL,
  `group_#gr` char(10) DEFAULT NULL,
  PRIMARY KEY (`#stud`),
  KEY `fk_student_director_idx` (`director_#director`),
  KEY `fk_student_group1_idx` (`group_#gr`),
  CONSTRAINT `fk_student_director` FOREIGN KEY (`director_#director`) REFERENCES `director` (`#director`),
  CONSTRAINT `fk_student_group1` FOREIGN KEY (`group_#gr`) REFERENCES `group` (`#gr`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'САУШКИН',1,'2'),(2,'ДЬЯЧЕНКО',3,'3'),(3,'БЕЛЬШ',2,'4'),(4,'МЕЗЕНЦЕВ',1,'1'),(5,'УСТИНОВ',4,'2'),(6,'ШУЛЬМИН',2,'4'),(7,'ЛИСИЦА',1,'1'),(8,'ЖУКОВ',3,'3'),(9,'ШИШКИНА',4,'3'),(10,'БАТРАКОВ',4,'2'),(11,'КРАВЦОВ',1,'1'),(12,'ГРИЦЕНКО',1,'1');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `#subj` int NOT NULL AUTO_INCREMENT,
  `subjname` varchar(85) NOT NULL,
  `subjinfo` mediumtext,
  PRIMARY KEY (`#subj`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'ИИ',NULL),(2,'МУЛЬТИМЕДИА',NULL),(3,'ЯЗЫКИ ПРОГРАММИРОВАНИЯ',NULL),(4,'АЛГЕБРА',NULL),(5,'ВР',NULL);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vedomost`
--

DROP TABLE IF EXISTS `vedomost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vedomost` (
  `date` date NOT NULL,
  `student_#stud` int NOT NULL,
  `employee_#employee` int NOT NULL,
  `subject_#subj` int NOT NULL,
  `mark` varchar(14) NOT NULL,
  PRIMARY KEY (`date`,`student_#stud`,`employee_#employee`,`subject_#subj`),
  KEY `fk_student_has_employee_employee1_idx` (`employee_#employee`),
  KEY `fk_student_has_employee_student1_idx` (`student_#stud`),
  KEY `fk_student_has_employee_subject1_idx` (`subject_#subj`),
  CONSTRAINT `fk_student_has_employee_employee1` FOREIGN KEY (`employee_#employee`) REFERENCES `employee` (`#employee`),
  CONSTRAINT `fk_student_has_employee_student1` FOREIGN KEY (`student_#stud`) REFERENCES `student` (`#stud`),
  CONSTRAINT `fk_student_has_employee_subject1` FOREIGN KEY (`subject_#subj`) REFERENCES `subject` (`#subj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vedomost`
--

LOCK TABLES `vedomost` WRITE;
/*!40000 ALTER TABLE `vedomost` DISABLE KEYS */;
INSERT INTO `vedomost` VALUES ('2024-03-15',1,2,5,'Незачет'),('2024-03-15',2,3,1,'Зачет'),('2024-03-15',3,4,3,'Незачет'),('2024-03-15',4,2,4,'Зачет'),('2024-03-15',5,1,2,'Незачет'),('2024-03-15',6,3,1,'Зачет'),('2024-03-15',7,4,5,'Незачет'),('2024-03-15',8,2,2,'Зачет'),('2024-03-15',9,1,1,'Незачет');
/*!40000 ALTER TABLE `vedomost` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-02 13:20:30
