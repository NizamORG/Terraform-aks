variable "resourcegroup" {
  description = "Resource group detail"
  type = map(object({
    name       = string
    rglocation = string
  }))
}

variable "vnet_definations" {
  description = "vnet details"
  type = map(object({
    name          = string
    address_space = list(string)
  }))
}

variable "subnet" {
  description = "subnet details"
  type = map(object({
    name          = string
    address_space = list(string)
  }))
}
