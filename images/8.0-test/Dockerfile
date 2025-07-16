ARG PHP=php8

FROM alpine:3.16

RUN apk --update --no-cache add curl ca-certificates nginx
RUN apk add ${PHP} ${PHP}-xml ${PHP}-exif ${PHP}-fpm ${PHP}-session ${PHP}-soap ${PHP}-openssl ${PHP}-gmp ${PHP}-pdo_odbc ${PHP}-json ${PHP}-dom ${PHP}-pdo ${PHP}-zip ${PHP}-mysqli ${PHP}-sqlite3 ${PHP}-pdo_pgsql ${PHP}-bcmath ${PHP}-gd ${PHP}-odbc ${PHP}-pdo_mysql ${PHP}-pdo_sqlite ${PHP}-gettext ${PHP}-xmlreader ${PHP}-bz2 ${PHP}-iconv ${PHP}-pdo_dblib ${PHP}-curl ${PHP}-ctype ${PHP}-phar ${PHP}-fileinfo ${PHP}-mbstring ${PHP}-tokenizer ${PHP}-simplexml ${PHP}-intl ${PHP}-pecl-imagick
COPY --from=composer:latest  /usr/bin/composer /usr/bin/composer

USER container
ENV  USER container
ENV HOME /home/container

WORKDIR /home/container
COPY ./../../entrypoint.sh /entrypoint.sh

CMD ["/bin/ash", "/entrypoint.sh"]