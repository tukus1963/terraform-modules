resource "azurerm_storage_account" "account" {
  name = var.account_name
  location = var.location
  resource_group_name = var.resource_group_name
  account_tier = "Standard"
  account_replication_type = "GRS"

  
}