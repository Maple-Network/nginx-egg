ARG PHP=8

FROM alpine:3.16

RUN apk --update --no-cache add curl ca-certificates nginx
RUN apk add php${PHP} php${PHP}-xml php${PHP}-exif php${PHP}-fpm php${PHP}-session php${PHP}-soap php${PHP}-openssl php${PHP}-gmp php${PHP}-pdo_odbc php${PHP}-json php${PHP}-dom php${PHP}-pdo php${PHP}-zip php${PHP}-mysqli php${PHP}-sqlite3 php${PHP}-pdo_pgsql php${PHP}-bcmath php${PHP}-gd php${PHP}-odbc php${PHP}-pdo_mysql php${PHP}-pdo_sqlite php${PHP}-gettext php${PHP}-xmlreader php${PHP}-bz2 php${PHP}-iconv php${PHP}-pdo_dblib php${PHP}-curl php${PHP}-ctype php${PHP}-phar php${PHP}-fileinfo php${PHP}-mbstring php${PHP}-tokenizer php${PHP}-simplexml php${PHP}-intl php${PHP}-pecl-imagick
COPY --from=composer:latest  /usr/bin/composer /usr/bin/composer

USER container
ENV  USER container
ENV HOME /home/container

WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/ash", "/entrypoint.sh"]