variable "name" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }

variable "account_kind" {
  type = string
  default = "StorageV2"
}

variable "account_tier" {
  type = string
  default = "Standard"
}

variable "account_replication_type" {
  type = string
  default = "LRS"
}

variable "access_tier" {
  type    = string
  default = null
}

variable "enable_https_traffic_only" {
  type    = bool
  default = true
}

variable "min_tls_version" {
  type    = string
  default = "TLS1_2"
}

variable "allow_blob_public_access" {
  type    = bool
  default = false
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "identity" {
  type = object({
    type = string
  })
  default = null
}

variable "static_website" {
  type = object({
    index_document     = string
    error_404_document = string
  })
  default = null
}

variable "network_rules" {
  type = object({
    default_action             = string
    ip_rules                   = optional(list(string))
    virtual_network_subnet_ids = optional(list(string))
  })
  default = null
}

variable "blob_properties" {
  type = object({
    versioning_enabled   = optional(bool)
    change_feed_enabled  = optional(bool)
    delete_retention_days = optional(number)
  })
  default = null
}

variable "customer_managed_key" {
  type = object({
    key_vault_uri  = string
    key_name       = string
    key_version    = string
    user_assigned_identity_id = optional(string)
  })
  default = null
}

variable "containers" {
  type = list(object({
    name        = string
    access_type = string
  }))
  default = []
}

variable "queues" {
  type    = list(string)
  default = []
}
