terraform {

  required_version = ">=1.2.0"
  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.38.0"
    }

    vault = {
      source  = "hashicorp/vault"
      version = "=2.21.0"
    }
  }
}

provider "azurerm" {
  features {}
}
