-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 13, 2017 at 05:20 PM
-- Server version: 5.7.20-0ubuntu0.17.10.1
-- PHP Version: 7.1.11-0ubuntu0.17.10.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perguruan_tinggi_indonesia`
--

-- --------------------------------------------------------

--
-- Table structure for table `perguruan_tinggi`
--

CREATE TABLE `perguruan_tinggi` (
  `Id_perguruan_tinggi` int(5) NOT NULL,
  `Nama_perguruan_tinggi` varchar(60) NOT NULL,
  `Alamat` varchar(50) NOT NULL,
  `Provinsi` varchar(30) NOT NULL,
  `No_telepon` varchar(13) NOT NULL,
  `Id_rektor` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perguruan_tinggi`
--

INSERT INTO `perguruan_tinggi` (`Id_perguruan_tinggi`, `Nama_perguruan_tinggi`, `Alamat`, `Provinsi`, `No_telepon`, `Id_rektor`) VALUES
(1, 'Politeknik Negeri Lhokseumawe', 'Jl. Trunojoyo No. 81', 'Aceh', '06272502343', 1001),
(2, 'Universitas Syiah Kuala', 'Jl. Buah No. 39', 'Aceh', '06272384372', 1002),
(3, 'Universitas Malikussaleh', 'Jl. Merpati No. 65', 'Aceh', '06278929292', 1003),
(4, 'Universitas Samudra', 'Jl. Soekarno Hatta No. 81', 'Aceh', '06277536272', 1004),
(5, 'Universitas Teuku Umar', 'Jl. Sereh No.91', 'Aceh', '06276878222', 1005),
(6, 'Universitas Sumatera Utara', 'Jl. Cikajang No. 48', 'Sumatera Utara', '0617271271', 1006),
(7, 'Universitas Negeri Medan', 'Jl. Ciniru No.11', 'Sumatera Utara', '0617272723', 1007),
(8, 'Politeknik Negeri Medan', 'Jl. Sei Yahya No. 1', 'Sumatera Utara', '061898672', 1008),
(9, 'Universitas Andalas', 'Jl. Cokroaminoto No. 11', 'Sumatera Barat', '0751226321', 1009),
(10, 'Universitas Negeri Padang', 'Jl. Gadang No. 8', 'Sumatera Barat', '075127737', 1010),
(11, 'Politeknik Negeri Padang', 'Jl. Pulo Karam No. 4', 'Sumatera Barat', '0751627382', 1011),
(12, 'Politeknik Pertanian Negeri Payakumbuh', 'Jl. Nipah No. 33', 'Sumatera Barat', '0751283928', 1012),
(13, 'Sekolah Tinggi Seni Indonesia Padang Panjang', 'Jl. Angkasa No. 32', 'Sumatera Barat', '0751273921', 1013),
(14, 'Politeknik Kesehatan Kemenkes Riau', 'Jl. Cut Meutia No. 23', 'Riau', '076071828', 1014),
(15, 'Universitas Riau', 'Jl. Iskandar Muda No. 44', 'Riau', '076071728', 1015),
(16, 'Politeknik Negeri Bengkalis', 'Jl. Sultan Maiussaleh No 3', 'Kepulauan Riau', '077122243', 1016),
(17, 'Universitas Maritim Raja Ali Haji', 'Jl. W. R. Supratman No. 7', 'Kepulauan Riau', '077182736', 1017),
(18, 'Politeknik Negeri Batam', 'Jl. Cik Ditiro No. 88', 'Kepulauan Riau', '077127272', 1018),
(19, 'Politeknik Kesehatan Kemenkes Jambi', 'Jl. Ahmad Yani No. 4', 'Jambi', '074055223', 1019),
(20, 'Universitas Jambi', 'Jl. Malahayati No. 10', 'Jambi', '074037272', 1020),
(21, 'Universitas Bengkulu', 'Jl. Dr. Sutomo No. 5', 'Bengkulu', '0732434233', 1021),
(22, 'Universitas Sriwijaya', 'Jl. Teungku Diujung No. 40', 'Sumatera Selatan', '0702543522', 1022),
(23, 'Politeknik Negeri Sriwijaya', 'Jl. Singkil No. 98', 'Sumatera Selatan', '0702828333', 1023),
(24, 'Universitas Lampung', 'Jl. Panglima Polim No 78', 'Lampung', '0721645342', 1024),
(25, 'Institut Teknologi Sumatera', 'Jl. Syech Abdurrauf No. 11', 'Lampung', '0721635464', 1025),
(26, 'Politeknik Negeri Lampung', 'Jl. Peutua Husen No. 4', 'Lampung', '0721873737', 1026),
(27, 'Universitas Bangka Belitung', 'Jl. Djuanda No. 22', 'Bangka Belitung', '0715766373', 1027),
(28, 'Politeknik Manufaktur Negeri', 'Jl. Yos Sudarso No. 15', 'Bangka Belitung', '0715388484', 1028),
(29, 'Universitas Sultan Ageng Tirtayasa', 'Jl. Cut Nyak Dien No. 17', 'Banten', '0252877448', 1029),
(30, 'Universitas Terbuka', 'Jl. Bachtiar No. 22', 'Banten', '0252776663', 1030),
(31, 'Politeknik Negeri Jakata', 'Jl. Hayam Wuruk No. 96', 'DKI Jakarta', '0217342527', 1031),
(32, 'Politeknik Negeri Media Kreatif', 'Jl. Kembangan No. 223', 'DKI Jakarta', '0217546372', 1032),
(33, 'Universitas Indonesia', 'Jl. Wolter Monginsidi No. 2', 'DKI Jakarta', '0217666333', 1033),
(34, 'Universitas Negeri Jakarta', 'Jl. Pademangan No. 77', 'DKI Jakarta', '0215374840', 1034),
(35, 'Universitas Pembangunan Nasional \"Veteran\" Jakarta', 'Jl. Cipucang No. 43', 'DKI Jakarta', '0215239393', 1035),
(36, 'Institut Pertanian Bogor', 'Jl. Pajajaran No. 65', 'Jawa Barat', '022736262', 1036),
(37, 'Institut Seni Budaya Indonesia Bandung', 'Jl. Diponegoro No. 165', 'Jawa Barat', '022637844', 1037),
(38, 'Institut Teknologi Bandung', 'Jl. Cibeber No. 23', 'Jawa Barat', '022616153', 1038),
(39, 'Politeknik Kesehatan Kemenkes Tasikmalaya', 'Jl. Dharmawangsa No. 11', 'Jawa Barat', '022615383', 1039),
(40, 'Politeknik Negeri Bandung', 'Jl. Otto Iskandardinata No. 201', 'Jawa Barat', '022884737', 1040),
(41, 'Politeknik Negeri Indramayu', 'Jl. Veteran No. 282', 'Jawa Barat', '022613939', 1041),
(42, 'Politeknik Negeri Subang', 'Jl. Setiabudi No. 54', 'Jawa Barat', '022883636', 1042),
(43, 'Universitas Padjajaran', 'Jl. Gempol Wetan No. 132', 'Jawa Barat', '022778939', 1043),
(44, 'Universitas Pendidikan Indonesia', 'Jl. Kesehatan No. 23', 'Jawa Barat', '022948382', 1044),
(45, 'Universitas Siliwangi', 'Jl. Dahlia No. 187', 'Jawa Barat', '022668993', 1045),
(46, 'Universitas Singaperbangsa Karawang', 'Jl. Sukajadi No. 11', 'Jawa Barat', '022768757', 1046),
(47, 'Institut Seni Indonesia Surakarta', 'Jl. K. H. Agus Salim 16', 'Jawa Tengah', '024536373', 1047),
(48, 'Politeknik Kesehatan Kemenkes Surakarta', 'Jl. Taman Margasatwa No. 12', 'Jawa Tengah', '024648494', 1048),
(49, 'Politeknik Negeri Cilacap', 'Jl. Tebet Raya No. 84', 'Jawa Tengah', '024883838', 1049),
(50, 'Politeknik Negeri Semarang', 'Jl. Metro No.23', 'Jawa Tengah', '024838383', 1050),
(51, 'Politeknik Maritim Negeri Indonesia', 'Jl. Bacang No.2', 'Jawa Tengah', '024726262', 1051),
(52, 'Univeresitas Diponegoro', 'Jl. Benda No. 20', 'Jawa Tengah', '024726819', 1052),
(53, 'Universitas Jenderal Soedirman', 'Jl. Alam Segar 3 No. 8', 'Jawa Tengah', '024726373', 1053),
(54, 'Universitas Negeri Semarang', 'Jl. KH. Asahari No. 34', 'Jawa Tengah', '024872733', 1054),
(55, 'Universitas Sebelas Maret', 'Jl. Arya Putra No. 67', 'Jawa Tengah', '024762638', 1055),
(56, 'Universitas Tidar', 'Jl. Buaran Raya Blok D No. 1', 'Jawa Tengah', '024887767', 1056),
(57, 'Institut Seni Indonesia Yogyakarta', 'Jl. Basuki Rahmat No. 50', 'Daerah Istimewa Yogyakarta', '027466778', 1057),
(58, 'Universitas Gadjah Mada', 'Jl. Hayam Wuruk No. 8', 'Daerah Istimewa Yogyakarta', '027499299', 1058),
(59, 'Universitas Negeri Yogyakarta', 'Jl. Diponegoro No. 28', 'Daerah Istimewa Yogyakarta', '027488766', 1059),
(60, 'Universitas Pembangunan Nasional Veteran', 'Jl. M. T. Haryono No. 64', 'Daerah Istimewa Yogyakarta', '027456776', 1060),
(61, 'Politeknik Kesehatan Kemenkes Malang', 'Jl. Bandara Rembele No. 11', 'Jawa Timur', '0316363636', 1061),
(62, 'Politeknik Kesehatan Kemenkes Surabaya', 'Jl. Pengadilan No. 8', 'Jawa Timur', '0318373734', 1062),
(63, 'Politeknik Negeri Banyuwangi', 'Jl. Jend. Sudirman No. 15', 'Jawa Timur', '0317574736', 1063),
(64, 'Politeknik Negeri Jember', 'Jl. Jend. Gatot Subroto No. 77', 'Jawa Timur', '0314654839', 1064),
(65, 'Politeknik Negeri Madiun', 'Jl. Pahlawan No. 56', 'Jawa Timur', '0318473732', 1065),
(66, 'Politeknik Negeri Madura', 'Jl. Jamin No. 6', 'Jawa Timur', '0317264754', 1066),
(67, 'Politeknik Negeri Malang', 'Jl. Merdeka No 43', 'Jawa Timur', '0316657383', 1067),
(68, 'Politeknik Perkapalan Negeri Surabaya', 'Jl. Ahmad Yani No. 33', 'Jawa Timur', '0318374647', 1068),
(69, 'Universitas Airlangga', 'Jl. Jend. Sudirman No. 99', 'Jawa Timur', '0318928483', 1069),
(70, 'Universitas Brawijaya', 'Jl. Pancasila No. 12', 'Jawa Timur', '0317628494', 1070),
(71, 'Universitas Jember', 'Jl. Raja No. 32', 'Jawa Timur', '0319388288', 1071),
(72, 'Universitas Negeri Malang', 'Jl. Proklamasi No. 40', 'Jawa Timur', '0313744949', 1072),
(73, 'Universitas Negeri Surabaya', 'Jl. Asahan No. 22', 'Jawa Timur', '0313747563', 1073),
(74, 'Universitas Pembangunan Nasional \"Veteran\" Jawa Timur', 'Jl. Patuan Nagari No. 34', 'Jawa Timur', '0314353627', 1074),
(75, 'Universitas Trunojoyo Madura', 'Jl. Khatib Sulaiman No. 3', 'Jawa Timur', '0314736262', 1075),
(76, 'Institut Seni Indonesia Denpasar', 'Jl. Sembilan No. 33', 'Bali', '036184939', 1076),
(77, 'Politeknik Kesehatan Kemenkes Bali', 'Jl. Jend. Sudirman No. 64', 'Bali', '036138282', 1077),
(78, 'Politeknik Negeri Bali', 'Jl. Veteran No. 23', 'Bali', '036138212', 1078),
(79, 'Universitas Udayana', 'Jl. Jend. Gatot Subroto No. 65', 'Bali', '036172728', 1079),
(80, 'Universitas Pendidikan Ganesha', 'Jl. Soekarno Hatta No. 98', 'Bali', '036183828', 1080),
(81, 'Universitas Mataram', 'Jl. Moh. Hatta No. 50', 'Nusa Tenggara Barat', '036455252', 1081),
(82, 'Politeknik Negeri Kupang', 'Jl. Tanjung Pati No. 34', 'Nusa Tenggara Timur', '038055243', 1082),
(83, 'Politeknik Pertanian Negeri Kupang', 'Jl. M. Yamin No. 89', 'Nusa Tenggara Timur', '038053628', 1083),
(84, 'Universitas Nusa Cendana', 'Jl. Pasaman Baru No. 2', 'Nusa Tenggara Timur', '038079399', 1084),
(85, 'Universitas Timor', 'Jl. Karimun No. 22', 'Nusa Tenggara Timur', '038092828', 1085),
(86, 'Politeknik Negeri Ketapang', 'Jl. Bukit Datuk No. 2', 'Kalimantan Barat', '056193939', 1086),
(87, 'Politeknik Negeri Pontianak', 'Jl. Letnan Boyak No. 11', 'Kalimantan Barat', '056177272', 1087),
(88, 'Politeknik Kesehatan Kemenkes Pontianak', 'Jl. Putri No. 87', 'Kalimantan Barat', '056174727', 1088),
(89, 'Politeknik Negeri Sambas', 'Jl. Diponegoro No. 12', 'Kalimantan Barat', '056182828', 1089),
(90, 'Universitas Tanjungpura', 'Jl. Hang Tuah No. 6', 'Kalimantan Barat', '056127339', 1090),
(91, 'Universitas Palangka Raya', 'Jl. Lintasan No. 33', 'Kalimantan Tengah', '051355262', 1091),
(92, 'Politeknik Negeri Banjarmasin', 'Jl. Thaher No. 49', 'Kalimantan Selatan', '051166338', 1092),
(93, 'Politeknik Negeri Tanah Laut', 'Jl. Toegino No. 29', 'Kalimantan Selatan', '051188383', 1093),
(94, 'Politeknik Kesehatan Kemenkes Banjarmasin', 'Jl. Depati Parbo No. 24', 'Kalimantan Selatan', '051177828', 1094),
(95, 'Universitas Lambung Mangkurat', 'Jl. Lintas Timur No. 22', 'Kalimantan Selatan', '051199373', 1095),
(96, 'Institut Teknologi Kalimantan', 'Jl. Tebo No. 28', 'Kalimatan Timur', '054183828', 1096),
(97, 'Politeknik Negeri Balikpapan', 'Jl. Rivai No. 16', 'Kalimatan Timur', '054126373', 1097),
(98, 'Politeknik Negeri Samarinda', 'Jl. Letnan Muchtar Saleh No. 19', 'Kalimatan Timur', '054162626', 1098),
(99, 'Politeknik Pertanian Negeri Samarinda', 'Jl. Barlian No. 28', 'Kalimatan Timur', '054138282', 1099),
(100, 'Universitas Mulawarman', 'Jl. Kembang No. 87', 'Kalimatan Timur', '054177363', 1100),
(101, 'Universitas Borneo Tarakan', 'Jl. Merdeka No. 99', 'Kalimantan Utara', '055177382', 1101),
(102, 'Universitas Sulawesi Barat', 'Jl. Depati Said No. 22', 'Sulawesi Barat', '042284848', 1102),
(103, 'Politeknik Negeri Manado', 'Jl. Sriwijaya No. 12', 'Sulawesi Utara', '043052525', 1103),
(104, 'Politeknik Negeri Nusa Utara', 'Jl. S. Parman No. 46', 'Sulawesi Utara', '043055151', 1104),
(105, 'Universitas Negeri Manado', 'Jl. Pemuda No. 17', 'Sulawesi Utara', '043061616', 1105),
(106, 'Universitas Sam Ratulangi', 'Jl. Pengadilan No. 86', 'Sulawesi Utara', '043071717', 1106),
(107, 'Universitas Negeri Gorontalo', 'Jl. Bhayangkara No. 10', 'Gorontalo', '044577737', 1107),
(108, 'Universitas Tadulako', 'Jl. Pramuka No. 81', 'Sulawesi Tengah', '044572727', 1108),
(109, 'Institut Teknologi Bacharuddin Jusuf Habibie', 'Jl. Merdeka No. 11', 'Sulawesi Selatan', '041072333', 1109),
(110, 'Politeknik Teknologi Negeri Bone', 'Jl. Siliwangi No. 74', 'Sulawesi Selatan', '041062626', 1110),
(111, 'Universitas Hasanuddin', 'Jl. Singawinata No. 15', 'Sulawesi Selatan', '041025373', 1111),
(112, 'Universitas Negeri Makassar', 'Jl. Gajah Mada No. 11', 'Sulawesi Selatan', '041047272', 1112),
(113, 'Universitas 19 November', 'Jl. Cemara No. 83', 'Sulawesi Tenggara', '040177262', 1113),
(114, 'Universitas Haluoleo', 'Jl. Raden Intan No. 29', 'Sulawesi Tenggara', '040166262', 1114),
(115, 'Politeknik Negeri Ambon', 'Jl. Indra Bangsawan No. 28', 'Maluku', '091026362', 1115),
(116, 'Universitas Pattimura', 'Jl. Raden Jambat No. 65', 'Maluku', '091027373', 1116),
(117, 'Universitas Khairun', 'Jl. Sampurna Jaya No. 1', 'Maluku Utara', '092163636', 1117),
(118, 'Institut Seni Budaya Indonesia Tanah Papua', 'Jl. Negara No. 100', 'Papua', '090162622', 1118),
(119, 'Universitas Cendrawasih', 'Jl. Bawang No. 88', 'Papua', '090155353', 1119),
(120, 'Universitas Musamus Merauke', 'Jl. Ampera No. 76', 'Papua', '090152424', 1120),
(121, 'Politeknik Negeri Fakfak', 'Jl. Dr. Sumarno No. 1', 'Papua Barat', '095155242', 1121),
(122, 'Universitas Papua', 'Jl. Jend. Sudirman No. 199', 'Papua Barat', '095162626', 1122);

-- --------------------------------------------------------

--
-- Table structure for table `rektor`
--

CREATE TABLE `rektor` (
  `Id_rektor` int(5) NOT NULL,
  `Nama_rektor` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rektor`
--

INSERT INTO `rektor` (`Id_rektor`, `Nama_rektor`, `Email`) VALUES
(1001, 'Edd Wicks', 'ewicks0@tumblr.com'),
(1002, 'Aharon Romaines', 'aromaines1@aol.com'),
(1003, 'Edithe Kleyn', 'ekleyn2@w3.org'),
(1004, 'Cecil Calf', 'ccalf3@google.co.uk'),
(1005, 'Sybille Wiltshier', 'swiltshier4@yelp.com'),
(1006, 'Janos Spinetti', 'jspinetti5@cocolog-nifty.com'),
(1007, 'Deb Goudman', 'dgoudman6@list-manage.com'),
(1008, 'Rahal Grutchfield', 'rgrutchfield7@wiley.com'),
(1009, 'Patric Summersett', 'psummersett8@jigsy.com'),
(1010, 'Colly Ortes', 'cortes9@nymag.com'),
(1011, 'Lara Gopsill', 'lgopsilla@tripod.com'),
(1012, 'Lucian Hinze', 'lhinzeb@amazon.co.jp'),
(1013, 'Lenci Hendrik', 'lhendrikc@jalbum.net'),
(1014, 'Ephraim Norheny', 'enorhenyd@prweb.com'),
(1015, 'Orazio Garric', 'ogarrice@bigcartel.com'),
(1016, 'Audy Rossbrooke', 'arossbrookef@noaa.gov'),
(1017, 'Jacques Christie', 'jchristieg@liveinternet.ru'),
(1018, 'Clemmy Lake', 'clakeh@smugmug.com'),
(1019, 'Steven Gahan', 'sgahani@globo.com'),
(1020, 'Mariellen Walshaw', 'mwalshawj@salon.com'),
(1021, 'Matthew Yeabsley', 'myeabsleyk@mozilla.org'),
(1022, 'Jacquenetta Goldfinch', 'jgoldfinchl@diigo.com'),
(1023, 'Mattias Shakelade', 'mshakeladem@soup.io'),
(1024, 'Chickie Darcy', 'cdarcyn@google.pl'),
(1025, 'Christiano Maggiori', 'cmaggiorio@china.com.cn'),
(1026, 'Gan Fetherston', 'gfetherstonp@disqus.com'),
(1027, 'Elle Lawlan', 'elawlanq@is.gd'),
(1028, 'Aveline Patershall', 'apatershallr@globo.com'),
(1029, 'Paulo Hampe', 'phampes@newsvine.com'),
(1030, 'Mia Glencrosche', 'mglencroschet@wix.com'),
(1031, 'Andie Souttar', 'asouttaru@hud.gov'),
(1032, 'York Loble', 'yloblev@narod.ru'),
(1033, 'Harmonie Simko', 'hsimkow@prlog.org'),
(1034, 'Gherardo Lazer', 'glazerx@economist.com'),
(1035, 'Vonny Horsburgh', 'vhorsburghy@upenn.edu'),
(1036, 'Appolonia Barkworth', 'abarkworthz@tinypic.com'),
(1037, 'Merry Dobbs', 'mdobbs10@gravatar.com'),
(1038, 'Alla Allot', 'aallot11@bing.com'),
(1039, 'Domingo Barby', 'dbarby12@blinklist.com'),
(1040, 'Selina Carse', 'scarse13@usnews.com'),
(1041, 'Delila O\'Brollachain', 'dobrollachain14@wikia.com'),
(1042, 'Ryley Scrimshaw', 'rscrimshaw15@cdc.gov'),
(1043, 'Merle Wingham', 'mwingham16@goo.ne.jp'),
(1044, 'Lark Kolakovic', 'lkolakovic17@canalblog.com'),
(1045, 'Mayer Blaydes', 'mblaydes18@biblegateway.com'),
(1046, 'Renelle Lent', 'rlent19@yahoo.co.jp'),
(1047, 'Perren Smeed', 'psmeed1a@smh.com.au'),
(1048, 'Paule Pearde', 'ppearde1b@cnn.com'),
(1049, 'Zora Miroy', 'zmiroy1c@timesonline.co.uk'),
(1050, 'Wyn Trimme', 'wtrimme1d@ucoz.ru'),
(1051, 'Germain Canniffe', 'gcanniffe1e@e-recht24.de'),
(1052, 'Savina Basek', 'sbasek1f@github.io'),
(1053, 'Adlai Howden', 'ahowden1g@51.la'),
(1054, 'Vilhelmina Schaffel', 'vschaffel1h@google.ru'),
(1055, 'Natalee Brazenor', 'nbrazenor1i@wordpress.org'),
(1056, 'Fran Creed', 'fcreed1j@amazon.com'),
(1057, 'Si Baldinotti', 'sbaldinotti1k@lulu.com'),
(1058, 'Christin Ahern', 'cahern1l@themeforest.net'),
(1059, 'Monique Crissil', 'mcrissil1m@istockphoto.com'),
(1060, 'Wes Veitch', 'wveitch1n@weather.com'),
(1061, 'Katharine Mewis', 'kmewis1o@weebly.com'),
(1062, 'Virge Gotliffe', 'vgotliffe1p@de.vu'),
(1063, 'Cornela Woolfoot', 'cwoolfoot1q@telegraph.co.uk'),
(1064, 'Matilde Swaysland', 'mswaysland1r@harvard.edu'),
(1065, 'Windy Poole', 'wpoole1s@hao123.com'),
(1066, 'Bank Lambillion', 'blambillion1t@fastcompany.com'),
(1067, 'Kippy De Moreno', 'kde1u@vkontakte.ru'),
(1068, 'Caron Standfield', 'cstandfield1v@ed.gov'),
(1069, 'Agna Daspar', 'adaspar1w@europa.eu'),
(1070, 'Berk Shyram', 'bshyram1x@ihg.com'),
(1071, 'Moira Goodyer', 'mgoodyer1y@reverbnation.com'),
(1072, 'Davie Williscroft', 'dwilliscroft1z@dyndns.org'),
(1073, 'Corly Colten', 'ccolten20@ucla.edu'),
(1074, 'Brita Bootell', 'bbootell21@biglobe.ne.jp'),
(1075, 'Persis Garrold', 'pgarrold22@wordpress.com'),
(1076, 'Brocky Freestone', 'bfreestone23@google.nl'),
(1077, 'Silvana MacGiolla Pheadair', 'smacgiolla24@is.gd'),
(1078, 'Alvan Heavyside', 'aheavyside25@lulu.com'),
(1079, 'Hewie Eckly', 'heckly26@hp.com'),
(1080, 'Aland McPhail', 'amcphail27@dyndns.org'),
(1081, 'Creight Hemphall', 'chemphall28@cam.ac.uk'),
(1082, 'Braden Gullen', 'bgullen29@samsung.com'),
(1083, 'Latisha Atcock', 'latcock2a@zimbio.com'),
(1084, 'Mab Skerratt', 'mskerratt2b@mac.com'),
(1085, 'Cchaddie Bareham', 'cbareham2c@sakura.ne.jp'),
(1086, 'Brandtr Koba', 'bkoba2d@slideshare.net'),
(1087, 'Maddy Rowbrey', 'mrowbrey2e@istockphoto.com'),
(1088, 'Clive Polley', 'cpolley2f@lycos.com'),
(1089, 'Tanny Phonix', 'tphonix2g@umn.edu'),
(1090, 'Raquela Scarratt', 'rscarratt2h@ucsd.edu'),
(1091, 'Kylila Roizin', 'kroizin2i@skyrock.com'),
(1092, 'Jareb Colaco', 'jcolaco2j@narod.ru'),
(1093, 'Josias Nigh', 'jnigh2k@vkontakte.ru'),
(1094, 'Trenna Ortet', 'tortet2l@reference.com'),
(1095, 'Lenard Grundwater', 'lgrundwater2m@foxnews.com'),
(1096, 'Sebastiano Lamberth', 'slamberth2n@foxnews.com'),
(1097, 'Salaidh Tommaseo', 'stommaseo2o@sogou.com'),
(1098, 'Timotheus Quilter', 'tquilter2p@eventbrite.com'),
(1099, 'Gavrielle Muller', 'gmuller2q@tinypic.com'),
(1100, 'Alfonso Holttom', 'aholttom2r@apple.com'),
(1101, 'Hastie McNabb', 'hmcnabb2s@who.int'),
(1102, 'Marilyn Ratchford', 'mratchford2t@usatoday.com'),
(1103, 'Calvin Paffot', 'cpaffot2u@ucsd.edu'),
(1104, 'Ellie Burrell', 'eburrell2v@oakley.com'),
(1105, 'Garvy Sawers', 'gsawers2w@blogger.com'),
(1106, 'Nahum Sausman', 'nsausman2x@uol.com.br'),
(1107, 'Berkley Plumtree', 'bplumtree2y@meetup.com'),
(1108, 'Fredrika Brazur', 'fbrazur2z@twitter.com'),
(1109, 'Demetri Waddington', 'dwaddington30@prlog.org'),
(1110, 'Alberik Baudain', 'abaudain31@fotki.com'),
(1111, 'Rozamond Plenty', 'rplenty32@github.com'),
(1112, 'Chance O\'Tuohy', 'cotuohy33@pcworld.com'),
(1113, 'Shadow Winterburn', 'swinterburn34@mayoclinic.com'),
(1114, 'Anstice O\'Hickee', 'aohickee35@over-blog.com'),
(1115, 'Ruth Lidgley', 'rlidgley36@columbia.edu'),
(1116, 'Cybil Goodfield', 'cgoodfield37@wikipedia.org'),
(1117, 'Berta McKomb', 'bmckomb38@ibm.com'),
(1118, 'Lacie Orrah', 'lorrah39@list-manage.com'),
(1119, 'Nona Setterthwait', 'nsetterthwait3a@china.com.cn'),
(1120, 'Osborne Browncey', 'obrowncey3b@symantec.com'),
(1121, 'Adora Starling', 'astarling3c@nationalgeographic.com'),
(1122, 'Vivie Robardley', 'vrobardley3d@webs.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `perguruan_tinggi`
--
ALTER TABLE `perguruan_tinggi`
  ADD PRIMARY KEY (`Id_perguruan_tinggi`),
  ADD KEY `perguruan_tinggi_rektor` (`Id_rektor`);

--
-- Indexes for table `rektor`
--
ALTER TABLE `rektor`
  ADD PRIMARY KEY (`Id_rektor`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `perguruan_tinggi`
--
ALTER TABLE `perguruan_tinggi`
  ADD CONSTRAINT `perguruan_tinggi_rektor` FOREIGN KEY (`Id_rektor`) REFERENCES `rektor` (`Id_rektor`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
