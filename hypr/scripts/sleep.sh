swayidle -w \
                timeout 120 'temp=$(brightnessctl g); brightnessctl set $((temp / 2))' \
                    resume 'temp=$(brightnessctl g); brightnessctl set $((temp * 2))' \
                timeout 300 "hyprctl dispatch dpms off" \
                    resume 'hyprctl dispatch dpms on' 
#                timeout 600 'systemctl suspend'
