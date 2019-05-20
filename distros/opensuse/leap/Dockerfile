FROM flb-build-base-opensuse/leap

ARG FLB_PREFIX
ARG FLB_VERSION

ENV FLB_TARBALL http://github.com/fluent/fluent-bit/archive/$FLB_PREFIX$FLB_VERSION.zip

RUN cd /tmp && \
    wget -O "/tmp/fluent-bit-${FLB_VERSION}.zip" ${FLB_TARBALL} && \
    unzip "fluent-bit-$FLB_VERSION.zip" && \
    cd "/tmp/fluent-bit-${FLB_VERSION}/build" && \
    cmake -DFLB_DEBUG=On -DFLB_TRACE=On -DFLB_TD=On \
          -DFLB_BUFFERING=On -DFLB_SQLDB=On -DFLB_HTTP_SERVER=On \
          -DFLB_OUT_KAFKA=On ../

CMD cd "/tmp/fluent-bit-${FLB_VERSION}/build/" && make && cpack && cp *.rpm /output/
