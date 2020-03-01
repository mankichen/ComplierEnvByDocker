FROM ubuntu:14.04
MAINTAINER Manki Chen 
ENV REFRESHED_AT 2019-11-22

# Var
ARG board

# Copy depend file to container
ADD ./dep/jdk-6u45-linux-x64.bin /usr/local/

# Set enviroment var
ENV JAVA_HOME /usr/local/jdk1.6.0_45
ENV JRE_HOME $JAVA_HOME/jre
ENV CLASSPATH .:$JAVA_HOME/lib:$JRE_HOME/lib
ENV PATH $PATH:$JAVA_HOME/bin

# New neoway source mount dir
RUN mkdir /home/${board}

# Extract JDK
RUN chmod u+x /usr/local/jdk-6u45-linux-x64.bin
WORKDIR /usr/local
RUN ./jdk-6u45-linux-x64.bin
WORKDIR /

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
RUN EBIAN_FRONTEND=noninteractive apt-get install -y gcc-multilib
RUN EBIAN_FRONTEND=noninteractive apt-get install -y g++-multilib
RUN EBIAN_FRONTEND=noninteractive apt-get install -y flex bison g++-multilib git gperf libxml2-utils make python-networkx zlib1g-dev:i386 zip
RUN EBIAN_FRONTEND=noninteractive apt-get install -y bc curl

# Setting alias 
RUN ln -s /usr/local/jdk1.6.0_45/bin/java /usr/bin/java && \
    ln -s /usr/local/jdk1.6.0_45/bin/javac /usr/bin/javac

#RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 2
#RUN update-alternatives --config gcc


# Install repo
RUN mkdir /root/.bin
RUN curl https://mirrors.tuna.tsinghua.edu.cn/git/git-repo -o /root/.bin/repo
RUN chmod a+x /root/.bin/repo
ENV PATH $PATH:/root/.bin 

WORKDIR /home/${board}

