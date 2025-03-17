variable "resource_group_name" {
    description = "ARIA resource group name"
    type = string
    default = "aria-rg"
}

variable "location" {
    description = "Azure region"
    type = string
    default = "UK South"
}

variable "eventhub_id" {
    description = "the ID of the Event Hub to link to"
    type = string
}

