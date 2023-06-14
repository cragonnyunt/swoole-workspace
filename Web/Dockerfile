ARG BASE_IMG_NAME=cragonnyunt/swoole-workspace

ARG BASE_IMG_VER=8.2.6-base

FROM $BASE_IMG_NAME:$BASE_IMG_VER

LABEL maintainer="devkore@frontiir.net"

ARG WORKSPACE_USER=kore

USER root

RUN apk update && apk add --no-cache \
    tini

ENTRYPOINT ["/sbin/tini", "--"]

CMD ["php", "/var/www/artisan", "kore:serve"]

USER ${WORKSPACE_USER}
