#!/bin/bash

LABEL="template-server"
TAG="template-server"

# Check for podman or docker
CMD="$(command -v podman || command -v docker)"

command $CMD build \
	  --force-rm \
	  --rm \
	  --label "$LABEL" \
	  --tag "$TAG" .
