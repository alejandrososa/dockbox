## Instalar Docker en Ubuntu

Ver documentación oficial [Docker](https://docs.docker.com/engine/installation/)


[Instalar paso a paso Docker CE Ubuntu](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/)

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