# BBW Teachtalk: Docker

## Installation Docker Umgebung
[Install Docker for Mac | Docker Documentation](https://docs.docker.com/docker-for-mac/install/)

[Get Docker CE for Ubuntu | Docker Documentation](https://docs.docker.com/install/linux/docker-ce/ubuntu/)

[Install Docker Toolbox on Windows | Docker Documentation](https://docs.docker.com/toolbox/toolbox_install_windows/)



## Cheat Sheet
```bash
# Installation überprüfen
$ docker version

# Pull hello-world Image
$ docker pull hello-world

# Lokale Images anzeigen
$ docker run hello-world

# Laufende Container anzeigen
$ docker ps

# Alle Container anzeigen
$ docker ps -a

# Container starten
$ docker run -d -p 8080:80 --rm nginx
# -d:         detached / Hintergrunddienst
# -p 8080:80  Portzuweisung Host zu Docker
# --rm:       remove / Automatisch entfernen

# Interaktiver Container starten
$ docker run -it ubuntu
#-it:       	Interaktiver Modus

# Container stoppen
$ docker stop CONTAINER-ID|NAME

# Container entfernen
$ docker rm CONTAINER-ID|NAME

# Image entfernen
$ docker rmi IMAGE

# Build Prozess
$ docker build                      \
-f docker/Dockerfile                \
-t datatrans/bbw-stickershop:latest .
# -f:    Dockerfile, falls nicht im gleichen Ordner
# -t:    Name des Images

# Lokale Images anzeigen
$ docker image ls

# Container starten
$ docker run -p 8080:8080 --rm -d   \
-e 'datatransUsername=<merchantId>' \
-e 'datatransPassword=<password>'   \
datatrans/bbw-stickershop:latest
# -e:    Umgebungsvariable setzen

```

## Dockerfile Referenz
| Keyword | Beschreibung |
| --- | --- |
| FROM | Basis für unser Build-Image
| WORKDIR | Startordner
| COPY | Kopiere lokale Dateien in den Container
| RUN | Befehl im Container ausführen
|  |  |
| FROM | Basis für unser Ausführungs-Image
| COPY | Kopiere Dateien aus Build-Image
| ENV | Umgebungsvariablen setzen
| EXPOSE | Kommunikationsport IM Container
| CMD | Einstiegspunkt für finalen Container




https://blog.shanelee.name/2017/04/09/how-to-import-and-export-databases-in-mysql-or-mariadb-with-docker/

## Installation Docker Ubuntu
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
