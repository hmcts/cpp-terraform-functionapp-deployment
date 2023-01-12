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
    function_app_version         = 3
    application_settings = {
      ENABLE_ORYX_BUILD                       = false
      SCM_DO_BUILD_DURING_DEPLOYMENT          = false
      COURTORDER_CONTEXT_API_BASE_URI         = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      ENFORCEMENT_CONTEXT_API_BASE_URI        = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      FUNCTIONS_WORKER_RUNTIME                = "node"
      NODE_EXTRA_CA_CERTS                     = "/home/site/wwwroot/internal_ca_certs.pem"
      PROGRESSION_CONTEXT_API_BASE_URI        = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      REDIS_HOST                              = "RC-DEV-CCP01.redis.cache.windows.net"
      REDIS_PORT                              = 6380
      REFERENCE_DATA_CONTEXT_API_BASE_URI     = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      RESULTS_CONTEXT_API_BASE_URI            = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      SJP_CONTEXT_API_BASE_URI                = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      STAGINGDVLA_CONTEXT_API_BASE_URI        = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      UNIFIED_SEARCH_CONTEXT                  = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      WEBSITE_HTTPLOGGING_RETENTION_DAYS      = 3
      WEBSITE_NODE_DEFAULT_VERSION            = "~14"
      FUNCTIONS_WORKER_PROCESS_COUNT          = 1
      SnapshotDebugger_EXTENSION_VERSION      = "disabled"
      DiagnosticServices_EXTENSION_VERSION    = "disabled"
      InstrumentationEngine_EXTENSION_VERSION = "disabled"
    }
    application_settings_sensitive_keyvault_lookup = {}
    application_settings_sensitive_hashicorp_vault_lookup = {
      REDIS_KEY                   = "secret/dev/devccm01/hearingres-rediskey"
      LAA_PUBLISH_RESULTS_API_KEY = "secret/dev/devccm01/hearingres-laapublishapikey"
      CJSCPPUID                   = "secret/dev/devccm01/hearingres-cjscppuid"
    }
    functionapp_package = "https://libraries-internal.mdv.cpp.nonlive/artifactory/list/repocentral/uk/gov/moj/cpp/azure/legalaidagency/courtorders-azure-functions/7.0.145/courtorders-azure-functions-7.0.145.zip"
    site_config = {
      use_32_bit_worker_process = true
    }
    application          = "courtorders"
    create_service_plan  = true
    service_plan_name    = null
    storage_account_name = "sadevccp0101hearingres2"
    vnet_name            = "VN-DEV-INT-01"
    vnet_rg_name         = "RG-DEV-CORE-01"
    create_subnet        = true
    # As this Subnet will be handling 7 FAs will be creating /25 on .121 instead of .123
    subnet_cidr = ["10.89.121.0/25"]
    # subnet_cidr and subnet_name is mutually exclusive
    # To reuse an existing subnet define subnet_name
    # Example: SN-fa-dev-cpp-courtorders
    subnet_name = ""
  },
  fa-dev-cpp-courtreg = {
    asp_sku                      = "EP1"
    asp_os_type                  = "Linux"
    asp_instance_size            = 1
    asp_per_site_scaling_enabled = false
    asp_zone_balancing_enabled   = false
    function_app_version         = 3
    application_settings = {
      ENABLE_ORYX_BUILD                       = false
      SCM_DO_BUILD_DURING_DEPLOYMENT          = false
      COURTORDER_CONTEXT_API_BASE_URI         = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      ENFORCEMENT_CONTEXT_API_BASE_URI        = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      FUNCTIONS_WORKER_RUNTIME                = "node"
      NODE_EXTRA_CA_CERTS                     = "/home/site/wwwroot/internal_ca_certs.pem"
      PROGRESSION_CONTEXT_API_BASE_URI        = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      REDIS_HOST                              = "RC-DEV-CCP01.redis.cache.windows.net"
      REDIS_PORT                              = 6380
      REFERENCE_DATA_CONTEXT_API_BASE_URI     = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      RESULTS_CONTEXT_API_BASE_URI            = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      SJP_CONTEXT_API_BASE_URI                = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      STAGINGDVLA_CONTEXT_API_BASE_URI        = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      UNIFIED_SEARCH_CONTEXT                  = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      WEBSITE_HTTPLOGGING_RETENTION_DAYS      = 3
      WEBSITE_NODE_DEFAULT_VERSION            = "~14"
      FUNCTIONS_WORKER_PROCESS_COUNT          = 1
      SnapshotDebugger_EXTENSION_VERSION      = "disabled"
      DiagnosticServices_EXTENSION_VERSION    = "disabled"
      InstrumentationEngine_EXTENSION_VERSION = "disabled"
    }
    application_settings_sensitive_keyvault_lookup = {}
    application_settings_sensitive_hashicorp_vault_lookup = {
      REDIS_KEY                   = "secret/dev/devccm01/hearingres-rediskey"
      LAA_PUBLISH_RESULTS_API_KEY = "secret/dev/devccm01/hearingres-laapublishapikey"
      CJSCPPUID                   = "secret/dev/devccm01/hearingres-cjscppuid"
    }
    functionapp_package = "https://libraries-internal.mdv.cpp.nonlive/artifactory/list/repocentral/uk/gov/moj/cpp/azure/legalaidagency/courtregister-azure-functions/7.0.145/courtregister-azure-functions-7.0.145.zip"
    site_config = {
      use_32_bit_worker_process = true
    }
    application          = "courtreg"
    create_service_plan  = false
    service_plan_name    = "as-dev-cpp-courtorders"
    storage_account_name = "sadevccp0101hearingres2"
    vnet_name            = "VN-DEV-INT-01"
    vnet_rg_name         = "RG-DEV-CORE-01"
    create_subnet        = false
    subnet_cidr          = []
    # To reuse an existing subnet define subnet_name
    subnet_name = "SN-fa-dev-cpp-courtorders"
  },
  fa-dev-cpp-hmpps = {
    asp_sku                      = "EP1"
    asp_os_type                  = "Linux"
    asp_instance_size            = 1
    asp_per_site_scaling_enabled = false
    asp_zone_balancing_enabled   = false
    function_app_version         = 3
    application_settings = {
      ENABLE_ORYX_BUILD                       = false
      SCM_DO_BUILD_DURING_DEPLOYMENT          = false
      HMPPS_PUBLISH_URL                       = "https://spnl-dev-apim-int-gw.cpp.nonlive/probation/api/v1/hearing/results"
      COURTORDER_CONTEXT_API_BASE_URI         = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      ENFORCEMENT_CONTEXT_API_BASE_URI        = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      FUNCTIONS_WORKER_RUNTIME                = "node"
      NODE_EXTRA_CA_CERTS                     = "/home/site/wwwroot/internal_ca_certs.pem"
      PROGRESSION_CONTEXT_API_BASE_URI        = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      REDIS_HOST                              = "RC-DEV-CCP01.redis.cache.windows.net"
      REDIS_PORT                              = 6380
      REFERENCE_DATA_CONTEXT_API_BASE_URI     = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      RESULTS_CONTEXT_API_BASE_URI            = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      SJP_CONTEXT_API_BASE_URI                = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      STAGINGDVLA_CONTEXT_API_BASE_URI        = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      UNIFIED_SEARCH_CONTEXT                  = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      WEBSITE_HTTPLOGGING_RETENTION_DAYS      = 3
      WEBSITE_NODE_DEFAULT_VERSION            = "~14"
      FUNCTIONS_WORKER_PROCESS_COUNT          = 1
      SnapshotDebugger_EXTENSION_VERSION      = "disabled"
      DiagnosticServices_EXTENSION_VERSION    = "disabled"
      InstrumentationEngine_EXTENSION_VERSION = "disabled"
    }
    application_settings_sensitive_keyvault_lookup = {}
    application_settings_sensitive_hashicorp_vault_lookup = {
      REDIS_KEY                   = "secret/dev/devccm01/hearingres-rediskey"
      LAA_PUBLISH_RESULTS_API_KEY = "secret/dev/devccm01/hearingres-laapublishapikey"
      CJSCPPUID                   = "secret/dev/devccm01/hearingres-cjscppuid"
    }
    functionapp_package = "https://libraries-internal.mdv.cpp.nonlive/artifactory/list/repocentral/uk/gov/moj/cpp/azure/legalaidagency/probation-azure-functions/7.0.149-SNAPSHOT/probation-azure-functions-7.0.149-SNAPSHOT.zip"
    site_config = {
      use_32_bit_worker_process = true
    }
    application          = "hmpps"
    create_service_plan  = false
    service_plan_name    = "as-dev-cpp-courtorders"
    storage_account_name = "sadevccp0101hearingres2"
    vnet_name            = "VN-DEV-INT-01"
    vnet_rg_name         = "RG-DEV-CORE-01"
    create_subnet        = false
    subnet_cidr          = []
    # To reuse an existing subnet define subnet_name
    subnet_name = "SN-fa-dev-cpp-courtorders"

  },
  fa-dev-cpp-informantreg = {
    asp_sku                      = "EP1"
    asp_os_type                  = "Linux"
    asp_instance_size            = 1
    asp_per_site_scaling_enabled = false
    asp_zone_balancing_enabled   = false
    function_app_version         = 3
    application_settings = {
      ENABLE_ORYX_BUILD                       = false
      SCM_DO_BUILD_DURING_DEPLOYMENT          = false
      COURTORDER_CONTEXT_API_BASE_URI         = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      ENFORCEMENT_CONTEXT_API_BASE_URI        = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      FUNCTIONS_WORKER_RUNTIME                = "node"
      NODE_EXTRA_CA_CERTS                     = "/home/site/wwwroot/internal_ca_certs.pem"
      PROGRESSION_CONTEXT_API_BASE_URI        = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      REDIS_HOST                              = "RC-DEV-CCP01.redis.cache.windows.net"
      REDIS_PORT                              = 6380
      REFERENCE_DATA_CONTEXT_API_BASE_URI     = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      RESULTS_CONTEXT_API_BASE_URI            = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      SJP_CONTEXT_API_BASE_URI                = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      STAGINGDVLA_CONTEXT_API_BASE_URI        = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      UNIFIED_SEARCH_CONTEXT                  = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      WEBSITE_HTTPLOGGING_RETENTION_DAYS      = 3
      WEBSITE_NODE_DEFAULT_VERSION            = "~14"
      FUNCTIONS_WORKER_PROCESS_COUNT          = 1
      SnapshotDebugger_EXTENSION_VERSION      = "disabled"
      DiagnosticServices_EXTENSION_VERSION    = "disabled"
      InstrumentationEngine_EXTENSION_VERSION = "disabled"
    }
    application_settings_sensitive_keyvault_lookup = {}
    application_settings_sensitive_hashicorp_vault_lookup = {
      REDIS_KEY                   = "secret/dev/devccm01/hearingres-rediskey"
      LAA_PUBLISH_RESULTS_API_KEY = "secret/dev/devccm01/hearingres-laapublishapikey"
      CJSCPPUID                   = "secret/dev/devccm01/hearingres-cjscppuid"
    }
    functionapp_package = "https://libraries-internal.mdv.cpp.nonlive/artifactory/list/repocentral/uk/gov/moj/cpp/azure/legalaidagency/informantregister-azure-functions/7.0.145/informantregister-azure-functions-7.0.145.zip"
    site_config = {
      use_32_bit_worker_process = true
    }
    application          = "informantreg"
    create_service_plan  = false
    service_plan_name    = "as-dev-cpp-courtorders"
    storage_account_name = "sadevccp0101hearingres2"
    vnet_name            = "VN-DEV-INT-01"
    vnet_rg_name         = "RG-DEV-CORE-01"
    create_subnet        = false
    subnet_cidr          = []
    # To reuse an existing subnet define subnet_name
    subnet_name = "SN-fa-dev-cpp-courtorders"
  },
  fa-dev-cpp-nowsce = {
    asp_sku                      = "EP1"
    asp_os_type                  = "Linux"
    asp_instance_size            = 1
    asp_per_site_scaling_enabled = false
    asp_zone_balancing_enabled   = false
    function_app_version         = 3
    application_settings = {
      ENABLE_ORYX_BUILD                       = false
      SCM_DO_BUILD_DURING_DEPLOYMENT          = false
      COURTORDER_CONTEXT_API_BASE_URI         = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      ENFORCEMENT_CONTEXT_API_BASE_URI        = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      FUNCTIONS_WORKER_RUNTIME                = "node"
      NODE_EXTRA_CA_CERTS                     = "/home/site/wwwroot/internal_ca_certs.pem"
      PROGRESSION_CONTEXT_API_BASE_URI        = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      REDIS_HOST                              = "RC-DEV-CCP01.redis.cache.windows.net"
      REDIS_PORT                              = 6380
      REFERENCE_DATA_CONTEXT_API_BASE_URI     = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      RESULTS_CONTEXT_API_BASE_URI            = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      SJP_CONTEXT_API_BASE_URI                = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      STAGINGDVLA_CONTEXT_API_BASE_URI        = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      UNIFIED_SEARCH_CONTEXT                  = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      WEBSITE_HTTPLOGGING_RETENTION_DAYS      = 3
      WEBSITE_NODE_DEFAULT_VERSION            = "~14"
      FUNCTIONS_WORKER_PROCESS_COUNT          = 1
      SnapshotDebugger_EXTENSION_VERSION      = "disabled"
      DiagnosticServices_EXTENSION_VERSION    = "disabled"
      InstrumentationEngine_EXTENSION_VERSION = "disabled"
    }
    application_settings_sensitive_keyvault_lookup = {}
    application_settings_sensitive_hashicorp_vault_lookup = {
      REDIS_KEY                   = "secret/dev/devccm01/hearingres-rediskey"
      LAA_PUBLISH_RESULTS_API_KEY = "secret/dev/devccm01/hearingres-laapublishapikey"
      CJSCPPUID                   = "secret/dev/devccm01/hearingres-cjscppuid"
    }
    functionapp_package = "https://libraries-internal.mdv.cpp.nonlive/artifactory/list/repocentral/uk/gov/moj/cpp/azure/legalaidagency/nows-azure-functions/7.0.161/nows-azure-functions-7.0.161.zip"
    site_config = {
      use_32_bit_worker_process = true
    }
    application          = "nowsce"
    create_service_plan  = false
    service_plan_name    = "as-dev-cpp-courtorders"
    storage_account_name = "sadevccp0101hearingres2"
    vnet_name            = "VN-DEV-INT-01"
    vnet_rg_name         = "RG-DEV-CORE-01"
    create_subnet        = false
    subnet_cidr          = []
    # To reuse an existing subnet define subnet_name
    subnet_name = "SN-fa-dev-cpp-courtorders"
  },
  fa-dev-cpp-prisoncourtreg = {
    asp_sku                      = "EP1"
    asp_os_type                  = "Linux"
    asp_instance_size            = 1
    asp_per_site_scaling_enabled = false
    asp_zone_balancing_enabled   = false
    function_app_version         = 3
    application_settings = {
      ENABLE_ORYX_BUILD                       = false
      SCM_DO_BUILD_DURING_DEPLOYMENT          = false
      COURTORDER_CONTEXT_API_BASE_URI         = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      ENFORCEMENT_CONTEXT_API_BASE_URI        = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      FUNCTIONS_WORKER_RUNTIME                = "node"
      NODE_EXTRA_CA_CERTS                     = "/home/site/wwwroot/internal_ca_certs.pem"
      PROGRESSION_CONTEXT_API_BASE_URI        = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      REDIS_HOST                              = "RC-DEV-CCP01.redis.cache.windows.net"
      REDIS_PORT                              = 6380
      REFERENCE_DATA_CONTEXT_API_BASE_URI     = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      RESULTS_CONTEXT_API_BASE_URI            = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      SJP_CONTEXT_API_BASE_URI                = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      STAGINGDVLA_CONTEXT_API_BASE_URI        = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      UNIFIED_SEARCH_CONTEXT                  = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      WEBSITE_HTTPLOGGING_RETENTION_DAYS      = 3
      WEBSITE_NODE_DEFAULT_VERSION            = "~14"
      FUNCTIONS_WORKER_PROCESS_COUNT          = 1
      SnapshotDebugger_EXTENSION_VERSION      = "disabled"
      DiagnosticServices_EXTENSION_VERSION    = "disabled"
      InstrumentationEngine_EXTENSION_VERSION = "disabled"
    }
    application_settings_sensitive_keyvault_lookup = {}
    application_settings_sensitive_hashicorp_vault_lookup = {
      REDIS_KEY                   = "secret/dev/devccm01/hearingres-rediskey"
      LAA_PUBLISH_RESULTS_API_KEY = "secret/dev/devccm01/hearingres-laapublishapikey"
      CJSCPPUID                   = "secret/dev/devccm01/hearingres-cjscppuid"
    }
    functionapp_package = "https://libraries-internal.mdv.cpp.nonlive/artifactory/list/repocentral/uk/gov/moj/cpp/azure/legalaidagency/prisoncourtregister-azure-functions/7.0.153/prisoncourtregister-azure-functions-7.0.153.zip"
    site_config = {
      use_32_bit_worker_process = true
    }
    application          = "prisoncourtreg"
    create_service_plan  = false
    service_plan_name    = "as-dev-cpp-courtorders"
    storage_account_name = "sadevccp0101hearingres2"
    vnet_name            = "VN-DEV-INT-01"
    vnet_rg_name         = "RG-DEV-CORE-01"
    create_subnet        = false
    subnet_cidr          = []
    # To reuse an existing subnet define subnet_name
    subnet_name = "SN-fa-dev-cpp-courtorders"
  },
  fa-dev-cpp-legalaid = {
    asp_sku                      = "EP1"
    asp_os_type                  = "Linux"
    asp_instance_size            = 1
    asp_per_site_scaling_enabled = false
    asp_zone_balancing_enabled   = false
    function_app_version         = 3
    application_settings = {
      ENABLE_ORYX_BUILD                         = false
      SCM_DO_BUILD_DURING_DEPLOYMENT            = false
      FUNCTIONS_WORKER_RUNTIME                  = "node"
      COURTORDER_CONTEXT_API_BASE_URI           = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      ENFORCEMENT_CONTEXT_API_BASE_URI          = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      NODE_EXTRA_CA_CERTS                       = "/home/site/wwwroot/internal_ca_certs.pem"
      PROGRESSION_CONTEXT_API_BASE_URI          = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      REDIS_HOST                                = "RC-DEV-CCP01.redis.cache.windows.net"
      REDIS_PORT                                = 6380
      REFERENCE_DATA_CONTEXT_API_BASE_URI       = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      RESULTS_CONTEXT_API_BASE_URI              = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      SJP_CONTEXT_API_BASE_URI                  = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      STAGINGDVLA_CONTEXT_API_BASE_URI          = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      UNIFIED_SEARCH_CONTEXT                    = "http://DEVCCM06ACTAP01.cpp.nonlive:8080"
      WEBSITE_HTTPLOGGING_RETENTION_DAYS        = 3
      WEBSITE_NODE_DEFAULT_VERSION              = "~14"
      FUNCTIONS_WORKER_PROCESS_COUNT            = 1
      SnapshotDebugger_EXTENSION_VERSION        = "disabled"
      DiagnosticServices_EXTENSION_VERSION      = "disabled"
      InstrumentationEngine_EXTENSION_VERSION   = "disabled"
      APPLICATION_RESULTED_CPS_NOTIFICATION_URL = "https://spnl-dev-apim-int-gw.cpp.nonlive/notification-cms/v1/notification/application-result-notification"
    }
    application_settings_sensitive_keyvault_lookup = {}
    application_settings_sensitive_hashicorp_vault_lookup = {
      REDIS_KEY                   = "secret/dev/devccm01/hearingres-rediskey"
      LAA_PUBLISH_RESULTS_API_KEY = "secret/dev/devccm01/hearingres-laapublishapikey"
      CJSCPPUID                   = "secret/dev/devccm01/hearingres-cjscppuid"
      OCP_APIM_SUBSCRIPTION_KEY   = "secret/dev/devccm01/hearingres-ocpapimsubkey"
    }
    functionapp_package = "https://libraries-internal.mdv.cpp.nonlive/artifactory/list/repocentral/uk/gov/moj/cpp/azure/legalaidagency/legalaidagency-azure-functions/7.0.111/legalaidagency-azure-functions-7.0.111.zip"
    site_config = {
      use_32_bit_worker_process = true
    }
    application          = "legalaid"
    create_service_plan  = false
    service_plan_name    = "as-dev-cpp-courtorders"
    storage_account_name = "sadevccp0101hearingres2"
    vnet_name            = "VN-DEV-INT-01"
    vnet_rg_name         = "RG-DEV-CORE-01"
    create_subnet        = false
    subnet_cidr          = []
    # To reuse an existing subnet define subnet_name
    subnet_name = "SN-fa-dev-cpp-courtorders"
  }
}

eventgrid_topics = {
  eg-dev-ccp-hearingres = [
    {
      subscription_name = "EGS-DEV-CCP-HEARINGRES-COURTORDERS"
      functionapp_name  = "fa-dev-cpp-courtorders"
      function_name     = "CourtOrderEventGridTrigger"
      event_types       = ["Hearing_Resulted"]
    },
    {
      subscription_name = "EGS-DEV-CCP-HEARINGRES-COURTREG"
      functionapp_name  = "fa-dev-cpp-courtreg"
      function_name     = "CourtRegisterEventGridTrigger"
      event_types       = ["Hearing_Resulted"]
    },
    {
      subscription_name = "EGS-DEV-CCP-HEARINGRES-HMPPS"
      functionapp_name  = "fa-dev-cpp-hmpps"
      function_name     = "HearingResultedProbationEventGridTrigger"
      event_types       = ["Hearing_Resulted"]
    },
    {
      subscription_name = "EGS-DEV-CCP-HEARINGRES-INFORMANT"
      functionapp_name  = "fa-dev-cpp-informantreg"
      function_name     = "InformantRegisterEventGridTrigger"
      event_types       = ["Hearing_Resulted"]
    },
    {
      subscription_name = "EGS-DEV-CCP-HEARINGRES-LEGALAID"
      functionapp_name  = "fa-dev-cpp-legalaid"
      function_name     = "LAAHearingResultedEventGridTrigger"
      event_types       = ["Hearing_Resulted"]
    },
    {
      subscription_name = "EGS-DEV-CCP-HEARINGRES-PRISONCOURT"
      functionapp_name  = "fa-dev-cpp-prisoncourtreg"
      function_name     = "PrisonCourtRegisterEventGridTrigger"
      event_types       = ["Hearing_Resulted"]
    },
    {
      subscription_name = "EGS-DEV-CCP-HEARINGRES-NOWSCE"
      functionapp_name  = "fa-dev-cpp-nowsce"
      function_name     = "HearingResultedNowsEventGridTrigger"
      event_types       = ["Hearing_Resulted"]
    },
    {
      subscription_name = "EGS-DEV-CCP-HEARINGRES-RESULTED"
      functionapp_name  = "fa-dev-cpp-nowsce"
      function_name     = "HearingResultedSJPEventGridTrigger"
      event_types       = ["SJP_Hearing_Resulted"]
    }
  ]
}

namespace         = "cpp"
costcode          = "0101"
attribute         = ""
owner             = "EI"
environment       = "dev"
application       = "hearingres"
application_group = "hearingres"
type              = "functionapp"
