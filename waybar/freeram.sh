free -h -m --si | grep Mem: | awk '{print $3"B"}' | awk '{print substr($0, 0, length($0)-2) " " substr($0, length($0)-1, length($0))}'
