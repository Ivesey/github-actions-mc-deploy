module "aws" {
  source           = "./modules/aws"
  eks_cluster_name = var.eks_cluster_name
  aws_region       = var.aws_region
}

module "azure" {
  source                  = "./modules/azure"
  aks_cluster_name        = var.aks_cluster_name
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
}