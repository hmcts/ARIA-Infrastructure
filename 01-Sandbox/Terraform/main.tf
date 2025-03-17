# Provision resource group
resource "azurerm_resource_group" "aria-rg" {
  name     = "aria-rg"
  location = "UK South"
  tags = {
    environment = "sbox"
  }
}

module "AzureFunctions" {
  source                             = "./Modules/AzureFunctions"
  resource_group_name                = var.resource_group_name
  location                           = var.location
  service_plan_id                    = module.AzureFunctions.function_app_id
  storage_account_name               = module.StorageAccount.storage_account_name
  storage_account_primary_access_key = module.StorageAccount.storage_account_primary_access_key
}

module "DataBricks_Cluster" {
  source                   = "./Modules/DataBricks/Cluster"
  depends_on               = [module.DataBricks_Workspace]
  databricks_workspace_url = module.DataBricks_Workspace.databricks_workspace_url
  initialization_complete  = module.DataBricks_Workspace.databricks_init_complete
}

#module "DataBricks_Job" {
#  source              = "./Modules/DataBricks/Job"
#  resource_group_name = azurerm_resource_group.aria-rg.name
#  location            = azurerm_resource_group.aria-rg.location
#}

module "DataBricks_Notebook" {
  source = "./Modules/DataBricks/Notebook"
}

module "DataBricks_Pipeline" {
  source        = "./Modules/DataBricks/Pipeline"
  repo_path     = module.DataBricks_Repo.repo_path
  notebook_path = module.DataBricks_Notebook.notebook_path
}

module "DataBricks_Repo" {
  source = "./Modules/DataBricks/Repo"
}

module "DataBricks_Workspace" {
  source              = "./Modules/DataBricks/Workspace"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "EventHubs" {
  source              = "./Modules/EventHubs"
  resource_group_name = var.resource_group_name
  location            = var.location
  eventhub_id         = module.EventHubs.eventhub_id
}

module "KeyVault" {
  source              = "./Modules/KeyVault"
  resource_group_name = var.resource_group_name
  location            = var.location
  databricks_token    = var.databricks_token
}

module "LogAnalytics" {
  source              = "./Modules/LogAnalytics"
  resource_group_name = var.resource_group_name
  location            = var.location
  eventhub_id         = module.EventHubs.eventhub_namespace_id
}

module "StorageAccount" {
  source              = "./Modules/StorageAccount"
  resource_group_name = var.resource_group_name
  location            = var.location
}