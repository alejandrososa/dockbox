## Consola

Conectarse a mysql desde consola

    mysql -h 127.0.0.1 -u root -p
    mysql -h 192.168.1.52 -u root -p

Confiración con frameworks
====
## Symfony 3

    database_host: 192.168.1.52 <-- tu ip address local
    database_port: 3306
    database_name: landing_viewer_dev
    database_user: root
    database_password: root
    
## Laravel 5

    DB_CONNECTION=mysql
    DB_HOST=mysql
    DB_DATABASE=demo
    DB_USERNAME=root
    DB_PASSWORD=root   
         
## Yii 2

    $config = [
        'class' => 'yii\db\Connection',
        'dsn' => 'mysql:host=127.0.0.1;dbname=demo',
        'username' => 'root',
        'password' => 'root',
        'charset' => 'utf8',
    ];  
     