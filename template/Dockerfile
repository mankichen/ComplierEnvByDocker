FROM ubuntu:14.04
MAINTAINER Manki Chen 
ENV REFRESHED_AT 2019-11-22

# Var
ARG board

# Copy depend file to container
#ADD ./dep/sources.list /home/

# Set enviroment var
#ENV PATH $PATH:$JAVA_HOME/bin

ENV DEBIAN_FRONTEND noninteractive

# New neoway source mount dir
RUN mkdir /home/${board}

# Change apt source after backup, only support ubuntu
RUN cp /etc/apt/sources.list /etc/apt/sources.list.bkp
RUN sed -i "s/archive.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list

RUN printf "#!/bin/sh\nexit 0" > /usr/sbin/policy-rc.d

# Enable multi-architecture support
RUN dpkg --add-architecture i386

# Install software here
RUN DEBIAN_FRONTEND=noninteractive apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y make && \ 
    DEBIAN_FRONTEND=noninteractive apt-get install -y libncurses5-dev && \
    EBIAN_FRONTEND=noninteractive apt-get install -y vim 
# example: RUN EBIAN_FRONTEND=noninteractive apt-get install -y xxxx

# Setting alias 
#RUN ln -sf /usr/bin/gcc-4.8 /usr/bin/gcc
#RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 2
#RUN update-alternatives --config gcc


WORKDIR /home/${board}

