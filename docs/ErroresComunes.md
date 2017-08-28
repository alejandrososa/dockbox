Errores comunes
====

Mysql
--
**Levantando el contenedor**<br>
En una instalación nueva del dockbox puedes encontrarte que el contenedor no se levanta y muestra `Exit 1`.

    dockbox_mysql_1      docker-entrypoint.sh mysql      Exit 1      0.0.0.0:3306->3306/tcp 
    
Se corrige ejecuntando el siguiente comando:

    sudo rm -rf data/mysql && mkdir data/mysql
    sudo chown $(whoami) data/

Elasticsearch
--
**Levantando el contenedor**<br>
En una instalación nueva del dockbox puedes encontrarte que el contenedor no se levanta y muestra `Exit 1`.

    dockbox_elasticsearch_1      /bin/bash bin/es-docker      Exit 1      0.0.0.0:9200->9200/tcp, 0.0.0.0:9300->9300/tcp 
    
Se corrige cambiando los permisos de escritura del directorio usado como volumen de elasticsearch, ejecuntando el siguiente comando:

    sudo chmod -R 777 data/elasticsearch