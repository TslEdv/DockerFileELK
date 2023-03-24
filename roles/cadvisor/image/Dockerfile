FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y wget && \
    wget https://github.com/google/cadvisor/releases/download/v0.40.0/cadvisor && \
    chmod +x cadvisor

EXPOSE 8080

ENTRYPOINT ["/cadvisor"]
