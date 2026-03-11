#!/bin/sh
set -e

echo "Starting Keepalived..."
keepalived --dont-fork --log-console --log-detail &
KEEPALIVED_PID=$!

# Kurz warten damit VIP zugewiesen wird
sleep 2

echo "Starting Nginx..."
nginx -g 'daemon off;' &
NGINX_PID=$!

# Warte auf beide Prozesse - wenn einer stirbt, beende alles
wait -n $KEEPALIVED_PID $NGINX_PID
echo "One process exited, shutting down..."
kill $KEEPALIVED_PID $NGINX_PID 2>/dev/null
exit 1