FROM ubuntu:latest

ENV DEBIAN_FRONTEND=non-interactive

RUN apt-get update -y
RUN apt-get install -y git curl apache2 php libapache2-mod-php php-mysql

RUN rm -rf /var/vwww/html/*
ADD src /var/www/html/

RUN a2enmod rewrite
RUN chown -R www-data:www-data /var/www/html
ENV APACHE_RUN_DIR /var/www/html
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
