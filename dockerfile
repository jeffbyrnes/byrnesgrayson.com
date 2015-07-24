# FROM linode/lamp
FROM yoshz/apache-php-dev:5.5

COPY config/apache.conf /etc/apache2/sites-available/byrnesgrayson.conf
COPY . /var/www/byrnesgrayson.com
RUN a2dissite 000-default && a2ensite byrnesgrayson && service apache2 reload
