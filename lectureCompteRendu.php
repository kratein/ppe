<?php
$fichier="C:/wamp/www/GSB/ppe/".$_GET['compteRendu'].""; 
$tabfich=file($fichier); 
for( $i = 0 ; $i < count($tabfich) ; $i++ )
{
echo $tabfich[$i]."</br>";
}
?>
