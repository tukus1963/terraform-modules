resource "azurerm_public_ip" "public_ip" {
    resource_group_name = var.resource_group_name
    location = var.location
    name = var.public_ip_name
    allocation_method = "Static"

    sku = "Standard"
    sku_tier = "Regional"
}