## README

### Comands to compile docker images

For just amd64:

```
docker run --rm --privileged -v PATH_TO/hassio-addons/tesla-solar-fetcher:/data -ti homeassistant/amd64-builder --amd64 -t /data --docker-login
```

For all:

```
docker run --rm --privileged -v PATH_TO/hassio-addons/tesla-solar-fetcher:/data -ti homeassistant/amd64-builder -t /data --docker-login
```

### Triggering within hassio

Call the `hassio.addon_stdin` service with `{"addon":"88f46aa6_tesla-solar-fetcher",
"input": {}}`.

### Automation configuration

Here's an example automation configuration you could use:

```yaml
 - id: fetch_tesla
   alias: Fetch Tesla
   trigger:
     - platform: time_pattern
       hours: '/1'
       minutes: '5'
   condition:
     condition: and
     conditions:
       - condition: sun
         before: sunset
       - condition: sun
         after: sunrise
   action:
     - service: hassio.addon_stdin
       data:
         addon: 88f46aa6_tesla-solar-fetcher
         input: ""
```
