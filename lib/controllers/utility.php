<?php

	function sendResponse($code, $msg) {
        http_response_code($code);
        header('Content-Type: application/json; charset=UTF-8');
        echo json_encode($msg);
	};	

	function clean_input($data) {
		// Strip replace all multiple white-spaces, tabs and new-lines
	  	$data = preg_replace('/\s+/S', " ", $data);

	  	// Remove backslashes (\) from the user input data
		$data = stripslashes($data);

		// HTML escaped code (safe code to be displayed)
		$data = htmlspecialchars($data);

		return $data;
	};

?>