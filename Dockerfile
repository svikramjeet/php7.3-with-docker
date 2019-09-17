FROM php:7.3-apache
LABEL maintainer="svikramjeet"

FROM circleci/postgres:10

RUN  apt-get update \
  && apt-get install -y sudo \
  && apt-get install -y wget

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer
