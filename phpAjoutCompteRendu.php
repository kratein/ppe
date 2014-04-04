<?php
include('bdd.php');

$Nom=$_POST['NOM'];
$Prenom=$_POST['PRENOM'];
$DateRDV=$_POST['DATE_RDV'];
$CompteRendu=$_Files['CompteRendu'];

if(empty($_POST['NOM']) || empty($_POST['PRENOM']) || empty($_POST['DATE_RDV']))
{
	echo ("Un des champs obligatoire n'est pas remplis, la page va être vider pour vous permettre de ressaisir vos données");
    header ("Refresh: 3;URL=ajoutCompteRendu.php");
}
else
{
	if ($_FILES['CompteRendu']['error'] > 0) 
	{
		echo $erreur = "Erreur lors du transfert !</br>";
		header ("Refresh: 3;URL=ajoutCompteRendu.php");
	}
	else
	{
		$extensions_valides = array( 'txt', 'pdf', 'doc', 'odt', 'docx' );
		$extension_upload = strtolower(  substr(  strrchr($_FILES['CompteRendu']['name'], '.')  ,1)  );
		if ( in_array($extension_upload,$extensions_valides) ) 
		{
			echo "Extension correcte.</br>";	
			$nom = "test.{$extension_upload}";
			$resultat = move_uploaded_file($_FILES['CompteRendu']['tmp_name'],$nom);
			if ($resultat) 
			{
				echo "Transfert réussi.</br>";
				$req="SELECT idClient, idRDV FROM client c, rdv r WHERE ";
				$res = mysql_query($req) or die ('Erreur SQL !'.$req.'<br />'.mysql_error());
				echo("Votre compte rendu a bien été enregistrée.");
				header ("Refresh: 3;URL=pageVisiteur.php");
			}
		}
		else
		{
			echo ("Le type de fichier est incorrecte. (txt, pdf, doc, odt, docx)");
			header ("Refresh: 3;URL=ajoutCompteRendu.php");	
		}
	}
}
	

<?