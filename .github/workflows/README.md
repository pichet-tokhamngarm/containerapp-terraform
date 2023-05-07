## About

GitHub Workflows to create and destroy Azure Container App using terraform.
___

* [Usage](#usage)
  * [Create Containerapp](#create-containerapp)
  * [Destroy Containerapp](#destroy-containerapp)
 
## Usage

### Create Containerapp
To create containerapp need to review and complete 2 scripts in [setup-scripts](../../setup-scripts/README.md) .

* Workflow will fail when run for the first time when login to ACR as password newly create. Update secret name REGISTRY_PASSWORD with ACR access key's password then re-run workflow to complete the creation. 
* When workflow completed the link to Containerapp can be found in Container App within Resource group. 



### Destroy Containerapp
To completly destroy containerapp there are 2 resources need manual remove.
* alert rule that created along with log analytic
* tfstate container
