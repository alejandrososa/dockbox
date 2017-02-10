alias sy='php bin/console'
alias dc='docker-compose'

alias phpStorm='sh /opt/phpstorm/bin/phpstorm.sh'
alias serverPreAdgo='ssh -i ~/Documentos/ADGO/seguridad/id_rsa adgo@104.199.34.123'
alias serverToolsAdgo='ssh -i ~/Documentos/ADGO/seguridad/id_rsa adgo@104.199.50.148'

dockerUp(){
	#connfiguración
	dockerPath=/var/www/html/dockbox
	currentPath=$(pwd)

	#eliminar know host
	ssh-keygen -f "/home/alejandro/.ssh/known_hosts" -R [127.0.0.1]:2222

	#parar servicios
	service mysql stop
	service apache2 stop
	service postgres stop
	
	#ir a dockbox
	cd $dockerPath
	
	#levantar contenedores
	if [ -z $1 ]; then
		echo "> Levantando MySql, Postgres, PHP, Servidor"
		docker-compose up -d mysql php postgres servidor
	else
		echo "> Levantando $($1)"
		docker-compose up -d $1
	fi	

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

