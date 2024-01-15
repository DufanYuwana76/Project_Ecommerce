-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2023 at 03:22 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `miistore`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brd_id` int(11) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `logo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brd_id`, `brand`, `logo`) VALUES
(1, 'RCB X Aprilia', 'aprilia.png'),
(2, 'CFMOTO', 'cf.png'),
(3, 'GRESINI RACING', 'gresini.png'),
(4, 'HONDA ASIA', 'honda.png'),
(5, 'RCB X HRC', 'hrc.png'),
(6, 'KTM FACTORY RACING', 'ktm.png'),
(7, 'LIQUIMOLY', 'liqui.png'),
(8, 'MANDALIKA', 'mandalika.png'),
(9, 'MOONEY VR 46 RACING TEAM', 'mooney.png'),
(10, 'RWRACING GP', 'rwracing.png'),
(11, 'SNIPERS TEAM', 'sniper.png'),
(12, 'TECH 3 X KTM', 'tech3.png'),
(13, 'WITH U X YAMAHA', 'withu.png'),
(14, 'YAMAHA OFFICIAL', 'yamaha.png');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(11) NOT NULL,
  `category` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `category`) VALUES
(1, 'Topwear'),
(2, 'Bottomwear'),
(3, 'Footwear'),
(4, 'Western Wear'),
(5, 'Men Fashion Accessories'),
(6, 'Sports and Active Wear'),
(7, 'Boys Clothing'),
(8, 'Girls Clothing'),
(9, 'Boys Footwear'),
(10, 'Girls Footwear'),
(11, 'Kids Accessories'),
(12, 'Women Clothing');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `clr_id` int(11) NOT NULL,
  `color` varchar(30) NOT NULL,
  `color_cd` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`clr_id`, `color`, `color_cd`) VALUES
(0, 'No Color', ''),
(1, 'White', '#FFFFFF'),
(2, 'Black', '#000000'),
(3, 'Red', '#FF0000'),
(4, 'Yellow', '#FFFF00'),
(5, 'Navy Blue', '#000080'),
(7, 'Brown', '#A52A2A');

-- --------------------------------------------------------

--
-- Table structure for table `counter`
--

CREATE TABLE `counter` (
  `counter_id` int(11) NOT NULL,
  `counter_ip` varchar(50) NOT NULL,
  `counter_date` date NOT NULL,
  `counter_time` time NOT NULL,
  `counter_visit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `counter`
--

INSERT INTO `counter` (`counter_id`, `counter_ip`, `counter_date`, `counter_time`, `counter_visit`) VALUES
(1, '::1', '2023-07-10', '22:54:59', 1),
(2, '::1', '2023-07-11', '14:36:35', 2),
(3, '::1', '2023-07-12', '19:44:25', 1);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_id` varchar(11) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `scat_id` int(11) NOT NULL,
  `brd_id` int(11) NOT NULL,
  `size` varchar(30) NOT NULL,
  `clr_id` varchar(11) NOT NULL,
  `bgimg` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL,
  `detail` text NOT NULL,
  `material_care` mediumtext NOT NULL,
  `price` varchar(11) NOT NULL,
  `discount` varchar(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `available` varchar(10) NOT NULL,
  `creation_date` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`item_id`, `item_name`, `cat_id`, `scat_id`, `brd_id`, `size`, `clr_id`, `bgimg`, `image`, `detail`, `material_care`, `price`, `discount`, `stock`, `available`, `creation_date`) VALUES
('0001', 'R1 SERIES BRAKE CALIPER', 1, 1, 13, 'S,M,L,XL', '2,3,4,5', 'caliper1.png', 'caliper1.png,caliper1.1.png,caliper1.2.png,caliper1.3.png', 'QUICK INFO\nCODE: N/A\nCATEGORIES: BRAKES SYSTEMBRAKE CALIPER\nTAG: UNIVERSAL\n', 'FEATURES\n\n4 piston performance caliper\n4 fastening screws to strengthen the two-piece forged body assembly\nDual sized pistons. 34mm x 2(leading), 30mm x 2(trailing)\nEqual distribution of pressure across brake pads\nLonger life span for brake pads', '700000', '0', 89, 'Ada', '2017-07-03'),
('0002', 'S3 SERIES BRAKE CALIPER', 1, 1, 14, 'S,M,L,XL', '1,3,4,5', 'caliper2.png', 'caliper2.png,caliper2.1.png,caliper2.2.png,caliper2.3.png', 'QUICK INFO\nCODE: N/A\nCATEGORIES: BRAKE CALIPERBRAKES SYSTEM\nTAGS: HONDASUZUKIYAMAHA', 'BRAND	\nYAMAHA, HONDA, SUZUKI\n\nMODEL	\nBEAT/CLICK/VARIO150, BELANG, CLICK, FZ150I, LC4S/EGOS, LC5S/Y125ZR, MSX150, NMAX (R), NMAX/AEROX155/R15, Y15ZR', '860000', '20', 1, 'Ada', '2017-07-03'),
('0003', 'S SERIES REAR CALIPER', 1, 1, 3, 'S,M,L,XL,XXL', '1,3,4,5', 'caliper3.png', 'caliper3.png,caliper3.1.png,caliper3.2.png,caliper3.3.png', 'QUICK INFO\nCODE: N/A\nCATEGORIES: BRAKE CALIPERBRAKES SYSTEM\nTAGS: HONDASUZUKIYAMAHA', 'FEATURES\n\nMade of hard alloy\nHard anodised colour finish\nHigh strength and durability\nImproved piston retraction', '780000', '20', 100, 'Ada', '2017-08-15'),
('0004', 'R55 BRAKE CALIPER', 1, 1, 3, 'S,M,L,XL,XXL', '3,1,2,5', 'caliper4.png', 'caliper4.png,caliper4.1.png,caliper4.2.png,caliper4.3.png', 'QUICK INFO\nCODE: N/A\nCATEGORIES: BRAKES SYSTEMBRAKE CALIPER\nTAG: UNIVERSAL', 'FEATURES:\n\n2-piece aluminium forged body\nDouble 34mm piston, offering strong clamping force and braking power\nIncreases rigidity and stability\nAnodized finishing increase surface protection and durability\nLonger life span for brake pads', '560000', '20', 99, 'Ada', '2017-08-15'),
('0005', 'S-55 SERIES BRAKE CALIPER', 1, 1, 3, 'S,M,L,XL', '5,2,3,4', 'caliper5.png', 'caliper5.png,caliper5.1.png,caliper5.2.png,caliper5.3.png', 'QUICK INFO\nCODE: N/A\nCATEGORIES: BRAKE CALIPERBRAKES SYSTEM\nTAGS: HONDASUZUKIYAMAHA', 'FEATURES\n\nForged monoblock\nVarious anodised colours\nReinforced emboss body\nIncreases rigidity and stability\n32mm single piston', '670000', '20', 99, 'Ada', '2017-08-15'),
('0006', 'RS-1 MASTER BRAKE PUMP – RACING SPEC', 1, 5, 13, 'S,M,L,XL', '2', 'masterrem1.png', 'masterrem1.png', 'QUICK INFO\nCODE: N/A\nCATEGORIES: BRAKES SYSTEMMASTER BRAKE PUMP\nTAG: UNIVERSAL', 'ADDITIONAL INFORMATION \nMODEL	\nUNIVERSAL\n\nPLACEMENT	\nLEFT HAND, RIGHT HAND\n\nSIZE	\n17MM', '780000', '0', 48, 'Ada', '2017-08-15'),
('0007', 'S2 SERIES MASTER BRAKE PUMP', 1, 5, 13, 'S,M,L', '2', 'masterrem2.png', 'masterrem2.png,masterrem2.1.png,masterrem2.2.png', 'QUICK INFO\nCODE: N/A\nCATEGORIES: BRAKES SYSTEMMASTER BRAKE PUMP\nTAGS: HONDAKAWASAKIMODENASSUZUKISYMUNIVERSALYAMAHA\n', 'FEATURES\n\nErgonomic Design\nBrake Fluid Reservoir Tank\nForged Master Cylinder Body\nCollapsible Lever', '800000', '20', 47, 'Ada', '2017-08-15'),
('0008', 'S1 MASTER BRAKE PUMP\n', 1, 5, 1, '38,40,42,44', '1,2,3,4,5', 'masterrem3.png', 'masterrem3.png,masterrem3.1.png,masterrem3.2.png,masterrem3.3.png,masterrem3.4.png', 'QUICK INFO\nCODE: N/A\nCATEGORIES: BRAKES SYSTEMMASTER BRAKE PUMP\nTAGS: HONDA KAWASAKI MODENAS SUZUKI SYM UNIVERSAL YAMAHA\n', 'FEATURES\n\nErgonomic Design\nBrake Fluid Reservoir Tank\nForged Master Cylinder Body\nCollapsible Lever', '780000', '20', 50, 'Ada', '2017-08-15'),
('0009', 'E2 SERIES MASTER BRAKE PUMP', 1, 5, 7, '40,42,44', '2', 'masterrem4.png', 'masterrem4.png,masterrem4.1.png,masterrem4.2.png,masterrem4.3.png', 'QUICK INFO\nCODE: N/A\nCATEGORIES: BRAKES SYSTEMMASTER BRAKE PUMP\nTAGS: HONDAKAWASAKIMODENASSUZUKISYMYAMAHA', 'FEATURES\n\nMade of high quality aluminium alloy\nImproves stopping power performance\nHard-anodized surface to increase corrosion resistance and surface hardness\nTransparent reservoir tank', '564000', '0', 50, 'Ada', '2017-08-21'),
('0010', 'MB-2 PLUS SERIES', 1, 6, 7, '40,42,44,46', '2,1,3,4', 'shock1.png', 'shock1.png,shock1.1.png,shock1.2.png,shock1.3.png', 'QUICK INFO\nCODE: N/A\nCATEGORIES: SUSPENSIONSDUAL SUSPENSION\nTAGS: HONDAUNIVERSALYAMAHA', 'Features:\n\nAdjustable rebound damping\nBig damper piston diameter 30mm\nPiston rod diameter 12.5mm\nAdjustable spring preload\nExternal reservoir piggyback tank\n16 steps rebound adjustable level', '1120000', '0', 50, 'Ada', '2017-08-21'),
('0011', 'A2 SERIES SUSPENSION', 1, 6, 7, '38,40,42,44', '3,4,2', 'shock2.png', 'shock2.png,shock2.1.png,shock2.2.png', 'QUICK INFO\nCODE: N/A\nCATEGORIES: DUAL SUSPENSIONSUSPENSIONS\nTAGS: HONDAMODENASYAMAHA', 'FEATURES\n\nBig Damper Piston Diameter 20mm\nPiston Rod Diameter 10mm\nAdjustable Spring Preload', '500000', '0', 50, 'Ada', '2017-08-21'),
('0012', 'DB-2 PLUS RACE KIT', 1, 6, 7, 'S,M,L', '2', 'shock3.png', 'shock3.png', 'QUICK INFO\nCODE: N/A\nCATEGORIES: MONO SUSPENSIONSUSPENSIONS\nTAGS: HONDAKAWASAKISUZUKIYAMAHA', 'FEATURES\n\nBig Damper Piston Diameter 35mm / 46mm\nHigh Pressure Nitrogen Gas Type\nForged Alloy Top Mount\nPiston Rod Hardened Gold Coating Diameter 16mm\nAdjustable Spring Preload\nAdjustable Rebound Damping\nAdjustable Compression\n1x Set Extra Spring (Softer)\nRotatable Hose\n', '2200000', '0', 100, 'Ada', '2017-12-13'),
('0013', 'S2 LINE', 1, 6, 7, 'S,M,L', '2,3,1,4', 'shock4.png', 'shock4.png,shock4.1.png,shock4.2.png,shock4.3.png', 'QUICK INFO\nCODE: N/A\nCATEGORIES: MONO SUSPENSIONSUSPENSIONS\nTAGS: HONDAKAWASAKISUZUKISYMYAMAHA', 'FEATURES\n\nBig Damper Piston Diameter 30/46mm\nPiston Rod Diameter 16mm\nAdjustable Spring Preload\nAdjustable Rebound Damping\nFull Alloy Body', '1130000', '0', 100, 'Ada', '2017-12-13'),
('0014', 'E2 LINE', 1, 6, 7, 'S,M,L', '3,4,2', 'shock5.png', 'shock5.png,shock5.1.png,shock5.2.png', 'QUICK INFO\nCODE: N/A\nCATEGORIES: MONO SUSPENSIONSUSPENSIONS\nTAGS: HONDASUZUKIYAMAHA', 'FEATURES\n\nBig Damper Piston Diameter 30/46mm\nPiston Rod Diameter 16mm\nAdjustable Spring Preload\nFull Alloy Body', '1000000', '10', 100, 'Ada', '2017-12-13'),
('0015', 'FF SERIES USD FRONT FORK', 1, 6, 7, 'S,M,L', '4,2', 'shock10.png', 'shock10.png,shock10.1.png', 'QUICK INFO\nCODE: N/A\nCATEGORIES: FRONT FORKSUSPENSIONS\nTAG: YAMAHA', 'FEATURES\n\nBig Damper Piston Diameter 20mm\nPiston Rod Diameter 35mm\nHigh Pressure Nitrogen Gas Type\nFull Alloy Body\nAdjustable Spring Preload\nAdjustable Rebound Damping\nAdjustable Compression', '3400000', '25', 100, 'Ada', '2017-12-13'),
('0016', 'RS-1 SINGLE SET FOOTREST – HONDA CBR250RR', 2, 8, 10, 'S,M,L', '0', 'underbone1.png', 'underbone1.png', 'QUICK INFO\nCODE: N/A\nCATEGORIES: FOOT CONTROLSSINGLE SET FOOTREST', 'FEATURES:\n\nMade from 7075-T6 aluminium\nSleek and sporty design\nBetter control and grip\nLightweight\nRace ready and daily use', '2300000', '0', 100, 'Ada', '2017-12-13'),
('0017', 'S2 V2 SINGLE FOOTREST – GSX-R 150', 2, 8, 10, 'S,M,L', '0', 'underbone2.png', 'underbone2.png', 'QUICK INFO\nCODE: N/A\nCATEGORIES: FOOT CONTROLSSINGLE SET FOOTREST\nTAG: SUZUKI', 'ADDITIONAL INFORMATION \nBRAND	\nSUZUKI\n\nMODEL	\nGSX150\n\nCOLOUR	\nSILVER', '2000000', '10', 100, 'Ada', '2017-12-13'),
('0018', 'S2 V2 SINGLE FOOTREST – Y16ZR', 2, 8, 10, '38,40,42,46', '0', 'underbone3.png', 'underbone3.png', 'QUICK INFO\nCODE: N/A\nCATEGORIES: FOOT CONTROLSSINGLE SET FOOTREST\nTAG: YAMAHA', 'ADDITIONAL INFORMATION \nBRAND	\nYAMAHA\n\nMODEL	\nY16ZR\n\nCOLOUR	\nBLACK', '1800000', '20', 50, 'Ada', '2017-12-13'),
('0019', 'S4 SINGLE SET FOOTREST', 2, 8, 10, '38,40,42', '0', 'underbone4.png', 'underbone4.png', 'QUICK INFO\nCODE: 01FR024\nCATEGORIES: FOOT CONTROLSSINGLE SET FOOTREST\nTAG: SUZUKI', 'FEATURES\n\n– Giving riders the most comfortable and relaxed riding position\n– Better control of the bike\n– Made of 6063-T6 aluminium block for a unique fit\n– Variety of footrest positions while ensuring the feet in a safe distance', '2000000', '20', 50, 'Ada', '2017-12-13'),
('0020', 'S3 FULL SET FOOTREST', 2, 8, 10, '39,40,42,44', '1,2,4', 'underbone5.png', 'underbone5.png,underbone5.1.png,underbone5.2.png', 'QUICK INFO\nCODE: N/A\nCATEGORIES: FOOT CONTROLSFULL SET FOOTREST\nTAG: SUZUKI', 'FEATURES\n\nSleek and sporty design\nBetter control and grip\nMade from CNC-machined aluminium alloy with an anodised finish\nMultiple footrest positions options to suit any riding position', '3200000', '20', 50, 'Ada', '2017-12-13'),
('0021', 'S2 FULL SET FOOTREST – YAMAHA Y15ZR', 2, 8, 10, 'S,M,L,XL', '5,2,3,4,1', 'underbone6.png', 'underbone6.png,underbone6.1.png,underbone6.2.png,underbone6.3.png,underbone6.4.png', 'QUICK INFO\nCODE: N/A\nCATEGORIES: FOOT CONTROLSFULL SET FOOTREST\nTAG: YAMAHA', 'FEATURES\n\nSleek and sporty design\nBetter control and grip\nMade from CNC-machined aluminium alloy with anodised finish\nMultiple footrest position options to suit any riding position\n', '3500000', '0', 50, 'Ada', '2017-12-14'),
('0022', 'CR55 CARBON RIM', 1, 2, 10, 'S,M,L,XL,XXL', '0', 'velg1.png', 'velg1.png', 'QUICK INFO\nCODE: N/A\nCATEGORIES: CARBON RIMRIM AND ACCESSORIES\nTAG: YAMAHA', 'FEATURES\n\nOne-piece carbon fibre design\nAnt-rust. Resist to corrosion', '2200000', '0', 50, 'Ada', '2017-12-14'),
('0023', 'SP522', 1, 2, 10, 'S,M,L,XL', ',4,2,1', 'velg2.png', 'velg2.png,velg2.1.png,velg2.2.png,velg2.3.png,velg2.4.png', 'QUICK INFO\nCODE: N/A\nCATEGORIES: RIM AND ACCESSORIESSPORT RIM\nTAGS: HONDAKAWASAKISUZUKIYAMAHA', 'DESCRIPTION ADDITIONAL INFORMATION \nPROVEN ON RACE TRACK AND STREET\n\nMade from Aluminum Alloy, the SP522’s 5-spoke design enables riders’ to gain speed by reducing the overall weight without comprising structural integrity. Currently the PREFFERED RIMS for the Asia Road Racing Championship, the SP522 has proven its worth in extreme conditions giving you the confidence you need on the road.', '1700000', '0', 49, 'Ada', '2017-12-14'),
('0024', 'SP811', 1, 2, 10, 'S,M,L,XL', '2,5,1,4', 'velg3.png', 'velg3.png,velg3.1.png,velg3.3.png,velg3.4.png', 'QUICK INFO\nCODE: N/A\nCATEGORIES: RIM AND ACCESSORIESSPORT RIM\nTAGS: HONDAMODENASSUZUKIYAMAHA', 'FEATURES\n\nA 6-spoke design that enhances structural strength for all riding conditions\nIntegrated bearing hole for superior strength and durability', '2000000', '0', 49, 'Ada', '2017-12-14'),
('0025', 'SP399', 1, 2, 10, 'S,M,L,XL', '1,2,4,5', 'velg4.png', 'velg4.png,velg4.1.png,velg4.2.png,velg4.3.png', 'QUICK INFO\nCODE: N/A\nCATEGORIES: RIM AND ACCESSORIESSPORT RIM\nTAGS: HONDAMODENASSUZUKIYAMAHA', 'FEATURES\n\nSaves weight and increase rigidity\n3 -spoke design with powder coated finishing', '1500000', '0', 50, 'Ada', '2017-12-14'),
('0026', 'SP688', 1, 2, 10, 'S,M,L,XL', '0', 'velg5.png', 'velg5.png,velg5.1.png,velg5.2.png', 'QUICK INFO\nCODE: N/A\nCATEGORIES: RIM AND ACCESSORIESSPORT RIM\nTAGS: HONDAMODENASSUZUKIYAMAHA', 'FEATURES\n\nDurable and High-end finish\nHight rigidity and lightweight\nSmooth spoke lines and deep concave', '1800000', '0', 50, 'Ada', '2017-12-14'),
('0027', 'FG525', 1, 2, 10, 'S,M,L,XL', '2,3,4,5', 'velg6.png', 'velg6.png,velg6.1.png,velg6.2.png,velg6.3.png,velg6.4.png', 'QUICK INFO\nCODE: N/A\nCATEGORIES: FORGED RIMRIM AND ACCESSORIES\nTAGS: KAWASAKIYAMAHA\n', 'FEATURES\n\nThe FG525 is designed for its structural strength with a reduced overall weight. ‘Less weight’ provides a quicker acceleration response while providing less strain on the suspension components. In extreme riding temperatures, the FG525 is designed to dissipate heat away from the braking system to ensure optimum breaking response.\n\nForged from 6000 series aluminum alloy, the FG525 is designed to adapt to any road conditions while maximizing your bike’s looks and performance.', '300000', '0', 50, 'Ada', '2017-12-14');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `member_id` varchar(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(80) NOT NULL,
  `state` varchar(60) NOT NULL,
  `zip_code` varchar(10) NOT NULL,
  `phone` varchar(18) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `reg_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`member_id`, `fullname`, `gender`, `address`, `city`, `state`, `zip_code`, `phone`, `email`, `password`, `reg_date`) VALUES
('0001', 'Aplora Sanerati', 'Perempuan', 'Perum Karanglo', 'Malang', 'Jawa Timur', '65112', '+6282345678910', 'iamaplora@gmail.com', '849f6a6ce05b17d5e5351044f1378f47', '2017-10-11'),
('0002', 'IT Pedia', 'Laki-laki', 'udinus', 'semarang', 'jateng', '123', '08121212121', 'itpedia@mail.com', '25d55ad283aa400af464c76d713c07ad', '2023-07-12');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` varchar(11) NOT NULL,
  `customer_id` varchar(11) NOT NULL,
  `owner_name` varchar(50) NOT NULL,
  `cardbank_type` varchar(12) NOT NULL,
  `card_number` varchar(100) NOT NULL,
  `payment_status` varchar(11) NOT NULL,
  `totals` varchar(11) NOT NULL,
  `creation_date` date NOT NULL,
  `creation_time` time NOT NULL DEFAULT '00:00:00',
  `order_status` varchar(11) NOT NULL,
  `order_valid_date` date NOT NULL,
  `order_valid_time` time NOT NULL DEFAULT '00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `owner_name`, `cardbank_type`, `card_number`, `payment_status`, `totals`, `creation_date`, `creation_time`, `order_status`, `order_valid_date`, `order_valid_time`) VALUES
('0001', '0001', 'Aplora Sanerati', 'Bank BNI', '327381983', 'PAID', '198400', '2017-10-11', '19:27:17', 'SENT', '2017-10-11', '19:38:13'),
('0002', '0001', 'Aplora Sanerati', 'Bank BNI', '327381983', 'PAID', '103200', '2018-01-04', '18:07:24', 'SENT', '2018-01-05', '19:05:53'),
('0003', '0003', 'dupan', 'Bank BCA', '1212121121', 'PAID', '640000', '2023-07-11', '14:41:02', 'PENDING', '2023-07-11', '14:41:02'),
('0004', '0002', 'ITpedia', 'Bank BCA', '1212121121', 'PAID', '700000', '2023-07-12', '20:11:11', 'PENDING', '2023-07-12', '20:11:11'),
('0005', '0002', 'ITpedia', 'Bank BCA', '1212121121', 'PAID', '1700000', '2023-07-12', '20:13:44', 'PENDING', '2023-07-12', '20:13:44'),
('0006', '0002', 'ITpedia', 'Bank BCA', '1212121121', 'PAID', '2000000', '2023-07-12', '20:15:35', 'PENDING', '2023-07-12', '20:15:35');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `detail_id` int(11) NOT NULL,
  `order_id` varchar(11) NOT NULL,
  `bgimg` varchar(100) NOT NULL,
  `item_code` varchar(11) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `color` varchar(11) NOT NULL,
  `size` varchar(5) NOT NULL,
  `qty` int(11) NOT NULL,
  `disc` int(3) NOT NULL,
  `price` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`detail_id`, `order_id`, `bgimg`, `item_code`, `item_name`, `color`, `size`, `qty`, `disc`, `price`) VALUES
(1, '0001', '0818shirt13.jpg', '0007', 'PURYS Women Cream-Coloured Printed Top', '', 'M', 1, 20, '119000'),
(2, '0001', '0818shirt5.jpg', '0002', 'Relaxed Lace-Trim Sleeveless Top for Women', 'White', 'M', 1, 20, '129000'),
(3, '0002', '0818shirt5.jpg', '0002', 'Relaxed Lace-Trim Sleeveless Top for Women', 'White', 'M', 1, 20, '129000'),
(4, '0003', 'masterrem2.png', '0007', 'S2 SERIES MASTER BRAKE PUMP', '', '', 1, 20, '800000'),
(5, '0004', 'caliper1.png', '0001', 'R1 SERIES BRAKE CALIPER', 'Black', '', 1, 0, '700000'),
(6, '0005', 'velg2.png', '0023', 'SP522', 'Yellow', '', 1, 0, '1700000'),
(7, '0006', 'velg3.png', '0024', 'SP811', 'Yellow', '', 1, 0, '2000000');

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `scat_id` int(11) NOT NULL,
  `subcategory` varchar(50) NOT NULL,
  `cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`scat_id`, `subcategory`, `cat_id`) VALUES
(1, 'T-Shirt', 1),
(2, 'Casual Shirts', 1),
(3, 'Formal Shirts', 1),
(4, 'Sweaters and Sweatshirts', 1),
(5, 'Jackets', 1),
(6, 'Blazers and Coats', 1),
(7, 'Suits', 1),
(8, 'Jeans', 2),
(9, 'Casual Trousers', 2),
(10, 'Formal Trousers', 2),
(11, 'Shorts', 2),
(12, 'Shirts Women', 14),
(13, 'Tops, T-Shirts and Shirts', 4),
(14, 'Jackets and Waistcoats', 4),
(15, 'Boys T-Shirts', 7),
(16, 'Girls Tops and T-shirts', 8),
(17, 'Boys Shirts', 7),
(18, 'Girls Dresses', 8),
(19, 'Boys Jackets', 7),
(20, 'Girls Sweaters', 8),
(21, 'Girls Jeans and Trousers', 8),
(22, 'Boys Jeans and Trousers', 7),
(23, 'Boys Track Pants', 7),
(24, 'Girls Track Pants', 8),
(25, 'Boys Casual Shoes', 9),
(26, 'Boys Sports Shoes', 9),
(27, 'Shorts and Skirts', 4);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `fullname` varchar(50) CHARACTER SET latin1 NOT NULL,
  `user` varchar(30) CHARACTER SET latin1 NOT NULL,
  `pass` varchar(50) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `fullname`, `user`, `pass`) VALUES
(1, 'Victory Webstore', 'admin', '0192023a7bbd73250516f069df18b500');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brd_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`clr_id`);

--
-- Indexes for table `counter`
--
ALTER TABLE `counter`
  ADD PRIMARY KEY (`counter_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`member_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`detail_id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`scat_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `clr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `counter`
--
ALTER TABLE `counter`
  MODIFY `counter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `scat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
