ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8
ENV MYWATER_VERSION v1.0.0
ENV MYWATER_VERSION_PATH 1.0.0

MAINTAINER Matt Colyer

# Build arugments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

LABEL \
  Description="Fetches water usage information" \
  io.hass.version="VERSION" \
  io.hass.type="addon" \
  io.hass.arch="amd64"

# Build step
ENV GOPATH="/go"

RUN apk add --no-cache --virtual build-dependencies go wget git musl-dev && \
  wget -O /mywater.tar.gz https://github.com/mcolyer/mywater/archive/$MYWATER_VERSION.tar.gz && \
  tar xf /mywater.tar.gz && \
  mkdir -p $GOPATH && mkdir -p $GOPATH/src/matt.colyer.name/ && \
  mv /mywater-$MYWATER_VERSION_PATH $GOPATH/src/matt.colyer.name/mywater && \
  cd $GOPATH/src/matt.colyer.name/mywater && \
  go get && go build -o /mywater main.go && \
  rm -fr /mywater.tar.gz /go && \
  apk del build-dependencies && \
  apk add --no-cache jq curl

COPY ./run.sh /
RUN chmod +x /run.sh
ENTRYPOINT ["/run.sh"]

