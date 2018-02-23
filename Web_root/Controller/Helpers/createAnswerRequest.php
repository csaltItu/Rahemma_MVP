<?php

require('get_db.php');
header('Content-Type: application/json');

$question_id=$_GET['question_id'];
$answer_id=$_GET['answer_id'];
$type=$_GET['type'];

	$conn = DBConn();

	$sql  = 'SELECT call_id FROM question WHERE question_id = '.$question_id;
	// echo "$sql";
	if ($result = $conn->query($sql)) {
		if($row = $result->fetch_row()) {
			$call_id = $row[0];
			$sql2 = 'SELECT Phone_Number,Call_Type FROM `pollywa`.`call table` WHERE Call_ID ='. $call_id;
			// echo "$sql2";
			if ($result2 = $conn->query($sql2)) {
				if($row2 = $result2->fetch_row()) {
					// var_dump($row2);
					// $Request_Type = $row2[1]."-ANS";
					$Request_Type = $row2[1];
					$Request_Type = str_replace("CMB", "DEL", $Request_Type);
					if ($Request_Type == "REM-CMB-ROBO" || $Request_Type == "REM-DEL-ROBO" || $Request_Type == "REM-ROBO" 
							|| $Request_Type == "REM-ROBO-FWD") {
							$Request_Type = "REM-DEL-ROBO";
					}
					$phno = $row2[0];
					// Requesting Call ID = 500 means it was Answer call
					$query3 = "INSERT INTO  `pollywa`.`request table` (`Request_ID`, `Recording_ID`, `Effect_Chosen`, `Requesting_Call_ID`, `Request_Type`, `From`, `To_Whom`, `Originating_Call_Time`, `Request_Status`, `Number_of_Attempts`, `Time_of_Last_Attempt`, `SysLanguage`, `MsgLanguage`, `TestCall`, `Channel`, `Time_Req_Relayed_To_Polly`, `FollowupReqID`)
					 VALUES ('0',  '$question_id', '$answer_id', '$call_id', '$Request_Type', '$phno', '$phno', NOW(), 'Pending', '0', '0', 'Urdu', '$type', 'False', 'Wateen1', NOW(), '500');";
					 // echo "$query3";
					if ($resulte = $conn->query($query3)) {
						echo json_encode(array('error' => false, 'message' => "Done"));
					} else {
						echo json_encode(array('error' => true, 'message' => "Query Error", 'sql' => $query3));
					}

				} else {
			echo json_encode(array('error' => false, 'count' => 0, 'message' => "Unable to fetch data.", 'sql' => $sql2));
				}
			} else {
				echo json_encode(array('error' => true, 'message' => "Query Error", 'sql' => $sql2));
			}
		}else{
			echo json_encode(array('error' => false, 'count' => 0, 'message' => "Unable to fetch data.", 'sql' => $sql));
		}
	} else 
		echo json_encode(array('error' => true, 'message' => "Query Error", 'sql' => $sql));