#!/bin/sh

function handle {
  if [[ ${1:0:12} == "monitorremoved" ]]; then
    hyprctl --batch "keyword wsbind 6,eDP-1 ; keyword wsbind 7,eDP-1 ; keyword wsbind 8,eDP-1 ; keyword wsbind 9,eDP-1 ; keyword wsbind 0,eDP-1"
  fi
}

socat - UNIX-CONNECT:/tmp/hypr/$(echo $HYPRLAND_INSTANCE_SIGNATURE)/.socket2.sock | while read line; do handle $line; done
