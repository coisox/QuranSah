<?php
	require_once 'connection2.php';

	$sql = "SELECT COUNT(1) jumlah FROM gdn_discussion";
    $rs = mysql_query($sql, $conn) or die(mysql_error());
	$rsNextMatch = mysql_fetch_assoc($rs);
	$total = $rsNextMatch['jumlah'];
	
    $sql = "SELECT COUNT(1) jumlah FROM gdn_discussion WHERE FirstCommentID IS NOT NULL";
    $rs = mysql_query($sql, $conn) or die(mysql_error());
	$rsNextMatch = mysql_fetch_assoc($rs);
	$answered = $rsNextMatch['jumlah'];
	
    echo $total.','.$answered;
?>