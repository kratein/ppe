<html>
<TABLE BORDER="2"> 
  <CAPTION> Liste des clients </CAPTION> 
  <TR> 
 <TH> Nom </TH> 
 <TH> Prénom </TH> 
 <TH> Date de naissance </TH>
 <TH> Profession </TH> 
 <TH> Téléphone </TH>
 <TH> Adresse Email </TH>
 <TH> Rue </TH>
 <TH> Code postal </TH>
 <TH> Ville </TH>
 <TH> Commentaire </TH>
 <TH>  </TH> 
  </TR> 
  <TR> 
 <?php
 include('bdd.php');
$sql = mysql_query("SELECT * FROM client");
$req = "SELECT * FROM client";
$res = mysql_query($req) or die ('Erreur SQL !'.$req.'<br />'.mysql_error()); 
$nom=""; 
$prenom="";
$dateNaiss="";
$prof="";
$tel="";
$mail="";
$rue="";
$cp="";
$ville="";
$com="";
while($data = mysql_fetch_array($sql))
{
	$nom = $nom.$data['nom_Client'].'<br/>';
	$prenom = $prenom.$data['Pre_Client'].'<br/>';
	$dateNaiss = $dateNaiss.$data['Dt_Naiss'].'<br/>';
	$prof = $prof.$data['Prof_Client'].'<br/>';
	$tel = $tel.$data['Tel_Client'].'<br/>';
	$mail = $mail.$data['Mail_Client'].'<br/>';
	$rue = $rue.$data['Rue_Client'].'<br/>';
	$cp = $cp.$data['CP_Client'].'<br/>';
	$ville = $ville.$data['Ville_Client'].'<br/>';
	$com = $com.$data['Commentaire_Client'].'<br/>';
}
?>
 <TD><?php echo $nom ?></TD> 
 <TD> <?php echo $prenom ?> </TD> 
 <TD> <?php echo $dateNaiss ?> </TD> 
 <TD> <?php echo $prof ?> </TD>
 <TD> <?php echo $tel ?> </TD>
 <TD> <?php echo $mail ?> </TD>
 <TD> <?php echo $rue ?> </TD>
 <TD> <?php echo $cp ?> </TD>
 <TD> <?php echo $ville ?> </TD>
 <TD> <?php echo $com ?> </TD>
 
  </TR> 
</TABLE> 
</html>
<?php        
