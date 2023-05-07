provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "datax-devops-01-rg"
    storage_account_name = "deploycontainersa"
    container_name       = "tfstate"
    key                  = "terraform-containerapp.tfstate"
  }

  required_providers {
    azapi = {
      source  = "azure/azapi"
      version = "1.5.0"
    }
  }

}

provider "azapi" {
  tls_insecure = true
}

data "azurerm_client_config" "current" {}
