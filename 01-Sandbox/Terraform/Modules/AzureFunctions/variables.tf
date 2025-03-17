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

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}

variable "storage_account_primary_access_key" {
  description = "The access key for the storage account"
  type        = string
}

variable "service_plan_id" {
  description = "The ID of the App Service Plan"
  type = string
}