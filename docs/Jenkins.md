# Jenkins
Jenkins es una aplicación que supervisa ejecuciones de trabajos repetidos, como por ejemplo la construcción de un proyecto de software y posterior ejecución de una serie de pruebas automáticas. Está basado en el proyecto Hudson, creado por Kohsuke Kawaguchi, que trabajaba en Sun.

## Acceder a jenkins

Puedes acceder a la administración de jenkins en [http://localhost:49001/](http://localhost:49001/)
    
## Obtener password administrator 

Para saber cual es la contraseña del usuario `admin` ejecuta el siguiente comando en consola

    docker-compose exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
    
## Configuración

Toda la configuración de jenkins es gestionada por ficheros que se guardan en `data/jenkins`.

Debes tener en cuenta que si eliminas este directorio, se perderá tu configuración.

## Ayuda

Puedes configurar a tu manera el contenedor de jenkins, aquí te dejo un buen enlace [Tutorial Jenkins](https://engineering.riotgames.com/news/jenkins-ephemeral-docker-tutorial)

## No se levanta el contendor?

Si te ocurre que no se levanta el contenedor de jenkins, manten la calma y ejecuta los siguientes comandos:

    cd /var/www/html/dockbox
    sudo chown $(whoami) -R data/jenkins
    sudo chmod 777 -R data/jenkins/

## Plugins

Plugins disponible para instalar:

- Active Directory plugin 2.0			
- Ant Plugin 1.4	
- Authentication Tokens API Plugin 1.3				
- bouncycastle API Plugin 2.16.0			
- Branch API Plugin 2.0.8		
- Build Pipeline Plugin 1.5.6			
- build timeout plugin 1.18			
- build-name-setter 1.6.5			
- Checkstyle Plug-in 3.47			
- Cobertura Plugin 1.9.8			
- Conditional BuildStep 1.3.5			
- Config File Provider Plugin 2.15.6			
- Credentials Binding Plugin 1.10			
- Credentials Plugin 2.1.13			
- Dashboard View 2.9.10			
- disk-usage plugin 0.28			
- Display URL API 1.1.1			
- Docker Commons Plugin 1.6			
- Docker Pipeline 1.10			
- dockerhub 1.0			
- Durable Task Plugin 1.13			
- Email Extension Plugin 2.57	
- Email Extension Template Plugin 1.0			
- embeddable-build-status 1.9		
- Environment Injector Plugin 1.93.1			
- External Monitor Job Type Plugin 1.7			
- Folders Plugin 6.0.2			
- Git client plugin 2.3.0	
- Git Parameter Plug-In 0.8.0			
- Git plugin 3.1.0	
- GIT server Plugin 1.7	
- GitHub API Plugin 1.85			
- GitHub Branch Source Plugin 2.0.4			
- GitHub Organization Folder Plugin 1.6			
- GitHub plugin 1.26.1	
- GitLab Plugin 1.4.5			
- Gradle Plugin 1.26			
- Green Balls 1.15			
- HTML Publisher plugin 1.12			
- Icon Shim Plugin 2.0.3			
- Javadoc Plugin 1.4			
- JavaScript GUI Lib: ACE Editor bundle plugin 1.1			
- JavaScript GUI Lib: Handlebars bundle plugin 1.1.1			
- JavaScript GUI Lib: jQuery bundles (jQuery and jQuery UI) plugin 1.2.1			
- JavaScript GUI Lib: Moment.js bundle plugin  1.1.1			
- jQuery plugin 1.11.2-0			
- JUnit Plugin 1.20	
- LDAP Plugin 1.14			
- Mailer Plugin 1.19	
- MapDB API Plugin 1.0.9.0			
- Matrix Authorization Strategy Plugin 1.4			
- Matrix Project Plugin 1.8	
- Maven Integration plugin 2.15.1			
- Multijob plugin 1.23			
- NodeJS Plugin 1.1.2			
- OWASP Markup Formatter Plugin 1.5			
- P4 Plugin 1.5.1			
- PAM Authentication plugin 1.3			
- Parameterized Trigger plugin 2.33			
- Pipeline 2.5			
- Pipeline Graph Analysis Plugin 1.3			
- Pipeline: API 2.12			
- Pipeline: Basic Steps 2.4			
- Pipeline: Build Step 2.4			
- Pipeline: Declarative Agent API 1.0.2			
- Pipeline: GitHub Groovy Libraries 1.0			
- Pipeline: Groovy 2.29			
- Pipeline: Input Step 2.5			
- Pipeline: Job 2.10			
- Pipeline: Milestone Step 1.3			
- Pipeline: Model API 1.0.2			
- Pipeline: Model Definition 1.0.2			
- Pipeline: Multibranch 2.14			
- Pipeline: Nodes and Processes 2.10			
- Pipeline: REST API Plugin 2.6			
- Pipeline: SCM Step 2.4	
- Pipeline: Shared Groovy Libraries 2.7			
- Pipeline: Stage Step 2.2			
- Pipeline: Stage Tags Metadata 1.0.2			
- Pipeline: Stage View Plugin 2.6			
- Pipeline: Step API 2.9			
- Pipeline: Supporting APIs 2.13			
- Plain Credentials Plugin 1.4			
- Publish Over SSH 1.17			
- Rebuilder 1.25			
- REPO plugin 1.10.7			
- Resource Disposer Plugin 0.6			
- Role-based Authorization Strategy 2.3.2			
- Run Condition Plugin 1.0			
- SCM API Plugin 2.1.0			
- Script Security Plugin 1.27			
- SSH Agent Plugin 1.14			
- SSH Credentials Plugin 1.13			
- SSH plugin 2.4			
- SSH Slaves plugin 1.13			
- Static Analysis Utilities 1.82			
- Structs Plugin 1.6			
- Subversion Plug-in 2.7.2			
- Timestamper 1.8.8		
- Token Macro Plugin 2.0			
- Warnings Plug-in 4.60			
- Windows Slaves Plugin 1.2			
- Workspace Cleanup Plugin 0.32			
- xUnit plugin 1.102

