FROM ubuntu:18.04

USER root

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Prague

RUN apt update 
RUN apt install -y curl
RUN apt install -y python3-pip
RUN apt install -y python3-notebook
RUN apt install -y python3-matplotlib

RUN curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
RUN bash -c "echo 'deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main' | tee /etc/apt/sources.list.d/kubernetes.list"
RUN apt update && apt install -y kubectl

WORKDIR /work
ENV HOME /work
RUN mkdir -p /work
RUN chown 1001:1001 /work

RUN mkdir /opt/app

COPY start-notebook.sh /opt/app
ENV PATH /opt/app:${PATH}


