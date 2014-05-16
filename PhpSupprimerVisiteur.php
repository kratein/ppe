<?php include ('bdd.php');

$Nom = $_POST['NOM'];
$Prenom = $_POST['PRENOM'];

if(empty($_POST['NOM']) || empty($_POST['PRENOM']))
{
	echo ("Un des champs obligatoire n'est pas remplis, la page va être vider pour vous permettre de ressaisir vos données");
    header ("Refresh: 3;URL=supprimerVisiteur.php");
}else{

	$sql="SELECT Identifiant_idIdentifiant FROM visiteur WHERE Nom_Visiteur='".$Nom."' AND Pre_Visiteur='".$Prenom."'";
	$req = mysql_query($sql) or die('Erreur SQL : <br />'.$sql);
	$data = mysql_fetch_assoc($req);
	$Identifiant=$data['Identifiant_idIdentifiant'];
	$sql2="DELETE FROM identifiant WHERE idIdentifiant=".$Identifiant."";
	$req = mysql_query($sql2) or die("Ce visiteur n'existe pas<br />");
	echo("Votre visiteur a bien été supprimé.");
	header ("Refresh: 3;URL=pageRh.php");
}

?>