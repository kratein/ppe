<html>
<TABLE BORDER="3"> 
  <CAPTION> Liste des compte-rendu </CAPTION> 
  <TR> 
 <TH> Numéro du compte-rendu </TH> 
 <TH> Compte-rendu  </TH>  
 <TH> Date du rendez-vous  </TH>  
  </TR> 
  <TR> 
    </TR> 
<?php include ('bdd.php');

$Nom = $_POST['NOM'];
$Prenom = $_POST['PRENOM'];
$date="";
$idRdv="";
$idCompteRendu="";
$compteRendu="";

if(empty($_POST['NOM']) || empty($_POST['PRENOM']))
{
	echo ("Un des champs obligatoire n'est pas remplis, la page va être vider pour vous permettre de ressaisir vos données");
    header ("Refresh: 3;URL=voirCompteRendu.php");
}else{

	$sql="SELECT idClient FROM client WHERE nom_Client='".$Nom."' AND Pre_Client='".$Prenom."'";
	$req = mysql_query($sql) or die('Erreur SQL : <br />'.$sql);
	$data = mysql_fetch_assoc($req);
	$identifiant=$data['idClient'];
	$sql2="SELECT idRDV,DT_RDV FROM rdv WHERE idClient='".$identifiant."'";
	$req = mysql_query($sql2) or die('Erreur SQL : <br />'.$sql2);
	//while($data = mysql_fetch_array($req))
	//{		
		$data = mysql_fetch_assoc($req);
		$date= $date.$data['DT_RDV'].'<br/>';
		$idRdv=$idRdv.$data['idRDV'].'<br/>';
	//}
	$sql3="SELECT id_compteRendu, Compte_Rendu FROM compterendu WHERE id_Client='".$identifiant."'";// AND id_RDV='".$idRdv."'";
	$req = mysql_query($sql3) or die('Erreur SQL : <br />'.$sql3);
	//while($data = mysql_fetch_array($req))
	//{
		$data = mysql_fetch_assoc($req);
		$idCompteRendu=$idCompteRendu.$data['id_compteRendu'].'<br/>';
		$compteRendu=$compteRendu.$data['Compte_Rendu'];
	//}
}
mysql_close();
?>
<TD> <?php echo $idCompteRendu ?></TD> 
 <TD> <a href="lectureCompteRendu.php?compteRendu=<?php echo $compteRendu ?>"><?php echo $compteRendu ?></a> </TD> 
 <TD> <?php echo $date ?> </TD>  
 
 
  </TR> 
</TABLE> 
</html>
<?php     