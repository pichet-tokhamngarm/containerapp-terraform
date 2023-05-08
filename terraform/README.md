# Deploy Base Infrastructure

The first part of deploying terraform, known as [base](base/) it will deploy:
- Resource Group
- Azure Container Registry (ACR)
- Log Analytics
- Application Insights 

# Deploy Container App 

Now that the test application has been built and deployed into ACR, time to deploying the [container app](containerapp/) with image built on previous stage.

These will deploy using Terraform:
- Azure Container Environment
- Azure Managed Identity
- Azure IAM to allow the Managed Identity `acrpull` permissions from the ACR previously created
- Azure Container App with Managed Identity and deploy application into Container App

# To Deploy AKS Cluster 

- Azure Kubernetes Service ([AKS](aks/))
- Execute [kube-prep-steps](kube-prep-steps.ps1) to create Azure Keyvault for AKS Cluster that will create.
- Run [AKS GitHub Workflow](../../.github/workflows/aks.yml).