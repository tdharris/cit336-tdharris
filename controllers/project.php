<?php

	function getProject($pj) {
		global $db;
		$content = '<section class="title">';

		// projects: projectID, sortOrder, projectName, category, brief, description, githubURL
		// images: imageID, projectID, aboutID, url, featured
		$project = $db->getProject($pj);
		$images = $db->getUnfeaturedImages($project->projectID);

		$content .= '<h1>'.$project->projectName.'</h1>';
		$content .= '<div class=\'slicky\'>';
		foreach($images as $image) {
			$content .= '<div><a href="img/projects/'.$image['url'].'"><img src="img/projects/'.$image['url'].'" alt="'.$image['url'].'"></a></div>';
		};
		$content .= '</div><a href="'.$project->githubURL.'"  target="_blank">'.$project->githubURL.'</a>';
		$content .= '<p>'.$project->description.'</p><br>';
		$content .= '</section>';

		return $content;

	};

?>