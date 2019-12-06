ARG BUILD_FROM=hassioaddons/base:5.0.3
# hadolint ignore=DL3006
FROM $BUILD_FROM

ENV PGE_SHAREMYDATA_VERSION v0.1.0
ENV PGE_SHAREMYDATA_VERSION_PATH 0.1.0

# Build arugments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Build step
ENV GOPATH="/go"

RUN apk add --no-cache --virtual build-dependencies go wget git musl-dev && \
  wget -O /pge-sharemydata.tar.gz https://github.com/mcolyer/pge-sharemydata/archive/$PGE_SHAREMYDATA_VERSION.tar.gz && \
  tar xf /pge-sharemydata.tar.gz && \
  mkdir -p $GOPATH && mkdir -p $GOPATH/src/matt.colyer.name/ && \
  mv /pge-sharemydata-$PGE_SHAREMYDATA_VERSION_PATH $GOPATH/src/matt.colyer.name/pge-sharemydata && \
  cd $GOPATH/src/matt.colyer.name/pge-sharemydata && \
  go get && go build -o /pge-sharemydata main.go && \
  rm -fr /pge-sharemydata.tar.gz /go && \
  apk del build-dependencies && \
  apk add --no-cache curl

COPY ./run.sh /
RUN chmod +x /run.sh
ENTRYPOINT ["/run.sh"]

LABEL \
    io.hass.name="PGE ShareMyData" \
    io.hass.description="Fetches energy grid usage information from PGE" \
    io.hass.version="VERSION" \
    io.hass.type="addon" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Matt Colyer" \
    org.label-schema.description="Fetches energy grid usage information from PGE" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="PGE ShareMyData" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.usage="https://github.com/mcolyer/hassio-addons/tree/master/pge-sharemydata/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/mcolyer/hassio-addons/" \
    org.label-schema.vendor="mcolyer's Hass.io Add-ons"
