<?php
		
		function handleURL($url) {
			global $db;

			$content = '<section class="title"><h1>' . $url . '</h1>';

			/* ***************************************
			 * Clean up spaces and capital letters
			 * for easier switch cases.
			 * **************************************/
			$url_clean = preg_replace('/\s*/', '', strtolower($url));

			/* ***************************************
			 * Determine content based on request
			 * **************************************/
			switch($url_clean) {
		        case 'aboutme':
		        	// Retrieve from database (aboutID, email, phone, resumeURL, brief)
		        	$about_me = $db->query("SELECT * FROM about LIMIT 1;", PDO::FETCH_CLASS);
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
		        default: 
		            echo "test";
		      }

		      return $content;

		};

?>