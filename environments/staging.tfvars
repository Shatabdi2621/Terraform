# Staging environment variables
# In a real scenario, use secrets to store username, password

environment                     = "staging"
location                        = "eastus2"
project_name                    = "terraform-demo"
network_address_space           = "10.1.0.0/16"
subnet_prefixes                 = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
subnet_names                    = ["web", "app", "db"]
storage_account_tier            = "Standard"
storage_account_replication_type = "GRS"
vm_size                         = "Standard_B2s"
admin_username                  = "adminuser"
admin_password                  = "P@ssw0rdStage!"
owner                           = "DevOps Team"