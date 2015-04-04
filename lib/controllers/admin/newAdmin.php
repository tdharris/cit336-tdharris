<?php

include '../utility.php';

	if ($_SERVER["REQUEST_METHOD"] == "POST") {

		$userID = clean_input($_POST['user']);
		$pass = clean_input($_POST['password']);

		if(empty($userID) || empty($pass)) {
			sendResponse(400, 'Invalid Syntax.');
		} else {
				
			// A higher "cost" is more secure but consumes more processing power
			$cost = 10;

			// Create a random salt
			$salt = strtr(base64_encode(mcrypt_create_iv(16, MCRYPT_DEV_URANDOM)), '+', '.');

			// Prefix information about the hash so PHP knows how to verify it later.
			// "$2a$" Means we're using the Blowfish algorithm. The following two digits are the cost parameter.
			$salt = sprintf("$2a$%02d$", $cost) . $salt;


			// Hash the password with the salt
			$hash = crypt($password, $salt);

			$db->query("INSERT INTO admins (userID, hash) VALUES (:userID, :hash);", array("userID"=>$username, "hash"=>$hash));

			sendResponse(200, 'Admin added.');

		};

	};

?>