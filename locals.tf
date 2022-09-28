
locals {
  function_app_application_settings_sensitive = { for k, v in data.azurerm_key_vault_secret.main : k => v.value }
}
