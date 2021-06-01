ARG CODE_VERSION=20.04

FROM ubuntu:${CODE_VERSION}

RUN apt update -y               && \
    apt install -y curl         && \
    apt clean                   && \
    apt autoclean               && \
    apt autoremove -y           && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /home/Codes

ENV USER Cerulean-Canvas
ENV SHELL /bin/bash
ENV LONGNAME Cerulean-Canv

CMD ["bash"]
