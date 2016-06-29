FROM mklbtz/ruby-oce
MAINTAINER Michael Bates <mklbtz@gmail.com>

RUN apt-get update && \
    apt-get install -y swig3.0 libpython2.7-dev && \
    rm -rf /var/lib/apt/lists/*

RUN set -ex && \
    git clone git://github.com/tpaviot/pythonocc-core.git && \
    mkdir pythonocc-core/build && \
    cd pythonocc-core/build && \
    mkdir /usr/local/include/lib/oce && \
    cmake .. \
        -DSWIG_EXECUTABLE=/usr/bin/swig3.0 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/x86_64-linux-gnu/libpython2.7.so.1.0 && \
    make && \
    make install && \
    cd ../.. && \
    rm pythonocc-core

