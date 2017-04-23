DockBox
==========

DockBox es un entorno de desarrollo PHP con Docker. El objetivo es facilitar el desarrolo de aplicación PHP con la tecnología de Docker.

<blockquote>
Contiene las herramientas basicas para que hagas de tus desarrollos lo más comodo sin la necesidad de instalarte software u otras tecnologías en tu maquina.
</blockquote>

## ¿Qué hay en el entorno ecológico de desarrollo?

* [Ubuntu 16.04](https://www.ubuntu.com/)
* [Apache 2.4](https://httpd.apache.org/)
* [NGinx 12](https://www.nginx.com/)
* [PHP 5.6](http://php.net/manual/es/migration56.new-features.php)
* [PHP 7.0](http://php.net/manual/es/migration70.new-features.php)
* [PHP 7.1](http://php.net/manual/es/migration71.new-features.php)
* [MySql 5.7](http://www.mysql.com/)
* [Mssql 2016](https://www.microsoft.com/en-us/sql-server/sql-server-2016-editions)
* [MongoDB 3.4](http://www.mongodb.org/)
* [MariaDb 10.0](https://mariadb.org/)
* [Postgres 9.6.1](https://www.postgresql.org/)
* [Postgis 2.0](http://www.postgis.net/)
* [Elasticsearch 5.1.2](http://www.elasticsearch.org/)
* [Redis 3.2](http://redis.io/)
* [PHPMyAdmin 4.6.6](https://www.phpmyadmin.net/)
* [PGAdmin 4 v1.1](https://www.pgadmin.org/)
* [Jenkins 2.32](https://jenkins.io)
* [Jira 7.3.4](https://es.atlassian.com/software/jira)

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

## Instalación del Dockbox

Elije la configuración que más se ajuste a tus necesidades.

**Configuración de Proyectos Múltiples::**

1 - clonar este repositorio en cualquier lado de tu máquina:

    git clone https://github.com/alejandrososa/dockbox.git
    
Nota: En este caso la estructura de carpetas será así:

    - /var/www/html/
        - dockbox
        - aplicacion1
        - aplicacion2
    
2 - Copia el fichero de configuración de ejemplo `.env-example` a `.env` para tener toda la configuración de los contenedores.
    
    cp .env-example .env

3 - Ejecutar el comando `docker-compose` para que los cambios tengan efecto.

    docker-compose up -d XXXX YYYY ZZZZ ....

4 - Se puede acceder a todos los sitios por visitar http://localhost/aplicacion1/public y http://localhost/aplicacion2/public pero por supuesto que no es muy útil por lo que vamos a php configurar rápidamente.

Haga lo mismo para cada proyecto `aplicacion2.conf`, `aplicacion3.conf`, ...

6 - Añadir los dominios a tu **hosts**.

    127.0.0.1  aplicacion1.dev
    
7 - Crear las bases de datos del proyecto. En este momento hay que hacerlo de forma manual mediante la introducción de su contenedor DB.

<blockquote>
Si modificas el fichero docker-compose.yml, .env o cualquier Dockerfile, debes hacer un re-build del conentenedor modificado, para ver cambios efectuados.
</blockquote>

## Levantar nuestro entorno

El primer paso antes de levantar nuestro entorno es crear una key de seguridad con ssh-keygen, no te preocupes, lo explico todo en [SSH](docs/SSH.md).
Ahora que ya tienes tu key-ssh, continúa las indicaciones.

Ir al raíz de nuestro dockbox una vex descargado y ejecutar

    $ docker-compose up -d mysql apache2
    
Puedes combinar según tu necesidad los siguientes contenedores: `apache2`, `nginx`, `mysql`, `mssql`, `postgres`, `postgres-postgis`, `mariadb`, `mongo`, `phpmyadmin`, `pgadmin`, `redis`, `elasticsearch`, `rabbitmq`, `jenkins`, `jira`, `php-worker` 
    
    $ docker-compose up -d apache2 postgres redis elasticsearch
    
## Contenedores
    
Ya tenemos nuestro entorno de desarrollo ya está creado y levantado, pero la pregunta es ¿de qué disponemos en los contenedores para desarrollar?.
 
**Servidor**<br>
A nivel global en el contenedor encontrarás:
- Php 5.6, 7.0, 7.1
- Php cli
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
- V8JS
- XDebug
- Curl
- Json
- Mbstring
- Sqlite3
- Vim
- Yarn
- Nano
- Ruby
- Pear

**PHP**<br>
- Php 5.6, 7.0, 7.1
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
- Ruby

**PHP Compilers**<br>
- PHP FPM 
- HHVM

**PHP Servers**<br>
- NGINX 
- Apache2 

**Apche2**<br>
**NGinx**<br>
**Mysql**<br>
**Mongo DB**<br>
**MARÍA DB**<br>
**Postgres**<br>
**Postgis**<br>
**MSSql Server**<br>
**Jenkins**<br>
**Jira**<br>
**ElasticSearch**<br>
**RabbitMQ**<br>
**Redis**<br>

    
    
## Configuración con PHPStorm

Ver la documentación e imagenes en el directorio docs

* [Comandos Alias](docs/ComandosAlias.md)
* [SSH](docs/SSH.md)
* [PHP](docs/PHP.md)
* [XDebug](docs/XDebug.md)
* [Host](docs/HostMachine.md)
* [JavaScript](docs/JavaScript.md)
* [MySql](docs/MySql.md)
* [PostgresSql](docs/PostgreSql.md)
* [Jenkins](docs/Jenkins.md)

## Alias para ejecutar dockbox

Para hacer la vida más sencilla y no tener que entrar al directorio `/var/www/html/dockbox` cada vez que necesites usar los contenedores, he preparado unos alias con los siguientes comandos:

- **dockerup** = levanta el dockbox con los contenedores `mysql apache2 postgres` por defecto.  
Puedes especificar los contenedores ejecutando `dockerup mysql redis apache2`
- **dockerdown** = detiene el dockbox y apaga los contenedores.
- **dockerrebuild** = actualiza el dockbox con la ultima versíon. Elimina contenedores, bases de datos y configuración de proyectos.

Para agregarlos a tus alias ejecuta los siguientes comandos:

    cd /var/www/html/dockbox
    cat docker.sh >> ~/.bash_aliases  && source ~/.bash_aliases         Linux
    cat docker-mac.sh >> ~/.bash_profile && source ~/.bash_profile      Mac
    

## Comandos utiles de docker

Listar contenedores levantados
    
    docker ps

Listar contenedores inactivos

    docker ps -a
    
Detener todos los contenedores activod

    docker stop $(docker ps -q -a)

Eliminar imagenes 

    docker rmi -f $(docker images -q)

Eliminar contenedores

    docker rm -f $(docker ps -q -a)

## Log de cambios
- 23/04/2017 - Se añade el contenedor PHP-FPM, PHP-Worker, NGinx, Mssql, 
- 13/04/2017 - Se añade el contenedor Jira
- 15/03/2017 - Se añade el contenedor Rabbitmq
- 13/03/2017 - Se añade el contenedor Jenkins y documentación
- 19/02/2017 - Configuración y documentación para realizar backup de Mysql y Postgresql.
- 19/02/2017 - Corrección de persistencia de datos en postgres.
- 11/02/2017 - Corrección de permisos de usuario desarrollador en el contenedor servidor.
- 05/02/2017 - Instalación de librerías Js al contenedor servidor.

## Licencia

Copyright &copy; 2017 [Alejandro Sosa](http://github.com/alejandrososa). Licencia bajo los terminos [MIT license](LICENSE.md).