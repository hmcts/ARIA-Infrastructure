# Design Web App to host the Azure function

resource "azurerm_service_plan" "aria-app-plan" {
  name                = "aria-app-plan"
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_function_app" "aria-azure-func" {
  name                = "aria-azure-func"
  resource_group_name = var.resource_group_name
  location            = var.location

  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_primary_access_key
  service_plan_id            = azurerm_service_plan.aria-app-plan.id

  site_config {}
}