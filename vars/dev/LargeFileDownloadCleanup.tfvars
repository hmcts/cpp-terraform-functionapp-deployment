storage_accounts = {
  sadevccplargefilestest = {
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
    asp_sku                      = "S1"
    asp_os_type                  = "Windows"
    asp_instance_size            = 1
    asp_per_site_scaling_enabled = false
    asp_zone_balancing_enabled   = false
    create_service_plan          = true
    application_settings = {
      FUNCTIONS_EXTENSION_VERSION                  = "~4"
      ENABLE_ORYX_BUILD                            = false
      SCM_DO_BUILD_DURING_DEPLOYMENT               = false
      FUNCTIONS_WORKER_RUNTIME                     = "java"
      WEBSITE_HTTPLOGGING_RETENTION_DAYS           = 3
      "material.alfrescoAzureStorageContainerName" = "largefiles-blob-container"
      "material.largefileExpiryInMinutes"          = 30
    }
    application_settings_sensitive_keyvault_lookup        = {}
    application_settings_sensitive_hashicorp_vault_lookup = {}
    functionapp_package                                   = "https://libraries-internal.mdv.cpp.nonlive/artifactory/list/repocentral/uk/gov/moj/cpp/material/material-azure-functions/8.0.4/material-azure-functions-8.0.4.zip"
    site_config = {
      use_32_bit_worker_process = true
    }
    application          = "LargeFileDownloadCleanup"
    service_plan_name    = null
    create_service_plan  = true
    storage_account_name = "sadevccplargefilestest"
  }
}

namespace         = "cpp"
costcode          = "0101"
attribute         = ""
owner             = "EI"
environment       = "dev"
application       = "LargeFileDownloadCleanup"
application_group = "largefiles"
type              = "functionapp"
