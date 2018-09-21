FROM 3dpro/nginx

COPY build-files/ondrej-php.key /ondrej-php.key
RUN apt-key add /ondrej-php.key && \
    echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu devel main" > /etc/apt/sources.list.d/php.list && \
    apt-get update && \
    apt-get -y upgrade && \ 
    apt-get -y install php7.1 php7.1-fpm php7.1-mbstring php7.1-xml php7.1-mysql php7.1-cli php7.1-curl php7.1-mcrypt php7.1-zip php7.1-gd && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    composer global require hirak/prestissimo && \
    phpenmod mcrypt && \
    rm -rf /var/lib/apt/lists/* /ondrej-php.key

COPY build-files/nginx.default /etc/nginx/sites-available/default
COPY build-files/php-fpm-www.conf /etc/php/7.1/fpm/pool.d/www.conf
COPY build-files/start.sh /start.sh

EXPOSE 80 443
WORKDIR /var/www/html

CMD ["/start.sh"]
