 <?php
include('bdd.php');
$loginOK = false;  // cf Astuce

// On n'effectue les traitement qu'à la condition que 
// les informations aient été effectivement postées
if ( isset($_POST) && (!empty($_POST['login'])) && (!empty($_POST['password'])) ) {

  extract($_POST);  

  // On va chercher le mot de passe afférent à ce login
  $sql = "SELECT Login, Mot_De_Passe FROM identifiant WHERE Login = '".addslashes($login)."'";
  $req = mysql_query($sql) or die('Erreur SQL : <br />'.$sql);
  
  // On vérifie que l'utilisateur existe bien
  if (mysql_num_rows($req) > 0) {
     $data = mysql_fetch_assoc($req);
    
    // On vérifie que son mot de passe est correct
    if ($password == $data['Mot_De_Passe']) {
      $loginOK = true;
	  $sql2="SELECT v.idVisiteur FROM visiteur v, identifiant i WHERE i.idIdentifiant=v.Identifiant_idIdentifiant AND i.Login='".addslashes($login)."'";
	  $req = mysql_query($sql2) or die('Erreur SQL : <br />'.$sql2);
	  $idVisiteur = mysql_fetch_array($req);
	  $sql3="SELECT v.Nom_Visiteur FROM visiteur v, identifiant i WHERE i.idIdentifiant=v.Identifiant_idIdentifiant AND i.Login='".addslashes($login)."'";
	  $req1 = mysql_query($sql3) or die('Erreur SQL : <br />'.$sql3);
	  $NomVisiteur = mysql_fetch_array($req1);
	  $sql4="SELECT v.Civilite FROM visiteur v, identifiant i WHERE i.idIdentifiant=v.Identifiant_idIdentifiant AND i.Login='".addslashes($login)."'";
	  $req2 = mysql_query($sql4) or die('Erreur SQL : <br />'.$sql3);
	  $Civilite = mysql_fetch_array($req2);
	  //convertir arraylist en string
	  session_start();
	  $_SESSION['login']=$_POST['login'];
	  $_SESSION['password']=$_POST['password'];
	  $_SESSION['id']=$idVisiteur[0];
	  $_SESSION ['nom']=$NomVisiteur[0];
	  $_SESSION ['civilite']=$Civilite[0];
	  header('Location: pageVisiteur.php'); 
    }
	else {
	  echo 'Une erreur est survenue, veuillez reessayer !';
	  echo ' Retour automatique vers la page de connexion !'; 
	  header ("Refresh: 3;URL=Connexion.php");

    } 
  }
  else {
     echo 'Une erreur est survenue, veuillez reessayer !'; 
	 echo ' Retour automatique vers la page de connexion !'; 
	 header ("Refresh: 3;URL=Connexion.php");
 
  }
}

else {
  echo 'Une erreur est survenue, veuillez reessayer !'; 
  echo ' Retour automatique vers la page de connexion !'; 
  header ("Refresh: 3;URL=Connexion.php");

}
?>