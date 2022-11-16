storage_accounts = {
  rgdevccp0101scsla2c82 = {
    identity_type             = "SystemAssigned"
    identity_ids              = null
    replication_type          = "LRS"
    account_tier              = "Standard"
    account_kind              = "StorageV2"
    min_tls_version           = "TLS1_2"
    enable_https_traffic_only = true
  }
  sadevccmscslmi2 = {
    identity_type             = "SystemAssigned"
    identity_ids              = null
    replication_type          = "LRS"
    account_tier              = "Standard"
    account_kind              = "StorageV2"
    min_tls_version           = "TLS1_2"
    enable_https_traffic_only = true
  }
  sadevccp0101scslfa2 = {
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
  fa-dev-cpp-scsl = {
    asp_sku                      = "EP1"
    asp_os_type                  = "Linux"
    asp_instance_size            = 1
    asp_per_site_scaling_enabled = false
    asp_zone_balancing_enabled   = false
    create_service_plan          = true
    application_settings = {
      APPINSIGHTS_INSTRUMENTATIONKEY             = "d367847f-900b-4646-9a6c-29e7fb10d1b3"
      APPLICATIONINSIGHTS_CONNECTION_STRING      = "InstrumentationKey=d367847f-900b-4646-9a6c-29e7fb10d1b3;IngestionEndpoint=https://uksouth-0.in.applicationinsights.azure.com/"
      ApplicationInsightsAgent_EXTENSION_VERSION = "~2"
      AzureWebJobs.cppRotaDataMapper.Disabled    = 0
      AzureWebJobs.rotaFileProcessor.Disabled    = 0
      AzureWebJobsDashboard                      = "DefaultEndpointsProtocol=https;AccountName=sadevccp0101scslfa2;AccountKey=aJz+MN+ikOh5qUWfzvST1J4RPXzXcLCxb9o+CWTapRB0XRQzEUbk2AM5jrgFphsisyjf74e+QlVwR6kE53+Xvg==;EndpointSuffix=core.windows.net"
      AzureWebJobsStorage                        = "DefaultEndpointsProtocol=https;AccountName=sadevccp0101scslfa2;AccountKey=aJz+MN+ikOh5qUWfzvST1J4RPXzXcLCxb9o+CWTapRB0XRQzEUbk2AM5jrgFphsisyjf74e+QlVwR6kE53+Xvg==;EndpointSuffix=core.windows.net"
      ENABLE_ORYX_BUILD                          = false
      FUNCTIONS_EXTENSION_VERSION                = "~2"
      FUNCTIONS_WORKER_RUNTIME                   = "java"
      JAVA_OPTS                                  = "-Xms2048m -Xmx2048m"
      mi.data.cleaner.schedule                   = "0 0 7 * * *"
      mi.data.delete.days                        = "7"
      mi.storgage.blob.container                 = "mi-blob-container"
      mi.storage.url                             = "DefaultEndpointsProtocol=https;AccountName=sadevccmscslmi2;AccountKey=w+/Sm0yHH3b3J8LWT0ZfVC0Tgl5HiAUiWvs03fuquFN0hmWOylVhoMfn7cSwjMJIttJVoOdJ6CrUKEoG/QgEJg==;EndpointSuffix=core.windows.net"
      mireportdata.host                          = "http://DEVCCM01ACTAP03.cpp.nonlive:8080"
      referencedata.cjscppuid                    = "c2c9b689-2ce6-43b3-9143-1c0c02235aa1"
      referencedata.host                         = "http://devccm01actap01.cpp.nonlive:8080"
      rota.blob.archive.container                = "schedulelistingoutput"
      rota.blob.container                        = "schedulelistinginput"
      rota.blob.url                              = "DefaultEndpointsProtocol=https;AccountName=sadevccm01;AccountKey=bLtRRN+BvpSeDoDts8i2df5IBys7kbbeA/okjVJeJ2mTXQahNwRLIyZ6AiTgUj+Hor1b/ej3iegcCYCOpvlxJA==;EndpointSuffix=core.windows.net"
      rota.file.path                             = "schedulelistinginput/{name}"
      rotasl.cjscppuid                           = "f9b04933-4257-3de8-885f-6acca3f80c66"
      sasteccmscsl_STORAGE                       = "DefaultEndpointsProtocol=https;AccountName=sadevccm01;AccountKey=bLtRRN+BvpSeDoDts8i2df5IBys7kbbeA/okjVJeJ2mTXQahNwRLIyZ6AiTgUj+Hor1b/ej3iegcCYCOpvlxJA==;EndpointSuffix=core.windows.net"
      SCM_DO_BUILD_DURING_DEPLOYMENT             = false
      scsl.db.url                                = "jdbc:postgresql://psf-dev-ccm01-rotasl.postgres.database.azure.com:5432/?sslmode=require"
      scsl.db.username                           = "scsl"
      snlt.hmi.apim.baseUrl                      = "https://spnl-dev-apim-int-gw.cpp.nonlive/fa-dev-ccm-snlt"
      unprocessed.data.cleaner.days              = ""
      unprocessed.data.cleaner.schedule          = "0 0 7 * * *"
      WEBSITE_HTTPLOGGING_RETENTION_DAYS         = 3
      WEBSITE_LOAD_CERTIFICATES                  = "B23DB2981A448FA74A11D6D1EE830A1C5378E044"
      WEBSITE_RUN_FROM_PACKAGE                   = 1
    }
    application_settings_sensitive_keyvault_lookup = {}
    application_settings_sensitive_hashicorp_vault_lookup = {
      scsl.db.password               = "secret/dev/devccm01/"
      snlt.hmi.apim.subscription.key = "secret/dev/devccm01/snlt_sub_key"
    }
    functionapp_package = "https://libraries-internal.mdv.cpp.nonlive/artifactory/list/repocentral/uk/gov/moj/cpp/azure/legalaidagency/courtorders-azure-functions/7.0.145/courtorders-azure-functions-7.0.145.zip"
    site_config = {
      use_32_bit_worker_process = true
    }
    application          = "courtorders"
    service_plan_name    = "sp-dev-cpp-scsl"
    create_service_plan  = true
    storage_account_name = "sadevccp0101scslfa2"
  },
  fa-dev-cpp-scsl-enabler = {
    asp_sku                      = "EP1"
    asp_os_type                  = "Linux"
    asp_instance_size            = 1
    asp_per_site_scaling_enabled = false
    asp_zone_balancing_enabled   = false
    create_service_plan          = true
    application_settings = {
      AppClientId                             = "fd78b297-45c6-47c4-aa08-701cda5099aa"
      AppClientSecret                         = "eDD7Q~~a8r1rvdIm7~ZHDiN1d7PV2SGTCKAtI"
      APPINSIGHTS_INSTRUMENTATIONKEY          = "3d0fd519-ae97-4994-abe2-9ed000f500c6"
      APPLICATIONINSIGHTS_CONNECTION_STRING   = "InstrumentationKey=3d0fd519-ae97-4994-abe2-9ed000f500c6;IngestionEndpoint=https://uksouth-1.in.applicationinsights.azure.com/;LiveEndpoint=https://uksouth.livediagnostics.monitor.azure.com/"
      AppTenantId                             = "e2995d11-9947-4e78-9de6-d44e0603518e"
      AzureWebJobsStorage                     = "DefaultEndpointsProtocol=https;AccountName=sadevccp0101scslfa2;AccountKey=aJz+MN+ikOh5qUWfzvST1J4RPXzXcLCxb9o+CWTapRB0XRQzEUbk2AM5jrgFphsisyjf74e+QlVwR6kE53+Xvg==;EndpointSuffix=core.windows.net"
      ENABLE_ORYX_BUILD                       = false
      FUNCTIONS_EXTENSION_VERSION             = "~4"
      FUNCTIONS_WORKER_RUNTIME                = "powershell"
      RotaFileProcessDisablerCronExp          = "0 0 6 1/1 * *"
      RotaFileProcessEnablerCronExp           = "0 0 19 1/1 * *"
      RotaFileProcessorFunctionName           = "fa-dev-ccm-scsl"
      RotaFileProcessorFunctionResourceGroup  = "RG-DEV-CCM-SCSL"
      RotaFileProcessorFunctionSubscriptionId = "e6b5053b-4c38-4475-a835-a025aeb3d8c7"
    }
    application_settings_sensitive_keyvault_lookup        = {}
    application_settings_sensitive_hashicorp_vault_lookup = {}
    functionapp_package                                   = "https://libraries-internal.mdv.cpp.nonlive/artifactory/list/repocentral/uk/gov/moj/cpp/azure/legalaidagency/courtregister-azure-functions/7.0.145/courtregister-azure-functions-7.0.145.zip"
    site_config = {
      use_32_bit_worker_process = true
    }
    application          = "courtreg"
    service_plan_name    = "sp-dev-cpp-scsl-enabler"
    create_service_plan  = true
    storage_account_name = "sadevccp0101scslfa2"
  }
}

namespace         = "cpp"
costcode          = "0101"
attribute         = ""
owner             = "EI"
environment       = "dev"
application       = "scsl"
application_group = "scsl"
type              = "functionapp"
