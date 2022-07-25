#!/bin/bash

bin=~/.local/bin/leap

# if leapp binary is not found, download it

if [ ! -f $bin ]; then
	echo "Downloading leapp binary..."
	url="https://asset.noovolari.com/latest/Leapp-0.13.1.AppImage"
	wget -q -O $bin $url
	chmod +x $bin
fi

# execute leapp
$bin -f -i $1 -o $2
