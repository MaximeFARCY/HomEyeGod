<?php
	$dbname = 'HomEyeGod';
	$host='localhost';
	$user='root';
	$password='root';
	
	$db = new PDO("mysql:host=$host;dbname=$dbname", "user", "$pass");
	$db->query("SET NAMES UTF8");
?>