-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Dim 16 Mai 2021 à 11:50
-- Version du serveur :  5.7.11
-- Version de PHP :  5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `daimei`
--

-- --------------------------------------------------------

--
-- Structure de la table `anime`
--

CREATE TABLE `anime` (
  `numAnime` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(5000) COLLATE utf8_unicode_ci NOT NULL,
  `synopsis` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `genres` varchar(5000) COLLATE utf8_unicode_ci NOT NULL,
  `nbrEpisodes` int(11) DEFAULT NULL,
  `nbrArc_Saison` int(11) NOT NULL,
  `dateDeSortie` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `anime`
--

INSERT INTO `anime` (`numAnime`, `nom`, `image`, `synopsis`, `type`, `genres`, `nbrEpisodes`, `nbrArc_Saison`, `dateDeSortie`) VALUES
(1, 'Naruto', 'Naruto_Anime', 'Dans le village de Konoha vit Naruto, un jeune garçon détesté et craint des villageois. Il est craint du fait qu\'il détient en lui Kyuubi (démon renard à neuf queues) d\'une incroyable force, qui a tué un grand nombre de personnes. Le ninja le plus puissant de Konoha à l\'époque, le quatrième Hokage, Minato Namikaze, réussit à sceller ce démon dans le corps de Naruto.\r\nMalheureusement il y laissa la vie.\r\n\r\nC\'est ainsi que douze ans plus tard, Naruto rêve de devenir le plus grand Hokage de Konoha afin que tous le reconnaissent à sa juste valeur. Mais la route pour devenir Hokage est très longue et Naruto sera confronté à un bon nombre d\'épreuves et devra affronter de nombreux ennemis pour atteindre son but !', 'Shonen', 'Action - Aventure - Comédie - Drame - Fantasy - Surnaturel - Tournois', 220, 20, '2002-10-03'),
(2, 'Dragon Ball', 'Dragon_Ball_Anime', 'Dragon Ball raconte les aventures de Goku, un jeune garçon doté d\'une queue de singe.\r\n\r\nL\'histoire commence lorsque Goku rencontre Bulma, qui est à la recherche des sept boules de cristal. Ces boules de cristal ont un pouvoir qui exaucerait n\'importe quel souhait une fois les 7 d\'entre elles réunies.\r\n\r\nAu cours de ses aventures, Goku rencontrera beaucoup d\'amis comme Krillin, Yamsha, Kame, mais aussi beaucoup d\'ennemis comme le Red Ribon et Piccolo...', 'Shonen', 'Aventure - Comédie - Fantasy - Surnaturel - Tournois', 153, 9, '1986-02-26'),
(3, 'One Piece', 'One_Piece_Anime', 'Il fut un temps où Gold Roger était le plus grand de tous les pirates, le "Roi des Pirates" était son surnom. A sa mort, son trésor d\'une valeur inestimable connu sous le nom de "One Piece" fut caché quelque part sur "Grand Line". De nombreux pirates sont partis à la recherche de ce trésor mais tous sont morts avant même de l\'atteindre. Monkey D. Luffy rêve de retrouver ce trésor légendaire et de devenir le nouveau "Roi des Pirates". Après avoir mangé un fruit du démon, il possède un pouvoir lui permettant de réaliser son rêve. Il lui faut maintenant trouver un équipage pour partir à l\'aventure !', 'Shonen', 'Action - Aventure - Comédie - Drame - Fantastique - Fantasy - Tournois', 973, 46, '1999-10-20'),
(4, 'Nanatsu no Taizai', 'Nanatsu_No_Taizai_Anime', 'Basé sur le manga Nanatsu no Taizai de Suzuki Nakaba.\r\n\r\nLes "Seven Deadly Sins" sont un groupe de chevaliers qui ont conspiré pour renverser le royaume de Britannia. Ils ont été éradiqués par les Chevaliers Sacrés, cependant certaines rumeurs laissent prétendre qu\'ils sont toujours en vie.\r\n\r\nDix ans plus tard, les Chevaliers Sacrés ont fait un coup d\'état, emprisonnant le Roi pour devenir les nouveaux dirigeants tyranniques du Royaume.\r\n\r\nElizabeth, la troisième fille du Roi, passe ses journées à la recherche des "Seven Deadly Sins", les seules personnes capables de récupérer le Royaume des mains de ces tyrans. Durant ses recherches, elle perd conscience dans la taverne de Meliodas, un jeune garçon parcourant le monde en compagnie de son cochon.\r\n\r\nRapidement, Elizabeth va se rendre compte que Meliodas n\'est pas qu\'un simple propriétaire de taverne, mais une personne à la puissance démesurée.', 'Shonen', 'Action - Aventure - Comédie - Fantasy - Romance - Surnaturel', 98, 4, '2014-10-05');

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

CREATE TABLE `auteur` (
  `numAuteur` int(11) NOT NULL,
  `nom` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `auteur`
--

INSERT INTO `auteur` (`numAuteur`, `nom`, `prenom`) VALUES
(1, 'Toriyama', 'Akira'),
(2, 'Kishimoto', 'Masashi'),
(3, 'Eiichirō', 'Oda'),
(4, 'Suzuki', 'Nakaba');

-- --------------------------------------------------------

--
-- Structure de la table `diffuse`
--

CREATE TABLE `diffuse` (
  `numPlateforme` int(11) NOT NULL,
  `numAnime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `diffuse`
--

INSERT INTO `diffuse` (`numPlateforme`, `numAnime`) VALUES
(1, 1),
(5, 3),
(5, 4);

-- --------------------------------------------------------

--
-- Structure de la table `ecrit`
--

CREATE TABLE `ecrit` (
  `numManga` int(11) NOT NULL,
  `numAuteur` int(11) NOT NULL,
  `numAnime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `ecrit`
--

INSERT INTO `ecrit` (`numManga`, `numAuteur`, `numAnime`) VALUES
(2, 1, 2),
(1, 2, 1),
(3, 3, 3),
(4, 4, 4);

-- --------------------------------------------------------

--
-- Structure de la table `edite`
--

CREATE TABLE `edite` (
  `numManga` int(11) NOT NULL,
  `numMaisonEdition` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `edite`
--

INSERT INTO `edite` (`numManga`, `numMaisonEdition`) VALUES
(2, 8),
(3, 8),
(1, 12),
(4, 20);

-- --------------------------------------------------------

--
-- Structure de la table `fait_animation`
--

CREATE TABLE `fait_animation` (
  `numStudioAnimation` int(11) NOT NULL,
  `numAnime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `fait_animation`
--

INSERT INTO `fait_animation` (`numStudioAnimation`, `numAnime`) VALUES
(9, 1),
(5, 2),
(5, 3),
(11, 4);

-- --------------------------------------------------------

--
-- Structure de la table `maison_edition`
--

CREATE TABLE `maison_edition` (
  `numMaisonEdition` int(11) NOT NULL,
  `nom` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `VO_VF` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `maison_edition`
--

INSERT INTO `maison_edition` (`numMaisonEdition`, `nom`, `VO_VF`) VALUES
(1, 'Akata', 1),
(2, 'Black Box', 1),
(3, 'Booken Manga', 1),
(4, 'Sakka', 1),
(5, 'Clair de Lune', 1),
(6, 'Delcourt', 1),
(7, 'Doki-Doki', 1),
(8, 'Glénat', 1),
(9, 'IDP', 1),
(10, 'Imho', 1),
(11, 'San Manga', 1),
(12, 'Kana', 1),
(13, 'Kazé Manga / Asuka', 1),
(14, 'Ki-oon', 1),
(15, 'Komikku', 1),
(16, 'Kurokawa', 1),
(17, 'Le Lézard Noir', 1),
(18, 'Nobi Nobi!', 1),
(19, 'Panini Manga', 1),
(20, 'Pika', 1),
(21, 'Sarbacane', 1),
(22, 'Soleil Manga', 1),
(23, 'Taïfu Comics / Ototo', 1),
(24, 'Tonkam', 1),
(25, 'Ankama', 1),
(26, 'Média-Participations', 1);

-- --------------------------------------------------------

--
-- Structure de la table `manga`
--

CREATE TABLE `manga` (
  `numManga` int(11) NOT NULL,
  `titre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(5000) COLLATE utf8_unicode_ci NOT NULL,
  `synopsis` varchar(10000) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `genres` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `nbrTomes` int(11) NOT NULL,
  `dateDeSortie` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `manga`
--

INSERT INTO `manga` (`numManga`, `titre`, `image`, `synopsis`, `type`, `genres`, `nbrTomes`, `dateDeSortie`) VALUES
(1, 'Naruto', 'Naruto_Manga', 'Il y a de cela douze ans, Kyūbi, un démon ayant la forme d\'un renard à neuf queues, entreprit la destruction du village de Konoha, mais le quatrième Hokage neutralisa ce démon en le scellant dans le corps d\'un nouveau-né : Naruto Uzumaki. Le quatrième Hokage se sacrifia ainsi pour sauver le village de Konoha.\r\n\r\nL\'histoire commence pendant l\'adolescence de Naruto, vers ses douze ans. Orphelin, éternel cancre et grand farceur, il fait toutes les bêtises possibles pour se faire remarquer. Son rêve : devenir Hokage afin d\'être reconnu par les habitants de son village. En effet, le démon scellé en lui a attisé la crainte et le mépris des autres villageois, qui, avec le temps, ne font plus de différence entre le Kyūbi et Naruto. Malgré cela, Naruto s\'entraîne dur afin de devenir genin, le premier niveau chez les ninjas.', 'Shonen', 'Action - Aventure - Comédie', 72, '1999-01-01'),
(2, 'Dragon Ball', 'Dragon_Ball_Manga', 'Alors qu\'elle parcourt les routes de montagnes à moto, Bulma fait une bien étrange rencontre en la personne de Sangoku, un petit garçon étonnamment fort, résistant et possédant une queue, comme les singes. Il possède un trésor qu\'elle recherche, une boule de cristal, mais ne veut pas la lui céder, c\'est un cadeaux que lui a laissé son grand-père Sangohan. Ils trouvent finalement un compromis, et Sangoku part avec elle à la recherche des 7 boules de cristal dont on dit qu\'elles exaucent n\'importe quel souhait une fois réunis.', 'Shonen', 'Action - Aventure - Comédie - Tournois', 42, '1993-01-01'),
(3, 'One Piece', 'One_Piece_Manga', 'Gloire, fortune et puissance, c\'est ce que possédait Gold Roger, le tout puissant roi des pirates, avant de mourir sur l\'échafaud. Mais ses dernières paroles ont éveillées bien des convoitises, et lança la fabuleuse "ère de la piraterie", chacun voulant trouver le fabuleux trésor qu\'il disait avoir laissé.\r\n\r\nBien des années plus tard, Shanks, un redoutable pirate aux cheveux rouges, rencontre Luffy, un jeune garçon d\'une dizaine d\'années dans un petit port de pêche. Il veut devenir pirate et le rejoindre, mais Shanks lui répond qu\'il est trop jeune. Plus tard, Luffy avalera accidentellement le fruit Gomu Gomu qui rendra son corps élastique, mais aussi maudit par les eaux. Incapable de nager, Luffy ne veut pourtant pas renoncer à son rêve. Pour le consoler lorsqu\'il part, Shanks lui offre son chapeau. Luffy jure alors de le rejoindre un jour avec son propre équipage.\r\n\r\nA 17 ans, Luffy prend la mer dans une petite barque avec pour but de réunir un équipage de pirates, mais de pirates pas comme les autres, qui devront partager sa conception un peu étrange de la piraterie. L\'aventure est lancée.', 'Shonen', 'Action - Aventure - Comédie - Drame - Fantastique', 98, '1997-01-01'),
(4, 'Nanatsu no Taizai', 'Nanatsu_No_Taizai_Manga', 'Les "Seven Deadly Sins" sont un groupe de chevaliers qui ont conspiré pour renverser le royaume de Britannia. Ils ont été éradiqués par les Chevaliers Sacrés, cependant certaines rumeurs laissent prétendre qu\'ils sont toujours en vie.\r\n\r\nDix ans plus tard, les Chevaliers Sacrés ont fait un coup d\'état, emprisonnant le Roi pour devenir les nouveaux dirigeants tyranniques du Royaume.\r\n\r\nElizabeth, la troisième fille du Roi, passe ses journées à la recherche des "Seven Deadly Sins", les seules personnes capables de récupérer le Royaume des mains de ces tyrans. Durant ses recherches, elle perd conscience dans la taverne de Meliodas, un jeune garçon parcourant le monde en compagnie de son cochon.\r\n\r\nRapidement, Elizabeth va se rendre compte que Meliodas n\'est pas qu\'un simple propriétaire de taverne, mais une personne à la puissance démesurée.', 'Shonen', 'Action - Aventure - Comédie - Fantastique - Romance', 41, '2012-01-01');

-- --------------------------------------------------------

--
-- Structure de la table `plateforme_diffusion`
--

CREATE TABLE `plateforme_diffusion` (
  `numPlateforme` int(11) NOT NULL,
  `nom` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `plateforme_diffusion`
--

INSERT INTO `plateforme_diffusion` (`numPlateforme`, `nom`) VALUES
(1, 'Netflix'),
(2, 'Amazon Prime Video'),
(3, 'Wakanim'),
(4, 'Crunchyroll'),
(5, 'Anime Digital Network');

-- --------------------------------------------------------

--
-- Structure de la table `regarde_anime`
--

CREATE TABLE `regarde_anime` (
  `numUtilisateur_regarde` int(11) NOT NULL,
  `numAnime_regarde` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `regarde_anime`
--

INSERT INTO `regarde_anime` (`numUtilisateur_regarde`, `numAnime_regarde`) VALUES
(2, 1),
(7, 1),
(1, 2),
(3, 2),
(2, 3),
(7, 3);

-- --------------------------------------------------------

--
-- Structure de la table `regarde_manga`
--

CREATE TABLE `regarde_manga` (
  `numUtilisateur_regarde` int(11) NOT NULL,
  `numManga_regarde` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `regarde_manga`
--

INSERT INTO `regarde_manga` (`numUtilisateur_regarde`, `numManga_regarde`) VALUES
(1, 1),
(2, 1),
(7, 1),
(1, 2),
(2, 2),
(7, 2),
(1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `studio_animation`
--

CREATE TABLE `studio_animation` (
  `numStudioAnimation` int(11) NOT NULL,
  `nom` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `studio_animation`
--

INSERT INTO `studio_animation` (`numStudioAnimation`, `nom`) VALUES
(1, 'Madhouse'),
(2, 'Studio Ghibli'),
(3, 'Bones'),
(4, 'Science SARU'),
(5, 'Toei Animation Company'),
(6, 'Mappa'),
(7, 'Wit Studio'),
(8, 'Studio 4°C'),
(9, 'Studio Pierrot'),
(10, 'Manglobe'),
(11, 'A-1 Pictures'),
(12, 'Artland'),
(13, 'Sunrise'),
(14, 'Production I.G'),
(15, 'David Production'),
(16, 'J.C.Staff'),
(17, 'Telecom Animation Film'),
(18, 'TMS Entertainment'),
(19, 'Polygon Pictures'),
(20, 'Gainax'),
(21, 'Studio VOLN'),
(22, 'Shaft'),
(23, 'Kinema Citrus'),
(24, 'Ufotable'),
(25, 'Orange'),
(26, 'Gonzo'),
(27, 'Geno Studio'),
(28, 'Liden Films'),
(29, 'Trigger'),
(30, 'White Fox');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `numUtilisateur` int(11) NOT NULL,
  `pseudo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `motDePasse` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`numUtilisateur`, `pseudo`, `motDePasse`) VALUES
(1, 'test00', 'test00'),
(2, 'test01', 'test01'),
(3, 'test11', 'test11'),
(11, '', '');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `anime`
--
ALTER TABLE `anime`
  ADD PRIMARY KEY (`numAnime`);

--
-- Index pour la table `auteur`
--
ALTER TABLE `auteur`
  ADD PRIMARY KEY (`numAuteur`);

--
-- Index pour la table `diffuse`
--
ALTER TABLE `diffuse`
  ADD PRIMARY KEY (`numPlateforme`,`numAnime`),
  ADD KEY `diffuse_anime0_FK` (`numAnime`);

--
-- Index pour la table `ecrit`
--
ALTER TABLE `ecrit`
  ADD PRIMARY KEY (`numManga`,`numAuteur`,`numAnime`),
  ADD KEY `ecrit_auteur0_FK` (`numAuteur`),
  ADD KEY `ecrit_anime1_FK` (`numAnime`);

--
-- Index pour la table `edite`
--
ALTER TABLE `edite`
  ADD PRIMARY KEY (`numManga`,`numMaisonEdition`),
  ADD KEY `edite_masion_Edition0_FK` (`numMaisonEdition`);

--
-- Index pour la table `fait_animation`
--
ALTER TABLE `fait_animation`
  ADD PRIMARY KEY (`numStudioAnimation`,`numAnime`),
  ADD KEY `fait_Animation_anime0_FK` (`numAnime`);

--
-- Index pour la table `maison_edition`
--
ALTER TABLE `maison_edition`
  ADD PRIMARY KEY (`numMaisonEdition`);

--
-- Index pour la table `manga`
--
ALTER TABLE `manga`
  ADD PRIMARY KEY (`numManga`);

--
-- Index pour la table `plateforme_diffusion`
--
ALTER TABLE `plateforme_diffusion`
  ADD PRIMARY KEY (`numPlateforme`);

--
-- Index pour la table `regarde_anime`
--
ALTER TABLE `regarde_anime`
  ADD PRIMARY KEY (`numUtilisateur_regarde`,`numAnime_regarde`),
  ADD KEY `regarde_anime1_FK` (`numAnime_regarde`);

--
-- Index pour la table `regarde_manga`
--
ALTER TABLE `regarde_manga`
  ADD PRIMARY KEY (`numUtilisateur_regarde`,`numManga_regarde`),
  ADD KEY `regarde_manga0_FK` (`numManga_regarde`);

--
-- Index pour la table `studio_animation`
--
ALTER TABLE `studio_animation`
  ADD PRIMARY KEY (`numStudioAnimation`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`numUtilisateur`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `anime`
--
ALTER TABLE `anime`
  MODIFY `numAnime` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `auteur`
--
ALTER TABLE `auteur`
  MODIFY `numAuteur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `maison_edition`
--
ALTER TABLE `maison_edition`
  MODIFY `numMaisonEdition` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT pour la table `manga`
--
ALTER TABLE `manga`
  MODIFY `numManga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `plateforme_diffusion`
--
ALTER TABLE `plateforme_diffusion`
  MODIFY `numPlateforme` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `studio_animation`
--
ALTER TABLE `studio_animation`
  MODIFY `numStudioAnimation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `numUtilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `diffuse`
--
ALTER TABLE `diffuse`
  ADD CONSTRAINT `diffuse_anime0_FK` FOREIGN KEY (`numAnime`) REFERENCES `anime` (`numAnime`),
  ADD CONSTRAINT `diffuse_plateforme_Diffusion_FK` FOREIGN KEY (`numPlateforme`) REFERENCES `plateforme_diffusion` (`numPlateforme`);

--
-- Contraintes pour la table `ecrit`
--
ALTER TABLE `ecrit`
  ADD CONSTRAINT `ecrit_anime1_FK` FOREIGN KEY (`numAnime`) REFERENCES `anime` (`numAnime`),
  ADD CONSTRAINT `ecrit_auteur0_FK` FOREIGN KEY (`numAuteur`) REFERENCES `auteur` (`numAuteur`),
  ADD CONSTRAINT `ecrit_manga_FK` FOREIGN KEY (`numManga`) REFERENCES `manga` (`numManga`);

--
-- Contraintes pour la table `edite`
--
ALTER TABLE `edite`
  ADD CONSTRAINT `edite_manga_FK` FOREIGN KEY (`numManga`) REFERENCES `manga` (`numManga`),
  ADD CONSTRAINT `edite_masion_Edition0_FK` FOREIGN KEY (`numMaisonEdition`) REFERENCES `maison_edition` (`numMaisonEdition`);

--
-- Contraintes pour la table `fait_animation`
--
ALTER TABLE `fait_animation`
  ADD CONSTRAINT `fait_Animation_anime0_FK` FOREIGN KEY (`numAnime`) REFERENCES `anime` (`numAnime`),
  ADD CONSTRAINT `fait_Animation_studio_Animation_FK` FOREIGN KEY (`numStudioAnimation`) REFERENCES `studio_animation` (`numStudioAnimation`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
