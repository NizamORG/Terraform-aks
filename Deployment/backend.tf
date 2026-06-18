terraform {
 backend "azurerm" {
   resource_group_name = "AKSRG"
   storage_account_name = "storagetffile0"
   container_name = "deployment-tf"
   key = "terraform.tfstate"
   use_azuread_auth = true
   use_oidc = true
 }
}