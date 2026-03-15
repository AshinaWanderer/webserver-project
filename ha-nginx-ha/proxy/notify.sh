#!/bin/sh
case "$1" in
  MASTER)
    nginx -g "daemon off;" &
    ;;
  BACKUP|FAULT)
    nginx -s quit || true
    ;;
esac