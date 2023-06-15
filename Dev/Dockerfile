ARG BASE_IMG_NAME=cragonnyunt/swoole-workspace

ARG BASE_IMG_VER=8.2.6-worker

FROM $BASE_IMG_NAME:$BASE_IMG_VER

LABEL maintainer="devkore@frontiir.net"

ARG DOCKER_PHP_EXT_INSTALLER_VER=2.1.28
ARG COMPOSER_VER=2.5.7

ARG WORKSPACE_USER=kore

USER root

COPY --chown=$WORKSPACE_USER:$WORKSPACE_USER composer.json /home/${WORKSPACE_USER}/.composer/composer.json

RUN mkdir -p /var/log/supervisor \
    && touch /var/log/supervisor/swoole-worker.log \
    && touch /var/log/supervisor/swoole-worker-error.log \
    && chown ${WORKSPACE_USER}:${WORKSPACE_USER} /var/log/supervisor/*.log \
    && curl -sSL https://github.com/mlocati/docker-php-extension-installer/releases/download/${DOCKER_PHP_EXT_INSTALLER_VER}/install-php-extensions -o - | sh -s \
      @composer-${COMPOSER_VER} \
    && su -c 'composer global install' - ${WORKSPACE_USER} \
    && apk update && apk add --no-cache \
    curl \
    git \
    htop \
    iputils \
    mysql-client \
    neovim \
    openssh-client \
    the_silver_searcher \
    tmux \
    zsh \
    && mkdir -p /home/${WORKSPACE_USER}/.vscode-server \
    && chown -R ${WORKSPACE_USER}:${WORKSPACE_USER} /home/${WORKSPACE_USER}/.vscode-server \
    && sed -i -e 's/bin\/ash/bin\/zsh/' /etc/passwd

USER ${WORKSPACE_USER}

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
    && git clone https://github.com/zsh-users/zsh-autosuggestions /home/${WORKSPACE_USER}/.oh-my-zsh/custom/plugins/zsh-autosuggestions \
    && sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

ENV ENV=/home/${WORKSPACE_USER}/.profile

RUN echo "exec tmux new -s $WORKSPACE_USER" > /home/${WORKSPACE_USER}/.profile

COPY --chown=$WORKSPACE_USER:$WORKSPACE_USER zsh/zshrc /home/${WORKSPACE_USER}/.zshrc

COPY --chown=$WORKSPACE_USER:$WORKSPACE_USER tmux/tmux.conf /home/${WORKSPACE_USER}/.tmux.conf

COPY --chown=$WORKSPACE_USER:$WORKSPACE_USER nvim/init.vim /home/${WORKSPACE_USER}/.config/nvim/init.vim
