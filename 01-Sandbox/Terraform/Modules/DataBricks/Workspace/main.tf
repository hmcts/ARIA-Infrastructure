# Create Databricks workspace

resource "azurerm_databricks_workspace" "aria-db-workspace" {
  name                = "aria-db-workspace"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "trial"
}

# Add time_sleep resource to add a delay after wortkspace creation
# Perhaps we need to add an azure CLI / powershell script to make 
# An initial API call to warm up workspace (in CICD step)

resource "time_sleep" "aria-workspace-init" {
  depends_on = [azurerm_databricks_workspace.aria-db-workspace]
  create_duration = "3m"
}
