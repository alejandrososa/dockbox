alias dc='docker-compose'

dockerUp(){
	#connfiguración
	dockerPath=/var/www/html/dockbox
	currentPath=$(pwd)

	#eliminar know host
	#ssh-keygen -f "/home/alejandro/.ssh/known_hosts" -R [127.0.0.1]:2222

	#parar servicios
	echo "Revisión de servicios locales"

	MySQL=$(checkServiceIsRunning mysql);
	Apache=$(checkServiceIsRunning apache2);
	Postgres=$(checkServiceIsRunning postgres);

	if [ "$MySQL" -ne "1" ];
	then
		echo "   -MySQL esta encendido. Apagado!!!";
		sudo service mysql stop
	else
		echo "   -MySql apagado.";
	fi

	#-----------------------
	if [ "$Apache" -ne 1 ];
	then
		echo "   -Apache2 esta encendido. Apagado!!!";
		sudo service apache2 stop
	else
		echo "   -Apache2 apagado.";
	fi;

	#-----------------------
	if [ "$Postgres" -ne 1 ];
	then
		echo "   -Postgres esta encendido. Apagado!!!";
		sudo service postgresql stop
	else
		echo "   -Postgres apagado.";
	fi;


	#ir a dockbox
	cd $dockerPath

	#levantar contenedores
	if [ -z $1 ]; then
		echo "> Levantando MySql, Postgres, PHP, Servidor"
		docker-compose up -d mysql php postgres servidor
	else
		echo "> Levantando $($1)"
		docker-compose up -d $1
	fi;

	#volver al directorio
	echo "Docker inicializado.."
	cd $currentPath
}
dockerDown(){
        #connfiguración
        dockerPath=/var/www/html/dockbox
        currentPath=$(pwd)

        #ir a dockbox
        cd $dockerPath

        #parar contenedores
        echo "> Deteniendo contenedores"
        docker-compose down

        #volver al directorio
        echo "Docker detenido.."
        cd $currentPath
}
dockerIn(){
	#connfiguración
	dockerPath=/var/www/html/dockbox
	currentPath=$(pwd)
	contenedor=$1

	#ir a dockbox
	cd $dockerPath

	#levantar contenedores
	if [ -z $1 ]; then
		echo "Debe introducir el nombre de un contenedor"
	else
		echo "> Levantando $($contenedor)"
		docker-compose exec $($contenedor) bash
	fi;

	#volver al directorio
	echo "Docker inicializado.."
	cd $currentPath
}

checkServiceIsRunning(){
	service=$1
	resultado=1

	if (( $(ps -ef | grep -v grep | grep $service | wc -l) > 0 ))
	then
    		# 0 = true
    		resultado=0
  	else
    		# 1 = false
	    	resultado=1
	fi

	echo $resultado
}

dockerRebuild(){
    #connfiguración
    dockerPath=/var/www/html/dockbox
    currentPath=$(pwd)

    #ir a dockbox
    cd $dockerPath

    #parar contenedores
    echo "> Eliminando Contenedores"
    docker rm -f $(docker ps -a -q)

    echo "> Eliminando Imagenes"
    docker rmi -f $(docker images -a -q)

    echo "> Limpiando directorio data"
    rm -f data/elasticsearch/.gitkeep
    rm -f data/mariadb/.gitkeep
    rm -f data/mongo/.gitkeep
    rm -f data/mysql/.gitkeep
    rm -f data/postgis/.gitkeep
    rm -f data/postgres/.gitkeep
    rm -f data/redis/.gitkeep

    echo "> Limpiando directorio log"
    sudo chown $(whoami) -R log/
    rm -rf log/*

    echo "> Reconstruyendo dockbox con última versión"
    docker-compose build

    #volver al directorio
    echo "Dockbox reconstruido.."
    cd $currentPath
}