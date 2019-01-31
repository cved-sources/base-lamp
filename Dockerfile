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
    snmp \
    php-xmlrpc \
    libapache2-mod-php \
    php-cli \
    bash-completion \
    vim \
    unzip \
    && apt-get autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*/var/tmp/*

COPY build/main.sh /
COPY build/set-mysql.sh /tmp/
COPY build/phpinfo.php /var/www/html/

RUN  mkdir -p /var/lock/apache2 /var/run/apache2 \
     && /tmp/set-mysql.sh \
     && rm -rf /tmp/*

EXPOSE 80 443

CMD ["/main.sh"]
