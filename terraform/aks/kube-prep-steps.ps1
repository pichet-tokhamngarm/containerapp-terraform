#### Parameters

$keyvaultname = "aksdxdevops01cluster-kv"
$location = "southeastasia"
$keyvaultrg = "datax-devops-01-rg"
$sshkeysecret = "aksdataxdevops01pubkey"
$spnclientid = "a2c8c722-6730-402c-aae2-a414f30ddd8f"
$clientidkvsecretname = "spn-id"
$spnclientsecret = "Ec78Q~HUZpouJQuJPn5HeKuE~f5UB5KvVW22Dco4"
$spnkvsecretname = "spn-secret"
$spobjectID = "a2c8c722-6730-402c-aae2-a414f30ddd8f"
$userobjectid = "a2c8c722-6730-402c-aae2-a414f30ddd8f"


#### Create Key Vault

# New-AzResourceGroup -Name $keyvaultrg -Location $location

New-AzKeyVault -Name $keyvaultname -ResourceGroupName $keyvaultrg -Location $location

Set-AzKeyVaultAccessPolicy -VaultName $keyvaultname -UserPrincipalName $userobjectid -PermissionsToSecrets get,set,delete,list

#### create an ssh key for setting up password-less login between agent nodes.

ssh-keygen  -f ~/.ssh/id_rsa_terraform


#### Add SSH Key in Azure Key vault secret

$pubkey = cat ~/.ssh/id_rsa_terraform.pub

$Secret = ConvertTo-SecureString -String $pubkey -AsPlainText -Force

Set-AzKeyVaultSecret -VaultName $keyvaultname -Name $sshkeysecret -SecretValue $Secret


#### Store service principal Client id in Azure KeyVault

$Secret = ConvertTo-SecureString -String $spnclientid -AsPlainText -Force

Set-AzKeyVaultSecret -VaultName $keyvaultname -Name $clientidkvsecretname -SecretValue $Secret


#### Store service principal Secret in Azure KeyVault

$Secret = ConvertTo-SecureString -String $spnclientsecret -AsPlainText -Force

Set-AzKeyVaultSecret -VaultName $keyvaultname -Name $spnkvsecretname -SecretValue $Secret


#### Provide Keyvault secret access to SPN using Keyvault access policy

Set-AzKeyVaultAccessPolicy -VaultName $keyvaultname -ServicePrincipalName $spobjectID -PermissionsToSecrets Get,Set
