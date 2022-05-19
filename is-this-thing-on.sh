#!/bin/bash

# Output:
# - 0 means "No, this thing is NOT on"
# - any other value means "this thing is ON"
# Make sure container name is provided as first argument
if [ -z $1 ]; then
	echo "Invalid usage! You have to provide a container name! D:"
	echo "Expected usage: $0 my-container"
	exit 1
fi

# Breakdown:
# List all running containers 'docker ps'
# Search list of running containers for provided container name using 'grep'
# Count number of lines ouputted by 'grep' using 'wc'
docker ps | grep $1 | wc -l
