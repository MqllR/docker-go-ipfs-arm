#!/bin/sh

if ! test -d $IPFS_PATH
then
  mkdir -p $IPFS_PATH && ipfs init
fi

test -n $IPFS_STORAGE_MAX && \
  sed -i "s/^\(.*StorageMax\).*/\1\": \"$IPFS_STORAGE_MAX\",/" $IPFS_PATH/config

test -n $IPFS_ANNOUNCE && \
  sed -i "s#^\(.*\"Announce\).*#\1\": $IPFS_ANNOUNCE,#" $IPFS_PATH/config

ipfs daemon
