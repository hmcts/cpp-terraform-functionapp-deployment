storage_account_name          = "sadevccp0101notifyattfa2"
storage_account_identity_type = "SystemAssigned"

asp_os_type = "Windows"
asp_sku     = "P1v2"

function_app_application_settings = {
  FUNCTIONS_EXTENSION_VERSION        = "~2"
  ENABLE_ORYX_BUILD                  = false
  SCM_DO_BUILD_DURING_DEPLOYMENT     = false
  FUNCTIONS_WORKER_RUNTIME           = "java"
  WEBSITE_HTTPLOGGING_RETENTION_DAYS = 3
  WEBSITE_RUN_FROM_PACKAGE           = 1
}

function_app_application_settings_sensitive = {
  SMTP_SETTINGS = "secret/dev/devccm01/o365_email_password"
}

site_config = {
  use_32_bit_worker_process = true
}

application_insights_enabled = true

namespace   = "cpp"
costcode    = "0101"
attribute   = ""
owner       = "EI"
environment = "dev"
application = "notifyatt"
type        = "functionapp"
