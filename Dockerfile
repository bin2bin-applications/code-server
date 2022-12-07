FROM ubuntu:latest

ARG DEBIAN_FRONTEND="noninteractive"
COPY reset-pass.sh /reset-pass.sh
COPY entrypoint.sh /entrypoint.sh

RUN \
  mkdir -p /root/app && \
  apt-get update && \
  apt-get install -y curl git jq libatomic1 nano net-tools netcat sudo && \
  export CODE_RELEASE=$(curl -sX GET https://api.github.com/repos/coder/code-server/releases/latest | jq -r '.name' | cut -c 2-) && \
  curl -o /tmp/code-server.tar.gz -L "https://github.com/coder/code-server/releases/download/v${CODE_RELEASE}/code-server-${CODE_RELEASE}-linux-amd64.tar.gz" && \
  tar xf /tmp/code-server.tar.gz -C /root/app --strip-components=1 && \
  apt-get clean && \
  chmod +x /reset-pass.sh /entrypoint.sh && \
  rm -rf /config/* /tmp/* /var/lib/apt/lists/* /var/tmp/*

EXPOSE 8080
ENTRYPOINT ["/entrypoint.sh"]