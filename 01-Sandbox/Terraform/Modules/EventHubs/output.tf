# Output the event hub ID for log analytics in the root repo

output "eventhub_id" {
    value = azurerm_eventhub.aria-eventhub.id
}

output "eventhub_namespace_id" {
    value = azurerm_eventhub_namespace.aria-eventhub-namespace.id
}
