<?php

if(!isset($_SESSION)){
  session_start();
};

/* ***************************************
 * Authenticate Admin Access
 * **************************************/
include '../models/db.php';
include 'utility.php';

	if ($_SERVER["REQUEST_METHOD"] == "POST") {
		// Get inputs
		$userID = clean_input($_POST['user']);
		$pass = clean_input($_POST['password']);

		$user = $db->query('SELECT * FROM admins WHERE userID = :userID LIMIT 1', array("userID"=>$userID), PDO::FETCH_OBJ)[0];

		// Hashing the password with its hash as the salt returns the same hash
		if ($user->hash === crypt($pass, $user->hash) ) {
		  	$_SESSION['user'] = $user;
			$_SESSION['loggedIn'] = 'yes';
			header("Location: /?action=a&url=admin");
			exit();
		} else {
			// Problem with access attempt or blank user/pass
			$error_message = 'Invalid username or password.';
			include '../error.php';
		};

	} 

?>
