output "subnet_id" {
  description = "The ID of the subnet"
  value       = azurerm_subnet.name.id
}

output "subnet_name" {
  description = "The name of the subnet"
  value       = azurerm_subnet.name.name
}

output "subnet_address_prefixes" {
  description = "The address prefixes of the subnet"
  value       = azurerm_subnet.name.address_prefixes
}