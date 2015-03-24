-- Database "tdharris_showcase" must already exist.
use tdharris_showcase;

-- Drops existing tables prior to creating or recreating the tables
DROP TABLE IF EXISTS nav, projects, images;

-- create the tables for the database 
CREATE TABLE nav (
	navID		INT				NOT NULL	AUTO_INCREMENT,
	name      	VARCHAR(255)	NOT NULL,
	href		VARCHAR(255)				DEFAULT NULL,
	PRIMARY KEY (navID),
	UNIQUE INDEX name (name)
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
	projectID	INT 			NOT NULL,
	url			VARCHAR(255)	NOT NULL,
	PRIMARY KEY (imageID),
	FOREIGN KEY (projectID)
		REFERENCES projects(projectID)
		ON DELETE CASCADE
);

-- Insert data into the tables
INSERT INTO nav (navID, name, href) VALUES
(1, 'About Me', '#'),
(2, 'Blog', '#'),
(3, 'Portfolio', '#'),
(4, 'Contact', '#');
