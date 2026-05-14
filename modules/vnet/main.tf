resource "azurerm_virtual_network" "VNET01" {
  for_each            = var.vnet_definations
  name                = each.value.name
  resource_group_name = var.rgname
  location            = var.rglocation
  address_space       = each.value.address_space
}