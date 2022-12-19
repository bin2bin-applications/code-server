#!/bin/bash
if [ ! -f "/app/config/config.yaml" ]; then
    mkdir -p /app/src /app/config /app/workspace /app/user-data /app/extensions
    echo "bind-addr: 0.0.0.0:8080" > /app/config/config.yaml && \
    echo "auth: password" >> /app/config/config.yaml && \
    echo "cert: false" >> /app/config/config.yaml && \
    echo "user-data-dir: /app/user-data" >> /app/config/config.yaml && \
    echo "extensions-dir: /app/extensions" >> /app/config/config.yaml && \
    echo "disable-telemetry: true" >> /app/config/config.yaml && \
    echo "disable-update-check: true" >> /app/config/config.yaml && \
    echo "password: $(cat /proc/sys/kernel/random/uuid)" >> /app/config/config.yaml
fi
/root/app/bin/code-server --config "/app/config/config.yaml" "/app/workspace"