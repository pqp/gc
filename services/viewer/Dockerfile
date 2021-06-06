FROM nginx:latest

WORKDIR /app

#RUN apt update && apt full-upgrade -y
#RUN apt install nginx -y

COPY html /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]