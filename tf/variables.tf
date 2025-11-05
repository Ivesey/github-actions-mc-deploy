variable "aks_cluster_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "resource_group_location" {
  type = string
}

variable "eks_cluster_name" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "version" {
  type    = string
  default = "1.0"
}