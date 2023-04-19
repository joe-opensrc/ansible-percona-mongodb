#!/bin/bash

hostFilter="${ANSIBLE_DOCKER_FILTER:-name=.}"

IFS=$'\n'

ids="$( docker ps --filter ${hostFilter} --format '"{{ .Names }}"' | tr '\n' ',' )"
hosts="\"hosts\": [ ${ids%%,} ]"

cat <<EOT
{ 
  "docker": {
    ${hosts},
    "vars": { "ansible_connection": "docker" }
  }
}
EOT
