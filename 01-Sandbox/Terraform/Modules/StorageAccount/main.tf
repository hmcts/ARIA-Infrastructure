resource "azurerm_storage_account" "aria-storage" {
    name = "ariastorage13901"
    resource_group_name = var.resource_group_name
    location = var.location
    account_tier = "Standard"
    account_replication_type = "GRS"
    account_kind = "StorageV2"

    tags = {
        environment = "sbox"
    }
}