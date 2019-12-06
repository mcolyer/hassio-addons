## README

### Comands to compile docker images

For just amd64:

```
docker run --rm --privileged -v PATH_TO/hassio-addons/pge-sharemydata:/data -ti homeassistant/amd64-builder --amd64 -t /data --docker-login
```

For all:

```
docker run --rm --privileged -v PATH_TO/hassio-addons/pge-sharemydata:/data -ti homeassistant/amd64-builder -t /data --docker-login
```

### Triggering within hassio

You need to setup the nginx proxy manager to redirect the location `/api/webhook/pge-daily-update` to port 3333
