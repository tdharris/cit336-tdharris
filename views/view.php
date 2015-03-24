<?php

	if (!$_SESSION) {
	  session_start();
	}
	$navbar = $_SESSION['navbar'];

?>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="A layout example that shows off a blog page with a list of posts.">

  <title>tdharris</title>
  <?php include 'snippets/styles.php';?>

</head>
<body>

	<div id="layout" class="pure-g">
		<!-- ASIDE NAVBAR -->
	    <div class="sidebar pure-u-1 pure-u-md-1-4">
	      <div class="header">
	        <h1 class="brand-title">tdharris</h1>
	        <h2 class="brand-tagline"></h2>
	        <br>

	        <ul class="list-inline social">
	          <li><a target="_blank" href="https://www.facebook.com/tylerdavidharris" class="btn-social btn-outline facebook"><i class="fa fa-fw fa-facebook"></i></a></li>
	          <li><a target="_blank" href="https://google.com/+TylerHarristdh" class="btn-social btn-outline google-plus"><i class="fa fa-fw fa-google-plus"></i></a></li>
	          <li><a target="_blank" href="https://twitter.com/tdharris" class="btn-social btn-outline twitter"><i class="fa fa-fw fa-twitter"></i></a></li>
	          <li><a target="_blank" href="https://www.linkedin.com/in/tylerdavidharris" class="btn-social btn-outline linkedin"><i class="fa fa-fw fa-linkedin"></i></a></li>
	        </ul>

	        <div class="pure-menu">     

	                <?php
	                  echo $navbar;
	                ?>
	                
	        </div>

	      </div>
	    </div>
 
    <div class="content pure-u-1 pure-u-md-3-4">
      <section class="title">
          <h1>About Me</h1>
          <p></p>
      </section>
    </div>

  </div>

  <?php include 'snippets/scripts.php';?>

</body>
</html>