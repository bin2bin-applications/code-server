#!/bin/bash
sed -i '/password: /d' /app/config/config.yaml
echo "password: $2" >> /app/config/config.yaml