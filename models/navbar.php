<?php
	
	function buildNav() {
		global $db;
		// Get the navItems from the database (name, href)
		$navItems = $db->query("SELECT * FROM nav;");

		// Build the navigation menu list
		if(is_array($navItems)) {
			$navigation = '<ul class="pure-menu-list">';
			foreach ($navItems as $item) {
				$navigation .= '<li class="pure-menu-item"><a href="?action=q&url=' . $item->href . '" class="pure-menu-link">' . $item->name . '</a></li>';
			}
			$navigation .= '</ul>';
		} else {
			$navigation = 'Sorry, a critical error occurred.';
		}

		return $navigation;
	}

?>
