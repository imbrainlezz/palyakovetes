﻿--
-- Script was generated by Devart dbForge Studio 2020 for MySQL, Version 9.0.890.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 2023.02.06. 15:15:03
-- Server version: 10.4.24
-- Client version: 4.1
--

-- 
-- Disable foreign keys
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Set SQL mode
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Set character set the client will use to send SQL statements to the server
--
SET NAMES 'utf8';

DROP DATABASE IF EXISTS palyakovetes;

CREATE DATABASE palyakovetes
	CHARACTER SET utf8mb4
	COLLATE utf8mb4_hungarian_ci;

--
-- Set default database
--
USE palyakovetes;

--
-- Create table `iskola`
--
CREATE TABLE iskola (
  id INT(2) NOT NULL AUTO_INCREMENT,
  nev VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_hungarian_ci;

--
-- Create table `felhasznalo`
--
CREATE TABLE felhasznalo (
  om_azon INT(11) NOT NULL,
  iskolaid INT(2) NOT NULL,
  jelszo VARCHAR(60) NOT NULL,
  admin TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (om_azon)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_hungarian_ci;

--
-- Create index `jelszo` on table `felhasznalo`
--
ALTER TABLE felhasznalo 
  ADD UNIQUE INDEX jelszo(jelszo);

--
-- Create index `iskolaid` on table `felhasznalo`
--
ALTER TABLE felhasznalo 
  ADD UNIQUE INDEX iskolaid(iskolaid);

--
-- Create table `osztaly`
--
CREATE TABLE osztaly (
  id INT(4) NOT NULL AUTO_INCREMENT,
  iskolaid INT(2) NOT NULL,
  felhasznalo_om INT(11) NOT NULL,
  nev VARCHAR(255) NOT NULL,
  vegzesi_ev INT(4) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_hungarian_ci;

--
-- Create foreign key
--
ALTER TABLE osztaly 
  ADD CONSTRAINT osztaly_ibfk_2 FOREIGN KEY (iskolaid)
    REFERENCES iskola(id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Create foreign key
--
ALTER TABLE osztaly 
  ADD CONSTRAINT osztaly_ibfk_3 FOREIGN KEY (felhasznalo_om)
    REFERENCES felhasznalo(om_azon) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Create table `szakma`
--
CREATE TABLE szakma (
  id INT(3) NOT NULL,
  nev VARCHAR(255) NOT NULL,
  szam VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_hungarian_ci;

--
-- Create index `nev` on table `szakma`
--
ALTER TABLE szakma 
  ADD UNIQUE INDEX nev(nev);

--
-- Create index `szam` on table `szakma`
--
ALTER TABLE szakma 
  ADD UNIQUE INDEX szam(szam);

--
-- Create table `agazat`
--
CREATE TABLE agazat (
  id INT(3) NOT NULL,
  nev VARCHAR(255) NOT NULL,
  szam VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_hungarian_ci;

--
-- Create index `nev` on table `agazat`
--
ALTER TABLE agazat 
  ADD UNIQUE INDEX nev(nev);

--
-- Create index `szam` on table `agazat`
--
ALTER TABLE agazat 
  ADD UNIQUE INDEX szam(szam);

--
-- Create table `tanulo`
--
CREATE TABLE tanulo (
  om_azon INT(11) NOT NULL,
  nev VARCHAR(255) NOT NULL,
  osztalyid INT(4) NOT NULL,
  nappali_munkarend TINYINT(1) NOT NULL DEFAULT 1,
  agazatid INT(3) DEFAULT NULL,
  szakid INT(3) DEFAULT NULL,
  PRIMARY KEY (om_azon)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_hungarian_ci;

--
-- Create index `osztalyid` on table `tanulo`
--
ALTER TABLE tanulo 
  ADD UNIQUE INDEX osztalyid(osztalyid);

--
-- Create foreign key
--
ALTER TABLE tanulo 
  ADD CONSTRAINT tanulo_ibfk_5 FOREIGN KEY (osztalyid)
    REFERENCES osztaly(id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Create foreign key
--
ALTER TABLE tanulo 
  ADD CONSTRAINT tanulo_ibfk_6 FOREIGN KEY (agazatid)
    REFERENCES agazat(id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Create foreign key
--
ALTER TABLE tanulo 
  ADD CONSTRAINT tanulo_ibfk_7 FOREIGN KEY (szakid)
    REFERENCES szakma(id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Create table `kategoria`
--
CREATE TABLE kategoria (
  id INT(2) NOT NULL AUTO_INCREMENT,
  megnevezes VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_hungarian_ci;

--
-- Create index `megnevezes` on table `kategoria`
--
ALTER TABLE kategoria 
  ADD UNIQUE INDEX megnevezes(megnevezes);

--
-- Create table `palya`
--
CREATE TABLE palya (
  id INT(11) NOT NULL AUTO_INCREMENT,
  diak_om_azon INT(11) NOT NULL,
  kategoriaid INT(2) NOT NULL,
  leiras VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_hungarian_ci;

--
-- Create index `diak_om_azon` on table `palya`
--
ALTER TABLE palya 
  ADD UNIQUE INDEX diak_om_azon(diak_om_azon);

--
-- Create foreign key
--
ALTER TABLE palya 
  ADD CONSTRAINT palya_ibfk_2 FOREIGN KEY (diak_om_azon)
    REFERENCES tanulo(om_azon) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Create foreign key
--
ALTER TABLE palya 
  ADD CONSTRAINT palya_ibfk_3 FOREIGN KEY (kategoriaid)
    REFERENCES kategoria(id) ON DELETE CASCADE ON UPDATE CASCADE;

-- 
-- Dumping data for table iskola
--
-- Table palyakovetes.iskola does not contain any data (it is empty)

-- 
-- Dumping data for table felhasznalo
--
-- Table palyakovetes.felhasznalo does not contain any data (it is empty)

-- 
-- Dumping data for table szakma
--
-- Table palyakovetes.szakma does not contain any data (it is empty)

-- 
-- Dumping data for table osztaly
--
-- Table palyakovetes.osztaly does not contain any data (it is empty)

-- 
-- Dumping data for table agazat
--
-- Table palyakovetes.agazat does not contain any data (it is empty)

-- 
-- Dumping data for table tanulo
--
-- Table palyakovetes.tanulo does not contain any data (it is empty)

-- 
-- Dumping data for table kategoria
--
-- Table palyakovetes.kategoria does not contain any data (it is empty)

-- 
-- Dumping data for table palya
--
-- Table palyakovetes.palya does not contain any data (it is empty)

-- 
-- Restore previous SQL mode
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Enable foreign keys
-- 
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;