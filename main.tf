module "functionapp" {
  source                                    = "github.com/hmcts/cpp-module-terraform-azurerm-functionapp.git?ref=dev_EI_862"
  storage_account_name                      = var.storage_account_name
  region                                    = var.region
  storage_account_tier                      = var.storage_account_tier
  storage_account_kind                      = var.storage_account_kind
  storage_account_account_replication_type  = var.storage_account_account_replication_type
  storage_account_min_tls_version           = var.storage_account_min_tls_version
  storage_account_enable_https_traffic_only = var.storage_account_enable_https_traffic_only
  storage_account_identity_type             = var.storage_account_identity_type
  storage_account_identity_ids              = var.storage_account_identity_ids
  asp_os_type                               = var.asp_os_type
  asp_instance_size                         = var.asp_instance_size
  asp_sku                                   = var.asp_sku
  function_app_application_settings         = merge(var.function_app_application_settings, local.function_app_application_settings_sensitive)
  site_config                               = var.site_config
  application_insights_enabled              = var.application_insights_enabled
  application_zip_package_path              = var.application_zip_package_path
  logicapp_enabled                          = var.logicapp_enabled
  logicapp_template                         = var.logicapp_template
  logicapp_parameters                       = var.logicapp_parameters
  logicapp_api_connection_template          = var.logicapp_api_connection_template
  logicapp_api_connection_parameters        = var.logicapp_api_connection_parameters
  service_plan_name = var.service_plan_name ? var.service_plan_name : "as-${var.environment}-${var.namespace}-${var.application}"
  create_storage_account = var.create_storage_account
  create_service_plan = var.create_service_plan
  namespace   = var.namespace
  costcode    = var.costcode
  attribute   = var.attribute
  owner       = var.owner
  environment = var.environment
  application = var.application
  type        = var.type
}
