<!DOCTYPE html>
<html lang="fr">
<head>
	<meta charset="utf-8">
	<title>題名</title>
	<link href="projet.css" rel="stylesheet" >
</head>
<body>
	
	
	<?php
		// permet de se deconnecter
		session_start(); //permet d'avoir des variables utilisables sur differentes pages
		$_SESSION['connexion'] = 0; //la personne est deconnecte
		header('Location: ./compte.php');  //redirection vers une autre page
		exit();
	?>

</body>
</html>