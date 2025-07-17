#!/bin/ash
rm -rf /home/container/tmp/*

echo "⟳ Starting PHP-FPM..."
PHP_FPM_BINARY=$(find /usr/sbin/ -name 'php-fpm*' -type f | sort -V | tail -n 1)

if [ -z "$PHP_FPM_BINARY" ]; then
    echo "✗ ERROR: No PHP-FPM binary found. Exiting."
    exit 1
fi

$PHP_FPM_BINARY --fpm-config /home/container/php-fpm/php-fpm.conf --daemonize

echo "⟳ Starting Nginx..."
echo "✓ Successfully started"
/usr/sbin/nginx -c /home/container/nginx/nginx.conf -p /home/container/
