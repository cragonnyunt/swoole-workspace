ARG BASE_IMG_NAME=cragonnyunt/swoole-workspace

ARG BASE_IMG_VER=8.3.7-base

FROM $BASE_IMG_NAME:$BASE_IMG_VER

LABEL maintainer="devkore@frontiir.net"

ARG WORKSPACE_USER=kore

USER root

RUN apk update && apk add --no-cache \
    supervisor \
    tini

COPY supervisor/supervisord.conf /etc/supervisord.conf

ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c",  "/etc/supervisord.conf"]

USER ${WORKSPACE_USER}
