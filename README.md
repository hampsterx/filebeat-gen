# Filebeat + Docker-gen

Based on http://www.sandtable.com/forwarding-docker-logs-to-logstash/

## Supported tags

- 5.0.1

## Example Usage

    docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker/containers:/var/lib/docker/containers/ -v $(pwd)/filebeat.tmpl:/etc/docker-gen/filebeat.tmpl hampsterx/filebeat-gen

## Example filebeat.tmpl

    {{/* this is a docker-gen template. See docker-gen for more details */}}
    filebeat:
      prospectors:
      {{ range $key, $value := . }}
        -
          paths:
            - /var/lib/docker/containers/{{ $value.ID }}/{{ $value.ID }}-json.log
          document_type: filebeat-docker-logs
          fields:
            type: {{ $value.Image.Repository }}
            container: {{ $value.ID }}
      {{ end }}
    output:
      logstash:
        hosts:
          - <your_logstash_domain>:5044
        timeout: 5
    logging:
      level: info
