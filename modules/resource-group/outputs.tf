output "rg_name" {
  value       = { for key, value in azurerm_resource_group.RG : key => value.name }
  description = "Resourcegroup name"
}

output "rg_id" {
  value       = { for key, value in azurerm_resource_group.RG : key => value.id }
  description = "Resourcegroup id"
}

output "rg_location" {
  value       = { for key, value in azurerm_resource_group.RG : key => value.location }
  description = "Resourcegroup Location"
}