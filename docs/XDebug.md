## XDebug

Esta configuración la puedes cambiar antes de hacer el docker-compose build en el archivo que se encuentra en en la carpeta php `php/xdbug.ini`  
A continación te indico como configurar tu PhpStorm paso a paso, tener en cuenta cambiar tu ipaddress por la que muestro en las imagenes `10.254.254.254`

**Paso 1**<br>
![Paso 1](imagenes/1-XDebug-configuración.png)

**Paso 2**<br>
![Paso 2](imagenes/2-XDebug-DBGp.png)

**Paso 3**<br>
![Paso 3](imagenes/3-XDebug-WebApplication.png)

**Paso 4**<br>
![Paso 4](imagenes/4-XDebug-Server.png)

**Paso 5 (Opcional)**<br>
Este paso sólo si usas un Mac.<br>
Crear alias para el host remoto y localhost

    sudo ifconfig en0 alias 10.254.254.254 255.255.255.0

![Paso 5](imagenes/5-XDebug-AliasRemoteHost.png)

**Paso 6**<br>
![Paso 6](imagenes/6-XDebug-Resultado.png)

    
### Gestionar nuestro servicio de xdebug

Iniciar, Detener o Ver estado de xdebug

    cd /directorio/dockbox

    sh xdebugPhp start
    sh xdebugPhp stop
    sh xdebugPhp status
