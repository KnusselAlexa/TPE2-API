<?php
//lo unico que hace muestra un json y codigo de error, asi que uso una vista para todo
class ApiView{
//lo que le mando lo convierte a json, es una funcion generica
    public function response($data, $code){
        //ponerse de acuerdo en que lenguaje van a hablar(indica al cliente si no le indico nada tipo texto)
        
        header("Content-Type: applcation/jason");
        header("HTTP/1.1 " . $code . " " . $this->_requestStatus($code));
        echo json_encode($data);
    }

    private function _requestStatus($code){
      $status = array(
        200 => "OK",
        201=> "Created",
        400 => "Bad request",
        404 => "Not found",
        500 => "Internal Server Error"
      );
      return (isset($status[$code]))? $status[$code] : $status[500];
    }
}