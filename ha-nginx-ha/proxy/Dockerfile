FROM nginx:alpine

# Keepalived installieren (VIP-Verwaltung)
RUN apk add --no-cache keepalived

# Konfig-Dateien kopieren
COPY nginx.conf /etc/nginx/nginx.conf
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 80

CMD ["/start.sh"]