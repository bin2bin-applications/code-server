FROM ubuntu:latest

RUN apt-get update && \
  apt-get install -y curl && \
  curl -fsSL https://code-server.dev/install.sh --output install.sh && \
  sh install.sh && \
  rm -rf /.cache && \
  apt-get remove -y curl && \
  apt-get clean && \
  rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

COPY /start-service.sh /start-service.sh
COPY /config.yaml /config.yaml
COPY /reset-password.sh /reset-password.sh
RUN chmod +x /start-service.sh /reset-password.sh
ENTRYPOINT tail -f /dev/null
EXPOSE 8080