param(
    [string]$ResourceGroup = "MyResourceGroup",
    [string]$VMName = "MyVM",
    [string]$Location = "eastus",
    [string]$VMSize = "Standard_B1s",
    [string]$Image = "UbuntuLTS",   # Example: UbuntuLTS, Win2019Datacenter
    [string]$AdminUser = "azureuser",
    [string]$AdminPassword = "P@ssw0rd123!"
)

Write-Host "Creating VM '$VMName' in resource group '$ResourceGroup' with image '$Image'..."

# Ensure resource group exists
az group create --name $ResourceGroup --location $Location

# Create VM
az vm create `
  --resource-group $ResourceGroup `
  --name $VMName `
  --image $Image `
  --size $VMSize `
  --admin-username $AdminUser `
  --admin-password $AdminPassword `
  --authentication-type password `
  --output json

Write-Host "✅ VM creation initiated successfully!"
