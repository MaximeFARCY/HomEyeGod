<?php
// Contrôleur pour le formulaire inscription
if ($_POST["valider"] AND $_POST["Nom d'utilisateur"]!=NULL AND $_POST["Mot de passe"]!=NULL AND $_POST["Confirmation de mot de passe"]!=NULL
    AND $_POST["Mot de passe"]==$_POST["Confirmation de mot de passe"] AND $_POST["Adresse"]!=NULL AND $_POST["Code Postal"]!=NULL
    AND $_POST["Ville"]!=NULL AND $_POST["Email"]!= NULL AND $_POST["Numéro de téléphone"]!=NULL ){
    header("Location : la page compte crée");
    exit;
}

else {

    if ($_POST["Nom d'utilisateur"] == NULL) {
        echo "Vous devez entrer un nom d'utilisateur";
    }

    if ($_POST["Mot de passe"] == NULL) {
        echo "Vous devez entrer un mot de passe";
    }

    if ($_POST["Confirmation de mot de passe"] == NULL) {
        echo "Vous devez confirmer votre mot de passe";
    }

    if ($_POST["Mot de passe"] != $_POST["Confirmation de mot de passe"]) {
        echo "Vous n'avez pas rentré le même mot de passe";
    }

    if ($_POST["Adresse"] == NULL) {
        echo "Vous devez entrer une adresse";
    }

    if ($_POST["Code Postal"] == NULL) {
        echo "Vous devez entrer un code Postal";
    }

    if ($_POST["Ville"] == NULL) {
        echo "Vous devez entrer une ville";
    }

    if ($_POST["Email"] == NULL) {
        echo "Vous devez entrer une adresse mail";
    }

    if ($_POST["Numéro de téléphone"] == NULL) {
        echo "Vous devez entrer un numéro de téléphone";
    }
}

?>
/**
 * Created by PhpStorm.
 * User: Jimmy
 * Date: 11/05/2017
 * Time: 10:16
 */