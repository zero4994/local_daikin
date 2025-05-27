#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
FULL_PATH=$(realpath $SCRIPT_DIR/../custom_components/local_daikin)

docker run -d \
  --name homeassistant \
  --privileged \
  --restart=unless-stopped \
  -e TZ=MY_TIME_ZONE \
  -v $FULL_PATH/:/config/custom_components/local_daikin/ \
  --network=host \
  ghcr.io/home-assistant/home-assistant:stable