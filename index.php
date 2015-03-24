
<?php 

/* ***************************************
 * Create or access the session
 * **************************************/
  // TODO: session_start(): Cannot send session cache limiter - headers already sent...
  // if(!isset($_SESSION)){
  //   session_start();
  // }

/* ***************************************
 * Bring the model into scope
 * **************************************/
  require('models/db.php');

/* ***************************************
 * Build the navigation menu
 * **************************************/
  $navbar = buildNav();
  $_SESSION['navbar'] = $navbar;

/* ***************************************
 * Capture the value of 'action' from get or post
 * **************************************/
  $action = ''; 
  if (isset($_POST['action'])) {
    $action = $_POST['action'];
  } elseif (isset($_GET['action'])) {
    $action = $_GET['action'];
  }

/* ***************************************
 * Determine type of request (url or project)
 * **************************************/
  if ($action == 'q') {
    if(isset($_GET['url'])) {
      $url = $_GET['url'];
      $content = handleURL($url);
    } elseif (isset($_GET['project'])) {
      $project = $_GET['project'];
      $content = getProject($project);
    }
  };

  include 'views/view.php';

?>