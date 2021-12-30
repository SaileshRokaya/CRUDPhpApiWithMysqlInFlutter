<?php 

	require('database.php');

	$id = $_POST['id'];

	$delete = $conn->query("DELETE FROM person WHERE id = '$id' ");

	if ($delete){
		echo "Sucess";
	}
	$conn->close();
	return;

?>