variable "resource_group_location" {
  type        = string
  default     = "uksouth"
  description = "Location of the resource group."
}

variable "resource_group_name" {
  type        = string
  default     = "tf_demo_rg"
  description = "Resource Group name."
}