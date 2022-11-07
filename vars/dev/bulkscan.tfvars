storage_accounts = {
  sadevccp0101blksfa02 = {
    identity_type             = "SystemAssigned"
    identity_ids              = null
    replication_type          = "LRS"
    account_tier              = "Standard"
    account_kind              = "StorageV2"
    min_tls_version           = "TLS1_2"
    enable_https_traffic_only = true
  }
  sadevccmbulkscanfailed02 = {
    identity_type             = "SystemAssigned"
    identity_ids              = null
    replication_type          = "LRS"
    account_tier              = "Standard"
    account_kind              = "StorageV2"
    min_tls_version           = "TLS1_2"
    enable_https_traffic_only = true
  }
  sadevccmbulkscaninbox02 = {
    identity_type             = "SystemAssigned"
    identity_ids              = null
    replication_type          = "LRS"
    account_tier              = "Standard"
    account_kind              = "StorageV2"
    min_tls_version           = "TLS1_2"
    enable_https_traffic_only = true
  }
  sadevccmbulkscanmngr02 = {
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
  log_analytics_workspace_id = null
  application_type           = "web"
  retention_in_days          = 90
}

functionapps = {
  fa-dev-ccp-bulkscan = {
    asp_sku                      = "S1"
    asp_os_type                  = "Windows"
    asp_instance_size            = 1
    asp_per_site_scaling_enabled = false
    asp_zone_balancing_enabled   = false
    create_service_plan          = true
    application_settings = {
      attach_document_to_case_pti_urn_url     = "http://devccm01actap01.cpp.nonlive:8080/stagingprosecutors-command-api/command/api/rest/stagingprosecutors/v2/prosecutions/%s/materials"
      attach_document_to_case_urn_url         = "http://devccm01actap01.cpp.nonlive:8080/stagingprosecutors-command-api/command/api/rest/stagingprosecutors/v2/prosecutions/%s/materials/%s"
      BS-CPPUID                               = "27ffddd5-b593-4d06-a4e9-7e149e7ef95a"
      ENABLE_ORYX_BUILD                       = false
      environment                             = "dev"
      FUNCTIONS_EXTENSION_VERSION             = "~2"
      FUNCTIONS_WORKER_RUNTIME                = "java"
      reference_data_query_api_prosecutor_url = "http://devccm01actap01.cpp.nonlive:8080/referencedata-query-api/query/api/rest/referencedata/prosecutors"
      reference_data_query_api_pti_urn_url    = "http://devccm01actap01.cpp.nonlive:8080/referencedata-query-api/query/api/rest/referencedata/prosecutor"
      register_envelope_api_url               = "http://devccm01actap01.cpp.nonlive:8080/stagingbulkscan-command-api/command/api/rest/stagingbulkscan/scan-envelope"
      register_envelope_content_type          = "application/vnd.stagingbulkscan.register-scan-envelope+json"
      SCM_DO_BUILD_DURING_DEPLOYMENT          = false
      staging-prosecutor-user                 = "2c8810b9-1d06-4830-af49-d341c022a217"
      update_scan_document_api_url            = "http://devccm01actap01.cpp.nonlive:8080/stagingbulkscan-command-api/command/api/rest/stagingbulkscan/scan-envelope/%s/scan-document/%s"
      update_scan_document_content_type       = "application/vnd.stagingbulkscan.update-document-submission-id+json"
      WEBSITE_RUN_FROM_PACKAGE                = 1
    }
    application_settings_sensitive_keyvault_lookup = {
      storage-failed  = "ado--cpp-terraform-functionapp-deployment--dev--sadevccmbulkscanfailed02--connection-string"
      storage-inbox   = "ado--cpp-terraform-functionapp-deployment--dev--sadevccmbulkscaninbox02--connection-string"
      storage-scanmgr = "ado--cpp-terraform-functionapp-deployment--dev--sadevccmbulkscanmngr02--connection-string"
    }
    application_settings_sensitive_hashicorp_vault_lookup = {}
    functionapp_package                                   = "https://libraries-internal.mdv.cpp.nonlive/artifactory/list/repocentral/uk/gov/moj/cpp/stagingbulkscan/stagingbulkscan-azure-functions/7.0.9/stagingbulkscan-azure-functions-7.0.9.zip"
    site_config                                           = {}
    service_plan_name                                     = null
    create_service_plan                                   = true
    storage_account_name                                  = "sadevccp0101blksfa02"
  }
}

logicapps = {
  bulkscanemailstatusnotificationservice = {
    uri_reference     = "https://apigw.dev.cjscp.org.uk/bulkscan"
    shared_email_box  = "cp-nonlive-bulkscan-emails@HMCTS.NET"
    function_app_name = "fa-dev-ccp-bulkscan"
  }
  Police-Email-Received = {
    uri_reference     = "https://apigw.dev.cjscp.org.uk/bulkscan"
    shared_email_box  = "cp-nonlive-bulkscan-emails@HMCTS.NET"
    function_app_name = "fa-dev-ccp-bulkscan"
  }
}

eventgrid_system_topics = {
  sadevccmbulkscaninbox = {
    storage_account_name = "sadevccmbulkscaninbox02"
    subscriptions = [
      {
        subscription_name = "egs-dev-bulk-scan-envelope-arrived"
        functionapp_name  = "fa-dev-ccp-bulkscan"
        function_name     = "bulkScanInboxProcessor"
      }
    ]
  }
}

smtp_api_connection = {
  create = true
  name   = "office365"
}

ssh_api_connection = {
  create              = true
  name                = "sftpwithssh"
  userName            = "AzureUser"
  hostName            = "20.58.5.185"
  acceptAnySshHostKey = true
}

namespace         = "cpp"
costcode          = "0101"
attribute         = ""
owner             = "EI"
environment       = "dev"
application       = "bulkscan"
application_group = "bulkscan"
type              = "functionapp"
