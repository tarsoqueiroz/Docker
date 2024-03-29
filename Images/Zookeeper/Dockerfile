FROM openjdk:8-jre-alpine
MAINTAINER Tarso Queiroz <tarsoqueiroz@gmail.com>
# ORIGINAL MAINTAINER Elisey Zanko <elisey.zanko@gmail.com>

# Install required packages
RUN apk add --no-cache \
    bash \
    su-exec

ENV ZOO_USER=zookeeper \
    ZOO_DIR_CONF=/conf \
    ZOO_DIR_DATA=/data \
    ZOO_DIR_LOG=/datalog \
    ZOO_PORT_CLIENT=2181 \
    ZOO_PORT_CONNECTION=2888 \
    ZOO_PORT_ELECTION=3888 \
    ZOO_TICK_TIME=2000 \
    ZOO_INIT_LIMIT=5 \
    ZOO_SYNC_LIMIT=2

# Add a user and make dirs
RUN set -x \
    && adduser -D "$ZOO_USER" \
    && mkdir -p "$ZOO_DIR_LOG" "$ZOO_DIR_DATA" "$ZOO_DIR_CONF" \
    && chown "$ZOO_USER:$ZOO_USER" "$ZOO_DIR_LOG" "$ZOO_DIR_DATA" "$ZOO_DIR_CONF"

ARG GPG_KEY=C823E3E5B12AF29C67F81976F5CECB3CB5E9BD2D
ARG DISTRO_NAME=zookeeper-3.4.9

# Download Apache Zookeeper, verify its PGP signature, untar and clean up
RUN set -x \
    && apk add --no-cache --virtual .build-deps \
        gnupg \
    && wget -q "http://www.apache.org/dist/zookeeper/$DISTRO_NAME/$DISTRO_NAME.tar.gz" \
    && wget -q "http://www.apache.org/dist/zookeeper/$DISTRO_NAME/$DISTRO_NAME.tar.gz.asc" \
    && export GNUPGHOME="$(mktemp -d)" \
    && gpg --keyserver ha.pool.sks-keyservers.net --recv-key "$GPG_KEY" \
    && gpg --batch --verify "$DISTRO_NAME.tar.gz.asc" "$DISTRO_NAME.tar.gz" \
    && tar -xzf "$DISTRO_NAME.tar.gz" \
    && mv "$DISTRO_NAME/conf/"* "$ZOO_DIR_CONF" \
    && rm -r "$GNUPGHOME" "$DISTRO_NAME.tar.gz" "$DISTRO_NAME.tar.gz.asc" \
    && apk del .build-deps

WORKDIR $DISTRO_NAME
VOLUME ["$ZOO_DIR_CONF", "$ZOO_DIR_DATA", "$ZOO_DIR_LOG"]

EXPOSE $ZOO_PORT_CLIENT $ZOO_PORT_CONNECTION $ZOO_PORT_ELECTION

ENV PATH=$PATH:/$DISTRO_NAME/bin \
    ZOOCFGDIR=$ZOO_DIR_CONF

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["zkServer.sh", "start-foreground"]
