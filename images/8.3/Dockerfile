FROM alpine:3.22

RUN apk --update --no-cache add \
    # System & Web Server
    curl \
    ca-certificates \
    nginx \
    php83 \
    php83-fpm \
    \
    # System Packages for WordPress
    ghostscript \
    libwebp-tools \
    libavif \
    \
    # Required PHP Extensions
    php83-json \
    php83-mysqli \
    \
    # Highly Recommended PHP Extensions
    php83-curl \
    php83-dom \
    php83-exif \
    php83-fileinfo \
    php83-pecl-igbinary \
    php83-pecl-imagick \
    php83-intl \
    php83-mbstring \
    php83-openssl \
    php83-xml \
    php83-zip \
    \
    # Recommended Caching Extensions
    php83-pecl-apcu \
    php83-pecl-memcached \
    php83-opcache \
    php83-pecl-redis \
    php83-ctype \
    \
    # Optional & Compatibility Extensions
    php83-pecl-timezonedb \
    php83-bcmath \
    php83-iconv \
    php83-shmop \
    php83-simplexml \
    php83-sodium \
    php83-xmlreader \
    php83-pecl-ssh2 \
    php83-ftp \
    php83-sockets \
    php83-gd

COPY --from=composer:latest  /usr/bin/composer /usr/bin/composer

USER container
ENV  USER container
ENV HOME /home/container

WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/ash", "/entrypoint.sh"]
