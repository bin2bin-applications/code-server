#!/bin/sh
if grep -q "password:" "/app/config/config.yaml"; then
    echo "Password already exists"
else
    echo "password: $(cat /proc/sys/kernel/random/uuid)" >> /app/config/config.yaml
fi

/app/src/bin/code-server --config "/app/config/config.yaml" "/app/workspace"