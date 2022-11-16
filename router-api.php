<?php
include_once 'libreria/Router.php';
include_once './app/controllers/articleApiController.php';

//creo el router
$router = new Router();

//defino mi tabla de ruteo
$router->addRoute('/articulos', 'GET', 'ArticleApiController', 'getAll');
$router->addRoute('/articulos/:ID', 'GET', 'ArticleApiController', 'getArticleById');
$router->addRoute('/articulos/:ID', 'DELETE', 'ArticleApiController', 'remove');
$router->addRoute('/articulos', 'POST', 'ArticleApiController', 'addArticle');
$router->addRoute('/articulos/:ID', 'PUT', 'ArticleApiController', 'updateArticle');

//Ruteo
$resource = $_GET['resource'];
$method = $_SERVER['REQUEST_METHOD'];
$router->route($resource, $method);
