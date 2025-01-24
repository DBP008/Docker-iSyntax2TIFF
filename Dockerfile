FROM ubuntu:20.04

ENV LANG=C.UTF-8
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y \
    curl \
    gcc \
    git \
    libblosc-dev \
    libcurl4 \
    libegl1-mesa \
    libgles2-mesa \
    libjpeg-turbo8 \
    libpng16-16 \
    libtinyxml2.6.2v5 \
    python3 \
    python3-setuptools \
    unzip \
    python3-dev \
    openjdk-11-jdk-headless \
    g++ \
    python3-pip \
    libtiff5-dev \
    lsb-release 

RUN pip3 install --upgrade pip setuptools numpy

COPY convert_and_overview.sh /root/
RUN chmod +x /root/convert_and_overview.sh

COPY philips-pathologysdk-*.zip /tmp
RUN unzip /tmp/philips*.zip -d /tmp
RUN dpkg -i /tmp/philips-pathologysdk-*/pathologysdk-modules/philips-pathologysdk-pixelengine*.deb
RUN dpkg -i /tmp/philips-pathologysdk-*/pathologysdk-modules/philips-pathologysdk-softwarerenderer*.deb
RUN dpkg -i /tmp/philips-pathologysdk-*/pathologysdk-python38-modules/philips-pathologysdk-python3-pixelengine*.deb
RUN dpkg -i /tmp/philips-pathologysdk-*/pathologysdk-python38-modules/philips-pathologysdk-python3-softwarerendercontext*.deb
RUN dpkg -i /tmp/philips-pathologysdk-*/pathologysdk-python38-modules/philips-pathologysdk-python3-softwarerenderbackend*.deb
RUN rm -rf /tmp/philips*

COPY PythonTools.zip /tmp
RUN unzip /tmp/PythonTools.zip -d /root
RUN rm -rf /tmp/PythonTools.zip

RUN mkdir /root/dp

WORKDIR /root

ENTRYPOINT ["/root/convert_and_overview.sh"]
