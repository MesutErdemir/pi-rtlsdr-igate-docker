FROM mpercival/resin-rtl-sdr

MAINTAINER Mesut Erdemir

RUN apt-get update \
&& apt-get install libasound2-dev libgps-dev

RUN cd ~ \
&& git clone https://www.github.com/wb2osz/direwolf \
&& cd ~/direwolf \
&& mkdir build \
&& cd build \
&& cmake .. \
&& make -j4 \
&& sudo make install

COPY sdr-igate.conf.template ./
COPY run.sh ./

CMD ./run.sh
