aks = {
  "aks01" = {
    name                 = "az-crp-aks01"
    prefix               = "dev"
    version              = "1.32.0"
    sku                  = "Free"
    auth_ip_ranges       = ["182.71.206.58", "49.205.248.37"]
    nodepool_name        = "defaultpool"
    node_count           = "3"
    node_vm_size         = "Standard_DS2_v2"
    orchestrator_version = "1.32.0"
    identity_type        = "SystemAssigned"
    utc_offset           = "-04:00"
    frequency            = "RelativeMonthly"
    interval             = "1"
    day_of_week          = "Saturday"
    week_index           = "Third"
    start_time           = "09:00"
    duration             = "8"
    network_plugin       = "azure"
    lb_sku               = "standard"
    dns_ip               = "10.2.0.10"
    service_cidr         = "10.2.0.0/24"
    environment          = "dev"
  }
}