<?php
require ('connexion_db.php');

function getDonnee($db,$idCapteur){
    $sql = 'SELECT Datas FROM donnees WHERE idCapteur="'.$idCapteur.'"';
    $reponse = $db->query($sql);
    return $reponse;
}

function readDonnee($db,$Datas){
    $sql = 'SELECT CAST( "'.$Datas.'" as char) FROM donnees';
    $reponse = $db->query($sql);
    return $reponse;
}

function searchDonnee($db,$charData){
    
}