ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

MAINTAINER Matt Colyer

# Build arugments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

LABEL \
  Description="Server to allow control of etekcity voltson plugs" \
  io.hass.version="VERSION" \
  io.hass.type="addon" \
  io.hass.arch="armhf|aarch64|i386|amd64"

# Build step
ENV GOPATH="/go"

RUN apk add --no-cache --virtual build-dependencies go wget git musl-dev && \
  wget -O /voltlet.tar.gz https://github.com/mcolyer/voltlet/archive/v1.0.0.tar.gz && \
  tar xf /voltlet.tar.gz && \
  echo $GOPATH && mkdir -p $GOPATH && mkdir -p $GOPATH/src/matt.colyer.name/ && \
  mv /voltlet-1.0.0 $GOPATH/src/matt.colyer.name/voltlet && \
  cd $GOPATH/src/matt.colyer.name/voltlet && \
  go get && go build -o /voltlet main.go && \
  rm -fr /voltlet.tar.gz /go && \
  apk del build-dependencies && \
  apk add --no-cache jq

#
# Define an environment variable
#
# Use this variable when creating a container to specify the MQTT broker host.
ENV MQTT_BROKER="hassio.local"
ENV MQTT_USER="guest"
ENV MQTT_PASSWORD="guest"

COPY ./run.sh /
RUN chmod +x /run.sh
ENTRYPOINT ["/run.sh"]
