#!/bin/bash
# Update the apt-get cache
sudo apt-get update

# Install Apache
sudo apt-get install -y apache2

# Install PHP
sudo apt-get -y install libapache2-mod-php

# Copy code repository
sudo git clone https://github.com/doxic/php-app /var/www/html/app

# Start Apache
sudo service apache2 start
