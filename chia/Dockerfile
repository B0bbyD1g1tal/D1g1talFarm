FROM ubuntu:22.04

ENV DOCKER_USER=chia
ENV TZ=Europe/Sofia
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && useradd $DOCKER_USER

RUN apt-get update && apt-get install --no-install-recommends \
    python3 python3-pip python-is-python3 nano -y  \
USER $DOCKER_USER
RUN pip install chia-blockchain

EXPOSE 8444
EXPOSE 55400
#USER ${DOCKER_USER}
