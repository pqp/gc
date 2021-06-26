#!/bin/bash

COMPOSE="docker-compose --no-ansi"
DOCKER="docker"

DIR=$1

if [[ $# -eq 0 ]] ; then
	echo "Please supply the project directory (e.g., '/home/user/gc')."
	exit 1
fi

cd ${DIR}
$COMPOSE run certbot renew && $COMPOSE kill -s SIGHUP web
$DOCKER system prune -af