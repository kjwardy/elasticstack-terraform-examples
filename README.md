# elasticstack-terraform-examples

This repo contains a live example of an Elastic Stack managed by the [`terraform-provider-elasticstack`](https://github.com/elastic/terraform-provider-elasticstack). As the provider is regularly updated, this repo aims to build out functionality so that a fully working Stack could be in place after a single `terraform apply`.

![Static Badge](https://img.shields.io/badge/Status-In_Development-orange)

## Using this repo

### 1) Have a Stack to manage

You must first have an Elastic Stack stood up to use this repo to manage it. If you've already got one, skip to the next section. For local development or testing, the guide below will spin up Elasticsearch and Kibana locally using Docker.

1. Make sure Docker is installed
2. Create a new Docker network
```properties
docker network create elastic
```
3. Retrieve the Elasticsearch Docker image
```properties
docker pull docker.elastic.co/elasticsearch/elasticsearch:8.15.2
```
4. Start an Elasticsearch container
```properties
docker run --name es01 --net elastic -p 9200:9200 -it -m 1GB docker.elastic.co/elasticsearch/elasticsearch:8.15.2
```
5. Make a note of both the default password for the `elastic` user and the enrollment token for your cluster
- If you missed them, they can be regenerated with
```properties
docker exec -it es01 /usr/share/elasticsearch/bin/elasticsearch-reset-password -u elastic
docker exec -it es01 /usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s kibana
```
6. Retrieve the Kibana Docker image
```properties
docker pull docker.elastic.co/kibana/kibana:8.15.2
```
7. Start a Kibana container
```properties
docker run --name kib01 --net elastic -p 5601:5601 docker.elastic.co/kibana/kibana:8.15.2
```
8. Copy the link output into the terminal into your web browser
9. In the box, paste the enrollment token copied from the Elasticsearch container's output earlier on
10. Log into Kibana with the `elastic` username and password copied from the Elasticsearch container's output

### 2) Configure the repo to manage your stack

With an Elastic Stack now initialised, you can choose your preferred method of authenticating Terraform to be able to manage elements of the Stack. Elasticsearch and Kibana both need their own authentication blocks for Terraform to be able to manage them.
- Elasticsearch can use `username` and `password` **or** an `api_key`
- Kibana can only use `username` and `password`

The [`authenticate.tf`](./authenticate.tf) file contains examples of both being used.

- You can create a base64 encoded API key in the API Keys section of Kibana Stack Management. Copy the key over the placeholder and ensure that it's the only resource uncommented.
- If you span up a Stack earlier, the same `elastic` `username` and `password` will suffice for being able to manage the Stack for testing purposes. If you already have a Stack, consider creating a user within Kibana *solely* for Terraform management, or use the `api_key` authentication method.

### 3) Initialise Terraform, plan and apply

1. With all the above complete, navigate to this root level directory and run
```properties
terraform init
```
2. Terraform should initialise fine and be ready to manage your Stack
3. With that done, run
```properties
terraform plan
```
- *Hopefully*, this should output quite a lot of changes to be applied
4. If the Terraform output looks content, now run
```properties
terraform apply --auto-approve
```
- This will now apply the full `elasticstack-terraform-examples` configuration onto your managed Stack.