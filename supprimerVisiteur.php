<html>
<html>
<?php include ('bdd.php');
?>
<form method="post" action="PhpSupprimerVisiteur.php" >
	<head>
	 <title>Supprimer un visiteur</title>
     <h1><center>Formulaire de suppression d'un visiteur</center></h1>
<table>
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
		<td><td> <input type ="submit" name="VISITEUR" value="Supprimer visiteur" >	 
	 </form>
</table>
</html>