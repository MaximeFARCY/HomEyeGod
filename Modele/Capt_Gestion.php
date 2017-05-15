<?php

require("connexion_db.php");


function idMaisonprincipale($db,$idUtilisateur){
// Recherche idMaison de la maison principale de l'utilisateur, celle mentionnée dans sa table
    $sql = 'SELECT idMaison FROM utilisateurs WHERE idUtilisateur = "'.$idUtilisateur.'"';
    $reponse = $db->query($sql);
    return $reponse;
}
function idOtherHome($db,$idUtilisateur,$idMaisonprincipale){
    // Cherche toutes les maisons affiliées à l'id utilisateur
    $sql = 'SELECT idMaison FROM maison WHERE idUtilisateur = "'.$idUtilisateur.'"' ;
    $reponse = $db->query($sql);
    return $reponse;
}

function addCapteur($db,$idUtilisateur,$idMaison,$type,$idPiece){
// Ajoute un capteur dans une pièce prédéfinie
    $sql = 'INSERT INTO capteurs (idUtilisateur,typeCapt,idPiece,idMaison) VALUES ($idUtilisateur,$type,$idPiece,$idMaison)';
    $db->exec($sql);
}
function delCapteur($db,$idCapteur){
    // Supprime un capteur de la base de donnée
    $sql = 'DELETE ON CASCADE FROM capteurs WHERE idCapteur = "'.$idCapteur.'"';
    $db->exec($sql);
}


?>