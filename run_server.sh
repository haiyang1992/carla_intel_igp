#!/bin/bash
echo 'running Carla server:'
docker run -it --rm -e DISPLAY=$DISPLAY -v /dev:/dev -v /tmp/.X11-unix:/tmp/.X11-unix -p 2000-2002:2000-2002 mycarla ./CarlaUE4.sh -carla-server  -windowed -ResX=800 -ResY=600 -carla-settings=CarlaSettings.ini