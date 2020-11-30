# Honeywell Sensors hass.io addon
A hass.io addon for a software defined radio tuned to listen for 345MHz RF transmissions and republish the data via MQTT

This hass.io addon is based on James Fry's project here:
https://github.com/james-fry/hassio-addons/tree/master/rtl4332mqtt which
in turn is based on Chris Kacerguis' project here:
https://github.com/chriskacerguis/honeywell2mqtt,
which is in turn based on Marco Verleun's rtl2mqtt image here:
https://github.com/roflmao/rtl2mqtt

## Usage

1) Install the addon.

2) Use addon configuration to configure:
- mqtt_host
- mqtt_user
- mqtt_password
- mqtt_topic

3) Start the addon


## MQTT Data

Data to the MQTT server will depend on the protocol.
Chris tested Honeywell devices and the JSON is as follows:

```json
{
    "time" : "2017-08-17 13:18:58",
    "model" : "Honeywell Door/Window Sensor",
    "id" : 547651,
    "channel" : 8,
    "event" : 4,
    "state" : "closed",
    "heartbeat" : "yes"
}
```

## Hardware

This has been tested and used with the following hardware (you can get it on Amazon)

- [Honeywell 5816 Door Switch](https://smile.amazon.com/Ademco-5816-Honeywell-Wireless-Transmitter/dp/B0006BCCRM?sa-no-redirect=1)

## Troubleshooting

If you see this error:

> Kernel driver is active, or device is claimed by second instance of librtlsdr.
> In the first case, please either detach or blacklist the kernel module
> (dvb_usb_rtl28xxu), or enable automatic detaching at compile time.

Then run the following command on the host

```bash
sudo rmmod dvb_usb_rtl28xxu rtl2832
```

## Building

For just amd64:

```
docker run --rm --privileged -v PATH_TO/hassio-addons/honeywell-sensors:/data -ti homeassistant/amd64-builder --amd64 -t /data --docker-login USER --docker-password PASSWORD
```

For all:

```
docker run --rm --privileged -v PATH_TO/hassio-addons/honeywell-sensors:/data -ti homeassistant/amd64-builder --all -t /data --docker-login USER --docker-password PASSWORD
```
