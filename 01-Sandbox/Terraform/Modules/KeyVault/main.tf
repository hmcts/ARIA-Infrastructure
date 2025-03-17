# Create key vault resource
resource "azurerm_key_vault" "aria-kv" {
    name = "aria-kv"
    resource_group_name = var.resource_group_name
    location = var.location
    tenant_id = data.azurerm_client_config.current.tenant_id
    sku_name = "standard"
    # Additional parameters we can use for security, access, 
    # secret retention and deletion periods

    access_policy {
      tenant_id = data.azurerm_client_config.current.tenant_id
      object_id = data.azurerm_client_config.current.object_id

      secret_permissions = ["Get",
                            "List",
                            "Set",
                            "Delete",
                            "Recover",
                            "Backup",
                            "Restore"]
    }

    tags = {
    environment = "sbox"
  }
}

# Create secret in Key Vault
resource "azurerm_key_vault_secret" "databricks_token" {
  name                = "databricks-token"
  value               = var.databricks_token
  key_vault_id        = azurerm_key_vault.aria-kv.id
}

