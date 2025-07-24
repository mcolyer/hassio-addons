# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a collection of Home Assistant add-ons (hassio-addons) for personal use. Each add-on is packaged as a Docker container and provides integration with various IoT devices and utilities for Matt Colyer's home automation setup.

## Repository Structure

- Each add-on lives in its own directory (e.g., `voltlet/`, `hacklet/`, `mywater/`)
- Each add-on contains:
  - `config.json` - Add-on configuration and metadata
  - `Dockerfile` - Container build instructions
  - `run.sh` - Entry point script
  - `README.md` - Add-on specific documentation
- `repository.yaml` - Repository metadata for Home Assistant add-on store

## Add-on Architecture

### Configuration Pattern
All add-ons follow a consistent configuration pattern:
- Configuration is read from `/data/options.json` at runtime
- Options are defined in `config.json` with schema validation
- Common configurations include MQTT brokers, InfluxDB connections, and authentication

### Container Pattern
- Built from `ARG BUILD_FROM` base image (set by Home Assistant build system)
- Alpine Linux based with specific dependencies per add-on
- Entry point via `/run.sh` script that reads configuration and starts the service

## Key Add-ons

### voltlet
Controls Etekcity Voltson smart outlets via MQTT. Built with Go, fetches source from GitHub during build.

### hacklet  
Controls modlets (smart outlets) via USB interface. Ruby-based with libftdi dependencies.

### mywater/tesla-solar-fetcher/pge-sharemydata
Utility data fetchers that scrape external services and write to InfluxDB for monitoring.

### mb8600/honeywell-sensors
Device-specific monitoring add-ons.

## Development Commands

This repository does not use traditional build/test/lint commands. Development workflow:

1. **Testing Changes**: Install add-on in Home Assistant and check logs
2. **Building**: Home Assistant builds containers automatically from GitHub
3. **Version Updates**: Increment `version` field in `config.json`
4. **Image Publishing**: Containers are published to `ghcr.io/mcolyer/homeassistant-{arch}-{addon-name}`

## Important Notes

- Images are built for multiple architectures as specified in each `config.json`
- Some add-ons require USB access (`"usb": "True"`) for hardware communication
- MQTT is the primary communication protocol for device control
- InfluxDB is used for utility data storage and Home Assistant integration