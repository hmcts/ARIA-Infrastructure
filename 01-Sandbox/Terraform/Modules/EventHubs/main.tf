resource "azurerm_eventhub_namespace" "aria-eventhub-namespace" {
    name = "aria-eventhub-namespace"
    location = var.location
    resource_group_name = var.resource_group_name
    sku = "Standard"
    capacity = 1 # TBC

    tags = {
        environment = "sbox"
    }
}

resource "azurerm_eventhub" "aria-eventhub" {
    name = "aria-eventhub"
    resource_group_name = var.resource_group_name
    namespace_name = azurerm_eventhub_namespace.aria-eventhub-namespace.name
 #   namespace_id = azurerm_eventhub_namespace.aria-eventhub-namespace.id
    partition_count = 2 # TBC
    message_retention = 1 # TBC
}

