terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }

    databricks = {
      source  = "databricks/databricks"
      version = "1.69.0"
    }
  }
}

# Pulls through db workspace once provisioned & PAT token from KV
provider "databricks" {
  host  = "https://${module.DataBricks_Workspace.databricks_workspace_url}"
  token = module.KeyVault.databricks_token_value
}

#this line allows us to pull out id's of provisioned principals
data "azurerm_client_config" "current" {}

# Service Principal fields. Perhaps KV in future. fix later
provider "azurerm" {
  subscription_id = ""
  tenant_id       = ""
  client_id       = ""
  client_secret   = ""
  features {}
}

