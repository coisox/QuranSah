<?php
	require_once 'connection1.php';

    $json = array();
    $sql = "SELECT ls_fullname, ls_count FROM log_search ORDER BY ls_count desc LIMIT 10
    ";
    $rs = mysql_query($sql, $conn) or die(mysql_error());

    while($rsNextMatch = mysql_fetch_assoc($rs)) {
        array_push($json, array('fullname'=>$rsNextMatch['ls_fullname'], 'val'=>$rsNextMatch['ls_count']));
    }
    
    echo json_encode($json);
?>