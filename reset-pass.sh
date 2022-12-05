#!/bin/sh
echo "bind-addr: 0.0.0.0:8080" > /config.yaml
echo "auth: password" >> /config.yaml
echo "password: $2" >> /config.yaml
echo "cert: false" >> /config.yaml
./start-service.sh