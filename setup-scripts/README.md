# Service principal creation

The purpose of service principal creation is to allow authentication from the GitHub Action to your Azure subscription.

## Create service principal

1. Ensure you have ran `az-login`
2. Review and run [service-principal-creation.sh](service-principal-creation.sh)
3. The script will create:
- A service connection called `ContainerAppGitHubAction`
- Grant contributor access to your subscription for the newly created service connection.
4. Review output of script, it will display values that need for create the GitHub secrets.

```
  AZURE_AD_CLIENT_ID – Will be the `clientId` value
  AZURE_AD_CLIENT_SECRET – Will be the `clientSecret` value
  AZURE_AD_TENANT_ID – Will be the `tenantId` value
  AZURE_SUBSCRIPTION_ID – Will be the `subscriptionId` value
```

# Terraform state fille setup

Terraform must store state about managed infrastructure and configuration. This state is used by Terraform to map real world resources to configuration, keep track of metadata, and to improve performance for large infrastructures.

[setup-terraform.sh](setup-terraform.sh) script will:
- Configure what is required to store terraform state file remotely within an Azure storage account
