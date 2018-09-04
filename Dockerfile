FROM ubuntu:16.04

COPY configs/resolv.conf /etc/resolv.conf
COPY configs/sources.list /etc/apt/sources.list
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update

RUN apt-get install -y --no-install-recommends \
        vim \
        ca-certificates \
        git \
        sudo \
        curl \
        mesa-utils \
        libsdl2-2.0

RUN useradd -m carla
USER carla
ENV HOME /home/carla
COPY carla /home/carla
COPY configs/Example.CarlaSettings.ini /home/carla/CarlaSettings.ini

USER root
RUN chown -R carla:carla /home/carla

RUN echo "carla:carla" | chpasswd && adduser carla sudo

USER carla
WORKDIR /home/carla

CMD /bin/bash CarlaUE4.sh -carla-server