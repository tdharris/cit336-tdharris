<?php

	function getProject($pj) {
		global $db;
		$content = '<section class="title">';

		// projects: projectID, sortOrder, projectName, category, brief, description, githubURL
		// images: imageID, projectID, aboutID, url, featured
		$project = $db->query('SELECT * FROM projects WHERE projectName=\''.$pj.'\';')[0];
		$images = $db->query('SELECT i.url FROM images i
								RIGHT OUTER JOIN projects p ON i.projectID = p.projectID
								WHERE i.projectID = '.$project->projectID.
								' AND i.featured IS NULL', PDO::FETCH_ASSOC);

		$content .= '<h1>'.$project->projectName.'</h1>';
		$content .= '<a href="'.$project->githubURL.'"  target="_blank">'.$project->githubURL.'</a>';
		$content .= '<p>'.$project->description.'</p><br>';

		$content .= '<div class=\'slicky\'>';
		foreach($images as $image) {
			$content .= '<div><a href="img/projects/'.$image['url'].'"><img src="img/projects/'.$image['url'].'"></a></div>';
		};
		$content .= '</div></section>';

		return $content;


	};

?>