#!/bin/bash

echo "Pulling Application from docker"
docker_cmd="$(which docker)"
if [ ! -x "${docker_cmd}" ]; then
	echo "Docker is not installed on this machine, exiting..."
	exit 1
fi
container_name="yakovav/aquarius"
container_version="latest"
echo "Pulling ${container_version} version of ${container_name}"
"${docker_cmd}" pull "${container_name}":"${container_version}" 2> /dev/null

echo "Running Application...:"
"${docker_cmd}" run "${container_name}":"${container_version}" 2> /dev/null


