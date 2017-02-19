# Comandos Alias

Para no estar atado a tener que entrar siempre al directorio que clonaste `dockbox` para levantar el entorno con docker, te he preparado el siguiente script que esta en el raíz llamado `docker.sh` para que copies el contenido y lo pegues en tu `~/.bash_aliases`

Tienes lo siguientes alias:

- **dc** = docker-compose
- **dockerUp** = docker-compose up -d mysql php postgres servidor
- **dockerDown** = docker-compose down

Con estos alias dockerUp y dockerDown ya te puedes olvidar de acceder al dockbox desde consola para levantar los contenedores, porque el script te ahorra ese tiempo y esa repetición.