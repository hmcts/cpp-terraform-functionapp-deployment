data "azurerm_subscription" "current" {}
data "azurerm_client_config" "current" {}

module "tag_set" {
  source         = "git::https://github.com/hmcts/cpp-module-terraform-azurerm-tag-generator.git?ref=main"
  namespace      = var.namespace
  application    = var.application
  costcode       = var.costcode
  owner          = var.owner
  version_number = var.version_number
  attribute      = var.attribute
  environment    = var.environment
  type           = var.type
}

resource "azurerm_resource_group" "main" {
  name     = "rg-${var.environment}-${var.namespace}-${var.application_group}"
  location = var.location
  tags     = module.tag_set.tags
}

resource "azurerm_key_vault" "main" {
  name                        = "KV-${upper(var.environment)}-${upper(var.application_group)}-01"
  location                    = var.location
  resource_group_name         = azurerm_resource_group.main.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = var.key_vault.soft_delete_retention_days
  purge_protection_enabled    = var.key_vault.purge_protection_enabled

  sku_name = var.key_vault.sku_name

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
    secret_permissions = [
      "Get", "List", "Set", "Delete", "Purge", "Recover"
    ]
  }
}

#  Storage Account
resource "azurerm_storage_account" "main" {
  for_each                        = var.storage_accounts
  name                            = each.key
  location                        = var.location
  resource_group_name             = azurerm_resource_group.main.name
  account_replication_type        = each.value.replication_type
  account_tier                    = each.value.account_tier
  account_kind                    = each.value.account_kind
  min_tls_version                 = each.value.min_tls_version
  allow_nested_items_to_be_public = false
  enable_https_traffic_only       = each.value.enable_https_traffic_only
  tags                            = module.tag_set.tags

  dynamic "identity" {
    for_each = each.value.identity_type == null ? [] : [1]
    content {
      type         = each.value.identity_type
      identity_ids = each.value.identity_type == "UserAssigned" ? each.value.identity_ids : null
    }
  }
}

resource "azurerm_key_vault_secret" "sa_connection_strings" {
  for_each     = local.sa_name_connection_strings_map
  name         = "ado--cpp-terraform-functionapp-deployment--${var.environment}--${each.key}--connection-string-test"
  value        = each.value
  key_vault_id = azurerm_key_vault.main.id
  depends_on = [
    azurerm_storage_account.main,
    azurerm_key_vault.main
  ]
}

# App Insights
resource "azurerm_application_insights" "app_insights" {
  name                = "ai-${var.environment}-${var.namespace}-${var.application_group}"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  workspace_id        = var.application_insights.log_analytics_workspace_id
  application_type    = var.application_insights.application_type
  retention_in_days   = var.application_insights.retention_in_days
  tags                = module.tag_set.tags
}

module "functionapp" {
  source = "github.com/hmcts/cpp-module-terraform-azurerm-functionapp.git?ref=main"
  #source                                                = "../cpp-module-terraform-azurerm-functionapp"
  for_each                                              = var.functionapps
  location                                              = var.location
  function_app_name                                     = each.key
  function_app_version                                  = each.value.function_app_version
  resource_group_name                                   = azurerm_resource_group.main.name
  asp_os_type                                           = each.value.asp_os_type
  asp_instance_size                                     = each.value.asp_instance_size
  asp_sku                                               = each.value.asp_sku
  asp_per_site_scaling_enabled                          = each.value.asp_per_site_scaling_enabled
  asp_zone_balancing_enabled                            = each.value.asp_zone_balancing_enabled
  storage_account_name                                  = each.value.storage_account_name
  storage_account_access_key                            = lookup(local.sa_name_accesskey_map, each.value.storage_account_name, null)
  application_settings                                  = merge(each.value.application_settings, local.default_application_settings)
  application_settings_sensitive_keyvault_lookup        = each.value.application_settings_sensitive_keyvault_lookup
  application_settings_sensitive_hashicorp_vault_lookup = each.value.application_settings_sensitive_hashicorp_vault_lookup
  functionapp_package                                   = each.value.functionapp_package
  site_config                                           = merge(each.value.site_config, local.default_site_config)
  service_plan_name                                     = each.value.service_plan_name != null ? each.value.service_plan_name : "as-${var.environment}-${var.namespace}-${each.value.application}"
  create_service_plan                                   = each.value.create_service_plan
  key_vault_id                                          = azurerm_key_vault.main.id
  environment                                           = var.environment
  create_subnet                                         = each.value.create_subnet
  vnet_name                                             = each.value.vnet_name
  vnet_rg_name                                          = each.value.vnet_rg_name
  subnet_cidr                                           = each.value.subnet_cidr
  subnet_name                                           = each.value.subnet_name
  depends_on = [
    azurerm_key_vault_secret.sa_connection_strings,
    azurerm_application_insights.app_insights
  ]
}

# API Connections
resource "azurerm_resource_group_template_deployment" "smtp_api_connection" {
  count               = var.smtp_api_connection.create == true ? 1 : 0
  name                = var.smtp_api_connection.name
  resource_group_name = azurerm_resource_group.main.name
  template_content = templatefile("${path.module}/templates/common/api_connection/office365.json", {
    name            = var.smtp_api_connection.name
    subscription_id = data.azurerm_subscription.current.subscription_id
  })
  deployment_mode = "Incremental"
  tags            = module.tag_set.tags
}

resource "azurerm_resource_group_template_deployment" "ssh_api_connection" {
  count               = var.ssh_api_connection.create == true ? 1 : 0
  name                = var.ssh_api_connection.name
  resource_group_name = azurerm_resource_group.main.name
  template_content = templatefile("${path.module}/templates/common/api_connection/sftpwithssh.json", {
    name                = var.ssh_api_connection.name
    subscription_id     = data.azurerm_subscription.current.subscription_id
    userName            = var.ssh_api_connection.userName
    hostName            = var.ssh_api_connection.hostName
    acceptAnySshHostKey = var.ssh_api_connection.acceptAnySshHostKey
    resource_group_name = azurerm_resource_group.main.name
  })
  deployment_mode = "Incremental"
  tags            = module.tag_set.tags
}

# Logic App
resource "azurerm_resource_group_template_deployment" "logic_app" {
  for_each            = var.logicapps
  name                = "lg-${var.environment}-${var.namespace}-${each.key}"
  resource_group_name = azurerm_resource_group.main.name
  template_content = templatefile("${path.module}/templates/${var.application_group}/logicapp/${each.key}.json", {
    name                = "lg-${var.environment}-${var.namespace}-${each.key}"
    resource_group_name = azurerm_resource_group.main.name
    uri_reference       = try(each.value.uri_reference, "")
    shared_email_box    = try(each.value.shared_email_box, "")
    function_app_name   = try(each.value.function_app_name, "")
    environment         = var.environment
    subscription_id     = data.azurerm_subscription.current.subscription_id
  })
  deployment_mode = "Incremental"
  tags            = module.tag_set.tags
  depends_on = [
    module.functionapp,
    azurerm_resource_group_template_deployment.smtp_api_connection,
    azurerm_resource_group_template_deployment.ssh_api_connection
  ]
}

# Event grid Topics and subscriptions
resource "azurerm_eventgrid_topic" "function_app_eventgrid_topic" {
  for_each            = var.eventgrid_topics
  name                = each.key
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  tags                = module.tag_set.tags
}

resource "azurerm_eventgrid_event_subscription" "function_app_eventgrid_topic" {
  for_each = local.subscriptions_map
  name     = each.value.subscription_name
  scope    = azurerm_eventgrid_topic.function_app_eventgrid_topic[each.value.topic_name].id
  azure_function_endpoint {
    function_id = "${module.functionapp[each.value.functionapp_name].function_app_id}/functions/${each.value.function_name}"
  }
  included_event_types = each.value.event_types
  depends_on = [
    module.functionapp
  ]
}

resource "azurerm_eventgrid_system_topic" "function_app_eventgrid_system_topic" {
  for_each               = var.eventgrid_system_topics
  name                   = each.key
  resource_group_name    = azurerm_resource_group.main.name
  location               = var.location
  source_arm_resource_id = azurerm_storage_account.main[each.value.storage_account_name].id
  topic_type             = "Microsoft.Storage.StorageAccounts"
}

resource "azurerm_eventgrid_system_topic_event_subscription" "function_app_eventgrid_system_topic" {
  for_each            = local.system_subscriptions_map
  name                = each.value.subscription_name
  system_topic        = azurerm_eventgrid_system_topic.function_app_eventgrid_system_topic[each.value.topic_name].name
  resource_group_name = azurerm_resource_group.main.name
  webhook_endpoint {
    url = "https://${each.value.functionapp_name}.azurewebsites.net/runtime/webhooks/EventGrid?functionName=${each.value.function_name}&code=${module.functionapp[each.value.functionapp_name].function_app_primary_key}"
  }
}

resource "azurerm_portal_dashboard" "function_app_shared_dashboard" {
  count                = var.shared_dashboard.create == true ? 1 : 0
  name                 = "${var.environment}-${var.namespace}-${var.application_group}-dashboard"
  resource_group_name  = azurerm_resource_group.main.name
  location             = var.location
  dashboard_properties = var.shared_dashboard.dashboard_json
}
