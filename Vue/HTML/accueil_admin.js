
function modifLongueur(page) {
    var x = document.getElementsByClassName("consult_admin");
    var m = document.getElementsByClassName("modif_admin");
    var c = document.getElementsByClassName("rectangle_flex_acc");

    for (var i = 0; i < x.length; i++) {
        x[i].style.display="none";

    }
    for (var j = 0; j < m.length; j++) {
        m[j].style.display="none";
    }
    for (var k = 0; k < c.length; k++) {
        c[k].style.display="none";
    }

    if (page === 'modif'){
        var n = document.getElementsByClassName("rectangle_flex_modif");
        for(var l = 0;l<n.length;l++){
            n[l].style.display = "flex";
        }
    }

    if (page === 'consult'){
        var z = document.getElementsByClassName("rectangle_flex_consult");
        for(var o = 0;o<z.length;o++){
            z[o].style.display = "flex";
        }
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