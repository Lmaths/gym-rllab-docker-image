FROM ubuntu:trusty
MAINTAINER Jack Liu jackliu.lab@gmail.com

WORKDIR /home

# install pip3
RUN apt-get update -y && apt-get install -y python3-setuptools python3-dev build-essential

RUN easy_install3 pip

# install dependencies of the Gym
RUN apt-get install -y gcc g++ python3-numpy python3-dev  cmake zlib1g-dev libjpeg-dev xvfb libav-tools xorg-dev python3-opengl

# box-2d dependency
RUN apt-get install -y swig

# install git
RUN apt-get install -y git

RUN rm -rf /var/lib/apt

# install nose2 for python test
RUN pip3 install nose2

# pyglet for classic control
RUN pip3 install pyglet

# install OpenAI Gym (all, exclude MuJoCo)
RUN git clone https://github.com/openai/gym.git && cd gym
RUN pip3 install -e '.[all]'
