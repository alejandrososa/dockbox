## Dominios locales

Agregar al host de su ordenador los dominios que utilizará con docker

    echo '127.0.0.1 localhost' >> /etc/hosts
    echo '127.0.0.1 docker.localhost' >> /etc/hosts

Con esto ya podrás acceder localmente a tus virtual hosts creados


    docker network inspect dockbox_php_1

## Ver ipv6

    dc exec php bash -c "ip -6 addr show dev eth0; ip -6 route show"