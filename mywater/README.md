## README

### Comands to compile docker images

For just amd64:

```
docker run --rm --privileged -v PATH_TO/hassio-addons/mywater:/data -ti homeassistant/amd64-builder --arm64 -t /data --docker-login
```

For all:

```
docker run --rm --privileged -v PATH_TO/hassio-addons/mywater:/data -ti homeassistant/amd64-builder -t /data --docker-login
```

### Triggering within hassio

Call the `hassio.addon_stdin` service with `{"addon":"88f46aa6_mywater",
"input": {}}`.

