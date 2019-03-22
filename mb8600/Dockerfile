ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8
ENV MODEM_STATISTICS_VERSION a25e36fa22fbe927e8d70878cd9d027062c0d79f

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

RUN apk add --no-cache nodejs npm
RUN npm install -g request jsdom influx moment
RUN wget -O /modem-statistics.tar.gz https://github.com/mattund/modem-statistics/archive/$MODEM_STATISTICS_VERSION.tar.gz && \
  tar xf /modem-statistics.tar.gz && \
  mv /modem-statistics-$MODEM_STATISTICS_VERSION modem-statistics

#
# Define an environment variable
#
# Use this variable when creating a container to specify the MQTT broker host.
ENV INFLUXDB_HOST="hassio.local"
ENV INFLUXDB_USER="guest"
ENV INFLUXDB_PASSWORD="guest"
ENV MODEM_USER="guest"
ENV MODEM_PASSWORD="guest"

COPY ./run.sh /
RUN chmod +x /run.sh
ENTRYPOINT ["/run.sh"]
