FROM ubuntu:22.04

ADD . /source

WORKDIR /source

RUN ls -la

RUN chmod +x install_deps.sh
RUN chmod +x build.sh

RUN ./install_deps.sh
RUN ./build.sh

RUN mkdir /app
RUN mv /source/build/pid /app/

RUN rm -rf /source

WORKDIR /app
ENTRYPOINT ["pid"]