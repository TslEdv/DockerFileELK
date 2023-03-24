#!/bin/bash

# Start Elasticsearch
/usr/share/elasticsearch/bin/elasticsearch &

# Start Node Exporter
/usr/local/bin/node_exporter &
