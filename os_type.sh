#!/bin/bash
OS=`uname -s`
case "$OS" in
Linux) echo "this is linux;";;
SunOS) echo "this is sun";;
*) echo "failed to type os";;
esac
echo $OS

