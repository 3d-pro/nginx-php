FROM 3dpro/nginx

COPY build-files/ondrej-php.list /etc/apt/sources.list.d/
RUN echo 'Acquire::http::Proxy "http://172.17.0.1:3142";' > /etc/apt/apt.conf.d/11proxy && \
    apt-get update && \
    apt-get -y upgrade && \ 
    apt-get -y install postfix php7.0 php7.0-fpm php7.0-mbstring php7.0-xml php7.0-mysql php7.0-cli php7.0-curl php7.0-mcrypt php7.0-zip php7.0-gd && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    phpenmod mcrypt && \
    rm -rf /var/lib/apt/lists/* /etc/apt/apt.conf.d/11proxy

#Copy settings
COPY build-files/nginx.default /etc/nginx/sites-available/default
COPY build-files/php-fpm-www.conf /etc/php/7.0/fpm/pool.d/www.conf
COPY build-files/start.sh /start.sh

EXPOSE 80 443
WORKDIR /var/www/html

CMD ["/start.sh"]
