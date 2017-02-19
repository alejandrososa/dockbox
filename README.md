DockBox
==========

DockBox es un entorno de desarrollo PHP con Docker. El objetivo es facilitar el desarrolo de aplicación PHP con la tecnología de Docker.

<blockquote>
Contiene las herramientas basicas para que hagas de tus desarrollos lo más comodo sin la necesidad de instalarte software u otras tecnologías en tu maquina.
</blockquote>

## ¿Qué hay en el entorno ecológico de desarrollo?**

* [Ubuntu 16.04](https://www.ubuntu.com/)
* [PHP 7.0](http://php.net/manual/es/migration70.new-features.php)
* [MySql 8.0](http://www.mysql.com/)
* [MongoDB 3.4](http://www.mongodb.org/)
* [MariaDb 10.0](https://mariadb.org/)
* [Postgres 9.6.1](https://www.postgresql.org/)
* [Postgis 2.0](http://www.postgis.net/)
* [Elasticsearch 5.1.2](http://www.elasticsearch.org/)
* [Redis 3.2](http://redis.io/)
* [PHPMyAdmin 4.6.6](https://www.phpmyadmin.net/)
* [PGAdmin 4 v1.1](https://www.pgadmin.org/)

## Requerimientos

* [Docker Engine](https://docs.docker.com/installation/)
* [Docker Compose](https://docs.docker.com/compose/)
* [Docker Machine](https://docs.docker.com/machine/) (Mac and Windows only)

## Instalar Docker en Ubuntu

Ver documentación oficial [Docker](https://docs.docker.com/engine/installation/)

Agregar el deb de docker a nuestro listado de software

    sudo apt-get update
    sudo apt-get install apt-transport-https ca-certificates
    sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
    sudo echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list
    sudo apt-get update

Instalar docker engine
    
    sudo apt-cache policy docker-engine
    sudo apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual
    sudo apt-get install docker-engine
    sudo curl -L "https://github.com/docker/compose/releases/download/1.9.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

Dar permisos a usuarios
 
    sudo chmod +x /usr/local/bin/docker-compose
    sudo usermod -aG docker $USER

Iniciar el servicio de docker

    sudo service docker start  {start|stop|restart|status}

Configure Docker to start on boot

    sudo systemctl enable docker

## Instalación

Elije la configuración que más se ajuste a tus necesidades.

**A) el programa de instalación a un proyecto concreto:**

(En caso de que quiera un ambiente acoplable para cada proyecto)

A.1) Entorno de instalación en proyecto existente:**

(En caso de que ya tiene un proyecto y desea configurar un entorno para ejecutarlo)

1 - Clonar este repositorio en el directorio raíz del proyecto:

    submódulo git add https://github.com/alejandrososa/dockbox.git

<blockquote>Si no está utilizando Git para su proyecto PHP, se puede utilizar git clone en lugar de git submodule.</blockquote>
Nota: En este caso la estructura de carpetas será así:

    - /var/www/html/aplicacion1
        - dockbox
        
    - /var/www/html/aplicacion2
        - dockbox
        
A.2) entorno de configuración primero y luego crear el proyecto:

(En caso de que no tenga un proyecto y desea crear su proyecto dentro del entorno docker)

1 - clonar este repositorio en cualquier lado de tu máquina:

    git clone https://github.com/alejandrososa/dockbox.git
    
Nota: En este caso la estructura de carpetas será así:

    - /var/www/html/
        - dockbox
        - aplicacion1
        - aplicacion2
    
2 - Editar el `docker-compose.yml` para asignar el directorio del proyecto una vez que lo tenga (ejemplo: `- ../aplicacion1:/var/www`).

3 - Detener y volver a ejecutar el comando `docker-compose para que los cambios tengan efecto.

    docker-compose stop && docker-compose up -d XXXX YYYY ZZZZ ....

**B) Configuración de Proyectos Múltiples:**

1 - clonar este repositorio en cualquier lado de tu máquina:

    git clone https://github.com/alejandrososa/dockbox.git

2 - editar el `docker-compose.yml` para asignar los directorios de proyectos:

    aplicaciones:
        image: tianon/true
        volumes:
            - ../aplicacion1/:/var/www/aplicacion1
            - ../aplicacion2/:/var/www/aplicacion2
            
3 - Se puede acceder a todos los sitios por visitar http://localhost/aplicacion1/public y http://localhost/aplicacion2/public pero por supuesto que no es muy útil por lo que vamos a php configurar rápidamente.

4 - Ir a php/sites y copiar ejemplo.conf a aplicacion1.conf continuación, aplicacion2.conf

5 - Abrir el virtual host `aplicacion1.conf` y editar el `ServerName` y el `DocumentRoot` de la siguiente manera:

    ServerName aplicacion1.dev
    DocumentRoot /var/www/aplicacion1/public
    
Haga lo mismo para cada proyecto `aplicacion2.conf`, `aplicacion3.conf`, ...

6 - Añadir los dominios a tu **hosts**.

    127.0.0.1  aplicacion1.dev
    
7 - Crear las bases de datos del proyecto. En este momento hay que hacerlo de forma manual mediante la introducción de su contenedor DB.

## Levantar nuestro entorno

El primer paso antes de levantar nuestro entorno es crear una key de seguridad con ssh-keygen, no te preocupes, lo explico todo en [SSH](docs/SSH.md).
Ahora que ya tienes tu key-ssh, continúa las indicaciones.

Ir al raíz de nuestro dockbox una vex descargado y ejecutar

    $ docker-compose up -d mysql php servidor
    
Puedes combinar según tu necesidad los siguientes contenedores: `servidor`, `mysql`, `php`, `postgres`, `postgres-postgis`, `mariadb`, `mongo`, `phpmyadmin`, `pgadmin`, `redis`, `elasticsearch`
    
    $ docker-compose up -d php servidor postgres redis elasticsearch
    
## Contenedores
    
Ya tenemos nuestro entorno de desarrollo ya está creado y levantado, pero la pregunta es ¿de qué disponemos en los contenedores para desarrollar?.
 
**Servidor**<br>
A nivel global en el contenedor encontrarás:
- Php 7.0
- Composer
- PhpUnit 5.7
- Codecept
- Deployer
- Git
- Symfony
- Laravel
- Yii 2 (debe instalar yiisoft con el token)
- NodeJs
- Less
- Sass
- Webpack
- TypeScript
- XDebug
- Curl
- Json
- Mbstring
- Sqlite3
- Vim
- Nano
- Ruby
- Pear

**PHP**<br>
- Php 7.0
- Apache2
- XDebug
- OPCache
- Soap
- Redis
- MongoDb
- Zip
- Bcmath
- Mysqli
- Tokenizer
- GD
- PDO 
- PDO Mysql
- PDO Postgres
- Pgsql
- Pear

**Mysql**<br>
- Mysql

**Postgres**<br>
- Postgresql


    
    
## Configuración con PHPStorm

Ver la documentación e imagenes en el directorio docs

* [Comandos Alias](docs/ComandosAlias.md)
* [SSH](docs/SSH.md)
* [XDebug](docs/XDebug.md)
* [Host](docs/HostMachine.md)
* [JavaScript](docs/JavaScript.md)
* [MySql](docs/MySql.md)
* [PostgreSql](docs/PostgreSql.md)

## Log de cambios
- 19/02/2017 - Configuración y documentación para realizar backup de Mysql y Postgresql.
- 19/02/2017 - Corrección de persistencia de datos en postgres.
- 11/02/2017 - Corrección de permisos de usuario desarrollador en el contenedor servidor.
- 05/02/2017 - Instalación de librerías Js al contenedor servidor.

## Licencia

Copyright &copy; 2017 [Alejandro Sosa](http://github.com/alejandrososa). Licencia bajo los terminos [MIT license](LICENSE.md).