# mcolyer's Hass.io

This git repository is a collection of addons for my local install of
Home Assistant that runs on
[hass.io](https://home-assistant.io/hassio/).

## Install
 - [Instructions how to add this repository to
   Hass.io](https://home-assistant.io/hassio/installing_third_party_addons/)

## Voltlet

Allows [voltlet](https://github.com/mcolyer/voltlet) to be used to
control switches in Home Assistant through mqtt swiches like so:

```
switch:
  - platform: mqtt            
    name: "A switch"                                      
    command_topic: "/voltson/UUID-OF-SWITCH"
    state_topic: "/voltson/UUID-OF-SWITCH/state"
    availability_topic: "/voltson/UUID-OF-SWITCH/available"
    retain: true                                                      
    payload_on: 'true'                                        
    payload_off: 'false'
```

You can find the UUID of the switch in the logs after the switch has connected.

## Hacklet

Allows [hacklet](https://github.com/mcolyer/hacklet) to be used to
control switches in Home Assistant through mqtt switches.

Example switch configuration:

```
switch:
  - platform: mqtt
    name: "Light - Top"
    command_topic: "hacklet"
    payload_on: '{"action": "on", "network_id": "0xc6d2", "socket_id": 0}'
    payload_off: '{"action": "off", "network_id": "0xc6d2", "socket_id": 0}'
```
