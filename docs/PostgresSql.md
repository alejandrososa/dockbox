## Consola

Conectarse a mysql desde consola con tu Ip

    psql -h 127.0.0.1 -U dev -W demo
    psql -h 192.168.1.52 -U dev -W demo

Confiración con frameworks
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
     