resourcegroup = {
  rg01 = {
    name      = "aksrg"
    rglocation = "eastus"
  }
  rg02 = {
    name       = "aksrg2"
    rglocation = "westus"
  }
}

vnet_definations = {
  vnet01 = {
    name          = "aksvnet01"
    address_space = ["10.0.0.0/16"]
  }
  vnet02 = {
    name          = "aksvnet02"
    address_space = ["10.0.0.0/16"]
  }
}

subnet = {
  subnet01 = {
    name          = "akssnet01"
    address_space = ["10.0.1.0/24"]
  }
  subnet02 = {
    name          = "akssnet02"
    address_space = ["10.0.2.0/24"]
  }
}
