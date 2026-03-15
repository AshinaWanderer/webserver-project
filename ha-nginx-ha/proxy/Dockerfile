FROM nginx:alpine

COPY nginx.conf /etc/nginx/nginx.conf
COPY start.sh   /start.sh
RUN chmod +x /start.sh

EXPOSE 80 443

CMD ["/start.sh"]
