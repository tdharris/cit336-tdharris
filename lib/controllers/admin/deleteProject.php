<?php
	
/* ***************************************
* 	Admin Behavior
* **************************************/
	require '../utility.php';
	require '../../models/db.php';

	if ($_SERVER["REQUEST_METHOD"] == "POST") {

		global $db;
		$notAllowedToDelete = array('qNinja', 'qNotify', 'qDash', 'myNovellApp', 'elephant', 'tdharris.net', 'tmessenger', 'dsapp.sh', 'nts-directoryMigration.sh', 'certs.sh', 'nftp.sh', 'checkServices.sh');

		// Get projectName
		$name = clean_input($_POST['projectName']);

		if(in_array($name, $notAllowedToDelete)) {
			sendResponse(403, 'Permanent projects can\'t be deleted.');

		} else if(empty($name)) {
			sendResponse(400, 'The request cannot be fulfilled due to bad syntax.');

		} else {
			$db->deleteProject($db->getProject($name)->projectID);
			$response = 'Deleted Project ' . $name.'.';
			sendResponse(200, $response);

		}
		
	};
?>