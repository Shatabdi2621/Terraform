# Main Terraform configuration file

# Use all three modules to create a complete infrastructure
module "networking" {
  source = "./modules/networking"

  # Pass variables to the module
  resource_group_name     = azurerm_resource_group.main.name
  location                = var.location
  environment             = local.environment
  address_space           = var.network_address_space
  subnet_prefixes         = var.subnet_prefixes
  subnet_names            = var.subnet_names
  tags                    = local.common_tags
}

module "storage" {
  source = "./modules/storage"

  # Pass variables to the module
  resource_group_name     = azurerm_resource_group.main.name
  location                = var.location
  environment             = local.environment
  account_tier            = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
  tags                    = local.common_tags
}

module "compute" {
  source = "./modules/compute"

  # Pass variables to the module
  resource_group_name     = azurerm_resource_group.main.name
  location                = var.location
  environment             = local.environment
  subnet_id               = module.networking.subnet_ids[0]
  vm_size                 = var.vm_size
  admin_username          = var.admin_username
  admin_password          = var.admin_password
  tags                    = local.common_tags
  
  # Only create VMs in prod and staging
  vm_count                = local.environment == "dev" ? 1 : 2
}

# Create a resource group
resource "azurerm_resource_group" "main" {
  name     = "${local.name_prefix}-rg"
  location = var.location
  tags     = local.common_tags
}

# Demonstrates using data sources to fetch existing resources
data "azurerm_subscription" "current" {}

output "subscription_id" {
  value = data.azurerm_subscription.current.subscription_id
}