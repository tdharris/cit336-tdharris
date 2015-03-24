<?php
	
	function buildNav() {
		global $db;
		// Get the navItems from the database
		$navItems = $db->query("SELECT name FROM nav;", PDO::FETCH_COLUMN);

		// Build the navigation menu list
		if(is_array($navItems)) {
			$navigation = '<ul class="pure-menu-list">';
			foreach ($navItems as $item) {
				$navigation .= '<li class="pure-menu-item"><a href="#" class="pure-menu-link">' . $item . '</a></li>';
			}
			$navigation .= '</ul>';
		} else {
			$navigation = 'Sorry, a critical error occurred.';
		}

		return $navigation;
	}

?>
