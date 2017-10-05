# libressl CentOS RPM builder
---
Build and run it:
```
for v in 6 7; do 
    docker build -t libressl-centos$v-rpm:latest CentOS$v/
    docker run -ti --rm \
        -v $PWD/CentOS$v/data:/data \
        -v $PWD/CentOS$v/assets/config:/config \
        libressl-centos$v-rpm:latest start.sh
done
```

Find the RPM's in de data folder:
```
$ ls CentOS*/data/ 
```
