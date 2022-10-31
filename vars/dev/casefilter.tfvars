storage_account_name          = "sadevccp0101casefilfa2"
storage_account_identity_type = "SystemAssigned"

asp_os_type = "Windows"
asp_sku     = "P1v2"

functionapp_package = "https://libraries-internal.mdv.cpp.nonlive/artifactory/list/repocentral/uk/gov/moj/cpp/staging/prosecutors/spi/stagingprosecutors-azure-functions/8.0.3/stagingprosecutors-azure-functions-8.0.3.zip"
function_app_application_settings = {
  FUNCTIONS_EXTENSION_VERSION        = "~2"
  ENABLE_ORYX_BUILD                  = false
  SCM_DO_BUILD_DURING_DEPLOYMENT     = false
  FUNCTIONS_WORKER_RUNTIME           = "java"
  WEBSITE_HTTPLOGGING_RETENTION_DAYS = 3
}

function_app_application_settings_sensitive = {
  SMTP_SETTINGS = "ado--dev--devccm01--o365-email-password"
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
application       = "prosecutors"
application_group = "staging"
type              = "functionapp"

eventgrid_topic_enabled              = true
eventgrid_system_topic_enabled       = true
eventgrid_system_topic_type          = "Microsoft.Storage.StorageAccounts"
eventgrid_topic_subscriptions        = {}
eventgrid_system_topic_subscriptions = {}
