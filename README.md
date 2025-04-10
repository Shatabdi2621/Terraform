# Azure Terraform Demo Project
This project demonstrates key Terraform concepts for Azure infrastructure management using a structured approach. It provisions a complete environment with networking, storage, and compute resources.

## **Project Structure** 
```text
.
├── README.md
├── main.tf
├── variables.tf
├── outputs.tf
├── locals.tf
├── provider.tf
├── backend.tf
├── environments
│ ├── dev.tfvars
│ ├── prod.tfvars
│ └── staging.tfvars
└── modules
  ├── networking
  ├── storage
  └── compute
```
## **Prerequisites**
- Terraform v1.0.0 or newer
- Azure CLI installed and configured
- Azure subscription

## **Getting Started**
- Clone this repository
- Authenticate with Azure: `az login`
- Initialize Terraform: `terraform init`
- Create a workspace (optional): `terraform workspace new dev`
- Plan your infrastructure: `terraform plan -var-file=environments/dev.tfvars`
- Apply the configuration: `terraform apply -var-file=environments/dev.tfvars`
- Destroy when done: `terraform destroy -var-file=environments/dev.tfvars`

## **Terraform Commands Demonstrated**
- `terraform init`: Initialize working directory
- `terraform plan`: Preview changes
- `terraform apply`: Apply changes
- `terraform destroy`: Destroy infrastructure
- `terraform import`: Import existing resources
- `terraform state list`: List resources in state
- `terraform state show`: Show resource details
- `terraform validate`: Validate configuration
- `terraform fmt`: Format configuration files

## **State Management**
This project demonstrates state management using an Azure Storage account backend. For local development, you can use the local state file, but for team environments, the Azure backend provides state locking and collaboration features.

## **Workspaces**
The project supports multiple environments through Terraform workspaces. Use:
```bash
terraform workspace new dev|staging|prod
terraform workspace select dev|staging|prod
```

## **Variable Files**
Environment-specific variables are stored in the environments directory:
- `dev.tfvars`: Development environment
- `staging.tfvars`: Staging environment
- `prod.tfvars`: Production environment

## Prerequisites
- [Terraform CLI](https://developer.hashicorp.com/terraform/downloads)
- Properly configured cloud provider credentials (e.g., AWS CLI, Azure CLI), here we are using Azure CLI. 

## Backend Configuration
The `backend.tf` file defines the remote backend for storing the Terraform state.  
Before running Terraform, **you must replace the default backend configuration** with the remote backend of your choice (e.g., S3, Azure Blob Storage, GCS, etc.).

Example for Azure Storage Account/Blob Storage:

```hcl
terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-state-rg"
    storage_account_name = "terraformstate12345"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
```

## Running Terraform in Stages
Each environment (`dev`, `staging`, `prod`) has its own variable definitions located in the `environments/` folder.
Replace `<env>` with the desired environment name.

### Initialize Terraform
```bash
terraform init
```

### Plan Terraform
```bash
terraform plan -var-file="environments/<env>.tfvars"
```

### Apply Terraform
```bash
terraform apply -var-file="environments/<env>.tfvars"
```

### Destroy Terraform
```bash
terraform destroy -var-file="environments/<env>.tfvars"
```

## Example
```bash
terraform init
terraform plan -var-file="environments/dev.tfvars"
terraform apply -var-file="environments/dev.tfvars"
```

## Notes

- Make sure your cloud credentials are properly configured before running the scripts.
- If you’re using additional modules, conditionally include them as needed in `main.tf`.
- You may also use Terraform workspaces as an alternative to `.tfvars`-based separation.