variable "aws_region" {
  description = "AWS region to launch cluster into."
  default     = "eu-west-2"
}

variable "eks_cluster_name" {
  description = "The name of the EKS cluster"
}