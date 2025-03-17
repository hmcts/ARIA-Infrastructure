# Value will be assigned via .tfvars

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


variable "databricks_token" {
  description = "Databricks authentication token"
  type        = string
  sensitive   = true
  default     = ""
}