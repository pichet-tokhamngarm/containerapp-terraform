## About

GitHub Workflows to create and destroy Azure Container App using terraform.
___

* [Usage](#usage)
  * [Create Containerapp](#create-containerapp)
  * [Destroy Containerapp](#destroy-containerapp)
 
## Usage

### Create Containerapp
To create containerapp there are 2 scripts need to run in setup-scripts path.
* Add 4 GitHub secrets from the output of script ran in setup-scripts.
```
  AZURE_AD_CLIENT_ID – Will be the `clientId` value
  AZURE_AD_CLIENT_SECRET – Will be the `clientSecret` value
  AZURE_AD_TENANT_ID – Will be the `tenantId` value
  AZURE_SUBSCRIPTION_ID – Will be the `subscriptionId` value
```
* Workflow will fail when run for the first time when login to ACR as password newly create. Update secret name REGISTRY_PASSWORD with ACR access key's password then re-run workflow to complete the creation. 
* When workflow completed the link to Containerapp can be found in Container App within Resource group. 



### Destroy Containerapp
To destroy containerapp there are 3 resources need manual delete.
* alert rule that created along with log analytic
* terraform-base.tfstate file
* terraform-containerapp.tfstate