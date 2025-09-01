variable "resource_group_location" {
  type        = string
  default     = "uksouth"
  description = "Location of the resource group."
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group name."
}

variable "aks_cluster_name" {
  type        = string
  description = "AKS cluster name."
}