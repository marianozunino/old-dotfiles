#!/bin/bash

# if nosql binary is not found, download it
if [ ! -f nosql ]; then
		echo "Downloading NoSql binary..."
		url="https://s3.mongobooster.com/download/releasesv7/nosqlbooster4mongo-7.1.5.AppImage"
		wget -q -O nosql $url
		chmod +x nosql
fi

# execute leapp
./nosql
