## README

### Comands to compile docker images

For just armhf:

```
docker run --rm --privileged -v PATH_TO/hassio-addons/voltlet:/data -ti homeassistant/amd64-builder --armhf -t /data --docker-login
```

For all:

```
docker run --rm --privileged -v PATH_TO/hassio-addons/voltlet:/data -ti homeassistant/amd64-builder -t /data --docker-login
```
