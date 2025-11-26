variable "vnet_name" {
  description = "This is the vnet name"
  type = string
}

variable "resource_group_name" {
  description = "This is the vnet resource group"
  type = string
}

variable "address_space" {
  default = "10.0.0.0/16"
  type = string
  description = "This is the default address space for the vnet"
}

variable "location" {
  default = "eastus"
  type = string
  description = "This is the location of the vnet"
}