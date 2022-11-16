<?php
require_once './app/models/mainModel.php';
require_once './app/models/articleModel.php';
require_once './app/models/categoryModel.php';
require_once './app/views/apiView.php';

class ArticleApiController{
    private $articleModel;
    private $view;
    private $data;
    private $categoryModel;
    private $offset;
    private $limit;
    private $category;
    private $columns;
    private $sort;
    private $order;

    public function __construct() {
        $this->articleModel = new ArticleModel();
        $this->categoryModel = new CategoryModel();
        $this->view = new ApiView();
        $this->data = file_get_contents("php://input");
        $this->offset = 0;
        $this->columns = ['id', 'nombre', 'precio', 'descripcion', 'stock'];
        $this->sort = 'id';
        $this->order = 'ASC';
        $this->limit = $this->getArticlesQuantity();
    }
    
    private function getData(){
        return json_decode($this->data);
    }
    
    //API/ARTICULOS(GET)
    public function getAll($params = null){

        $this->getPaginationValues();
        $this->getFilterValue();
        $this->getSortValue();
        $this->getOrderValue();

        if($this->category == null){
            $articles = $this->articleModel->getAllArticles($this->sort, $this->order);
            if($articles){
                $this->view->response(array_slice($articles, $this->offset, $this->limit), 200);
            }else{
                $this->view->response("No encontrado",404);
            }
        } else {
            $articles = $this->articleModel->getArticlesByCategory($this->category);
            if($articles){
                $this->view->response(array_slice($articles, $this->offset, $this->limit), 200);
            }
            else{
                $this->view->response("Categoria por id={$this->category} inexistente",404);
            }
        }
    }

    //dentro hago paginacion y filtrado 
    //API/ARYICULOS/:ID (GET)
    public function getArticleById($params = null){
        $id = $params[':ID'];
        $article = $this->articleModel->getArticleById($id);
        if ($article){
            $this->view->response($article, 200);
        }
        else{
            $this->view->response(" id={$id} no encontrado",404);
        }   
    }

    //API/ARTICULOS/:ID (DELETE)
    public function remove($params = null){
        $id = $params[':ID'];
        $article = $this->articleModel->getArticleById($id);

        if ($article){
            $this->articleModel->deleteArticle($id);
            $this->view->response("Articulo con  id={$id} eliminado", 200);
        }
        else{
            $this->view->response("id={$id} no encontrado",404);
        }
    }

    //API/ARTICULOS (POST)
    public function addArticle($params = null){
        //devuelvo obj json enviado por post
        $body = $this->getData();
        $nombre = $body->nombre;
        $precio = $body->precio;
        $descripcion = $body->descripcion;
        $stock = $body->stock;
        $categoria = $body->id_categoria_fk;
        //inserto articulo
        if(!empty($nombre)||!empty ($precio)|| !empty($descripcion) || !empty($stock) || !empty ($id_categoria_fk)){
            //devuelvo el id de lo que agrega
            $checkcategoria = $this->categoryModel->getCategoryById($categoria);
            if($checkcategoria){
                $id = $this->articleModel->insertArticle($nombre, $precio, $descripcion, $stock, $categoria);
                $article = $this->articleModel->getArticleById($id);
                $this->view->response($article, 201);
            }else{
                $this->view->response("El articulo no fue creado", 400);
            }
        }
        else{
            $this->view->response("El articulo no fue creado", 400);
        }
    }

    //API/ARTICULOS/:ID (PUT)
    public function updateArticle($params = null) {
        $id = $params[':ID'];
        $article = $this->articleModel->getArticleById($id);

        if ($article) {
            $body = $this->getData();
            $nombre = $body->nombre;
            $precio = $body->precio;
            $descripcion = $body->descripcion;
            $stock = $body->stock;
            $categoria = $body->id_categoria_fk;
            if(!empty($nombre)||!empty ($precio)|| !empty($descripcion) || !empty($stock) || !empty ($id_categoria_fk)){
                $checkcategoria = $this->categoryModel->getCategoryById($categoria);
                if($checkcategoria){
                    $this->articleModel->updateArticle($id, $nombre, $precio, $descripcion, $stock, $categoria);
                    $this->view->response($this->articleModel->getArticleById($id), 200);
                }else{
                    $this->view->response("Categoria incorrecta para articulo", 400);
                }
            }else{
                $this->view->response("Ingrese los campos correctamente", 400);
            }
        } else{
            $this->view->response("El articulo con el id={$id} no existe", 404);
        }
    }

    //obtiene los valores de paginacion si se encuentran seteados
    private function getPaginationValues(){
        //verifico que lo que me pase por parametro sea un nro y que sea >=0
        if(isset($_GET['offset']) && isset($_GET['limit'])){
            $offset = $_GET['offset'];
            $limit = $_GET['limit'];
            if(is_numeric($offset) && is_numeric($limit) && ($offset>=0) && ($limit>=0)){
                $this->offset = $offset;
                $this->limit = $limit;
            }            
        }
    }

    //obtiene la cant de articulos que hay en la db
    private function getArticlesQuantity(){
        $articles = $this->articleModel->getAllArticles($this->sort, $this->order);
        return count($articles);
    }
    
    private function getFilterValue(){
        if(isset($_GET['category']))
            $this->category = $_GET['category'];
    }

    private function getSortValue(){
        if (isset($_GET['sort']) && (in_array($_GET['sort'], $this->columns))){
            $this->sort = $_GET['sort'];
        }
    }

    private function getOrderValue(){
        if(isset($_GET['order']) && ($_GET['order'] == 'ASC' || $_GET['order'] == 'DESC')){
            $this->order = $_GET['order'];
        }
    }

}
