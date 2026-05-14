resource "azurerm_resource_group" "RG" {
  for_each = var.resourcegroup
  name     = each.value.name
  location = each.value.rglocation
}