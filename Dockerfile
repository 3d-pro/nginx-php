FROM 3dpro/nginx

COPY build-files/ondrej-php.key /ondrej-php.key
RUN apt-key add /ondrej-php.key && \
    echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu bionic main" > /etc/apt/sources.list.d/php.list && \
    apt-get update && \
    apt-get -y upgrade && \ 
    apt-get -y install php7.3 php7.3-fpm php7.3-mbstring php7.3-xml php7.3-mysql php7.3-cli php7.3-curl php7.3-mcrypt php7.3-zip php7.3-gd && \
    wget -O /usr/local/bin/composer https://getcomposer.org/download/1.9.1/composer.phar && \
    chmod +x /usr/local/bin/composer && \
    #curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    composer global require hirak/prestissimo && \
    phpenmod mcrypt && \
    rm -rf /var/lib/apt/lists/* /ondrej-php.key

COPY build-files/nginx.default /etc/nginx/sites-available/default
COPY build-files/php-fpm-www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY build-files/start.sh /start.sh

EXPOSE 80 443
WORKDIR /var/www/html

CMD ["/start.sh"]
