# Storage module - main.tf

# Generate a random string for the storage account name
resource "random_string" "storage_account_suffix" {
  length  = 8
  special = false
  upper   = false
}

# Create storage account
resource "azurerm_storage_account" "storage" {
  name                     = "storage${var.environment}${random_string.storage_account_suffix.result}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  tags                     = var.tags
  
  blob_properties {
    delete_retention_policy {
      days = var.environment == "prod" ? 30 : 7
    }
  }
  
  lifecycle {
    prevent_destroy = false
  }
}

# Create blob container
resource "azurerm_storage_container" "container" {
  name                  = "data"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}

# Create file share
resource "azurerm_storage_share" "share" {
  name                 = "fileshare"
  storage_account_name = azurerm_storage_account.storage.name
  quota                = 50
}

# Create a sample file upload
resource "azurerm_storage_share_file" "example" {
  name             = "readme.txt"
  storage_share_id = azurerm_storage_share.share.id
  source           = "${path.module}/readme.txt"

  # This is just for demonstration purposes
  # In practice, you would use a real file or generate one
  provisioner "local-exec" {
    command = "echo 'This is a sample file created by Terraform' > ${path.module}/readme.txt"
  }
}