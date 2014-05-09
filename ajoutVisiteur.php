<html>
<?php include ('bdd.php');
?>
<form method="post" action="PhpajoutVisiteur.php" >
	<head>
	 <title>Ajout d'un visiteur</title>
     <h1><center>Formulaire d'ajout de visiteur</center></h1>
	 
	<table>
	 
	<tr>
	<td width = '200'> Civilité </td>
	<td width = '600'>
	<input type="text" name="CIVILITE" size ="15"/>
	</td></tr>
	
	<tr>
	<td width = '200'> Nom </td>
	<td width = '600'>
	<input type="text" name="NOM" size ="15"/>
	</td></tr>
	
	<tr>
	<td width = '200'> Prénom </td>		
	<td width = '600'>
	<input type="text" name="PRENOM" size ="15"/>
	</td></tr>
	
	<tr>
    <td width = '200'> Adresse </td>
	<td width = '600'>
	<input type="text" name="ADRESSE" size ="30"/>
	</td></tr>
	
	<tr>
    <td width = '200'> Téléphone </td>
	<td width = '600'>
	<input type="text" name="TEL" size ="10"/>
	</td></tr>
	
	<tr><tr><td><td>
	<input type="submit" name="submit" value="Enregistrer">
	</tr></tr></td></td>
</html>