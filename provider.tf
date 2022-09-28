terraform {

  required_version = ">=1.2.0"
  backend "azurerm" {
    resource_group_name  = "RG-MDV-SHARED-01"
    storage_account_name = "samdvshared01"
    container_name       = "automation-terraform-functionapp"
    key                  = "nonlive.terraform.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.19.1"
    }
  }
}

provider "azurerm" {
  features {}
}
