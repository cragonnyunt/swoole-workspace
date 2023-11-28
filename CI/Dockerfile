ARG BASE_IMG_NAME=cragonnyunt/swoole-workspace

ARG BASE_IMG_VER=8.3.0-web

FROM $BASE_IMG_NAME:$BASE_IMG_VER

LABEL maintainer="devkore@frontiir.net"

ARG DOCKER_PHP_EXT_INSTALLER_VER=2.1.66
ARG COMPOSER_VER=2.6.5
ARG PHP_EXT_PCOV_VER=1.0.11

ARG WORKSPACE_USER=kore

USER root

RUN curl -sSL https://github.com/mlocati/docker-php-extension-installer/releases/download/${DOCKER_PHP_EXT_INSTALLER_VER}/install-php-extensions -o - | sh -s \
      @composer-${COMPOSER_VER} \
      pcov-${PHP_EXT_PCOV_VER} \
    && apk update && apk add --no-cache \
    git \
    mysql-client \
    openssh-client

CMD ["/bin/sh"]

USER ${WORKSPACE_USER}
