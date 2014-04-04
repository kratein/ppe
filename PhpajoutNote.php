<?php
include('bdd.php');

$Choix = $_POST['CATEGORIE'];
$Date = $_POST['DATE'];
$Montant = $_POST['TOTAL'];
$Justificatif = $_FILES['copieTicket'];
switch ($Choix)
{
	case 'Essence':$Categorie=1;
				break;
	case 'Restaurant':$Categorie=2;
				break;
	case 'Fourniture de bureau':$Categorie=3;
				break;
}


if(empty($_POST['DATE']) || empty($_POST['TOTAL']) || empty($_POST['CATEGORIE']))
{
	echo ("Un des champs obligatoire n'est pas remplis, la page va être vider pour vous permettre de ressaisir vos données");
    header ("Refresh: 3;URL=ajoutNote.php");	
}else{    
	if ($_FILES['copieTicket']['error'] > 0) 
	{
	echo $erreur = "Erreur lors du transfert !</br>";
	header ("Refresh: 3;URL=ajoutNote.php");
	}
	else{
	$extensions_valides = array( 'jpg' , 'jpeg' , 'png' );
	$extension_upload = strtolower(  substr(  strrchr($_FILES['copieTicket']['name'], '.')  ,1)  );
	if ( in_array($extension_upload,$extensions_valides) ) 
	{
	echo "Extension correcte.</br>";	
	$nom = "test.{$extension_upload}";
	$resultat = move_uploaded_file($_FILES['copieTicket']['tmp_name'],$nom);
	if ($resultat) 
	{
	echo "Transfert réussi.</br>";
    $req="INSERT INTO ndf (DT_NDF,PRIX,Categorie_idCategorie, justificatif,Visiteur_idVisiteur ) VALUES ('$Date','$Montant','$Categorie','$nom',1)";
	$res = mysql_query($req) or die ('Erreur SQL !'.$req.'<br />'.mysql_error());
	echo("Votre note de frais a bien été enregistrée.");
	header ("Refresh: 3;URL=pageVisiteur.php");
	}
	}
	else{
		echo ("Le type de fichier est incorrecte. (jpg, jpeg, png)");
		header ("Refresh: 3;URL=ajoutNote.php");	
	}
	}
}

?>