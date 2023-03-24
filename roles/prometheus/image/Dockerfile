FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    curl \
    net-tools \
    iputils-ping

# Import Prometheus public GPG key
RUN wget -qO - https://prometheus.io/key.asc | apt-key add -

# Add Prometheus repository
RUN sh -c 'echo "deb https://packages.grafana.com/oss/deb stable main" > /etc/apt/sources.list.d/grafana.list'

# Install Prometheus
RUN apt-get update && apt-get install -y prometheus

# Expose port
EXPOSE 9090

# Start Prometheus
CMD ["/usr/bin/prometheus", "--config.file=/etc/prometheus/prometheus.yml"]
