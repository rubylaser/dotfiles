#!/bin/sh

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

#if [ "$SENDER" = "front_app_switched" ]; then
#  sketchybar --set "$NAME" label="$INFO"
#fi

if [ "$SENDER" = "front_app_switched" ]; then
  app=$(aerospace list-windows | awk -F'|' '$1 ~ /true/ { gsub(/^ *| *$/, "", $3); print $3 }')
  sketchybar --set "$NAME" label="$app"
fi
