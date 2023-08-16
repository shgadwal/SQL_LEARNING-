CREATE DATABASE  IF NOT EXISTS `food_db`;
USE `food_db`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: food_db
-- ------------------------------------------------------
-- Server version	8.0.30



--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;

CREATE TABLE `items` (
  `name` varchar(45) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;

INSERT INTO `items` VALUES ('vada pav',10.00),('dosa',20.00),('sandwich',16.00);

UNLOCK TABLES;

--
-- Table structure for table `variants`
--

DROP TABLE IF EXISTS `variants`;

CREATE TABLE `variants` (
  `variant_name` varchar(45) NOT NULL,
  `variant_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`variant_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Dumping data for table `variants`
--

LOCK TABLES `variants` WRITE;

INSERT INTO `variants` VALUES ('butter',5.00),('cheese',10.00),('plain',0.00);

UNLOCK TABLES;


-- Dump completed on 2022-09-01 12:45:24
