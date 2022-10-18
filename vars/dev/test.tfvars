storage_account_name          = "sadevccp0101notifyattfa2"
storage_account_identity_type = "SystemAssigned"

asp_os_type = "Windows"
asp_sku     = "P1v2"

create_storage_account = false
create_service_plan    = false
service_plan_name      = "as-dev-cpp-notifyatt"

functionapp_package = "https://libraries-internal.mdv.cpp.nonlive/artifactory/list/repocentral/uk/gov/moj/cpp/notification/notify/notificationnotify-azure-functions/8.0.2/notificationnotify-azure-functions-8.0.2.zip"
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
application_insights_id      = "ai-dev-cpp-notifyatt"

namespace         = "cpp"
costcode          = "0101"
attribute         = ""
owner             = "EI"
environment       = "dev"
application       = "notifyatttest"
application_group = "notifyatt"
type              = "functionapp"

logicapp_enabled = false

logicapp_template = <<EOT
{
    "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {},
    "variables": {},
    "resources": [
        {
            "type": "Microsoft.Logic/workflows",
            "apiVersion": "2017-07-01",
            "name": "lg-dev-ccp-notifyatt",
            "location": "uksouth",
            "properties": {
                "state": "Enabled",
                "definition": {
                    "$schema": "https://schema.management.azure.com/providers/Microsoft.Logic/schemas/2016-06-01/workflowdefinition.json#",
                    "contentVersion": "1.0.0.0",
                    "parameters": {
                        "$connections": {
                            "defaultValue": {},
                            "type": "Object"
                        }
                    },
                    "triggers": {
                        "manual": {
                            "type": "Request",
                            "kind": "Http",
                            "inputs": {
                                "schema": {
                                    "$schema": "http://json-schema.org/draft-04/schema#",
                                    "additionalProperties": false,
                                    "id": "http://justice.gov.uk/json/schemas/domains/notificationnotify/paas/logic-app-request-payload.email.json",
                                    "properties": {
                                        "attachment": {
                                            "properties": {
                                                "content": {
                                                    "contentEncoding": "base64",
                                                    "type": "string"
                                                },
                                                "filename": {
                                                    "type": "string"
                                                }
                                            }
                                        },
                                        "emailAddress": {
                                            "type": "string"
                                        },
                                        "personalisation": {
                                            "additionalProperties": true,
                                            "properties": {},
                                            "type": "object"
                                        },
                                        "reference": {
                                            "type": "string"
                                        },
                                        "replyToAddressId": {
                                            "pattern": "[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}$",
                                            "type": "string"
                                        },
                                        "templateId": {
                                            "pattern": "[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}$",
                                            "type": "string"
                                        }
                                    },
                                    "required": [
                                        "templateId",
                                        "emailAddress"
                                    ],
                                    "type": "object"
                                }
                            }
                        }
                    },
                    "actions": {
                        "Condition": {
                            "actions": {
                                "Send_an_email_(V2)_2": {
                                    "runAfter": {},
                                    "type": "ApiConnection",
                                    "inputs": {
                                        "body": {
                                            "Body": "<p>@{body('Parse_JSON')?['htmlBody']}</p>",
                                            "Subject": "@body('Parse_JSON')?['subject']",
                                            "To": "@triggerBody()['emailAddress']"
                                        },
                                        "host": {
                                            "connection": {
                                                "name": "@parameters('$connections')['office365']['connectionId']"
                                            }
                                        },
                                        "method": "post",
                                        "path": "/v2/Mail"
                                    }
                                }
                            },
                            "runAfter": {
                                "Parse_JSON": [
                                    "Succeeded"
                                ]
                            },
                            "else": {
                                "actions": {
                                    "Send_an_email_(V2)_3": {
                                        "runAfter": {},
                                        "type": "ApiConnection",
                                        "inputs": {
                                            "body": {
                                                "Body": "<p>@{body('Parse_JSON')?['htmlBody']}</p>",
                                                "Subject": "@body('Parse_JSON')?['subject']",
                                                "To": "@triggerBody()['emailAddress']"
                                            },
                                            "host": {
                                                "connection": {
                                                    "name": "@parameters('$connections')['office365']['connectionId']"
                                                }
                                            },
                                            "method": "post",
                                            "path": "/v2/Mail"
                                        }
                                    }
                                }
                            },
                            "expression": {
                                "and": [
                                    {
                                        "equals": [
                                            "",
                                            ""
                                        ]
                                    }
                                ]
                            },
                            "type": "If"
                        },
                        "Generate-Notification-Email": {
                            "runAfter": {
                                "Send_Accepted_Response": [
                                    "Succeeded"
                                ]
                            },
                            "type": "Function",
                            "inputs": {
                                "body": {
                                    "personalisation": "@triggerBody()?['personalisation']",
                                    "reference": "@triggerBody()?['reference']"
                                },
                                "function": {
                                    "id": "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7/resourceGroups/rg-dev-cpp-notifyatt/providers/Microsoft.Web/sites/fa-dev-cpp-notifyatt/functions/generate-notification-email"
                                },
                                "queries": {
                                    "templateId": "@{triggerBody()['templateId']}"
                                }
                            }
                        },
                        "Parse_JSON": {
                            "runAfter": {
                                "Generate-Notification-Email": [
                                    "Succeeded"
                                ]
                            },
                            "type": "ParseJson",
                            "inputs": {
                                "content": "@body('Generate-Notification-Email')",
                                "schema": {
                                    "$schema": "http://json-schema.org/draft-04/schema#",
                                    "additionalProperties": false,
                                    "id": "http://justice.gov.uk/json/schemas/domains/notificationnotify/paas/generated-email.json",
                                    "properties": {
                                        "htmlBody": {
                                            "type": "string"
                                        },
                                        "reference": {
                                            "type": "string"
                                        },
                                        "subject": {
                                            "type": "string"
                                        },
                                        "templateId": {
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                }
                            }
                        },
                        "Send_Accepted_Response": {
                            "runAfter": {},
                            "type": "Response",
                            "kind": "Http",
                            "inputs": {
                                "body": {
                                    "id": "@{triggerBody()?['reference']}"
                                },
                                "headers": {
                                    "Content-Type": "application/json"
                                },
                                "statusCode": 201
                            }
                        },
                        "Send_an_email_(V2)": {
                            "runAfter": {
                                "Condition": [
                                    "Succeeded"
                                ]
                            },
                            "type": "ApiConnection",
                            "inputs": {
                                "body": {
                                    "Attachments": [
                                        {
                                            "ContentBytes": "@{triggerBody()?['attachment']['content']}",
                                            "Name": "@{triggerBody()['attachment']['filename']}"
                                        }
                                    ],
                                    "Body": "<p>@{body('Parse_JSON')?['htmlBody']}</p>",
                                    "Subject": "@body('Parse_JSON')?['subject']",
                                    "To": "@triggerBody()['emailAddress']"
                                },
                                "host": {
                                    "connection": {
                                        "name": "@parameters('$connections')['office365']['connectionId']"
                                    }
                                },
                                "method": "post",
                                "path": "/v2/Mail"
                            }
                        }
                    }
                },
                "parameters": {
                    "$connections": {
                        "value": {
                            "office365": {
                                "connectionId": "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7/resourceGroups/rg-dev-cpp-notifyatt/providers/Microsoft.Web/connections/office365-1",
                                "connectionName": "office365-1",
                                "id": "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7/providers/Microsoft.Web/locations/uksouth/managedApis/office365-1"
                            }
                        }
                    }
                }
            }
        }
    ]
}
EOT

logicapp_api_connection_template = <<EOT
{
    "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {
        "connections_office365_1_name": {
            "defaultValue": "office365-1",
            "type": "String"
        }
    },
    "variables": {},
    "resources": [
        {
            "type": "Microsoft.Web/connections",
            "apiVersion": "2016-06-01",
            "name": "[parameters('connections_office365_1_name')]",
            "location": "uksouth",
            "kind": "V1",
            "properties": {
                "displayName": "daniel.alves1@HMCTS.NET",
                "api": {
                    "name": "office365",
                    "displayName": "Office 365 Outlook",
                    "description": "Microsoft Office 365 is a cloud-based service that is designed to help meet your organization's needs for robust security, reliability, and user productivity.",
                    "iconUri": "https://connectoricons-prod.azureedge.net/releases/v1.0.1599/1.0.1599.3017/office365/icon.png",
                    "brandColor": "#0078D4",
                    "id": "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7/providers/Microsoft.Web/locations/uksouth/managedApis/office365",
                    "type": "Microsoft.Web/locations/managedApis"
                }
            }
        }
    ]
}
EOT
