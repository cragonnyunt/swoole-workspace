ARG BASE_IMG_NAME=cragonnyunt/swoole

ARG BASE_IMG_VER=8.2.6-base

FROM $BASE_IMG_NAME:$BASE_IMG_VER

LABEL maintainer="devkore@frontiir.net"

ARG WORKSPACE_USER=kore

USER root

RUN apk update && apk add --no-cache \
    supervisor

COPY supervisor/supervisord.conf /etc/supervisord.conf

ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c",  "/etc/supervisord.conf"]

USER ${WORKSPACE_USER}
