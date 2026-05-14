terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.100"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}

# 1. Resource Group
resource "azurerm_resource_group" "AKSRG" {
  name     = var.rgname
  location = var.rglocation
}

# 2. Virtual Network
resource "azurerm_virtual_network" "AKSVnet" {
  name                = var.vnetname
  location            = azurerm_resource_group.AKSRG.location
  resource_group_name = azurerm_resource_group.AKSRG.name
  address_space       = var.vnetadd
}

# 3. Subnet
resource "azurerm_subnet" "AKSSnet" {
  name                 = var.snetname
  resource_group_name  = azurerm_resource_group.AKSRG.name
  virtual_network_name = azurerm_virtual_network.AKSVnet.name
  address_prefixes     = var.snetadd
}

# 4. AKS Cluster
resource "azurerm_kubernetes_cluster" "AKSCluster" {
  name                = var.AKSName
  location            = azurerm_resource_group.AKSRG.location
  resource_group_name = azurerm_resource_group.AKSRG.name
  dns_prefix          = var.prefix

  kubernetes_version = "1.32.0"
  sku_tier           = "Free"

  api_server_access_profile {
    authorized_ip_ranges = [
      "182.71.206.58",
      "49.205.248.37",
    ]
  }
  default_node_pool {
    name                 = var.nodepoolname
    node_count           = var.nodecount
    vm_size              = "Standard_DS2_v2"
    vnet_subnet_id       = azurerm_subnet.AKSSnet.id
    orchestrator_version = "1.32.0"
  }

  role_based_access_control_enabled = true
  identity {
    type = "SystemAssigned"
  }
  maintenance_window_node_os {
    utc_offset  = "-04:00"
    frequency   = "RelativeMonthly"
    interval    = 1
    day_of_week = "Saturday"
    week_index  = "Third"
    start_time  = "09:00"
    duration    = 8

  }


  # Enable automatic node image upgrades channel

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
    dns_service_ip    = "10.2.0.10"
    service_cidr      = "10.2.0.0/24"
  }

  tags = {
    Environment = "Demo"
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "Nodepool" {
  name                  = var.newpool1
  node_count            = var.nodecount
  vm_size               = "Standard_DS2_v2"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.AKSCluster.id
  orchestrator_version  = "1.32.0"
  upgrade_settings {
    max_surge = "30%"
  }
  lifecycle {
    create_before_destroy = true
  }
}


# 5. Outputs
output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.AKSCluster.name
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.AKSCluster.kube_admin_config_raw
  sensitive = true
}
