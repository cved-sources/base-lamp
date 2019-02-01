FROM ubuntu:16.04

LABEL author="cved (cved@protonmail.com)"
LABEL maintainer="cved (cved@protonmail.com)"

ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update \
    && apt-get -y install \
    apache2 \
    mysql-client \
    mysql-server \
    php \
    php-mysql \
    php-dev \
    php-gd \
    php-memcache \
    php-pspell \
    php-snmp \
    php-xmlrpc \
    php-zip \
    php-cli \
    libapache2-mod-php \
    snmp \
    bash-completion \
    vim \
    unzip \
    && apt-get autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY build/apache2.conf /etc/apache2/
#COPY build/main.sh /

#EXPOSE 80

#CMD ["/main.sh"]
