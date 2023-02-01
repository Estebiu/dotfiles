#!/bin/sh

function handle {
  if [[ ${1:0:10} == "focusedmon" ]]; then
    if [[ ${1:12:4} == "eDP-1" ]]; then
      hyprctl keyword general:border_size 8
    else
      hyprctl keyword general:border_size 14
    fi
  fi
}

socat - UNIX-CONNECT:/tmp/hypr/$(echo $HYPRLAND_INSTANCE_SIGNATURE)/.socket2.sock | while read line; do handle $line; done
