#!/bin/sh
echo "Enter a hostname for the Frontend (eg: piped.kavin.rocks):" && read -r frontend
echo "Enter a hostname for the Backend (eg: pipedapi.kavin.rocks):" && read -r backend
echo "Enter a hostname for the Proxy (eg: pipedproxy.kavin.rocks):" && read -r proxy
echo "Enter a password for the Postgres Database:" && read -r postgrespassword

ldir=$(pwd)

rm -rf config/
rm -f docker-compose.yml
rm -f portainer.docker-compose.yml
rm -f caddy.docker-compose.yml
rm -f Caddyfile-append

cp -r template/ config/

sed -i "s/FRONTEND_HOSTNAME/$frontend/g" config/*
sed -i "s/BACKEND_HOSTNAME/$backend/g" config/*
sed -i "s/PROXY_HOSTNAME/$proxy/g" config/*
sed -i "s/POSTGRES_PASSWORD/$postgrespassword/g" config/*
sed -i "s/LOCAL_DIR/$ldir/g" config/*

mv config/docker-compose.yml portainer.docker-compose.yml
mv config/caddy-docker-compose.yml caddy.docker-compose.yml
mv config/Caddyfile Caddyfile-append

docker volumes create piped-proxy
docker networks create piped-net