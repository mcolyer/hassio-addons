ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8
ENV TESLA_SOLAR_FETCHER_VERSION v1.0.4
ENV TESLA_SOLAR_FETCHER_VERSION_PATH 1.0.4

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
  wget -O /tesla-solar-fetcher.tar.gz https://github.com/mcolyer/tesla-solar-fetcher/archive/$TESLA_SOLAR_FETCHER_VERSION.tar.gz && \
  tar xf /tesla-solar-fetcher.tar.gz && \
  mkdir -p $GOPATH && mkdir -p $GOPATH/src/matt.colyer.name/ && \
  mv /tesla-solar-fetcher-$TESLA_SOLAR_FETCHER_VERSION_PATH $GOPATH/src/matt.colyer.name/tesla-solar-fetcher && \
  cd $GOPATH/src/matt.colyer.name/tesla-solar-fetcher && \
  go get && go build -o /tesla-solar-fetcher main.go && \
  rm -fr /tesla-solar-fetcher.tar.gz /go && \
  apk del build-dependencies && \
  apk add --no-cache curl

COPY ./run.sh /
RUN chmod +x /run.sh
ENTRYPOINT ["/run.sh"]

