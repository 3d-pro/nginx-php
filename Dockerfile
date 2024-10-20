FROM 3dpro/nginx:latest

RUN apt-get update && \
    apt-get --no-install-recommends -y install php8.2 php8.2-fpm php8.2-mbstring php8.2-xml php8.2-mysql php8.2-cli php8.2-curl php8.2-zip php8.2-gd && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    rm -rf /var/lib/apt/lists/* /ondrej-php.key

COPY build-files/nginx.default /etc/nginx/sites-available/default
COPY build-files/php-fpm-www.conf /etc/php/8.2/fpm/pool.d/www.conf
COPY build-files/start.sh /start.sh

EXPOSE 80 443
WORKDIR /var/www/html

CMD ["/start.sh"]
