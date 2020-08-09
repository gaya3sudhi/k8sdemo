FROM ubuntu:16.04
MAINTAINER "soundappan.ors@gmail.com" else LABLE maintainer="soundappan.ors@gmail.com"
RUN apt-get update
RUN apt-get install -y python3
RUN apt-get install -y git
