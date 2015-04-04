<!-- Yahoo will deliver each of the small css files in a single request by using the & symbol like below -->
<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/combo?pure/0.6.0/base-min.css&amp;pure/0.6.0/pure-min.css&amp;pure/0.6.0/grids-responsive-min.css">
  
<link rel="stylesheet" type="text/css" href="public/lib/animate/animate.css">
<link rel="stylesheet" type="text/css" href="public/css/aside.css"/>
<link rel="stylesheet" type="text/css" href="public/css/home.css"/>

<?php if ($_SERVER[REQUEST_URI] == '/') {?>
  <link rel="stylesheet" type="text/css" href="public/css/big.css"/> 
<?php };?>

<?php if (strpos($_SERVER[REQUEST_URI], '/?action=q&project=') !== false || $_SERVER[REQUEST_URI] == '/?action=q&url=portfolio') {?>
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/jquery.slick/1.4.1/slick.css"/>
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/jquery.slick/1.4.1/slick-theme.css"/>
<?php };?>

<?php if ($_SERVER[REQUEST_URI] == '/?action=q&url=contact' || $_SERVER[REQUEST_URI] == '/?action=a&url=admin') {?>
	<link rel="stylesheet" type="text/css" href="public/lib/toastr/toastr.min.css"/>
<?php };?>

<?php if ($_SERVER[REQUEST_URI] == '/?action=a&url=admin') {?>
	<link rel="stylesheet" type="text/css" href="public/lib/dropzone/dropzone.css"/>
<?php };?>

<!-- Custom Fonts -->
<link href="public/css/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href='http://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>