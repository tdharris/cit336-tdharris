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
(1, 1, 'qNotify', 'webDev','https://github.com/tdharris/qNotify',
	'Text/email notification web app built with Node.js and Express.js for on-call engineers.',
	'<p>qNotify is a single-page app (SPA) permitting Novell engineers to sign-in and receive qmon texts and email notifications for their appropriate queues.</p><p>qNotify is a web-application that is built on Node.js, which is a platform built on Chrome\'s JavaScript runtime for building fast, scalable network applications. I used nodejs and a module called Express.js (MEAN stack) instead of apache, tomcat (LAMP stack).</p>');

INSERT INTO images (imageID, projectID, featured, url) VALUES
(1, 1, '', 'qnotify-logo.png');
INSERT INTO images (imageID, projectID, url) VALUES
(2, 1, 'qnotify.png');

-- Project: qNinja
INSERT INTO projects (projectID, sortOrder, projectName, category, githubURL, brief, description) VALUES
(2, 2, 'qNinja', 'webDev','https://github.com/tdharris/qNinja',
	'Text/email notification web app built with Node.js and Express.js for on-call engineers.',
	'<p>qNotify is a single-page app (SPA) permitting Novell engineers to sign-in and receive qmon texts and email notifications for their appropriate queues.</p><p>qNotify is a web-application that is built on Node.js, which is a platform built on Chrome\'s JavaScript runtime for building fast, scalable network applications. I used nodejs and a module called Express.js (MEAN stack) instead of apache, tomcat (LAMP stack).</p>');

INSERT INTO images (imageID, projectID, featured, url) VALUES
(3, 2, '','qninja-logo.png');
INSERT INTO images (imageID, projectID, url) VALUES
(4, 2, 'qninja.png');