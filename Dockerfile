FROM python:latest
MAINTAINER Francisco Castaneda (https://github.com/chopanpma/)

RUN apt update && apt install -y git curl python3-pip exuberant-ctags ack-grep
RUN pip3 install pynvim flake8 pylint isort neovim

ADD init.vim /root/.config/nvim/init.vim
COPY squashfs-root /root/squashfs-root
RUN /root/squashfs-root/usr/bin/nvim -c PlugInstall -c UpdateRemotePlugins -c q! -c q! 

CMD ["/root/squashfs-root/usr/bin/nvim", "/src"]
