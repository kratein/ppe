<html>
<body>
<?php
session_start();
?>

<font color = 'red'><h2><center>Bienvenue <?php echo " ".$_SESSION ['civilite']." "?><?php echo " ".$_SESSION['nom']." " ?> sur l'interface visiteur de GSB</center></h2></font>


<a href='ajoutNote.php'><h1>ajouter une note de frais</h1></a>
<a href='listeNote.php'><h1>liste des notes de frais</h1></a>
<a href='ajoutClient.php'><h1>ajouter un client</h1></a>
<a href='listeClient.php'><h1>liste des clients</h1></a>
<a href='agenda.php'><h1>agenda</h1></a>
<a href='ajoutCompteRendu.php'><h1>ajouter un comte rendu</h1></a>

<body>
</html>