FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    curl \
    net-tools \
    iputils-ping

RUN wget https://github.com/prometheus/prometheus/releases/download/v2.37.0/prometheus-2.37.0.linux-amd64.tar.gz

RUN tar xvfz prometheus-*.tar.gz

EXPOSE 9090

CMD ["/prometheus-2.37.0.linux-amd64/prometheus", "--config.file=/etc/prometheus/prometheus.yml"]
