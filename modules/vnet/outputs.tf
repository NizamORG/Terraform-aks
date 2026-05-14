output "vnet_name" {
  value       = { for key, value in azurerm_virtual_network.VNET01 : key => value.name }
  description = "vnet name"
}

output "vnet_id" {
  value       = { for key, value in azurerm_virtual_network.VNET01 : key => value.id }
  description = "vnet id"
}

output "vnet_rgname" {
  value = {for key, value in azurerm_virtual_network.VNET01 : key => value.resource_group_name }
  description = "vnet resource group name"
}