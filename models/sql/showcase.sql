-- Database "tdharris_showcase" must already exist.
use tdharris_showcase;

-- Drops existing tables prior to creating or recreating the tables
DROP TABLE IF EXISTS nav, about, projects, images;

-- create the tables for the database 
CREATE TABLE nav (
	navID		INT				NOT NULL	AUTO_INCREMENT,
	name      	VARCHAR(255)	NOT NULL,
	href		VARCHAR(255)				DEFAULT NULL,
	PRIMARY KEY (navID),
	UNIQUE INDEX name (name)
);

CREATE TABLE about (
	aboutID		INT				NOT NULL	AUTO_INCREMENT,
	resumeURL	VARCHAR(255)	NOT NULL,
	email		VARCHAR(255)	NOT NULL,
	phone		VARCHAR(255)	NOT NULL,
	brief  		LONGTEXT		NOT NULL,
	skillset 	VARCHAR(255)	NOT NULL,
	facebookURL	VARCHAR(255)				DEFAULT NULL,
	twitterURL 	VARCHAR(255)				DEFAULT NULL,
	linkedinURL VARCHAR(255)				DEFAULT NULL,
	githubURL 	VARCHAR(255)				DEFAULT NULL,
	PRIMARY KEY (aboutID)
);

CREATE TABLE projects (
	projectID	INT				NOT NULL	AUTO_INCREMENT,
	sortOrder	INT				NOT NULL,
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

-- Insert data into the tables
INSERT INTO nav (navID, name, href) VALUES
(1, 'About Me', 'aboutme'),
(2, 'Portfolio', 'portfolio'),
(3, 'Contact', 'contact');

INSERT INTO about (aboutID, email, phone, resumeURL, facebookURL, twitterURL, linkedinURL, githubURL, skillset, brief) VALUES
(1, 'tylerdavidharris@gmail.com', '(530) 200-1919', 'http://goo.gl/89Luq2', 
	'https://www.facebook.com/tylerdavidharris',
	'https://twitter.com/tdharris',
	'https://www.linkedin.com/in/tylerdavidharris',
	'https://github.com/tdharris',
	'Git, JavaScript, Node.js, HTML, CSS, MySQL, Oracle, PSQL, Bash, SuSE Linux.', 'I have a lot of technical experience and a passion for learning new technologies. My resume shows my interest in web-development, particularly with Node.js. I have 3 years of professional development experience and will be graduating this April with a Bachelor of Science degree in Computer Information Technology. I’ve worked on projects in Java, JavaScript, CSS and HTML. I have built a full web-application with node.js and angular that provides notifications via email and text for on-call engineers. I have likewise created a public administration tool for Novell GroupWise Mobility Service Admins, written primarily in Bash, which has been featured in a 3rd-party publication. I’m an Author and Publisher of 240+ Technical Information Documents for Knowledge-Centered Support (KCS) and was awarded “Reaching New Heights of Knowledge” as recognition of my outstanding and exemplary performance. I am a leader on my team and help them as a KCS Super User to publish Technical Information Documents and become Authors themselves. I am quick to learn new things and am interested in web-development and Node.js.');

-- Project: qNotify
INSERT INTO projects (projectID, sortOrder, projectName, category, githubURL, brief, description) VALUES
(1, 4, 'qNotify', 'webDev','https://github.com/tdharris/qNotify',
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
(2, 5, 'qNinja', 'webDev','https://github.com/tdharris/qNinja',
	'Engineer’s workload management web app built with Node.js and Express.js.',
	'<p>qNotify is a single-page app (SPA) permitting Novell engineers to sign-in and receive qmon texts and email notifications for their appropriate queues.</p><p>qNotify is a web-application that is built on Node.js, which is a platform built on Chrome\'s JavaScript runtime for building fast, scalable network applications. I used nodejs and a module called Express.js (MEAN stack) instead of apache, tomcat (LAMP stack).</p>');

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
(3, 8, 'dsapp.sh', 'bash','https://github.com/tdharris/dsapp',
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
(4, 10, 'certs.sh', 'bash','https://github.com/tdharris/bashScripts/blob/master/certs/certs.sh',
	'Utility for SSL Certificate creation, signing and verification.',
	'<p>Utility for SSL Certificate creation, signing and verification.</p>');
INSERT INTO images (projectID, featured, url) VALUES
(4, '','certs-logo.png');
INSERT INTO images (projectID, url) VALUES
(4, 'certs-1.png');

-- Project: nftp.sh
INSERT INTO projects (projectID, sortOrder, projectName, category, githubURL, brief, description) VALUES
(5, 11, 'nftp.sh', 'bash','https://github.com/tdharris/bashScripts/blob/master/nftp/nftp.sh',
	'Sync a local directory with FTP.',
	'<p>Sync a local directory with FTP.</p>');
INSERT INTO images (projectID, featured, url) VALUES
(5, '','nftp-logo.png');
INSERT INTO images (projectID, url) VALUES
(5, 'nftp-1.png');

-- Project: qDash
INSERT INTO projects (projectID, sortOrder, projectName, category, githubURL, brief, description) VALUES
(6, 6, 'qDash', 'webDev','',
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
(7, 3, 'myNovellApp', 'webDev','https://github.com/tdharris/myNovellApp.git',
	'My launcher page for qNotify, qNinja, qDash (Node.js wrapper app).',
	'<p>My launcher page for qNotify, qNinja, qDash (Node.js wrapper app).</p>');
INSERT INTO images (projectID, featured, url) VALUES
(7, '','myNovellApp.png');
INSERT INTO images (projectID, url) VALUES
(7, 'myNovellApp.png');

-- Project: nts-directoryMigration.sh
INSERT INTO projects (projectID, sortOrder, projectName, category, githubURL, brief, description) VALUES
(8, 9, 'nts-directoryMigration.sh', 'bash','https://github.com/tdharris/bashScripts/tree/master/nts-directoryMigration.sh',
	'Created for Novell Filr to help facilitate multi-directional migrations between eDirectory and AD.',
	'<p>NTS Directory Services Migration Utility Created to help facilitate migrations from AD to eDirectory, eDirectory to AD. Queries LDAP server, updates necessary attributes for ALL Filr MySQL users.</p><p>This is based on CN, the user\'s name. Finds all users at specified base search and below. If LDAP returns a user that is found in MySQL based on their CN/username, it will be updated.</p>');
INSERT INTO images (projectID, featured, url) VALUES
(8, '','nts-directoryMigration-1.png');
INSERT INTO images (projectID, url) VALUES
(8, 'nts-directoryMigration-1.png');

-- Project: pocketBook
INSERT INTO projects (projectID, sortOrder, projectName, category, githubURL, brief, description) VALUES
(9, 2, 'pocketBook', 'webDev','https://github.com/tdharris/pocketBook',
	'Single Page App (SPA) for mobile to store receipts, pictures and tag them.',
	'<p>Single Page Mobile App (SPA) to store receipts and pictures and tag them.</p>');
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
(10, 1, 'elephant', 'java','https://github.com/tdharris/elephant',
	'Java server and client (Android mobile application) demonstration.',
	'<p>Java based server and mobile application development. Experimenting with several technologies and methodologies:<ul>
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
			<li>Model View</li> Controller</li>
		</ul></p>
		<p>Our steps were to:
		<ol>
			<li>"Play" with the technology</li>
			<li>Think</li>
			<li>Design</li>
			<li>Create Tests</li>
			<li>Create Solution</li>
		</ol></p>');
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
(11, 7, 'tdharris.net', 'webDev','https://github.com/tdharris/cit336-tdharris',
	'This showcase website built with PHP, HTML, CSS.',
	'<p>A Showcase website built with PHP, HTML, CSS. Final Project for CIT 336: Web Backend Development</p>');
INSERT INTO images (projectID, featured, url) VALUES
(11, '','tdharris-logo.png');
INSERT INTO images (projectID, url) VALUES
(11, 'tdharris-1.png');

-- next sortOrder is 12