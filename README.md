# BBW Teachtalk: Docker

## Installation Docker Umgebung



### Testen der Installation
Führe in deinem Terminal den Befehl `docker --version` aus
```sh
$ docker --version
Docker version 18.09.0, build 4d60db4
```

Noch mehr Informationen über Docker erhälst du mit dem Befehl `docker info`
```bash
$ docker info
Containers: 7
 Running: 2
 Paused: 0
 Stopped: 5
Images: 22
Server Version: 18.09.0
...
```

## Hello World
Führe nun deinen erstes Docker Image aus indem du `docker run hello-world` eingibst
```bash
$ docker run hello-world
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
d1725b59e92d: Pull complete
Digest: sha256:0add3ace90ecb4adbf7777e9aacf18357296e799f81cabc9fde470971e499788
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.
...
```

Zeige nun mit `docker image ls` alle Images auf deinem Rechner an

```sh
$ docker image ls
REPOSITORY              TAG                 IMAGE ID            CREATED             SIZE
hello-world             latest              4ab4c602aa5e        3 months ago        1.84kB
```

## MariaDB
`docker image pull mariadb/server`

`docker run --name mariadb -p 3306:3306 -e MYSQL_ROOT_PASSWORD=mypass -e MYSQL_DATABASE=db -d mariadb/server`

`docker run --name mariadbtest -e MYSQL_ROOT_PASSWORD=mypass -d mariadb/server`

`docker run --name myadmin -d --link mariadbtest:db -p 8080:80 phpmyadmin/phpmyadmin`

== Cheat Sheet
```bash
## List Docker CLI commands
docker

## Display Docker version and info
docker --version
docker info

## Execute Docker image
docker run hello-world

## List Docker images
docker image ls

## List Docker containers (running, all, all in quiet mode)
docker container ls
docker container ls --all
docker container ls -aq
```

## Terminology

* `*` - The blueprints of our application which form the basis of containers. In the demo above, we used the docker pull command to download the busybox image.
* `Containers` - Created from Docker images and run the actual application. We create a container using docker run which we did using the busybox image that we downloaded. A list of running containers can be seen using the docker ps command.
* `Docker Daemon` - The background service running on the host that manages building, running and distributing Docker containers. The daemon is the process that runs in the operating system to which clients talk to.
* `Docker Client` - The command line tool that allows the user to interact with the daemon. More generally, there can be other forms of clients too - such as Kitematic which provide a GUI to the users.
* `Docker Hub` - A registry of Docker images. You can think of the registry as a directory of all available Docker images. If required, one can host their own Docker registries and can use them for pulling images.


https://blog.shanelee.name/2017/04/09/how-to-import-and-export-databases-in-mysql-or-mariadb-with-docker/

### Ubuntu
1. Package Index updaten
```
sudo apt update
```
2. Zusatzpackete installieren
```
sudo apt-get install \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common
```
3. Docker PGP Key hinzufügen
```
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
```
4. Hinzufügen der **stable** Docker Repositories
```
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
```
or for LinuxMint (https://stackoverflow.com/questions/52545945/docker-install-on-linux-mint-19-tara)
```
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
```
5. Package Index updaten
```
sudo apt-get update
```
6. Installieren der neuesten Docker Version
```
sudo apt-get install docker-ce
```
7. Benutzer hinzufügen um als nicht-root Befehle ausführen zu können
```
sudo usermod -aG docker dominic
```
