FROM python:latest
MAINTAINER Arturo Chong Lin

# DO NOT UPLOAD CONTAINER TO ANY REGISTRY. THIS CONTAINER IS MEANT TO BE KEPT LOCALLY AND DELETED WHEN EXPEDIENT.

# Installs dependencies
RUN apt-get update \
    && apt-get install -y software-properties-common \
    curl vim exuberant-ctags git zsh fzf ripgrep xclip \
    ack-grep vim-nox docker-compose \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && pip install pep8 flake8 pyflakes isort yapf autopep8 django \
    && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
    && git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
    
# Adds the .vimrc config file to the container.
# If you want to add your own custom bindings or plugins, you must modify config/.vimrc and then rebuild the container.
ADD config/.vimrc /root/.vimrc 
ADD config/.zshrc /root/.zshrc 
ADD config/.bash_aliases /root/.bash_aliases
ADD lazygit /usr/bin

# Runs vim when building the container, so that the required plugins are installed and stored in the container.
RUN vim -E -s -u "/root/.vimrc" +PlugInstall +PlugClean +qall

# Startup command
CMD ["vim", "/src"]
