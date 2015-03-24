
<?php 

include 'models/db.php';

$db = new Database;

// Build content
$navbar = buildNav();

include 'views/view.php';

?>