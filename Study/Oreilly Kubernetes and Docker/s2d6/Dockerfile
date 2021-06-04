ARG CODE_VERSION=20.04

FROM ubuntu:${CODE_VERSION}

RUN apt update -y               && \
    apt install -y nginx        && \
    apt clean                   && \
    apt autoclean               && \
    apt autoremove -y           && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

