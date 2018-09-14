FROM flb-build-base-raspbian/stretch

ARG FLB_PREFIX
ARG FLB_VERSION

ENV FLB_TARBALL http://github.com/fluent/fluent-bit/archive/$FLB_PREFIX$FLB_VERSION.zip

RUN wget -O "/tmp/fluent-bit-${FLB_VERSION}.zip" ${FLB_TARBALL} && \
    cd /tmp && unzip "fluent-bit-$FLB_VERSION.zip"

CMD cd "/tmp/fluent-bit-${FLB_VERSION}/" && ./debian.sh && cp ../*.deb /output
