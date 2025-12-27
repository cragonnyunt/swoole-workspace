ARG PHP_DOCKER_TAG=8.5.1-cli-alpine3.23

FROM php:${PHP_DOCKER_TAG}

LABEL maintainer="dev_kore@frontiir.net"

ARG DOCKER_PHP_EXT_INSTALLER_VER=2.9.24
ARG PHP_EXT_GRPC_VER=1.76.0
ARG PHP_EXT_SWOOLE_VER=6.1.5
ARG PHP_EXT_PROTOBUF_VER=4.33.2
ARG PHP_EXT_RDKAFKA_VER=6.0.5
ARG PHP_EXT_REDIS_VERSION=6.3.0

ARG TZ=Asia/Yangon

ARG WORKSPACE_UID=1000
ARG WORKSPACE_GID=1000
ARG WORKSPACE_USER=kore
ARG WORKSPACE_GROUP=kore
ARG WORKSPACE_HOME=/home/${WORKSPACE_USER}
ARG WORKSPACE=/var/www

RUN addgroup -g ${WORKSPACE_GID} ${WORKSPACE_GROUP} \
    && adduser -h ${WORKSPACE_HOME} -u ${WORKSPACE_UID} -G ${WORKSPACE_GROUP} -D ${WORKSPACE_USER} \
    && apk update \
    && apk upgrade --no-cache \
    && apk add --no-cache \
    tzdata \
    freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    libzip-dev \
    linux-headers \
    && cp /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo ${TZ} > /etc/timezone \
    && apk del tzdata \
    && docker-php-ext-configure gd --with-freetype  --with-jpeg \
    && docker-php-ext-install bcmath gd mysqli pdo pdo_mysql sockets zip \
    && docker-php-ext-enable bcmath gd mysqli pdo pdo_mysql sockets zip \
    && curl -sSL https://github.com/mlocati/docker-php-extension-installer/releases/download/${DOCKER_PHP_EXT_INSTALLER_VER}/install-php-extensions -o - | IPE_LZF_BETTERCOMPRESSION=1 sh -s \
      grpc-${PHP_EXT_GRPC_VER} \
      protobuf-${PHP_EXT_PROTOBUF_VER} \
      rdkafka-${PHP_EXT_RDKAFKA_VER} \
      swoole-${PHP_EXT_SWOOLE_VER} \
      redis-${PHP_EXT_REDIS_VERSION} \
    && apk cache clean

USER ${WORKSPACE_USER}

WORKDIR ${WORKSPACE}
