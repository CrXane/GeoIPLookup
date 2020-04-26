#!/bin/bash

while IFS= read -r l; do
 if [[ $l =~ ^[^a-zA-Z] ]]; then
  loc=$(geoiplookup $l)
  loc=${loc:23:2}
  if [ $loc != "IP" ]; then
   echo "[$loc] $l"
  fi
 fi
done< <(netstat -ntu | awk '{print $5}' | cut -d: -f1 | sort | uniq)
