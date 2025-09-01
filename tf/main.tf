module "aws" {
  source           = "./modules/aws"
  eks_cluster_name = var.eks_cluster_name
}

module "azure" {
  source              = "./modules/azure"
  aks_cluster_name    = var.aks_cluster_name
  resource_group_name = var.resource_group_name
}