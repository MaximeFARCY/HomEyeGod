<?php
	$dbname = 'BDDHomEyeGod';
	$host='localhost';
	$user='root';
	$password='root';
	
	$db = new PDO("mysql:host=$host;dbname=$dbname", "user", "$password");
	$db->query("SET NAMES UTF8");
?>