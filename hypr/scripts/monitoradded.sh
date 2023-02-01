#!/bin/sh

function handle {
  if [[ ${1:0:12} == "monitoradded" ]]; then
	hyprctl --batch "keyword wsbind 6,DP-1 ; keyword wsbind 7,DP-1 ; keyword wsbind 8,DP-1 ; keyword wsbind 9,DP-1 ; keyword wsbind 0,DP-1"


  else [[ ${1:0:12} == "monitorremoved" ]]
     	hyprctl --batch "keyword wsbind 6,eDP-1 ; keyword wsbind 7,eDP-1 ; keyword wsbind 8,eDP-1 ; keyword wsbind 9,eDP-1 ; keyword wsbind 0,eDP-1"

  fi

}

socat - UNIX-CONNECT:/tmp/hypr/$(echo $HYPRLAND_INSTANCE_SIGNATURE)/.socket2.sock | while read line; do handle $line; done
