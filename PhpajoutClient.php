<?php

include('bdd.php');

$Nom = $_POST['NOM'];
$Prenom = $_POST['PRENOM'];
$Profession = $_POST['PROFESSION'];
$Date_Naissance = $_POST['DATE_NAISSANCE'];
$Rue = $_POST['RUE'];
$Code_Postal = $_POST['CODE_POSTAL'];
$Ville = $_POST['VILLE'];
$Telephone = $_POST['TELEPHONE'];
$Email = $_POST['EMAIL'];
$Commentaire = $_POST['COMMENTAIRE'];

if(empty($_POST['NOM']) || empty($_POST['PRENOM']) || empty($_POST['PROFESSION']) || empty($_POST['DATE_NAISSANCE']) || empty($_POST['RUE']) || empty($_POST['CODE_POSTAL']) || empty($_POST['VILLE']) || empty($_POST['TELEPHONE']) || empty($_POST['EMAIL']) || empty($_POST['COMMENTAIRE']))
{
	echo ("Un des champs obligatoire n'est pas remplis, la page va être vider pour vous permettre de ressaisir vos données");
    header ("Refresh: 3;URL=ajoutClient.php");	
}else{    
    $req="INSERT INTO client(idClient, nom_Client, Pre_Client, Dt_Naiss, Prof_Client, Tel_Client, Mail_Client, Rue_Client, CP_Client, Ville_Client, Commentaire_Client) VALUES ('','$Nom','$Prenom','$Date_Naissance','$Profession','$Telephone','$Email','$Rue','$Code_Postal','$Ville','$Commentaire')";
	$res = mysql_query($req) or die ('Erreur SQL !'.$req.'<br />'.mysql_error());
	echo("Votre nouveau client a bien été enregistré.");
	header ("Refresh: 3;URL=pageVisiteur.php");
}

?>