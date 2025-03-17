variable "repo_path" {
  description = "Path to the Databricks repo"
  type        = string
}

variable "notebook_path" {
  description = "Path to the Databricks notebook"
  type        = string
}

variable "storage" {
  description = "Storage location for the pipeline"
  type        = string
  default     = "/test/first-pipeline"
}

variable "default_cluster_num_workers" {
  description = "Number of workers for the default cluster"
  type        = number
  default     = 1
}

variable "maintenance_cluster_num_workers" {
  description = "Number of workers for the maintenance cluster"
  type        = number
  default     = 1
}

variable "continuous" {
  description = "Set to true for continuous pipeline execution"
  type        = bool
  default     = false
}
