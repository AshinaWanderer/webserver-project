#!/bin/sh
set -e
if [ "$HOSTNAME" = "proxy-master" ]; then
  cp /etc/keepalived/master.keepalived.conf /etc/keepalived/keepalived.conf
else
  cp /etc/keepalived/backup.keepalived.conf /etc/keepalived/keepalived.conf
fi
exec keepalived -f /etc/keepalived/keepalived.conf -D