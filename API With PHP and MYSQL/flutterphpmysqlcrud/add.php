<?php 

	require('database.php');

	$firstname = $_POST['firstname'];
	$lastname = $_POST['lastname'];
	$phone = $_POST['phone'];
	$email = $_POST['email'];

	$insert = $conn->query("INSERT INTO person(firstname,lastname,phone,email)VALUES('$firstname','$lastname','$phone','$email')");
	if ($insert){
		echo 'Success';
	}
	$conn->close();
	return;

?>










































	// include 'database.php';

	// $fistname = $_POST['fistname'];
	// $lastname = $_POST['lastname'];
	// $phone = $_POST['phone'];
	// $address = $_POST['address'];

	// $link->query("INSERT INTO person(fistname,lastname,phone,address)VALUES('".$fistname."','".$lastname."','".$phone."','".$address."')");

