<?php

    class MainModel{

        protected $db;

        public function __construct(){
            $this->db = new PDO('mysql:host=localhost;'.'dbname=db_herramientasferreteria;charset=utf8', 'root', '');
        }

        private function connect(){
            return new PDO('mysql:host=localhost;'.'dbname=db_herramientasferreteria;charset=utf8', 'root', '');
        }
    }