storage_accounts = {
  sadevccp0101notifyattfa2 = {
    identity_type             = "SystemAssigned"
    identity_ids              = null
    replication_type          = "LRS"
    account_tier              = "Standard"
    account_kind              = "StorageV2"
    min_tls_version           = "TLS1_2"
    enable_https_traffic_only = true
  }
}

application_insights = {
  log_analytics_workspace_id = null
  application_type           = "web"
  retention_in_days          = 90
}

functionapps = {
  fa-dev-cpp-notifyatt = {
    asp_sku                      = "P1v2"
    asp_os_type                  = "Windows"
    asp_instance_size            = 1
    asp_per_site_scaling_enabled = false
    asp_zone_balancing_enabled   = false
    function_app_version         = 2
    application_settings = {
      ENABLE_ORYX_BUILD                  = false
      SCM_DO_BUILD_DURING_DEPLOYMENT     = false
      FUNCTIONS_WORKER_RUNTIME           = "java"
      WEBSITE_HTTPLOGGING_RETENTION_DAYS = 3
    }
    application_settings_sensitive_keyvault_lookup = {}
    application_settings_sensitive_hashicorp_vault_lookup = {
      SMTP_SETTINGS = "secret/dev/devccm01/o365_email_password"
    }
    functionapp_package = "https://libraries-internal.mdv.cpp.nonlive/artifactory/list/repocentral/uk/gov/moj/cpp/notification/notify/notificationnotify-azure-functions/8.0.2/notificationnotify-azure-functions-8.0.2.zip"
    site_config = {
      use_32_bit_worker_process = true
    }
    application          = "notifyatt"
    service_plan_name    = null
    create_service_plan  = true
    storage_account_name = "sadevccp0101notifyattfa2"
  }
}

logicapps = {
  notifyatt = {
    function_app_name = "fa-dev-cpp-notifyatt"
  }
}

smtp_api_connection = {
  create = true
  name   = "office365"
}

namespace         = "cpp"
costcode          = "0101"
attribute         = ""
owner             = "EI"
environment       = "dev"
application       = "notifyatt"
application_group = "notifyatt"
type              = "functionapp"

# https://learn.microsoft.com/en-gb/azure/app-service/overview-vnet-integration#regional-vnet-integration
create_subnet = true
# VN-DEV-INT-01 is 10.89.64.0/18 which is 10.89.64.0 - 10.89.127.255
vnet_name = "VN-DEV-INT-01"

vnet_rg_name = "RG-DEV-CORE-01"

# Check to see subnets..
# https://www.davidc.net/sites/default/subnets/subnets.html?network=10.89.123.0&mask=24&division=31.f4627231
# | CIDR block size	| Maximum available addresses	| Maximum horizontal scale (instances) |
# |        /28	    |      11	                    |             5                        |
# 0 / 16 / 32 / 48 / 64 / 80 / 96 / 112 / 128 /
subnet_cidr = ["10.89.123.0/28"]

