#! /bin/sh

ifconfig | grep inet | awk 'FNR==5' | cut -d " " -f2