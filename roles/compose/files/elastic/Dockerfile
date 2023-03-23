FROM ubuntu:latest

# Update and install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    curl \
    openssh-server 

RUN mkdir /var/run/sshd && \
    echo 'root:password' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    # SSH login fix. Otherwise user is kicked off after login
    sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd && \
    # Environment variables
    echo "export VISIBLE=now" >> /etc/profile

# Import Elasticsearch public GPG key
RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -

# Add Elasticsearch repository
RUN sh -c 'echo "deb https://artifacts.elastic.co/packages/8.x/apt stable main" > /etc/apt/sources.list.d/elastic-8.x.list'

# Install Elasticsearch
RUN apt-get update && apt-get install -y elasticsearch

# Change ownership of Elasticsearch directories
RUN chown -R elasticsearch:elasticsearch /usr/share/elasticsearch /etc/default/elasticsearch /var/lib/elasticsearch /var/log/elasticsearch

# Expose ports
EXPOSE 9200 9300 22

CMD ["/usr/sbin/sshd", "-D"]

