<?php

    class ArticleModel extends MainModel{

        
        function getAllArticles($sortValue, $orderValue){
            $query = $this->db->prepare('SELECT articulos.id, articulos.nombre, articulos.descripcion,
            articulos.precio, articulos.stock FROM articulos ORDER BY '.$sortValue.' '.$orderValue);//inyect sql
            $query->execute();
            return $query->fetchAll(PDO::FETCH_OBJ);
        }

        function getArticleById($id){
            $query = $this->db->prepare('SELECT articulos.id, articulos.nombre, articulos.descripcion,
            articulos.precio, articulos.stock FROM articulos WHERE id = ? ');
            $query->execute([$id]);
            return $query->fetch(PDO::FETCH_OBJ);
        }

        public function insertArticle($nombre, $precio, $descripcion, $stock, $categoria) {
            $query = $this->db->prepare('INSERT INTO articulos(nombre, precio, descripcion, stock, id_categoria_fk) VALUES(?,?,?,?,?)');
            $query->execute([$nombre, $precio, $descripcion, $stock, $categoria]);

            return $this->db->lastInsertId();
        }

        function deleteArticle($id){
            $query = $this->db->prepare('DELETE FROM articulos WHERE id = ?');
            $query->execute([$id]);
        }

        function updateArticle($id, $name, $amount, $description, $stock, $id_category_fk){
            $query = $this->db->prepare('UPDATE articulos SET nombre = ? , precio = ?, descripcion = ?, stock = ?, id_categoria_fk = ? WHERE id = ?');
            $query->execute([$name, $amount, $description, $stock, $id_category_fk, $id]);
        }

        function getArticlesByCategory($category){
            $query = $this->db->prepare('SELECT articulos.id, articulos.nombre, articulos.descripcion,
            articulos.precio, articulos.stock, categoria.nombre_c FROM articulos JOIN categoria ON articulos.id_categoria_fk = categoria.id WHERE id_categoria_fk = ? ');
            $query->execute([$category]);
            return $query->fetchAll(PDO::FETCH_OBJ);
        }

}
