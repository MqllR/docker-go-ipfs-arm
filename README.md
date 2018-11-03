# Docker image for go-ipfs on arm architecture

Small dockerfile for running IPFS on arm architecture.

* Run go-ipfs as a daemon
```
docker run -d -p 4001:4001 --name ipfs
	-e IPFS_PATH=/data/ipfs
        -e IPFS_STORAGE_MAX=50G
        -e IPFS_ANNOUNCE='["/ip4/92.120.41.45/tcp/14001"]'
        -v /data/.ipfs:/data/ipfs mqll/go-ipfs-arm:latest
```

* Options

__IPFS_PATH__ : Base dir of the ipfs node

__IPFS_STORAGE_MAX__ : Max storage available

__IPFS_ANNOUNCE__ : Swarm addresses to announce to the network
