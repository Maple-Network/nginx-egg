FROM alpine:3.16

RUN apk --update --no-cache add \
    curl \
    ca-certificates \
    openssl \
    # Nginx and PHP dependencies
    build-base \
    linux-headers \
    pcre-dev \
    zlib-dev \
    openssl-dev \
    gd-dev \
    geoip-dev \
    libxslt-dev \
    perl-dev \
    php8 \
    php8-fpm \
    php8-dev \
    php8-pear \
    php8-pecl-imagick \
    php8-xml \
    php8-exif \
    php8-soap \
    php8-openssl \
    php8-gmp \
    php8-pdo_odbc \
    php8-json \
    php8-dom \
    php8-pdo \
    php8-zip \
    php8-mysqli \
    php8-sqlite3 \
    php8-pdo_pgsql \
    php8-bcmath \
    php8-gd \
    php8-odbc \
    php8-pdo_mysql \
    php8-pdo_sqlite \
    php8-gettext \
    php8-xmlreader \
    php8-bz2 \
    php8-iconv \
    php8-pdo_dblib \
    php8-curl \
    php8-ctype \
    php8-phar \
    php8-fileinfo \
    php8-mbstring \
    php8-tokenizer \
    php8-intl \
    php8-simplexml \
    # Setup for build dependencies
    && apk add --virtual .build-deps \
    autoconf \
    gcc \
    libc-dev \
    make \
    libtool \
    automake

# Download and unpack Nginx and ngx_cache_purge
RUN cd /tmp \
    && wget http://nginx.org/download/nginx-1.21.1.tar.gz \
    && tar -zxvf nginx-1.21.1.tar.gz \
    && wget https://github.com/FRiCKLE/ngx_cache_purge/archive/2.3.tar.gz \
    && tar -zxvf 2.3.tar.gz

# Compile Nginx with ngx_cache_purge module
RUN cd /tmp/nginx-1.21.1 \
    && ./configure \
    --with-compat \
    --add-dynamic-module=/tmp/ngx_cache_purge-2.3 \
    --with-http_ssl_module \
    --with-http_v2_module \
    --with-http_gzip_static_module \
    --prefix=/etc/nginx \
    --sbin-path=/usr/sbin/nginx \
    --conf-path=/etc/nginx/nginx.conf \
    --pid-path=/var/run/nginx.pid \
    --lock-path=/var/run/nginx.lock \
    && make \
    && make install \
    && rm -rf /tmp/nginx-1.21.1 /tmp/ngx_cache_purge-2.3 /tmp/*.tar.gz

# Cleanup unnecessary packages
RUN apk del .build-deps

COPY --from=composer:latest  /usr/bin/composer /usr/bin/composer

USER container
ENV  USER container
ENV HOME /home/container

WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/ash", "/entrypoint.sh"]