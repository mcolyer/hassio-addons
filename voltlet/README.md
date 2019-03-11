## README

### Comands to compile docker images

For just armhf:

```
docker run --rm --privileged -v ~/.docker:/root/.docker -v PATH_TO/hassio-addons/voltlet:/data -ti homeassistant/amd64-builder --armhf -t /data
```

For all:

```
docker run --rm --privileged -v ~/.docker:/root/.docker -v PATH_TO/hassio-addons/voltlet:/data -ti homeassistant/amd64-builder -t /data
```
