 <?php
include('bdd.php');
$loginOK = false;  // cf Astuce

// On n'effectue les traitement qu'à la condition que 
// les informations aient été effectivement postées
if ( isset($_POST) && (!empty($_POST['login'])) && (!empty($_POST['password'])) ) {

  extract($_POST);  

  // On va chercher le mot de passe afférent à ce login
  $sql = "SELECT * FROM identifiant WHERE Login = '".addslashes($login)."'";
  $req = mysql_query($sql) or die('Erreur SQL : <br />'.$sql);
  
  // On vérifie que l'utilisateur existe bien
  if (mysql_num_rows($req) > 0) {
     $data = mysql_fetch_assoc($req);
    
    // On vérifie que son mot de passe est correct
    if ($password == $data['Mot_De_Passe']) {
      $loginOK = true;
	  $categorie=$data['type'];
	  switch ($categorie)
	  {
		case'visiteur':$sql2="SELECT * FROM visiteur v, identifiant i WHERE i.idIdentifiant=v.Identifiant_idIdentifiant AND i.Login='".addslashes($login)."'";
					   $req = mysql_query($sql2) or die('Erreur SQL : <br />'.$sql2);
					   $data = mysql_fetch_array($req);
					   $idVisiteur= $data['idVisiteur'];
					   $NomVisiteur=$data['Nom_Visiteur'];
					   $Civilite=$data['Civilite'];	                     
	                   session_start();
	                    $_SESSION['login']=$_POST['login'];
	                    $_SESSION['password']=$_POST['password'];
	                    $_SESSION['id']=$idVisiteur;
	                    $_SESSION ['nom']=$NomVisiteur;
	                    $_SESSION ['civilite']=$Civilite;
	                    header('Location: pageVisiteur.php'); 					
			break;
		case'rh':header('Location: pageRh.php');
		case'comptable':header('Location: pageComptable.php');
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
}

else {
  echo 'Une erreur est survenue, veuillez reessayer !'; 
  echo ' Retour automatique vers la page de connexion !'; 
  header ("Refresh: 3;URL=Connexion.php");

}
?>