FROM centos:7

ARG FLB_PREFIX
ARG FLB_VERSION

ENV FLB_TARBALL http://github.com/fluent/fluent-bit/archive/$FLB_PREFIX$FLB_VERSION.zip

RUN yum -y update && \
    yum install -y rpm-build curl ca-certificates gcc gcc-c++ cmake make bash wget unzip && \
    cd /tmp && \
    wget -O "/tmp/fluent-bit-${FLB_VERSION}.zip" ${FLB_TARBALL} && \
    unzip "fluent-bit-$FLB_VERSION.zip" && \
    cd "/tmp/fluent-bit-${FLB_VERSION}/build" && \
    cmake -DFLB_DEBUG=On -DFLB_TRACE=On -DFLB_TD=On \
          -DFLB_BUFFERING=On -DFLB_SQLDB=On ../

CMD cd "/tmp/fluent-bit-${FLB_VERSION}/build/" && make && cpack && cp *.rpm /output/
