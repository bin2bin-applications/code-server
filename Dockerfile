FROM ubuntu:latest

RUN apt-get update && \
  apt-get install -y curl && \
  curl -fsSL https://code-server.dev/install.sh --output install.sh && \
  sh install.sh && \
  rm -rf /.cache && \
  apt-get remove -y curl && \
  apt-get clean && \
  rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

COPY /entrypoint.sh /entrypoint.sh
COPY /config.yaml /config.yaml
COPY /reset-password.sh /reset-password.sh
RUN chmod +x /entrypoint.sh /reset-password.sh
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 8080
