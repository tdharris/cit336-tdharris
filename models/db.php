<?php 

    // Create Database class
	class Database {
        
        private $host = "showcase.tdharris.net";
        private $user = "tdharris_admin"; 
        private $pass = "mylittlesecret"; 
        private $dbname = "tdharris_showcase";
 
	    public $db;
        private $isConnected = false;
        private $error;
        private $stmt;

        
        public function __construct() { 
            if(!$this->isConnected) { $this->Connect(); }
        }
        
        public function __destruct() {
           $this->db = NULL; // Setting the handler to NULL closes the connection propperly
        }

        private function Connect() {
            $dsn = 'mysql:host=' . $this -> host . ';dbname=' . $this-> dbname . ';charset=utf8';
            $options = array(PDO::ATTR_PERSISTENT => true, PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8");

            try {
                $this -> db = new PDO($dsn, $this -> user, $this -> pass, $options);
                $this -> isConnected = true;
            } catch (PDOException $e) {
                // $this -> error = $e -> getMessage();
                $error_message = $e->getMessage();
                include 'error.php';
                exit;
            }
        }

        public function CloseConnection() {
            // Set the PDO object to null to close the connection
            // http://www.php.net/manual/en/pdo.connections.php
            $this->db = null;
        }

        public function query($sql, $fetchmode = PDO::FETCH_CLASS) {
            // Connect to database if not already connected
            if(!$this->isConnected) { $this->Connect(); }

             try {
                // Prepare query & Execute
                $stmt = $this->db->prepare($sql);
                $stmt->execute();

                // Return depending on SQL statement
                $statement = strtolower(explode(" ", $sql)[0]);

                if ($statement === 'select' || $statement === 'show') {
                return $stmt->fetchAll($fetchmode);
                }
                elseif ( $statement === 'insert' ||  $statement === 'update' || $statement === 'delete' ) {
                    return $stmt->rowCount();   
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
        
	} 

    $db = new Database;

?>