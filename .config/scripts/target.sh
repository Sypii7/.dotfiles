#!/bin/bash
 
ip_address=$(/bin/cat /home/sypii/.config/bin/target | awk '{print $1}')
machine_name=$(/bin/cat /home/sypii/.config/bin/target | awk '{print $2}')
 
if [ $ip_address ] && [ $machine_name ]; then
    echo "$ip_address - $machine_name"
#else
    #echo "%{F#e51d0b}ICONO %{u-}%{F#ffffff} No target"
fi
