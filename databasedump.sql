-- MySQL dump 10.13  Distrib 8.0.12, for osx10.13 (x86_64)
--
-- Host: localhost    Database: Car_sharing
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Car`
--

DROP TABLE IF EXISTS `Car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Car` (
  `registration_number` varchar(255) NOT NULL,
  `car_model` int(11) NOT NULL,
  `location` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `charge_level` int(11) NOT NULL,
  `busy` tinyint(4) NOT NULL,
  `condition` tinyint(4) NOT NULL,
  `is_charging` int(11) NOT NULL,
  PRIMARY KEY (`registration_number`),
  KEY `car_model` (`car_model`),
  CONSTRAINT `car_ibfk_1` FOREIGN KEY (`car_model`) REFERENCES `car_model` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Car`
--

LOCK TABLES `Car` WRITE;
/*!40000 ALTER TABLE `Car` DISABLE KEYS */;
INSERT INTO `Car` VALUES ('AN123B',2,'uni,2','red',5000,0,0,0),('AN546F',3,'uni, 5','red',4000,0,0,0),('E235BA',3,'uni, 2','skyblue',3000,0,0,0),('K234EK',2,'uni, 2','sky blue',3000,1,0,0),('P234OH',2,'Kazahstan','space earl grey',2000,1,0,0),('X123UY',1,'uni, 1','violet',4000,0,1,0);
/*!40000 ALTER TABLE `Car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Car_model`
--

DROP TABLE IF EXISTS `Car_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Car_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `plug_type` varchar(255) NOT NULL,
  `full_charge` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Car_model`
--

LOCK TABLES `Car_model` WRITE;
/*!40000 ALTER TABLE `Car_model` DISABLE KEYS */;
INSERT INTO `Car_model` VALUES (1,'Ford','regular','Focus','Volkswagen standard',10000),(2,'BMW','regular','M3','tesla',12000),(3,'Gaz','truck','el','tesla',12000),(4,'Volkswagen','Microbus','Transporter','Volkswagen standard',12000);
/*!40000 ALTER TABLE `Car_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Car_order`
--

DROP TABLE IF EXISTS `Car_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Car_order` (
  `customer_id` int(11) NOT NULL,
  `car_id` varchar(255) NOT NULL,
  `point_a` varchar(255) NOT NULL,
  `point_b` varchar(255) NOT NULL,
  `date_time` datetime NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `distance` float NOT NULL,
  `trip_duration` float NOT NULL,
  KEY `customer_id` (`customer_id`),
  KEY `car_id` (`car_id`),
  CONSTRAINT `car_order_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `car_order_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `car` (`registration_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Car_order`
--

LOCK TABLES `Car_order` WRITE;
/*!40000 ALTER TABLE `Car_order` DISABLE KEYS */;
INSERT INTO `Car_order` VALUES (3,'X123UY','225 N Willow St, Telluride, CO, 81435','2003 Jay St, Walnut Ridge, AR, 72476','2011-11-11 11:11:11',400,1.5,25),(1,'P234OH','55 Hoover Holw, Garrett, KY, 41630','95 Royal Dr, Carson City, NV, 89706','2018-10-11 12:15:17',300,0.7,30),(2,'AN123B','225 N Willow St, Telluride, CO, 81435','2003 Jay St, Walnut Ridge, AR, 72476','2018-10-04 12:15:17',500,4,20.5),(4,'P234OH','55 Hoover Holw, Garrett, KY, 41630','95 Royal Dr, Carson City, NV, 89706','2018-11-12 12:15:17',300,0.1,30),(2,'E235BA','505 Center Pl, Williamsport, PA, 17701','1541 Owenwood Cir, Sandy, UT, 84092','2018-10-05 15:54:56',500,3,17.5),(2,'AN546F','55 Hoover Holw, Garrett, KY, 41630','2003 Jay St, Walnut Ridge, AR, 72476','2018-10-07 13:44:34',400,7,25),(2,'AN546F','55 Hoover Holw, Garrett, KY, 41630','2003 Jay St, Walnut Ridge, AR, 72476','2018-10-07 13:44:34',400,7,25);
/*!40000 ALTER TABLE `Car_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Car_part`
--

DROP TABLE IF EXISTS `Car_part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Car_part` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(255) NOT NULL,
  `cost` float NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Car_part`
--

LOCK TABLES `Car_part` WRITE;
/*!40000 ALTER TABLE `Car_part` DISABLE KEYS */;
INSERT INTO `Car_part` VALUES (1,'Red',90,'Brake disc'),(2,'Blue',100,'Front Right Door'),(3,'Pink',67,'Wheel'),(4,'Black',130,'Seat Cover');
/*!40000 ALTER TABLE `Car_part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Charging_station`
--

DROP TABLE IF EXISTS `Charging_station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Charging_station` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(255) NOT NULL,
  `cost_mah` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Charging_station`
--

LOCK TABLES `Charging_station` WRITE;
/*!40000 ALTER TABLE `Charging_station` DISABLE KEYS */;
INSERT INTO `Charging_station` VALUES (1,'1205 Mcgregor Rd, Nortonville, KY, 42442',5.03),(2,'55 Carriage Ln, Englishtown, NJ, 07726',4.63),(3,'103 Williams St, Reidsville, GA, 30453',5.64),(4,'200 N Main St, Holden, MO, 64040',4.94),(5,'503 Chautauqua Ln, Dexter, MO, 63841',4.76);
/*!40000 ALTER TABLE `Charging_station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `residence` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (1,'1225 N Willow St, Telluride, CO, 81435','Anna Lvova','selkie','an.lvova@innopolis.ru','12345678'),(2,'9500 Fm 210, Olney, TX, 76374','Kamil Saitov','Sariell','k.saitov@innopolis.ru','12345678'),(3,'345 Jerry Ln, Erwin, NC, 28339','Timerlan Nasyrov','Timerlanchik','t.nasyrov@innopolis.ru','12345678'),(4,'2003 Jay St, Walnut Ridge, AR, 72476','Andrey Chertkov','Andryusha','a.chertkov@innopolis.ru','12345678');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fixes`
--

DROP TABLE IF EXISTS `Fixes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Fixes` (
  `time_and_date` datetime NOT NULL,
  `car_id` varchar(255) NOT NULL,
  `workshop_id` int(11) NOT NULL,
  `part_id` int(11) DEFAULT NULL,
  KEY `part_id` (`part_id`),
  KEY `car_id` (`car_id`),
  KEY `workshop_id` (`workshop_id`),
  CONSTRAINT `fixes_ibfk_1` FOREIGN KEY (`part_id`) REFERENCES `car_part` (`id`),
  CONSTRAINT `fixes_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `car` (`registration_number`),
  CONSTRAINT `fixes_ibfk_3` FOREIGN KEY (`workshop_id`) REFERENCES `workshop` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fixes`
--

LOCK TABLES `Fixes` WRITE;
/*!40000 ALTER TABLE `Fixes` DISABLE KEYS */;
INSERT INTO `Fixes` VALUES ('2017-11-08 01:29:30','X123UY',2,1),('2017-11-03 12:29:30','K234EK',3,2),('2017-11-05 17:12:05','X123UY',1,3),('2017-11-08 01:29:30','AN123B',2,3),('2017-11-08 01:29:30','AN123B',2,1),('2017-11-08 01:29:30','AN123B',3,3);
/*!40000 ALTER TABLE `Fixes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Has_available`
--

DROP TABLE IF EXISTS `Has_available`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Has_available` (
  `workshop_id` int(11) NOT NULL,
  `car_part_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  KEY `workshop_id` (`workshop_id`),
  KEY `car_part_id` (`car_part_id`),
  CONSTRAINT `has_available_ibfk_1` FOREIGN KEY (`workshop_id`) REFERENCES `workshop` (`id`),
  CONSTRAINT `has_available_ibfk_2` FOREIGN KEY (`car_part_id`) REFERENCES `car_part` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Has_available`
--

LOCK TABLES `Has_available` WRITE;
/*!40000 ALTER TABLE `Has_available` DISABLE KEYS */;
INSERT INTO `Has_available` VALUES (1,1,4),(2,3,7),(3,2,4);
/*!40000 ALTER TABLE `Has_available` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Part_order`
--

DROP TABLE IF EXISTS `Part_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Part_order` (
  `provider_id` int(11) NOT NULL,
  `workshop_id` int(11) NOT NULL,
  `part_id` int(11) NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  KEY `provider_id` (`provider_id`),
  KEY `workshop_id` (`workshop_id`),
  KEY `part_id` (`part_id`),
  CONSTRAINT `part_order_ibfk_1` FOREIGN KEY (`provider_id`) REFERENCES `part_provider` (`id`),
  CONSTRAINT `part_order_ibfk_2` FOREIGN KEY (`workshop_id`) REFERENCES `workshop` (`id`),
  CONSTRAINT `part_order_ibfk_3` FOREIGN KEY (`part_id`) REFERENCES `car_part` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Part_order`
--

LOCK TABLES `Part_order` WRITE;
/*!40000 ALTER TABLE `Part_order` DISABLE KEYS */;
INSERT INTO `Part_order` VALUES (3,2,4,10),(1,3,2,4),(2,1,3,7);
/*!40000 ALTER TABLE `Part_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Part_provider`
--

DROP TABLE IF EXISTS `Part_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Part_provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Part_provider`
--

LOCK TABLES `Part_provider` WRITE;
/*!40000 ALTER TABLE `Part_provider` DISABLE KEYS */;
INSERT INTO `Part_provider` VALUES (1,'55 Hoover Holw, Garrett, KY, 41630','(606) 358-0302','JJohnson Group'),(2,'220 Thomas Creek Dr, Newark, AR, 72562','(870) 799-3255','The Smith Corporation'),(3,'1541 Owenwood Cir, Sandy, UT, 84092','(801) 572-6446','BRENT'),(4,'95 Royal Dr, Carson City, NV, 89706','(940) 563-3108','K(Enterprise)mil');
/*!40000 ALTER TABLE `Part_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Provides`
--

DROP TABLE IF EXISTS `Provides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Provides` (
  `car_part_id` int(11) NOT NULL,
  `part_drovider` int(11) NOT NULL,
  KEY `car_part_id` (`car_part_id`),
  KEY `part_drovider` (`part_drovider`),
  CONSTRAINT `provides_ibfk_1` FOREIGN KEY (`car_part_id`) REFERENCES `car_part` (`id`),
  CONSTRAINT `provides_ibfk_2` FOREIGN KEY (`part_drovider`) REFERENCES `part_provider` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Provides`
--

LOCK TABLES `Provides` WRITE;
/*!40000 ALTER TABLE `Provides` DISABLE KEYS */;
INSERT INTO `Provides` VALUES (1,2),(2,4),(3,1),(4,3);
/*!40000 ALTER TABLE `Provides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Repairable`
--

DROP TABLE IF EXISTS `Repairable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Repairable` (
  `model_id` int(11) NOT NULL,
  `part_id` int(11) NOT NULL,
  KEY `model_id` (`model_id`),
  KEY `part_id` (`part_id`),
  CONSTRAINT `repairable_ibfk_1` FOREIGN KEY (`model_id`) REFERENCES `car_model` (`id`),
  CONSTRAINT `repairable_ibfk_2` FOREIGN KEY (`part_id`) REFERENCES `car_part` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Repairable`
--

LOCK TABLES `Repairable` WRITE;
/*!40000 ALTER TABLE `Repairable` DISABLE KEYS */;
INSERT INTO `Repairable` VALUES (1,4),(3,2),(2,4);
/*!40000 ALTER TABLE `Repairable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Socket`
--

DROP TABLE IF EXISTS `Socket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Socket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voltage` float NOT NULL,
  `station_id` int(11) NOT NULL,
  `cur_charging` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `station_id` (`station_id`),
  CONSTRAINT `socket_ibfk_1` FOREIGN KEY (`station_id`) REFERENCES `charging_station` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Socket`
--

LOCK TABLES `Socket` WRITE;
/*!40000 ALTER TABLE `Socket` DISABLE KEYS */;
INSERT INTO `Socket` VALUES (1,10.65,1,0),(2,7.65,1,0),(3,15.66,1,0),(4,20.76,2,0),(5,14.53,2,0),(6,14.65,2,0),(7,10.55,2,1),(8,12.35,3,0),(9,6.47,3,0),(10,7.64,4,0),(11,12.32,4,0),(12,13.83,4,0),(13,23.54,4,0),(14,26.25,5,1),(15,11.43,5,0);
/*!40000 ALTER TABLE `Socket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Socket_car`
--

DROP TABLE IF EXISTS `Socket_car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Socket_car` (
  `socket_id` int(11) NOT NULL,
  `car_id` varchar(255) NOT NULL,
  `time_date` datetime NOT NULL,
  `mah_charged` float NOT NULL,
  KEY `socket_id` (`socket_id`),
  KEY `car_id` (`car_id`),
  CONSTRAINT `socket_car_ibfk_1` FOREIGN KEY (`socket_id`) REFERENCES `socket` (`id`),
  CONSTRAINT `socket_car_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `car` (`registration_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Socket_car`
--

LOCK TABLES `Socket_car` WRITE;
/*!40000 ALTER TABLE `Socket_car` DISABLE KEYS */;
INSERT INTO `Socket_car` VALUES (7,'K234EK','2018-11-12 16:53:26',8),(14,'P234OH','2018-10-11 12:23:43',400);
/*!40000 ALTER TABLE `Socket_car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Station_time`
--

DROP TABLE IF EXISTS `Station_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Station_time` (
  `station_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `00h_01h` int(11) NOT NULL DEFAULT '0',
  `01h_02h` int(11) NOT NULL DEFAULT '0',
  `02h_03h` int(11) NOT NULL DEFAULT '0',
  `03h_04h` int(11) NOT NULL DEFAULT '0',
  `04h_05h` int(11) NOT NULL DEFAULT '0',
  `05h_06h` int(11) NOT NULL DEFAULT '0',
  `06h_07h` int(11) NOT NULL DEFAULT '0',
  `07h_08h` int(11) NOT NULL DEFAULT '0',
  `08h_09h` int(11) NOT NULL DEFAULT '0',
  `09h_10h` int(11) NOT NULL DEFAULT '0',
  `10h_11h` int(11) NOT NULL DEFAULT '0',
  `11h_12h` int(11) NOT NULL DEFAULT '0',
  `12h_13h` int(11) NOT NULL DEFAULT '0',
  `13h_14h` int(11) NOT NULL DEFAULT '0',
  `14h_15h` int(11) NOT NULL DEFAULT '0',
  `15h_16h` int(11) NOT NULL DEFAULT '0',
  `16h_17h` int(11) NOT NULL DEFAULT '0',
  `17h_18h` int(11) NOT NULL DEFAULT '0',
  `18h_19h` int(11) NOT NULL DEFAULT '0',
  `19h_20h` int(11) NOT NULL DEFAULT '0',
  `20h_21h` int(11) NOT NULL DEFAULT '0',
  `21h_22h` int(11) NOT NULL DEFAULT '0',
  `22h_23h` int(11) NOT NULL DEFAULT '0',
  `23h_24h` int(11) NOT NULL DEFAULT '0',
  KEY `station_id` (`station_id`),
  CONSTRAINT `station_time_ibfk_1` FOREIGN KEY (`station_id`) REFERENCES `charging_station` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Station_time`
--

LOCK TABLES `Station_time` WRITE;
/*!40000 ALTER TABLE `Station_time` DISABLE KEYS */;
INSERT INTO `Station_time` VALUES (1,'2017-08-14',3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3),(2,'2015-05-20',3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3),(3,'2016-12-11',3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3);
/*!40000 ALTER TABLE `Station_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Workshop`
--

DROP TABLE IF EXISTS `Workshop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Workshop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Workshop`
--

LOCK TABLES `Workshop` WRITE;
/*!40000 ALTER TABLE `Workshop` DISABLE KEYS */;
INSERT INTO `Workshop` VALUES (1,'Califirnication, 3'),(2,'Califirnication, 2'),(3,'Califirnication, 7');
/*!40000 ALTER TABLE `Workshop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Workshop_time`
--

DROP TABLE IF EXISTS `Workshop_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Workshop_time` (
  `workshop_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `00h_01h` int(11) NOT NULL DEFAULT '0',
  `01h_02h` int(11) NOT NULL DEFAULT '0',
  `02h_03h` int(11) NOT NULL DEFAULT '0',
  `03h_04h` int(11) NOT NULL DEFAULT '0',
  `04h_05h` int(11) NOT NULL DEFAULT '0',
  `05h_06h` int(11) NOT NULL DEFAULT '0',
  `06h_07h` int(11) NOT NULL DEFAULT '0',
  `07h_08h` int(11) NOT NULL DEFAULT '0',
  `08h_09h` int(11) NOT NULL DEFAULT '0',
  `09h_10h` int(11) NOT NULL DEFAULT '0',
  `10h_11h` int(11) NOT NULL DEFAULT '0',
  `11h_12h` int(11) NOT NULL DEFAULT '0',
  `12h_13h` int(11) NOT NULL DEFAULT '0',
  `13h_14h` int(11) NOT NULL DEFAULT '0',
  `14h_15h` int(11) NOT NULL DEFAULT '0',
  `15h_16h` int(11) NOT NULL DEFAULT '0',
  `16h_17h` int(11) NOT NULL DEFAULT '0',
  `17h_18h` int(11) NOT NULL DEFAULT '0',
  `18h_19h` int(11) NOT NULL DEFAULT '0',
  `19h_20h` int(11) NOT NULL DEFAULT '0',
  `20h_21h` int(11) NOT NULL DEFAULT '0',
  `21h_22h` int(11) NOT NULL DEFAULT '0',
  `22h_23h` int(11) NOT NULL DEFAULT '0',
  `23h_24h` int(11) NOT NULL DEFAULT '0',
  KEY `workshop_id` (`workshop_id`),
  CONSTRAINT `workshop_time_ibfk_1` FOREIGN KEY (`workshop_id`) REFERENCES `workshop` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Workshop_time`
--

LOCK TABLES `Workshop_time` WRITE;
/*!40000 ALTER TABLE `Workshop_time` DISABLE KEYS */;
INSERT INTO `Workshop_time` VALUES (1,'2017-08-14',3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3),(2,'2015-05-20',3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3),(3,'2016-12-11',3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3);
/*!40000 ALTER TABLE `Workshop_time` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-26 23:46:35
