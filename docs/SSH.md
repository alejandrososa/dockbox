# SSH
## Conexión vía ssh al contenedor servidor

Generando una nueva key ssh para conectarse al contenedor llamado `servidor`

    ssh-keygen 

Puedes confirmar tu nueva key generada

    cat ~/.ssh/id_rsa.pub

Mostrará lo siguiente
   
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDWV20kXcS2HwC9BgheU5VsSEVwVt6Yb3Hu31fcBDUsi/mUI+Lb8LPw+0jUjDSv+CcHX7fhf6DYVE7h8xxs2jK2gq79dHGR0IFDjaYs4wlsEH+9mE/O2yuMFOVwyqMM3vAHhXQembRlPXkEz75Y39GJGaOqEWjM7wgpo5HvsL8kRdoIk3LqQNpbl41FhxBrQju96PUF6ZwSyzxQ7F0vmpr7Bggpkdl+zdS6CtocYqLyM8RtY7wavDUBZiwsDJNHcBUh+aXv3Zu00aVikkJ3IpxR/wEs4aj/qkGjp6Fyc6wXfMZ20vkmQUqmMOOQi1KocEfHhYtgXqR9Aecri9wRJ2qK/dRnJEY/5WylL6/qFer7OHTHfoUjIc+qmNwQLfYyLmSoMAQ9yPGGexLPGOAt+gU+g7RSSNBizB1UX7SxykItOksYfgCVGSY26un9g74V3KD/I/H/EakY2/EOIFkTWkQM43Nt4ad8r4SK9Mr71bPsWr7tmR2avP2IHuVmjnEWq2h8K0xsLjW6FsNqJcZu28bjVVqmJBQuevvn+MZbR1MscQzNt33x3RBnOGBa2p7lH0mWsbJm2z6NNCn8sqdPZk0Szk6SrNcVsMflb6bXukerIgLQ+vJnIZ/1wrgKfYwy6GJp4fIfAK5B3bCIQOukAf8LUNSIww2pgXISK94xWZxc2Q== elpastorsalomon@gmail.com' >> ~/.ssh/authorized_keys 

Ahora el ultimo paso es crear el fichero ssh-key con tu key ya generada ejecutando lo siguiente
    
    echo $(cat ~/.ssh/id_rsa.pub) >> server/ssh/ssh-key

Listo, ya puedes conectarte al contenedor `servidor` con el usuario root, con estos pasos realizados no necesitarás la clave 
    
    ssh root@127.0.0.1 -p 2222
   
   
### Usuarios
    
Ya dentro del contenedor puedes cambiar a el usuario `desarrollador`

    su desarrollador
    
### Alias

Los alias son una importante ayuda a la hora de ejecutar comandos, por eso he agregado a los usuarios `root` y `desarrollador` los siguientes alias.
Si te apetece, puedes agregar tus propios alias modificando el fichero `server/aliases.sh`, estos cambios que hagas sólo tendrán efecto en el siguiente `docker-compose build` que realices.

**Comandos de uso común**

    alias ..="cd .."
    alias dev="su desarrollador"
    alias admin="su -"
    alias c="clear"
    alias cla="clear && ls -l"
    alias cll="clear && ls -la"
    alias cls="clear && ls"
    alias code="cd /var/www"
    alias ea="vi ~/aliases"
    alias g="gulp"
    alias home="cd ~"
    alias npm-global="npm list -g --depth 0"
    alias ra="reload"
    alias reload="source ~/.aliases && source ~/.bash_aliases && echo \"$COL_GREEN ==> Aliases Reloaded... $COL_RESET \n \""
    alias run="npm run"
    alias tree="xtree"

**Laravel / PHP Alisases**
    
    alias art="php artisan"
    alias artisan="php artisan"
    alias cdump="composer dump-autoload -o"
    alias composer:dump="composer dump-autoload -o"
    alias db:reset="php artisan migrate:reset && php artisan migrate --seed"
    alias migrate="php artisan migrate"
    alias seed="php artisan:seed"
    alias tunit="./vendor/bin/phpunit"
    alias tdd="./vendor/bin/codecept"

**Yii 2**

    alias yii="php yii"

**Symfony 3**

    alias sy="php bin/console"

**NodeJs**
    
    # requires installation of 'https://www.npmjs.com/package/npms-cli'
    alias npms="npms search"

    # requires installation of 'https://www.npmjs.com/package/package-menu-cli'
    alias pm="package-menu"

    # requires installation of 'https://www.npmjs.com/package/pkg-version-cli'
    alias pv="package-version"

    # requires installation of 'https://github.com/sindresorhus/latest-version-cli'
    alias lv="latest-version"

**Git**
    
    alias gaa="git add ."
    alias gd="git --no-pager diff"
    alias git-revert="git reset --hard && git clean -df"
    alias gs="git status"
    alias whoops="git reset --hard && git clean -df"

**Directorios**

```
function mkd() {
    mkdir -p "$@" && cd "$@"
}

function md() {
    mkdir -p "$@" && cd "$@"
}

function xtree {
    find ${1:-.} -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
}
```