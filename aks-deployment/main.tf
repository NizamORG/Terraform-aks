module "aks" {
  source    = "../modules/kubernetes"
  aks       = var.aks
  subnet_id = module.subnet.subnet_id["akssnet01"]
  rgname    = module.resourcegroup.rg_name["aksrg"]
  location  = module.resourcegroup.rg_location["aksrg"]
}