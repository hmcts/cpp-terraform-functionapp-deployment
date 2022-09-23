
data "vault_kv_secret" "secret_data" {
  for_each = var.function_app_application_settings_sensitive
  path     = each.value
}
