FROM fedora:25

ARG FLB_PREFIX
ARG FLB_VERSION

ENV FLB_TARBALL http://github.com/fluent/fluent-bit/archive/$FLB_PREFIX$FLB_VERSION.zip

RUN dnf -y update && \
    dnf install -y rpm-build curl ca-certificates gcc gcc-c++ cmake make bash wget unzip && \
    wget -O "/tmp/fluent-bit-${FLB_VERSION}.zip" ${FLB_TARBALL} && \
    cd /tmp && unzip "fluent-bit-$FLB_VERSION.zip"

CMD cd "/tmp/fluent-bit-${FLB_VERSION}/build" && \
    cmake -DFLB_DEBUG=On -DFLB_TRACE=On -DFLB_JEMALLOC=On -DFLB_TD=On \
          -DFLB_BUFFERING=On -DFLB_SQLDB=On ../ && \
    make && cpack && cp *.rpm /output/
