#!/usr/bin/env bash

set -ex

# Make sure cluster is ready
curl -s 'http://localhost:9200/_cluster/health?wait_for_status=yellow&timeout=50s&pretty'

# Put in index settings
curl -s -H 'Content-Type: application/json' -XPUT 'http://localhost:9200/shakespeare' --data '{"settings":{"number_of_shards":3,"number_of_replicas":0},"mappings":{"properties":{"speaker":{"type":"keyword"},"play_name":{"type":"keyword"},"line_id":{"type":"integer"},"speech_number":{"type":"integer"}}}}'

# Load dataset
curl -s 'https://download.elastic.co/demos/kibana/gettingstarted/8.x/shakespeare.json' | curl -s -H 'Content-Type: application/x-ndjson' -XPOST 'http://localhost:9200/shakespeare/_bulk?refresh' --data-binary '@-' > /dev/null

echo 'OK!'
