
function modifLongueur(page) {
    var x = document.getElementsByClassName("consult_admin");
    var m = document.getElementsByClassName("modif_admin");
    var c = document.getElementsByClassName("rectangle_flex_acc");

    for (var i = 0; i < x.length; i++) {
        x[i].style.width = "0%";
        x[i].style.visibility = "hidden";

    }
    for (var j = 0; j < m.length; j++) {
        m[j].style.width = "0%";
        m[j].style.visibility = "hidden";
    }
    for (var k = 0; k < c.length; k++) {
        c[k].style.width = "0%";
        c[k].style.visibility = "hidden";
    }

    if (page == 'modif'){
        document.getElementById("rectangle_flex_modif").style.width ="100%";
        document.getElementById("rectangle_flex_modif").style.height ="500px";
    }

    if (page == 'consult'){

    }


}
// fonction pour ajouter un écouteur à t
/*function load() {
    var el = document.getElementsByClassName("modif_admin");
    el.addEventListener("click", modifieTexte, false);
}*/

/*function myFunction() {
    var x = document.getElementsByClassName("");
    var i;
    for (i = 0; i < x.length; i++) {
        x[i].style.backgroundColor = "red";
    }
}*/