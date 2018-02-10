ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

MAINTAINER Matt Colyer

LABEL Description="Server to allow control of etekcity voltson plugs"

RUN apk add --no-cache jq

#
# Define an environment variable
#
# Use this variable when creating a container to specify the MQTT broker host.
ENV MQTT_BROKER="hassio.local"
ENV MQTT_USER="guest"
ENV MQTT_PASSWORD="guest"

COPY ./run.sh /
COPY ./voltlet /
RUN chmod +x /run.sh
ENTRYPOINT ["/run.sh"]
