FROM alpine:3.4

# Install required packages
RUN \
  apk add --no-cache ca-certificates py-openssl py-lxml git
RUN \
  git clone https://github.com/CouchPotato/CouchPotatoServer.git /couchpotato && \
  mkdir /data /download /media || true && \
  chmod 0777 -R /couchpotato /data /download /media

COPY start.sh /start.sh

VOLUME ["/data", "/download", "/media"]

WORKDIR /data

EXPOSE 5050

ENTRYPOINT ["sh", "/start.sh"]
