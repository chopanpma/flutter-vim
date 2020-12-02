FROM python:latest
MAINTAINER Arturo Chong Lin

# Installs dependencies
RUN apt-get update \
    && apt-get install -y software-properties-common \
    curl vim exuberant-ctags git zsh fzf ripgrep \
    ack-grep vim-nox \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip install pep8 flake8 pyflakes isort yapf autopep8

# Adds the .vimrc config file to the container.
# If you want to add your own custom bindings or plugins, you must modify config/.vimrc and then rebuild the container.
ADD vim-config/.vimrc /root/.vimrc

# Runs vim when building the container, so that the required plugins are installed and stored in the container.
RUN vim -E -s -u "/root/.vimrc" +PlugInstall +PlugClean +qall

# Startup command
CMD ["vim", "/src"]
