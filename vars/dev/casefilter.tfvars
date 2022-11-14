storage_accounts = {
  sadevcpp0101casefilfa2 = {
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
  fa-dev-cpp-casefilter = {
    asp_sku                      = "P1v2"
    asp_os_type                  = "Windows"
    asp_instance_size            = 1
    asp_per_site_scaling_enabled = false
    asp_zone_balancing_enabled   = false
    create_service_plan          = true
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
    functionapp_package = "https://libraries-internal.mdv.cpp.nonlive/artifactory/list/repocentral/uk/gov/moj/cpp/staging/prosecutors/spi/stagingprosecutors-azure-functions/8.0.3/stagingprosecutors-azure-functions-8.0.3.zip"
    site_config = {
      use_32_bit_worker_process = true
    }
    application          = "casefilter"
    service_plan_name    = null
    create_service_plan  = true
    storage_account_name = "sadevcpp0101casefilfa2"
  }
}

eventgrid_topics = {
  eg-dev-ccp-notifycourtstore = [
    {
      subscription_name = "EGS-DEV-CCP-NOTIFYCOURTSTORE-CASEEJECT"
      functionapp_name  = "fa-dev-cpp-casefilter"
      function_name     = "notifyCourtStoreOnCaseEject"
      event_types       = ["CaseEjected"]
    },
    {
      subscription_name = "EGS-SIT-CCP0101-NOTIFYCOURTSTORE-CASEONCPP"
      functionapp_name  = "fa-dev-cpp-casefilter"
      function_name     = "notifyCourtStoreOnCaseOnCpp"
      event_types       = ["CaseOnCpp"]
    }
  ]
}

namespace         = "cpp"
costcode          = "0101"
attribute         = ""
owner             = "EI"
environment       = "dev"
application       = "casefilter"
application_group = "casefilter"
type              = "functionapp"
