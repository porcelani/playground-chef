#!/bin/bash

export ES_VERSION=5.2.0

cd /opt
curl -L -O https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.2.0.tar.gz
tar -xvf elasticsearch-5.2.0.tar.gz
cd elasticsearch-5.2.0/bin

useradd -m elasticsearch
chown -R elasticsearch:elasticsearch /opt/elasticsearch-5.2.0/
export ES_HOME=/opt/elasticsearch-5.2.0
export DEFAULT_ES_USER=elasticsearch
export ES_JAVA_OPTS="-Xms2g -Xmx2g"

echo "network.host: 0.0.0.0" >> $ES_HOME/config/elasticsearch.yml
sysctl -w vm.max_map_count=262144
ulimit -n 65536

su elasticsearch
./elasticsearch

puts "Finished"