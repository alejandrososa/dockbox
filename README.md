DockBox
==========

DockBox es un entorno de desarrollo PHP con Docker. El objetivo es facilitar el desarrolo de aplicación PHP con la tecnología de Docker.

<blockquote>
Contiene las herramientas basicas para que hagas de tus desarrollos lo más comodo sin la necesidad de instalarte software u otras tecnologías en tu maquina.
</blockquote>

## ¿Qué hay en el entorno ecológico de desarrollo?**

* [Ubuntu 16.04](https://www.ubuntu.com/)
* [PHP 7.0](http://php.net/manual/es/migration70.new-features.php)
* [MySql 5.7](http://www.mysql.com/)
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

## Levantar nuestro entorno

Ir al raíz de nuestro dockbox una vex descargado y ejecutar

    $ docker-compose up
    
## Configuración con PHPStorm

Ver la documentación e imagenes en el directorio docs

* [SSH](docs/SSH.md)
* [XDebug](docs/XDebug.md)
* [Host](docs/HostMachine.md)

## Licencia

Copyright &copy; 2017 [Alejandro Sosa](http://github.com/alejandrososa). Licensed under the terms of the [MIT license](LICENSE.md).