module "resourcegroup" {
  source        = "../modules/resource-group"
  resourcegroup = var.resourcegroup
}

module "vnet" {
  source           = "../modules/vnet"
  vnet_definations = var.vnet_definations
  rgname           = module.resourcegroup.rg_name["rg01"]
  rglocation       = module.resourcegroup.rg_location["rg01"]
}

# module "subnet" {
#   for_each = var.vnet_definations
#   source   = "../modules/subnet"
#   subnet   = var.subnet
#   vnetname = module.vnet.vnet_name[each.key]
#   rgname   = module.vnet.vnet_rgname[each.key]
# }