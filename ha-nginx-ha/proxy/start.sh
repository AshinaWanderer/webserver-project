#!/bin/bash
set -e

exec keepalived -p /var/run/keepalived.pid -P -f /etc/keepalived/keepalived.conf