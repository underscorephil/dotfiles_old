#!/bin/sh

# change to directory of this script
cd "`dirname \"$0\"`"

# copy file
osascript -e 'do shell script "mkdir -p /usr/local/bin 2>/dev/null; cp blueutil /usr/local/bin/" with administrator privileges'
