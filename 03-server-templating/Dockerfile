FROM ubuntu:16.04

#Install basic environment
RUN apt-get update && apt-get install -y git

# Install Apache
RUN apt-get install -y apache2

# Install PHP
RUN apt-get -y install libapache2-mod-php

# Copy code repository
RUN git clone https://github.com/doxic/php-app /var/www/html/app

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
