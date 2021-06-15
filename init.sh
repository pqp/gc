#!/bin/bash

CD=`pwd`

echo "Initializing Git submodules..."

git submodule init
git submodule update

cd services/mumble-json; git checkout -b gc
git pull origin gc

echo "Please type the hostname:"
read hostname
echo "We're going to collect certificate information now."
echo "Please type an email address:"
read email
echo "Please type the domain:"
read domain

echo "Alright. Here's the information that we're writing to .env:"

echo "NGINX_HOST=${hostname}"
echo "NGINX_HTTP_PORT=80"
echo "NGINX_HTTPS_PORT=443"
echo "HTML_DIR=${CD}/gc/html"
echo "SSL=${CD}/certs/ssl"
echo "CERT_EMAIL=${email}"
echo "CERT_DOMAIN=-d ${hostname}"

echo "NGINX_HOST=${hostname}" >> .env
echo "NGINX_HTTP_PORT=80" >> .env
echo "NGINX_HTTPS_PORT=443" >> .env
echo "HTML_DIR=${CD}/gc/html" >> .env
echo "SSL=${CD}/certs/ssl" >> .env
echo "CERT_EMAIL=${email}" >> .env
echo "CERT_DOMAIN=-d ${hostname}" >> .env