FROM alpine:latest

# Install required packages
RUN \
  apk add --update ca-certificates openssl py-openssl py-lxml py-pip git && \
  git clone https://github.com/CouchPotato/CouchPotatoServer.git /couchpotato && \
  mkdir /couchpotato /data /download /media || true && \
  chmod 0775 -R /couchpotato /data /download /media && \
  rm -rf /var/cache/apk/*

COPY start.sh /start.sh

ENV DATA_DIR=/media

VOLUME ["/data", "/download", "/media"]

WORKDIR /data

EXPOSE 5050

ENTRYPOINT ["sh", "/start.sh"]
