storage_accounts = {
  sadevccp0101hearingres2 = {
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
  fa-dev-cpp-courtorders = {
    asp_sku                      = "EP1"
    asp_os_type                  = "Linux"
    asp_instance_size            = 1
    asp_per_site_scaling_enabled = false
    asp_zone_balancing_enabled   = false
    create_service_plan          = true
    application_settings = {
      ENABLE_ORYX_BUILD                   = false
      SCM_DO_BUILD_DURING_DEPLOYMENT      = false
      FUNCTIONS_WORKER_RUNTIME            = "java"
      COURTORDER_CONTEXT_API_BASE_URI     = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      ENFORCEMENT_CONTEXT_API_BASE_URI    = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      FUNCTIONS_EXTENSION_VERSION         = "~3"
      FUNCTIONS_WORKER_RUNTIME            = "node"
      NODE_EXTRA_CA_CERTS                 = "/home/site/wwwroot/internal_ca_certs.pem"
      NOWS                                = "NowsTaskHub3"
      PROGRESSION_CONTEXT_API_BASE_URI    = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      REDIS_HOST                          = "RC-DEV-CCP01.redis.cache.windows.net"
      REDIS_PORT                          = 6380
      REFERENCE_DATA_CONTEXT_API_BASE_URI = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      RESULTS_CONTEXT_API_BASE_URI        = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      SJP_CONTEXT_API_BASE_URI            = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      STAGINGDVLA_CONTEXT_API_BASE_URI    = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      UNIFIED_SEARCH_CONTEXT              = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      WEBSITE_HTTPLOGGING_RETENTION_DAYS  = 3
      WEBSITE_NODE_DEFAULT_VERSION        = "~12"
    }
    application_settings_sensitive_keyvault_lookup = {
      REDIS_KEY                   = "ado--dev--devccm01--courtorders-redis-key"
      LAA_PUBLISH_RESULTS_API_KEY = "ado--dev--devccm01--courtorders-laapublishresultsapikey"
      CJSCPPUID                   = "ado--dev--devccm01--courtorders-cjscppuid"
    }
    application_settings_sensitive_hashicorp_vault_lookup = {}
    functionapp_package                                   = ""
    site_config = {
      use_32_bit_worker_process = true
    }
    service_plan_name    = null
    create_service_plan  = true
    storage_account_name = "sadevccp0101hearingres2"
  }
}

namespace         = "cpp"
costcode          = "0101"
attribute         = ""
owner             = "EI"
environment       = "dev"
application       = "courtorders"
application_group = "hearingres"
type              = "functionapp"