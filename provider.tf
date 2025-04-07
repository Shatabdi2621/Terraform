# Provider configuration

# Specify required providers and versions
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
  
  # Specify Terraform version constraints
  required_version = ">= 1.0.0"
}

# Configure the Azure provider
provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
    
    virtual_machine {
      delete_os_disk_on_deletion = true
    }
    
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}