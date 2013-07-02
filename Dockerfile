FROM ubuntu
MAINTAINER zimbatm http://zimbatm.com

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN mkdir -p /app/src
ADD . /app/src

RUN /app/src/script/slugify /app/cache /app/deploy
#RUN echo '{"run_list": ["recipe[base]"]}' > /app/config.json
#RUN /app/deploy/script/install /app/config.json
