<?php
$dbname = 'homeyegod';
$host='localhost';
$user='root';
$password='root';

$db = new PDO("mysql:host=$host;dbname=$dbname", "$user", "$password");
$db->query("SET NAMES UTF8");

function recup_text($db,$nom){
    $sql='SELECT page FROM Pages WHERE nom_page="'.$nom.'"';
    $r = $db->query($sql);
    return $r;
}
