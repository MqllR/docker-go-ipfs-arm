# Docker for IPFS on arm

Small dockerfile for running IPFS on arm architecture.

* Init an IPFS node:
```
docker run -it --rm -v /data/.ipfs:/data/.ipfs mqll/ipfs init
```

* Run IPFS as a daemon:
```
docker run -d -P -v /data/.ipfs:/data/.ipfs mqll/ipfs
```
