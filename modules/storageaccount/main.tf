resource "azurerm_storage_account" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  account_kind             = var.account_kind
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  access_tier              = var.access_tier
  min_tls_version          = var.min_tls_version

  tags = var.tags

  ##############
  # Identity   #
  ##############
  dynamic "identity" {
    for_each = var.identity == null ? [] : [var.identity]

    content {
      type = identity.value.type
    }
  }

  #####################
  # Static Website    #
  #####################
  dynamic "static_website" {
    for_each = var.static_website == null ? [] : [var.static_website]

    content {
      index_document     = static_website.value.index_document
      error_404_document = static_website.value.error_404_document
    }
  }

  ############################
  # Network Rules (Optional) #
  ############################
  dynamic "network_rules" {
    for_each = var.network_rules == null ? [] : [var.network_rules]

    content {
      default_action             = network_rules.value.default_action
      ip_rules                   = lookup(network_rules.value, "ip_rules", [])
      virtual_network_subnet_ids = lookup(network_rules.value, "virtual_network_subnet_ids", [])
    }
  }

  ########################################
  # Blob Properties (Optional)           #
  ########################################
  dynamic "blob_properties" {
    for_each = var.blob_properties == null ? [] : [var.blob_properties]

    content {
      versioning_enabled  = lookup(blob_properties.value, "versioning_enabled", false)
      change_feed_enabled = lookup(blob_properties.value, "change_feed_enabled", false)
      delete_retention_policy {
        days = lookup(blob_properties.value, "delete_retention_days", null)
      }
    }
  }

  

}

#########################################
# Optional Blob Containers               #
#########################################
resource "azurerm_storage_container" "containers" {
  count                 = length(var.containers)
  name                  = var.containers[count.index].name
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = var.containers[count.index].access_type
}

#########################################
# Optional Queues                        #
#########################################
resource "azurerm_storage_queue" "queues" {
  count                = length(var.queues)
  name                 = var.queues[count.index]
  storage_account_name = azurerm_storage_account.this.name
}
