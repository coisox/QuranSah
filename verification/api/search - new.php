<?php
	require_once 'connection1.php';
	
    $json = array();
	
    $sql = "
        SELECT *, MATCH(sentence_no_dhabt) AGAINST('".$_POST['keyword']."') score
		FROM sura_by_page
        WHERE
			MATCH(sentence_no_dhabt) AGAINST('".$_POST['keyword']."')
			OR sentence_no_dhabt REGEXP '".str_replace(" ","|",$_POST['keyword'])."'
        ORDER BY score DESC
        LIMIT ".$_POST['more'].", 10
    ";
	
	$sql = "
        SELECT *, MATCH(sentence_no_dhabt) AGAINST('".$_POST['keyword']."') score
		FROM sura_by_page
		WHERE
			sentence_no_dhabt REGEXP '".str_replace(" ","|",$_POST['keyword'])."'
        LIMIT ".$_POST['more'].", 10
    ";

	$rs = $conn->query($sql);
	
	while($row = $rs->fetch_assoc()) {
        array_push($json,
			array(
				'id'=>$row['id'],
				'sura_fullname'=>$row['sura_fullname'],
				'sura_arabic'=>$row['sura_arabic'],
				'sentence'=>$row['sentence'],
				'page'=>$row['page'],
				'score'=>$row['score']
			)
		);
		
		$sql2 = "
			INSERT INTO log_result (
				lr_suraname,
				lr_score
			) VALUES (
				?,
				".$row['score']."
			)
			ON DUPLICATE KEY UPDATE
				lr_score = lr_score + ".$row['score']."
		";
		$stmt2 = $conn->prepare($sql2);
		
		if($stmt2 === false) {
			$error = $conn->error;
			echo json_encode(['status' => $error]);
			die();
		}

		$stmt2->bind_param('s', explode(",", $row['sura_fullname'])[0]);
		$stmt2->execute();
	
		if($stmt2->error) {
			$error = $stmt->error;
			echo json_encode(['status' => $error]);
			die();
		}
    }

    echo json_encode($json);
?>