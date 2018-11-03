FROM alpine:3.8
MAINTAINER MqllR <>

ARG IPFS_VERSION=0.4.18
ARG ARCH=arm
ARG IPFS_URL=https://ipfs.io/ipns/dist.ipfs.io/go-ipfs/v${IPFS_VERSION}/go-ipfs_v${IPFS_VERSION}_linux-${ARCH}.tar.gz

ENV IPFS_PATH /data/.ipfs
ENV IPFS_STORAGE_MAX 2G
ENV IPFS_ANNOUNCE []

RUN cd /tmp && \
    wget $IPFS_URL && \
    tar xzf go-ipfs_v${IPFS_VERSION}_linux-${ARCH}.tar.gz && \
    cp go-ipfs/ipfs /usr/local/bin/ipfs && \
    rm -rf go-ipfs

COPY entrypoint.sh /entrypoint.sh 

EXPOSE 4001
EXPOSE 4002/udp
EXPOSE 5001
EXPOSE 8080
EXPOSE 8081

CMD ["./entrypoint.sh"]
