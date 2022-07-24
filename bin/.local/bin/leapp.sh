#!/bin/bash

# if leapp binary is not found, download it
if [ ! -f leapp ]; then
		echo "Downloading leapp binary..."
		url="https://asset.noovolari.com/latest/Leapp-0.13.1.AppImage"
		wget -q -O leapp $url
		chmod +x leapp
fi

# execute leapp
./leapp -f -i $1 -o $2
