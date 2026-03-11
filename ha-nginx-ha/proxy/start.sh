#!/bin/sh
# Start nginx in the background
nginx -g 'daemon off;' &
NGINX_PID=$!

# Start keepalived in the foreground (oder Hintergrund je nach Bedarf)
keepalived -P -f /etc/keepalived/keepalived.conf