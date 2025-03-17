output "storage_account_name" {
    value = azurerm_storage_account.aria-storage.name
}

output "storage_account_primary_access_key" {
    value = azurerm_storage_account.aria-storage.primary_access_key
}