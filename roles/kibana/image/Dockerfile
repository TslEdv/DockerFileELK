FROM ubuntu:latest

# Install dependencies and Kibana
RUN apt-get update && apt-get install -y wget gnupg2
RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
RUN sh -c 'echo "deb https://artifacts.elastic.co/packages/8.x/apt stable main" > /etc/apt/sources.list.d/elastic-8.x.list'
RUN apt-get update && apt-get install -y kibana

# Expose Kibana port
EXPOSE 5601

# Start Kibana as the kibana user
USER kibana
CMD ["/usr/share/kibana/bin/kibana"]
