#!/usr/bin/env zsh

# Perform any kind of checks in here that need to be done before starting 
# the container as a systemd service.  

CMD="$(command -v podman || command -v docker)"

# TODO: Check if container exists, if not, create it
