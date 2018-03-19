FROM dogbull/centos-python-gdal
MAINTAINER ParkJooHyeon <www.jrr.kr@gmail.com>


ENV \
    MAPSERVER_VERSION=7.0.7 \
    MAPSERVER_PORT=80


RUN \
    yum install -y \
        cmake \
        fribidi-devel \
        harfbuzz-devel \
        cairo-devel \
        fcgi-devel \
        mod_fcgid && \
    yum clean all


RUN \
    mkdir /tmp/workspace/ && \
    cd /tmp/workspace && \
    curl -O  http://download.osgeo.org/mapserver/mapserver-${MAPSERVER_VERSION}.tar.gz && \
    tar xvfz mapserver-${MAPSERVER_VERSION}.tar.gz && \
    cd mapserver-${MAPSERVER_VERSION} && \
    mkdir build && \
    cd build && \
    cmake ../ > ../configure.out.txt && \
    make && \
    make install && \
    rm -rf /tmp/workspace


EXPOSE \
    ${MAPSERVER_PORT}


RUN \
    cp /usr/local/bin/mapserv /var/www/cgi-bin/mapserv


CMD \
    httpd -D FOREGROUND
