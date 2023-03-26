# Ansible ELK deployment

To deploy the stack, run the following command:
``sudo ansible-playbook elk.yml``

The `elk.yml` Ansible playbook will deploy the following services on the localhost as separate Docker containers:

- 3 Elasticsearch nodes that form a cluster, listening on port 9200 and 9300
- 1 Logstash node, listening on port 5042
- 1 Kibana node, listening on port 5601
- 1 cAdvisor node, listening on port 8080
- 1 Prometheus node, listening on port 9090
- 1 Grafana node, listening on port 3000

The services can be accessed on the following localhost ports:

- Elasticsearch nodes (localhost:9201-3)
- Kibana node (localhost:5601)
- Grafana (localhost:3000)
- Prometheus (localhost:9090)
- cAdvisor (localhost:8080)

Grafana is configured with the default username and password (admin admin). <br>
Grafana has a dashboard called ELK monitoring in the "General" folder.

The possible backup approaches can be found in the backup-approach.txt file.

Logstash generated logs are output to the Elasticsearch nodes. Kibana can be used to visualize the logs using
the Elasticsearch nodes. <br>
cAdvisor is used to monitor and collect metrics about each container, these metrics are passed onto Prometheus. <br>
Grafana is used to create dashboards and panels which visualize these metrics using Prometheus as a data source. <br>

All containers reside on the Docker network called "elk". <br>
All services are using the latest version provided from their repositories. <br>
All Dockerfiles use Ubuntu:latest docker image as their base.
