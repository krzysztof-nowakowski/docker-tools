#!/bin/bash

#################################################################
#
# Get the list of containers that are part of specific network.
#
# Usage: ./networkcontainers.sh <network_name>
#
#################################################################

[[ $# -lt 1 ]] && echo "Please provide network name." && exit 1

printf "Network: %-s\n\n%-64s %-13s %-s\n" $1 "Container ID" "IP Address" "Name"

docker network inspect --format='{{range $k, $v := .Containers}}{{println $k $v.IPv4Address $v.Name}}{{end}}' $1 && exit 0
