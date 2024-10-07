# This authorise.tf contains configuration examples for authorising Terraform to manage your Elastic Stack
provider "elasticstack" {

    # Elasticsearch - username / password authentication
    elasticsearch {
      username = "elastic"
      password = "XvWUyU0gGYue+D7G14MG" 
      endpoints = ["http://127.0.0.1:9200"]
    }

    # Elasticsearch - API key authentication
    # elasticsearch {
    #   api_key = ""
    #   endpoints = ["http://127.0.0.1:9200"]
    # }

    # Kibana - username / password authentication
    kibana {
      username = "elastic"
      password = "XvWUyU0gGYue+D7G14MG"
      endpoints = ["http://127.0.0.1:5601"]
    }
}