variable "subnet" {
  description = "subnet_details"
  type = map(object({
    name          = string
    address_space = list(string)
  }))
}

variable "rgname" {
  type = string
}

variable "vnetname" {
  type = string
}