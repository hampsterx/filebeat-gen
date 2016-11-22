#!/bin/bash

set -e


service supervisor start &


/opt/docker-gen -include-stopped -wait 1s:2s -notify "supervisorctl restart filebeat" -notify-output -watch /etc/docker-gen/filebeat.tmpl /tmp/filebeat.yml


