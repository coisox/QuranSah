<?php
	error_reporting(E_ALL & ~E_DEPRECATED & ~E_NOTICE);
	$hostname_conn = "localhost";
	$database_conn = "quransah_forum";
	$username_conn = "root";
	$password_conn = "";
	$conn = mysql_connect($hostname_conn, $username_conn, $password_conn) or die("");
	mysql_select_db($database_conn, $conn);
	mysql_query("SET time_zone = 'Asia/Kuala_Lumpur'");
	mysql_query("SET NAMES utf8");
?>