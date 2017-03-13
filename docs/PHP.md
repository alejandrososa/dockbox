# PHP

## Editar xdebug.ini

Puedes editar la configuración del xdebug, los cambios en los ficheros de configuracón solo tendrán efecto cuando hagas `docker-compose build`
- dockdock/workspace/xdebug.ini
- dockdock/php-fpm/xdebug.ini

Puedes cambiar las variables:

    xdebug.remote_autostart=1
    xdebug.remote_enable=1
    xdebug.remote_connect_back=1
    xdebug.remote_host=TU_IP_ADDRESS
    xdebug.cli_color=1
    
## Configuración con .htaccess

Otra forma más comoda de configurar el exdebug es creando un .htaccess o editando uno existente y colocando las siguientes lineas al principio:

    php_flag  xdebug.remote_enable on
    php_value xdebug.remote_host "TU_IP_ADDRESS"
    php_value xdebug.remote_port 9000
    php_value xdebug.idekey PHPSTORM
    php_flag  xdebug.remote_autostart on