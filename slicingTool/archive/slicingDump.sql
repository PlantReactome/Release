-- MySQL dump 10.15  Distrib 10.0.13-MariaDB, for Linux (x86_64)
--
-- Host: floret.cgrb.oregonstate.edu    Database: gk_central_011719
-- ------------------------------------------------------
-- Server version	5.5.47-MariaDB

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
-- Table structure for table `AbstractModifiedResidue`
--

DROP TABLE IF EXISTS `AbstractModifiedResidue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AbstractModifiedResidue` (
  `DB_ID` int(10) unsigned NOT NULL,
  `referenceSequence` int(10) unsigned DEFAULT NULL,
  `referenceSequence_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  KEY `referenceSequence` (`referenceSequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Affiliation`
--

DROP TABLE IF EXISTS `Affiliation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Affiliation` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `address` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`DB_ID`),
  KEY `address` (`address`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Affiliation_2_name`
--

DROP TABLE IF EXISTS `Affiliation_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Affiliation_2_name` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `name_rank` int(10) unsigned DEFAULT NULL,
  `name` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BlackBoxEvent`
--

DROP TABLE IF EXISTS `BlackBoxEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BlackBoxEvent` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `templateEvent` int(10) unsigned DEFAULT NULL,
  `templateEvent_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  KEY `templateEvent` (`templateEvent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Book`
--

DROP TABLE IF EXISTS `Book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Book` (
  `DB_ID` int(10) unsigned NOT NULL,
  `ISBN` mediumtext COLLATE utf8_unicode_ci,
  `chapterTitle` mediumtext COLLATE utf8_unicode_ci,
  `pages` mediumtext COLLATE utf8_unicode_ci,
  `publisher` int(10) unsigned DEFAULT NULL,
  `publisher_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` int(10) DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  KEY `ISBN` (`ISBN`(10)),
  KEY `chapterTitle` (`chapterTitle`(10)),
  KEY `pages` (`pages`(10)),
  KEY `publisher` (`publisher`),
  KEY `year` (`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Book_2_chapterAuthors`
--

DROP TABLE IF EXISTS `Book_2_chapterAuthors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Book_2_chapterAuthors` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `chapterAuthors_rank` int(10) unsigned DEFAULT NULL,
  `chapterAuthors` int(10) unsigned DEFAULT NULL,
  `chapterAuthors_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `chapterAuthors` (`chapterAuthors`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CandidateSet`
--

DROP TABLE IF EXISTS `CandidateSet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CandidateSet` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CandidateSet_2_hasCandidate`
--

DROP TABLE IF EXISTS `CandidateSet_2_hasCandidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CandidateSet_2_hasCandidate` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `hasCandidate_rank` int(10) unsigned DEFAULT NULL,
  `hasCandidate` int(10) unsigned DEFAULT NULL,
  `hasCandidate_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `hasCandidate` (`hasCandidate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CatalystActivity`
--

DROP TABLE IF EXISTS `CatalystActivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CatalystActivity` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `activity` int(10) unsigned DEFAULT NULL,
  `activity_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `physicalEntity` int(10) unsigned DEFAULT NULL,
  `physicalEntity_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  KEY `activity` (`activity`),
  KEY `physicalEntity` (`physicalEntity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CatalystActivity_2_activeUnit`
--

DROP TABLE IF EXISTS `CatalystActivity_2_activeUnit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CatalystActivity_2_activeUnit` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `activeUnit_rank` int(10) unsigned DEFAULT NULL,
  `activeUnit` int(10) unsigned DEFAULT NULL,
  `activeUnit_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `activeUnit` (`activeUnit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CatalystActivity_2_literatureReference`
--

DROP TABLE IF EXISTS `CatalystActivity_2_literatureReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CatalystActivity_2_literatureReference` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `literatureReference_rank` int(10) unsigned DEFAULT NULL,
  `literatureReference` int(10) unsigned DEFAULT NULL,
  `literatureReference_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `literatureReference` (`literatureReference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CellType`
--

DROP TABLE IF EXISTS `CellType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CellType` (
  `DB_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ChemicalDrug`
--

DROP TABLE IF EXISTS `ChemicalDrug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ChemicalDrug` (
  `DB_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Compartment`
--

DROP TABLE IF EXISTS `Compartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Compartment` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Complex`
--

DROP TABLE IF EXISTS `Complex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Complex` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `isChimeric` enum('TRUE','FALSE') COLLATE utf8_unicode_ci DEFAULT NULL,
  `stoichiometryKnown` enum('TRUE','FALSE') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  KEY `isChimeric` (`isChimeric`),
  KEY `stoichiometryKnown` (`stoichiometryKnown`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Complex_2_entityOnOtherCell`
--

DROP TABLE IF EXISTS `Complex_2_entityOnOtherCell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Complex_2_entityOnOtherCell` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `entityOnOtherCell_rank` int(10) unsigned DEFAULT NULL,
  `entityOnOtherCell` int(10) unsigned DEFAULT NULL,
  `entityOnOtherCell_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `entityOnOtherCell` (`entityOnOtherCell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Complex_2_hasComponent`
--

DROP TABLE IF EXISTS `Complex_2_hasComponent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Complex_2_hasComponent` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `hasComponent_rank` int(10) unsigned DEFAULT NULL,
  `hasComponent` int(10) unsigned DEFAULT NULL,
  `hasComponent_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `hasComponent` (`hasComponent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Complex_2_includedLocation`
--

DROP TABLE IF EXISTS `Complex_2_includedLocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Complex_2_includedLocation` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `includedLocation_rank` int(10) unsigned DEFAULT NULL,
  `includedLocation` int(10) unsigned DEFAULT NULL,
  `includedLocation_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `includedLocation` (`includedLocation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Complex_2_relatedSpecies`
--

DROP TABLE IF EXISTS `Complex_2_relatedSpecies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Complex_2_relatedSpecies` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `relatedSpecies_rank` int(10) unsigned DEFAULT NULL,
  `relatedSpecies` int(10) unsigned DEFAULT NULL,
  `relatedSpecies_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `relatedSpecies` (`relatedSpecies`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Complex_2_species`
--

DROP TABLE IF EXISTS `Complex_2_species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Complex_2_species` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `species_rank` int(10) unsigned DEFAULT NULL,
  `species` int(10) unsigned DEFAULT NULL,
  `species_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `species` (`species`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ControlledVocabulary`
--

DROP TABLE IF EXISTS `ControlledVocabulary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ControlledVocabulary` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `definition` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`DB_ID`),
  KEY `definition` (`definition`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ControlledVocabulary_2_name`
--

DROP TABLE IF EXISTS `ControlledVocabulary_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ControlledVocabulary_2_name` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `name_rank` int(10) unsigned DEFAULT NULL,
  `name` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CrosslinkedResidue`
--

DROP TABLE IF EXISTS `CrosslinkedResidue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CrosslinkedResidue` (
  `DB_ID` int(10) unsigned NOT NULL,
  `modification` int(10) unsigned DEFAULT NULL,
  `modification_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  KEY `modification` (`modification`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CrosslinkedResidue_2_secondCoordinate`
--

DROP TABLE IF EXISTS `CrosslinkedResidue_2_secondCoordinate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CrosslinkedResidue_2_secondCoordinate` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `secondCoordinate_rank` int(10) unsigned DEFAULT NULL,
  `secondCoordinate` int(10) DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `secondCoordinate` (`secondCoordinate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DataModel`
--

DROP TABLE IF EXISTS `DataModel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DataModel` (
  `thing` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `thing_class` enum('SchemaClass','SchemaClassAttribute','Schema') COLLATE utf8_unicode_ci DEFAULT NULL,
  `property_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `property_value` text COLLATE utf8_unicode_ci,
  `property_value_type` enum('INTEGER','SYMBOL','STRING','INSTANCE','SchemaClass','SchemaClassAttribute') COLLATE utf8_unicode_ci DEFAULT NULL,
  `property_value_rank` int(10) unsigned DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DatabaseIdentifier`
--

DROP TABLE IF EXISTS `DatabaseIdentifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DatabaseIdentifier` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `identifier` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `referenceDatabase` int(10) unsigned DEFAULT NULL,
  `referenceDatabase_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  KEY `identifier` (`identifier`),
  KEY `referenceDatabase` (`referenceDatabase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DatabaseIdentifier_2_crossReference`
--

DROP TABLE IF EXISTS `DatabaseIdentifier_2_crossReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DatabaseIdentifier_2_crossReference` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `crossReference_rank` int(10) unsigned DEFAULT NULL,
  `crossReference` int(10) unsigned DEFAULT NULL,
  `crossReference_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `crossReference` (`crossReference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DatabaseObject`
--

DROP TABLE IF EXISTS `DatabaseObject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DatabaseObject` (
  `DB_ID` int(10) NOT NULL AUTO_INCREMENT,
  `_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `_displayName` mediumtext COLLATE utf8_unicode_ci,
  `_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` int(10) unsigned DEFAULT NULL,
  `created_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stableIdentifier` int(10) unsigned DEFAULT NULL,
  `stableIdentifier_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  KEY `_class` (`_class`),
  KEY `_timestamp` (`_timestamp`),
  KEY `created` (`created`),
  KEY `_displayName` (`_displayName`(10)),
  KEY `stableIdentifier` (`stableIdentifier`)
) ENGINE=InnoDB AUTO_INCREMENT=9634982 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DatabaseObject_2_modified`
--

DROP TABLE IF EXISTS `DatabaseObject_2_modified`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DatabaseObject_2_modified` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `modified_rank` int(10) unsigned DEFAULT NULL,
  `modified` int(10) unsigned DEFAULT NULL,
  `modified_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DefinedSet`
--

DROP TABLE IF EXISTS `DefinedSet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DefinedSet` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DeletedControlledVocabulary`
--

DROP TABLE IF EXISTS `DeletedControlledVocabulary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeletedControlledVocabulary` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Depolymerisation`
--

DROP TABLE IF EXISTS `Depolymerisation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Depolymerisation` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Disease`
--

DROP TABLE IF EXISTS `Disease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Disease` (
  `DB_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Drug`
--

DROP TABLE IF EXISTS `Drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Drug` (
  `DB_ID` int(10) unsigned NOT NULL,
  `referenceEntity` int(10) unsigned DEFAULT NULL,
  `referenceEntity_class` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  KEY `referenceEntity` (`referenceEntity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Edge`
--

DROP TABLE IF EXISTS `Edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Edge` (
  `DB_ID` int(10) unsigned NOT NULL,
  `edgeType` int(10) DEFAULT NULL,
  `pathwayDiagram` int(10) unsigned DEFAULT NULL,
  `pathwayDiagram_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pointCoordinates` mediumtext COLLATE utf8_unicode_ci,
  `sourceVertex` int(10) unsigned DEFAULT NULL,
  `sourceVertex_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `targetVertex` int(10) unsigned DEFAULT NULL,
  `targetVertex_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  KEY `edgeType` (`edgeType`),
  KEY `pathwayDiagram` (`pathwayDiagram`),
  KEY `pointCoordinates` (`pointCoordinates`(10)),
  KEY `sourceVertex` (`sourceVertex`),
  KEY `targetVertex` (`targetVertex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EntityFunctionalStatus`
--

DROP TABLE IF EXISTS `EntityFunctionalStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EntityFunctionalStatus` (
  `DB_ID` int(10) unsigned NOT NULL,
  `diseaseEntity` int(10) unsigned DEFAULT NULL,
  `diseaseEntity_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `normalEntity` int(10) unsigned DEFAULT NULL,
  `normalEntity_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  KEY `diseaseEntity` (`diseaseEntity`),
  KEY `normalEntity` (`normalEntity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EntityFunctionalStatus_2_functionalStatus`
--

DROP TABLE IF EXISTS `EntityFunctionalStatus_2_functionalStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EntityFunctionalStatus_2_functionalStatus` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `functionalStatus_rank` int(10) unsigned DEFAULT NULL,
  `functionalStatus` int(10) unsigned DEFAULT NULL,
  `functionalStatus_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `functionalStatus` (`functionalStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EntitySet`
--

DROP TABLE IF EXISTS `EntitySet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EntitySet` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `isOrdered` enum('TRUE','FALSE') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  KEY `isOrdered` (`isOrdered`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EntitySet_2_hasMember`
--

DROP TABLE IF EXISTS `EntitySet_2_hasMember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EntitySet_2_hasMember` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `hasMember_rank` int(10) unsigned DEFAULT NULL,
  `hasMember` int(10) unsigned DEFAULT NULL,
  `hasMember_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `hasMember` (`hasMember`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EntitySet_2_relatedSpecies`
--

DROP TABLE IF EXISTS `EntitySet_2_relatedSpecies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EntitySet_2_relatedSpecies` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `relatedSpecies_rank` int(10) unsigned DEFAULT NULL,
  `relatedSpecies` int(10) unsigned DEFAULT NULL,
  `relatedSpecies_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `relatedSpecies` (`relatedSpecies`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EntitySet_2_species`
--

DROP TABLE IF EXISTS `EntitySet_2_species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EntitySet_2_species` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `species_rank` int(10) unsigned DEFAULT NULL,
  `species` int(10) unsigned DEFAULT NULL,
  `species_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `species` (`species`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EntityVertex`
--

DROP TABLE IF EXISTS `EntityVertex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EntityVertex` (
  `DB_ID` int(10) unsigned NOT NULL,
  `containedInEntityVertex` int(10) unsigned DEFAULT NULL,
  `containedInEntityVertex_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  KEY `containedInEntityVertex` (`containedInEntityVertex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EntityWithAccessionedSequence`
--

DROP TABLE IF EXISTS `EntityWithAccessionedSequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EntityWithAccessionedSequence` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `endCoordinate` int(10) DEFAULT NULL,
  `referenceEntity` int(10) unsigned DEFAULT NULL,
  `referenceEntity_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `startCoordinate` int(10) DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  KEY `endCoordinate` (`endCoordinate`),
  KEY `referenceEntity` (`referenceEntity`),
  KEY `startCoordinate` (`startCoordinate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EntityWithAccessionedSequence_2_hasModifiedResidue`
--

DROP TABLE IF EXISTS `EntityWithAccessionedSequence_2_hasModifiedResidue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EntityWithAccessionedSequence_2_hasModifiedResidue` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `hasModifiedResidue_rank` int(10) unsigned DEFAULT NULL,
  `hasModifiedResidue` int(10) unsigned DEFAULT NULL,
  `hasModifiedResidue_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `hasModifiedResidue` (`hasModifiedResidue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Event`
--

DROP TABLE IF EXISTS `Event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `definition` mediumtext COLLATE utf8_unicode_ci,
  `evidenceType` int(10) unsigned DEFAULT NULL,
  `evidenceType_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `goBiologicalProcess` int(10) unsigned DEFAULT NULL,
  `goBiologicalProcess_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `releaseDate` date DEFAULT NULL,
  `_doRelease` enum('TRUE','FALSE') COLLATE utf8_unicode_ci DEFAULT NULL,
  `releaseStatus` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`DB_ID`),
  KEY `evidenceType` (`evidenceType`),
  KEY `goBiologicalProcess` (`goBiologicalProcess`),
  KEY `definition` (`definition`(10)),
  KEY `releaseDate` (`releaseDate`),
  KEY `_doRelease` (`_doRelease`),
  KEY `releaseStatus` (`releaseStatus`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Event_2_authored`
--

DROP TABLE IF EXISTS `Event_2_authored`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_authored` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `authored_rank` int(10) unsigned DEFAULT NULL,
  `authored` int(10) unsigned DEFAULT NULL,
  `authored_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `authored` (`authored`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Event_2_compartment`
--

DROP TABLE IF EXISTS `Event_2_compartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_compartment` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `compartment_rank` int(10) unsigned DEFAULT NULL,
  `compartment` int(10) unsigned DEFAULT NULL,
  `compartment_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `compartment` (`compartment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Event_2_crossReference`
--

DROP TABLE IF EXISTS `Event_2_crossReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_crossReference` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `crossReference_rank` int(10) unsigned DEFAULT NULL,
  `crossReference` int(10) unsigned DEFAULT NULL,
  `crossReference_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `crossReference` (`crossReference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Event_2_disease`
--

DROP TABLE IF EXISTS `Event_2_disease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_disease` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `disease_rank` int(10) unsigned DEFAULT NULL,
  `disease` int(10) unsigned DEFAULT NULL,
  `disease_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `disease` (`disease`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Event_2_edited`
--

DROP TABLE IF EXISTS `Event_2_edited`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_edited` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `edited_rank` int(10) unsigned DEFAULT NULL,
  `edited` int(10) unsigned DEFAULT NULL,
  `edited_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `edited` (`edited`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Event_2_figure`
--

DROP TABLE IF EXISTS `Event_2_figure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_figure` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `figure_rank` int(10) unsigned DEFAULT NULL,
  `figure` int(10) unsigned DEFAULT NULL,
  `figure_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `figure` (`figure`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Event_2_inferredFrom`
--

DROP TABLE IF EXISTS `Event_2_inferredFrom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_inferredFrom` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `inferredFrom_rank` int(10) unsigned DEFAULT NULL,
  `inferredFrom` int(10) unsigned DEFAULT NULL,
  `inferredFrom_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `inferredFrom` (`inferredFrom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Event_2_literatureReference`
--

DROP TABLE IF EXISTS `Event_2_literatureReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_literatureReference` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `literatureReference_rank` int(10) unsigned DEFAULT NULL,
  `literatureReference` int(10) unsigned DEFAULT NULL,
  `literatureReference_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `literatureReference` (`literatureReference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Event_2_name`
--

DROP TABLE IF EXISTS `Event_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_name` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `name_rank` int(10) unsigned DEFAULT NULL,
  `name` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Event_2_orthologousEvent`
--

DROP TABLE IF EXISTS `Event_2_orthologousEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_orthologousEvent` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `orthologousEvent_rank` int(10) unsigned DEFAULT NULL,
  `orthologousEvent` int(10) unsigned DEFAULT NULL,
  `orthologousEvent_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `orthologousEvent` (`orthologousEvent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Event_2_precedingEvent`
--

DROP TABLE IF EXISTS `Event_2_precedingEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_precedingEvent` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `precedingEvent_rank` int(10) unsigned DEFAULT NULL,
  `precedingEvent` int(10) unsigned DEFAULT NULL,
  `precedingEvent_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `precedingEvent` (`precedingEvent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Event_2_relatedSpecies`
--

DROP TABLE IF EXISTS `Event_2_relatedSpecies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_relatedSpecies` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `relatedSpecies_rank` int(10) unsigned DEFAULT NULL,
  `relatedSpecies` int(10) unsigned DEFAULT NULL,
  `relatedSpecies_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `relatedSpecies` (`relatedSpecies`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Event_2_reviewed`
--

DROP TABLE IF EXISTS `Event_2_reviewed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_reviewed` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `reviewed_rank` int(10) unsigned DEFAULT NULL,
  `reviewed` int(10) unsigned DEFAULT NULL,
  `reviewed_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `reviewed` (`reviewed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Event_2_revised`
--

DROP TABLE IF EXISTS `Event_2_revised`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_revised` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `revised_rank` int(10) unsigned DEFAULT NULL,
  `revised` int(10) unsigned DEFAULT NULL,
  `revised_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `revised` (`revised`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Event_2_species`
--

DROP TABLE IF EXISTS `Event_2_species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_species` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `species_rank` int(10) unsigned DEFAULT NULL,
  `species` int(10) unsigned DEFAULT NULL,
  `species_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `species` (`species`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Event_2_summation`
--

DROP TABLE IF EXISTS `Event_2_summation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_2_summation` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `summation_rank` int(10) unsigned DEFAULT NULL,
  `summation` int(10) unsigned DEFAULT NULL,
  `summation_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `summation` (`summation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EvidenceType`
--

DROP TABLE IF EXISTS `EvidenceType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EvidenceType` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `definition` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`DB_ID`),
  KEY `definition` (`definition`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EvidenceType_2_instanceOf`
--

DROP TABLE IF EXISTS `EvidenceType_2_instanceOf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EvidenceType_2_instanceOf` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `instanceOf_rank` int(10) unsigned DEFAULT NULL,
  `instanceOf` int(10) unsigned DEFAULT NULL,
  `instanceOf_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `instanceOf` (`instanceOf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EvidenceType_2_name`
--

DROP TABLE IF EXISTS `EvidenceType_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EvidenceType_2_name` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `name_rank` int(10) unsigned DEFAULT NULL,
  `name` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ExternalOntology`
--

DROP TABLE IF EXISTS `ExternalOntology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ExternalOntology` (
  `DB_ID` int(10) unsigned NOT NULL,
  `definition` mediumtext COLLATE utf8_unicode_ci,
  `identifier` mediumtext COLLATE utf8_unicode_ci,
  `referenceDatabase` int(10) unsigned DEFAULT NULL,
  `referenceDatabase_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  KEY `definition` (`definition`(10)),
  KEY `identifier` (`identifier`(10)),
  KEY `referenceDatabase` (`referenceDatabase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ExternalOntology_2_instanceOf`
--

DROP TABLE IF EXISTS `ExternalOntology_2_instanceOf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ExternalOntology_2_instanceOf` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `instanceOf_rank` int(10) unsigned DEFAULT NULL,
  `instanceOf` int(10) unsigned DEFAULT NULL,
  `instanceOf_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `instanceOf` (`instanceOf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ExternalOntology_2_name`
--

DROP TABLE IF EXISTS `ExternalOntology_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ExternalOntology_2_name` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `name_rank` int(10) unsigned DEFAULT NULL,
  `name` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ExternalOntology_2_synonym`
--

DROP TABLE IF EXISTS `ExternalOntology_2_synonym`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ExternalOntology_2_synonym` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `synonym_rank` int(10) unsigned DEFAULT NULL,
  `synonym` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `synonym` (`synonym`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FailedReaction`
--

DROP TABLE IF EXISTS `FailedReaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FailedReaction` (
  `DB_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Figure`
--

DROP TABLE IF EXISTS `Figure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Figure` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `url` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`DB_ID`),
  KEY `url` (`url`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FragmentDeletionModification`
--

DROP TABLE IF EXISTS `FragmentDeletionModification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FragmentDeletionModification` (
  `DB_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FragmentInsertionModification`
--

DROP TABLE IF EXISTS `FragmentInsertionModification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FragmentInsertionModification` (
  `DB_ID` int(10) unsigned NOT NULL,
  `coordinate` int(10) DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  KEY `coordinate` (`coordinate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FragmentModification`
--

DROP TABLE IF EXISTS `FragmentModification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FragmentModification` (
  `DB_ID` int(10) unsigned NOT NULL,
  `endPositionInReferenceSequence` int(10) DEFAULT NULL,
  `startPositionInReferenceSequence` int(10) DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  KEY `endPositionInReferenceSequence` (`endPositionInReferenceSequence`),
  KEY `startPositionInReferenceSequence` (`startPositionInReferenceSequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FragmentReplacedModification`
--

DROP TABLE IF EXISTS `FragmentReplacedModification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FragmentReplacedModification` (
  `DB_ID` int(10) unsigned NOT NULL,
  `alteredAminoAcidFragment` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`DB_ID`),
  KEY `alteredAminoAcidFragment` (`alteredAminoAcidFragment`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FrontPage`
--

DROP TABLE IF EXISTS `FrontPage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FrontPage` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FrontPage_2_frontPageItem`
--

DROP TABLE IF EXISTS `FrontPage_2_frontPageItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FrontPage_2_frontPageItem` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `frontPageItem_rank` int(10) unsigned DEFAULT NULL,
  `frontPageItem` int(10) unsigned DEFAULT NULL,
  `frontPageItem_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `frontPageItem` (`frontPageItem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FunctionalStatus`
--

DROP TABLE IF EXISTS `FunctionalStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FunctionalStatus` (
  `DB_ID` int(10) unsigned NOT NULL,
  `functionalStatusType` int(10) unsigned DEFAULT NULL,
  `structuralVariant` int(10) unsigned DEFAULT NULL,
  `structuralVariant_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `functionalStatusType_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  KEY `structuralVariant` (`structuralVariant`),
  KEY `functionalStatusType` (`functionalStatusType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FunctionalStatusType`
--

DROP TABLE IF EXISTS `FunctionalStatusType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FunctionalStatusType` (
  `DB_ID` int(10) unsigned NOT NULL,
  `definition` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`DB_ID`),
  KEY `definition` (`definition`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FunctionalStatusType_2_name`
--

DROP TABLE IF EXISTS `FunctionalStatusType_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FunctionalStatusType_2_name` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `name_rank` int(10) unsigned DEFAULT NULL,
  `name` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GO_BiologicalProcess`
--

DROP TABLE IF EXISTS `GO_BiologicalProcess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_BiologicalProcess` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `accession` mediumtext COLLATE utf8_unicode_ci,
  `definition` mediumtext COLLATE utf8_unicode_ci,
  `referenceDatabase` int(10) unsigned DEFAULT NULL,
  `referenceDatabase_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  KEY `referenceDatabase` (`referenceDatabase`),
  KEY `accession` (`accession`(10)),
  KEY `definition` (`definition`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GO_BiologicalProcess_2_componentOf`
--

DROP TABLE IF EXISTS `GO_BiologicalProcess_2_componentOf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_BiologicalProcess_2_componentOf` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `componentOf_rank` int(10) unsigned DEFAULT NULL,
  `componentOf` int(10) unsigned DEFAULT NULL,
  `componentOf_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `componentOf` (`componentOf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GO_BiologicalProcess_2_hasPart`
--

DROP TABLE IF EXISTS `GO_BiologicalProcess_2_hasPart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_BiologicalProcess_2_hasPart` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `hasPart_rank` int(10) unsigned DEFAULT NULL,
  `hasPart` int(10) unsigned DEFAULT NULL,
  `hasPart_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `hasPart` (`hasPart`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GO_BiologicalProcess_2_instanceOf`
--

DROP TABLE IF EXISTS `GO_BiologicalProcess_2_instanceOf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_BiologicalProcess_2_instanceOf` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `instanceOf_rank` int(10) unsigned DEFAULT NULL,
  `instanceOf` int(10) unsigned DEFAULT NULL,
  `instanceOf_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `instanceOf` (`instanceOf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GO_BiologicalProcess_2_name`
--

DROP TABLE IF EXISTS `GO_BiologicalProcess_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_BiologicalProcess_2_name` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `name_rank` int(10) unsigned DEFAULT NULL,
  `name` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GO_BiologicalProcess_2_negativelyRegulate`
--

DROP TABLE IF EXISTS `GO_BiologicalProcess_2_negativelyRegulate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_BiologicalProcess_2_negativelyRegulate` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `negativelyRegulate_rank` int(10) unsigned DEFAULT NULL,
  `negativelyRegulate` int(10) unsigned DEFAULT NULL,
  `negativelyRegulate_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `negativelyRegulate` (`negativelyRegulate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GO_BiologicalProcess_2_positivelyRegulate`
--

DROP TABLE IF EXISTS `GO_BiologicalProcess_2_positivelyRegulate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_BiologicalProcess_2_positivelyRegulate` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `positivelyRegulate_rank` int(10) unsigned DEFAULT NULL,
  `positivelyRegulate` int(10) unsigned DEFAULT NULL,
  `positivelyRegulate_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `positivelyRegulate` (`positivelyRegulate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GO_BiologicalProcess_2_regulate`
--

DROP TABLE IF EXISTS `GO_BiologicalProcess_2_regulate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_BiologicalProcess_2_regulate` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `regulate_rank` int(10) unsigned DEFAULT NULL,
  `regulate` int(10) unsigned DEFAULT NULL,
  `regulate_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `regulate` (`regulate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GO_CellularComponent`
--

DROP TABLE IF EXISTS `GO_CellularComponent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_CellularComponent` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `accession` mediumtext COLLATE utf8_unicode_ci,
  `definition` mediumtext COLLATE utf8_unicode_ci,
  `referenceDatabase` int(10) unsigned DEFAULT NULL,
  `referenceDatabase_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  KEY `referenceDatabase` (`referenceDatabase`),
  KEY `accession` (`accession`(10)),
  KEY `definition` (`definition`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GO_CellularComponent_2_componentOf`
--

DROP TABLE IF EXISTS `GO_CellularComponent_2_componentOf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_CellularComponent_2_componentOf` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `componentOf_rank` int(10) unsigned DEFAULT NULL,
  `componentOf` int(10) unsigned DEFAULT NULL,
  `componentOf_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `componentOf` (`componentOf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GO_CellularComponent_2_hasPart`
--

DROP TABLE IF EXISTS `GO_CellularComponent_2_hasPart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_CellularComponent_2_hasPart` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `hasPart_rank` int(10) unsigned DEFAULT NULL,
  `hasPart` int(10) unsigned DEFAULT NULL,
  `hasPart_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `hasPart` (`hasPart`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GO_CellularComponent_2_instanceOf`
--

DROP TABLE IF EXISTS `GO_CellularComponent_2_instanceOf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_CellularComponent_2_instanceOf` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `instanceOf_rank` int(10) unsigned DEFAULT NULL,
  `instanceOf` int(10) unsigned DEFAULT NULL,
  `instanceOf_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `instanceOf` (`instanceOf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GO_CellularComponent_2_name`
--

DROP TABLE IF EXISTS `GO_CellularComponent_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_CellularComponent_2_name` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `name_rank` int(10) unsigned DEFAULT NULL,
  `name` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GO_MolecularFunction`
--

DROP TABLE IF EXISTS `GO_MolecularFunction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_MolecularFunction` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `accession` mediumtext COLLATE utf8_unicode_ci,
  `definition` mediumtext COLLATE utf8_unicode_ci,
  `referenceDatabase` int(10) unsigned DEFAULT NULL,
  `referenceDatabase_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  KEY `referenceDatabase` (`referenceDatabase`),
  KEY `accession` (`accession`(10)),
  KEY `definition` (`definition`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GO_MolecularFunction_2_componentOf`
--

DROP TABLE IF EXISTS `GO_MolecularFunction_2_componentOf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_MolecularFunction_2_componentOf` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `componentOf_rank` int(10) unsigned DEFAULT NULL,
  `componentOf` int(10) unsigned DEFAULT NULL,
  `componentOf_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `componentOf` (`componentOf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GO_MolecularFunction_2_ecNumber`
--

DROP TABLE IF EXISTS `GO_MolecularFunction_2_ecNumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_MolecularFunction_2_ecNumber` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `ecNumber_rank` int(10) unsigned DEFAULT NULL,
  `ecNumber` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `ecNumber` (`ecNumber`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GO_MolecularFunction_2_hasPart`
--

DROP TABLE IF EXISTS `GO_MolecularFunction_2_hasPart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_MolecularFunction_2_hasPart` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `hasPart_rank` int(10) unsigned DEFAULT NULL,
  `hasPart` int(10) unsigned DEFAULT NULL,
  `hasPart_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `hasPart` (`hasPart`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GO_MolecularFunction_2_instanceOf`
--

DROP TABLE IF EXISTS `GO_MolecularFunction_2_instanceOf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_MolecularFunction_2_instanceOf` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `instanceOf_rank` int(10) unsigned DEFAULT NULL,
  `instanceOf` int(10) unsigned DEFAULT NULL,
  `instanceOf_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `instanceOf` (`instanceOf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GO_MolecularFunction_2_name`
--

DROP TABLE IF EXISTS `GO_MolecularFunction_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_MolecularFunction_2_name` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `name_rank` int(10) unsigned DEFAULT NULL,
  `name` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GO_MolecularFunction_2_negativelyRegulate`
--

DROP TABLE IF EXISTS `GO_MolecularFunction_2_negativelyRegulate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_MolecularFunction_2_negativelyRegulate` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `negativelyRegulate_rank` int(10) unsigned DEFAULT NULL,
  `negativelyRegulate` int(10) unsigned DEFAULT NULL,
  `negativelyRegulate_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `negativelyRegulate` (`negativelyRegulate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GO_MolecularFunction_2_positivelyRegulate`
--

DROP TABLE IF EXISTS `GO_MolecularFunction_2_positivelyRegulate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_MolecularFunction_2_positivelyRegulate` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `positivelyRegulate_rank` int(10) unsigned DEFAULT NULL,
  `positivelyRegulate` int(10) unsigned DEFAULT NULL,
  `positivelyRegulate_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `positivelyRegulate` (`positivelyRegulate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GO_MolecularFunction_2_regulate`
--

DROP TABLE IF EXISTS `GO_MolecularFunction_2_regulate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_MolecularFunction_2_regulate` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `regulate_rank` int(10) unsigned DEFAULT NULL,
  `regulate` int(10) unsigned DEFAULT NULL,
  `regulate_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `regulate` (`regulate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GeneticallyModifiedResidue`
--

DROP TABLE IF EXISTS `GeneticallyModifiedResidue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GeneticallyModifiedResidue` (
  `DB_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GenomeEncodedEntity`
--

DROP TABLE IF EXISTS `GenomeEncodedEntity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GenomeEncodedEntity` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `species` int(10) unsigned DEFAULT NULL,
  `species_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  KEY `species` (`species`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GroupModifiedResidue`
--

DROP TABLE IF EXISTS `GroupModifiedResidue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GroupModifiedResidue` (
  `DB_ID` int(10) unsigned NOT NULL,
  `modification` int(10) unsigned DEFAULT NULL,
  `modification_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  KEY `modification` (`modification`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `InstanceEdit`
--

DROP TABLE IF EXISTS `InstanceEdit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InstanceEdit` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `_applyToAllEditedInstances` mediumtext COLLATE utf8_unicode_ci,
  `dateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `note` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`DB_ID`),
  KEY `dateTime` (`dateTime`),
  KEY `_applyToAllEditedInstances` (`_applyToAllEditedInstances`(10)),
  KEY `note` (`note`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `InstanceEdit_2_author`
--

DROP TABLE IF EXISTS `InstanceEdit_2_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InstanceEdit_2_author` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `author_rank` int(10) unsigned DEFAULT NULL,
  `author` int(10) unsigned DEFAULT NULL,
  `author_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `author` (`author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `InterChainCrosslinkedResidue`
--

DROP TABLE IF EXISTS `InterChainCrosslinkedResidue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InterChainCrosslinkedResidue` (
  `DB_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `InterChainCrosslinkedResidue_2_equivalentTo`
--

DROP TABLE IF EXISTS `InterChainCrosslinkedResidue_2_equivalentTo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InterChainCrosslinkedResidue_2_equivalentTo` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `equivalentTo_rank` int(10) unsigned DEFAULT NULL,
  `equivalentTo` int(10) unsigned DEFAULT NULL,
  `equivalentTo_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `equivalentTo` (`equivalentTo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `InterChainCrosslinkedResidue_2_secondReferenceSequence`
--

DROP TABLE IF EXISTS `InterChainCrosslinkedResidue_2_secondReferenceSequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InterChainCrosslinkedResidue_2_secondReferenceSequence` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `secondReferenceSequence_rank` int(10) unsigned DEFAULT NULL,
  `secondReferenceSequence` int(10) unsigned DEFAULT NULL,
  `secondReferenceSequence_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `secondReferenceSequence` (`secondReferenceSequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IntraChainCrosslinkedResidue`
--

DROP TABLE IF EXISTS `IntraChainCrosslinkedResidue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IntraChainCrosslinkedResidue` (
  `DB_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `LiteratureReference`
--

DROP TABLE IF EXISTS `LiteratureReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LiteratureReference` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `journal` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pages` mediumtext COLLATE utf8_unicode_ci,
  `pubMedIdentifier` int(10) DEFAULT NULL,
  `volume` int(10) DEFAULT NULL,
  `year` int(10) DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  KEY `journal` (`journal`),
  KEY `pubMedIdentifier` (`pubMedIdentifier`),
  KEY `volume` (`volume`),
  KEY `year` (`year`),
  KEY `pages` (`pages`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ModifiedResidue`
--

DROP TABLE IF EXISTS `ModifiedResidue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ModifiedResidue` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NegativeGeneExpressionRegulation`
--

DROP TABLE IF EXISTS `NegativeGeneExpressionRegulation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NegativeGeneExpressionRegulation` (
  `DB_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NegativeRegulation`
--

DROP TABLE IF EXISTS `NegativeRegulation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NegativeRegulation` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Ontology`
--

DROP TABLE IF EXISTS `Ontology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ontology` (
  `ontology` longblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `OtherEntity`
--

DROP TABLE IF EXISTS `OtherEntity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OtherEntity` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Pathway`
--

DROP TABLE IF EXISTS `Pathway`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pathway` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `doi` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isCanonical` enum('TRUE','FALSE') COLLATE utf8_unicode_ci DEFAULT NULL,
  `normalPathway` int(10) unsigned DEFAULT NULL,
  `normalPathway_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hasEHLD` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`DB_ID`),
  KEY `doi` (`doi`),
  KEY `isCanonical` (`isCanonical`),
  KEY `normalPathway` (`normalPathway`),
  KEY `hasEHLD` (`hasEHLD`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PathwayDiagram`
--

DROP TABLE IF EXISTS `PathwayDiagram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PathwayDiagram` (
  `DB_ID` int(10) unsigned NOT NULL,
  `height` int(10) DEFAULT NULL,
  `storedATXML` longblob,
  `width` int(10) DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  KEY `height` (`height`),
  KEY `width` (`width`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PathwayDiagramItem`
--

DROP TABLE IF EXISTS `PathwayDiagramItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PathwayDiagramItem` (
  `DB_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PathwayDiagram_2_representedPathway`
--

DROP TABLE IF EXISTS `PathwayDiagram_2_representedPathway`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PathwayDiagram_2_representedPathway` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `representedPathway_rank` int(10) unsigned DEFAULT NULL,
  `representedPathway` int(10) unsigned DEFAULT NULL,
  `representedPathway_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `representedPathway` (`representedPathway`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PathwayVertex`
--

DROP TABLE IF EXISTS `PathwayVertex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PathwayVertex` (
  `DB_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Pathway_2_hasEvent`
--

DROP TABLE IF EXISTS `Pathway_2_hasEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pathway_2_hasEvent` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `hasEvent_rank` int(10) unsigned DEFAULT NULL,
  `hasEvent` int(10) unsigned DEFAULT NULL,
  `hasEvent_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `hasEvent` (`hasEvent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Person`
--

DROP TABLE IF EXISTS `Person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Person` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `firstname` mediumtext COLLATE utf8_unicode_ci,
  `initial` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `project` mediumtext COLLATE utf8_unicode_ci,
  `url` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`DB_ID`),
  KEY `initial` (`initial`),
  KEY `surname` (`surname`),
  KEY `firstname` (`firstname`(10)),
  KEY `project` (`project`(10)),
  KEY `url` (`url`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Person_2_affiliation`
--

DROP TABLE IF EXISTS `Person_2_affiliation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Person_2_affiliation` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `affiliation_rank` int(10) unsigned DEFAULT NULL,
  `affiliation` int(10) unsigned DEFAULT NULL,
  `affiliation_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `affiliation` (`affiliation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Person_2_crossReference`
--

DROP TABLE IF EXISTS `Person_2_crossReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Person_2_crossReference` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `crossReference_rank` int(10) unsigned DEFAULT NULL,
  `crossReference` int(10) unsigned DEFAULT NULL,
  `crossReference_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `crossReference` (`crossReference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Person_2_figure`
--

DROP TABLE IF EXISTS `Person_2_figure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Person_2_figure` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `figure_rank` int(10) unsigned DEFAULT NULL,
  `figure` int(10) unsigned DEFAULT NULL,
  `figure_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `figure` (`figure`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PhysicalEntity`
--

DROP TABLE IF EXISTS `PhysicalEntity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhysicalEntity` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `definition` mediumtext COLLATE utf8_unicode_ci,
  `goCellularComponent` int(10) unsigned DEFAULT NULL,
  `goCellularComponent_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authored` int(10) unsigned DEFAULT NULL,
  `authored_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cellType` int(10) unsigned DEFAULT NULL,
  `cellType_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `systematicName` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`DB_ID`),
  KEY `goCellularComponent` (`goCellularComponent`),
  KEY `definition` (`definition`(10)),
  KEY `authored` (`authored`),
  KEY `cellType` (`cellType`),
  KEY `systematicName` (`systematicName`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PhysicalEntity_2_compartment`
--

DROP TABLE IF EXISTS `PhysicalEntity_2_compartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhysicalEntity_2_compartment` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `compartment_rank` int(10) unsigned DEFAULT NULL,
  `compartment` int(10) unsigned DEFAULT NULL,
  `compartment_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `compartment` (`compartment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PhysicalEntity_2_crossReference`
--

DROP TABLE IF EXISTS `PhysicalEntity_2_crossReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhysicalEntity_2_crossReference` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `crossReference_rank` int(10) unsigned DEFAULT NULL,
  `crossReference` int(10) unsigned DEFAULT NULL,
  `crossReference_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `crossReference` (`crossReference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PhysicalEntity_2_disease`
--

DROP TABLE IF EXISTS `PhysicalEntity_2_disease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhysicalEntity_2_disease` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `disease_rank` int(10) unsigned DEFAULT NULL,
  `disease` int(10) unsigned DEFAULT NULL,
  `disease_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `disease` (`disease`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PhysicalEntity_2_edited`
--

DROP TABLE IF EXISTS `PhysicalEntity_2_edited`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhysicalEntity_2_edited` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `edited_rank` int(10) unsigned DEFAULT NULL,
  `edited` int(10) unsigned DEFAULT NULL,
  `edited_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `edited` (`edited`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PhysicalEntity_2_figure`
--

DROP TABLE IF EXISTS `PhysicalEntity_2_figure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhysicalEntity_2_figure` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `figure_rank` int(10) unsigned DEFAULT NULL,
  `figure` int(10) unsigned DEFAULT NULL,
  `figure_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `figure` (`figure`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PhysicalEntity_2_inferredFrom`
--

DROP TABLE IF EXISTS `PhysicalEntity_2_inferredFrom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhysicalEntity_2_inferredFrom` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `inferredFrom_rank` int(10) unsigned DEFAULT NULL,
  `inferredFrom` int(10) unsigned DEFAULT NULL,
  `inferredFrom_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `inferredFrom` (`inferredFrom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PhysicalEntity_2_inferredTo`
--

DROP TABLE IF EXISTS `PhysicalEntity_2_inferredTo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhysicalEntity_2_inferredTo` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `inferredTo_rank` int(10) unsigned DEFAULT NULL,
  `inferredTo` int(10) unsigned DEFAULT NULL,
  `inferredTo_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `inferredTo` (`inferredTo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PhysicalEntity_2_literatureReference`
--

DROP TABLE IF EXISTS `PhysicalEntity_2_literatureReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhysicalEntity_2_literatureReference` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `literatureReference_rank` int(10) unsigned DEFAULT NULL,
  `literatureReference` int(10) unsigned DEFAULT NULL,
  `literatureReference_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `literatureReference` (`literatureReference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PhysicalEntity_2_name`
--

DROP TABLE IF EXISTS `PhysicalEntity_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhysicalEntity_2_name` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `name_rank` int(10) unsigned DEFAULT NULL,
  `name` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PhysicalEntity_2_reviewed`
--

DROP TABLE IF EXISTS `PhysicalEntity_2_reviewed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhysicalEntity_2_reviewed` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `reviewed_rank` int(10) unsigned DEFAULT NULL,
  `reviewed` int(10) unsigned DEFAULT NULL,
  `reviewed_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `reviewed` (`reviewed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PhysicalEntity_2_revised`
--

DROP TABLE IF EXISTS `PhysicalEntity_2_revised`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhysicalEntity_2_revised` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `revised_rank` int(10) unsigned DEFAULT NULL,
  `revised` int(10) unsigned DEFAULT NULL,
  `revised_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `revised` (`revised`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PhysicalEntity_2_summation`
--

DROP TABLE IF EXISTS `PhysicalEntity_2_summation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhysicalEntity_2_summation` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `summation_rank` int(10) unsigned DEFAULT NULL,
  `summation` int(10) unsigned DEFAULT NULL,
  `summation_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `summation` (`summation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Polymer`
--

DROP TABLE IF EXISTS `Polymer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Polymer` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `maxUnitCount` int(10) DEFAULT NULL,
  `minUnitCount` int(10) DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  KEY `maxUnitCount` (`maxUnitCount`),
  KEY `minUnitCount` (`minUnitCount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Polymer_2_repeatedUnit`
--

DROP TABLE IF EXISTS `Polymer_2_repeatedUnit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Polymer_2_repeatedUnit` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `repeatedUnit_rank` int(10) unsigned DEFAULT NULL,
  `repeatedUnit` int(10) unsigned DEFAULT NULL,
  `repeatedUnit_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `repeatedUnit` (`repeatedUnit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Polymer_2_species`
--

DROP TABLE IF EXISTS `Polymer_2_species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Polymer_2_species` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `species_rank` int(10) unsigned DEFAULT NULL,
  `species` int(10) unsigned DEFAULT NULL,
  `species_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `species` (`species`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Polymerisation`
--

DROP TABLE IF EXISTS `Polymerisation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Polymerisation` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PositiveGeneExpressionRegulation`
--

DROP TABLE IF EXISTS `PositiveGeneExpressionRegulation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PositiveGeneExpressionRegulation` (
  `DB_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PositiveRegulation`
--

DROP TABLE IF EXISTS `PositiveRegulation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PositiveRegulation` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ProteinDrug`
--

DROP TABLE IF EXISTS `ProteinDrug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProteinDrug` (
  `DB_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PsiMod`
--

DROP TABLE IF EXISTS `PsiMod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PsiMod` (
  `DB_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Publication`
--

DROP TABLE IF EXISTS `Publication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Publication` (
  `DB_ID` int(10) unsigned NOT NULL,
  `title` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`DB_ID`),
  KEY `title` (`title`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Publication_2_author`
--

DROP TABLE IF EXISTS `Publication_2_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Publication_2_author` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `author_rank` int(10) unsigned DEFAULT NULL,
  `author` int(10) unsigned DEFAULT NULL,
  `author_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `author` (`author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RNADrug`
--

DROP TABLE IF EXISTS `RNADrug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RNADrug` (
  `DB_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Reaction`
--

DROP TABLE IF EXISTS `Reaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reaction` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `reverseReaction` int(10) unsigned DEFAULT NULL,
  `reverseReaction_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  KEY `reverseReaction` (`reverseReaction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReactionVertex`
--

DROP TABLE IF EXISTS `ReactionVertex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReactionVertex` (
  `DB_ID` int(10) unsigned NOT NULL,
  `pointCoordinates` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`DB_ID`),
  KEY `pointCoordinates` (`pointCoordinates`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReactionlikeEvent`
--

DROP TABLE IF EXISTS `ReactionlikeEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReactionlikeEvent` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `isChimeric` enum('TRUE','FALSE') COLLATE utf8_unicode_ci DEFAULT NULL,
  `systematicName` mediumtext COLLATE utf8_unicode_ci,
  `normalReaction` int(10) unsigned DEFAULT NULL,
  `normalReaction_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  KEY `isChimeric` (`isChimeric`),
  KEY `systematicName` (`systematicName`(10)),
  KEY `normalReaction` (`normalReaction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReactionlikeEvent_2_catalystActivity`
--

DROP TABLE IF EXISTS `ReactionlikeEvent_2_catalystActivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReactionlikeEvent_2_catalystActivity` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `catalystActivity_rank` int(10) unsigned DEFAULT NULL,
  `catalystActivity` int(10) unsigned DEFAULT NULL,
  `catalystActivity_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `catalystActivity` (`catalystActivity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReactionlikeEvent_2_entityFunctionalStatus`
--

DROP TABLE IF EXISTS `ReactionlikeEvent_2_entityFunctionalStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReactionlikeEvent_2_entityFunctionalStatus` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `entityFunctionalStatus_rank` int(10) unsigned DEFAULT NULL,
  `entityFunctionalStatus` int(10) unsigned DEFAULT NULL,
  `entityFunctionalStatus_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `entityFunctionalStatus` (`entityFunctionalStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReactionlikeEvent_2_entityOnOtherCell`
--

DROP TABLE IF EXISTS `ReactionlikeEvent_2_entityOnOtherCell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReactionlikeEvent_2_entityOnOtherCell` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `entityOnOtherCell_rank` int(10) unsigned DEFAULT NULL,
  `entityOnOtherCell` int(10) unsigned DEFAULT NULL,
  `entityOnOtherCell_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `entityOnOtherCell` (`entityOnOtherCell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReactionlikeEvent_2_input`
--

DROP TABLE IF EXISTS `ReactionlikeEvent_2_input`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReactionlikeEvent_2_input` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `input_rank` int(10) unsigned DEFAULT NULL,
  `input` int(10) unsigned DEFAULT NULL,
  `input_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `input` (`input`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReactionlikeEvent_2_output`
--

DROP TABLE IF EXISTS `ReactionlikeEvent_2_output`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReactionlikeEvent_2_output` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `output_rank` int(10) unsigned DEFAULT NULL,
  `output` int(10) unsigned DEFAULT NULL,
  `output_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `output` (`output`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReactionlikeEvent_2_regulatedBy`
--

DROP TABLE IF EXISTS `ReactionlikeEvent_2_regulatedBy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReactionlikeEvent_2_regulatedBy` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `regulatedBy_rank` int(10) unsigned DEFAULT NULL,
  `regulatedBy` int(10) unsigned DEFAULT NULL,
  `regulatedBy_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `regulatedBy` (`regulatedBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReactionlikeEvent_2_requiredInputComponent`
--

DROP TABLE IF EXISTS `ReactionlikeEvent_2_requiredInputComponent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReactionlikeEvent_2_requiredInputComponent` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `requiredInputComponent_rank` int(10) unsigned DEFAULT NULL,
  `requiredInputComponent` int(10) unsigned DEFAULT NULL,
  `requiredInputComponent_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `requiredInputComponent` (`requiredInputComponent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceDNASequence`
--

DROP TABLE IF EXISTS `ReferenceDNASequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceDNASequence` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceDatabase`
--

DROP TABLE IF EXISTS `ReferenceDatabase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceDatabase` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `accessUrl` mediumtext COLLATE utf8_unicode_ci,
  `url` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`DB_ID`),
  KEY `url` (`url`(10)),
  KEY `accessUrl` (`accessUrl`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceDatabase_2_name`
--

DROP TABLE IF EXISTS `ReferenceDatabase_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceDatabase_2_name` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `name_rank` int(10) unsigned DEFAULT NULL,
  `name` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceEntity`
--

DROP TABLE IF EXISTS `ReferenceEntity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceEntity` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `identifier` mediumtext COLLATE utf8_unicode_ci,
  `referenceDatabase` int(10) unsigned DEFAULT NULL,
  `referenceDatabase_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  KEY `referenceDatabase` (`referenceDatabase`),
  KEY `identifier` (`identifier`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceEntity_2_crossReference`
--

DROP TABLE IF EXISTS `ReferenceEntity_2_crossReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceEntity_2_crossReference` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `crossReference_rank` int(10) unsigned DEFAULT NULL,
  `crossReference` int(10) unsigned DEFAULT NULL,
  `crossReference_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `crossReference` (`crossReference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceEntity_2_name`
--

DROP TABLE IF EXISTS `ReferenceEntity_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceEntity_2_name` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `name_rank` int(10) unsigned DEFAULT NULL,
  `name` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceEntity_2_otherIdentifier`
--

DROP TABLE IF EXISTS `ReferenceEntity_2_otherIdentifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceEntity_2_otherIdentifier` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `otherIdentifier_rank` int(10) unsigned DEFAULT NULL,
  `otherIdentifier` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `otherIdentifier` (`otherIdentifier`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceGeneProduct`
--

DROP TABLE IF EXISTS `ReferenceGeneProduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceGeneProduct` (
  `DB_ID` int(10) unsigned NOT NULL,
  `_chainChangeLog` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`DB_ID`),
  KEY `_chainChangeLog` (`_chainChangeLog`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceGeneProduct_2_chain`
--

DROP TABLE IF EXISTS `ReferenceGeneProduct_2_chain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceGeneProduct_2_chain` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `chain_rank` int(10) unsigned DEFAULT NULL,
  `chain` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `chain` (`chain`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceGeneProduct_2_referenceGene`
--

DROP TABLE IF EXISTS `ReferenceGeneProduct_2_referenceGene`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceGeneProduct_2_referenceGene` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `referenceGene_rank` int(10) unsigned DEFAULT NULL,
  `referenceGene` int(10) unsigned DEFAULT NULL,
  `referenceGene_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `referenceGene` (`referenceGene`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceGeneProduct_2_referenceTranscript`
--

DROP TABLE IF EXISTS `ReferenceGeneProduct_2_referenceTranscript`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceGeneProduct_2_referenceTranscript` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `referenceTranscript_rank` int(10) unsigned DEFAULT NULL,
  `referenceTranscript` int(10) unsigned DEFAULT NULL,
  `referenceTranscript_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `referenceTranscript` (`referenceTranscript`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceGroup`
--

DROP TABLE IF EXISTS `ReferenceGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceGroup` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `formula` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`DB_ID`),
  KEY `formula` (`formula`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceIsoform`
--

DROP TABLE IF EXISTS `ReferenceIsoform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceIsoform` (
  `DB_ID` int(10) unsigned NOT NULL,
  `variantIdentifier` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`DB_ID`),
  KEY `variantIdentifier` (`variantIdentifier`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceIsoform_2_isoformParent`
--

DROP TABLE IF EXISTS `ReferenceIsoform_2_isoformParent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceIsoform_2_isoformParent` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `isoformParent_rank` int(10) unsigned DEFAULT NULL,
  `isoformParent` int(10) unsigned DEFAULT NULL,
  `isoformParent_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `isoformParent` (`isoformParent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceMolecule`
--

DROP TABLE IF EXISTS `ReferenceMolecule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceMolecule` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `formula` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`DB_ID`),
  KEY `formula` (`formula`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceRNASequence`
--

DROP TABLE IF EXISTS `ReferenceRNASequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceRNASequence` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceRNASequence_2_referenceGene`
--

DROP TABLE IF EXISTS `ReferenceRNASequence_2_referenceGene`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceRNASequence_2_referenceGene` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `referenceGene_rank` int(10) unsigned DEFAULT NULL,
  `referenceGene` int(10) unsigned DEFAULT NULL,
  `referenceGene_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `referenceGene` (`referenceGene`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceSequence`
--

DROP TABLE IF EXISTS `ReferenceSequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceSequence` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `species` int(10) unsigned DEFAULT NULL,
  `species_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sequenceLength` int(10) DEFAULT NULL,
  `isSequenceChanged` mediumtext COLLATE utf8_unicode_ci,
  `checksum` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`DB_ID`),
  KEY `species` (`species`),
  KEY `sequenceLength` (`sequenceLength`),
  KEY `isSequenceChanged` (`isSequenceChanged`(10)),
  KEY `checksum` (`checksum`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceSequence_2_comment`
--

DROP TABLE IF EXISTS `ReferenceSequence_2_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceSequence_2_comment` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `comment_rank` int(10) unsigned DEFAULT NULL,
  `comment` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `comment` (`comment`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceSequence_2_description`
--

DROP TABLE IF EXISTS `ReferenceSequence_2_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceSequence_2_description` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `description_rank` int(10) unsigned DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `description` (`description`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceSequence_2_geneName`
--

DROP TABLE IF EXISTS `ReferenceSequence_2_geneName`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceSequence_2_geneName` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `geneName_rank` int(10) unsigned DEFAULT NULL,
  `geneName` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `geneName` (`geneName`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceSequence_2_keyword`
--

DROP TABLE IF EXISTS `ReferenceSequence_2_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceSequence_2_keyword` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `keyword_rank` int(10) unsigned DEFAULT NULL,
  `keyword` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `keyword` (`keyword`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceSequence_2_secondaryIdentifier`
--

DROP TABLE IF EXISTS `ReferenceSequence_2_secondaryIdentifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceSequence_2_secondaryIdentifier` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `secondaryIdentifier_rank` int(10) unsigned DEFAULT NULL,
  `secondaryIdentifier` mediumtext COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `secondaryIdentifier` (`secondaryIdentifier`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceTherapeutic`
--

DROP TABLE IF EXISTS `ReferenceTherapeutic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceTherapeutic` (
  `DB_ID` int(10) unsigned NOT NULL,
  `abbreviation` text,
  `approved` enum('TRUE','FALSE') DEFAULT NULL,
  `inn` text,
  `type` text,
  PRIMARY KEY (`DB_ID`),
  KEY `abbreviation` (`abbreviation`(10)),
  KEY `approved` (`approved`),
  KEY `inn` (`inn`(10)),
  KEY `type` (`type`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferenceTherapeutic_2_approvalSource`
--

DROP TABLE IF EXISTS `ReferenceTherapeutic_2_approvalSource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenceTherapeutic_2_approvalSource` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `approvalSource_rank` int(10) unsigned DEFAULT NULL,
  `approvalSource` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  KEY `DB_ID` (`DB_ID`),
  KEY `approvalSource` (`approvalSource`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Regulation`
--

DROP TABLE IF EXISTS `Regulation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Regulation` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `regulator` int(10) unsigned DEFAULT NULL,
  `regulator_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activity` int(10) unsigned DEFAULT NULL,
  `activity_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `goBiologicalProcess` int(10) unsigned DEFAULT NULL,
  `goBiologicalProcess_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  KEY `regulator` (`regulator`),
  KEY `activity` (`activity`),
  KEY `goBiologicalProcess` (`goBiologicalProcess`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Regulation_2_activeUnit`
--

DROP TABLE IF EXISTS `Regulation_2_activeUnit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Regulation_2_activeUnit` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `activeUnit_rank` int(10) unsigned DEFAULT NULL,
  `activeUnit` int(10) unsigned DEFAULT NULL,
  `activeUnit_class` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `activeUnit` (`activeUnit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Regulation_2_literatureReference`
--

DROP TABLE IF EXISTS `Regulation_2_literatureReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Regulation_2_literatureReference` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `literatureReference_rank` int(10) unsigned DEFAULT NULL,
  `literatureReference` int(10) unsigned DEFAULT NULL,
  `literatureReference_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `literatureReference` (`literatureReference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Regulation_2_summation`
--

DROP TABLE IF EXISTS `Regulation_2_summation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Regulation_2_summation` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `summation_rank` int(10) unsigned DEFAULT NULL,
  `summation` int(10) unsigned DEFAULT NULL,
  `summation_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `summation` (`summation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReplacedResidue`
--

DROP TABLE IF EXISTS `ReplacedResidue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReplacedResidue` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `coordinate` int(10) DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  KEY `coordinate` (`coordinate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReplacedResidue_2_psiMod`
--

DROP TABLE IF EXISTS `ReplacedResidue_2_psiMod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReplacedResidue_2_psiMod` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `psiMod_rank` int(10) unsigned DEFAULT NULL,
  `psiMod` int(10) unsigned DEFAULT NULL,
  `psiMod_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `psiMod` (`psiMod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Requirement`
--

DROP TABLE IF EXISTS `Requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Requirement` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SequenceOntology`
--

DROP TABLE IF EXISTS `SequenceOntology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SequenceOntology` (
  `DB_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SimpleEntity`
--

DROP TABLE IF EXISTS `SimpleEntity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SimpleEntity` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `species` int(10) unsigned DEFAULT NULL,
  `species_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `referenceEntity` int(10) unsigned DEFAULT NULL,
  `referenceEntity_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  KEY `species` (`species`),
  KEY `referenceEntity` (`referenceEntity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Species`
--

DROP TABLE IF EXISTS `Species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Species` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `abbreviation` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`DB_ID`),
  KEY `abbreviation` (`abbreviation`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `StableIdentifier`
--

DROP TABLE IF EXISTS `StableIdentifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StableIdentifier` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `identifier` mediumtext COLLATE utf8_unicode_ci,
  `identifierVersion` mediumtext COLLATE utf8_unicode_ci,
  `oldIdentifier` mediumtext COLLATE utf8_unicode_ci,
  `oldIdentifierVersion` mediumtext COLLATE utf8_unicode_ci,
  `released` enum('TRUE','FALSE') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  KEY `identifier` (`identifier`(10)),
  KEY `identifierVersion` (`identifierVersion`(10)),
  KEY `oldIdentifierVersion` (`oldIdentifierVersion`(10)),
  KEY `oldIdentifier` (`oldIdentifier`(10)),
  KEY `released` (`released`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Summation`
--

DROP TABLE IF EXISTS `Summation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Summation` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `text` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`DB_ID`),
  KEY `text` (`text`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Summation_2_literatureReference`
--

DROP TABLE IF EXISTS `Summation_2_literatureReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Summation_2_literatureReference` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `literatureReference_rank` int(10) unsigned DEFAULT NULL,
  `literatureReference` int(10) unsigned DEFAULT NULL,
  `literatureReference_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `literatureReference` (`literatureReference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Taxon`
--

DROP TABLE IF EXISTS `Taxon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Taxon` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `superTaxon` int(10) unsigned DEFAULT NULL,
  `superTaxon_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  KEY `superTaxon` (`superTaxon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Taxon_2_crossReference`
--

DROP TABLE IF EXISTS `Taxon_2_crossReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Taxon_2_crossReference` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `crossReference_rank` int(10) unsigned DEFAULT NULL,
  `crossReference` int(10) unsigned DEFAULT NULL,
  `crossReference_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `crossReference` (`crossReference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Taxon_2_name`
--

DROP TABLE IF EXISTS `Taxon_2_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Taxon_2_name` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `name_rank` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TranslationalModification`
--

DROP TABLE IF EXISTS `TranslationalModification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TranslationalModification` (
  `DB_ID` int(10) unsigned NOT NULL,
  `coordinate` int(10) DEFAULT NULL,
  `psiMod` int(10) unsigned DEFAULT NULL,
  `psiMod_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  KEY `coordinate` (`coordinate`),
  KEY `psiMod` (`psiMod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `URL`
--

DROP TABLE IF EXISTS `URL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `URL` (
  `DB_ID` int(10) unsigned NOT NULL,
  `uniformResourceLocator` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`DB_ID`),
  KEY `uniformResourceLocator` (`uniformResourceLocator`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Vertex`
--

DROP TABLE IF EXISTS `Vertex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vertex` (
  `DB_ID` int(10) unsigned NOT NULL,
  `height` int(10) DEFAULT NULL,
  `pathwayDiagram` int(10) unsigned DEFAULT NULL,
  `pathwayDiagram_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `representedInstance` int(10) unsigned DEFAULT NULL,
  `representedInstance_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `width` int(10) DEFAULT NULL,
  `x` int(10) DEFAULT NULL,
  `y` int(10) DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  KEY `height` (`height`),
  KEY `pathwayDiagram` (`pathwayDiagram`),
  KEY `representedInstance` (`representedInstance`),
  KEY `width` (`width`),
  KEY `x` (`x`),
  KEY `y` (`y`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `VertexSearchableTerm`
--

DROP TABLE IF EXISTS `VertexSearchableTerm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VertexSearchableTerm` (
  `DB_ID` int(10) unsigned NOT NULL,
  `providerCount` int(10) DEFAULT NULL,
  `searchableTerm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `species` int(10) unsigned DEFAULT NULL,
  `species_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vertexCount` int(10) DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  KEY `providerCount` (`providerCount`),
  KEY `searchableTerm` (`searchableTerm`),
  KEY `species` (`species`),
  KEY `vertexCount` (`vertexCount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `VertexSearchableTerm_2_termProvider`
--

DROP TABLE IF EXISTS `VertexSearchableTerm_2_termProvider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VertexSearchableTerm_2_termProvider` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `termProvider_rank` int(10) unsigned DEFAULT NULL,
  `termProvider` int(10) unsigned DEFAULT NULL,
  `termProvider_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `termProvider` (`termProvider`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `VertexSearchableTerm_2_vertex`
--

DROP TABLE IF EXISTS `VertexSearchableTerm_2_vertex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VertexSearchableTerm_2_vertex` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `vertex_rank` int(10) unsigned DEFAULT NULL,
  `vertex` int(10) unsigned DEFAULT NULL,
  `vertex_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `vertex` (`vertex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_Deleted`
--

DROP TABLE IF EXISTS `_Deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_Deleted` (
  `DB_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `curatorComment` mediumtext COLLATE utf8_unicode_ci,
  `reason` int(10) unsigned DEFAULT NULL,
  `reason_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  KEY `curatorComment` (`curatorComment`(10)),
  KEY `reason` (`reason`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_Deleted_2_deletedInstanceDB_ID`
--

DROP TABLE IF EXISTS `_Deleted_2_deletedInstanceDB_ID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_Deleted_2_deletedInstanceDB_ID` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `deletedInstanceDB_ID_rank` int(10) unsigned DEFAULT NULL,
  `deletedInstanceDB_ID` int(10) DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `deletedInstanceDB_ID` (`deletedInstanceDB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_Deleted_2_replacementInstances`
--

DROP TABLE IF EXISTS `_Deleted_2_replacementInstances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_Deleted_2_replacementInstances` (
  `DB_ID` int(10) unsigned DEFAULT NULL,
  `replacementInstances_rank` int(10) unsigned DEFAULT NULL,
  `replacementInstances` int(10) unsigned DEFAULT NULL,
  `replacementInstances_class` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `DB_ID` (`DB_ID`),
  KEY `replacementInstances` (`replacementInstances`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_Release`
--

DROP TABLE IF EXISTS `_Release`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_Release` (
  `DB_ID` int(10) unsigned NOT NULL,
  `releaseDate` mediumtext COLLATE utf8_unicode_ci,
  `releaseNumber` int(10) DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  KEY `releaseDate` (`releaseDate`(10)),
  KEY `releaseNumber` (`releaseNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-29 13:54:30
