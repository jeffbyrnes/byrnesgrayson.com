#!/usr/bin/env bash

sudo apt-get update

# install apps
sudo apt-get install -y vim curl php5 apache2 libapache2-mod-php5 php5-gd php5-mcrypt git php5-curl

sudo a2enmod rewrite

# link www folder to vagrant (Latest apache uses /var/www/html)
sudo rm -rf /var/www/html
sudo ln -fs /vagrant /var/www/html

# php ini fixes
sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php5/apache2/php.ini
# sed -i "s/display_errors = .*/display_errors = On/" /etc/php5/apache2/php.ini

# apache conf fixes
sed -i 's/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

# restart apache
sudo service apache2 restart
