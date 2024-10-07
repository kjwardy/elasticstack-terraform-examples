# The main.tf file is the starting point for all other elasticstack provider modules to be initialised.

module "elasticsearch" {
    source = "./elasticsearch"
}

module "logtash" {
    source = "./logstash"
}

module "kibana" {
    source = "./kibana"
}