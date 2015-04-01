<?php 

    /* ***************************************
     * Create Database Class
     * **************************************/

    class Database {
        
        private $host = "showcase.tdharris.net";
        private $user = "tdharris_admin"; 
        private $pass = "mylittlesecret"; 
        private $dbname = "tdharris_showcase";
        private $filestore = "/img/projects/";
 
        public $db;
        private $isConnected = false;

        private $stmt;
        private $parameters;
        
        public function __construct() { 
            if(!$this->isConnected) { 
                $this->Connect();
                $this->parameters = array(); 
            }
        }
        
        public function __destruct() {
           $this->db = NULL; // Setting the handler to NULL closes the connection properly
        }

        private function Connect() {
            $dsn = 'mysql:host=' . $this -> host . ';dbname=' . $this-> dbname . ';charset=utf8';
            $options = array(PDO::ATTR_PERSISTENT => true, PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8");

            try {
                $this -> db = new PDO($dsn, $this -> user, $this -> pass, $options);
                $this -> isConnected = true;
            } catch (PDOException $e) {
                $error_message = $e->getMessage();
                http_response_code(500);
                header('Content-Type: application/json; charset=UTF-8');
                echo json_encode($error_message);
                // include 'error.php';
                exit;
            }
        }

        public function CloseConnection() {
            // Set the PDO object to null to close the connection
            $this->db = null;
        }

        public function query($sql, $params = null, $fetchmode = PDO::FETCH_CLASS) {
            // Connect to database if not already connected
            if(!$this->isConnected) { $this->Connect(); }

             try {
                $this->parameters = array();
                // Prepare query
                $this->stmt = $this->db->prepare($sql);
               
               // Bind params
                if(!empty($params)) {
                    // Add params to $this->parameters
                    $this->bindMore($params);

                    // Create named placeholders from the db parameter array
                    if(!empty($this->parameters)) {
                        foreach($this->parameters as $param) {
                            $this->stmt->bindValue($param['param'],$param['value']);
                        }       
                    }
                }
                
                $this->stmt->execute();

                // Return depending on SQL statement
                $statement = strtolower(explode(" ", $sql)[0]);

                if ($statement === 'select' || $statement === 'show') {
                    return $this->stmt->fetchAll($fetchmode);
                }
                elseif ( $statement === 'insert' ||  $statement === 'update' || $statement === 'delete' ) {
                    return $this->stmt->rowCount();   
                }   
                else {
                    return NULL;
                }
            } catch(PDOException $e) {
                $error_message = $e->getMessage();
                http_response_code(500);
                header('Content-Type: application/json; charset=UTF-8');
                echo json_encode($error_message);
                // include 'error.php';
                exit;
            }
            
        }

        // Append a single param to $this->parameters: [ ["param"=>$param, "value"=>$value], [], [] ]
        public function bind($param, $value) {   
            $this->parameters[sizeof($this->parameters)] = array("param"=>":".$param, "value"=>utf8_encode($value));
        }

        // Append a list of params to $this->parameters
        public function bindMore($parray) {
            if(empty($this->parameters) && is_array($parray)) {
                // Grab all the keys from the array, these will be column names
                $columns = array_keys($parray);
                foreach($columns as $i => &$column) {
                    // fetch the value of column and bind column name to its' value
                    $this->bind($column, $parray[$column]);
                }
            }
        }

        /* ***************************************
         * Models for table interactions
         * **************************************/
        public function getNav() {
            return $this->query("SELECT * FROM nav;");
        }

        public function getAboutMe() {
            return $this->query("SELECT * FROM about LIMIT 1;")[0];
        }

         /* ***************************************
         *  Portfolio / Projects
         * **************************************/
        public function getPortfolio() {
            return $this->query("SELECT * from projects p 
                                    LEFT JOIN images i ON p.projectID = i.projectID 
                                    WHERE i.featured IS NOT NULL
                                    ORDER BY p.sortOrder ASC;");
        }

        public function addProject($projectName, $category, $githubURL, $brief, $description, $images) {
            if(isset($projectName, $category, $githubURL, $brief, $description, $images)) {
                // addProject
                $this->query("INSERT INTO projects 
                                (projectName, category, githubURL, brief, description) VALUES 
                                (:projectName, :category, :githubURL, :brief, :description);",
                                array("projectName"=>$this->mysql_escape_mimic($projectName), "category"=>$this->mysql_escape_mimic($category), "githubURL"=>$this->mysql_escape_mimic($githubURL),
                                    "brief"=>$this->mysql_escape_mimic($brief), "description"=>$this->mysql_escape_mimic($description)));
                
                // get projectID
                $projectID = $this->getProject($projectName)->projectID;

                // addImages
                if(!empty($images)) {
                    $this->addImages($projectID, $images);
                }

            }
            
        }

        public function deleteProject($projectID) {
            if(isset($projectID)) {
                $this->deleteImagesByProject($projectID);
                $this->query("DELETE FROM projects
                                WHERE projectID = :projectID;", array("projectID"=>$this->mysql_escape_mimic($projectID)));
            }
        }

        public function editProject($projectID, $category, $githubURL, $brief, $description) {
            if(isset($projectID, $category, $githubURL, $brief, $description)) {
                $this->query("UPDATE projects
                                SET category = :category, githubURL = :githubURL, brief = :brief, description = :description
                                WHERE projectID = :projectID;", array("projectID"=>$this->mysql_escape_mimic($projectID), "category"=>$this->mysql_escape_mimic($category), "githubURL"=>$this->mysql_escape_mimic($githubURL),
                                    "brief"=>$this->mysql_escape_mimic($brief), "description"=>$this->mysql_escape_mimic($description)));
            }

        }

        public function getProject($projectName) {
            return $this->query('SELECT * FROM projects WHERE projectName=\''.$this->mysql_escape_mimic($projectName).'\';')[0];
            // return $this->query("SELECT * FROM projects WHERE projectName = :projectName;",
                                        // array("projectName"=>$projectName))[0];
        }

        public function getProjectList() {
            return $this->query("SELECT projectName from projects ORDER BY sortOrder ASC;", null, PDO::FETCH_ASSOC);
        }

         /* ***************************************
         *  Images
         * **************************************/
        public function addImages($projectID, $images) {
            // $images = ['url', '', '']; 
            $projectID = $this->mysql_escape_mimic($projectID);
            if (is_array($images)) {
                // Insert first img as a featured img
                $featuredImg = array_shift($images);

                $this->query("INSERT INTO images (projectID, featured, url) 
                                VALUES (:projectID, '', :url);",
                                    array("projectID"=>$projectID, "url"=>$featuredImg));

                // Insert any other images
                foreach ($images as $img) {
                    $this->query("INSERT INTO images (projectID, url) VALUES
                                    (:projectID, :url);",
                                    array("projectID"=>$projectID, "url"=>$img));
                };
                
            };
            
        }

        public function deleteImagesByProject($projectID) {
            $projectID = $this->mysql_escape_mimic($projectID);
            if (isset($projectID)) {
                $images = $this->query("SELECT imageID, url FROM images 
                                            WHERE projectID = :projectID", array("projectID"=>$projectID), PDO::FETCH_ASSOC);
                print_r($images['url']);
                foreach($images as $img) {
                    unlink($_SERVER['DOCUMENT_ROOT'].$this->filestore.$img['url']);
                };

                return $this->query("DELETE FROM images
                                        WHERE projectID = :projectID;", array("projectID"=>$projectID));
            };
        }

        public function getUnfeaturedImages($projectID) {
            return $this->query('SELECT i.url FROM images i
                                    RIGHT OUTER JOIN projects p ON i.projectID = p.projectID
                                    WHERE i.projectID = :projectID 
                                    AND i.featured IS NULL', 
                                array("projectID"=>$projectID), PDO::FETCH_ASSOC);
        }   

        // Utility
        public function mysql_escape_mimic($inp) { 
            if(is_array($inp)) 
                return array_map(__METHOD__, $inp); 

            if(!empty($inp) && is_string($inp)) { 
                return str_replace(array('\\', "\0", "\n", "\r", "'", '"', "\x1a"), array('\\\\', '\\0', '\\n', '\\r', "\\'", '\\"', '\\Z'), $inp); 
            } 

            return $inp; 
        } 


        
    } 

    $db = new Database;

?>