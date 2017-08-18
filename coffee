#!/bin/bash

# Toggle caffiene
# ps aux is fucky with grep and showing caffeine, thus this shit

process=$(ps aux | grep caff)

item1=$(echo $process | cut -d ' ' -f 11)
item2=$(echo $process | cut -d ' ' -f 23)

if [[ $item1 != "" ]] && [[ $item1 == "caffeine-ng" ]]; then
	caff_pid=$(echo $process | cut -d ' ' -f 2)
	kill $caff_pid
elif [[ $item2 != "" ]] && [[ $item2 == "caffeine-ng" ]]; then
	caff_pid=$(echo $process | cut -d ' ' -f 14)
	kill $caff_pid
else
	caffeine
fi
