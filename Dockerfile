FROM 3dpro/nginx:latest

COPY build-files/ondrej-php.key /usr/share/keyrings/ondrej-php.key
RUN echo "deb [signed-by=/usr/share/keyrings/ondrej-php.key] http://ppa.launchpad.net/ondrej/php/ubuntu jammy main" > /etc/apt/sources.list.d/php.list && \
    apt-get update && \
    apt-get --no-install-recommends -y install php8.4 php8.4-fpm php8.4-mbstring php8.4-xml php8.4-mysql php8.4-cli php8.4-curl php8.4-zip php8.4-gd libavif13 libjpeg8 libtiff5 && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    rm -rf /var/lib/apt/lists/* /ondrej-php.key

COPY build-files/nginx.default /etc/nginx/sites-available/default
COPY build-files/php-fpm-www.conf /etc/php/8.4/fpm/pool.d/www.conf
COPY build-files/start.sh /start.sh

EXPOSE 80 443
WORKDIR /var/www/html

CMD ["/start.sh"]
