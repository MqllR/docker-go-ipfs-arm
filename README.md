# Docker for IPFS on arm

Small dockerfile for running IPFS on arm architecture.

* Init an IPFS node:
```
docker run -it --rm -v /data/.ipfs:/data/.ipfs mqll/ipfs init
```

* Run IPFS as a daemon (no API, no Gateway from outside):
```
docker run -d -p 4001:4001 --name ipfs -v /data/.ipfs:/data/.ipfs mqll/ipfs
```
