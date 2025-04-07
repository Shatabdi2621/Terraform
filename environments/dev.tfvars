# Development environment variables
# In a real scenario, use secrets to store username, password

environment                      = "dev"
location                         = "eastus"
project_name                     = "terraform-demo"
network_address_space            = "10.0.0.0/16"
subnet_prefixes                  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
subnet_names                     = ["web", "app", "db"]
storage_account_tier             = "Standard"
storage_account_replication_type = "LRS"
vm_size                          = "Standard_B1s"
admin_username                   = "adminuser"
admin_password                   = "P@ssw0rdDev" 
owner                            = "DevOps Team"