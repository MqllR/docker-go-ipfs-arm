#!/bin/sh

if test -z $IPFS_PATH
then
  echo '$IPFS_PATH need to declared'
  exit 1
fi

if ! test -d $IPFS_PATH
then
  mkdir -p $IPFS_PATH
fi

if ! test -f $IPFS_PATH/config
then
  ipfs init
fi

test -n $IPFS_STORAGE_MAX && \
  sed -i "s/^\(.*StorageMax\).*/\1\": \"$IPFS_STORAGE_MAX\",/" $IPFS_PATH/config

test -n $IPFS_ANNOUNCE && \
  sed -i "s#^\(.*\"Announce\).*#\1\": $IPFS_ANNOUNCE,#" $IPFS_PATH/config

if test $# -gt 0
then
  ipfs daemon $@
else
  ipfs daemon
fi
