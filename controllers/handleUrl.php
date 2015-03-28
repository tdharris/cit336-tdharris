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
		        	$content .= '<div class="aboutMe animated fadeIn"><a href="?action=q&amp;url=coder"><img class="coder" src="/img/coder.png"></a>';
		        	$content .= '<a href="?action=q&amp;url=musician"><img class="musician" src="/img/musician.png"></a></div></section>';
		            break;
		        case 'coder':
		        	$content .= '<h1>&lt;coder&gt;</h1>';
		       		// Retrieve from database (aboutID, email, phone, resumeURL, coderBrief, musicianBrief)
		        	$about_me = $db->getAboutMe();

		        	// Generate content
		            $content .= '<p>' . $about_me->coderBrief . '</p>';
		            $content .= '<p>Skillset: ' . $about_me->skillset . '</p>';
		        	break;

		        case 'musician':
		        	$content .= '<h1>Musician</h1>';
		        	// Retrieve from database (aboutID, email, phone, resumeURL, coderBrief, musicianBrief, musicPic)
		        	$about_me = $db->getAboutMe();

		        	// Generate content
		        	$content .= '<div class="pure-u-1-4"><img class="playingSaxophone" src="/img/'.$about_me->musicPic.'"></div>';
		        	$content .= '<div class="pure-u-3-4">'.$about_me->musicianBrief.'</div>';

		        	break;
		        
		        /* ***************************************
				 * Serve up Contact content
				 * **************************************/
		        case 'contact':
		        		$content .= '<h1>Contact</h1>';
		        		// Retrieve from database (aboutID, email, phone, resumeURL, coderBrief, musicianBrief)
			        	$about_me = $db->getAboutMe();

			        	// Generate content
		        		$phone_clean = preg_replace("/[^0-9]/", "", $phone);
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
				 * Serve up Portfolio content
				 * **************************************/
		       	case 'portfolio':
		       			$content .= '<h1>Portfolio</h1>
									<div class="controls">
										<label>Filter:</label>
										<button class="filter pure-button" data-filter="all">All</button>
										<button class="filter pure-button" data-filter=".webDev">WebDev</button>
										<button class="filter pure-button" data-filter=".bash">Bash</button>
										<button class="filter pure-button" data-filter=".java">Java</button>
									</div>

									<div id="Portfolio" class="portfolio">';

									// <label>Sort:</label>
									// <button class="sort pure-button" data-sort="myorder:asc">Asc</button>
									// <button class="sort pure-button" data-sort="myorder:desc">Desc</button>

		       			// Retrieve content from database (sortOrder, projectName, brief, description, githubURL)
		       			$portfolio = $db->getPortfolio();

		       			// Generate content
		       			// print_r($portfolio);
		       			foreach ($portfolio as $item) {
		       				$content .= '<div class="mix '.$item->category.'" data-myorder="'.$item->sortOrder.'">'.
		       							'<a href="?action=q&amp;project='.$item->projectName.'">'.
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