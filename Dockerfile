from ubuntu

#CORE
RUN apt-get update && \
  apt-get install -y \
    git \
    htop \
    wget \
    curl \
    software-properties-common \
    mongodb \
    unzip \
    python \
    make \
    python-pip \
    exuberant-ctags

#VIM
RUN add-apt-repository ppa:fcwu-tw/ppa && \
  apt-get update && \
  apt-get install -y vim

#TMUX
RUN add-apt-repository -y ppa:pi-rho/dev && \
  apt-get update && \
  apt-get install -y tmux

#node
RUN curl https://deb.nodesource.com/setup > /tmp/node && bash /tmp/node && apt-get install -y nodejs

#docker
RUN curl https://get.docker.com/ > /tmp/docker && bash /tmp/docker

#docker-compose
RUN curl -L https://github.com/docker/compose/releases/download/1.3.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose

#utf8
RUN locale-gen en_US.UTF-8
ENV LC_ALL en_US.utf-8

#Timezone
RUN echo America/Los_Angeles | sudo tee /etc/timezone && sudo dpkg-reconfigure --frontend noninteractive tzdata

#global node libs
RUN npm install -g david grunt-cli bower jscs jshint nodemon

#update npm
RUN npm update -g npm

#aws
RUN pip install awscli && pip install awsebcli

#mon
RUN mkdir /tmp/mon && cd /tmp/mon && curl -L# https://github.com/visionmedia/mon/archive/master.tar.gz | tar zx --strip 1 && make install && rm -rf /tmp/mon

#mongroup
RUN mkdir /tmp/mongroup && cd /tmp/mongroup && curl -L# https://github.com/jgallen23/mongroup/archive/master.tar.gz | tar zx --strip 1 && make install

#s3cmd
RUN wget -O- -q http://s3tools.org/repo/deb-all/stable/s3tools.key | sudo apt-key add - && \
  wget -O/etc/apt/sources.list.d/s3tools.list http://s3tools.org/repo/deb-all/stable/s3tools.list && \
  apt-get update && \
  apt-get -y install s3cmd

EXPOSE 8080

#docker-extras
RUN curl -sSL https://raw.githubusercontent.com/jgallen23/docker-extras/master/install.sh | sudo bash

#git-extras
RUN curl -sSL http://git.io/git-extras-setup | sudo bash /dev/stdin

#dotfiles
ADD dotfiles-setup /dotfiles-setup

