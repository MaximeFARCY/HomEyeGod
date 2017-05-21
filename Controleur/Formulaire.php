<?php
// Contrôleur pour le formulaire inscription
include ("Modele/Verification.php");
include ("Modele/connexion_db.php");
include ("Modele/Insertion_BDD.php");
$email = 'test@exemple.com';
if ($_POST["valider"]
    AND $_POST["Nom d'utilisateur"]!=NULL
    AND idUtilisateur($db, $_POST["Nom d'utilisateur"])==NULL
    AND $_POST["Mot de passe"]!=NULL
    AND $_POST["Confirmation de mot de passe"]!=NULL
    AND $_POST["Mot de passe"]==$_POST["Confirmation de mot de passe"]
    AND $_POST["Adresse"]!=NULL
    AND $_POST["Code Postal"]!=NULL
    AND $_POST["Ville"]!=NULL
    AND $_POST["Email"]!= NULL
    AND filter_var($email, FILTER_VALIDATE_EMAIL)
    AND idMail($db, $_POST["Email"])==NULL
    AND $_POST["Numéro de téléphone"]!=NULL ){
    insertNewUser($db, $_POST["Nom d'utilisateur"], $_POST["Mot de passe"], NULL, NULL, NULL, $_POST["Numéro de téléphone"], NULL);
    newIdUtilisateur($db);
    newHome($db, idUtilisateur($db,$_POST["Nom d'utilisateur"]),$_POST["Ville"], NULL, $_POST["Numéro de téléphone"], NULL, NULL, $_POST["Code Postal"]);
    header("Location : la page compte crée");
    exit;
}


else {

    if ($_POST["Nom d'utilisateur"] == NULL) {
        echo "Vous devez entrer un nom d'utilisateur";
    }

    if (idUtilisateur($db, $_POST["Nom d'utilisateur"])!= NULL){
        echo "Ce nom d'utilisateur est déjà utilisé";
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

    if (filter_var($email, FILTER_VALIDATE_EMAIL)){
        echo "Cette adresse mail est valide";
    }
    else {
        echo "Cette adresse mail est invalide";
    }

    if (idMail($db, $_POST["Email"])!= NULL){
        echo "Cette adresse mail est déjà utilisée";
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