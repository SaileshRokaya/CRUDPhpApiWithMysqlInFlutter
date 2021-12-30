<?php 

	require('database.php');

	$id = $_POST['id'];
	$firstname = $_POST['firstname'];
	$lastname = $_POST['lastname'];
	$phone = $_POST['phone'];
	$email = $_POST['email'];

	$update = $conn->query("UPDATE person SET firstname = '$firstname', lastname = '$lastname', phone='$phone', email='$email' WHERE id = '$id'");

	if ($update){
		echo "Success";
	}
	$conn->close();
	return;

?>