-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 08 oct. 2020 à 08:34
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `malayim`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `intitule` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `intitule`) VALUES
(1, 'Fosse'),
(2, 'Tribune A'),
(3, 'Tribune B'),
(4, 'Tribune C'),
(5, 'Place VIP');

-- --------------------------------------------------------

--
-- Structure de la table `concert`
--

DROP TABLE IF EXISTS `concert`;
CREATE TABLE IF NOT EXISTS `concert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `intitule` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `dateheure` datetime NOT NULL,
  `image` varchar(255) NOT NULL,
  `etat_id` int(11) NOT NULL,
  `salle_id` int(11) NOT NULL,
  `spotify` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `etat_id` (`etat_id`),
  KEY `salle_id` (`salle_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `concert`
--

INSERT INTO `concert` (`id`, `intitule`, `description`, `dateheure`, `image`, `etat_id`, `salle_id`, `spotify`) VALUES
(2, 'Le motif', 'Après avoir terminé son défi #unsonparjourdurantunmois, Le Motif nous livre son premier EP « Première Partie » ainsi qu’un court métrage retraçant l’ambiance de chaque musique qui le compose !', '2020-10-16 20:00:00', 'assets/img/motif.jpg\r\n', 1, 1, 'https://open.spotify.com/artist/0HdLXCWPtmK9wgd7CyNuj3'),
(3, 'Louane', 'En 2020, Louane revient avec son titre Donne-moi ton cœur, une chanson nostalgique et pleine de fierté selon l\'artiste. L\'instrumental est basé sur les sons des années 90, début des années 2000.', '2020-11-14 20:00:00', 'assets/img/louane.jpg', 1, 1, 'https://open.spotify.com/artist/7wjeXCtRND2ZdKfMJFu6JC'),
(4, 'Lala &ce', 'Ancienne Lyonnaise ayant déménagé à Londres, Lala &ce sortait début juin son premier véritable projet solo intitulé Le Son d’après. Une mixtape de 12 titres infusée de tempos empruntés aux scènes hip-hop américaine et africaine. À ce mélange déjà dense, Lala &ce ajoute les intentions primitives du rap français : se démarquer des autres projets rap et des préjugés qu’il renferme', '2020-11-28 18:00:00', 'assets/img/lala.jpg\r\n', 2, 1, 'https://open.spotify.com/artist/1AKP8Tnz8KfOdRM4mqvNtF'),
(5, 'Wejdene', 'Wejdene ouvre un compte Instagram au début de l\'année 2019. Elle y est repérée en novembre par son futur manager Feuneu, producteur pour le label Guette Music et originaire du même quartier. Il produit le mois suivant son premier single, J\'attends, suivi en février 2020 par J\'peux dead', '2020-11-07 21:30:00', 'assets/img/wejdene.jpg', 3, 1, 'https://open.spotify.com/artist/1SxuyHZnLUFyFHGzdGaxZk'),
(6, 'UZI', 'UZI a commencé à rapper en 2015, il a sorti son 1er clip intitulé « GUELAR » sur sa chaine officiel Youtube « UZI OFFICIEL », réalisé par « REDZONE » toujours sur sa page officiel. En fin 2016, il fait appel à Daymolition qui s’occupe de la réalisation de 4 de ses clips dont « AKRAPOVITCH » qui a bien tourné, ça a accumulé « 400 000 vues » suivi du « Freestyle Luxury57 », « HOMER » et « Le pouvoir des balles ».', '2020-12-05 20:00:00', 'assets/img/uzi.jpg\r\n', 4, 1, 'https://open.spotify.com/artist/5U05AU34EcZ8pfohg2dicI'),
(7, 'Vianney', 'À la suite du confinement lié à l\'épidémie de coronavirus lors du printemps 2020, il sort le nouveau titre N’attendons pas.\r\n\r\nLe 21 août, à minuit, Vianney dévoile son nouveau titre intitulé Beau-papa. Il dédie cette chanson à sa belle-fille. Le 29 septembre, à minuit, Vianney dévoile un nouveau titre \"Merci pour ça\" qu\'il dédie à un ami sdf Karim.\r\n\r\nSon troisième album sortira le 30 octobre 2020.', '2021-01-09 21:00:00', 'assets/img/vianney.jpg', 2, 1, 'https://open.spotify.com/artist/4Nrd0CtP8txoQhnnlRA6V6?'),
(8, 'Feder', 'En 2018, il compose le titre Rolling Stone pour Mylène Farmer, qui se classe n°1 des ventes en France, ainsi que 7 autres titres pour l\'album Désobéissance. En parallèle, il sort son titre Control en fin d\'année.', '2021-01-23 20:00:00', 'assets/img/feder.jpg\r\n', 1, 1, 'http://open.spotify.com/artist/5KnoVkIUGmK0PiDKMjz2LM?');

-- --------------------------------------------------------

--
-- Structure de la table `concert_categorie`
--

DROP TABLE IF EXISTS `concert_categorie`;
CREATE TABLE IF NOT EXISTS `concert_categorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prix` float NOT NULL,
  `restant` int(11) NOT NULL,
  `categorie_id` int(11) NOT NULL,
  `concert_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categorie_id` (`categorie_id`),
  KEY `concert_id` (`concert_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `concert_categorie`
--

INSERT INTO `concert_categorie` (`id`, `prix`, `restant`, `categorie_id`, `concert_id`) VALUES
(1, 24.99, 178, 1, 2),
(2, 29.99, 244, 2, 2),
(3, 27.99, 144, 3, 2),
(4, 27.99, 138, 4, 2),
(5, 34.99, 0, 5, 2),
(6, 24.99, 152, 1, 3),
(7, 32.99, 248, 2, 3),
(8, 28.99, 150, 3, 3),
(9, 28.99, 150, 4, 3),
(10, 35.99, 18, 5, 3),
(11, 24.99, 200, 1, 4),
(12, 32.99, 250, 2, 4),
(13, 28.99, 150, 3, 4),
(14, 28.99, 150, 4, 4),
(15, 35.99, 20, 5, 4),
(16, 29.99, 200, 1, 5),
(17, 42.99, 250, 2, 5),
(18, 38.99, 150, 3, 5),
(19, 38.99, 146, 4, 5),
(20, 45.99, 20, 5, 5),
(21, 19.99, 200, 1, 6),
(22, 32.99, 250, 2, 6),
(23, 28.99, 150, 3, 6),
(24, 28.99, 150, 4, 6),
(25, 35.99, 20, 5, 6),
(26, 29.99, 200, 1, 7),
(27, 42.99, 250, 2, 7),
(28, 38.99, 150, 3, 7),
(29, 38.99, 150, 4, 7),
(30, 45.99, 20, 5, 7),
(31, 19.99, 196, 1, 8),
(32, 29.99, 250, 2, 8),
(33, 24.99, 146, 3, 8),
(34, 24.99, 146, 4, 8),
(35, 35.99, 20, 5, 8);

-- --------------------------------------------------------

--
-- Structure de la table `etat`
--

DROP TABLE IF EXISTS `etat`;
CREATE TABLE IF NOT EXISTS `etat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `intitule` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `etat`
--

INSERT INTO `etat` (`id`, `intitule`) VALUES
(1, 'Disponible'),
(2, 'Complet'),
(3, 'Reporté'),
(4, 'Annulé');

-- --------------------------------------------------------

--
-- Structure de la table `place`
--

DROP TABLE IF EXISTS `place`;
CREATE TABLE IF NOT EXISTS `place` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `dateheure` datetime NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `categorie_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reservation_id` (`reservation_id`),
  KEY `categorie_id` (`categorie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `place`
--

INSERT INTO `place` (`id`, `numero`, `dateheure`, `reservation_id`, `categorie_id`) VALUES
(28, 1, '2020-10-07 11:25:11', 7, 2),
(29, 2, '2020-10-07 11:25:11', 7, 2),
(30, 1, '2020-10-07 11:25:11', 7, 4),
(31, 2, '2020-10-07 11:25:11', 7, 4),
(32, 3, '2020-10-07 11:25:11', 7, 4),
(33, 4, '2020-10-07 11:25:11', 7, 4),
(34, 5, '2020-10-07 11:25:11', 7, 4),
(35, 6, '2020-10-07 11:25:11', 7, 4),
(36, 7, '2020-10-07 11:25:11', 7, 4),
(37, 8, '2020-10-07 11:25:11', 7, 4),
(38, 9, '2020-10-07 11:25:11', 7, 4),
(39, 10, '2020-10-07 11:25:11', 7, 4),
(40, 1, '2020-10-07 11:25:11', 7, 5),
(41, 2, '2020-10-07 11:25:11', 7, 5),
(42, 3, '2020-10-07 11:25:11', 7, 5),
(43, 4, '2020-10-07 11:25:11', 7, 5),
(44, 5, '2020-10-07 11:25:12', 7, 5),
(45, 6, '2020-10-07 11:25:12', 7, 5),
(46, 7, '2020-10-07 11:26:13', 8, 5),
(47, 8, '2020-10-07 11:26:13', 8, 5),
(48, 9, '2020-10-07 11:26:13', 8, 5),
(49, 10, '2020-10-07 11:26:13', 8, 5),
(50, 11, '2020-10-07 11:26:13', 8, 5),
(51, 12, '2020-10-07 11:26:13', 8, 5),
(52, 13, '2020-10-07 11:26:13', 8, 5),
(53, 14, '2020-10-07 11:26:13', 8, 5),
(54, 15, '2020-10-07 11:26:13', 8, 5),
(55, 16, '2020-10-07 11:26:13', 8, 5),
(56, 17, '2020-10-07 11:26:59', 9, 5),
(57, 18, '2020-10-07 11:26:59', 9, 5),
(58, 19, '2020-10-07 11:26:59', 9, 5),
(59, 20, '2020-10-07 11:26:59', 9, 5),
(60, 11, '2020-10-07 12:03:22', 10, 4),
(61, 12, '2020-10-07 12:03:22', 10, 4),
(62, 1, '2020-10-07 12:05:02', 11, 1),
(63, 2, '2020-10-07 12:05:02', 11, 1),
(64, 3, '2020-10-07 12:06:19', 12, 2),
(65, 4, '2020-10-07 12:06:19', 12, 2),
(66, 1, '2020-10-07 12:07:26', 13, 4),
(67, 2, '2020-10-07 12:07:26', 13, 4),
(68, 3, '2020-10-07 12:07:26', 13, 4),
(69, 4, '2020-10-07 12:07:26', 13, 4),
(72, 1, '2020-10-07 12:10:00', 15, 3),
(73, 2, '2020-10-07 12:10:00', 15, 3),
(74, 3, '2020-10-07 12:10:00', 15, 3),
(75, 4, '2020-10-07 13:36:05', 16, 3),
(76, 5, '2020-10-07 13:36:05', 16, 3),
(77, 6, '2020-10-07 13:36:05', 16, 3),
(78, 1, '2020-10-07 13:36:42', 17, 1),
(79, 2, '2020-10-07 13:36:42', 17, 1),
(80, 3, '2020-10-07 13:36:42', 17, 1),
(81, 4, '2020-10-07 13:36:42', 17, 1),
(82, 1, '2020-10-07 13:36:42', 17, 3),
(83, 2, '2020-10-07 13:36:42', 17, 3),
(84, 3, '2020-10-07 13:36:42', 17, 3),
(85, 4, '2020-10-07 13:36:42', 17, 3),
(86, 1, '2020-10-07 13:36:42', 17, 4),
(87, 2, '2020-10-07 13:36:42', 17, 4),
(88, 3, '2020-10-07 13:36:42', 17, 4),
(89, 4, '2020-10-07 13:36:42', 17, 4),
(90, 3, '2020-10-07 14:13:59', 18, 1),
(91, 4, '2020-10-07 14:13:59', 18, 1),
(92, 5, '2020-10-07 14:13:59', 18, 1),
(93, 6, '2020-10-07 14:13:59', 18, 1),
(94, 7, '2020-10-07 14:13:59', 18, 1),
(95, 8, '2020-10-07 14:14:00', 18, 1),
(96, 9, '2020-10-07 14:14:00', 18, 1),
(97, 10, '2020-10-07 14:14:00', 18, 1),
(98, 11, '2020-10-07 14:14:00', 18, 1),
(99, 12, '2020-10-07 14:14:00', 18, 1),
(100, 13, '2020-10-07 14:15:19', 19, 1),
(101, 14, '2020-10-07 14:15:19', 19, 1),
(102, 15, '2020-10-07 14:15:19', 19, 1),
(103, 16, '2020-10-07 14:15:19', 19, 1),
(104, 17, '2020-10-07 14:15:19', 19, 1),
(105, 18, '2020-10-07 14:15:19', 19, 1),
(106, 19, '2020-10-07 14:15:19', 19, 1),
(107, 20, '2020-10-07 14:15:19', 19, 1),
(108, 21, '2020-10-07 14:15:19', 19, 1),
(109, 22, '2020-10-07 14:15:19', 19, 1),
(110, 1, '2020-10-07 15:02:26', 20, 1),
(111, 2, '2020-10-07 15:02:26', 20, 1),
(112, 3, '2020-10-07 15:02:26', 20, 1),
(113, 4, '2020-10-07 15:02:26', 20, 1),
(114, 5, '2020-10-07 15:03:11', 21, 1),
(115, 6, '2020-10-07 15:03:11', 21, 1),
(116, 7, '2020-10-07 15:03:11', 21, 1),
(117, 8, '2020-10-07 15:03:11', 21, 1),
(118, 9, '2020-10-07 15:03:17', 22, 1),
(119, 10, '2020-10-07 15:03:17', 22, 1),
(120, 11, '2020-10-07 15:03:17', 22, 1),
(121, 12, '2020-10-07 15:03:17', 22, 1),
(122, 13, '2020-10-07 15:03:26', 23, 1),
(123, 14, '2020-10-07 15:03:26', 23, 1),
(124, 15, '2020-10-07 15:03:26', 23, 1),
(125, 16, '2020-10-07 15:03:26', 23, 1),
(126, 17, '2020-10-07 15:03:42', 24, 1),
(127, 18, '2020-10-07 15:03:42', 24, 1),
(128, 19, '2020-10-07 15:03:42', 24, 1),
(129, 20, '2020-10-07 15:03:42', 24, 1),
(130, 21, '2020-10-07 15:03:44', 25, 1),
(131, 22, '2020-10-07 15:03:44', 25, 1),
(132, 23, '2020-10-07 15:03:44', 25, 1),
(133, 24, '2020-10-07 15:03:44', 25, 1),
(134, 25, '2020-10-07 15:03:48', 26, 1),
(135, 26, '2020-10-07 15:03:48', 26, 1),
(136, 27, '2020-10-07 15:03:48', 26, 1),
(137, 28, '2020-10-07 15:03:48', 26, 1),
(138, 29, '2020-10-07 15:03:53', 27, 1),
(139, 30, '2020-10-07 15:03:53', 27, 1),
(140, 31, '2020-10-07 15:03:53', 27, 1),
(141, 32, '2020-10-07 15:03:53', 27, 1),
(142, 33, '2020-10-07 15:03:54', 28, 1),
(143, 34, '2020-10-07 15:03:54', 28, 1),
(144, 35, '2020-10-07 15:03:54', 28, 1),
(145, 36, '2020-10-07 15:03:54', 28, 1),
(146, 37, '2020-10-07 15:03:56', 29, 1),
(147, 38, '2020-10-07 15:03:56', 29, 1),
(148, 39, '2020-10-07 15:03:56', 29, 1),
(149, 40, '2020-10-07 15:03:56', 29, 1),
(150, 41, '2020-10-07 15:04:02', 30, 1),
(151, 42, '2020-10-07 15:04:02', 30, 1),
(152, 43, '2020-10-07 15:04:02', 30, 1),
(153, 44, '2020-10-07 15:04:02', 30, 1),
(154, 45, '2020-10-07 15:09:08', 31, 1),
(155, 46, '2020-10-07 15:09:08', 31, 1),
(156, 47, '2020-10-07 15:09:08', 31, 1),
(157, 48, '2020-10-07 15:09:08', 31, 1),
(158, 1, '2020-10-07 15:27:20', 32, 2),
(159, 2, '2020-10-07 15:27:20', 32, 2),
(160, 1, '2020-10-07 15:27:20', 32, 5),
(161, 2, '2020-10-07 15:27:20', 32, 5);

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(100) NOT NULL,
  `dateheure` datetime NOT NULL,
  `concert_id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `mail` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `concert_id` (`concert_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`id`, `numero`, `dateheure`, `concert_id`, `nom`, `prenom`, `mail`) VALUES
(7, 'YIta1707', '2020-10-07 11:25:11', 2, 'tariK', 'YILDIZ', 'tarik_yildiz@hotmail.fr'),
(8, 'mbgu1089', '2020-10-07 11:26:13', 2, 'guillaume', 'mbali', 'guillaume.mbali@outlook.fr'),
(9, 'yita1738', '2020-10-07 11:26:59', 2, 'tarik', 'yildiz', 'tarik_yildiz@hotmail.fr'),
(10, 'eoue1269', '2020-10-07 12:03:21', 2, 'uehg', 'eogero', 'sfjizof@zedhez.ff'),
(11, 'bbaa1487', '2020-10-07 12:05:02', 2, 'aa', 'bb', 'aa@bb.fr'),
(12, 'zzaa2280', '2020-10-07 12:06:19', 2, 'aaaz', 'zzzee', 'aa.bb@gmail.com'),
(13, 'ioof1206', '2020-10-07 12:07:26', 5, 'ofhze', 'iofjeori', 'ee.ss@a.fr'),
(15, 'yita1631', '2020-10-07 12:10:00', 2, 'tarik', 'yildiz', 'tar.yil@ff.ff'),
(16, 'YITA1194', '2020-10-07 13:36:05', 2, 'TARIK', 'YILDIZ', 'tarik_yildiz@hotmail.fr'),
(17, 'YITA1872', '2020-10-07 13:36:42', 8, 'TARIK', 'YILDIZ', 'tarik_yildiz@hotmail.fr'),
(18, 'YITA1952', '2020-10-07 14:13:59', 2, 'TARIK', 'YILDIZ', 'tarik_yildiz@hotmail.fr'),
(19, 'YITA2335', '2020-10-07 14:15:19', 2, 'TARIK', 'YILDIZ', 'tarik_yildiz@hotmail.fr'),
(20, 'YITA1102', '2020-10-07 15:02:26', 3, 'TARIK', 'YILDIZ', 'tarik_yildiz@hotmail.fr'),
(21, 'YITA1418', '2020-10-07 15:03:11', 3, 'TARIK', 'YILDIZ', 'tarik_yildiz@hotmail.fr'),
(22, 'YITA1491', '2020-10-07 15:03:17', 3, 'TARIK', 'YILDIZ', 'tarik_yildiz@hotmail.fr'),
(23, 'YITA1529', '2020-10-07 15:03:26', 3, 'TARIK', 'YILDIZ', 'tarik_yildiz@hotmail.fr'),
(24, 'YITA1251', '2020-10-07 15:03:42', 3, 'TARIK', 'YILDIZ', 'tarik_yildiz@hotmail.fr'),
(25, 'YITA1200', '2020-10-07 15:03:44', 3, 'TARIK', 'YILDIZ', 'tarik_yildiz@hotmail.fr'),
(26, 'YITA1183', '2020-10-07 15:03:48', 3, 'TARIK', 'YILDIZ', 'tarik_yildiz@hotmail.fr'),
(27, 'YITA1803', '2020-10-07 15:03:53', 3, 'TARIK', 'YILDIZ', 'tarik_yildiz@hotmail.fr'),
(28, 'YITA1001', '2020-10-07 15:03:54', 3, 'TARIK', 'YILDIZ', 'tarik_yildiz@hotmail.fr'),
(29, 'YITA1461', '2020-10-07 15:03:56', 3, 'TARIK', 'YILDIZ', 'tarik_yildiz@hotmail.fr'),
(30, 'YITA1180', '2020-10-07 15:04:02', 3, 'TARIK', 'YILDIZ', 'tarik_yildiz@hotmail.fr'),
(31, 'YITA1442', '2020-10-07 15:09:08', 3, 'TARIK', 'YILDIZ', 'tarik_yildiz@hotmail.fr'),
(32, 'YITA1711', '2020-10-07 15:27:20', 3, 'TARIK', 'YILDIZ', 'tarik_yildiz@hotmail.fr');

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

DROP TABLE IF EXISTS `salle`;
CREATE TABLE IF NOT EXISTS `salle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `intitule` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `adresse` varchar(200) NOT NULL,
  `ville` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `salle`
--

INSERT INTO `salle` (`id`, `intitule`, `description`, `adresse`, `ville`) VALUES
(1, 'MALAYIM\'', 'Le MALAYIM\' est une salle polyvalent situé dans le 15e arrondissement de Paris, la salle fut inaugurée en 2005.', '58 Boulevard Garibaldi', 'Paris');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `concert`
--
ALTER TABLE `concert`
  ADD CONSTRAINT `concert_ibfk_1` FOREIGN KEY (`salle_id`) REFERENCES `salle` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `concert_ibfk_2` FOREIGN KEY (`etat_id`) REFERENCES `etat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `concert_categorie`
--
ALTER TABLE `concert_categorie`
  ADD CONSTRAINT `concert_categorie_ibfk_1` FOREIGN KEY (`concert_id`) REFERENCES `concert` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `concert_categorie_ibfk_2` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `place`
--
ALTER TABLE `place`
  ADD CONSTRAINT `place_ibfk_1` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `place_ibfk_2` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`concert_id`) REFERENCES `concert` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
