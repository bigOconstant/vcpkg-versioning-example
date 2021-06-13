################################################
# Developer stage, to build test and compile
# All from inside a container
################################################
from ubuntu:latest as developer

RUN apt-get update
RUN apt-get upgrade -y

#install developer dependencies
RUN apt-get install clang -y
RUN apt-get install cmake -y
RUN apt-get install git -y
RUN apt-get install curl -y
RUN apt-get install zip -y
RUN apt-get install gdb -y
RUN apt-get install pkg-config -y
RUN apt-get install libssl-dev -y
RUN apt-get install jq -y;
RUN apt-get install pip -y;
RUN pip install kafka-python;

RUN apt-get install wget -y;

ARG USERNAME=dev 

ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN apt install sudo -y


RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    #
    # add sudo support
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

USER $USERNAME

# set work directory for project
WORKDIR /Project

RUN sudo chown -R $USERNAME /Project 



WORKDIR /Project

CMD ["sleep","infinity"]