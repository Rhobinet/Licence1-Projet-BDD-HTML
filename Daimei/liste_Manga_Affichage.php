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
		// Affichage de toutes les informations sur un manga
		session_start(); //permet d'avoir des variables utilisables sur differentes pages
		$nom = $_GET['nomManga']; //recupere le nomManga sur la page liste_Manga.php
		
		echo '<div class ="titre">'; //affiche le nom du manga
			echo "<h1>$nom</h1>";
		echo '</div>';
		
		// Requete SQL pour chaque informations
		$req_image = "select image from manga where '$nom' = titre";
		$req_synopsis = "select synopsis from manga where '$nom' = titre";
		$req_type = "select type from manga where '$nom' = titre";
		$req_genres = "select genres from manga where '$nom' = titre";
		$req_nbrTomes = "select nbrTomes from manga where '$nom' = titre";
		$req_dateSortie = "select dateDeSortie from manga where '$nom' = titre";
		
		include 'fonction_Connexion_Affichage.php'; //pour pouvoir utiliser les fonctions de fonction_Connexion_Affichage
		
		// Recuperation des informations dans la base de donnee
		$image = connexion_requete($req_image);
		$synopsis = connexion_requete($req_synopsis);
		$type = connexion_requete($req_type);
		$genres = connexion_requete($req_genres);
		$nbrTomes = connexion_requete($req_nbrTomes);
		$dateDeSortie = connexion_requete($req_dateSortie);
		
		echo '<div class ="image">'; //affiche de l'image
			affichage($image);
		echo '</div>';
		
		echo "<div class='informations'>";	
		
			echo '<div class ="synopsis">'; //affiche du synopsis 
				affichage($synopsis);
			echo '</div>';
			
			echo "<div class='entete'> Type : ". '</div>'. '<div class ="type">'; //affiche du type 
				affichage($type);
			echo '</div>';
			
				echo "<div class='entete'> Genres : ". '</div>'. '<div class ="genres">'; //affiche des genres
				affichage($genres);
			echo '</div>';
			
			echo "<div class='entete'> Nombres de tome : ". '</div>'. '<div class ="nbrTomes">'; //affiche du nombre de tomes
				affichage($nbrTomes);
			echo '</div>';
			
			echo "<div class='entete'> Date de sortie : ". '</div>'. '<div class ="dateDeSortie">'; //affiche de la date de sortie
				affichage($dateDeSortie);
			echo '</div>';
				
			// Recuperation du numero du manga
			$req_num_manga = "select numManga from manga where '$nom' = titre"; //requete sql pour numManga
			$numManga = connexion_requete($req_num_manga); //recuperation de numManga
			$row_numManga = mysqli_fetch_row($numManga); //implementation dans un tableau
			$_SESSION['num_Manga'] = $row_numManga[0]; //sauvegarde de numManga pour une reutilisation dans d'autres pages

			// Affichage prenom et nom de l'auteur du manga
			$req_auteur = "select nom, prenom from auteur where numAuteur = (select numAuteur from ecrit where numManga = $row_numManga[0])"; 
			$auteur = connexion_requete($req_auteur);
			$row_auteur = mysqli_fetch_row($auteur);
			echo  "<div class='entete'>". "Auteur : ". "<br/> </div>";
			echo $row_auteur[1]. " ". $row_auteur[0]. "<br/>";
			
			// Affichage maison d'edition du manga
			$req_maisonEdition = "select nom from maison_edition where numMaisonEdition = (select numMaisonEdition from edite where numManga = $row_numManga[0])";
			$maisonEdition = connexion_requete($req_maisonEdition);
			$row_maisonEdition = mysqli_fetch_row($maisonEdition);
			echo "<div class='entete'>". "Maison d'édition : ". "<br/> </div>";
			echo $row_maisonEdition[0]. "<br/>";
		echo "</div>";
		
		// Lien pour ajouter un manga à sa liste lu
		if ($_SESSION['connexion'] == 1) {
			echo "<div class='ajout_deconnexion'> <a href='./fonction_Ajout_Manga.php'>Ajouter à ma liste</a> </div><br/>";
		}
		
	?>



</body>
</html>