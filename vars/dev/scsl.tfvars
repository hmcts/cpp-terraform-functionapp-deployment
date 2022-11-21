storage_accounts = {
  rgdevccp0101scsla2c82 = {
    identity_type             = "SystemAssigned"
    identity_ids              = null
    replication_type          = "LRS"
    account_tier              = "Standard"
    account_kind              = "StorageV2"
    min_tls_version           = "TLS1_2"
    enable_https_traffic_only = true
  }
  sadevccmscslmi2 = {
    identity_type             = "SystemAssigned"
    identity_ids              = null
    replication_type          = "LRS"
    account_tier              = "Standard"
    account_kind              = "StorageV2"
    min_tls_version           = "TLS1_2"
    enable_https_traffic_only = true
  }
  sadevccp0101scslfa2 = {
    identity_type             = "SystemAssigned"
    identity_ids              = null
    replication_type          = "LRS"
    account_tier              = "Standard"
    account_kind              = "StorageV2"
    min_tls_version           = "TLS1_2"
    enable_https_traffic_only = true
  }
}

application_insights = {
  scsl = {
    function_app               = 'scsl'
    log_analytics_workspace_id = null
    application_type           = "web"
    retention_in_days          = 90
  }
  scsl_enabler = {
    function_app               = 'scsl-enabler'
    log_analytics_workspace_id = null
    application_type           = "web"
    retention_in_days          = 90
  }
}

functionapps = {
  fa-dev-cpp-scsl = {
    asp_sku                      = "S1"
    asp_os_type                  = "Windows"
    asp_instance_size            = 1
    asp_per_site_scaling_enabled = false
    asp_zone_balancing_enabled   = false
    create_service_plan          = true
    application_settings = {
      APPINSIGHTS_INSTRUMENTATIONKEY             = "d367847f-900b-4646-9a6c-29e7fb10d1b3"
      APPLICATIONINSIGHTS_CONNECTION_STRING      = "InstrumentationKey=d367847f-900b-4646-9a6c-29e7fb10d1b3;IngestionEndpoint=https://uksouth-0.in.applicationinsights.azure.com/"
      ApplicationInsightsAgent_EXTENSION_VERSION = "~2"
      "AzureWebJobs.cppRotaDataMapper.Disabled"  = 0
      "AzureWebJobs.rotaFileProcessor.Disabled"  = 0
      ENABLE_ORYX_BUILD                          = false
      FUNCTIONS_EXTENSION_VERSION                = "~2"
      FUNCTIONS_WORKER_RUNTIME                   = "java"
      JAVA_OPTS                                  = "-Xms2048m -Xmx2048m"
      "mi.data.cleaner.schedule"                 = "0 0 7 * * *"
      "mi.data.delete.days"                      = "7"
      "mi.storgage.blob.container"               = "mi-blob-container"
      "mireportdata.host"                        = "http://DEVCCM01ACTAP03.cpp.nonlive:8080"
      "referencedata.cjscppuid"                  = "c2c9b689-2ce6-43b3-9143-1c0c02235aa1"
      "referencedata.host"                       = "http://devccm01actap01.cpp.nonlive:8080"
      "rota.blob.archive.container"              = "schedulelistingoutput"
      "rota.blob.container"                      = "schedulelistinginput"
      "rota.file.path"                           = "schedulelistinginput/{name}"
      "rotasl.cjscppuid"                         = "f9b04933-4257-3de8-885f-6acca3f80c66"
      SCM_DO_BUILD_DURING_DEPLOYMENT             = false
      "scsl.db.url"                              = "jdbc:postgresql://psf-dev-ccm01-rotasl.postgres.database.azure.com:5432/?sslmode=require"
      "scsl.db.username"                         = "scsl"
      "snlt.hmi.apim.baseUrl"                    = "https://spnl-dev-apim-int-gw.cpp.nonlive/fa-dev-ccm-snlt"
      "unprocessed.data.cleaner.days"            = ""
      "unprocessed.data.cleaner.schedule"        = "0 0 7 * * *"
      WEBSITE_HTTPLOGGING_RETENTION_DAYS         = 3
      WEBSITE_LOAD_CERTIFICATES                  = "B23DB2981A448FA74A11D6D1EE830A1C5378E044"
      WEBSITE_RUN_FROM_PACKAGE                   = 1
    }
    application_settings_sensitive_keyvault_lookup = {}
    application_settings_sensitive_hashicorp_vault_lookup = {
      "scsl.db.password"               = "secret/dev/devccm01/scsl_db_password"
      "snlt.hmi.apim.subscription.key" = "secret/dev/devccm01/snlt_sub_key"
      AzureWebJobsDashboard            = "secret/dev/devccm01/scsl_sa_fa_connection"
      AzureWebJobsStorage              = "secret/dev/devccm01/scsl_sa_fa_connection"
      "mi.storage.url"                 = "secret/dev/devccm01/scsl_sa_mi_connection"
      "rota.blob.url"                  = "secret/dev/devccm01/scsl_sa_ccm_connection"
      sasteccmscsl_STORAGE             = "secret/dev/devccm01/scsl_sa_ccm_connection"
    }
    functionapp_package = "https://libraries-internal.mdv.cpp.nonlive/artifactory/list/repocentral/uk/gov/moj/cpp/rotasl/rotasl-azure-functions/3.0.9/rotasl-azure-functions-3.0.9.zip"
    site_config = {
      use_32_bit_worker_process = true
    }
    application          = "fa-dev-cpp-scsl"
    service_plan_name    = "sp-dev-cpp-scsl"
    create_service_plan  = true
    storage_account_name = "sadevccp0101scslfa2"
  },
  fa-dev-cpp-scsl-enabler = {
    asp_sku                      = "S1"
    asp_os_type                  = "Windows"
    asp_instance_size            = 1
    asp_per_site_scaling_enabled = false
    asp_zone_balancing_enabled   = false
    create_service_plan          = true
    application_settings = {
      AppClientId                             = "fd78b297-45c6-47c4-aa08-701cda5099aa"
      AppClientSecret                         = "eDD7Q~~a8r1rvdIm7~ZHDiN1d7PV2SGTCKAtI"
      APPINSIGHTS_INSTRUMENTATIONKEY          = "3d0fd519-ae97-4994-abe2-9ed000f500c6"
      APPLICATIONINSIGHTS_CONNECTION_STRING   = "InstrumentationKey=3d0fd519-ae97-4994-abe2-9ed000f500c6;IngestionEndpoint=https://uksouth-1.in.applicationinsights.azure.com/;LiveEndpoint=https://uksouth.livediagnostics.monitor.azure.com/"
      AppTenantId                             = "e2995d11-9947-4e78-9de6-d44e0603518e"
      AzureWebJobsStorage                     = "DefaultEndpointsProtocol=https;AccountName=sadevccp0101scslfa2;AccountKey=Z4v86hdChrh3R4o4PDiqi+j0OqjkdU1vFpD7Jgn34QhIPm/NNYxVOTNyjNxRRJFGaenThO6g5QOr+AStrpHo8w==;EndpointSuffix=core.windows.net"
      ENABLE_ORYX_BUILD                       = false
      FUNCTIONS_EXTENSION_VERSION             = "~4"
      FUNCTIONS_WORKER_RUNTIME                = "powershell"
      RotaFileProcessDisablerCronExp          = "0 0 6 1/1 * *"
      RotaFileProcessEnablerCronExp           = "0 0 19 1/1 * *"
      RotaFileProcessorFunctionName           = "fa-dev-ccm-scsl"
      RotaFileProcessorFunctionResourceGroup  = "RG-DEV-CCM-SCSL"
      RotaFileProcessorFunctionSubscriptionId = "e6b5053b-4c38-4475-a835-a025aeb3d8c7"
    }
    application_settings_sensitive_keyvault_lookup        = {}
    application_settings_sensitive_hashicorp_vault_lookup = {}
    functionapp_package                                   = "https://libraries-internal.mdv.cpp.nonlive/artifactory/list/repocentral/uk/gov/moj/cpp/rotasl/rotasl-enabler-azure-functions/3.0.9/rotasl-enabler-azure-functions-3.0.9.zip"
    site_config = {
      use_32_bit_worker_process = true
    }
    application          = "fa-dev-cpp-scsl-enabler"
    service_plan_name    = "sp-dev-cpp-scsl-enabler"
    create_service_plan  = true
    storage_account_name = "sadevccp0101scslfa2"
  }
}

namespace         = "cpp"
costcode          = "0101"
attribute         = ""
owner             = "EI"
environment       = "dev"
application       = "scsl"
application_group = "scsl"
type              = "functionapp"

shared_dashboard = {
  create         = true
  dashboard_json = <<-EOT
{
    "lenses": {
      "0": {
        "order": 0,
        "parts": {
          "0": {
            "position": {
              "x": 0,
              "y": 0,
              "colSpan": 2,
              "rowSpan": 1
            },
            "metadata": {
              "inputs": [
                {
                  "name": "id",
                  "value": "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7/resourceGroups/rg-dev-cpp-scsl/providers/microsoft.insights/components/fa-dev-cpp-scsl"
                },
                {
                  "name": "Version",
                  "value": "1.0"
                }
              ],
              "type": "Extension/AppInsightsExtension/PartType/AspNetOverviewPinnedPart",
              "asset": {
                "idInputName": "id",
                "type": "ApplicationInsights"
              },
              "defaultMenuItemId": "overview"
            }
          },
          "1": {
            "position": {
              "x": 2,
              "y": 0,
              "colSpan": 1,
              "rowSpan": 1
            },
            "metadata": {
              "inputs": [
                {
                  "name": "ComponentId",
                  "value": {
                    "Name": "fa-dev-cpp-scsl",
                    "SubscriptionId": "e6b5053b-4c38-4475-a835-a025aeb3d8c7",
                    "ResourceGroup": "rg-dev-cpp-scsl"
                  }
                },
                {
                  "name": "Version",
                  "value": "1.0"
                }
              ],
              "type": "Extension/AppInsightsExtension/PartType/ProactiveDetectionAsyncPart",
              "asset": {
                "idInputName": "ComponentId",
                "type": "ApplicationInsights"
              },
              "defaultMenuItemId": "ProactiveDetection"
            }
          },
          "2": {
            "position": {
              "x": 3,
              "y": 0,
              "colSpan": 1,
              "rowSpan": 1
            },
            "metadata": {
              "inputs": [
                {
                  "name": "ComponentId",
                  "value": {
                    "Name": "fa-dev-cpp-scsl",
                    "SubscriptionId": "e6b5053b-4c38-4475-a835-a025aeb3d8c7",
                    "ResourceGroup": "rg-dev-cpp-scsl"
                  }
                },
                {
                  "name": "ResourceId",
                  "value": "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7/resourceGroups/rg-dev-cpp-scsl/providers/microsoft.insights/components/fa-dev-cpp-scsl"
                }
              ],
              "type": "Extension/AppInsightsExtension/PartType/QuickPulseButtonSmallPart",
              "asset": {
                "idInputName": "ComponentId",
                "type": "ApplicationInsights"
              }
            }
          },
          "3": {
            "position": {
              "x": 4,
              "y": 0,
              "colSpan": 1,
              "rowSpan": 1
            },
            "metadata": {
              "inputs": [
                {
                  "name": "ComponentId",
                  "value": {
                    "Name": "fa-dev-cpp-scsl",
                    "SubscriptionId": "e6b5053b-4c38-4475-a835-a025aeb3d8c7",
                    "ResourceGroup": "rg-dev-cpp-scsl"
                  }
                },
                {
                  "name": "TimeContext",
                  "value": {
                    "durationMs": 86400000,
                    "endTime": null,
                    "createdTime": "2018-05-04T01:20:33.345Z",
                    "isInitialTime": true,
                    "grain": 1,
                    "useDashboardTimeRange": false
                  }
                },
                {
                  "name": "Version",
                  "value": "1.0"
                }
              ],
              "type": "Extension/AppInsightsExtension/PartType/AvailabilityNavButtonPart",
              "asset": {
                "idInputName": "ComponentId",
                "type": "ApplicationInsights"
              }
            }
          },
          "4": {
            "position": {
              "x": 5,
              "y": 0,
              "colSpan": 1,
              "rowSpan": 1
            },
            "metadata": {
              "inputs": [
                {
                  "name": "ComponentId",
                  "value": {
                    "Name": "fa-dev-cpp-scsl",
                    "SubscriptionId": "e6b5053b-4c38-4475-a835-a025aeb3d8c7",
                    "ResourceGroup": "rg-dev-cpp-scsl"
                  }
                },
                {
                  "name": "TimeContext",
                  "value": {
                    "durationMs": 86400000,
                    "endTime": null,
                    "createdTime": "2018-05-08T18:47:35.237Z",
                    "isInitialTime": true,
                    "grain": 1,
                    "useDashboardTimeRange": false
                  }
                },
                {
                  "name": "ConfigurationId",
                  "value": "78ce933e-e864-4b05-a27b-71fd55a6afad"
                }
              ],
              "type": "Extension/AppInsightsExtension/PartType/AppMapButtonPart",
              "asset": {
                "idInputName": "ComponentId",
                "type": "ApplicationInsights"
              }
            }
          },
          "5": {
            "position": {
              "x": 0,
              "y": 1,
              "colSpan": 3,
              "rowSpan": 1
            },
            "metadata": {
              "inputs": [],
              "type": "Extension/HubsExtension/PartType/MarkdownPart",
              "settings": {
                "content": {
                  "settings": {
                    "content": "# Usage",
                    "title": "",
                    "subtitle": ""
                  }
                }
              }
            }
          },
          "6": {
            "position": {
              "x": 3,
              "y": 1,
              "colSpan": 1,
              "rowSpan": 1
            },
            "metadata": {
              "inputs": [
                {
                  "name": "ComponentId",
                  "value": {
                    "Name": "fa-dev-cpp-scsl",
                    "SubscriptionId": "e6b5053b-4c38-4475-a835-a025aeb3d8c7",
                    "ResourceGroup": "rg-dev-cpp-scsl"
                  }
                },
                {
                  "name": "TimeContext",
                  "value": {
                    "durationMs": 86400000,
                    "endTime": null,
                    "createdTime": "2018-05-04T01:22:35.782Z",
                    "isInitialTime": true,
                    "grain": 1,
                    "useDashboardTimeRange": false
                  }
                }
              ],
              "type": "Extension/AppInsightsExtension/PartType/UsageUsersOverviewPart",
              "asset": {
                "idInputName": "ComponentId",
                "type": "ApplicationInsights"
              }
            }
          },
          "7": {
            "position": {
              "x": 4,
              "y": 1,
              "colSpan": 3,
              "rowSpan": 1
            },
            "metadata": {
              "inputs": [],
              "type": "Extension/HubsExtension/PartType/MarkdownPart",
              "settings": {
                "content": {
                  "settings": {
                    "content": "# Reliability",
                    "title": "",
                    "subtitle": ""
                  }
                }
              }
            }
          },
          "8": {
            "position": {
              "x": 7,
              "y": 1,
              "colSpan": 1,
              "rowSpan": 1
            },
            "metadata": {
              "inputs": [
                {
                  "name": "ResourceId",
                  "value": "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7/resourceGroups/rg-dev-cpp-scsl/providers/microsoft.insights/components/fa-dev-cpp-scsl"
                },
                {
                  "name": "DataModel",
                  "value": {
                    "version": "1.0.0",
                    "timeContext": {
                      "durationMs": 86400000,
                      "createdTime": "2018-05-04T23:42:40.072Z",
                      "isInitialTime": false,
                      "grain": 1,
                      "useDashboardTimeRange": false
                    }
                  },
                  "isOptional": true
                },
                {
                  "name": "ConfigurationId",
                  "value": "8a02f7bf-ac0f-40e1-afe9-f0e72cfee77f",
                  "isOptional": true
                }
              ],
              "type": "Extension/AppInsightsExtension/PartType/CuratedBladeFailuresPinnedPart",
              "isAdapter": true,
              "asset": {
                "idInputName": "ResourceId",
                "type": "ApplicationInsights"
              },
              "defaultMenuItemId": "failures"
            }
          },
          "9": {
            "position": {
              "x": 8,
              "y": 1,
              "colSpan": 3,
              "rowSpan": 1
            },
            "metadata": {
              "inputs": [],
              "type": "Extension/HubsExtension/PartType/MarkdownPart",
              "settings": {
                "content": {
                  "settings": {
                    "content": "# Responsiveness\r\n",
                    "title": "",
                    "subtitle": ""
                  }
                }
              }
            }
          },
          "10": {
            "position": {
              "x": 11,
              "y": 1,
              "colSpan": 1,
              "rowSpan": 1
            },
            "metadata": {
              "inputs": [
                {
                  "name": "ResourceId",
                  "value": "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7/resourceGroups/rg-dev-cpp-scsl/providers/microsoft.insights/components/fa-dev-cpp-scsl"
                },
                {
                  "name": "DataModel",
                  "value": {
                    "version": "1.0.0",
                    "timeContext": {
                      "durationMs": 86400000,
                      "createdTime": "2018-05-04T23:43:37.804Z",
                      "isInitialTime": false,
                      "grain": 1,
                      "useDashboardTimeRange": false
                    }
                  },
                  "isOptional": true
                },
                {
                  "name": "ConfigurationId",
                  "value": "2a8ede4f-2bee-4b9c-aed9-2db0e8a01865",
                  "isOptional": true
                }
              ],
              "type": "Extension/AppInsightsExtension/PartType/CuratedBladePerformancePinnedPart",
              "isAdapter": true,
              "asset": {
                "idInputName": "ResourceId",
                "type": "ApplicationInsights"
              },
              "defaultMenuItemId": "performance"
            }
          },
          "11": {
            "position": {
              "x": 12,
              "y": 1,
              "colSpan": 3,
              "rowSpan": 1
            },
            "metadata": {
              "inputs": [],
              "type": "Extension/HubsExtension/PartType/MarkdownPart",
              "settings": {
                "content": {
                  "settings": {
                    "content": "# Browser",
                    "title": "",
                    "subtitle": ""
                  }
                }
              }
            }
          },
          "12": {
            "position": {
              "x": 15,
              "y": 1,
              "colSpan": 1,
              "rowSpan": 1
            },
            "metadata": {
              "inputs": [
                {
                  "name": "ComponentId",
                  "value": {
                    "Name": "fa-dev-cpp-scsl",
                    "SubscriptionId": "e6b5053b-4c38-4475-a835-a025aeb3d8c7",
                    "ResourceGroup": "rg-dev-cpp-scsl"
                  }
                },
                {
                  "name": "MetricsExplorerJsonDefinitionId",
                  "value": "BrowserPerformanceTimelineMetrics"
                },
                {
                  "name": "TimeContext",
                  "value": {
                    "durationMs": 86400000,
                    "createdTime": "2018-05-08T12:16:27.534Z",
                    "isInitialTime": false,
                    "grain": 1,
                    "useDashboardTimeRange": false
                  }
                },
                {
                  "name": "CurrentFilter",
                  "value": {
                    "eventTypes": [
                      4,
                      1,
                      3,
                      5,
                      2,
                      6,
                      13
                    ],
                    "typeFacets": {},
                    "isPermissive": false
                  }
                },
                {
                  "name": "id",
                  "value": {
                    "Name": "fa-dev-cpp-scsl",
                    "SubscriptionId": "e6b5053b-4c38-4475-a835-a025aeb3d8c7",
                    "ResourceGroup": "rg-dev-cpp-scsl"
                  }
                },
                {
                  "name": "Version",
                  "value": "1.0"
                }
              ],
              "type": "Extension/AppInsightsExtension/PartType/MetricsExplorerBladePinnedPart",
              "asset": {
                "idInputName": "ComponentId",
                "type": "ApplicationInsights"
              },
              "defaultMenuItemId": "browser"
            }
          },
          "13": {
            "position": {
              "x": 0,
              "y": 2,
              "colSpan": 4,
              "rowSpan": 3
            },
            "metadata": {
              "inputs": [
                {
                  "name": "options",
                  "value": {
                    "chart": {
                      "metrics": [
                        {
                          "resourceMetadata": {
                            "id": "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7/resourceGroups/rg-dev-cpp-scsl/providers/microsoft.insights/components/fa-dev-cpp-scsl"
                          },
                          "name": "sessions/count",
                          "aggregationType": 5,
                          "namespace": "microsoft.insights/components/kusto",
                          "metricVisualization": {
                            "displayName": "Sessions",
                            "color": "#47BDF5"
                          }
                        },
                        {
                          "resourceMetadata": {
                            "id": "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7/resourceGroups/rg-dev-cpp-scsl/providers/microsoft.insights/components/fa-dev-cpp-scsl"
                          },
                          "name": "users/count",
                          "aggregationType": 5,
                          "namespace": "microsoft.insights/components/kusto",
                          "metricVisualization": {
                            "displayName": "Users",
                            "color": "#7E58FF"
                          }
                        }
                      ],
                      "title": "Unique sessions and users",
                      "visualization": {
                        "chartType": 2,
                        "legendVisualization": {
                          "isVisible": true,
                          "position": 2,
                          "hideSubtitle": false
                        },
                        "axisVisualization": {
                          "x": {
                            "isVisible": true,
                            "axisType": 2
                          },
                          "y": {
                            "isVisible": true,
                            "axisType": 1
                          }
                        }
                      },
                      "openBladeOnClick": {
                        "openBlade": true,
                        "destinationBlade": {
                          "extensionName": "HubsExtension",
                          "bladeName": "ResourceMenuBlade",
                          "parameters": {
                            "id": "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7/resourceGroups/rg-dev-cpp-scsl/providers/microsoft.insights/components/fa-dev-cpp-scsl",
                            "menuid": "segmentationUsers"
                          }
                        }
                      }
                    }
                  }
                },
                {
                  "name": "sharedTimeRange",
                  "isOptional": true
                }
              ],
              "type": "Extension/HubsExtension/PartType/MonitorChartPart",
              "settings": {}
            }
          },
          "14": {
            "position": {
              "x": 4,
              "y": 2,
              "colSpan": 4,
              "rowSpan": 3
            },
            "metadata": {
              "inputs": [
                {
                  "name": "options",
                  "value": {
                    "chart": {
                      "metrics": [
                        {
                          "resourceMetadata": {
                            "id": "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7/resourceGroups/rg-dev-cpp-scsl/providers/microsoft.insights/components/fa-dev-cpp-scsl"
                          },
                          "name": "requests/failed",
                          "aggregationType": 7,
                          "namespace": "microsoft.insights/components",
                          "metricVisualization": {
                            "displayName": "Failed requests",
                            "color": "#EC008C"
                          }
                        }
                      ],
                      "title": "Failed requests",
                      "visualization": {
                        "chartType": 3,
                        "legendVisualization": {
                          "isVisible": true,
                          "position": 2,
                          "hideSubtitle": false
                        },
                        "axisVisualization": {
                          "x": {
                            "isVisible": true,
                            "axisType": 2
                          },
                          "y": {
                            "isVisible": true,
                            "axisType": 1
                          }
                        }
                      },
                      "openBladeOnClick": {
                        "openBlade": true,
                        "destinationBlade": {
                          "extensionName": "HubsExtension",
                          "bladeName": "ResourceMenuBlade",
                          "parameters": {
                            "id": "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7/resourceGroups/rg-dev-cpp-scsl/providers/microsoft.insights/components/fa-dev-cpp-scsl",
                            "menuid": "failures"
                          }
                        }
                      }
                    }
                  }
                },
                {
                  "name": "sharedTimeRange",
                  "isOptional": true
                }
              ],
              "type": "Extension/HubsExtension/PartType/MonitorChartPart",
              "settings": {}
            }
          },
          "15": {
            "position": {
              "x": 8,
              "y": 2,
              "colSpan": 4,
              "rowSpan": 3
            },
            "metadata": {
              "inputs": [
                {
                  "name": "options",
                  "value": {
                    "chart": {
                      "metrics": [
                        {
                          "resourceMetadata": {
                            "id": "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7/resourceGroups/rg-dev-cpp-scsl/providers/microsoft.insights/components/fa-dev-cpp-scsl"
                          },
                          "name": "requests/duration",
                          "aggregationType": 4,
                          "namespace": "microsoft.insights/components",
                          "metricVisualization": {
                            "displayName": "Server response time",
                            "color": "#00BCF2"
                          }
                        }
                      ],
                      "title": "Server response time",
                      "visualization": {
                        "chartType": 2,
                        "legendVisualization": {
                          "isVisible": true,
                          "position": 2,
                          "hideSubtitle": false
                        },
                        "axisVisualization": {
                          "x": {
                            "isVisible": true,
                            "axisType": 2
                          },
                          "y": {
                            "isVisible": true,
                            "axisType": 1
                          }
                        }
                      },
                      "openBladeOnClick": {
                        "openBlade": true,
                        "destinationBlade": {
                          "extensionName": "HubsExtension",
                          "bladeName": "ResourceMenuBlade",
                          "parameters": {
                            "id": "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7/resourceGroups/rg-dev-cpp-scsl/providers/microsoft.insights/components/fa-dev-cpp-scsl",
                            "menuid": "performance"
                          }
                        }
                      }
                    }
                  }
                },
                {
                  "name": "sharedTimeRange",
                  "isOptional": true
                }
              ],
              "type": "Extension/HubsExtension/PartType/MonitorChartPart",
              "settings": {}
            }
          },
          "16": {
            "position": {
              "x": 12,
              "y": 2,
              "colSpan": 4,
              "rowSpan": 3
            },
            "metadata": {
              "inputs": [
                {
                  "name": "options",
                  "value": {
                    "chart": {
                      "metrics": [
                        {
                          "resourceMetadata": {
                            "id": "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7/resourceGroups/rg-dev-cpp-scsl/providers/microsoft.insights/components/fa-dev-cpp-scsl"
                          },
                          "name": "browserTimings/networkDuration",
                          "aggregationType": 4,
                          "namespace": "microsoft.insights/components",
                          "metricVisualization": {
                            "displayName": "Page load network connect time",
                            "color": "#7E58FF"
                          }
                        },
                        {
                          "resourceMetadata": {
                            "id": "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7/resourceGroups/rg-dev-cpp-scsl/providers/microsoft.insights/components/fa-dev-cpp-scsl"
                          },
                          "name": "browserTimings/processingDuration",
                          "aggregationType": 4,
                          "namespace": "microsoft.insights/components",
                          "metricVisualization": {
                            "displayName": "Client processing time",
                            "color": "#44F1C8"
                          }
                        },
                        {
                          "resourceMetadata": {
                            "id": "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7/resourceGroups/rg-dev-cpp-scsl/providers/microsoft.insights/components/fa-dev-cpp-scsl"
                          },
                          "name": "browserTimings/sendDuration",
                          "aggregationType": 4,
                          "namespace": "microsoft.insights/components",
                          "metricVisualization": {
                            "displayName": "Send request time",
                            "color": "#EB9371"
                          }
                        },
                        {
                          "resourceMetadata": {
                            "id": "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7/resourceGroups/rg-dev-cpp-scsl/providers/microsoft.insights/components/fa-dev-cpp-scsl"
                          },
                          "name": "browserTimings/receiveDuration",
                          "aggregationType": 4,
                          "namespace": "microsoft.insights/components",
                          "metricVisualization": {
                            "displayName": "Receiving response time",
                            "color": "#0672F1"
                          }
                        }
                      ],
                      "title": "Average page load time breakdown",
                      "visualization": {
                        "chartType": 3,
                        "legendVisualization": {
                          "isVisible": true,
                          "position": 2,
                          "hideSubtitle": false
                        },
                        "axisVisualization": {
                          "x": {
                            "isVisible": true,
                            "axisType": 2
                          },
                          "y": {
                            "isVisible": true,
                            "axisType": 1
                          }
                        }
                      }
                    }
                  }
                },
                {
                  "name": "sharedTimeRange",
                  "isOptional": true
                }
              ],
              "type": "Extension/HubsExtension/PartType/MonitorChartPart",
              "settings": {}
            }
          },
          "17": {
            "position": {
              "x": 0,
              "y": 5,
              "colSpan": 4,
              "rowSpan": 3
            },
            "metadata": {
              "inputs": [
                {
                  "name": "options",
                  "value": {
                    "chart": {
                      "metrics": [
                        {
                          "resourceMetadata": {
                            "id": "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7/resourceGroups/rg-dev-cpp-scsl/providers/microsoft.insights/components/fa-dev-cpp-scsl"
                          },
                          "name": "availabilityResults/availabilityPercentage",
                          "aggregationType": 4,
                          "namespace": "microsoft.insights/components",
                          "metricVisualization": {
                            "displayName": "Availability",
                            "color": "#47BDF5"
                          }
                        }
                      ],
                      "title": "Average availability",
                      "visualization": {
                        "chartType": 3,
                        "legendVisualization": {
                          "isVisible": true,
                          "position": 2,
                          "hideSubtitle": false
                        },
                        "axisVisualization": {
                          "x": {
                            "isVisible": true,
                            "axisType": 2
                          },
                          "y": {
                            "isVisible": true,
                            "axisType": 1
                          }
                        }
                      },
                      "openBladeOnClick": {
                        "openBlade": true,
                        "destinationBlade": {
                          "extensionName": "HubsExtension",
                          "bladeName": "ResourceMenuBlade",
                          "parameters": {
                            "id": "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7/resourceGroups/rg-dev-cpp-scsl/providers/microsoft.insights/components/fa-dev-cpp-scsl",
                            "menuid": "availability"
                          }
                        }
                      }
                    }
                  }
                },
                {
                  "name": "sharedTimeRange",
                  "isOptional": true
                }
              ],
              "type": "Extension/HubsExtension/PartType/MonitorChartPart",
              "settings": {}
            }
          },
          "18": {
            "position": {
              "x": 4,
              "y": 5,
              "colSpan": 4,
              "rowSpan": 3
            },
            "metadata": {
              "inputs": [
                {
                  "name": "options",
                  "value": {
                    "chart": {
                      "metrics": [
                        {
                          "resourceMetadata": {
                            "id": "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7/resourceGroups/rg-dev-cpp-scsl/providers/microsoft.insights/components/fa-dev-cpp-scsl"
                          },
                          "name": "exceptions/server",
                          "aggregationType": 7,
                          "namespace": "microsoft.insights/components",
                          "metricVisualization": {
                            "displayName": "Server exceptions",
                            "color": "#47BDF5"
                          }
                        },
                        {
                          "resourceMetadata": {
                            "id": "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7/resourceGroups/rg-dev-cpp-scsl/providers/microsoft.insights/components/fa-dev-cpp-scsl"
                          },
                          "name": "dependencies/failed",
                          "aggregationType": 7,
                          "namespace": "microsoft.insights/components",
                          "metricVisualization": {
                            "displayName": "Dependency failures",
                            "color": "#7E58FF"
                          }
                        }
                      ],
                      "title": "Server exceptions and Dependency failures",
                      "visualization": {
                        "chartType": 2,
                        "legendVisualization": {
                          "isVisible": true,
                          "position": 2,
                          "hideSubtitle": false
                        },
                        "axisVisualization": {
                          "x": {
                            "isVisible": true,
                            "axisType": 2
                          },
                          "y": {
                            "isVisible": true,
                            "axisType": 1
                          }
                        }
                      }
                    }
                  }
                },
                {
                  "name": "sharedTimeRange",
                  "isOptional": true
                }
              ],
              "type": "Extension/HubsExtension/PartType/MonitorChartPart",
              "settings": {}
            }
          },
          "19": {
            "position": {
              "x": 8,
              "y": 5,
              "colSpan": 4,
              "rowSpan": 3
            },
            "metadata": {
              "inputs": [
                {
                  "name": "options",
                  "value": {
                    "chart": {
                      "metrics": [
                        {
                          "resourceMetadata": {
                            "id": "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7/resourceGroups/rg-dev-cpp-scsl/providers/microsoft.insights/components/fa-dev-cpp-scsl"
                          },
                          "name": "performanceCounters/processorCpuPercentage",
                          "aggregationType": 4,
                          "namespace": "microsoft.insights/components",
                          "metricVisualization": {
                            "displayName": "Processor time",
                            "color": "#47BDF5"
                          }
                        },
                        {
                          "resourceMetadata": {
                            "id": "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7/resourceGroups/rg-dev-cpp-scsl/providers/microsoft.insights/components/fa-dev-cpp-scsl"
                          },
                          "name": "performanceCounters/processCpuPercentage",
                          "aggregationType": 4,
                          "namespace": "microsoft.insights/components",
                          "metricVisualization": {
                            "displayName": "Process CPU",
                            "color": "#7E58FF"
                          }
                        }
                      ],
                      "title": "Average processor and process CPU utilization",
                      "visualization": {
                        "chartType": 2,
                        "legendVisualization": {
                          "isVisible": true,
                          "position": 2,
                          "hideSubtitle": false
                        },
                        "axisVisualization": {
                          "x": {
                            "isVisible": true,
                            "axisType": 2
                          },
                          "y": {
                            "isVisible": true,
                            "axisType": 1
                          }
                        }
                      }
                    }
                  }
                },
                {
                  "name": "sharedTimeRange",
                  "isOptional": true
                }
              ],
              "type": "Extension/HubsExtension/PartType/MonitorChartPart",
              "settings": {}
            }
          },
          "20": {
            "position": {
              "x": 12,
              "y": 5,
              "colSpan": 4,
              "rowSpan": 3
            },
            "metadata": {
              "inputs": [
                {
                  "name": "options",
                  "value": {
                    "chart": {
                      "metrics": [
                        {
                          "resourceMetadata": {
                            "id": "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7/resourceGroups/rg-dev-cpp-scsl/providers/microsoft.insights/components/fa-dev-cpp-scsl"
                          },
                          "name": "exceptions/browser",
                          "aggregationType": 7,
                          "namespace": "microsoft.insights/components",
                          "metricVisualization": {
                            "displayName": "Browser exceptions",
                            "color": "#47BDF5"
                          }
                        }
                      ],
                      "title": "Browser exceptions",
                      "visualization": {
                        "chartType": 2,
                        "legendVisualization": {
                          "isVisible": true,
                          "position": 2,
                          "hideSubtitle": false
                        },
                        "axisVisualization": {
                          "x": {
                            "isVisible": true,
                            "axisType": 2
                          },
                          "y": {
                            "isVisible": true,
                            "axisType": 1
                          }
                        }
                      }
                    }
                  }
                },
                {
                  "name": "sharedTimeRange",
                  "isOptional": true
                }
              ],
              "type": "Extension/HubsExtension/PartType/MonitorChartPart",
              "settings": {}
            }
          },
          "21": {
            "position": {
              "x": 0,
              "y": 8,
              "colSpan": 4,
              "rowSpan": 3
            },
            "metadata": {
              "inputs": [
                {
                  "name": "options",
                  "value": {
                    "chart": {
                      "metrics": [
                        {
                          "resourceMetadata": {
                            "id": "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7/resourceGroups/rg-dev-cpp-scsl/providers/microsoft.insights/components/fa-dev-cpp-scsl"
                          },
                          "name": "availabilityResults/count",
                          "aggregationType": 7,
                          "namespace": "microsoft.insights/components",
                          "metricVisualization": {
                            "displayName": "Availability test results count",
                            "color": "#47BDF5"
                          }
                        }
                      ],
                      "title": "Availability test results count",
                      "visualization": {
                        "chartType": 2,
                        "legendVisualization": {
                          "isVisible": true,
                          "position": 2,
                          "hideSubtitle": false
                        },
                        "axisVisualization": {
                          "x": {
                            "isVisible": true,
                            "axisType": 2
                          },
                          "y": {
                            "isVisible": true,
                            "axisType": 1
                          }
                        }
                      }
                    }
                  }
                },
                {
                  "name": "sharedTimeRange",
                  "isOptional": true
                }
              ],
              "type": "Extension/HubsExtension/PartType/MonitorChartPart",
              "settings": {}
            }
          },
          "22": {
            "position": {
              "x": 4,
              "y": 8,
              "colSpan": 4,
              "rowSpan": 3
            },
            "metadata": {
              "inputs": [
                {
                  "name": "options",
                  "value": {
                    "chart": {
                      "metrics": [
                        {
                          "resourceMetadata": {
                            "id": "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7/resourceGroups/rg-dev-cpp-scsl/providers/microsoft.insights/components/fa-dev-cpp-scsl"
                          },
                          "name": "performanceCounters/processIOBytesPerSecond",
                          "aggregationType": 4,
                          "namespace": "microsoft.insights/components",
                          "metricVisualization": {
                            "displayName": "Process IO rate",
                            "color": "#47BDF5"
                          }
                        }
                      ],
                      "title": "Average process I/O rate",
                      "visualization": {
                        "chartType": 2,
                        "legendVisualization": {
                          "isVisible": true,
                          "position": 2,
                          "hideSubtitle": false
                        },
                        "axisVisualization": {
                          "x": {
                            "isVisible": true,
                            "axisType": 2
                          },
                          "y": {
                            "isVisible": true,
                            "axisType": 1
                          }
                        }
                      }
                    }
                  }
                },
                {
                  "name": "sharedTimeRange",
                  "isOptional": true
                }
              ],
              "type": "Extension/HubsExtension/PartType/MonitorChartPart",
              "settings": {}
            }
          },
          "23": {
            "position": {
              "x": 8,
              "y": 8,
              "colSpan": 4,
              "rowSpan": 3
            },
            "metadata": {
              "inputs": [
                {
                  "name": "options",
                  "value": {
                    "chart": {
                      "metrics": [
                        {
                          "resourceMetadata": {
                            "id": "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7/resourceGroups/rg-dev-cpp-scsl/providers/microsoft.insights/components/fa-dev-cpp-scsl"
                          },
                          "name": "performanceCounters/memoryAvailableBytes",
                          "aggregationType": 4,
                          "namespace": "microsoft.insights/components",
                          "metricVisualization": {
                            "displayName": "Available memory",
                            "color": "#47BDF5"
                          }
                        }
                      ],
                      "title": "Average available memory",
                      "visualization": {
                        "chartType": 2,
                        "legendVisualization": {
                          "isVisible": true,
                          "position": 2,
                          "hideSubtitle": false
                        },
                        "axisVisualization": {
                          "x": {
                            "isVisible": true,
                            "axisType": 2
                          },
                          "y": {
                            "isVisible": true,
                            "axisType": 1
                          }
                        }
                      }
                    }
                  }
                },
                {
                  "name": "sharedTimeRange",
                  "isOptional": true
                }
              ],
              "type": "Extension/HubsExtension/PartType/MonitorChartPart",
              "settings": {}
            }
          }
        }
      }
    },
    "metadata": {
      "model": {}
    }
  }
EOT

}
