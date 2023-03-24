FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    curl \
    net-tools \
    iputils-ping \
    software-properties-common

# Import Grafana public GPG key
RUN wget -qO - https://packages.grafana.com/gpg.key | apt-key add -

# Add Grafana repository
RUN sh -c 'echo "deb https://packages.grafana.com/oss/deb stable main" > /etc/apt/sources.list.d/grafana.list'

# Install Grafana
RUN apt-get update && apt-get install -y grafana

# Expose port
EXPOSE 3000

# Start Grafana
CMD ["/usr/sbin/grafana-server", "--homepath=/usr/share/grafana", "--config=/etc/grafana/grafana.ini"]