﻿<html>
<?php include ('bdd.php');
?>
<form method="post" action="PhpVoirCompteRendu.php" >
	<head>
	 <title>voir compte-rendu</title>
     <h1><center>Sur quels clients voulez voir les comptes-rendus</center></h1>
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
		<td><td> <input type ="submit" name="CLIENT" value="Compte-rendu" >	 
	 </form>
</table>
</html>