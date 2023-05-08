terraform {
  backend "azurerm" {
    resource_group_name  = "datax-devops-01-rg"
    storage_account_name = "deploycontainersa"
    container_name       = "tfstate"
    key                  = "terraform-akscluster.tfstate"
  }
}
