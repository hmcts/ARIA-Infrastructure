output "databricks_workspace_id" {
    description = "The ID of the Databrick workspace"
    value = azurerm_databricks_workspace.aria-db-workspace.workspace_id
}

output "databricks_workspace_url" {
    description = "The URL of the Databricks workspace"
    value = azurerm_databricks_workspace.aria-db-workspace.workspace_url
}

output "databricks_init_complete" {
    description = "Indicator that workspace initialisation is complete"
    value = time_sleep.aria-workspace-init.id
}