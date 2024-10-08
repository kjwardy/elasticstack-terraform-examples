resource "elasticstack_kibana_data_view" "kibana_sample_data_logs" {
    data_view = {
        id = "sample-data-logs" # Choose a specific id for this data view
        name = "Sample Data Logs" # The name of the data view when displayed in Kibana
        title = "kibana_sample_data_logs" # Specify which indices / datastreams will be matched by this data view
        time_field_name = "@timestamp" # Choose which time field value will be used(usually @timestamp)
        namespaces = ["*"] # Which Kibana spaces this data view will be shown in
        
        override = false # Overrides existing data view if one already exists
        allow_no_index = true # Allows data view to be created even if some index matches don't exist

        field_formats = {
          "url" = {
            id = "url"
            params = {
                label_template = "{{value}}"
            }
          }
        }
    }
}