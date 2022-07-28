#!/bin/bash

bin=$HOME/.local/bin/lens

baseURL="https://downloads.k8slens.dev/ide/"

# if lens binary is not found, download it
if [ ! -f $bin ]; then
	echo "Downloading LENS binary..."
	path=$(curl -s https://api.k8slens.dev/binaries/latest-linux.json | jq -r '.files[0].url')
	wget -q $baseURL$path -O $bin
	chmod +x $bin
fi

# execute lens
$bin
