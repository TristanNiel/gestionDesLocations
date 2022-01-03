-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 03, 2022 at 08:28 AM
-- Server version: 8.0.27-0ubuntu0.20.04.1
-- PHP Version: 8.0.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gestionDesLocations`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220103005326', '2022-01-03 01:53:39', 306);

-- --------------------------------------------------------

--
-- Table structure for table `rent`
--

CREATE TABLE `rent` (
  `id` int NOT NULL,
  `tenant_id_id` int DEFAULT NULL,
  `residence_id_id` int DEFAULT NULL,
  `inventory_file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `arrival_date` datetime NOT NULL,
  `departure_date` datetime NOT NULL,
  `tenant_comments` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `tenant_signature` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tenant_validated_at` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `representative_comments` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `representative_signature` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `representative_validated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rent`
--

INSERT INTO `rent` (`id`, `tenant_id_id`, `residence_id_id`, `inventory_file`, `arrival_date`, `departure_date`, `tenant_comments`, `tenant_signature`, `tenant_validated_at`, `representative_comments`, `representative_signature`, `representative_validated_at`) VALUES
(1, 8, 3, 'ryftvsinmklzjdoehwqapbxguc', '2021-03-22 00:24:22', '2021-03-22 00:24:22', 'dcilkpnvsmehxawqfrzgbyuotj', 'zdlnrmxupvbjsoqktwhefgcaiy', 'bvswlzgefmudxanpckhiyojrqt', 'boucvaxhzwtfyerikgqndlsjmp', 'tbwpihvqrzafcmdskgnjoxluey', '2021-03-22 00:24:22'),
(2, 7, 1, 'jgphndqcwsimtlrezvokubayfx', '1998-11-12 14:06:50', '1998-11-12 14:06:50', 'slvgorxyaeuipcjdqzbnfmwkht', 'zefuavlxpsqkmygtridcnhbojw', 'jzslfoehkxmvqctypnaiurgwdb', 'avilwhynxmqtfpegosjkcrbduz', 'jebthpdkziqryfmwcoanlsvgxu', '1998-11-12 14:06:50'),
(3, 5, 3, 'boxfdehyjrawmptnuvsilgqkzc', '2001-02-15 06:59:36', '2001-02-15 06:59:36', 'nictzfxyspvgklhajmrebuodwq', 'rnxvydifztpuewhmkoqlbgjcsa', 'xiasnfypjzwlketqcdogvrbmuh', 'clasxevidtbykzfqhnjrwogmup', 'mdzfnsxacwvgkrlojyqhibutpe', '2001-02-15 06:59:36'),
(4, 5, 1, 'sokewuqfniyatbpzmxrjlgvcdh', '1980-07-15 19:30:02', '1980-07-15 19:30:02', 'plrdhjtzseiqgawuvofxmckynb', 'sehfdpmicroybwvgqzkjatlnux', 'gcjturvowbadeihylpnkxzsfmq', 'vxinhkosuygfqdjpwltrezabmc', 'bhdswexzmgkarqjvolnpftuiyc', '1980-07-15 19:30:02'),
(5, 6, 2, 'yghskiuoaznmpeblvqjrwcxtdf', '2007-12-09 09:20:26', '2007-12-09 09:20:26', 'kslwfmyvjtnrbuqgpcoezaidxh', 'tgkymcqlsrdxbjhvzunaoefwip', 'tgvohbmicqluawfepzsnxdykjr', 'bfdnywxscrqeoghjizaulmkptv', 'lniwysvzjxqupcfahdembrgkto', '2007-12-09 09:20:26');

-- --------------------------------------------------------

--
-- Table structure for table `residence`
--

CREATE TABLE `residence` (
  `id` int NOT NULL,
  `owner_id_id` int DEFAULT NULL,
  `representative_id_id` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adress` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inventory_file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `residence`
--

INSERT INTO `residence` (`id`, `owner_id_id`, `representative_id_id`, `name`, `adress`, `city`, `zip_code`, `country`, `inventory_file`) VALUES
(1, 1, 2, 'Residence 1', 'fcwxniydurbtkvahpqmgzjleso', 'rltmjbxqvpgwunzychfoiksdea', '9604875312', 'France', 'vkbuycghnomrdwaelftpjziqxs'),
(2, 1, 3, 'Residence 2', 'xulodbrtpcsywieahnkjvqgmzf', 'cjoezrxlbdqgitskmunpvwfayh', '7603914825', 'France', 'cgqednlauhzopitwbsyfrvjxkm'),
(3, 1, 3, 'Residence 3', 'ymhwnqcszvgbjlpxktfdurioea', 'slqzfxdjoarbtgwvcikumynhep', '8970634125', 'France', 'ytauwnerczxjghsovqfbpkmdli');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_verified` smallint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `role`, `email`, `password`, `is_verified`) VALUES
(1, 'ROLE_OWNER', 'kjqisdobrucmexngyvhltzafpw', 'hjmtzxdobfswivrqyaclpgneuk', 1),
(2, 'ROLE_REPRESENTATIVE', 'rfqtyubwozndievjchsmxlakgp', 'rgjiqahdxyukbnlvwfmozpscte', 1),
(3, 'ROLE_REPRESENTATIVE', 'fjrupgvdaoezcnwqbtlhsmixyk', 'plifernzbsgmchtyxujowkvadq', 1),
(4, 'ROLE_TENANT', 'wbmeapflcjkgnvihotdrzyxsqu', 'dwyvigektnmupljrchfqbaosxz', 1),
(5, 'ROLE_TENANT', 'bhxcdiayjrqpzfvgkstuwomlne', 'dwihfjgyuteporlcsvqmanzxkb', 1),
(6, 'ROLE_TENANT', 'exwfsndqzughvykoilabmcpjtr', 'cdmlihpkurzjbyagwxetoqvnsf', 1),
(7, 'ROLE_TENANT', 'aydtjrbeoqpxfvulgsmhwizkcn', 'jlgqinzhmuakpxfdctyswebovr', 1),
(8, 'ROLE_TENANT', 'cbyftajqonmhwurzivxgpsdkle', 'qpezhlxvjbymkrsfudganwctio', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `rent`
--
ALTER TABLE `rent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_2784DCC60D47263` (`tenant_id_id`),
  ADD KEY `IDX_2784DCC4384A887` (`residence_id_id`);

--
-- Indexes for table `residence`
--
ALTER TABLE `residence`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_32758238FDDAB70` (`owner_id_id`),
  ADD KEY `IDX_3275823C01675FE` (`representative_id_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `rent`
--
ALTER TABLE `rent`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `residence`
--
ALTER TABLE `residence`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rent`
--
ALTER TABLE `rent`
  ADD CONSTRAINT `FK_2784DCC4384A887` FOREIGN KEY (`residence_id_id`) REFERENCES `residence` (`id`),
  ADD CONSTRAINT `FK_2784DCC60D47263` FOREIGN KEY (`tenant_id_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `residence`
--
ALTER TABLE `residence`
  ADD CONSTRAINT `FK_32758238FDDAB70` FOREIGN KEY (`owner_id_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_3275823C01675FE` FOREIGN KEY (`representative_id_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
