<html>
<TABLE BORDER="3"> 
  <CAPTION> Liste des Notes de Frais </CAPTION> 
  <TR> 
 <TH> Numero Note de frais </TH> 
 <TH> Date note de frais  </TH> 
 <TH> Montant note de frais  </TH> 
 <TH> statut  </TH> 
  </TR> 
  <TR> 
 <?php
session_start();
 include('bdd.php');
$sql = mysql_query("SELECT * FROM ndf");
$req = "SELECT * FROM ndf";
$res = mysql_query($req) or die ('Erreur SQL !'.$req.'<br />'.mysql_error()); 
$idNDF=""; 
$DT_NDF="";
$MT_NDF="";
$STATUT="";
while($data = mysql_fetch_array($sql))
{
	$idNDF = $idNDF.$data['idNDF'].'<br/>';
	$DT_NDF = $DT_NDF.$data['DT_NDF'].'<br/>';
	$MT_NDF = $MT_NDF.$data['PRIX'].'<br/>';
	$STATUT = $STATUT.$data['Statut'].'<br/>';
	
}
mysql_close(); 
?>
 <TD><?php echo $idNDF ?></TD> 
 <TD> <?php echo $DT_NDF?> </TD> 
 <TD> <?php echo $MT_NDF?> </TD> 
 <TD> <?php echo $STATUT?> </TD> 
 
 
  </TR> 
</TABLE> 
</html>
<?php        