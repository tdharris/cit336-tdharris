<?php

/* ***************************************
 * Utility Functions for sendMail POST
 * **************************************/
	include 'controllers/utility.php';

	function validate(&$name, &$email_from, &$message) {
		// Pass variables by reference
		global $error_code;
		global $error_msg;

		$error_code = null;
		$error_msg = null;

		// Remove all illegal characters from email_from
		$email_from = filter_var($email_from, FILTER_SANITIZE_EMAIL);

		if(!onlyLettersAndSpace($name)) {
			$error_code = 400;
			$error_msg = 'Name can only have letters and spaces.';
		} else if(empty($name) || empty($message) || !filter_var($email_from, FILTER_VALIDATE_EMAIL)) {
			// Check that data was sent to the mailer.
			$error_code = 400;
			$error_msg = 'The request cannot be fulfilled due to bad syntax.';
		};

		if ($error_code != null || $error_msg != null) {
			return false;
		} else return true;

	};

	function onlyLettersAndSpace($str) {
		if (preg_match("/^[a-zA-Z ]*$/",$str)) {
			return true;
	    } else {
	    	return false;
	    }
	};

/* ***************************************
 * Process sendMail.php POST
 * **************************************/

	// Only process POST reqeusts.
	if ($_SERVER["REQUEST_METHOD"] == "POST") {

		// Get all the information from the fields sent over by the form.
		$name = clean_input($_POST['name']);
		$email_from = clean_input($_POST['email']);
		$message = clean_input($_POST['message']);
		 
		$to = 'tylerdavidharris@gmail.com';
		$subject = 'New Message (tdharris.net)';

		$error_code = null;
		$error_msg = null;
		
		if (!validate($name, $email_from, $message)) {
			sendResponse($error_code, $error_msg);

		} else{
			// create email headers
			$headers = 'MIME-Version: 1.0' . "\r\n";
			$headers .= 'Content-type:text/html;charset=UTF-8' . "\r\n";
			$headers .= 'From: '.$email_from."\r\n" .
						'Reply-To: '.$email_from."\r\n" .
						'X-Mailer: PHP/' . phpversion();

			mail($to, $subject, $message, $headers);

			sendResponse(200, 'Your email has been sent!');
			
		}
	};

?>