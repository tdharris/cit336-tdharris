<?php
	
/* ***************************************
* 	Admin Behavior
* **************************************/
	require '../utility.php';
	require '../../models/db.php';

	if ($_SERVER["REQUEST_METHOD"] == "POST") {

		global $db;

		// Get projectName
		$projectName = clean_input($_POST['projectName']);
		$githubURL = clean_input($_POST['githubURL']);
		$category = clean_input($_POST['category']);
		$brief = clean_input($_POST['brief']);
		$description = clean_input($_POST['description']);
		// $name = clean_input($_POST['images?']);

		if(empty($projectName) || empty($githubURL) || empty($category) || empty($brief) || empty($description)) {
			sendResponse(400, 'The request cannot be fulfilled due to incomplete data or bad syntax.');

		} else {
			try {
				$db->addProject($projectName, 'bash', $githubURL, $brief, $description, ['qninja-logo.png', 'qninja-2.png']);
			} catch(PDOException $e) {
				sendResponse(400, 'Internal Server Error!');
			}
			
			// $db->addProject('test', 'bash', 'http://test', 'this is only a test of addProject()', 'long description here....', ['qninja-logo.png', 'qninja.png', 'qninja-2.png']);
			$response = 'Added Project ' . $projectName.'.';
			sendResponse(200, $response);

		}
		
	};
?>