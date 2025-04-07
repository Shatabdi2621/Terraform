# Local values for the root module

locals {
  # Use workspace name if not overridden by var.environment
  environment = var.environment != "" ? var.environment : terraform.workspace
  
  # Create a prefix for resource names
  name_prefix = "${var.project_name}-${local.environment}"
  
  # Common tags for all resources
  common_tags = {
    Environment = local.environment
    Project     = var.project_name
    Owner       = var.owner
    ManagedBy   = "Terraform"
    Workspace   = terraform.workspace
  }
  
  # Conditional settings based on environment
  vm_settings = {
    dev = {
      instance_count = 1
      vm_size        = "Standard_B1s"
    }
    staging = {
      instance_count = 2
      vm_size        = "Standard_B2s"
    }
    prod = {
      instance_count = 3
      vm_size        = "Standard_B2ms"
    }
  }
  
  # Network security group rules based on environment
  nsg_rules = local.environment == "prod" ? {
    ssh = {
      name                       = "SSH"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "10.0.0.0/8"
      destination_address_prefix = "*"
    }
  } : {
    ssh = {
      name                       = "SSH"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}