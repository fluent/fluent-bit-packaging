FROM flb-build-base-ubuntu/16.04

ARG FLB_PREFIX
ARG FLB_VERSION

ENV FLB_TARBALL http://github.com/fluent/fluent-bit/archive/${FLB_PREFIX}${FLB_VERSION}.zip

RUN cd /tmp && \
    wget -O "/tmp/fluent-bit-${FLB_VERSION}.zip" ${FLB_TARBALL} && unzip "fluent-bit-${FLB_VERSION}.zip" && \
    cd "fluent-bit-${FLB_VERSION}/build/" && \
    export CFLAGS="$CFLAGS -std=gnu99" && \
    cmake  -DCMAKE_INSTALL_PREFIX=/opt/td-agent-bit/ -DCMAKE_INSTALL_SYSCONFDIR=/etc/ \
           -DFLB_DEBUG=On -DFLB_TRACE=On -DFLB_TD=On \
           -DFLB_SQLDB=On -DFLB_HTTP_SERVER=On \
           -DFLB_OUT_KAFKA=On ../

CMD cd "/tmp/fluent-bit-${FLB_VERSION}/build/" && make -j 2 && cpack -G DEB && cp *.deb /output
