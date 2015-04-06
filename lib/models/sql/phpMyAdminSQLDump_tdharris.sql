-- phpMyAdmin SQL Dump
-- version 3.3.10.4
-- http://www.phpmyadmin.net
--
-- Host: showcase.tdharris.net
-- Generation Time: Apr 06, 2015 at 09:23 AM
-- Server version: 5.1.56
-- PHP Version: 5.4.37

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `tdharris_showcase`
--
CREATE DATABASE `tdharris_showcase` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `tdharris_showcase`;

-- --------------------------------------------------------

--
-- Table structure for table `about`
--

CREATE TABLE IF NOT EXISTS `about` (
  `aboutID` int(11) NOT NULL AUTO_INCREMENT,
  `resumeURL` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `coderBrief` longtext NOT NULL,
  `musicianBrief` longtext NOT NULL,
  `musicPic` varchar(255) DEFAULT NULL,
  `skillset` varchar(255) NOT NULL,
  `facebookURL` varchar(255) DEFAULT NULL,
  `twitterURL` varchar(255) DEFAULT NULL,
  `linkedinURL` varchar(255) DEFAULT NULL,
  `githubURL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`aboutID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `about`
--

INSERT INTO `about` (`aboutID`, `resumeURL`, `email`, `phone`, `coderBrief`, `musicianBrief`, `musicPic`, `skillset`, `facebookURL`, `twitterURL`, `linkedinURL`, `githubURL`) VALUES
(1, 'http://goo.gl/89Luq2', 'tylerdavidharris@gmail.com', '(530) 200-1919', 'I have a variety of technical experience and a passion for learning new technologies. My resume shows my interest in web-development, particularly with Node.js. I have 3 years of professional development experience and will be graduating this April with a Bachelor of Science degree in Computer Information Technology. I’ve worked on projects in Java, JavaScript, CSS and HTML:\r\n	<ul>\r\n		<li>Built a full web-application with node.js and angular that provides notifications via email and text for on-call engineers.</li>\r\n		<li>Created a public administration tool for Novell GroupWise Mobility Service Admins, written primarily in Bash, which has been featured in a 3rd-party publication.</li>\r\n		<li>Author and Publisher of 250+ Technical Information Documents for Knowledge-Centered Support (KCS) and was awarded “Reaching New Heights of Knowledge” as recognition of my outstanding and exemplary performance.</li>\r\n		<li>Leader on my team and help them as a KCS Super User to publish Technical Information Documents and become Authors themselves.</li>\r\n	</ul>\r\n	<p>I am quick to learn new things and am interested in front-end web-development and Node.js.', '<p>I love Jazz! I have been playing the saxophone since middle school and have been highly involved in the Jazz Department while in College. I consider myself to have double majored, as I have taken Major lessons every year, received Music scholarships, been the 1st chair in the leading jazz ensemble big band and jazz combo every semester, which toured the Dominican Republic, Puerto Rico and New Mexico and participated in Hamp''s Club by winning the Jazz Improvisation Solo award at Lionel Hampton Jazz Festival. This participation in the arts genuinely helps my creativity.</p>\r\n	<p>In a typical jazz group the musicians first play the main melody or theme, then one or more musicians (piano, trumpet, sax, bass, etc.) take turns improvising variations based on the main melody. At the end the band returns to the original theme or melody. A jazz musician is creating art every time he or she plays and the same piece of music will sound different, even if it is played by the same musicians. You have to stay connected on the band stand with what people are communicating to you. Since this music is highly improvised, you have to stay connected and present, listening intently to all those around you, as it''s about making music together.</p>\r\n	<p>"Jazz is not an assembly line of regurgitation, but a creative passionate journey of self-realization/expression where our goal is to know all people in all situations as we know ourselves." ~Anonymous</p>\r\n	<p><i>"This music is a sure path to self realization."</i> ~John McNeil</p>', 'playingSaxophone.jpg', 'Git, JavaScript, Node.js, HTML, CSS, MySQL, Oracle, PSQL, Bash, SuSE Linux. <br><br> Be sure to checkout <a href="http://tdharris.net/?action=q&amp;url=portfolio">my portfolio</a>!', 'https://www.facebook.com/tylerdavidharris', 'https://twitter.com/tdharris', 'https://www.linkedin.com/in/tylerdavidharris', 'https://github.com/tdharris');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
  `adminID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` varchar(255) NOT NULL,
  `hash` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`adminID`),
  UNIQUE KEY `name` (`userID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`adminID`, `userID`, `hash`) VALUES
(1, 'admin', '$2a$10$Vb1PSvUT7OAhMle.gf6xv.bQvhkmBm48EVg21UdXktyDbBtwpRvpq');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE IF NOT EXISTS `images` (
  `imageID` int(11) NOT NULL AUTO_INCREMENT,
  `projectID` int(11) DEFAULT NULL,
  `aboutID` int(11) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `featured` varchar(0) DEFAULT NULL,
  PRIMARY KEY (`imageID`),
  KEY `projectID` (`projectID`),
  KEY `aboutID` (`aboutID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=59 ;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`imageID`, `projectID`, `aboutID`, `url`, `featured`) VALUES
(1, 1, NULL, 'qnotify-logo.png', ''),
(2, 1, NULL, 'qnotify.png', NULL),
(3, 1, NULL, 'qnotify-2.png', NULL),
(4, 1, NULL, 'qnotify-3.png', NULL),
(5, 2, NULL, 'qninja-logo.png', ''),
(6, 2, NULL, 'qninja.png', NULL),
(7, 2, NULL, 'qninja-2.png', NULL),
(8, 2, NULL, 'qninja-3.png', NULL),
(9, 2, NULL, 'qninja-4.png', NULL),
(10, 3, NULL, 'dsapp-logo.png', ''),
(11, 3, NULL, 'dsapp-1.png', NULL),
(12, 3, NULL, 'dsapp-2.png', NULL),
(13, 3, NULL, 'dsapp-3.png', NULL),
(14, 3, NULL, 'dsapp-4.png', NULL),
(15, 3, NULL, 'dsapp-5.png', NULL),
(16, 3, NULL, 'dsapp-6.png', NULL),
(17, 3, NULL, 'dsapp-7.png', NULL),
(18, 3, NULL, 'dsapp-8.png', NULL),
(19, 4, NULL, 'certs-logo.png', ''),
(20, 4, NULL, 'certs-1.png', NULL),
(21, 5, NULL, 'nftp-logo.png', ''),
(22, 5, NULL, 'nftp-1.png', NULL),
(23, 6, NULL, 'qdash-logo.png', ''),
(24, 6, NULL, 'qdash.png', NULL),
(25, 6, NULL, 'qdash-1.png', NULL),
(26, 7, NULL, 'myNovellApp.png', ''),
(27, 7, NULL, 'myNovellApp.png', NULL),
(28, 8, NULL, 'nts-directoryMigration-1.png', ''),
(29, 8, NULL, 'nts-directoryMigration-1.png', NULL),
(30, 9, NULL, 'pocketBook-logo.png', ''),
(31, 9, NULL, 'pocketBook-1.png', NULL),
(32, 9, NULL, 'pocketBook-2.png', NULL),
(33, 9, NULL, 'pocketBook-3.png', NULL),
(34, 9, NULL, 'pocketBook-4.png', NULL),
(35, 9, NULL, 'pocketBook-5.png', NULL),
(36, 10, NULL, 'elephant-1.png', ''),
(37, 10, NULL, 'elephant-1.png', NULL),
(38, 10, NULL, 'elephant-2.png', NULL),
(39, 10, NULL, 'elephant-3.png', NULL),
(40, 10, NULL, 'elephant-4.png', NULL),
(41, 11, NULL, 'tdharris-logo.png', ''),
(42, 11, NULL, 'tdharris-1.png', NULL),
(43, 12, NULL, 'tmessenger.jpg', ''),
(44, 12, NULL, 'tmessenger.jpg', NULL),
(45, 12, NULL, 'tmessenger-2.jpg', NULL),
(46, 13, NULL, 'checkServices.jpg', ''),
(47, 13, NULL, 'checkServices.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `nav`
--

CREATE TABLE IF NOT EXISTS `nav` (
  `navID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `href` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`navID`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `nav`
--

INSERT INTO `nav` (`navID`, `name`, `href`) VALUES
(1, 'About Me', 'aboutme'),
(2, 'Portfolio', 'portfolio'),
(3, 'Contact', 'contact'),
(4, 'Admin', 'login');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE IF NOT EXISTS `projects` (
  `projectID` int(11) NOT NULL AUTO_INCREMENT,
  `sortOrder` int(11) DEFAULT NULL,
  `projectName` varchar(255) NOT NULL,
  `category` varchar(25) NOT NULL,
  `brief` varchar(255) NOT NULL,
  `description` longtext,
  `githubURL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`projectID`),
  UNIQUE KEY `projectName` (`projectName`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`projectID`, `sortOrder`, `projectName`, `category`, `brief`, `description`, `githubURL`) VALUES
(1, 2, 'qNotify', 'Web-Dev', 'Text/email notification web app built with Node.js and Express.js for on-call engineers.', '&lt;p&gt;qNotify is a single-page app (SPA) permitting Novell engineers to sign-in and receive qmon texts and email notifications for their appropriate queues.&lt;/p&gt;&lt;p&gt;qNotify is a web-application that is built on Node.js, which is a platform built on Chrome\\''s JavaScript runtime for building fast, scalable network applications. I used nodejs and a module called Express.js (MEAN stack) instead of apache, tomcat (LAMP stack).&lt;/p&gt; A Novell User would follow these steps: &lt;ul&gt; &lt;li&gt;Enter their name, email and/or mobile phone information&lt;/li&gt; &lt;li&gt;Select Sign-in (their name gets appended to the User List)&lt;/li&gt; &lt;li&gt;They are now subscribed to receive update notifications regarding the queue. This is primarily used for after-hour and Holiday coverage.&lt;/li&gt; &lt;/ul&gt;', 'https://github.com/tdharris/qNotify'),
(2, 1, 'qNinja', 'Web-Dev', 'Engineer’s workload management web app built with Angular, Node and Express.', '<p>Engineer’s workload management web app built with AngularJS, NodeJS and ExpressJS.</p>\r\n	<p>Often times we would have customers with similar issues or we''d need to send a similar email regarding follow-up. Normally, this would be done one at a time in a mail client, but qNinja allows engineers to send the same email message to various customers while still generating a separate email for each one (unique subject and recipients). It includes the necessary tags in the email to be included in the database as well, so it''s as if a regular email was sent.</p>\r\n	A Novell Engineer navigates to https://qNinja.lab.novell.com and follow these steps: \r\n		<ul>\r\n			<li>Enters credentials and selects ''Remember Me'' for HTML5 storage of credentials and signature.</li>\r\n			<li>Selects Refresh to pull in data regarding their Service Requests populated in the bottom panel.</li>\r\n			<li>Select several to send emails to (perhaps change the email list, sort columns, etc.)</li>\r\n			<li>Create the Content and Signature of the email. <br><i>Note: Snippets can be selected and inserted from the dropdown</i></li>\r\n			<li>Select Preview for a dialog that displays what the email will look like.</li>\r\n			<li>Click Send. A notification box is displayed reporting that a request was received by the server and queued up for processing.</li>\r\n		</ul>\r\n	The server now does these steps:\r\n		<ul>\r\n			<li>The server receives the request to send emails, and queues it up for the taskHandler.</li>\r\n			<li>The taskHandler will process 3 of these requests at a time as to not overload the Mail Transport (async library).</li>\r\n			<li>First, all the recipients are validated and any non-emails are discarded.</li>\r\n			<li>A mail item is then created for transport and sent.</li>\r\n			<li>The result of this send (code response of the SMTP server) is appended to the task''s report.</li>\r\n			<li>This process is then repeated for all email items that were in the request.</li>\r\n			<li>Then a report is emailed to the Novell User detailing the results.</li>\r\n		</ul>', 'https://github.com/tdharris/qNinja'),
(3, 9, 'dsapp.sh', 'Bash', 'A server-side tool aimed to help troubleshoot and solve common issues with Novell GroupWise Mobility Service.', '<p>qNotify is a single-page app (SPA) permitting Novell engineers to sign-in and receive qmon texts and email notifications for their appropriate queues.</p><p>qNotify is a web-application that is built on Node.js, which is a platform built on Chrome''s JavaScript runtime for building fast, scalable network applications. I used nodejs and a module called Express.js (MEAN stack) instead of apache, tomcat (LAMP stack).</p>', 'https://github.com/tdharris/dsapp'),
(4, 11, 'certs.sh', 'Bash', 'Utility for SSL Certificate creation, signing and verification.', '<p>Utility for SSL Certificate creation, signing and verification.</p>', 'https://github.com/tdharris/bashScripts/blob/master/certs/certs.sh'),
(5, 12, 'nftp.sh', 'Bash', 'Sync a local directory with FTP.', '<p>Sync a local directory with FTP.</p>', 'https://github.com/tdharris/bashScripts/blob/master/nftp/nftp.sh'),
(6, 3, 'qDash', 'Web-Dev', 'An Engineer Dashboard. Panels for queues, stats, and links for launching SSH, VNC, RDP and Web Console.', '&lt;p&gt;An Engineer Dashboard. Bootstrap-styled sites containing panels for queues, stats, and links for launching SSH, VNC, RDP and Web Console sessions to test environments.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Used daily by Novell Engineers to monitor queue and access test environments&lt;/li&gt; &lt;li&gt;Custom dashboards for each Engineer&lt;/li&gt; &lt;li&gt;Created a Windows Registry file to handle PuTTY, RDP, VNC links from browser&lt;/li&gt; &lt;/ul&gt;', 'https://github.com/tdharris/qdash'),
(7, 4, 'myNovellApp', 'Web-Dev', 'My launcher page for qNotify, qNinja, qDash (Node.js wrapper app).', '<p>My launcher page for qNotify, qNinja, qDash (Node.js wrapper app).</p>', 'https://github.com/tdharris/myNovellApp.git'),
(8, 10, 'nts-directoryMigration.sh', 'Bash', 'Created for Novell Filr to help facilitate multi-directional migrations between eDirectory and AD.', '<p>NTS Directory Services Migration Utility Created to help facilitate migrations from AD to eDirectory, eDirectory to AD. Queries LDAP server, updates necessary attributes for ALL Filr MySQL users.</p><p>This is based on CN, the user''s name. Finds all users at specified base search and below. If LDAP returns a user that is found in MySQL based on their CN/username, it will be updated.</p>', 'https://github.com/tdharris/bashScripts/tree/master/nts-directoryMigration.sh'),
(9, 6, 'pocketBook', 'Web-Dev', 'Single Page App (SPA) for mobile to store receipts, pictures and tag them.', '&lt;p&gt;Single Page Mobile App (SPA) to store receipts and pictures and tag them.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;100% JavaScript, no jQuery used&lt;/li&gt; &lt;li&gt;Library, Receipt and MultiSelect created using Prototypes&lt;/li&gt; &lt;li&gt;A HashMap Handler leveraged to handle all requests/behavior - keys are actions and values are functions&lt;/li&gt; &lt;li&gt;Library is saved using localStorage&lt;/li&gt; &lt;li&gt;Hammer.js library used to work with touch gestures&lt;/li&gt; &lt;/ul&gt;', 'https://github.com/tdharris/pocketBook'),
(10, 5, 'elephant', 'Java', 'Java server and client (Android mobile application) demonstration.', 'Java based server and mobile application development. Experimenting with several technologies and methodologies:<ul>\r\n			<li>Java Collections</li>\r\n			<li>Java Beans</li>\r\n			<li>Hibernate</li>\r\n			<li>JSON</li>\r\n			<li>Socket IO</li>\r\n			<li>Android HTTP</li>\r\n			<li>UML</li>\r\n			<li>JUNIT Testing</li>\r\n			<li>Android UI</li>\r\n			<li>Parallel Processing</li>\r\n			<li>Modern Software Designs</li>\r\n			<li>Model View Controller</li>\r\n		</ul>\r\n		Our steps were to:\r\n		<ol>\r\n			<li>"Play" with the technology</li>\r\n			<li>Think</li>\r\n			<li>Design</li>\r\n			<li>Create Tests</li>\r\n			<li>Create Solution</li>\r\n		</ol>', 'https://github.com/tdharris/elephant'),
(11, 7, 'tdharris.net', 'Web-Dev', 'A site to showcase my projects - built with PHP, HTML, CSS, JS.', 'A site to showcase my projects - built with PHP, HTML, CSS, JS. &lt;br&gt; &lt;i&gt;Note: No PHP Libraries were used in this project and content is dynamically generated from a MySQL database.&lt;/i&gt; &lt;h2&gt;My Portfolio&lt;/h2&gt; &lt;ul&gt; &lt;li&gt;Highlights projects that I\\''ve worked on with screenshots, github links, descriptions, etc.&lt;/li&gt; &lt;/ul&gt; &lt;h2&gt;MySQL&lt;/h2&gt; &lt;ul&gt; &lt;li&gt;Created my own PHP Class to handle all Database Interactions via PDO_MYSQL&lt;/li&gt; &lt;li&gt;Queries take a SQL statement with named placeholders, an array of parameters that are used to create these named placeholders, and a fetchmode.&lt;/li&gt; &lt;li&gt;All content in the site is generated from the DB (nav, about, portfolio, projects, etc.)&lt;/li&gt; &lt;li&gt;Content can be managed entirely through db interractions that have been defined in the Database Class&lt;/li&gt; &lt;/ul&gt; &lt;h2&gt;Administration&lt;/h2&gt; &lt;ul&gt; &lt;li&gt;Features an Admin Section for Content Management (Add, Edit, Delete)&lt;/li&gt; &lt;li&gt;Image file upload and deletion, stored locally, fileIDs randomly generated and kept track of in MySQL&lt;/li&gt; &lt;li&gt;Passwords are randomly salted, encrypted using the Blowfish algorithm, hashed with the salt -&gt; MySQL.&lt;/li&gt; &lt;li&gt;Session logins to prevent from having to continually log-in&lt;/li&gt; &lt;/ul&gt;', 'https://github.com/tdharris/cit336-tdharris'),
(12, 8, 'tmessenger', 'Web-Dev', 'An example web-chat application build on NodeJS and Socket.IO.', '<p>An example web-chat application build on NodeJS and Socket.IO. Built for a Java class to demonstrate how many fewer lines of code were required to build the same application.</p>', 'https://github.com/tdharris/tmessenger'),
(13, 13, 'checkServices.sh', 'Bash', 'Alert Notification Service for Mobility Administration', '<p>Alert Notification System for DataSync/Mobility Administration</p>\r\n	<p>Notification service if any DataSync services/connectors go offline. The script restarts the services if any are found to be in a dead/unused state and sends an email to the administrator defined in the script file. The notification email contains the following information:</p>\r\n	<ul>\r\n		<li>hostname of server</li>\r\n		<li>date/time when services were found offline</li>\r\n		<li>the list of services found offline</li>\r\n		<li>status of services after a restart attempt</li>\r\n		<li>the current log levels</li>\r\n		<li>an attachment with a copy of all the logs and other server information</li>\r\n	</ul>\r\n	<p>Running the script manually displays the following and will appear in the notification email:</p>\r\n	<pre>\r\n		Checking for DataSync Config Engine:		running\r\n		Checking for DataSync Web Admin:			running\r\n		Checking for DataSync Connector Manager:	running\r\n		Checking for DataSync Engine:				running\r\n		Mobility Connector listening on port 443:	true\r\n		GroupWise Connector listening on port 4500: true\r\n	</pre>\r\n	<p>When implemented with crontab, the script can be set to run every hour, for example. This allows an administrator to be notified of a failure before users complain. Edit the script file and replace <a href="mailto:email@address.com">email@address.com</a> with the desired administrator’s email. You can likewise configure a list of email address by placing them in single quotes separated by a comma and a space – ‘email1, email2, email3′</p>\r\n	<p>To run the script regularly with crontab, just place the script file into /etc/cron.hourly to run hourly or /etc/cron.daily to run daily. Custom definitions can be made by editing the crontab file manually:</p>\r\n	<pre>crontab -e</pre>\r\n	<p>An example of running the script every 30 minutes:</p>\r\n	<pre>0 30 * * * /root/scripts/checkServices.sh</pre>', 'https://github.com/tdharris/bashScripts/tree/master/checkServices');
