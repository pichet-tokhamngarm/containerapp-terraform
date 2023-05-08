aks_vnet_name = "aksaksdataxdevops01vnet"

sshkvsecret = "aksdataxdevops01pubkey"

clientidkvsecret = "spn-id"

spnkvsecret = "spn-secret"

vnetcidr = ["10.0.0.0/24"]

subnetcidr = ["10.0.0.0/25"]

keyvault_rg = "datax-devops-01-rg"

keyvault_name = "aksdxdevops01cluster-kv"

azure_region = "southeastasia"

resource_group = "datax-devops-01-rg"

cluster_name = "aksdxdevops01cluster"

dns_name = "aksdxdevops01cluster"

admin_username = "aksuser"

kubernetes_version = "1.25.5"

agent_pools = {
  name            = "aksdxdevops01pool"
  count           = 2
  vm_size         = "Standard_D2_v2"
  os_disk_size_gb = "30"
}
