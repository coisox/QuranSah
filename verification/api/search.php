<?php
	require_once 'connection1.php';

    $json = array();
    $sql = "
        SELECT *, MATCH(sentence_no_dhabt) AGAINST('".$_POST['keyword']."') score FROM sura_by_page
        WHERE
			MATCH(sentence_no_dhabt) AGAINST('".$_POST['keyword']."')
			OR sentence_no_dhabt REGEXP '".str_replace(" ","|",$_POST['keyword'])."'
        ORDER BY score DESC
        LIMIT ".$_POST['more'].", 10
    ";
    $rs = mysql_query($sql, $conn) or die(mysql_error());

    while($rsNextMatch = mysql_fetch_assoc($rs)) {
        array_push($json,
			array(
				'id'=>$rsNextMatch['id'],
				'sura_fullname'=>$rsNextMatch['sura_fullname'],
				'sura_arabic'=>$rsNextMatch['sura_arabic'],
				'sentence'=>$rsNextMatch['sentence'],
				'page'=>$rsNextMatch['page'],
				'score'=>$rsNextMatch['score']
			)
		);
		
		$sql2 = "
			INSERT INTO log_result (
				lr_suraname,
				lr_score
			) VALUES (
				'".mysql_real_escape_string(explode(",", $rsNextMatch['sura_fullname'])[0])."',
				".$rsNextMatch['score']."
			)
			ON DUPLICATE KEY UPDATE
				lr_score = lr_score + ".$rsNextMatch['score']."
		";
		$rs2 = mysql_query($sql2, $conn) or die(mysql_error());
    }

    echo json_encode($json);
?>