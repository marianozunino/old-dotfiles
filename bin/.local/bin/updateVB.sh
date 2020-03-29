#!/bin/bash

OUT_DIR=/opt/
URL='https://vscode-update.azurewebsites.net/latest/linux-x64/insider'
DIR="$(dirname "$(readlink -f "$0")")"
TAR_FILE=$DIR/latest.tar.gz

curl -z $TAR_FILE -o $TAR_FILE -L $URL
sudo tar -xvzf $TAR_FILE -C $OUT_DIR
