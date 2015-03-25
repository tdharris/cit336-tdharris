<?php
		
		function handleURL($url) {
			global $db;

			$content = '<section class="title">';

			/* ***************************************
			 * Clean up spaces and capital letters
			 * for easier switch cases.
			 * **************************************/
			$url_clean = preg_replace('/\s*/', '', strtolower($url));

			/* ***************************************
			 * Determine content based on request
			 * **************************************/
			switch($url_clean) {
				/* ***************************************
				 * Serve up AboutMe content
				 * **************************************/
		        case 'aboutme':
		        	$content .= '<h1>About Me</h1>';

		        	// Retrieve from database (aboutID, email, phone, resumeURL, brief)
		        	$about_me = $db->query("SELECT * FROM about LIMIT 1;");
		        	$about_me = $about_me[0];

		        	// Generate content
		        	$phone_clean = preg_replace("/[^0-9]/", "", $phone);
		            $content .= '<p>' . $about_me->brief . '</p>';
		            $content .= '<br><p>Skillset: ' . $about_me->skillset . '</p>';
		            $content .= '<br><p><b>Tyler Harris</b>
		            	<div>Mobile: <a href="tel:+1'.$phone_clean.'" value="+1'.$phone_clean.'" target="_blank">'. $about_me->phone .'</a></div>
		            	<div><a href="mailto:'.$about_me->email.'" target="_blank">'.$about_me->email.'</a></div>
		            	<div><br>
		            	<a href="'.$about_me->facebookURL.'" target="_blank"><img src="img/facebook-32.png"></a>&nbsp;&nbsp;
		            	<a href="'.$about_me->twitterURL.'" target="_blank"><img src="img/twitter-32.png"></a>&nbsp;&nbsp;
		            	<a href="'.$about_me->linkedinURL.'" target="_blank"><img src="img/linkedin-32.png"></a>&nbsp;&nbsp;
		            	<a href="'.$about_me->githubURL.'" target="_blank"><img src="img/github-32.png"></a><br>
		            	</div></p></section>';
		            break;
		        
		        /* ***************************************
				 * Serve up Contact content
				 * **************************************/
		        case 'contact':
		        		$content .= '<h1>Contact</h1>';

		        		$content .= "<p>So you wnna contact me?</p>";
		        		break;

		       	/* ***************************************
				 * Serve up Portfolio content
				 * **************************************/
		       	case 'portfolio':
		       			$content .= '<h1>Portfolio</h1>
									<div class="controls">
										<label>Filter:</label>
										<button class="filter pure-button" data-filter="all">All</button>
										<button class="filter pure-button" data-filter=".webDev">WebDev</button>
										<button class="filter pure-button" data-filter=".bash">Bash</button>
									</div>

									<div id="Portfolio" class="portfolio">';

									// <label>Sort:</label>
									// <button class="sort pure-button" data-sort="myorder:asc">Asc</button>
									// <button class="sort pure-button" data-sort="myorder:desc">Desc</button>

		       			// Retrieve content from database (sortOrder, projectName, brief, description, githubURL)
		       			$portfolio = $db->query("SELECT * from projects p 
		       									LEFT JOIN images i ON p.projectID= i.projectID 
		       									WHERE i.featured IS NOT NULL
		       									ORDER BY p.sortOrder;");

		       			// Generate content
		       			// print_r($portfolio);
		       			foreach ($portfolio as $item) {
		       				$content .= '<div class="mix '.$item->category.'" data-myorder="'.$item->sortOrder.'">'.
		       							'<a href="?action=q&project='.$item->projectName.'">'.
		       							'<img src="img/projects/'.$item->url.'">'.
		       							'<h3>'.$item->projectName.'</h3>'.
		       							'<p>'.$item->brief.'</p>'.
		       							'</a></div>';
		       			};

		       			$content .= '<div class="gap"></div><div class="gap"></div></div>';
		       			
		       			break;

		       	/* ***************************************
				 * 404 - Page Not Found
				 * **************************************/
		        default: 
		            echo "test";
		      }

		      return $content;

		};

?>