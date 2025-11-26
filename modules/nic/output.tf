output "nic_id" {
  description = "The ID of the Network Interface"
  value       = azurerm_network_interface.nic.id
}

output "nic_private_ip" {
  description = "The private IP address of the NIC"
  value       = azurerm_network_interface.nic.private_ip_address
}