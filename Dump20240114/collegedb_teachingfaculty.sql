-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: collegedb
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `teachingfaculty`
--

DROP TABLE IF EXISTS `teachingfaculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachingfaculty` (
  `TeacherID` varchar(45) NOT NULL,
  `TeacherName` varchar(45) NOT NULL,
  `TeacherQualification` varchar(45) DEFAULT NULL,
  `Subjects` varchar(45) DEFAULT NULL,
  `LinkedIn` varchar(45) DEFAULT NULL,
  `TeacherProfilePhoto` varchar(100) DEFAULT NULL,
  `TeacherResume` blob,
  PRIMARY KEY (`TeacherID`),
  UNIQUE KEY `Teacher ID_UNIQUE` (`TeacherID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachingfaculty`
--

LOCK TABLES `teachingfaculty` WRITE;
/*!40000 ALTER TABLE `teachingfaculty` DISABLE KEYS */;
INSERT INTO `teachingfaculty` VALUES ('','','','','','',''),('100','Omkar','BSC','CPP','https://www.linkedin.com/in/dev-vicky-29j/','Design a (((3D  861b9655-1553-4c09-abf6-9ca6dcfe839e.png',_binary 'My resume (1).pdf'),('CS101','Vivek','BSC','Java','','VICKY29 (1).png',_binary 'My resume (6).pdf'),('CS102','Vivek','BSC','Java','www.linkedin.com/in/dev-vicky-29j','Design a (((3D  861b9655-1553-4c09-abf6-9ca6dcfe839e.png',_binary 'My resume (3).pdf'),('CS103','Pratik','BCS','SQL','https://www.linkedin.com/in/dev-vicky-29j/','Design a (((3D  861b9655-1553-4c09-abf6-9ca6dcfe839e.png',_binary 'My resume (6).pdf'),('CS105','Narayan','BSC','C++','https://www.linkedin.com/in/dev-vicky-29j/','Design a (((3D  861b9655-1553-4c09-abf6-9ca6dcfe839e.png',_binary 'My resume (6).pdf'),('CS202','Vivek Deshmukh','BSC','Adv Java','','VICKY29 (1).png',''),('CS207','Vivek','BSC','Java','','VICKY29 (1).png',''),('CS209','Vivek','BSC','Java','','VICKY29 (1).png','');
/*!40000 ALTER TABLE `teachingfaculty` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-14 21:39:08
