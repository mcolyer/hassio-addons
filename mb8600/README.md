## README

Runs a the handy script from https://github.com/mattund/modem-statistics
as a hassio addon. Currently only supports the 8600 modem.

### Comands to compile docker images

For just amd64:

```
docker run --rm --privileged -v PATH_TO/hassio-addons/mb8600:/data -ti homeassistant/amd64-builder --amd64 -t /data --docker-login
```
