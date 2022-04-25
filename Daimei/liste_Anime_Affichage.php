<!DOCTYPE html>
<html lang="fr">
<head>
	<meta charset="utf-8">
	<title>題名</title>
	<link href="projet.css" rel="stylesheet" >
</head>
<body>

	<div class="logo">
		<a href="./Manga_Anime_0_1.html">
			題<br/>
			名
		</a>
	</div>
		
	<div class="nom_Site">
			<h1><a href="./Manga_Anime_0_1.html">(Daimei)</a></h1>
	</div>

	<div class="menu">

		<div class="navigation">	
			<nav>
				<ul id="menu_Deroulant">
					<li><a href="./compte.php">Compte</a></li>
					<li><a href="les_Listes.html">LES listes</a>
						<ul>
							<li><a href="./liste_Manga.php">Manga</a></li>
							<li><a href="./liste_Anime.php">Anime</a></li>
						</ul>
					</li>
					<li><a href="contact.html">Contact</a></li>
				</ul>
			</nav>
		</div>

	</div>

	
	<?php
		// Affichage de toutes les informations sur un anime
		session_start(); //permet d'avoir des variables utilisables sur differentes pages
		$nom = $_GET['nomAnime']; //recupere le nomManga sur la page liste_Manga.php
	
		echo '<div class="titre">'; //affiche le nom de l'anime
			echo "<h1>$nom</h1>";
		echo '</div>';
		
		// Requete SQL pour chaque informations
		$req_image = "select image from anime where '$nom' = nom";
		$req_synopsis = "select synopsis from anime where '$nom' = nom";
		$req_type = "select type from anime where '$nom' = nom";
		$req_genres = "select genres from anime where '$nom' = nom";
		$req_nbrEp = "select nbrEpisodes from anime where '$nom' = nom";
		$req_nbrArc = "select nbrArc_Saison from anime where '$nom' = nom";
		$req_dateSortie = "select dateDeSortie from anime where '$nom' = nom";
		
		include 'fonction_Connexion_Affichage.php'; //pour pouvoir utiliser les fonctions de fonction_Connexion_Affichage
		
		// Recuperation des informations dans la base de donnee
		$image = connexion_requete($req_image);
		$synopsis = connexion_requete($req_synopsis);
		$type = connexion_requete($req_type);
		$genres = connexion_requete($req_genres);
		$nbrEpisodes = connexion_requete($req_nbrEp);
		$nbrArc_Saison = connexion_requete($req_nbrArc);
		$dateDeSortie = connexion_requete($req_dateSortie);
		
		echo "<div class='informations'>";
			echo '<div class ="image">'; //affiche de l'image
				affichage($image);
			echo '</div>';
			
			echo '<div class ="synopsis">'; //affiche du synopsis
				affichage($synopsis);
			echo '</div>';
			
			echo "<div class='entete'> Type : ". '</div>'. '<div class ="type">'; //affiche du type
				affichage($type);
			echo '</div>';
			
			echo "<div class='entete'> Genres : ". '</div>'. '<div class ="genres">'; //affiche des genres
				affichage($genres);
			echo '</div>';
			
			echo "<div class='entete'>Nombres d'épisodes : ". '</div>'. '<div class ="nbrEpisodes">'; //affiche du nombre d'episode
				affichage($nbrEpisodes);
			echo '</div>';
			
			echo "<div class='entete'> Nombres d'arcs/saisons: ". '</div>'. '<div class ="nbrArc_Saison">'; //affiche du nombre de saisons/arcs
				affichage($nbrArc_Saison);
			echo '</div>';
			
			echo "<div class='entete'> Date de sortie : ". '</div>'. '<div class ="dateDeSortie">'; //affiche de la date de sortie
				affichage($dateDeSortie);
			echo '</div>';
			
			// Recuperation du numero de l'anime
			$req_num_anime = "select numAnime from anime where '$nom' = nom"; //requete sql pour numAnime
			$numAnime = connexion_requete($req_num_anime); //recuperation de numAnime
			$row_numAnime = mysqli_fetch_row($numAnime); //implementation dans un tableau
			$_SESSION['num_Anime'] = $row_numAnime[0]; //sauvegarde de numManga pour une reutilisation dans d'autres pages
				
			// Affichage prenom et nom de l'auteur du manga
			$req_auteur = "select nom, prenom from auteur where numAuteur = (select numAuteur from ecrit where numAnime = $row_numAnime[0])"; 
			$auteur = connexion_requete($req_auteur);
			$row_auteur = mysqli_fetch_row($auteur);
			echo "<div class='entete'>". "Auteur : ". "<br/> </div>"; 
			echo $row_auteur[1]. " ". $row_auteur[0]. "<br/>";
			
			// Affichage studio d'animation
			$req_animation = "select nom from studio_animation where numStudioAnimation = (select numStudioAnimation from fait_animation where numAnime = $row_numAnime[0])";
			$animation = connexion_requete($req_animation);
			$row_animation = mysqli_fetch_row($animation);
			echo "<div class='entete'>". "Studio d'animation : ". "<br/> </div>";
			echo $row_animation[0]. "<br/>";
			
			// Affichage plateforme de diffusion
			$req_plateforme = "select nom from plateforme_diffusion where numPlateforme = (select numPlateforme from diffuse where numAnime = $row_numAnime[0])";
			$plateforme = connexion_requete($req_plateforme);
			$row_plateforme = mysqli_fetch_row($plateforme);
			echo "<div class='entete'>". "Plateforme de diffusion : ". "<br/> </div>";
			echo $row_plateforme[0]. "<br/>";
		echo "</div>";	
		
		// Lien pour ajouter un anime à sa liste vu
		if ($_SESSION['connexion'] == 1) {
			echo "<div class='ajout_deconnexion'> <a href='./fonction_Ajout_Anime.php'>Ajouter à ma liste</a></div><br/>";
		}
		
	?>
	
</body>
</html>