variable "resourcegroup" {
  description = "Resource group detail"
  type = map(object({
    name       = string
    rglocation = string
  }))
}