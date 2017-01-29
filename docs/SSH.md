Modificar copiar la key del ordenador 

    cat ~/.ssh/id_rsa.pub

Mostrará lo siguiente
   
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDWV20kXcS2HwC9BgheU5VsSEVwVt6Yb3Hu31fcBDUsi/mUI+Lb8LPw+0jUjDSv+CcHX7fhf6DYVE7h8xxs2jK2gq79dHGR0IFDjaYs4wlsEH+9mE/O2yuMFOVwyqMM3vAHhXQembRlPXkEz75Y39GJGaOqEWjM7wgpo5HvsL8kRdoIk3LqQNpbl41FhxBrQju96PUF6ZwSyzxQ7F0vmpr7Bggpkdl+zdS6CtocYqLyM8RtY7wavDUBZiwsDJNHcBUh+aXv3Zu00aVikkJ3IpxR/wEs4aj/qkGjp6Fyc6wXfMZ20vkmQUqmMOOQi1KocEfHhYtgXqR9Aecri9wRJ2qK/dRnJEY/5WylL6/qFer7OHTHfoUjIc+qmNwQLfYyLmSoMAQ9yPGGexLPGOAt+gU+g7RSSNBizB1UX7SxykItOksYfgCVGSY26un9g74V3KD/I/H/EakY2/EOIFkTWkQM43Nt4ad8r4SK9Mr71bPsWr7tmR2avP2IHuVmjnEWq2h8K0xsLjW6FsNqJcZu28bjVVqmJBQuevvn+MZbR1MscQzNt33x3RBnOGBa2p7lH0mWsbJm2z6NNCn8sqdPZk0Szk6SrNcVsMflb6bXukerIgLQ+vJnIZ/1wrgKfYwy6GJp4fIfAK5B3bCIQOukAf8LUNSIww2pgXISK94xWZxc2Q== elpastorsalomon@gmail.com' >> ~/.ssh/authorized_keys 

Crear el fichero para pegar tu llave 
    
    echo 'TU KEY SSH' >> server/ssh/ssh-key
    

Conectarse 
    
    ssh root@127.0.0.1 -p 2222