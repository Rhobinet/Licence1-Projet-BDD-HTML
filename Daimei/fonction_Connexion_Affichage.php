<!DOCTYPE html>
<html lang="fr">
<head>
	<meta charset="utf-8">
	<title>題名</title>
	<link href="projet.css" rel="stylesheet" >
</head>
<body>

<?php

	function connexion_requete($req) {
		
		// ouverture de connexion
		$db = new mysqli("localhost", "user", "user", "daimei");
		mysqli_set_charset($db, "utf8"); //Les accents

		if($db->connect_errno) {
			die("erreur $db->connect_error");
		}
		
		else {
			$data = mysqli_query($db,$req);
			return $data;
		}
		
	}

	function affichage($data){
			
		// position au début
		$data->data_seek(0);
		// booléen pour gérer la première ligne
		$first = true;
		
		echo '<table>';

		while ($row = $data->fetch_assoc())	{
			
			// pour la première ligne
			if ($first)	{
				$first = false;
				foreach ($row as $key => $value) {
					
					// echo '<tr>';
					// echo "<th> {$key} </th>";
					// echo '</tr>';
					
					if ($key != 'image'){
						echo '<tr>';
						echo "<td> {$value} </td>";
						echo '</tr>';
					}
					
					else {
						$value = "<img src='./Images/$value.jpg'>";
						echo '<tr>';
						echo "<td> {$value} </td>";
						echo '</tr>';
					}
				}
			}
			
		}
		
		echo '</table>';
		
	}

?>

</body>
</html>