FROM centos:7

ARG FLB_PREFIX
ARG FLB_VERSION

ENV FLB_TARBALL http://github.com/fluent/fluent-bit/archive/$FLB_PREFIX$FLB_VERSION.zip

RUN yum -y update && \
    yum install -y rpm-build curl ca-certificates gcc gcc-c++ cmake make bash wget unzip systemd-devel wget && \
    wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    rpm -ivh epel-release-latest-7.noarch.rpm && \
    yum install -y cmake3 && \
    cd /tmp && \
    wget -O "/tmp/fluent-bit-${FLB_VERSION}.zip" ${FLB_TARBALL} && \
    unzip "fluent-bit-$FLB_VERSION.zip" && \
    cd "/tmp/fluent-bit-${FLB_VERSION}/build" && \
    cmake3 -DFLB_DEBUG=On -DFLB_TRACE=On -DFLB_TD=On \
           -DFLB_BUFFERING=On -DFLB_SQLDB=On -DFLB_HTTP_SERVER=On \
           -DFLB_OUT_KAFKA=On ../

CMD cd "/tmp/fluent-bit-${FLB_VERSION}/build/" && make && cpack && cp *.rpm /output/
