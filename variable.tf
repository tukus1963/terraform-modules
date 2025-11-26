variable "rg_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region"
  default     = "East US"
}

variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "Azure tenant ID"
  type        = string
}

variable "vnet_name" {
  description = "Azure vnet name"
  type = string
}

variable "subnet_name" {
  description = "Azure vm subnet name"
  type = string
}

variable "public_ip_name" {
  description = "Create the public ip"
  type = string
}

variable "nic_name"{
    description = "The name of NIC"
    type = string
}

variable "vm_size" {
  description = "Specifies the size of the Virtual Machine (e.g., Standard_B1s, Standard_DS1_v2)"
  type        = string
}

variable "admin_username" {
  description = "The admin username for the VM"
  type        = string
}

variable "admin_password" {
  description = "The admin password for the VM (must meet Azure complexity requirements)"
  type        = string
  sensitive   = true
}

variable "vm_name" {
  description = "The name of the Virtual Machine"
  type        = string
}