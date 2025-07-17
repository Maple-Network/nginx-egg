# Pterodactyl Nginx egg

Forked and edited from https://github.com/Sigma-Production/ptero-eggs 

## How to use

1. Go to releases and download the json file
2. Import the egg to your panel like you normally do
3. Create a new server, additionally you can enable wordpress, this will install wordpress for you and you can also install composer packages, this can also be done after the install
4. Navigate to the given port and ip and you are good to go just add you files to the webroot folder
   (when using wordpress go to http://ip:port/wp-admin)
   Note: if you want it using a domain then create a reverse proxy on the host

To remove logs from console, open nginx/conf.d/default.conf and uncomment (remove #):

```
#access_log /home/container/access.log;
#error_log  /home/container/error.log error
```

## Updating (for myself)

- Supported PHP versions: https://www.php.net/supported-versions.php
- Alpine PHP extensions: https://pkgs.alpinelinux.org/packages?name=php8-*&branch=edge&repo=&arch=x86_64&origin=&flagged=&maintainer=
- WordPress PHP versions: https://make.wordpress.org/core/handbook/references/php-compatibility-and-wordpress-versions/
- Required WordPress PHP extensions: https://make.wordpress.org/hosting/handbook/server-environment/#php-extensions