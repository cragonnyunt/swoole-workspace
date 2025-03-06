ARG BASE_IMG_NAME=cragonnyunt/swoole-workspace

ARG BASE_IMG_VER=8.4.4-worker

FROM $BASE_IMG_NAME:$BASE_IMG_VER

ARG DOCKER_PHP_EXT_INSTALLER_VER=2.7.27
ARG COMPOSER_VER=2.8.6
ARG PHP_EXT_PCOV_VER=1.0.12

ARG WORKSPACE_USER=kore

USER root

COPY supervisor/supervisord.conf /etc/supervisord.conf

COPY --chown=$WORKSPACE_USER:$WORKSPACE_USER composer/composer.json /home/${WORKSPACE_USER}/.composer/composer.json

RUN mkdir -p /var/log/supervisor \
    && touch /var/log/supervisor/swoole-worker.log \
    && touch /var/log/supervisor/swoole-worker-error.log \
    && chown ${WORKSPACE_USER}:${WORKSPACE_USER} /var/log/supervisor/*.log \
    && curl -sSL https://github.com/mlocati/docker-php-extension-installer/releases/download/${DOCKER_PHP_EXT_INSTALLER_VER}/install-php-extensions -o - | sh -s \
      @composer-${COMPOSER_VER} \
      pcov-${PHP_EXT_PCOV_VER} \
    && su -c 'composer global install' - ${WORKSPACE_USER} \
    && apk update && apk add --no-cache \
    curl \
    entr \
    fd \
    gcc \
    git \
    htop \
    iputils \
    mysql-client \
    neovim \
    openssh-client \
    ripgrep \
    supervisor \
    the_silver_searcher \
    tmux \
    zsh \
    && mkdir -p /home/${WORKSPACE_USER}/.vscode-server \
    && chown -R ${WORKSPACE_USER}:${WORKSPACE_USER} /home/${WORKSPACE_USER}/.vscode-server \
    && sed -i -e 's/bin\/ash/bin\/zsh/' /etc/passwd \
    && echo "pcov.enabled=0" >> /usr/local/etc/php/conf.d/docker-php-ext-pcov.ini

ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c",  "/etc/supervisord.conf"]

USER ${WORKSPACE_USER}

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
    && git clone https://github.com/zsh-users/zsh-autosuggestions /home/${WORKSPACE_USER}/.oh-my-zsh/custom/plugins/zsh-autosuggestions \
    && sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

RUN echo 'if [ -n "$TMUX" ]; then exit 0; fi; SESH="kore"; tmux has-session -t $SESH 2>/dev/null; if [ $? != 0 ]; then tmux new-session -s $SESH; else exec tmux attach-session -t $SESH; fi;' > /home/${WORKSPACE_USER}/.profile

ENV ENV=/home/${WORKSPACE_USER}/.profile

COPY --chown=$WORKSPACE_USER:$WORKSPACE_USER zsh/zshrc /home/${WORKSPACE_USER}/.zshrc

COPY --chown=$WORKSPACE_USER:$WORKSPACE_USER tmux/tmux.conf /home/${WORKSPACE_USER}/.tmux.conf

COPY --chown=$WORKSPACE_USER:$WORKSPACE_USER nvim/init.vim /home/${WORKSPACE_USER}/.config/nvim/init.vim
