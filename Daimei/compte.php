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
	// page de connexion, avec inscription et connexion
		session_start(); //permet d'avoir des variables utilisables sur differentes pages
		
		if ($_SESSION['connexion'] == 0){ //verifie si l'utilisateur est connecte
			echo "<div class='inscription'>
			
				<h2>INSCRIPTION</h2>
				
				<form action='inscription.php' method='get'>
				
					<label for='pseudo'>Pseudo :</label>
					<input name='pseudo' id='pseudo' type='text' pattern='[A-Za-z0-9 ]{3,50}' required><br/><br/>
					<label for='password'>Mot de passe :</label>
					<input name='password' id='password' type='password' pattern='[A-Za-z0-9 ]{6,50}' autocomplete='new-password' required><br/><br/>
					<input type='submit' name='inscription' value='Inscription'>
				
				</form>
				
			</div>
			
			<div class='connexion'>
			
				<h2>CONNEXION</h2>
				
				<form action='connexion.php' method='get'>
				
					<label for='pseudo'>Pseudo :</label>
					<input name='pseudo' id='pseudo' type='text' pattern='[A-Za-z0-9 ]{3,50}' required><br/><br/>
					<label for='password'>Mot de passe :</label>
					<input name='password' id='password' type='password' pattern='[A-Za-z0-9 ]{6,50}' autocomplete='current-password' required><br/><br/>
					<input type='submit' name='connexion' value='Se connecter'>
				
				</form>
			</div>";
		}
		
		//lorsque l'utilisateur est connecte
		else{
			echo "Bonjour "; echo $_SESSION['pseudo']; echo ",<br/> <br/>";
			
			$db = new mysqli("localhost", "user", "user", "daimei"); //Ouvre la connexion avec la base de donnee
			mysqli_set_charset($db, "utf8"); //Les accents
			
			if($db->connect_errno) { //s'il n'arrive pas à se connecter
				die("erreur $db->connect_error");
			}
			
			$numUser = $_SESSION['numUtilisateur']; //recuperation du num de l'utilisateur
			
			// Affichage des mangas que l'utilisateur a marque comme lu
			echo "<div class='titre'> MANGA </div><br/><br/>";
			
			$req_manga_vu = "select numManga_regarde"; //requete pour avoir les num des mangas lu
			$req_manga_vu .= " from regarde_manga";
			$req_manga_vu .= " where $numUser = numUtilisateur_regarde";
			$data = mysqli_query($db, $req_manga_vu); //envoie de la requete à la base de donnee
				
			while ($row = $data->fetch_assoc()){
				$req_nom_manga = "select titre"; //requete pour afficher le titre d'un manga
				$req_nom_manga .= " from manga";
				$req_nom_manga .= " where numManga = '$row[numManga_regarde]'";
				$data2 = mysqli_query($db, $req_nom_manga); //envoie de la requete à la base de donnee
				$row2 = mysqli_fetch_row($data2); //recuperation dans un tableau
				echo "<form action='liste_Manga_Affichage.php' method='get'>"; //permet d'afficher les infos sur le manga une fois le bouton submit
					echo "<input type='submit' name=nomManga value='$row2[0]' class='boutton'><br/><br/>"; //affiche le titre du manga dans un bouton
				echo "</form>";
			}		
			
			// Affichage des animes que l'utilisateur a marque comme vu
			echo "<div class='titre'> ANIME </div><br/><br/>";
		
			$req_anime_vu = "select numAnime_regarde"; //requete pour avoir les num des animes vu
			$req_anime_vu .= " from regarde_anime";
			$req_anime_vu .= " where $numUser = numUtilisateur_regarde";
			$data = mysqli_query($db, $req_anime_vu); //envoie de la requete à la base de donnee
			
			$nbrMinutes = 0; //pour calculer le temps à regarder des animes
			
			while ($row = $data->fetch_assoc()){
				$req_nom_anime = "select nom"; //requete pour afficher le nom d'un anime
				$req_nom_anime .= " from anime";
				$req_nom_anime .= " where numAnime = '$row[numAnime_regarde]'";
				$data2 = mysqli_query($db, $req_nom_anime); //envoie de la requete à la base de donnee
				$row2 = mysqli_fetch_row($data2); //recuperation dans un tableau
				echo "<form action='liste_Anime_Affichage.php' method='get'>"; //permet d'afficher les infos sur l'anime une fois le bouton submit
					echo "<input type='submit' name=nomAnime value='$row2[0]' class='boutton'><br/><br/>"; //affiche le nom de l'anime dans un bouton
				echo "</form>";
				
				$req_nbrEp = "select nbrEpisodes from anime where numAnime = '$row[numAnime_regarde]'"; //prend le nombre d'episode de l'anime
				$data2 = mysqli_query($db, $req_nbrEp);
				$row2 = mysqli_fetch_row($data2);
				$nbrMinutes = $nbrMinutes + $row2[0]; //ajoute le nombre d'episode au nombre de minutes 
			}
			
		$nbrMinutes = $nbrMinutes * 25; //multiplication du nombre de minutes par la duree d'un episode
		echo "Vous avez passé ". $nbrMinutes. " minutes à regarder des animes.<br/>";
		$nbrHeures = $nbrMinutes / 60; //calcul du nombre d'heures
		$nbrAnnees = $nbrHeures / 8760; //calcul du nombre d'annees
		echo "Soit un total de ". $nbrHeures. " heures ou ". $nbrAnnees. " années. <br/><br/>";
		
		echo "<div class='ajout_deconnexion'><a href='./fonction_Deconnexion.php'>Se déconnecter</a></div>"; //lien renvoyant à une page qui deconnecte l'utilisateur
		}
	?>
	
</body>
</html>