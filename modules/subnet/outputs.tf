output "subnet_id" {
  description = "subnet id"
  value       = { for key, value in azurerm_subnet.SNET : key => value.id }
}