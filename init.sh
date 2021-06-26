#!/bin/bash

CD=`pwd`

echo "Initializing Git submodules..."

git submodule init
git submodule update

cd services/mumble-json; git checkout gc
git pull origin gc; cd ${CD}

echo "Generating private certificate..."

openssl dhparam -out ${CD}/certs/ssl/dhparam-2048.pem 2048

echo "Downloading docker-compose..."

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "Please type the hostname:"
read hostname
echo "We're going to collect certificate information now."
echo "Please type an email address:"
read email
echo "Please type the domain (example: '-d webzone.org'):"
read domain
echo "Please type a Nextcloud server URL:"
read nc_url
echo "Please type a Nextcloud username:"
read nc_name
echo "Please type that Nextcloud account's password:"
read nc_pass

echo "Alright. Here's the information that we're writing to .env:"

echo "NGINX_HOST=${hostname}"
echo "NGINX_HTTP_PORT=80"
echo "NGINX_HTTPS_PORT=443"
echo "HTML_DIR=${CD}/html"
echo "SSL=${CD}/certs/ssl"
echo "CERT_EMAIL=${email}"
echo "CERT_DOMAIN=-d ${hostname}"
echo "WEBDRIVE_URL=${nc_url}"
echo "WEBDRIVE_USERNAME=${nc_user}"
echo "WEBDRIVE_PASSWORD=${nc_pass}"


echo "NGINX_HOST=${hostname}" >> .env
echo "NGINX_HTTP_PORT=80" >> .env
echo "NGINX_HTTPS_PORT=443" >> .env
echo "HTML_DIR=${CD}/html" >> .env
echo "SSL=${CD}/certs/ssl" >> .env
echo "CERT_EMAIL=${email}" >> .env
echo "CERT_DOMAIN=-d ${hostname}" >> .env
echo "WEBDRIVE_URL=${nc_url}" >> .env
echo "WEBDRIVE_USERNAME=${nc_user}" >> .env
echo "WEBDRIVE_PASSWORD=${nc_pass}" >> .env