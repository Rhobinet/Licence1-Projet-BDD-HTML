<!DOCTYPE html>
<html lang="fr">
<head>
	<meta charset="utf-8">
	<title>題名</title>
	<link href="projet.css" rel="stylesheet" >
</head>
<body>

	
	<?php
		// Ajout d'un manga lu par un utilisateur dans la base de donnee
		session_start(); //permet d'avoir des variables utilisables sur differentes pages
		
		$num_Anime = $_SESSION['num_Anime'];
		$pseudo = $_SESSION['pseudo'];

		
		$db = new mysqli("localhost", "user", "user", "daimei");
		mysqli_set_charset($db, "utf8"); //Les accents
		
		if($db->connect_errno) {
			die("erreur $db->connect_error");
		}
		
		$req = "select numUtilisateur";
		$req .= " from utilisateur";
		$req .= " where '$pseudo' = pseudo";
		$data = mysqli_query($db,$req);
		
		$row = mysqli_fetch_row($data);
		
		
		$req2 = "insert into regarde_anime(numUtilisateur_regarde, numAnime_regarde)";
		$req2 .= " values ($row[0], $num_Anime)";
		$data2 = mysqli_query($db, $req2);
		
		mysqli_free_result($data); //Enlève la mémoire associées à $data
	
		header('Location: ./les_Listes.html');
		exit();

	?>

</body>
</html>