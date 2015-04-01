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
		$fileIDs = $_POST['fileIDs'];
		// $name = clean_input($_POST['images?']);

		if(empty($projectName) || empty($githubURL) || empty($category) || empty($brief) || empty($description) || empty($fileIDs)) {
			sendResponse(400, [$projectName, $githubURL, $category, $brief, $description, $fileIDs]);

		} else {
			try {
				$db->addProject($projectName, $category, $githubURL, $brief, $description, $fileIDs);
			} catch(PDOException $e) {
				sendResponse(400, 'Internal Server Error!');
			}
			
			// $db->addProject('test', 'bash', 'http://test', 'this is only a test of addProject()', 'long description here....', ['qninja-logo.png', 'qninja.png', 'qninja-2.png']);
			$response = 'Added Project ' . $projectName.'.';
			sendResponse(200, $response);

		};
		
	};
?>