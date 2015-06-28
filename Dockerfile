from ubuntu

#CORE
RUN apt-get update && \
  apt-get install -y git htop wget curl software-properties-common

#VIM
RUN add-apt-repository ppa:fcwu-tw/ppa && \
  apt-get update && \
  apt-get install -y vim

#TMUX
RUN add-apt-repository -y ppa:pi-rho/dev && \
  apt-get update && \
  apt-get install -y tmux

RUN curl https://deb.nodesource.com/setup > /tmp/node && bash /tmp/node && apt-get install -y nodejs

RUN curl https://get.docker.com/ > /tmp/docker && bash /tmp/docker

RUN locale-gen en_US.UTF-8

#global node libs
RUN npm install -g david grunt-cli bower jscs jshint

#dotfiles
ADD dotfiles-setup /dotfiles-setup

