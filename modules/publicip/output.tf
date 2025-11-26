output "public_ip_address_id" {
  value = azurerm_public_ip.public_ip.ip_address
}

output "public_ip_id" {
  description = "The ID of the Public IP resource"
  value       = azurerm_public_ip.public_ip.id
}