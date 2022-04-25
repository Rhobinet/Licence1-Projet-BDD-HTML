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
	
	
	<div class="connexion_2">
		<form action="connexion.php" method="get">
			<?php
				// Ce qu'il se passe lorsqu'un utilisateur essaye de se connecter
				session_start(); //permet d'avoir des variables utilisables sur differentes pages
				
				$pseudo = $_GET['pseudo'];
				$password = $_GET['password'];
				$afficherForm = 1;	//Pour réafficher le formulaire d'inscription si le pseudo est déjà utilisé
				
				$req = "select count(*)";	//Compte le nombre de ligne dans une table
				$req .= " from utilisateur";
				$req .= " where pseudo = '$pseudo' and motDePasse = '$password'";
				
				include 'fonction_Connexion_Affichage.php'; //pour pouvoir utiliser les fonctions de fonction_Connexion_Affichage
				$data = connexion_requete($req); //envoie de la requete à la base de donnee
				
				foreach($data as $test){
					foreach($test as $key => $value){
						
						// Affichage lorsque l'utilisateur est connecté
						if($value != 0){
							echo "Vous êtes connecté. <br/>";
							$afficherForm = 0; 		//Empêchera le réaffichage du formulaire
							$_SESSION['pseudo'] = $pseudo;
							$_SESSION['connexion'] = 1;
							
							$req = "select numUtilisateur";
							$req .= " from utilisateur";
							$req .= " where '$pseudo' = pseudo";
							$data = connexion_requete($req);
							$row = mysqli_fetch_row($data);
							$_SESSION['numUtilisateur'] = $row[0]; //met le nom d'utilisateur dans SESSION pour le reutiliser sur d'autres pages
							
						}
						
						else{
							echo "Nom d'utilisateur ou mot de passe incorrect.";
							$_SESSION['connexion'] = 0;
						}
						
					}
				}
				
				// Affichage tant que l'utilisateur n'est pas connecte car $afficherForm reste à 1
				if ($afficherForm == 1){
					echo " <label for='pseudo'>Pseudo :</label>
					<input name='pseudo' id='pseudo' type='text' pattern='[A-Za-z0-9 ]{3,50}' required><br/><br/>
					<label for='password'>Mot de passe :</label>
					<input name='password' id='password' type='password' pattern='[A-Za-z0-9 ]{6,50}' autocomplete='new-password' required><br/><br/>
					<input type='submit' name='connexion' value='Connexion'><br/><br/>";
				}
					
			?>
		</form>
	</div>
	
</body>
</head>