# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

resource "azurerm_resource_group" "default" {
  name     = var.resource_group_name
  location = var.resource_group_location

  tags = {
    environment = "Demo"
  }
}

resource "azurerm_kubernetes_cluster" "default" {
  name                = "github-actions-aks-cluster"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  dns_prefix          = "gha-aks-demo"
  kubernetes_version  = "1.33.1"

  default_node_pool {
    name            = "default"
    node_count      = 2
    vm_size         = "Standard_D4ds_v6"
    os_disk_size_gb = 30
  }

  identity {
    type = "SystemAssigned"
  }

#   service_principal {
#     client_id     = var.appId
#     client_secret = var.password
#   }

  role_based_access_control_enabled = true

  tags = {
    environment = "Demo"
  }
}