
locals {
  function_app_application_settings_sensitive = { for k, v in data.vault_kv_secret.secret_data : k => v.data.value }
}
