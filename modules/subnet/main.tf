resource "azurerm_subnet" "SNET" {
  for_each             = var.subnet
  name                 = each.value.name
  virtual_network_name = var.vnetname
  resource_group_name  = var.rgname
  address_prefixes     = each.value.address_space
}