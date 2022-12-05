FROM ubuntu:latest

ARG DEBIAN_FRONTEND="noninteractive"
COPY reset-pass.sh /reset-pass.sh
COPY entrypoint.sh /entrypoint.sh

RUN \
  mkdir -p /app/src /app/config /app/workspace /app/user-data /app/extensions  && \
  export RANDOM_PASS=$(cat /proc/sys/kernel/random/uuid) && \
  echo "bind-addr: 0.0.0.0:8080" > /app/config/config.yaml && \
  echo "auth: password" >> /app/config/config.yaml && \
  echo "cert: false" >> /app/config/config.yaml && \
  echo "user-data-dir: /app/user-data" >> /app/config/config.yaml && \
  echo "extensions-dir: /app/extensions" >> /app/config/config.yaml && \
  echo "disable-telemetry: true" >> /app/config/config.yaml && \
  echo "disable-update-check: true" >> /app/config/config.yaml && \
  apt-get update && \
  apt-get install -y curl git jq libatomic1 nano net-tools netcat sudo && \
  export CODE_RELEASE=$(curl -sX GET https://api.github.com/repos/coder/code-server/releases/latest | jq -r '.name' | cut -c 2-) && \
  curl -o /tmp/code-server.tar.gz -L "https://github.com/coder/code-server/releases/download/v${CODE_RELEASE}/code-server-${CODE_RELEASE}-linux-amd64.tar.gz" && \
  tar xf /tmp/code-server.tar.gz -C /app/src --strip-components=1 && \
  apt-get clean && \
  chmod +x /reset-pass.sh /entrypoint.sh && \
  rm -rf /config/* /tmp/* /var/lib/apt/lists/* /var/tmp/*

VOLUME [ "/app/config", "/app/workspace", "/app/user-data", "/app/extensions" ]
EXPOSE 8080
ENTRYPOINT ["/entrypoint.sh"]