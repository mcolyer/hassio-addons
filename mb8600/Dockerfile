ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8
ENV MB8600_VERSION v1.1.2
ENV MB8600_VERSION_PATH 1.1.2

MAINTAINER Matt Colyer

# Build arugments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

LABEL \
  Description="Record mb8600 modem statistics in influxdb" \
  io.hass.version="VERSION" \
  io.hass.type="addon" \
  io.hass.arch="armhf|aarch64|i386|amd64"

# Build step
ENV GOPATH="/go"
ENV GO111MODULE=on

RUN apk add --no-cache --virtual build-dependencies go wget git musl-dev && \
  wget -O /mb8600.tar.gz https://github.com/mcolyer/mb8600/archive/$MB8600_VERSION.tar.gz && \
  tar xf /mb8600.tar.gz && \
  mkdir -p $GOPATH && mkdir -p $GOPATH/src/matt.colyer.name/ && \
  mv /mb8600-$MB8600_VERSION_PATH $GOPATH/src/matt.colyer.name/mb8600 && \
  cd $GOPATH/src/matt.colyer.name/mb8600 && \
  go get && go build -o /mb8600 main.go && \
  rm -fr /mb8600.tar.gz /go && \
  apk del build-dependencies && \
  apk add --no-cache jq

COPY ./run.sh /
RUN chmod +x /run.sh
ENTRYPOINT ["/run.sh"]
