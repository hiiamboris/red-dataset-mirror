#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Syntax: $0 <room-id>"
else
	cd ~/py/bin
	echo "Joining room $1" >&2
	./matrix-commander --room-join "$1"
	# grace period to avoid matrix ban
	sleep 2
fi