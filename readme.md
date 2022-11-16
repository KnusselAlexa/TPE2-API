# API-REST

La descripcion de la API-REST se encuentra debajo.

URL: `http://localhost/Web2/TPE2/api/articulos`

## GET Obtener articulos

### Request

`GET /articulos`

    Obtiene una lista con todos los articulos disponibles.

`GET /articulos?sort=precio&order=desc`

    Obtiene una lista con todos los articulos disponibles ordenados por una columna y orden especificado.

`GET /articulos?offset=6&limit=3`

    Obtiene una lista de tamaño limitado por los parametros de paginacion. Offset determina el articulo desde el que inicia y limit la cantidad a mostrar.

`GET /articulos?category=6`

    Obtiene una lista filtrada por categoria. Las categorias seran especificadas a continuacion.
    1 - Palas
    2 - Construccion
    3 - Agro
    4 - Frutihorticola
    5 - Mecanica
    6 - Almacenamiento

### Response

#### 200

    HTTP/1.1 200 OK
    Status: 200 OK
    Content-Type: application/json
    [{
        "id": 4,
        "nombre": "Tenaza",
        "descripcion": "Forjada en acero",
        "precio": 4290,
        "stock": 24
    },{
        ...
    }]

#### 404

    HTTP/1.1 404 Not found
    Status: 404 Not found
    "Objeto no encontrado"

## POST Crea nuevo articulo

### Request

`POST /articulos`

    Crea un nuevo articulo.

    {
        "nombre": String,
        "precio": double,
        "descripcion": String,
        "stock": int,
        "id_categoria_fk": int
    }

    Categorias:

        1 - Palas
        2 - Construccion
        3 - Agro
        4 - Frutihorticola
        5 - Mecanica
        6 - Almacenamiento

### Response

#### 201 Created

    HTTP/1.1 201 Created
    Status: 201 Created
    Content-Type: application/json

    {
        "id": 4,
        "nombre": "Tenaza",
        "descripcion": "Forjada en acero",
        "precio": 4290,
        "stock": 24
    }

#### 400 Bad Request

    HTTP/1.1 400 Bad Request
    Status: Bad Request

    "El articulo no fue creado"

## GET Obtiene articulo por id

### Request

`GET /articulos/id`

    Obtiene un articulo especifico filtrado por id.

### Response

#### 200 OK

    HTTP/1.1 200 OK
    Status: 200 OK
    Content-Type: application/json

    {
        "id": 4,
        "nombre": "Tenaza",
        "descripcion": "Forjada en acero",
        "precio": 4290,
        "stock": 24
    }

#### 404 Not found

    HTTP/1.1 404 Not found
    Status: 404 Not found
    "Objeto no encontrado"

## PUT Modifica un articulo

### Request

`PUT /articulos/id`

    {
        "nombre": String,
        "precio": double,
        "descripcion": String,
        "stock": int,
        "id_categoria_fk": int
    }

    Categorias:

        1 - Palas
        2 - Construccion
        3 - Agro
        4 - Frutihorticola
        5 - Mecanica
        6 - Almacenamiento

### Response

#### 200 OK

    HTTP/1.1 200 OK
    Status: 200 OK
    Content-Type: application/json

    {
        "id": 4,
        "nombre": "Tenaza",
        "descripcion": "Forjada en acero",
        "precio": 4290,
        "stock": 24
    }

#### 400 Bad Request

    HTTP/1.1 400 Bad Request
    Status: Bad Request

    "Ingrese los campos correctamente"

#### 404 Not found

    HTTP/1.1 404 Not found
    Status: 404 Not found
    "El articulo con el 'id' no existe."

## DELETE Elimina un articulo

### Request

`DELETE /articulos/id`

    Elimina el articulo indicado mediando id.

### Response

#### 200 OK

    HTTP/1.1 200 OK
    Status: 200 OK

    "Articulo con 'id' eliminado"

#### 404 Not found

    HTTP/1.1 404 Not found
    Status: 404 Not found
    "'id' no encontrado."