#!/bin/bash
podman build -t testwas:1 .
podman run --rm -ti -eCB_DOCKER_LOGGING=true testwas:1 
