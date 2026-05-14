
variable "rgname" {
  type        = string
  description = "Resource group name"
}

variable "rglocation" {
  type        = string
  description = "used for selecting location"
  default     = "east us"
}

variable "vnetname" {
  type        = string
  description = "Vnet name"
}
variable "snetname" {
  type        = string
  description = "subnet name"
}

variable "vnetadd" {
  type = list(string)
}

variable "snetadd" {
  type = list(string)
}

variable "prefix" {
  type = string
}

variable "AKSName" {
  type        = string
  description = "AKS clustername"
}

variable "nodepoolname" {
  type = string
}

variable "newpool1" {
  type        = string
  description = "pool name"
}

variable "nodecount" {
  type = number
}

variable "subscription" {
  type        = string
  description = "Subscription ID"
}
