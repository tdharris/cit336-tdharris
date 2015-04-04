<?php

// this just makes more sense...
function reArrayFiles(&$file_post) {

    $file_ary = array();
    $file_count = count($file_post['name']);
    $file_keys = array_keys($file_post);

    for ($i=0; $i<$file_count; $i++) {
        foreach ($file_keys as $key) {
            $file_ary[$i][$key] = $file_post[$key][$i];
        }
    }

    return $file_ary;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

	require_once 'config.php';
	include 'controllers/utility.php';

	$ds          = DIRECTORY_SEPARATOR;
	$storeFolder = "../".$config['projectHome'];
	 
	if (empty($_FILES)) {
		sendResponse(500, 'Upload directory is not writable, or does not exist.');
	} else {

		$file_ary = reArrayFiles($_FILES['file']);;

		// Check the upload directory
	    if (is_dir($storeFolder) && is_writable($storeFolder)) {
	    	$targetPath = dirname( __FILE__ ).$ds.$storeFolder.$ds; 	
	 		$error = null;
	 		$resFilenames = array();

	 		// Create FileID for the Store, move file into place, respond with an array of assigned fileIDs
	 		foreach ($file_ary as $file) {
				// $file['name']
				// $file['type']
				// $file['tmp_name']
				// $file['error']
				// $file['size']

				// TODO: error checking per file...

		    	// Get file extension from original filename, also make lowercase
		    	$ext = strtolower(pathinfo($file['name'], PATHINFO_EXTENSION));
		    	// uniqid will only be unique across one machine (ie it can generate the same thing if you run it at the very same time on two different machines)
		    	$fileID = md5(uniqid()).'.'.$ext;
		    	$targetFile = $targetPath.$fileID;

		    	if(move_uploaded_file($file['tmp_name'], $targetFile)) {
		    		array_push($resFilenames, $fileID);
			    } else {
			    	$error = 'Failed to upload.';
			    };

		    };

		    if($error === null) {
		    	sendResponse(200, $resFilenames);
		    } else {
		    	sendResponse(500, $error);
		    };
		    
	 	};

	};
};
	    
   //  // Handle file-upload errors
   //  $message = 'Error uploading file';
   //  switch($error) {
   //      case UPLOAD_ERR_OK:
   //          $message = false;;
   //          break;
   //      case UPLOAD_ERR_INI_SIZE:
   //      case UPLOAD_ERR_FORM_SIZE:
   //          $message .= ' - file too large (limit of '.get_max_upload().' bytes).';
   //          break;
   //      case UPLOAD_ERR_PARTIAL:
   //          $message .= ' - file upload was not completed.';
   //          break;
   //      case UPLOAD_ERR_NO_FILE:
   //          $message .= ' - zero-length file uploaded.';
   //          break;
   //      default:
   //          $message .= ' - internal error ';
   //          foreach($_FILES['file']['error'] as $error) {
   //          	$message .= '- #'.$error;
   //          };
   //          break;
   //  };

?>