<?php
	/*
	error_reporting(E_ALL & ~E_DEPRECATED & ~E_NOTICE);
	$hostname_conn = "localhost";
	$database_conn = "quran_uthmani";
	$username_conn = "root";
	$password_conn = "";
	$conn = mysql_connect($hostname_conn, $username_conn, $password_conn) or die("");
	mysql_select_db($database_conn, $conn);
	mysql_query("SET time_zone = 'Asia/Kuala_Lumpur'");
	mysql_query("SET NAMES utf8");
	*/
	
	error_reporting(E_ALL & ~E_DEPRECATED & ~E_NOTICE & ~E_WARNING);
	$conn = new mysqli('127.0.0.1', 'root', '', 'quransah_verification');
	mysqli_query("SET time_zone = 'Asia/Kuala_Lumpur'");
	mysqli_query("SET NAMES utf8");

	if ($conn->connect_errno) {
		echo json_encode(['status' => "Connection error"]);
		die();
	}
?>