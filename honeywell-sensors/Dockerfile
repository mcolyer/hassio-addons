# Docker file to create an image for a hass.io add-on that contains enough software to listen to events via RTL_SDR and then publish them to a MQTT broker.
# This hass.io addon is based on James Fry's project here: https://github.com/james-fry/hassio-addons,
# which is in turn based on Chris Kacerguis' project here: https://github.com/chriskacerguis/honeywell2mqtt,
# which is in turn based on Marco Verleun's rtl2mqtt image here: https://github.com/roflmao/rtl2mqtt

# IMPORTANT: The container needs privileged access to /dev/bus/usb on the host.

ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

MAINTAINER Matt Colyer

LABEL Description="This image is used to start a script that will monitor for RF events on 345Mhz (configurable) and send the data to an MQTT server"

#
# First install software packages needed to compile rtl_433 and to publish MQTT events
#
RUN apk add --no-cache --virtual build-deps alpine-sdk cmake git libusb-dev && \
    mkdir /tmp/src && \
    cd /tmp/src && \
    git clone git://git.osmocom.org/rtl-sdr.git && \
    mkdir /tmp/src/rtl-sdr/build && \
    cd /tmp/src/rtl-sdr/build && \
    cmake ../ -DINSTALL_UDEV_RULES=ON -DDETACH_KERNEL_DRIVER=ON -DCMAKE_INSTALL_PREFIX:PATH=/usr && \
    make && \
    make install && \
    chmod +s /usr/bin/rtl_* && \
    cd /tmp/src/ && \
    git clone https://github.com/mcolyer/Honeywell5800 && \
    cd Honeywell5800/ && \
    cd src && \
    ./build.sh && \
    cp honeywell /usr/local/bin && \
    apk del build-deps && \
    rm -r /tmp/src && \
    echo "/lib:/usr/local/lib:/usr/lib64:/usr/lib" > /etc/ld-musl-x86_64.path && \
    apk add --no-cache libusb mosquitto-clients jq libstdc++ libgcc

#
# Define an environment variable
#
# Use this variable when creating a container to specify the MQTT broker host.
ENV MQTT_HOST="hassio.local"
ENV MQTT_USER="guest"
ENV MQTT_PASS="guest"
ENV MQTT_TOPIC="homeassistant/sensor/honeywell-sensors"

COPY ./honeywell-sensors.sh /
RUN chmod +x /honeywell-sensors.sh
ENTRYPOINT ["/honeywell-sensors.sh"]
