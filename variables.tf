variable "location" {
  type    = string
  default = "uksouth"
}

variable "key_vault" {
  type = object({
    soft_delete_retention_days = number
    purge_protection_enabled   = bool
    sku_name                   = string
  })
  default = {
    soft_delete_retention_days = 7
    purge_protection_enabled   = false
    sku_name                   = "standard"
  }
}

variable "storage_accounts" {
  type = map(object({
    identity_type             = string
    identity_ids              = list(string)
    replication_type          = string
    account_tier              = string
    account_kind              = string
    min_tls_version           = string
    enable_https_traffic_only = bool
  }))
}

variable "functionapps" {
  type = map(object({
    asp_sku                                               = string
    asp_os_type                                           = string
    asp_instance_size                                     = number
    asp_per_site_scaling_enabled                          = bool
    asp_zone_balancing_enabled                            = bool
    create_service_plan                                   = bool
    application_settings                                  = map(string)
    application_settings_sensitive_keyvault_lookup        = map(string)
    application_settings_sensitive_hashicorp_vault_lookup = map(string)
    functionapp_package                                   = string
    function_app_version                                  = number
    site_config                                           = map(string)
    application                                           = string
    service_plan_name                                     = string
    create_service_plan                                   = bool
    storage_account_name                                  = string
  }))
}

variable "application_insights" {
  type = object({
    log_analytics_workspace_id = string
    application_type           = string
    retention_in_days          = number
  })
  default = {
    log_analytics_workspace_id = null
    application_type           = "web"
    retention_in_days          = 90
  }
}

variable "smtp_api_connection" {
  type = object({
    create = bool
    name   = string
  })
  default = {
    create = false
    name   = "office365"
  }
}

variable "ssh_api_connection" {
  type = object({
    create              = bool
    name                = string
    userName            = string
    hostName            = string
    acceptAnySshHostKey = bool
  })
  default = {
    create              = false
    name                = null
    userName            = null
    hostName            = null
    acceptAnySshHostKey = false
  }
}

variable "logicapps" {
  type    = map(map(string))
  default = {}
}

variable "eventgrid_topics" {
  type = map(list(object({
    subscription_name = string
    functionapp_name  = string
    function_name     = string
    event_types       = list(string)
  })))
  default = {}
}

variable "eventgrid_system_topics" {
  type = map(object({
    storage_account_name = string
    subscriptions = list(object({
      subscription_name = string
      functionapp_name  = string
      function_name     = string
    }))
  }))
  default = {}
}

variable "namespace" {
  type        = string
  default     = ""
  description = "Namespace, which could be an organization name or abbreviation, e.g. 'eg' or 'cp'"
}

variable "costcode" {
  type        = string
  description = "Name of theDWP PRJ number (obtained from the project portfolio in TechNow)"
  default     = ""
}

variable "owner" {
  type        = string
  description = "Name of the project or sqaud within the PDU which manages the resource. May be a persons name or email also"
  default     = ""
}

variable "version_number" {
  type        = string
  description = "The version of the application or object being deployed. This could be a build object or other artefact which is appended by a CI/Cd platform as part of a process of standing up an environment"
  default     = ""
}

variable "application" {
  type        = string
  description = "Application to which the s3 bucket relates"
  default     = ""
}

variable "application_group" {
  type        = string
  description = "Group which function app belongs to"
  default     = ""
}

variable "attribute" {
  type        = string
  description = "An attribute of the s3 bucket that makes it unique"
  default     = ""
}

variable "environment" {
  type        = string
  description = "Environment into which resource is deployed"
  default     = ""
}

variable "type" {
  type        = string
  description = "Name of service type"
  default     = ""
}

variable "shared_dashboard" {
  type = object({
    create         = bool
    dashboard_json = string
  })
  default = {
    create         = false
    dashboard_json = "{}"
  }
}

variable "vnet_name" {
  description = "Vnet Name for Private Subnets"
  type        = string
  default     = ""
}

variable "vnet_rg_name" {
  description = "Vnet Resource Group Name for Private Subnets"
  type        = string
  default     = ""
}

variable "subnet_cidr" {
  description = "Vnet Subnet CIDR"
  type        = list(string)
  default     = []
}

variable "revision" {
  description = "Revision of Functional App"
  type        = string
  default     = ""
}

variable "create_subnet" {
  description = "Should Create Subnet"
  type        = bool
  default     = false
}
