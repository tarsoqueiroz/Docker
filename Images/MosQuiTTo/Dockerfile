FROM alpine:3.4

MAINTAINER Tarso Queiroz <tarsoqueiroz@gmail.com>

RUN apk   update                                                               && \
    apk   add ca-certificates openssl mosquitto                                && \
    mkdir -p /var/lib/mosquitto                                                && \
    mkdir -p /var/log/mosquitto                                                && \
    mkdir -p /var/run/mosquitto                                                && \
    mkdir -p /etc/mosquitto/conf.d                                             && \
    mkdir -p /etc/mosquitto/ca_certificates                                    && \
    mkdir -p /etc/mosquitto/certs                                              && \
    chown mosquitto:mosquitto /var/lib/mosquitto                               && \
    chown mosquitto:mosquitto /var/log/mosquitto                               && \
    chown mosquitto:mosquitto /var/run/mosquitto                               && \
    mv    /etc/mosquitto/mosquitto.conf /etc/mosquitto/mosquitto.conf.original

COPY mosquitto.conf /etc/mosquitto/mosquitto.conf

EXPOSE 1883 8883 9001
VOLUME ["/etc/mosquitto", "/var/lib/mosquitto", "/var/log/mosquitto"]

CMD ["/usr/sbin/mosquitto", "-c", "/etc/mosquitto/mosquitto.conf"]

