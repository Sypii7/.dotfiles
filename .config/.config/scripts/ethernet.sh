#!/bin/sh

ip addr | grep 'enp5s0' -A 2 | grep 'inet ' | awk '{print $2}' | cut -d'/' -f1
