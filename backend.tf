# State backend configuration
# This is commented out initially because you need to create the storage account first
# After creating the storage account, uncomment this block and run terraform init again

/*
terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-state-rg"
    storage_account_name = "terraformstate12345"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
*/

# To demonstrate how to use a backend, here's an example of local backend with state locking
terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}

# Instructions for setting up the Azure backend:
# 1. Create a resource group:
#    az group create --name terraform-state-rg --location eastus
#
# 2. Create a storage account:
#    az storage account create --name terraformstate12345 --resource-group terraform-state-rg --location eastus --sku Standard_LRS
#
# 3. Create a container:
#    az storage container create --name tfstate --account-name terraformstate12345
#
# 4. Get the storage access key:
#    az storage account keys list --resource-group terraform-state-rg --account-name terraformstate12345
#
# 5. Set environment variables (optional):
#    export ARM_ACCESS_KEY=<storage_account_access_key>
#
# 6. Uncomment the backend block above and run:
#    terraform init