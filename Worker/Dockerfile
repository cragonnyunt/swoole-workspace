ARG BASE_IMG_NAME=cragonnyunt/swoole-workspace

ARG BASE_IMG_VER=8.4.1-base

FROM $BASE_IMG_NAME:$BASE_IMG_VER

ARG WORKSPACE_USER=kore

USER root

RUN apk update && apk add --no-cache \
    tini

ENTRYPOINT ["/sbin/tini", "--"]

USER ${WORKSPACE_USER}
