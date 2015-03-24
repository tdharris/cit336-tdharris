
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

  include 'views/view.php';

?>