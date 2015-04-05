-- Database "tdharris_showcase" must already exist.
use tdharris_showcase;

-- Drops existing tables prior to creating or recreating the tables
DROP TABLE IF EXISTS nav, about, projects, images, admins;

-- create the tables for the database 
CREATE TABLE nav (
	navID		INT				NOT NULL	AUTO_INCREMENT,
	name      	VARCHAR(255)	NOT NULL,
	href		VARCHAR(255)				DEFAULT NULL,
	PRIMARY KEY (navID),
	UNIQUE INDEX name (name)
);

CREATE TABLE about (
	aboutID				INT				NOT NULL	AUTO_INCREMENT,
	resumeURL			VARCHAR(255)	NOT NULL,
	email				VARCHAR(255)	NOT NULL,
	phone				VARCHAR(255)	NOT NULL,
	coderBrief  		LONGTEXT		NOT NULL,
	musicianBrief  		LONGTEXT		NOT NULL,
	musicPic			VARCHAR(255)				DEFAULT NULL,
	skillset 			VARCHAR(255)	NOT NULL,
	facebookURL			VARCHAR(255)				DEFAULT NULL,
	twitterURL 			VARCHAR(255)				DEFAULT NULL,
	linkedinURL 		VARCHAR(255)				DEFAULT NULL,
	githubURL 			VARCHAR(255)				DEFAULT NULL,
	PRIMARY KEY (aboutID)
);

CREATE TABLE projects (
	projectID	INT				NOT NULL	AUTO_INCREMENT,
	sortOrder	INT							DEFAULT NULL,
	projectName VARCHAR(255)	NOT NULL,
	category	VARCHAR(25)		NOT NULL,
	brief		VARCHAR(255)	NOT NULL,
	description	LONGTEXT					DEFAULT NULL,
	githubURL	VARCHAR(255)				DEFAULT NULL,
	PRIMARY KEY (projectID),
	UNIQUE INDEX projectName (projectName)
);

-- Note: image is featured if set to '' rather than the default NULL
CREATE TABLE images (
	imageID		INT 			NOT NULL 	AUTO_INCREMENT,
	projectID	INT 						DEFAULT NULL,
	aboutID		INT 						DEFAULT NULL,
	url			VARCHAR(255)	NOT NULL,
	featured 	VARCHAR(0)					DEFAULT NULL,
	PRIMARY KEY (imageID),
	FOREIGN KEY (projectID)
		REFERENCES projects(projectID)
		ON DELETE CASCADE,
	FOREIGN KEY (aboutID)
		REFERENCES about(aboutID)
		ON DELETE CASCADE
);

-- Admins
CREATE TABLE admins (
	adminID			INT				NOT NULL	AUTO_INCREMENT,
	userID      	VARCHAR(255)	NOT NULL,
	hash			VARCHAR(255)				DEFAULT NULL,
	PRIMARY KEY (adminID),
	UNIQUE INDEX name (userID)
);

-- Insert data into the tables
INSERT INTO nav (navID, name, href) VALUES
(1, 'About Me', 'aboutme'),
(2, 'Portfolio', 'portfolio'),
(3, 'Contact', 'contact'),
(4, 'Admin', 'login');

INSERT INTO admins (adminID, userID, hash) VALUES
(1, 'admin', '$2a$10$Vb1PSvUT7OAhMle.gf6xv.bQvhkmBm48EVg21UdXktyDbBtwpRvpq');

INSERT INTO about (aboutID, email, phone, resumeURL, facebookURL, twitterURL, linkedinURL, githubURL, skillset, coderBrief, musicianBrief, musicPic) VALUES
(1, 'tylerdavidharris@gmail.com', '(530) 200-1919', 'http://goo.gl/89Luq2', 
	'https://www.facebook.com/tylerdavidharris',
	'https://twitter.com/tdharris',
	'https://www.linkedin.com/in/tylerdavidharris',
	'https://github.com/tdharris',
	'Git, JavaScript, Node.js, HTML, CSS, MySQL, Oracle, PSQL, Bash, SuSE Linux. <br><br> Be sure to checkout <a href="http://tdharris.net/?action=q&amp;url=portfolio">my portfolio</a>!', 
	'I have a variety of technical experience and a passion for learning new technologies. My resume shows my interest in web-development, particularly with Node.js. I have 3 years of professional development experience and will be graduating this April with a Bachelor of Science degree in Computer Information Technology. I’ve worked on projects in Java, JavaScript, CSS and HTML:
	<ul>
		<li>Built a full web-application with node.js and angular that provides notifications via email and text for on-call engineers.</li>
		<li>Created a public administration tool for Novell GroupWise Mobility Service Admins, written primarily in Bash, which has been featured in a 3rd-party publication.</li>
		<li>Author and Publisher of 250+ Technical Information Documents for Knowledge-Centered Support (KCS) and was awarded “Reaching New Heights of Knowledge” as recognition of my outstanding and exemplary performance.</li>
		<li>Leader on my team and help them as a KCS Super User to publish Technical Information Documents and become Authors themselves.</li>
	</ul>
	<p>I am quick to learn new things and am interested in front-end web-development and Node.js.',
	'<p>I love Jazz! I have been playing the saxophone since middle school and have been highly involved in the Jazz Department while in College. I consider myself to have double majored, as I have taken Major lessons every year, received Music scholarships, been the 1st chair in the leading jazz ensemble big band and jazz combo every semester, which toured the Dominican Republic, Puerto Rico and New Mexico and participated in Hamp\'s Club by winning the Jazz Improvisation Solo award at Lionel Hampton Jazz Festival. This participation in the arts genuinely helps my creativity.</p>
	<p>In a typical jazz group the musicians first play the main melody or theme, then one or more musicians (piano, trumpet, sax, bass, etc.) take turns improvising variations based on the main melody. At the end the band returns to the original theme or melody. A jazz musician is creating art every time he or she plays and the same piece of music will sound different, even if it is played by the same musicians. You have to stay connected on the band stand with what people are communicating to you. Since this music is highly improvised, you have to stay connected and present, listening intently to all those around you, as it\'s about making music together.</p>
	<p>"Jazz is not an assembly line of regurgitation, but a creative passionate journey of self-realization/expression where our goal is to know all people in all situations as we know ourselves." ~Anonymous</p>
	<p><i>"This music is a sure path to self realization."</i> ~John McNeil</p>',
	'playingSaxophone.jpg');

-- Project: qNotify
INSERT INTO projects (projectID, sortOrder, projectName, category, githubURL, brief, description) VALUES
(1, 2, 'qNotify', 'Web-Dev','https://github.com/tdharris/qNotify',
	'Text/email notification web app built with Node.js and Express.js for on-call engineers.',
	'<p>qNotify is a single-page app (SPA) permitting Novell engineers to sign-in and receive qmon texts and email notifications for their appropriate queues.</p><p>qNotify is a web-application that is built on Node.js, which is a platform built on Chrome\'s JavaScript runtime for building fast, scalable network applications. I used nodejs and a module called Express.js (MEAN stack) instead of apache, tomcat (LAMP stack).</p>');

INSERT INTO images (projectID, featured, url) VALUES
(1, '', 'qnotify-logo.png');
INSERT INTO images (projectID, url) VALUES
(1, 'qnotify.png');
INSERT INTO images (projectID, url) VALUES
(1, 'qnotify-2.png');
INSERT INTO images (projectID, url) VALUES
(1, 'qnotify-3.png');

-- Project: qNinja
INSERT INTO projects (projectID, sortOrder, projectName, category, githubURL, brief, description) VALUES
(2, 1, 'qNinja', 'Web-Dev','https://github.com/tdharris/qNinja',
	'Engineer’s workload management web app built with Angular, Node and Express.',
	'<p>Engineer’s workload management web app built with AngularJS, NodeJS and ExpressJS.</p>
	<p>Often times we would have customers with similar issues or we\'d need to send a similar email regarding follow-up. Normally, this would be done one at a time in a mail client, but qNinja allows engineers to send the same email message to various customers while still generating a separate email for each one (unique subject and recipients). It includes the necessary tags in the email to be included in the database as well, so it\'s as if a regular email was sent.</p>
	A Novell Engineer navigates to https://qNinja.lab.novell.com and follow these steps: 
		<ul>
			<li>Enters credentials and selects \'Remember Me\' for HTML5 storage of credentials and signature.</li>
			<li>Selects Refresh to pull in data regarding their Service Requests populated in the bottom panel.</li>
			<li>Select several to send emails to (perhaps change the email list, sort columns, etc.)</li>
			<li>Create the Content and Signature of the email. <br><i>Note: Snippets can be selected and inserted from the dropdown</i></li>
			<li>Select Preview for a dialog that displays what the email will look like.</li>
			<li>Click Send. A notification box is displayed reporting that a request was received by the server and queued up for processing.</li>
		</ul>
	The server now does these steps:
		<ul>
			<li>The server receives the request to send emails, and queues it up for the taskHandler.</li>
			<li>The taskHandler will process 3 of these requests at a time as to not overload the Mail Transport (async library).</li>
			<li>First, all the recipients are validated and any non-emails are discarded.</li>
			<li>A mail item is then created for transport and sent.</li>
			<li>The result of this send (code response of the SMTP server) is appended to the task\'s report.</li>
			<li>This process is then repeated for all email items that were in the request.</li>
			<li>Then a report is emailed to the Novell User detailing the results.</li>
		</ul>');

INSERT INTO images (projectID, featured, url) VALUES
(2, '','qninja-logo.png');
INSERT INTO images (projectID, url) VALUES
(2, 'qninja.png');
INSERT INTO images (projectID, url) VALUES
(2, 'qninja-2.png');
INSERT INTO images (projectID, url) VALUES
(2, 'qninja-3.png');
INSERT INTO images (projectID, url) VALUES
(2, 'qninja-4.png');

-- Project: dsapp
INSERT INTO projects (projectID, sortOrder, projectName, category, githubURL, brief, description) VALUES
(3, 9, 'dsapp.sh', 'Bash','https://github.com/tdharris/dsapp',
	'A server-side tool aimed to help troubleshoot and solve common issues with Novell GroupWise Mobility Service.',
	'<p>qNotify is a single-page app (SPA) permitting Novell engineers to sign-in and receive qmon texts and email notifications for their appropriate queues.</p><p>qNotify is a web-application that is built on Node.js, which is a platform built on Chrome\'s JavaScript runtime for building fast, scalable network applications. I used nodejs and a module called Express.js (MEAN stack) instead of apache, tomcat (LAMP stack).</p>');
INSERT INTO images (projectID, featured, url) VALUES
(3, '','dsapp-logo.png');
INSERT INTO images (projectID, url) VALUES
(3, 'dsapp-1.png');
INSERT INTO images (projectID, url) VALUES
(3, 'dsapp-2.png');
INSERT INTO images (projectID, url) VALUES
(3, 'dsapp-3.png');
INSERT INTO images (projectID, url) VALUES
(3, 'dsapp-4.png');
INSERT INTO images (projectID, url) VALUES
(3, 'dsapp-5.png');
INSERT INTO images (projectID, url) VALUES
(3, 'dsapp-6.png');
INSERT INTO images (projectID, url) VALUES
(3, 'dsapp-7.png');
INSERT INTO images (projectID, url) VALUES
(3, 'dsapp-8.png');

-- Project: certs.sh
INSERT INTO projects (projectID, sortOrder, projectName, category, githubURL, brief, description) VALUES
(4, 11, 'certs.sh', 'Bash','https://github.com/tdharris/bashScripts/blob/master/certs/certs.sh',
	'Utility for SSL Certificate creation, signing and verification.',
	'<p>Utility for SSL Certificate creation, signing and verification.</p>');
INSERT INTO images (projectID, featured, url) VALUES
(4, '','certs-logo.png');
INSERT INTO images (projectID, url) VALUES
(4, 'certs-1.png');

-- Project: nftp.sh
INSERT INTO projects (projectID, sortOrder, projectName, category, githubURL, brief, description) VALUES
(5, 12, 'nftp.sh', 'Bash','https://github.com/tdharris/bashScripts/blob/master/nftp/nftp.sh',
	'Sync a local directory with FTP.',
	'<p>Sync a local directory with FTP.</p>');
INSERT INTO images (projectID, featured, url) VALUES
(5, '','nftp-logo.png');
INSERT INTO images (projectID, url) VALUES
(5, 'nftp-1.png');

-- Project: qDash
INSERT INTO projects (projectID, sortOrder, projectName, category, githubURL, brief, description) VALUES
(6, 3, 'qDash', 'Web-Dev','',
	'An Engineer\'s Dashboard. Panels for queues, stats, and links for launching SSH, VNC, RDP and Web Console.',
	'<p>An Engineer\'s Dashboard. Bootstrap-styled sites containing panels for queues, stats, and links for launching SSH, VNC, RDP and Web Console sessions to test environments.</p>');
INSERT INTO images (projectID, featured, url) VALUES
(6, '','qdash-logo.png');
INSERT INTO images (projectID, url) VALUES
(6, 'qdash.png');
INSERT INTO images (projectID, url) VALUES
(6, 'qdash-1.png');

-- Project: myNovellApp
INSERT INTO projects (projectID, sortOrder, projectName, category, githubURL, brief, description) VALUES
(7, 4, 'myNovellApp', 'Web-Dev','https://github.com/tdharris/myNovellApp.git',
	'My launcher page for qNotify, qNinja, qDash (Node.js wrapper app).',
	'<p>My launcher page for qNotify, qNinja, qDash (Node.js wrapper app).</p>');
INSERT INTO images (projectID, featured, url) VALUES
(7, '','myNovellApp.png');
INSERT INTO images (projectID, url) VALUES
(7, 'myNovellApp.png');

-- Project: nts-directoryMigration.sh
INSERT INTO projects (projectID, sortOrder, projectName, category, githubURL, brief, description) VALUES
(8, 10, 'nts-directoryMigration.sh', 'Bash','https://github.com/tdharris/bashScripts/tree/master/nts-directoryMigration.sh',
	'Created for Novell Filr to help facilitate multi-directional migrations between eDirectory and AD.',
	'<p>NTS Directory Services Migration Utility Created to help facilitate migrations from AD to eDirectory, eDirectory to AD. Queries LDAP server, updates necessary attributes for ALL Filr MySQL users.</p><p>This is based on CN, the user\'s name. Finds all users at specified base search and below. If LDAP returns a user that is found in MySQL based on their CN/username, it will be updated.</p>');
INSERT INTO images (projectID, featured, url) VALUES
(8, '','nts-directoryMigration-1.png');
INSERT INTO images (projectID, url) VALUES
(8, 'nts-directoryMigration-1.png');

-- Project: pocketBook
INSERT INTO projects (projectID, sortOrder, projectName, category, githubURL, brief, description) VALUES
(9, 6, 'pocketBook', 'Web-Dev','https://github.com/tdharris/pocketBook',
	'Single Page App (SPA) for mobile to store receipts, pictures and tag them.',
	'<p>Single Page Mobile App (SPA) to store receipts and pictures and tag them.</p> <ul> <li>100% JavaScript, no jQuery used</li> <li>Library, Receipt and MultiSelect created using Prototypes</li> <li>A HashMap Handler leveraged to handle all requests/behavior - keys are actions and values are functions</li> <li>Library is saved using localStorage</li> <li>Hammer.js library used to work with touch gestures</li> </ul>');
INSERT INTO images (projectID, featured, url) VALUES
(9, '','pocketBook-logo.png');
INSERT INTO images (projectID, url) VALUES
(9, 'pocketBook-1.png');
INSERT INTO images (projectID, url) VALUES
(9, 'pocketBook-2.png');
INSERT INTO images (projectID, url) VALUES
(9, 'pocketBook-3.png');
INSERT INTO images (projectID, url) VALUES
(9, 'pocketBook-4.png');
INSERT INTO images (projectID, url) VALUES
(9, 'pocketBook-5.png');

-- Project: elephant
INSERT INTO projects (projectID, sortOrder, projectName, category, githubURL, brief, description) VALUES
(10, 5, 'elephant', 'Java','https://github.com/tdharris/elephant',
	'Java server and client (Android mobile application) demonstration.',
	'Java based server and mobile application development. Experimenting with several technologies and methodologies:<ul>
			<li>Java Collections</li>
			<li>Java Beans</li>
			<li>Hibernate</li>
			<li>JSON</li>
			<li>Socket IO</li>
			<li>Android HTTP</li>
			<li>UML</li>
			<li>JUNIT Testing</li>
			<li>Android UI</li>
			<li>Parallel Processing</li>
			<li>Modern Software Designs</li>
			<li>Model View Controller</li>
		</ul>
		Our steps were to:
		<ol>
			<li>"Play" with the technology</li>
			<li>Think</li>
			<li>Design</li>
			<li>Create Tests</li>
			<li>Create Solution</li>
		</ol>');
INSERT INTO images (projectID, featured, url) VALUES
(10, '','elephant-1.png');
INSERT INTO images (projectID, url) VALUES
(10, 'elephant-1.png');
INSERT INTO images (projectID, url) VALUES
(10, 'elephant-2.png');
INSERT INTO images (projectID, url) VALUES
(10, 'elephant-3.png');
INSERT INTO images (projectID, url) VALUES
(10, 'elephant-4.png');

-- Project: tdharris.net
INSERT INTO projects (projectID, sortOrder, projectName, category, githubURL, brief, description) VALUES
(11, 7, 'tdharris.net', 'Web-Dev','https://github.com/tdharris/cit336-tdharris',
	'A site to showcase my projects - built with PHP, HTML, CSS, JS.',
	'A site to showcase my projects - built with PHP, HTML, CSS, JS. <br> <i>Note: No PHP Libraries were used in this project and content is dynamically generated from a MySQL database.</i> <h2>My Portfolio</h2> <ul> <li>Highlights projects that I\'ve worked on with screenshots, github links, descriptions, etc.</li> </ul> <h2>MySQL</h2> <ul> <li>Created my own PHP Class to handle all Database Interactions via PDO_MYSQL</li> <li>Queries take a SQL statement with named placeholders, an array of parameters that are used to create these named placeholders, and a fetchmode.</li> <li>All content in the site is generated from the DB (nav, about, portfolio, projects, etc.)</li> <li>Content can be managed entirely through db interractions that have been defined in the Database Class</li> </ul> <h2>Administration</h2> <ul> <li>Features an Admin Section for Content Management (Add, Edit, Delete)</li> <li>Image file upload and deletion, stored locally, fileIDs randomly generated and kept track of in MySQL</li> <li>Passwords are randomly salted, encrypted using the Blowfish algorithm, hashed with the salt -&gt; MySQL.</li> <li>Session logins to prevent from having to continually log-in</li> </ul>');
INSERT INTO images (projectID, featured, url) VALUES
(11, '','tdharris-logo.png');
INSERT INTO images (projectID, url) VALUES
(11, 'tdharris-1.png');

-- Project: tmessenger
INSERT INTO projects (projectID, sortOrder, projectName, category, githubURL, brief, description) VALUES
(12, 8, 'tmessenger', 'Web-Dev','https://github.com/tdharris/tmessenger',
	'An example web-chat application build on NodeJS and Socket.IO.',
	'<p>An example web-chat application build on NodeJS and Socket.IO. Built for a Java class to demonstrate how many fewer lines of code were required to build the same application.</p>');
INSERT INTO images (projectID, featured, url) VALUES
(12, '','tmessenger.jpg');
INSERT INTO images (projectID, url) VALUES
(12, 'tmessenger.jpg');
INSERT INTO images (projectID, url) VALUES
(12, 'tmessenger-2.jpg');

-- Project: checkServices.sh
INSERT INTO projects (projectID, sortOrder, projectName, category, githubURL, brief, description) VALUES
(13, 13, 'checkServices.sh', 'Bash','https://github.com/tdharris/bashScripts/tree/master/checkServices',
	'Alert Notification Service for Mobility Administration',
	'<p>Alert Notification System for DataSync/Mobility Administration</p>
	<p>Notification service if any DataSync services/connectors go offline. The script restarts the services if any are found to be in a dead/unused state and sends an email to the administrator defined in the script file. The notification email contains the following information:</p>
	<ul>
		<li>hostname of server</li>
		<li>date/time when services were found offline</li>
		<li>the list of services found offline</li>
		<li>status of services after a restart attempt</li>
		<li>the current log levels</li>
		<li>an attachment with a copy of all the logs and other server information</li>
	</ul>
	<p>Running the script manually displays the following and will appear in the notification email:</p>
	<pre>
		Checking for DataSync Config Engine:		running
		Checking for DataSync Web Admin:			running
		Checking for DataSync Connector Manager:	running
		Checking for DataSync Engine:				running
		Mobility Connector listening on port 443:	true
		GroupWise Connector listening on port 4500: true
	</pre>
	<p>When implemented with crontab, the script can be set to run every hour, for example. This allows an administrator to be notified of a failure before users complain. Edit the script file and replace <a href="mailto:email@address.com">email@address.com</a> with the desired administrator’s email. You can likewise configure a list of email address by placing them in single quotes separated by a comma and a space – ‘email1, email2, email3′</p>
	<p>To run the script regularly with crontab, just place the script file into /etc/cron.hourly to run hourly or /etc/cron.daily to run daily. Custom definitions can be made by editing the crontab file manually:</p>
	<pre>crontab -e</pre>
	<p>An example of running the script every 30 minutes:</p>
	<pre>0 30 * * * /root/scripts/checkServices.sh</pre>');
INSERT INTO images (projectID, featured, url) VALUES
(13, '','checkServices.jpg');
INSERT INTO images (projectID, url) VALUES
(13, 'checkServices.jpg');

-- next sortOrder is 14