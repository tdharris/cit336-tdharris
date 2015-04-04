<?php
	
	require '../utility.php';
	require '../../models/db.php';

	// Return project details
	if ($_SERVER['REQUEST_METHOD'] === 'POST') {
		$projectName = clean_input($_POST['projectName']);

		if(empty($projectName)) {
			sendResponse(400, 'Problem retrieving project.');
		} else {
			$project = $db->getProject($projectName);
			sendResponse(200, $project);

		};	

	};

?>