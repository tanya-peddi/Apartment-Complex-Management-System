-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: apartmentmanagementsystem
-- ------------------------------------------------------
-- Server version	5.7.15-log

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `admin_id` int(10) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  PRIMARY KEY (`admin_id`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `user_login` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Tanya','Peddi','ptan123@uncc.edu','6787896978');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apartment`
--

DROP TABLE IF EXISTS `apartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apartment` (
  `apart_no` varchar(20) NOT NULL,
  `no_of_rooms` int(5) NOT NULL,
  `floor_level` int(5) NOT NULL,
  `status` varchar(10) NOT NULL,
  `no_of_parking_permits` int(5) NOT NULL,
  PRIMARY KEY (`apart_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apartment`
--

LOCK TABLES `apartment` WRITE;
/*!40000 ALTER TABLE `apartment` DISABLE KEYS */;
/*!40000 ALTER TABLE `apartment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apartment_propmanager`
--

DROP TABLE IF EXISTS `apartment_propmanager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apartment_propmanager` (
  `apartment_number` varchar(20) NOT NULL,
  `property_mgr_id` int(10) NOT NULL,
  PRIMARY KEY (`apartment_number`,`property_mgr_id`),
  KEY ` propertymanager_id_idx` (`property_mgr_id`),
  CONSTRAINT ` propertymanager_id` FOREIGN KEY (`property_mgr_id`) REFERENCES `propertymanager` (`propertymanager_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `apart_no` FOREIGN KEY (`apartment_number`) REFERENCES `apartment` (`apart_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apartment_propmanager`
--

LOCK TABLES `apartment_propmanager` WRITE;
/*!40000 ALTER TABLE `apartment_propmanager` DISABLE KEYS */;
/*!40000 ALTER TABLE `apartment_propmanager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `employee_id` int(10) NOT NULL,
  `job_type` int(11) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `jbtype_idx` (`job_type`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `user_login` (`user_id`),
  CONSTRAINT `jbtype` FOREIGN KEY (`job_type`) REFERENCES `job_types` (`job_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_title` varchar(45) NOT NULL,
  `event_startdate` date NOT NULL,
  `event_enddate` date DEFAULT NULL,
  `event_location` varchar(45) NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_types`
--

DROP TABLE IF EXISTS `job_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_types` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_title` varchar(100) NOT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_types`
--

LOCK TABLES `job_types` WRITE;
/*!40000 ALTER TABLE `job_types` DISABLE KEYS */;
INSERT INTO `job_types` VALUES (1,'Landscaping/Gardening'),(2,'Handyman Services'),(3,'Interior/Exterior Painting'),(4,'Construction'),(5,'Cleaning Services'),(6,'Masonry/Tilework'),(7,'Remodeling'),(8,'Gutter Cleaning/Repair'),(9,'Electrical Services'),(10,'Plumbing'),(11,'Home Improvement');
/*!40000 ALTER TABLE `job_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_bill`
--

DROP TABLE IF EXISTS `maintenance_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenance_bill` (
  `bill_number` int(11) NOT NULL AUTO_INCREMENT,
  `apartment_number` varchar(20) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `amount_due` double DEFAULT NULL,
  `status_of_current_month` enum('Paid','Unpaid') DEFAULT NULL,
  PRIMARY KEY (`bill_number`),
  KEY `apartnumber_idx` (`apartment_number`),
  CONSTRAINT `apartnumber` FOREIGN KEY (`apartment_number`) REFERENCES `apartment` (`apart_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_bill`
--

LOCK TABLES `maintenance_bill` WRITE;
/*!40000 ALTER TABLE `maintenance_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenance_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `officestaff`
--

DROP TABLE IF EXISTS `officestaff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `officestaff` (
  `staff_id` int(10) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  PRIMARY KEY (`staff_id`),
  CONSTRAINT `officestaff_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `user_login` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `officestaff`
--

LOCK TABLES `officestaff` WRITE;
/*!40000 ALTER TABLE `officestaff` DISABLE KEYS */;
INSERT INTO `officestaff` VALUES (2,'Nagori','Nikhil','nik123@uncc.edu','7896786978');
/*!40000 ALTER TABLE `officestaff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parking`
--

DROP TABLE IF EXISTS `parking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parking` (
  `parking_permit_id` int(10) NOT NULL,
  `parking_lot_number` int(10) DEFAULT NULL,
  `apartment_no` varchar(20) NOT NULL,
  `resident_id` int(10) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`parking_permit_id`),
  KEY `apartment_no` (`apartment_no`),
  KEY `resident_id` (`resident_id`),
  CONSTRAINT `parking_ibfk_1` FOREIGN KEY (`apartment_no`) REFERENCES `apartment` (`apart_no`),
  CONSTRAINT `parking_ibfk_2` FOREIGN KEY (`resident_id`) REFERENCES `resident` (`resident_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parking`
--

LOCK TABLES `parking` WRITE;
/*!40000 ALTER TABLE `parking` DISABLE KEYS */;
/*!40000 ALTER TABLE `parking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parking_permit`
--

DROP TABLE IF EXISTS `parking_permit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parking_permit` (
  `parking_permit_id` int(11) NOT NULL,
  `apartment_number` varchar(20) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  PRIMARY KEY (`parking_permit_id`),
  KEY `apartnum_idx` (`apartment_number`),
  CONSTRAINT `apartnum` FOREIGN KEY (`apartment_number`) REFERENCES `apartment` (`apart_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parking_permit`
--

LOCK TABLES `parking_permit` WRITE;
/*!40000 ALTER TABLE `parking_permit` DISABLE KEYS */;
/*!40000 ALTER TABLE `parking_permit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parking_request`
--

DROP TABLE IF EXISTS `parking_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parking_request` (
  `parking_request_id` int(11) NOT NULL,
  `apartment_number` varchar(20) DEFAULT NULL,
  `requester_id` int(10) DEFAULT NULL,
  `status` enum('pending approval','approved') DEFAULT 'pending approval',
  PRIMARY KEY (`parking_request_id`),
  KEY `apt_num_idx` (`apartment_number`),
  KEY `req_id_idx` (`requester_id`),
  CONSTRAINT `apt_num` FOREIGN KEY (`apartment_number`) REFERENCES `apartment` (`apart_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `req_id` FOREIGN KEY (`requester_id`) REFERENCES `user_login` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parking_request`
--

LOCK TABLES `parking_request` WRITE;
/*!40000 ALTER TABLE `parking_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `parking_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parking_request_tenant`
--

DROP TABLE IF EXISTS `parking_request_tenant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parking_request_tenant` (
  `parking__req_tenant_id` int(11) NOT NULL,
  `apartment_number` varchar(20) DEFAULT NULL,
  `tenant_id` int(10) DEFAULT NULL,
  `Parking _Request_tenantcol` varchar(45) DEFAULT NULL,
  `status` enum('pending approval by property manager','pending approval by staff','approved') DEFAULT NULL,
  PRIMARY KEY (`parking__req_tenant_id`),
  KEY `aptnum_idx` (`apartment_number`),
  KEY `tenantid_idx` (`tenant_id`),
  CONSTRAINT `aptnum` FOREIGN KEY (`apartment_number`) REFERENCES `apartment` (`apart_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tenantid` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`tenant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parking_request_tenant`
--

LOCK TABLES `parking_request_tenant` WRITE;
/*!40000 ALTER TABLE `parking_request_tenant` DISABLE KEYS */;
/*!40000 ALTER TABLE `parking_request_tenant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permanentresident`
--

DROP TABLE IF EXISTS `permanentresident`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permanentresident` (
  `pr_id` int(10) NOT NULL,
  PRIMARY KEY (`pr_id`),
  CONSTRAINT `permanentresident_ibfk_1` FOREIGN KEY (`pr_id`) REFERENCES `resident` (`resident_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permanentresident`
--

LOCK TABLES `permanentresident` WRITE;
/*!40000 ALTER TABLE `permanentresident` DISABLE KEYS */;
/*!40000 ALTER TABLE `permanentresident` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propertymanager`
--

DROP TABLE IF EXISTS `propertymanager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propertymanager` (
  `propertymanager_id` int(10) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `phone_no` varchar(20) NOT NULL,
  PRIMARY KEY (`propertymanager_id`),
  CONSTRAINT `propertymanager_ibfk_1` FOREIGN KEY (`propertymanager_id`) REFERENCES `user_login` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propertymanager`
--

LOCK TABLES `propertymanager` WRITE;
/*!40000 ALTER TABLE `propertymanager` DISABLE KEYS */;
/*!40000 ALTER TABLE `propertymanager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rent`
--

DROP TABLE IF EXISTS `rent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rent` (
  `rent_id` int(11) NOT NULL,
  `tenant_id` int(10) DEFAULT NULL,
  `apartment_number` varchar(20) DEFAULT NULL,
  `rent_amount` double DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `payment_status` enum('Paid','Unpaid') DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`rent_id`),
  KEY `tenant_idx` (`tenant_id`),
  KEY `apartment_idx` (`apartment_number`),
  CONSTRAINT `apartment` FOREIGN KEY (`apartment_number`) REFERENCES `apartment` (`apart_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`tenant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rent`
--

LOCK TABLES `rent` WRITE;
/*!40000 ALTER TABLE `rent` DISABLE KEYS */;
/*!40000 ALTER TABLE `rent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resident`
--

DROP TABLE IF EXISTS `resident`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resident` (
  `resident_id` int(10) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `apt_no` varchar(20) NOT NULL,
  PRIMARY KEY (`resident_id`),
  KEY `apt_no` (`apt_no`),
  CONSTRAINT `resident_ibfk_1` FOREIGN KEY (`resident_id`) REFERENCES `user_login` (`user_id`),
  CONSTRAINT `resident_ibfk_2` FOREIGN KEY (`apt_no`) REFERENCES `apartment` (`apart_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resident`
--

LOCK TABLES `resident` WRITE;
/*!40000 ALTER TABLE `resident` DISABLE KEYS */;
/*!40000 ALTER TABLE `resident` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_request`
--

DROP TABLE IF EXISTS `service_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_request` (
  `service_request_id` int(10) NOT NULL AUTO_INCREMENT,
  `job_type_id` int(11) NOT NULL,
  `apartment_number` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Incomplete',
  `complaint_description` varchar(120) NOT NULL,
  `date_of_complaint` date NOT NULL,
  PRIMARY KEY (`service_request_id`),
  KEY `apart_no_idx` (`apartment_number`),
  KEY `job_id_idx` (`job_type_id`),
  CONSTRAINT `apart_nox` FOREIGN KEY (`apartment_number`) REFERENCES `apartment` (`apart_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `job_idx` FOREIGN KEY (`job_type_id`) REFERENCES `job_types` (`job_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_request`
--

LOCK TABLES `service_request` WRITE;
/*!40000 ALTER TABLE `service_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_request_assigned`
--

DROP TABLE IF EXISTS `service_request_assigned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_request_assigned` (
  `service_req_id` int(10) NOT NULL,
  `employee_assigned_id` int(10) NOT NULL,
  PRIMARY KEY (`service_req_id`,`employee_assigned_id`),
  KEY `employee_assign_idx` (`employee_assigned_id`),
  CONSTRAINT `employee_assign` FOREIGN KEY (`employee_assigned_id`) REFERENCES `employee` (`employee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `service_req` FOREIGN KEY (`service_req_id`) REFERENCES `service_request` (`service_request_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_request_assigned`
--

LOCK TABLES `service_request_assigned` WRITE;
/*!40000 ALTER TABLE `service_request_assigned` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_request_assigned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant`
--

DROP TABLE IF EXISTS `tenant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenant` (
  `tenant_id` int(10) NOT NULL,
  `propertymanager_id` int(10) NOT NULL,
  PRIMARY KEY (`tenant_id`),
  KEY `propertymanager_id` (`propertymanager_id`),
  CONSTRAINT `tenant_ibfk_1` FOREIGN KEY (`tenant_id`) REFERENCES `resident` (`resident_id`),
  CONSTRAINT `tenant_ibfk_2` FOREIGN KEY (`propertymanager_id`) REFERENCES `propertymanager` (`propertymanager_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant`
--

LOCK TABLES `tenant` WRITE;
/*!40000 ALTER TABLE `tenant` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_login`
--

DROP TABLE IF EXISTS `user_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_login` (
  `user_id` int(10) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `role_id` int(10) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `role_id_idx` (`role_id`),
  CONSTRAINT `role_id` FOREIGN KEY (`role_id`) REFERENCES `user_roles` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_login`
--

LOCK TABLES `user_login` WRITE;
/*!40000 ALTER TABLE `user_login` DISABLE KEYS */;
INSERT INTO `user_login` VALUES (1,'ptan123','ptan123',1),(2,'nik123','nik123',2);
/*!40000 ALTER TABLE `user_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_title` varchar(45) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,'admin'),(2,'office staff'),(3,'employee'),(4,'property manager'),(5,'resident');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-21  7:40:04
