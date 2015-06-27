from ubuntu

RUN apt-get update && apt-get install -y vim git htop tmux wget curl

RUN curl https://deb.nodesource.com/setup > /tmp/node && bash /tmp/node && apt-get install -y nodejs

RUN curl https://get.docker.com/ > /tmp/docker && bash /tmp/docker


