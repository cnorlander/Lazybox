#!/bin/bash

if [ -z "$1" ]
then
    echo "Cannot Enter Container: No container image name provided"
else
    declare -A containers
    running_containers=$(docker ps | tail -n +2)
    while IFS= read -r line; do
        id=$(echo "$line" | awk -F'   ' '{print $1}')
        name=$(echo "$line" | awk -F'   ' '{print $2}')
        containers["$name"]="$id"
    done <<< "$running_containers"
    selected_id="${containers[$1]}"
    if [ -z "$selected_id" ]
    then
        echo "Cannot Enter Container: No Docker container with image name \"$1\" is running."
    else
        echo "$(tput setaf 5)Entering container $1 ($selected_id)$(tput setaf 7)"
        docker exec -it "$selected_id" /bin/bash
    fi
fi