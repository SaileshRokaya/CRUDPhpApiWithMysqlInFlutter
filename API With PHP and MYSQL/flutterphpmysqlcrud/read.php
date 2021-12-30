<?php 

	
	require('database.php');

	$result = $conn->query("SELECT * FROM person ORDER BY firstname");
	$data = array();
	while ( $row = $result->fetch_assoc()){
		$data[] = $row;
	}
	echo json_encode($data);
	$conn->close();
	return;

