<?php
// Contrôleur pour le formulaire inscription
include ("../Modele/Verification.php");
include ("../Modele/connexion_db.php");
include ("../Modele/Insertion_BDD.php");
$email = 'test@exemple.com';
if ($_POST["valider"]
    AND $_POST["Nom_utilisateur"]!=NULL
    AND idUtilisateur($db, $_POST["Nom_utilisateur"])==NULL
    AND $_POST["Mot_de_passe"]!=NULL
    AND $_POST["Confirmation_mot_de_passe"]!=NULL
    AND $_POST["Mot_de_passe"]==$_POST["Confirmation_mot_de_passe"]
    AND $_POST["Adresse"]!=NULL
    AND $_POST["Code_Postal"]!=NULL
    AND $_POST["Ville"]!=NULL
    AND $_POST["Email"]!= NULL
    AND filter_var($email, FILTER_VALIDATE_EMAIL)
    AND idMail($db, $_POST["Email"])==NULL
    AND $_POST["Numero_de_telephone"]!=NULL ){
    insertNewUser($db, $_POST["Nom_utilisateur"], $_POST["Mot_de_passe"], NULL, NULL, NULL, $_POST["Numero_de_telephone"], NULL);
    newIdUtilisateur($db); //sql est censé pouvoir faire l'incrémentation automatiquement
    newHome($db, idUtilisateur($db,$_POST["Nom_utilisateur"]),$_POST["Ville"], NULL, $_POST["Numero_de_telephone"], NULL, NULL, $_POST["Code_Postal"]);
    header("Location : compte_cree.html");
    exit;
}


else {

    if ($_POST["Nom_utilisateur"] == NULL) {
        echo "Vous devez entrer un nom d'utilisateur";
    }

    if (idUtilisateur($db, $_POST["Nom_utilisateur"])!= NULL){
        echo "Ce nom d'utilisateur est déjà utilisé";
    }

    if ($_POST["Mot_de_passe"] == NULL) {
        echo "Vous devez entrer un mot de passe";
    }

    if ($_POST["Confirmation_mot_de_passe"] == NULL) {
        echo "Vous devez confirmer votre mot de passe";
    }

    if ($_POST["Mot_de_passe"] != $_POST["Confirmation_mot_de_passe"]) {
        echo "Vous n'avez pas rentré le même mot de passe";
    }

    if ($_POST["Adresse"] == NULL) {
        echo "Vous devez entrer une adresse";
    }

    if ($_POST["Code_Postal"] == NULL) {
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

    if ($_POST["Numero_de_telephone"] == NULL) {
        echo "Vous devez entrer un numéro de téléphone";
    }

}

?>
