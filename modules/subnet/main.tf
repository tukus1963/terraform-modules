resource "azurerm_subnet" "name" {
  name = var.subnet_name
  resource_group_name = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes = [ var.address_prefixes ]
}

resource "azurerm_subnet_network_security_group_association" "associate_subnet" {
  count                     = var.associate_subnet ? 1 : 0
  network_security_group_id = var.nsg_id
  subnet_id                 = azurerm_subnet.name.id
}