<?php
// Contrôleur pour le formulaire inscription
include ("../Modele/Verification.php");
include ("../Modele/connexion_db.php");
include ("../Modele/Insertion_BDD.php");
$email = "test@exemple.com";
if ($_POST["valider"]
    AND $_POST["Nom"]!=NULL
    AND $_POST["Prenom"]!=NULL
    AND $_POST["Nom_utilisateur"]!=NULL
    AND idUtilisateur($db, $_POST["Nom_utilisateur"])->rowcount() ==NULL
    AND $_POST["Mot_de_passe"]!=NULL
    AND $_POST["Confirmation_mot_de_passe"]!=NULL
    AND $_POST["Mot_de_passe"]==$_POST["Confirmation_mot_de_passe"]
    AND $_POST["Adresse"]!=NULL
    AND $_POST["Code_Postal"]!=NULL
    AND $_POST["Ville"]!=NULL
    AND $_POST["Email"]!= NULL
    AND filter_var($email, FILTER_VALIDATE_EMAIL)
    AND idMail($db, $_POST["Email"])->rowcount()==NULL
    AND $_POST["Numero_de_telephone"]!=NULL ){
    newIdUtilisateur($db);
    //newHome($db, idUtilisateur($db,$_POST["Nom_utilisateur"]),$_POST["Ville"], NULL, $_POST["Numero_de_telephone"], NULL, NULL, $_POST["Code_Postal"]);
    insertNewUser($db, $_POST["Nom_utilisateur"], $_POST["Mot_de_passe"], NULL, NULL, NULL, $_POST["Numero_de_telephone"], NULL);
    header('Location: ../HTML/compte_cree.html');
    exit;
}


else {
    echo "Tous les champs n'ont pas été correctement remplis :";
    echo "<br>";
    echo "<br>";

    if ($_POST["Nom"] == NULL){
        echo "Vous devez entrer un Nom";
        echo "<br>";
        echo "<br>";
    }

    if ($_POST["Prenom"] == NULL){
        echo "Vous devez entrer un Prénom";
        echo "<br>";
        echo "<br>";
    }

    if ($_POST["Nom_utilisateur"] == NULL) {
        echo "Vous devez entrer un nom d'utilisateur";
        echo "<br>";
        echo "<br>";
    } else {

        if (idUtilisateur($db, $_POST["Nom_utilisateur"])->rowcount() != NULL) {
            echo "Ce nom d'utilisateur est déjà utilisé";
            echo "<br>";
            echo "<br>";
        }
    }

    if ($_POST["Mot_de_passe"] == NULL) {
        echo "Vous devez entrer un mot de passe";
        echo "<br>";
        echo "<br>";
    }

    else {
        if ($_POST["Confirmation_mot_de_passe"] == NULL) {
            echo "Vous devez confirmer votre mot de passe";
            echo "<br>";
            echo "<br>";
        }

        else {

            if ($_POST["Mot_de_passe"] != $_POST["Confirmation_mot_de_passe"]) {
                echo "Vous n'avez pas rentré le même mot de passe";
                echo "<br>";
                echo "<br>";
            }
        }
    }

    if ($_POST["Adresse"] == NULL) {
        echo "Vous devez entrer une adresse";
        echo "<br>";
        echo "<br>";
    }

    if ($_POST["Code_Postal"] == NULL) {
        echo "Vous devez entrer un code Postal";
        echo "<br>";
        echo "<br>";
    }

    if ($_POST["Ville"] == NULL) {
        echo "Vous devez entrer une ville";
        echo "<br>";
        echo "<br>";
    }

    if ($_POST["Email"] == NULL) {
        echo "Vous devez entrer une adresse mail";
        echo "<br>";
        echo "<br>";
    }

    else {
        if (filter_var($email, FILTER_VALIDATE_EMAIL)==true) {
            if (idMail($db, $_POST["Email"])->rowcount() != NULL) {
                echo "Cette adresse mail est déjà utilisée";
                echo "<br>";
                echo "<br>";
            }
        } else {
            echo "Cette adresse mail est invalide";
            echo "<br>";
            echo "<br>";
        }
    }

    if ($_POST["Numero_de_telephone"] == NULL) {
        echo "Vous devez entrer un numéro de téléphone";
        echo "<br>";
        echo "<br>";
    }
}

?>
