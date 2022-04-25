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
	
	<form action="liste_Manga_Affichage.php" method="get">
	
	
	<?php
		// Affichage de tous les animes dans la base de donnee
		include 'fonction_Connexion_Affichage.php'; //pour pouvoir utiliser les fonctions de fonction_Connexion_Affichage
		
		$manga = "select * from manga order by titre"; //requete SQL pour recuperer tous les animes dans la base de donnee
		$data = connexion_requete($manga); // Recuperation des informations dans la base de donnee
		

		while ($row = $data->fetch_assoc()){
			$num = $row["numManga"];
			$titre = $row["titre"];
			echo "<input type='submit' name=nomManga value='$titre' class='boutton'><br/>";
		}
		
	?>
	
	</form>
</body>
</html>