storage_account_name          = "sadevccplargefilestest"
storage_account_identity_type = "SystemAssigned"

asp_os_type = "Windows"
asp_sku     = "S1"

functionapp_package = "https://libraries-internal.mdv.cpp.nonlive/artifactory/list/repocentral/uk/gov/moj/cpp/material/material-azure-functions/8.0.4/material-azure-functions-8.0.4.zip"
function_app_application_settings = {
  FUNCTIONS_EXTENSION_VERSION                  = "~4"
  ENABLE_ORYX_BUILD                            = false
  SCM_DO_BUILD_DURING_DEPLOYMENT               = false
  FUNCTIONS_WORKER_RUNTIME                     = "java"
  WEBSITE_HTTPLOGGING_RETENTION_DAYS           = 3
  "material.alfrescoAzureStorageContainerName" = "largefiles-blob-container"
  "material.largefileExpiryInMinutes"          = 30
}

site_config = {
  use_32_bit_worker_process = true
}

application_insights_enabled = true

namespace         = "cpp"
costcode          = "0101"
attribute         = ""
owner             = "EI"
environment       = "dev"
application       = "LargeFileDownloadCleanup"
application_group = "largefiles"
type              = "functionapp"
