FROM ubuntu:latest

# Update and install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    curl \
    net-tools \
    iputils-ping

# Import Elasticsearch public GPG key
RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -

# Add Elasticsearch repository
RUN sh -c 'echo "deb https://artifacts.elastic.co/packages/8.x/apt stable main" > /etc/apt/sources.list.d/elastic-8.x.list'

# Install Elasticsearch
RUN apt-get update && apt-get install -y elasticsearch

# Change ownership of Elasticsearch directories
RUN chown -R elasticsearch:elasticsearch /usr/share/elasticsearch /etc/default/elasticsearch /var/lib/elasticsearch /var/log/elasticsearch

USER elasticsearch

# Install Elasticsearch Prometheus Exporter
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install --batch https://github.com/vvanholl/elasticsearch-prometheus-exporter/releases/download/8.0.0.0/prometheus-exporter-8.0.0.0.zip


# Expose ports
EXPOSE 9200 9300

CMD ["/usr/share/elasticsearch/bin/elasticsearch"]

