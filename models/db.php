<?php 

    /* ***************************************
     * Create Database Class
     * **************************************/
	class Database {
        
        private $host = "showcase.tdharris.net";
        private $user = "tdharris_admin"; 
        private $pass = "mylittlesecret"; 
        private $dbname = "tdharris_showcase";
 
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
                include 'error.php';
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
                include 'error.php';
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

        public function getPortfolio() {
            return $this->query("SELECT * from projects p 
                                    LEFT JOIN images i ON p.projectID = i.projectID 
                                    WHERE i.featured IS NOT NULL
                                    ORDER BY p.sortOrder ASC;");
        }

        public function getProject($projectName) {
            return $this->query('SELECT * FROM projects WHERE projectName=\''.$projectName.'\';')[0];
        }

        public function getUnfeaturedImages($projectID) {
            return $this->query('SELECT i.url FROM images i
                                    RIGHT OUTER JOIN projects p ON i.projectID = p.projectID
                                    WHERE i.projectID = :projectID 
                                    AND i.featured IS NULL', 
                                array("projectID"=>$projectID), PDO::FETCH_ASSOC);
        }   
        
	} 

    $db = new Database;

?>