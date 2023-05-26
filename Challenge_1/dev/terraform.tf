terraform {
  required_version = "~> 1.4.4"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.50.0"
    }
  }

}

provider "azurerm" {
  client_id                  = ""
  client_secret              = "" #Passing value as ENV Varaible from Pipeline
  tenant_id                  = ""
  subscription_id            = ""
  skip_provider_registration = true

  features {}
}

data "azurerm_client_config" "current" {}