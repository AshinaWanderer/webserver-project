FROM alpine:latest
RUN apk add --no-cache nginx keepalived
COPY nginx.conf /etc/nginx/nginx.conf:ro
COPY keepalived/master.keepalived.conf /etc/keepalived/master.keepalived.conf:ro
COPY keepalived/backup.keepalived.conf /etc/keepalived/backup.keepalived.conf:ro
COPY start.sh /usr/local/bin/start.sh:ro
COPY notify.sh /usr/local/bin/notify.sh:ro
RUN chmod +x /usr/local/bin/start.sh /usr/local/bin/notify.sh
ENTRYPOINT ["/usr/local/bin/start.sh"]