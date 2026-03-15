<<<<<<< HEAD
FROM nginx:alpine

COPY nginx.conf /etc/nginx/nginx.conf
COPY start.sh   /start.sh
RUN chmod +x /start.sh

EXPOSE 80 443

CMD ["/start.sh"]
=======
FROM alpine:latest
RUN apk add --no-cache nginx keepalived
COPY nginx.conf /etc/nginx/nginx.conf:ro
COPY keepalived/master.keepalived.conf /etc/keepalived/master.keepalived.conf:ro
COPY keepalived/backup.keepalived.conf /etc/keepalived/backup.keepalived.conf:ro
COPY start.sh /usr/local/bin/start.sh:ro
COPY notify.sh /usr/local/bin/notify.sh:ro
RUN chmod +x /usr/local/bin/start.sh /usr/local/bin/notify.sh
ENTRYPOINT ["/usr/local/bin/start.sh"]
>>>>>>> ca52eec1b42943065df4316c287e2d3cac545a93
