<<<<<<< HEAD
#!/bin/bash
exec nginx -g "daemon off;"
=======
#!/bin/sh
set -e
if [ "$HOSTNAME" = "proxy-master" ]; then
  cp /etc/keepalived/master.keepalived.conf /etc/keepalived/keepalived.conf
else
  cp /etc/keepalived/backup.keepalived.conf /etc/keepalived/keepalived.conf
fi
exec keepalived -f /etc/keepalived/keepalived.conf -D
>>>>>>> ca52eec1b42943065df4316c287e2d3cac545a93
