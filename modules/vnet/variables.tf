variable "vnet_definations" {
  description = "Variable mapped for vnet details"
  type = map(object({
    name          = string
    address_space = list(string)
  }))
}

variable "rgname" {
  type = string
}

variable "rglocation" {
  type = string
}