# cpp-azure-functionapp-deployment

For subnet please see [this](https://www.davidc.net/sites/default/subnets/subnets.html?network=10.89.128.0&mask=24&division=31.f4627231). We use **10.89.128.0/24** and split it to **/28**

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.2.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.19.1 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | =2.21.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.19.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_functionapp"></a> [functionapp](#module\_functionapp) | ../cpp-module-terraform-azurerm-functionapp | n/a |
| <a name="module_tag_set"></a> [tag\_set](#module\_tag\_set) | git::https://github.com/hmcts/cpp-module-terraform-azurerm-tag-generator.git | main |

## Resources

| Name | Type |
|------|------|
| [azurerm_application_insights.app_insights](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_insights) | resource |
| [azurerm_eventgrid_event_subscription.function_app_eventgrid_topic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventgrid_event_subscription) | resource |
| [azurerm_eventgrid_system_topic.function_app_eventgrid_system_topic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventgrid_system_topic) | resource |
| [azurerm_eventgrid_system_topic_event_subscription.function_app_eventgrid_system_topic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventgrid_system_topic_event_subscription) | resource |
| [azurerm_eventgrid_topic.function_app_eventgrid_topic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventgrid_topic) | resource |
| [azurerm_key_vault.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |
| [azurerm_key_vault_secret.sa_connection_strings](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_portal_dashboard.function_app_shared_dashboard](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/portal_dashboard) | resource |
| [azurerm_resource_group.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_resource_group_template_deployment.logic_app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group_template_deployment) | resource |
| [azurerm_resource_group_template_deployment.smtp_api_connection](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group_template_deployment) | resource |
| [azurerm_resource_group_template_deployment.ssh_api_connection](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group_template_deployment) | resource |
| [azurerm_storage_account.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application"></a> [application](#input\_application) | Application to which the s3 bucket relates | `string` | `""` | no |
| <a name="input_application_group"></a> [application\_group](#input\_application\_group) | Group which function app belongs to | `string` | `""` | no |
| <a name="input_application_insights"></a> [application\_insights](#input\_application\_insights) | n/a | <pre>object({<br>    log_analytics_workspace_id = string<br>    application_type           = string<br>    retention_in_days          = number<br>  })</pre> | <pre>{<br>  "application_type": "web",<br>  "log_analytics_workspace_id": null,<br>  "retention_in_days": 90<br>}</pre> | no |
| <a name="input_attribute"></a> [attribute](#input\_attribute) | An attribute of the s3 bucket that makes it unique | `string` | `""` | no |
| <a name="input_costcode"></a> [costcode](#input\_costcode) | Name of theDWP PRJ number (obtained from the project portfolio in TechNow) | `string` | `""` | no |
| <a name="input_create_subnet"></a> [create\_subnet](#input\_create\_subnet) | Should Create Subnet | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment into which resource is deployed | `string` | `""` | no |
| <a name="input_eventgrid_system_topics"></a> [eventgrid\_system\_topics](#input\_eventgrid\_system\_topics) | n/a | <pre>map(object({<br>    storage_account_name = string<br>    subscriptions = list(object({<br>      subscription_name = string<br>      functionapp_name  = string<br>      function_name     = string<br>    }))<br>  }))</pre> | `{}` | no |
| <a name="input_eventgrid_topics"></a> [eventgrid\_topics](#input\_eventgrid\_topics) | n/a | <pre>map(list(object({<br>    subscription_name = string<br>    functionapp_name  = string<br>    function_name     = string<br>    event_types       = list(string)<br>  })))</pre> | `{}` | no |
| <a name="input_functionapps"></a> [functionapps](#input\_functionapps) | n/a | <pre>map(object({<br>    asp_sku                                               = string<br>    asp_os_type                                           = string<br>    asp_instance_size                                     = number<br>    asp_per_site_scaling_enabled                          = bool<br>    asp_zone_balancing_enabled                            = bool<br>    create_service_plan                                   = bool<br>    application_settings                                  = map(string)<br>    application_settings_sensitive_keyvault_lookup        = map(string)<br>    application_settings_sensitive_hashicorp_vault_lookup = map(string)<br>    functionapp_package                                   = string<br>    function_app_version                                  = number<br>    site_config                                           = map(string)<br>    application                                           = string<br>    service_plan_name                                     = string<br>    create_service_plan                                   = bool<br>    storage_account_name                                  = string<br>  }))</pre> | n/a | yes |
| <a name="input_key_vault"></a> [key\_vault](#input\_key\_vault) | n/a | <pre>object({<br>    soft_delete_retention_days = number<br>    purge_protection_enabled   = bool<br>    sku_name                   = string<br>  })</pre> | <pre>{<br>  "purge_protection_enabled": false,<br>  "sku_name": "standard",<br>  "soft_delete_retention_days": 7<br>}</pre> | no |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `"uksouth"` | no |
| <a name="input_logicapps"></a> [logicapps](#input\_logicapps) | n/a | `map(map(string))` | `{}` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace, which could be an organization name or abbreviation, e.g. 'eg' or 'cp' | `string` | `""` | no |
| <a name="input_owner"></a> [owner](#input\_owner) | Name of the project or sqaud within the PDU which manages the resource. May be a persons name or email also | `string` | `""` | no |
| <a name="input_revision"></a> [revision](#input\_revision) | Revision of Functional App | `string` | `""` | no |
| <a name="input_shared_dashboard"></a> [shared\_dashboard](#input\_shared\_dashboard) | n/a | <pre>object({<br>    create         = bool<br>    dashboard_json = string<br>  })</pre> | <pre>{<br>  "create": false,<br>  "dashboard_json": "{}"<br>}</pre> | no |
| <a name="input_smtp_api_connection"></a> [smtp\_api\_connection](#input\_smtp\_api\_connection) | n/a | <pre>object({<br>    create = bool<br>    name   = string<br>  })</pre> | <pre>{<br>  "create": false,<br>  "name": "office365"<br>}</pre> | no |
| <a name="input_ssh_api_connection"></a> [ssh\_api\_connection](#input\_ssh\_api\_connection) | n/a | <pre>object({<br>    create              = bool<br>    name                = string<br>    userName            = string<br>    hostName            = string<br>    acceptAnySshHostKey = bool<br>  })</pre> | <pre>{<br>  "acceptAnySshHostKey": false,<br>  "create": false,<br>  "hostName": null,<br>  "name": null,<br>  "userName": null<br>}</pre> | no |
| <a name="input_storage_accounts"></a> [storage\_accounts](#input\_storage\_accounts) | n/a | <pre>map(object({<br>    identity_type             = string<br>    identity_ids              = list(string)<br>    replication_type          = string<br>    account_tier              = string<br>    account_kind              = string<br>    min_tls_version           = string<br>    enable_https_traffic_only = bool<br>  }))</pre> | n/a | yes |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr) | Vnet Subnet CIDR | `list(string)` | `[]` | no |
| <a name="input_type"></a> [type](#input\_type) | Name of service type | `string` | `""` | no |
| <a name="input_version_number"></a> [version\_number](#input\_version\_number) | The version of the application or object being deployed. This could be a build object or other artefact which is appended by a CI/Cd platform as part of a process of standing up an environment | `string` | `""` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | Vnet Name for Private Subnets | `string` | `""` | no |
| <a name="input_vnet_rg_name"></a> [vnet\_rg\_name](#input\_vnet\_rg\_name) | Vnet Resource Group Name for Private Subnets | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_functionapp"></a> [functionapp](#output\_functionapp) | Output all |
<!-- END_TF_DOCS -->
