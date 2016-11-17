#!/bin/bash

set -e


service supervisor start &


/opt/docker-gen -notify "supervisorctl restart filebeat" -notify-output -watch /etc/docker-gen/filebeat.tmpl /tmp/filebeat.yml


