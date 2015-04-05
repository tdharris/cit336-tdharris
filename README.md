# tdharris.net
A site to showcase my projects - built with PHP, HTML, CSS, JS. 
<br><i>Note: No PHP Libraries were used in this project and content is dynamically generated from a MySQL database.</i>

<h5>My Portfolio</h5>
<ul>
<li>Highlights projects that I've worked on with screenshots, github links, descriptions, etc.</li>
</ul>

<h5>MySQL</h5>
<ul>
<li>Created my own PHP Class to handle all Database Interactions via PDO_MYSQL</li>
<li>Queries take a SQL statement with named placeholders, an array of parameters that are used to create these named placeholders, and a fetchmode.</li>
<li>All content in the site is generated from the DB (nav, about, portfolio, projects, etc.)</li>
<li>Content can be managed entirely through db interractions that have been defined in the Database Class</li>
</ul>

<h5>Administration</h5>
<ul>
<li>Features an Admin Section for Content Management (Add, Edit, Delete)</li>
<li>Image file upload and deletion, stored locally, fileIDs randomly generated and kept track of in MySQL</li>
<li>Passwords are randomly salted, encrypted using the Blowfish algorithm, hashed with the salt -> MySQL.</li>
<li>Session logins to prevent from having to continually log-in</li>
</ul>

Final Project for CIT 336: Web Backend Development. Here are a few screenshots:

![alt tag](http://i.imgur.com/WYHCH3O.png)
![alt tag](http://i.imgur.com/nuyFsb7.png)
![alt tag](http://i.imgur.com/lSmPIoH.png)
![alt tag](http://i.imgur.com/mlDE2Jp.png)
