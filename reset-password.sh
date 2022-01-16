#!/bin/sh
echo -n "$1:" > /.htpasswd
echo $2 | openssl passwd -apr1 -stdin >> /.htpasswd
nginx -s reload