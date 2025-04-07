# Production environment variables
# In a real scenario, use secrets to store username, password

environment                     = "prod"
location                        = "westus2"
project_name                    = "terraform-demo"
network_address_space           = "10.2.0.0/16"
subnet_prefixes                 = ["10.2.1.0/24", "10.2.2.0/24", "10.2.3.0/24"]
subnet_names                    = ["web", "app", "db"]
storage_account_tier            = "Premium"
storage_account_replication_type = "ZRS"
vm_size                         = "Standard_B2ms"
admin_username                  = "adminuser"
admin_password                  = "P@ssw0rdProd" 
owner                           = "DevOps Team"