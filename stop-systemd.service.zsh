#!/usr/bin/env zsh

CMD="$(command -v podman || command -v docker)"
$CMD stop %n
