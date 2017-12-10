<?php
	require_once 'connection1.php';

    $json = array();
    $sql = "SELECT lr_suraname, lr_score FROM log_result ORDER BY lr_score desc LIMIT 5";
    $rs = mysql_query($sql, $conn) or die(mysql_error());

    while($rsNextMatch = mysql_fetch_assoc($rs)) {
        array_push($json, array('sura'=>$rsNextMatch['lr_suraname'], 'val'=>$rsNextMatch['lr_score']));
    }
    
    echo json_encode($json);
?>