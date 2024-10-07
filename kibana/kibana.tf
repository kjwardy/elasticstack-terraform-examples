# The kibana.tf file initialises Kibana-specific resources

module "data_views" {
    source = "./data_views"
}