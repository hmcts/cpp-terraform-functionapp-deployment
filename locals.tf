
locals {

  default_application_settings = {
    APPLICATION_INSIGHTS_IKEY             = azurerm_application_insights.app_insights.0.instrumentation_key
    APPINSIGHTS_INSTRUMENTATIONKEY        = azurerm_application_insights.app_insights.0.instrumentation_key
    APPLICATIONINSIGHTS_CONNECTION_STRING = azurerm_application_insights.app_insights.0.connection_string
  }

  default_site_config = {
    application_insights_connection_string = azurerm_application_insights.app_insights.0.connection_string
    application_insights_key               = azurerm_application_insights.app_insights.0.instrumentation_key
  }

  sa_name_accesskey_map = {
    for sa in azurerm_storage_account.main :
    sa.name => sa.primary_access_key
  }

  sa_name_connection_strings_map = {
    for sa in azurerm_storage_account.main :
    sa.name => sa.primary_connection_string
  }

  subscriptions = flatten([
    for topic in keys(var.eventgrid_topics) : [
      for subscription in var.eventgrid_topics[topic] : {
        topic_name        = topic
        subscription_name = subscription.subscription_name
        functionapp_name  = subscription.functionapp_name
        function_name     = subscription.function_name
        event_types       = subscription.event_types
      }
    ]
  ])

  subscriptions_map = {
    for s in local.subscriptions : "${s.topic_name}:${s.subscription_name}" => s
  }

  system_subscriptions = flatten([
    for topic in keys(var.eventgrid_system_topics) : [
      for subscription in var.eventgrid_system_topics[topic].subscriptions : {
        topic_name        = topic
        subscription_name = subscription.subscription_name
        functionapp_name  = subscription.functionapp_name
        function_name     = subscription.function_name
      }
    ]
  ])

  system_subscriptions_map = {
    for s in local.system_subscriptions : "${s.topic_name}:${s.subscription_name}" => s
  }
}
