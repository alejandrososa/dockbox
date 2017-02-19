# PostgresSql

Hay varias maneras de acceder a postgres y te lo explico en las siguientes lineas...

## A través del contenedor

Una vez que ya has inicializado el contenedor de `postgres` puedes acceder al contenedor con el siguiente comando

    docker-compose exec postgres bash

Dentro del contenedor debes cambiar al usuario `postgres` y luego ejecutar el psql
    
    root@26db16090640:/# su postgres
    $ psql
    
    psql (9.6.2)
    Type "help" for help.
    
    postgres=# 

## Por medio de la consola

Conectarse a postgres desde consola con tu Ip

    psql -h 127.0.0.1 -U dev -W demo
    psql -h 192.168.1.52 -U dev -W demo
    
    
**Nota:** para crear nuevas bases de datos te recomiendo entrar a traves del contenedor...


Configuración con frameworks
====
## Symfony 3

    database_host: 192.168.1.52 <-- tu ip address local
    database_port: 5432
    database_name: landing_viewer_dev
    database_user: dev
    database_password: 123456
    
## Laravel 5

    DB_CONNECTION=postgres
    DB_HOST=postgres
    DB_DATABASE=demo
    DB_USERNAME=dev
    DB_PASSWORD=123456   
         
## Yii 2

    $config = [
        'class' => 'yii\db\Connection',
        'dsn' => 'mysql:host=192.168.1.52;dbname=demo;port=5432;',
        'username' => 'dev',
        'password' => '123456',
        'charset' => 'utf8',
    ];  
     