#!/bin/sh
RPMPKGS="git tar gzip make findutils"

# Crude multi-os installation option
if [ -x "/usr/bin/dnf" ]
then
   sudo dnf install -y $RPMPKGS
elif [ -x "/usr/bin/yum" ]
then
   sudo yum install -y $RPMPKGS
fi
