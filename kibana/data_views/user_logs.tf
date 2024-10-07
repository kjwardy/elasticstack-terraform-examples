resource "elasticstack_kibana_data_view" "user_logs" {
    data_view = {
        id = "user-logs" # Choose a specific id for this data view
        name = "user-logs" # The name of the data view when displayed in Kibana
        title = "logs-user-infrastructure" # Specify which indices / datastreams will be matched by this data view
        time_field_name = "@timestamp" # Choose which time field value will be used(usually @timestamp)
        namespaces = ["*"] # Which Kibana spaces this data view will be shown in
        
        override = false # Overrides existing data view if one already exists
        allow_no_index = true # Allows data view to be created even if some index matches don't exist

        field_formats = {
          "user.id" = {
            id = "url"
            params = {
                urltemplate = "http://google.com/search/{{value}}"
                labeltemplate = "{{value}}"
            }
          }
        }
    }
}