<?php
		
		function handleURL($url) {
			global $db;
			global $_SESSION;

			$content = '<section class="title animated fadeIn">';

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
		        	$content .= '<div class="aboutMe animated fadeIn"><a href="?action=q&amp;url=coder"><img class="coder" src="/img/coder.png" alt="coder"></a>';
		        	$content .= '<a href="?action=q&amp;url=musician"><img class="musician" src="/img/musician.png" alt="musiciain"></a></div></section>';
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
		        	$content .= '<div class="pure-u-1-4"><img class="playingSaxophone" src="/img/'.$about_me->musicPic.'" alt="playingSaxophone"></div>';
		        	$content .= '<div class="pure-u-3-4">'.$about_me->musicianBrief.'</div>';
		        	$content .= '<p><iframe width="100%" height="166" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/198056205%3Fsecret_token%3Ds-uvYdv&amp;color=ff5500&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false"></iframe></p>';

		        	break;
		        
		        /* ***************************************
				 * Serve up Contact content
				 * **************************************/
		        case 'contact':
		        		$content .= '<h1>Contact</h1>';
		        		// Retrieve from database (aboutID, email, phone, resumeURL, coderBrief, musicianBrief)
			        	$about_me = $db->getAboutMe();

			        	// Generate content
			        	$content .= '<form id="contact" name="contact" onsubmit="sendMail();" action="htmlspecialchars($_SERVER["PHP_SELF"]);" method="post" class="pure-form pure-form-aligned">
									   <fieldset>
									      <div class="pure-control-group">
									         <label>Name:</label>
									         <input type="text" name="name" placeholder="Name" required>
									      </div>
									      <div class="pure-control-group">
									         <label>Email</label>
									         <input type="email" name="email" placeholder="Email" required>
									      </div>
									      <div class="pure-control-group">
									         <label>Message:</label>
									         <textarea name="message" placeholder="Your message here..." rows="4" required></textarea>
									      </div>
									      <div class="pure-controls">
									         <input type="submit" class="pure-button pure-button-primary" name="submit" value="Submit" />
									         <input type="reset" class="pure-button" name="reset" value="Reset" /> 
									      </div>
									   </fieldset>
									</form>';

		        		// $phone_clean = preg_replace("/[^0-9]/", "", $phone);
		        		// $content .= '<div class="pure-u-1-2"><p><b>Tyler Harris</b>
		          //   	<div>Mobile: <a href="tel:+1'.$phone_clean.'" value="+1'.$phone_clean.'" target="_blank">'. $about_me->phone .'</a></div>
		          //   	<div><a href="mailto:'.$about_me->email.'" target="_blank">'.$about_me->email.'</a></div>
		          //   	<div><br>
		          //   	<a href="'.$about_me->facebookURL.'" target="_blank"><img src="img/facebook-32.png" alt="fb"></a>&nbsp;&nbsp;
		          //   	<a href="'.$about_me->twitterURL.'" target="_blank"><img src="img/twitter-32.png" alt="tw"></a>&nbsp;&nbsp;
		          //   	<a href="'.$about_me->linkedinURL.'" target="_blank"><img src="img/linkedin-32.png" alt="li"></a>&nbsp;&nbsp;
		          //   	<a href="'.$about_me->githubURL.'" target="_blank"><img src="img/github-32.png" alt="gh"></a><br>
		          //   	</div></p></div>';

		            	$content .= '</section>';
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
		       							'<img src="img/projects/'.$item->url.'" alt="'.$item->projectName.'">'.
		       							'<h3>'.$item->projectName.'</h3>'.
		       							'<p>'.$item->brief.'</p>'.
		       							'</a></div>';
		       			};

		       			$content .= '<div class="gap"></div><div class="gap"></div></div>';
		       			
		       			break;

		       	case 'login':
		       		if ($_SESSION['loggedIn'] == 'yes') {
		       			header("Location: /?action=a&url=admin");
		       			exit();

		       		} else {
		       			$content .= '<h1>Administration</h1>
		       				<form class="pure-form pure-form-stacked" onsubmit="return login();" action="controllers/login.php" method="post" >
							    <fieldset>
							        <h2>Login</h2>

							        <label for="user">User</label>
							        <input id="user" name="user" type="text" placeholder="User" required>

							        <label for="password">Password</label>
							        <input id="password" name="password" type="password" placeholder="Password" required>

							        <label for="remember" class="pure-checkbox">
							            <input id="remember" type="checkbox"> Remember me
							        </label>

							        <button type="submit" class="pure-button pure-button-primary">Sign in</button>
							    </fieldset>
							</form>';

		       		};

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