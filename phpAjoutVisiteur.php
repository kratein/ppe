<?php

include('bdd.php');

$Nom = $_POST['NOM'];
$Prenom = $_POST['PRENOM'];
$Civilite = $_POST['CIVILITE'];
$Adresse = $_POST['ADRESSE'];
$Telephone = $_POST['TEL'];
$caractere = array ('a','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9');
$MDP="";
$Login="";


if(empty($_POST['NOM']) || empty($_POST['PRENOM']) || empty($_POST['CIVILITE']) || empty($_POST['ADRESSE']) || empty($_POST['TEL']))
{
	echo ("Un des champs obligatoire n'est pas remplis, la page va être vider pour vous permettre de ressaisir vos données");
    header ("Refresh: 3;URL=ajoutVisiteur.php");	
}else{
	if (strlen($Nom)<=5)
	{
		$Taille=strlen($Nom);
	}
	else
	{
		$Taille=5;
	}
	for ($i = 0; $i<$Taille;$i++)
	{
		$Login=$Login.$Nom[$i];
		$reqTest="SELECT Login FROM identifiant WHERE Login='".$Login."'";
		$res = mysql_query($reqTest) or die ('Erreur SQL !'.$reqTest.'<br />'.mysql_error());		
	}
	$l=0;
	while(mysql_num_rows($res)>0)
	{		
	    $Login=$Login+$Prenom[$l];
		$reqTest="SELECT Login FROM identifiant WHERE Login='".$Login."'";
		$res = mysql_query($reqTest) or die ('Erreur SQL !'.$reqTest.'<br />'.mysql_error());
		$l++;
	}
	for($i = 0; $i < 8; $i++)
	{
		$random=rand(0,34);
		$MDP=$MDP.$caractere[$random];
	}	
	$req1="INSERT INTO identifiant (idIdentifiant, Login, Mot_De_Passe, type) values ('','$Login','$MDP','visiteur')";
	$res = mysql_query($req1) or die ('Erreur SQL !'.$req1.'<br />'.mysql_error());
    $reqId="SELECT idIdentifiant FROM identifiant WHERE Login='".$Login."'";
	$res = mysql_query($reqId) or die ('Erreur SQL !'.$reqId.'<br />'.mysql_error());
	$data = mysql_fetch_assoc($res);
	$Identifiant=$data['idIdentifiant'];
    $req="INSERT INTO visiteur (idVisiteur, Nom_Visiteur, Pre_Visiteur, Ad_Visiteur, Tel_Visiteur,Identifiant_idIdentifiant, Civilite) values ('', '$Nom','$Prenom','$Adresse','$Telephone','$Identifiant','$Civilite')"; 
	$res = mysql_query($req) or die ('Erreur SQL !'.$req.'<br />'.mysql_error());
	echo("Votre nouveau Visiteur a bien été enregistré.");
	header ("Refresh: 3;URL=pageRh.php");
}

?>