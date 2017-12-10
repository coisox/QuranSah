<?php
	require_once 'connection2.php';

    $result = 'false';
    $sql = " SELECT 1 FROM qa_users WHERE level >= 80 AND email = '".$_GET['email']."'  ";
    $rs = mysql_query($sql, $conn) or die(mysql_error());

    if($rsNextMatch = mysql_fetch_assoc($rs)) {
        $result = 'true';
    }
    
    echo $result;
?>