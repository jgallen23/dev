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

#utf8
RUN locale-gen en_US.UTF-8
ENV LC_ALL en_US.utf-8

#Timezone
RUN echo America/Los_Angeles | sudo tee /etc/timezone && sudo dpkg-reconfigure --frontend noninteractive tzdata

#ngrok
RUN cd /tmp && \
  wget https://dl.ngrok.com/ngrok_2.0.19_linux_amd64.zip -O ngrok.zip && \
  unzip ngrok.zip && \
  mv ngrok /usr/local/bin/

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

EXPOSE 8080

#dotfiles
ADD dotfiles-setup /dotfiles-setup

