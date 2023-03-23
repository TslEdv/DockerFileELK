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
RUN sh -c 'echo "deb https://artifacts.elastic.co/packages/8.x/apt stable main" > /etc/apt/sources.list.d/elastic-7.x.list'

# Install Elasticsearch
RUN apt-get update && apt-get install -y elasticsearch

# Change ownership of Elasticsearch directories
RUN chown -R elasticsearch:elasticsearch /usr/share/elasticsearch /etc/default/elasticsearch /var/lib/elasticsearch /var/log/elasticsearch

USER elasticsearch

# Expose ports
EXPOSE 9200 9300

CMD ["/usr/share/elasticsearch/bin/elasticsearch"]

