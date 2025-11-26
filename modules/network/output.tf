output "vnet_id" {
  description = "The ID of the Virtual Network"
  value       = azurerm_virtual_network.this.id
}

output "vnet_name" {
  description = "The name of the Virtual Network"
  value       = azurerm_virtual_network.this.name
}

output "vnet_location" {
  description = "The location/region of the Virtual Network"
  value       = azurerm_virtual_network.this.location
}

output "vnet_address_space" {
  description = "The address space(s) of the Virtual Network"
  value       = azurerm_virtual_network.this.address_space
}