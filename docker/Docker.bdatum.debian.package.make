FROM bdatum/debian
MAINTAINER Thiago Rondon, thiago@b-datum.com

RUN apt-get update
RUN apt-get -y install wget libnet-ssleay-perl git dh-make-perl devscripts build-essential git
RUN apt-file update
RUN curl -L http://cpanmin.us | perl - --sudo version
RUN curl -L http://cpanmin.us | perl - --sudo ExtUtils::MakeMaker
RUN git clone https://github.com/b-datum/b-datum-linux.git
RUN bash b-datum-linux/scripts/debpackage.sh

