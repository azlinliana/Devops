# Dockerfile for frontend

FROM nginx:latest
WORKDIR /app
COPY . /usr/share/nginx/html
EXPOSE 80
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]