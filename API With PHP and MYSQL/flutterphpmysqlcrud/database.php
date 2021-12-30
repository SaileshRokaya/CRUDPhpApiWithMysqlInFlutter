<?php 

	$hostname = 'localhost';
	$username = 'root';
	$pass = '';
	$dbname = 'php_mysql_crud';

	// Create Connection
	$conn = new mysqli($hostname,$username,$pass,$dbname);

	// Check Connection
	if ($conn->connect_errno) {
		die("Connection Failed: " . $conn->connect_error);
		return;
	}

?>