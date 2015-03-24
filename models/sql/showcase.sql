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
	projectName VARCHAR(255)	NOT NULL,
	description	VARCHAR(255)				DEFAULT NULL,
	githubURL	VARCHAR(255)				DEFAULT NULL,
	PRIMARY KEY (projectID),
	UNIQUE INDEX projectName (projectName)
);

CREATE TABLE images (
	imageID		INT 			NOT NULL 	AUTO_INCREMENT,
	projectID	INT 						DEFAULT NULL,
	aboutID		INT 						DEFAULT NULL,
	url			VARCHAR(255)	NOT NULL,
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
(1, 'About Me', '#'),
(2, 'Blog', '#'),
(3, 'Portfolio', '#'),
(4, 'Contact', '#');

INSERT INTO about (aboutID, email, phone, resumeURL, facebookURL, twitterURL, linkedinURL, githubURL, skillset, brief) VALUES
(1, 'tylerdavidharris@gmail.com', '(530) 200-1919', 'http://goo.gl/89Luq2', 
	'https://www.facebook.com/tylerdavidharris',
	'https://twitter.com/tdharris',
	'https://www.linkedin.com/in/tylerdavidharris',
	'https://github.com/tdharris',
	'Git, JavaScript, Node.js, HTML, CSS, MySQL, Oracle, PSQL, Bash, SuSE Linux.', 'I have a lot of technical experience and a passion for learning new technologies. My resume shows my interest in web-development, particularly with Node.js. I have 3 years of professional development experience and will be graduating this April with a Bachelor of Science degree in Computer Information Technology. I’ve worked on projects in Java, JavaScript, CSS and HTML. I have built a full web-application with node.js and angular that provides notifications via email and text for on-call engineers. I have likewise created a public administration tool for Novell GroupWise Mobility Service Admins, written primarily in Bash, which has been featured in a 3rd-party publication. I’m an Author and Publisher of 240+ Technical Information Documents for Knowledge-Centered Support (KCS) and was awarded “Reaching New Heights of Knowledge” as recognition of my outstanding and exemplary performance. I am a leader on my team and help them as a KCS Super User to publish Technical Information Documents and become Authors themselves. I am quick to learn new things and am interested in web-development and Node.js.');