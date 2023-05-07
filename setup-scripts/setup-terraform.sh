#!/usr/bin/env bash
#set -x

# Creates the relevant storage account to store terraform state locally

RESOURCE_GROUP_NAME="datax-devops-01-rg"
STORAGE_ACCOUNT_NAME="deploycontainersa"

# Create Resource Group
az group create -l southeastasia -n $RESOURCE_GROUP_NAME

# Create Storage Account
az storage account create -n $STORAGE_ACCOUNT_NAME -g $RESOURCE_GROUP_NAME -l southeastasia --sku Standard_LRS

# Create Storage Account blob
az storage container create  --name tfstate --account-name $STORAGE_ACCOUNT_NAME

# $env:Path += ";C:\Users\Joe\Downloads\terraform"
# create import.tf < resource "azurerm_resource_group" "datax-devops-01-rg" {}
az group show --name datax-devops-01-rg --query id --output tsv
terraform import azurerm_resource_group.datax-devops-01-rg /subscriptions/2e03a907-21c2-41bf-a3d9-e529997042f7/resourceGroups/datax-devops-01-rg