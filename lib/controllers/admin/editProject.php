<?php
	
	require '../utility.php';
	require '../../models/db.php';

	// Return project details
	if ($_SERVER['REQUEST_METHOD'] === 'POST') {

		global $db;

		$projectName = clean_input($_POST['projectName']);
		$githubURL = clean_input($_POST['githubURL']);
		$category = clean_input($_POST['category']);
		$brief = clean_input($_POST['brief']);
		$description = clean_input($_POST['description']);

		if(empty($projectName) || empty($category) || empty($githubURL) || empty($brief) || empty($description)) {
			sendResponse(400, 'The request cannot be fulfilled due to bad syntax.');

		} else {
			$db->editProject($db->getProject($projectName)->projectID, $category, $githubURL, $brief, $description);
			$response = 'Updated Project ' . $projectName.'.';
			sendResponse(200, $response);

		};

	};

?>