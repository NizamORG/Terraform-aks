resource "azurerm_kubernetes_cluster" "AKSCluster" {
  for_each            = var.aks
  name                = each.value.name
  location            = var.location
  resource_group_name = var.rgname
  dns_prefix          = each.value.prefix

  kubernetes_version = each.value.version
  sku_tier           = each.value.sku

  api_server_access_profile {
    authorized_ip_ranges = each.value.auth_ip_ranges
  }
  default_node_pool {
    name                 = each.value.nodepool_name
    node_count           = each.value.node_count
    vm_size              = each.value.node_vm_size
    vnet_subnet_id       = var.subnet_id
    orchestrator_version = each.value.orchestrator_version
  }

  role_based_access_control_enabled = true
  identity {
    type = each.value.identity_type
  }
  maintenance_window_node_os {
    utc_offset  = each.value.utc_offset
    frequency   = each.value.frequency
    interval    = each.value.interval
    day_of_week = each.value.day_of_week
    week_index  = each.value.week_index
    start_time  = each.value.start_time
    duration    = each.value.duration
  }


  # Enable automatic node image upgrades channel

  network_profile {
    network_plugin    = each.value.network_plugin
    load_balancer_sku = each.value.lb_sku
    dns_service_ip    = each.value.dns_ip
    service_cidr      = each.value.service_cidr
  }

  tags = {
    Environment = each.value.environment
  }
}