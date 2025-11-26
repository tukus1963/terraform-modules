variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group where the subnet will be created"
  type        = string
}

variable "vnet_name" {
  description = "Name of the virtual network to attach the subnet"
  type        = string
}

variable "address_prefixes" {
  description = "List of address prefixes for the subnet"
  type        = string
  default     = "10.0.1.0/24"
}


variable "nsg_id" {
  description = "This is the the network security group ID"
  type = string 
  default = null
}

variable "associate_subnet" {
  description = "This helps to check if the association of subnet and nsg required or not "
  type = bool
  default = false
}