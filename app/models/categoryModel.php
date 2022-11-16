<?php
    class CategoryModel extends MainModel{

        function getCategoryById ($id){
            $query = $this->db->prepare('SELECT * FROM categoria WHERE id = ?');
            $query->execute([$id]);
            return $query->fetch(PDO::FETCH_OBJ);
        }
    }