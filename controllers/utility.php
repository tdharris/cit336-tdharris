<?php

	function sendResponse($code, $msg) {
        http_response_code($code);
        header('Content-Type: application/json; charset=UTF-8');
        echo json_encode($msg);
	};	

	function clean_input($data) {
		// Strip unnecessary characters (extra space, tab, newline)
	  	$data = trim($data);

	  	// Remove backslashes (\) from the user input data
		$data = stripslashes($data);

		// HTML escaped code (safe code to be displayed)
		$data = htmlspecialchars($data);

		return $data;
	};

?>