variable "aks" {
  description = "kubernetes values"
  type = map(object({
    name                 = string
    prefix               = string
    version              = string
    sku                  = string
    auth_ip_ranges       = list(string)
    nodepool_name        = string
    node_count           = string
    node_vm_size         = string
    orchestrator_version = string
    identity_type        = string
    utc_offset           = string
    frequency            = string
    interval             = string
    day_of_week          = string
    week_index           = string
    start_time           = string
    duration             = string
    network_plugin       = string
    lb_sku               = string
    dns_ip               = string
    service_cidr         = string
    environment          = string
  }))
}

variable "subnet_id" {
  description = "Subnet ID for AKS cluster"
  type        = string
}

variable "rgname" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure location for resources"
  type        = string
}