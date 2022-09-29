data "azurerm_key_vault" "main" {
  name                = "KV-MDV-TFE-01"
  resource_group_name = "RG-MDV-TFE-01"
}

data "azurerm_key_vault_secret" "main" {
  for_each     = var.function_app_application_settings_sensitive
  name         = each.value
  key_vault_id = data.azurerm_key_vault.main.id
}
