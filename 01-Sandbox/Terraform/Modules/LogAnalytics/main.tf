resource "azurerm_log_analytics_workspace" "aria-logs" {
    name = "arria-log-analytics"
    location = var.location
    resource_group_name = var.resource_group_name
    sku = "PerGB2018"

   # retention_in_days = 7

    tags = {
        enviornment = "sbox"
    }
}

resource "azurerm_monitor_diagnostic_setting" "aria-eventhub-logs" {
    name = "aria-eventhubs-logs"


    # Use key vault once set up?
    target_resource_id = var.eventhub_id # Passed in from the root repo
    log_analytics_workspace_id = azurerm_log_analytics_workspace.aria-logs.id

    metric {
        category = "AllMetrics"
    }

    enabled_log {
        category = "ArchiveLogs"
    }
}